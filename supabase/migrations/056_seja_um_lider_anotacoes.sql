-- =============================================================
-- Campo de ANOTAÇÕES por capítulo na temática "Seja um Líder de Verdade".
--
-- O discípulo registra anotações livres sobre cada capítulo; ficam salvas
-- na tabela `respostas` (igual às reflexões) e o líder pode ler e comentar.
--
-- Implementado como uma atividade tipo `reflexao` com `razao = 'anotacao'`:
-- essa flag faz a UI (AtividadeForm/variante "anotacao" + página da aula)
-- renderizar como "Anotações do capítulo" — sem rótulo de obrigatória e sem
-- texto de "necessária para liberar" —, reusando todo o fluxo de
-- resposta/devolutiva sem precisar alterar o enum CHECK de `atividades.tipo`.
--
-- Uma anotação por capítulo (aulas com ordem >= 1; a aula 0 "Apresentação"
-- não recebe). Idempotente: não duplica se já existir.
-- =============================================================

do $anotacoes$
declare
  v_curso uuid;
begin
  select id into v_curso from public.cursos where slug = 'seja-um-lider-de-verdade';
  if v_curso is null then
    raise notice 'Curso seja-um-lider-de-verdade não encontrado — nada a fazer.';
    return;
  end if;

  insert into public.atividades (aula_id, pergunta, ordem, tipo, razao)
  select a.id, 'Anotações sobre o capítulo', 1, 'reflexao', 'anotacao'
  from public.aulas a
  where a.curso_id = v_curso
    and a.ordem >= 1
    and not exists (
      select 1 from public.atividades at
      where at.aula_id = a.id and at.razao = 'anotacao'
    );
end $anotacoes$;
