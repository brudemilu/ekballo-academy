// Troca o modo de visão do master: administrador ↔ discípulo.
// Só quem é admin de verdade consegue ligar o modo discípulo — e é sempre ele
// mesmo quem desliga. Nenhuma permissão é alterada no banco: o que muda é um
// cookie que a interface consulta pra esconder as ferramentas de administração.
import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { COOKIE_VISAO, VISAO_ALUNO } from "@/lib/permissoes";

export async function POST(request: Request) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json(
      { erro: "Só o administrador troca o modo de visão." },
      { status: 403 },
    );
  }

  const body = (await request.json().catch(() => ({}))) as { modo?: string };
  const paraAluno = body.modo === VISAO_ALUNO;

  const res = NextResponse.json({ ok: true, visaoAluno: paraAluno });
  if (paraAluno) {
    res.cookies.set(COOKIE_VISAO, VISAO_ALUNO, {
      path: "/",
      httpOnly: true,
      sameSite: "lax",
      secure: process.env.NODE_ENV === "production",
      maxAge: 60 * 60 * 24 * 365,
    });
  } else {
    res.cookies.set(COOKIE_VISAO, "", { path: "/", maxAge: 0 });
  }
  return res;
}
