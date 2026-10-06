import { describe, expect, it } from "vitest";
import { aguardaLiberacao, novosCadastros } from "@/lib/novos-cadastros";

// =============================================================
// Painel de novos cadastros (issue #217). O erro que este teste
// existe para impedir: alguém esperando liberação sumir da tela
// — por ser antigo, ou por ficar atrás de quem já foi liberado.
// =============================================================

const AGORA = Date.parse("2026-10-05T12:00:00Z");
const ha = (dias: number) => new Date(AGORA - dias * 86_400_000).toISOString();

const c = (nome: string, dias: number, liberado: boolean, admin = false) => ({
  nome,
  is_admin: admin,
  acesso_liberado: liberado,
  created_at: ha(dias),
});

describe("novosCadastros", () => {
  it("mantém quem aguarda liberação mesmo cadastrado há meses", () => {
    const r = novosCadastros([c("Gláucia", 34, false)], AGORA);
    expect(r.map((x) => x.nome)).toEqual(["Gláucia"]);
  });

  it("mostra o liberado só enquanto é recente", () => {
    const r = novosCadastros([c("Novo", 3, true), c("Antigo", 40, true)], AGORA);
    expect(r.map((x) => x.nome)).toEqual(["Novo"]);
  });

  it("põe pendentes antes de liberados, e o mais novo primeiro em cada grupo", () => {
    const r = novosCadastros(
      [
        c("Liberado ontem", 1, true),
        c("Pendente antigo", 20, false),
        c("Pendente de hoje", 0, false),
        c("Liberado semana passada", 6, true),
      ],
      AGORA,
    );
    expect(r.map((x) => x.nome)).toEqual([
      "Pendente de hoje",
      "Pendente antigo",
      "Liberado ontem",
      "Liberado semana passada",
    ]);
  });

  it("nunca lista admin, nem recém-criado e sem liberação marcada", () => {
    expect(novosCadastros([c("Líder", 0, false, true)], AGORA)).toEqual([]);
    expect(aguardaLiberacao(c("Líder", 0, false, true))).toBe(false);
  });

  it("não quebra com data ilegível: pendente continua aparecendo", () => {
    const r = novosCadastros(
      [{ nome: "Sem data", is_admin: false, acesso_liberado: false, created_at: "" }],
      AGORA,
    );
    expect(r).toHaveLength(1);
  });
});
