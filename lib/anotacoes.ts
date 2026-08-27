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
  DIAS_LIXEIRA,
  type Anotacao,
  type AnotacaoRich,
  type CategoriaAnotacao,
  type CorAnotacao,
  type PastaAnotacao,
} from "@/lib/anotacoes-meta";

export type { Anotacao, AnotacaoRich, PastaAnotacao } from "@/lib/anotacoes-meta";

// Campos que o cliente pode mandar. Nada além disso é escrito no banco.
export type EntradaAnotacao = {
  titulo?: string;
  conteudo_html?: string;
  categoria?: CategoriaAnotacao;
  cor?: CorAnotacao;
  tags?: string[];
  curso_id?: string | null;
  aula_id?: string | null;
  pasta_id?: string | null;
  fixada?: boolean;
  arquivada?: boolean;
};

const SELECT_RICH = `
  id, aluno_id, titulo, conteudo_html, conteudo_texto, categoria, cor, tags,
  curso_id, aula_id, pasta_id, fixada, arquivada, excluida_em,
  criado_em, atualizado_em,
  cursos ( titulo, slug ),
  aulas ( titulo ),
  anotacao_pastas ( nome )
`;

type LinhaRich = Anotacao & {
  cursos?: { titulo: string; slug: string } | null;
  aulas?: { titulo: string } | null;
  anotacao_pastas?: { nome: string } | null;
};

function achatar(linha: LinhaRich): AnotacaoRich {
  const { cursos, aulas, anotacao_pastas, ...resto } = linha;
  return {
    ...resto,
    tags: resto.tags ?? [],
    curso_titulo: cursos?.titulo ?? null,
    curso_slug: cursos?.slug ?? null,
    aula_titulo: aulas?.titulo ?? null,
    pasta_nome: anotacao_pastas?.nome ?? null,
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
  if (entrada.pasta_id !== undefined) linha.pasta_id = entrada.pasta_id || null;
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
  __ekballoAnotacoes?: { itens: AnotacaoRich[]; seq: number; pastas: PastaAnotacao[] };
}).__ekballoAnotacoes ??= { itens: [], seq: 0, pastas: [] });
const MOCK_ANOTACOES = mockStore.itens;
const MOCK_PASTAS = (mockStore.pastas ??= []);

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
    pasta_id: null,
    fixada: false,
    arquivada: false,
    excluida_em: null,
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
  opcoes: {
    incluirArquivadas?: boolean;
    cursoId?: string;
    aulaId?: string;
    /** true = devolve a LIXEIRA em vez das anotações vivas. */
    lixeira?: boolean;
  } = {},
): Promise<AnotacaoRich[]> {
  if (isMockMode()) {
    return MOCK_ANOTACOES.filter(
      (a) =>
        a.aluno_id === alunoId &&
        !!a.excluida_em === !!opcoes.lixeira &&
        (opcoes.incluirArquivadas || !a.arquivada) &&
        (!opcoes.cursoId || a.curso_id === opcoes.cursoId) &&
        (!opcoes.aulaId || a.aula_id === opcoes.aulaId),
    ).map((a) => ({
      // No Supabase o nome da pasta vem do join; aqui é resolvido na mão.
      ...a,
      pasta_nome: MOCK_PASTAS.find((p) => p.id === a.pasta_id)?.nome ?? null,
    }));
  }

  const supabase = await createClient();
  let q = supabase
    .from("anotacoes")
    .select(SELECT_RICH)
    .eq("aluno_id", alunoId)
    .order("fixada", { ascending: false })
    .order("atualizado_em", { ascending: false })
    .limit(500);


  // O que está na lixeira nunca aparece nas listas normais, nem arquivado.
  q = opcoes.lixeira ? q.not("excluida_em", "is", null) : q.is("excluida_em", null);

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
    const alvo = MOCK_ANOTACOES.find((a) => a.id === id && a.aluno_id === alunoId);
    return alvo
      ? { ...alvo, pasta_nome: MOCK_PASTAS.find((p) => p.id === alvo.pasta_id)?.nome ?? null }
      : null;
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

/**
 * "Excluir" no caderno NÃO apaga: carimba `excluida_em` e manda pra lixeira,
 * onde a anotação fica DIAS_LIXEIRA dias recuperável. O apagão real é do job
 * `expurgar_anotacoes_lixeira` (pg_cron) ou do botão "excluir agora".
 */
export async function moverParaLixeira(id: string, alunoId: string): Promise<boolean> {
  const agora = new Date().toISOString();
  if (isMockMode()) {
    const alvo = MOCK_ANOTACOES.find((a) => a.id === id && a.aluno_id === alunoId);
    if (!alvo) return false;
    alvo.excluida_em = agora;
    return true;
  }
  const supabase = await createClient();
  const { error } = await supabase
    .from("anotacoes")
    .update({ excluida_em: agora })
    .eq("id", id)
    .eq("aluno_id", alunoId);
  if (error) {
    console.error("[anotacoes] moverParaLixeira:", error.message);
    return false;
  }
  return true;
}

export async function restaurarAnotacao(id: string, alunoId: string): Promise<boolean> {
  if (isMockMode()) {
    const alvo = MOCK_ANOTACOES.find((a) => a.id === id && a.aluno_id === alunoId);
    if (!alvo) return false;
    alvo.excluida_em = null;
    return true;
  }
  const supabase = await createClient();
  const { error } = await supabase
    .from("anotacoes")
    .update({ excluida_em: null })
    .eq("id", id)
    .eq("aluno_id", alunoId);
  if (error) {
    console.error("[anotacoes] restaurarAnotacao:", error.message);
    return false;
  }
  return true;
}

/** Apaga de verdade — sem volta. Só do botão explícito dentro da lixeira. */
export async function excluirAnotacao(id: string, alunoId: string): Promise<boolean> {
  // Os arquivos anexados precisam sair antes: a linha da tabela cai por
  // cascade, mas o binário no bucket ficaria ocupando espaço para sempre.
  try {
    const { excluirAnexosDaAnotacao } = await import("@/lib/anotacoes-anexos");
    await excluirAnexosDaAnotacao(id, alunoId);
  } catch (e) {
    console.error("[anotacoes] limpar anexos:", (e as Error).message);
  }

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

/** Esvazia a lixeira inteira do aluno. Devolve quantas foram apagadas. */
export async function esvaziarLixeira(alunoId: string): Promise<number> {
  // Mesma limpeza da exclusão individual, para cada anotação da lixeira.
  try {
    const naLixeira = await listAnotacoes(alunoId, { lixeira: true, incluirArquivadas: true });
    const { excluirAnexosDaAnotacao } = await import("@/lib/anotacoes-anexos");
    for (const a of naLixeira) await excluirAnexosDaAnotacao(a.id, alunoId);
  } catch (e) {
    console.error("[anotacoes] limpar anexos da lixeira:", (e as Error).message);
  }

  if (isMockMode()) {
    const alvos = MOCK_ANOTACOES.filter((a) => a.aluno_id === alunoId && a.excluida_em);
    for (const a of alvos) {
      MOCK_ANOTACOES.splice(MOCK_ANOTACOES.indexOf(a), 1);
    }
    return alvos.length;
  }
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("anotacoes")
    .delete()
    .eq("aluno_id", alunoId)
    .not("excluida_em", "is", null)
    .select("id");
  if (error) {
    console.error("[anotacoes] esvaziarLixeira:", error.message);
    return 0;
  }
  return data?.length ?? 0;
}

// -------- Pastas --------

export async function listPastas(alunoId: string): Promise<PastaAnotacao[]> {
  if (isMockMode()) {
    return MOCK_PASTAS.filter((p) => p.aluno_id === alunoId);
  }
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("anotacao_pastas")
    .select("*")
    .eq("aluno_id", alunoId)
    .order("ordem", { ascending: true })
    .order("nome", { ascending: true });
  if (error) {
    console.error("[anotacoes] listPastas:", error.message);
    return [];
  }
  return (data || []) as PastaAnotacao[];
}

function limparNomePasta(nome: string): string {
  return String(nome).replace(/\s+/g, " ").trim().slice(0, 60);
}

export async function criarPasta(
  alunoId: string,
  nome: string,
  cor: CorAnotacao = "areia",
): Promise<PastaAnotacao | null> {
  const limpo = limparNomePasta(nome);
  if (!limpo) return null;

  if (isMockMode()) {
    // Mesma regra do índice único do banco: nome repetido devolve a existente.
    const jaExiste = MOCK_PASTAS.find(
      (p) => p.aluno_id === alunoId && p.nome.toLowerCase() === limpo.toLowerCase(),
    );
    if (jaExiste) return jaExiste;
    const nova: PastaAnotacao = {
      id: `mock-pasta-${MOCK_PASTAS.length + 1}-${limpo.toLowerCase().replace(/\W+/g, "")}`,
      aluno_id: alunoId,
      nome: limpo,
      cor: ehCor(cor) ? cor : "areia",
      ordem: MOCK_PASTAS.length,
      criado_em: new Date().toISOString(),
      atualizado_em: new Date().toISOString(),
    };
    MOCK_PASTAS.push(nova);
    return nova;
  }

  const supabase = await createClient();
  const { data, error } = await supabase
    .from("anotacao_pastas")
    .insert({ aluno_id: alunoId, nome: limpo, cor: ehCor(cor) ? cor : "areia" })
    .select("*")
    .single();
  if (error) {
    // 23505 = nome repetido no mesmo caderno; devolve a que já existe.
    if (error.code === "23505") {
      const { data: existente } = await supabase
        .from("anotacao_pastas")
        .select("*")
        .eq("aluno_id", alunoId)
        .ilike("nome", limpo)
        .maybeSingle();
      return (existente as PastaAnotacao) ?? null;
    }
    console.error("[anotacoes] criarPasta:", error.message);
    return null;
  }
  return data as PastaAnotacao;
}

export async function atualizarPasta(
  id: string,
  alunoId: string,
  patch: { nome?: string; cor?: CorAnotacao; ordem?: number },
): Promise<PastaAnotacao | null> {
  const linha: Record<string, unknown> = {};
  if (patch.nome !== undefined) {
    const limpo = limparNomePasta(patch.nome);
    if (!limpo) return null;
    linha.nome = limpo;
  }
  if (patch.cor !== undefined && ehCor(patch.cor)) linha.cor = patch.cor;
  if (patch.ordem !== undefined && Number.isFinite(patch.ordem)) linha.ordem = patch.ordem;
  if (Object.keys(linha).length === 0) return null;

  if (isMockMode()) {
    const alvo = MOCK_PASTAS.find((p) => p.id === id && p.aluno_id === alunoId);
    if (!alvo) return null;
    Object.assign(alvo, linha, { atualizado_em: new Date().toISOString() });
    return alvo;
  }

  const supabase = await createClient();
  const { data, error } = await supabase
    .from("anotacao_pastas")
    .update(linha)
    .eq("id", id)
    .eq("aluno_id", alunoId)
    .select("*")
    .maybeSingle();
  if (error) {
    console.error("[anotacoes] atualizarPasta:", error.message);
    return null;
  }
  return (data as PastaAnotacao) ?? null;
}

/**
 * Apaga a pasta. As anotações de dentro NÃO são apagadas — a FK é
 * `on delete set null`, então elas voltam pra "Sem pasta".
 */
export async function excluirPasta(id: string, alunoId: string): Promise<boolean> {
  if (isMockMode()) {
    const i = MOCK_PASTAS.findIndex((p) => p.id === id && p.aluno_id === alunoId);
    if (i === -1) return false;
    MOCK_PASTAS.splice(i, 1);
    for (const a of MOCK_ANOTACOES) if (a.pasta_id === id) a.pasta_id = null;
    return true;
  }
  const supabase = await createClient();
  const { error } = await supabase
    .from("anotacao_pastas")
    .delete()
    .eq("id", id)
    .eq("aluno_id", alunoId);
  if (error) {
    console.error("[anotacoes] excluirPasta:", error.message);
    return false;
  }
  return true;
}

/** Quantas anotações o discípulo tem (atalho do painel). */
export async function contarAnotacoes(alunoId: string): Promise<number> {
  if (isMockMode()) {
    return MOCK_ANOTACOES.filter(
      (a) => a.aluno_id === alunoId && !a.arquivada && !a.excluida_em,
    ).length;
  }
  const supabase = await createClient();
  const { count } = await supabase
    .from("anotacoes")
    .select("id", { count: "exact", head: true })
    .eq("aluno_id", alunoId)
    .eq("arquivada", false)
    .is("excluida_em", null);
  return count ?? 0;
}
