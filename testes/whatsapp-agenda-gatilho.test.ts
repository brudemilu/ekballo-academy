import { describe, expect, it } from "vitest";
import {
  pareceCompromisso,
  pedidoDaAgenda,
  semGatilhoDaAgenda,
} from "@/lib/whatsapp-agenda-gatilho";
import { ehDoRobo, interpretarComando } from "@/lib/whatsapp-instagram";

// =============================================================
// Gatilho da agenda pelo WhatsApp (issue #252). O que não pode
// acontecer: "Colocar na agenda: …" ser ignorado em silêncio — nem
// uma anotação qualquer do chat "Você" virar compromisso.
// =============================================================

describe("pedidoDaAgenda", () => {
  it("as duas mensagens reais de 10/out/2026", () => {
    expect(pedidoDaAgenda("Colocar na agenda: Aniversário da May dia 03/01")).toBe(
      "Aniversário da May dia 03/01",
    );
    // sem a palavra "agenda" não é pedido — quem responde é a dica
    expect(pedidoDaAgenda("Aniversário da May dia 03/01")).toBeNull();
  });

  it("gatilho no começo continua valendo", () => {
    expect(pedidoDaAgenda("agendar aniversário da May dia 3/1")).toBe(
      "aniversário da May dia 3/1",
    );
    expect(pedidoDaAgenda("Agenda: reunião quinta 15h")).toBe("reunião quinta 15h");
    expect(pedidoDaAgenda("  agende - culto domingo 19h")).toBe("culto domingo 19h");
  });

  it("jeitos naturais de citar a agenda", () => {
    const esperado = "reunião quinta 15h";
    for (const frase of [
      "coloca na agenda reunião quinta 15h",
      "Põe na minha agenda: reunião quinta 15h",
      "marcar na agenda, reunião quinta 15h",
      "Anota aí na agenda reunião quinta 15h",
      "adicionar para a agenda reunião quinta 15h",
      "bota pra agenda reunião quinta 15h",
    ]) {
      expect(pedidoDaAgenda(frase), frase).toBe(esperado);
    }
  });

  it("não confunde anotação nem palavra parecida", () => {
    expect(pedidoDaAgenda("agendamento da clínica ficou pra maio")).toBeNull();
    expect(pedidoDaAgenda("ver a agenda do pastor João")).toBeNull();
    expect(pedidoDaAgenda("colocar na agenda")).toBeNull();
    expect(pedidoDaAgenda("agenda")).toBeNull();
    expect(pedidoDaAgenda("")).toBeNull();
  });

  it("não rouba os comandos do Instagram, nem eles os da agenda", () => {
    for (const cmd of ["Refazer", "Descartar", "publicar terça 19h", "post sobre fé"]) {
      expect(pedidoDaAgenda(cmd), cmd).toBeNull();
    }
    expect(
      interpretarComando("Colocar na agenda: Aniversário da May dia 03/01"),
    ).toBeNull();
  });
});

describe("semGatilhoDaAgenda (legenda de foto)", () => {
  it("tira o gatilho e deixa a observação", () => {
    expect(semGatilhoDaAgenda("agenda esse convite")).toBe("esse convite");
    expect(semGatilhoDaAgenda("coloca na agenda: é sexta que vem")).toBe(
      "é sexta que vem",
    );
    expect(semGatilhoDaAgenda("agenda")).toBe("");
    expect(semGatilhoDaAgenda("às 20h")).toBe("às 20h");
  });
});

describe("pareceCompromisso (só decide a dica)", () => {
  it("texto curto com data ou hora", () => {
    expect(pareceCompromisso("Aniversário da May dia 03/01")).toBe(true);
    expect(pareceCompromisso("Reunião com a equipe quinta às 15h")).toBe(true);
    expect(pareceCompromisso("Culto 19:30")).toBe(true);
    expect(pareceCompromisso("Dentista dia 12")).toBe(true);
  });

  it("anotação sem data nem hora não recebe dica", () => {
    expect(pareceCompromisso("Story identidade")).toBe(false);
    expect(pareceCompromisso("comprar pão")).toBe(false);
    expect(pareceCompromisso("")).toBe(false);
  });

  it("avisos do próprio sistema não recebem dica", () => {
    // confirmação da agenda: várias linhas e começa com emoji
    expect(
      pareceCompromisso(
        "✅ Recebi. Vou adicionar ao seu Google Agenda:\n*Culto*\n🗓️ 03/01 19:00",
      ),
    ).toBe(false);
    expect(pareceCompromisso("📅 Hoje: 15h reunião")).toBe(false);
    expect(pareceCompromisso("Hoje você tem:\n15h reunião")).toBe(false);
    expect(pareceCompromisso("veja https://exemplo.com/evento dia 12")).toBe(false);
    expect(pareceCompromisso(`Reunião 15h ${"x".repeat(140)}`)).toBe(false);
  });

  it("a própria dica começa com a marca do robô e é descartada pelo webhook", () => {
    expect(ehDoRobo("🤖 Isso é para a agenda? …")).toBe(true);
  });
});
