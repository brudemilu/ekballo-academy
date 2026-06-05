import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { publicarInstagram, instagramConfigurado } from "@/lib/instagram-publish";

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
};

function ogUrl(origin: string, s: SlideIn): string {
  const p = new URLSearchParams({
    verso: s.texto,
    prompt: s.prompt,
    modo: s.modo,
    realce: s.modo,
    cor: s.cor,
    fonte: s.fonte,
    seed: String(s.seed),
    n: "1",
    i: "0",
  });
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
  try {
    const body = await req.json();
    slides = Array.isArray(body.slides) ? body.slides : [];
    legenda = typeof body.legenda === "string" ? body.legenda : "";
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }
  if (!slides.length) {
    return NextResponse.json({ error: "Nada pra publicar." }, { status: 400 });
  }

  // o Meta busca a imagem por URL pública — usa a origem da requisição (produção).
  const origin = req.nextUrl.origin;
  if (origin.includes("localhost") || origin.includes("127.0.0.1")) {
    return NextResponse.json(
      { error: "Publicação só funciona no site publicado (o Instagram não acessa localhost)." },
      { status: 400 },
    );
  }
  const imageUrls = slides.map((s) => ogUrl(origin, s));

  try {
    const { id } = await publicarInstagram({
      igUserId: process.env.IG_USER_ID!,
      token: process.env.META_ACCESS_TOKEN!,
      imageUrls,
      legenda,
    });
    return NextResponse.json({ ok: true, id });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao publicar." },
      { status: 502 },
    );
  }
}
