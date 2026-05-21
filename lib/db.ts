// =============================================================
// EKBALLO ACADEMY · Facade de dados
// Em modo mock, retorna dados de teste in-memory.
// Em modo produção, consulta o Supabase.
// =============================================================

import { createClient } from "@/lib/supabase/server";
import {
  MOCK_PROFILE,
  MOCK_ALUNOS,
  MOCK_CURSOS,
  MOCK_AULAS,
  MOCK_ATIVIDADES,
  MOCK_RESPOSTAS,
  MOCK_MATRICULAS,
  MOCK_PROGRESSO,
  MOCK_ALTERNATIVAS,
  isMockMode,
  findCurso as mockFindCurso,
  aulasByCurso as mockAulasByCurso,
  findAula as mockFindAula,
  atividadesByAula as mockAtivByAula,
  respostasByAluno as mockRespByAluno,
  progressoByAluno as mockProgByAluno,
  matriculasByAluno as mockMatByAluno,
  alternativasByAtividade as mockAltByAtv,
  aulaCompleta as mockAulaCompleta,
  getMockMcAnswer,
  setMockMcAnswer,
  setMockReflexao,
} from "@/lib/mock-data";
import type { Profile, Curso, Aula, Atividade, Alternativa } from "@/lib/types";

// -------- AUTH / PROFILE --------

export async function getCurrentSession(): Promise<{
  userId: string;
  profile: Profile | null;
  email: string;
} | null> {
  if (isMockMode()) {
    return {
      userId: MOCK_PROFILE.id,
      profile: MOCK_PROFILE,
      email: MOCK_PROFILE.email,
    };
  }
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return null;
  const { data: profile } = await supabase
    .from("profiles")
    .select("*")
    .eq("id", user.id)
    .single();
  return {
    userId: user.id,
    profile: profile as Profile | null,
    email: user.email || "",
  };
}

// -------- CURSOS --------

export async function listCursosPublicados(): Promise<Curso[]> {
  if (isMockMode()) {
    return MOCK_CURSOS.filter((c) => c.publicado).sort((a, b) => a.ordem - b.ordem);
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("cursos")
    .select("*")
    .eq("publicado", true)
    .order("ordem", { ascending: true });
  return (data || []) as Curso[];
}

export async function listAllCursos(): Promise<Curso[]> {
  if (isMockMode()) {
    return [...MOCK_CURSOS].sort((a, b) => a.ordem - b.ordem);
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("cursos")
    .select("*")
    .order("ordem", { ascending: true });
  return (data || []) as Curso[];
}

export async function getCursoBySlug(slug: string): Promise<Curso | null> {
  if (isMockMode()) {
    return mockFindCurso(slug) || null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("cursos")
    .select("*")
    .eq("slug", slug)
    .eq("publicado", true)
    .single();
  return data as Curso | null;
}

// -------- AULAS --------

export async function listAulasByCurso(cursoId: string): Promise<Aula[]> {
  if (isMockMode()) return mockAulasByCurso(cursoId);
  const supabase = await createClient();
  const { data } = await supabase
    .from("aulas")
    .select("*")
    .eq("curso_id", cursoId)
    .order("ordem", { ascending: true });
  return (data || []) as Aula[];
}

export async function getAula(aulaId: string, cursoId: string): Promise<Aula | null> {
  if (isMockMode()) {
    const a = mockFindAula(aulaId);
    return a && a.curso_id === cursoId ? a : null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("aulas")
    .select("*")
    .eq("id", aulaId)
    .eq("curso_id", cursoId)
    .single();
  return data as Aula | null;
}

// -------- ATIVIDADES --------

export async function listAtividadesByAula(aulaId: string): Promise<Atividade[]> {
  if (isMockMode()) return mockAtivByAula(aulaId);
  const supabase = await createClient();
  const { data } = await supabase
    .from("atividades")
    .select("*")
    .eq("aula_id", aulaId)
    .order("ordem", { ascending: true });
  return (data || []) as Atividade[];
}

// -------- RESPOSTAS DO ALUNO --------

export type RespostaAluno = {
  atividade_id: string;
  texto: string;
  comentario_lider: string | null;
};

export async function listRespostasByAluno(alunoId: string): Promise<RespostaAluno[]> {
  if (isMockMode()) {
    return mockRespByAluno(alunoId).map((r) => ({
      atividade_id: r.atividade_id,
      texto: r.texto,
      comentario_lider: r.comentario_lider,
    }));
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("respostas")
    .select("atividade_id, texto, comentario_lider")
    .eq("aluno_id", alunoId);
  return (data || []) as RespostaAluno[];
}

// -------- PROGRESSO --------

export async function listProgressoByAluno(alunoId: string): Promise<{ aula_id: string }[]> {
  if (isMockMode()) {
    return mockProgByAluno(alunoId).map((p) => ({ aula_id: p.aula_id }));
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("progresso")
    .select("aula_id")
    .eq("aluno_id", alunoId);
  return data || [];
}

export async function jaConcluiu(alunoId: string, aulaId: string): Promise<boolean> {
  if (isMockMode()) {
    return mockProgByAluno(alunoId).some((p) => p.aula_id === aulaId);
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("progresso")
    .select("aula_id")
    .eq("aluno_id", alunoId)
    .eq("aula_id", aulaId)
    .maybeSingle();
  return !!data;
}

// -------- MATRICULAS --------

export async function listMatriculasByAluno(alunoId: string): Promise<{ curso_id: string; concluido_em: string | null }[]> {
  if (isMockMode()) {
    return mockMatByAluno(alunoId).map((m) => ({
      curso_id: m.curso_id,
      concluido_em: m.concluido_em,
    }));
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("matriculas")
    .select("curso_id, concluido_em")
    .eq("aluno_id", alunoId);
  return data || [];
}

export async function isMatriculado(alunoId: string, cursoId: string): Promise<boolean> {
  if (isMockMode()) {
    return mockMatByAluno(alunoId).some((m) => m.curso_id === cursoId);
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("matriculas")
    .select("curso_id")
    .eq("aluno_id", alunoId)
    .eq("curso_id", cursoId)
    .maybeSingle();
  return !!data;
}

// -------- ADMIN: ALUNO INDIVIDUAL --------

export async function getAlunoById(alunoId: string): Promise<Profile | null> {
  if (isMockMode()) {
    return MOCK_ALUNOS.find((a) => a.id === alunoId) || null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("profiles")
    .select("*")
    .eq("id", alunoId)
    .single();
  return data as Profile | null;
}

// -------- ADMIN: STATS --------

export async function getAdminStats() {
  if (isMockMode()) {
    return {
      totalAlunos: MOCK_ALUNOS.length,
      totalCursos: MOCK_CURSOS.length,
      totalRespostas: MOCK_RESPOSTAS.length,
      respostasSemComentario: MOCK_RESPOSTAS.filter((r) => !r.comentario_lider).length,
    };
  }
  const supabase = await createClient();
  const [a, c, r, sc] = await Promise.all([
    supabase.from("profiles").select("*", { count: "exact", head: true }),
    supabase.from("cursos").select("*", { count: "exact", head: true }),
    supabase.from("respostas").select("*", { count: "exact", head: true }),
    supabase.from("respostas").select("*", { count: "exact", head: true }).is("comentario_lider", null),
  ]);
  return {
    totalAlunos: a.count || 0,
    totalCursos: c.count || 0,
    totalRespostas: r.count || 0,
    respostasSemComentario: sc.count || 0,
  };
}

// -------- ADMIN: RESPOSTAS (rich) --------

export type RespostaRich = {
  id: string;
  texto: string;
  comentario_lider: string | null;
  comentario_lider_em: string | null;
  created_at: string;
  updated_at: string;
  pergunta: string;
  aulaTitulo: string;
  cursoTitulo: string;
  cursoSlug: string;
  alunoId: string;
  alunoNome: string | null;
  alunoEmail: string;
  alunoTurma: string | null;
};

function enrichMock(r: typeof MOCK_RESPOSTAS[number]): RespostaRich {
  const at = MOCK_ATIVIDADES.find((x) => x.id === r.atividade_id);
  const au = at ? MOCK_AULAS.find((x) => x.id === at.aula_id) : undefined;
  const cu = au ? MOCK_CURSOS.find((x) => x.id === au.curso_id) : undefined;
  const al = MOCK_ALUNOS.find((x) => x.id === r.aluno_id);
  return {
    id: r.id,
    texto: r.texto,
    comentario_lider: r.comentario_lider,
    comentario_lider_em: r.comentario_lider_em,
    created_at: r.created_at,
    updated_at: r.updated_at,
    pergunta: at?.pergunta || "",
    aulaTitulo: au?.titulo || "",
    cursoTitulo: cu?.titulo || "",
    cursoSlug: cu?.slug || "",
    alunoId: al?.id || r.aluno_id,
    alunoNome: al?.nome || null,
    alunoEmail: al?.email || "",
    alunoTurma: al?.turma || null,
  };
}

export async function listAllRespostas(filtros: { status?: "pendentes" | "comentadas"; cursoSlug?: string } = {}): Promise<RespostaRich[]> {
  if (isMockMode()) {
    let lista = MOCK_RESPOSTAS.map(enrichMock);
    if (filtros.status === "pendentes") lista = lista.filter((r) => !r.comentario_lider);
    if (filtros.status === "comentadas") lista = lista.filter((r) => r.comentario_lider);
    if (filtros.cursoSlug) lista = lista.filter((r) => r.cursoSlug === filtros.cursoSlug);
    return lista.sort((a, b) => b.created_at.localeCompare(a.created_at));
  }
  const supabase = await createClient();
  let q = supabase
    .from("respostas")
    .select("id, texto, comentario_lider, comentario_lider_em, created_at, updated_at, atividade:atividades(pergunta, aula:aulas(titulo, curso:cursos(titulo, slug))), aluno:profiles(id, nome, email, turma)")
    .order("created_at", { ascending: false });
  if (filtros.status === "pendentes") q = q.is("comentario_lider", null);
  if (filtros.status === "comentadas") q = q.not("comentario_lider", "is", null);
  const { data } = await q.limit(200);
  return ((data as unknown as Array<{
    id: string; texto: string; comentario_lider: string | null; comentario_lider_em: string | null;
    created_at: string; updated_at: string;
    atividade?: { pergunta?: string; aula?: { titulo?: string; curso?: { titulo?: string; slug?: string } } };
    aluno?: { id?: string; nome?: string | null; email?: string; turma?: string | null };
  }>) || []).map((r) => ({
    id: r.id,
    texto: r.texto,
    comentario_lider: r.comentario_lider,
    comentario_lider_em: r.comentario_lider_em,
    created_at: r.created_at,
    updated_at: r.updated_at,
    pergunta: r.atividade?.pergunta || "",
    aulaTitulo: r.atividade?.aula?.titulo || "",
    cursoTitulo: r.atividade?.aula?.curso?.titulo || "",
    cursoSlug: r.atividade?.aula?.curso?.slug || "",
    alunoId: r.aluno?.id || "",
    alunoNome: r.aluno?.nome || null,
    alunoEmail: r.aluno?.email || "",
    alunoTurma: r.aluno?.turma || null,
  })).filter((r) => filtros.cursoSlug ? r.cursoSlug === filtros.cursoSlug : true);
}

export async function getRespostaById(id: string): Promise<RespostaRich | null> {
  if (isMockMode()) {
    const r = MOCK_RESPOSTAS.find((x) => x.id === id);
    return r ? enrichMock(r) : null;
  }
  const all = await listAllRespostas();
  return all.find((r) => r.id === id) || null;
}

export async function listOutrasRespostasDoAluno(alunoId: string, excludeId: string, limit = 5): Promise<{ id: string; pergunta: string; aulaTitulo: string; created_at: string }[]> {
  if (isMockMode()) {
    return MOCK_RESPOSTAS
      .filter((r) => r.aluno_id === alunoId && r.id !== excludeId)
      .map((r) => {
        const at = MOCK_ATIVIDADES.find((x) => x.id === r.atividade_id);
        const au = at ? MOCK_AULAS.find((x) => x.id === at.aula_id) : undefined;
        return {
          id: r.id,
          pergunta: at?.pergunta || "",
          aulaTitulo: au?.titulo || "",
          created_at: r.created_at,
        };
      })
      .sort((a, b) => b.created_at.localeCompare(a.created_at))
      .slice(0, limit);
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("respostas")
    .select("id, created_at, atividade:atividades(pergunta, aula:aulas(titulo))")
    .eq("aluno_id", alunoId)
    .neq("id", excludeId)
    .order("created_at", { ascending: false })
    .limit(limit);
  return ((data as unknown as Array<{
    id: string; created_at: string;
    atividade?: { pergunta?: string; aula?: { titulo?: string } };
  }>) || []).map((r) => ({
    id: r.id,
    pergunta: r.atividade?.pergunta || "",
    aulaTitulo: r.atividade?.aula?.titulo || "",
    created_at: r.created_at,
  }));
}

// -------- ADMIN: ALUNOS --------

export async function listAllAlunos(): Promise<{
  id: string; nome: string | null; email: string; turma: string | null; is_admin: boolean; created_at: string; respostasCount: number;
}[]> {
  if (isMockMode()) {
    return MOCK_ALUNOS.map((a) => ({
      ...a,
      respostasCount: MOCK_RESPOSTAS.filter((r) => r.aluno_id === a.id).length,
    })).sort((a, b) => b.created_at.localeCompare(a.created_at));
  }
  const supabase = await createClient();
  const { data: alunos } = await supabase
    .from("profiles")
    .select("id, nome, email, turma, is_admin, created_at")
    .order("created_at", { ascending: false });
  const { data: r } = await supabase.from("respostas").select("aluno_id");
  const map = new Map<string, number>();
  (r || []).forEach((x: { aluno_id: string }) => map.set(x.aluno_id, (map.get(x.aluno_id) || 0) + 1));
  return (alunos || []).map((a: { id: string; nome: string | null; email: string; turma: string | null; is_admin: boolean; created_at: string }) => ({
    ...a,
    respostasCount: map.get(a.id) || 0,
  }));
}

// -------- ADMIN: CURSOS COM STATS --------

export async function listCursosWithStats(): Promise<{
  curso: Curso; matriculados: number; concluidos: number;
}[]> {
  if (isMockMode()) {
    return MOCK_CURSOS.map((c) => {
      const ms = MOCK_MATRICULAS.filter((m) => m.curso_id === c.id);
      return {
        curso: c,
        matriculados: ms.length,
        concluidos: ms.filter((m) => m.concluido_em).length,
      };
    });
  }
  const supabase = await createClient();
  const { data: cursos } = await supabase.from("cursos").select("*").order("ordem");
  const { data: ms } = await supabase.from("matriculas").select("curso_id, concluido_em");
  const map = new Map<string, { total: number; concluidas: number }>();
  (ms || []).forEach((m: { curso_id: string; concluido_em: string | null }) => {
    const cur = map.get(m.curso_id) || { total: 0, concluidas: 0 };
    cur.total += 1;
    if (m.concluido_em) cur.concluidas += 1;
    map.set(m.curso_id, cur);
  });
  return (cursos || []).map((c) => ({
    curso: c as Curso,
    matriculados: map.get((c as Curso).id)?.total || 0,
    concluidos: map.get((c as Curso).id)?.concluidas || 0,
  }));
}

// -------- ALTERNATIVAS (MC) --------

export async function listAlternativasByAtividade(atividadeId: string): Promise<Alternativa[]> {
  if (isMockMode()) return mockAltByAtv(atividadeId);
  const supabase = await createClient();
  const { data } = await supabase
    .from("alternativas")
    .select("*")
    .eq("atividade_id", atividadeId)
    .order("ordem", { ascending: true });
  return (data || []) as Alternativa[];
}

export async function getRespostaAlternativa(alunoId: string, atividadeId: string): Promise<string | null> {
  if (isMockMode()) {
    return getMockMcAnswer(alunoId, atividadeId) || null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("respostas")
    .select("alternativa_id")
    .eq("aluno_id", alunoId)
    .eq("atividade_id", atividadeId)
    .maybeSingle();
  return (data?.alternativa_id as string | null) || null;
}

export async function salvarRespostaAlternativa(alunoId: string, atividadeId: string, alternativaId: string): Promise<void> {
  if (isMockMode()) {
    setMockMcAnswer(alunoId, atividadeId, alternativaId);
    return;
  }
  const supabase = await createClient();
  await supabase.from("respostas").upsert(
    {
      atividade_id: atividadeId,
      aluno_id: alunoId,
      alternativa_id: alternativaId,
      texto: null,
      updated_at: new Date().toISOString(),
    },
    { onConflict: "atividade_id,aluno_id" }
  );
}

// Aula completa = todas as MCs corretas E todas as reflexões respondidas (texto não vazio)
export async function aulaCompleta(alunoId: string, aulaId: string): Promise<boolean> {
  if (isMockMode()) return mockAulaCompleta(alunoId, aulaId);
  const supabase = await createClient();
  const { data: ats } = await supabase
    .from("atividades")
    .select("id, tipo")
    .eq("aula_id", aulaId);
  const atividades = (ats || []) as { id: string; tipo: string }[];
  if (atividades.length === 0) return true;
  for (const atv of atividades) {
    const { data: r } = await supabase
      .from("respostas")
      .select("alternativa_id, texto")
      .eq("aluno_id", alunoId)
      .eq("atividade_id", atv.id)
      .maybeSingle();
    if (atv.tipo === "multipla_escolha") {
      if (!r?.alternativa_id) return false;
      const { data: alt } = await supabase
        .from("alternativas")
        .select("correta")
        .eq("id", r.alternativa_id)
        .single();
      if (!alt?.correta) return false;
    } else {
      if (!r?.texto?.trim()) return false;
    }
  }
  return true;
}

// Calcula status (desbloqueada / bloqueada) de cada aula do curso para o aluno
export type AulaComStatus = Aula & { desbloqueada: boolean; completa: boolean };

export async function listAulasComStatus(cursoId: string, alunoId: string): Promise<AulaComStatus[]> {
  const aulas = await listAulasByCurso(cursoId);
  const result: AulaComStatus[] = [];
  let previousCompleta = true;
  for (const aula of aulas) {
    const completa = await aulaCompleta(alunoId, aula.id);
    const desbloqueada = previousCompleta;
    result.push({ ...aula, desbloqueada, completa });
    previousCompleta = completa;
  }
  return result;
}

// -------- ADMIN: ÚLTIMAS RESPOSTAS PARA HOMEPAGE --------

export async function listRecentRespostas(limit = 8): Promise<RespostaRich[]> {
  const all = await listAllRespostas();
  return all.slice(0, limit);
}
