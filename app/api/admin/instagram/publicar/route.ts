import { type NextRequest, NextResponse } from "next/server";
import { getCurrentSession, getIdentidadeInstagram } from "@/lib/db";
import { normalizarColaboradores } from "@/lib/instagram-colaboradores";
import { contaAtualId } from "@/lib/instagram-conta-atual";
import { ehIdDeConta } from "@/lib/instagram-contas";
import { credenciaisInstagram } from "@/lib/instagram-credenciais";
import { ehStory, prepararImageUrls } from "@/lib/instagram-imagens";
import {
  ESPERA_REEL_TELA_SEG,
  type Publicado,
  publicarInstagram,
  publicarReel,
  publicarStory,
} from "@/lib/instagram-publish";
import { createClient } from "@/lib/supabase/server";

export const runtime = "nodejs";
export const maxDuration = 60;

type SlideIn = {
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
  /** Imagem enviada pelo usuário (modo upload) — usa direto, sem IA. */
  imageUrl?: string;
};

/**
 * POST /api/admin/instagram/publicar  { slides, legenda }
 * Publica no Instagram (imagem única ou carrossel). Admin-only.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  let slides: SlideIn[] = [];
  let legenda = "";
  let postId: string | null = null;
  let tipo = "carrossel";
  let videoUrl = "";
  let colaboradores: string[] = [];
  // Post salvo sai pela conta DONA dele, não pela que está aberta no painel:
  // com duas abas em contas diferentes, a escolhida na hora pode ser outra.
  let contaId = await contaAtualId();
  try {
    const body = await req.json();
    postId = typeof body.id === "string" ? body.id : null;
    if (postId) {
      // republicar um post salvo: carrega do banco
      const supabase = await createClient();
      const { data, error } = await supabase
        .from("instagram_carrosseis")
        .select("slides, legenda, tipo, video_url, colaboradores, conta_id")
        .eq("id", postId)
        .single();
      if (error || !data) {
        return NextResponse.json({ error: "Post não encontrado." }, { status: 404 });
      }
      slides = (Array.isArray(data.slides) ? data.slides : []) as SlideIn[];
      legenda = typeof data.legenda === "string" ? data.legenda : "";
      tipo = data.tipo === "reel" ? "reel" : "carrossel";
      videoUrl = typeof data.video_url === "string" ? data.video_url : "";
      colaboradores = normalizarColaboradores(data.colaboradores);
      if (ehIdDeConta(data.conta_id)) contaId = data.conta_id;
    } else {
      tipo = body.tipo === "reel" ? "reel" : "carrossel";
      slides = Array.isArray(body.slides) ? body.slides : [];
      legenda = typeof body.legenda === "string" ? body.legenda : "";
      videoUrl = typeof body.videoUrl === "string" ? body.videoUrl : "";
      colaboradores = normalizarColaboradores(body.colaboradores);
    }
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }

  const isReel = tipo === "reel";
  if (isReel ? !videoUrl : !slides.length) {
    return NextResponse.json({ error: "Nada pra publicar." }, { status: 400 });
  }

  const cred = await credenciaisInstagram(contaId);
  if (!cred) {
    return NextResponse.json(
      { error: "Esta conta ainda não está conectada ao Instagram (aba Contas)." },
      { status: 503 },
    );
  }

  // o Meta busca a mídia por URL pública — usa a origem da requisição (produção).
  const origin = req.nextUrl.origin;
  if (origin.includes("localhost") || origin.includes("127.0.0.1")) {
    return NextResponse.json(
      {
        error:
          "Publicação só funciona no site publicado (o Instagram não acessa localhost).",
      },
      { status: 400 },
    );
  }
  // imagens: pré-gera e sobe no Storage (estático/rápido) pra o Meta não dar
  // timeout buscando a rota OG (que gera por IA, ~10s). Reel não usa imagens.
  // A arte leva a assinatura da conta dona do post.
  const imageUrls = isReel
    ? []
    : await prepararImageUrls(
        origin,
        slides,
        await getIdentidadeInstagram(contaId).catch(() => ({})),
      );

  try {
    const publicado: Publicado = isReel
      ? await publicarReel({
          ...cred,
          videoUrl,
          legenda,
          esperaSeg: ESPERA_REEL_TELA_SEG,
          colaboradores,
        })
      : ehStory(slides)
        ? // Story: uma imagem 9:16, sem legenda, que some em 24 h.
          await publicarStory({
            ...cred,
            imageUrl: imageUrls[0],
          })
        : await publicarInstagram({
            ...cred,
            imageUrls,
            legenda,
            colaboradores,
          });
    const aviso = publicado.aviso ?? null;
    const id = publicado.id;
    if (postId) {
      const supabase = await createClient();
      await supabase
        .from("instagram_carrosseis")
        .update({
          status: "publicado",
          publicado_em: new Date().toISOString(),
          ig_post_id: id,
          erro: null,
          aviso,
        })
        .eq("id", postId);
    }
    return NextResponse.json({ ok: true, id, aviso });
  } catch (e) {
    const msg = e instanceof Error ? e.message : "Falha ao publicar.";
    if (postId) {
      const supabase = await createClient();
      await supabase
        .from("instagram_carrosseis")
        .update({ status: "erro", erro: msg })
        .eq("id", postId);
    }
    return NextResponse.json({ error: msg }, { status: 502 });
  }
}
