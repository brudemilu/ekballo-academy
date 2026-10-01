-- 319_perspectivas_slides_licao5.sql
-- Os slides da Lição 5, no mesmo padrão das Lições 1 a 3: item próprio na lista,
-- logo abaixo do guia, com o PDF como anexo.
--
-- O arquivo foi para o bucket privado em perspectivas/slides-licao-05.pdf
-- (13.093.143 bytes, 105 páginas em 16:9). O acesso continua por URL assinada,
-- como nos demais materiais.
--
-- CONFERIDO QUE É MESMO A LIÇÃO 5: a capa do arquivo é a genérica do curso e não
-- diz a lição, mas a página 3 traz "LIÇÃO 05" e a 4, "A EXPANSÃO DO MOVIMENTO
-- CRISTÃO MUNDIAL" — exatamente o título do guia que está no ar.
--
-- Pulamos a Lição 4: os slides dela ainda não vieram, e o nome do arquivo no
-- bucket segue o número da lição, não a sequência de upload.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';

  -- o guia da Lição 5 está na ordem 44; abre a 45
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 45;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;

  insert into aulas (curso_id, titulo, conteudo, ordem, material_url)
  select cid,
         'Lição 5 · Slides — A expansão do movimento cristão mundial',
         'Apresentação usada para ensinar esta lição. Abra o anexo acima para projetar ou acompanhar.'
         || chr(10) || chr(10) ||
         'Não é leitura do livro: é o material do encontro, na mesma sequência do guia de estudo.',
         45,
         'perspectivas/slides-licao-05.pdf';
end $$;

commit;
