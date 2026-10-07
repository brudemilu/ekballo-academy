import { type NextRequest, NextResponse } from "next/server";
import { transcreverAudio } from "@/lib/agenda-audio";
import { lerImagem } from "@/lib/agenda-imagem";
import { parseCompromissoIA } from "@/lib/agenda-parse";
import { addCompromisso, getPendenteWhatsApp } from "@/lib/db";
import { pareceAjuste } from "@/lib/post-texto-pronto";
import { supabaseFunctionsBase } from "@/lib/supabase/functions-url";
import { chatEhDoDono } from "@/lib/whatsapp-agenda-auth";
import {
  type ComandoInstagram,
  ehDoRobo,
  interpretarComando,
  interpretarFormato,
} from "@/lib/whatsapp-instagram";
import {
  executarComandoInstagram,
  rascunhoNaTela,
} from "@/lib/whatsapp-instagram-executar";

export const runtime = "nodejs";
export const maxDuration = 60;

// Webhook do Evolution: "manda no zap → cai na agenda".
// O Evolution é configurado pra POSTar o evento messages.upsert aqui.
// Protegido por ?secret= (AGENDA_WHATSAPP_SECRET). Só processa mensagens de
// chats na allowlist (AGENDA_WHATSAPP_DONOS) — senão uma mensagem enviada pelo
// dono para outra pessoa poderia criar compromisso. Responde a confirmação via
// a edge function de envio.

function obj(v: unknown): Record<string, unknown> {
  return v && typeof v === "object" ? (v as Record<string, unknown>) : {};
}
function str(v: unknown): string {
  return typeof v === "string" ? v : "";
}

// Aceita os dois formatos, porque o gateway mudou em ago/2026:
//   Evolution GO  — body.data.Info {Chat,Sender,IsFromMe,IsGroup}
//                   + body.data.Message {conversation|...|audioMessage}
//   Evolution v2  — body.data.key {remoteJid,fromMe,participant}
//                   + body.data.message {conversation|...|audioMessage}
// O que mudou de lugar de verdade foi o identificador do chat: na v2 ele vive
// dentro de `key`, não solto em `data`.
//
// Metadados e conteúdo são extraídos em etapas separadas. Assim, uma conversa
// que não seja o chat do próprio dono é descartada antes de o app sequer ler o
// texto, a legenda ou a mídia recebida no payload.
function extrairMetadados(body: Record<string, unknown>) {
  const data = obj(body.data ?? body);
  const info = obj(data.Info);
  const key = obj(data.key);

  const fromMe = info.IsFromMe === true || key.fromMe === true;
  const chat = str(info.Chat || key.remoteJid || data.remoteJid);
  // Nas versões atuais, `remoteJid` pode ser um identificador privado `@lid`.
  // Quando existe, `remoteJidAlt` traz o JID telefônico do MESMO chat. Nunca
  // usamos body.sender/data.owner: eles identificam a instância e seriam iguais
  // também nas conversas com terceiros.
  const chatAlternativo = str(key.remoteJidAlt || data.remoteJidAlt);
  const isGrupo = info.IsGroup === true || chat.includes("@g.us");

  return { fromMe, isGrupo, chats: [chat, chatAlternativo].filter(Boolean) };
}

function extrairConteudo(body: Record<string, unknown>) {
  const data = obj(body.data ?? body);
  const message = obj(data.Message ?? data.message);

  const ext = obj(message.extendedTextMessage);
  const text = str(message.conversation || ext.text || data.text || data.body).trim();

  const audioMessage = obj(message.audioMessage ?? message.AudioMessage);
  const hasAudio = Object.keys(audioMessage).length > 0;

  const imageMessage = obj(message.imageMessage ?? message.ImageMessage);
  const hasImagem = Object.keys(imageMessage).length > 0;
  // legenda da foto: é onde costuma vir o que a imagem não diz ("sexta que vem")
  const legenda = str(imageMessage.caption ?? imageMessage.Caption).trim();

  // o gateway já manda a mídia decodificada em base64 no próprio payload
  // (webhookBase64); o campo é o mesmo para áudio e imagem
  const midiaB64 = str(message.base64 ?? message.Base64);

  return { text, hasAudio, hasImagem, legenda, midiaB64 };
}

function entradasDono(): string[] {
  return (process.env.AGENDA_WHATSAPP_DONOS || "")
    .split(/[\s,]+/)
    .map((v) => v.trim().toLowerCase())
    .filter(Boolean);
}

async function responder(numero: string, mensagem: string) {
  const base = supabaseFunctionsBase();
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

  const { fromMe, isGrupo, chats } = extrairMetadados(body);
  const donos = entradasDono();

  // Responde sempre no TELEFONE do dono (1º número da allowlist).
  const donoNum = (donos.find((dono) => !dono.includes("@")) || "").replace(/\D/g, "");
  const numero = donoNum;

  // O filtro é deliberadamente anterior à leitura de texto/áudio/imagem. `fromMe`
  // sozinho não basta: ele também é true quando o dono escreve para terceiros.
  if (isGrupo || !fromMe || !chats.some((chat) => chatEhDoDono(chat, donos))) {
    return NextResponse.json({ ok: true, ignorado: true });
  }

  const { text, hasAudio, hasImagem, legenda, midiaB64 } = extrairConteudo(body);

  // A partir daqui já sabemos que a mensagem está no chat "Você".

  // Mensagem do próprio robô (resposta ou prévia do Instagram): sai pela conta
  // do dono para o chat dele e volta por aqui. Ignorar é o que impede o robô
  // de responder a si mesmo — ou de tentar ler a própria prévia como convite.
  if (ehDoRobo(text) || ehDoRobo(legenda)) {
    return NextResponse.json({ ok: true, ignorado: "robo" });
  }

  // Áudio: transcreve UMA vez, aqui, porque a fala pode ser um comando do
  // Instagram ("post sobre…") ou um compromisso da agenda — só dá para saber
  // depois de ouvir.
  let falado = "";
  let falhaNoAudio = false;
  if (!hasImagem && hasAudio && midiaB64 && !text) {
    try {
      falado = await transcreverAudio(midiaB64);
    } catch (e) {
      falhaNoAudio = true;
      console.log("[audio] transcrever erro:", e instanceof Error ? e.message : e);
    }
    console.log("[audio] transcrição:", falado.slice(0, 120));
  }

  // Instagram pelo WhatsApp: "post…", "publicar", "refazer", "cancelar…". Os
  // gatilhos não se confundem com os da agenda (ver lib/whatsapp-instagram.ts).
  // O trabalho segue depois da resposta: montar um carrossel leva ~20 s, e o
  // gateway reenviaria a mensagem se ficasse esperando.
  // "1", "única", "carrossel": só é resposta se houver uma ideia esperando o
  // formato — quem confere isso é o executor, que ignora a mensagem se não houver.
  const dito = text || falado;
  const formato = hasImagem ? null : interpretarFormato(dito);
  let comando: ComandoInstagram | null = hasImagem
    ? null
    : formato
      ? { tipo: "formato", formato }
      : interpretarComando(dito, !text);
  // "corrige…", "troca a foto", "destaca tal palavra": só é ajuste do post se
  // houver um rascunho recém-mostrado. Sem isso, segue para a agenda como antes.
  if (!comando && !hasImagem && pareceAjuste(dito)) {
    const pendente = await getPendenteWhatsApp().catch(() => null);
    if (rascunhoNaTela(pendente, new Date()))
      comando = { tipo: "ajustar", pedido: dito };
  }
  if (comando) {
    void executarComandoInstagram(comando, numero);
    return NextResponse.json({ ok: true, instagram: comando.tipo });
  }

  let pedido = "";
  const m = text.match(/^\s*(?:agenda|agendar|agende)\b[:,\s-]+([\s\S]+)/i);
  // A imagem é testada ANTES do texto de propósito: quando a foto tem legenda,
  // a legenda sozinha ("agenda esse convite") não diz o que agendar — o que
  // importa está na imagem. No chat "Você", toda imagem pode ser interpretada.
  if (hasImagem) {
    if (!midiaB64) {
      await responder(
        numero,
        "🖼️ Recebi a imagem, mas ela veio sem conteúdo. Tenta mandar de novo?",
      );
      return NextResponse.json({ ok: true, imagem: "sem_base64" });
    }
    let daImagem = "";
    try {
      daImagem = await lerImagem(midiaB64);
    } catch (e) {
      console.log("[imagem] ler erro:", e instanceof Error ? e.message : e);
    }
    console.log("[imagem] texto lido:", daImagem.slice(0, 160));
    if (!daImagem) {
      await responder(
        numero,
        "🖼️ Recebi a imagem, mas não consegui ler o que está escrito nela. Manda uma foto mais nítida, ou escreve o compromisso?",
      );
      return NextResponse.json({ ok: true, imagem: "sem_texto" });
    }
    // a legenda completa o que o convite não traz ("sexta que vem", "às 20h")
    const obs = legenda.replace(/^\s*(?:agenda|agendar|agende)\b[:,\s-]*/i, "").trim();
    pedido = obs ? `${daImagem}\n\nObservação de quem enviou: ${obs}` : daImagem;
  } else if (m) {
    pedido = m[1].trim();
  } else if (hasAudio) {
    // áudio pra você mesmo: o Evolution já manda o base64; transcreve (a IA filtra)
    if (!midiaB64) {
      await responder(
        numero,
        "🎙️ Recebi seu áudio, mas veio sem o conteúdo. Tenta de novo?",
      );
      return NextResponse.json({ ok: true, audio: "sem_base64" });
    }
    pedido = falado;
    if (!pedido || falhaNoAudio) {
      await responder(
        numero,
        "🎙️ Não consegui entender o áudio. Pode falar de novo, devagar?",
      );
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
        '🤔 Não consegui identificar um compromisso. Tente algo como:\n"Reunião com a equipe quinta às 15h" ou "Culto domingo 19h".',
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
      `✅ Recebi. Vou adicionar ao seu Google Agenda na próxima sincronização:\n*${c.titulo}*\n🗓️ ${quando}${c.local ? `\n📍 ${c.local}` : ""}`,
    );
    return NextResponse.json({ ok: true, criado: true });
  } catch (e) {
    await responder(
      numero,
      "⚠️ Tive um problema ao marcar. Tente de novo daqui a pouco.",
    );
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "erro" },
      { status: 500 },
    );
  }
}
