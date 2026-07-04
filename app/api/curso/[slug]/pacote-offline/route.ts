// Pacote de um curso para uso OFFLINE: devolve, num JSON só, o texto de todas as
// aulas + a URL (assinada) da narração + as perguntas. O cliente baixa isso, busca
// os MP3s e guarda tudo no IndexedDB pra ler/ouvir sem internet.
import { NextRequest, NextResponse } from "next/server";
import {
  getCurrentSession,
  getCursoBySlug,
  listAulasByCurso,
  listAtividadesByAula,
  isMatriculado,
  getAudioUrl,
} from "@/lib/db";

export const dynamic = "force-dynamic";

export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  const { slug } = await params;
  const session = await getCurrentSession();
  if (!session) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  const curso = await getCursoBySlug(slug);
  if (!curso) return NextResponse.json({ erro: "curso não encontrado" }, { status: 404 });

  const admin = !!session.profile?.is_admin;
  if (!admin && !(await isMatriculado(session.userId, curso.id))) {
    return NextResponse.json({ erro: "sem acesso" }, { status: 403 });
  }

  const aulasRaw = await listAulasByCurso(curso.id);
  const aulas = await Promise.all(
    aulasRaw
      .filter((a) => (a.conteudo || "").trim().length > 0)
      .map(async (a) => {
        const [audioUrl, atividades] = await Promise.all([
          getAudioUrl(a.audio_leitura_url),
          listAtividadesByAula(a.id),
        ]);
        return {
          ordem: a.ordem,
          titulo: a.titulo,
          conteudo: a.conteudo || "",
          audioUrl: audioUrl || null,
          perguntas: (atividades || []).map((t) => ({
            ordem: t.ordem,
            pergunta: t.pergunta,
          })),
        };
      })
  );

  return NextResponse.json(
    {
      slug: curso.slug,
      titulo: curso.titulo,
      capaUrl: `/api/og/curso/${curso.slug}?formato=retrato&v=4`,
      aulas,
    },
    { headers: { "Cache-Control": "no-store" } }
  );
}
