// =============================================================
// EKBALLO ACADEMY · Papéis e permissões (constantes puras)
// Importável tanto no middleware (edge) quanto em componentes.
// Sem dependências de servidor.
// =============================================================

export type Permissao = "discipulos" | "acompanhamento" | "conteudo" | "comunicacao";
export type Papel = "master" | "coordenador" | "lider" | "discipulo";

export const PERMISSOES: { chave: Permissao; nome: string; descricao: string }[] = [
  {
    chave: "discipulos",
    nome: "Pessoas (Discípulos)",
    descricao: "Ver e editar cadastros e matrículas dos discípulos.",
  },
  {
    chave: "acompanhamento",
    nome: "Acompanhamento",
    descricao: "Respostas e devolutivas das aulas e reflexões dos devocionais.",
  },
  {
    chave: "conteudo",
    nome: "Conteúdo",
    descricao: "Temáticas, aulas e devocionais (criar e editar).",
  },
  {
    chave: "comunicacao",
    nome: "Comunicação & mídia",
    descricao: "Mensagens, templates de e-mail, gerador de imagens e YouTube.",
  },
];

export const PAPEIS: { chave: Papel; nome: string; descricao: string }[] = [
  { chave: "master", nome: "Master", descricao: "Acesso total, incluindo papéis e permissões." },
  { chave: "coordenador", nome: "Coordenador", descricao: "Gestão ampla, conforme as permissões marcadas." },
  { chave: "lider", nome: "Líder", descricao: "Acesso restrito, conforme as permissões marcadas." },
  { chave: "discipulo", nome: "Discípulo", descricao: "Sem acesso ao painel administrativo." },
];

// Papéis configuráveis na matriz (master é sempre tudo; discipulo é nada)
export const PAPEIS_CONFIGURAVEIS: Papel[] = ["coordenador", "lider"];

// Papéis que entram no painel admin
export const PAPEIS_ADMIN: Papel[] = ["master", "coordenador", "lider"];

export function nomePapel(papel: string | null | undefined): string {
  return PAPEIS.find((p) => p.chave === papel)?.nome || "Discípulo";
}

// Aba do AdminShell → permissão exigida (null = livre p/ qualquer papel admin)
export const TAB_PERMISSAO: Record<string, Permissao | null> = {
  painel: null,
  dashboard: null,
  english: null,
  cursos: "conteudo",
  respostas: "acompanhamento",
  alunos: "discipulos",
  mensagens: "comunicacao",
  whatsapp: "comunicacao",
  templates: "comunicacao",
  imagens: "comunicacao",
  youtube: "comunicacao",
};

// Rota admin → permissão exigida. A checagem usa o prefixo mais específico.
const ROTA_PERMISSAO: { prefixo: string; permissao: Permissao }[] = [
  { prefixo: "/admin/alunos", permissao: "discipulos" },
  { prefixo: "/admin/respostas", permissao: "acompanhamento" },
  { prefixo: "/admin/devocionais/reflexoes", permissao: "acompanhamento" },
  { prefixo: "/admin/cursos", permissao: "conteudo" },
  { prefixo: "/admin/devocionais", permissao: "conteudo" },
  { prefixo: "/admin/mensagens", permissao: "comunicacao" },
  { prefixo: "/admin/whatsapp", permissao: "comunicacao" },
  { prefixo: "/admin/templates", permissao: "comunicacao" },
  { prefixo: "/admin/imagens", permissao: "comunicacao" },
  { prefixo: "/admin/youtube", permissao: "comunicacao" },
];

// /admin/permissoes é exclusivo do master
export function rotaSoMaster(path: string): boolean {
  return path.startsWith("/admin/permissoes");
}

export function permissaoDaRota(path: string): Permissao | null {
  const match = ROTA_PERMISSAO
    .filter((r) => path === r.prefixo || path.startsWith(r.prefixo + "/") || path.startsWith(r.prefixo))
    .sort((a, b) => b.prefixo.length - a.prefixo.length)[0];
  return match ? match.permissao : null;
}

// -------- CADERNO DE ANOTAÇÕES: acesso restrito --------
// O caderno (/anotacoes) é pessoal e privado: cada pessoa vê só o que ela
// mesma escreveu — ninguém lê o caderno de ninguém, nem o master.
// Por decisão do Bruno (ago/2026), começa liberado só pra ele; para abrir pra
// outra pessoa, basta acrescentar o e-mail dela aqui (ela ganha o PRÓPRIO
// caderno, não acesso ao dos outros).
export const CADERNO_EMAILS: string[] = [];

export function podeUsarCaderno(
  papel: string | null | undefined,
  isAdmin: boolean | null | undefined,
  email: string | null | undefined,
): boolean {
  const ehMaster = papel === "master" || (!papel && !!isAdmin);
  if (ehMaster) return true;
  return !!email && CADERNO_EMAILS.includes(email.trim().toLowerCase());
}

// -------- AGENDA PESSOAL: acesso restrito --------
// A agenda (/admin/agenda) é pessoal do pastor (master). Estes e-mails extras
// também podem ver — e SÓ a agenda, nada mais do admin.
export const AGENDA_EMAILS: string[] = ["deboramoreirabml@gmail.com"];

export function podeVerAgenda(
  papel: string | null | undefined,
  isAdmin: boolean | null | undefined,
  email: string | null | undefined,
): boolean {
  const ehMaster = papel === "master" || (!papel && !!isAdmin);
  if (ehMaster) return true;
  return !!email && AGENDA_EMAILS.includes(email.trim().toLowerCase());
}
