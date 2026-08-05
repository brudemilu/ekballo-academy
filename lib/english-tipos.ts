// =============================================================
// EKBALLO ENGLISH · Tipos e correção (puro, sem servidor)
//
// Vive separado de lib/english.ts porque o player da lição é um
// client component — e lib/english.ts importa o cliente Supabase
// de servidor (next/headers), que não pode cruzar essa fronteira.
// =============================================================

export type EnglishNivel = "iniciante" | "basico" | "intermediario";

export type EnglishModulo = {
  id: string;
  numero: number;
  slug: string;
  titulo: string;
  titulo_en: string | null;
  descricao: string | null;
  nivel: EnglishNivel;
  publicado: boolean;
};

export type EnglishLicao = {
  id: string;
  modulo_id: string;
  numero: number;
  slug: string;
  titulo: string;
  titulo_pt: string | null;
  objetivo: string | null;
  versiculo_ref: string | null;
  versiculo_en: string | null;
  versiculo_pt: string | null;
  publicado: boolean;
};

export type EnglishTipoExercicio =
  | "vocabulario"
  | "escolha"
  | "traducao"
  | "ouvir"
  | "montar"
  | "falar"
  | "imagem";

/**
 * `imagem` só é preenchida no exercício "escolha a imagem". Nesse tipo o
 * `texto` NÃO vai pra tela — serve pra devolutiva e pra correção. Mostrar a
 * palavra escrita ao lado da figura entregaria a resposta.
 */
export type EnglishAlternativa = { texto: string; correta: boolean; imagem?: string | null };

export type EnglishExercicio = {
  id: string;
  licao_id: string;
  ordem: number;
  tipo: EnglishTipoExercicio;
  enunciado: string;
  pergunta: string | null;
  pergunta_pt: string | null;
  resposta: string | null;
  aceitas: string[];
  alternativas: EnglishAlternativa[];
  dica: string | null;
  audio_texto: string | null;
  imagem_url: string | null;
};

export type EnglishProgresso = {
  licao_id: string;
  acertos: number;
  total: number;
  vezes: number;
  concluido_em: string;
};

export type EnglishStreak = {
  dias_seguidos: number;
  recorde: number;
  ultimo_dia: string | null;
  total_licoes: number;
};

/** Módulo com as lições e o progresso do aluno já cruzados. */
export type EnglishModuloComLicoes = EnglishModulo & {
  licoes: (EnglishLicao & { concluida: boolean; acertos: number; total: number })[];
  concluidas: number;
};

// ---------------- Conquistas ----------------
// Chave → rótulo. A regra de quando cada uma cai está em
// app/api/english/concluir/route.ts (único lugar que grava).

export const ENGLISH_CONQUISTAS: Record<string, { nome: string; emoji: string; descricao: string }> = {
  "primeira-licao": { nome: "First step", emoji: "👣", descricao: "Concluiu a primeira lição." },
  "streak-3": { nome: "Three in a row", emoji: "🔥", descricao: "Três dias seguidos de prática." },
  "streak-7": { nome: "One week", emoji: "🗓️", descricao: "Sete dias seguidos de prática." },
  "streak-30": { nome: "One month", emoji: "🏆", descricao: "Trinta dias seguidos de prática." },
  "licao-perfeita": { nome: "Perfect", emoji: "💯", descricao: "Uma lição inteira sem errar." },
  "modulo-1": { nome: "First steps", emoji: "🎓", descricao: "Concluiu o Módulo 1 inteiro." },
};

export function nomeConquista(chave: string) {
  return ENGLISH_CONQUISTAS[chave] ?? { nome: chave, emoji: "⭐", descricao: "Conquista desbloqueada." };
}

// ---------------- Correção ----------------

/** Normaliza pra comparar resposta: sem acento, sem pontuação, caixa baixa. */
export function normalizarResposta(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/['’`]/g, "")
    .replace(/[^a-z0-9\s]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

/** Contrações que o aluno pode digitar no lugar da forma cheia (e vice-versa). */
const EQUIVALENTES: [RegExp, string][] = [
  [/\bim\b/g, "i am"],
  [/\bive\b/g, "i have"],
  [/\bits\b/g, "it is"],
  [/\bwhats\b/g, "what is"],
  [/\bhows\b/g, "how is"],
  [/\bwheres\b/g, "where is"],
  [/\blets\b/g, "let us"],
  [/\byoure\b/g, "you are"],
  [/\bdont\b/g, "do not"],
];

function expandir(texto: string): string {
  return EQUIVALENTES.reduce((t, [re, cheio]) => t.replace(re, cheio), texto);
}

/** true se a resposta do aluno bate com a esperada (ou com uma variante aceita). */
export function respostaCorreta(
  digitado: string,
  esperado: string | null,
  aceitas: string[] = [],
): boolean {
  if (!esperado) return false;
  const aluno = expandir(normalizarResposta(digitado));
  const alvos = [esperado, ...aceitas].map((a) => expandir(normalizarResposta(a)));
  return alvos.some((alvo) => alvo.length > 0 && alvo === aluno);
}

/**
 * Embaralhamento determinístico a partir de uma semente (o id do exercício).
 * Precisa ser estável entre servidor e cliente, senão a hidratação quebra.
 */
export function embaralharComSemente<T>(itens: T[], semente: string): T[] {
  let h = 2166136261;
  for (let i = 0; i < semente.length; i++) {
    h ^= semente.charCodeAt(i);
    h = Math.imul(h, 16777619);
  }
  const rand = () => {
    h = Math.imul(h ^ (h >>> 15), 2246822507);
    h = Math.imul(h ^ (h >>> 13), 3266489909);
    return ((h ^= h >>> 16) >>> 0) / 4294967296;
  };
  const arr = [...itens];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(rand() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}
