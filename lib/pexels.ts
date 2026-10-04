/**
 * Busca de FOTO REAL no Pexels (banco de imagens grátis e ilimitado pro nosso
 * uso) — substitui a geração por IA (Cloudflare Flux), que tem teto diário.
 *
 * A IA dá um "prompt" descritivo do sentido do slide; aqui a gente reduz isso a
 * palavras-chave e busca uma foto real que combina (orientação retrato, pra 4:5).
 * Mesma `seed` → mesma foto (escolha determinística), então mexer no texto não
 * troca a imagem.
 *
 * Precisa de PEXELS_API_KEY (chave grátis em pexels.com/api). Sem chave → null
 * (a rota cai no Cloudflare/fallback).
 */

const PEXELS_API = "https://api.pexels.com/v1/search";

// Palavras de ESTILO/qualidade e stopwords — não ajudam a busca, atrapalham.
const STOP = new Set(
  (
    "a an the of at in on to with and or from into toward towards facing seen not no " +
    "cinematic photo photograph photography image picture vivid vibrant saturated rich " +
    "tones tone color colors colours film grain atmospheric dramatic high resolution " +
    "ultra detailed shot wide angle bokeh depth field backlight warm soft volumetric " +
    "god rays mood elegant minimal minimalist composition negative space typography " +
    "faces face visible distant aerial above " +
    // enquadramento, luz e tamanho: descrevem a foto, não o assunto. Na frente
    // da busca, traziam foto de qualquer coisa "em close" (issue #211).
    "close closeup extreme macro small big large tiny single one two three during " +
    "while dark darkness moody low key light lighting lit side behind back front " +
    "blurred blurry background foreground scene real candid documentary " +
    "his her their its someone person people man woman mans womans young old " +
    "that this who what where being are is"
  ).split(/\s+/),
);

/** Reduz o prompt da IA a poucas palavras-chave fortes pra busca. */
export function querify(prompt: string): string {
  const words = prompt
    .toLowerCase()
    .replace(/'s\b/g, "")
    .replace(/[^a-z\s]/g, " ")
    .split(/\s+/)
    .filter((w) => w.length > 2 && !STOP.has(w));
  // Poucas palavras: o Pexels casa TODAS, e com cinco a busca volta vazia ou torta.
  const q = words.slice(0, 4).join(" ").trim();
  return (
    q ||
    prompt
      .replace(/[^a-zA-Z\s]/g, " ")
      .trim()
      .split(/\s+/)
      .slice(0, 4)
      .join(" ")
  );
}

// cache em memória: query|seed → URL (evita repetir a busca a cada tweak de texto).
const fotoCache = new Map<string, string>();

/**
 * Devolve a URL de uma foto do Pexels já recortada no tamanho pedido, ou null.
 *
 * O padrão é 1080×1350 (4:5, o carrossel). O template editorial passa o tamanho
 * final de cada formato — 1080×1350 no feed, 1080×1920 no story — pra que o
 * recorte venha pronto do CDN do Pexels, no tamanho exato em que a imagem vai
 * ser desenhada. Isso é o que mantém a foto nítida: sem pedir o tamanho certo, a
 * foto chega menor que a tela e o `objectFit: cover` estica.
 */
export async function buscarFotoPexels(
  prompt: string,
  seed: number,
  larg = 1080,
  alt = 1350,
): Promise<string | null> {
  const key = process.env.PEXELS_API_KEY;
  if (!key || !prompt.trim()) return null;

  const q = querify(prompt);
  const cacheKey = `${q}|${seed}|${larg}x${alt}`;
  const cached = fotoCache.get(cacheKey);
  if (cached) return cached;

  try {
    const url = `${PEXELS_API}?query=${encodeURIComponent(q)}&orientation=portrait&size=large&per_page=24`;
    const res = await fetch(url, { headers: { Authorization: key } });
    if (!res.ok) return null;
    const json = (await res.json()) as { photos?: { src?: { original?: string } }[] };
    const photos = Array.isArray(json.photos) ? json.photos : [];
    if (!photos.length) return null;

    // Só entre as primeiras: a relevância do Pexels cai depressa, e sortear
    // entre 24 trazia foto que não tinha nada a ver com o texto.
    const idx = Math.abs(seed) % Math.min(photos.length, 8);
    const original = photos[idx]?.src?.original;
    if (!original) return null;

    // recorta no tamanho pedido via params do CDN do Pexels.
    const finalUrl = `${original}?auto=compress&cs=tinysrgb&w=${larg}&h=${alt}&fit=crop`;
    fotoCache.set(cacheKey, finalUrl);
    if (fotoCache.size > 200) fotoCache.delete(fotoCache.keys().next().value!);
    return finalUrl;
  } catch {
    return null;
  }
}

// ----------------------------------------------------------------------------
// VÍDEO (Reels) — clipe vertical real do Pexels (grátis/ilimitado).
// ----------------------------------------------------------------------------
const PEXELS_VIDEO_API = "https://api.pexels.com/videos/search";

/**
 * Devolve a URL de um arquivo de VÍDEO vertical (≤1080 de largura, melhor
 * qualidade) que combina com a cena, ou null. Determinístico por seed.
 */
export async function buscarVideoPexels(
  prompt: string,
  seed: number,
): Promise<string | null> {
  const key = process.env.PEXELS_API_KEY;
  if (!key || !prompt.trim()) return null;
  const q = querify(prompt);
  try {
    const url = `${PEXELS_VIDEO_API}?query=${encodeURIComponent(q)}&orientation=portrait&size=medium&per_page=24`;
    const res = await fetch(url, { headers: { Authorization: key } });
    if (!res.ok) return null;
    const json = (await res.json()) as {
      videos?: {
        video_files?: {
          link?: string;
          width?: number;
          height?: number;
          fps?: number;
        }[];
      }[];
    };
    const videos = (Array.isArray(json.videos) ? json.videos : []).filter((v) =>
      (v.video_files || []).some((f) => f.link),
    );
    if (!videos.length) return null;
    const v = videos[Math.abs(seed) % videos.length];
    const files = (v.video_files || [])
      .filter((f) => f.link)
      .sort((a, b) => (a.width || 0) - (b.width || 0));
    // prefere arquivo ≤1080 e ≤31fps (mais leve = baixa rápido no Vercel);
    // senão ≤1080 qualquer; senão o menor disponível.
    const leves = files.filter((f) => (f.width || 0) <= 1080 && (f.fps || 30) <= 31);
    const ate1080 = files.filter((f) => (f.width || 0) <= 1080);
    const pick = leves[leves.length - 1] || ate1080[ate1080.length - 1] || files[0];
    return pick?.link || null;
  } catch {
    return null;
  }
}

export function pexelsConfigurado(): boolean {
  return Boolean(process.env.PEXELS_API_KEY);
}
