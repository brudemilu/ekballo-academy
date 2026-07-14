-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 1 — O chamado para a liderança (aula ordem = 1)
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
  -- Capítulo 1 — O chamado para a liderança
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 1;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 1 — O chamado para a liderança',
      1,
$conteudo$Do alto de sua perspectiva eterna, Deus vê a história completa de cada pessoa: início, meio e fim. Do berço à sepultura, cada vida é um poema, um quadro que ele pintou. Porém, da perspectiva humana, o quadro de nossa vida vai se formando um dia de cada vez, de maneira gradual e constante. É nesse contexto desafiador que ele manifesta nosso destino, nosso chamado, as "boas obras, as quais Deus de antemão preparou para que andássemos nelas" (Ef 2.10). Assim, cada líder é desafiado a responder ao chamado de Deus com excelência, transformando a visão recebida por Ele em ações práticas.

Se pensarmos bem, veremos que o chamado é um ponto básico de nossa vida cristã, já que tudo começa com um chamado à existência, um chamado ao relacionamento com Deus e depois um chamado ao serviço cristão.

O chamado à existência parte da premissa de que chamar envolve dar um nome, e dar um nome envolve existir. Deus chamou à luz "dia" e às trevas, "noite".

"Chamado ao relacionamento" é o sentido básico da palavra hebraica traduzida como "chamado". Isso mostra que Deus nos convida a ter um relacionamento pessoal com ele e que, seguindo seu exemplo, nós também chamamos uns aos outros (e até aos animais!) a um relacionamento pessoal conosco. Por isso, no decorrer dessa jornada de liderança prática, ser eficiente também significa reconhecer e abraçar esses relacionamentos como fundamentos essenciais do chamado de um líder.

O chamado ao serviço (isto é, ao ministério) é definido pelo teólogo Os Guinness como "a verdade de que Deus nos chama para si mesmo de uma forma tão decisiva que tudo que somos, fazemos ou possuímos é investido com uma devoção e dinamismo especial, que se manifesta em uma resposta para o seu serviço".

O ato de revelação, isto é, o chamado para um relacionamento com Deus e, posteriormente, para o ministério, pode ser sobrenatural ou racional. O que se deve ter em mente é que a experiência de cada pessoa não é um paradigma da ação divina nesta área para todas as outras pessoas. Deus age conforme lhe apraz.

C. S. Lewis, por exemplo, um dos maiores pensadores cristãos de todas as épocas, retrata bem a possibilidade da revelação racional, pois se converteu e teve a noção do chamado de Deus para sua vida pelo seu raciocínio. Para outras pessoas, como eu, Deus pode se revelar de forma sobrenatural. Meu chamado para o ministério aconteceu por uma visão espiritual. No meio de um grande dilema em relação ao futuro da minha vida, estando prestes a concluir um curso técnico de geologia, Deus revelou sua vontade para minha vida, deixando claro que tinha um chamado ministerial para mim.

Seja qual for a forma do chamado, o importante é conhecermos nosso chamado e termos esse sentido de destino, esse sentido daquilo que fomos chamados a fazer. Sem esta convicção de chamado, o líder não terá forças para suportar as provações do dia a dia. Portanto, a convicção do chamado tem de estar muito clara na mente do líder, para que ele não esmoreça nos momentos de dificuldade. Os líderes que terminam bem sua carreira são aqueles que demonstram ao longo dela uma clara e absoluta convicção de um chamado individual, convicção essa que surge quando eles olham em retrospecto e reconhecem os atos de Deus até aquele momento de sua história. Quando os líderes conseguem discernir o que Deus está fazendo com eles e por meio deles, isso os entusiasma. Dali em diante, eles não têm dúvida alguma de que Deus os tem chamado para um determinado ministério e, então, baseados nessa convicção, passam a olhar para a frente, para o futuro, caminhando em direção ao cumprimento do propósito divino para sua vida. Vejamos isso na Bíblia.

Em Ester 4.14, Mordecai, reconhecendo com propriedade os desígnios soberanos de Deus e a limitação do nosso entendimento humano sobre nosso chamado individual, disse a Ester: "Quem sabe se para conjuntura como esta é que foste elevada a rainha?" Isso nos leva à questão: Para que existimos? Como fez com Ester, quem sabe Deus não colocou você na posição de liderança em que está hoje para abençoar seu povo?

A liderança espiritual é bem diferente da liderança secular, que geralmente visa fama, fortuna e poder. A liderança espiritual está ligada a um propósito divino.

A Bíblia mostra que a história de cada líder espiritual tem: (1) uma preparação, (2) uma revelação, (3) uma confirmação e (4) uma consumação do chamado.

Na preparação para o chamado, o líder ainda não tem noção do que está acontecendo nem do que Deus está soberanamente fazendo em sua vida. É então que o Senhor lhe revela seu chamado individual, o que o leva a sentir-se responsável por levar um grupo a um futuro preferível. Em um dado momento, Deus confirma essa direção para a qual o líder começa a caminhar, e este vai seguindo até chegar à consumação do chamado, que é onde ele recebe a coroa da recompensa e celebra sua carreira bem terminada. Vamos ilustrar essa união entre propósito divino e liderança na vida de José, Moisés e Paulo.

No caso de José, em Gênesis 30 encontramos a fase de preparação de seu chamado ao ler sobre sua mãe lamentando o fato de ser estéril até que, de maneira soberana, Deus a faz fértil, indicando que a criança que haveria de nascer cumpriria um propósito muito especial.

Posteriormente, vemos José crescendo até o momento em que ele tem a revelação de seu chamado em Gênesis 37, momento que representou um discernimento do propósito de Deus para a sua vida. A revelação se deu por meio de dois sonhos: os feixes dos seus irmãos rodeando e se inclinando perante o dele e o sol, a lua e onze estrelas se inclinando perante ele. Odiado pelos irmãos, que tinham ciúmes dele, José foi vendido por eles aos mercadores e, posteriormente, a Potifar, no Egito. A partir daquele momento, quase todos os textos que relatam fatos da vida de José o apresentam sendo testado na área de integridade. Os textos seguem um padrão determinado: José é testado por Deus e responde com fidelidade. Em Gênesis 39, por exemplo, tentado pela mulher de Potifar, ele resiste, sofre o ridículo, mas mantém-se firme e é colocado na prisão. Naquela situação terrível e de miséria, Deus o fez prosperar.

Naquela triste situação, Deus estava encaminhando José para a fase de confirmação do seu chamado. José tornou-se um mestre na interpretação de sonhos, fato que o levou, posteriormente, a ser chamado pelo próprio faraó para interpretar um sonho que o angustiava. Tal experiência provocou uma mudança radical em sua vida, tirando-o do calabouço para liderar o Egito.

Ao final, José salvou da fome não só o Egito e os povos vizinhos, como também sua família, fato que foi a consumação e celebração de seu chamado bem terminado.

O caso de Moisés também retrata a existência dessas fases. Na vida de Moisés, a manifestação dos atos soberanos de Deus se deu desde seu nascimento, preservando-o da morte quando bebê e, posteriormente, por meio de seu treinamento no palácio do faraó. Deus o estava preparando para ser o líder de seu povo. No ato seguinte, Deus revela-se a ele na sarça ardente. A partir daquele ponto, Moisés passou, conscientemente, a caminhar em direção ao cumprimento do seu chamado, conduzindo o povo de Israel à terra prometida.

O chamado de Paulo também começou com uma fase de preparação. Em Gálatas 1.15, ele disse: "[Deus] me separou antes de eu nascer e me chamou pela sua graça". O que aconteceu, porém, nesse período de preparação, que vai da sua separação antes mesmo do nascimento até o seu chamado?

Por um lado, esse período foi marcado pela sua incessante e cruel perseguição aos cristãos. Por outro lado, pelo fato de ter nascido em Tarso, uma cidade com fama acadêmica, ele teve a oportunidade de ser educado por Gamaliel, o maior sábio de Israel dos seus dias. Graças ao treinamento recebido, Paulo tornou-se um poliglota, um intelectual, e pôde, posteriormente, alcançar o mundo com sua missão. Além disso, Tarso era sede de uma guarnição de Roma e por isso era considerada uma cidade romana, o que conferiu a Paulo, desde o seu nascimento, o título de cidadão romano. Posteriormente, essa cidadania foi muito útil para o desenvolvimento do seu ministério missionário. Em todos esses aspectos, podemos ver a mão de Deus agindo na vida de Paulo, preparando-o para o cumprimento do seu chamado.

Então, no tempo apropriado, Deus revelou-se a ele na estrada de Damasco. Paulo, naquela ocasião, não somente encontrou-se com o Cristo ressurreto, mas recebeu uma clara indicação do que lhe aguardava adiante. Este foi o chamado de Paulo ao relacionamento com Deus, mas temos vários chamados de Paulo a ministérios específicos: em Atos 13.2, a indicação clara do texto é a de que o Espírito Santo o estava chamando para o ministério na igreja de Antioquia; em Atos 20.23, ele estava convencido de que Deus o havia chamado para ir até César, embora isso implicasse em ter de ser preso. Deus confirmou esses chamados pela direção do Espírito Santo à igreja de Antioquia para separá-lo para ir aos gentios, e por meio, também, do Espírito, que confortou Paulo afirmando que era importante que ele fosse a Roma.

E por fim a carreira de Paulo terminou bem quando, em carta a seu filho espiritual Timóteo, ele afirmou ter lutado o bom combate e saber que lhe aguardava a coroa da recompensa.

Tendo dito isso, é importante notar e dizer que, em toda essa jornada da preparação à consumação do chamado, há uma longa formação do caráter do líder por parte de Deus, que acontece simultaneamente ao ministério deste, ao longo de toda a sua vida.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Autoavaliação do Chamado
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Reflita sobre seu chamado como líder. Qual foi a visão original que Deus lhe deu?',
     'reflexao', null),
    (v_aula_id, 2,
     'Quais são os desafios que você enfrenta atualmente para transformar essa visão em ação prática?',
     'reflexao', null),
    (v_aula_id, 3,
     'Escreva três ações concretas que você pode tomar nesta semana para alinhar sua liderança à visão que Deus lhe deu.',
     'reflexao', null);
  end if;
end
$migration$;
