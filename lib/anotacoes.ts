// =============================================================
// EKBALLO ACADEMY · Caderno de anotações — acesso a dados (server-side)
//
// Mesmo contrato de lib/db.ts: cada função tem o ramo mock e o ramo Supabase.
// No mock o caderno vive em memória do processo — some no restart, mas deixa a
// tela navegável em modo demonstração.
// =============================================================

import { createClient } from "@/lib/supabase/server";
import { isMockMode } from "@/lib/mock-data";
import { sanitizarHtml, htmlParaTexto } from "@/lib/sanitizar-html";
import {
  normalizarTags,
  ehCategoria,
  ehCor,
  type Anotacao,
  type AnotacaoRich,
  type CategoriaAnotacao,
  type CorAnotacao,
} from "@/lib/anotacoes-meta";

export type { Anotacao, AnotacaoRich } from "@/lib/anotacoes-meta";

// Campos que o cliente pode mandar. Nada além disso é escrito no banco.
export type EntradaAnotacao = {
  titulo?: string;
  conteudo_html?: string;
  categoria?: CategoriaAnotacao;
  cor?: CorAnotacao;
  tags?: string[];
  curso_id?: string | null;
  aula_id?: string | null;
  fixada?: boolean;
  arquivada?: boolean;
};

const SELECT_RICH = `
  id, aluno_id, titulo, conteudo_html, conteudo_texto, categoria, cor, tags,
  curso_id, aula_id, fixada, arquivada,
  criado_em, atualizado_em,
  cursos ( titulo, slug ),
  aulas ( titulo )
`;

type LinhaRich = Anotacao & {
  cursos?: { titulo: string; slug: string } | null;
  aulas?: { titulo: string } | null;
};

function achatar(linha: LinhaRich): AnotacaoRich {
  const { cursos, aulas, ...resto } = linha;
  return {
    ...resto,
    tags: resto.tags ?? [],
    curso_titulo: cursos?.titulo ?? null,
    curso_slug: cursos?.slug ?? null,
    aula_titulo: aulas?.titulo ?? null,
  };
}

/**
 * Traduz o que o cliente mandou para a linha do banco.
 * O HTML é sanitizado AQUI (nunca no cliente, que é onde o atacante está) e o
 * espelho em texto puro é recalculado junto — assim busca e prévia nunca
 * divergem do conteúdo.
 */
function prepararGravacao(entrada: EntradaAnotacao): Record<string, unknown> {
  const linha: Record<string, unknown> = {};

  if (entrada.titulo !== undefined) {
    linha.titulo = String(entrada.titulo).replace(/\s+/g, " ").trim().slice(0, 200);
  }
  if (entrada.conteudo_html !== undefined) {
    const html = sanitizarHtml(String(entrada.conteudo_html));
    linha.conteudo_html = html;
    linha.conteudo_texto = htmlParaTexto(html);
  }
  if (entrada.categoria !== undefined && ehCategoria(entrada.categoria)) {
    linha.categoria = entrada.categoria;
  }
  if (entrada.cor !== undefined && ehCor(entrada.cor)) {
    linha.cor = entrada.cor;
  }
  if (entrada.tags !== undefined) {
    linha.tags = normalizarTags(entrada.tags);
  }
  if (entrada.curso_id !== undefined) linha.curso_id = entrada.curso_id || null;
  if (entrada.aula_id !== undefined) linha.aula_id = entrada.aula_id || null;
  for (const flag of ["fixada", "arquivada"] as const) {
    if (entrada[flag] !== undefined) linha[flag] = !!entrada[flag];
  }
  return linha;
}

// -------- Mock (modo demonstração) --------

// Pendurado no globalThis, não no módulo: em dev o Next empacota rotas de API
// e páginas separadamente, então cada bundle teria a SUA cópia do array — a
// anotação criada pelo POST sumiria na hora de renderizar a página.
const mockStore = ((globalThis as unknown as {
  __ekballoAnotacoes?: { itens: AnotacaoRich[]; seq: number };
}).__ekballoAnotacoes ??= { itens: [], seq: 0 });
const MOCK_ANOTACOES = mockStore.itens;

function mockNova(alunoId: string, entrada: EntradaAnotacao): AnotacaoRich {
  const agora = new Date().toISOString();
  const base = prepararGravacao(entrada);
  const nova: AnotacaoRich = {
    id: `mock-anotacao-${++mockStore.seq}`,
    aluno_id: alunoId,
    titulo: "",
    conteudo_html: "",
    conteudo_texto: "",
    categoria: "ideia",
    cor: "areia",
    tags: [],
    curso_id: null,
    aula_id: null,
    fixada: false,
    arquivada: false,
    criado_em: agora,
    atualizado_em: agora,
    ...(base as Partial<AnotacaoRich>),
  };
  MOCK_ANOTACOES.unshift(nova);
  return nova;
}

// -------- Leitura --------

export async function listAnotacoes(
  alunoId: string,
  opcoes: { incluirArquivadas?: boolean; cursoId?: string; aulaId?: string } = {},
): Promise<AnotacaoRich[]> {
  if (isMockMode()) {
    return MOCK_ANOTACOES.filter(
      (a) =>
        a.aluno_id === alunoId &&
        (opcoes.incluirArquivadas || !a.arquivada) &&
        (!opcoes.cursoId || a.curso_id === opcoes.cursoId) &&
        (!opcoes.aulaId || a.aula_id === opcoes.aulaId),
    );
  }

  const supabase = await createClient();
  let q = supabase
    .from("anotacoes")
    .select(SELECT_RICH)
    .eq("aluno_id", alunoId)
    .order("fixada", { ascending: false })
    .order("atualizado_em", { ascending: false })
    .limit(500);

  if (!opcoes.incluirArquivadas) q = q.eq("arquivada", false);
  if (opcoes.cursoId) q = q.eq("curso_id", opcoes.cursoId);
  if (opcoes.aulaId) q = q.eq("aula_id", opcoes.aulaId);

  const { data, error } = await q;
  if (error) {
    // Caderno indisponível não pode derrubar o painel inteiro.
    console.error("[anotacoes] listAnotacoes:", error.message);
    return [];
  }
  return ((data || []) as unknown as LinhaRich[]).map(achatar);
}

export async function getAnotacao(
  id: string,
  alunoId: string,
): Promise<AnotacaoRich | null> {
  if (isMockMode()) {
    return MOCK_ANOTACOES.find((a) => a.id === id && a.aluno_id === alunoId) ?? null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("anotacoes")
    .select(SELECT_RICH)
    .eq("id", id)
    .eq("aluno_id", alunoId)
    .maybeSingle();
  return data ? achatar(data as unknown as LinhaRich) : null;
}

/** Usado no card "Anotações desta mesa", dentro da página da aula. */
export async function listAnotacoesDaAula(
  alunoId: string,
  aulaId: string,
): Promise<AnotacaoRich[]> {
  return listAnotacoes(alunoId, { aulaId, incluirArquivadas: true });
}

// -------- Escrita --------

export async function criarAnotacao(
  alunoId: string,
  entrada: EntradaAnotacao,
): Promise<AnotacaoRich | null> {
  if (isMockMode()) return mockNova(alunoId, entrada);

  const supabase = await createClient();
  const { data, error } = await supabase
    .from("anotacoes")
    .insert({ aluno_id: alunoId, ...prepararGravacao(entrada) })
    .select(SELECT_RICH)
    .single();
  if (error) {
    console.error("[anotacoes] criarAnotacao:", error.message);
    return null;
  }
  return achatar(data as unknown as LinhaRich);
}

export async function atualizarAnotacao(
  id: string,
  alunoId: string,
  entrada: EntradaAnotacao,
): Promise<AnotacaoRich | null> {
  if (isMockMode()) {
    const alvo = MOCK_ANOTACOES.find((a) => a.id === id && a.aluno_id === alunoId);
    if (!alvo) return null;
    Object.assign(alvo, prepararGravacao(entrada), {
      atualizado_em: new Date().toISOString(),
    });
    return alvo;
  }

  const patch = prepararGravacao(entrada);
  if (Object.keys(patch).length === 0) return getAnotacao(id, alunoId);

  const supabase = await createClient();
  const { data, error } = await supabase
    .from("anotacoes")
    .update(patch)
    .eq("id", id)
    .eq("aluno_id", alunoId) // cinto e suspensório: a RLS já filtra
    .select(SELECT_RICH)
    .maybeSingle();
  if (error) {
    console.error("[anotacoes] atualizarAnotacao:", error.message);
    return null;
  }
  return data ? achatar(data as unknown as LinhaRich) : null;
}

export async function excluirAnotacao(id: string, alunoId: string): Promise<boolean> {
  if (isMockMode()) {
    const i = MOCK_ANOTACOES.findIndex((a) => a.id === id && a.aluno_id === alunoId);
    if (i === -1) return false;
    MOCK_ANOTACOES.splice(i, 1);
    return true;
  }
  const supabase = await createClient();
  const { error } = await supabase
    .from("anotacoes")
    .delete()
    .eq("id", id)
    .eq("aluno_id", alunoId);
  if (error) {
    console.error("[anotacoes] excluirAnotacao:", error.message);
    return false;
  }
  return true;
}

/** Quantas anotações o discípulo tem (atalho do painel). */
export async function contarAnotacoes(alunoId: string): Promise<number> {
  if (isMockMode()) {
    return MOCK_ANOTACOES.filter((a) => a.aluno_id === alunoId && !a.arquivada).length;
  }
  const supabase = await createClient();
  const { count } = await supabase
    .from("anotacoes")
    .select("id", { count: "exact", head: true })
    .eq("aluno_id", alunoId)
    .eq("arquivada", false);
  return count ?? 0;
}
