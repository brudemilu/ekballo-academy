-- O Deus que destrói sonhos — devolve os cartões de abertura de capítulo.
--
-- O livro abre cada seção com um cartão tipográfico (display branco sobre
-- cinza-escuro) que é a identidade visual da edição. Nenhum deles tinha sido
-- carregado. O texto do livro, esse já estava íntegro: conferido seção a seção
-- contra o PDF, todas entre 98% e 100% (a diferença de 19% que aparecia na
-- varredura do acervo era artefato de contar capa, créditos, referências e
-- "sobre o autor" no denominador).
--
-- O livro não tem tabela: as 25 que o detector do PyMuPDF acusou são prosa
-- justificada lida como colunas.
--
-- Idempotente: só insere onde ainda não há bloco [figura].

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'o-deus-que-destroi-sonhos';
  if v_curso_id is null then
    raise exception 'curso nao encontrado';
  end if;

  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa02.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 2
    and position('[figura]' in conteudo) = 0;
  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa03.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 3
    and position('[figura]' in conteudo) = 0;
  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa04.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 4
    and position('[figura]' in conteudo) = 0;
  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa05.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 5
    and position('[figura]' in conteudo) = 0;
  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa06.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 6
    and position('[figura]' in conteudo) = 0;
  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa07.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 7
    and position('[figura]' in conteudo) = 0;
  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa08.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 8
    and position('[figura]' in conteudo) = 0;
  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa09.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 9
    and position('[figura]' in conteudo) = 0;
  update public.aulas
  set conteudo = '[figura] /figuras/o-deus-que-destroi-sonhos/mesa10.jpg' || chr(10) || chr(10) || conteudo
  where curso_id = v_curso_id and ordem = 10
    and position('[figura]' in conteudo) = 0;
end
$migration$;
