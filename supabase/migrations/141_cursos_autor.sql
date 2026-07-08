-- Autor do curso/livro. Usado para agrupar livros do mesmo autor dentro de
-- cada categoria no catálogo (a vitrine ordena por `ordem`, e o script
-- scripts/agrupar-autores.mjs reatribui `ordem` agrupando por autor).
alter table public.cursos add column if not exists autor text;
