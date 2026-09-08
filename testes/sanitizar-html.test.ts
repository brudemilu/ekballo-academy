import { describe, expect, it } from "vitest";
import {
  contarPalavras,
  htmlParaTexto,
  resumir,
  sanitizarHtml,
} from "@/lib/sanitizar-html";

// =============================================================
// O sanitizador é o código mais sensível da plataforma: é ele que
// impede HTML hostil de entrar no caderno de anotações e ser
// servido de volta para quem lê — inclusive para o master, que lê
// o que os discípulos compartilham.
//
// O `CLAUDE.md` afirmava que ele havia sido "testado contra 17
// vetores". Os testes não existiam no repositório: a garantia era
// a lembrança de que um dia alguém testou. Este arquivo transforma
// essa lembrança em verificação que roda a cada PR.
//
// A abordagem do sanitizador ajuda a testar: ele RECONSTRÓI a
// partir de uma lista do que é permitido, em vez de tentar remover
// o que parece perigoso. Lista de permissão erra fechando; lista
// de proibição erra abrindo.
// =============================================================

describe("sanitizarHtml · execução de script", () => {
  it("mata a tag <script> junto com o conteúdo dela", () => {
    const saida = sanitizarHtml('<p>oi</p><script>alert("xss")</script>');
    expect(saida).not.toContain("script");
    expect(saida).not.toContain("alert");
    expect(saida).toContain("oi"); // o texto legítimo sobrevive
  });

  it("descarta manipulador de evento inline (onerror, onclick, onload)", () => {
    for (const vetor of [
      '<img src="x" onerror="alert(1)">',
      '<p onclick="roubar()">texto</p>',
      '<div onload="alert(1)">texto</div>',
      '<p ONMOUSEOVER="alert(1)">texto</p>', // caixa alta não escapa
    ]) {
      const saida = sanitizarHtml(vetor);
      expect(saida.toLowerCase()).not.toContain("onerror");
      expect(saida.toLowerCase()).not.toContain("onclick");
      expect(saida.toLowerCase()).not.toContain("onload");
      expect(saida.toLowerCase()).not.toContain("onmouseover");
      expect(saida).not.toContain("alert");
    }
  });

  it("recusa href com javascript:, inclusive quebrado por caractere de controle", () => {
    for (const vetor of [
      '<a href="javascript:alert(1)">clique</a>',
      '<a href="JaVaScRiPt:alert(1)">clique</a>',
      '<a href="java\nscript:alert(1)">clique</a>', // \n removido antes de checar
      '<a href="java\tscript:alert(1)">clique</a>',
      '<a href="  javascript:alert(1)">clique</a>',
      '<a href="data:text/html,<script>alert(1)</script>">clique</a>',
      '<a href="vbscript:msgbox(1)">clique</a>',
    ]) {
      const saida = sanitizarHtml(vetor);
      expect(saida.toLowerCase()).not.toContain("javascript:");
      expect(saida.toLowerCase()).not.toContain("vbscript:");
      expect(saida.toLowerCase()).not.toContain("data:text/html");
      expect(saida).toContain("clique"); // o texto do link permanece legível
    }
  });
});

describe("sanitizarHtml · tags que precisam morrer com o conteúdo", () => {
  it.each([
    ["svg", "<svg><script>alert(1)</script></svg>"],
    ["iframe", '<iframe src="https://evil.example"></iframe>'],
    ["style", "<style>body{display:none}</style>"],
    ["object", '<object data="evil.swf"></object>'],
    ["embed", '<embed src="evil.swf">'],
    ["noscript", "<noscript>escondido</noscript>"],
    ["template", "<template>oculto</template>"],
    ["textarea", "<textarea>bruto</textarea>"],
    ["base", '<base href="https://evil.example/">'],
    ["meta", '<meta http-equiv="refresh" content="0;url=https://evil.example">'],
    ["link", '<link rel="stylesheet" href="https://evil.example/x.css">'],
  ])("elimina <%s> por completo", (tag, vetor) => {
    const saida = sanitizarHtml(`<p>antes</p>${vetor}<p>depois</p>`);
    expect(saida.toLowerCase()).not.toContain(`<${tag}`);
    expect(saida).not.toContain("evil.example");
    expect(saida).not.toContain("alert");
    // O conteúdo legítimo em volta não pode ser levado junto.
    expect(saida).toContain("antes");
    expect(saida).toContain("depois");
  });
});

describe("sanitizarHtml · imagem só do próprio anexo", () => {
  it("aceita o endereço interno do anexo", () => {
    const saida = sanitizarHtml(
      '<p><img src="/api/anotacoes/anexos/abc-123/arquivo"></p>',
    );
    expect(saida).toContain("/api/anotacoes/anexos/abc-123/arquivo");
  });

  it("recusa imagem de fora, que vazaria o IP de quem lê", () => {
    const saida = sanitizarHtml('<img src="https://rastreador.example/pixel.gif">');
    expect(saida).not.toContain("rastreador.example");
  });

  it("recusa data: URI, que engordaria a anotação", () => {
    const saida = sanitizarHtml('<img src="data:image/png;base64,iVBORw0KGgo=">');
    expect(saida).not.toContain("data:image");
  });

  it("recusa caminho que só PARECE ser de anexo", () => {
    for (const src of [
      "/api/anotacoes/anexos/../../etc/passwd/arquivo",
      "/api/anotacoes/anexos/abc/arquivo/../../..",
      "https://evil.example/api/anotacoes/anexos/abc/arquivo",
    ]) {
      const saida = sanitizarHtml(`<img src="${src}">`);
      expect(saida).not.toContain("evil.example");
      expect(saida).not.toContain("passwd");
    }
  });
});

describe("sanitizarHtml · o que deve sobreviver", () => {
  it("mantém a formatação que o editor produz", () => {
    const entrada =
      "<h2>Título</h2><p><strong>forte</strong> e <em>ênfase</em></p>" +
      "<ul><li>um</li><li>dois</li></ul><blockquote>citação</blockquote>";
    const saida = sanitizarHtml(entrada);
    for (const tag of ["h2", "strong", "em", "ul", "li", "blockquote"]) {
      expect(saida).toContain(`<${tag}`);
    }
    expect(saida).toContain("Título");
    expect(saida).toContain("citação");
  });

  it("converte o marca-texto do navegador em <mark data-cor>, sem style cru", () => {
    const saida = sanitizarHtml(
      '<p><span style="background-color: #FEF08A">grifado</span></p>',
    );
    expect(saida).toContain("<mark");
    expect(saida).toContain("grifado");
    // Nenhum `style` cru pode chegar ao banco.
    expect(saida).not.toContain("style=");
  });

  it("preserva link externo legítimo", () => {
    const saida = sanitizarHtml('<a href="https://exemplo.com.br/artigo">leia</a>');
    expect(saida).toContain("https://exemplo.com.br/artigo");
    expect(saida).toContain("leia");
  });
});

describe("sanitizarHtml · limites e entradas degeneradas", () => {
  it("devolve string vazia para entrada vazia ou nula", () => {
    expect(sanitizarHtml("")).toBe("");
    expect(sanitizarHtml(undefined as unknown as string)).toBe("");
    expect(sanitizarHtml(null as unknown as string)).toBe("");
  });

  it("corta acima do teto de bytes em vez de engasgar", () => {
    const enorme = "<p>a</p>".repeat(200_000);
    const saida = sanitizarHtml(enorme, 1_000);
    expect(saida.length).toBeLessThan(2_000);
  });

  it("não quebra com HTML malformado", () => {
    for (const vetor of [
      "<p>sem fechar",
      "</p></div>fechamento solto",
      "<<<>>><p>ruído</p>",
      '<p class="aspas "quebradas">texto</p>',
      "<p><strong>aninhamento <em>trocado</strong></em></p>",
    ]) {
      expect(() => sanitizarHtml(vetor)).not.toThrow();
    }
  });
});

describe("htmlParaTexto · espelho de busca e prévia", () => {
  it("arranca as tags e mantém o texto legível", () => {
    expect(htmlParaTexto("<p>Primeiro</p><p>Segundo</p>")).toContain("Primeiro");
    expect(htmlParaTexto("<p>Primeiro</p><p>Segundo</p>")).toContain("Segundo");
  });

  it("não deixa tag vazar para o texto", () => {
    const txt = htmlParaTexto("<p>oi <strong>mundo</strong></p>");
    expect(txt).not.toContain("<");
    expect(txt).not.toContain(">");
  });

  it("devolve vazio para entrada vazia", () => {
    expect(htmlParaTexto("")).toBe("");
  });
});

describe("resumir e contarPalavras", () => {
  it("resumir não ultrapassa o tamanho pedido", () => {
    const longo = "palavra ".repeat(200);
    expect(resumir(longo, 50).length).toBeLessThanOrEqual(53); // margem da reticência
  });

  it("resumir devolve o texto inteiro quando já cabe", () => {
    expect(resumir("curto", 220)).toBe("curto");
  });

  it("contarPalavras conta certo, inclusive com espaço sobrando", () => {
    expect(contarPalavras("uma duas três")).toBe(3);
    expect(contarPalavras("  uma   duas  ")).toBe(2);
    expect(contarPalavras("")).toBe(0);
    expect(contarPalavras("   ")).toBe(0);
  });
});
