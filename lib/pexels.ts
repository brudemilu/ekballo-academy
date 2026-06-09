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
    "faces face visible distant aerial above"
  ).split(/\s+/),
);

/** Reduz o prompt da IA a poucas palavras-chave fortes pra busca. */
export function querify(prompt: string): string {
  const words = prompt
    .toLowerCase()
    .replace(/[^a-z\s]/g, " ")
    .split(/\s+/)
    .filter((w) => w.length > 2 && !STOP.has(w));
  const q = words.slice(0, 5).join(" ").trim();
  return q || prompt.replace(/[^a-zA-Z\s]/g, " ").trim().split(/\s+/).slice(0, 4).join(" ");
}

// cache em memória: query|seed → URL (evita repetir a busca a cada tweak de texto).
const fotoCache = new Map<string, string>();

/**
 * Devolve a URL de uma foto do Pexels recortada em 1080×1350 (4:5), ou null.
 */
export async function buscarFotoPexels(prompt: string, seed: number): Promise<string | null> {
  const key = process.env.PEXELS_API_KEY;
  if (!key || !prompt.trim()) return null;

  const q = querify(prompt);
  const cacheKey = `${q}|${seed}`;
  const cached = fotoCache.get(cacheKey);
  if (cached) return cached;

  try {
    const url = `${PEXELS_API}?query=${encodeURIComponent(q)}&orientation=portrait&size=large&per_page=24`;
    const res = await fetch(url, { headers: { Authorization: key } });
    if (!res.ok) return null;
    const json = (await res.json()) as { photos?: { src?: { original?: string } }[] };
    const photos = Array.isArray(json.photos) ? json.photos : [];
    if (!photos.length) return null;

    const idx = Math.abs(seed) % photos.length;
    const original = photos[idx]?.src?.original;
    if (!original) return null;

    // recorta exatamente 4:5 via params do CDN do Pexels.
    const finalUrl = `${original}?auto=compress&cs=tinysrgb&w=1080&h=1350&fit=crop`;
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
export async function buscarVideoPexels(prompt: string, seed: number): Promise<string | null> {
  const key = process.env.PEXELS_API_KEY;
  if (!key || !prompt.trim()) return null;
  const q = querify(prompt);
  try {
    const url = `${PEXELS_VIDEO_API}?query=${encodeURIComponent(q)}&orientation=portrait&size=medium&per_page=24`;
    const res = await fetch(url, { headers: { Authorization: key } });
    if (!res.ok) return null;
    const json = (await res.json()) as {
      videos?: { video_files?: { link?: string; width?: number; height?: number; fps?: number }[] }[];
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
