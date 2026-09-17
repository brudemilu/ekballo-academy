-- 308_perspectivas_slides_aulas.sql
-- Liga as apresentações de aula das Lições 1, 2 e 3 aos respectivos guias de
-- estudo, como material anexo.
--
-- São os slides usados para ENSINAR a lição — material de apoio do encontro,
-- não leitura do livro. Por isso entram como `material_url` do guia, e não como
-- aula própria: quem abre a mesa do guia encontra o anexo ali, no contexto.
--
-- Os arquivos ficam no bucket privado `materiais-cursos`, em perspectivas/, e
-- a plataforma os serve por link assinado temporário (lib/db.ts:getMaterialUrl).
-- Nada fica exposto publicamente.

begin;

update aulas set material_url = 'perspectivas/slides-licao-01.pdf'
where curso_id = (select id from cursos where slug = 'perspectivas')
  and titulo like 'Lição 1 · Guia%';

update aulas set material_url = 'perspectivas/slides-licao-02.pdf'
where curso_id = (select id from cursos where slug = 'perspectivas')
  and titulo like 'Lição 2 · Guia%';

update aulas set material_url = 'perspectivas/slides-licao-03.pdf'
where curso_id = (select id from cursos where slug = 'perspectivas')
  and titulo like 'Lição 3 · Guia%';

commit;
