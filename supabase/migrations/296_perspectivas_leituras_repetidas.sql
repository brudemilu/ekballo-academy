-- 296_perspectivas_leituras_repetidas.sql
-- Leitura que dois guias pedem passa a existir DUAS VEZES, uma em cada lição,
-- em vez de morar numa lição só e a outra apontar para lá. Decisão do Bruno:
-- cada lição tem de se bastar, senão a mesa fica pela metade para quem está
-- percorrendo aquela lição.
--
-- Isto reverte a escolha da migration 294 quanto ao Winter cap. 34, que eu
-- tinha carregado uma vez só por achar que duplicar não ajudaria.
--
-- Dois casos entre o que já está carregado:
--   Winter cap. 34  — pedido pela Lição 4 (trecho) e pela Lição 5 (inteiro)
--   Adeney          — pedido pela Lição 2 e pela Lição 7
--
-- O conteúdo é copiado da aula existente, não retranscrito: mesma procedência,
-- mesmo texto. Quando as Lições 5 a 12 forem carregadas, os outros casos
-- (Guzman cap. 109, Parshall cap. 97, Willowbank cap. 70, McGavran cap. 43)
-- seguem esta mesma regra.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';

  -- Winter cap. 34 -> Lição 5, antes do Woodberry
  update aulas set ordem = ordem + 1000 where curso_id = cid and ordem >= 43;
  update aulas set ordem = ordem - 1000 + 1 where curso_id = cid and ordem >= 1000;

  insert into aulas (curso_id, titulo, conteudo, ordem)
  select cid,
         'Lição 5 · Leitura — Winter, cap. 34: As duas estruturas da missão redentora de Deus',
         conteudo, 43
  from aulas
  where curso_id = cid and titulo = 'Lição 4 · Leitura — Winter, cap. 34: As duas estruturas da missão redentora de Deus';

  -- Adeney -> Lição 7, logo depois do guia
  update aulas set ordem = ordem + 1000 where curso_id = cid and ordem >= 47;
  update aulas set ordem = ordem - 1000 + 1 where curso_id = cid and ordem >= 1000;

  insert into aulas (curso_id, titulo, conteudo, ordem)
  select cid,
         'Lição 7 · Leitura — Adeney: Deus é daltônico?',
         conteudo, 47
  from aulas
  where curso_id = cid and titulo = 'Lição 2 · Leitura — Adeney: Deus é daltônico?';
end $$;

commit;
