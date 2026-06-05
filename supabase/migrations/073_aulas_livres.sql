-- =============================================================
-- cursos.aulas_livres — libera todas as aulas de um curso (sem trava sequencial)
-- Quando true, listAulasComStatus marca todas as aulas como desbloqueadas.
-- `completa` (se o aluno respondeu) continua valendo p/ progresso/relatórios.
-- Idempotente.
-- =============================================================

alter table public.cursos
  add column if not exists aulas_livres boolean not null default false;

-- Libera "O Desafio de Todo Líder"
update public.cursos
set aulas_livres = true
where slug = 'o-desafio-de-todo-lider';
