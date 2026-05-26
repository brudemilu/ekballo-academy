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
        <div className="mt-8 overflow-hidden rounded-2xl border border-mesa-200 bg-white">
          <table className="w-full">
            <thead className="border-b border-mesa-200 bg-mesa-50/50 text-left">
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
                  Turma
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
                <tr key={a.id} className="hover:bg-mesa-50/40">
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
                    {a.turma || "—"}
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
      )}
    </AdminShell>
  );
}
