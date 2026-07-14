// Aplica a migration 104 (Blueprint de Parach — Capítulo 9) via service role.
//
//   node scripts/apply-104-blueprint-cap9.mjs
//
// Lê o texto da aula direto do .sql e só insere o que ainda não existe.

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

const sql = readFileSync(new URL("../supabase/migrations/104_blueprint_parach_cap9.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 11,
  titulo: "Capítulo 9 — O Mestre",
  conteudo,
  atividades: [
    'A sequência de Esdras 7:10 é "Buscar, depois Praticar, depois Ensinar" — e o mestre que se esforça "pula a etapa do meio", indo do estudo direto ao ensino sem deixar a Palavra transformar a própria vida. Onde você tem ensinado ou compartilhado algo que ainda não deixou te transformar primeiro — "distribuindo pão que nunca comeu"?',
    '"Em algum ponto do caminho, o mestre se apaixonou pelo texto e esqueceu de se apaixonar pelo Autor." O mestre florescente é "um poço, não um cano" — a água flui da profundidade, não da pressão; seu tempo de estudo virou tempo de adoração. Onde o texto virou um objeto a ser dominado em vez de uma Pessoa a ser encontrada, e o que mudaria se você abrisse a Palavra primeiro para encontrar Deus, e não para preparar algo?',
    'A questão diagnóstica do mestre é: "As pessoas saem do meu ensino impressionadas comigo, ou equipadas para encontrar Deus por conta própria?" O mestre maduro "desaparece atrás da verdade"; o imaturo "se torna a estrela da lição". Onde você percebe que tem buscado admiração em vez de adoração — e como seria medir o sucesso por quão equipados os outros ficam para caminhar sem você?',
  ],
};

async function main() {
  const { data: curso, error: e0 } = await db
    .from("cursos")
    .select("id")
    .eq("slug", "blueprint-parach")
    .maybeSingle();
  if (e0) throw e0;
  if (!curso) throw new Error("Curso blueprint-parach não encontrado — rode a 095 antes.");

  let { data: aula } = await db
    .from("aulas")
    .select("id")
    .eq("curso_id", curso.id)
    .eq("ordem", AULA.ordem)
    .maybeSingle();
  if (!aula) {
    const { data, error } = await db
      .from("aulas")
      .insert({ curso_id: curso.id, titulo: AULA.titulo, ordem: AULA.ordem, conteudo: AULA.conteudo })
      .select("id")
      .single();
    if (error) throw error;
    aula = data;
    console.log(`✓ aula ${AULA.ordem} "${AULA.titulo}" criada (${AULA.conteudo.length} chars)`);
  } else {
    console.log(`• aula ${AULA.ordem} já existe  id=${aula.id}`);
  }

  const { count } = await db
    .from("atividades")
    .select("id", { count: "exact", head: true })
    .eq("aula_id", aula.id);
  if (!count) {
    const rows = AULA.atividades.map((pergunta, i) => ({
      aula_id: aula.id,
      ordem: i + 1,
      pergunta,
      tipo: "reflexao",
      razao: null,
    }));
    const { error } = await db.from("atividades").insert(rows);
    if (error) throw error;
    console.log(`  ✓ ${rows.length} atividades de reflexão inseridas`);
  } else {
    console.log(`  • ${count} atividades já existem`);
  }

  console.log("\nConcluído.");
}

main().catch((e) => {
  console.error("ERRO:", e.message || e);
  process.exit(1);
});
