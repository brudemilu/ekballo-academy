import { describe, expect, it } from "vitest";
import {
  CONTA_PRINCIPAL_ID,
  contaEmUso,
  diasAteVencer,
  ehIdDeConta,
  lerPerfilDoToken,
  lerTokenColado,
  rotuloDaConta,
} from "@/lib/instagram-contas";

const principal = { id: CONTA_PRINCIPAL_ID, principal: true };
const regiao = { id: "11111111-2222-4333-8444-555555555555", principal: false };

describe("contaEmUso", () => {
  it("devolve a conta escolhida quando ela existe", () => {
    expect(contaEmUso([principal, regiao], regiao.id)).toBe(regiao);
  });

  it("cai na principal quando a escolha não existe mais ou não veio", () => {
    expect(
      contaEmUso([regiao, principal], "99999999-0000-4000-8000-000000000000"),
    ).toBe(principal);
    expect(contaEmUso([regiao, principal], null)).toBe(principal);
    expect(contaEmUso([regiao, principal], undefined)).toBe(principal);
  });

  it("sem nenhuma conta cadastrada, não inventa uma", () => {
    expect(contaEmUso([], regiao.id)).toBeNull();
  });
});

describe("ehIdDeConta", () => {
  it("aceita só uuid", () => {
    expect(ehIdDeConta(CONTA_PRINCIPAL_ID)).toBe(true);
    expect(ehIdDeConta("1")).toBe(false);
    expect(ehIdDeConta("")).toBe(false);
    expect(ehIdDeConta(null)).toBe(false);
    // o valor vai para um filtro de consulta: nada além do id pode passar
    expect(ehIdDeConta(`${CONTA_PRINCIPAL_ID},principal.eq.true`)).toBe(false);
  });
});

describe("rotuloDaConta", () => {
  it("mostra o @ quando o Instagram já disse qual é; senão, o nome dado", () => {
    expect(rotuloDaConta({ nome: "2ª Região", usuario: "imw2regiao" })).toBe(
      "@imw2regiao",
    );
    expect(rotuloDaConta({ nome: "2ª Região", usuario: "" })).toBe("2ª Região");
  });
});

describe("lerTokenColado", () => {
  const token = `IGAA${"x".repeat(180)}`;

  it("aceita o token e tira espaços e quebras de linha da colagem", () => {
    expect(lerTokenColado(`  ${token.slice(0, 90)}\n${token.slice(90)}  `)).toEqual({
      ok: true,
      token,
    });
  });

  it("recusa a chave secreta do aplicativo (32 caracteres) com uma explicação", () => {
    const r = lerTokenColado("47a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5");
    expect(r.ok).toBe(false);
    if (!r.ok) expect(r.erro).toContain("chave secreta do aplicativo");
  });

  it("recusa vazio e o que não é texto", () => {
    expect(lerTokenColado("   ").ok).toBe(false);
    expect(lerTokenColado(undefined).ok).toBe(false);
    expect(lerTokenColado(12345).ok).toBe(false);
  });

  it("recusa caracteres que não fazem parte de um token", () => {
    expect(lerTokenColado(`${token}"><script>`).ok).toBe(false);
  });
});

describe("lerPerfilDoToken", () => {
  it("prefere user_id, que é o id que publica", () => {
    expect(
      lerPerfilDoToken({ id: "999", user_id: "17841400000000000", username: "imw" }),
    ).toEqual({ igUserId: "17841400000000000", usuario: "imw" });
  });

  it("usa id quando user_id não vem, e aceita número", () => {
    expect(lerPerfilDoToken({ id: 123, username: "imw" })).toEqual({
      igUserId: "123",
      usuario: "imw",
    });
  });

  it("resposta de erro ou incompleta não vira perfil", () => {
    expect(
      lerPerfilDoToken({ error: { message: "Invalid OAuth access token" } }),
    ).toBeNull();
    expect(lerPerfilDoToken({ user_id: "1" })).toBeNull();
    expect(lerPerfilDoToken(null)).toBeNull();
    expect(lerPerfilDoToken("ok")).toBeNull();
  });
});

describe("diasAteVencer", () => {
  const agora = new Date("2026-10-13T12:00:00.000Z");

  it("conta os dias inteiros que faltam", () => {
    expect(diasAteVencer("2026-10-23T12:00:00.000Z", agora)).toBe(10);
    expect(diasAteVencer("2026-10-13T18:00:00.000Z", agora)).toBe(0);
  });

  it("fica negativo depois de vencido", () => {
    expect(diasAteVencer("2026-10-12T11:00:00.000Z", agora)).toBe(-2);
  });

  it("sem data (ou data inválida), não sabe", () => {
    expect(diasAteVencer(null, agora)).toBeNull();
    expect(diasAteVencer("ontem", agora)).toBeNull();
  });
});
