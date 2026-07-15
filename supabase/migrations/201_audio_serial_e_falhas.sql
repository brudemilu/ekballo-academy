-- Áudio sob demanda: geração SERIAL (um livro por vez) + tolerância a falhas.
-- O TTS grátis (Edge) bloqueia o IP quando gera muitos audiolivros grandes em
-- paralelo. Modo gentil: um livro por vez, um pedaço por vez (ver lib/audio-leitura
-- e app/api/cron/gerar-audio-tick), e não erra o livro na 1ª falha (retenta).

-- Contador de falhas consecutivas por curso (zera a cada capítulo gerado;
-- o worker só marca 'erro' após MAX_FALHAS).
alter table public.cursos add column if not exists audio_falhas int not null default 0;

-- RPC de reivindicação SERIAL: só pega um curso se NENHUM outro está sendo
-- gerado agora (not exists lock ativo) — limita as conexões simultâneas ao TTS.
-- OBS: reiniciar o serviço rest do PostgREST após criar/alterar (senão PGRST202).
create or replace function public.reclamar_curso_audio()
returns table(id uuid, slug text)
language sql security definer set search_path to 'public' as $fn$
  update public.cursos c
  set audio_status = 'gerando', audio_lock_ate = now() + interval '3 minutes'
  where c.id = (
    select x.id from public.cursos x
    where x.audio_status in ('pendente','gerando')
      and (x.audio_lock_ate is null or x.audio_lock_ate < now())
      and not exists (select 1 from public.cursos y where y.audio_lock_ate > now())
    order by x.audio_pedido_em
    limit 1
    for update skip locked
  )
  returning c.id, c.slug;
$fn$;
