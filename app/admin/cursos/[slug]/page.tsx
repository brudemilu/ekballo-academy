import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession, getCursoProgressao } from "@/lib/db";

export default async function AdminCursoProgressaoPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const data = await getCursoProgressao(slug);
  if (!data) notFound();

  const { curso, totalAulas, totalMatriculados, totalConcluidos, alunosComTelefone, aulas, alunos } = data;
  const taxaConclusaoCurso =
    totalMatriculados > 0
      ? Math.round((totalConcluidos / totalMatriculados) * 100)
      : 0;

  // Identifica aula gargalo: aula desbloqueada mas com menor taxa de conclusão
  const gargalo =
    [...aulas]
      .sort((a, b) => a.taxaConclusao - b.taxaConclusao)
      .find((a) => a.totalAtividades > 0) || null;

  return (
    <AdminShell current="cursos" session={session}>
      <Link
        href="/admin/cursos"
        className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800"
      >
        ← Todas as temáticas
      </Link>

      <div className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Progresso da temática
      </div>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        {curso.titulo}
      </h1>
      {curso.descricao && (
        <p className="mb-6 max-w-2xl text-sm text-mesa-600">{curso.descricao}</p>
      )}

      {/* Stats agregados */}
      <div className="mb-10 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <StatCard label="Aulas" value={totalAulas} />
        <StatCard label="Matriculados" value={totalMatriculados} />
        <StatCard
          label="Concluíram"
          value={totalConcluidos}
          hint={`${taxaConclusaoCurso}%`}
          accent="oliveira"
        />
        <StatCard
          label="Com WhatsApp"
          value={alunosComTelefone}
          hint={
            totalMatriculados > 0
              ? `${Math.round((alunosComTelefone / totalMatriculados) * 100)}%`
              : undefined
          }
        />
      </div>

      {/* Progresso por aula */}
      <section className="mb-10">
        <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
          Funil por aula
        </h2>
        {aulas.length === 0 ? (
          <p className="text-sm text-mesa-500">Este curso ainda não tem aulas.</p>
        ) : (
          <div className="space-y-2 rounded-2xl border border-mesa-200 bg-white p-5">
            {aulas.map((a) => {
              const ehGargalo = gargalo?.id === a.id && a.taxaConclusao < 80;
              return (
                <div
                  key={a.id}
                  className="flex flex-wrap items-center gap-3 sm:gap-4"
                >
                  <div className="w-7 flex-none text-right font-mono text-xs text-mesa-500">
                    {a.ordem}.
                  </div>
                  <div className="min-w-0 flex-1">
                    <div className="flex flex-wrap items-baseline justify-between gap-2">
                      <p className="truncate font-medium text-mesa-800">
                        {a.titulo}
                      </p>
                      <p className="flex-none text-xs text-mesa-500">
                        {a.alunosCompletos}/{totalMatriculados} ·{" "}
                        <span
                          className={
                            ehGargalo ? "font-medium text-amber-700" : ""
                          }
                        >
                          {a.taxaConclusao}%
                        </span>
                      </p>
                    </div>
                    <div className="mt-1.5 h-1.5 overflow-hidden rounded-full bg-mesa-100">
                      <div
                        className={`h-full rounded-full ${
                          a.taxaConclusao >= 80
                            ? "bg-oliveira-500"
                            : a.taxaConclusao >= 40
                              ? "bg-mesa-500"
                              : "bg-amber-500"
                        }`}
                        style={{ width: `${a.taxaConclusao}%` }}
                      />
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        )}
        {gargalo && gargalo.taxaConclusao < 80 && totalMatriculados >= 2 && (
          <p className="mt-3 text-xs text-amber-700">
            ⚠ Gargalo: a aula <strong>{gargalo.titulo}</strong> tem só{" "}
            {gargalo.taxaConclusao}% de conclusão. Vale uma devolutiva por aí.
          </p>
        )}
      </section>

      {/* Discípulos */}
      <section>
        <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
          Discípulos ({alunos.length})
        </h2>
        {alunos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
            <p className="text-mesa-500">Ninguém matriculado ainda.</p>
          </div>
        ) : (
          <div className="overflow-hidden rounded-2xl border border-mesa-200 bg-white">
            <table className="w-full">
              <thead className="border-b border-mesa-200 bg-mesa-50/50 text-left">
                <tr>
                  <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                    Discípulo
                  </th>
                  <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                    Progresso
                  </th>
                  <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                    Em qual aula está
                  </th>
                  <th className="px-6 py-3"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-mesa-100">
                {alunos.map((a) => (
                  <tr key={a.id} className="hover:bg-mesa-50/40">
                    <td className="px-6 py-4">
                      <Link
                        href={`/admin/cursos/${slug}/alunos/${a.id}`}
                        className="block"
                      >
                        <p className="font-medium text-mesa-800 hover:underline">
                          {a.nome || a.email}
                        </p>
                        <p className="text-xs text-mesa-500">{a.email}</p>
                      </Link>
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-3">
                        <div className="h-1.5 w-28 overflow-hidden rounded-full bg-mesa-100">
                          <div
                            className={`h-full ${
                              a.concluidoEm
                                ? "bg-oliveira-500"
                                : a.progresso >= 50
                                  ? "bg-mesa-500"
                                  : "bg-amber-500"
                            }`}
                            style={{ width: `${a.progresso}%` }}
                          />
                        </div>
                        <span className="text-sm font-medium text-mesa-800">
                          {a.progresso}%
                        </span>
                        <span className="text-xs text-mesa-500">
                          ({a.aulasCompletas}/{totalAulas})
                        </span>
                      </div>
                    </td>
                    <td className="px-6 py-4 text-sm text-mesa-600">
                      {a.concluidoEm ? (
                        <span className="rounded-full bg-oliveira-100 px-2 py-0.5 text-xs font-medium text-oliveira-700">
                          Concluído
                        </span>
                      ) : a.aulaAtualTitulo ? (
                        <span className="text-mesa-700">
                          <span className="text-mesa-400">
                            {a.aulaAtualOrdem}.
                          </span>{" "}
                          {a.aulaAtualTitulo}
                        </span>
                      ) : (
                        <span className="text-mesa-400">—</span>
                      )}
                    </td>
                    <td className="px-6 py-4 text-right">
                      <Link
                        href={`/admin/cursos/${slug}/alunos/${a.id}`}
                        className="rounded-full border border-mesa-200 bg-white px-4 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
                      >
                        Detalhes
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </section>
    </AdminShell>
  );
}

function StatCard({
  label,
  value,
  hint,
  accent,
}: {
  label: string;
  value: number;
  hint?: string;
  accent?: "oliveira";
}) {
  const color =
    accent === "oliveira" ? "text-oliveira-700" : "text-mesa-700";
  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6">
      <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
        {label}
      </p>
      <p className={`mt-2 font-serif text-4xl font-semibold ${color}`}>
        {value}
      </p>
      {hint && <p className="mt-1 text-xs text-mesa-500">{hint}</p>}
    </div>
  );
}
