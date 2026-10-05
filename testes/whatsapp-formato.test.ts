import { describe, expect, it } from "vitest";
import { ehStory, ogUrlDoSlide } from "@/lib/instagram-imagens";
import {
  ESPERA_FORMATO_MIN,
  esperandoFormato,
} from "@/lib/whatsapp-instagram-executar";

// =============================================================
// Pergunta do formato pelo WhatsApp (issue #213). O que não pode
// acontecer: um "2" solto no chat, sem pergunta nenhuma no ar,
// virar um carrossel.
// =============================================================

const AGORA = new Date("2026-10-05T15:00:00Z");
const haMinutos = (m: number) => new Date(AGORA.getTime() - m * 60_000).toISOString();

describe("esperandoFormato", () => {
  it("ideia guardada, sem rascunho e recente: está esperando", () => {
    expect(
      esperandoFormato(
        { carrossel_id: null, ideia: "fé", tentativas: 0, atualizado_em: haMinutos(2) },
        AGORA,
      ),
    ).toBe(true);
  });

  it("sem conversa, sem ideia ou já com rascunho: não está", () => {
    expect(esperandoFormato(null, AGORA)).toBe(false);
    expect(
      esperandoFormato({ carrossel_id: null, ideia: "", tentativas: 0 }, AGORA),
    ).toBe(false);
    expect(
      esperandoFormato(
        { carrossel_id: "c1", ideia: "fé", tentativas: 0, atualizado_em: haMinutos(1) },
        AGORA,
      ),
    ).toBe(false);
  });

  it("pergunta velha não vale mais", () => {
    expect(
      esperandoFormato(
        {
          carrossel_id: null,
          ideia: "fé",
          tentativas: 0,
          atualizado_em: haMinutos(ESPERA_FORMATO_MIN + 1),
        },
        AGORA,
      ),
    ).toBe(false);
  });
});

describe("ehStory · o que decide onde o post é publicado", () => {
  it("uma imagem marcada como story é story", () => {
    expect(ehStory([{ formato: "story" }])).toBe(true);
  });

  it("imagem única comum e carrossel vão para o feed", () => {
    expect(ehStory([{}])).toBe(false);
    expect(ehStory([{ formato: "story" }, { formato: "story" }])).toBe(false);
    expect(ehStory([])).toBe(false);
  });

  it("o endereço da imagem de um story pede o quadro 9:16", () => {
    const base = { texto: "x", prompt: "", modo: "nenhum", fonte: "anton", seed: 1 };
    expect(ogUrlDoSlide("http://a", { ...base, formato: "story" })).toContain(
      "f=story",
    );
    expect(ogUrlDoSlide("http://a", base)).not.toContain("f=story");
  });
});
