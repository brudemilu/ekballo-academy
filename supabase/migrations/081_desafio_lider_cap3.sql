-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 3 — O choque de realidades (aula ordem = 3)
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
  -- Capítulo 3 — O choque de realidades
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 3;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 3 — O choque de realidades',
      3,
$conteudo$Até então tudo parece simples: Deus chama o líder de forma única e especial, depois ele o forma e capacita para o ministério.

Contudo, logo que o ministério do líder se inicia, ocorre um choque de realidade do líder, que tem uma visão e um chamado inovadores, com a realidade da instituição a que foi chamado a servir, a qual já está estruturada há um certo tempo. É como um choque de gerações, quando um jovem sonhador e uma pessoa mais experiente e menos flexível têm de conviver em um mesmo espaço, esse conflito revela que o verdadeiro desafio de todo líder está em aplicar de forma prática a visão que Deus lhe deu, transformando-a em ações eficientes, enquanto navega pelas realidades da instituição e permanece fiel ao propósito divino.

Atualmente, a maioria das igrejas e instituições cristãs trabalham apenas no modelo de perpetuação. Embora não digam isso abertamente, muitas delas agem como se o mais importante fosse sua sobrevivência, e não a expansão do reino de Deus e suas manifestações de paz, justiça e amor.

O processo de institucionalização é algo inexorável. Ele tem vários fatores positivos, como perenidade, continuidade, estabilidade e comprometimento de longa duração com indivíduos e comunidade. A estrutura denominacional deveria ter a mesma função de uma coluna vertebral, ou seja, deveria existir para tornar possível a sustentação das partes que, articuladas, podem movimentar-se de uma maneira mais rápida e eficaz. No entanto, existem também fatores negativos, como o perigo de estagnação, que precisam ser entendidos e administrados. O perigo da estagnação ocorre porque qualquer política de manutenção tende a ser defensiva, e não inovadora. É como dizem, adaptando de forma livre Provérbios 29.18: "Sem visão, o povo perece"; Essa advertência de Salomão nos ensina que a liderança eficiente exige mais do que planos; ela exige ações práticas que reflitam a visão de Deus para o ministério e para a vida. O mais estranho de tudo é que a própria instituição que visa se perpetuar se formou a partir de uma visão! Por outro lado, o líder que recebe a visão geralmente vem de uma instituição já perpetuada.

Assim, vemos que qualquer instituição, incluindo as cristãs, normalmente surge como resultado de uma visão dada aos pioneiros. Com o passar dos anos, essa visão é substituída pela necessidade de manutenção do que surgiu como resultado da visão, fazendo com que o fogo do entusiasmo com a visão original ceda lugar à defesa da instituição em seu formato atual, cedendo também ao medo de perder o que já se alcançou.

Isso se reflete na seleção de líderes por parte da membresia, observe: na fase inicial da história da instituição, a membresia escolhe seus líderes com base em seu entusiasmo, identificação e capacidade de levar adiante a visão e ideais do grupo. Com o passar do tempo, o critério muda e agora a escolha é de líderes que possam manter a unidade e a estabilidade do que já existe, bem como conduzir a organização a um reconhecimento e prestígio maiores, ou seja, o novo critério se baseia na liderança eficiente.

Como se pode ver, a visão e o entusiasmo que Deus dá ao líder, a partir da convicção daquilo que ele o chamou a fazer, sempre vivem em constante tensão com a tendência à manutenção e acomodação inerentes a qualquer instituição. Assim, para que o líder possa trilhar sua jornada da visão à ação com excelência, é essencial encontrar um equilíbrio entre sua visão inspiradora e as demandas práticas da instituição.

Um dos grandes desafios do líder é, portanto, o de administrar, de forma produtiva, essa dinâmica de constante tensão entre sua visão e a estruturação da instituição. Em outras palavras, o líder precisa descobrir como manter acesa a chama do entusiasmo que veio com a visão do sonho de Deus, sem que, para isso, tenha de se desligar da instituição a que pertence, por ela ser, por sua própria natureza, resistente a sonhos e mudanças. Logo, de certa forma, toda instituição precisa ser revitalizada por novas visões.

Esses líderes responsáveis por reacender a visão quase sempre vêm da periferia da instituição. O líder não deve esperar que alguma política denominacional promova mudanças entusiasmantes, pois, na quase totalidade dos casos, tais iniciativas destinam-se a reafirmar o que já existe. Avivamento e expansão começam quase sempre de fora para dentro, a partir da periferia. Na história da Igreja não se conhece nenhum movimento de avivamento que tenha começado no escritório central das instituições. O avivamento, por definição, nunca começa por uma decisão eclesiástica, pois ele é o produto da ação soberana do Espírito Santo no coração das pessoas. Contudo, obviamente esse fato não deve ser encarado como um fator limitante. Se Deus der ao líder um sonho e entusiasmo por uma visão, ao mesmo tempo em que o coloque em uma posição de influência dentro da instituição, ele deve esforçar-se para encontrar meios de usar essa influência em prol da visão que Deus lhe deu.

É comum a ideia de que expansão e avivamento, por serem movimentos iniciados a partir da periferia, envolvam, necessariamente, a subversão das estruturas da instituição. Tal percepção não é, necessariamente, confirmada pelo teste da história.

Os protestantes e os católicos, por exemplo, apresentam duas maneiras diferentes de lidar com este assunto. Na igreja católica, a renovação a nível individual é medida pela filiação aos vários movimentos que vão surgindo e que são, em sua maioria absoluta, absorvidos no seio da própria instituição. Isso representa uma diferença significativa em relação ao método protestante, uma vez que a igreja católica, a despeito de sua estrutura centralizada e piramidal, consegue atrair e incluir a maioria desses movimentos que, de outra forma, teriam se desligado da instituição, causando divisões, como comumente acontece com as denominações protestantes.

O método protestante envolve um modo pessoal e outro coletivo, eclesiástico. A nível pessoal, a renovação quase sempre se inicia a partir de uma profunda experiência de uma pessoa, seja de conversão ou consagração, provocando uma ruptura radical com diversos aspectos de sua vida anterior. Essa ruptura causa reações em outros indivíduos com as quais aquela pessoa convive, os quais tentam fazê-la desistir das novas ideias. A perseverança implica, muitas vezes, em se ter de pagar um preço, o que envolve perdas, renúncias e sacrifícios.

O preço para manter-se no curso da visão, no entanto, vai diminuindo, progressivamente, de geração em geração, na medida em que a renovação vai se transformando em um novo bloco de tradições.

Normalmente é neste ponto que surge o nominalismo, que é o parceiro de caminhada da institucionalização. A pessoa se mantém na comunidade por não conseguir mais se desvincular dela; afinal, nessa comunidade viveram e investiram os seus ancestrais, nela sua família investiu muito de seu tempo, de suas ideias e de sua própria identidade. Nesse ponto, tal ligação com a instituição já não se dá mais por causa da visão, mas em razão do alto preço que terá de pagar se resolver deixá-la. Assim, a própria identidade da pessoa passa a estar ligada à instituição, fazendo com que seu vigor espiritual decresça demasiadamente. Com o passar das gerações, isso só tende a se complicar. A única solução para restaurar o vigor espiritual a nível individual é a conversão à visão original, por meio do novo nascimento ou de uma experiência poderosa com Cristo.

Uma forma que eu gostaria de sugerir de restaurar a visão em qualquer instituição cristã é a evangelização de nível zero.

Os estrategistas do crescimento da Igreja têm sugerido alguns níveis de evangelismo em relação ao ministério local da congregação. Eles categorizam tais níveis em E-2, E-1 e E-0. A evangelização de nível dois (E-2) é feita em contextos diferentes e distantes da igreja, por meio dos missionários enviados pela igreja local. A evangelização de nível um (E-1) é aquela que é feita no próprio contexto no qual a igreja está inserida. Já a evangelização de nível zero (E-0) é feita internamente, no seio da igreja local. A membresia nominal é reevangelizada e a membresia real é reorientada à visão do movimento que gerou a igreja local, passando então a expandir a influência do reino no mundo e a fundar novas igrejas.

Em outras palavras, a evangelização de nível zero equivale à plantação e revitalização de igrejas. O processo que é chamado de revitalização de igrejas, obrigatoriamente, deve se manifestar na forma da plantação de novas igrejas. Afinal, igrejas dinâmicas geram novas igrejas. Em geral, quando a igreja é nova ou revitalizada ela cresce em um ritmo mais acelerado, acompanhando o alto nível de vigor espiritual da comunidade. Pesquisas têm mostrado que as igrejas assim crescem, em média, duas vezes mais rápido que as igrejas estagnadas. Isso acontece porque o povo volta a abraçar a visão do reino. E o plantio de novas igrejas garante a vitalidade, expansão e entusiasmo do movimento cristão, sendo considerado o método mais eficaz de evangelização praticado pela Igreja.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Lidar com Resistências
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Identifique uma situação recente em que você enfrentou resistência ao tentar implementar uma mudança. Como você lidou com isso?',
     'reflexao', null),
    (v_aula_id, 2,
     'Quais ajustes práticos você pode fazer em sua abordagem para alinhar a visão de sua organização com as necessidades atuais?',
     'reflexao', null),
    (v_aula_id, 3,
     'Crie uma lista de três ações para engajar melhor sua equipe ou comunidade na visão que você está tentando implementar.',
     'reflexao', null);
  end if;
end
$migration$;
