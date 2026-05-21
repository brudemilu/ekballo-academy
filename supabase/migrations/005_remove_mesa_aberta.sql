-- =============================================================
-- Remove o curso "Mesa Aberta" (seed original da 001).
-- Substituído pelo curso "Ego Transformado" (Keller) como ponto de partida.
-- Deleta em ordem: alternativas → respostas → atividades → progresso → matriculas → aulas → curso.
-- (FKs com ON DELETE CASCADE existem, mas os DELETEs explícitos deixam o efeito legível.)
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'mesa-aberta';
  if v_curso_id is null then
    raise notice 'Curso mesa-aberta já não existe — nada a fazer.';
    return;
  end if;

  delete from public.alternativas alt
    using public.atividades atv, public.aulas a
    where alt.atividade_id = atv.id and atv.aula_id = a.id and a.curso_id = v_curso_id;

  delete from public.respostas r
    using public.atividades atv, public.aulas a
    where r.atividade_id = atv.id and atv.aula_id = a.id and a.curso_id = v_curso_id;

  delete from public.atividades atv
    using public.aulas a
    where atv.aula_id = a.id and a.curso_id = v_curso_id;

  delete from public.progresso p
    using public.aulas a
    where p.aula_id = a.id and a.curso_id = v_curso_id;

  delete from public.matriculas where curso_id = v_curso_id;

  delete from public.aulas where curso_id = v_curso_id;

  delete from public.cursos where id = v_curso_id;
end
$migration$;
