-- =============================================================
-- Adiciona coluna `material_url` à tabela `aulas`.
--
-- Uso: armazena um link para material de apoio (PDF, slides, etc.)
-- que será renderizado na página da aula como botão de download.
--
-- Convenção de conteúdo da coluna:
--   - Se começar com http:// ou https://  → URL externa, usada direta.
--   - Caso contrário → tratada como path no bucket privado do Storage
--     `materiais-cursos`, e o backend gera signed URL temporária
--     antes de devolver para o cliente.
-- =============================================================

alter table public.aulas
  add column if not exists material_url text;

comment on column public.aulas.material_url is
  'Material complementar opcional da aula. Pode ser URL externa (http/https) ou path relativo no bucket privado materiais-cursos.';
