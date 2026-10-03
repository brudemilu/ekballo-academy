/**
 * Cortes de pregação — a IA aponta os melhores momentos de um vídeo longo
 * (issue #189, edição de vídeo, fase 1).
 *
 * O pastor cola o link do YouTube; o sistema transcreve o áudio com os tempos
 * e a IA escolhe os trechos que funcionam sozinhos como vídeo curto. Nesta
 * fase nada é cortado: sai a lista com início, fim, título, gancho e legenda,
 * e o corte é feito no editor que o pastor já usa.
 *
 * Aqui ficam as regras puras: como a transcrição vai para a IA, quais são os
 * critérios e como a resposta é conferida. Testado em testes/cortes.test.ts.
 *
 * A IA erra tempo com facilidade (inventa um minuto que não existe, devolve
 * um trecho de 4 segundos). Por isso nada do que ela devolve é usado sem
 * passar por `normalizarMomentos`, que prende cada trecho ao que a
 * transcrição realmente tem.
 */

import { lerJSONdaIA } from "@/lib/json-ia";

/** Um pedaço da transcrição, como o Whisper devolve. Tempos em segundos. */
export type Segmento = { i: number; f: number; t: string };

export type Momento = {
  /** Início e fim em segundos, já ajustados às fronteiras da transcrição. */
  inicio: number;
  fim: number;
  titulo: string;
  /** A frase que abre o corte — tem de prender em 3 segundos. */
  gancho: string;
  /** Por que este trecho funciona sozinho. */
  porque: string;
  /** Legenda pronta para o post. */
  legenda: string;
  /** 0 a 100: quão bem o trecho se sustenta fora do contexto. Serve para ordenar. */
  nota: number;
};

/** A análise de um vídeo, como fica guardada. */
export type CorteSalvo = {
  id: string;
  video_id: string;
  titulo: string;
  duracao_seg: number;
  status: "processando" | "pronto" | "erro";
  /** O que está sendo feito agora, para a tela mostrar. */
  etapa: string;
  erro: string | null;
  transcricao: Segmento[];
  momentos: Momento[];
  criado_em: string;
};

// Um trabalho que ficou "processando" além disto morreu junto com o servidor
// (deploy, reinício): a tela trata como falha em vez de girar para sempre.
export const PROCESSAMENTO_MAX_MS = 15 * 60 * 1000;

export function travado(
  c: Pick<CorteSalvo, "status" | "criado_em">,
  agora = Date.now(),
): boolean {
  return (
    c.status === "processando" &&
    agora - new Date(c.criado_em).getTime() > PROCESSAMENTO_MAX_MS
  );
}

export const DURACAO_MIN = 20;
export const DURACAO_MAX = 90;
export const MAX_MOMENTOS = 10;

/** "754" → "12:34"; passa de uma hora → "1:02:34". */
export function formatarTempo(segundos: number): string {
  const s = Math.max(0, Math.round(segundos));
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  const r = s % 60;
  const mm = h ? String(m).padStart(2, "0") : String(m);
  return `${h ? `${h}:` : ""}${mm}:${String(r).padStart(2, "0")}`;
}

/** Link do YouTube que abre o vídeo no ponto do corte. */
export function linkNoTempo(videoId: string, inicio: number): string {
  return `https://www.youtube.com/watch?v=${videoId}&t=${Math.max(0, Math.floor(inicio))}s`;
}

/** Limpa os segmentos do Whisper: descarta vazios e tempos tortos, ordena. */
export function limparSegmentos(brutos: unknown): Segmento[] {
  if (!Array.isArray(brutos)) return [];
  return brutos
    .map((s) => {
      const o = (s || {}) as Record<string, unknown>;
      return {
        i: Number(o.start ?? o.i),
        f: Number(o.end ?? o.f),
        t: typeof (o.text ?? o.t) === "string" ? String(o.text ?? o.t).trim() : "",
      };
    })
    .filter(
      (s) =>
        s.t && Number.isFinite(s.i) && Number.isFinite(s.f) && s.f > s.i && s.i >= 0,
    )
    .sort((a, b) => a.i - b.i);
}

/**
 * A transcrição no formato que vai para a IA: uma linha por segmento, com o
 * tempo de início em SEGUNDOS inteiros entre colchetes. Segundos (e não
 * mm:ss) porque a IA erra menos ao copiar um número do que ao converter.
 */
export function transcricaoParaIA(segmentos: Segmento[]): string {
  return segmentos.map((s) => `[${Math.floor(s.i)}] ${s.t}`).join("\n");
}

export function systemCortes(contextoPerfil: string): string {
  return `Você é editor de vídeo de um ministério cristão de discipulado (Ekballo).
Recebe a transcrição de uma pregação ou aula, com o tempo de início de cada trecho em SEGUNDOS entre colchetes.
Sua tarefa é achar os melhores momentos para virar vídeos curtos (Reels), de ${DURACAO_MIN} a ${DURACAO_MAX} segundos cada.

O QUE FAZ UM BOM CORTE
- Funciona SOZINHO: quem nunca viu a pregação entende do começo ao fim. Nada de "como eu disse antes" ou "voltando ao texto".
- Abre forte: a primeira frase prende em 3 segundos (uma pergunta, uma afirmação que surpreende, o começo de uma história).
- Tem começo, meio e fim: uma ilustração completa, um argumento que fecha, uma aplicação prática. Não corte no meio do raciocínio.
- Vale a pena: uma verdade bíblica dita com clareza, uma frase que a pessoa vai querer guardar ou mandar para alguém.
- Evite: avisos, saudações, leitura longa de texto sem comentário, piada que depende do ambiente, trecho que só faz sentido com o slide.

REGRAS
- Devolva de 5 a ${MAX_MOMENTOS} momentos (menos, se a pregação for curta ou não houver tantos bons). Qualidade antes de quantidade.
- "inicio" e "fim" são números em SEGUNDOS, copiados dos colchetes da transcrição. O início é o tempo do trecho onde o corte começa; o fim é o tempo do trecho SEGUINTE ao último que entra. Não invente tempo que não está na transcrição.
- Os momentos não se sobrepõem.
- "gancho": a frase que abre o corte, como foi dita (pode encurtar). "titulo": até 8 palavras, para o pastor achar o corte.
- "porque": uma frase dizendo por que funciona sozinho.
- "legenda": o texto do post — 2 a 3 frases calorosas, sem cara de anúncio, com 3 a 5 hashtags no fim. Use SOMENTE o que foi dito no trecho; não acrescente versículo nem ideia.
- "nota": de 0 a 100, quão bem o trecho se sustenta fora do contexto. Seja exigente: 90+ só para o que é excelente.
- Português do Brasil.
${contextoPerfil ? `\nQUEM ESTÁ FALANDO\n${contextoPerfil}\n` : ""}
Responda SOMENTE com JSON válido neste formato:
{"momentos":[{"inicio":120,"fim":175,"titulo":"...","gancho":"...","porque":"...","legenda":"...","nota":85}]}`;
}

function frase(v: unknown, max: number): string {
  return typeof v === "string" ? v.trim().slice(0, max) : "";
}

/**
 * Prende um tempo qualquer à fronteira de segmento mais próxima. `lado`
 * escolhe qual fronteira vale: o início dos segmentos (para o começo do
 * corte) ou o fim deles (para o término).
 */
function ajustar(tempo: number, segmentos: Segmento[], lado: "inicio" | "fim"): number {
  let melhor = lado === "inicio" ? segmentos[0].i : segmentos[segmentos.length - 1].f;
  let distancia = Number.POSITIVE_INFINITY;
  for (const s of segmentos) {
    const fronteira = lado === "inicio" ? s.i : s.f;
    const d = Math.abs(fronteira - tempo);
    if (d < distancia) {
      distancia = d;
      melhor = fronteira;
    }
  }
  return melhor;
}

/** O texto falado entre dois tempos — para o pastor ler antes de abrir o vídeo. */
export function trechoFalado(
  segmentos: Segmento[],
  inicio: number,
  fim: number,
): string {
  return segmentos
    .filter((s) => s.i >= inicio - 0.01 && s.f <= fim + 0.01)
    .map((s) => s.t)
    .join(" ");
}

/**
 * Confere e conserta o que a IA devolveu. Um momento só sobrevive se, depois
 * de preso às fronteiras da transcrição, tiver duração dentro do intervalo e
 * não se sobrepuser demais a outro melhor. Lança se não sobrar nenhum.
 */
export function normalizarMomentos(bruto: string, segmentos: Segmento[]): Momento[] {
  if (!segmentos.length) throw new Error("a transcrição veio vazia");
  const o = lerJSONdaIA(
    bruto,
    "a IA não devolveu uma lista de momentos legível — tente de novo",
  ) as { momentos?: unknown };
  const lista = Array.isArray(o.momentos) ? o.momentos : [];
  const total = segmentos[segmentos.length - 1].f;

  const candidatos: Momento[] = [];
  for (const m of lista) {
    const x = (m || {}) as Record<string, unknown>;
    const a = Number(x.inicio);
    const b = Number(x.fim);
    if (!Number.isFinite(a) || !Number.isFinite(b) || a < 0 || a >= total || b <= a)
      continue;

    const inicio = ajustar(a, segmentos, "inicio");
    let termino = ajustar(Math.min(b, total), segmentos, "fim");
    // Passou do teto: recua até a última fronteira que ainda cabe.
    if (termino - inicio > DURACAO_MAX) {
      const cabem = segmentos.filter(
        (s) => s.f > inicio && s.f - inicio <= DURACAO_MAX,
      );
      if (!cabem.length) continue;
      termino = cabem[cabem.length - 1].f;
    }
    if (termino - inicio < DURACAO_MIN) continue;

    const titulo = frase(x.titulo, 120);
    if (!titulo) continue;
    const nota = Number(x.nota);
    candidatos.push({
      inicio,
      fim: termino,
      titulo,
      gancho: frase(x.gancho, 300),
      porque: frase(x.porque, 400),
      legenda: frase(x.legenda, 2200),
      nota: Number.isFinite(nota) ? Math.max(0, Math.min(100, Math.round(nota))) : 50,
    });
  }

  // Do melhor para o pior, descartando quem repete mais da metade de um já aceito.
  const aceitos: Momento[] = [];
  for (const c of candidatos.sort((p, q) => q.nota - p.nota)) {
    const repete = aceitos.some((a) => {
      const sobreposicao = Math.min(a.fim, c.fim) - Math.max(a.inicio, c.inicio);
      return sobreposicao > 0.5 * Math.min(a.fim - a.inicio, c.fim - c.inicio);
    });
    if (!repete) aceitos.push(c);
    if (aceitos.length >= MAX_MOMENTOS) break;
  }

  if (!aceitos.length)
    throw new Error("a IA não achou um trecho que se sustente sozinho — tente de novo");
  return aceitos;
}

/** A nota da ideia no calendário, quando o pastor manda um corte para lá. */
export function notaDoCorte(m: Momento, tituloVideo: string, link: string): string {
  return [
    `Corte de ${formatarTempo(m.inicio)} a ${formatarTempo(m.fim)} (${Math.round(m.fim - m.inicio)}s) — ${tituloVideo}`,
    link,
    m.gancho ? `Abre com: ${m.gancho}` : "",
    m.legenda ? `\nLegenda:\n${m.legenda}` : "",
  ]
    .filter(Boolean)
    .join("\n");
}
