-- 312_perspectivas_slides_como_item.sql
-- Os slides das aulas 1, 2 e 3 deixam de ser anexo escondido dentro do guia e
-- passam a ser ITEM PRÓPRIO na lista da lição, logo abaixo do guia.
--
-- Como anexo eles não eram encontrados: ficavam dentro da mesa do guia, e quem
-- percorre o sumário do curso não tinha como saber que existiam. Bruno pediu que
-- aparecessem na lista "como se fosse um capítulo" — não são leitura do livro,
-- mas são material da lição e precisam estar visíveis onde se escolhe o que abrir.
--
-- O material_url sai do guia e vem para o item novo, para não haver o mesmo
-- arquivo pendurado em dois lugares.
--
-- O título leva "· Slides —", que o sumário trata como subitem da lição, do
-- mesmo modo que "· Leitura —".

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';

  -- Lição 1: abre a posição 2
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 2;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
  insert into aulas (curso_id, titulo, conteudo, ordem, material_url)
  select cid,
         'Lição 1 · Slides — Deus é um Deus Missionário',
         'Apresentação usada para ensinar esta lição. Abra o anexo acima para projetar ou acompanhar.'
         || chr(10) || chr(10) ||
         'Não é leitura do livro: é o material do encontro, na mesma sequência do guia de estudo.',
         2,
         'perspectivas/slides-licao-01.pdf';

  -- Lição 2: o guia foi para 10; abre a 11
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 11;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
  insert into aulas (curso_id, titulo, conteudo, ordem, material_url)
  select cid,
         'Lição 2 · Slides — A história de Sua glória',
         'Apresentação usada para ensinar esta lição. Abra o anexo acima para projetar ou acompanhar.'
         || chr(10) || chr(10) ||
         'Não é leitura do livro: é o material do encontro, na mesma sequência do guia de estudo.',
         11,
         'perspectivas/slides-licao-02.pdf';

  -- Lição 3: o guia foi para 19; abre a 20
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 20;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
  insert into aulas (curso_id, titulo, conteudo, ordem, material_url)
  select cid,
         'Lição 3 · Slides — O Messias para o mundo',
         'Apresentação usada para ensinar esta lição. Abra o anexo acima para projetar ou acompanhar.'
         || chr(10) || chr(10) ||
         'Não é leitura do livro: é o material do encontro, na mesma sequência do guia de estudo.',
         20,
         'perspectivas/slides-licao-03.pdf';

  -- o arquivo agora mora no item próprio; sai do guia
  update aulas set material_url = null
  where curso_id = cid and titulo like 'Lição % · Guia de estudo%';
end $$;

commit;
