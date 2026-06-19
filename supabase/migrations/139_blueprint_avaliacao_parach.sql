-- =============================================================
-- O Blueprint de Parach — Apêndice A: Avaliação de Liderança Parach (aula 17).
-- Aula INTERATIVA: o conteudo é um sentinel ([[AVALIACAO_PARACH]]) e a página
-- da aula renderiza o componente <AvaliacaoParach/> (40 perguntas, pontuação
-- automática, dom + índice de florescimento + plano). A atividade abaixo guarda
-- o resultado/plano do aluno (o líder lê pela devolutiva normal). Idempotente.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'blueprint-parach';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values ('blueprint-parach','O Blueprint de Parach','Estudo guiado a partir de O Blueprint de Parach, de Dr. Richard William. O livro confronta a "epidemia do esforço" no ministério e propõe a Grande Inversão: liderar a partir do descanso, e não em direção a ele — do transbordamento, e não da exaustão. Cada trecho traz o texto na íntegra e, ao final, perguntas de reflexão para você examinar de onde vem a energia da sua liderança. Os capítulos vão sendo liberados conforme a ordem de leitura do livro.','/api/og/curso/blueprint-parach', false, 0, v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice A — Avaliação de Liderança Parach$t$, 17,
$conteudo$[[AVALIACAO_PARACH]]

Avaliação interativa de 40 perguntas — responda diretamente no app para descobrir seu dom principal e seu Índice de Florescimento.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Resultado da Avaliação de Liderança Parach e seu Plano de Restauração (preenchido no app — começar, parar e quem o manterá responsável).$p$, 'reflexao', null);
  end if;

end $migration$;
