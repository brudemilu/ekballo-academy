-- 321_perspectivas_slides_licao8.sql
-- Os três decks da Lição 8, como três itens próprios na lista, logo abaixo do
-- guia (ordem 73).
--
-- POR QUE TRÊS ITENS, E NÃO UM SÓ. Na Lição 6 os três arquivos viraram dois:
-- lá, um deles era imagem solta sem título e outro era documento A4, de formato
-- diferente. Aqui os três são apresentações próprias, no mesmo formato 4:3, cada
-- uma com nome que diz do que trata — "Conceitos Básicos", "Barreiras Culturais"
-- e "O Ritual do Corpo entre os Sonacirema". Juntar num PDF só enterraria esses
-- títulos e obrigaria quem fosse projetar os 7 slides de conceitos a passar
-- pelos 36 do estudo de caso.
--
-- A ordem é a didática, e não a alfabética: conceitos, depois barreiras, depois
-- o estudo de caso. É o mesmo caminho do guia, que abre com o Kwast
-- ("Entendendo o que é cultura") antes do Hiebert, que é equívoco transcultural.
--
-- Os três têm camada de texto, mas entram no padrão de slides (nota curta no
-- corpo + PDF anexado), como nas Lições 1, 2, 3, 5 e 6. Material de projeção
-- fica como anexo; o que virou texto no corpo, na Lição 6, era documento de mão.

begin;

do $$
declare cid uuid; nota text;
begin
  select id into cid from cursos where slug = 'perspectivas';
  nota := 'Apresentação usada para ensinar esta lição. Abra o anexo acima para projetar ou acompanhar.'
          || chr(10) || chr(10) ||
          'Não é leitura do livro: é o material do encontro, na mesma sequência do guia de estudo.';

  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 74;
  update aulas set ordem = ordem - 10000 + 3 where curso_id = cid and ordem >= 10000;

  insert into aulas (curso_id, titulo, conteudo, ordem, material_url) values
    (cid, 'Lição 8 · Slides — Antropologia cultural: conceitos básicos', nota, 74,
     'perspectivas/slides-licao-08-conceitos.pdf'),
    (cid, 'Lição 8 · Slides — Barreiras culturais', nota, 75,
     'perspectivas/slides-licao-08-barreiras.pdf'),
    (cid, 'Lição 8 · Slides — O ritual do corpo entre os Sonacirema', nota, 76,
     'perspectivas/slides-licao-08-sonacirema.pdf');
end $$;

commit;
