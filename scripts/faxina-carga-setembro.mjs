// Faxina dos nove livros carregados em 17/09/2026 (issue #156).
//
// Conserta artefato de EXTRAÇÃO, não escreve texto novo: rejunta hifenização de
// fim de linha, remonta ligadura fi/fl que o extrator solta como "f " + vogal,
// remove cabeçalho corrido e número de página soltos, e — o que mais pesa na
// leitura — refaz as quebras de parágrafo falsas, aquelas em que a linha
// termina no meio da frase.
//
// NÃO recola letras espaçadas do OCR ("g u e rra"): testado, a regra comia
// português legítimo ("e a casa" -> "eacasa"). Só os dois escaneados tinham
// esse defeito e eles são refeitos por OCR novo, onde o problema não existe.
//
// Não tenta consertar palavra trocada por OCR (" c " no lugar de "é", "greja"
// por "Igreja"). Isso não é faxina: exige refazer o OCR da fonte. Os dois
// escaneados entram por outro caminho (scripts/reocr).
//
// O banco vivo é o box Contabo — .env.local aponta pro Supabase Cloud morto.
// Por isso o script não grava: lê o dump e emite SQL pra rodar via psql no box.
//
//   node scripts/faxina-carga-setembro.mjs <dump.json> <saida.sql>

import { readFileSync, writeFileSync } from "node:fs";

const [, , dumpPath, sqlPath] = process.argv;
if (!dumpPath || !sqlPath) {
  console.error("uso: node scripts/faxina-carga-setembro.mjs <dump.json> <saida.sql>");
  process.exit(1);
}

const LIGADURAS = new Map([["ﬁ", "fi"], ["ﬂ", "fl"], ["ﬀ", "ff"], ["­", ""], ["­", ""]]);

function normalizarChars(t) {
  for (const [de, para] of LIGADURAS) t = t.split(de).join(para);
  // O extrator quebra a ligadura fi/fl em "f " + vogal: "af im" -> "afim".
  t = t.replace(/([A-Za-zÀ-ÿ])f ([il])/g, "$1f$2");
  return t.normalize("NFC");
}

function rejuntarHifen(t) {
  // "consequên-\ncia" -> "consequência"; preserva hífen legítimo de composto.
  return t.replace(/([A-Za-zÀ-ÿ])-\n[ \t]*([a-zà-ÿ])/g, "$1$2");
}

function limparEspacos(s) {
  return s
    .replace(/[ \t]+/g, " ")
    .replace(/ +([,.;:!?”»)\]])/g, "$1")
    .replace(/([“«(\[]) +/g, "$1")
    .trim();
}

const FIM_DE_FRASE = /[.!?:;»”"')\]]$/;

// Proporção de maiúsculas separa TÍTULO de frase partida melhor que o tamanho:
// "OlTO MANEIRAS DE MANTER O DlABO" é título mesmo tendo minúscula (o OCR lê
// o I maiúsculo como l); "Por isso, é comum perceber o rechaço" é fragmento
// mesmo começando com maiúscula.
function pareceTitulo(p) {
  const letras = p.replace(/[^A-Za-zÀ-ÿ]/g, "");
  if (letras.length < 2) return true; // só número/pontuação: separador de página
  const maiusc = letras.replace(/[^A-ZÀ-Þ]/g, "").length;
  return maiusc / letras.length >= 0.8;
}

// O OCR do "Oito Maneiras" lê I maiúsculo como l minúsculo dentro de palavra
// em caixa alta: OlTO -> OITO, DlABO -> DIABO. Só age se o resto da palavra
// for todo maiúsculo, então não encosta em texto normal.
function corrigirIMaiusculo(t) {
  return t.replace(/\b[A-ZÀ-Þ][A-ZÀ-Þl]*l[A-ZÀ-Þl]*\b/g, (w) =>
    /[A-ZÀ-Þ]/.test(w.replace(/l/g, "")) ? w.replace(/l/g, "I") : w
  );
}

// Parágrafo que termina no meio da frase e continua no seguinte em minúscula é
// quebra de página do PDF, não parágrafo do autor.
function juntarParagrafosFalsos(paragrafos) {
  const out = [];
  for (const p of paragrafos) {
    const ant = out[out.length - 1];
    if (!ant) { out.push(p); continue; }
    const comecaMinuscula = /^[a-zà-ÿ]/.test(p);
    if (p.startsWith("•") || ant.includes("•")) { out.push(p); continue; }
    const terminaAberto = !FIM_DE_FRASE.test(ant);
    if (comecaMinuscula && terminaAberto && !pareceTitulo(ant)) {
      out[out.length - 1] = ant.endsWith("-") ? ant.slice(0, -1) + p : `${ant} ${p}`;
    } else {
      out.push(p);
    }
  }
  return out;
}

// Cabeçalho corrido: parágrafo curto que se repete ao longo do livro inteiro.
function acharCabecalhos(aulas) {
  // Conta em quantas AULAS DISTINTAS o bloco aparece, não quantas vezes ao todo.
  // Cabeçalho corrido atravessa o livro inteiro; título de seção repete dentro
  // de um capítulo só ("A PERSPECTIVA DO NOIVO" repetia 4x e era do autor).
  const emAulas = new Map();
  for (const a of aulas) {
    for (const p of new Set(a.conteudo.split(/\n{2,}/).map((x) => x.trim()))) {
      // Sem letra nenhuma = separador do autor (***, ———), nunca cabeçalho,
      // por mais que repita ao longo do livro.
      if (!p || p.length > 60 || p.includes("•")) continue;
      if (!/[A-Za-zÀ-ÿ]/.test(p)) continue;
      emAulas.set(p, (emAulas.get(p) || 0) + 1);
    }
  }
  return new Set([...emAulas].filter(([, n]) => n >= 4).map(([s]) => s));
}

// Número de página solto. NÃO casa separador do autor (***, ———): esses são
// dele e precisam sobreviver, então exige pelo menos um dígito.
const SO_NUMERO = /^(?=[^0-9]*[0-9])[\s\d.·—–\-_“”"']*$/;

function faxina(conteudo, cabecalhos) {
  let t = corrigirIMaiusculo(normalizarChars(conteudo));
  t = rejuntarHifen(t);
  let paragrafos = t
    .split(/\n{2,}/)
    .map((p) => limparEspacos(p.replace(/\n/g, " ")))
    .filter((p) => p && !SO_NUMERO.test(p) && !cabecalhos.has(p));
  paragrafos = juntarParagrafosFalsos(paragrafos);
  return paragrafos.join("\n\n");
}

// ——— execução ———

const aulas = JSON.parse(readFileSync(dumpPath, "utf8"));
const porLivro = new Map();
for (const a of aulas) {
  if (!porLivro.has(a.slug)) porLivro.set(a.slug, []);
  porLivro.get(a.slug).push(a);
}

const sql = ["begin;"];
const relatorio = [];
let mudadas = 0;

for (const [slug, lista] of [...porLivro].sort()) {
  const cabecalhos = acharCabecalhos(lista);
  let dChars = 0, dParag = 0, n = 0;
  for (const a of lista) {
    const limpo = faxina(a.conteudo, cabecalhos);
    if (limpo === a.conteudo) continue;
    n++; mudadas++;
    dChars += limpo.length - a.conteudo.length;
    dParag += limpo.split(/\n{2,}/).length - a.conteudo.split(/\n{2,}/).length;
    sql.push(`update aulas set conteudo = $conteudo$${limpo}$conteudo$ where id = '${a.id}';`);
  }
  relatorio.push(
    `${slug.padEnd(50)} ${String(n).padStart(3)}/${String(lista.length).padStart(3)} aulas  ` +
    `${dChars >= 0 ? "+" : ""}${dChars} chars  ${dParag} parág.  ` +
    `${cabecalhos.size} cabeçalho(s) removido(s)`
  );
}

sql.push("commit;");
writeFileSync(sqlPath, sql.join("\n") + "\n");
console.log(relatorio.join("\n"));
console.log(`\n${mudadas} aulas mudam. SQL em ${sqlPath}`);
