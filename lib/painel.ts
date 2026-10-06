/**
 * Painel do Instagram do ministério — issue #189.
 *
 * Tudo aqui é CONTA, não opinião: os números vêm dos posts do próprio perfil
 * e as ações do dia saem de regras fixas sobre o que está no calendário. A IA
 * não participa — um painel que "acha" coisas perde a confiança no primeiro
 * número que não bate. Testado em testes/painel.test.ts.
 *
 * Duas escolhas que valem explicar:
 *
 * - Post "fora da curva" é medido contra a MEDIANA do próprio perfil, não
 *   contra números absolutos. Num perfil pequeno, 40 interações podem ser um
 *   resultado enorme; a pergunta útil é "o que foi diferente do meu normal?".
 * - Com poucos posts o painel prefere dizer "ainda não dá para comparar" a
 *   mostrar +300% em cima de um post só.
 */

import { proximasDatas } from "@/lib/calendario-cristao";
import { diaSP, inicioDaSemana, somarDias } from "@/lib/conteudo-calendario";

export const JANELA_DIAS = 90;

export type PostPainel = {
  id: string;
  caption: string;
  /** IMAGE | VIDEO | CAROUSEL_ALBUM */
  mediaType: string;
  /** ISO 8601 */
  timestamp: string;
  likes: number;
  comments: number;
  reach: number | null;
  permalink: string;
  interacoes: number;
  /** Sinais de crescimento (lib/crescimento.ts). Ausentes quando o Instagram não informa. */
  salvos?: number | null;
  compartilhamentos?: number | null;
  /** Quem passou a seguir a partir deste post. Só vem para feed, não para Reel. */
  seguiu?: number | null;
  visitasPerfil?: number | null;
  /** É Reel? (o `mediaType` diz só "VIDEO") */
  reel?: boolean;
};

const FORMATO: Record<string, string> = {
  IMAGE: "Imagem única",
  VIDEO: "Reel",
  CAROUSEL_ALBUM: "Carrossel",
};

export function nomeDoFormato(mediaType: string): string {
  return FORMATO[mediaType] || "Imagem única";
}

function mediana(valores: number[]): number {
  if (!valores.length) return 0;
  const v = [...valores].sort((a, b) => a - b);
  const meio = Math.floor(v.length / 2);
  return v.length % 2 ? v[meio] : (v[meio - 1] + v[meio]) / 2;
}

function media(valores: number[]): number {
  return valores.length ? valores.reduce((s, x) => s + x, 0) / valores.length : 0;
}

/** Só os posts dos últimos `dias` dias, contados em dias de calendário de SP. */
export function postsNaJanela(
  posts: PostPainel[],
  hoje: string,
  dias = JANELA_DIAS,
): PostPainel[] {
  const desde = somarDias(hoje, -(dias - 1));
  return posts.filter((p) => {
    if (!p.timestamp) return false;
    const dia = diaSP(p.timestamp);
    return dia >= desde && dia <= hoje;
  });
}

export type Indicador = {
  rotulo: string;
  valor: number | null;
  /** Variação em % contra a metade anterior da janela; null = sem base para comparar. */
  variacao: number | null;
};

// Abaixo disto, uma variação percentual é ruído: com dois posts de base, um
// único resultado bom vira "+370%".
const MIN_PARA_COMPARAR = 3;

function variacao(
  atual: number,
  anterior: number,
  nAtual: number,
  nAnterior: number,
): number | null {
  if (nAtual < MIN_PARA_COMPARAR || nAnterior < MIN_PARA_COMPARAR || anterior === 0)
    return null;
  return Math.round(((atual - anterior) / anterior) * 100);
}

/**
 * Os quatro números do topo, comparando a metade recente da janela com a
 * anterior (45 dias × 45 dias).
 */
export function indicadores(posts: PostPainel[], hoje: string): Indicador[] {
  const metade = Math.floor(JANELA_DIAS / 2);
  const corte = somarDias(hoje, -(metade - 1));
  const naJanela = postsNaJanela(posts, hoje);
  const recentes = naJanela.filter((p) => diaSP(p.timestamp) >= corte);
  const anteriores = naJanela.filter((p) => diaSP(p.timestamp) < corte);

  const interacoes = (l: PostPainel[]) => l.reduce((s, p) => s + p.interacoes, 0);
  const alcances = (l: PostPainel[]) =>
    l.map((p) => p.reach).filter((r): r is number => typeof r === "number");
  const temAlcance = alcances(naJanela).length > 0;

  return [
    {
      rotulo: "Posts publicados",
      valor: naJanela.length,
      variacao: variacao(
        recentes.length,
        anteriores.length,
        recentes.length,
        anteriores.length,
      ),
    },
    {
      rotulo: "Interações",
      valor: interacoes(naJanela),
      variacao: variacao(
        interacoes(recentes),
        interacoes(anteriores),
        recentes.length,
        anteriores.length,
      ),
    },
    {
      rotulo: "Interações por post",
      valor: naJanela.length
        ? Math.round(media(naJanela.map((p) => p.interacoes)))
        : null,
      variacao: variacao(
        media(recentes.map((p) => p.interacoes)),
        media(anteriores.map((p) => p.interacoes)),
        recentes.length,
        anteriores.length,
      ),
    },
    {
      rotulo: "Alcance por post",
      valor: temAlcance ? Math.round(media(alcances(naJanela))) : null,
      variacao: temAlcance
        ? variacao(
            media(alcances(recentes)),
            media(alcances(anteriores)),
            alcances(recentes).length,
            alcances(anteriores).length,
          )
        : null,
    },
  ];
}

export type SemanaConstancia = { segunda: string; posts: number };

/** Posts por semana (segunda a domingo) nas últimas `semanas` semanas, da mais antiga à atual. */
export function constancia(
  posts: PostPainel[],
  hoje: string,
  semanas = 12,
): SemanaConstancia[] {
  const atual = inicioDaSemana(hoje);
  const contagem = new Map<string, number>();
  for (const p of posts) {
    if (!p.timestamp) continue;
    const seg = inicioDaSemana(diaSP(p.timestamp));
    contagem.set(seg, (contagem.get(seg) || 0) + 1);
  }
  return Array.from({ length: semanas }, (_, i) => {
    const segunda = somarDias(atual, -7 * (semanas - 1 - i));
    return { segunda, posts: contagem.get(segunda) || 0 };
  });
}

export type Destaque = {
  post: PostPainel;
  /** Quantas vezes a mediana do perfil (ex.: 2.4). */
  vezes: number;
  /** Fatos que diferenciam este post do normal do perfil. */
  porque: string[];
};

const DIAS = ["domingo", "segunda", "terça", "quarta", "quinta", "sexta", "sábado"];

function diaDaSemanaSP(iso: string): string {
  const [a, m, d] = diaSP(iso).split("-").map(Number);
  return DIAS[new Date(Date.UTC(a, m - 1, d)).getUTCDay()];
}

function horaSP(iso: string): number {
  const h = new Intl.DateTimeFormat("pt-BR", {
    timeZone: "America/Sao_Paulo",
    hour: "2-digit",
    hour12: false,
  }).format(new Date(iso));
  return Number.parseInt(h, 10) % 24;
}

function turno(hora: number): string {
  if (hora < 6) return "de madrugada";
  if (hora < 12) return "de manhã";
  if (hora < 18) return "à tarde";
  return "à noite";
}

// Precisa de base para existir "o normal do perfil".
const MIN_PARA_DESTAQUE = 4;
const FATOR_DESTAQUE = 1.5;

/**
 * Posts que passaram de 1,5× a mediana de interações do próprio perfil, com
 * os fatos que os diferenciam. São FATOS observáveis (formato, dia, turno,
 * tamanho da legenda, pergunta na legenda), não uma explicação causal — com
 * poucos posts ninguém sabe a causa, e o painel não finge saber.
 */
export function destaques(posts: PostPainel[], hoje: string, max = 3): Destaque[] {
  const naJanela = postsNaJanela(posts, hoje);
  if (naJanela.length < MIN_PARA_DESTAQUE) return [];
  const base = mediana(naJanela.map((p) => p.interacoes));
  if (base <= 0) return [];

  const formatoComum = moda(naJanela.map((p) => p.mediaType));
  const legendaTipica = mediana(naJanela.map((p) => p.caption.length));

  return naJanela
    .filter((p) => p.interacoes >= base * FATOR_DESTAQUE)
    .sort((a, b) => b.interacoes - a.interacoes)
    .slice(0, max)
    .map((post) => {
      const porque: string[] = [];
      porque.push(
        post.mediaType === formatoComum
          ? `${nomeDoFormato(post.mediaType)}, o formato que você mais usa`
          : `${nomeDoFormato(post.mediaType)}, formato que você usa pouco`,
      );
      porque.push(
        `Saiu ${diaDaSemanaSP(post.timestamp)} ${turno(horaSP(post.timestamp))}`,
      );
      if (legendaTipica > 0) {
        if (post.caption.length <= legendaTipica * 0.6)
          porque.push("Legenda bem mais curta que o seu normal");
        else if (post.caption.length >= legendaTipica * 1.6)
          porque.push("Legenda bem mais longa que o seu normal");
      }
      if (post.caption.includes("?")) porque.push("A legenda faz uma pergunta");
      if (post.comments > 0 && post.comments >= post.likes * 0.25) {
        porque.push("Gerou conversa: muitos comentários em relação às curtidas");
      }
      return { post, vezes: Math.round((post.interacoes / base) * 10) / 10, porque };
    });
}

function moda<T>(valores: T[]): T | undefined {
  const n = new Map<T, number>();
  for (const v of valores) n.set(v, (n.get(v) || 0) + 1);
  let melhor: T | undefined;
  let max = 0;
  for (const [v, c] of n) {
    if (c > max) {
      max = c;
      melhor = v;
    }
  }
  return melhor;
}

// ---------------------------------------------------------------------------
// Ações do dia
// ---------------------------------------------------------------------------

export type Acao = {
  /** Identificador estável da regra — a tela usa como chave. */
  chave: string;
  titulo: string;
  detalhe: string;
  href: string;
  rotulo: string;
};

export type EstadoDoCopiloto = {
  hoje: string;
  /** Posts do Instagram (para saber há quanto tempo não sai nada). */
  posts: PostPainel[];
  /** Posts salvos na plataforma. */
  salvos: { id: string; status: string }[];
  ideias: {
    titulo: string;
    formato: string;
    data_planejada: string | null;
    carrossel_id: string | null;
    roteiro_id?: string | null;
  }[];
  perfil: { feitos: number; total: number };
};

function diasEntre(de: string, ate: string): number {
  const [a1, m1, d1] = de.split("-").map(Number);
  const [a2, m2, d2] = ate.split("-").map(Number);
  return Math.round((Date.UTC(a2, m2 - 1, d2) - Date.UTC(a1, m1 - 1, d1)) / 86_400_000);
}

/** Com quantos dias de antecedência uma data do calendário cristão vira ação. */
export const ANTECEDENCIA_DATA_DIAS = 10;

/**
 * As até três coisas a fazer hoje, da mais urgente à menos. Regras fixas, na
 * ordem: o que está quebrado → o que vence hoje ou amanhã → data do calendário
 * cristão chegando → o que falta para a semana → o que melhora o copiloto.
 */
export function acoesDoDia(e: EstadoDoCopiloto, max = 3): Acao[] {
  const acoes: Acao[] = [];
  const amanha = somarDias(e.hoje, 1);

  const comErro = e.salvos.filter((p) => p.status === "erro").length;
  if (comErro) {
    acoes.push({
      chave: "erro",
      titulo:
        comErro === 1
          ? "Um post não foi publicado"
          : `${comErro} posts não foram publicados`,
      detalhe:
        "O Instagram recusou a publicação. Abra, veja o motivo e agende de novo.",
      href: "/admin/instagram?aba=criar#posts",
      rotulo: "Ver o que falhou",
    });
  }

  const vencendo = e.ideias.filter(
    (i) => i.data_planejada && i.data_planejada <= amanha,
  );
  const status = new Map(e.salvos.map((p) => [p.id, p.status]));

  const rascunho = vencendo.find(
    (i) => i.carrossel_id && status.get(i.carrossel_id) === "rascunho",
  );
  if (rascunho) {
    acoes.push({
      chave: "agendar",
      titulo: `Revisar e agendar: ${rascunho.titulo}`,
      detalhe: `O carrossel está pronto como rascunho e o dia dele é ${quando(rascunho.data_planejada, e.hoje)}.`,
      href: "/admin/instagram?aba=criar#posts",
      rotulo: "Abrir o rascunho",
    });
  }

  const roteiro = vencendo.find((i) => i.roteiro_id);
  if (roteiro) {
    acoes.push({
      chave: "gravar",
      titulo: `Gravar o Reel: ${roteiro.titulo}`,
      detalhe: `O roteiro está pronto e o dia dele é ${quando(roteiro.data_planejada, e.hoje)}. Use o teleprompter.`,
      href: `/admin/instagram?aba=roteiros&roteiro=${roteiro.roteiro_id}`,
      rotulo: "Abrir o roteiro",
    });
  }

  const story = vencendo.find((i) => i.formato === "story" && !i.carrossel_id);
  if (story) {
    acoes.push({
      chave: "story",
      titulo: `Postar o story: ${story.titulo}`,
      detalhe: `Está no calendário para ${quando(story.data_planejada, e.hoje)}.`,
      href: "/admin/instagram?aba=calendario",
      rotulo: "Ver no calendário",
    });
  }

  // Data do calendário cristão chegando sem nada planejado para o dia. Só a
  // mais próxima: uma lista de datas viraria ruído.
  const data = proximasDatas(e.hoje, ANTECEDENCIA_DATA_DIAS).find(
    (d) => !e.ideias.some((i) => i.data_planejada === d.dia),
  );
  if (data) {
    acoes.push({
      chave: "data",
      titulo: `${data.nome} é ${quando(data.dia, e.hoje)}`,
      detalhe: `Não há nada no calendário para o dia. Um ponto de partida: ${data.angulo}`,
      href: `/admin/instagram?aba=calendario&semana=${data.dia}`,
      rotulo: "Planejar no calendário",
    });
  }

  // Semana vazia: nada planejado daqui até domingo.
  const fimDaSemana = somarDias(inicioDaSemana(e.hoje), 6);
  const planejadoNaSemana = e.ideias.some(
    (i) =>
      i.data_planejada && i.data_planejada >= e.hoje && i.data_planejada <= fimDaSemana,
  );
  const agendado = e.salvos.some((p) => p.status === "agendado");
  if (!planejadoNaSemana && !agendado) {
    acoes.push({
      chave: "semana",
      titulo: "A semana está sem conteúdo planejado",
      detalhe:
        "De uma mesa ou devocional saem um carrossel, um roteiro de Reel e um story, já no calendário.",
      href: "/admin/instagram?aba=calendario",
      rotulo: "Montar a semana",
    });
  }

  const ultimo = e.posts
    .map((p) => (p.timestamp ? diaSP(p.timestamp) : ""))
    .filter(Boolean)
    .sort()
    .pop();
  if (ultimo) {
    const parado = diasEntre(ultimo, e.hoje);
    if (parado >= 7) {
      acoes.push({
        chave: "parado",
        titulo: `Faz ${parado} dias que o perfil não posta`,
        detalhe:
          "Quem acompanha esfria rápido. Um post simples hoje vale mais que um perfeito no mês que vem.",
        href: "/admin/instagram?aba=criar",
        rotulo: "Criar um post",
      });
    }
  }

  if (e.perfil.feitos < e.perfil.total) {
    acoes.push({
      chave: "perfil",
      titulo: "Ensine o copiloto a escrever como você",
      detalhe: `O perfil está ${e.perfil.feitos} de ${e.perfil.total}. Com a sua voz e as referências, os roteiros saem menos genéricos.`,
      href: "/admin/instagram?aba=perfil",
      rotulo: "Completar o perfil",
    });
  }

  return acoes.slice(0, max);
}

function quando(dia: string | null, hoje: string): string {
  if (!dia) return "sem data";
  const d = diasEntre(hoje, dia);
  if (d === 0) return "hoje";
  if (d === 1) return "amanhã";
  if (d === -1) return "ontem";
  return d < 0 ? `há ${-d} dias` : `daqui a ${d} dias`;
}
