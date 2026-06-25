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
//   3) Concatena o PCM, empacota em WAV e converte para MP3 mono 64 kbps
//      (ffmpeg) — ~10x menor, leve para ouvir no celular.
//   4) Upload em materiais-cursos/audios-leitura/<aula_id>.mp3.
//   5) UPDATE aulas.audio_leitura_url = 'audios-leitura/<aula_id>.mp3'.
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
import { mkdir, writeFile, readFile, rm } from "node:fs/promises";
import { dirname, join } from "node:path";
import { tmpdir } from "node:os";
import { fileURLToPath } from "node:url";
import { spawn } from "node:child_process";
import ffmpegStatic from "ffmpeg-static";

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

// Backend de TTS. 'edge' (default) = Microsoft Edge TTS (edge-tts), GRÁTIS e
// sem cota diária — vozes neurais pt-BR. 'gemini' = Google Gemini TTS (free
// tier tem cota DIÁRIA baixa que não fecha aulas grandes; exige billing p/
// volume). Trocado p/ edge em 18/06/2026 porque o Blueprint (aulas grandes)
// nunca completava no free tier do Gemini.
const TTS_BACKEND = (process.env.TTS_BACKEND || "edge").toLowerCase();
const EDGE_BIN = process.env.EDGE_TTS_BIN || join(here, ".venv-tts", "bin", "edge-tts");
const EDGE_VOICE = process.env.EDGE_VOICE || "pt-BR-AntonioNeural"; // masc. pastoral
const EDGE_RATE = process.env.EDGE_RATE || "-6%"; // ritmo tranquilo de leitura
const VOZ_DISPLAY = TTS_BACKEND === "edge" ? EDGE_VOICE : VOZ;

// Tamanho-alvo de cada pedaço enviado ao TTS. O modelo tem limite de duração
// de áudio por requisição; ~1800 chars de texto narrado cabem com folga.
const MAX_CHARS = Number(process.env.LEITURA_MAX_CHARS || 1800);
const MIN_CONTEUDO = 200; // aulas com conteúdo menor que isso são puladas

const args = process.argv.slice(2);
const FORCE = args.includes("--force");
const DRY = args.includes("--dry");
const slugArg = args.find((a) => a.startsWith("--slug="))?.split("=")[1];

if (TTS_BACKEND === "gemini" && !GEMINI_API_KEY)
  fail("Falta GEMINI_API_KEY no ambiente (ou no .env.local).");
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
    let res;
    try {
      res = await fetch(url, {
        method: "POST",
        headers: { "content-type": "application/json", "x-goog-api-key": GEMINI_API_KEY },
        body: JSON.stringify(body),
        signal: AbortSignal.timeout(120000),
      });
    } catch (e) {
      // Erro de REDE (fetch failed / timeout / DNS) — não é HTTP. Acontece
      // quando o cron roda sem conexão (máquina dormindo às 9h). Tenta de
      // novo com backoff em vez de matar a aula inteira.
      ultimo = `rede: ${e?.message || e}`;
      if (i < tentativas - 1) {
        await sleep(Math.min(5000 * (i + 1), 65000));
        continue;
      }
      break;
    }
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

// WAV (Buffer) -> MP3 (Buffer) via ffmpeg-static. Mono 64 kbps é ótimo para
// fala e ~10x menor que o WAV — leve para ouvir no celular (dados móveis).
function wavParaMp3(wav) {
  const bin = ffmpegStatic;
  if (!bin) throw new Error("ffmpeg-static indisponível");
  return new Promise((resolve, reject) => {
    const args = ["-hide_banner", "-loglevel", "error", "-i", "pipe:0",
      "-vn", "-ac", "1", "-c:a", "libmp3lame", "-b:a", "64k", "-f", "mp3", "pipe:1"];
    const p = spawn(bin, args);
    const out = [];
    let err = "";
    p.stdout.on("data", (d) => out.push(d));
    p.stderr.on("data", (d) => (err += d));
    p.on("error", reject);
    p.on("close", (code) =>
      code === 0 ? resolve(Buffer.concat(out)) : reject(new Error(`ffmpeg ${code}: ${err.slice(-300)}`)));
    p.stdin.write(wav);
    p.stdin.end();
  });
}

// ---------- Edge TTS (edge-tts): voz neural pt-BR, grátis, sem cota ----------
function spawnP(bin, args, { input, timeoutMs = 0 } = {}) {
  return new Promise((resolve, reject) => {
    const p = spawn(bin, args);
    const out = [];
    let err = "";
    let timer = null;
    let morto = false;
    if (timeoutMs > 0) {
      timer = setTimeout(() => {
        morto = true;
        try { p.kill("SIGKILL"); } catch {}
        reject(new Error(`${bin} timeout após ${Math.round(timeoutMs / 1000)}s (processo travado, morto)`));
      }, timeoutMs);
    }
    p.stdout.on("data", (d) => out.push(d));
    p.stderr.on("data", (d) => (err += d));
    p.on("error", (e) => { if (timer) clearTimeout(timer); if (!morto) reject(e); });
    p.on("close", (code) => {
      if (timer) clearTimeout(timer);
      if (morto) return;
      code === 0 ? resolve(Buffer.concat(out)) : reject(new Error(`${bin} saiu ${code}: ${err.slice(-240)}`));
    });
    if (input != null) { p.stdin.write(input); p.stdin.end(); }
  });
}

// Sintetiza UM pedaço de texto em MP3 (arquivo) via edge-tts. Retry em erro
// de rede (o endpoint da Microsoft às vezes derruba o stream).
async function edgePedacoArquivo(texto, txtPath, mp3Path, { tentativas = 5 } = {}) {
  await writeFile(txtPath, texto, "utf8");
  let ultimo = "";
  for (let i = 0; i < tentativas; i++) {
    try {
      await spawnP(EDGE_BIN, [
        "--voice", EDGE_VOICE, "--rate", EDGE_RATE,
        "--file", txtPath, "--write-media", mp3Path,
      ], { timeoutMs: 90000 });
      const buf = await readFile(mp3Path);
      if (buf.length > 0) return;
      ultimo = "edge-tts gerou MP3 vazio";
    } catch (e) {
      ultimo = e?.message || String(e);
    }
    await sleep(Math.min(4000 * (i + 1), 30000));
  }
  throw new Error("edge-tts falhou: " + ultimo);
}

// Concatena os MP3 dos pedaços e re-encoda em MP3 mono 64 kbps (limpa headers
// e uniformiza) via ffmpeg, usando o demuxer concat.
async function concatMp3(arquivos, listPath, outPath, bitrate = "64k") {
  const lista = arquivos.map((f) => `file '${f.replace(/'/g, "'\\''")}'`).join("\n");
  await writeFile(listPath, lista, "utf8");
  await spawnP(ffmpegStatic, [
    "-hide_banner", "-loglevel", "error", "-f", "concat", "-safe", "0",
    "-i", listPath, "-vn", "-ac", "1", "-c:a", "libmp3lame", "-b:a", bitrate,
    "-f", "mp3", outPath,
  ]);
  return readFile(outPath);
}

// Gera o MP3 completo de uma aula com Edge TTS (pedaço a pedaço + concat).
async function sintetizarAulaEdge(slug, aula, pedacos) {
  const dir = join(tmpdir(), `leitura-${slug}-${aula.ordem}`);
  await mkdir(dir, { recursive: true });
  const mp3s = [];
  try {
    for (let i = 0; i < pedacos.length; i++) {
      process.stdout.write(`   · sintetizando ${i + 1}/${pedacos.length}…\r`);
      const txtPath = join(dir, `p${i}.txt`);
      const mp3Path = join(dir, `p${i}.mp3`);
      await edgePedacoArquivo(pedacos[i], txtPath, mp3Path);
      mp3s.push(mp3Path);
    }
    const lista = join(dir, "lista.txt");
    let buf = await concatMp3(mp3s, lista, join(dir, "final.mp3"), "64k");
    // Supabase limita upload a ~50MB. Aulas enormes (caps acadêmicos longos)
    // passam disso a 64k → re-encoda em bitrate menor até caber (voz aguenta).
    const LIMITE = 47 * 1024 * 1024;
    for (const br of ["32k", "24k"]) {
      if (buf.length <= LIMITE) break;
      console.log(`\n   · MP3 ${(buf.length / 1048576).toFixed(0)}MB > 47MB — re-encodando em ${br}`);
      buf = await concatMp3(mp3s, lista, join(dir, `final-${br}.mp3`), br);
    }
    return buf;
  } finally {
    await rm(dir, { recursive: true, force: true });
  }
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
  console.log(`→ ${tag} — ${pedacos.length} pedaço(s), voz ${VOZ_DISPLAY} (${TTS_BACKEND})`);

  let mp3;
  if (TTS_BACKEND === "edge") {
    mp3 = await sintetizarAulaEdge(slug, aula, pedacos);
  } else {
    const partes = [];
    let rate = 24000;
    for (let i = 0; i < pedacos.length; i++) {
      process.stdout.write(`   · sintetizando ${i + 1}/${pedacos.length}…\r`);
      const r = await lerPedacoPCM(pedacos[i]);
      partes.push(r.pcm);
      rate = r.rate;
      await sleep(1200); // respeita rate limit por minuto
    }
    mp3 = await wavParaMp3(pcmParaWav(Buffer.concat(partes), rate));
  }

  await mkdir(OUT, { recursive: true });
  const local = join(OUT, `${slug}-${String(aula.ordem).padStart(2, "0")}.mp3`);
  await writeFile(local, mp3);
  console.log(`\n  mp3: ${(mp3.length / 1024 / 1024).toFixed(1)} MB → ${local}`);

  if (DRY) return "ok";

  const path = `audios-leitura/${aula.id}.mp3`;
  const up = await supabase.storage
    .from("materiais-cursos")
    .upload(path, mp3, { contentType: "audio/mpeg", upsert: true });
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
  // Cursos de REFERÊNCIA (ex.: Comentário Moody, 66 aulas de 100k+ chars cada)
  // não recebem áudio — são consulta, não leitura devocional, e gerariam horas
  // de TTS por aula. Configurável via EXCLUI_AUDIO (slugs separados por vírgula).
  const exclui = new Set(
    (process.env.EXCLUI_AUDIO || "comentario-biblico-moody")
      .split(",").map((s) => s.trim()).filter(Boolean)
  );
  const cursos = (data || []).filter((c) => !exclui.has(c.slug));

  // Prioridade: como a cota DIÁRIA do Gemini TTS (free tier) esgota depois de
  // poucas aulas por rodada, os cursos listados em PRIORIDADE_LEITURA são
  // processados PRIMEIRO (na ordem informada), garantindo que recebam o áudio
  // antes da cota acabar. Default: blueprint-parach.
  const prioridade = (process.env.PRIORIDADE_LEITURA || "blueprint-parach")
    .split(",")
    .map((s) => s.trim())
    .filter(Boolean);
  const rank = (slug) => {
    const i = prioridade.indexOf(slug);
    return i === -1 ? prioridade.length : i;
  };
  cursos.sort((a, b) => rank(a.slug) - rank(b.slug));
  return cursos;
}

async function main() {
  if (DRY && !supabase) {
    return fail("--dry precisa ler as aulas do banco; configure SUPABASE_* e rode sem --dry, ou adapte para texto local.");
  }
  const cursos = await listarCursos();
  if (!cursos.length) return fail(slugArg ? `curso não encontrado: ${slugArg}` : "nenhum curso publicado encontrado");

  console.log(`Temáticas: ${cursos.map((c) => c.slug).join(", ")}\nBackend: ${TTS_BACKEND}  Voz: ${VOZ_DISPLAY}${TTS_BACKEND === "gemini" ? "  Modelo: " + TTS_MODEL : ""}\n`);
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
