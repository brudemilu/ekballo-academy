/**
 * Reel feito pela IA (issue #189): a partir de um roteiro, monta um vídeo
 * vertical com narração em voz sintética, o texto de cada bloco na tela no
 * tempo da fala e um vídeo de fundo. Ninguém grava nada.
 *
 * É a peça que o piloto automático publica sozinho. Não substitui o pastor
 * falando — é um formato a mais, e a tela diz que a voz é sintética.
 *
 * A parte pura (os tempos de cada bloco e o filtro do ffmpeg) fica em
 * `planejarReel` e `filtroDoReel`, testadas em testes/reel-narrado.test.ts. O
 * resto é rede e ffmpeg, exercitado de verdade no PR.
 */
import { spawn } from "node:child_process";
import { chmod, readFile, unlink, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import ffmpegStatic from "ffmpeg-static";
import { gerarMp3Leitura } from "@/lib/audio-leitura";
import { buscarVideoPexels } from "@/lib/pexels";
import type { Roteiro } from "@/lib/roteiro";
import { selfOrigin } from "@/lib/site-url";

/** Respiro entre um bloco falado e o seguinte, em segundos. */
const PAUSA = 0.35;
/** Silêncio no fim, para o vídeo não cortar seco na última palavra. */
const FOLGA_FINAL = 0.8;
/** O Instagram aceita Reel de até 90 s; acima disso a publicação falha. */
export const REEL_MAX_SEG = 90;
/** Mais que isto e a tela vira um parágrafo ilegível em vídeo. */
const TELA_MAX_CHARS = 60;

export type BlocoNarrado = {
  /** O que a voz diz. */
  falar: string;
  /** O que aparece escrito na tela enquanto ela diz. */
  tela: string;
};

export type TrechoReel = { inicio: number; fim: number };

/**
 * Do roteiro para os blocos do Reel: o texto da tela vem do campo "tela"; se
 * estiver vazio, usa o começo da fala. Texto longo é cortado na última
 * palavra inteira que cabe.
 */
export function blocosDoRoteiro(roteiro: Pick<Roteiro, "blocos">): BlocoNarrado[] {
  return roteiro.blocos
    .filter((b) => b.falar.trim())
    .map((b) => {
      const bruto = (b.tela || b.falar).trim().replace(/\s+/g, " ");
      let tela = bruto;
      if (bruto.length > TELA_MAX_CHARS) {
        const corte = bruto.slice(0, TELA_MAX_CHARS);
        tela = `${corte.slice(0, corte.lastIndexOf(" ") > 20 ? corte.lastIndexOf(" ") : TELA_MAX_CHARS).trim()}…`;
      }
      return { falar: b.falar.trim(), tela };
    });
}

/**
 * Quando cada bloco entra e sai, dado o tempo de fala de cada um. Devolve
 * também a duração total do vídeo.
 */
export function planejarReel(duracoes: number[]): {
  trechos: TrechoReel[];
  total: number;
} {
  const trechos: TrechoReel[] = [];
  let t = 0;
  for (const d of duracoes) {
    const fala = Math.max(0.5, d);
    trechos.push({ inicio: t, fim: t + fala });
    t += fala + PAUSA;
  }
  const total = trechos.length ? trechos[trechos.length - 1].fim + FOLGA_FINAL : 0;
  return { trechos, total: Math.round(total * 100) / 100 };
}

function n(v: number): string {
  return v.toFixed(2);
}

/**
 * O filter_complex do ffmpeg. Entradas, nesta ordem: 0 = fundo; 1..N = o PNG
 * do texto de cada bloco; N+1..2N = o MP3 de cada bloco.
 *
 *  - o fundo é cortado para 9:16, escurecido de leve (o texto é claro) e
 *    limitado à duração total;
 *  - cada texto aparece só durante a fala do seu bloco, com fade;
 *  - cada áudio é atrasado até o início do seu bloco e todos são somados.
 */
export function filtroDoReel(trechos: TrechoReel[], total: number): string {
  const N = trechos.length;
  const partes: string[] = [
    `[0:v]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,setsar=1,eq=brightness=-0.12,trim=0:${n(total)},setpts=PTS-STARTPTS[bg]`,
  ];

  trechos.forEach((t, i) => {
    const saida = Math.max(t.inicio + 0.3, t.fim - 0.25);
    partes.push(
      `[${i + 1}:v]format=rgba,fade=t=in:st=${n(t.inicio)}:d=0.3:alpha=1,fade=t=out:st=${n(saida)}:d=0.25:alpha=1[t${i}]`,
    );
  });

  let anterior = "bg";
  trechos.forEach((t, i) => {
    const rotulo = i === N - 1 ? "v" : `o${i}`;
    partes.push(
      `[${anterior}][t${i}]overlay=0:0:enable='between(t,${n(t.inicio)},${n(t.fim)})'[${rotulo}]`,
    );
    anterior = rotulo;
  });

  trechos.forEach((t, i) => {
    const ms = Math.round(t.inicio * 1000);
    partes.push(`[${N + 1 + i}:a]adelay=${ms}:all=1[a${i}]`);
  });
  const entradas = trechos.map((_, i) => `[a${i}]`).join("");
  // normalize=0: sem isso o amix divide o volume pelo número de entradas.
  // volume=1.5: a voz sintética sai baixa (pico em −6,5 dB no teste) para um vídeo de celular.
  partes.push(
    `${entradas}amix=inputs=${N}:duration=longest:normalize=0,volume=1.5,apad,atrim=0:${n(total)}[a]`,
  );

  return partes.join(";");
}

/** Lê "Duration: 00:00:05.23" da saída do ffmpeg. */
export function duracaoDaSaidaFfmpeg(stderr: string): number | null {
  const m = stderr.match(/Duration:\s*(\d+):(\d+):(\d+(?:\.\d+)?)/);
  if (!m) return null;
  return Number(m[1]) * 3600 + Number(m[2]) * 60 + Number(m[3]);
}

function ffmpeg(args: string[]): Promise<string> {
  return new Promise((resolve, reject) => {
    if (!ffmpegStatic) return reject(new Error("ffmpeg não encontrado no servidor"));
    const p = spawn(ffmpegStatic, args, { stdio: ["ignore", "ignore", "pipe"] });
    let saida = "";
    p.stderr.on("data", (d) => {
      saida = (saida + String(d)).slice(-8000);
    });
    p.on("error", reject);
    p.on("close", (codigo) => resolve(`${codigo === 0 ? "" : "FALHOU\n"}${saida}`));
  });
}

async function duracaoDoAudio(arquivo: string): Promise<number> {
  // `ffmpeg -i` sem saída "falha" de propósito, mas imprime a duração.
  const d = duracaoDaSaidaFfmpeg(await ffmpeg(["-hide_banner", "-i", arquivo]));
  if (!d) throw new Error("não consegui medir a narração");
  return d;
}

async function baixar(url: string, destino: string): Promise<void> {
  const res = await fetch(url, { signal: AbortSignal.timeout(60_000) });
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  await writeFile(destino, Buffer.from(await res.arrayBuffer()));
}

export type ReelMontado = {
  /** Caminho do MP4 em disco temporário. Quem chama é responsável por apagar. */
  arquivo: string;
  duracao: number;
  /** false = não achou vídeo de fundo e usou um fundo liso. */
  comVideoDeFundo: boolean;
};

/**
 * Monta o Reel em disco. Lança se o roteiro não couber num Reel ou se a
 * narração falhar; os temporários intermediários são apagados de qualquer jeito.
 */
export async function montarReelNarrado(
  roteiro: Pick<Roteiro, "blocos" | "titulo">,
  opcoes: { id: string; cena: string; seed?: number },
): Promise<ReelMontado> {
  const blocos = blocosDoRoteiro(roteiro).slice(0, 6);
  if (!blocos.length) throw new Error("o roteiro não tem o que narrar");

  const base = join(tmpdir(), `reel-${opcoes.id}`);
  const temporarios: string[] = [];
  const saida = `${base}.mp4`;
  if (ffmpegStatic) await chmod(ffmpegStatic, 0o755).catch(() => {});

  try {
    // 1) Narração, um bloco por vez (em sequência: muitas conexões seguidas
    //    ao serviço de voz são recusadas).
    const audios: string[] = [];
    const duracoes: number[] = [];
    for (let i = 0; i < blocos.length; i++) {
      const arquivo = `${base}-voz${i}.mp3`;
      await writeFile(arquivo, await gerarMp3Leitura(blocos[i].falar));
      temporarios.push(arquivo);
      audios.push(arquivo);
      duracoes.push(await duracaoDoAudio(arquivo));
    }

    const { trechos, total } = planejarReel(duracoes);
    if (total > REEL_MAX_SEG) {
      throw new Error(
        `a narração deu ${Math.round(total)}s e o Reel aceita no máximo ${REEL_MAX_SEG}s`,
      );
    }

    // 2) O texto de cada bloco, como PNG transparente (a mesma rota do Reel manual).
    const textos: string[] = [];
    for (let i = 0; i < blocos.length; i++) {
      const arquivo = `${base}-txt${i}.png`;
      await baixar(
        `${selfOrigin()}/api/og/reel-texto?verso=${encodeURIComponent(blocos[i].tela)}`,
        arquivo,
      );
      temporarios.push(arquivo);
      textos.push(arquivo);
    }

    // 3) Fundo: vídeo vertical que combine com a cena; sem ele, fundo liso.
    const fundo = `${base}-bg.mp4`;
    const urlFundo = await buscarVideoPexels(opcoes.cena, opcoes.seed ?? 1).catch(
      () => null,
    );
    let comVideoDeFundo = false;
    if (urlFundo) {
      try {
        await baixar(urlFundo, fundo);
        temporarios.push(fundo);
        comVideoDeFundo = true;
      } catch {
        // segue com o fundo liso
      }
    }

    const entradaFundo = comVideoDeFundo
      ? ["-stream_loop", "-1", "-i", fundo]
      : [
          "-f",
          "lavfi",
          "-i",
          `color=c=0x1B2A4A:s=1080x1920:r=30:d=${Math.ceil(total)}`,
        ];

    const resultado = await ffmpeg([
      "-y",
      "-hide_banner",
      ...entradaFundo,
      ...textos.flatMap((t) => ["-loop", "1", "-i", t]),
      ...audios.flatMap((a) => ["-i", a]),
      "-filter_complex",
      filtroDoReel(trechos, total),
      "-map",
      "[v]",
      "-map",
      "[a]",
      "-t",
      total.toFixed(2),
      "-r",
      "30",
      "-c:v",
      "libx264",
      "-preset",
      "veryfast",
      "-crf",
      "23",
      "-pix_fmt",
      "yuv420p",
      "-c:a",
      "aac",
      "-b:a",
      "128k",
      "-ar",
      "44100",
      "-movflags",
      "+faststart",
      saida,
    ]);
    if (resultado.startsWith("FALHOU"))
      throw new Error(`o ffmpeg não montou o vídeo: ${resultado.slice(-300)}`);

    return { arquivo: saida, duracao: total, comVideoDeFundo };
  } finally {
    await Promise.all(temporarios.map((t) => unlink(t).catch(() => {})));
  }
}

/** Lê o MP4 montado e apaga o arquivo. */
export async function lerEApagar(arquivo: string): Promise<Buffer> {
  try {
    return await readFile(arquivo);
  } finally {
    await unlink(arquivo).catch(() => {});
  }
}
