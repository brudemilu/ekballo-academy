/**
 * Executa o Instagram → TikTok (issue #273): acompanha os envios em
 * andamento, lê os Reels recentes do perfil, escolhe o que ainda não foi
 * (lib/tiktok.ts) e manda. Chamado pelo cron de 5 em 5 minutos.
 *
 * Só a conta principal, por decisão: o TikTok é o do pastor, como o Status
 * do WhatsApp.
 */
import { CONTA_PRINCIPAL_ID } from "@/lib/instagram-contas";
import { credenciaisInstagram } from "@/lib/instagram-credenciais";
import type { MidiaIG } from "@/lib/status-whatsapp";
import { createServiceClient } from "@/lib/supabase/service";
import {
  type AutorizacaoTikTok,
  avisoDoRascunho,
  escolherParaTikTok,
  lerAutorizacao,
  situacaoDoStatus,
  validarAutorizacao,
} from "@/lib/tiktok";
import { consultarEnvio, enviarVideo, lerCriador } from "@/lib/tiktok-api";
import { tokenTikTok } from "@/lib/tiktok-credenciais";
import { enviarTextoWhatsApp } from "@/lib/whatsapp-enviar";

const GRAPH = process.env.META_GRAPH_BASE || "https://graph.instagram.com/v21.0";
/** O TikTok aceita até 4 GB; acima disto nem tentamos baixar no servidor. */
const MAIOR_VIDEO = 300 * 1024 * 1024;

export type ResultadoTikTok = {
  ligado: boolean;
  enviados: number;
  atualizados: number;
  falhas: { id: string; erro: string }[];
  avisos: string[];
};

async function lerReels(igUserId: string, token: string): Promise<MidiaIG[]> {
  const campos =
    "id,media_type,media_product_type,permalink,media_url,caption,timestamp";
  const res = await fetch(
    `${GRAPH}/${igUserId}/media?fields=${campos}&limit=12&access_token=${encodeURIComponent(token)}`,
    { signal: AbortSignal.timeout(20_000) },
  );
  const json = (await res.json().catch(() => ({}))) as {
    data?: MidiaIG[];
    error?: { message?: string };
  };
  if (!res.ok) throw new Error(json.error?.message || `Instagram ${res.status}`);
  return json.data ?? [];
}

async function baixarVideo(url: string): Promise<Uint8Array> {
  const res = await fetch(url, { signal: AbortSignal.timeout(120_000) });
  if (!res.ok) throw new Error(`não consegui baixar o vídeo (${res.status})`);
  const tamanho = Number(res.headers.get("content-length") || 0);
  if (tamanho > MAIOR_VIDEO) throw new Error("vídeo grande demais para enviar daqui");
  return new Uint8Array(await res.arrayBuffer());
}

/** O número do pastor: o do piloto automático, ou o primeiro dono da agenda. */
async function telefoneDoDono(): Promise<string | null> {
  const { data } = await createServiceClient()
    .from("conteudo_piloto")
    .select("telefone")
    .eq("conta_id", CONTA_PRINCIPAL_ID)
    .maybeSingle();
  const doPiloto = String(data?.telefone || "").replace(/\D/g, "");
  if (doPiloto.length >= 12) return doPiloto;
  const dono = (process.env.AGENDA_WHATSAPP_DONOS || "")
    .split(",")
    .map((n) => n.replace(/\D/g, ""))
    .find((n) => n.length >= 12);
  return dono || null;
}

/**
 * O arquivo original de cada Reel que saiu pelo sistema, achado pela legenda
 * (o Instagram não devolve nada nosso). Sem achar, vale o arquivo do Instagram.
 */
async function dadosDoSistema(
  midias: MidiaIG[],
  desde: Date,
): Promise<{
  originais: Map<string, string>;
  autorizacoes: Map<string, AutorizacaoTikTok>;
}> {
  const mapa = new Map<string, string>();
  const autorizacoes = new Map<string, AutorizacaoTikTok>();
  const { data } = await createServiceClient()
    .from("instagram_carrosseis")
    .select("legenda, video_url, tiktok")
    .eq("conta_id", CONTA_PRINCIPAL_ID)
    .eq("tipo", "reel")
    .eq("status", "publicado")
    .not("video_url", "is", null)
    .gte("publicado_em", new Date(desde.getTime() - 86_400_000).toISOString())
    .limit(30);
  const porLegenda = new Map(
    (data ?? []).map((r) => [String(r.legenda || "").trim(), r]),
  );
  for (const m of midias) {
    const r = porLegenda.get(String(m.caption || "").trim());
    if (!r) continue;
    if (r.video_url) mapa.set(m.id, r.video_url as string);
    const a = lerAutorizacao(r.tiktok);
    if (a) autorizacoes.set(m.id, a);
  }
  return { originais: mapa, autorizacoes };
}

export async function repetirNoTikTok(): Promise<ResultadoTikTok> {
  const r: ResultadoTikTok = {
    ligado: false,
    enviados: 0,
    atualizados: 0,
    falhas: [],
    avisos: [],
  };
  if (process.env.NEXT_PUBLIC_MOCK_MODE === "true") return r;
  const sb = createServiceClient();
  const { data: config } = await sb
    .from("tiktok_config")
    .select("ativo, ativado_em")
    .eq("conta_id", CONTA_PRINCIPAL_ID)
    .maybeSingle();
  if (!config?.ativo) return r;
  r.ligado = true;

  const token = await tokenTikTok(CONTA_PRINCIPAL_ID).catch((e) => {
    r.avisos.push(`token do TikTok: ${e instanceof Error ? e.message : e}`);
    return null;
  });
  if (!token) {
    if (!r.avisos.length) r.avisos.push("TikTok não conectado");
    return r;
  }

  // 1) Acompanha o que já foi e ainda está processando no TikTok.
  const { data: andamento } = await sb
    .from("tiktok_envios")
    .select("ig_media_id, publish_id")
    .eq("situacao", "processando")
    .gte("criado_em", new Date(Date.now() - 2 * 86_400_000).toISOString())
    .limit(10);
  for (const e of andamento ?? []) {
    if (!e.publish_id) continue;
    try {
      const st = await consultarEnvio(token, e.publish_id as string);
      const situacao = situacaoDoStatus(st.status);
      if (situacao === "processando") continue;
      await sb
        .from("tiktok_envios")
        .update({
          situacao,
          erro: situacao === "erro" ? st.motivo || "o TikTok recusou o vídeo" : null,
          atualizado_em: new Date().toISOString(),
        })
        .eq("ig_media_id", e.ig_media_id);
      r.atualizados++;
    } catch (err) {
      r.avisos.push(
        `status ${e.ig_media_id}: ${err instanceof Error ? err.message : err}`,
      );
    }
  }

  // 2) Manda os Reels novos.
  const ig = await credenciaisInstagram(CONTA_PRINCIPAL_ID);
  if (!ig) {
    r.avisos.push("Instagram não configurado");
    return r;
  }
  const midias = await lerReels(ig.igUserId, ig.token).catch((e) => {
    r.avisos.push(`feed: ${e instanceof Error ? e.message : e}`);
    return [] as MidiaIG[];
  });
  if (!midias.length) return r;
  const desde = new Date(config.ativado_em as string);
  const { data: feitos } = await sb
    .from("tiktok_envios")
    .select("ig_media_id")
    .in(
      "ig_media_id",
      midias.map((m) => m.id),
    );
  const itens = escolherParaTikTok({
    midias,
    jaEnviados: new Set((feitos ?? []).map((f) => f.ig_media_id as string)),
    desde,
    ...(await dadosDoSistema(midias, desde)),
  });

  for (const item of itens) {
    // Autorizado no painel = publicação direta; sem autorização = rascunho.
    const modo = item.autorizacao ? "direto" : "rascunho";
    // Registra ANTES de enviar: a chave primária garante que duas rodadas ao
    // mesmo tempo não mandem o mesmo Reel. Quem não conseguiu inserir, não envia.
    const { error: jaExiste } = await sb.from("tiktok_envios").insert({
      ig_media_id: item.igMediaId,
      conta_id: CONTA_PRINCIPAL_ID,
      permalink: item.permalink,
      chamada: item.legenda.split("\n")[0]?.slice(0, 140) || null,
      modo,
      situacao: "enviando",
    });
    if (jaExiste) continue;
    try {
      if (item.autorizacao) {
        // O TikTok exige conferir a conta de novo na hora de publicar.
        const problemas = validarAutorizacao(item.autorizacao, await lerCriador(token));
        if (problemas.length) throw new Error(problemas.join(" "));
      }
      const video = await baixarVideo(item.videoUrl);
      const env = await enviarVideo({
        token,
        modo,
        video,
        legenda: item.autorizacao?.legenda || item.legenda,
        autorizacao: item.autorizacao,
      });
      await sb
        .from("tiktok_envios")
        .update({
          publish_id: env.publishId,
          privacidade: env.privacidade,
          situacao: "processando",
          atualizado_em: new Date().toISOString(),
        })
        .eq("ig_media_id", item.igMediaId);
      r.enviados++;
      // No rascunho a legenda não vai junto: chega pelo WhatsApp para colar.
      if (modo === "rascunho") {
        const numero = await telefoneDoDono();
        if (!numero) r.avisos.push("sem telefone para mandar a legenda");
        else {
          const falha =
            (await enviarTextoWhatsApp(numero, avisoDoRascunho(item.legenda))) ||
            (item.legenda ? await enviarTextoWhatsApp(numero, item.legenda) : null);
          if (falha) r.avisos.push(`WhatsApp da legenda: ${falha}`);
        }
      }
    } catch (e) {
      // Falhou: fica registrado e NÃO é tentado de novo sozinho — o painel tem
      // o "tentar de novo". Repetir às cegas poderia publicar duas vezes.
      const erro = e instanceof Error ? e.message : String(e);
      await sb
        .from("tiktok_envios")
        .update({
          situacao: "erro",
          erro: erro.slice(0, 500),
          atualizado_em: new Date().toISOString(),
        })
        .eq("ig_media_id", item.igMediaId);
      r.falhas.push({ id: item.igMediaId, erro });
    }
  }
  return r;
}
