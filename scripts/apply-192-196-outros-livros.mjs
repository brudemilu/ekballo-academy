// Aplica as migrations 192-196 (outros livros transcritos) via service role.
//
//   node scripts/apply-192-196-outros-livros.mjs
//
// Lê os .sql como fonte da verdade. Não cria atividades/perguntas.

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

const migrations = [
  {
    "slug": "milagres",
    "file": "192_curso_milagres.sql",
    "categoria": "ensino"
  },
  {
    "slug": "o-deus-que-destroi-sonhos",
    "file": "193_curso_o_deus_que_destroi_sonhos.sql",
    "categoria": "ensino"
  },
  {
    "slug": "deuses-falsos",
    "file": "194_curso_deuses_falsos.sql",
    "categoria": "ensino"
  },
  {
    "slug": "peso-da-gloria",
    "file": "195_curso_peso_da_gloria.sql",
    "categoria": "ensino"
  },
  {
    "slug": "grande-divorcio",
    "file": "196_curso_grande_divorcio.sql",
    "categoria": "ensino"
  }
];

function parseCurso(sql, fallbackSlug) {
  const slug = (sql.match(/where slug = '([^']+)'/) || [])[1] || fallbackSlug;
  const titulo = (sql.match(/set titulo = \$titulo\$([\s\S]*?)\$titulo\$/) || sql.match(/\$titulo\$([\s\S]*?)\$titulo\$/) || [])[1];
  const descricao = (sql.match(/\$desc\$([\s\S]*?)\$desc\$/) || [])[1];
  const blocks = sql.split(/\n\s*select id into v_aula_id from public\.aulas/).slice(1);
  const aulas = blocks.map((b) => {
    const ordem = Number((b.match(/and ordem = (\d+)/) || [])[1]);
    const titulo = (b.match(/\$t\$([\s\S]*?)\$t\$/) || [])[1];
    const conteudo = (b.match(/\$conteudo\$([\s\S]*?)\$conteudo\$/) || [])[1];
    if (!ordem || !titulo || conteudo == null) throw new Error(`Bloco mal-parseado (slug=${slug}, ordem=${ordem}, titulo=${titulo})`);
    return { ordem, titulo, conteudo: conteudo.replace(/^\n/, "").replace(/\n$/, "") };
  });
  if (!titulo || !descricao || !aulas.length) throw new Error(`Não consegui parsear o curso ${slug}`);
  return { slug, titulo, descricao, imagem_url: `/api/og/curso/${slug}`, categoria: "ensino", aulas };
}

async function applyOne(entry) {
  const sql = readFileSync(new URL(`../supabase/migrations/${entry.file}`, import.meta.url), "utf8");
  const cursoData = parseCurso(sql, entry.slug);

  let { data: curso } = await db.from("cursos").select("id, publicado").eq("slug", cursoData.slug).maybeSingle();
  if (!curso) {
    const { data: max } = await db.from("cursos").select("ordem").order("ordem", { ascending: false }).limit(1).maybeSingle();
    const nextOrdem = (max?.ordem ?? 0) + 1;
    const { data, error } = await db
      .from("cursos")
      .insert({
        slug: cursoData.slug,
        titulo: cursoData.titulo,
        descricao: cursoData.descricao,
        imagem_url: cursoData.imagem_url,
        categoria: cursoData.categoria,
        is_pago: false,
        preco_centavos: 0,
        ordem: nextOrdem,
        publicado: true,
      })
      .select("id")
      .single();
    if (error) throw error;
    curso = data;
    console.log(`✓ curso criado: ${cursoData.slug} (ordem ${nextOrdem})  id=${curso.id}`);
  } else {
    const { error } = await db
      .from("cursos")
      .update({
        titulo: cursoData.titulo,
        descricao: cursoData.descricao,
        imagem_url: cursoData.imagem_url,
        categoria: cursoData.categoria,
        publicado: true,
      })
      .eq("id", curso.id);
    if (error) throw error;
    console.log(`• curso já existia: ${cursoData.slug}  id=${curso.id} — atualizado e publicado`);
  }

  for (const a of cursoData.aulas) {
    const { data: aula } = await db.from("aulas").select("id").eq("curso_id", curso.id).eq("ordem", a.ordem).maybeSingle();
    if (aula) {
      console.log(`  • aula ${a.ordem}: ${a.titulo} já existia — mantida`);
      continue;
    }
    const { error } = await db
      .from("aulas")
      .insert({ curso_id: curso.id, titulo: a.titulo, ordem: a.ordem, conteudo: a.conteudo })
      .select("id")
      .single();
    if (error) throw error;
    console.log(`  ✓ aula ${a.ordem}: ${a.titulo}  (${a.conteudo.length} chars)`);
  }
}

for (const migration of migrations) await applyOne(migration);
console.log("\nConcluído.");
