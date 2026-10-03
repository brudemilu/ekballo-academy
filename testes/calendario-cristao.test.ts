import { describe, expect, it } from "vitest";
import {
  dataPorExtenso,
  datasDoAno,
  datasEntre,
  enesimoDiaDaSemana,
  pascoa,
  primeiroDomingoDoAdvento,
  proximasDatas,
} from "@/lib/calendario-cristao";

// =============================================================
// Calendário cristão (issue #189). Data errada aqui vira post de
// Páscoa na semana errada — então as contas são conferidas contra
// datas conhecidas, não contra elas mesmas.
// =============================================================

const dia = (ano: number, chave: string) =>
  datasDoAno(ano).find((d) => d.chave === chave)?.dia;

describe("pascoa", () => {
  it.each([
    [2024, "2024-03-31"],
    [2025, "2025-04-20"],
    [2026, "2026-04-05"],
    [2027, "2027-03-28"],
    [2030, "2030-04-21"],
    // Os extremos possíveis: 22 de março e 25 de abril.
    [1818, "1818-03-22"],
    [2038, "2038-04-25"],
  ])("%i cai em %s", (ano, esperado) => {
    expect(pascoa(ano)).toBe(esperado);
  });
});

describe("datas móveis de 2026", () => {
  it("as que dependem da Páscoa", () => {
    expect(dia(2026, "cinzas")).toBe("2026-02-18");
    expect(dia(2026, "ramos")).toBe("2026-03-29");
    expect(dia(2026, "sexta-santa")).toBe("2026-04-03");
    expect(dia(2026, "ascensao")).toBe("2026-05-14");
    expect(dia(2026, "pentecostes")).toBe("2026-05-24");
  });

  it("as que são 'o enésimo dia da semana do mês'", () => {
    expect(dia(2026, "maes")).toBe("2026-05-10");
    expect(dia(2026, "pastor")).toBe("2026-06-14");
    expect(dia(2026, "pais")).toBe("2026-08-09");
    expect(dia(2026, "acao-de-gracas")).toBe("2026-11-26");
    expect(dia(2026, "biblia")).toBe("2026-12-13");
  });

  it("o mês que começa no próprio dia da semana procurado", () => {
    // 1º de novembro de 2026 é domingo: o 2º domingo é dia 8, não 15.
    expect(enesimoDiaDaSemana(2026, 11, 0, 1)).toBe("2026-11-01");
    expect(enesimoDiaDaSemana(2026, 11, 0, 2)).toBe("2026-11-08");
  });
});

describe("primeiroDomingoDoAdvento", () => {
  it.each([
    [2024, "2024-12-01"],
    [2025, "2025-11-30"],
    [2026, "2026-11-29"],
    // Natal no domingo: o 4º domingo do Advento é o dia 18, não o 25.
    [2022, "2022-11-27"],
    // Natal na segunda: o Advento começa o mais tarde possível.
    [2023, "2023-12-03"],
  ])("%i começa em %s", (ano, esperado) => {
    expect(primeiroDomingoDoAdvento(ano)).toBe(esperado);
  });
});

describe("datasDoAno", () => {
  it("vem em ordem e sem chave repetida", () => {
    const datas = datasDoAno(2026);
    const dias = datas.map((d) => d.dia);
    expect(dias).toEqual([...dias].sort());
    expect(new Set(datas.map((d) => d.chave)).size).toBe(datas.length);
  });

  it("toda data tem nome e um ângulo de conteúdo", () => {
    for (const d of datasDoAno(2027)) {
      expect(d.nome.length).toBeGreaterThan(3);
      expect(d.angulo.length).toBeGreaterThan(15);
    }
  });
});

describe("datasEntre e proximasDatas", () => {
  it("inclui as duas pontas", () => {
    expect(datasEntre("2026-10-31", "2026-11-02").map((d) => d.chave)).toEqual([
      "reforma",
      "finados",
    ]);
  });

  it("atravessa a virada do ano", () => {
    expect(datasEntre("2026-12-30", "2027-01-02").map((d) => d.chave)).toEqual([
      "virada",
      "ano-novo",
    ]);
  });

  it("intervalo invertido ou sem data devolve vazio", () => {
    expect(datasEntre("2026-07-10", "2026-07-01")).toEqual([]);
    expect(datasEntre("2026-07-01", "2026-07-10")).toEqual([]);
  });

  it("as próximas a partir de hoje", () => {
    expect(proximasDatas("2026-10-03", 30).map((d) => d.chave)).toEqual([
      "criancas",
      "reforma",
      "finados",
    ]);
  });
});

describe("dataPorExtenso", () => {
  it("diz o nome e o dia da semana certo, sem escorregar de fuso", () => {
    const p = datasDoAno(2026).find((d) => d.chave === "pascoa");
    expect(p && dataPorExtenso(p)).toBe("Páscoa — domingo, 5 de abril");
  });
});
