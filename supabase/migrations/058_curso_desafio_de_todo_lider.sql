-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- Montado capítulo a capítulo, seguindo a NUMERAÇÃO do livro.
-- Cada aula = um capítulo; aulas.ordem = número do capítulo.
-- As atividades de cada capítulo são as perguntas do próprio
-- livro ("Desafio Prático"), do tipo reflexão.
--
-- Esta migration cria o curso e insere o CAPÍTULO 4. Os demais
-- capítulos (outras numerações) entram em migrations seguintes
-- (059, 060, ...) que localizam o curso pelo slug e inserem a
-- aula no ordem correspondente — sem mexer no que já existe.
--
-- Idempotente: pode ser reaplicada sem duplicar curso/aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  -- ---------------------------------------------------------------
  -- Curso (idempotente por slug)
  -- ---------------------------------------------------------------
  select id into v_curso_id from public.cursos
  where slug = 'o-desafio-de-todo-lider';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values (
      'o-desafio-de-todo-lider',
      'O Desafio de Todo Líder',
      'Estudo guiado a partir do livro O desafio de todo Líder, de Elias Dantas. Cada capítulo traz o texto na íntegra e, ao final, o Desafio Prático — as próprias perguntas do livro, para você refletir e aplicar à sua liderança. Os capítulos vão sendo liberados conforme a numeração do livro.',
      null,
      false,
      0,
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 4 — Líder centrado em Deus  (aula ordem = 4)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 4;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 4 — Líder centrado em Deus',
      4,
$conteudo$Antes de dizer como o líder deve influenciar a igreja, precisamos compreender o que é um líder e, principalmente, o que é um líder cristão. Curiosamente, embora essa pergunta seja simples, a resposta não é.

A resposta é tão difícil que muitos acadêmicos na área de liderança preferem se concentrar na tarefa da liderança em vez de se concentrar na pessoa do líder. Contudo, líder e liderança são conceitos inseparáveis e precisam ser definidos. Logo, o que vem a ser um líder?

Uma velha brincadeira diz que há três grupos de pessoas no mundo: aquelas que fazem as coisas acontecerem, as que assistem as coisas acontecendo e as que olham à volta perguntando o que está acontecendo. De acordo com esse conceito, sabemos que um líder deve se enquadrar na primeira categoria, a das pessoas que fazem as coisas acontecerem.

Aprofundando essa ideia, Bill George, empresário e professor da Harvard Business School, afirmou que: "Líder é um ser altamente complexo, que tem qualidades distintas que não podem ser suficientemente descritas por listas de tendências ou características de personalidade. É influenciado e definido pela história particular de sua vida, bem como pela maneira como organiza sua história para descobrir sua paixão e o propósito de sua liderança".

Essa definição sugere pontos muito importantes:

• O líder é influenciado pela sua história de vida;
• O líder é influenciado pela descoberta de sua paixão e seu propósito.

Estreitando o espectro dessa afirmação para o líder cristão, Robert Clinton traz a importante definição: "Líder é uma pessoa com capacidades e responsabilidades dadas por Deus, e que influencia um grupo específico do povo de Deus em direção aos objetivos de Deus para o grupo".

Gosto dessa definição porque ela contraria a noção popular de que um líder precisa ter uma posição, um título ou um treinamento formal. De fato, muitos que são chamados para liderar na igreja ou em outras organizações cristãs não têm títulos formais — tais como pastor, diretor ou presidente — podendo ser professores de escola dominical, líderes de grupos de estudo ou colaboradores em qualquer outro ministério. Para ser um líder, não é preciso ter uma posição profissional nem tampouco ser um obreiro de tempo integral. Então, o que é preciso para ser um líder cristão? Clinton acabou de nos responder em sua definição. O líder cristão deve:

• Ter uma responsabilidade dada por Deus;
• Ter capacidades dadas por Deus para esse ministério;
• Ser alguém que influencia um grupo específico do povo de Deus;
• Ser alguém que influencia esse grupo em direção aos objetivos de Deus.

O mais importante aqui é dizer que ser um líder cristão é ter responsabilidades dadas por Deus. E quais são essas responsabilidades? São pessoas. O líder não é apenas responsável pela forma como irá liderar e pelo objetivo rumo ao qual irá liderar, mas sobretudo pelas pessoas que irá liderar. Deus considera o líder como sendo responsável por pessoas (Hb 13.17) e lhe pedirá contas delas. Por isso, o líder precisa servir com temor e tremor, pois sabe que terá de responder a Deus.

Para isso, por mais curioso que possa parecer, o líder precisa cuidar primeiro de sua própria saúde espiritual para depois poder cuidar da saúde espiritual do povo de Deus. O nome disso é zelar pelas disciplinas espirituais.

A eficácia prática das disciplinas espirituais é uma das grandes ajudas disponíveis para o líder que quer terminar bem sua carreira. A prática de tais disciplinas permitirá que a pessoa se concentre nas prioridades de Deus para ela e para seu povo, ajudando a eliminar os comportamentos e atitudes que podem conduzi-los à queda.

Existem muitos recursos disponíveis nesta área. Alguns deles são verdadeiros bestsellers mundiais. Talvez um dos recursos mais notáveis nesta área de espiritualidade seja o livro Celebração da disciplina, escrito por Richard Foster. Outra boa fonte de estudos nesta área é o livro escrito por Richard Lovelace, Dinâmica da vida espiritual.

Todo cristão, em especial aqueles com responsabilidades de liderança, deve investir em seu relacionamento com Deus. Em minha opinião, pelo menos seis áreas são fundamentais para o desenvolvimento da intimidade espiritual:

• Palavra. Um tempo de reflexão e estudo da Bíblia.
• Oração. É a hora silenciosa, um tempo quando o líder ouve a Deus, sem distração, em profunda oração.
• Adoração. Um tempo em que ele se focaliza intencionalmente no centro, na presença de Cristo, com um coração agradecido e humilde. Esta prática aplica-se tanto ao nível individual, quanto ao coletivo.
• Comunhão. Um tempo para celebrar a bênção dos relacionamentos com pessoas importantes, como membros da família e pessoas que estão sob a sua mentoria.
• Ministério. Um tempo para experimentar e compartilhar o amor de Deus por meio da contribuição dos dons e tarefas de liderança confiados a ele.
• Rituais de renovação. Retiros espirituais para consagração intensiva a Deus.

Neste livro iremos detalhar apenas a questão da palavra, com menor atenção aos demais tópicos.

PALAVRA

Há uma espécie raríssima no mundo de hoje que é forte candidata à extinção: o líder centrado na Bíblia.

Nunca se venderam tantas bíblias e nunca se conheceu tão pouco sobre a Bíblia como nos nossos dias.

Uma pesquisa feita sobre conhecimento bíblico em escolas dominicais revela este fato. Algumas questões foram formuladas, entre elas uma que indagava sobre quem havia escrito os evangelhos. Era uma questão de múltipla escolha e, embora muitos tenham marcado a alternativa correta, alguns assinalaram a alternativa que dizia ter sido Mateus, Marcos, Lutero e João. Outra questão que indagava a respeito de Sodoma e Gomorra foi respondida por um bom número de pessoas pela alternativa que afirmava que elas haviam sido amantes. Para a pergunta que indagava quem havia sido Acabe, várias pessoas assinalaram a alternativa que dizia que ele havia sido a mula de Balaão. À questão sobre a origem de Eva, outros responderam que ela havia se originado de uma explosão da maçã.

Isso é entristecedor porque uma geração espiritual de uma igreja local, que dura, em média, de dez a quinze anos após a conversão, não acontece no vácuo. Ela sempre se constrói sobre a anterior e altera o que aprendeu; ela preserva e inova. Dessa forma, se quisermos saber como a próxima geração espiritual da nossa igreja estará pensando a respeito das Escrituras no futuro e qual será seu nível de conhecimento da Bíblia, temos de nos perguntar o que estamos ensinando sobre isso hoje.

Cabe a nós, os líderes da geração atual, assumir esta responsabilidade de transmitir-lhes tanto o conhecimento quanto a máxima valorização das Escrituras.

Mas, antes de nos responsabilizarmos por outros, devemos nos responsabilizar por nós mesmos. Afinal, se o ministério de todo líder flui de quem ele é, sua maior responsabilidade é manter sua própria vida espiritual, para que Deus possa guiá-lo, e só então ele poderá liderar o povo de Deus.

Precisamos querer ouvir a voz de Deus. A motivação de nosso coração é fundamental aqui. Se não estivermos abertos ao controle do Espírito (Ef 5.18), nós o entristeceremos (Ef 4.30) e até poderemos apagá-lo dentro de nós (1Ts 5.19). Sem o desejo de ouvir a voz de Deus, teremos dificuldade em ouvi-la com regularidade e, eventualmente, nos confundiremos com as vozes competidoras da carne, do mundo e do inimigo.

Valorizando a Bíblia

O líder centrado na Bíblia é alguém que tem alta consideração por Deus e sua Palavra, sendo constante e pessoalmente formado por seus valores, e entendendo o propósito e o conteúdo dos livros bíblicos, de tal forma a ser capaz de aplicá-los para as situações de seu dia a dia no ministério, com o objetivo de impactar os seguidores.

Ter alta consideração pela Bíblia começa com um ponto básico: não usar o nome de Deus em vão nem fazer gozações envolvendo Cristo, os apóstolos, os personagens bíblicos ou os textos das Escrituras, pois, ao zombar da Palavra de Deus, as pessoas se lembrarão apenas das piadas e gozações que o líder fez, e não da mensagem de Deus que ele trouxe.

Parece óbvio dizer isso? Infelizmente não é.

Em 2005, a revista Time publicou um artigo a respeito do motivo pelo qual muitos jovens estão deixando as igrejas evangélicas e ligando-se às igrejas ortodoxas, marcantemente litúrgicas, que geralmente realizam cerimônias até mesmo em grego ou latim. A pesquisa revela que isso é consequência do fato de se haver tirado do povo o senso do sagrado. O povo não encontra mais um lugar que seja referência do sagrado, que possa satisfazer sua sede de um encontro com Deus e sua busca de um local para encontrá-lo. Isso ocorre em função de terem sido desvirtuados todos os valores do sagrado, entre os quais estão as Escrituras.

Duas semanas após o atentado terrorista de 11 de setembro de 2001, levei meus alunos do curso de Antropologia Cultural para uma visita de estudos a Nova York. Entre os muitos locais visitados encontrava-se a maior mesquita da cidade. Após ouvir uma palestra apresentada pelo imã, perguntei a um outro muçulmano, que ajudava aquela mesquita na qualidade de doutrinador, por que ele não considerava o cristianismo como uma opção para a sua vida. A sua resposta representa um alerta para nós, líderes cristãos, a respeito da percepção que os outros têm a nosso respeito. Ele me respondeu: "Para quê? Que espiritualidade os cristãos têm a me oferecer? Eu jejuo um dia por semana e durante todo o mês do Ramadã, oro cinco vezes ao dia e procuro ser hospitaleiro e honesto. Até aqui não vi nada na prática dos cristãos que me desafie e inspire". Que tristeza estarmos comunicando uma ideia tão negativa da nossa prática de fé!

Portanto, para mostrar a todos, e a si mesmo, que Deus e sua Palavra devem ser tidos em altíssima consideração, o líder centrado na Bíblia deve evitar qualquer profanação do sagrado, especialmente da pessoa de Cristo.

Conhecendo e vivendo a Bíblia

Após valorizar a Bíblia, o líder precisa valorizar e viver seu conteúdo. Em 2 Timóteo 2.15 lemos: "Procure apresentar-se a Deus aprovado, como obreiro que não tem do que se envergonhar e que maneja bem a palavra da verdade". Esse líder não apenas recebe a informação da Bíblia, como a utiliza para mudar sua própria vida, ou seja, um líder eficiente é aquele que vive as Escrituras e se permite ser transformado por elas. Com isso, quero dizer que uma liderança eficaz está relacionada não ao que sabemos simplesmente, mas, sobretudo, a como transformamos esse conhecimento das verdades bíblicas em ações práticas.

O mais importante não é aquilo que sei, mas sim o que faço com aquilo que sei. Devemos confiar na Bíblia e usá-la por conhecermos pessoalmente o poder transformador que ela possui. O próprio tema da liderança é uma plataforma para esse ensino, já que há muitas verdades que a Bíblia fala acerca disso. Nossa vida como líderes deve ser uma ilustração das verdades bíblicas sobre liderança — e sobre todas as demais verdades dela. Ou seja, precisamos consistentemente obedecer aos ensinos claros das Escrituras: "Porque este é o amor de Deus: que guardemos os seus mandamentos; ora, os seus mandamentos não são penosos, porque todo o que é nascido de Deus vence o mundo; e esta é a vitória que vence o mundo: a nossa fé" (1Jo 5.3-4).

A obediência aos ensinamentos claros das Escrituras é fundamental para o crescimento no relacionamento com Deus. Nós podemos conhecer a respeito dele se estudarmos a Bíblia, mas só o conheceremos de uma maneira pessoal se obedecermos aos seus mandamentos. Sem obediência, perdemos a sensibilidade para ouvir a sua voz. O líder cristão evidencia um caráter semelhante ao de Cristo, que se manifesta na vida dele pelo fruto do Espírito. A vida do líder que termina bem sua carreira é marcada pelo amor, alegria, paz, paciência, bondade, fidelidade, gentileza e autocontrole (Gl 5.22-23).

Como motivação para conhecer e viver a Bíblia, o líder tem a garantia, dada por Deus, de que ela será sua fonte eterna e inesgotável, à qual pode recorrer sempre. Isaías 40.8 diz: "A relva murcha, e as flores caem, mas a palavra de nosso Deus permanece para sempre". Esta é a garantia: a palavra de Deus não mudará, pois permanece para sempre. O líder pode construir sobre essa palavra, pois tudo passa, mas ela não.

Ele também tem a garantia de que a Palavra o aperfeiçoará, tornando seu ministério eficaz à medida que se relaciona com Deus por meio dela. Em 2 Timóteo 3.16-17, carta cujo contexto é voltado para a liderança, está escrito que: "Toda a Escritura é inspirada por Deus e útil para o ensino, para a repreensão, para a correção, para a educação na justiça".

O líder centrado na Bíblia deve acreditar na autoridade e no poder das Escrituras, sendo esse o motivo de ele usá-la em seu ministério. É ela que irá impactar seus seguidores. Quando a Bíblia é usada dessa forma, ela transforma vidas, pois o emissor da mensagem acredita, de todo o coração, naquilo que ela diz. Um indivíduo estava conversando com um amigo seu, quando, de repente, este lhe perguntou: "Você realmente acredita nessa história de um homem ter ido parar na barriga de um peixe?" O amigo lhe respondeu: "Meu amigo, até se a Bíblia dissesse que aquele peixe foi parar na barriga do homem eu acreditaria, porque, em última análise, o aceitar as Escrituras é uma questão de fé. Contudo, esta é uma fé baseada em uma experiência pessoal, e Deus tem falado comigo por meio dela".

Assim, para viver a verdade de Deus, o líder centrado na Bíblia deve entender o propósito e conteúdo de seus livros. Ele os conhece de tal forma que é capaz de aplicá-los nas situações do dia a dia. Isto não significa ser um especialista em Bíblia, pois ninguém a conhece de capa a capa, somente o Espírito de Deus. Contudo, é importante que se tenha um bom entendimento de seus livros, o que permite ao líder aplicar os seus princípios dinâmicos onde a situação assim o exigir. Mas como conhecê-la se ela é tão abrangente? É preciso criar uma rotina de meditação na Bíblia, e manter esse hábito para o resto da vida.

Criando uma rotina de meditação na Bíblia

O líder centrado na Bíblia precisa obviamente ter um tempo com Deus. Do contrário, ele não será um líder centrado na Palavra. Líderes que não terminam bem sua carreira costumam ter um ponto em comum: eles estacionam em relação ao seu estudo pessoal da Bíblia e em relação ao uso dela em seu ministério.

Um líder muito conhecido no meio evangélico brasileiro veio me visitar durante o tempo em que servi como missionário no Canadá. Em nossas conversas, ele me disse que não estava lendo mais, pois ninguém tinha mais nada a lhe ensinar. Seis meses depois, seu ministério estava acabado, em meio a rumorosos escândalos.

O estudo da educação revela, contudo, que o processo de aprendizagem não é linear. A trajetória desse processo se dá por etapas: assimilamos conhecimento, caminhamos em sentido ascendente, a mente processa esse conhecimento por um período e assim ocorre sucessivamente. Há períodos de ascensão, intercalados por outros de pausa, que são posteriormente seguidos por novos períodos de ascensão e assim sucessivamente. Para que não fiquemos estacionados em algum ponto desse processo, precisamos ter disciplina e perseverança, criando o hábito de estudar a Palavra durante toda a nossa vida. Homens e mulheres de Deus que terminam bem sua carreira lutam contra essa tendência, que todos nós possuímos, de permanecermos estacionados em algum ponto de nossa trajetória.

Para estar centrado na Bíblia, o líder precisa encontrar uma forma de ter contato constante e disciplinado com as Escrituras. Além disso, devemos pedir ao Espírito Santo para iluminar nossa mente para que entendamos o sentido específico de textos das Escrituras e o apliquemos à nossa vida (Jo 16.12-15). Tudo começa com um compromisso forte com a leitura bíblica. Líderes espirituais se abrem para a Palavra regularmente, de tal maneira que elas, usadas pelo Espírito Santo, os modelam, refinam, informam, convencem e, acima de tudo, criam neles a imagem de Cristo.

Há vários esquemas que podem ser utilizados e sugiro alterná-los, como por exemplo: duas semanas de estudo direto da Palavra e, posteriormente, duas semanas de estudo indireto, por meio de mestres e comentários sobre textos bíblicos, para que o processo não venha a se tornar muito maçante. Porém, se não adotarmos um esquema, jamais cumpriremos nossa proposta de estudar a Bíblia. Quantas vezes já começamos e depois desistimos? Isso é consequência da falta de um modelo de estudo apropriado e criativo.

À medida que começa a ler e conhecer a Bíblia, o líder pode estruturar seu conhecimento criando um núcleo básico de conhecimento da Bíblia.

Esse núcleo consiste na criação de uma lista daqueles livros da Bíblia de que você mais gosta, os seus favoritos, aqueles que você conhece melhor. A conclusão a que se chega, a partir dessa lista, é de que cerca de 70% dos estudos e sermões que o líder prepara são baseados nos livros que ele listou. São eles que constituem o seu núcleo básico, no qual ele deve se alegrar e buscar se especializar. Esse núcleo básico de conhecimento do líder, formado pela coleção de cinco a vinte livros bíblicos que são ou foram muito importantes para ele em sua própria vida, é aquele pelo qual ele sente uma obrigação, da parte de Deus, de usar com poder em seu ministério.

Esse conceito de núcleo básico é libertador porque tira do líder a obrigação de ser um profundo conhecedor da Bíblia toda, o que é extremamente difícil, mas o incentiva a ser o melhor naquilo que ele já conhece da Bíblia.

Contudo, tal núcleo não é fechado, podendo ser acrescentados novos livros quando as circunstâncias assim permitirem ou exigirem. O líder, então, se especializa nesse núcleo e recorre à ajuda de outros especialistas em relação às demais áreas que estão fora dele, embora ele deva ter um conhecimento geral delas. A meu ver, a melhor estratégia é ser um especialista naquelas áreas em que você já é forte e, ao mesmo tempo, ter um conhecimento geral das demais áreas. A importância do núcleo básico pode ser notada até mesmo pela quantidade de livros referentes a ele que a pessoa possui em sua biblioteca particular. Se a pessoa já demonstra essa inclinação, deve continuar investindo em profundidade nessa área de seu interesse, aprendendo cada vez mais.

Lembro-me de que meus discipuladores me transmitiram, quase como um imperativo, a obrigação de ler a Bíblia inteira todos os anos. Eu fiz isso por doze anos. Por volta do nono ano, comecei a passar por alto aqueles trechos que considerava mais enfadonhos. Descobri, contudo, que o que eu estava fazendo era problemático, pois aquilo que não lemos acabamos esquecendo. Hoje, tento ler a Bíblia inteira a cada três anos, para manter a familiaridade com a terminologia, com os assuntos e com os nomes. Creio ser muito importante fazer um esforço nesse sentido, para que o líder não perca a familiaridade com o material com que ele tem menor contato.

Por fim, também pode-se realizar o estudo bíblico situacional, isto é, aquele voltado para tópicos necessários ao povo de Deus em situações específicas de seu cotidiano.

Resumindo tudo o que vimos, siga a Fórmula do aprimoramento na Palavra:

1. Mantenha uma vida devocional regular;
2. Progrida em seu núcleo básico;
3. Busque familiarizar-se com os livros que não pertencem a seu núcleo básico;
4. Faça estudos situacionais.

Dos quatro ingredientes dessa fórmula de aprimoramento na Palavra, os dois primeiros (vida devocional regular e progresso no material do núcleo básico) são fundamentais, ao passo que os dois últimos (familiaridade com os demais livros e estudo situacional) são recomendados como algo necessário para o líder.

Semelhantemente, vemos que são fatores essenciais e indispensáveis que o líder cristão valorize, conheça, viva e utilize a Bíblia em seu ministério. E são fatores de apoio e expansão de sua influência sobre seus seguidores: a contextualização da Bíblia (aplicando-a à vida diária do povo e dando a ele conforto e exortação divina) e a credibilidade que o líder deve ter (comunicada por sua própria vida formatada pelos valores bíblicos). Por mais que os fatores essenciais sejam os mais importantes, sem os fatores de apoio eles não terão impacto significativo no povo. Tendo todos esses fatores combinados, o ministério do líder se expandirá.

ORAÇÃO E OUTRAS DISCIPLINAS ESPIRITUAIS

Para alcançar os objetivos de Deus para o seu povo, é preciso orar. Deus revela-se na intimidade de um relacionamento profundo. A intimidade do Senhor é para aqueles que o buscam. A oração tem que ser uma premissa básica da pessoa comprometida em liderar o povo em direção aos propósitos divinos para aquele grupo em particular. É sempre importante nos lembrarmos de que é possível ser um líder do povo de Deus sem ser um líder de Deus. Para ser um líder de Deus é necessário ser uma pessoa de integridade, o que faz da oração um componente básico do bloco de disciplinas de formação de um caráter cristão.

Henry Blackaby, autor conhecido em assuntos relacionados com a área de chamada ministerial e liderança, coloca como prioridade o compromisso firme com a oração. "Não há nenhuma possibilidade de uma pessoa ser um líder espiritual e não entender a prioridade absoluta e a urgência de ser uma pessoa de oração. Oração é um relacionamento com Deus onde, em sua presença, ele revela quem é e o que faz".

O assunto da oração talvez seja uma das maiores fontes de frustração para um grande número de cristãos. Embora as coisas devessem ser diferentes, muitos de nós falhamos mais nesta área do que em qualquer outra em nossa busca por uma vida cristã dinâmica e saudável.

Paulo também nos admoesta sobre a importância da oração (1Tm 2.1-3). Na verdade, a prática da oração deve ser o oxigênio da vida espiritual de um líder cristão. Sem ela, perdemos a intimidade com Deus e isso traz grandes reflexos negativos ao nosso caráter. Jesus, melhor do que ninguém, foi exemplo dessa prática. Sua caminhada de oração e intimidade com o Pai marcou cada um dos seus passos aqui na terra.

Richard Foster, em seu grande livro sobre o caráter cristão, nos repreende gentilmente a respeito da falta de intimidade com Deus, dizendo: "Superficialidade é a marca de nosso tempo. A doutrina da satisfação instantânea é, primariamente, um problema espiritual. A necessidade urgente dos dias atuais não é por um grupo maior de pessoas inteligentes, mas sim por pessoas que não se contentam com as fórmulas rasas e fáceis, mas vão muito mais a fundo".

Não faltam estudos de liderança cristã mostrando que aqueles que terminam bem desenvolvem um relacionamento obediente, fiel, íntimo e vibrante com Deus durante toda a vida.

A razão fundamental da necessidade de enfatizar este tópico é a realidade de que muitos discípulos, depois de uma fase inicial de entusiasmo e crescimento na fé cristã, estacionam e entram num platô constrangedor, ou até mesmo em um período de declínio na espiritualidade.

Convém, então, perguntarmos a nós mesmos como estamos indo em nosso relacionamento com Deus. Estamos estagnados? Se a resposta for positiva, quem sabe deveríamos olhar para trás e perguntar quando e quais foram as razões pelas quais estacionamos em nosso crescimento com o Senhor (Ap 2.5). Se formos honestos com nós mesmos, reconheceremos que poderíamos estar em um patamar superior ao que ocupamos hoje, principalmente nesta área do nosso relacionamento com Deus.

Aliás, um dos aspectos da oração do líder deve ser a gratidão. Um dos maiores obstáculos a uma vida bem-sucedida é a sequidão do desencorajamento, que tolhe a nossa visão em relação ao que Deus vem fazendo em nós e por meio de nós. Quando isso acontece, fazemos como Elias: nos escondemos na caverna. Portanto, desenvolver a gratidão, esta capacidade de ver Deus agindo em nossa vida e por meio de nós, é um item essencial no ministério de uma pessoa, pois alimenta a sua autoestima, bem como promove uma expectativa maior em relação ao que Deus haverá de operar na vida daqueles que ele tem colocado debaixo de sua liderança e influência.

Comunhão

Comunhão é muito mais do que isso, mas gostaria de enfatizar a importância de se ter disposição e humildade para ser mentoreado por alguém.

O processo de mentoria é relacional: uma pessoa (o mentor) transfere competência e poder para outra (o mentorando) ao compartilhar os recursos dados por Deus (tempo, conselho, sabedoria, informação, apoio emocional, proteção e oportunidades). Se lermos as biografias de líderes cristãos que terminaram bem sua carreira, veremos que a maioria deles teve, em média, de dez a quinze mentores durante o curso da vida.

Rituais de renovação

De tempos em tempos, líderes precisam experimentar o toque da renovação em seu relacionamento com Deus, o que ocorre em:

• Momentos extraordinários de intimidade com Deus.
• Momentos em que Deus dá ao líder uma nova visão de ministério, desafiando-o ou dando a ele uma prova de afirmação de seu ministério.

Como se pode ver, a renovação parte da iniciativa divina, mas devemos buscar ativa e intensamente por ela. Nos anos 1960, muitas teorias foram desenvolvidas sobre este assunto. Mary Douglas, Victor Turner e principalmente Arnold Van Gennep são nomes muito famosos no meio acadêmico de antropologia na área de análise das dinâmicas de rituais de intensificação e transformação, bem como em ritos de passagem.

De acordo com Van Gennep, rituais têm três fases: separação, liminaridade e incorporação. Na primeira fase (rituais de separação), as pessoas se retiram do grupo ou do ritmo normal de suas vidas e começam a se mover em direção a um outro local ou estado temporário e transitório, que ele chama de "limbo". É como separar uma semana para um retiro espiritual. A segunda fase (rituais de intensificação) é marcada pela enfatização e intensificação dos valores do grupo, o que gera uma transformação do indivíduo para um nível mais elevado de entusiasmo e envolvimento. É como ir a uma viagem, acampamento ou congresso, o que tira o líder do contexto da igreja e o leva para outra realidade, da qual volta diferente, com suas convicções renovadas e fortalecidas. Na terceira fase (rituais de transformação), as pessoas entram novamente na sociedade, tendo completado o rito, mas agora surge uma nova realidade em sua vida. É como no baile de debutante ou no casamento, em que a pessoa entra com um estado e sai com outro.

Mark Virkler descreve esses rituais com base em Habacuque 2.1-3. Para ele, primeiro deve haver o aquietar da alma, que consiste na ida a um lugar tranquilo, aquietando as nossas emoções e pensamentos, para que possamos ouvir a voz de Deus. Esse aquietar da alma não implica em abandonar ou negar a nossa capacidade cognitiva e as nossas emoções. Implica, sim, em submetê-las intencionalmente a Deus, de tal maneira que não interfiram com nossa comunicação com ele. Em seguida, acontece a visão espiritual, isto é, a focalização do nosso coração (mente, emoções e vontade) em Cristo, com a intenção de ver as coisas e as situações como Jesus as vê.

Durante esse processo, visões, novas ideias e sonhos podem ocorrer. No entanto, tais visões, novas ideias e sonhos não vêm, necessariamente, de Deus. Por isso, precisam ser analisados à luz da Palavra de Deus, não podendo nunca contradizer seus ensinos na Bíblia. Afinal, o Espírito Santo sempre revela as aplicações da verdade de forma consistente com as Escrituras e com a pessoa de Cristo. Por fim, Virkler sugere escrever um diário de nossa comunicação com Deus.

Tais rituais de renovação são essenciais para o ministério. Ao separar um tempo para refrigério, a pessoa experimentará uma intensificação de suas convicções. Como consequência adicional, ela quebrará um dos paradigmas que dominam o mundo contemporâneo, onde a espiritualidade é entendida como ativismo, como agenda cheia.

Os rituais reanimam, motivam e reavivam as pessoas. Contudo, essa motivação não dura muito. Em média, o período de manutenção do entusiasmo prolonga-se por duas semanas após o ritual. Daí em diante existe a necessidade constante destes tempos de renovação, que devem alcançar todas as áreas de nossa vida: pessoal, familiar e ministerial. Tais tempos de renovação precisam da companhia indispensável de um processo bem elaborado de acompanhamento dos indivíduos afetados pelas dinâmicas abençoadoras dos rituais.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Centrando-se em Deus (perguntas do capítulo)
  -- São reflexões (tipo='reflexao'): não bloqueiam o avanço e
  -- ficam disponíveis para devolutiva pastoral do líder.
  -- Idempotente: só insere se a aula ainda não tiver atividades.
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Avalie o tempo que você dedica à oração e à busca por orientação divina em sua liderança. Está satisfeito com isso? Como pode melhorar?',
     'reflexao', null),
    (v_aula_id, 2,
     'Escolha uma situação em que você esteja enfrentando dificuldades e busque a orientação de Deus de maneira intencional antes de tomar qualquer decisão. Registre aqui o que percebeu nesse processo.',
     'reflexao', null),
    (v_aula_id, 3,
     'Crie uma rotina semanal de momentos de solitude e oração, dedicando tempo para ouvir a Deus sobre sua liderança. Descreva como ficou essa rotina.',
     'reflexao', null);
  end if;
end
$migration$;
