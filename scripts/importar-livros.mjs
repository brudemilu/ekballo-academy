// Insere livros a partir dos JSONs em tmp/livros/<slug>.json via service role.
// Uso:  node scripts/importar-livros.mjs slug1 slug2 ...
// Sem args, importa todos os JSONs da pasta.
// Idempotente: cria o curso se não existir, senão atualiza; pula aulas já existentes por ordem.

import { readFileSync, readdirSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

const env = Object.fromEntries(
  readFileSync(new URL("../.env.local", import.meta.url), "utf8")
    .split("\n")
    .filter((l) => l.includes("=") && !l.trim().startsWith("#"))
    .map((l) => {
      const i = l.indexOf("=");
      return [l.slice(0, i).trim(), l.slice(i + 1).trim()];
    })
);
const url = env.NEXT_PUBLIC_SUPABASE_URL;
const key = env.SUPABASE_SERVICE_ROLE_KEY;
if (!url || !key) throw new Error("Faltam envs no .env.local");
const db = createClient(url, key, { auth: { persistSession: false } });

const dir = new URL("../tmp/livros/", import.meta.url);
const args = process.argv.slice(2);
const slugs = args.length
  ? args
  : readdirSync(dir).filter((f) => f.endsWith(".json")).map((f) => f.replace(/\.json$/, ""));

function descricao(d) {
  const n = d.aulas.length;
  const de = d.autor ? `, de ${d.autor}` : "";
  return `Leitura guiada de ${d.titulo}${de}. Em ${n} ${n === 1 ? "aula" : "aulas"}, com a transcrição do texto para ler e ouvir. Cada aula traz o conteúdo do capítulo, sem perguntas de reflexão.`;
}

for (const slug of slugs) {
  const d = JSON.parse(readFileSync(new URL(`${slug}.json`, dir), "utf8"));
  let { data: curso } = await db.from("cursos").select("id").eq("slug", slug).maybeSingle();
  const campos = {
    titulo: d.titulo,
    descricao: descricao(d),
    imagem_url: d.capa,
    categoria: d.categoria,
    publicado: true,
  };
  if (!curso) {
    const { data: max } = await db.from("cursos").select("ordem").order("ordem", { ascending: false }).limit(1).maybeSingle();
    const nextOrdem = (max?.ordem ?? 0) + 1;
    const { data, error } = await db
      .from("cursos")
      .insert({ slug, ...campos, is_pago: false, preco_centavos: 0, ordem: nextOrdem })
      .select("id")
      .single();
    if (error) throw error;
    curso = data;
    console.log(`✓ criado: ${slug} (ordem ${nextOrdem})  ${d.aulas.length} aulas`);
  } else {
    const { error } = await db.from("cursos").update(campos).eq("id", curso.id);
    if (error) throw error;
    console.log(`• atualizado: ${slug}  ${d.aulas.length} aulas`);
  }
  for (const a of d.aulas) {
    const { data: aula } = await db.from("aulas").select("id").eq("curso_id", curso.id).eq("ordem", a.ordem).maybeSingle();
    if (aula) continue;
    // Postgres não aceita byte NULL nem caracteres de controle em text; limpa antes.
    const conteudo = a.conteudo.replace(/[\u0000-\u0008\u000b\u000c\u000e-\u001f]/g, "");
    const { error } = await db
      .from("aulas")
      .insert({ curso_id: curso.id, titulo: a.titulo, ordem: a.ordem, conteudo });
    if (error) throw error;
  }
}
console.log("\nConcluído.");
