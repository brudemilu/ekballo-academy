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

// Varre o payload inteiro (recursivo) coletando candidatos — robusto a qualquer
// shape do Evolution GO/whatsmeow sem precisar adivinhar nomes de campo.
function extrair(body: Record<string, unknown>) {
  const textos: string[] = [];
  const jids: string[] = [];
  let fromMe = false;
  let isGrupoFlag = false;

  const TEXT_KEYS = /^(conversation|text|body|caption|message)$/i;
  const JID_KEYS = /(jid|remote|chat|^from$|sender|participant|number)/i;

  function walk(node: unknown, depth: number) {
    if (!node || typeof node !== "object" || depth > 8) return;
    for (const [k, v] of Object.entries(node as Record<string, unknown>)) {
      if (typeof v === "string") {
        if (/@(s\.whatsapp\.net|g\.us|lid|c\.us)/i.test(v)) {
          jids.push(v);
          if (v.includes("@g.us")) isGrupoFlag = true;
        } else if (JID_KEYS.test(k) && /\d{8,}/.test(v)) {
          jids.push(v);
        }
        if (TEXT_KEYS.test(k) && v.trim()) textos.push(v.trim());
      } else if (typeof v === "boolean") {
        if (/fromme/i.test(k) && v) fromMe = true;
      } else if (v && typeof v === "object") {
        walk(v, depth + 1);
      }
    }
  }
  walk(body, 0);

  // texto = o maior candidato (mensagem real costuma ser o maior)
  const text = textos.sort((a, b) => b.length - a.length)[0] || "";
  // número = primeiro JID que não é de grupo (o remetente/chat)
  const jid = jids.find((j) => !j.includes("@g.us")) || jids[0] || "";
  const num = jid.split(/[@:]/)[0].replace(/\D/g, "");
  return { fromMe, chatNum: num, sendNum: num, text, isGrupo: isGrupoFlag };
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

  const { chatNum, sendNum, text, isGrupo } = extrair(body);
  // log temporário pra acertar o formato do Evolution GO no 1º teste
  console.log("[agenda-wpp] raw:", JSON.stringify(body).slice(0, 700));
  console.log("[agenda-wpp] extr:", JSON.stringify({ chatNum, sendNum, isGrupo, text: text.slice(0, 100) }));

  const numero = chatNum || sendNum; // pra onde responder (self-chat)

  // ignora grupo, vazio, ou de número não autorizado (confere chat e remetente)
  if (isGrupo || !text || (!permitido(chatNum) && !permitido(sendNum))) {
    return NextResponse.json({ ok: true, ignorado: true });
  }

  // exige o gatilho "agenda" no início — evita parsear toda mensagem do seu
  // WhatsApp e evita loop (a confirmação começa com ✅/🤔/⚠️, não com "agenda").
  const m = text.match(/^\s*agenda[:,\s-]+([\s\S]+)/i);
  if (!m) {
    return NextResponse.json({ ok: true, semGatilho: true });
  }
  const pedido = m[1].trim();

  try {
    const c = await parseCompromissoIA(pedido);
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
