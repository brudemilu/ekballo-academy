/**
 * Roteiro de vídeo falado (Reel) do copiloto de conteúdo — issue #189.
 *
 * Regras puras: durações, quantas palavras cabem em cada uma, o pedido à IA e
 * a limpeza da resposta. Testado em testes/roteiro.test.ts.
 *
 * Duas decisões sustentam o desenho:
 *
 * 1) O roteiro sai SOMENTE da fonte escolhida — uma mesa, um devocional, um
 *    texto colado. A IA reorganiza e encurta; não acrescenta ideia, versículo
 *    nem doutrina. Por isso ela devolve em "base" os trechos da fonte que
 *    sustentam o roteiro: o pastor confere em segundos se nada foi inventado.
 *
 * 2) O que se grava são três colunas por momento — o que FALAR, o que aparece
 *    na TELA (texto curto) e o que MOSTRAR (enquadramento, B-roll). É o formato
 *    que quem grava sozinho consegue seguir sem decorar.
 */

export const DURACOES = [15, 30, 60, 90] as const;
export type Duracao = (typeof DURACOES)[number];

/** Palavras faladas que cabem em cada duração, em ritmo de conversa. */
export const PALAVRAS_POR_DURACAO: Record<Duracao, { min: number; max: number }> = {
  15: { min: 35, max: 40 },
  30: { min: 70, max: 80 },
  60: { min: 140, max: 150 },
  90: { min: 200, max: 220 },
};

export function duracaoValida(v: unknown): v is Duracao {
  return typeof v === "number" && (DURACOES as readonly number[]).includes(v);
}

export type FonteRoteiro = {
  tipo: "mesa" | "devocional" | "livre";
  /** Como a fonte aparece para o pastor: "Ego Transformado · Mesa 02". */
  titulo: string;
  /** Autor do livro ou do devocional, quando há — para dar o crédito. */
  autor?: string;
  texto: string;
};

export type MomentoRoteiro = "gancho" | "corpo" | "chamada";

export type BlocoRoteiro = {
  momento: MomentoRoteiro;
  /** Faixa de tempo: "0–3s". */
  tempo: string;
  falar: string;
  /** Texto curto que aparece na tela. */
  tela: string;
  /** O que a câmera mostra: enquadramento, B-roll, objeto. */
  mostrar: string;
};

export type Roteiro = {
  titulo: string;
  /** Opções de abertura; a primeira é a que está no bloco "gancho". */
  ganchos: string[];
  blocos: BlocoRoteiro[];
  legenda: string;
  /** Trechos da fonte que sustentam o roteiro — para conferir a fidelidade. */
  base: string[];
};

/** De onde o roteiro veio — o que se guarda (sem o texto da fonte). */
export type OrigemRoteiro = Pick<FonteRoteiro, "tipo" | "titulo" | "autor">;

/** Um roteiro guardado pelo pastor. */
export type RoteiroSalvo = {
  id: string;
  titulo: string;
  duracao: Duracao;
  fonte: OrigemRoteiro;
  roteiro: Roteiro;
  criado_em: string;
};

// Limite do que vai para a IA. Um capítulo de livro passa fácil de 40 mil
// caracteres; acima disto o pedido fica lento e a reserva (Groq) recusa.
export const MAX_FONTE = 24_000;
export const MIN_FONTE = 80;

/** Tira HTML e espaços sobrando; devolve texto corrido com parágrafos. */
export function limparFonte(bruto: string): string {
  return bruto
    .replace(/<(script|style)[\s\S]*?<\/\1>/gi, " ")
    .replace(/<\/(p|div|h[1-6]|li|blockquote)>/gi, "\n\n")
    .replace(/<br\s*\/?>/gi, "\n")
    .replace(/<[^>]+>/g, " ")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&[a-z]+;/gi, " ")
    .replace(/[ \t]+/g, " ")
    .replace(/ *\n */g, "\n")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
}

/**
 * Corta a fonte no limite, sempre no fim de um parágrafo ou frase — cortar no
 * meio de uma frase faz a IA "completar" a ideia por conta própria.
 */
export function recortarFonte(
  texto: string,
  max = MAX_FONTE,
): { texto: string; cortado: boolean } {
  const limpo = limparFonte(texto);
  if (limpo.length <= max) return { texto: limpo, cortado: false };
  const janela = limpo.slice(0, max);
  const fimParagrafo = janela.lastIndexOf("\n\n");
  const fimFrase = Math.max(
    janela.lastIndexOf(". "),
    janela.lastIndexOf("? "),
    janela.lastIndexOf("! "),
  );
  const corte =
    fimParagrafo > max * 0.6 ? fimParagrafo : fimFrase > max * 0.6 ? fimFrase + 1 : max;
  return { texto: janela.slice(0, corte).trim(), cortado: true };
}

export function contarPalavras(texto: string): number {
  const t = texto.trim();
  return t ? t.split(/\s+/).length : 0;
}

/** Palavras FALADAS do roteiro (só a coluna "falar"). */
export function palavrasFaladas(roteiro: Pick<Roteiro, "blocos">): number {
  return roteiro.blocos.reduce((n, b) => n + contarPalavras(b.falar), 0);
}

/** Onde o roteiro está em relação ao que cabe na duração. */
export function situacaoDoTamanho(
  palavras: number,
  duracao: Duracao,
): "curto" | "ok" | "longo" {
  const { min, max } = PALAVRAS_POR_DURACAO[duracao];
  // Folga de 15%: ninguém fala no mesmo ritmo em todo vídeo.
  if (palavras < min * 0.85) return "curto";
  if (palavras > max * 1.15) return "longo";
  return "ok";
}

// ---------------------------------------------------------------------------
// Pedido à IA
// ---------------------------------------------------------------------------

export function systemRoteiro(duracao: Duracao, contextoPerfil: string): string {
  const { min, max } = PALAVRAS_POR_DURACAO[duracao];
  return `Você escreve roteiros de Reels para o Instagram de um ministério cristão de discipulado (Ekballo).
O pastor grava sozinho, olhando para a câmera. Seu roteiro precisa ser fácil de falar e fiel ao que foi ensinado.

FIDELIDADE (a regra que manda nas outras)
- Use SOMENTE as ideias que estão na FONTE enviada. Você encurta, reorganiza e dá ritmo de fala. Não acrescenta ideia, exemplo, versículo, promessa nem aplicação que a fonte não tenha.
- Não invente citação bíblica. Só cite referência que apareça na fonte, e exatamente como está lá.
- Em "base", copie de 2 a 4 trechos CURTOS da fonte (literais) que sustentam o que o roteiro diz.
- Se a fonte for curta demais para a duração pedida, entregue um roteiro mais curto. Não encha.

FORMA
- Duração: ${duracao} segundos, entre ${min} e ${max} palavras FALADAS no total (somando os "falar").
- Blocos, nesta ordem: um "gancho" (primeiros 3 segundos), de 1 a 4 blocos de "corpo", uma "chamada" final.
- "falar": texto para ser dito em voz alta. Frases curtas. Português do Brasil, do jeito que se fala. Sem "olá, pessoal", sem "neste vídeo".
- "tela": o texto que aparece escrito na tela naquele momento — no máximo 6 palavras. Pode ficar vazio.
- "mostrar": o que a câmera mostra — enquadramento, gesto, objeto, B-roll simples que um pastor consegue gravar (Bíblia aberta, mesa, caminhada). Uma linha.
- "tempo": a faixa em segundos, como "0–3s".
- "ganchos": 3 aberturas DIFERENTES para o mesmo roteiro, cada uma com até 12 palavras. Varie o tipo: uma pergunta que toca numa dor real; uma afirmação que contraria o que se costuma pensar; uma que mostra o resultado antes da explicação. A primeira é a que você usou no bloco "gancho".
- "chamada": UMA ação só (comentar, salvar ou enviar para alguém), ligada ao assunto. Sem "siga o perfil". NÃO prometa link, material, grupo nem resposta ("comente X que eu te mando…") a menos que a CHAMADA FINAL PREFERIDA do perfil diga isso: promessa que o pastor não combinou vira promessa não cumprida.
- "legenda": o texto do post — 2 a 4 frases calorosas, sem cara de anúncio, e de 3 a 5 hashtags no fim.
- "titulo": como o pastor vai achar este roteiro na lista (até 8 palavras).
- Tom de gente, não de coach: sem superlativo, sem "transforme sua vida", sem exclamação em série.
${contextoPerfil ? `\nQUEM ESTÁ FALANDO\n${contextoPerfil}\n` : ""}
Responda SOMENTE com JSON válido neste formato:
{"titulo":"...","ganchos":["...","...","..."],"blocos":[{"momento":"gancho","tempo":"0–3s","falar":"...","tela":"...","mostrar":"..."},{"momento":"corpo","tempo":"3–20s","falar":"...","tela":"...","mostrar":"..."},{"momento":"chamada","tempo":"25–30s","falar":"...","tela":"...","mostrar":"..."}],"legenda":"...","base":["trecho literal da fonte","..."]}`;
}

export function usuarioRoteiro(fonte: FonteRoteiro, foco?: string): string {
  const cabecalho = [
    `FONTE: ${fonte.titulo}`,
    fonte.autor ? `AUTOR: ${fonte.autor}` : "",
  ]
    .filter(Boolean)
    .join("\n");
  const pedido = foco?.trim()
    ? `\n\nO PASTOR QUER FALAR DISTO (dentro do que a fonte diz): ${foco.trim()}`
    : "\n\nEscolha a ideia mais forte da fonte para um vídeo curto.";
  return `${cabecalho}\n\nTEXTO DA FONTE:\n${fonte.texto}${pedido}`;
}

const MOMENTOS: MomentoRoteiro[] = ["gancho", "corpo", "chamada"];

function soJSON(bruto: string): unknown {
  const semCerca = bruto.replace(/```json/gi, "").replace(/```/g, "");
  const ini = semCerca.indexOf("{");
  const fim = semCerca.lastIndexOf("}");
  if (ini === -1 || fim <= ini)
    throw new Error("a IA não devolveu um roteiro legível — tente gerar de novo");
  return JSON.parse(semCerca.slice(ini, fim + 1));
}

function frase(v: unknown, max: number): string {
  return typeof v === "string" ? v.trim().slice(0, max) : "";
}

function lista(v: unknown, maxItens: number, maxChars: number): string[] {
  if (!Array.isArray(v)) return [];
  return v
    .filter((x): x is string => typeof x === "string")
    .map((x) => x.trim().slice(0, maxChars))
    .filter(Boolean)
    .slice(0, maxItens);
}

/** Limpa a resposta da IA; lança se não houver um roteiro aproveitável. */
export function normalizarRoteiro(bruto: string | unknown): Roteiro {
  const o = (typeof bruto === "string" ? soJSON(bruto) : bruto) as Record<
    string,
    unknown
  >;
  if (!o || typeof o !== "object") throw new Error("roteiro inválido");
  const blocos: BlocoRoteiro[] = (Array.isArray(o.blocos) ? o.blocos : [])
    .map((b) => {
      const x = (b || {}) as Record<string, unknown>;
      const momento = MOMENTOS.includes(x.momento as MomentoRoteiro)
        ? (x.momento as MomentoRoteiro)
        : "corpo";
      return {
        momento,
        tempo: frase(x.tempo, 20),
        falar: frase(x.falar, 1500),
        tela: frase(x.tela, 80),
        mostrar: frase(x.mostrar, 240),
      };
    })
    .filter((b) => b.falar)
    .slice(0, 8);

  if (!blocos.length)
    throw new Error("a IA não devolveu um roteiro legível — tente gerar de novo");

  const ganchos = lista(o.ganchos, 5, 160);
  const abertura = blocos.find((b) => b.momento === "gancho")?.falar;
  // A abertura em uso é sempre a primeira opção, mesmo que a IA tenha esquecido de listá-la.
  if (abertura && !ganchos.includes(abertura)) ganchos.unshift(abertura);

  return {
    titulo: frase(o.titulo, 120) || "Roteiro sem título",
    ganchos: ganchos.slice(0, 5),
    blocos,
    legenda: frase(o.legenda, 2200),
    base: lista(o.base, 5, 400),
  };
}

/** Troca a abertura do roteiro por outra opção (a escolhida vai para o bloco "gancho"). */
export function usarGancho(roteiro: Roteiro, gancho: string): Roteiro {
  const i = roteiro.blocos.findIndex((b) => b.momento === "gancho");
  if (i === -1) return roteiro;
  return {
    ...roteiro,
    blocos: roteiro.blocos.map((b, idx) => (idx === i ? { ...b, falar: gancho } : b)),
  };
}

/** O roteiro em texto corrido — para copiar ou mandar no WhatsApp. */
export function roteiroEmTexto(roteiro: Roteiro, duracao: Duracao): string {
  const linhas = [`${roteiro.titulo} (${duracao}s)`, ""];
  for (const b of roteiro.blocos) {
    linhas.push(`[${b.tempo || b.momento}] ${b.falar}`);
    if (b.tela) linhas.push(`   na tela: ${b.tela}`);
    if (b.mostrar) linhas.push(`   mostrar: ${b.mostrar}`);
    linhas.push("");
  }
  if (roteiro.legenda) linhas.push("LEGENDA", roteiro.legenda);
  return linhas.join("\n").trim();
}
