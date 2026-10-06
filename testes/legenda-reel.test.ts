import { describe, expect, it } from "vitest";
import {
  blocosDeLegenda,
  corASS,
  gerarASS,
  MAX_LETRAS_POR_BLOCO,
  MAX_PALAVRAS_POR_BLOCO,
  type PalavraFalada,
  quebrarTitulo,
  tempoASS,
} from "@/lib/legenda-reel";

// =============================================================
// Legenda na tela dos Reels. O que não pode acontecer: a legenda
// sair fora de sincronia com a voz, um bloco ficar grande demais
// para a tela, ou sobrar texto pendurado durante um silêncio.
// =============================================================

/** Palavras de 0,3 s cada, uma atrás da outra, a partir de `inicio`. */
function fala(texto: string, inicio = 0, passo = 0.3): PalavraFalada[] {
  return texto.split(" ").map((word, i) => ({
    word,
    start: inicio + i * passo,
    end: inicio + i * passo + passo * 0.9,
  }));
}

const textos = (palavras: PalavraFalada[]) =>
  blocosDeLegenda(palavras).map((b) => b.palavras.map((p) => p.t).join(" "));

describe("blocosDeLegenda", () => {
  it("agrupa em blocos curtos, em maiúsculas e sem pontuação de pausa", () => {
    expect(
      textos(fala("Então, ele é sacrificial, não tem outro significado de amor.")),
    ).toEqual([
      "ENTÃO ELE É",
      "SACRIFICIAL",
      "NÃO TEM OUTRO",
      "SIGNIFICADO DE",
      "AMOR",
    ]);
  });

  it("nenhum bloco passa do limite de palavras nem de letras", () => {
    const blocos = blocosDeLegenda(
      fala(
        "nós temos que caminhar com pessoas extraordinariamente imperfeitas e amar de perto",
      ),
    );
    for (const b of blocos) {
      expect(b.palavras.length).toBeLessThanOrEqual(MAX_PALAVRAS_POR_BLOCO);
      const letras = b.palavras.map((p) => p.t).join(" ").length;
      // Uma palavra sozinha pode ser maior que o teto: palavra não se parte.
      if (b.palavras.length > 1)
        expect(letras).toBeLessThanOrEqual(MAX_LETRAS_POR_BLOCO);
    }
  });

  it("fim de frase fecha o bloco, e mantém ? e !", () => {
    expect(textos(fala("Deus terminou? Eu cansei! Fim"))).toEqual([
      "DEUS TERMINOU?",
      "EU CANSEI!",
      "FIM",
    ]);
  });

  it("pausa longa de quem fala fecha o bloco", () => {
    const palavras = [...fala("pessoas não"), ...fala("são descartáveis", 3)];
    expect(textos(palavras)).toEqual(["PESSOAS NÃO", "SÃO DESCARTÁVEIS"]);
  });

  it("o bloco some pouco depois da última palavra, não fica no silêncio", () => {
    const [primeiro] = blocosDeLegenda([
      ...fala("pessoas não"),
      ...fala("são descartáveis", 5),
    ]);
    expect(primeiro.fim).toBeLessThan(1.2);
  });

  it("um bloco dura até o seguinte começar quando a fala é corrida", () => {
    const blocos = blocosDeLegenda(fala("um dois três quatro cinco seis"));
    expect(blocos[0].fim).toBeCloseTo(blocos[1].inicio, 5);
  });

  it("ignora palavra vazia ou com tempo invertido", () => {
    expect(
      textos([
        { word: " ", start: 0, end: 0.2 },
        { word: "graça", start: 1, end: 0.5 },
        { word: "amor", start: 1, end: 1.4 },
      ]),
    ).toEqual(["AMOR"]);
    expect(blocosDeLegenda([])).toEqual([]);
  });
});

describe("tempoASS e corASS", () => {
  it("escreve o tempo em horas, minutos, segundos e centésimos", () => {
    expect(tempoASS(0)).toBe("0:00:00.00");
    expect(tempoASS(83.456)).toBe("0:01:23.46");
    expect(tempoASS(3725.5)).toBe("1:02:05.50");
    expect(tempoASS(-4)).toBe("0:00:00.00");
  });

  it("inverte a cor para a ordem do ASS (azul, verde, vermelho)", () => {
    expect(corASS("#C0892B")).toBe("&H002B89C0");
    expect(corASS("f2c230")).toBe("&H0030C2F2");
    expect(corASS("não é cor")).toBe("&H00FFFFFF");
  });
});

describe("gerarASS", () => {
  const opcoes = {
    largura: 1080,
    altura: 1920,
    fonte: "Anton",
    corDestaque: "#F2C230",
  };

  it("um evento por palavra, com a palavra da vez na cor de destaque", () => {
    const ass = gerarASS(blocosDeLegenda(fala("pessoas não são")), opcoes);
    const eventos = ass.split("\n").filter((l) => l.startsWith("Dialogue:"));
    expect(eventos).toHaveLength(3);
    expect(eventos[0]).toContain("{\\c&H30C2F2&}PESSOAS{\\c&HFFFFFF&} NÃO SÃO");
    expect(eventos[1]).toContain("PESSOAS {\\c&H30C2F2&}NÃO{\\c&HFFFFFF&} SÃO");
  });

  it("os eventos de um bloco se emendam, sem buraco nem sobreposição", () => {
    const ass = gerarASS(blocosDeLegenda(fala("pessoas não são")), opcoes);
    const tempos = ass
      .split("\n")
      .filter((l) => l.startsWith("Dialogue:"))
      .map((l) => l.split(",").slice(1, 3));
    expect(tempos[0][1]).toBe(tempos[1][0]);
    expect(tempos[1][1]).toBe(tempos[2][0]);
  });

  it("declara o tamanho do quadro e a fonte pedida", () => {
    const ass = gerarASS([], opcoes);
    expect(ass).toContain("PlayResX: 1080");
    expect(ass).toContain("PlayResY: 1920");
    expect(ass).toContain("Style: Fala,Anton,");
  });
});

describe("título fixo no topo", () => {
  const opcoes = {
    largura: 1080,
    altura: 1920,
    fonte: "Anton",
    corDestaque: "#F2C230",
  };

  it("quebra em linhas curtas sem partir palavra, no máximo três", () => {
    expect(quebrarTitulo("O barco era seguro. E era esse o problema.")).toEqual([
      "O BARCO ERA SEGURO. E",
      "ERA ESSE O PROBLEMA.",
    ]);
    expect(
      quebrarTitulo("um dois três quatro cinco seis sete oito nove dez onze doze", 10),
    ).toHaveLength(3);
    expect(quebrarTitulo("   ")).toEqual([]);
  });

  it("entra como um evento que dura o vídeo todo, por cima da legenda", () => {
    const ass = gerarASS(blocosDeLegenda(fala("pessoas não são")), {
      ...opcoes,
      titulo: "Pessoas não são descartáveis",
    });
    const titulo = ass.split("\n").find((l) => l.includes(",Titulo,"));
    expect(titulo).toContain("PESSOAS NÃO SÃO\\NDESCARTÁVEIS");
    expect(titulo?.startsWith("Dialogue: 1,0:00:00.00,")).toBe(true);
  });

  it("sem título não cria o evento; e chaves no título não viram comando", () => {
    expect(gerarASS([], opcoes)).not.toContain(",Titulo,,");
    const ass = gerarASS([], { ...opcoes, titulo: "{\\b1}Graça" });
    expect(ass).toContain("B1GRAÇA");
    expect(ass.split("\n").find((l) => l.includes(",Titulo,,"))).not.toContain("{");
  });
});
