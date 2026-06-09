import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { createClient } from "@/lib/supabase/server";
import { publicarInstagram, publicarReel, instagramConfigurado } from "@/lib/instagram-publish";

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
  /** Imagem enviada pelo usuário (modo upload) — usa direto, sem IA. */
  imageUrl?: string;
};

function ogUrl(origin: string, s: SlideIn): string {
  if (s.imageUrl) return s.imageUrl;
  const p = new URLSearchParams({
    verso: s.texto,
    prompt: s.prompt,
    modo: s.modo,
    realce: s.modo,
    fonte: s.fonte,
    seed: String(s.seed),
  });
  if (s.tema) p.set("tema", s.tema);
  if (s.top?.trim()) p.set("top", s.top.trim());
  if (s.ref?.trim()) p.set("ref", s.ref.trim());
  return `${origin}/api/og/instagram?${p.toString()}`;
}

/**
 * POST /api/admin/instagram/publicar  { slides, legenda }
 * Publica no Instagram (imagem única ou carrossel). Admin-only.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }
  if (!instagramConfigurado()) {
    return NextResponse.json(
      { error: "Instagram ainda não conectado (faltam IG_USER_ID e META_ACCESS_TOKEN)." },
      { status: 503 },
    );
  }

  let slides: SlideIn[] = [];
  let legenda = "";
  let postId: string | null = null;
  let tipo = "carrossel";
  let videoUrl = "";
  try {
    const body = await req.json();
    postId = typeof body.id === "string" ? body.id : null;
    if (postId) {
      // republicar um post salvo: carrega do banco
      const supabase = await createClient();
      const { data, error } = await supabase
        .from("instagram_carrosseis")
        .select("slides, legenda, tipo, video_url")
        .eq("id", postId)
        .single();
      if (error || !data) {
        return NextResponse.json({ error: "Post não encontrado." }, { status: 404 });
      }
      slides = (Array.isArray(data.slides) ? data.slides : []) as SlideIn[];
      legenda = typeof data.legenda === "string" ? data.legenda : "";
      tipo = data.tipo === "reel" ? "reel" : "carrossel";
      videoUrl = typeof data.video_url === "string" ? data.video_url : "";
    } else {
      tipo = body.tipo === "reel" ? "reel" : "carrossel";
      slides = Array.isArray(body.slides) ? body.slides : [];
      legenda = typeof body.legenda === "string" ? body.legenda : "";
      videoUrl = typeof body.videoUrl === "string" ? body.videoUrl : "";
    }
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }

  const isReel = tipo === "reel";
  if (isReel ? !videoUrl : !slides.length) {
    return NextResponse.json({ error: "Nada pra publicar." }, { status: 400 });
  }

  // o Meta busca a mídia por URL pública — usa a origem da requisição (produção).
  const origin = req.nextUrl.origin;
  if (origin.includes("localhost") || origin.includes("127.0.0.1")) {
    return NextResponse.json(
      { error: "Publicação só funciona no site publicado (o Instagram não acessa localhost)." },
      { status: 400 },
    );
  }

  try {
    const { id } = isReel
      ? await publicarReel({
          igUserId: process.env.IG_USER_ID!,
          token: process.env.META_ACCESS_TOKEN!,
          videoUrl,
          legenda,
        })
      : await publicarInstagram({
          igUserId: process.env.IG_USER_ID!,
          token: process.env.META_ACCESS_TOKEN!,
          imageUrls: slides.map((s) => ogUrl(origin, s)),
          legenda,
        });
    if (postId) {
      const supabase = await createClient();
      await supabase
        .from("instagram_carrosseis")
        .update({ status: "publicado", publicado_em: new Date().toISOString(), ig_post_id: id, erro: null })
        .eq("id", postId);
    }
    return NextResponse.json({ ok: true, id });
  } catch (e) {
    const msg = e instanceof Error ? e.message : "Falha ao publicar.";
    if (postId) {
      const supabase = await createClient();
      await supabase.from("instagram_carrosseis").update({ status: "erro", erro: msg }).eq("id", postId);
    }
    return NextResponse.json({ error: msg }, { status: 502 });
  }
}
