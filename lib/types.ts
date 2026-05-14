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
  ordem: number;
  created_at: string;
};

export type Atividade = {
  id: string;
  aula_id: string;
  pergunta: string;
  ordem: number;
  created_at: string;
};

export type Resposta = {
  id: string;
  atividade_id: string;
  aluno_id: string;
  texto: string;
  comentario_lider: string | null;
  comentario_lider_em: string | null;
  created_at: string;
  updated_at: string;
};
