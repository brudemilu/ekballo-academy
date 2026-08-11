import { NextResponse } from "next/server";
import { getCurrentSession, dispensarLeitura } from "@/lib/db";

// "Tirar da lista" — some com o livro da seção "Continuando a leitura" sem
// apagar nenhum progresso. Ele volta sozinho se o discípulo abrir ou concluir
// outra mesa depois disso.
export async function POST(req: Request) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }

  let cursoId: string | undefined;
  try {
    ({ cursoId } = (await req.json()) as { cursoId?: string });
  } catch {
    // corpo inválido cai no 400 abaixo
  }
  if (!cursoId) {
    return NextResponse.json({ ok: false, erro: "cursoId é obrigatório" }, { status: 400 });
  }

  await dispensarLeitura(session.userId, cursoId);
  return NextResponse.json({ ok: true });
}
