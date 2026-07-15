// Geração de áudio de LEITURA (audiolivro) de uma aula, em JS puro (server).
// Usa msedge-tts (Microsoft Edge TTS — grátis, sem cota, vozes neurais pt-BR).
// Sem python, sem ffmpeg: cada pedaço já sai em MP3 e os MP3s são concatenados
// (spoken audio tolera concatenação de frames MP3). Chamada pelo worker
// /api/cron/gerar-audio-tick.

import { MsEdgeTTS, OUTPUT_FORMAT } from "msedge-tts";

const VOZ = process.env.AUDIO_VOZ || "pt-BR-AntonioNeural"; // masc. pastoral
const RATE = process.env.AUDIO_RATE || "-6%"; // ritmo tranquilo de leitura
const MAX_CHARS = 1800; // limite por requisição do TTS

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

// Sintetiza UM pedaço em MP3 (Buffer). Retry em falha (o Edge às vezes fecha
// sem áudio).
async function ttsPedaco(texto: string, tentativas = 3): Promise<Buffer> {
  let ultimoErro: unknown;
  for (let t = 0; t < tentativas; t += 1) {
    try {
      const tts = new MsEdgeTTS();
      await tts.setMetadata(VOZ, OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);
      const { audioStream } = tts.toStream(texto, { rate: RATE });
      const chunks: Buffer[] = [];
      await new Promise<void>((resolve, reject) => {
        let feito = false;
        const fim = () => {
          if (!feito) {
            feito = true;
            resolve();
          }
        };
        audioStream.on("data", (d: Buffer) => chunks.push(Buffer.from(d)));
        audioStream.on("end", fim);
        audioStream.on("close", fim);
        audioStream.on("error", reject);
      });
      const buf = Buffer.concat(chunks);
      if (buf.length > 0) return buf;
      throw new Error("TTS retornou vazio");
    } catch (e) {
      ultimoErro = e;
      await new Promise((r) => setTimeout(r, 700 * (t + 1)));
    }
  }
  throw ultimoErro instanceof Error ? ultimoErro : new Error("falha no TTS");
}

// Gera o MP3 completo da leitura de uma aula (todos os pedaços concatenados).
export async function gerarMp3Leitura(conteudo: string): Promise<Buffer> {
  const pedacos = quebrarEmPedacos(conteudo);
  if (!pedacos.length) throw new Error("aula sem conteúdo para narrar");
  const partes: Buffer[] = [];
  for (const p of pedacos) {
    partes.push(await ttsPedaco(p)); // sequencial: não martela o serviço
  }
  return Buffer.concat(partes);
}
