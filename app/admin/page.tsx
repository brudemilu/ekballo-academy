import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession, getAdminStats, listRecentRespostas } from "@/lib/db";

export default async function AdminPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const [stats, ultimas] = await Promise.all([
    getAdminStats(),
    listRecentRespostas(8),
  ]);

  const cards = [
    { label: "Alunos cadastrados", value: stats.totalAlunos, color: "text-mesa-700" },
    { label: "Cursos publicados", value: stats.totalCursos, color: "text-mesa-700" },
    { label: "Respostas escritas", value: stats.totalRespostas, color: "text-oliveira-700" },
    { label: "Aguardando devolutiva", value: stats.respostasSemComentario, color: "text-amber-700" },
  ];

  return (
    <AdminShell current="painel" session={session}>
      <div className="mb-10">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Visão geral
        </p>
        <h1 className="font-serif text-4xl font-semibold text-mesa-800">
          A mesa por dentro.
        </h1>
      </div>

      <div className="mb-10 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {cards.map((s) => (
          <div
            key={s.label}
            className="rounded-2xl border border-mesa-200 bg-white p-6"
          >
            <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
              {s.label}
            </p>
            <p className={`mt-2 font-serif text-4xl font-semibold ${s.color}`}>
              {s.value}
            </p>
          </div>
        ))}
      </div>

      <div className="rounded-2xl border border-mesa-200 bg-white">
        <div className="border-b border-mesa-100 px-6 py-4">
          <h2 className="font-serif text-xl font-semibold text-mesa-800">
            Últimas respostas
          </h2>
        </div>
        {ultimas.length === 0 ? (
          <p className="px-6 py-12 text-center text-mesa-500">
            Nenhuma resposta ainda. Em breve a mesa estará posta.
          </p>
        ) : (
          <ul className="divide-y divide-mesa-100">
            {ultimas.map((r) => (
              <li key={r.id}>
                <Link
                  href={`/admin/respostas/${r.id}`}
                  className="flex items-start gap-4 px-6 py-4 transition hover:bg-mesa-50/50"
                >
                  <div className="mt-1 h-2.5 w-2.5 flex-none rounded-full bg-mesa-400" />
                  <div className="min-w-0 flex-1">
                    <div className="flex items-baseline justify-between gap-3">
                      <p className="font-medium text-mesa-800">
                        {r.alunoNome || r.alunoEmail}
                      </p>
                      <p className="flex-none text-xs text-mesa-500">
                        {new Date(r.created_at).toLocaleDateString("pt-BR")}
                      </p>
                    </div>
                    <p className="mt-0.5 text-xs text-mesa-500">
                      {r.cursoTitulo} · {r.aulaTitulo}
                    </p>
                    <p className="mt-2 line-clamp-2 text-sm text-mesa-700">
                      {r.texto}
                    </p>
                    {!r.comentario_lider && (
                      <span className="mt-2 inline-block rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">
                        Aguardando devolutiva
                      </span>
                    )}
                  </div>
                </Link>
              </li>
            ))}
          </ul>
        )}
      </div>
    </AdminShell>
  );
}
