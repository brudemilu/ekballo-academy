import { test, expect, type Page } from "@playwright/test";

// =============================================================
// Teste de fumaça: as telas principais do discípulo abrem, mostram
// o conteúdo certo e não soltam erro de JavaScript.
//
// A regra que mantém isto útil ao longo do tempo: verificar o que o
// ALUNO vê — um título, um livro na estante, um versículo — e não a
// estrutura interna da página. Teste amarrado a nome de classe
// quebra a cada ajuste de visual e é abandonado em três meses.
// =============================================================

/** Falha o teste se a página soltar erro de JavaScript. */
function vigiarErros(page: Page): string[] {
  const erros: string[] = [];
  page.on("pageerror", (e) => erros.push(e.message));
  page.on("console", (m) => {
    if (m.type() !== "error") return;
    const t = m.text();
    // Falha de rede de recurso externo (fonte, imagem de fora) não é
    // defeito do app e polui o resultado.
    if (/favicon|net::ERR_|Failed to load resource/i.test(t)) return;
    erros.push(t);
  });
  return erros;
}

test.describe("telas do discípulo", () => {
  test("o painel abre e mostra a saudação e os atalhos", async ({ page }) => {
    const erros = vigiarErros(page);
    await page.goto("/dashboard");

    await expect(page.getByText(/bem-vindo de volta/i)).toBeVisible();
    await expect(page.getByRole("link", { name: /minhas anotações/i })).toBeVisible();

    expect(erros, `erros de JS: ${erros.join(" | ")}`).toHaveLength(0);
  });

  test("a temática lista as mesas e cada uma leva à leitura", async ({ page }) => {
    const erros = vigiarErros(page);
    await page.goto("/cursos/fundamentos-do-discipulado");

    await expect(
      page.getByRole("heading", { name: /fundamentos do discipulado/i }),
    ).toBeVisible();

    const mesas = page.locator("a.linha-nav");
    await expect(mesas.first()).toBeVisible();
    expect(await mesas.count()).toBeGreaterThan(0);

    await mesas.first().click();
    await expect(page).toHaveURL(/\/aulas\//);

    expect(erros, `erros de JS: ${erros.join(" | ")}`).toHaveLength(0);
  });

  test("a estante abre e explica o que fazer quando está vazia", async ({ page }) => {
    const erros = vigiarErros(page);
    await page.goto("/biblioteca");

    // Tela vazia é convite à ação, não beco sem saída — a cópia tem
    // que dizer o próximo passo.
    await expect(page.getByRole("link", { name: /ver temáticas/i })).toBeVisible();

    expect(erros, `erros de JS: ${erros.join(" | ")}`).toHaveLength(0);
  });

  test("a Bíblia abre e o seletor de livro carrega", async ({ page }) => {
    const erros = vigiarErros(page);
    await page.goto("/anotacoes");

    const livro = page.locator("select").first();
    await expect(livro).toBeVisible();
    // A lista vem da API: se não carregar, o seletor fica só com o
    // rótulo e o aluno não chega ao texto.
    await expect(livro.locator("option")).not.toHaveCount(1);

    expect(erros, `erros de JS: ${erros.join(" | ")}`).toHaveLength(0);
  });
});

test.describe("acessibilidade mínima", () => {
  test("o Tab leva a foco em elemento interativo, com marca visível", async ({
    page,
  }) => {
    await page.goto("/cursos/fundamentos-do-discipulado");

    // Duas coisas separadas, porque falham por motivos diferentes:
    // 1) o Tab precisa CHEGAR a algo interativo (não ficar preso no body);
    // 2) o que recebeu foco precisa MOSTRAR que recebeu.
    //
    // Não afirmo nada sobre o anel padrão do navegador: ele varia entre
    // navegador e versão, e um teste amarrado a esse detalhe passa a
    // falhar sozinho. O que este projeto controla é o anel próprio,
    // definido em `.pressiona:focus-visible` / `.linha-nav:focus-visible`.
    let foco = null;
    for (let i = 0; i < 25; i++) {
      await page.keyboard.press("Tab");
      foco = await page.evaluate(() => {
        const a = document.activeElement;
        if (!a || a === document.body) return null;
        const e = getComputedStyle(a);
        return {
          tag: a.tagName,
          nossa: a.classList.contains("linha-nav") || a.classList.contains("pressiona"),
          temMarca: e.outlineStyle !== "none" || e.boxShadow !== "none",
        };
      });
      if (foco?.nossa) break;
    }

    expect(foco, "o Tab não chegou a nenhum elemento interativo").not.toBeNull();
    expect(
      foco?.temMarca,
      "o elemento focado não mostra nenhuma marca de foco",
    ).toBe(true);
  });

  test("a página declara o idioma, sem o que a hifenização não funciona", async ({
    page,
  }) => {
    await page.goto("/dashboard");
    await expect(page.locator("html")).toHaveAttribute("lang", /pt/i);
  });
});
