/**
 * PNG → JPEG para as imagens que vão ao Instagram (issue #238).
 *
 * A rota OG só sabe devolver PNG, e a foto com grão não comprime: cada imagem
 * sai com 2 a 3 MB. O Instagram baixa o arquivo dos servidores dele, longe do
 * nosso box, e desistiu no meio ("o download demorou demais") — o post de
 * 07/10/2026 não foi ao ar por isso. Em JPEG a mesma imagem fica com ~400 kB,
 * que é também o formato que a API de publicação pede.
 *
 * Usa o ffmpeg que o projeto já carrega (ffmpeg-static), sem biblioteca nova.
 * Só roda no runtime Node.
 */
import { spawn } from "node:child_process";
import { chmod } from "node:fs/promises";
import ffmpegStatic from "ffmpeg-static";

/** Os oito bytes que abrem todo PNG. */
export function ehPng(bytes: Uint8Array): boolean {
  const assinatura = [0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a];
  return bytes.length > 8 && assinatura.every((b, i) => bytes[i] === b);
}

/** Todo JPEG começa com FF D8 e termina com FF D9. */
export function ehJpeg(bytes: Uint8Array): boolean {
  return (
    bytes.length > 4 &&
    bytes[0] === 0xff &&
    bytes[1] === 0xd8 &&
    bytes[bytes.length - 2] === 0xff &&
    bytes[bytes.length - 1] === 0xd9
  );
}

const TEMPO_MAX_MS = 20_000;

/**
 * Converte um PNG em JPEG de alta qualidade. Lança se o ffmpeg faltar, falhar
 * ou devolver algo que não é um JPEG inteiro — quem chama decide o que fazer.
 */
export async function pngParaJpeg(png: Uint8Array): Promise<Uint8Array> {
  const bin = ffmpegStatic as unknown as string | null;
  if (!bin) throw new Error("ffmpeg indisponível");
  // No contêiner o binário pode chegar sem permissão de execução.
  await chmod(bin, 0o755).catch(() => {});
  return new Promise((resolve, reject) => {
    const p = spawn(bin, [
      "-loglevel",
      "error",
      "-f",
      "png_pipe",
      "-i",
      "pipe:0",
      "-frames:v",
      "1",
      // 2 é quase sem perda; o grão da foto continua grão, não vira bloco.
      "-q:v",
      "2",
      "-pix_fmt",
      "yuvj444p",
      "-f",
      "mjpeg",
      "pipe:1",
    ]);
    const pedacos: Buffer[] = [];
    let erro = "";
    const relogio = setTimeout(() => {
      p.kill("SIGKILL");
      reject(new Error("a conversão para JPEG demorou demais"));
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
      const jpeg = new Uint8Array(Buffer.concat(pedacos));
      if (codigo !== 0 || !ehJpeg(jpeg)) {
        reject(
          new Error(`ffmpeg não converteu a imagem: ${erro.trim().slice(0, 200)}`),
        );
        return;
      }
      resolve(jpeg);
    });
    // EPIPE aqui só repete o que o "close" já vai contar.
    p.stdin.on("error", () => {});
    p.stdin.end(Buffer.from(png));
  });
}
