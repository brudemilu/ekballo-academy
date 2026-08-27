import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { podeUsarCaderno } from "@/lib/permissoes";
import { excluirAnexo } from "@/lib/anotacoes-anexos";

type Ctx = { params: Promise<{ anexoId: string }> };

export async function DELETE(_req: Request, { params }: Ctx) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 });
  }
  const { anexoId } = await params;
  const ok = await excluirAnexo(anexoId, session.userId);
  if (!ok) {
    return NextResponse.json({ ok: false, erro: "não encontrado" }, { status: 404 });
  }
  return NextResponse.json({ ok: true });
}
