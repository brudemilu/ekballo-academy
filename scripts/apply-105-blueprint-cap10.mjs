// Aplica a migration 105 (Blueprint de Parach — Capítulo 10) via service role.
//
//   node scripts/apply-105-blueprint-cap10.mjs
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

const sql = readFileSync(new URL("../supabase/migrations/105_blueprint_parach_cap10.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 12,
  titulo: "Capítulo 10 — Quando o Jardim Desmorona",
  conteudo,
  atividades: [
    'O colapso "sempre segue a mesma trajetória: independência da Fonte, tentar controlar o que só Deus pode controlar, atrito e exaustão". Saul tentou controlar "as estações e os recursos" (o timing); Salomão apenas se afastou aos poucos. Onde você tem tentado controlar o que pertence só a Deus na sua liderança — e a sua deriva é do tipo dramático ou do tipo Salomão (lenta, por pequenos compromissos)?',
    'Deus restaurou Elias com um protocolo de cinco passos — cuidado físico, tempo e espaço, presença que ouve, revelação fresca e nova comissão em comunidade — e NÃO com repreensão. "Esgotamento nem sempre segue o fracasso; às vezes segue sua maior vitória." Se você está (ou esteve) "debaixo da árvore de giesta", qual desses cinco passos é o que o Pai está te oferecendo agora?',
    'Davi, José, Ana e Josafá decidiram NÃO se esforçar — confiaram em Deus em vez de forçar o resultado. Josafá orou "não sabemos o que fazer, mas os nossos olhos estão sobre Ti", e o livro chama isso de posicionamento, não fracasso: "o momento em que o líder para de ser o motor e se torna o ramo". Onde Deus está te chamando a parar de forçar o que só Ele pode produzir e simplesmente permanecer Nele?',
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
