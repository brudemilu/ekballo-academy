import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession } from "@/lib/db";
import {
  listAllDevocionaisAdmin,
  formatDataPt,
  hojeDateStr,
} from "@/lib/devocionais";

export default async function AdminDevocionaisPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const devocionais = await listAllDevocionaisAdmin(100);
  const hoje = hojeDateStr();
  const temHoje = devocionais.some((d) => d.data === hoje);

  return (
    <AdminShell current="devocionais" session={session}>
      <div className="mb-6 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Comunicação · Devocional diário
          </p>
          <h1 className="font-serif text-4xl font-semibold text-mesa-800">
            Devocionais
          </h1>
        </div>
        <Link
          href="/admin/devocionais/novo"
          className="rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
        >
          + Novo devocional
        </Link>
      </div>

      {!temHoje && (
        <div className="mb-6 rounded-2xl border border-amber-200 bg-amber-50 px-5 py-4">
          <p className="text-sm font-medium text-amber-800">
            ⏰ Ainda não tem devocional para hoje ({formatDataPt(hoje, true)}).
          </p>
          <Link
            href="/admin/devocionais/novo"
            className="mt-2 inline-block text-xs font-medium text-amber-900 underline hover:text-amber-700"
          >
            Criar agora →
          </Link>
        </div>
      )}

      {devocionais.length === 0 ? (
        <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
          <p className="font-serif text-lg text-mesa-500">
            Nenhum devocional ainda. Comece pelo primeiro.
          </p>
        </div>
      ) : (
        <ul className="space-y-3">
          {devocionais.map((d) => (
            <li key={d.id}>
              <Link
                href={`/admin/devocionais/${d.id}`}
                className="block rounded-xl border border-mesa-200 bg-white p-5 transition hover:border-mesa-300 hover:shadow-md"
              >
                <div className="flex flex-wrap items-start justify-between gap-3">
                  <div className="min-w-0 flex-1">
                    <div className="mb-1 flex flex-wrap items-center gap-2">
                      <span className="rounded-full bg-mesa-100 px-2.5 py-0.5 text-xs font-medium text-mesa-700">
                        {formatDataPt(d.data, true)}
                      </span>
                      {d.data === hoje && (
                        <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-medium text-oliveira-700">
                          Hoje
                        </span>
                      )}
                      {!d.publicado && (
                        <span className="rounded-full bg-amber-100 px-2.5 py-0.5 text-xs font-medium text-amber-800">
                          Rascunho
                        </span>
                      )}
                    </div>
                    <h3 className="font-serif text-lg font-semibold text-mesa-800">
                      {d.titulo || d.versiculo_ref}
                    </h3>
                    <p className="mt-1 line-clamp-2 text-sm italic text-mesa-600">
                      &ldquo;{d.versiculo_texto}&rdquo;
                    </p>
                  </div>
                  <span className="flex-none text-mesa-400">→</span>
                </div>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </AdminShell>
  );
}
