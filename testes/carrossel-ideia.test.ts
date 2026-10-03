import { describe, expect, it } from "vitest";
import { systemCarrosselDaIdeia, VISUAIS, validarIdeia } from "@/lib/carrossel-ideia";
import { FONTES, TEMAS } from "@/lib/instagram-render";

// =============================================================
// "Só tenho a ideia" (issue #189): aqui a IA ESCREVE o post, em
// vez de só reorganizar o que o pastor colou. É o modo de maior
// risco para um ministério — então o que se trava é o que ela
// não pode fazer: citar versículo com referência por conta
// própria, inventar fato, prometer resultado.
// =============================================================

describe("validarIdeia", () => {
  it("aceita uma frase e arruma os espaços", () => {
    expect(validarIdeia("  por que   a mesa ")).toEqual({
      ok: true,
      valor: "por que a mesa",
    });
  });

  it("recusa vazio e manda quem já tem o texto para o outro modo", () => {
    expect(validarIdeia("ab")).toEqual({
      ok: false,
      erro: "Escreva a ideia em uma frase.",
    });
    const longa = validarIdeia("a".repeat(401));
    expect(longa.ok).toBe(false);
    if (!longa.ok) expect(longa.erro).toContain("Tenho o conteúdo");
    expect(validarIdeia(null).ok).toBe(false);
  });
});

describe("systemCarrosselDaIdeia", () => {
  const s = systemCarrosselDaIdeia("carrossel", "");

  it("proíbe referência bíblica por conta própria, fato inventado e promessa", () => {
    expect(s).toContain("NÃO escreva referência bíblica");
    expect(s).toContain("A MENOS que o pastor tenha escrito a referência na ideia");
    expect(s).toContain("NÃO invente fato");
    expect(s).toContain("NÃO prometa cura, prosperidade");
  });

  it("pede de 5 a 7 slides, ou exatamente 1 na imagem única", () => {
    expect(s).toContain("Gere de 5 a 7 slides");
    expect(systemCarrosselDaIdeia("unico", "")).toContain("Gere EXATAMENTE 1 slide");
  });

  it("devolve o mesmo formato do modo conteúdo, para o editor não diferenciar", () => {
    expect(s).toContain(
      '{"slides":[{"texto":"...","prompt":"...","modo":"...","cor":"#rrggbb"}],"legenda":"..."}',
    );
  });

  it("leva a voz e os limites do Perfil quando há", () => {
    expect(s).not.toContain("QUEM ESTÁ FALANDO");
    expect(
      systemCarrosselDaIdeia("carrossel", "NÃO ENTRE NESTES ASSUNTOS: política"),
    ).toContain("QUEM ESTÁ FALANDO\nNÃO ENTRE NESTES ASSUNTOS: política");
  });
});

describe("VISUAIS · opções prontas", () => {
  it("cada visual usa um tema e uma fonte que o renderizador conhece", () => {
    for (const v of VISUAIS) {
      expect(TEMAS[v.tema], `tema de ${v.chave}`).toBeDefined();
      expect(FONTES[v.fonte], `fonte de ${v.chave}`).toBeDefined();
    }
  });

  it("não há dois visuais iguais", () => {
    const combinacoes = VISUAIS.map((v) => `${v.tema}|${v.fonte}|${v.tom}`);
    expect(new Set(combinacoes).size).toBe(VISUAIS.length);
    expect(new Set(VISUAIS.map((v) => v.chave)).size).toBe(VISUAIS.length);
  });
});
