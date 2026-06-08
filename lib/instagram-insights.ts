/**
 * Leitura do perfil do Instagram (posts + métricas) para alimentar a IA que
 * SUGERE postagens. Complementa lib/instagram-publish.ts (que só PUBLICA):
 * aqui a gente LÊ o que já foi publicado e como engajou.
 *
 *  - listarPostsComMetricas(): puxa as mídias recentes via Graph API (mesma
 *    base/token da publicação) com curtidas/comentários; tenta o alcance
 *    (reach) por post e degrada se o token não tiver esse escopo.
 *  - analisarPerfil(): cálculo DETERMINÍSTICO (sem IA) — engajamento médio,
 *    melhor dia/horário e formato que mais engaja. Esses números são fato,
 *    não "chute" do modelo.
 */

// Mesma base da publicação (Instagram API com login do Instagram).
const GRAPH = process.env.META_GRAPH_BASE || "https://graph.instagram.com/v21.0";
const TZ = "America/Sao_Paulo";

export type PostMetrica = {
  id: string;
  caption: string;
  mediaType: string; // IMAGE | VIDEO | CAROUSEL_ALBUM
  timestamp: string; // ISO 8601
  likes: number;
  comments: number;
  reach: number | null; // null quando o token não libera insights
  permalink: string;
  /** likes + comentários (sinal simples e explicável de engajamento). */
  interacoes: number;
};

export type PerfilResumo = {
  totalPosts: number;
  /** média de (curtidas + comentários) por post */
  engajamentoMedio: number;
  temReach: boolean;
  melhorDia: string; // ex.: "Domingo"
  melhorFaixaHoraria: string; // ex.: "noite (18h–21h)"
  melhorHorario: string; // "Domingo, noite (18h–21h)" — pronto pra exibir/sugerir
  formatoTop: string; // ex.: "Carrossel"
  topPosts: {
    caption: string;
    likes: number;
    comments: number;
    reach: number | null;
    permalink: string;
  }[];
};

function igEnv() {
  return {
    igUserId: process.env.IG_USER_ID,
    token: process.env.META_ACCESS_TOKEN,
  };
}

export function instagramLeituraConfigurada(): boolean {
  const { igUserId, token } = igEnv();
  return Boolean(igUserId && token);
}

type MediaRaw = {
  id: string;
  caption?: string;
  media_type?: string;
  timestamp?: string;
  like_count?: number;
  comments_count?: number;
  permalink?: string;
};

/** Tenta o alcance (reach) de uma mídia. Retorna null se o escopo faltar. */
async function buscarReach(id: string, token: string): Promise<number | null> {
  try {
    const url = `${GRAPH}/${id}/insights?metric=reach&access_token=${encodeURIComponent(token)}`;
    const res = await fetch(url);
    if (!res.ok) return null;
    const json = (await res.json()) as {
      data?: { values?: { value?: number }[] }[];
    };
    const v = json?.data?.[0]?.values?.[0]?.value;
    return typeof v === "number" ? v : null;
  } catch {
    return null;
  }
}

/**
 * Lista as mídias recentes do perfil com métricas. `limit` é quantos posts
 * puxar (máx ~25 numa página). Lança erro com mensagem clara se o token não
 * conseguir nem listar as mídias (ex.: escopo/instagram_business_basic ausente).
 */
export async function listarPostsComMetricas(limit = 25): Promise<PostMetrica[]> {
  const { igUserId, token } = igEnv();
  if (!igUserId || !token) {
    throw new Error("Instagram não conectado (faltam IG_USER_ID e META_ACCESS_TOKEN).");
  }

  const campos = "id,caption,media_type,timestamp,like_count,comments_count,permalink";
  const url = `${GRAPH}/${igUserId}/media?fields=${campos}&limit=${limit}&access_token=${encodeURIComponent(token)}`;
  const res = await fetch(url);
  const json = (await res.json()) as {
    data?: MediaRaw[];
    error?: { message?: string };
  };
  if (!res.ok || !Array.isArray(json.data)) {
    const msg = json?.error?.message || `Graph API ${res.status}`;
    throw new Error(`Não consegui ler seus posts: ${msg}`);
  }

  const base = json.data.map((m): Omit<PostMetrica, "reach"> => {
    const likes = typeof m.like_count === "number" ? m.like_count : 0;
    const comments = typeof m.comments_count === "number" ? m.comments_count : 0;
    return {
      id: m.id,
      caption: typeof m.caption === "string" ? m.caption : "",
      mediaType: typeof m.media_type === "string" ? m.media_type : "IMAGE",
      timestamp: typeof m.timestamp === "string" ? m.timestamp : "",
      likes,
      comments,
      permalink: typeof m.permalink === "string" ? m.permalink : "",
      interacoes: likes + comments,
    };
  });

  // Alcance é opcional: tenta em paralelo, cada um degrada pra null sozinho.
  const reaches = await Promise.all(base.map((p) => buscarReach(p.id, token)));
  return base.map((p, i) => ({ ...p, reach: reaches[i] }));
}

function capitalizar(s: string): string {
  return s ? s.charAt(0).toUpperCase() + s.slice(1) : s;
}

function diaDaSemana(iso: string): string {
  try {
    return capitalizar(
      new Intl.DateTimeFormat("pt-BR", { timeZone: TZ, weekday: "long" }).format(new Date(iso)),
    );
  } catch {
    return "";
  }
}

function horaLocal(iso: string): number {
  try {
    const h = new Intl.DateTimeFormat("pt-BR", { timeZone: TZ, hour: "2-digit", hour12: false }).format(
      new Date(iso),
    );
    const n = parseInt(h, 10);
    return Number.isFinite(n) ? n % 24 : -1;
  } catch {
    return -1;
  }
}

const FAIXAS: { ini: number; fim: number; label: string }[] = [
  { ini: 0, fim: 6, label: "madrugada (0h–6h)" },
  { ini: 6, fim: 9, label: "manhã cedo (6h–9h)" },
  { ini: 9, fim: 12, label: "manhã (9h–12h)" },
  { ini: 12, fim: 15, label: "meio-dia (12h–15h)" },
  { ini: 15, fim: 18, label: "tarde (15h–18h)" },
  { ini: 18, fim: 21, label: "noite (18h–21h)" },
  { ini: 21, fim: 24, label: "noite (21h–0h)" },
];

const FORMATO_LABEL: Record<string, string> = {
  IMAGE: "Imagem única",
  VIDEO: "Vídeo/Reels",
  CAROUSEL_ALBUM: "Carrossel",
};

/** Média de engajamento por grupo, ignorando grupos vazios. Devolve a chave do maior. */
function melhorPorMedia<T extends string>(
  posts: PostMetrica[],
  chave: (p: PostMetrica) => T | "",
): T | "" {
  const soma = new Map<T, { total: number; n: number }>();
  for (const p of posts) {
    const k = chave(p);
    if (!k) continue;
    const cur = soma.get(k) || { total: 0, n: 0 };
    cur.total += p.interacoes;
    cur.n += 1;
    soma.set(k, cur);
  }
  let melhor: T | "" = "";
  let melhorMedia = -1;
  for (const [k, v] of soma) {
    const media = v.total / v.n;
    if (media > melhorMedia) {
      melhorMedia = media;
      melhor = k;
    }
  }
  return melhor;
}

/** Análise determinística do perfil — números, não opinião da IA. */
export function analisarPerfil(posts: PostMetrica[]): PerfilResumo {
  const total = posts.length;
  const engajamentoMedio = total
    ? Math.round(posts.reduce((s, p) => s + p.interacoes, 0) / total)
    : 0;

  const melhorDia = melhorPorMedia(posts, (p) => diaDaSemana(p.timestamp)) || "—";

  const melhorFaixa =
    melhorPorMedia(posts, (p) => {
      const h = horaLocal(p.timestamp);
      const f = FAIXAS.find((x) => h >= x.ini && h < x.fim);
      return (f?.label as string) || "";
    }) || "—";

  const formatoBruto = melhorPorMedia(posts, (p) => p.mediaType);
  const formatoTop = FORMATO_LABEL[formatoBruto] || (formatoBruto ? "Imagem única" : "—");

  const topPosts = [...posts]
    .sort((a, b) => b.interacoes - a.interacoes)
    .slice(0, 5)
    .map((p) => ({
      caption: p.caption,
      likes: p.likes,
      comments: p.comments,
      reach: p.reach,
      permalink: p.permalink,
    }));

  const melhorHorario =
    melhorDia !== "—" && melhorFaixa !== "—" ? `${melhorDia}, ${melhorFaixa}` : melhorDia;

  return {
    totalPosts: total,
    engajamentoMedio,
    temReach: posts.some((p) => p.reach != null),
    melhorDia,
    melhorFaixaHoraria: melhorFaixa,
    melhorHorario,
    formatoTop,
    topPosts,
  };
}
