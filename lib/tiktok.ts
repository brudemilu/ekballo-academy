/**
 * Instagram → TikTok (issue #273).
 *
 * Todo Reel que sai no Instagram da conta principal vai também para o TikTok.
 * Como no Status do WhatsApp, a rotina LÊ o perfil do Instagram — assim vale
 * também para o Reel que o pastor publica direto no aplicativo.
 *
 * Dois modos:
 * - `rascunho`: o vídeo cai na caixa de rascunhos do TikTok; chega uma
 *   notificação no celular e ele confirma (e pode escolher uma música em alta).
 *   A API de rascunho não aceita legenda, então a legenda vai pelo WhatsApp.
 * - `direto`: publica sozinho. Só sai público depois que o TikTok aprovar o
 *   aplicativo; antes disso a API só aceita "somente eu".
 *
 * Aqui fica a parte pura. Quem fala com o TikTok é lib/tiktok-api.ts; quem
 * lê o Instagram, grava e envia é lib/tiktok-executar.ts. Testado em
 * testes/tiktok.test.ts.
 */
import { chamadaDaLegenda, type MidiaIG } from "@/lib/status-whatsapp";

export type ModoTikTok = "rascunho" | "direto";


export function ehModoTikTok(v: unknown): v is ModoTikTok {
  return v === "rascunho" || v === "direto";
}

/** O que o TikTok pede na tela de autorização. */
export const ESCOPOS_PADRAO = "user.info.basic,video.upload,video.publish";

/** Uma rodada manda no máximo isto. Envio de vídeo é pesado e o cron é de 5 min. */
export const MAX_POR_RODADA = 2;

/** Limite do TikTok para o título (a legenda) na publicação direta. */
export const MAX_LEGENDA_TIKTOK = 2200;

/** Endereço da tela do TikTok onde o pastor autoriza a conta. */
export function urlDeAutorizacao(p: {
  clientKey: string;
  redirectUri: string;
  state: string;
  escopos?: string;
}): string {
  const q = new URLSearchParams({
    client_key: p.clientKey,
    scope: p.escopos || ESCOPOS_PADRAO,
    response_type: "code",
    redirect_uri: p.redirectUri,
    state: p.state,
  });
  return `https://www.tiktok.com/v2/auth/authorize/?${q.toString()}`;
}

/**
 * A legenda do Instagram adaptada ao TikTok: tira o "Música: …" (a música do
 * vídeo de lá não é a do TikTok) e corta no limite sem partir palavra.
 */
export function legendaParaTikTok(legenda: string | undefined): string {
  const linhas = (legenda || "").split("\n");
  const sem = linhas.filter((l) => !/^\s*m[úu]sica\s*:/i.test(l));
  const texto = sem
    .join("\n")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
  if (texto.length <= MAX_LEGENDA_TIKTOK) return texto;
  const corte = texto.slice(0, MAX_LEGENDA_TIKTOK - 1);
  const ate = corte.lastIndexOf(" ");
  return `${corte.slice(0, ate > 0 ? ate : corte.length).trimEnd()}…`;
}

/** A mensagem de WhatsApp que acompanha o rascunho: o que fazer e a legenda. */
export function avisoDoRascunho(legenda: string): string {
  const chamada = chamadaDaLegenda(legenda, 80);
  const linhas = ["🎵 Reel enviado para os rascunhos do TikTok."];
  if (chamada) linhas.push(`"${chamada}"`);
  linhas.push(
    "",
    "Abra o TikTok, toque na notificação, escolha uma música em alta se quiser e publique. A legenda vem na próxima mensagem, para copiar e colar.",
  );
  return linhas.join("\n");
}

export type ItemTikTok = {
  igMediaId: string;
  permalink: string | null;
  legenda: string;
  /** Endereço do arquivo de vídeo para mandar ao TikTok. */
  videoUrl: string;
};

/**
 * O que precisa ir para o TikTok agora: Reels publicados depois de `desde`
 * (quando o recurso foi ligado), ainda não enviados e com arquivo de vídeo.
 * O arquivo original do sistema (sem a recompressão do Instagram) é usado
 * quando o Reel saiu por aqui; senão, o do Instagram. Do mais antigo para o
 * mais novo.
 */
export function escolherParaTikTok(entrada: {
  midias: MidiaIG[];
  jaEnviados: Set<string>;
  desde: Date;
  originais?: Map<string, string>;
  max?: number;
}): ItemTikTok[] {
  const itens: (ItemTikTok & { quando: number })[] = [];
  for (const m of entrada.midias) {
    if (m.media_product_type !== "REELS") continue;
    if (entrada.jaEnviados.has(m.id)) continue;
    const quando = m.timestamp ? new Date(m.timestamp).getTime() : Number.NaN;
    if (Number.isNaN(quando) || quando < entrada.desde.getTime()) continue;
    const videoUrl = entrada.originais?.get(m.id) || m.media_url;
    if (!videoUrl) continue;
    itens.push({
      igMediaId: m.id,
      permalink: m.permalink ?? null,
      legenda: legendaParaTikTok(m.caption),
      videoUrl,
      quando,
    });
  }
  return itens
    .sort((a, b) => a.quando - b.quando)
    .slice(0, entrada.max ?? MAX_POR_RODADA)
    .map(({ quando: _quando, ...item }) => item);
}

/**
 * Como dividir o arquivo para o envio. Regras do TikTok: pedaços de 5 a 64 MB;
 * vídeo menor que 64 MB vai inteiro; o último pedaço leva o que sobrar (até
 * 128 MB). Devolve o tamanho de cada pedaço e as faixas de bytes.
 */
export function planoDeEnvio(tamanho: number): {
  chunkSize: number;
  total: number;
  faixas: { inicio: number; fim: number }[];
} {
  if (!Number.isFinite(tamanho) || tamanho <= 0) throw new Error("vídeo vazio");
  const MB = 1024 * 1024;
  const chunkSize = tamanho <= 64 * MB ? tamanho : 32 * MB;
  const total = Math.max(1, Math.floor(tamanho / chunkSize));
  const faixas = Array.from({ length: total }, (_, i) => ({
    inicio: i * chunkSize,
    fim: i === total - 1 ? tamanho - 1 : (i + 1) * chunkSize - 1,
  }));
  return { chunkSize, total, faixas };
}

/** A privacidade da publicação direta: pública se o TikTok deixar; senão, só eu. */
export function escolherPrivacidade(opcoes: string[] | undefined): string {
  const lista = opcoes ?? [];
  if (lista.includes("PUBLIC_TO_EVERYONE")) return "PUBLIC_TO_EVERYONE";
  if (lista.includes("SELF_ONLY")) return "SELF_ONLY";
  return lista[0] || "SELF_ONLY";
}

export type SituacaoTikTok =
  | "enviando"
  | "processando"
  | "no_rascunho"
  | "publicado"
  | "erro";

/** Traduz o status do TikTok (/post/publish/status/fetch/) para o painel. */
export function situacaoDoStatus(status: string | undefined): SituacaoTikTok {
  switch (status) {
    case "SEND_TO_USER_INBOX":
      return "no_rascunho";
    case "PUBLISH_COMPLETE":
      return "publicado";
    case "FAILED":
      return "erro";
    default:
      return "processando";
  }
}

/** Renova o token se ele vence em menos de 10 minutos. */
export function tokenVencendo(
  expiraEm: string | null | undefined,
  agora = new Date(),
): boolean {
  if (!expiraEm) return true;
  const t = new Date(expiraEm).getTime();
  return Number.isNaN(t) || t - agora.getTime() < 10 * 60 * 1000;
}
