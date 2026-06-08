import { NextRequest, NextResponse } from "next/server";
import { addCompromisso } from "@/lib/db";
import { parseCompromissoIA } from "@/lib/agenda-parse";
import { baixarAudioBase64, transcreverAudio } from "@/lib/agenda-audio";

export const runtime = "nodejs";
export const maxDuration = 60;

// Webhook do Evolution: "manda no zap → cai na agenda".
// O Evolution é configurado pra POSTar o evento messages.upsert aqui.
// Protegido por ?secret= (AGENDA_WHATSAPP_SECRET). Só processa mensagens de
// números na allowlist (AGENDA_WHATSAPP_DONOS) — senão qualquer um criaria
// compromisso. Responde a confirmação via a edge function de envio.

function obj(v: unknown): Record<string, unknown> {
  return v && typeof v === "object" ? (v as Record<string, unknown>) : {};
}
function str(v: unknown): string {
  return typeof v === "string" ? v : "";
}

// Shape do Evolution GO: body.data.Info {Chat,Sender,IsFromMe,IsGroup} +
// body.data.Message {conversation|extendedTextMessage.text|audioMessage}.
function extrair(body: Record<string, unknown>) {
  const data = obj(body.data ?? body);
  const info = obj(data.Info);
  const message = obj(data.Message ?? data.message);

  const fromMe = info.IsFromMe === true || obj(data.key).fromMe === true;
  const chat = str(info.Chat || data.remoteJid);
  const sender = str(info.Sender || chat);
  const isGrupo = info.IsGroup === true || chat.includes("@g.us");
  // self-chat = mensagem pra você mesmo (remetente == conversa)
  const selfChat = !!chat && chat === sender;

  const ext = obj(message.extendedTextMessage);
  const text = str(message.conversation || ext.text || data.text || data.body).trim();

  const audioMessage = obj(message.audioMessage ?? message.AudioMessage);
  const hasAudio = Object.keys(audioMessage).length > 0;

  return { fromMe, isGrupo, selfChat, text, hasAudio, message };
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

  const { fromMe, isGrupo, selfChat, text, hasAudio, message } = extrair(body);

  // Responde sempre no TELEFONE do dono (1º da allowlist) — o chat vem como
  // @lid (privacidade do WhatsApp), não dá pra responder nele de forma confiável.
  const donoNum = (process.env.AGENDA_WHATSAPP_DONOS || "").split(/[\s,]+/)[0].replace(/\D/g, "");
  const numero = donoNum;

  // Autoriza por fromMe (a instância é o número do dono). Ignora grupos.
  if (isGrupo || !fromMe) {
    return NextResponse.json({ ok: true, ignorado: true });
  }

  // Define o "pedido": TEXTO começando com "agenda", OU ÁUDIO na conversa "Você".
  let pedido = "";
  const m = text.match(/^\s*agenda[:,\s-]+([\s\S]+)/i);
  if (m) {
    pedido = m[1].trim();
  } else if (hasAudio && selfChat) {
    // áudio mandado pra você mesmo: baixa, transcreve (a IA filtra se é compromisso)
    const b64 = await baixarAudioBase64(message);
    if (!b64) {
      await responder(numero, "🎙️ Recebi seu áudio, mas não consegui baixá-lo. Tenta de novo?");
      return NextResponse.json({ ok: true, audio: "download_fail" });
    }
    try {
      pedido = await transcreverAudio(b64);
    } catch (e) {
      console.log("[audio] transcrever erro:", e instanceof Error ? e.message : e);
    }
    console.log("[audio] transcrição:", pedido.slice(0, 120));
    if (!pedido) {
      await responder(numero, "🎙️ Não consegui entender o áudio. Pode falar de novo, devagar?");
      return NextResponse.json({ ok: true, audio: "transcribe_fail" });
    }
  } else {
    return NextResponse.json({ ok: true, semGatilho: true });
  }

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
