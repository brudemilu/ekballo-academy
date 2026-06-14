// Aplica a migration 095 (curso Blueprint de Parach) via service role,
// replicando a lógica idempotente do DO block. Roda fora do MCP.
//
//   node scripts/apply-095-blueprint-parach.mjs
//
// Lê o texto das aulas direto do .sql (fonte única da transcrição) e
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

// ---- extrai os dois blocos $conteudo$...$conteudo$ do .sql, na ordem ----
const sql = readFileSync(new URL("../supabase/migrations/095_curso_blueprint_parach.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 2) throw new Error(`Esperava 2 blocos de conteúdo, achei ${blocos.length}`);
const [conteudoPrefacio, conteudoIntroducao] = blocos;

const CURSO = {
  slug: "blueprint-parach",
  titulo: "O Blueprint de Parach",
  descricao:
    'Estudo guiado a partir de O Blueprint de Parach, de Dr. Richard William. O livro confronta a "epidemia do esforço" no ministério e propõe a Grande Inversão: liderar a partir do descanso, e não em direção a ele — do transbordamento, e não da exaustão. Cada trecho traz o texto na íntegra e, ao final, perguntas de reflexão para você examinar de onde vem a energia da sua liderança. Os capítulos vão sendo liberados conforme a ordem de leitura do livro.',
  imagem_url: "/api/og/curso/blueprint-parach",
  is_pago: false,
  preco_centavos: 0,
  publicado: true,
};

const AULAS = [
  {
    ordem: 1,
    titulo: "Prefácio — por Dr. Silmar Coelho",
    conteudo: conteudoPrefacio,
    atividades: [
      'O prefácio afirma que "vida agitada e a carnalidade caminham juntas" e que o excesso de tarefas não prova que estamos vivendo o Evangelho. Onde, na sua rotina de ministério, você tem confundido correria com fidelidade?',
      "Dr. Silmar descreve líderes que tentam parar, descansar e tirar férias, mas voltam sem satisfação permanente e sem o crescimento esperado. Quando você descansa, costuma voltar renovado — ou apenas adia a mesma exaustão? Por quê?",
    ],
  },
  {
    ordem: 2,
    titulo: "Introdução — A Grande Inversão",
    conteudo: conteudoIntroducao,
    atividades: [
      'O autor define "esforço" como liderar DA exaustão EM DIREÇÃO ao descanso, e "florescimento" como liderar DO descanso PARA um serviço frutífero. Hoje, de qual desses dois lugares você tem liderado? Dê um exemplo concreto da última semana.',
      'A imagem da águia que plana sobre a corrente térmica versus o pássaro que bate as asas freneticamente: em Colossenses 1:29 Paulo se esforça "conforme a Sua força". De quem é a força que tem movido o motor da sua liderança — a sua própria adrenalina ou a unção do Espírito?',
      'Em Mateus 16:18 Jesus diz "EU edificarei a Minha igreja". O autor distingue construir PARA Deus (o peso esmaga) de participar do que Ele JÁ está construindo. Em que área do seu ministério você precisa devolver a Ele um peso que nunca foi seu para carregar?',
    ],
  },
];

async function main() {
  // ---- Curso (idempotente por slug) ----
  let { data: curso } = await db.from("cursos").select("id").eq("slug", CURSO.slug).maybeSingle();
  if (!curso) {
    const { data: max } = await db.from("cursos").select("ordem").order("ordem", { ascending: false }).limit(1).maybeSingle();
    const nextOrdem = (max?.ordem ?? 0) + 1;
    const { data, error } = await db.from("cursos").insert({ ...CURSO, ordem: nextOrdem }).select("id").single();
    if (error) throw error;
    curso = data;
    console.log(`✓ curso criado (ordem ${nextOrdem})  id=${curso.id}`);
  } else {
    console.log(`• curso já existe  id=${curso.id}`);
  }

  // ---- Aulas + atividades ----
  for (const a of AULAS) {
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
      console.log(`  ✓ aula ${a.ordem} "${a.titulo}" criada (${a.conteudo.length} chars)`);
    } else {
      console.log(`  • aula ${a.ordem} já existe`);
    }

    const { count } = await db.from("atividades").select("id", { count: "exact", head: true }).eq("aula_id", aula.id);
    if (!count) {
      const rows = a.atividades.map((pergunta, i) => ({
        aula_id: aula.id,
        ordem: i + 1,
        pergunta,
        tipo: "reflexao",
        razao: null,
      }));
      const { error } = await db.from("atividades").insert(rows);
      if (error) throw error;
      console.log(`    ✓ ${rows.length} atividades de reflexão inseridas`);
    } else {
      console.log(`    • ${count} atividades já existem`);
    }
  }

  console.log("\nConcluído.");
}

main().catch((e) => {
  console.error("ERRO:", e.message || e);
  process.exit(1);
});
