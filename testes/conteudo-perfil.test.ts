import { describe, expect, it } from "vitest";
import {
  contextoDoPerfil,
  normalizarDNAReferencia,
  normalizarVozDNA,
  PERFIL_VAZIO,
  type PerfilConteudo,
  podeAnalisar,
  progressoDoPerfil,
  type ReferenciaConteudo,
  validarPerfil,
  validarReferencia,
} from "@/lib/conteudo-perfil";

// =============================================================
// Perfil do ministério e criadores de referência (issue #189).
// O que não pode acontecer: a resposta torta da IA ser gravada
// como análise válida, e o contexto mandar a IA copiar a
// doutrina ou os bordões de outra pessoa. Da referência só
// entra a forma.
// =============================================================

const REF: ReferenciaConteudo = {
  id: "r1",
  nome: "@fulano",
  link: "",
  exemplos: "x".repeat(300),
  analisado_em: "2026-10-03T12:00:00Z",
  dna: {
    resumo: "Abre com pergunta e fecha com convite.",
    ganchos: ["pergunta que expõe uma dor do dia a dia"],
    estrutura: ["gancho", "história curta", "virada", "convite"],
    tom: "direto",
    ritmo: "frases curtas, 30 a 45 s",
    chamada: "convida a comentar",
    aproveitar: ["a pergunta de abertura"],
    nao_copiar: ['o bordão "bora"', "a posição dele sobre dízimo"],
  },
};

describe("validarPerfil", () => {
  it("aceita o formulário e descarta pilar sem nome", () => {
    const r = validarPerfil({
      objetivo: "  Levar para a mesa ",
      publico: "Jovens",
      pilares: [
        { nome: "Mesa", descricao: "trechos" },
        { nome: "  ", descricao: "sem nome" },
      ],
      voz_amostras: "",
      temas_proibidos: "política",
      chamada_padrao: "Comente MESA",
    });
    expect(r).toEqual({
      ok: true,
      valor: {
        objetivo: "Levar para a mesa",
        publico: "Jovens",
        pilares: [{ nome: "Mesa", descricao: "trechos" }],
        voz_amostras: "",
        temas_proibidos: "política",
        chamada_padrao: "Comente MESA",
      },
    });
  });

  it("recusa texto longo demais, pilares demais e corpo que não é objeto", () => {
    expect(validarPerfil({ objetivo: "a".repeat(601) }).ok).toBe(false);
    expect(
      validarPerfil({ pilares: Array.from({ length: 7 }, () => ({ nome: "p" })) }).ok,
    ).toBe(false);
    expect(validarPerfil({ objetivo: 12 }).ok).toBe(false);
    expect(validarPerfil("perfil")).toEqual({ ok: false, erro: "Corpo inválido." });
  });
});

describe("validarReferencia", () => {
  it("criar exige nome; editar confere só o que veio", () => {
    expect(validarReferencia({ link: "x" })).toEqual({
      ok: false,
      erro: "Diga quem é o criador (nome ou @).",
    });
    expect(validarReferencia({ exemplos: " texto " }, true)).toEqual({
      ok: true,
      valor: { exemplos: "texto" },
    });
  });

  it("recusa exemplos acima do limite com orientação do que fazer", () => {
    const r = validarReferencia({ nome: "a", exemplos: "x".repeat(12_001) });
    expect(r.ok).toBe(false);
    if (!r.ok) expect(r.erro).toMatch(/3 a 5 melhores/);
  });
});

describe("podeAnalisar", () => {
  it("pede material mínimo para a análise não ser chute", () => {
    expect(podeAnalisar("curto")).toBe(false);
    expect(podeAnalisar("x".repeat(200))).toBe(true);
  });
});

describe("normalizarDNAReferencia · funil da resposta da IA", () => {
  it("aceita JSON dentro de cerca de código e corta o excesso", () => {
    const bruto = `\`\`\`json\n${JSON.stringify({
      resumo: "r",
      ganchos: ["a", "b", 3, "", "c", "d", "e", "f", "g"],
      estrutura: ["x"],
      tom: "t",
      ritmo: "rt",
      chamada: "c",
      aproveitar: ["ap"],
      nao_copiar: ["nc"],
      extra: "ignorado",
    })}\n\`\`\``;
    const dna = normalizarDNAReferencia(bruto);
    expect(dna.ganchos).toEqual(["a", "b", "c", "d", "e", "f"]);
    expect(dna).not.toHaveProperty("extra");
  });

  it("resposta sem gancho nem estrutura não vira análise", () => {
    expect(() => normalizarDNAReferencia('{"resumo":"só isso"}')).toThrow(/vazia/);
    expect(() => normalizarDNAReferencia("desculpe, não consegui")).toThrow(/legível/);
  });
});

describe("normalizarVozDNA", () => {
  it("guarda tom, vocabulário e o que evitar", () => {
    expect(
      normalizarVozDNA('{"tom":"direto","vocabulario":["mesa"],"evitar":["coach"]}'),
    ).toEqual({
      tom: "direto",
      vocabulario: ["mesa"],
      evitar: ["coach"],
    });
  });

  it("sem tom não há análise", () => {
    expect(() => normalizarVozDNA('{"vocabulario":["mesa"]}')).toThrow(/vazia/);
  });
});

describe("contextoDoPerfil · o que a IA lê antes de escrever", () => {
  it("perfil vazio não gera contexto (o pedido segue funcionando)", () => {
    expect(contextoDoPerfil(PERFIL_VAZIO)).toBe("");
  });

  it("traz objetivo, pilares, voz e assuntos proibidos", () => {
    const perfil: PerfilConteudo = {
      ...PERFIL_VAZIO,
      objetivo: "Levar para a mesa",
      pilares: [{ nome: "Mesa", descricao: "trechos" }],
      voz_dna: { tom: "pastoral", vocabulario: ["à mesa"], evitar: ["frase de coach"] },
      temas_proibidos: "política partidária",
    };
    const ctx = contextoDoPerfil(perfil);
    expect(ctx).toContain("OBJETIVO DO PERFIL: Levar para a mesa");
    expect(ctx).toContain("- Mesa: trechos");
    expect(ctx).toContain("Ele NÃO faz: frase de coach");
    expect(ctx).toContain("NÃO ENTRE NESTES ASSUNTOS: política partidária");
  });

  it("da referência entra a forma, com a ordem de não copiar", () => {
    const ctx = contextoDoPerfil(PERFIL_VAZIO, REF);
    expect(ctx).toContain("NÃO copie frases, bordões nem doutrina");
    expect(ctx).toContain("Batidas: gancho → história curta → virada → convite");
    expect(ctx).toContain("a posição dele sobre dízimo");
    // os exemplos colados nunca vão para o pedido de roteiro
    expect(ctx).not.toContain("xxxx");
  });

  it("referência ainda não analisada não entra", () => {
    expect(contextoDoPerfil(PERFIL_VAZIO, { ...REF, dna: null })).toBe("");
  });
});

describe("progressoDoPerfil", () => {
  it("conta os passos prontos", () => {
    expect(progressoDoPerfil(PERFIL_VAZIO, []).feitos).toBe(0);
    const perfil: PerfilConteudo = {
      ...PERFIL_VAZIO,
      objetivo: "o",
      publico: "p",
      pilares: [
        { nome: "a", descricao: "" },
        { nome: "b", descricao: "" },
      ],
    };
    const p = progressoDoPerfil(perfil, [REF]);
    expect(p.feitos).toBe(3);
    expect(p.passos.find((x) => x.chave === "voz")?.feito).toBe(false);
  });
});
