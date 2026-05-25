-- =============================================================
-- EKBALLO ACADEMY · Devocional diário
-- Admin posta 1 devocional por dia (versículo + reflexão curta).
-- Aluno lê o do dia e tem acesso ao histórico.
-- =============================================================

create table if not exists devocionais (
  id uuid primary key default gen_random_uuid(),
  data date unique not null,
  titulo text,                          -- opcional; quando null usa versiculo_ref
  versiculo_ref text not null,          -- "Romanos 8:28"
  versiculo_texto text not null,        -- texto do versículo (qualquer versão)
  versiculo_versao text default 'ACF',  -- sigla pra mostrar
  reflexao text not null,               -- reflexão pastoral (paragrafos separados por \n\n)
  autor text,                            -- opcional; default = "Liderança Ekballo"
  publicado boolean not null default true,
  criado_por uuid references profiles(id),
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

create index if not exists devocionais_data_idx on devocionais(data desc);
create index if not exists devocionais_publicado_idx
  on devocionais(publicado, data desc);

-- Trigger pra atualizar atualizado_em automaticamente
create or replace function tg_devocionais_updated_at()
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

drop trigger if exists devocionais_set_updated on devocionais;
create trigger devocionais_set_updated
  before update on devocionais
  for each row execute procedure tg_devocionais_updated_at();

-- RLS
alter table devocionais enable row level security;

drop policy if exists "devocionais_read_publicado" on devocionais;
create policy "devocionais_read_publicado" on devocionais for select
  to authenticated
  using (publicado = true);

drop policy if exists "devocionais_admin_all" on devocionais;
create policy "devocionais_admin_all" on devocionais for all
  to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));
