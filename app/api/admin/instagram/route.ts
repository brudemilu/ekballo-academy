import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession, salvarCarrosselInstagram } from "@/lib/db";

export const runtime = "nodejs";

/**
 * POST /api/admin/instagram  { conteudo, slides, legenda }
 * Salva um rascunho de carrossel. Admin-only.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  let body: { conteudo?: string; slides?: unknown[]; legenda?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }

  const slides = Array.isArray(body.slides) ? body.slides : [];
  if (!slides.length) {
    return NextResponse.json({ error: "Nada pra salvar — monte o carrossel primeiro." }, { status: 400 });
  }

  try {
    const { id } = await salvarCarrosselInstagram({
      conteudo: typeof body.conteudo === "string" ? body.conteudo : "",
      // o facade aceita o formato dos slides do editor
      slides: slides as never,
      legenda: typeof body.legenda === "string" ? body.legenda : "",
    });
    return NextResponse.json({ ok: true, id });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao salvar." },
      { status: 500 },
    );
  }
}
