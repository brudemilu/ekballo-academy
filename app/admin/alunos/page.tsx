import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getCurrentSession, listAllAlunos } from "@/lib/db";

export default async function AlunosPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const alunos = await listAllAlunos();

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/admin">
            <Logo />
          </Link>
          <UserMenu nome={session.profile.nome} email={session.profile.email || session.email} isAdmin />
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-6 py-12">
        <Link href="/admin" className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800">
          ← Painel
        </Link>
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Comunidade
        </p>
        <h1 className="mb-8 font-serif text-4xl font-semibold text-mesa-800">
          {alunos.length} discípulos na mesa
        </h1>

        {alunos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-20 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Ainda ninguém se cadastrou.
            </p>
          </div>
        ) : (
          <div className="overflow-hidden rounded-2xl border border-mesa-200 bg-white">
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
                    Turma
                  </th>
                  <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                    Respostas
                  </th>
                  <th className="px-6 py-3 text-xs font-medium uppercase tracking-wider text-mesa-600">
                    Cadastro
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-mesa-100">
                {alunos.map((a) => (
                  <tr key={a.id} className="hover:bg-mesa-50/40">
                    <td className="px-6 py-4">
                      <p className="font-medium text-mesa-800">
                        {a.nome || "(sem nome)"}
                      </p>
                      {a.is_admin && (
                        <span className="mt-0.5 inline-block rounded-full bg-oliveira-100 px-2 py-0.5 text-xs font-medium text-oliveira-700">
                          Admin
                        </span>
                      )}
                    </td>
                    <td className="px-6 py-4 text-sm text-mesa-700">{a.email}</td>
                    <td className="px-6 py-4 text-sm text-mesa-600">
                      {a.turma || "—"}
                    </td>
                    <td className="px-6 py-4 text-sm font-medium text-mesa-800">
                      {a.respostasCount}
                    </td>
                    <td className="px-6 py-4 text-sm text-mesa-500">
                      {new Date(a.created_at).toLocaleDateString("pt-BR")}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </main>
  );
}
