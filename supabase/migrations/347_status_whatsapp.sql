-- =============================================================
-- 347 · Instagram → Status do WhatsApp, automático (issue #258)
-- =============================================================
-- Todo Reel publicado no Instagram vira um Status com o link; todo story é
-- repetido no Status. Vale para o que sai pelo sistema E para o que o pastor
-- publica direto no aplicativo: a rotina lê o perfil de 5 em 5 minutos.

-- Liga/desliga. `ativado_em` é a linha de corte: só vai para o Status o que
-- foi publicado DEPOIS de ligar — sem isso, a primeira rodada despejaria os
-- posts antigos no Status de todos os contatos.
create table if not exists public.whatsapp_status_config (
  id            int primary key default 1 check (id = 1),
  ativo         boolean     not null default true,
  ativado_em    timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);
insert into public.whatsapp_status_config (id) values (1) on conflict (id) do nothing;

-- O que já foi mandado. A chave é o id da mídia no Instagram: é ela que impede
-- o mesmo Reel de ir duas vezes para o Status, mesmo com duas rodadas juntas.
create table if not exists public.whatsapp_status_enviados (
  ig_media_id text primary key,
  tipo        text        not null check (tipo in ('reel', 'story')),
  permalink   text,
  ok          boolean     not null default false,
  erro        text,
  criado_em   timestamptz not null default now()
);

alter table public.whatsapp_status_config   enable row level security;
alter table public.whatsapp_status_enviados enable row level security;

drop policy if exists "admin full access status config" on public.whatsapp_status_config;
create policy "admin full access status config"
  on public.whatsapp_status_config
  for all to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

drop policy if exists "admin le status enviados" on public.whatsapp_status_enviados;
create policy "admin le status enviados"
  on public.whatsapp_status_enviados
  for select to authenticated
  using (public.is_admin(auth.uid()));

-- Cron ----------------------------------------------------------
create or replace function public.disparar_instagram_para_status()
returns void
language plpgsql
security definer
set search_path to 'public'
as $fn$
declare v_secret text;
begin
  -- Desligado: nem chama o app.
  if not exists (select 1 from public.whatsapp_status_config where id = 1 and ativo) then
    return;
  end if;
  select decrypted_secret into v_secret
    from vault.decrypted_secrets where name = 'agenda_sync_secret';
  if v_secret is null then return; end if;
  perform net.http_get(
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/instagram-para-status?secret=' || v_secret,
    timeout_milliseconds := 50000
  );
end;
$fn$;

revoke all on function public.disparar_instagram_para_status() from public, anon, authenticated;

select cron.unschedule('instagram-para-status')
 where exists (select 1 from cron.job where jobname = 'instagram-para-status');

-- De 5 em 5 minutos, 2 minutos depois dos agendados: o Reel das 19:00 leva
-- um ou dois minutos para o Instagram processar, e aparece no Status às 19:02.
select cron.schedule(
  'instagram-para-status',
  '2-57/5 * * * *',
  'select public.disparar_instagram_para_status()'
);
