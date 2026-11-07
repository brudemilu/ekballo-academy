import { describe, expect, it } from "vitest";
import {
  ESPERA_REEL_SEG,
  RESERVA_PUBLICACAO_MIN,
  reservaAte,
  tentativasParaEspera,
} from "@/lib/instagram-publish";

// =============================================================
// Espera do Reel e reserva do post (issue #232). O que não pode
// voltar: o Reel agendado falhar porque o Instagram levou um
// minuto para processar — nem o conserto fazer o post sair em
// dobro, com duas rodadas do agendador publicando a mesma peça.
// =============================================================

describe("espera do Reel", () => {
  it("o agendador espera minutos, não os 57 s de antes", () => {
    expect(ESPERA_REEL_SEG).toBeGreaterThanOrEqual(300);
  });

  it("as consultas cobrem a espera inteira", () => {
    expect(tentativasParaEspera(360, 5000)).toBe(72);
    expect(tentativasParaEspera(150, 5000)).toBe(30);
    expect(tentativasParaEspera(1, 5000)).toBe(1);
    expect(tentativasParaEspera(0, 5000)).toBe(1);
  });
});

describe("reserva do post em publicação", () => {
  const agora = new Date("2026-10-09T21:00:00Z");

  it("empurra a hora para depois da rodada seguinte do agendador", () => {
    expect(reservaAte(agora)).toBe("2026-10-09T21:20:00.000Z");
  });

  it("dura mais que a espera do Reel, senão outra rodada pegaria o mesmo post", () => {
    expect(RESERVA_PUBLICACAO_MIN * 60).toBeGreaterThan(ESPERA_REEL_SEG + 300);
  });
});
