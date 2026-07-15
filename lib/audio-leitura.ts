// Geração de áudio de LEITURA (audiolivro) de uma aula, em JS puro (server).
// Usa msedge-tts (Microsoft Edge TTS — grátis, sem cota, vozes neurais pt-BR).
// Sem python, sem ffmpeg: cada pedaço já sai em MP3 e os MP3s são concatenados
// (spoken audio tolera concatenação de frames MP3). Chamada pelo worker
// /api/cron/gerar-audio-tick.

import { MsEdgeTTS, OUTPUT_FORMAT } from "msedge-tts";

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

// Sintetiza UM pedaço em MP3 (Buffer). O Edge fecha o stream no meio às vezes
// (rede/rate-limit) — retry com espera exponencial e SÓ aceita síntese completa
// (resolve no 'end'; 'close' antes do 'end' = falha → retenta).
async function ttsPedaco(texto: string, tentativas = 8): Promise<Buffer> {
  let ultimoErro: unknown;
  for (let t = 0; t < tentativas; t += 1) {
    try {
      const tts = new MsEdgeTTS();
      await tts.setMetadata(VOZ, OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);
      const { audioStream } = tts.toStream(texto, { rate: RATE });
      const buf = await new Promise<Buffer>((resolve, reject) => {
        const chunks: Buffer[] = [];
        let terminou = false;
        audioStream.on("data", (d: Buffer) => chunks.push(Buffer.from(d)));
        audioStream.on("end", () => {
          terminou = true;
          resolve(Buffer.concat(chunks));
        });
        audioStream.on("error", reject);
        audioStream.on("close", () => {
          if (!terminou) reject(new Error("stream fechou antes de terminar a síntese"));
        });
      });
      if (buf.length > 0) return buf;
      throw new Error("TTS retornou vazio");
    } catch (e) {
      ultimoErro = e;
      const msg = e instanceof Error ? e.message : String(e);
      console.warn(`[audio] pedaço falhou (tentativa ${t + 1}/${tentativas}): ${msg}`);
      if (t < tentativas - 1) {
        // espera longa e paciente (o "stream closed" é rate-limit do Edge):
        await new Promise((r) => setTimeout(r, Math.min(2000 * 2 ** t, 20000))); // 2,4,8,16,20,20,20s
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

export async function gerarMp3Leitura(conteudo: string): Promise<Buffer> {
  const pedacos = quebrarEmPedacos(conteudo);
  if (!pedacos.length) throw new Error("aula sem conteúdo para narrar");
  const partes: Buffer[] = new Array(pedacos.length);
  for (let inicio = 0; inicio < pedacos.length; inicio += CONCORRENCIA) {
    const lote = pedacos.slice(inicio, inicio + CONCORRENCIA);
    const bufs = await Promise.all(lote.map((p) => ttsPedaco(p)));
    bufs.forEach((b, k) => {
      partes[inicio + k] = b;
    });
    if (inicio + CONCORRENCIA < pedacos.length) await new Promise((r) => setTimeout(r, PAUSA_MS));
  }
  return Buffer.concat(partes);
}
