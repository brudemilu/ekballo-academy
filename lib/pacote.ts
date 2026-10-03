/**
 * Pacote da semana do copiloto de conteúdo — issue #189.
 *
 * De UMA fonte (mesa, devocional, texto do pastor) saem três peças que se
 * conversam: um carrossel, um roteiro de Reel e um story com pergunta. É o
 * padrão das ferramentas de igreja que funcionam (SermonSpark, Ide.On): a
 * unidade de trabalho é a semana, não o post solto.
 *
 * Aqui ficam as regras puras do carrossel e do story (o roteiro tem as suas
 * em lib/roteiro.ts) e a sugestão de dias. Testado em testes/pacote.test.ts.
 */

import { somarDias } from "@/lib/conteudo-calendario";
import { lerJSONdaIA } from "@/lib/json-ia";
import type { FonteRoteiro } from "@/lib/roteiro";

export type SlidePacote = {
  /** Frase curta do slide; a palavra mais forte vem entre {chaves}. */
  texto: string;
  /** Descrição em inglês da foto de fundo. */
  prompt: string;
  modo: "circulo" | "grifo" | "marca" | "dourado";
};

export type StoryPacote = {
  /** Uma frase que prepara a pergunta. */
  texto: string;
  /** A pergunta da caixinha ou da enquete. */
  pergunta: string;
  /** Duas opções quando for enquete; vazio quando for caixinha aberta. */
  opcoes: string[];
};

export type PecasPacote = {
  /** O fio que liga as três peças, em uma frase. */
  tema: string;
  carrossel: { slides: SlidePacote[]; legenda: string };
  story: StoryPacote;
};

export type DiasPacote = { carrossel: string; reel: string; story: string };

const MODOS: SlidePacote["modo"][] = ["circulo", "grifo", "marca", "dourado"];
const RE_DIA = /^\d{4}-\d{2}-\d{2}$/;

/**
 * Três dias para as peças: os próximos segunda, quarta e sexta a partir de
 * amanhã. Nunca sugere hoje — o pacote precisa de tempo para ser revisado.
 */
export function diasSugeridos(hoje: string): DiasPacote {
  const proximo = (alvo: number, aPartirDe: string) => {
    for (let i = 0; i < 7; i++) {
      const dia = somarDias(aPartirDe, i);
      const [a, m, d] = dia.split("-").map(Number);
      if (new Date(Date.UTC(a, m - 1, d)).getUTCDay() === alvo) return dia;
    }
    return aPartirDe;
  };
  const carrossel = proximo(1, somarDias(hoje, 1)); // segunda
  const reel = proximo(3, carrossel); // a quarta seguinte
  const story = proximo(5, reel); // a sexta seguinte
  return { carrossel, reel, story };
}

/** Confere os três dias vindos da tela; devolve a mensagem de erro se algo estiver errado. */
export function validarDias(v: unknown): DiasPacote | string {
  const o = (v || {}) as Record<string, unknown>;
  const dias = {} as DiasPacote;
  for (const chave of ["carrossel", "reel", "story"] as const) {
    const d = o[chave];
    if (typeof d !== "string" || !RE_DIA.test(d) || somarDias(d, 0) !== d) {
      return "Escolha o dia de cada peça.";
    }
    dias[chave] = d;
  }
  return dias;
}

export function systemPacote(contextoPerfil: string): string {
  return `Você prepara o conteúdo da semana do Instagram de um ministério cristão de discipulado (Ekballo).
De UMA fonte você monta duas peças que se conversam: um CARROSSEL e um STORY com pergunta. (O roteiro do vídeo é feito à parte, da mesma fonte.)

FIDELIDADE (a regra que manda nas outras)
- Use SOMENTE as ideias que estão na FONTE. Você encurta e reorganiza; não acrescenta ideia, versículo, promessa nem aplicação que a fonte não tenha.
- Não invente citação bíblica. Só cite referência que apareça na fonte.

"tema": uma frase dizendo qual é o fio da semana — a ideia da fonte que liga as peças.

CARROSSEL
- De 4 a 7 slides. O primeiro prende; os do meio desenvolvem UMA ideia cada; o último fecha com um convite simples.
- "texto": frase MUITO curta (3 a 8 palavras), em português do Brasil. Envolva a ÚNICA palavra mais forte entre chaves {}, ex.: "Pense menos em {você}".
- "prompt": descrição EM INGLÊS de uma foto cinematográfica que represente o sentido do slide (objetos, luz, cenas). Sem texto na imagem, sem rostos.
- "modo": "circulo", "grifo", "marca" ou "dourado". Varie.
- "legenda": o texto do post — pessoal e caloroso, sem cara de anúncio, com 3 a 5 hashtags no fim.

STORY
- "texto": uma frase curta que prepara a pergunta.
- "pergunta": uma pergunta honesta que a pessoa consegue responder em uma linha, ligada ao tema. Nada de pergunta retórica.
- "opcoes": DUAS opções curtas se fizer sentido como enquete; lista vazia se for melhor uma caixinha aberta.

Tom de gente, não de coach: sem superlativo, sem "transforme sua vida".
${contextoPerfil ? `\nQUEM ESTÁ FALANDO\n${contextoPerfil}\n` : ""}
Responda SOMENTE com JSON válido neste formato:
{"tema":"...","carrossel":{"slides":[{"texto":"...","prompt":"...","modo":"..."}],"legenda":"..."},"story":{"texto":"...","pergunta":"...","opcoes":["...","..."]}}`;
}

export function usuarioPacote(fonte: FonteRoteiro, foco?: string): string {
  const cabecalho = [
    `FONTE: ${fonte.titulo}`,
    fonte.autor ? `AUTOR: ${fonte.autor}` : "",
  ]
    .filter(Boolean)
    .join("\n");
  const pedido = foco?.trim()
    ? `\n\nO PASTOR QUER FALAR DISTO (dentro do que a fonte diz): ${foco.trim()}`
    : "\n\nEscolha a ideia mais forte da fonte para a semana.";
  return `${cabecalho}\n\nTEXTO DA FONTE:\n${fonte.texto}${pedido}`;
}

function frase(v: unknown, max: number): string {
  return typeof v === "string" ? v.trim().slice(0, max) : "";
}

/** Limpa a resposta da IA; lança se o carrossel não tiver slides aproveitáveis. */
export function normalizarPacote(bruto: string): PecasPacote {
  const o = lerJSONdaIA(
    bruto,
    "a IA não devolveu um pacote legível — tente de novo",
  ) as Record<string, unknown>;

  const c = (o.carrossel || {}) as Record<string, unknown>;
  const slides: SlidePacote[] = (Array.isArray(c.slides) ? c.slides : [])
    .map((s) => {
      const x = (s || {}) as Record<string, unknown>;
      return {
        texto: frase(x.texto, 120),
        prompt: frase(x.prompt, 400),
        modo: MODOS.includes(x.modo as SlidePacote["modo"])
          ? (x.modo as SlidePacote["modo"])
          : "circulo",
      };
    })
    .filter((s) => s.texto)
    .slice(0, 8);
  if (slides.length < 2)
    throw new Error("a IA não devolveu um carrossel aproveitável — tente de novo");

  const s = (o.story || {}) as Record<string, unknown>;
  const opcoes = (Array.isArray(s.opcoes) ? s.opcoes : [])
    .filter((x): x is string => typeof x === "string")
    .map((x) => x.trim().slice(0, 40))
    .filter(Boolean);

  return {
    tema: frase(o.tema, 300),
    carrossel: { slides, legenda: frase(c.legenda, 2200) },
    story: {
      texto: frase(s.texto, 200),
      pergunta: frase(s.pergunta, 200),
      // Enquete tem exatamente duas opções; qualquer outra coisa vira caixinha aberta.
      opcoes: opcoes.length === 2 ? opcoes : [],
    },
  };
}

/** O story em texto, do jeito que vai para a nota da ideia no calendário. */
export function storyEmTexto(story: StoryPacote): string {
  return [
    story.texto,
    story.pergunta ? `Pergunta: ${story.pergunta}` : "",
    story.opcoes.length
      ? `Enquete: ${story.opcoes.join(" / ")}`
      : story.pergunta
        ? "Caixinha aberta"
        : "",
  ]
    .filter(Boolean)
    .join("\n");
}
