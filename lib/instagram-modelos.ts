/**
 * Modelos de slide do carrossel (issue #189).
 *
 * Os quatro primeiros (cinema, bloco, cartaz, editorial) nasceram das
 * referências que o Bruno salvou (issue #211): tipografia enorme como
 * protagonista, foto escura com grão, layout editorial — sem papel, sem
 * pincelada, sem moldura. Os de texto (citação, checklist, cartão, manchete)
 * não usam foto. "foto" é o desenho antigo, mantido para os posts já salvos.
 *
 * Aqui fica só o que é conta e texto (testável sem desenhar nada); o desenho
 * está em lib/instagram-modelos-render.tsx.
 */

export const MODELOS = {
  cinema: {
    nome: "Cinema",
    detalhe:
      "Foto escura com grão e o texto forte embaixo. Use ~~til duplo~~ para riscar uma frase.",
  },
  bloco: {
    nome: "Bloco",
    detalhe:
      "Foto com o texto em coluna, cada linha de um tamanho, preenchendo a largura.",
  },
  cartaz: {
    nome: "Cartaz",
    detalhe: "Foto com a palavra entre {chaves} gigante no topo.",
  },
  editorial: {
    nome: "Editorial",
    detalhe: "Fundo claro, letra enorme e legendas pequenas nos cantos. Sem foto.",
  },
  foto: {
    nome: "Papel (antigo)",
    detalhe: "O desenho anterior: foto com papel, pincelada e moldura.",
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

/** O modelo dos posts que ninguém desenhou à mão: piloto, pacote da semana, WhatsApp. */
export const MODELO_AUTOMATICO: ModeloSlide = "cinema";

export type Palavra = { t: string; destaque: boolean; riscada?: boolean };

/** Os modelos só de texto (lib/instagram-modelos-render.tsx). */
export type ModeloDeTexto = "citacao" | "checklist" | "cartao" | "manchete";
export function ehModeloDeTexto(m: ModeloSlide): m is ModeloDeTexto {
  return m === "citacao" || m === "checklist" || m === "cartao" || m === "manchete";
}

/** Os modelos novos (lib/instagram-editorial-render.tsx). */
export type ModeloEditorial = "cinema" | "bloco" | "cartaz" | "editorial";
export function ehModeloEditorial(m: ModeloSlide): m is ModeloEditorial {
  return m === "cinema" || m === "bloco" || m === "cartaz" || m === "editorial";
}

/** Modelos que usam foto de fundo (IA, banco ou foto enviada). */
export const MODELOS_COM_FOTO: ModeloSlide[] = ["cinema", "bloco", "cartaz", "foto"];

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
  // ~~riscado~~ vira \u0001…\u0002 para atravessar a separação por chaves.
  const marcado = semManuscrita.replace(/~~([^~]+)~~/g, (_m, t) =>
    String(t)
      .split(/\s+/)
      .filter(Boolean)
      .map((w) => `\u0001${w}`)
      .join(" "),
  );
  for (const trecho of marcado.split(/(\{[^}]*\})/)) {
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
    for (const bruta of resto.split(/\s+/)) {
      if (!bruta) continue;
      const riscada = bruta.startsWith("\u0001");
      const p = bruta.split("\u0001").join("");
      if (!p) continue;
      palavras.push({
        t: maiusculas ? p.toUpperCase() : p,
        destaque,
        ...(riscada ? { riscada: true } : {}),
      });
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

// A foto dos modelos novos é de reportagem, com gente — não paisagem.
const CENA_DOCUMENTAL =
  'O "prompt" de cada slide descreve, em INGLÊS, uma CENA REAL com pessoas ligada ao texto, como foto de reportagem de uma igreja ou de uma casa: mãos segurando o pão e o cálice, uma Bíblia aberta sobre a mesa com alguém lendo, pessoas orando de costas, gente à mesa conversando, um abraço, alguém de joelhos, plateia com as mãos levantadas vista de trás. Diga quem, fazendo o quê, onde e com que luz. NUNCA paisagem, pôr do sol, montanha ou símbolo solto.';

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
    case "editorial":
      return 'FORMATO DOS SLIDES (obrigatório): cada "texto" é UMA frase de 4 a 12 palavras, direta, com 1 ou 2 palavras {destacadas}. Sem ((manuscrita)).';
    case "cinema":
      return `FORMATO DOS SLIDES (obrigatório): cada "texto" é UMA frase de 4 a 12 palavras, direta, com 1 ou 2 palavras {destacadas}. Sem ((manuscrita)). ${CENA_DOCUMENTAL}`;
    case "cartaz":
      return `FORMATO DOS SLIDES (obrigatório): cada "texto" começa com 1 ou 2 palavras {entre chaves} (curtas, de até 6 letras cada, que viram o título gigante) seguidas de uma frase de apoio de 4 a 10 palavras. ${CENA_DOCUMENTAL}`;
    case "bloco":
      return `FORMATO DOS SLIDES (obrigatório): cada "texto" tem de 10 a 22 palavras, como fala de pregação, com 1 ou 2 palavras {destacadas} e, se couber, uma expressão final de 1 a 2 palavras ((manuscrita)). ${CENA_DOCUMENTAL}`;
    case "foto":
      return "";
  }
}
