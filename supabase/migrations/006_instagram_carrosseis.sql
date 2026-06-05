-- =============================================================
-- 006 · Carrosséis de Instagram (rascunhos do gerador /admin/instagram)
-- =============================================================
-- Guarda o conteúdo de origem, os slides (jsonb) e a legenda. Só admin
-- mexe (RLS via is_admin). Status: rascunho | agendado | publicado.

create table if not exists public.instagram_carrosseis (
  id         uuid primary key default gen_random_uuid(),
  conteudo   text        not null default '',
  slides     jsonb       not null default '[]'::jsonb,
  legenda    text        not null default '',
  status     text        not null default 'rascunho'
              check (status in ('rascunho', 'agendado', 'publicado')),
  agendado_para timestamptz,
  publicado_em  timestamptz,
  criado_em  timestamptz not null default now()
);

create index if not exists idx_ig_carrosseis_status
  on public.instagram_carrosseis (status, criado_em desc);

alter table public.instagram_carrosseis enable row level security;

-- Apenas administradores têm acesso total (leitura e escrita).
drop policy if exists "admin full access ig carrosseis" on public.instagram_carrosseis;
create policy "admin full access ig carrosseis"
  on public.instagram_carrosseis
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));
