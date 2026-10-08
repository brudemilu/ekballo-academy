import { describe, expect, it } from "vitest";
import {
  ehModeloEditorial,
  estiloDaImagem,
  instrucaoDoModelo,
  itensDoChecklist,
  lerModelo,
  MAX_ITENS_CHECKLIST,
  MODELOS_AUTOMATICOS,
  MODELOS_COM_FOTO,
  palavrasDoSlide,
  partirFrase,
  sortearDiferente,
  tamanhoPorTexto,
  tamanhoQueCabe,
} from "@/lib/instagram-modelos";

// =============================================================
// Modelos de texto do carrossel (issue #189). O que não pode
// acontecer: um modelo desconhecido derrubar a imagem na hora de
// publicar, o checklist comer um item, ou a palavra grande vazar
// do quadro (o Satori não quebra palavra no meio).
// =============================================================

describe("lerModelo", () => {
  it("aceita os modelos conhecidos", () => {
    expect(lerModelo("citacao")).toBe("citacao");
    expect(lerModelo("manchete")).toBe("manchete");
  });

  it("qualquer outra coisa cai no modelo de foto — post antigo não tem o campo", () => {
    expect(lerModelo(undefined)).toBe("foto");
    expect(lerModelo(null)).toBe("foto");
    expect(lerModelo("inventado")).toBe("foto");
    expect(lerModelo("toString")).toBe("foto");
  });
});

describe("palavrasDoSlide", () => {
  it("marca o que veio entre chaves e separa a frase manuscrita", () => {
    const r = palavrasDoSlide("A igreja que {discipula} muda ((uma mesa por vez))");
    expect(r.palavras.map((p) => p.t)).toEqual([
      "A",
      "igreja",
      "que",
      "discipula",
      "muda",
    ]);
    expect(r.palavras.filter((p) => p.destaque).map((p) => p.t)).toEqual(["discipula"]);
    expect(r.manuscrita).toBe("uma mesa por vez");
  });

  it("põe em maiúsculas quando a fonte pede, sem perder o destaque", () => {
    const r = palavrasDoSlide("{graça} basta", true);
    expect(r.palavras).toEqual([
      { t: "GRAÇA", destaque: true },
      { t: "BASTA", destaque: false },
    ]);
  });

  it("a pontuação colada no destaque não vira palavra solta", () => {
    const r = palavrasDoSlide("eu vos {aliviarei}. Venham");
    expect(r.palavras.map((p) => p.t)).toEqual(["eu", "vos", "aliviarei.", "Venham"]);
    // Com espaço antes, a pontuação é do texto seguinte e fica onde está.
    expect(palavrasDoSlide("{sim} — e não").palavras.map((p) => p.t)).toEqual([
      "sim",
      "—",
      "e",
      "não",
    ]);
  });

  it("texto vazio não quebra", () => {
    expect(palavrasDoSlide("")).toEqual({ palavras: [], manuscrita: "" });
  });
});

describe("itensDoChecklist", () => {
  it("o primeiro pedaço é o título; os outros, os itens", () => {
    expect(itensDoChecklist("Antes de discipular: ; ore pelo nome; ouça mais")).toEqual(
      {
        titulo: "Antes de discipular",
        itens: ["ore pelo nome", "ouça mais"],
      },
    );
  });

  it("aceita quebra de linha e marcadores que a IA costuma pôr", () => {
    expect(itensDoChecklist("Três passos\n- ore\n2) leia\n[ ] sirva\n✓ volte")).toEqual(
      {
        titulo: "Três passos",
        itens: ["ore", "leia", "sirva", "volte"],
      },
    );
  });

  it("um pedaço só vira o único item, sem título", () => {
    expect(itensDoChecklist("Ore todos os dias")).toEqual({
      titulo: "",
      itens: ["Ore todos os dias"],
    });
  });

  it("corta no teto para a lista caber no quadro", () => {
    const texto = ["Título", ...Array.from({ length: 10 }, (_, i) => `item ${i}`)].join(
      ";",
    );
    expect(itensDoChecklist(texto).itens).toHaveLength(MAX_ITENS_CHECKLIST);
  });

  it("tira as marcações de destaque, que o checklist não usa", () => {
    expect(itensDoChecklist("{Hoje}; ((ore)) leia").titulo).toBe("Hoje");
  });
});

describe("tamanho da letra", () => {
  const faixas: [number, number][] = [
    [80, 96],
    [50, 124],
  ];

  it("texto mais longo, letra menor", () => {
    expect(tamanhoPorTexto(100, faixas, 196)).toBe(96);
    expect(tamanhoPorTexto(60, faixas, 196)).toBe(124);
    expect(tamanhoPorTexto(10, faixas, 196)).toBe(196);
  });

  it("encolhe até a maior palavra caber na largura", () => {
    // 13 letras a 0,5 de largura cada, em 800px: no máximo 123.
    expect(tamanhoQueCabe(196, 13, 800, 0.5)).toBe(123);
    // Palavra curta não mexe no tamanho.
    expect(tamanhoQueCabe(196, 4, 800, 0.5)).toBe(196);
    expect(tamanhoQueCabe(196, 0, 800, 0.5)).toBe(196);
  });
});

describe("instrucaoDoModelo", () => {
  it("o modelo de foto não muda o pedido à IA", () => {
    expect(instrucaoDoModelo("foto")).toBe("");
  });

  it("o checklist pede a lista no separador que a tela entende", () => {
    expect(instrucaoDoModelo("checklist")).toContain("ponto e vírgula");
  });

  it("a manchete limita as palavras", () => {
    expect(instrucaoDoModelo("manchete")).toMatch(/MÁXIMO 8 palavras/);
  });
});

// Os dois modelos da segunda leva de referências (issue #241).
describe("impacto e recorte", () => {
  it("são conhecidos, usam foto e entram no sorteio", () => {
    for (const m of ["impacto", "recorte"] as const) {
      expect(lerModelo(m)).toBe(m);
      expect(ehModeloEditorial(m)).toBe(true);
      expect(MODELOS_COM_FOTO).toContain(m);
      expect(MODELOS_AUTOMATICOS).toContain(m);
    }
  });

  it("pedem à IA uma frase inteira, com destaque e sem manuscrita", () => {
    for (const m of ["impacto", "recorte"] as const) {
      const pedido = instrucaoDoModelo(m);
      expect(pedido).toContain("UMA frase");
      expect(pedido).toContain("{destacadas}");
      expect(pedido).toContain("Sem ((manuscrita))");
    }
  });
});

describe("sortearDiferente · o post seguinte não sai igual ao anterior", () => {
  it("nunca devolve o que acabou de ser usado", () => {
    for (let i = 0; i < 20; i++) {
      expect(sortearDiferente(MODELOS_AUTOMATICOS, "cinema", i / 20)).not.toBe(
        "cinema",
      );
    }
  });

  it("cobre todas as opções ao longo do sorteio", () => {
    const vistos = new Set(
      Array.from({ length: 40 }, (_, i) =>
        sortearDiferente(MODELOS_AUTOMATICOS, null, i / 40),
      ),
    );
    expect(vistos.size).toBe(MODELOS_AUTOMATICOS.length);
  });

  it("sem anterior conhecido, ou com sorteio no limite, ainda devolve uma opção válida", () => {
    expect(MODELOS_AUTOMATICOS).toContain(
      sortearDiferente(MODELOS_AUTOMATICOS, undefined, 0),
    );
    expect(MODELOS_AUTOMATICOS).toContain(
      sortearDiferente(MODELOS_AUTOMATICOS, "x", 1),
    );
    // Lista de um item só: não há como ser diferente, devolve o que tem.
    expect(sortearDiferente(["cinema"], "cinema", 0.5)).toBe("cinema");
  });
});

// Os quatro modelos da terceira leva de referências.
describe("sereno, contraste, carimbo e gravura", () => {
  const novos = ["sereno", "contraste", "carimbo", "gravura"] as const;

  it("são conhecidos, usam imagem e entram no sorteio", () => {
    for (const m of novos) {
      expect(lerModelo(m)).toBe(m);
      expect(ehModeloEditorial(m)).toBe(true);
      expect(MODELOS_COM_FOTO).toContain(m);
      expect(MODELOS_AUTOMATICOS).toContain(m);
      expect(instrucaoDoModelo(m)).toContain("FORMATO DOS SLIDES");
    }
  });

  it("cada um pede a imagem no acabamento certo", () => {
    expect(estiloDaImagem("gravura")).toBe("gravura");
    expect(estiloDaImagem("sereno")).toBe("devocional");
    expect(estiloDaImagem("contraste")).toBe("documental");
    expect(estiloDaImagem("cinema")).toBe("documental");
    expect(estiloDaImagem("foto")).toBe("devocional");
  });
});

describe("partirFrase", () => {
  const p = (t: string) => t.split(" ").map((w) => ({ t: w }));
  const junta = (l: { t: string }[]) => l.map((w) => w.t).join(" ");

  it("corta no primeiro fim de frase", () => {
    const [a, b] = partirFrase(p("A mesa não é só um lugar. É onde histórias mudam."));
    expect(junta(a)).toBe("A mesa não é só um lugar.");
    expect(junta(b)).toBe("É onde histórias mudam.");
  });

  it("sem ponto no meio, corta na vírgula", () => {
    const [a, b] = partirFrase(
      p("Você não pode pular a parte difícil, porque é nela que você cresce."),
    );
    expect(junta(a)).toBe("Você não pode pular a parte difícil,");
    expect(junta(b)).toBe("porque é nela que você cresce.");
  });

  it("vírgula logo no começo não serve de corte", () => {
    const [a, b] = partirFrase(p("Pai, perdoa o que eles fazem"));
    expect(junta(a)).toBe("Pai, perdoa o que eles fazem");
    expect(b).toEqual([]);
  });

  it("frase sem pausa fica inteira, e nenhuma palavra se perde", () => {
    const frase = "Deus não desperdiça nenhuma dor.";
    const [a, b] = partirFrase(p(frase));
    expect(junta(a)).toBe(frase);
    expect(b).toEqual([]);
    const longa =
      'Onde Lúcifer disse "eu subirei", Jesus disse "eu descerei". Precisamos decidir.';
    const [c, d] = partirFrase(p(longa));
    expect(`${junta(c)} ${junta(d)}`).toBe(longa);
  });
});
