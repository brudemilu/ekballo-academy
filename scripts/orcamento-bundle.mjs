#!/usr/bin/env node
// =============================================================
// EKBALLO ACADEMY · Orçamento de desempenho
//
// Mede o JavaScript que TODA página carrega — a interseção dos
// chunks de todas as rotas no manifesto do build. É o número que
// governa a primeira visita: ninguém escapa dele.
//
// Por que isto importa mais aqui do que na média: o servidor está
// em Paris, ~267ms de ida e volta do Brasil, e sem CDN (issue #54).
// Cada quilobyte é pago em latência, não só em banda. Um chunk de
// 3,4 kB já foi medido levando 1,05s.
//
// O teto NÃO é uma meta a perseguir: é um alarme para crescimento
// acidental — a dependência que alguém adiciona sem perceber o
// tamanho. Passar do teto não é proibido; é uma conversa. Se o
// aumento for consciente e justificado, sobe-se o teto no mesmo PR,
// e o histórico do arquivo passa a contar essa história.
// =============================================================

import { readFileSync } from "node:fs";
import { gzipSync } from "node:zlib";
import { join } from "node:path";

// MEDIDO COMPRIMIDO (gzip), que é o que atravessa a rede — e é a
// mesma unidade que o `next build` imprime, então os dois números
// são comparáveis. Medir o arquivo cru dá ~3x mais e não descreve
// o que o aluno espera baixar.
// Aferido em 07/set/2026, com folga de ~15% sobre o real.
const TETO_COMPARTILHADO_KB = 120;
const TETO_MAIOR_PAGINA_KB = 130;

const RAIZ = process.cwd();
const MANIFESTO = join(RAIZ, ".next/app-build-manifest.json");

let manifesto;
try {
  manifesto = JSON.parse(readFileSync(MANIFESTO, "utf8"));
} catch {
  console.error(
    "✗ Não achei .next/app-build-manifest.json — rode `npm run build` antes.",
  );
  process.exit(1);
}

const paginas = Object.entries(manifesto.pages);
if (paginas.length === 0) {
  console.error("✗ Manifesto sem páginas. Build incompleto?");
  process.exit(1);
}

const cacheGzip = new Map();
function bytesDe(arquivo) {
  if (cacheGzip.has(arquivo)) return cacheGzip.get(arquivo);
  let n = 0;
  try {
    // gzip nível 6 = o que um servidor web usa por padrão.
    n = gzipSync(readFileSync(join(RAIZ, ".next", arquivo)), { level: 6 }).length;
  } catch {
    n = 0; // chunk citado mas ausente: não inventa peso
  }
  cacheGzip.set(arquivo, n);
  return n;
}

const kb = (b) => b / 1024;
const fmt = (b) => `${kb(b).toFixed(1)} kB`;

// Compartilhado = o que aparece em TODAS as páginas.
let comuns = null;
for (const [, chunks] of paginas) {
  const conjunto = new Set(chunks.filter((c) => c.endsWith(".js")));
  comuns = comuns === null ? conjunto : new Set([...comuns].filter((c) => conjunto.has(c)));
}
const bytesCompartilhados = [...comuns].reduce((s, c) => s + bytesDe(c), 0);

// A página mais pesada, contando o que é só dela.
let pior = { rota: "—", bytes: 0 };
for (const [rota, chunks] of paginas) {
  const proprios = chunks.filter((c) => c.endsWith(".js") && !comuns.has(c));
  const bytes = proprios.reduce((s, c) => s + bytesDe(c), 0);
  if (bytes > pior.bytes) pior = { rota, bytes };
}

console.log("Orçamento de desempenho (comprimido, como viaja na rede)");
console.log("──────────────────────────────────────────────────────");
console.log(
  `  Compartilhado por todas as páginas : ${fmt(bytesCompartilhados)}  (teto ${TETO_COMPARTILHADO_KB} kB)`,
);
console.log(
  `  Página mais pesada                 : ${fmt(pior.bytes)}  (teto ${TETO_MAIOR_PAGINA_KB} kB)`,
);
console.log(`  └─ ${pior.rota}`);
console.log(`  Páginas medidas                    : ${paginas.length}`);

const estouros = [];
if (kb(bytesCompartilhados) > TETO_COMPARTILHADO_KB) {
  estouros.push(
    `compartilhado ${fmt(bytesCompartilhados)} passou do teto de ${TETO_COMPARTILHADO_KB} kB`,
  );
}
if (kb(pior.bytes) > TETO_MAIOR_PAGINA_KB) {
  estouros.push(
    `a página ${pior.rota} (${fmt(pior.bytes)}) passou do teto de ${TETO_MAIOR_PAGINA_KB} kB`,
  );
}

if (estouros.length === 0) {
  console.log("\n✓ dentro do orçamento");
  process.exit(0);
}

console.error("\n✗ orçamento estourado:");
for (const e of estouros) console.error(`  · ${e}`);
console.error(
  "\nSe o aumento for proposital, suba o teto em scripts/orcamento-bundle.mjs\n" +
    "no MESMO PR e diga por quê na descrição. O teto existe para tornar o\n" +
    "crescimento uma decisão, não para proibir crescimento.",
);
process.exit(1);
