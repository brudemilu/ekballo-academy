/**
 * Publicação no Instagram via Graph API (container + media_publish).
 *
 *  - 1 imagem  → cria container (image_url + caption) → publica.
 *  - carrossel → cria 1 container por imagem (is_carousel_item) → container
 *    pai (media_type=CAROUSEL, children) → publica.
 *
 * As imagens vêm da nossa rota OG pública (image_url), então o Meta busca
 * direto — sem precisar de storage. Requer IG Business/Creator + token com
 * `instagram_content_publish`.
 */

// API do Instagram com login do Instagram (conta Criador/Comercial, SEM Página
// do Facebook): base graph.instagram.com. Override por env se necessário.
const GRAPH = process.env.META_GRAPH_BASE || "https://graph.instagram.com/v21.0";

export type PublicarParams = {
  igUserId: string;
  token: string;
  /** URLs públicas das imagens (1 = imagem única; 2+ = carrossel). */
  imageUrls: string[];
  legenda: string;
};

type GraphErr = { error?: { message?: string; error_user_msg?: string } };

async function graphPost(
  path: string,
  params: Record<string, string>,
): Promise<string> {
  const body = new URLSearchParams(params);
  const res = await fetch(`${GRAPH}/${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body,
  });
  const json = (await res.json()) as { id?: string } & GraphErr;
  if (!res.ok || !json.id) {
    const msg =
      json.error?.error_user_msg || json.error?.message || `Graph API ${res.status}`;
    throw new Error(msg);
  }
  return json.id;
}

async function criarContainer(
  p: PublicarParams,
  extra: Record<string, string>,
): Promise<string> {
  return graphPost(`${p.igUserId}/media`, { access_token: p.token, ...extra });
}

async function publicar(p: PublicarParams, creationId: string): Promise<string> {
  return graphPost(`${p.igUserId}/media_publish`, {
    access_token: p.token,
    creation_id: creationId,
  });
}

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

/**
 * Quanto o agendador espera o Instagram processar um Reel (issue #232). Os
 * 57 s de antes vinham do limite de 60 s da Vercel; no box esse limite não
 * existe, e um vídeo de 30 MB leva perto de um minuto — o Reel de 06/10/2026
 * falhou por isso e teve de ser publicado à mão.
 */
export const ESPERA_REEL_SEG = 360;
/** Na publicação pela tela, alguém está esperando a resposta: espera menos. */
export const ESPERA_REEL_TELA_SEG = 150;

/**
 * Enquanto um post está sendo publicado, a hora dele é empurrada para a frente
 * por este tempo. O agendador roda a cada 5 minutos e só pega o que já venceu:
 * com a hora no futuro, a rodada seguinte não começa uma segunda publicação do
 * mesmo post. Se o processo morrer no meio, a reserva vence e ele tenta de novo.
 */
export const RESERVA_PUBLICACAO_MIN = 20;

/** Até quando vale a reserva de um post que começou a ser publicado agora (ISO). */
export function reservaAte(agora: Date, minutos = RESERVA_PUBLICACAO_MIN): string {
  return new Date(agora.getTime() + minutos * 60_000).toISOString();
}

/** Quantas consultas de estado cabem na espera, uma a cada `intervaloMs`. */
export function tentativasParaEspera(segundos: number, intervaloMs: number): number {
  return Math.max(1, Math.ceil((segundos * 1000) / intervaloMs));
}

// Espera o container ficar pronto (FINISHED) antes de publicar. O Instagram
// baixa/processa a imagem de forma assíncrona — publicar antes dá
// "media is not ready". Faz polling do status_code.
async function esperarPronto(
  p: PublicarParams,
  creationId: string,
  tentativas = 20,
  intervalo = 2500,
): Promise<void> {
  for (let i = 0; i < tentativas; i++) {
    const res = await fetch(
      `${GRAPH}/${creationId}?fields=status_code&access_token=${encodeURIComponent(p.token)}`,
    );
    const json = (await res.json()) as { status_code?: string } & GraphErr;
    const sc = json.status_code;
    if (sc === "FINISHED") return;
    if (sc === "ERROR" || sc === "EXPIRED")
      throw new Error(`a mídia falhou ao processar (${sc})`);
    await sleep(intervalo);
  }
  throw new Error("tempo esgotado esperando a mídia ficar pronta");
}

/** Publica imagem única ou carrossel. Retorna o id do post publicado. */
export async function publicarInstagram(p: PublicarParams): Promise<{ id: string }> {
  if (!p.igUserId || !p.token)
    throw new Error("Instagram não configurado (faltam token/ID).");
  if (!p.imageUrls.length) throw new Error("Nenhuma imagem pra publicar.");

  let creationId: string;
  if (p.imageUrls.length === 1) {
    creationId = await criarContainer(p, {
      image_url: p.imageUrls[0],
      caption: p.legenda,
    });
    await esperarPronto(p, creationId);
  } else {
    const children: string[] = [];
    for (const url of p.imageUrls.slice(0, 10)) {
      const child = await criarContainer(p, {
        image_url: url,
        is_carousel_item: "true",
      });
      await esperarPronto(p, child); // cada filho precisa estar pronto
      children.push(child);
    }
    creationId = await criarContainer(p, {
      media_type: "CAROUSEL",
      children: children.join(","),
      caption: p.legenda,
    });
    await esperarPronto(p, creationId);
  }

  const id = await publicar(p, creationId);
  return { id };
}

/**
 * Publica um REEL (vídeo). video_url tem que ser um MP4 público (H.264/AAC,
 * 9:16, ~3–90s). O Meta baixa e PROCESSA o vídeo (demora mais que imagem),
 * então a espera é longa (ver ESPERA_REEL_SEG). share_to_feed também mostra no feed.
 */
export async function publicarReel(params: {
  igUserId: string;
  token: string;
  videoUrl: string;
  legenda: string;
  /** Tempo máximo esperando o vídeo ficar pronto. Padrão: o do agendador. */
  esperaSeg?: number;
}): Promise<{ id: string }> {
  if (!params.igUserId || !params.token)
    throw new Error("Instagram não configurado (faltam token/ID).");
  if (!params.videoUrl) throw new Error("Nenhum vídeo pra publicar.");
  const p: PublicarParams = {
    igUserId: params.igUserId,
    token: params.token,
    imageUrls: [],
    legenda: params.legenda,
  };
  const creationId = await criarContainer(p, {
    media_type: "REELS",
    video_url: params.videoUrl,
    caption: params.legenda,
    share_to_feed: "true",
  });
  // Vídeo demora a processar: consulta a cada 5 s até o limite pedido.
  const intervalo = 5000;
  await esperarPronto(
    p,
    creationId,
    tentativasParaEspera(params.esperaSeg ?? ESPERA_REEL_SEG, intervalo),
    intervalo,
  );
  const id = await publicar(p, creationId);
  return { id };
}

/** Publica um Story de imagem (some em 24h). image_url tem que ser 9:16 público. */
export async function publicarStory(params: {
  igUserId: string;
  token: string;
  imageUrl: string;
}): Promise<{ id: string }> {
  if (!params.igUserId || !params.token) throw new Error("Instagram não configurado.");
  const p: PublicarParams = {
    igUserId: params.igUserId,
    token: params.token,
    imageUrls: [params.imageUrl],
    legenda: "",
  };
  const creationId = await criarContainer(p, {
    image_url: params.imageUrl,
    media_type: "STORIES",
  });
  await esperarPronto(p, creationId);
  const id = await publicar(p, creationId);
  return { id };
}

export function instagramConfigurado(): boolean {
  return Boolean(process.env.IG_USER_ID && process.env.META_ACCESS_TOKEN);
}
