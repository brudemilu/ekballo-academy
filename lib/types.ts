export type Profile = {
  id: string;
  nome: string | null;
  email: string;
  is_admin: boolean;
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
  created_at: string;
};

export type Aula = {
  id: string;
  curso_id: string;
  titulo: string;
  conteudo: string | null;
  video_url: string | null;
  material_url: string | null;
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
