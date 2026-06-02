-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 9 — Caminhando da inexperiência à celebração (aula ordem = 9)
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
  -- Capítulo 9 — Caminhando da inexperiência à celebração
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 9;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 9 — Caminhando da inexperiência à celebração',
      9,
$conteudo$O desenvolvimento de um líder no decorrer da vida segue uma linha do tempo. Há uma linha geral de análise do desenvolvimento de líderes, possível de ser aplicada a todos, e uma linha personalizada, aplicada individualmente. Estudiosos dessa teoria têm analisado a vida de personagens bíblicos, históricos e outros ainda em atividade e descoberto que, de maneira geral, a vida de uma pessoa pode ser dividida nas seguintes fases:

LINHA DO TEMPO DO LÍDER
• Fase 1 — Fundamentos
• Fase 2 — Crescimento interior
• Fase 3 — Maturidade no ministério
• Fase 4 — Maturidade na vida
• Fase 5 — Convergência
• Fase 6 — Celebração

FUNDAMENTOS

A primeira fase da vida do líder é chamada de "Fundamentos soberanos". São aqueles acontecimentos vividos na fase inicial da vida de uma pessoa, sobre os quais ela só vai ter consciência clara da ação de Deus em um momento posterior, quando tiver a oportunidade de olhar para trás e ver que Deus estava, de fato, trabalhando em sua vida por meio deles. A partir daquele instante, o líder pode olhar para a frente e almejar alcançar as coisas que Deus progressivamente lhe for revelando.

Deus é quem escolhe cada pessoa para ser líder. Uma análise destes fundamentos que Deus coloca na vida da pessoa, antes até mesmo da conversão, a ajudará em muitas maneiras. Ela discernirá a maneira como Deus a está preparando por um longo tempo. Ela terá uma ideia mais clara do propósito divino para sua vida ao entender o modo maravilhoso como Deus tem trabalhado nela no decorrer dos anos. Estes atos soberanos divinos normalmente se manifestam na forma de um sentido de destino e depois de uma experiência espiritual dramática.

O sentido de destino é "uma convicção que vem de uma experiência ou série de experiências, nas quais Deus tem a sua mão na vida da pessoa, indicando que ele tem um propósito especial para ela". É uma profecia (Lc 1.39-45), um nome (Mt 16.18), um voto (1Sm 1.11), um ato de fé dos pais (Hb 11.23), a preservação milagrosa da vida (Gn 37.18-24), circunstâncias especiais no nascimento (Êx 2.1-11) ou uma revelação divina (Lc 1.8-12). Estas experiências dão ao líder um sentido de destino que mais tarde definirá sua contribuição especial ao povo de Deus. Normalmente, a passagem desta fase para a próxima acontece por meio de uma experiência espiritual intensa, que pode ser a conversão ou uma experiência profunda com Deus.

Os elementos que Deus usa para criar esse tipo de experiência variam muito. Deus trabalha das maneiras mais inexplicáveis em nossas vidas. Família, circunstâncias, amigos, contatos sociais, criação religiosa, educação e muitas outras variáveis são conjugadas para influenciar a pessoa para o bem e para o tipo de ministério que Deus a está chamando. O propósito é sempre nos preparar para que possamos crescer na observância da sua vontade para nossa vida.

CRESCIMENTO INTERIOR

Este estágio envolve o desenvolvimento de um relacionamento com Deus, a partir do qual um caráter maduro e cristão se desenvolve. Esta fase começa com o nosso comprometimento inicial com Cristo como nosso Senhor e Salvador, e continua com o início do processo de relacionamento com ele. Neste processo, Deus começa a nos transformar. Os elementos usados para o desenvolvimento do ser interior são a prática das disciplinas espirituais e a aplicação de três tipos de testes de formação de um caráter cristão.

ELEMENTOS USADOS PARA O CRESCIMENTO INTERIOR
• Disciplinas interiores: Estudo, Meditação, Oração, Jejum
• Disciplinas exteriores: Simplicidade, Submissão, Serviço
• Disciplinas corporativas: Confissão, Instrução, Adoração, Culto
• Testes de crescimento: Integridade, Obediência, Palavra

Assim Deus constitui um processo informal de treinamento (a "aprendizagem que se realiza na vida cotidiana, não sendo necessariamente intencional"), mas também pode capacitar o líder de modo formal ("em instituições de ensino e de formação e que conduz a diplomas e qualificações reconhecidas") ou não formal ("aprendizagem que acontece em paralelo aos sistemas de ensino e formação, não conduzindo, necessariamente, a certificados formais").

Sem o treinamento formal e sistemático, que objetiva conferir um diploma ou credenciais de ministério, uma pessoa não pode, pelo menos em boa parte das igrejas cristãs, exercer um ministério religioso autorizado pelas respectivas denominações. Devido ao tempo geralmente longo de treinamento e às exigências qualificadoras do treinamento, o percentual de líderes que recebem este tipo de treinamento é muito pequeno. Segundo Coombes, "a cada cem líderes, somente três submetem-se a este tipo de treinamento", o que equivale a 3%.

O treinamento não-formal, como vimos acima, é também sistemático, seguindo um programa pré-estabelecido, mas não tem por objetivo conferir um diploma ou credencial à pessoa treinada. Pode ser, por analogia, comparado à educação continuada. Nesta categoria é ministrado 27% do treinamento oferecido aos líderes cristãos, segundo dizem os estudiosos da matéria. Exemplos de treinamento não-formal são o Evangelismo Explosivo, o curso básico de discipulado, entre outros.

Os outros 70% dos líderes, cristãos e não cristãos, em todo o mundo, são treinados de maneira informal. A natureza do treinamento informal é diversa e complexa. Os pontos-chave parecem ser que o aprendizado informal é basicamente individualista, embora não exclua a participação em atividades de grupo, largamente não-estruturadas. Ele acontece normalmente fora dos limites das entidades educacionais, não prevê a concessão de nenhum grau acadêmico, e frequentemente não tem nenhum objetivo declarado.

Coombes e Ahmed produziram uma definição abrangente do aprendizado informal como sendo: "Processo que dura a vida toda, pelo qual um indivíduo adquire e acumula conhecimento, habilidades, atitudes e perspectivas a partir das experiências do dia a dia, e a exposição ao seu contexto imediato. Este processo não segue, geralmente, uma estrutura preestabelecida, sistemática, e, em muitos casos, acontece quase acidentalmente. Tal processo, contudo, representa a maior porção de conhecimento de qualquer pessoa durante sua vida."

No treinamento informal o padrão básico é a mentoria, isto é, no desempenho de tarefas por observação de outras pessoas que já as desempenham. É importante, nesta fase de crescimento interior, que os valores de liderança e as respostas dos testes ministeriais sejam analisados.

Eu ainda reconheço a grande importância e significado que uma experiência deste tipo representou para o meu desenvolvimento como líder. Após apenas três meses de conversão, fui convidado por um pastor batista para fazer uma pregação no culto dominical daquela igreja.

O culto era de Santa Ceia. A igreja tinha um bom número de pessoas e eu me preparei muito para falar. Aquele foi um dos maiores desafios de toda a minha vida. Apesar de ter preparado um sermão para vinte e cinco minutos, quando chegou a minha hora para ministrar, não consegui pregar mais do que cinco minutos. O que me sobrava de entusiasmo faltava em experiência. Contudo, em meu caso, que estava passando pela fase de crescimento interior, a confiança que havia sido depositada em mim para desempenhar aquela tarefa, o fato de alguém ter acreditado na minha pessoa e me ter dado algum tipo de treinamento e responsabilidade, foi como o acender de um fogo que nunca mais se extinguiu.

George Barna afirma que a média de tempo que nós, protestantes, demoramos para confiar algum tipo de tarefa relevante a um novo convertido é de dois anos. Nós só confiamos quando o potencial de evangelização da pessoa e o seu entusiasmo nivela-se com o nosso próprio, acomodando-se. Isso deve ser questionado porque é na fase de crescimento interior, pelo sistema de testes e respostas, que acontece o chamado ministerial. O teste e a resposta dada desenvolvem, assim, o seu potencial. A chamada para qualquer ministério, sendo este entendido de forma abrangente e não apenas como chamado pastoral, representa a passagem da fase de crescimento interior para a fase seguinte.

MATURIDADE NO MINISTÉRIO

A terceira fase representa o desenvolvimento e maturação no ministério por meio da identificação e aplicação das ferramentas e do bloco de habilidades de uma pessoa. Estas ferramentas são as habilidades específicas que a pessoa adquire no cotidiano eclesiástico, que a ajudam a desenvolver mais efetivamente tarefas como: aconselhamento bíblico, administração eclesiástica e técnicas de ensino. O bloco de habilidades é formado pela combinação dos dons espirituais, habilidades naturais e habilidades adquiridas.

Nesta fase, o líder emergente tem no ministério o seu foco principal de vida. Ele se envolverá em mais treinamento, tanto informal (por meio de projetos autônomos de estudo e crescimento) quanto formal (por meio de conferências, workshops, entre outros). O ministério parece ser o que realmente importa! A maioria das pessoas fica ansiosa por apressar ou nem passar pela fase anterior, a fase de crescimento interior.

No entanto, o que impressiona é que, durante as três fases iniciais, Deus está trabalhando primeiro no líder, e não por meio dele. Embora possa haver frutos no ministério, o foco central é o que Deus está fazendo no líder. A maioria não reconhece isso. Eles avaliam a produtividade, atividades e frutos, mas Deus está quietamente, e muitas vezes de maneiras inusitadas, tentando levar o líder a entender que aquele que ministra o faz na base daquilo que é. O que dá poder e graça para o ministério é a formação de Cristo na pessoa.

Na verdade, essas três primeiras fases, quando Deus está trabalhando o ser interior do líder, geram, em muitos casos, grandes conflitos internos na pessoa em treinamento. Isso acontece porque a instituição à qual ele pertence concentra-se, frequentemente, na busca de resultados. A cobrança por resultados faz com que o líder em formação, durante esta fase, já comece a sentir-se tenso e excessivamente pressionado para cumprir os alvos institucionais esperados. Isso só confirma uma grande verdade: instituições trabalham por resultados, enquanto Deus trabalha por caráter, pela imagem de Cristo em nós.

O que o líder emergente precisa sempre manter em perspectiva é que há líderes que constroem impérios e outros que servem. Os servos sustentam o mundo. Algumas das grandes figuras religiosas e éticas do passado, que já morreram há muitos anos, ainda hoje estão influenciando o nosso mundo.

Como exemplo temos Madre Teresa de Calcutá, uma mulher impressionante, que, a despeito de sua constituição física frágil e delicada, e apesar de não possuir nenhum dote acadêmico extraordinário, tornou-se mundialmente reconhecida por sua grande influência como modelo de serviço e amor ao próximo. Ela, que viveu num país hindu com forte presença de uma minoria muçulmana, onde o cristianismo representava somente uma pequena porcentagem da população, fez uma grande diferença. Ela fundou uma ordem de freiras indianas com centenas de membros, que ainda hoje continuam a recolher das ruas sujas da cidade de Calcutá os pobres enfermos das castas hindus mais irrelevantes, para que possam se recuperar ou morrer com dignidade. Seu exemplo tem influenciado outras pessoas a continuarem sua obra, lutando para resgatar a dignidade humana num lugar em que a maioria esmagadora das pessoas mora em barracos ou nas ruas e onde, logo pela manhã, caminhões de lixo passam recolhendo das ruas corpos de pessoas mortas.

Portanto, o mundo é, na verdade, mantido pelo trabalho dos servos e não pelos que somente estão em busca de resultados. É muito importante que resgatemos esta noção, pois, durante esta terceira fase, as instituições apresentam uma forte pressão sobre seus integrantes na busca por resultados. Tal pressão gera uma grande tensão sobre o líder e, para continuar avançando em sua linha do tempo, ele deve aprender a conviver com ela e administrá-la.

Nesta fase também, Deus está testando o líder e observando a maneira como ele responde aos testes de integridade, porque o líder cristão é aquela pessoa que lidera a partir do que ela é.

No momento em que está, o líder ainda não localizou plenamente as suas áreas de competência e, por isso, faz de tudo um pouco. Somente na segunda metade da maturidade na vida é que ele será capaz de reconhecer as áreas nas quais tem melhor preparo e sonhar com o momento quando poderá convergir suas áreas fortes com o ministério específico que melhor use as suas habilidades ministeriais.

No que se refere ao papel dos líderes mais experientes em relação aos novatos no ministério, uma opção seria que as instituições adotassem uma postura mais equilibrada, que não pressionasse excessivamente os seus líderes emergentes, mas que, por outro lado, não os incentivasse à inoperância. Tanto a pressão excessiva quanto uma atitude condescendente e paternalista atrapalham igualmente o desenvolvimento do líder. Há que se considerar que toda instituição trabalha com uma dinâmica própria, buscando sobreviver e crescer. Portanto, a tensão e a cobrança por resultados, de uma certa forma, sempre existirão, pois são inerentes à sua natureza.

Nesse aspecto, é relevante que as instituições considerem a necessidade de começar a questionar, por exemplo, qual é o padrão de espiritualidade que adotam. O padrão de espiritualidade ocidental é, na maioria das vezes, baseado em uma agenda cheia de atividades. Este critério influencia o conceito ministerial denominacional, que se volta para uma hiperatividade. Isto só gera canseira, desestímulo e estafa no novo líder, principalmente uma estafa espiritual, prejudicando o seu desenvolvimento. Isso torna-se mais desafiador devido ao inexorável processo de institucionalização enfrentado por toda organização. É como vimos: a vida de uma instituição começa com uma visão e, com o passar do tempo, esta visão vai cedendo espaço para a manutenção; porém, o segredo da desejada revitalização encontra-se sempre no redescobrimento da visão.

Nós todos precisamos aprender como equacionar produção com devoção, contemplação e espiritualidade.

MATURIDADE NA VIDA

Durante esta fase, o líder percebe que "um ministério maduro floresce a partir de um caráter maduro". Um caráter maduro floresce como resultado de um processo espiritual marcado por provações, tribulações e grandes dificuldades. Apesar de muitos líderes experimentarem dificuldades em seus "processos espirituais", somente uns poucos reconhecem o Senhor trabalhando para o seu bem por meio das suas duras lutas. A falta de reconhecimento da ação divina os faz perder a oportunidade de crescimento.

Durante este período, a autoridade espiritual do líder pode aumentar. Embora este aumento não seja um objetivo primário, ele é um claro produto de um relacionamento espiritual maduro com Deus.

Para facilitar a maturação, Deus frequentemente permite um tempo intenso de processamento na vida do líder. No meio das crises, ele tem a oportunidade de refletir sobre as circunstâncias de sua vida e ministério. Se o líder desenvolve um comprometimento renovado, o Senhor continuará a abençoá-lo com um ministério mais ampliado. De outra sorte, ele provavelmente estagnaria no ministério e veria sua influência diminuir.

Este estágio também envolve o desenvolvimento de uma filosofia de ministério madura e pessoal, o que é fundamental para levar o líder ao estágio de convergência, onde a preparação na vida interior, o bloco de habilidades de uma pessoa, a experiência e a filosofia de ministério se juntam e cumprem, de uma forma efetiva e frutífera, o sentido de destino do líder.

A filosofia de ministério refere-se às ideias, valores e princípios que um cristão usa para tomar decisões, exercer sua influência e avaliar a si mesmo, seus relacionamentos e eficiência ministerial. Na verdade, "uma filosofia de ministério amadurecida permite que uma pessoa opere no ministério com eficiência (ou seja, faça as coisas muito bem-feitas) e com eficácia (ou seja, fazendo muito bem as coisas corretas)".

Durante esta fase de maturidade na vida, o líder identifica e usa suas habilidades com poder. Há um frutificar amadurecido. Deus está trabalhando por meio do líder usando o modelo de imitação (Hb 13.7-8). Ou seja, Deus usa a vida de uma pessoa, bem como as suas habilidades, para influenciar outros que, por sua vez, o seguem e o imitam.

Este é também um período no qual as habilidades se destacam juntamente com as prioridades. A pessoa reconhece que o direcionamento de Deus para o ministério vem por meio do estabelecimento das prioridades ministeriais, baseadas nas habilidades discernidas. É nele que se evidencia se a pessoa será um líder da instituição em um sentido político, ou se será um líder voltado para o ministério, no sentido de desenvolver um ministério direto junto ao povo. Nesta fase, a pessoa experimenta um aumento no entendimento que ela tem a respeito de quais são as suas áreas fortes de competência.

Se o líder continuar caminhando com integridade e dedicação, é provável que, progressivamente, se sinta liberado da responsabilidade de fazer de tudo um pouco e possa começar a se concentrar naquilo que melhor sabe fazer, na sua área de competência. Cada um de nós tem áreas de maior aptidão e melhor treinamento. O segredo do sucesso está em otimizar nosso desempenho nestas áreas em que somos mais fortes.

Muitos líderes não conseguem passar das fases anteriores para esta por vários motivos, como: problemas espirituais, físicos, morais, emocionais ou relacionais, que podem bloquear o progresso na linha do tempo.

Na verdade, no núcleo profundo deste entendimento há apenas duas maneiras de passar de uma fase para outra: os valores interiores, com a formação de Cristo em nós, quando Deus se encarrega de expandir nossos ministérios, à medida que obtivermos êxito nos vários testes pelos quais continuamente passamos; e a nossa disposição para aprender, mantendo uma postura e atitude de aprendizado durante toda nossa vida.

A marca do líder que chega ao gozo da fase da convergência consiste na formação interior de caráter, para que o mesmo possa ser um modelo, e na habilidade e desejo de continuar aprendendo a longo prazo.

CONVERGÊNCIA

Nesta fase, o líder é levado por Deus para uma função que conjuga sua caminhada com ele às suas habilidades adquiridas, dons espirituais, habilidades naturais, filosofia de ministério, experiência de vida, personalidade e contexto. Ao conjugar todos os fatores naturais e espirituais do seu treinamento, ele passa a desfrutar o potencial máximo do seu ministério.

O objetivo é não somente liberar o líder de ministrar naquilo que não tem habilidade, mas também aproveitar e usar o melhor que ele tem para oferecer. Não são muitos os líderes que experimentam esta fase. Frequentemente eles são promovidos para posições que escondem suas habilidades. Além do mais, não são muitos os líderes que ministram a partir daquilo que são. Para muitos, sua autoridade normalmente vem muito mais da função que ocupam. Nesta fase de convergência, o ser e a autoridade espiritual formam a verdadeira base de poder para um ministério maduro. Os frutos do Espírito (maturidade cristã) unem-se aos dons do Espírito (marcas de um líder sendo usado por Deus), produzindo o balanço que ele deseja. A maneira que ele escolhe trabalhar é em nós, primeiramente, e então, por meio de nós.

Você sabia que somente 40% dos líderes alcançam a fase de convergência em seu ministério e somente 30% alcançam a fase de celebração?

CELEBRAÇÃO

Nos anos finais de vida e ministério, o líder bem-sucedido experimenta o privilégio de ser usado como referência e consulta por parte dos líderes mais jovens. A autoridade do ensino e da influência vem pelo reconhecimento de uma vida que ensinou a partir do que ela é em seu interior. Relacionamentos construídos no decorrer da vida são as áreas naturais de influência, bem como a constante presença nas estruturas organizacionais.

Os líderes que alcançam esta fase são aqueles que, mesmo tendo chegado ao final da vida, não caem jamais no esquecimento, pois passaram o tempo todo construindo um legado para ser deixado às gerações posteriores.

Todo líder deve fazer a si mesmo uma pergunta muito importante: "Qual é o legado que eu gostaria de deixar para a geração futura? Como quero chegar à velhice?"

Celebração é o resultado de integridade interior e de um espírito de aprendizado demonstrado no decorrer da vida. Essas duas coisas, quando juntas, cativam, abençoam e influenciam as pessoas. O princípio que pode ser extraído daqui é o de que o mais importante no ministério não é como você começa a exercê-lo, mas sim como você conclui a sua carreira. A maneira como cada um de nós termina sua carreira será a imagem que deixaremos para as gerações futuras.

Se a celebração é resultado direto de uma vida de integridade, serviço e aprendizado, devemos sempre nos questionar se, ao término de um relacionamento ou de uma fase de nossa carreira, fomos capazes de construir uma reputação de integridade para o benefício dos outros, abençoando e enriquecendo suas vidas. Celebração é para aqueles que querem e lutam por terminar bem.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Celebrando Conquistas
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Pense em um momento recente em que você alcançou uma conquista significativa. Como você celebrou isso com sua equipe ou comunidade?',
     'reflexao', null),
    (v_aula_id, 2,
     'Que práticas você pode implementar para celebrar pequenos avanços ao longo de sua jornada de liderança?',
     'reflexao', null),
    (v_aula_id, 3,
     'Escolha uma área da sua vida ou ministério onde você ainda se sente inexperiente e defina um plano de ação para melhorar nessa área.',
     'reflexao', null);
  end if;
end
$migration$;
