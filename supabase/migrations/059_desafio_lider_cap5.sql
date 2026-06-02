-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 5 — Como o líder deve influenciar a igreja (aula ordem = 5)
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
  -- Capítulo 5 — Como o líder deve influenciar a igreja
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 5;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 5 — Como o líder deve influenciar a igreja',
      5,
$conteudo$Pressupondo que Deus já revelou ao líder seu chamado, isto é, uma visão do futuro preferível rumo ao qual Deus quer que ele conduza seu povo, e pressupondo que o líder está centrado em Deus, agora é hora de influenciar a igreja.

O ministério da liderança é basicamente um movimento cíclico de dar e receber influência. Neste movimento, a autoridade interior (isto é, o caráter e as habilidades de liderança) é a base para exercer influência (1Tm 4.12; 3.1-8; Tt 1.5-9), ao passo que a autoridade externa (recebida por delegação) dá ao líder uma plataforma para o exercício da influência.

Bons líderes costumam acreditar em si mesmos e na capacidade que têm de liderar. Eles creem que, se as pessoas os seguem como um todo, logo se beneficiarão de sua liderança e alcançarão seus objetivos.

Muitas pessoas com boas intenções, no entanto, não conseguem liderar positivamente um grupo em particular. Por que isso acontece? Por que as pessoas que deveriam estar se beneficiando de sua liderança não se prontificam a segui-las? A resposta é bem simples: elas não as seguem porque não são obrigadas a fazê-lo! Liderança é a arte de influenciar outros. A capacidade de influenciar não é algo automático, mas sim um processo que se desenvolve com o decorrer do tempo e que envolve a observação, por parte da congregação, da vida, atitudes, reações e resultados produzidos pelo líder em exercício.

A influência de um líder sobre uma comunidade obedece a quatro estágios:

MODELAGEM

Este é o estágio de entrada do líder na igreja ou no ministério. As pessoas são influenciadas inicialmente pelo que veem no líder. Esse é um estágio muito delicado, no qual o líder está sendo observado e frequentemente comparado com outros líderes, em uma espécie de avaliação comparativa não declarada.

Não importa o que digamos para os liderados fazerem, a inclinação deles é a de imitarem o que estão vendo. Para a maioria das pessoas, se elas percebem que o líder é positivo, digno de confiança e com boas qualidades, elas o procuram como um influenciador em suas vidas. E, quanto mais conhecem o líder, maior será a capacidade de influência dele, se os liderados gostarem do que veem. Esse processo, no entanto, leva tempo.

Uma das experiências mais duras que tive no meu ministério foi quando, após seis meses como pastor de uma igreja, um presbítero me disse: "Pastor, se o senhor não quiser ficar nesta igreja, pode ir embora. A igreja já teve muitos pastores antes do senhor e terá muitos depois". Eu me senti muito mal com aquelas palavras. A sensação que senti foi a de ser um produto descartável, sem valor, diminuído e humilhado.

Alguns dias depois daquela reunião, viajei para continuar os meus estudos de doutorado. Curiosamente, um dos blocos de estudo do curso cobria exatamente as tensões presentes em todo começo do ministério em uma nova igreja. O professor fez uma afirmação que nunca mais esqueci: "Você não será pastor da sua igreja enquanto, pelo menos, metade dos seus membros não tiver sido influenciada por você em momentos críticos da vida deles". Segundo ele, enquanto isso não acontecer, a pessoa estará pastor, mas não será pastor daquela igreja. O parâmetro comparativo dos membros da congregação será sempre o líder que os abençoou em momentos cruciais de sua vida.

Após ouvir aquilo, eu percebi que aquele irmão da igreja onde eu estava começando a nova fase do meu ministério tinha um pastor que não era eu. O seu pastor havia sido um grande homem de Deus, que havia pastoreado aquela igreja por muitos anos, tendo-o levado a Cristo, batizado-o, casado-o, e batizado e feito a profissão de fé dos seus filhos. Aquele líder do passado, mesmo não encontrando-se mais naquela igreja, continuava sendo o seu modelo de ministério, o seu verdadeiro pastor. Isso deve servir de encorajamento e desafio para os líderes nesta fase inicial: encorajamento para um envolvimento sempre crescente com as pessoas debaixo de sua responsabilidade e desafio a comprometer-se com o grupo por um longo tempo.

MOTIVAÇÃO

Se as pessoas gostarem do que veem no líder, certamente se sentirão motivadas a andar a segunda milha com ele.

As duas colunas centrais da motivação são o encorajamento e o reconhecimento dos dons e resultados dos liderados por parte do líder. Praticar o encorajamento é, sem dúvida, um grande desafio para o líder. Jesus foi um grande encorajador. Ele, embora tenha exortado as pessoas, sempre que necessário, nunca deixou também de afirmá-las. Exemplos desta prática no ministério do nosso Senhor são abundantes. Em João 8.11, na passagem da mulher pega em flagrante adultério, Jesus inundou o coração dela com ânimo, deixando claro que a vida dela continuaria, mas em um patamar diferente: "Agora vá e abandone sua vida de pecado".

A viúva de Naim, que, tendo perdido seu marido e seu filho, era vista com desconfiança pela sociedade da época, foi outra bem-aventurada a receber encorajamento da parte do Senhor. Pedro, sem sombra de dúvidas, é outro caso claro desse mesmo princípio, ao ser encorajado a continuar adiante e a pastorear o rebanho divino, mesmo após ter cometido a falha terrível da negação do Senhor.

Muitas pessoas tentam manipular outras criticando-as ou tentando usar o poder da posição que ocupam. Ao reagir a tentativas assim, as pessoas se colocam em posição defensiva, com atitudes combativas, ou até mesmo se isolando. Foi o grande reformador João Knox quem disse que "Você não pode antagonizar e influenciar ao mesmo tempo".

De igual maneira, se o líder se preocupa com cada indivíduo como pessoa, as pessoas responderão positivamente ao seu ministério. Quanto mais demonstrar sua preocupação e interesse com o bem-estar dos seus liderados, mais duradoura será a sua influência.

As pessoas percebem o que o líder sente em relação a elas. Elas sabem a diferença entre os líderes que as usam para se autopromover e aqueles que as querem ver progredir. Elas se motivarão em resposta aos líderes que as motivam. Esse é o segredo dessa fase. Os líderes que andam a segunda milha com os seus liderados produzirão seguidores que andarão outras milhas com eles.

Talvez seja interessante para o leitor que esteja vivendo nessa segunda fase fazer um teste para medir as reações dos liderados durante a próxima reunião que tiverem. A ideia é o líder preparar uma lista das coisas boas que possa falar sobre as pessoas que estarão presentes e compartilhar com elas esses pontos positivos, reafirmando aquilo que elas têm feito de bom.

Tal postura inicial indicará claramente três importantes pontos:

• Que essa pessoa é importante para o grupo;
• Que ela está contribuindo para o sucesso da equipe de trabalho;
• Que suas contribuições são valorizadas por todos.

Quem não se sente motivado quando é reconhecido por aquilo que está fazendo? Além do mais, essa atitude está de acordo com a Bíblia, que diz que devemos honrar quem merece honra (Rm 13.7). Portanto, a motivação passa pelo encorajamento, que, então, torna a pessoa mais aberta e disposta a melhorar cada vez mais o seu desempenho.

Um outro importante ingrediente dessa fase é a habilidade de comunicar-se com os seguidores em um nível que toque as suas realidades diárias. Talvez possamos chamar isso de comunicação ao nível emocional das pessoas.

E por que o líder deve se preocupar com a comunicação a nível emocional? Por duas razões básicas. Em primeiro lugar, porque ela cria uma ponte natural de comunicação entre o líder e o povo. Os liderados sentem que estão sendo ouvidos e ajudados. Isso tem o potencial de gerar grandes resultados no grupo. Em segundo lugar, ela aumenta a confiança e o sentido de autovalorização dos membros do grupo, pois passam a sentir que Deus preocupa-se com eles, com seus sonhos, necessidades e angústias. Deus é Pai. Ele está conosco e se preocupa com o aprimoramento da nossa vida.

Esse estilo de comunicação que se centraliza no outro não acontece acidentalmente. Ele é resultado de muito trabalho, experiência e treinamento. Em um certo sentido, ele é um privilégio reservado para aqueles que têm aprendido a arte da boa comunicação e têm vencido os temores e a inércia que os mantinham bloqueados em suas conversas com amigos, vizinhos e qualquer outra pessoa que os queira ouvir.

Viggo Sogaard, professor do Fuller Theological Seminary e especialista em comunicação, em seu excelente livro sobre técnicas de pesquisa e medição para missões, fala sobre as quatro perguntas da boa comunicação, essenciais para uma abordagem contextualizada e uma motivação crescente dos liderados:

Quem é o meu ouvinte?

A resposta a essa pergunta permitirá que o comunicador conheça melhor a sua audiência, bem como facilitará a sua abordagem, direcionando-a ao seu público-alvo. Ao fazer essa pergunta, o comunicador iniciará o seu estudo de uma maneira sábia e própria. Ao encontrar a resposta, estará no caminho certo para aprofundar suas perguntas e descobrir maneiras de abençoar a sua audiência a nível emocional, ao nível de suas óbvias necessidades.

Quais as necessidades do meu ouvinte?

Uma vez determinada a audiência, o líder deve buscar descobrir as necessidades básicas dos seus ouvintes. Isso implica em estudo e pesquisa para que o líder possa chegar a uma resposta para esta questão. Por volta de trezentos anos atrás, Blaise Pascal escreveu as seguintes notas sobre a arte de comunicar com eloquência e relevância: "Eloquência é a arte de dizer as coisas de tal maneira que 1. os ouvintes ouvem a mensagem sem dor e com prazer e 2. se sentem interessados, e o seu amor-próprio os leva a desejar refletir sobre o que estão ouvindo". Pascal adiciona: "Isto indica que temos estudado bem o coração do homem para conhecer todos os seus poderes, e, então, descobrir o equilíbrio certo no discurso que desejamos adaptar para ele". Neste sentido, discernimento nada mais é do que o processo de descobrir as principais necessidades de uma determinada audiência. Isso envolve a capacidade de ouvir as reações das pessoas, bem como de analisá-las à luz do que acabou de ser dito.

Entenda que esse processo de "ouvir" envolve palavras, linguagem corporal, ou mesmo o silêncio. Ao discernir o sentido das reações do ouvinte, o líder será capaz de falar sabiamente. Como é que ele sabe o que dizer na sequência da conversa? Como é que ele pode focalizar a sua fala para as necessidades do seu ouvinte? A resposta é simples: ouvindo com discernimento para descobrir as necessidades reais do ouvinte. Deus coloca grande ênfase no ouvir com discernimento. Provérbios 29.20 declara: "Tens visto um homem precipitado nas suas palavras? Maior esperança há para o insensato do que para ele". Provérbios 17.27-28 diz: "Quem retém as palavras possui o conhecimento, e o sereno de espírito é homem de inteligência. Até o estulto, quando se cala, é tido por sábio, e o que cerra os lábios, por sábio".

Onde está o meu ouvinte em termos do conhecimento do assunto a ser abordado?

Esta pergunta simples objetiva evitar que se perca a habilidade de dizer o que se quer dizer, por usar conceitos e ideias que estão além da capacidade do ouvinte entender e apoiar.

Todos nós temos uma escala mental de aceitação-rejeição, que é construída sobre o fundamento do que já sabemos, do nosso entendimento em termos de vida, cultura, nível de instrução, teologia, vocabulário e cosmovisão. Por não prestar atenção a esse importante aspecto, muitas vezes o líder comunica uma grande verdade que, embora esteja correta, por encontrar-se fora da capacidade do ouvinte de compreendê-la, resulta em uma grande resistência em aceitá-la e aliena a audiência.

Na realidade, a lógica da rejeição baseia-se no fato de que uma pessoa, em geral, não aceita aquilo que não compreende. Ao procurar responder à pergunta sobre onde se encontra o seu ouvinte em termos do assunto a ser abordado, o líder visa diminuir o nível de resistência e ampliar o nível de receptividade de seus ouvintes.

Como eu posso ajudar o meu ouvinte a superar suas limitações e suprir suas necessidades?

Se o líder fizer este esforço, buscando formas de ajudar as pessoas a superarem suas limitações e suprirem suas necessidades, o Deus que ele pregar se tornará o Deus do dia a dia da vida das pessoas que lidera. O mais importante não são as convicções doutrinárias do líder, mas sim como ele se comunica, de uma forma que fale à sua audiência, levando-a a se entusiasmar com a possibilidade do progresso, bem como a se aproximar mais e a conhecer melhor a Deus. Quando esses fatores existem, a devoção e a motivação do grupo crescem. A grande arte da comunicação cristã bem-sucedida baseia-se na transposição dos conceitos metafísicos, distantes e complicados, para a realidade pessoal do indivíduo.

Em síntese, a motivação se desenvolve por meio do encorajamento e da comunicação a nível emocional, a qual centraliza-se no processo de discernir e responder às necessidades sentidas pelas pessoas.

MENTORIA

John Maxwell, referência na área de liderança, faz este comentário a respeito da necessidade da mentoria: "Dar ao povo a motivação para crescer sem também provê-lo com os meios para que isto aconteça é uma tragédia muito grande". A mentoria provê os meios necessários para um crescimento contínuo saudável.

O conceito de mentoria, que também pode ser denominado tutoria, basicamente falando, é o derramar da vida de uma pessoa na vida de outra, auxiliando-a em seu processo de desenvolvimento nas várias áreas de sua vida e ministério.

O objetivo da mentoria não consiste apenas na transmissão daquilo que o mentor sabe, mas também no relacionamento pessoal que é desenvolvido entre o mentor e o mentoreado. É por meio da construção de um relacionamento profundo que o mentor cria as oportunidades e conquista a confiança das pessoas para influenciar a sua vida.

A grande beleza da mentoria é que o mentor vê a mudança acontecendo in loco na vida do mentoreado. Não há outro sistema no qual a pessoa possa observar tão de perto a mudança. A mentoria é baseada em relacionamentos, tarefas, respostas e responsabilidades. Ela exige o estabelecimento de determinados deveres que requeiram uma correspondência da parte do mentoreado. A pessoa só pode ser propriamente mentoreada por alguém se reagir positivamente às tarefas que lhe vão sendo dadas. Quando o líder alcança este nível de influência, as vidas dos liderados estão abertas à sua ministração e as possibilidades de um crescimento exponencial são muito maiores do que nas fases anteriores.

MULTIPLICAÇÃO

Esta é a fase em que o líder ensina seus seguidores a serem multiplicadores, treinando-os até o ponto em que eles passam a ser influenciadores positivos. O líder não apenas os modela, por meio de seu exemplo e ensino, mas agora eles são também copiadores do seu exemplo, reproduzindo-o em uma escala muito mais ampla. Para chegar à fase de multiplicação, são necessários três passos:

Limitar o escopo

Cristo sabia ter um tempo limitado para completar a tarefa que o Pai lhe incumbira de fazer, chegando a esta fase da multiplicação. O apóstolo Pedro, em 1Pe 1.17, chama este tempo limitado que todo líder tem para realizar o seu ministério de tempo de peregrinação. Nos parâmetros desta limitação, o líder precisa agir com sabedoria para maximizá-lo ao limite do seu potencial. Só alcançará o estágio de ver o povo se multiplicando a pessoa que entende que não tem tempo a perder. O preguiçoso nunca vai conseguir cumprir sua carreira. O apóstolo Paulo, em Colossenses 1.29, diz que, para que pudesse apresentar aperfeiçoadas diante de Deus aquelas pessoas que ele havia colocado em suas mãos, chegou à exaustão. Contudo, ao final da sua vida, ele foi capaz de dizer: "completei a carreira".

Cristo sabia que precisava limitar seu foco. Quando enviou os doze apóstolos, ele lhes disse para que não fossem rumo aos gentios, nem entrassem em cidades de samaritanos, mas que buscassem as ovelhas perdidas da casa de Israel. A messianidade de Cristo não havia sido ainda exposta na cruz. O seu foco ainda se encontrava limitado às ovelhas perdidas da casa de Israel. O foco limitado fundamenta-se no reconhecimento de que não podemos, individualmente, alcançar o mundo inteiro. Consequentemente, a pessoa precisa discernir o núcleo central de seu ministério e concentrar ali a maior parte do seu tempo e esforço. É inútil querer "atirar em todas as direções". Os que assim fazem não acertam nada. O exemplo de Jesus é claro neste aspecto, pois mostra que até mesmo ele, em sua encarnação, pelo menos até a sua morte na cruz, limitou o foco de seu ministério a um grupo em particular: as ovelhas perdidas da casa de Israel.

Cristo também sabia que precisava ter um assunto limitado. Embora pudesse falar sobre o que bem quisesse, o foco de sua mensagem sempre foi o reino de Deus. De alguma forma, aquilo que o líder cristão fala deve sempre direcionar o povo para o ponto onde ele quer que o povo chegue, para a sua visão. Visão é o futuro preferível que o líder tem para o seu povo. Jesus teve oportunidade de conversar sobre diversos assuntos, mas a sua visão, o seu assunto central, foi sempre o reino de Deus. Tudo o que ele falava contribuía, de algum modo, para conduzir as pessoas a pensarem sobre este assunto. Em uma certa ocasião, algumas pessoas lhe fizeram uma pergunta se era lícito para os judeus pagarem tributo a Roma. Ao responder-lhes, usando a ajuda visual de uma moeda com a efígie de César, Jesus deixou claro que não cairia na armadilha de perder o seu ministério alterando o foco e os limites de sua mensagem. Deus e seu reino continuariam sendo o seu tema central. "Dai, pois, a César o que é de César e a Deus o que é de Deus" (Mt 22.21).

Por fim, Cristo sabia que precisava se concentrar no treinamento de um número limitado de pessoas. Embora tivesse a multidão inteira em seu coração e pregasse para todos, o seu foco principal era treinar os doze discípulos. Em Mateus 5.1, o texto apresenta Jesus cercado por uma multidão. Ao ver o grupo grande de pessoas ao seu redor, o texto bíblico diz, curiosamente, que Jesus começou a falar aos seus discípulos, em particular. A multidão estava ali e ele amava a todos, mas demonstrou que o treinamento daqueles que falariam por ele após sua partida era absolutamente central em seu ministério.

Preocupar-se com a qualidade e deixar que Deus se encarregue da quantidade

Em toda a sua vida e ministério, pelo menos nos relatos bíblicos, Jesus nunca empreendeu grandes viagens, limitando-se a um raio de mais ou menos duzentos quilômetros de Nazaré, sua cidade. No entanto, indivíduos em todos os países do mundo o conhecem e seguem. Cristo preocupou-se com a profundidade do treinamento e o Pai encarregou-se da expansão, da multiplicação. O líder sempre vai falar para todos, porém o seu foco deve estar em selecionar e treinar alguns em profundidade, para serem os seus sucessores.

Dedicar atenção individual às pessoas-chave

Podemos observar na Bíblia diversas ocasiões nas quais Jesus dedicou o seu tempo para conversar individualmente com alguns dos apóstolos. Ele fez isso com Pedro, João e Tiago, por exemplo. Tal prática indica a necessidade da personalização, da atenção individual que o líder precisa dedicar às pessoas que estiver treinando. A pessoa que chega ao nível da multiplicação pode ser um modelo para as massas, mas, para que possa chegar ao mais alto estágio de influência, ela terá que trabalhar com indivíduos-chave em particular.

O esboço do livro de John Maxwell Como tornar-se uma pessoa de influência explicita bem este princípio quando diz que: Uma pessoa de influência é íntegra para com as pessoas. Uma pessoa de influência nutre outras pessoas. Uma pessoa de influência acredita nas pessoas. Uma pessoa de influência ouve as pessoas. Uma pessoa de influência entende as pessoas. Uma pessoa de influência valoriza as pessoas. Uma pessoa de influência se conecta com as pessoas. Uma pessoa de influência dá competência às pessoas — isto representa capacitação e autoridade. Uma pessoa de influência gera outros influenciadores.

Em seguida, o líder precisa ter uma visão clara e objetiva de onde quer chegar, porque seu povo nunca vai mais longe do que a capacidade que ele tem de viajar. Portanto, a visão do líder é essencial para inspirar o povo, pois projeta para os liderados um esboço do quadro final do destino de sua viagem. "Um visionário é alguém que ajuda o povo a ver o que eles provavelmente não conseguiriam ver por si mesmos."

Líderes compartilham uma peregrinação com as pessoas que os seguem, peregrinação que os leva a um futuro preferível. A maioria das pessoas precisa ser despertada da letargia na qual se encontra imersa, para que possa ser alçada a um patamar até então impensável. Portanto, a visão da liderança deve conviver com um sentido de urgência se, de fato, quiser que o povo se mova de um estado de complacência para um de engajamento, em uma missão que exigirá de cada seguidor um comprometimento total.

É preciso saber quais são suas habilidades pessoais e quais são os recursos disponíveis em seu grupo. Este aspecto do conhecimento é absolutamente imprescindível para o cumprimento da visão. Portanto, é fundamental que o líder avalie o que tem em suas mãos, em termos de suas próprias habilidades, e os recursos pessoais dos que trabalham com ele. Quais os recursos humanos, financeiros, materiais e de tempo de que dispõem o líder e seu grupo?

É preciso ter conhecimento e discernimento, sabendo para quem e o que se vai ministrar. Esta habilidade permite ao líder delimitar e manter o seu foco de atuação.

Por fim, é preciso saber medir os resultados alcançados. Quais são as perguntas que o líder deve fazer a si mesmo, para que possa fazer uma avaliação e ter um retorno daquilo que está sendo desenvolvido? O que ele está ministrando está integrando a comunidade em direção ao alvo do grupo? A maneira como o líder ensina o povo é contextualizada para as necessidades da igreja e encaixa-se dentro das expectativas de seu povo? O ministério do líder é encarnado, como o de Cristo, que se envolveu com seu povo a ponto de se tornar um deles?

Uma forma de fazer isso é criar estruturas de facilitação para que o povo possa alcançar os objetivos de Deus. Essas estruturas têm que ser contextualizadas e encarnadas na prática e entendimento de vida dos liderados, para que não sejam estranhas à comunidade.

• Estruturas de facilitação aceitáveis ao povo — Os ministérios que serão criados, o tipo de treinamento, tudo o que for planejado para facilitar o cumprimento da visão deve ser entendido e aceito pelo povo.
• Recursos acessíveis ao povo — Quanto aos recursos a serem investidos, quer sejam de natureza financeira, humana, estrutural ou de tempo, é importante salientar que os mesmos devem ser acessíveis ao povo, caso contrário o projeto fracassará, frustrando o líder.
• Projeto significativo para o povo — Os projetos e iniciativas criados para agilizar o desenvolvimento do processo de consumação dos propósitos divinos para um grupo em particular devem representar algo muito importante e significativo para o povo, para que as pessoas se sintam motivadas.
• Alvos desafiadores e acessíveis ao povo — O desafio é outro aspecto que também deve estar presente. O alvo tem que ser desafiador, mas não estar fora do alcance do povo. Ele deve levar em consideração pesquisas e estudos feitos, buscar um equilíbrio entre realidade e otimismo, e ser mensurável, facilitando assim a avaliação dos resultados alcançados.
• Avaliação — De um modo geral, esta é a parte mais difícil e a menos utilizada. Normalmente, não nos perguntamos o porquê do planejamento ter funcionado ou não. Os elementos envolvidos na avaliação incluem a visão, missão, planejamento, alvos e metas, método e orçamento. Perguntas positivas e negativas devem ser feitas a cada uma delas. Deve-se também perguntar o motivo de eventuais sucessos ou fracassos e o que pode ser feito para mudar ou melhorar. Qualquer empresa bem-sucedida cria o seu próprio processo de avaliação. Se o líder quer alcançar os objetivos de Deus para o seu povo, não pode fugir deste processo de planejar, criar as estruturas e avaliá-las constantemente.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Influenciando a Igreja com Eficácia
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Reflita sobre o impacto da sua liderança na igreja até agora. Quais são os maiores aprendizados que você teve ao influenciar sua congregação ou equipe?',
     'reflexao', null),
    (v_aula_id, 2,
     'Faça uma lista de três ações que você pode tomar para aumentar sua capacidade de influência positiva.',
     'reflexao', null),
    (v_aula_id, 3,
     'Identifique os membros-chave que você pode começar a preparar para a próxima fase de liderança. Quem em sua equipe ou congregação tem potencial para ser um influenciador positivo no futuro?',
     'reflexao', null);
  end if;
end
$migration$;
