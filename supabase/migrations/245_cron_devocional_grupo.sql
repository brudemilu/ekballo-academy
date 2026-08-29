-- =============================================================
-- DEVOCIONAL DO DIA NO GRUPO DO WHATSAPP · 6h da manhã
--
-- Chama GET /api/cron/devocional-grupo às 09:00 UTC = 06:00 em São
-- Paulo (o Brasil não tem mais horário de verão desde 2019, então a
-- conversão é fixa). A rota busca o devocional do dia — o postado
-- para a data, ou o do ciclo perpétuo de 365 — e manda no grupo
-- configurado em DEVOCIONAL_GRUPO_JID.
--
-- Mesmo padrão dos outros crons do box: pg_cron + net.http_get, com
-- o segredo lido do vault (nunca escrito na definição da função).
-- =============================================================

-- Trava de "uma vez por dia". A rota reserva o par (data, destino)
-- ANTES de enviar; a chave primária barra o segundo disparo, venha
-- ele de retry do cron, reboot do box ou clique manual. Sem policy
-- de RLS: só o service_role (que a bypassa) escreve aqui.
create table if not exists public.devocional_grupo_envios (
  data date not null,
  destino text not null,
  enviado_em timestamptz not null default now(),
  primary key (data, destino)
);

alter table public.devocional_grupo_envios enable row level security;

comment on table public.devocional_grupo_envios is
  'Registro de qual devocional já foi mandado em qual grupo, por dia. Evita envio duplicado.';

create or replace function public.disparar_devocional_grupo()
returns void
language plpgsql
security definer
set search_path to 'public'
as $fn$
declare v_secret text;
begin
  select decrypted_secret into v_secret
    from vault.decrypted_secrets where name = 'agenda_sync_secret';
  if v_secret is null then return; end if; -- ainda não configurado
  perform net.http_get(
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/devocional-grupo?secret=' || v_secret
  );
end;
$fn$;

-- Reagenda de forma idempotente.
select cron.unschedule('devocional-grupo-diario')
 where exists (select 1 from cron.job where jobname = 'devocional-grupo-diario');

select cron.schedule(
  'devocional-grupo-diario',
  '0 9 * * *',
  'select public.disparar_devocional_grupo()'
);
