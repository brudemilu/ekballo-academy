-- =============================================================
-- EKBALLO ACADEMY · Devocional Anual (ciclo evergreen 365 dias)
-- 12 temas mensais. O ciclo se repete todo ano.
-- A página /devocional tenta primeiro `devocionais` (post do líder
-- pra essa data); se não houver, cai pro `devocional_anual` pelo
-- dia do ano. Assinado por "Pr. Bruno Fernandes".
-- =============================================================

create table if not exists devocional_anual (
  dia_ano int primary key check (dia_ano between 1 and 365),
  mes int not null check (mes between 1 and 12),
  dia int not null check (dia between 1 and 31),
  tema text not null,
  titulo text not null,
  versiculo_ref text not null,
  versiculo_texto text not null,
  versiculo_versao text not null default 'ACF',
  reflexao text not null,
  autor text not null default 'Pr. Bruno Fernandes',
  publicado boolean not null default true,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  unique (mes, dia)
);

create index if not exists devocional_anual_mes_idx on devocional_anual(mes, dia);
create index if not exists devocional_anual_publicado_idx
  on devocional_anual(publicado, dia_ano);

-- Atualiza atualizado_em automaticamente
create or replace function tg_devocional_anual_updated_at()
returns trigger
language plpgsql
security invoker
set search_path = public
as $$
begin
  new.atualizado_em = now();
  return new;
end;
$$;

drop trigger if exists devocional_anual_set_updated on devocional_anual;
create trigger devocional_anual_set_updated
  before update on devocional_anual
  for each row execute procedure tg_devocional_anual_updated_at();

-- RLS — leitura autenticada quando publicado; escrita só admin
alter table devocional_anual enable row level security;

drop policy if exists "devocional_anual_read_publicado" on devocional_anual;
create policy "devocional_anual_read_publicado" on devocional_anual for select
  to authenticated
  using (publicado = true);

drop policy if exists "devocional_anual_admin_all" on devocional_anual;
create policy "devocional_anual_admin_all" on devocional_anual for all
  to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));
