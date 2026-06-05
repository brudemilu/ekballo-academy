import { NextRequest, NextResponse } from "next/server";
import { createServiceClient } from "@/lib/supabase/service";
import { publicarInstagram, instagramConfigurado } from "@/lib/instagram-publish";

export const runtime = "nodejs";
export const maxDuration = 60;

// Chamado pelo Vercel Cron (a cada minuto). Publica os carrosséis cujo horário
// agendado já chegou. Protegido por CRON_SECRET (o Vercel manda no header).

type SlideRow = {
  texto: string;
  prompt: string;
  modo: string;
  cor: string;
  fonte: string;
  seed: number;
  top?: string;
  ref?: string;
  imageUrl?: string;
};

function ogUrl(origin: string, s: SlideRow): string {
  if (s.imageUrl) return s.imageUrl;
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

export async function GET(req: NextRequest) {
  // auth: o Vercel Cron envia "Authorization: Bearer <CRON_SECRET>"
  const secret = process.env.CRON_SECRET;
  const auth = req.headers.get("authorization");
  if (secret && auth !== `Bearer ${secret}`) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }
  if (!instagramConfigurado()) {
    return NextResponse.json({ error: "Instagram não configurado" }, { status: 503 });
  }

  const origin = req.nextUrl.origin;
  const supabase = createServiceClient();

  // pega os que já venceram (limite pequeno por execução)
  const { data: pendentes, error } = await supabase
    .from("instagram_carrosseis")
    .select("id, slides, legenda")
    .eq("status", "agendado")
    .lte("agendado_para", new Date().toISOString())
    .order("agendado_para", { ascending: true })
    .limit(1);

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  if (!pendentes?.length) return NextResponse.json({ ok: true, publicados: 0 });

  const resultados: { id: string; ok: boolean; erro?: string }[] = [];
  for (const post of pendentes) {
    const slides = Array.isArray(post.slides) ? (post.slides as SlideRow[]) : [];
    try {
      if (!slides.length) throw new Error("sem slides");
      const imageUrls = slides.map((s) => ogUrl(origin, s));
      const { id: postId } = await publicarInstagram({
        igUserId: process.env.IG_USER_ID!,
        token: process.env.META_ACCESS_TOKEN!,
        imageUrls,
        legenda: post.legenda || "",
      });
      await supabase
        .from("instagram_carrosseis")
        .update({ status: "publicado", publicado_em: new Date().toISOString(), ig_post_id: postId, erro: null })
        .eq("id", post.id);
      resultados.push({ id: post.id, ok: true });
    } catch (e) {
      const msg = e instanceof Error ? e.message : "falha";
      await supabase.from("instagram_carrosseis").update({ status: "erro", erro: msg }).eq("id", post.id);
      resultados.push({ id: post.id, ok: false, erro: msg });
    }
  }

  return NextResponse.json({ ok: true, publicados: resultados.filter((r) => r.ok).length, resultados });
}
