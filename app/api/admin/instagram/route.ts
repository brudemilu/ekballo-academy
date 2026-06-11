import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession, salvarCarrosselInstagram, deletarCarrosselInstagram, reagendarCarrosselInstagram, atualizarConteudoCarrosselInstagram } from "@/lib/db";

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

  let body: { conteudo?: string; slides?: unknown[]; legenda?: string; agendadoPara?: string; tipo?: string; videoUrl?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }

  const isReel = body.tipo === "reel";
  const slides = Array.isArray(body.slides) ? body.slides : [];
  if (isReel) {
    if (!body.videoUrl) {
      return NextResponse.json({ error: "Envie um vídeo primeiro." }, { status: 400 });
    }
  } else if (!slides.length) {
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
      tipo: isReel ? "reel" : "carrossel",
      videoUrl: isReel ? body.videoUrl : null,
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

/**
 * PATCH /api/admin/instagram — duas operações sobre um post já salvo:
 *  - reagendar:        { id, agendadoPara }
 *  - editar conteúdo:  { id, slides?, legenda?, conteudo?, videoUrl? }
 * Pode combinar (ex.: editar a legenda e reagendar de uma vez).
 */
export async function PATCH(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }
  let body: {
    id?: string;
    agendadoPara?: string;
    slides?: unknown[];
    legenda?: string;
    conteudo?: string;
    videoUrl?: string;
  };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }
  if (!body.id) {
    return NextResponse.json({ error: "id é obrigatório" }, { status: 400 });
  }

  const temConteudo =
    body.slides !== undefined ||
    body.legenda !== undefined ||
    body.conteudo !== undefined ||
    body.videoUrl !== undefined;
  if (!body.agendadoPara && !temConteudo) {
    return NextResponse.json({ error: "Nada para atualizar." }, { status: 400 });
  }

  try {
    // 1) edição de conteúdo (slides/legenda/conteúdo/vídeo)
    if (temConteudo) {
      if (body.slides !== undefined && (!Array.isArray(body.slides) || !body.slides.length)) {
        return NextResponse.json({ error: "Um post precisa de pelo menos uma imagem." }, { status: 400 });
      }
      await atualizarConteudoCarrosselInstagram(body.id, {
        slides: body.slides as never,
        legenda: typeof body.legenda === "string" ? body.legenda : undefined,
        conteudo: typeof body.conteudo === "string" ? body.conteudo : undefined,
        videoUrl: typeof body.videoUrl === "string" ? body.videoUrl : undefined,
      });
    }

    // 2) reagendamento (opcional, pode vir junto)
    if (body.agendadoPara) {
      const t = new Date(body.agendadoPara).getTime();
      if (Number.isNaN(t)) {
        return NextResponse.json({ error: "Data inválida." }, { status: 400 });
      }
      if (t < Date.now() - 60_000) {
        return NextResponse.json({ error: "Escolha uma data/hora no futuro." }, { status: 400 });
      }
      await reagendarCarrosselInstagram(body.id, new Date(t).toISOString());
    }

    return NextResponse.json({ ok: true });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao atualizar." },
      { status: 500 },
    );
  }
}
