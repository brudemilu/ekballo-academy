import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getCurrentSession, listEmailTemplates } from "@/lib/db";

const NOMES_AMIGAVEIS: Record<string, string> = {
  "novo-cadastro": "Notificação de novo cadastro",
  "boas-vindas-curso": "Boas-vindas no curso",
  "lembrete-inatividade": "Lembrete de inatividade",
};

export default async function AdminTemplatesPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const templates = await listEmailTemplates();

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

      <div className="mx-auto max-w-4xl px-6 py-12">
        <Link href="/admin" className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800">
          ← Painel
        </Link>
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Comunicação
        </p>
        <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
          Templates de email
        </h1>
        <p className="mb-8 text-sm text-mesa-600">
          Edite o assunto e o corpo dos emails automáticos enviados pela plataforma. As alterações entram em vigor no próximo disparo.
        </p>

        <ul className="space-y-3">
          {templates.map((t) => (
            <li
              key={t.id}
              className="rounded-xl border border-mesa-200 bg-white p-5"
            >
              <div className="flex flex-wrap items-start justify-between gap-4">
                <div className="min-w-0 flex-1">
                  <div className="mb-1 flex items-center gap-2">
                    <h3 className="font-serif text-lg font-semibold text-mesa-800">
                      {NOMES_AMIGAVEIS[t.chave] ?? t.chave}
                    </h3>
                    {!t.ativo && (
                      <span className="rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">
                        Desativado
                      </span>
                    )}
                    <span className="rounded-full bg-mesa-100 px-2 py-0.5 font-mono text-xs text-mesa-600">
                      {t.chave}
                    </span>
                  </div>
                  <p className="mb-2 text-sm text-mesa-600">{t.descricao}</p>
                  <p className="text-sm text-mesa-500">
                    <span className="text-mesa-400">Assunto atual:</span>{" "}
                    <span className="text-mesa-700">{t.assunto}</span>
                  </p>
                </div>
                <Link
                  href={`/admin/templates/${t.chave}`}
                  className="rounded-full bg-mesa-700 px-5 py-2 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
                >
                  Editar
                </Link>
              </div>
            </li>
          ))}
        </ul>
      </div>
    </main>
  );
}
