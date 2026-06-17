// Aplica uma migration de curso (livro→aulas+atividades) via service role.
//
//   node scripts/apply-curso.mjs <arquivo.sql> <slug> <nAulas>
//
// Lê o .sql como fonte da verdade: faz o parse do curso (slug/titulo/
// descricao), das aulas (titulo em $t$, ordem, conteudo em $conteudo$) e
// das atividades de reflexão (perguntas em $p$). Idempotente — só insere o
// que falta e garante o curso publicado. Usado para as migrations
// 120 (Carta aos Pecadores), 121 (O Cuidado do Corpo), 122 (Corajosas).

import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

const [sqlRel, slug, nAulasStr] = process.argv.slice(2);
if (!sqlRel || !slug || !nAulasStr) {
  throw new Error("Uso: node scripts/apply-curso.mjs <arquivo.sql> <slug> <nAulas>");
}
const nAulas = Number(nAulasStr);

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

const sql = readFileSync(new URL("../supabase/migrations/" + sqlRel, import.meta.url), "utf8");

const reEsc = slug.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
const descricao = (sql.match(new RegExp("'" + reEsc + "',\\s*'[^']*?',\\s*'([\\s\\S]*?)',\\s*'/api/og")) || [])[1];
const titulo = (sql.match(new RegExp("'" + reEsc + "',\\s*'([^']*?)',\\s*'")) || [])[1];
if (!descricao || !titulo) throw new Error("Não consegui extrair titulo/descrição do curso do .sql");
const CURSO = { slug, titulo, descricao, imagem_url: "/api/og/curso/" + slug };

// --- parse das aulas ---
const blocks = sql.split(/\n\s*select id into v_aula_id from public\.aulas/).slice(1);
const aulas = blocks.map((b) => {
  const ordem = Number((b.match(/and ordem = (\d+)/) || [])[1]);
  const t = (b.match(/\$t\$([\s\S]*?)\$t\$/) || [])[1];
  const conteudo = (b.match(/\$conteudo\$([\s\S]*?)\$conteudo\$/) || [])[1];
  const atividades = [...b.matchAll(/\(v_aula_id,\s*\d+,\s*\$p\$([\s\S]*?)\$p\$,\s*'reflexao'/g)].map((m) => m[1]);
  if (!ordem || !t || conteudo == null) throw new Error(`Bloco mal-parseado (ordem=${ordem}, titulo=${t})`);
  return { ordem, titulo: t, conteudo: conteudo.replace(/^\n/, "").replace(/\n$/, ""), atividades };
});
if (aulas.length !== nAulas) throw new Error(`Esperava ${nAulas} aulas, achei ${aulas.length}`);

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
    console.log(`✓ curso "${CURSO.titulo}" criado (ordem ${nextOrdem})  id=${curso.id}`);
  } else {
    const { error } = await db
      .from("cursos")
      .update({ titulo: CURSO.titulo, descricao: CURSO.descricao, imagem_url: CURSO.imagem_url, publicado: true })
      .eq("id", curso.id);
    if (error) throw error;
    console.log(`• curso "${CURSO.titulo}" já existia  id=${curso.id} — atualizado e publicado`);
  }

  for (const a of aulas) {
    let { data: aula } = await db
      .from("aulas")
      .select("id")
      .eq("curso_id", curso.id)
      .eq("ordem", a.ordem)
      .maybeSingle();
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

    const { data: jaTem } = await db.from("atividades").select("id").eq("aula_id", aula.id).limit(1);
    if (!jaTem || jaTem.length === 0) {
      const rows = a.atividades.map((pergunta, i) => ({ aula_id: aula.id, ordem: i + 1, pergunta, tipo: "reflexao", razao: null }));
      if (rows.length) {
        const { error } = await db.from("atividades").insert(rows);
        if (error) throw error;
        console.log(`     + ${rows.length} perguntas de reflexão`);
      }
    } else {
      console.log(`     • atividades já existiam — mantidas`);
    }
  }
  console.log("Concluído.\n");
}

main().catch((e) => {
  console.error("ERRO:", e.message || e);
  process.exit(1);
});
