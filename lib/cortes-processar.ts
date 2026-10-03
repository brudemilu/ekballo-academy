/**
 * O trabalho pesado dos cortes de pregação (issue #189): do link do YouTube
 * aos momentos escolhidos. Roda em segundo plano, fora da requisição — ver
 * app/api/admin/instagram/cortes/route.ts.
 *
 *   1. converte o vídeo em MP3 (o mesmo serviço do /admin/youtube);
 *   2. baixa o MP3 e reduz para voz (mono, 16 kHz, 32 kbps) com ffmpeg — uma
 *      hora cabe em ~14 MB, abaixo do teto de 25 MB do Groq;
 *   3. transcreve com o Whisper do Groq, pedindo os tempos de cada trecho;
 *   4. pede à IA os melhores momentos e confere os tempos que ela devolveu.
 *
 * O áudio vive só em arquivo temporário e é apagado no fim; o que fica no
 * banco é a transcrição e os momentos.
 */
import { spawn } from "node:child_process";
import { chmod, readFile, unlink, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import ffmpegStatic from "ffmpeg-static";
import { contextoDoPerfil } from "@/lib/conteudo-perfil";
import {
  limparSegmentos,
  normalizarMomentos,
  type Segmento,
  systemCortes,
  transcricaoParaIA,
} from "@/lib/cortes";
import { atualizarCorteConteudo, getPerfilConteudo } from "@/lib/db";
import { chamarLLM } from "@/lib/llm";
import { converterParaMp3 } from "@/lib/youtube";

const GROQ_TRANSCRICAO = "https://api.groq.com/openai/v1/audio/transcriptions";
// O v3 completo entende português melhor que o turbo, e aqui ninguém espera
// em tempo real: o trabalho já roda em segundo plano.
const MODELO_WHISPER = process.env.GROQ_WHISPER_CORTES_MODEL || "whisper-large-v3";

// Teto de áudio por análise. 100 min a 32 kbps dão ~24 MB (o Groq aceita 25),
// e a cota grátis do Groq é de 2 horas de áudio por hora.
export const MAX_MINUTOS = 100;

function rodarFfmpeg(args: string[]): Promise<void> {
  return new Promise((resolve, reject) => {
    if (!ffmpegStatic) return reject(new Error("ffmpeg não encontrado no servidor"));
    const p = spawn(ffmpegStatic, args, { stdio: ["ignore", "ignore", "pipe"] });
    let erro = "";
    p.stderr.on("data", (d) => {
      erro = (erro + String(d)).slice(-600);
    });
    p.on("error", reject);
    p.on("close", (codigo) =>
      codigo === 0
        ? resolve()
        : reject(new Error(`ffmpeg falhou: ${erro.slice(-300)}`)),
    );
  });
}

async function baixar(url: string, destino: string): Promise<void> {
  let ultimo: unknown;
  for (let tentativa = 0; tentativa < 3; tentativa++) {
    try {
      const res = await fetch(url, { signal: AbortSignal.timeout(120_000) });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      await writeFile(destino, Buffer.from(await res.arrayBuffer()));
      return;
    } catch (e) {
      ultimo = e;
    }
  }
  throw new Error(
    `não consegui baixar o áudio (${ultimo instanceof Error ? ultimo.message : "erro"})`,
  );
}

async function transcrever(arquivo: string): Promise<Segmento[]> {
  const chave = process.env.GROQ_API_KEY;
  if (!chave)
    throw new Error("A transcrição não está configurada (falta GROQ_API_KEY).");

  const form = new FormData();
  form.append(
    "file",
    new Blob([new Uint8Array(await readFile(arquivo))], { type: "audio/mpeg" }),
    "pregacao.mp3",
  );
  form.append("model", MODELO_WHISPER);
  form.append("language", "pt");
  form.append("response_format", "verbose_json");
  form.append("timestamp_granularities[]", "segment");
  form.append("temperature", "0");

  const res = await fetch(GROQ_TRANSCRICAO, {
    method: "POST",
    headers: { Authorization: `Bearer ${chave}` },
    body: form,
    signal: AbortSignal.timeout(300_000),
  });
  if (res.status === 429) {
    throw new Error(
      "A cota grátis de transcrição desta hora acabou. Tente de novo daqui a uma hora.",
    );
  }
  if (!res.ok)
    throw new Error(
      `A transcrição falhou (${res.status}): ${(await res.text()).slice(0, 200)}`,
    );

  const segmentos = limparSegmentos(
    ((await res.json()) as { segments?: unknown }).segments,
  );
  if (!segmentos.length) throw new Error("Não consegui entender a fala do vídeo.");
  return segmentos;
}

/**
 * O conversor responde "ainda convertendo" por bastante tempo num vídeo longo,
 * e `converterParaMp3` desiste em ~18 s (o bastante para o download manual do
 * /admin/youtube). Aqui ninguém está esperando na tela: insiste por uns 4 min.
 */
async function converterComPaciencia(videoId: string) {
  let ultimo: unknown;
  for (let tentativa = 0; tentativa < 12; tentativa++) {
    try {
      return await converterParaMp3(videoId);
    } catch (e) {
      ultimo = e;
      // Só vale insistir quando o serviço ainda está trabalhando.
      if (!(e instanceof Error) || !e.message.includes("demorou demais")) throw e;
    }
  }
  throw ultimo;
}

/** Processa uma análise do começo ao fim, registrando o andamento. Nunca lança. */
export async function processarCorte(id: string, videoId: string): Promise<void> {
  const base = join(tmpdir(), `corte-${id}`);
  const original = `${base}-orig.mp3`;
  const reduzido = `${base}-voz.mp3`;
  const etapa = (texto: string) =>
    atualizarCorteConteudo(id, { etapa: texto }).catch(() => {});

  try {
    await etapa("Buscando o áudio do vídeo…");
    const video = await converterComPaciencia(videoId);
    await atualizarCorteConteudo(id, {
      titulo: video.title,
      duracao_seg: Math.round(video.durationSec),
    });

    await etapa("Baixando o áudio…");
    await baixar(video.link, original);

    await etapa("Preparando o áudio…");
    if (ffmpegStatic) await chmod(ffmpegStatic, 0o755).catch(() => {});
    await rodarFfmpeg([
      "-y",
      "-i",
      original,
      "-vn",
      "-ac",
      "1",
      "-ar",
      "16000",
      "-b:a",
      "32k",
      "-t",
      String(MAX_MINUTOS * 60),
      reduzido,
    ]);

    await etapa("Transcrevendo a pregação…");
    const transcricao = await transcrever(reduzido);
    await atualizarCorteConteudo(id, { transcricao });

    await etapa("Escolhendo os melhores momentos…");
    const perfil = await getPerfilConteudo().catch(() => null);
    const bruto = await chamarLLM(
      systemCortes(perfil ? contextoDoPerfil(perfil) : ""),
      `VÍDEO: ${video.title}\n\nTRANSCRIÇÃO:\n${transcricaoParaIA(transcricao)}`,
      6000,
      120_000,
    );
    const momentos = normalizarMomentos(bruto, transcricao);

    await atualizarCorteConteudo(id, {
      status: "pronto",
      etapa: "",
      erro: null,
      momentos,
    });
  } catch (e) {
    await atualizarCorteConteudo(id, {
      status: "erro",
      etapa: "",
      erro: e instanceof Error ? e.message : "Falha ao analisar o vídeo.",
    }).catch(() => {});
  } finally {
    await Promise.all([
      unlink(original).catch(() => {}),
      unlink(reduzido).catch(() => {}),
    ]);
  }
}
