// Aplica a migration 099 (Blueprint de Parach — Capítulo 4) via service role.
//
//   node scripts/apply-099-blueprint-cap4.mjs
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

const sql = readFileSync(new URL("../supabase/migrations/099_blueprint_parach_cap4.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 6,
  titulo: "Capítulo 4 — A Arquitetura do Vaso Vazio",
  conteudo,
  atividades: [
    '"A identidade deve preceder a atividade. O ser deve preceder o fazer." O líder que se esforça tenta ganhar a própria identidade através do trabalho — e por isso não consegue lavar pés, porque está ocupado demais subindo escadas. Em que área você ainda está tentando provar quem você é pelo que faz, em vez de receber sua identidade do Pai e trabalhar a partir do descanso?',
    'O Princípio Blepô: Jesus "não acordava perguntando o que devo realizar hoje — Ele acordava e observava o que o Pai já estava fazendo". Kenosis é esvaziar-se também para enxergar. Onde a sua própria agenda está tão cheia que você não consegue ver a mão do Pai já trabalhando ao seu redor — e o que você precisaria soltar para começar a perceber em vez de só produzir?',
    'Kenosis não é um evento único, é uma postura diária: "Lave-me novamente. Esvazie-me novamente. Eu peguei a poeira do esforço, acumulei a sujeira da autossuficiência." Que "poeira" da sua caminhada recente — conflito, crítica, autossuficiência — você precisa trazer hoje ao Mestre para servir a partir da pureza, e não da performance?',
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
