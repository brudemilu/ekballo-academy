import { defineConfig } from "vitest/config";
import { resolve } from "node:path";

// =============================================================
// EKBALLO ACADEMY · Testes unitários
//
// O alvo aqui é LÓGICA PURA — o que dá para exercitar sem banco,
// sem rede e sem navegador. Nesta plataforma isso quer dizer, na
// prática: o sanitizador de HTML, o normalizador de telefone e o
// interpretador de referência bíblica.
//
// O que NÃO entra aqui, de propósito: componente de tela e rota
// que fala com o Supabase. Testar isso com camada de mentira
// (mock) custa caro para manter e prova pouco — o que responde por
// essas partes é o teste de ponta a ponta com Playwright, contra o
// app rodando de verdade.
// =============================================================

export default defineConfig({
  resolve: {
    // Mesmo "@/" do tsconfig, senão o import quebra dentro do teste.
    alias: { "@": resolve(__dirname, ".") },
  },
  test: {
    environment: "node",
    include: ["testes/**/*.test.ts"],
    coverage: {
      provider: "v8",
      reportsDirectory: "coverage",
      reporter: ["text-summary", "lcov"],
      // Só o que os testes se propõem a cobrir. Medir cobertura do
      // repositório inteiro produziria um número baixo e sem
      // significado, que todo mundo aprende a ignorar.
      include: [
        "lib/sanitizar-html.ts",
        "lib/telefone.ts",
        "lib/biblia-busca.ts",
      ],
      thresholds: {
        // Piso, não meta. Serve para acusar remoção de teste, não
        // para incentivar teste decorativo atrás de porcentagem.
        statements: 70,
        branches: 70,
        functions: 70,
        lines: 70,
      },
    },
  },
});
