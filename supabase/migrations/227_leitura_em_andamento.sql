-- =============================================================
-- EKBALLO ACADEMY · Leitura em andamento ("Continuando a leitura")
--
-- Problema: quem lê vários livros ao mesmo tempo perde de vista os
-- que começou — eles ficam diluídos no meio de ~190 capas na vitrine.
-- E quem lê sem matrícula (o master) não tinha NENHUM indicador:
-- o selo "Em andamento" do card dependia de `matriculas`.
--
-- Aqui entra:
--   1. `leitura_marcador` — onde o discípulo parou em cada livro.
--      Gravado ao ABRIR uma mesa (não só ao concluir), então o livro
--      entra em destaque desde a primeira página lida. Independe de
--      matrícula, de propósito.
--   2. `progresso_leitura()` — devolve, num round-trip só, o progresso
--      de cada livro do aluno (total de mesas, concluídas, próxima
--      mesa a ler e quando ele mexeu nele pela última vez).
-- =============================================================

-- ---------- MARCADOR DE LEITURA ----------
create table if not exists public.leitura_marcador (
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  curso_id uuid not null references public.cursos(id) on delete cascade,
  -- última mesa aberta; on delete set null pra sobreviver a remoção de aula
  aula_id uuid references public.aulas(id) on delete set null,
  atualizado_em timestamptz not null default now(),
  -- "tirar da lista": quem abre um livro só pra espiar (o master revisando
  -- conteúdo, por exemplo) precisa poder dispensá-lo do destaque. Volta
  -- sozinho se ele ler de novo — a comparação é com `ultima_em`.
  dispensado_em timestamptz,
  primary key (aluno_id, curso_id)
);

alter table public.leitura_marcador
  add column if not exists dispensado_em timestamptz;

comment on table public.leitura_marcador is
  'Onde cada aluno parou em cada livro. Gravado ao abrir a mesa; alimenta a seção "Continuando a leitura" do painel.';

create index if not exists leitura_marcador_aluno_idx
  on public.leitura_marcador (aluno_id, atualizado_em desc);

alter table public.leitura_marcador enable row level security;

drop policy if exists "leitura_marcador_read_own" on public.leitura_marcador;
create policy "leitura_marcador_read_own" on public.leitura_marcador
  for select using (auth.uid() = aluno_id or public.is_admin(auth.uid()));

drop policy if exists "leitura_marcador_insert_own" on public.leitura_marcador;
create policy "leitura_marcador_insert_own" on public.leitura_marcador
  for insert with check (auth.uid() = aluno_id);

drop policy if exists "leitura_marcador_update_own" on public.leitura_marcador;
create policy "leitura_marcador_update_own" on public.leitura_marcador
  for update using (auth.uid() = aluno_id) with check (auth.uid() = aluno_id);

drop policy if exists "leitura_marcador_delete_own" on public.leitura_marcador;
create policy "leitura_marcador_delete_own" on public.leitura_marcador
  for delete using (auth.uid() = aluno_id or public.is_admin(auth.uid()));

-- ---------- PROGRESSO DE LEITURA POR LIVRO ----------
-- SECURITY INVOKER: roda com o RLS do próprio aluno (progresso já é
-- "read own"), e o filtro por auth.uid() garante que ninguém leia o
-- progresso de outro mesmo tendo permissão ampla (admin).
drop function if exists public.progresso_leitura();
create function public.progresso_leitura()
returns table (
  curso_id uuid,
  total_aulas int,
  concluidas int,
  proxima_aula_id uuid,
  proxima_aula_titulo text,
  proxima_aula_ordem int,
  ultima_em timestamptz,
  dispensado_em timestamptz
)
language sql
stable
security invoker
set search_path = public
as $$
  with cursos_do_aluno as (
    select a.curso_id
      from public.progresso pr
      join public.aulas a on a.id = pr.aula_id
     where pr.aluno_id = auth.uid()
    union
    select lm.curso_id
      from public.leitura_marcador lm
     where lm.aluno_id = auth.uid()
    union
    select m.curso_id
      from public.matriculas m
     where m.aluno_id = auth.uid()
  ),
  base as (
    select a.curso_id, a.id as aula_id, a.ordem, pr.concluido_em
      from public.aulas a
      join cursos_do_aluno c on c.curso_id = a.curso_id
      left join public.progresso pr
        on pr.aula_id = a.id and pr.aluno_id = auth.uid()
  ),
  agg as (
    select b.curso_id,
           count(*)::int as total_aulas,
           count(b.concluido_em)::int as concluidas,
           max(b.concluido_em) as ultima_conclusao,
           max(b.ordem) filter (where b.concluido_em is not null) as ultima_ordem_lida,
           (array_agg(b.aula_id order by b.ordem, b.aula_id)
              filter (where b.concluido_em is null))[1] as primeira_pendente
      from base b
     group by b.curso_id
  ),
  escolha as (
    select agg.curso_id,
           agg.total_aulas,
           agg.concluidas,
           -- "Continuar" volta pra mesa onde ele parou. Se ela já foi concluída
           -- (ou não há marcador), segue pra primeira pendente DEPOIS da última
           -- mesa lida — quem pulou o prefácio não é jogado de volta pra ele.
           -- Só então cai na primeira pendente do livro.
           coalesce(
             case
               when lm.aula_id is null then null
               when exists (
                 select 1 from public.progresso p2
                  where p2.aluno_id = auth.uid() and p2.aula_id = lm.aula_id
               ) then null
               else lm.aula_id
             end,
             prox.aula_id,
             agg.primeira_pendente
           ) as proxima_aula_id,
           -- GREATEST ignora nulls no Postgres: vale a mais recente entre
           -- "abriu a mesa" e "concluiu a mesa".
           greatest(lm.atualizado_em, agg.ultima_conclusao) as ultima_em,
           lm.dispensado_em
      from agg
      left join public.leitura_marcador lm
        on lm.curso_id = agg.curso_id and lm.aluno_id = auth.uid()
      left join lateral (
        select b2.aula_id
          from base b2
         where b2.curso_id = agg.curso_id
           and b2.concluido_em is null
           and (agg.ultima_ordem_lida is null or b2.ordem > agg.ultima_ordem_lida)
         order by b2.ordem, b2.aula_id
         limit 1
      ) prox on true
  )
  select e.curso_id,
         e.total_aulas,
         e.concluidas,
         e.proxima_aula_id,
         a.titulo,
         a.ordem,
         e.ultima_em,
         e.dispensado_em
    from escolha e
    left join public.aulas a on a.id = e.proxima_aula_id;
$$;

grant execute on function public.progresso_leitura() to authenticated;
