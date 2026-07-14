import { readFileSync, writeFileSync } from "node:fs";

const pages = readFileSync(new URL("../tmp/pdfs/cristao-inutil-layout.txt", import.meta.url), "utf8").split("\f");

const aulas = [
  { ordem: 1, titulo: "Agradecimentos", pages: [12, 12] },
  { ordem: 2, titulo: "Prefácio", pages: [17, 18] },
  { ordem: 3, titulo: "Introdução", pages: [25, 27] },
  { ordem: 4, titulo: "Como assim, \"inútil\"?", pages: [34, 45] },
  { ordem: 5, titulo: "Os novos sacerdotes de Deus", pages: [52, 65] },
  { ordem: 6, titulo: "Quem é você na fila do pão?", pages: [72, 84] },
  { ordem: 7, titulo: "Como descobrir qual é meu chamado?", pages: [91, 103] },
  { ordem: 8, titulo: "Enviados para a vida comum", pages: [110, 120] },
  { ordem: 9, titulo: "Como glorificar a Deus se eu odeio meu trabalho?", pages: [127, 138] },
  { ordem: 10, titulo: "Considerações finais", pages: [145, 149] },
];

const replacements = new Map([
  ["ﬁ", "fi"],
  ["ﬂ", "fl"],
  ["", "Th"],
  ["", "o"],
  ["", "p"],
  ["", "i"],
  ["", "d"],
  ["", "e"],
  ["", "s"],
  ["", "q"],
  ["", "u"],
  ["", "r"],
  ["", "ã"],
  ["", "ç"],
  ["", "õ"],
]);

function normalizeChars(text) {
  for (const [from, to] of replacements) text = text.split(from).join(to);
  return text.normalize("NFC");
}

function pageText(pageNumber) {
  return pages[pageNumber - 1] ?? "";
}

function isLikelyPullQuote(line) {
  const letters = line.replace(/[^A-Za-zÀ-ÖØ-öø-ÿ]/g, "");
  return letters.length >= 12 && line === line.toUpperCase();
}

function cleanRange([start, end], title) {
  const rawLines = [];
  for (let page = start; page <= end; page += 1) {
    rawLines.push(...pageText(page).split("\n"));
    rawLines.push("");
  }

  const paragraphs = [];
  let current = [];
  let pullQuote = false;

  function flush() {
    if (!current.length) return;
    const joined = current
      .join(pullQuote ? "\n" : " ")
      .replace(/\s+([,.;:!?])/g, "$1")
      .replace(/\s+/g, pullQuote ? "\n" : " ")
      .trim();
    if (joined && joined.toLowerCase() !== title.toLowerCase()) paragraphs.push(joined);
    current = [];
    pullQuote = false;
  }

  for (const rawLine of rawLines) {
    let line = normalizeChars(rawLine).trim();
    if (!line) {
      flush();
      continue;
    }
    line = line.replace("p+rofessor", "professor");
    if (line.toLowerCase() === title.toLowerCase()) continue;
    if (/^[pq\s]+$/.test(line)) continue;
    if (/^[a-z](?:\s+[a-z]){1,}$/i.test(line)) continue;

    const newParagraph = /^\s{2,}\S/.test(rawLine) || isLikelyPullQuote(line) !== pullQuote;
    if (newParagraph) flush();

    pullQuote = isLikelyPullQuote(line);
    current.push(line);
  }
  flush();

  return paragraphs.join("\n\n").replace(/\n{3,}/g, "\n\n").trim();
}

function dollar(tag, value) {
  if (value.includes(`$${tag}$`)) throw new Error(`Conteúdo contém delimitador $${tag}$`);
  return `$${tag}$${value}$${tag}$`;
}

const descricao =
  "Estudo guiado a partir de Como se tornar um cristão inútil, de Rodrigo Bibo. Em dez aulas, o livro chama a igreja a redescobrir a alegria de servir sem protagonismo, mérito ou culpa, vivendo como sacerdotes de Cristo na vida comum. Cada aula traz o texto na íntegra, sem perguntas de reflexão.";

const migration = `-- Curso: Como se tornar um cristão inútil (Rodrigo Bibo) — transcrição integral sem perguntas.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'cristao-inutil';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      'cristao-inutil',
      'Como se tornar um cristão inútil',
      ${dollar("desc", descricao)},
      'capas/cristao-inutil.jpg',
      false,
      0,
      'ensino',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = 'Como se tornar um cristão inútil',
        descricao = ${dollar("desc", descricao)},
        imagem_url = 'capas/cristao-inutil.jpg',
        categoria = 'ensino',
        publicado = true
    where id = v_curso_id;
  end if;

${aulas
  .map((a) => {
    const conteudo = cleanRange(a.pages, a.titulo);
    if (!conteudo) throw new Error(`Aula sem conteúdo: ${a.titulo}`);
    return `  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = ${a.ordem};
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, ${dollar("t", a.titulo)}, ${a.ordem},
${dollar("conteudo", conteudo)})
    returning id into v_aula_id;
  end if;`;
  })
  .join("\n\n")}
end;
$migration$;
`;

const applyScript = `// Aplica a migration 191 (Curso "Como se tornar um cristão inútil") via service role.
//
//   node scripts/apply-191-cristao-inutil.mjs
//
// Lê o .sql como fonte da verdade: faz o parse do curso e das 10 aulas.
// Não cria atividades/perguntas.

import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

const env = Object.fromEntries(
  readFileSync(new URL("../.env.local", import.meta.url), "utf8")
    .split("\\n")
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

const sql = readFileSync(new URL("../supabase/migrations/191_curso_cristao_inutil.sql", import.meta.url), "utf8");

const CURSO = {
  slug: "cristao-inutil",
  titulo: "Como se tornar um cristão inútil",
  descricao: (sql.match(/\\$desc\\$([\\s\\S]*?)\\$desc\\$/) || [])[1],
  imagem_url: "capas/cristao-inutil.jpg",
  categoria: "ensino",
};
if (!CURSO.descricao) throw new Error("Não consegui extrair a descrição do curso do .sql");

const blocks = sql.split(/\\n\\s*select id into v_aula_id from public\\.aulas/).slice(1);
const aulas = blocks.map((b) => {
  const ordem = Number((b.match(/and ordem = (\\d+)/) || [])[1]);
  const titulo = (b.match(/\\$t\\$([\\s\\S]*?)\\$t\\$/) || [])[1];
  const conteudo = (b.match(/\\$conteudo\\$([\\s\\S]*?)\\$conteudo\\$/) || [])[1];
  if (!ordem || !titulo || conteudo == null) throw new Error(\`Bloco mal-parseado (ordem=\${ordem}, titulo=\${titulo})\`);
  return { ordem, titulo, conteudo: conteudo.replace(/^\\n/, "").replace(/\\n$/, "") };
});
if (aulas.length !== 10) throw new Error(\`Esperava 10 aulas, achei \${aulas.length}\`);

async function main() {
  let { data: curso } = await db.from("cursos").select("id, publicado").eq("slug", CURSO.slug).maybeSingle();
  if (!curso) {
    const { data: max } = await db.from("cursos").select("ordem").order("ordem", { ascending: false }).limit(1).maybeSingle();
    const nextOrdem = (max?.ordem ?? 0) + 1;
    const { data, error } = await db
      .from("cursos")
      .insert({ ...CURSO, is_pago: false, preco_centavos: 0, ordem: nextOrdem, publicado: true })
      .select("id")
      .single();
    if (error) throw error;
    curso = data;
    console.log(\`✓ curso criado (ordem \${nextOrdem})  id=\${curso.id}\`);
  } else {
    const { error } = await db
      .from("cursos")
      .update({ titulo: CURSO.titulo, descricao: CURSO.descricao, imagem_url: CURSO.imagem_url, categoria: CURSO.categoria, publicado: true })
      .eq("id", curso.id);
    if (error) throw error;
    console.log(\`• curso já existia  id=\${curso.id} — atualizado e publicado\`);
  }

  for (const a of aulas) {
    let { data: aula } = await db.from("aulas").select("id").eq("curso_id", curso.id).eq("ordem", a.ordem).maybeSingle();
    if (!aula) {
      const { data, error } = await db
        .from("aulas")
        .insert({ curso_id: curso.id, titulo: a.titulo, ordem: a.ordem, conteudo: a.conteudo })
        .select("id")
        .single();
      if (error) throw error;
      aula = data;
      console.log(\`  ✓ aula \${a.ordem}: \${a.titulo}  (\${a.conteudo.length} chars)\`);
    } else {
      console.log(\`  • aula \${a.ordem} já existia — mantida\`);
    }
  }

  console.log("\\nConcluído.");
}

main().catch((e) => {
  console.error("ERRO:", e.message || e);
  process.exit(1);
});
`;

writeFileSync(new URL("../supabase/migrations/191_curso_cristao_inutil.sql", import.meta.url), migration);
writeFileSync(new URL("./apply-191-cristao-inutil.mjs", import.meta.url), applyScript);
