// Edge Function: whatsapp-instancia
// Gerencia a instância de WhatsApp na Evolution GO: ver status, conectar
// (gerar QR code pra parear), e listar grupos. Usado pelo painel admin
// /admin/whatsapp pra permitir que o pareamento seja feito A QUALQUER MOMENTO.
//
// Body (POST): { acao: "status" | "conectar" | "qr" | "grupos" }
//   - status   -> { connected, loggedIn }                       GET  /instance/status
//   - conectar -> dispara a conexão e devolve o QR              POST /instance/connect + GET /instance/qr
//   - qr       -> { qrcode } (data:image/png;base64,...)        GET  /instance/qr
//   - grupos   -> { grupos: [...] }                             GET  /group/myall
//
// Autenticada via header `x-internal-secret` (server-to-server).
//
// Env vars (Supabase Edge Function secrets):
//   EVOLUTION_BASE_URL, EVOLUTION_INSTANCE_TOKEN, INTERNAL_SECRET

import { checarSegredo, evolutionFetch, jsonResponse } from "../_shared/evolution.ts";

type Acao = "status" | "conectar" | "qr" | "grupos" | "webhook";

function lerStatus(body: unknown) {
  const data = ((body || {}) as { data?: Record<string, unknown> }).data || {};
  return {
    connected: !!data.Connected,
    loggedIn: !!data.LoggedIn,
    nome: typeof data.Name === "string" ? data.Name : null,
  };
}

function lerQr(body: unknown): string | null {
  const data = ((body || {}) as { data?: Record<string, unknown> }).data || {};
  const q = data.Qrcode ?? data.qrcode ?? data.QRCode;
  return typeof q === "string" && q.length > 0 ? q : null;
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
    const { ok, status, body } = await evolutionFetch("/instance/status", { method: "GET" });
    if (!ok) return jsonResponse({ erro: "falha ao consultar status", evolution_status: status }, 502);
    return jsonResponse(lerStatus(body));
  }

  if (acao === "conectar") {
    // Inicia (ou reinicia) a sessão e busca um QR fresco pra parear.
    await evolutionFetch("/instance/connect", {
      method: "POST",
      body: JSON.stringify({ immediate: true }),
    });
    const st = await evolutionFetch("/instance/status", { method: "GET" });
    const status = lerStatus(st.body);
    if (status.loggedIn) {
      return jsonResponse({ ...status, qrcode: null, mensagem: "já conectado" });
    }
    const qrResp = await evolutionFetch("/instance/qr", { method: "GET" });
    return jsonResponse({ ...status, qrcode: lerQr(qrResp.body) });
  }

  if (acao === "qr") {
    const { ok, status, body } = await evolutionFetch("/instance/qr", { method: "GET" });
    if (!ok) return jsonResponse({ erro: "falha ao obter QR", evolution_status: status }, 502);
    return jsonResponse({ qrcode: lerQr(body) });
  }

  if (acao === "grupos") {
    // /group/list busca a lista completa do servidor (em testes /group/myall
    // retornava vazio mesmo conectado; /group/list traz todos os grupos).
    const { ok, status, body } = await evolutionFetch("/group/list", { method: "GET" });
    if (!ok) return jsonResponse({ erro: "falha ao listar grupos", evolution_status: status }, 502);
    const data = ((body || {}) as { data?: unknown }).data;
    return jsonResponse({ grupos: Array.isArray(data) ? data : [] });
  }

  if (acao === "webhook") {
    // (Re)registra o webhook de RECEBIMENTO na instância do Evolution GO, pra
    // que as mensagens que chegam (áudio/texto) sejam POSTadas no app. A `url`
    // (com o secret) é montada pelo route admin e passada aqui — o segredo não
    // vive nesta função. Retorna a config atual + o resultado de cada tentativa
    // (a API de webhook varia entre builds do Evolution GO).
    const url = typeof reqBody.url === "string" ? reqBody.url : "";
    if (!url) return jsonResponse({ erro: "url do webhook obrigatória" }, 400);

    // Eventos que cobrem "mensagem recebida" em diferentes builds.
    const eventos = ["Message", "messages.upsert", "MESSAGES_UPSERT"];

    // 1) lê a config atual (pra diagnóstico) — tenta os endpoints conhecidos.
    const leitura: Record<string, unknown> = {};
    for (const p of ["/webhook/find", "/webhook"]) {
      try {
        const r = await evolutionFetch(p, { method: "GET" });
        leitura[p] = { status: r.status, body: r.body };
      } catch (e) {
        leitura[p] = { erro: e instanceof Error ? e.message : String(e) };
      }
    }

    // 2) tenta registrar (variações de path/payload entre builds do Evolution GO).
    const variantes: { path: string; body: unknown }[] = [
      { path: "/webhook/set", body: { enabled: true, url, events: eventos, webhookBase64: true, base64: true } },
      { path: "/webhook/set", body: { webhook: { enabled: true, url, events: eventos, base64: true } } },
      { path: "/webhook", body: { enabled: true, url, events: eventos, base64: true } },
      { path: "/instance/webhook", body: { enabled: true, url, events: eventos, base64: true } },
    ];
    const tentativas: Record<string, unknown>[] = [];
    let ok = false;
    for (const v of variantes) {
      try {
        const r = await evolutionFetch(v.path, { method: "POST", body: JSON.stringify(v.body) });
        tentativas.push({ path: v.path, status: r.status, ok: r.ok, body: r.body });
        if (r.ok) { ok = true; break; }
      } catch (e) {
        tentativas.push({ path: v.path, erro: e instanceof Error ? e.message : String(e) });
      }
    }

    return jsonResponse({ ok, url, leitura, tentativas });
  }

  return jsonResponse({ erro: "ação desconhecida" }, 400);
});
