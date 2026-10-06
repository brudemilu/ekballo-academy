import { resolve } from "node:path";
import { defineConfig } from "vitest/config";

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
  // O tsconfig do Next pede `jsx: preserve` (quem transforma é o Next). O
  // Vite 8, que veio com o Vitest 5, passou a obedecer isso e a entregar JSX
  // cru para o analisador de imports — que não lê JSX e quebrava todo teste
  // que importa um `.tsx`. Aqui o JSX é transformado de fato.
  oxc: { jsx: { runtime: "automatic" } },
  test: {
    environment: "node",
    include: ["testes/**/*.test.ts"],
    coverage: {
      provider: "v8",
      reportsDirectory: "coverage",
      reporter: ["text-summary", "lcov"],
      // Só o que os testes REALMENTE cobrem. Listar arquivo sem teste
      // aqui derruba a cobertura e reprova a esteira por contabilidade,
      // não por qualidade — foi o que aconteceu na primeira execução.
      // Ao escrever teste novo, acrescente o arquivo aqui.
      include: [
        "lib/sanitizar-html.ts",
        "lib/telefone.ts",
        "lib/rate-limit.ts",
        "lib/conteudo-calendario.ts",
        "lib/conteudo-perfil.ts",
        "lib/roteiro.ts",
        "lib/pacote.ts",
        "lib/cortes.ts",
        "lib/piloto.ts",
        "lib/imagem-livre.ts",
        "lib/carrossel-ideia.ts",
        "lib/json-ia.ts",
        "lib/assistente.ts",
        "lib/whatsapp-instagram.ts",
        "lib/instagram-modelos.ts",
        "lib/instagram-letras.ts",
        "lib/calendario-cristao.ts",
        "lib/comentarios-auto.ts",
        "lib/painel.ts",
        "lib/crescimento.ts",
        "lib/legenda-reel.ts",
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
