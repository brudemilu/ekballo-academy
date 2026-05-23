// =============================================================
// EKBALLO ACADEMY · Dataset MOCK para teste local
// Ativado quando NEXT_PUBLIC_MOCK_MODE=true (padrão em .env.local)
// =============================================================

import type { Profile, Curso, Aula, Atividade, Alternativa } from "@/lib/types";
import { EGO_K1, EGO_K2, EGO_K3, EGO_K4 } from "@/lib/ego-transformado-content";
import { EGO_REFLEXOES, EGO_MCS, EGO_ALTERNATIVAS } from "@/lib/ego-transformado-atividades";

export const MOCK_USER_ID = "mock-lucas";

export const MOCK_PROFILE: Profile = {
  id: MOCK_USER_ID,
  nome: "Pr. Bruno Fernandes",
  email: "bruno@ekballo.com.br",
  telefone: "5511999990001",
  is_admin: true,
  turma: "Mesa 01",
  created_at: "2026-04-01T10:00:00Z",
};

export const MOCK_ALUNOS: Profile[] = [
  MOCK_PROFILE,
  { id: "aluno-1b", nome: "Lucas Fernandes (Cowork)", email: "iabolsa@bmbr.com.br", telefone: "5511999990002", is_admin: false, turma: "Mesa 01", created_at: "2026-04-02T08:00:00Z" },
  { id: "aluno-2", nome: "Maria Helena Andrade", email: "maria.helena@email.com", telefone: "5511999990003", is_admin: false, turma: "Mesa 01", created_at: "2026-04-08T14:21:00Z" },
  { id: "aluno-3", nome: "João Pedro Costa", email: "joao.pedro@email.com", telefone: "5511999990004", is_admin: false, turma: "Mesa 01", created_at: "2026-04-10T09:05:00Z" },
  { id: "aluno-4", nome: "Beatriz Souza", email: "beatriz.souza@email.com", telefone: "5511999990005", is_admin: false, turma: "Mesa 02", created_at: "2026-04-15T20:30:00Z" },
  { id: "aluno-5", nome: "Pedro Henrique", email: "pedro.h@email.com", telefone: null, is_admin: false, turma: "Mesa 02", created_at: "2026-04-18T07:14:00Z" },
  { id: "aluno-6", nome: "Camila Ribeiro", email: "camila.ribeiro@email.com", telefone: "5511999990007", is_admin: false, turma: "Mesa 02", created_at: "2026-04-20T16:42:00Z" },
  { id: "aluno-7", nome: "Lucas Fernandes (cadastro)", email: "lucas.f@email.com", telefone: "5511999990008", is_admin: false, turma: "Mesa 03", created_at: "2026-05-02T11:30:00Z" },
  { id: "aluno-8", nome: "Ana Caroline", email: "ana.c@email.com", telefone: null, is_admin: false, turma: "Mesa 03", created_at: "2026-05-09T08:00:00Z" },
];

export const MOCK_CURSOS: Curso[] = [
  {
    id: "curso-biblia",
    slug: "biblia",
    titulo: "Bíblia",
    descricao:
      "Leitura da Bíblia inteira (Almeida Corrigida Fiel). Toque nos versículos pra selecionar e gere imagens prontas pra postar no Instagram, Status do WhatsApp ou compartilhar com a galera.",
    imagem_url: null,
    is_pago: false,
    preco_centavos: 0,
    ordem: 100,
    publicado: true,
    external_path: "/biblia",
    created_at: "2026-05-23T00:00:00Z",
  },
  {
    id: "curso-2",
    slug: "fundamentos-do-discipulado",
    titulo: "Fundamentos do Discipulado",
    descricao:
      "Doze encontros aprofundando os pilares: identidade em Cristo, vida no Espírito, comunidade comprometida, missão integral. Atividades de reflexão semanais com devolutiva pastoral.",
    imagem_url: null,
    is_pago: false,
    preco_centavos: 0,
    ordem: 2,
    publicado: true,
    external_path: null,
    created_at: "2026-04-05T00:00:00Z",
  },
  {
    id: "curso-3",
    slug: "envio-a-semente-plantada",
    titulo: "Envio: a semente plantada",
    descricao:
      "Curso aprofundado para discípulos maduros que estão sendo enviados. Quatro módulos sobre liderança pastoral, multiplicação, plantio e cuidado de novos discípulos. Inclui mentoria por 90 dias.",
    imagem_url: null,
    is_pago: true,
    preco_centavos: 19700,
    ordem: 3,
    publicado: true,
    external_path: null,
    created_at: "2026-04-20T00:00:00Z",
  },
  {
    id: "curso-4",
    slug: "ego-transformado-keller",
    titulo: "Ego Transformado",
    descricao:
      "Estudo guiado a partir do livro de Timothy Keller (Vida Nova). Quatro aulas curtas sobre identidade, autoesquecimento e a humildade que brota do evangelho. Cada aula libera a próxima quando todas as questões são respondidas corretamente.",
    imagem_url: null,
    is_pago: false,
    preco_centavos: 0,
    ordem: 4,
    publicado: true,
    external_path: null,
    created_at: "2026-05-14T00:00:00Z",
  },
];

export const MOCK_AULAS: Aula[] = [
  // Fundamentos do Discipulado (12 aulas) — só os títulos para o índice
  { id: "aula-8", curso_id: "curso-2", titulo: "Identidade em Cristo: filho antes de servo", ordem: 1, video_url: null, material_url: null, conteudo: "Conteúdo desta aula em construção. Em breve.", created_at: "2026-04-05T00:00:00Z" },
  { id: "aula-9", curso_id: "curso-2", titulo: "Vida no Espírito: dependência diária", ordem: 2, video_url: null, material_url: null, conteudo: "Conteúdo desta aula em construção.", created_at: "2026-04-05T00:00:00Z" },
  { id: "aula-10", curso_id: "curso-2", titulo: "Comunidade comprometida: para além do grupo", ordem: 3, video_url: null, material_url: null, conteudo: "Conteúdo desta aula em construção.", created_at: "2026-04-05T00:00:00Z" },
  { id: "aula-11", curso_id: "curso-2", titulo: "Missão integral: a fé que age", ordem: 4, video_url: null, material_url: null, conteudo: "Conteúdo desta aula em construção.", created_at: "2026-04-05T00:00:00Z" },
  // Envio (4 módulos)
  { id: "aula-12", curso_id: "curso-3", titulo: "Liderança pastoral: cuidar antes de gerenciar", ordem: 1, video_url: null, material_url: null, conteudo: "Conteúdo do curso pago em construção.", created_at: "2026-04-20T00:00:00Z" },
  // ===== Ego Transformado (Keller) — 4 aulas =====
  { id: "k-aula-1", curso_id: "curso-4", titulo: "Introdução: A liberdade resultante do autoesquecimento", ordem: 1, video_url: null, material_url: "ego-transformado-keller/livro-completo.pdf", conteudo: EGO_K1, created_at: "2026-05-14T00:00:00Z" },
  { id: "k-aula-2", curso_id: "curso-4", titulo: "A condição natural do ego humano", ordem: 2, video_url: null, material_url: "ego-transformado-keller/livro-completo.pdf", conteudo: EGO_K2, created_at: "2026-05-14T00:00:00Z" },
  { id: "k-aula-3", curso_id: "curso-4", titulo: "A visão transformada do eu", ordem: 3, video_url: null, material_url: "ego-transformado-keller/livro-completo.pdf", conteudo: EGO_K3, created_at: "2026-05-14T00:00:00Z" },
  { id: "k-aula-4", curso_id: "curso-4", titulo: "Como alcançar uma visão transformada do eu", ordem: 4, video_url: null, material_url: "ego-transformado-keller/livro-completo.pdf", conteudo: EGO_K4, created_at: "2026-05-14T00:00:00Z" },
];

export const MOCK_ATIVIDADES: Atividade[] = [
  // Aula 8 - Fundamentos (placeholder do mock — atv-8 sobrevive porque tem resposta r-12)
  { id: "atv-8", aula_id: "aula-8", pergunta: "O que muda quando você se entende primeiro filho, depois servo? Onde isso ainda não desceu na sua vida prática?", ordem: 1, tipo: "reflexao", razao: null, created_at: "2026-04-05T00:00:00Z" },

  // ====== EGO TRANSFORMADO — 2 reflexões + 10 MCs por capítulo (de lib/ego-transformado-atividades.ts) ======
  ...EGO_REFLEXOES,
  ...EGO_MCS,
];

export const MOCK_ALTERNATIVAS: Alternativa[] = [...EGO_ALTERNATIVAS];

export type MockResposta = {
  id: string;
  atividade_id: string;
  aluno_id: string;
  texto: string;
  comentario_lider: string | null;
  comentario_lider_em: string | null;
  created_at: string;
  updated_at: string;
};

export const MOCK_RESPOSTAS: MockResposta[] = [
  {
    id: "r-12", atividade_id: "atv-8", aluno_id: "aluno-4",
    texto: "Quando entendo que sou filha primeiro, paro de tentar 'merecer' aprovação. O lugar onde isso ainda não desceu é no trabalho — continuo me esforçando demais para provar que sou competente. A insegurança da identidade aparece ali.",
    comentario_lider: "Beatriz, esse é um dos discernimentos mais importantes da vida cristã. Quando o trabalho deixa de ser palco de aprovação e vira lugar de serviço, muita coisa muda. Sugestão: ore essa semana especificamente sobre o trabalho. Veja o que muda.",
    comentario_lider_em: "2026-05-13T11:00:00Z",
    created_at: "2026-05-12T22:00:00Z", updated_at: "2026-05-12T22:00:00Z",
  },
];

export type MockMatricula = {
  aluno_id: string; curso_id: string;
  matriculado_em: string; concluido_em: string | null;
};

// Mutable array — server actions de matrícula/desmatrícula adicionam/removem entradas em mock mode.
export const MOCK_MATRICULAS: MockMatricula[] = [
  // Curso de partida — mock user já matriculado para o dashboard local não abrir vazio.
  { aluno_id: MOCK_USER_ID, curso_id: "curso-4", matriculado_em: "2026-05-21T10:00:00Z", concluido_em: null },
  // Demos legadas (cursos placeholder)
  { aluno_id: "aluno-2", curso_id: "curso-2", matriculado_em: "2026-05-13T20:00:00Z", concluido_em: null },
  { aluno_id: "aluno-4", curso_id: "curso-2", matriculado_em: "2026-05-12T22:00:00Z", concluido_em: null },
  { aluno_id: "aluno-6", curso_id: "curso-2", matriculado_em: "2026-05-08T15:35:00Z", concluido_em: null },
  // Envio (curso pago)
  { aluno_id: "aluno-6", curso_id: "curso-3", matriculado_em: "2026-04-25T10:00:00Z", concluido_em: null },
];

export function addMockMatricula(alunoId: string, cursoId: string) {
  const existe = MOCK_MATRICULAS.some((m) => m.aluno_id === alunoId && m.curso_id === cursoId);
  if (existe) return;
  MOCK_MATRICULAS.push({
    aluno_id: alunoId,
    curso_id: cursoId,
    matriculado_em: new Date().toISOString(),
    concluido_em: null,
  });
}

export function removeMockMatricula(alunoId: string, cursoId: string) {
  const idx = MOCK_MATRICULAS.findIndex((m) => m.aluno_id === alunoId && m.curso_id === cursoId);
  if (idx >= 0) MOCK_MATRICULAS.splice(idx, 1);
}

export const MOCK_PROGRESSO: { aluno_id: string; aula_id: string; concluido_em: string }[] = [];

// ============== Helpers ==============

export function isMockMode(): boolean {
  return process.env.NEXT_PUBLIC_MOCK_MODE === "true";
}

export function findCurso(slug: string) {
  return MOCK_CURSOS.find((c) => c.slug === slug);
}

export function aulasByCurso(cursoId: string) {
  return MOCK_AULAS
    .filter((a) => a.curso_id === cursoId)
    .sort((a, b) => a.ordem - b.ordem);
}

export function findAula(aulaId: string) {
  return MOCK_AULAS.find((a) => a.id === aulaId);
}

export function atividadesByAula(aulaId: string) {
  return MOCK_ATIVIDADES
    .filter((a) => a.aula_id === aulaId)
    .sort((a, b) => a.ordem - b.ordem);
}

export function respostasByAluno(alunoId: string) {
  return MOCK_RESPOSTAS.filter((r) => r.aluno_id === alunoId);
}

export function progressoByAluno(alunoId: string) {
  return MOCK_PROGRESSO.filter((p) => p.aluno_id === alunoId);
}

export function matriculasByAluno(alunoId: string) {
  return MOCK_MATRICULAS.filter((m) => m.aluno_id === alunoId);
}

// ===== Estado mutável de respostas MC (apenas em modo mock) =====
// Map: `${alunoId}::${atividadeId}` → alternativaId
const MOCK_MC_ANSWERS = new Map<string, string>();

export function setMockMcAnswer(alunoId: string, atividadeId: string, alternativaId: string) {
  MOCK_MC_ANSWERS.set(`${alunoId}::${atividadeId}`, alternativaId);
}

export function getMockMcAnswer(alunoId: string, atividadeId: string): string | undefined {
  return MOCK_MC_ANSWERS.get(`${alunoId}::${atividadeId}`);
}

export function alternativasByAtividade(atividadeId: string): Alternativa[] {
  return MOCK_ALTERNATIVAS.filter((a) => a.atividade_id === atividadeId).sort((a, b) => a.ordem - b.ordem);
}

// Persiste resposta de reflexão no mock: faz upsert em MOCK_RESPOSTAS
// para que listRespostasByAluno enxergue e aulaCompleta reconheça como respondida.
export function setMockReflexao(alunoId: string, atividadeId: string, texto: string) {
  const idx = MOCK_RESPOSTAS.findIndex(
    (r) => r.aluno_id === alunoId && r.atividade_id === atividadeId
  );
  const agora = new Date().toISOString();
  if (idx >= 0) {
    MOCK_RESPOSTAS[idx].texto = texto;
    MOCK_RESPOSTAS[idx].updated_at = agora;
  } else {
    MOCK_RESPOSTAS.push({
      id: `mock-r-${Date.now()}`,
      atividade_id: atividadeId,
      aluno_id: alunoId,
      texto,
      comentario_lider: null,
      comentario_lider_em: null,
      created_at: agora,
      updated_at: agora,
    });
  }
}

// Aula completa = todas as MCs corretas E todas as reflexões respondidas (texto não vazio)
export function aulaCompleta(alunoId: string, aulaId: string): boolean {
  const atividades = MOCK_ATIVIDADES.filter((a) => a.aula_id === aulaId);
  if (atividades.length === 0) return true;
  for (const atv of atividades) {
    if (atv.tipo === "multipla_escolha") {
      const altSelId = MOCK_MC_ANSWERS.get(`${alunoId}::${atv.id}`);
      if (!altSelId) return false;
      const alt = MOCK_ALTERNATIVAS.find((a) => a.id === altSelId);
      if (!alt || !alt.correta) return false;
    } else {
      // reflexao
      const r = MOCK_RESPOSTAS.find(
        (x) => x.aluno_id === alunoId && x.atividade_id === atv.id
      );
      if (!r?.texto?.trim()) return false;
    }
  }
  return true;
}
