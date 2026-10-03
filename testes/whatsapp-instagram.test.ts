import { describe, expect, it } from "vitest";
import {
  AJUDA_INSTAGRAM,
  ehDoRobo,
  interpretarComando,
  interpretarQuando,
  MARCA_ROBO,
} from "@/lib/whatsapp-instagram";

// =============================================================
// Instagram pelo WhatsApp (issue #189). O mesmo chat já serve
// para agendar compromissos, então o erro que custa caro é a
// confusão: um "cancelar a reunião de quinta" que apaga um
// post, ou um "agendar…" da agenda entendido como publicação.
// E "publicar" publica de verdade — o horário entendido errado
// vai ao ar no nome do pastor.
// =============================================================

describe("interpretarComando · criar", () => {
  it.each([
    [
      "post por que o discipulado acontece à mesa",
      "por que o discipulado acontece à mesa",
    ],
    ["Post: descanso não é preguiça", "descanso não é preguiça"],
    ["postar sobre a liberdade de se esquecer", "a liberdade de se esquecer"],
    ["Cria um post sobre Quem senta à sua mesa?", "Quem senta à sua mesa?"],
    ["faz um carrossel de João 15, a videira", "João 15, a videira"],
    ["instagram, a fé que descansa", "a fé que descansa"],
  ])("%s", (mensagem, ideia) => {
    expect(interpretarComando(mensagem)).toEqual({ tipo: "criar", ideia });
  });

  it("gatilho sem ideia vira pedido de ajuda, não um post vazio", () => {
    expect(interpretarComando("post")).toEqual({ tipo: "ajuda" });
    expect(interpretarComando("postar ok")).toEqual({ tipo: "ajuda" });
  });
});

describe("interpretarComando · aprovar, refazer, cancelar", () => {
  it("publicar agora ou com horário", () => {
    expect(interpretarComando("publicar")).toEqual({ tipo: "publicar", quando: "" });
    expect(interpretarComando("Publica agora!")).toEqual({
      tipo: "publicar",
      quando: "",
    });
    expect(interpretarComando("aprovado")).toEqual({ tipo: "publicar", quando: "" });
    expect(interpretarComando("publicar terça 19h")).toEqual({
      tipo: "publicar",
      quando: "terca 19h",
    });
  });

  it("refazer", () => {
    expect(interpretarComando("refazer")).toEqual({ tipo: "refazer" });
    expect(interpretarComando("Outra versão.")).toEqual({ tipo: "refazer" });
  });

  it("cancelar o rascunho ou uma peça do piloto", () => {
    expect(interpretarComando("cancelar")).toEqual({
      tipo: "cancelar",
      alvo: "rascunho",
    });
    expect(interpretarComando("cancela o post")).toEqual({
      tipo: "cancelar",
      alvo: "rascunho",
    });
    expect(interpretarComando("cancelar carrossel")).toEqual({
      tipo: "cancelar",
      alvo: "carrossel",
    });
    expect(interpretarComando("Cancela o reel")).toEqual({
      tipo: "cancelar",
      alvo: "reel",
    });
    expect(interpretarComando("vetar tudo")).toEqual({
      tipo: "cancelar",
      alvo: "tudo",
    });
  });
});

describe("interpretarComando · o que NÃO é do Instagram segue para a agenda", () => {
  it.each([
    "agendar reunião com a equipe quinta às 15h",
    "agenda: culto domingo 19h",
    "cancelar a reunião de quinta",
    "Reunião de liderança amanhã às 20h",
    "postura no culto é importante", // começa com "post", mas não é o comando
    "",
  ])("%s", (mensagem) => {
    expect(interpretarComando(mensagem)).toBeNull();
  });
});

describe("interpretarQuando · horário de Brasília", () => {
  // Domingo 04/10/2026, 20h em Brasília = 23h UTC
  const AGORA = new Date("2026-10-04T23:00:00Z");

  it("vazio é agora", () => {
    expect(interpretarQuando("", AGORA)).toBe(AGORA.toISOString());
  });

  it("dia da semana com hora", () => {
    expect(interpretarQuando("terça 19h", AGORA)).toBe("2026-10-06T22:00:00.000Z");
    expect(interpretarQuando("sexta às 8", AGORA)).toBe("2026-10-09T11:00:00.000Z");
  });

  it("dia da semana sem hora cai no horário padrão (19h)", () => {
    expect(interpretarQuando("quinta", AGORA)).toBe("2026-10-08T22:00:00.000Z");
  });

  it("amanhã e hoje", () => {
    expect(interpretarQuando("amanhã 8h", AGORA)).toBe("2026-10-05T11:00:00.000Z");
    expect(interpretarQuando("hoje 22h", AGORA)).toBe("2026-10-05T01:00:00.000Z");
  });

  it("horário que já passou não vira publicação no passado", () => {
    expect(interpretarQuando("hoje 10h", AGORA)).toBeNull();
  });

  it("o que não entende, não chuta", () => {
    expect(interpretarQuando("quando der", AGORA)).toBeNull();
    expect(interpretarQuando("dia 32 às 99h", AGORA)).toBeNull();
  });
});

describe("o robô não responde a si mesmo", () => {
  // As respostas saem pela conta do pastor para o chat dele mesmo e voltam
  // pelo webhook. Se uma delas fosse lida como comando, o robô criaria posts
  // em laço.
  it("mensagem com a marca nunca é comando, mesmo contendo um gatilho", () => {
    expect(interpretarComando(`${MARCA_ROBO} post sobre a mesa`)).toBeNull();
    expect(interpretarComando(`  ${MARCA_ROBO} publicar`)).toBeNull();
    expect(interpretarComando(`${MARCA_ROBO} cancelar tudo`)).toBeNull();
  });

  it("a ajuda leva a marca e não se interpreta", () => {
    expect(ehDoRobo(AJUDA_INSTAGRAM)).toBe(true);
    expect(interpretarComando(AJUDA_INSTAGRAM)).toBeNull();
  });

  it("mensagem comum não é do robô", () => {
    expect(ehDoRobo("post sobre a mesa")).toBe(false);
    expect(ehDoRobo("")).toBe(false);
  });
});
