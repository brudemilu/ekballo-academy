// Aplica a migration 096 (Blueprint de Parach — Capítulo 1) via service role,
// replicando a lógica idempotente do DO block. Roda fora do MCP.
//
//   node scripts/apply-096-blueprint-cap1.mjs
//
// Lê o texto da aula direto do .sql (fonte única da transcrição) e
// só insere o que ainda não existe — pode rerodar sem duplicar.

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

// ---- extrai o bloco $conteudo$...$conteudo$ do .sql ----
const sql = readFileSync(new URL("../supabase/migrations/096_blueprint_parach_cap1.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 3,
  titulo: "Capítulo 1 — A Epidemia do Esforço",
  conteudo,
  atividades: [
    'O mentor perguntou a Richard: "o que aconteceria com essa igreja se você desaparecesse por três meses?" — e a resposta "Desmoronaria" revelou um monumento, não uma igreja. Responda com honestidade à mesma pergunta sobre o seu ministério. O que isso diz sobre onde você tem colocado sua indispensabilidade?',
    'O autor contrapõe os "Três Cs" (Construções, Cifras e Cabeças) ao "Único F" (Fidelidade), e mostra na Parábola dos Talentos que o servo de dois e o de cinco ouvem o mesmo "Muito bem". Quais métricas têm definido se a sua semana foi boa ou ruim? O que mudaria se a sua única régua fosse a fidelidade ao que Deus colocou nas suas mãos?',
    'Adrenalina x unção: a águia que plana versus o pássaro que bate as asas sem parar. Passando pelo "Diagnóstico Honesto" do capítulo (preparar o sermão em paz ou em ansiedade; folga sem telefone gera paz ou pânico; a última vez que orou sem agenda), de qual fonte sua liderança tem se alimentado hoje — e qual o primeiro passo concreto para "permanecer na videira" (João 15:4) em vez de bater as asas?',
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
