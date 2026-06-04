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

type Acao = "status" | "conectar" | "qr" | "grupos";

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

  let acao: Acao;
  try {
    acao = (await req.json()).acao;
  } catch {
    return jsonResponse({ erro: "body inválido" }, 400);
  }

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

  return jsonResponse({ erro: "ação desconhecida" }, 400);
});
