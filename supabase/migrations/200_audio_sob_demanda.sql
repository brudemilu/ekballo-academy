-- Áudio de leitura sob demanda (solicitado pelo master).
-- Campos de status por curso + limpeza dos caminhos órfãos (os arquivos de
-- áudio antigos se perderam na migração pro Contabo; não serão recuperados —
-- o áudio passa a ser gerado sob demanda, só nos livros solicitados).

alter table public.cursos
  add column if not exists audio_status text not null default 'nenhum',
  add column if not exists audio_progresso int not null default 0,
  add column if not exists audio_total int not null default 0,
  add column if not exists audio_pedido_em timestamptz,
  add column if not exists audio_pronto_em timestamptz,
  add column if not exists audio_lock_ate timestamptz;

comment on column public.cursos.audio_status is
  'nenhum | pendente | gerando | pronto | erro — geração de áudio de leitura sob demanda';

-- Zera os caminhos de leitura órfãos (arquivos perdidos na migração).
update public.aulas set audio_leitura_url = null where audio_leitura_url is not null;

-- Reivindicação atômica de UM curso pro worker (FOR UPDATE SKIP LOCKED) — evita
-- ticks concorrentes gerando a mesma obra. Chamada via rpc pelo worker.
-- OBS: após criar/alterar, recarregar o schema do PostgREST (reiniciar o
-- serviço rest) senão a rpc dá PGRST202 "function not found".
create or replace function public.reclamar_curso_audio()
returns table(id uuid, slug text)
language sql security definer set search_path to 'public' as $fn$
  update public.cursos c
  set audio_status = 'gerando', audio_lock_ate = now() + interval '3 minutes'
  where c.id = (
    select x.id from public.cursos x
    where x.audio_status in ('pendente','gerando')
      and (x.audio_lock_ate is null or x.audio_lock_ate < now())
    order by x.audio_pedido_em
    limit 1
    for update skip locked
  )
  returning c.id, c.slug;
$fn$;

-- Cron: dispara o worker HTTP 1x/min quando há geração pendente (lê o segredo
-- do vault, mesmo padrão do lembrete). Ver também app/api/cron/gerar-audio-tick.
create or replace function public.disparar_gerar_audio()
returns void language plpgsql security definer set search_path to 'public' as $fn$
declare v_secret text; v_pend int;
begin
  select count(*) into v_pend from public.cursos where audio_status in ('pendente','gerando');
  if v_pend = 0 then return; end if;
  select decrypted_secret into v_secret from vault.decrypted_secrets where name = 'agenda_sync_secret';
  if v_secret is null then return; end if;
  perform net.http_get(
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/gerar-audio-tick?secret=' || v_secret,
    timeout_milliseconds := 55000
  );
end;
$fn$;

-- select cron.schedule('gerar-audio-tick', '* * * * *', 'select public.disparar_gerar_audio()');
