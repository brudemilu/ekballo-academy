import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession, listCursosWithStats } from "@/lib/db";

export default async function AdminCursosPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const cursos = await listCursosWithStats();

  return (
    <AdminShell current="cursos" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Conteúdo
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Temáticas
      </h1>
      <p className="mb-8 text-sm text-mesa-600">
        Clique em uma temática pra ver progresso por aula, por discípulo e onde estão
        os gargalos. Para criar ou editar conteúdo (aulas, atividades), use o
        Supabase.
      </p>

      {cursos.length === 0 ? (
        <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-20 text-center">
          <p className="font-serif text-xl text-mesa-500">
            Nenhum curso publicado ainda.
          </p>
        </div>
      ) : (
        <ul className="space-y-3">
          {cursos.map(({ curso: c, matriculados, concluidos, alunosComTelefone }) => {
            const taxa =
              matriculados > 0
                ? Math.round((concluidos / matriculados) * 100)
                : 0;
            return (
              <li key={c.id}>
                <Link
                  href={c.external_path ?? `/admin/cursos/${c.slug}`}
                  className="block rounded-2xl border border-mesa-200 bg-white p-5 transition hover:border-mesa-300 hover:shadow-md"
                >
                  <div className="flex flex-wrap items-center justify-between gap-4">
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
                        {c.is_pago ? (
                          <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-xs font-medium text-mesa-700">
                            Pago
                          </span>
                        ) : (
                          <span className="rounded-full bg-oliveira-100 px-2 py-0.5 text-xs font-medium text-oliveira-700">
                            Gratuito
                          </span>
                        )}
                      </div>
                      <p className="line-clamp-2 text-sm text-mesa-600">
                        {c.descricao}
                      </p>
                    </div>
                    <div className="flex items-center gap-6 text-sm">
                      <div className="text-right">
                        <p className="font-serif text-2xl font-semibold text-mesa-700">
                          {matriculados}
                        </p>
                        <p className="text-xs text-mesa-500">matriculados</p>
                      </div>
                      <div className="text-right">
                        <p className="font-serif text-2xl font-semibold text-oliveira-700">
                          {concluidos}
                        </p>
                        <p className="text-xs text-mesa-500">
                          concluíram{matriculados > 0 ? ` · ${taxa}%` : ""}
                        </p>
                      </div>
                      <div className="text-right">
                        <p className="font-serif text-2xl font-semibold text-mesa-700">
                          {alunosComTelefone}
                        </p>
                        <p className="text-xs text-mesa-500">com WhatsApp</p>
                      </div>
                      <span className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700">
                        Abrir →
                      </span>
                    </div>
                  </div>
                </Link>
              </li>
            );
          })}
        </ul>
      )}
    </AdminShell>
  );
}
