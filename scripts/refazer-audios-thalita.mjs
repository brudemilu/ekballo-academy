// Refaz a leitura em áudio, na voz nova (Thalita), APENAS das aulas que já
// possuem áudio hoje no banco de PRODUÇÃO (o box).
//
// Por que só essas: os livros sem áudio nenhum ficam para o gerador sob
// demanda do próprio app (botão "🎧 Gerar áudio do livro"). Em livro com
// áudio parcial, refazemos exatamente as aulas que têm áudio — completar as
// que faltam seria ampliar o escopo por conta própria.
//
// É idempotente: anota cada aula concluída em .refazer-thalita-feitas.txt,
// então pode ser interrompido e retomado sem repetir trabalho.
//
// Uso: node scripts/refazer-audios-thalita.mjs [--pular=slug1,slug2]
import { createClient } from "@supabase/supabase-js";
import { readFile, writeFile, appendFile } from "node:fs/promises";
import { spawn } from "node:child_process";

async function carregarEnv(arq) {
  try {
    const txt = await readFile(arq, "utf8");
    for (const l of txt.split("\n")) {
      const m = /^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/.exec(l);
      if (m && process.env[m[1]] === undefined) process.env[m[1]] = m[2].replace(/^["']|["']$/g, "");
    }
  } catch {}
}
await carregarEnv("./.env.box");
await carregarEnv("./.env.local");

const MARCADOR = "./scripts/.refazer-thalita-feitas.txt";
const pular = new Set((process.argv.find((a) => a.startsWith("--pular="))?.split("=")[1] || "").split(",").filter(Boolean));

const sb = createClient(
  process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false } },
);

const cursos = new Map();
for (const c of (await sb.from("cursos").select("id,slug,titulo")).data) cursos.set(c.id, c);

let from = 0;
const alvos = [];
while (true) {
  const { data, error } = await sb.from("aulas").select("curso_id,ordem,audio_leitura_url").range(from, from + 999);
  if (error) throw new Error(error.message);
  if (!data?.length) break;
  for (const a of data) {
    if (!a.audio_leitura_url) continue;
    const c = cursos.get(a.curso_id);
    if (!c || pular.has(c.slug)) continue;
    alvos.push({ slug: c.slug, ordem: a.ordem });
  }
  from += 1000;
  if (data.length < 1000) break;
}
alvos.sort((a, b) => (a.slug === b.slug ? a.ordem - b.ordem : a.slug.localeCompare(b.slug)));

let feitas = new Set();
try { feitas = new Set((await readFile(MARCADOR, "utf8")).split("\n").filter(Boolean)); } catch {}

const pendentes = alvos.filter((a) => !feitas.has(`${a.slug}#${a.ordem}`));
console.log(`alvos: ${alvos.length} aulas | já feitas: ${alvos.length - pendentes.length} | pendentes: ${pendentes.length}`);

function rodar(slug, ordem) {
  return new Promise((resolve) => {
    const p = spawn("./scripts/gerar-leituras-box.sh", [`--slug=${slug}`, `--aula=${ordem}`, "--force"], { stdio: ["ignore", "pipe", "pipe"] });
    let saida = "";
    p.stdout.on("data", (d) => (saida += d));
    p.stderr.on("data", (d) => (saida += d));
    p.on("close", () => resolve({ ok: /✓ publicado/.test(saida), saida }));
  });
}

let ok = 0, falhas = 0;
for (const [i, a] of pendentes.entries()) {
  process.stdout.write(`[${i + 1}/${pendentes.length}] ${a.slug} #${a.ordem} … `);
  const r = await rodar(a.slug, a.ordem);
  if (r.ok) {
    ok++;
    await appendFile(MARCADOR, `${a.slug}#${a.ordem}\n`);
    console.log("ok");
  } else {
    falhas++;
    console.log("FALHOU");
    console.log(r.saida.split("\n").filter((l) => /ERRO|falhou|Error/.test(l)).slice(0, 3).join("\n"));
  }
}
console.log(`\nFim. ok=${ok} falhas=${falhas}`);
