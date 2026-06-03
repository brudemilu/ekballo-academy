// Edge Function: enviar-whatsapp-midia
// Dispara mensagem de MÍDIA (imagem, vídeo, áudio, documento) via Evolution GO,
// tanto pra contato privado quanto pra grupo.
// https://github.com/EvolutionAPI/evolution-go  (POST /send/media)
//
// Body (POST):
//   {
//     destinatario: "5511999998888" | "120363...@g.us",
//     url: "https://.../arquivo.jpg",   // URL pública da mídia
//     tipo: "image" | "video" | "audio" | "document",
//     legenda?: "texto opcional",       // não se aplica a audio
//     filename?: "documento.pdf"        // recomendado pra document
//   }
//
// destinatario: número de telefone (prepende "55" se BR) OU JID com "@" (grupo/usuário).
//
// Autenticada via header `x-internal-secret` (server-to-server).
//
// Env vars (Supabase Edge Function secrets):
//   EVOLUTION_BASE_URL, EVOLUTION_INSTANCE_TOKEN, INTERNAL_SECRET

import {
  checarSegredo,
  evolutionFetch,
  extrairMessageId,
  jsonResponse,
  resolverDestino,
} from "../_shared/evolution.ts";

type TipoMidia = "image" | "video" | "audio" | "document";
const TIPOS_VALIDOS: TipoMidia[] = ["image", "video", "audio", "document"];

type Payload = {
  destinatario: string;
  url: string;
  tipo: TipoMidia;
  legenda?: string | null;
  filename?: string | null;
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

  const url = (payload.url || "").trim();
  if (!url || !/^https?:\/\//i.test(url)) {
    return jsonResponse({ erro: "url da mídia inválida (precisa ser http/https pública)" }, 400);
  }

  const tipo = payload.tipo;
  if (!TIPOS_VALIDOS.includes(tipo)) {
    return jsonResponse({ erro: `tipo inválido; use um de ${TIPOS_VALIDOS.join(", ")}` }, 400);
  }

  const corpo: Record<string, unknown> = {
    number: destino.number,
    url,
    type: tipo,
    formatJid: destino.formatJid,
  };
  // Áudio (voz/ptt) não leva legenda; os demais aceitam.
  if (payload.legenda && tipo !== "audio") corpo.caption = payload.legenda.trim();
  if (payload.filename) corpo.filename = payload.filename.trim();

  const { ok, status, body } = await evolutionFetch("/send/media", {
    method: "POST",
    body: JSON.stringify(corpo),
  });

  if (!ok) {
    console.error("Evolution media error", status, body);
    return jsonResponse({ erro: "falha no envio", evolution_status: status, evolution_body: body }, 502);
  }

  return jsonResponse({
    status: "enviado",
    destinatario: destino.number,
    tipo,
    message_id: extrairMessageId(body),
  });
});
