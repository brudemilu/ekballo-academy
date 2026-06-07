import { NextRequest, NextResponse } from "next/server";
import {
  getCurrentSession,
  addCompromisso,
  deleteCompromisso,
} from "@/lib/db";

// Agenda pessoal — compromissos manuais.
//   POST   {titulo, inicio(ISO), fim?(ISO), diaTodo?, local?, nota?}  -> cria
//   DELETE {id}                                                       -> remove
// Só admin.

async function exigirAdmin() {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return { erro: NextResponse.json({ erro: "não autorizado" }, { status: 403 }), session: null };
  }
  return { erro: null, session };
}

export async function POST(req: NextRequest) {
  const { erro, session } = await exigirAdmin();
  if (erro) return erro;

  const body = await req.json().catch(() => ({}));
  const titulo = String(body.titulo || "").trim();
  const inicio = String(body.inicio || "").trim();
  if (!titulo || !inicio) {
    return NextResponse.json({ erro: "título e início são obrigatórios" }, { status: 400 });
  }
  if (Number.isNaN(Date.parse(inicio))) {
    return NextResponse.json({ erro: "data de início inválida" }, { status: 400 });
  }

  await addCompromisso({
    titulo,
    inicio,
    fim: body.fim && !Number.isNaN(Date.parse(body.fim)) ? String(body.fim) : null,
    dia_todo: !!body.diaTodo,
    local: String(body.local || "").trim() || null,
    nota: String(body.nota || "").trim() || null,
    criado_por: session!.userId,
  });
  return NextResponse.json({ ok: true });
}

export async function DELETE(req: NextRequest) {
  const { erro } = await exigirAdmin();
  if (erro) return erro;

  const body = await req.json().catch(() => ({}));
  const id = String(body.id || "").trim();
  if (!id) return NextResponse.json({ erro: "id obrigatório" }, { status: 400 });

  await deleteCompromisso(id);
  return NextResponse.json({ ok: true });
}
