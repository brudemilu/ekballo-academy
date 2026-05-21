import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { AtividadeForm } from "@/components/AtividadeForm";
import { MultiplaEscolhaForm } from "@/components/MultiplaEscolhaForm";
import { MarcarConcluida } from "@/components/MarcarConcluida";
import {
  getCurrentSession,
  getCursoBySlug,
  getAula,
  listAtividadesByAula,
  listRespostasByAluno,
  listAulasComStatus,
  jaConcluiu,
  listAlternativasByAtividade,
  getRespostaAlternativa,
  aulaCompleta,
} from "@/lib/db";

export default async function AulaPage({
  params,
}: {
  params: Promise<{ slug: string; aulaId: string }>;
}) {
  const { slug, aulaId } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const curso = await getCursoBySlug(slug);
  if (!curso) notFound();

  const aula = await getAula(aulaId, curso.id);
  if (!aula) notFound();

  const aulasStatus = await listAulasComStatus(curso.id, session.userId);
  const aulaStatus = aulasStatus.find((a) => a.id === aulaId);
  if (!aulaStatus?.desbloqueada) {
    redirect(`/cursos/${slug}`);
  }

  const [atividades, respostas, concluida] = await Promise.all([
    listAtividadesByAula(aulaId),
    listRespostasByAluno(session.userId),
    jaConcluiu(session.userId, aulaId),
  ]);

  const respostasMap = new Map(respostas.map((r) => [r.atividade_id, r]));
  const indiceAtual = aulasStatus.findIndex((a) => a.id === aulaId);
  const proxima = aulasStatus[indiceAtual + 1];
  const anterior = aulasStatus[indiceAtual - 1];

  // Buscar alternativas e respostas MC para atividades MC
  const atividadesEnriquecidas = await Promise.all(
    atividades.map(async (at) => {
      if (at.tipo === "multipla_escolha") {
        const [alts, altSel] = await Promise.all([
          listAlternativasByAtividade(at.id),
          getRespostaAlternativa(session.userId, at.id),
        ]);
        return { atividade: at, alternativas: alts, alternativaSalvaId: altSel };
      }
      return { atividade: at, alternativas: [], alternativaSalvaId: null };
    })
  );

  const aulaConcluidaMC = await aulaCompleta(session.userId, aula.id);
  const temMCs = atividades.some((a) => a.tipo === "multipla_escolha");

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/dashboard">
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin={!!session.profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-3xl px-6 py-10">
        <Link
          href={`/cursos/${curso.slug}`}
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← {curso.titulo}
        </Link>

        <article className="mb-12 rounded-2xl border border-mesa-200 bg-white p-8 shadow-sm sm:p-12">
          <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Aula {String(indiceAtual + 1).padStart(2, "0")}
          </p>
          <h1 className="mb-8 font-serif text-4xl font-semibold leading-tight text-mesa-800">
            {aula.titulo}
          </h1>

          {aula.video_url && (
            <div className="mb-8 aspect-video overflow-hidden rounded-xl bg-mesa-900">
              <iframe
                src={aula.video_url}
                className="h-full w-full"
                allowFullScreen
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              />
            </div>
          )}

          {aula.conteudo && (
            <div className="prose-mesa">
              {(aula.conteudo as string).split("\n\n").map((paragrafo: string, i: number) => (
                <p key={i} className="whitespace-pre-wrap">
                  {paragrafo}
                </p>
              ))}
            </div>
          )}
        </article>

        {atividades.length > 0 && (
          <div className="mb-12 space-y-5">
            <div className="mb-2">
              <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
                {temMCs ? "Questões da aula" : "Atividades de reflexão"}
              </p>
              <h2 className="font-serif text-2xl font-semibold text-mesa-800">
                {temMCs ? "Responda para liberar a próxima aula." : "Sua resposta importa."}
              </h2>
            </div>
            {atividadesEnriquecidas.map(({ atividade, alternativas, alternativaSalvaId }, idx) => {
              if (atividade.tipo === "multipla_escolha") {
                return (
                  <MultiplaEscolhaForm
                    key={atividade.id}
                    atividadeId={atividade.id}
                    alunoId={session.userId}
                    perguntaIndex={idx}
                    pergunta={atividade.pergunta}
                    razao={atividade.razao}
                    alternativas={alternativas}
                    alternativaSalvaId={alternativaSalvaId}
                  />
                );
              }
              const r = respostasMap.get(atividade.id);
              return (
                <AtividadeForm
                  key={atividade.id}
                  atividadeId={atividade.id}
                  alunoId={session.userId}
                  perguntaIndex={idx}
                  pergunta={atividade.pergunta}
                  respostaInicial={r?.texto || undefined}
                  comentarioLider={r?.comentario_lider}
                />
              );
            })}
          </div>
        )}

        <div className="flex flex-col gap-4 border-t border-mesa-200 pt-8 sm:flex-row sm:items-center sm:justify-between">
          <MarcarConcluida
            alunoId={session.userId}
            aulaId={aula.id}
            jaConcluida={concluida}
          />
          <div className="flex gap-2">
            {anterior && (
              <Link
                href={`/cursos/${curso.slug}/aulas/${anterior.id}`}
                className="rounded-full border border-mesa-200 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 hover:bg-mesa-50"
              >
                ← Anterior
              </Link>
            )}
            {proxima && (
              temMCs && !aulaConcluidaMC ? (
                <span
                  className="rounded-full border border-mesa-200 bg-mesa-100/60 px-5 py-2.5 text-sm font-medium text-mesa-500"
                  title="Acerte todas as questões para liberar"
                >
                  🔒 Próxima aula bloqueada
                </span>
              ) : (
                <Link
                  href={`/cursos/${curso.slug}/aulas/${proxima.id}`}
                  className="rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
                >
                  Próxima aula →
                </Link>
              )
            )}
          </div>
        </div>
      </div>
    </main>
  );
}
