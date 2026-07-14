// Aplica a migration 191 (Curso "Como se tornar um cristão inútil") via service role.
//
//   node scripts/apply-191-cristao-inutil.mjs
//
// Lê o .sql como fonte da verdade: faz o parse do curso e das 10 aulas.
// Não cria atividades/perguntas.

import { readFileSync } from "node:fs";
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
if (!url || !key) throw new Error("Faltam NEXT_PUBLIC_SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY no .env.local");
const db = createClient(url, key, { auth: { persistSession: false } });

const sql = readFileSync(new URL("../supabase/migrations/191_curso_cristao_inutil.sql", import.meta.url), "utf8");

const CURSO = {
  slug: "cristao-inutil",
  titulo: "Como se tornar um cristão inútil",
  descricao: (sql.match(/\$desc\$([\s\S]*?)\$desc\$/) || [])[1],
  imagem_url: "capas/cristao-inutil.jpg",
  categoria: "ensino",
};
if (!CURSO.descricao) throw new Error("Não consegui extrair a descrição do curso do .sql");

const blocks = sql.split(/\n\s*select id into v_aula_id from public\.aulas/).slice(1);
const aulas = blocks.map((b) => {
  const ordem = Number((b.match(/and ordem = (\d+)/) || [])[1]);
  const titulo = (b.match(/\$t\$([\s\S]*?)\$t\$/) || [])[1];
  const conteudo = (b.match(/\$conteudo\$([\s\S]*?)\$conteudo\$/) || [])[1];
  if (!ordem || !titulo || conteudo == null) throw new Error(`Bloco mal-parseado (ordem=${ordem}, titulo=${titulo})`);
  return { ordem, titulo, conteudo: conteudo.replace(/^\n/, "").replace(/\n$/, "") };
});
if (aulas.length !== 10) throw new Error(`Esperava 10 aulas, achei ${aulas.length}`);

async function main() {
  let { data: curso } = await db.from("cursos").select("id, publicado").eq("slug", CURSO.slug).maybeSingle();
  if (!curso) {
    const { data: max } = await db.from("cursos").select("ordem").order("ordem", { ascending: false }).limit(1).maybeSingle();
    const nextOrdem = (max?.ordem ?? 0) + 1;
    const { data, error } = await db
      .from("cursos")
      .insert({ ...CURSO, is_pago: false, preco_centavos: 0, ordem: nextOrdem, publicado: true })
      .select("id")
      .single();
    if (error) throw error;
    curso = data;
    console.log(`✓ curso criado (ordem ${nextOrdem})  id=${curso.id}`);
  } else {
    const { error } = await db
      .from("cursos")
      .update({ titulo: CURSO.titulo, descricao: CURSO.descricao, imagem_url: CURSO.imagem_url, categoria: CURSO.categoria, publicado: true })
      .eq("id", curso.id);
    if (error) throw error;
    console.log(`• curso já existia  id=${curso.id} — atualizado e publicado`);
  }

  for (const a of aulas) {
    let { data: aula } = await db.from("aulas").select("id").eq("curso_id", curso.id).eq("ordem", a.ordem).maybeSingle();
    if (!aula) {
      const { data, error } = await db
        .from("aulas")
        .insert({ curso_id: curso.id, titulo: a.titulo, ordem: a.ordem, conteudo: a.conteudo })
        .select("id")
        .single();
      if (error) throw error;
      aula = data;
      console.log(`  ✓ aula ${a.ordem}: ${a.titulo}  (${a.conteudo.length} chars)`);
    } else {
      console.log(`  • aula ${a.ordem} já existia — mantida`);
    }
  }

  console.log("\nConcluído.");
}

main().catch((e) => {
  console.error("ERRO:", e.message || e);
  process.exit(1);
});
