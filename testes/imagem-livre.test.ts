import { describe, expect, it } from "vitest";
import {
  chaveDaImagem,
  estiloValido,
  formatoValido,
  normalizarCena,
  promptCompleto,
  SYSTEM_CENA,
  sementes,
  validarDescricao,
} from "@/lib/imagem-livre";

// =============================================================
// Imagem livre (issue #189). Duas regras valem para toda imagem
// e não podem depender de o pastor lembrar: nada de texto dentro
// da imagem (a IA erra acento) e nada de rosto (figura sagrada
// com rosto inventado é problema pastoral). O teste garante que
// as duas vão em todo prompt, em qualquer estilo.
// =============================================================

describe("promptCompleto", () => {
  it("todo estilo leva a proibição de texto e de rosto", () => {
    for (const estilo of [
      "cinematografico",
      "natureza",
      "objeto",
      "minimalista",
      "aquarela",
    ] as const) {
      const p = promptCompleto("an open bible on a table", estilo);
      expect(p).toContain("no text, no letters");
      expect(p).toContain("no recognizable faces");
      expect(p.startsWith("an open bible on a table. ")).toBe(true);
    }
  });

  it("não deixa ponto duplicado quando a cena já termina com ponto", () => {
    expect(promptCompleto("a quiet lake.  ", "natureza")).toMatch(
      /^a quiet lake\. landscape photography/,
    );
  });
});

describe("o pedido que traduz a descrição", () => {
  it("proíbe texto e rosto, e trata Jesus de costas ou em silhueta", () => {
    expect(SYSTEM_CENA).toContain("NUNCA peça texto");
    expect(SYSTEM_CENA).toContain("NUNCA descreva rosto");
    expect(SYSTEM_CENA).toContain("nunca o rosto");
  });
});

describe("normalizarCena", () => {
  it("aceita a resposta em cerca de código e arruma os espaços", () => {
    expect(
      normalizarCena('```json\n{"cena":"  a single   green sprout in dry soil "}\n```'),
    ).toBe("a single green sprout in dry soil");
  });

  it("resposta sem cena não vira imagem", () => {
    expect(() => normalizarCena('{"cena":""}')).toThrow(/legível/);
    expect(() => normalizarCena("não posso ajudar")).toThrow(/legível/);
  });
});

describe("validação e chave", () => {
  it("descrição precisa existir e caber", () => {
    expect(validarDescricao("  uma mesa com pão ")).toEqual({
      ok: true,
      valor: "uma mesa com pão",
    });
    expect(validarDescricao("ab").ok).toBe(false);
    expect(validarDescricao("a".repeat(601)).ok).toBe(false);
    expect(validarDescricao(42).ok).toBe(false);
  });

  it("estilo e formato só os conhecidos", () => {
    expect(estiloValido("aquarela")).toBe(true);
    expect(estiloValido("anime")).toBe(false);
    expect(formatoValido("story")).toBe(true);
    expect(formatoValido("16:9")).toBe(false);
  });

  it("a chave do cache muda com estilo, formato, semente e cena", () => {
    const base = chaveDaImagem("a lake", "natureza", "feed", 7);
    expect(chaveDaImagem(" a lake ", "natureza", "feed", 7)).toBe(base);
    expect(chaveDaImagem("a lake", "aquarela", "feed", 7)).not.toBe(base);
    expect(chaveDaImagem("a lake", "natureza", "story", 7)).not.toBe(base);
    expect(chaveDaImagem("a lake", "natureza", "feed", 8)).not.toBe(base);
  });

  it("quatro sementes seguidas a partir da base", () => {
    expect(sementes(100)).toEqual([100, 101, 102, 103]);
  });
});
