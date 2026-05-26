import Link from "next/link";
import { ReactNode } from "react";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";

export type AdminTab =
  | "painel"
  | "cursos"
  | "biblia"
  | "devocionais"
  | "respostas"
  | "alunos"
  | "mensagens"
  | "templates";

type Item = {
  key: AdminTab;
  label: string;
  href: string;
  hint?: string;
};

const ITEMS: Item[] = [
  { key: "painel", label: "Painel", href: "/admin", hint: "Visão geral" },
  { key: "cursos", label: "Cursos", href: "/admin/cursos", hint: "Progresso por curso e discípulo" },
  { key: "biblia", label: "Bíblia", href: "/biblia", hint: "Leitor + gerador de imagem" },
  { key: "devocionais", label: "Devocional", href: "/admin/devocionais", hint: "Devocional diário" },
  { key: "respostas", label: "Respostas", href: "/admin/respostas", hint: "Reflexões e devolutivas" },
  { key: "alunos", label: "Discípulos", href: "/admin/alunos", hint: "Matrículas e contatos" },
  { key: "mensagens", label: "Mensagens", href: "/admin/mensagens", hint: "Email e WhatsApp" },
  { key: "templates", label: "Templates", href: "/admin/templates", hint: "Emails automáticos" },
];

export function AdminShell({
  current,
  session,
  children,
}: {
  current: AdminTab;
  session: {
    profile: { nome: string | null; email: string } | null;
    email: string;
  };
  children: ReactNode;
}) {
  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
          <Link href="/admin">
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin
          />
        </nav>
      </header>

      <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6 sm:py-10 md:grid md:grid-cols-[240px_1fr] md:gap-8">
        <aside className="md:sticky md:top-6 md:self-start">
          {/* Desktop: lista vertical */}
          <nav className="hidden md:block">
            <p className="mb-3 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
              Painel pastoral
            </p>
            <ul className="space-y-1">
              {ITEMS.map((it) => {
                const ativo = it.key === current;
                return (
                  <li key={it.key}>
                    <Link
                      href={it.href}
                      className={`block rounded-lg px-3 py-2.5 text-sm transition ${
                        ativo
                          ? "bg-mesa-700 text-mesa-50"
                          : "text-mesa-700 hover:bg-mesa-100"
                      }`}
                    >
                      <p className="font-medium">{it.label}</p>
                      {it.hint && (
                        <p
                          className={`mt-0.5 text-xs ${
                            ativo ? "text-mesa-100/80" : "text-mesa-500"
                          }`}
                        >
                          {it.hint}
                        </p>
                      )}
                    </Link>
                  </li>
                );
              })}
            </ul>
          </nav>

          {/* Mobile/tablet: pills horizontais com scroll */}
          <nav className="md:hidden">
            <ul className="-mx-4 flex gap-2 overflow-x-auto px-4 pb-2">
              {ITEMS.map((it) => {
                const ativo = it.key === current;
                return (
                  <li key={it.key} className="flex-none">
                    <Link
                      href={it.href}
                      className={`block whitespace-nowrap rounded-full px-4 py-1.5 text-xs font-medium transition ${
                        ativo
                          ? "bg-mesa-700 text-mesa-50"
                          : "border border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-100"
                      }`}
                    >
                      {it.label}
                    </Link>
                  </li>
                );
              })}
            </ul>
          </nav>
        </aside>

        <section className="mt-6 md:mt-0">{children}</section>
      </div>
    </main>
  );
}
