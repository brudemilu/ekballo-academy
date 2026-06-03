-- =============================================================
-- EKBALLO ACADEMY
-- (1) Autor do livro por curso (para creditar em imagens/capa)
-- (2) Destaques (grifos) do discípulo no conteúdo das aulas
-- =============================================================

-- 1) Autor do livro por curso ---------------------------------
alter table public.cursos add column if not exists autor text;

update public.cursos set autor = 'Elias Dantas'      where slug = 'o-desafio-de-todo-lider'  and autor is null;
update public.cursos set autor = 'Timothy Keller'    where slug = 'ego-transformado-keller'  and autor is null;
update public.cursos set autor = 'Douglas Gonçalves' where slug = 'olhe-para-jesus'           and autor is null;
update public.cursos set autor = 'John Haggai'       where slug = 'seja-um-lider-de-verdade'  and autor is null;

-- 2) Destaques (grifos) por aluno/aula ------------------------
-- paragrafo = índice do parágrafo (conteudo dividido por \n\n)
-- inicio/fim = offsets de caractere dentro do parágrafo
-- texto = trecho marcado (para "Meus destaques" e geração de imagem)
-- cor = marca-texto escolhido
create table if not exists public.destaques_aula (
  id uuid primary key default gen_random_uuid(),
  aula_id uuid not null references public.aulas(id) on delete cascade,
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  paragrafo int not null,
  inicio int not null,
  fim int not null,
  texto text not null,
  cor text not null default 'amarelo',
  criado_em timestamptz not null default now(),
  check (cor in ('amarelo','verde','rosa','azul')),
  check (fim > inicio)
);

create index if not exists destaques_aula_aluno_aula_idx
  on public.destaques_aula(aluno_id, aula_id);

-- RLS: o discípulo gerencia os próprios grifos; admin lê tudo.
alter table public.destaques_aula enable row level security;

drop policy if exists "destaques_self" on public.destaques_aula;
create policy "destaques_self" on public.destaques_aula for all
  to authenticated
  using (aluno_id = auth.uid())
  with check (aluno_id = auth.uid());

drop policy if exists "destaques_admin_read" on public.destaques_aula;
create policy "destaques_admin_read" on public.destaques_aula for select
  to authenticated
  using (public.is_admin(auth.uid()));
