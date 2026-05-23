import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import {
  getCurrentSession,
  getCursoBySlug,
  isMatriculado,
  listAulasComStatus,
  listProgressoByAluno,
} from "@/lib/db";

export default async function CursoPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const curso = await getCursoBySlug(slug);
  if (!curso) notFound();

  // Acesso ao curso é gated por matrícula. Admin tem acesso livre para revisar conteúdo.
  if (!session.profile?.is_admin) {
    const matriculado = await isMatriculado(session.userId, curso.id);
    if (!matriculado) redirect("/dashboard");
  }

  const [aulasRaw, progresso] = await Promise.all([
    listAulasComStatus(curso.id, session.userId),
    listProgressoByAluno(session.userId),
  ]);

  // Admin tem acesso livre — todas as aulas desbloqueadas pra revisão.
  const aulas = session.profile?.is_admin
    ? aulasRaw.map((a) => ({ ...a, desbloqueada: true }))
    : aulasRaw;

  const concluidas = new Set(progresso.map((p) => p.aula_id));

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

      <div className="mx-auto max-w-4xl px-6 py-12">
        <Link
          href="/dashboard"
          className="mb-8 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Voltar
        </Link>

        <div className="mb-12 rounded-2xl border border-mesa-200 bg-white p-8 shadow-sm sm:p-10">
          <div className="mb-4 flex items-center gap-2">
            {curso.is_pago ? (
              <span className="rounded-full bg-mesa-100 px-2.5 py-0.5 text-xs font-medium text-mesa-700">
                Pago
              </span>
            ) : (
              <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-medium text-oliveira-700">
                Gratuito
              </span>
            )}
          </div>
          <h1 className="mb-4 font-serif text-4xl font-semibold text-mesa-800">
            {curso.titulo}
          </h1>
          {curso.descricao && (
            <p className="text-lg leading-relaxed text-mesa-700 text-justify hyphens-auto">
              {curso.descricao}
            </p>
          )}
        </div>

        <h2 className="mb-6 font-serif text-2xl font-semibold text-mesa-800">
          Aulas
        </h2>

        {aulas.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
            <p className="font-serif text-lg text-mesa-500">
              As aulas estão sendo preparadas.
            </p>
          </div>
        ) : (
          <ol className="space-y-3">
            {aulas.map((aula, idx) => {
              const concluida = concluidas.has(aula.id) || aula.completa;
              const bloqueada = !aula.desbloqueada;
              const conteudo = (
                <div className={`flex items-center gap-5 rounded-xl border p-5 transition ${
                  bloqueada
                    ? "border-mesa-200 bg-mesa-100/40 opacity-60"
                    : "border-mesa-200 bg-white hover:border-mesa-300 hover:bg-mesa-50/50"
                }`}>
                  <div
                    className={`flex h-12 w-12 flex-none items-center justify-center rounded-full font-serif text-lg font-semibold ${
                      bloqueada
                        ? "bg-mesa-200 text-mesa-400"
                        : concluida
                          ? "bg-oliveira-100 text-oliveira-700"
                          : "bg-mesa-100 text-mesa-700"
                    }`}
                  >
                    {bloqueada ? "🔒" : concluida ? "✓" : String(idx + 1).padStart(2, "0")}
                  </div>
                  <div className="flex-1">
                    <h3 className={`font-medium ${bloqueada ? "text-mesa-500" : "text-mesa-800"}`}>
                      {aula.titulo}
                    </h3>
                    {bloqueada ? (
                      <p className="text-xs text-mesa-500">
                        Responda corretamente as questões da aula anterior para desbloquear
                      </p>
                    ) : concluida ? (
                      <p className="text-xs text-oliveira-600">
                        Concluída
                      </p>
                    ) : null}
                  </div>
                  <span className={bloqueada ? "text-mesa-300" : "text-mesa-400"}>→</span>
                </div>
              );
              return (
                <li key={aula.id}>
                  {bloqueada ? (
                    <div>{conteudo}</div>
                  ) : (
                    <Link href={`/cursos/${curso.slug}/aulas/${aula.id}`}>
                      {conteudo}
                    </Link>
                  )}
                </li>
              );
            })}
          </ol>
        )}
      </div>
    </main>
  );
}
