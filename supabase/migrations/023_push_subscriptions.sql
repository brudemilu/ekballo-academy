-- =============================================================
-- EKBALLO ACADEMY · Push notifications (Web Push)
-- Tabela onde cada device do aluno registra sua subscription
-- (endpoint + chaves criptográficas) pra receber push.
-- Disparos chamam /api/push/send com x-internal-secret.
-- =============================================================

create table if not exists push_subscriptions (
  id uuid primary key default gen_random_uuid(),
  aluno_id uuid not null references profiles(id) on delete cascade,
  endpoint text not null unique,
  p256dh text not null,
  auth text not null,
  user_agent text,
  created_at timestamptz not null default now(),
  last_seen_at timestamptz not null default now()
);

create index if not exists push_subscriptions_aluno_idx
  on push_subscriptions(aluno_id);

-- RLS
alter table push_subscriptions enable row level security;

-- Aluno vê e gerencia só as próprias subscriptions
drop policy if exists "push_subs_self_read" on push_subscriptions;
create policy "push_subs_self_read" on push_subscriptions
  for select to authenticated
  using (aluno_id = auth.uid());

drop policy if exists "push_subs_self_insert" on push_subscriptions;
create policy "push_subs_self_insert" on push_subscriptions
  for insert to authenticated
  with check (aluno_id = auth.uid());

drop policy if exists "push_subs_self_update" on push_subscriptions;
create policy "push_subs_self_update" on push_subscriptions
  for update to authenticated
  using (aluno_id = auth.uid())
  with check (aluno_id = auth.uid());

drop policy if exists "push_subs_self_delete" on push_subscriptions;
create policy "push_subs_self_delete" on push_subscriptions
  for delete to authenticated
  using (aluno_id = auth.uid());

-- Admin vê tudo (pra debug / pra disparar push)
drop policy if exists "push_subs_admin_all" on push_subscriptions;
create policy "push_subs_admin_all" on push_subscriptions
  for all to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));
