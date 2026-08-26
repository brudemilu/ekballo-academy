import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { podeUsarCaderno } from "@/lib/permissoes";
import { listAnotacoes, esvaziarLixeira } from "@/lib/anotacoes";

async function guarda() {
  const session = await getCurrentSession();
  if (!session) return { erro: NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 }) };
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return { erro: NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 }) };
  }
  return { session };
}

export async function GET() {
  const { session, erro } = await guarda();
  if (erro || !session) return erro;
  const anotacoes = await listAnotacoes(session.userId, {
    lixeira: true,
    incluirArquivadas: true,
  });
  return NextResponse.json({ ok: true, anotacoes });
}

// Esvaziar a lixeira: apaga de vez tudo que está lá dentro.
export async function DELETE() {
  const { session, erro } = await guarda();
  if (erro || !session) return erro;
  const apagadas = await esvaziarLixeira(session.userId);
  return NextResponse.json({ ok: true, apagadas });
}
