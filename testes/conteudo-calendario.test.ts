import { describe, expect, it } from "vitest";
import {
  diaDoPost,
  diaSP,
  diasDaSemana,
  inicioDaSemana,
  somarDias,
  validarIdeia,
} from "@/lib/conteudo-calendario";

// =============================================================
// Calendário do copiloto de conteúdo (issue #189). O erro que
// mais custa aqui é silencioso: um post das 22h de domingo cair
// na segunda porque o servidor roda em UTC, ou a semana começar
// no dia errado. Quem planeja olha o calendário e confia nele.
// =============================================================

describe("diaSP · dia de parede em São Paulo", () => {
  it("22h de domingo em SP continua domingo, mesmo já sendo segunda em UTC", () => {
    // 2026-10-04 é domingo; 22h em SP = 01h do dia 5 em UTC
    expect(diaSP("2026-10-05T01:00:00Z")).toBe("2026-10-04");
  });

  it("de madrugada em UTC ainda é o dia anterior em SP", () => {
    expect(diaSP("2026-10-06T02:59:00Z")).toBe("2026-10-05");
    expect(diaSP("2026-10-06T03:00:00Z")).toBe("2026-10-06");
  });
});

describe("semana · segunda a domingo", () => {
  it.each([
    ["2026-10-05", "2026-10-05"], // segunda é a própria segunda
    ["2026-10-08", "2026-10-05"], // quinta
    ["2026-10-11", "2026-10-05"], // domingo fecha a semana, não abre
    ["2026-10-12", "2026-10-12"],
  ])("%s pertence à semana que começa em %s", (dia, segunda) => {
    expect(inicioDaSemana(dia)).toBe(segunda);
  });

  it("atravessa virada de mês e de ano", () => {
    expect(inicioDaSemana("2027-01-01")).toBe("2026-12-28");
    expect(somarDias("2026-02-28", 1)).toBe("2026-03-01");
  });

  it("monta os 7 dias em ordem", () => {
    expect(diasDaSemana("2026-12-28")).toEqual([
      "2026-12-28",
      "2026-12-29",
      "2026-12-30",
      "2026-12-31",
      "2027-01-01",
      "2027-01-02",
      "2027-01-03",
    ]);
  });
});

describe("diaDoPost · onde cada post aparece", () => {
  it("publicado vale pela data em que saiu, não pela que foi marcada", () => {
    expect(
      diaDoPost({
        status: "publicado",
        agendado_para: "2026-10-05T12:00:00Z",
        publicado_em: "2026-10-06T12:00:00Z",
      }),
    ).toBe("2026-10-06");
  });

  it("agendado e com erro aparecem no dia marcado", () => {
    expect(
      diaDoPost({ status: "agendado", agendado_para: "2026-10-07T21:00:00Z" }),
    ).toBe("2026-10-07");
    expect(diaDoPost({ status: "erro", agendado_para: "2026-10-07T21:00:00Z" })).toBe(
      "2026-10-07",
    );
  });

  it("rascunho não tem dia", () => {
    expect(diaDoPost({ status: "rascunho", agendado_para: null })).toBeNull();
  });
});

describe("validarIdeia", () => {
  it("cria com título e limpa espaços", () => {
    expect(validarIdeia({ titulo: "  Mesa 01 em reel ", formato: "reel" })).toEqual({
      ok: true,
      valor: { titulo: "Mesa 01 em reel", formato: "reel" },
    });
  });

  it("criar sem título é recusado com mensagem para a tela", () => {
    expect(validarIdeia({ titulo: "   " })).toEqual({
      ok: false,
      erro: "Dê um título para a ideia.",
    });
  });

  it("no PATCH, só o que veio é conferido", () => {
    expect(validarIdeia({ data_planejada: "2026-10-09" }, true)).toEqual({
      ok: true,
      valor: { data_planejada: "2026-10-09" },
    });
  });

  it("data vazia tira a ideia da agenda", () => {
    expect(validarIdeia({ data_planejada: "" }, true)).toEqual({
      ok: true,
      valor: { data_planejada: null },
    });
  });

  it.each(["2026-02-31", "09/10/2026", "amanhã", 20261009])("recusa data %s", (d) => {
    expect(validarIdeia({ data_planejada: d }, true)).toEqual({
      ok: false,
      erro: "Data inválida.",
    });
  });

  it("recusa formato fora da lista e corpo que não é objeto", () => {
    expect(validarIdeia({ titulo: "x", formato: "tiktok" })).toEqual({
      ok: false,
      erro: "Formato inválido.",
    });
    expect(validarIdeia(null)).toEqual({ ok: false, erro: "Corpo inválido." });
  });

  it("recusa título e nota longos demais", () => {
    expect(validarIdeia({ titulo: "a".repeat(201) }).ok).toBe(false);
    expect(validarIdeia({ titulo: "a", nota: "b".repeat(5001) }).ok).toBe(false);
  });
});
