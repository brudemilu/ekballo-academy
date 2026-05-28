/**
 * Download de áudio do YouTube via API de terceiros (RapidAPI).
 *
 * Funciona em QUALQUER ambiente (inclusive Vercel) porque quem lida com o
 * bloqueio anti-bot do YouTube é o serviço de terceiros — nosso servidor só
 * conversa com a API deles, nunca com o YouTube direto. É o mesmo princípio
 * que sites tipo y2meta usam por baixo.
 *
 * Precisa da env YOUTUBE_MP3_API_KEY (chave grátis do RapidAPI).
 * Serviço default: youtube-mp36 (ytjar) — GET /dl?id=<videoId>.
 */

export type YouTubeResultado = {
  videoId: string;
  title: string;
  link: string; // URL direto do arquivo MP3 (no CDN do serviço)
  durationSec: number;
  filesize?: number;
};

/**
 * Extrai o ID de 11 caracteres de qualquer formato de URL do YouTube
 * (watch, youtu.be, shorts, embed) ou aceita o próprio ID colado.
 */
export function extractVideoId(input: string): string | null {
  const u = (input || "").trim();
  if (!u) return null;

  // Já é um ID puro?
  if (/^[A-Za-z0-9_-]{11}$/.test(u)) return u;

  try {
    const parsed = new URL(u);
    if (parsed.hostname.includes("youtu.be")) {
      const id = parsed.pathname.replace(/^\//, "").split("/")[0];
      return id && id.length === 11 ? id : null;
    }
    if (parsed.hostname.includes("youtube.com")) {
      if (parsed.pathname === "/watch") return parsed.searchParams.get("v");
      if (parsed.pathname.startsWith("/shorts/")) return parsed.pathname.split("/")[2] || null;
      if (parsed.pathname.startsWith("/embed/")) return parsed.pathname.split("/")[2] || null;
      if (parsed.pathname.startsWith("/live/")) return parsed.pathname.split("/")[2] || null;
    }
  } catch {
    // não era URL válida
  }
  return null;
}

export function apiConfigurada(): boolean {
  return Boolean(process.env.YOUTUBE_MP3_API_KEY);
}

/**
 * Converte o vídeo em MP3 via API. Pode precisar de algumas tentativas
 * porque o serviço às vezes responde "processing" enquanto converte.
 */
export async function converterParaMp3(videoId: string): Promise<YouTubeResultado> {
  const key = process.env.YOUTUBE_MP3_API_KEY;
  if (!key) throw new Error("YOUTUBE_MP3_API_KEY não configurada no servidor");
  const host = process.env.YOUTUBE_MP3_API_HOST || "youtube-mp36.p.rapidapi.com";

  let ultimaMsg = "";
  for (let tentativa = 0; tentativa < 6; tentativa++) {
    const res = await fetch(`https://${host}/dl?id=${encodeURIComponent(videoId)}`, {
      headers: {
        "x-rapidapi-key": key,
        "x-rapidapi-host": host,
      },
    });

    if (res.status === 429) {
      throw new Error("Limite da API atingido (plano grátis). Tente mais tarde ou faça upgrade.");
    }
    if (!res.ok) {
      throw new Error(`API respondeu ${res.status}: ${(await res.text()).slice(0, 200)}`);
    }

    const j = await res.json();

    if (j.status === "ok" && j.link) {
      return {
        videoId,
        title: String(j.title || "audio"),
        link: String(j.link),
        durationSec: Number(j.duration) || 0,
        filesize: Number(j.filesize) || undefined,
      };
    }

    // Serviço ainda convertendo — espera e tenta de novo
    if (j.status === "processing" || j.status === "in process" || j.status === "CONVERTING") {
      ultimaMsg = "convertendo…";
      await new Promise((r) => setTimeout(r, 3000));
      continue;
    }

    // Qualquer outro status = erro
    throw new Error(j.msg || j.error || `status inesperado da API: ${j.status}`);
  }

  throw new Error(`A conversão demorou demais (${ultimaMsg}). Tente de novo em instantes.`);
}

export function nomeArquivoSeguro(titulo: string, videoId: string): string {
  const base = titulo
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .replace(/[^a-zA-Z0-9 _-]/g, "")
    .replace(/\s+/g, "-")
    .slice(0, 80);
  return `${base || "audio"}-${videoId}.mp3`;
}
