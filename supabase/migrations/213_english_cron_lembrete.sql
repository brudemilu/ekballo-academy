-- =============================================================
-- EKBALLO ENGLISH · Agendamento do lembrete diário
--
-- Chama GET /api/cron/english-lembrete às 22:00 UTC = 19:00 em
-- São Paulo. O horário importa: início da noite é quando quem
-- ainda não praticou percebe que o dia vai acabar, e ainda dá
-- tempo de fazer a lição antes de o streak virar.
--
-- A rota decide sozinha quem recebe (sequência em risco, sumidos
-- de 3 a 14 dias, e convite semanal a quem nunca começou). Quem
-- já praticou hoje nunca recebe nada.
--
-- Mesmo padrão dos outros crons do box: pg_cron + net.http_get,
-- com o segredo lido do vault (nunca escrito na definição).
-- =============================================================

create or replace function public.disparar_english_lembrete()
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
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/english-lembrete?secret=' || v_secret
  );
end;
$fn$;

-- Reagenda de forma idempotente.
select cron.unschedule('english-lembrete-diario')
 where exists (select 1 from cron.job where jobname = 'english-lembrete-diario');

select cron.schedule(
  'english-lembrete-diario',
  '0 22 * * *',
  'select public.disparar_english_lembrete()'
);
