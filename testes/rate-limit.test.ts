import { describe, it, expect, beforeEach, vi, afterEach } from "vitest";
import {
  limitar,
  chaveDoPedido,
  respostaExcedida,
  _limparTudo,
} from "@/lib/rate-limit";

beforeEach(() => _limparTudo());
afterEach(() => vi.useRealTimers());

describe("limitar", () => {
  it("deixa passar até o limite e barra a partir dele", () => {
    for (let i = 1; i <= 5; i++) {
      expect(limitar("x", 5, 60_000).permitido, `tentativa ${i}`).toBe(true);
    }
    expect(limitar("x", 5, 60_000).permitido).toBe(false);
  });

  it("conta cada chave separadamente — um aluno não bloqueia outro", () => {
    for (let i = 0; i < 5; i++) limitar("aluno-a", 5, 60_000);
    expect(limitar("aluno-a", 5, 60_000).permitido).toBe(false);
    expect(limitar("aluno-b", 5, 60_000).permitido).toBe(true);
  });

  it("libera de novo quando a janela passa", () => {
    vi.useFakeTimers();
    for (let i = 0; i < 5; i++) limitar("y", 5, 60_000);
    expect(limitar("y", 5, 60_000).permitido).toBe(false);

    vi.advanceTimersByTime(60_001);
    expect(limitar("y", 5, 60_000).permitido).toBe(true);
  });

  it("informa quantos segundos faltam para poder tentar de novo", () => {
    vi.useFakeTimers();
    for (let i = 0; i < 5; i++) limitar("z", 5, 60_000);
    vi.advanceTimersByTime(20_000);

    const v = limitar("z", 5, 60_000);
    expect(v.permitido).toBe(false);
    expect(v.esperarSegundos).toBeGreaterThan(0);
    expect(v.esperarSegundos).toBeLessThanOrEqual(40);
  });

  it("conta as restantes de forma útil e nunca abaixo de zero", () => {
    expect(limitar("w", 3, 60_000).restantes).toBe(2);
    expect(limitar("w", 3, 60_000).restantes).toBe(1);
    expect(limitar("w", 3, 60_000).restantes).toBe(0);
    expect(limitar("w", 3, 60_000).restantes).toBe(0);
  });
});

describe("chaveDoPedido", () => {
  function pedido(cabecalhos: Record<string, string>) {
    return new Request("https://exemplo.test/api", { headers: cabecalhos });
  }

  it("usa o PRIMEIRO endereço do x-forwarded-for (o cliente real)", () => {
    // Ler o último limitaria o próprio proxy — ou seja, a plataforma
    // inteira de uma vez, com um único abusador.
    const chave = chaveDoPedido(
      pedido({ "x-forwarded-for": "203.0.113.9, 10.0.0.1, 10.0.0.2" }),
      "p",
    );
    expect(chave).toBe("p:203.0.113.9");
  });

  it("cai para x-real-ip quando não há x-forwarded-for", () => {
    expect(chaveDoPedido(pedido({ "x-real-ip": "198.51.100.7" }), "p")).toBe(
      "p:198.51.100.7",
    );
  });

  it("não quebra quando não há cabeçalho nenhum", () => {
    expect(chaveDoPedido(pedido({}), "p")).toBe("p:desconhecido");
  });

  it("separa por prefixo — pedir código e confirmar código têm cotas próprias", () => {
    const cab = { "x-forwarded-for": "203.0.113.9" };
    expect(chaveDoPedido(pedido(cab), "recuperar")).not.toBe(
      chaveDoPedido(pedido(cab), "confirmar"),
    );
  });
});

describe("respostaExcedida", () => {
  it("devolve 429 com Retry-After, que é o que o navegador entende", async () => {
    const r = respostaExcedida(
      { permitido: false, restantes: 0, esperarSegundos: 42 },
      "Muitas tentativas.",
    );
    expect(r.status).toBe(429);
    expect(r.headers.get("retry-after")).toBe("42");
    expect((await r.json()).erro).toContain("Muitas tentativas");
  });
});
