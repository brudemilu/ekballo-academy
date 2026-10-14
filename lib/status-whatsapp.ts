/**
 * Instagram → Status do WhatsApp, automático (issue #258).
 *
 * Pedido do Bruno (12/10/2026): todo Reel que sair no Instagram vira um Status
 * com o link — quem toca vai assistir no Instagram —, e todo story é repetido
 * no Status. Vale também para o que ele publica direto no aplicativo: por isso
 * a rotina LÊ o perfil, em vez de pegar carona na nossa publicação.
 *
 * Aqui fica a parte pura: escolher o que mandar e montar a mensagem. Quem lê
 * o Instagram, grava e envia é lib/status-whatsapp-executar.ts. Testado em
 * testes/status-whatsapp.test.ts.
 */

/** Uma mídia do feed, como o Instagram devolve em /media. */
export type MidiaIG = {
  id: string;
  media_type?: string; // IMAGE | VIDEO | CAROUSEL_ALBUM
  media_product_type?: string; // FEED | REELS | STORY
  permalink?: string;
  thumbnail_url?: string;
  media_url?: string;
  caption?: string;
  timestamp?: string;
};

export type EnvioStatus =
  | { tipo: "text"; conteudo: string }
  | { tipo: "image" | "video"; url: string; legenda?: string };

export type ItemStatus = {
  igMediaId: string;
  origem: "reel" | "story";
  permalink: string | null;
  envio: EnvioStatus;
};

/** Quantos Status uma rodada manda, no máximo. Segura um despejo acidental. */
export const MAX_POR_RODADA = 3;

/** A primeira linha da legenda, sem hashtags, cortada sem partir palavra. */
export function chamadaDaLegenda(legenda: string | undefined, max = 110): string {
  const linha = (legenda || "")
    .split(/\n/)
    .map((l) => l.trim())
    .find((l) => l && !l.startsWith("#") && !/^m[úu]sica\s*:/i.test(l));
  if (!linha) return "";
  const limpa = linha
    .replace(/#[\p{L}\p{N}_]+/gu, "")
    .replace(/\s+/g, " ")
    .trim();
  if (limpa.length <= max) return limpa;
  const corte = limpa.slice(0, max);
  const ate = corte.lastIndexOf(" ");
  return `${corte.slice(0, ate > 40 ? ate : max).trim()}…`;
}

/** O texto que acompanha o Reel no Status: a chamada e o link. */
export function textoDoReel(m: MidiaIG): string {
  const chamada = chamadaDaLegenda(m.caption);
  return [
    "🎬 Reel novo no Instagram",
    chamada ? `\n${chamada}` : "",
    `\n👉 Assista aqui: ${m.permalink ?? ""}`,
  ]
    .filter(Boolean)
    .join("\n")
    .trim();
}

function depoisDe(m: MidiaIG, desde: Date): boolean {
  const t = m.timestamp ? new Date(m.timestamp).getTime() : Number.NaN;
  return !Number.isNaN(t) && t >= desde.getTime();
}

/**
 * O que precisa ir para o Status agora: Reels e stories publicados depois de
 * `desde` (quando o recurso foi ligado) e que ainda não foram mandados. Do
 * mais antigo para o mais novo, para o Status sair na ordem em que foi postado.
 */
export function escolherParaStatus(entrada: {
  midias: MidiaIG[];
  stories: MidiaIG[];
  jaEnviados: Set<string>;
  desde: Date;
  max?: number;
}): ItemStatus[] {
  const itens: (ItemStatus & { quando: number })[] = [];
  for (const m of entrada.midias) {
    if (m.media_product_type !== "REELS" || !m.permalink) continue;
    if (entrada.jaEnviados.has(m.id) || !depoisDe(m, entrada.desde)) continue;
    const texto = textoDoReel(m);
    itens.push({
      igMediaId: m.id,
      origem: "reel",
      permalink: m.permalink,
      // Com a capa, o Status mostra a imagem do Reel e o link na legenda; sem
      // ela, vai só o texto com o link.
      envio: m.thumbnail_url
        ? { tipo: "image", url: m.thumbnail_url, legenda: texto }
        : { tipo: "text", conteudo: texto },
      quando: new Date(m.timestamp as string).getTime(),
    });
  }
  for (const s of entrada.stories) {
    if (entrada.jaEnviados.has(s.id) || !depoisDe(s, entrada.desde)) continue;
    if (!s.media_url) continue; // sem o arquivo não há o que repetir
    itens.push({
      igMediaId: s.id,
      origem: "story",
      permalink: s.permalink ?? null,
      envio: { tipo: s.media_type === "VIDEO" ? "video" : "image", url: s.media_url },
      quando: new Date(s.timestamp as string).getTime(),
    });
  }
  return itens
    .sort((a, b) => a.quando - b.quando)
    .slice(0, entrada.max ?? MAX_POR_RODADA)
    .map(({ quando: _quando, ...item }) => item);
}
