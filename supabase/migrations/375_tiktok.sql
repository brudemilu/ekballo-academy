-- =============================================================
-- 375 · Instagram → TikTok (issue #273)
-- =============================================================
-- Todo Reel que sai no Instagram da conta principal vai também para o TikTok:
-- para os rascunhos (o pastor confirma no celular) ou publicado direto. A
-- rotina lê o perfil de 5 em 5 minutos, como o Instagram → Status (347).

-- Liga/desliga e modo. `ativado_em` é a linha de corte: só vai o que foi
-- publicado DEPOIS de ligar — sem isso, a primeira rodada mandaria os Reels
-- antigos todos de uma vez.
create table if not exists public.tiktok_config (
  conta_id      uuid primary key references public.instagram_contas (id) on delete cascade,
  ativo         boolean     not null default false,
  modo          text        not null default 'rascunho' check (modo in ('rascunho', 'direto')),
  ativado_em    timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

-- A autorização da conta do TikTok. Sem nenhuma política de acesso: só a
-- chave de serviço lê, como instagram_contas_credenciais.
create table if not exists public.tiktok_credenciais (
  conta_id          uuid primary key references public.instagram_contas (id) on delete cascade,
  open_id           text        not null,
  nome              text,
  avatar_url        text,
  access_token      text        not null,
  refresh_token     text        not null,
  escopos           text,
  expira_em         timestamptz not null,
  refresh_expira_em timestamptz,
  conectado_em      timestamptz not null default now(),
  atualizado_em     timestamptz not null default now()
);

-- Cada Reel mandado. A chave é o id da mídia no Instagram: é ela que impede o
-- mesmo Reel de ir duas vezes, mesmo com duas rodadas ao mesmo tempo.
create table if not exists public.tiktok_envios (
  ig_media_id   text primary key,
  conta_id      uuid        not null references public.instagram_contas (id) on delete cascade,
  permalink     text,
  chamada       text,
  modo          text        not null check (modo in ('rascunho', 'direto')),
  publish_id    text,
  situacao      text        not null default 'enviando'
                check (situacao in ('enviando', 'processando', 'no_rascunho', 'publicado', 'erro')),
  privacidade   text,
  erro          text,
  criado_em     timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);
create index if not exists tiktok_envios_situacao_idx
  on public.tiktok_envios (situacao, criado_em desc);
create index if not exists tiktok_envios_conta_idx
  on public.tiktok_envios (conta_id);

alter table public.tiktok_config      enable row level security;
alter table public.tiktok_credenciais enable row level security;
alter table public.tiktok_envios      enable row level security;
revoke all on public.tiktok_credenciais from anon, authenticated;

drop policy if exists "admin full access tiktok config" on public.tiktok_config;
create policy "admin full access tiktok config"
  on public.tiktok_config
  for all to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

drop policy if exists "admin le e repete tiktok envios" on public.tiktok_envios;
create policy "admin le e repete tiktok envios"
  on public.tiktok_envios
  for select to authenticated
  using (public.is_admin(auth.uid()));

-- Apagar um envio que falhou é o "tentar de novo" do painel.
drop policy if exists "admin apaga tiktok envio com erro" on public.tiktok_envios;
create policy "admin apaga tiktok envio com erro"
  on public.tiktok_envios
  for delete to authenticated
  using (public.is_admin(auth.uid()) and situacao = 'erro');

-- Cron ----------------------------------------------------------
create or replace function public.disparar_instagram_para_tiktok()
returns void
language plpgsql
security definer
set search_path to 'public'
as $fn$
declare v_secret text;
begin
  -- Desligado: nem chama o app.
  if not exists (select 1 from public.tiktok_config where ativo) then
    return;
  end if;
  select decrypted_secret into v_secret
    from vault.decrypted_secrets where name = 'agenda_sync_secret';
  if v_secret is null then return; end if;
  perform net.http_get(
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/instagram-para-tiktok?secret=' || v_secret,
    timeout_milliseconds := 280000
  );
end;
$fn$;

revoke all on function public.disparar_instagram_para_tiktok() from public, anon, authenticated;

select cron.unschedule('instagram-para-tiktok')
 where exists (select 1 from cron.job where jobname = 'instagram-para-tiktok');

-- De 5 em 5 minutos, 4 minutos depois dos agendados: dá tempo do Instagram
-- terminar de processar o Reel e de ele aparecer na leitura do perfil.
select cron.schedule(
  'instagram-para-tiktok',
  '4-59/5 * * * *',
  'select public.disparar_instagram_para_tiktok()'
);
