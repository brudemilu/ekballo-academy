-- =============================================================
-- 072 · Carrosséis de Instagram (gerador /admin/instagram)
-- =============================================================
-- Guarda o conteúdo de origem, os slides (jsonb), a legenda e o agendamento.
-- Só admin mexe (RLS via is_admin). A rota de cron usa service_role (ignora RLS).
-- Status: rascunho | agendado | publicado | erro.

create table if not exists public.instagram_carrosseis (
  id         uuid primary key default gen_random_uuid(),
  conteudo   text        not null default '',
  slides     jsonb       not null default '[]'::jsonb,
  legenda    text        not null default '',
  status     text        not null default 'rascunho'
              check (status in ('rascunho', 'agendado', 'publicado', 'erro')),
  agendado_para timestamptz,
  publicado_em  timestamptz,
  ig_post_id text,
  erro       text,
  criado_em  timestamptz not null default now()
);

-- índice pro cron achar rápido os agendados vencidos
create index if not exists idx_ig_carrosseis_agendado
  on public.instagram_carrosseis (status, agendado_para);

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
