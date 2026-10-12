// Edge Function: enviar-whatsapp-status
// Publica um STATUS do WhatsApp (o "story" do WhatsApp) pela Evolution API v2,
// para todos os contatos da instância. Usada pela rotina que repete no Status
// o que sai no Instagram (issue #258).
//
// Body (POST):
//   { tipo: "text",  conteudo: "texto com link" }
//   { tipo: "image", url: "https://.../capa.jpg", legenda?: "texto com link" }
//   { tipo: "video", url: "https://.../story.mp4", legenda?: "…" }
//
// Autenticada via header `x-internal-secret` (server-to-server).
// Env vars: as mesmas das outras funções de WhatsApp (ver ../_shared/evolution.ts).

import {
  checarSegredo,
  evolutionFetch,
  extrairMessageId,
  jsonResponse,
  rota,
} from "../_shared/evolution.ts";

type Tipo = "text" | "image" | "video";

type Payload = {
  tipo: Tipo;
  conteudo?: string | null;
  url?: string | null;
  legenda?: string | null;
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

  const tipo = payload.tipo;
  if (tipo !== "text" && tipo !== "image" && tipo !== "video") {
    return jsonResponse({ erro: "tipo inválido; use text, image ou video" }, 400);
  }

  // Na v2 o campo `content` leva o texto (status de texto) ou a URL da mídia.
  const corpo: Record<string, unknown> = { type: tipo, allContacts: true };
  if (tipo === "text") {
    const texto = (payload.conteudo || "").trim();
    if (!texto) return jsonResponse({ erro: "conteudo vazio" }, 400);
    corpo.content = texto;
    corpo.backgroundColor = "#0B0907";
    corpo.font = 1;
  } else {
    const url = (payload.url || "").trim();
    if (!/^https?:\/\//i.test(url)) {
      return jsonResponse({ erro: "url da mídia inválida (precisa ser http/https pública)" }, 400);
    }
    corpo.content = url;
    if (payload.legenda) corpo.caption = payload.legenda.trim();
  }

  const { ok, status, body } = await evolutionFetch(rota("/message/sendStatus"), {
    method: "POST",
    body: JSON.stringify(corpo),
  });

  if (!ok) {
    console.error("Evolution status error", status, body);
    return jsonResponse({ erro: "falha no envio", evolution_status: status, evolution_body: body }, 502);
  }

  return jsonResponse({ status: "enviado", tipo, message_id: extrairMessageId(body) });
});
