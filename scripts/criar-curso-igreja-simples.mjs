// Cria APENAS o registro do curso "Igreja Simples" (o card com a capa),
// sem nenhuma aula. Fica como rascunho (publicado=false) até o Bruno decidir
// o conteúdo. Idempotente por slug — pode rerodar sem duplicar.
//
//   node scripts/criar-curso-igreja-simples.mjs

import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

// ---- env (.env.local) ----
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

const CURSO = {
  slug: "igreja-simples",
  titulo: "Igreja Simples",
  descricao:
    "Estudo a partir do livro Igreja Simples, de Thom S. Rainer e Eric Geiger. " +
    "Os autores mostram, com base em pesquisa, que as igrejas mais saudáveis " +
    "tendem a ter um processo de discipulado simples e claro — articulado em " +
    "quatro elementos: clareza, movimento, alinhamento e foco. As aulas serão " +
    "adicionadas em breve.",
  imagem_url: "/api/og/curso/igreja-simples",
  is_pago: false,
  preco_centavos: 0,
  publicado: false, // rascunho — só aparece pro admin até liberar
};

async function main() {
  let { data: curso } = await db.from("cursos").select("id, publicado").eq("slug", CURSO.slug).maybeSingle();
  if (!curso) {
    const { data: max } = await db.from("cursos").select("ordem").order("ordem", { ascending: false }).limit(1).maybeSingle();
    const nextOrdem = (max?.ordem ?? 0) + 1;
    const { data, error } = await db.from("cursos").insert({ ...CURSO, ordem: nextOrdem }).select("id").single();
    if (error) throw error;
    console.log(`✓ curso "Igreja Simples" criado como rascunho (ordem ${nextOrdem})  id=${data.id}`);
  } else {
    // já existe — garante capa/descrição atualizadas, mantém o estado de publicado
    const { error } = await db
      .from("cursos")
      .update({ titulo: CURSO.titulo, descricao: CURSO.descricao, imagem_url: CURSO.imagem_url })
      .eq("id", curso.id);
    if (error) throw error;
    console.log(`• curso já existia  id=${curso.id} (publicado=${curso.publicado}) — capa/descrição atualizadas`);
  }
  console.log("\nConcluído.");
}

main().catch((e) => {
  console.error("ERRO:", e.message || e);
  process.exit(1);
});
