// Edge Function: enviar-whatsapp-evolution
// Dispara mensagem de TEXTO via Evolution GO (whatsmeow).
// https://github.com/EvolutionAPI/evolution-go
//
// Substitui a antiga `enviar-whatsapp` (Z-API). Mantém o mesmo contrato de
// entrada/saída pra que /api/admin/enviar-mensagem não precise saber qual
// provider está por trás.
//
// Body (POST):
//   { destinatario: "5511999998888", mensagem: "Olá, ..." }
//   { destinatario: "120363012345678901@g.us", mensagem: "Olá grupo!" }  // grupo
//
// destinatario:
//   - número de telefone (com/sem country code; prepende "55" se BR), OU
//   - um JID completo contendo "@" (grupo "...@g.us" ou usuário "...@s.whatsapp.net").
//
// Autenticada via header `x-internal-secret` (server-to-server).
//
// --- Modelo de auth da Evolution GO (descoberto na prática) ---
// A Global API Key só serve pra gerenciar instâncias (create/list/delete).
// Pra OPERAR uma instância (enviar, conectar, status) o header `apikey` recebe
// o TOKEN DA INSTÂNCIA. É esse token que configuramos em EVOLUTION_INSTANCE_TOKEN.
//
// Env vars (Supabase Edge Function secrets):
//   EVOLUTION_BASE_URL        ex: https://evogo.7iegroup.com.br
//   EVOLUTION_INSTANCE_TOKEN  token da instância (vai no header `apikey`)
//   INTERNAL_SECRET           segredo compartilhado server-to-server

import {
  checarSegredo,
  evolutionFetch,
  extrairMessageId,
  jsonResponse,
  resolverDestino,
} from "../_shared/evolution.ts";

type Payload = {
  destinatario: string;
  mensagem: string;
};

Deno.serve(async (req) => {
  if (req.method !== "POST") return new Response("Method not allowed", { status: 405 });

  const erroAuth = checarSegredo(req);
  if (erroAuth) return erroAuth;

  let payload: Payload;
  try {
    payload = await req.json();
  } catch {
    return jsonResponse({ erro: "body inválido" }, 400);
  }

  const destino = resolverDestino(payload.destinatario || "");
  if (!destino) {
    return jsonResponse({ erro: "destinatário inválido", destinatario: payload.destinatario }, 400);
  }

  const mensagem = (payload.mensagem || "").trim();
  if (!mensagem) return jsonResponse({ erro: "mensagem obrigatória" }, 400);

  const { ok, status, body } = await evolutionFetch("/send/text", {
    method: "POST",
    body: JSON.stringify({
      number: destino.number,
      text: mensagem,
      formatJid: destino.formatJid,
    }),
  });

  if (!ok) {
    console.error("Evolution error", status, body);
    return jsonResponse({ erro: "falha no envio", evolution_status: status, evolution_body: body }, 502);
  }

  return jsonResponse({
    status: "enviado",
    destinatario: destino.number,
    message_id: extrairMessageId(body),
  });
});
