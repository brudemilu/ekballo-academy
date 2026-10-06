/**
 * Dois recursos do estúdio de carrossel (issue #189), inspirados no que as
 * ferramentas de conteúdo do mercado fazem (BestContent, Predis):
 *
 * 1) "Só tenho a ideia": uma frase vira o carrossel inteiro. É o oposto do
 *    modo que já existia (colar o conteúdo e a IA só reorganizar). Aqui a IA
 *    ESCREVE — e por isso as regras são outras: ela pode desenvolver o tema,
 *    mas não pode citar versículo com referência nem inventar fato.
 *
 * 2) Opções de visual: em vez de acertar cor, fonte e tom à mão, o pastor
 *    escolhe entre conjuntos prontos que combinam.
 *
 * Regras puras, testadas em testes/carrossel-ideia.test.ts.
 */

export const IDEIA_MIN = 4;
export const IDEIA_MAX = 400;

export function validarIdeia(
  v: unknown,
): { ok: true; valor: string } | { ok: false; erro: string } {
  const t = typeof v === "string" ? v.trim().replace(/\s+/g, " ") : "";
  if (t.length < IDEIA_MIN) return { ok: false, erro: "Escreva a ideia em uma frase." };
  if (t.length > IDEIA_MAX) {
    return {
      ok: false,
      erro: "A ideia ficou longa. Se você já tem o texto pronto, use “Tenho o conteúdo”.",
    };
  }
  return { ok: true, valor: t };
}

/**
 * O pedido à IA para escrever o carrossel a partir de uma ideia. O formato da
 * resposta é o mesmo do modo "conteúdo" (slides + legenda), para o editor não
 * precisar saber de onde veio.
 */
export function systemCarrosselDaIdeia(
  tipo: "carrossel" | "unico",
  contextoPerfil: string,
): string {
  const quantidade =
    tipo === "unico"
      ? "Gere EXATAMENTE 1 slide — a frase que resume a ideia."
      : "Gere de 5 a 7 slides. O 1º prende a atenção; os do meio desenvolvem UMA ideia cada, em ordem; o penúltimo traz uma aplicação prática; o último fecha com um convite simples.";
  return `Você escreve posts de Instagram para um ministério cristão de discipulado (Ekballo).
O pastor te deu só a IDEIA do post, em uma frase. Você escreve o carrossel.

O ASSUNTO É O QUE O PASTOR PEDIU
- A IDEIA é o ASSUNTO do post. O texto de cada slide fala DELA, com as palavras dela: se a ideia é "família", o post é sobre família e a palavra família (ou casa, pais, filhos, casamento) aparece no texto.
- O que você sabe do ministério, mais abaixo, define o JEITO de falar — não o assunto. NÃO troque o tema pedido por discipulado, mesa ou outro tema da casa, a menos que a ideia peça isso.
- Ideia de uma palavra só também vale: escreva uma verdade clara e pastoral sobre aquela palavra.

O QUE VOCÊ PODE E NÃO PODE
- Desenvolva a ideia com clareza e profundidade pastoral: o que ela significa, por que importa, o que muda na vida de quem lê.
- NÃO escreva referência bíblica (livro, capítulo e versículo) nem cite versículo entre aspas, A MENOS que o pastor tenha escrito a referência na ideia. Você erra referência com facilidade, e versículo citado errado é pior que versículo nenhum. Pode falar do ensino bíblico com as suas palavras.
- NÃO invente fato, número, pesquisa, história "real" nem frase atribuída a alguém.
- NÃO prometa cura, prosperidade nem resultado. Não use tom de coach ("transforme sua vida", "desbloqueie").
- Fique dentro da fé cristã histórica; em assunto controverso entre igrejas, não tome partido.

FORMATO
- ${quantidade}
- "texto": frase MUITO curta (3 a 8 palavras), em português do Brasil. Envolva a ÚNICA palavra mais forte entre chaves {}, ex.: "Pense menos em {você}".
- "prompt": descrição EM INGLÊS de uma foto cinematográfica que represente o sentido do slide (objetos, luz, cenas). Sem texto na imagem, sem rostos.
- "modo": "circulo", "grifo", "marca" ou "dourado". Varie.
- "cor": cor hex (#rrggbb) que combine com a imagem.
- "legenda": o texto do post — é AQUI que a ideia é desenvolvida de verdade, em 3 a 5 frases pessoais e calorosas, sem cara de anúncio. Termine com 3 a 5 hashtags.
${contextoPerfil ? `\nQUEM ESTÁ FALANDO (dá a voz e os limites; o assunto é a ideia do pastor)\n${contextoPerfil}\n` : ""}
Responda SOMENTE com JSON válido, neste formato:
{"slides":[{"texto":"...","prompt":"...","modo":"...","cor":"#rrggbb"}],"legenda":"..."}`;
}

// ---------------------------------------------------------------------------
// Opções de visual
// ---------------------------------------------------------------------------

export type Visual = {
  chave: string;
  nome: string;
  /** Cor de destaque (chave de TEMAS em lib/instagram-render). */
  tema: "terracota" | "dourado" | "azul" | "verde" | "vinho";
  fonte: "anton" | "bebas" | "dm-serif" | "cormorant";
  tom: "escuro" | "claro";
};

/**
 * Conjuntos que combinam. Poucos de propósito: a queixa mais comum dessas
 * ferramentas é "50 opções, todas com cara de template".
 */
export const VISUAIS: Visual[] = [
  {
    chave: "impacto",
    nome: "Impacto",
    tema: "terracota",
    fonte: "anton",
    tom: "escuro",
  },
  {
    chave: "solene",
    nome: "Solene",
    tema: "dourado",
    fonte: "dm-serif",
    tom: "escuro",
  },
  {
    chave: "editorial",
    nome: "Editorial",
    tema: "azul",
    fonte: "cormorant",
    tom: "claro",
  },
  { chave: "vivo", nome: "Vivo", tema: "verde", fonte: "bebas", tom: "escuro" },
];
