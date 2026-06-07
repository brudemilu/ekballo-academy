import Link from "next/link";
import { ReactNode } from "react";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getPermissoesPapel } from "@/lib/db";
import { TAB_PERMISSAO } from "@/lib/permissoes";

export type AdminTab =
  | "painel"
  | "cursos"
  | "biblia"
  | "devocionais"
  | "respostas"
  | "alunos"
  | "mensagens"
  | "whatsapp"
  | "templates"
  | "imagens"
  | "instagram"
  | "youtube"
  | "agenda"
  | "permissoes";

type Item = {
  key: AdminTab;
  label: string;
  href: string;
  hint?: string;
};

const ITEMS: Item[] = [
  { key: "painel", label: "Painel", href: "/admin", hint: "Visão geral" },
  { key: "cursos", label: "Temáticas", href: "/admin/cursos", hint: "Progresso por temática e discípulo" },
  { key: "respostas", label: "Respostas", href: "/admin/respostas", hint: "Reflexões e devolutivas" },
  { key: "alunos", label: "Discípulos", href: "/admin/alunos", hint: "Matrículas e contatos" },
  { key: "mensagens", label: "Mensagens", href: "/admin/mensagens", hint: "Email, WhatsApp e grupos" },
  { key: "templates", label: "Templates", href: "/admin/templates", hint: "Emails automáticos" },
  { key: "imagens", label: "Imagens", href: "/admin/imagens", hint: "Gerador cinematográfico IA" },
  { key: "instagram", label: "Instagram", href: "/admin/instagram", hint: "Gerar carrossel e postar" },
  { key: "youtube", label: "YouTube", href: "/admin/youtube", hint: "Baixar áudio em MP3" },
];

export async function AdminShell({
  current,
  session,
  children,
}: {
  current: AdminTab;
  session: {
    profile: { nome: string | null; email: string; papel?: string; is_admin?: boolean } | null;
    email: string;
  };
  children: ReactNode;
}) {
  // Registros antigos com is_admin e sem papel = master (legado).
  const papel =
    session.profile?.papel || (session.profile?.is_admin ? "master" : "discipulo");
  const permissoes = await getPermissoesPapel(papel);

  const itens = ITEMS.filter((it) => {
    const perm = TAB_PERMISSAO[it.key];
    return !perm || papel === "master" || permissoes.has(perm);
  });
  if (papel === "master") {
    itens.push({
      key: "agenda",
      label: "Agenda",
      href: "/admin/agenda",
      hint: "Seus compromissos (Google + manuais)",
    });
    itens.push({
      key: "permissoes",
      label: "Permissões",
      href: "/admin/permissoes",
      hint: "Papéis e acessos",
    });
  }

  const atual = itens.find((it) => it.key === current);

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
              {itens.map((it) => {
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

          {/* Mobile/tablet: menu suspenso nativo (<details>), claro e fixo no topo */}
          <style>{`details.admin-mnav[open] .admin-mnav-seta{transform:rotate(180deg)}`}</style>
          <details className="admin-mnav sticky top-2 z-20 md:hidden overflow-hidden rounded-xl border border-mesa-200 bg-white shadow-sm">
            <summary className="flex cursor-pointer list-none items-center justify-between gap-3 px-4 py-3 [&::-webkit-details-marker]:hidden">
              <span className="flex min-w-0 items-center gap-2 text-sm">
                <span className="font-medium uppercase tracking-[0.15em] text-[10px] text-mesa-400">
                  Menu
                </span>
                <span className="text-mesa-300">·</span>
                <span className="truncate font-semibold text-mesa-800">
                  {atual?.label ?? "Painel"}
                </span>
              </span>
              <svg
                className="admin-mnav-seta h-5 w-5 flex-none text-mesa-500 transition-transform"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
              >
                <path
                  fillRule="evenodd"
                  d="M5.23 7.21a.75.75 0 011.06.02L10 11.06l3.71-3.83a.75.75 0 111.08 1.04l-4.25 4.39a.75.75 0 01-1.08 0L5.21 8.27a.75.75 0 01.02-1.06z"
                  clipRule="evenodd"
                />
              </svg>
            </summary>
            <ul className="border-t border-mesa-100 p-2">
              {itens.map((it) => {
                const ativo = it.key === current;
                return (
                  <li key={it.key}>
                    <Link
                      href={it.href}
                      className={`block rounded-lg px-3 py-2.5 transition ${
                        ativo
                          ? "bg-mesa-700 text-mesa-50"
                          : "text-mesa-700 hover:bg-mesa-100 active:bg-mesa-100"
                      }`}
                    >
                      <p className="text-sm font-medium">{it.label}</p>
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
          </details>
        </aside>

        <section className="mt-6 md:mt-0">{children}</section>
      </div>
    </main>
  );
}
