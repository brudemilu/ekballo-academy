-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- INTRODUÇÃO (aula ordem = 0 — aparece antes do Capítulo 1)
--
-- Localiza o curso já criado pela migration 058 (slug
-- 'o-desafio-de-todo-lider') e insere a Introdução como aula
-- de ordem 0. A Introdução não tem "Desafio Prático" no livro,
-- portanto esta aula tem apenas o texto, sem atividades.
--
-- Idempotente: pode ser reaplicada sem duplicar a aula.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
begin
  select id into v_curso_id from public.cursos
  where slug = 'o-desafio-de-todo-lider';

  if v_curso_id is null then
    raise exception 'Curso o-desafio-de-todo-lider não encontrado. Aplique a migration 058 primeiro.';
  end if;

  -- ---------------------------------------------------------------
  -- Introdução
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 0;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Introdução',
      0,
$conteudo$Escrevi este livro para compartilhar o desafio que todo líder enfrenta: o de transformar uma visão, dada por Deus, em ações concretas e eficientes. Ao longo da nossa jornada como líderes, o objetivo não é apenas alcançar resultados, mas construir uma jornada marcada pela excelência em todas as áreas da vida e do ministério.

Muitas igrejas seguem o modelo de perpetuação institucional, segundo o qual o mais importante não é o que se pode fazer para ver a expansão do Reino de Deus, mas, sim, a sobrevivência da instituição. O processo de institucionalização é algo inevitável, e traz consequências positivas — como continuidade e estabilidade — mas, também, negativas.

Uma igreja normalmente nasce como resultado da visão dos fundadores. Com o passar dos anos, ela é substituída pela necessidade de manutenção do que surgiu como resultado da visão. O fogo do entusiasmo com a visão original cede lugar ao medo de perder o que já se alcançou. Com isso, o desejo de avanço dá espaço à defesa da instituição.

Neste processo, os meios de seleção e desenvolvimento da liderança também mudam. Se na fase inicial do processo de institucionalização a questão é se os possíveis líderes se identificam com a visão que originou a instituição, com o passar do tempo, o critério muda e o foco passa a ser no que a pessoa pode fazer para manter a unidade e a estabilidade do que já existe.

Com relação aos membros, os critérios para escolha de líderes também muda. Na fase inicial, eles costumam ser baseados no entusiasmo e nas possibilidades que os candidatos têm para levar adiante os ideais do grupo. Com o tempo, a escolha passa a ser escorada em quem pode conduzir a organização a um reconhecimento público maior em termos de prestígio e status.

Surge, então, a pergunta: o que podemos fazer para revitalizar uma igreja que estagnou em decorrência de sua institucionalização? Uma resposta completa envolve muitos aspectos e perspectivas. Mas, no centro do processo, sempre se encontrará a seleção e o treinamento de uma nova geração de líderes comprometidos com Deus e com a visão e o entusiasmo da fé cristã.

Este livro tem como objetivo ajudar líderes a entenderem que o alicerce inabalável e insubstituível da liderança cristã é o caráter do líder. Afinal, é fundamental liderar a partir de quem você é, e essa é a base de sua autoridade.

É minha oração e meu mais profundo desejo que este livro, ao abordar a formação espiritual de líderes, torne-se útil para muitos homens e mulheres que desejam servir a Deus com a dedicação e profundidade — implícitas na exortação de Paulo a Timóteo: "Procura apresentar-te a Deus aprovado, como obreiro que não tem de que se envergonhar, que maneja bem a palavra da verdade" (2Tm 2.15).$conteudo$
    )
    returning id into v_aula_id;
  end if;
end
$migration$;
