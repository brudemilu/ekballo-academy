import { defineConfig, devices } from "@playwright/test";

// =============================================================
// EKBALLO ACADEMY · Testes de ponta a ponta
//
// Rodam contra o app DE VERDADE, em build de produção, no modo
// demonstração — dados de mentira, nenhum Supabase real envolvido.
// É isso que torna seguro rodá-los em CI: nenhuma chave de produção
// entra na esteira, e nenhum teste escreve no banco de ninguém.
//
// Por que build de produção e não `next dev`: em desenvolvimento o
// Next carrega CSS por rota via JavaScript e recompila sob demanda.
// Um teste que passa no dev pode falhar em produção, e vice-versa —
// já aconteceu aqui, ao verificar as telas de carregamento.
//
// O escopo é DE FUMAÇA, de propósito: as telas principais abrem,
// respondem e não têm erro de JavaScript. Teste de ponta a ponta é
// caro de manter e quebra por motivo bobo; cobrir cada detalhe aqui
// faria a esteira virar estorvo. O detalhe fica no teste unitário.
// =============================================================

const PORTA = 3399;
const BASE = `http://127.0.0.1:${PORTA}`;

export default defineConfig({
  testDir: "./testes-e2e",
  outputDir: "./testes-e2e/resultado",

  // Em CI, teste que "às vezes passa" é pior que teste que falha:
  // ensina a equipe a apertar "rodar de novo" sem ler. `forbidOnly`
  // impede que um `.only` esquecido faça a esteira verificar um teste
  // só e passar verde.
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 1 : 0,
  workers: process.env.CI ? 2 : undefined,
  timeout: 45_000,
  expect: { timeout: 10_000 },

  reporter: process.env.CI
    ? [["html", { outputFolder: "testes-e2e/relatorio", open: "never" }], ["list"]]
    : [["list"]],

  use: {
    baseURL: BASE,
    trace: "on-first-retry",
    screenshot: "only-on-failure",
  },

  projects: [
    { name: "desktop", use: { ...devices["Desktop Chrome"] } },
    // O celular não é um "extra": é onde o discípulo lê de fato.
    { name: "celular", use: { ...devices["Pixel 7"] } },
  ],

  webServer: {
    command: `npx next start -p ${PORTA}`,
    url: BASE,
    reuseExistingServer: !process.env.CI,
    timeout: 120_000,
    env: { NEXT_PUBLIC_MOCK_MODE: "true" },
  },
});
