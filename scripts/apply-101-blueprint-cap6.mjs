// Aplica a migration 101 (Blueprint de Parach — Capítulo 6) via service role.
//
//   node scripts/apply-101-blueprint-cap6.mjs
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

const sql = readFileSync(new URL("../supabase/migrations/101_blueprint_parach_cap6.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 8,
  titulo: "Capítulo 6 — O Profeta",
  conteudo,
  atividades: [
    '"O profeta florescente arde a partir da intimidade, não da intensidade." O profeta que se esforça confunde intensidade com intimidade — acreditando que quanto mais alta a palavra, mais ungida ela é. Onde o seu fogo tem sido alimentado pela adrenalina do confronto em vez da comunhão com Deus, e o que mudaria na sua maneira de falar se você recebesse primeiro o coração com o qual entregar a palavra, e não só a palavra?',
    'O Protocolo de Horebe mostra como Deus restaura um líder esgotado em cinco partes: cuidado físico, tempo e espaço, a presença que ouve, revelação fresca e nova comissão em comunidade — e Elias precisou ouvir que não estava sozinho ("reservei sete mil"). Onde você tem carregado a resposta sozinho, isolado no seu "zimbro"? E qual dessas cinco partes é a que Deus está te oferecendo agora?',
    'A questão diagnóstica do profeta é: "Quando eu entrego uma palavra, as pessoas saem convictas ou condenadas?" Jeremias foi chamado "o profeta chorão", não "o profeta irado" — o profeta florescente chora antes de advertir. Onde o seu coração endureceu a ponto de o dom virar arma em vez de corda de salvamento, e por quem Deus está te chamando a chorar antes de corrigir?',
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
