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

async function graphPost(path: string, params: Record<string, string>): Promise<string> {
  const body = new URLSearchParams(params);
  const res = await fetch(`${GRAPH}/${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body,
  });
  const json = (await res.json()) as { id?: string } & GraphErr;
  if (!res.ok || !json.id) {
    const msg = json.error?.error_user_msg || json.error?.message || `Graph API ${res.status}`;
    throw new Error(msg);
  }
  return json.id;
}

async function criarContainer(p: PublicarParams, extra: Record<string, string>): Promise<string> {
  return graphPost(`${p.igUserId}/media`, { access_token: p.token, ...extra });
}

async function publicar(p: PublicarParams, creationId: string): Promise<string> {
  return graphPost(`${p.igUserId}/media_publish`, { access_token: p.token, creation_id: creationId });
}

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

// Espera o container ficar pronto (FINISHED) antes de publicar. O Instagram
// baixa/processa a imagem de forma assíncrona — publicar antes dá
// "media is not ready". Faz polling do status_code.
async function esperarPronto(p: PublicarParams, creationId: string): Promise<void> {
  for (let i = 0; i < 20; i++) {
    const res = await fetch(`${GRAPH}/${creationId}?fields=status_code&access_token=${encodeURIComponent(p.token)}`);
    const json = (await res.json()) as { status_code?: string } & GraphErr;
    const sc = json.status_code;
    if (sc === "FINISHED") return;
    if (sc === "ERROR" || sc === "EXPIRED") throw new Error(`a imagem falhou ao processar (${sc})`);
    await sleep(2500);
  }
  throw new Error("tempo esgotado esperando a imagem ficar pronta");
}

/** Publica imagem única ou carrossel. Retorna o id do post publicado. */
export async function publicarInstagram(p: PublicarParams): Promise<{ id: string }> {
  if (!p.igUserId || !p.token) throw new Error("Instagram não configurado (faltam token/ID).");
  if (!p.imageUrls.length) throw new Error("Nenhuma imagem pra publicar.");

  let creationId: string;
  if (p.imageUrls.length === 1) {
    creationId = await criarContainer(p, { image_url: p.imageUrls[0], caption: p.legenda });
    await esperarPronto(p, creationId);
  } else {
    const children: string[] = [];
    for (const url of p.imageUrls.slice(0, 10)) {
      const child = await criarContainer(p, { image_url: url, is_carousel_item: "true" });
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

export function instagramConfigurado(): boolean {
  return Boolean(process.env.IG_USER_ID && process.env.META_ACCESS_TOKEN);
}
