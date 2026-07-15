import Link from "next/link";
import { ReactNode } from "react";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getPermissoesPapel } from "@/lib/db";
import { TAB_PERMISSAO, podeVerAgenda } from "@/lib/permissoes";

export type AdminTab =
  | "painel"
  | "dashboard"
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

      <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6 sm:py-10 md:grid md:grid-cols-[minmax(0,340px)_1fr] md:gap-8">
        <aside className="md:sticky md:top-6 md:self-start">
          <p className="mb-4 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Painel pastoral
          </p>

          {/* Seções em grade de 2 colunas (desktop e mobile) — dá pra ver tudo
              de uma vez, cada função num cartão com ícone. */}
          <nav className="space-y-4">
            {porGrupo.map((g) => (
              <div key={g.key}>
                <p className="mb-2 text-[10px] font-semibold uppercase tracking-[0.16em] text-mesa-400">
                  {g.label}
                </p>
                <ul className="grid grid-cols-2 gap-2">
                  {g.itens.map((it) => {
                    const ativo = it.key === current;
                    return (
                      <li key={it.key}>
                        <Link
                          href={it.href}
                          aria-current={ativo ? "page" : undefined}
                          title={it.hint}
                          className={`group flex h-full items-center gap-2.5 rounded-xl border p-2.5 transition ${
                            ativo
                              ? "border-mesa-700 bg-mesa-700 text-mesa-50 shadow-md shadow-mesa-800/25"
                              : "border-mesa-200 bg-white text-mesa-700 hover:border-laranja-300 hover:shadow-sm active:bg-mesa-100"
                          }`}
                        >
                          <span
                            className={`flex h-8 w-8 flex-none items-center justify-center rounded-lg text-base transition ${
                              ativo ? "bg-white/15" : "bg-mesa-100 group-hover:bg-laranja-100"
                            }`}
                          >
                            {ICONE[it.key] ?? "•"}
                          </span>
                          <span className="min-w-0 text-sm font-semibold leading-tight">
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
        </aside>

        <section className="mt-6 md:mt-0">{children}</section>
      </div>
    </main>
  );
}
