import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession, salvarCarrosselInstagram, deletarCarrosselInstagram } from "@/lib/db";

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

  let body: { conteudo?: string; slides?: unknown[]; legenda?: string; agendadoPara?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }

  const slides = Array.isArray(body.slides) ? body.slides : [];
  if (!slides.length) {
    return NextResponse.json({ error: "Nada pra salvar — monte o carrossel primeiro." }, { status: 400 });
  }

  // valida a data de agendamento (se houver): tem que ser no futuro
  let agendadoPara: string | null = null;
  if (body.agendadoPara) {
    const t = new Date(body.agendadoPara).getTime();
    if (Number.isNaN(t)) {
      return NextResponse.json({ error: "Data de agendamento inválida." }, { status: 400 });
    }
    if (t < Date.now() - 60_000) {
      return NextResponse.json({ error: "A data de agendamento já passou." }, { status: 400 });
    }
    agendadoPara = new Date(t).toISOString();
  }

  try {
    const { id } = await salvarCarrosselInstagram({
      conteudo: typeof body.conteudo === "string" ? body.conteudo : "",
      // o facade aceita o formato dos slides do editor
      slides: slides as never,
      legenda: typeof body.legenda === "string" ? body.legenda : "",
      agendadoPara,
    });
    return NextResponse.json({ ok: true, id, agendado: Boolean(agendadoPara) });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao salvar." },
      { status: 500 },
    );
  }
}

/** DELETE /api/admin/instagram?id=<uuid> — exclui rascunho/agendamento. */
export async function DELETE(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }
  const id = req.nextUrl.searchParams.get("id");
  if (!id) return NextResponse.json({ error: "id obrigatório" }, { status: 400 });
  try {
    await deletarCarrosselInstagram(id);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao excluir." },
      { status: 500 },
    );
  }
}
