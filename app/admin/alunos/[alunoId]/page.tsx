import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { MatriculaToggle } from "@/components/MatriculaToggle";
import {
  getCurrentSession,
  getAlunoById,
  listAllCursos,
  listMatriculasByAluno,
} from "@/lib/db";

export default async function AdminAlunoPage({
  params,
}: {
  params: Promise<{ alunoId: string }>;
}) {
  const { alunoId } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const aluno = await getAlunoById(alunoId);
  if (!aluno) notFound();

  const [cursos, matriculas] = await Promise.all([
    listAllCursos(),
    listMatriculasByAluno(alunoId),
  ]);
  const matriculadosSet = new Set(matriculas.map((m) => m.curso_id));

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-4xl items-center justify-between px-6 py-4">
          <Link href="/admin">
            <Logo />
          </Link>
          <UserMenu nome={session.profile.nome} email={session.profile.email || session.email} isAdmin />
        </nav>
      </header>

      <div className="mx-auto max-w-4xl px-6 py-12">
        <Link href="/admin/alunos" className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800">
          ← Discípulos
        </Link>

        <div className="mb-10 rounded-2xl border border-mesa-200 bg-white p-8">
          <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Discípulo
          </p>
          <h1 className="mb-2 font-serif text-3xl font-semibold text-mesa-800">
            {aluno.nome || "(sem nome)"}
          </h1>
          <p className="text-mesa-600">{aluno.email}</p>
          <div className="mt-3 flex flex-wrap gap-2 text-sm">
            {aluno.turma && (
              <span className="rounded-full bg-mesa-100 px-3 py-1 text-mesa-700">
                {aluno.turma}
              </span>
            )}
            {aluno.is_admin && (
              <span className="rounded-full bg-oliveira-100 px-3 py-1 text-oliveira-700">
                Admin
              </span>
            )}
            <span className="rounded-full bg-mesa-50 px-3 py-1 text-mesa-500">
              Cadastro em {new Date(aluno.created_at).toLocaleDateString("pt-BR")}
            </span>
          </div>
        </div>

        <h2 className="mb-2 font-serif text-2xl font-semibold text-mesa-800">
          Matrículas
        </h2>
        <p className="mb-6 text-sm text-mesa-600">
          Marque os cursos em que este discípulo deve ter acesso.
        </p>

        {cursos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
            <p className="text-mesa-500">Nenhum curso disponível ainda.</p>
          </div>
        ) : (
          <ul className="space-y-3">
            {cursos.map((c) => {
              const matriculado = matriculadosSet.has(c.id);
              return (
                <li
                  key={c.id}
                  className="flex flex-wrap items-center justify-between gap-4 rounded-xl border border-mesa-200 bg-white p-5"
                >
                  <div className="min-w-0 flex-1">
                    <div className="mb-1 flex flex-wrap items-center gap-2">
                      <h3 className="font-serif text-lg font-semibold text-mesa-800">
                        {c.titulo}
                      </h3>
                      {!c.publicado && (
                        <span className="rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">
                          Rascunho
                        </span>
                      )}
                      {c.is_pago && (
                        <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-xs font-medium text-mesa-700">
                          Pago
                        </span>
                      )}
                    </div>
                    <p className="line-clamp-2 text-sm text-mesa-600">{c.descricao}</p>
                  </div>
                  <MatriculaToggle
                    alunoId={alunoId}
                    cursoId={c.id}
                    cursoTitulo={c.titulo}
                    matriculadoInicial={matriculado}
                  />
                </li>
              );
            })}
          </ul>
        )}
      </div>
    </main>
  );
}
