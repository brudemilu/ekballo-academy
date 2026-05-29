// Gera o "overview em podcast" (estilo NotebookLM) de cada aula dos cursos de
// estudo e publica no Supabase Storage, gravando aulas.audio_url.
//
// Pipeline por aula:
//   1) Gemini (texto) gera um ROTEIRO de diálogo entre 2 apresentadores
//      (Ana e Beto) resumindo/recontando a aula em PT-BR (~5 min de fala).
//   2) Gemini TTS multi-speaker sintetiza o diálogo em 2 vozes (PCM 24kHz).
//   3) Empacota em WAV, salva uma cópia local e faz upload em
//      materiais-cursos/audios/<aula_id>.wav.
//   4) UPDATE aulas.audio_url = 'audios/<aula_id>.wav'.
//
// Roda LOCALMENTE (offline). Não usa a Vercel.
//
// Requisitos de ambiente (export antes de rodar):
//   GEMINI_API_KEY              chave do Google AI Studio (com billing)
//   SUPABASE_URL                https://yasfxwqomvhmxxqnunat.supabase.co
//   SUPABASE_SERVICE_ROLE_KEY   service_role (NÃO a anon) — pega no dashboard
//
// Uso:
//   node scripts/gerar-audios.mjs                 # os 3 cursos de estudo, pula os que já têm áudio
//   node scripts/gerar-audios.mjs --force         # regera mesmo os que já têm
//   node scripts/gerar-audios.mjs --slug=seja-um-lider-de-verdade   # só um curso
//   node scripts/gerar-audios.mjs --dry           # só gera o roteiro+wav local, sem subir/gravar

import { createClient } from "@supabase/supabase-js";
import { mkdir, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const OUT = join(here, "audios-gerados");

const GEMINI_API_KEY = process.env.GEMINI_API_KEY;
const SUPABASE_URL = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL;
const SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

const TEXT_MODEL = process.env.GEMINI_TEXT_MODEL || "gemini-2.5-flash";
const TTS_MODEL = process.env.GEMINI_TTS_MODEL || "gemini-2.5-flash-preview-tts";

// Apresentadores e vozes (vozes prebuilt do Gemini; trocáveis).
const HOSTS = { a: "Ana", b: "Beto" };
const VOICES = { Ana: process.env.VOZ_A || "Kore", Beto: process.env.VOZ_B || "Charon" };

const args = process.argv.slice(2);
const FORCE = args.includes("--force");
const DRY = args.includes("--dry");
const slugArg = args.find((a) => a.startsWith("--slug="))?.split("=")[1];
const SLUGS = slugArg
  ? [slugArg]
  : ["ego-transformado-keller", "olhe-para-jesus", "seja-um-lider-de-verdade"];

if (!GEMINI_API_KEY) fail("Falta GEMINI_API_KEY no ambiente.");
if (!DRY && (!SUPABASE_URL || !SERVICE_KEY))
  fail("Falta SUPABASE_URL e/ou SUPABASE_SERVICE_ROLE_KEY (use --dry para testar sem subir).");

function fail(msg) {
  console.error("ERRO:", msg);
  process.exit(1);
}
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

// Erro sinalizando que a cota DIÁRIA do free tier acabou — não adianta insistir hoje.
class QuotaDiariaError extends Error {}

// POST ao Gemini com retry em erros transitórios (500/503/429-de-rate).
// Em 429 de cota diária (FreeTier/PerDay), lança QuotaDiariaError para a rodada parar limpo.
async function geminiPost(url, body, { tentativas = 3 } = {}) {
  let ultimo = "";
  for (let i = 0; i < tentativas; i++) {
    const res = await fetch(url, {
      method: "POST",
      headers: { "content-type": "application/json", "x-goog-api-key": GEMINI_API_KEY },
      body: JSON.stringify(body),
    });
    if (res.ok) return res.json();
    const txt = await res.text();
    if (res.status === 429 && /PerDay|FreeTier|per day/i.test(txt)) {
      throw new QuotaDiariaError("cota diária do free tier esgotada");
    }
    ultimo = `HTTP ${res.status}: ${txt.slice(0, 200)}`;
    if ([429, 500, 503].includes(res.status) && i < tentativas - 1) {
      await sleep(3000 * (i + 1)); // backoff: 3s, 6s
      continue;
    }
    break;
  }
  throw new Error(ultimo);
}

const supabase = DRY ? null : createClient(SUPABASE_URL, SERVICE_KEY, { auth: { persistSession: false } });

// ---------- Gemini: roteiro ----------
async function gerarRoteiro(titulo, conteudo) {
  const prompt = `Você é roteirista de um podcast educativo cristão em português do Brasil.
Crie um diálogo curto e natural entre dois apresentadores, ${HOSTS.a} (mulher) e ${HOSTS.b} (homem),
que conversam sobre o capítulo abaixo de um curso de liderança/discipulado.

Regras:
- Comece com uma saudação curta e o nome do capítulo.
- É uma CONVERSA que RESUME e EXPLICA as ideias principais com as palavras de vocês
  (NÃO leia o texto literalmente; reconte). Tom acolhedor, leve, com exemplos rápidos.
- 12 a 18 falas no total, alternando ${HOSTS.a} e ${HOSTS.b}. Cada fala com 1 a 4 frases.
- Fechem com uma frase de aplicação prática e um convite para ler o capítulo completo.
- Saída APENAS no formato, uma fala por linha, sem markdown:
${HOSTS.a}: ...
${HOSTS.b}: ...

TÍTULO DO CAPÍTULO: ${titulo}

CONTEÚDO (base para o resumo):
${conteudo.slice(0, 12000)}`;

  const url = `https://generativelanguage.googleapis.com/v1beta/models/${TEXT_MODEL}:generateContent`;
  const json = await geminiPost(url, {
    contents: [{ role: "user", parts: [{ text: prompt }] }],
    generationConfig: { temperature: 0.9, maxOutputTokens: 2048 },
  });
  const txt = json?.candidates?.[0]?.content?.parts?.map((p) => p.text).join("") || "";
  // mantém só linhas "Ana:" / "Beto:"
  const linhas = txt
    .split("\n")
    .map((l) => l.trim())
    .filter((l) => new RegExp(`^(${HOSTS.a}|${HOSTS.b})\\s*:`, "i").test(l));
  if (linhas.length < 4) throw new Error("roteiro curto/!formato:\n" + txt.slice(0, 300));
  return linhas.join("\n");
}

// ---------- Gemini: TTS multi-speaker ----------
async function gerarAudioPCM(roteiro) {
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${TTS_MODEL}:generateContent`;
  const texto = `Leia como um podcast em português do Brasil, natural, animado e com boa dicção:\n\n${roteiro}`;
  const json = await geminiPost(url, {
    contents: [{ parts: [{ text: texto }] }],
    generationConfig: {
      responseModalities: ["AUDIO"],
      speechConfig: {
        multiSpeakerVoiceConfig: {
          speakerVoiceConfigs: [
            { speaker: HOSTS.a, voiceConfig: { prebuiltVoiceConfig: { voiceName: VOICES[HOSTS.a] } } },
            { speaker: HOSTS.b, voiceConfig: { prebuiltVoiceConfig: { voiceName: VOICES[HOSTS.b] } } },
          ],
        },
      },
    },
  });
  const part = json?.candidates?.[0]?.content?.parts?.find((p) => p.inlineData?.data);
  if (!part) throw new Error("TTS sem áudio: " + JSON.stringify(json).slice(0, 300));
  const rate = Number(/rate=(\d+)/.exec(part.inlineData.mimeType || "")?.[1]) || 24000;
  return { pcm: Buffer.from(part.inlineData.data, "base64"), rate };
}

// PCM s16le mono -> WAV
function pcmParaWav(pcm, sampleRate = 24000, channels = 1, bits = 16) {
  const blockAlign = (channels * bits) / 8;
  const byteRate = sampleRate * blockAlign;
  const h = Buffer.alloc(44);
  h.write("RIFF", 0);
  h.writeUInt32LE(36 + pcm.length, 4);
  h.write("WAVE", 8);
  h.write("fmt ", 12);
  h.writeUInt32LE(16, 16);
  h.writeUInt16LE(1, 20); // PCM
  h.writeUInt16LE(channels, 22);
  h.writeUInt32LE(sampleRate, 24);
  h.writeUInt32LE(byteRate, 28);
  h.writeUInt16LE(blockAlign, 32);
  h.writeUInt16LE(bits, 34);
  h.write("data", 36);
  h.writeUInt32LE(pcm.length, 40);
  return Buffer.concat([h, pcm]);
}

async function processarAula(slug, aula) {
  const tag = `[${slug} #${aula.ordem}] ${aula.titulo}`;
  if (!aula.conteudo || aula.conteudo.trim().length < 200) {
    console.log("· pulando (sem conteúdo):", tag);
    return;
  }
  if (aula.audio_url && !FORCE) {
    console.log("· já tem áudio, pulando:", tag);
    return;
  }
  console.log("→ gerando roteiro:", tag);
  const roteiro = await gerarRoteiro(aula.titulo, aula.conteudo);
  await sleep(800);
  console.log("→ sintetizando voz…");
  const { pcm, rate } = await gerarAudioPCM(roteiro);
  const wav = pcmParaWav(pcm, rate);

  await mkdir(OUT, { recursive: true });
  const local = join(OUT, `${slug}-${String(aula.ordem).padStart(2, "0")}.wav`);
  await writeFile(local, wav);
  await writeFile(local.replace(/\.wav$/, ".roteiro.txt"), roteiro);
  console.log(`  wav: ${(wav.length / 1024 / 1024).toFixed(1)} MB → ${local}`);

  if (DRY) return;

  const path = `audios/${aula.id}.wav`;
  const up = await supabase.storage
    .from("materiais-cursos")
    .upload(path, wav, { contentType: "audio/wav", upsert: true });
  if (up.error) throw new Error("upload: " + up.error.message);

  const upd = await supabase.from("aulas").update({ audio_url: path }).eq("id", aula.id);
  if (upd.error) throw new Error("update audio_url: " + upd.error.message);
  console.log("  ✓ publicado e gravado audio_url =", path);
}

async function main() {
  console.log(`Cursos: ${SLUGS.join(", ")}${DRY ? "  (DRY-RUN)" : ""}\n`);
  let ok = 0, err = 0, skip = 0;

  for (const slug of SLUGS) {
    let curso, aulas;
    if (DRY) {
      console.log(`!! DRY sem banco: não dá para ler aulas de '${slug}'. Use sem --dry para processar de verdade.`);
      continue;
    }
    ({ data: curso } = await supabase.from("cursos").select("id,titulo").eq("slug", slug).maybeSingle());
    if (!curso) { console.log(`!! curso não encontrado: ${slug} (confira o slug)`); continue; }
    ({ data: aulas } = await supabase
      .from("aulas")
      .select("id,titulo,conteudo,ordem,audio_url")
      .eq("curso_id", curso.id)
      .order("ordem", { ascending: true }));
    console.log(`\n=== ${curso.titulo} — ${aulas?.length || 0} aulas ===`);

    for (const aula of aulas || []) {
      try {
        const antes = aula.audio_url;
        await processarAula(slug, aula);
        if (!aula.conteudo || aula.conteudo.trim().length < 200) skip++;
        else if (antes && !FORCE) skip++;
        else ok++;
      } catch (e) {
        if (e instanceof QuotaDiariaError) {
          console.log(`\n⏸  Cota diária do free tier (10 áudios/dia) esgotada. Pare por hoje e rode de novo amanhã —\n   o script pula os que já têm áudio e continua de onde parou. (gerados nesta rodada: ${ok})`);
          console.log(`\nFim. gerados=${ok} pulados=${skip} erros=${err}`);
          return;
        }
        err++;
        console.error("  ✗ ERRO:", e.message);
      }
      await sleep(1200); // respeita rate limit
    }
  }
  console.log(`\nFim. gerados=${ok} pulados=${skip} erros=${err}`);
}

main().catch((e) => fail(e.stack || e.message));
