import { describe, expect, it } from "vitest";
import {
  type ComentarioIG,
  casarRegra,
  comentariosAResponder,
  montarMensagem,
  palavraRepetida,
  type RegraComentario,
  validarRegra,
} from "@/lib/comentarios-auto";

// =============================================================
// Resposta automática a comentários (issue #189). O que não pode
// acontecer: responder a quem não pediu ("promessa" não é "mesa"),
// responder duas vezes à mesma pessoa, ou o robô responder a si
// mesmo e entrar em laço.
// =============================================================

const regra = (
  palavra: string,
  extra: Partial<RegraComentario> = {},
): RegraComentario => ({
  id: `r-${palavra}`,
  palavra,
  resposta_publica: "Te mandei no direct!",
  mensagem_privada: "Aqui está o link.",
  ativo: true,
  criado_em: "2026-10-01T00:00:00Z",
  ...extra,
});

const AGORA = new Date("2026-10-03T15:00:00Z");
const comentario = (id: string, text: string, extra: Partial<ComentarioIG> = {}) => ({
  id,
  text,
  username: "fulano",
  timestamp: "2026-10-03T14:00:00Z",
  ...extra,
});

describe("casarRegra", () => {
  const regras = [regra("MESA")];

  it("casa sem ligar para caixa, acento ou pontuação", () => {
    expect(casarRegra("mesa", regras)?.palavra).toBe("MESA");
    expect(casarRegra("Quero! MESA 🙏", regras)?.palavra).toBe("MESA");
    expect(casarRegra("mêsa.", regras)?.palavra).toBe("MESA");
  });

  it("a palavra tem de aparecer inteira", () => {
    expect(casarRegra("recebi a mesada", regras)).toBeNull();
    expect(casarRegra("que promessa linda", regras)).toBeNull();
    expect(casarRegra("mesas", regras)).toBeNull();
  });

  it("regra desligada não responde", () => {
    expect(casarRegra("mesa", [regra("MESA", { ativo: false })])).toBeNull();
  });

  it("entre duas que casam, vale a mais específica", () => {
    const duas = [regra("mesa"), regra("mesa aberta")];
    expect(casarRegra("quero a mesa aberta", duas)?.palavra).toBe("mesa aberta");
  });

  it("comentário vazio ou só com emoji não casa com nada", () => {
    expect(casarRegra("", regras)).toBeNull();
    expect(casarRegra("🙏🙏", regras)).toBeNull();
  });
});

describe("validarRegra", () => {
  it("aceita com só um dos dois textos", () => {
    const r = validarRegra({
      palavra: " MESA ",
      resposta_publica: "",
      mensagem_privada: "link",
    });
    expect(r).toEqual({
      ok: true,
      valor: { palavra: "MESA", resposta_publica: "", mensagem_privada: "link" },
    });
  });

  it("recusa sem palavra útil ou sem nada para responder", () => {
    expect(validarRegra({ palavra: "🙏", mensagem_privada: "x" }).ok).toBe(false);
    expect(validarRegra({ palavra: "a", mensagem_privada: "x" }).ok).toBe(false);
    expect(validarRegra({ palavra: "MESA" }).ok).toBe(false);
    expect(validarRegra(null).ok).toBe(false);
  });

  it("recusa texto acima do limite", () => {
    expect(
      validarRegra({ palavra: "MESA", resposta_publica: "x".repeat(301) }).ok,
    ).toBe(false);
    expect(
      validarRegra({ palavra: "MESA", mensagem_privada: "x".repeat(901) }).ok,
    ).toBe(false);
  });
});

describe("palavraRepetida", () => {
  it("enxerga a mesma palavra com outra caixa ou acento", () => {
    expect(palavraRepetida("mêsa", [regra("MESA")])).toBe(true);
    expect(palavraRepetida("livro", [regra("MESA")])).toBe(false);
  });
});

describe("montarMensagem", () => {
  it("troca {nome} pelo usuário, com arroba", () => {
    expect(montarMensagem("Oi {nome}, te mandei!", "fulano")).toBe(
      "Oi @fulano, te mandei!",
    );
    expect(montarMensagem("Oi {NOME}!", "@fulano")).toBe("Oi @fulano!");
  });

  it("sem usuário, a frase continua legível", () => {
    expect(montarMensagem("Oi {nome} te mandei", "")).toBe("Oi te mandei");
  });
});

describe("comentariosAResponder", () => {
  const regras = [regra("MESA")];
  const proprio = { id: "999", usuario: "ekballo" };

  it("devolve só quem pediu", () => {
    const r = comentariosAResponder(
      [comentario("1", "MESA"), comentario("2", "amém")],
      regras,
      new Set(),
      proprio,
      AGORA,
    );
    expect(r.map((x) => x.comentario.id)).toEqual(["1"]);
  });

  it("não responde duas vezes ao mesmo comentário", () => {
    const r = comentariosAResponder(
      [comentario("1", "MESA")],
      regras,
      new Set(["1"]),
      proprio,
      AGORA,
    );
    expect(r).toEqual([]);
  });

  it("não responde ao próprio perfil — a resposta pública pode conter a palavra", () => {
    const r = comentariosAResponder(
      [
        comentario("1", "Comente MESA", { fromId: "999", username: "outro" }),
        comentario("2", "MESA", { username: "Ekballo" }),
      ],
      regras,
      new Set(),
      proprio,
      AGORA,
    );
    expect(r).toEqual([]);
  });

  it("comentário velho demais fica de fora: o Instagram recusaria a mensagem", () => {
    const r = comentariosAResponder(
      [
        comentario("1", "MESA", { timestamp: "2026-09-25T14:00:00Z" }),
        comentario("2", "MESA", { timestamp: "data torta" }),
      ],
      regras,
      new Set(),
      proprio,
      AGORA,
    );
    expect(r).toEqual([]);
  });
});
