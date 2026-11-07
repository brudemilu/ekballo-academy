-- 378_perspectivas_artigos_licao11.sql
-- Os quatro artigos de plataforma da Lição 11. Com eles a lição fica completa:
-- os sete capítulos do livro já estavam no ar desde setembro.
--
-- Eles NÃO entram em bloco. O guia os intercala entre as leituras do livro, e é
-- essa a ordem aqui: Garrison e Cole abrem a lição, antes do Patterson; o
-- Schwartz vem depois do Chua Wee Hian; e o Smalley entra entre o McGavran do
-- cap. 43 e o Travis. Por isso a migration desloca a ordem em três etapas, e não
-- numa só.
--
-- PROCEDÊNCIA: quatro links do Dropbox com download desabilitado, lidos do
-- stream do visualizador. Todos têm camada de texto (Arial), sem OCR.
-- Auditoria por conjunto de caracteres: o Smalley fecha em DIFERENÇA ZERO e os
-- outros três perdem só os dígitos dos números de página, retirados de
-- propósito. Nenhum artigo perdeu texto.
--
-- PALAVRAS COLADAS: 66 consertos, conferidos um a um. Duas armadilhas desta
-- leva, que valem para a próxima:
--   · Uma correção pode comer a outra. "serfeita -> ser feita" rodou antes de
--     "serfeitas" e já a resolveu; o mesmo com "Estudare" dentro de
--     "Estudaresses". O relatório acusou as duas como "não encontradas", mas o
--     texto estava certo — conferir antes de concluir que falhou.
--   · Duas formas ambíguas ("plantara", "separare") existem como mais-que-
--     perfeito e como colagem. O contexto decidiu: eram "plantar a poderosa
--     presença" e "se separar e se afastar".
--
-- TÍTULO DIVERGENTE: o guia chama o artigo do Cole de "Igrejas orgânicas"; o
-- documento se intitula "Igreja Orgânica". Vale o documento, como já valeu para
-- o Ekström, o L. Mak e o capítulo 118.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 107;
  update aulas set ordem = ordem - 10000 + 2 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Garrison: Movimentos de plantação de igrejas', 'Movimentos de plantação de igrejas

David Garrison

"Olhem para as nações, observem e fiquem totalmente maravilhados, pois vou fazer algo em seus dias que vocês não acreditariam, mesmo que lhes fosse dito".

Habacuque 1.5

Há vários anos, esse versículo ganhou vida de uma forma que eu nunca antes tinha imaginado. Era a época do ano em que os missionários enviavam seus relatórios anuais para a sede da agência. Os missionários são pessoas ocupadas e dificilmente se entusiasmam para separar tempo suficiente para fazer o relatório, dizendo quantos novos crentes foram batizados, quantas novas igrejas foram iniciadas ou quantos grupos de pessoas não alcançadas eles apresentaram ao evangelho. Todos os anos, esses relatórios geralmente mostram um crescimento modesto em cada uma dessas áreas-chave.

Mas este ano foi diferente. David e Jan Watson, servindo na Índia, fizeram uma afirmação incrível. Seu relatório listou quase cem cidades, vilas e aldeias com novas igrejas e milhares de novos crentes.

A sede não conseguia acreditar. "Isso não pode ser verdade", disseram eles. "Ou você entendeu mal a pergunta ou não está nos dizendo a verdade.

As palavras foram dolorosas, mas Davi manteve a língua firme.

Mais tarde naquele ano, uma equipe de pesquisa liderada pelo supervisorde Watson chegou à Índia para investigar. Eles visitaram Lucknow, Patna, Delhi, Varanasi e várias cidades e vilarejos listados no relatório de David. Mais tarde, o supervisor comentou: "Eu fui com muitas dúvidas, mas estávamos errados. Em todos os lugares que visitamos, era exatamente como Watson havia relatado. Deus estava fazendo algo incrível lá".

Incrível... difícil de acreditar. Essas são as próprias palavras de Habacuque. Elas adquiriram uma nova e surpreendente relevância. "Olhem para as nações, observem e fiquem totalmente maravilhados, pois vou fazer algo em seus dias que vocês não acreditariam, mesmo que lhes fosse dito.

Relatos surpreendentes de movimentos

Um ano depois, outro relatório do Sudeste Asiático descreveu uma erupção semelhante de novas igrejas. No ano seguinte, missionários servindo na América Latina testemunharam o mesmo tipo de multiplicação espontânea de centenas de novas igrejas. Mais dois relatórios semelhantes chegaram da China. Começamosa nos referir a esses fenômenos surpreendentes como movimentos de plantação de igrejas.

E os relatórios não pararam de chegar. Como prometeu, Deus está fazendo algo extraordinário em nossos dias. À medida que Ele atrai um mundo perdido para Si, os movimentos de plantação de igrejas parecem ser uma grande parte de como Ele está fazendo isso.

No Leste Asiático, um missionário relatou: "Lancei meu plano de três anos em novembro de 2000. Minha visão era ver200 novas igrejas iniciadas entre meu grupo de pessoas nos próximos três anos. Mas, quatro meses depois, já havíamos atingido essa meta. Depois de apenas seis meses, já tínhamos visto 360 igrejas plantadas e mais de 10.000 novos crentes batizados! Agora estou pedindo a Deus que amplie minha visão.

Os cristãos chineses do condado de Qing''an, na província de Heilongjiang, plantaram 236 novas igrejas em um único mês. Em 2002, um movimento de plantação de igrejas na China trouxe cerca de 15.000 novas igrejas e batizou 160.000 novos crentes em um único ano.

Durante a década de 1990, os cristãos em um país latino-americano superaram a perseguição implacável do governo para crescer de 235 igrejas para mais de 4.000 igrejas com mais de 30.000 convertidos aguardando o batismo. Um pastor da Europa Ocidental escreveu: "No ano passado, minhaesposaeeu começamos 15 novas igrejas domésticas. Quando partimos para uma missão de seis meses nos Estados Unidos, ficamos imaginando o que encontraríamos quando voltássemos. É uma loucura! Podemos verificar pelo menos 30 igrejas agora, mas acredito que pode ser duas ou até três vezes mais."

Após séculos de hostilidade ao cristianismo, muitos muçulmanos da Ásia Central estão agora abraçando o evangelho. No Cazaquistão, na última década, mais de 13.000 cazaques se converteram à fé, adorando em mais de 300 novas igrejas cazaques.

Um missionário na África relatou: "Levamos 30 anos para plantar quatro igrejas neste país. Iniciamos 65 novas igrejas nos últimos nove meses.

No coração da Índia, no estado de Madhya Pradesh, um movimento de plantação de igrejas produziu 4.000 novas igrejas em menos de sete anos. Em outra parte da Índia, o povo Kui de Orissa iniciou quase 1.000 novas igrejas durante a década de 1990. Em 1999, eles batizaram mais de 8.000 novos crentes. Em 2001, eles estavam iniciando uma nova igreja a cada 24 horas.

Na Mongólia Exterior, um movimento de plantação de igrejas teve mais de 10.000 novos seguidores. Outro movimento na Mongólia Interiorcontou com mais de 50.000 novos fiéis - tudo isso durante a década de 1990.

Nas últimas duas décadas, muitos milhões de novos crentes entraram no Reino de Cristo por meio de movimentos de plantação de igrejas. Nós os vimos em todas as partes do mundo.

O que são os movimentos de plantação de igrejas?

Uma definição concisa de movimentos de plantação de igrejas é uma multiplicação rápida de igrejas nativas plantando igrejas que se espalham por um grupo de povo ou um segmento populacional.

A definição acima tenta descrever o que está acontecendo nos movimentos de plantação de igrejas, em vez de tentar prescrever o que poderia ou deveria acontecer. Depois de estudar vários desses movimentos, chegamos a identificar quatro características comuns a todos: multiplicação rápida, plantação de igrejas, nativa e acontece dentro de um grupo de povo ou algo equivalente.

1. Multiplica-se rapidamente

Um movimento de plantação de igrejas se multiplica rapidamente. Em pouco tempo, as igrejas recém-plantadas já estão iniciando novas igrejas. A próxima geração de igrejas geralmente segue o mesmo padrão de reprodução rápida.

"Quão rápido é rápido?", alguém pode perguntar. Talvez a melhor resposta seja: "mais rápido do que a maioria imagina ser possível". Embora a taxa varie de um lugar para outro, os movimentos de plantação de igrejas sempre superam a taxa de crescimento populacional à medida que correm para alcançar todo o grupo de pessoas.

Os movimentos de plantação de igrejas não se limitam a acrescentar novas igrejas. Em vez disso, eles se multiplicam. Pesquisas sobre movimentos de plantação de igrejas indicam que praticamente todas as igrejas estão engajadas em iniciar várias novas igrejas. Talvez seja por isso que os movimentos de plantação de igrejas raramente têm como objetivo iniciar um punhado de igrejas adicionais em uma determinada área. Em vez disso, essas igrejas estão satisfeitas com nada menos do que uma visão de alcançar todo o seu grupo de pessoas ou cidade.

2. Nativo

Um movimento de plantação de igrejas é nativo, autóctone. Nativoaponta para algo gerado de dentro para fora, em vez de iniciado por pessoas de fora. Nos movimentos de plantação de igrejas, a primeira ou as primeiras igrejas podem ser iniciadas por pessoas de fora, mas muito rapidamente o ímpeto passa das pessoas de fora para as de dentro. Consequentemente, em pouco tempo, os novos crentes que vêm a Cristo em movimentos de plantação de igrejas podem nem mesmo saber que um estrangeiro esteve envolvido no trabalho. Aos olhos deles, o movimento parece, age e se sente como se fosse local.

3. Igrejas que plantam igrejas

Os movimentos de plantação de igrejas são caracterizados por igrejas que plantam igrejas. Embora os plantadores de igrejas normalmente iniciem as primeiras igrejas, em algum momento as próprias igrejas entram em ação. Quando as igrejas continuam a plantar novas igrejas, que, por sua vez, plantam ainda mais igrejas, algo muda no caráter do movimento incipiente. A igreja-mãe não controla mais o que acontece em meio às igrejas bisnetas. Quando as novas igrejas começam a se multiplicar exponencialmente, chega-se a um certo ponto crítico. Alguns compararam esse momento crítico a um "ponto de inflexão", ou à queda de dominós, ou ao rompimento de uma represa que libera rios em cascata como movimentos fluidos.

Todo movimento genuíno de plantação de igrejas é, em algum aspecto, um movimento fora de controle, que se compraz em multiplicar a vida de igreja em igreja em igreja. Muitos movimentos de plantação de igrejas quase falham nesse ponto crítico, pois os plantadores de igrejas lutam para controlaras igrejas que se reproduzem. Mas quando o ímpeto das igrejas que se reproduzem supera a capacidade dos plantadores de controlá-lo, um movimento está em andamento.

4. Dentro de grupos de pessoas

Por fim, os movimentos de plantação de igrejas ocorrem dentro de grupos de pessoas ou segmentos populacionais inter-relacionados. Como os movimentos de plantação de igrejas envolvem a comunicação da mensagem do evangelho, eles ocorrem naturalmente dentro de fronteiras étnicas e de idiomas compartilhados. Entretanto, eles raramente param por aí. À medida que o evangelho opera seu poder transformador na vida desses novos crentes, eles levam a mensagem de esperança a outros grupos de pessoas.

A obra de Deus e o papel vital dos cristãos

Nos movimentos de plantação de igrejas, o papel do missionário ou da pessoa de fora é mais pesado no início. Quando o grupo de pessoas começa a responder, é de vital importância que as pessoas de fora se tornem cada vez menos dominantes, enquanto os próprios novos crentes se tornam os principais colhedores e líderes do movimento.

Os praticantes do movimento de plantação de igrejas têm sido rápidos em dar a glória do movimento a Deus, tanto que, de fato, alguns descreveram os movimentos como sendo puramente um ato de Deus. "Não poderíamos impedi-lo nem que quiséssemos", comentou um colega. Sua humildade era admirável, mas enganosa. Reduzir um movimento de plantação de igrejas a um milagre puramente divino tem o efeito de descartaro papel da responsabilidade humana. Se somente Deus está produzindo movimentos de plantação de igrejas, então somente Deus é o culpado quando não há movimentos de plantação de igrejas.

A verdade é que Deus deu aos cristãos papéis vitais a serem desempenhados no sucesso ou no fracasso desses movimentos. Nos últimos anos, aprendemos que há muitas maneiras de obstruire até mesmo pararos movimentos de plantação de igrejas. Em muitos casos, atividades bem-intencionadas que estão fora de sintonia com os caminhos de Deus serviram para retardarou até mesmo matar um movimento. Os movimentos de plantação de igrejas são milagrosos na forma como transformam vidas, mas também são bastante vulneráveis à interferência humana.

É por isso que devemos nos tornar estudantes das formas como Deus está agindo nesses movimentos. Precisamos aprender como Deus está usando plantadores de igrejas, missionários, pessoas de dentro e de fora para realizar esses movimentos.

Devemos também aprender quais fatores podem retardar, paralisar ou até mesmo impedir a multiplicação da igreja. Estudar esses fatores não indica uma falta de fé no senhorio de Deus sobre a história da salvação. Estudar e buscar ativamente movimentos de plantação de igrejas demonstra que realmente acreditamos na comissão de Cristo de "Ide e fazei discípulos de todas as nações".

Como disse um missionário com muita propriedade: "Conhecemos o desfecho da história. Sabemos que Deus será glorificado entre todas as nações. Mas como isso acontecerá? Esse é o desconhecido; esse é o mistério; essa é a aventura". ___________________________________ David Garrison atuou como vice-presidente associado de estratégia global da Junta de Missões Internacionais dos Batistas do Sul por cinco anos. Seu trabalho com missões globais o levou a mais de 80 nações, e ele lecionou no Southwestern Baptist Seminary, no Fuller Theological Seminary e na Hong Kong Baptist University. Seus livros incluem The Nonresidential Missionary [O missionário não residente], Something New Under the Sun [Algo novo debaixo do Sol] e Church Planting Movements [Movimentos de plantação de igrejas].

Este artigo vem de Church Planting Movements: How God is Redeeming a Lost World [Como Deus está redimindo um mundo perdido], 2004. Usado com permissão.', 107 from cursos where slug = 'perspectivas';

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Cole: Igreja orgânica', 'Igreja Orgânica

Niel Cole

Pense nas perguntas que já lhe fizeram sobre sua igreja. A que igreja você vai? Qual é o tamanho de sua igreja? Onde fica sua igreja? Que tipo de música você tem em sua igreja? Qual é a denominação de sua igreja? Quem é o pastor de sua igreja? Acho que muitas vezes perguntamos sobre coisas que podem parecer importantes, mas geralmente não estamos chegando ao que é mais importante. Essas são perguntas sobre igrejas. Mas o que é uma igreja?

Depois de tentar plantar igrejas por algum tempo, cheguei a um ponto em que fiz ao Senhor uma das perguntas mais perigosas que já fiz: "Ok, Senhor, afinal, o que é uma igreja?" Essa foi uma pergunta perigosa porque me forçou a admitir que eu estava tentando cultivar algo sem saber o que era.

Nossa visão da Igreja: Limitada por nossa experiência

Para ajudar a encontrar a melhor resposta, procurei meus colegas e líderes, perguntando-lhes com toda a sinceridade: "O que é igreja?" Quando fiza pergunta, no entanto, isso fez com que outros refletissem e percebessem que talvez também não soubessem realmente o que é igreja. Todos nós sabemos quais são nossas tradições. Falamos como se obviamente soubéssemos a resposta para essa pergunta. Mas, na realidade, descobrimos que muitos de nós não pararam para fazer a pergunta. Em vez de começarmos com a pergunta sobre o que é a igreja, estávamos nos perguntando como tornar as igrejas maiores ou melhores ou como começar mais delas.

A tentação é definir "igreja" de acordo com nossa própria experiência. Achamos que sabemos algo por causa da familiaridade. Ao definirmos "igreja" dessa forma, temos a certeza de que estamos sempre certos, mas essa é uma solução barata que perpetua todos os nossos problemas atuais. É muito mais importante olhar para as escrituras com honestidade e coragem ao tentarmos definir "igreja". Quando fizermos a pergunta, no entanto, devemos estar prontos para esperar o inesperado. Quando era estudante de seminário. Recebi uma definição de igreja que, na verdade, era mais uma descrição. A igreja foi explicada como incorporando estas cinco características:

1. Um grupo de crentes reunidos regularmente...

2. que se considera uma igreja...

3. que tenha anciãos qualificados presentes...

4. que pratica regularmente as ordenanças do batismo e da comunhão, bem como a disciplina da igreja...

5. e que tenha um conjunto comum de crenças doutrinárias e propósito evangelístico.

Todas essas são boas qualidades que qualquer igreja deve ter. A maioria de nossas igrejas, de fato, atenderia a esses padrões. Mas minha pergunta ainda estava comigo, então a virei do avesso e perguntei o que estava faltando nessa lista de cinco características. Desde aquela época. Apresentei a mesma lista e perguntei a muitos grupos. "O que está faltando?" Depois de alguns minutos de respostas, eu lhes digo o que acho que está faltando, caso ainda não tenham encontrado: "Está faltando Jesus!"

Um de meus respeitados mentores, um teólogo e missionário de carreira, disse-me que as pessoas pressupõem que Jesus esteja na definição porque são os crentes que estão reunidos. Minha resposta foi: "Porque você precisa verificar se os presbíteros presentes estão qualificados (ponto 3), mas presumiria que Jesus está presente?"

Essa suposição revela um problema sério em nossas igrejas. A igreja tem mais a ver com as pessoas e as instituições que se reúnem em nome de Jesus do que com a realidade de Jesus ressuscitado, vivo e ativo com Seu povo.

Olhos em Jesus

Quando o mundo olha para nossas igrejas, especialmente no Ocidente, ele vê apenas o que as pessoas fizeram ou quais programas estão fazendo. E o mundo não fica impressionado. Em resposta, planejamos, planejamos e planejamos. "O que podemos fazer para tornar nossa igreja mais atraente para as pessoas de nossa comunidade?" Essa é, mais uma vez, a pergunta errada. É como se estivéssemos tentando aumentar o índice de aprovação de Deus. É o nome de

Deus que está em risco, não o nosso, e não somos responsáveis por proteger Sua reputação. Ele pode cuidar muito bem disso sozinho.

Uma pergunta melhor é: "Onde Jesus é visto trabalhando em nosso meio?" Onde vemos vidas mudando e comunidades se transformando simplesmente pelo poder do evangelho? Onde vemos pais restaurados a uma vida de santidade e responsabilidade? Onde vemos as filhas se reconciliando com os pais? Onde vemos viciados que não vivem mais sob a escravidão da dependência química? Onde estão os homens de negócios ricos fazendo restituição porcrimes passados que passaram despercebidos? Essas são as perguntas que levam as pessoas a reconhecer a presença viva de Jesus, amando e governando a vida das pessoas como seu Rei. Quando as pessoas encontram Jesus, vivo e presente como Rei, elas têm um gostinho do Reino de Deus na Terra, assim como é no céu.

Se Jesus estiver ausente em nossa compreensão da igreja. Ele provavelmente também estará ausente em nossa expressão da igreja.

O que é uma igreja: seguidora de Jesus

Passei a entender a igreja da seguinte forma: a presença de Jesus entre Seu povo, chamado como uma família espiritual para cumprir Sua missão neste planeta.

É verdade que isso é bastante amplo, mas gosto de uma definição ampla de igreja. As Escrituras não dão uma definição precisa, portanto, não vou fazer o que Deus não fez. Quero algo que capte o que as Escrituras dizem sobre o Reino de Deus. Em um dos dois únicos lugares em que Jesus menciona a igreja nos Evangelhos, Ele diz: "Porque onde estiverem dois ou três reunidos em meu nome, aí estou eu no meio deles" (Mt 18:20). Sua presença deve ser um elemento importante da igreja.

Para uma igreja que perdeu de vista seu verdadeiro amor, Jesus diz essas palavras duras:

Aquele que anda entre os candelabros diz o seguinte: "Lembre-se de onde você caiu, arrependa-se e pratique as obras que praticou no início; caso contrário, virei a você e removerei o seu candelabro do lugar, a menos que você se arrependa" (Apocalipse 2:1,5).

Para uma igreja desobediente e insalubre. Jesus ameaça removero candelabro (que representa a igreja) da presença de Jesus. A presença de Jesus é crucial para o que é a igreja. Sua presença é vida; Sua ausência é morte. Ele é a parte mais essencial de quem somos e do que fazemos. Ele deve ser a coisa mais importante sobre nós e o aspecto mais reconhecível que o mundo vê.

Em muitas das igrejas do Ocidente, o ministério é feito para Jesus, mas não por Jesus - e aí reside uma grande diferença. Se avaliássemos nossas igrejas não pela frequência ou pelos prédios, mas pelo quanto Jesus é reconhecido em nosso meio, nossa influência seria mais abrangente e nossas estratégias seriam muito mais dinâmicas. Infelizmente, é possível fazer todas as coisas que compõem as cinco qualidades das igrejas tradicionais, mas não conseguir demonstrar nada da pessoa ou da obra de Cristo em uma vizinhança. Mas se começarmos toda a nossa compreensão de igreja com a presença de Cristo entre nós e trabalhando conosco, então esperaremos ver muito mais.

Igreja Orgânica

Passamos a nos referir a alguns dos ideais dos movimentos de plantação de igrejas como uma "igreja orgânica". Com o termo "orgânica", não quero dizer que ela seja livre de pesticidas. É uma questão de as igrejas estarem vivas e vibrantes como organismos vivos.

A realidade central não é como os seguidores são organizados, discipulados ou ajudados. A realidade central é Jesus Cristo sendo seguido, amado e obedecido. O Cristo vivo, formando famílias espirituais e trabalhando com elas para cumprir Sua missão. Esta é a realidade viva da igreja orgânica. A igreja é realmente uma encarnação de Jesus ressuscitado. Não é de se admirarque a Bíblia se refira à igreja como o Corpo de Cristo.

Cristo em primeiro lugar

Mike Frost e Alan Hirsch desafiaram a maneira como organizamos nosso pensamento sobre Jesus e a igreja. Normalmente, pensamos na igreja como algo a ser mobilizado para que as pessoas venham a Jesus. Em vez disso, Jesus lidera as pessoas na missão, que, por sua vez, geram igrejas frutíferas. Frost e Hirsch mostram a sequência correta para nosso pensamento, começando com Cristo. Eles dizem que uma cristologia clara informará nossa melhor missiologia, que, por sua vez, leva à eclesiologia mais frutífera possível.

Cristo vem primeiro. Ele então nos comanda em Sua missão. O subproduto de nossa má missão é a expansão de Seu reino na Terra por meio da edificação de Sua igreja. Percebi que devemos nos concentrar em plantar Jesus e deixar que Jesus construa Sua igreja e trabalhe por meio de Sua igreja. Nossa ordem é conectar as pessoas a Jesus como seu Rei. Devemos estender o reinado de Cristo na Terra. O subproduto desse trabalho é a igreja.

Igrejas orgânicas se reproduzem

Acho que estamos confundindo o fruto com a semente. Devemos plantar a semente do evangelho do Reino e os frutos que crescerão serão vidas transformadas vivendo sua fé juntas. É exatamente isso que queremos dizer com "igreja".

O verdadeiro fruto de uma macieira não é uma maçã, mas mais macieiras. Dentro do fruto encontra-se a semente da próxima geração de macieiras. Todos nós carregamos dentro de nós a semente das futuras gerações da igreja. Devemos pegar essa semente e plantá-la no solo de cada grupo de povos sob a autoridade de nosso Rei.

Cristo em nós é a semente da próxima geração. A diferença que essa semente pode deixar no solo de um grupo de povo é significativa. Se colocarmos Cristo e Seu reino em primeiro lugar, deixaremos para trás agentes submissos ao reinado de seu Rei.

Cultivo de frutas em sua própria cultura

Nossa missão é encontrar e desenvolver seguidores de Cristo em vez de membros da igreja. Há uma grande diferença entre esses dois resultados. A diferença é vista em vidas transformadas que trazem mudanças para bairros e nações. O simples fato de reunir um grupo de pessoas que se submetem a um conjunto comum de crenças não é digno de Jesus e do sacrifício que Ele fez por nós.

Frost, Michael e Alan Hirsch, The Shaping of Things to Come (Hendrickson Publishers, 2003), p. 209.

Temos plantado organizações religiosas em vez de plantar a poderosa presença de Cristo. Muitas vezes, essa organização tem uma estrutura muito ocidental, com valores não encontrados no solo nativo. Se simplesmente plantássemos Jesus nessas culturas e ajudássemos Sua igreja a emergir de forma nativa do solo, então surgiria um movimento de igreja auto sustentável e reprodutor, não dependente do Ocidente e não removido da cultura em que cresce. As igrejas nem sempre dão os frutos que deveriam dar sem serem desafiadas, por isso é importante "cultivá-las", equipando-as para ver a vida de Cristo florescerem sua sociedade.

Em vez de acabar com grupos que se esforçam para se separar e se afastar de sua cultura, as igrejas orgânicas são livres para se engajar e transformar sua cultura.

_________________________________________________________ Neil Cole é pastor e palestrante. É fundador e diretor executivo da Church Multiplication Associates, que já ajudou a iniciar igrejas em mais de 20 países. Escreveu Cultivating a Life For God [Cultivando uma vida para Deus] e Organic Church (Igreja orgânica): Crowing Faith Where Life Happens [Cultivando a fé onde a vida acontece].

Este material provém do livro Organic Church: Crowing Faith Where Life Happens [Cultivando a fé onde a vida acontece], 2005. Usado com permissão da John Wiley & Sons, Inc., Hoboken, NJ.', 108 from cursos where slug = 'perspectivas';

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 111;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Schwartz: Dependência', 'Dependência

Glenn Schwartz

A generosidade bem-intencionada dos cristãos muitas vezes é um tiro pela culatra, criando dependência. Podemos aprender lições valiosas com as falhas passadas de bondades mal orientadas.

Primeira lição: Todos devem doar

Conta-se que um crente Indígena Navajo do oeste dos Estados Unidos, cujo povo sofreu muito nas mãos do restante da população, compartilhou essa notável percepção. Ele disse: "Os missionários não nos ensinaram a daro dízimo porque achavam que éramos muito pobres. Eles não sabiam que éramos pobres porque não dizimávamos". Há uma lei no universo que diz que se Deus lhe dá algo, você deve devolver parte disso a Ele. Não estou dizendo que o dízimo é a resposta para todos os problemas da igreja, mas estou dizendo que se presumirmos que as pessoas não podem devolvera Deus partedoquelhesfoidado-sepresumirmos que elas são pobres demais para dara Deus - nós as privamos de uma bênção que Deus tem reservada para elas.

Segunda lição: Desenvolva a dignidade e a propriedade

Quando pessoas de fora constroem edifícios de igrejas para a população local, elas podem inadvertidamente se tornar ladrões de respeito próprio. O financiamento estrangeiro de edifícios pode tirar o privilégio que a população local deveria ter de construir suas próprias igrejas, clínicas ou escolas. Em vez de preservar a dignidade, podemos criar uma dependência que muitas vezes volta para nos assombrar.

Durante um seminário sobre esse assunto, um missionário americano no fundo da sala levantou a mão e disse. "Eu sei do que você está falando. Há alguns anos, levei um grupo de 36 pessoas da América do Norte para a América do Sul para construir uma igreja para os crentes locais. Ficamos lá por várias semanas, terminamos a construção, entregamos ao povo local e voltamos para casa. Dois anos depois, recebemos uma carta das pessoas daquela igreja: "Queridos amigos, o telhado do prédio da sua igreja está vazando. Por favor, venham consertá-lo".

Por outro lado, algumas sociedades missionárias, desde o início, insistem no envolvimento da população local na construção de seusedifícios, noapoioaseus evangelistas e no envio de missionários. Algumas dessas igrejas não apenas constroem seus próprios prédios, mas enviam seus próprios missionários na primeira década de sua existência.

Terceira lição: Torne o reproduzível

A estrutura do movimento cristão introduzido em muitas partes da África Central e Oriental não pode ser reproduzida. Essa complexa estrutura estrangeira foi criada e construída ao longo de décadas com um gasto de milhões de dólares, libras e marcos alemães.

Se a equipe estrangeira visitante durante o período colonial não conseguia administrar os programas sem o pesado subsídio estrangeiro, como eles poderiam esperar que os crentes o fizessem quando o subsídio fosse removido? O resultado é que, na África Central e Oriental, igreja após igreja não consegue pensar em evangelismo transcultural além de suas fronteiras devido ao peso das estruturas herdadas do passado. Além disso, como muitos desses programas da igreja não puderam ser sustentados localmente, como poderiam ser reproduzidos em outros lugares?

Por isso, os líderes bem-intencionados das igrejas nacionais estão preocupados com a manutenção, em vez de com o alcance missionário dinâmico. Eles têm pouca energia para tornar o alcance transcultural uma realidade, muito menos uma aventura espiritualmente gratificante. No final, os líderes locais são vistos como maus administradores, ou até mesmo como fracassados, por não conseguirem manter programas elaborados da igreja em andamento. Esse é apenas um dos muitos resultados lamentáveis da criação de estruturas irreproduzíveis.

Quarta lição: Evitar a dependência de financiamento externo

Talvez um dos aspectos mais lamentáveis das estruturas irreproduzíveis da igreja e da missão seja o fato de que o enorme fluxo de financiamento externo é o que de fato mantém muitas igrejas "pobres". Ao longo dos anos, os crentes descobriram que não era necessário colocar dinheiro de papel na oferta da igreja. Eles sabiam que, se ficassem sentados e esperassem o tempo suficiente, os fundos acabariam vindo de alguma fonte invisível. De fato, aqueles que criaram os programas não podiam se dar ao luxo de deixá-los fracassar. As pessoas de "compaixão" encontrariam os fundos e preencheriam a lacuna, mesmo que não fosse por outra razão que não fosse salvar a reputação daqueles que criaram os programas.

Até mesmo as principais igrejas que experimentaram a bênção de serem organizacional e financeiramente independentes acham necessário continuar ensinando a seu povo que "é mais abençoado dar do que receber". Às vezes, a facilidade com que outros grupos recebem dinheiro de fora se torna uma forte tentação. É bom lembrar que as pessoas podem sercompradas com dinheiro. A marcha do Islã pela África, alimentada pelos petrodólares do Oriente Médio, é uma fonte real de perigo para o cristianismo nominal africano.

Outra história triste

Uma importante organização cristã na África Oriental estava no caminho certo para funcionar inteiramente com financiamento local. Estruturas culturalmente apropriadas foram implantadas. Os fundos locais estavam sendo levantados. Então, um doador na Europa lhes ofereceu uma doação substancial. Eles acharam que não poderiam recusar sem ofender o doador. Mas algo trágico aconteceu durante o processo. Os membros da diretoria da instituição disseram. "Se é tão fácil conseguir dinheiro no exterior, por que temos todo o trabalho de tentar arrecadar fundos localmente?" Infelizmente, os planos de captação de recursos locais foram descartados. A alma da instituição foi vendida em favor do dinheiro fácil. E diante disso, deveríamos lamentar.

E uma história feliz

Um pastor da Província do Cabo, na África do Sul, tem a visão de um ministério com um orçamento de cem milhões de rands. Fiquei com o coração apertado quando soube que ele esteve recentemente em uma viagem à Europa. Imagine minha surpresa quando soube que Deus falou com ele nessa viagem, dizendo-lhe que o dinheiro deveria ser levantado em casa, com empresários da Província do Cabo, na África do Sul. Se isso acontecer, a bênção será abundante entre todas as pessoas da Província do Cabo, em vez de ficar restrita a alguns doadores europeus.

Uma história de trabalho árduo

Depois de obter permissão das autoridades locais, um pastorcomprou um campo e começou a arar. Um morador vizinho viu o que ele estava fazendo. Ele se aproximou do líder da igreja no campo e disse. "Reverendo, porque está arando este campo?" Ele respondeu: "Porque as ofertas da igreja estão em baixa e preciso sustentar minha família.

O vizinho respondeu. "Você é um homem de Deus, deveria estar fazendo o trabalho de Deus. Vá fazer o trabalho de Deus, e eu vou arar o seu campo para você." Quando chegou a época da colheita, o vizinho se ofereceu para ajudar o ministro novamente.

Mais tarde, esse líder da igreja fez esta observação. "Quando nosso povo vir que nós, como líderes da igreja, estamos dispostos a trabalhar para nosso próprio sustento, então nosso povo mostrará que também está disposto a ajudar. É assim que a atitude de nosso povo mudará".

Pense novamente da seguinte forma: enquanto houver uma fonte de renda velada de algum lugar desconhecido, as pessoas locais não sentirão a necessidade de apoiar seus próprios ministérios. A questão é a seguinte: Alguém tem coragem de deixar o sistema entrar em colapso para que o que surgir realmente pertença às pessoas?

O que pode ser feito: Mobilizar recursos locais

Há mais de cem anos, os missiólogos descobriram a importância do sustento pessoal para o estabelecimento de igrejas missionárias. Agora, um século depois, não apenas as lições do autossustento saudável foram deixadas de lado, mas muitos racionalizam que a única coisa razoável a fazer é complementar ou, em alguns casos, substituir as doações locais por recursos globais. Eles não parecem perceber que, quando os recursos globais substituem os recursos locais, as pessoas são privadas da alegria de devolver ao Senhor parte do que Ele lhes deu. Mais tragicamente ainda, em algum lugar o evangelho não será pregado porque muito dinheiro está sendo desviado para igrejas já existentes.

Um líder da África Oriental me disse que enfrentava um duplo desafio: "Precisamos fazer mais do que levantarfundos locais com sucesso. Isso nós podemos fazer. Além disso, precisamos desafiar as estruturas e as suposições ocidentais que continuamente despejam fundos de fora". Agora é a hora de estancar o fluxo de fundos mal orientados para as igrejas emergentes, para que possamos ver as igrejas se moverem com a bênção de Deus.

Perguntas de estudo

1. Em situações interculturais, que desincentivos são criados pelo financiamento externo? 2. Relacione duas maneiras pelas quais a mobilização de recursos locais promove o avanço do reino de Deus.

________________________ Glenn Schwartz é o Fundador e Diretor Executivo da World Mission Associates, uma organização de consultoria missionária que conduz o ministério na América do Norte, América Latina, Inglaterra e África. Foi assistente do reitor da Fuller School of World Mission por seis anos e foi missionário na Zâmbia e no Zimbábue por sete anos. Em 2007, ele publicou When Charity Destroys Dignity [Quando a caridade destrói a dignidade].', 111 from cursos where slug = 'perspectivas';

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 116;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Smalley: Implicações culturais de uma igreja autóctone', 'Implicações culturais de uma igreja autóctone

William A. Smalley

Parece ter se tornado inquestionável no pensamento missionário que uma igreja que é "autônoma, autossustentável e auto-propagadora" é, por definição, uma "igreja autóctone". Parece ainda seguir no pensamento de muitas pessoas que tal igreja autóctone (e assim definida) é o objetivo das missões modernas. No entanto, existem algumas reservas muito sérias que podem ser feitas a esse ponto de vista, e é um ponto de vista que pode ser muito enganoso ao moldara administração para o desenvolvimento de uma igreja, se considerarmos algumas de suas implicações culturais. Para mim, em primeiro lugar, os critérios de "autonomia, autossustentabilidade e auto-propagação" não são necessariamente diagnósticos de um movimento autóctone. Um movimento deve ser definido de outra forma, e embora esses três elementos "auto" possam estar presentes em tal movimento, eles são essencialmente variáveis independentes. Os três "autos" parecem ter se tornado frases de efeito que podem ser aplicadas sem qualquer entendimento particular em uma igreja ou em outra. Ainda assim, é evidente na examinação dos fatos que os "autos" não sejam necessariamente relevantes.

Má interpretação de autonomia

Pode ser muito fácil ter uma igreja autônoma que não seja autóctone. Muitas igrejas atualmente autônomas não o são. Tudo o que é necessário é introduzir alguns líderes em padrões doutrinários ocidentais e deixá-los assumir. O resultado será uma igreja governada de maneira escravizada por estrangeiros (embora provavelmente modificada em alguns pontos na direção dos padrões de governo local), mas, por nenhum estiramento da imaginação, pode ser chamada de igreja autóctone. Além disso, é possível que um movimento cristão genuinamente autóctone seja "governado" em certa medida por estrangeiros. Mesmo nos movimentos em grande escala "rumo a Cristo" que ocorreram no mundo, movimentos que foram tão extensos que o corpo estrangeiro teve mais dificuldade em controlá-los do que em grande parte de seu trabalho missionário, o corpo missionário frequentemente exerceu sua influência governante sobre o nível superior da sociedade, pelo menos onde estava relacionado de alguma forma com o movimento. Isso pode ter sido por ação direta de missionários ou pela ação de líderes da igreja que foram treinados nos padrões estrangeiros de governo. Embora tal governo possa serinfelizem muitos casos, isso não diminui em nada o caráter autóctone do movimento cristão por parte de um grupo de povos.

Má aplicação do autossustentável

É improvável que haja qualquer discordância com a ideia de que a igreja de Jerusalém no século I era uma igreja autóctone. Os cristãos de Jerusalém eram tão fortemente judeus em suas atitudes que eles se ressentiam com a conversão dos gentios, a menos que estes aderissem ao desempenho ritualístico judaico da lei. Essa igreja, no entanto, em seu momento de necessidade, recebeu doações do exterior, da Europa - em terminologia moderna, do Ocidente. O próprio Paulo levou algumas dessas doações para Jerusalém. Ninguém argumentaria que o recebimento de tais doações infringe a natureza autóctone da igreja judaica. Da mesma forma, acredito que o recebimento de tais doações pelas igrejas mais jovens hoje não necessariamente infringirá seu caráter autóctone. Isso é verdade apesar dos perigos muito reais que existem nesse apoio às igrejas mais jovens pelos corpos missionários. Eu estive na Indo-China como missionário durante alguns dos anos de guerra civil. Foram dias em que todo o país estava profundamente perturbado, quando as congregações da igreja podiam ser isoladas da missão sem mais do que algumas horas de aviso, à medida que a linha de batalha se deslocava. Grupos que haviam recebido subsídios da missão podiam perder repentinamente a ajuda da missão e ficar em uma posição econômica temerosa. Junto com a maioria dos meus colegas, senti a tremenda fragilidade de um programa missionário baseado nofinanciamento estrangeiro de seus trabalhadores nacionais. Em tempos de crise como aquele, trabalhamos arduamente para garantir que a igreja fosse colocada em uma base de autossustentabilidade. A autossustentabilidade é, sempre que possível, o método mais sólido de economia da igreja. É saudável tanto para a igreja quanto para a missão, mas certamente existem situações em que não é possível, ou não é aconselhável onde a autossustentabilidade pode tornar o crescimento da igreja quase impossível, e sua presença não implica necessariamente a falta de uma igreja autóctone. É uma variável independente dentro do padrão da missão e da igreja. Isso depende de como os problemas são tratados e como a tentação de controlar a vida da igreja através da manipulação de fundos é resistida por parte dos membros da missão. Se fundos estrangeiros são usados de maneira autóctone, ainda pode ser perigoso, porém não exclui as características de uma igreja autóctone. Exemplos de áreas em que as igrejas mais jovens geralmente não se esperam que sejam autossustentáveis incluem publicação, tradução da Bíblia, educação, saúde e medicina e muitos outros campos completamente fora dos limites de sua economia. Essas não são atividades autóctones, mas são atividades valiosas para várias igrejas, mesmo no mundo moderno. Se essas coisas entram ou não, na vida de uma igreja de maneira "autóctone", depende inteiramente da maneira como as mudanças ocorrem, não da fonte de onde vêm.

Mal-entendido sobre aAutopropagação

Desses três "autos", parece-me que a autopropagação é de longe o diagnóstico mais próximo do status autóctone, mas aqui novamente, a correlação está longe de ser completa. Em algumas áreas do mundo, pode ser precisamente o estrangeirismo da Igreja que é a fonte de atração sobre os incrédulos. Há parte do mundo que aspira que um novo movimento cristão surja exclusivamente de aspirações nativas que são totalmente alheias aos incrédulos. As pessoas aprendem através do espanto a se identificar com ideias fortes e poderosas, e onde a igreja oferece uma oportunidade para essa identificação, a autopropagação nesse caso pode ser apenas um caminho para um relacionamento não autóctone.

A natureza de uma igreja autóctone

Eu suspeito firmemente que os três "autos" são realmente projeções de nossos sistemas americanos na idealização da igreja, e que eles estão nos seus extremos conceitos ocidentais naturais, baseados nas ideias ocidentais de individualismo e poder. Por forçá-los sobre as pessoas, nós tornamos impossível um verdadeiro desenvolvimento de liderança autóctone. Nós temos sido ocidentalizados com toda nossa fala sobre os nativos.

O que, então, é uma igreja autóctone? É um grupo de cristãos que vivem suas vidas, incluindo suas atividades sociais cristãs, associadas à sociedade local e, por estes, qualquer transformação social vem à tona, proveniente de suas necessidades debaixo da direção do Espírito Santo e das Escrituras. Há vários elementos básicos nessa tentativa de formação. Primeira questão, a igreja é uma sociedade. Como uma sociedade, ela tem seus padrões de interação entre as pessoas. Se for uma sociedade autóctone, uma igreja autóctone, esses padrões de interação serão baseados nos padrões da sociedade local. Isso é verdadeiramente simples, porque as pessoas aprendem a reagir umas com as outras em seu processo normal de enculturação, de crescer e esses hábitos normais são transferidos para a estrutura da igreja local. Se outros padrões são impostos a uma igreja por missionários, consciente ou inconscientemente, tal igreja não será autóctone. A presença do Espírito Santo, no entanto, é outro fator básico na igreja autóctone e Sua presença implica em transformação tanto das vidas individuais quanto da sociedade. Mas, como eu tenho tentado pontuarem outro artigo sobre a mudança da natureza cultural, tal transformação ocorre diferentemente em diferentes sociedades, depende do significado que as pessoas dão aos seus comportamentos e das necessidades que elas têm em suas vidas. Missionários geralmente promovem e lutam por uma mudança cultural que faz com que as pessoas sejam mais parecidas com eles de alguma forma (e isto é verdade, mesmo que eles negligenciem o significado dessa forma). Uma igreja autóctone é aquela que as mudanças se estabelecem sob a orientação do Espírito Santo, atendendo às necessidades e cumprindo seu significado nesta sociedade em específico, e não de grupos externos. Muitos disseram coisas assim e uma declaração deveria e poderia ser consideravelmente elaborada, para fornecer uma descrição mais adequada da natureza da igreja autóctone. Às vezes, em nossas buscas por compreensão da natureza da igreja, nós nos voltamos para o Novo Testamento (como deveria ser). Mas não é na estrutura formal e operacional das igrejas do Novo Testamento onde iremos achar as respostas. Na verdade, a igreja de Jerusalém era aparentemente diferente, até mesmo em questões operacionais em comparação com as igrejas na Europa, principalmente em questões culturais, que eram importantes para os judeus. No Novo Testamento nós encontramos uma imagem de uma igreja autóctone. É aquela igreja na qual o Espírito Santo tem agido com transformação dentro da sociedade. E onde esta sociedade difere de outra (assim como o mundo grego é diferente do mundo judeu) a igreja resultante é diferente.

Missionários não gostam disto

Dito tudo isto, eu gostaria agora de ressaltar algumas implicações de uma "igreja autóctone", implicações estas que não têm sido consideradas com frequência. Uma delas é que geralmente os missionários não gostam do resultado final. Geralmente, a verdadeira igreja autóctone é uma fonte de preocupação e vergonha para o corpo missional da área. Um exemplo disto são os indígenas Toba, relatados pelo doutor William Reyburn. A missão estava transtornada e infeliz por conta da igreja autóctone que se espalhou tão rapidamente entre os Toba, por ter assumido uma forma bastante diferente do formato pensado pelo grupo de missionários. Até o momento em que os missionários viram algo na natureza da igreja e do trabalho do Espírito Santo em outras sociedades além das suas. Eles se reconciliaram com a igreja autóctone existente e buscaram harmonizar seu programa com o programa da igreja, para o fortalecimento desta e para a glória de Deus. Houve movimentos autóctones que foram aprovados pelos missionários. Essa aprovação foi às vezes devido às visões não usuais e percepções dos missionários que enxergavam além das limitações de sua própria cultura e reconheciam o mover do Espírito Santo entre outros povos. Ainda em outras ocasiões, a maior parte dos sistemas de valores da nova igreja coincidia tanto com os nossos valores, que o resultado final era uma igreja que refletia valores que nós consideramos valiosos. Movimentos na China, como Família de Jesus, serviram para revelar qualidades pessoais excepcionais como frugalidade, higiene e outras qualidades que são valorizadas em nossa sociedade e que são consideradas frutos de um movimento cristão. Estas são, no entanto, ideais presentes também na vida de um chinês não-cristão. Uma vida transformada resulta na perfeição de valores sociais quejá existem na cultura. Mas este não é o caso entre os Toba, onde compartilhar posses com seus parentes e vizinhos, se envolver emocionalmente nas expressões da religião caracteriza este grupo, porque isso está em suas formas de expressar seus valores. Entretanto, o doutor William D. Reyburn compartilhou isto há um tempo atrás, a maioria de nós deseja participar do júri enquanto Deus faz Seusjulgamentos de pessoas e culturas, ainda assim nós não entendemos o significado do juízo. Nós somos rápidos para fazer avaliações e decidir qual curso a nova igreja precisa seguir ou qual curso o novo indivíduo cristão precisa tomar, mas não somos competentes nem qualificados para tomar estas decisões, tendo pouco ou nenhum conhecimento do plano de fundo da cultura do povo ou indivíduo. É nosso trabalho, primeiro de tudo, ver a Bíblia nesta perspectiva cultural, ver Deus lidando com o homem através de diferentes situações culturais. É nossa responsabilidade ver como Deus traz mudança enquanto lida com pessoas, como a história cultural de mudança dos judeus, reconhecer que Deus tem sempre, e em todo lugar, lidado com pessoas em termos culturais. Nossa próxima responsabilidade é conduzir novos cristãos à luz da Bíblia e ajudá-los a enxergar nas escrituras Deus interagindo com outras pessoas, pessoas com emoções e problemas similares aos deles mesmos na medida em que sua natureza fundamental é preocupante, mas ao mesmo tempo são muito diferentes entre eles mesmos em uma questão específica ou em suas formas de viver. É nossa responsabilidade liderá-los em oração para encontrar o que Deus quer que eles façam enquanto estudam Sua Palavra e buscam interpretação e liderança do Espírito Santo. É tarefa missionária, se o missionário acredita no "autóctone principal," pregar que Deus, em Cristo Jesus, está reconciliando o mundo para Si. Esta mensagem é super cultural. Isto se aplica em todas as culturas e em todos os lugares. Afé produtiva é supercultural, mas o meio de sua comunicação e o desenrolarda sua fé na vida individual não é super cultural - está ligado aos hábitos e valores de todas as pessoas. Noentregardestamensagem-amensagemquevirouomundoao avesso e continua fazendo isso - encontramos a chamada do missionário. É, além disso, responsabilidade do missionário ser uma fonte de alternativas culturais para as pessoas selecionarem se quiserem e precisarem delas. Missionários com seu conhecimento da história, seu entendimento das Escrituras e seu conhecimento da igreja em sua própria terra e em outras áreas missionárias podem sugerir a grupos locais que existem saídas para o dilema deles, que existem maneiras de uma vida melhor em Cristo do que aquela que eles estão vivendo agora. Isto é certamente uma função missionária legítima, seu papel na mudança cultural. Mas se houver uma mudança genuína a ser feita, a decisão ou a seleção deve ser tomada pelo próprio povo. Se a igreja for autóctone, então devemos considerar que a seleção será feita com base nas necessidades, problemas e perspectivas desse povo. Cabe à igreja decidir se ferver água, abstinência de álcool, uso de roupas e monogamia são as expressões adequadas de um cristão nessa sociedade. É a igreja sob a liderança do Espírito Santo que terá de determinar as melhores maneiras de fomentar seu próprio crescimento, espalhando seu próprio testemunho e apoiando sua própria liderança formal (se é que deve ter alguma liderança formal). Como já sugerimos, o problema das implicações da igreja autóctone são como os dos judaizantes de Jerusalém. Aqueles judaizantes viam o Cristianismo Grego através de olhos hebreus. Eles são como muitos missionários nisso, se é que estavam contentes que qualquer gentio fosse convertido, eles viam a conversão à luz do preenchimento de um molde formal. O Novo Testamento, no entanto, repudia claramente essa visão e estabelece a igreja como um grupo de crentes dentro de sua própria sociedade, trabalhando uma mudança química dentro da sociedade, assim como o sal em um prato, em vez de cortar a sociedade em pedaços, como os judaizantes fariam. Isso não contradiz a exclusividade do Cristianismo. A igreja é um grupo separado, maséseparadoem termos espirituais, em relação a Deus. É na igreja autóctone que a relação entre o Espírito Santo e a sociedade se estabelece. Essa é a igreja do Novo Testamento. Os convertidos de um movimento autóctone não são necessariamente mais limpos do que seus vizinhos, nem necessariamente mais saudáveis, nem necessariamente mais educados. Além disso, muitas vezes é no momento em que eles se tornam mais limpos, mais saudáveis e mais educados que a barreira começa a crescer, tornando sua interação com os vizinhos nativos menos provável, e o crescimento do movimento começa a diminuir. Como o Dr. McGavran apontou em seu livro tremendamente significativo, "As pontes para Deus", as missões tradicionalmente investiram seusfundos não nos movimentos populares, mas nas igrejas estacionárias, nos enormes complexos missionários, nas igrejas que são seus satélites, em vez de investir nas bases do desenvolvimento de uma igreja autóctone embaraçosa. Não apenas muitos missionários não gostam de alguns dos exemplos notáveis de movimentos de igrejas autóctones, mas em um grau ainda maior, suas bases de apoio na terra natal provavelmente não as aprovam. Nossos valores culturais aplicados às nossas igrejas são tão fortes que sentimos que é uma estrutura corporativa, um motivo de lucro, individualismo e economia que são de fato expressões do Cristianismo. O fato de que Deus trabalha de qualquer outra forma, que não a nossa, é algo impensável para a maioria de nós. Uma implicação da igreja autóctone que eu acho muito indesejável para muitos missionários é que o missionário não pode tomar decisões culturais pelos cristãos. Com isso não quero dizer que o missionário não faça julgamentos de valor. Missionários individuais não podem deixar de fazê-lo e nem deveriam desejardeixar de fazê-lo. Seus julgamentos de valor devem serorientados interculturalmente para serem valiosos, mas estarão lá mesmo assim. Também não quero dizer com isso que os missionários não possam exercer uma importante medida de orientação e sugestões à jovem igreja enquanto cumprem suas funções de ensinar e pregar e, em muitos aspectos, aconselhar.

Uma igreja autóctone não pode ser "fundada"

A próxima implicação que muitas vezes não é totalmente compreendida pelos missionários que discutem movimentos autóctones é que é impossível "fundar" uma igreja autóctone. A figura bíblica de plantar e colheré muito mais realista do que a nossa figura ocidental baseada nos valores ocidentais e expressa na ideia de "estabelecer" ou "fundar" uma igreja. Não, igrejas nativas não podem ser fundadas. Elas só podem ser plantadas e a missão geralmente se surpreende com o crescimento das sementes. Muitas vezes, eles têm a tendência de considerar as sementes que crescem em qualquer proliferação como ervas daninhas, um incômodo, um obstáculo em seujardim missionário estrangeiro cuidadosamente cultivado; enquanto isso, as plantas de estufa cuidadosamente cultivadas da igreja "fundada" pela missão são incapazes de espalhar raízes e obter nutrição, seja do solo de sua própria vida, ou da Palavra de Deus nos vasos restritivos da organização e cultura missionária.

Igrejas autóctones começam separadas de Missões

Outra implicação da ideia completa de uma igreja autóctone é de que os grandes movimentos autóctones muitas vezes não são o resultado do trabalho estrangeiro de maneira direta. Às vezes, eles são o resultado do testemunho de alguém que se converteu pelo esforço do missionário estrangeiro, mas geralmente não é o missionário estrangeiro a testemunha que estabelece ou inicia um movimento autóctone. O apóstolo Paulo não era um estrangeiro para o mundo grego. Ele era um indivíduo bicultural, tão à vontade no mundo grego quanto no mundo hebraico, e cuja pregação levava ao mundo grego a mensagem que lhe vinha dos cristãos do mundo hebraico. O profeta Harris, que percorreu a costa oeste da África pregando sobre os homens que viriam com um Livro, não era um missionário estrangeiro. Os homens dos quais os Tobas ouviram o evangelho, em sua forma pentecostal, não eram estrangeiros. Na verdade, eles não eram Tobas, mas eram os habitantes latino-americanos mais pobres e de origem mestiça espanhola-indígena das áreas onde os Tobasviviam. Eles faziam parte da imagem cultural na qual os Tobas se encontravam; eles não eram missionários estrangeiros. Os movimentos populares na China geralmente eram resultado do trabalho fervoroso de um cristão chinês, não do evangelismo de missionários estrangeiros, exceto quando ele próprio era convertido por meio do trabalho missionário. O movimento Hmong descrito por G. Linwood Barney não foi trazido através da pregação de um missionário, mas através do trabalho cooperativo de um xamã Hmong que havia se convertido (por um missionário) e que levou outro membro da tribo, com o qual os Hmong eram familiarizados, pregando de vilarejo em vilarejo, de cidade em cidade. Nossa distância em relação à maioria das outras culturas é tão grande, a especialização cultural do Ocidente é tão extrema, que quase não há caminhos de abordagem pelos quais nosso trabalho possa normalmente resultar em algo de natureza autóctone. É irônico que o Ocidente, que provavelmente está mais preocupado com a disseminação do Cristianismo no mundo hoje e que é financeiramente mais capaz de assumir a tarefa do evangelismo mundial, seja culturalmente o menos adequado para essa tarefa devido à maneira como se especializou a ponto de ser muito difícil para ele ter uma compreensão adequada de outros povos.

Conclusão

Até que estejamos dispostos a permitir que a Igreja tenha diferentes manifestações em diferentes culturas - em vez de exportaros padrões denominacionais enraizados em nossa história e muitas vezes irrelevantes para o resto do mundo - não teremos igrejas autóctones. Não importa se elas são "auto-governantes, autossustentáveis e auto-propagadoras" ou não. É somente quando estamos dispostos a deixar as igrejas crescerem que aprendemos a confiar no Espírito Santo com a sociedade. Estamos tratando o Espírito Santo como uma criança pequena com um brinquedo novo, muito complicado e perigoso para manusear. Nosso paternalismo não é apenas em relação a outros povos; também é um paternalismo em relação a Deus.

Notas finais:

1. McGravan, Donald, "The Bridges of God" (Londres: World Dominion Press,

1955).

2. Smalley, William A., "The Missionary and Culture Change", Practical

Anthropology, Vol.: 4:5 (1957), pp. 231-237.

3. Reyburn, William D., "Conflicts and Contradictions in African Christianity",

Practical Anthropology, Vol.: 4:5 (1957), pp. 161-169.', 116 from cursos where slug = 'perspectivas';

commit;
