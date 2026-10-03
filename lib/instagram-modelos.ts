/**
 * Modelos de slide do carrossel (issue #189).
 *
 * O carrossel só tinha um desenho: texto sobre foto. Os modelos abaixo são
 * molduras de TEXTO — citação, checklist, cartão, manchete — desenhadas
 * inteiras pelo Satori, sem imagem de IA. Além de variar o perfil, não
 * gastam a cota de imagens e saem na hora.
 *
 * Aqui fica só o que é conta e texto (testável sem desenhar nada); o desenho
 * está em lib/instagram-modelos-render.tsx.
 */

export const MODELOS = {
  foto: {
    nome: "Foto",
    detalhe: "Texto sobre uma foto gerada pela IA.",
  },
  citacao: {
    nome: "Citação",
    detalhe: "Uma frase com aspas grandes e quem disse embaixo.",
  },
  checklist: {
    nome: "Checklist",
    detalhe: "Título e itens marcados. Separe os itens com ponto e vírgula.",
  },
  cartao: {
    nome: "Cartão",
    detalhe: "O texto dentro de um cartão, como um recado assinado.",
  },
  manchete: {
    nome: "Manchete",
    detalhe: "Poucas palavras, enormes, em fundo liso.",
  },
} as const;

export type ModeloSlide = keyof typeof MODELOS;

/** Qualquer coisa que não seja um modelo conhecido cai no de sempre (foto). */
export function lerModelo(v: unknown): ModeloSlide {
  return typeof v === "string" && Object.hasOwn(MODELOS, v)
    ? (v as ModeloSlide)
    : "foto";
}

export type Palavra = { t: string; destaque: boolean };

/**
 * As palavras do slide, marcando as que vieram entre {chaves}. A frase
 * manuscrita ((entre parênteses duplos)) sai à parte: nem todo modelo a usa.
 */
export function palavrasDoSlide(
  texto: string,
  maiusculas = false,
): { palavras: Palavra[]; manuscrita: string } {
  let manuscrita = "";
  const semManuscrita = (texto || "").replace(/\(\(([^)]*)\)\)/g, (_m, frase) => {
    manuscrita = `${manuscrita ? `${manuscrita} ` : ""}${String(frase).trim()}`;
    return " ";
  });
  const palavras: Palavra[] = [];
  for (const trecho of semManuscrita.split(/(\{[^}]*\})/)) {
    const destaque = trecho.startsWith("{") && trecho.endsWith("}");
    let resto = trecho.replace(/[{}]/g, "");
    // "{aliviarei}." — a pontuação colada no destaque fica na palavra dele;
    // solta, viraria uma "palavra" sozinha, com espaço antes do ponto.
    const colada = destaque ? null : resto.match(/^[.,;:!?…”"')\]]+/);
    const anterior = palavras.at(-1);
    if (colada && anterior) {
      anterior.t += colada[0];
      resto = resto.slice(colada[0].length);
    }
    for (const p of resto.split(/\s+/)) {
      if (p) palavras.push({ t: maiusculas ? p.toUpperCase() : p, destaque });
    }
  }
  return { palavras, manuscrita: manuscrita.trim() };
}

export const MAX_ITENS_CHECKLIST = 6;

/**
 * Separa o texto de um slide de checklist. Os itens vêm separados por ponto
 * e vírgula, quebra de linha ou marcador; o primeiro pedaço é o título. Com
 * um pedaço só não há lista: ele vira o único item, sem título.
 */
export function itensDoChecklist(texto: string): { titulo: string; itens: string[] } {
  const pedacos = (texto || "")
    .replace(/[{}]/g, "")
    .replace(/\(\(([^)]*)\)\)/g, " ")
    .split(/[\n;•]+/)
    .map((p) =>
      p
        .replace(/^\s*(?:[-–—*✓✔☐☑]|\[\s?[xX]?\s?\]|\d+[.)])\s*/, "")
        .replace(/\s+/g, " ")
        .trim(),
    )
    .filter(Boolean);
  if (pedacos.length <= 1) return { titulo: "", itens: pedacos };
  return {
    titulo: pedacos[0].replace(/:$/, ""),
    itens: pedacos.slice(1, 1 + MAX_ITENS_CHECKLIST),
  };
}

/**
 * Tamanho da letra pelo comprimento do texto: `faixas` vai do texto mais
 * longo para o mais curto, [a partir de quantos caracteres, tamanho].
 */
export function tamanhoPorTexto(
  comprimento: number,
  faixas: [number, number][],
  padrao: number,
): number {
  for (const [aPartirDe, tamanho] of faixas) {
    if (comprimento > aPartirDe) return tamanho;
  }
  return padrao;
}

/**
 * Encolhe a letra até a maior palavra caber na largura — o Satori não quebra
 * palavra no meio, então "DISCIPULADO" em letra gigante vazaria do quadro.
 * `fator` é a largura média de um caractere em relação ao tamanho da fonte.
 */
export function tamanhoQueCabe(
  tamanho: number,
  maiorPalavra: number,
  largura: number,
  fator: number,
): number {
  if (maiorPalavra <= 0) return tamanho;
  return Math.min(tamanho, Math.floor(largura / (maiorPalavra * fator)));
}

/**
 * O que acrescentar ao pedido da IA para que o texto já venha no formato do
 * modelo escolhido. Vazio para "foto": é o formato que ela já escreve.
 */
export function instrucaoDoModelo(modelo: ModeloSlide): string {
  switch (modelo) {
    case "citacao":
      return 'FORMATO DOS SLIDES (obrigatório): cada "texto" é UMA frase completa, de 12 a 30 palavras, que faça sentido sozinha — como uma citação. Sem ((manuscrita)).';
    case "checklist":
      return 'FORMATO DOS SLIDES (obrigatório): cada "texto" é uma lista — um título curto, depois 3 a 5 itens curtos, tudo separado por ponto e vírgula. Ex.: "Antes de discipular alguém; ore por ele pelo nome; ouça mais do que fala; abra a Bíblia junto". Sem {chaves} e sem ((manuscrita)).';
    case "cartao":
      return 'FORMATO DOS SLIDES (obrigatório): cada "texto" é um recado de 2 a 3 frases curtas, em tom de conversa, de 20 a 45 palavras. Sem ((manuscrita)).';
    case "manchete":
      return 'FORMATO DOS SLIDES (obrigatório): cada "texto" tem no MÁXIMO 8 palavras, fortes, com 1 ou 2 {destacadas}. Sem ((manuscrita)).';
    case "foto":
      return "";
  }
}
