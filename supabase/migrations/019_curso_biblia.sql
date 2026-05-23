-- =============================================================
-- EKBALLO ACADEMY · Bíblia como "curso" matriculável
-- Adiciona coluna `external_path` em `cursos` para cursos cuja
-- interface é uma rota custom (não a estrutura padrão de aulas).
-- Cria o curso "Bíblia" apontando pra /biblia.
-- =============================================================

alter table public.cursos
  add column if not exists external_path text;

comment on column public.cursos.external_path is
  'Quando preenchido, o card do curso linka pra essa rota em vez de /cursos/[slug]. Usado pra "cursos" que têm interface custom (ex.: leitor da Bíblia).';

-- Insere/atualiza o curso "Bíblia"
insert into public.cursos
  (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado, external_path)
values (
  'biblia',
  'Bíblia',
  'Leitura da Bíblia inteira (Almeida Corrigida Fiel). Toque nos versículos pra selecionar e gere imagens prontas pra postar no Instagram, Status do WhatsApp ou compartilhar com a galera. Use também como referência para suas reflexões nos demais cursos.',
  null,
  false,
  0,
  100,  -- ordem alta pra aparecer entre os primeiros, mas ajustável
  true,
  '/biblia'
)
on conflict (slug) do update set
  titulo = excluded.titulo,
  descricao = excluded.descricao,
  external_path = excluded.external_path,
  publicado = excluded.publicado;
