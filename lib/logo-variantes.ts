/**
 * Prepara a logo de uma conta para as artes (issue #264): sempre em PNG, com
 * o fundo transparente que ela tiver, e em duas versões —
 *
 *  - a original, para as artes de fundo claro;
 *  - a "clara", para as de fundo escuro ou com foto: o que é escuro na logo
 *    (azul-marinho, preto) vira branco, e o que é cor viva continua como é.
 *    Sem ela, uma logo escura some em cima de uma foto.
 *
 * Usa o ffmpeg que o projeto já carrega (ffmpeg-static), como lib/imagem-jpeg.
 * Só roda no runtime Node.
 */
import { spawn } from "node:child_process";
import { chmod } from "node:fs/promises";
import ffmpegStatic from "ffmpeg-static";
import { ehPng } from "@/lib/imagem-jpeg";

const TEMPO_MAX_MS = 20_000;
/** A logo ocupa uns 170 px na arte; isto sobra, sem pesar em cada desenho. */
const LARGURA_MAX = 640;
/** Abaixo disso nos três canais, o ponto é "escuro" e clareia. O vermelho da logo fica. */
const LIMITE_ESCURO = 120;

const REDUZIR = `scale='min(${LARGURA_MAX},iw)':-1:flags=lanczos`;
const ESCURO = `lt(max(max(r(X,Y),g(X,Y)),b(X,Y)),${LIMITE_ESCURO})`;
const CLAREAR = `geq=r='if(${ESCURO},255,r(X,Y))':g='if(${ESCURO},255,g(X,Y))':b='if(${ESCURO},255,b(X,Y))':a='alpha(X,Y)'`;

async function ffmpegParaPng(entrada: Uint8Array, filtro: string): Promise<Uint8Array> {
  const bin = ffmpegStatic as unknown as string | null;
  if (!bin) throw new Error("ffmpeg indisponível");
  // No contêiner o binário pode chegar sem permissão de execução.
  await chmod(bin, 0o755).catch(() => {});
  return new Promise((resolve, reject) => {
    const p = spawn(bin, [
      "-loglevel",
      "error",
      "-i",
      "pipe:0",
      "-frames:v",
      "1",
      "-vf",
      filtro,
      "-pix_fmt",
      "rgba",
      "-f",
      "image2pipe",
      "-c:v",
      "png",
      "pipe:1",
    ]);
    const pedacos: Buffer[] = [];
    let erro = "";
    const relogio = setTimeout(() => {
      p.kill("SIGKILL");
      reject(new Error("o preparo da logo demorou demais"));
    }, TEMPO_MAX_MS);
    p.stdout.on("data", (d: Buffer) => pedacos.push(d));
    p.stderr.on("data", (d: Buffer) => {
      erro += d.toString();
    });
    p.on("error", (e) => {
      clearTimeout(relogio);
      reject(e);
    });
    p.on("close", (codigo) => {
      clearTimeout(relogio);
      const png = new Uint8Array(Buffer.concat(pedacos));
      if (codigo !== 0 || !ehPng(png)) {
        reject(new Error(`não consegui ler essa imagem: ${erro.trim().slice(0, 200)}`));
        return;
      }
      resolve(png);
    });
    // EPIPE aqui só repete o que o "close" já vai contar.
    p.stdin.on("error", () => {});
    p.stdin.end(Buffer.from(entrada));
  });
}

export type LogoPreparada = { normal: Uint8Array; clara: Uint8Array };

/** Recebe PNG ou JPG e devolve as duas versões, em PNG. Lança se não for imagem. */
export async function prepararLogo(arquivo: Uint8Array): Promise<LogoPreparada> {
  const [normal, clara] = await Promise.all([
    ffmpegParaPng(arquivo, `format=rgba,${REDUZIR}`),
    ffmpegParaPng(arquivo, `format=rgba,${REDUZIR},${CLAREAR}`),
  ]);
  return { normal, clara };
}
