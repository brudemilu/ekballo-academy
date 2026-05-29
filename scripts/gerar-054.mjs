// Gera a migração 054: substitui o conteúdo das aulas 1..13 do curso
// 'seja-um-lider-de-verdade' pelo texto integral do livro (rascunhos em
// _seja-um-lider-draft/). Converte markdown -> texto puro, porque a página de
// aula renderiza conteudo com split("\n\n") + whitespace-pre-wrap (sem parser
// de markdown). A aula de Apresentação (ordem 0) NÃO é tocada.

import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const draft = join(here, "_seja-um-lider-draft");

// arquivo -> ordem da aula no curso
const mapa = [
  ["02-cap01-chamado.md", 1],
  ["03-cap02-visao.md", 2],
  ["04-cap03-metas.md", 3],
  ["05-cap04-amor.md", 4],
  ["06-cap05-humildade.md", 5],
  ["07-cap06-autocontrole.md", 6],
  ["08-cap07-comunicacao.md", 7],
  ["09-cap08-investimento.md", 8],
  ["10-cap09-oportunidade.md", 9],
  ["11-cap10-energia.md", 10],
  ["12-cap11-persistencia.md", 11],
  ["13-cap12-autoridade.md", 12],
  ["14-cap13-conscientizacao.md", 13],
];

function mdParaTextoPuro(md) {
  const linhas = md.replace(/\r\n/g, "\n").split("\n");
  // remove o título h1 (primeira linha "# ...") e linhas em branco iniciais
  while (linhas.length && /^#\s/.test(linhas[0]) === false && linhas[0].trim() === "")
    linhas.shift();
  if (linhas.length && /^#\s/.test(linhas[0])) linhas.shift();

  const out = linhas.map((l) => {
    let s = l;
    s = s.replace(/^\s*#{1,6}\s+/, ""); // ## Subtítulo -> Subtítulo
    s = s.replace(/^\s*>\s?/, ""); // > citação -> citação
    s = s.replace(/^(\s*)[-*]\s+/, "$1• "); // - item -> • item
    s = s.replace(/\*\*(.+?)\*\*/g, "$1"); // **negrito** -> negrito
    s = s.replace(/(^|[^\w*])\*(?!\s)([^*\n]+?)\*(?!\w)/g, "$1$2"); // *itálico* -> itálico
    return s;
  });

  let texto = out.join("\n");
  texto = texto.replace(/\n{3,}/g, "\n\n").trim(); // normaliza linhas em branco
  return texto;
}

let sql = `-- =============================================================
-- Curso 'Seja um Líder de Verdade' — texto INTEGRAL do livro
-- Substitui o conteúdo das aulas 1..13 (princípios) pelo texto integral de
-- John Haggai, "Seja um Líder de Verdade" (Editora Betânia, 1990), com OCR
-- corrigido e ortografia modernizada. A aula 0 (Apresentação) não é alterada.
-- Gerado por scripts/gerar-054.mjs a partir de scripts/_seja-um-lider-draft/.
-- Idempotente: pode ser reaplicado (UPDATE por curso_id + ordem).
-- =============================================================

do $migration$
declare
  v_curso uuid;
begin
  select id into v_curso from public.cursos where slug = 'seja-um-lider-de-verdade';
  if v_curso is null then
    raise exception 'Curso seja-um-lider-de-verdade não encontrado';
  end if;

`;

for (const [arquivo, ordem] of mapa) {
  const md = readFileSync(join(draft, arquivo), "utf8");
  const texto = mdParaTextoPuro(md);
  if (texto.includes("$HAGGAI$")) throw new Error("delimitador colide: " + arquivo);
  sql += `  update public.aulas set conteudo = $HAGGAI$${texto}$HAGGAI$\n`;
  sql += `    where curso_id = v_curso and ordem = ${ordem};\n\n`;
}

sql += `  raise notice 'Conteúdo integral aplicado às 13 aulas do curso seja-um-lider-de-verdade';
end
$migration$;
`;

const destino = join(here, "..", "supabase", "migrations", "054_seja_um_lider_texto_integral.sql");
writeFileSync(destino, sql, "utf8");
console.log("Migração escrita em:", destino);
console.log("Tamanho:", (sql.length / 1024).toFixed(1), "KB");
