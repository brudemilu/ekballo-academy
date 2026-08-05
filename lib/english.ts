// =============================================================
// EKBALLO ENGLISH · Facade de dados da vertente de inglês
//
// Mesmo contrato do lib/db.ts: toda função começa com um branch de
// mock e só depois vai ao Supabase. O fixture de mock cobre a
// primeira lição do Módulo 1 — o bastante pra a UI renderizar em
// modo demonstração sem banco.
//
// Tipos e correção ficam em lib/english-tipos.ts (puro), porque o
// player da lição é client component e não pode importar daqui.
// =============================================================

import { cache } from "react";
import { createClient } from "@/lib/supabase/server";
import { isMockMode } from "@/lib/mock-data";
import type {
  EnglishExercicio,
  EnglishLicao,
  EnglishModulo,
  EnglishModuloComLicoes,
  EnglishProgresso,
  EnglishStreak,
} from "@/lib/english-tipos";

export type * from "@/lib/english-tipos";
export { ENGLISH_CONQUISTAS, nomeConquista, normalizarResposta, respostaCorreta } from "@/lib/english-tipos";

// ---------------- Fixture de mock ----------------

const MOCK_MODULO: EnglishModulo = {
  id: "mock-modulo-1",
  numero: 1,
  slug: "primeiros-passos",
  titulo: "Primeiros passos",
  titulo_en: "First steps",
  descricao: "Cumprimentos, nome, idade, frases simples e a primeira confiança para falar.",
  nivel: "iniciante",
  publicado: true,
};

const MOCK_LICAO: EnglishLicao = {
  id: "mock-licao-1",
  modulo_id: "mock-modulo-1",
  numero: 1,
  slug: "hello-and-goodbye",
  titulo: "Hello and goodbye",
  titulo_pt: "Oi e tchau",
  objetivo: "Cumprimentar e se despedir em inglês em qualquer hora do dia, sem travar.",
  versiculo_ref: "Psalm 118:24",
  versiculo_en: "This is the day the Lord has made.",
  versiculo_pt: "Este é o dia que o Senhor fez.",
  publicado: true,
};

const MOCK_EXERCICIOS: EnglishExercicio[] = [
  {
    id: "mock-ex-1", licao_id: "mock-licao-1", ordem: 1, tipo: "vocabulario",
    enunciado: "Ouça e repita", pergunta: "Good morning", pergunta_pt: "Bom dia",
    resposta: null, aceitas: [], alternativas: [], dica: "gud mór-nin", audio_texto: "Good morning",
  },
  {
    id: "mock-ex-2", licao_id: "mock-licao-1", ordem: 2, tipo: "escolha",
    enunciado: "São 8 da manhã e você encontra alguém. O que você diz?",
    pergunta: null, pergunta_pt: null, resposta: null, aceitas: [],
    alternativas: [
      { texto: "Good night", correta: false },
      { texto: "Good morning", correta: true },
      { texto: "Goodbye", correta: false },
      { texto: "See you later", correta: false },
    ],
    dica: null, audio_texto: null,
  },
  {
    id: "mock-ex-3", licao_id: "mock-licao-1", ordem: 3, tipo: "traducao",
    enunciado: "Escreva em inglês", pergunta: null, pergunta_pt: "Boa tarde",
    resposta: "Good afternoon", aceitas: [], alternativas: [], dica: null, audio_texto: "Good afternoon",
  },
  {
    id: "mock-ex-4", licao_id: "mock-licao-1", ordem: 4, tipo: "montar",
    enunciado: "Monte a frase", pergunta: null, pergunta_pt: "Até mais tarde",
    resposta: "See you later", aceitas: [], alternativas: [], dica: null, audio_texto: "See you later",
  },
  {
    id: "mock-ex-5", licao_id: "mock-licao-1", ordem: 5, tipo: "falar",
    enunciado: "Fale em voz alta", pergunta: "Good morning!", pergunta_pt: "Bom dia!",
    resposta: "Good morning", aceitas: [], alternativas: [], dica: null, audio_texto: "Good morning",
  },
];

// ---------------- Leitura ----------------

/** Trilha completa: módulos + lições publicadas + progresso do aluno. */
export const listTrilha = cache(async (alunoId: string | null): Promise<EnglishModuloComLicoes[]> => {
  if (isMockMode()) {
    return [{
      ...MOCK_MODULO,
      licoes: [{ ...MOCK_LICAO, concluida: false, acertos: 0, total: 0 }],
      concluidas: 0,
    }];
  }

  const supabase = await createClient();

  const [{ data: modulos }, { data: licoes }] = await Promise.all([
    supabase.from("english_modulos").select("*").order("numero"),
    supabase.from("english_licoes").select("*").eq("publicado", true).order("numero"),
  ]);

  let progressoPorLicao = new Map<string, EnglishProgresso>();
  if (alunoId) {
    const { data: prog } = await supabase
      .from("english_progresso")
      .select("licao_id, acertos, total, vezes, concluido_em")
      .eq("aluno_id", alunoId);
    progressoPorLicao = new Map(
      ((prog || []) as EnglishProgresso[]).map((p) => [p.licao_id, p]),
    );
  }

  return ((modulos || []) as EnglishModulo[]).map((m) => {
    const doModulo = ((licoes || []) as EnglishLicao[])
      .filter((l) => l.modulo_id === m.id)
      .map((l) => {
        const p = progressoPorLicao.get(l.id);
        return { ...l, concluida: Boolean(p), acertos: p?.acertos ?? 0, total: p?.total ?? 0 };
      });
    return { ...m, licoes: doModulo, concluidas: doModulo.filter((l) => l.concluida).length };
  });
});

/** Lição pelo slug, já com o módulo a que pertence. */
export async function getLicaoBySlug(
  slug: string,
): Promise<{ licao: EnglishLicao; modulo: EnglishModulo } | null> {
  if (isMockMode()) {
    return slug === MOCK_LICAO.slug ? { licao: MOCK_LICAO, modulo: MOCK_MODULO } : null;
  }

  const supabase = await createClient();
  const { data: licao } = await supabase.from("english_licoes").select("*").eq("slug", slug).maybeSingle();
  if (!licao) return null;

  const { data: modulo } = await supabase
    .from("english_modulos")
    .select("*")
    .eq("id", licao.modulo_id)
    .maybeSingle();
  if (!modulo) return null;

  return { licao: licao as EnglishLicao, modulo: modulo as EnglishModulo };
}

export async function listExerciciosByLicao(licaoId: string): Promise<EnglishExercicio[]> {
  if (isMockMode()) return MOCK_EXERCICIOS;

  const supabase = await createClient();
  const { data } = await supabase
    .from("english_exercicios")
    .select("*")
    .eq("licao_id", licaoId)
    .order("ordem");

  return ((data || []) as EnglishExercicio[]).map((e) => ({
    ...e,
    aceitas: Array.isArray(e.aceitas) ? e.aceitas : [],
    alternativas: Array.isArray(e.alternativas) ? e.alternativas : [],
  }));
}

/** Próxima lição da trilha: a primeira ainda não concluída. */
export async function getProximaLicao(alunoId: string | null): Promise<EnglishLicao | null> {
  const trilha = await listTrilha(alunoId);
  for (const modulo of trilha) {
    if (!modulo.publicado) continue;
    const pendente = modulo.licoes.find((l) => !l.concluida);
    if (pendente) return pendente;
  }
  // Tudo concluído: devolve a última pra permitir revisão.
  const ultimo = trilha.filter((m) => m.publicado && m.licoes.length).at(-1);
  return ultimo?.licoes.at(-1) ?? null;
}

export async function getStreak(alunoId: string): Promise<EnglishStreak> {
  const vazio: EnglishStreak = { dias_seguidos: 0, recorde: 0, ultimo_dia: null, total_licoes: 0 };
  if (isMockMode()) return vazio;

  const supabase = await createClient();
  const { data } = await supabase
    .from("english_streak")
    .select("dias_seguidos, recorde, ultimo_dia, total_licoes")
    .eq("aluno_id", alunoId)
    .maybeSingle();

  return (data as EnglishStreak) || vazio;
}

export async function listConquistas(
  alunoId: string,
): Promise<{ chave: string; conquistada_em: string }[]> {
  if (isMockMode()) return [];

  const supabase = await createClient();
  const { data } = await supabase
    .from("english_conquistas")
    .select("chave, conquistada_em")
    .eq("aluno_id", alunoId)
    .order("conquistada_em", { ascending: false });

  return (data || []) as { chave: string; conquistada_em: string }[];
}

// ---------------- Admin ----------------

export type EnglishAdminStats = {
  modulos: number;
  modulosPublicados: number;
  licoes: number;
  exercicios: number;
  alunosAtivos: number;
  licoesConcluidas: number;
  maiorStreak: number;
};

export async function getEnglishAdminStats(): Promise<EnglishAdminStats> {
  if (isMockMode()) {
    return {
      modulos: 12, modulosPublicados: 1, licoes: 1, exercicios: MOCK_EXERCICIOS.length,
      alunosAtivos: 0, licoesConcluidas: 0, maiorStreak: 0,
    };
  }

  const supabase = await createClient();

  const [modulos, publicados, licoes, exercicios, progresso, streaks] = await Promise.all([
    supabase.from("english_modulos").select("id", { count: "exact", head: true }),
    supabase.from("english_modulos").select("id", { count: "exact", head: true }).eq("publicado", true),
    supabase.from("english_licoes").select("id", { count: "exact", head: true }),
    supabase.from("english_exercicios").select("id", { count: "exact", head: true }),
    supabase.from("english_progresso").select("aluno_id"),
    supabase.from("english_streak").select("dias_seguidos"),
  ]);

  const linhas = (progresso.data || []) as { aluno_id: string }[];
  const alunos = new Set(linhas.map((p) => p.aluno_id));
  const maiorStreak = ((streaks.data || []) as { dias_seguidos: number }[])
    .reduce((max, s) => Math.max(max, s.dias_seguidos), 0);

  return {
    modulos: modulos.count ?? 0,
    modulosPublicados: publicados.count ?? 0,
    licoes: licoes.count ?? 0,
    exercicios: exercicios.count ?? 0,
    alunosAtivos: alunos.size,
    licoesConcluidas: linhas.length,
    maiorStreak,
  };
}

/** Quem está praticando — alimenta o acompanhamento no painel pastoral. */
export async function listEnglishAlunos(): Promise<{
  aluno_id: string;
  nome: string;
  licoes: number;
  dias_seguidos: number;
  recorde: number;
  ultimo_dia: string | null;
}[]> {
  if (isMockMode()) return [];

  const supabase = await createClient();
  const { data: streaks } = await supabase
    .from("english_streak")
    .select("aluno_id, dias_seguidos, recorde, ultimo_dia")
    .order("dias_seguidos", { ascending: false });

  const linhas = (streaks || []) as {
    aluno_id: string; dias_seguidos: number; recorde: number; ultimo_dia: string | null;
  }[];
  if (!linhas.length) return [];

  const ids = linhas.map((s) => s.aluno_id);
  const [{ data: perfis }, { data: progresso }] = await Promise.all([
    supabase.from("profiles").select("id, nome, email").in("id", ids),
    supabase.from("english_progresso").select("aluno_id").in("aluno_id", ids),
  ]);

  const nomePorId = new Map(
    ((perfis || []) as { id: string; nome: string | null; email: string }[])
      .map((p) => [p.id, p.nome || p.email]),
  );

  const licoesPorAluno = new Map<string, number>();
  for (const p of (progresso || []) as { aluno_id: string }[]) {
    licoesPorAluno.set(p.aluno_id, (licoesPorAluno.get(p.aluno_id) || 0) + 1);
  }

  return linhas.map((s) => ({
    aluno_id: s.aluno_id,
    nome: nomePorId.get(s.aluno_id) || "Discípulo",
    licoes: licoesPorAluno.get(s.aluno_id) || 0,
    dias_seguidos: s.dias_seguidos,
    recorde: s.recorde,
    ultimo_dia: s.ultimo_dia,
  }));
}

/** Módulos com contagem de lições/exercícios — visão de conteúdo do admin. */
export async function listModulosAdmin(): Promise<
  (EnglishModulo & { licoes: number; exercicios: number })[]
> {
  if (isMockMode()) {
    return [{ ...MOCK_MODULO, licoes: 1, exercicios: MOCK_EXERCICIOS.length }];
  }

  const supabase = await createClient();
  const [{ data: modulos }, { data: licoes }, { data: exercicios }] = await Promise.all([
    supabase.from("english_modulos").select("*").order("numero"),
    supabase.from("english_licoes").select("id, modulo_id"),
    supabase.from("english_exercicios").select("licao_id"),
  ]);

  const licoesDoModulo = new Map<string, string[]>();
  for (const l of (licoes || []) as { id: string; modulo_id: string }[]) {
    licoesDoModulo.set(l.modulo_id, [...(licoesDoModulo.get(l.modulo_id) || []), l.id]);
  }

  const exerciciosPorLicao = new Map<string, number>();
  for (const e of (exercicios || []) as { licao_id: string }[]) {
    exerciciosPorLicao.set(e.licao_id, (exerciciosPorLicao.get(e.licao_id) || 0) + 1);
  }

  return ((modulos || []) as EnglishModulo[]).map((m) => {
    const ids = licoesDoModulo.get(m.id) || [];
    return {
      ...m,
      licoes: ids.length,
      exercicios: ids.reduce((soma, id) => soma + (exerciciosPorLicao.get(id) || 0), 0),
    };
  });
}
