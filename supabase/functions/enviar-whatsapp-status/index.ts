// Edge Function: enviar-whatsapp-status
// Publica um STATUS do WhatsApp (o "story" do WhatsApp) pela Evolution API v2.
// Usada pela rotina que repete no Status o que sai no Instagram (issue #258).
//
// PARA QUEM VAI. A primeira versão usava `allContacts`, e o Status nunca
// apareceu: para a Evolution, "contato" é todo mundo que ela já viu — inclusive
// participantes de grupos. Eram 5.500 destinatários, e a mensagem ficou presa
// em PENDING. Agora o público é quem tem CONVERSA PESSOAL com o pastor (algumas
// centenas), mais o próprio número dele — sem ele, o Status não aparece nem no
// celular de quem postou.
//
// Body (POST):
//   { tipo: "text",  conteudo: "texto com link" }
//   { tipo: "image", url: "https://.../capa.jpg", legenda?: "texto com link" }
//   { tipo: "video", url: "https://.../story.mp4", legenda?: "…" }
//   Em qualquer um, opcional:
//     destinatarios: ["eu"]            → só o próprio número (teste)
//     destinatarios: ["5531999998888"] → lista explícita
//
// Autenticada via header `x-internal-secret` (server-to-server).
// Env vars: as mesmas das outras funções de WhatsApp (ver ../_shared/evolution.ts).

import {
  checarSegredo,
  EVOLUTION_INSTANCE,
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
  destinatarios?: string[] | null;
};

const soDigitos = (v: unknown) => (typeof v === "string" ? v.replace(/\D+/g, "") : "");
const jid = (numero: string) => `${numero}@s.whatsapp.net`;

/** O número da própria conta conectada. */
async function numeroDoDono(): Promise<string> {
  const { body } = await evolutionFetch(
    `/instance/fetchInstances?instanceName=${encodeURIComponent(EVOLUTION_INSTANCE)}`,
  );
  const lista = Array.isArray(body) ? body : [body];
  for (const item of lista) {
    const i = (item || {}) as Record<string, unknown>;
    const interno = (i.instance || {}) as Record<string, unknown>;
    const dono = soDigitos(String(i.ownerJid ?? interno.owner ?? "").split("@")[0].split(":")[0]);
    if (dono) return dono;
  }
  return "";
}

/** Quem tem conversa pessoal com a conta (sem grupos, sem ids internos). */
async function conversasPessoais(): Promise<string[]> {
  const { ok, body } = await evolutionFetch(rota("/chat/findChats"), {
    method: "POST",
    body: JSON.stringify({}),
  });
  if (!ok || !Array.isArray(body)) return [];
  const numeros = new Set<string>();
  for (const chat of body) {
    const r = String((chat as Record<string, unknown>)?.remoteJid ?? "");
    if (r.endsWith("@s.whatsapp.net")) numeros.add(soDigitos(r.split("@")[0]));
  }
  return [...numeros].filter(Boolean);
}

/** A lista de quem recebe o Status. Sempre inclui o próprio número. */
async function publico(pedido: string[] | null | undefined): Promise<string[]> {
  const dono = await numeroDoDono();
  const base =
    pedido && pedido.length
      ? pedido.map((d) => (d === "eu" ? dono : d.includes("@") ? d : soDigitos(d))).filter(Boolean)
      : await conversasPessoais();
  // Quem já vem com "@" (um id interno "…@lid", por exemplo) passa como está.
  return [...new Set([dono, ...base].filter(Boolean))].map((d) => (d.includes("@") ? d : jid(d)));
}

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
  const statusJidList = await publico(payload.destinatarios);
  if (!statusJidList.length) {
    return jsonResponse({ erro: "não achei para quem enviar o Status" }, 502);
  }
  const corpo: Record<string, unknown> = { type: tipo, allContacts: false, statusJidList };
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

  return jsonResponse({
    status: "enviado",
    tipo,
    destinatarios: statusJidList.length,
    message_id: extrairMessageId(body),
  });
});
