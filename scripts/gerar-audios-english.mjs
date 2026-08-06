// =============================================================
// EKBALLO ENGLISH · Pré-geração dos áudios das lições
//
// POR QUE existe: o player usava speechSynthesis (a voz do próprio
// navegador). No iPhone as vozes do sistema são boas; no Chrome do
// computador sai uma voz compacta e ruim, e o aluno não entende a
// pronúncia — que é justamente o que ele veio aprender. Voz de
// referência num curso de idioma não pode depender do aparelho.
//
// Solução: gerar uma vez, com voz neural (Edge TTS, o mesmo motor
// dos audiolivros em português), e servir MP3 estático. Sai igual
// em todo lugar, funciona offline e não custa nada em runtime.
//
// Uso:
//   1) dump das frases:  (ver README abaixo)
//   2) node scripts/gerar-audios-english.mjs <arquivo.json>
//
// O JSON de entrada é [{ "texto": "Good morning" }, ...].
// Saída: public/english/audio/<slug>-<hash>.mp3 + o SQL que liga
// cada exercício ao seu arquivo (tmp/english-audio.sql).
// =============================================================

import { createHash } from "node:crypto";
import { mkdir, writeFile, readFile, access } from "node:fs/promises";
import { MsEdgeTTS, OUTPUT_FORMAT } from "msedge-tts";

// Voz de referência do curso. Aria é clara e neutra; para aula vale
// um pouco mais devagar que a fala natural, mas sem arrastar (o -6%
// mantém a prosódia; abaixo de -15% a voz neural começa a embolar).
const VOZ = process.env.ENGLISH_AUDIO_VOZ || "en-US-AriaNeural";
const RATE = process.env.ENGLISH_AUDIO_RATE || "-6%";

const DESTINO = "public/english/audio";

function slugDe(texto) {
  const base = texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-|-$/g, "")
    .slice(0, 40);
  // hash curto do texto exato: dois enunciados diferentes nunca colidem
  const hash = createHash("sha1").update(texto).digest("hex").slice(0, 6);
  return `${base || "audio"}-${hash}`;
}

async function existe(caminho) {
  try { await access(caminho); return true; } catch { return false; }
}

// Uma frase → MP3. O Edge fecha o stream no meio de vez em quando
// (rate-limit); só aceita síntese completa e retenta com espera.
async function sintetizar(texto, tentativas = 6) {
  let ultimoErro;
  for (let t = 0; t < tentativas; t += 1) {
    try {
      const tts = new MsEdgeTTS();
      await tts.setMetadata(VOZ, OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);
      const { audioStream } = tts.toStream(texto, { rate: RATE });
      const buf = await new Promise((resolve, reject) => {
        const pedacos = [];
        let terminou = false;
        audioStream.on("data", (d) => pedacos.push(Buffer.from(d)));
        audioStream.on("end", () => { terminou = true; resolve(Buffer.concat(pedacos)); });
        audioStream.on("error", reject);
        audioStream.on("close", () => {
          if (!terminou) reject(new Error("stream fechou antes de terminar"));
        });
      });
      if (buf.length > 0) return buf;
      throw new Error("TTS voltou vazio");
    } catch (e) {
      ultimoErro = e;
      console.warn(`  ! falhou (${t + 1}/${tentativas}): ${e.message}`);
      if (t < tentativas - 1) {
        await new Promise((r) => setTimeout(r, Math.min(1500 * 2 ** t, 15000)));
      }
    }
  }
  throw ultimoErro;
}

const entrada = process.argv[2];
if (!entrada) {
  console.error("uso: node scripts/gerar-audios-english.mjs <frases.json>");
  process.exit(1);
}

const frases = JSON.parse(await readFile(entrada, "utf8"));
await mkdir(DESTINO, { recursive: true });
await mkdir("tmp", { recursive: true });

console.log(`voz: ${VOZ} · rate: ${RATE} · ${frases.length} frases\n`);

const mapa = [];
let gerados = 0, reaproveitados = 0;

// Serial de propósito: o Edge TTS derruba a conexão sob rajada.
for (const [i, item] of frases.entries()) {
  const texto = item.texto;
  const slug = slugDe(texto);
  const caminho = `${DESTINO}/${slug}.mp3`;
  const posicao = `[${String(i + 1).padStart(2, "0")}/${frases.length}]`;

  if (await existe(caminho)) {
    console.log(`${posicao} = ${texto}`);
    reaproveitados += 1;
  } else {
    process.stdout.write(`${posicao} → ${texto} … `);
    const buf = await sintetizar(texto);
    await writeFile(caminho, buf);
    console.log(`${(buf.length / 1024).toFixed(0)} KB`);
    gerados += 1;
    await new Promise((r) => setTimeout(r, 400)); // respiro entre frases
  }
  mapa.push({ texto, url: `/english/audio/${slug}.mp3` });
}

// SQL que liga cada exercício ao seu arquivo, casando pelo texto exato.
const linhas = mapa.map(({ texto, url }) => {
  const t = texto.replace(/'/g, "''");
  return `update english_exercicios set audio_url = '${url}' where audio_texto = '${t}';`;
});

await writeFile(
  "tmp/english-audio.sql",
  `-- Gerado por scripts/gerar-audios-english.mjs (voz ${VOZ}, rate ${RATE}).\n` +
  `-- Liga cada exercício ao MP3 pré-gerado, casando pelo audio_texto.\n\n` +
  `alter table english_exercicios add column if not exists audio_url text;\n\n` +
  linhas.join("\n") + "\n",
);

console.log(`\ngerados: ${gerados} · reaproveitados: ${reaproveitados}`);
console.log("SQL: tmp/english-audio.sql");
