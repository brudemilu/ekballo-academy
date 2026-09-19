-- 314_perspectivas_larson_paginas.sql
-- O guia da Lição 9 cita o capítulo 63 (Larson) como "p. 4665-472". Não é erro
-- do impresso: fui conferir na imagem do guia e o livro traz "p. 466-472" — o
-- OCR duplicou o 6. Conserto de extração, portanto, e não correção do original.
--
-- Registro do meu erro: ao listar o que faltava da Lição 9 eu disse que o certo
-- seria "465-472", por dedução. Estava errado também; o recorte da linha mostrou
-- 466. Deduzir número de página não substitui olhar a página.

update aulas a
   set conteudo = replace(conteudo, 'cap. 63, p. 4665-472', 'cap. 63, p. 466-472')
  from cursos c
 where c.id = a.curso_id
   and c.slug = 'perspectivas'
   and a.titulo like 'Lição 9 · Guia%'
   and a.conteudo like '%4665-472%';
