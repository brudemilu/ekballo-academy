// Faixa de recém-chegados (issue #157).
//
// A regra é uma promessa simples: todo livro que entra fica em destaque por uma
// semana inteira, contada a partir da entrada DELE, e sai sozinho. Não há
// curadoria nem botão de administrar — o critério é a data de carga do livro
// (`cursos.created_at`), que no banco marca fielmente quando ele foi subido.

export const DIAS_EM_DESTAQUE = 7;

const UM_DIA = 24 * 60 * 60 * 1000;

// Quanto tempo faz que o livro entrou. Livro sem data (ou com data ilegível)
// não é novidade: devolve Infinity e cai fora da janela por si.
function idadeEmMs(criadoEm: string | null | undefined, agora: number): number {
  if (!criadoEm) return Number.POSITIVE_INFINITY;
  const t = Date.parse(criadoEm);
  return Number.isNaN(t) ? Number.POSITIVE_INFINITY : agora - t;
}

// Os livros que entraram dentro da janela, do mais novo pro mais antigo.
//
// De propósito NÃO há teto de quantidade: se uma leva de trinta livros entrar
// hoje, ela não pode empurrar pra fora um livro de anteontem que ainda não
// completou a semana dele. "Pelo menos uma semana" é promessa, não sobra de
// espaço na tela.
export function livrosRecentes<T extends { created_at?: string | null }>(
  livros: T[],
  agora: number = Date.now(),
): T[] {
  const janela = DIAS_EM_DESTAQUE * UM_DIA;
  return livros
    .filter((livro) => idadeEmMs(livro.created_at, agora) < janela)
    .sort((a, b) => idadeEmMs(a.created_at, agora) - idadeEmMs(b.created_at, agora));
}

// Número do dia no calendário de São Paulo — é por ele que "ontem" é ontem.
// Contar 24h corridas diria "hoje" pra um livro que entrou às 23h de ontem.
function diaNoCalendario(ms: number): number {
  const partes = new Intl.DateTimeFormat("en-CA", {
    timeZone: "America/Sao_Paulo",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).format(new Date(ms));
  const [ano, mes, dia] = partes.split("-").map(Number);
  return Date.UTC(ano, mes - 1, dia) / UM_DIA;
}

// "chegou hoje" · "chegou ontem" · "há 3 dias"
export function rotuloDeChegada(
  criadoEm: string | null | undefined,
  agora: number = Date.now(),
): string {
  if (!criadoEm) return "";
  const t = Date.parse(criadoEm);
  if (Number.isNaN(t)) return "";
  const dias = diaNoCalendario(agora) - diaNoCalendario(t);
  if (dias <= 0) return "chegou hoje";
  if (dias === 1) return "chegou ontem";
  return `há ${dias} dias`;
}
