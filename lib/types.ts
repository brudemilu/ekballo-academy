export type Profile = {
  id: string;
  nome: string | null;
  email: string;
  telefone: string | null;
  is_admin: boolean;
  // Perfil de acesso. master = tudo; coordenador/lider = conforme matriz;
  // discipulo = sem painel. Pode vir ausente em registros antigos.
  papel?: "master" | "coordenador" | "lider" | "discipulo";
  turma: string | null;
  created_at: string;
};

export type Curso = {
  id: string;
  slug: string;
  titulo: string;
  descricao: string | null;
  imagem_url: string | null;
  is_pago: boolean;
  preco_centavos: number;
  ordem: number;
  publicado: boolean;
  // Quando preenchido, o card linka pra essa rota em vez de /cursos/[slug].
  // Usado pra "cursos" com interface custom (ex.: Bíblia → /biblia).
  external_path: string | null;
  // Autor do livro em que o curso se baseia (creditado em imagens geradas).
  autor?: string | null;
  // Quando true, todas as aulas ficam desbloqueadas (sem trava sequencial).
  aulas_livres?: boolean | null;
  // Seção da vitrine (ver lib/categorias.ts). NULL = curso sem categoria → "Outros".
  categoria?: string | null;
  // Áudio de leitura sob demanda (solicitado pelo master).
  // 'nenhum' | 'pendente' | 'gerando' | 'pronto' | 'erro'
  audio_status?: string | null;
  audio_progresso?: number | null;
  audio_total?: number | null;
  created_at: string;
};

export type Aula = {
  id: string;
  curso_id: string;
  titulo: string;
  conteudo: string | null;
  video_url: string | null;
  material_url: string | null;
  audio_url?: string | null;
  // Leitura literal (audiolivro, voz única) do conteudo — distinta do audio_url
  // (overview em podcast). Gerada por scripts/gerar-leituras.mjs.
  audio_leitura_url?: string | null;
  ordem: number;
  created_at: string;
};

export type TipoAtividade = "reflexao" | "multipla_escolha";

export type Atividade = {
  id: string;
  aula_id: string;
  pergunta: string;
  ordem: number;
  tipo: TipoAtividade;
  razao: string | null; // justificativa exibida após resposta MC
  created_at: string;
};

export type Alternativa = {
  id: string;
  atividade_id: string;
  texto: string;
  correta: boolean;
  ordem: number;
};

export type Resposta = {
  id: string;
  atividade_id: string;
  aluno_id: string;
  texto: string | null;
  alternativa_id: string | null; // preenchido quando atividade é MC
  comentario_lider: string | null;
  comentario_lider_em: string | null;
  created_at: string;
  updated_at: string;
};

// Grifo do discípulo no conteúdo de uma aula.
export type Destaque = {
  id: string;
  aula_id: string;
  aluno_id: string;
  paragrafo: number;
  inicio: number;
  fim: number;
  texto: string;
  cor: "amarelo" | "verde" | "rosa" | "azul";
  comentario: string | null;
  criado_em: string;
};

export type EmailTemplateChave =
  | "novo-cadastro"
  | "boas-vindas-curso"
  | "lembrete-inatividade";

export type EmailTemplate = {
  id: string;
  chave: EmailTemplateChave;
  descricao: string;
  assunto: string;
  corpo_html: string;
  corpo_texto: string | null;
  variaveis_disponiveis: string[];
  ativo: boolean;
  created_at: string;
  updated_at: string;
};

export type MensagemDestinoTipo = "todos" | "curso" | "aluno";
export type MensagemCanal = "email" | "whatsapp";
export type MensagemStatus = "pendente" | "enviado" | "erro" | "pulado";

export type Mensagem = {
  id: string;
  autor_id: string;
  destino_tipo: MensagemDestinoTipo;
  destino_id: string | null;
  canais: MensagemCanal[];
  assunto: string;
  corpo_html: string;
  corpo_texto: string | null;
  total_destinatarios: number;
  total_enviados: number;
  total_erros: number;
  enviada_em: string;
};

export type MensagemDestinatario = {
  id: string;
  mensagem_id: string;
  aluno_id: string;
  email_status: MensagemStatus;
  email_msg_id: string | null;
  email_erro: string | null;
  email_enviado_em: string | null;
  whatsapp_status: MensagemStatus;
  whatsapp_enviado_em: string | null;
};
