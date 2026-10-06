/**
 * Legenda na tela dos Reels cortados das pregações (issue #229).
 *
 * Quem assiste Reel costuma estar sem som: a fala precisa estar escrita, em
 * blocos curtos que acompanham a voz. Aqui ficam as regras puras — como as
 * palavras (com os tempos que o Whisper devolve) viram blocos, e como os
 * blocos viram um arquivo ASS que o ffmpeg queima no vídeo. Testado em
 * testes/legenda-reel.test.ts.
 *
 * O desenho segue o que funciona em vídeo curto: poucas palavras por vez, em
 * maiúsculas, letra pesada com contorno, e a palavra que está sendo dita
 * pintada de outra cor.
 */

/** Uma palavra falada, com os tempos em segundos a partir do início do corte. */
export type PalavraFalada = { word: string; start: number; end: number };

export type BlocoDeLegenda = {
  inicio: number;
  fim: number;
  palavras: { t: string; inicio: number; fim: number }[];
};

export const MAX_PALAVRAS_POR_BLOCO = 3;
export const MAX_LETRAS_POR_BLOCO = 18;
/** Pausa (s) que encerra o bloco mesmo com espaço sobrando. */
const PAUSA_QUE_QUEBRA = 0.6;
/** Um bloco some no máximo isto depois da última palavra (não fica pendurado no silêncio). */
const SOBRA_MAX = 0.35;

/** Tira o que não se escreve na tela: vírgula, ponto, aspas. Mantém ? e !. */
function limparPalavra(w: string): string {
  return w
    .trim()
    .replace(/^[“"'(¿¡]+/, "")
    .replace(/[”"',.;:)…]+$/, "")
    .toUpperCase();
}

const fechaFrase = (w: string) => /[.!?…]["”']?$/.test(w.trim());

/**
 * Agrupa as palavras em blocos de até três, respeitando o fim de frase, a
 * pausa de quem fala e um teto de letras (para caber numa linha).
 */
export function blocosDeLegenda(palavras: PalavraFalada[]): BlocoDeLegenda[] {
  const blocos: BlocoDeLegenda[] = [];
  let atual: BlocoDeLegenda["palavras"] = [];
  let letras = 0;
  const fechar = () => {
    if (!atual.length) return;
    blocos.push({
      inicio: atual[0].inicio,
      fim: atual[atual.length - 1].fim,
      palavras: atual,
    });
    atual = [];
    letras = 0;
  };
  let anterior: PalavraFalada | null = null;
  for (const p of palavras) {
    const t = limparPalavra(p.word);
    if (!t || !(p.end >= p.start)) continue;
    const pausa = anterior ? p.start - anterior.end : 0;
    if (
      atual.length &&
      (atual.length >= MAX_PALAVRAS_POR_BLOCO ||
        letras + 1 + t.length > MAX_LETRAS_POR_BLOCO ||
        pausa > PAUSA_QUE_QUEBRA ||
        (anterior && fechaFrase(anterior.word)) ||
        // Vírgula também separa, desde que não deixe uma palavrinha sozinha.
        (anterior && /[,;:]$/.test(anterior.word.trim()) && letras >= 8))
    ) {
      fechar();
    }
    atual.push({ t, inicio: p.start, fim: p.end });
    letras += (atual.length > 1 ? 1 : 0) + t.length;
    anterior = p;
  }
  fechar();
  // Cada bloco fica na tela até o seguinte começar, com um teto de sobra.
  for (let i = 0; i < blocos.length; i++) {
    const proximo = blocos[i + 1]?.inicio ?? Number.POSITIVE_INFINITY;
    blocos[i].fim = Math.min(proximo, blocos[i].fim + SOBRA_MAX);
  }
  return blocos;
}

/** 83,456 → "0:01:23.46" (o formato de tempo do ASS, em centésimos). */
export function tempoASS(segundos: number): string {
  const cs = Math.max(0, Math.round(segundos * 100));
  const h = Math.floor(cs / 360000);
  const m = Math.floor((cs % 360000) / 6000);
  const s = Math.floor((cs % 6000) / 100);
  return `${h}:${String(m).padStart(2, "0")}:${String(s).padStart(2, "0")}.${String(cs % 100).padStart(2, "0")}`;
}

/** "#C0892B" → "&H002B89C0" (o ASS escreve a cor ao contrário: azul, verde, vermelho). */
export function corASS(hex: string): string {
  const m = /^#?([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})$/i.exec(hex.trim());
  if (!m) return "&H00FFFFFF";
  return `&H00${m[3]}${m[2]}${m[1]}`.toUpperCase();
}

export type OpcoesLegenda = {
  largura: number;
  altura: number;
  /** Nome da FAMÍLIA da fonte, como está dentro do arquivo (ex.: "Anton"). */
  fonte: string;
  /** Cor da palavra que está sendo dita. */
  corDestaque: string;
};

/**
 * O arquivo ASS. Cada palavra vira um evento: o bloco inteiro aparece, com a
 * palavra da vez na cor de destaque. A legenda fica no terço de baixo, acima
 * da faixa em que o Instagram põe o nome e a descrição.
 */
export function gerarASS(blocos: BlocoDeLegenda[], o: OpcoesLegenda): string {
  // No ASS o tamanho é a altura da linha, não da letra: 13% da largura dá uma
  // letra que se lê no celular sem tapar o rosto de quem fala.
  const tamanho = Math.round(o.largura * 0.13);
  const margemV = Math.round(o.altura * 0.27);
  const destaque = corASS(o.corDestaque).replace("&H00", "&H");
  const cabecalho = [
    "[Script Info]",
    "ScriptType: v4.00+",
    `PlayResX: ${o.largura}`,
    `PlayResY: ${o.altura}`,
    "WrapStyle: 2",
    "ScaledBorderAndShadow: yes",
    "",
    "[V4+ Styles]",
    "Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding",
    `Style: Fala,${o.fonte},${tamanho},&H00FFFFFF,&H00FFFFFF,&H00000000,&H96000000,0,0,0,0,100,100,1,0,1,${Math.round(tamanho * 0.075)},${Math.round(tamanho * 0.04)},2,60,60,${margemV},1`,
    "",
    "[Events]",
    "Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text",
  ];
  const eventos: string[] = [];
  for (const b of blocos) {
    b.palavras.forEach((p, i) => {
      const ate = b.palavras[i + 1]?.inicio ?? b.fim;
      if (ate <= p.inicio) return;
      const texto = b.palavras
        .map((w, j) => (j === i ? `{\\c${destaque}&}${w.t}{\\c&HFFFFFF&}` : w.t))
        .join(" ");
      eventos.push(
        `Dialogue: 0,${tempoASS(i === 0 ? b.inicio : p.inicio)},${tempoASS(ate)},Fala,,0,0,0,,${texto}`,
      );
    });
  }
  return `${[...cabecalho, ...eventos].join("\n")}\n`;
}
