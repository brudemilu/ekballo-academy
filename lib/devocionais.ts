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

// Converte "YYYY-MM-DD" pro dia do ano em calendário não-bissexto (1..365).
// Em ano bissexto, Fev 29 cai no slot 59 (mesmo dia de Fev 28) — simples.
export function diaAnoFromDateStr(dataStr: string): number {
  const [, mStr, dStr] = dataStr.split("-");
  const m = Number(mStr);
  const d = Number(dStr);
  const diasMes = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  if (m === 2 && d === 29) {
    let acc = 0;
    for (let i = 0; i < 1; i++) acc += diasMes[i];
    return acc + 28;
  }
  let acc = 0;
  for (let i = 0; i < m - 1; i++) acc += diasMes[i];
  return acc + d;
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

// Pega o devocional do ciclo perpétuo (devocional_anual) pelo dia do ano.
// Renderiza com o mesmo shape de Devocional pra reusar o card.
async function getDevocionalAnualByDiaAno(
  dataStr: string
): Promise<Devocional | null> {
  if (isMockMode()) return null;
  const diaAno = diaAnoFromDateStr(dataStr);
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocional_anual")
    .select("*")
    .eq("dia_ano", diaAno)
    .eq("publicado", true)
    .maybeSingle();
  if (!data) return null;
  const row = data as {
    dia_ano: number;
    titulo: string;
    versiculo_ref: string;
    versiculo_texto: string;
    versiculo_versao: string;
    reflexao: string;
    autor: string;
    publicado: boolean;
    criado_em: string;
    atualizado_em: string;
  };
  return {
    id: `anual-${row.dia_ano}`,
    data: dataStr,
    titulo: row.titulo,
    versiculo_ref: row.versiculo_ref,
    versiculo_texto: row.versiculo_texto,
    versiculo_versao: row.versiculo_versao,
    reflexao: row.reflexao,
    autor: row.autor,
    publicado: row.publicado,
    criado_em: row.criado_em,
    atualizado_em: row.atualizado_em,
  };
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
  if (data) return data as Devocional;
  // Fallback: ciclo perpétuo de 365 devocionais (assinados Pr. Bruno Fernandes)
  return getDevocionalAnualByDiaAno(dataStr);
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

// ---------------------------------------------------------------
// Devocional Anual — ciclo evergreen de 365 dias
// ---------------------------------------------------------------

export type DevocionalAnualResumo = {
  dia_ano: number;
  mes: number;
  dia: number;
  tema: string;
  titulo: string;
  versiculo_ref: string;
};

export type DevocionalAnualCompleto = DevocionalAnualResumo & {
  versiculo_texto: string;
  versiculo_versao: string;
  reflexao: string;
  autor: string;
};

// Lista resumida dos 365 (publicados), ordenados por dia_ano. Sem reflexão.
export async function listDevocionalAnualResumo(): Promise<DevocionalAnualResumo[]> {
  if (isMockMode()) {
    return [
      {
        dia_ano: 1, mes: 1, dia: 1, tema: "Recomeço",
        titulo: "Cristo te fez novo", versiculo_ref: "2 Coríntios 5:17",
      },
      {
        dia_ano: 2, mes: 1, dia: 2, tema: "Recomeço",
        titulo: "Soltando o que ficou pra trás", versiculo_ref: "Filipenses 3:13-14",
      },
    ];
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocional_anual")
    .select("dia_ano, mes, dia, tema, titulo, versiculo_ref")
    .eq("publicado", true)
    .order("dia_ano", { ascending: true });
  return (data || []) as DevocionalAnualResumo[];
}

// Detalhe de um devocional anual (com reflexão)
export async function getDevocionalAnualByDia(
  diaAno: number
): Promise<DevocionalAnualCompleto | null> {
  if (isMockMode()) {
    if (diaAno === 1) {
      return {
        dia_ano: 1, mes: 1, dia: 1, tema: "Recomeço",
        titulo: "Cristo te fez novo",
        versiculo_ref: "2 Coríntios 5:17",
        versiculo_texto: "Assim que, se alguém está em Cristo, nova criatura é: as coisas velhas já passaram; eis que tudo se fez novo.",
        versiculo_versao: "ACF",
        reflexao: "Você começou hoje com a impressão de que é a mesma pessoa de ontem.\n\n(devocional mock — entre na produção pra ver os 365 reais)",
        autor: "Pr. Bruno Fernandes",
      };
    }
    return null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocional_anual")
    .select("*")
    .eq("dia_ano", diaAno)
    .eq("publicado", true)
    .maybeSingle();
  return (data as DevocionalAnualCompleto) || null;
}

// Set dos dia_ano marcados pelo aluno
export async function listProgressoAnualDoAluno(
  alunoId: string
): Promise<Set<number>> {
  if (isMockMode()) return new Set<number>();
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocional_anual_progresso")
    .select("dia_ano")
    .eq("aluno_id", alunoId);
  const rows = (data || []) as { dia_ano: number }[];
  return new Set(rows.map((r) => r.dia_ano));
}

// Verifica se um dia específico foi marcado por um aluno
export async function isDevocionalAnualMarcado(
  alunoId: string,
  diaAno: number
): Promise<boolean> {
  if (isMockMode()) return false;
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocional_anual_progresso")
    .select("dia_ano")
    .eq("aluno_id", alunoId)
    .eq("dia_ano", diaAno)
    .maybeSingle();
  return !!data;
}

// Reflexão pessoal do aluno num dia (1..365). "" se não houver.
export async function getReflexaoAnual(
  alunoId: string,
  diaAno: number
): Promise<string> {
  if (isMockMode()) return "";
  const supabase = await createClient();
  const { data } = await supabase
    .from("devocional_anual_reflexao")
    .select("texto")
    .eq("aluno_id", alunoId)
    .eq("dia_ano", diaAno)
    .maybeSingle();
  return (data as { texto: string } | null)?.texto ?? "";
}

// ---------------------------------------------------------------
// Reflexões dos alunos (devolutiva pastoral) — visão admin
// A RLS (policy "devocional_reflexao_admin_read") permite que o
// admin leia a reflexão de qualquer aluno. Esta função agrega todas
// as reflexões com nome/email do autor e o devocional do dia.
// ---------------------------------------------------------------

export type ReflexaoAnualAdmin = {
  aluno_id: string;
  aluno_nome: string | null;
  aluno_email: string;
  dia_ano: number;
  texto: string;
  atualizado_em: string;
  devocional_titulo: string | null;
  devocional_tema: string | null;
  mes: number | null;
  dia: number | null;
};

export async function listReflexoesAnualAdmin(
  limit = 300
): Promise<ReflexaoAnualAdmin[]> {
  if (isMockMode()) {
    return [
      {
        aluno_id: "mock-aluno-1",
        aluno_nome: "Aluno Exemplo",
        aluno_email: "exemplo@ekballo.com",
        dia_ano: 1,
        texto:
          "Essa palavra falou comigo porque me lembrou que cada dia é um recomeço.\n\n(reflexão mock — entre na produção pra ver as reais)",
        atualizado_em: new Date().toISOString(),
        devocional_titulo: "Cristo te fez novo",
        devocional_tema: "Recomeço",
        mes: 1,
        dia: 1,
      },
    ];
  }

  const supabase = await createClient();
  const { data: reflexoes } = await supabase
    .from("devocional_anual_reflexao")
    .select("aluno_id, dia_ano, texto, atualizado_em")
    .order("atualizado_em", { ascending: false })
    .limit(limit);

  const rows = (reflexoes || []) as {
    aluno_id: string;
    dia_ano: number;
    texto: string;
    atualizado_em: string;
  }[];
  if (rows.length === 0) return [];

  const alunoIds = [...new Set(rows.map((r) => r.aluno_id))];
  const diaAnos = [...new Set(rows.map((r) => r.dia_ano))];

  const [perfisRes, devocsRes] = await Promise.all([
    supabase.from("profiles").select("id, nome, email").in("id", alunoIds),
    supabase
      .from("devocional_anual")
      .select("dia_ano, titulo, tema, mes, dia")
      .in("dia_ano", diaAnos),
  ]);

  const perfilMap = new Map(
    ((perfisRes.data || []) as {
      id: string;
      nome: string | null;
      email: string;
    }[]).map((p) => [p.id, p])
  );
  const devocMap = new Map(
    ((devocsRes.data || []) as {
      dia_ano: number;
      titulo: string;
      tema: string;
      mes: number;
      dia: number;
    }[]).map((d) => [d.dia_ano, d])
  );

  return rows.map((r) => {
    const p = perfilMap.get(r.aluno_id);
    const d = devocMap.get(r.dia_ano);
    return {
      aluno_id: r.aluno_id,
      aluno_nome: p?.nome ?? null,
      aluno_email: p?.email ?? "—",
      dia_ano: r.dia_ano,
      texto: r.texto,
      atualizado_em: r.atualizado_em,
      devocional_titulo: d?.titulo ?? null,
      devocional_tema: d?.tema ?? null,
      mes: d?.mes ?? null,
      dia: d?.dia ?? null,
    };
  });
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
