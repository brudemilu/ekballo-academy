-- =============================================================
-- Fila de WhatsApp (envio individual com ritmo de 1/min) +
-- templates de mensagem reutilizáveis.
--
-- Por que fila: o WhatsApp não-oficial (Evolution GO/whatsmeow) bane
-- números que disparam em rajada. Então envios individuais (privado)
-- entram numa fila e saem 1 por minuto, tocados por pg_cron.
--
-- O motor é pg_cron (roda de minuto em minuto no Supabase) porque a
-- Vercel está no plano Hobby, onde cron só dispara ~1x/dia.
-- =============================================================

create extension if not exists pg_cron;
create extension if not exists pg_net;

-- Função genérica de updated_at (idempotente)
create or replace function public.tg_set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- -------------------------------------------------------------
-- TEMPLATES DE MENSAGEM (texto curto, p/ WhatsApp/push)
-- Suporta {{nome}} e {{curso}}, substituídos no enfileiramento.
-- -------------------------------------------------------------
create table if not exists public.mensagem_templates (
  id uuid primary key default gen_random_uuid(),
  titulo text not null,
  corpo text not null,
  descricao text,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.mensagem_templates is
  'Templates de mensagem curta (WhatsApp/push), reutilizáveis no envio. {{nome}}/{{curso}} substituídos no disparo.';

drop trigger if exists set_mensagem_templates_updated_at on public.mensagem_templates;
create trigger set_mensagem_templates_updated_at
  before update on public.mensagem_templates
  for each row execute function public.tg_set_updated_at();

alter table public.mensagem_templates enable row level security;

drop policy if exists "mensagem_templates_admin_all" on public.mensagem_templates;
create policy "mensagem_templates_admin_all"
  on public.mensagem_templates for all
  to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true))
  with check (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true));

-- Seed de exemplos (só se a tabela estiver vazia)
insert into public.mensagem_templates (titulo, corpo, descricao)
select * from (values
  (
    'Lembrete: dias sem acessar',
    'Olá {{nome}}! 👋 Faz alguns dias que você não entra na plataforma. Que tal retomar a leitura de onde parou? Te espero por lá! 📖',
    'Reengajamento de quem está há dias sem acessar.'
  ),
  (
    'Continue a leitura do livro',
    'Oi {{nome}}! Sua próxima aula de "{{curso}}" está te esperando. Continue firme nos estudos 💪.',
    'Incentivo para seguir no curso.'
  ),
  (
    'Boas-vindas',
    'Seja bem-vindo(a), {{nome}}! 🙌 Estamos felizes em ter você por aqui. Acesse a plataforma e comece sua jornada.',
    'Mensagem de boas-vindas a novos discípulos.'
  )
) as v(titulo, corpo, descricao)
where not exists (select 1 from public.mensagem_templates);

-- -------------------------------------------------------------
-- FILA DE WHATSAPP (1 envio por minuto)
-- -------------------------------------------------------------
create table if not exists public.whatsapp_fila (
  id uuid primary key default gen_random_uuid(),
  mensagem_id uuid references public.mensagens(id) on delete set null,
  aluno_id uuid references public.profiles(id) on delete set null,
  telefone text not null,
  corpo text not null,
  status text not null default 'pendente'
    check (status in ('pendente','enviando','enviado','erro','cancelado')),
  tentativas int not null default 0,
  erro text,
  message_id text,
  agendado_para timestamptz not null default now(),
  criado_em timestamptz not null default now(),
  enviado_em timestamptz
);

comment on table public.whatsapp_fila is
  'Fila de envios individuais de WhatsApp. pg_cron processa 1 pendente por minuto via edge function processar-whatsapp-fila.';

create index if not exists whatsapp_fila_proximo_idx
  on public.whatsapp_fila (status, agendado_para);

alter table public.whatsapp_fila enable row level security;

-- Só admin lê/cancela pela API autenticada; a edge function usa service_role (bypassa RLS).
drop policy if exists "whatsapp_fila_admin_select" on public.whatsapp_fila;
create policy "whatsapp_fila_admin_select"
  on public.whatsapp_fila for select
  to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true));

drop policy if exists "whatsapp_fila_admin_update" on public.whatsapp_fila;
create policy "whatsapp_fila_admin_update"
  on public.whatsapp_fila for update
  to authenticated
  using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true))
  with check (exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true));

-- Recalcula os contadores agregados de uma mensagem a partir do status
-- por destinatário (conta quem teve ao menos um canal entregue / com erro).
-- Chamada pela edge da fila conforme os WhatsApp vão saindo.
create or replace function public.recontar_mensagem(p_mensagem_id uuid)
returns void
language sql
security definer
set search_path = public
as $$
  update public.mensagens m set
    total_enviados = (
      select count(*) from public.mensagens_destinatarios d
      where d.mensagem_id = m.id
        and (d.email_status = 'enviado' or d.whatsapp_status = 'enviado')
    ),
    total_erros = (
      select count(*) from public.mensagens_destinatarios d
      where d.mensagem_id = m.id
        and (d.email_status = 'erro' or d.whatsapp_status = 'erro')
    )
  where m.id = p_mensagem_id;
$$;

-- Reserva atômica do próximo item (FIFO, lock pra não enviar duplicado).
-- A edge function (service_role) chama via rpc; retorna a linha reservada
-- já marcada como 'enviando', ou NULL se não houver pendente vencido.
create or replace function public.reservar_proximo_fila()
returns public.whatsapp_fila
language plpgsql
security definer
set search_path = public
as $$
declare
  r public.whatsapp_fila;
begin
  update public.whatsapp_fila
    set status = 'enviando', tentativas = tentativas + 1
    where id = (
      select id from public.whatsapp_fila
      where status = 'pendente' and agendado_para <= now()
      order by agendado_para, criado_em
      for update skip locked
      limit 1
    )
    returning * into r;
  return r;
end;
$$;

-- -------------------------------------------------------------
-- MOTOR: pg_cron a cada minuto -> edge function (1 envio por execução)
--
-- O segredo `fila_cron_secret` é gravado no Vault FORA desta migration
-- (para não vazar no git):
--   select vault.create_secret('<uuid>', 'fila_cron_secret');
-- e o MESMO valor vai no secret FILA_CRON_SECRET da edge function.
-- -------------------------------------------------------------
create or replace function public.disparar_processar_fila()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_secret text;
  v_pendentes int;
begin
  select count(*) into v_pendentes
    from public.whatsapp_fila
    where status = 'pendente' and agendado_para <= now();
  if v_pendentes = 0 then
    return; -- nada a fazer; não desperdiça invocação da edge
  end if;

  select decrypted_secret into v_secret
    from vault.decrypted_secrets where name = 'fila_cron_secret';

  perform net.http_post(
    url := 'https://yasfxwqomvhmxxqnunat.functions.supabase.co/processar-whatsapp-fila',
    headers := jsonb_build_object(
      'Content-Type', 'application/json',
      'x-internal-secret', coalesce(v_secret, '')
    ),
    body := '{}'::jsonb
  );
end;
$$;

-- (Re)agenda o job a cada minuto, de forma idempotente.
do $$
begin
  if exists (select 1 from cron.job where jobname = 'processar-whatsapp-fila') then
    perform cron.unschedule('processar-whatsapp-fila');
  end if;
  perform cron.schedule(
    'processar-whatsapp-fila',
    '* * * * *',
    $cron$select public.disparar_processar_fila()$cron$
  );
end;
$$;

-- -------------------------------------------------------------
-- HARDENING: estas funções SECURITY DEFINER NÃO podem ser chamadas
-- via API pública (anon/authenticated). Só o pg_cron (roda como owner)
-- e a edge function (service_role) precisam executá-las.
-- -------------------------------------------------------------
revoke execute on function public.disparar_processar_fila() from public, anon, authenticated;
revoke execute on function public.reservar_proximo_fila() from public, anon, authenticated;
revoke execute on function public.recontar_mensagem(uuid) from public, anon, authenticated;

-- A edge `processar-whatsapp-fila` chama estas duas via service_role.
grant execute on function public.reservar_proximo_fila() to service_role;
grant execute on function public.recontar_mensagem(uuid) to service_role;
-- disparar_processar_fila é chamada só pelo cron (owner), não precisa de grant.
