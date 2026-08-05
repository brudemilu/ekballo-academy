import Link from "next/link";
import { ReactNode } from "react";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getPermissoesPapel } from "@/lib/db";
import { TAB_PERMISSAO, podeVerAgenda } from "@/lib/permissoes";

export type AdminTab =
  | "painel"
  | "dashboard"
  | "english"
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

type GrupoKey = "visao" | "discipulado" | "comunicacao" | "criacao" | "config";

type Item = {
  key: AdminTab;
  label: string;
  href: string;
  hint?: string;
  grupo: GrupoKey;
};

// Seções do menu — agrupar as funções dá estrutura e deixa o painel escaneável
// (em vez de uma lista plana). A ordem aqui é a ordem exibida.
const GRUPOS: { key: GrupoKey; label: string }[] = [
  { key: "visao", label: "Visão geral" },
  { key: "discipulado", label: "Discipulado" },
  { key: "comunicacao", label: "Comunicação" },
  { key: "criacao", label: "Criação & mídia" },
  { key: "config", label: "Configuração" },
];

const ITEMS: Item[] = [
  { key: "painel", label: "Painel", href: "/admin", hint: "Visão geral", grupo: "visao" },
  { key: "dashboard", label: "Dashboard", href: "/admin/dashboard", hint: "Engajamento, filtros e gráficos", grupo: "visao" },
  { key: "english", label: "English", href: "/admin/english", hint: "Curso premium Ekballo English", grupo: "discipulado" },
  { key: "cursos", label: "Temáticas", href: "/admin/cursos", hint: "Progresso por temática e discípulo", grupo: "discipulado" },
  { key: "respostas", label: "Respostas", href: "/admin/respostas", hint: "Reflexões e devolutivas", grupo: "discipulado" },
  { key: "alunos", label: "Discípulos", href: "/admin/alunos", hint: "Matrículas e contatos", grupo: "discipulado" },
  { key: "mensagens", label: "Mensagens", href: "/admin/mensagens", hint: "Email, WhatsApp e grupos", grupo: "comunicacao" },
  { key: "templates", label: "Templates", href: "/admin/templates", hint: "Emails automáticos", grupo: "comunicacao" },
  { key: "imagens", label: "Imagens", href: "/admin/imagens", hint: "Gerador cinematográfico IA", grupo: "criacao" },
  { key: "instagram", label: "Instagram", href: "/admin/instagram", hint: "Gerar carrossel e postar", grupo: "criacao" },
  { key: "youtube", label: "YouTube", href: "/admin/youtube", hint: "Baixar áudio em MP3", grupo: "criacao" },
  { key: "marca", label: "Marca", href: "/admin/marca", hint: "Logo, cores e o nome Ekballo", grupo: "config" },
];

// Ícones só para a grade de cartões no celular (deixa mais visual/tocável).
const ICONE: Partial<Record<AdminTab, string>> = {
  painel: "📋",
  dashboard: "📊",
  english: "🗣️",
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
    grupo: "comunicacao",
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
      grupo: "config",
    });
  } else if (!session.profile?.is_admin && podeAgenda) {
    // Acesso exclusivo à agenda (ex.: Débora): só vê a Agenda.
    itens = [itemAgenda];
  } else if (podeAgenda) {
    itens.push(itemAgenda);
  }

  // Agrupa os itens visíveis nas seções (na ordem de GRUPOS), omitindo vazias.
  const porGrupo = GRUPOS.map((g) => ({
    ...g,
    itens: itens.filter((it) => it.grupo === g.key),
  })).filter((g) => g.itens.length > 0);

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 shadow-sm shadow-mesa-700/5 backdrop-blur">
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

      <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6 sm:py-10 md:grid md:grid-cols-[minmax(0,232px)_1fr] md:gap-8 lg:grid-cols-[minmax(0,256px)_1fr] lg:gap-10">
        <aside className="md:sticky md:top-8 md:max-h-[calc(100vh-4rem)] md:self-start md:overflow-y-auto md:overscroll-contain">
          {/* Painel lateral como superfície própria: card destacado com cabeçalho
              e divisor. No celular vira grade de cartões com ícone (tocável);
              no desktop, lista compacta de uma coluna — cartão grande em coluna
              estreita ficava desproporcional. Item ativo em greige escuro
              (bg-mesa-700), sem trocar por terracota. */}
          <div className="rounded-3xl border border-mesa-200 bg-white p-5 shadow-sm shadow-mesa-800/5 md:rounded-2xl md:p-4">
            <div className="mb-6 border-b border-mesa-100 pb-4 md:mb-4 md:pb-3">
              <p className="text-[11px] font-semibold uppercase tracking-[0.18em] text-mesa-500">
                Painel pastoral
              </p>
              <p className="mt-1 text-sm text-mesa-500 md:text-xs">Gestão e acompanhamento</p>
            </div>

            <nav className="space-y-6 md:space-y-4">
              {porGrupo.map((g) => (
                <div key={g.key}>
                  <p className="mb-2.5 pl-1 text-[10px] font-semibold uppercase tracking-[0.18em] text-mesa-400 md:mb-1.5">
                    {g.label}
                  </p>
                  <ul className="grid grid-cols-2 gap-2.5 md:grid-cols-1 md:gap-1">
                    {g.itens.map((it) => {
                      const ativo = it.key === current;
                      return (
                        <li key={it.key}>
                          <Link
                            href={it.href}
                            aria-current={ativo ? "page" : undefined}
                            title={it.hint}
                            className={`group flex h-full items-center gap-2.5 rounded-xl border p-3 transition md:gap-2.5 md:rounded-lg md:px-2 md:py-1.5 ${
                              ativo
                                ? "border-mesa-700 bg-mesa-700 text-mesa-50 shadow-md shadow-mesa-800/25 md:shadow-sm"
                                : "border-mesa-200 bg-bege-50 text-mesa-700 hover:-translate-y-0.5 hover:border-laranja-300 hover:bg-white hover:shadow-sm active:bg-mesa-100 md:border-transparent md:bg-transparent md:hover:translate-y-0 md:hover:border-mesa-200 md:hover:bg-bege-50 md:hover:shadow-none"
                            }`}
                          >
                            <span
                              className={`flex h-9 w-9 flex-none items-center justify-center rounded-lg text-base transition md:h-7 md:w-7 md:rounded-md md:text-sm ${
                                ativo
                                  ? "bg-white/15"
                                  : "bg-white shadow-sm group-hover:bg-laranja-100 md:bg-mesa-100 md:shadow-none"
                              }`}
                            >
                              {ICONE[it.key] ?? "•"}
                            </span>
                            <span className="min-w-0 text-sm font-semibold leading-tight md:font-medium">
                              {it.label}
                            </span>
                          </Link>
                        </li>
                      );
                    })}
                  </ul>
                </div>
              ))}
            </nav>
          </div>
        </aside>

        <section className="mt-6 md:mt-0">{children}</section>
      </div>
    </main>
  );
}
