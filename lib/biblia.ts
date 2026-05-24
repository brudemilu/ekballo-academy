// =============================================================
// EKBALLO ACADEMY · Leitor da Bíblia (ACF, domínio público)
// 66 livros, 31.106 versículos populados via migration 018.
// Em modo mock, devolve um dataset reduzido (Gênesis 1 + Salmos 23
// + Romanos 1) só pra UI não quebrar em dev.
// =============================================================

import { createClient } from "@/lib/supabase/server";
import { isMockMode } from "@/lib/mock-data";

export type BibliaLivro = {
  id: number;
  nome: string;
  abrev: string;
  testamento: "AT" | "NT";
  grupo: string;
  ordem: number;
  capitulos_total: number;
};

export type BibliaVersiculo = {
  livro_id: number;
  capitulo: number;
  versiculo: number;
  texto: string;
};

export type BibliaVersao = {
  sigla: string;
  nome: string;
  descricao: string | null;
  ativa: boolean;
  ordem: number;
  fonte_api_sigla?: string | null;
};

export const VERSAO_PADRAO = "ACF";

export const GRUPOS_AT: { key: string; label: string }[] = [
  { key: "pentateuco", label: "Pentateuco" },
  { key: "historicos", label: "Históricos" },
  { key: "poeticos", label: "Poéticos / Sapienciais" },
  { key: "profetas-maiores", label: "Profetas Maiores" },
  { key: "profetas-menores", label: "Profetas Menores" },
];

export const GRUPOS_NT: { key: string; label: string }[] = [
  { key: "evangelhos", label: "Evangelhos" },
  { key: "historicos-nt", label: "Histórico" },
  { key: "cartas-paulinas", label: "Cartas Paulinas" },
  { key: "cartas-gerais", label: "Cartas Gerais" },
  { key: "apocaliptico", label: "Apocalíptico" },
];

// -------- MOCK DATA ----------------------------------------------------------
const MOCK_LIVROS: BibliaLivro[] = [
  { id: 1, nome: "Gênesis", abrev: "gn", testamento: "AT", grupo: "pentateuco", ordem: 1, capitulos_total: 50 },
  { id: 19, nome: "Salmos", abrev: "sl", testamento: "AT", grupo: "poeticos", ordem: 2, capitulos_total: 150 },
  { id: 45, nome: "Romanos", abrev: "rm", testamento: "NT", grupo: "cartas-paulinas", ordem: 1, capitulos_total: 16 },
];

const MOCK_VERSICULOS: BibliaVersiculo[] = [
  { livro_id: 1, capitulo: 1, versiculo: 1, texto: "No princípio criou Deus o céu e a terra." },
  { livro_id: 1, capitulo: 1, versiculo: 2, texto: "E a terra era sem forma e vazia; e havia trevas sobre a face do abismo; e o Espírito de Deus se movia sobre a face das águas." },
  { livro_id: 1, capitulo: 1, versiculo: 3, texto: "E disse Deus: Haja luz; e houve luz." },
  { livro_id: 19, capitulo: 23, versiculo: 1, texto: "O SENHOR é o meu pastor, nada me faltará." },
  { livro_id: 19, capitulo: 23, versiculo: 2, texto: "Deitar-me faz em verdes pastos, guia-me mansamente a águas tranquilas." },
  { livro_id: 19, capitulo: 23, versiculo: 3, texto: "Refrigera a minha alma; guia-me pelas veredas da justiça, por amor do seu nome." },
  { livro_id: 45, capitulo: 1, versiculo: 16, texto: "Porque não me envergonho do evangelho de Cristo, pois é o poder de Deus para salvação de todo aquele que crê; primeiro do judeu, e também do grego." },
];

const MOCK_VERSOES: BibliaVersao[] = [
  { sigla: "ACF", nome: "Almeida Corrigida Fiel", descricao: "Domínio público.", ativa: true, ordem: 1 },
  { sigla: "NAA", nome: "Nova Almeida Atualizada", descricao: "Aguardando licenciamento.", ativa: false, ordem: 2 },
  { sigla: "NVT", nome: "Nova Versão Transformadora", descricao: "Aguardando licenciamento.", ativa: false, ordem: 3 },
  { sigla: "NVI", nome: "Nova Versão Internacional", descricao: "Aguardando licenciamento.", ativa: false, ordem: 4 },
];

// -------- API ----------------------------------------------------------------

export async function listVersoes(): Promise<BibliaVersao[]> {
  if (isMockMode()) {
    return [...MOCK_VERSOES].sort((a, b) => a.ordem - b.ordem);
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("biblia_versoes")
    .select("sigla, nome, descricao, ativa, ordem, fonte_api_sigla")
    .order("ordem", { ascending: true });
  return (data || []) as BibliaVersao[];
}

export async function getVersao(sigla: string): Promise<BibliaVersao | null> {
  if (isMockMode()) {
    return MOCK_VERSOES.find((v) => v.sigla === sigla) || null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("biblia_versoes")
    .select("sigla, nome, descricao, ativa, ordem, fonte_api_sigla")
    .eq("sigla", sigla)
    .maybeSingle();
  return (data as BibliaVersao) || null;
}

export async function listLivros(): Promise<BibliaLivro[]> {
  if (isMockMode()) {
    return [...MOCK_LIVROS].sort((a, b) => a.id - b.id);
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("biblia_livros")
    .select("*")
    .order("id", { ascending: true });
  return (data || []) as BibliaLivro[];
}

export async function getLivro(id: number): Promise<BibliaLivro | null> {
  if (isMockMode()) {
    return MOCK_LIVROS.find((l) => l.id === id) || null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("biblia_livros")
    .select("*")
    .eq("id", id)
    .single();
  return (data as BibliaLivro) || null;
}

export async function getCapitulo(
  livroId: number,
  capitulo: number,
  versao: string = VERSAO_PADRAO
): Promise<BibliaVersiculo[]> {
  if (isMockMode()) {
    return MOCK_VERSICULOS.filter(
      (v) => v.livro_id === livroId && v.capitulo === capitulo
    ).sort((a, b) => a.versiculo - b.versiculo);
  }

  const supabase = await createClient();

  // 1) Tenta banco local primeiro (rápido)
  const { data: locais } = await supabase
    .from("biblia_versiculos")
    .select("livro_id, capitulo, versiculo, texto")
    .eq("versao", versao)
    .eq("livro_id", livroId)
    .eq("capitulo", capitulo)
    .order("versiculo", { ascending: true });
  if (locais && locais.length > 0) return locais as BibliaVersiculo[];

  // 2) Não tem no banco. Verifica se versão tem fonte_api → busca externa
  const { data: versaoRow } = await supabase
    .from("biblia_versoes")
    .select("sigla, fonte_api_sigla, ativa")
    .eq("sigla", versao)
    .maybeSingle();
  const sigla = versaoRow?.fonte_api_sigla as string | undefined;
  if (!versaoRow?.ativa || !sigla) return [];

  // Cache via CDN do Vercel (revalidate 24h, configurado no fetch da função).
  // Pular cache no banco evita complexidade de RLS (aluno não tem permissão
  // de escrita em biblia_versiculos).
  const { fetchCapituloViaApi } = await import("@/lib/biblia-api");
  return await fetchCapituloViaApi(sigla, livroId, capitulo);
}

// Busca versículos individuais (usado pelo gerador de imagem).
export async function getVersiculos(
  refs: { livro_id: number; capitulo: number; versiculo: number }[],
  versao: string = VERSAO_PADRAO
): Promise<BibliaVersiculo[]> {
  if (refs.length === 0) return [];
  if (isMockMode()) {
    return MOCK_VERSICULOS.filter((v) =>
      refs.some(
        (r) =>
          r.livro_id === v.livro_id &&
          r.capitulo === v.capitulo &&
          r.versiculo === v.versiculo
      )
    );
  }
  const supabase = await createClient();
  const byLivCap = new Map<string, number[]>();
  for (const r of refs) {
    const k = `${r.livro_id}::${r.capitulo}`;
    if (!byLivCap.has(k)) byLivCap.set(k, []);
    byLivCap.get(k)!.push(r.versiculo);
  }
  const result: BibliaVersiculo[] = [];
  for (const [k, vs] of byLivCap.entries()) {
    const [livStr, capStr] = k.split("::");
    const { data } = await supabase
      .from("biblia_versiculos")
      .select("livro_id, capitulo, versiculo, texto")
      .eq("versao", versao)
      .eq("livro_id", Number(livStr))
      .eq("capitulo", Number(capStr))
      .in("versiculo", vs);
    if (data) result.push(...(data as BibliaVersiculo[]));
  }
  return result.sort(
    (a, b) =>
      a.livro_id - b.livro_id ||
      a.capitulo - b.capitulo ||
      a.versiculo - b.versiculo
  );
}

// Agrupa livros por testamento e grupo
export function agrupar(livros: BibliaLivro[]) {
  const at: Record<string, BibliaLivro[]> = {};
  const nt: Record<string, BibliaLivro[]> = {};
  for (const l of livros) {
    const bucket = l.testamento === "AT" ? at : nt;
    if (!bucket[l.grupo]) bucket[l.grupo] = [];
    bucket[l.grupo].push(l);
  }
  for (const g of Object.values(at)) g.sort((a, b) => a.ordem - b.ordem);
  for (const g of Object.values(nt)) g.sort((a, b) => a.ordem - b.ordem);
  return { at, nt };
}

// Renderiza "Gênesis 1:1" ou "Salmos 23:1-3" ou "João 3:16,17"
export function formatRef(
  livroNome: string,
  capitulo: number,
  versiculos: number[]
): string {
  if (versiculos.length === 0) return `${livroNome} ${capitulo}`;
  const sorted = [...versiculos].sort((a, b) => a - b);
  // Detecta range contínuo
  const isRange =
    sorted.length > 1 && sorted.every((v, i) => i === 0 || v === sorted[i - 1] + 1);
  if (isRange) {
    return `${livroNome} ${capitulo}:${sorted[0]}-${sorted[sorted.length - 1]}`;
  }
  return `${livroNome} ${capitulo}:${sorted.join(",")}`;
}
