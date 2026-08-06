// Edge Function: whatsapp-instancia
// Gerencia a instância de WhatsApp na Evolution API v2: ver status, conectar
// (gerar QR / código de pareamento), listar grupos e registrar o webhook de
// recebimento. Usada pelo painel admin /admin/whatsapp pra permitir que o
// pareamento seja feito A QUALQUER MOMENTO.
//
// O contrato de entrada/saída é o MESMO de antes (quando o gateway era a
// Evolution GO), pra que o painel admin não precise saber qual provider está
// por trás. O que mudou foi só o mapeamento pros endpoints da v2:
//
//   status   -> { connected, loggedIn, nome }   GET  /instance/connectionState/{i}
//   conectar -> { ..., qrcode, pairingCode }    GET  /instance/connect/{i}
//   qr       -> { qrcode, pairingCode }         GET  /instance/connect/{i}
//   grupos   -> { grupos: [...] }               GET  /group/fetchAllGroups/{i}
//   webhook  -> registra a URL de recebimento   POST /webhook/set/{i}
//
// DIFERENÇA QUE PEGA: na v2 NÃO existe /instance/qr. O QR (base64) e o código
// de pareamento vêm juntos na resposta do connect — por isso "qr" e "conectar"
// batem no mesmo endpoint aqui.
//
// Autenticada via header `x-internal-secret` (server-to-server).

import {
  checarSegredo,
  evolutionFetch,
  jsonResponse,
  rota,
  EVOLUTION_INSTANCE,
} from "../_shared/evolution.ts";

type Acao = "status" | "conectar" | "qr" | "grupos" | "webhook";

/** Na v2 o estado vem em `instance.state`: open | close | connecting. */
function lerStatus(body: unknown) {
  const inst = ((body || {}) as { instance?: Record<string, unknown> }).instance || {};
  const state = typeof inst.state === "string" ? inst.state : "close";
  const aberto = state === "open";
  return {
    connected: aberto,
    loggedIn: aberto,
    estado: state,
    nome: typeof inst.instanceName === "string" ? inst.instanceName : EVOLUTION_INSTANCE,
  };
}

/** O connect devolve `base64` (data URI do QR) e `pairingCode` (código curto). */
function lerConexao(body: unknown) {
  const b = (body || {}) as Record<string, unknown>;
  const base64 = typeof b.base64 === "string" && b.base64.length > 0 ? b.base64 : null;
  const pairing = typeof b.pairingCode === "string" && b.pairingCode.length > 0
    ? b.pairingCode
    : null;
  return { qrcode: base64, pairingCode: pairing };
}

Deno.serve(async (req) => {
  if (req.method !== "POST") return new Response("Method not allowed", { status: 405 });

  const erroAuth = checarSegredo(req);
  if (erroAuth) return erroAuth;

  let reqBody: Record<string, unknown>;
  try {
    reqBody = await req.json();
  } catch {
    return jsonResponse({ erro: "body inválido" }, 400);
  }
  const acao = reqBody.acao as Acao;

  if (acao === "status") {
    const { ok, status, body } = await evolutionFetch(rota("/instance/connectionState"), {
      method: "GET",
    });
    if (!ok) return jsonResponse({ erro: "falha ao consultar status", evolution_status: status }, 502);
    return jsonResponse(lerStatus(body));
  }

  if (acao === "conectar" || acao === "qr") {
    // Se já estiver conectado, o connect não devolve QR — então checa antes
    // pra dar uma resposta honesta em vez de "qrcode: null" sem explicação.
    const st = await evolutionFetch(rota("/instance/connectionState"), { method: "GET" });
    const status = lerStatus(st.body);
    if (status.loggedIn) {
      return jsonResponse({ ...status, qrcode: null, pairingCode: null, mensagem: "já conectado" });
    }

    // `telefone` opcional: quando vem, a v2 devolve também o código de
    // pareamento, que é bem mais prático que ler QR no celular.
    const telefone = typeof reqBody.telefone === "string"
      ? reqBody.telefone.replace(/\D+/g, "")
      : "";
    const caminho = rota("/instance/connect") + (telefone ? `?number=${telefone}` : "");

    const conn = await evolutionFetch(caminho, { method: "GET" });
    if (!conn.ok) {
      return jsonResponse({ erro: "falha ao conectar", evolution_status: conn.status }, 502);
    }
    return jsonResponse({ ...status, ...lerConexao(conn.body) });
  }

  if (acao === "grupos") {
    const { ok, status, body } = await evolutionFetch(
      rota("/group/fetchAllGroups") + "?getParticipants=false",
      { method: "GET" },
    );
    if (!ok) return jsonResponse({ erro: "falha ao listar grupos", evolution_status: status }, 502);
    const lista = Array.isArray(body)
      ? body
      : ((body || {}) as { data?: unknown }).data;
    return jsonResponse({ grupos: Array.isArray(lista) ? lista : [] });
  }

  if (acao === "webhook") {
    // (Re)registra o webhook de RECEBIMENTO, pra que as mensagens que chegam
    // (áudio/texto) sejam POSTadas no app. A `url` (com o secret) é montada
    // pelo route admin — o segredo não vive nesta função.
    //
    // Na v2 o webhook tem endpoint próprio (não vai mais junto do connect,
    // como era na GO) e o evento de mensagem recebida é MESSAGES_UPSERT.
    const url = typeof reqBody.url === "string" ? reqBody.url : "";
    if (!url) return jsonResponse({ erro: "url do webhook obrigatória" }, 400);

    const r = await evolutionFetch(rota("/webhook/set"), {
      method: "POST",
      body: JSON.stringify({
        webhook: {
          enabled: true,
          url,
          events: ["MESSAGES_UPSERT"],
          byEvents: false,
          base64: true,
        },
      }),
    });

    const st = await evolutionFetch(rota("/instance/connectionState"), { method: "GET" });
    return jsonResponse({
      ok: r.ok,
      evolution_status: r.status,
      resposta: r.body,
      status: lerStatus(st.body),
    });
  }

  return jsonResponse({ erro: "ação inválida" }, 400);
});
