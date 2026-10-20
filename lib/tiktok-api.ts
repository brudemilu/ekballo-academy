/**
 * Chamadas à API do TikTok (Login Kit + Content Posting API) — issue #273.
 * Só servidor: usa TIKTOK_CLIENT_KEY e TIKTOK_CLIENT_SECRET.
 *
 * O envio é sempre FILE_UPLOAD (o servidor baixa o vídeo e manda os bytes):
 * a outra forma, PULL_FROM_URL, exige provar ao TikTok que o domínio do
 * Storage é nosso, e não precisamos disso.
 */
import { siteBase } from "@/lib/site-url";
import {
  type AutorizacaoTikTok,
  type CriadorTikTok,
  escolherPrivacidade,
  type ModoTikTok,
  planoDeEnvio,
  postInfo,
} from "@/lib/tiktok";

const API = "https://open.tiktokapis.com/v2";

export function credenciaisDoApp(): { clientKey: string; clientSecret: string } | null {
  const clientKey = (process.env.TIKTOK_CLIENT_KEY || "").trim();
  const clientSecret = (process.env.TIKTOK_CLIENT_SECRET || "").trim();
  return clientKey && clientSecret ? { clientKey, clientSecret } : null;
}

/**
 * Para onde o TikTok devolve depois da autorização. Precisa estar cadastrado
 * igual no aplicativo do TikTok for Developers.
 */
export function enderecoDeVolta(): string {
  const fixo = (process.env.TIKTOK_REDIRECT_URI || "").trim();
  if (fixo) return fixo;
  const base = siteBase();
  return base ? `${base}/api/admin/instagram/tiktok/callback` : "";
}

export type TokensTikTok = {
  accessToken: string;
  refreshToken: string;
  openId: string;
  escopos: string;
  expiraEm: string;
  refreshExpiraEm: string;
};

type RespostaToken = {
  access_token?: string;
  refresh_token?: string;
  open_id?: string;
  scope?: string;
  expires_in?: number;
  refresh_expires_in?: number;
  error?: string;
  error_description?: string;
};

async function pedirToken(params: Record<string, string>): Promise<TokensTikTok> {
  const app = credenciaisDoApp();
  if (!app)
    throw new Error("TikTok não configurado (TIKTOK_CLIENT_KEY/TIKTOK_CLIENT_SECRET)");
  const res = await fetch(`${API}/oauth/token/`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      client_key: app.clientKey,
      client_secret: app.clientSecret,
      ...params,
    }),
    signal: AbortSignal.timeout(20_000),
  });
  const j = (await res.json().catch(() => ({}))) as RespostaToken;
  if (!res.ok || !j.access_token || !j.refresh_token || !j.open_id)
    throw new Error(j.error_description || j.error || `TikTok ${res.status}`);
  const agora = Date.now();
  return {
    accessToken: j.access_token,
    refreshToken: j.refresh_token,
    openId: j.open_id,
    escopos: j.scope || "",
    expiraEm: new Date(agora + (j.expires_in ?? 0) * 1000).toISOString(),
    refreshExpiraEm: new Date(agora + (j.refresh_expires_in ?? 0) * 1000).toISOString(),
  };
}

/** Troca o `code` da volta da autorização pelos tokens. */
export function trocarCodigo(code: string, redirectUri: string) {
  return pedirToken({
    code,
    grant_type: "authorization_code",
    redirect_uri: redirectUri,
  });
}

/** O token de acesso dura 24 h; o de renovação, um ano. */
export function renovarToken(refreshToken: string) {
  return pedirToken({ refresh_token: refreshToken, grant_type: "refresh_token" });
}

/** Desfaz a autorização no TikTok. Falhar aqui não impede de apagar o token local. */
export async function revogarToken(accessToken: string): Promise<void> {
  const app = credenciaisDoApp();
  if (!app) return;
  await fetch(`${API}/oauth/revoke/`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      client_key: app.clientKey,
      client_secret: app.clientSecret,
      token: accessToken,
    }),
    signal: AbortSignal.timeout(15_000),
  }).catch(() => undefined);
}

type Envelope<T> = { data?: T; error?: { code?: string; message?: string } };

async function chamar<T>(
  caminho: string,
  token: string,
  corpo?: unknown,
  metodo: "GET" | "POST" = "POST",
): Promise<T> {
  const res = await fetch(`${API}${caminho}`, {
    method: metodo,
    headers: {
      Authorization: `Bearer ${token}`,
      ...(metodo === "POST"
        ? { "Content-Type": "application/json; charset=UTF-8" }
        : {}),
    },
    body: metodo === "POST" ? JSON.stringify(corpo ?? {}) : undefined,
    signal: AbortSignal.timeout(30_000),
  });
  const j = (await res.json().catch(() => ({}))) as Envelope<T>;
  const codigo = j.error?.code;
  if (!res.ok || (codigo && codigo !== "ok"))
    throw new Error(
      `${codigo || res.status}: ${j.error?.message || "falha no TikTok"}`,
    );
  return (j.data ?? {}) as T;
}

/** Nome e foto da conta autorizada, para o painel mostrar quem está ligado. */
export async function lerUsuario(
  token: string,
): Promise<{ nome: string; avatarUrl: string | null }> {
  const d = await chamar<{ user?: { display_name?: string; avatar_url?: string } }>(
    "/user/info/?fields=open_id,display_name,avatar_url",
    token,
    undefined,
    "GET",
  );
  return { nome: d.user?.display_name || "", avatarUrl: d.user?.avatar_url || null };
}

/**
 * Os dados da conta na hora de publicar: nome, opções de privacidade, o que
 * está bloqueado e a duração máxima. O TikTok exige ler isto a cada post.
 */
export async function lerCriador(token: string): Promise<CriadorTikTok> {
  const d = await chamar<{
    creator_nickname?: string;
    creator_username?: string;
    privacy_level_options?: string[];
    comment_disabled?: boolean;
    duet_disabled?: boolean;
    stitch_disabled?: boolean;
    max_video_post_duration_sec?: number;
  }>("/post/publish/creator_info/query/", token);
  return {
    nome: d.creator_nickname || "",
    usuario: d.creator_username || "",
    privacidades: d.privacy_level_options ?? [],
    comentarioBloqueado: Boolean(d.comment_disabled),
    duetoBloqueado: Boolean(d.duet_disabled),
    costuraBloqueada: Boolean(d.stitch_disabled),
    duracaoMaximaSeg: d.max_video_post_duration_sec ?? 0,
  };
}

/**
 * Manda o vídeo ao TikTok. No modo `rascunho`, cai na caixa de entrada do
 * app; no `direto`, publica com a legenda (pública se o TikTok deixar).
 * Devolve o publish_id, que é consultado depois em `consultarEnvio`.
 */
export async function enviarVideo(p: {
  token: string;
  modo: ModoTikTok;
  video: Uint8Array;
  legenda: string;
  /** Escolhas feitas no painel para este vídeo (publicação direta). */
  autorizacao?: AutorizacaoTikTok | null;
}): Promise<{ publishId: string; privacidade: string | null }> {
  const plano = planoDeEnvio(p.video.byteLength);
  const source_info = {
    source: "FILE_UPLOAD",
    video_size: p.video.byteLength,
    chunk_size: plano.chunkSize,
    total_chunk_count: plano.total,
  };
  let privacidade: string | null = null;
  let init: { publish_id?: string; upload_url?: string };
  if (p.autorizacao) {
    // Publicação direta com o que a pessoa escolheu no painel para ESTE vídeo.
    privacidade = p.autorizacao.privacidade;
    init = await chamar("/post/publish/video/init/", p.token, {
      post_info: postInfo(p.autorizacao),
      source_info,
    });
  } else if (p.modo === "direto") {
    const criador = await chamar<{ privacy_level_options?: string[] }>(
      "/post/publish/creator_info/query/",
      p.token,
    );
    privacidade = escolherPrivacidade(criador.privacy_level_options);
    init = await chamar("/post/publish/video/init/", p.token, {
      post_info: {
        title: p.legenda,
        privacy_level: privacidade,
        disable_comment: false,
        disable_duet: false,
        disable_stitch: false,
        video_cover_timestamp_ms: 1000,
      },
      source_info,
    });
  } else {
    init = await chamar("/post/publish/inbox/video/init/", p.token, { source_info });
  }
  if (!init.publish_id || !init.upload_url)
    throw new Error("TikTok não devolveu onde enviar");

  for (const f of plano.faixas) {
    const pedaco = p.video.subarray(f.inicio, f.fim + 1);
    const res = await fetch(init.upload_url, {
      method: "PUT",
      headers: {
        "Content-Type": "video/mp4",
        "Content-Length": String(pedaco.byteLength),
        "Content-Range": `bytes ${f.inicio}-${f.fim}/${p.video.byteLength}`,
      },
      body: new Blob([new Uint8Array(pedaco)], { type: "video/mp4" }),
      signal: AbortSignal.timeout(120_000),
    });
    if (!res.ok)
      throw new Error(
        `envio do vídeo: ${res.status} ${(await res.text().catch(() => "")).slice(0, 120)}`,
      );
  }
  return { publishId: init.publish_id, privacidade };
}

/** Em que pé está um envio: processando, no rascunho, publicado ou falhou. */
export async function consultarEnvio(
  token: string,
  publishId: string,
): Promise<{ status?: string; motivo?: string }> {
  const d = await chamar<{ status?: string; fail_reason?: string }>(
    "/post/publish/status/fetch/",
    token,
    { publish_id: publishId },
  );
  return { status: d.status, motivo: d.fail_reason };
}
