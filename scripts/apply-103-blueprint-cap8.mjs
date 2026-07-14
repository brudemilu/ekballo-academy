// Aplica a migration 103 (Blueprint de Parach — Capítulo 8) via service role.
//
//   node scripts/apply-103-blueprint-cap8.mjs
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

const sql = readFileSync(new URL("../supabase/migrations/103_blueprint_parach_cap8.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 10,
  titulo: "Capítulo 8 — O Pastor",
  conteudo,
  atividades: [
    '"Você precisa ser pastoreado para pastorear." A pergunta diagnóstica do capítulo é direta: "Quem me pastoreia?" — e o pastor que se esforça não tem resposta. Você consegue nomear as pessoas que falam na sua vida, te mantêm em prestação de contas e cuidam da sua alma? Onde você insiste em dar aos outros o cuidado e o descanso que recusa para si mesmo?',
    'O esforço do pastor é o mais insidioso porque "se parece exatamente com fidelidade" — e a indispensabilidade é uma prisão, não uma coroa. O objetivo do pastor maduro é "trabalhar-se até ficar sem emprego". Onde a sua identidade está fundada em ser necessário, e não em ser fiel? Você consegue celebrar quando alguém já não precisa de você porque cresceu — ou isso te assusta?',
    'O pelicano "pode sangrar até morrer": o amor sacrificial vira justificativa para autodestruição. O pastor florescente aprendeu que seu sangue não alimenta o rebanho — o sangue de Cristo é — e que ele é "uma ponte, não um destino", carregando os fardos das pessoas a Deus, e não por Deus. Onde você tem pastoreado a partir do vazio em vez do transbordamento, e o que muda quando você conduz o rebanho ao verdadeiro Pastor em vez de tentar substituí-Lo?',
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
