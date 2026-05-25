// =============================================================
// EKBALLO ACADEMY · Helpers de Planos de Leitura
// Consulta planos_leitura, plano_dias e plano_progresso. Em modo
// mock, devolve um dataset reduzido pra UI não quebrar em dev.
// =============================================================

import { createClient } from "@/lib/supabase/server";
import { isMockMode } from "@/lib/mock-data";

export type PlanoLeitura = {
  id: string;
  slug: string;
  nome: string;
  descricao: string | null;
  imagem_url: string | null;
  dias_total: number;
  publicado: boolean;
  ordem: number;
};

export type PlanoPassagem = {
  livro_id: number;
  cap_inicio: number;
  cap_fim: number;
};

export type PlanoDia = {
  plano_id: string;
  dia: number;
  data_sugerida: string | null;
  referencia_texto: string;
  passagens: PlanoPassagem[];
};

export type PlanoProgresso = {
  dia: number;
  concluido_em: string;
};

// -------- MOCK -------------------------------------------------------------
const MOCK_PLANO: PlanoLeitura = {
  id: "mock-plano-1",
  slug: "jornada-180",
  nome: "Jornada 180º",
  descricao: "167 dias de leitura bíblica contínua.",
  imagem_url: null,
  dias_total: 167,
  publicado: true,
  ordem: 1,
};

const MOCK_DIAS: PlanoDia[] = [
  {
    plano_id: "mock-plano-1",
    dia: 1,
    data_sugerida: "01/01",
    referencia_texto: "Gn 1–7",
    passagens: [{ livro_id: 1, cap_inicio: 1, cap_fim: 7 }],
  },
  {
    plano_id: "mock-plano-1",
    dia: 2,
    data_sugerida: "02/01",
    referencia_texto: "Gn 8–14",
    passagens: [{ livro_id: 1, cap_inicio: 8, cap_fim: 14 }],
  },
];

// -------- API --------------------------------------------------------------

export async function listPlanos(): Promise<PlanoLeitura[]> {
  if (isMockMode()) return [MOCK_PLANO];
  const supabase = await createClient();
  const { data } = await supabase
    .from("planos_leitura")
    .select("*")
    .eq("publicado", true)
    .order("ordem", { ascending: true });
  return (data || []) as PlanoLeitura[];
}

export async function getPlanoBySlug(slug: string): Promise<PlanoLeitura | null> {
  if (isMockMode()) return slug === MOCK_PLANO.slug ? MOCK_PLANO : null;
  const supabase = await createClient();
  const { data } = await supabase
    .from("planos_leitura")
    .select("*")
    .eq("slug", slug)
    .eq("publicado", true)
    .maybeSingle();
  return (data as PlanoLeitura) || null;
}

export async function listDiasDoPlano(planoId: string): Promise<PlanoDia[]> {
  if (isMockMode()) return MOCK_DIAS;
  const supabase = await createClient();
  const { data } = await supabase
    .from("plano_dias")
    .select("*")
    .eq("plano_id", planoId)
    .order("dia", { ascending: true });
  return (data || []) as PlanoDia[];
}

export async function getDiaDoPlano(
  planoId: string,
  dia: number
): Promise<PlanoDia | null> {
  if (isMockMode()) return MOCK_DIAS.find((d) => d.dia === dia) || null;
  const supabase = await createClient();
  const { data } = await supabase
    .from("plano_dias")
    .select("*")
    .eq("plano_id", planoId)
    .eq("dia", dia)
    .maybeSingle();
  return (data as PlanoDia) || null;
}

export async function listProgressoDoAluno(
  planoId: string,
  alunoId: string
): Promise<Set<number>> {
  if (isMockMode()) return new Set();
  const supabase = await createClient();
  const { data } = await supabase
    .from("plano_progresso")
    .select("dia")
    .eq("plano_id", planoId)
    .eq("aluno_id", alunoId);
  return new Set((data || []).map((p: { dia: number }) => p.dia));
}

// Pega o próximo dia que o aluno ainda não fez (pra "continue de onde parou")
export async function proximoDiaPendente(
  planoId: string,
  alunoId: string,
  diasTotal: number
): Promise<number> {
  const concluidos = await listProgressoDoAluno(planoId, alunoId);
  for (let d = 1; d <= diasTotal; d++) {
    if (!concluidos.has(d)) return d;
  }
  return diasTotal; // tudo concluído
}

// Resolve nome do livro pra cada passagem (1 query batch)
export async function enriquecerComLivros(
  passagens: PlanoPassagem[]
): Promise<(PlanoPassagem & { livro_nome: string; livro_abrev: string })[]> {
  if (passagens.length === 0) return [];
  if (isMockMode()) {
    return passagens.map((p) => ({
      ...p,
      livro_nome: p.livro_id === 1 ? "Gênesis" : "Livro " + p.livro_id,
      livro_abrev: p.livro_id === 1 ? "gn" : "??",
    }));
  }
  const supabase = await createClient();
  const ids = Array.from(new Set(passagens.map((p) => p.livro_id)));
  const { data } = await supabase
    .from("biblia_livros")
    .select("id, nome, abrev")
    .in("id", ids);
  type LivroLite = { id: number; nome: string; abrev: string };
  const map = new Map<number, LivroLite>(
    ((data || []) as LivroLite[]).map((l) => [l.id, l])
  );
  return passagens.map((p) => {
    const l = map.get(p.livro_id);
    return {
      ...p,
      livro_nome: l?.nome || `Livro ${p.livro_id}`,
      livro_abrev: l?.abrev || "??",
    };
  });
}
