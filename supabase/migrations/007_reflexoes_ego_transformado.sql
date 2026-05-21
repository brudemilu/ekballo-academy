-- =============================================================
-- Adiciona 2 perguntas de reflexão em cada uma das 4 aulas do curso
-- "Ego Transformado". Combinadas com as questões de múltipla escolha
-- já existentes (002 + 004), passam a ser obrigatórias para liberar
-- a próxima aula — regra implementada no app em lib/db.ts.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula1 uuid; v_aula2 uuid; v_aula3 uuid; v_aula4 uuid;
  v_next_aula1 int; v_next_aula2 int; v_next_aula3 int; v_next_aula4 int;
begin
  select id into v_curso_id from public.cursos where slug = 'ego-transformado-keller';
  if v_curso_id is null then
    raise exception 'Curso ego-transformado-keller não encontrado.';
  end if;

  select id into v_aula1 from public.aulas where curso_id = v_curso_id and ordem = 1;
  select id into v_aula2 from public.aulas where curso_id = v_curso_id and ordem = 2;
  select id into v_aula3 from public.aulas where curso_id = v_curso_id and ordem = 3;
  select id into v_aula4 from public.aulas where curso_id = v_curso_id and ordem = 4;

  -- Próxima ordem em cada aula (deixa as reflexões depois das MCs)
  select coalesce(max(ordem), 0) + 1 into v_next_aula1 from public.atividades where aula_id = v_aula1;
  select coalesce(max(ordem), 0) + 1 into v_next_aula2 from public.atividades where aula_id = v_aula2;
  select coalesce(max(ordem), 0) + 1 into v_next_aula3 from public.atividades where aula_id = v_aula3;
  select coalesce(max(ordem), 0) + 1 into v_next_aula4 from public.atividades where aula_id = v_aula4;

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  -- K1
  (v_aula1, v_next_aula1,     'Que pergunta este capítulo deixou no seu coração?', 'reflexao', null),
  (v_aula1, v_next_aula1 + 1, 'Onde você tem buscado se sentir alguém de valor?',  'reflexao', null),
  -- K2
  (v_aula2, v_next_aula2,     'Das quatro marcas — vazio, dolorido, atarefado, frágil — qual você reconhece mais em você hoje?', 'reflexao', null),
  (v_aula2, v_next_aula2 + 1, 'Em que momento da sua semana o seu ego doeu?', 'reflexao', null),
  -- K3
  (v_aula3, v_next_aula3,     'Em que parte da sua vida você ainda está tentando provar quem você é?', 'reflexao', null),
  (v_aula3, v_next_aula3 + 1, 'Como você costuma reagir quando recebe uma crítica?', 'reflexao', null),
  -- K4
  (v_aula4, v_next_aula4,     'Onde você ainda performa para se sentir aceito?', 'reflexao', null),
  (v_aula4, v_next_aula4 + 1, 'O que você quer praticar essa semana para lembrar que Deus já se pronunciou sobre você?', 'reflexao', null);
end
$migration$;
