-- =============================================================
-- Agendamento de envios (todos os canais, todos os destinos).
--
-- O admin agenda uma mensagem para uma data/hora futura; ela fica em
-- `mensagens_agendadas` (status pendente). Um pg_cron a cada minuto chama
-- a rota /api/admin/agendadas-tick, que no horário dispara o envio normal
-- (reusa /api/admin/enviar-mensagem para broadcast e /api/admin/whatsapp
-- para envio direto a grupo/número). Assim vale para Email + WhatsApp + Push.
--
-- Agendar é o próprio admin definindo QUANDO enviar = autorização explícita
-- (respeita a regra de "confirmar antes de enviar").
-- =============================================================

create extension if not exists pg_cron;
create extension if not exists pg_net;

create table if not exists public.mensagens_agendadas (
  id uuid primary key default gen_random_uuid(),
  autor_id uuid references public.profiles(id) on delete set null,
  tipo text not null check (tipo in ('broadcast','direto')),
  descricao text,             -- resumo legível para a UI (ex.: "Curso X · Email,WhatsApp")
  payload jsonb not null,     -- corpo exato a reenviar para a rota de envio
  agendar_para timestamptz not null,
  status text not null default 'pendente'
    check (status in ('pendente','enviando','enviada','erro','cancelada')),
  resultado jsonb,
  erro text,
  criado_em timestamptz not null default now(),
  processada_em timestamptz
);
create index if not exists mensagens_agendadas_prox_idx
  on public.mensagens_agendadas (status, agendar_para);

alter table public.mensagens_agendadas enable row level security;
drop policy if exists "mensagens_agendadas_admin" on public.mensagens_agendadas;
create policy "mensagens_agendadas_admin" on public.mensagens_agendadas for all
  to authenticated
  using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true))
  with check (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true));

-- Cron → tick na Vercel. O segredo `agendadas_cron_secret` é gravado no Vault
-- FORA desta migration (não vaza no git) e o MESMO valor vai no env
-- AGENDADAS_CRON_SECRET da Vercel.
create or replace function public.disparar_agendadas()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_secret text;
  v_n int;
begin
  select count(*) into v_n from public.mensagens_agendadas
    where status='pendente' and agendar_para <= now();
  if v_n = 0 then return; end if;

  select decrypted_secret into v_secret
    from vault.decrypted_secrets where name='agendadas_cron_secret';

  perform net.http_post(
    url := 'https://ekballo-academy.vercel.app/api/admin/agendadas-tick',
    headers := jsonb_build_object(
      'Content-Type','application/json',
      'x-internal-secret', coalesce(v_secret,'')
    ),
    body := '{}'::jsonb
  );
end;
$$;

revoke execute on function public.disparar_agendadas() from public, anon, authenticated;

do $$
begin
  if exists (select 1 from cron.job where jobname='disparar-agendadas') then
    perform cron.unschedule('disparar-agendadas');
  end if;
  perform cron.schedule('disparar-agendadas','* * * * *',
    $cron$select public.disparar_agendadas()$cron$);
end;
$$;
