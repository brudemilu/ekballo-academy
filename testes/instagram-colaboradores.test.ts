import { describe, expect, it } from "vitest";
import {
  comArroba,
  interpretarColaboracao,
  MAX_COLABORADORES,
  normalizarColaboradores,
} from "@/lib/instagram-colaboradores";

// =============================================================
// Colaboradores do post (issue #256). O que não pode acontecer:
// um nome mal digitado ir para a API e derrubar a publicação, ou
// uma mensagem qualquer no WhatsApp virar convite para alguém.
// =============================================================

describe("normalizarColaboradores", () => {
  it("aceita texto com @, vírgula, espaço e link do perfil", () => {
    expect(normalizarColaboradores("@Joao.Silva, @maria_2 ;pedro")).toEqual([
      "joao.silva",
      "maria_2",
      "pedro",
    ]);
    expect(
      normalizarColaboradores("https://www.instagram.com/igreja.wesleyana/?hl=pt"),
    ).toEqual(["igreja.wesleyana"]);
  });

  it("não repete e para no limite da API", () => {
    expect(normalizarColaboradores("@a @A @a")).toEqual(["a"]);
    expect(normalizarColaboradores("@a @b @c @d @e")).toHaveLength(MAX_COLABORADORES);
  });

  it("descarta o que não é nome de usuário", () => {
    expect(normalizarColaboradores("@joão @com espaço! @.ponto @ok")).toEqual([
      "com",
      "ok",
    ]);
    expect(normalizarColaboradores(null)).toEqual([]);
    expect(normalizarColaboradores(42)).toEqual([]);
    expect(normalizarColaboradores(["@um", 7, "dois"])).toEqual(["um", "dois"]);
  });
});

describe("interpretarColaboracao (WhatsApp)", () => {
  it("lê os perfis do pedido", () => {
    expect(interpretarColaboracao("colaborar com @pr.moises e @imw.olaria")).toEqual([
      "pr.moises",
      "imw.olaria",
    ]);
    expect(interpretarColaboracao("Colaboração: @fulano")).toEqual(["fulano"]);
    expect(interpretarColaboracao("collab @fulano")).toEqual(["fulano"]);
  });

  it("tirar a colaboração devolve lista vazia", () => {
    expect(interpretarColaboracao("sem colaboração")).toEqual([]);
    expect(interpretarColaboracao("tirar o colaborador")).toEqual([]);
  });

  it("sem @ não é convite; outra conversa não é com a gente", () => {
    expect(interpretarColaboracao("colaborar com a igreja no sábado")).toBeNull();
    expect(interpretarColaboracao("reunião com @fulano quinta")).toBeNull();
    expect(interpretarColaboracao("")).toBeNull();
  });
});

describe("comArroba", () => {
  it("mostra os perfis como o pastor escreve", () => {
    expect(comArroba(["a", "b.c"])).toBe("@a, @b.c");
    expect(comArroba([])).toBe("");
  });
});
