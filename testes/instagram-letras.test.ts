import { describe, expect, it } from "vitest";
import {
  alvoParaLinhas,
  larguraEmEms,
  quebrarEmLinhas,
  tamanhoParaCaber,
  textoDaLinha,
} from "@/lib/instagram-letras";
import { palavrasDoSlide } from "@/lib/instagram-modelos";

// =============================================================
// Medidas das letras (issue #211). O que não pode acontecer: a
// linha gigante vazar do quadro, ou a quebra deixar uma palavra
// sozinha e partir a frase no meio.
// =============================================================

const palavras = (t: string) => palavrasDoSlide(t, true).palavras;

describe("larguraEmEms", () => {
  it("letra larga ocupa mais que letra estreita", () => {
    expect(larguraEmEms("M", "anton")).toBeGreaterThan(larguraEmEms("I", "anton"));
  });

  it("a grotesca é bem mais larga que a condensada", () => {
    expect(larguraEmEms("MESA", "inter800")).toBeGreaterThan(
      larguraEmEms("MESA", "anton") * 1.3,
    );
  });

  it("caractere fora da tabela conta como a média, sem quebrar", () => {
    expect(larguraEmEms("漢", "anton")).toBeGreaterThan(0);
    expect(larguraEmEms("", "anton")).toBe(0);
  });

  it("letras acentuadas do português estão na tabela", () => {
    for (const c of "ÁÀÂÃÉÊÍÓÔÕÚÇ") {
      expect(larguraEmEms(c, "anton")).toBeGreaterThan(0.2);
    }
  });
});

describe("tamanhoParaCaber", () => {
  it("a linha no tamanho devolvido cabe na largura", () => {
    const texto = "TRANSFORMADOR";
    const tamanho = tamanhoParaCaber(texto, "anton", 800, 500);
    expect(larguraEmEms(texto, "anton") * tamanho).toBeLessThanOrEqual(800);
    // …e não sobra espaço para um tamanho maior.
    expect(larguraEmEms(texto, "anton") * (tamanho + 1)).toBeGreaterThan(800);
  });

  it("respeita o teto com texto curto", () => {
    expect(tamanhoParaCaber("OI", "anton", 800, 200)).toBe(200);
    expect(tamanhoParaCaber("", "anton", 800, 200)).toBe(200);
  });

  it("espaçamento negativo deixa caber uma letra maior", () => {
    expect(tamanhoParaCaber("MEMÓRIA", "inter800", 800, 900, -0.05)).toBeGreaterThan(
      tamanhoParaCaber("MEMÓRIA", "inter800", 800, 900),
    );
  });
});

describe("quebrarEmLinhas", () => {
  it("não perde nem repete palavra", () => {
    const p = palavras("Não centralize o que você deveria multiplicar");
    const linhas = quebrarEmLinhas(p, "anton", alvoParaLinhas(p, "anton", 4));
    expect(linhas.flat().map((w) => w.t)).toEqual(p.map((w) => w.t));
  });

  it("fim de frase quebra a linha, mesmo com espaço sobrando", () => {
    const p = palavras("A religião quer réplicas. O evangelho quer originais");
    const linhas = quebrarEmLinhas(p, "anton", 99).map(textoDaLinha);
    expect(linhas).toEqual(["A RELIGIÃO QUER RÉPLICAS.", "O EVANGELHO QUER ORIGINAIS"]);
  });

  it("chega perto do número de linhas pedido", () => {
    const p = palavras("Jesus ainda te convida para a mesa");
    const linhas = quebrarEmLinhas(p, "inter800", alvoParaLinhas(p, "inter800", 3));
    expect(linhas.length).toBeGreaterThanOrEqual(2);
    expect(linhas.length).toBeLessThanOrEqual(4);
  });

  it("uma palavra só vira uma linha só", () => {
    const p = palavras("Discipulado");
    expect(quebrarEmLinhas(p, "anton", alvoParaLinhas(p, "anton", 3))).toHaveLength(1);
  });
});

describe("marcação ~~riscado~~", () => {
  it("marca cada palavra do trecho e some com os tils", () => {
    const p = palavrasDoSlide("~~Eu não sou digno.~~ Jesus te convida").palavras;
    expect(p.filter((w) => w.riscada).map((w) => w.t)).toEqual([
      "Eu",
      "não",
      "sou",
      "digno.",
    ]);
    expect(p.map((w) => w.t).join(" ")).toBe("Eu não sou digno. Jesus te convida");
  });

  it("convive com o destaque", () => {
    const p = palavrasDoSlide("~~velho~~ {novo}").palavras;
    expect(p).toEqual([
      { t: "velho", destaque: false, riscada: true },
      { t: "novo", destaque: true },
    ]);
  });
});
