begin;

do $$
declare
  function_ddl text;
begin
  select pg_get_functiondef('public.enviar_email(text,text,jsonb)'::regprocedure)
    into function_ddl;
  execute replace(
    function_ddl,
    'https://yasfxwqomvhmxxqnunat.functions.supabase.co/enviar-email',
    'http://functions:9000/enviar-email'
  );

  select pg_get_functiondef('public.disparar_processar_fila()'::regprocedure)
    into function_ddl;
  execute replace(
    function_ddl,
    'https://yasfxwqomvhmxxqnunat.functions.supabase.co/processar-whatsapp-fila',
    'http://functions:9000/processar-whatsapp-fila'
  );
end;
$$;

do $$
declare
  job_name text;
begin
  foreach job_name in array array[
    'lembrete-inatividade-diario',
    'processar-whatsapp-fila',
    'detectar-campanhas',
    'detectar-atividades-pendentes',
    'disparar-agendadas'
  ] loop
    if exists (select 1 from cron.job where jobname = job_name) then
      perform cron.unschedule(job_name);
    end if;
  end loop;

  perform cron.schedule(
    'lembrete-inatividade-diario',
    '0 10 * * *',
    $job$select public.cron_lembrete_inatividade()$job$
  );
  perform cron.schedule(
    'processar-whatsapp-fila',
    '* * * * *',
    $job$select public.disparar_processar_fila()$job$
  );
  perform cron.schedule(
    'detectar-campanhas',
    '13 12 * * *',
    $job$select public.detectar_campanhas()$job$
  );
  perform cron.schedule(
    'detectar-atividades-pendentes',
    '18 12 * * *',
    $job$select public.detectar_atividades_pendentes()$job$
  );
  perform cron.schedule(
    'disparar-agendadas',
    '* * * * *',
    $job$select public.disparar_agendadas()$job$
  );
end;
$$;

commit;
