// Edge Function: processar-whatsapp-fila
// Processa UM item pendente da fila de WhatsApp por execução. Chamada pelo
// pg_cron (a cada minuto) → garante o ritmo de ~1 envio/min, que protege o
// número contra ban por flood.
//
// Fluxo:
//   1) reserva o próximo pendente (rpc reservar_proximo_fila → marca 'enviando')
//   2) envia via Evolution GO (/send/text)
//   3) grava status final (enviado/erro) na fila e em mensagens_destinatarios
//
// Auth: header `x-internal-secret` == FILA_CRON_SECRET (segredo dedicado da fila,
// também guardado no Vault para o pg_cron usar). Server-to-server, sem JWT.
//
// Env vars (Supabase Edge Function secrets):
//   FILA_CRON_SECRET, EVOLUTION_BASE_URL, EVOLUTION_INSTANCE_TOKEN,
//   SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import {
  evolutionFetch,
  extrairMessageId,
  jsonResponse,
  resolverDestino,
} from "../_shared/evolution.ts";

const FILA_CRON_SECRET = Deno.env.get("FILA_CRON_SECRET") || "";
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

Deno.serve(async (req) => {
  if (req.method !== "POST") return new Response("Method not allowed", { status: 405 });

  const secret = req.headers.get("x-internal-secret");
  if (!secret || secret !== FILA_CRON_SECRET) {
    return jsonResponse({ erro: "unauthorized" }, 401);
  }

  const db = createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });

  // 1) Reserva o próximo item (atômico, FIFO).
  const { data: item, error: reservaErr } = await db.rpc("reservar_proximo_fila");
  if (reservaErr) {
    console.error("erro ao reservar item da fila", reservaErr);
    return jsonResponse({ erro: "falha na reserva", detalhe: reservaErr.message }, 500);
  }
  if (!item || !item.id) {
    return jsonResponse({ processados: 0, mensagem: "fila vazia" });
  }

  // 2) Envia via Evolution.
  const destino = resolverDestino(item.telefone || "");
  let ok = false;
  let erro: string | null = null;
  let messageId: string | undefined;

  if (!destino) {
    erro = "telefone inválido";
  } else {
    const resp = await evolutionFetch("/send/text", {
      method: "POST",
      body: JSON.stringify({
        number: destino.number,
        text: item.corpo,
        formatJid: destino.formatJid,
      }),
    });
    ok = resp.ok;
    if (ok) {
      messageId = extrairMessageId(resp.body);
    } else {
      erro = `evolution HTTP ${resp.status}: ${JSON.stringify(resp.body).slice(0, 300)}`;
      console.error("Evolution error na fila", resp.status, resp.body);
    }
  }

  // 3) Grava status final na fila.
  await db
    .from("whatsapp_fila")
    .update({
      status: ok ? "enviado" : "erro",
      erro: erro,
      message_id: messageId ?? null,
      enviado_em: ok ? new Date().toISOString() : null,
    })
    .eq("id", item.id);

  // ...e reflete no histórico de mensagens_destinatarios (se veio de um broadcast).
  if (item.mensagem_id && item.aluno_id) {
    await db
      .from("mensagens_destinatarios")
      .update({
        whatsapp_status: ok ? "enviado" : "erro",
        ...(ok ? { whatsapp_enviado_em: new Date().toISOString() } : {}),
      })
      .eq("mensagem_id", item.mensagem_id)
      .eq("aluno_id", item.aluno_id);

    // Atualiza contadores agregados da mensagem.
    await db.rpc("recontar_mensagem", { p_mensagem_id: item.mensagem_id }).then(
      () => {},
      () => {} // a função pode não existir em deploys antigos; ignora silenciosamente
    );
  }

  return jsonResponse({
    processados: 1,
    id: item.id,
    status: ok ? "enviado" : "erro",
    erro,
  });
});
