-- =============================================================
-- Curso: Liderança com Propósitos (Rick Warren) — aulas (a casca do curso veio na migration 107)
-- Transcrição do livro na íntegra, dividida por capítulo na ordem
-- de leitura. As atividades de cada aula são perguntas de reflexão
-- (tipo='reflexao') elaboradas a partir do conteúdo do capítulo —
-- não bloqueiam o avanço e ficam disponíveis para devolutiva
-- pastoral. Cabeçalhos de seção em CAIXA ALTA renderizam como
-- títulos (ver ehTitulo() em components/AulaConteudo.tsx).
--
-- Idempotente: pode ser reaplicada sem duplicar curso/aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos
  where slug = 'lideranca-com-propositos';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values (
      'lideranca-com-propositos',
      'Liderança com Propósitos',
      'Estudo guiado a partir de Liderança com Propósitos, de Rick Warren, que extrai da vida de Neemias — o homem que reconstruiu os muros de Jerusalém em 52 dias — os princípios eficazes para o líder no século XXI. A cada capítulo, um princípio da liderança: como um líder se forma, ora, planeja, motiva, organiza um projeto, enfrenta opositores, resolve conflitos, vence as tentações do poder, descobre os segredos dos bem-sucedidos e sustenta o sucesso ao longo do tempo, até liderar ao estilo de Jesus. Cada aula traz o capítulo na íntegra e, ao final, perguntas de reflexão para você examinar a própria liderança.',
      '/api/og/curso/lideranca-com-propositos',
      false,
      0,
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 1 — A formação de um líder  (aula ordem = 1)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 1;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 1 — A formação de um líder$t$,
      1,
$conteudo$... a ordem se mantém com um líder sábio e sensato.1 Por causa da transgressão da terra, [...] mas por um, sábio e prudente, se faz estável a sua ordem.2 Uma liderança boa e forte: isto e o de que mais precisa o mundo de hoje. Para qualquer lugar que olhemos — desde nossos governos até nossos negócios, vizinhanças e lares —, encontramo-nos rodeados pelos devastadores resultados da instabilidade, da indecisão e da corrupção. Com o grande aumento de livros e seminários sobre liderança, talvez você se surpreenda com a notícia de que os segredos de uma liderança de excelência não são novos. De fato, nós os encontramos ao longo de toda a Bíblia. Neemias, um homem que viveu por volta do ano 450 a.C, e a inspiração para este livro. Escreveu sobre todos os elementos da liderança de que precisamos hoje e deu exemplo deles. Inclusive o fez anos antes de se inventarem os seminários sobre liderança. No entanto, Neemias não é o único exemplo dos princípios de liderança que a Bíblia ensina. A Bíblia nos fala dos benefícios produzidos por uma liderança boa e sólida: ... a ordem se mantém com um líder sábio e sensato.3

Observe, em particular, que a Palavra fala de um governante sábio e de uma ordem que permanece. As nações, as famílias, os negócios e as igrejas são fortes e permanecem somente quando existe uma boa liderança. A versão Almeida Revista e Atualizada diz: "... por um, sábio e prudente, se faz estável a sua ordem". Em meio a tanta comoção e mudanças repentinas que vivemos hoje, a estabilidade tem de ser o pontal que nos permite sobreviver como sociedade. Só por 1 Provérbios 28.2 2 Provérbios 28.2, ARA 3 Provérbios 28.2 meio de uma liderança boa e firme acharemos estabilidade. Isso significa que precisaremos de mais pessoas dispostas a se reconhecerem como líderes, e prontas para aprender princípios bíblicos de liderança, aceitando também o desafio. Essa e a razão por que escrevi este livro.

Na pirâmide da liderança, produz-se estabilidade quando o número de líderes aumenta de acordo com o aumento das tarefas correspondentes. Se as tarefas excedem o número de líderes, a pirâmide e derrubada. Com os princípios que examinaremos neste livro, você aprendera a forma de impedir que o esmaguem. Neemias será o nosso guia neste emocionante percurso dentro dos princípios de liderança. Neste primeiro capitulo, vamos ver seu contexto pessoal. Antes, porem, quero explicar o que me motivou a escrever este livro. E o que chamo de "os princípios de liderança de Warren". 1. Nada acontece até que haja um líder E uma lei da vida. A história o demonstra. Enquanto não apareceu um homem chamado Martin Luther King e disse "Tenho um sonho", o movimento dos Direitos Civis dos Estados Unidos não era nada. O programa espacial da NASA quase não existia até que o presidente John E Kennedy disse: "Vamos colocar um homem na lua antes que ter-mine esta década". Quando um homem chamado Ray Crock disse: "Quero comida rápida, a bom preço e em um ambiente limpo", nasceu toda uma indústria chamada "fast food". A igreja Saddleback começou porque Deus me disse: "Rick, quero que seja líder e ponha isto em marcha".

Quando há problemas em sua família, nada acontece até que alguém assuma a liderança e diga: "Vamos fazer algo a respeito disso".

Tudo se edifica ou se derruba conforme a liderança. Ao longo da historia, e inclusive no mundo atual, a maioria dos problemas acontece pela falta de líderes competentes. O mundo precisa de líderes preparados. No livro de Juízes, encontramos sete ciclos. Um dia, as coisas iam bem e a vida tinha um aspecto razoável; mas no dia seguinte, tudo ia abaixo. Vemos que este esquema se repetia constantemente. No ultimo versículo do livro de Juízes, temos o seguinte resumo: "Naquela época não havia rei em Israel; cada um fazia o que lhe parecia certo".4

Onde não há líderes, as pessoas fazem "o que lhes parece certo". E a conseqüência disto e a instabilidade.

2. Liderança e influência Em uma só palavra: liderança e influencia, para o bem ou para o mal. Se alguma vez você visitou o pátio de uma escola, ou se sentou com um grupo de adolescentes, em cinco minutos você descobre quem são os líderes; basta ver como se relacionam entre si. Se você esteve alguma vez numa reunião de comitê, e provável que tenha descoberto que muitas vezes o líder não é o presidente do comitê. O líder e a pessoa para quem todos ficam olhando a fim de averiguar o que ela pensa. Cada vez que influenciamos outra pessoa estamos assumindo a liderança. O apostolo Paulo compreendia isso. Sabia que havia se tornado um modelo para os demais crentes. Paulo entendia que Timóteo o admirava e queria que, enquanto recebia sua influencia, este influenciasse outros. Por isso escreveu em I Timóteo 4.12: "ninguém o despreze pelo fato de você ser jovem, mas seja um exemplo para os fieis...". A liderança não é uma questão de idade. A idade não tem nada a ver com a liderança. Em qualquer idade podemos exercer influencia e o certo e que você é um modelo, queira ou não. Todos somos líderes em algum aspecto. Cada vez que influencia uma pessoa, você esta assumindo a liderança. Portanto, a questão não é se você e ou não líder. A pergunta e: você e um bom líder? A Bíblia define o líder como alguém que tem capacidade dada por Deus e a responsabilidade de influenciar um grupo de crentes a fim de que os propósitos de Deus para esse grupo sejam cumpridos. Neemias e um dos exemplos de liderança mais destacados na Bíblia: Por quê?

• Porque era um verdadeiro líder.

• Porque compreendia o que um líder precisava ser e

fazer.

• Porque organizou-se para realizar proezas incríveis

em tempo recorde. 4 Juízes 21.25 3. A prova da liderança e esta: "Alguém esta seguindo você?" Se você quer saber se e líder ou não, precisa apenas olhar para trás por cima do ombro. Alguém segue você? Jesus disse: "As minhas ovelhas ouvem a minha voz; eu as conheço e elas me seguem".5 Paulo disse: "Tornem-se meus imitadores, como eu sou de Cristo".6 Não há dúvidas de que os cristãos devem seguir a Cristo. E certo também que todos precisam de modelos humanos para seguir. Precisam ver nos outros que aspecto há em sua liderança. John Maxwell nos oferece esta parábola a respeito de liderança: "quem pensa estar guiando, sem ninguém que o siga, esta apenas dando um passeio". A liderança não é questão de títulos ou de postos. E questão de influencia. A maior parte de nós tende a associar títulos à liderança. E um erro. Há uma grande diferença entre ser chefe e ser líder. Ser líder e mais do que possuir um cargo ou um título. São muitas as pessoas com autoridade que não possuem liderança. O verdadeiro líder nem sempre é o funcionário escolhido ou o que e promovido ao cargo de presidente. Os verdadeiros líderes são os que marcam o passo, os que influenciam, os criativos que solucionam os problemas. Uma pista: se você precisa dizer às pessoas que é o líder, se você precisa lembrar-lhes isso, você não é líder. Liderança e influencia. Se você não esta influenciando ninguém, não importa se você pensa que e líder ou não. Você não é um líder. A liderança e questão de influencia. Isto e assim, inclusive nos lares. Quando um esposo diz para sua esposa: "Vamos fazer assim, porque eu sou o líder espiritual", ele não é quem diz ser. Se você é um verdadeiro líder, não precisa lembrar isso a ninguém. Dizer para o seu filho que lhe obedeça "porque eu disse" e uma posição muito fraca para motivá-lo. Qualquer pai diria para você, que no futuro, essa tendência não funcionara. A prova de liderança e esta: alguém esta seguindo você? Faca o que fizer, você não pode forçar ninguém a segui-lo. Você tem de inspirar as pessoas para que o sigam!

4. O fundamento da liderança e o caráter, e não o carisma

E provável que você tenha visto um bom numero de líderes com muito carisma, cujos Ministérios não duraram muito porque 5 João 10.27 6 1Coríntios 11.1 careceram de caráter. De fato, alguns líderes têm demonstrado grandes defeitos de caráter. Seu encanto pessoal os tem sustentado durante algum tempo, mas, no fim, manifesta-se nele a falta de caráter.

O fundamento da liderança não é o carisma pessoal; e o caráter. O carisma não tem nada a ver com o que torna um líder eficaz. A liderança não tem a ver com uma personalidade encantadora e chamativa, um grande sorriso ou uma voz de veludo. O que você precisa, na verdade, e de caráter e credibilidade. A liderança e influencia, e sem credibilidade sua influencia não ira muito longe. Talvez as pessoas o sigam por um tempo, mas não demora para que percebam que você esta num caminho que não leva a lugar nenhum. Reputação e o que as pessoas dizem que você é. Caráter e o que você realmente é. D. L. Moody dizia: "O caráter e o que somos em meio da escuridão, quando ninguém esta nos olhando". Em sua carta a Timóteo, Paulo apresenta as características necessárias para o líder na igreja. Nenhuma só vez ele menciona que sejam necessários estudos de seminário. A liderança não se baseia no preparo acadêmico. E questão de caráter, e uma questão de quem você é. Não há um tipo de personalidade concreto para os líderes. Talvez você tenha ouvido dizer, no passado, que os líderes são pessoas de temperamento colérico, ou pessoas que tomam conta das situações. Há, entretanto, líderes de todas as formas, de todos os tamanhos e de todos os temperamentos. Deus quer usar a sua personalidade, tal como ele mesmo a criou. Observe os quatro temperamentos diferentes dos líderes que vemos na Bíblia: Paulo era colérico Pedro era sanguíneo Moisés era melancólico Abraão era fleumático Cada um deles era único, e totalmente diferente dos outros. E Deus usou a todos. A liderança não é uma questão de personalidade. não é necessário que você seja extrovertido, sanguíneo ou colérico para ser líder. O que, de fato, e necessário para liderança e o caráter. E a única coisa que todos os grandes líderes têm em comum. Quando uma pessoa carente de caráter chega a um cargo de liderança, esses defeitos de caráter causam sua queda. Todos já vimos isso acontecer. Neemias era um homem comum, fez coisas extraordinárias para Deus porque tinha caráter. Esse é o homem que descobriremos quando estudarmos sua vida. À guisa de examinar as ações e os exemplos de outros líderes, podemos aprender com eles. No entanto, não podemos imitar a personalidade do outro, Deus nos criou com uma forma única. Quando tentamos imitar alguém, somos consumidos. Assim como as pessoas são diferentes, os líderes também o são. Sua identidade esta formada pela credibilidade e o caráter. A seguinte passagem nos mostra três características dos bons líderes:

• Tem uma mensagem digna de ser lembrada

"Lembrem-se dos seus líderes, que lhes falaram a palavra de Deus. Observem bem o resultado da vida que tiveram e imitem a sua fé." Quando eles falam, as pessoas escutam. Você fala de tal maneira, que deixa marcas no coração das pessoas?

• Tem um estilo de vida digno de consideração

"Observem bem o resultado da vida." A vida deles esta de acordo com sua mensagem? E a sua? Você vive de tal maneira, que deseja ser estimado pelos outros?

• Tem uma fé digna de ser imitada

"Imitem a sua fé". Qual e a mensagem da sua vida? O que Deus quer dizer ao mundo por meio da sua vida? Se você quer ser um bom líder, precisa desenvolver uma mensagem digna de ser lembrada, levar um estilo de vida digno de ser considerado e ter uma fé digna de ser imitada. Todas essas coisas pertencem ao caráter. 5. A liderança pode ser aprendida Todos nós temos potencial para chegar a ser grandes líderes. A Bíblia diz: "Ponham em pratica tudo 8o que vocês aprenderam, receberam, ouviram e viram em mim". Paulo esta dizendo: "os líderes não nascem, fazem-se". Aprendemos a ser líderes. Não existem líderes natos. As pessoas se convertem em líderes pela forma com que respondem as circunstancias. Os líderes se levantam ou caem segundo as decisões que tomam. O Ministério de Jesus reflete a alta prioridade que ele dava ao treinamento de líderes. A Palavra nos mostra: "Escolheu doze, designando-os apóstolos, para que estivessem com ele, os enviasse a pregar..." Jesus tinha um ministério publico que compreendia a pregação, o ensino e a cura. Tinha também um Ministério privado, dedicado ao treinamento dos discípulos. Você já encontrou líderes que tem um círculo intimo de uns poucos escolhidos, que passam mais tempo em sua companhia? até Jesus teve um círculo intimo de discípulos que dele recebia uma 7 Hebreus 13.7 8 Filipenses 4.9 atenção especial. Pedro, Tiago e João, foram escolhidos por ele para que o acompanhassem até o jardim do Getsêmani e ao monte da Transfiguração. Jesus sabia antecipadamente as decisões que eles tomariam, e sabia o que podia lhes pedir. Em Gálatas, Paulo diz que Pedro, Tiago e João são as colunas da igreja. Jesus investiu o máximo de tempo naqueles que carregariam o máximo de responsabilidades. Alimentou as multidões, mas passou a maior parte de seu tempo dedicando-se a treinar líderes, porque a liderança pode ser aprendida. Você esta investindo tempo em aprender a ser líder? Já que você esta lendo esse livro, pode responder que sim. Agora, o que vai acontecer quando você terminar a leitura? O que mais você esta acrescentando a sua agenda para certificar-se de que você esta aplicando esses princípios a sua realidade diária? No momento em que deixarmos de aprender, deixaremos de ser líderes. Quando um líder deixa de aprender, deixa também de ser líder. Para sermos eficazes, precisamos nos desenvolver, crescer e converter continua-mente ao que Deus quer que sejamos. O aprendizado para ser líder leva toda uma vida. Não digo isso para desanimá-lo, mas para inspirá-lo a buscar sempre formas de melhorar. Quando estudarmos a vida de Neemias nos próximos capítulos, veremos como Deus o preparou e o usou, e como usou a vida das pessoas as quais ele ensinou.

Se o machado está cego e sua lamina não foi afiada, é preciso golpear com mais força; agir com sabedoria assegura o sucesso.9

É necessário mais energia para cortar lenha com um machado que não está afiado que com um machado afiado. Precisamos aprender a trabalhar com mais inteligência, não com maior esforço. As pessoas dizem que o trabalho duro e o que leva ao sucesso, Eu conheço muitas pessoas que trabalham duro e, no entanto, não tem sucesso porque não aprenderam a trabalhar com maior inteligência. Tudo o que fazem e trabalhar esforçadamente. O fato de você estar lendo este livro e examinando estas lições tiradas de Neemias diz mais a respeito de você do que a respeito do autor. Diz que você esta interessado em aprender a ser líder. A pessoa que pensa que já sabe tudo o que precisava saber vai ficar para trás. O que diz: "preciso aprender, preciso crescer" e o que vai ter sucesso. Há uma razão especial pela qual Deus colocou este livro em suas mãos. O fato de você o estar lendo agora e evidencia de que o Senhor tem um propósito para sua vida. Formou você para ser líder. Ele quer que você influencie a vida dos outros. Vejamos... 9 Eclesiastes 10.10

O CONTEXTO HISTÓRICO DE NEEMIAS

A cidade de Jerusalém foi destruída no ano 586 a.C. Os judeus que viviam ali foram deportados para Babilônia (hoje, Iraque). Deviam estar no cativeiro durante 70 anos, mas, no ano 537, foi permitido que um primeiro grupo retornasse. No ano 516, o templo de Jerusalém foi reconstruído. Esdras foi o líder do segundo grupo de judeus que regressou a Jerusalém em 458. Logo, em 445, Neemias pediu autorização para voltar a Jerusalém com um terceiro grupo, a fim de reconstruir os muros da cidade. Naqueles dias, as cidades eram protegidas pelos muros que as rodeavam. Se um inimigo atacava a cidade, poderia levar até seis meses para abrir espaço e entrar, graças a esses muros. Quando Neemias entrou em cena, os muros de Jerusalém já estavam destruídos há décadas. Já naquela época, os judeus viveram em cativeiro na Babilônia durante algum tempo. Finalmente, foi permitido que retornassem, pouco a pouco, e, depois, que reconstruíssem o templo. A cidade, porem, continuava em ruínas e os muros, um monte de escombros. Isso criava dois grandes problemas: I — Os habitantes estavam indefesos Sem proteção, os habitantes de Jerusalém eram vulneráveis diante dos ataques e das provocações. Ao se verem indefesos, sentiam-se também desanimados e derrotados. Quando um exército entrava em uma cidade e se apoderava dela, a primeira coisa que se fazia era destruir seus muros. Era um símbolo da derrota e do desamparo. Com seus muros destruídos, Jerusalém era uma desonra para o povo de Deus. Era como uma declaração: "Deus os abandonou". Muitos deles criam que Deus havia feito isso. Afinal de contas, o cativeiro de Israel era conseqüência de sua desobediência. Deus havia dito: "Se não passarem a se comportar como povo escolhido que são, permitirei que uma nação inimiga invada sua cidade". O povo não se comportou como era devido, de maneira que Deus permitiu a entrada da nação inimiga. Ele cumpre o que promete. Agora estavam de volta e até tinham reconstruído o templo. Estavam vivendo em meio aos escombros, sua moral estava no chão, sentiam-se derrotados, desalentados e deprimidos. Como e natural, criam que Deus continuava aborrecido com eles. O que faria falta num momento como aquele? Um líder. Aqui entra em cena Neemias. Palavras de Neemias, filho de Hacalias: No mês de quisleu, no vigésimo ano, enquanto eu estava na cidade de Susã, Hanani, um dos meus irmãos, veio de Judá com alguns outros homens, e eu lhes perguntei acerca dos judeus que restaram, os sobreviventes do cativeiro, e também sobre Jerusalém. E eles me responderam: "Aqueles que sobreviveram ao cativeiro e estão lá na província passam por grande sofrimento e humilhação. O muro de Jerusalém foi derrubado, e suas portas foram destruídas pelo fogo". Quando ouvi essas coisas, sentei-me e chorei. Passei dias lamentando-me, jejuando e orando ao Deus dos céus.10 O que estamos lendo aqui e o diário de Neemias. E a sua historia, escrita por ele mesmo. Nas suas palavras, lemos como ele conseguiu a permissão de um rei estrangeiro — um homem que não era crente — para voltar a Jerusalém e reconstruir seus muros. Aquele era o mesmo rei que, quando, pela primeira vez, os judeus intentaram reconstruir o muro, havia ordenado que não o fizessem. Talvez você já tenha passado pela experiência de tentar mudar a maneira de pensar de alguém depois que negou com grande firmeza o que você pediu. não é fácil! Neemias fez com que isso acontecesse. Nesse notável diário pessoal, vamos encontrar o interior desse líder. "Enquanto eu estava na cidade de Susã..." Susã não era a capital do império Persa; era uma espécie de palácio de veraneio. Neemias nos diz: "nessa época eu era o copeiro do rei". Assim ele ganhava a vida. Esse era ele, um copeiro. No Antigo Testamento, esse rei e conhecido por três nomes diferentes. Em alguns lugares, ele e chamado "Artaxerxes", que significa "grande rei". Em outros, e chamado "Azaras", que significa "pai venerável". No livro de Daniel, ele tem o nome de "Dario, o medo". Isso nos diz algo sobre a forma com que os povos tratavam seus governantes naqueles dias, já que um só homem era conhecido por três nomes diferentes. E provável que, por ser copeiro do rei, Neemias ocupasse o segundo cargo em importância dentro do reino. O copeiro do rei era uma combinação do primeiro ministro, guarda-costas, agente pessoal de segurança e ajudante do rei. Era a pessoa na qual o rei mais confiava. O título de Neemias se origina, em parte, de suas responsabilidades que incluíam a obrigação de provar o vinho antes que o rei o bebesse, para assegurar-se de que não estava envenenado. Naqueles dias, as tentativas de assassinato eram coisa comum. Se o copeiro caísse, o rei saberia que se tratava, muito provavelmente, de algo mais que um simples vinho em mal estado. Havia muitas pessoas que não gostavam de Artaxerxes e, assim, a profissão de Neemias era muito perigosa. Neemias tinha de ser totalmente leal e digno de confiança, e 10 Neemias 1:1-4 Artaxerxes lhe confiava a própria vida. Ainda que seja provável que Neemias tenha nascido na Babilônia durante o cativeiro, ele não era persa; no entanto, ocupava o segundo posto em autoridade c era uma grande figura dentro do governo persa. Deus sempre tem sua maneira de colocar seu povo na posição necessária e no momento precise Hanani, um dos irmãos de Neemias, acabava de voltar da uma viagem a Jerusalém. Visto que Jerusalém esta a uma distancia de 1.300 a 1.600 quilômetros de Susã, e provável que ele tivesse levado uns dois meses nessa viagem sobre lombos de camelo, atravessando o deserto uma viagem nada fácil. Neemias pediu noticias a Hanani. Queria saber tudo o que estava acontecendo a sua família em Jerusalém. "Só trago más notícias", disse-lhe Hanani. "O povo esta deprimido, nossos parentes estão desalentados e os muros continuam caídos. Reconstruíram o templo, mas toda a cidade esta em ruínas. estão invadindo a cidade e o povo está realmente desalentado. Mas notícias, irmão!". No versículo 4, vemos a reação de Neemias: "Quando ouvi essas coisas, sentei-me e chorei. Passei dias lamentando-me, jejuando e orando ao Deus” Neemias se sente triste com as noticias e envergonhado pelo povo de Deus. Nos versículos seguintes, leremos sua oração. Veremos também que Jeremias não orou apenas uma hora ou apenas um dia. As Escrituras dizem que ele ouviu as noticias no mês de quisleu e foi no mês de nisã quando o rei o deixou ir. Havia orado, chorado, jejuado e lamentado durante quatro meses. E claro que levou a serio aquelas notícias, e que as guardava no mais profundo do coração. Neemias e homem de oração. Em seu diário lemos onze orações; mais que em qualquer outro livro da Bíblia. Por que você acha que Deus o escolheu para ser líder? Teria sido em virtude da sua vida de oração?

• Por que Deus escolheu a Neemias como líder?

Entre todas as pessoas possíveis, por que Deus escolheu a Neemias, o copeiro de um rei pagão? Há três razões para isso: Vejamos...

II — Neemias era sensível diante das necessidades que via ao seu redor Deus viu o coração de Neemias, e o que ele viu o fez sorrir. Neemias era um homem que se importava com o que Deus se importava. Ele tinha uma vida boa na Babilônia. Sim, era judeu, mas havia nascido ali na Babilônia, durante o cativeiro. Nem sequer havia visto Jerusalém. Os problemas de Jerusalém pareciam estar a um milhão de quilômetros de distancia. Quando, porem, ouviu falar do povo de Deus — deprimido, desalentado e der-rotado — ele levou a serio essas notícias. Os líderes são sensíveis diante das necessidades das pessoas que os rodeiam. Este é o primeiro Princípio de liderança que encontramos no livro de Neemias. Deus usa pessoas que se importam com o que Deus se importa. Para Deus, era importante o fato de os muros de Jerusalém estarem caídos. Neemias se importou com o que Deus se importou, e isto fez dele um líder. Bob Pierce, o fundador da Visão Mundial, dizia: "Quero que meu coração se quebrante diante das mesmas coisas que quebrantam o coração de Deus". A primeira qualidade de um grande líder e a sua sensibilidade diante das necessidades que estão ao seu redor. III — Neemias era digno de confiança Neemias era um homem de boa reputação. Artaxerxes lhe confiou sua segurança pessoal. Isso significa um grau muito alto de confiança. Deus usa pessoas que sejam dignas de confiança, seguras e fieis. Quem e fiel no pouco, também e fiel no muito, e quem e desonesto no pouco, também e desonesto no muito. Assim, se vocês não forem dignos de confiança em lidar com as riquezas deste mundo ímpio, quem lhes confiara as verdadeiras riquezas? E se vocês não forem dignos de confiança em relação ao que e dos outros, quem lhes dará o que e de vocês? Nenhum servo pode servir a dois senhores; pois odiara um e amara outro, ou se dedicara a11um e desprezara outro. Vocês não podem servir a Deus e ao Dinheiro. Lucas apresenta quatro formas pelas quais Deus prova nossa fidelidade. Uma delas consiste em observar como servimos no Ministério liderado por outra pessoa. Antes de nos confiar um Ministério próprio, ele quer ver como nos comportamos diante da liderança de outra pessoa. Outra das formas tem a ver com a administração de nossas finanças. A Bíblia indica com clareza que nosso estilo pessoal na administração do dinheiro determina o quanto Deus pode abençoar nossa vida. Se as riquezas terrenas não podem ser confiadas a nós, quem vai nos confiar os verdadeiros tesouros espirituais? 11 Lucas 16:10-13

Até que ponto você quer que Deus o abençoe? A decisão e sua. Peca-lhe que o faça digno de confiança e generoso, assim como ele mesmo e digno de confiança e generoso

IV — Neemias era disposto Quando houve necessidade de um líder, Neemias disse: "Eu me ofereço! Aqui estou; envia-me a mim!". Ele tinha o cargo mais invejável de todo o reino, e o problema estava a 1.600 quilômetros de distancia. Levaria meses para chegar ali de camelo. Para Neemias, teria sido muito mais fácil permanecer onde estava, levando a vida fácil do palácio. Ele, porém, disse: "Eu vou! não sou construtor, mas vou reconstruir os muros!". Não tinha as habilidades necessárias para esse trabalho, mas tinha um coração disponível. Deus o escolheu porque era sensível e de confiança, e se colocou a sua disposição. Deus não busca nos líderes capacidade tanto quanto busca a credibilidade, a confiabilidade e a disponibilidade. Essas qualidades são, todas elas, questão de decisão. Talvez você diga: "Eu não tenho esses dons, o talento ou o intelecto necessário". No entanto, não é essa a pergunta que Deus esta fazendo a você. Deus quer saber:

• Ele pode acreditar em você? Você tem caráter?

• Seu caráter esta sendo desenvolvido?

• Você e sensível com as pessoas?

• Você e digno de confiança?

• Deus pode se apoiar em você?

• Você está disposto?

Nada acontece enquanto não houver quem providencie uma liderança para executar. Tudo pode ser edificado ou destruído de acordo com os líderes. Deus quer usá-lo como líder em seu lar, seu negocio ou sua igreja. Você esta disposto a deixar que Deus o use? Você está pronto para a liderança?

REFLEXÕES SOBRE LIDERANÇA

Vamos refletir...

• Você e sensível diante das necessidades que vê ao seu

redor, ou se encontra tão envolvido com o que esta fazendo, que

não pode escutar a voz de Deus?

• Você esta consciente das necessidades que os membros de

sua família tem?

• Você esta consciente das necessidades de seus

companheiros de trabalho?

• Você esta consciente das maiores necessidades de sua

igreja?

• Você poderia mencionar essas necessidades?

• O que comove seu coração?

• Você e confiavel?

• Você e digno de confiança?

• Você está disposto?

Deus meu, quero estar disposto a deixar que tu me uses no

lugar, no momento e da forma que tu quiseres.

Se você diz estas palavras com sinceridade, Deus vai usá-lo. E quando você deixar que Deus o use, Ele o fara em grande medida. Nestes dias em que as pessoas estão buscando esportes radicais e adrenalina, não há emoção maior que a de nos deixar ser usados por Deus para o seu Reino

Pai, pedimos-te que nós sintamos desafiados pela vida de Neemias

quando estudarmos sobre esse homem. Os princípios têm milhares de anos,

mas aplicam-se hoje em nossa vida agitada. Senhor, queremos ser sensíveis e

dignos de confiança, e nos colocamos a tua disposição. No nome de Jesus.

Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 1

A formação de um líder Aplicando os propósitos de Deus

Como você poderia ser um líder a serviço do Senhor? Comunhão — Como cristãos, não podemos sobreviver sozinhos. Precisamos de pessoas que pensem como nós para crescer e prosperar. Os pastores e líderes, especialmente, precisam do apoio de seus amigos para seguir em frente. Uma célula pode fazer uma grande diferença no desenvolvimento de sua vida espiritual.

• Você faz parte de uma célula, ou tem um amigo de

confiança?

• Como você pode ajudar outros membros do corpo de

Cristo a se tornarem líderes capacitados?

• Existe alguém em seu grupo ou igreja a quem você

pode apoiar em seu crescimento espiritual?

Discipulado — Aprender a ser um líder eficaz requer aprender a ser mais como Cristo.

• De que maneira você esta se desenvolvendo como

discípulo de Cristo ao estudar esta lição?

• O que mais você pode fazer para se assegurar que esta

aperfeiçoando suas habilidades como líder?

• Lembre-se de que o exemplo de Cristo e servir a

outros.

• A liderança requer maturidade, a maturidade

necessária para entender que você não deve esperar as condições

adequadas. Comece de onde esta.

• Onde você acredita que Deus necessita de sua

liderança?

• Escreva o que você pensa. Qual será o próximo

passo?

Ministério — Onde quer que interajamos no corpo de Cristo, de alguma forma nós ministramos uns aos outros.

• Que propósito você acredita que Deus quer alcançar por

meio do seu grupo?

• Como Deus quer usar você para alcançar seu propósito?

• Que passos você pode dar para tomar consciência do

exemplo que deve ser para outros cristãos? Anote as

possibilidades que Deus lhe está sugerindo.

• Procure transformar-se em uma influencia para o bem.

Evangelismo — Quando influenciamos outros para Cristo, nós nos tornamos, de fato, suas mãos e seus pés. Jesus passou seu tempo aqui treinando outros para que fossem como ele e pregassem seu exemplo quando seu tempo houvesse terminado.

• O que você aprendeu de Jesus que pode aplicar na

atualidade para alcançar o mundo para ele? Faca uma lista dos

momentos da sua vida nos quais sentiu a presença de Jesus de

maneira especial. Essas são as áreas na quais ele quer usá-lo para

alcançar outros.

• Pense em um líder que você conhece e que tem sido Jesus em "carne e osso". Pense em como essa pessoa o influenciou em sua decisão de seguir Cristo de perto.

• Planeje converter suas ações em exemplos que permitam alcançar os que você quer alcançar.

• Decida conduzir as pessoas a Cristo por meio do seu exemplo— não as afugente.

Adoração — Quando adoramos a Deus, aprendemos mais a respeito do que ele é.

• Como o tempo que você separa diariamente para adoração pode influenciar seu caráter?

• O que você pode acrescentar em seu tempo de adoração para alcançar uma mudança em sua vida e na dos outros?

• Separe uns momentos para agradecer a Deus por seu exemplo e peça que ele o ajude a ser mais como ele é.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Warren afirma que o fundamento da liderança não é o carisma, mas o caráter, e cita D. L. Moody: 'o caráter é o que somos na escuridão, quando ninguém está nos olhando'. Pensando na sua liderança hoje, em que área específica há uma distância entre a sua reputação (o que dizem que você é) e o seu caráter (o que você realmente é) que Deus está pedindo para você ajustar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Deus escolheu Neemias não pela sua capacidade técnica (ele era copeiro, não construtor), mas porque era sensível às necessidades à sua volta, digno de confiança e disposto. Olhando para a sua família, seu trabalho e sua igreja, qual necessidade ao seu redor tem realmente quebrantado o seu coração a ponto de você se dispor a agir, como Bob Pierce pedia: 'que meu coração se quebrante diante das mesmas coisas que quebrantam o coração de Deus'?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O capítulo insiste que a prova da liderança é 'alguém está seguindo você?' e que liderança é influência, não título nem cargo. Em que esfera da sua vida você tem se apoiado no título ('porque eu sou o líder', 'porque eu disse') em vez de inspirar as pessoas a o seguirem, e o que precisaria mudar para liderar de fato pela influência?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 2 — A oração de um líder  (aula ordem = 2)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 2;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 2 — A oração de um líder$t$,
      2,
$conteudo$Procurei entre eles um homem que erguesse o muro e se pusesse na brecha diante de mim e em favor desta terra, para que eu não a destruísse, mas não encontrei nenhum.' Se fosse realizada uma pesquisa para descobrir as causas secretas de cada idade de ouro da historia humana, não nos deveria surpreender o fato de tudo proceder da devoção e da pura paixão correta de um só indivíduo. Não há movimentos de massa genuínos; eles somente aparentam sê-lo. No centro da coluna sempre estará a pessoa que conhece a Deus, e que sabe aonde vai.12 Constantemente nos sentimos pressionados, para não dizer tensos, diante da necessidade de proporcionar novos métodos, novos planos, novas organizações que façam a igreja avançar e que assegurem seu crescimento e eficiência. No entanto, o método de Deus são os seres humanos. A igreja anda a procura de métodos melhores; Deus anda a procura de homens melhores.3 Deus anda a procura de pessoas que ele possa usar. Anda a procura de líderes, porque nada acontece enquanto não há ninguém que proporcione liderança. Tudo se levanta ou cai, de acordo com a liderança que existe. Enquanto as pessoas andam ocupadas a procura de métodos, maquinários e motivações melhores, Deus diz: "Eu procuro pessoas melhores, pessoas a quem eu possa usar". Quando perguntamos as pessoas sobre sua vida particular, são inúmeras as figuras públicas de hoje que usam a desculpa: "Isso não diz respeito a ninguém". Alguém chegou a dizer: "Minha vida particular não afeta de modo nenhum a minha capacidade para governar a nação". Para Deus, isso não é assim. Isso e o que ele diz: A eficácia na liderança publica e determinada pela vida particular do líder. Neemias era um homem de oração. Seu diário particular, que se tornou publico para nós por meio de seu livro no Antigo Testamento, guarda várias de suas orações, que começam com o que aparece no primeiro capítulo. Por suas conversas com Deus, conhecemos em 12 Ezequiel 22:30 maior profundidade a vida particular desse homem tão único. Há algo mais: Deus gostava de responder as orações de Neemias. Você não ficaria encantado em descobrir o segredo desse homem? Se examinarmos com cuidado a vida de oração de Neemias, isto nos pode ajudar a aprender a forma de orar com eficiência, o tipo de oração que Deus gosta de responder. Quando Neemias soube da crítica situação em que Jerusalém se encontrava, a primeira coisa que fez foi orar. Este e um bom ponto de partida para aprender a ser líder ao estilo de Neemias.

QUANDO UM LÍDER DEVE ORAR?

Antes de fazer qualquer coisa, os líderes devem orar. Quando Neemias ouviu as notícias que lhe deram acerca de Jerusalém, chorou, ficou de luto, jejuou e orou. Mais ainda, não orou apenas por alguns minutos, nem sequer por algumas horas, mas orou "por alguns dias". O líder faz muitas coisas, alem de orar. O líder inteligente, porem, o que deseja agradar a Deus por sua vida, não faz nada antes de orar. Você já pensou o que faz com que algumas pessoas tornem-se líderes e outras, perdedoras? A diferença esta nisto: os líderes dão a oração a mais alta prioridade; os perdedores fazem da oração seu ultimo recurso. Neste século XXI, tão inclinado a técnica, são muitas as pessoas que vivem em constante estado de agitação. são as personalidades do Tipo A: ativas, em contínuo movimento, com tendência aos ataques de coração, orientadas em direção a lucros e metas, sempre ocupadas. Um estilo de vida assim pode ser demasiadamente agitado para orar. Ainda que Neemias tenha vivido séculos atrás, ele não era diferente de você nem de mim. Era um líder orientado para a conclusão de suas metas, que queria o êxito, tal qual nós queremos. Neemias dizia que, antes de fazer qualquer outra coisa, deveríamos buscar tempo para orar. Neemias era também um homem de ação. Era organizador, motiva-dor e administrador. Sob sua liderança, os muros que estavam destruídos durante décadas foram levantados em cinqüenta e dois dias. Antes, porem, de começar a mover-se, caiu de joelhos. Quando ouvia que algo andava mal, não safa para organizar um comitê. Antes de fazer qualquer coisa, estava a sós com Deus e orava. Este era o esquema normal da vida de Neemias.

POR QUE O LÍDER DEVE ORAR?

l. Porque isso mostra que ele depende de Deus

Os seres humanos gostam de se sentir auto-suficientes. Qualquer que seja o problema, nós podemos enfrentá-lo. "Para que orar?", pensamos. "Eu posso resolver esse problema sozinho." Dizemos: "E agora, o que vou fazer a respeito disto?", quando deveríamos perguntar: "Meu Deus, o que queres que eu faca a respeito disto?". "... sem mim vocês não podem fazer coisa alguma", e o que Jesus nós diz. Somente por meio de uma conexão com Cristo que seja fixa, solida e mantida constantemente, poderemos chegar alguma vez a dar fruto em nossa vida. Na Palavra lemos: "Bem-aventurados os pobres em espírito, pois deles e o Reino dos céus". Não há nada que Deus não esteja disposto a fazer pela pessoa que depende dele. Só podemos começar a ser úteis como líderes quando reconhecermos que dependemos completamente de Deus. Quando a oração se converter em sua primeira reação diante dos problemas, como o era para Neemias, você saberá que está vivendo na dependência de Deus. 2. Porque isso alivia a sua carga Neemias era um homem compassivo e sensível, um homem que sentia profundamente as coisas. Perturbado pelas más noticias recebidas, tratou de encontrar-se com o coração de Deus por meio da oração. Chorou pelas ruínas, mas não se limitou a ficar de luto ou a gemer. Orou. Levou o problema diante do Senhor. Não murmurou; não gemeu nem se envolveu na autocomiseração. O nome de Neemias significa: "O Senhor e meu consolo". Ele sabia onde procurar socorro para o coração quebrantado: ele se pôs diante do Senhor.

Deus honra a oração que sai de um coração genuinamente quebrantado. Deseja escutar de nós: "Senhor, não posso com isto. não sei como enfrentar! Ajuda-me!". Essas são orações a que Deus gosta de responder.

A liderança produz estresse, e o alívio se encontra de joelhos.

... mas aqueles que esperam no SENHOR renovam as suas forças. Voam alto13

como águias; correm e não ficam exaustos, andam e não se cansam. 3. Porque libera o poder de Deus Não há nada que libere o poder de Deus como a oração de fé. Em Jeremias 33.3, Deus diz: "Clame a mim e eu responderei e lhe direi coisas grandiosas e insondáveis que você não conhece". A oração pode fazer tudo o que Deus pode fazer. A oração utiliza os mesmos recursos de Deus. Quando se coloca Deus em um projeto, o 13 Is 40:31 impossível torna-se possível.

COMO O LÍDER DEVE ORAR?

Podemos aprender muito sobre a pessoa pelo tipo de oração que ela faz. A oração que se assemelha a uma gravação gasta indica um espírito que secou. As orações egoístas, as que falam somente de "minhas" necessidades, são sinal de um espírito egoísta. Há orações que se parecem com listas de coisas desejadas. As orações impressionantes conseguem produzir um coração arrogante e cheio de orgulho. As orações dizem muito sobre quem ora. Quando lemos a poderosa oração do líder que temos em Neemias (1.5-11), descobrimos o caráter desse homem. Ele orou durante quatro meses sobre o problema de Jerusalém. Longe de ser uma oração informal, ela oferece um esquema para ter êxito em nossa orações. Se quiser compreender o que e uma oração eficaz, permita que Neemias seja seu instrutor. Por toda a Bíblia, quando as pessoas oravam tinham uma razão para buscar a ajuda de Deus. "Senhor", diziam, "quero que facas isso porque..." Quando você orar, pergunte a si mesmo: "Por que Deus responderia minha oração? Por que posso pedir que ele responda?" A Bíblia nos ensina a dar a Deus uma razão para responder a nossa oração. Com muita freqüência, o que fazemos e por diante dele uma lista: "Quero isto", ou melhor, "Este e meu desejo". Apresente a Deus a razão da sua oração. Neemias nos oferece quatro segredos das orações respondidas: a) Ele baseava sua petição no caráter de Deus

Deus gosta desta razão! Ele deseja que você o conheça e que dependa dele. No versículo 5, Neemias diz: "SENHOR, Deus dos céus, Deus grande e temível, fiel a aliança e misericordioso com os que te amam e obedecem aos teus mandamentos".7 há três coisas sobre Deus que precisamos dizer, como Neemias fez:

• Ele e grande: a posição de Deus.

• Ele e temível: o poder de Deus.

• Ele cumpre suas promessas: a fidelidade de Deus.

A primeira coisa que Neemias fez foi reconhecer quem e Deus. Quando reconhecemos o poder e a grandeza de Deus, nós o estamos louvando. Neemias disse: "Deus meu, sei que nossa situação e uma confusão, mas lembro-me que tu és aquele que tem tudo sob controle. Sei que os problemas que há ali em Jerusalém são grandes, mas tu és maior que eles. Tu és maior que a confusão".

Começou por colocar a situação dentro da perspectiva correta. As orações respondidas começam dizendo: "Deus meu, quero que me respondas por seres quem és. Tu nos fizeste estas promessas. Tu és um Deus fiel, amoroso e cheio de misericórdia". Estude os nomes de Deus. Conheça-os melhor e baseie sua petição no caráter divino.

b) Confessava o pecado que havia em sua vida. Deus havia advertido os judeus que o preço da desobediência seria alto. Eles perderiam seu lar em Israel, a Terra Prometida. No entanto, eles não quiseram escutar. Muitas vezes parece que Deus esta estabelecendo regras para serem seguidas, simplesmente porque ele e Deus. A verdade e que ele sabe que a desobediência vai nos prejudicar. Afinal de contas, foi ele que nos criou e, assim, quando o desobedecemos, estamos desprezando o Manual de Instruções da nossa vida. Por terem insistido em seguir o próprio caminho, os israelitas perderam tudo o que possuíam. A desobediência lhes custou a sua cidade, seu templo e sua liberdade. ... que os teus ouvidos estejam atentos e os teus olhos estejam abertos para a oração que o teu servo esta fazendo diante de ti, dia e noite, em favor de teus servos, o povo de Israel. Confesso os pecados que nos, os israelitas, temos cometido contra ti. Sim, eu e o meu povo temos pecado. Agimos de forma corrupta e vergonhosa contra ti. Não temos obedecido aos 14mandamentos, aos decretos e as leis que deste ao teu servo Moisés. Neemias começou sua oração reconhecendo quem Deus e: "SENHOR, Deus dos céus, Deus grande e temível, fiel a aliança". Depois, admitiu quem ele mesmo era. Identificou-se com o povo de Israel ao confessar: "Pecamos". Os israelitas não haviam ido para o cativeiro por culpa de Neemias. Setenta anos antes, quando se produziram aqueles pecados, ele nem sequer havia nascido. No entanto, ele se incluiu dentro do pecado da nação. O que ele disse foi: "Eu sou parte do problema". Existe uma confissão pessoal e uma confissão coletiva. Por exemplo, nos Estados Unidos, houve um tempo em que a nação reconhecia Deus e a necessidade que tinha dele, sua gratidão a Deus e o fato de não haver conseguido estar à altura de suas normas de qualidade. Por outro lado, hoje, o povo perdeu esse sentimento. Os norte-americanos tornaram-se individualistas. A maioria das igrejas do país ensina as pessoas a confessarem "meus" pecados. Quando foi a ultima vez que você confessou os pecados de sua 14 Neemias 1:6,7 nação, de sua família, de sua igreja ou os pecados de seus amigos? Em geral, nós não pensamos assim. Somos muito individualistas. Em muitas sociedades atuais, o conceito que prevalece e o de que cada um e responsável só por si mesmo. Sinceramente, isto não está certo! Você e, sim, o guardião de seu irmão. Todos nós estamos juntos nisto. São muitas as pessoas que dizem: "Tenho de fazer o que e melhor para mim", e assim justificam todo tipo de coisas. Neemias disse: "Não só tenho pecados pessoais a confessar, mas também pecados coletivos. Aceito a culpa dessas outras coisas". Talvez não pareça "justo", mas é a atitude que um líder deve assumir. Os líderes aceitam a culpa; os perdedores passam a culpa para outro. Se você quer ser um líder eficaz, deve ser capaz de assumir a culpa e compartilhar o mérito. Os perdedores são sempre pessoas acusadoras e cheias de desculpas. Estão sempre fabricando desculpas e lançando a culpa sobre alguém. Os líderes aceitam a culpa, como fez Neemias ao dizer: "temos pecado contra ti". Em última instância, todo pecado e contra Deus. Quando quebramos uma lei Humana, na realidade estamos ofendendo a Deus. Quando prejudicamos outra pessoa, estamos prejudicando a Deus. Davi confessou: "Contra ti, só contra ti, pequei e fiz o que tu reprovas..." Depois de cometer adultério e assassinar o esposo de Bate-Seba, Ele havia prejudicado outras pessoas, mas sabia que seu pecado era contra Deus. Os líderes aceitam a culpa. Quanto mais tempo tenho na vida cristã, mais consciente estou do meu pecado e da bondade de Deus. Isto talvez pareça uma raridade para muitos. Afinal de contas, a salvação não tem a ver com tudo o que está relacionado com o perdão dos nossos pecados? Sim, e assim. Como somos humanos, porem, continuamos a pecar. Pecar significa simplesmente não acertar o alvo da perfeição estabelecida por Deus. Não há nenhum de nos que não seja culpado disto. Mas Deus, por sua graça, decidiu usar pessoas imperfeitas como você e eu. Por isso, quando oramos, devemos fundamentar nossa petição no que Deus e, e depois confessar os pecados. c) Invocava as promessas de Deus Lembra-te agora do que disseste a Moisés, teu servo: "Se vocês forem infiéis, eu os espalharei entre as nações mas, se voltarem! para mim, obedecerem aos meus mandamentos e os puserem em pratica, mesmo que vocês estejam espalhados pelos lugares mais distantes debaixo do céu, de lá eu os reunirei e os trarei para o lugar que escolhi 15 Salmos 51:4 para estabelecer o meu nome."16. Neemias disse a Deus: "Lembra-te agora do que disseste a Moisés, teu servo". Você pode imaginar alguém que diga a Deus que "se lembre" de algo? Ele lembra a Deus o que Deus disse no passado. "Sim, e verdade que falaste que perderíamos a terra por nossa desobediência. Entretanto, prometeste também que, se nos arrependêssemos, a teríamos de volta". Por toda a Bíblia encontramos gente que recorda o que Deus disse que quer fazer. Davi fez isso, Abraão também fez isso. Moisés fez isso. Os profetas fizeram isso. "Deus meu, eu quero recordar uma de tuas promessas..." começavam, e repetiam a promessa. Será que Deus precisa que lhe recordemos as coisas? Não. Ele se esquece do que prometeu? Não. Então, por que fazer isso? Precisamos fazer isso, porque nos ajuda a recordar o que Deus prometeu. Não há nada que agrade mais a Deus que o fato de nos lhe recordarmos uma de suas promessas. Quando o fazemos, ele sabe que nós também estamos conscientes dessa promessa. As crianças se esquecem alguma vez das promessas que nós lhes fazemos? Nunca. Por isso, precisamos ter cuidado na hora de prometer-lhes algo. A Bíblia diz que somos pais imperfeitos. No entanto, se nós, em nossa imperfeição, sabemos que temos de cumprir as promessas feitas por nós aos nossos filhos, quanto mais o Pai perfeito, o Pai celestial, tem intenção de cumprir as promessas que ele fez em sua Palavra? A oração transforma as promessas de Deus em obras. A oração consiste em tomar posse da Palavra de Deus. A oração consiste em pedir a Deus que cumpra o que ele prometeu. Quando oramos, estamos pedindo que ele faca o que já prometeu e quer fazer. Neemias diz: "Deus meu, estou fundamentando minha oração no que tu és. Admito o que eu sou. E depois, faço-o lembrar do que tu já disseste". Você sabia que na Bíblia há mais de 7 mil promessas esperando que nós tomemos posse delas? Medite nesta historia:

Um homem morreu, foi para o céu e lá, para onde quer que olhasse, encontrava armazéns. "Para que são estes armazéns", perguntou. "Aqui e onde armazenamos os dons e as bênçãos", responderam-lhe. Quando pediu para ver os armazéns, achou riquezas muito superiores a tudo o que o ser humano pode imaginar: riquezas para satisfazer necessidades espirituais, necessidades nas relações, necessidades materiais... e as etiquetas de todas diziam o mesmo: "Nunca reivindicada".

Deus nunca fecha seu armazém enquanto você não fecha sua boca. Deus tem mais desejo de abençoá-lo do que você tem de receber 16 Neemias 1.8,9 suas bênçãos.

Mas você precisa reivindicar as promessas de Deus. Neemias pode reivindicar essas promessas porque as conhecia. Havia estudado a Palavra de Deus. Havia escondido em seu coração as promessas divinas. Quando foi a ultima vez que você aprendeu, de memória, uma das promessas que a Bíblia contém? O segredo do êxito ao orar consiste em suplicar a Deus que ele cumpra o que ele prometeu. Eu sei muito bem que as promessas de Deus determinam a fortaleza da minha vida de oração. "Deus meu, tu o disseste, e, pelo que disseste, e pelo que és, eu te agradeço, porque tua resposta já esta a caminho. Estou esperando de ti que supras as minhas necessidades". Precisamos conhecer as promessas de Deus. Eu sugiro que você escolha uma hoje e comece por ela. Assim, só restariam 6.999! d) Era especifico Para obter respostas concretas as nossas orações, precisamos fazer petições concretas. Se não for assim, como vamos saber que Deus nos respondeu? Estes são os teus servos, o teu povo. Tu os resgataste com o teu grande poder e com o teu braço forte, Senhor, que os teus ouvidos estejam atentos a oração deste teu servo e a oração dos teus servos que tem prazer em temer o teu nome. Faze com que hoje este teu servo seja bem-sucedido, concedendo-lhe a benevolência deste homem. Nessa época, eu era o copeiro do rei.17 Neemias estava disposto a ir a Jerusalém. Ele declarou a Deus que estava a sua disposição. Estava disposto a dirigir as obras de reconstrução. No entanto, ele também era um homem realista. Para poder ir, sabia que tinha de conseguir a autorização do rei Artaxerxes, um homem que, decididamente, não cria em Deus. O rei tinha poder sobre a vida e a morte de todos na Babilônia. Alem do mais, Neemias era sua mão direita, de modo que sabia que lhe faria falta um bom poder de convicção para conseguir que o rei lhe permitisse estar ausente durante três anos. Talvez, inclusive, fosse necessário um milagre. Ele não teve medo de orar para pedir êxito. Alguma vez, você já pediu a Deus que fizesse você triunfar? Se nunca fez esse pedido, por qual razão? Só há uma alternativa: o fracasso. Se o que esta fazendo e, em ultima instancia, para a gloria de Deus, não há nada de mal que ore, pedindo o êxito. Estude o exemplo de Neemias. Ore com 17 Neemias 1: 10-11 coragem. Ore para que Deus lhe de êxito na vida, para a gloria divina. Um ponto: Se você não pode pedir a Deus que abençoe o que você esta fazendo, talvez o melhor seja começar a fazer alguma coisa diferente. Deus não quer que você desperdice sua vida. O que lemos em Neemias 1 e só um exemplo de suas orações durante aqueles quatro meses. E de supor que ele não repetiria as mesmas palavras uma e outra vez durante todo aquele tempo. O mais provável e que suas orações tivessem evoluído ao longo do tempo em que esteve orando, assim como acontece com as nossas orações. Quanto mais oramos sobre algo, mais clara se torna nossa oração. Muitas vezes uma das razoes pelas quais Deus atrasa as respostas as nossas orações, o seu desejo de que nós lhe narremos nossas necessidades e desejos. Posso imaginar que Neemias começaria a orar, dizendo algo assim: "Deus meu, tens de fazer algo por aquelas pessoas. Peco-te que as ajudes". Talvez tenha orado assim durante umas semanas. E possível que Deus lhe tenha dito: "Neemias, você não esta agindo com hipocrisia? Se você está tão preocupado com eles, por que não se envolve com o assunto?". Em algum momento, dentro daquele período de quatro meses, acendeu-se uma lâmpada na mente de Neemias. "Eu poderia ser a resposta a esta oração", pensou. "Talvez Deus possa me usar para reconstruir os muros. Eu faço! Estou disposto!". Levou tempo para Neemias compreender a visão que Deus já havia formado. Primeiro, orou dizendo: "Talvez Deus possa me usar como resposta para esta oração". Agora, por fim, ele ora dizendo; "Dá-me êxito". Espere grandes coisas de Deus; faça grandes coisas para Deus.

WILLIAM CAREY

fundador do movimento missionário moderno.

Se você quer ser um líder bem-sucedido, como Neemias, precisa conhecer estas quatro características das orações que Deus responde:

1. Oração de convicção — Quando reconhecer quem e

Deus, suas palavras devem estar cheias de convicção. Você crê

que Deus é um Deus justo, um Deus grande? Crê que ele tem tudo

debaixo do seu controle? Deus quer ouvir isto de você. Deseja

responder nossas orações. Reconheça, sem duvidar, quem ele é.

Nisto consiste o louvor. O louvor consiste em ter orgulho do

nosso Deus.

2. Oração de confissão — Devemos reconhecer quem

somos diante de Deus: "Deus meu, eu cometi desastres.

Equivoquei-me e sou imperfeito". Seja bem específico.

3. Oração segura — você deve estar esperando que

Deus faca real-mente o que ele prometeu: "Sei quem és, sei quem

sou e sei que tu 0 disseste". Eu creio; ponto final. De fato, se Deus

disse, isso decide tudo, crendo ou não. Reivindique suas

promessas. Essas promessas são as chaves que abrem as respostas

para a oração. Tome posse dessas 7 mil promessas!

4. Oração de compromisso — Diga a Deus: "Estou

disposto a fazer parte da solução. Usa-me, Deus meu.

Comprometo-me a fazer tua obra".

Todos os que lêem este livro são líderes, porque a liderança é questão de influência. Em algum lugar, em algum dos papeis que desempenha na vida, você esta influenciando alguém. Isso faz de você um líder. Desse modo, a questão não é se você e um líder, mas sim, que tipo de líder você é. O primeiro passo da liderança consiste em desenvolver a vida particular, passando tempo a sós com Deus: um caminhar pessoal e diário com devoção. Se você quer ser um líder eficaz, desenvolva sua vida de oração. Aprenda a orar como Neemias, e você vai ver como as portas dos céus se abrirão. E, então, você ora. E agora, o que mais? O líder eficaz faz algo alem de orar, mas não faz nada sem orar. Agora, estamos prontos para o passo seguinte do processo de nos transformar em líderes que Deus usa. Vamos refletir... Observemos juntos estes quatro passos para a eficácia na oração e falemos com Deus agora mesmo. Pense em algo que você realmente tem em seu coração, algo por que você tem um verdadeiro desejo de orar. 1. Em primeiro lugar, fundamente sua petição no que

Deus é. Antes de apresentar a Deus sua petição, diga-lhe: "Deus

meu, eu sei que podes responder a esta petição, porque és..." e

diga-lhe o que ele é. "és um Deus grande, um Deus amoroso, um

Deus cheio de misericórdia. Escutas nossas orações. És um Deus

fiel, que cumpres o que prometes." A começar do que você crê a

respeito de Deus apresente-lhe sua petição.

2. Confesse o pecado que há em sua vida. Pergunte a Deus

se há algum pecado que ele precisa revelar a você. Assim como

come-temos pecados de maneira concreta, necessitamos confessálos de maneira concreta. Não tome a saída fácil de dizer: "Deus

meu, perdoa todos os meus pecados". Há alguma atitude ou

algum tipo de ação que precisa mudar? Peca a Deus que o perdoe por tê-lo entristecido, e diga-lhe que você quer mudar essa atitude incorreta ou essa ma forma de se conduzir. Peca que ele purifique sua vida desse pecado em particular. 3. Agora, reivindique as promessas de Deus. Se você não consegue se lembrar delas, eu sugiro o seguinte: "O meu Deus suprira todas as necessidades de vocês, de acordo com as suas gloriosas riquezas em Cristo Jesus". 4. Por ultimo, comprometa-se a fazer parte da solução. Diga: "Senhor, estou disposto a fazer parte da resposta. Estou disposto a permitir que me uses como quiseres, com o objetivo de chegar à solução para o problema". Obrigado, Pai, por estas lições que aprendemos com este grande líder chamado Neemias. Queremos desenvolver uma vida de oração que nos aproxime mais de ti. Em nome de Jesus. Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 2

A oração de um líder Aplicando os propósitos de Deus Como sua vida em oração pode melhorar sua eficiência como líder? Comunhão — Jesus nos disse que onde dois ou mais estiverem reunidos, ele estará no meio deles. A oração não deve ser feita com outros para ser apenas efetiva; Deus se alegra claramente quando oramos com outros crentes.

• Você conhece alguém que pode orar com você de

modo regular pelas necessidades de seu grupo ou organização?

• O que você deseja receber de Deus?

• Como a oração conjunta, ajuda-o a ver Deus em

ação? Discipulado — Existe uma forma melhor de conhecer alguém do que se comunicar com essa pessoa? Uma simples conversa e, em geral, a mais eficiente ferramenta de comunicação disponível.

• Você quer crescer como crente em Cristo?

• Você deseja uma relação mais profunda com seu Senhor e 18 Felipenses 4:19

Salvador?

• Fale com ele freqüentemente. Pode parecer estranho, já

que não podemos "ver" Cristo como vemos outra pessoa com

quem falaríamos, mas imagine que ele esteja do outro lado da

linha telefônica, ou que e a pessoa que lê seu e-mail depois de

você pressionar o botão "enviar". Faça dele seu companheiro

favorito de mensagens instantâneas, e você crescera em Jesus.

Adoração — Quando oramos, adoramos ativamente a Deus ao reconhecer seu senhorio.

• Que assuntos estão hoje em seu coração?

• Ao ler este capitulo, existe algo acerca de liderança que

você crê que Deus lhe esta revelando?

• Levando em consideração seus horários corridos, o que

você pode fazer para priorizar a oração em sua vida?

• Identifique em seu grupo um companheiro com o qual

você pode contar para ajudá-lo a desenvolver um habito regular

de "primeiro a oração".

Ministério — Como você já percebeu em seu Ministério a liderança produz estresse.

• Com o fim de ser um servo mais eficaz, onde você poderá

encontrar força?

• Que benefícios a dependência total de Deus trará para o seu

Ministério?

• Em sua vida diária, onde você necessita de maior

dependência de Deus?

• Que projeto você esta empreendendo? Considere o poder

que Deus oferece a você por meio da oração. Escreva o que Deus

está revelando por este estudo e ore a esse respeito. Peça ao grupo

que ore com você.

Evangelismo — O que o impede de alcançar o mundo para Cristo?

• Há alguma promessa divina que ainda não tenha sido

reivindicada?

• Você sabia que há mais de 7 mil promessas na Bíblia

esperando que delas você se aposse? Se nunca pediu a Deus êxito

ao evangelizar, faça já isso agora. Ele espera que você reconheça

sua promessa. Ore, pedindo que Deus o faça alcançar êxito em sua

vida, para a glória divina.

• Você esta fazendo algo que pensa não será abençoado por

Deus? Quem sabe você deveria fazer outra coisa? Busque a Deus

agora mesmo em favor do êxito que deseja alcançar para ele.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Warren diz que a diferença entre líderes e perdedores é esta: 'os líderes dão à oração a mais alta prioridade; os perdedores fazem da oração seu último recurso', e Neemias orou quatro meses antes de agir. Quando surge um problema na sua liderança, qual costuma ser de fato sua primeira reação — organizar um comitê e resolver no impulso, ou ir primeiro à presença de Deus? O que isso revela sobre a sua dependência dele?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Neemias não confessou apenas seus pecados pessoais, mas assumiu também os pecados coletivos do povo, dizendo 'nós pecamos', mesmo sem ter nascido quando aconteceram. Warren resume: 'os líderes aceitam a culpa; os perdedores passam a culpa para outro'. Em que situação recente do seu ministério, família ou trabalho você tem repartido a culpa em vez de, como líder, assumi-la diante de Deus e das pessoas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O capítulo apresenta a oração de Neemias como modelo: ele fundamentava o pedido no caráter de Deus, confessava o pecado, reivindicava as promessas e era específico — e Warren afirma que há mais de 7 mil promessas 'nunca reivindicadas'. Avaliando suas próprias orações, quão específicas e ancoradas nas promessas de Deus elas têm sido, e que promessa concreta você poderia começar a reivindicar pela necessidade que mais pesa em você agora?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 3 — Os planos de um líder  (aula ordem = 3)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 3;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 3 — Os planos de um líder$t$,
      3,
$conteudo$Porque sou eu que conheço os planos que tenho para vocês, diz o SENHOR, "planos de fazê-los prosperar e não de lhes causar dano, planos de dar-lhes esperança e um futuro. "19 Quando um líder enfrenta um desafio, a primeira coisa que faz e orar e, depois, planejar. Sem um plano, não há maneira de saber como chegar onde é necessário chegar. Os grandes líderes, como Neemias, são hábeis planejadores. Cada um de nós foi criado à imagem de Deus. Com o fim de nos criar a você e a mim, e a todos os demais, Deus começou com um plano mestre. Na pessoa de Neemias, Deus nos tem dado um modelo de líder, como um esquema sobre a forma de planejar. Há três razoes pelas quais tanto você como eu devemos fazer planos.

PARA QUE FAZER PLANOS?

1. Deus faz planos Pois Deus não é Deus de desordem, mas de paz.20

Deus faz planos. Isto não só faz com que nos seja permitido fazer pianos, mostra-nos que planejar é aconselhável, sensato e piedoso. Quando imitamos a Deus, estamos reconhecendo sua grandeza. Para ser como ele e, precisamos fazer planos.

2. Deus organiza Veja bem por onde anda, e os seus passos serão seguros.21 19 Jeremias 29:11 20 I Coríntios 14:33 21 Provérbios 4:26 Em seu coração o homem planeja o seu caminho, mas o SENHOR deter-mina os seus passos. Mas tudo deve ser feito com decência e ordem.23 Deus ama a ordem. Quando nós seguimos seu esquema de trabalho planejado com rodo o cuidado, estamos atuando em obediência a suas indicações, seu plano e seu propósito para nossa vida. Deus abençoa a obediência. 3. É boa mordomia Tenham cuidado com a maneira como vocês vivem; que não seja como insensatos, mas como sábios, aproveitando ao máximo cada oportunidade, porque os dias são maus. Portanto, não sejam insensatos, mas procurem compreender qual e a vontade do Senhor.

A administração de nosso tempo compreende que façamos o melhor uso possível das oportunidades que Deus nos proporciona. Para sermos bons mordomos do que ele nos tem dado, precisamos também ser bons planejadores. Quando não planejamos, não estamos cuidando do que Deus nos confiou. Faça planos para ser um bom mordomo dos recursos de Deus.

COMO OS LÍDERES PLANEJAM

l. Os líderes pensam em tudo detalhadamente Neemias havia recebido aquele peso quatro meses antes, "no mês de quisleu", como ele mesmo diz. A partir dai, estava esperando que acontecesse algo. Agora, quatro meses mais tarde, "no mês de nisã", alguma coisa acontece. "O que estava acontecendo enquanto isso?" "O que Neemias estava fazendo entre o momento em que pensou, pela primeira vez, na reconstrução dos muros e o momento em que pode por fim apresentar sua idéia ao rei?" Neemias estava se preparando: ele havia orado e feito planos. Quando o rei lhe perguntou: "O que você quer?", Neemias pode lhe responder, porque tinha feito planos para aquele momento. Você sabe o que significa deixar seus planos por um tempo? Em 22 Provérbios 16:9 23 I Coríntios 14:40 24 Efésio 5:15-17 lugar de se sentir frustrado, Veja esse tempo como uma oportunidade que Deus da para fazer o que Neemias fez: orar e planejar. Quando você decidir e agir, permita que seja Deus o que se ocupe dos resultados (de todas as maneiras ele vai agir; só assim você o reconhecera). Desta maneira, você vai ser muito mais eficaz como líder e sofrera muito menos estresse. Howard Hendricks disse: "Não há nada que aproveite mais que pensar nas coisas seriamente; tampouco há nada que exija mais que isso". Os lideres precisam de tempo para pensar. Muitas vezes, isso significa que devem separar um tempo para estar longe de tudo. Quando você necessitar fazer planos, pense em fazer um breve retiro longe das pressões e da agitação da vida diária. Busque um lugar que ofereça um ambiente onde você se possa concentrar e converta esse lugar em "lugar para pensar". Separe um tempo para pensar e planejar. Os líderes criam tempo para pensar. Todo homem prudente25age com base no conhecimento, mas o tolo expõe a sua insensatez.

A sabedoria do homem prudente e discernir o seu caminho, mas a insensatez dos tolos é enganosa.26

Você separa um tempo para pensar sobre sua vida? As Escrituras nos dizem que a pessoa sabia faz isso. Faça agora mesmo estas três perguntas:

•Onde estou agora?

•Onde quero estar?

•Como posso chegar lá?

Isso e o que Neemias fez. Pensou bem nas coisas. Orou durante quatro meses, mas, enquanto orava, estava fazendo planos. Quando oramos e planejamos, estamos abrindo a mente e o coração para Deus. Então e quando ouvimos sua voz. Talvez não escutemos sua voz audivelmente; de fato, o mais provável e que não o oramos dessa forma. No entanto, sim, você vai receber impressões e idéias que procedem dele. E quando ele dá a você uma visão. Para ser um líder eficaz, você precisa ter uma visão. A visão e o que destaca os líderes. Não planejar e o mesmo que planejar o fracasso! Você precisa pensar bem nas coisas. Precisa saber de antemão como vai proceder, e o que vai fazer no caso de as coisas saírem mal. 25 Provérbios 13:16 26 Provérbios 14:8

2. Os líderes se preparam para as oportunidades

Quando a oportunidade bater a sua porta, você precisa estar pronto para abrir essa porta. A vida esta repleta de oportunidades, mas nem sempre estamos preparados para reconhecê-las. Se passar por cima de uma oportunidade que Deus colocou no seu caminho, você poderá estar perdendo o propósito divino para sua vida. Assegure-se de buscar a Deus todos os dias e de pedir-lhe que mostre as oportunidades que ele tem preparadas... todos e cada um de seus dias. Nunca sabemos de onde vira uma oportunidade. Os melhores momentos de nossa vida podem ser conseqüência de atos muito pequenos e, nessas ocasiões, talvez pensemos que tudo sucedeu por acidente. No entanto, a menos que estejamos atentos para discernir as oportunidades, nós as poderíamos perder por completo.

No mês de nisã do vigésimo ano do rei Artaxerxes, na hora de servir-lhe o vinho, levei-o ao rei. Nunca antes eu tinha estado triste na presença dele; por isso o rei me perguntou: "Por que o seu rosto parece tão triste, se você Não esta doente? Essa tristeza só pode ser do coração! Com muito medo, eu disse ao rei...27 Finalmente chegou o momento que Neemias estava esperando. Surgiu a oportunidade de apresentar sua idéia ao rei. Por fim, ele podia apresentar, e estava pronto, porque havia planejado. O peso que Neemias sentia por Jerusalém o afetava emocionalmente, e se manifestou em seu aspecto externo. Naqueles dias, apresentar-se diante do rei com cara triste era um delito capital. Neemias sabia disto, mas estava desalentado e Não podia esconder o fato. Havia orado por muito tempo, mas nada havia mudado. Isso já aconteceu com você alguma vez? Você consegue se identificar com o desalento de Neemias? Ele se perguntava o que Deus ia fazer com respeito aqueles muros. Vendo a tristeza de Neemias, o rei lhe perguntou: "O que está acontecendo com você, Neemias?". Ele estava bem consciente do perigo em que se encontrava. Diante de seus leitores, ele reconhece: "Eu senti muito medo". Seu plano era duplo: 1) pedir a Artaxerxes que lhe permitisse ausentar-se; e 2) pedir autorização para reconstruir os muros de Jerusalém. Não esperava que o rei se sentisse encantado com estas duas petições. Naqueles dias, se alguém fizesse um pedido ao rei do qual ele não se agradasse, a pessoa se encontraria em serio problema. Neemias estava diante de um rei que tinha poderes de vida ou morte. não é de 27 Neemias 2.1,2 admirar-se que sentisse medo. No entanto, não deixou que o medo o detivesse. Sabia disto: os líderes seguem adiante apesar de seus temores. Existe um mito popular segundo o qual deveríamos crer que os líderes nunca têm medo. O certo e que os líderes sentem medo com freqüência. O valor não é a ausência do medo, o valor consiste em seguir em frente apesar dos temores que tenhamos. Observe o que fez Neemias com seu medo. O rei lhe disse: "O que você quer? E obvio que você está aflito". Neemias orou, não da mesma forma que havia orado durante aqueles quatro meses, mas orou com rapidez. Algumas vezes precisamos que nossa oração seja um "S.O.S." como este: "Deus meu, dá-me sabedoria. Ajuda-me a saber o que dizer". Neemias respondeu ao rei: "Como não estaria triste o meu rosto, se a cidade em que estão sepultados os meus pais esta em ruínas, e as suas portas foram destruídas pelo fogo?".28 Escolheu com todo o cuidado suas palavras; e, para assegurar ao rei sua lealdade, começou com um "Que o rei viva para sempre!". Como guarda-costas do rei, Neemias sabia que um rosto triste podia ser interpretado como um rosto que escondia informação acerca de algum problema, como uma conspiração para assassiná-lo. Naturalmente, o rei queria saber por que seu funcionário mais importante estava tão aflito. "... a cidade em que estão sepultados os meus pais esta em ruínas..."29, disse Neemias, apelando para o respeito cultural dos orientais por seus antepassados e a sua tradição de manter em bom estado os terrenos onde esses estavam sepultados. Funcionou! O rei lhe respondeu: "O que você quer? . Como havia feito planos para aquele momento, Neemias soube com exatidão o que devia pedir. 3. Os líderes fixam uma meta ... e respondi ao rei: Se for do agrado do rei e se o seu servo puder contar com a sua benevolência, que ele me deixe ir a cidade onde 30 meus pais estão enterrados, em Judá, para que eu possa reconstruí - lá. Vemos agora que Neemias pede coisas concretas. Sua meta e definida: quer reconstruir os muros. O passo seguinte no planejamento e a fixação de uma meta. Sem um alvo, não estamos apontando para nada, e isto e precisamente o que vamos atingir: o nada. Ao fixar suas metas, faca a 28 Neemias 2:3 29 Neemias 2:3 30 Neemias 2:5 você mesmo três perguntas:

• O que eu quero ser?

• O que eu quero fazer?

• O que eu quero ter?

Dois dos erros mais comuns que cometemos ao fixar metas são o de determinar metas muito baixas ou o de ter expectativas pouco realistas quanto ao cumprimento dessas metas. Ou nos satisfazemos de modo demasiadamente fácil com uns resultados medíocres, ou queremos obter tudo na hora. Quando fazemos um plano que incorpora uma meta para cada passo, podemos ir seguindo nosso progresso. Podemos ver como estamos alcançando nosso ponto de destino. Centímetro a centímetro, tudo é brincadeira de criança. Não tenha medo de fazer planos grandes, por receio de que Deus tenha de acudir para resgatar você. Deus se encanta com planos grandiosos. O fato de fazer grandes planos honra a Deus. Com efeito, estamos dizendo: "Isto é o que estou esperando que Deus faça". Não se trata do que eu posso fazer, mas do que ele pode fazer". Neemias fixou-se na meta de reconstruir os muros ao redor de toda uma cidade. Ele era copeiro, não construtor de muros. Nunca havia levantado nenhum muro. Nunca havia edificado nada. Entretanto, não teve medo de fixar uma meta grande, porque servia a um Deus grande. A maioria de nós fixa metas muito baixas e busca atingi-las com muita rapidez. Deus nos pede para sonhar grande e ir devagar. 4. Os líderes fixam datas limite Então o rei, estando presente a rainha, sentada ao seu lado, perguntou-me: "Quanto tempo levara a viagem? Quando você voltara?" Marquei um prazo com o rei, e ele concordou que eu fosse.

Sem uma data limite, uma meta não é meta, e só um desejo. O estabelecimento de data limite e a parte do planejamento que fixa um calendário. Você sabe o que quer fazer, e sabe quando quer que esteja pronto. Agora, a pergunta e esta: Quanto tempo vai ser necessário?

Artaxerxes apreciava Neemias, como o evidencia sua pergunta: "Quanto tempo vai ficar fora?". Por que será que Neemias acrescentou as palavras "estando a rainha assentada junto a ele"? Talvez 31 Neemias 2:6 compreendesse a influencia dela sobre a receptividade do rei. O mais provável e que, por ser Neemias a mão direita do rei, houvesse amizade entre ele e a rainha. Com sua rainha junto a ele, e seu ajudante principal servindo-lhe vinho, o rei estava feliz. Neemias reconheceu que era o momento adequado, assim apresentou sua petição: "Realmente, o que eu queria fazer era regressar para reconstruir os muros ao redor da cidade onde se encontram as sepulturas de meus antepassados", começou a dizer. E possível que fizesse essa petição nesse momento, sabendo que a rainha influenciaria Artaxerxes para que ele o deixasse ir. Uma coisa, sim, sabemos com segurança: Deus era quem havia fixado aquele momento.

Neemias orou, fez um plano, fixou uma meta... e estabeleceu uma data limite. 5. Os líderes prevêem os problemas Se for do agrado do rei, eu poderia levar cartas do rei aos governadores 32do Trans-Eufrates para que me deixem passar até chegar a Judá. Agora que já tem permissão para ir, Neemias pede proteção. Sua viagem da Babilônia (Iraque) até Israel tinha uma distancia de 1.300 a 1.600 quilômetros e passava por diversas províncias. Ele sabia que ia necessitar da ajuda de alguém como o rei para chegar são e salvo a seu ponto de destino. Por isso ele disse a Artaxerxes: "Quero que me dês cartas de autorização, de maneira que não tenha problemas quando chegar ali". Vê-se claramente que Neemias tinha pensado em tudo. Quando o rei lhe perguntou o que queria, ele já tinha a resposta preparada, porque há-via pensado até nos detalhes. Havia feito planos para aquele momento. Durante quatro meses passados não estava só orando, mas também planejando, de modo que quando surgiu a oportunidade, pode dizer o que necessitava. Quando você planejar, não se esqueça de prever que problemas podem surgir. Pergunte a você mesmo: O que pode me deter? O que pode dar errado? O líder prudente reconhece que, se há algo que pode ir mal, o mais provável e que assim ocorra. Planeje para a possibilidade de um desastre. Os administradores se centram nos problemas do momento; os líderes, na resolução dos problemas de amanha. Em toda organização fazem falta tanto os administradores como 32 Neemias 2:7 os líderes. No entanto, e importante reconhecer que eles não são a mesma coisa. Os administradores centram-se nos detalhes cotidianos, os problemas que surgem todos os dias. Os líderes prevêem os problemas. Fazem a si mesmos essas perguntas que começam com um "e se...?", perguntas que ninguém mais pensa sequer em fazer. Eles vêem o problema, e tem preparada a solução para enfrentá-lo, ainda antes que se torne uma realidade. Quando as reuniões de domingo na igreja que eu pastoreio começaram a lotar o templo, vi a necessidade de celebrar outra reunião no sábado. Nessa época, quase não havia igrejas cristas tradicionais que realizassem reuniões aos sábados. Eu estava pensando com um ano de antecipação, aproximadamente. Isso e o que um líder deve fazer. O líder pensa muito mais adiante que os demais. Da mesma forma que Neemias, os líderes visionários vão adiante, prontos para enfrentar os problemas quando chegam, com soluções que eles já encontraram. Ainda que administração e liderança sejam coisas distintas, ambas são necessárias.

O prudente percebe o perigo33e busca refúgio; o inexperiente segue adiante e sofre as conseqüências.

A previsão dos problemas e a antecipação para resolvê-los são parte de um planejamento eficaz. 6. Os líderes calculam o preço E também uma carta para Asafe, guarda da floresta do rei, para que ele me forneça madeira para as portas da cidadela que fica junto ao templo, para os muros da cidade e para a residência que irei ocupar. Como o planejamento exige tempo e dinheiro, o orçamento e o próximo ponto que o líder precisa levar em consideração. Você já percebeu que tudo na vida tem um custo? Neemias apresentou ao rei toda uma lista de petições: "Primeiro, quero que me deixes ir. Depois, quero que me dês a proteção de que necessito para chegar lá. E, aproveitando a oportunidade, quero também que sejas tu a pagar o projeto". Como tinha tudo bem pensado, Neemias sabia com precisão o de que ia necessitar. Quando o rei lhe concedeu audiência, essas foram as coisas que ele pediu. Necessitava de madeira para levantar as vigas das portas da cidade, madeira para os muros e madeira para edificar 33 Provérbios 27:12 34 Neemias 2:8 sua casa. Leve em consideração que Neemias não era construtor. Nunca havia edificado nada cm toda a sua vida. Quando, porem, surgiu a oportunidade de apresentar suas necessidades ao rei, ele lhe disse com exatidão o de que precisava, porque havia feito planos. Os líderes eficazes oram e depois planejam. Como Neemias soube o que necessitava pedir? Como soube que havia um bosque real perto de Jerusalém? Calculou o preço e planejou antes. Antes de envolver-se com a situação, calculou o que estava fazendo. Fez as investigações necessárias. Até conhecia o nome do guarda da floresta. Tudo aquilo ele havia pensado antes, de modo que estava pronto quando a oportunidade bateu a sua porta. Deus tem oportunidades magníficas esperando por você, mas você tem de estar preparado para ir ao encontro dessas oportunidades quando elas aparecerem. Se Neemias não tivesse feito seus planos, não estaria preparado. Como seu planejamento foi detalhado, sabia exatamente o que devia pedir. Havia calculado o preço. Jesus nos diz que nós também precisamos calcular o preço. Qual de vocês, se quiser construir uma torre, primeiro não se assenta e calcula o preço, para ver se tem dinheiro suficiente para completa-lá? Neemias está tão comprometido com sua visão, que se dispõe a passar por riscos consideráveis para alcança - lá. Ele sabe que esta fazendo petições a um rei pagão. Tem sua lista preparada, e colocou sua confiança no Senhor. Pede autorização, proteção e recursos, e tudo com um grande risco para a própria vida. Cada vez que o rei lhe concede uma das coisas que pede, dispõe-se a aventurar-se um pouco mais e ir alem. Você já se encontrou com alguma situação como essa? Eu já. Quando se da conta de que ainda não o jogaram fora, você continua avançando. Vai empurrando os limites, querendo ver até onde pode chegar. A liderança tem seus riscos.

OS LÍDERES ESTÃO DISPOSTOS A PEDIR AJUDA A

OUTROS

Não têm, porque não pedem.36 Os líderes reconhecem que, para atingir suas metas, necessitam da ajuda de outros. Precisamos pedir ajuda a Deus e a outros. Nenhum líder pode realizar grandes tarefas sozinho. Não cometa o erro de supor que ninguém quer envolver-se, porque você não pediu. Deixe 35 Lucas 14:28 36 Tiago 4:2 que decidam por si mesmos. Deixe que tomem a decisão. Não tenha medo de pedir ajuda. É necessário incrível ousadia para fazer o que Neemias fez, ao pedir ajuda a um rei pagão, um homem que tinha em suas mãos o poder da vida e da morte. Como havia dedicado quatro meses orando e planejando, a re de Neemias foi fortalecida. Ainda que seus joelhos tremessem, sua confiança em Deus lhe deu a coragem necessária para avançar com seu plano. O coração do rei e como um rio controlado pelo SENHOR; ele o dirige para onde quer.37 As decisões mais sábias são as tomadas após oração e planejamento. Deus escolhe a direção que o líder prudente reconhece por meio desses dois recursos. A história de Neemias ilustra a verdade que e Provérbios 21.1. Deus tinha o controle total sobre o coração daquele rei pagão. Deus e especialista em transformar corações. Talvez você sinta o desejo de realizar algo em seu lugar de trabalho. Como não é o presidente da empresa, sente que sua influência é limitada. Você e um dos administradores do nível médio, e os planos que você executa raramente são seus. você precisa saber isto: o coração do executivo, como o coração do rei, esta nas mãos do Senhor, que pode levá-lo onde ele quiser. O coração do presidente de sua empresa esta nas mãos de Deus. E Deus é especialista em mudar corações. Ele e soberano, de modo que tudo o que acontecer e decisão dele. Isso e certo, inclusive quando os planos não tomam o curso que você pensa que deveriam tomar. Deus continua tendo o controle de tudo. Nós conseguimos ver as coisas a curto prazo. Deus vê muito além no caminho. Neemias não tratou de manipular o rei. Quando o rei perguntou: "O que esta acontecendo?", ele foi sincero. "Minha cidade de origem esta em ruínas", disse. Não inventou uma historia de como regressar a Jerusalém por motivos falsos. Não tentou enganar ao rei, nem brincou com ele. O que fez, de fato, foi falar com Deus sobre ele. Neemias reconhecia que o coração do rei estava nas mãos de Deus, de modo que pediu a Deus que lhe concedesse o que ele lhe pedia, por meio de Artaxerxes. Quando você tiver um chefe que não simpatiza com um projeto ou uma meta que você tenha, não tente manipulá-lo. Em vez de manipulá-lo, faca o mesmo que Neemias: limite-se a falar com Deus sobre ele. O coração do rei — e de seu chefe — esta nas mãos de Deus. Somente ele pode mudá-lo. Quando você tentar fazer isso, terá caído na manipulação. Deixe que seja Deus quem mude o coração. 37 Provérbios 21:1 Ore por esse chefe, e observe como Deus faz a mudança. Essa e sua atividade favorita.

Visto que a 38

bondosa mão de Deus estava sobre mim, o rei atendeu os meus pedidos. Neemias atribuiu todo o mérito a Deus. A primeira metade do livro de Neemias e autobiográfica; a segunda metade esta narrada em primeira pessoa, de modo que e possível que Esdras, ou outro dos cronistas daquele tempo, a tenha escrito. Aqui, no segundo capitulo, e Neemias mesmo quem diz que Deus esta por trás de tudo o que esta acontecendo. Neemias sabe perfeitamente que a vitoria não é resultado da sua capacidade. Quando reconhecemos a mão de Deus por trás das pessoas que estão atrasando nosso projeto — esse projeto que, sabemos, vai transformar o mundo — estamos demonstrando maturidade espiritual. Neemias disse: "Deus estava comigo". Se, entretanto, ele não tivesse orado e planejado, e não estivesse disposto a agir e a se arriscar — e se ele nem tivesse tornado conhecimento do que estava acontecendo de acordo com o calendário divino — não teria acontecido nada.

Ao homem pertencem os planos do coração, mas do SENHOR vem a resposta da língua.39

Com isso fui aos governadores do Trans-Eufrates e lhes entreguei as cartas do rei. Acompanhou-me uma 40escolta de oficiais do exercito e de cavaleiros que o rei enviou comigo. O rei não apenas ofereceu sua proteção a Neemias durante a viagem, como também lhe enviou uma escolta militar. Neemias obteve mais do que havia pedido. Isto e imagem da verdade que lemos na Palavra: " [Deus] é capaz de fazer infinitamente mais do que tudo o que pedimos ou pensamos, de acordo com o seu poder que atua em nós...".41 Neemias se dava conta de que estava correndo um grande risco ao pedir tantas coisas, mas quando o rei pensava em desistir, lhe disse: "E você também vai acompanhado por uma escolta militar". Aquilo era um milagre. Imagine a emoção de Neemias enquanto cavalgava pelo deserto rumo a Jerusalém. "Não posso acreditar!", deve ter pensado. "há quatro meses, isso era apenas um sonho, uma idéia que Deus meu deu. Agora, tenho uma escolta militar que me leva para a minha cidade a fim de edificar meu 38 Neemias 2:8 39 Provérbios 16:1 40 Neemias 2:9 41 Efésios 2:20 sonho, e com seu dinheiro!". Porque Neemias confiou em Deus... porque orou, planejou e esperou em Deus... obteve tudo o que pediu, e mais que isso. Quando Deus encontra uma pessoa que vê a visão dele, lhe proporciona os recursos necessários. Neemias havia ouvido a voz de Deus. Estava sensível diante do coração de Deus, e disposto a se deixar usar por ele. Quando Deus o moveu, ele começou a orar. Deus traduziu em visão o peso que Neemias sentia pelos demais. Assim e como trabalha a oração perseverante. Transforma o peso era uma visão. Não há nada que Deus não esteja disposto a fazer por uma pessoa que vê a visão que ele tem. O segundo capitulo de Neemias e um lindo exemplo da harmonia possível quando Deus e o homem colaboram na obtenção de coisas sobre a terra. Deus e soberano. Nossa missão e orar, planejar e estar preparados. Oramos para que Deus prepare as circunstancias que estão além do nosso controle. Depois fazemos planos para o que podemos controlar. não é nem uma coisa nem outra. não é: "Ore e deixe que o Espírito guie você". Ouvimos muito isto, mas a Bíblia diz que e uma necessidade. As Escrituras nos dizem que o homem prudente faz planos. O êxito exige a parte de Deus e também a minha. Temos de orar, apoiar-nos em Deus, planejar e realizar nosso melhor esforço. A oração e o planejamento acontecem juntos. Como Neemias se preparou, quando surgiu a oportunidade ele a reconheceu e estava pronto.

OS LÍDERES SE PREPARAM PARA O ÊXITO AO INVÉS

DE SE PREOCUPAREM COM O FRACASSO

Neemias não se preocupava com o que poderia acontecer caso seu plano não funcionasse. Havia planejado e orado, como se o que iria suceder fosse inevitável. Aplique isso a sua vida. Você quer, de fato, crescer espiritualmente? Você esta lendo este livro, e isto e uma boa indicação de que sua resposta e afirmativa. Que planos você fez para seu crescimento espiritual? Nós planejamos tudo sobre nossa vida. Por que não planejamos nosso crescimento espiritual? Você tem um plano pra ler toda a Bíblia? Você tem um plano para separar um tempo todos os dias e dedicá-lo a oração? Você tem um plano para falar do Senhor a essa pessoa de seu trabalho? Você tem um plano para convidar essa pessoa para jantar em sua casa, conhecê-la melhor e convidá-la para ir à igreja? Você tem planejado, ou sinceramente esta deixando que tudo aconteça de maneira espontânea? São muito poucas as coisas que acontecem de forma espontânea. Você precisa ter um plano:

• Um plano para testemunhar

• Um plano para ler a Bíblia

• Um plano para orar.

Vamos refletir... Para que qualquer uma destas coisas seja eficaz e constante em sua vida o que você precisa e de um plano. Quais são seus planos? São somente sonhos que você constrói e pede a Deus que abençoe ou são planos que procedem do Senhor? Como você reconhece a diferença entre uma e outra coisa? Se os seus planos procedem do Senhor, vão ser suficientemente grandes para que ele caiba neles. Alguém disse: "não faça planos pequenos, porque estes planos não têm o poder necessário para mover as almas dos homens". Os pensamentos grandes atraem grandes pensadores; os sonhos pequenos atraem pequenos pensadores. Que tipo de pensador você e? Quaisquer que sejam os seus planos, torne-os grandes o suficiente para que possam mostrar Deus ao mundo. Que sua vida grite a todos que a Vejam: "Deus e grande!" Se você esta gastando mais tempo e energia, preocupando-se com os fracassos mais do que planejando para o êxito, você esta desperdiçando ambos. Pai celestial, pedimos-te que levemos nossa vida a serio e que

possamos nos dar conta das necessidades, como tu disseste, para

que vivamos com um senso correto de responsabilidade, não como

os homens que desconhecem o significado da vida, mas como as

pessoas que de fato o conhecem. Senhor, ajuda-nos a fazer o

melhor uso possível de nosso tempo. Dê-nos um coração que se

agarre com firmeza ao que sabemos que e" tua vontade. Senhor,

ajuda-nos a pensar com cuidado no sentido que nossa vida toma e

no caminho meditar pelo qual caminhamos. Ajuda-nos a

reconhecer as oportunidades que tu pões diante de nós e a estar

prontos para quando elas se apresentarem a nós. Ajuda-nos afixar

metas, marcar datas limites, prever os problemas, calcular o custo

e aplicar a nossa vida estes seis princípios de planejamento. Em

nome de Jesus. Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 3

Os planos de um líder Aplicando os propósitos de Deus

Comunhão — Como Deus pode usar outros crentes para ajudálo em seu plano?

• Você faz parte de um grupo de crescimento ou célula ou

tem um amigo de confiança que pode ajudá-lo a revisar suas

metas e prazos?

• Peça a essa pessoa que o lembre de sua responsabilidade ao

planejar e executar.

Discipulado — Liderar como Jesus significa aprender seu estilo de administração.

• Estude os versículos neste capitulo para descobrir os

planos de Deus para os líderes. Você segue esses planos?

• O que você pode fazer agora para aprender mais sobre

Jesus e como se parecer mais com ele?

• Como este capítulo o ajudou para crescer como discípulo

de Cristo?

• Antes da próxima lição, releia João 17 e examine o padrão

que Jesus estabeleceu para a liderança.

Ministério — Conhecer as necessidades do corpo de Cristo implica um planejamento cuidadoso para não desperdiçarmos nossos recursos.

•De que maneira Deus quer usá-lo para servir outros

crentes?

•Se você já exerce liderança, que planejamento suas funções

requerem?

•Que princípios de Neemias você pode aplicar para exercer

um ministério mais eficaz para o Senhor? Escolha dar um passo

adiante em seu trabalho.

Evangelismo — Os líderes são observados por outros, crentes e não crentes.

•Em sua função de líder, como você se assegura de refletir

Cristo para aqueles que estão sob sua liderança?

•Há alguma estratégia que você pode estudar ou o exemplo

de algum líder que você pode seguir?

•Como o planejamento o ajuda a responder diante das crises

e das criticas de rejeição?

•Medite a respeito, faca um plano e prepare-se para manejar

as crises.

Adoração — Se queremos refletir Deus para os que nos rodeiam, devemos passar tempo na presença do Senhor.

•Como Deus pode usar um culto, um estudo bíblico, um

concerto cristão, para fortalecer suas aptidões para a liderança?

•Você separa um tempo diário para estar a sós com o

Senhor?

•Momentos de paz são uma grande maneira de recarregar as

suas baterias espirituais. Se você ainda não os tem, e tempo de

separar um espaço em sua agenda para isso. Faca de Deus sua

prioridade e você vera o que ele faz com seus planos.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Warren mostra que, durante quatro meses entre a notícia e o pedido ao rei, Neemias não ficou parado: ele orava e planejava ao mesmo tempo, de modo que, quando o rei perguntou 'o que você quer?', ele já tinha pensado em tudo — proteção, madeira, prazos, até o nome do guarda da floresta. Pensando num desafio que Deus colocou no seu coração, você tem orado E planejado, ou tem usado o 'esperar em Deus' como desculpa para não pensar detalhadamente nas coisas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo ensina que líderes fixam metas grandes ('Deus se encanta com planos grandiosos') e fixam datas-limite, lembrando que 'sem uma data-limite, uma meta não é meta, é só um desejo'. Qual sonho que Deus lhe deu você tem mantido pequeno demais ou solto demais, sem meta clara nem prazo, e como seria transformá-lo num plano grande o suficiente 'para que ele caiba nele'?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Warren destaca que 'os administradores se centram nos problemas do momento; os líderes, na resolução dos problemas de amanhã', e que Neemias previu os problemas da viagem antes de partir, fazendo perguntas do tipo 'e se...?'. Na área em que você lidera hoje, que problemas previsíveis você tem evitado encarar com antecedência, e que perguntas 'e se...?' você precisaria começar a fazer?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 4 — Como um líder motiva outros  (aula ordem = 4)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 4;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 4 — Como um líder motiva outros$t$,
      4,
$conteudo$O sucesso nunca e um espetáculo de um homem só. Neemias sabia que sou projeto de reconstrução dos muros necessitaria de uma equipe de pessoas consagradas e trabalhadoras que compartilhassem sua visão. Quando chegou a Jerusalém, as pessoas com as quais se encontrou sentiam-se derrotadas e apáticas, e viviam em meio aos escombros. Nos últimos noventa anos haviam tentando, em duas ocasiões, a reconstrução dos muros, mas sem sucesso. O povo perdeu toda a segurança. Eles concluíram: "não é possível!". Neemias chegou ao lugar, e em questão de dias havia conseguido o apoio de toda a cidade. Formou equipes, mobilizou-as e conseguiu que o muro estivesse construído cinqüenta e dois dias depois. Como obteve o sucesso onde outros haviam fracassado? Por acaso ele era um homem que fazia milagres? Não, ele era apenas um grande líder. Compreendia os princípios da motivação. Ele sabia que ia ter de trabalhar para voltar a animar a população da cidade, e ele conseguiu. Os princípios que ele aplicou funcionarão também para você quando precisar que as pessoas se sintam entusiasmadas diante de algo novo. Se o promovem a um novo posto, se precisa fazer com que as pessoas colaborem com você em algo, se precisa vender uma idéia, você tem de introduzir mudanças; cada vez que precise fazer andar um projeto, lembre-se de Neemias. Como um líder motiva outras pessoas? Veja como Neemias fazia isso. 1. Um líder espera oposição Sambalate, o horonita, e Tobias, o oficial amonita, ficaram

muito irritados quando viram que havia gente interessada no bem

dos israelitas.42

No momento em que você disser: "Vamos fazer algo", alguém vai se levantar e dizer: "Não vamos fazer nada". Quando o povo de Deus se levanta e diz: "Vamos edificar", Satanás diz: "Vamos nos levantar e opor". As pessoas têm resistência natural a mudanças. Elas não gostam. Querem manter o "status quo", expressão latina que talvez signifique "a confusão na qual estamos envolvidos". As pessoas são resistentes a 42 Neemias 2:10 mudanças por varias razoes. Para favorecer as mudanças necessárias, os líderes averiguam quais são as razoes, e as enfrentam. Sambalate, o governador de Samaria, e Tobias, o líder dos amonitas, ouviram dizer que Neemias vinha para reconstruir os muros. Neemias sequer havia chegado a Jerusalém e já havia oposição contra o que ele ia fazer. Não estamos seguros da forma pela qual Neemias soube, mas e provável que tenha enviado exploradores adiante dele, a fim de que descobrissem possíveis problemas.

Mas permanecerei em Éfeso até o Pentecoste, porque se abriu para mim uma porta ampla e promissora; e há muitos adversários.43

Não há oportunidade sem oposição.

Quando os seus planos exigem que seu povo mude para produzir mudanças, espere oposição.

2. Um líder espera o momento oportuno Cheguei a Jerusalém e, depois de três dias de permanência ali...

O momento é tudo. Alguma vez você viu morrer uma boa idéia porque não era tempo para colocá-la em pratica? O tempo muda tudo. Neemias sabia que isso também se aplicava a motivação das pessoas.

Depois de chegar a Jerusalém, esperou três dias antes de começar. Não entrou na cidade, cavalgando sobre um cavalo branco com bandeiras hasteadas e bandas militares tocando. Não proclamou: "Aqui estou para salvar a situação. E agora, vamos trabalhar!". Não saiu correndo a casa de ferragens do lugar para conseguir as provisões. Nem sequer anunciou o motivo da sua vinda. Seu diário diz que durante três dias não fez nada. O que aconteceu durante aqueles três dias? Neemias não fez nada a respeito de seus planos, mas sabemos que estava fazendo alguma coisa. O mais provável e que estivesse descansando, recuperando-se da longa viagem pelo deserto. Uma viagem assim esgotaria qualquer um. Nunca tome uma decisão de importância quando você esta cansado! É muito provável que decida erradamente. A fadiga prejudica nossos pontos de vista. Sabemos que Neemias era um homem de oração, de modo que e provável que tenha passado momentos em oração. O mais provável e que também estivesse fazendo planos, revendo sua estratégia. 43 1 Coríntios 16:8,9 44 Neemias 2:11 Sem dúvida, estava também despertando curiosidade. Imagine o que as pessoas do lugar pensaram: aqui vem esta figura, com uma escolta do rei, e entra cavalgando em uma cidade derrotada e desalentada. Então vai para a casa de seus parentes, e durante os três dias seguintes... nada. Será que isso causou curiosidade? Você acha que as autoridades do lugar quiseram saber o que aquele sujeito trazia em suas mãos? Durante três dias, as hipóteses iam aumentando. Ao terceiro dia, todos tinham ouvido falar de Neemias na cidade. O que você acha que aconteceu quando, finalmente, ele convocou aquela conferencia de imprensa? As pessoas estavam prontas para escutar seus planos. ... tempo de rasgar e tempo de costurar, tempo de calar e

tempo de falar...

Porquanto há uma hora certa e também uma maneira certa

de agir para cada situação.46

Se o que você esta pensando em fazer produzira mudanças na vida ou na situação dos demais, e essencial que espere o momento oportuno. Jesus tinha um profundo senso de oportunidade. Durante sua Jornada até a cruz, muitas vezes ele disse: "não é hora... ainda não chegou meu tempo".

3. Um líder avalia a situação real ... saí de noite com alguns dos meus amigos. Eu não havia contado a ninguém o que o meu Deus havia posto em meu coração que eu fizesse por Jerusalém. Não levava nenhum outro animal alem daquele em que eu estava montado. De noite sai pela porta do Vale na direção da fonte do Dragão e da porta do Esterco, examinando o muro de Jerusalém que havia sido derrubado e suas portas, que haviam sido destruídas pelo fogo. 47

Esta e a cavalgada da meia-noite de Neemias, como a famosa cavalgada da meia-noite de Paul Revere. Em lugar de advertir as pessoas de que se aproximava uma invasão inimiga, que para Jerusalém não era um perigo iminente, Neemias percorre os muros da cidade e os inspeciona. No meio da noite, com a única ajuda de um pequeno grupo, sai para inspecionar pessoalmente os danos. Diferentemente de Paul Rever, Neemias não quer chamar a atenção.

Todo bom líder e capaz de compreender o que Neemias estava fazendo. Estava realizando sua inspeção previa. Estava comprovando 45 Eclesiastes 3:7 46 Eclesiastes 8:6 47 Neemias 2:12,13 o contexto da situação. Este é o aspecto da liderança do qual nunca ouvimos falar: e a parte solitária do trabalho. A preparação, a comprovação de dados e a investigação não tem nada de encantador nem de emocionante. Sem elas, porem, o plano está condenado ao fracasso.

É possível que, já a esta altura, Neemias estivesse se sentindo desanimado. Ao examinar o problema e ver como era grande, deve ter pensado: "Isto e muito pior do que eu imaginava! Que vou fazer? Nunca tive de enfrentar um problema assim era toda a minha vida". Os oficiais não sabiam aonde eu tinha ido ou o que eu estava fazendo, pois até então eu não tinha dito nada aos judeus, aos sacerdotes, aos nobres, aos oficiais e aos outros que iriam realizar a obra.48

Por que Neemias manteve tanto segredo com respeito a essa inspeção? Não queria que detivessem os seus planos antes mesmo de começar. Sabia que, para que aceitassem seus planos, necessitava estar armado com dados preciosos. Você já notou alguma vez como 6 fácil matar uma boa idéia? As pessoas negativistas tendem muito mais a expressar suas idéias do que as pessoas otimistas. Como Neemias não contava ainda com todos os dados, começou a trabalhar em silêncio, reunindo informações antes de anunciar o que ia fazer.

Os grandes líderes protegem seus planos de uma morte prematura.

Compre a verdade e não abra mão49 dela, nem tampouco da sabedoria, da disciplina e do discernimento.

Quem responde antes de ouvir comete insensatez e passa vergonha.50

O inexperiente acredita em qualquer coisa, mas o homem prudente vê bem onde pisa.51

Os bons líderes fazem a própria investigação. Antes de começar a igreja Saddleback, passei cerca de seis 48 Neemias 2:16 49 Provérbios 23:23 50 Provérbios 18:13 51 Provérbios 14:15 meses estudando a região, reunindo estatísticas, escrevendo, falando com as pessoas e recolhendo informações. Aprendi de memória ruas, recolhi estatísticas do censo e escrevi para outros pastores da região. Quando finalmente saí para registrar e inspecionar a região, não disse a ninguém o que estava fazendo. Estava realizando meu trabalho prévio de preparação. Hoje em dia nós exigimos dos pastores que façam investigações do tipo demográfico na região antes de começar uma igreja filial. E importante ter nas mãos esses dados antes de começar todo projeto que transforme vidas. Neemias compreendeu que enfrentava oposição, criou curiosidade e reuniu todos os dados. Finalmente, estava pronto para tornar públicos os seus planos e começar a formar sua equipe de colaboradores. Seu próximo desafio era fazer com que os israelitas se sentissem entusiasmados com o que ele fora fazer ali. 4. Um líder se identifica com seu povo Então eu lhes disse: Vejam a situação terrível em que estamos: Jerusalém esta em ruínas, e suas portas foram destruídas pelo fogo. Venham, vamos reconstruir os muros de Jerusalém, para que não fiquemos mais nesta situação humilhante. também lhes contei como Deus tinha sido bondoso comigo e o que o rei me tinha dito. Eles responderam: "Sim, vamos começar a reconstrução". E se encheram de coragem para a realização desse bom projeto.52 Neemias não se apresentou como o estranho que havia aparecido no momento exato para resgatar Jerusalém de seus tristes fracassos do passado. Não apresentou uma mensagem negativa, nem culpou ninguém. Quando alguém lança a culpa sobre os outros, diminui a motivação deles. O que Neemias fez foi aceitar a culpa. Identificou-se com a frustração e animou-se a fazer uma avaliação sincera do problema. Disse: "Eu sou um de vocês, e este problema e nosso". Os bons líderes se identificam com seu povo. As pessoas se sentem motivadas a trabalhar para alguém que divide sua carga, e tem uma visão para alcançar sua meta. Todos os pais descobrem que os filhos respondem melhor quando sentem que são compreendidos e quando os pais se identificam com seus problemas. Os grandes líderes compreendem isto: As melhores idéias não são minhas, nem suas; mas nossas. 5. Um líder não esconde a seriedade do problema 52 Neemias 2:17,18 Neemias foi sincero em sua mensagem. Ele disse: "Tenho umas idéias, mas primeiro vocês precisam saber realmente como a situação esta ruim". Não tratou de atenuar o problema. O que ele fez foi dramatizá-lo. Ao ressaltar o quanto a situação estava seria, apelou para suas emoções. Por que ele usou essa tática? Ele sabia que eles viviam anos daquela forma, e, enquanto não lhes importasse o suficiente, não mudariam nada. Você já observou que, quando alguém vive durante muito tempo uma situação ruim, começa a ignorá-la? Quando alguém vive dentro de determinada situação por tempo suficiente, por pior que seja, pode tornar-se apático com respeito a ela. Neemias, ao voltar a centrar a atenção do povo no problema que estava vivendo por décadas, fê-los enfrentar a realidade. Depois que o líder enfrenta a realidade, necessita que sua equipe a enfrente lambem. As mudanças não se produzirão enquanto não nos sentirmos descontentes com o status quo. Os líderes criam o descontentamento. Eles sabem que e a única forma de produzir a mudança, quer seja no lar, na escola, no negocio ou na sociedade. Quando as pessoas conformam com o que há, nada muda. Quando você cria descontentamento, saiba que estará procurando críticas. Todos os que mexem com as coisas buscam problemas. Essa, porem, é a marca de um líder. Neemias usou dois pontos de motivação. Em primeiro lugar, apelou para a auto-estima. Ele disse: "Somos o povo de Deus. Não deveríamos estar vivendo no meio destruída. No entanto, olhem ao redor! A cidade esta em ruínas. Os muros estão caídos. O lugar e um desastre e é só um monte de escombros. Isso e vergonhoso. Nós podemos fazer melhor que isso". Aquelas pessoas devem ter sentido Neemias como um sopro de ar fresco. Aquele líder era diferente dos outros. Não estava envolvido com a própria agenda, mas preocupava-se com eles. Compreendia o problema; sabia que estavam desmoralizados. Sabia o que precisava fazer para restaurar o nível de auto-estima. E sabia a maneira de fazer com que eles o quisessem alcançar também. Em um nível mais profundo apelou para a preocupação deles com a gloria de Deus. Aquela situação também era vergonhosa para o Senhor. Os judeus eram o povo de Deus, e agora o mundo inteiro ria deles. "Dizem que adoram o Deus verdadeiro", diziam outros zombando, "mas nem sequer podem reconstruir a própria cidade. Como e possível que esse Deus seja grande, quando eles estão vivendo entre escombros e nem sequer podem reconstruir os muros?". A situação existente em Jerusalém era vergonhosa para Deus. Para os judeus, que proclamavam crer em um Deus todo-poderoso, era um testemunho muito pobre. Talvez, pela primeira vez, Neemias sinalizou que o modo pelo qual eles estavam vivendo era uma infâmia para o nome de Deus. Ele disse o que os outros observavam a seu respeito. Como importaria para eles o Deus dos judeus, quando aos próprios judeus não lhes importava como representavam a seu Deus? Ao dramatizar o problema, Neemias apelou para uns motivadores internos: a auto-estima e a gloria de Deus. Poderia ter utilizado prêmios e incentivos, mas era suficientemente apto para saber que os motivadores externos só funcionam com crianças. Poderia ter oferecido umas férias no Mar Morto com todas as despesas pagas, mas sabia como a maioria iria reagir. Ele sabia que precisava apelar para o senso judeu de orgulho e honra, a fim de realizar aquele formidável projeto que embelezaria a comunidade. Aqui está outro princípio que Neemias compreendia e que você também precisa compreender: A maior motivação da vida não é a externa nem a interna, mas a eterna. Neemias convocou as tropas com este grito de guerra: "Pela gloria de Deus, reconstruamos os muros! Pelo reino de Deus e a gloria de seu povo!". Com aquelas palavras, inspirou sua equipe para que realizasse o que até então lhes era impossível. Tudo o que faltava era a motivação correta. 6. Um líder exige uma resposta especifica Neemias sabia que as coisas não funcionariam se ele se limitasse a convocar uma grande reunião, encorajasse todo mundo, e depois os enviasse para suas casas. O que proclamou foi um chamado a ação. "Vamos reconstruir os muros!", disse-lhes, e pediu sua ajuda. Ele lhes pediu uma resposta especifica. Ele sabia o que o esperava. Não se enganava com um sonho impossível. Era um homem realista, mas, ao mesmo tempo, otimista. Esse e o equilíbrio que todo bom líder precisa ter. Depois de contemplar os montes de escombros e as atitudes de apatia que se tornaram realidade diária em Jerusalém, Neemias poderia ter-se dado por vencido e retornado a Babilônia. Entretanto, ele foi alem da realidade para contemplar a possibilidade. Viu o que era Jerusalém, mas também viu o que a cidade poderia ser. Essa é outra das características de todo grande líder: é capaz de inspirar a outros a grandeza. Neemias era da classe de líderes. Você também pode ser. Os grandes líderes vêem tanto o real como o ideal.

Vêem o que e, mas também vêem o que pode vir a ser. Uma pessoa que só vê o que pode vir a ser, e não o que e, não é líder, mas um visionário. há uma grande diferença. Uma pessoa que vê o que e, mas não o que poderia vir a ser, não é um líder, mas um contador. Para ser um grande líder, você precisa ver tanto o real como o possível. Quando uma pessoa encarna em si mesma estas duas qualidades, o produto final e uma grande liderança.

Os líderes que vêem tanto o real como o ideal, sabem que para alcançar o ideal necessitam de ajuda. E não tem medo de pedir essa ajuda. A maioria das pessoas não pede ajuda. Cometemos o erro de pensar que, ou ninguém quer nos ajudar, ou nós somos tão extraordinários, que não necessitamos de ajuda. A liderança que produz mudanças permanentes requer um trabalho em equipe. Neemias viu que os muros que rodeavam Jerusalém não seriam reconstruídos enquanto não houvesse alguém que se levantasse e dissesse: "Se queremos restaurar nossa cidade e a reputação de Deus, vamos ter de nos sacrificar. Fazer isto vai exigir tempo, dinheiro, esforços e energias". Os líderes pedem uma resposta especifica. 7. Um líder encoraja com seu testemunho pessoal Neemias relatou aos israelitas como Deus o havia chamado com o mesmo propósito de que reconstruíssem os muros. Ele lhes falou de quando havia ouvido as noticias que chegavam de Jerusalém, de como havia clamado a Deus, da preocupação que sentia pela cidade e de como as circunstâncias confirmaram esse chamado. "Orei e orei", lhes disse, "e um dia Deus me disse: "Por que você não se converte na resposta?". Então, a preocupação se converteu em visão. "Esta bem, Senhor, eu vou fazer", eu lhe disse. Na realidade, a idéia foi de Deus. "Então acudi ao rei, e o rei me disse que sim. Até me deu uma guarda da cavalaria e me disse que ele pagaria tudo". Deus confirmou o chamado. Se alguém se aproxima para dizer: "Deus me mandou fazer isto", e adequado que lhe pergunte: "Existe alguém que tenha confirmado esse chamado? Esta seguro de que não é uma idéia sua? há algum sinal que o confirme?". Quando Deus me deu a idéia de organizar a igreja Saddleback, eu reconheci que não era uma ocorrência minha. Eu me sentia bem onde estava servindo a Deus, era Fort Worth, Texas. Então, ele me pós no coração que eu fosse para a Califórnia, para começar uma igreja. Depois confirmou seu chamado por meio de uma serie de milagres. Nunca serei um gênio, mas não tenho dúvida alguma de que Deus me chamou para começar a igreja Saddleback. E isso me faz sentir um temor reverencial. Quando e Deus que diz para realizarmos o que temos em nosso coração, ele mesmo o confirma e não nos deixa com dúvidas. Também lhes contei como Deus tinha sido bondoso comigo e o que o rei me tinha dito. Eles responderam: "Sim, vamos começar a reconstrução". E se encheram de coragem para a realização desse bom projeto.53 Quando Neemias explicou como Deus o havia chamado, e depois como as circunstancias haviam confirmado esse chamado, o povo se entusiasmou. Durante 90 anos, Jerusalém estivera envolvida em uma rotina sem esperança. Agora, Neemias aparecia com uma mensagem fresca e evidências dignas de credito: "E Deus quem me pôs aqui para que fizesse isto", disse-lhes, "e temos a autorização do rei. O mesmo rei que lhes disse 'não' no passado, agora esta disposto, até mesmo, a pagar a obra". Havia captado a atenção deles. A visão havia sido transferida. A princípio, Neemias a guardou com cuidado e não disse nada a ninguém. Uma vez que havia terminado sua investigação sobre a situação, quando se apresentou o momento oportuno, começou a falar as pessoas. Primeiro exagerou a situação para desperta-los do espanto em que estiveram envolvidos durante aqueles anos. Pediu-lhes que respondessem, ajudando a reconstruir os muros. Deu-lhes ânimo contando sua historia pessoal. Quando o povo viu a mão de Deus naquilo, a visão deixou de pertencer somente a Neemias. Agora pertencia a todo o povo. O segredo havia sido revelado. Neemias compreendia que as pessoas se sentem mais inclinadas a seguir pessoas, que a seguir programas. Por isso, usou seu testemunho pessoal para motivá-los. Compreendia o poder da experiência pessoal. Os povos seguem aos líderes.

Tornem-se meus imitadores, como eu o sou de Cristo.54

Este é um momento excelente para que você se faca a pergunta: Por que razão alguém me seguiria como líder?

A resposta é: "As pessoas me seguirão como líder quando puderem ver a mão de Deus sobre minha vida".

Esta é a única prova real da liderança: É evidente o Espírito de Deus em sua vida? Se não é, você não é uma pessoa a ser seguida por outros. A liderança não é questão de estudos e talentos, mas e questão das evidencias de que o Espírito de Deus se acha sobre a vida da pessoa.

Deus tem colocado sua mão sobre sua vida? 53 Neemias 2:18 54 1 Coríntios 11:1

8. Um líder responde a oposição com rapidez e firmeza Quando, porém, Sambalate, o horonita, Tobias, o oficial amonita, e Gesém, o árabe, souberam disso, zombaram de nós, desprezaram-nos e perguntaram: 55 "O que vocês estão fazendo? estão se rebelando contra o rei” A hostilidade diante do projeto de Neemias estava crescendo. No princípio, tratava-se somente de Sambalate e Tobias. Agora Gesém os acompanhava. E um esquema típico. A hostilidade cresce à medida que o projeto avança. Mais adiante, descobriremos que as hostilidades lhe vinham de seis frentes distintas. Neemias enfrentou oposição de todos os lados! Primeiro, "zombaram de nós, desprezaram-nos e perguntaram". Zombaram quando ouviram falar do plano. Os muros estiveram em ruínas por noventa anos. Por acaso o construiriam agora? Para seus inimigos, tudo aquilo era uma gozação. Quando a oposição não deteve o projeto, eles o acusaram de rebelião contra o rei. Essa tática havia funcionado em uma ocasião e deteve a edificação dos muros, portanto por que não utilizá-la novamente? Se o rei chegava a crer que estava perdendo uma fonte de renda, era certo que deteria o projeto. Agora, entretanto, não funcionou, porque Neemias estava na cena e não puderam tirá-lo da situação. Eu lhes respondi: O Deus dos céus fará que sejamos bemsucedidos. Nós, os seus servos, começaremos a reconstrução, mas, no que lhes diz respeito, vocês não tem parte nem direito legal sobre Jerusalém, e em sua historia não há nada de memorável que favoreça vocês!56 Neemias negou-se a discutir. Sabia que a reconstrução dos muros era idéia de Deus, e, portanto, limitou-se a declarar isso. Ele disse que o projeto c a idéia procediam de Deus. E uma vez que aquilo tudo era idéia de Deus, tudo o que o povo precisava fazer era confiar que Deus lhes faria prosperar. Quando você se encontrar em uma situação parecida, e souber que Deus está do seu lado, o mais sábio e não discutir com seus opositores. O que Neemias fez foi revelar os motivos egoístas de seus inimigos. Compreendia que se Jerusalém fosse reconstruída, isto reduziria o tamanho do reino deles, assim era lógico que eles se opusessem ao projeto. Revelou os motivos deles. Quando eles o acusaram de se rebelar contra o rei, Neemias limitou-se a pegar as 55 Neemias 2:19 56 Neemias 2:20 cartas que tinha, e que estavam assinadas pelo próprio Artaxerxes. Isto os calou... pelo menos por um tempo. O fato de ver Neemias defendendo sua causa fez com que a moral dos judeus crescesse enormemente. Depois de anos de derrota, finalmente há-via alguém que não tinha medo de defendê-los. Neemias não teve medo de dizer a seus inimigos: "vocês não tem direito histórico algum sobre esta i idade". Meus irmãos, não se admirem se o mundo os odeia.57 Se você começa a trabalhar para Deus, pode ter certeza de que sofrera oposição. Quando outros ridicularizarem você por sua posição a favor de Deus, não se surpreenda. No mesmo momento em que fizer uma declaração pública da sua fé, você se convertera num alvo para os que não compartilham dela. Isto e certo na vida, façamos o que façamos, haverá sempre quem não estará de acordo conosco. A única forma de evitar critica na vida é não fazer nada, não ser ninguém e não dizer nada. Uma vez que você decidir por viver para Jesus Cristo, haverá alguém, em algum lugar, que vai rir de você. Pode ter certeza disso; deixe que eles riam. As pessoas vão colocar em julgamento sua motivação, como estes fizeram com Neemias, ao desafiá-lo dizendo: "Por acaso você esta tratando de construir seu império? você esta querendo alimentar seu ego, querendo fazer o que nenhum outro fez em noventa anos?". Tudo isto faz parte do preço da liderança.

Quando compramos o terreno para a igreja Saddleback, começaram a surgir rumores por todo o vale Saddleback, onde iríamos nos localizar. "A igreja de Saddleback que esta lá era cima" sussurravam as pessoas, "acabou de comprar mais de 50 hectares. Quem eles pensam que são?". O assunto nunca teve a ver com arrogância. A pergunta não era sobre "quem nós acreditávamos que éramos", mas sobre "quem cremos que Deus é".

O tamanho de seu Deus determina o tamanho de suas metas. Todo mundo necessita de Jesus. Quando Deus nos da uma visão, não podemos colocar limites ao que Deus quer fazer com ela. A visão e de Deus, não é sua nem minha. Colocar limites seria o cúmulo da arrogância. Sincera-mente, não temos direito algum de fazer isso.

Você já saiu alguma vez para empinar pipa num dia de vento? 57 1 Jo 3:13 Observe que a pipa vai subindo contra o vento e não a favor dele. São estas correntes de ar que se chocam contra ela e fazem com que suba cada vez mais alto. Lembre-se das pessoas que se opõem ao sonho que Deus lhe deu. Pense numa pequena pipa e responda a seus opositores com rapidez e firmeza.

Você e um subgerente que sonha ascender a uma posição executiva? Há uma forma correta de enfrentar as responsabilidades, e outra incorreta. Quando chegar o dia em que você estiver acima de seus companheiros, se você agir como se o tempo todo você merecesse, haverá pessoas que se oporão. "Quem ele pensa que e?", sussurrarão em suas costas. Aprenda a lição da resposta diplomática que Neemias deu diante de sua repentina ascensão.

Como um ajudante de Artaxerxes, Neemias se encontrava num papel de gerência de segunda. Então, foi promovido de repente a líder do projeto de reconstrução dos muros. A muitas pessoas lhes custaria uma mudança assim. O aumento repentino de poder e demasiado para eles. "você conhece alguém que passou por uma situação como essa?". Neemias nos mostra a forma de manejar com delicadeza a transição entre postos de trabalho, o poder e as hostilidades. Durante noventa anos, as pessoas estiveram dizendo: "Não é possível fazer. Estes muros estão em ruínas, e assim vão continuar. O trabalho e grande demais". Agora aparece em cena Neemias, pronto para por mãos a obra. Transforma uma comunidade hostil e apática em uma equipe entusiasmada, pronta para começar. E faz isso em três dias. A partir de seu exemplo, vamos rever os passos que deu, de modo que você possa aprender a ser um líder como ele. Vamos refletir...

• Tenha certeza de que lhe farão oposição. As

oportunidades sem oposição não existem. Por mais excelente que

seja sua idéia, você deve esperar que alguém tente desacreditá-la.

você precisa estar consciente disso, antes de começar, e se afastar

do tipo de angústia que pode fazer que você ponha tudo a perder,

mesmo antes de ter começado. Se Deus esta nos seus planos, ele

vai enfrentar essas oposições.

• Espere o momento oportuno. Quando vier uma grande

idéia, não aja de forma precipitada contando a todos os seus

conhecidos. Mantenha em segredo por um tempo e espere o

momento oportuno. Assegure-se de estar descansado. Assegure-se

de que dedicou tempo a oração e ao planejamento. Há um

momento oportuno para cada coisa.

• Enfrente a realidade. Quando propuser algo a alguém,

não se apresente sem que tenha todos os dados em mãos. Quando lhe disserem: "E isto, o que e?", não vai ser agradável para você ter de responder: "Não tinha pensado nisto". Vá armado com dados e cifras para respaldar aquilo de que quer falar. Relembre o que diz a Palavra: "O inexperiente acredita em qualquer coisa, mas o homem prudente vê bem onde pisa."58 Os bons líderes investigam as coisas por sua conta.

• Identifique-se com as pessoas. O líder que diz: "Eu estou

aqui para dizer o que tem de ser feito" não conseguira ganhar o respeito das pessoas. Neemias não chegou empurrando e dizendo: "Vim para reconstruir os muros. Se quiserem me consultar, estarei em meu escritório". Em lugar disso, o que disse foi: "Temos um problema, e isto e o que necessitamos fazer com ele. Reconstruamos". Um grande líder compreende o poder que tem a identificação, a apropriação e o trabalho de equipe.

• Dramatize o problema. Neemias apresentou uma imagem

clara do problema, com o rim de acentuar sua gravidade. Desde o princípio disse que o trabalho ia ser duro. Em todo sentido, foi sincero com o povo quanto ao que lhes esperava. Ao mesmo tempo, reconheceu o valor que tinha apelar a seu sentido de orgulho como povo escolhido de Deus, e ao seu desejo natural de glorificar a Deus. Esse era o maior de todos os motivos. Quando você enfrentar dificuldades, não guarde só para você. Comunique suas necessidades com a equipe de tal modo, que eles se sintam inspirados a ajudá-lo. Os grandes líderes inspiram a trabalhar em equipe.

• Peça uma resposta especifica. Neemias disse com todo o

realismo: "Preciso de ajuda. Eu sozinho não posso fazer isso". Em seu otimismo, também lhes disse: "Sei que podemos conseguir, se trabalharmos juntos. Vamos reconstruir os muros!". Deixe que as pessoas conheceram, com exatidão, o que você precisa que façam, e depois encoraje-as, assegurando-lhes que, com a ajuda de Deus, podem conseguir. 58 Provérbios 14:15

• Encoraje com seu testemunho pessoal. As pessoas

respondem de maneira positiva aos testemunhos da obra de Deus em nossa vida, como aconteceu no caso de Neemias. Ele falou da benção de Deus, da visão e da confirmação por meio das circunstancias, e as pessoas creram. Sua fé foi edificada e desafiada pelo que ouviram. Se, para Deus, era tão importante ver os muros reconstruídos, como eles iriam negar-se a fazê-lo? Houve uma transferência de visão. Agora, o sonho pertencia ao povo. Podiam ver a mão e o Espírito de Deus na vida de Neemias, e estavam prontos para segui-lo. Quais são as evidencias de que a mão de Deus esta sobre sua vida?

• Responda com rapidez e firmeza aos opositores. Neemias sabia que era inútil discutir. Como você age com os que se opõem a você? Se seus planos e sonhos vem de Deus, a batalha também e dele.

Se você é líder, deve compreender que há planos que Deus tem para sua vida, e metas que quer alcançar por meio dela, e que há pessoas que não vão gostar de sabê-lo. Esteja certo disso. Haverá alguém, em algum lugar, que não estará de acordo com a direção pela qual Deus o está levando. Será necessário que você se posicione.

Nós, cristãos, precisamos ser realistas quanto à popularidade da nossa decisão de seguir a Cristo. Nem todo mundo vai reagir de forma positiva diante do que temos decidido fazer. Na verdade, e possível que haja aqueles que se oponham com todas as suas forças. Tanto você quanto eu, precisamos estar preparados para as críticas e para sermos ridicularizados. Você esta disposto a viver para Jesus Cristo, sem se importar com o que os outros pensam?

Esse é o começo da liderança.

Pai, por meio destes oito passos, me mostraste como um líder motiva e encoraja as pessoas durante as mudanças. Senhor, ao olhar ao nosso redor, vemos que em nossa vida, em nossa igreja, em nossa família, em nossa escola e em nosso mundo são necessárias muitas mudanças. Ajuda-nos a estar preparados para quando chegar a oposição. Ajuda-nos a ser prudentes como serpentes, mas mansos como as pombas, e a estar dispostos a esperar o momento adequado. Lembre-nos de que precisamos recolher dados, prever com antecipação os problemas e nos identificar com as pessoas, em lugar de atuar como se fôssemos superiores, como se tivéssemos sido chamados pessoalmente para mudar o mundo. Faze de nós líderes que digam:"Este problema e nosso". Ajuda-nos a pedir coisas especificas e a não ter medo de pedir ajuda de pessoas. Ajuda-nos a viver com a tensão entre o real e o ideal e a obter um equilíbrio entre ambos, a fim de sermos eficazes para ti. Sobretudo, peço-te pelos que estão lendo este livro, para que vivam de tal maneira, que seja evidente que tua mão e teu Espírito estão sobre sua vida. Quando isso acontecer, estaremos prontos para viver. Que nossa vida seja um livro aberto. Que sejamos pessoas que caminham em tua presença com integridade, credibilidade e sinceridade. Que, ao virem nossa vida, as pessoas Vejam que, embora não sejamos perfeitos, estamos nos esforçando ao máximo para viver para ti. Pai, se há alguém entre nós que não pode dizer:" Tornem-se meus imitadores, como eu o sou de Cristo ", ajuda-o a mudar agora mesmo. Dê-lhe o desejo de dizer: Eu quero ser assim. Quero ser uma pessoa que possa dizer: "Tornem-se meus imitadores, como eu o sou de Cristo". Compreendemos que as pessoas nem sempre estarão de acordo com nossa posição a favor de Cristo, e não respeitarão nossos valores. Tu nos disseste que não era para nos surpreendermos se o mundo nos odiasse por tua causa. Ajuda-nos a dar-nos conta de que nossa recompensa e no céu; tu nos advertiste que tivéssemos cuidado quando os homens falassem bem de nós. Ajuda-nos a nos preocupar mais em agradar a ti do que em agradar aos demais. Pedimos-te isso em nome de Jesus. Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 4

Como um líder motiva outros

Aplicando os propósitos de Deus

Comunhão — Cumprir uma grande missão requer muitas mãos trabalhando juntas.

• Depois de ler este capítulo, que passos você pode dar para assegurar que o grupo que você lidera entende a visão e está pronto para "reconstruir a muralha"?

• Como você pode ajudar a enfrentar os fatos e visualizar as possibilidades?

Discipulado — Os líderes que vêem o futuro são visionários, os que vêem o presente são realistas. Neemias pode ver o real e a visão, o que era e o que poderia ser.

• Ainda que não seja sua natureza ser um realista-otimista,

como você pode desenvolver essas qualidades?

• Escreva algumas idéias que Deus revelou a você e planeje

colocá-las em pratica durante esta semana.

Ministério — Conhecer as necessidades de nossos companheiros crentes requer uma ação recíproca. Quando a mudança é necessária, os líderes devem confrontar seu grupo com os atos e as situações atuais.

• Como as pessoas vêem o promotor de mudanças?

• Estude o exemplo de Neemias 2.17 e observe como Neemias motivou a mudança, apelando para a auto-estima das pessoas e sua preocupação com a gloria de Deus.

• De que maneira você pode ser como Neemias em seu grupo, família, igreja ou comunidade?

• Anote enquanto ora e busca a direção de Deus. Submeta sua ação ao Senhor.

Evangelismo — Antes de nos tornarmos eficazes em alcançar o mundo para Cristo, precisamos saber que Cristo nos chamou para alcançá-lo. Neemias orou e recebeu um encargo da parte do Senhor. Depois de orar por quatro meses e descobrir que sua preocupação persistia, deu-se conta de que havia sido chamado pelo Senhor para fazer algo a respeito disso.

• Há algo pelo que você esta orando há muito tempo e em que ainda não viu nenhuma mudança?

• Talvez Deus esteja pedindo que você se converta em um

agente de mudança. Quem você conhece que precise do amor de

Deus em sua vida?

• Como você pode se converter em um representante de Cristo para oferecer esse amor?

Adoração — Quando adoramos a Deus, enaltecemos o seu nome. Isso significa que estamos reafirmando e aproximando seu caráter aos outros por meio de nossa vida. Neemias se apresentou diante de uma comunidade que havia negado a provisão de Deus por décadas.

• Como podemos estar seguros de que fazemos o mesmo?

• Como líder, em que você pode ser como Neemias,

encorajando outros a refletir a verdadeira e amada imagem de

Deus?

• O que você pode fazer para comunicar que a adoração e

uma atividade de tempo integral?$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Neemias não chegou a Jerusalém como o estranho que vinha salvar a cidade; ele se identificou com o povo dizendo 'vejam a situação terrível em que ESTAMOS', assumindo o problema como nosso, pois 'as melhores ideias não são minhas nem suas, mas nossas'. Quando você precisa mobilizar pessoas para uma mudança, você tende a falar de cima ('vim dizer o que tem de ser feito') ou a se identificar e dividir a carga com elas? Que diferença isso tem feito na resposta delas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Warren ensina que Neemias motivou o povo apelando não a prêmios externos, mas a motivadores internos e eternos — a autoestima do povo de Deus e, sobretudo, a glória de Deus, pois 'a maior motivação da vida não é a externa nem a interna, mas a eterna'. Ao tentar engajar sua equipe, sua célula ou sua família, em que tipo de motivação você tem se apoiado, e como seria mobilizá-los pela glória de Deus e não por incentivos passageiros?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O capítulo afirma que 'não há oportunidade sem oposição' e que Neemias respondeu aos zombadores 'com rapidez e firmeza', sem entrar em discussão, lembrando que a visão era de Deus. Diante de quem ridiculariza ou questiona o que Deus colocou no seu coração ('quem ele pensa que é?'), como você costuma reagir, e o que significaria, no seu caso, responder com firmeza sem se deixar paralisar pela crítica?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 5 — Como um líder organiza um projeto  (aula ordem = 5)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 5;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 5 — Como um líder organiza um projeto$t$,
      5,
$conteudo$Mas tudo deve ser feito com decência e ordem. 59 A motivação sem organização leva a frustração. Que princípios um líder deve seguir a fim de assegurar que tudo seja feito, como disse Paulo: "com decência e ordem"? Uma vez mais, Neemias nos entrega um esquema que podemos seguir. 1. Um líder simplifica Neemias tinha um projeto enorme, mas para organizá-lo tinha um plano simples. Diferentemente de muitos líderes atuais, não recriou a organização, nem traçou gráficos complexos; tudo o que fez foi ver como as pessoas estavam agrupadas e organizou-as de acordo com isso. Por meio do livro, o vemos criar equipes de sacerdotes, os homens de Jerico, os filhos de Hassenaa e os homens de Tecoa. Estas pessoas já estavam associadas entre si. Se você não precisa uma organização nova, não a crie. Faca tudo o que puder para trabalhar com o que já existe. Com demasiada freqüência, os líderes novos se precipitam a mudar toda a organização, somente para que se pareça com a idéia que eles têm. Há um velho refrão que se aplica a isto: "Se algo não está rasgado, não o remendes". De todos os grupos humanos, o mais autêntico é a família. Neemias compreendia a fortaleza e o apoio que se encontram nas famílias. Por isso, todas às vezes que era possível, colocava as pessoas em seus postos por famílias. As organizações mais sólidas são as mais simples. Olhe, por exemplo, os brinquedos das crianças. Os bons blocos feitos a moda antiga são basicamente inquebráveis. Os brinquedos mais complicados quebram tão logo se brinca. Isso também e certo no que diz respeito às organizações. Quanto mais complexas sejam, mais se rompem. As organizações mais simples são as mais fortes. 2. Um líder seleciona uma equipe Muitos líderes passam o tempo tratando de envolver os 59 1 Coríntios 14:40 preguiçosos e os apáticos, em lugar de focar em trabalhar com os que querem trabalhar. Eu chamo a isso "dar com os burros n'água". Aprenda isso agora, e economize muitas horas de frustração: Trabalhe com os que querem trabalhar. Neemias envolveu todos os habitantes da cidade na reconstrução dos muros. Os líderes religiosos abriam caminho, enquanto homens e mulheres, gente da cidade ou das zonas rurais, trabalhadores intelectuais ou manuais, levantavam os tijolos. Havia perfumistas, líderes do governo e líderes do mundo dos negócios. Todos estavam erguendo tijolos e fazendo a massa. Todos, ou melhor, menos um pequeno grupo... O trecho seguinte foi reparado pelos homens de Tecoa, mas os nobres dessa cidade não quiseram 60 se juntar ao serviço, rejeitando a orientação de seus supervisores. É obvio que esses notáveis se julgavam bons demais para fazer aquele tipo de trabalho. Erguer tijolos era algo inferior para eles. não se diz que desculpas deram, mas aonde quer que você vá, encontrara pessoas assim... egoístas, presunçosas, preguiçosas, que se sentem boas demais para trabalhar. Em todos os projetos há duas classes de pessoas: os que trabalham e os que se esquivam do trabalho. A resposta de Neemias a estes que estavam se esquivando do trabalho foi ignorá-los. Não perdeu tempo com as pessoas que não estavam dispostas a trabalhar. Em vez disso, concentrou seu tempo e suas energias nos que estavam dispostos a trabalhar e ansiosos por fazê-lo. Não perdeu o sono, nem se amargurou, e nem perdeu tempo, tentando colocar no seu posto as pessoas que não queriam trabalhar. Se você e líder, não deve se preocupar com os que não querem se envolver. Trabalhe com os que querem se envolver. Estes são os que funcionam em equipe. Quando eu comecei em Saddleback, ainda não havia aprendido esta lição. Cada vez que planejávamos um projeto, uma reunião de trabalho ou um evento, eu ficava mais tempo desanimado com os que não estavam presentes, do que feliz pelos que tinham chegado. Finalmente, Deus me mostrou que necessito sentir-me entusiasmado pelos que atendem, pelos que querem envolver-se. É preciso esquecer os demais. Eles são os que perdem. Isso não quer dizer que não se deva amar os que abandonam o trabalho... mas não permita que eles o joguem pra baixo. Os líderes amam a todos, mas se movem com os que se movem. Concentre-se nos que disserem: "Eu quero participar". Não perca tempo com os que inventam desculpas. 60 Neemias 3:5 3. Um líder delega tarefas Quando estiver organizando, reparta tarefas especificas. Divida o projeto de acordo com as tarefas a realizar e, depois, assinale as pessoas determinadas. O que você acha que teria acontecido se Neemias, depois de despertar o interesse pelo projeto, tivesse dito: "vocês podem começar a trabalhar onde quiserem"? E se ele dissesse: "Vamos para aquele pedaço do muro, vamos trabalhar todos ali juntos, ao mesmo tempo"?Tudo teria sido uma confusão, um caos, os trabalhadores tropeçando uns nos outros... em lugar de ter um muro, o que se obteria era um desastre. Neemias caminhou ao redor de todo o muro e o dividiu com todo cuidado. É provável que usasse aquela cavalgada da meia-noite para dividir mentalmente o muro em seções. Quando você estiver organizando projetos, mantenha as coisas simples, trabalhe com os que querem trabalhar, e depois lhes de tarefas especificas. Delegue o trabalho. A delegação de trabalho e outro aspecto difícil da liderança. Pode chegar a ser duro soltar algo e confiar nos outros. Se, no entanto, pensarmos que Deus, o Deus do Universo, nos confia sua obra, talvez nos pareça um pouco mais fácil delegar a nossa. Isto e chave para o sucesso de qualquer projeto. Veja agora as tarefas que envolvem o trabalho de delegar:

•Divida as grandes metas em tarefas pequenas

Os grandes trabalhos podem parecer assustadores, mas, se você os divide em tarefas menores, tornam-se realizáveis. Neemias atacou o problema da construção dos muros — um trabalho tão grande, que estava sendo postergado por noventa anos —, dividindo-o em seções menores. A igreja Saddleback começou com umas doze pessoas. Eu transformei cada pessoa em um comitê de uma pessoa, cada uma com suas responsabilidades específicas. Uma imprimia os boletins, outra recolhia os pratos das ofertas, outra era responsável pela tesouraria, outra cuidava da Escola Dominical... O fato de cada um ter as próprias tarefas fez com que o esforço de preparar a nossa reunião de domingo fosse um sucesso.

•Desenvolva descrições claras das tarefas — Todos têm o

direito de saber o que se espera deles.

•Entregue a cada pessoa a tarefa que mais se ajuste a sua

FORMA

(acróstico que desenvolvi no livro Uma vida com propósitos.)61 61 São Paulo: Vida, 2003; a obra de Erik REES, Formado com um propósito (são Paulo: Vida, 2007) trata do uso das habilidades complexas do ser humano a serviço de Deus. [N. do E.]. Quando se delega um trabalho a uma pessoa errada, produz-se um caos, e, por trás dele, problemas de motivação. Saber delegar significa compreender as tarefas e também as capacidades dos membros de sua equipe, com o fim de por as responsabilidades corretas nas mãos dos líderes que melhor as possam desempenhar. Depois de seis meses de vida, uma de nossas igrejas filiais não parecia ter futuro. Qual era o problema? A questão era que tínhamos errado na escolha do pastor para aquela congregação. A idade media não era a adequada para ele. Nós o transferimos para outra igreja, e, no final de um ano e meio, havia boa freqüência e crescimento. É necessário ter a pessoa certa no lugar adequado, para que Deus possa abençoar a obra. O que é responsabilidade de todos não é responsabilidade de ninguém. Alguém tem que assumir a responsabilidade concreta de cada coisa. 4. Um líder motiva Ao seu lado, Jedafas, filho de Harumafe, fez os reparos em

frente da62sua casa, e Hatus, filho de Hasabneias, fez os reparos ao

seu lado.

Depois, Benjámim e Hassube fizeram os reparos em frente

da sua casa, e ao lado deles Azarias, filho de Maaseias, filho de

Ananias, fez os reparos ao lado de sua casa. Depois dele, Binui,

filho de Henadade, reparou outro trecho, desde a casa de Azarias

até a esquina do muro, e Palal, filho de Uzai, trabalhou em frente

da esquina do muro e da torre que sai do palácio superior, perto

do pátio da guarda. Junto a ele, Pedaias, filho de Paros, e os

servos do templo que viviam na colina de Ofel fizeram os reparos

até em frente da porta das Águas, na direção do leste e da torre

que ali sobressaia. Depois dele os homens de Tecoa repararam

outro trecho, desde a grande torre até o muro de Ofel. Acima da

porta dos Cavalos, os sacerdotes fizeram os reparos, cada um em

frente da sua própria casa. Depois deles Zadoque, filho de Imer,

fez os reparos em frente da sua casa. Ao seu lado

Semafas, filho de Secanias, o guarda da porta Oriental, fez

os reparos. De-pois, Hananias, filho de Selemias, e Hanum, filho

de Zalafe, fez os reparos do outro trecho. Ao seu lado, Mesulão,

filho de Berequias, fez os reparos em frente da sua moradia.63

Quando você organizar um projeto permita que exista a idéia de pertença. Ajude as pessoas a sentirem que o projeto lhes pertence. Por toda essa seção das Escrituras, nós encontramos pessoas as quais 62 Neemias 3:10 63 Neemias 3:23-30 Neemias colocou para trabalhar em seções dos muros que estavam perto de suas casas. As pessoas trabalham com mais dedicação quando tem um interesse pessoal. Quando alguém permite que exista a idéia de pertença no projeto, a conseqüência e uma alta motivação. Se eu estou edificando a parte do muro que vai proteger minha casa, vou fazer um bom trabalho. Não apenas isto, mas trabalhando perto de casa, não estou distante. Economizo tempo, energia e custos, quando designo pessoas para trabalhar perto de suas casas, e ao mesmo tempo, as pessoas se sentem donas do projeto. Faça com que o trabalho seja o mais conveniente possível. Tanto você quanto sua equipe vão tirar proveito desta forma de pensar: O sumo sacerdote Eliasibe e os seus colegas sacerdotes

começaram o seu trabalho e reconstruíram a porta das Ovelhas.

Eles a consagraram e colocaram as portas no lugar. Depois

construíram o muro 64

até a torre dos Cem, que consagraram, e até a

torre de Hananeel.

A porta das Ovelhas era o lugar onde se sacrificavam esses animais para o templo, e por isso Neemias designou aquele lugar aos sacerdotes. Ao permitir que cada um trabalhasse próximo da região de seu interesse, demonstrou o princípio de organização. As boas organizações permitem que os trabalhadores desenvolvam suas áreas de trabalho. A igreja Saddleback foi edificada sobre o Ministério dos leigos. Temos um ditado: Se você tem uma idéia, o dom e o interesse, então isso te diz respeito. Toda vez que podemos, permitimos que as pessoas de nossa igreja se sintam donas de seus Ministérios. Esta sensação de pertencer e um princípio fundamental para a organização e o sucesso em qualquer projeto. 5. O líder promove a unidade O trabalho em equipe e essencial para realizar qualquer projeto, seja qual for o seu tamanho. Como líder, faca tudo o que puder para trabalhar bem em equipe. Por todo o livro de Neemias, lemos a expressão "a porção seguinte" ou "a seguinte porção". Ao trabalhar em equipes bem organizadas com pessoas que já se conheciam e já haviam trabalhado juntas, as pessoas se ajudavam e se encorajavam mutuamente. Mais adiante, dentro do mesmo livro, descobrimos que, em todo o tempo que estiveram edificando os muros, estiveram sob ataque. Eles necessitavam uns dos outros, necessitavam colaborar entre si, e 64 Neemias 3:1 trabalhar bem juntos. Aquilo era crítico, não só para seu sucesso, mas também para sua sobrevivência. B. C. Forbes, fundador da revista Forbes, dizia: "A palavra sucesso se soletra E-Q-U-I-P-E". A colaboração é um princípio chave necessária para a boa organização. Henry Ford dizia: "Reunir-se e um bom começo, manter-se juntos e progredir, pensar juntos e ter unidade, e trabalhar juntos e triunfar". Juntos, podemos fazer coisas que não podemos fazer sozinhos. Os gansos podem voar por volta de 72% mais longe quando vão em formação, do que quando voam sozinhos. quem você pensa que lhes ensinou a fazer isso? Deus, claro. Onde há colaboração e trabalho de equipe, há um grande crescimento. A colaboração e um motivador maior do que qualquer competição, faz sentir-se alguém que faz parte de uma equipe ganhadora. As pessoas influenciam umas as outras. É melhor ter companhia do que estar sozinho, porque maior

e a re-compensa do trabalho de duas pessoas. Se um cair, o amigo

pode ajudá-lo a levantar-se. Mas pobre do homem que cai e não

tem quem o ajude a levantar-se!65

Já que você esta em uma organização, em um negocio, em uma igreja, em um clube social ou em um Ministério leigo, siga estes princípios:

• Mantenha as coisas simples,

• Trabalhe com os que querem trabalhar;

• Designe tarefas específicas;

• Permita um sentido de pertencer e

• Encoraje o trabalho em equipe.

As boas organizações proporcionam um clima de apoio onde há confiança mutua e trabalho em equipe. A Bíblia usa as palavras "um ao outro" cinqüenta e oito vezes ao referir-se aos cristãos da igreja. É como se Deus nos dissesse: "Captem a mensagem! Ajudem-se uns aos outros!". Não existe nenhum cristão que viva como um cavaleiro solitário. Neste mundo, estamos juntos e precisamos uns dos outros. Somos uma equipe. Existe um poder gigantesco na colaboração. Deus pode deixar passar quase tudo na igreja: os edifícios pobres, a falta de edifícios e inclusive a pobreza da doutrina. No entanto, há uma coisa que ele não esta disposto a deixar passar: a desunião. Nos dez primeiros capítulos do livro de Atos, encontramos dez vezes as expressões "todos juntos", "de comum acordo", "unidos". 65 Eclesiastes 4:9-10 Quando você tiver a unidade que a igreja tinha no livro dos Atos, terá também o poder que vemos neste livro. Há poder no trabalho em equipe. Uma vez alguém disse algo com que eu concordo: "A neve é uma formosa demonstração do que Deus pode fazer com um montão de flocos". Individualmente, cada floco de neve e muito frágil. No entanto, se eles se reúnem o suficiente, podem chegar a deter o transito. Por minha conta, talvez eu não seja capaz de fazer muito. O mesmo acontece com você. Ao contrário, juntos, causamos um impacto. Juntos podemos mudar o mundo para Deus. Isto e trabalho em equipe. 6. Um líder administra Em todos os tipos de projetos, e necessário haver supervisão de trabalho. E interessante observar que o livro de Neemias não menciona nunca o nome do próprio Neemias. Onde estava? Estava em primeira linha supervisando os trabalhos. Estava fazendo o que Tom Peters chama "Geca" 66 (Gerência caminhando), em seu livro "Paixão pela excelência" . Neemias estava caminhando e vendo o trabalho das pessoas, inspecionando e supervisionando continuamente o trabalho. De que outra forma saberia o que cada um estava fazendo? Como você pode saber? Além de inspecionar as obras ele mesmo, Neemias também nomeou supervisores que o ajudaram a controlar, dirigir e administrar o projeto. Vamos ver dois princípios que devemos compreender com o exemplo de Neemias. As boas organizações estabelecem linhas de autoridade claras. Alem das descrições de responsabilidades claras, também há linhas de autoridade claras. Não há confusão quanto a quem deve informar a quem. As pessoas fazem o que você inspeciona, não o que você espera. Você notou como isso e verdade? Se seus trabalhadores sabem que você não os está vigiando, não vão trabalhar. 7. Um líder agradece As boas organizações reconhecem o esforço. O reconhecimento do que os outros fazem para conseguir que seus projetos tornem-se realidade (talvez o principal propósito do terceiro capítulo de Neemias. Aqui ele apresenta uma grande lista de honra a fé, atribuindo méritos aos que os mereceram. Quase três mil anos depois, talvez não possamos pronunciar os nomes, mas ainda os recordamos. Há algumas coisas que precisamos observar acerca deste 66 PETERS, Thomas J. Passion for Excellence. Warner Books, 1986 princípio de reconhecimento. Neemias os conhecia por seus nomes. Este e um dos sinais do bom líder. Neemias menciona trinta e oito nomes, e lhes atribui o mérito de terem feito um bom trabalho no muro. Você sabe quem esta fazendo um bom trabalho em sua organização? Se você sabe, eles sabem que você aprecia o que eles fazem? Você faz com que eles saibam? O reconhecimento e um princípio da boa organização. Um ano, estando em Israel, desci a torrente onde Davi encontrou as cinco pedras polidas que atirou em Golias. Desta mesma torrente recolhi cinco pedras polidas e trouxe comigo para minha casa. Em Betânia, comprei uma pequena funda de um menino na rua. Quando cheguei em casa mandei fazer uma placa com as pedras, a funda e esta inscrição: "Estou olhando para o Golias ou para o Deus vivo?". E coloquei nela nome de "Premio para o Matador de Gigantes". Cada mês, eu entrego essa placa p ara o membro da nossa equipe que tenha enfrentado o maior problema naquele período. Isso não quer dizer que o tenha resolvido, mas que o tenha enfrentado. Desenvolva formas de fazer com que as pessoas saibam que estão fazendo um bom trabalho. Tal qual fez Neemias: Depois dele Baruque, filho de Zabai, reparou com zelo outro trecho, desde a esquina do muro até a entrada da casa do sumo sacerdote Eliasibe. As palavras "com zelo" são as únicas palavras descritivas que há neste capitulo. Outros são reconhecidos por realizarem seu trabalho, e há aqueles que não trabalharam de forma alguma. Este homem fez seu trabalho de tal modo, que Neemias anotou sua atitude. Trabalhou com entusiasmo. Quase três mil anos mais tarde ainda conhecem o seu nome. Não sabemos com exatidão o que ele fez. Talvez tenha trabalhado mais rápido que os demais, ou durante mais horas, ou talvez tenha demonstrado uma atitude especialmente positiva. Graças a seu entusiasmo, Baruque continua sendo um exemplo para nós, hoje. Se você quer que reconheçam seu trabalho, faça-o com entusiasmo. Deus vê o entusiasmo. Esta na Bíblia. Em grego, a palavra "entusiasmo" significa "possuído por Deus". Quando e Deus quem o possui, nota-se. Salum, filho de Haloes, governador da outra metade do distrito de Jerusalém, fez os reparos do trecho seguinte com a ajuda de suas filhas. 67 Neemias 3:20 68 Neemias 3:12 Naqueles dias, as mulheres não faziam trabalhos de homem. Culturalmente, era raro que elas fossem reconhecidas. No entanto, Neemias as reconheceu. Ele atribuiu o mérito a quem era devido. Creio que o único propósito pelo qual Neemias escreveu o terceiro capítulo foi o de demonstrar o valor do reconhecimento. O trecho seguinte foi reparado pelos homens de Tecoa, mas os nobres dessa cidade não quiseram se juntar ao serviço, rejeitando a orientação de seus supervisores.69 É interessante o fato de que, enquanto Neemias está honrando a tantos pelo trabalho feito, lembra agora esses supostos "notáveis" pelo que não fizeram. Que epitáfio! Graças a Neemias são milhares de milhares de pessoas que leram desde aqueles tempos a respeito dos esforços dos que construíram o muro e também a respeito dos que não se esforçaram para levantar nem um só tijolo. As boas organizações reconhecem e recompensam os esforços. Enquanto lia esta lista de honra de Neemias, pensava em minha igreja, a igreja Saddleback. Quem são os que estariam nesta lista de honra? No decorrer dos anos nossa igreja cresceu tanto, que não me e possível conhecer a todos, e sei que são milhares os que colaboram, e cujos nomes e rostos e possível que eu nunca chegue a conhecer nesta terra. O que dizer a essas pessoas? São muitas as igrejas que funcionam com o princípio do 80/20: vinte por cento das pessoas fazem oitenta por cento do trabalho. Isto e certo no sentido físico, e também no financeiro, e o e na maioria das igrejas. Não deveria ser assim, porque isso significa que todos os demais estão obtendo algo que não ganharam. Ao contrário, Neemias não se enraiveceu por causa dessas pessoas. O fato de elas não terem participado não lhe importunou. Ele preferiu concentrar-se nos que estavam trabalhando e esquecer dos que não queriam trabalhar. "Não tenho o direito", disse, "de me deixar ser importunado pelo fato de que há pessoas que nunca vão fazer nada para servir. Talvez venham durante semanas, meses ou anos, e nunca participarão de nada. Deus o sabe, e um dia, é ele quem recompensará". Assim, cada um de nós prestara contas de si mesmo a Deus.

A Bíblia diz que Neemias tinha uma lista. E você? Esta na lista de Deus? Um dia, quando comparecer diante dele, vai olhar a lista e 69 Neemias 3:5 70 Romanos 14:12 você saberá se participou em sua obra ou não. A Bíblia diz que um dia eu vou prestar contas a Deus da minha vida, com respeito a forma pela qual o servi. E você também.

E se vocês não forem dignos de confiança em relação ao que e dos outros, quem lhes dará o que e de vocês?71

Deus vai pedir contas do que você fez com o que ele lhe deu! Ele esta fazendo uma lista da mesma forma que Neemias tinha sua lista de reconhecimentos. Deus esta mantendo um relatório de meu trabalho e da minha mordomia... e dos seus também. Na realidade, não importa o que os outros pensem. Nem sequer importa quem sabe as coisas. O que importa e que Deus sabe. O que Deus vai dizer acerca do meu trabalho? Ele dirá "Bem feito, servo bom e fiel", ou dirá, "Por que você não fez mais? Qual e a sua desculpa?". O que Deus vai dizer sobre você? Se esse fosse seu ultimo momento na terra, "o que Deus diria sobre a forma como você o tem servido?" Portanto, meus amados irmãos, mantenham-se firmes, e que nada os abale. Sejam sempre dedicados a obra do Senhor, pois vocês 72sabem que, no Senhor, o trabalho de vocês não será inútil. Deus não pediu a nenhum de nós que construíssemos um muro. No entanto, ele nos pediu que nos envolvêssemos no Ministério. Ser cristão significa ser chamado para o Ministério. Nem todos vamos ser pastores, nem vamos renunciar ao nosso trabalho para nos dedicar integralmente a obra do Ministério. No entanto, todos os cristãos, si in, temos sido chamados para servir; para ministrar aos outros. O cristão que não serve, não serve e é uma contradição. Deus espera de nós que nos envolvamos servindo aos outros. Assim como cada um de nós tem um corpo com muitos membros e esses membros não exercem todos a mesma função, assim também em Cristo nós, que somos muitos, formamos um corpo, e cada membro esta ligado a todos os outros. Temos diferentes dons, de acordo com a graça que nos foi dada. Se alguém tem o dom de profetizar, use-o na proporção da sua fé. Se o seu dom e servir, sirva; se e ensinar, ensine; se e dar ânimo, que assim faca; se e contribuir, que contribua generosamente; se e exercer liderança, que a exerça 73com zelo; se e mostrar misericórdia, que o faca com alegria. 71 Lucas 16:12 72 1Coríntios 15:58 73 Romanos 12:4-8

Pergunte-se: "Qual e a minha função dentro do corpo de Cristo? Qual é o meu lugar dentro da igreja? Que parte do muro estou levantando?"

Deus deu a cada um de nós distintos dons com diferentes propósitos. No entanto, não permita que esses dons se interponham no caminho do ministério prático. Não use como desculpa o "esse não é meu dom". Sim, você deve trabalhar no aspecto que lhe interessa. Sim, você deve trabalhar naquilo para o que recebeu dons espirituais. Você deve utilizar seus dons no aspecto fundamental do serviço a realizar. No entanto, Deus também o chama para trabalhar alem do que abarcam seus dons espirituais. De todos os que estão nas listas de Neemias, não há nenhum que fosse construtor profissional de muros. Nenhum deles tinha "o dom" de colocar tijolos e fazer massa. Havia farmacêuticos, joalheiros e ourives. Eram pessoas que trabalhavam com suas mãos, mas quando precisaram dessas mãos para erguer um muro, não tiveram medo de encher essas mãos de calos. Certa vez, conversei com Peter Drucker, o consultor de negócios mais destacado do mundo. "Tenho uma igreja cheia de gerentes", disse-lhe. "Todos são empregados públicos e executivos. Não posso lhes pedir que todas as semanas arrumem as cadeiras". "Por que não?", respondeu-me. "Eles precisam. Qualquer executivo que não estiver disposto a arrumar as cadeiras não serve para nada". Todos precisam desenvolver um coração de servo, em vez de ser como aqueles notáveis que diziam: "Isso seria me rebaixar!". Se não houvesse outro motivo, pense no que o povo poderia ler e aprender de você daqui a 3.000 anos. Neemias menciona três tipos de pessoas: estavam os que não trabalharam, os que trabalharam um pouco e um que fez seu trabalho com entusiasmo. Deus percebe as três atitudes. Ele soube quem não fez absolutamente nada, quem fez o que lhe correspondia, notou o que foi alem do que lhe correspondia por dever e trabalhou com entusiasmo. Como e a sua participação na obra de Deus? O que Deus esta observando a seu respeito? Kenneth Strachan, missionário na América do Sul, fez esta afirmação que e conhecida como "o teorema de Strachan": "A expansão de qualquer movimento se encontra era proporção direta ao seu sucesso enquanto mobilizar a todos os seus membros na propagação direta de suas crenças". Tudo quanto possamos dizer acerca do crescimento das nossas empresas, poderemos dizê-lo porque houve pessoas que se interessaram o suficiente para participar delas. Se a igreja Saddleback não me tivesse superado, o que fez já há muitos anos, ainda tenamos entre cinqüenta e sessenta pessoas. Em Saddleback, porem, há centenas de pessoas que tem um grande coração. E na sua organização existem muitos grandes corações também. Deus se interessa pelo que você esta fazendo. Ainda que ninguém mais o perceba, Deus, sim, o vê e se lembra de você. Ele esta escrevendo tudo, e um dia no céu vai mostrar-lhe essa lista. As Escrituras dizem que não damos um copo de água fresca no nome de Jesus, sem que isso fique registrado. O que você fizer no nome de Jesus, lhe será recompensado na eternidade. Este impressionante princípio e uma ilustração da verdade que se afirma na Palavra de Deus: "Toda a Escritura e inspirada por Deus e útil para o ensino, para a repreensão, para a correção e para a instrução na justiça, para que o homem de Deus seja apto e plenamente preparado para toda boa obra".74 Até em uma passagem que não passa de uma lista de trinta e oito pessoas e o que eles fizeram num muro há 3.000 anos, podemos observar que estes princípios de organização são para todos os tempos. Talvez você esteja em um cargo de liderança ou de administração em algum lugar, e consiga ver de imediato a forma de aplicar na sua organização estes sete princípios. No entanto, para a maioria de nós, acho que a mensagem e que Deus vê tudo o que se faz em seu nome, e se interessa o suficiente para anotar tudo o que ele vê. Considero que um cristão que não serve, não serve. Não compreendo como uma pessoa pode entender o que Jesus Cristo fez por nós, o tamanho do seu sacrifício por nós, e nunca lhe querer devolver nada. Creio que Deus está falando com você. Talvez você possa ouvi-lo: "você precisa achar um lugar onde servir". Existe um bom número de coisas que estamos fazendo neste momento, que não vão significar nada daqui a dez anos, neste momento, sim. Convido você a se juntar a maior das causas do mundo: o Reino de Deus. Você não pode fazer na vida nada mais importante do que levar Cristo aos outros; ajudá-los a crescer no Senhor e a se converterem em membros da sua família. As Escrituras nos dizem que, assim como cada um de nós possui um corpo com muitos membros, e esses membros não têm todos a mesma função, também em Cristo, nós somos muitos, formamos um só corpo, e cada um dos membros pertence aos outros. Temos dons diferentes e precisamos utilizá-los. Lendo isto, você poderá dizer: "Senhor, percebo que estas falando comigo. Não quero buscar mais desculpas, como aqueles notáveis tão preguiçosos. Quero achar um lugar onde possa te devolver parte da minha vida em serviço e Ministério. Quero que a 74 2 Timóteo 3:16,17 minha vida sirva para algo. Quero ter um impacto significativo. Um dia, quando eu comparecer diante de ti para prestar contas, mais do que qualquer coisa, quero ouvir estas palavras: 'Muito bem, servo bom e fiel. Porque, então, saberei que tudo terá valido a pena. Obrigado pela tua Palavra". Pai, estou muito grato pelos que estão lendo este livro; pelos

que tem tornado a decisão de aprender acerca da eficácia da

liderança. Nenhum deles tem a obrigação de fazer isso. O fato de

eles estarem fazendo isso significa que estão preocupados com o

crescimento espiritual e com as questões do espírito. Todos

precisam chegar mais perto de ti. Todos precisam de um lugar

onde servir, dar, compartilhar e onde investir a sua vida para a

eternidade. Peco-te que uses estes princípios para nos motivar a

ação. E o que te peço em nome de Jesus. Amém.

GUIA PARA APLICÃO DO PRINCÍPIO 5

Como o líder organiza um projeto?

Aplicando os propósitos de Deus

O que Deus lhe tem falado por meio desta lição sobre suas aptidões de organização?

Comunhão — O sucesso de qualquer organização depende do trabalho comprometido de seus membros. Infelizmente, e fato que, na maior parte das organizações, os 20% realizam 80% do trabalho.

• Como teria Neemias enfrentado essa realidade?

• Como você pode ser mais como Neemias no seu papel de

liderança?

• Pense em como colocar o foco nas pessoas que fazem o

trabalho mais do que nas que não o fazem, e em como

recompensar esses bons trabalhadores. Se você ainda não tem um

programa de reconhecimento na sua organização, crie um e

comece a aplicá-lo. Se você já tem esse programa, garanta que

esses trabalhadores saibam que você pessoalmente aprecia seu

trabalho.

Discipulado — Como líder, você e responsável pelo crescimento deles na sua organização. Isto significa que você deve crescer como um discípulo de Cristo. Pense em Jesus como um Neemias na sua vida.

• Como ele aplica esses 7 princípios no seu crescimento?

• Você e um participante entusiasta?

• Em que sentido aplicar esses 7 princípios poderia ajudá-lo

a crescer como líder?

Ministério — As pessoas florescem quando servem em áreas que podem tornar suas.

• O que você pode fazer para ajudar os membros do seu

grupo a identificar os papéis que Deus tem moldado para eles?

• O que mais você poderia fazer para ajudá-los a desenvolver

esses papéis?

• Mantenha-se informado acerca das aulas que se oferecem,

e incentive as oportunidades educativas ou seja você mesmo o

tutor pessoal dos membros do seu grupo.

Evangelismo — alcançar o mundo para Cristo se assemelha muito a reconstrução dos muros. O evangelismo, assim como o trabalho, se faz melhor perto de casa.

• Como você pode reconstruir relacionamentos na sua vida

que causem impacto em outros para Cristo?

• De que maneira uma boa organização poderia ajudá-lo a

encontrar seus objetivos evangelísticos?

• Perto de você, com quem poderia reconstruir um muro

relacional na atualidade?

Adoração — Quando passamos tempo com Deus, não podemos deixar de refletir a sua presença diante dos outros. No seu tempo de oração nesta semana, peca a Deus que o ajude a desenvolver sua personalidade de lide-rança. Faça as seguintes perguntas:

• Como você pode refletir mais de Deus perante os que

o rodeiam.

• Por que Deus quer que você faca isso?

• Onde Deus quer usar você com suas mãos e seus pés,

agora?

• Quando você deve agir sobre o que Deus lhe esta

revelando?

•Escolha uma das 7 características de liderança e concentre-se

nela.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Warren diz que Neemias não perdeu tempo com os nobres de Tecoa que se recusaram a trabalhar; ele concentrou energia nos que queriam trabalhar, porque 'os líderes amam a todos, mas se movem com os que se movem'. Na sua liderança, você tem se desanimado e gastado mais tempo com os ausentes e resistentes do que se alegrado e investido nos que estão dispostos? O que mudaria se você focasse em quem quer caminhar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo mostra que Neemias delegava dando às pessoas tarefas perto de suas casas, gerando senso de pertença, e que 'o que é responsabilidade de todos não é responsabilidade de ninguém'. Pensando no grupo que você lidera, há tarefas vagas que ninguém de fato assumiu, ou pessoas servindo fora da sua 'forma' e dons? Como você poderia delegar de modo que cada um sinta o trabalho como seu?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O capítulo inteiro 3 de Neemias, com 38 nomes, existe segundo Warren para ensinar o valor do reconhecimento — Neemias conhecia as pessoas pelo nome e registrou até quem trabalhou 'com zelo'. Quem na sua organização, família ou ministério tem feito um bom trabalho sem nunca ouvir de você que é valorizado, e que passo concreto você daria esta semana para reconhecer pessoalmente esse esforço?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 6 — Como um líder enfrenta seus opositores  (aula ordem = 6)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 6;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 6 — Como um líder enfrenta seus opositores$t$,
      6,
$conteudo$Como você enfrenta a oposição? Sente-se em pânico quando o pressionam? Fica tenso, perde o controle, sente-se desalentado ou se da por vencido? O que você faz? A descrição de responsabilidades de um líder inclui fazer frente aos ataques. O quarto capitulo de Neemias refere-se á estratégia de batalha: as táticas dos oponentes, os efeitos dessa oposição e a resposta correta do líder. 1. Um líder faz frente à oposição

• As táticas dos oponentes

Quando Sambalate soube que estávamos reconstruindo o

muro, ficou furioso. Ridicularizou os judeus e, na presença de

seus compatriotas e dos poderosos de Samaria, disse: "O que

aqueles frágeis judeus estão fazendo? será que vão restaurar o seu

muro? Irão oferecer sacrifícios? Irão terminar a obra num só dia?

será que vão conseguir ressuscitar pedras de construção daqueles

montes de entulho e de pedras queimadas?" Tobias, o amonita,

que estava ao seu lado, completou: "Pois que construam! Basta

que uma raposa suba lá, para que esse muro de pedras desabe!"

Ouve-nos, ó Deus, pois estamos sendo desprezados. Faze cair

sobre eles a zombaria. 75E sejam eles levados prisioneiros como

despojo para outra terra.

O escárnio e a primeira tática que os nossos inimigos costumam escolher, como mostra essa passagem. Depois de tantos anos, e uma estratégia que ainda funciona hoje. Muitos dos livros que você acha nas estantes relacionados aos negócios hoje falam da guerra psicológica no escritório. Se você e cristão, aumente a intensidade da batalha. O mundo não crente ridiculariza a igreja. As pessoas nos denigrem, discutem conosco, zombam de nós, caracterizam-nos como fracos, ignorantes e fanáticos, ou dizem que todos os pastores são fracos e covardes, ou caloteiros. A zombaria e constante, e é eficaz porque ataca a nossa auto-estima. Podemos suportar quase tudo, menos o ridículo. O ridículo e sempre o substituto do raciocínio, como podemos ver no ataque de Sambalate. O riso e sempre o substituto da lógica. Quando alguém o ridiculariza e provável que tenha medo de 75 Neemias 4:1-3 que você esteja com a razão. Eles têm medo de que você triunfe. Sambalate recorreu ao insulto: "aqueles frágeis judeus". Com isso ele estava insinuando que a motivação deles era egoísta, e zombava das suas crenças. Estava exagerando nas acusações. Essas são as ferramentas típicas do escárnio. "Irão terminar a obra num só dia?", perguntou. No entanto, ninguém havia sugerido tal coisa. Ninguém havia dito que o muro seria reconstruído em um dia. O exagero das acusações e uma tática típica do escárnio. Primeiro, criam uma imagem falsa do que acontece, e depois, procuram derrubá–la Ainda mais: o escárnio e algo contagioso. Uma vez que Sambalate lançou seus ataques verbais, seu comparsa, Tobias, lança o seu. Toda vez que alguém começa a ridicularizar, sempre há alguém que o segue. São os covardes que nunca teriam dito uma palavra por conta própria. Nesse meio tempo fomos reconstruindo o muro, até que em

toda a sua extensão chegamos a metade da sua altura, pois o povo

estava totalmente dedicado ao trabalho. Quando, porem,

Sambalate, Tobias, os árabes, os amonitas e os homens de

Asdode souberam que os reparos nos muros de Jerusalém tinham

avançado e que as brechas estavam sendo fechadas, ficaram

furiosos. 76Todos juntos planejaram atacar Jerusalém e causar

confusão.

Os inimigos tramam uma resistência, e, agora, em lugar de um punhado de críticos, o que temos já e uma conspiração. Sambalate agitou os descontentes para que resistissem ao projeto de construção dos muros que Neemias havia lançado. Com Sambalate e os samaritanos ao norte, os árabes ao sul, Tobias e os amonitas ao leste e os homens de Asdode ao oeste, os judeus estavam rodeados. Para onde quer que olhassem, viam pessoas conspirando contra eles. Você já notou como as pessoas negativistas tendem a se juntar? Há alguns cujo único propósito na vida parece ser opor-se aos demais. E os nossos inimigos diziam: "Antes que descubram qualquer coisa ou nos vejam, estaremos bem ali no meio deles; vamos mata-los e acabar com o trabalho deles". Os judeus que moravam perto deles dez vezes nos preveniram: "Para onde quer3 que vocês se virarem, saibam que seremos atacados de todos os lados". A forma mais rápida de espalhar um rumor e se alimentar dos medos que as pessoas tem. "Antes que descubram qualquer coisa ou nos vejam, estaremos bem ali no meio deles", diziam. O certo e que não tinham esse tipo de poder. O rumor de um ataque foi suficiente 76 Neemias 4:6-8 para incitar ao pânico. Quando alguém compreende que seus inimigos usarão rumores para atacá-lo, podem-se preparar para resistir a sua violência Os rumores caracterizam-se por duas coisas:  1) Sempre são espalhados pelos que estão mais perto do inimigo: "Os judeus que moravam perto deles". Os judeus que moravam fora da cidade e perto dos inimigos eram os mais negativistas. Você já esteve rodeado por gente negativista? Quando estamos, nós também vamos nos tornando negativistas. E como um vírus que nos infecta. Se o inimigo consegue infiltrar alguém dentro do acampamento que diga: "Isso não pode ser feito", terá conseguido uma grande vitoria. Ele o sabe, e assim se dedica a infiltrar-se em nossas fileiras. *  2) Os rumores vão se tornando mais exagerados a medida que se repetem: "dez vezes nos preveniram. Quando se exagera dez vezes um rumor, as pessoas começam a acreditar. Acho que foi Hitler quem descobriu que, se alguém repete uma mentira durante tempo suficiente, as pessoas começam a acreditar nela. A questão é a seguinte: O ponto de vista negativo sempre é exagerado nos projetos. Os líderes não engolem os rumores. Talvez os escutem, e cheguem até a ruminá-los durante algum tempo... mas nunca os engolem. Eles compreendem que os rumores são sempre exageros da verdade.

• O efeito da hostilidade

Enquanto isso, o povo de Judá começou a dizer: "Os

trabalhadores já não tem mais forças e ainda há muito entulho. Por

nós mesmos não conseguiremos reconstruir o muro". E os nossos

inimigos diziam: "Antes que descubram qualquer coisa ou nos

vejam, estaremos bem 77ali no meio deles; vamos matá-los e acabar

com o trabalho deles".

Quando alguém esta trabalhando duro e descobre que esta sendo bombardeado com escárnio, os rumores e a resistência, o natural e que comece a se os rumores. sentir desanimado. O desalento e duplo: a intenção e a conseqüência da oposição.

Nesse meio tempo fomos reconstruindo o muro, até que em toda a sua extensão chegamos a metade da sua altura, pois o povo estava totalmente dedicado ao trabalho.78 77 Neemias 4:10,11 78 Neemias 4:6

Quando você acha ser mais provável que apareça o desânimo? Você tem em sua casa algum projeto inacabado? Geralmente, o desânimo aparece quando estamos na metade do projeto.

O desalento tem quatro causas principais: 1. A fadiga: "Os trabalhadores já não tem mais forças." Um corpo cansado pode causar um espírito esgotado e desalentado. Descanse sempre que puder, para evitar este imobilizador de projetos. 2. A frustração: "e ainda há muito entulho". Quando você esta trabalhando num projeto tão gigantesco como o de Neemias, geralmente a frustração e um tema de percepção. Na realidade, os montes de escombros vão diminuindo, mas se continuarmos olhando escombros, isto e arrasador. Se nos limitamos a seguir em frente, poderemos vencer. 3. O fracasso: "Por nós mesmos não conseguiremos reconstruir o muro". Quando você esta esgotado, tudo parece impossível. Vince Lombardi disse: "A fadiga nos converte em covardes". 4. O temor: "E os nossos inimigos diziam: Antes que descubram qualquer coisa ou nos vejam, estaremos bem ali no meio deles; vamos matá-los". Uma das táticas principais do inimigo consiste em induzir ao medo.

Os inimigos sempre têm dois objetivos: dificultar a palavra de Deus e deter a obra de Deus.

• Qual e a resposta correta aos nossos opositores?

O que você deve fazer quando estiverem atacando você? Há alguma forma de oposição as agressões aceita diante de Deus? Veja agora algumas sugestões que procedem de Neemias.

Os líderes dependem de Deus.

• Confie em Deus

Ouve-nos, ó Deus, pois estamos sendo desprezados. Faze cair sobre eles a zombaria. E sejam eles levados prisioneiros como despojo para outra terra. Não perdoes os seus pecados nem apagues as suas maldades, pois provocaram a tua ira diante dos construtores.79 Neemias orou. Que maneira mais fabulosa de aliviar a tensão! 79 Neemias 4:4,5 Quando estiverem ridicularizando você, não o negue, confesse-o. Apóie-se em Deus. Admita tudo diante dele. "Meu Deus nós confiamos que tu nos vais defender", disse-lhe Neemias. Em lugar de se enredar em uma competição de insultos, o que ele fez foi buscar apoio em Deus. Não responda ao insensato com igual insensatez, do contrario você: se igualara a ele.80 Se alguém esta ridicularizando você, não lhe responda. Se você fizer isso não vai ser melhor do que quem esta zombando de você. Apóie-se em Deus e ore. Quanto maior a hostilidade, mais você vai precisar confiar em Deus. A oração e sua grande aliada quando o estão atacando. Quando ridicularizarem você, não enfrente as pessoas, converse com Deus. Neemias fez pouco caso do escárnio e avançou em direção a sua meta. Ore e continue fazendo o que deve ser feito. O escárnio nunca poderá deter o que você esta fazendo, a menos que você permita. Cada vez que atacarem você, a primeira coisa que deve fazer e levar isso a Deus em oração. Ore. Algumas vezes basta ignorar a hostilidade, outras, não. há ocasiões nas quais as críticas se intensificam, façamos o que façamos. Quando Sambalate e seus comparsas descobriram que o povo não estava prestando atenção em suas zombarias, conspiraram para combater Jerusalém. Quando acontecer algo assim com você, leve o fato a Deus. Deixe que seja ele quem dê a força necessária para você terminar o que começou. 2. Os Líderes respeitam seus opositores

• Não subestime seus opositores

"Mas nós oramos ao nosso Deus e colocamos guardas de dia e de noite para proteger-nos deles." Precisamos reconhecer e respeitar a força de nossos inimigos. Neemias fez que orassem ("nós oramos ao nosso Deus") e atuassem ("colocamos guardas de dia e de noite para proteger-nos deles"). Esta muito bem que pecamos a Deus que nos proteja, dizer a noite em

Provérbios 26:4

Neemias 4:9 nossa cama: "protege-me dos ladrões". No entanto, e necessário também que nos levantemos e fechemos a porta. Oliver Cromwell dizia: "Confie em Deus e mantenha a pólvora seca".

Uma petição sem precaução é presunção. Quando o estão atacando, você precisa se apoiar em Deus, e também respeitar seus opositores. Quanto maior for a oposição, maior será a resposta que você vai precisar dar. Até aquele momento, somente Neemias havia orado. Agora, graças a seu exemplo, todos estavam orando. Estavam observando seu líder. Guiamos mais pelo exemplo, que por meio das nossas palavras, por altos e elevados que estejamos. Neemias havia orado constantemente até aquele momento. O povo, que o viu orar, e viu sua fidelidade a Deus, agora começou a orar também. Se você é um líder em seu negócio e quer que outros o sigam, comece a orar. A hostilidade corporativa exige uma resposta também corporativa. Graças ao exemplo de Neemias, todo o povo de Deus havia começado a orar. Então, puseram guarda. Neemias conhecia seus inimigos, de modo que colocou vigilância vinte e quatro horas e estabeleceu um sistema de segurança. Talvez você tenha ouvido dizer: "Guerra avisada não mata as pessoas!". É verdade. No decorrer de toda a historia, os líderes têm pago um preço alto toda vez que subestimaram seus inimigos. Ora, mas há algo além de orar. Mantenha-se vigilante. Conheça seus inimigos e não permaneça ignorante diante do que está acontecendo. Na Bíblia, usa-se uma e outra vez a expressão "vigiai e orai". Jesus disse isso. Paulo disse isso. João disse isso. Pedro disse isso. "Vigiar" é a parte humana: colocar-se em guarda. "Orar" é a parte divina: confiar em Deus. Estamos alertas quando fechamos nossa porta; oramos quando dizemos a Deus que confiamos nele. Faça as duas coisas.

3. Os líderes reforçam os pontos fracos

• Reforce os pontos fracos

Por isso posicionei alguns do povo atrás dos pontos mais

baixos do muro, nos lugares abertos, divididos por famílias,

armados de espadas, lanças e arcos.9

Depois de orar e de fazer andar seu sistema de alarme, Neemias reforçou os lugares mais vulneráveis; aqueles lugares onde a muralha estava mais baixa e que necessitavam de ajuda especial — os lugares onde estava mais alta não necessitavam de tanta vigilância. Você sabe onde estão os pontos frágeis de seu negócio. E em sua família? Onde vocês estão mais expostos a ataques? Este princípio que Neemias esta nos ensinando. Os bons líderes sabem em que pontos são vulneráveis e reforçam esses lugares. Quando estiver fazendo uma apresentação, qualquer que ela seja, reconheça suas debilidades, preveja as objeções. Prepare-se para o que podem lançar contra você. Espere isso, porque e o mais provável que aconteça. Se você estiver preparado poderá evitar um desastre. Daquele dia em diante, enquanto a metade dos meus

homens fazia o trabalho, a outra metade permanecia armada de

lanças, escudos, arcos e couraças. Os oficiais davam apoio a todo

o povo de Judá que estava construindo o muro. Aqueles que

transportavam material faziam o trabalho com uma mão e com a

outra seguravam uma arma, e cada um dos construtores trazia na

cintura uma espada enquanto trabalhava; e comigo ficava um

homem pronto para tocar a trombeta. Então eu disse aos nobres,

aos oficiais e ao restante do povo: A obra e grande é extensa, e

estamos separados, distantes uns dos outros, ao longo do muro.

Do lugar de onde ouvirem o82som da trombeta, juntem-se a nós ali.

Nosso Deus lutara por nós!

Neemias e os habitantes de Jerusalém trabalhavam dia e noite sem parar. Entretanto, não tinham exercito. Todos eram trabalhadores iniciantes que haviam unido forças para levantar a muralha. Não podiam sequer pensar em fortificar a cidade. Por isso, Neemias disse: "Do lugar de onde ouvirem o som da trombeta, juntem-se a nós ali. Então saberemos que o inimigo esta ali, e vamos combatê-lo juntos". Mantenha abertas as linhas de comunicação nos momentos em que estiver sofrendo hostilidades. Neemias transformou a cidade toda em um acampamento armado e todos começaram a fazer duas coisas: trabalhar e carregar a arma. Cada vez que começamos a estabelecer algo para Deus, estamos buscando uma batalha. Tanto que, se é o caso de reerguer o seu casamento, uma igreja ou sua vida espiritual, você esta procurando briga. Satanás vai de encontro a tudo o que Deus abençoa. Ele usa as pessoas para nos fazerem oposição. Os líderes precisam edificar e lutar ao mesmo tempo. Se você esta fazendo algo que tenha importância nesse mundo, alguém ira lhe fazer oposição. Neemias tinha três altemativas diante dos rumores, da resistência e do ridículo. Podia:

Neemias 4:16-20

a. Abandonar tudo. b. Deixar de levantar os muros e ir lutar. c. Edificar os muros e armar-se para a defesa. Ele sabia que as duas primeiras opções não iriam funcionar. Os líderes têm de edificar e batalhar ao mesmo tempo. Neemias não estava disposto a renunciar ao que estava fazendo e era esperto demais para deixar tudo e ir lutar. Se passarmos o tempo todo apagando incêndios, nunca terminaremos o nosso trabalho. Para que seus projetos triunfem, você precisa edificar e batalhar ao mesmo tempo. Por isso posicionei alguns do povo atrás dos pontos mais

baixos do muro, nos lugares abertos, divididos por fam/lias, armados

de espadas, lanças e arcos.83

Por que você acha que Neemias foi estabelecendo o povo era pequenos grupos familiares? Quando nos estão atacando, precisamos de apoio mais do que em qualquer outro momento. Esse e um dos benefícios dos pequenos grupos. Quando estamos em um grupo pequeno, de modo diferente do que quando brincamos de cavaleiro solitário, somos menos vulneráveis aos ataques de Satanás. Deus nunca quis que andássemos sozinhos, por mais invencíveis que pensemos que somos. Nos pequenos grupos há apoio e conforto. Por que ele fez isso por famílias? Neemias compreendia que, se uma pessoa estava trabalhando no muro e estivesse preocupada com sua família no outro extremo da cidade, ia viver em um constante estado de temor. "E se o inimigo estiver atacando lá?", estaria pensando esse trabalhador. "Poderiam acabar com minha família." Por isso, colocou no muro trabalha-dores por grupos familiares. Conhecia a força que tem os laços de família, sabia que as pessoas fazem tudo o que for necessário para proteger os seus. Nunca lute sozinho. Cada vez que tenha de enfrentar a oposição, busque apoio. Esta e uma das razoes pelas quais existe a igreja. Todo fim de semana prego em minha igreja, sabendo que na segunda de manha todos vão retornar para seus trabalhos e a vida voltara a golpeá-los novamente. Este mundo e duro, e para os cristãos pode tornar-se ainda mais duro. No final de semana, as pessoas entram na igreja vendadas e sangrando para serem curadas e enviadas de volta para a batalha. Precisamos de apoio. O mundo dos negócios e duro. É difícil ser cristão em uma escola. É difícil ter atitudes cristas em uma sociedade na qual tudo o que nos rodeia nos diz: "Não! Não viva para Cristo, viva para você mesmo!" 4. Os líderes reafirmam o seu povo

Neemias 4;13

• Reafirme seu povo

Fiz uma rápida inspeção e imediatamente disse aos nobres, aos oficiais e ao restante do povo: Não tenham medo deles. Lembrem-se de que o Senhor é grande e temível, e lutem por seus irmãos, por seus filhos e por suas filhas, por suas mulheres e por suas casas.84 Neemias reuniu os seus. Aliviou seus temores, reforçou sua confiança e lhes levantou o moral. Essa e a tarefa do líder. Quando seu negocio, sua família ou sua igreja estão sob ataque, sua tarefa como líder consiste em dar novas forças a seu povo. Levante-os! Encoraje-os e mantenha-se na luta. Diga que Deus esta do seu lado. Não tenha medo! "Lembrem-se de que o Senhor e grande e temível", lhes disse Neemias. Dele e que vem nossa segurança. Lembre-se do Senhor! E interessante observar que são muitas as guerras que empregaram lemas que começavam com a expressão "lembrem-se". A guerra dos Estados Unidos e Espanha teve o lema "Lembrem-se de Maine". A Primeira Guerra Mundial: "Lembrem-se de Lusitânia". Os texanos continuam dizendo ainda hoje: "Lembrem-se do Alamo". E na Segunda Guerra Mundial se dizia: "Lembrem-se de Pearl Harbor". Todos estes gritos de batalha baseavam-se em alguma derrota grande, digna de ser recordada. É bom que nós recordemos das lições do passado, mas Neemias focou as coisas de maneira oposta. Não disse: "Lembrem-se da nossa derrota. Lembrem-se do nosso exílio na Babilônia". O que ele disse foi: "Lembrem-se do Senhor!" Sua mensagem foi: "Olhem para o futuro. Deus é nossa esperança! Tiremos nossos olhos dos nossos inimigos para colocá-los no Senhor, nosso vencedor". Quando estiver sofrendo um ataque, a meta do Diabo é que sua atenção esteja colocada na oposição. Se ele conseguir isso, terá ganhado a batalha. Você pode escolher: Você pode focar a oposição, ou a Deus. Você pode focar sua situação financeira, ou o Senhor. Pode focar os juros altos, ou o Pai. Pode focar a economia flutuante, ou o Rei do Universo. O que você vai escolher? "Lembrem-se de que o Senhor e grande e temível".

Lembre-se de como Deus é. Ele é grande, é maravilhoso. Quando alguém teme a Deus, quando lhe tem reverencia e respeito, e

Neemias 4:14 reconhece seu poder, não teme nada mais.

O temor do Senhor substitui o temor ao homem. Eu lhes digo, meus amigos: Não tenham medo dos que matam

o corpo e depois nada mais podem fazer. Mas eu lhes mostrarei a

quem vocês devem temer: temam aquele que, depois de matar o

corpo, tem poder

para lançar no inferno. Sim, eu lhes digo, esse vocês

devem temer.

Se você mantém um respeito saudável por Deus; se você o reverencia e percebe o quão poderoso ele e, você não terá problemas ao temer outras pessoas. Então, Neemias os exortou: "lutem por seus irmãos, por seus filhos e por suas filhas, por suas mulheres e por suas casas". Exortouos a lutar pela sua vida. Era preciso que eles percebessem que estavam arriscando tudo por tudo. Então eu disse aos nobres, aos oficiais e ao restante do povo: A

obra e grande e extensa,86e estamos separados, distantes uns dos

outros, ao longo do muro.

Ele sabia que o povo responderia diante de algo tão palpável. Por isso o toque da trombeta era seu sinal de reunião... um sinal destinado a fazer com que se sentissem seguros. 5- Os líderes negam-se a abandonar seu labor  Negue-se a abandonar seu labor "Siga em frente. Não existe nada que possa substituir a perseverança. O talento não a substitui, não há nada mais comum do que os homens com talento que fracassam. O gênio não a substitui, o gênio mal recompensado e quase proverbial. Os estudos tampouco a substituem; o mundo esta cheio de incompetentes com estudo. Somente a perseverança e a firmeza constituem o poder que vence tudo".

CALVIN COOLIDGE

presidente dos Estados Unidos, de 1923 a 1929 Quando os nossos inimigos descobriram que sabíamos de tudo e que Deus tinha frustrado a sua trama, todos nós voltamos para o

Lucas 12: 4,5

Neemias 4:19

muro, cada um para o seu trabalho.87 As hostilidades existem. Por todos os lados há críticos dedicados a ridicularizar e espalhar rumores. Precisamos reconhecer esta realidade e seguir cm frente, tal como fizeram Neemias e os israelitas. Recuse distrair-se. Há um ditado que e muito velho e muito verdadeiro: "Quando caminhar se torna duro, são duros os que caminham". Todos juntos planejaram atacar Jerusalém e causar confusão.88 Esse é o primeiro alvo dos inimigos: provocar confusão. Este é o segundo: E os nossos inimigos diziam: "Antes que descubram qualquer coisa ou nos Vejam, estaremos bem ali no meio deles; vamos matálos e acabar com o trabalho deles"89. A meta de toda hostilidade e criar obstáculos para o seu trabalho até paralisá-lo. O inimigo quer que você renuncie. Este e o momento em que devemos dizer: "De forma alguma!", e continuar trabalhando, aconteça o que acontecer. Dessa maneira prosseguimos o trabalho com metade dos homens empunhando espadas desde o raiar da alvorada até o cair da tarde. Naquela ocasião eu também disse ao povo: Cada um de vocês e o seu ajudante devem ficar à notce em Jerusalém, para que possam servir de guarda a noite e trabalhar durante o dia. Eu, os meus irmãos, os meus homens de confiança e os guardas que estavam comigo nem tirávamos a roupa, e cada um permanecia de arma na mão.90

Quando estamos sob ataque, e o momento de nos mantermos unidos. Neemias abriu o caminho; ele era o que havia estabelecido o ritmo para a obra que estavam fazendo. Não tinha medo de ser o protótipo: sofrer as mesmas provações que o povo sofria, e enfrentar os mesmo perigos.

Os líderes são modelos de perseverança. O líder e o ultimo a se entregar; o ultimo a abandonar o barco. O líder se recusa a se render. Que meta ou sonho o inimigo quer que você abandone? Em que área ele esta sussurrando em seu ouvido: "Abandona! Neemias 4:15 Neemias 4:8 Neemias 4:11 Neemias 4:21-23 Nunca você vai conseguir nada?". Trata-se do esforço de ler toda a Bíblia em um ano? Ou dessa profissão que você sempre quis exercer? De um sonho? Do seu casamento? De uma idéia? De um Ministério na igreja? Você precisa seguir em frente! Um dia, Satanás fez um bazar e vendeu todas as ferramentas que havia usado durante anos. Num canto, porem, estava uma ferramenta a qual ele dava um valor especial e, por isso, colocou um preço maior do que todas as outras juntas. Na verdade não queria vendê-la. A ferramenta era o desânimo. Ele sabia que essa ferramenta tinha funcionado todas às vezes que ele a tinha usado. Então, ficou com ela. Talvez ele nunca o engane, nem o tente pela imoralidade, mas, sim, ele pode desanimá-lo. Satanás sabe que um cristão desanimado e um cristão inútil. Quando deixamos que o desânimo vença, e porque desviamos os olhos do Senhor para focar as circunstancias. Uma vez que Satanás nunca vendeu essa ferramenta, ainda a utiliza nos dias de hoje. Quando nos damos por vencidos, o Diabo ganha. Não se dê por vencido! Certa ocasião, um crente desconhecido escreveu: Não me renderei91 Desejo abandonar, mas não o farei. Pois de dia e de noite, Por Deus e pelo bem, Ainda há batalhas para lutar. Desejo abandonar, mas não o farei, Ainda que me sinta enfermo, e é verdade, Preocupado e sem ânimo, eu sei, Cansado e abatido e tudo o mais, A mim mesmo me alento: não o farei! Não poderia me render. Nunca, jamais! Não verei minha armadura no chão Não me verei desfalecendo, derrotado, Desejo abandonar, mas não o farei.

Traduzido e adaptado por Esteban Fernandez.

Que seja esse o meu clamor e meu cântico Que Deus me fortaleça ao andar Para continuar lutando contra o mal. Ainda que deseje me render, não o farei! A perseverança é a prova máxima da liderança. É a prova do ácido. O que você faz quando o caminho se torna duro? Como você conduz as coisas quando alguém zomba de você por ser cristão? Talvez suas palavras firam você, mas não podem detê-lo. O segredo do sucesso consiste simples-mente em durar mais do que os seus críticos. Lembre-se: o carvalho e só uma pequena noz que se recusou a ceder. Você não precisa ser um gênio; só precisa se manter firme. Com o tempo, você vai continuar alem dos seus críticos. Não existe nada que o Diabo mais queira fazer do que nos atrasar, nos deter, e nos colocar em ponto morto. Você fica tentado em voltar atrás com respeito a algo que Deus pediu que você fizesse? As hostilidades vêm aos montes. Talvez na sua vida, você esteja num desses momentos de maré baixa, mas essa maré voltara a subir. Não se de por vencido! Resista ao desalento. Siga adiante. Nunca se de por vencido. Pai celestial, tu dizes em tua Palavra que não devemos

ignorar as maquinações de Satanás. Devemos dar-nos conta de

que a fonte desta hostilidade é o Diabo, essa serpente antiga.

Sabemos que ele nos quer ridicularizar e organizar a resistência

contra nós. Ele usa os rumores e outras ferramentas que tem em

seu arsenal para nos desalentar. Senhor, quando estivermos

desalentados, quer seja por fadiga, por frustração, por algum

fracasso ou por temor, ajuda-nos a reconhecer a causa. Ajuda-nos

a apoiar-nos em ti. Lembra-nos que não devemos subestimar a

hostilidade contra nós por sermos cristãos; por sermos líderes.

Ajuda-nos a nos darmos conta de que essas hostilidades são na

realidade um privilégio, já que nos permitem compartilhar teus

sofrimentos. Ajuda-nos a reforçar nossos aspectos débeis pelo

poder de teu Santo Espírito. Ajuda-nos a renovar e encorajar as

pessoas que nos rodeiam. E, sobretudo, ajuda-nos a nunca nos

rendermos... porque o fazemos por Jesus. Em seu nome oramos.

Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 6

Como um líder enfrenta seus opositores Aplicando os propósitos de Deus

Alguma vez você esteve rodeado de pessoas que conspiravam contra você?

Comunhão — E duro ser cristão no mundo moderno, não importa onde vivamos. O apoio de outros crentes é essencial para nossa sobrevivência. Quando você esta batalhando contra a oposição, o de que você necessita e apoio. Como o grupo de crescimento ou célula pode evitar que você desmorone?

• Como nosso mundo poderia ser diferente se todos os

líderes políticos e sociais tivessem acesso a um grupo de

crescimento?

• Se você ainda não pertence a um grupo de crescimento ou

célula, integre-se a um. Se você já pertence a um, agradeça a Deus

pelo apoio e alento disponível.

Discipulado — Reconhecer as táticas do inimigo requer maturidade e experiência.

• Quais os passos que você pode tomar para se fortalecer

diante do ataque inimigo?

• Como você pode se preparar para alcançar a fortaleza e o

discernimento necessários para ser um líder eficaz?

• Comprometa-se com o próximo passo e se prepare agora.

Ministério — Quando um líder sustenta seus liderados, esta ministrando a eles.

• Você esta apoiando as tropas, acalmando seus medos e

elevando o moral de seu grupo com regularidade? Se não é assim,

trate de fazer isso e observe a diferença que isso faz.

• Como líder cristão, quem e a sua fonte de confiança?

• Como você pode transmitir essa confiança a seu grupo?

Evangelismo — Se há algo de que podemos estar seguros e que o Diabo não quer que tenhamos êxito em alcançar ao mundo para Cristo.

• Que tipo de oposição você enfrenta em seus esforços de compartilhar Cristo com os demais?

• A oposição pode vir de fora, mas também de nossos pensamentos, dúvidas e temores.

• Como você pode reconhecer as táticas do inimigo, reforçar os pontos débeis e recusar-se a renunciar?

Adoração — Quando Neemias se sentiu frustrado, falou com Deus. Disse a Deus o que estava acontecendo e pediu ajuda. A busca instintiva de Neemias em Deus responde a seu habito regular de ter um tempo com Deus.

• Você investe tempo com Deus diariamente, fortalecendo-se

contra o ataque do inimigo?

• Quando fizer, refletira o caráter de Cristo para os que você

lidera.

• Assegure-se de planejar regularmente o tempo com o

Senhor. De ao Senhor a primeira parte de seu dia, diariamente.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Warren descreve as táticas dos opositores de Neemias — escárnio, rumores exagerados ('dez vezes nos preveniram') e conspiração — e diz que 'os líderes não engolem os rumores'. Quando você é alvo de ridículo ou de boatos por causa daquilo que Deus lhe chamou a fazer, qual tem sido seu padrão: revidar na mesma moeda, desanimar, ou, como Neemias, levar tudo a Deus em oração e seguir trabalhando?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo aponta que o desânimo aparece tipicamente na metade do projeto e tem quatro causas — fadiga, frustração, fracasso e temor — e que Neemias respondeu reforçando os pontos mais fracos do muro. Em que ponto da sua jornada de liderança você está hoje, e qual dessas quatro causas mais tem te ameaçado? Onde está o seu 'ponto baixo do muro' que precisa ser reforçado agora?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Warren ensina que Neemias se recusou a abandonar a obra e que 'os líderes têm de edificar e batalhar ao mesmo tempo', mantendo o povo com os olhos no Senhor ('lembrem-se de que o Senhor é grande e temível') e não na oposição. Que sonho, ministério, casamento ou compromisso com Deus o inimigo tem sussurrado para você abandonar, e o que significaria, na prática, tirar os olhos das circunstâncias e fixá-los em Deus para perseverar?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 7 — Como um líder resolve os conflitos  (aula ordem = 7)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 7;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 7 — Como um líder resolve os conflitos$t$,
      7,
$conteudo$Quando o inimigo ataca sua liderança, usa a trapaça, o desânimo e os perigos. Mas isso não é tudo. A sua seguinte linha de ataque também inclui os conflitos internos. A divisão e a discórdia são armas que usam as pessoas para lutar entre si, e só as tornam ineficazes. A sabotagem interna e um dos piores problemas que um líder pode enfrentar. E como a traição! Satanás fica encantado com isso. Ele adora dividir e vencer. Uma das primeiras armas que utiliza e o dinheiro. Os conflitos causados pelas finanças são mais que qualquer outra coisa. As estatísticas mostram que a maioria dos divórcios tem a ver com problemas financeiros. O inimigo gosta de destruir os casamentos, a instituição na qual Deus nos ensina a relação que há entre Cristo e a igreja. Os problemas internos destroem mais igrejas que qualquer pressão externa. Satanás se dedica a destruir igrejas. Se uma casa estiver dividida contra si mesma, também não poderá subsistir. Você já viu como uma equipe de futebol se autodestrói? Quando há uma equipe de jogadores arrogantes no campo, isso pode acontecer. No lugar de batalhar contra a equipe oposta, lutam entre si. As divisões podem acontecer onde quer que haja duas pessoas ou mais. Nós, seres humanos, lemos a tendência de querer as coisas a nossa maneira. Os conflitos não resolvidos detém a obra do Senhor era nossa vida. Isso e verdade em seu negocio, em seu matrimonio, em sua igreja e em qualquer lugar onde haja pessoas que se relacionam entre si. O líder tem de aprender a resolver os conflitos. Nestas paginas, veremos a canalização dos conflitos e a arte de enfrentálos. Veremos primeiro as causas, e depois aplicaremos a solução.

AS CAUSAS DOS CONFLITOS

Naqueles dias, o povo gastava semanas trabalhando nas

muralhas. Como eles focaram suas energias principalmente ali, não

cultivaram suas hortas. A conseqüência era que a comida estava

Marcos 3:25

acabando.

Ora, o povo, homens e mulheres, começou a reclamar muito de seus irmãos judeus. Alguns diziam: "Nós, nossos filhos e nossas filhas somos numerosos; precisamos de trigo para comer e continuar vivos".93 Havia muitas bocas para alimentar e não havia comida suficiente para todos. Havia inflação, preços altos e escassez de alimentos. Talvez nos perguntemos: se eles estavam fazendo a obra do Senhor, por que ele permitiu que houvesse escassez? Eu creio que o fato de fazer a obra do Senhor não nos isenta dos problemas comuns da vida. só porque estamos fazendo o que devemos, isso não significa que nosso carro não vai quebrar. O fato de estar dedicados ao Ministério não vai evitar as enfermidades graves ou outros problemas. Talvez não saibamos sempre exatamente o porque, mas podemos, sim, saber que o propósito de Deus conosco e que cresçamos sempre. Outros diziam: "Tivemos que penhorar nossas terras, nossas vinhas e nossas casas para conseguir trigo para matar a fome".94

Suas casas estavam hipotecadas ao máximo. Estavam em uma escravidão financeira, tirando dinheiro de suas casas e hipotecando-as cada vez mais, só para por comida na mesa.

E havia ainda outros que diziam: "Tivemos que tomar dinheiro emprestado para pagar o imposto cobrado sobre as nossas terras c as nossas vinhas. 95

O terceiro problema era os impostos elevados. Aquelas pessoas pediam dinheiro emprestado só para pagar os impostos.

Apesar de sermos do mesmo sangue dos nossos compatriotas, e de nossos filhos serem tão bons quanto os deles, ainda assim temos que sujeitar os nossos filhos e as nossas filhas a escravidão. E, de fato, algumas de nossas filhas já foram entregues como escravas e não podemos fazer nada, pois as nossas terras e as nossas vinhas pertencem a outros.

Estavam tão atolados em dividas, que, na realidade, venderam membros da família, só para sobreviver. Para pagar as dívidas, eles Neemias 5:1,2 Neemias 5:3 Neemias 5:4 Neemias 5:5 eram obrigados a entregar seus filhos para trabalharem como escravos. Os impostos elevados, a quantidade de hipotecas, os preços altos, o trabalho forçado durante um número excessivo de horas... isso se pareceria com a seção de negócios dos jornais de hoje. A Bíblia e atual! No entanto, aqueles tempos difíceis não eram a raiz do problema.

O primeiro versículo diz: "o povo, homens e mulheres, começou a reclamar muito de seus irmãos judeus". Eles se queixavam entre eles mesmos. Os judeus ricos estavam explorando os judeus pobres em um tempo de grande crise. Aproveitavam-se do infortúnio dos pobres e geravam capital com ele. Os que tinham dinheiro e comida diziam: "Se me vender sua casa, dou-lhe comida. Posso emprestar-lhe dinheiro, mas com um juro alto. E se você não puder pagar o empréstimo, levarei seus filhos como garantia de pagamento". Exploravam-se entre eles mesmos. Em lugar de ajudar e dar aos pobres, estavam emprestando o dinheiro com altos juros, ficando com as casas e levando os filhos como escravos, havia uma desconsideração total para com o infortúnio dos outros. A única preocupação era: "Que vantagem posso tirar deste problema?" Esta forma de conduta era claramente contrária à lei de Deus. Em Êxodo 22.25, a Palavra diz que os judeus não podiam emprestar dinheiro a juros uns aos outros. Poderiam cobrar juros a outros, mas não entre si. A Bíblia diz também que um judeu não pode escravizar outro judeu. A pessoa rica poderia contratar uma pessoa pobre para que trabalhasse para ela, mas a escravidão entre eles estava proibida. Aqueles judeus ricos estavam violando clara e abertamente a vontade de Deus: adquirindo ganhos, explorando e se enriquecendo a custa da fome alheia. No meio do programa de construção, havia surgido um conflito entre os que tinham e os que não tinham. A raiz dos conflitos internos e da discórdia sempre esta no egoísmo. De onde vêm as guerras e contendas que há entre vocês? Não vêm das paixões que guerreiam dentro de vocês?97 Os conflitos sempre têm a ver com o egoísmo. Sempre!

Tiago 4:1

Quando há um conflito entre o que eu quero e o que você quer, temos um problema, e esse problema, se não é resolvido, acaba cm conflitos e divisões.

Trabalhar com pessoas é a maior satisfação para um líder e também sua maior frustração.

As pessoas tendem a ser egoístas, e isso inclui a mim e a você.

Queremos as coisas do nosso modo. Queremos fazer o que queremos fazer.

Entretanto, o que nós queremos nem sempre e o melhor. Imagine o que seria viver com uma dieta de sorvete. Eu gostaria. No entanto, minha saúde sofreria, porque o que eu quero nem sempre é o melhor. O egoísmo sempre causa conflitos.

A SOLUÇÃO PARA O CONFLITO

Neemias sabia que tinha um serio problema nas mãos. Todo o seu projeto poderia ruir, e os muros nunca seriam reconstruídos. Os judeus estavam se explorando uns aos outros, brigando uns contra os outros, e famílias contra famílias. Aquilo era pior do que brigar contra um inimigo. O fato de existir um inimigo comum muitas vezes reúne os soldados e cria unidade. Quando, porem, estamos brigando entre nós, a nossa equipe se destrói. PRIMEIRO PASSO - Ire-se Quando ouvi a reclamação e essas acusações, fiquei furioso.98 Se você, como líder, vê que a harmonia do seu grupo é ameaçada de alguma forma, você deve se aborrecer. Seu papel como líder é proteger a harmonia. Neemias não passou por alto o problema que estava dividindo sua equipe. Ele levou a sério. Algumas vezes é adequado irar-se. Há ocasiões em que o correto é isso. Neemias não estava apenas aborrecido, mas este versículo diz que ele se aborreceu e muito. Quando vocês ficarem irados, não pequem.99

Deus autoriza a ira. Ele se ira. Jesus se irou. Você pode irar-se sem pecar. Quando vir a falta de harmonia causada pelo egoísmo, como líder, o melhor que você pode fazer e irar-se. Seja como

Neemias 5:6

Efésios 4:26a Neemias: leve isso a sério. Há um tipo de ira correto e outro incorreto. Ser líder consiste em conhecer a diferença entre um e outro.

Neemias não estava irado por nenhum dano ou injustiça contra a sua pessoa. Não estava devolvendo o golpe porque lhe haviam ferido o ego. Ele não estava motivado por uma revanche. Essa ira teria sido do tipo incorreto. Sua ira era uma indignação justificada. Estava aborrecido por causa do egoísmo e da exploração por parte daqueles ricos. Estava furioso ao ver que a cobiça e o egoísmo deles poderia chegar a deter o projeto de reconstrução dos muros. "Para que servem os muros, se os que vivem dentro deles estão enganando uns aos outros?", pensava. Como povo de Deus, precisamos nos irar contra o pecado. "Diariamente entramos em contato com tantas tragédias

humanas, que temos experimentado o que alguns chamam de

"fadiga da compaixão". Depois de ter sentido pena por tantas

vitimas das inundações, dos terremotos e das guerras,

simplesmente não podemos encontrar a identificação que sabemos

que deveríamos ter para outras novas vitimas. Mas pior ainda do

que a fadiga da compaixão e a fadiga da indignação. Muitos de

nós parecem ter perdido a capacidade de irar-se tanto quanto

deveriam, com as mentiras, o engano e o roubo. Permanecer

indiferente para o mal, encolher os ombros diante dele e rir são os

sintomas de uma avançada degeneração do sentido da

moralidade. E 100

como se alguém tivesse dado uma dose gigantesca

de novocaína a nossa consciência nacional".

Louis COSSELL O líder necessita ter fogo em seus ossos. Não há nada que indigne mais um líder que as divisões. Na igreja Saddleback, essa e a única coisa que realmente me enfurece. Sinto ciúmes pela harmonia em minha igreja. Sinto ciúmes pela unidade nela. O de que aqueles construtores de muros menos precisavam era uma luta interna. Já tinham bastante com o que vinha de fora. SEGUNDO PASSO - Tome tempo para refletir: pense antes de falar Fiz uma avaliação de tudo e então repreendi os nobres e os oficiais, dizendo-lhes: "Vocês estão cobrando juros dos seus compatriotas!" Por isso convoquei uma grande reunião contra eles... Anestésico atóxico, sem efeito narcótico, usado principalmente para anestesia local. [N. do R.] Neemias 5:7 A Bíblia faz a seguinte paráfrase destas palavras: "Fiz uma avaliação de tudo e então repreendi os nobres e os oficiais". Os oficiais do governo eram os que estavam literalmente roubando aos demais. A palavra hebraica usada aqui significa literalmente "consultei comigo mesmo". A primeira reação de Neemias foi irar-se, mas manteve uma longa conversa com ele mesmo antes de atuar como conseqüência dessa raiva. Ele buscou um lugar para estar sozinho com Deus, orou a respeito da situação e refletiu muito sobre ela. Sabia que necessitava terá perspectiva correta. Quando a raiva se baseia nas emoções pode produzir muito estrago. Neemias planejou sua resposta e consultou a Deus. O que você quer que eu diga, Senhor? E falou extensamente de si para si. Algumas vezes, o líder precisa conversar com ele mesmo, em vez de piorar a questão, envolvendo outra pessoa. Necessitamos compreender o que provocou nossa ira. Antes de agir com ira, separe algum tempo para refletir sobre o problema e pensar bem. Quando estamos irados, nossa primeira reação pode ser errada. Você já cometeu alguma vez esse erro? Você deve se irar somente quando vir que o egoísmo e um obstáculo a obra de Deus ou que a danifica. Essas são as coisas pelas quais você deve se irar. No entanto, você deve se certificar de separar um tempo para orar e pensar antes de falar. Do contrário, talvez tenha de se lamentar por ter falado. Meus amados irmãos, tenham isto em mente: Sejam todos prontos para ouvir, tardios para falar e tardios para irar-se, pois a ira do homem não produz a justiça de Deus.102 Tiago oferece o antídoto. Não é uma contradição; o que ele faz na realidade e esclarecer a indicação de Paulo: "Quando vocês ficarem irados, não pequem". Há uma diferença entre a ira do homem e a ira de Deus. Quando nós nos iramos, atuamos para nos vingar. Quando nós iramos com a ira de Deus, atuamos com justiça. Nossa atuação não compreende nenhuma vingança pessoal. Não se ire porque o feriram, o irritaram, frustraram ou desiludiram. Essa e uma classe errada de ira: a ira egoísta. Nem sempre as pessoas estarão a altura das nossas expectativas, mas isso não é razão para uma ira justa. Afinal de contas, Deus já sabe que vamos decepcioná-lo e, apesar disto, continua nos amando. Ire-se com a ira de Deus e não com a sua ira. Se você está sempre pronto para ouvir e é tardio para falar, "ser lento para a ira" vai ser algo natural. E depois de ter refletido bem nas coisas, a ira que terá vai ser a ira justa. Você se alegrara de não haver dito a primeira coisa que veio a sua mente. A ira impulsiva sempre Tiago 1:19,20 põe você em problemas. Tenho visto como muitos líderes, embora sejam excelentes em outro aspecto, prejudicam a eficácia de seu trabalho em virtude de uma reação impulsiva de ira momentânea. Pense antes de falar. TERCEIRO PASSO - Repreenda: confronte em particular aquele que o ofendeu Quando houver um problema que precise de solução, vá diretamente à fonte. Não perca tempo tentando procurar outras pessoas que o apóiem. Não diga: "Tenho um pedido de oração...". Todos nós sabemos que isto muitas vezes não é nada mais que uma murmuração santificada. Vá diretamente a pessoa com a qual você tem um problema. Fiz uma avaliação de tudo e então repreendi os nobres e os

oficiais, dizendo-lhes: "vocês estão cobrando juros dos seus

compatriotas!" Por isso convoquei uma grande reunião contra

eles.103

Se alguém o ofendeu, e você vai falar primeiramente com outra pessoa, você já pecou. Neemias acusava-os de usura: um empréstimo com juros exorbitantes. Estava irado, mas depois de ter orado e de pensar bem, foi diretamente aos que estavam ofendendo a Deus.

Se o seu irmão pecar contra você, vá e, a sós com ele, mostre-lhe o erro. Se ele o ouvir, você ganhou seu irmão. Mas se ele não o ouvir, leve consigo mais um ou dois outros, de modo que "qualquer acusação seja confirmada pelo depoimento de duas ou três testemunhas". Se ele se recusar a ouvi-los, conte a igreja; e se ele se recusar a ouvir também a igreja, trate-o como pagão ou publicano. Isto e o que Jesus disse sobre como canalizar os conflitos, onde quer que estejamos. Temos que amar ao que pecou. Para ser como Neemias, ou como Jesus, necessitamos amar inclusive os pagãos e os arrecadadores de impostos. O bom e que não precisamos tratá-los como se fossem nossa família. Essa é a diferença entre aceitação e aprovação. E quanto a seu grupo ou equipe, envolva os demais somente quando for necessário. Vá primeiramente ver a pessoa com a qual esta tendo o conflito ou que esta causando o problema. Se essa pessoa e seu chefe, procure resolver em particular. Se isso não funcionar, leve outra pessoa que sirva de testemunha ou de mediador. E se isso não funcionar ainda, então envolva um grupo maior. Se você for a alguma Neemias 5:7 Mateus 18:15-17 outra pessoa antes, estará pecando. Quando Neemias disse: "Fiz uma avaliação de tudo e então repreendi...", não estava falando de uma simples visita social. Estava irado pelo fato de aqueles egoístas estarem fazendo negociatas com os outros. Não subestimou a importância do problema, confrontou-o. QUARTO PASSO - Confronte o ofensor em particular.

Ninguém gosta de enfrentar outras pessoas. Eu gostaria de agradar a todo mundo. Você não gostaria também? Claro que sim. Ninguém gosta de desagradar as pessoas. Ninguém quer causar sentimentos negativos. No entanto, algumas vezes e necessário um confronto para o bem de todos. Tenho aprendido que, se não enfrento o problema, fica pior. Os problemas que se ignoram não melhoram. Também tenho aprendido que quanto mais espero para o confronto mais coragem eu precisarei.

Você já percebeu como se deteriora o moral de um escritório porque há pessoas que estão fazendo todos os outros sofrerem? Como o gerente não quer enfrentar o conflito, o causador de intrigas e suas venenosas atitudes se apoderam de todo o escritório.

Você já viu como se destrói uma família porque os pais temem disciplinar os filhos? O amor forte exige que confrontemos em particular quem cometeu a ofensa. Os líderes devem ter a coragem de confrontar. Para tornar-se um líder eficaz, é preciso que você desenvolva essa habilidade. Aprenda a dizer a verdade com amor. Ser líder exige valentia. Não se trata de um concurso de popularidade, pois nem mesmo Deus pode agradar a todo o mundo. O líder deve ter o valor necessário para dizer: "Não me importa o que aconteça, porque isso deve ser feito. Vou enfrentar esse assunto. Para o bem da organização, tenho que resolver isso". Foi o que Neemias fez. E isso é o que você precisa fazer, se quer ser como ele. Quanto àquele que provoca divisões, advirta-o uma primeira e uma segunda vez. Depois disso, rejeite-o. Você sabe que tal pessoa se perverteu e esta em pecado; por si mesma esta condenada. Aos pastores e aos líderes se lhes ordena que admoestem os que Tito 3:10,11 causam problemas. Tenho visto líderes que não confrontaram a pessoa que causou divisão, temendo que essa pessoa fosse embora. Os problemas, em longo prazo, se tornaram maiores devido à falta de confronto. Três vezes tive de dizer a alguém: "Ou você se conserta, ou vai embora!". Em duas dessas vezes, eles se foram, e na outra, a pessoa consertou-se. O confronto é tarefa dos líderes. Quando essas duas pessoas foram embora da nossa igreja, eu sofri durante semanas. Isso aconteceu anos atrás, e hoje, ao lembrar isso, eu reconheço que foi uma das decisões mais sabias que eu tomei. Confronte em particular o ofensor. QUINTO PASSO - Determinação: confronte em público as divisões publicas Obviamente, em Jerusalém todos sabiam que os ricos estavam enganando os pobres. Era mister confrontar esse pecado em publico. Confronte as coisas publicamente até que se tornem conhecidas. Se se trata de um pecado pessoal, confesse-o pessoalmente diante de Deus. Se for um pecado particular entre você: e outra pessoa, confesse-o em particular. Se você ofendeu a toda a comunidade, terá de enfrentar isso publicamente. Fiz uma avaliação de tudo e então repreendi os nobres e os oficiais, dizendo-lhes: "vocês estão cobrando juros dos seus compatriotas!" Por isso convoquei uma grande reunião contra eles e disse: Na medida do possível nós compramos de volta nossos irmãos judeus que haviam sido vendidos aos outros povos. Agora vocês estão até vendendo os seus irmãos! Assim eles terão que ser vendidos a nós106de novo! Eles ficaram em silêncio, pois Não tinham resposta. Neemias repetiu em publico o que havia dito em particular aos ofensores. Para aquele homem, que havia usado suas riquezas para libertar escravos judeus quando era copeiro na Pérsia, aquela maneira de se comportar não fazia sentido. "Por que estão tratando dessa forma os próprios irmãos e irmãs?", lhes perguntou em publico. "vocês sabem o que diz a Palavra de Deus?". Levítico diz que e ilegal o que estão fazendo, então, por que o fazem?". Eles não puderam responder. Você crê que Neemias tenha ficado nervoso naqueles momentos? Precisou de grande coragem para fazer o que fez, confrontando em publico os líderes da cidade. Estava repreendendo aqueles dos quais dependia para que custeassem a reconstrução dos muros. É provável que naquele mesmo momento, o Diabo estivesse lhe dizendo: "Neemias, se você convocar essa reunião pública e perder o Neemias 5:7,8 apoio deles, quem vai pagar os muros? Nunca ira terminar o projeto. E então, o que o povo vai pensar de Deus?".

Ele sabia que estava se arriscando, mas era o que devia fazer. Ainda mais, era o que devia ser feito. Se isso significasse paralisar a obra durante alguns dias enquanto enfrentavam esse pecado, que assim fosse. Isto mostra a integridade de Neemias.

Por isso prossegui: O que vocês estão fazendo não está certo. Vocês devem andar no temor do nosso Deus para evitar a zombaria dos outros povos, os nossos inimigos.107 Neemias apelou para a consciência deles, mostrando que o que estavam fazendo colocava Deus em uma ma situação diante dos descrentes. Era um mau testemunho. A discórdia sempre foi um testemunho pobre. Quando o conceito da igreja e de que nela existem divisões, ela perde a eficacia. Eu, os meus irmãos e os meus homens de confiança também estamos emprestando dinheiro e trigo ao povo. Mas vamos acabar com a cobrança de juros! Devolvam-lhes imediatamente suas terras, suas vinhas, suas oliveiras e suas casas, e também os juros que cobraram deles, a centésima parte do dinheiro, do trigo, do vinho e do azeite.108 A taxa de juros era de um por cento ao mês. Um por cento ao mês equivale a doze por cento ao ano. Para alguns, talvez, não pareça um juro muito alto, mas naquela época era enormemente alto. Neemias estava exortando aquelas pessoas para que vissem o erro dos seus caminhos e fizessem restituição imediata. A exortação dele funcionou. Os ricos que exploraram os pobres se arrependeram. E eles responderam: "Nós devolveremos tudo o que você citou, e não exigiremos mais nada deles. Vamos fazer o que você esta pedindo". Então convoquei os sacerdotes e os fiz declarar sob juramento que cumpririam a promessa feita.109 Neemias deve ter suspirado de alivio. Havia corrido um grande risco ao desafiar aqueles ricos proprietários. Não quis correr mais riscos. Não estava disposto a aceitar somente a palavra deles, senão que os fez jurar em publico. Fez com que firmassem um contrato. Usando o drama em seu favor, deu-lhes uma lição objetiva que o povo não esqueceria facilmente.

Neemias 5:9

Neemias 5:10,11

Neemias 5:12

Também sacudi a dobra do meu manto e disse: Deus assim sacuda de sua casa e de seus bens todo aquele que não mantiver a sua promessa. Tal homem seja sacudido e esvaziado! Toda a assembléia disse: "Amém!", e louvou o SENHOR. E o povo cumpriu o que prometeu.110 As vestes masculinas daqueles dias incluíam um avental (provavelmente diferente dos aventais que os cozinheiros usam nos dias de hoje). Neemias tomou seu avental, sacudiu-o e disse: "Este e um símbolo do que Deus vai fazer com vocês se não cumprirem o que prometeram. Ele vai sacudi-los tão fortemente, que vocês vão perder tudo o que possuem". Foi uma lição objetiva visual com a qual confrontou publicamente a divisão dentro do corpo. SEXTO PASSO - O reforço: mostre desprendimento Alem disso, desde o vigésimo ano do rei Artaxerxes, quando fui nomeado governador deles na terra de Judá, até o trigésimo segundo ano do seu reinado, durante doze anos, nem eu nem meus irmãos comemos a comida destinada ao governador. Mas os governantes anteriores, aqueles que me precederam, puseram um peso sobre o povo e tomavam dele quatrocentos e oitenta gramas de prata, alem de comida e vinho. Até os seus auxiliares oprimiam o povo. Mas, por temer a Deus, não agi dessa maneira. Ao contrario, eu mesmo me dediquei ao trabalho neste muro. Todos os meus homens de confiança foram reunidos ali para o trabalho; e não compramos nenhum pedaço de terra. Alem do mais, cento e cinqüenta homens, entre judeus do povo e seus oficiais, comiam a minha mesa, como também pessoas das nações vizinhas que vinham visitar-nos. Todos os dias eram preparados, a minha custa, um boi, seis das melhores ovelhas e aves, e a cada dez dias eu recebia uma grande remessa de vinhos de todo tipo. Apesar de tudo isso, jamais exigi a comida destinada ao governador, pois eram demasiadas as exigências que pesavam sobre o povo.111 Neemias guiava os outros por meio do seu exemplo. Era o fundamento da sua liderança. Quando pediu ao povo de Jerusalém que reconstruísse os muros, ele foi junto para reconstruir também. Quando ele pediu que orasse, ele mesmo já havia orado. Quando lhe pediu que trabalhasse de noite e de dia para poder terminar o trabalho, ele também ficava em pé noite e dia, trabalhando. Quando lhe pediu que ajudasse os pobres, ele já o tinha feito antes. Neemias 5:13 Neemias 5:14-18 Pela sua nomeação como governador, Neemias tinha direito a uma manutenção que nunca reivindicou. O povo estava passando fome. Ele percebia que aceitar comida deles, ainda que fosse correto, teria sido colocar uma carga ainda mais pesada. Ele e os seus servos poderiam ter explorado o povo, como o fizeram outros governantes no passado, mas não o fizeram. Pelo contrario; alimentaram os pobres. Ajudaram os pobres. Ele fez o quanto podia, utilizando suas riquezas pessoais. Deu o exemplo. Neemias foi modelo de generosidade. Teve o cuidado de dizer isso ao final do informe sobre o conflito, com o fim de fazer uma comparação entre os conflitos e o egoísmo. O egoísmo e a fonte de todos os conflitos. O que lhe disse foi: "Eu não explorei o meu povo, nem tenho me aproveitado do infortúnio dele". Ele não dizia isso para que o considerassem como alguém superior, mas para ensinar ao povo a maneira correta de viver. Neemias nunca pediu a ninguém que fizesse algo que ele mesmo não estivesse disposto a fazer, ou que já não estivesse fazendo. Podia dizer com a consciência limpa: "Sigam meu exemplo". Isso e uma característica da liderança. Paulo liderou desta forma. Tornem-se meus imitadores, como eu o sou de Cristo112 Você pode dizer o mesmo? Por que não? Esta declaração de Paulo não nasce da arrogância. Estava mostrando a responsabilidade que os líderes têm. Se você não pode falar como Paulo: "Tornem-se meus imitadores, como eu o sou de Cristo", você precisa fazer algumas mudanças na sua vida. As pessoas seguem modelos. Neemias o sabia, e Paulo também. Paulo estava dizendo: "Pelo menos eu estou tentando, pelo menos estou fazendo meu maior esforço". Se você não pode falar isso também, então ainda não está pronto para a liderança. É necessário que possa dizer como Paulo: "Tornem-se meus imitadores, como eu o sou de Cristo". Os líderes só pedem aos outros que façam o que eles mesmos já estão fazendo. Esse era o segredo da ousadia demonstrada por Neemias. Assombra-me o fato de que aquele homem confrontou os que estavam explorando os seus vizinhos e os desafiou. Confrontou-os em publico. Era um homem íntegro. Como estava dando o exemplo por meio da sua vida, ele tinha todo o direito de dizer: "Por que não estão ajudando os pobres, ao invés de lhes fazer dano?". Se você não pode desafiar ninguém para que siga seu exemplo, qualquer coisa que você diga 1Coríntios 11:1 perdera o impacto Como pai, eu não posso desafiar meus filhos, dizendo: "façam o que eu digo, mas não o que eu faço". Isso não tem nenhuma eficácia. Se eu não posso dizer: "façam o que faço", o impacto das palavras "façam o que eu digo" não vale nada. As organizações têm menos conflitos quando seus líderes levam uma vida generosa e são modelos de desprendimento. Cada vez que você levantar algo para Deus, Satanás vai querer derrubá-lo, ou desafiar e impedir que triunfe. Assim como ele tentou deter os muros de Neemias, também fará tudo o que estiver ao seu alcance para atrapalhar e deter o que você estiver fazendo para Cristo. Pode ter certeza. É absolutamente essencial que sua equipe se sinta unida em volta do seu propósito. Já terão dificuldades o suficiente, circunstâncias e problemas que virão de fora. O de que menos você precisa e que as pessoas do seu grupo se dediquem a criticar sem motivo, causar problemas e provocar dissensões. Qual e a sua responsabilidade? Sua meta de trabalho dentro do corpo de Cristo esta em Efésios 4.3: Façam todo o esforço para conservar a unidade do Espírito pelo

vinculo da paz.113

Para você ser um líder eficaz, sua prioridade máxima consiste em fomentar a unidade e a harmonia dentro da sua igreja, seu negocio, sua família ou organização. A Bíblia diz que se deve manter a unidade a todo custo. Onde quer que haja um grupo de pessoas, existirão diferenças internas. Isso e inevitável. Se duas pessoas estão de acordo em tudo, então uma delas esta sobrando. Existirão diferenças. Não há equipe, nem organização perfeitas... nem mesmo as suas. Espere que os conflitos apareçam, mas leve em consideração que Deus deseja que reduzamos ao mínimo esses conflitos para sua gloria, especialmente na igreja. O testemunho da nossa vida não deve se basear no que

tenhamos criado com as nossas mãos, ou falado com nossos lábios,

mas no amor que temos manifestado aos outros. Esse e o sinal do

líder. Jesus disse: "Com isso todos saberão 114 que vocês são meus

discípulos, se vocês se amarem uns aos outros".

Nos cinco primeiros capítulos do livro de Atos, usam-se dez vezes expressões como "uns aos outros" e em "harmonia'. Atos insiste dez vezes na unidade que existia no princípio naquele corpo. E no meio deles se produza todo tipo de milagres. Quando existe unidade Efésios 4:3 João 13:35 ao estilo de Atos, existe também o poder de Atos, o amor de Atos, e os milagres de Atos. Vance Abner disse certa ocasião: "Os flocos de neve são frágeis, mas, se, ajuntam em número suficiente, podem deter o transito". Sozinho, eu não posso fazer muito. Você também não pode fazer muito sozinho. Mas juntos, formamos o corpo de Cristo. E juntos podemos causar impacto. Podem-se atirar cem pedras pequenas numa lagoa, e tudo que se consegue são umas poucas ondas na água. Juntando-se, porem, todas essas pedras, e, se o que se atira for um grande penhasco, conseguem-se grandes ondas. Quando estamos juntos, unificados, nada pode deter o corpo de Cristo. Juntos somos uma força que e preciso levar em consideração. O fato de você ter este livro nas mãos e estar lendo estas páginas é um claro indício de que o seu coração busca a Deus. Façamos o pacto de que vamos realizar todo esforço que for necessário para guardar a unidade do Espírito por meio do vinculo da paz. Eu desafio você a dizer: "Meu Deus, quero me converter em pacificador. Quero me converter era um funcionário da paz”. Onde quer que haja discórdia, semeie a paz. Algumas vezes, é possível que isso exija um confronto. Talvez, durante a reunião do seu grupo, alguém comece a criticar. Alguma pessoa precisa assumir a liderança e dizer: "Posso confrontar você com amor? Tomamos uma direção equivocada. Não deveríamos estar falando assim". Deixe que essa pessoa seja você. Ame o suficiente para confrontar. Diga a verdade com amor. Pai, dou-te graças pelos que estão lendo este livro e orando comigo neste momento. Dou-te graças pela tua igreja. Sabemos que Satanás tenta nos atacar desde o exterior, mas seus ataques mais sutis consistem em semear a discórdia no interior. Peço-te que estejamos preparados para isto quando tivermos de enfrentar novos desafios. Que sejamos sensíveis diante das necessidades de outras pessoas. Que sejamos conhecidos como pacificadores. Tu disseste: "Bem-aventurados os pacificadores, pois serão chamados filhos de Deus. “115 Queremos ser como tu és, e, quando trazemos paz, somos como és. Pedimos-te estas coisas em nome de Jesus. Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 7

Como um líder resolve os conflitos Aplicando os propósitos de Deus Comunhão — Nada destrói o companheirismo mais Mateus 5:9 rapidamente que o conflito.

• Se não o confrontarmos a tempo, o que poderia

acontecer ao nosso grupo familiar?

• Como líder, você teme confrontar esse agente divisor

em seu trabalho?

• Como pai, você teme disciplinar seus filhos?

• Considere o custo de não confrontar: antes de

enfrentar um empregado, membro de grupo ou filho, escreva seu

plano pessoal para negociar com o conflito, baseando-se em

Mateus 18.15-17. Entregue esse plano para Deus e peca pela sua

coragem. Poderia pedir a um ou dois sócios de confiança para que

o apóiem para cumprir o teu compromisso.

Discipulado — Neemias discipulava por meio do exemplo.

• Você reflete Cristo para os outros?

• Você poderia dizer o mesmo que Neemias e Paulo:

"tornem-se meus imitadores, como eu o sou de Cristo"? Se não, o

que você deve mudar para converter-se em modelo a ser seguido

pelos demais?

• Como você pode se conectar com Jesus em um nível tão

íntimo, que não consiga deixar de refletir Cristo em seus

pensamentos, atitudes e ações?

• Peça ao Senhor que revele sua verdade sobre você. Peca a

coragem necessária para ver essa verdade e depois o compromisso

necessário para render-se as suas mudanças.

Ministério — Tito 3.10,11 nos diz: "Quanto àquele que provoca divisões, advirta-o uma primeira e uma segunda vez. Depois disso, rejeite-o. Você sabe que tal pessoa se perverteu e esta em pecado; por si mesma esta condenada".

• A divisão pode destruir um Ministério.

• No seu papel de liderança, como você lida com uma pessoa

separatista?

• Quando alguém quer impor seus interesses ao resto do

grupo, o que você pode fazer como líder? Acredite se quiser, mas

a resposta a esta pergunta pode representar o sucesso ou o

fracasso do seu Ministério.

Evangelismo — Para compartilhar eficazmente o Espírito de Cristo, devemos nos parecer com ele em nossas ações.

• Qual foi a resposta de Cristo aos pagãos e coletores

de impostos (ver Mateus 18.15-17, passo 3)?

• Qual e a diferença entre aceitação e aprovação?

• Atualmente, associa-se os cristãos a uma postura rígida em

referenda ao comportamento pecaminoso dos outros,

especialmente os que levam uma vida que se poderia chamar de

irreverente. O que você pode fazer para confrontar um

comportamento assim e deixar agir o amor de Cristo por meio de

você?

Adoração — Adorar a Deus implica colocá-lo em primeiro lugar e não a nós mesmos.

• Quando você ora, no meio do culto, na sua oração pessoal

ou ao cantar para Deus, você esta focado unicamente nele?

• Aprenda a colocar o Senhor em primeiro lugar em sua

vida, mesmo quando isso for difícil.

• Uma vida que coloca Deus e Cristo por sobre todas as

coisas reflete uma atitude de adoração.

• Quando nosso primeiro objetivo e agradar a Deus, não

pode haver conflito de interesses. Fixe seu olhar nele agora. Peca

que ele seja mais em sua vida, e que você seja menos. Observe o

Senhor tomar conta dos seus problemas de liderança e dos

problemas de sua vida.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Neemias se irou ao ver os ricos explorando os pobres com juros altos, mas antes de agir 'consultou consigo mesmo', orou e refletiu, separando a ira justa da ira egoísta. Pensando nos conflitos que você enfrenta hoje na sua liderança, em que momentos você reagiu pela ira impulsiva ferida no ego, e como seria diferente se, como Neemias, você tirasse um tempo para orar e pensar antes de falar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo ensina que, diante de uma ofensa, devemos ir diretamente à fonte, e não transformar o problema em 'pedido de oração' que vira murmuração santificada. Existe hoje algum conflito que você tem evitado confrontar em particular, levando-o em vez disso a terceiros? O que você precisa fazer para confrontar com amor a própria pessoa, como manda Mateus 18.15-17?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Neemias só teve autoridade moral para repreender a exploração porque ele mesmo recusou o salário de governador e alimentava cento e cinquenta pessoas do próprio bolso, podendo dizer como Paulo: 'sejam meus imitadores'. Olhando para a sua liderança em casa, na igreja ou no trabalho, você poderia pedir às pessoas que sigam o seu exemplo no ponto exato onde mais cobra delas? Onde sua vida ainda não dá sustento à sua palavra?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 8 — As tentações da liderança  (aula ordem = 8)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 8;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 8 — As tentações da liderança$t$,
      8,
$conteudo$Para coda cem pessoas que podem lidar com a adversidade, há somente uma que pode lidar com a prosperidade.

THOMAS CARLYLE

O que parece mais fácil de administrar para você: o sucesso ou o fracasso? A maioria das pessoas não sabe lidar com o fato de ocupar um alto cargo. De fato, o sucesso destrói algumas pessoas. A liderança vem acompanhada de três vantagens primordiais:

• Posição - Você pode chegar a estar mais alto.

• Poder - Você pode chegar a fazer mais.

• Privilégio - Você pode chegar a ter mais.

Cada uma dessas coisas é um benefício legítimo de liderança. O esforço e labor extraordinários que você tem levado para se converter em um líder lhe oferecem uma posição melhor, com mais poder e privilégios maiores. No entanto, devemos considerar esses privilégios como "mão de ferro em luva de veludo". Se fizer mau uso deles, todos virão acompanhados de tentações suficientemente grandes para causar a sua queda como líder. Assim, aquele que julga estar firme, cuide-se para que não

caia!116

Só precisamos olhar os títulos das noticias para ver como podem ser destruidoras as tentações relacionadas à liderança. Os conflitos de interesses e o mau uso dos privilégios têm causado problemas a muitas pessoas ao longo de toda historia, e continuam causando hoje. Lord Acton disse certa ocasião: "O poder corrompe, e o poder absoluto corrompe de maneira absoluta". O bom de tudo isso é que, quando chega a tentação, Deus nos oferece um antídoto. O líder sábio estuda a tentação, reconhece-a e aplica o antídoto. Quando chegamos a Neemias 5.14, vemos que Neemias fica 1Coríntios 10:12 doze anos no cargo de governador de Judá. Os que estiveram antes dele, diz o texto, fizeram mau uso do seu poder, privilégios e posições para favorecer as próprias ganâncias egoístas.

AS TRÊS TENTAÇÕES DA LIDERANÇA

1. Você será tentado a fazer mau uso da sua posição. Mas os governantes anteriores, aqueles que me precederam,

puseram um peso sobre o povo e tomavam 117 dele quatrocentos e

oitenta gramas de prata, alem de comida e vinho.

Os predecessores de Neemias faziam exigências pouco realistas. Cobravam do povo impostos excessivos, aplicavam-lhes cargas injustas e não tinham compreensão nenhuma da situação deles. Aqueles homens haviam abusado da sua posição. Talvez você tenha visto isso acontecer: alguém que você conhece no seu trabalho — alguém com quem você esteve almoçando e contando piadas ainda ontem — recebe uma promoção, e, de repente, se converte em um pequeno ditador. O poder o transforma. De repente, começa a tratar os outros com menosprezo. Começa a fazer exigências excessivas que desmoralizam as pessoas. O poder adquirido repentinamente pode fazer com que isso aconteça. 2. Você será tentado a abusar do seu poder. Até os seus auxiliares oprimiam o povo.118 Aqueles pequenos ditadores haviam adotado o estilo de vida de líderes opressores. Eram uns autocratas. Até seus criados tinham se convertido em pequenos déspotas. Estavam fazendo uso incorreto do seu poder abertamente. Há uma diferença entre ser chefe e ser líder. Aquelas pessoas haviam si do colocadas em cargos de liderança, mas depois fizeram mau uso dos seus cargos, abusando do poder. Ninguém gosta de trabalhar para um líder dominante; uma pessoa cujas palavras favoritas são: "Faça isso porque mandei fazer!". Os tiranos exigem sem nunca explicar. A liderança não é senhorio.

3. Você será tentado a tirar lucro dos seus privilégios.

Quando Neemias se refere ao "imposto que me correspondia como governador", nos da a entender que o governador tinha uma

Neemias 5:15a Neemias 5:15b espécie de conta ilimitada para seus gastos. Sem duvida, a comida era oferecida ao que se encontrava naquele cargo como sinal de gratidão. Seus predecessores, porem, haviam feito mau uso daquele privilegio. Geralmente, os líderes ganham mais, recebem mais benefícios adicionais e lhes c concedida mais liberdade em seu calendário de trabalho e em sua conta de gastos. A liderança tem seus privilégios, mas existe muita gente que não sabe lidar com isso. Mas, por temer a Deus, não agi dessa maneira.119 Neemias era um líder fora do normal. Não era conformista, e não seguia os esquemas que se esperava que seguisse. O que o fazia tão diferente dos que o antecederam? Além disso, desde o vigésimo ano do rei Artaxerxes, quando fui nomeado governador deles na terra de Judá, até o trigésimo segundo ano do seu reinado, durante doze anos, nem eu nem meus irmãos comemos a comida destinada ao governador. Vemos os seguintes dados acerca de Neeemias durante o período em que foi governador: nunca recebeu salário, nunca usou uma conta de gastos, negou-se a exigir impostos, negou-se a comprar terrenos para obter lucros, pagava seus empregados dos próprios recursos para fazerem trabalho publico, alimentava diariamente, com o próprio dinheiro, mais de cento e cinqüenta pessoas. Basicamente, Neemias esta dizendo: "Não tomei dinheiro nenhum, nem ganhei nada". Quantos políticos vêm a sua mente que rejeitariam voluntariamente a oportunidade de obter lucros materiais? Qual era o segredo de Neemias? O que fez com que não abusasse do seu poder, do seu cargo e privilégios?

A MANEIRA DE MANTER SUA INTEGRIDADE

COMO LÍDER

1. Torne mais profunda sua reverencia a Deus. Neemias tinha mais interesse em agradar a Deus do que a si próprio. "Mas, por temer a Deus, não agi dessa maneira", ele disse. Que significa esse temor reverencial a Deus? Em primeiro lugar, tenho esse temor a Deus quando percebo que foi ele quem me colocou na posição de liderança. Neemias não esqueceu que havia sido Deus quem o havia enviado a Jerusalém com a tarefa de reconstruir os muros. Não é do oriente nem do ocidente nem do deserto que vem a Neemias 5:15c Neemias 5:14

exaltação. E Deus quem julga: Humilha a um, a outro exalta.121

Os grandes líderes percebem que são somente mordomos. Compreendem que o mundo não é deles, nem a igreja, nem o seu negocio; são apenas os gerentes, os mordomos, os encarregados das propriedades de Deus. As promoções vêm de Deus, e não das pessoas. Alguém disse: "Não precisamos conhecer os homens-chave, se conhecemos o homem que tem as chaves". Em segundo lugar, tenho temor reverencial a Deus quando compreendo que ele vai me pedir contas. Neemias exortou os que estavam abusando de seus vizinhos, perguntando-lhes: "Não deveriam mostrar a devida reverencia a nosso Deus...?" A Bíblia diz que "O temor do Senhor e o princípio da sabedoria".122 Uma das razões pelas que tantas pessoas pensam que podem se sair bem e continuar fazendo o que não devem e que não tem temor o de Deus. Pensam que podem brincar com fogo e se sair bem. Obedeçam aos seus líderes e submetam-se a autoridade deles.

Eles cuidam de vocês como quem deve prestar contas. Obedeçamlhes, para que o trabalho deles seja 123

uma alegria e não um peso, pois

isso não seria proveitoso para vocês.

Esse versículo me assusta. Não assusta você? Deveria! Deus vai me julgar, e também vai julgar você. Não existe autoridade dada por Deus que não venha acompanhada de responsabilidade. A Bíblia diz que os pastores e os líderes terão de prestar contas a Deus. Meus irmãos, não sejam muitos de vocês mestres, pois vocês

sabem124que nós, os que ensinamos, seremos julgados com maior

rigor.

Isso e o que significa ter temor reverencial a Deus. Reverenciamo-lo quando dizemos: "Tu me colocaste aqui, e haverás de pedir contas do que eu venha a fazer com este privilegio". O líder deve guardar reverencia para com Deus, respeitando-o profundamente. 2. Desenvolva o amor pelas pessoas Além do mais, cento e cinquenta homens, entre judeus do povo e seus oficiais, comiam a minha mesa, como também pessoas das nações vizinhas que vinham visitar-nos. Todos os dias eram preparados, a minha custa, um boi, seis das melhores ovelhas e aves,

Salmos 75.6,7

Salmo 111:10

Hebreus 13:17

Tiago 3:1

e a cada dez dias eu recebia uma grande remessa de vinhos de todo

tipo. Apesar de tudo isso, jamais exigi a comida destinada ao

governador,

pois eram demasiadas as exigências que pesavam sobre o

povo.

Vê-se claramente que Neemias era um homem muito compassivo e preocupado com os demais. Estimava genuinamente as pessoas. Irou-se quando uns passaram a explorar os outros, e foi generoso com aquilo que lhe havia sido dado.

Os perdedores se concentram no que podem conseguir; os líderes, naquilo que podem dar.

E de coração integro Davi os pastoreou; com mãos experientes os conduziu.126 Este e um dos grandes versículos da minha vida. Uma paráfrase bíblica diz: "Pastoreou-os com generosa entrega". Peço a Deus que me permita pastorear com integridade e com habilidade. Ao estudar os líderes, tanto os bons quanto os maus, tenho pensado que os que abusavam constantemente do poder, não amavam o seu povo. Os que abusam do poder não tem temor reverencial a Deus, nem amam o seu povo. Sentindo, assim, tanta afeição por vocês, decidimos dar-lhes não somente o evangelho de Deus, mas também a nossa própria vida, porque vocês se tomaram muito amados por nós.127 Se você ama de verdade as pessoas, não abusara delas nem se utilizara delas de forma errada. Quando ouvi a reclamação e essas acusações, fiquei furioso.128 Quando você vê que ferem alguém a quem você ama, ou que abusam dele, você se aborrece? A ira de Neemias por causa das injustiças que havia presenciado e a evidencia do seu amor pelo povo. 3. Discipline-se para buscar as recompensas eternas Lembra-te de mim, ó meu Deus, levando em conta tudo o que fiz por este povo. Por que Neemias não caiu nos mesmos abusos dos seus predecessores? Eu poderia sugerir que isso não aconteceu porque sua perspectiva era a eterna? Não estava olhando o presente, mas o futuro.

Neemias 5:17-18

Salmos 78:72

ITessalonicenses 2.8

Neemias 5:6

Neemias 5:19 Os líderes que estavam abusando do seu poder, dos seus cargos e dos seus privilégios, estavam explorando o povo. Seu único anseio era adquirir riquezas pessoais. Também podemos ver isso em nosso mundo de hoje. Os políticos passam a vida, explorando o povo. De vez em quando o admitem, mas somente quando são descobertos. Neemias diz: "Eu não tenho feito nada disso. Tenho me disciplinado".

Ao contrário, eu mesmo me dediquei ao trabalho neste muro. Todos os meus homens de confiança foram130reunidos ali para o trabalho; e não compramos nenhum pedaço de terra. Os que antecederam Neemias haviam aproveitado os tempos difíceis para adquirir lucros pessoais. Estavam usando seu cargo e seus privilégios para assegurar sua posição. Neemias diz: "Eu não fiz isso". Pense: com os impostos a que tinha direito, poderia ter feito alguns negócios muito bons de boas fontes. Da mesma forma que os que haviam passado ali antes dele. Ele poderia ter dito: "Se me dão suas terras, lhes darei comida". Uma vez edificados os muros, o preço das terras havia subido imensamente, por causa do aumento da segurança. Neemias, no entanto, não fez isso. Ele tinha temor reverencial pelo Senhor. Amava o povo. Tinha os olhos postos numa recompensa futura. Neemias disciplinou-se a ponto de limitar a própria liberdade. Quanto mais alto você chega na liderança, menos liberdade terá. Mais se exige dos líderes. Quanto maior e a sua posição de autoridade, mais se espera de você, mais restrições são colocadas, e, na realidade, possui menos liberdade. A liderança exige muito. Não sou livre? Não sou apostolo? Não vi Jesus, nosso Senhor? Não são vocês resultado do meu trabalho no Senhor? Ainda que eu não seja apostolo para outros, certamente o sou para vocês! Pois vocês são o selo do meu apostolado no Senhor. Esta e minha defesa diante daqueles que me julgam. Não temos nós o direito de comer e beber? Não temos nós o direito de levar conosco uma esposa crente como fazem os outros apóstolos, os irmãos do Senhor e Pedro? Ou será que 131 só eu e Barnabé" não temos direito de receber sustento sem trabalhar? Aqui rege o princípio de que o trabalhador e digno do seu salário. Se uma pessoa faz um trabalho para você, e justo que lhe pague. De acordo com a lei judaica, quando um boi estava trilhando em Neemias 5:16 lCoríntios 9.1-6 círculos o grão para convertê-lo em farinha, não se permitia que lhe colocassem mordaça. Isso era considerado algo desumano. Era-lhe permitido que comesse do mesmo grão que estava trilhando. Paulo afirma:

Se entre vocês semeamos coisas espirituais, seria demais colhermos de vocês coisas materiais? Se outros têm direito de ser sustentados por vocês, não o temos nós ainda mais?132

Os que se dedicam integralmente ao Ministério têm o direito de que se lhes pague por essa dedicação total. Paulo diz a seguir:

Mas nós nunca usamos desse direito. Ao contrario, 133 suportamos tudo para não colocar obstáculo algum ao evangelho de Cristo.

Porque entendia o papel que lhe correspondia como líder, Paulo estava disposto a limitar sua liberdade.

Os perdedores concentram sua atenção em seus direitos; os líderes, em suas responsabilidades.

Os perdedores dizem: "Eu tenho meus direitos!". Entretanto, o líder reconhece: "Tenho minhas responsabilidades!". Por ser governador, Neemias tinha uma grande quantidade de direitos. Nesta passagem refere-se a eles em duas ocasiões: "nem eu nem meus irmãos comemos a comida destinada ao governador". Ao ser nomeado governador, Neemias convertera-se no homem mais importante daquelas terras. Era responsável apenas diante do rei Artaxerxes diretamente, e este estava a 1.300 quilômetros de distancia. Podemos dizer com tranqüilidade que Neemias não conheceu as frustrações associadas à micro gerência. Durante doze anos, havia sido o homem mais importante do país, sem ter de responder a ninguém. Não obstante, Não abusou do poder. Tinha o poder necessário para resistir as três tentações, porque fazia estas três coisas:

•Tinha o temor reverencial pelo Senhor.

•Amava o povo.

•Disciplinava-se a si mesmo, para olhar para as

recompensas da eternidade.

Era um homem decidido. Tal como diz em 5.16, Neemias dedicou-se a obra do Senhor. Não tinha tempo para os conflitos de interesse. Estava comprometido com o trabalho que Deus lhe havia encomendado. Sabia que precisava levantar uma muralha, e não um lCoríntios 9.11,12a lCoríntios 9.11,12b império pessoal. Enriquecer não era uma das suas prioridades. Se Neemias tivesse permitido desviar-se pela busca de riquezas, tal como o haviam feito os governantes anteriores, você acredita que teria terminado os muros com tanta rapidez como o fez? Ele dizia: "Deus me encomendou um trabalho, e eu não vim aqui para fazer nenhuma outra coisa. Não vou desviar minhas energias para nenhuma outra parte". Conheço pastores que se tem dedicado as vendas, como trabalho secundário. Não percebem quanto tempo lhes toma esse trabalho, e depois se perguntam por que sua igreja não esta crescendo. Seus interesses estão divididos. As pessoas não sabem se o pastor esta fazendo amizade com elas a fim de ganha-las para o Senhor, ou a fim de ganhar um novo cliente. Neemias disciplinou-se em todos os aspectos. O que motivou Neemias a aceitar a responsabilidade pelos israelitas de Jerusalém, sem ter sobre si outra autoridade, alem da de Deus? Creio que era o mesmo anseio que havia motivado Moisés. A Palavra nos diz: "Moisés, já adulto, recusou ser chamado filho da filha do farão, preferindo ser maltratado com o povo de Deus a desfrutar os prazeres do pecado durante algum tempo".134 Sejamos sinceros: o pecado e algo deleitoso. E divertido. Se não fosse, ninguém se sentiria tentado a pecar. Mas a Palavra fala de "efêmeros prazeres do pecado". Tanto Neemias quanto Moisés sabiam que e preciso pagar um preço por esses efêmeros prazeres do pecado. Como eles tinham os olhos fixos em uma recompensa futura, preferiram ser "maltratados com o povo de Deus" a desfrutar do pecado por um pouco de tempo. Na historia do mundo, existem poucos personagens que tenham tido maior potencial para o poder, os privilégios e a posição, que Moisés. Era o segundo homem na corte de um farão sem herdeiros. Estava em linha direta para suceder o farão e converter-se em líder do Egito, a nação mais próspera do mundo naquele tempo. Como tinha os olhos postos em um prêmio eterno, deixou voluntariamente tudo aquilo para guiar um monte de escravos pelo deserto. Renunciou ao poder, a posição e aos privilégios; as mesmas coisas que nós passamos a vida tentando alcançar. Seus valores eram os corretos, porque assim era sua visão. Mantinha os olhos fixos na recompensa do future O líder e tentado a utilizar sua liderança para obter vantagens pessoais. Você vai ser tentado. Para poder resistir, precisa se perguntar constantemente: "Por que estou fazendo o que estou fazendo?".

Deus não é injusto; ele não se esquecera do trabalho de vocês e do amor que demonstraram por ele, pois ajudaram os santos e continuam a

Hebreus 11:24,25 ajudá-los.135 Pense em todos os que trabalham nos bastidores como voluntaries na sua igreja, ou na sua organização. Talvez nós não Vejamos o que eles fazem, mas Deus, sim, ele vê; e não esquece. Cada vez que alguém ajuda o povo de Deus, esta manifestando que ama a Deus. O trabalho feito para Deus com um coração puro onde há amor, será recompensado na eternidade. Essa motivação e legitima na liderança. O autor de Hebreus esta nos dizendo: "Como se acumulam tesouros no céu? Isso se faz, servindo aqui na terra. De o seu tempo, seu dinheiro, sua energia, tudo o que você tem, em nome do céu". Os líderes eficazes se centralizam nas suas responsabilidades e se esquecem dos seus direitos. Eis aqui umas palavras clássicas de Pedro para os líderes das igrejas: Portanto, apelo para os presbíteros que há entre vocês, e o faço

na qualidade de presbítero como eles e testemunha dos sofrimentos

de Cristo, como alguém que participara da gloria a ser revelada:

pastoreiem o rebanho de Deus que esta aos seus cuidados. Olhem por

ele, não por obrigação, mas de livre vontade, como Deus quer. Não

façam isso por ganância, mas com o desejo de servir. Não ajam como

dominadores dos que lhes foram confiados, mas como exemplos para

o rebanho. Quando se manifestar136

o Supremo Pastor, vocês receberão

a imperecível coroa da glória.

O Novo Testamento utiliza três palavras diferentes para falar dos lideres, e todas aparecem nesta mesma passagem. "Ancião", presbytes é a palavra grega de onde vem a palavra "presbiteriano"; a igreja presbiteriana chama os seus líderes de "anciãos". "Pastor", se explica por si mesma, e a segunda palavra; e a terceira, e "supervisor". Esta e a palavra grega de onde se deriva "episcopal", e significa "supervisor"; os líderes dessa igreja são chamados de "bispos". Qual e a diferença entre um ancião, um pastor e um bispo? Nenhuma. A Bíblia usa três palavras distintas para referir-se as mesmas pessoas. Pedro usa aqui as três palavras para garantir chamar a atenção de todos os líderes. Ele quer que compreendam suas responsabilidades, que estão descritas nestas palavras. Aos anciãos, lhes diz que sejam pastores e funcionem como supervisores. "Ancião" e um termo relacionado a maturidade espiritual. Não tem nada a ver com a idade (Timóteo, sendo jovem, era o ancião da igreja de Éfeso), mas, sim, com a maturidade espiritual. Aos anciãos, lhes diz que sejam pastores. O papel do pastor tem a ver com a parte da sua descrição de labores relacionada com o cuidado das pessoas: a ministração, o conselho e o cuidado pastoral. Os “supervisores" têm a Hebreus 6:10 1 Pedro 5:1-4 ver com a função administrativa do líder na igreja. O líder supervisiona a administração, a orientação, a direção e a gerencia da igreja. Pedro diz que a liderança da igreja começa com o reconhecimento de que esta e o rebanho de Deus. A igreja e de Deus. A nós só cabe a liderança, a administração de algo que pertence a ele. O mesmo acontece com o seu negócio, sua família ou sua organização. Os bons líderes guiam os outros com coração ardente. Não são líderes porque tem de ser, senão porque estão dispostos a ser. Estão mais preocupados com o que poderiam dar, do que com o que poderiam conseguir. Uma coisa e a liderança e outra e o senhorio. O verdadeiro líder não é um ditador, mas um guia por meio do seu exemplo. Como conseqüência, "quando se manifestar o Supremo Pastor, vocês receberão a imperecível coroa da gloria". Discipline-se para buscar as recompensas eternas. Não sei quanto a você, mas eu quero uma dessas coroas. Deus não se agrada dos líderes que abusam da sua posição, poder e privilégios. Quando Deus disse a Moisés que falasse a rocha, o que Moisés fez foi bater nela. Abusou do seu poder. Como conseqüência, Deus lhe disse: "Não entraras na terra prometida". Davi abusou da sua posição de líder quando teve uma aventura com Bate-Seba. Pagou o preço quando Deus levou o primeiro filho dessa união. Saul abusou da sua posição de líder ao fazer o que Deus havia dito que não fizesse. Perdeu o trono. Ao longo de todo o Antigo Testamento, lemos que, quando os reis judeus serviam ao Senhor, prosperavam. Quando começavam a abusar de sua posição, privilégios e poder, perdiam a liderança. Você foi promovido alguma vez? Reconhece alguma dessas tentações? Como líder, será tentado a fazer uso indevido da sua posicão. Certa ocasião, houve um homem que foi embora da igreja porque queria ser presidente da assembléia... e nós não tínhamos nenhuma assembléia. Estava mais interessado num cargo, do que no Ministério. Queria ser peixe grande em lagoa pequena. Você será tentado a abusar do seu poder. A liderança não é senhorio. Os líderes não são chamados para ser ditadores tiranos.

Jesus disse em sua Palavra que "o maior entre vocês devera ser servo"137

Você será tentado a aproveitar dos seus privilégios. Quando Mateus 23:11 alguém recebe uma promoção, os demais confiam mais nele. Por exemplo, seus horários podem se tornar mais flexíveis. Pode-se usar esse privilegio para fazer uma boa quantidade de trabalho no dia, ou pode-se aproveitar para ir embora mais cedo quando chega o fim de semana. Talvez lhe seja confiada uma conta de gastos ou varias outras coisas das quais vai ter a tentação de abusar. Isso faz parte do que e ser líder.

Foi uma profunda reverencia pelo Senhor que impediu Neemias de abusar de sua autoridade.

Uma vez que conhecemos o temor ao Senhor, procuramos persuadir os homens. O que somos está manifesto diante de Deus, e esperamos que esteja manifesto também diante da consciência de vocês. Não estamos tentando novamente recomendar-nos a vocês, porem lhes estamos dando a oportunidade de exultarem em nós, para que tenham o que responder aos que se vangloriam das aparências e não do que esta no coração. O que Paulo esta dizendo é: "Eu vivo com transparência diante de vocês. Tudo esta a vista: o que vêem em mim e o que sou. E vivo desta forma, não para impressionar vocês, mas porque temo ao Senhor". Temo o que o Senhor faria se eu abusasse da liderança da minha igreja. Esse e um temor santo; um temor que não existe em grande parte do mundo atual. £ uma reverencia diante de Deus que diz: "Deus me colocou aqui, trouxe-me a este posto e vai me pedir contas. Portanto, não posso abusar dessa situação em particular". Gênesis 39 relata a historia de José, quando a mulher de Potifar lhe armou uma cilada e ele escapou dela. O que impediu que ele cedesse diante da tentação que ela lhe estava oferecendo gratuitamente? O temor de Deus que José tinha era maior que o amor aos próprios prazeres. Ele sabia que se ele se comportasse assim, entristeceria a Deus. Obedeçam aos seus líderes e submetam-se a autoridade deles. Eles cuidam de vocês como quem deve prestar contas. Obedeçam-lhes, para que o trabalho deles seja uma alegria e não um peso, pois isso não seria proveitoso para vocês.139 Se não há responsabilidade, tampouco há autoridade. Aprofunde sua reverencia a Deus. Compreenda que e a ele que daremos conta. Os líderes são julgados de maneira mais restrita que os seus seguidores. Por último, discipline-se para buscar as recompensas eternas. Tenha os olhos fixos no premio que Deus tem preparado.

O Senhor respondeu: "Muito bem, servo bom e fiel! você foi fiel no pouco, eu o porei sobre o muito. Venha e participe da alegria do seu

2 coríntios 5:11,12 Hebreus 13.17 senhor!"140 Esse e um dos versículos mais importantes da Bíblia. Quando eu chegar ao céu, e o que eu quero que o Senhor me diga. Você não quer? Minha principal motivação e que quero comparecer um dia diante de Deus e ouvi-lo dizer: "Fizeste bem, servo bom e fiel! Não foste perfeito, mas foste fiel. Fizeste o melhor que pudeste e isso era tudo o que eu queria de ti". Deus não nos chama ao sucesso. Chama-nos a fidelidade. A conseqüência de uma liderança fiel e que ele nos encomenda tarefas maiores. Quando você chegar ao céu, terá responsabilidades ainda maiores. Você sabia que a forma como você viver sua liderança aqui na terra determinará seu potencial de liderança na eternidade? Isso e o que a Bíblia diz. Se você foi fiel nas coisas pequenas, vai ser fiel nas grandes. Compartilhe a felicidade de seu senhor. Deus deseja compartilhar a felicidade dele com você e comigo. Quando encontrar líderes que estão abusando do poder, você pode estar seguro, em primeiro lugar, de que não tem reverencia pelo Senhor; em segundo, de que não amam as pessoas, e em terceiro, que estão vivendo para o momento e não para a eternidade. Senhor, precisamos da tua ajuda. Peço-te que me ajudes a ser um líder integro, como Davi, pastor com coração íntegro e mãos hábeis. Ajuda-nos a ser líderes nos lugares que nos deste em nossa família, nossa escola, nosso negocio, nosso grupo de crescimento ou célula, ou para onde quer que nos chames. Queremos guiar com integridade e esforço, trabalhando de verdade, e necessitamos da tua ajuda para fazer isso. Ajuda-nos a ser líderes com prioridades, e a estar mais preocupados com a edificação do teu Reino, do que com nosso império ou riquezas, posições ou privilégios pessoais. Ajuda-nos a ser líderes generosos. Mostraste-nos o quanto Neemias foi generoso. Alimentava pessoalmente a cento e cinqüenta pessoas todos os dias, e pagava tudo com seu dinheiro, e nunca pediu nada em troca. Ajuda-nos a ser pessoas generosas, como ele. Ajuda-nos a ser líderes autênticos; a sermos como Paulo. E, sobretudo, ajuda-nos a ser líderes com perspectiva de eternidade; a nos dar conta de que vamos passar mais tempo contigo na eternidade, do que nesta vida. Quando nos colocares em posições de privilégio, poder ou preeminência, não deixes que nos tornemos prisioneiros dessas tentações. Faze-nos ser como Neemias, homens ou mulheres íntegros. Isso e o que te pedimos em nome de Jesus. Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 8

Mateus 25:23 As tentações da liderança

Aplicando os propósitos de Deus

Comunhão — Lutar com a tentação pode ser mais fácil em companhia de alguém que sozinho.

• Em que área você se sente mais tentando a abusar de

seu poder como líder?

• Como o grupo de crescimento ou célula ou até um

sócio de confiança pode ajudá-lo a identificar essa área de

vulnerabilidade, a fim de que você desenvolva um caráter mais

reverente?

• Considere receber ajuda; peca a Deus que lhe de a

coragem de ser o líder que ele deseja que você seja.

Discipulado — Como líder, nada e mais importante do que ser uma pessoa Integra. Precisamos sempre fazer o que e correto, e isso não é fácil. até os líderes precisam de heróis: os modelos corretos a seguir.

• Em toda a história, há apenas uma pessoa que sempre

fez o que era correto e teve sucesso, quem e essa pessoa? Como, ao conhecermos melhor o Senhor, fortalecemos nossa integridade como líderes?

• O que você fará como resultado deste capítulo para

certificar-se de que você esta seguindo as marcas de seu líder?

Ministério — Neemias foi capaz de pedir a Deus que o favorecesse por todo o bem que ele havia feito por seu povo.

• Você pode fazer o mesmo pedido?

• Como você pode evitar ou resistir a tentação de abusar de

sua posição de líder?

• Como você, no papel de ministro, pode ajudar outros?

• Nunca e tarde para ser um líder como Neemias. Peca a

Deus que lhe dê de seu amor para os que você dirige. Lembre-se

de que Deus quer que você seja seu tipo de líder. O passado ficou

para trás. Seja como Neemias, aprenda com o passado para olhar

para o futuro.

Evangelismo — Em nenhum outro aspecto a liderança pode ter mais peso eterno do que em nossa habilidade de atrair outros a Cristo.

• As pessoas nos olham quando caímos. E Deus?

• Considere que, como líder, seu desempenho pode impactar

outros para a eternidade. Como isso afeta as decisões e escolhas que você faz?

• Pode ser que as decisões que você toma não afetem seu

desempenho, mas a forma como você lidera tem muito a ver com a forma que outros vêem Cristo em você.

• Que mudanças você deve fazer para se assegurar de que

esta refletindo o Deus de amor? Adoração —- O temor do Senhor e a chave para evitar as tentações da liderança. Isto se reflete nas palavras de Neemias 5.15: "por temer a Deus, não agi dessa maneira.".

• Você reconhece que a mão de Deus o colocou onde você

esta?

• Você se da conta de que ele o apóia com responsabilidade

no papel em que o colocou?

• Você gostaria de escutar Deus dizer: "Muito bem, servo

bom e fiel"?

• Você deseja agradar a Deus ou a você mesmo? Não é uma

pergunta fácil. O que você pode fazer para se assegurar que

escutara e obedecera a voz de Deus na próxima vez que você for

tentado a abusar de sua posição?$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$O capítulo apresenta as três tentações da liderança — abusar da posição, abusar do poder e tirar lucro dos privilégios — e mostra que os antecessores de Neemias caíram em todas, mas ele não, 'por temer a Deus'. Das três, qual mais expõe o seu coração hoje, e que conta você imagina que terá de prestar a Deus sobre como tem usado aquilo que Ele colocou nas suas mãos?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Neemias entendia que era apenas mordomo — que a cidade, a obra e o cargo pertenciam a Deus, e que 'a promoção vem do Senhor', não das pessoas. De que maneira concreta lembrar que você é gerente, e não dono, do ministério, do negócio ou da família que lidera mudaria o jeito como você toma decisões e trata as pessoas sob seus cuidados?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O texto distingue o líder, que se concentra nas suas responsabilidades e nas recompensas eternas, do perdedor, que se fixa nos próprios direitos e no lucro imediato — como Moisés, que renunciou aos prazeres do Egito de olhos na recompensa futura. Em que área da sua liderança você tem reivindicado seus direitos em vez de assumir suas responsabilidades, e o que mudaria se você liderasse pensando no 'Muito bem, servo bom e fiel' que deseja ouvir?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 9 — Os segredos dos bem-sucedidos  (aula ordem = 9)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 9;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 9 — Os segredos dos bem-sucedidos$t$,
      9,
$conteudo$O muro ficou 142 pronto no vigésimo quinto dia de elul, em

cinqüenta e dois dias.

Qual era o segredo de Neemias? Como pode levantar, em cinqüenta e dois dias, os muros que ficaram, por décadas, derrubados e descuidados? Ele não se deu por vencido! Continuou trabalhando até terminá-los. Como estudamos antes, Neemias enfrentou uma grande oposição contra a reconstrução da muralha. Sambalate, Tobias e Gesém utilizaram-se da divisão, do desânimo e da discórdia em sua tentativa de deter o projeto. Quando aquilo não funcionou, tentaram a zombaria e a intimidação. Agora chegamos ao capitulo seis de Neemias, faltando apenas colocar as portas. O muro estava quase terminado. Os inimigos de Neemias estavam ficando desesperados. Se Neemias tivesse escrito um livro que se chamasse "Como terminar um projeto em tempo recorde", é possível que dissesse algo assim: Quando Sambalate, Tobias, Gesém, o árabe, e o restante de nossos inimigos souberam que eu havia reconstruído o muro e que não havia ficado nenhuma brecha, embora até então eu ainda não tivesse colocado as portas nos seus lugares, Sambalate e Gesem mandaramme a seguinte mensagem: "Venha, vamos nos encontrar num dos povoados a da planície de Ono". Eles, contudo, estavam tramando fazer-me mal; por isso enviei-lhes mensageiros com esta resposta: "Estou executando um grande projeto e não posso descer. Por que parar a obra para ir encontrar-me com vocês?" Eles me mandaram quatro vezes a mesma mensagem, e todas às vezes lhes dei a mesma resposta.143 Neemias não se deu por vencido. Seus inimigos tinham algumas cartas para jogar, mas Neemias estava pronto para fazer-lhes frente. Se você quer fazer as coisas rapidamente e bem, tem que fazer três coisas: 1. Continue trabalhando, apesar das distrações Sambalate, Tobias e Gesem tentaram desviar Neemias. Eles Neemias 6:15 Neemias 6:1-4 sugeriram que se celebrasse uma conferencia de paz. Que tinha isso de mal? Vamos nos reunir para discutir um meio de nos entendermos. Neemias, porem, estava atento. "Estou levando a cabo um projeto", ele lhes disse, "e não posso desistir." Estava decidido a não se deixar distrair enquanto não houvesse terminado os muros. O tempo das discussões já passou. Agora é tempo de trabalhar. Você já conheceu alguém que quer falar mais que trabalhar? Pessoas que criam situações de conversa para deixar de trabalhar? Muitos projetos não terminam nunca porque são destinados a um comitê, e só chegaram até ai. A burocracia amarra o progresso. Evitea, se for possível. Mais ainda, aqueles enganadores estavam ameaçando a vida de Neemias. Todos os seus anos como copeiro do rei lhe fizeram entender que se tratava de uma tentativa de assassinato. Sabia que, se fosse reunir-se com eles, poderia ser seqüestrado. Viu as más intenções que se escondiam por trás da sua petição. O principal é manter como principal o que é principal Neemias terminou em um tempo recorde porque não permitiu que nada o distraísse. Manteve os olhos fixos em sua meta. Quatro vezes trataram de deter ou atrasar seu trabalho. Em cada uma daquelas vezes, Neemias disse “não”. 2. Continue trabalhando, apesar da difamação Então, na quinta vez, Sambalate mandou-me um dos seus

homens de confiança com a mesma mensagem; ele tinha na mão

uma carta aberta em que estava escrito: "Dizem entre as nações, e

Gesém diz que e verdade, que você e os judeus estão tramando

uma revolta e que, por isso, estão reconstruindo o muro. Alem

disso, conforme dizem, você esta na iminência de se tornar o rei

deles, e até nomeou profetas para fazerem em Jerusalém a

seguinte proclamação a seu respeito: 'há um rei em Judá. Ora,

essa informação será levada ao rei; por isso, vamos conversar".

Eu lhe mandei esta resposta: Nada disso que você diz esta

acontecendo, e pura invenção sua. Estavam todos tentando

intimidar-nos, pensando:

"Eles serão enfraquecidos e não

concluirão a obra".

Tentaram caluniar Neemias; desacreditá-lo. "O que acontece e que você quer levantar um império", o acusaram. "Nós sabemos o que você esta fazendo". Desafiaram sua motivação e o acusaram de Neemias 6:5-9a se rebelar contra o rei. Então, quando lhe enviaram a carta, não a selaram, de propósito, para que todos a pudessem ler. Queriam que ela se tornasse pública, como as cartas a um editor. A finalidade era agitar rumores e suspeitas contra Neemias. Se você tem grandes metas, vão criticá-lo. Talvez pessoas que estão com ci rimes do que você esta fazendo até procurem denegrir sua imagem, Os fracassados odeiam o sucesso. Jesus foi o homem mais falsamente acusado da historia. Como ele respondeu aos que o caluniaram? Como ele nos pede para reagirmos diante das calúnias? Isto e o que ele diz: Bem-aventurados serão vocês quando por minha causa, os insultarem, os perseguirem e levantarem todo tipo de calunia contra vocês. Alegrem-se e regozijem-se, porque grande e a sua recompensa nos céus... Você sabia que cada vez que calunia alguém esta fazendo a obra do Diabo? A palavra "Satanás" significa "caluniador". Este e o trabalho dele. A Bíblia diz que Satanás é o acusador dos santos. Neemias compreendeu o que eles traziam nas mãos. Na realidade, o que pretendiam era assustar-nos. Pensavam em desanimar-nos, para que não terminássemos a obra. Alguma vez você teve de suspender o trabalho que estava fazendo para se defender, porque alguém o criticou? Neemias disse: Não vou cair nessa armadilha. Não vou começar a responder aos rumores e as insinuações. Não vou deixar que me façam desanimar e colocar tudo a perder. Enfrentar acusações falsas e uma das coisas mais difíceis que um líder tem de fazer. E muito desalentador. O que da vontade de fazer e renunciar. Neemias não estava disposto a fazer isto. Negou suas acusações e orou para pedir fortaleza. Compreendia o que os motivava e não cedeu. Quando o criticarem ou o acusarem falsamente, lembre-se de Neemias. Nunca se de por vencido! O que Neemias fez foi orar. "E agora, Senhor, fortalece as minhas mãos!"147 Quando nos acusam e nos atacam com falsidades, nossas emoções sofrem. Abraão Lincoln dizia: "Se eu fosse ler — muito menos responder — todos os ataques lançados contra mim, teria de fechar meu negocio. Faço o melhor, da melhor forma que sei, o melhor que

Mateus 5.11,12a

Paráfrase de Neemias 6:9a

Paráfrase de Neemias 6:9b posso. E assim penso continuar fazendo até o final. E, se ao final resultar que estou errado, então ainda que dez anjos jurem que não estou, não vai servir de nada".

O general MacArthur e Sir Winston Churchill disseram: "Não respondemos as críticas. Não respondemos a difamação. Não respondemos as acusações. Se o fizéssemos, todo o nosso tempo estaria dedicado somente a combater ataques". Henry Ward Beecher disse: "A vida seria uma verdadeira caça às pulgas se ao ser humano fosse exigido que derrubasse todas as insinuações e acusações veladas sobre ele e a falsidade que lançam contra ele". Ser líder significa nos dar conta de que haverá pessoas e coisas que tentarão tirar nossos olhos da meta. E possível que digam algo que o fira e o difame. Quando isso acontecer, você terá de decidir: ou você passa todo o tempo lutando contra as críticas ou continua trabalhando no muro. Decida. Neemias disse: "Eu vou continuar trabalhando no muro". Por isso, depois de cinqüenta e dois dias, o muro estava pronto. Não cedeu diante das distrações nem da difamação. Sabia o que o inimigo tinha em mente, e não estava disposto a ceder. 3. Continue trabalhando, apesar do perigo Um dia fui a casa de Semafas, filho de Delafas, neto de

Meetabel, que estava trancado portas adentro. Ele disse: "Vamos

encontrar-nos na casa de Deus, no templo, a portas fechadas, pois

estão querendo matá-lo; eles virão esta noite". Todavia, eu lhe

respondi: Acha que um homem como eu deveria fugir? Alguém

como eu deveria entrar no templo para salvar a vida? Não, eu Não

irei! Percebi que Deus não o tinha enviado, e que ele tinha

profetizado contra mim porque Tobias e Sambalate o tinham

contratado. Ele tinha sido pago para me intimidar, a fim de que eu

cometesse um pecado agindo daquela maneira, e então eles

poderiam difamar-me e desacreditar-me. Lembra-te do que

fizeram Tobias e Sambalate, meu Deus, lembra-te também da

profetisa Noadia

e do restante dos profetas que estão tentando me

intimidar.

Agora, aqueles obstinados inimigos estão tratando de assustar Neemias. Querem que ele creia que sua vida corre perigo. Compram ao sacerdote Semaías, amigo de Neemias, e fazem com que ele diga a Neemias que existe um complô para assassiná-lo. A única maneira de estar seguro, disse a Neemias seu falso amigo, seria se ele Neemias 6:10-14 corresse e se escondesse no Lugar Santíssimo do Templo. O temor de Deus impediria que os assassinos entrassem ali. Neemias respondeu no versículo 11: "Homens como eu não correm e se escondem no templo para salvar sua vida! Não me esconderei!". Estava decidido a continuar trabalhando, apesar do perigo. O que impediu que Neemias cedesse diante daquela ameaça de morte? Em primeiro lugar, ele sabia que, se ele o fizesse, ia ficar como um covarde. "Homens como eu não correm e se escondem!" Os líderes não saem fugindo. Neemias sabia que havia outras pessoas observando suas reações. Em segundo lugar, Neemias era um homem perspicaz, e soube que aquele conselho não vinha do Senhor. No versículo 12, ele disse: "Percebi que Deus não o tinha enviado". Muitas pessoas que dizem que estão trabalhando para Deus, na realidade estão trabalhando para o inimigo. Talvez até sejam amigos ou parentes seus. E possível que não estejam conscientes de que o inimigo os esta usando, mas lhe dão conselhos para seu beneficio, e que não provêem de Deus. Neste caso, Neemias reconheceu que havia uma agenda escondida. Soube que o conselho não procedia de Deus. Tenho enfrentado casos de pessoas que participam da igreja Saddleback e algumas vezes marcam uma reunião comigo. Oferecem-me um plano para mudar a igreja, ou me apresentam uma nova estratégia, e tudo porque "Deus lhes disse que me dissessem". Quando terminam, eu lhes respondo: "E interessante. Eu acabo de falar com Deus esta manha e ele não me disse nada disso". Eu tenho o costume de falar com Deus. Se ele tem um plano novo para a igreja Saddleback, estou a disposição para ouvi-lo. Você precisa estar em comunicação constante com Deus também, para que ninguém possa enganá-lo com uma "mensagem secreta de Deus". Sim, às vezes, Deus usa outras pessoas para nos dar uma mensagem, mas necessitamos manter-nos em alerta, já que não é sempre o certo. Ele tinha sido pago para me intimidar, a fim de que eu

cometesse um pecado agindo daquela149maneira, e então eles

poderiam difamar-me e desacreditar-me.

Se Neemias corresse para esconder-se no templo, aquilo poria em perigo sua integridade. Era contrario a lei que alguém que não fosse sacerdote entrasse no Lugar Santíssimo. O castigo para o que quebrasse essa lei era a morte. Neemias sabia disso. Nunca permita que o medo o faça quebrar as leis de Deus. Isso Neemias 6:13 e precisamente o que seus inimigos querem que você faca. Se não podem assustá-lo para que renuncie a tudo, vão tentar pressioná-lo para que desobedeça a Deus, e assim perca sua eficácia. Essas são as últimas tentativas desesperadas dos inimigos, e as mesmas coisas vão acontecer em sua vida se você se encontra em alguma posição de liderança. O que quer que tentassem seus inimigos, Neemias continuou se recusando a abandonar tudo. Como conseqüência, "os muros foram construídos em cinqüenta e dois dias". Algo simplesmente assombroso. Os arqueólogos desenterraram uma parte do muro de Neemias que tem uns três metros de um lado a outro, por três e meio de largura. Imagine isto: depois de milhares de anos, continuam conosco as evidências da fidelidade e perseverança de Neemias para que possamos vê-las. Que evidencias você vai deixar para que os outros encontrem? Como vão saber as gerações futuras que você foi fiel a Deus? Isto e algo em que vale a pena pensar. Quando todos os nossos inimigos souberam disso, todas as nações vizinhas ficaram atemorizadas e com o orgulho ferido, pois perceberam que essa obra havia sido executada com a ajuda de nosso Deus.150 Os muros estavam prontos e agora a situação estava invertida. Os judeus já não se sentiam desalentados, deprimidos ou temerosos. Agora, Jerusalém era uma cidade fortificada. Agora, quem estava com medo? O inimigo. Havia perdido sua segurança. Quando o inimigo não pode deter o projeto, lança-se para matar. Poe o líder na mira, como vemos no capitulo seis de Neemias. No futebol, um dos principais objetivos da defesa e eliminar o que dirige o ataque na equipe oposta. Se consegue eliminá-lo, há grandes possibilidades de que ganhe a partida, assim que se lançar para eliminá-lo. Tudo se edifica ou se derruba com a liderança. Não há organização, ministério, igreja, família, escola ou negocio que pode ultrapassar o ponto que o levem seus líderes. Se tudo se levanta ou cai com o líder, então a forma mais rápida que um inimigo tem para deter todo esforço e neutralizar o líder. A forma mais rápida de deter um movimento e eliminar seu líder. Jesus disse que, quando se tira o pastor, espalham-se as ovelhas. Isso continua sendo certo hoje. Quando Satanás quer deixar uma igreja aleijada, ataca seus líderes. E ele não para no pastor ou no resto da equipe pastoral; vai direto perseguir os líderes leigos. Como líder, você precisa se dar conta dessa tática. Há pessoas Neemias 6:16 que não vão gostar de você. Não querem que você triunfe,e, por isso, vão atacá-lo. Há os que farão o que for necessário para fazê-lo fracassar. O modo com que você enfrenta esses ataques pessoais determina o tipo de líder que você é. Uma das lições básicas de Neemias e que os líderes são essenciais em todo projeto. Com os líderes de que necessitavam, puderam conseguir em cinqüenta e dois dias algo que durante oitenta anos as pessoas haviam dito que não era possível fazer. Com o catalisador correto, os planos entram em ação. Que tipo de pessoa e necessário para ir adiante com um projeto de grande importância? Que tipo de pessoa faz falta para alcançar o impossível? O que você, como líder, precisa para triunfar diante das distrações, da difamação e do perigo? Veja aqui as respostas de Deus, com o exemplo de Neemias. 1. O líder necessita de um propósito motivador Este é o primeiro elemento da liderança. Você precisa de uma causa. Um sonho. Um objetivo. Uma meta. O propósito que impulsiona e o que vai lhe empurrar até a sua meta. Ele não apenas guia, mas o arrasta. Você precisa de um propósito que lhe impulsione. A sensação de ter um propósito que lhe impulsionava, que era seu grande projeto, foi o que capacitou Neemias para resistir as distrações, quando seus inimigos lhe sugeriram que descansasse de seu trabalho por um momento. Neemias era um homem resolvido. Sua capacidade de concentração foi uma das razoes primordiais pelas quais os que estavam edificando os muros lograram o impossível em apenas cinqüenta e dois dias. Neemias conhecia a forma de manter no posto principal o que era principal. Qual e o propósito que impulsiona sua vida? O que e que lhe tira da cama todos os dias? O que e que lhe motiva a viver o resto de sua vida? Precisa ser algo mais que o desejo de fazer dinheiro. Caso contrário, se esvairá rapidamente e você ficara de mãos vazias. Enquanto você não descobrir um propósito que impulsione sua vida, tudo o que você esta fazendo e existir. Neemias disse: "Tenho um grande projeto!". O que você diz? Pelo que você esta trocando sua vida? Jesus disse: "O que o homem poderá dar em troca de sua alma?"151 Quando você dá seu tempo para algo, você está investindo sua vida nisso. Isso é a vida: o tempo que você passa na terra. Nós temos a tendência de pensar que a coisa mais importante Mateus 16:26 que podemos dar para as pessoas é nosso dinheiro. No entanto, o dinheiro pode ser substituído. Ao contrário, o tempo é insubstituível. Em primeiro lugar, a característica de um grande líder e que ele tem um propósito que o impulsiona, uma meta que o faz superar tudo, move sua vida e o mantém152 lutando. Paulo diz: "Pois o amor de Cristo nos constrange". A vida dos grandes homens e produzida por um compromisso com uma grande causa. Essa causa e a que os tira para fora deles mesmos. Impulsiona-os a fazer e chegar a ser mais do que teriam podido ser por si próprios. Todos precisam ter um propósito impulsor para a vida. Desafio-o a que o maior dos propósitos que impulsionam sua vida, a maior das causas pelas quais você pode entregar sua vida, seja o Reino de Deus. Não existe melhor maneira de investir sua vida. O Reino de Deus vai durar por toda a eternidade. A maior parte das coisas em que gastamos o tempo não dura nem vinte anos. Desafio você a decidir, agora mesmo, que, se lhe restarem cinco anos sobre a terra ou cinqüenta, você os invista no Reino de Deus.

Na igreja Saddleback temos uma declaração de propósito:

Um grande compromisso com o Grande Mandamento e a Grande Comissão construíra uma grande igreja.

Qual é a sua declaração de propósito? Cada vida deve ter uma. Essa proclamação define o propósito motivador da nossa vida. Se nunca escreveu uma, por que não fazê-lo agora mesmo? Adiante! Deixe o livro por um momento. Eu vou esperar você.

Em certa ocasião, houve alguém que pediu a Jesus que resumisse a Bíblia. Esta foi a resposta:

"Ame o Senhor, o seu Deus de todo o seu coração, de toda a sua alma e de todo o seu entendimento". Este é o primeiro e maior mandamento. E o segundo é semelhante a ele: "Ame o seu próximo como a si mesmo". Destes dois mandamentos dependem toda a Lei e os Profetas.153

Suas ultimas palavras para a igreja, antes de retornar ao céu, foram: Portanto, vão e façam discípulos de todas as nações, batizandoos em nome do Pai e do Filho e do Espírito Santo, ensinando-os a obedecer a tudo o que154eu lhes ordenei. E eu estarei sempre com vocês, até o rim dos tempos.

2 Coríntios 5:14

Mateus 22.37-40

Mateus 28.19,20

Essas duas declarações de Jesus, conhecidas como o Grande Mandamento e a Grande Comissão, resumem tudo o que a igreja e nossa vida devem fazer. Quando nós fazemos essas coisas, quando amamos a Deus de todo coração (adoração), amamos nosso próximo como a nós mesmos (confraternização e Ministério), vamos fazer discípulos (evangelismo), trazemo-los a família de Deus (companheirismo) e os ensinamos a observar todas estas coisas (discipulado), estamos realizando os cinco propósitos pelos quais a igreja existe. Quando fundei a igreja Saddleback, pedi a Deus: "Senhor, dá-me nossa razão de ser em uma só frase". Essa e a frase que ele me deu. £ a chave, não só de uma grande igreja, mas do que e ser um grande cristão. Se e esse o anelo do seu coração; se você quer que sua vida sirva para algo, tenha um propósito motivador. Invista sua vida nessas cinco coisas: amar a Deus, amar o próximo como a você mesmo, ir e fazer discípulos, ajudar as pessoas a conhecerem Cristo e ensiná-los a crescer em Cristo. Não há causa maior do que esta. Infelizmente, são muitas as pessoas que se desviam do seu propósito. O refrão diz: "Ao que não esta firme em algo, qualquer coisa o derruba". 2. O líder necessita de uma perspectiva clara Neemias tinha um discernimento incrível; era quase como um radar espiritual. Cada vez que lhe armavam uma cilada, ele percebia. Cada vez que acontecia, ele farejava. No versículo dois do capitulo seis, seus inimigos o convidaram para que saísse para conversar. Neemias discerniu qual era a verdadeira intenção deles. "estão tramando algo para me fazer mal". Como soube? Era sagaz. Tinha discernimento. Mais tarde, quando o acusaram de tentar fazer-se rei e de rebelar-se contra Artaxerxes, disse: "Em verdade, o que pretendiam era nos assustar". Pôs em evidência os verdadeiros motivos de seus inimigos. Quando aquele falso amigo lhe disse: "Vem para esconderte no templo", ele percebeu que não era Deus quem o havia enviado. Tinha uma aguda capacidade de percepção. Pressentia que se tratava de uma cilada. Como líder, você precisa ter percepção. Isso e chamado também de sabedoria. Como se adquire? A Bíblia nos diz: "Se algum de vocês tem falta de sabedoria, peça-a a Deus".155 Quando uma pessoa passa tempo com a Palavra de Deus, começa a receber a mente de Cristo. Assim e como nos convertemos em líderes mais lúcidos. Não nos deixamos enganar por tudo o que atravessa nosso caminho, porque Tiago 1.5 estamos aprendendo a pensar como Jesus. O medo nubla nossa percepção. Neemias disse: "Aconteça o que acontecer, eu sigo adiante". Podemos definir o medo como o fato de que as falsas evidências nos pareçam reais. Achamos que algo vai nos fazer dano, mas não é assim. Deus continua tendo o controle de tudo, e vai nos ajudar. O líder precisa de um propósito motivador e uma perspectiva clara. 3. O líder necessita de uma vida de oração continua Quase podemos qualificar Neemias de viciado em oração Sua primeira reação diante de qualquer coisa era orar. O que quer que acontecesse, isso era a primeira coisa que ele fazia. Quando estiverem difamando você, também e isso a primeira coisa que deve fazer. Em lugar de se incomodar com a pessoa, fale com Deus. Neemias não ficou na defensiva, nem tampouco se vingou quando seus inimigos começaram a levantar falsas acusações contra ele. Limitou-se a dizer: "Isso não é correto". Você não precisa montar uma grande defesa. Apenas diga: "não é correto", e depois vá e fale com Deus.

Então Jesus contou aos seus discípulos uma parábola, 156

para mostrar-lhes que eles deviam orar sempre e nunca desanimar.

Na vida, sempre estamos fazendo uma coisa ou outra. Ou bem oramos, ou bem nos desanimamos. Quando estamos sob pressão, oramos ou entramos em pânico. Precisamos de uma vida de oração contínua.

4. O líder necessita de uma perseverança intrépida Uma das grandes chaves de todo sucesso e a capacidade para seguir em frente. Pura tenacidade. Seguir fazendo o que Deus quer que façamos. Se você estudasse todas as mensagens que Deus me tem dado ao longo dos anos, iria ver que, basicamente, tenho dois temas: um é para os não-cristãos e o outro é para os cristãos. Para os não-cristãos, meu tema é: "Deus se interessa por você, você e importante para ele". Digo isso de muitas maneiras distintas. Para os cristãos, minha mensagem básica é "Não se desanime!", Todos nós fatigamos na batalha diária. A mensagem de Deus é esta: "Não se desanime!". Você precisa ter uma perseverança intrépida. Lucas 18:1 A coragem não consiste na ausência de temor. A coragem consiste em seguir adiante, apesar do temor. A falta de temor não significa que sejamos pessoas corajosas; talvez possa significar que sejamos pessoas tolas. Talvez, na verdade, você não perceba a seriedade da situação. A coragem e o que faz com que sigamos em frente, apesar do nosso temor. Neemias disse: "Não vou sair fugindo. Admito que estou assustado; tenho medo. Mas estamos chegando a meta final. Tudo o que falta por fazer e apenas colocar as portas. Sei que querem me matar, mas vou seguir em frente apesar do meu temor. Não vou sair fugindo". Neemias tinha uma perseverança intrépida. Como você sabe que tem medo? Você tem medo quando sente um insaciável desejo de sair fugindo: do seu trabalho, do seu casamento, de uma relação, da casa, e tudo isso porque você tem medo de não poder enfrentar as situações. Você quer sair correndo. Isso aprendi acerca do temor: nunca constitui a vontade de Deus para mim que eu saia fugindo de uma situação difícil. Se eu faço isso, Deus trará outra pessoa depois para que possa me ensinar uma lição. Penso que isso também é correto com respeito à sua vida. Adiante! Enfrente a realidade. E não nos cansemos de fazer 157 o bem, pois no tempo próprio colheremos, se não desanimarmos. Você precisa ter um propósito motivador que domine sua vida de tal maneira, que não exista nada trivial que o possa distrair. Há um jogo chamado Trivial Pursuit158, que descreve muitas coisas da vida das pessoas. Observe sua vida mais de perto. Onde e que o inimigo esta tentado desviar você do melhor que Deus tem para sua vida? Às vezes, poderá ser difícil discernir. Com freqüência, Satanás usa coisas boas para nos afastar das melhores. O que e que esta consumindo seu tempo e o afastando do que e realmente importante para sua vida? O que realmente importa? A Bíblia nos diz: amar a Deus e amar o nosso próximo como a nós mesmos; adorar e ministrar. Se você está demasiadamente ocupado para adorar, demasiadamente agitado para ter um momento tranqüilo a cada dia, demasiadamente cheio de coisas para poder ministrar, então está demasiadamente ocupado. Todas essas atividades que o distraem agora, não terão nenhuma importância daqui a alguns anos. Entretanto, o que você estiver fazendo para Deus vai durar toda a eternidade. Na realidade, onde você quer investir seu tempo? Satanás nos agarra a base de substituir tudo isso por coisas boas. O tempo esta limitado pelas exigências da vida. Pense no que você precisa diminuir a fim de ter tempo para o Ministério. Crie Gálatas 6:9 Jogo de tabuleiro, cujo progresso do jogador depende de sua habilidade em responder a perguntas de conhecimento geral e de cultura popular tempo para o que Deus quer que você face.

Quais são os segredos dos bem-sucedidos? Repassemos a lista mais uma vez, para termos certeza de que compreendemos:

1. Uma perspectiva clara. Que nível de sensibilidade

espiritual você tem? Conhece a Palavra o suficiente como para

poder detectar as ciladas?

2. Uma vida de oração contínua. Como esta sua vida de

oração? E continua? Você esta orando ou se sente desânimo?

3. Uma perseverança intrépida. Até que ponto você e

perseverante na hora de cumprir a vontade de Deus? Você tomou

alguma vez esta decisão: "Vou seguir Jesus cem por cento, e não

me importa o que aconteça, nem o preço a ser pago, nem o que

tiver de fazer, nem o que as pessoas pensem de mim, nem os

desvios ou perigos? Vou fazer o que devo fazer". você se mantém

firme nessa decisão? Se a resposta e "não", ou um "na verdade,

não estou indo tão bem", não se de por vencido. Nunca é tarde

para voltar para Deus.

Essas são as características das pessoas de sucesso. Assim Neemias pode fazer em cinqüenta e dois dias o que o povo havia dito durante oitenta anos que era impossível ser feito. E e assim que você também vai poder fazer grandes coisas para Deus. Uma das grandes lições de Neemias e que tudo se levanta ou cai, conforme seus líderes. O mundo tem uma urgente necessidade de líderes. Se a igreja não os esta produzindo, adivinhe quem vai produzi-los. Eu o desafio a se dedicar por inteiro a seu Ministério de liderança. Repita comigo: "Eu não sei o que posso fazer, mas vou fazer o que puder com o que tenho, vou fazê-lo para Jesus Cristo hoje. Senhor, estou disposto a te seguir onde for, na hora que for, no lugar que for, e fazer isso quando me pedires. Talvez tenha somente um talento, não cinqüenta, ou quinze, ou até cinco, mas esse talento que tenho, eu quero usar para ti." A vida não pode chegar a ter um propósito maior que o de servir ao Reino de Deus. Eu o desafio a dizer: "Ainda que eu fique sozinho um dia, uma semana ou um ano — o que tu quiseres me conceder—, quero assumir um grande compromisso com o Grande Mandamento e a Grande Comissão". Se você se consagrar a essas duas coisas, a fazer o que dizem esses dois versículos, você vai ser um grande líder. As grandes pessoas não são nada mais do que pessoas comuns que assumem um grande compromisso com uma grande causa. Talvez você precise dizer: "Senhor, dá-me uma perspectiva clara. Estou fazendo muitas coisas, e me dou conta que, na realidade, são atividades triviais. Mostra-me o que posso eliminar para que sobre tempo para o que e verdadeiramente importante". Talvez você se sinta a ponto de se dar por vencido. Talvez nem saiba como chegar ao dia de amanha. Você quer orar para que Deus desenvolva em você uma vida de oração continua? Quer orar em lugar de desfalecer? Você quer pedir a Deus a intrépida perseverança de continuar fazendo o que você sabe que e o correto? A coragem consiste em seguir adiante, apesar de seu temor. Algumas vezes dizemos: " Tenho medo de me envolver na liderança. Posso sair ferido. Posso fazer algo que me envergonhe". Sim, é possível. A coragem, no entanto, consiste em seguir em frente, apesar de seus temores, sabendo que Deus esta com você. Ele tem o grande desejo de usá-lo; tudo o que você precisa fazer e deixar que ele use sua vida. "Senhor, toma minha vida. Quero que me uses". Lembre-se do

grande sacrifício que Cristo fez por você. Por acaso isso não exige

de você um sacrifício mais profundo?

"Senhor, o que tu fizeste por mim merece que eu te consagre

tudo o que tenho". Você estaria disposto a dizer isto, de todo o seu

coração, agora mesmo?

"Senhor, peco-te que levantes uma geração de Neemias entre

os que estão lendo este livro. Levanta líderes; líderes piedosos,

pessoas com um propósito que as impulsione a servir em teu Reino;

pessoas que tenham uma clara perspectiva do que e realmente

importante na vida: uma oração continua e uma intrépida

perseverança. Pedimos-te isto em nome de Jesus. Amém".

GUIA PARA APLICAÇÃO DO PRINCÍPIO 9

Os segredos dos bem-sucedidos

Aplicando os propósitos de Deus

Comunhão — Deus não nos fez como ilhas auto-suficientes, ele nos colocou num corpo de crentes para que nos apoiemos mutuamente nos momentos de necessidade.

• O que os cristãos podem fazer melhor juntos do que

separados?

• Como líder, de que maneira seu grupo de crescimento

ou célula, igreja ou amigos cristãos o ajudam a seguir em frente

quando você diz "Eu me rendo"?

Discipulado — Quando teve de escolher entre lutar contra a crítica ou continuar construindo seu muro, Neemias escolheu o muro.

• Quem provocou essa atitude determinante em

Neemias?

• Existem outras pessoas que observam e aprendem

com a sua liderança e a sua vida. Tendo isto em conta, de quem

você deveria aprender?

• O que você pode fazer para ter a certeza de que sua

vida e um modelo a ser seguido?

• No futuro, você terá de enfrentar críticas que tentarão

deter seu progresso com o Senhor. Como você vai reagir diante

disto?

Ministério — Amar o próximo como a nós mesmos. Esse e o ministério! Lembre-se de que liderança quer dizer ser exemplo.

• De que maneira você pode encorajar outro crente no dia de hoje?

• Você conhece alguém cuja carga pode ser aliviada com um chamado telefônico, um e-mail ou um abraço? Peça a Deus que revele essa pessoa a você e permita ser suas mãos e pés. Diga a alguém que precise ouvir: Não se renda!

Evangelismo — Deus nos comissionou a compartilhar suas boas-novas a outros. O Senhor nos apóia quando cumprimos esse mandamento.

• Como Neemias evangelizava a Sambalate, Tobias e

Gesém?

• O que isso tem a ver com sua função de liderança?

• Decida seguir a liderança de Deus em tudo o que você faz.

Permita que ele fale ao coração até de seus inimigos. Não permita

que o medo mantenha você separado de seu chamado. Permita

que o mundo saiba que Deus ama a todos. Diga que Deus se

preocupa com eles.

Adoração — Adoramos o Senhor amando-o com todo o nosso coração.

• Como se evidencia nosso amor por ele em nosso

compromisso de seguir seu propósito para nossa vida?

• Você descobriu o propósito de Deus para sua vida e esta

trabalhando para alcançá-lo?

• Se não esta seguro, fale com o Senhor agora mesmo e peca

a ele que lhe de o fogo de Neemias para alcançar seus objetivos.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Quando Sambalate e Gesém o chamaram quatro vezes para 'conversar' na planície de Ono, Neemias respondeu sempre o mesmo: 'Estou executando um grande projeto e não posso descer.' Que distrações — até boas e aparentemente razoáveis — estão hoje tentando tirá-lo do muro que Deus mandou você construir, e o que significaria, na prática, 'manter como principal o que é principal'?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante da carta caluniosa que o acusava de querer ser rei, Neemias não montou uma grande defesa; apenas disse 'isso não é verdade' e orou: 'Senhor, fortalece as minhas mãos.' Quando você é criticado ou acusado injustamente na sua liderança, qual costuma ser sua primeira reação — gastar tempo se defendendo ou voltar ao trabalho e à oração? O que precisa mudar para reagir como Neemias?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O capítulo afirma que o líder precisa de um propósito que o impulsione, e desafia o leitor a escrever sua própria declaração de propósito, investindo a vida no Reino de Deus. Se você parasse agora para escrever, em uma frase, o propósito que tira você da cama todos os dias, qual seria — e ele é grande o suficiente para sustentar você diante das distrações, da difamação e do perigo?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 10 — Como os líderes mantêm o sucesso  (aula ordem = 10)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 10;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 10 — Como os líderes mantêm o sucesso$t$,
      10,
$conteudo$O muro ficou 159 pronto no vigésimo quinto dia de elul, em cinqüenta e dois dias.

"Parabéns, Neemias! você conseguiu! você terminou a obra. Fez o que tinha de fazer". Não é o que da vontade de dizer depois de ler esse versículo? "Agora, Neemias, descanse. você trabalhou duro. você merece umas ferias." Você já chegou a algum ponto importante dentro de um projeto? Respirou fundo de satisfação, e depois sentiu que um pensamento o fazia voltar à realidade como se fosse uma bofetada? "E agora, o que? Se a reconstrução dos muros fosse um grande jogo de ligas de futebol, a resposta seria: "Agora, eu fico com a taca de campeão!" No entanto, a verdade e que seu trabalho só esta na metade. A forma pela qual nos comportamos diante das vitorias fala muito sobre nós, fala do nosso caráter e do nosso sistema de valores. Um dos momentos mais perigosos na vida e quando você alcança uma meta. O que acontece quando você obtém o que havia proposto fazer, e não tem nenhuma outra meta para seguir? Agora sim, você esta com um problema. O sucesso destrói muitas pessoas. Tornamo-nos cômodos, satisfeitos... e inúteis. Todo o impulso que conseguimos ter para o grande projeto acabou. Eu tenho visto isso acontecer uma e outra vez. No momento em que terminam um edifício, as pessoas lançam um suspiro coletivo de alívio e gritam: "Chegamos, estamos na Terra Prometida!". E param de crescer. Pense agora em pessoas que você conhece, ou que da sua parte, conhecem alguém que conseguiram algum grande sucesso cedo na vida. Com freqüência, ao invés de se manterem motivados dentro do caminho da vitoria, o que fazem e parar. Sentem-se satisfeitos, acomodam-se e nunca dão um passo a mais. Isso pode acontecer a qualquer um de nós. Se nos descuidarmos, podemos perder o que nos custou tanto trabalho. O que um líder pode fazer para manter seu sucesso? Neemias tem algumas sugestões para nós. Neste capitulo, veremos como se assegurou de que suas conquistas durariam. O capitulo 7 é a linha divisória dentro do livro de Neemias. A primeira fase de sua vida foi a etapa da construção. A segunda foi o Neemias 6:15 período da consolidação. Nos seis primeiros capítulos, lemos a respeito da reconstrução dos muros. Os capítulos de 7 a 12 descrevem a consolidação da cidade. São duas fases muito diferentes. Na sua vida, Neemias passou de copeiro do rei a governador de Judá. Agora, acabou o grande esforço para levantar os muros e seu papel muda de novo. Agora tem de usar um conjunto diferente de habilidades como líder.

• Não fazer a transição entre construir e manter e a principal razão pela qual os negócios quebram, as igrejas não crescem e as organizações fracassam. O problema da transição e este: os líderes não sabem crescer com a organização. Não tem as habilidades necessárias para a próxima fase. Como conseqüência, enforcam a igreja ou o negocio, no momento que começam. Se os líderes não adotam as novas habilidades que fazem falta para manter seu êxito, o que levantaram morrera.

DOIS TIPOS DE LÍDERES

Existem dois tipos distintos de líderes. O Tipo Um eu chamo de "catalisador". O catalisador é o que põe em movimento o projeto. O Tipo Dois é o "consolidador". Estes são os que mantêm o projeto em movimento, uma vez levantado. O Tipo Um e o idealizador e o Tipo Dois e o executor. Os consolidadores desenvolvem o que os idealizadores projetaram. O Tipo Um é o motivador. O Tipo Dois é o administrador. O Tipo Dois sabe fazer com que, uma vez estabelecido, o projeto levantado pelo Tipo Um funcione sem problemas. O Tipo Um é o empreendedor. Geralmente, começa algo por ele mesmo. No entanto, à medida que a organização cresce o empreendedor deve converter-se no executivo. Os executivos trabalham por meio de outros. Sabem que não podem manter sozinhos o que fizeram andar. Há dois tipos claramente distintos de habilidades na liderança. Ambos são necessários nas igrejas, nas famílias, no governo e nos negócios. Para começar, e necessário o catalisador do Tipo Um: o idealizador, motivador, empreendedor. Mais tarde, na fase de consolidação, são necessários os administradores e os desenvolvedores do Tipo Dois, pessoas que sabem administrar ou levar adiante a operação diária. Paulo e um bom exemplo de líder do Tipo Um. Era um pioneiro, um homem em movimento que nunca ficava muito tempo no mesmo lugar. Fazia andar algo e dizia: "Agora você toma conta". Deixava Timóteo, Tito, Epafrodito ou algum outro administrador responsável pela manutenção diária do que ele havia começado. Paulo era um líder do Tipo Um. Em contrapartida, Timóteo, Tito e Epafrodito eram líderes do Tipo Dois. A Bíblia diz: "A razão de tê-lo deixado em Creta foi para que você pusesse em ordem o que ainda160faltava e constituísse presbíteros em cada cidade, como eu o instruí". Outras versões dizem: "Por esta causa te deixei em Creta, para que corrigisses o deficiente, e estabelecesses anciãos em cada cidade, assim como eu te mandei". "Para que pusesses em boa ordem o que ainda resta".161 O líder sábio conhece seus pontos fortes e seus pontos fracos, e os compensa por meio de uma equipe de trabalho. E muito raro encontrar um líder que seja catalisador e consolidador ao mesmo tempo. Quando o encontramos, geralmente está entre os milionários, são as pessoas que manejam os maiores negócios. Trata-se de personalidades dinâmicas que também tem a capacidade de crescer com a organização. Neemias era um destes homens. Sabia mudar de responsabilidades. Quando terminou o muro, deixou o capacete pesado de construtor para colocar o traje fino de executivo. Na fase seguinte da sua vida, Neemias necessitou de um conjunto de habilidades totalmente diferentes das que havia utilizado até o momento. Neemias estava pronto. No capítulo 7, Neemias demonstra suas tarefas gerenciais, essenciais para o crescimento consolidado. Você sabia que entre 90 e 95% das igrejas fundadas nunca passaram de duzentas ou trezentas pessoas? Chegam a duzentas ou trezentas pessoas, e depois diminuem de tamanho. Sobem e descem. Porque os líderes não sabem fazer a transição que Neemias apresenta no capítulo 7, suas igrejas nunca crescem. A menos que o líder desenvolva essas habilidades, a organização nunca passara do Ministério de apenas um homem.

COMO MAMTER O QUE SE CONQUISTA?

1. Recrutando líderes. Buscando, preparando, delegando e envolvendo outras pessoas. 2. Registrando o progresso. Mantendo um bom registro dos recursos existentes. 3. Obtendo apoio financeiro. Achando os fundos necessários para financiar a operação que esta sendo levada a cabo.

A Bíblia diz que toda a Escritura é proveitosa. Como líder, decida agora mesmo aproveitar as lições de Neemias. Veja o que Neemias fez para obter sua transição de catalisador a consolidador.

Tito 1:5 Tito 1:5, AEC 1. Recrute mais líderes Depois que o muro foi reconstruído e que eu coloquei as portas no lugar, foram nomeados os porteiros, os cantores e os levitas.162

Assim que acabaram os muros e colocaram as portas, Neemias contratou mais pessoas. Nomeou três classes distintas de líderes.

Porteiros - os guardiões, os vigilantes e a polícia da cidade. Seu trabalho consistia em proteger e manter a paz. Cantores - Eram os líderes da adoração. A adoração era importante para Israel.

Levitas - Eram os ajudantes dos sacerdotes.

Para governar Jerusalém encarreguei o meu irmão Hanani e, com ele, Hananias, comandante da fortaleza, pois Hananias

era integro e temia a Deus mais do que a maioria dos homens. Neemias nomeou seu irmão Hanani, um líder civil, como "prefeito" de Jerusalém. Enquanto isso, Hananias tornou-se comandante da fortaleza, algo semelhante, hoje, ao chefe de policia. Em sua condição de governa-dor, Neemias tinha agora um pessoal complete e contava com porteiros, cantores, levitas, um prefeito e um chefe de policia. Estava demonstrando uma habilidade de liderança chave em toda organização que cresce: a capacidade para delegar. Estava envolvendo outras pessoas. Sabia que administração diária da província era serviço para mais de um homem, assim, estava entregando a responsabilidade, repartindo-a. Isto aconteceu muito tempo antes dos seminários de Peter Drucker, e os livros como Em busca da excelência, de Tom Peters. No entanto, Neemias compreendia os princípios básicos da administração. Sabia que era necessário dividir a responsabilidade. Alguém pode sonhar, desenhar, criar e construir o lugar mais maravilhoso do mundo, mas faz falta pessoas para que o sonho se converta em realidade.

WALT DISNEY

Neemias sabia que nenhuma organização poderia chegar a estabilizar-se, se estivesse edificada sobre uma só pessoa. O líder eficaz necessita passar de empreendedor a executivo. No princípio, Neemias fazia tudo. Não havia comitê, ele não pedia opinião a ninguém e não tinha mais líderes. Ele fazia tudo. Neemias colocava Neemias 7:1 Neemias 7:2 sua mão em tudo. No princípio de todo projeto, o empreendedor deve envolver-se em todas as etapas do caminho. No entanto, à medida que o projeto vai crescendo, ele necessita delegar responsabilidades. O líder do projeto necessita entregar cada vez mais responsabilidades a seu pessoal, aos líderes leigos ou a outros ajudantes. A participação em tudo e magnífica para que o projeto comece a andar, mas, em longo prazo, não é uma forma eficaz de administrar. Quando comecei a igreja Saddleback, em 1980, minha meta era entregar o Ministério. No princípio, minha esposa, Kay, e eu fazíamos tudo. Eu imprimia os boletins, preparava as cadeiras, as recolhia, planejava o culto, pregava, e às vezes recolhia as ofertas. No entanto, minha meta continuava sendo trabalhar de maneira que não fosse necessária a minha presença, entregar o Ministério. Ainda que tivesse sido eu quem iniciou a igreja e a ergueu, a igreja não foi levantada sobre mim. Fomos buscando outros líderes, outras pessoas, mais pessoal, e entregando as responsabilidades do Ministério. Já em 1989, a única coisa que ficou para eu fazer era pregar. Depois também comecei a compartilhar a pregação. Assim se entrega o Ministério. O líder eficaz delega. Se eu tivesse mantido todas as responsabilidades, como no princípio, a igreja Saddleback teria deixado de crescer ao chegar a cento e cinqüenta pessoas. Assim como estão as coisas, Saddleback me superou já faz muito tempo. Um dos preços do crescimento que você deve estar disposto a pagar é ter pessoas em sua equipe, as quais talvez você nunca Veja ou com as quais nunca fale. Nosso ego precisa ser capaz de compartilhar a liderança. As pessoas em Saddleback para pedir conselhos, ou para casamento, e não me perguntam nada. Isso não me causa nenhum problema. Se eu fosse o único homem santo e preparado em Saddleback, teria ainda uma igreja muito pequena. A capacidade, o tempo, o esforço, a energia, o talento e os conhecimentos de uma pessoa têm suas limitações. Por isso, Deus fez mais de uma pessoa. Você vai entregando o Ministério. Vai entregando a liderança. Este é o princípio da delegação. Neemias disse: "Já levantamos a muralha. Chegou a hora de nos assegurarmos de que não iremos perdê-la. Vamos distribuir a liderança". E delegou responsabilidades. Já que tudo se levanta ou cai de acordo com a liderança, o tipo de líderes que você escolher e essencial. Se você tem as pessoas erradas em posições de liderança, elas podem semear sementes de destruição em qualquer empreendimento, Ministério ou programa. Que tipo de líderes Neemias procurou? O que e importante para você ao escolher as pessoas que vão ajudá-lo? Procure o mesmo tipo de pessoas que Neemias buscou: gente íntegra, piedosa e fiel. A. Integridade Para governar Jerusalém encarreguei o meu irmão Hanani e, com ele, Hananias, comandante da fortaleza, pois Hananias era integro e temia a Deus mais do que a maioria dos homens. Primeiro tem de ser a integridade. O denominador comum da liderança e a integridade. Se não podem confiar em você, quem vai segui-lo? E se ninguém o segue, você não é um líder. John Maxwell disse: "O que acredita ser líder, mas ninguém o segue, esta só se distraindo". Você precisa ser integro. A liderança se edifica sobre a confiança. Se as pessoas confiam em você, você e um líder. Se não confiam, não é um líder, e não importa o título que você de a si mesmo. No momento em que você tenha de dizer às pessoas que você é o líder, você já deixou de sê-lo. A liderança tem a ver totalmente com a confiança. B. Piedade ... 165 era íntegro e temia a Deus mais do que a maioria dos

homens.

Neemias buscou pessoas que levassem a serio sua relação com Deus. Temer a Deus significa ter reverencia para com ele. Esta claro que Hanani era um homem espiritual que levava Deus a serio. Quando Deus procura líderes, ele quer saber que tipo de pessoas eles são. Qual a relação que tem com ele. A piedade e uma qualidade chave para os líderes que Deus usa. C. Fidelidade Tanto Hanani como Hananias tinham toda uma historia de relação com Neemias. Ele os conhecia, e já havia trabalhado com eles. Hanani foi quem fez a longa viagem até a Pérsia para falar com Neemias sobre os muros. Ele foi o que buscou a ajuda de Neemias. Se ele não houvesse dado o passo inicial, talvez Neemias nunca tivesse ido reconstruir os muros. Sua fidelidade demonstrava que era digno de confiança. Devem ser primeiramente experimentados; depois, se não Neemias 7:2 Neemias 7:2b

houver nada contra eles, que atuem como diáconos.166

Quando colocamos numa posição de liderança alguém que não foi provado, nove de cada dez vezes se tratara de uma bomba relógio. Você pode ter certeza disso. Procure pessoas que tenham demonstrado ser dignas de confiança. O senhor respondeu: "Muito bem, servo bom e fiel! você foi fiel no pouco, eu167o porei sobre o muito. Venha e participe da alegria do seu senhor!". As ascensões têm como base a fidelidade. Se formos fieis nas coisas pequenas, Deus nos dá coisas maiores. E as palavras que me ouviu dizer na presença de muitas testemunhas, confie-as a homens fieis que sejam também capazes de ensinar outros. Paulo está dizendo a Timóteo: "O que você tem visto e ouvido em mim, eu dou a você. Você tem de entregar a pessoas fiéis e de confiança que reúnam as qualidades para ensinar aos outros. Comunique-o segundo a fidelidade deles. Invista em pessoas que são fieis". Deus escolhe líderes baseado em duas coisas: sua vida pessoal e sua atuação no passado. Isto é sobre o que devemos orar quando estamos buscando um líder. Eu lhes disse: As portas de Jerusalém não deverão ser abertas enquanto o sol não estiver alto. E antes de deixarem o serviço, os porteiros deverão fechar e travar as portas. Também designei moradores de Jerusalém para sentinelas, alguns em postos no muro, outros em frente das suas casas. Neemias escolheu seus líderes, e agora lhes deu uma clara descrição de suas responsabilidades. Ele lhes faz algumas indicações muito concretas. "Vigiem; mantenham-se em guarda, estejam alerta, tenham cuidado". Os muros já foram levantados, as portas estão em seu lugar, mas temos de continuar vigiando. As portas de uma cidade eram a chave de sua segurança. Imagine isto: Durante os cinqüenta e dois dias passados, o povo trabalhou dia e noite para reconstruir seus formosos muros. Agora, já estavam terminados. As gigantescas portas estão em seu lugar. Então, uma noite que eles se esquecem de designar vigias, um inimigo desliza para dentro da cidade e a volta a capturar. Isso não seria trágico?

1 Timóteo 3.10

Mateus 25.2

2Timóteo 2.2

Neemias 7.3

Deus quer que você compreenda este princípio: o que e obtido precisa ser cuidado. Essa é a razão para a história de Neemias estar na Bíblia. Se você não cuida do que obteve, vai perdê-lo. Nunca esteja seguro de que, por haver alcançado certo nível de êxito, você vai permanecer, sem nenhum esforço, no lugar a que chegou. Temos de proteger o que alcançamos. Você já se esforçou para perder peso, só para ver depois como voltam os quilos e os centímetros com maior rapidez que antes, e tudo porque você não estava cuidando do que havia ganhado (ou perdido!)? Os sucessos do passado não são garantia de um sucesso continuo. Nós podemos passar anos aprendendo um idioma estrangeiro, e perdemos simplesmente porque não o utilizamos. £ um princípio da vida: use-o ou perca-o. Esse princípio também é certo em nossa vida espiritual. Podemos chegar a grandes sucessos em nosso caminhar com Cristo, só para perder terreno e cair depois, quando baixamos a guarda. Quando falo com pessoas que estão espiritualmente caídas, percebo que não se trata de que agora amo ao Senhor e dentro de um minuto, não mais o amo. Essas pessoas passaram de amar a Deus agora para esquecê-lo dentro de um minuto. Não é um amor que se transformou em ódio, mas uma simples questão de descuido. Quanto você precisa se esforçar para que ervas daninhas nasçam em seu quintal? Nada! Crescem sozinhas enquanto não estamos atentos. As ervas daninhas são um sinal de descuido. E as ervas daninhas do espírito crescem até asfixiar nossa vida, se descuidamos das coisas básicas da vida crista. Precisamos proteger o que temos ganhado, tanto no físico como no espiritual. Portanto, estejam com a mente preparada, prontos para agir; estejam alertas e coloquem toda a esperança na graça que lhes será dada quando Jesus Cristo for revelado. Nas Escrituras, vemos que Jesus diz muitas vezes: "Vigiem e orem". Precisamos vigiar nossa vida pessoal com o fim de não perder terreno para o Diabo. O primeiro princípio para manter o que já ganhamos é o de recrutar novos líderes e delegar responsabilidades. Crie um sistema de apoio que faca com que nem tudo dependa de você.

2. Registre seu progresso

Para sobreviver e essencial manter bons registros contábeis. Você precisa estabelecer algum tipo de sistema de contabilidade e manutenção de estatísticas. A contabilidade geralmente se refere ao

1 Pedro 1:13 dinheiro, mas, em Neemias 7, vemos que ele esta fazendo uma estatística das pessoas. As pessoas são mais importantes que o dinheiro. Nossos registros sobre as pessoas que estão em nosso negocio ou Ministério devem ser pelo menos tão bons como a nossa contabilidade financeira, e talvez melhores do que ela. Registre seu progresso, mantenha o rastro de seu povo. Neemias fez um censo. Não era só para ver quantas pessoas havia ali, mas também para ver quem eles eram. O capitulo 7 é o mais comprido do livro, porque e uma lista de descendências e genealogias. Para a maioria de nós nos parece aborrecido ler essas listas, e nós as saltamos. No entanto, foi Deus quem as colocou ali. De fato, há três listas de nomes no livro de Neemias, nos capítulos 7, 11 e 12; três listas completas de pessoas. Seus nomes não têm grande importância para você ou para mim, mas tiveram para Neemias. Para ele, as pessoas eram importantes. E significaram muito para Deus. Caso contrário, seus nomes não estariam na Bíblia. Para Deus, as pessoas são importantes. Ora, a cidade era grande e espaçosa, mas havia poucos moradores, e as casas ainda não tinham sido reconstruídas. Por isso o meu Deus pôs no meu coração reunir os nobres, os oficiais e todo o povo para registrá-los por famílias. Encontrei o registro genealógico dos que foram os primeiros a voltar. Assim estava registrado ali...171 Neemias está começando um programa populacional. Ele construiu os muros que rodeiam a cidade. Colocou as portas no seu lugar. Agora se da conta de algo: poucas pessoas vivem na cidade. Enquanto os muros estavam destruídos, a cidade não era um lugar seguro para se viver e, por isso, as pessoas iam se mudando para os campos. Neemias compreendeu a necessidade de atrair novamente pessoas a cidade, para fortificá-la internamente. Se a cidade de Deus necessitava de proteção, ele necessitava de pessoas que viveriam ali para cuidar dela. Por isso, disse: "Vou fazer um censo, para averiguar quantos somos e quem somos. Depois, vamos fazer que certo número (talvez dez por cento) volte a morar na cidade". Ele compreendia a necessidade de reforçar as estruturas internas. Essa e a segunda coisa que você precisa fazer no processo de consolidação. Para que Jerusalém continuasse adiante, precisava ter gente suficiente nos lugares corretos, a fim de ser forte. O que Neemias estava fazendo parecia muito com um programa de renovação urbana. Neemias sabia que era Deus quem o havia inspirado a contar toda aquela gente. Vejamos o que diz a Palavra: "Por isso o meu Deus pôs no meu coração..." O verdadeiro líder se mantém em sintonia com Deus. Foi Deus quem lhe disse que fizesse o que estava fazendo. Se Neemias 7.4,5 Neemias não tivesse permanecido perto de Deus, e com o costume de falar com ele, não saberia o que tinha de fazer. Agora sabia que era Deus quem o havia inspirado a manter bons registros. A contabilidade e um Ministério espiritual. Tudo o que tenha a ver com a obra de Deus e um Ministério espiritual. Desde o versículo 7 até o 69, temos a contagem do povo. Ele faz uma lista dos líderes, divide o povo por famílias e por cidades, põe na lista também os líderes religiosos e os sacerdotes, e os levitas e cantores, os criados do templo e os descendentes de Salomão, e até aqueles cujo sangue não era 100% judeu. Depois das pessoas, faz uma lista das propriedades: o gado, e outros bens. Neemias contabiliza tudo. No final, lemos o grande total de: 49.942 pessoas. Neemias era responsável por uma cidade de cerca de cinqüenta mil pessoas. Por que Deus quis colocar na Bíblia todos esses nomes? Não são mencionados apenas aqui, mas a mesma lista aparece era Esdras 2. Esta claro que a Editora de Deus não se preocupava em contar palavras. Por que Deus quis que todos esses nomes estivessem em dois lugares da Bíblia? Parece uma perda de espaço. Eu creio que ele o fez por duas razoes: 1) No ano 586 a.C, o rei Zorobabel permitiu que

regressassem a Jerusalém o primeiro grupo de judeus levados ao

cativeiro da Babilônia. As pessoas mencionadas por Esdras e

Neemias estavam neste primeiro grupo. Depois de 70 anos,

estavam acomodados na Pérsia, ainda que não fosse sua terra.

Regressar significava para eles dar um passo de fé. Eram o povo

de Deus. Sua decisão foi difícil, mas queriam voltar para sua

terra onde poderiam adorar ao Senhor.

2) Aqueles eram os que haviam reconstruído os muros.

Seus nomes ficaram escritos para a posteridade, como

reconhecimento do que haviam feito.

Deus se lembra de todos os passos de fé que damos e os reconhece. Essas listas são como um pequeno Hall da Fama de Deus. Milhares de anos mais tarde, conhecemos os nomes dos que reconstruíram os muros. Sabemos que tiveram fé suficiente para sair da Pérsia, regressar a sua terra e tratar de reconstruir o templo. Deus lembra e reconhece todos os passos de fé que nós damos. Pareceu-lhe que aquelas pessoas eram importantes o suficiente para colocar seus nomes na Bíblia.

Eu me pergunto se meu nome estará na lista de honra de Deus. Essa e uma boa pergunta. Se Deus fizesse uma lista de pessoas que estão cumprindo sua vontade, eu estaria nela? Você estaria? Que evidencias de fé existem cm minha vida? E na sua? Deus pensa que estou fazendo o que ele quer que eu faça? O que ele pensa sobre você?

A segunda tarefa do bom administrador consiste em manter um bom registro. Procura conhecer o estado de seus rebanhos, cuida muito de suas ovelhas. Deus esta falando aos pastores, aos líderes. Precisamos conhecer nossas ovelhas. Em João, Jesus diz: "Eu sou o bom pastor; conheço as minhas ovelhas".173 Toda boa organização sabe a quem pertence. Ainda numa igreja tão grande como a de Saddleback, temos formas de manter o contato com nosso povo. Usamos bases de dados nos computa-dores, folhetos que as pessoas preenchem nas reuniões dos finais de semana, e outras ferramentas, com o objetivo de seguir os passos das pessoas que consideram que Saddleback e sua igreja. Todas as semanas recebemos centenas de pedidos de orações, comentários, citações, idéias e outras petições. Eu leio as que posso, e o resto delego a outros membros do corpo administrativo. De imediato, temos na equipe certas pessoas que começam a atender a distintas necessidades de outros. Alguns recebem uma carta e outros uma visita. Para manter-me em contato, utilizo uma ferramenta chamada 0 Resumo do Pastor, que contem resumidamente toda a informação que chegou na semana. Os pedidos de oração, depois de separados dos comentários pessoais, vão para todos os membros da equipe, e todos recebem o resumo do pastor. Esses informativos regulares nos ajudam a conhecer bem o estado de nosso rebanho. Fazemo-lo porque a Bíblia nos manda manter uma boa contabilidade de nosso rebanho. Saddleback e uma igreja muito grande, graças a Deus. Buscamos manter contato com nosso povo. Em geral, nosso sistema funciona bem. Sim, há pessoas com as quais perdemos o contato, mas estamos fazendo um esforço. A Bíblia fala do Bom Pastor, que deixou as noventa e nove ovelhas para ir em busca da que se havia perdido. Como ele soube que ela se havia perdido? Porque ele as contou. Quando o total que somou era noventa e nove, ele se deu conta de que havia perdido uma. Nós contamos, não só para saber quais as que estão, mas para saber quais as que não estão. Na igreja Saddleback temos um ditado: "Contamos as pessoas, porque as pessoas contam". Os líderes necessitam recrutar boas pessoas, delegar e estender a liderança para poder ser eficazes. O líder precisa manter um bom registro, e saber onde se encontram as pessoas em seus momentos de Provérbios 27:23 João 10.14 necessidade. Há uma terceira coisa que Neemias fez. E algo de que ninguém gosta, mas e a tarefa do líder. 3. Obtenha apoio financeiro Alguns dos chefes das famílias contribuíram para o

trabalho. O governador deu a tesouraria oito quilos de ouro, 50

bacias e 530 vestes para os sacerdotes. Alguns dos chefes das

famílias deram a tesouraria cento e sessenta quilos de ouro e mil e

trezentos e vinte quilos de prata, para a realização do trabalho. O

total dado pelo restante do povo foi de cento e sessenta quilos de

ouro, mil 174

e duzentos quilos de prata e 67 vestes para os

sacerdotes.

Alguém tinha de pedir o dinheiro necessário para que a obra de Deus seguisse adiante. Neemias começou uma campanha de arrecada9ao de fundos, a fim de conseguir o dinheiro para restaurar o templo. Observe a ordem em que foram contribuindo. Primeiramente contribuíram os líderes. Eles eram os que tinham de dar o exemplo. O governador chegou até a dizer quanto ele estava dando. Se Neemias fizesse isso hoje, diríamos que ele estava querendo aparecer, mas o certo e que estava procurando ser modelo de uma conduta piedosa, estava dando o exemplo. Ele foi o que mais deu. Foi o que mais se sacrificou. Em segundo lugar, os cabeças de família também contribuíram com seu presente. Se somarmos tudo o que se deu, chegaríamos a mais de cinco milhões de dólares em dinheiro hoje. Em terceiro lugar, todos os demais deram o que tinham. Senhor, ajuda-nos a aprender que não basta apenas

triunfar, precisamos obter o premio. Ajuda-nos a aprender a ser,

tanto catalisadores quanto consolidadores. Obrigado pelo

exemplo de Neemias. Sabemos que nem todos no mundo podem ter

habilidades em ambos os aspectos, mas te agradecemos porque

temos uma imagem, um modelo a seguir.

Queremos ser líderes que tu possas usar para mudar o

mundo. Ajuda-nos a aprender a fazer com eficácia a transição dos

papeis, recrutar pessoas capazes e responsáveis e confiar-lhes o

trabalho que nós não podemos fazer sozinhos. Ajuda-nos a

aprender a delegar tarefas.

Por ultimo, Senhor, sabemos que as pessoas são muito mais

importantes que o dinheiro, as coisas e os projetos. Ajuda-nos a

achar formas criativas para saber quem são os nossos. Ajuda-nos a

aprender a administrar a base, conhecer os membros da nossa

Neemias 7.70-72

equipe, os membros da nossa igreja e o nosso pessoal. Como os que

ajudaram a Neemias a reconstruir os muros, todos somos

importantes para ti.

Senhor, ensina-nos por meio da tua Palavra a crescer no

papel da liderança que nos deste. Faze-nos como Neemias, Senhor.

Faze-nos como tu. Pedimos-te em nome de Jesus. Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 10

Como os líderes mantêm suas vitorias

Aplicando os propósitos de Deus

Comunhão — As pessoas necessitam reconhecimento. Esta e uma das razoes pelas quais no corpo de Cristo encontramos reconhecimento e apoio entre os membros.

• Como líder, você: conhece todos em seu grupo, igreja

ou organização?

• Como você se sente ao ser cumprimentado por

alguém a quem você respeita?

• Como a pessoa que separa um tempo para você faz

você se sentir?

• O que você pode fazer para ser esse tipo de líder? O

tipo de pessoa que todos querem que as cumprimente.

Discipulado — Alguma vez você alcançou grandes vitórias espirituais, logo perdendo-as por descuido? Todo cristão, mesmo os pastores, são Suscetíveis a isso. O que não significa que você deixou de amar a Deus, mas que, temporariamente, esqueceu-se dele.

•Como você pode evitar que raízes de negligencia cresçam

em seu jardim espiritual?

•Você criou um plano regular e consistente de crescimento

espiritual de sua vida crista? Você esta seguindo esse plano?

•Faca todo o esforço possível para ter um tempo com Deus

diariamente. Apegue-se a ele. Os rituais são importantes para

alcançar consistência, mas procure sempre maneiras novas de

aproximar-se de Deus, evitando assim o estancamento espiritual.

Tenha cuidado para não perder o que você ganhou.

Ministério — Como líder, você pode estar envolvido em um grande numero de projetos valiosos; mas seu verdadeiro Ministério e com sua equipe. Deus pede que os ensine a liderar como você lidera.

•Para ver seu negocio, Ministério, igreja ou evento crescer,

você necessita investir em gente de fé. Deve transmitir-lhes o que

você conhece. Você esta fazendo isto?

•Você investira seu conhecimento, tempo e confiança

naqueles que seguem suas pegadas?

•Que outra coisa você pode fazer? Você pode oferecer

seminários, classes, tutorias? Todas essas são maneiras

duradouras de ministrar.

Evangelismo — Para alcançar as pessoas com as boas-novas de Cristo, devemos entender onde esta sua necessidade. Um exemplo de quão valiosa e essa categoria esta em Neemias 7.6-69.

•Como líder, como você pode descobrir as necessidades de

sua comunidade?

•Onde Deus quer que você encontre essas necessidades?

•Como essa descoberta pode nos ajudar?

Adoração — Quando adoramos a Deus, expressamos nossa gratidão.

• Como nosso compromisso de manter as vitórias alcançadas e uma forma de agradecer a Deus?

• Agora que você reconhece a importância desta faceta da , o que você pode fazer para honrar ao Senhor por meio de seu negocio, Ministério ou de sua vida pessoal? Mostre sua gratidão ao Senhor.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$O capítulo mostra que o livro de Neemias se divide entre a fase de construção e a fase de consolidação, e que muitas igrejas e ministérios não crescem porque o líder catalisador não aprende a se tornar consolidador que delega. Na liderança que Deus lhe confiou, você ainda está tentando fazer tudo sozinho, como Neemias no início, ou já está recrutando e entregando responsabilidades a outros? O que está impedindo você de delegar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Neemias escolheu seus líderes — como Hanani e Hananias — com base em três marcas: integridade, piedade e fidelidade comprovada, e a Bíblia adverte que quem não foi provado costuma virar uma 'bomba-relógio'. Quando você coloca alguém em posição de liderança, em qual dessas três coisas você mais presta atenção, e qual delas você tem negligenciado e precisa valorizar mais?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O texto insiste que 'o que é obtido precisa ser cuidado' — que vitórias espirituais, como peso perdido ou um idioma, se perdem pelo simples descuido, e que ervas daninhas crescem sozinhas onde não há vigilância. Que conquista, na sua vida ou na sua liderança, você corre o risco de perder agora por baixar a guarda, e que vigilância concreta precisa retomar para protegê-la?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 11 — O que é preciso para ser um grande líder  (aula ordem = 11)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 11;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 11 — O que é preciso para ser um grande líder$t$,
      11,
$conteudo$um grande líder O muro ficou pronto no vigésimo quinto dia de elul, em

cinqüenta e dois dias.

No primeiro capítulo deste livro, descobrimos a verdade acerca da lide-rança: para ser líder não é necessário ser uma pessoa carismática, efervescente e repleta de energia. O que, sim, faz falta e caráter. A vida de Neemias nos ensina oito características dos grandes líderes. Estude detidamente essas características. Revise-as continuamente. Interiorize-as em seu coração e você se convertera em um líder mais eficaz. Aprendera a ser um líder ao estilo de Neemias. 1. Compaixão Quando ouvi essas coisas, sentei-me e chorei.176Passei dias

lamentando-me, jejuando e orando ao Deus dos céus.

Neemias realmente se interessava pelas pessoas. Se não fosse assim, por que um homem que tinha uma vida tão agradável se entristeceria tanto com a informação de que havia uns muros derrubados em uma cidade situada a milhares de quilômetros dali? Neemias se importava. Porque era um homem compassivo, quando ouviu dizer como era dura a vida em Jerusalém com os muros caídos ao chão, sentiu que tinha de fazer algo para ajudar. Por acaso não é verdade que, quando as coisas vão bem para nós, e fácil esquecer que a maioria dos seres humanos do planeta esta sofrendo? Quando a vida esta boa, e fácil esquecer que a maior parte das pessoas do mundo esta passando por algum tipo de dor. A vida e dura, onde quer que vivamos. Neemias era um homem compassivo. Sabia amar, e o amor e o fundamento da liderança crista. Olhe sua reação diante das injustiças. A comida era escassa, as casas estavam hipotecadas em excesso, os juros e os impostos eram incrivelmente altos e as pessoas se viam obrigadas a vender seus filhos como escravos, simplesmente para pagar suas dividas. Neemias disse: "Quando ouvi a reclamação e essas acusações, fiquei Neemias 6:15 Neemias 1.4 furioso."177 A ira diante do pecado e uma reação produto do amor. Precisamos nos indignar diante do pecado. Precisamos ter re-volta diante de alguém que fere outro. Isto constitui uma justa indignação. E nos preocupar com o mesmo que Deus se preocupa. A ira de Neemias e evidencia de sua compaixão pelas pessoas. Em Neemias 5.17,18, lemos que ele assumiu pessoalmente o cuidado de cento e cinqüenta pessoas durante esse tempo. Era um homem compassivo. As pessoas não se importam com quanto sabemos, enquanto não sabem o quanto nos importamos. Na liderança, a base de tudo firma-se no amor. você ama as pessoas? Preocupa-se com elas? A liderança sem amor se torna simplesmente uma manipulação. 2. Meditação Os grandes líderes sabem, por instinto, que precisam equilibrar o uso do seu tempo. Precisam passar tempo com as pessoas para guiálas, e precisam passar momentos a sós com Deus. O tempo de meditação e essencial para a eficácia do líder. Neemias era um homem de oração. Aprenda com o seu exemplo. Sua vida privada de oração determina a eficácia da sua liderança pública. Neemias era um homem de oração e meditação. Orava por tudo: cada decisão que devia tomar, cada crise que tinha de enfrentar, cada critica que recebia. Sua oração do capitulo 1 e uma das grandes orações da Bíblia. Encorajo-o a estudá-la. Então eu disse: Senhor, Deus dos céus, Deus grande e

temível, fiel a aliança e misericordioso com os que te amam e

obedecem aos teus mandamentos, que os teus ouvidos estejam

atentos e os teus olhos estejam abertos para a oração que o teu

servo esta fazendo diante 178

de ti, dia e noite, em favor de teus

servos, o povo de Israel.

Neemias orava de dia e de noite. Quando fez sua cavalgada da meia-noite por Jerusalém, passou três dias no seu quarto, saindo somente a noite para inspecionar os muros. O que ele fazia durante todo esse tempo? Estava meditando, orando, inspecionando e falando com Deus. Revisava uma e outra vez na mente os acontecimentos, seus planos e as soluções que Deus lhe Neemias 5:6 Neemias 1.5,6a dava. Os grandes líderes sabem que seu tempo público deve estar equilibrado com seu tempo a sós com Deus. Quando ouvi a reclamação e essas acusações, fiquei furioso.

Fiz uma179avaliação de tudo e então repreendi os nobres e os

oficiais.

Neemias sabia colocar em funcionamento o cérebro antes de colocar sua língua em movimento. Era um homem de meditação. Esperava que Deus lhe desse a perspectiva correta: "Deus meu, o que queres que eu fale?". Alguma vez você falou sem pensar? Como líder, você precisa aprender, assim como eu tive de aprender, que e importante pensar antes de falar. Os grandes líderes meditam. Neemias diz: "Meditei sobre o que ia dizer". Antes de pregar meu sermão de fim de semana, eu passo em media dezesseis horas meditando nele. Leio, oro, repasso uma e outra vez minhas palavras. A meditação precede a ação. Uma vez feita a meditação, a apresentação e automática. A meditação semeia em nossa mente o que deve ser apresentado. Neemias era um homem compassivo e de meditação. Preocupava-se com as pessoas e orava. 3. Atitude positiva No mês de nisã do vigésimo ano do rei Artaxerxes, na hora

de servir-lhe o vinho, levei-o

ao rei. Nunca antes eu tinha estado

triste na presença dele...

Neemias tinha uma atitude positiva. Você gostaria de seguir um carrancudo? Claro que não. Ninguém gosta. Todos nós preferimos seguir um líder que tenha uma atitude positiva. Ao que parece, Neemias era uma pessoa positiva e de bom ânimo. Havia servido o rei Artaxerxes por toda sua vida, e aquela era a primeira vez que havia chegado com o rosto triste e um semelhante abatido. Sempre havia mostrado bom ânimo e otimismo. Não tinha o hábito de se queixar. Os líderes devem ser encorajadores, não desanimadores. A função do líder é em levantar as pessoas, não deixá-las cair. Por isso, o bom ânimo e uma característica importante, para o líder. Neemias 5.6,7a Neemias 2.1 Líder, você precisa se esforçar para isso! Sei que e uma notícia assombrosa, mas há entre nós alguns que, por natureza, não são pessoas de bom ânimo. Há alguns que se levantam pela manha dizendo: "Senhor, bom dia!", e outros se levantam dizendo: "Senhor, já é dia!". Ainda que você não seja por natureza uma pessoa de bom ânimo, pode se esforçar para chegar a ser. Pode desenvolver essa qualidade. Pratique o sorriso. Eu o faço toda vez que entro no meu carro para tarefas de fim de semana da igreja. E a verdade e que não tenho vontade de fazê-lo, sobretudo aos domingos pela manha. Estotou ainda meio adormecido e meio acordado, mas começo a sorrir. Ainda que você não acredite, pode conseguir ter uma boa atitude, começando por sorrir. Os médicos dizem que se produz uma verdadeira mudança bioquímica quando começamos a sorrir, por causa dos hormônios que se produzem no nosso corpo. Quando saio do carro e me dirijo ao escritório, intencionalmente estou treinado a fazer uma pausa e começar a sorrir. Percebo que no escritório cada um leva sua própria carga, e muitos levam uma carga muito pesada. Não porque eu lhes de excesso de trabalho, mas porque a vida não é fácil. Como seu líder, e importante que eu não entre com uma atitude que venha tornar a carga deles mais pesada ainda. Por isso, sorrio para mantê-los com bom ânimo. O mesmo faço quando chego a casa a noite. Quando entro pela porta, antes de girar a maçaneta, sorrio. Como líder do meu lar, eu sei que minha família não precisa dos problemas que enfrentei durante o dia. Como você pode ser um líder de bom ânimo, quando trabalha com um tipo de gente com a qual você trabalha? Como você pode ser um líder de bom ânimo quando se sente cansado e esgotado? Neemias 8.10 nos revela seu segredo: Este dia e consagrado ao nosso Senhor. Não se entristeçam, porque a alegria do Senhor os fortalecerá. Apesar de todos os inimigos que tinha, Neemias se mantinha de bom ânimo porque tinha a alegria de Deus. Alegria é diferente de felicidade. A felicidade depende do que acontece. A alegria e interna. Não se baseia nas circunstancias. Pode-se ter a alegria em meio a uma tragédia. Pode se ter alegria, estando totalmente fatigado. "A alegria do Senhor e nossa força", disse Neemias. Se você quer ser um líder como Neemias, seja compassivo, medite e tenha bom ânimo. 4. Concentração Neemias estava sempre concentrado em sua meta. Não deixava que as coisas pequenas o distraíssem. No capitulo dois, previu os problemas que o esperavam. Sabia que precisaria de madeira, de modo que a pediu. Sabia que necessitaria de proteção em sua viagem a Jerusalém, e pediu adiantado um salvo-conduto. Necessitaria de um lugar para viver, e o pediu adiantado também. Esta claro que tinha tudo bem pensado antes de sair. Havia se concentrado no que necessitava ter. Os líderes sempre pensam no futuro. Sempre vão a frente de todos os demais. Isso e o que os separa dos seus seguidores. Essa maneira de pensar, antecipar os problemas e ter já uma solução para enfrentá-los, exige concentração. E uma das características da liderança. A pronta capacidade de Neemias para concentrar-se e o que o ajudou a enfrentar as distrações que lhe proporcionaram seus inimigos. Sambalate e Gesem mandaram-me a seguinte mensagem: "Venha, vamos nos encontrar num dos povoados da planície do Ono". Eles, contudo, estavam tramando fazer-me mal; por isso enviei-lhes mensageiros com esta resposta: "Estou executando um grande projeto e não posso descer. Por que parar a obra para ir encontrar-me com vocês?" Eles me mandaram quatro 181 vezes a mesma mensagem, e todas às vezes lhes dei a mesma resposta. Neemias sabia o que estavam tramando seus inimigos, e negouse a deixar que o distraíssem. Essa e uma das características da liderança: a capacidade de focar-se no que necessita fazer, sem deixar-se distrair. Neemias não permitiu que nada atrasasse o termino do muro. O princípio da concentração e este: O principal e que o principal continue sendo o principal. Essa e outra característica da liderança. Paulo disse: "Mas uma coisa faço".182 Não disse: "Estas quarenta coisas trato de fazer ao mesmo tempo". A luz, quando esta enfocada, tem um poder imenso. Converte-se em laser. Ao contrario, a luz difusa não tem poder algum. Quanto mais focada estiver sua vida, mais eficaz você será. Se você não é capaz de concentrar-se por natureza, você pode aprender. O principal e negar-se a deixar que o distraiam. Isso e o que Neemias fez, e é uma característica dos grandes líderes: a Neemias 6.2-4 Filipenses 3.13 concentração, a capacidade para focar-se em algo. 5. Criatividade Neemias era criativo na hora de resolver problemas. há pessoas que pensam que se nascem criativas, e e verdade; no entanto, a criatividade e uma habilidade que também pode ser aprendida. Se você não se considera uma pessoa criativa, pode desenvolver essa habilidade. E simplesmente uma forma de pensar. Hoje em dia temos uma grande quantidade de livros e recursos ao nosso alcance para nos ensinar a ser pessoas mais criativas. Edward de Bono, autor de New Think e Lateral Thinking e o melhor autor no tema criatividade. Gravou também uma série chamada "Six Thinking Hats", na qual descreve as seis formas distintas do pensamento humano. Ou melhor, há dois livros excelentes, escritos por Roger Von Oech: A Whack on the Side of the Head e A Kick in the Seat of the Pants. Esse tipo de recurso pode ajudá-lo a aprender a pensar criativamente. Esses livros ajudarão você a se dar conta de que, às vezes, esta bem sair da linha quando esta colorindo. Como líder, você terá de enfrentar novos desafios. E os novos desafios exigem novas soluções quando as mesmas coisas de sempre não funcionam. Quando os que se opunham desde o exterior a reconstrução dos muros disseram: "Vamos atacá-los enquanto estão levantando os muros", Neemias idealizou uma solução criativa. Por isso posicionei alguns do povo atrás dos pontos mais baixos do muro, nos lugares 183 abertos, divididos por famílias, armados de espadas, lanças e arcos.. Dividiu-os por famílias e os colocou diante de suas próprias casas, para que edificassem a parte dos muros que estava mais próxima delas. Lembrem-se de que o Senhor e grande e temível, e lutem por seus irmãos, por seus filhos e por suas filhas, por suas mulheres e por suas casas. Quando os nossos inimigos descobriram que sabíamos de tudo e que Deus tinha frustrado a sua trama, todos n6s voltamos para o muro, cada um para o seu trabalho. Daquele dia em diante, enquanto a metade dos meus homens fazia o trabalho, a184 outra metade permanecia armada de lanças, escudos, arcos e couraças. Quando seus inimigos apresentaram novos conflitos, Neemias tomou um enfoque criativo para resolvê-los. Neemias 4.13 Neemias 4.14-16 Ele sabia que as pessoas trabalhariam com maior eficacia em seus grupos naturais; assim, organizou-os dessa forma. Alem do mais, ao trabalhar com uma unidade familiar, o natural era que se apoiassem mutuamente. Neemias estava sendo criativo. A metade deles edificava os muros, enquanto a outra metade fazia a guarda com espadas e lanças. Depois intercambiavam as responsabilidades. Neemias buscava soluções criativas para todos os problemas. Você também pode ser criativo na hora de resolver problemas, se você decidir aprender a ser um líder como Neemias. 6. Coragem Quando pensamos em tudo o que Neemias suportou enquanto perseguia suas metas, vemos nele um homem de coragem. Deixou um trabalho seguro, tranqüilo e bem pago, no melhor momento de sua carreira, para ir aonde nunca havia estado antes, e fazer algo para o que não havia sido treinado. Temos em Neemias um mordomo que diz: " Vou a um pais estranho para supervisionar um projeto de construção". Ele não tinha preparo nenhum para o que foi fazer. Aquela decisão exigiu coragem. Ele a tomou porque cria que Deus o havia chamado para a tarefa. No mês de Nisã do vigésimo ano do rei Artaxerxes, na hora

de servir-lhe o vinho, levei-o ao rei. Nunca antes eu tinha estado

triste na presença dele; por isso o rei me perguntou: "Por que o

seu rosto parece tão triste, se você não esta doente? Essa tristeza

só pode ser do coração!" Com muito medo, eu disse ao rei: Que o

rei viva para sempre! Como não estaria triste o meu rosto, se a

cidade em que estão sepultados os meus pais esta em ruínas, e as

suas portas foram destruídas pelo fogo? O rei me disse: "O que

você gostaria de pedir? Então orei ao Deus dos céus, e respondi

ao rei: Se for do agrado do rei e se o seu servo puder contar com a

sua benevolência, que ele me deixe ir a cidade onde meus 185

pais

estão enterrados, em Judá, para que eu possa reconstruí-la.

Neemias sabia que a petição que fez ao rei podia significar uma sentença de morte automática se o. rei se recusasse a aceita-lá. não é de estranhar que estivesse assustado. Quando o rei lhe perguntou por que estava triste, ele confessou em seu diário: "Com muito medo, eu disse ao rei..." Coragem e quando só você e Deus sabem que você tem medo. A coragem não é a ausência de medo, mas e seguir em frente apesar do medo. Neemias 2.1-5 Quando o inimigo veio e disse que ia atacá-lo, Neemias diz para os seus leitores: Fiz uma rápida inspeção e imediatamente disse aos nobres, aos oficiais e ao restante do povo: Não tenham medo deles. Lembrem-se de que o Senhor e grande e temível, e lutem por seus irmãos, 186 por seus filhos e por suas filhas, por suas mulheres e por suas casas. Em toda sua vida, Neemias nunca havia estado a frente de um exercito. Nunca havia lutado uma só batalha. No entanto, sim, ele tinha a coragem necessária para fazer o que Deus lhe havia dito para fazer. No capitulo 5, ele enfrentou a corrupção politica. Irou-se quando chegou ao seu conhecimento a forma tão injusta com que os ricos estavam tratando os pobres. Então, lhes enfrentou publicamente. Fiz uma avaliação de tudo e então repreendi os nobres e os

oficiais, dizendo-lhes: "vocês estão cobrando juros dos seus

compatriotas!" Por isso convoquei uma grande reunião contra eles

e disse: na medida do possível nós compramos de volta nossos

irmãos judeus que haviam sido vendidos aos outros povos. Agora

vocês estão até vendendo os seus irmãos! Assim eles terão que ser

vendidos a nós de novo! Eles ficaram em silêncio, pois não

tinham resposta. Por isso prossegui: O que vocês estão fazendo

não está certo. Vocês devem andar no temor do nosso Deus para

evitar a zombaria dos outros povos, os nossos inimigos. Eu, os

meus irmãos e os meus homens de confiança também estamos

emprestando dinheiro e trigo ao povo. Mas vamos acabar com a

cobrança de juros! Devolvam-lhes imediatamente suas terras,

suas vinhas, suas oliveiras e suas casas, e também os juros que

cobraram deles, a centésima parte do dinheiro, do trigo, do vinho

e do azeite. E eles responderam: "Nós devolveremos tudo o que

você citou, e não exigiremos mais nada deles. Vamos fazer o que

você esta pedindo". Então convoquei os sacerdotes e os fiz

declarar sob juramento que cumpririam a promessa feita.

Também sacudi a dobra do meu manto e disse: Deus assim

sacuda de sua casa e de seus bens todo aquele que não mantiver a

sua promessa. Tal homem seja sacudido e esvaziado! Toda a

assembléia disse: "Amém!", e louvou ao SENHOR. E o povo

cumpriu o que prometeu.187

Ele estava irado. Os líderes precisam ter a coragem necessária para confrontar quando vêem uma injustiça sendo cometida. O que é coragem? Na realidade, e um sinônimo de fé. Ser corajoso significa estar disposto a correr risco, disposto a dar um Neemias 4:14 Neemias 5:7-13 passo de fé. Isso foi o que Neemias fez. Se você quer caminhar sobre as águas, precisa descer do barco. Você tem de se arriscar, e, algumas vezes, isso significa que você precisara dar um primeiro passo de fé. A coragem é característica dos grandes líderes. 7. Consciência limpa Neemias era um homem íntegro. Sabia lidar muito bem com o sucesso. A maioria de nós lida melhor com os fracassos que com os sucessos, de modo que podemos aprender muito se estudamos seu exemplo.

Mas os governadores anteriores, aqueles que me precederam, puseram um peso sobre o povo e tomavam dele quatrocentos e oitenta gramas de prata, alem de comida e vinho. Até os seus auxiliares oprimiam o povo. Mas, por temer a Deus, não agi dessa maneira.188

Neemias havia sido nomeado governador daquela região por Artaxerxes, o rei da Pérsia, o homem mais poderoso de seu tempo. Isso o convertia no homem mais poderoso de toda a Judéia. Durante os doze anos que ocupou aquele cargo, pode fazer o que quisesse. Ele poderia ter feito como muitos ditadores modernos, e juntar uma considerável fortuna pessoal. Ele era o homem mais poderoso daquelas terras, não tinha de informar a ninguém, não tinha de prestar contas diante de ninguém. Ao contrario, decidiu rejeitar a tentação das riquezas, em favor da compaixão para com o povo. Neemias era um homem íntegro. Porque se negou a beneficiarse da sua posição, porque foi generoso com os pobres e ajudou a acabar com as injustiças, Neemias era um homem com a consciência limpa. Quando alguém triunfa, há três coisas que acompanham o sucesso: o poder, o prestigio e os privilégios. E é fácil sentir-se tentado a abusar destas três coisas. Neemias resistiu diante destas tentações por reverencia a Deus. Era um líder com uma consciência limpa. 8. Convicções

Os grandes líderes têm fortes convicções. Podem até discutir por opiniões, mas as convicções são algo pelo que estão dispostos a morrer. Neemias era um homem com convicções. Cria que Deus o havia chamado a realizar aquele trabalho, e não havia nada que o pudesse deter. Nada do que intentavam seus inimigos pode impedir

Neemias 5:15 que os muros fossem levantados. Provaram com zombarias, com desânimo, medo, discórdia, divisões, distrações, difamação, e até ameaça. No entanto, não conseguiram tirar de Neemias as suas profundas convicções. * Ele baseava suas convicções nestas quatro coisas: 1) um motivo que o impulsionava; 2) uma perspectiva clara; 3) oração contínua; 4) intrépida perseverança.

Neemias seguiu adiante, apesar de tudo. Ainda que ele e Paulo nunca tenham se conhecido, ambos compreendiam a mesma coisa:

E não nos cansemos de fazer 189

o bem, pois no tempo próprio colheremos, se não desanimarmos. Pat, a viagem tem sido emocionante enquanto percorremos com Neemias a rota da liderança. Ele nos ensinou muito acerca deste tema; lições que podemos aplicar na prática como líderes de nossa igreja, nossa casa ou nosso trabalho. Todos nós somas chamados para ser líderes em diferentes momentos. Pedimos-te que possamos compreender que o fundamento da liderança e o caráter, não o carisma, nem os estudos ou os talentos, mas o caráter. Queres incorporar essas qualidades a nossa vida? Peço-te por todas as pessoas que leiam este livro, para que lhes dês oportunidades de fortalecer seus aspectos débeis e aproximaremse cada dia mais do que tu queres que sejam. Pedimos-te em nome de Jesus. Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 11I

O que e preciso para ser um grande líder Aplicando os propósitos de Deus Comunhão — Um dos propósitos do corpo de Cristo e levantar outros.

• Há alguém em seu grupo de crescimento ou célula ou

em sua comunidade crista que precise de uma palavra de ânimo?

• Se Deus está revelando seu nome, quem deve se

oferecer para dar a palavra?

• Pode ser que Deus o esteja chamando?

Gálatas 6:9

Discipulado — Aprendemos a ser como Jesus ao passarmos tempo com ele. Isso e discipulado: querer ser como Jesus. Ele nos ensina a caminhai r a obedecer.

• A habilidade de observar nos faz discípulos de Cristo.

• Neemias sabia como concentrar-se, porque sabia

observar. Ele passava longas horas em oração, buscando as

respostas corretas. Que características de Neemias você pode

aplicar para local se melhor?

Ministério — Se Deus o chamou para ser líder, seu ministério está com as pessoas que você lidera. Elas sabem que você as ama? A liderança sem amor não é outra coisa senão manipulação. O mundo está cheio de exemplos desta verdade.

•Qual é o próximo passo a tomar para mostrar seu amor pelas

pessoas?

• Quanto você deseja ser um líder como Neemias?

Vós sois a luz do mundo. Não se pode esconder uma cidade construída sobre um monte. (Mateus 5:14) Evangelismo — Jesus nos chama para sermos luz do mundo (Mateus 5.14); assim e como ganharemos outros para o Reino de Cristo. A luz com foco tem poder. A luz que se dispersa perde poder. A luz difusa não tem nenhum poder.

• Que tipo de luz você e?

• Como você pode desenvolver a habilidade de focar sua luz

nos que necessitam de você?

Adoração — Neemias reconheceu a importância de identificar quem e Deus. Quando adoramos a Deus, estamos reconhecendo seu caráter. Uma e outra vez vemos como Neemias identifica a Deus como: grandioso, maravilhoso, poderoso e cheio de graça.

• Como a forma como você vê a Deus afeta sua liderança?

• O que você pode fazer nos momentos de sossego para

melhorar sua relação com Deus? Ele quer desenvolver seu caráter

em você. Você esta cooperando com ele para que isso aconteça?

• Se você quer ser um líder usado por Deus, deve refletir seu

caráter. Conheça-o primeiro, e o resto virá por acréscimo.

• Qual será a próxima coisa que você fara como resultado da

sua liderança? Anote isso e coloque a data. Peca a um companheiro que o apóie em seu compromisso, inspecionando o progresso de seu projeto. Os céus e a terra passarão, mas as minhas palavras jamais passarão.190 Mateus 24.35, Marcos 13.31, Lucas 21.33$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Este capítulo resume as oito marcas do grande líder e afirma que o fundamento da liderança é o caráter, não o carisma, os estudos ou os talentos. Das oito qualidades de Neemias — compaixão, meditação, atitude positiva, concentração, criatividade, coragem, consciência limpa e convicções — qual é hoje a mais frágil em você, e que passo prático você dará esta semana para começar a desenvolvê-la?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O texto diz que 'a liderança sem amor se torna simplesmente manipulação' e que as pessoas não se importam com quanto você sabe enquanto não souberem o quanto você se importa — Neemias chorou, jejuou e cuidou pessoalmente de cento e cinquenta pessoas. As pessoas que você lidera sabem, sem dúvida, que você as ama? Qual é o próximo passo concreto para que esse amor fique visível para elas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sobre a atitude positiva, o autor confessa que treina a si mesmo a sorrir ao chegar ao escritório e ao entrar em casa, para não tornar mais pesada a carga de quem já carrega muito — porque 'a alegria do Senhor é a nossa força'. Que atmosfera você costuma trazer para as pessoas que lidera: você as levanta ou as deixa cair? O que precisa mudar na sua atitude diária para ser um encorajador, mesmo cansado?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Epílogo — Como Neemias liderou ao estilo de Jesus, o Líder dos líderes  (aula ordem = 12)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 12;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Epílogo — Como Neemias liderou ao estilo de Jesus, o Líder dos líderes$t$,
      12,
$conteudo$Espero que, enquanto você lê este livro, esteja pensando nas qualidades de caráter que Deus quer desenvolver em sua vida. você está disposto a ser outro Neemias, comprometido em fazer tudo o que Deus pedir, para mudar as coisas ao seu redor? Pense em tudo o que você leu a respeito de Neemias, e faca a si mesmo estas perguntas: 1. Quais destas qualidades de caráter são as mais fortes em sua vida?

• compaixão

• meditação

• atitude positiva

• concentração

• criatividade

• coragem

• integridade

• convicções

2. Quais destas qualidades de caráter são as mais frágeis

em você?

3. Quais destas qualidades de caráter você gostaria de

desenvolver mais? E difícil trabalhar em algo que nós não

identificamos com clareza.

4. O que você pode fazer para praticar essa qualidade?

Há algum projeto em que você esta trabalhando, ou que vai

iniciar, no qual você tem a oportunidade de manifestar a

qualidade que quer obter em sua vida? Obrigue-se, se for

necessário, a fazer uma aplicação prática. Se você não o fizer de

forma consciente, e possível que não aconteça, e seria uma

vergonha você não permitir o desenvolvimento dos propósitos de

Deus para sua vida como um líder.

A razão pela qual Neemias e um exemplo tão maravilhoso para nós hoje, e, simplesmente, ele ter sabido ser um líder ao estilo de Jesus. Ainda que tenha vivido antes dos tempos de Cristo, e ainda que nunca tivesse conhecido o apostolo Paulo, Neemias entendia que a fé, a esperança e o amor são os ingredientes secretos de um líder eficaz. Meu objetivo ao apresentar-lhe este livro e que você se prepare para que essas metas deixem de ser secretas. Espalhe a noticia. Aprender a ser um líder ao estilo de Neemias e a base para aprender a ser um líder ao estilo de Jesus. seja um exemplo que outros possam seguir. Juntos podemos fazer parte do grande plano de Deus para o Reino dos céus. Podemos mudar as coisas na eternidade. Alem das características do Tipo Um e do Tipo Dois encontra-se o chamado mais alto para a liderança espiritual.

Quero terminar este livro, apresentando as sete responsabilidades de um líder espiritual. Estude-as e aplique-as na pratica. Se você o fizer, aprendera a ser um líder ao estilo de Neemias. Quando você decidir deixar de seguir outros e começar a ser líder, estará motivado pela fé em Deus, a esperança do céu e o amor aos outros, e aprendera a ser líder ao estilo de Jesus. Veja o que ele fazia:

1. Ajudava-os a conhecer a Deus

Sua primeira responsabilidade como líder cristão e ajudar os demais a conhecerem a Deus. O que esta em jogo e a eternidade: vida ou morte, céu ou inferno.

Eu revelei teu nome aqueles que do mundo me deste. 191 Eles

eram teus, tu os deste a mim e eles tem obedecido a tua palavra.

A vida toda e um empréstimo feito por Deus. Ele nos criou a todos e a cada um de nós. Como líder, as responsabilidades que Deus deu a você tem a ver, na realidade, com a mordomia. Você precisa dizer a Deus: "Sou o administrador do que tu colocaste sob meu cuidado". Observe o que Jesus nos diz: “Eu revelei teu nome aqueles que do mundo me deste”. O que ele fez foi revelá-lo. Jesus guiava por meio do exemplo. Veja agora um pensamento profundo que deveria nos assustar – como líderes, quer seja na igreja, no mundo dos negócios ou na família —: o que outros pensam sobre Deus vai fundamentar em maior medida o que pensam sobre você. Se você e impaciente e exigente, fará com que Deus pareça também impaciente e exigente. Se você e distante e desapegado, fará com que Deus tenha esse aspecto. Neste mundo são muitas as pessoas João 17.6 que nunca tiveram uma boa relação com seu pai terreno. Talvez uma delas seja você. Agora, porem, você foi socorrido por Deus, que e o Pai perfeito. Como você quer que os outros o vejam? Certifique-se que seja isso o que vêem em você. Os cristãos têm uma responsabilidade com os que não conhecem Cristo. Você tem certeza de que todos os que você lidera são crentes? Deus lhe esta dando a oportunidade de ser um canal, o mensageiro, o exemplo que eles observam para ver como ele é. Se as pessoas são atraídas pelas qualidades que vêem em você, e mais provável que se sintam atraídas a Deus. Você vera que o nascimento espiritual sempre precede o crescimento espiritual. E antes de poder crescer espiritualmente, a pessoa tem de conhecer a Deus pessoalmente. Aqui estamos pensando em função de céu e inferno. Estamos tratando de questões eternas. 2. Ensinava-lhes a Palavra de Deus Pois eu lhes transmiti as palavras que me deste, e eles as aceitaram. Eles reconheceram de fato que vim de ti e creram que me enviaste.192 A Palavra de Deus e nosso fundamento. E sobre ela que edificamos nossa vida. E solida. E nosso manual. E nosso livro texto. Jesus disse: "E conhecerão a verdade, e a verdade os libertará."193 Deus quer que todos sejamos livres. Não quer ninguém escravizado pelo pecado, culpa, angustia ou ressentimento. Não quer que as expectativas dos demais nos pressionem. Só uma vida edificada sobre a Palavra de Deus pode conhecer a liberdade genuína. Como líder, o que você pode fazer para ensinar os outros a se apoiarem na Palavra de Deus como a única autoridade sobre suas vidas? Antes de poder ensinar, você precisa conhecer a Palavra de Deus. E para muitos, isso significa começar a estudá-la a fundo. 3. Orava por eles Rogo por 194 eles. Não rogo pelo mundo, mas pelos que me deste, porque são teus. Jesus orava pelas pessoas que liderava. Para que você faca algo significativo como líder espiritual, Deus quer que faca o mesmo.

João 17.8

João 8:32

João 17:9

Orar sobre o que? Ore sobre os cinco propósitos de Deus. Esses cinco propósitos divinos são os mesmos para todos. Jesus menciona todos. De fato, orou por estes cinco propósitos com respeito aos seus liderados Em primeiro lugar, orou a fim de que vivessem com gozo para ele. Agora vou para ti, mas digo estas coisas enquanto ainda estou no mundo, para que eles tenham a plenitude da minha alegria. Adorar e desfrutar de Deus. Quando você aprender a viver com alegria para Cristo, estará levando uma vida de adoração. Não rogo que os tires do mundo, mas que os protejas do Maligno.196 De que maneira se cresce espiritualmente? Não crescemos quando as coisas são cômodas, fáceis e convenientes. De fato, quando as coisas vão muito bem na vida, e provável que não estejamos crescendo. Crescemos em meio a provas, tribulações, problemas e até tentações. Sempre se trata da oportunidade de tomar a decisão correta. Crescemos por meio dos problemas, pressões, estresse e situações que causam problemas. Por essa razão e que quando Jesus ora para que cresçam, não esta orando para que Deus faca a vida deles fácil. Santifica-os na verdade, a tua palavra e a verdade.197 Outras versões da Bíblia dizem: "Prepara-os para servir-te por meio da verdade. Teus ensinos são verdadeiros". O líder espiritual ora para que seu povo sirva a Cristo com eficácia, viva para Cristo com alegria e cresça espiritualmente pra servi-lo melhor. Minha oração não é apenas por eles. Rogo também por aqueles que crerão em mim, por meio da mensagem deles, para que todos sejam um, Pai, como tu estas em mim e eu em ti. Que 198 eles também estejam em nós, para que o mundo creia que tu me enviaste. O líder espiritual ora para que os demais experimentem pessoalmente a comunhão com Deus. Lembre-se de que essa vida e uma preparação para a eternidade. Uma das coisas que vamos fazer no céu e amar uns aos outros. Isso se chama comunhão. E a maior tarefa que podemos aprovar na vida terrena e aprender a nos amar de verdade. O mundo vai ser ganho quando o povo de Deus se unir. Ore

João 17:13

João 17:13

João 17:17

João 17:20-21 por aqueles de quem você e líder. Peca a Deus que os traga a sua família.

Jesus orou para que os discípulos o levassem continuamente a outros. Diz o versículo 20: "Minha oração não é apenas por eles. Rogo também por aqueles que crerão em mim, por meio da mensagem deles". Ele esperava que nós nos reproduzíssemos. Então, ore para que aqueles a quem você orienta-se convertam em evangelistas para Cristo. 4. Infundia-lhe seu caráter. Dei-lhes a gloria que me deste, para que eles sejam um, assim como nós somos um. O que e a gloria de Deus? É o Seu caráter, a sua natureza. E o que Deus é. É o Seu próprio ser. Quando Jesus diz: "Eu lhes dei a gloria que me deste", esta dizendo: "Eu estou colocando neles o meu caráter, minhas qualidades". Na sua qualidade de líder cristão, sua vida esta em constante exibição diante daqueles que você guia. A meta da vida e crescer no caráter e semelhança de Jesus Cristo. Isso significa desenvolver em nós suas qualidades: integridade, generosidade, humildade. Significa cumprir sua Palavra e servir aos outros, e fazer tudo com confiança, perseverança e paciência. Todas estas qualidades encontram-se na vida do nosso Senhor. Nossa meta e integrá-las em nossa vida e na daqueles que nos consideram seus líderes. 5. Protegia seu crescimento espiritual Enquanto estava com eles, eu os protegi e os guardei no nome que me deste. Nenhum deles se perdeu, a não ser aquele 200 que estava destinado a perdição, para que se cumprisse a Escritura. O sinal do líder espiritual e a proteção. Ele guarda os seus liderados. Ele protege o crescimento espiritual daqueles que estão debaixo de seu cuidado. ... pastoreiem o rebanho de Deus, que esta aos seus cuidados. Olhem por ele, não por obrigação, mas de livre vontade, como Deus quer. Não façam isso por ganância, mas com o desejo de servir. Não hajam como dominadores dos que lhes foram confiados, mas como João 17:22 João 17:12 exemplos para o rebanho.''201 6. Enviava-os para servirem a Deus Assim como me enviaste ao mundo, eu os enviei ao mundo.202 Uma paráfrase da Bíblia diz: "Da mesma maneira que tu me deste uma missão para cumprir no mundo, agora eu lhes dou uma missão no mundo." A meta do líder é trabalhar para ficar sem trabalho. Como líderes cristãos, estamos preparando e orientando continuamente a próxima geração de líderes. Certifique-se de os estar preparando para que sejam enviados, mas não os administrando integralmente nem controlando todos os seus movimentos. 7. Foi modelo de compromisso Em favor deles eu203me santifico, para que também eles sejam santificados pela verdade. Ninguém pode levá-lo, espiritualmente, alem do nível em que você esta. O que os outros podem ver em você a respeito da sua consagração? Com o que você quer que eles o vejam comprometido? Eu sugiro que você se comprometa com os cinco propósitos de Deus para sua vida. Comprometa-se a conhecê-lo e amá-lo (adoração). Comprometa-se a aprender a amar os outros em comunhão (companheirismo). Comprometa-se a desenvolver um caráter semelhante ao de Cristo (discipulado). Comprometa-se a ser um servo na vida e não só um aproveitador (Ministério). Disponha-se a servir aos outros de forma desinteressada. Comprometa-se a compartilhar as boas-novas (evangelismo). Quando você se comprometer com os propósitos de Deus para sua vida, os outros verão esse seu compromisso. A atração de um coração completamente entregue a Deus e irresistível. Dê-se conta de que seu papel de líder e apenas temporário. Não vai durar para sempre e, por isso, você tem de aproveitar ao máximo agora. Nunca e tarde demais para começar a ser um líder ao estilo de Neemias. Qualquer que seja a situação atual na sua vida, você pode também ser um líder ao estilo de Jesus.

Pai, te dou graças porque não nos deixaste órfãos, nem abandonados neste mundo, mas nos deste exemplos de carne e osso para

1Pe 5:2-3

João 17:18

João 17:19 seguir, como Neemias e Jesus.

Dê-nos um coração que palpite no mesmo ritmo que o teu, Senhor, quando nos tornarmos líderes capazes de mudar as coisas na vida. Desafia-nos, dia apos dia, e lembra-nos todos os dias que o importante e:

•Ajudar os outros a chegarem a conhecer-te.

• Ensinar tua Palavra.

•Orar pelos que tu puseste debaixo de nossa liderança.

•Edificar teu caráter em nós mesmos e nos outros.

•Proteger o crescimento espiritual de meus discípulos.

•Enviá-los para que cumpram teus propósitos.

•E ser modelo de um compromisso semelhante ao teu.

Senhor, peço-te que as lições deste livro, unidas ao poder da tua Palavra e a presença do Espírito Santo em nossa vida, nos convertam em líderes como Neemias, líderes como Jesus... líderes que ganhem os corações e mentes para o céu. Em nome de Jesus te pedimos. Amém.

GUIA PARA APLICAÇÃO DO PRINCÍPIO 12

Epílogo: como Neemias liderou ao estilo de Jesus, o líder dos líderes

Aplicando os propósitos de Deus

Comunidade — Quando nos tornamos cristãos, a Bíblia diz que somos membros do corpo de Cristo. O amor e uma ação, não um sentimento. O que você esta fazendo hoje para demonstrar seu amor pelos outros membros da família de Deus?

• Como você esta moldando um amor como o de Cristo por

outros cristãos por meio de sua vida, como um exemplo para os

outros?

Discipulado — Um discípulo reflete os ensinos do mestre. Como cristãos, devemos seguir o modelo de Cristo, aprendendo com ele.

• O que você esta fazendo para assegurar constância,

crescimento pessoal constante em seu caráter para ser como

Cristo?

• Há algum compromisso para o qual Deus o esta chamando

e que você tenha deixado de lado? Por que não pede que o revele,

para que você saiba qual é? Lembre-se: se você esta insatisfeito

em qualquer área de sua igreja ou organização, este pode ser

justa-mente o lugar para que Deus o está chamando para liderar.

Ministério — Como membros da família de Deus, somos chamados para servir uns aos outros, assim como fazemos como membros de nossa casa.

• Onde você esta servindo no corpo de Cristo?

• Se Deus revelou uma área de serviço enquanto você está

lendo este livro, o que você vai fazer a esse respeito?

• Como você pode estar seguro de que não esta perdendo oportunidades de servir ao seu redor?

Por eles me santifico a mim mesmo, para que eles também sejam santificados na verdade.

Evangelismo — Nenhuma ferramenta e melhor para ganhar almas e corações para o Reino de Deus do que outra pessoa que alcança outros com seu coração e alma.

• Que diferença Deus tem feito em sua vida?

• Como você esta compartilhando esta mensagem com

outros?

• Às vezes, estar ao redor de pessoas que parecem casos

perdidos pode ser desalentador. Pense, no entanto, em sua vida

anterior, antes de Cristo entrar nela. Você da essa imagem de

esperança renovada aos outros? Seja como Neemias, não se

renda! A quem você pode alcançar com a sua historia de

esperança?

Adoração — Enquanto adoramos a Deus, nos tornamos mais como ele. Recorde que sua gloria e seu caráter, de modo que, enquanto nos aproximamos mais dele, enquanto nos aprofundamos no seu rosto, não podemos deixar de refletir seu caráter.

• Sua vida e um reflexo do Deus que você conhece?

• O que você aprendeu a respeito de adoração neste livro,

que não tenha aprendido antes? Que diferença está fazendo esta lição na sua vida?

• Como Neemias adorava a Deus? Como suas ações

refletiam um coração de adorador? Na sua vida, que evidencia há dessa adoracão?

O que você fará a seguir como resultado de ter lido este livro? Escreva isso e date o que você escreveu. Conte para um amigo

João 17:19, AEC confiável e peca-lhe que guarde seu compromisso, revisando diariamente seu progresso. "O céu e a terra passarão, mas as minhas palavras não passarão"205 Mateus 24.35, Marcos 13.31, Lucas 21.33$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$O epílogo apresenta as sete responsabilidades do líder espiritual ao estilo de Jesus, começando por 'ajudá-los a conhecer a Deus', e adverte que aquilo que as pessoas pensam sobre Deus se baseará, em grande parte, no que elas veem em você — se você é impaciente e exigente, fará Deus parecer assim. Que imagem de Deus a sua maneira de liderar tem transmitido às pessoas ao seu redor, e o que precisa mudar para que elas vejam em você o Pai perfeito?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Jesus orava pelos que liderava segundo os cinco propósitos — adoração, comunhão, discipulado, ministério e evangelismo — pedindo que vivessem com alegria, crescessem nas provas e se reproduzissem em outros. Você tem o hábito de orar nominalmente pelas pessoas que Deus colocou sob sua liderança? Como seria começar a interceder por elas tendo esses cinco propósitos como guia?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O epílogo afirma que 'a meta do líder é trabalhar para ficar sem trabalho' — Jesus enviou os seus, preparou a próxima geração e foi modelo de compromisso, sem controlar todos os movimentos dos discípulos. Você está formando pessoas para serem enviadas e assumirem a liderança, ou tem segurado tudo para si? O que precisa entregar para que o que Deus começou em você continue sem depender de você?$p$, 'reflexao', null);
  end if;

end $migration$;
