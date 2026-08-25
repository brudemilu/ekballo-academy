-- Áudio sob demanda: lock longo + renovado (corrige a "morte" dos livros grandes).
--
-- Diagnóstico (24/08/2026): o lock de 3 minutos era MUITO menor que o tempo real
-- de um capítulo. Um capítulo de 35 mil caracteres vira ~30 pedaços sintetizados
-- em série (modo gentil) = 5-10 minutos. Aos 3 min o lock vencia, o tick seguinte
-- reivindicava o MESMO curso e começava a sintetizar o MESMO capítulo em paralelo.
-- Duas, três, quatro conexões simultâneas no Edge TTS → rate-limit → "Stream
-- closed before the synthesis completed" em TODAS → o capítulo nunca fechava →
-- audio_falhas subia até 20 → livro marcado 'erro'. Por isso só livros de
-- capítulos curtos chegavam a 'pronto'.
--
-- Agora: lock de 30 minutos, e o worker o RENOVA a cada minuto enquanto sintetiza
-- (ver app/api/cron/gerar-audio-tick). O worker sempre solta o lock ao terminar a
-- janela, ao concluir e ao falhar — lock órfão só sobra se o container morrer no
-- meio, e nesse caso destrava sozinho em 30 min.

create or replace function public.reclamar_curso_audio()
returns table(id uuid, slug text)
language sql security definer set search_path to 'public' as $fn$
  update public.cursos c
  set audio_status = 'gerando', audio_lock_ate = now() + interval '30 minutes'
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

-- Livros que morreram por causa do bug acima ficam com o contador zerado, pra
-- que o botão "Tentar gerar de novo" volte a funcionar de verdade (antes o
-- contador estourado matava o novo pedido na primeira falha). Continuam em
-- 'erro' — quem decide reenfileirar é o master, um de cada vez (a geração é
-- serial). O áudio já gerado é preservado: o worker só gera o que falta.
update public.cursos
set audio_falhas = 0, audio_lock_ate = null
where audio_status = 'erro';
