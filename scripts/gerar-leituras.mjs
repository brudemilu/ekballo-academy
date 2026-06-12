// Gera a LEITURA LITERAL (audiolivro) de cada aula e publica no Supabase
// Storage, gravando aulas.audio_leitura_url.
//
// Diferença para gerar-audios.mjs:
//   - audio_url        → "overview em podcast": 2 vozes RESUMINDO a aula.
//   - audio_leitura_url → LEITURA do texto: 1 voz lendo o `conteudo` palavra
//                         por palavra (para quem prefere OUVIR o que está
//                         escrito, em vez de ler).
//
// Pipeline por aula:
//   1) Quebra `conteudo` em pedaços (~1800 chars, em fronteira de parágrafo)
//      — o TTS tem limite de duração por requisição.
//   2) Gemini TTS (voz única, prebuilt) sintetiza cada pedaço em PCM 24kHz.
//   3) Concatena o PCM de todos os pedaços e empacota num único WAV.
//   4) Upload em materiais-cursos/audios-leitura/<aula_id>.wav.
//   5) UPDATE aulas.audio_leitura_url = 'audios-leitura/<aula_id>.wav'.
//
// Roda LOCALMENTE (offline). Não usa a Vercel.
//
// Requisitos de ambiente (carrega .env.local automaticamente se existir):
//   GEMINI_API_KEY              chave do Google AI Studio (com billing p/ volume)
//   SUPABASE_URL                https://yasfxwqomvhmxxqnunat.supabase.co
//   SUPABASE_SERVICE_ROLE_KEY   service_role (NÃO a anon)
//
// Uso:
//   node scripts/gerar-leituras.mjs                 # TODAS as temáticas (cursos publicados), pula as que já têm leitura
//   node scripts/gerar-leituras.mjs --force         # regera mesmo as que já têm
//   node scripts/gerar-leituras.mjs --slug=ego-transformado-keller   # só um curso
//   node scripts/gerar-leituras.mjs --dry           # gera só o WAV local, sem subir/gravar
//   VOZ_LEITURA=Sulafat node scripts/gerar-leituras.mjs   # troca a voz

import { createClient } from "@supabase/supabase-js";
import { mkdir, writeFile, readFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const OUT = join(here, "leituras-geradas");

// Carrega .env.local (KEY=VALUE simples) se as envs não estiverem no shell.
async function carregarEnvLocal() {
  try {
    const txt = await readFile(join(here, "..", ".env.local"), "utf8");
    for (const linha of txt.split("\n")) {
      const m = /^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/.exec(linha);
      if (!m) continue;
      const [, k, v] = m;
      if (process.env[k] === undefined) {
        process.env[k] = v.replace(/^["']|["']$/g, "");
      }
    }
  } catch {
    /* sem .env.local, segue com o que estiver no shell */
  }
}
await carregarEnvLocal();

const GEMINI_API_KEY = process.env.GEMINI_API_KEY;
const SUPABASE_URL = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL;
const SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

const TTS_MODEL = process.env.GEMINI_TTS_MODEL || "gemini-2.5-flash-preview-tts";
// Voz prebuilt do Gemini. "Sulafat" = quente/acolhedora; troque por VOZ_LEITURA.
const VOZ = process.env.VOZ_LEITURA || "Sulafat";

// Tamanho-alvo de cada pedaço enviado ao TTS. O modelo tem limite de duração
// de áudio por requisição; ~1800 chars de texto narrado cabem com folga.
const MAX_CHARS = Number(process.env.LEITURA_MAX_CHARS || 1800);
const MIN_CONTEUDO = 200; // aulas com conteúdo menor que isso são puladas

const args = process.argv.slice(2);
const FORCE = args.includes("--force");
const DRY = args.includes("--dry");
const slugArg = args.find((a) => a.startsWith("--slug="))?.split("=")[1];

if (!GEMINI_API_KEY) fail("Falta GEMINI_API_KEY no ambiente (ou no .env.local).");
if (!DRY && (!SUPABASE_URL || !SERVICE_KEY))
  fail("Falta SUPABASE_URL e/ou SUPABASE_SERVICE_ROLE_KEY (use --dry para testar sem subir).");

function fail(msg) {
  console.error("ERRO:", msg);
  process.exit(1);
}
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

// Cota DIÁRIA do free tier esgotada — não adianta insistir hoje.
class QuotaDiariaError extends Error {}

// POST ao Gemini com retry. (Cópia da lógica de gerar-audios.mjs.)
async function geminiPost(url, body, { tentativas = 6 } = {}) {
  let ultimo = "";
  for (let i = 0; i < tentativas; i++) {
    const res = await fetch(url, {
      method: "POST",
      headers: { "content-type": "application/json", "x-goog-api-key": GEMINI_API_KEY },
      body: JSON.stringify(body),
    });
    if (res.ok) return res.json();
    const txt = await res.text();
    if (res.status === 429 && /PerDay/i.test(txt)) {
      throw new QuotaDiariaError("cota diária do free tier esgotada");
    }
    ultimo = `HTTP ${res.status}: ${txt.slice(0, 160)}`;
    if ([429, 500, 503].includes(res.status) && i < tentativas - 1) {
      const m = /"retryDelay":\s*"(\d+(?:\.\d+)?)s"/.exec(txt);
      const espera = m ? Math.ceil(parseFloat(m[1]) * 1000) + 800 : 5000 * (i + 1);
      await sleep(Math.min(espera, 65000));
      continue;
    }
    break;
  }
  throw new Error(ultimo);
}

const supabase = DRY ? null : createClient(SUPABASE_URL, SERVICE_KEY, { auth: { persistSession: false } });

// ---------- Quebra o conteúdo em pedaços para o TTS ----------
function quebrarEmPedacos(conteudo) {
  const paragrafos = conteudo
    .replace(/\r\n/g, "\n")
    .split(/\n{2,}/)
    .map((p) => p.trim())
    .filter(Boolean);

  const pedacos = [];
  let atual = "";
  const empurra = (txt) => {
    if (txt) pedacos.push(txt);
  };

  for (const par of paragrafos) {
    // Parágrafo gigante: fatia por frases respeitando MAX_CHARS.
    if (par.length > MAX_CHARS) {
      empurra(atual);
      atual = "";
      const frases = par.match(/[^.!?…]+[.!?…]+|\S+$/g) || [par];
      let buf = "";
      for (const fr of frases) {
        if ((buf + " " + fr).trim().length > MAX_CHARS) {
          empurra(buf.trim());
          buf = fr;
        } else {
          buf = (buf + " " + fr).trim();
        }
      }
      empurra(buf.trim());
      continue;
    }
    if ((atual + "\n\n" + par).trim().length > MAX_CHARS) {
      empurra(atual);
      atual = par;
    } else {
      atual = (atual ? atual + "\n\n" : "") + par;
    }
  }
  empurra(atual);
  return pedacos;
}

// ---------- Gemini: TTS de leitura literal (voz única) ----------
async function lerPedacoPCM(texto) {
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${TTS_MODEL}:generateContent`;
  // O prefixo é DIREÇÃO de estilo (o TTS não o lê em voz alta) — mesmo
  // mecanismo usado em gerar-audios.mjs.
  const prompt = `Leia em português do Brasil, com voz pastoral, calma, clara e acolhedora, em ritmo tranquilo de leitura de livro. Leia exatamente o texto a seguir, sem comentar, resumir nem anunciar nada:\n\n${texto}`;
  const body = {
    contents: [{ parts: [{ text: prompt }] }],
    generationConfig: {
      responseModalities: ["AUDIO"],
      speechConfig: {
        voiceConfig: { prebuiltVoiceConfig: { voiceName: VOZ } },
      },
    },
  };
  // O TTS às vezes responde 200 SEM áudio — tenta de novo.
  for (let tent = 0; tent < 4; tent++) {
    const json = await geminiPost(url, body);
    const part = json?.candidates?.[0]?.content?.parts?.find((p) => p.inlineData?.data);
    if (part) {
      const rate = Number(/rate=(\d+)/.exec(part.inlineData.mimeType || "")?.[1]) || 24000;
      return { pcm: Buffer.from(part.inlineData.data, "base64"), rate };
    }
    await sleep(5000 * (tent + 1));
  }
  throw new Error("TTS não retornou áudio após várias tentativas (alta demanda)");
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
  if (!aula.conteudo || aula.conteudo.trim().length < MIN_CONTEUDO) {
    console.log("· pulando (sem conteúdo):", tag);
    return "skip";
  }
  if (aula.audio_leitura_url && !FORCE) {
    console.log("· já tem leitura, pulando:", tag);
    return "skip";
  }

  const pedacos = quebrarEmPedacos(aula.conteudo);
  console.log(`→ ${tag} — ${pedacos.length} pedaço(s), voz ${VOZ}`);

  const partes = [];
  let rate = 24000;
  for (let i = 0; i < pedacos.length; i++) {
    process.stdout.write(`   · sintetizando ${i + 1}/${pedacos.length}…\r`);
    const r = await lerPedacoPCM(pedacos[i]);
    partes.push(r.pcm);
    rate = r.rate;
    await sleep(1200); // respeita rate limit por minuto
  }
  const wav = pcmParaWav(Buffer.concat(partes), rate);

  await mkdir(OUT, { recursive: true });
  const local = join(OUT, `${slug}-${String(aula.ordem).padStart(2, "0")}.wav`);
  await writeFile(local, wav);
  console.log(`\n  wav: ${(wav.length / 1024 / 1024).toFixed(1)} MB → ${local}`);

  if (DRY) return "ok";

  const path = `audios-leitura/${aula.id}.wav`;
  const up = await supabase.storage
    .from("materiais-cursos")
    .upload(path, wav, { contentType: "audio/wav", upsert: true });
  if (up.error) throw new Error("upload: " + up.error.message);

  const upd = await supabase.from("aulas").update({ audio_leitura_url: path }).eq("id", aula.id);
  if (upd.error) throw new Error("update audio_leitura_url: " + upd.error.message);
  console.log("  ✓ publicado e gravado audio_leitura_url =", path);
  return "ok";
}

async function listarCursos() {
  if (slugArg) {
    const { data } = await supabase
      .from("cursos")
      .select("id,slug,titulo,external_path")
      .eq("slug", slugArg)
      .maybeSingle();
    return data ? [data] : [];
  }
  // TODAS as temáticas publicadas. Cursos com interface custom (external_path,
  // ex.: Bíblia) não têm `conteudo` em DB — são ignorados nas aulas.
  const { data } = await supabase
    .from("cursos")
    .select("id,slug,titulo,external_path")
    .eq("publicado", true)
    .order("ordem", { ascending: true });
  return data || [];
}

async function main() {
  if (DRY && !supabase) {
    return fail("--dry precisa ler as aulas do banco; configure SUPABASE_* e rode sem --dry, ou adapte para texto local.");
  }
  const cursos = await listarCursos();
  if (!cursos.length) return fail(slugArg ? `curso não encontrado: ${slugArg}` : "nenhum curso publicado encontrado");

  console.log(`Temáticas: ${cursos.map((c) => c.slug).join(", ")}\nVoz: ${VOZ}  Modelo: ${TTS_MODEL}\n`);
  let ok = 0, err = 0, skip = 0;

  for (const curso of cursos) {
    if (curso.external_path) {
      console.log(`\n=== ${curso.titulo} — interface custom (${curso.external_path}), pulando ===`);
      continue;
    }
    const { data: aulas } = await supabase
      .from("aulas")
      .select("id,titulo,conteudo,ordem,audio_leitura_url")
      .eq("curso_id", curso.id)
      .order("ordem", { ascending: true });
    console.log(`\n=== ${curso.titulo} — ${aulas?.length || 0} aulas ===`);

    for (const aula of aulas || []) {
      try {
        const r = await processarAula(curso.slug, aula);
        if (r === "ok") ok++;
        else skip++;
      } catch (e) {
        if (e instanceof QuotaDiariaError) {
          console.log(`\n⏸  Cota diária do Gemini TTS (free tier) esgotada. Pare por hoje e rode de novo amanhã —\n   o script pula as que já têm leitura e continua de onde parou. (geradas nesta rodada: ${ok})`);
          console.log(`\nFim. geradas=${ok} puladas=${skip} erros=${err}`);
          return;
        }
        err++;
        console.error("  ✗ ERRO:", e.message);
      }
      await sleep(1200);
    }
  }
  console.log(`\nFim. geradas=${ok} puladas=${skip} erros=${err}`);
}

main().catch((e) => fail(e.stack || e.message));
