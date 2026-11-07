import { describe, expect, it } from "vitest";
import { telefonesEmCopia } from "@/lib/aviso-respostas-copia";

// =============================================================
// A cópia do aviso de resposta sai para os telefones da env
// AVISO_RESPOSTAS_COPIA. Quem preenche essa env é gente, no servidor,
// escrevendo o número do jeito que se escreve. Se a leitura tropeçar,
// a mensagem simplesmente não chega — e ninguém é avisado disso.
// =============================================================

describe("telefonesEmCopia · quem recebe o aviso junto com o líder", () => {
  it("sem env, ninguém em cópia", () => {
    expect(telefonesEmCopia(undefined)).toEqual([]);
    expect(telefonesEmCopia("")).toEqual([]);
    expect(telefonesEmCopia("  ")).toEqual([]);
  });

  it("aceita o número do jeito que se escreve", () => {
    expect(telefonesEmCopia("(11) 99999-8888")).toEqual(["5511999998888"]);
    expect(telefonesEmCopia("11999998888")).toEqual(["5511999998888"]);
    expect(telefonesEmCopia("+55 11 99999-8888")).toEqual(["5511999998888"]);
  });

  it("aceita vários, separados por vírgula, ponto e vírgula ou linha", () => {
    expect(
      telefonesEmCopia("(11) 99999-8888, 21988887777;3133334444\n5541977776666"),
    ).toEqual(["5511999998888", "5521988887777", "553133334444", "5541977776666"]);
  });

  it("não manda duas vezes para o mesmo número", () => {
    expect(telefonesEmCopia("11999998888, (11) 99999-8888")).toEqual(["5511999998888"]);
  });

  it("não manda em cópia para quem já é o destino principal", () => {
    expect(telefonesEmCopia("11999998888, 21988887777", "5511999998888")).toEqual([
      "5521988887777",
    ]);
    expect(telefonesEmCopia("11999998888", "(11) 99999-8888")).toEqual([]);
  });

  it("descarta o que não é telefone, sem derrubar os válidos", () => {
    expect(telefonesEmCopia("débora, 123, 11999998888")).toEqual(["5511999998888"]);
  });
});
