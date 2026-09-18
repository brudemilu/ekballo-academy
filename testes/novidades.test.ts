import { describe, expect, it } from "vitest";
import { DIAS_EM_DESTAQUE, livrosRecentes, rotuloDeChegada } from "@/lib/novidades";

// =============================================================
// A faixa de recém-chegados (issue #157) faz uma promessa ao
// livro que entra: uma semana inteira em destaque, contada da
// entrada dele. Quem administra o acervo sobe os livros em levas
// (nove de uma vez, no caso real) — então o risco concreto é uma
// leva nova empurrar pra fora um livro que ainda tinha dias de
// vitrine. Estes testes existem pra isso não acontecer calado.
// =============================================================

const UM_DIA = 24 * 60 * 60 * 1000;
// 17/set/2026, 10h em São Paulo (13h UTC — SP é UTC-3 o ano todo).
const AGORA = Date.parse("2026-09-17T13:00:00Z");

const livro = (id: string, diasAtras: number) => ({
  id,
  created_at: new Date(AGORA - diasAtras * UM_DIA).toISOString(),
});

describe("livrosRecentes · quem entra na faixa", () => {
  it("mantém o que entrou dentro da semana", () => {
    const dentro = livrosRecentes(
      [livro("hoje", 0), livro("ontem", 1), livro("quase", 6.9)],
      AGORA,
    );
    expect(dentro.map((l) => l.id)).toEqual(["hoje", "ontem", "quase"]);
  });

  it("solta o que passou da semana", () => {
    const dentro = livrosRecentes([livro("velho", 8), livro("novo", 2)], AGORA);
    expect(dentro.map((l) => l.id)).toEqual(["novo"]);
  });

  it("uma semana cravada já está fora — a promessa é 'pelo menos', não 'para sempre'", () => {
    expect(livrosRecentes([livro("exato", DIAS_EM_DESTAQUE)], AGORA)).toEqual([]);
  });

  it("ordena do mais novo pro mais antigo", () => {
    const ordem = livrosRecentes(
      [livro("c", 5), livro("a", 0.5), livro("b", 3)],
      AGORA,
    );
    expect(ordem.map((l) => l.id)).toEqual(["a", "b", "c"]);
  });

  it("livro sem data, ou com data ilegível, não é novidade", () => {
    const r = livrosRecentes(
      [
        { id: "sem", created_at: null },
        { id: "vazio", created_at: undefined },
        { id: "lixo", created_at: "não é data" },
        livro("bom", 1),
      ],
      AGORA,
    );
    expect(r.map((l) => l.id)).toEqual(["bom"]);
  });

  it("data no futuro (relógio adiantado) conta como recém-chegado", () => {
    const r = livrosRecentes([livro("futuro", -1), livro("hoje", 0)], AGORA);
    expect(r.map((l) => l.id)).toEqual(["futuro", "hoje"]);
  });

  it("UMA LEVA GRANDE NÃO EXPULSA quem ainda tem semana a cumprir", () => {
    // O caso real: nove livros de uma vez. O de anteontem tem que continuar lá.
    const leva = Array.from({ length: 30 }, (_, i) => livro(`leva-${i}`, 0));
    const r = livrosRecentes([...leva, livro("anteontem", 2)], AGORA);
    expect(r).toHaveLength(31);
    expect(r.map((l) => l.id)).toContain("anteontem");
  });

  it("acervo sem nenhuma entrada na semana devolve lista vazia (a faixa some)", () => {
    expect(livrosRecentes([livro("a", 30), livro("b", 90)], AGORA)).toEqual([]);
  });
});

describe("rotuloDeChegada · o que a pessoa lê embaixo da capa", () => {
  it("hoje e ontem", () => {
    expect(rotuloDeChegada("2026-09-17T12:00:00Z", AGORA)).toBe("chegou hoje");
    expect(rotuloDeChegada("2026-09-16T12:00:00Z", AGORA)).toBe("chegou ontem");
  });

  it("usa o calendário de São Paulo, não 24h corridas", () => {
    // 23h de ontem em SP = 02h UTC de hoje. Faz 11 horas, mas foi ONTEM —
    // contar 24h corridas diria "hoje" e brigaria com o que a pessoa lembra.
    expect(rotuloDeChegada("2026-09-17T02:00:00Z", AGORA)).toBe("chegou ontem");
  });

  it("de dois dias em diante, conta os dias", () => {
    expect(rotuloDeChegada("2026-09-14T13:00:00Z", AGORA)).toBe("há 3 dias");
    expect(rotuloDeChegada("2026-09-11T13:00:00Z", AGORA)).toBe("há 6 dias");
  });

  it("sem data, sem rótulo — e sem quebrar", () => {
    expect(rotuloDeChegada(null, AGORA)).toBe("");
    expect(rotuloDeChegada("não é data", AGORA)).toBe("");
  });
});
