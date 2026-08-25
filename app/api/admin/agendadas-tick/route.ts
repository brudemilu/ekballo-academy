import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { selfOrigin } from "@/lib/site-url";

// Processador das mensagens agendadas. Chamado pelo pg_cron (a cada minuto)
// via pg_net. Autenticado por AGENDADAS_CRON_SECRET (do Vault, no header).
// Para cada agendada vencida, dispara o envio normal reusando as rotas
// existentes (com x-internal-secret = INTERNAL_SECRET).

export const maxDuration = 60;

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const INTERNAL_SECRET = process.env.INTERNAL_SECRET!;
const AGENDADAS_CRON_SECRET = process.env.AGENDADAS_CRON_SECRET || "";
// Chamada do app pra ele mesmo: 127.0.0.1, não o domínio público. O literal
// antigo apontava pro ekballo-academy.vercel.app (morto desde a migração pro
// Contabo), então toda agendada vencida falhava no fetch. Sair pelo domínio
// público também seria errado: atrás do Traefik o self-fetch quebra por TLS,
// o mesmo bug que derrubou as rotas OG.
const BASE_URL = selfOrigin();

const admin = () => createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });

export async function POST(req: NextRequest) {
  const secret = req.headers.get("x-internal-secret");
  if (!secret || secret !== AGENDADAS_CRON_SECRET) {
    return NextResponse.json({ erro: "unauthorized" }, { status: 401 });
  }

  const db = admin();
  const agora = new Date().toISOString();

  // Reserva atômica das vencidas (pendente -> enviando) para não processar 2x.
  const { data: lote, error: reservaErr } = await db
    .from("mensagens_agendadas")
    .update({ status: "enviando" })
    .eq("status", "pendente")
    .lte("agendar_para", agora)
    .select("id, tipo, payload, autor_id");
  if (reservaErr) {
    return NextResponse.json({ erro: reservaErr.message }, { status: 500 });
  }
  if (!lote || lote.length === 0) {
    return NextResponse.json({ processadas: 0 });
  }

  let ok = 0;
  let falhas = 0;

  for (const item of lote) {
    const payload = (item.payload || {}) as Record<string, unknown>;
    const rota = item.tipo === "direto" ? "/api/admin/whatsapp" : "/api/admin/enviar-mensagem";
    const corpo =
      item.tipo === "direto"
        ? { acao: "enviar", ...payload }
        : { ...payload, autor_id: item.autor_id };

    try {
      const resp = await fetch(`${BASE_URL}${rota}`, {
        method: "POST",
        headers: { "x-internal-secret": INTERNAL_SECRET, "Content-Type": "application/json" },
        body: JSON.stringify(corpo),
      });
      const json = await resp.json().catch(() => ({}));
      const sucesso =
        item.tipo === "direto" ? resp.ok && json.status === "enviado" : resp.ok && !json.erro;
      await db
        .from("mensagens_agendadas")
        .update({
          status: sucesso ? "enviada" : "erro",
          resultado: json,
          erro: sucesso ? null : json.erro || `HTTP ${resp.status}`,
          processada_em: new Date().toISOString(),
        })
        .eq("id", item.id);
      sucesso ? ok++ : falhas++;
    } catch (e) {
      await db
        .from("mensagens_agendadas")
        .update({
          status: "erro",
          erro: e instanceof Error ? e.message : "erro de rede",
          processada_em: new Date().toISOString(),
        })
        .eq("id", item.id);
      falhas++;
    }
  }

  return NextResponse.json({ processadas: lote.length, ok, falhas });
}
