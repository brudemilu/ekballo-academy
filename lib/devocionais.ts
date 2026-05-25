// =============================================================
// EKBALLO ACADEMY · Helpers de Devocionais
// Admin posta 1 devocional por dia. Aluno lê o do dia + histórico.
// =============================================================

import { createClient } from "@/lib/supabase/server";
import { isMockMode } from "@/lib/mock-data";

export type Devocional = {
  id: string;
  data: string;             // "YYYY-MM-DD"
  titulo: string | null;
  versiculo_ref: string;
  versiculo_texto: string;
  versiculo_versao: string;
  reflexao: string;
  autor: string | null;
  publicado: boolean;
  criado_em: string;
  atualizado_em: string;
};

// "YYYY-MM-DD" em horário local (America/Sao_Paulo padrão do servidor SBB)
export function hojeDateStr(): string {
  const d = new Date();
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
}

const MOCK_DEVOCIONAL: Devocional = {
  id: "mock-dev-1",
  data: hojeDateStr(),
  titulo: "Pra começar o dia",
  versiculo_ref: "Romanos 8:28",
  versiculo_texto:
    "E sabemos que Deus faz todas as coisas cooperarem para o bem daqueles que o amam e que são chamados de acordo com seu propósito.",
  versiculo_versao: "NVT",
  reflexao:
    "Hoje, lembre-se: o que parece desordem nas suas mãos, está sob o cuidado de Deus.\n\nNão é que tudo seja bom — é que tudo coopera. Há diferença.",
  autor: "Pr. Bruno",
  publicado: true,
  criado_em: new Date().toISOString(),
  atualizado_em: new Date().toISOString(),
};

// Lista os mais recentes (publicados) — usado no histórico
export async function listDevocionais(limit = 30): Promise<Devocional[]> {
  if (isMockMode()) return [MOCK_DEVOCIONAL];
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocionais")
    .select("*")
    .eq("publicado", true)
    .order("data", { ascending: false })
    .limit(limit);
  return (data || []) as Devocional[];
}

// Lista TODOS (publicados ou não) — só admin via RLS
export async function listAllDevocionaisAdmin(limit = 100): Promise<Devocional[]> {
  if (isMockMode()) return [MOCK_DEVOCIONAL];
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocionais")
    .select("*")
    .order("data", { ascending: false })
    .limit(limit);
  return (data || []) as Devocional[];
}

export async function getDevocionalDoDia(
  dataStr: string = hojeDateStr()
): Promise<Devocional | null> {
  if (isMockMode()) return dataStr === MOCK_DEVOCIONAL.data ? MOCK_DEVOCIONAL : null;
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocionais")
    .select("*")
    .eq("data", dataStr)
    .eq("publicado", true)
    .maybeSingle();
  return (data as Devocional) || null;
}

// Admin-side: pega por id (publicado ou não)
export async function getDevocionalById(id: string): Promise<Devocional | null> {
  if (isMockMode()) return id === MOCK_DEVOCIONAL.id ? MOCK_DEVOCIONAL : null;
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocionais")
    .select("*")
    .eq("id", id)
    .maybeSingle();
  return (data as Devocional) || null;
}

// Formata "2026-05-25" → "25 de mai" (curto) ou "Segunda, 25 de maio" (longo)
export function formatDataPt(dataStr: string, longo = false): string {
  const [y, m, d] = dataStr.split("-").map(Number);
  const date = new Date(y, m - 1, d);
  const meses = [
    "janeiro","fevereiro","março","abril","maio","junho",
    "julho","agosto","setembro","outubro","novembro","dezembro",
  ];
  const mesesCurto = meses.map((s) => s.slice(0, 3));
  const dias = [
    "domingo","segunda","terça","quarta","quinta","sexta","sábado",
  ];
  if (longo) {
    return `${dias[date.getDay()].charAt(0).toUpperCase()}${dias[date.getDay()].slice(1)}, ${d} de ${meses[m - 1]}`;
  }
  return `${d} de ${mesesCurto[m - 1]}`;
}
