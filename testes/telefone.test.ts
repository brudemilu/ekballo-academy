import { describe, expect, it } from "vitest";
import { displayTelefone, formatTelefoneBR, normalizeTelefoneBR } from "@/lib/telefone";

// =============================================================
// O telefone é gravado como E.164 sem o "+" ("5511999998888") e é
// por ele que a plataforma manda WhatsApp — recuperação de senha
// inclusive. Normalizar errado não dá erro na hora: dá mensagem
// que nunca chega, e ninguém descobre por quê.
// =============================================================

describe("formatTelefoneBR · máscara enquanto digita", () => {
  it.each([
    ["", ""],
    ["1", "(1"],
    // O comentário em lib/telefone.ts documenta "(11) " para dois
    // dígitos, mas o código devolve "(11" — a máscara só fecha o
    // parêntese a partir do terceiro dígito. O teste afirma o que o
    // código FAZ; a divergência entre código e comentário está na
    // issue #75, para o Bruno decidir qual dos dois está certo.
    // Mudar máscara de digitação mexe em posição de cursor, e isso
    // não é carona de um PR de esteira.
    ["11", "(11"],
    ["11999", "(11) 999"],
    ["1199998888", "(11) 9999-8888"], // fixo, 8 dígitos
    ["11999998888", "(11) 99999-8888"], // celular, 9 dígitos
  ])("%s → %s", (entrada, esperado) => {
    expect(formatTelefoneBR(entrada)).toBe(esperado);
  });

  it("ignora o que não é dígito", () => {
    expect(formatTelefoneBR("(11) 99999-8888")).toBe("(11) 99999-8888");
    expect(formatTelefoneBR("11 9 9999 8888")).toBe("(11) 99999-8888");
  });

  it("não deixa passar do tamanho de um telefone", () => {
    expect(formatTelefoneBR("119999988881234567")).toBe("(11) 99999-8888");
  });
});

describe("normalizeTelefoneBR · o que vai para o banco", () => {
  it("põe o 55 na frente do celular e do fixo", () => {
    expect(normalizeTelefoneBR("11999998888")).toBe("5511999998888");
    expect(normalizeTelefoneBR("1199998888")).toBe("551199998888");
  });

  it("aceita o número já com 55 sem duplicar", () => {
    expect(normalizeTelefoneBR("5511999998888")).toBe("5511999998888");
    expect(normalizeTelefoneBR("551199998888")).toBe("551199998888");
  });

  it("aceita o número escrito com máscara", () => {
    expect(normalizeTelefoneBR("(11) 99999-8888")).toBe("5511999998888");
    expect(normalizeTelefoneBR("+55 (11) 99999-8888")).toBe("5511999998888");
  });

  it("NÃO come o DDD 55, que existe de verdade (Santa Maria/RS)", () => {
    // A armadilha: "55999998888" é um celular do DDD 55, não um número
    // já prefixado. Quem tira o "55" pela aparência transforma o
    // telefone de um discípulo gaúcho em outro número — e a mensagem
    // vai para um desconhecido.
    expect(normalizeTelefoneBR("55999998888")).toBe("5555999998888");
    expect(normalizeTelefoneBR("5599998888")).toBe("555599998888");
  });

  it("recusa o que não é telefone brasileiro", () => {
    for (const ruim of ["", "119999", "1", "abc", "1199999888899999"]) {
      expect(normalizeTelefoneBR(ruim), `entrada: ${ruim}`).toBeNull();
    }
  });
});

describe("displayTelefone · o que aparece na tela", () => {
  it("mostra o valor guardado já bonito", () => {
    expect(displayTelefone("5511999998888")).toBe("(11) 99999-8888");
  });

  it("aguenta vazio, nulo e indefinido sem quebrar a tela", () => {
    expect(displayTelefone(null)).toBe("");
    expect(displayTelefone(undefined)).toBe("");
    expect(displayTelefone("")).toBe("");
  });

  it("ida e volta preserva o número", () => {
    const guardado = normalizeTelefoneBR("(11) 99999-8888");
    expect(normalizeTelefoneBR(displayTelefone(guardado))).toBe(guardado);
  });
});
