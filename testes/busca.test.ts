import { describe, expect, it } from "vitest";
import {
  combinaBusca,
  normalizarBusca,
  termosDaBusca,
  textoBuscavelDoLivro,
} from "@/lib/busca";

// =============================================================
// O acervo passou de 200 livros e o único jeito de achar um era
// rolar a vitrine inteira (issue #116). O filtro é digitado por
// gente no celular, com pressa e sem acento: se "pastor imperf"
// não achar "O Pastor Imperfeito", o campo de busca não serve
// pra nada e a pessoa volta a rolar a página.
// =============================================================

describe("normalizarBusca · forma canônica dos dois lados", () => {
  it.each([
    ["João Calvino", "joao calvino"],
    ["ORAÇÃO", "oracao"],
    ["Ética Cristã", "etica crista"],
    ["  espaço   sobrando  ", "espaco sobrando"],
    ["O Cristão e a Cultura", "o cristao e a cultura"],
  ])("%s → %s", (entrada, esperado) => {
    expect(normalizarBusca(entrada)).toBe(esperado);
  });

  it("trata pontuação como separador, não como caractere buscável", () => {
    // "Deus, o Pai — vida" e "Deus o Pai vida" têm que virar a mesma coisa,
    // senão o título com travessão nunca casa com o que a pessoa digita.
    expect(normalizarBusca("Deus, o Pai — vida")).toBe("deus o pai vida");
    expect(normalizarBusca("A Vida (em Cristo)")).toBe("a vida em cristo");
  });
});

describe("termosDaBusca", () => {
  it("devolve lista vazia para consulta vazia ou só espaço", () => {
    expect(termosDaBusca("")).toEqual([]);
    expect(termosDaBusca("   ")).toEqual([]);
  });

  it("quebra em termos normalizados", () => {
    expect(termosDaBusca("Pastor Imperfeito")).toEqual(["pastor", "imperfeito"]);
  });
});

describe("combinaBusca · o que a pessoa digita achando o livro", () => {
  const titulo = "O Pastor Imperfeito — Zack Eswine";

  it("acha por pedaço do título", () => {
    expect(combinaBusca(titulo, "pastor")).toBe(true);
    expect(combinaBusca(titulo, "imperf")).toBe(true);
  });

  it("ignora acento e caixa dos dois lados", () => {
    expect(combinaBusca("A Imitação de Cristo", "imitacao")).toBe(true);
    expect(combinaBusca("A Imitacao de Cristo", "IMITAÇÃO")).toBe(true);
  });

  it("aceita os termos fora de ordem", () => {
    expect(combinaBusca(titulo, "imperfeito pastor")).toBe(true);
  });

  it("exige TODOS os termos — E, não OU", () => {
    // O ponto do filtro é estreitar: "keller ego" não pode devolver todo
    // livro que apenas cite Keller.
    expect(combinaBusca("Ego Transformado — Timothy Keller", "keller ego")).toBe(true);
    expect(combinaBusca("Ego Transformado — Timothy Keller", "keller oracao")).toBe(
      false,
    );
  });

  it("acha pelo autor, que entra no mesmo texto buscável", () => {
    expect(combinaBusca("Ego Transformado Timothy Keller", "timothy")).toBe(true);
  });

  it("consulta vazia não filtra nada", () => {
    expect(combinaBusca(titulo, "")).toBe(true);
    expect(combinaBusca(titulo, "   ")).toBe(true);
  });

  it("não casa o que não está lá", () => {
    expect(combinaBusca(titulo, "perspectivas")).toBe(false);
  });
});

describe("textoBuscavelDoLivro · o que as três vitrines deixam o filtro ver", () => {
  it("junta título, autor e seção", () => {
    expect(
      textoBuscavelDoLivro(
        { titulo: "Ego Transformado", autor: "Timothy Keller" },
        "Espiritual",
      ),
    ).toBe("Ego Transformado Timothy Keller Espiritual");
  });

  it("aguenta livro sem autor e sem seção", () => {
    expect(textoBuscavelDoLivro({ titulo: "Bíblia" })).toBe("Bíblia");
    expect(textoBuscavelDoLivro({ titulo: "Bíblia", autor: null }, "")).toBe("Bíblia");
  });

  it("o texto que ele devolve realmente casa na busca", () => {
    // O contrato entre os dois: o que este helper monta é o que combinaBusca lê.
    const texto = textoBuscavelDoLivro(
      { titulo: "O Pastor Imperfeito", autor: "Zack Eswine" },
      "Pastoral & Cuidado",
    );
    expect(combinaBusca(texto, "eswine")).toBe(true);
    expect(combinaBusca(texto, "imperfeito pastor")).toBe(true);
    expect(combinaBusca(texto, "pastoral")).toBe(true);
    expect(combinaBusca(texto, "keller")).toBe(false);
  });
});
