import { type NextRequest, NextResponse } from "next/server";
import { validarIdeia } from "@/lib/conteudo-calendario";
import {
  atualizarIdeiaConteudo,
  criarIdeiaConteudo,
  deletarIdeiaConteudo,
  getCurrentSession,
} from "@/lib/db";

export const runtime = "nodejs";

/**
 * Ideias do copiloto de conteúdo (aba Calendário em /admin/instagram). Admin-only.
 *  - POST   { titulo, nota?, formato?, data_planejada? }  → cria
 *  - PATCH  { id, ...campos }                              → edita/move de dia
 *  - DELETE ?id=<uuid>                                     → exclui
 */

async function exigirAdmin() {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

function falha(e: unknown, padrao: string) {
  return NextResponse.json(
    { error: e instanceof Error ? e.message : padrao },
    { status: 500 },
  );
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const corpo = await req.json().catch(() => null);
  const v = validarIdeia(corpo);
  if (!v.ok) return NextResponse.json({ error: v.erro }, { status: 400 });
  try {
    const ideia = await criarIdeiaConteudo({
      ...v.valor,
      titulo: v.valor.titulo as string,
    });
    return NextResponse.json({ ok: true, ideia });
  } catch (e) {
    return falha(e, "Falha ao salvar a ideia.");
  }
}

export async function PATCH(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const corpo = await req.json().catch(() => null);
  const id = corpo && typeof corpo.id === "string" ? corpo.id : "";
  if (!id) return NextResponse.json({ error: "id é obrigatório" }, { status: 400 });
  const v = validarIdeia(corpo, true);
  if (!v.ok) return NextResponse.json({ error: v.erro }, { status: 400 });
  if (!Object.keys(v.valor).length) {
    return NextResponse.json({ error: "Nada para atualizar." }, { status: 400 });
  }
  try {
    await atualizarIdeiaConteudo(id, v.valor);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return falha(e, "Falha ao atualizar a ideia.");
  }
}

export async function DELETE(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const id = req.nextUrl.searchParams.get("id");
  if (!id) return NextResponse.json({ error: "id é obrigatório" }, { status: 400 });
  try {
    await deletarIdeiaConteudo(id);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return falha(e, "Falha ao excluir a ideia.");
  }
}
