import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession, getAlunoProgressoNoCurso } from "@/lib/db";
import { displayTelefone } from "@/lib/telefone";

const STATUS_STYLE: Record<
  "completa" | "em-andamento" | "bloqueada" | "nao-iniciada",
  { label: string; bg: string; text: string }
> = {
  completa: { label: "Completa", bg: "bg-oliveira-100", text: "text-oliveira-700" },
  "em-andamento": { label: "Em andamento", bg: "bg-amber-100", text: "text-amber-800" },
  bloqueada: { label: "Bloqueada", bg: "bg-mesa-100", text: "text-mesa-500" },
  "nao-iniciada": { label: "Não iniciada", bg: "bg-mesa-50", text: "text-mesa-500" },
};

export default async function AdminAlunoNoCursoPage({
  params,
}: {
  params: Promise<{ slug: string; alunoId: string }>;
}) {
  const { slug, alunoId } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const data = await getAlunoProgressoNoCurso(slug, alunoId);
  if (!data) notFound();

  const { curso, aluno, matriculadoEm, concluidoEm, totalAulas, aulasCompletas, progresso, aulas } = data;

  return (
    <AdminShell current="cursos" session={session}>
      <Link
        href={`/admin/cursos/${slug}`}
        className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800"
      >
        ← {curso.titulo}
      </Link>

      <div className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Progresso individual
      </div>
      <h1 className="mb-1 font-serif text-3xl font-semibold text-mesa-800">
        {aluno.nome || aluno.email}
      </h1>
      <p className="text-sm text-mesa-600">
        {aluno.email}
        {aluno.telefone && ` · WhatsApp ${displayTelefone(aluno.telefone)}`}
        {aluno.turma && ` · ${aluno.turma}`}
      </p>

      <div className="mt-6 mb-8 rounded-2xl border border-mesa-200 bg-white p-6">
        <div className="flex flex-wrap items-end justify-between gap-4">
          <div>
            <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
              Progresso no curso
            </p>
            <p className="mt-1 font-serif text-4xl font-semibold text-mesa-700">
              {progresso}%
            </p>
            <p className="mt-1 text-sm text-mesa-600">
              {aulasCompletas} de {totalAulas} aulas completas
            </p>
          </div>
          <div className="text-right text-xs text-mesa-500">
            {matriculadoEm && (
              <p>
                Matriculado em{" "}
                {new Date(matriculadoEm).toLocaleDateString("pt-BR")}
              </p>
            )}
            {concluidoEm && (
              <p className="mt-1 text-oliveira-700">
                Concluiu em{" "}
                {new Date(concluidoEm).toLocaleDateString("pt-BR")}
              </p>
            )}
          </div>
        </div>
        <div className="mt-4 h-2 overflow-hidden rounded-full bg-mesa-100">
          <div
            className={`h-full ${
              concluidoEm
                ? "bg-oliveira-500"
                : progresso >= 50
                  ? "bg-mesa-500"
                  : "bg-amber-500"
            }`}
            style={{ width: `${progresso}%` }}
          />
        </div>
      </div>

      <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
        Aulas
      </h2>
      <div className="space-y-4">
        {aulas.map((a) => {
          const s = STATUS_STYLE[a.status];
          return (
            <details
              key={a.aula.id}
              className="group rounded-2xl border border-mesa-200 bg-white"
              open={a.status === "em-andamento"}
            >
              <summary className="flex cursor-pointer flex-wrap items-center justify-between gap-3 px-6 py-4 list-none">
                <div className="min-w-0 flex-1">
                  <div className="flex flex-wrap items-center gap-2">
                    <span className="font-mono text-xs text-mesa-500">
                      {a.aula.ordem}.
                    </span>
                    <h3 className="font-serif text-lg font-semibold text-mesa-800">
                      {a.aula.titulo}
                    </h3>
                    <span
                      className={`rounded-full px-2 py-0.5 text-xs font-medium ${s.bg} ${s.text}`}
                    >
                      {s.label}
                    </span>
                  </div>
                  <p className="mt-1 text-xs text-mesa-500">
                    {a.atividadesRespondidas}/{a.totalAtividades} atividades
                    respondidas
                  </p>
                </div>
                <span className="text-xs text-mesa-500 group-open:hidden">
                  Expandir ↓
                </span>
                <span className="hidden text-xs text-mesa-500 group-open:inline">
                  Fechar ↑
                </span>
              </summary>

              {a.atividades.length === 0 ? (
                <p className="border-t border-mesa-100 px-6 py-4 text-sm text-mesa-500">
                  Esta aula não tem atividades.
                </p>
              ) : (
                <ul className="divide-y divide-mesa-100 border-t border-mesa-100">
                  {a.atividades.map((atv) => (
                    <li key={atv.atividade.id} className="px-6 py-4">
                      <p className="mb-2 text-sm font-medium text-mesa-700">
                        {atv.atividade.pergunta}
                      </p>

                      {atv.atividade.tipo === "multipla_escolha" ? (
                        <div className="space-y-1.5">
                          {atv.alternativas.map((alt) => {
                            const ehSelecionada =
                              atv.alternativaSelecionada === alt.id;
                            const showCorreta =
                              !!atv.alternativaSelecionada && alt.correta;
                            return (
                              <div
                                key={alt.id}
                                className={`flex items-start gap-2 rounded-lg border px-3 py-2 text-sm ${
                                  ehSelecionada
                                    ? atv.respondeuCorreto
                                      ? "border-oliveira-300 bg-oliveira-50 text-oliveira-800"
                                      : "border-red-200 bg-red-50 text-red-800"
                                    : showCorreta
                                      ? "border-oliveira-200 bg-oliveira-50/40 text-oliveira-700"
                                      : "border-mesa-200 bg-white text-mesa-700"
                                }`}
                              >
                                <span className="mt-0.5 inline-block h-4 w-4 flex-none rounded-full border-2 border-current">
                                  {ehSelecionada && (
                                    <span className="block h-full w-full rounded-full bg-current opacity-60" />
                                  )}
                                </span>
                                <span className="flex-1">{alt.texto}</span>
                                {showCorreta && !ehSelecionada && (
                                  <span className="flex-none text-xs">
                                    (gabarito)
                                  </span>
                                )}
                              </div>
                            );
                          })}
                          {!atv.alternativaSelecionada && (
                            <p className="text-xs text-mesa-500">
                              Aluno ainda não respondeu.
                            </p>
                          )}
                        </div>
                      ) : atv.textoReflexao ? (
                        <div className="rounded-lg border border-mesa-200 bg-mesa-50/40 p-3">
                          <div className="prose-mesa whitespace-pre-wrap text-sm text-mesa-800">
                            {atv.textoReflexao}
                          </div>
                          {atv.comentarioLider ? (
                            <div className="mt-3 rounded-md border border-oliveira-200 bg-oliveira-50 p-3">
                              <p className="mb-1 text-xs font-medium text-oliveira-700">
                                Devolutiva enviada
                                {atv.comentarioLiderEm &&
                                  ` em ${new Date(atv.comentarioLiderEm).toLocaleDateString("pt-BR")}`}
                              </p>
                              <p className="whitespace-pre-wrap text-sm text-oliveira-900">
                                {atv.comentarioLider}
                              </p>
                            </div>
                          ) : (
                            <p className="mt-2 text-xs text-amber-700">
                              ⚠ Aguardando devolutiva
                            </p>
                          )}
                          {atv.respostaId && (
                            <Link
                              href={`/admin/respostas/${atv.respostaId}`}
                              className="mt-2 inline-block text-xs text-mesa-600 underline decoration-mesa-300 hover:text-mesa-800"
                            >
                              Abrir resposta completa →
                            </Link>
                          )}
                        </div>
                      ) : (
                        <p className="text-xs text-mesa-500">
                          Aluno ainda não respondeu.
                        </p>
                      )}
                    </li>
                  ))}
                </ul>
              )}
            </details>
          );
        })}
      </div>
    </AdminShell>
  );
}
