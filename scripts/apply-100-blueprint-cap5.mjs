// Aplica a migration 100 (Blueprint de Parach — Capítulo 5) via service role.
//
//   node scripts/apply-100-blueprint-cap5.mjs
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

const sql = readFileSync(new URL("../supabase/migrations/100_blueprint_parach_cap5.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 7,
  titulo: "Capítulo 5 — O Apóstolo",
  conteudo,
  atividades: [
    '"O apóstolo que se esforça bate asas. O apóstolo florescente plana." A águia renova as forças esperando (qavah — atar-se, entrelaçar-se), não batendo asas na própria força. Em que parte da sua liderança você se pega "batendo as asas" — correndo no próprio combustível, incapaz de descansar porque a visão não te deixa dormir — em vez de planar nas térmicas da presença de Deus?',
    'A pergunta diagnóstica do capítulo é direta: "As pessoas que você lidera se sentem capacitadas ou usadas?" O apóstolo maduro constrói pessoas enquanto constrói projetos; o imaturo constrói projetos com pessoas e as descarta. Respondendo com honestidade sobre quem está ao seu redor hoje — capacitadas ou usadas? — e o que isso revela sobre de onde você tem liderado: transbordamento ou exaustão?',
    '"Você não é o jardim inteiro. Você é o solo." / "Você não é a família inteira. Você é o patriarca." O apóstolo florescente prepara o terreno, assegura a terra e libera os filhos — seu objetivo, paradoxalmente, é tornar-se desnecessário. Onde você ainda tenta "ser tudo" (solo, semente, água e jardineiro) e segurar cada fio, em vez de delegar cedo e confiar no Vinicultor para enviar o resto da equipe?',
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
