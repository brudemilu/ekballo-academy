-- =============================================================
-- Sistema de mensagens admin → alunos.
-- Admin pode enviar mensagem pra:
--   - 'todos': todos os alunos não-admin
--   - 'curso': todos os alunos matriculados num curso específico
--   - 'aluno': um aluno específico
-- Canais: email (já implementado), whatsapp (placeholder pro futuro).
-- =============================================================

create table if not exists public.mensagens (
  id uuid primary key default gen_random_uuid(),
  autor_id uuid not null references public.profiles(id) on delete restrict,
  destino_tipo text not null check (destino_tipo in ('todos', 'curso', 'aluno')),
  destino_id uuid,
  canais text[] not null default array['email']::text[],
  assunto text not null,
  corpo_html text not null,
  corpo_texto text,
  total_destinatarios int not null default 0,
  total_enviados int not null default 0,
  total_erros int not null default 0,
  enviada_em timestamptz not null default now()
);

create index if not exists mensagens_autor_idx on public.mensagens(autor_id);
create index if not exists mensagens_enviada_em_idx on public.mensagens(enviada_em desc);

comment on table public.mensagens is 'Mensagens enviadas pelo admin (broadcast/individual). Histórico permanente.';

create table if not exists public.mensagens_destinatarios (
  id uuid primary key default gen_random_uuid(),
  mensagem_id uuid not null references public.mensagens(id) on delete cascade,
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  email_status text not null default 'pendente'
    check (email_status in ('pendente', 'enviado', 'erro', 'pulado')),
  email_msg_id text,
  email_erro text,
  email_enviado_em timestamptz,
  whatsapp_status text not null default 'pulado'
    check (whatsapp_status in ('pendente', 'enviado', 'erro', 'pulado')),
  whatsapp_enviado_em timestamptz,
  unique (mensagem_id, aluno_id)
);

create index if not exists mensagens_dest_msgid_idx on public.mensagens_destinatarios(mensagem_id);
create index if not exists mensagens_dest_alunoid_idx on public.mensagens_destinatarios(aluno_id);

comment on table public.mensagens_destinatarios is 'Status por destinatário de cada mensagem enviada.';

-- RLS: só admin lê/escreve via UI. Service_role bypassa (API route usa service_role).
alter table public.mensagens enable row level security;
alter table public.mensagens_destinatarios enable row level security;

drop policy if exists "mensagens_admin_all" on public.mensagens;
create policy "mensagens_admin_all"
  on public.mensagens for all
  to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true))
  with check (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true));

drop policy if exists "mensagens_dest_admin_all" on public.mensagens_destinatarios;
create policy "mensagens_dest_admin_all"
  on public.mensagens_destinatarios for all
  to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true))
  with check (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true));
