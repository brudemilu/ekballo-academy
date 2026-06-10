import Link from "next/link";
import { ReactNode } from "react";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getPermissoesPapel } from "@/lib/db";
import { TAB_PERMISSAO, podeVerAgenda } from "@/lib/permissoes";

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
  | "marca"
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
  { key: "marca", label: "Marca", href: "/admin/marca", hint: "Logo, cores e o nome Ekballo" },
];

// Ícones só para a grade de cartões no celular (deixa mais visual/tocável).
const ICONE: Partial<Record<AdminTab, string>> = {
  painel: "📋",
  cursos: "📚",
  respostas: "💬",
  alunos: "👥",
  mensagens: "✉️",
  templates: "📝",
  imagens: "🖼️",
  instagram: "📸",
  youtube: "🎬",
  marca: "🎨",
  agenda: "📅",
  permissoes: "🔑",
  biblia: "📖",
  whatsapp: "🟢",
  devocionais: "🙏",
};

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

  const email = session.profile?.email || session.email;
  const podeAgenda = podeVerAgenda(papel, session.profile?.is_admin, email);
  const itemAgenda: Item = {
    key: "agenda",
    label: "Agenda",
    href: "/admin/agenda",
    hint: "Seus compromissos (Google + manuais)",
  };

  let itens = ITEMS.filter((it) => {
    const perm = TAB_PERMISSAO[it.key];
    return !perm || papel === "master" || permissoes.has(perm);
  });

  if (papel === "master") {
    itens.push(itemAgenda);
    itens.push({
      key: "permissoes",
      label: "Permissões",
      href: "/admin/permissoes",
      hint: "Papéis e acessos",
    });
  } else if (!session.profile?.is_admin && podeAgenda) {
    // Acesso exclusivo à agenda (ex.: Débora): só vê a Agenda.
    itens = [itemAgenda];
  } else if (podeAgenda) {
    itens.push(itemAgenda);
  }

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

          {/* Mobile/tablet: grade de cartões — todas as seções visíveis */}
          <nav className="md:hidden">
            <p className="mb-3 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
              Painel pastoral
            </p>
            <ul className="grid grid-cols-2 gap-2">
              {itens.map((it) => {
                const ativo = it.key === current;
                return (
                  <li key={it.key}>
                    <Link
                      href={it.href}
                      className={`flex h-full flex-col rounded-xl border p-3 transition ${
                        ativo
                          ? "border-mesa-700 bg-mesa-700 text-mesa-50"
                          : "border-mesa-200 bg-white text-mesa-700 active:bg-mesa-100"
                      }`}
                    >
                      <span className="text-xl leading-none">{ICONE[it.key] ?? "•"}</span>
                      <span className="mt-2 text-sm font-semibold leading-tight">{it.label}</span>
                      {it.hint && (
                        <span
                          className={`mt-0.5 text-[11px] leading-snug ${
                            ativo ? "text-mesa-100/80" : "text-mesa-500"
                          }`}
                        >
                          {it.hint}
                        </span>
                      )}
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
