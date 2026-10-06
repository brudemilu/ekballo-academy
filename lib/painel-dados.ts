/**
 * Dados do painel do Instagram: os posts do perfil com métricas e os números
 * da conta. Fica separado de lib/painel.ts (que é só conta) porque aqui tem
 * rede, cache e modo demonstração — issue #189.
 */
import {
  instagramLeituraConfigurada,
  listarPostsComMetricas,
} from "@/lib/instagram-insights";
import { isMockMode } from "@/lib/mock-data";
import type { PostPainel } from "@/lib/painel";

const GRAPH = process.env.META_GRAPH_BASE || "https://graph.instagram.com/v21.0";

export type ContaInstagram = {
  usuario: string;
  seguidores: number | null;
  publicacoes: number | null;
  /** Últimos 30 dias, da conta inteira; null quando o Instagram não informa. */
  alcance30?: number | null;
  visitasPerfil30?: number | null;
  /** Saldo de quem passou a seguir menos quem deixou de seguir. */
  seguidoresNovos30?: number | null;
};

export type DadosPainel = {
  /** false = o Instagram não está conectado (faltam as variáveis do token). */
  conectado: boolean;
  posts: PostPainel[];
  conta: ContaInstagram | null;
  /** Mensagem para a tela quando a leitura falhou (token vencido, escopo faltando). */
  erro: string | null;
  /** Quando os dados foram lidos (ISO). */
  lidoEm: string;
};

// O painel é aberto várias vezes seguidas e cada leitura custa uma chamada por
// post (o alcance vem de um endpoint por mídia). Dez minutos é fresco o
// bastante para números que mudam ao longo de dias.
const VALIDADE_MS = 10 * 60 * 1000;
let cache: { em: number; dados: DadosPainel } | null = null;

/** Quantos posts ler: cobre 90 dias mesmo postando quase todo dia. */
const LIMITE_POSTS = 60;

async function buscarConta(): Promise<ContaInstagram | null> {
  const id = process.env.IG_USER_ID;
  const token = process.env.META_ACCESS_TOKEN;
  if (!id || !token) return null;
  try {
    const res = await fetch(
      `${GRAPH}/${id}?fields=username,followers_count,media_count&access_token=${encodeURIComponent(token)}`,
      { signal: AbortSignal.timeout(10_000) },
    );
    if (!res.ok) return null;
    const j = (await res.json()) as {
      username?: string;
      followers_count?: number;
      media_count?: number;
    };
    if (!j.username) return null;
    const [alcance30, visitasPerfil30, seguidoresNovos30] = await Promise.all([
      totalDaConta(id, token, "reach"),
      totalDaConta(id, token, "profile_views"),
      saldoDeSeguidores(id, token),
    ]);
    return {
      usuario: j.username,
      seguidores: typeof j.followers_count === "number" ? j.followers_count : null,
      publicacoes: typeof j.media_count === "number" ? j.media_count : null,
      alcance30,
      visitasPerfil30,
      seguidoresNovos30,
    };
  } catch {
    return null;
  }
}

const TRINTA_DIAS_S = 29 * 86_400;

function janela30(): string {
  const agora = Math.floor(Date.now() / 1000);
  return `since=${agora - TRINTA_DIAS_S}&until=${agora}`;
}

/** Um total da conta nos últimos 30 dias. Cada métrica é pedida sozinha: se o
 * Instagram recusar uma (escopo, conta pequena), as outras continuam vindo. */
async function totalDaConta(
  id: string,
  token: string,
  metrica: string,
): Promise<number | null> {
  try {
    const res = await fetch(
      `${GRAPH}/${id}/insights?metric=${metrica}&metric_type=total_value&period=day&${janela30()}&access_token=${encodeURIComponent(token)}`,
      { signal: AbortSignal.timeout(10_000) },
    );
    if (!res.ok) return null;
    const j = (await res.json()) as { data?: { total_value?: { value?: number } }[] };
    const v = j.data?.[0]?.total_value?.value;
    return typeof v === "number" ? v : null;
  } catch {
    return null;
  }
}

/** Quem passou a seguir menos quem deixou de seguir, em 30 dias. */
async function saldoDeSeguidores(id: string, token: string): Promise<number | null> {
  try {
    const res = await fetch(
      `${GRAPH}/${id}/insights?metric=follows_and_unfollows&metric_type=total_value&breakdown=follow_type&period=day&${janela30()}&access_token=${encodeURIComponent(token)}`,
      { signal: AbortSignal.timeout(10_000) },
    );
    if (!res.ok) return null;
    const j = (await res.json()) as {
      data?: {
        total_value?: {
          breakdowns?: {
            results?: { dimension_values?: string[]; value?: number }[];
          }[];
        };
      }[];
    };
    const resultados = j.data?.[0]?.total_value?.breakdowns?.[0]?.results;
    if (!resultados?.length) return null;
    let saldo = 0;
    for (const r of resultados) {
      const tipo = r.dimension_values?.[0] ?? "";
      const v = typeof r.value === "number" ? r.value : 0;
      // "FOLLOWER" = passou a seguir; "NON_FOLLOWER" = deixou de seguir.
      saldo += tipo === "NON_FOLLOWER" ? -v : v;
    }
    return saldo;
  } catch {
    return null;
  }
}

/** Posts de mentira, espalhados nos últimos 80 dias, para o modo demonstração. */
function postsDeDemonstracao(): PostPainel[] {
  const agora = Date.now();
  const dia = 86_400_000;
  const base: [number, number, string, number, number, number, string][] = [
    // [dias atrás, hora UTC, formato, curtidas, comentários, alcance, legenda]
    [
      2,
      23,
      "CAROUSEL_ALBUM",
      96,
      31,
      1840,
      "Quem senta à sua mesa? Não quem te segue. Quem senta.",
    ],
    [6, 14, "IMAGE", 38, 4, 610, "O ego humilde pensa menos em si mesmo."],
    [
      9,
      23,
      "VIDEO",
      54,
      9,
      1320,
      "Discipulado não acontece em sala de aula. Acontece à mesa, entre o pão e a conversa.",
    ],
    [
      16,
      13,
      "CAROUSEL_ALBUM",
      41,
      6,
      720,
      "Três perguntas para fazer ao seu discipulador antes de terminar o ano.",
    ],
    [23, 22, "IMAGE", 29, 2, 480, "Não tenha pressa. O Senhor não tem."],
    [
      37,
      14,
      "CAROUSEL_ALBUM",
      44,
      5,
      690,
      "A liberdade do auto-esquecimento, em cinco slides.",
    ],
    [52, 23, "IMAGE", 33, 3, 520, "Leia devagar. Converse com alguém. Volte ao texto."],
    [71, 13, "VIDEO", 36, 4, 800, "Por que a mesa e não a sala de aula."],
  ];
  return base.map(([atras, hora, mediaType, likes, comments, reach, caption], i) => {
    const d = new Date(agora - atras * dia);
    d.setUTCHours(hora, 0, 0, 0);
    return {
      id: `demo-${i}`,
      caption,
      mediaType,
      timestamp: d.toISOString(),
      likes,
      comments,
      reach,
      permalink: "https://www.instagram.com/",
      interacoes: likes + comments,
      // Sinais de crescimento de mentira, coerentes com o resto: o Reel é o
      // mais enviado, o carrossel o mais salvo.
      compartilhamentos: Math.round(reach / (mediaType === "VIDEO" ? 55 : 160)),
      salvos: Math.round(reach / (mediaType === "CAROUSEL_ALBUM" ? 90 : 400)),
      seguiu: mediaType === "VIDEO" ? null : Math.round(reach / 700),
      visitasPerfil: mediaType === "VIDEO" ? null : Math.round(reach / 60),
      reel: mediaType === "VIDEO",
    };
  });
}

export async function carregarDadosPainel(): Promise<DadosPainel> {
  const lidoEm = new Date().toISOString();

  if (isMockMode()) {
    return {
      conectado: true,
      posts: postsDeDemonstracao(),
      conta: {
        usuario: "ekballo.demo",
        seguidores: 1248,
        publicacoes: 86,
        alcance30: 3120,
        visitasPerfil30: 148,
        seguidoresNovos30: 23,
      },
      erro: null,
      lidoEm,
    };
  }

  if (!instagramLeituraConfigurada()) {
    return { conectado: false, posts: [], conta: null, erro: null, lidoEm };
  }

  if (cache && Date.now() - cache.em < VALIDADE_MS) return cache.dados;

  let dados: DadosPainel;
  try {
    const [posts, conta] = await Promise.all([
      listarPostsComMetricas(LIMITE_POSTS),
      buscarConta(),
    ]);
    dados = { conectado: true, posts, conta, erro: null, lidoEm };
    cache = { em: Date.now(), dados };
  } catch (e) {
    // Falha não entra no cache: o próximo acesso tenta de novo.
    dados = {
      conectado: true,
      posts: [],
      conta: null,
      erro: e instanceof Error ? e.message : "Não consegui ler os dados do Instagram.",
      lidoEm,
    };
  }
  return dados;
}
