#!/usr/bin/env node
// =============================================================
// EKBALLO ACADEMY · Auditoria de dependências
//
// `npm audit --audit-level=high` não sabe dizer "esta eu já
// conheço, já decidi e está registrada". Ou trava em tudo, ou não
// trava em nada.
//
// Travar em tudo parece rigor, mas é o caminho mais curto para a
// esteira ser desligada: basta uma falha SEM correção disponível
// numa dependência transitiva para o projeto inteiro parar, e a
// reação humana a um portão que impede trabalho legítimo é remover
// o portão.
//
// Então: falha NOVA de alta ou crítica reprova. Falha conhecida
// passa — mas só se estiver nesta lista, com o número da issue que
// a acompanha e o motivo da espera. Sem issue, não entra na lista.
// A lista é a dívida declarada; o que não está nela é surpresa, e
// surpresa tem que parar a entrega.
// =============================================================

import { execSync } from "node:child_process";

const CONHECIDAS = [
  {
    pacote: "postcss",
    porque:
      "XSS no stringify de CSS. Só corrige com Next 16 (versão maior). " +
      "Aqui o PostCSS roda em tempo de BUILD, sobre o CSS do próprio " +
      "repositório — não sobre entrada de usuário —, então o vetor não " +
      "é alcançável em produção.",
    issue: 74,
  },
  {
    pacote: "next",
    porque: "Herdada do postcss acima; some junto quando o Next 16 entrar.",
    issue: 74,
  },
];

const permitidas = new Map(CONHECIDAS.map((c) => [c.pacote, c]));

let relatorio;
try {
  // `npm audit` sai com código != 0 quando acha algo; o JSON vem
  // no stdout do mesmo jeito.
  relatorio = execSync("npm audit --json", {
    encoding: "utf8",
    stdio: ["ignore", "pipe", "ignore"],
    maxBuffer: 32 * 1024 * 1024,
  });
} catch (e) {
  relatorio = e.stdout;
}

let dados;
try {
  dados = JSON.parse(relatorio);
} catch {
  console.error("✗ Não consegui ler a saída do npm audit.");
  process.exit(1);
}

const GRAVES = new Set(["high", "critical"]);
const achadas = Object.entries(dados.vulnerabilities ?? {});
const novas = [];
const conhecidasVistas = [];

for (const [nome, v] of achadas) {
  if (!GRAVES.has(v.severity)) continue;
  const permitida = permitidas.get(nome);
  if (permitida) conhecidasVistas.push({ nome, v, permitida });
  else novas.push({ nome, v });
}

const resumo = dados.metadata?.vulnerabilities ?? {};
console.log("Auditoria de dependências");
console.log("─────────────────────────");
console.log(
  `  crítica ${resumo.critical ?? 0} · alta ${resumo.high ?? 0} · ` +
    `moderada ${resumo.moderate ?? 0} · baixa ${resumo.low ?? 0}`,
);

if (conhecidasVistas.length) {
  console.log("\n  Conhecidas e registradas (não bloqueiam):");
  for (const { nome, v, permitida } of conhecidasVistas) {
    console.log(`    · ${nome} (${v.severity}) — issue #${permitida.issue}`);
    console.log(`      ${permitida.porque}`);
  }
}

// Item da lista que já não aparece é dívida quitada: avisa para a
// lista não virar cemitério de exceções que ninguém revisa.
const sumiram = CONHECIDAS.filter((c) => !achadas.some(([nome]) => nome === c.pacote));
if (sumiram.length) {
  console.log("\n  Já corrigidas — tire da lista em scripts/auditar-dependencias.mjs:");
  for (const c of sumiram) console.log(`    · ${c.pacote} (issue #${c.issue})`);
}

if (novas.length === 0) {
  console.log("\n✓ nenhuma falha grave fora do que já está registrado");
  process.exit(0);
}

console.error("\n✗ falha(s) grave(s) NOVA(S):");
for (const { nome, v } of novas) {
  const titulos = (v.via ?? [])
    .map((x) => (typeof x === "string" ? x : x.title))
    .filter(Boolean);
  console.error(`  · ${nome} (${v.severity}) — ${titulos.join("; ") || "sem título"}`);
  console.error(
    `    correção: ${v.fixAvailable ? JSON.stringify(v.fixAvailable) : "nenhuma disponível"}`,
  );
}
console.error(
  "\nCorrija com `npm audit fix`. Se não houver correção sem quebrar o\n" +
    "projeto, abra uma issue e acrescente o pacote à lista CONHECIDAS\n" +
    "deste arquivo, com o número da issue e o motivo da espera.",
);
process.exit(1);
