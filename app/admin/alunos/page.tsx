import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession, listAllAlunos } from "@/lib/db";
import { displayTelefone } from "@/lib/telefone";

export default async function AlunosPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const alunos = await listAllAlunos();
  const semTelefone = alunos.filter((a) => !a.telefone && !a.is_admin).length;

  return (
    <AdminShell current="alunos" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Comunidade
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        {alunos.length} discípulos na mesa
      </h1>
      {semTelefone > 0 && (
        <p className="mb-6 text-sm text-mesa-600">
          {semTelefone} {semTelefone === 1 ? "discípulo" : "discípulos"} ainda sem
          telefone — não recebem WhatsApp até atualizarem o perfil.
        </p>
      )}

      {alunos.length === 0 ? (
        <div className="mt-8 rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-20 text-center">
          <p className="font-serif text-xl text-mesa-500">
            Ainda ninguém se cadastrou.
          </p>
        </div>
      ) : (
        <>
          {/* Celular: cards empilhados (um por pessoa, sem rolar pro lado) */}
          <ul className="mt-8 space-y-3 md:hidden">
            {alunos.map((a) => (
              <li
                key={a.id}
                className="rounded-2xl border border-mesa-200 bg-white p-4"
              >
                <div className="flex items-start justify-between gap-3">
                  <div className="min-w-0">
                    <Link
                      href={`/admin/alunos/${a.id}`}
                      className="font-medium text-mesa-800 hover:underline"
                    >
                      {a.nome || "(sem nome)"}
                    </Link>
                    {a.is_admin && (
                      <span className="ml-2 inline-block rounded-full bg-oliveira-100 px-2 py-0.5 text-[11px] font-medium text-oliveira-700">
                        Admin
                      </span>
                    )}
                    <p className="truncate text-xs text-mesa-500">{a.email}</p>
                    <p className="text-xs text-mesa-500">
                      {a.telefone ? displayTelefone(a.telefone) : "Sem WhatsApp"}
                    </p>
                  </div>
                  <span className="flex-none text-xs text-mesa-400">
                    {a.respostasCount} resp.
                  </span>
                </div>

                {a.tematicas.length > 0 && (
                  <div className="mt-2 flex flex-wrap gap-1">
                    {a.tematicas.map((t) => (
                      <span
                        key={t}
                        className="rounded-full bg-laranja-100 px-2 py-0.5 text-xs font-medium text-laranja-700"
                      >
                        {t}
                      </span>
                    ))}
                  </div>
                )}

                <div className="mt-3 flex items-center justify-between gap-3">
                  <span className="text-xs text-mesa-400">
                    Cadastro {new Date(a.created_at).toLocaleDateString("pt-BR")}
                  </span>
                  <Link
                    href={`/admin/alunos/${a.id}`}
                    className="flex-none rounded-full bg-mesa-700 px-4 py-2 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
                  >
                    Gerenciar →
                  </Link>
                </div>
              </li>
            ))}
          </ul>

          {/* Desktop: tabela */}
          <div className="mt-8 hidden overflow-hidden rounded-2xl border border-mesa-200 bg-white md:block">
            <table className="w-full">
            <thead className="border-b border-mesa-200 bg-mesa-100 text-left">
              <tr>
                <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                  Nome
                </th>
                <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                  E-mail
                </th>
                <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                  WhatsApp
                </th>
                <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                  Temática
                </th>
                <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                  Respostas
                </th>
                <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                  Cadastro
                </th>
                <th className="px-6 py-3"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-mesa-100">
              {alunos.map((a) => (
                <tr key={a.id} className="odd:bg-white even:bg-mesa-50/40 transition hover:bg-laranja-50/50">
                  <td className="px-6 py-4">
                    <Link href={`/admin/alunos/${a.id}`} className="block">
                      <p className="font-medium text-mesa-800 hover:underline">
                        {a.nome || "(sem nome)"}
                      </p>
                      {a.is_admin && (
                        <span className="mt-0.5 inline-block rounded-full bg-oliveira-100 px-2 py-0.5 text-xs font-medium text-oliveira-700">
                          Admin
                        </span>
                      )}
                    </Link>
                  </td>
                  <td className="px-6 py-4 text-sm text-mesa-700">{a.email}</td>
                  <td className="px-6 py-4 text-sm">
                    {a.telefone ? (
                      <span className="text-mesa-700">
                        {displayTelefone(a.telefone)}
                      </span>
                    ) : (
                      <span className="text-mesa-400">—</span>
                    )}
                  </td>
                  <td className="px-6 py-4 text-sm text-mesa-600">
                    {a.tematicas.length > 0 ? (
                      <div className="flex flex-wrap gap-1">
                        {a.tematicas.map((t) => (
                          <span
                            key={t}
                            className="inline-block rounded-full bg-laranja-100 px-2 py-0.5 text-xs font-medium text-laranja-700"
                          >
                            {t}
                          </span>
                        ))}
                      </div>
                    ) : (
                      <span className="text-mesa-400">—</span>
                    )}
                  </td>
                  <td className="px-6 py-4 text-sm font-medium text-mesa-800">
                    {a.respostasCount}
                  </td>
                  <td className="px-6 py-4 text-sm text-mesa-500">
                    {new Date(a.created_at).toLocaleDateString("pt-BR")}
                  </td>
                  <td className="px-6 py-4 text-right">
                    <Link
                      href={`/admin/alunos/${a.id}`}
                      className="rounded-full border border-mesa-200 bg-white px-4 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
                    >
                      Gerenciar
                    </Link>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          </div>
        </>
      )}
    </AdminShell>
  );
}
