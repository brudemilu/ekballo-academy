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
import type {
  Profile,
  Curso,
  Aula,
  Atividade,
  Alternativa,
  EmailTemplate,
  Mensagem,
  MensagemDestinatario,
} from "@/lib/types";

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

// Resolve `aula.material_url` para um link utilizável pelo cliente.
// - Se for http(s)://… → usa direto (URL externa).
// - Caso contrário → trata como path no bucket privado `materiais-cursos`
//   e devolve uma signed URL temporária (15 min).
export async function getMaterialUrl(materialPathOrUrl: string | null): Promise<string | null> {
  if (!materialPathOrUrl) return null;
  if (/^https?:\/\//i.test(materialPathOrUrl)) return materialPathOrUrl;
  // Rotas locais (ex.: /api/og/curso/...) — devolve como está.
  if (materialPathOrUrl.startsWith("/")) return materialPathOrUrl;
  if (isMockMode()) return materialPathOrUrl; // sem Storage no mock
  const supabase = await createClient();
  const { data, error } = await supabase
    .storage
    .from("materiais-cursos")
    .createSignedUrl(materialPathOrUrl, 60 * 15);
  if (error || !data?.signedUrl) return null;
  return data.signedUrl;
}

// Resolve `aula.audio_url` (overview em podcast) para um link tocável.
// Mesmo esquema do material: path no bucket privado `materiais-cursos`
// (pasta `audios/`) → signed URL. Validade de 6h para cobrir a audição
// inteira sem expirar no meio. http(s):// e rotas locais passam direto.
export async function getAudioUrl(audioPathOrUrl: string | null | undefined): Promise<string | null> {
  if (!audioPathOrUrl) return null;
  if (/^https?:\/\//i.test(audioPathOrUrl)) return audioPathOrUrl;
  if (audioPathOrUrl.startsWith("/")) return audioPathOrUrl;
  if (isMockMode()) return null; // sem Storage no mock
  const supabase = await createClient();
  const { data, error } = await supabase
    .storage
    .from("materiais-cursos")
    .createSignedUrl(audioPathOrUrl, 60 * 60 * 6);
  if (error || !data?.signedUrl) return null;
  return data.signedUrl;
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
  id: string; nome: string | null; email: string; telefone: string | null; turma: string | null; is_admin: boolean; created_at: string; respostasCount: number;
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
    .select("id, nome, email, telefone, turma, is_admin, created_at")
    .order("created_at", { ascending: false });
  const { data: r } = await supabase.from("respostas").select("aluno_id");
  const map = new Map<string, number>();
  (r || []).forEach((x: { aluno_id: string }) => map.set(x.aluno_id, (map.get(x.aluno_id) || 0) + 1));
  return (alunos || []).map((a: { id: string; nome: string | null; email: string; telefone: string | null; turma: string | null; is_admin: boolean; created_at: string }) => ({
    ...a,
    respostasCount: map.get(a.id) || 0,
  }));
}

// -------- ADMIN: CURSOS COM STATS --------

export async function listCursosWithStats(): Promise<{
  curso: Curso; matriculados: number; concluidos: number; alunosComTelefone: number;
}[]> {
  if (isMockMode()) {
    return MOCK_CURSOS.map((c) => {
      const ms = MOCK_MATRICULAS.filter((m) => m.curso_id === c.id);
      const comTel = ms.filter((m) => {
        const aluno = MOCK_ALUNOS.find((a) => a.id === m.aluno_id);
        return !!aluno?.telefone;
      }).length;
      return {
        curso: c,
        matriculados: ms.length,
        concluidos: ms.filter((m) => m.concluido_em).length,
        alunosComTelefone: comTel,
      };
    });
  }
  const supabase = await createClient();
  const { data: cursos } = await supabase.from("cursos").select("*").order("ordem");
  const { data: ms } = await supabase
    .from("matriculas")
    .select("curso_id, concluido_em, aluno:profiles!inner(telefone)");
  type MatricRow = {
    curso_id: string;
    concluido_em: string | null;
    aluno: { telefone: string | null } | null;
  };
  const map = new Map<string, { total: number; concluidas: number; comTel: number }>();
  ((ms || []) as unknown as MatricRow[]).forEach((m) => {
    const cur = map.get(m.curso_id) || { total: 0, concluidas: 0, comTel: 0 };
    cur.total += 1;
    if (m.concluido_em) cur.concluidas += 1;
    if (m.aluno?.telefone) cur.comTel += 1;
    map.set(m.curso_id, cur);
  });
  return (cursos || []).map((c) => ({
    curso: c as Curso,
    matriculados: map.get((c as Curso).id)?.total || 0,
    concluidos: map.get((c as Curso).id)?.concluidas || 0,
    alunosComTelefone: map.get((c as Curso).id)?.comTel || 0,
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

// -------- ADMIN: EMAIL TEMPLATES --------

export async function listEmailTemplates(): Promise<EmailTemplate[]> {
  if (isMockMode()) {
    return [
      {
        id: "mock-1",
        chave: "novo-cadastro",
        descricao: "Email enviado ao administrador quando alguém cria conta.",
        assunto: "Novo cadastro: {{nome_aluno}}",
        corpo_html: "<p>Mock template.</p>",
        corpo_texto: "Mock template.",
        variaveis_disponiveis: ["{{nome_aluno}}", "{{email_aluno}}", "{{link_admin}}"],
        ativo: true,
        created_at: "2026-05-22T00:00:00Z",
        updated_at: "2026-05-22T00:00:00Z",
      },
      {
        id: "mock-2",
        chave: "boas-vindas-curso",
        descricao: "Email enviado ao discípulo matriculado em uma temática.",
        assunto: "Bem-vindo(a) ao curso {{nome_curso}}",
        corpo_html: "<p>Mock template.</p>",
        corpo_texto: "Mock template.",
        variaveis_disponiveis: ["{{nome_aluno}}", "{{nome_curso}}", "{{link_curso}}"],
        ativo: true,
        created_at: "2026-05-22T00:00:00Z",
        updated_at: "2026-05-22T00:00:00Z",
      },
      {
        id: "mock-3",
        chave: "lembrete-inatividade",
        descricao: "Lembrete pra discípulo inativo há N dias.",
        assunto: "Sentimos sua falta no curso {{nome_curso}}",
        corpo_html: "<p>Mock template.</p>",
        corpo_texto: "Mock template.",
        variaveis_disponiveis: ["{{nome_aluno}}", "{{nome_curso}}", "{{link_curso}}", "{{dias_inatividade}}"],
        ativo: true,
        created_at: "2026-05-22T00:00:00Z",
        updated_at: "2026-05-22T00:00:00Z",
      },
    ];
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("email_templates")
    .select("*")
    .order("chave", { ascending: true });
  return (data || []) as EmailTemplate[];
}

export async function getEmailTemplate(chave: string): Promise<EmailTemplate | null> {
  if (isMockMode()) {
    const all = await listEmailTemplates();
    return all.find((t) => t.chave === chave) || null;
  }
  const supabase = await createClient();
  const { data } = await supabase
    .from("email_templates")
    .select("*")
    .eq("chave", chave)
    .single();
  return data as EmailTemplate | null;
}

export async function updateEmailTemplate(
  chave: string,
  patch: { assunto?: string; corpo_html?: string; corpo_texto?: string | null; ativo?: boolean }
): Promise<void> {
  if (isMockMode()) {
    // Mock mode: no-op (no persistence)
    return;
  }
  const supabase = await createClient();
  await supabase.from("email_templates").update(patch).eq("chave", chave);
}

// -------- ADMIN: MENSAGENS (broadcast) --------

export type MensagemRich = Mensagem & {
  destino_label: string; // "Todos", "Temática: X", "Discípulo: Y"
};

export async function listMensagens(limit = 50): Promise<MensagemRich[]> {
  if (isMockMode()) return [];
  const supabase = await createClient();
  const { data: rows } = await supabase
    .from("mensagens")
    .select("*")
    .order("enviada_em", { ascending: false })
    .limit(limit);
  const mensagens = (rows || []) as Mensagem[];
  if (mensagens.length === 0) return [];

  // Resolve labels (curso titulo, aluno nome) em batch
  const cursoIds = mensagens
    .filter((m) => m.destino_tipo === "curso" && m.destino_id)
    .map((m) => m.destino_id!);
  const alunoIds = mensagens
    .filter((m) => m.destino_tipo === "aluno" && m.destino_id)
    .map((m) => m.destino_id!);

  const [cursosResp, alunosResp] = await Promise.all([
    cursoIds.length > 0
      ? supabase.from("cursos").select("id, titulo").in("id", cursoIds)
      : Promise.resolve({ data: [] as { id: string; titulo: string }[] }),
    alunoIds.length > 0
      ? supabase.from("profiles").select("id, nome, email").in("id", alunoIds)
      : Promise.resolve({ data: [] as { id: string; nome: string | null; email: string }[] }),
  ]);

  const cursoMap = new Map(
    (cursosResp.data || []).map((c) => [c.id, c.titulo])
  );
  const alunoMap = new Map(
    (alunosResp.data || []).map((a) => [a.id, a.nome || a.email])
  );

  return mensagens.map((m) => ({
    ...m,
    destino_label:
      m.destino_tipo === "todos"
        ? "Todos os discípulos"
        : m.destino_tipo === "curso"
          ? `Temática: ${cursoMap.get(m.destino_id || "") || "?"}`
          : `Discípulo: ${alunoMap.get(m.destino_id || "") || "?"}`,
  }));
}

export async function getMensagemComDestinatarios(
  id: string
): Promise<{
  mensagem: MensagemRich;
  destinatarios: (MensagemDestinatario & { aluno_nome: string; aluno_email: string })[];
} | null> {
  if (isMockMode()) return null;
  const supabase = await createClient();
  const { data: mensagemRow } = await supabase
    .from("mensagens")
    .select("*")
    .eq("id", id)
    .single();
  if (!mensagemRow) return null;
  const mensagem = mensagemRow as Mensagem;

  // Label do destino
  let destino_label = "Todos os discípulos";
  if (mensagem.destino_tipo === "curso" && mensagem.destino_id) {
    const { data } = await supabase
      .from("cursos")
      .select("titulo")
      .eq("id", mensagem.destino_id)
      .single();
    destino_label = `Temática: ${data?.titulo || "?"}`;
  } else if (mensagem.destino_tipo === "aluno" && mensagem.destino_id) {
    const { data } = await supabase
      .from("profiles")
      .select("nome, email")
      .eq("id", mensagem.destino_id)
      .single();
    destino_label = `Discípulo: ${data?.nome || data?.email || "?"}`;
  }

  const { data: destRows } = await supabase
    .from("mensagens_destinatarios")
    .select("*, profiles!inner(nome, email)")
    .eq("mensagem_id", id);

  type DestRow = MensagemDestinatario & {
    profiles: { nome: string | null; email: string };
  };
  const destinatarios = ((destRows || []) as DestRow[]).map((d) => ({
    ...d,
    aluno_nome: d.profiles.nome || "",
    aluno_email: d.profiles.email,
  }));

  return {
    mensagem: { ...mensagem, destino_label },
    destinatarios,
  };
}

// =============================================================
// PROGRESSÃO POR CURSO E POR ALUNO (admin)
// =============================================================

export type CursoProgressaoAulaRow = {
  id: string;
  titulo: string;
  ordem: number;
  totalAtividades: number;
  alunosCompletos: number;
  taxaConclusao: number; // 0-100
};

export type CursoProgressaoAlunoRow = {
  id: string;
  nome: string | null;
  email: string;
  telefone: string | null;
  concluidoEm: string | null;
  aulasCompletas: number;
  progresso: number; // 0-100
  aulaAtualOrdem: number | null;
  aulaAtualTitulo: string | null;
};

export type CursoProgressao = {
  curso: Curso;
  totalAulas: number;
  totalMatriculados: number;
  totalConcluidos: number;
  alunosComTelefone: number;
  aulas: CursoProgressaoAulaRow[];
  alunos: CursoProgressaoAlunoRow[];
};

export async function getCursoProgressao(cursoSlug: string): Promise<CursoProgressao | null> {
  if (isMockMode()) {
    const curso = mockFindCurso(cursoSlug);
    if (!curso) return null;
    const aulas = mockAulasByCurso(curso.id);
    const matriculas = MOCK_MATRICULAS.filter((m) => m.curso_id === curso.id);
    const alunoIds = matriculas.map((m) => m.aluno_id);
    const alunos = alunoIds
      .map((id) => MOCK_ALUNOS.find((a) => a.id === id))
      .filter((a): a is typeof MOCK_ALUNOS[number] => !!a);

    const aulasRows: CursoProgressaoAulaRow[] = aulas.map((aula) => {
      const totalAtividades = mockAtivByAula(aula.id).length;
      const completos = alunoIds.filter((aid) => mockAulaCompleta(aid, aula.id)).length;
      return {
        id: aula.id,
        titulo: aula.titulo,
        ordem: aula.ordem,
        totalAtividades,
        alunosCompletos: completos,
        taxaConclusao: alunoIds.length > 0 ? Math.round((completos / alunoIds.length) * 100) : 0,
      };
    });

    const alunosRows: CursoProgressaoAlunoRow[] = alunos.map((aluno) => {
      const matricula = matriculas.find((m) => m.aluno_id === aluno.id);
      let aulasCompletas = 0;
      let aulaAtualIdx = -1;
      for (let i = 0; i < aulas.length; i++) {
        if (mockAulaCompleta(aluno.id, aulas[i].id)) {
          aulasCompletas++;
        } else if (aulaAtualIdx === -1) {
          aulaAtualIdx = i;
        }
      }
      const aulaAtual = aulaAtualIdx >= 0 ? aulas[aulaAtualIdx] : null;
      return {
        id: aluno.id,
        nome: aluno.nome,
        email: aluno.email,
        telefone: aluno.telefone,
        concluidoEm: matricula?.concluido_em ?? null,
        aulasCompletas,
        progresso: aulas.length > 0 ? Math.round((aulasCompletas / aulas.length) * 100) : 0,
        aulaAtualOrdem: aulaAtual?.ordem ?? null,
        aulaAtualTitulo: aulaAtual?.titulo ?? null,
      };
    });

    return {
      curso,
      totalAulas: aulas.length,
      totalMatriculados: matriculas.length,
      totalConcluidos: matriculas.filter((m) => m.concluido_em).length,
      alunosComTelefone: alunos.filter((a) => !!a.telefone).length,
      aulas: aulasRows,
      alunos: alunosRows.sort((a, b) => b.progresso - a.progresso),
    };
  }

  const supabase = await createClient();
  const { data: cursoRow } = await supabase
    .from("cursos")
    .select("*")
    .eq("slug", cursoSlug)
    .single();
  if (!cursoRow) return null;
  const curso = cursoRow as Curso;

  const { data: aulasData } = await supabase
    .from("aulas")
    .select("*")
    .eq("curso_id", curso.id)
    .order("ordem", { ascending: true });
  const aulas = (aulasData || []) as Aula[];
  const aulaIds = aulas.map((a) => a.id);

  if (aulaIds.length === 0) {
    return {
      curso,
      totalAulas: 0,
      totalMatriculados: 0,
      totalConcluidos: 0,
      alunosComTelefone: 0,
      aulas: [],
      alunos: [],
    };
  }

  // Atividades de todas as aulas
  const { data: atividadesData } = await supabase
    .from("atividades")
    .select("id, aula_id, tipo")
    .in("aula_id", aulaIds);
  const atividades = (atividadesData || []) as { id: string; aula_id: string; tipo: string }[];
  const atvIds = atividades.map((a) => a.id);
  const atvByAula = new Map<string, typeof atividades>();
  atividades.forEach((a) => {
    const arr = atvByAula.get(a.aula_id) || [];
    arr.push(a);
    atvByAula.set(a.aula_id, arr);
  });

  // Alternativas corretas
  const { data: altsData } = atvIds.length
    ? await supabase
        .from("alternativas")
        .select("id, atividade_id, correta")
        .in("atividade_id", atvIds)
        .eq("correta", true)
    : { data: [] as { id: string; atividade_id: string; correta: boolean }[] };
  const corretaByAtv = new Map<string, string>();
  (altsData || []).forEach((alt: { id: string; atividade_id: string; correta: boolean }) => {
    corretaByAtv.set(alt.atividade_id, alt.id);
  });

  // Matrículas + alunos
  const { data: matriculasData } = await supabase
    .from("matriculas")
    .select("aluno_id, concluido_em, created_at, aluno:profiles!inner(id, nome, email, telefone)")
    .eq("curso_id", curso.id);
  type MatricRow = {
    aluno_id: string;
    concluido_em: string | null;
    created_at: string;
    aluno: { id: string; nome: string | null; email: string; telefone: string | null };
  };
  const matriculas = ((matriculasData || []) as unknown as MatricRow[]).map((m) => ({
    aluno_id: m.aluno_id,
    concluido_em: m.concluido_em,
    created_at: m.created_at,
    aluno: m.aluno,
  }));
  const alunoIds = matriculas.map((m) => m.aluno_id);

  // Respostas dos alunos pras atividades do curso
  const respostas =
    atvIds.length > 0 && alunoIds.length > 0
      ? (
          await supabase
            .from("respostas")
            .select("atividade_id, aluno_id, alternativa_id, texto")
            .in("atividade_id", atvIds)
            .in("aluno_id", alunoIds)
        ).data || []
      : [];

  // Indexa respostas por (aluno, atividade)
  type Resp = {
    atividade_id: string;
    aluno_id: string;
    alternativa_id: string | null;
    texto: string | null;
  };
  const respByPair = new Map<string, Resp>();
  (respostas as Resp[]).forEach((r) => {
    respByPair.set(`${r.aluno_id}::${r.atividade_id}`, r);
  });

  function aulaCompletaPra(alunoId: string, aulaId: string): boolean {
    const atvs = atvByAula.get(aulaId) || [];
    if (atvs.length === 0) return true;
    for (const a of atvs) {
      const r = respByPair.get(`${alunoId}::${a.id}`);
      if (a.tipo === "multipla_escolha") {
        if (!r?.alternativa_id) return false;
        if (r.alternativa_id !== corretaByAtv.get(a.id)) return false;
      } else {
        if (!r?.texto?.trim()) return false;
      }
    }
    return true;
  }

  const aulasRows: CursoProgressaoAulaRow[] = aulas.map((aula) => {
    const completos = alunoIds.filter((aid) => aulaCompletaPra(aid, aula.id)).length;
    return {
      id: aula.id,
      titulo: aula.titulo,
      ordem: aula.ordem,
      totalAtividades: (atvByAula.get(aula.id) || []).length,
      alunosCompletos: completos,
      taxaConclusao:
        alunoIds.length > 0 ? Math.round((completos / alunoIds.length) * 100) : 0,
    };
  });

  const alunosRows: CursoProgressaoAlunoRow[] = matriculas.map((m) => {
    let aulasCompletas = 0;
    let aulaAtual: Aula | null = null;
    for (const aula of aulas) {
      if (aulaCompletaPra(m.aluno_id, aula.id)) {
        aulasCompletas++;
      } else if (!aulaAtual) {
        aulaAtual = aula;
      }
    }
    return {
      id: m.aluno.id,
      nome: m.aluno.nome,
      email: m.aluno.email,
      telefone: m.aluno.telefone,
      concluidoEm: m.concluido_em,
      aulasCompletas,
      progresso:
        aulas.length > 0 ? Math.round((aulasCompletas / aulas.length) * 100) : 0,
      aulaAtualOrdem: aulaAtual?.ordem ?? null,
      aulaAtualTitulo: aulaAtual?.titulo ?? null,
    };
  });

  return {
    curso,
    totalAulas: aulas.length,
    totalMatriculados: matriculas.length,
    totalConcluidos: matriculas.filter((m) => m.concluido_em).length,
    alunosComTelefone: matriculas.filter((m) => !!m.aluno.telefone).length,
    aulas: aulasRows,
    alunos: alunosRows.sort((a, b) => b.progresso - a.progresso),
  };
}

export type AlunoProgressoAulaAtividade = {
  atividade: Atividade;
  alternativas: Alternativa[]; // [] se reflexao
  alternativaSelecionada: string | null; // só MC
  respondeuCorreto: boolean | null; // null se reflexao
  textoReflexao: string | null;
  comentarioLider: string | null;
  comentarioLiderEm: string | null;
  respostaId: string | null;
};

export type AlunoProgressoAula = {
  aula: Aula;
  status: "completa" | "em-andamento" | "bloqueada" | "nao-iniciada";
  totalAtividades: number;
  atividadesRespondidas: number;
  atividades: AlunoProgressoAulaAtividade[];
};

export type AlunoProgressoNoCurso = {
  curso: Curso;
  aluno: Profile;
  matriculadoEm: string | null;
  concluidoEm: string | null;
  totalAulas: number;
  aulasCompletas: number;
  progresso: number;
  aulas: AlunoProgressoAula[];
};

export async function getAlunoProgressoNoCurso(
  cursoSlug: string,
  alunoId: string
): Promise<AlunoProgressoNoCurso | null> {
  if (isMockMode()) {
    const curso = mockFindCurso(cursoSlug);
    if (!curso) return null;
    const aluno = MOCK_ALUNOS.find((a) => a.id === alunoId);
    if (!aluno) return null;
    const matricula = MOCK_MATRICULAS.find(
      (m) => m.curso_id === curso.id && m.aluno_id === alunoId
    );
    const aulas = mockAulasByCurso(curso.id);

    const aulasProgresso: AlunoProgressoAula[] = [];
    let previousCompleta = true;
    for (const aula of aulas) {
      const atvs = mockAtivByAula(aula.id);
      const detalheAtvs: AlunoProgressoAulaAtividade[] = atvs.map((atv) => {
        if (atv.tipo === "multipla_escolha") {
          const alts = mockAltByAtv(atv.id);
          const selId = getMockMcAnswer(alunoId, atv.id) || null;
          const correta = alts.find((a) => a.correta);
          return {
            atividade: atv,
            alternativas: alts,
            alternativaSelecionada: selId,
            respondeuCorreto: selId ? selId === correta?.id : null,
            textoReflexao: null,
            comentarioLider: null,
            comentarioLiderEm: null,
            respostaId: null,
          };
        }
        // reflexao
        const r = MOCK_RESPOSTAS.find(
          (x) => x.aluno_id === alunoId && x.atividade_id === atv.id
        );
        return {
          atividade: atv,
          alternativas: [],
          alternativaSelecionada: null,
          respondeuCorreto: null,
          textoReflexao: r?.texto || null,
          comentarioLider: r?.comentario_lider || null,
          comentarioLiderEm: r?.comentario_lider_em || null,
          respostaId: r?.id || null,
        };
      });

      const respondidas = detalheAtvs.filter(
        (a) =>
          a.alternativaSelecionada || (a.textoReflexao && a.textoReflexao.trim())
      ).length;
      const completa = mockAulaCompleta(alunoId, aula.id);
      const status: AlunoProgressoAula["status"] = completa
        ? "completa"
        : !previousCompleta
          ? "bloqueada"
          : respondidas > 0
            ? "em-andamento"
            : "nao-iniciada";

      aulasProgresso.push({
        aula,
        status,
        totalAtividades: atvs.length,
        atividadesRespondidas: respondidas,
        atividades: detalheAtvs,
      });
      previousCompleta = completa;
    }

    const aulasCompletasCount = aulasProgresso.filter((a) => a.status === "completa")
      .length;

    return {
      curso,
      aluno,
      matriculadoEm: matricula?.matriculado_em ?? null,
      concluidoEm: matricula?.concluido_em ?? null,
      totalAulas: aulas.length,
      aulasCompletas: aulasCompletasCount,
      progresso:
        aulas.length > 0 ? Math.round((aulasCompletasCount / aulas.length) * 100) : 0,
      aulas: aulasProgresso,
    };
  }

  const supabase = await createClient();
  const [{ data: cursoRow }, { data: alunoRow }] = await Promise.all([
    supabase.from("cursos").select("*").eq("slug", cursoSlug).single(),
    supabase.from("profiles").select("*").eq("id", alunoId).single(),
  ]);
  if (!cursoRow || !alunoRow) return null;
  const curso = cursoRow as Curso;
  const aluno = alunoRow as Profile;

  const [{ data: aulasData }, { data: matricRow }] = await Promise.all([
    supabase
      .from("aulas")
      .select("*")
      .eq("curso_id", curso.id)
      .order("ordem", { ascending: true }),
    supabase
      .from("matriculas")
      .select("created_at, concluido_em")
      .eq("curso_id", curso.id)
      .eq("aluno_id", alunoId)
      .maybeSingle(),
  ]);
  const aulas = (aulasData || []) as Aula[];
  const aulaIds = aulas.map((a) => a.id);

  // Atividades e alternativas
  const { data: atvData } = aulaIds.length
    ? await supabase
        .from("atividades")
        .select("*")
        .in("aula_id", aulaIds)
        .order("ordem", { ascending: true })
    : { data: [] as Atividade[] };
  const atividades = (atvData || []) as Atividade[];
  const atvIds = atividades.map((a) => a.id);

  const { data: altsData } = atvIds.length
    ? await supabase
        .from("alternativas")
        .select("*")
        .in("atividade_id", atvIds)
        .order("ordem", { ascending: true })
    : { data: [] as Alternativa[] };
  const alternativas = (altsData || []) as Alternativa[];

  // Respostas do aluno
  const { data: respData } = atvIds.length
    ? await supabase
        .from("respostas")
        .select(
          "id, atividade_id, alternativa_id, texto, comentario_lider, comentario_lider_em"
        )
        .in("atividade_id", atvIds)
        .eq("aluno_id", alunoId)
    : { data: [] as Array<{
        id: string;
        atividade_id: string;
        alternativa_id: string | null;
        texto: string | null;
        comentario_lider: string | null;
        comentario_lider_em: string | null;
      }> };
  type RespInfo = {
    id: string;
    atividade_id: string;
    alternativa_id: string | null;
    texto: string | null;
    comentario_lider: string | null;
    comentario_lider_em: string | null;
  };
  const respByAtv = new Map<string, RespInfo>();
  (respData || []).forEach((r) => respByAtv.set((r as RespInfo).atividade_id, r as RespInfo));

  const altsByAtv = new Map<string, Alternativa[]>();
  alternativas.forEach((a) => {
    const arr = altsByAtv.get(a.atividade_id) || [];
    arr.push(a);
    altsByAtv.set(a.atividade_id, arr);
  });

  const aulasProgresso: AlunoProgressoAula[] = [];
  let previousCompleta = true;
  for (const aula of aulas) {
    const atvs = atividades.filter((a) => a.aula_id === aula.id);
    const detalheAtvs: AlunoProgressoAulaAtividade[] = atvs.map((atv) => {
      const r = respByAtv.get(atv.id);
      if (atv.tipo === "multipla_escolha") {
        const alts = altsByAtv.get(atv.id) || [];
        const correta = alts.find((x) => x.correta);
        return {
          atividade: atv,
          alternativas: alts,
          alternativaSelecionada: r?.alternativa_id || null,
          respondeuCorreto: r?.alternativa_id
            ? r.alternativa_id === correta?.id
            : null,
          textoReflexao: null,
          comentarioLider: r?.comentario_lider || null,
          comentarioLiderEm: r?.comentario_lider_em || null,
          respostaId: r?.id || null,
        };
      }
      return {
        atividade: atv,
        alternativas: [],
        alternativaSelecionada: null,
        respondeuCorreto: null,
        textoReflexao: r?.texto || null,
        comentarioLider: r?.comentario_lider || null,
        comentarioLiderEm: r?.comentario_lider_em || null,
        respostaId: r?.id || null,
      };
    });

    // Aula completa?
    let completa = true;
    for (const a of detalheAtvs) {
      if (a.atividade.tipo === "multipla_escolha") {
        if (a.respondeuCorreto !== true) {
          completa = false;
          break;
        }
      } else {
        if (!a.textoReflexao?.trim()) {
          completa = false;
          break;
        }
      }
    }
    if (atvs.length === 0) completa = true;

    const respondidas = detalheAtvs.filter(
      (a) =>
        !!a.alternativaSelecionada ||
        (a.textoReflexao && a.textoReflexao.trim())
    ).length;

    const status: AlunoProgressoAula["status"] = completa
      ? "completa"
      : !previousCompleta
        ? "bloqueada"
        : respondidas > 0
          ? "em-andamento"
          : "nao-iniciada";

    aulasProgresso.push({
      aula,
      status,
      totalAtividades: atvs.length,
      atividadesRespondidas: respondidas,
      atividades: detalheAtvs,
    });
    previousCompleta = completa;
  }

  const aulasCompletasCount = aulasProgresso.filter((a) => a.status === "completa")
    .length;

  return {
    curso,
    aluno,
    matriculadoEm: matricRow?.created_at ?? null,
    concluidoEm: matricRow?.concluido_em ?? null,
    totalAulas: aulas.length,
    aulasCompletas: aulasCompletasCount,
    progresso:
      aulas.length > 0
        ? Math.round((aulasCompletasCount / aulas.length) * 100)
        : 0,
    aulas: aulasProgresso,
  };
}
