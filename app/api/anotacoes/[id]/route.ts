import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { podeUsarCaderno } from "@/lib/permissoes";
import {
  getAnotacao,
  atualizarAnotacao,
  excluirAnotacao,
  type EntradaAnotacao,
} from "@/lib/anotacoes";

type Ctx = { params: Promise<{ id: string }> };

export async function GET(_req: Request, { params }: Ctx) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 });
  }
  const { id } = await params;
  const anotacao = await getAnotacao(id, session.userId);
  if (!anotacao) {
    return NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 });
  }
  return NextResponse.json({ ok: true, anotacao });
}

// O autosave do editor bate aqui a cada pausa de digitação — por isso o PATCH
// aceita qualquer subconjunto dos campos e devolve a linha já atualizada
// (o editor usa `atualizado_em` do banco pra mostrar "salvo às HH:MM").
export async function PATCH(req: Request, { params }: Ctx) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 });
  }
  const { id } = await params;

  let corpo: EntradaAnotacao;
  try {
    corpo = (await req.json()) as EntradaAnotacao;
  } catch {
    return NextResponse.json({ ok: false, erro: "corpo inválido" }, { status: 400 });
  }

  const anotacao = await atualizarAnotacao(id, session.userId, corpo);
  if (!anotacao) {
    return NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 });
  }
  return NextResponse.json({ ok: true, anotacao });
}

export async function DELETE(_req: Request, { params }: Ctx) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 });
  }
  const { id } = await params;
  const ok = await excluirAnotacao(id, session.userId);
  if (!ok) {
    return NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 });
  }
  return NextResponse.json({ ok: true });
}
