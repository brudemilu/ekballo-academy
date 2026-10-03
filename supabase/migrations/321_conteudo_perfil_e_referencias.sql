-- Copiloto de conteúdo (issue #189), fatia 3: perfil do ministério e
-- criadores de referência.
--
-- conteudo_perfil     — UMA linha só (id = 1): objetivo, público, pilares, a
--                       voz do pastor e o que a IA não deve tocar. É o contexto
--                       que entra em todo pedido de roteiro ou post.
-- conteudo_referencias — os criadores que o pastor admira. Guarda os exemplos
--                       colados por ele e o "DNA" que a IA extraiu deles: a
--                       FORMA (gancho, estrutura, ritmo), nunca o conteúdo.

create table if not exists public.conteudo_perfil (
  id              smallint primary key default 1 check (id = 1),
  objetivo        text  not null default '',
  publico         text  not null default '',
  pilares         jsonb not null default '[]'::jsonb,
  voz_amostras    text  not null default '',
  voz_dna         jsonb,
  temas_proibidos text  not null default '',
  chamada_padrao  text  not null default '',
  atualizado_em   timestamptz not null default now()
);

create table if not exists public.conteudo_referencias (
  id            uuid primary key default gen_random_uuid(),
  nome          text not null check (char_length(btrim(nome)) between 1 and 80),
  link          text not null default '',
  exemplos      text not null default '',
  dna           jsonb,
  analisado_em  timestamptz,
  criado_em     timestamptz not null default now()
);

alter table public.conteudo_perfil enable row level security;
alter table public.conteudo_referencias enable row level security;

drop policy if exists "admin full access conteudo perfil" on public.conteudo_perfil;
create policy "admin full access conteudo perfil"
  on public.conteudo_perfil
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

drop policy if exists "admin full access conteudo referencias" on public.conteudo_referencias;
create policy "admin full access conteudo referencias"
  on public.conteudo_referencias
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));
