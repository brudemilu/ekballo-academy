import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { podeUsarCaderno } from "@/lib/permissoes";
import { atualizarPasta, excluirPasta } from "@/lib/anotacoes";
import type { CorAnotacao } from "@/lib/anotacoes-meta";

type Ctx = { params: Promise<{ id: string }> };

async function guarda() {
  const session = await getCurrentSession();
  if (!session) return { erro: NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 }) };
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return { erro: NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 }) };
  }
  return { session };
}

export async function PATCH(req: Request, { params }: Ctx) {
  const { session, erro } = await guarda();
  if (erro || !session) return erro;
  const { id } = await params;

  let corpo: { nome?: string; cor?: CorAnotacao; ordem?: number };
  try {
    corpo = (await req.json()) as { nome?: string; cor?: CorAnotacao; ordem?: number };
  } catch {
    return NextResponse.json({ ok: false, erro: "corpo inválido" }, { status: 400 });
  }

  const pasta = await atualizarPasta(id, session.userId, corpo);
  if (!pasta) {
    return NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 });
  }
  return NextResponse.json({ ok: true, pasta });
}

// Apagar a pasta NÃO apaga as anotações: elas voltam pra "Sem pasta".
export async function DELETE(_req: Request, { params }: Ctx) {
  const { session, erro } = await guarda();
  if (erro || !session) return erro;
  const { id } = await params;
  const ok = await excluirPasta(id, session.userId);
  if (!ok) {
    return NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 });
  }
  return NextResponse.json({ ok: true });
}
