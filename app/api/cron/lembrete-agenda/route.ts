import { NextRequest, NextResponse } from "next/server";
import { agendaUnificadaDoDia, diaSP, formatarMensagemLembrete } from "@/lib/agenda-resumo";
import { supabaseFunctionsBase } from "@/lib/supabase/functions-url";

export const runtime = "nodejs";
export const maxDuration = 60;
export const dynamic = "force-dynamic";

// Lembrete diário da agenda no WhatsApp — roda DENTRO do app (substitui o antigo
// Google Apps Script). O Vercel Cron chama de noite (ver vercel.json: 23:00 UTC =
// 20:00 em São Paulo) e mandamos o resumo dos compromissos de AMANHÃ pros números
// configurados, via a mesma edge function de envio que o resto do site usa.
//
//   GET /api/cron/lembrete-agenda            (Vercel Cron: Authorization: Bearer CRON_SECRET)
//   GET /api/cron/lembrete-agenda?secret=... (teste manual: AGENDA_SYNC_SECRET)
//   &dia=hoje|amanha   (default amanha)
//   &dry=1             (não envia; só devolve a mensagem montada — pra conferir)

// Destinatários do lembrete. Override por env LEMBRETE_AGENDA_NUMEROS
// (separados por vírgula/espaço); senão usa os padrões (Bruno + Débora).
function destinatarios(): string[] {
  const raw = process.env.LEMBRETE_AGENDA_NUMEROS;
  const lista = (raw ? raw.split(/[\s,]+/) : ["5531994108839", "5531994521517"])
    .map((n) => n.replace(/\D/g, ""))
    .filter(Boolean);
  return [...new Set(lista)];
}

function autorizado(req: NextRequest): boolean {
  const cron = process.env.CRON_SECRET;
  const auth = req.headers.get("authorization");
  if (cron && auth === `Bearer ${cron}`) return true;
  // teste manual com o segredo da agenda
  const agenda = (process.env.AGENDA_SYNC_SECRET || "").trim();
  const q = (req.nextUrl.searchParams.get("secret") || "").trim();
  return agenda !== "" && q === agenda;
}

// Envia pela edge function `enviar-whatsapp-evolution` — o mesmo caminho do
// webhook da agenda, do recuperar-senha e do painel. Antes esta rota falava
// direto com a Evolution GO (`/send/text` + token de instância); ao migrar o
// gateway pro Evolution v2 do box, o endpoint virou 404 e o lembrete diário
// parou calado. Concentrando o envio na edge function, o conhecimento do
// gateway (endpoint, instância, apikey) fica num lugar só e uma próxima
// migração não precisa ser repetida aqui. Timeout próprio por envio pra nunca
// pendurar a função.
async function enviarWhatsApp(numero: string, mensagem: string): Promise<boolean> {
  const base = supabaseFunctionsBase();
  const secret = process.env.INTERNAL_SECRET;
  if (!base || !secret) {
    console.error("[lembrete] envio não configurado (falta SUPABASE_FUNCTIONS_URL/INTERNAL_SECRET)");
    return false;
  }
  const ctrl = new AbortController();
  const t = setTimeout(() => ctrl.abort(), 20_000);
  try {
    const res = await fetch(`${base}/enviar-whatsapp-evolution`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-internal-secret": secret },
      body: JSON.stringify({ destinatario: numero, mensagem }),
      signal: ctrl.signal,
    });
    if (!res.ok) {
      console.error("[lembrete] envio falhou", numero, res.status, await res.text().catch(() => ""));
      return false;
    }
    return true;
  } catch (e) {
    console.error("[lembrete] erro no envio", numero, e instanceof Error ? e.message : e);
    return false;
  } finally {
    clearTimeout(t);
  }
}

export async function GET(req: NextRequest) {
  if (!autorizado(req)) {
    return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  }

  const sp = req.nextUrl.searchParams;
  const rotulo = (sp.get("dia") || "amanha").toLowerCase() === "hoje" ? "hoje" : "amanhã";
  const dataAlvo = diaSP(rotulo === "hoje" ? 0 : 1);
  const dry = sp.get("dry") === "1";

  const { eventos } = await agendaUnificadaDoDia(dataAlvo);
  const mensagem = formatarMensagemLembrete(dataAlvo, eventos, rotulo);

  if (dry) {
    return NextResponse.json({ ok: true, dry: true, data: dataAlvo, total: eventos.length, mensagem });
  }

  const numeros = destinatarios();
  const envios = await Promise.all(
    numeros.map(async (n) => ({ numero: n, ok: await enviarWhatsApp(n, mensagem) })),
  );
  const enviados = envios.filter((e) => e.ok).length;

  return NextResponse.json({ ok: true, data: dataAlvo, total: eventos.length, enviados, envios });
}
