// Aplica a migration 102 (Blueprint de Parach — Capítulo 7) via service role.
//
//   node scripts/apply-102-blueprint-cap7.mjs
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

const sql = readFileSync(new URL("../supabase/migrations/102_blueprint_parach_cap7.sql", import.meta.url), "utf8");
const blocos = [...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1]);
if (blocos.length !== 1) throw new Error(`Esperava 1 bloco de conteúdo, achei ${blocos.length}`);
const [conteudo] = blocos;

const AULA = {
  ordem: 9,
  titulo: "Capítulo 7 — O Evangelista",
  conteudo,
  atividades: [
    '"O evangelista florescente proclama a partir da alegria, não da culpa." O esforço do evangelista tem uma forma específica: carregar o peso da salvação nos próprios ombros, como se cada alma perdida fosse sua culpa. Onde a sua urgência virou ansiedade e a sua paixão virou compulsão — e o que mudaria se você abraçasse de verdade que "o seu trabalho é proclamar; o trabalho do Espírito é converter"?',
    'Filipe foi igualmente fiel às multidões de Samaria e ao único etíope na estrada deserta — "a maioria dos evangelistas consegue lidar com o avivamento; a estrada no deserto é o que os quebra". Você mede seu valor por números (decisões, mãos levantadas) ou por obediência? Onde Deus pode estar te chamando a deixar a multidão por causa de "um" — e isso te alegra ou te incomoda?',
    'O capítulo alerta: muitos pregam um evangelho que nunca aplicaram plenamente a si mesmos — "anunciam perdão enquanto carregam vergonha, declaram liberdade enquanto vivem em escravidão". Em que área a graça que você proclama aos outros ainda não penetrou na sua própria alma — onde você precisa primeiro receber a mensagem que prega?',
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
