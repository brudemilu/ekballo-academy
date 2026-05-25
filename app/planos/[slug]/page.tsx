import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getCurrentSession, getCursoBySlug, isMatriculado } from "@/lib/db";
import {
  getPlanoBySlug,
  listDiasDoPlano,
  listProgressoDoAluno,
  proximoDiaPendente,
} from "@/lib/planos";

export default async function PlanoPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  // Gate de matrícula: aluno precisa estar matriculado no "curso" do plano.
  // Admin tem acesso livre. (Trigger handle_new_user já matricula automático.)
  if (!session.profile?.is_admin) {
    const curso = await getCursoBySlug(slug);
    if (!curso) redirect("/dashboard");
    const matriculado = await isMatriculado(session.userId, curso.id);
    if (!matriculado) redirect("/dashboard");
  }

  const plano = await getPlanoBySlug(slug);
  if (!plano) notFound();

  const [dias, concluidos, proximo] = await Promise.all([
    listDiasDoPlano(plano.id),
    listProgressoDoAluno(plano.id, session.userId),
    proximoDiaPendente(plano.id, session.userId, plano.dias_total),
  ]);

  const totalConcluidos = concluidos.size;
  const progressoPct = Math.round((totalConcluidos / plano.dias_total) * 100);
  const tudoConcluido = totalConcluidos === plano.dias_total;

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-5xl items-center justify-between px-6 py-4">
          <Link href={session.profile?.is_admin ? "/admin" : "/dashboard"}>
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin={!!session.profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-5xl px-6 py-12">
        <Link
          href={session.profile?.is_admin ? "/admin" : "/dashboard"}
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Voltar
        </Link>

        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Plano de Leitura
        </p>
        <h1 className="mb-3 font-serif text-4xl font-semibold text-mesa-800">
          {plano.nome}
        </h1>
        {plano.descricao && (
          <p className="mb-8 max-w-2xl text-mesa-700 text-justify hyphens-auto">
            {plano.descricao}
          </p>
        )}

        {/* Progresso geral */}
        <div className="mb-8 rounded-2xl border border-mesa-200 bg-white p-6">
          <div className="mb-3 flex flex-wrap items-end justify-between gap-2">
            <div>
              <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
                Seu progresso
              </p>
              <p className="mt-1 font-serif text-3xl font-semibold text-mesa-800">
                {totalConcluidos}{" "}
                <span className="text-mesa-400">/ {plano.dias_total} dias</span>
              </p>
            </div>
            <p className="font-serif text-2xl font-semibold text-oliveira-700">
              {progressoPct}%
            </p>
          </div>
          <div className="mb-4 h-2 overflow-hidden rounded-full bg-mesa-100">
            <div
              className="h-full rounded-full bg-gradient-to-r from-laranja-500 to-oliveira-500 transition-all"
              style={{ width: `${progressoPct}%` }}
            />
          </div>
          {!tudoConcluido ? (
            <Link
              href={`/planos/${slug}/dia/${proximo}`}
              className="inline-block rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
            >
              {totalConcluidos === 0
                ? "Começar hoje (dia 1) →"
                : `Continuar — dia ${proximo} →`}
            </Link>
          ) : (
            <div className="rounded-lg border border-oliveira-300 bg-oliveira-50 px-4 py-3 text-sm font-medium text-oliveira-800">
              🎉 Plano concluído! Da Capa à Capa.
            </div>
          )}
        </div>

        {/* Grid de dias */}
        <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
          Todos os dias
        </h2>
        <div className="grid grid-cols-2 gap-2 sm:grid-cols-3 md:grid-cols-4">
          {dias.map((d) => {
            const ok = concluidos.has(d.dia);
            const isProximo = !ok && d.dia === proximo;
            return (
              <Link
                key={d.dia}
                href={`/planos/${slug}/dia/${d.dia}`}
                className={`block rounded-lg border px-3 py-2.5 text-sm transition ${
                  ok
                    ? "border-oliveira-200 bg-oliveira-50 text-oliveira-800 hover:bg-oliveira-100"
                    : isProximo
                      ? "border-mesa-400 bg-mesa-50 text-mesa-800 hover:bg-mesa-100"
                      : "border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-50"
                }`}
              >
                <div className="flex items-center justify-between gap-2">
                  <div className="min-w-0">
                    <p className="text-[10px] font-medium uppercase tracking-wider text-mesa-500">
                      Dia {d.dia}
                      {d.data_sugerida && (
                        <span className="ml-1 normal-case tracking-normal text-mesa-400">
                          · {d.data_sugerida}
                        </span>
                      )}
                    </p>
                    <p className="truncate font-medium">{d.referencia_texto}</p>
                  </div>
                  {ok && (
                    <span className="flex-none text-oliveira-600" aria-label="Concluído">
                      ✓
                    </span>
                  )}
                </div>
              </Link>
            );
          })}
        </div>
      </div>
    </main>
  );
}
