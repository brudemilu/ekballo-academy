import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { AtividadeForm } from "@/components/AtividadeForm";
import { MarcarConcluida } from "@/components/MarcarConcluida";
import { AulaConteudo } from "@/components/AulaConteudo";
import { LeitorMesa } from "@/components/LeitorMesa";
import { rotuloNumeroAula } from "@/lib/aula-numero";
import {
  getCurrentSession,
  getCursoBySlug,
  getAula,
  getMaterialUrl,
  getAudioUrl,
  isMatriculado,
  listAtividadesByAula,
  listRespostasByAluno,
  listAulasComStatus,
  listDestaquesByAula,
  jaConcluiu,
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

  // Sem matrícula, sem acesso. Admin tem acesso livre.
  if (!session.profile?.is_admin) {
    const matriculado = await isMatriculado(session.userId, curso.id);
    if (!matriculado) redirect("/dashboard");
  }

  const aula = await getAula(aulaId, curso.id);
  if (!aula) notFound();

  // Mesa de discipulado: toda mesa é acessível, sem desbloqueio linear.
  // aulasStatus é usado só para navegação (anterior/próxima) e progresso.
  const aulasStatus = await listAulasComStatus(curso.id, session.userId, true);

  const [atividades, respostas, concluida, materialUrl, audioUrl, leituraUrl, destaques] = await Promise.all([
    listAtividadesByAula(aulaId),
    listRespostasByAluno(session.userId),
    jaConcluiu(session.userId, aulaId),
    getMaterialUrl(aula.material_url),
    getAudioUrl(aula.audio_url),
    getAudioUrl(aula.audio_leitura_url),
    listDestaquesByAula(session.userId, aulaId),
  ]);

  const respostasMap = new Map(respostas.map((r) => [r.atividade_id, r]));
  const indiceAtual = aulasStatus.findIndex((a) => a.id === aulaId);
  const proxima = aulasStatus[indiceAtual + 1];
  const anterior = aulasStatus[indiceAtual - 1];

  // Mesa de discipulado: toda pergunta (reflexão ou MC herdada do modelo antigo)
  // é exibida como reflexão aberta — sem resposta certa nem pontos.
  // "anotacao" é o caderno da mesa (reflexão com razao='anotacao', não obrigatória).
  const temPerguntas = atividades.some((a) => !(a.tipo === "reflexao" && a.razao === "anotacao"));
  const temAnotacoes = atividades.some((a) => a.tipo === "reflexao" && a.razao === "anotacao");
  const temAtividades = atividades.length > 0;

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
            Mesa {rotuloNumeroAula(aula)}
          </p>
          <h1 className="mb-8 font-serif text-4xl font-semibold leading-tight text-mesa-800">
            {aula.titulo}
          </h1>

          {aula.conteudo && (
            <LeitorMesa
              conteudo={aula.conteudo as string}
              titulo={aula.titulo}
              mesaLabel={`Mesa ${rotuloNumeroAula(aula)}`}
              autor={curso.autor ?? null}
              aulaId={aula.id}
            />
          )}

          {materialUrl && (
            <a
              href={materialUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="mb-8 flex items-start gap-3 rounded-xl border border-laranja-200 bg-laranja-50 p-4 transition hover:border-laranja-300 hover:bg-laranja-100"
            >
              <span className="text-2xl leading-none">📖</span>
              <div className="flex-1">
                <p className="text-xs font-medium uppercase tracking-[0.2em] text-laranja-600">
                  Material complementar
                </p>
                <p className="mt-0.5 text-sm font-medium text-mesa-800">
                  Baixar PDF →
                </p>
              </div>
            </a>
          )}

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

          {audioUrl && (
            <div className="mb-8 rounded-xl border border-oliveira-200 bg-oliveira-50 p-4">
              <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-oliveira-700">
                🎧 Ouça esta mesa — conversa-resumo
              </p>
              <audio controls preload="none" className="w-full">
                <source src={audioUrl} />
                Seu navegador não suporta áudio.
              </audio>
            </div>
          )}

          {leituraUrl && (
            <div className="mb-8 rounded-xl border border-mesa-200 bg-mesa-50 p-4">
              <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-600">
                🔊 Ouça a leitura desta mesa — narração do texto
              </p>
              <audio controls preload="none" className="w-full">
                <source src={leituraUrl} />
                Seu navegador não suporta áudio.
              </audio>
            </div>
          )}

          {aula.conteudo && (
            <AulaConteudo
              conteudo={aula.conteudo as string}
              aulaId={aula.id}
              alunoId={session.userId}
              livroTitulo={curso.titulo}
              autor={curso.autor ?? null}
              destaquesIniciais={destaques}
            />
          )}
        </article>

        {atividades.length > 0 && (
          <div className="mb-12 space-y-5">
            <div className="mb-2">
              <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
                {temPerguntas && temAnotacoes
                  ? "Perguntas e anotações"
                  : temPerguntas
                    ? "Perguntas para refletir"
                    : "Anotações da mesa"}
              </p>
              <h2 className="font-serif text-2xl font-semibold text-mesa-800">
                {temPerguntas
                  ? "Reserve um tempo para responder com calma e sinceridade."
                  : "Registre aqui o que esta mesa falou com você."}
              </h2>
            </div>
            {atividades.map((atividade, idx) => {
              const r = respostasMap.get(atividade.id);
              const ehAnotacao = atividade.tipo === "reflexao" && atividade.razao === "anotacao";
              return (
                <AtividadeForm
                  key={atividade.id}
                  atividadeId={atividade.id}
                  alunoId={session.userId}
                  perguntaIndex={idx}
                  pergunta={atividade.pergunta}
                  respostaInicial={r?.texto || undefined}
                  comentarioLider={r?.comentario_lider}
                  variante={ehAnotacao ? "anotacao" : "reflexao"}
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
            proximaHref={
              !temAtividades && proxima
                ? `/cursos/${curso.slug}/aulas/${proxima.id}`
                : null
            }
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
              <Link
                href={`/cursos/${curso.slug}/aulas/${proxima.id}`}
                className="rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
              >
                Próxima mesa →
              </Link>
            )}
          </div>
        </div>
      </div>
    </main>
  );
}
