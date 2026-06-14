// Aplica a migration 097 (Blueprint de Parach — Capítulo 2) via service role.
//
//   node scripts/apply-097-blueprint-cap2.mjs
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

const sql = readFileSync(new URL("../supabase/migrations/097_blueprint_parach_cap2.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 4,
  titulo: "Capítulo 2 — O Ecossistema do Jardim",
  conteudo,
  atividades: [
    'O jardineiro aposentado disse: "Eu nunca grito com o tomate para crescer mais rápido." O autor admite que "gritava com o tomate" ao gerir a igreja como fábrica — controlando o que é domínio de Deus (resultados, timing, crescimento) e negligenciando o que é tarefa dele (cultivar o solo, guardar os portões). Onde, hoje, você tem gritado com o tomate?',
    'Avad (servir/cultivar) e Shamar (guardar/proteger) eram a descrição de cargo de Adão — "não era CEO, não era visionário, não era construtor de plataformas". Olhando sua semana, quanto do seu tempo foi gasto tentando fazer o trabalho de Deus (forçar fruto) e quanto foi cuidar de verdade do solo das pessoas e do seu próprio coração?',
    'Manhigut (conduzir o carro, força de vontade) x Parach (desabrochar, vida fluindo pela Fonte). E a vara morta de Arão floresceu só por ser posta na presença de Deus (Números 17). Em qual dos dois modos você tem operado — e qual das cinco mudanças (produção→presença, adrenalina→unção, hierarquia→família, escassez→abundância, crescimento forçado→ritmo sazonal) Deus está pedindo que você dê o primeiro passo?',
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
