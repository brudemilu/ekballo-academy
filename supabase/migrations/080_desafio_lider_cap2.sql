-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 2 — A formação do líder (aula ordem = 2)
--
-- Localiza o curso já criado pela migration 058 (slug
-- 'o-desafio-de-todo-lider') e insere a aula no ordem do
-- capítulo, com as perguntas do Desafio Prático como reflexões.
--
-- Idempotente: pode ser reaplicada sem duplicar aula/atividades.
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
  -- Capítulo 2 — A formação do líder
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 2;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 2 — A formação do líder',
      2,
$conteudo$A jornada de formação de um líder ocorre por meio de uma série de lições e desafios personalizados, especialmente criadas por Deus para estimular seu crescimento de acordo com seu coração. A formatura da escola do caráter cristão só acontece quando o líder chega ao céu. Enquanto isso, a pessoa se beneficia das lições de Deus conforme reage adequadamente aos testes divinos.

De acordo com Robert Clinton, professor de liderança no Fuller Theological Seminary, o currículo de Deus para o líder envolve três formações inseparáveis: a espiritual, a ministerial e a estratégica.

FORMAÇÃO ESPIRITUAL

A formação espiritual é a base de tudo que somos e fazemos. Por meio dos eventos da vida de um líder, Deus o desenvolve à imagem do seu Filho (Rm 8.29). A preparação para o ministério começa sempre com a formação do caráter, para que o líder cristão seja "manso e humilde de coração" como o seu Senhor (Mt 11.29). Sem um caráter formado por Deus, tudo que um líder faz corre o risco de ser em vão, pois ele poderá buscar sua própria vontade, e não a vontade de Deus para o grupo. Deus inicia este tipo de atividade formadora de caráter desde cedo na vida do crente. A partir do momento em que entramos, pela fé, em um relacionamento com Deus, começamos a aprender a ouvir, para nos comunicarmos com Ele. Nós aprendemos a ser sensíveis a sua voz, e assim Deus nos conduz por muitas situações por meio das quais poderemos aprender a discerni-la por meio das Escrituras.

Além disso, a autoridade espiritual de um líder, que deveria ser sua base primordial de poder, está diretamente relacionada à sua formação espiritual. Se a sua vida espiritual for fraca, ele procurará outra base de poder para desenvolver seu ministério, tal como sua posição e cargo, e sua experiência e habilidades, mas não terá autoridade espiritual. Um líder que realmente conta no reino de Deus tem a sua vida formada pelo Senhor, conforme ele deseja.

O foco inicial de todo ministério, do ponto de vista divino, não é o ministério em si (como o ser humano tende a pensar), e sim o próprio líder e sua vida espiritual. Deus está mais preocupado com o que somos do que com o que fazemos.

FORMAÇÃO MINISTERIAL

Ao mesmo tempo, para ser um líder eficaz no ministério, é preciso identificar, desenvolver e usar com eficiência seus dons espirituais e as ferramentas ministeriais que tiver. Para ser líder é necessário ter algum tipo de capacidade para liderar, o que envolve personalidade e habilidades, sempre em busca de resultados eficientes e duradouros.

Na questão da personalidade, enfatizam-se os valores herdados. Psicólogos alegam que uma criança, já nos primeiros anos de vida, desenvolve seus traços básicos de personalidade, alguns dos quais podem ser ligados aos valores herdados de seus antepassados. Isso aponta para a obra divina de nos criar como seres humanos que herdam dos pais características genéticas e psicológicas.

No que diz respeito às habilidades, vemos que, ao longo de nossa vida, Deus nos dá também a motivação, a capacidade e a inteligência para adquirirmos ferramentas necessárias para o desempenho do ministério. Tal aquisição e aperfeiçoamento das habilidades ministeriais exige dedicação, tempo e constante disciplina. Desse modo, a prática da liderança eficiente não é um evento único, mas uma série de decisões e ações consistentes que refletem a excelência esperada.

Assim, vemos que as capacidades dadas por Deus envolvem tanto a soberana vontade divina, sem participação humana, quanto a vontade redimida, onde depende de cada um de nós caminhar em cooperação com o Espírito Santo e aprimorar as habilidades que possuímos.

Além disso, líderes se focam ou em tarefas ou em pessoas. O líder que focaliza a execução de tarefas concentra-se em projetos e responsabilidades administrativas, de forma gerencial e estratégica, apresentando muita facilidade para montar projetos e designar as melhores pessoas para ocupar posições.

Já o líder que enfatiza os relacionamentos focaliza-se primariamente no bem-estar das pessoas que estão debaixo de sua liderança, criando um ambiente confortável de apoio emocional e espiritual. Um líder bem preparado demonstrará habilidades nos seus relacionamentos e em sua capacidade de analisar e responder às situações da vida de forma apropriada.

Clinton identifica três elementos básicos que definem o estilo de liderança e cada decisão de um líder: o próprio líder (com sua personalidade, experiências, dons e habilidades), os seguidores (com suas experiências, sua maturidade e seu nível de relacionamento com o líder) e a situação (que é a variedade de contextos imediatos ou gerais do líder, como um momento de crise ou uma reunião de estudo bíblico). A formação ministerial prepara o líder para considerar todos esses elementos com sabedoria, a fim de tomar decisões adequadas.

FORMAÇÃO ESTRATÉGICA

Concomitantemente, temos também a formação estratégica, ligada ao valor básico que fundamenta a prática do ministério. Se a formação espiritual trata do "quem" do líder e a formação ministerial trata do "como" da liderança, a formação estratégica trata do "porquê" do ministério.

Quando o líder inicia seu ministério, ele tende a refletir os valores da denominação ou do grupo no qual trabalha. Ao desenvolver maturidade, ele começa a avaliar aqueles valores e descobrir outros. A internalização e articulação desses valores em uma filosofia de ministério coerente formará a base para o ministério particular que ele desenvolverá como líder maduro e experiente. Esta filosofia, que reflete valores cristãos gerais, será baseada nas experiências, dons, habilidades e caminho ministerial que Deus tem preparado para o líder. Contudo, a grande maioria dos seus valores virá das lições de vida que Deus lhe tem ensinado e das direções que tem lhe indicado para o seu ministério. Um líder que termina bem a sua carreira deve aprender a desenvolver estes valores.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Desenvolvimento pessoal
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Liste três áreas em que você precisa crescer para se tornar um líder mais eficaz.',
     'reflexao', null),
    (v_aula_id, 2,
     'Avalie o quanto sua liderança atual reflete o caráter de Cristo. Que áreas de sua vida pessoal e espiritual precisam de mais atenção?',
     'reflexao', null),
    (v_aula_id, 3,
     'Crie um plano de desenvolvimento pessoal para os próximos seis meses, incluindo disciplinas espirituais que você vai adotar para fortalecer sua formação como líder.',
     'reflexao', null);
  end if;
end
$migration$;
