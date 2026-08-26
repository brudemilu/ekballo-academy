import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { podeUsarCaderno } from "@/lib/permissoes";
import {
  getAnotacao,
  atualizarAnotacao,
  excluirAnotacao,
  moverParaLixeira,
  restaurarAnotacao,
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

  let corpo: EntradaAnotacao & { restaurar?: boolean };
  try {
    corpo = (await req.json()) as EntradaAnotacao & { restaurar?: boolean };
  } catch {
    return NextResponse.json({ ok: false, erro: "corpo inválido" }, { status: 400 });
  }

  // Tirar da lixeira é um PATCH à parte: `excluida_em` não é campo editável
  // pelo cliente (senão daria pra forjar a data do expurgo).
  if (corpo.restaurar) {
    const ok = await restaurarAnotacao(id, session.userId);
    if (!ok) {
      return NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 });
    }
  }

  const anotacao = await atualizarAnotacao(id, session.userId, corpo);
  if (!anotacao) {
    return NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 });
  }
  return NextResponse.json({ ok: true, anotacao });
}

// Excluir = mover pra lixeira (recuperável por 30 dias).
// `?definitivo=1` apaga de verdade — só do botão dentro da lixeira.
export async function DELETE(req: Request, { params }: Ctx) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 });
  }
  const { id } = await params;
  const definitivo = new URL(req.url).searchParams.get("definitivo") === "1";
  const ok = definitivo
    ? await excluirAnotacao(id, session.userId)
    : await moverParaLixeira(id, session.userId);
  if (!ok) {
    return NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 });
  }
  return NextResponse.json({ ok: true, definitivo });
}
