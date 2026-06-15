// Aplica a migration 098 (Blueprint de Parach — Capítulo 3) via service role.
//
//   node scripts/apply-098-blueprint-cap3.mjs
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

const sql = readFileSync(new URL("../supabase/migrations/098_blueprint_parach_cap3.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 5,
  titulo: "Capítulo 3 — As Oito Dimensões da Liderança Hebraica",
  conteudo,
  atividades: [
    'Os oito estilos — Melech (Rei), Navi (Profeta), Kohen (Sacerdote), Shofet (Juiz), Zaken (Ancião), Roeh (Pastor), Eved (Servo) e Mashiach (Ungido) — são "cores numa paleta", não descrições de cargo. A maioria lidera primariamente a partir de uma ou duas. Olhando seu jeito de liderar, qual(is) parece(m) ser a(s) sua(s) cor(es) primária(s) — e quais você tem tentado "pintar com um pincel que não é seu", esgotando-se à toa?',
    'Cada estilo tem um perigo específico quando opera separado da Videira (o Melech vira tirano, o Navi vira amargo, o Kohen vira ritual vazio, o Roeh vira exploração...). Qual é o perigo do SEU estilo predominante, e onde você já sente esse perigo aparecendo na sua liderança hoje?',
    'Jesus encarnou os oito não por pânico ou performance, mas a partir da união com o Pai — "a questão-chave não é de qual estilo você lidera, é como: a partir do esforço ou do florescimento?". Filipenses 2 chama o motor disso de kenosis (esvaziar-se). Em que área concreta Deus está te chamando a descer onde o mundo manda subir — a esvaziar-se de si para que a unção flua através de você?',
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
