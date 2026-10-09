import { type NextRequest, NextResponse } from "next/server";
import { ehStory, prepararImageUrls } from "@/lib/instagram-imagens";
import {
  instagramConfigurado,
  publicarInstagram,
  publicarReel,
  publicarStory,
  reservaAte,
} from "@/lib/instagram-publish";
import { selfOrigin } from "@/lib/site-url";
import { createServiceClient } from "@/lib/supabase/service";

export const runtime = "nodejs";
// Um Reel pode levar minutos para o Instagram processar (issue #232). No box
// não há o teto de 60 s da Vercel; o valor fica só como registro da intenção.
export const maxDuration = 600;

// Publica os carrosséis cujo horário agendado já chegou. Chamado pelo pg_cron
// do box (job instagram-agendados, migration 320) com ?secret=AGENDA_SYNC_SECRET;
// Bearer CRON_SECRET continua valendo para chamada manual.

type SlideRow = {
  texto: string;
  prompt: string;
  modo: string;
  cor: string;
  fonte: string;
  seed: number;
  top?: string;
  ref?: string;
  tema?: string;
  tom?: string;
  modelo?: string;
  img?: string;
  formato?: string;
  imageUrl?: string;
};

// Sem segredo configurado a rota fica FECHADA. Antes ela aceitava qualquer
// chamada quando CRON_SECRET faltava — e quem a chama pode publicar no perfil.
function autorizado(req: NextRequest): boolean {
  const cron = (process.env.CRON_SECRET || "").trim();
  const auth = req.headers.get("authorization") || "";
  if (cron && auth === `Bearer ${cron}`) return true;
  const agenda = (process.env.AGENDA_SYNC_SECRET || "").trim();
  const q = (req.nextUrl.searchParams.get("secret") || "").trim();
  return agenda !== "" && q === agenda;
}

export async function GET(req: NextRequest) {
  if (!autorizado(req)) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }
  if (!instagramConfigurado()) {
    return NextResponse.json({ error: "Instagram não configurado" }, { status: 503 });
  }

  // As imagens são geradas pela rota OG do próprio app e sobem para o Storage
  // (é de lá que a Meta busca). A chamada é interna: pelo domínio público,
  // atrás do Traefik, ela cai no mesmo erro de TLS que derrubou as rotas OG.
  const origin = selfOrigin();
  const supabase = createServiceClient();

  // pega os que já venceram (limite pequeno por execução)
  const { data: pendentes, error } = await supabase
    .from("instagram_carrosseis")
    .select("id, slides, legenda, tipo, video_url, agendado_para")
    .eq("status", "agendado")
    .lte("agendado_para", new Date().toISOString())
    .order("agendado_para", { ascending: true })
    .limit(1);

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  if (!pendentes?.length) return NextResponse.json({ ok: true, publicados: 0 });

  const resultados: { id: string; ok: boolean; erro?: string }[] = [];
  for (const post of pendentes) {
    // Reserva o post antes de falar com o Instagram: empurra a hora dele para a
    // frente, e só segue quem conseguiu fazer isso. A publicação de um Reel
    // pode passar de 5 minutos — sem a reserva, a rodada seguinte do cron
    // pegaria o mesmo post e ele sairia duas vezes.
    const { data: reservado } = await supabase
      .from("instagram_carrosseis")
      .update({ agendado_para: reservaAte(new Date()) })
      .eq("id", post.id)
      .eq("status", "agendado")
      .eq("agendado_para", post.agendado_para)
      .select("id");
    if (!reservado?.length) continue; // outra rodada já está com ele
    const isReel = post.tipo === "reel";
    const slides = Array.isArray(post.slides) ? (post.slides as SlideRow[]) : [];
    try {
      const { id: postId } = isReel
        ? await (async () => {
            if (!post.video_url) throw new Error("sem vídeo");
            return publicarReel({
              igUserId: process.env.IG_USER_ID!,
              token: process.env.META_ACCESS_TOKEN!,
              videoUrl: post.video_url,
              legenda: post.legenda || "",
            });
          })()
        : await (async () => {
            if (!slides.length) throw new Error("sem slides");
            const imageUrls = await prepararImageUrls(origin, slides);
            // Story: uma imagem 9:16, sem legenda, que some em 24 h.
            if (ehStory(slides)) {
              return publicarStory({
                igUserId: process.env.IG_USER_ID!,
                token: process.env.META_ACCESS_TOKEN!,
                imageUrl: imageUrls[0],
              });
            }
            return publicarInstagram({
              igUserId: process.env.IG_USER_ID!,
              token: process.env.META_ACCESS_TOKEN!,
              imageUrls,
              legenda: post.legenda || "",
            });
          })();
      await supabase
        .from("instagram_carrosseis")
        .update({
          status: "publicado",
          publicado_em: new Date().toISOString(),
          ig_post_id: postId,
          erro: null,
          // devolve a hora que o pastor marcou (a reserva a tinha empurrado)
          agendado_para: post.agendado_para,
        })
        .eq("id", post.id);
      resultados.push({ id: post.id, ok: true });
    } catch (e) {
      const msg = e instanceof Error ? e.message : "falha";
      await supabase
        .from("instagram_carrosseis")
        .update({ status: "erro", erro: msg, agendado_para: post.agendado_para })
        .eq("id", post.id);
      resultados.push({ id: post.id, ok: false, erro: msg });
    }
  }

  return NextResponse.json({
    ok: true,
    publicados: resultados.filter((r) => r.ok).length,
    resultados,
  });
}
