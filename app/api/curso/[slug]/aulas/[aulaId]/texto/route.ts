import { NextResponse } from "next/server";
import { getAula, getCurrentSession, getCursoBySlug, isMatriculado } from "@/lib/db";

// Texto de uma mesa para a janela "leitura ao lado" (issue #283): o guia de
// estudo indica "Leia Stott (cap. 3…)" e a leitura abre sem tirar o discípulo
// do guia. Mesma regra da página da mesa: matrícula no curso, ou admin.
//   GET /api/curso/<slug>/aulas/<aulaId>/texto -> { ok, titulo, conteudo }
export const dynamic = "force-dynamic";

export async function GET(
  _req: Request,
  ctx: { params: Promise<{ slug: string; aulaId: string }> },
) {
  const { slug, aulaId } = await ctx.params;
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }

  const curso = await getCursoBySlug(slug);
  if (!curso)
    return NextResponse.json(
      { ok: false, erro: "curso não encontrado" },
      { status: 404 },
    );

  if (!session.profile?.is_admin && !(await isMatriculado(session.userId, curso.id))) {
    return NextResponse.json(
      { ok: false, erro: "sem matrícula neste curso" },
      { status: 403 },
    );
  }

  const aula = await getAula(aulaId, curso.id);
  if (!aula)
    return NextResponse.json(
      { ok: false, erro: "mesa não encontrada" },
      { status: 404 },
    );

  return NextResponse.json({
    ok: true,
    titulo: aula.titulo,
    conteudo: aula.conteudo ?? "",
  });
}
