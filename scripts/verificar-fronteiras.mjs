#!/usr/bin/env node
// =============================================================
// EKBALLO ACADEMY · Fronteiras de arquitetura
//
// O CLAUDE.md avisa: "Don't import @/lib/supabase/server from a
// client component". Até agora esse aviso era só um aviso — nada
// verificava. Este script verifica.
//
// Por que um script e não uma dependência: as regras que importam
// aqui são três, e são específicas deste projeto. Instalar um
// framework de teste de arquitetura para expressar três regras
// custaria mais manutenção do que escreve-las à mão — e a regra
// "evitar overengineering" vale para a esteira também.
//
// A ARMADILHA que este script precisa evitar: `import type` some
// na compilação. Um checador ingênuo acusa `import type { X } from
// "@/lib/db"` como violação, quando não há nada no pacote do
// navegador. Checador que grita à toa é checador que todo mundo
// aprende a ignorar — e aí ele não protege mais nada.
// =============================================================

import { readFileSync } from "node:fs";
import { globSync } from "node:fs";

const VERMELHO = "\x1b[31m";
const VERDE = "\x1b[32m";
const AMARELO = "\x1b[33m";
const RESET = "\x1b[0m";

/** Só o que sobrevive à compilação: `import type` é apagado. */
function importaValorDe(src, modulo) {
  // Casa `import ... from "<modulo>"`, capturando o miolo entre chaves.
  const re = new RegExp(
    `import\\s+(type\\s+)?([^;]*?)\\s+from\\s+["']${modulo.replace(/[/\\]/g, "\\$&")}["']`,
    "g",
  );
  let m;
  while ((m = re.exec(src))) {
    // `import type { X } from` — apagado na compilação, não conta.
    if (m[1]) continue;
    const miolo = m[2];
    // `import { type A, type B }` — tudo tipo, também some.
    const chaves = miolo.match(/\{([^}]*)\}/);
    if (chaves) {
      const itens = chaves[1]
        .split(",")
        .map((s) => s.trim())
        .filter(Boolean);
      const temValor = itens.some((i) => !i.startsWith("type "));
      // Se há também import default fora das chaves, é valor.
      const fora = miolo.replace(/\{[^}]*\}/, "").replace(/,/g, "").trim();
      if (!temValor && !fora) continue;
    }
    return true;
  }
  return false;
}

const REGRAS = [
  {
    nome: "Componente de cliente não fala com o servidor",
    porque:
      "O código iria para o navegador. Na melhor hipótese o build quebra; na pior, chave de servidor vaza para o aparelho do aluno.",
    arquivos: ["components/**/*.tsx", "app/**/*.tsx"],
    valeSe: (src) => /^["']use client["']/m.test(src),
    proibido: ["@/lib/supabase/server", "@/lib/db"],
  },
  {
    nome: "Segredo de servidor não entra em componente de cliente",
    porque:
      "Variável sem o prefixo NEXT_PUBLIC_ não existe no navegador: lida ali, vem `undefined` e a falha aparece só em produção.",
    arquivos: ["components/**/*.tsx"],
    valeSe: (src) => /^["']use client["']/m.test(src),
    proibidoRegex: [
      {
        // NODE_ENV é exceção documentada: o Next embute o valor no
        // pacote em tempo de build, então ele EXISTE no navegador.
        // Sem essa exceção o checador acusa arquivo correto — e
        // checador que grita à toa deixa de ser lido.
        re: /process\.env\.(?!NEXT_PUBLIC_|NODE_ENV\b)[A-Z_][A-Z0-9_]*/g,
        rotulo: "process.env sem NEXT_PUBLIC_",
      },
    ],
  },
];

let violacoes = 0;
let arquivosLidos = 0;

for (const regra of REGRAS) {
  const arquivos = regra.arquivos.flatMap((p) =>
    globSync(p, { cwd: process.cwd() }),
  );
  for (const arq of arquivos) {
    let src;
    try {
      src = readFileSync(arq, "utf8");
    } catch {
      continue;
    }
    arquivosLidos++;
    if (regra.valeSe && !regra.valeSe(src)) continue;

    for (const modulo of regra.proibido ?? []) {
      if (importaValorDe(src, modulo)) {
        console.error(
          `${VERMELHO}✗${RESET} ${arq}\n  importa valor de "${modulo}"\n  ${AMARELO}${regra.porque}${RESET}`,
        );
        violacoes++;
      }
    }
    for (const { re, rotulo } of regra.proibidoRegex ?? []) {
      const achados = src.match(re);
      if (achados) {
        console.error(
          `${VERMELHO}✗${RESET} ${arq}\n  usa ${rotulo}: ${[...new Set(achados)].join(", ")}\n  ${AMARELO}${regra.porque}${RESET}`,
        );
        violacoes++;
      }
    }
  }
}

if (violacoes === 0) {
  console.log(
    `${VERDE}✓${RESET} fronteiras respeitadas (${arquivosLidos} arquivos verificados)`,
  );
  process.exit(0);
}
console.error(`\n${VERMELHO}${violacoes} violação(ões) de fronteira.${RESET}`);
process.exit(1);
