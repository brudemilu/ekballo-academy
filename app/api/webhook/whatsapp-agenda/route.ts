import { NextRequest, NextResponse } from "next/server";
import { addCompromisso } from "@/lib/db";
import { parseCompromissoIA } from "@/lib/agenda-parse";

export const runtime = "nodejs";
export const maxDuration = 30;

// Webhook do Evolution: "manda no zap → cai na agenda".
// O Evolution é configurado pra POSTar o evento messages.upsert aqui.
// Protegido por ?secret= (AGENDA_WHATSAPP_SECRET). Só processa mensagens de
// números na allowlist (AGENDA_WHATSAPP_DONOS) — senão qualquer um criaria
// compromisso. Responde a confirmação via a edge function de envio.

function extrair(body: Record<string, unknown>) {
  const data = (body.data ?? body) as Record<string, unknown>;
  const key = (data.key ?? {}) as Record<string, unknown>;
  const fromMe = key.fromMe === true;
  const remoteJid = String(key.remoteJid || data.remoteJid || "");
  const msg = (data.message ?? {}) as Record<string, unknown>;
  const ext = (msg.extendedTextMessage ?? {}) as Record<string, unknown>;
  const text = String(msg.conversation || ext.text || data.text || data.body || "").trim();
  const numero = remoteJid.split("@")[0].replace(/\D/g, "");
  return { fromMe, numero, text, isGrupo: remoteJid.includes("@g.us") };
}

function permitido(numero: string): boolean {
  const lista = (process.env.AGENDA_WHATSAPP_DONOS || "")
    .split(/[\s,]+/)
    .map((n) => n.replace(/\D/g, ""))
    .filter(Boolean);
  if (!lista.length) return false;
  // casa por sufixo (tolera 55 / 9º dígito a mais ou a menos)
  return lista.some((n) => {
    const a = numero.slice(-8);
    const b = n.slice(-8);
    return a && a === b;
  });
}

async function responder(numero: string, mensagem: string) {
  const base = (process.env.NEXT_PUBLIC_SUPABASE_URL || "").replace(".supabase.co", ".functions.supabase.co");
  const secret = process.env.INTERNAL_SECRET;
  if (!base || !secret) return;
  try {
    await fetch(`${base}/enviar-whatsapp-evolution`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-internal-secret": secret },
      body: JSON.stringify({ destinatario: numero, mensagem }),
    });
  } catch {
    /* silencioso: a confirmação é best-effort */
  }
}

function formatarBR(iso: string, diaTodo: boolean): string {
  try {
    const d = new Date(iso);
    return new Intl.DateTimeFormat("pt-BR", {
      timeZone: "America/Sao_Paulo",
      weekday: "short",
      day: "2-digit",
      month: "2-digit",
      ...(diaTodo ? {} : { hour: "2-digit", minute: "2-digit" }),
    }).format(d);
  } catch {
    return iso;
  }
}

export async function POST(req: NextRequest) {
  // auth do webhook
  if (req.nextUrl.searchParams.get("secret") !== process.env.AGENDA_WHATSAPP_SECRET) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ ok: true }); // ignora payloads estranhos
  }

  const { fromMe, numero, text, isGrupo } = extrair(body);

  // só mensagens recebidas (não as que o próprio bot enviou), de número
  // autorizado, fora de grupo, e com texto.
  if (fromMe || isGrupo || !text || !permitido(numero)) {
    return NextResponse.json({ ok: true, ignorado: true });
  }

  try {
    const c = await parseCompromissoIA(text);
    if (!c.entendi || !c.inicio) {
      await responder(
        numero,
        "🤔 Não consegui identificar um compromisso. Tente algo como:\n\"Reunião com a equipe quinta às 15h\" ou \"Culto domingo 19h\".",
      );
      return NextResponse.json({ ok: true, entendi: false });
    }
    await addCompromisso({
      titulo: c.titulo || "Compromisso",
      inicio: c.inicio,
      fim: c.fim,
      dia_todo: c.dia_todo,
      local: c.local,
      nota: "Criado pelo WhatsApp",
      criado_por: null,
    });
    const quando = formatarBR(c.inicio, c.dia_todo);
    await responder(
      numero,
      `✅ Marquei na agenda:\n*${c.titulo}*\n🗓️ ${quando}${c.local ? `\n📍 ${c.local}` : ""}`,
    );
    return NextResponse.json({ ok: true, criado: true });
  } catch (e) {
    await responder(numero, "⚠️ Tive um problema ao marcar. Tente de novo daqui a pouco.");
    return NextResponse.json({ error: e instanceof Error ? e.message : "erro" }, { status: 500 });
  }
}
