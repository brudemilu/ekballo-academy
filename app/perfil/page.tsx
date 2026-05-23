import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { PerfilForm } from "@/components/PerfilForm";
import { getCurrentSession } from "@/lib/db";

export default async function PerfilPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/dashboard">
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin={!!session.profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-xl px-6 py-12">
        <div className="mb-8">
          <Link
            href="/dashboard"
            className="text-sm text-mesa-600 underline decoration-mesa-300 hover:text-mesa-800"
          >
            ← Voltar
          </Link>
          <h1 className="mt-4 font-serif text-3xl font-semibold text-mesa-800">
            Meu perfil
          </h1>
          <p className="mt-2 text-sm text-mesa-600">
            Atualize seu nome e celular. Mantenha o WhatsApp em dia pra receber
            avisos da liderança.
          </p>
        </div>

        <div className="rounded-2xl border border-mesa-200 bg-white p-8 shadow-xl shadow-mesa-700/5 sm:p-10">
          <PerfilForm
            userId={session.userId}
            initial={{
              nome: session.profile?.nome || "",
              email: session.profile?.email || session.email,
              telefone: session.profile?.telefone || "",
            }}
          />
        </div>

        <div className="mt-6 rounded-2xl border border-mesa-200 bg-white p-6">
          <h2 className="font-serif text-lg font-semibold text-mesa-800">
            Trocar senha
          </h2>
          <p className="mt-1 text-sm text-mesa-600">
            Enviamos um link pro seu e-mail pra você definir uma nova senha.
          </p>
          <Link
            href="/recuperar-senha"
            className="mt-3 inline-block rounded-full border border-mesa-300 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
          >
            Receber link de troca
          </Link>
        </div>
      </div>
    </main>
  );
}
