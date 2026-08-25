// Geração de áudio de LEITURA (audiolivro) de uma aula, em JS puro (server).
// Usa msedge-tts (Microsoft Edge TTS — grátis, sem cota, vozes neurais pt-BR).
// Sem python, sem ffmpeg: cada pedaço já sai em MP3 e os MP3s são concatenados
// (spoken audio tolera concatenação de frames MP3). Chamada pelo worker
// /api/cron/gerar-audio-tick.

import { MsEdgeTTS, OUTPUT_FORMAT } from "msedge-tts";
import { createHash } from "crypto";
import { mkdir, readFile, writeFile, rm } from "fs/promises";
import { join } from "path";
import { tmpdir } from "os";

const VOZ = process.env.AUDIO_VOZ || "pt-BR-AntonioNeural"; // masc. pastoral
const RATE = process.env.AUDIO_RATE || "-6%"; // ritmo tranquilo de leitura
// Pedaços menores = síntese mais curta e confiável (o Edge fecha o stream em
// pedaços longos/sob carga com "Stream closed before the synthesis completed").
const MAX_CHARS = 1200;

// Quebra o conteúdo em pedaços (~MAX_CHARS) em fronteira de parágrafo/frase.
export function quebrarEmPedacos(conteudo: string): string[] {
  const paragrafos = conteudo
    .replace(/\r\n/g, "\n")
    .split(/\n{2,}/)
    .map((p) => p.trim())
    .filter(Boolean);

  const pedacos: string[] = [];
  let atual = "";
  const empurra = (t: string) => {
    if (t.trim()) pedacos.push(t.trim());
  };

  for (const par of paragrafos) {
    if (par.length > MAX_CHARS) {
      empurra(atual);
      atual = "";
      const frases = par.match(/[^.!?…]+[.!?…]+|\S+$/g) || [par];
      let buf = "";
      for (const fr of frases) {
        if ((buf + " " + fr).trim().length > MAX_CHARS) {
          empurra(buf);
          buf = fr;
        } else {
          buf = (buf + " " + fr).trim();
        }
      }
      empurra(buf);
    } else if ((atual + "\n\n" + par).trim().length > MAX_CHARS) {
      empurra(atual);
      atual = par;
    } else {
      atual = atual ? atual + "\n\n" + par : par;
    }
  }
  empurra(atual);
  return pedacos;
}

// O msedge-tts NÃO escapa o texto: ele interpola direto dentro do <speak>.
// Qualquer &, < ou > do livro produz um SSML inválido e o serviço fecha o
// stream — o pedaço falha SEMPRE, em todas as tentativas (não é rate-limit).
// Também tiramos os glifos-lixo que a extração de PDF gera nas versaletes
// (blocos Sinhala/Devanagari no lugar de nomes em small caps) e os caracteres
// de controle: seriam lidos como gibberish.
export function sanitizarParaSSML(texto: string): string {
  return (
    texto
      .replace(/[\u0900-\u097f\u0980-\u09ff\u0a00-\u0dff]+/g, " ")
      // eslint-disable-next-line no-control-regex
      .replace(/[\u0000-\u0008\u000b\u000c\u000e-\u001f]/g, " ")
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/[ \t]+/g, " ")
      .trim()
  );
}

// Sessão TTS reaproveitável: UMA conexão WebSocket para o capítulo inteiro.
// Abrir uma conexão por pedaço (~30 handshakes seguidos) é o que dispara o
// throttle do Edge — depois de ~20 pedaços ele passa a fechar todos os streams
// ("Stream closed before the synthesis completed") por vários minutos.
class SessaoTTS {
  private tts: MsEdgeTTS | null = null;

  async obter(): Promise<MsEdgeTTS> {
    if (this.tts) return this.tts;
    const t = new MsEdgeTTS();
    await t.setMetadata(VOZ, OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);
    this.tts = t;
    return t;
  }

  descartar(): void {
    try {
      this.tts?.close();
    } catch {
      /* já estava fechada */
    }
    this.tts = null;
  }
}

// Sintetiza UM pedaço em MP3 (Buffer). O Edge fecha o stream no meio às vezes
// (rede/throttle) — retry com espera exponencial, conexão nova a cada tentativa
// e SÓ aceita síntese completa (resolve no 'end'; 'close' antes do 'end' = falha).
const ESPERAS_MS = [
  3000, 6000, 12000, 25000, 45000, 60000, 60000, 60000, 60000,
];
const TIMEOUT_PEDACO_MS = 90_000;

async function ttsPedaco(
  texto: string,
  sessao: SessaoTTS,
  pulso?: () => void | Promise<void>,
): Promise<Buffer> {
  const limpo = sanitizarParaSSML(texto);
  if (!limpo) return Buffer.alloc(0);
  let ultimoErro: unknown;
  const tentativas = ESPERAS_MS.length + 1;
  for (let t = 0; t < tentativas; t += 1) {
    try {
      const tts = await sessao.obter();
      const { audioStream } = tts.toStream(limpo, { rate: RATE });
      const buf = await new Promise<Buffer>((resolve, reject) => {
        const chunks: Buffer[] = [];
        let terminou = false;
        const relogio = setTimeout(
          () => reject(new Error("timeout na síntese do pedaço")),
          TIMEOUT_PEDACO_MS,
        );
        const fim = (fn: () => void) => {
          clearTimeout(relogio);
          fn();
        };
        audioStream.on("data", (d: Buffer) => chunks.push(Buffer.from(d)));
        audioStream.on("end", () => {
          terminou = true;
          fim(() => resolve(Buffer.concat(chunks)));
        });
        audioStream.on("error", (e) => fim(() => reject(e)));
        audioStream.on("close", () => {
          if (!terminou)
            fim(() =>
              reject(new Error("stream fechou antes de terminar a síntese")),
            );
        });
      });
      if (buf.length > 0) return buf;
      throw new Error("TTS retornou vazio");
    } catch (e) {
      ultimoErro = e;
      const msg = e instanceof Error ? e.message : String(e);
      console.warn(
        `[audio] pedaço falhou (tentativa ${t + 1}/${tentativas}): ${msg}`,
      );
      // conexão suspeita → derruba e reabre na próxima tentativa
      sessao.descartar();
      if (t < tentativas - 1) {
        if (pulso) await pulso();
        await new Promise((r) => setTimeout(r, ESPERAS_MS[t]));
      }
    }
  }
  throw ultimoErro instanceof Error ? ultimoErro : new Error("falha no TTS");
}

// Gera o MP3 completo da leitura de uma aula (todos os pedaços concatenados).
// Concorrência de pedaços. Modo GENTIL (default 1 = um por vez) pra não
// provocar o rate-limit do Edge (que fecha os streams e bloqueia o IP). Dá pra
// subir via env AUDIO_CONCORRENCIA se um dia trocar de motor.
const CONCORRENCIA = Number(process.env.AUDIO_CONCORRENCIA || 1);
const PAUSA_MS = Number(process.env.AUDIO_PAUSA_MS || 400); // respiro entre pedaços
const CACHE_RAIZ = join(tmpdir(), "audio-leitura-cache");

const pedacoId = (texto: string) =>
  createHash("sha1").update(texto).digest("hex").slice(0, 12);

export type OpcoesLeitura = {
  // Chave de cache em disco (normalmente o id da aula). Com ela, os pedaços já
  // sintetizados sobrevivem a uma falha no meio do capítulo — o próximo tick
  // retoma de onde parou em vez de refazer tudo (capítulos têm 20-170 pedaços).
  cacheKey?: string;
  // Chamado a cada pedaço concluído. O worker usa pra renovar o lock (capítulo
  // grande passa de 30 min) e pra saber que houve avanço mesmo se falhar depois.
  aoAvancar?: (
    feitos: number,
    total: number,
    doCache: boolean,
  ) => void | Promise<void>;
  // Chamado entre as tentativas de um pedaço que está falhando (as esperas
  // chegam a 60s). Serve pro worker renovar o lock mesmo sem avanço.
  pulso?: () => void | Promise<void>;
};

// Limpa o cache de pedaços de uma aula (chamar quando o capítulo fecha).
export async function limparCacheLeitura(cacheKey: string): Promise<void> {
  await rm(join(CACHE_RAIZ, cacheKey), { recursive: true, force: true }).catch(
    () => {},
  );
}

export async function gerarMp3Leitura(
  conteudo: string,
  opcoes: OpcoesLeitura = {},
): Promise<Buffer> {
  const pedacos = quebrarEmPedacos(conteudo);
  if (!pedacos.length) throw new Error("aula sem conteúdo para narrar");

  const dirCache = opcoes.cacheKey ? join(CACHE_RAIZ, opcoes.cacheKey) : null;
  if (dirCache) await mkdir(dirCache, { recursive: true }).catch(() => {});
  const caminho = (i: number) =>
    join(
      dirCache!,
      `${String(i).padStart(4, "0")}-${pedacoId(pedacos[i])}.mp3`,
    );

  const partes: Buffer[] = new Array(pedacos.length);
  let feitos = 0;
  // UMA conexão para o capítulo inteiro (ver SessaoTTS).
  const sessao = new SessaoTTS();

  const registra = async (i: number, buf: Buffer, doCache: boolean) => {
    partes[i] = buf;
    feitos += 1;
    if (opcoes.aoAvancar)
      await opcoes.aoAvancar(feitos, pedacos.length, doCache);
  };

  try {
    for (let inicio = 0; inicio < pedacos.length; inicio += CONCORRENCIA) {
      const indices = [];
      for (
        let i = inicio;
        i < Math.min(inicio + CONCORRENCIA, pedacos.length);
        i += 1
      )
        indices.push(i);

      let sintetizou = false;
      for (const i of indices) {
        if (!dirCache) continue;
        const cacheado = await readFile(caminho(i)).catch(() => null);
        if (cacheado && cacheado.length > 0) await registra(i, cacheado, true);
      }

      const faltando = indices.filter((i) => !partes[i]);
      if (faltando.length) {
        sintetizou = true;
        const bufs = await Promise.all(
          faltando.map((i) => ttsPedaco(pedacos[i], sessao, opcoes.pulso)),
        );
        for (let k = 0; k < faltando.length; k += 1) {
          const i = faltando[k];
          if (dirCache) await writeFile(caminho(i), bufs[k]).catch(() => {});
          await registra(i, bufs[k], false);
        }
      }

      // Só respira entre pedaços que realmente foram ao TTS (cache é instantâneo).
      if (sintetizou && inicio + CONCORRENCIA < pedacos.length)
        await new Promise((r) => setTimeout(r, PAUSA_MS));
    }
  } finally {
    sessao.descartar();
  }

  return Buffer.concat(partes.filter((b) => b && b.length > 0));
}
