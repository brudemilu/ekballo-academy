/**
 * Extrai áudio de URL do YouTube e converte pra MP3.
 *
 * Stack: yt-dlp (binário, mantido pela comunidade — único confiável a longo
 * prazo) + ffmpeg-static (binário pré-compilado) + fluent-ffmpeg (API).
 *
 * O `youtube-dl-exec` npm package baixa o binário yt-dlp no install
 * (vai pra node_modules/youtube-dl-exec/bin/yt-dlp). Funciona em macOS
 * e Linux (Vercel).
 *
 * AVISO: roda em Node runtime (NÃO Edge — usa binários e child_process).
 *
 * AVISO: YouTube bloqueia IPs de datacenter (Vercel/AWS/GCP) com frequência
 * altíssima. Funciona quase sempre em rede residencial; pode falhar a maioria
 * das vezes em produção. Erro típico: "Sign in to confirm you're not a bot".
 */
import { spawn } from "node:child_process";
import { PassThrough } from "node:stream";
import ffmpeg from "fluent-ffmpeg";
import ffmpegStatic from "ffmpeg-static";
import { existsSync } from "node:fs";

/**
 * Localiza o binário yt-dlp.
 * Em desenvolvimento (Mac): assume `brew install yt-dlp` (binário standalone
 * em /opt/homebrew/bin/yt-dlp ou /usr/local/bin/yt-dlp).
 * Em produção (Vercel/Linux): seria preciso bundlar o binário standalone
 * Linux junto com o deploy — solução de produção a tratar separadamente.
 */
function resolveYtDlpPath(): string {
  if (process.env.YT_DLP_PATH) return process.env.YT_DLP_PATH;
  const candidatos = [
    "/opt/homebrew/bin/yt-dlp", // Apple Silicon
    "/usr/local/bin/yt-dlp",    // Intel Mac / Linux manual
    "/usr/bin/yt-dlp",          // Linux package manager
  ];
  for (const p of candidatos) {
    if (existsSync(p)) return p;
  }
  // Último recurso: assume que está no PATH
  return "yt-dlp";
}

const YT_DLP_PATH: string = resolveYtDlpPath();

if (ffmpegStatic) ffmpeg.setFfmpegPath(ffmpegStatic);

export type YouTubeMetadata = {
  videoId: string;
  title: string;
  author: string;
  durationSec: number;
  thumbnailUrl: string;
};

const USER_AGENT =
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36";

/**
 * Executa yt-dlp e devolve stdout completo (pra metadata em JSON).
 */
function runYtDlp(args: string[]): Promise<string> {
  return new Promise((resolve, reject) => {
    const proc = spawn(YT_DLP_PATH, [
      "--no-warnings",
      "--user-agent",
      USER_AGENT,
      ...args,
    ]);
    let stdout = "";
    let stderr = "";
    proc.stdout.on("data", (d) => (stdout += d.toString()));
    proc.stderr.on("data", (d) => (stderr += d.toString()));
    proc.on("error", reject);
    proc.on("close", (code) => {
      if (code !== 0) {
        const msg = stderr.split("\n").find((l) => l.startsWith("ERROR:"))?.replace("ERROR: ", "") || stderr.trim() || `yt-dlp saiu com código ${code}`;
        reject(new Error(msg));
      } else {
        resolve(stdout);
      }
    });
  });
}

export async function getYouTubeMetadata(url: string): Promise<YouTubeMetadata> {
  const stdout = await runYtDlp(["--dump-json", url]);
  const j = JSON.parse(stdout);
  return {
    videoId: String(j.id),
    title: String(j.title || "vídeo"),
    author: String(j.uploader || j.channel || "Desconhecido"),
    durationSec: Number(j.duration) || 0,
    thumbnailUrl: String(j.thumbnail || ""),
  };
}

/**
 * Baixa o melhor áudio via yt-dlp pra stdout, pipe pro ffmpeg que converte
 * pra MP3 128kbps. Devolve um stream Node que o caller pode passar pro
 * Response.
 */
export function baixarComoMp3Stream(url: string): NodeJS.ReadableStream {
  const ytdlp = spawn(YT_DLP_PATH, [
    "-f",
    "bestaudio",
    "-o",
    "-", // stdout
    "--no-progress",
    "--no-warnings",
    "--user-agent",
    USER_AGENT,
    url,
  ]);

  ytdlp.stderr.on("data", (d) => {
    const msg = d.toString().trim();
    if (msg) console.error("[yt-dlp]", msg);
  });

  const output = new PassThrough();

  ffmpeg(ytdlp.stdout)
    .audioBitrate(128)
    .audioCodec("libmp3lame")
    .format("mp3")
    .on("error", (err) => {
      ytdlp.kill("SIGTERM");
      output.destroy(err);
    })
    .pipe(output, { end: true });

  // Se yt-dlp morrer, fecha tudo
  ytdlp.on("close", (code) => {
    if (code !== 0 && !output.destroyed) {
      output.destroy(new Error(`yt-dlp saiu com código ${code}`));
    }
  });

  return output;
}

/**
 * Normaliza URLs de share do YouTube (mobile, youtu.be, shorts, embed).
 */
export function normalizarYouTubeUrl(input: string): string {
  const u = input.trim();
  if (!u) return u;

  try {
    const parsed = new URL(u);
    let id: string | null = null;

    if (parsed.hostname.includes("youtu.be")) {
      id = parsed.pathname.replace(/^\//, "");
    } else if (parsed.hostname.includes("youtube.com")) {
      if (parsed.pathname === "/watch") {
        id = parsed.searchParams.get("v");
      } else if (parsed.pathname.startsWith("/shorts/")) {
        id = parsed.pathname.replace("/shorts/", "");
      } else if (parsed.pathname.startsWith("/embed/")) {
        id = parsed.pathname.replace("/embed/", "");
      }
    }

    return id ? `https://www.youtube.com/watch?v=${id}` : u;
  } catch {
    return u;
  }
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
