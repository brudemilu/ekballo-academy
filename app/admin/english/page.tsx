import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { AdminEnglishActions } from "@/components/AdminEnglishActions";
import { getCurrentSession } from "@/lib/db";
import { getEnglishAdminStats, listEnglishAlunos, listModulosAdmin } from "@/lib/english";

const NIVEL_ROTULO: Record<string, string> = {
  iniciante: "Iniciante",
  basico: "Básico",
  intermediario: "Intermediário",
};

function diaCurto(iso: string | null): string {
  if (!iso) return "—";
  try {
    return new Intl.DateTimeFormat("pt-BR", {
      timeZone: "America/Sao_Paulo",
      day: "2-digit",
      month: "short",
    }).format(new Date(`${iso}T12:00:00Z`));
  } catch {
    return "—";
  }
}

export default async function AdminEnglishPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const [stats, modulos, alunos] = await Promise.all([
    getEnglishAdminStats(),
    listModulosAdmin(),
    listEnglishAlunos(),
  ]);

  return (
    <AdminShell current="english" session={session}>
      <div className="space-y-8">
        <div>
          <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">Ekballo English</p>
          <h1 className="mt-2 font-serif text-4xl font-semibold text-mesa-900">
            Painel pastoral · gestão e acompanhamento
          </h1>
          <p className="mt-3 max-w-3xl text-lg leading-relaxed text-mesa-600">
            O curso premium de inglês, com trilha própria, prática de fala e rotina diária.
            Aqui você vê o conteúdo publicado e quem está mantendo o ritmo.
          </p>
        </div>

        {/* ---------- números ---------- */}
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <div className="rounded-2xl border border-laranja-200 bg-laranja-50 p-5">
            <p className="text-3xl font-semibold text-laranja-700">
              {stats.modulosPublicados}
              <span className="text-lg text-laranja-600">/{stats.modulos}</span>
            </p>
            <p className="mt-1 text-xs font-semibold uppercase tracking-[0.15em] text-laranja-700">
              Módulos publicados
            </p>
          </div>
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <p className="text-3xl font-semibold text-mesa-900">{stats.licoes}</p>
            <p className="mt-1 text-xs font-semibold uppercase tracking-[0.15em] text-mesa-500">Lições</p>
            <p className="mt-1 text-sm text-mesa-600">{stats.exercicios} exercícios</p>
          </div>
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <p className="text-3xl font-semibold text-mesa-900">{stats.alunosAtivos}</p>
            <p className="mt-1 text-xs font-semibold uppercase tracking-[0.15em] text-mesa-500">
              Discípulos praticando
            </p>
            <p className="mt-1 text-sm text-mesa-600">{stats.licoesConcluidas} lições concluídas</p>
          </div>
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <p className="text-3xl font-semibold text-mesa-900">🔥 {stats.maiorStreak}</p>
            <p className="mt-1 text-xs font-semibold uppercase tracking-[0.15em] text-mesa-500">
              Maior sequência
            </p>
          </div>
        </div>

        <AdminEnglishActions />

        {/* ---------- quem está praticando ---------- */}
        <div className="rounded-3xl border border-mesa-200 bg-white p-6 shadow-sm shadow-mesa-700/5">
          <h2 className="font-serif text-2xl font-semibold text-mesa-800">Quem está praticando</h2>
          <p className="mt-1 text-sm text-mesa-600">
            Ordenado pela sequência atual — quem caiu para zero é quem precisa de um toque.
          </p>

          {alunos.length === 0 ? (
            <p className="mt-6 rounded-2xl border border-dashed border-mesa-300 bg-bege-50 p-6 text-center text-mesa-600">
              Ninguém começou o English ainda. Assim que o primeiro discípulo concluir uma lição,
              ele aparece aqui.
            </p>
          ) : (
            <div className="mt-5 overflow-x-auto">
              <table className="w-full text-left text-sm">
                <thead>
                  <tr className="border-b border-mesa-200 text-xs uppercase tracking-[0.12em] text-mesa-500">
                    <th className="pb-3 pr-4 font-semibold">Discípulo</th>
                    <th className="pb-3 pr-4 font-semibold">Lições</th>
                    <th className="pb-3 pr-4 font-semibold">Sequência</th>
                    <th className="pb-3 pr-4 font-semibold">Recorde</th>
                    <th className="pb-3 font-semibold">Último dia</th>
                  </tr>
                </thead>
                <tbody>
                  {alunos.map((aluno) => (
                    <tr key={aluno.aluno_id} className="border-b border-mesa-100 last:border-0">
                      <td className="py-3 pr-4 font-medium text-mesa-900">{aluno.nome}</td>
                      <td className="py-3 pr-4 tabular-nums text-mesa-700">{aluno.licoes}</td>
                      <td className="py-3 pr-4 tabular-nums text-mesa-700">🔥 {aluno.dias_seguidos}</td>
                      <td className="py-3 pr-4 tabular-nums text-mesa-500">{aluno.recorde}</td>
                      <td className="py-3 text-mesa-600">{diaCurto(aluno.ultimo_dia)}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* ---------- módulos ---------- */}
        <div className="rounded-3xl border border-mesa-200 bg-white p-6 shadow-sm shadow-mesa-700/5">
          <div className="mb-6 flex flex-wrap items-center justify-between gap-4">
            <div>
              <h2 className="font-serif text-2xl font-semibold text-mesa-800">Módulos</h2>
              <p className="mt-1 text-sm text-mesa-600">
                Estrutura dos 12 módulos. Publicado = visível na trilha do aluno.
              </p>
            </div>
            <div className="flex gap-2">
              <Link
                href="/english/jornada"
                className="rounded-full border border-mesa-200 px-4 py-2 text-sm font-medium text-mesa-700 transition hover:border-laranja-300 hover:text-laranja-700"
              >
                Ver a trilha
              </Link>
              <Link
                href="/english"
                className="rounded-full border border-mesa-200 px-4 py-2 text-sm font-medium text-mesa-700 transition hover:border-laranja-300 hover:text-laranja-700"
              >
                Ver público
              </Link>
            </div>
          </div>

          {modulos.length === 0 ? (
            <p className="rounded-2xl border border-dashed border-mesa-300 bg-bege-50 p-6 text-center text-mesa-600">
              Nenhum módulo no banco. Aplique a migration <code>204_english_modulo_1.sql</code>.
            </p>
          ) : (
            <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
              {modulos.map((modulo) => (
                <div
                  key={modulo.id}
                  className={`rounded-2xl border p-5 ${
                    modulo.publicado ? "border-laranja-200 bg-laranja-50" : "border-mesa-200 bg-bege-50"
                  }`}
                >
                  <div className="flex items-center justify-between gap-3">
                    <p className="text-sm font-semibold text-laranja-700">Módulo {modulo.numero}</p>
                    <span
                      className={`rounded-full px-2.5 py-1 text-xs font-semibold ${
                        modulo.publicado ? "bg-white text-laranja-700" : "bg-white text-mesa-600"
                      }`}
                    >
                      {modulo.publicado ? "Publicado" : "Em preparação"}
                    </span>
                  </div>
                  <h3 className="mt-3 font-serif text-lg font-semibold text-mesa-800">{modulo.titulo}</h3>
                  {modulo.titulo_en && (
                    <p lang="en" className="text-sm text-mesa-500">{modulo.titulo_en}</p>
                  )}
                  <p className="mt-3 text-xs uppercase tracking-[0.12em] text-mesa-500">
                    {NIVEL_ROTULO[modulo.nivel] || modulo.nivel} · {modulo.licoes} lições ·{" "}
                    {modulo.exercicios} exercícios
                  </p>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </AdminShell>
  );
}
