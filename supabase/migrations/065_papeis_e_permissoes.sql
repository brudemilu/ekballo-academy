-- =============================================================
-- EKBALLO ACADEMY · Papéis (perfis de acesso) e permissões
-- master = acesso total | coordenador / lider = acesso conforme
-- a matriz configurável | discipulo = sem painel.
-- =============================================================

-- 1) Papel no profile -----------------------------------------
alter table public.profiles add column if not exists papel text not null default 'discipulo';

-- Admins existentes viram master
update public.profiles
   set papel = 'master'
 where is_admin = true and (papel is null or papel = 'discipulo');

do $$ begin
  alter table public.profiles
    add constraint profiles_papel_check
    check (papel in ('master','coordenador','lider','discipulo'));
exception when duplicate_object then null; end $$;

-- 2) Matriz de permissões por papel ---------------------------
-- A presença da linha (papel, permissao) = aquele papel pode acessar
-- aquela área. Master tem tudo implicitamente (não fica armazenado).
create table if not exists public.papel_permissoes (
  papel text not null,
  permissao text not null,
  primary key (papel, permissao),
  check (papel in ('coordenador','lider')),
  check (permissao in ('discipulos','acompanhamento','conteudo','comunicacao'))
);

-- Seed: Coordenador = Pessoas + Acompanhamento + Conteúdo
insert into public.papel_permissoes (papel, permissao) values
  ('coordenador','discipulos'),
  ('coordenador','acompanhamento'),
  ('coordenador','conteudo')
on conflict do nothing;

-- Seed: Líder = Acompanhamento (ajustável na tela)
insert into public.papel_permissoes (papel, permissao) values
  ('lider','acompanhamento')
on conflict do nothing;

-- RLS: qualquer autenticado lê (para montar UI e checar acesso);
-- a escrita é feita pelo route handler com service_role (ignora RLS).
alter table public.papel_permissoes enable row level security;

drop policy if exists "papel_perm_read" on public.papel_permissoes;
create policy "papel_perm_read" on public.papel_permissoes for select
  to authenticated using (true);
