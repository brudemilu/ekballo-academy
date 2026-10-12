/**
 * Executa o Instagram → Status do WhatsApp (issue #258): lê os Reels e stories
 * recentes do perfil, escolhe o que ainda não foi (lib/status-whatsapp.ts),
 * registra e publica no Status. Chamado pelo cron de 5 em 5 minutos.
 */
import { escolherParaStatus, type MidiaIG } from "@/lib/status-whatsapp";
import { createServiceClient } from "@/lib/supabase/service";
import { enviarStatusWhatsApp } from "@/lib/whatsapp-enviar";

const GRAPH = process.env.META_GRAPH_BASE || "https://graph.instagram.com/v21.0";

async function lerIG(caminho: string): Promise<MidiaIG[]> {
  const token = process.env.META_ACCESS_TOKEN || "";
  const res = await fetch(
    `${GRAPH}/${caminho}${caminho.includes("?") ? "&" : "?"}access_token=${encodeURIComponent(token)}`,
    { signal: AbortSignal.timeout(20_000) },
  );
  const json = (await res.json().catch(() => ({}))) as {
    data?: MidiaIG[];
    error?: { message?: string };
  };
  if (!res.ok) throw new Error(json.error?.message || `Instagram ${res.status}`);
  return json.data ?? [];
}

export type ResultadoStatus = {
  ligado: boolean;
  enviados: number;
  falhas: { id: string; erro: string }[];
  /** Leituras que falharam (ex.: o token não libera os stories). */
  avisos: string[];
};

export async function repetirNoStatus(): Promise<ResultadoStatus> {
  const resultado: ResultadoStatus = {
    ligado: false,
    enviados: 0,
    falhas: [],
    avisos: [],
  };
  if (process.env.NEXT_PUBLIC_MOCK_MODE === "true") return resultado;
  const igUserId = process.env.IG_USER_ID;
  if (!igUserId || !process.env.META_ACCESS_TOKEN) {
    resultado.avisos.push("Instagram não configurado");
    return resultado;
  }
  const sb = createServiceClient();
  const { data: config } = await sb
    .from("whatsapp_status_config")
    .select("ativo, ativado_em")
    .eq("id", 1)
    .maybeSingle();
  if (!config?.ativo) return resultado;
  resultado.ligado = true;

  // Uma leitura que falha não impede a outra: sem os stories, os Reels seguem.
  const campos =
    "id,media_type,media_product_type,permalink,thumbnail_url,media_url,caption,timestamp";
  const [midias, stories] = await Promise.all([
    lerIG(`${igUserId}/media?fields=${campos}&limit=12`).catch((e) => {
      resultado.avisos.push(`feed: ${e instanceof Error ? e.message : e}`);
      return [] as MidiaIG[];
    }),
    lerIG(`${igUserId}/stories?fields=${campos}`).catch((e) => {
      resultado.avisos.push(`stories: ${e instanceof Error ? e.message : e}`);
      return [] as MidiaIG[];
    }),
  ]);

  const ids = [...midias, ...stories].map((m) => m.id);
  if (!ids.length) return resultado;
  const { data: feitos } = await sb
    .from("whatsapp_status_enviados")
    .select("ig_media_id")
    .in("ig_media_id", ids);
  const itens = escolherParaStatus({
    midias,
    stories,
    jaEnviados: new Set((feitos ?? []).map((f) => f.ig_media_id as string)),
    desde: new Date(config.ativado_em as string),
  });

  for (const item of itens) {
    // Registra ANTES de enviar: a chave primária é o que garante que duas
    // rodadas ao mesmo tempo não mandem o mesmo item. Quem não conseguiu
    // inserir, não envia.
    const { error: jaExiste } = await sb.from("whatsapp_status_enviados").insert({
      ig_media_id: item.igMediaId,
      tipo: item.origem,
      permalink: item.permalink,
      ok: false,
      erro: "enviando",
    });
    if (jaExiste) continue;
    const erro = await enviarStatusWhatsApp(item.envio);
    // Falhou: fica registrado e NÃO é tentado de novo. Repetir às cegas um
    // envio que vai para todos os contatos é pior que perder um Status.
    await sb
      .from("whatsapp_status_enviados")
      .update({ ok: !erro, erro })
      .eq("ig_media_id", item.igMediaId);
    if (erro) resultado.falhas.push({ id: item.igMediaId, erro });
    else resultado.enviados++;
  }
  return resultado;
}
