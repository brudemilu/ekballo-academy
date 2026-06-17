-- =============================================================
-- EKBALLO ACADEMY · Recuperação de senha por WhatsApp
-- =============================================================
-- Em vez do e-mail (SMTP default do Supabase — rate limit baixo e
-- entregas que caem no spam, motivo de "ninguém consegue resetar"),
-- o reset agora manda um CÓDIGO de 6 dígitos no WhatsApp cadastrado.
--
-- Esta tabela guarda o código (com HASH, nunca em texto puro), a
-- expiração e o contador de tentativas. Só o service_role acessa
-- (RLS ligado SEM policies => anon/authenticated ficam bloqueados;
--  o service_role bypassa RLS).
-- -------------------------------------------------------------

create table if not exists public.recuperacao_senha (
  id          uuid primary key default gen_random_uuid(),
  profile_id  uuid not null references public.profiles(id) on delete cascade,
  codigo_hash text not null,
  expira_em   timestamptz not null,
  usado_em    timestamptz,
  tentativas  int not null default 0,
  criado_em   timestamptz not null default now()
);

create index if not exists recuperacao_senha_profile_idx
  on public.recuperacao_senha (profile_id, criado_em desc);

alter table public.recuperacao_senha enable row level security;
-- (sem policies de propósito — somente service_role opera nesta tabela)
