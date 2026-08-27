-- O Evangelho Segundo os Apóstolos — repara os títulos truncados das mesas.
--
-- O texto do livro está íntegro (561 mil caracteres contra 581 mil do miolo do
-- PDF, ~97%; a diferença é cabeçalho e numeração de página). O defeito está nos
-- títulos: no PDF cada título de capítulo ocupa DUAS linhas, e a carga original
-- gravou só a de baixo. Sobraram títulos que são metade de frase, alguns com
-- dano de OCR (zero no lugar da letra O).
--
-- Cada reparo aqui tem âncora dupla: o fragmento em caixa alta encontrado na
-- página do capítulo E a entrada correspondente do sumário. Onde os dois sinais
-- não concordaram, a mesa fica intacta — melhor um título truncado que um
-- título inventado. Ficam sem reparo as mesas 3 e 9 (âncora ambígua) e as 1, 2,
-- 6 e 14, cujos títulos já estão corretos.
--
-- Não destrutiva: só UPDATE de titulo.

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'evangelho-segundo-os-apostolos';
  if v_curso_id is null then
    raise exception 'curso nao encontrado';
  end if;

  update public.aulas set titulo = $t$Sem fé é impossível agradá-lo$t$
  where curso_id = v_curso_id and ordem = 4;
  update public.aulas set titulo = $t$Graça barata?$t$
  where curso_id = v_curso_id and ordem = 5;
  update public.aulas set titulo = $t$Livres do pecado, escravos da justiça$t$
  where curso_id = v_curso_id and ordem = 7;
  update public.aulas set titulo = $t$A luta mortal com o pecado$t$
  where curso_id = v_curso_id and ordem = 8;
  update public.aulas set titulo = $t$Uma antecipação da glória$t$
  where curso_id = v_curso_id and ordem = 10;
  update public.aulas set titulo = $t$Guardados pelo poder de Deus$t$
  where curso_id = v_curso_id and ordem = 11;
  update public.aulas set titulo = $t$Que devo fazer para ser salvo?$t$
  where curso_id = v_curso_id and ordem = 12;
  update public.aulas set titulo = $t$Comparando os três pontos de vista$t$
  where curso_id = v_curso_id and ordem = 13;
end
$migration$;
