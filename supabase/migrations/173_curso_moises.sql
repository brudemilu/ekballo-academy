-- Curso: Moisés (Charles R. Swindoll) — slug moises. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'moises';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('moises','Moisés','Estudo a partir de Moisés, de Charles R. Swindoll. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/moises', false, 0, 'ensino', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Êxodo: O Cenário da Libertação$t$, 1,
$conteudo$A palavra significa "partir, ir embora", e isso descreve certamente o tema principal deste segundo livro do Antigo Testamento. Ele registra a saída dos israelitas da terra do Egito, onde haviam vivido por mais de quatrocentos anos. Entraram na terra como uma pequena família e partiram então como uma enorme nação. Quando Faraó permitiu finalmente que o povo de Deus fosse embora, eles saíram do Egito e começaram (o que acabou sendo) uma viagem muito, muito longa para a sua própria terra, Canaã.

O Êxodo registra grandes eventos e intenso drama. Ele é na verdade uma continuação do Livro de Gênesis, com um intervalo de vários séculos. A história do Êxodo começa onde Gênesis termina, cerca de trezentos anos mais tarde. A ligação entre esses dois livros é um dos relatos mais fascinantes de toda a história.

SOFRIMENTO, PARTEIRAS E ASSASSINATO 17

O principal personagem nos últimos capítulos de Gênesis é um homem chamado José. (Para um relato mais completo dessa história, você pode ler o volume três desta série, José: Um Homem Integro e Indulgente.). Odiado e maltratado pelos irmãos invejosos, José foi levado quando ainda era um adolescente ingênuo e vendido como escravo para uma caravana que ia em direção ao Egito. Com o tempo e mediante uma cadeia de eventos incríveis, Deus honrou grandemente este jovem e o tirou da escravidão, das entranhas de uma masmorra egípcia, tornando-o o braço direito do próprio Faraó. Apesar de todos os reveses, ele se tornou primeiro-ministro da nação mais poderosa do mundo antigo.

E esta é a grande surpresa: José, o ex-escravo notável, que alcançou alturas estelares de poder e prestígio, era um judeu, como seu pai e seus irmãos.

Que nome esse jovem fez para si mesmo! Inúmeras vezes José mostrou sua inteligência. Deus lhe deu discernimento para lidar com problemas grandes e complexos. Faraó reconheceu rapidamente isso e o enalteceu, encarregando-o da agricultura e economia da nação.

Sua decisão mostrou-se sábia, porque justamente naquela época uma terrível fome varreu a terra. Advertido por Deus, José viu o que estava por vir e preparou-se para isso. O mesmo não aconteceu com Jacó e seus filhos em Canaã. Eles teriam morrido de fome se não tivessem tomado uma providência. Vários deles viajaram então para o Egito em busca de mantimentos e como conseqüência foram levados ao governador daquela terra — seu irmão mais moço há muito perdido. Depois de uma reunião familiar cordial e comovente, José convidou os irmãos e o pai a se mudarem para o Egito, uma vez que ali teriam abundância de alimentos e uma porção excelente de terra cultivável, assim como pasto para o rebanho.

Se você espera apreciar o Êxodo, deve saber como os hebreus se encontraram nessa terra estrangeira. Os filhos de Jacó não foram feitos para o Egito! Eles foram feitos para Canaã, aquela rica e renovada terra prometida que aguardava o retorno deles.

18 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Faraó respondeu à chegada da família de Jacó com mãos generosas e abertas:

Então disse Faraó a José: Teu pai e teus irmãos vieram a ti. A terra do Egito está perante ti: no melhor da terra faze habitar teu pai e teus irmãos; habitem na terra de Gósen. Se sabes haver entre eles homens capazes, põe-nos por chefes do gado que me pertence.

Gênesis 47:5-6

Que oferecimento admirável! Ele revela a consideração de Faraó pelo seu braço direito. O rei disse a José: "Sua família veio. Isso é ótimo. Dê a eles o melhor da terra! Faça com que se estabeleçam em Gósen. Que façam pastar os seus animais e ajudem a cuidar do meu gado. Eu os aceito de coração, José".

Em razão da bondade de Faraó, José pôde acolher sua família naquela terra estranha e dar-lhes um belo lugar para viver, muito além do que eles poderiam imaginar. Disse-lhes então: "Não temais, pois; eu vos sustentarei a vós outros e a vossos filhos. Assim os consolou, e lhes falou ao coração" (Gn 50:21).

Por mais generosa que tivesse sido a oferta magnânima de refúgio e provisão feitas pelo rei, essa não foi a parte mais surpreendente dessa história. Mais notável ainda foi a ausência de ressentimento no coração de José em relação aos irmãos, que o haviam odiado e prejudicado. Ele lhes disse: "Não se preocupem. Fiquem em paz. Tudo está bem. Venham para cá que eu cuidarei de vocês e de suas famílias". Mediante circunstâncias estranhas e maravilhosas, os filhos de Israel passaram então a viver no Egito.

Nessa ocasião eles eram apenas uma família grande, um bando de refugiados confusos. Seria possível pôr todos eles em dois ônibus de viagem. Mas, levando-se em conta que tal transporte não existia, esses irmãos e seu pai idoso reuniram todos os seus bens e começaram a longa caminhada para o sul. Contudo, quando chegaram à fronteira na condição de estrangeiros, os egípcios não os arrastaram para um campo de refugiados a fim de dificultar a vida deles. Rece-

SOFRIMENTO, PARTEIRAS E ASSASSINATO 19

beram terras escolhidas, uma porção de primeira da área central do Egito, onde poderiam viver e criar suas famílias em paz.

MUDANÇA N O HORIZONTE

Durante cerca de setenta e um anos depois dessa transferência radical, a vida deles poderia ser comparada à do preguiçoso rio Nilo. As Escrituras nos dizem: "Jacó viveu na terra do Egito dezessete anos; de sorte que os dias de Jacó, os anos da sua vida, foram cento e quarenta e sete" (Gn 47:28). José tinha provavelmente trinta e nove anos quando sua família foi morar no Egito. Ele viveu setenta e um anos depois disso e então deu seu último suspiro. O último versículo do Livro de Gênesis informa sucintamente: "Morreu José da idade de cento e dez anos; embalsamaram-no, e o puseram num caixão no Egito" (Gn 50:26).

A morte digna desse homem respeitável marcou o começo do fim da boa vida dos hebreus no Egito. Quando José foi colocado no caixão, a vida começou a mudar para aqueles judeus transplantados — pequenas mudanças no início (elas geralmente são assim), mas logo mais a sorte dos israelitas decaiu de vez, como o mercado de ações em outubro de 1929.

A essa altura, a população de judeus no Egito havia explodido. Os descendentes dos filhos de Jacó foram aumentando até se tornarem um povo poderoso no Egito... para consternação crescente dos oficiais egípcios.

Uma vez que José não estava mais em cena para falar a favor dos seus parentes, a atitude egípcia com respeito àqueles "hebreus estrangeiros" tornou-se impertinente. A população nativa passou a olhar Israel de modo intolerante e desconfiado. Sabemos muito bem pela história sangrenta do nosso mundo que a suspeita crescente em relação a um grupo de pessoas está a apenas um passo do preconceito... e a outro passo da perseguição... e à distância de uma pedrada do genocídio.

De onde veio esse preconceito? Acho que podemos identificar pelo menos duas fontes para ele.

20 MOISÉS: UM HOMEM DEDICADO E GENEROSO

PASTORES ABOMINÁVEIS

Muitos anos antes, José havia advertido os irmãos sobre algo muito específico na cultura egípcia, algo insignificante, fácil de passar despercebido — e suspeito que os irmãos de José também não notaram.

Quando você recebe um aviso sobre a vida numa cultura estranha, é melhor que preste muita atenção. Quando eu era um jovem marinheiro, prestes a entrar no Japão pela primeira vez, jamais esquecerei como o coronel ficou à nossa frente, descrevendo o novo estilo de vida que iríamos encontrar. Não seria como viajar pelas estradas da Carolina do Norte, passear pelas ruas de alguma cidade poeirenta do Texas, ou brincar nas praias da Califórnia do Sul. Seríamos hóspedes em outro país e olhados com suspeita por alguns e com hostilidade por outros. Muitos de nós nunca haviam sido estrangeiros antes.

Essa era a situação quando José deu aos irmãos essa informação secreta sobre a cultura egípcia. Atente ao conselho dele:

E José disse a seus irmãos, e à casa de seu pai... Quando, pois, Faraó vos chamar, e disser: Qual é o vosso trabalho? Respondereis: Teus servos foram homens de gado desde a mocidade até agora, tanto nós como nossos pais; para que habiteis na terra de Gósen, porque todo pastor de rebanho é abominação para os egípcios.

Gênesis 46:31,33-34

José disse a eles: "Independentemente do que digam, não contem a Faraó que são pastores! Deixem essa informação de lado, está bem? Só digam que cuidam do gado".

Por que ele diria isso? Porque José sabia que os pastores eram "abomináveis para os egípcios".

Vou acrescentar um pouco de pano de fundo aqui. Naquela época, a cultura egípcia avançara muito e esperava-se que os habitantes daquele país demonstrassem certo nível de sofisticação. Pode-se dizer que eram a "classe nobre" daquela época. Na área educacional eles haviam chegado ao ponto máximo. Os hieróglifos avançados

SOFRIiMENTO, PARTEIRAS E ASSASSINATO 21

dos egípcios, suas excelentes universidades e o invejável nível econômico colaboravam para que olhassem de soslaio qualquer grupo de refugiados ou expatriados que pudessem prejudicar sua esplêndida situação. Eles certamente não queriam importar um grupo de pastores humildes que pudesse denegrir a imagem brilhante do Egito. (Lá se vai o sentimento de fraternidade!)

Os eruditos do Antigo Testamento, Keil e Delitzsch acrescentam esta apreciação interessante:

A aversão dos egípcios pelos pastores surgiu do fato de que quanto mais os fundamentos do Egito se apoiavam na agricultura, tanto mais os egípcios associavam a idéia de grosseria e barbárie ao nome de pastor. Isto é... confirmado de várias formas pelos monumentos nos quais os pastores são constantemente representados como magricelas, fracos, deformados, emaciados e algumas vezes figuras quase fantasmagóricas.1

Em outras palavras, os pastores ocupavam uma posição inferior. Usar a palavra pastor nesse ponto delicado da relação com Faraó significaria definitivamente começar com o pé esquerdo.

Pense nos dias em que partes do Oeste americano eram colonizadas e terá uma imagem semelhante. Os barões da carne bovina e os rancheiros de ovelhas competiam pela terra e os lucros, e esses indivíduos nunca jogavam no mesmo time. Ao visitar uma cidade voltada para a criação de gado, você não entrava numa roda de caubóis anunciando que era um pastor com um grande rebanho de ovelhas lanudas num pasto nos arredores da cidade. Um dos caubóis iria provavelmente torcer o nariz e dizer: "Sinto cheiro de ovelhasA essa altura dos acontecimentos, você teria de lutar, esconder-se, atirar ou fugir. Bem depressa!

Faraó aparentemente criava gado, enquanto os filhos de Jacó cuidavam dos rebanhos de ovelhas. José então lhes disse: "Olhem, quando o rei perguntar qual a sua profissão, falem apenas que cuidam de animais. Mantenham uma idéia genérica e isso vai funcionar. Não anunciem que são pastores".

22 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Infelizmente eles esqueceram ou desconsideraram o conselho do irmão. Quando Faraó perguntou sobre a ocupação deles, imediatamente responderam: "Seus servos são pastores, como já eram nossos pais". Com o passar do tempo, o número crescente de pastores judeus tornou-se um Problema (com "P" maiúsculo) entre o povo do Egito.

Esse foi um tipo de preconceito que os israelitas enfrentaram eventualmente. Mas acredito que algo ainda mais profundo que isso causou os verdadeiros problemas.

O primeiro capítulo de Êxodo revela uma segunda e forte razão pela qual os judeus tiveram de enfrentar tantas dificuldades. Eles não só cuidavam de ovelhas numa terra em que os pastores eram odiados, como também as Escrituras nos dizem: "Entrementes se levantou novo rei sobre o Egito, que não conhecera a José" (Êx 1:8).

Chegou o dia em que, depois da morte de José e do Faraó que o promovera, um novo Faraó subiu ao trono. Ele governou durante algum tempo e depois entregou a coroa ao Faraó que o sucedeu. Finalmente, depois de vários séculos, o nome de José tornou-se praticamente desconhecido. Ninguém mais se lembrava da fome, nem da grande quantidade de cereais dourados que um dia foram estocados. Ninguém lembrava como um jovem e sábio primeiroministro judeu havia saído da obscuridade para salvar a todos. Isso era história antiga. Irrelevante. E a política bilateral estabelecida entre José e um Faraó morto há tanto tempo? Fora completamente esquecida.

Esse novo Faraó desprezava a população judia crescente. Como haviam chegado ali? Ninguém sabia com certeza; os registros tinham sido guardados em algum arquivo esquecido num porão.

Uma coisa sobre esses judeus que se multiplicavam não podia ser, porém, esquecida: eles pareciam representar uma ameaça. E com certeza não seria nada agradável ficar por perto de um Faraó ameaçado. Ele disse ao povo:

SOFRIMENTO, PARTEIRAS E ASSASSINATO 23

Eis que o povo dos filhos de Israel é mais numeroso e mais forte do que nós. Eia, usemos de astúcia para com ele, para que não se multiplique, e seja o caso que, vindo guerra, ele se ajunte com os nossos inimigos, peleje contra nós e saia da terra.

Êxodo 1:9-10

Um novo estilo de vida passou então a vigorar para os hebreus. Note a mudança. E uma cena triste. Os egípcios puseram sobre eles feitores de obras, para os afligirem com suas cargas. E os israelitas edificaram a Faraó as cidades-celeiros, Pitom e Ramessés (Êx 1:11).

Ao ler essas palavras aterradoras, não posso senão lembrar-me dos dias sombrios, antes da Segunda Guerra Mundial, quando a sorte do povo judeu em outro país — a Alemanha — mudou tão drasticamente sob o governo de um líder odioso chamado Adolf Hitler. Os judeus não só foram assassinados e enviados para campos de morte, mas se viram também forçados a trabalhar em regime de escravidão cruel em algumas das maiores empresas do Reich. Alojados em condições desumanas, muitos desses escravos da era moderna simplesmente trabalharam até morrer.

O que aconteceu no Egito parece uma previsão estranha daquele período trágico. Uma cena completamente nova, que praticamente ninguém poderia imaginar, ocorreu na terra do Nilo. De repente, os israelitas confusos se viram sujeitos a uma nova e devastadora lei... e a vida nunca mais seria a mesma.

Sai: facilidades, abundância e prosperidade. Entra: feitores e chibatas.

Os arqueólogos nos ajudaram muito a compreender essa parte das Escrituras. Eles desenterraram obeliscos, monumentos e colunas, gravados com todo tipo de figuras e hieróglifos. Uma descoberta interessante foi a de um mural, que representa um grande grupo de trabalhadores no campo realizando suas tarefas sob a vigilância de dois oficiais superiores munidos de grossas chibatas. O trabalho deles? Fabricar tijolos. Os dois portadores dos chicotes foram mostrados gritando: " Trabalhem sem desmaiar!"

Pense nisso! Enquanto José viveu, os israelitas tiveram paz, alegria e liberdade nos campos ensolarados de Gósen. Os ventos po-

24 MOISÉS: UM HOMEM DEDICADO E GENEROSO

rém mudaram. Nuvens carregadas surgiram no horizonte e o ar esfriou. Os vizinhos egípcios começaram a olhá-los de modo diferente — a princípio com suspeita e desagrado, depois com verdadeiro ódio.

Antes que alguém conseguisse descobrir o que dera errado e o que podia ser feito, os feitores surgiram em cena, como uma tropa de oficiais da SS com suas botas negras. Os dias idílicos do pastoreio haviam terminado. A partir de então tinham de fabricar tijolos sob as ordens ríspidas dos feitores e ao som das chibatas.

UMA PROMESSA DURADOURA

As coisas poderiam ter permanecido assim até que os hebreus acabassem completamente diluídos no pó do Egito. As Escrituras dizem: "...os filhos de Israel gemiam sob a servidão, e por causa dela clamaram, e o seu clamor subiu a Deus" (Êx 2:23).

Deus ouviu esse clamor. Ele não estava dormindo. Sua atenção não se desviara. Lembrava-se bem da promessa que fizera aos filhos e filhas de Jacó. Séculos antes do primeiro capítulo de Êxodo, Deus falou a Abrão, pai dos hebreus, e revelou uma profecia relativa aos descendentes desse homem:

Então lhe foi dito [a Abrão]: Sabe, com certeza, que a tua posteridade será peregrina em terra alheia, e será reduzida à escravidão, e será afligida por quatrocentos anos. Mas também eu julgarei a gente a que têm de sujeitar-se; e depois sairão [Êxodo!] com grandes riquezas.

Gênesis 15:13-14

Meu filho, disse Deus a Abrão, "seus descendentes aumentarão em número e entrarão numa terra onde não nasceram. Serão estranhos nessa terra estrangeira, ali sofrerão abusos e serão escravizados. Mas não permanecerão para sempre nela. Depois de vários séculos sob o jugo de um povo brutal, ganharão a liberdade e sairão dessa terra".

SOFRIMENTO, PARTEIRAS E ASSASSINATO 25

Um libertador viria, um homem escolhido a dedo pelo próprio Deus — um líder preparado especialmente para lidar com os israelitas e o Faraó.

Seu nome seria Moisés.

MEDIDAS DESESPERADAS

Vamos retomar o primeiro capítulo de Êxodo por um instante e espiar a vida sob o comando dos faraós e dos feitores. Os israelitas construíram duas novas cidades para os egípcios debaixo de chicotadas. É de pensar que todo esse trabalho árduo e perseguição feroz teriam restringido a explosão demográfica entre os israelitas. Nada disso! Esse povo era prolífico: "Mas quanto mais os afligiam, tanto mais se multiplicavam e tanto mais se espalhavam; de maneira que se inquietavam por causa dos filhos de Israel; então os egípcios, com tirania, faziam servir os filhos de Israel" (Ex 1:12-13).

Os egípcios começaram a temer o número cada vez maior de israelitas ("um povo forte", segundo Faraó). O termo hebreu traduzido como inquietavam é kootz. Ele significa "detestar e ter horror a, um sentimento doentio". Quando as autoridades egípcias perceberam o aumento da população israelita de mês a mês e de ano a ano sentiram náuseas. Se houvesse cafés naqueles dias, João e Maria egípcios poderiam ter-se sentado numa daquelas mesinhas redondas e dito entre um café e outro: "Esse negócio está ficando fora de controle. Nosso plano não funcionou. Temos de pôr um fim nesse crescimento. Se não conseguirmos deter esses estrangeiros, em poucos anos eles estarão governando o país".

A brutalidade então aumentou.

Quase sempre que lemos a respeito de brutalidade nas Escrituras, descobrimos que há emoções fortes por trás dela. Desloque a pedra da brutalidade e veja o medo se arrastando embaixo dela. A insegurança e o ódio dos egípcios pelos vizinhos judeus levou-os eventualmente à selvageria.

Acho isso interessante. Se você se sentir propenso à ira violenta e à brutalidade, seria prudente recuar e perguntar a si mesmo do que

26 MOISÉS: UM HOMEM DEDICADO E GENEROSO

tem medo. Durante os meus anos de ministério, notei com tristeza que as pessoas brutais são muitas vezes instigadas pelo medo. Medo da perda, da humilhação, de ser exposto, da fraqueza, de perder o controle.

Os egípcios chafurdavam nesse tipo de medo. O receio de perder sua terra os impeliu a atos cada vez mais maldosos de injustiça. Uma vez que alguém tenha decidido matar de fome, espancar ou maltratar uma pessoa, torna-se fácil perseguir uma população inteira. Veja o que aconteceu em seguida: "Então os egípcios, com tirania, faziam servir os filhos de Israel, e lhes fizeram amargar a vida com dura servidão, em barro e em tijolos, e com todo o trabalho no campo; com todo o serviço em que na tirania os serviam" (Êx 1:13-14).

Quando essa tática de "trabalhar até morrer" não alcançou os objetivos de Faraó, ele concebeu um plano ainda mais sombrio. Isso me faz recordar novamente as táticas dos nazistas do nosso século XX. Primeiro surgiram as acusações contra os judeus na imprensa popular. Depois a negação de privilégios. Em seguida, a destruição deliberada das lojas e propriedades judias. Mais tarde, a indignidade e humilhação de usar emblemas especiais, marcando-os como inimigos. E, por último, os vagões lotados, os campos de concentração... e os fornos.

Ao perceber que as condições extremas da escravidão não atingiam seus fins, Faraó adiantou um pouco mais os ponteiros da perseguição.

Infanticídio. Assassinato.

O rei do Egito ordenou às parteiras hebréias, das quais uma se chamava Sifrá, e outra Puá...

Êxodo 1:15

Essas duas mulheres aparentemente controlavam todas as parteiras hebréias. O faraó disse: "Quando ajudardes no parto as hebréias, e as virdes sobre os assentos, se for filho, matai-o; mas se for filha, então viva" (v.16, ARC).

Antes de ler a resposta delas, vamos considerar essas instruções. Faraó, agindo sob a compulsão do medo, tem uma reunião particu-

SOFRIMENTO, PARTEIRAS E ASSASSINATO 27

lar com as parteiras representativas. Posso ouvir os assistentes do rei dizer a ele: "Mande trazer essas mulheres à sua presença real e elas irão intimidar-se. Sentir-se-ão obrigadas a cumprir suas ordens!"

Não aquelas mulheres! Antes de as clínicas de obstetrícia modernas abrirem as portas, as gestantes recebiam cuidados em casa, e as parteiras auxiliavam no nascimento (uma prática que está voltando em nossos dias).

A palavra "assentos" na passagem acima salta aos olhos. Não tenho certeza se quero, de fato, saber o que significava isso! Para falar a verdade, sinto-me um tanto constrangido ao considerar certos assuntos íntimos. Quando meus filhos nasceram, não tive nenhum desejo de participar da cena. Já ouvi tudo sobre essa nova geração de pais que entra na sala de partos com um chapéu festivo, uma câmera e uma pizza... mas esse não era absolutamente o meu estilo.

Deixava para Cynthia resolver se queria um anestésico. (Eu gostaria também de tomar um, mas eles não o ofereciam aos homens.) Se fizesse um teste vocacional, estou certo de que não tiraria boas notas na profissão de parteira.

De acordo com as instruções de Faraó, a parteira hebréia devia prestar toda a atenção ao nascimento do bebê. Ela devia descobrir imediatamente o sexo do recém-nascido e matá-lo caso fosse menino — provavelmente sufocando o pequenino ainda antes de ele chorar pela primeira vez.

A seguir a parteira diria: "Oh, sinto muito. Este nasceu morto".

Que plano hediondo, criminoso! Ele se aproxima muito — uma questão de segundos, na verdade — da prática atual também hedionda conhecida como "aborto parcial no nascimento". Essas parteiras, porém, permaneceram corajosamente a favor da vida! Note a atitude delas e a reunião subseqüente com o frustrado Faraó:

As parteiras, porém, temeram a Deus, e não fizeram como lhes ordenara o rei do Egito, antes deixaram viver os meninos. Então o rei do Egito chamou as parteiras, e lhes disse: Por que fizestes isso e deixastes viver os meninos? Responderam as parteiras a Faraó: E que as mulheres hebréias não são

28 MOISÉS: UM HOMEM DEDICADO E GENEROSO

como as egípcias; são vigorosas, e antes que lhes chegue a parteira já deram à luz os seus filhos.

E Deus fez bem às parteiras; e o povo aumentou e se tornou muito forte. E porque as parteiras temeram a Deus, ele lhes constituiu família.

Êxodo 1:17-21

Que heroínas! Essas mulheres temiam mais a Deus do que as leis da realeza. O álibi delas continha uma dose de humor. (Embora eu esteja certo de que eu não poderia fazer melhor, dadas as circunstâncias.) A palavra "vigorosas" significa literalmente "vivas". Elas disseram a um Faraó carrancudo e infeliz: "Oh, rei, essas mulheres são espertas. Quando descobrimos que estão prestes a dar à luz, corremos para a casa delas e vapt, vupt, acabou). A criança já está ali, e o que nos resta fazer então?"

Faraó, que talvez não apreciasse os detalhes do parto mais do que eu, acreditou em toda a história. Quem era ele para discutir com duas parteiras? Com a graça de Deus essas mulheres valentes, como as Escrituras diriam mais tarde sobre os pais de Moisés, "não ficaram amedrontados pelo decreto do rei" (Hb 11:23).

Louvado seja o Senhor por essas figuras corajosas de fé. Até hoje, desde a Africa e a China, até o Meio-Oeste, essa mesma coragem resplandece. Em todo o mundo, enquanto você lê estas palavras, o povo de Deus é caçado e perseguido pela sua lealdade a Jesus Cristo. Os cristãos, entretanto, se mantêm firmes em face de decretos de reis, presidentes, generais e representantes de partidos. Eles proclamam: "Não, nao faremos o que nos pedem. Nós nos recusamos a negar o Senhor". E estão pagando o preço.

NADA DE "SUBMISSÃO CEGA"

As Escrituras têm cuidado em instruir o povo de Deus para sujeitar-se às autoridades, pagar impostos e viver com responsabilidade e tranqüilamente. Um espírito doce e submisso caracteriza o cristão.

SOFRIMENTO, PARTEIRAS E ASSASSINATO 29

• "Esposas, sujeitem-se a seus maridos, como ao Senhor." (Ef 5:22, NVI) • "Filhos, obedecei a vossos pais no Senhor, pois isto é justo." (Ef 6:1) • "Todos devem sujeitar-se às autoridades governamentais." (Rm 13:1, NVI) • "Quanto aos servos, que sejam, em tudo, obedientes aos seus próprios senhores." (Tt 2:9) ' "Sujeitem-se uns aos outros, por temor a Cristo." (Ef 5:21, NVI)

Chegamos então a passagens como o primeiro capítulo de Êxodo e somos lembrados de que a lei de Deus deve sempre ter prioridade sobre à do homem. As Escrituras não ensinam submissão cega. O fato é que há um tempo para submeter-se e um tempo para resistir.

Antes de avançarmos muito neste princípio, talvez seja necessária uma palavra de precaução. A passagem de Êxodo não ensina os filhos a desobedecerem aos pais, as mulheres a usurparem a liderança do marido no lar, ou qualquer pessoa a rejeitar a autoridade ética. Mas ela torna uma coisa clara: a submissão às autoridades civis tem limites. Pedro disse certa vez ao alto conselho judeu: "Antes importa obedecer a Deus do que aos homens" (At 5:29).

Em outras palavras, quando o decreto do rei violar diretamente a vontade expressa de Deus, devemos temer a Deus como duas mulheres corajosas chamadas Sifrá e Puá o temiam. E elas, mesmo mortas, ainda falam. As Escrituras nos contam que Deus honrou a fé que essas parteiras tinham. Elas dizem: "E Deus fez bem às parteiras; e o povo aumentou e se tornou muito forte. E porque as parteiras temeram a Deus, ele lhes constituiu família" (Êx 1:20-21).

Não tenho bem certeza do significado desta última frase. Talvez implique que elas encontraram marido, se casaram e tiveram lares e famílias. Independentemente do que tenha acontecido, essas mulheres foram protegidas e recompensadas por Deus.

As parteiras valorizavam mais o favor de Deus do que o de Faraó. Motivadas por uma reverência profunda e permanente pelo Deus

30 MOISÉS: UM HOMEM DEDICADO E GENEROSO

vivo, elas se recusaram a obedecer ao decreto perverso do rei. Quando esse rei mandou que violassem o princípio básico de Deus, a preservação da vida, elas lhe desobedeceram.

Pare e pense por um momento. Os fundamentos do cristianismo evangélico — e até os da nossa nação — se apoiam na resistência e rebelião. Nós nos rebelamos contra uma igreja-mãe que disse:

"Creiam nisto e adorem conforme ordenamos". Nossos ancestrais, na época da Reforma, decidiram: "Não faremos isso. Vamos obedecer à Palavra de Deus". Muitos deles foram exilados, presos e até martirizados por tomarem essa posição.

No início da nossa nação, nossos pais se rebelaram contra um rei que disse: "Façam isso, de acordo com o que eu mandar". Nossos ancestrais responderam: "Não faremos isso. Vamos agir conforme a vontade de Deus". Por causa desses homens e mulheres corajosos que resistiram à autoridade ímpia, você e eu podemos gozar da liberdade religiosa e nacional.

Mesmo assim, devo concordar com Agostinho, que escreveu a respeito dessas mulheres hebréias: "Deus as recompensou pela sua piedade e não pela sua trapaça". Não acredito que a resposta falsa delas tenha agradado a Deus, mas creio que apesar disso ele as recompensou por fazer o que era certo a seus olhos. (Há também a possibilidade de que aquelas mães hebréias fossem realmente rápidas!)

Os problemas de Israel, porém, não terminaram com a recusa corajosa das parteiras. A fúria assassina do rei não conhecia limites. Frustrado e zangado, o Faraó expediu outro decreto: "Então ordenou Faraó a todo o seu povo, dizendo: A todos os filhos que nascerem aos hebreus lançareis no Nilo, mas a todas as filhas deixareis viver" (Êx 1:22).

As ordens de Faraó, por mais bárbaras que fossem, têm o seu equivalente contemporâneo... ao contrário. Na China comunista de hoje, só é permitido um filho aos casais. Muitas mulheres, ao ficarem sabendo o sexo do filho, levam a gravidez até o fim ou abortam. Se for menino, vive. Se for menina, é freqüentemente morta.

SOFRIMENTO, PARTEIRAS E ASSASSINATO 31

A data no calendário pode ter mudado desde os dias do Êxodo, mas a natureza humana não. A parte da obra redentora de Cristo, nosso coração é desesperadamente perverso. Já existia crueldade nos dias de Moisés, e continua existindo hoje. Os tiranos governavam no mundo antigo e governam ainda em nossos dias. A injustiça feriu os inocentes na época de Faraó, nos dias de Herodes, e continua imperando nesse nosso mundo sofisticado.

Nos dias do Êxodo, porém, havia também homens e mulheres prontos para defender a justiça, mesmo em face da morte, assim como há hoje. Deus sempre tem suas testemunhas!

LIÇÕES PARA REFLETIR

Enquanto reflito sobre essa seção panorâmica das Escrituras, sou atingido por três verdades fortes e sustentadoras de vida — verdades que vêm repetidamente à tona ao considerarmos a vida de Moisés.

AS DIFICULDADES NÃO APAGAM AS PROMESSAS DE DEUS.

Essas pessoas passaram por terríveis problemas, mas Deus prometera: "Enviarei um libertador". Quando as coisas ficam complicadas, é fácil concluir que Deus esqueceu suas promessas. O Livro de Êxodo nos mostra que quando Deus diz: "Prometo isso a você", ele nunca esquece. Você pode esquecer, eu posso esquecer. A nação inteira pode esquecer, mas Deus não pode esquecer.

Nessa era de corrupção e decadência moral, num período em que a cúpula do governo do país fervilha em razão dos escândalos e é destroçada pelos partidos políticos, não pense nem por um momento que Deus tirou férias ou pôs suas promessas em lugar errado. Ele não adormeceu na direção. Nem precisa dos telejornais para manter-se a par dos últimos acontecimentos. No momento adequado, na hora determinada antes da criação do mundo, ele enviará seu Filho... novamente. O poderoso Rei dos reis voltará para livrar o povo comprado com o seu sangue. Voltará com justiça. A terra pode derreter e as estrelas caírem do céu, mas o Deus

32 MOISÉS: UM HOMEM DEDICADO E GENEROSO

vivo não se esquecerá do que prometeu. E essa é apenas a primeira lição.

O TRATAMENTO CRUEL NÃO ESCAPA AOS OLHOS DE DEUS.

Em Êxodo 7-8, Deus disse mais tarde a Moisés:

Disse ainda o Senhor: Certamente vi a aflição do meu povo, que está no Egito, e ouvi o seu clamor por causa dos seus exatores. Conheço-lhe o sofrimento, por isso desci a fim de livrá-lo da mão dos egípcios...

Você às vezes imagina que Deus não nota os momentos e provas difíceis, cruéis, pelos quais passa? E possível que fique tão desanimado, tão magoado, que comece a pensar que Deus não está ciente de suas circunstâncias ou, se está, não se importa. Essa é uma mentira do diabo.

Deus sempre sabe o que acontece. E ele se importa muitíssimo. Como vamos ver, ele fará tudo o que é necessário para salvar seu povo. Talvez seja chamando você para sua casa, para estar com ele, ou partindo um oceano ao meio, a fim de que você possa caminhar em terra seca. O livramento dele pode não chegar de acordo com o seu horário, ou da maneira que você espera, mas chegará na melhor hora, na hora certa. Ele não abandonará os que são seus.

PROVAÇÕES PESADAS NÃO DIMINUEM O INTERESSE DE DEUS.

Por mais severa que seja a prova que você tenha de enfrentar, ela nunca irá sobrepujar o interesse dele. Lembra-se de como Deus recompensou as parteiras? Ele tudo vê! Tudo!

Este talvez tenha sido um ano difícil para você. O futuro à sua frente pode parecer sombrio ou ameaçador. Você quer muito ser um homem ou uma mulher de Deus, mas está sob a mira de uma arma. Em seus raros momentos de tranqüilidade, você pode se perguntar: Onde está Deus?

SOFRIMENTO, PARTEIRAS E ASSASSINATO 33

Ele está bem ao seu lado, meu amigo. Nunca o deixou. Jamais tirou os olhos de você, nem sua atenção foi desviada por outros assuntos. Nem mesmo por um segundo. Ele jamais cessou de querer seu bem, pensar em você, considerar suas circunstâncias e amá-lo com uma paixão e intensidade além de qualquer compreensão.

Hudson Taylor escreveu certa vez: "Não importa quão grande seja a pressão; o que realmente importa é onde ela se encontra. Quer se ponha entre você e Deus, quer pressione seu coração".2

Não foi por acidente que você nasceu nesta era específica, nesta conjuntura da história em determinado país e neste mundo. Deus está buscando um homem ou uma mulher que obedeça ao seu propósito e aproveite o dia para glorificá-lo.

Sim, você pode sentir-se desqualificado, inculto, destreinado, sem talentos ou até indigno. Contudo, como veremos nos próximos capítulos, essas são excelentes qualificações para Deus fazer uma obra poderosa.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando você olha para os longos anos em que Israel esperou no Egito antes da libertação, consegue confiar que Deus também age no tempo certo nas esperas da sua própria vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que maneira a história de José, que transformou a traição dos irmãos em provisão para todo um povo, fortalece a sua fé de que Deus aproveita até as injustiças que você sofreu?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Em que área da sua vida você tem se sentido como os hebreus no Egito, feito para Canaã mas vivendo em terra estranha, e o que isso revela sobre seus anseios mais profundos?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Nascido Depois da Meia-Noite$t$, 2,
$conteudo$O Deus que adoramos e servimos é perfeito em todos os aspectos de seu ser. E também realista. Ele diz a Isaías: "Porque os meus pensamentos não são os vossos pensamentos, nem os vossos caminhos os meus caminhos, diz o Senhor, porque, assim como os céus são mais altos do que a terra, assim são os meus caminhos mais altos do que os vossos caminhos, e os meus pensamentos mais altos do que os vossos pensamentos" (Is 55:8-9).

Davi nos lembra: "Pois ele conhece a nossa estrutura, e sabe que somos pó" (SI 103:14). Deus sabe muito bem que os seus pensamentos e caminhos superam infinitamente os nossos. Ele sabe que nos criou como seres finitos, usando alguns quilos de pó do jardim. Compreende isso. Sabe como trabalhar com os que são limitados de entendimento e frágeis em sua estrutura.

Minha pergunta é: por que não compreendemos? Por que esperamos perfeição de nós mesmos e de nossos companheiros?

Em todos os meus anos de estudos dos personagens bíblicos, não encontrei um único episódio de efeito instantâneo para Deus. Entre todos os heróis bíblicos, só Daniel (e possivelmente José e Josué) aparece nas páginas das Escrituras sem registros de lapsos e faltas. Em minha própria experiência, em mais de trinta e cinco anos de

36 MOISÉS: UM HOMEM DEDICADO E GENEROSO

ministério, não consigo lembrar-me de nenhum crente que tenha sido erguido do chão para em seguida sobrevoar rumo à estratosfera espiritual, permanecendo ali até a morte.

Você e eu, porém, ficamos terrivelmente impacientes com nossas falhas e limitações e uns com os outros. Ficamos desesperados porque pensamos que, a essa altura, deveríamos estar na órbita espiritual, quando na verdade continuamos ainda roçando apenas o cume das árvores, ou tentando levitar. Acreditamos que devemos conquistar vastos territórios para o reino instantânea, constante e efetivamente, como um Alexandre, o Grande, espiritual. Quando isso não acontece — quando a vitória parece fugir-nos — desanimamos.

Sempre que me sinto assim, preciso rever a vida de Moisés. Ela me revigora. Eis aqui um homem que não se tornou útil para Deus senão aos oitenta anos. Moisés começou sua carreira espiritual muito depois que a maioria de nós normalmente está sentada na cadeira de balanço ou plantando flores. E adivinhe só! Deus usou-o poderosamente.

A vida de Moisés, segundo o Livro de Atos, capítulo 7, pode ser dividida em três segmentos de quarenta anos cada. Ele passou seus primeiros quarenta anos no Egito, sendo cuidado pela mãe e aprendendo nas escolas egípcias. Passou seu segundo ciclo de quarenta anos com o povo hebreu no deserto, nutrido pela solidão e ensinado por Deus. Seus últimos quarenta anos passou-os no deserto com o povo hebreu, alimentado pelas provações, desânimo e testes, ensinado pela lei que recebeu das mãos do próprio Deus.

Dwight L. Moody fez o seguinte comentário sobre esta notável biografia. "Moisés," observou Moody, "passou seus primeiros quarenta anos pensando que era alguém. Os segundos quarenta anos passou aprendendo que era um ninguém! Os últimos quarenta ele os passou descobrindo o que Deus pode fazer com um ninguém".1

Você e eu, embora talvez nunca alcancemos a idade de cento e vinte anos, vivemos em um desses três estágios neste momento. Ou pensamos que somos alguém, ou avançamos o suficiente para compreender que não somos ninguém, ou finalmente descobrimos o que

NASCIDO DEPOIS DA MEIA-NOITE 37

Deus pode fazer com um ninguém! É bem encorajador, não é? Deus nunca desiste de nós!

A melhor das três é, naturalmente, a fase final. Moisés já havia soprado as oitenta velas em seu bolo de aniversário antes que esse último fato começasse a se enraizar em sua alma (e só depois de uma forte discussão com o Todo-Poderoso). Depois de aprender a lição — depois da verdade do desejo do céu e da possibilidade de ser usado pelo Senhor finalmente ter dominado seu coração —, a própria terra se abalou e os mares ferveram com o poder divino que irradiava da sua vida.

Mesmo que não observemos mais nada nesta viagem com Moisés, vamos aprender sobre os cinco passos de um homem que descobriu tarde na vida (mas não demasiado tarde) o que significava servir a Deus, a despeito da idade.

Dei a este capítulo o título "Nascido Depois da Meia-Noite", que sugere um nascimento extemporâneo. E foi mesmo.

Fui admirador de Sir Winston Churchill durante a maior parte da minha vida adulta. Sua vida, os discursos que pronunciou e sua conversa ressoante nunca deixaram de me inspirar. Recordei recentemente seu discurso à Câmara dos Comuns no dia 17 de abril de 1945, cinco dias depois da morte de seu amigo, o presidente Franklin D. Roosevelt.

Churchill disse ao Parlamento: "Com Franklin Roosevelt morreu o maior amigo americano que as ilhas já tiveram. Ele morreu com o escudo, e podemos dizer muito bem, com o escudo da batalha. Que morte invejável foi a sua".2

Para Churchill, esse famoso presidente desapareceu numa época invejável. Hitler havia morrido, seu império perverso se achava em ruínas. A guerra no Pacífico seguia rumo à vitória. As forças da tirania não mais engoliriam o mundo livre. Roosevelt deslizou para a eternidade enquanto via seus objetivos cumpridos.

38 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Do mesmo modo que FDR teve uma morte invejável, Moisés, por outro lado, teve um nascimento nada invejável. Nascido judeu numa terra governada por um déspota anti-semita, Moisés entrou no mundo em condições desesperadas. Seu povo, os hebreus, sofria horrivelmente sob os golpes da chibata. Eles eram oprimidos, odiados, maltratados. Muitos foram assassinados pelo Faraó, o Hitler dos dias de Moisés.

TEMPOS DESESPERADOS

O menino Moisés entrou num mundo de crueldade, sofrimento e desespero. Ele começou a vida numa época sombria, muito depois da meia-noite... o dia mais negro da história dos hebreus até então. Contudo, a vida continuou para o povo judeu. Homens e mulheres se casavam, cuidavam de seus filhos e tentavam viver como família no cadinho da opressão e da brutalidade. E claro que desfrutavam de alguns momentos de alívio — talvez a festa ocasional dos alhos e do alho-porro —, mas o medo e o temor anuviavam até as mais agradáveis ocasiões.

Nos primeiros versículos do capítulo 2 de Êxodo, lemos a respeito de um casamento celebrado sob essas condições difíceis:

"Foi-se um homem da casa de Levi e casou com uma descendente de Levi. E a mulher concebeu e deu à luz um filho; e, vendo que era formoso, escondeu-o por três meses" (Êx 2:1-2).

Moisés tornou-se um grande homem de fé porque seus pais tinham fé. Eram levitas, evidentemente comprometidos com as coisas de Deus. Sabemos disso ao ler em Hebreus, capítulo 11: "Pela fé Moisés, apenas nascido, foi ocultado por seus pais, durante três meses, porque viram que a criança era formosa; também não ficaram amedrontados pelo decreto do rei" (Hb 11:23).

Esse rei era Faraó, o governante avarento do Egito. Ficamos sabendo aqui que essa criança foi protegida durante três meses pela fé. Seus pais temiam mais o Deus dos céus do que um rei terreno. Não deve ter sido fácil esconder um menino sadio. Mas, em vista de sua reverência a Deus e confiança no Senhor vivo, eles fizeram exatamente isso.

NASCIDO DEPOIS DA MEIA-NOITE 39

Embora Êxodo não mencione, Moisés não era o primogênito. Ele tinha uma irmã mais velha, Miriã, ainda menina, e um irmão mais velho chamado Arão, três anos mais velho.

Como lemos no segundo versículo, os pais de Moisés esconderam seu terceiro filho por três meses, ao verem que era um menino bom (ou bem-formado). A palavra em hebraico pode significar muitas coisas. Várias das nossas melhores traduções usam o termo "formoso". Alguns acham que Anrão, o pai, e Joquebede, a mãe, olharam para o menino e notaram uma beleza singular nele. Isso francamente não me surpreende. A maioria dos pais, quando olha para o filho recém-nascido, nota nele uma beleza singular.

Já cheguei a olhar para o rostinho vermelho de uma criancinha que tinha acabado de nascer e vi-me forçado a exclamar: "Como ele é bonito!" Algumas vezes fica difícil para o pastor encontrar o que dizer. ("É verdade, esse nenê é legal.") Mas todos os novos pais do mundo não vêem senão beleza em seus recém-nascidos.

Não penso, porém, que esse tipo de reação preconceituosa é o que as Escrituras indicam aqui. Creio que a Bíblia está nos dizendo que o pequeno Moisés era realmente bonito, bem lá no fundo da sua pequenina alma. Seus pais piedosos provavelmente viram nele algo mais que a beleza física. Deus talvez lhes revelasse no segredo que estava no coração deles, que aquele menino tinha um destino muito especial.

Independentemente do que tenham pensado sobre o nascimento dele, souberam imediatamente que o bebê corria grande perigo. A fim de manter vivo o filho, o pai e a mãe teriam de arriscar tudo. Se não o tivessem escondido cuidadosamente, as tropas de Faraó teriam pego o menino e o lançado aos crocodilos, por ordem do rei.

Como seria esconder uma criança durante três meses numa choupana? Lembro-me bem que nosso primogênito nunca dormiu uma noite inteira durante dezoito desgastantes meses. Eu às vezes ansiava por um cesto e um rio Nilo bem perto! (Estou só brincando, Curt.) Como teríamos conseguido esconder esse nosso filho por três meses? Com os pulmões que tinha, ninguém conseguiria escondê-lo nem por três minutos sequer.

40 MOISÉS: UM HOMEM DEDICADO E GENEROSO

No caso de Moisés, logo chegou o dia em que ele não podia mais ser escondido. Era preciso mudar de esconderijo. Você imagina a tensão e o medo daquela família? "Faça esse menino se calar! Miriã, você tem de mantê-lo quieto ou vamos perdê-lo. Arão, fique longe do nenê. Não o provoque, senão ele vai chorar. Shh! Silêncio. Acho que alguém vem descendo a estrada!"

Os egípcios talvez tivessem instituído buscas de casa em casa por causa dos boatos de bebês escondidos. Pelo menos alguns hebreus deveriam ter, sem dúvida, colaborado com as autoridades, temendo pelas próprias vidas. Qualquer que fosse o motivo, os pais de Moisés chegaram a uma terrível conclusão: não podiam mais manter o segredo. Tinham de fazer algo. Naquele momento de agonia, entre tristeza e desespero, Joquebede inventou um plano criativo.

MEDIDAS DESESPERADAS

Não podendo, porém, escondê-lo por mais tempo, tomou um cesto de junco, calafetou-o com betume e piche, e, pondo nele o menino, largou-o no carriçal à beira do rio.

Êxodo 2:3

Com grande cuidado e ternura, Joquebede preparou uma substância parecida com betume, encontrada nas margens do Nilo, e cobriu as laterais de um pequeno cesto de junco, tornando-o impermeável. Podemos supor que ela pôs alguns pedaços de tecido macio no cestinho flutuante e talvez um pouco de palha. Depois, com o coração provavelmente partido, escondeu o cesto entre os juncos à beira do rio.

Durante toda a minha vida, até que comecei a pesquisar mais fundo essa passagem, visualizei Joquebede lançando o cesto na correnteza do Nilo, até que ele chegasse ao local onde a princesa costumava banhar-se, parando ali. O texto, porém, não afirma isso. Ele diz: "...e, pondo nele o menino, largou-o no carriçal à beira do rio" (grifo meu).

NASCIDO DEPOIS DA MEIA-NOITE 41

Nunca tive oportunidade de ver o rio Nilo, mas já vi uma porção de juncos junto aos rios. Você também talvez os tenha visto. Apesar de muito flexíveis, são plantas fortes. A mãe de Moisés provavelmente entrou na água e prendeu o cesto num lugar especial. Ela não o empurrou simplesmente na correnteza, cantando "t> que será será...", mas colocou-o exatamente onde queria. Como já disse, Joquebede tinha um piano.

Encontramos aqui uma mulher com grande fé em Deus. Não se tratava de uma fé insensata! Pelo contrário, ela procurou preparar o melhor plano possível em meio àquelas terríveis circunstâncias, deixando os resultados finais para um Deus soberano.

Enquanto reflito sobre esta passagem, tenho a certeza de que essa mãe sábia havia identificado certos hábitos na filha de Faraó. Ela sabia que num certo lugar, numa certa hora, a princesa ia banhar-se no rio. Pensou também que, se pusesse o cesto no lugar certo, na ocasião certa, a princesa e suas criadas o veriam, ou pelo menos ouviriam o choro do bebê. E foi precisamente isso que aconteceu.

Sua irmã ficou de longe, para observar o que lhe haveria de suceder. Desceu a filha de Faraó para se banhar no rio, e as suas donzelas passeavam pela beira do rio... (w. 4-5).

Ninguém me convence que Joquebede não ensaiou várias vezes todo o plano com Miriã — onde Miriã ficaria, como agiria, o que diria. Posso até ouvir a voz de Joquebede: "Faça parecer uma surpresa, Miriã. Algo espontâneo. Você pode fazer isso, querida. Sei que pode. E estarei esperando. Estarei bem ali, pronta para aparecer".

Naquela conjuntura da história do Egito, duas filhas de Faraó reinaram por algum tempo como co-regentes sobre uma região do Nilo. Pode ser que Joquebede soubesse disso e tivesse colocado deliberadamente sua preciosa trouxa perto de uma dessas co-regentes. Joquebede esperava que a princesa, pessoa de grande influência, visse a criancinha indefesa e se apiedasse dela. Os egípcios consideravam o Nilo um de seus deuses. Será que a princesa acreditaria que um de seus deuses lhe trouxera o menino? Joquebede achava que

42 MOISÉS: UM HOMEM DEDICADO E GENEROSO

sim, mas como ter certeza? Só podia pôr seu filho e a si mesma à mercê de Deus. Não restava mais nada a fazer.

Chegou então o momento. Como se pegasse uma deixa, a princesa desceu para banhar-se no Nilo. "Desceu a filha de Faraó para se banhar no rio, e as suas donzelas passeavam pela beira do rio; vendo ela o cesto no carriçal, enviou a sua criada, e o tomou" (v. 5).

Qualquer mãe que leia estas palavras não encontra nenhuma dificuldade em imaginar os sentimentos de Joquebede na ocasião. Você não pode vê-la atrás de uma árvore ou talvez atrás de alguns juncos, a distância... na ponta dos pés... apertando com força as mãos... prendendo a respiração? Pode imaginar sua garganta seca? O coração pulsando no peito? Como poderia saber o que faria a mulher egípcia? Ela talvez tivesse alguma noção, mas como se certificar? A princesa poderia muito bem obedecer ao decreto severo do pai, mergulhando o bebê na água, afogando-o bem ali. Não havia segurança. Tudo o que Joquebede podia fazer era confiar em Deus para conceder àquela egípcia um coração maternal.

Durante as escavações arqueológicas feitas em anos recentes, pesquisadores descobriram um ritual religioso antigo associado ao deus do Nilo. Ele incluía uma declaração de fé que muitos egípcios devem ter repetido, a saber: "Não afligi homem algum. Não fiz chorar nenhum homem. Não recusei leite às crianças de peito".

Será que a princesa teria feito tal juramento? É bastante possível. Ela talvez tenha tirado esse bebê do meio dos juncos como se o retirasse do ventre do próprio rio. As Escrituras, entretanto, dizem simplesmente: "Abrindo-o viu a criança; e eis que o menino chorava. Teve compaixão dele, e disse: Este é menino dos hebreus" (v. 6).

Quando a princesa viu a criança, ela a reconheceu como sendo hebréia, talvez pertencente a uma mãe que não teve coragem de afogar o próprio filho. O que uma filha de Faraó devia fazer agora? Tinha um bebê nas mãos e ele parecia faminto.

Josefo acrescenta aqui um pensamento interessante. Não sei se é verdadeiro, mas sei que é interessante. O historiador antigo diz que a princesa levou o menino a várias de suas criadas para ver se uma delas podia amamentá-lo, mas sem sucesso. Só nesse

NASCIDO DEPOIS DA MEIA-NOITE 43

ponto é que Miriã surge para transmitir a mensagem que decorara com tanto cuidado.

Essa é uma boa história, mas não está nas Escrituras. Eis o que a Bíblia diz: "Então disse sua irmã à filha de Faraó: Queres que eu vá chamar uma das hebréias que sirva de ama, e te crie a criança?" (v. 7)

Miriã nunca contou que a ama hebréia era a própria mãe do bebê. Claro que não! A menina havia treinado para que tudo parecesse natural e espontâneo, como se disesse: "Veja só! Talvez eu possa arranjar alguém para ajudá-la, princesa".

"Respondeu-lhe a filha de Faraó: Vai. Saiu, pois, a moça e chamou a mãe do menino" (v. 8).

Pense um pouco em Joquebede. Em sua ansiedade, ela pode ter desejado saltar para aquela margem do rio. Mas tinha de representar o papel de uma escrava respeitosa, porém desinteressada. Era necessário manter a calma. Não podia mostrar sinais de reconhecimento. Não podia permitir que seus olhos brilhassem de amor e ternura pela criança que chorava. Nada de mãos trêmulas nem de respiração entrecortada. Nem de voz embargada e lágrimas nos olhos. A vida de seu pequeno filho estava em perigo!

Veja o que aconteceu em seguida: "Então lhe disse a filha de Faraó: Leva este menino, e cria-mo; pagar-te-ei o teu salário. A mulher tomou o menino, e o criou" (v. 9).

Que coisa fantástica, não? Ela não só recuperou o filho da morte, não só obteve sanção e proteção oficial da filha de Faraó, como também ganhou para criá-lo! Isso, meu amigo, não é coincidência. É a mão de Deus. As Escrituras nos dizem: "Sendo o caminho dos homens agradável ao Senhor, este reconcilia com eles os seus inimigos" (Pv 16:7). Nunca duvide disso. Quando os seus caminhos agradarem realmente ao Senhor, ele cuidará dos seus inimigos um a um, dia a dia.

FÉ E PLANEJAMENTO

Joquebede tinha fé. Ela também preparou um plano muito criativo.

Gostaria de fazer uma pausa e refletir sobre essa tensão entre o planejamento cuidadoso e a fé sincera. Esses elementos se excluem

44 MOISÉS: UM HOMEM DEDICADO E GENEROSO

mutuamente? De modo algum! Contudo, ao conversar com certos crentes, você talvez seja levado a pensar de outro modo.

Aconselhei homens e mulheres desempregados que me disseram: "Estou esperando no Senhor para conseguir um emprego".

"Ótimo", respondo, "e a quem entregou seu currículo?" "Olhe, não fiz isso. Estou apenas esperando em Deus." "Verdade?" eu digo. "Espero então que não se importe de passar fome por algum tempo."

O velho lema dos soldados durante a Revolução se aplica a muitos aspectos da vida: "Confie em Deus, mas mantenha a pólvora seca!" Em outras palavras, ponha a vida nas mãos do Salvador, mas fique alerta. Faça tudo o que pode para preparar-se para a batalha, compreendendo que o resultado final depende do Senhor Deus.

Andar nos caminhos da fé não significa que você deixe de pensar. Confiar em Deus não implica tornar-se desmazelado, preguiçoso ou apático. Que distorção da fé bíblica! Você e eu precisamos confiar em Deus com relação às nossas finanças, mas isso não nos dá permissão para gastar insensatamente. Devemos confiar em Deus para termos segurança quando dirigimos, mas não será prudente ultrapassar numa curva fechada. Confiamos nossa saúde a Deus, mas isso não significa que podemos nos entregar a uma vida desregrada, ficar acordados até tarde da noite e nos alimentar apenas com batatas fritas, sem que haja conseqüências.

Agir insensata ou irrefletidamente, esperando que Deus o socorra quando as coisas se tornam difíceis, não é de modo algum fé. E presunção. A sabedoria diz para fazer tudo o que esteja dentro das suas forças e depois confiar nele para realizar aquilo que você não consegue sozinho. A fé e o planejamento cuidadoso andam de mãos dadas. Sempre andaram.

Susanna Wesley, a grande dama cristã do passado, deu à luz dezenove filhos. Você talvez seja uma mulher de muita fé, mas se tiver filhos, é melhor que tenha mais do que fé em seu lar. Pode imaginar como seria sustentar tal prole? (Na verdade, alguns dos Wesley morreram na infância.) Mas o décimo quinto filho nascido nesse lar foi um garoto chamado John... John Wesley. O filho caçula, Charles,

NASCIDO DEPOIS DA MEIA-NOITE 45

escreveu mais de oito mil hinos. No auge da sua carreira, Charles declarou que devia muito à fé e ao exemplo de sua mãe.

Se estudar a vida da sra. Wesley, porém, vai descobrir que ela era mais do que uma mulher de fé. Essa mãe prudente, de visão clara, tinha estratégias cuidadosamente desenvolvidas para criar os filhos. De fato eia aplicava vinte e um princípios na educação dos filhos e filhas. Este é um deles: "Quando meu filho faz um ano, e alguns deles antes disso, en'sino a ele a temer a vara e a chorar baixinho, escapando assim de novas correções que de outro modo receberia".

Esse é um plano, não é? Ela não só confiava no Senhor, como empregava a vara quando necessário. Você não cria dezenove filhos sem uma vara. Você pode ter toda a fé deste mundo, mas se não tiver um plano de disciplina consistente, dirige um circo, não uma família. Susanna Wesley tinha tanto uma fé profunda e perene em Deus como um plano.

E isso que me impressiona em Joquebede. Ela confiava tanto no Senhor que o Espírito Santo a incluiu nos "Exemplos da Fé" de Hebreus 11. O que Moisés assimilou em sua vida muito provavelmente foi recebido de sua mãe.

No entanto, naquela manhã sombria, quando Joquebede pôs seu filhinho num pequeno cesto coberto de piche, ela também tinha um plano. Pode ter sido desesperado, mas aqueles eram tempos desesperados. Ela pôs o plano em ação, compreendendo plenamente que os resultados dependiam das mãos bondosas de Deus.

O resultado? Deus recompensou sua fé muito além de suas maiores esperanças. A filha de Faraó pagou Joquebede para criar o próprio filho. Pagou! Quantos dentre as multidões de escravos hebreus eram pagos pelo seu trabalho? O melhor de tudo, no entanto, foi ter o menino de volta em seus braços. Ela tomou o pequenino "e o criou", como diz o versículo nove.

Não sabemos por quanto tempo o menino ficou com ela. Mas o versículo seguinte começa com uma insinuação intrigante: "Sendo o menino já grande, ela o trouxe à filha de Faraó, da qual passou ele a ser filho. Esta lhe chamou Moisés, e disse: Porque das águas o tirei" (v. 10).

46 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Esse registro sugere que ela manteve o menino em sua companhia mesmo depois de desmamado, até os três ou quatro anos. Ficou com o filho enquanto ele crescia ("já grande"). Na graça de Deus e no plano dele, talvez tenha sido permitido que Moisés permanecesse com a família tempo suficiente para firmar suas raízes hebréias e aprender sobre o Deus de Abraão, Isaque e Jacó.

Sabemos que Joquebede não ficou com ele até a idade adulta, porque lemos no versículo 11: "Naqueles dias, sendo Moisés já homem, saiu a seus irmãos, e viu os seus labores penosos..."

Moisés não era então adulto quando deixou sua casa; mas estava crescendo. Joquebede sem dúvida estava com ele durante o que chamaríamos de anos pré-escolares. Pode apostar que essa mãe valorizou cada um daqueles dias com seu filho caçula. Seria tão bom se as mães de nossa era também valorizassem com o mesmo fervor esses anos com seus pequeninos!

EM APUROS

Posso entrar em apuros aqui, mas que assim seja. (Já passei por essa dificuldade antes e provavelmente passarei novamente.) Considerando o exemplo de Joquebede, sinto-me constrangido a dizer que, se você é mãe de pré-escolares, deve pensar e orar muito antes de entregar seus filhos para outra pessoa criar.

Não desejo suscitar controvérsias nem provocar sentimento de culpa. Só quero declarar o que considero princípios bíblicos — os quais devem ser cuidadosamente considerados. Não estou escrevendo aqui para mães solteiras... nem para todas as mães que trabalham fora. Não me dirijo às mães que trabalham fora e que têm filhos mais velhos na escola. Escrevo especialmente às mães com filhos em idade pré-escolar. Peço que reflitam com todo o cuidado sobre esses anos irrecuperáveis e cruciais da vida e do desenvolvimento de seu filho. Se precisa trabalhar, se não existe outra opção, insisto então que trabalhe o mínimo de horas possível e certifique-se de que seu filho esteja recebendo o melhor cuidado que alguém lhe possa dar. Uma vez dito isso, ainda assim mantenho a posição de que é melhor

NASCIDO DEPOIS DA MEIA-NOITE 47

sacrificar quase toda meta material — exceto comida na mesa e um teto acima da cabeça — do que sacrificar esses anos preciosos e oportunos com seus filhos.

Fico impressionado com a maneira como Deus exalta o papel materno. O pai de Moisés não é mencionado nesses primeiros versículos do capítulo 2 de Êxodo. Hebreus 11:23 indica certamente que ele participou na decisão de esconder o filho e que estava disposto a confiar em Deus em face do grande risco para a própria vida. Mas é Joquebede que desempenha o papel principal em salvar e criar o filho. Isso reforça o meu ponto de vista: ninguém substitui a mãe para uma criança em idade pré-escolar. Ninguém.

UMA CASA NOVA E ESTRANHA

A mulher tomou o menino, e o criou. Sendo o menino já grande, ela o trouxe à filha de Faraó, da qual passou ele a ser filho. Esta lhe chamou Moisés, e disse: Porque das águas o tirei

Êxodo 2:9-10

E possível vislumbrar sob a superfície desses dois versículos um mar profundo de emoções. O menino Moisés ganhou subitamente um lar novo. E que mudança de ambiente! Da segurança de sua família amorosa para um lugar estranho, solitário e desconhecido. Do alojamento de escravos para o palácio. Do simples e familiar para o diferente e opressivo. Isso não era como descer o quarteirão e achar-se em outra vizinhança, ou atravessar um estado para chegar a uma nova cidade; foi mais como estabelecer-se em um outro planeta.

E possível que em algum ponto do caminho você tenha passado por uma mudança assim radical e perturbadora. Você viu sua vida familiar destroçada pelo divórcio de seus pais. Mudou de uma casa para outra e a lembrança desses dias ficará para sempre em seu íntimo. É possível que tenha passado algum tempo num lar adotivo e se encontrou vivendo com completos estranhos. Conheci alguns que foram obrigados a viver em mais de uma dúzia de casas na fase de desenvolvimento. Vindo de um lar estável como o meu, estremeço ao imaginar tal experiência.

48 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Esses devem ter sido anos difíceis, solitários, para o jovem Moisés. Imagino que ele deva ter chorado noite após noite na privacidade de seu quarto no palácio, as lágrimas molhando os lençóis de linho reais. Sem o toque suave da mãe. Sem uma palavra de conforto do pai. Sem o sorriso da irmã Miriã ou as brincadeiras do irmão Arão. Embora a Escritura desça a cortina sobre esses anos, é fácil imaginar o garotinho abrindo o coração diante do Deus que aprendera a buscar.

Moisés não era, porém, o único a sofrer. Sua mãe também chorou. Tente imaginar Joquebede levando seu filhinho pela mão, afastando-se da choupana pobre no bairro em que habitavam os escravos hebreus. No refúgio de sua casa humilde, ela o havia amamentado e educado, ensinando-lhe o que sabia do Deus único e verdadeiro, o Deus dos céus e da terra. Ensinara ao filho as raízes hebraicas e talvez cultivasse em sua imaginação uma imagem de uma linda terra que ficava ao norte... uma terra prometida aos seus pais... chamada Canaã.

Joquebede estava praticamente certa de que nunca mais veria seu menino. Afinal de contas, que razão alegaria para justificar suas visitas? Ela era apenas sua ama. Uma escrava. Um membro de uma raça desprezada, rejeitada. Contudo, quando veio a ordem real, ela o preparou, lavou pela última vez a parte de trás de suas orelhas, penteou ternamente seu cabelo e o vestiu com a melhor túnica (provavelmente feita em casa e herdada de Arão). Como todos os meninos no mundo inteiro, Moisés deveria ter desejado levar alguns de seus tesouros... o equivalente antigo, suponho, de um saco de bolinhas de gude e algumas revistinhas em quadrinhos.

E seguiram então pelo caminho que levava ao palácio. EB. Meyer escreve com um toque de ternura: "O coração de mãe deve ter sofrido amargamente ao permitir que o filho entrasse no mundo desconhecido para além do portão do palácio; a pequena família deve ter-se sentido igualmente muito solitária depois que os últimos beijos foram trocados, as últimas instruções dadas e a última oração oferecida. Que multidão de pensamentos ternos, especulações curiosas e saudades devem ter seguido o menininho querido daquele lar hebreu, enquanto a mãe o levava à filha de Faraó, para tornar-se filho dela!"3

NASCIDO DEPOIS DA MEIA-NOITE 49

Tente visualizar essa cena triste. Moisés se tornou filho de uma outra mulher cujos valores eram completamente diferentes dos seus. Um estranho. Um idólatra. Um estrangeiro.

Como descobriremos pouco mais adiante na história, Moisés se tornou um estudante interessado numa escola inteiramente nova, destinada a prepará-lo para o trono. Estou convencido de que a filha de Faraó tinha em seu coração o desejo de fazer que Moisés se tornasse um dia Faraó do Egito. E isso quase aconteceu.

O filho adotivo da princesa entrou num mundo absolutamente estranho. Recebeu também um novo nome, que parece uma mistura de duas palavras: um termo egípcio que significa "filho" e outro hebreu que indica "tirar de". A filha de Faraó "tirou o filho" e o chamou Moisés. Ele não tinha esse nome até que ela o deu.

A surpreendente ironia do plano divino estava em que este, a quem a princesa dera um novo nome, alimentara, criara e educara em todos os costumes egípcios, veio a tornar-se o instrumento de juízo da própria corte onde crescera.

Essas imagens podem ter provocado algumas lembranças adormecidas em seu subconsciente. Você talvez sofra ao recordar certos aspectos de sua infância. E possível que também sinta que "nasceu depois da meia-noite", ou que jamais tenha sentido o que é aninhar-se confiante no amor de um pai ou de uma mãe. Sua vida familiar pode ter sido tensa ou até distante de suas primeiras lembranças. Do ponto de vista humano, seu nascimento pode ter ocorrido numa época difícil na vida de seus pais. Você talvez nunca tenha conhecido a segurança de pais fiéis que plantaram a fé em seu coração. Ao refletir sobre os anos de seu desenvolvimento, compreende que não tem muito de que se gabar.

Eu gostaria de transmitir-lhe uma belíssima mensagem, meu amigo. A mão de Deus em sua vida pode estar apenas começando a deixar sua marca. Essa ladeira íngreme que vem subindo há tanto tempo pode ser a rampa para um destino muito além de seus so-

50 MOISÉS: UM HOMEM DEDICADO E GENEROSO

nhos. Não acredito que haja algo como um nascimento acidental ou inoportuno. Você pode ter chegado a uma casa com dificuldades financeiras. Pode ter conhecido sofrimento, mágoas e insegurança desde os seus primeiros dias — mas, por favor, me escute: Você não foi um acidente.

Em algum ponto de minha juventude (e sem dúvida com as melhores intenções), meus pais me informaram de que eu fora um acidente, um filho não planejado. Concluí então que se nascera de um acidente, poderia muito bem viver como um acidente. E foi exatamente isso que fiz. Esse conhecimento moldou bastante minha vida naquela época.

Certo dia aprendi, no entanto, que Deus pode usar os chamados acidentes. Deus usa os que não parecem feitos para uma vida significativa. De repente, as peças do quebra-cabeça começaram a se ajustar. Passei a compreender que ele tinha uma razão e propósito específicos para que eu estivesse vivo. Posso ter sido um acidente para meus pais, mas, aos olhos dele, eu não era absolutamente isso. Passei a entender algumas das coisas que afetaram o coração de Davi, discernimentos que o levaram a escrever estas palavras de reverência e adoração:

Tu criaste todas as partes internas do meu corpo; Tu uniste todas essas partes para formar o meu corpo, enquanto eu ainda estava no ventre de minha mãe.

Eu te agradeço por me teres criado de maneira tão perfeita e maravilhosa! O teu trabalho é um verdadeiro milagre e na minha alma sei disso muito bem.

Tu conhecias perfeitamente cada parte do meu corpo enquanto eu ainda estava sendo formado no ventre de minha mãe, como a semente que cresce debaixo da terra.

Antes mesmo de o meu corpo tomar forma humana, tu já havias planejado todos os dias da minha vida; cada um deles estava registrado no teu livro!

Senhor, como são importantes para mim os teus pensamentos sobre a vida! São tantos que não consigo contar; são como

NASCIDO DEPOIS DA MEIA-NOITE 51

os grãos de areia nas praias. A cada novo dia, quando acordo, sinto que fico mais perto de ti.

Salmo 139:13-18, Bíblia Viva

Embora minha vida não tivesse sido tudo o que eu queria, ou tudo que deveria ser ou poderia ter sido, Deus não tinha ainda ter- minado sua obra em mim!

As boas notícias são, portanto, estas: ele também não terminou em você. De modo algum!

Moisés poderia perfeitamente se ter tornado um jovem amargo, cheio de ira em seu coração. Poderia ter ficado ressentido com sua mãe biológica, desprezado sua nova situação, lutado contra o sistema e jamais se ter tornado um indivíduo destinado à grandeza. Mas não fez isso. Pelo contrário, permaneceu, aprendeu, cresceu, confiou e jamais esqueceu suas raízes num Deus eterno e soberano.

Ao ler estas palavras, você talvez pense num registro tão negro quanto a meia-noite. Mas guardo uma grande expectativa para você. "Porque não passa de um momento a sua ira; o seu favor dura a vida inteira. Ao anoitecer, pode vir o choro, mas a alegria vem pela manhã" (SI 30:5). Veremos isso demonstrado de maneira surpreendente na vida de Moisés. Você também irá experimentar essa manhã em sua vida, ao recusar-se a viver na amargura do passado, confiar num Deus soberano, beber profundamente da sua graça e esperar que ele faça uso de sua pessoa em seu grande plano.

Deus não comete erros, meu amigo. Ele é capaz de pegar sua vida, com todos os seus sofrimentos, dores, remorsos, oportunidades perdidas e usar você para a glória dele.

Não esqueça a promessa dele: a alegria vem pela manhã. Veja! O sol já está começando a surgir.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Se Deus só usou Moisés poderosamente aos oitenta anos, o que isso diz sobre a impaciência que você sente diante das suas próprias falhas e da demora em ver propósito na sua vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em qual das três fases de Moisés você se reconhece hoje: pensando que é alguém, descobrindo que é ninguém, ou aprendendo o que Deus faz com um ninguém?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Os pais de Moisés temeram mais a Deus do que ao decreto do rei e por isso protegeram seu filho pela fé; em que situação atual Deus está pedindo que você tema mais a Ele do que às ameaças à sua volta?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Vontade de Deus, a Meu Modo$t$, 3,
$conteudo$U ma coisa é fazer a vontade de Deus, outra é realizá-la do modo e no tempo de Deus. Vamos imaginar que Deus chame você para o serviço cristão. Você sabe, em seu coração, que o plano dele para sua vida é que venha um dia a se envolver em algum aspecto do ministé- rio em tempo integral. Se não tiver cuidado, poderá facilmente começar a mexer os pauzinhos por baixo dos panos. Pode acabar competindo por algum cargo ou púlpito prestigioso. Pode manipular as situações até que, com o tempo, acabe prostituindo de fato o chamado que recebeu de Deus.

Você desejava fazer a vontade de Deus, mas resolveu executar esse plano a seu modo; tomou as rédeas nas mãos e acabou perdendo as bênçãos dele.

Vamos tornar as coisas um pouco mais pessoais. Deus deixou claro para você que ele nem deseja nem exige que permaneça soltei- ro. Ele sabe que você se sente solitário, sabe que não tem o dom do celibato e sabe que o tempo está passando e as probabilidades, dimi- nuindo.

Em algum ponto, se não proteger o coração, você pode chegar até a dizer ao Senhor: "Está bem, Deus. Conheço seu plano. Quer que eu me case. Agora, por favor, fique de lado durante alguns me-

54 MOISÉS: UM HOMEM DEDICADO E GENEROSO

ses. Quando eu chegar ao altar, avisarei. Nessa hora, gostaria que viesse e abençoasse a união, então voltaremos aos seus planos e faremos a sua vontade".

Está vendo como isso funciona? Você diz que deseja cumprir a vontade de Deus, mas, mediante manipulação, concessões e ajuda de outros, você consegue a pessoa da sua escolha. Só então redescobre subitamente a Deus e ora: "Ó, Senhor, peço que abençoe esta união. Faça com que seja sólida e boa, porque, como me orientou, estou me casando hoje".

Você talvez se console um pouco ao saber que isso não é novidade. O problema remonta a um homem que se esforçou para tornarse altamente qualificado em seu campo de empreendimento, mas provou ser completamente inútil, apesar de suas credenciais como um líder de homens culto, capaz e bem-educado. Como provavelmente já deduziu, estou me referindo a Moisés.

Vamos voltar ao relato bíblico em Êxodo, capítulo 2.

Naqueles dias, sendo Moisés já homem, saiu a seus irmãos, e viu os seus labores penosos; e viu que certo egípcio espancava um hebreu, um do seu povo. Olhou de uma e de outra banda, e vendo que não havia ali ninguém, matou o egípcio, e o escondeu na areia. Saiu no dia seguinte, e eis que dois hebreus estavam brigando; e disse ao culpado: Por que espancas o teu próximo?

O qual respondeu: Quem te pôs por príncipe e juiz sobre nós? pensas matar-me, como mataste o egípcio? Temeu, pois, Moisés, e disse: Com certeza o descobriram.

Informado desse caso, procurou Faraó matar a Moisés; porém Moisés fugiu da presença de Faraó, e se deteve na terra de Midiã; e assentou-se junto a um poço.

Êxodo 2:11-15

A VONTADE DE DEUS, A MEU MODO 55

Antes de continuarmos, precisamos verificar esse mesmo evento de um ângulo diferente, através da lente de outra câmera. No Livro de Atos do Novo Testamento, o diácono Estêvão também faz um registro inspirado da mesma história. Dedique algum tempo para ler suas palavras com atenção:

Por esse tempo nasceu Moisés, que era formoso aos olhos de Deus. Por três meses foi ele mantido na casa de seu pai; quando foi exposto, a filha de Faraó o recolheu e criou como seu próprio filho. E Moisés foi educado em toda a ciência dos egípcios, e era poderoso em palavras e obras.

Quando completou quarenta anos, veio-lhe a idéia de visitar seus irmãos, os filhos de Israel. Vendo um homem tratado injustamente, tomou-lhe a defesa e vingou o oprimido, matando o egípcio. Ora, Moisés cuidava que seus irmãos entenderiam que Deus os queria salvar, por intermédio dele; eles, porém, não compreenderam. No dia seguinte, aproximou-se de uns que brigavam, e procurou reconduzi-los à paz, dizendo: Homens, vós sois irmãos; por que vos ofendeis uns aos outros?

Mas o que agredia ao próximo o repeliu, dizendo: Quem te constituiu autoridade e juiz sobre nós? Acaso queres matarme, como fizeste ontem ao egípcio? A estas palavras Moisés fugiu e tornou-se peregrino na terra de Midiã, onde lhe nasceram dois filhos.

Atos 7:20-29

Depois que a filha de Faraó adotou Moisés, ela começou imedia- tamente a prepará-lo para a vida na corte do rei. O historiador Josefo nos conta que pelo fato de Faraó não ter filho ou herdeiro, Moisés era educado para o trono. Essa parece uma suposição razoável; os historiadores confirmam isso sem dúvida. Qualquer que seja o caso, Moisés passou por uma mudança radical de estilo de vida. Considere estes dois versículos, um imediatamente após o outro:

Por esse tempo nasceu Moisés, que era formoso aos oíhos de Deus. Por três meses foi ele mantido na casa de seu pai; quan-

56 MOISÉS: UM HOMEM DEDICADO E GENEROSO

do foi exposto, a filha de Faraó o recolheu e criou como seu próprio filho.

Atos 7:20-21

A palavra criou significa educar, treinar. A filha de Faraó o orien- tou no aprendizado e nos costumes de um lar egípcio, uma atmosfera completamente diversa daquela de um lar hebreu. Moisés mudou de uma choupana humilde, no que poderíamos chamar de gueto de Gósen, onde viviam seus pais, para a corte pomposa e elegante do rei.

É preciso um grande esforço de imaginação para identificar uma situação similar, contemporânea. Poderíamos pensar, por exemplo, em uma criança de rua em Calcutá que repentinamente é levada por um avião militar para a Casa Branca, para ser adotada pelo presidente e pela primeira-dama. Mesmo esse exemplo, porém, não faz juz ao contraste. O que aconteceu, segundo o relato do Livro de Êxodo, simplesmente nos espanta e só pode ser atribuído à mão de um Deus soberano.

O pequeno Moisés provavelmente ganhou não só seu próprio quarto, como também vários outros aposentos. Não aprendeu as lições escolares mais em casa, sob os cuidados de Joquebede, mas com os cultos tutores egípcios. Estes imediatamente começaram a instruir o confuso rapazinho quanto ao protocolo, estilo de vida e cultura egípcios. Ele teve de passar por todo um processo de reorientação em seu preparo para o trono.

O versículo seguinte nos diz que "Moisés foi educado em toda a ciência dos egípcios" (At 7:22). O texto original diz, "em toda a sabedoria dos egípcios". No coloquialismo da época, as pessoas se referiam a um indivíduo brilhante como tendo "a sabedoria dos egípcios".

O menino criado no Egito com todo o cuidado freqüentava o Templo do Sol. Os arqueólogos e historiadores fizeram um grande serviço ao desenterrar e trazer à nossa atenção alguns fatos relativos a esse importante centro educacional.

O Templo do Sol foi chamado por alguns de "Oxford do mundo antigo". O curso de estudos no Templo do Sol U começava com o

A VONTADE DE DEUS, A MEU MODO 57

que chamaríamos de Hieróglifos IOI. Alguns disseram que essa linguagem é a mais difícil já escrita. Ela não emprega caracteres, mas pictogramas — símbolos altamente estilizados que representam idéias complexas.

Enquanto estudava essa parte das Escrituras, peguei um livro da estante para ver se achava um exemplo dessa escrita singular. E incrível! Já vi muitas fontes de computador ao trabalhar no meu processador de textos, mas jamais encontrei uma fonte assim. Só por brincadeira, escolhi uma linha para ver se conseguia fazer algo com ela. A linha começava com três figuras parecidas com um pelicano, seguida de um pé de corvo, três travessões e uma cabeça sem corpo.

Minha tradução teria sido: "Não perca tempo, Chuck. Você nunca vai conseguir!" Um perito em antiguidades afirmou que algumas pessoas dedicam a vida inteira para dominar os hieróglifos. Estou agora convencido disso.

Moisés começou a aprender o idioma egípcio no templo. Ele teria também estudado ciências, medicina, astronomia, química, teologia, filosofia e direito. Com toda a certeza ganhou o certificado egípcio, estudando batalhas, táticas de combate e inimigos da orgulhosa história militar dessa nação. Além disso, teria obtido conhecimentos superficiais do mundo artístico — escultura, música e pintura. Toda a literatura egípcia se abriu diante dele. O filho adotivo da princesa viu-se totalmente imerso na cultura egípcia. Ela se tornou sua vida.

Embora isso não seja confirmado pelas Escrituras, alguns historiadores afirmam que Moisés aprendia rapidamente. Não levou muito tempo para o antigo escravo hebreu assimilar o conteúdo desses cursos difíceis. Pode-se levar também em conta que as distrações eram escassas no Templo do Sol. A escola não era uma brincadeira. Com uma carga de estudos tão pesada, quem acharia tempo para competições esportivas, reuniões de alunos ou corridas de carro? Ninguém se diplomava em basquete, dança ou qualquer outra trivialidade. Era realmente preciso estudar naquele tempo. Moisés tornou-se então um pensador arguto, conhecedor de "toda a sabedoria dos egípcios".

58 MOISÉS: UM HOMEM DEDICADO E GENEROSO

A Bíblia também nos diz que os estudos diligentes e a preparação de Moisés o tornaram um homem "poderoso em palavras e obras". Ele construiu um nome para si e ganhou o respeito dos egípcios. Bem cedo tornou-se evidente que esse filho da princesa possuía tanto poder quanto influência. Quando chegou aos trinta anos, historiadores extrabíblicos nos contam que ele já havia co- mandado o exército egípcio, alcançando uma vitória esmagadora sobre os etíopes. Um estrategista militar ousado. Valorizado. Bron- zeado pelo sol. Com cicatrizes de batalha. Sábio nas questões mundanas. Líder competente. E também inspirador.

Este certamente era um jovem da mais alta qualificação. Quando o texto o denomina "homem poderoso em palavras e obras", ele implica a capacidade de atrair as massas. Significa que ele não só possuía intelecto, como também carisma. Falava com facilidade e suas atitudes comprovavam suas palavras. Todos conheciam sua coragem e heroísmo. Moisés — preparado para o trono. O orgulho do Egito!

Mas ele era também vulnerável. Não tinha idéia de quão vulnerável. Isso iria, porém, tornar-se óbvio para a nação inteira.

Alguns professores sugerem que Moisés não conheceu a vontade de Deus com relação à sua vida até seu encontro na sarça ardente, aos oitenta anos. Foi isso que aprendi e sempre acreditei. Todos supunham que Moisés compreendeu pela primeira vez que deveria livrar Israel naquele momento surpreendente no deserto de Midiã, quando ouviu a voz de Deus chamar seu nome em meio às chamas.

Não acredito mais que isso seja verdade. Embora não tenha um versículo específico para comprovar minha posição, creio que as Escrituras sugerem fortemente que Moisés havia compreendido seu destino enquanto ainda era um jovem educado na corte egípcia. Antes de chegar aos quarenta, estou convencido de que Deus pusera na mente de Moisés que ele, um dia, de um modo ainda não revelado, iria tirar seu povo do cativeiro.

Moisés conhecia a vontade de Deus. O problema, no entanto, foi que ele não procurou buscar o caminho e o tempo de Deus. Em vez

A VONTADE DE DEUS, A MEU MODO 59

disso, começou a realizar esse plano segundo o modo de Moisés e de acordo com o programa de Moisés. Ao agir assim, lamentavelmente, muitas coisas foram desvendadas para ele. Permita que explique os passos que me levaram a essa conclusão.

PRIMEIRO PASSO: UMA IDÉIA INICIADA P O R MOISÉS, N Ã O P O R DEUS

Quando completou quarenta anos, veio-lhe a idéia de visitar seus irmãos, os filhos de Israel.

Atos 7:23

Esta não devia ter sido a primeira vez que tal pensamento ocorreu a Moisés. Ele certamente vira hebreus antes disso. Como ignorálos? Eles estavam em toda parte — construindo, transportando, cortando madeira, varrendo, escavando, rebocando, arrastando pedras e trabalhando na paisagem. Em resumo, eles é que faziam todo o trabalho sujo dos egípcios. E por que não? Eram escravos do Egito.

Em algum ponto, as Escrituras não dizem quando, um plano começou a se formar na mente desse jovem poderoso. O problema é que, quando você sabe qual a vontade suprema de Deus para sua vida e as coisas não estão acontecendo com a rapidez que lhe agrada, você fica ansioso. Começa a procurar meios de apressar o processo. Você não vai ler em Atos ou Êxodo, ou em qualquer outra parte da Bíblia, que Deus fez Moisés matar um egípcio. Moisés foi um assassino estritamente independente. O versículo 23 nos diz: "Veio-lhe a idéia de visitar seus irmãos, os filhos de Israel" (o grifo é meu).

Sem perceber, Moisés entrou num período vulnerável, perigoso, de sua vida. Embora eu esteja convencido de que ele sabia que no futuro iria remir Israel, creio igualmente que ficou nervoso a respeito disso. Ansioso. Impaciente. Nesse estado mental, deu um golpe prematuro que resultou em desastre... e um atraso de quarenta anos. Desejoso de cumprir a vontade de Deus, pronto para fazer grandes

60 MOISÉS: UM HOMEM DEDICADO E GENEROSO

coisas para Deus, ele forçou uma situação que o levou à catástrofe pessoal. Note outra vez o que diz o versículo 11: "Naqueles dias, sendo Moisés já homem, saiu a seus irmãos, e viu os seus labores penosos; e viu que certo egípcio espancava um hebreu, um do seu povo" (Êx 2:11).

Em razão de o escravo maltratado ser também descendente de Jacó, o coração de Moisés se compadeceu dele. De repente, aconteceu. Moisés agarrou o volante de sua vida e pisou no acelerador, acabando por derrapar e despencar numa ribanceira. Não havia volta.

Seria fácil explicar tudo isso, dizendo que algo quebrou de repente. As Escrituras, porém, não explicam desse modo. Moisés agiu deliberadamente, de acordo com o plano. O plano dele. O versículo 12 nos conta que "olhou de uma e de outra banda". Imagine a cena. Naquele momento, Moisés se tornou consciente do homem. Viu um abuso ocorrendo e pensou: Esta é a oportunidade de agir. Ele arregaçou as mangas da camisa e enfrentou a injustiça. Basta de tratamento desigual!

Olhou de uma e de outra banda, e vendo que não havia ali ninguém, matou o egípcio, e o escondeu na areia (Êx 2:12).

Moisés prendeu o homem com um hábil golpe de lança? Atacou-o com uma espada, pelas costas? Golpeou-o com um soco mortal desferido com sua poderosa mão? A Bíblia não diz. Contudo, fica claro que a idéia era de Moisés e foi posta em prática por ele, energizado pela carne. Não se lê em lugar algum que Deus disse a Moisés: "Interfira nessa situação e endireite as coisas". A decisão foi dele. Olhou para um lado e para o outro... depois reagiu rápida e violentamente.

Uma vez estabelecido esse fato, precisamos ser cautelosos aqui. Não devemos precipitar-nos e criticar os motivos do coração desse jovem.

A VONTADE DE DEUS, A MEU MODO 61

Estou convencido de que o objetivo de Moisés não era apenas aparecer. Creio que sua sinceridade era completa. Ele não se considerou tanto um assassino de um feitor cruel, mas alguém que corajosamente saía em defesa do povo de Deus. O desejo de agir corretamente o dominou. Seu problema? Ele se dedicou à vontade de Deus, mas não ao Deus dessa vontade.

Reflita sobre esse pensamento. Você e eu podemos nos tornar tão dedicados à vontade de Deus, tão dirigidos por um falso sentido de propósito, que podemos sem querer tomar as rédeas do assunto e deixar Deus completamente fora dele. Você já fez isso?

Aquele feitor cruel devia ser castigado? Sim. Foi errado espancar o hebreu como fez? Claro que sim. Mas quando Moisés interferiu e começou sua Operação Livramento pessoal, ele foi energizado pela carne e não pelo Espírito.

Isso facilmente acontece com pessoas boas, homens e mulheres com os mais elevados motivos e as melhores intenções. Imagine este quadro: você é um professor talentoso e altamente qualificado. Em seu coração, você anseia por estar outra vez diante de uma classe. Com toda a sua alma, deseja sentir novamente a mesa do professor debaixo de suas mãos e a mente dos alunos pronta para absorver seus conhecimentos. De repente surge uma oportunidade inesperada. Se não tiver cuidado, meu amigo, você vai se achar abrindo caminho às cotoveladas na direção dessa "porta aberta".

No entanto, durante todo o tempo, Deus aguarda que procure seu conselho. Se agir sem prestar atenção ao tempo dele, pode perder o consentimento do favor divino. Ele não vai abençoar o que não ordenou. Você pode sentir realmente que Deus tem algo para você fazer em determinada área. Mas se não ficar vigilante, se não se humilhar diariamente diante dele, buscar sua face, discernir o tempo dele, operar sob o controle do Espírito, pode forçar e manipular prematuramente a entrada naquele caminho onde Deus o queria, mas não chegará no tempo dele.

Essa questão do tempo de Deus é crítica! Uma heroína bíblica subseqüente, que compreendia muito bem qual era seu papel crucial, certa vez perguntou a um amedrontado filho de Deus: "Quem sabe

62 MOISÉS-. UM HOMEM DEDICADO E GENEROSO

se para tal conjuntura como esta é que foste elevada a rainha? (Et 4:14) O apóstolo Paulo aprofundou nossa apreciação desse mistério quan- do escreveu sobre o nascimento de Cristo, "vindo, porém, a plenitude do tempo, Deus enviou seu Filho, nascido de mulher, nascido sob a lei, para resgatar os que estavam sob a lei, a fim de que recebêssemos a adoção de filhos" (G14:4-5). No tempo certo, bênçãos incontáveis! Mas no tempo errado...

Moisés olhou para um lado e para o outro, não é interessante? Mas ele não olhou para cima, olhou? Olhou em ambas as direções, horizontalmente, deixando a vertical de fora. O que ele fez com os resultados de sua ira assassina? As Escrituras dizem: "...o escondeu (o egípcio) na areia".

Quando se age baseado na carne, existe invariavelmente algo a ser ocultado. Você tem de enterrar seu motivo. Tem de esconder um contato feito para manipular o plano. Tem de encobrir uma mentira ou meia-verdade. Tem de voltar atrás numa vaidade. É preciso cobrir o cadáver que seu procedimento carnal criou. E só uma questão de tempo até que a verdade apareça. A areia sempre revela seus segredos.

Essa é uma boa ocasião para enfatizar que os capacitados e talentosos são também vítimas da vulnerabilidade. Os altamente qua- lificados vivem à mercê do ataque sutil do inimigo — aquele adversário que o incita a agir na carne, a fazer a coisa certa na hora errada.

E como ele opera? A maioria de nós já conhece a estratégia.

Você se sente movido por uma sensação de necessidade. Faz um juramento insensato, como Jefté, e vive para lamentá-lo pelo resto de seus dias. Apressa o processo, como fizeram Abrão e Sarai, e acaba mais tarde com um Ismael nas mãos, zombando do produto da promessa.

O conselho de Deus, o tempo de Deus, são negligenciados e você interfere para manobrar as coisas. No final, acaba se encrencando.

Fica com um cadáver, uma enxada nas mãos e uma sepultura rasa a seus pés.

Sabe o que é estranho nisso tudo? A maioria de nós não tem muito jeito para encobrir as coisas. Fico surpreso ao ver que Moisés

A VONTADE DE DEUS, A MEU MODO 63

não soube sequer enterrar direito um egípcio. Ele simplesmente falhou em cobrir o morto como devia.

O que dizer, porém, depois de muitos anos, quando Deus tomou o controle e Moisés agiu de acordo com o tempo dele? Deus soube cobrir os egípcios? Deus sepultou o exército inteiro deles sob o mar Vermelho, cavalos, armas, carros e tudo o mais! Quando Deus participa, o trabalho sai. Com o Senhor na direção, o fracasso foge.

Quando a carne governa, entretanto, você não pode sequer enterrar as conseqüências. Elas o perseguem! E por isso que Moisés "olhou de uma banda e de outra banda". Ao operar na carne, ele tinha de verificar se a retaguarda estava livre antes de agir. Mas foi apanhado!

Não perca esta parte essencial. É aqui que os problemas realmente surgem. Até agora, Moisés talvez tenha sentido que fez algo bem astuto. Tivera uma atitude ousada e se sentia bem em relação a ela. Não tinha absolutamente idéia de que a confusão, fracasso e sofrimento o espreitavam como um leopardo que se aproximava.

Quero lembrá-lo novamente de que Moisés julgava cumprir a vontade de Deus.

Vendo um homem tratado injustamente, tomou-fhe a defesa e vingou o oprimido, matando o egípcio. Ora, Moisés cuidava que seus irmãos entenderiam que Deus os queria salvar por intermédio dele; eles, porém, nao compreenderam.

Atos 7:24-25

Moisés acreditava que deveria ser o libertador dos hebreus, muitos anos antes de receber a nova comissão na sarça ardente. Ele supunha que todos compreenderiam também isso. Pensou que tudo o que tinha de fazer era dar o pontapé inicial na bola e os hebreus se uniriam a ele, aclamando-o como seu campeão. "Está bem, Príncipe Moisés, vamos continuar no palácio! Peguem martelos e enxadas,

64 MOISÉS: UM HOMEM DEDICADO E GENEROSO

companheiros. Vamos! Seja nosso líder, Poderoso Príncipe!" Mas o que as Escrituras dizem? Elas registram: "Eles, porém, não compreenderam".

Não perceberam a mensagem. A confusão deles contagiou Moisés. Ele sabia que Deus desejava usá-lo poderosamente; por que então as coisas não estavam funcionando? Acendera o fósforo, mas a madeira se negava a queimar. O que poderia ter dado errado? Qual o erro em seu cálculo? A confusão substituiu a confiança. O que estava acontecendo?

A passagem avança e nos conta: "No dia seguinte, aproximou-se de uns que brigavam..." (At 7:26)

Por que será que ele voltou à cena do crime? Penso que voltou para executar seu plano. Ele havia provado sua lealdade aos hebreus, eliminando um oficial egípcio. Esse era o Plano A. Agora o Plano B. Moisés voltaria à cena desse ato e reuniria as tropas.

Do modo como aconteceu, no entanto, ele chegou em meio a uma briga. Você pode vê-lo de testa franzida, enquanto desce do carro oficial? Brigando? Isso não estava no roteiro. O povo agradecido deveria estar se reunindo, preparando-se para a Grande Rebelião.

"Olhem, vocês", disse ele quando se aproximava deles, "isto não deveria estar acontecendo. Temos de trabalhar juntos, homens". Mas eles não ouviram seu conselho. De fato, não o respeitaram de modo algum. Mas o que agredia ao próximo o repeliu, dizendo: "Quem te constituiu autoridade e juiz sobre nós?" (At 7:27).

Que rejeição! "Olhe, mocinho, suma daqui. Quem morreu e deixou você encarregado? Você não é nosso líder. Quem pensa que é, afinal?"

Como essas palavras devem ter ferido um homem que acabara de arriscar tudo\

Em seu livro, D.E. Hoste, Phyllis Thompson faz um trabalho magistral ao descrever as características da liderança espiritual. Ela escreve: "Acredito que se você quiser realmente saber quem é um líder espiritual, deve olhar à sua volta e observar quantos são os religiosos que o seguem".1

A VONTADE DE DEUS, A MEU MODO 65

É um plano bem simples, não é? Uma proposição do tipo arrozfeijão. Se você é um líder espiritual, as pessoas religiosas irão segui-lo. Isso se aplica a qualquer líder. Se dá provas de que é de fato, as pessoas o seguem. Mas elas não seguiram Moisés. Nesse ponto, o príncipe do Egito iniciou uma parada solitária, de um homem só. As contas da carne estavam vencendo.

Sejamos sinceros uns com os outros. Você já experimentou algo assim? A maioria de nós já. Você se prepara para fazer alguma coisa grandiosa para Deus. Estabelece metas. Gasta tempo e dinheiro. Conta a um grupo de pessoas. Por mais penoso que seja admitir, as metas que não são envolvidas em oração ou levadas ao Senhor com humildade, acabam se mostrando absolutamente inúteis. Não levam a lugar nenhum. Não realizam nada. Geram calor, mas não luz. E você fica com a confusão e a derrota.

Você talvez faça planos para um grande estudo bíblico em sua casa. Envia os convites cujo horário está estabelecido às dezenove e trinta em ponto. A noite se aproxima e a sala está pronta: flores na mesa, fogo na lareira, refrescos na cozinha.

Chega então a hora combinada e nada. O relógio dá oito badaladas e ninguém apareceu ainda. Os ponteiros indicam vinte e trinta e o silêncio continua. O fogo vai diminuindo. As borbulhas do ponche desaparecem. O café esfria. Os refrescos perdem o gelo na mesa. E seu coração se aperta no peito.

Um rapaz me contou há algum tempo que planejara uma grande reunião com um grupo de amigos da faculdade. "Fizemos todo tipo de arranjos. Alugamos um salão para acomodar duzentas e cinqüenta pessoas. Fizemos a maior divulgação. Tínhamos grandes planos e muitas idéias. Só oito pessoas apareceram."

Esse tipo de coisa abala você. E deve abalar mesmo! Esse é o momento em que é preciso enfrentar a música, ficar silencioso, cair de joelhos e perguntar: "Senhor, o senhor está metido nisso? Ou tudo não passa de um grande plano de alguém?"

Quero deixar com você um lema antigo que me acompanha. Ele vem me guiando há mais de trinta anos e continua tão apropriado agora quanto no dia em que o adotei.

66 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Eu tento, eu falho.

Eu confio, o Senhor traz resultados!

Isso não é mesmo verdade? Que conselho simples. Só nove palavras, mas quanta profundidade. Resultado: se você se move de acordo com a energia da carne, está condenado a falhar. O velho hino diz muito bem: "O braço de carne vai falhar, você não pode confiar no seu". É apenas uma questão de tempo até que eles exumem o cadáver e vejam suas impressões digitais em toda a superfície da faca. Mas quando você confia no Senhor Deus para dar o passo seguinte, quando espera humildemente diante dele, ele abrirá ou fechará as portas, e você poderá descansar e relaxar até que ele diga: "Vá".

Temeu, pois, Moisés e disse: Com certeza o descobriram.

Êxodo 2:14

Primeiro a surpresa. Depois a confusão seguida do medo, como dedos gelados sobre o peito. Quando o segredo bem guardado de Moisés foi revelado, ele ficou trêmulo. Agindo sob a ação do medo, o relato bíblico registra que ele "fugiu da presença de Faraó".

Por que fugiu? O versículo 15 nos diz: "Procurou Faraó matar a Moisés". Agora que Moisés mostrara a quem pertencia realmente sua lealdade, Faraó não podia mais suportar que tal homem ficasse junto dele. Aos olhos do rei, um príncipe traidor e fora de controle era melhor morto. Como foram tremendas as repercussões da atitude intempestiva de Moisés.

É bem possível que você também tenha sido forçado a lidar com conseqüências desse tipo. Seu registro pode refletir um padrão ambicioso, mas pouco conhecimento. Grandes desejos, mas pouco discernimento. Grandes aspirações, mas pouca humildade. Muito zelo e energia, mas pouca sabedoria. Você tem então de correr pelas trilhas até o amargo fim, uma depois da outra. A cada vez você correu mais depressa, mas nunca teve sucesso. Nenhuma levou você

A VONTADE DE DEUS, A MEU MODO 67

aonde queria ir. Se fosse dita a verdade, suas ações impulsivas teriam resultado numa situação insustentável.

Em meu livro, só há uma coisa pior do que estar no final de uma vida autodirigida: é estar no meio dela.

Você diz: "Bem, estou na casa dos trinta, deveria saber mais do que isso".

Moisés tinha quarenta. Você diz: "Não sou principiante! Recebi educação e treinamento que nem imagina!"

Melhor do que os de Moisés? Lembre-se, nesse ponto de sua carreira, ele fora "educado em toda a sabedoria dos egípcios".

Como vê, nosso currículo impressionante faz parte do problema. As vezes somos educados além da nossa inteligência. Sabemos mais do que é seguro conhecer! A verdade é que, quando você confia na carne para fazer um trabalho, não precisa de mais educação. Não precisa de outro diploma. Não precisa de mais seminários de treinamento. Você precisa de sabedoria. E eu e todo o povo de Deus também.

Adquirir sabedoria leva tempo. Inclui altos e baixos na estrada. Exige suportar novos fracassos e engolir grandes e amargas doses de humildade.

DO PALÁCIO PARA O DESERTO

Descobrindo-se altamente qualificado para ser absolutamente inútil, Moisés segurou as vestes reais e correu como um coiote assustado. Será que foi embora a pé ou pulou no lombo de um cavalo, pegou emprestado um carro real e rodou até que as rodas caíssem? As Escrituras não dizem. Sabemos apenas que ele "se deteve na terra de Midiã; e assentou-se junto a um poço" (Ex 2:15).

Há alguns anos minha irmã Luci deu-me um livro chamado God's Wilderness. É um volume enorme, ilustrado com figuras do deserto do Sinai, desde Midiã até as encostas do monte Sinai. Enquanto refletia sobre essa parte da Bíblia, tirei-o da estante e comecei a folheálo, curioso para ver onde Moisés estava quando finalmente deixou de correr. Como era esse deserto de Midiã?

68 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Você não acreditaria naquelas fotos. Elas me fizeram lembrar das fotografias tiradas da superfície do planeta Marte. Que lugar sombrio, desolado! Talvez nosso governo não devesse ter gastado tanto dinheiro para enviar aquele pequeno robô ao planeta vermelho. Teriam poupado muito se tivessem posto esse mesmo robô num avião e o largado em algum ponto ao norte da península arábica. Midiã! O nome faz o deserto em volta de Palm Springs parecer a Colúmbia Britânica!

Incrivelmente árido. Areia quente e cascalho, pontuado de rochas escarpadas, com um ou outro arbusto raquítico de algum modo ainda preso à vida.

Você consegue visualizar Moisés tropeçando em meio a essa terra desolada, as roupas feitas sob medida prendendo nos espinhos, avançando cegamente em meio às pedras meio submersas, escolhendo o caminho nesse deserto angustiante?

Moisés não caminhava alegremente pelo deserto cantando I did it my way (segui o meu caminho). Era um fugitivo atemorizado e desiludido, fugindo para salvar a própria vida. Sua educação primorosa de nada lhe valia a essa altura. Seu conhecimento dos hieróglifos e da poesia egípcia não o confortava. Suas vitórias militares lhe pareciam vazias. Graças a seu ato de violência, esses mesmos militares queriam matá-lo. Ele provavelmente lamentou em seu íntimo a cada passo por sua atitude inoportuna, dizendo coisas como: "Minha vida acabou. Deus nunca, nunca, vai fazer uso de mim. Estou completamente acabado".

Ele estava errado, é lógico. Seriam, entretanto, necessários muitos anos penosos antes que assimilasse plenamente esse fato.

É possível que você esteja nessa situação no momento em que lê estas palavras. Moisés viveu há milhares de anos, mas a situação que descrevi pode parecer tão contemporânea para você quanto o pão amanhecido em sua cozinha hoje. Você diz: "Trabalhei tanto. Tentei tantas coisas. Me esforcei incansavelmente, mas não cheguei a lugar nenhum. Nada deu certo. É o fim".

Acredite ou não, você pode estar mais próximo do que nunca de um avanço espiritual em sua vida. Antes de terminar este capítulo, gostaria de compartilhar dois pensamentos finais.

A VONTADE DE DEUS, A MEU MODO 69

Primeiro: Quando a vida do "eu" segue seu curso, acabamos num deserto. Você não vai desistir de correr na carne até chegar às dunas áridas e infinitas. Quando finalmente as alcançar, quando estacar à sombra desprezível de uma rocha calcinada pelo sol, dirá a si mesmo: "Será que Deus vai fazer uso de mim um dia"? E ficará ali sentado.

Você notou, porém, onde Moisés se sentou? A Bíblia nos diz que foi "junto a um poço". Isso não parece significativo?

Segundo: Quando a vida do eu finalmente se assenta, o poço de uma nova vida está próximo. Quando aprenderemos isso? Pessoas altamente qualificadas, capazes, preferem ficar em movimento; sentar-se é algo contra sua natureza. Todavia, quando aquele quebrantado quarentão chamado Moisés finalmente se deixou cair ao chão no final de uma existência autogerida, encontrou água fresca bem ao seu lado.

Há anos, numa situação muito parecida com a que acabei de descrever, deparei com estas pungentes observações:

Moisés estava fora de contato com Deus e então fugiu, cruzou o deserto que havia entre ele e a fronteira oriental; passou pelos desfiladeiros da montanha da península sinaítica, ao longo dos quais em anos posteriores ele guiaria seu povo; e, já cansado, sentou-se afinal junto a um poço na terra de Midiã.

Experiências desse tipo acontecem com todos nós. Avançamos apressados, pensando vencer tudo à nossa frente; damos alguns golpes no ar; somos surpreendidos pelos desapontamentos e recuamos; tememos o primeiro sopro da reprovação humana; fugimos da cena... para nos esconder, desgostosos. Escondemo-nos então do orgulho humano no segredo da presença de Deus. Ali nossa visão se torna nítida; o lodo desaparece da corrente da nossa vida... a vida do eu morre; nosso espírito bebe do rio de Deus, onde a água é abundante; nossa fé começa a agarrar-lhe o braço, para ser o canal da manifestação do seu poder. E assim emergimos finalmente para ser a sua mão que conduz um Êxodo.2

Encerro este terceiro capítulo com um pedido estranho, mas forte. Sente-se. E isso mesmo, meu amigo, sente-se!

70 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Você já correu bastante. Ficou de pé muito tempo. Lutou, forçou e manipulou seu caminho por um período demasiado longo. Deus finalmente atraiu sua atenção. Ele está dizendo: "Desista! Pare! Dême o controle! Fique sentado na areia quente do deserto onde se encontra. Veja o que está ao seu lado. E um poço, cheio de água fresca". Em breve, Deus vai se comprazer de levantar o balde e refrescar sua alma. Fique quieto. Não saia daí.

Talvez pela primeira vez em sua vida adulta, obedeça às palavras dele: "Aquietai-vos, e sabei que eu sou Deus" (SI 46:10).

Cesse todos os esforços. Relaxe. Satisfaça-se com esse poço e beba profundamente dele. Você está mais sedento do que pensa.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Onde, na sua caminhada, você tem tentado realizar um propósito verdadeiro de Deus, mas à sua própria maneira e no seu próprio tempo, tomando as rédeas nas mãos?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Assim como Moisés matou o egípcio querendo libertar seu povo pela força, em que momento o seu zelo sincero acabou produzindo mais estrago do que bênção?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que precisaria mudar no seu coração para que você deixasse de manipular as circunstâncias e passasse a esperar que Deus aja do modo dele?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$As Lições do Fracasso$t$, 4,
$conteudo$« " C

X elizes para sempre" é o final de um conto de fadas e não a descrição da vida cristã. A vida em Cristo é real Não é de plástico, nem de vidro colorido, nem cor-de-rosa, e também não é a terra da fantasia. Em todos os anos em que andei com o Senhor, estou ainda para encontrar um cristão que tenha "vivido feliz para sempre". Por outro lado, conheci muitos santos que suportaram aflições, perdas, desapontamentos, adiamentos, fracassos e sofrimento incrível no decorrer dos anos. Vi também muitos desses mesmos homens, mulheres e até alguns adolescentes apegarem-se à sua alegria, irradiarem esperança e mostrarem um espírito encantador... mesmo em meio à tristeza... às lágrimas... às portas da morte.

Vivendo numa cultura orientada para o produto, gostamos de embrulhar também nossa fé. Preferimos vender uma versão elegante da salvação, numa bela embalagem que inclui felicidade e paz aqui e agora, e o céu num futuro próximo. Embora não haja nada de errado com as boas técnicas de marketing ou em ensinar princípios de sucesso autêntico, há algo errado se omitirmos o processo, que deve incluir inevitavelmente períodos de derrota e fracasso.

Eu não precisaria recuar muito em minha agenda para descrever uma semana na qual não só errei o alvo como passei bem longe dele.

72 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Não preciso ser profeta para proclamar que o mesmo aconteceu com você. É claro que sim. Você pode até estar tendo uma semana desse tipo no momento em lê estas palavras.

O que eu gostaria de saber é quem inventou esse padrão de felizes-para-sempre em primeiro lugar? Deus sabe muito bem que não somos capazes de produzir a perfeição; foi por isso que Jesus, o Filho perfeito de Deus, nos colocou em sua família. Foi por isso que nos deu uma posição de perfeita justiça nele, lembrando-nos de que, em contraste, nossa experiência diária deixará constantemente a desejar.

Se você espera uma semana livre de problemas, meu amigo, vai esperar em vão. Isso não existe. Até que aprendamos a extrair lições do fracasso e da perda, repetiremos essas falhas — caindo cada vez mais fundo no buraco —, em vez de avançar à medida que crescemos.

O que você e eu precisamos é de um processo que leve à vitória e ao sucesso. Com as lembranças desses momentos áureos brilhando em nossa mente, aprenderemos então a evitar alguns desses vales, ou a sair deles mais rapidamente. Esse processo, creio eu, é tão impor- tante quanto o produto.

Verifique comigo dois dos meus versículos favoritos no Salmo 119:

Antes de ser afligido andava errado, mas agora guardo a tua palavra (v. 67).

Foi-me bom ter eu passado pela aflição, para que aprendesse os teus decretos. Para mim vale mais a lei que procede de tua boca, do que milhares de ouro ou de prata (w. 71-72).

Que perspectiva amadurecida! Na paráfrase da Bíblia Viva, Ken Taylor capta o sentido desses versos de maneira admirável: "Antes de tu me castigares eu andava pelos meus próprios caminhos errados, mas agora obedeço a tudo que mandas na tua Palavra...O castigo que tu me deste foi muito bom para mim; só assim aprendi a pôr em

AS LIÇÕES DO FRACASSO 73

prática os teus mandamentos. Agora, as leis de conduta que tu dei- xaste valem mais para mim que uma enorme fortuna em ouro e prata".

Não perca o pensamento implícito aqui. O salmista estivera so- frendo por algum tempo. Ele não nos conta a causa de suas dores, nem por quanto tempo as suportou, mas simplesmente diz que isso aconteceu. Ele descreve para nós o refluxo escuro e funesto do fracasso e a grave aflição que sofreu nas mãos do Senhor.

Em retrospecto, com uma visão mais nítida depois de a aflição ter seguido seu curso, o salmista reflete: "Há duas coisas que posso dizer sobre o fracasso..."

Primeiro, quando passo por períodos de fracasso, sou mais do que nunca levado a viver em obediência. Quando saio das passagens escuras em que ando e ajo baseado na carne e (finalmente) chego ao fim dessa cena lamentável, meu coração clama por pureza. Por luz.

Estou faminto disso! Meu egoísmo me desagrada, sinto-me mais decidido do que nunca a manter-me no caminho reto, caminhando cada vez mais perto de Cristo. Os tempos de fracasso me levam a desejar viver em estrita obediência.

Há um segundo princípio igualmente importante.

Foi-me bom ter eu passado pela aflição para que aprendesse... (v. 71)

Você conhece pessoas que parecem escutar atentamente a Deus — pessoas cujo coração é especialmente sensível ao Espírito Santo? Posso quase garantir que se tratam de homens e mulheres que sabem o que é ser quebrantado e ferido. Eles ostentam cicatrizes que provam isso.

74 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Ao ler estas palavras, você talvez ainda tenha as marcas de uma semana direcionada para a carne, em que seguiu dia após dia seu próprio caminho e entristeceu o Espírito de Deus. Agora você lê estas páginas aflito para mudar seu coração — para aprender com Deus e renovar sua comunhão com ele. Será que percebeu o que houve? Seu fracasso lhe deu um espírito sensível, dócil. Ele quebrou a barreira do orgulho em sua vida. E o que Paulo chamou de "tristeza segundo Deus"

(2 Co 7:10).

Todavia, apesar disso tudo, uma das coisas mais difíceis de fazer é aceitar nossos fracassos. Quer estejamos falando com nossos cônjuges, nossos filhos ou empregados, quer com o Senhor, não é natural para nós admitir nossas ofensas. A reação imediata em cada caso é empregar os mecanismos de defesa: negar, justificar, racionalizar, reinterpretar nossas atitudes.

O caminho melhor e mais saudável, entretanto, é "confessar". Chamar o fracasso de "fracasso". Dar nome ao pecado. Admitir que cometemos um erro e, declarando isso, aprender o que Deus quer ensinar-nos com a experiência.

Sir Winston Churchill, em meio aos bombardeios nazistas, disse ao povo londrino: "Este não é o fim. Não é sequer o princípio do fim. Mas é, talvez, o fim do princípio".1 Foi ele quem ofereceu a melhor definição de sucesso que eu já li: "Sucesso é mover-se de um fracasso para outro sem perder o entusiasmo".

As palavras de Churchill servem muito bem para os nossos fracassos na vida cristã. Esse não é o fim! Não é sequer o princípio do fim. Mas é, talvez, o fim do princípio. Em outras palavras, no momento em que começar a interpretar o fracasso corretamente, dará seu primeiro e gigantesco passo em direção à maturidade.

Fiorello La Guardia, prefeito da Cidade de Nova York nos anos 30, costumava dizer: "Não costumo fracassar. Mas, quando isso acontece, que grande fracasso!" É possível que você sinta isso e diga: "Chuck, não costumo escorregar muito; mas, rapaz, quando acontece, é uma queda e tanto!"

Tudo bem. É uma queda e tanto, mas essas quedas podem trazer lições reais. Se for uma queda leve, você receberá apenas uma lição

AS LIÇÕES DO FRACASSO 75

leve, mas, se cair de uma altura de quarenta andares, então você começará a aprender. Na verdade, não é o tombo que machuca... é a parada súbita no final!

Moisés levou um tombo de quarenta andares. Ao voltarmos ao relato bíblico, ele é uma alma triste, magoada e abatida que acabou de atingir o chão numa parada brusca. Em questão de dias, saiu do topo da pirâmide, como o escolhido de Faraó, e desceu à condição de um fugitivo sujo e sem dinheiro.

Acabei de passar por uma semana extremamente difícil. Você não precisa saber os detalhes, basta dizer que fui enganado por várias coisas enquanto olhava em outra direção. Nem sequer ouvi o som dos passos! Sinto-me como um jogador de futebol americano que se põe a observar o companheiro correr pelo campo e acaba atropelado por outro jogador que alguém esqueceu de marcar. Depois de ter sido praticamente esmagado, você fica olhando pelo visor do seu capacete e se pergunta: O que será que houve?

A noite passada, enquanto tentava organizar minhas idéias e lambia um pouco as feridas, pensava: Obrigado, Senhor... acho que precisava disso. Agora será mais fácil escrever o que tenho de escrever. (Parece uma vergonha ter de pagar esse preço para ter um pouco de discernimento. Agradeço por não estar escrevendo sobre a crucificação!)

Êxodo 2:15 diz que Moisés "assentou-se junto a um poço". Naquele momento, ele se sentiu como se estivesse no fundo de um poço, olhando para cima. Um poço em Midiã, imagine! Ele só ia correr até ali. Aquele deve ter sido com certeza o nível mais baixo a que desceu em sua vida. Você talvez tenha chegado a um lugar semelhante no ano passado, ou talvez neste ano. Pensa então com seus botões: Deus já se envolveu o suficiente com este infeliz. Não quer mais nada comigo. Jamais serei útil a ele!

Desnorteado e exausto, Moisés pode muito bem ter olhado para as profundezas do poço naquela tarde quente no deserto, refletindo sobre as lições do seu passado recente. Permita-me sugerir quatro pensamentos que ele pode ter considerado em meio a essa meditação. A primeira lição vem do capítulo anterior.

76 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Quando estava no Egito - você talvez se lembre - Moisés "olhou de uma e de outra banda" e depois assassinou um egípcio e o enterrou na areia. Como já notamos, Moisés pode ter pensado que seguia o plano de Deus naquele momento, mas nunca se preocupou em verificar os sinais. Com certeza não orou antes de desferir o golpe. Não temos registro de que ele procurou a face de Deus antes de dar esse passo importante. Resultado? Os sonhos de Moisés se desvaneceram, do mesmo modo que o fundo de uma caixa de papelão encharcada vem a cair. Foi o maior atraso da sua vida.

O fato é que você não pode plantar uma semente carnal e colher uma planta espiritual. Não pode plantar um ato carnal e colher um fruto espiritual. Se você manipular, conspirar e mentir para chegar ao topo, não agradeça a Deus pela promoção! Deus e você sabem que manobrou e puxou cordões, enterrando as carcaças carnais no solo para obter a promoção. Quando ganhar um escritório maior e a chave para o banheiro dos executivos, não dê o crédito a ele, pois não vai aceitá-lo. Suas impressões digitais estão por todo o esquema, e não as dele.

Dizemos às vezes ao Senhor: "Obrigado por isso, Pai". E o Senhor responde: "Quem? Eu? Não fui eu quem fez isso. Foi voct.

Você cola no exame, tira uma nota alta e agradece ao Senhor pelo "A". Sonega imposto de renda, recebe uma boa devolução e agradece a ele pelo dinheiro extra que pode oferecer para o orçamento do prédio.

As coisas não funcionam assim, amigo. Ele lhe diz: "Não fui eu quem fez isso. O plano é seu".

Enquanto Moisés continuava sentado junto ao poço, posso imaginar uma voz baixa e suave interrompendo suas reflexões. "Não me agradeça, Moisés, porque um egípcio foi enterrado na areia. Você fez isso. Atos carnais como esse jamais poderão fazer avançar meus planos. Foi carnal, Moisés, do começo ao fim. E você sabe disso".

Ele realmente sabia. Compreendeu isso melhor quando voltou para os hebreus no dia seguinte e tentou tomar a liderança... só para ser escarnecido e rejeitado. Todo o esquema caiu então por terra e ele

AS LIÇÕES DO FRACASSO 77

teve de fugir. Damos graças porque Moisés aprendeu bem essa primeira lição. E penso que aprendeu também outra.

Penso às vezes que a hora oportuna é até mais importante. Quantas vezes fiz a coisa certa na hora errada... e as coisas desandaram bem na minha frente? Fico embaraçado quando olho para trás e vejo como isso se repetiu. O fato é que Deus não só planeja o que devemos fazer, como também arranja o tempo certo de executarmos o plano.

Quando Moisés relembrou o incidente com o egípcio (ele deve tê-lo relembrado milhares de vezes nos anos que se seguiram), poderia ter escrito uma palavra em cima de toda essa experiência carnal: prematura. Ele entrou repentinamente em cena. Saltou para a rebe- lião. Forçou caminho. Empurrou a porta. E o tiro saiu pela culatra.

Há alguns anos adotei um princípio que me é muito útil em inúmeras situações. Gostaria de transmiti-lo a você, mesmo que seja só para impedir que se machuque tantas vezes quantas eu me machuquei. E o seguinte:

Quando Deus faz parte do plano... ele flui livremente.

Quando é a carne... ele éforçado.

Você já tentou pregar um prego quadrado num buraco redondo? Esforça-se ao máximo e gasta toda a sua energia emocional para fa- zer uma coisa funcionar? Seria melhor fazer uma pausa e conversar com o Treinador! Quando Deus toma parte em algo, as coisas fluem.

Vamos dizer que você decidiu de coração iniciar um ministério no local de trabalho. Gostaria de uma oportunidade para sentar-se com seus colegas e talvez passar quinze minutos juntos na hora do almoço, estudando as Escrituras. Grande idéia! Mas não force a barra. Ponha o problema diante de Deus e deixe que ele abra as portas. Se ele fizer parte do plano, é notável ver como a aprovação

78 MOISÉS: UM HOMEM DEDICADO E GENEROSO

será facilmente concedida, como um crescente interesse vai surgir e a oportunidade será aproveitada. Tudo vai dar certo quase sem a sua interferência.

O tempo oportuno é tão importante quanto a ação. Penso que é nesse ponto que a sabedoria entra. O conhecimento me diz o que fazer; a sabedoria me diz quando fazer e como executar. Quanto mais vivo, tanto mais creio nas palavras do sábio que escreveu: "Um golpe desferido na hora certa vale mais que mil desfechados no calor da ânsia prematura". Deus não tem limitações em sua capacidade para fazer algo, mas ele só irá agir no seu tempo e não antes dele.

E se Josué tivesse dito: "Vamos andar cinco vezes em volta de Jericó e depois soprar as trombetas. Sete voltas me parecem excessivas". Você acha que os muros teriam caído mesmo assim?

E se Davi tivesse visto o rei Saul vulnerável na caverna e dissesse: "Essa é a minha oportunidade para abreviar essa caçada exaustiva pelo deserto. Vou despachar agora esse homem e reivindicar a coroa. Afinal, Deus disse que ela ia ser minha". Você acha que Deus teria abençoado esse atalho?

Todos nós já sentimos raiva, frustração, como se o céu tivesse engatado a primeira marcha quando precisávamos estar a toda velocidade. Em nossos momentos mais sombrios, talvez quiséssemos dizer ao Senhor: "Olhe, isso é sério. Não pode transferi-lo para a parte de urgências em sua lista de prioridades? Não pode apressar as coisas por aqui? Vamos, Senhor! Estou falando com o Senhor há semanas".

O problema não é que Deus é lento demais, nós é que somos apressados. Apressados demais para o nosso próprio bem.

Você já viu um cachorro que não foi treinado sendo levado numa correia? É até divertido, a menos que você esteja na extremidade dela. Lá está o jovem Fido, lutando com todas as suas forças para livrar-se da correia, com os olhos saltados, a língua pendente, pulando em desespero, arquejando e quase sem fôlego. Qual o problema nessa cena? A falha é do pobre sujeito que quase deslocou o braço em seu esforço para segurar o cão? Ele está sendo cruel e insensato ao andar, em vez de galopar no ritmo do animal? Ou será que o Fido precisa aprender algumas palavras novas, como "junto" e "sentado"?

AS LIÇÕES DO FRACASSO 79

Havia um cachorro assim em nossa vizinhança antiga. Eu costu- mava vê-lo pela manha, quando ia à varanda sob o sol da Califórnia pegar meu jornal. Era fácil saber quando ele estava chegando, por- que se fazia ouvir de longe — ofegava, quase sufocando, as patas escorregavam e raspavam a calçada. O dono era arrastado para cá e para lá, enquanto o cão o puxava como se estivesse no rastro de um coelho ferido. Isso acontecia todas as manhãs, e nem o dono nem o cachorro pareciam se divertir com a situação.

Certa vez, depois de observar novamente o espetáculo, lembro- me de ter pensado: Essa cena me faz lembrar de mim mesmo! Quero passar na frente de Deus, puxando e criando dificuldades, quase su- focando em minha ansiedade, não me divertindo praticamente nada.

E Deus está dizendo: "Devagar. Vá com calma. Sente! Você está só se machucando. Vamos desfrutar desta manhã. Vamos aproveitar esta caminhada juntos".

Moisés era forte demais. Educado demais. Culto demais.

Talentoso demais. Tinha vantagens demais. Ele fazia a correia esti- car-se muito e tinha de aprender que esperar — regular a marcha — não era um sinal de fraqueza, mas de força. Ao ler estas palavras, você talvez tenha de admitir que também não aprendeu isso. Está forçando as coisas, sufocando e chutando a poeira da ansiedade por- que a vida não está correndo com a pressa necessária; as circunstân- cias não estão mudando com a rapidez que desejava.

Temo ter más notícias para você. Se essa é sua mentalidade, você ficará para sempre frustrado. Por quê? Porque a vida irá mo- ver-se em seu próprio ritmo. Por mais que deseje, as circunstâncias não irão simplesmente se conformar às suas expectativas ou horá- rio. Se tentar forçar os eventos, acabará com bolhas, úlceras ou so- frendo um infarto precoce. Se tentar forçar as pessoas, elas jamais corresponderão; acabarão ressentidas com você, evitando você ou, pior que tudo, irão ignorá-lo. Ninguém gosta de ser pressionado.

Este é outro pensamento que pode ter ocorrido ao nosso exausto amigo junto ao poço.

80 MOISÉS: UM HOMEM DEDICADO E GENEROSO

De acordo com Êxodo 2:12, Moisés escondeu o corpo do egípcio assassinado. No dia seguinte, porém, o crime estava em todos os jornais. Alguns centímetros de areia solta não escondem nada.

Esconder errado, Moisés tinha agora de admitir, não faz nada para apagar o erro. Estou convencido de que, a partir daquele momento, Moisés decidiu nunca mais esconder coisa alguma outra vez. Ele seria transparente. Falaria francamente, apesar dos riscos da vulnerabilidade. Não ocultaria mais.

O músculo mais adâmico em todos nós é o "músculo do esconder". Isso retrocede ao Jardim do Éden. Era (e é) o reflexo clássico, a reação dos pecadores no mundo inteiro. Você não acha isso interessante? A primeira coisa que Adão e Eva fizeram foi esconder-se atrás de alguns arbustos quando ouviram Deus andando pelo jardim. Logo em seguida, para ocultar sua nudez, costuraram para si um par de biquínis ridículos feitos de folhas de figueira.

Você se recorda da cena? Deus veio passear com o homem e a mulher no frescor do dia, como sempre fizera. Mas onde se achava o pináculo da Criação? Onde se encontrava o homem que Deus formara do pó da terra? Estava escondido. Agachado atrás de um rododendro em flor, espiando por entre as folhas. E estamos nos escondendo desde então. Escondemo-nos das conseqüências das ações na carne. Ocultamos de nós mesmos a verdade sobre a nossa pessoa. Nas palavras de Mark Twain: "Somos todos como a Lua. Temos um lado escuro que não queremos que ninguém veja".

Por que não? Porque você e eu achamos muitíssimo, supremamente importante enfatizar a imagem e a aparência. Como parecemos a outros supera completamente quem realmente somos. O que quero saber é por quê.

Algum dia, em meu ministério, vou tomar coragem suficiente para ter um período de testemunho no qual a única coisa que vamos compartilhar serão os fracassos. Isso não seria diferente? Você já esteve numa reunião de testemunho na qual todos pareciam estar na

AS LIÇÕES DO FRACASSO 81

Nuvem 39 e você no Túnel Número 7? Uma pessoa depois da outra fala de voar pelos céus, enquanto você está contando invólucros de chicletes no esgoto. Por que não visitamos o outro lado? Por que não passar o microfone a outras pessoas e dizer: "Quando foi a última vez que você entrou em parafuso? Pode contar aos outros como se sentiu ao passar por uma grande decepção"?

Em vez de provocar depressão, aposto como esse poderia ser um forte encorajamento para um grupo de pessoas que se sentem sozinhas em suas lutas. Muitos acham que devem esconder seus fracassos, acreditando que ninguém mais poderia ter falhado como eles. Alguns temem até contar isso a Deus, com medo que ele se sinta tão desgostoso como imaginamos que outros vão ficar.

No entanto, Deus não é assim. Quando levamos um tombo e pedimos socorro em nossa vergonha e aflição, o salmista diz que ele "inclina o ouvido" em nossa direção. Dizemos: "Oh, Pai, fracassei! Falhei terrivelmente. Veja o que eu fiz!" Ele põe então o braço ao nosso redor, com o mesmo amor de um pai terreno, e responde: "Aceito você como é. Reconheço que o que fez é errado, como já confessou. Agora, meu filho, minha filha, vamos prosseguir".

Algumas das mais ternas experiências em minha vida de pai ocorreram quando meus filhos me disseram sinceramente: "Papai, sei que agi errado". E alguns dos momentos mais difíceis da vida de um pai acontecem quando o filho não quer admitir seu erro e tenta ocultá-lo.

Moisés, estou convencido, nunca mais ocultou nada. Ele aprendeu essa lição do fracasso. Aprendeu também uma quarta lição.

Este conceito é absolutamente estranho ao mundo secular. Como você obtém uma promoção no sistema mundial? Bem, tem de assumir um ar de total confiança. Prepara um currículo soberbo, chegando à beira do exagero. A seguir se apresenta em toda a sua armadura polida, bandeiras tremulantes ao vento, capaz de de-

82 MOISÉS: UM HOMEM DEDICADO F. GENEROSO

sempenhar o trabalho que for, desde chefe-executivo até subgerente (preferivelmente o primeiro).

Não é assim que ocorre na família de Deus, mas Moisés não entendera isso... pelo menos não até aquela época. Ele era um summa cum lande diplomado pela Universidade do Templo do Sol. Havia recebido suas insígnias numa destacada carreira militar. Era apenas uma questão de tempo até que fosse proclamado Faraó Moisés I (imagine só!). Subira por si mesmo (ou pelo menos era isso que imaginava) a escada do sucesso. Com tamanha confiança em sua capacidade, iniciar uma rebelião parecia algo bem fácil. Apenas saiu e agiu. Por que não? Isso era natural para esse homem.

Na vida espiritual, porém, é preciso que seja sobrenaturai. O mesmo princípio se aplica à seleção de líderes da igreja. Ou seja: freqüentemente achamos que porque alguém obteve muito sucesso nos negócios, então há grandes chances de ser um oficial de igreja bem-sucedido. Entretanto, isso não é verdade. Alguns homens e mulheres que conquistaram e realizaram muito na área corporativa são deploráveis no que diz respeito a cargos de liderança numa assembléia local. Não estamos procurando "líderes naturais" no Corpo de Cristo, mas líderes espirituais, designados por Deus. Essas pessoas podem parecer bem diferentes de seus equivalentes seculares.

Se você estiver se preparando para ser pastor, não se engane pensando que vai alcançar o ponto máximo e conseguir a igreja que quiser só porque tem carisma de sobra, porque mexeu os pauzinhos certos ou falou com as pessoas certas. Isso nunca acontece. Na maior parte das vezes, Deus vai chamá-lo exatamente para a igreja que você não queria.

É surpreendente ver quantas vezes Cynthia e eu tivemos de engolir nossas palavras durante os anos de nosso ministério juntos. No começo pensávamos que tínhamos todas as respostas. Dissemos ao Senhor: "Estamos prontos para servi-lo, Senhor, onde quer que nos mande, exceto em Dallas, New England e Califórnia".

Achamos isso razoável; esses eram três lugares onde nós simplesmente não queríamos morar. E claro que Deus não nos poria onde não desejávamos.

AS LIÇÕES DO FRACASSO 83

Adivinhe! É isso mesmo, você tem razão e sei que está sorrindo. Pastoreamos em todas essas áreas, uma seguida da outra, e Deus nos colocou nas três. Estamos agora de volta a Dallas, o primeiro lugar que dissemos que "não queríamos". Lembro-me de Cynthia ter olhado para mim certa vez e dito: "Chuck, você não vai me ouvir orando que não quero ir para o Alasca! Porque no momento em que eu disser não o Alasca, Senhor', seria melhor preparar seus minhocões e luvas de lã". Nós dois rimos alto e, a propósito, nunca dissemos "o Alasca não!"

E notável como Deus indica e direciona conforme lhe agrada, e temos pouco a dizer a respeito. Moisés aprendeu essa lição por meio do fracasso.

A.W. Tozer declara: "O líder verdadeiro e seguro é provavelmente aquele que não deseja liderar, mas é forçado a uma posição de liderança pela pressão interior do Espírito Santo e da situação externa".2 Foi isso que aconteceu com Davi e os profetas do Antigo Testamento. Até Saul, o primeiro rei de Israel, se escondeu entre a bagagem para não ser recrutado. Um homem mais baixo poderia ter tido sucesso, mas Saul era alto, e eles o pegaram.

Na igreja, não consigo me lembrar de um grande líder desde Paulo até hoje que não tivesse sido recrutado pelo Espírito Santo para a tarefa. A maioria dos grandes líderes da igreja não ergueu os olhos para as estrelas e disse: "Ah, ali está o meu destino, vou subir até o alto e respirar esse ar rarefeito". Na maioria das vezes, os candidatos de Deus à liderança ficam horrorizados ao serem escolhidos. Olham com desgosto a sua designação. Mal crêem nos ouvidos quando Deus diz: "Você é o homem". Ou: "Você é a mulher".

O autor Os Guiness nos faz recordar da experiência extraordinária de Martinho Lutero, que ilustra vivamente a surpresa dele ao ser usado por Deus para guiar tantos outros numa reforma que varreu a Europa. Ele escreve:

Subindo penosamente no escuro os degraus de uma catedral da Idade Média, ele procurou a corda da escadaria para firmarse e ficou surpreso ao ouvir o sino soar no alto — puxara inadvertidamente a corda do sino e acordara toda a zona rural.

84 MOISÉS: UM HOMF.M DEDICADO E GENEROSO

Longe de ser um homem com uma visão abrangente da reforma e com um plano preparado para executá-la, Lutero lutou penosamente pela salvação diante de Deus e ficou surpreso por iniciar o movimento cataclísmico do século XVI, que hoje chamamos simplesmente de Reforma.3

Sabe como eu sei que Moisés aprendeu humildemente esta lição? Porque quarenta anos mais tarde, junto à sarça ardente, quando Deus disse: "Você é o homem que vai salvar o povo do

Egito", Moisés respondeu: "Acho que está brincando, Senhor. Eu não. Sujeito errado, endereço errado. O Senhor provavelmente pretendia aparecer numa sarça diferente para outra pessoa, certo?

Lembra-se de mim? Sou o fracasso. O acabado. Quarenta anos atrás não sabia fazer as coisas e é claro que não sei fazê-las agora.

Não eu, Senhor".

"Sim, Moisés. Você."

"Não! Não! Não sei nem falar. Gaguejo muito."

"Vou usar sua boca."

"Mas não sei liderar. Já tenho problemas suficientes com umas poucas ovelhas."

"Vou ensiná-lo a liderar."

"Não está entendendo, não sei falar em público."

'Vou usar seu irmão. Ele falará por você."

"Hã... bem, já que insiste..."

O octogenário Moisés ficou sem palavras. Depois replicou relu- tantemente (com grande reserva): "Oh, está bem, Senhor. Mas não vai funcionar'.

Mas funcionou. Deus agiu e Moisés tornou-se o mais esplêndi- do líder que Israel já teve — designado por Deus, e não auto-impos- to. (Vamos examinar isso mais detalhadamente nos Capítulos 6 e 7.)

Esse foi o segredo puro e simples.

Ele mudou? Houve quaisquer mudanças estratégicas na vida de

Moisés? Sim, penso que houve algumas. Enquanto refletia sobre a transformação do homem, descobri pelo menos três.

AS LIÇÕES DO FRACASSO 85

O sacerdote de Midiã tinha sete filhas, as quais vieram a tirar água, e encheram os bebedouros para dar de beber ao rebanho de seu pai. Então vieram os pastores, e as enxotaram dali; Moisés, porém, se levantou, e as defendeu, e lhes deu de beber ao rebanho.

Êxodo 2:16-17

Moisés, o Príncipe do Egito, aliás o Príncipe Encantador, dando água aos animais? Por quê?

Porque Moisés havia acabado de provar o maior pedaço do man- jar de humildade que se pode imaginar. A essa altura, o homem estava pronto para qualquer coisa. Não é interessante, porém, que nesse incidente fora permitido a Moisés ser um libertador numa escala imensamente menor? Antes disso, ele pensou que seria o liberta- dor de uma nação. Tinha grandes sonhos e poderosas estratégias. Mas dessa vez Deus disse: "Quer um emprego de libertador? Então se levante e faça isso, filho. Comece nesse ponto. Há sete mulheres aqui em Midiã que precisam de um defensor nesse momento".

Moisés poderia ter dado de ombros. Poderia ter dito: "Ah, esqueça. Estou fora do negócio de libertação. Deixe outro fazer isso".

Não foi, porém, o que fez. Nesse ponto é que Moisés deu seu primeiro passo para tornar-se um homem dedicado e desinteressado.

As jovens diriam mais tarde ao pai: "Um egípcio nos livrou da mão dos pastores, e ainda nos tirou água e deu de beber ao rebanho" (v.19).

Não se tratava de Cecil B. DeMiüe com um elenco de milhares de pessoas rodeando o herói; foi apenas um pequeno ato de coragem. Matthew Henry escreve sobre esse incidente: "Ele gostava de fazer justiça e defender os que considerava prejudicados, o que todo homem deveria fazer desde que estivesse ao alcance de sua mão fazêlo. Gostava de fazer o bem. Onde quer que a Providência de Deus nos coloque, devemos desejar e tentar ser úteis; quando não pudermos fazer o bem que queremos, devemos estar prontos a fazer o bem que podemos. Àquele que é fiel no pouco será confiado o muito".4

86 MOISÉS: UM HOMEM DEDICADO F, GENEROSO

Esse pensamento me comove. Se você não puder fazer o bem que deseja, faça o bem que pode. É possível que tenha tido grandes planos em sua vida — sonhos grandiosos que não se realizaram. Ia escrever um best-seller, mas as oportunidades simplesmente não apareceram. Está disposto a escrever para o boletim informativo da igreja? Creia ou não, alguns de meus momentos mais satisfatórios como escritor ocorreram há muitos anos, quando trabalhei numa coluna semanal para um boletim informativo da igreja. Não era o Los Angeles Times nem o Christianity Today, mas essa tarefa me deu muita alegria e satisfação sinceras. Mais tarde, para minha absoluta surpresa, ele se regozijou em abençoar esses esforços de maneira mais ampla.

Você talvez tivesse desejado ensinar num seminário ou escola bíblica, mas as pressões da vida o forçaram numa direção diferente. Está disposto a ensinar uma classe de escola dominical? Liderar um pequeno grupo de estudo bíblico? E o ensino que o atrai, ou o prestígio que acompanha essa posição?

Talvez você esperasse ser um missionário e levar a Palavra de Cristo a pontos distantes da terra, mas por uma ou outra razão essa porta nunca se abriu. Está pronto para começar um estudo bíblico evangélico na sua vizinhança? Está preparado para trabalhar com pessoas de origem hispânica ou vietnamita na sua cidade? Disposto a mostrar simpatia por alguns estudantes solitários de outros países?

O fracasso, você sabe, nos ensina uma atitude de servo. E o que faz o servo? Ele faz "a tarefa seguinte". Faz o que está à espera dele. Os que não têm essa atitude resistem à idéia de pôr a mão na massa. Eles não querem envolver-se na parte complicada, que é trabalhar com pessoas. Querem sempre a parte nobre, a parte divertida. E o trabalho árduo dos bastidores? Dê isso para outro.

Deus usa, porém, nossos fracassos e retrocessos para cultivar em nós um coração de servo. Tudo isso está incluído no processo.

Notei também outra coisa que mudou em Moisés.

AS LIÇÕES DO FRACASSO 87

O sacerdote de Midiã tinha sete filhas, as quais vieram a tirar água, e encheram os bebedouros para dar de beber ao rebanho de seu pai. Então vieram os pastores, e as enxotaram dali; Moisés, porém, se levantou, e as defendeu, e lhes deu de beber ao rebanho. Tendo elas voltado a Reuel, seu pai, este lhes perguntou: Por que viestes hoje mais cedo? Responderam elas: Um egípcio nos livrou das mãos dos pastores, e ainda nos tirou água e deu de beber ao rebanho. E onde está ele? disse às filhas; por que deixastes lá o homem? chamai-o para que coma pão. Moisés consentiu em morar com aquele homem...

Êxodo 2:16-21

Preste atenção à última sentença: "Moisés consentiu em morar com aquele homem". Como isso é bom. Ali estava um homem que ele nunca vira antes; um sacerdote e pastor do deserto pouco conhecido, que passara a vida criando ovelhas (e filhas!) na faixa despovoada de terra conhecida como Midiã. "E ele deu a Moisés sua filha Zípora, a qual deu à luz um filho, a quem ele chamou Gérson, porque disse: Sou peregrino em terra estranha" (w. 21-22).

Moisés, que fora escolhido para casar-se com um tipo de beleza exótico, como o de Cleópatra no Egito, arrumou-se com uma pastora. Quando ela deu à luz seu primogênito, ele o chamou de Gérson, que significa "peregrino". Foi nisso que Moisés se transformou — um peregrino numa terra distante, esquecido e conhecido de poucos. Ele chegou a Midiã sem conhecer ninguém, não estava integrado às coisas do lugar, nem sequer tinha idéia de onde viveria. Mas quando Jetro disse: "Jovem, gostaria de morar conosco?" Moisés respondeu: "Sim, gostaria. Moro em qualquer lugar".

Deixe-me fazer-lhe uma pergunta direta: você está disposto a ser pouco conhecido? A mentalidade de servo lhe ensinará o que significa essa atitude. Em termos simples, no Corpo de Cristo alguns são chamados de pés. Nem todos podem ser uma mão direita, um olho ou uma orelha. Alguns têm de ser o pé, o calcanhar, os rins ou o fígado. Esses membros (esperamos) são raras vezes vistos. Mas se um

88 MOISÉS: UM HOMEM DEDICADO E GENEROSO

deles deixa de funcionar por algum tempo, cuidado! O corpo inteiro entra em colapso.

Moisés estava pronto para ser pouco conhecido, para viver longe dos holofotes, para aceitar sua nova condição. Pergunto novamente: e você? Deus usará o fracasso em sua vida para quebrar esse desejo intenso de ver seu nome nos luminosos. E quando finalmente extinguir essa ânsia de reconhecimento, ele talvez o ponha diante das luzes como nunca imaginou. Mas então isso não fará diferença. Você não se importará se estiver no primeiro ou no último lugar, no centro do palco ou atrás do cenário, liderando ou cuidando da bagagem. Você é apenas parte do exército do Rei. As pessoas abnegadas são sobretudo... disponíveis. E isso basta!

Moisés aprendeu ainda outra lição com seu fracasso.

ELE APRENDEU A REPOUSAR E A CONFIAR EM DEUS

Os três últimos versículos de Êxodo estão tão carregados de tristeza quanto vivos de esperança.

Decorridos muitos dias, morreu o rei do Egito; os filhos de Israel gemiam sob a servidão, e por causa dela clamaram, e o seu clamor subiu a Deus. Ouvindo Deus o seu gemido, lembrou-se da sua aliança com Abraão, com Isaque e com Jacó. E viu Deus os filhos de Israel, e atentou para a sua condição (w. 23-25).

E melhor que acredite que Moisés, embora vivesse num canto daquele deserto, ouviu as notícias da boca dos viajantes que seguiam para o Egito junto com as caravanas, ao passarem pelo deserto de Midiã.

Quando Moisés soube que os hebreus clamavam por livramento, deve ter sentido um golpe no coração. Contudo, ao contrário do que fizera antes, ele se acalmou e confiou em Deus. Não tentou reunir um grupo de resgate. Não retornou incógnito ao Egito como um assassino ou um sabotador. Nada disso! Ele aprendera a lição. Disse

AS LIÇÕES DO FRACASSO 89

simplesmente a seu coração: Deus sabe disso tudo. Quando estiver pronto ele vai operar. Devo deixar as coisas assim.

Há alguns anos, eu estava lendo uma publicação e deparei com um artigo de Ruth Myers. Ela e o primeiro marido, Dean Denler, haviam viajado pelas ilhas do Sul da Ásia e pelo Extremo Oriente, levando a música e a Palavra de Deus aonde quer que fossem. Dean, porém, perdeu uma batalha feroz contra o câncer, deixando Ruth viúva com dois filhos pequenos. Ela casou-se mais tarde com Warren Myers e certo dia resolveu parar e refletir sobre aquele período negro da sua vida. Como resultado dessa reflexão, Ruth escreveu estas palavras:

Lembro-me de uma primavera quando era viúva. Meus dois filhos enfrentavam problemas terríveis. Eu ficava deitada na cama, à noite, atormentada pela ansiedade. Embora orasse pelas necessidades deles, minhas preocupações sempre voltavam. Por que estava tão ansiosa? Na época eu temia fracassar como mãe — minha principal responsabilidade. Nem sequer tinha o pai deles para compartilhar a culpa comigo. Procurava então identidade no desempenho bem-sucedido.

Quando compreendi isso, passei a orar com novo discernimento. Disse: "Senhor, confesso minha ansiedade constante e confiança nas realizações bem-sucedidas e na aprovação de outros. Obrigada pelo seu perdão. Meus filhos são dedicados ao Senhor. Se as experiências difíceis pelas quais passarem vierem a glorificá-lo, mesmo que eu venha a ser um fracasso como mãe, o Senhor tem a minha permissão. Mesmo que isso signifique que tenha de aparecer diante dos olhos do mundo que me rodeia como um fracasso, o Senhor tem a minha permissão". A ansiedade persistente evaporou.

Você sabe quem continua erigindo todos esses padrões irreais na sua vida? Sabe quem fica levantando a altura da barra além de toda expectativa de saltar por sobre ela?

É você. É você que faz isso, e não nosso Pai Celestial; é o que nos diz o salmista. Ele conhece nossa estrutura. Lembra que somos pó.

90 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Pensamos que estamos acabados por causa dos nossos fracassos, mas Deus diz: "Você apenas começou. Avance!"

O problema não é termos falhado, mas que não falhamos o suficiente. Não nos rebaixamos o bastante para aprender o que Deus quer que aprendamos. Tentamos ainda remir sozinhos o Egito.

Lembra-se de uma canção dos anos 70 que costumávamos cantar? Ela mencionava como aprendemos que só devíamos confiar em Jesus e confiar em Deus "através de tudo". Não permanecendo na superfície, mas atravessando, indo além.

Através de tudo. Esse é o trunfo! Através das vitórias e dos fracassos. Através do Egito e dos midianitas. Através dos dias brilhantes de realizações e dos dias de tristeza junto ao poço. Através dos períodos vibrantes de risos e sucessos e dos intervalos anônimos de reveses e desespero. Através de tudo, ele está conosco, nos guiando, ensinando, humilhando, preparando.

Ao término deste capítulo, sou grato porque numa área da vida — não importa quem sejamos nem qual nossa origem — estamos todos no mesmo nível. Todos nos qualificamos como fracassos. Todos!

O que queremos então provar? Quem você está querendo impressionar? Por que não sai dessa rotina para ser apenas você mesmo? Suplique ao Espírito de Deus que o prepare e use como for do seu agrado, com seu lado escuro e tudo o mais. Vai ficar surpreso ao ver como isso alivia a pressão.

Nesse exato momento, você e eu somos os recipientes de um dom que nos foi concedido por aquele que nos ama como somos, com nosso lado escuro, com nossas marcas, fracassos e tudo o mais. Uma vez que isso é um dom, você deve abrir as mãos e recebê-lo. Olhe bem — ali está o seu nome na etiqueta, logo abaixo da fita.

O dom é chamado graça.

CAPÍTULO CINCO$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Você espera de si mesmo uma vida cristã de "felizes para sempre"; como seria libertador aceitar que Deus usa também os períodos de derrota no seu processo de crescimento?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O salmista disse que foi bom ter passado pela aflição para aprender os mandamentos de Deus; que lição duradoura um fracasso recente está tentando lhe ensinar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$As pessoas mais sensíveis ao Espírito costumam carregar cicatrizes de quebrantamento; de que modo as suas próprias feridas têm tornado seu coração mais dócil diante de Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Deserto: A Escola da Autodescoberta$t$, 5,
$conteudo$estido de beca e barrete, cada um dos filhos dos Swindoll caminhou pela plataforma para receber o diploma da escola secundária, descendo em seguida as escadas rumo ao próximo capítulo da vida.

Antes desse momento, porém, antes que o som majestoso da música Pompa e Circunstância enchesse o auditório, antes que papai e mamãe se deixassem arrastar por uma forte onda de nostalgia, cada integrante do nosso clã já lutava com a questão da faculdade.

Ir ou não ir. Trabalhar algum tempo, divertir-se um pouco ou mergulhar de cabeça. Morar em casa ou aventurar-se em um lugar no qual nenhum Swindoll já estivera antes. Faculdade particular, cristã ou estadual? Grande ou pequena, ou nada de escola? O que seria?

Se você já passou por isso, sabe que o processo é às vezes emocionante e outras, angustioso. Nossa família passou por todas as fases: folhetos, catálogos, visitas ao câmpus, telefonemas da secretaria, o trauma das decisões, discordâncias súbitas e correções agoniadas no meio do curso.

Aos poucos a lista de candidatos diminui, as opções extremadas se evaporam no calor implacável da realidade ("Não, filho, não tenho certeza sobre a Universidade de Fiji"), e a melhor escolha se torna cada vez mais óbvia e lógica.

92 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Chega então aquele momento na porta de casa, quando o carro está lotado até o teto, e aquele rapazinho ou mocinha vai embora. Todos hesitamos junto ao carro, sabendo que a vida vai mudar quando ele partir. Abraços, beijos, coisas de última hora para lembrar, advertências sérias, mais abraços... e lágrimas. O carro se afasta finalmente e o papai e a mamãe, de braços dados na entrada vazia, ficam pensando em como o tempo passa.

Essa é a rotina comum no mundo universitário, nos Estados Unidos. Deus também tem uma escola. Você sabia disso? E não há nada de comum nela. Não há dormitórios, nem laboratório de ciências ou campo de futebol. Não está listada em nenhum catálogo, revista ou site da Internet. O conselho escolar talvez não saiba nada sobre ela. Contudo, é uma das instituições de aprendizado mais respeitosas que você pode freqüentar.

Eu sei. Fui aluno. Estive lá... mais de uma vez. E possível que você tenha também freqüentado essa escola. Como um pai que ama seus filhos, não posso dizer que fico ansioso para que meus filhos freqüentem essa escola. Por outro lado, sendo a vida como é, sei que eles provavelmente farão isso. Desde que experimentei a voz e a presença do Senhor Deus nesse lugar, não posso deixar de desejar ansiosamente que cada um de meus filhos e filhas o conheçam como eu o venho conhecendo, ouçam sua voz como eu a ouvi. Contudo, em meu coração de pai, gostaria de poupar-lhes o custo dessa instrução, que pode ser muito alto.

Estou me referindo à escola de Deus no deserto. Falo desse câmpus árido, geralmente estéril, em que Deus põe seus filhos com o propósito de prepará-los para uma tarefa especial na vida. Não há nada de charmoso, colorido ou atraente nesse deserto em particular. Nem foi destinado a ser qualquer dessas coisas. Não é como o deserto de Palm ou o de Sedona. De fato, provavelmente é mais semelhante ao do Saara ou Serengeti.

É uma região desolada: rochas escarpadas, areia onde ninguém pisa, calor insuportável. Alguns passam umas poucas semanas nesse deserto. Outros, ficam ali meses. Moisés andou por essas terras

O DESERTO: A ESCOLA DA AUTODESCOBERTA 93

áridas durante quarenta anos. Q-u-a-r-e-n-t-a anos, você leu corretamente.

AS MUITAS FACES DO DESERTO

Talvez seja útil você saber que o termo hebraico para "deserto" é midbaar, originário de dahbaar, que significa "falar". Partindo disso, deixe-me dizer-lhe que o deserto é o lugar onde Deus fala, onde ele nos comunica suas mais importantes mensagens.

Se não fosse essa experiência do deserto, você e eu poderíamos passar a vida inteira sem ouvir ou conhecer o que o Deus do universo deseja nos dizer. O deserto muda isso. Nesse lugar solitário, você é despojado de todas as coisas das quais depende para o seu conforto — tudo o que pensou que precisaria em sua vida, mas na verdade não precisa absolutamente.

O silêncio reina nessas vastidões de areia — silêncio tão profundo que você pode ouvir o som do seu pulso no ouvido, tão quieto que pode ouvir a voz de Deus.

Lembro-me de um deserto — um deserto verdadeiro — em que estive há alguns anos. Fui convidado para juntar-me a um grupo de presbíteros de outra igreja para uma reunião de planejamento. Para chegar ao lugar marcado, tive de dirigir vários quilômetros através de um trecho do deserto ao sul da Califórnia. A caminho de casa, num impulso, saí da via principal e entrei numa estradinha tortuosa que penetrava naquela região selvagem e solitária. Saí do carro e no calor do fim da tarde passeei pela areia e o mato rasteiro, chegando finalmente a um ponto em que não mais se avistava a estrada e o carro.

Não sei o que me atraiu para lá. Talvez sentisse a necessidade de me integrar àquela rara solidão por alguns minutos. E foi o que fiz. Fiquei ali parado por algum tempo, completamente sozinho.

Um vento do deserto começou a soprar através daquela vastidão de terra árida. Não se ouvia nenhum outro som. Nada. Senti o sol forte queimando minha pele e o golpe da areia açoitada pelo vento. Apertando os olhos contra a claridade, corri os olhos pelo horizonte

94 MOISÉS: UM HOMEM DEDICADO E GENEROSO

que cintilava por causa do calor. Era um lugar seco e devastado. Nenhuma fruta. Nenhum arbusto, nada de gramados verdejantes. Nem chácaras carregadas de frutos. Nenhum riacho ressoando nas pedras. Embora soubesse que o carro e a estrada estavam bem perto, senti-me estranhamente transferido para um outro mundo. A solidão começou a me pressionar à medida que permanecia naquele lugar esquecido do mundo. O silêncio me envolveu como uma segunda pele.

O seu interlúdio árido pode não ocorrer num deserto literal. Ele talvez aconteça num acampamento no Alasca, num camping destinado a trailers na Geórgia, numa fazenda no Kansas ou num apartamento luxuoso num ponto alto de Seattle. Sua experiência no deserto pode, entre outras coisas, significar cuidar de um membro doente da família ou de um pai idoso durante um longo período, sem ajuda próxima e sem alívio à vista. Sua viagem às terras áridas pode ser uma condição física inflexível que o mantenha confinado. Poderia ser aquela profunda dor de alma que nos fere por causa de um cônjuge infiel ou de um adolescente rebelde. Talvez seja a mudança de um lugar onde haja profundos laços familiares e muitos amigos para outro que lhe pareça estranho, onde você não conhece ninguém. Você se sente deslocado... podado. Pode ser um fracasso na escola, a desavença com um velho amigo, um emprego maçante e desmotivador ou um prazo que o atormenta como um pesado fardo.

O deserto tem muitas faces. Pode estar lotado de pessoas, mas continua solitário. Pode chover dia e noite sem parar, ainda assim continua estéril. As flores e as árvores podem estar floridas ao seu redor, mas o lugar é árido.

Deus sabe disso? Ele compreende? Compreende muito bem, meu amigo. Afinal, foi ele que pôs você ali. Sua escola inclui tempo no deserto. É ali que ele tem nossa atenção.

DESERTO IOI

Em Deuteronômio 32, o Espírito Santo escreve estas palavras sobre a nação de Israel. Permita-me aplicá-las de maneira muito pessoal.

O DESERTO: A ESCOLA DA AUTODESCOBERTA 95

"Achou-o numa terra deserta, e num ermo solitário povoado de uivos; rodeou-o e cuidou dele, guardou-o como a menina dos olhos" (v. 10).

O "ele" oculto nesse versículo é Deus, e o "dele" é uma referência aos judeus. Vamos, então, personalizar as palavras do Senhor aqui. Vamos pôr seu nome no versículo em lugar do "dele". Deus encontrou (você) numa terra deserta... Deus encontrou (você) num ermo solitário povoado de uivos. Deus rodeou você. Cuidou de você. E guardou-o como a menina dos olhos.

O Senhor, que o colocou nessa terra deserta, sabe exatamente de que experiência de deserto você precisa. Ele conhece o lugar em que as distrações da vida serão silenciadas e você poderá ouvir a voz dele. O seu "ermo solitário povoado de uivos" talvez seja bem diferente do meu. Deus conhece cada um de nós e os recônditos do nosso coração; ele compreende o que será necessário para livrar-nos das muletas que nos impedem de correr segundo a sua vontade e dos ruídos que não nos deixam ouvir suas palavras de conselho e terno amor. Ele sabe como examinar nosso currículo nessa escola do deserto, formando qualidades de caráter em nossa vida que não poderíamos obter de outra maneira.

O isolamento sempre faz parte da experiência do deserto. Nunca esqueça isso. Uma vez que Deus encontra o deserto de que você precisa, ele o faz descer do ônibus e continua a viagem. Pelo menos as coisas parecem assim. Seu sentimento imediato é: Deus foi embora! Onde ele está? Ele me deixou nesse lugar! Em meio a essa penosa experiência, você descobre que não pode mais fazer as coisas que antes lhe eram permitidas. O medo se instala. Você diz a si mesmo: Vou perder meus dons. Vou perder minha utilidade. Fui esquecido! Deus me deixou para trás. O tempo está acabando. Não vejo oportunidades para mim. Jamais vou sair desse lugar.

A nação de Israel, enquanto peregrinava pelo deserto do Sinai, deve ter-se sentido desse modo. Moisés, já na meia-idade, tão longe da única terra que conhecera, sem possibilidade (ou era isso que pensava) de voltar, certamente experimentou alguns desses pensamentos e emoções.

96 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Antes de cedermos aos sentimentos de abandono, precisamos, porém, olhar mais de perto e de modo mais pessoal este versículo de Deuteronômio. No "ermo solitário povoado de uivos", Deus faz quatro coisas. Se você estiver com a Bíblia aberta, recomendo pegar uma caneta e sublinhar cada uma.

Primeira, ele nos rodeia. Segunda, ele cuida de nós. Terceira, ele nos guarda como a menina dos olhos. Quanta beleza nessas palavras! Ao pensar sobre isso, você compreende que a menina dos olhos é a parte mais protegida do corpo. Você não deixa nada tocá-la. Protege-a com muito cuidado. Protege-a do sol. Cuida dela constantemente. Se o menor cisco tocar sua membrana, você toma medidas imediatas para livrar-se dele.

No deserto, você é a menina dos olhos de Deus. Para sua surpresa, vai descobrir também que Deus não o abandonou nem o esqueceu. De fato, ele tem cuidado mais de você do que em qualquer outra ocasião de sua vida. Que esse pensamento o anime, meu amigo, se estiver no deserto hoje.

Note os dois versículos que seguem o versículo 10: "Como a águia desperta a sua ninhada e voeja sobre os seus filhotes, estende as suas asas, e, tomando-os, os leva sobre elas, assim, só o Senhor o guiou..." (w. 11-12)

A quarta coisa que ele faz é guiar-nos. Independentemente de você saber disso ou não, de sentir isso ou não e até de acreditar nisso ou não, Deus não largou mão de sua vida. Você se sentiu nu e exposto naquela terra vazia, entretanto, ele o cobriu com suas asas o tempo todo. Você foi protegido pelas asas do Deus Altíssimo.

Sinto-me atraído pela palavra "só" no versículo 12. Só ele está guiando você. Não há mais ninguém para conduzi-lo através do deserto. Não há sinais, nem quiosques de informação, nem mapas com flechas dizendo: "Você está aqui". Na verdade, você não sabe onde se encontra. Não sabe quando (ou se) sairá um dia desse deserto opressivo. Contudo, a Bíblia nos diz que só ele irá guiá-lo. Você está reservado só para Deus.

O DESERTO: A ESCOLA DA AUTODESCOBERTA 97

PORTAS PARA O DESERTO

É possível que eu esteja escrevendo a alguém que tenha recebido uma educação invejável e várias perspectivas interessantes ao sair da faculdade. Mas agora, por uma razão qualquer, você se encontra num beco sem saída.

Você talvez seja um estudante e atleta que tenha trabalhado durante anos no aprimoramento de suas habilidades só para se ver rejeitado no último ano porque um novato, que tem indicação, ficou com o seu lugar.

Pode ser que você tenha gozado de boa saúde durante a maior parte da sua vida e, de repente, o médico diz: "Notei uma mancha em seu pulmão. Francamente, não estou gostando da aparência dela. Acho que há malignidade".

Informação desse tipo deixa você desnorteado e seu coração grita: Onde está Deus? Como vou enfrentar isso? O que devo fazer?

Talvez você seja solteiro e esteja esperando que a pessoa certa entre em sua vida. Com o passar dos meses e dos anos, essa esperança que acalentou como uma chama secreta e viva começa a bruxulear. Há alguns anos, recortei um poema de uma revista cristã. A escritora, Natalie Ray, captou os sentimentos de rejeição em sua poesia "No Lover" ("Sem Amor").

Nenhum namorado pede meu beijo quando um novo dia desponta, Nenhuma mão se estende para a minha por sobre a mesa. Nenhum filho precioso se aninha em meu peito. Ninguém precisa do meu amor. Onde está o sinal De que Deus, meu Pai, me ama? É ele que certamente Cria esta riqueza de amor que transborda. Como aconteceu de alguém que nunca me quis Tenha se tornado meu? Por que os recusei?

Será que importam mesmo, todos os Porquês? Será que todas as respostas eliminariam a dor,

98 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Ou todas as razões secariam meus olhos? Embora viessem da corte celestial? Não, eu choraria de novo, Meu Deus, tu que me salvaste do negro abismo do inferno; Oh, salva-me da tirania da amargura!1

Eis uma mulher buscando ouvir a voz de Deus no deserto. Para outros, é a angústia implacável de um ente querido que partiu sem a esperança de que ele retorne um dia. Isso pode ter começado no dia em que chegou em casa do trabalho e descobriu um bilhete deixado por sua mulher. O armário e as gavetas estavam vazios. Ela partiu. E os ventos uivantes começaram a soprar. Ou você descobriu, mediante uma série de eventos, que seu marido foi infiel. Outra porta para o deserto!

Ele é seco. Ele é solitário. Você se sente deprimido e triste. Mas seja lá o que suas emoções estejam lhe dizendo, a Bíblia diz que você não está sozinho. Deus está presente. Ele o rodeia. Cuida de você. Protege você como a menina dos olhos. E promete guiá-lo por essa estranha habitação sem fronteiras nem caminhos. Você não o deixou, nem ele deixou você. De fato, ele pode estar mais perto de você neste momento do que jamais esteve antes.

Quando terminava este parágrafo, pensei comigo mesmo como é interessante que Deus tenha posto Moisés no deserto durante quarenta anos e depois o fizesse dar meia-volta e guiar os filhos de Israel durante mais quarenta anos, justamente no deserto. (O tempo que ele passou no Egito nesse intervalo não foi um interlúdio festivo!) Você já pensou nisso? Moisés estudou quatro décadas no deserto, a fim de aprender como guiar uma nação inteira através de um deserto semelhante.

Ouça o que Moisés disse aos israelitas quando estavam prestes a entrar na Terra Prometida: "Recordar-te-ás de todo o caminho, pelo qual o Senhor teu Deus te guiou no deserto estes quarenta anos, para te humilhar, para te provar, para saber o que estava no teu coração, se guardarias ou não os seus mandamentos" (Dt 8:2).

O DESERTO: A ESCOLA DA AUTODESCOBERTA 99

Por que Deus nos guia por lugares desertos? Vamos deixar a resposta com Moisés, que fez um curso avançado na Escola do Deserto de Deus. Isso acontece para que ele possa nos tornar humildes, nos testar e revelar o verdadeiro estado do nosso coração. Não para que Deus possa conhecer você (ele já conhece), mas para que você possa vir a se conhecer. Não há nada como o deserto para ajudá-lo a conhecer seu eu verdadeiro. Quando todos os enfeites, as máscaras e os trajes falsos são removidos, você começa a ver uma identidade verdadeira — um rosto que não aparecia há anos. Talvez que nunca tenha aparecido.

Foi isso que o deserto fez para Moisés. Foi isso que fez para mim, nas viagens ao deserto de minha vida. Ele vai torná-lo humilde e vai lhe mostrar seus pontos fortes e fracos. Vai ajudá-lo a descobrir a si mesmo como nunca conseguiu antes.

O clássico hino Que Firme Fundamento (1787) expressa bem esse pensamento. Minha estrofe favorita é esta:

Quando teu caminho estiver cheio de tropeços, Minha graça toda-suficiente será teu consolo; As chamas não te ferirão, pois só quero Consumir tuas impurezas, refinar teu ouro.2

Deus jamais nos põe na fornalha ardente do deserto para nos destruir. Ele quer nos refinar. Em meio a esse ermo solitário povoado de uivos, expostos ao processo do tempo, a areia penetra por entre a ferrugem e a corrosão, e nos tornamos uma ferramenta útil nas mãos dele.

Houve várias ocasiões no meu passado em que tive a agradável experiência de conhecer homens e mulheres temperados nesse deserto. Você pode sempre descobrir — às vezes numa questão de segundos — quando encontra indivíduos que ele assim refinou. São os indivíduos mais confiáveis, sinceramente humildes, bondosos e honestos que se pode imaginar. Foi necessário o deserto para isso. Como diz o hino com tamanha eloqüência, suas impurezas foram consumidas e seu ouro, refinado.

100 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Esse é o tipo de vida que o salmista almejava quando escreveu as palavras abaixo. Ele passara por aflições. O Senhor o enviara para um curso prolongado de estudo num deserto desconhecido. Mas ele tinha esta esperança: no final de tudo, queria ser o homem que pudesse levar coragem e esperança ao povo de Deus.

Alegraram-se os que te temem quando me viram, porque na tua palavra tenho esperado...

Voltem-se para mim os que te temem, e os que conhecem os teus testemunhos.

Salmo 119:74,79

Antes de continuarmos este capítulo sobre a escola de autodescoberta de Deus, vamos voltar à narrativa de Moisés.

À SOMBRA DO SINAI

Apascentava Moisés o rebanho de Jetro, seu sogro, sacerdote de Midiã; e, levando o rebanho para o lado ocidental do deserto, chegou ao monte de Deus, a Horebe.

Êxodo 3:1

Moisés estava à sombra do Sinai, justamente a montanha sobre a qual Deus desceria com nuvens, fogo e terremoto para encontrar-se com os filhos de Israel. Na ocasião, entretanto, Moisés não estava pensando em nada tão profundo ou cataclísmico. Com o olho atento do pastor, ele mais provavelmente perscrutava aquele lugar desolado em busca de um pouco de relva para sustentar seu rebanho de ovelhas.

No álbum de fotografias que mencionei antes há uma foto do lugar onde Moisés provavelmente se encontrava naquele dia. Se você conseguir ver qualquer grama naquela área calcinada pelo sol, tem então melhores olhos que eu! Beno Rothenberg, autor do livro God's Wilderness, o denomina de lugar onde "o tempo parou". É uma área onde não existe verde, tão abandonada e agreste como uma paisagem lunar. Aqui e ali grandes pedaços de rochas se unem desordenadamente,

O DESERTO: A ESCOLA DA AUTODESCOBERTA 101 como os destroços de um templo bombardeado. É difícil caminhar sem tropeçar nas rochas.

Lembro-me de um velho comercial de um cartão de crédito em que um balconista estranho, grisalho, num prédio caindo aos pedaços, cumprimenta um cliente com as palavras: "Bem-vindo... ao último lugar na terra". A idéia do comercial é que mesmo ali eles aceitavam o Visa.

Essas são as palavras que me passam pela mente enquanto estudo essa fotografia de Midiã: o último lugar na terra — um lugar em que nem mesmo um cartão Visa compraria um refrigerante para você. Se há um lugar que poderia ser chamado de "parte de trás do deserto", é esse.

Os hebreus tinham um modo interessante de localizar as coisas. Eles olhavam para o leste, e tudo o que estava atrás deles, a área ocidental, era chamada de "parte de trás". O norte, sul, leste e oeste eram determinados com base na direção para a qual olhavam. Eles olhavam para o leste, na direção do sol, para determinar onde estava o norte, o sul ou o oeste. Moisés naquele momento estava a oeste, ou na parte de trás do deserto.

Ele não chegou ali num ônibus com ar-condicionado. Não apareceu para uma semana de lazer, montando camelos, colecionando rochas e filmando a paisagem pitoresca com sua câmera antes de voltar ao seu carro motorizado e todo estofado. Nada disso. Moisés fora àquele lugar para viver. O deserto era seu endereço.

Você já teve oportunidade de passar de carro por uma faixa esquecida de terra e virar-se para sua esposa ou amigo e dizer: "Nossa! Você não fica alegre de não morar aqui?" E, sem pensar, pisa um pouco mais no acelerador, voando por aqueles quilômetros de terra de ninguém para chegar ao conforto do lar.

Moisés, porém, não podia escapar à solidão; ali era sua casa. O filho de Anrão e Joquebede chegou a Midiã e descarregou sua bagagem. Era ali que fixaria sua caixa de correio no solo, embora não tivesse deixado endereço postal.

Sua localização não era muito atraente. Nem sua profissão. Era um pastor que trabalhava para o sogro. Nem sequer tinha seu pró-

102 MOISÉS: UM HOMEM DEDICADO E GENEROSO

prio rebanho. Casou-se com a filha do homem, tomou emprestado um cajado de pastor, de segunda mão, e disse: "Tudo bem. Mas, onde estão as ovelhas?" Ao longo do caminho teve dois filhos, como lemos em Atos 7:29. Moisés continuou então vivendo seus três papéis: o de marido, pai e pastor. E isso é tudo. Ele e a monotonia se tornaram companheiros inseparáveis.

NADA DE ATALHOS

E possível acreditar? Um indivíduo com conhecimentos avançados em hieróglifos, ciência, literatura e táticas militares prolongava então sua existência na parte de trás do deserto, vivendo com o sogro, criando dois meninos e cuidando de pequenos rebanhos de ovelhas.

Esse, amigo, é um deserto. Um autor declarou sabiamente: "O tempo não é um obstáculo para Deus, que exige qualidade a todo custo. Não há, portanto, motivo para irritar-se com a disciplina dos anos de treinamento ou em tentar seguir um atalho. Isso inevitavelmente o levará a um beco sem saída".3

Que verdade! Se você quiser encurtar sua jornada pelo deserto, chegará a uma rua sem saída. Você se lembra daqueles velhos filmes de faroeste em que os bandidos cavalgavam à frente da multidão e um dos auxiliares da delegacia invariavelmente gritava: "Eles estão fugindo, xerife!" e o homem da lei dizia com um sorriso: "Esses coitados estão indo direto para um desfiladeiro. Nós os apanharemos!"

Não é possível sair de um desfiladeiro nem de um beco sem saída. Você não pode atravessá-los. Do mesmo modo, não há atalhos para sair do deserto onde Deus o colocou; todas as possibilidades de fuga previstas acabam em becos sem saída. Muitos passam o tempo correndo de um beco para outro, ficando confusos durante o processo. Deus diz: "Você deve ficar onde eu o coloquei até que o tire daí".

Moisés, o antigo e poderoso Príncipe do Egito, aprendeu como era compartilhar a vida com uma mulher e dois filhos pequenos.

O DESERTO: A ESCOLA DA AUTODESCOBERTA 103

Você pocie imaginar como deviam ser aqueles dois moleques, crescendo num lugar assim? A verdade é que não há nada como crianças pequenas para humilhar os de educação mais avançada. Um doutorado em filosofia não é absolutamente útil quando você está tentando deter dois garotos levados, decididos a aprontar!

Ali estava então Moisés, com inúmeros diplomas, trocando fraldas, brincando de esconde-esconde e tentando alimentar aquelas bocas pequeninas. Os peritos podem ensinar-lhe todo o processo científico dos componentes do alimento infantil, como ele foi fabricado e como é digerido. Mas ainda não conseguem dizer-lhe como pôr a comida na boca de uma criança. Alimentá-las é algo que depende apenas de você.

Tudo isso faz parte do deserto. No deserto, você aprende a fazer coisas que nunca sonhou. Aprende a tolerar inconveniências e a suportar a situação; aprende a aceitar circunstâncias que nunca imaginou que viessem a fazer parte da sua vida. Tudo isso está de acordo com o treinamento. Essa é apenas uma fase do currículo da universidade de Deus no deserto.

já lhe falei sobre os cursos oferecidos nessa escola? Você não vai encontrar um programa como o dela em lugar nenhum! Há quatro cursos de especialização nessa universidade.

UMA ESPECIALIZAÇÃO EM OBSCURIDADE

Como mencionei no capítulo anterior, o deserto é um lugar de obscuridade. Moisés teve de enfrentar o fato de não ser ninguém. Durante toda a sua adolescência e idade adulta, ele sempre fora um alguém importante. Os holofotes seguiam seus passos, assim como os holofotes contemporâneos seguem os príncipes William e Harry da Inglaterra. Cada vez que Moisés ficava de pé, as pessoas olhavam para cima com expectativa. Cada vez que se dirigia a elas, paravam de falar e prestavam atenção. Cada vez que andava pelas ruas, as cabeças se voltavam para olhá-lo.

As ovelhas não fazem isso.

104 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Você pode dizer o que quiser, pode até recitar poesia, e o rebanho não ficará nem um pouco impressionado. Continuará comendo. Por mais que você e eu apreciemos malhas e meias de lã, as ovelhas são animais basicamente pouco inteligentes e passivos. E Moisés teve o prazer de sua companhia durante quatro longas décadas da vida.

"Apascentava Moisés o rebanho de Jetro, seu sogro". Isso não é humilhante? Imagine um velho amigo de juventude de Moisés chegando a Midiã para visitar o ex-príncipe — talvez um de seus colegas fraternos do Templo do Sol. Quando o amigo desce do carro incrementado, olha Moisés de alto a baixo, nota o cabelo despenteado, a barba e as roupas simples feitas em casa.

— Então, príncipe Moisés, como se sustenta agora? — Bem, sou um pastor. — Verdade? Quem diria! Tem seu próprio rebanho? Um grande negócio?

— Não. Essas ovelhas não são minhas. Trabalho para o pai de minha mulher.

— Trabalha para o seu sogro*. — Trabalho. — Vamos ver se entendi direito. Você anda ao lado das ovelhas. Esse é o seu trabalho.

— Exatamente.

— Olhe, nem sei o que dizer, Moisés. Boa noite, homem. E todo o seu treinamento? Você era o melhor!

— Não tenho nada a dizer sobre isso. Tudo o que sei é que Deus me quer aqui. E aqui que vou ficar.

Você talvez se identifique com essa situação. Enquanto lê, concorda meneando a cabeça. Também está fazendo um curso em obscuridade; você luta todos os dias com as limitações que lhe foram impostas. Foi forçado, pela própria natureza do deserto, a desistir de muitos dos privilégios, vantagens e atividades que mais apreciava. Agora apenas "sobrevive", subsistindo com os elementos básicos da vida.

O DESERTO: A ESCOLA DA AUTODESCOBERTA 105

Esse é o plano de Deus, meu amigo. Se quiser diplomar-se em sua escola do deserto, deve assistir às aulas de obscuridade; é o pri- meiro curso obrigatório.

Amy Carmichael, uma de minhas poetisas favoritas, escreveu estas palavras:

Antes que cessem os ventos que sopram, Ensina-me a habitar na tua calma: Antes da dor ter passado pacificamente,

Dá-me, meu Deus, um salmo para cantar. Não me recuses a possibilidade de provar A plenitude do amor que capacita. Oh, amor de Deus, faz isto por mim: Mantém uma vitória constante.4

Esta é a verdade sem disfarces: Se você não aprender a viver paci- ficamente com a obscuridade, irá repetir essa matéria até aprender. Não é possível deixá-la de lado e ganhar o diploma.

No filme O Refúgio Secreto, uma cena mostra Corrie Ten Boom dizendo ao Senhor que seu desejo é que ele faça uso dela conforme lhe agrade, mesmo que isso signifique deixá-la na obscuridade. Em seguida, ela é presa pelos nazistas, junto com o pai, de quem acaba se separando. O pai morre no campo da morte e ela é afastada da irmã que tanto amava. Os nazistas atiraram Corrie numa cela fria e úmida na Alemanha.

Quando a cena termina, a moça está tremendo num canto e, com os olhos cheios de lágrimas, sussurra para o Senhor: "Mas, Deus, eu não sabia que tinha de ficar sozinha!"

Isso é obscuridade. Podemos lidar com quase tudo enquanto houver pessoas ao nosso redor que nos encoragem e nos ajudem a carregar nosso fardo. Mas na escola do deserto o câmpus está vazio. Não há ninguém no grêmio estudantil, exceto você, um manual intitulado Obscuridade e muito tempo para lê-lo.

106 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Moisés fugiu e tornou-se peregrino na terra de Midiã, onde lhe nasceram dois filhos. Decorridos quarenta anos...

Atos 7:29-30

Sublinhei em minha Bíblia as palavras "quarenta anos" simplesmente porque não quero que o impacto dessa frase escape à minha atenção. Nosso personagem chegou ao deserto como um estrangeiro, e quarenta anos mais tarde o curso terminou. Lembro-me de ter pregado uma série de mensagens sobre Moisés em meu presbitério anterior, aos quarenta anos. Naquela época me impressionou a idéia de que Moisés passara tantos anos quanto eu tinha de vida no deserto de Midiã. Ele entrou no deserto aos quarenta e só partiu quando chegou aos oitenta. Durante esses anos — considerados por muitos como os mais produtivos da vida do indivíduo — Moisés cuidou de ovelhas no que poderia ter sido muito bem o jardim do Hades.

Você está entre quarenta e oitenta anos e se encontra num deserto? Bem-vindo a bordo. Isso faz parte do plano dele. Deus não só planeja a largura de um teste, como também o comprimento. Seu tempo é tão significativo quanto seu teste. Ele sabe quando você precisa do deserto e quando está pronto para prosseguir.

Vivemos hoje numa cultura de microondas. Se forem necessários mais de cinco minutos para preparar o almoço, é tempo demais! Antigamente, era até preciso esperar que a televisão aquecesse. Pode imaginar? Você não poderia apertar uma única tecla em seu telefone para chamar alguém, tinha de discar... com o dedo, que horror! Quase idade da pedra! Lembro-me de ter passado por um terreno baldio há algum tempo e depois de várias semanas voltei à mesma esquina. Onde antes só havia relva e ervas daninhas, latas vazias de cerveja e lixo, encontrei então um enorme armazém, construído com módulos pré-fabricados, pronto para receber mercadorias.

Ávida hoje é desse jeito. Apressada. Comprimida. Condensada. Do tipo tudo pronto estrondosamente. Mas não é assim na escola do deserto. Quando se trata de andar com Deus, não existe maturidade

O DESERTO: A ESCOLA DA AUTODESCOBERTA 107 instantânea. Deus não produz seus santos em massa. Ele entrega ferramentas a cada um e sempre leva mais tempo do que o esperado.

Um ativista impaciente como Moisés precisava daqueles anos no deserto para relaxar — sair da pista rápida e entrar na pista de Deus. O trabalho de Deus era minuciosamente lento, é verdade; mas tinha o propósito de moldar Moisés e depois usá-lo como nenhum homem fora usado antes.

UMA ESPECIALIZAÇÃO EM SOLIDÃO

O silêncio é estranho para você e para mim. Essa é a razão de quase entrarmos em pânico quando nos vemos sozinhos. Essa é a razão pela qual alguns mal suportam sentar num carro ou numa sala sem um ruído eletrônico como pano de fundo. Eu costumava ficar surpreso ao ver pessoas andando pela pista ou passeando pela vizinhança com fones de ouvido. Agora mal noto isso, tornou-se absolutamente comum.

Quando naquela vez no deserto saí do carro e me afastei da rodovia (o suficiente para saber que não queria ficar lá por muito tempo), a primeira coisa que me impressionou foi o silêncio total. Até que o vento passou, lamentoso, sacudindo a areia, não havia um som sequer — nem mesmo o chilrear de um grilo ou o zumbido de um mosquito. Apenas mantive-me ali, absorvendo a atmosfera por algum tempo.

A solidão tem um som interessante. Eu já tinha quase esquecido como era. Se você também esqueceu, precisa fazer uma viagem. Vá tão longe quanto puder, para fugir do movimento e da tagarelice da civilização. Não vá à praia, pois esse é um lugar onde o ruído das ondas indo e vindo é constante. Você precisa ir às montanhas, ou ao deserto, ou ainda a uma ampla pradaria em algum lugar. E, por favor, deixe seu Walkman e toca-CDs em casa. Dedique algum tempo à quietude e ouça o som profundo do silêncio.

É notável. Fique ali tempo suficiente e começará a ter sensibilidade para coisas que havia esquecido. Seus pensamentos começarão a fluir abaixo daquele nível raso, superficial, no qual a maioria de

108 MOISÉS: UM HOMEM DEDICADO E GENEROSO

nós passa suas horas acordadas. Se permanecer tempo suficiente ali, vai descobrir que está crescendo, aprofundando suas raízes.

No decorrer dos anos, tenho observado que a maioria dos grandes líderes mundiais são pessoas solitárias. Muitos dos artistas e artesãos consagrados, os que nos deixaram um legado da sua arte e música, foram pessoas que viveram em isolamento e solidão. Alguns dos maiores líderes do mundo foram solitários.

Em sua longa carreira como líder, Moisés deve ter sido interrogado, atacado, acusado, odiado e traído. Manteve-se, porém, sozinho diante de tudo isso. Como pôde? Como conseguiu suportar? Fora treinado para isso. Formara-se na escola do deserto de Deus e especializou-se em solidão. Ele aprendera bem as lições. Não precisava de ninguém para lhe dar tapinhas nas costas. Podia continuar fazendo exatamente o que Deus o chamara para fazer, mesmo em face da mais amarga oposição.

UMA ESPECIALIZAÇÃO EM DESCONFORTO

Não se esqueça, não havia nada que fosse confortável em Midiã.

Aquele era um lugar difícil, opressivamente quente e bastante deficiente no que dizia respeito ao conforto pessoal. Moisés, que fora tirado do rio Nilo quando criança e morara perto desse grande rio na maior parte dos seus quarenta anos, teve de ajustar-se a um lugar onde a água era uma comodidade preciosa. Aprendeu a viver com a garganta seca, os lábios rachados e os olhos constantemente semicerrados para proteger-se do sol escaldante.

Esse era o currículo da faculdade de Deus no deserto: quatro cursos especializados para poder diplomar-se. Note cuidadosamente como o processo se instalou no decorrer daqueles anos no deserto, porque é o mesmo para você e para mim. Deus precisa primeiro quebrar as várias camadas sólidas externas em nossa vida, antes de poder renovar nossa alma. Seu alvo persistente é chegar à pessoa interior. Davi reconheceu: "Eis que te comprazes na verdade no íntimo, e no recôndito me fazes conhecer a sabedoria" (SI 51:6).

O DESERTO: A ESCOLA DA AUTODESCOBERTA 109

O que são essas camadas resistentes em nosso coração e como ele as rompe para alcançar essa parte oculta''. Em primeiro lugar, encontra o orgulho. E usa a lixa da obscuridade para removê-lo gradualmente.

Então ele nos encontra paralisados pelo medo — temor do passado, ansiedade quanto ao presente e terror do que nos espera — e usa o passar do tempo para remover esse medo. Aprendemos que as coisas não estão desgovernadas afinal; elas estão nas mãos dele.

Depois disso ele encontra a barreira do ressentimento — a tirania da amargura, do rancor. Quebra essa camada com a solidão. No silêncio de sua presença, ganhamos uma nova perspectiva, livramonos gradualmente dos nossos direitos tão acalentados e abrimos mão das expectativas que nos mantinham como reféns.

Em último lugar, ele chega aos hábitos básicos da vida, bem perto de nosso "eu" interior, e introduz ali o desconforto e as dificuldades para remover essa última camada de resistência. Por quê? Para poder renovar-nos bem no âmago do nosso ser. "Consumir nossas impurezas... refinar nosso ouro."

V. Raymond Edman foi presidente da Wheaton College durante vários anos, antes de sua morte súbita. Num livreto chamado In Qiiietness and Confidence, o dr. Edman descreve sua experiência do deserto:

Algo penoso ocorreu comigo e esta foi a minha reação: fiquei em silêncio por algum tempo com o Senhor e depois escrevi estas palavras para mim mesmo:

Primeiro, ele me trouxe aqui. É peia sua vontade que estou em apuros; vou então me apoiar nesse fato.

Segundo, ele vai manter-me aqui no seu amor e dar-me graça como seu filho.

A seguir, ele vai fazer da provação uma bênção, ensinando-me a lição que deseja que eu aprenda e operando em mim a graça que precisa conceder.

Por último, quando lhe aprouver, poderá tirar-me daqui outra vez — como e quando, só ele sabe.

110 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Quero dizer que estou aqui, primeiro, por determinação de Deus; segundo, guardado por ele; terceiro, sendo treinado por ele; quarto, para o tempo dele.5

Esse é de fato um formando magna cum laude da Universidade de Deus do Deserto! É fácil notar um deles. Nem todos, porém, chegamos a esse nível de maturidade em nossa caminhada com Jesus Cristo. De fato, descobri que existem três respostas diferentes que podemos oferecer quando nos encontramos no deserto. Admito, com certo embaraço, que retruquei a Deus em várias ocasiões de minha vida.

Primeira, "Nãopreciso disso". Essa é a resposta do orgulho. "Meu vizinho precisa de uma experiência assim. Meu amigo também. Meu marido igualmente. Meus filhos necessitam dela. Meu colega de quarto. Meu chefe certamente! Mas, eu? Eu não preciso."

Segunda, "Já não agüento mais". Esta é a resposta da falta de visão. Você pode ter pronunciado essas palavras ainda hoje. Talvez me diga: "Chuck, se você soubesse! Estou lá tanto tempo no deserto que nem me lembro mais como é o outro lado".

A terceira resposta é aquela que Deus espera ouvir: "Eu aceito'. Essa é a resposta da maturidade:

A dor bateu em minha porta e avisou Que viera para ficar; Embora lhe pedisse para que se fosse, Ela entrou. E como minha própria sombra Me seguiu. De sua espada certeira, penetrante, Em momento algum fiquei livre.

Certo dia, então, alguém mais bateu Gentilmente à minha porta. Respondi: "Não, a dor está comigo. Não há espaço para mais nada". Sua voz terna se fez ouvir: "Sou eu, não tema".

O DESER'1 'O: A ESCOLA DA AUTODESCOBERTA 111

E desde o dia em que entrou — Ah, que diferença ele fez!6

Houve certas ocasiões em que fiquei diante de urna congregação, no domingo de manhã, e senti como se estivéssemos cantando palavras vazias, ocas. Música bonita, palavras majestosas, mas despidas do conteúdo real da vida. Cantamos "Todos exaltem o poder do nome de Jesus... coroai-o Senhor de tudo!"

Será que fazemos realmente isso? Ou o coroamos Senhor de tudo, menos do deserto?

Você já se flagrou dizendo algo assim? "Senhor, dou-lhe a minha vida, mas estou cansado demais dessa irritação, dessa pessoa, dessa circunstância, dessa situação desconfortável. Sinto-me encurralado. Senhor, quero alívio — preciso de alívio! E se não o mandar logo... acho que vai ser demais para mim. Sinto vontade de desistir de tudo."

Você pode andar, meu amigo, mas não há atalhos. Veja como este plano é melhor: procure a mão do seu Guia! Ele é o Senhor do deserto. Até do seu deserto. O objeto mais precioso do amor de Deus é seu filho no deserto. Se fosse possível, você significaria mais para ele nessa fase do que em qualquer outra. Você é a menina dos olhos dele. É seu aluno amado, fazendo seus cursos mais difíceis. Ele ama você com amor infinito.

Jesus atravessou o pior deserto de todos por você. Ele estava sozinho, como nenhum homem esteve. Foi rejeitado. Viveu na obscuridade. Sofreu tudo o que a terra e o inferno atiraram na sua direção. Na cruz, declarou: "Tenho sede". Quando aquela noite no deserto ficou mais negra ainda, ele clamou: "Deus meu, Deus meu, por que me desamparaste?"

Jesus foi o primeiro a andar no deserto. Ele provou da sua solidão. Aceitou sua obscuridade. Enfrentou o próprio Satanás enquanto os ventos do deserto uivavam ao seu redor. E ele jamais esquecerá ou abandonará aquele que seguir seus passos na areia.

CAPÍTULO SEIS$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O deserto é o lugar onde Deus fala porque o silêncio remove tudo aquilo em que você se apoia; que conforto ou segurança Ele talvez esteja tirando de você para que possa ouvi-lo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Moisés passou quarenta anos no deserto antes de estar pronto; como você tem reagido aos períodos áridos e solitários que parecem não ter fim na sua vida?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que você tem descoberto sobre si mesmo, e sobre Deus, justamente nas temporadas em que se sentiu mais despojado e isolado?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Sarças Ardentes e Segundas Oportunidades$t$, 6,
$conteudo$A penas o fato de um provérbio ser velho não o torna confiável. Há mentiras veneráveis e antigas rodando por aí que são tão perigosas e enganosas hoje quanto no dia em que foram pronunciadas como verdadeiras.

Estou pensando no provérbio do século XIX que chega aos nossos ouvidos em várias ocasiões. No decorrer dos anos, ele tem sido citado com freqüência e geralmente tido como verdadeiro. Você já deve tê-lo ouvido, sem dúvida: O pássaro com a asa quebrada nunca mais voará tão alto.1

Em outras palavras, uma vez que você tenha falhado, jamais conseguirá atingir as alturas como fez antes. Esse é um trecho agridoce de prosa poética, que deixa escorrer desapontamento. As pessoas que o ouvem podem concordar gravemente com a cabeça, comprimir os lábios e dizer: "Hummm..."

O único problema com o ditado é que não é verdadeiro. Nunca é verdadeiro.

Fiz um pequeno estudo sobre esse provérbio certa vez e descobri que foi escrito há mais de cem anos por um homem chamado Hezekiah Butterworth. Verdade mesmo. Isso é realmente tudo que sei sobre ele e tudo que quero saber sobre ele. Esse indivíduo elaborou uma dessas frases que soam a sabedoria, até que você a ilumina

1 14 MOISÉS: UM HOMEM DEDICADO E GENEROSO com a lanterna poderosa das Escrituras e ela se evapora numa pequena lufada de neblina purpúrea.

A GALERIA DAS ASAS QUEBRADAS

Pense a respeito, o pai Abraão era um mentiroso. Ele pronunciou mentiras gritantes em mais de uma ocasião para salvar a própria pele. Mas, mesmo depois de ter mentido, foi conhecido como "o amigo de Deus", um amigo íntimo do Todo-Poderoso. Com a "asa quebrada", Abraão voou mais alto do que ele (ou talvez qualquer outro) havia voado antes.

Jacó foi um trapaceiro que conseguiu tirar do irmão gêmeo o direito de primogenitura. Que atitude furtiva e desprezível! Contudo, embora ele fosse um trapaceiro, Deus elevou Jacó a tais alturas que seu velho nome não podia mais conter tanta glória; ele recebeu um novo nome, "Israel". Isso é tudo sobre a asa quebrada de Jacó.

E Raabe? E os seus defeitos notáveis? Ela fora uma famosa residente da zona de meretrício de Jericó. Isso mesmo; Raabe era prostituta! Deus, porém, escolheu-a como um instrumento para preservar a vida de seus dois corajosos servos. Depois disso, ela recebeu a dupla honra indizível de ver seu nome listado nos "Exemplos da Fé" de Hebreus 11 e foi incluída na linhagem e descendência de Jesus Cristo. Quando asas quebradas voaram tão alto?

O que dizer daqueles notáveis missionários desgarrados, Jonas e João Marcos? Jonas na verdade nunca se integrou, você sabe/ ele era um fugitivo da vontade de Deus desde o Primeiro Dia. Depois que fez aquela curiosa aterrissagem anfíbia na praia, apressou-se a ir a Nínive e pregou na maior campanha religiosa de todos os tempos. Uma cidade inteira — a capital de um poderoso império — se arrependeu. Todo ser humano naquele vasto município jejuou e orou. Exigiu-se jejum até dos animais. Pense nisso! Todo homem, mulher e criança naquela grande metrópole vestiu-se de saco, inclusive os animais.

Depois de ter fugido de Deus, rebelando-se contra a vontade clara do Senhor, o velho profeta teve toda sorte de asas quebradas (e

SARÇAS ARDENTES E SECUNDAS OPORTUNIDADES 115 molhadas também). Deus, porém, lhe disse: "Jonas, ainda quero usálo. Vamos voltar à trilha". Jonas passou então a liderar um despertamento espiritual que abalou o mundo antigo.

João Marcos sofreu também uma transformação, embora menos espetacular. Ele abandonou o apóstolo Paulo e voltou para casa em meio a um empreendimento missionário crucial. Paulo estava pronto para considerar o jovem um mau investimento. Mas Deus não. Marcos voltou ao serviço de Cristo de modo extraordinário. Ele escreveu o segundo evangelho, que leva seu nome, e foi considerado proveitoso para o ministério de Paulo. Quem disse isso? O próprio Paulo. "Somente Lucas está comigo. Toma contigo a Marcos e traze-o, pois me é útil para o ministério" (2 Tm 4:11).

Vou dizer-lhe mais uma coisa. Se pássaros com asas quebradas não pudessem mais voar tão alto, você não estaria lendo este livro. Não sei o que estaria fazendo, mas não teria este livro nas mãos, posso lhe garantir isso. Aproveitando o assunto, quero acrescentar que este autor não seria sequer um escritor. Veja bem, o provérbio do velho Hezekiah Butterworth pode ser bom para pássaros do céu, mas não se aplica aos homens e mulheres de Deus, porque Deus não lida com seus servos desse modo. Na verdade, embora possa soar como uma idéia estranha, Deus parecer preferir usar pessoas de asas quebradas.

Isso não é ótimo? Tira toda tensão do problema, não tira? Eu me qualifico para o serviço dele justamente como sou, com minhas falhas e tudo o mais. E você também. Não importa seu passado, o futuro é mais brilhante do que pode imaginar. Por quê? Porque Deus se especializa em usar vasos quebrados. Esse é seu plano preferido.

Lembra-se do que Paulo (outro pássaro com asas quebradas) escreveu aos Coríntios? "Temos, porém, este tesouro em vasos de barro, para que a excelência do poder seja de Deus e não de nós" (2 Co 4:7). Você sabe o que é um vaso de barro? Um "vaso de cerâmica comum" na tradução de J.B. Phillips. Essa é uma referência a nosso corpo e nossas habilidades na força da carne. Isso é tudo o que você e eu temos a oferecer a Deus... um vaso. Um recipiente perecível.

116 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Você pode ser como a frágil e delicada porcelana. Você quebra e lasca facilmente e pode mostrar as marcas de cola dos consertos. Pode ser também um jarro grosseiro e pesado de cerâmica — pouco atraente; mas como é útil! Talvez tenha sido feito de argila que não foi queimada no forno, ainda está sendo moldado e preparado para uso. Meu mentor, Ray Stedman, costumava dizer: "Somos todos vasos de barro e estamos todos sendo moldados. Só que uns são mais moldáveis que outros".

Para falar a verdade, a condição do vaso não é o mais importante, mas o tesouro que está dentro dele — a luz e a glória da salvação de Cristo. O que importam alguns arranhões ou mesmo rachaduras? Quanto mais melhor.

Tudo isso nos leva de volta à nossa história. Moisés, depois do enorme fracasso que destroçou sua vida e depois de todos os anos de obscuridade que se seguiram, certamente deve ter se sentido um vaso inútil. Ele não podia imaginar Deus pegando um utensílio rejeitado como ele e descobrindo qualquer utilidade nele. Para Moisés, a idéia era ridícula. Então, num dia normal e comum no deserto, parou para observar aquele arbusto em particular e nada mais foi normal e comum para ele novamente.

Êxodo 3, versículos 1 a 10, é uma passagem sobre um dia, um arbusto, uma necessidade e um chamado. Vamos considerar cada uma dessas coisas individualmente.

O DIA

Apascentava Moisés o rebanho de Jetro, seu sogro, sacerdote de Midiã; e, levando o rebanho para o lado ocidental do deserto, chegou ao monte de Deus, a Horebe.

Êxodo 3:1

Este era o dia em que Deus ia quebrar um silêncio de quarenta anos.

Faça uma pausa e reflita a respeito! Durante quatro décadas em Midiã, não temos registro de Deus ter falado com Moisés. Nem

SARÇAS ARDENTES E SEGUNDAS OPORTUNIDADES 117 uma vez sequer. O dia que iria quebrar esse silêncio, porém, amanheceu igual aos outros no deserto. Na noite anterior, enquanto dormia debaixo das brilhantes estrelas do deserto, junto ao rebanho, talvez sob a sombra ameaçadora do Sinai, ele não viu nenhum meteoro cruzar o céu. Não ouviu voz alguma. Nenhum anjo bateu em seu ombro na hora do café da manhã, dizendo: "Fique atento, Moisés. Deus vai falar hoje".

Não houve insinuações, premonições, sinais especiais para alertálo de que Deus iria quebrar o silêncio naquele dia e que sua vida mudaria para sempre. Foi apenas o cotidiano comum, ordinário, de trabalho com as ovelhas. Nada mais. Nada menos. Só outro dia no escritório do deserto sob a sombra do monte Horebe. O sol subia, as ovelhas pastavam, e Moisés marcou no calendário seu dia de número catorze mil e seiscentos como pastor-assistente de Jetro.

É assim que Deus opera. Sem o menor sinal de advertência. Ele fala a pessoas comuns, em dias comuns.

Você pode estar pegando um ônibus pela manhã. Ou subindo num enorme caminhão para uma viagem de quinhentos quilômetros numa rodovia monótona. Ou enfrentando uma classe cheia de estudantes. Ou dirigindo seu carro-patrulha. Ou levantando o nenê do berço, enquanto outro pequenino se agarra às suas pernas.

Esse é seu dia. Sua rotina. Seu monte Horebe. E pode ser que num dia assim normal e rotineiro Deus decida falar com você como nunca falou antes. Pode ser esse o dia em que ele vai comunicar-lhe algo grandioso a seu coração, algo que faz parte do seu destino.

Você jamais imaginaria isso no momento em que se levantou da cama. Não poderia ter predito quando fez a barba pela milésima vez ou se maquilou. Não se sentiu diferente em absolutamente nada.

Você se lembra do que as Escrituras dizem sobre o segundo advento do Senhor? Lemos na Bíblia: "Pois assim como foi nos dias de Noé, também será a vinda do Filho do Homem. Porquanto assim como nos dias anteriores ao dilúvio comiam e bebiam, casavam e davam-se em casamento, até ao dia em que Noé entrou na arca, e não o perceberam, senão quando veio o dilúvio e os levou a todos..." (Mt 24:37-39).

118 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Ou seja, vai acontecer num dia comum. As pessoas estarão se casando e sendo sepultadas. Haverá problemas e necessidades. Algumas estarão dirigindo um ônibus, outras serão passageiras nesse mesmo ônibus. Algumas estarão voltando do trabalho para casa, ouvindo o noticiário no rádio. Outras estarão na fila do caixa do supermercado, impacientes com a demora do freguês à sua frente para preencher o cheque. Outras ainda estarão embarcando num avião, e outras descendo do metrô.

De repente, o Filho virá! Vai surgir um relâmpago no céu, um grito, o som forte de uma trombeta e, num piscar de olhos, tudo vai acabar. Não haverá aviso prévio.

Esse é o método de Deus. Seu plano não exige o rufar de um tambor nem o soar de címbalos. Ele não usa lâmpadas fluorescentes e piscantes. "Prepare-se! Prepare-se! Hoje é o dia em que vou fazer algo grandioso em sua vida."

Esse não é seu estilo. Não espere que uma aura brilhante vai cobri-lo bem cedo pela manha e uma voz angelical e sonora vai anunciar: "Este é o dia!" Se isso acontecesse, você poderia puxar as cobertas sobre a cabeça e nunca mais sair da cama.

Deus opera de modo simples: em determinado dia comum da vida ele chega e diz o que quer dizer. E um negócio do tipo arrozcom-feijão. Eis o que é necessário fazer e você é quem vai fazer, então vamos em frente!

A SARÇA

Apareceu-lhe o Anjo do Senhor numa chama de fogo do meio duma sarça; Moisés olhou, e eis que a sarça ardia no fogo, e a sarça não se consumia. Então disse consigo mesmo: Irei para lá, e verei essa grande maravilha, por que a sarça não se queima.

Êxodo 3:2-3

Algo notável aconteceu com Moisés naquela manhã que seria tão normal quanto as outras. O pastor de oitenta anos chutava a

SARÇAS ARDENTES E SEGUNDAS OPORTUNIDADES 119 areia com as sandálias, afastava as ovelhas dos penhascos, empurrando-as em direção à pastagem e, de repente, uma sarça pegou fogo.

Tenho visto as concepções de artistas sobre essa ocorrência e não me agradam muito. A sarça mais parece pertencer a um museu de arte do que a um trecho heterogêneo do deserto. E as chamas em alguns desses quadros são como um lança-foguete no momento do lançamento.

Não acho que foi assim de modo algum. Na minha opinião, aquela era uma sarça comum do deserto, como inúmeras outras que salpicavam a paisagem. A palavra hebraica dá-lhe o nome de "arbusto espinhoso". E era exatamente isso. Um dentre milhares em Midiã.

A sarça não era diferente nem notável, o que acontecia com ela é que era diferente e notável. Esse é um ponto importante a notar. O texto diz que o anjo do Senhor apareceu a Moisés em meio à sarça. A sarça não era Deus, ela foi escolhida por Deus e passou a arder em fogo inextinguível.

Moisés, é claro, ficou curioso. Geralmente não havia muito o que escrever para casa da parte de trás daquele deserto. Mas isso era diferente! O versículo 2 nos diz que ele fez duas coisas: Primeiro, olhou; segundo, disse algo para si mesmo. Tenho toda a razão para crer que você e eu teríamos feito o mesmo se estivéssemos no lugar dele naquele dia. Não é sempre que vemos sarças se incendiarem de repente, especialmente sem que o fogo as consuma.

No decorrer dos anos, Moisés pode ter visto uma ou duas sarças arderem em fogo, talvez depois de atingidas por um relâmpago. E naquele lugar árido bastariam alguns segundos para a sarça parecer uma torrada queimada. O fogo rebentaria em chamas, depois rapidamente se extinguiria, deixando uma pilha de gravetos e cinzas ainda quentes. Mas não foi isso que aconteceu.

Moisés ficou ali durante algum tempo, observando, e a sarça continuou queimando e queimando. Ele pensou: Que coisa estranha! A sarça não era estranha, e sim o fogo. Ele ardia, mas não consumia a sarça. Se fosse eu, ficaria arrepiado naquele momento. Talvez ouvisse o tema do filme The Twilight Zone tocando em mi-

120 MOISÉS: UM HOMEM DEDICADO E GENEROSO

nha mente. Era realmente estranho e não havia uma alma a quem pudesse contar o fato, a não ser a vários quilômetros de distância. Naquelas circunstâncias, acredito que ele não tinha a menor idéia de que Deus se achava na sarça. Sentia simplesmente curiosidade, como qualquer um de nós.

Esse é também o método de Deus. Nas circunstâncias comuns, normais da vida, ele faz ocasionalmente algo absolutamente extraordinário. Queima uma sarça, por assim dizer. Chamamos de "coincidências" essas ocorrências pouco usuais.

Penso que essa seja uma expressão infeliz. Apresso-me em acrescentar que não estou dizendo que toda coincidência é uma sarça ardente de Deus em sua vida. O que pretendo dizer é isto: Deus pode usar um evento ou circunstância extraordinário para dar um tapinha em seu ombro com o objetivo de obter toda a sua atenção. Ele talvez use algo assim para interferir em sua vida e dizer: "Espere um pouco. Pare. Fique calmo. Tenho uma coisa para lhe dizer".

Quando você e eu deparamos com acontecimentos extremamente incomuns, é uma boa idéia perguntar: "Será que Deus está querendo dizer algo para mim agora?"

Há alguns anos, eu estava sentado em meu escritório com um jovem casal, discutindo os planos deles para o casamento. De repente, ouvimos uma batida forte na porta. Ninguém esperava por isso e todos nos sobressaltamos.

— Entre — eu disse.

Um homem entrou, um completo estranho, e encaminhou-se diretamente na minha direção.

— Seu nome é Swindoll? — perguntou. — E — respondi. — Acabei de conhecer Jesus por sua causa. E tudo aconteceu por causa disso — disse ele, tirando uma fita cassete do bolso da jaqueta.

Ficamos sabendo que o homem era um piloto de corrida, conhecido em toda a Costa Oeste. Balançando a fita cassete na minha direção, ele disse: — Tenho um amigo que sempre me dava essas coisas —. (Estou certo de que em princípio o homem deve ter pensado que se tratava de fitas de música. Que surpresa!)

SARÇAS ARDENTES E SEGUNDAS OPORTUNIDADES 121

No decurso das corridas, esse indivíduo recentemente experimentara duas experiências de quase-morte e isso o levou a pensar sobre alguns assuntos com os quais nunca se preocupara antes.

— De repente — disse ele —, pus essa coisa no toca-fitas enquanto dirigia e comecei a ouvi-la. Lembra-se de uma mensagem chamada 'A Vontade de Deus, a Meu Modo?'

— Sim — respondi. — Eu me lembro. — Ouvi essa mensagem e na verdade não sei com quem você pensava estar falando, mas sei que falava para mim. Pensei comigo mesmo: Senhor, preciso de ti. Isto é mais que coincidência. Epara mim!

Esse homem conheceu Jesus Cristo naquele mesmo dia. Ele pôs uma fita ao acaso no toca-fitas e as palavras eram exatamente o que ele precisava ouvir naquela altura de sua vida. Tinha se visto cara a cara com a morte e então ali estava aquela mensagem que lhe oferecia a vida eterna. Aquela foi uma sarça ardente na vida daquele indivíduo. Sua existência mudou para sempre por causa daquele encontro.

Lembro-me de Jack, um velho amigo, que pilotava um bombardeiro B-l 7 na Segunda Guerra Mundial. Depois de uma investida sobre a Alemanha, o grande pássaro quase não voltou para a base. Colidiu com um prédio de apartamentos residenciais, matando muitas pessoas. Todos os tripulantes também morreram no desastre. Todos, menos Jack.

Meu amigo afastou-se da inacreditável cena de caos e chamas, praticamente sem nenhum arranhão, embora estivesse preso ao cinto na parte do meio daquele avião condenado. O incidente o perseguiu. Por que teria sobrevivido quando tantos morreram? Por que fora poupado? Jack foi conversar com seu capelão para tentar esclarecer as coisas.

"Por que, capelão?" perguntou. "Por que eu? Por que sobrevivi, quando todos os meus tripulantes morreram?"

A resposta do capelão foi superficial e não o convenceu: "Olhe, Jack, vamos apenas dizer que você teve sorte".

Foi mais do que sorte. Tinha de ser! Curioso e inquieto, Jack insistiu em suas perguntas. Finalmente, alguém deu a resposta certa.

122 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Jack fora poupado para que pudesse entregar sua vida ao Senhor do universo, Jesus Cristo. E foi o que fez. Ele não podia — não queria — afastar-se daquela sarça ardente sendo o mesmo homem.

Escreva isso, as coisas não "acontecem" apenas. Nosso universo não é somente um universo ao acaso. Existe um plano preparado por Deus para este nosso mundo, que inclui um plano específico para você. E em todo dia comum e em todo momento extraordinário há um Deus que o procura constantemente.

Você está caminhando pelo deserto com as ovelhas numa manhã de terça-feira e se defronta subitamente com um evento entre as incontáveis miríades de eventos que acontecem todos os dias e todas as noites. De repente a vida muda. Algo está diferente. Nunca duvide! O Deus que nos ama e que nos remiu usa esses momentos para avançar em seus propósitos. Ele se encontra ali e não está em silêncio.

Deus não fala do céu, gritando sua Palavra para você. Ele usa seu Livro, seu povo e os eventos em sua vida. Mediante a combinação desses eventos extraordinários, ele diz: "Ouça-me. Preste atenção nesta sarça ardente. Fique atento e falarei com você. Responda ao meu chamado e usarei você".

Para falar francamente, nesse nosso mundo frenético de hoje, isso não acontece com freqüência. Tudo o que é necessário é um espírito tranqüilo e um coração pronto para ouvir. Moisés possuía ambos e, portanto, ouviu a voz de Deus.

A NECESSIDADE

Vendo o Senhor que ele se voltava para ver, Deus, do meio da sarça, o chamou, e disse: Moisés! Moisés! Ele respondeu: Eis-me aqui.

Êxodo 3:4

Penso que uma das palavras mais importantes desse versículo é a primeira, que denota uma noção temporal: vendo. A tradução literal para o termo hebraico é "ao mesmo tempo" e remete-se às palavras "irei para lá" (v. 3).

SARÇAS ARDENTES E SEGUNDAS OPORTUNIDADES 123

Quando Deus falou com Moisés? No mesmo momento em que ele se voltou para ver. E simples, não é? Moisés interrompeu seu movimento, deixou suas responsabilidades de lado por alguns instantes e seguiu em outra direção. Ele se moveu rumo ao evento que atraíra sua atenção.

É fácil fazer as pessoas agirem assim. As sarças ardem, os aviões caem, os carros se acidentam, vidas são tomadas e poupadas, as perguntas exigem respostas e acontecimentos estranhos passam na paisagem da nossa vida, como as sombras das nuvens sopradas pelo vento. O que a maioria das pessoas faz então? Encolhe os ombros, considerando tudo coincidência. Elas trafegam em meio à neblina desses acontecimentos como se envolvidas por uma espessa pele de couro. Se houver uma sarça ardendo, não se preocupam com ela, outra pessoa irá apagar o fogo. Se uma voz falar, estão ocupadas demais para prestar atenção. Nem se importam. Não significa nada. Há coisas mais importantes em que pensar.

Deus, porém, diz: "O que será necessário? O que irá finalmente persuadir você a parar por um minuto, virar-se e considerar este evento em sua vida?" O que tem de acontecer até que você diga: "Vou verificar isso. Vou descobrir o que tudo isso pode estar dizendo para mim".

Moisés fez justamente isso e viu-se face a face com seu destino. Foi apenas quando ele se virou que Deus finalmente falou. Contudo, mesmo naquele momento, não creio que o homem imaginasse que era Deus que falava. No que dizia respeito a Moises, uma sarça é que falava. Deus ainda não tinha se apresentado. Moisés ouvira simplesmente seu nome vindo de uma sarça ardente e respondera.

"Moisés! Moisés!" dissera a voz. Sabe o que ele respondeu? O hebraico original revela que disse uma só palavra: hynaynee, que pode ser interpretada como "eis-me aqui", ou, em nossos termos, "sou eu".

Foi tudo que disse! E acho isso interessante e encantador. Quarenta anos antes, ele teria apresentado seu currículo. "Precisa de alguém especial? Estou contente porque me localizou, Deus. Achei que faria isso. Quer verificar minha experiência de trabalho? Repu-

124 MOISÉS: UM HOMEM DEDICADO E GENEROSO

tação e prêmios? Referências? Tenho cerca de três páginas aqui." Naquela época, ele teria ficado na expectativa de um chamado divino.

Mas não agora. Já tivera quarenta anos de obscuridade e silêncio na escola do deserto de Deus. Tornara-se um ninguém. Quando o chamado finalmente chega, sua resposta é um sereno e relutante:

Acredite ou não, isso era tudo que Deus queria ouvir. E continua sendo verdade hoje. É só isso que ele quer ouvir de você quando ele fala. Não se engane. Ele não está impressionado com você. Ele está avaliando sua humildade, sua sensibilidade, sua disponibilidade. Ele procura alguém que diminuirá o ritmo o suficiente para observar a sarça ardente. E quando chama, tudo o que pede é um simples reconhecimento. Eis-me aqui, Senhor. Tudo em ordem e de acordo. "Deus continuou: "Não te chegues para cá; tira as sandálias dos pés, porque o lugar em que estás é terra santa" (Êx 3:5).

Gosto de pensar em algumas palavras dos versículos 4 e 5. O versículo 4 diz: "Vendo o Senhor que ele se voltava para ver..." e o versículo 5 diz: "Deus continuou..." Creio que o vendo e o continuou estão ligados. Depois que Moisés parou e disse "eis-me aqui", a voz passou a dar instruções específicas.

"O lugar em que estás é terra santa..." O termo hebraico traduzido como "santa" significa literalmente "separado". Deus dizia a ele: "Moisés, quero que se separe de seu passado. Quero também que tire da mente suas responsabilidades imediatas. Dê-me toda a sua atenção. Quero que ouça apenas o que estou dizendo neste momento. Separe-se de tudo o que é humano. Faça um círculo imaginário ao seu redor e fique quieto, Moisés".

Eu li essa passagem a minha vida inteira e sempre pensava que a sarça era santa. Afinal de contas, Deus estava naquela sarça. Mas só quando fiz um estudo mais profundo da passagem descobri que não é isso que o texto diz. Ele afirma que o lugar em que Moisés se achava era santo. Essa é a razão de o Senhor ter dito: "Tira as sandálias dos pés".

Por que disse isso? Se as sandálias de Moisés estavam sujas, é praticamente certo que seus pés também estariam. Se você andar

SARÇAS ARDENTES E SEGUNDAS OPORTUNIDADES 125 sobre rochas sujas e pela areia do deserto com os pés suados, um pouco dessa sujeira e areia vai grudar neles. Por que então a ordem de tirar os sapatos?

Em muitas partes da Ásia, é costume tirar os sapatos antes de entrar na casa de alguém. Durante o tempo em que fiquei em Okinawa e no Japão, aprendi essa prática cultural pitoresca. Você não entra na casa de ninguém de sapatos ou botas; isso seria uma afronta ao anfitrião.

Mas isso era mais do que um costume, porque Moisés não estava numa casa, mas em meio à areia e às pedras no deserto de Midiã, sob uma enorme abóbada de céu azul. Deus aparentemente considerou aquele momento tão santo e precioso que não queria nada entre Moisés e ele. "Tire as sandálias, Moisés, e fique de pé no chão quente". Não havia o que discutir nem perguntar. Sem hesitação, Moisés cumpriu exatamente a ordem recebida. Disse mais: "Eu sou o Deus de teu pai, o Deus de Abraão, o Deus de Isaque, e o Deus de Jacó. Moisés escondeu o rosto, porque temeu olhar para Deus" (Êx 3:6).

Veja a lista: Abraão, Isaque, Jacó. Sempre que lemos esses nomes, pensamos estar lidando com os primeiros superstars da Bíblia — os mais mais. É como se esses fossem homens que flutuassem pela vida numa bolha e nunca encardissem os pés andando no chão sujo. Nada disso! Se fizer um estudo da vida deles, vai descobrir que eram homens como nós. Seus nomes realmente fazem parte da Bíblia, mas todos eles também tinham as asas quebradas. Se não fosse pela graça de Deus, nenhum deles teria realizado nada que valesse a pena lembrar.

Deus está dizendo, na verdade: "Moisés, sou o Deus dos homens que fracassaram. Sou o Deus dos homens comuns que realizaram coisas extraordinárias na vida".

O registro sagrado diz que Moisés escondeu o rosto e temeu olhar para Deus. O que você acha que passou pela sua mente naqueles momentos?

Se retrocedermos ao início da era da televisão, descobriremos que havia na TV norte-americana um programa popular chamado Esta é a sua vida. Um homem ou uma mulher se apresentava no palco com o anfitrião e podia-se ouvir uma voz amplificada do fundo do palco,

126 MOISÉS: UM HOMEM DEDICADO E GENEROSO

dizendo: "Você se lembra de mim? Ensinei você a resolver frações quando estava na quinta série". Ou: "Lembra-se de mim? Fizemos parte do mesmo batalhão no exterior. Lembra-se de como costumava tomar emprestado meu creme de barbear?" Havia então uma série de reuniões diante da câmera, enquanto a vida do indivíduo focalizado era repassada para ele.

Junto à sarça, Moisés ouvia uma voz dizendo: "Lembra-se de mim? Sou aquele que lhe disse que remiria meu povo Israel algum dia. Sou o Deus de seus pais".

Moisés pensava que tudo aquilo havia ficado para trás. Pensava que todas as pontes haviam sido queimadas. Pensava que passaria o resto de seus dias empurrando ovelhas magricelas pelas trilhas rochosas de Midiã. Moisés tentara ao máximo esquecer o passado. E quarenta anos na Universidade do Deserto ajudaram muito. Os ventos do deserto haviam levado embora a dor de algumas dessas lembranças e remorsos. Mas agora...? O passado deve ter arrastado o antes belo príncipe do Egito como uma grande vaga. Ele escondeu o rosto enrugado, curtido, provavelmente lamentando em seu íntimo. Oh, não! Não pode ser! Não acredito!

O homem se sentia tão humilhado, tão indigno, tão preso no "emaranhado", se entende o que quero dizer. Mas era precisamente assim que Deus o queria, porque esse é exatamente o tipo de pessoa que Deus pode usar. O Senhor dos céus não hesitou então em revelar seus planos ao indivíduo à sua frente — aquele cujo rosto estava oculto atrás das mãos.

Ao ler estas palavras, você talvez se encontre numa situação que pareça terrivelmente injusta. Suas circunstâncias imediatas são difíceis de enfrentar. Seu coração se parte enquanto eventos fora de seu controle surgem em sua paisagem como grandes e pesados seixos. Se essa é a sua situação, gostaria que tomasse nota dos versículos que se seguem: "Disse ainda o Senhor: Certamente vi a aflição do meu povo, que está no Egito, e ouvi o seu clamor por causa dos seus exatores. Conheço-lhe o sofrimento, por isso desci a fim de livrá-lo da mão dos egípcios... (Êx 3:7-8).

SARÇAS ARDENTES E SEGUNDAS OPORTUNIDADES 127

Demore-se um pouco nas frases desta passagem. Se já duvidou do amor de Deus pelos que são seus, leia estas palavras até que o Espírito Santo o convença do contrário.

"Certamente vi..." "Ouvi o seu clamor..." "Conheço-lhe o sofrimento..." "Por isso desci a fim de livrá-lo..."

O Senhor estava tranqüilizando Moisés. "Estive observando a situação. Tenho conhecimento do que está acontecendo. Vi meu povo chorando à noite. Ouvi o estalar do chicote e os gritos dos pequeninos. Vi os corpos ao longo da estrada, ou jogados no Nilo como se fossem animais de carga. Nada disso me escapou. Pois o clamor dos filhos de Israel chegou até mim, e também vejo a opressão com que os egípcios os estão oprimindo" (v.9).

Deus sabe, nos mínimos detalhes, exatamente onde você se encontra na vida. Ele vê. Ele se importa. Ele tem conhecimento. E, melhor de tudo, se comove com isso.

O inimigo de nossa alma quer que você pense outra coisa. Deus não se importa. Ele o abandonou nessa dificuldade durante meses. Que injustiça! Os que o rodeiam, os que trabalham, seus vizinhos, vivem de acordo com o mal e estão todos bem. Você não tem sequer emprego. Não tem sequer o suficiente para cobrir as contas do cartão de crédito. Que espécie de Deus é esse?

Ou talvez uma futura mãe, estressada até o limite de suas forças com outros filhos pequenos e responsabilidades opressoras, clama em seu coração: "Minha situação é mais do que posso suportar.'" E Deus responde: "Minha filha, eu sei o que estou fazendo. Conheço o sofrimento em seu coração no momento. Sei que se sente oprimida, sobrecarregada, pressionada. Mas, creia, sinto-me comovido com sua situação. E tenho um plano! Já estou preparando os detalhes do seu parto desde já. Confie em mim!"

O Senhor disse mais ou menos isso a Jeremias: "Eu é que sei que pensamentos tenho a vosso respeito... pensamentos de paz, e não de

128 MOISÉS: UM HOMEM DEDICADO E GENEROSO

mal, para vos dar o fim que desejais" (Jr 29:11). O Deus de Jeremias ainda vive, se importa e livra.

Tenha em mente que Moisés conserva-se neutro nesse ponto. Uma voz está vindo da sarça, saída das chamas incessantes, e ele está ali de pé, descalço, boquiaberto, com os ouvidos atentos. O Senhor ainda não disse nada sobre a parte dele na operação. Veja bem, o problema conosco é que já lemos a história. (Talvez tenhamos visto o filme!) Moisés, porém, vive a história nesse ponto; ele nunca leu o livro de Êxodo. Nunca assistiu Os Dez Mandamentos ou O Príncipe do Egito. Não tem pista alguma sobre o que virá em seguida.

A voz dissera: "Sei o que está acontecendo no Egito". E Moisés pensou: Eu também ouvi a respeito. É terrível. Talvez o Senhor faça algo.

De repente, Moisés ouve palavras que o fazem estremecer, como se tocado por um fio de alta-tensao. "Vem, agora, e eu te enviarei a Faraó, para que tires o meu povo, os filhos de Israel, do Egito" (Ex 3:10).

O quê? Enviar-me ao Faraó ? Para fazer o quê? Antes de considerarmos mais profundamente a reação de Moisés junto à sarça (esse é o próximo capítulo), gostaria de me estender mais um pouco aqui e examinar esse chamado do Senhor de um ângulo diferente.

QUALQUER SARÇA SERVE

Qual a mensagem mais ampla de Deus a Moisés naquele momento? Libere sua imaginação por um instante. Ela pode ter incluído alguns pensamentos como estes:

"Moisés, há quarenta anos você era uma sarça de ótima aparência, impressionada com sua própria folhagem. Tinha ramos fortes e magníficos, folhas verdes. Mas quando a sua sarça começou a arder em fogo, ela desapareceu em menos de quarenta e oito horas. Seu grande plano sumiu nas chamas, queimando seus sonhos e consumindo suas ambições. Nada restou, não é? Essa foi sua vida, Moisés. Você fugiu então como um coelho assustado, cruzou a fronteira para fugir da multidão egípcia que queria linchá-lo.

SARÇAS ARDENTES E SEGUNDAS OPORTUNIDADES 129

"Você pensou que era uma sarça escolhida, de primeira qualidade, antes que isso acontecesse; mas agora pensa que não vale muita coisa. Ouça, homem, qualquer sarça serve, desde que eu, o grande Deus de toda graça, esteja nela! Quero \isi-lo, Moisés. Fique quieto e deixe que eu o incendeie!"

O que é necessário para se qualificar como uma sarça que Deus usará? Você precisa estar seco e cheio de espinhos. Está bem, eu me qualifico. Você tem de estar empoeirado e sujo. Está bem, eis-me aqui. Você tem de ser comum. Está bem. Sou eu mesmo. O que mais, Senhor?

Você tem de ser inflamável. Deus está procurando por sarças inflamáveis. Há algumas sarças de boa aparência na cristandade que não queimam de jeito nenhum. São feitas de amianto. Você não conseguiria fazê-las pegar fogo nem com um maçarico. O Napalm também não conseguiria. Elas são belas réplicas de belas plantas, mas não queimariam. Isso significa que são inúteis para Deus.

A verdade é que qualquer sarça velha pode servir, desde que Deus esteja nela. Era isso que ele dizia a Moisés. "Quero que você queime para mim como nenhum homem queimou antes. Você foi seco e provado nesta terra deserta, açoitada pelos ventos, durante todos esses anos. Eu queria que secasse! Despojei-o de todas aquelas coisas das quais dependia e que significavam tanto para você. Reduzi-o a um amor simples por mim. Isso é tudo que tem a oferecer agora, Moisés, e isso é tudo que quero."

Vamos examinar as respostas de Moisés no capítulo sete, mas antes de deixarmos a questão sobre a resposta ao chamado de Deus, gostaria que você refletisse sobre algumas lições. Quero sugerir três dos erros mais comuns cometidos entre nós, sarças, que somos os candidatos à competição de Deus.

CORREMOS ANTES DE SERMOS ENVIADOS

Este é o primeiro dentre os principais erros que cometemos. Um Moisés mais jovem, mais obstinado, mais voluntarioso, fizera isso quarenta anos antes do encontro na sarça. Deus não o enviara — pelo menos até então —, mas ele correu mesmo assim. Esse problema é causado

130 MOISÉS: UM HOMEM DEDICADO E GENEROSO

pela intensidade; corremos em nossa própria força antes de recebermos a permissão divina. Algumas vezes estamos apenas nos contendo um pouco, pisando no freio, prontos para nos apressar e fazer a vontade de Deus. Não podemos esperar até que ele dê a ordem. Não podemos esperar até que os eventos entrem nos eixos. Não podemos esperar pelo aceno do Espírito. E, portanto, não esperamos, corremos! Deus diz então: "Eia! Ainda não enviei você. Espere até que eu dê a ordem".

RECUAMOS DEPOIS DE TER FRACASSADO

Uma vez que corremos antes de sermos enviados, acabamos no abandono. O que fazemos então? Tentamos encontrar o menor buraco possível para nos esconder, preferivelmente para sempre. Esse problema é instigado pela insegurança. Não podemos simplesmente suportar a idéia de fracasso. Mas quem disse que você e eu temos de ser bem-sucedidos em tudo? Esse é um padrão artificial estabelecido pelos homens e não por Deus. Como já vimos, o fracasso, embora seja um pedagogo que nos faça sofrer, pode ser um excelente instrutor.

RESISTIMOS QUANDO SOMOS CHAMADOS

A intensidade nos faz correr antes de sermos enviados. A insegurança nos faz recuar quando não satisfazemos nosso padrão. E isso nos leva a um terceiro erro: resistimos quando Deus nos chama realmente. Isso acontece por causa de um sentimento de inferioridade, que não é definitivamente a mesma coisa que humildade.

Moisés não foi simplesmente humilde quando começou a argumentar com o chamado de Deus; ele se sentia inferior. Isso está bem próximo de uma neurose. Você pode ser alguém que recebeu o chamado nítido de Deus, mas tapa os ouvidos a ele porque sente que tem pouco valor. Sua asa quebrada declara: "Não sou digno!" Mas tudo o que Deus pede a nós é que estejamos disponíveis e sejamos inflamáveis. Ele não nos pede para sermos espetaculares, mas para que apenas estejamos prontos a nos render.

SARÇAS ARDENTES E SECUNDAS OPORTUNIDADES 131

Em vista do mal-entendido que descrevi acima, creio que há muitos que não responderam ainda ao chamado de Deus para sua vida — muitos que podem perder oportunidades de queimar brilhantemente para ele, como uma cidade radiante que ilumina o alto de um morro. Falo aos muitos que esperam algum tipo de sinal curioso nos céus, um convite escrito à mão entregue por um anjo, algum momento mágico, místico. E tudo o que Deus espera é ouvir-nos dizer: "Eis-me aqui, Senhor. Sou teu, com espinhos e tudo. Basta que me incendeies".

Em um de seus momentos mais inspirados, Amy Carmichael escreveu isto:

Dá-me o amor que mostra o caminho, A fé que nada pode extinguir, A esperança que decepção alguma faz recuar, A paixão que queima como fogo, Não permitas que eu afunde para tornar-me um mero torrão: Faz de mim teu combustível, chama de Deus.2

A HISTÓRIA DE VENITA

O nome Venita Schlopfeldt não irá significar nada para a maioria dos que lerem estas páginas. Mas para o nosso Deus esse nome representa uma luz brilhante no seu reino, alguém que em certa ocasião na sua vida se sentiu como uma sarça comum, esquecida.

Venita está presa a uma cadeira de rodas, paralisada dos ombros para baixo. Ela é esposa de um homem religioso, Larry. Eles serviram algum tempo como missionários em Caracas, na Venezuela.

Larry e Venita começaram o casamento cheios de determinação, desejosos de fazer a vontade de Deus, mas ao modo e ao tempo que eles mesmos estipularam. Pouco depois de casados, numa viagem com alguns parentes, o destino deles foi interrompido. O carro bateu de frente com outro. Venita foi lançada do banco de trás, tendo a medula espinhal rompida na altura do pescoço.

132 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Venita ficou paralítica com o acidente. Asas quebradas, pense nisso! Mediante uma série de operações e exames, vários médicos competentes contaram a Larry a dura verdade. "Você vai ter de conviver com o fato de sua mulher viver entrevada pelo resto da vida. Ela nunca poderá ter filhos. Para falar francamente, você terá de cuidar dela como se fosse uma criança." Larry lembrou-se dos seus votos matrimoniais e decidiu cumpri-los, acontecesse o que acontecesse. Ele permaneceu ao lado da esposa.

Quando querem viajar juntos, Larry a coloca no carro, levando a cadeira de rodas dobrada no porta-malas. À noite, ele a veste para dormir e a acomoda na cama. De manhã, ele a tira da cama, coloca-a na cadeira e lhe dá o desjejum.

Durante vários anos eles participaram de um ministério de venda de livros em Caracas, compartilhando fielmente o Evangelho de Jesus Cristo em todas as oportunidades. Larry e Venita, que trabalhou em meio ao choque, sofrimento e amargura da sua condição, confiaram em Deus durante essa luta e são até hoje ferramentas eficazes para Jesus Cristo. Para mim, esse casal é um dos exemplos mais atraentes e encantadores de sarças ardentes que já encontrei. Ao contrário do que os médicos disseram a Larry no começo, Venita deu à luz três filhos sadios.

Larry aproximou-se do Senhor, junto com Venita, e disse: "Talvez não sejamos muito, mas estamos disponíveis, com espinhos e tudo. Somos apenas duas sarças comuns, Senhor. Inflama-nos para a tua glória!"

E ele assim o fez. Em meu primeiro encontro com eles, na Venezuela, Larry disse: "Chuck, você não pode imaginar o ministério dessa mulher enquanto anda em sua cadeira de rodas pela livraria e em diferentes lugares no centro de Caracas. Ela fala espanhol fluentemente e está sempre levando pessoas a Cristo". O próprio Larry, pelo que sei, não sente nenhuma amargura, rancor ou ressentimento. Nunca ouvi esse homem dizer: "Por que eu?"

Se este escolhido casal missionário pode queimar com tal radiância para Jesus Cristo, então você também pode. Deus quer usá-lo em

SARÇAS ARDENTES E SEGUNDAS OPORTUNIDADES 133 seu serviço, com espinhos e tudo. Seu passado não importa. Seu currículo não é a questão. Seu treinamento e educação não contarão a história a longo prazo. Deus está à procura de alguém com ouvidos para ouvir a sua voz, mãos prontas a fazer o seu trabalho e um coração disposto a reagir.

Qualquer sarça serve, mas é ele que deve acender o fogo. Moisés, depois de quarenta longos anos — não, foram oitenta! — estava finalmente pronto e disposto.

Quanto tempo você vai levar?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Se Deus parece preferir usar pessoas de "asas quebradas", como Abraão, Jacó, Raabe e Jonas, por que você ainda acredita que suas falhas o desqualificam para o serviço dele?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A sarça ardente foi a segunda oportunidade de Moisés depois de quarenta anos de fracasso; em que área você precisa crer que Deus ainda quer lhe oferecer um novo começo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você é apenas um vaso de barro contendo um tesouro; o que muda na sua autoimagem quando entende que a excelência do poder vem de Deus e não de você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Quem? Eu, Senhor?$t$, 7,
$conteudo$V o c ê ouviu os filhos de Deus serem chamados de ovelhas. Se considerarmos tudo, não é um nome errado. A imagem desperta visões de pastos verdes, águas tranqüilas e um pastor bondoso, cuidando do rebanho.

Mas ele também se refere a nós como mulas. Às vezes penso que essa é a melhor analogia.

Lembra-se do que o Senhor disse nos Salmos? "Não sejais como o cavalo ou a mula, sem entendimento, os quais com freios e cabrestos são dominados; de outra sorte não te obedecem" (SI 32:9).

Não seja como uma mula relutante! Não seja teimoso quando Deus fala. Não lute e resista continuamente a ele. Não fique fugindo dele para impedi-lo de falar com você. Não o force a laçá-lo antes de permitir que ele se aproxime.

Por que resistimos a um Deus tão magnífico que nos ama? Não faz sentido! Como notamos no capítulo anterior, muitas vezes fugimos do seu chamado porque nos sentimos inferiores. Falhamos repetidamente e nem imaginamos que é vontade dele nos usar. Tratamos nossas asas quebradas e nos recusamos a voar de novo pelos céus. Quando o Senhor diz: "Meu filho, minha filha, escolhi você para esta tarefa", viramos as costas. Dizemos a nós mesmos que uma vez que já conseguimos bagunçar tudo, simplesmente não podemos passar

136 MOISÉS: UM HOMEM DEDICADO E GENEROSO

pelo mesmo desapontamento e vergonha outra vez. É nesse ponto que nossa semelhança com a mula aparece. Resistimos obstinadamente até mesmo ao pensamento de voltar à ação.

Lembro-me das vezes, anos atrás, em que Chuck, nosso filho mais novo, trazia seus sapatos para mim com um nó. Ele deveria ter cerca de quatro anos, talvez cinco, na época, e ninguém, ninguém mesmo, conseguia fazer um nó tão apertado num sapato como nosso garotinho. Ele usava essa estranha maneira para desatá-lo: puxava as duas pontas do cordão com toda a força. Depois as retorcia e as apertava até o cordão se tornar uma bolinha dura. Não era possível descobrir onde uma ponta terminava e a outra começava.

Em vez de levar o problema para mim no começo, ele só trazia no fim... depois de ter tentado consertá-lo, depois que o laço se transformava num nó tão pequeno e apertado que só um ato divino poderia desatá-lo. Eu já tinha dito várias vezes: "Filho, quando você puxar o cordão e ele não desatar como deve, não puxe com mais força. Traga os sapatos para mim e eu vou ajudá-lo". E ele geralmente respondia: "Eu sempre acho que vou conseguir, por isso que puxo mais forte".

Que imagem apropriada de nossa vida com Deus. Conseguimos nos envolver em situações difíceis e nos recusamos a admitir que nós mesmos fizemos o nó. Puxamos então cada vez mais forte, até que se torna necessário (literalmente) um ato de Deus para tirar-nos do apuro.

Há algum tempo encontrei este versinho bastante adequado:

Com mãos impacientes e sem a menor reflexão Interferimos nos planos de Deus. E quando gritamos, na maior aflição Ele responde, em atenção aos seus: Fique tranqüilo, meu filho, pois desato o nó que você deu.1

Era isso que Deus queria fazer com Moisés. Sua vida se transformara num grande nó de esforço pessoal — trabalho duro e sincero na energia da carne. Quando tudo ficou tão enrolado e complicado, ele finalmente retirou-se para o deserto, onde permaneceu por quaren-

QUEM? EU, SENHOR? 137

ta anos. Chegou então o grande dia em que Deus falou com Moisés e disse: "Moisés, quero utilizar-me de você novamente, tenho um trabalho para você".

Foi quando a mula Moisés empacou de vez.

"SENHOR, SERÁ QUE OUVI DIREITO?"

Moisés resistira durante quarenta anos, dizendo a si mesmo todo o tempo que era uma causa perdida. Agora, quando Deus fez um chamado direto e simples, o velho pastor não conseguiu lidar com ele. De fato, não se permitiu crer que ainda podia ser útil a Deus. "Vem, agora, e eu te enviarei a Faraó, para que tires o meu povo, os filhos de Israel, do Egito" (Êx 3:10).

Isso não era complicado, era? O Senhor falou numa língua conhecida de Moisés. Deu-lhe uma ordem simples, em duas partes. Primeira, ele disse a Moisés: "Vou enviá-lo". E, segunda: "Você vai tirar o meu povo do Egito". O plano era esse.

Note, por favor, que este não era um arranjo de múltipla escolha. Não era sequer um convite. Era um chamado. Deus não fala e pede nosso conselho sobre seu plano. Deus faz declarações; ele não abre a porta para uma conversa informal ou um diálogo. Ele não reúne uma comissão de consultores qualificados para sugerir opções viáveis.

Ele fala, e isso é tudo. Em ocasiões muito especiais em nossa vida, Deus nos diz: "Olhe, meu filho, tenho isto em mente para você. Sei que deu um nó nas coisas no passado. Sei também que poderá dar um nó nas coisas no futuro. Mas, quanto a hoje, neste momento, este é o meu plano para a sua vida. Agora vá, eu o estou enviando, e estarei com você".

Ele disse isso a Moisés, mas ele não quis tomar conhecimento. Por que ele resistiu? Estou sinceramente convencido de que Moisés não ouviu direito as palavras de Deus. Talvez ele pensasse que era desejo de Deus torná-/# o libertador de Israel, e isso o fez entrar em pane.

138 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Mas Deus não lhe dissera isso! Deus dissera que ele seria um instrumento na libertação e o próprio Deus seria o libertador. Grande diferença. Em seu chamado, Deus tem um plano, mas jamais espera, porém, que você execute esse plano. Ele o executará. Ele quer, simplesmente, que você seja o instrumento de ação. Afinal, é a reputação dele que está em jogo, não a sua. Tudo o que ele pede é que você se doe a ele como uma ferramenta a qual possa usar. Isso é tudo.

Moisés não entendeu. "Então disse Moisés a Deus: Quem sou eu para ir a Faraó e tirar do Egito os filhos de Israel?" (Ex 3:11).

Posso até ouvir Deus respondendo: "Espere um pouco, Moisés. Você não compreendeu. Não foi isso que eu disse! Tudo o que tem de fazer é estar no lugar certo, na hora certa e me ver trabalhar. Será esplêndido! Basta estar com o coração preparado, certificar-se de que está andando em obediência e então me observar, enquanto tiro os israelitas do Egito".

Quando Moisés disse: "Quem sou eu para ir a Faraó...?" isso soa como uma resposta humilde, educada, não soa? Na verdade, essa foi a pergunta mais inconveniente a ser feita ao Senhor. Ele deveria ter respondido: "Como o Senhor quiser. Estou disponível. Sou inflamável como esta sarça. Basta riscar o fósforo. Estou pronto para partir". "Deus lhe respondeu: Eu serei contigo; e este será o sinal de que eu te enviei: depois de haveres tirado o povo do Egito, servireis a Deus neste monte" (v. 12).

Que monte? O monte Sinai, mencionado no versículo 1. Se você tivesse de viajar para essa enorme montanha de pedra cinzenta hoje, veria que ela está a dois mil, quatrocentos e trinta e oito metros acima do nível do mar. Nesse momento, é fácil visualizar Moisés recuando e contemplando aquele cume escarpado. Tenho a impressão de que um sentimento estranho o invadiu ao ouvir tais palavras. Deus havia dito: "Moisés, o sinal determinado será este: quando tirar aquelas pessoas do Egito e vier diretamente a este monte, virá adorar-me em companhia delas".

Naquele momento, creio que Moisés soube em seu coração que estava perdido. Não havia meios de fazer Deus esquecer-se desse plano.

QUEM? EU, SENHOR? 139

Você já tentou desviar Deus de um plano? É a experiência mais frustrante que posso imaginar. Você pensa que está sendo "persistente", mas tudo o que faz é apertar cada vez mais o nó. Você e eu precisamos trabalhar com Deus, ao mesmo tempo que trabalhamos para ele. Quando ele nos inclui em seu plano, não há realmente outra alternativa.

O problema com esse arranjo é que as escolhas dele parecem no geral muito ilógicas do nosso ponto de vista. Dizemos a nós mesmos que o propósito dele não pode ser na verdade esse. Para falar francamente, você teria escolhido Jonas para evangelizar Nínive, especialmente sabendo que ele odiava os ninivitas com todo o coração? Claro que não. Você o teria descartado imediatamente. Qualquer aluno do primeiro ano do seminário com toda a certeza seria uma escolha melhor do que alguém com uma atitude amarga, racista, contra os cidadãos.

Deus pensava de outro modo; Jonas foi seu escolhido desde o início.

Você teria escolhido Gideão para ser o líder de uma revolta contra um poderoso exército de ocupação? As Escrituras descrevem essa vastíssima força: "Os midianitas, os amalequitas e todos os povos do Oriente cobriam o vale como gafanhotos em multidão; e eram os seus camelos em multidão inumerável como a areia que há na praia do mar" (Jz 7:12). E Gideão lideraria o ataque? Que piada! O anjo do Senhor teve de caçar esse homem valente que, com medo do inimigo, malhava trigo escondido no lagar.

E Moisés? Você teria escolhido um pastor de oitenta anos curtido pelo sol para enfrentar um dos mais poderosos reis do mundo? Moisés percorrera os pastos durante quarenta anos. Ele perdera completamente o contato com seu povo. Estivera criando uma pequena família, morando e trabalhando para seu sogro. Em quatro décadas o homem não conseguira juntar dinheiro suficiente para construir um lugar para si. Admita, ele não parece um candidato bem improvável para a tarefa de livrar todo um povo das garras de uma poderosa nação?

140 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Moisés também parecia pensar desse modo. A idéia tinha tanta lógica quanto uma sarça do deserto que queima e queima, mas não é consumida pelo fogo. Eram esses seus sentimentos naquele dia importante em que o Senhor o encontrou no deserto. E é geralmente assim que você e eu nos sentimos também. Não vemos as coisas como o céu as vê. Deus nos diz: "Você não olha para as pessoas do mesmo jeito que eu. Você olha para o exterior e tira suas conclusões, baseado nisso. Mas eu não. Eu olho embaixo da superfície — nas profundezas do coração. Olho para encontrar algumas qualidades muito específicas no indivíduo e faço então minha escolha".

Leia as palavras do vidente Hanani: "Porque, quanto ao Senhor, seus olhos passam por toda a terra, para mostrar-se forte para com aqueles cujo coração é totalmente dele" (2 Cr 16:9).

Guarde bem esse versículo. Em algum momento você talvez possa usar essas palavras na vida de alguém que venha pedir-lhe conselhos e encorajamento. Os olhos de Deus varrem o planeta para encontrar indivíduos específicos cujo coração é certo para uma tarefa especial que ele tem em mente. Quando os encontra, cuidado! Ele os atira na correnteza da ação, sustentando-os com sua mão poderosa.

Moisés não se via como Deus o via. Ele tornou-se teimoso em sua resistência. Ergueu o queixo, empertigou-se todo e recusou-se a crer nas palavras do Senhor. Durante esse processo, usou várias desculpas esfarrapadas. Vamos considerar cada uma dessas quatro respostas impróprias. Devo adverti-lo desde já que elas irão soar muito familiares.

PRIMEIRA DESCULPA: "NÃO T E N H O TODAS AS RESPOSTAS".

Disse Moisés a Deus: Eis que quando eu vier aos filhos de Isra- el e lhes disser: O Deus de vossos pais me enviou a vós outros; e eles me perguntarem: Qual é o seu nome? Que lhes direi?

Êxodo 3:13

QUEM? EU, SENHOR? 141

"Mas Senhor", Moisés dizia, "não posso ser o seu porta-voz nesta situação. Eu não saberia o que responder quando começassem a fazer-me perguntas".

Antes de considerarmos a resposta do Senhor, pare e pense por um momento sobre essa desculpa pouco convincente. Ela tem um tom familiar, não tem? Trata-se de um pretexto usado por muitos hoje:

"Senhor, não posso fazer o que me pede porque não vou saber o que dizer e vou ter dificuldade em lidar com isso. Alguém vai me perguntar: 'E os pagãos da África?' ou: 'Como foi possível pôr os dinossauros na arca de Noé?' Não vou conseguir abrir a boca. Não vou saber o que dizer e parecerei ridículo e tolo aos olhos de outros. Não, não posso fazer isso, Senhor. Sabe como são as coisas, não sabe? Não tenho todas as respostas".

Você talvez se lembre do que aconteceu no colégio ou na faculdade, quando um professor, sabendo que estava errado, se manteve em cima do muro em uma questão lógica. Ele sabia que estava errado, todos sabiam disso, mas ainda assim persistiu obstinadamente no erro. O que você fez? Provavelmente começou a pressioná-lo a tomar uma posição, derrubando o frágil muro com um conjunto de fatos irrefutáveis. Por que fez isso? Porque há algo dentro de nós que deseja que a outra pessoa simplesmente admita: "É verdade, eu estava errado".

Nunca perdi o respeito por um indivíduo que respondesse a uma pergunta, dizendo: "Não sei". Por outro lado, perdi grande parte do respeito por aqueles que sabiam estar errados, e sabiam que eu sabia que estavam errados, mas não conseguiam admitir isso.

Pergunta direta: Por que achamos que temos de ter todas as respostas na ponta da língua? Resposta direta: Orgulho. O orgulho diz: "Se não tiver uma resposta imediata, se disser 'não sei', vão rir de mim". Mas isso não é verdade de maneira nenhuma. As pessoas inteligentes, atenciosas, não vão rir; compreenderão que ninguém tem todas as respostas.

Quando Moisés deu a Deus essa primeira desculpa esfarrapada e disse: "Não tenho todas as respostas", Deus respondeu imediatamente: "Talvez não tenha, mas receberá tudo de mim.

142 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Disse Deus a Moisés: EU SOU O QUE SOU. Disse mais: Assim dirás aos filhos de Israel: EU SOU me enviou a vós outros.

Êxodo 3:14

O que isso significa? Os leitores percorrem essas palavras com os olhos e ficam imaginando por que essa resposta era importante e por que ela pareceu satisfazer Moisés.

Analisando um pouco mais o idioma original, descobrimos que as palavras "EU SOU O QUE SOU" são exatamente as letras em hebraico que formam o nome Yahweh. Deus estava dizendo: "O único Ser de todo o universo com existência própria, infinito, enviou você, Moisés. Você o representa. EU SOU enviou você. Diga isso a eles".

A palavra Yahweh é o termo mais íntimo para o Senhor vivo no vocabulário hebreu. Deus dizia então: "Moisés, quando estiver diante daqueles anciãos de Israel, deixe que saibam que o Deus íntimo de Israel mandou-o como seu representante".

Deus continuou, dando duas promessas a Moisés, para ajudá-lo a apresentar-se aos anciãos e depois ao próprio Faraó. No versículo 18, Deus diz a Moisés que os líderes dos israelitas "ouvirão a sua voz". Moisés recebeu a promessa de Deus naquele dia. Quando chegou a hora de tratar com o Faraó, o Senhor fez uma segunda promessa:

"Portanto estenderei a minha mão, e ferirei o Egito com todos os meus prodígios que farei no meio dele; depois vos deixará ir" (Êx 3:20).

Que segurança! Já era um trato feito. O Senhor disse a Moisés que os anciãos não só o ouviriam e creriam nele, como o próprio Faraó iria obedecer e abrir a porta para a liberdade. Isso vai acontecer; ele vai permitir a saída de Israel. Você tem as minhas promessas como garantia, Moisés, não vou abandoná-lo. Você acha que não tem todas as respostas, mas receberá tudo de mim. Você representa EU SOU e representa minhas promessas infalíveis.

Você pensa que isso teria selado o trato, certo? Quero dizer, o que mais Moisés precisava ouvir? No entanto, ele deu outra desculpa esfarrapada.

QUEM? EU, SENHOR? 143

SEGUNDADESCULPA: "ELES NÃO VÃO RESPEITAR-ME".

Respondeu Moisés: Mas eis que não crerão, nem acudirão à minha voz, pois dirão: O Senhor não te apareceu.

Êxodo 4:1

Com essa reação, Moisés mostra como temia profundamente o ridículo. Mais do que tudo, talvez ele tenha um medo mortal de parecer um velho tolo. Diz, na verdade: "Senhor, estive no Egito. Sei como as coisas são por lá. O Senhor diz que devo voltar confiante para a capital — um pastor idoso, cansado, saído do deserto? Que tipo de recepção pensa que vou ter? Olhe para estas roupas! Para este rosto enrugado. Está dizendo que devo entrar diretamente no centro da sofisticação e da cultura — encaminhar-me para o trono de Faraó, segurando este meu velho e nodoso cajado? E vou convencer aquele teimoso monarca a deixar que tire todos os seus escravos pela porta dos fundos, como um rebanho de ovelhas? Quem acreditaria nisso, Senhor? Eu me sentiria como um bóia-fria que acabou de cair de um caminhão de nabos se dissesse isso".

Não é nada agradável sentir-se tolo na frente dos outros. Para a maioria de nós, seria uma repetição do velho pesadelo em que você está fazendo um comunicado à classe e de repente nota que está ali de pé só com a roupa de baixo. Moisés temia justamente esse tipo de embaraço. Na solidão de seu refúgio no deserto, ele pelo menos mantinha sua dignidade. Podia ser pouco conhecido, podia ser um ninguém; já estava na reta final, mas sentia-se seguro. Pelo menos ninguém estava rindo dele.

Pela resposta de Moisés, é óbvio que ele havia ignorado o que Deus acabara de dizer. De algum modo, as palavras vindas da sarça ardente entraram por um ouvido e saíram pelo outro. O Senhor já lhe afirmara: E ouvirão a sua voz. E ei-lo aqui, apenas alguns momentos depois, dizendo: "E se não derem atenção ao que eu disser?"

Há uma faiha de comunicação em algum ponto entre eles! A segunda desculpa de Moisés foi na verdade uma negação franca da clara promessa de Deus.

144 MOISÉS: UM HOMEM DEDICADO E GENEROSO

"Moisés, quando for para lá eles vão ouvir."

"Certo, Senhor, mas se não ouvirem?" Não consigo deixar de imaginar se no meio daquela sarça Deus não sacudia a cabeça. Será que o homem não ouviu o que acabei de dizer? O problema? Moisés estava agindo de acordo com o modo teimoso de uma mula. E não é possível argumentar com uma mula. "Moisés, você terá todo o meu poder. Essa é a minha resposta." "Está bem, mas talvez não tenha todo o respeito deles." "É claro que terá! Acabei de dizer-lhe que teria todo o meu poder!"

Eis um outro pensamento: a segunda desculpa de Moisés foi totalmente hipotética. Ela começou com um condicional, "e se...?" Essas serão e sempre vão ser as palavras dos preocupados. Todo indivíduo preocupado na família de Deus subsiste nessas duas palavras. E se isso ou aquilo ocorrer? E se fulano e sicrano fizerem isto ou aquilo? E se acontecer desse modo?

Muitos enchem a mente com as incertezas do amanhã, permitindo que o monstro "E Se" os sufoque. Era isso que Moisés estava fazendo. Estava tão preocupado com o que poderia acontecer, que não ouviu Deus declarar o que iria acontecer. Sua mente estava cheia de cenas imaginárias. Ele se via de volta às terras férteis do Egito, regadas pelo rio Nilo. Visualizou a opulência e o esplendor da corte egípcia e todos aqueles homens e mulheres bem-vestidos, sofisticados, mundanos. Não vão respeitar-me. Como poderiam? Vão olhar-me como se eu fosse uma relíquia antiga e curiosa e zombarão de mim. Moisés estava claramente preocupado com a sua pessoa.

Conhecendo os temores e pensamentos de Moisés, o Senhor, gentil e pacientemente, lhe disse: "Deixe-me mostrar-lhe, Moisés, o que sou capaz de fazer".

Perguntou-lhe o Senhor: Que é isso que tens na mão? Respondeu-lhe: Uma vara. Então lhe disse: Lança-a na terra. Ele a lançou na terra, e ela virou cobra. E Moisés fugia dela. Disse o Senhor a Moisés: Estende a mão, e pega-lhe pela cauda

QUEM? EU, SENHOR? 145

(estendeu ele a mão, pegou-lhe pela cauda, e ela se tornou em vara)...

Êxodo 4:2-4

Você não acha que ele deveria ter-se sentido aliviado naquele momento? Pegara uma cobra venenosa que lhe fugia das mãos e Deus a transformara num pedaço de madeira. A lição? "Olhe, Moisés, sou capaz de transformar uma vara de madeira numa cobra viva e depois fazer com que vire outra vez uma vara de madeira. Isso é algo que você tem na mão e pode usar. Não estou enviando você diante do rei como um palhaço tolo, com pequenas argolas e caixas, ou uma caixa de truques baratos. Sou o Senhor dos céus e da terra. Estou enviando você para realizar poderosas demonstrações."

O Senhor certamente prendeu a atenção de Moisés naquele instante. Então prosseguiu:

Disse-lhe mais o Senhor: Mete agora a tua mão no peito. Ele o fez; e, tirando-a, eis que a mão estava leprosa, branca como a neve. Disse ainda o Senhor: Torna a meter a tua mão no peito. Ele a meteu no peito, novamente; e quando a tirou, eis que se havia tornado como o restante de sua carne.

Êxodo 4:6-7

Pense nisso! Moisés olhou para a mão e ela tinha lepra — a mais temida de todas as doenças. Que choque! Seguindo as ordens de Deus, porém, quando ele a pôs de volta nas dobras de sua túnica e a puxou novamente, ela havia sido curada, como o resto da sua carne.

Notável! Isso, contudo, não era nada para o Senhor do universo. Ele podia (e faria) muitas outras demonstrações milagrosas e maravilhosas no Egito. Transformaria o poderoso Nilo em sangue. Cobriria a terra de piolhos, gafanhotos, rãs, moscas e as pessoas de úlceras doloridas. Faria o sol se esconder e mergulharia a nação nas mais densas trevas. Finalmente, tiraria a vida de cada primogênito em todo o Egito. Ele é Senhor, e isso quer dizer que poderia fazer o que lhe agradasse. Tudo o que pedia a Moisés era que se apresentasse ao

146 MOISÉS: UM HOMEM DEDICADO E GENEROSO

rei, desse a mensagem e depois saísse de cena, enquanto Deus sacudia o país inteiro com seu impressionante poder.

Fico entusiasmado só de pensar em ser Moisés! Quando Deus pôs tal poder nas mãos de um homem? Certamente a essa altura ele estaria convencido.

Não, não estava. Surpreendentemente, em vez de cair de joelhos, com reverência e pronto a obedecer, Moisés se escondeu outra vez atrás de uma desculpa pouco convincente.

TERCEIRA DESCULPA: "SOU PESADO DE BOCA E DE LÍNGUA"

Então disse Moisés ao Senhor: Ah! Senhor! Eu nunca fui eloqüente, nem outrora, nem depois que falaste a teu servo; pois sou pesado de boca e pesado de língua.

Êxodo 4:10

A Bíblia Viva parafraseia essa terceira desculpa: "Ah! Senhor! Nunca fui bom para falar. Nem antes, nem depois que o Senhor falou comigo, pois sou lerdo para falar".

Moisés estava dizendo: "Senhor, não é fácil para mim reunir meus pensamentos. E mesmo que faça isso, não consigo expressá-los. Minha língua fica travada".

E possível que você se identifique com Moisés nesse ponto. Você diz: "Olhe, quando fico na frente de um grupo... hummm... não consigo falar o que preciso. Tenho medo. Meus joelhos tremem. Meu estômago fica embrulhado. Para piorar as coisas, nunca sei o que dizer. Posso ter alguns pensamentos bons de vez em quando, mas não sei como apresentá-los".

Essa foi a queixa de Moisés. Ele estava declarando ao Senhor: "Venho cuidando de ovelhas há tantos anos. Tudo o que sei agora é 'béééé, béééé, béééé'. Mas o Senhor está me empurrando para ficar diante de todas essas pessoas educadas, autoridades na corte de Faraó, e ser eloqüente. Eu... eu simplesmente não consigo... não posso. Está compreendendo, não está, Senhor?"

QUEM? EU, SENHOR? 147

Meu amigo e mentor, dr. Howard Hendricks, deu um curso Dale ('arnegie há alguns anos. Ele contou sobre dois homens em sua classe que ficavam petrificados só de pensar em dizer algo na frente de ;ilguém. Um deles tinha tanto medo, que literalmente se escondeu debaixo da carteira quando chegou sua vez de dizer algumas palavras diante da classe. O outro sujeito pediu licença para ir ao banheiro e não voltou mais. Nenhum deles podia lidar com a idéia de se posicionar na frente de nem mesmo alguns ouvintes interessados.

Moisés se sentia assim. Ele perdera o jeito. Você já sentiu isso? Tem a oportunidade de dizer alguma coisa pelo seu Senhor em público, sente o empurrão do Espírito Santo soprando vai em frente, mas fica arrepiado só de pensar no assunto. A desculpa é: "Senhor, não tenho essa capacidade. Não consigo. Não tenho condições de enfrentar esse tipo de tarefa. Não sou pregador".

Vou contar a você algo sobre o apóstolo Paulo que pode surpreendê-lo. Só a menção ao nome do grande apóstolo evoca na mente da maioria dos cristãos a imagem de um grande orador público — uma espécie de Winston Churchill, Ronald Reagan e Billy Graham misturados. Quase todos imaginamos sua entrada numa cidade, com bandeiras tremulantes, como uma combinação de Napoleão Bonaparte e Alexandre, o Grande, pregando com grande eloqüência e fundando igrejas num estalar de dedos.

Embora certamente se possa argumentar que ele era um grande apóstolo, Paulo não era de modo algum um grande orador. Leia suas palavras a esse respeito para a igreja de Corinto: "Quanto a mim, irmãos, quando estive entre vocês, não fui com discurso eloqüente nem com muita sabedoria para lhes proclamar o mistério de Deus" (1 Co 2:1, NVI).

No contexto, Paulo está falando sobre a sabedoria do mundo. Ele dizia: "Como sabem, irmãos e irmãs, não cheguei aqui com arrogância. Não falei da maneira suave, brilhante, que vocês gregos gostam. Vocês já ouviram muitos discursos de oradores eloqüentes, mas não fui um deles em seu meio. Vocês sabem disso... 'E foi com fraqueza, temor e com muito tremor que estive entre vocês' (1 Co 2:3, NVI)".

148 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Pode acreditar nisso? Paulo estava tão nervoso que um joelho dizia ao outro: "Vamos tremer!" Ele podia ouvi-los bater um contra o outro por baixo da túnica. O apóstolo Paulo? Será? Você esperaria vêlo entrar numa sala e assumir o controle, como um professor. Mas as coisas não foram assim. Achava-se entre eles em fraqueza. Em temor. E com muito tremor. Ele passa de fato a admitir: "Minha mensagem e minha pregação não consistiram de palavras persuasivas de sabedoria, mas consistiram de demonstração do poder do Espírito, para que a fé que vocês têm não se baseasse na sabedoria humana, mas no poder de Deus" (1 Co 2:4-5, NVI).

Retrocedendo ao primeiro século, por que Deus não escolheu um porta-voz mais poderoso e eloqüente? Tinha uma boa razão para isso. Não queria que os ouvintes ficassem embevecidos com o estilo e a habilidade do orador. O Senhor sabia o que estava fazendo. Ele não queria que as pessoas saíssem das reuniões de Paulo, comentando: "Estou impressionado! Que comunicador! Que excelente orador!"

Quando o apóstolo Paulo terminava de falar, as pessoas estavam convencidas que haviam encontrado Deus. Quando deixava o pódio, os homens e as mulheres tinham ouvido falar do Salvador vivo. Quando Paulo escrevia uma carta a uma igreja, era como se a própria mão de Deus a tivesse escrito. A fé deles ficava ancorada na rocha sólida do poder divino e não na areia movediça da personalidade humana. Paulo nunca foi o centro da atração. No que se refere a habilidades de oratória em público, ele não tinha condições para comparar-se a um homem como Apolo.

Essa não é a imagem mental comum que acalentamos do grande apóstolo, não é? Como, ele não era um Demóstenes? Não, não era. Como no caso de Moisés, desenvolvemos uma imagem mental do líder como um homem ou uma mulher persuasivo, dinâmico, com uma voz bem modulada, que nunca gagueja ou escorrega em uma única palavra. Por estarmos acostumados aos tipos da televisão, pensamos que os verdadeiros líderes devem usar terno ou vestido sob medida, sem nenhuma mancha, ter dentição bonita e correta, cada fio de cabelo no devido lugar e fitar a audiência com olhos perspicazes, falan-

QUEM? EU, SENHOR? 149

cio com confiança. (Não importa que ele ou ela esteja lendo num ponto mecânico!)

Deus, com muita paciência, diz a Moisés: "Ouvi o que você disse e é isso que vou fazer. Respondeu-lhe o Senhor: Quem fez a boca do homem? ou quem faz o mudo ou o surdo, ou o que vê, ou o cego? Não sou eu, o Senhor? Vai, pois, agora, e eu serei com a tua boca, e te ensinarei o que hás de falar" (Ex 4:11-12).

Isso é que é terapia divina da fala! " Vou estar nos seus lábios. Estarei na sua língua. Darei a você as palavras necessárias, conforme tiver necessidade delas."

Sabe o que descobri sobre o Senhor? Ele não dá sabedoria a crédito. Não entrega a você um pacote de discernimento, ou várias frases repletas do Espírito para você guardar e utilizar numa emergência. Sabe quando ele nos dá palavras, sabedoria e discernimento? No momento em que precisamos. No exato instante em que são requeridos.

Se você for um pai ou mãe, pode ter experimentado esse fenômeno. Você se encontra numa situação que nunca previu e não pôde preparar-se para ela. De repente, está numa conjuntura crítica da vida na qual você é a mãe ou o pai e seu filho olha dentro de seus olhos, dependendo de você para obter a resposta certa. Nem sempre, mas com freqüência, lhe são dadas as palavras de que precisa. Mais tarde, compreende que foram palavras que transcenderam sua sabedoria. Nesse momento singular, você faz uma pequena oração de agradecimento. "Louvado sejas, Senhor. Era exatamente isso o que eu precisava dizer". Você não poderia ter planejado nem se preparado para isso; mas quando o momento chegou, o Senhor lhe deu sabedoria e as palavras necessárias.

Era isso que Deus, em sua bondade, estava tentando explicar para um homem com um caso grave de jumentite. "Vai ser assim, Moisés. Vou estar com sua boca e guiarei sua língua. Darei a você exatamente as palavras de que precisa e quando forem necessárias." Não é um plano grandioso? Não esqueça, porém, ele exige fé. Deus estava dizendo: "Quero que esteja disposto a confiar em mim, Moisés. Quero que entre de bom grado nessa situação e confie em mim para falar".

150 MOISÉS: UM HOMEM DEDICADO E GENEROSO

No versículo 14 parece que Moisés estava quase concordando: "Tudo bem. Estou pronto para ir". Infelizmente, não era isso que ele queria dizer. Veio, porém, outra desculpa. A mula continua empacada.

QUARTA DESCULPA: "NÃO SOU TÃO QUALIFICADO QUANTO OUTROS".

Ele, porém, respondeu: Ah! Senhor! Envia aquele que hás de enviar, menos a mim.

Êxodo 4:13

Em outras palavras, qualquer um, menos eu, Senhor! A leitura deste versículo na NVT é: "Ó, Senhor, peço que envie outra pessoa para fazer isso" (tradução livre). A Bíblia na Linguagem de Hoje me faz sorrir: "Não, Senhor. Por favor manda outra pessoa".

"Ó, Senhor, não sou qualificado. Na terra do Egito há muitas pessoas capazes, que conhecem a cultura e a linguagem como a palma da mão. Eu era assim, mas não sou mais. Estou por fora. O Senhor não procurou direito lá no Egito. Há todo tipo de gente que poderia cumprir essa tarefa com facilidade e eficiência. Já pensou em pôr um anúncio? Haverá provavelmente algum jovem egípcio perfeitamente qualificado. Faça uso dele! Por que vir aqui a este canto esquecido do deserto e falar com um velho habitante destas paragens, curtido pelo sol? Há quarenta longos anos não ponho o pé no Egito. Nem sei mais me orientar em Gósen. Provavelmente tudo mudou. Está vendo, Senhor? Há muitos outros muito mais capazes que eu."

Você já se sentiu assim? O Senhor o tocou com o dedo e você imediatamente olhou em volta e disse: "Quem? Eu, Senhor? Olhe aquele indivíduo na próxima fila. Veja a mocinha ali adiante. Ele se diplomou nessa área. Ela é uma consultora, pelo amor de Deus. Ele fala a grupos todo o tempo. Ela liderou um grupo de estudo bíblico para mulheres durante dezoito anos. A família dele já cresceu e saiu de casa. Ela permaneceu nessa igreja vinte e três anos. Veja a sua capacidade! Eu? Eu tenho crianças em casa... tenho dívidas... sou hipertenso... meus dentes são tortos... sou gordo demais... nunca fui

QUEM? EU, SENHOR? 151

seminarista... não tenho nada decente para vestir... não sei como me comportar diante das pessoas".

E o Senhor volta e lhe diz: "Sei de todas essas coisas. Mas você continua sendo minha escolha. Meu chamado é claro e final". Essa c a resposta dele. Se você acha que é persistente, não deve ter feito negócios com Deus nesses últimos tempos. Ele não desiste de nós. (Graças a Deus!)

Ele fica, porém, zangado às vezes. Você talvez tenha tido pais como os meus, que eram pacientes até certo ponto, e depois desse ponto não tinham paciência nenhuma.

A SEGUNDA ESCOLHA

Então se acendeu a ira do Senhor contra Moisés, e disse: Não é Arão, o levita, teu irmão? Eu sei que ele fala fluentemente; e eis que ele sai ao teu encontro e, vendo-te, se alegrará em seu coração. Tu, pois, lhe falarás e lhe porás na boca as palavras; eu serei com a tua boca e com a dele, e vos ensinarei o que deveis fazer. Ele falará por ti ao povo; ele te será por boca, e tu lhe serás por Deus. Toma, pois, esta vara na mão, com a qual hás de fazer os sinais.

Êxodo 4:14-17

Sabe o que Deus fez? Ele concordou com o desejo de Moisés. Mas o acordo não teve um resultado tão bom! O irmão Arão provou ser um fardo em sua vida. Foi Arão que se impacientou enquanto Moisés estava no monte e criou um bezerro de ouro para o povo adorar. Foi ele quem disse ao povo: "São estes, ó Israel, os teus deuses, que te tiraram da terra do Egito" (Êx 32:4).

Ao ler essas palavras, você pode sentir o empurrão de Deus para você aceitar pela fé um plano que lhe parece, na melhor das hipóteses, arriscado. Você não tem todas as respostas. Não sabe os comos e os porquês daquilo que Deus tem em mente. De um ponto de vista humano, as perspectivas parecem bem sombrias. Sabe qual é a nossa tendência? E levar alguém conosco. De algum modo,

152 MOISÉS: UM HOMEM DEDICADO E GENEROSO

isso impede que coloquemos toda a nossa confiança no plano de Deus; podemos nos apoiar nesse amigo ou companheiro talentoso que nos acompanha.

Quantos entraram numa sociedade de negócios e viveram arrependidos do dia em que escolheram determinado sócio? Quantas mulheres se envolveram em atividades com um companheiro que desejariam nunca ter ao lado? O chamado de Deus é um assunto sério e individual. Embora creia de todo o coração na prestação de contas, o chamado de Deus não se presta ao sistema de parceria ou de excursões em grupo. Antes que convide alguém para acompanhálo nesse chamado, ou antes de unir-se a uma equipe, você deve estar absolutamente certo em seu coração que cada um tem em seu íntimo a mesma visão que a sua.

Se não for assim, aceite este conselho, meu amigo: vá sozinho. Siga a voz de Deus sem distrações de espécie alguma.

Deus estava finalmente disposto a dizer a Moisés: "Está bem. Está bem, faça como quiser. Vou enviar Arão também, mas não é a minha escolha, Moisés. Chegará o dia em que você vai desejar ter atendido sozinho o meu chamado. Você não precisa realmente de Arão, tudo de que precisa sou eu".

"PRECISO DE UMA LICENÇA, JETRO"

Êxodo 4:18 dá um vislumbre da humanidade de Moisés e da paciência de Deus.

Saindo Moisés, voltou para Jetro, seu sogro, e lhe disse: Deixame ir, voltar a meus irmãos que estão no Egito para ver se ainda vivem. Disse-lhe Jetro: Vai-te em paz.

Moisés só deixou algumas coisas fora desse relato, não acha? Ele disse: "Pai, quero ver se meus amigos do Egito estão ainda vivos. Estou aqui há quarenta anos já. Importa-se se eu tirar umas férias? Você sabe, para contemplar as pirâmides, passear pelo Nilo, coisas assim".

Jetro então responde: "Ótimo. Aproveite. Vá, filho".

QUEM? EU, SENHOR? 153

De algum modo, Moisés não conseguiu dizer: "Olhe, Jetro, havia uma sarça no deserto e uma voz na sarça e, bem, em resumo, vou guiar toda a nação de Israel num Êxodo, livrando-a da escravidão e fazendo que chegue a Canaã". Ele não conseguiu dizer isso. Mas Deus, em sua graça, não repreendeu Moisés. Ele não disse: "Vamos, Moisés! Conte a ele toda a história". Permitiu, no entanto, que Moisés falasse de sua partida com uma explicação um tanto generalizada, nebulosa.

Isso de algum modo toca o meu coração. Deus é cheio de graça. Moisés estava fazendo as malas para ir para o Egito e Deus não se importa. Tudo o que ele pede a nós é um coração disposto. Ele não espera perfeição. Não espera que você tenha todas as respostas, toda a capacidade, toda a coragem. Ele nem sequer exige que descreva todos os detalhes do seu chamado. Só pede que esteja disponível e dê o primeiro passo de fé na direção em que ele aponta.

TRÊS PRECAUÇÕES FINAIS

No momento em que não resistir mais, puser de lado a teimosia de mula e resolver em seu coração dar ouvidos ao Senhor, precisará tomar três precauções.

Primeira, certifique-se de que a voz é de Deus. Muitas pessoas que buscam a glória de Deus parecem pensar que a opinião dele não tem nenhuma influência. Tudo está dando certo, elas estão se divertindo, sentem um toque de aventura em sua busca e não querem ser detidas por ninguém, nem mesmo por Deus.

A voz de Deus não é tão difícil assim de ouvir. De fato, você quase precisa fechar os olhos e os ouvidos para não ouvi-la. Ele algumas vezes grita em meio à nossa dor, sussurra enquanto estamos relaxando nas férias, canta ocasionalmente para nós numa canção e nos adverte por meio dos sessenta e seis livros da sua Palavra escrita. Está tudo ali, tinta no papel. Tenha a certeza — esse livro nunca vai desencaminhar você.

Além de sua fonte infalível de sabedoria, ele lhe deu conselheiros, amigos, conhecidos, pais, professores e mentores prudentes que

154 MOISÉS: UM HOMEM DEDICADO E GENEROSO

conquistaram o seu amor e respeito ao longo dos anos. Pesquise o que julga ser a vontade de Deus pelos pensamentos e perspectivas deles. Sua convicção sobre o caminho que está seguindo aumenta, ou está vendo uma porção de bandeirinhas vermelhas tremulando e sinais de perigo? Antes de decidir sobre um mudança decisiva, tome a precaução de verificar se é a voz de Deus, se é o chamado dele, que está ouvindo.

Segunda, tenha confiança no poder dele. Não abandone a tarefa, dizendo a si mesmo: "Não sou forte o bastante para isso. Não tenho o poder".

Ouça, você não tem de ser poderoso. E um vaso de barro, lembrase? E um jarro comum, de cerâmica, feito para conter o poder dele. O Senhor não pede que seja simpático, inteligente, lúcido ou persuasivo. Não espera que seja poderoso em palavras e obras. Só pede que ponha sua confiança nele.

O bom rei Josafá orou: "Ah! Nosso Deus... em nós não há força para resistirmos a essa grande multidão que vem contra nós, e não sabemos nós o que fazer; porém os nossos olhos estão postos em ti" (2 Cr 20:12).

Terceiro, sinta-se confortável com o plano dele. Receba-o na forma em que se encontra. Aceite os arranjos dele. Não mexa em nada ou pense que acrescentando um Arão vai melhorar as coisas e tornar o plano mais eficaz. Siga o caminho mais difícil em vez do mais fácil — o caminho da transigência, das concessões. No final, irá bendizer muitas vezes o Senhor por ter feito isso.

Enquanto lutava com o conteúdo deste capítulo, fiquei perguntando a mim mesmo: O que significa estar disposto? O que significa desistir da velha teimosia de mula e começar a atender à voz do Senhor? Enquanto refletia sobre essas perguntas, encontrei uma oração que diz tudo e diz bem.

Senhor, estou disposto. Estou disposto a receber o que tu dás. Estou disposto a que me falte o que reténs. Estou disposto a entregar o que tu quiseres tomar. Estou disposto a sofrer o que exigires.2

QUEM? EU, SENHOR? 155

É assim que refreamos nossa tendência de resistir. É assim que despimos esse traje desconfortável de mula e corremos como uma corça.

Não fique puxando os cordões soltos da sua vida, pensando que seu plano é melhor. Leve o nó apertado para ele. Leve a ele seus fracassos, seus falsos começos e suas cruzadas bem-intencionadas que o fizeram aterrissar no fundo de um deserto solitário. Deixe que ele escolha os detalhes de sua vida e lhe dê uma nova direção.

Ninguém desata nós como o Senhor.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Diante de um chamado claro de Deus, você costuma resistir como uma mula teimosa por se sentir inferior e incapaz; que medo está por trás dessa resistência?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como o filho que apertava o nó dos sapatos antes de levá-los ao pai, em que situação você tem puxado cada vez mais forte em vez de entregar o problema a Deus?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando Deus diz "escolhi você para esta tarefa", o que o impede de simplesmente confiar que Ele sabe o que faz ao chamar alguém como você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Vontade de Deus, à Maneira de Deus$t$, 8,
$conteudo$E scondidos no terceiro capítulo de Provérbios estão dois versículos que você talvez tenha decorado: "Confia no Senhor de todo o teu coração e não te estribes no teu próprio entendimento. Reconhece-o em todos os teus caminhos, e ele endireitará as tuas veredas" (Pv 3:5-6).

Isso é o que chamo de provérbio "antes e depois". Algumas coisas precisam acontecer previamente para que algo aconteça mais tarde.

A parte antes, no versículo 5, recomenda-nos "confiar no Senhor". Isso sugere apoiar-se nele, deixar que ele tome o controle e dar-lhe o volante de nossa vida. O versículo também nota que devemos fazer isso de todo o coração. Não se trata de algo feito de má vontade, com relutância ou reservas. É uma proposição tudo-ounada.

Nesse ponto, porém, Salomão acrescenta uma advertência: "Não te estribes no teu próprio entendimento". Em outras palavras, não use muletas que você mesmo tenha fabricado. Não tente claudicar em suas próprias forças. Em vez disso, apóie-se firme e, enquanto faz isso, "reconheça-o" plenamente. "Reconhecer" aqui inclui o sentido de "identificar". Reconhece-o em todos os teus caminhos.

158 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Essa é a parte do antes. A nossa parte. Confie nele de todo o coração, em cada canto da sua vida, reconhecendo que é ele que tem o controle.

Agora vem a parte do depois. A parte dele. "Ele endireitará as tuas veredas". Em outras palavras, ele suavizará seu caminho. Cuidará de cada um dos obstáculos na estrada à sua frente.

Outro provérbio, mais adiante no livro, assemelha-se bastante a Provérbios 3:5-6. Salomão escreve: "Sendo o caminho dos homens agradável ao Senhor, este reconcilia com eles os seus inimigos" (Pv 16:7).

Outra preciosa promessa! Quando seu caminho é suave, como resultado de sua obediência, ele fará até seus inimigos ficarem em paz com você.

"O PROBLEMA ESTÃ EM SUAS MÃOS, SENHOR"

Lembro-me de um homem em nossa antiga igreja que pretendia comprar uma casa naquela comunidade. Ele disse ao Senhor desde o início: "Senhor, este projeto é seu. Esta vai ser a sua casa. Não vou me preocupar, angustiar-me, ser conivente e manipular as coisas para colocar essa casa em meu nome. Quero muito isso, como o Senhor sabe, mas me recuso a permitir que eu seja o deus da minha vida. Deixo em suas mãos a decisão sobre cada obstáculo".

Ele estava sendo sincero. Se você comprou ou vendeu uma casa recentemente, já conhece as barreiras e os obstáculos que podem atrapalhar seu caminho. Uma vez que esse homem manteve-se firme e apoiou-se plenamente no Senhor, ele e sua família viram cada um desses obstáculos serem removidos, um a um. Então, no último dia, quando ele e a mulher se preparavam para assinar os papéis para a compra da casa, a empresa que iria fazer o empréstimo telefonou.

"Sinto muito", disse o funcionário, "mas verificamos que seu salário é insuficiente. Não podemos emprestar o dinheiro".

A essa altura, muitos de nós teriam explodido de raiva ou se arrastado para uma caverna de depressão e posto uma rocha na entrada dela. O homem em questão, porém, mesmo em meio a esse enorme desapontamento, lembrou-se de seu acordo com o Senhor.

A VONTADE DE DEUS, À MANEIRA DE DEUS 159

Depois de ter desligado o telefone, ajoelhou-se e disse: "Senhor, como afirmei desde o começo, esta vai ser a sua casa. E se não quer que eu a tenha, que assim seja. Mas o problema está em suas mãos. Recusome a chatear-me por causa dele". Tranqüilizou em seguida o espírito. Reconheceu que Deus era Deus, e ponto final.

Em poucas horas, o telefone tocou novamente. A mesma empresa. O mesmo funcionário. "Pela primeira vez desde que comecei aqui aconteceu algo novo", disse o homem ao telefone. "Cometemos um erro. De fato, fizemos alguns cálculos errados. Seu salário na verdade é suficiente. Está ainda interessado na casa?"

E bom que acredite que ele estava! No momento em que desligou o telefone, depois de falar com a financeira, ele ligou para mim. "Pastor Chuck", disse, "preciso festejar com alguém, e o senhor veio à minha mente!" Contou, então, detalhadamente o que Deus tinha acabado de fazer.

"Sabe de uma coisa", falei, sorrindo, "isso me lembra um provérbio: 'Quando os caminhos do homem agradam o Senhor, ele faz até a financeira ficar em paz com ele'."

"Onde está esse provérbio?" ele gritou no telefone. "Onde está?" Como acontece com todos os provérbios, essa é uma observação de algo geralmente verdadeiro na vida. Não esqueça que não é uma promessa firme. Ela nem sempre funcionará a seu favor. Deus não é uma fada madrinha que deixa presentes sob o nosso travesseiro sempre que fazemos um pedido ao ver "uma estrela cadente". Você nem sempre obterá o empréstimo, ou o emprego, ou a nota necessária para ser aprovado, ou o pagamento em dinheiro, ou a bênção de seus sogros. Não interprete mal esse provérbio, ele não é um instrumento de barganha que você pode usar para que Deus se incline em sua direção.

Mas que maneira linda de viver. E maravilhoso quando você diz: "Senhor, não vou me esgotar com todo esse processo. Não vou acordar todas as manhãs com um nó no estômago. O filho é seu. Vou fazer tudo a seu modo, o melhor que eu puder, e andar de acordo com a sua vontade revelada. Confio no Senhor para cuidar dos obstáculos".

160 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Quando fazemos nossa parte, é notável como as barreiras desmoronam das mais surpreendentes maneiras. No capítulo 4 de Êxodo, nos aproximamos de uma encruzilhada essencial na vida de Moisés. Descalço diante da sarça ardente, ele havia dito mais ou menos isto ao Senhor: "Está bem, Deus, o Senhor venceu. Se quiser usar-me como seu instrumento de libertação, então estou aqui, a seu dispor".

Nos dias que se seguiram, Moisés começou a sentir o que era confiar no Senhor de todo o coração, recusando-se a apoiar-se novamente em suas muletas fabricadas pelo homem. Ao agir assim, ele começou a ver Deus aplainando o caminho à sua frente.

INFORMANDO A FAMÍLIA

Como deve estar lembrado, Moisés pediu a Jetro, seu sogro, permissão para voltar ao Egito. Nessa ocasião, ele certamente não contou tudo ao sogro, mas deixou-o saber que algo o incomodava intimamente. Depois de tantos anos de silêncio sobre sua vida e seu passado no Egito, Moisés disse a Jetro: "Está na hora de voltar. Há algumas coisas a serem resolvidas e elas requerem atenção".

Quando você ouve a voz de Deus chamando-o para seguir numa nova direção — confirmando essa direção mediante sua Palavra, mediante eventos e sabedoria de conselheiros religiosos — o resultado desse processo mental precisa ser comunicado à sua família. Isso se aplica especialmente se você é jovem. Por quê? Porque a sua família não teve o beneficio da sarça ardente. Você ouviu a voz de Deus; eles não. Eles podem não saber ou compreender o que Deus lhe disse. Continuam achando que você deveria continuar numa direção já definida, e agora você parece estar falando sobre planos completamente novos. Essas mudanças abruptas podem parecer perturbadoras ou até perigosas para os que o amam, especialmente os pais. Você precisa ser atencioso o suficiente para dar-lhes alguma informação útil sobre como Deus mudou o rumo de sua vida.

Isso se aplica também ao seu empregador. Jetro dependia de Moisés; eles haviam trabalhado juntos durante todos aqueles anos.

A VONTADE DE DEUS, À MANEIRA DE DEUS 161

Moisés precisou de algum tempo para informar o homem mais velho. Foi algo sábio e amável da parte dele. Seu empregador investiu cm você; ele ou ela lhe deu um emprego, permitiu que se sustentasse enquanto você refletia sobre a vontade e o plano de Deus para a sua vida. Seria imprudente e rude, por mais zeloso que fosse, abandonar repentinamente sua posição com uma rápida explicação de que "Deus me chamou para outro lugar".

Não importa realmente se sua família ou seu empregador são crentes ou não. De qualquer modo você deve a eles prudência, sabedoria e amabilidade durante esse período de transição.

Porque Moisés fez o que devia, quando pediu permissão para ir ao Egito, o sogro respondeu: "Vai-te em paz" (Ex 4:18). Jetro usou aqui a bonita expressão hebraica shalom. "Shalom, Moisés. A paz esteja com você". A Bíblia Viva parafraseia: "Vá com a minha bênção". Gosto disso. Jetro estava dizendo: "Filho, concordo com a sua ida, e saiba que vai com a minha aprovação e meus melhores votos".

CUIDANDO DAS BASES

Essa troca de palavras entre os dois homens me leva a dois princípios que vale a pena considerar. Primeiro, quando Deus concluir um projeto para sua vida, talvez empurrando-o para uma nova direção, seja muito sensível quanto à maneira como comunica isso a outros. Não suponha que eles sabem tudo o que você sabe sobre o processo. Não espere que aceitem a idéia imediatamente e com os braços abertos. Seja delicado, dê-lhes tempo e espaço para refletir sobre o assunto. Comunique seus pensamentos com ternura, cuidado e preocupação. Isso se aplica especialmente aos que são guiados a empreendimentos missionários. Forçando e precipitando um plano, sem se importar com a compreensão e a bênção dos pais, pode-se acabar criando bloqueios no relacionamento que só prejudicam a eficácia do futuro ministério.

A segunda coisa a notar é se o plano está fluindo. Quando você se encontra no centro da vontade de Deus, meu amigo, ele flui. Não precisa forçar nada. Moisés perguntou: "Deixa-me ir?" e Jetro respondeu: "Vai-te em paz". Moisés ficou assim em condições de

162 MOISÉS: UM HOMEM DEDICADO E GENEROSO

iniciar um ministério que seria sem dúvida difícil, porque soube que as coisas em casa estavam em ordem.

Quero parafrasear um provérbio que já mencionei anteriormente: "Quando os caminhos do homem agradam ao Senhor, ele faz até os sogros ficarem em paz com o homem". Você está tendo problemas e conflitos com seus sogros? Pode estar na hora de questionar a razão. Comece de joelhos, perguntando: "Pai, meus caminhos são agradáveis ao Senhor? Há alguma coisa de que estou esquecendo ou simplesmente ignorando nessa questão?" Analise depois seu coração com franqueza e sensibilidade. Essas sessões de auto-análise diante do Senhor, por mais dolorosas que sejam, podem produzir benefício e frutos durante anos.

Mover-se na correnteza direta da vontade de Deus é uma experiência que nos torna humildes. A meu ver, Theodore Epp, já falecido, expôs essa idéia muito bem quando escreveu: "Uma vez que o indivíduo esteja certo de que se acha no centro do plano de Deus e que Deus opera sua vontade por meio dele, esse indivíduo se torna invencível".

Você talvez esteja nesse ponto agora. Você sabe que está no centro da vontade dele e se sente invencível! É um lugar muitas vezes humilhante para se viver, mas o melhor lugar no mundo inteiro.

No começo do meu ministério, lembro-me de ter falado durante uma semana numa reunião de uma pequena faculdade cristã. Logo na primeira reunião, durante meu contato inicial com aquele grupo de alunos, eles fizeram por mim algo que nunca havia acontecido até então e que nunca mais aconteceu depois. Lembra-se do velho coro: "Espírito do Deus vivo, vem de novo sobre mim"?1 Eles personalizaram esse hino com o meu nome e o cantaram baixinho como uma oração.

Enquanto estava ali, de pé diante de mais de quinhentos estudantes, preparando-me para falar-lhes, eles cantavam: "Espírito do Deus vivo, vem de novo sobre Chuck. Derrete-o, molda-o, enche-o, usa-o". De um modo muito real, quando eles terminaram aquele hino-oração, eu me senti invencível. Não orgulhoso. Não, não havia

A VONTADE DE DEUS, A MANEIRA DE DEUS 163

um grama de orgulho naquele sentimento de exaltação e alegria. Sentime como Moisés deve ter-se sentido junto à sarça: "Ele vai me usar esta semana". E o Senhor se deleitou em fazer exatamente isso.

Comunicar, porém, essa invencibilidade é um assunto muito delicado. Você não pode apressar-se. Não deve permitir que a impaciência ou um espírito arrogante prejudique sua alegria ou ofenda aqueles que lhe querem bem. Moisés não fez isso, e a viagem para o Egito começou bem. Antes de guiar uma nação inteira no êxodo do Egito, ele lidou com o seu próprio êxodo do lar de modo respeitoso e com muita consideração.

VOCÊ É PROBLEMA DELE

Disse também o Senhor a Moisés em Midia: Vai, torna para o Egito, porque são mortos todos os que procuravam tirar-te a vida. Tomou, pois, Moisés a sua mulher e a seus filhos; fêlos montar num jumento, e voltou para a terra do Egito. Moisés levava na mão a vara de Deus.

Êxodo 4:19-20

Deus não é mesmo bondoso? Temos um Senhor que conhece nosso coração, nossos pensamentos e nossos temores. Quando Moisés saíra do Egito quarenta anos antes, ali havia alguns que queriam tirar-lhe a vida. O rei do Egito estabeleceu um preço para a cabeça do príncipe Moisés; ele figurava provavelmente em primeiro lugar na versão egípcia da lista dos "Dez Mais Procurados".

Moisés naturalmente não tinha esquecido isso. Ele era um pai de família agora, seguindo para o oeste com a mulher e os filhos, e o perigo iminente talvez pesasse em sua mente. Essa era parte da razão que o fez relutar, a princípio. Mas quando finalmente decidiu aceitar a vontade de Deus, estava determinado a fazer a viagem apesar de todas essas preocupações. Disse ele ao Senhor: "Vou confiar de todo o coração no Senhor. Não vou apoiar-me em meu entendimento. Em todos os meus caminhos, vou reconhecê-lo e permitir que cuide dos obstáculos".

164 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Viajou a seguir para o Egito em obediência ao Senhor. Antes de deixar a fronteira de Midiã, porém, o Senhor fez algo pelo seu servo. Disse a ele: "Olhe, Moisés, você se lembra de todos os que queriam matá-lo no Egito. Não se aflija por causa deles. Estão todos mortos. Não podem mais lhe fazer mal".

Que alívio isso deve ter sido! Que esplêndido é Deus cuidar pessoalmente das coisas que nos preocupam e atormentam. Ele se preocupa com elas mais do que nós. Nenhum pensamento aflitivo, doloroso, preocupante, que faz o estômago doer ou a pressão subir, escapa ao seu olhar. O apóstolo Pedro escreveu: "Lancem sobre ele toda ansiedade, porque ele tem cuidado de vocês" (1 Pe 5:7, NVI). A versão de Phillips dá a seguinte interpretação: "Você pode jogar todo o peso de suas ansiedades sobre ele, porque ele se ocupa pessoalmente delas".

Isso não é bom? Ele realmente se importa. É capaz de carregar todo o peso de sua preocupação. Por ser problema pessoal dele, você nunca desaparece da sua tela do radar.

O Senhor tirou um peso do coração de Moisés quando disse: "Não se preocupe mais com isso. Todos eles foram enterrados". Provavelmente Moisés teve vontade de cantar naquele momento. É bem possível que tivesse dado uma palmada no traseiro da mula e dito: "Vamos, Cleópatra, temos trabalho a fazer".

Que espetáculo aquela pequena família deve ter sido enquanto seguia pela estrada deserta. A mulher, Zípora, estava montada na mula, as duas crianças brincavam logo à frente e parte dos pertences da família provavelmente estava amarrada no lombo do animal. Seguiam seu caminho, abandonando um emprego estável, família, segurança e a familiaridade de seu ambiente. Midia não era muita coisa, mas fora a casa deles por muitos anos. E agora estavam a caminho do Egito — a caminho do Êxodo. Quanta fé!

Você já progrediu assim na fé ultimamente? Deu um passo, de acordo com o empurrão de Deus, rumo a áreas que jamais sonharia há cinco anos? Ele vai honrar sua fé se confiar em sua Palavra nessa caminhada. Os que permanecem na falsa segurança de Midiã jamais chegam a experimentar o que Moisés experimentou naquela estrada

A VONTADE DE DEUS, À MANEIRA DE DEUS 165

sinuosa para o Egito — a sensação de mover-se na própria correnteza da vontade e do plano de Deus.

A VARA DE DEUS

Note outra vez como termina o versículo 20 do capítulo 4: "Moisés levava na mão a vara de Deus". Espere um pouco! Esse é o mesmo pedaço de madeira descrito no versículo 2: parte do seu equipamento de pastor. Mas o que aconteceu entre o versículo 2 e o 20?

Um milagre. Foi essa vara que Deus transformou em cobra. A seguir, depois de mandar Moisés pegar a cobra pela cauda, ele tornou a transformá-la em vara. Mas não era mais o equipamento de Moisés. Era agora o equipamento de Deus, porque Deus o tocara.

Deixe-me contar-lhe isto, meu amigo. Quando sua vida é marcada por Deus, seja lá o que você use, para o Senhor torna-se propriedade dele. Se estiver trabalhando no escritório de uma organização cristã ou em qualquer outra atividade, as mãos que tocaram o teclado a serviço de Deus tornam-se as mãos dele. Se vier a ser uma testemunha fiel na faculdade, no trabalho ou na vizinhança, sua voz se torna a voz dele. Se abrir sua casa de maneira especial, dedicando sua hospitalidade para glória dele, seu endereço se torna o endereço de Deus; sua casa se torna a casa de Deus. Fica marcada daí por diante, como aconteceu com a vara. Moisés tomou a vara que Deus havia tocado e seguiu para o Egito. F.B. Meyer descreve essa cena com estas palavras:

Imagine a cena naquele dia. Zípora sentada no jumento, talvez amamentando um bebê recém-nascido, enquanto o marido e pai andava ao seu lado. Na mão dele estava o bordão sagrado — apenas uma vara de pastor, mas agora o bordão de Deus — que seria usado para obras de poder transcendente, sempre lembrando Moisés do que as coisas fracas podiam fazer quando manuseadas pelas mãos fortes que estão atrás delas.2

Imagino que Moisés se agarrou àquela vara forte de madeira por ser uma lembrança tangível da presença de Deus. Ele precisava disso naquele momento. Ele tinha oitenta anos, lembre-se.

166 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Disse o Senhor a Moisés: Quando voltares ao Egito, vê que faças diante de Faraó todos os milagres que te hei posto na mão; mas eu lhe endurecerei o coração, para que não deixe ir o povo.

Êxodo 4:21

Nesse versículo, o Senhor deu uma ordem e, ao mesmo tempo, fez uma advertência a Moisés. Ele deveria realizar todos os milagres que Deus permitisse, mas era preciso lembrar também que o Faraó não ficaria impressionado. O rei endureceria o coração e resistiria à voz de Deus. Deus informou Moisés desse fato com antecedência.

Não posso imaginar ninguém que não coce a cabeça ao ler o versículo 21 e diga: "O que Deus está fazendo afinal? Ele escolhe um pastor de oitenta anos para guiar seu povo para fora do Egito e, ao mesmo tempo, endurece o coração do Faraó para que diga: 'Esqueça. Não vou deixá-los partir'. O que acontece?"

Transcrevi Romanos 11:33-34 na margem de minha Bíblia, ao lado de Êxodo 4:21. Veja o que essa referência de Romanos diz:

Ó profundidade da riqueza da sabedoria e do conhecimento de Deus! Quão insondáveis são os seus juízos e inescrutáveis os seus caminhos! Quem conheceu a mente do Senhor? Ou quem foi seu conselheiro? (NVI)

Aversão da New American Standard escreve: "Quão insondáveis são os seus caminhos!" (tradução livre).

Você talvez tenha descoberto isso em sua experiência. Tentou "descobrir o caminho dele", mas não conseguiu. Tentou sondar os caminhos "insondáveis", mas foi em vão. Não é possível computálos. Seu microprocessador explode. Você começou a andar com Deus como nunca fizera antes em sua vida, mas nesse caminho de obediência encontrou situações que simplesmente desafiam as explicações e outras que parecem contraditórias. É assim que Deus trabalha; aceite isso! Pode não fazer sentido para você durante anos, ou nunca fazer. Não faz mal. Cheguei à conclusão de que eu não compreende-

A VONTADE DE DEUS, À MANEIRA DE DEUS 167

i ia os processos de pensamento e os planos dele, mesmo que passasse muito tempo explicando-os para mim.

Achei maravilhoso quando finalmente entendi que não tenho de explicar a vontade de Deus. Essa obrigação não me cabe. Minha tarela é simplesmente obedecer-lhe. Quando estudava no Dallas Seminary, o presidente John Waívoord costumava dizer: "Gastamos muito tempo tentando compreender o inescrutável". Que desperdício! Você e eu não temos condições para isso. Não vale sequer o esforço.

Deus dizia a seu servo (que poderia estar compreensivelmente confuso): "Moisés, apenas vá até Faraó e transmita a mensagem. Ele não vai gostar. Não vai aceitá-la. Lembre-se apenas de que até o coração teimoso, endurecido dele, não está além da minha vontade".

No versículo seguinte, o Senhor deu a Moisés instruções específicas do que dizer quando chegasse àquela parede de tijolos.

"Dirás a Faraó: Assim diz o Senhor: Israel é meu filho, meu primogênito. Digo-te, pois: Deixa ir meu filho, para que me sirva; mas se recusares deixá-lo ir, eis que eu matarei teu filho, teu primogênito (Êx 4:22-23).

Em termos claros, essa foi uma mensagem tempestuosa, não foi? Você sai do deserto, vai a uma nova terra, marca uma audiência com o rei, olha nos olhos dele e diz: "Faraó, Deus mandou que deixe seu povo ir. Mas como irá recusar-se a fazer isso, seu filho vai morrer".

Que tarefa difícil! Contudo, foram exatamente essas as palavras do Senhor. Foi bom que Moisés tivesse lidado com o problema da obediência ao Senhor quando estava em Midiã. Moisés não discutiu; as Escrituras não relatam uma hesitação sequer. Quarenta anos no deserto haviam transformado o homem. Estava pronto para ser o porta-voz de Deus, sem levar em conta as conseqüências. De fato, a partir daquele momento, ele pareceu ter uma serena confiança em seus tratos com o belicoso Faraó. Por saber que estava no núcleo da vontade de Deus, ele sentiu a invencibilidade que mencionei antes.

168 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Um versículo no Livro de Isaías ajuda a explicar a calma de espírito de Moisés naquele momento. "O efeito da justiça será paz, e o fruto da justiça repouso e segurança, para sempre" (Is 32:17).

Você talvez não tenha notado essa referência antes. Ela merece sua cuidadosa atenção. Podemos chamar qualquer obra feita na vontade de Deus de "efeito da justiça". Ao fazer essa obra, você se sentirá cercado de paz. Bem no fundo do seu coração, ao efetuar essa obra e ao andar em obediência, você irá desfrutar de repouso e segurança.

Em outras palavras, uma segurança tranqüila o envolverá quando você estiver andando na vontade dele. Terá uma sensação íntima e invencível de segurança, aceita com calma e humildade. Todo crente em Jesus Cristo anseia experimentar tal segurança, e ela vem quando estamos no fluxo da correnteza de sua vontade. Tudo isso nos rodeia quando fazemos a vontade de Deus, do modo dele.

O PERIGO DA NEGLIGÊNCIA

Depois de decidir verdadeiramente confiar nele com todo o coração, de viver à disposição da sua vontade e não se apoiar em suas próprias muletas, deixar de entrar em pânico quando não consegue o que quer, Deus começará então a escavar mais fundo e lidar com as áreas que foram negligenciadas em sua vida. Os versículos seguintes ilustram esse fenômeno, j "Estando Moisés no caminho, numa estalagem, encontrou-o o Senhor, e o quis matar" (Êx 4:24).

Moisés ficou gravemente enfermo, a ponto de morrer. Que experiência dolorosa deve ter sido para a família. "Então Zípora tomou uma pedra aguda, cortou o prepúcio de seu filho, lançou-o aos pés de Moisés e lhe disse: Sem dúvida tu és para mim esposo sanguinário" (Êx 4:25).

"Assim, o Senhor o deixou. Ela disse: Esposo sanguinário, por causa da circuncisão" (v. 26).

A essa altura, Zípora voltou para a casa de Jetro em Midiã. Podemos supor isso por causa do registro em Êxodo 18:2, quando lemos que ela e os dois filhos viajaram para o Egito na companhia de Jetro.

A VONTADE DE DEUS, À MANEIRA DE DEUS 169

E bem provável que a circuncisão do menino tivesse causado tamanha dor, que não pôde mais viajar. Zípora precisou levá-lo para casa para passar algum tempo com o avô Jetro, enquanto o rapazinho se restabelecia.

O que tudo isso significa? Significa que Moisés se esquecera da parte da aliança que demonstrava obediência a Deus. Todo judeu piedoso devia circuncidar o filho; devia cuidar para que isso fosse feito adequadamente e sem exceções. Moisés certamente sabia disso muito bem. Os gentios eram conhecidos como os incircuncisos. Mas e os judeus? Essa era uma marca física da obediência deles a Deus, que planejou e determinou o procedimento. Nessa demonstração singular, o homem dizia a Deus: "Minha família, meu coração e meu lar são dedicados a ti e guardados para ti, Ó Deus de Israel".

Moisés negligenciara isso. Nunca ficamos sabendo o porquê. Fora simplesmente um esquecimento, mas Deus recusou-se a esquecer. Quando Moisés se pôs a caminho para fazer a vontade de Deus, o Senhor o deteve. Ele estava dizendo: "Pare, Moisés. Você vai tornarse meu instrumento diante dos gentios, e do seu rei, e das autoridades. Mas, antes disso, há uma área que fora negligenciada e que precisa remediar. É algo que não considero leviano e não quero que considere levianamente também".

Na verdade, foi Zípora que sentiu o erro e cuidou de corrigi-lo ela mesma. Moisés poderia estar com o coração ferido demais para realizar esse ato tão delicado.

O que acontecia a essa altura? Pense no assunto desse modo: você chega a determinado ponto em sua vida em que diz: "Senhor, quero estar no centro da sua vontade. Quero fazer minha parte sem reservas. Quero que cada área da minha vida seja dedicada ao Senhor, sem reservas. Estou cansado de andar e andar sem atingir lugar nenhum. Quero chegar a seu plano! Quero alcançar o lugar mais profundo. Estou farto dessa vida hipócrita, fria. Meu desejo é estar limpo e puro diante do Senhor. Quero que disponha de minha língua e me ajude a descobrir como usá-la, a fim de torná-la um instrumento devotado. Tome meus olhos e os mantenha fixos no que está à frente. Tome meus motivos e molde-os como achar melhor".

170 MOISÉS: UM HOMEM DEDICADO E GENEROSO

As pessoas superficiais da igreja nunca oram assim. Elas põem sua máscara piedosa no domingo e depois passam o resto da semana segundo lhes apraz. A pessoa piedosa diz: "Senhor, estou preocupado com certas áreas da minha vida que costumavam ser periféricas, mas que agora chamam minha atenção constantemente. Armários fechados. Pó debaixo do tapete. Segredos escondidos. Vamos limpar também essas áreas, Senhor".

Moisés queria ser um homem de Deus. No caminho — em meio à sua obediência — o Senhor o encontrou. Esse encontro foi mortalmente sério. O Senhor lhe disse: "Moisés, esta é uma área que não deve ser do conhecimento de ninguém, mas eu a conheço e você não cuidou dela".

Não quero ignorar o envolvimento de Zípora nesse incidente. Não foi agradável nem fácil para ela. E provável que a tenha abalado muito. Mas ela se envolveu, entrou numa situação e, no que podemos extrair das Escrituras, salvou a vida do marido.

É possível que Deus utilize a censura de um cônjuge para nos chamar atenção a áreas que sofreram grave negligência espiritual. Lembro-me de ter conversado com uma jovem sobre esse assunto há alguns anos. Ela era casada e freqüentava uma faculdade cristã. Enquanto estávamos sentados na sala de jantar falando sobre várias questões de discipulado, mencionei o papel do cônjuge em nosso crescimento em Cristo. Contei a^ela que alguns dos melhores conselhos que já recebi foram os de minha esposa, e Cynthia me disse que os melhores conselhos que recebe são os meus. Trabalhamos juntos há muitos anos e com toda a franqueza.

A jovem mulher sacudiu tristemente a cabeça. "É impressionante", disse. "Posso aceitar conselhos de quase todo mundo, menos de meu marido". Admitiu um sentimento defensivo. "Não consigo aceitar as críticas dele", contou.

Tentei esclarecer meus comentários nesse ponto, explicando que eles não eram apenas críticas; eram mais como uma conversa entre iguais. É fato que ninguém conhece melhor nossas falhas do que nossos cônjuges. Mas mesmo depois de esclarecer a situação, ela repetiu: "Não consigo abrir-me com meu marido".

A VONTADE DE DEUS, A MANEIRA DE DEUS 171

"Então esse é um aspecto que precisa de atenção", disse a ela. Tenho de dizer algo a favor de Moisés aqui. Ele aceitou de boa vontade a censura da esposa. Na Bíblia Viva, Zípora diz a ele: "Que marido sanguinário você ficou!" Não seria fácil aceitar isso de mulher nenhuma; Moisés, porém, não se indignou com Zípora. Ele saiu daquela estalagem abalado, mas um homem melhor depois desse incidente.

Se você for casado, alguns dos melhores conselhos que pode receber hoje talvez sejam os da pessoa que o conhece melhor do que ninguém. Você tem coragem de dizer algo deste tipo a sua mulher: "Querida, estou desejando muito pôr minha vida nas mãos do Senhor, sem reservas. Quero que me ajude a ver algumas das coisas que negligenciei e que podem impedir minha caminhada com Deus, coisas que eu talvez nem perceba. Dou-lhe carta branca para isso, para compartilhar o que quiser. Prometo estar acessível".

Penso que esse tipo de vulnerabilidade operaria maravilhas na vida conjugal. Mas permita-me ser muito franco: só vi tal coisa acontecer em raríssimas ocasiões. E notável como tão poucos cristãos se dispõem a ouvir o conselho de seus cônjuges. O orgulho e as inseguranças pessoais tragicamente nos furtam de uma perspectiva que poderia beneficiar nossa vida.

IRMÃOS ESPIRITUAIS

De repente Moisés fica sozinho. Zípora e os filhos montaram na jumento e voltaram para Midiã. A aventura empolgante com a família se transformou numa viagem solitária rumo ao desconhecido, mas quero que veja como o Senhor continuou a aplainar o caminho à frente do seu servo.

Disse também o Senhor a Arão: Vai ao deserto para te encontrares com Moisés. Ele foi e, encontrando-o no monte de Deus, o beijou. Relatou Moisés a Arão todas as palavras do Senhor, com as quais o enviara, e todos os sinais que lhe mandara.

Êxodo 4:27-28

172 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Sabe do que gosto no Senhor? Ele trabalha em dez trilhões de frentes num mesmo momento do dia ou da noite. Ele é o Deus soberano, o Senhor do tempo e da eternidade, e enquanto confio nele, as pessoas e as circunstâncias são movidas como peças num tabuleiro de xadrez, a fim de satisfazer as necessidades e fazer avançar o seu plano.

Deus sabia que Moisés se sentia só naquele momento. Sabia que seu homem precisava de uma companhia humana. E possível que antes de Moisés sentir pela primeira vez a solidão, Deus já estivesse providenciando algo para satisfazer sua necessidade. Arão, irmão de Moisés, era três anos mais velho que ele. O Senhor então o procurou e lhe disse: "Arão, vá ao encontro de Moisés agora. Ele está numa estrada do deserto, a caminho do Egito. Seu irmão passou por circunstâncias difíceis. Precisa de um irmão espiritual".

Então os dois se encontraram, se abraçaram e se beijaram. Mantiveram-se ali, durante algum tempo, sob o sol do deserto, num longo abraço.

É esplêndido ter um relacionamento assim com um irmão. Meu irmão, Orville, é também três anos mais velho que eu e, em nossa vida adulta, estou mais tempo longe do que perto dele. De vez em quando, porém, muito raramente, nossos caminhos se cruzam e nos damos um abraço fraternal longo e afetuoso. (Mas não posso lembrar-me de tê-lo beijado.) É ótimo^sentarmos juntos e conversarmos até de madrugada sobre o que o Senhor tem feito em nossa vida. Os anos parecem desaparecer e nosso coração bate em uníssono novamente, como quando éramos crianças.

Foi isso que Arão e Moisés fizeram naquela noite sob as estrelas e talvez ao lado de uma fogueira, à sombra do Sinai. Compartilharam a vida. Esta foi a primeira vez em que Moisés pôde contar a alguém a história da sarça ardente. Ele descreveu cada detalhe, enquanto Arão ouvia e assimilava cada palavra. "Relatou Moisés a Arão todas as palavras do Senhor, com as quais o enviara, e todos os sinais que lhe mandara" (v. 28).

Ele disse: "Arão, ouça isto. Você não vai acreditar. Lá estava eu com as ovelhas certo dia, um dia como milhares de outros. E, de

A VONTADE DE DEUS, À MANEIRA DE DEUS 173

repente, aquela sarça pegou fogo e continuou ardendo. Eu então parei e fiquei olhando. Quando cheguei mais perto, Arão, escute bem, homem, Deus falava do meio da sarça. E foi isso que ele me disse..."

Se Arão duvidou de uma única palavra do relato, as Escrituras não mencionam. Na verdade ele já estava preparado para crer em cada palavra que Moisés lhe dissesse. Deus não o chamara do Egito para encontrar seu irmão mais novo no deserto? Arão ouviu, meneou a cabeça e respondeu: "Puxa! Isso é maravilhoso. Moisés, estou com você, irmão".

Você tem um irmão espiritual ou encontra um espírito afim em sua irmã? Tem um amigo com quem compartilhar sua vida? As mulheres estão muito mais adiantadas do que os homens nessa questão de amizade. Durante anos e anos, gerações de homens foram criadas acreditando que o único curso masculino adequado era o caminho do individualismo inflexível. Que tristeza! E, pior ainda, quanta inverdade. (Um dos melhores resultados do movimento do Promise Keeper nos últimos anos tem sido a destruição desse mito bíblico.) Os homens precisam tanto de amigos íntimos quanto as mulheres.

Você pode ter uma porção de amizades em sua vida, mas provavelmente nunca terá mais do que dois amigos nesse nível mais profundo, espiritual. Pode contar a esse amigo tudo o que Deus está fazendo em sua vida e encontrará receptividade cordial e profunda apreciação. Se não tiver tal amizade, converse com Deus sobre seu desejo. Ele é o mesmo Deus que comoveu o coração de Arão no Egito enquanto Moisés caminhava sozinho pela estrada do deserto. Lembre-se de que a melhor maneira de descobrir um amigo desse tipo é ser um amigo assim.

ENCONTROS DE ALTO NÍVEL

Uma vez no Egito, Moisés e Arão não perderam tempo. Israel estava no cativeiro há quatrocentos anos; estava na hora de dar início a um êxodo.

174 MOISÉS: UM HOMEM DEDICADO E GENEROSO

"Então, se foram Moisés e Arão, e ajuntaram todos os anciãos dos filhos de Israel; Arão falou todas as palavras que o Senhor tinha dito a Moisés, e este fez os sinais à vista do povo" (Êx 4:29-30).

Lembre-se agora de que Deus havia concordado com a insistência de Moisés e permitira que Arão fosse seu porta-voz. As Escrituras não contam, mas não posso deixar de imaginar, se Moisés algum dia desejou não ter feito tal arranjo com o irmão. Agora que estava caminhando na vontade do Senhor, tenho a impressão de que as palavras lentamente começavam a queimar em seu íntimo. Mas teve de recuar e permitir que o irmão tomasse a liderança como porta-voz.

Que cena deve ter sido aquela! Os anciãos fizeram uma roda e ficaram ouvindo aquele estranho, Moisés, e seu irmão, Arão, a quem já conheciam. Quem operou os sinais? Suponho que o "ele" implícito no versículo 30 se refere a Moisés. Não consigo imaginá-lo entregando a vara de Deus a outra pessoa, você consegue? Também não consigo imaginar Arão empolgado com a idéia de pegar uma cobra enorme pela cauda. Os homens de Israel testemunharam os milagres — a cobra, a mão leprosa e a água transformada em sangue. Por mais cansados que estivessem do trabalho forçado, eles estavam bem alertas às margens da fé.

O que eles fizeram então? Como reagiram? O versículo 31 diz tudo: "E o povo creu; e, tendo ouvido que o Senhor havia visitado os filhos de Israel e lhe vira a aflição, inclinaram-se, e o adoraram".

Eles creram! Como isso deve ter aliviado o coração de Moisés. Os anciãos de Israel responderam como o Senhor do meio da sarça ardente lhe dissera que fariam. Parafraseando (outra vez) o provérbio: "Quando os caminhos do homem agradam ao Senhor, ele faz até a multidão dos hebreus ficar em paz com ele". Moisés fizera a sua parte; Deus agora fazia a dele. Que emoção!

A HORA DA DECISÃO

E bem possível que neste exato momento você esteja prestes a tomar uma das decisões mais importantes de toda a sua vida, como filho de

A VONTADE DE DEUS, À MANEIRA DE DEUS 175

Deus. Você já deve ter cantado o hino de Adelaide Pollard, Have Thine Own Way (.Faça-se a tua Vontade)-.

Faça-se a tua vontade, Senhor! Faça-se a tua vontade. Tu és o oleiro, eu sou o barro. Molda-me segundo a tua vontade, Enquanto aguardo, rendido e quieto.3

Quantas vezes você pronunciou essas palavras? Para muitos de nós, fazemos isso anos após ano. E possível que ultimamente talvez você tenha começado a encarar essas declarações com mais seriedade. Começou a dizer ao Senhor: "Deus, estou cansado de apoiar-me na muleta fraca do meu entendimento. Quero confiar no Senhor com todo o meu coração. Não apenas dizer algo diferente, quero ser algo diferente. Estou farto do velho status quo".

Lembro-me de uma manhã em que um homem bateu na porta do meu escritório — apenas uma leve batida — e antes que eu pudesse dizer "entre!" ele já havia entrado e desmoronado numa poltrona, começando imediatamente a tremer e soluçar.

"O que posso fazer para ajudá-lo?" perguntei. Em meio aos soluços, ele respondeu: "Cheguei a uma encruzilhada em minha vida. Saí de casa quando tinha dezoito anos. Meu pai me deu cinco dólares e disse: 'Vá filho, vá enfrentar o mundo e ande com as próprias pernas'. Saí daquela fazenda e financiei toda a minha educação — faculdade, pós-graduação e prosperidade aos olhos do mundo. Cheguei ao topo.

"Mas, pastor, esta semana fui acusado falsamente. Fui mal-interpretado, puseram em minha boca palavras que não pronunciei e não me compreenderam. Tive de apresentar-me ao tribunal e as acusações contra mim são falsas. De uma hora para outra me vejo completamente dependente. Desde os dezoito anos sempre fiz tudo sozinho. Mas agora, pela primeira vez em minha vida adulta, todas as muletas desapareceram".

Essas foram exatamente as palavras dele. As lágrimas continuaram correndo de seus olhos enquanto falava, os largos ombros sacudiam . "Estou confiante de que tenho razão,

176 MOISÉS: UM HOMF.M DEDICADO E GENEROSO pastor, mas se for condenado hoje, minha carreira vai mudar. Minha família será prejudicada. Minha vida será totalmente alterada."

Ele olhou para mim com os olhos vermelhos de chorar. "Mas vou lhe dizer uma coisa. Neste momento estou pronto a confiar totalmente em Deus. Nunca disse isso antes, mas estou dizendo agora."

Oramos antes que partisse. Ele saiu de meu escritório e foi até a capela para orar um pouco mais. Tive de sair para um compromisso. Não tenho idéia de quanto tempo ele ficou naquela capela mostrando o coração a Deus.

No domingo seguinte encontrei-me com ele. "Como foram as coisas?", perguntei. "Qual o resultado?"

O homem respondeu com um sorriso: "Eles não me condenaram. Mas, sabe, essa foi a melhor coisa no mundo que poderia ter acontecido comigo. Agora, pela primeira vez em minha vida, posso dizer que quero organizar minhas prioridades. Quero que o meu Senhor ocupe o primeiro lugar. Não os negócios, o sucesso, o dinheiro, nem mesmo minha família. Quero que ele seja o primeiro".

O que esse homem estava me dizendo era: "Quero fazer a vontade de Deus, do modo dele. Não do meu. Por mais que custe, não importa o que eu tenha de pôr de lado ou mudar, quero ser um homem de Deus".

Você também pensa assim? O Espírito Santo talvez tenha tocado numa área negligenciada de sua vida — uma área íntima e pessoal como a circuncisão foi para Moisés e Zípora. E ele está lhe dizendo: "Você não pode avançar mais*na minha vontade até que lide com isso. Não posso tolerar mais. Está na hora de pôr isso diante de mim, pedir o meu perdão, e irei então usar você. Mas não antes que faça isso".

Você está cansado de caminhar de modo vacilante, indiferente, com Cristo? Está disposto a expor sua vida diante da lanterna poderosa dele? Disposto a confiar nele sem reservas, não importa o que aconteça? Está finalmente decidido a fazer a vontade de Deus, à maneira dele?

Se for esta a sua decisão, devo adverti-lo. O caminho à sua frente será custoso — mais do que pode imaginar agora. Mas desprezar esse caminho será mais custoso ainda.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Confiar no Senhor de todo o coração e não se apoiar no próprio entendimento é a "parte do antes"; em que decisão atual você precisa entregar o volante a Deus antes de esperar que Ele endireite suas veredas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante de um obstáculo aparentemente intransponível, você consegue dizer como aquele homem "o problema está em suas mãos, Senhor" e recusar-se a se angustiar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Onde, na sua vida, você tem fabricado suas próprias muletas em vez de se apoiar firme na promessa de que Deus cuidará de cada obstáculo da estrada?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Indo de Mal a Pior$t$, 9,
$conteudo$V o e , já viveu um daqueles dias que começam mal e só tendem a piorar à medida que as horas passam? Ouvi recentemente uma história que me faz lembrar (como se eu precisasse lembrar!) de como um dia assim acontece. A história é mais ou menos essa: Depois de apenas alguns anos de um casamento cheio de conflitos e brigas, um jovem e sua esposa decidiram que a única maneira de salvar o casamento era procurar ajuda. As coisas tinham caminhado de mal a pior com o passar do tempo, transformando a união em uma maratona de infelicidade. Eles estavam brigando há tanto tempo que o aconselhamento parecia a única esperança.

O marido era incrivelmente insensível e melancólico, e ela era hiperativa e dominadora. Essa nunca é uma boa mistura.

Quando chegaram ao consultório, o conselheiro entrou imediatamente e iniciou a discussão: "Muito bem", disse ele, "qual é o problema?"

O marido encolheu-se imediatamente na cadeira, assumindo uma atitude derrotista. Ficou olhando para o tapete e finalmente encolheu os ombros. Não tinha nada a dizer. Em contraste, a mulher começou a falar ininterruptamente, descrevendo todos os problemas de seu casamento. Tudo tinha origem nele — seus fracassos, suas insensibilidades, sua falta de comunicação. E assim por diante.

178 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Depois de ouvir quinze minutos a mulher que náo parava de falar, o conselheiro se levantou sem dizer nada, foi até ela, e, enquanto ela estava ainda no meio de uma sentença, ele levantou-a pelos ombros, deu-lhe um grande abraço, beijou-a apaixonadamente, depois sentou-a de novo. Ela ficou olhando atônita para ele.

O conselheiro em seguida fitou o marido, que não conseguia dominar o espanto, e lhe disse: "Escute bem. Sua mulher precisa disso pelo menos duas vezes por semana — todas as semanas!"

O marido piscou e coçou a cabeça. "Bem", respondeu ele, "acho que posso trazê-la aqui nas terças e quintas".

Acredite ou não, já conheci sujeitos assim. Nesse caso, o episódio contribuiu para piorar um dia já difícil para um conselheiro atribulado.

Você pode sentir-se como Evander Holyfield depois de uma luta com Mike Tyson. Já é difícil ficar no ringue com um camarada que está tentando nocauteá-lo há quinze rounds. E pior ainda quando seu oponente o agarra e arranca pedaços de suas orelhas com os dentes. Naquela noite, enquanto fazia curativos e enfaixava as orelhas, Holyfield talvez estivesse pensando: "Por que será que saí da cama esta manhã?"

E possível que você tenha tido um mau dia assim recentemente. Se teve, saber que não é o único pode ajudá-lo um pouco. Na verdade, um homem tão poderoso e impressionante como Moisés experimentou um dia assim. Em nosso íntimo, tal como Michelangelo, temos uma imagem idealizada do homem. Temos a tendência de pensar nele como uma espécie de santo esculpido em pedra ou uma estátua de mármore gigantesca.

Nada disso. Ele era um ser humano, como você e eu, sujeito aos mesmos impulsos, altos e baixos, subidas e descidas, como acontece com todos nós, seres humanos. Ele rastejava da cama de manha e calçava as sandálias, uma de cada vez, exatamente como fazemos.

Lembro-me de ter recebido há algum tempo uma carta de uma senhora que ouvira as fitas de uma série de sermões que preguei sobre Moisés. Ela escreveu: "Estou começando a conhecer Moisés tão bem que ele não se parece mais com Charlton Heston".

INDO DE MAL A PIOR 179

Gosto disso. Por mais famoso que o diretor de cinema Cecil B. DeMille tenha sido não conseguiu transpor para a tela o verdadeiro Moisés. A meu ver, o Moisés real estava tão longe da versão cinematográfica que poderiam ser duas pessoas diferentes.

O verdadeiro Moisés era um homem viril, mas tinha suas fraquezas. Neste capítulo, vamos examinar um daqueles dias que ele provavelmente desejaria apagar da memória. O dia começou ruim e, rapidamente, tornou-se pior.

UM MAU DIA NO EGITO

Encontram-se reunidas nos capítulos 5 e 6 de Êxodo três personalidades importantes: Faraó, Moisés e o Senhor. A personalidade predominante é evidentemente o Senhor. A principal personalidade humana é Moisés. Mas o catalisador entre ambos é Faraó. Ele é a razão pela qual as coisas saíram dos eixos para o homem de Midiã.

Tudo começou quando o rei concedeu uma audiência a Moisés e Arão. Moisés e Arão compareceram e disseram a Faraó: "Assim diz o Senhor Deus de Israel: Deixa ir o meu povo, para que me celebre uma festa no deserto" (Êx 5:1).

A essa altura os dois irmãos estavam saindo de um momento espiritual elevado. Eles haviam feito uma tremenda "conferência bíblica" com o povo de Israel, que concordou com os planos deles. Os anciãos haviam declarado: "Acreditamos em você, Moisés. Vamos apoiá-lo. Louvado seja o Senhor por não nos ter esquecido. Vamos confiar nele para operar mediante a sua liderança e nos tirar do cativeiro".

É possível que aqueles anciãos hebreus tivessem pensado que se tratava de uma empreitada fácil e rápida. Eles imaginaram Moisés entrando na corte de Faraó, fazendo que ele e seus conselheiros desaparecessem mediante alguns sinais milagrosos e depois os portões seriam abertos e os israelitas se poriam alegremente a caminho.

As coisas, porém, não funcionaram assim. Moisés, caso tivesse parado para pensar a respeito, já sabia também que não seria fácil. Deus lhe dissera claramente que Faraó colocaria obstáculos.

180 MOISÉS; UM HOMEM DEDICADO E GENEROSO

Você sabe, no entanto, como são as coisas com pessoas como nós. Não queremos pensar nessa parte do plano. Só queremos nos fixar no glorioso livramento que Deus prometeu no final. Preferimos o doce então em vez do miserável aqui-e-agora.

Ainda envolvidos naquela maravilhosa experiência com os líderes israelitas, dominados por uma onda de emoção e euforia, Moisés e Arão comparecem diante do deus da terra, o próprio Faraó. A ordem deles era clara e direta. Não se tratava de um pedido, mas de uma simples declaração, na verdade um comando: "Faraó, deixe os hebreus saírem".

Você tem agora de apreciar, apesar de nem você nem eu podermos ter uma idéia completa a respeito, a presença poderosa e o impacto de uma personalidade como a de Faraó. Lembre-se de que ele era considerado um deus naquela terra. Era adorado. Estruturas e estátuas colossais com o seu nome se elevavam no céu azul do Egito. O que aquele homem dizia era lei e não havia apelação. A vida e a morte dependiam de seu estalar de dedos. Muito provavelmente, ele e seus cortesãos tinham poderes demoníacos. Não se brincava com esse homem.

Moisés e Arão, porém, haviam acabado de curvar-se diante do Rei todo-poderoso e tinham de transmitir sua mensagem. Quando deram essa primeira ordem vinda diretamente dos lábios do Senhor vivo, estou certo de que Moisés pensou que isso fosse praticamente tudo. Pensou consigo mesmo: Agora vai qcontecer.

Mas não aconteceu. Nada aconteceu. Pelo menos, nada positivo. Note a resposta arrogante de Faraó: "Respondeu Faraó: Quem é o Senhor para que lhe ouça eu a voz, e deixe ir a Israel? Não conheço o Senhor, nem tampouco deixarei ir a Israel" (Êx 5:2).

Aquele foi o começo de um mau dia, que piorou gradualmente. Isso me faz lembrar de um amigo que desceu de um ônibus em Portland, Oregon, sem perceber que a neve cobria as ruas da cidade. Ele começou a descer pela calçada em direção a seu trabalho, deu um passo e não sentiu mais as pernas. Sua pasta caiu das mãos e ele foi deslizando meio quarteirão, ladeira abaixo, em suas calças listradas; chegou ao fim dela praticamente junto com a pasta.

INDO DE MAL A PIOR 181

Moisés, sem ter nenhuma consciência disso, estava prestes a dar aquele primeiro passo sobre o gelo. Ele estivera esperando uma resposta positiva, mas o rei respondeu: "Está sonhando, pastor".

Já aconteceu de aproximar-se de alguém com uma idéia ou uma proposta, e de você estar tão empolgado com ela, suas expectativas estarem tão elevadas, que tem a certeza de que suas palavras irão prevalecer? Você planejou tudo, a hora oportuna, as sentenças que ensaiou o dia inteiro, crendo de todo o coração que a resposta só poderia ser positiva. E então... a resposta vem diretamente do freezer. Um breve e gélido chega-pra-lá: "Não. Não estou interessado. Outro dia talvez".

Que desanimador! E o mesmo que fazer suas emoções pularem de um avião, sem pára-quedas.

Moisés recebeu em cheio o desdém de Faraó, fez de conta que não fora nada e voltou ao ringue para o segundo round.

"Eles prosseguiram: O Deus dos hebreus nos encontrou; deixanos ir, pois, caminho de três dias ao deserto, para que ofereçamos sacrifícios ao Senhor nosso Deus, e não venha ele sobre nós com pestilência ou com espada" (v. 3).

Moisés voltou com outra proposta. Ele dizia, na verdade: "Olhe, Faraó, se não vai permitir nossa saída, pelo menos nos dê três dias para irmos adorar o nosso Deus. Estamos falando sobre um pequeno retiro espiritual. Se não quer libertar-nos, ao menos nos conceda uma licença por alguns dias".

Deus ordenara que Moisés dissesse exatamente isso. Foram estas as instruções anteriores do Senhor: "Irás, com os anciãos de Israel, ao rei do Egito, e lhe dirás: O Senhor, o Deus dos hebreus, nos encontrou. Agora, pois, deixa-nos ir caminho de três dias para o deserto, a fim de que sacrifiquemos ao Senhor nosso Deus" (Êx 3:18).

Moisés era um homem de Deus, com a mensagem de Deus, no tempo de Deus, suplicante perante Faraó. Faraó, no entanto, continuou negando.

Então lhes disse o rei do Egito: Por que, Moisés e Arão, por que interrompeis o povo no seu trabalho? Ide às vossas tarefas.

182 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Disse também Faraó: O povo da terra já é muito, e vós os distraís das suas tarefas. Naquele mesmo dia, pois, deu ordem Faraó aos superintendentes do povo e aos seus capatazes...

Êxodo 5:4-6

Os superintendentes egípcios supervisionavam o trabalho. Os capatazes eram renegados hebreus, escolhidos dentre as fileiras de escravos para servirem como líderes do povo. Faraó chamou os dois grupos perante ele e as notícias não eram boas.

Daqui em diante náo torneis a dar palha ao povo, para fazer tijolos, como antes; eles mesmos que vão e ajuntem para si a palha. E exigireis deles a mesma conta de tijolos, que antes faziam; nada diminuireis dela; estão ociosos, e por isso clamam: Vamos, e sacrifiquemos ao nosso Deus.

Êxodo 5:7-8

Faraó convenceu os superintendentes de escravos e os capatazes: "Toda essa conversa de sacrifício não passa de uma cortina de fumaça. Sou o único deus com quem esse povo deve tratar e tenho uma ordem especial para esses preguiçosos. Daqui por diante não haverá mais entrega de palha. Eles devem procurar palha por sua própria conta. Mas a cota será a mesma, não vamos reduzi-la de um tijolo sequer. Agora, movam-se! Vão trabalhar!"

Note uma pequena frase no versículo 7: "Daqui em diante..." Todos esses acontecimentos estavam ocorrendo nas mesmas vinte e quatro horas. E as esperanças de Moisés sobre um êxodo rápido começaram a desmoronar como um castelo de areia na maré alta.

Faraó também não terminara: "Agrave-se o serviço sobre esses homens, para que nele se apliquem, e não dêem ouvidos a palavras mentirosas" (v. 9).

Agravar? As Escrituras dizem que os hebreus já estavam suspirando, gemendo e chorando enquanto trabalhavam. Apesar da situação deles ser desesperadora, ela iria tornar-se ainda pior: "Então saíram os superintendentes do povo, e seus capatazes, e falaram ao povo: Assim diz Faraó: Não vos darei palha" (v. 10).

INDO DE MAL A PIOR 183

Eu não queria ser um desses capatazes. Você gostaria de dar essa mensagem? Você se aproxima de alguns homens, que estão até os tornozelos enterrados na lama e na argamassa, preparando tijolos. Eles levantam os olhos com expectativa, esperando boas notícias. E é isto que você tem a dizer:

Assim diz Faraó: Não vos darei palha. Ide vós mesmos, e ajuntai palha onde a puderdes achar; porque nada se diminuirá do vosso trabalho. Então o povo se espalhou por toda a terra do Egito a ajuntar restolho em lugar de palha. Os superintendentes os apertavam, dizendo: Acabai vossa obra, a tarefa do dia, como quando havia palha (w. 10-13).

Não era apenas uma tarefa mais difícil que passaram a enfrentar; era impossível. Ninguém podia realizá-las. Por causa disso, os capatazes foram espancados sem misericórdia.

E foram açoitados os capatazes dos filhos de Israel, que os superintendentes de Faraó tinham posto sobre eles; e estes lhes diziam: Por que não acabastes nem ontem, nem hoje, a vossa tarefa, fazendo tijolos como antes? Então foram os capatazes dos filhos de Israel e clamaram a Faraó... (w. 14-15)

Os capatazes queriam fazer um acordo trabalhista com a administração. O problema era que a administração não se incomodava nem um pouco com o que a comunidade tinha a dizer. Se alguns milhares de hebreus morressem sob essas novas e cruéis condições, paciência. Do ponto de vista egípcio, já havia judeus demais.

Nem mesmo os capatazes podiam acreditar nessa mudança odiosa de situação. Eles suplicaram perante Faraó: "Então foram os capatazes dos filhos de Israel e clamaram a Faraó, dizendo: Por que tratas assim a teus servos? Palha não se dá a teus servos, e nos dizem: Fazei tijolos. Eis que teus servos são açoitados; porém o teu próprio povo é que tem a culpa" (w. 15-16).

Atônitos e confusos, aqueles homens não tinham idéia da razão de terem sido privados de palha. Eies não haviam ainda con-

184 MOISÉS: UM HOMEM DEDICADO E GENEROSO

seguido compreender, até que Faraó jogou a resposta na cara espantada deles: "Mas ele respondeu: Estais ociosos, estais ociosos, por isso dizeis: Vamos, sacrifiquemos ao Senhor. Ide, pois, agora, e trabalhai; palha, porém, não se vos dará; contudo, dareis a mesma quantidade de tijolos" (vv. 17-18).

O rei não estava disposto a fazer concessões. Ele deu sua resposta àqueles homens com os lábios insolentes, a voz repleta de hostilidade. Naquele momento sombrio, creio que a compreensão chegou aos capatazes. Foi Moisés! Foi Arão! É por causa de alguma coisa que aconteceu quando falaram a Faraó; e nós é que recebemos agora o castigo!

Aqueles homens estavam doentes de medo e fervendo de raiva.

Então os capatazes dos filhos de Israel se viram em aperto, porquanto se lhes dizia: Nada diminuireis dos vossos tijolos, da vossa tarefa diária. Quando saíram da presença de Faraó encontraram Moisés e Arão, que estavam à espera deles; e lhes disseram: Olhe o Senhor para vós outros e vos julgue, porquanto nos fizestes odiosos aos olhos de Faraó, e diante dos seus servos, dando-lhes a espada na mão para nos matar (w. 19-21).

Um dia mau que ficou pior! Moisés não podia acreditar. A decepção transformou-se em desilusão. Onde errara? Ele confiara em Deus, ficara diante de Faraó e repetira — quase palavra por palavra — o que Deus lhe ordenara dizer. Dissera as palavras certas, na hora certa, da maneira certa. E agora tudo parecia sair do eixo. O povo que ele desejara ajudar (por mais de quarenta anos) o amaldiçoava por aumentar suas dificuldades e angústia.

"Por que veio, Moisés? As coisas já iam mal antes de você aparecer. Agora nossa vida está em perigo."

INCOMPREENSÃO

A incompreensão é algo que fere profundamente. Você talvez já tenha passado por isso. Fez as coisas certas, da maneira certa, mas al-

INDO DE MAL A PIOR 185

guém o entendeu mal, interpretando seus atos ou suas palavras equivocadamente. Tem de viver agora nessa confusão, incapaz de mudar a opinião daqueles que se voltaram contra você.

Não há um líder no mundo que consiga manter essa posição por muito tempo sem ser compelido à solidão. Um escritor chama isso de "as horas solitárias da angústia". Você não foi bem compreendido por um chefe, por um velho amigo, por um parente próximo, por um vizinho, talvez até pelo seu cônuge (ou ex-cônjuge).

Em seu livro Liderança Espiritual, J. Oswald Sanders escreve: "O líder deve ser alguém que, embora aceite a amizade e o apoio de todos que possam oferecê-los, tenha recursos suficientes para posicionar-se sozinho, mesmo em face da mais feroz perseguição, no desempenho de suas responsabilidades. Ele ou ela deve estar preparado para não ter 'ninguém senão Deus'."1

Nesse momento triste, naquele dia doloroso no Egito, isso era tudo que Moisés tinha. As Escrituras dizem: "Então Moisés, tornando-se ao Senhor" (v. 22). Ao ver-se repentinamente atacado, o velho pastor transformado em líder não tinha outro lugar para ir. Não possuía amigos pessoais no Egito que pudessem satisfazer suas necessidades. A mulher estava em Midiã com os filhos, Jetro cuidava das ovelhas no pasto. O irmão Arão aparentemente não sabia o que fazer. Moisés voltou então para Aquele que o encarregara da missão. Voltou-se para o Senhor e abriu fervorosamente o coração.

"Então Moisés, tornando-se ao Senhor, disse: Ó Senhor, por que afligiste este povo? por que me enviaste?" (v. 22)

Parece familiar, não parece? As dúvidas constantes de Moisés sobre sua capacidade para a tarefa eram como aquele reflexo automático do joelho. As Escrituras não dizem, mas posso imaginar lágrimas sendo derramadas nesse momento estressante. "Eu disse na sarça ardente que não sou o homem adequado para este trabalho, e o Senhor ficou repetindo: 'Moisés, você é o homem'. Eu disse várias vezes: 'Não sou! Não fui feito para esse tipo de coisa, vou fracassar'. Mas o Senhor continuou dizendo: 'Você é. É a minha escolha'. E cedi com relutância. Fiz toda a caminhada desde Midiã, deixei minha casa e

186 MOISÉS: UM HOMEM DEDICADO E GENEROSO

meu emprego. E aqui estou, Senhor, em conflito com Faraó e odiado pelo povo que eu queria ajudar. Está vendo? Eu disse ao Senhor que não era a pessoa adequada para o trabalho! Obedeci exatamente às suas palavras — e até as usei —, e Faraó me enxotou! Esse pobre povo está em pior situação do que antes e poderá morrer porque deixei as autoridades terrivelmente iradas".

DUAS PERGUNTAS COMUNS

Moisés apresentou-se ao Senhor, fazendo duas perguntas que muitos de nós fazemos quando somos intoleravelmente pressionados: Porquê? e Como?

Começamos dizendo: "Por quê? Por que eu? Por que agora? Por que isso?" E depois perguntamos: "Como? Como vou poder passar por isso ou sair disso?"

Ao ler estas palavras, você irá provavelmente balançar a cabeça. Está pensando: "Chuck, acho que andou me espionando. Essas são exatamente as palavras que tenho usado. Tenho dito ao Senhor por que e como há dias".

Por ser alguém que também pronunciou essas palavras várias vezes durante esta jornada, sinto-me bastante encorajaddo com a resposta do Senhor a Moisés. Ele não disse: "Cale-se, Moisés. Você devia envergonhar-se de si mesmo".

Gosto dessa atitude do Senhor. Efe nunca o esbofeteia ou o envergonha quando se aproxima dele. Nunca o manda ir embora quando faz uma pergunta dolorosa, sincera, que clama por uma resposta. Então disse o Senhor a Moisés: "Agora verás o que hei de fazer a Faraó..." (Êx 6:1)

Isso não é ótimo? Em vez de criticar Moisés por ter perguntado "por quê?" o Senhor disse: "Espere um pouco, filho. Faraó está interpretando demais as notícias. Ele pensa que é um deus, mas só existe um único Deus, e ele vai descobrir logo isso. Talvez por um breve período você pense que é ele que está no controle. Mas não se engane, Moisés. Eu sou o Senhor".

INDO DE MAL A PIOR 187

"Pois por mão poderosa os deixará ir e, por mão poderosa os lançará fora da sua terra. Falou mais Deus a Moisés e lhe disse: Eu sou o Senhor" (Êx 6:1-2).

O Senhor estava dizendo a Moisés: "Mal comecei, meu filho. Nem sequer me aqueci. Você ainda não viu o primeiro movimento da minha poderosa mão. Chegará um dia em que Faraó empurrará Israel porta afora. Acredite, Moisés, eu sou o Senhor. Sou aquele que chamou você em meio à sarça ardente. Fique firme comigo".

Moisés levou aos israelitas essa palavra de encorajamento. Mas dessa vez tudo foi em vão. As Escrituras dizem: "Desse modo falou Moisés aos filhos de Israel, mas eles não atenderam a Moisés, por causa da ânsia de espírito e da dura escravidão" (v. 9).

ENFORQUEM O PREGADOR

Apesar da afirmação do Senhor, as coisas foram de mal a pior para Moisés. Ele já sofrera no encontro com Faraó e agora, numa conversa subseqüente com os israelitas, viu que perdera a credibilidade. Eles não mais queriam ouvi-lo.

Qual a razão disso? O versículo 9 oferece duas razões. A primeira é que se recusaram a ouvir as palavras do Senhor "por causa da ânsia de espírito". Eles estavam irritados, impacientes, cheios de ressentimento. Quando você está com raiva do pregador, não aceita a mensagem. Não queriam escutar o homem que provocara a suspensão do suprimento de palha. Moisés levantou-se para repetir as palavras fortes de segurança do Senhor, e eles o mandaram embora. "Suma, pregador. Não queremos ouvir. Não estamos interessados no que tem a dizer".

O versículo também declara que eles não ouviram por causa da "dura escravidão". Consideravam Moisés responsável por isso. As coisas eram apenas toleráveis antes do chamado "libertador" sair do deserto. Agora, desde que Moisés e Arão haviam aborrecido Faraó, as circunstâncias se tornaram insuportáveis.

O que você faz quando um dia mau fica ainda pior? Não se pode agir melhor do que Moisés. Ele retornou ao Senhor. Moisés poderia

188 MOISÉS: UM HOMEM DEDICADO E GENEROSO

estar desanimado, com o coração magoado, sentindo-se frustrado e sozinho, mas retornou ainda assim. E o Senhor o atendeu a cada solicitação.

"Moisés, porém, respondeu ao Senhor, dizendo: Eis que os filhos de Israel não me têm ouvido; como, pois, me ouvirá Faraó? E não sei falar bem" (v. 12).

A N I V diz: "Falo com lábios hesitantes" (tradução livre). Moisés continuava obcecado por esse assunto. Ele disse: "Fico calado, Senhor. Parece que estou indo bem num minuto e logo em seguida gaguejo como um garotinho que a professora põe na frente da classe. Não tenho o dom". O desânimo de Moisés aumentava a cada minuto.

Durante meu pastorado na Califórnia, lembro-me de uma carta de um jovem que crescera na igreja, mas estava agora afastado, na faculdade. Ele também se sentia desanimado, e me disse: "Pastor, não sei o que fazer. Sinto-me como um ioiô, subindo e descendo". Ele queria que eu soubesse dos seus sentimentos, mas não queria um sermão. "Até parece que sei o que vai responder", disse ele.

"Um ou dois versículos não vão bastar, não é o que eu preciso." E interessante como a maioria das pessoas pensa que a única coisa que os pastores sabem fazer é falar em versículos bíblicos. Esse jovem universitário ia, porém, surpreender-se. Eu lhe dei uma simples mensagem que nada tinha a ver com um versículo das Escrituras, ou com um sermão, ou com uma poesia. Nada de clichês. Nada de tarefas religiosas. Minhas primeiras palavras para ele foram: "Bemvindo ao clube! Muitos de nós conhecem a vida de ioiô, inclusive eu. Você ficaria surpreso ao saber como muitos de nós enfrentam dias difíceis". Em seguida sugeri algumas coisas que me haviam ajudado a lidar com situações similares junto com o que, esperava, fossem palavras de encorajamento.

"OBSERVE O MEU TRABALHO"

Moisés sentiu-se insignificante. Deprimido. Ainda não se livrara da idéia de que ele seria o libertador e que ele estava falhando de algum

INDO DE MAL A PIOR 189

modo. Quantas vezes Deus explicara o plano para ele? Contudo, como muitos de nós, Moisés teve dificuldade em firmar-se nas garantias dadas pelo Senhor.

O que faria agora? A mensagem foi uma repetição da anterior: "Vai ter com Faraó, rei do Egito, e fala-lhe que deixe sair de sua terra os filhos de Israel" (v. 11).

"Ir a Faraó, Senhor? Meu povo acabou de comprar para mim uma passagem só de ida para Midiã e o Senhor quer que fale de novo com Faraó? Lembra-se de mim? Sou o sujeito que não sabe fa... lar. Minhas forças estão no fim. Como o Senhor vai conseguir resolver isso?"

Moisés não sabia naquele momento, mas ele pusera diante do Senhor a melhor proposição já feita. Minhas forças estão no fim. Como o Senhor vai resolver isso?

Antes de nos adiantarmos, eu gostaria de destacar uma grande verdade desse nosso mundo que não pretendo compreender. E esta: A melhor estrutura para o Senhor Deus fazer sua obra mais ideal é aquela organizada quando as coisas são absolutamente impossíveis e nos sentimos totalmente desqualificados para lidar com elas. Essa é sua circunstância favorita. Essas são suas condições especiais de trabalho.

Como disse, eu não saberia explicar esse fenômeno. Afirmo simplesmente, pelas Escrituras e pela experiência de um número incontável de seus santos — que isso é verdade. Deus faz sua obra mais magnífica quando a situação parece totalmente impossível do ponto de vista humano, e nos sentimos absolutamente despreparados e incapazes de fazer qualquer coisa a respeito, mas ainda assim nossos olhos estão fixos nele. Não posso contar as vezes em que estive nessa situação. É quando Deus arregaça as largas mangas e diz: "Swindoll, saia do caminho e observe o meu trabalho".

Ele nos leva seguidamente ao nosso fim absoluto e então prova sua fidelidade. Essa, meu amigo, não é apenas a história da minha vida, é a história da Bíblia em poucas palavras.

Moisés iria eventualmente aprender essa lição. Não muitos dias depois daquele dia desanimador no Egito, ele estaria encurralado

190 MOISÉS: UM HOMEM DEDICADO E GENEROSO

próximo ao mar Vermelho, com os carros dos egípcios trovejando em sua direção, a distância, e diria: "Não temais: aquietai-vos e vede o livramento do Senhor que hoje vos fará; porque os egípcios, que hoje vedes, nunca mais os tornareis a ver" (Êx 14:13).

ATALHO PARA A INUTILIDADE

Tanto você quanto eu perdemos, inúmeras vezes, a oportunidade de observar o Senhor trabalhar de maneira poderosa e milagrosa. Por quê? Porque em vez de nos "aquietarmos" e observá-lo realizar nosso livramento, buscamos a alternativa carnal. Procuramos outro caminho, o atalho carnal, e nos esquecemos do principal.

O inimigo da nossa alma vem até nós no momento de nossa maior dor e diz: "Sua mulher fez isso para você? Não há razão para aceitar mais esse aborrecimento. Deixe-a".

"Seu marido quebrou outra vez a promessa? Você não precisa aceitar isso! Arrume as malas! Esse casamento não vale a pena."

"Seu chefe lhe deu muito trabalho e prazo curtor1 Amigo, você precisa de uma pequena dose de coragem líquida esta noite. Onde está a garrafa, afinal de contas? Ou, que tal, ver aquelas fotos quentes no website de que os rapazes lhe falaram? Vamos, garoto, relaxe um pouco. Você merece umas férias."

"Os meninos da escola continuam tratando você como lixo? Por não agir como lixo? Talvez ingerir umas drogas não fosse tão mau assim, não acha?"

Nesse momento de fraqueza, ouvimos a voz do tentador e nós mesmos passamos a administrar as coisas, em vez de prosseguir com o plano de Deus, esperando que ele opere. Mas depois de tomarmos esse atalho, essa rota de fuga temporária, há o inferno a ser pago (de verdade!). E a vida declina então, indo de mal a pior.

"POR QUE SOU EU O ALVO, SENHOR?

Moisés não tinha razão para perguntar "por quê"? Vamos observar por um momento uma passagem em Jó, capítulo 16. Leia

INDO DE MAL A PIOR 191

estas notas escritas a mão extraídas do diário de um homem quebrantado:

Em paz eu vivia, porém ele me quebrantou; pegou-me pelo pescoço, e me despedaçou. Pôs-me por seu alvo: cercam-me as suas flechas, atravessa-me os rins, e não me poupa; e o meu fel derrama na terra (w. 12-13).

É uma boa descrição, não é? Mas Jó ainda não terminou...

Fere-me com ferimento sobre ferimento, arremete contra mim como um guerreiro. Cosi sobre a minha pele o cilício, e revolvi o meu orgulho no pó (w. 14-15).

A palavra "cilício" sugere a idéia de completa miséria. Jó dizia: "Não só estou usando isso, como também se tornou parte de mim, como uma segunda pele. Essa é a condição em que me encontro". A NVI traduz: "Enterrei minha face no pó" (tradução livre). Você não pode se enterrar mais sem uma enxada. "O meu rosto está todo afogueado de chorar, e sobre as minhas pálpebras está a sombra da morte" (v. 16).

Note agora este comentário: "Embora não haja violência nas minhas mãos, e seja pura a minha oração" (v. 17).

Ouviu o que esse homem está dizendo? "Sou inocente. Não fiz nada para merecer isto, mas sou o alvo." Essa é uma ótima descrição de como Moisés se sentia naquele dia sombrio que descrevemos neste capítulo. Ele começou mal e só piorou. Em primeiro lugar, Faraó o rejeitou, depois foi a vez do povo rejeitá-lo e em seguida Deus lhe disse para voltar\

Note como Deus lidou com Moisés. (Ele também lidou eficazmente com Jó, mas essa é outra história.) Sem censurá-lo, o Senhor deu dois conselhos a Moisés. Um tinha a ver com a sua pessoa; o outro, com a sua obra. Ele disse a Moisés quem era e depois contou o que iria fazer. A ordem nessa expressão é tão importante quanto os próprios fatos.

Logo no começo ele repetiu a mensagem da sarça ardente, dizendo "Eu Sou" em cinco momentos diferentes em Êxodo, capítulo 6.

192 MOISÉS: UM HOMEM DEDICADO E GENEROSO

• "Eu sou o Senhor..." (v. 2) • "Eu sou o Senhor..." (v. 6) • "Eu sou o Senhor..." (v. 7) • "Eu sou o Senhor..." (v. 8) • "Eu sou o Senhor..." (v. 29)

Vezes seguidas ele ressaltou sua mensagem a Moisés, dizendo: "Veja, Moisés, seus olhos estão (de novo) fixos no lugar errado. Ponha os olhos sobre mim (de novo). Lembre-se (de novo) de quem eu sou".

Quem é o Senhor? Pergunte ao profeta Isaías. Perturbado e aborrecido por causa da condição moral de sua nação, Isaías olhou para o céu certo dia e viu "o Senhor assentado sobre um alto e sublime trono, e as abas de suas vestes enchiam o templo" (Is 6:1). Isso era tudo o que ele precisava ver. Fixou os olhos no Senhor e, repentinamente, toda a sua perspectiva mudou.

Se você é cristão há algum tempo, terá ouvido muitas vezes essas palavras. E aqui estão elas de novo. (Vou oferecê-las gratuitamente e não acrescentarei nada ao preço deste livro.) Se os seus olhos não estiverem fixos no Senhor, você não suportará aqueles dias que vão de mal a pior.

Portanto, santos irmãos, participantes da chamada celestial, fixem os seus pensamentos em Jesus; apóstolo e sumo sacerdote que confessamos...

Hebreus 3:1 (NVI)

Tendo os olhos fitos em Jesus, autor e consumador da nossa fé...

Hebreus 12:2 (NVI)

Não existe terapia melhor. Não existe substituto para isso. Não há nenhum ditado engenhoso ou lema que estabeleça isso mais claramente. Fixe os olhos no Senhor! Faça isso uma vez. Faça diariamente. Faça milhares de vezes, dez milhares de vezes. Faça constantemente. Quando sua agenda aperta, quando suas perspecti-

INDO DE MAL A PIOR 193

vas diminuem, quando sua esperança se reduz, quando as pessoas o decepcionam, quando os sonhos morrem, quando as portas se fecham, quando o prognóstico parece sombrio, quando seu coração se parte, olhe para o Senhor e permaneça olhando.

Quem é ele? É o eterno EU SOU, o Senhor soberano do universo. Ele não pode cometer injustiça, é contra sua natureza. Ele jamais perdeu o controle. É sempre fiel. Imutável. Todo-Poderoso. Onisciente. Bom. Compassivo. Bondoso. Sábio. Amoroso. Soberano. Confiável.

Nas palavras de Pedro: "Senhor, para quem iremos? Tu tens as palavras da vida eterna" (Jo 6:68). Ele tem razão. Não há realmente para onde ir e ninguém mais para quem se voltar.

Lembro-me de ter sentado com Cynthia na cozinha, conversando com um casal que estava completamente falido. Ambos choravam e abriam o coração para nós naquela noite. Os dois estavam sem forças e sem respostas.

A mulher olhou do outro lado da mesa e disse: "O que vocês dizem às pessoas que os procuram e não têm para onde se voltar?"

"Não é uma resposta fácil", eu disse lentamente. "Mas vou dizer-lhe uma coisa que tento fazer. Tento lembrá-las de quem está no controle da vida delas. Tento lembrá-las de que Deus é aquele que dá as ordens. Ele está no controle. Não importa como a situação surja, ela nunca está fora do controle. Ele é o Senhor."

Isso a ajudou, porque soube que não era ela que tinha de juntar as peças de um quebra-cabeça complexo em que as peças pareciam não fazer sentido. Ela precisava deixar de olhar durante algum tempo para essa confusão impossível e erguer os olhos para o Senhor. Ele sabe como tudo se ajusta, mesmo naqueles momentos em que não podemos imaginar como o quebra-cabeça poderia ser montado.

Depois de o Senhor ter dito a Moisés "Eu sou" cinco vezes, ele lhe disse "Eu hei" oito vezes!

• "Verás o que hei de fazer..." (v. 1) • "(Eu) vos trarei..." (v. 6)

194 MOISÉS: UM HOMEM DEDICADO E GENEROSO

• "(Eu) vos livrarei..." (v. 6) • "(Eu) vos resgatarei..." (v. 6) • "(Eu) tomar-vos-ei..." (v. 7) • "(Eu) serei..." (v. 7) • "(Eu) vos levarei..." (v. 8) • "(Eu) vo-la darei..." (v. 8)

Sabe o que essa repetição me ensina? Ouço o Senhor dizendo: "Por ser quem sou, farei o que é melhor para você e para mim". Acredito que essa é a grande mensagem do tema divino, que serve tanto para Moisés como para você e também para mim.

O dia em que eu começar a crer realmente nesse fato, será também o dia em que a minha experiência irá de mal a pior, para melhor. Meu ioiô pára de "dormir" e volta a despertar. Digo a mim mesmo: " Chuck! (Tenho às vezes de dizer meu nome em voz alta para chamar minha atenção.) Chuck, limpe os ouvidos e ouça isso. Deus sabe o que faz. Não é um erro. Nesse momento ele quer permitir isso, seja lá o que for. E por ser quem é, ele faz o que é melhor para você".

É provável que você deva ter uma conversa desse tipo consigo mesmo. Aconselho a viver com esse tema básico e ele irá ajudá-lo a tornar-se melhor quando tudo o mais piora.

Logo depois de Deus ter contado a Moisés o que ia fazer, ele disse: "Você deve crer nisso. Ordeno que obedeça".

"Não obstante falou o Senhor a Moisés e a Arão, e lhes deu mandamento para os filhos de Israel, e para Faraó, rei do Egito, a fim de que tirassem os filhos de Israel da terra do Egito" (Êx 6:13).

Deus estava dizendo: "E isso que vai acontecer. Os israelitas vão sair do Egito. Não se trata de imaginação ou de um sentimento agradável. Pretendo realizá-lo. Apronte-se para executar o plano".

Freqüentemente, a flecha que penetra o crente em seu ponto mais fraco é a nossa incredulidade. Sabemos perfeitamente o que Deus disse, mas é preciso fé para nos pôr em marcha, para sair e começar a praticar o que ele mandou. Nesse instante de hesitação ganha-se ou perde-se a batalha.

É assim que devemos orar, mesmo quando sentimos que nunca desejaremos orar outra vez: "Senhor, não tenho vontade de orar nes-

INDO DE MAL A PIOR 195

te momento, mas, por favor, ouça de qualquer modo a minha oração. Vou ter fé, mesmo que a maré esteja subindo e já quase esteja perdendo o pé. Vou ter fé, mesmo que pareça que o Senhor esteja levando tempo demais para cumprir a sua promessa. Vou crer, mesmo que tenha chegado ao fim das minhas forças, tenha perdido a esperança e meus planos estejam em pedaços. Não vou procurar um atalho. Não farei uma opção carnal. Não recuarei na batalha. Vou crer no Senhor!"

TRÊS PRINCÍPIOS CONCLUSIVOS

Três princípios oportunos e eternos nos vêm à mente ao terminar este capítulo. Eles foram arranjados como três pedras de dominó, postas de pé, cada uma apoiada na seguinte.

As circunstâncias que se voltam contra nós forçam a dependência. Quando você se encontra subitamente numa situação que muda seu rumo e começa a seguir numa direção contrária à sua vontade, você se sente humilhado e isso o força a uma situação de dependência do Senhor. É justamente aí que Deus quer que esteja. A sábia abordagem de Deus é manter-nos dentro do círculo de sua proteção e provisão.

As circunstâncias que forçam a dependência nos ensinam a ser pacientes. Como essa palavra é temida, e como necessitamos dela! Quando o primeiro princípio realiza sua tarefa, nos tornamos dependentes. Então, nessa posição de dependência, devemos esperar e aprender a ter paciência.

As circunstâncias que nos ensinam a ser pacientes nos tornam sábios. A sabedoria se converte no troféu de nossas circunstâncias adversas. A sabedoria que colhemos de nossas experiências e de nossos testes das promessas do Senhor fica conosco e nos abençoa pelo resto da vida.

Sempre me lembro da notável peregrinação do poeta inglês William Cowper quando penso num homem que chega ao final de sua resistência. Cowper passou por uma tamanha crise de desânimo e desespero que tentou acabar com tudo, ingerindo veneno. Mas

196 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Deus, em toda a sua bondade, conduziu alguém para encontrá-lo. Precisou de uma lavagem estomacal, mas sua vida foi poupada.

Tão logo restabeleceu-se, o desesperado escritor alugou uma carruagem para levá-lo até o rio Tâmisa, onde pretendia atirar-se nas águas turvas e revoltas. O cocheiro, porém, não quis tomar parte nesse plano. Impediu Cowper de cometer o ato, levou-o de volta à carruagem e seguiu com ele para casa.

Frustrado nessa tentativa, Cowper pegou uma faca na privacidade de sua residência e tentou cair sobre ela. Acredite se quiser, mas a lâmina quebrou.

Ainda não dissuadido, ele prendeu uma corda no teto do porão, pôs o pescoço nela e pulou no ar. Mas alguém o encontrou antes que se estrangulasse e tirou-o dali. Não conseguiu nem sequer se matar! Finalmente, em meio ao mais profundo sofrimento, ele abriu o Livro de Romanos. Nas páginas desse livro descobriu uma mensagem que o fez ajoelhar-se e ter fé em Jesus Cristo.

Anos mais tarde Cowper, um homem amadurecido de Deus, escreveu este hino então familiar:

Deus se move de modos misteriosos; A fim de realizar seus prodígios; Ele firma os pés no mar, E na tempestade sai a cavalgar. Nas profundezas de insondáveis minas Formula seus maravilhosos desígnios, E assim vai operando Em seu maravilhoso domínio.2

Tiago acrescenta seu "amém" a esses pensamentos com palavras que retomei infinitas vezes.

Meus irmãos, tende por motivo de toda a alegria o passardes por várias provações, sabendo que a provação da vossa fé, uma vez confirmada, produz perseverança. Ora, a perseverança deve ter ação completa, para que sejais perfeitos e íntegros, em nada

INDO DF, MAL A PIOR 197

deficientes. Se, porém, algum de vós necessita de sabedoria, peça-a a Deus, que a todos dá liberalmente, e nada lhes impropera; e ser-lhe-á concedida.

Tiago 1:2-5

A promessa de Deus a Moisés é a mesma para nós: "Por ser quem sou, farei o que é melhor para você". Não há um dia deste lado da eternidade, por pior que seja, que não possa ser melhorado quando nos apegamos a esse pensamento que nos dá segurança.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Quando você obedece a Deus e as coisas parecem piorar em vez de melhorar, como reagiu a última vez em que isso aconteceu na sua caminhada?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Moisés era um homem real, com fraquezas, e não a estátua de mármore que imaginamos; que alívio há em saber que Deus usa pessoas comuns como você nos seus piores dias?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante de um dia que começa ruim e só piora, para onde você corre primeiro: para a queixa e o desânimo, ou para o Senhor que está no controle?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Pragas que Pregam$t$, 10,
$conteudo$A Bíblia contém quatro grandes eras de milagres. Três já ocorreram. Uma está por vir. Durante esses períodos, o Deus eterno entrou na correnteza do tempo e do espaço com manifestações majestosas de poder. A primeira era dos milagres veio nos dias de Moisés. A segunda, na época de Elias. A terceira, quando Jesus esteve em nosso planeta como o Deus-Homem. Resta uma era, programada para o futuro. Durante esses dias, Deus visitará esta velha terra com uma série de juízos devastadores, lançando sua justa ira sobre um mundo que rejeitou seu Filho, sua Palavra e seus caminhos.

Parece-me interessante que a primeira e a quarta eras de múltiplos milagres, a que já passou e a que está ainda por vir, imponham castigos pesados sobre a terra. Depois de cada uma dessas tempestades de ira, uma nova era surge — um novo e belíssimo estilo de vida, antes desconhecido por aqueles que viveram nesses períodos.

Nos dias de Moisés, como veremos, os israelitas que testemunharam o poder devastador de Deus nas pragas entrariam numa nova terra, sob o comando de um novo líder, para começar uma nova vida como naçao. No futuro, os que se voltarem para Cristo e sobreviverem ao período da Tribulação irão entrar no reino milenar, uma era de paz e prosperidade incríveis, cumprindo as promessas de Deus à nação de Israel. O período do juízo futuro dará lugar a uma nova era

200 MOISÉS: UM HOMEM DEDICADO E GENEROSO

de vida no reino em que o próprio Jesus Cristo irá servir como Rei dos reis e Senhor dos senhores. Deus não esquecerá nem seu povo nem suas promessas.

Neste capítulo, à medida que formos examinando as pragas e seus efeitos sobre Moisés como líder, quero chamar sua atenção para três fatos principais.

As pragas não foram um pensamento tardio, reações reflexas ou exceções de última hora no plano de Deus. Elas serviram como parte da sua estratégia deliberada. Na sarça ardente em Midiã, o Senhor explicou o que aconteceria:

"Eu sei, porém, que o rei do Egito não vos deixará ir, se não for obrigado por mão forte. Portanto estenderei a minha mão, e ferirei o Egito com todos os meus prodígios que farei no meio dele; depois vos deixará ir."

Êxodo 3:19-20

Em Êxodo 4, enquanto Moisés arrumava a bagagem para a longa caminhada para o Ocidente, o Senhor repetiu ao seu servo qual seria o resultado. "Quando voltares ao Egito, vê que faças diante de Faraó todos os milagres que te hei posto *na mão; mas eu lhe endurecerei o coração, para que não deixe ir o povo" (Êx 4:21).

Deus já tinha conhecimento da resposta de Faraó. Sabia que as pragas seriam enviadas. Elas estavam tão incluídas em seu plano quanto o chamado de Moisés, ou o próprio Êxodo.

A NATUREZA DE FARAÓ EXIGIU AS PRAGAS

Este era um rei obstinado. Seu coração fora esculpido em carvalho. A única maneira de Deus obter sua atenção era mediante a presença dessas pragas devastadoras. Nada menos teria penetrado na consciência do homem. Veja, por exemplo, sua primeira reação às

PRAGAS QUE PREGAM 201

palavras ditas por Moisés e Arão: "Respondeu Faraó: Quem é o Senhor para que lhe ouça eu a voz, e deixe ir a Israel? Não conheço o Senhor, nem tampouco deixarei ir a Israel" (Ex 5:2).

Quem é o Senhor...? Ao ler essas palavras sinto vontade de gritar: "Cuidado, Faraó! Você passou dos limites, rapaz. Não sabe o que diz. Está falando do Deus do céu. A palavra final é dele. E melhor seguir a correnteza, amigo".

Faraó, porém, tinha um coração teimoso. Um antigo ditado declara que veneno se combate com veneno. Em outras palavras, a fim de lidar com os que são teimosos e inflexíveis, é preciso ser igualmente determinado.

Os conselheiros compreendem muito bem essa dinâmica. Ao falar com indivíduos obstinados, eles no geral não ouvem quando você usa frases delicadas e sensíveis. Algumas vezes você precisa encontrar meios de chamar a atenção deles — não por meio de argumentos comuns (por mais que essa idéia pareça atraente), mas no geral com palavras que os confrontem, as quais iriam partir o coração e o espírito de alguém mais sensível. Se você quer realmente fazer-se entender, terá de ocasionalmente levantar a voz, ou bater na mesa uma ou duas vezes, ou dizer algo severo, detalhando as conseqüências.

Foi isso que Deus fez com Faraó. O Sondador dos corações conhece o coração endurecido quando o encontra. Em certo ponto ele disse a Moisés: "O coração de Faraó está obstinado; recusa deixar ir o povo" (Êx 7:14). Em razão da natureza de Faraó, as pragas eram essenciais.

A PERGUNTA DE MOISÉS RESULTOU NAS PRAGAS

Moisés fez uma pergunta ao Senhor e a resposta de Deus veio na forma de pragas. (Cuidado com o que pergunta!) As Escrituras registram o ocorrido:

Falou mais o Senhor a Moisés, dizendo: Vai ter com Faraó, rei do Egito, e fala-lhe que deixe sair de sua terra os filhos de Israel. Moisés, porém, respondeu ao Senhor, dizendo: Eis que

202 MOISÉS: UM HOMF.M DEDICADO E GENEROSO os filhos de Israel não me têm ouvido; como, pois, me ouvirá Faraó? E não sei falar bem.

Êxodo 6:10-12

"Mas Senhor", protestou Moisés, "se os israelitas não respeitam minha mensagem, como me farei ouvir por um rei inflexível como Faraó?"

"Ah", replicou o Senhor, "que bom que perguntou, Moisés. Acontece que tenho algumas ferramentas à minha disposição. Não se preocupe, Faraó vai nos dar atenção". E o Senhor dos céus arregaçou as mangas e foi ter com o obstinado rei do Egito.

CADA PRAGA ATINGIU TODOS OS EGÍPCIOS

A nação inteira sofreu como resultado da resposta rude, inflexível, de Faraó ao Senhor. À medida que seus olhos percorrerem o texto sobre as pragas que abalaram a terra, você lerá repetidamente a palavra "todos". "Toda a terra; todo o gado; todos os homens e animais". Tragicamente e em último lugar lemos as palavras "todos os primogênitos".

Lembro-me de um contemporâneo ditador do Oriente Médio chamado Sadaam Hussein. Enquanto ele continua a desafiar e desprezar o mundo ocidental, seu país experimenta o isolamento, embargos e até ataques trovejantes de "mísseis. Muitos iraquianos inocentes sofrem por causa da vontade obstinada desse homem.

Nenhum ditador, Führer, general, Faraó ou presidente foge, porém, à responsabilidade por muito tempo. A roda do juízo de Deus vai girar; ela talvez moa devagar, mas mói muito bem. O Livro de Hebreus nos conta: "E não há criatura que não seja manifesta na sua presença; pelo contrário, todas as cousas estão descobertas e patentes aos olhos daquele a quem temos de prestar contas" (Hb 4:13).

Se este capítulo apenas mostrar a você como o juízo de Deus é completo, ele terá cumprido sua tarefa. As Escrituras não pintam aqui um quadro de felicidade, mas algo real. É a esse Deus que devemos prestar contas.

PRAGAS QUE PREGAM 203

Tenho um velho livro em meu escritório chamado Living Under the Smarting Rod ofGod. Trata-se de um livro que provavelmente nunca seria publicado nessa época de "cristianismo do tipo 'sinta-se bem'", recheado de lembretes do juízo de Deus sobre os homens e mulheres através das eras. Tudo o que tenho a dizer-lhe para destacar meu conceito é que o livro tem mais de cinco centímetros de espessura.

Quando Deus faz uma obra, ele trabalha com perfeição. As pragas não perturbaram apenas as elites da corte: elas varreram toda a terra do Egito.

Do princípio ao fim, o coração de Faraó manteve-se aprisionado numa camada de indiferença. E fato que, sob a pressão de sua corte, ele terminou dizendo: "Deixe o povo ir". Mas seu coração permaneceu inflexível até o final. Ele manteve sua obstinação. Por todo o tempo e a eternidade ele permanecerá um exemplo do que significa resistir e rejeitar a bondade de Deus. Por isso a decisão do Senhor: "Deixe as pragas se alastrarem!"

. A PRAGA DO SANGUE

Disse o Senhor a Moisés: O coração de Faraó está obstinado, recusa deixar ir o povo. Vai ter com Faraó pela manhã: ele sairá às águas; estarás à espera dele na beira do rio, tomarás na mão a vara que se tornou em cobra, e lhe dirás: O Senhor, o Deus dos hebreus, me enviou a ti para te dizer: Deixa ir o meu povo, para que me sirva no deserto; e até agora não tens ouvido. Assim diz o Senhor: Nisto saberás que eu sou o Senhor: com esta vara, que tenho na mão, ferirei as águas do rio, e se tornarão em sangue. Os peixes, que estão no rio, morrerão, o rio cheirará mal, e os egípcios terão nojo de beber água do rio.

Êxodo 7:14-18

204 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Isso não precisava acontecer. Faraó poderia ter reconhecido os sinais apresentados por Moisés e Arão como provenientes da mão do próprio Deus. Poderia ter cedido e sua nação teria continuado a prosperar mesmo sem o exército de escravos hebreus. O sofrimento, a angústia e a perda de vidas nunca precisaram ter ocorrido.

Essa é, porém, a história do nosso mundo, não é? O homem insignificante ergue seu pequeno punho na face do Criador e diz, com o dedo em riste: "Estou vivendo a meu modo". O resultado? Sofrimento indizível, lágrimas incontáveis de miséria. O Nilo era essencial para a vida dos egípcios. A água artesiana daquela terra era geralmente contaminada — situação que permanece até hoje. Portanto, os egípcios dependiam do poderoso Nilo para todas as suas necessidades referentes à água: para banhar-se, cozinhar, lavar e beber. Além disso tudo, os peixes eram um produto básico para os egípcios. Estragar o Nilo era atingir a base da dieta deles: água e peixe frescos.

O primeiro ataque de Deus foi um golpe no coração da sociedade egípcia.

Fizeram Moisés e Arão assim como o Senhor lhes havia or- > denado: Arão, levantando a vara, feriu as águas que estavam no rio, à vista de Faraó e seus oficiais; e toda a água do rio se tornou em sangue. De sorte que os peixes, que estavam no rio, morreram, o rio cheirou mal, e os egípcios não podiam beber a água do rio; e houve sangue por toda a terra do Egito.

Êxodo 7:20-21, grifo do autor

Imagine isso, se puder. Sua fonte de água desapareceu. Os peixes que alimentam sua família morreram. Isso causou estresse e dificuldades em toda a terra. Não havia água nas casas, exceto aquela pequena quantidade contaminada. As Escrituras nos dizem: "Todos os egípcios cavaram junto ao rio para encontrar água que beber; pois das águas do rio não podiam beber. Assim se passaram sete dias, depois que o Senhor feriu o rio" (w. 24-25).

Você consegue se pôr no lugar deles? Sete dias e sete noites sem a principal fonte de água. Uma semana inteira com os supermercados

PRAGAS QUE PREGAM 205

fechados. A essa altura, eu estaria pronto para declarar: "Ele é Deus! Deixe o povo ir! Estou com sede. Quero peixe. Vamos continuar com o nosso programa".

Mas não Faraó. De jeito nenhum! Na verdade, o rei deu meiavolta, entrou no palácio e não deu a menor importância ao incidente. "Virou-se Faraó, e foi para sua casa; nem ainda isto considerou o seu coração" (v. 23).

O rei não se importou absolutamente com o fato. As palavras do Senhor não significaram nada; eram como água correndo de uma pedra.

A PRAGA DAS RÃS

Depois disse o Senhor a Moisés: Chega-te a Faraó, e dize-lhe: Assim diz o Senhor: Deixa ir o meu povo, para que me sirva. Se recusares deixá-lo ir, eis que castigarei com rãs todos os teus territórios.

Êxodo 8:1-2

Já tive oportunidade de provar algumas rãs em minha vida. Na verdade, se você nunca almoçou pernas de rã, está perdendo um prato raro e único. (Talvez você tenha de aceitar minha opinião sobre isso.) Mas isso não se tratava de um filé de rã ocasional. Era uma enxurrada delas!

O Senhor disse aos egípcios: "O rio produzirá rãs em abundância, que subirão e entrarão em tua casa, no teu quarto de dormir, e sobre o teu leito, e nas casas dos teus oficiais, e sobre o teu povo e nos teus fornos, e nas tuas amassadeiras" (Êx 8:3).

Que Deus tenha piedade deles! Rãs no pão. Rãs fazendo companhia entre os lençóis. Rãs nas roupas. Rãs em toda a cozinha. Rãs em toda parte. Pode imaginar a cena?

Em nossa casa na Califórnia havia um cano plástico de esgoto que começava num ponto baixo de meu quintal e desembocava na sarjeta na frente da casa. Depois de uma tempestade não muito freqüente, notei que o cano havia entupido e a água se acumulava

206 MOISÉS: UM HOMEM DEDICADO E GENEROSO

no quintal. O que poderia ter bloqueado um cano largo daquele jeito? Eu não estava disposto a dar-me ao trabalho de verificar. Fui até a rua, espiei pela boca do cano e deparei com a maior rã que já havia visto nas imediações. Ela decidira se instalar no encanamento e isso interrompeu o processo de escoamento. Estamos falando da mãe de todas as rãs!

Já foi ruim o bastante ter uma rã no cano de esgoto. Como seria ter rãs nos armários, na pia da cozinha e na cama? Você vai tomar água à noite e pisa em uma dúzia delas. Amigos, isso é uma praga. E foi exatamente o que aconteceu. "Arão estendeu a mão sobre as águas do Egito, e subiram rãs e cobriram a terra do Egito" (Ex 8:6).

Cada cano de esgoto foi entupido. As rãs governavam o país. Você poderia até pensar: "Puxa! Isso deve ter sido suficiente". Mas não foi. A mensagem fora enviada, mas não recebida. Apesar disso, Deus mostrou-se bondoso. Ele não só fez o sangue transformar-se novamente em água fresca, como também cuidou do problema das rãs.

Então saíram Moisés e Arão da presença de Faraó; e Moisés clamou ao Senhor por causa das rãs, conforme combinara com Faraó. E o Senhor fez conforme a palavra de Moisés; morreram as rãs nas casas, nos pátios e nos campos. Ajuntaram-nas em montões e montões, e a terra cheirou mal. Vendo, porém, Faraó que havia alívio, continuou de coração endurecido, e não os ouviu, como o Senhor tinha dito.

Êxodo 8:12-15

Eliminada a pressão, Faraó recobrou sua teimosia. Apesar do sofrimento do povo, seu coração permaneceu duro como pedra.

A PRAGA DOS PIOLHOS

A terceira praga chegou sem ser anunciada. As duas primeiras pragas foram precedidas por um aviso de Moisés e Arão. Mas esta não. Quando fazemos um retrospecto de todas as pragas, é curioso notar que toda terceira praga chegou sem aviso. Parece que Deus eventualmente anuncia seu plano, mas em algumas ocasiões ele se

PRAGAS QUE PREGAM 207

reserva o direito de fazer um ataque-surpresa. Isso é para chamar nossa atenção.

Veja como foi: "Disse o Senhor a Moisés: Dize a Arão: Estende a tua vara, e fere o pó da terra, para que se torne em piolhos por toda a terra do Egito" (8:16).

"Piolhos" é uma palavra que descreve um inseto que suga o sangue das vítimas. Isso já é o bastante para enlouquecer você! Genericamente falando, qualquer inseto pode trazer muitos incômodos à vida. Você já andou por uma trilha na mata e foi atacado por uma verdadeira nuvem de insetos? E terrível! Eles literalmente o cobrem num segundo. Descem pelo pescoço, invadem o cabelo, entram no nariz e na boca. Nos olhos. Nas orelhas. Picam. Zumbem. Sugam. Ou talvez estivesse percorrendo de canoa algum riacho ou rio e se viu de repente em meio a mosquitos pequeninos e negros, que começam a picá-lo. Criaturas terríveis! Tudo o que você deseja então é fugir deles o mais depressa possível! O mesmo ocorre com piolhos; eles simplesmente se alastram rapidamente causando coceira no couro cabeludo e tremenda irritação na pessoa.

Tal situação deve ter sido simplesmente intolerável. E você talvez note, à medida que prosseguimos, que cada uma dessas aflições parece piorar progressivamente. A praga sobre o Nilo foi um golpe em todos, mas eles se adaptaram e sobreviveram. As rãs foram um tormento horrível; o povo estava cansado e irritado com elas, mas ninguém ficou realmente ferido.

Com o enxame de piolhos, a coisa ultrapassou o desconforto. Eles devem ter levado tanto as pessoas quanto os animais ao desespero. Como as Escrituras notam: "Fizeram assim; Arão estendeu a mão com sua vara, e feriu o pó da terra, e houve muitos piolhos nos homens e no gado; todo o pó da terra se tornou em piolhos por toda a terra do Egito" (v. 17).

Há alguns anos, dois de nossos filhos começaram a ter problemas de saúde. Depois de alguns exames, descobrimos que eles estavam sofrendo de várias alergias agudas. O alergista nos explicou que nossos filhos eram alérgicos ao pó. Pó! Isso é o mesmo que ser alérgico ao próprio ar. O pó está em toda parte. Como fugir dele?

208 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Pouco depois dessa descoberta, eu estava em meu escritório quando o sol brilhou através das janelas. No momento em que um raio de sol atravessou o quarto, fiquei espantado ao ver as incontáveis partículas de poeira pairando no ar. Pensei comigo mesmo: "E se cada partícula de poeira fosse um mosquito? Quem poderia pensar em tal coisa?"

No entanto, apesar disso Faraó não abrandou o coração. O versículo 19 registra as últimas palavras dos magos de Faraó. Eles não têm mais nada a dizer depois de sua declaração final ao rei: "Então disseram os magos a Faraó: Isto é o dedo de Deus. Porém o coração de Faraó se endureceu, e não os ouviu, como o Senhor tinha dito" (v. 19).

Se eu fosse um mago naquele lugar, teria fechado minha maleta mágica e embarcado no próximo vôo para bem longe do Egito. Além disso, teria mandado meu currículo para todos os reis do mundo civilizado. Aquilo já era demais!

No final dessa terceira praga e antes do início da quarta, Deus interveio de maneira surpreendente. A partir da quarta praga, a terra de Gósen onde viviam os hebreus passou a ter um escudo invisível de proteção ao seu redor. Deus passou a proteger então os israelitas, enquanto enviava pragas aos egípcios.

"Naquele dia separarei a terra de Gósen, em que habita o meu povo, para que nela não haja enxames de moscas, e saibas que eu sou o Senhor no meio desta terra" (v. 22).

Não duvide, cristão. A mão protetora de Deus está sobre sua vida: "Caiam mil ao teu lado, e dez mil à tua direita; tu não serás atingido" (SI 91:7).

Creio que esses versículos foram escritos, em princípio, tendo a invasão satânica em mente. O filho de Deus que caminha no Espírito pode mover-se no seu mundo sem temer a invasão demoníaca. Caminhar sob o controle do Espírito Santo irá livrá-lo da praga da influência demoníaca. Creio que é esse o propósito do Salmo 91.

Vemos um exemplo disso em Êxodo. Os egípcios se encontraram sob a nuvem escura das pragas, mas os israelitas, a partir da quarta praga, desfrutaram da proteção divina.

PRAGAS QUE PREGAM 209

A PRAGA DAS MOSCAS

Assim fez o Senhor; e vieram grandes enxames de moscas à casa de Faraó, e às casas dos seus oficiais, e sobre toda a terra do Egito; e a terra ficou arruinada com estes enxames.

Êxodo 8:24

Enxames! Parece até título de filme, não parece? Talvez um desses filmes de terror em que uma cidade pequena é cercada e atacada por um desses monstros alienígenas sempre presentes. Mas isso era realidade, não ficção, e o horror era real.

O termo hebraico para "enxame" significa "mistura", relatando uma grande mistura de diferentes tipos de insetos. Grandes besouros voadores. Aranhas caindo do teto. Moscas voando ao seu redor. Carrapatos grudando em sua pele. Ácaros se arrastando sob as cobertas. Abelhas picando você.

Ao contemplar essa cena, você poderia dizer: "Se tivesse de conviver com todos esses insetos, acabaria no hospício!" Mas se você vivesse no Egito, até o lugar onde estivesse internado estaria também repleto de criaturas rastejantes! Não haveria escapatória. A mistura de insetos desceu sobre o Egito em múltiplos trilhões. Em todo lugar, exceto Gósen.

Qual foi o resultado? "Mas ainda esta vez endureceu Faraó o coração, e não deixou ir o povo" (v. 32). Esse homem devia ser feito de titânio. Sua teimosia era inacreditável.

Cresci em Houston, onde havia alguns insetos texanos; mas não posso imaginar como seria ter tantas pestes dentro e ao redor de minha casa. Temos amigos que moraram algum tempo no Texas. Eles acabaram se mudando, mas nunca esqueceram as tempestades de areia texanas que varriam a região. Certo dia, uma tempestade caiu sobre a cidade no fim da tarde e prosseguiu noite adentro. No dia seguinte, porém, o céu amanheceu claro e brilhante. A dona da casa foi a um pequeno armário onde guardava suas roupas. Ao olhar para o chão coberto de areia, ela decidiu medir a quantidade de areia que penetrara no armário naquela noite. (E isto numa casa sólida e

210 MOISÉS: UM HOMEM DEDICADO E GENEROSO

protegida.) Depois de sacudir todas as roupas e varrer a areia do assoalho, ela juntou dois baldes cheios dela.

Areia dentro de casa já é suficientemente desagradável, mas você pode imaginar-se sacudindo baldes cheios de insetos de seu armário, noite após noite, dia após dia? Que praga! Faraó, no entanto, recusou-se surpreendentemente a ceder.

Sabe o que é também notável para mim? O povo do Egito não se amotinou contra seu ditador cabeça-de-mula. Você não vê a população revoltar-se contra o responsável por introduzir essas pragas em sua antes pacífica nação. Em termos humanos, ele era a causa. Contudo, deve ter dominado o povo com um poderoso feitiço de respeito e temor.

Deus, porém, não temia o homem de modo algum. Nem tinha ainda cortado relações com ele.

A PESTE NOS ANIMAIS

Eis que a mão do Senhor será sobre o teu rebanho, que está no campo, sobre os cavalos, sobre os jumentos, sobre os camelos, sobre o gado, e sobre as ovelhas, com pestilência gravíssima. E o Senhor fará distinção entre os rebanhos de Israel e o rebanho do Egito, para que nada morra de tudo o que pertence aos filhos de Israel. O Senhor designou certo tempo, dizendo: Amanhã fará o Senhor isto na terra. E o Senhor o fez no dia seguinte, e todo o rebanho dos egípcios morreu; porém, do rebanho dos israelitas não morreu nem um.

Êxodo 9:3-6

Deus já havia eliminado o suprimento de peixes e durante algum tempo, também a água. Não havia mais carne vermelha nem leite. A praga atacou o gado, cavalos, jumentos, camelos, cabras e ovelhas. Pense nas carcaças dispersas pela terra, elas faziam as pilhas de rãs verdes parecerem mera decoração!

Contudo, logo depois da fronteira de Gósen, o gado dos hebreus prosperava. Os animais nunca adoeceram. Poderia haver evidência

PRAGAS QUE PREGAM 211

mais clara? Ainda assim, Faraó, o tribunal de juízo de um só homem, declarou que a evidência "não era relevante". No mesmo capítulo, versículo 7 — seu coração novamente se endureceu.

A PRAGA DAS ÚLCERAS

Eles tomaram cinza de forno, e se apresentaram a Faraó; Moisés atirou-a para o céu, e ela se tornou em tumores que se arrebentavam em úlceras nos homens e nos animais.

Êxodo 9:10

A essa altura, o egípcio comum devia estar se perguntando: "O que virá agora? O que mais pode acontecer?"

O idioma hebraico descreve essas úlceras como "erupções inflamadas que se abrem em pústulas sobre a pele". Em outras palavras, eram úlceras profundas que se abriam e o pus escorria pela pele. Nem mesmo os magos de Faraó estavam imunes: "De maneira que os magos não podiam permanecer diante de Moisés, por causa dos tumores; porque havia tumores nos magos e em todos os egípcios" (Êx 9:11).

Quando era criança, lembro-me de ter machucado o calcanhar numa pedra — até o osso. Dessa lesão no osso, surgiu um tumor cheio de pus. Ele teve de ser perfurado. A essa altura, corri o risco de infecção no sangue. Não pude andar durante uma semana e meia antes de ele ser perfurado e também algum tempo depois disso. Que tortura! Recordo-me muito bem da dor até hoje.

Meu sofrimento veio de um único tumor em uma parte do corpo. E se você tivesse tumores em todo o corpo? Pense na angústia que essas feridas causariam atrás dos joelhos, nas articulações ou nas axilas, nos cotovelos, em volta da cintura, nos tornozelos e nos pés. Você não poderia andar nem dormir, sentar nem repousar. Do mesmo modo que Jó, talvez acabasse sobre um monte de cinzas, coçando-se com um caco de cerâmica. A dor seria insuportável. Lembre-se ainda: esses tumores chegaram sem ser anunciados. Que experiência tenebrosa!

212 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Quando você tem um tumor, há uma coisa que não quer que aconteça. Não quer que nada nem ninguém o aborreça. A dor constan- te basta por si só.

O que era então a sétima praga? Saraiva.

Então disse o Senhor a Moisés: Estende a mão para o céu, e cairá chuva de pedras em toda a terra do Egito, sobre homens, sobre animais e sobre toda planta do campo na terra do Egito (v. 22).

A saraiva teria exterminado o restante dos animais que haviam sobrevivido à quinta praga. Qualquer pessoa ou coisa que estivesse ao ar livre teria sido vulnerável, especialmente porque esta não era uma chuva de pedras comum.

Então, disse o Senhor a Moisés: Estende a mão para o céu, e cairá chuva de pedras em toda a terra do Egito, sobre homens, sobre animais e sobre toda planta do campo na terra do Egito. E Moisés estendeu a sua vara para o céu; o Senhor deu trovões e chuva de pedras, e fogo desceu sobre a terra; e fez o Senhor cair chuva de pedras sobre a terra do Egito. De maneira que havia chuva de pedras, e fogo misturado com a chuva de pedras, tão grave, qual nunca houve em toda a terra do Egito, desde que veio a ser uma nação. Por toda a terra do Egito a chuva de pedras feriu tudo quanto havia no campo, tanto homens como animais; feriu também a chuva de pedras toda planta do campo, e quebrou todas as árvores do campo. Somente na terra de Gósen, onde estavam os filhos de Israel, não havia chuva de pedras (w. 22-26).

Esta foi uma chuva de granizo suficiente para arrancar a casca das árvores e, em alguns casos, as próprias árvores. (Pense no seguro de todos aqueles carros!) Mais uma vez, porém, Israel desfrutou da

PRAGAS QUE PREGAM 213

proteção divina. Não caiu saraiva em Gósen. Nem uma única pedra de granizo.

Em 28 de janeiro de 1995, os residentes da cidade deThomasville, na Geórgia, suportaram o que os metereologistas chamam de "chuva de granizo supercélula". Pedras do tamanho de bolas de futebol de salão — até dez centímetros de diâmetro — caíram do céu sobre aquela comunidade. Você pode imaginar como é estar passeando com o cachorro quando essa tempestade cai sobre você? É provável que achasse que a Tribulação tivesse chegado!

A saraiva no Egito finalmente abriu uma brecha na concha dura de Faraó... temporariamente.

Então Faraó mandou chamar a Moisés e a Arão, e lhes disse: Esta vez pequei; o Senhor é justo, porém eu e o meu povo somos ímpios. Orai ao Senhor; pois já bastam estes grandes trovões e a chuva de pedras. Eu vos deixarei ir, e não ficareis mais aqui (w. 27-28).

O pequeno discurso do rei parecia bom, Moisés, porém, não acreditou nele. Será que foi o tom de voz? O modo como comprimia os lábios? Os olhos que se desviavam dele? Qualquer que fosse a razão, Moisés sabia que Faraó apenas buscava uma porta de emergência para uma situação crítica da qual ele não se arrependera de modo algum. Moisés concordou em pedir a Deus para suspender a saraiva, mas fitou Faraó e disse: "Quanto a ti, porém, e aos teus oficiais, eu sei que ainda não temeis ao Senhor Deus" (v. 30).

Moisés provavelmente sabia que aquele não era o fim. E não foi. Faraó endureceu outra vez o coração, talvez pensando que finalmente pudesse vencer Deus.

Decisão errada. O pior ainda estava por vir.

A PRAGA DOS GAFANHOTOS

Então, disse o Senhor a Moisés: Estende tua mão sobre a terra do Egito, para que venham os gafanhotos sobre a terra do Egi-

214 MOISÉS: UM HOMEM DEDICADO E GENEROSO

to, e comam toda a erva da terra, tudo o que deixou a chuva de pedras. Estendeu, pois, Moisés a sua vara sobre a terra do Egito, e o Senhor trouxe sobre a terra um vento oriental todo aquele dia e toda aquela noite; quando amanheceu, o vento oriental tinha trazido os gafanhotos. E subiram os gafanhotos por toda a terra do Egito, e pousaram sobre todo o seu território; eram mui numerosos; antes destes nunca houve tais gafanhotos, nem depois deles virão outros assim. Porque cobriram a superfície de toda a terra, de modo que a terra se escureceu; devoraram toda a erva da terra, e todo fruto das árvores, que deixara a chuva de pedras; e não restou nada verde nas árvores, nem na erva do campo, em toda a terra do Egito.

Êxodo 10:12-15

O que estava acontecendo? Fome! Essas pragas gradualmente atacaram as bases da dieta egípcia. O que restou após o Nilo se transformar em sangue, extinguindo o suprimento de água e matando os peixes? O que permaneceu depois da matança do gado e depois que a saraiva e os gafanhotos acabaram com as árvores e a colheita? Francamente, nada.

Você deve ter visto desastres nacionais exibidos na televisão. A Califórnia do Sul, onde costumávamos morar, teve suas devastadoras tempestades causadas pelo El Nino e desabamentos. O Texas, onde moramos agora, suportou secas, furacões e tornados. Os danos e a perda de vidas podem ser espantosos.

Mas esse era um desastre nacional multiplicado por dez. Como mencionei no início do capítulo, esse foi um daqueles raros momentos na história em que Deus desceu à terra especificamente para julgar seus inimigos. Isso nunca havia ocorrido numa nação desse modo desde o dilúvio e não acontecerá de novo até que Deus diga "basta" e envie seu Filho com uma vara de ferro para julgar novamente as nações.

Para piorar a situação dos egípcios, eles tinham de olhar para além da fronteira, para a terra vizinha de Gósen, e ver que a vida continuava normalmente. O gado pastava nos campos. As árvores floriam e davam frutos. Crianças sadias brincavam nas ruas e nos

PRAGAS QUE PREGAM 215

terrenos baldios. Os campos de trigo ondulavam na brisa. Nem um único gafanhoto afligiu a comunidade hebréia.

Vi um documentário sobre gafanhotos na televisão, tarde da noite. Um grupo selecionado de jornalistas se posicionou diretamente na passagem de um exército avançado deles. (Você gostaria de cumprir esse dever? Ao olhar para a lista de tarefas na segunda-feira, você pisca duas vezes ao ler: "Cubra a praga de gafanhotos em Botsuana".) Os repórteres estavam com os microfones ligados enquanto o enxame se aproximava, e descreveram o som como similar ao de um Boeing 747 com as turbinas funcionando. Quando o enxame chegou até eles, o barulho se tornou tão alto que mal se podia ouvir o narrador descrever a ação. Era ensurdecedor.

Quando essas criaturas — milhões delas! — saltaram umas sobre as outras e finalmente abandonaram a área, era como se a paisagem tivesse sido queimada. O solo não fora carbonizado, mas as folhas haviam sido arrancadas das árvores. Todo verde fora consumido. Você nunca testemunhou uma devastação tão completa.

Os gafanhotos, como aprendi, voam juntos. Há anos, um enxame de cerca de um quilômetro foi localizado sobre o oceano da Africa Ocidental em direção à Grã-Bretanha. Como pode imaginar, eles causaram grande devastação nas Ilhas Britânicas. Em uma fotografia tirada de um avião, não se podia ver nenhuma clareira no chão, que estava completamente negro de gafanhotos numa área de cinco mil quilômetros quadrados.

Êxodo 10:14 diz que o Egito jamais vira um ataque assim de gafanhotos e nunca o veria de novo. Lembra-se de quando mencionei que as pragas aumentaram cada vez mais sua intensidade? Tenho a certeza de que nenhum egípcio poderia imaginar coisa pior. Contudo, acredite se quiser, faltavam ainda duas pragas.

A PRAGA DAS TREVAS

Este é um capítulo negro na história do Egito e também neste livro sobre Moisés. O ato seguinte de Deus foi tornar literal essa escuridão.

216 MOISÉS: UM HOMEM DEDICADO E GENEROSO

"Estendeu, pois, Moisés a mão para o céu, e houve trevas espessas sobre toda a terra do Egito por três dias" (v. 22).

Ninguém conseguia enxergar nada. Essas trevas, no entanto, eram mais negras do que a escuridão da meia-noite; eram tão espessas que você podia senti-las. As Escrituras nos dizem que os egípcios "não viram uns aos outros, e ninguém se levantou do seu lugar por três dias; porém os filhos de Israel todos tinham luz nas suas habitações" (v. 23).

Alguns teorizaram que a escuridão extraordinária resultou de partículas de pó reunidas por algum estranho fenômeno elétrico. O dr. Alfred Edersheim, um erudito hebreu, escreveu isto:

Tentemos imaginar a cena. Sem qualquer aviso, subitamente, o chamsin elevou-se. O ar, carregado de eletricidade, fez subir a poeira e as partículas de areia mais pesadas até que a luz do sol se ocultasse, os céus se encobrissem com um espesso véu e a escuridão se aprofundasse nessa noite, a ponto de nem mesmo a luz artificial ter utilidade. A poeira flutuante e a areia entraram em cada apartamento, fechando todos os poros, insinuando-se até através das janelas e portas fechadas. [E urria praga que castiga o próprio ar do Egito!] Homens e animais procuram qualquer espécie de abrigo, buscam refugio da terrível praga em celeiros e lugares distantes. Desse modo, em completa escuridão e sofrimento, passam-se três longos dias e noites, e ninguém se aventura a sair do esconderijo.1

Não posso imaginar o efeito opressivo que isso teve na mente e no espírito. Uma escuridão na qual não se podia penetrar mesmo com uma lanterna. Uma escuridão que você podia sentir em sua pele! Você e eu entramos num quarto escuro e acendemos a luz. É automático. Entramos no carro à noite e ligamos os faróis. Pense em acender as luzes e ela continuar apagada! Você não enxerga a mão na frente do seu rosto. Deve ter sido algo semelhante à cegueira ou até à morte. E os egípcios suportaram essa loucura como tinta negra na vida deles durante três dias e três noites.

O coração de Faraó poderia continuar endurecido? Sim, podia — e continuou. Isso levou finalmente ao dramático confronto em Êxodo 10:28-29: "Disse, pois, Faraó a Moisés: Retira-te de mim, e

PRAGAS QUE PREGAM 217

guarda-te que não mais vejas o meu rosto; porque no dia em que vires o meu rosto, morrerás! Respondeu-lhe Moisés; Bem disseste; nunca mais tornarei eu a ver o teu rosto".

PRAGAS QUE PREGAM

A simples descrição superficial dessas pragas consumiu a maior parte destas páginas. Contudo, há mais coisas aqui do que os fenômenos históricos, por mais surpreendentes e dramáticos que possam ter sido. E mais do que um relato que nos leva a exclamar espantados e depois dizer: "Graças a Deus que não vivemos mais nessa época".

Estou convencido de que essa terrível demonstração de juízo sobre o Egito, essa batalha entre um Deus justo e santo e o coração teimoso de Faraó, nos ensina duas verdades.

Primeira, quando Deus julga, ele julga completamente. Segunda, é terrível cair nas mãos do Deus vivo. Vamos tornar isso penosamente pessoal. Você pode estar numa zona de perigo ao ler estas palavras. Pôs em risco sua vida, apesar das constantes advertências. Abandonou as verdades essenciais por tanto tempo que seu coração endureceu. Quanto mais endurecido, tanto mais difícil será permitir que a luz de Deus finalmente entre.

Se isso não descrever você, todos conhecemos pessoas que se envolveram em tal situação. Elas rejeitaram os apelos, ignoraram os conselhos, zombaram da Palavra de Deus e endureceram o coração, seguindo seus próprios caminhos sem se importar com nada. Tudo o que fica muito tempo exposto à luz do sol endurece. Olhe para o sol por muito tempo e a luz vai cegá-lo. Em outras palavras, se você não reagir à luz, será arruinado por ela. Foi assim com Faraó.

Esse segmento da história egípcia nos faz lembrar de que não se pode ser negligente por toda a eternidade. O dia do juízo finalmente chega. É terrível pisar na graça de Deus. Seus castigos são tremendamente completos. Nunca duvide disso.

Há, porém, um lado claro nessa história sombria. Quando Deus abençoa, ele não retém nada. Foi assim com os filhos de Israel na terra de Gósen. Por maior que fosse a escuridão no Egito, os hebreus

218 MOISÉS: UM HOMEM DEDICADO E GENEROSO

estavam inundados de claridade. Formavam uma cidade sobre um monte, brilhando na escuridão da noite, se Faraó apenas tivesse olhos para vê-la.

Você pode ser aquele que desfrutou da grandiosa graça e dons de Deus em sua vida: sua proteção, provisão, bênçãos diárias e favor imerecido enchem seus dias. Você pode agradecer a Deus por um lugar na terra de Gósen. Desfruta da proteção de Deus — um plano cuidadoso que o distingue dos que vivem sob sua ira. Creia em mim, nada nessa vida ou na próxima é mais sério do que a ira de Deus. Alguns são quebrantados — abençoadamente quebrantados — por essa ira. Outros apenas se endurecem.

Numa época em que preguei essa mensagem sobre este trecho das Escrituras na Califórnia do Sul, lembro-me de ter jantado com um médico. Marcamos um encontro. Ele era judeu e provavelmente um dos melhores cirurgiões ortopedistas na especialidade.

Durante a maior parte do exercício da profissão, ele se dedicava por completo a ganhar dinheiro. E conseguiu ganhar centenas de milhares de dólares. Quando estava perto dos cinqüenta anos, era extremamente rico, mas não tinha tempo ou disposição para pensar em Deus. O trabalho o consumia. Ao trabalhar de dezoito a vinte horas por dia, durante semanas a fio, ele começou a depender dos narcóticos que receitava para atenuar ç sofrimento de seus pacientes.

Com o passar do tempo, esse brilhante cirurgião tornou-se viciado em heroína e várias outras drogas. O que havia começado como um recurso temporário e artificial para ajudá-lo a trabalhar mais, tornou-se um senhor cruel e despótico. Quando a verdade finalmente surgiu, ele perdeu suas credenciais. Depois disso, a curto prazo, perdeu a reputação, a casa onde morava, a esposa e os filhos. Perdeu tudo. Era como se uma praga seguida de outra o tivesse atacado, até que finalmente foi pego pela mão do Deus vivo.

Mediante o testemunho fiel de um farmacêutico crente, esse médico judeu quebrantado descobriu finalmente a resposta para seus problemas opressores. Engoliu o orgulho, admitiu seu vazio espiritual e entregou o coração ao Senhor Jesus Cristo.

PRAGAS QUE PREGAM 219

Tive o privilégio de jantar naquela noite com esse médico e o homem que o conduziu a Cristo. Enquanto contava sua história, o médico piscava os olhos cheios de lágrimas de sofrimento pessoal. Ele falou sobre apoiar-se completamente na graça de Deus e sobre os planos a longo prazo para a sua recuperação. Queria eventualmente fazer novos exames na ordem médica, esperava ter sua licença de volta e novamente voltar a exercer a profissão. Dia após dia, noite após noite, ele se ajoelhava, suplicando ao Deus da graça que lhe devolvesse a esposa e a família.

Depois do jantar, esse homem que passara pelas suas dez pragas pessoais, olhou para mim por sobre a mesa. "Chuck", disse, "pela primeira vez em minha vida posso realmente afirmar que tenho paz. Saí do juízo para a vida completamente nova da graça. E quero dizer-lhe que a coisa mais importante para mim agora não é exercer minha profissão. Nem o dinheiro. Nem mesmo minha família. É minha relação vital com Deus".

Ao sairmos do restaurante, ele pôs a mão em meu ombro. "Chuck", pediu, "quer orar por mim? Ore para que eu não me desvie do caminho da maturidade".

Faço isso muitas vezes desde então. Ele está em minha mente como um perfeito exemplo de alguém que passou do juízo para a misericórdia.

As pragas da vida são difíceis de suportar — ferem profundamente. Deus não deseja, entretanto, deixar-nos sós em nossa dor e aflição. Habacuque clamou certa vez a Deus: "Na tua ira, lembra-te da misericórdia".

O Senhor tem feito justamente isso. Jesus, que suportou a ira de Deus ao máximo na cruz, nos convida agora para andarmos de braço dado com ele durante o resto de nossos dias. Ele é nosso Amigo fiel, sempre presente. Nenhuma catástrofe terrena poderá jamais nos separar da sua graça ou do legado do seu amor.

í ^ a l p h Waldo Emerson declarou: "Não há propriamente história; só biografia". Thomas Carlyle, seu contemporâneo, acrescentou estas palavras: "O estudo da história não é mais do que o estudo de homens e mulheres grandiosos".

História é biografia e isso se aplica especialmente à Bíblia. Se as pessoas fossem eliminadas dela, seria impossível entender a Bíblia. Além disso, o livro seria incompreensível, cheio de conceitos abstratos sem nenhuma ligação com a vida. São as pessoas que fazem as Escrituras se vincularem à realidade.

Gênesis, por exemplo, não é nada mais que a biografia de doze homens envolvidos num relato histórico do movimento de Deus nesta terra. Pense nesses homens. Primeiro, temos Adão e seus três filhos, Caim, Abel e Sete. Isso leva você a Noé e seus três rapazes, Sem, Cão e Jafé. Segue-se então o relato de Abraão e seu filho Isaque, vindo a seguir o filho de Isaque, Jacó, e o filho deste, José. Esse é o esboço básico do Livro de Gênesis.

Êxodo é a biografia de um só homem. A lente telescópica do Espírito enfoca subitamente um indivíduo, focalizando-o durante mais quatro livros - de Êxodo a Deuteronômio. Como você sabe agora, Êxodo é a biografia de Moisés, servo pessoal de Deus, a quem ele moldou num homem de dedicação abnegada.

222 MOISÉS: UM I IOMEM DEDICADO E GENEROSO

FAZENDO HISTÓRIA

Você se sente impressionado quando encontra esses grandes nomes nas Escrituras? Sente como se os homens e as mulheres das páginas da Bíblia tivessem sido recortados de um tecido diferente do seu, e que você nunca poderia ser usado por Deus como eles foram? A idéia de que você e eu algum dia poderíamos "fazer história" parece quase um absurdo.

Ao pensar a respeito, porém, nota-se que seria difícil para Deus fazer história sem pessoas. Não devemos também esquecer que o seu plano não terminou com Moisés. Ou Davi. Ou Daniel. Ou João Batista. Ou Pedro ou Paulo, ou Marta. Grande parte de seu plano ainda está por se desdobrar e mais história há para ser feita até que o plano se complete e não haja mais história. Até esse dia final, ele usará pessoas. Reis e o povo comum. Mulheres e homens. Ricos e pobres. Ousados e tímidos.

Responda à minha pergunta: "O que você está planejando fazer com o resto dos seus dias?"

"Olhe, Chuck, só estou tentando terminar os estudos." "Estou trabalhando dia e noite para inaugurar esse novo negócio."

"Só estou tentando criar minha família até se tornarem independentes."

"Estou perfurando o cartão de ponto e esperando viver até me aposentar."

Tudo bem. Mas o que você está fazendo com relação à eternidade?

"Olhe, recebi Jesus Cristo." Isso é maravilhoso. É a decisão mais importante da vida e nunca vai arrepender-se dela. Mas o que vai fazer com Jesus Cristo ao considerar sua vocação na vida?

"No que está pensando, Chuck? Ele não chamou todo mundo para ser pastor ou missionário."

E verdade, não chamou. Mas poderia estar chamando você. Por mais estranho que pareça, este é o objetivo deste capítulo sobre a Páscoa.

A NOITE EM QUE NINGUÉM DORMIU 223

O INGREDIENTE ESSENCIAL

O ponto principal, o ingrediente essencial de Êxodo 11 e 12 é a obediência. Deus falou, alguns ouviram e fizeram o que Deus mandou. Como resultado, Deus fez uso deles em seu plano naquele momento da história.

Este é o resultado do ministério transcultural ou de qualquer empreendimento de Deus: ouvir o que ele diz, respeitar seu chamado, responder em obediência e deixar os resultados com ele. Você talvez diga isso de maneira muito mais sofisticada, mas não poderia falar mais claramente. Resultado: estamos falando de obediência.

Vamos ver como a obediência — o ingrediente essencial — é concretizada no capítulo 11 de Êxodo. "Disse o Senhor a Moisés: Ainda mais uma praga trarei sobre Faraó e sobre o Egito. Então vos deixará ir daqui; quando vos deixar, é certo que vos expulsará totalmente" (v. 1).

Em outras palavras, o que Deus diz a Moisés nesse capítulo é repetição do que foi dito antes, mas se encaixa no fluxo de pensamentos enquanto investigamos mais a fundo esse assunto da Páscoa. No diário mantido por Moisés, chamado Livro de Êxodo, essas palavras do Senhor se ajustam melhor nesse ponto. Vamos voltar ao que ele disse a Moisés:

Ainda mais uma praga trarei sobre Faraó e sobre o Egito. Então vos deixará ir daqui; quando vos deixar, é certo que vos expulsará totalmente. Fala agora aos ouvidos do povo que todo homem peça ao seu vizinho, e toda mulher à sua vizinha, objetos de prata e de ouro

Êxodo 11:1-2

Você não acha isso um pouco estranho? Os escravos hebreus deviam pedir prata e ouro aos vizinhos egípcios? Por quê? Os israelitas não tinham ainda compreendido, mas Deus os preparava para uma viagem. A prata e o ouro eram uma retratação para saírem da cidade. Ao pensar nisso, nota que esses "salários" eram apenas um magro acerto para os mais de quatrocentos anos de trabalho escravo no Egito.

224 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Deus já sabia para que essa prata e ouro serviriam quando a nova nação chegasse ao deserto do Sinai. Deus já tinha algo em mente que ninguém ainda sonhara — o Tabernáculo, a Tenda da Reunião, onde os israelitas iriam chegar bem perto do Deus santo que os livrara. Nesse ponto, Deus não lhes contou para que precisavam desses metais preciosos. Ele disse apenas "peçam", e eles fizeram isso. É a chamada obediência.

E o Deus Eterno fez que os egípcios respeitassem os israelitas. De fato, os funcionários do rei e todo o povo consideravam Moisés um grande homem.

Êxodo 11:3 (BLH)

Não é estimulante? Apenas há alguns capítulos, lemos sobre o mau dia de Moisés. O ex-pastor estava sob a mira de uma arma, desprezado pelo rei e detestado pela liderança dos hebreus. Lemos, porém, agora, que os egípcios "consideravam Moisés um grande homem". Da corte de Faraó até o povo da rua, as pessoas diziam: "Ali vai um grande homem".

Sabe por que isso era verdade? Porque Moisés se manteve isolado e confiou em Deus (ele obedeceu), e o Senhor deu-lhe favor aos olhos deles. O Senhor se agrada disso. Lembra-se de Provérbios 16:7? Já mencionamos isso antes. "Sendo o caminho dos homens agradável ao Senhor, este reconcilia com eles os seus inimigos." Vemos isso confirmado nesse surpreendente desenvolvimento.

Talvez seja essa a palavra que você precisa receber do Senhor hoje. E possível que nesse momento, em seu trabalho, você tenha chegado a um impasse; há uma questão de integridade envolvida e você decidiu não fazer acordos. Em vista de sua posição a favor de Cristo, você descobre que é objeto de ressentimento. Quero assegurar-lhe de que se lidar com a situação de modo sábio e discreto, Deus fará que um dia seja estimado aos olhos dos que agora são seus inimigos. Eles respeitarão sua posição porque você a está sustentando sozinho, fazendo o que é certo.

A NOITE EM QUE NINGUÉM DORMIU 225

CINCO FATOS VERÍDICOS

Depois de Deus ter falado com Moisés e ensinado a ele o que deveria dizer, depois de informá-lo: "Você tem a permissão do povo egípcio", Moisés voltou às câmaras reais para uma última entrevista com o rei. No curso dessa conversa tensa, ele anunciou cinco verdades a Faraó, as quais o rei prontamente rejeitou (grande surpresa).

TODOS OS PRIMOGÊNITOS DO EGITO MORRERÃO.

E todo primogênito na terra do Egito morrerá, desde o primogênito de Faraó, que se assenta no seu trono, até ao primogênito da serva que está junto à mó, e todo primogênito dos animais (v. 5).

Ele estava dizendo a Faraó: "Isso inclui você. Seu primogênito vai morrer à meia-noite".

A AFLIÇÃO SERÁ NACIONAL.

Haverá grande clamor em toda a terra do Egito, qual nunca houve, nem haverá jamais (v. 6).

O luto que envolverá o Egito não terá precedentes. Guerras haviam sido travadas no passado e haveria guerras no futuro. O Egito acabara de passar por nove pragas, e desastres nacionais estavam para acontecer. Mas nunca mais haveria um sofrimento como aquele.

226 MOISÉS: UM HOMEM DEDICADO E GENEROSO

ISRAEL VAI SER PROTEGIDO.

Porém contra nenhum dos filhos de Israel, desde os homens até aos animais, nem ainda um cão rosnará, para que saibais que o Senhor fez distinção entre os egípcios e os israelitas (v. 7).

Da mesma forma que nos desastres anteriores, a população hebréia seria poupada.

Então todos estes teus oficiais descerão a mim, e se inclinarão perante mim, dizendo: Sai tu, e todo o povo que te segue. E depois disto sairei. E, ardendo em ira, se retirou da presença de Faraó (v. 8).

Com essa última palavra: "sairei", Moisés virou as costas e saiu do aposento. Ele não precisava desculpar-se pela mensagem nem pela força com que foi declarada. A mensagem era de Deus. Ele era invencível enquanto a transmitia. A paciência já se esgotara e o pronunciamento do juízo iminente foi duro e severo. Era como se dissesse: "Faraó, você já resistiu suficientemente a Deus. Ousou desafiá-lo a agir e ele fará isso. Você chegou ao fim das suas forças".

PREPARATIVOS PARA O ÊXODO

Após sair da presença de Faraó, Moisés voltou e apresentou-se aos israelitas. Ele não queria mais tratar com o rei: Faraó estava agora nas mãos de Deus. Sua atenção voltou-se agora para o povo de Israel, ajudando-o a compreender as instruções de Deus naqueles momentos terríveis, antes de deixar o Egito para sempre. Ele os instruiria e eles iriam colaborar. Isso é chamado de obediência.

Para começar, o Senhor queria que o povo estabelecesse um memorial. Ele disse a Moisés e Arão: "Este mês vos será o principal dos meses; será o primeiro mês do ano" (12:2).

A NOITE EM QUE NINGUÉM DORMIU 227

A partir desse dia, o calendário hebreu seria modificado para refletir a importância do solene evento que estava prestes a acontecer.

Falai a toda a congregação de Israel, dizendo: Aos dez deste mês cada um tomará para si um cordeiro, segundo a casa dos pais, um cordeiro para cada família. Mas se a família for pequena para um cordeiro, então convidará ele o seu vizinho mais próximo, conforme o número das almas; conforme o que cada um puder comer, por aí calculareis quantos bastem para o cordeiro. O cordeiro será sem defeito, macho de um ano. (w. 3-5).

Note como essas instruções se tornam cuidadosas e específicas.

...Podereis tomar um cordeiro ou um cabrito; e o guardareis até ao décimo quarto dia deste mês; e todo o ajuntamento da congregação de Israel o imolará no crepúsculo da tarde. Tomarão do sangue e o porão em ambas as ombreiras, e na verga da porta, nas casas em que o comerem (w. 5-7).

Um dos problemas em ler uma passagem como esta é que alguns de nós estamos excessivamente familiarizados com ela. Nós a lemos ou ouvimos tantas vezes que quase a atropelamos. "Lá vamos nós de novo na Páscoa. Vamos estudar uma verdade mais profunda."

Você e eu precisamos nos pôr no lugar daqueles que ouviam Moisés pessoalmente. Tente imaginar-se recebendo essas instruções pela primeira vez. Lembre-se: os hebreus nunca haviam feito algo semelhante antes. Eles nunca haviam assado um cordeiro desse modo. Nunca recolheram o sangue numa vasilha com intenção especial. Nunca o haviam espalhado nos batentes das casas. Nunca haviam ouvido falar de um "êxodo". Quem já ouvira? Quando uma nação inteira se reuniu numa única noite, resolvendo abandonar o país em que vivia há quatrocentos anos? Tudo isso era novo e deveria ter espantado aqueles escravos prestes a ser libertados.

Imagine uma boa família hebréia ouvindo Moisés repetir as instruções de Deus. "Vocês devem pegar um cordeiro, um por famí-

228 MOISÉS: UM HOMEM DEDICADO E GENEROSO

lia. Depois de cortar a garganta dele e drenar o sangue, deverão guardar um pouco desse sangue. Com um ramo de hissopo, que será mergulhado na vasilha contendo o sangue, passarão nos batentes, de cada lado da porta. Se vocês ficarem no centro da porta e colocar as mãos de cada lado, estarão tocando os batentes. Entenderam? Devem também espalhar parte desse sangue sobre a verga — a trave horizontal que fica acima da porta. Esses são os únicos lugares em que devem colocar o sangue, compreenderam?

Pare e pense um momento sobre essas instruções. Que razão lógica havia para fazer essas coisas com o sangue do cordeiro? Você diz: "Deus mandou que fizessem isso". É verdade. Essa é a resposta. Nesse ponto, essa era a única razão de que precisavam. Não havia poder no sangue seco de um cordeiro morto. Todavia, em sua sabedoria insondável, Deus preparou um plano que só exigia uma coisa — obediência.

Ele nunca pediu que refletissem sobre isso. Nunca pediu que conversassem sobre a ordem. Nunca pediu que considerassem a idéia e decidissem se concordavam com ela. Ele simplesmente lhes disse o que fazer e quando fazer. A seguir, disse a eles o que aconteceria como resultado de sua estrita obediência às suas ordens.

Porque naquela noite passarei pela terra do Egito, e ferirei na terra do Egito todos os primogênitos, desde os homens até aos animais; executarei juízo sobre todos os «deuses do Egito: Eu sou o Senhor. O sangue vos será por sinal nas casas em que estiverdes; quando eu vir o sangue, passarei por vós... (w. 12-13).

Soa familiar? Se você for como eu, lembra-se de ter cantado o velho hino: "Quando eu vir o sangue, passarei, passarei por sobre você".1

Deus disse a eles: "Vou visitar o Egito. Esta noite. Vou invadir cada casa que não tiver sangue nos batentes. Mas haverá sangue nas portas do meu povo, e ele será poupado. Esse é o meu plano. Cumpram-non.

Como deviam comer esse cordeiro? Deus deu também instruções específicas para a refeição: "Desta maneira o comereis: lombos cingidos, sandálias nos pés e cajado na mão; comê-lo-eis à pressa: é a Páscoa do Senhor" (v. 11).

A NOITE EM QUE NINGUÉM DORMIU 229

Em outras palavras, deviam estar preparados para viajar. Ele disse: "Esta não é uma refeição para ser comida vestindo pijamas. Vocês devem estar prontos para marchar! Vistam-se para a viagem e calcem as sandálias". Calçar as sandálias — dentro de casa? Isso não era estranho? Não naquela ocasião! Precisavam estar prontos para sair pela porta, e rápido.

Lembra-se da última vez em que você e sua família tiveram de comer depressa? ("Chuck", você poderia dizer, "isso está parecido com as refeições em nossa casa".) Vamos dizer que tivesse de ir a um lugar em determinada hora e todos fossem obrigados a engolir rapidamente um sanduíche. A idéia aqui é essa. Não devia haver delongas nem conversas desnecessárias. Todos os hebreus, pai, mãe e filhos, tinham de estar prontos para partir num instante.

Por quê? Porque Deus estava prestes a fazer história, e aquelas pessoas iam participar dela. Ele estava dizendo: "Vou chamá-los para fora dessas casas e vocês irão deixar para trás e esquecer mais de quatrocentos anos de escravidão. Vou resgatá-los do cativeiro e ficarão livres. Verdadeiramente livres!"

Daquele dia significativo até hoje o povo judeu celebraria a Páscoa. A história foi feita naquela noite, e foi feita porque o povo acreditou no homem de Deus e obedeceu ao plano divino.

Por essa razão, o Senhor lhes disse: "Este dia vos será por memorial, e o celebrareis como solenidade ao Senhor: nas vossas gerações o celebrareis por estatuto perpétuo" (v. 14).

O Senhor passou então a dar mais detalhes. E depois desses detalhes, ele disse algo que deveriam lembrar.

E, uma vez dentro na terra que o Senhor vos dará, como tem dito, observai este rito. Quando vossos filhos vos perguntarem: Que rito é este? Respondereis: É o sacrifício da Páscoa ao Senhor que passou por cima das casas dos filhos de Israel no Egito, quando feriu os egípcios e livrou as nossas casas (w. 25-27).

Gosto muito dessa parte da história. Creio que é a nostalgia que prende minha atenção nesse ponto. Aqueles que são pais e avôs têm

230 MOISÉS: UM HOMEM DEDICADO E GENEROSO

a importante missão de ajudar os filhos a entender por que fazemos o que fazemos. Estivemos muitas vezes nessa situação.

"Papai, mamãe, por que oramos antes das refeições? Na casa do Joel eles nunca oram; apenas começam a comer. Por que fazemos isso?"

"Papai, por que vamos à igreja toda semana? Quase ninguém da escola vai."

"Mamãe, por que as pessoas comem um pedacinho de pão e tomam suco na igreja? Qual o significado disso?"

"Vovô, como aquela moça soube que deveria ser missionária? Como Deus disse isso a ela?"

"Vovó, por que vamos toda semana à reunião da sopa, quando eles alimentam os desabrigados? Eles não podiam pedir a uma outra pessoa?"

Esses são momentos escolhidos para os pais. Oportunidades clássicas. E Deus nos diz para estarmos preparados para elas. Quando surgirem, façam que sejam importantes. Não as trate com indiferença, mas com seriedade. Reflita sobre a sua resposta. Dedique o tempo necessário para explicar as coisas. Ajude seus filhos a compreenderem a razão por trás de sua caminhada e atividades cristãs. Eles não só precisam saber, como terão também de transmitir um dia essa informação aos filhos.

A instrução dada por Moisés devia ser passada adiante, de geração para geração. Depois que transmitiu as instruções específicas, as Escrituras dizem: "Então o povo se inclinou e adorou. E foram os filhos de Israel, e fizeram isso: como o Senhor ordenara a Moisés e a Arão, assim fizeram" (w. 27-28).

Estamos, de novo, de volta à palavra principal: obediência.

O TEMA SUBJACENTE, PRIMORDIAL

Abri este capítulo com uma discussão sobre ouvir e obedecer ao chamado de Deus em sua vida. Em minha opinião, o tema que alinhava toda essa parte das Escrituras é obediência, obediência, obediência.

O Faraó não quis — não iria — obedecer. Como resultado, ele expôs a si mesmo e sua nação ao juízo de Deus. Os hebreus, porém,

Á NOITE EM QUE NINGUÉM DORMIU 231

ouviram a palavra por meio de Moisés e obedeceram até os mínimos detalhes. Como resultado, experimentaram um grande livramento. Eles fizeram história, enquanto Faraó se tornou história.

Gostaria de aplicar alguns desses pensamentos antes de continuar a narrativa. Minha convicção pessoal é que nossa maior dificuldade não está na esfera da compreensão da vontade de Deus, mas na esfera de obedecer ao Deus dessa vontade. Para ser completamente sincero, quando você e eu fazemos um retrospecto da vida, não ficamos tão confusos ou desorientados em relação à vontade de Deus quanto teimosos e resistentes para com aquele que dirige os nossos passos. Nosso problema não é que não sabemos, mas que sabemos e não estamos dispostos a ir até o fim.

Esse é o principal conflito da vida cristã. A clara verdade de Deus é repetidamente posta diante de nós. Está à nossa disposição, nós a lemos, a ouvimos pregada do púlpito, num livro cristão ou num programa de rádio cristão, e sentimos o Espírito Santo sussurrando: Isto épara você. Nós o entendemos claramente, mas resistimos. Quando a situação é precária, nossa tendência é dizer: "Planejei as coisas de outro modo".

Vamos pôr isso em termos de nosso envolvimento com o programa mundial de Deus. A pergunta que mais ouço é esta: "Como saber que Deus me quer no ministério transcultural?" Esta é uma interrogação mais direta. Pergunte a si mesmo: "Como sei que ele não querT

Em alguma fase da nossa vida — talvez em várias — precisamos fazer a nós mesmos essa pergunta. Você pode dizer: "Olhe, Chuck, ele não está chamando a todos para essa tarefa".

Sei disso. Mas essa não é a pergunta. Não estamos falando de todo mundo. A questão é: "Como você sabe que ele não está chamando vocêT

PASSO A PASSO

Para ser franco, nunca me fiz essas perguntas quando era adolescente. Eu seguia meu próprio caminho, minha própria direção, e o último pensamento em minha mente era como Deus poderia desejar

232 MOISÉS: UM HOMEM DEDICADO E GENEROSO

fazer uso de minha vida. Sinceramente, não me importava com esse aspecto. Alguns anos mais tarde, porém, quando estava na marinha, no exterior, uma depravação inacreditável me cercava enquanto vivia nas barracas, e Deus começou a me cutucar. Depois se pôs a me pressionar.

PERCEPÇÃO DA NECESSIDADE

A primeira coisa que ele me mostrou foi a necessidade. Ela me cercava! De todos os lados, havia pessoas que simplesmente não conheciam a verdade. Por causa da própria ignorância, elas viviam em meio à escória, doença e desespero do pecado. Comecei a pensar: Alguém precisa ajudar esses camaradas. Aos poucos, sem clarins tocando ao longe, comecei a fazer isso em minha pequena esfera de influência.

Sabe o que aconteceu? Maravilha das maravilhas, alguns começaram a responder. Não podia acreditar em meus olhos. -Quando falei a vários deles sobre a provisão de Deus para o pecado e sua oferta de salvação em Cristo, eles acreditaram nela. Saíram das trevas e voltaram para a luz. Alguns quase imediatamente.

A PERCEPÇÃO DE QUE ELE PODERIA USAR-ME

O segundo passo foi quando fui além de minha esfera de influência e descobri que Deus podia realmente me usar. A mim! Fazer uso de mim como uma ferramenta em seu plano. Que revelação! Mais surpreendente ainda, era divertido. Nada de trabalho pesado, ao contrário, mal podia acreditar que era tão delicioso e satisfatório.

O terceiro passo veio quando comecei a pensar em voz alta diante do Senhor sobre me dedicar em tempo integral a esse ministério. Eu disse: "Senhor, se me capacitou em sua graça para realizar essas coisas juntamente com minhas outras ocupações, e sinto tanto prazer e alegria realizando isso, talvez queira que eu faça disso minha carrei-

A NOITE EM QUE NINGUÉM DORMIU 233

ra. Para ser sincero, seria uma grande mudança para mim, mas se for isso o que o Senhor deseja, estou disponível".

Durante todos aqueles meses em que esse processo ocorria em minha vida, nunca tive uma experiência mística, enganosa. Nunca olhei para o céu e vi as palavras "Vá pregar" escritas nas nuvens. Não houve relâmpagos, nenhuma visão durante a noite, ninguém impondo as mãos sobre mim e profetizando. Não ouvi vozes e não senti arrepios. Nada disso. Só uma segurança tranqüila e silenciosa desenvolvendo-se em minha alma. Mediante as circunstâncias, a Palavra e a voz baixinha do Senhor em meu coração, ele parecia dizer: "Quero usar você. Precisa planejar para isso acontecer. Adaptar sua vida, seu casamento e todos os seus planos familiares aos meus".

Respondi: "Está bem, Senhor, farei o que quer". Como resultado, ele começou a abrir uma porta após outra. Não tive de forçar nenhuma delas. Uma foi aberta para mim e depois outra e outra. Então, antes que percebesse, estava no seminário e depois diante do povo de Deus, ensinando e pregando a Palavra. Todo o processo se desenrolou. Não tentei forçar nada para que acontecesse.

E o processo mais normal do mundo. Entretanto, a parte mais difícil de toda a operação é esse primeiro passo. É aquele momento em que você sai da letargia e se pergunta: Como sei que ele não me quer em algum aspecto do ministério cristão vocacional? Como saber? E se ele tiver alguma coisa em mente para mim? Estou disposto a ouvir? Estou disponível? Novamente é uma questão de obediência.

Lembro-me de ter lido há alguns anos um livro do missionário Don Hillis. O título era / Dorít Feel Called (Thank the Lord!). Ele consistia numa espécie de golpe no conceito sobre sentir algo, como arrepios santos, antes de dar o primeiro passo em direção a uma carreira missionária.

Na verdade, a obediência não é, de modo algum, uma questão de sentimento. Houve ocasiões em que não tinha vontade de pregar; dias em que não me sentia disposto a entrar numa sala de aula no seminário; vezes em que não sentia vontade de cumprir meus votos conjugais, e circuntâncias em que atender um irmão ou irmã ne-

234 MOISÉS: UM HOMEM DEDICADO E GENEROSO

cessitado me desanimava, mesmo quando tinha os recursos para ajudar. Mas sabe de uma coisa? Não importava realmente como eu me sentia. Meus sentimentos irão mudar diariamente, talvez de hora em hora, como o tempo. Minha principal necessidade é obedecer à vontade revelada de Deus, pura e simplesmente.

Os israelitas podem não ter sentido vontade de espalhar o sangue do cordeiro na verga e nos batentes da casa naquela noite escura da primeira Páscoa. Eles certamente não entenderam o raciocínio do Senhor. Não tinham idéia de que isso apontaria para um Messias futuro que pagaria a dívida do pecado com o próprio sangue e morreria pelos pecados do mundo. Eles apenas obedeceram; obedeceram porque haviam acreditado na palavra do Senhor. Seguiram as instruções sem compreender todos os porquês.

Algumas horas depois sentiram-se felizes por terem obedecido. Obediência sempre vale a pena.

A NOITE EM QUE NINGUÉM DORMIU

Aconteceu que, à meia-noite, feriu o Senhor todos os primogênitos na terra do Egito, desde o primogênito de Faraó, que se assentava no seu trono, até ao primogênito do cativo que estava na enxovia, e todos os primogênitos dos animais.

Êxodo 12:29

Isso não parece terrivelmente familiar? Sim, foi exatamente isso que Deus afirmou que aconteceria. Ele cumpre sua palavra. Não poupou ninguém que não estivesse preparado, nem mesmo o rei. As Escrituras dizem: "Levantou-se Faraó de noite, ele, todos os seus oficiais, e todos os egípcios; e fez-se grande clamor no Egito, pois não havia casa em que não houvesse morto" (Êx 12:30).

É melhor que acredite. Está ouvindo? Escute mentalmente. Com os olhos da mente, imagine a cena. As Escrituras dizem "grande clamor". Era uma noite misteriosa, terrível, mortal. A morte aproximava-se e esmagava a terra.

A NOITE EM QUE NINGUÉM DORMIU 235

Mas e em Gósen? Os israelitas estavam de pé, comendo cordeiro assado e ervas amargas, ouvindo o choro angustiado em todo o Egito. Todos os hebreus tinham sobrevivido. Imagino os pais abraçando seu primogênito com lágrimas nos olhos. "Graças a Deus, você está vivo, filho! Louvado seja o Senhor por termos sido poupados!" Os dedos escorregadios da morte chegaram como uma peste medonha, mas não tocaram um único dentre os filhos de Deus.

As Escrituras contam que não houve lar egípcio onde não houvera uma única morte. Pense nisso. Que noite pavorosa aquela! Minha imaginação tem dificuldade de conceber isso plenamente.

O versículo 31 diz que o Faraó, aflito, chamou Moisés e Arão. Pode imaginar? "Tragam Moisés e Arão agora!"

Então, naquela mesma noite, [Faraó] chamou a Moisés e a Arão e lhes disse: Levantai-vos, saí do meio do meu povo, assim vós como os filhos de Israel; ide, servi ao Senhor, como tendes dito. Levai também convosco vossas ovelhas e vosso gado, como tendes dito; ide-vos embora, e abençoai-me também a mim.

Êxodo 12:31-32 (inserção do autor)

"Vão embora! Partam! Levem tudo! Não percam tempo! Façam o que disseram."

Faraó não foi o único que os incentivou a partir. As Escrituras dizem também: "Os egípcios apertavam com o povo, apressando-se em lançá-los fora da terra, pois diziam: Todos morreremos" (v. 33).

Ninguém teve tanta ajuda para arrumar as malas do que aqueles israelitas naquela noite. Uma vez que foram obedientes e estavam prontos assim que chegou a ordem, eles saíram imediatamente do Egito. Que noite! Uma grande multidão de pessoas enchiam as ruas, marchando em direção da fronteira, enquanto os lamentos sufocados e gritos dos egípcios ecoavam na escuridão. "Assim partiram os filhos de Israel de Ramessés para Sucote, cerca de seiscentos mil a pé, somente de homens, sem contar mulheres e crianças" (v. 37).

Quando acrescentamos mulheres e crianças a essa contagem, muitos estudiosos do Antigo Testamento calculam o total como cerca de

236 MOISÉS: UM HOMEM DEDICADO E GENEROSO

dois milhões de pessoas. Dois milhões! Lembre da logística! E ninguém tinha planos sobre como obter a próxima refeição. Pense nos problemas sanitários. Nos desafios referentes à nutrição e médicos. Na proteção necessária dos elementos. Ninguém tinha planos de emergência. Eles apenas partiram. Os que conseguiram pensar sobre essas coisas naquela noite violenta, devem ter sentido: "Se Deus pode preservar-nos da morte quando ela nos rodeia enraivecida aqui no Egito, ele pode certamente cuidar de nós nessa caminhada noite adentro". A obediência gera esse tipo de fé.

ALEGRIA HISTÓRICA

Eu e você temos uma perspectiva diferente porque lemos o Livro. Eles não leram o Livro. Naquela época, o Livro não existia. Nenhuma nação fizera isso antes; essa foi a primeira vez. Não havia mapa, nem contrato, nem uma pasta com instruções passo a passo intitulada Manual do Êxodo. Não havia nada garantido, exceto a presença do Deus vivo representada por um pastor chamado Moisés, que andava na frente do maior rebanho que alguém já haviam guiado.

Ele estava fazendo história. Todos estavam. Séculos mais tarde, os descendentes desse povo ainda louvavam aquela noite incrível e o Deus que libertara seu povo:

Viste a aflição de nossos pais no Egito, e lhes ouviste o clamor... Fizeste sinais e milagres contra Faraó e seus servos e contra todo o povo da sua terra, porque soubeste que os trataram com soberba; e assim adquiriste renome, como hoje se vê.

Neemias 9:9-10

Naquela noite, quando as famílias finalmente deixaram suas casas e tudo o que tinham como certo para seguir o Senhor em fé e obediência, elas não tinham idéia de que estavam fazendo história. Não podiam conceber que seus descendentes, até a geração dos tataranetos, estariam louvando esse evento, o que indica que você nunca saberá que prodígios e milagres resultarão da simples

A NOITE EM QUE NINGUÉM DORMIU 237

obediência. Dizer sim a Deus e caminhar na fé causam um impacto incalculável sobre o tempo e a eternidade.

Qual a situação quando eles partiram? Muitos têm a idéia de que se avançarmos realmente na fé e seguirmos a Deus por novos caminhos, a vida vai desmoronar. Dizemos a nós mesmos: "Se eu concordar com o plano dele e me pôr à sua disposição, vai ser complicado. Vai ser problemático e difícil. Vou ter de deixar tudo o que é confortável, familiar e seguro e seguir rumo a terras áridas".

No Salmo 105, o salmista faz alguns esclarecimentos sobre o Êxodo que Moisés (por ser muito ocupado) não registrou no diário do Êxodo.

Então fez sair o seu povo, com prata e ouro, e entre as suas tribos não havia um só inválido.

Salmo 105:37

Foi com esse espírito que se afastaram. Em meio a essa grande multidão, ninguém tropeçou. Não havia um único fraco no grupo. Todos estavam prontos para a viagem. Deus os preservara, dandolhes saúde e resistência para a jornada.

Alegrou-se o Egito quando eles saíram, porquanto lhe tinham infundido terror. Ele estendeu uma nuvem que lhes servisse de toldo, e um fogo para os alumiar de noite.

Salmo 105:38-39

Deus cuidou bem deles. Ele os guiou e iluminou o caminho.

E conduziu com alegria o seu povo, e com jubiloso canto os seus escolhidos.

Salmo 105:43

Não é magnífico? Em lugar de tristeza e medo, houve júbilo naquela noite. A doce fragrância da liberdade estava no ar. Gostamos de cantar o hino: "Ó, quem me dera ouvir mil vozes cantando louvores ao meu Redentor!"2 E o que dizer disto: "Ó, quem me dera ouvir dois

238 MOISÉS: UM HOMEM DEDICADO E GENEROSO

milhões de vozes cantando!" Era possível ouvir o eco dessas vozes até em lugares distantes no deserto desolado, enquanto Moisés guiava a multidão, que o seguia alegre. Grandes nuvens de pó subiam à medida que os filhos de Jacó partiam do Egito, deixando as correntes e a escravidão. (Estou sorrindo no momento em que escrevo isso, porque me ocorreu um pensamento: É isso mesmo! Que maneira de viajar!)

Pense naquele dia ou naquela noite em que você conheceu o Senhor Jesus como seu Salvador. Será que pode sentir novamente as emoções daquele momento? Lembra-se de quando aquele amigo lhe contou as Boas Novas sobre a providência divina para o pecado e a oferta dele da vida eterna? Lembra-se de quando percebeu que isso era realmente para você? Lembra-se de quando aquele pastor ou professor explicou o evangelho e, pela primeira vez, ele fez realmente sentido? Lembra-se de quando seu pai ou sua mãe sentou-se com você em seu quarto e explicou a verdade sobre o pecado, Cristo e a eternidade, e você disse: "Tem de ser esta noite?"

Foi uma experiência difícil, complicada? Admita: você deixou todas as coisas familiares do Egito para trás, mas não se esqueça de que deixou também as correntes! Afastou-se de anos de escravidão e começou então a saborear a provisão de Deus. Começou a beber dos mananciais profundos de sua graça. Nunca algo tivera sabor tão doce e refrescante.

Contudo, não acabou, amigo. Há mais lá fora. O plano dele é muito mais amplo do que tirar você do Egito. Pôr você na sua família é o Plano A. Submeter você à vontade dele para o resto de sua vida é o Plano B. Você talvez já faça parte desse plano no momento em que lê estas linhas. Encontra-se a ponto de entrar em território desconhecido e seguir a Deus a locais onde nunca esteve antes. Observando a situação com olhos dos hebreus antigos, você está prestes a fazer história.

Lembro-me de ter estado há anos diante de uma grande audiência de jovens no centro de conferências Forest Home, no sul da Califórnia. Os alunos presentes variavam do segundo grau à faculdade. Foi uma experiência notável. Eles não compareceram para uma festa nem para serem entretidos, embora a diversão fizesse também parte da agenda.

A NOITE EM QUE NINGUÉM DORMIU 239

Levaram Bíblias, blocos de notas e lápis apontados, e seu interesse se concentrava no Livro. Foi uma daquelas vezes nas quais senti, como orador, que o grupo tragava o que eu dizia. É difícil explicar, a menos que tenha passado por algo assim como professor, mas é uma experiência inesquecível. Aquele grupo parecia uma esponja, absorvia tudo, e extraía cada vez mais de mim e da Palavra.

Embora fosse uma audiência jovem e entusiasmada, não estávamos sequer falando de missões ou serviço cristão; abríamos caminho em Neemias, lutando com princípios de liderança e obediência a Cristo. Mais tarde, um jovem se aproximou de mim e disse: "Pastor Chuck, preciso falar com o senhor".

"Claro", respondi. "Vamos nos sentar naquele canto." Sentamo-nos num lugar sossegado, e ele começou: "Tenho... tenho um sentimento estranho, engraçado até, mas acho que Deus quer a minha vida".

O rapaz olhou para mim para ter certeza de que eu tinha entendido. Seus olhos começaram a marejar-se.

"Você conhece pessoalmente o Senhor?" perguntei. "Conheço sim", ele disse. "Na verdade, planejo ser médico." "Verdade?" "Verdade. Preciso então saber qual o plano dele." De repente, ele começou a chorar. Estava tão profundamente comovido que mal podia expressar-se. Passei meu braço ao redor de seus ombros.

"Olhe, não vá à nossa reunião desta noite. Tire uma folga. Fique a sós com Deus."

"O que devo fazer então?" "Apenas diga a Deus o que está me dizendo. Peça que o ajude a entender o que ele quer de você. Peça que mostre o plano dele para a sua vida."

A última vez que o vi naquela noite, ele caminhava pela trilha a fim de se manter a sós com o seu Senhor. Na manhã seguinte, bem cedo, o jovem veio falar comigo perto da lareira. "Sabe de uma coisa?" disse ele com a expressão séria, "Deus quer que eu seja um médico missionário".

240 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Com um braço enlacei seus ombros e apertei-os por alguns momentos. "Olhe, isso é fantástico", respondi.

"Bem, acho que não há nada de errado com isso, há?" Ele parecia tão sério e assustado que eu quase ri. "Claro que não, homem, você acertou no alvo. Toda a sua carreira vai adquirir uma nova dimensão."

Na mesma conferência, um homem de cerca de quarenta anos veio falar comigo. Ele não fazia parte do grupo de jovens, mas estava lá porque sabia tratar-se de uma conferência minuciosa, na qual teria tempo para refletir sobre algumas questões de sua vida. Esse indivíduo era um executivo de seguros muito bem-sucedido, com responsabilidades sobre uma grande área no sul da Califórnia.

"Chuck", disse ele. "Deus está realmente falando comigo. Parece que ele está mudando completamente a direção da minha vida. Penso que quer usar-me fora dos Estados Unidos."

Soube mais tarde por uns amigos dele que sua vida tinha tomado uma direção inteiramente nova depois daquela conferência. O que mais me surpreendeu foi que eu nunca mencionara a questão de missões mundiais. O assunto em pauta era obediência. Uma vez, porém, que as pessoas começaram a colocar-se à disposição do Senhor, abrindo a vida para sua orientação, as coisas começaram a acontecer. Novas direções e novos caminhos se "abriram perante eles, como para os hebreus que saíram do Egito naquela noite da primeira Páscoa.

E você? Talvez você nunca tenha considerado a possibilidade de que há um propósito divino para sua vida, além da rotina normal de trabalho hoje. Pense nisso. Por que o Senhor não chamaria você para algum aspecto do serviço vocacional dele? Se não sabe a resposta, sugiro que reconsidere a questão.

Você já ouviu isso antes, e continua tão verdadeiro como quando foi pronunciado pela primeira vez. Depois de todos os livros de história terem sido escritos, depois que o tempo acabar, só duas coisas permanecerão neste mundo, só duas coisas são eternas: a Palavra de Deus e as pessoas. É bem possível que ele queira que você

A NOITE EM QUE NINGUÉM DORMIU 241

se diplome nesses dois aspectos pelo resto da sua vida. Você jamais saberá se não perguntar a ele.

Quer uma sugestão? Trabalhe nisso como se fosse um projeto. Como parte de sua vida de oração, não deixe de perguntar a ele: "Senhor, estou no centro do seu plano? Quer continuar me usando nesta aptidão? Tem alguma outra coisa em mente para mim, em outro lugar? Estou disponível, Senhor. Estou disponível para permitir que mude toda a minha perspectiva de vida".

Ele poderá lhe dizer: "Filho", ou, "filha, você está exatamente onde quero que esteja, continue assim. Confie em mim e vou abençoar e usar você".

Ele pode dizer também: "Agora finalmente tenho toda a sua atenção. Quero usá-lo no lugar de minha escolha. Calce suas sandálias e esteja preparado para viajar com bagagem leve. Nós vamos fazer história!"

Tudo começa com a obediência.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$As pragas faziam parte do plano deliberado de Deus, não de uma reação improvisada; como isso fortalece sua confiança de que Deus tem propósito até nos juízos e nas dificuldades que você enfrenta?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Faraó tinha o coração endurecido como carvalho e perguntou "quem é o Senhor?"; em que área você percebe sua própria teimosia resistindo à voz de Deus?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Às vezes Deus precisa de medidas drásticas para chamar a atenção de um coração endurecido; de que maneira Ele tem tentado captar a sua atenção ultimamente?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Entre o Diabo e o Mar Vermelho$t$, 11,
$conteudo$A s pessoas utilizam as mais variadas expressões para descrever uma dificuldade. Você provavelmente sabe o que é "estar num aperto". Se gosta de cozinhar pode estar "num apuro" ou "numa enrascada". Também pode estar em alguma situação que o deixe "entre a cruz e a espada". Há diversos tipos de expressões. Os estrangeiros que tentam decifrar algumas delas talvez cocem a cabeça confusos ao ouvir coisas como "subir pelas paredes", "estar em cima do muro", "sentir-se acuado" e "remar contra a maré".

Ouvi recentemente uma ótima descrição sobre uma situação difícil: a dificuldade ocorre quando um advogado especializado em processos de imperícia médica precisa submeter-se a uma cirurgia grave. Isso é uma situação difícil.

É possível que você esteja passando por uma situação difícil neste exato momento. E provável que se encontre nessa situação por causa de uma série de decisões imprudentes que tomou. Ou quem sabe essa situação não seja produto de alguma falha da sua parte; ela ocorreu em razão de circunstâncias fora de seu controle. O impacto sobre você pode ter sido causado pela falha de outra pessoa.

Sua situação crítica pode estar ligada a um filho que não caminha com o Senhor. Ele cresceu e abandonou o ninho; já passou da

244 MOISÉS: UM HOMEM DEDICADO E GENEROSO

idade de ser disciplinado e você quer, de todo o coração, que esse rapaz caminhe com Deus. Qualquer coisa que diga pode piorar a situação; calar-se poderia ser menos do que deve fazer. Você está numa enrascada. Numa situação difícil.

Seu problema pode estar relacionado a seu trabalho e se disser algo para aliviar a pressão, as coisas podem piorar. Alguém poderia também ficar em má situação se você arregaçasse as mangas e tentasse resolver o problema por própria conta.

A situação difícil talvez tenha ligação com alguma coisa na escola ou em sua casa. Pode ser uma questão interligada a outras. Seja lá o que for, você se sente espremido num íugar apertado e não vê saída. Está numa situação difícil.

Thomas Paine referiu-se a essas situações como "aquelas crises que testam a alma dos homens". E elas testam mesmo, não testam? Talvez as rugas em seu rosto estejam ficando mais longas e profundas, porque, por mais que tente, a dificuldade se apega a você como perfume barato. Não consegue livrar-se dela.

Se essa for sua história, sinto-me feliz por anunciar que irá encontrar certo alívio em Êxodo 14. Esse capítulo descreve a situação mais delicada que Israel já enfrentara, contudo os israelitas viveram para contar a história. E foi o que fizeram! Ela tornou-se o evento mais celebrado em toda a existência judaica.

Quais as lições que você pode então extrair de uma dificuldade? E bem possível que a única solução para ela seja um milagre. Foi isso que Israel aprendeu.

SEGUINDO DEUS... A UM BECO SEM SAÍDA

Os israelitas viveram no Egito durante toda a vida. Nenhum deles prestes a ser libertado por Deus tinha nascido e se criado fora do Egito. Seu estilo de vida era completamente egípcio. Adotaram os hábitos, os modos, o estilo, o próprio cheiro do Egito (cebola e alho!). Por causa disso, Deus teve de ensinar a seu povo um novo estilo de vida. Para isso, porém, teve de chamar primeiro a sua atenção. Esse é o motivo de tê-los levado ao mar Vermelho — uma dificuldade com 'D' maiúsculo.

ENTRE O D [ABO E O MAR VERMELHO 245

Antes de examinarmos Êxodo 14, vamos voltar a um versículo do capítulo anterior: "Porém Deus fez o povo rodear pelo caminho do deserto perto do mar Vermelho" (Ex 13:18).

Note a frase: "Deus fez o povo rodear pelo caminho..." O povo de Israel chegou a esse impasse guiado por Deus. Sua dificuldade não foi um acidente. Não foi uma direção ou um cálculo errado. Ele sabia que precisavam da experiência do mar Vermelho para aprender algumas coisas que queria ensinar-lhes. Esta foi uma das lições valiosas que precisaram aprender bem cedo em sua jornada.

Veja a seguir Êxodo 13:21. Moisés escreve: "O Senhor ia adiante deles". Deus então tanto os "guiava" como "ia adiante deles". Como Deus ia adiante deles? Você vai achar isso interessante:

O Senhor ia adiante deles, durante o dia numa coluna de nuvem, para os guiar pelo caminho, durante a noite numa coluna de fogo, para os alumiar, a fim de que caminhassem de dia e de noite. Nunca se apartou do povo a coluna de nuvem durante o dia, nem a coluna de fogo durante a noite.

Êxodo 21-22

Incrível, não é? Você e eu nunca experimentamos nada assim, mas os israelitas no deserto não ficaram um único instante sem essa experiência.

Você tem lutado recentemente contra a vontade de Deus? Eu tenho. Algumas das minhas maiores lutas envolvem o discernimento do desejo e dos caminhos dele. Tive inveja da nuvem que guiava os israelitas durante o dia e da coluna de fogo que os alumiava à noite. Que simples! Tão fácil quanto a brincadeira chamada de "Siga o Mestre".

Quando a nuvem avançava, eles avançavam. Quando ela ia para a direita, eles também iam. Quando ia para a esquerda, eles a acompanhavam. Quando recuava, recuavam também. Quando parava, paravam. Perfeitamente claro. Nada a decifrar — apenas siga a nuvem.

À noite, quando a nuvem não podia ser vista, Deus se transformava numa coluna de fogo. Afastava assim as feras do deserto,

246 MOISÉS: UM HOMEM DEDICADO E GENEROSO

mantinha o povo aquecido e dava-lhes orientação infalível. De dia ou de noite, tudo o que tinham a fazer era erguer os olhos e lá estava a presença indiscutível de Deus. "O Senhor ia adiante deles", dizem as Escrituras.

Isso não seria ótimo? Suponhamos que você quisesse saber se era vontade de Deus que se mudasse. O que faria? Ergueria os olhos. Lá está a nuvem! Ela está se movendo na direção de Goiás. Arrume as malas! Ou está se perguntando se é a vontade de Deus que trabalhe em determinado lugar. O que faz? Basta observar o fogo. Ele se move até uma empresa e pára sobre ela. E hora de ir até lá e candidatar-se ao trabalho. Ou você está namorando uma jovem e se interroga se ela pode ser a escolha de Deus para sua companheira. Sem problemas! Ela abre a porta do apartamento e lá está a nuvem flutuando sobre sua linda cabeça. Não resta dúvida. Compre o anel. Peça-a em casamento.

Tudo era simples assim para os israelitas quando se tratava de seguir a direção de Deus. Eles nunca tiveram dúvidas, nunca tiveram de tomar decisões. A coluna de fogo à noite e a nuvem durante o dia conduziram diretamente ao mar Vermelho e os detiveram ali. Por quê? Por que Deus os encurralou num lugar apertado?

Êxodo 14:1 começa a nos dar uma resposta: "Disse o Senhor a Moisés". Veja bem, Deus falou a Moisés porque esse líder fora preparado. Lembre-se, é um jovem de oitenta anos. Aprendeu suas lições. Fez as tarefas de casa no deserto de Midiã. Moisés descobriu que não se discute com Deus. Quando Deus diz: "Vá para o mar Vermelho", você monta em seu cavalo. Não espera. Deus disse então a Moisés:

Fala aos filhos de Israel que retrocedam e se acampem defronte de Pi-Hairotc, entre Migdol e o mar, diante de BaalZefom; em frente dele vos acampareis junto ao mar. Então Faraó dirá dos filhos de Israel: Estão desorientados na terra, o deserto os encerrou. Endurecerei o coração de Faraó, para que os persiga, e serei glorificado em Faraó e em todo o seu exército; e saberão os egípcios que eu sou o Senhor. Eles assim o fizeram, (w. 2-4)

ENTRE O DIABO E O MAR VERMELHO 247

Isso parece bem simples. Antes do Êxodo, os hebreus haviam morado na terra de Gósen, numa localidade chamada Ramessés. Quando o Êxodo ocorreu, os hebreus saíram de Ramessés e viajaram para o sul, chegando a Etã. E ali acamparam. Foi então aparentemente nesse lugar que o Senhor falou com Moisés e lhe deu a mensagem que acabamos de ler. Enquanto estavam em Etã, o Senhor disse: "Vão a Baal-Zefom". Em outras palavras " Voltem. Repitam todos os passos que acabaram de dar, regressem a Baal-Zefom". (Se tiver um mapa antigo à mão, verifique.)

O problema era que Baal-Zefom formava um perfeito beco sem saída geográfico. Uma rua sem saída. Ao norte ficavam algumas formidáveis fortalezas egípcias — estruturas de pedras maciças. Não podiam passar por elas. Ao sul havia o vasto deserto egípcio chamado Mizraim. Nada seguro. Para o oeste ficavam Ramessés e Gósen. Eles tinham acabado de vir de lá. Não podiam voltar ao Egito. Ao leste havia o mar Vermelho, hoje Golfo de Suez. A região mais ao norte desse golfo era o mar de Sargaços, quase sempre chamado de mar Vermelho.

Deu para entender? Eles ficaram olhando para as águas do mar Vermelho. Ao norte, fortalezas inimigas. Ao sul, o deserto ardente. A oeste, o Egito. Estavam encurralados. Não havia porta dos fundos — uma armadilha geográfica que não deixava possibilidades de fuga.

QUEM PRENDEU QUEM NA ARMADILHA?

Deus, porém, disse: "Vão a Baal-Zefom". Em termos militares, era o ponto mais vulnerável de todos. Seria como entrar numa rua sem saída ao ser perseguido por um carro cheio de ladrões. Em termos humanos, essa seria a decisão mais insensata do mundo. Contudo, foi exatamente isso que Deus ordenou que fizessem.

Moisés caminhara com Deus o suficiente para saber que embora as direções do Senhor parecessem insensatas, ele não devia questionálas. Deus foi também bondoso o suficiente para dizer: "Olhe, Moisés, tenho um plano bem-feito. Enquanto andarem de lá para cá no deserto, Faraó vai ouvir, por meio informal, que vocês estão caminhan-

248 MOISÉS: UM HOMEM DEDICADO E GENEROSO

do sem rumo, e pensará: Ah, eles estão indo para o norte, para BaalZefom. Vou emboscá-los ali! Essa, Moisés, é a armadilha na qual Faraó vai cair".

Deus arranjara tudo antecipadamente — ele sempre faz isso. O Senhor queria lutar nas batalhas dos hebreus no lugar deles. Durante toda a vida eles travaram suas próprias batalhas. Tinham se organizado e enfrentado a todos, capacitados pela própria força. O Senhor diz, porém: "Não, Moisés. Quero que meu povo aprenda que vou lutar por ele. Tudo o que tem a fazer é esperar e confiar. Siga então a nuvem até Baal-Zefom".

A conspiração começa a se formar. Faraó reage exatamente como Deus havia previsto:

Sendo, pois, anunciado ao rei do Egito que o povo fugia, mudou-se o coração de Faraó e dos seus oficiais contra o povo e disseram: Que é isto que fizemos, permitindo que Israel nos deixasse de servir? E aprontou Faraó o seu carro, e tomou consigo o seu povo; e tomou também seiscentos carros escolhidos e todos os carros do Egito com capitães sobre todos eles. Porque o Senhor endureceu o coração de Faraó, rei do Egito, para que perseguisse os filhos de Israel; porém os filhos de Israel saíram afoitamente, (w. 5-8) ,

Pelo menos dessa vez Israel agiu precisamente como Deus ordenara. Eles começaram a ir para o norte, pensando: Deus está nisto. Vai ser uma grandiosa experiência. Marcharam então ousadamente em direção a Baal-Zefom e direto para as garras de uma situação difícil: "Perseguiram-nos os egípcios, todos os cavalos e carros de Faraó, e os seus cavalarianos e o seu exército, e os alcançaram acampados junto ao mar, perto de Pi-Hairote, defronte de Baal-Zefom" (v. 9).

A cena muda de repente. Imagine. Você está entre dois milhões num acampamento israelita. Viajou com o povo de Deus até esse beco sem saída no deserto. Moisés havia tomado a liderança e dito: "E aqui que Deus quer que fiquemos". Mas durante todo o tempo você esteve pensando: Pelo menos sei que há uma saída. Acabamos de

ENTRE O DIABO E O MAR VERMELHO 249

chegar, podemos sair da mesma maneira que viemos. Mas, de repente, você houve um ruído distante. Trovões? Uma tempestade se formando no horizonte? Olha para trás e vê uma nuvem de poeira se aproximando. Espere um pouco, esse estrondo não é de trovão; são cavalos e carros. Milhares deles. Todos os carros do Egito! Os boatos correm depressa: "Faraó está chegando. Vai haver um massacre!" E o pânico se alastra pelas fileiras de Israel como uma rajada de vento gelado. Você está quase ouvindo seu testemunho nestas palavras? "E, chegando Faraó, os filhos de Israel levantaram os olhos, e eis que os egípcios vinham atrás deles, e temeram muito" (v. 10).

Que eufemismo! Os hebreus não ficaram apenas com medo; ficaram com muito medo. Podemos dizer que morreram de medo ao ver os egípcios. "Então os filhos de Israel clamaram ao Senhor" (v. 10).

Esta é a primeira vez que ouvimos os filhos de Israel clamarem ao Senhor em massa. Não é notável como uma dificuldade modifica o espírito orgulhoso e independente? Você caminha com um ar de superioridade, parecendo um pavão humano. As coisas, porém, começam a mudar logo e não passa muito tempo até que suas forças chegam ao fim. De repente percebe: Nossa! Estou em apuros! Olha então para o alto e clama.

Não ficamos sabendo o que eles disseram, mas logo depois de terem clamado a Deus, começam a procurar um culpado. Não é geralmente assim que lidamos com um problema? Primeiro, se estamos em contato com Deus, clamamos. Segundo, se o alívio não surge imediatamente, começamos a procurar alguém para culpar.

Como é natural, escolheram o pregador: "Disseram a Moisés: Será por não haver sepulcros no Egito, que nos tiraste de lá, para que morramos neste deserto? Por que nos trataste assim, fazendo-nos sair do Egito?" (v. 11)

O que quero dizer é que numa dificuldade como essa, quem pode evitar de dizer: "Não avisamos?" Os israelitas jogaram isso na cara de Moisés: "Não é isto o que te dissemos no Egito: Deixa-nos, para que sirvamos os egípcios? pois melhor nos fora servir aos egípcios do que morrermos no deserto" (v. 12).

250 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Em outras palavras: "Preferiríamos estar em segurança, como escravos, no Egito, a sermos homens livres em perigo". Leia isso novamente. Eu diria que esses pensamentos são apenas uma perspectiva humana. Eles não estão mais com os olhos erguidos.

"NÃO TEMAIS!"

Em termos humanos, as dificuldades são experiências terríveis. Se você tiver de enfrentá-las por muito tempo, começará a questionar as próprias raízes de sua fé. Aos poucos começará a procurar um culpado; geralmente alguém da liderança. E dirá: "Olhe, aceitei o seu conselho. Fiz o que você disse. Mas aqui estou eu, com minhas forças quase no fim. Estou a um passo do abismo. Não haverá rede para me apanhar se cair. E você é a razão de eu ter feito isso!"

É por isso que fiquei extremamente impressionado com a resposta de Moisés. Ele não disse como a maioria é inclinada a dizer: "Deus ajuda aos que se ajudam". As pessoas pensam que esse ditado mesquinho está na Bíblia, mas não está. Ele vem lá das profundezas. Não, Deus ajuda os indefesos!St nos ajudamos, quem precisa de Deus? É quando nos desesperamos e ficamos solto no espaço que finalmente clamamos: "Meu Deus, me ajude!" E Deus responde: "Vou ajudar. Largue a corda". Qual é a nossa reação normal? "Há alguém mais aí em cima que possa oferecer ajuda?" Largar a corda é algo contrário à natureza humana. Mas Deus quer que façamos exatamente isso — cair em queda livre em seus braços eternos e confiar completamente nele. Tudo isso faz parte do seu plano.

Note a resposta mais bíblica de Moisés no versículo 13: "Não temais!" Que conselho estranho. Pode ouvir seus companheiros israelitas? "Ei, Moisés, os egípcios estão chegando. Eles têm carros, arcos e flechas, e lanças pontudas. Você ainda diz 'não tema'? O que há com você, homem? Precisa mudar a receita dos óculos? Não está vendo que eles estão quase aqui? Deus, salve-nos deste pastor míope!"

"Posso vê-los muito bem", respondeu Moisés. "Mas continuo dizendo a vocês: "Não temais!"

ENTRE O DIABO E O MAR VERMELHO 2 51

Moisés ainda não terminou. Ele tem um segundo conselho a dar a seu povo amedrontado. "Aquietai-vos". E um terceiro: "Vede". E um quarto: "O Senhor pelejará por vós, e vós vos calareis". Ouviu tudo isso? É muita coisa em qualquer tradução bíblica. Leia você mesmo:

Moisés, porém, respondeu ao povo: Não temais: aquietai-vos e vede o livramento do Senhor que hoje vos fará; porque aos egípcios, que hoje vedes, nunca mais os tornareis a ver. O Senhor pelejará por vós, e vós vos calareis.

Êxodo 13-14

Temos agora uma prescrição para as pessoas que estão numa dificuldade inevitável! Não tenha medo, aquiete-se, veja Deus agir, fique calado. A parte mais difícil é a quarta, porque temos de contar a alguém a situação difícil em que nos encontramos. Mas Deus não precisa ser informado. Ele conhece nossa dificuldade e espera que esperemos por ele e mantenhamos silêncio.

Quando você se encontra num beco sem saída, guiado por Deus para esse lugar estreito, é ali que vai descobrir algumas boas surpresas destinadas apenas a você. Essa é a razão de Moisés ter dito: "Vamos nos manter quietos. Há uma grande bênção aqui para nós e a perderemos se virarmos as costar e correr".

Você conhece a reação humana ao pânico? Primeira, temos medo. Segunda, fugimos. Terceira, lutamos. Quarta, contamos a todos.

O conselho de Deus é justamente o oposto. Não tenha medo. Aquiete-se. Observe a ação dele. Mantenha-se quieto. E então que ele age. Ele assume o controle! Ele lida com a situação de maneira exatamente oposta à nossa. O Senhor apenas bate levemente o pé, esperando que esperemos.

QUATRO PODEROSOS MILAGRES

Por mais extraordinário que pareça, os israelitas seguiram exatamente as instruções de Moisés, e Deus interveio novamente. (Ele sempre faz isso.) Realizou quatro coisas poderosas a favor dos israelitas.

252 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Primeira, o Senhor disse a Moisés que avançasse:

Disse o Senhor a Moisés: por que clamas a mim? Dize aos filhos de Israel que marchem, (v. 15)

Gosto disso. O oceano está à sua frente; portanto, marche! Moisés fez continência e, enquanto reunia as tropas, Deus agiu de novo.

Ele mudou a nuvem da frente para trás deles:

As Escrituras nos dizem: "Então o Anjo de Deus, que ia adiante do exército de Israel, se retirou, e passou para trás deles; também a coluna de nuvem se retirou de diante deles, e se pôs atrás deles" (v. 19).

O registro bíblico nos explica então por que Deus fez isso: "e ia entre o campo dos egípcios e o campo de Israel; a nuvem era escuridade para aqueles, e para este esclarecia a noite; de maneira que em toda a noite este e aqueles não puderam aproximar-se" (v. 20).

O que isso significa? Significa que a nuvem se movia da frente para trás dos hebreus, separando-os dos egípcios. Essa formação enorme e maciça de nuvens não só desceu do céu para a terra e bloqueou a visão dos egípcios, como também impediu que os hebreus olhassem para trás e tremessem de medo. A nuvem impedia que um visse o outro, de modo que os hebreus pudessem ouvir a Deus.

Foi então que Deus realizou um poderoso milagre.

Ele abriu caminho no mar:

Então Moisés estendeu a mão sobre o mar, e o Senhor, por um forte vento oriental que soprou toda aquela noite, fez retirar-se o mar, que se tornou terra seca, e as águas foram divididas.

Êxodo 14:21

Penso que o filme Os Dez Mandamentos, de Cecil B. DeMille, não capturou a realidade desse milagre na tentativa de torná-lo empolgante. Você sabe por que o vento soprou a noite inteira? Se as águas tivessem se partido repentinamente, os israelitas teriam caminha-

ENTRE O DIABO E O MAR VERMELHO 253

do na direção de um lodaçal. Qualquer leito de rio, cujas águas tenham sido recentemente drenadas, transforma-se em pântano por vários dias ou mesmo semanas. Leva tempo para secarem. Essa é a razão do vento leste. Assim, quando o mar se partiu em dois e suas ondas formaram enormes paredes verticais maciças, o vento leste soprou e fez secar a terra.

Imagine os israelitas lá, observando o vento divino soprar sobre o leito do oceano, secando-o até a lama virar pó. Deus preparou tudo para seu povo. No momento em que Deus fez cessar o vento, os israelitas passaram.

É claro que os egípcios também fizeram isso. Aqueles pagãos ingênuos! Caíram como patinhos na armadilha de Deus. Pensaram: "Se eles podem caminhar por entre as águas, nós também podemos! Vamos!" As Escrituras dizem: "Os egípcios, que os perseguiam, entraram atrás deles, todos os cavalos de Faraó, os seus carros e os seus cavalarianos, até ao meio do mar" (v. 23).

Deus agiu então pela quarta vez.

Ele criou confusão entre os egípcios:

Na vigília da manhã, o Senhor, na coluna de fogo e de nuvem, viu o acampamento dos egípcios, e alvorotou o acampamento dos egípcios; emperrou-lhes as rodas dos carros, e fê-los andar dificultosamente. Então disseram os egípcios: Fujamos da presença de Israel, porque o Senhor peleja por eles contra os egípcios.

Êxodo 14:24-25

Lembra-se do que o Senhor tinha dito? "Quando isso acabar, eles saberão que eu sou o Senhor." Mas nem todos estariam presentes para se lembrar de coisa alguma.

"Disse o Senhor a Moisés: Estende a mão sobre o mar, para que as águas se voltem sobre os egípcios, sobre os seus carros e sobre os seus cavalarianos" (v. 26). Foi então exatamente isso que Moisés fez. Ele se voltou e estendeu a mão para o mar. Ao nascer do dia o mar

254 MOISÉS: UM HOMEM DEDICADO E GENEROSO

voltou com força esmagadora ao seu estado normal. Os egípcios foram apanhados em meio à torrente impetuosa, e as Escrituras dizem: " E o Senhor derribou os egípcios no meio do mar" (v. 27).

Que contraste notável! Os hebreus, por outro lado, "caminhavam a pé enxuto pelo meio do mar; e as águas lhes eram quais muros, à sua direita e à sua esquerda" (v. 29). No momento em que os hebreus deixaram o leito das águas, os egípcios o invadiram. Foi quando Deus disse a Moisés: "Agora! Entre em ação. Faça as águas voltarem." E elas retornaram com toda a força.

Naquele dia, então, um massacre ocorreu em Baal-Zefom, mas os israelitas não foram as vítimas. No final do dia, não havia um soldado egípcio vivo dentre o grupo que perseguira os hebreus. Nenhum soldado egípcio sobreviveu à emboscada de Deus e nenhum hebreu se feriu.

O versículo 30 nos conta que posteriormente os hebreus passearam pela praia e "Israel viu os egípcios mortos na praia do mar". Note que a Bíblia não diz que os israelitas mataram um único homem. Ela não diz que eles se defenderam, porque não fizeram isso. Ela nem sequer diz que eles lutaram-, pois não lutaram. Eles esperaram, atravessaram o mar e depois se voltaram para observar Deus trabalhar. Ponto final. Foi ele quem fez tudo, exatamente como planejara, ao guiá-los no princípio a essa situação difícil.

Não é incrível o que Deus pode fazer sem nossa ajuda? Algumas vezes pensamos: Minha empresa precisa de mim. Minha igreja precisa de mim. Minha família precisa de mim. Ei, Deus também deve precisar de mim. Não, ele não precisa. Ele pode resolver tudo muito bem sem nós, por mais estranho que pareça. De fato, ele prefere que fiquemos de lado e deixemos os esforços na sua mão.

O ponto principal está no versículo 31, em que lemos que o povo de Deus ficou atônito: "E viu Israel o grande poder que o Senhor exercitara contra os egípcios; e o povo temeu ao Senhor, e confiaram no Senhor, e em Moisés, seu servo" (v. 31).

Depois da batalha reinou um silêncio reverente. Quando viram o que Deus tinha feito, um enorme respeito se disseminou naquela costa litorânea. Eles deram glória a Deus e olharam para Moisés com outros olhos.

ENTRE O DIABO E O MAR VERMELHO 255

Os historiadores e arqueólogos incrédulos nos ajudaram a ter novas suposições sobre esse evento memorável. Descobertas arqueológicas em obeliscos e outros registros indicam que os egípcios não voltaram a esse lugar durante dezessete anos depois que o milagre aconteceu. Tinham medo dele. De fato, não tentaram recuperar sua influência sobre a Síria durante os vinte e dois anos seguintes ao incidente. Só depois do vigésimo terceiro ano tentaram restabelecer sua autoridade sobre a região ocidental da Síria. A mensagem que havia chegado ao Egito era de que Deus tinha visitado o mar Vermelho e que o lugar tornara-se então um lugar pouco amistoso para os egípcios e se manteria assim durante longo tempo.

MILAGRES DA REDENÇÃO

A travessia do mar Vermelho é para o Antigo Testamento o que a Ressurreição é para o Novo. Quando os profetas e escritores do Antigo Testamento queriam referir-se à mão milagrosa de Deus, eles retomavam mais esse evento do que qualquer outro. Do mesma modo, quando um escritor do Novo Testamento queria ilustrar o poder de Deus, na maioria das vezes se referia à Ressurreição. O que a Ressurreição é para o Novo, a travessia do mar Vermelho é para o Antigo. Embora as cenas sejam completamente diferentes, ambos são milagres estupendos de redenção pela mão de Deus.

LIÇÕES APRENDIDAS N U M CANTO

O décimo quarto capítulo de Êxodo nos oferece algumas lições eternas. Para aprendê-las, vamos começar considerando Romanos 15:4, um dos versículos mais eloqüentes do Novo Testamento, que afirma o valor do Antigo. Paulo escreveu: "Pois tudo quanto outrora foi escrito, a fim de que, pela paciência, e pela consolação das Escrituras, tenhamos esperança".

Em outras palavras, Deus pôs verdades no Antigo Testamento, a fim de que nós, nesta era da graça, pudéssemos extrair alguns concei-

256 MOISÉS: UM I-IOMEM DEDICADO E GENEROSO tos profundos que causam impacto na vida até hoje. Encontrei em Êxodo 14 quatro pensamentos desse tipo.

Situações difíceis são necessárias para quebrar os hábitos de uma vida.

Por que Deus nos determina, hoje, lugares como Baal-Zefom? Pela simples razão de que muitas vezes é necessário um lugar assim para que nos livremos finalmente de padrões de pensamento e comportamentos que nos mantiveram reféns durante anos.

Você pode ter desenvolvido um estilo de vida bastante humano. Do mesmo modo que Moisés, você pode ter convivido com o povo "do Egito" a maior parte de sua vida. Trabalha com egípcios. Pensa como os egípcios. Lê jornais egípcios. Ouve música egípcia. Trava batalhas comerciais com empresários egípcios. Faz parte do mundo competitivo dos egípcios. Portanto, é apenas natural que reaja como um deles. Certo? É um mundo cruel!

Será? Se essa for sua situação, então em breve, meu amigo, você pode entrar em alguns lugares severos, se já não estiver lá.

Quando Deus quer quebrar os hábitos egípcios, ele dispõe seu povo em alguns cantos inviáveis. Eu já descobri que quanto mais duram os hábitos, tanto mais severos são os lugares. Quanto mais arraigados os comportamentos, tanto mais inviável o beco sem saída.

Chesty Puller foi um oficial da Marinha dos Estados Unidos que recebeu várias condecorações. Na época em que comandava um numeroso grupo de fuzileiros navais em combate, entrou inadvertidamente numa área inimiga. De repente, percebeu que ele e seus homens estavam completamente cercados. Um pelotão de inimigos se achava ao norte, assim como nos dois flancos. Atrás, outra companhia. Todas as vias de fuga estavam bloqueadas. Como Puller agiu? Ele apenas cerrou os punhos e disse: "Isso é ótimo. Não vão escapar desta vez!"

É assim que Deus age em algumas das nossas lições. Para que elas sejam gravadas em nosso coração, temos de estar cercados, sem possi-

ENTRE O DÍABO E O MAR VERMELHO 257

bilidade de fuga. Então aprendemos. Talvez por isso você esteja numa situação complicada. Quem sabe precise de um milagre divinamente inspirado na sua vida para mudar um padrão de hábito que o persegue há anos. Deus tem um Baal-Zefom para você experimentar antes de ser libertado — antes que o mar Vermelho se abra.

Quando espremido de todos os lados, a única coisa a fazer é olhar para cima.

Quando não há possibilidade de escapatória para a frente ou por trás, para a esquerda ou para a direita, somos forçados a olhar para cima. Lembre-se, os israelitas só clamaram ao Senhor quando se viram espremidos de todos os lados. Annie Johnson Flint escreveu:

Pressionado sem medida e de todos os lados; Pressionado intensamente, além de todas as suas forças.

Pressionado no corpo e na alma; Pressionado na mente, até que ondas escuras o engolfem;

Pressão dos inimigos, e pressão dos amigos; Pressão e mais pressão, até que a vida quase se acabe.

Pressionado a amar o bordão e a vara; Pressionado a não conhecer outro auxiliador, senão Deus.

Pressionado à liberdade sem quaisquer amarras; Pressionado a ter fé para alcançar as coisas impossíveis.

Pressionado a viver no Senhor; Pressionado a viver a vida abundante de Cristo.1

Talvez seja por isso que você se encontre sob tamanha pressão — para chegar ao fim de suas forças. Jamais esquecerei o conselho de minha boa e fiel mãe. Ela costumava dizer: "Filho, não se preocupe tanto com fulano. Ele precisa chegar ao fim de suas forças e então vai aprender". Muitas vezes essa é a única maneira em que realmente aprendemos.

258 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Se o Senhor vai receber a glória, é ele que deve combater.

Essa é a lição mais difícil, porem, a mais útil das quatro. Se deseja que o Senhor receba mesmo a glória — e isso de todo o coração — você precisa delegar a ele a liberdade para lutar. É claro que haverá ocasiões e lugares em que você deverá envolver-se. Algumas vezes você é parte da resposta. Não me refiro a essas ocasiões, mas aos impasses impossíveis, quando se acha entre a cruz e a espada proverbiais, e Deus o pôs nessa dificuldade, sem nenhuma escapatória.

Ele quer lutar por você nessas situações. Quer que se renda em completa entrega. Quer que fiquemos quietos e observemos sua obra. Desse modo, quando a vitória é alcançada, o aplauso vai para ele, pois quer receber a glória.

Em meu diário pessoal escrevi certa vez:

Quando entro em pânico, fujo. Quando fujo, perco. Quando perco, Deus espera. Quando espero, ele luta. Quando ele luta, vence. Quando ele vence, eu aprendo.

Se nós estivéssemos encarregados do projeto do mar Vermelho, teríamos lidado com ele de modo diferente. Nosso grupo de engenheiros iria deter as águas com uma semana de antecedência. Teríamos instalado ventiladores enormes para secar a terra. Colocado imensos sinais luminosos. Alguém levaria barraquinhas para vender cachorro-quente e refrigerantes. Veja bem: quando as pessoas fazem as coisas, o projeto adquire todas as características humanas. O sobrenatural é eclipsado pela engenhosidade humana.

Esse não é o plano de Deus. Quando ele quer que você fique encurralado, ele mesmo faz isso. Não há também sinais. Não há uma campanha de marketing. Nem grandes recursos humanos nos quais confiar. Só existe um mar Vermelho intransponível e um exército de impossibilidades. Então você espera. E o tempo passa. Ele vai com-

ENTRE O DIABO E O MAR VERMELHO 259

bater a seu modo e no seu tempo. Roa as unhas quanto quiser — ele não tem pressa.

O mar Vermelho abre e fecha conforme as ordens do Senhor, e não antes.

Você sabia que o relógio é um dos maiores impedimentos para uma vida de fé? Deus não conta o tempo como nós. Algumas vezes ele trabalha às três da manhã, outras, ao meio-dia. Ele até trabalha aos domingos. O Senhor faz coisas notáveis, sem levar em conta nossa hora do dia. Ele não se curva ao nosso contador de tempo. Não salta ao ouvir a campainha de alarme. Ignora nossos prazos e elimina nossas muletas. Vai deixar aquele mar Vermelho específico absolutamente fechado, sem uma abertura, sem um sinal, até que tenha terminado de nos ensinar as lições que temos de aprender. Uma vez feito isso, ele não tem problema em partir as águas e deixar-nos atravessar.

Baal-Zefom, porém, tem de fazer seu trabalho. E os resultados? Você não vai ver um milagre — você será o milagre. Essa é a melhor parte.

Raymond Edman refere-se à "disciplina do adiamento" em seu excelente livro The Discipline ofLife. Ele escreve: "Vivemos dias impacientes, inquietos. Temos pouco tempo para preparativos e menos ainda para meditação e adoração. Sentimos que é preciso ser ativos e enérgicos, eficientes. Não podemos compreender a razão da inatividade, fraqueza, cansaço e aparente inutilidade serem nosso quinhão. Tudo parece muito insensato e inútil, sem plano ou propósito". A seguir o autor faz esta declaração profunda: "A demora que nos instrui e prepara poupa tempo, nunca o perde".2

"Hudson Taylor conheceu a provação que tempera o aço da alma. Ele era inválido, preso em casa, aos vinte e nove anos de idade. Depois de seis anos de serviço intensivo na China, estabeleceu-se com sua pequena família na zona leste de Londres. Os interesses externos diminuíram; os amigos começaram a esquecer-se dele e cinco longos e obscuros anos se passaram nas ruas tristonhas de um bairro pobre londrino, onde os Taylor ficaram 'limitados a orar e esperar'.

260 MOISÉS: UM HOMEM DEDICADO E GENEROSO

"À medida que os anos de obscuridade passavam, e quando a disciplina se completou, surgiu a Missão para o Interior da China, em princípio uma frágil raiz, mas destinada por Deus a encher o continente chinês com o fruto do evangelho."3

Quando nos lembramos do nome de Hudson Taylor, alguém por acaso menciona esses cinco anos de obscuridade numa parte pobre de Londres? Provavelmente não. Estamos muito mais inclinados a enfatizar as coisas notáveis a seu respeito. Lembre-se, porém, disto: A evangelização da China aconteceu porque um homem foi fiel nos bastidores, aguardando pacientemente com sua família, esperando o mar Vermelho se abrir.

Essa é uma lição para todos nós. Vamos ficar presos no beco sem saída até aprendermos a lição.

A COR DO SEU BECO SEM SAÍDA

Você está se sentindo encurralado? Contra a parede? Quase vazio? Ouça, filho de Deus, sua dificuldade é um projeto dele. São necessárias essas ruas tristes de Londres, esse Baal-Zefom sem saída para que se prepare para o dia glorioso de Canaã.

Você talvez seja solteiro. Esses podem ser anos difíceis de frustração e solidão. Você quer, acima de tudo, encontrar alguém, mas...

Ou você talvez seja casado. Pode estar tão envolvido em ganhar a vida que deixa de fazer uma vida, e então o tempo passa.

Ou talvez se sinta preso num beco sem saída físico, onde definha há semanas, meses, anos... ainda nessa cadeira de rodas.

Ouça cuidadosamente. Leia devagar. Chegar ao mar Vermelho é tanto parte do plano dele quanto o é atravessá-lo. É bem provável que o Senhor esteja quebrando um hábito nascido no Egito, um hábito que não tem lugar na vida em Canaã. Esses hábitos são difíceis de quebrar. As lágrimas correm enquanto Deus opera no seu tempo. Mas são no decorrer dessas lágrimas que Deus se torna muito importante e real — e compreendemos, finalmente, que uma dificuldade nas mãos dele é apenas uma estrada para a Terra Prometida.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Israel chegou ao beco sem saída do mar Vermelho guiado por Deus, e não por engano; como muda sua perspectiva saber que algumas das suas dificuldades foram permitidas por Ele para ensinar algo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você está hoje "numa situação difícil", espremido entre obstáculos sem ver saída; consegue crer que talvez a única solução seja um milagre que só Deus pode realizar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando você se sente acuado, lembra-se de que a mesma coluna de nuvem e de fogo que guiou Israel não os abandonou, e Deus também não o abandonará?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dieta Celestial versus Apetite Terreno$t$, 12,
$conteudo$O s professores da escola secundária têm um meio de fazer você amar ou odiar sua matéria. Eu tive sorte. Nos tempos de escola, Deus me deu uma professora que realmente fazia a história reviver. A sra. Allen não era fisicamente impressionante, ela era bem gorda, usava óculos pesados, tossia muito e coxeava. Mas, como ela gostava de história, especialmente da história americana! Mais surpreendente ainda, ensinou um grupo de garotos inquietos a gostar da matéria tanto quanto ela. Seu entusiasmo era contagioso.

Lembro-me de uma porção de coisas que a sra. Allen nos ensinou, mas uma declaração dela ficou gravada no meu cérebro todos esses anos. "Alunos", disse ela, "há duas coisas que vocês podem fazer com a história: ignorá-la ou aprender com ela".

Anos mais tarde, deparei-me com as palavras de um cínico que disse: "Uma coisa aprendemos com a história: é que não aprendemos nada com a história". Isso é lamentável, não é? Mas, se você aceitar um pouco de exagero, em princípio ele está quase sempre certo.

Pense nas lições que aprendeu há dez ou quinze anos. Não é notável que continue tentando dominar o mesmo assunto que julgou ter aprendido há tanto tempo? Nós, seres humanos, somos assim. Lutamos para aprender e manter como princípio fundamental e

262 MOISÉS: UM HOMEM DEDICADO E GENEROSO

permanente as lições transformadoras de vida mediante os erros de nossos antepassados. Mas, em vez disso, nossa tendência é repeti-los.

Não estamos sozinhos nisso. O mesmo já acontecia entre os hebreus antigos. Esse é o motivo de Paulo ter escrito aos crentes do primeiro século: "Irmãos, eu quero que vocês se lembrem do que aconteceu com os nossos antepassados que seguiram Moisés. Todos estiveram debaixo da nuvem e passaram pelo mar Vermelho" (1 Co 10:1, BLH).

O apóstolo enfatiza que todos os israelitas que deixaram o Egito com Moisés viram a mão de Deus nítida e poderosamente. Como observamos no capítulo anterior, o Senhor os guiou com uma nuvem durante o dia e com fogo à noite, libertando-os milagrosamente do cativeiro no Egito, conduzindo-os através do mar. Todos viveram para ver esse poderoso milagre com os próprios olhos. No versículo 5, o apóstolo, porém, conta: "Entretanto, Deus não se agradou da maioria deles".

Atenção a esse ponto! Todos viram a nuvem. Todos atravessaram o mar. Todos experimentaram esse poderoso livramento do mar Vermelho. Mas Deus não se agradou da maioria deles, "razão por que ficaram prostrados no deserto".

Paulo em seguida nos adverte: "Tudo isso aconteceu como exemplo para nós, para não querermos coisas más como eles quiseram" (1 Co 10:6, BLH). No versículo 10 ele acrescenta: "Vocês não devem se queixar, como fizeram alguns deles e foram destruídos pelo Anjo da Morte". Ele termina então as instruções, repetindo a advertência: "Tudo isso aconteceu com os nossos antepassados como exemplo para os outros, e estas coisas foram escritas como aviso para nós. Pois estamos vivendo numa época em que o fim dos tempos está chegando" (1 Co 10:11,BLH).

Quando Paulo diz: "Tudo isso aconteceu como exemplo para nós" (v. 6) e "estas coisas foram escritas como aviso para nós (v. 11), ele nos ensina que os israelitas não só estavam fazendo história, como a faziam em nosso benefício. Eles foram provados e falharam. Deus então registrou o resultado para aprendermos a não agir como eles. Deus não deu uma experiência no deserto para Israel simplesmente

DIETA CELESTIAL VERSUS APETITE TERRENO 263 para que vivesse de acordo com ela. Ele gravou permanentemente sua experiência na verdade viva, denominada Bíblia, para que pudéssemos aprender por meio da história, e não ignorá-la. Como se lêssemos um epitáfio solene numa lápide de granito, devemos aprender uma lição duradoura mediante este segmento da história hebréia.

Você talvez esteja dizendo com seus botões: "Não experimento mais tantos problemas do 'deserto'. Já passei por tudo isso. Cheguei ao ponto em que a vida é quase uma descida contínua". Se é assim que se sente, então o versículo 12 foi escrito especialmente para você: "Portanto, aquele que pensa que está de pé é melhor ter cuidado para não cair". Preste atenção! Até você pode aprender com a história, porque nosso Pai celestial muitas vezes repete suas mensagens, fazendo-nos passar por experiências no deserto só para manter nossa confiança nele.

CANTE!

Depois de Deus ter afogado todo o exército de Faraó no mar, pela primeira vez na história Israel se encontrou vivendo no deserto do Egito, ao ar livre, por conta própria. Os hebreus haviam iniciado sua caminhada para a terra de Canaã. Deus provara ser fiel, a nação atravessara o mar em terra seca. Como deviam estar perplexos! Começaram, então, a cantar um hino de louvor a Deus. Do versículo 1 ao 21 de Êxodo 15 eles permanecem cantando. Essa passagem das Escrituras registra esta cena:

A profetisa Míriam, que era irmã de Arão, pegou um pandeiro, e todas as mulheres a acompanharam, tocando pandeiro e dançando. E Míriam cantou para elas assim: Cantem ao Deus Eterno porque ele conquistou uma vitória gloriosa; ele jogou os cavalos e os cavaleiros dentro do mar.

Êxodo 15:20-21, BLH

Você já fez isso? Alguma vez, no impulso do momento, entoou uma canção de louvor a Deus? Recomendo que o faça; é, na verda-

264 MOISÉS: UM HOMEM DEDICADO E GENEROSO

de, uma experiência emocionante. Você diz: "Olhe, Chuck, isso pode ser bom para você, mas não sou esse tipo de poeta eloqüente, criativo. Não tenho essa habilidade. As palavras não fluem para mim desse jeito".

Verdade? Como sabe, se nunca tentou? Da próxima vez em que passar por uma prova e Deus se mostrar fiel, pare e pense: Talvez eu possa compor uma canção. (Mesmo que seja para uma audiência de Um só.) E assim que nascem os hinos de louvor. Você e eu estamos vivendo numa era belíssima, em que o povo de Deus tem expressado seu louvor a ele, escrevendo todo tipo de novos cânticos e coros, e até alguns hinos novos. Era isso que os israelitas faziam nessa passagem; nós a estamos retomando nesses dias.

Na seqüência desse cântico hebraico de triunfo e gratidão, vem uma palavra que denota um tempo específico: então. Quando? Depois do mar Vermelho. Depois do primeiro arroubo de liberdade. Depois da maravilhosa canção de louvor. As Escrituras registram: "Aí Moisés levou o povo de Israel do mar Vermelho para o deserto de Sur" (Êx 15:22, BLH).

Que descrição da vida cristã! Todos nós atravessamos o mar Vermelho. No plano espiritual, os crentes foram todos postos na família de Deus por meio da cruz. Passamos a conhecer o Senhor Jesus e, ao conhecê-lo, fomos libertados pela primeira vez do cativeiro da vida que levávamos antes. Quão glorioso! Livres do domínio de nosso antigo mestre, recebemos um novo cântico, uma nova vida, um novo começo. Mas, nesse começo, descobrimos rapidamente que devemos suportar algumas provas no deserto. Ao fazer uma retrospectiva, compreendemos mais tarde que eram desertos designados por Deus, para um propósito muito real. Mas que transformação depois de nossa travessia do mar Vermelho!

OS PRIMEIROS PASSOS NO DESERTO

Ao considerarmos o primeiro dia de Israel no deserto, talvez nos devêssemos lembrar de onde a nação israelita estava em Êxodo 15. Eles começaram a jornada na terra de Gósen. Se você tiver um mapa dessa região, deve examiná-lo para encontrar a localização. O mar Verme-

DIETA CELESTIAL VERSUS APETITE TERRENO 265 lho (ou mar dos Sargaços) ficava ao norte do Golfo de Suez. Eles atravessaram esse mar e depois iniciaram uma jornada na direção sul — sudeste até o monte Sinai. Antes de chegarem ao monte de Deus, passaram pelo deserto de Sur no extremo norte da península do Sinai. Foi ali que a coluna de nuvem e de fogo guiou Israel para o deserto, com o pastor Moisés à frente do rebanho. Aquela era uma vasta expansão desolada que se estendia do sul para o deserto de Etã.

Pouco mais tarde em Êxodo 15, leremos que os hebreus desceram para o deserto de Sim. É claro que estão no deserto — Sur, Eta, Sim. No meio de sua jornada, chegarão a um agradável oásis chamado Elim. Falaremos disso mais tarde.

Era ali então que os hebreus se encontravam. Mas por que estavam ali? Se Deus fez o povo atravessar o mar Vermelho, não poderia tê-los levado diretamente à terra de Canaã? Claro que sim! Se teve poder para abrir as águas, capacitá-los para andar na terra seca e livrá-los dos egípcios, não poderia ele guiá-los também rapidamente às fronteiras da terra que manava leite e mel? Lógico que poderia! Deus pode fazer qualquer coisa. Ele pode levar você e eu até a nossa conversão. Pode até apressar nossa viagem por esse deserto terreno e colocar-nos rapidamente no céu, sem problemas.

A propósito, isso não seria magnífico? Imagine um pouco, você conheceu Cristo, não sabe nada das dificuldades para alcançar a maturidade espiritual, nada de batalhas, conflitos, sofrimentos... e, de repente, Zum, seus pés tocam o pavimento dourado com canções de anjos soando em seus ouvidos. No momento em que você aceita Cristo e diz "amém", zum! cs tá na presença dele.

É possível que diga: "Olhe, não estou tão certo disso. Acho que gostaria de ter pelo menos uma idéia da vida crista na terra". Essa experiência pode ser de fato esplêndida, a menos que você se encontre em meio a uma forte provação. Quando está sendo testado — realmente testado — você anseia pelo céu. Você padece pelo céu. Muitos que escreveram tão convincentemente sobre o céu anos afora foram sempre aqueles que sofreram mais mágoas e problemas nesta terra.

Por que Deus nos faz passar pelas experiências do deserto antes de Canaã? De um lado, ele quer nos provar. Foi por isso que Deus

266 MOISÉS: UM HOMEM DEDICADO E GENEROSO

guiou Israel ao deserto, de acordo com Deuteronômio 8:2: "Lembrem-se de como o nosso Deus guiou vocês pelo deserto esses quarenta anos. Durante essa longa caminhada, Deus os humilhou e os pôs à prova para saber se estavam resolvidos ou não a obedecer aos seus mandamentos" (BLH). (Leia isso de novo... só que dessa vez mais devagar.)

Deus nos coloca no deserto para nos testar, esticar nossos músculos espirituais. Nossas experiências no deserto terreno são destinadas a transformar-nos em homens e mulheres de fé. Vamos enfrentar a realidade, nossas raízes espirituais só se aprofundam quando os ventos ao nosso redor são fortes. Remova as provas e nossa espiritualidade se fragiliza. Traga, porém, os ventos do deserto e o crescimento é notável, à medida que nossas raízes se agarram firmemente à fé.

O DESERTO EM MINIATURA

Êxodo 15:22-27 nos apresenta o deserto em miniatura. Durante quarenta anos o povo hebreu passou por um ciclo de eventos ilustrado nesses poucos versículos.

Em primeiro lugar está o ciclo da abundância, no qual o povo de Deus olha para o alto. Deus prova ser abundantemente fiel, e eles o contemplam em louvor. Essa é a primeira parte do capítulo 15, em que Israel canta louvores e grita: "Ele nos fez atravessar o mar Vermelho!" Eles estão olhando para o alto.

Em segundo lugar vem a expectativa. Quando o povo de Deus desfruta da abundância, ele espera abundância contínua. Aguarda onda após onda de bênçãos. Você talvez tenha feito isso recentemente. Deus tem expressado sua graça de maneira tangível e você recebeu abundância de algo. Se não ficar alerta, começará a esperar essa abundância como um direito pessoal. Isso é pouco realista e talvez não fosse bom para você. Tenho a certeza de que quando Israel deixou o mar Vermelho e seguiu para o deserto, o povo esperava contínua abundância e milagres que o mantivesse confortável, seguro e satisfeito. Estavam viajando no rrem da glória para Canaã e ninguém

DIETA CELESTIAL VERSUS APETITE TERRENO 267 imaginava que ele fosse frear ao longo do caminho. Olhavam para a frente, esperando abundância.

Isso nos leva ao terceiro passo no ciclo, desapontamento. Aqui, o povo de Deus olha para baixo. Sinta o desapontamento descrito no versículo 22 (BLH):

Aí Moisés levou o povo de Israel do mar Vermelho [abundância] para o deserto de Sur [expectativa; aguardavam passar por outra experiência semelhante à do mar Vermelho]. Eles caminharam três dias no deserto e não acharam água [desapontamento] .

Os israelitas começaram a olhar para baixo e não encontraram água. Eles fixaram os olhos nas circunstâncias. Até a água que finalmente localizaram era amarga e impotável. "Por isso chamou-se-lhe Mara" (v. 23). Marah é o termo hebraico para "amargo". Isso piorou a situação. Os hebreus acabaram achando água, mas ela era desagradável e amarga ao paladar. Por mais que tentassem, não conseguiam bebê-la. Era como morrer de sede no meio do oceano, tendo em volta apenas água salgada a qual não se podia beber. A frustração deles os desapontou.

Esse desapontamento leva ao quarto passo, reclamação. O versículo 24 nos diz: "E o povo murmurou". Presos nas garras do arrependimento mesclado com ressentimento, eles olharam para trás. Quando você se queixa e reclama como filho de Deus, geralmente é porque está relembrando dias melhores do passado.

Isso nos faz chegar ao quinto passo, provisão, que é denominado graça. Compreenda que você não a merece; mas, quando nos queixamos e reclamamos, Deus intervém para nos dar aquilo de que precisamos. Foi o que aconteceu ao povo de Israel. Eles olharam em volta e, subitamente, Deus interferiu e bondosamente satisfez a necessidade deles. "Então Moisés, em voz alta, pediu socorro ao Deus Eterno, e o Eterno lhe mostrou um pedaço de madeira. Moisés jogou a madeira na água, e a água ficou boa de beber. Foi nesse lugar que o Deus Eterno deu leis aos israelitas e os pôs à prova" (v. 25, BLH).

268 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Note especialmente as quatro últimas palavras: "(Ele) os pôs à prova". Essa é a principal razão de estarem no deserto. Nenhum filho de Deus "acontece" de ir para o deserto. Deus soberanamente prepara o deserto como um teste, inclusive o seu deserto.

O versículo 26 (BLH) merece atenção especial. Poderíamos escrever sobre ele: "Aprenda com a história":

Ele disse: Se vocês prestarem atenção no que eu digo, se fizerem o que é certo e se guardarem os meus mandamentos, eu não os castigarei com nenhuma das doenças que mandei contra os egípcios. Eu sou o Deus Eterno, que cura vocês.

O título de um livro publicado há muitos anos, None of These Diseases, foi inspirado nesse versículo. O Senhor disse aos israelitas: "Se me obedecerem, vou cercá-los com minha proteção. Serão provados, mas prometo que lhes darei toda provisão de que precisarem. Não direi sim a todos os seus desejos, mas satisfarei todas as suas necessidades". Portanto, o versículo 27 diz: "Depois os israelitas chegaram a Elim, onde havia doze fontes de água e setenta palmeiras. E acamparam ali, perto da água" (BLH). Que final maravilhoso! Primeiro, o deserto... finalmente, a água.

Vamos recapitular todo o ciclo, para certificar-nos de que o entendemos bem:

Abundância... olhamos para o alto.

Expectativa... olhamos para a frente. Desapontamento... olhamos para baixo. Reclamação... olhamos para trás. Provisão... olhamos em volta.

É como uma roda imaginária no tempo, girando sem parar. Você e eu estamos em algum lugar dessa roda neste momento. No geral, começamos e terminamos no mesmo lugar, apenas para repetir o processo. Por quê? (Estamos de volta ao ponto em que começamos este capítulo.) Pelo fato de não aprendermos com a história. Deveríamos, mas em nossa frágil humanidade, não conseguimos.

DIETA CELESTIAL VERSUS APETITE TERRENO 269

UM TRIO DETESTES

Vamos ao que interessa. Dedico o restante deste capítulo a todos os que murmuram. Você sabe quem são. Para ser sincero, descobri-me nas suas fileiras mais vezes do que desejaria admitir. Os capítulos 16 e 17 de Êxodo dão três ilustrações da vida real sobre o ciclo que acabamos de estudar. Deus fez seu povo passar por três situações — três longos testes que merecem nossa atenção: tempo, fome e sede.

O teste do tempo.

O versículo 1 começa: "Depois..." Quando? Depois de terem estado no oásis, depois de comerem as tâmaras, descansando à sombra das árvores, tomando a água fresca da primavera. Foi nesse momento que ocorreu o primeiro teste.

Depois partiram de Elim; e veio toda a congregação dos filhos de Israel ao deserto de Sim, que está entre Elim e Sinai, aos quinze dias do segundo mês, depois que saíram da terra do Egito.

Êxodo 16:1 (Almeida, Versão Revisada)

O tempo passou. Se você ler atenciosamente a passagem anterior que está no capítulo 15, vai observar que foram necessários três dias para eles encontrarem a água que agora tomavam. Mas já havia passado um mês e meio — mais de quarenta dias! Chamo isso de teste do tempo. Lá estão eles no meio do deserto com suas expectativas irreais. "Pensamos que estávamos livres daqueles dias de seca no deserto. Já estávamos ali há três dias. Por que temos de voltar?"

E sabe o que mais? As queixas se multiplicaram: "Ali, no deserto, todos eles começaram a reclamar contra Moisés e Arão" (16:2, BLH). Por que se queixavam? Estavam novamente olhando para trás. Ouça as palavras deles no versículo 3: "Teria sido melhor que o Deus Eterno tivesse nos matado no Egito! Lá, nós podíamos pelo menos nos sentar e comer carne e outras comidas à vontade. Vocês nos trouxeram para este deserto a fim de matarem de fome toda esta multidão".

270 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Estão pensando naqueles dias de abundância, quando desfrutavam das siestas à tarde, comiam sanduíches de peixe fresco e pão judeu no "velho e bom Egito". Eles tinham tudo o que queriam e mais ainda.

Parece a sua vida? Caso positivo, está na hora de aprender uma lição eterna. Se focalizar o passado, não demorará muito para que as queixas brotem de seus lábios. Você vai se lembrar de uma época anterior, banhada no brilho enevoado e róseo da lembrança, quando algo era melhor e mais confortável do que hoje. Ao comparar o passado e o presente, garanto que vai murmurar.

Eu faço isso; você também. Mas é uma grande tolice! Olhamos nostalgicamente para uma situação agradável do passado, em cuja ocasião (até mesmo naquela época!) você olhava para trás com saudade de um tempo também mais agradável que passou. Isso é bobagem, não é? Você pode estar se queixando neste momento de sua situação atual. Mas é bem provável que daqui a dois anos estará relembrando este momento e dizendo: "Ah, como eram bons aqueles tempos! Eram ótimos, não acha?"

Nós, de algum modo, esquecemos que em março deste ano resmungamos por nos concentrarmos em fevereiro do ano passado. Em fevereiro, por sua vez, lamentamos ao nos lembrar de janeiro do ano anterior, mas ele não foi tão bom quanto abril do ano retrasado. Pare! Vivemos à luz de um tempo ou de um prazer passado quando na verdade Deus continua a mostrar sua força ao longo de todo o caminho. Sentimos que por termos suportado o teste presente, não devemos experimentá-lo novamente.

E difícil passar pelas provações da vida e dói ainda mais repetir tais episódios. Contudo, sem essas mágoas profundas, temos pouca capacidade para receber conselhos ou avançar para a maturidade.

Durante a caminhada, Deus vai nos polindo mediante esses testes, nos esticando, nos quebrantando, nos reduzindo a uma confiança absoluta nele, quando dizemos: "Senhor, cheguei ao fim de minhas forças. Se quiser que eu morra neste deserto, eis aqui a minha vida. Tome-a. Recuso-me a olhar para trás e queixar-me do lugar em que me encontro no momento". Moisés aprendera a esperar. Sua congregação precisava também aprender.

O exame continuou, como o povo de Israel veio a descobrir.

DIETA CELESTIAL VERSUS APETITE TERRENO 271

O teste da fome.

Na última parte do versículo 3, os israelitas lamentam: "O Senhor nos trouxe a este deserto para matar toda esta congregação de fome". Eles ficaram com fome; e, como era de prever, começaram a resmungar. Contudo, embora seu povo se queixasse, Deus respondeu bondosamente à sua necessidade. Ele disse a Moisés: "Agora eu vou fazer chover do céu pão para vocês. E o povo deverá sair, e cada um deverá juntar uma porção que dê para um dia. Assim eu os porei à prova para saber se eles vão obedecer às minhas ordens" (v. 4, BLH).

Que instrução interessante. "Vou satisfazer sua fome, mas a satisfação dessa necessidade trará outra prova". Isso já aconteceu com você? Comigo já. Encontramo-nos em meio a um apuro do qual não podemos fugir. Deus diz então: "Vou ajudar; vou lhe mostrar o caminho". Aceitamos sua resposta, sua nova direção que nos leva a um novo conjunto de testes e provações de um tipo diferente. Enquanto somos libertados de um problema do deserto, ganhamos outro novo. Foi o que aconteceu aqui.

Então Moisés e Arão [sabendo que o maná estava a caminho] disseram ao povo: Hoje à tarde vocês ficarão sabendo que foi o Deus Eterno quem os tirou do Egito. Amanhã de manhã vocês verão a luz brilhante da presença do Eterno, pois o Eterno ouviu as reclamações de vocês contra ele. Foi contra ele, e não contra nós, que vocês reclamaram; pois, afinal de contas, quem somos nós? E Moisés continuou: E o Deus Eterno quem vai lhes dar carne para comerem de tarde e pão à vontade de manhã, pois o Eterno ouviu vocês reclamando contra ele. As suas reclamações são contra ele e não contra nós; pois, afinal de contas, quem somos nós? (w. 6-8, BLH)

Com a paciência esgotada, Moisés e Arão dizem: "Vamos pôr isto às claras, pessoal. Quem somos nós, para que reclamem de nós? Vejam, somos apenas humanos — carne e sangue como vocês. Além disso, a idéia não foi nossal Não guiamos vocês para o deserto. A direção veio de Deus. Não colocamos ali essa nuvem. Não acendemos a coluna de fogo! Portanto, não se queixem mais contra nós".

272 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Você costuma se queixar? Lembre-se, é Deus quem faz as suas circunstâncias serem como são. Não culpe outra pessoa. É útil lembrar que suas reclamações voltam diretamente para o Senhor. Suas queixas acabam aos pés dele.

Ouvi há muitos anos um corinho infantil que ficou gravado em minha mente. Nossa filha mais moça, Colleen, na época uma menininha sardenta, estava na primeira fila cantando essa música. Ela olhou para mim várias vezes enquanto cantava, e pensei: Essa é uma boa música para mim. Acho até que minha filha está cantando para mim. O título da música era Grumblers, de Thoro Harris. Lembrome ainda da letra:

Há pessoas, no campo ou na cidade, que estão sempre a se queixar. Reclamam, não importa o que digamos; Dia e noite sem parar.

Resmungam na cidade, resmungam no campo. Resmungam dos vizinhos e não acham isso mal. Resmungam dos maridos, resmungam das mulheres, Resmungam dos filhos [foi quando ela olhou para mim!] E o resmungão nunca progride, segue sempre sendo o tal. Eles resmungam quando chove e também quando não chove, Se as colheitas não amadurecem, suspiram e a colhem.

Resmungam dos preços e resmungam quando sobem, Resmungam o ano inteiro, resmungam até que morrem.

[Outro olhar!]

Ó, eles resmungam na segunda, terça e quarta, Também resmungam na quinta, Além de na sexta, no sábado e domingo,

Resmungam a semana inteira, ad infinitum.1

Bem convincente, não? Alguns de nós têm o hábito de resmungar, mesmo ocultando isso no domingo. Independentemente de estarmos no trânsito, à mesa, aguardando uma refeição, planejando algo de última hora com alguém, ou trabalhando com um grupo

DIETA CELESTIAL VERSUS APETITE TERRENO 273 difícil, tendemos a queixas e reclamações. É como se tivéssemos o "dom de reclamar" e acreditamos que é preciso pô-lo em prática, com vontade!

O único problema é que esse dom não aparece no Livro de Deus. Vamos verificar isso, companheiros. A Bíblia nunca aprova nossas queixas, implicâncias e murmúrios nas situações diárias. É surpreendente, mas o povo de Deus pode resmungar mesmo quando ele lhe dá alimento em abundância. Por quê? Porque não é a comida predileta. Nós queríamos bife; ele dá carne moída. Queríamos cordeiro; ele serve fígado. De muitos modos, nossas reações são como as de Israel:

À tarde apareceu um grande bando de codornas; eram tantas, que cobriram o acampamento. E no dia seguinte, de manha, havia orvalho em volta de todo o acampamento. Quando o orvalho secou, por cima da areia do deserto ficou uma coisa parecida com escamas, fina como a geada no chão. Os israelitas viram aquilo e não sabiam o que era. Então perguntaram uns aos outros: O que é isso?

Êxodo 16:13-15, BLH

Tenha em mente que esses hebreus não haviam lido o Livro de Êxodo, o que significa que nunca tinham ouvido falar do maná. Esta foi a primeira vez que apareceu o serviço de restaurante do céu. Deus o trouxe do alto e o distribuiu no solo como geada. Quando acordaram pela manhã, olharam em volta e perguntaram: "O que ífisso?"

Moisés lhes disse:

"Isso é o alimento que o Deus Eterno está mandando para vocês comerem" (v. 15, BLH).

"Vocês queriam pão", disse Moisés aos israelitas. "Comam agora. O deserto está cheio dele". O versículo 35 nos diz: "Durante quarenta anos os israelitas tiveram maná para comer, até que chegaram a uma terra habitada, isto é, até que chegaram à fronteira de Canaã". Isso é o que eu chamaria de abundância.

Mas sabem de uma coisa? Eles não gostaram disso também. Lá estavam no meio do deserto, com fartura de pão. No entanto, não era

274 MOISÉS: UM HOMEM DEDICADO E GENEROSO

o pão que queriam. Eles o detestavam, embora o Salmo 78 o chame de "pão dos anjos". A cada manhã, os anjos traziam essa refeição celestial e a espalhavam diante deles. Os israelitas não precisavam trabalhar para obtê-la. Não tinham de moer a farinha, amassá-la ou assá-la no fogo. Tudo o que tinham de fazer era comê-la, mas, mesmo assim, não gostaram. Sabe por quê? Porque olhavam para trás e a comparavam com o que haviam desfrutado antes. JE, portanto, se queixavam.

No Egito comíamos quanto peixe queríamos, e era de graça. E que saudades dos pepinos, dos melões, das verduras, das cebolas e dos alhos! Mas agora acabaram-se as nossas forças. Não há mais nada para comer, e a única coisa que vemos é esse maná!

Números 11:5-6, BLH

Imagine só! Eles assavam, cozinhavam, grelhavam, faziam bolinhos, comiam cru, cortavam — faziam tudo o que se pudesse pensar, até que não havia mais nada a fazer. Nunca passaram fome; mas, sabem de uma coisa? Continuavam não gostando disso.

Os resmungões são assim. Queixam-se quando não têm pão, mas quando o recebem, resmungam outra vez por não ser da variedade preferida. Quando obtêm essa variedade, resmungam porque preferiam experimentar outra coisa.

Para ser muito sincero com você, essa é a reação da carnalidade. Quando Deus escolhe bondosamente o que devemos comer, nos dá isso em abundância, e não ficamos contentes, a velha carne vai voltando aos poucos, e engasgamos com sua provisão. Operação carnalidade!

O teste da sede.

Êxodo 17, versículo 1, nos dá a terceira parte deste exame:

Tendo partido toda a congregação dos filhos de Israel do deserto de Sim, fazendo suas paradas, segundo o mandamento do Senhor, acamparam-se em Refidim: e não havia ali água para o povo beber.

DIETA CELESTIAL VERSUS APETITE TERRENO 275

No começo, não havia alívio do calor. Depois, não havia alimento. Agora, não havia água. Como o povo reagiu? Queixaram-se como antes? Sim, mas ainda pior dessa vez. O versículo 2 nos diz: " Contendeu, pois, o povo com Moisés".

A insatisfação e a carnalidade aumentaram. "Contender" é uma palavra mais forte do que "murmurar". Eles disseram antes: "Quem vai nos alimentar?" e murmuraram. Agora ameaçam. Franzem a testa e ordenam zangados a Moisés: "Dê-nos água para beber!" Moisés respondeu então: "Por que vocês contendem comigoT Quem pensavam que ele era? Como ele poderia provê-los de água? Se tinham uma contenda com alguém, era com o Senhor.

"Por que provam ao Senhor?" perguntou Moisés. Ao notar a miopia deles, ele tentou fazê-los voltar os olhos para o Senhor. Esta é a tarefa do líder espiritual — fazer constante e repetidamente que seu povo olhe para o Senhor. Moisés faz isso muito bem durante todo o Êxodo. Ele quer que os israelitas olhem para Deus e não para ele, e certamente não para suas circunstâncias. Essa é a razão de adverti-los freqüentemente para não "testarem ao Senhor". Mas eles se recusam a ouvir: "Mas o povo estava com muita sede e continuava reclamando e gritando contra Moisés. Eles diziam: Por que você nos tirou do Egito? Será que foi para nos matar de sede, a nós, aos nossos filhos e às nossas ovelhas e cabras?" (v. 3, BLH)

Moisés conhece muito bem uma cena ameaçadora, quando se defronta com ela. Portanto, clama ao Senhor: "Então Moisés clamou pedindo a ajuda do Deus Eterno. Ele disse: O que é que eu faço com este povo? Mais um pouco, e eles vão querer me matar a pedradas" (v. 4, BLH).

Essas não são palavras exageradas de um líder amedrontado; mas a verdade literal. As pessoas haviam ficado tão iradas que estavam prontas para matar seu líder.

Mais uma vez, em meio ao desapontamento e às queixas, Deus responde gentilmente com abundância:

O Eterno disse a Moisés: Escolha entre eles algumas autoridades e passe com elas na frente do povo. Leve também a vara de pastor com a qual você bateu no rio Nilo. Eu estarei

276 MOISÉS: UM HOMEM DEDICADO E GENEROSO

diante de você em cima de uma rocha, ali no monte Sinai. Bata na rocha, e dela sairá água para o povo beber. E Moisés fez isso na presença das autoridades do povo de Israel. Então deram àquele lugar os nomes de Massá e de Meribá, pois os israelitas reclamaram contra Moisés e provocaram o Deus Eterno, perguntando: O Eterno está com a gente ou não?

Êxodo 17:5-7, BLH

Quando você reduz o murmúrio ao seu denominador comum, percebe que está na verdade perguntando ao Senhor: "Você está aqui ou não?" Trata-se de um caso de dúvida franca, irrestrita, verbal. Em razão de Moisés querer que o povo visse seu erro, ele chamou o lugar de Meribá, "contenda", para lembrar com quem eles discutiram. To efe vez que contassem a história no futuro, teriam de lembrar sua briga com Deus. Alguns de nossos slogans dos dois últimos séculos são: "Lembrem-se do Álamo"; "Lembrem-se de Pearl Harbor". Moisés dizia: "Lembrem-se de Meribá". Em outras palavras: "Lembrem-se de quando contenderam e discutiram com o Deus vivo".

Não posso deixar de impressionar-me novamente com a liderança destacada de Moisés.

DEPOIS D O S EXAMES

Que lições podemos aprender dessas experiências perturbadoras no deserto? Pelo menos três nos vêm logo à mente.

E preciso uma atitude humilde para aprender com os testes terrenos.

Deu não só quer que suportemos os testes, mas também que aprendamos com eles. Não aprendemos, porém, sem humildade. Os orgulhosos não aprendem. De fato, o livro de Provérbios diz: "O que confia no seu próprio coração é insensato, mas o que anda em sabedoria, será salvo" (veja Pv 28:26). O insensato não é humilde. Ele permanece orgulhoso e, portanto, é cozido no caldo da sua própria ignorância.

DIETA CELESTIAL VERSUS APETITE TERRENO 277

Alguns de vocês podem ler sobre esses acontecimentos, levantar-se e prosseguir com a vida de reclamações, como se nunca tivessem ouvido Deus falar. Isso pode acontecer na vida de qualquer crente, em qualquer lugar do mundo, em qualquer teste. A verdade bíblica funciona, mas deve ser aplicada sem levar em conta suas circunstâncias. A humildade acelera o processo de aprendizado.

E preciso um forte ataque para quebrar um hábito diário.

Os hábitos diários não são facilmente afastados. (Alguns chamam esses hábitos de "vício".) Nada é mais sólido que os "hábitos egípcios". Os israelitas haviam se deleitado num regime do Egito e gostaram tanto que não se satisfaziam com menos que isso. Tinham de receber isso, ou não ficariam satisfeitos. Foi por isso que Deus levou-os a percorrer o ciclo do tempo várias vezes, ano após ano.

Você tem dito a si mesmo ultimamente: "Por que não saímos dessa situação e passamos para outra?" Sabe por que isso não acontece? Porque nos recusamos a aprender com a mesma experiência do deserto. De algum modo não permitimos que ela penetre em nosso coração. Mas Deus nunca perde seu tempo ou seus testes com seu povo. Ele sabe quanto tempo planejar o teste, quantas vezes repeti-lo e quão difícil o exame deve ser.

Epreciso um apetite celestialpara apreciar uma refeição celestial.

Um apetite terreno responde naturalmente a um regime celestial com murmurações. E claro que sim! A carnalidade odeia o serviço de refeições de Deus. É preciso um apetite celestial para aceitar o alimento celestial. Você não pode pedir tal apetite pelo correio, telefone ou pegá-lo na estante da sua livraria cristã local. O apetite celestial só vem do céu; o Senhor é quem vai transformar seus desejos enquanto se ajoelha em submissão e obediência a ele.

278 MOISÉS: UM HOMEM DEDICADO E GENEROSO

O SEU DESERTO O ACOMPANHA

Cada um de nós tem seu próprio ciclo de deserto. Alguns lutam com sua família numerosa. Outros não têm filhos. Seu teste não está relacionado ao lar; ele pode estar ligado a seu emprego. Para alguns, a dificuldade está nos relacionamentos; você é agressivo e tem problemas com as pessoas. E por isso que Deus o mantém junto delas e faz o polimento, a fim de que seu antigo hábito egípcio possa ser alterado. Para outros são as finanças; tornou-se um padrão para você viver com dinheiro insuficiente. Para outros o problema está na escola e questões escolares. Esse é o seu deserto.

Há alguns anos, enquanto ministrava uma palestra numa faculdade na Flórida, fiz uma sessão de perguntas e respostas com vários alunos. Como invadiu noite adentro, um dos estudantes fez uma pergunta que me obrigou a refletir durante algum tempo. Ele perguntou: "Como são as coisas na Califórnia? São tão boas como ouço? Alguém é testado na Califórnia como somos aqui na Flórida?" Ele falava a sério! Era uma atitude típica do modo como alguns estudantes idealistas vêem seu mundo.

Rimos ao ouvir tal pergunta, porque ficamos imaginando, e com razão: O que isso importa?St tivéssemos de levantar subitamente acampamento e mudar para o Taiti (grande idéia, não?), levaríamos conosco o mesmo velho ciclo. Não demoraria para o repetirmos no Taiti. Quer nos mudemos para Miami quer para Seattle, Boston ou San Diego, Dakota do Norte, região central do México, China ou Chile, a história seria a mesma. Por quê? Porque carregamos nós mesmos para onde quer que vamos... e aí é que está o problema.

O seu deserto não o separa de você só porque voou milhares de milhas para outro local. Onde quer que vá, seu apetite egípcio o acompanha. Deus não só está empenhado em fazê-lo atravessar o mar Vermelho para salvá-lo, como também em levá-lo a Canaã pelo caminho do deserto. A conversão é no geral uma viagem curta para o altar, mas a maturidade está sempre aliada ao tempo.

Lembre-se disso esta semana. Você ainda não viveu os sete dias à sua frente, e jamais vai vivê-los de novo. A vida é como uma moeda.

DIETA CELESTIAL VERSUS APETITE TERRENO 279

Gaste-a da maneira que quiser, mas só poderá gastá-la uma vez. Deus quer que aprenda com sua experiência no deserto. Ele quer mudar seu apetite, seus hábitos, seu estilo e, durante esse processo, mudar toda a sua vida.

Como já disse, essas mudanças profundas, íntimas, não ocorrem subitamente; elas começam na cruz, onde você entrega suas armas e aceita o dom de Deus, Jesus Cristo. Esta pode ser sua oportunidade de dizer: "Senhor Jesus, este é o seu momento. Entrego-lhe o meu coração e a minha vida, como seu filho".

Que nunca nos esqueçamos da lição da história, quer elas sejam a nossa história pessoal quer a do antigo Israel. Que possamos atentar às palavras da minha professora de história da escola secundária: "Você pode ignorar a história ou aprender com ela".

Aprender com o passado pode ser difícil, mas permanecer na ignorância é dispendioso. É melhor aprender essas lições valiosas hoje do que procurar migalhas amanhã, no deserto inclemente.

Toda responsabilidade ou trabalho abrange esses dois fatores críticos. As áreas essenciais envolvem seu chamado, o que você não deve delegar. Você cumpre essas tarefas o melhor possível e dedica o tempo necessário para executá-las corretamente. A parte adicional é que nos causa problema. Gostamos de fazer mais. Encarregarno-nos então de cada vez mais coisas até que finalmente chegamos a um ponto crítico.

296 MOISÉS: UM HOMEM DEDICADO E GENEROSO

É verdade. Alguns de nós podem fazer muito sozinhos. Sir Edmund Hillary, o famoso alpinista britânico, que foi o primeiro a escalar o Monte Everest, disse certa vez: "Nem mesmo o cume do Everest está além da capacidade de um homem só. Mas os riscos são enormes".

Você está disposto a arriscar sua saúde, carreira, família e ministério futuro para ultrapassar seu limite? Em seu excelente livro Liderança Espiritual, J. Oswald Sanders dedica um capítulo inteiro à arte de delegar. A meu ver, todo cristão (líder ou não), deve estudar esse capítulo. Ouçam as palavras sábias dele: "O princípio é que Deus assume a responsabilidade de capacitar seu homem para cumprir toda tarefa para a qual o designou. Existem, porém, algumas tarefas auto-impostas que outros podem fazer melhor do que nós, e devemos então delegá-las. Mesmo que não sejam tão bem-feitas quanto as faríamos, ainda sim devemos delegá-las — um teste severo para o perfeccionista!"2

Quando você sabe como fazer o trabalho melhor do que qualquer outra pessoa, é difícil repassá-lo para alguém que ainda esteja aprendendo, que pode falhar e eventualmente se atrapalhar e tropeçar, exigindo uma equipe de suporte atrás dele. Mas esse é o preço a ser pago, e vale a pena. Ou você faz isso ou a queda é inevitável. Nossos verdadeiros problemas não tendem a ocorrer na área essencial, mas nas adicionais que aceitamos e tentamos manter.

RESTRINJA-SE MAIS, ENVOLVA-SE MENOS.

À medida que a carga aumenta, o líder sábio não fica mais ocupado, ele fica mais esperto. Pede ajuda. É difícil fazer isso quando você cresce com um ministério. Quando começa com um grupo de seis ou oito famílias que cresce até alcançar cem, depois trezentos, quinhentos e, finalmente, mil e quinhentos membros, aquele que cultivou o sonho original tende a desejar manter o ministério pequeno. Essa tendência de controle é quase sempre reforçada pelos membros que se lembram "dos primeiros dias". Contudo, um ministério

POR QUE OS LIDERES CAEM 297

metropolitano crescente deve aprender a pensar de maneira metropolitana e ter sonhos metropolitanos — não sonhos insensatos, extravagantes, extremos, mas sonhos mais amplos e muito diferentes dos que reinavam quando a família era pequena, simples e unida.

À medida que o ministério cresce, é fácil para os líderes se envolverem mais e ficarem cada vez mais ocupados. Nesse momento então, é mais sábio procurar ajuda extra entre os homens e mulheres talentosos que estão nos bancos. Acho significativo que ao estudar a vida do Senhor Jesus nos Evangelhos, não encontramos um único lugar onde esteja escrito que Jesus tinha pressa. Você nunca lê: "Quando Jesus ouviu tal coisa, ele imediatamente saiu apressado". Isso nunca aconteceu. Ele fez seus homens se envolverem no assunto, mas não perdeu de vista seus valores básicos ou missão principal. Acho que podemos aprender algo com ele, você não acha?

OS SERVOS DE DEUS NÃO ESTÃO ISENTOS DAS LEIS NATURAIS.

O fato de você ser um servo do Senhor não significa que não vai ganhar uma úlcera ou adoecer caso se recuse a delegar. Se não cuidar da saúde vai pagar o preço, exatamente como o resto da humanidade. Você ficaria surpreso ao saber quantos pastores e esposas de pastores ficam com graves problemas emocionais por causa dessa recusa persistente em compartilhar o fardo. Não somos imunes ou isentos das conseqüências de um estilo de vida pouco sadio. O corpo precisa de uma quantidade exata de trabalho, de descanso, de alívio, e só pode lidar com o estresse até certo ponto. Não leve isso em conta e alguma coisa acontece.

Um antigo provérbio grego afirma: "Você vai quebrar o arco se o mantiver sempre curvado". Jetro notou o cansaço no rosto do genro e disse: "Livre-se de alguns dos seus deveres". Por ter seguido o sábio conselho do sogro, Moisés resistiu. Acredito que as coisas ficaram mais fáceis para ele. Moisés pareceu rejuvenescer. De fato, no final de sua vida (cento e vinte anos!), foi dito a seu respeito: "Não se lhe escureceram os olhos, nem se lhe abateu o vigor" (Dt 34:7).

2l)H MOISÉS: UM HOMEM DEDICADO E GENEROSO

Fazer mais coisas não garante a eficiência. Um padrão muito melhor de eficiência é quanto conseguimos delegar.

É chegada a hora de uma confissão pessoal. Êxodo 18 contém uma mensagem importante para mim. Sou um líder inato, forte, e minha tendência é cobrir muitas bases. Com meu excesso de energia, eu poderia aceitar mais encargos do que é saudável. Porém, mediante conselhos sábios, estou descobrindo a importância de delegar tarefas para que possa cumprir meu principal chamado. Sinto-me grato pelos conselhos recebidos daqueles que me ajudaram a seguir pelo caminho certo.

Você está cansado de ajustar persianas, selar cartas, dirigir ônibus, imprimir boletins dominicais e fazer as centenas de coisas úteis que qualquer servo disposto pode fazer? Caso positivo, talvez seja necessário parar um pouco e examinar longamente sua curta vida. É possível que esteja na hora de determinar o que é essencial e o que é secundário.

Se souber aproveitar o secundário sem prejudicar o essencial, ótimo! Mas se um conselheiro de confiança lhe disser que precisa mudar, ouça. Sei que é difícil dizer não quando você gosta de fazer tudo. Mas se não der ouvidos ao seu Jetro e decidir renunciar a algumas das coisas que o estejam cansando, vai pagar um preço terrível. O mesmo acontecerá à sua família.

Peça ao Senhor que o ajude a dizer não bondosamente, a renunciar a esse impulso de acrescentar cada vez mais trabalho à sua agenda já superlotada. O Senhor Jesus Cristo tem poder para nos dar equilíbrio, propósito e disciplina. Ele foi o indivíduo mais equilibrado que já viveu. Foi ele que deu o conselho a Jetro, que por sua vez transmitiu a Moisés, chegando finalmente a nós. Você só pode fazer as coisas até certo ponto.

Não há nada espiritual num ataque cardíaco ou, pior ainda, numa morte precoce.

V o c ê sabe qual a maior prioridade da vida? Ou, em outras palavras, qual o investimento mais importante que você fará durante toda a sua vida na terra?

Considerei várias vezes tais questões no decorrer da minha existência. Essas são as indagações que você faz a si mesmo depois de passar a ter fé em Jesus Cristo. Quando fiz um estudo mais profundo de Êxodo 19, porém, comecei a questioná-las de maneira mais urgente, sincera.

Em uma primeira leitura, alguns poderiam dizer que ela é uma parte irrelevante das Escrituras. Você pode até perguntar a si mesmo: "Como eu poderia encontrar a prioridade fundamental da vida numa passagem como Êxodo 19?" Contudo, ela se acha ali.

O encontro de Moisés com Deus pode ensinar-nos muito sobre nosso próprio encontro com Deus. Vamos descobrir que o tempo passado com o Senhor, como seus filhos, deve tornar-se nossa Prioridade Número Um.

A SOMBRA DA MAJESTADE

Êxodo 19 tem início à sombra do monte Sinai, no lugar onde os filhos de Israel se reuniram diante do Senhor. Mas antes de o povo too MOISÉS: UM HOMEM DEDICADO E GENEROSO poder encontrar-se com Deus, antes de Moisés subir essa montanha para ouvir e receber a revelação de Deus, Israel precisava ser adequadamente preparado. Uma parte significativa da preparação estava ligada ao lugar onde se reuniram: "No terceiro mês da saída dos filhos de Israel da terra do Egito, no primeiro dia desse mês, vieram ao deserto do Sinai. Tendo partido de Refidim, vieram ao deserto do Sinai, no qual se acamparam; ali, pois, se acampou Israel em frente do monte" (w. 1-2).

Provavelmente poucos de nós já estiveram ou estarão no Sinai — essa cadeia de cumes sólidos de granito que se elevam para o céu do deserto, na base da península do Sinai.

No começo deste livro, mencionei a obra God's Wilderness, um volume grande, ilustrado, que minha irmã me deu de presente. Ele contém várias páginas com gravuras do Sinai. Uma das fotos da zona mais ao sul da cadeia montanhosa do Sinai tem a seguinte legenda: "Os picos de granito altaneiros, na extremidade sul da península do Sinai, parecem formar um dedo gigantesco de Deus proclamando: 'Aqui! Aqui' As cores das montanhas nessa parte do Sinai, em constante mudança, cada vez mais intensas, dão a essa região indescritivelmente bela uma aura de santidade, e pode-se até acreditar que foi aqui que Deus apareceu a Moisés".

O livro então acrescenta: "Os eruditos de Israel que exploraram a península no breve período da ocupação de Israel sentiram a atmosfera de santidade que impregnava as montanhas do Sinai, e acreditaram que foi nessa região que os israelitas acamparam quando a Lei foi entregue".1

Como imaginar a majestade de tal lugar? E uma cadeia maciça de montanhas escarpadas — formadas de granito sólido, na cor cinza, variando até o vermelho-escuro, a escuridão da noite e o silêncio do espaço. Foi ali, contudo, com a tinta ainda úmida em seus documentos oficiais, que Israel levantou suas tendas. O Sinai era um ponto importante no plano de Deus. Os israelitas se reuniram como povo, cerca de dois milhões de homens, para ouvir a voz de Deus à sombra desses enormes picos que se elevavam a não menos que oito mil pés, como um dedo gigantesco erguido para o céu.

SINAI: ONDE MOISÉS ENCONTROU DEUS 301

Sempre gostei de andar pela praia, junto à arrebentação. Sinto prazer na solidão e nos jogos sutis de luz nas terras desertas. Mas nada pode comparar-se às montanhas para descrever a grandiosidade do nosso Criador. Projetando-se do chão desse imenso deserto vêemse os picos do Sinai, onde Deus planejou encontrar o povo. Ele os remira do cativeiro e agora os reclamava para si.

Deus, contudo, não corre para a presença de alguém — nem devemos nos apresentar impensadamente diante dele. Não há espaço para uma atitude negligente ao entrar em contato e comunicar-se com o Deus vivo. Devemos preparar-nos para isso. Os israelitas certamente precisavam adotar esse conceito. Lembre-se de que eles haviam resmungado e murmurado durante a viagem pelo deserto até esse ponto. Que tipo de preparação Deus exigia na verdade?

PREPARANDO-SE PARA ENCONTRAR DEUS

Êxodo 19:3-15 lista quatro pré-requisitos exigidos por Deus antes que o povo pudesse encontrar-se com ele. Deus os conduziu ao encontro, mas antes de dar-lhes sua revelação, exigiu que fizessem quatro coisas:

1. Estivessem dispostos a obedecer

Subiu Moisés a Deus, e do monte o Senhor o chamou e lhe disse: Assim falarás à casa de Jacó, e anunciarás aos filhos de Israel: Tendes visto o que fiz aos egípcios, como vos levei sobre asas de águias, e vos cheguei a mim. Agora, pois, se diligentemente ouvirdes a minha voz, e guardardes a minha aliança, então sereis a minha propriedade peculiar dentre todos os povos: porque toda a terra é minha; vós me sereis reino de sacerdotes e nação santa. São estas as palavras que falarás aos filhos de Israel.

Êxodo 19:3-6

Deus queria ter a certeza de que suas palavras eram ouvidas. Ele exigiu que o povo mostrasse uma atitude receptiva: "Senhor, quero obedecer às tuas palavras".

,«).> MOISÉS: UM HOMEM DEDICADO E GENEROSO

Ao basear suas opiniões no filme clássico de Cecil B. DeMille, Os Dez Mandamentos, muitos supõem que Moisés subiu uma vez o monte e depois desceu com as tábuas de pedra sob o braço. Um estudo cuidadoso de Êxodo mostra, porém, que ele fez na verdade sete viagens. Subiu e desceu seguidas vezes — um homem muito ocupado.

Moisés cuidou desses assuntos ainda antes de sua vigília de quarenta dias na presença de Deus, para receber a Palavra escrita por Deus.

Em sua primeira viagem monte acima, Deus disse: "Quero ver se o povo está disposto a obedecer". Então Moisés desceu o monte e "chamou os anciãos do povo, e expôs diante deles todas estas palavras, que o Senhor lhe havia ordenado" (v. 7).

Como eles reagiram? Imagine dois milhões de pessoas dizendo em uníssono: "Tudo o que o Senhor falou, faremos" (v. 8). Foi o que fizeram. "Vocês estão dispostos a obedecer?" Moisés perguntou-lhes. "Sim, estamos", responderam. A voz de cada um deles deve ter ecoado através daquelas pedras maciças. Moisés voltou então a subir o monte.

2. Tenham sensibilidade para ouvir

Disse o Senhor a Moisés: Eis que virei a ti numa nuvem escura, para que o povo ouça quando eu falar contigo, e para que também creiam sempre em ti. Porque Moisés tinha anunciado as palavras do seu povo ao Senhor (v. 9).

O Senhor dissera a Moisés: "Eu não só quero que o povo esteja disposto a obedecer, como quero que sejam sensíveis para ouvir quando eu falo. Isso os levará a crer em você, Moisés, quando ouvirem o que estou dizendo".

O que Deus está fazendo então? Ele está preparando a base da comunicação. Projetou uma base sólida, uma estrutura de receptividade. Eles deviam estar prontos para escutar; deviam estar dispostos a obedecer. Ele não se apressou em revelar suas verdades antes de o povo estar em condições de escutá-las e obedecê-las. Mas demonstravam, então, estar preparados para o passo seguinte.

SINAI: ONDE MOISÉS ENCONTROU DEUS 303

3. Consagrem o coração.

Disse também o Senhor a Moisés: Vai ao povo, e purifica-o hoje e amanhã. Lavem eles as suas vestes, e estejam prontos para o terceiro dia: porque no terceiro dia o Senhor à vista de todo o povo descerá sobre o monte Sinai... Moisés, tendo descido do monte ao povo, consagrou o povo; e lavaram as suas vestes.

Êxodo 19:10-11,14

As vestes limpas iriam refletir a pureza do coração de cada um. Nada deveria sujar a alma deles. Era necessário que fossem limpas e puras, por dentro e por fora. Usando roupas limpas, ficariam prontos para ouvir a Deus.

E o Senhor falou novamente: "Marcarás em redor limites ao povo, dizendo: Guardai-vos de subir ao monte, nem toqueis o seu limite; todo aquele que tocar o monte será morto. Mão nenhuma tocará neste, mas será apedrejado ou flechado; quer seja animal, quer seja homem, não viverá. Quando soar longamente a buzina, então subirão ao monte" (w. 12-13).

Deus instruiu Moisés para marcar uma fronteira, um limite, uma barreira segura e sagrada ao redor do monte, para que o povo não se aproximasse demais.

4. Mostrem profundo respeito pela presença de Deus

Moisés desceu de novo o monte e preparou o povo como Deus ensinara. A seguir, no terceiro dia, a hora marcada chegou. O Senhor desceu em fogo sobre o monte e chamou Moisés para outra conferência. Logo o mandou descer com esta urgente mensagem: "Desce, adverte ao povo que não traspasse o termo até ao Senhor para vê-lo, a fim de muitos deles não perecerem" (v. 21).

Só os que fossem especificamente chamados por Deus deviam subir o monte; os demais ficariam embaixo. "Então disse Moisés ao Senhor: O povo não poderá subir ao monte Sinai, porque tu nos advertiste, dizendo: Marca limites ao redor do monte e consagra-o" (v. 23).

304 MOISÉS; UM HOMEM DEDICADO E GENEROSO

O respeito pela presença de Deus era tão profundo que ninguém deveria sequer tocar o monte. O povo teria de esperar que Deus falasse a Moisés e ouvir as palavras do Senhor por meio do seu servo.

UM DEUS PEQUENO DEMAIS?

Que lembrança necessária! Essa passagem torna claro que vivemos numa época de conceitos lamentavelmente rasos de Deus. Algumas músicas cristãs contemporâneas dão a impressão de que Deus é nosso camarada — um grande amigo para quando estamos em apuros. Uma estrela de cinema disse a respeito de Deus: "Ele é o Grande Pai lá de cima". Uma canção pop diz: "E se Deus fosse apenas um tolo como nós?" Essa não é a visão bíblica de Deus. E a frágil tentativa humana de tornar Deus relevante.

Você percebe a sutil depreciação nesse conceito de Deus? Essas idéias pequenas sobre ele diminuem a beleza da sua santidade. Embora o desejo seja torná-lo relevante, todos esses esforços depreciam e degradam a santidade de Deus. Contudo, em Êxodo 19 descobrimos o Deus das Escrituras insistindo de tal modo em manter uma posição elevada, exaltada, que ele marca um limite, advertindo seu próprio povo: "Não cruzem esta linha. Não queiram enganar-me. Não se mostrem frívolos na minha presença".

Durante anos considerei o hino: "Deus Imortal, Sábio e Invisível" como um dos cânticos favoritos da igreja. Infelizmente não o ouvimos mais muitas vezes. Considere algumas de suas estrofes significativas, repletas de teologia substancial:

Deus imortal, sábio e invisível, Oculto na luz, inacessível aos nossos olhos, Bendito, glorioso, Ancião de Dias, Todo-Poderoso, vitorioso, teu grande nome louvamos.

Também aprecio imensamente a segunda estrofe, ainda mais que a primeira:

SINAI: ONDE MOISÉS ENCONTROU DEUS 305

Incansável, sem urgência, e silencioso como a luz, De nada carecendo, nem desperdiçando, tu reinas em poder; Tua justiça, como montanhas, eleva-se altaneira Tuas nuvens são fontes de bondade e amor.

Os puritanos, aquele rigoroso povo do passado, possuíam um conceito solidamente bíblico de Deus. Você sabe por que é tão importante para nós recuperarmos essa compreensão respeitosa? Por que uma visão rasa de Deus leva a uma vida rasa. Deprecie a Deus e depreciará a si mesmo. Trate Deus superficialmente e você se torna superficial. Tenha Deus, porém, no mais profundo respeito e notará quão profundamente as raízes de sua vida espiritual vão crescer.

Estou muitíssimo preocupado com a superficialidade na igreja atual. A profundidade espiritual é rara nestes dias que nos aproximam da virada de um milênio. Nosso tempo com Deus poderia muito bem depender de um jogo de moeda — cara, aceito. Coroa, não aceito. Se achar que devo, ótimo. Se não achar, veja bem, ele é um Deus da graça. Ele compreende. Francamente, não encontro essas acomodações insensatas na Bíblia — certamente não em uma passagem como Êxodo 19.

Deus é santo. Exaltado. Ele é o único Deus sábio, o Criador, o soberano Senhor. Ele é o Mestre. E quem me diz o que fazer, e não tenho opção segura senão obedecer. Não há alternativa nem escolha múltipla. Temos apenas uma diretriz: fazer a sua vontade. Confirmamos essa verdade em nossos momentos com ele.

Quando Isaías viu o Senhor, ele teve de levantar a cabeça para ver um Deus sublime e exaltado. Quando Josué o encontrou nas margens do Jordão, caiu imediatamente aos seus pés. Quando Ezequiel o viu, não teve palavras para descrevê-lo, buscando nos limites da linguagem uma descrição que o apresentava nas nuvens entre rodas brilhantes que giravam nas glórias dos céus.

Mas não hoje. Hoje ele é nosso camarada, nosso amigo compreensivo, nosso menino de recados sempre à disposição. Não, ele não é! O Senhor é nosso Deus. Ele não se curva ao nosso ritmo apressado, mas aguarda em silêncio que satisfaçamos às suas exigências. Uma

306 MOISÉS: UM HOMEM DEDICADO E GENEROSO

vez que diminuímos o passo para encontrá-lo, ele se apraz em acrescentar incrível profundidade espiritual à nossa vida rasa.

Um homem expressou sua reverência deste modo: "A maior obrigação da igreja cristã é purificar e elevar o seu conceito de Deus até que seja novamente digno dele. Em todas as suas orações e trabalhos isto deve estar em primeiro lugar. Faremos um grande serviço à próxima geração de cristãos se passarmos a eles, de modo não reduzido e não ofuscado, o nobre conceito de Deus que recebemos de nossos pais hebreus e cristãos das gerações passadas".2

Qual tem sido o seu conceito do Senhor? Quem é o seu Deus? Seja honesto, agora. Ele se parece em alguma coisa com o Deus do monte Sinai?

Penso que é altamente significativo o fato de que, para ocorrer o encontro no Sinai, não foi Moisés quem subiu, mas Deus quem desceu. Quando nos preparamos para o nosso encontro, cumprindo as exigências de Deus, ele desce. Ele faz o contato. Deus se apraz intensamente quando seus filhos se preparam adequadamente para encontrar-se com ele.

As Escrituras dizem: "Descendo o Senhor para o cume do monte Sinai, chamou a Moisés para o cimo do monte. Moisés subiu" (v. 20). E como será lá em cima?

Vale a pena uma observação mais atenta:

Ao amanhecer do terceiro dia houve trovões e relâmpagos e uma espessa nuvem sobre o monte, e mui forte clangor de trombeta, de maneira que todo o povo que estava no arraial se estremeceu. E Moisés levou o povo fora do arraial ao encontro de Deus; e puseram-se ao pé do monte. Todo o monte Sinai fumegava, porque o Senhor descera sobre ele em fogo; a sua fumaça subiu como fumaça de uma fornalha, e todo o monte tremia grandemente. E o clangor da trombeta ia aumentando cada vez mais; Moisés falava, e Deus lhe respondia no trovão.

Êxodo 19:16-19

SINAI: ONDE MOISÉS ENCONTROU DEUS 307

Que experiência magnífica! Se você mora numa região sujeita a terremotos, sente um leve tremor de vez em quando, uma sensação estranha, e depois a vida volta ao normal. Mas quantas vezes vê um monte de granito tremer, ou ouve o som constante de trovões, e relâmpagos riscando caminho entre o céu e a terra, ou se encolhe ao ouvir o toque imperioso das trombetas celestes anunciando que Deus está pronto para se encontrar com você?

Apenas sua vida tranqüila de todos os dias, certo? Errado. Você pode imaginar como Moisés se sentiu quando o Senhor lhe disse: "Suba, Moisés". Se fosse Moisés, o que faria? Como poderia continuar? Vou dizer-lhe como: com medo e tremendo, Moisés fez essa viagem histórica para dentro das nuvens. Ele já estivera diante de uma sarça ardente, mas isso não foi nada comparado com essa memorável experiência. O escritor de Hebreus diz: "Na verdade, de tal modo era horrível o espetáculo, que Moisés disse: Sinto-me aterrado e trêmulo!" (Hb 12:21).

POR QUE ESSE ENCONTRO?

Por que Deus queria encontrar-se com Moisés? O texto nos dá duas boas e saudáveis razões. Elas servem como bons lembretes para nós.

Respondeu Moisés ao povo: Não temais; Deus veio para vos provar e para que o seu temor esteja diante de vós, a fim de que não pequeis.

Êxodo 20:20

Um temor saudável de Deus fará muito para impedir-nos de pecar. Quando tememos adequadamente o Deus vivo, nossa vida é mais pura. Toda pessoa evangélica que peca deliberadamente, bloqueou por algum tempo seu temor de Deus. Você e eu podemos fazer isso. Quando nos envolvemos ativamente no pecado, pomos consciente-

«)K Ml )ISfiS: UM HOMEM DEDICADO E GENEROSO mente de lado o que sabemos ser a verdade sobre Deus. Suprimimos o conhecimento dele em nossa mente e coração. Mentimos para nós mesmos, dizendo: "Vamos conseguir, Deus não vai se importar muito".

Contudo, Deus usou Moisés para revelar ao seu povo um temor reverente e saudável ao Todo-Poderoso.

Talvez isso soe como uma ameaça, mas devo afirmar que esse temor saudável ao Todo-Poderoso está em falta em nossa era. Isso tem conseqüências, uma delas é achar que podemos fazer o que quisermos. Você pode viver como quiser, se souber que não está sendo visto e não será apanhado. Mas se bem lá no fundo você souber que há um Deus amoroso e santo que não o deixará impune quando você peca, evitará então o pecado a todo custo. Era exatamente isso que o Senhor queria estabelecer primeiro com o povo de Israel — um conceito santo, justo, puro e respeitoso da sua presença.

Quando você atinge a essa compreensão e a luz de Deus entra em sua vida como a água pura de um rio caudaloso, você aprende a odiar e temer aqueles atos que irão mergulhá-lo novamente nas trevas. O salmista expressou esse pensamento com estas palavras: "Quão doces são as tuas palavras ao meu paladar! Mais que o mel à minha boca. Por meio dos teus preceitos consigo entendimento; por isso detesto todo caminho de falsidade. Lâmpada para os meus pés é a tua palavra, e luz para os meus caminhos" (SI 119:103-105).

Então disse o Senhor a Moisés: Sobe a mim ao monte, e fica lá; dar-te-ei tábuas de pedra e a lei e os mandamentos, que escrevi, para os ensinares. Levantou-se Moisés com Josué, seu servidor; e, subindo Moisés ao monte de Deus...

Êxodo 24:12-13

Não é maravilhoso que Deus tenha dado instruções escritas para o povo obedecer? Esta é a primeira vez em toda a história que Deus escreveu sua Palavra. Até os dias de Moisés, a Palavra de Deus escrita

SINAI: ONDE MOISÉS ENCONTROU DEUS 309

não existia. Mas agora ela está aqui. Pensar que você e eu temos essas palavras escritas! Que pensamento impressionante e majestoso, e como aceitamos esse privilégio sem questionar!

Antes do colapso da União Soviética ateísta, meu amigo John Van Diest representou a Associação Evangélica de Editores Cristãos na Feira de Livros de Moscou. As autoridades haviam concedido a eles uma permissão relutante para dar um número limitado de Novos Testamentos na língua russa, e longas filas de pessoas aguardaram pacientemente para receber um exemplar. Quando os exemplares se esgotaram, um homem desesperadamente decepcionado perguntou se lhe podiam dar uma das caixas vazias em que os Testamentos haviam sido embalados.

"Mas elas não contêm nada!" meu amigo John protestou. "Todas as Bíblias foram dadas!" Com lágrimas nos olhos, o homem respondeu: "Então quero a caixa pelo menos". A Bíblia era tão preciosa para esse homem que ele quis guardar como um tesouro a caixa de papelão onde as Escrituras haviam sido mantidas. Que os nossos olhos sejam abertos para o esplêndido privilégio de ter em mãos a Palavra de Deus escrita e completa.

O QUE DEUS REVELOU?

Sabemos agora por que Deus se encontrou com Moisés. Mas o que ele revelou? O versículo 12 nos conta a primeira revelação: Ele revelou sua palavra escrita. A primeira coisa que Deus deu a esse homem que se encontrou com ele foi sua verdade por escrito. Ele dedicou tempo para inscrevê-la em pedra. Tirou um pedaço de granito do Sinai, preparou-o para que Moisés pudesse manejá-lo e gravou nele sua revelação com o próprio dedo. Essa é uma das poucas vezes nas Escrituras em que vemos Deus escrevendo algo. Ele escreveu a Lei e deu o seu autógrafo: "E, tendo acabado de falar com ele no monte Sinai, deu a Moisés as duas tábuas do Testemunho, tábuas de pedra, escritas pelo dedo de Deus" (Êx 31:18).

Ninguém jamais teve em mãos um documento mais valioso que esse. Moisés possuía o autógrafo da própria divindade — o autographa do dedo do próprio Deus.

310 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Uma segunda revelação é descrita em Êxodo 25:8-9. Depois de revelar a Palavra escrita, Deus revelou o modelo do tabernáculo: "E me farão um santuário, para que eu possa habitar no meio deles. Segundo a tudo o que eu te mostrar para modelo do tabernáculo, e para modelo de todos os seus móveis, assim mesmo o fareis" (Ex 25:8-9).

Deus deu ao seu povo a Palavra de Deus, para que eles pudessem conhecer sua mente e obedecer. Ele lhes deu o modelo do tabernáculo para que ele pudesse vir habitar com seu povo. Ele não queria permanecer distante numa montanha, mas tornar-se acessível e disponível. Contudo, de acordo com seu desígnio, ele desejava habitar num determinado local chamado tabernáculo.

PRIMEIRA PRIORIDADE

Podemos obter informação bastante significativa nessas passagens que podem parecer antiquadas para nossos gostos modernos. Esses versículos sugerem que a principal prioridade para você neste ano, o fator número um que irá determinar sobretudo sua capacidade de viver vitoriosamente, é encontrar-se regularmente com o Deus TodoPoderoso.

Nós encontramos o Senhor. Atravessamos o mar Vermelho. Passamos pelo deserto, mas talvez não tenhamos ainda chegado ao monte, esse lugar de encontro onde constante e regularmente passamos tempo com ele. Muitas vezes nos referimos a esse encontro como "período tranqüilo". Esses encontros, porém, nem sempre são tranqüilos. Uma expressão melhor pode ser um tempo de "fortalecimento religioso".

Essas passagens sobre o encontro de Moisés com Deus sugerem quatro princípios que podemos aplicar em nossa caminhada de fé.

Acho curioso que a primeira coisa mencionada em Êxodo 19 seja que o povo chegou a um lugar onde se encontrou com Deus. Se

SINAI: ONDE MOISÉS ENCONTROU DEUS 311

houver um monte nas proximidades, esse seria um bom lugar para um encontro a sós com o Senhor. Subir ao cume todos os dias iria provavelmente ajudar muito a sua saúde espiritual e física. Contudo, se um pico de montanha não for prático, você pode descobrir uma rocha acessível ou tronco no terreno de algum centro de conferências cristão. No entanto, se esperar por uma oportunidade dessas, não irá encontrar-se com Deus constantemente. Se esperar para encontrar-se com Deus até conseguir uma reserva numa cabana de madeira, junto ao lago, ou nas montanhas, abrigado numa caverna, ou junto à arrebentação das ondas, numa praia de areia branca, vai passar muito tempo vagueando pela vida longe dele. Você precisa de um lugar acessível. Um lugar onde possa ir todos os dias.

Lembre-se de que quando os israelitas chegaram ao monte, eles estavam no deserto. Acamparam no deserto e ali se encontraram com Deus. Você tem de achar um local para "acampar". Um lugar em sua casa ou apartamento onde possa ficar a sós com o Senhor.

Quero ser ainda mais prático. Você deve providenciar esse local. Só precisa de quatro coisas: uma mesa, um abajur, uma Bíblia e silêncio. Pode ser no seu quarto, onde possa fechar a porta e ficar sozinho. Pode ser num cantinho do escritório ou na mesa da cozinha. Mas, onde quer que seja, é necessário que possa ficar completamente a sós com Deus.

Nossa família já se convenceu disso há muito tempo. De fato, em nossa casa anterior na Califórnia, preparamos esse espaço quando fizemos a decoração. Cada um de nossos filhos tinha uma mesa, não algo grande, maciço, atraente, mas um lugar onde escrever, equipado com uma cadeira e luminária. Essa foi uma das primeiras peças de mobília que providenciamos para cada quarto. Fizemos isso antes mesmo de saberem por que estavam ganhando uma mesa. Nós os ajudamos a descobrir o que fazer com ela quando estavam à mesa com o Senhor. Era seu ponto de encontro com Deus. Induzimos isso deliberadamente em seus pensamentos.

Os filhos não se tornam piedosos de uma hora para outra. Precisam de treinamento. Seus filhos verão o que você faz e até irão à

312 MOISÉS: UM HOMEM DEDICADO E GENEROSO

igreja com você, mas não saberão como ser crianças, jovens ou adultos piedosos sem serem treinados. O que acha de se empenhar nisso se for pai(mãe)?

Conheci um jovem de uma família numerosa que não dispunha de um lugar para encontrar-se com Deus e decidiu então usar o closet. Ele colocou uma luminária, fez uma mesinha e se encontrava com Deus ali. Era um lugar apertado, mas silencioso, e ficava sozinho. Pelo menos tinha porta! Era o seu lugar de encontro com Deus.

A casa onde cresci era bem pequena. O lugar de minha mãe encontrar-se com Deus era o banheiro. Ela colocava os livros perto do aquecedor. Quando estava com Deus, ela pendurava um aviso na porta dizendo "Não perturbe", e sabíamos que ela não queria ser interrompida.

As mães ocupadas não podem escolher seu momento para estar com o Senhor na hora do café ou do jantar. Isso cria problemas, pois inevitavelmente elas são perturbadas. Se for uma mãe, tem de ser prática a esse respeito. Escolha o momento que funciona para você, mas, lembre-se, você precisa de tempo com Deus.

Se for um executivo, o melhor lugar seria seu escritório. Conheço um empresário que chega mais cedo ao escritório nos dias de semana para poder ter um momento com o Senhor. Se telefonar para ele nesse horário, quem atende é a secretária eletrônica. Esse é o lugar dele com Deus.

Onde é o seu? Você precisa de um local onde possa sentar-se e desfrutar de um período sem interrupções com o seu Senhor. Eu o advirto, se não arranjar um lugar apropriado não vai fazer isso regularmente. Você não pode ter uma boa reunião sentado na beirada da cama, no braço do sofá ou na sala de estar ocupada. Precisa de uma mesa, de luz, da Bíblia e de silêncio. Deve ser firme, ponderado e não ceder na preparação de um lugar para seu encontro com Deus.

Você não pode entrar na presença de Deus casualmente. Não pode começar essa reunião com a mente preguiçosa, mãos nos bolsos, ouvindo um jogo de futebol em seu Walk Man. Nada disso. O

SINAI: ONDE MOISÉS ENCONTROU DEUS 313

coração precisa estar preparado. Não me importa quem você seja, você não pode preparar-se repentinamente em poucos minutos. A maioria de nós tem dificuldade em se aprontar para estar com Deus em razão de coisas que passam pela nossa cabeça. Você precisa de pelo menos trinta minutos com Deus, e isso é o mínimo. Não é pedir muito. A boa notícia é que isso fará toda a diferença no resto do seu dia.

Não quero que este assunto passe a fazer parte da esfera enevoada do misticismo. No que se refere a mim, ela é tão prática quanto se vestir, tomar café, ir de carro para o trabalho ou arrancar o mato do canteiro de flores. Você e eu precisamos nos encontrar com Deus todos os dias. Como crentes, extraímos nossa vida dele. Ele é a videira; nós somos os ramos. Separados dele, como Jesus nos ensinou claramente, nada podemos fazer (Jo 15:5).

O Livro de Êxodo nos diz que o povo de Deus demonstrou boa vontade para obedecer. Esse é um ponto de partida excelente. Quando você se sentar junto à sua mesa, ore mentalmente: "Senhor, estou disposto a obedecer-lhe. Não estou aqui para brincar, mas para investir pelo menos trinta minutos inteiros para ouvir sua voz. Quero ser sensível. Não me importa que alguém saiba que estou aqui; quero ouvir o que o Senhor está dizendo em sua Palavra". Os israelitas tinham de consagrar-se. Lembra-se disso? Do mesmo modo, você deve ser direto e explícito sobre as áreas em desacordo entre você e o Senhor. Trate diretamente com ele e, ao fazer isso, mantenha-se longe do pecado. Os israelitas até lavavam as próprias roupas.

Vou contar-lhe um segredo. O tempo que passo com o Senhor não é positivo quando não me sinto fisicamente limpo. Fico melhor depois de um banho, logo pela manhã ou tarde da noite. Não me sinto bem quando no calor do dia ou depois de ter aparado a grama tento sentar-me e dedicar-me imediatamente a meu momento com Deus. Isso não funciona para mim. Meu corpo precisa estar limpo. Tenho de preparar-me para ouvir a Deus sem me preocupar com outras coisas.

A fim de voltar a mente e o espírito para a direção certa, deixo às vezes um hinário à mão. Decorei vários dos hinos de fé, assim como

314 MOISÉS: UM HOMEM DEDICADO E GENEROSO

alguns dos cânticos de louvor contemporâneos e mais significativos, e gosto de cantá-los ao Senhor durante esses momentos. Em razão de nem sempre me lembrar das palavras, deixo o hinário disponível em minha mesa.

Você pode fazer o mesmo. Prepare-se para quando Deus falar, você estar apto a ouvir.

Fiquei impressionado com a idéia de Deus não ter dado a Moisés uma revelação assim: "Desça e dê ao povo uma visão". Se isso tivesse acontecido, os israelitas iriam esperar visões a partir de então durante todo o período em que passaram no deserto. Eles ouviriam, veriam, testemunhariam e compartilhariam visões, acabando em uma confusão visionária em massa. Não. Deus deu a seu povo o Livro. Ele disse a Moisés: "Tome essas verdades escritas e instrua o povo". Palavras objetivas, claras, facilmente compreendidas.

Ao se encontrar com Deus abra o Livro. Não confie na memória, mas nas páginas impressas. Não folheie também ao acaso ou página a página, ou versículo a versículo, evitando especialmente o velho método da janela aberta, em que você deixa que o vento sopre e abra a Bíblia em algum versículo que você aceita como o texto para o seu dia. Não será possível descobrir a mente e o coração de Deus se empregar uma abordagem aleatória e irresponsável assim.

Comece no início de um livro da Bíblia e leia-o inteiro, devagar e sistematicamente. Leia em voz alta. Leia com atenção. Ouça o que seus lábios dizem e peça a ele que torne vivo em sua vida aquilo que ouve. Bloqueie tudo o mais. Ore concentrado no versículo, personalize e cante-o. Torne-o parte de seu pensamento consciente e esqueça tudo o mais enquanto dedica esse tempo a Deus. Lembre-se: essa é a prioridade máxima.

Você diz: "Olhe, Chuck, tudo isso é ótimo, mas eu já ouvi essas coisas antes. Não são novidades para mim".

Está bem, você já ouviu. Mas por que deixou de aplicar? Sei que não é novidade. Nosso problema não está em achar algo novo, mas em não praticar a verdade conhecida. Pedro escreveu: "Por isso

SINAI: ONDE MOISÉS ENCONTROU DEUS 315

sempre terei o cuidado de lembrar-lhes estas coisas, se bem que vocês já as sabem e estão solidamente firmadas na verdade presente" (2 Pe 1:12, NVI).

Todos precisamos ser lembrados, por quê? Porque o encontro regular com Deus terá um importante e reconhecível impacto sobre sua atitude no casamento, na arte de ser pai, em sua carreira, sua língua, seu evangelismo e sua aplicação na escola. É notável o que essa disciplina fará para seus hábitos de estudo. Sei disso, porque quando a negligencio não demoro a pagar o preço.

Até agora você provavelmente poderia ter adivinhado antecipadamente minhas recomendações, mas talvez isso seja jogado a você. Você precisa de um caderno de notas; alguns o chamam de "caderno da vida". Não estou falando de um material caro, com folhas cujas beiras sejam douradas e seu nome gravado na bonita capa de couro.

Tudo o que precisa é de um caderno comum, barato. É um diário pessoal, escrito à mão. Você não vai registrar o que fez, mas o que Deus está fazendo em você e por meio de você. O tempo passado com o Senhor deve ser acompanhado de uma caneta e papel. Você não vai se arrepender de cultivar essa disciplina.

O dicionário dá uma excelente definição de diário: "obra em que se registram, diária ou quase diariamente, acontecimentos, impressões, confissões". Deixe-me agora lhe dar uma sugestão: mantenha seu diário em segredo, não deixe ninguém o ler. Os diários não são escritos para serem publicados, mas para ajudar-nos a manter uma lembrança do que Deus está fazendo. Um diário ajudará você a lembrar-se do que Deus disse. No ano passado, você pode ter tido alguns dos pensamentos mais poderosos e profundos em seus momentos com o Senhor já experimentados durante toda uma vida de caminhada com ele; mas sem dúvida eles terão desaparecido se você não dedicou algum tempo para registrá-los.

Mantive um diário desde que estudei a vida de Jim Elliot, o missionário mártir, cujo testemunho foi muito bem compilado por sua

316 MOISÉS: UM HOMEM DEDICADO E GENEROSO

esposa Elisabeth no livro Shadow ofthe Almighty. Esse livro nada mais é que um volume publicado sobre a jornada notável de um homem com o seu Deus.

Quando nossos filhos aprenderam a escrever (quando o que escreviam passou a fazer sentido), começamos a ensiná-los a manter um diário. Isso foi de grande auxílio para cada um deles. Nós os ensinamos: "Deus pode falar com vocês e queremos que escrevam o que ele está dizendo. Só uma sentença ou duas já basta".

Você está lutando com sua vida amorosa? Está procurando o parceiro que Deus escolheu para você? Registre então os seus desejos. Fale sobre o homem ou a mulher com quem acredita que Deus quer que passe sua vida. Fale sobre as dificuldades que acompanham o desafio de encontrar essa pessoa. Ponha essas dúvidas por escrito. Acrescente as qualidades que está procurando. Que diferença um diário pode fazer!

Com o passar dos anos, uma das maneiras que utilizei para cultivar meu hábito de escrever foi por meio do diário. Muitas das colunas, artigos e livros que escrevi desenvolveram-se diretamente das sementes de pensamentos e observações registrados em meus livros da vida.

Preste atenção a Jim Elliot por um momento. Que dom magnífico do Senhor termos o privilégio de ver por alguns instantes com os olhos desse jovem piedoso. Ele escreveu:

Acabei de andar até o morro. E extasiante c delicioso ser abraçado pelas sombras de uma árvore amiga, com os céus saudando seu coração e o vento soprando as abas de seu paletó. Contemplar, gloriar-se e render-se a Deus, o que mais pode um homem almejar? Oh, a plenitude, a pura maravilha de conhecer Deus na terra, não posso, se nunca mais levantar minha voz a favor dele. Se apenas puder amá-lo e agradá-lo, talvez em sua misericórdia ele me dê alguns filhos, para que os guie pelos vastos campos de estrelas para explorar suas iguarias. Mas, caso negativo, se puder apenas vê-lo, tocar suas vestes e sorrir a seus olhos, ah, então nem estrelas nem filhos terão importância; apenas ele.3

SINAI: ONDE MOISÉS ENCONTROU DEUS 317

Você já esteve numa região do país onde havia uma porção de frutas amadurecendo ao sol? Numa fresca manhã de setembro você talvez tenha andado em um pomar de maçãs no vale de algum rio. Ou passou pelos bosques de árvores cítricas, com seus ramos pesados de frutos. Onde você mora, a colheita pode ser de cerejas ou pêssegos, morangos ou framboesas, ou bananas e mamão. É agradável aos olhos ver tal abundância de frutas doces e deliciosas penduradas nos ramos ou nas videiras, prontas para serem colhidas. Sua fragrância faz a boca encher-se de água e traz à mente muitas lembranças agradáveis.

A vida cristã produtiva é assim — doce, refrescante, nutritiva, cheirosa, deliciosa. Mas tal vida requer cultivo cuidadoso do solo, cuidados com os pomares, poda das vinhas na hora certa. Um andar mais intenso e constante com Cristo exige tempo e atenção diários. Se isso acontecer, você irá produzir fruto. Terá menos dificuldades com o evangelismo, conflitos de atitude, problemas nos relacionamentos, na escola, em relação à autoridade, ou até em descobrir a vontade de Deus. Essa é a razão de o encontro com Deus ser a prioridade número um.

A DECISÃO DE COMEÇAR

O Espírito de Deus atraiu sua atenção? É bom ser movido emocionalmente quando Deus o defronta com determinado assunto. Mas melhor ainda é tomar uma decisão consciente de fazer algo a respeito. Ter bons pensamentos e sonhar sonhos bons é ótimo, mas nada acontece realmente em sua vida até que avance pela fé e obediência e faça esse primeiro movimento.

Prepare desde já um plano para manter um encontro diário com Deus. O inimigo vai dizer-lhe para não honrá-lo, para fazer outra coisa. Vai sussurrar: "Você está envolvido demais com outras coisas, é ocupado demais". Toda desculpa sugerida por ele é mentirosa.

Se estiver ocupado demais para se encontrar com o Senhor, então, amigo, está realmente ocupado demais. Repito, você deve arran-

318 MOISÉS: UM HOMEM DEDICADO E GENEROSO

jar tempo. Por que não estabelecer um plano antes de ir para a cama esta noite?

Moisés foi um homem que se encontrou com Deus. Ele aprendeu que é preciso disciplina e preparação para isso. Uma coisa é saber o que deve ser feito e outra muito diferente é pôr as coisas em prática. Quantos de nós fazem um curso de oração, mas nunca oram, ou aprendem a técnica do evangelismo, mas nunca compartilham sua fé? Neste relato da vida de Moisés, talvez não aprendamos muita coisa nova, mas somos confrontados com algumas lembranças profundas da Palavra de Deus. Não precisamos tanto de uma nova técnica engenhosa quanto de um bom empurrão. Precisamos de uma repreensão do Espírito Santo por sermos tão preguiçosos e adiarmos tanto quando se trata de subir essa montanha e nos encontrar meia hora com Deus.

Que ele faça a sua obra sem nós! Apesar do nosso registro negativo, que ele nos detenha nesse momento, lembrando que podemos tornar-nos homens e mulheres de Deus muito mais fortes se mantivermos apenas o compromisso de nos encontrarmos com ele.

Pode ser num pico escarpado de montanha, num armário, ou como fazia minha mãe, no banheiro fechado com um aviso "Não perturbe" na porta. Deus não se incomoda com o lugar que você escolher nem com a quantidade de tempo gasta. Tudo o que ele quer é você.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os israelitas viram milagres e ainda assim murmuraram por comida; em que áreas você também esquece rápido as provisões de Deus e cede ao apetite por aquilo que não O agrada?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Paulo diz que tudo isso foi escrito como aviso para nós; que erro dos hebreus no deserto você corre o risco de repetir na sua própria caminhada?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Logo após o louvor de Miriã pela travessia do mar, o povo começou a reclamar; o que mantém o seu coração no agradecimento em vez da queixa quando surgem novas necessidades?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Reclamações Contra um Líder Piedoso$t$, 13,
$conteudo$natureza perigosa da piedade é um grande mistério. Todos os que buscam uma caminhada próxima de Deus entram em terreno perigoso. Aprendemos no capítulo anterior como é essencial passar alguns momentos com o Senhor. Você sabia que se torna vulnerável ao fazer isso? Se decide investir sua vida em Deus e cultivar intimidade com o Todo-Poderoso, pede por isso. Marcha diretamente para um campo minado. Não vai demorar muito para você experimentar o que chamaríamos de "Princípio do Perigo".

O dicionário define "perigo" como "circunstância que prenuncia um mal para alguém ou para alguma coisa". A palavra perigo fala da ameaça e não da certeza do mal. A atividade descrita como perigosa nem sempre provoca males, mas pode provocar.

Você talvez goste de velejar e tem um pequeno barco onde sai pelo oceano afora. No oceano enfrenta o perigo do naufrágio. Isso não significa que vai naufragar, mas simplesmente que a ameaça do naufrágio está presente. Do mesmo modo, se você dirigir em alta velocidade numa estrada molhada, em meio a uma tempestade, corre o risco de sofrer um acidente automobilístico. Isso não indica que vai se acidentar, mas que há grandes possibilidades de isso ocorrer. Ou suponhamos que goste de futebol e entre para um time. Você

320 MOISÉS: UM HOMEM DEDICADO E GENEROSO

agora corre o risco de ter um problema nos ligamentos do joelho ou quebrar um osso. Isso não quer dizer que vai quebrar um osso, mas que se arrisca a tal problema. A ameaça se intensifica.

Neste capítulo há um simples axioma que quero desenvolver com base na vida de Moisés: Os que se decidem a andar com Deus se tornam o alvo do inimigo.

NA MALHA FINA

Pode ser que neste ano você tenha decidido seriamente tomar novas decisões em sua caminhada com Jesus Cristo. Decidiu despertar de seu longo sonambulismo e seguir seu Senhor em novos horizontes. Pôs num quadro uma promessa a Deus que diz: "Senhor, quero passar tempo contigo regularmente. Quero encontrar-me contigo. Quero que minha vida se torne piedosa. Desejo honrar Jesus Cristo". Então, todo o exército do inferno já soube disso. Você é agora o alvo do ataque inimigo. Vai enfrentar uma série de riscos que podem prejudicar sua vida espiritual.

Terá de enfrentar armadilhas inevitáveis. Não precisa cair em nenhuma, mas elas surgirão. O Novo Testamento torna isso evidente. Lemos claramente em 2 Timóteo 3:12: "Ora, todos quantos querem viver piedosamente em Cristo Jesus serão perseguidos". A Bíblia Ampliada traduz assim este versículo: "Sim, o sofrimento virá da parte daqueles que odeiam a Cristo Jesus, sobre todos os que decidiram levar uma vida piedosa para agradar-lhe".

Essa é uma promessa estranha, mas de qualquer modo é uma promessa. A maioria das promessas é encorajadora: essa promessa poderíamos chamar de realista. Ela diz que se você decidir viver de maneira piedosa, irá enfrentar testes que terão o intuito de provar sua decisão.

Pedro registra uma promessa similar. Ele escreve: "Sejam sóbrios e vigiem. O diabo, o inimigo de vocês, anda ao redor como leão que ruge, procurando a quem possa devorar. Resistam-lhe, permanecendo firmes na fé, sabendo que os irmãos que vocês têm em todo o mundo estão passando pelos mesmos sofrimentos" (1 Pe 5:8-9, NVI).

RECLAMAÇÕES CONTRA UM LÍDER PIEDOSO 321

Seu inimigo é como um leão que ruge, procurando a presa desavisada. Ele se alimenta mais vorazmente dos piedosos. Se você fizer acordos em sua caminhada, não será realmente um alvo do inimigo. Por que ele perderia seu tempo? Você já está quase na metade do campo. Mas se decidir ficar sozinho e ir contra a maré, se rejeitar a opinião do mundo sobre como viver, se decidir viver de acordo com os padrões bíblicos, tenha a certeza de que o inimigo estará no seu encalço para devorá-lo. Você vai encontrar os dardos do diabo.

Alguém disse isso assim: "Quem quiser andar com Deus vai direto para a caldeira". Todos os que escolhem a piedade vivem sendo depurados numa caldeira. Os testes virão.

São muitos os que podem testemunhar: "Como sabe, tomei recentemente a decisão de caminhar com Deus. Pensei que a partir desse dia as coisas iriam melhorar. Mas, na verdade, elas pioraram".

Há anos, um h o m e m me disse que tomara uma decisão diferen- te de todas as que fizera em sua vida cristã. Ele ia caminhar com

Deus sem levar em conta as conseqüências. E disse: "Praticamente do dia em que pronunciei essas palavras em diante, tenho vivido um problema atrás do outro, um teste atrás do outro, estando constante- mente sob a mira implacável do inimigo".

Certa noite em que preguei sobre este tema, soube que alguns amigos do Zaire tinham vindo me visitar. Logo depois do culto, entrei na sala em que estavam e um deles disse: "A mensagem desta noite foi para nós. Estivemos justamente nesse lugar". E estiveram a milhares de quilômetros de distância, no Zaire! E eu, por minha vez, pensei que a mensagem tivesse sido para mim, porque ao prepará-la me pareceu que fora feita sob medida para as minhas necessidades. Este é um princípio universal: se você decidir viver piedosamente, o Princípio do Perigo diz que o inimigo vai fazer de você um alvo.

Mas nem tudo está perdido. Longe disso! Nossa maior esperança e segurança é que aquele que está em nós seja maior do que o que está no mundo. Não enfrentamos um inimigo assim tão poderoso que não possamos lutar contra ou nos mantermos firmes e seguros em nossa decisão. Nosso Senhor é o Deus da esperança. O Salmo 4:3 chama o que eu diria ser "o reforço para a batalha". A linha de provi-

322 MOISÉS: UM HOMEM DEDICADO E GENEROSO

são de Deus nunca termina. Quando seus seguidores piedosos precisam de alguma coisa, ele provê os reforços necessários. Enquanto você luta, Deus providencia tudo o que você precisa: "Sabei, porém, que o Senhor distingue para si o piedoso [piedosa]; o Senhor me ouve quando eu clamo por ele" (inserção minha).

Quando você decide que vai honrar a Cristo como um homem, mulher, ou jovem piedoso, quando decide ser alguém que se entrega realmente a Deus — não apenas um cristão medíocre que aceita Cristo como uma válvula de escape —, você se torna objeto de especial atenção do Senhor. Ele diz que "separa" você para ele mesmo. O versículo acrescenta: "O Senhor me ouve quando eu clamo por ele". Esses dois pensamentos se harmonizam. O indivíduo piedoso muitas vezes tem de invocar a Deus quando os perigos se apresentam. Ele diz então: "Estou aqui e vou responder. Vou ouvir o que tem a dizer".

Mesmo assim, quando caminha com Deus, vive sob a ameaça muito real do ataque inimigo. Quanto mais perto você anda, maior o perigo.

MURMURAÇÕES DO POPULACHO

Moises escolheu andar com Deus e, portanto, tornou-se um alvo do inimigo. Como esse homem piedoso enfrentou esses perigos inevitáveis? No Livro de Números, capítulo 10, o povo de Deus se encontra no monte Sinai, construindo um tabernáculo, procurando entrar num acordo a respeito da lei de Deus. Eles se preparavam para deixar o Sinai e seguir para Canaã, a Terra Prometida. Moisés pretende levá-los naquela direção.

Em primeiro lugar, porém, deparam-se com os perigos. "Aconteceu, no ano segundo, no segundo mês, aos vinte do mês, que a nuvem se ergueu de sobre o tabernáculo da congregação... Então desarmaram o tabernáculo, e os filhos de Gérson e os filhos de Merari partiram, levando o tabernáculo" (Nm 10:11,17).

O tabernáculo era uma casa de adoração portátil, formada por tendas e sustentada por estacas que podiam ser desmontadas, dobra-

RECLAMAÇÕES CONTRA UM LÍDER PIEDOSO 323

das e levadas nos ombros do povo de Deus. Quando os israelitas chegavam a um determinado lugar e armavam acampamento, eles levantavam o tabernáculo. Quando a nuvem se movia, dobravam o tabernáculo e o carregavam até a parada seguinte. Parece uma manobra militar, não parece? No momento em que você acaba de arrumar tudo, eles dizem: "Arme a barraca", e você repete toda a operação. Era exatamente isso o que o povo de Deus fazia.

Você talvez pense que aquele povo que acabara de ver a lei de Deus escrita com o dedo dele, que acabara de construir essa nova e peculiar facilidade portátil de adoração projetada por Deus, devia estar no auge do entusiasmo com a idéia de ir para a terra de Canaã. Mas não estava.

Todo grupo grande que deseja caminhar com Deus, parece sempre atrair outro menor que não possui tal desejo. As Escrituras chamam esse segundo grupo de "populacho". Sabe o que significa a palavra hebraica para "populacho"? Plebe, povinho. Deus sabe realmente como rotular determinado grupo. Você pode denominar essas pessoas de "curral carnal".

Nesse acampamento de centenas de milhares de israelitas e alguns estrangeiros que se juntaram a eles em seu Êxodo do Egito, um segmento representava um espinho constante para Moisés. Em Êxodo 12:38, Deus os chamara de "misto de gente". Aqui os chama de "populacho". Números 11:1 descreve um grupo de hebreus a caminho de Canaã que subitamente reluta em seguir a direção de Deus:

Queixou-se o povo de sua sorte aos ouvidos do Senhor [o populacho está reclamando e, portanto, essas pessoas reclamam]; ouvindo-o o Senhor, acendeu-se-lhe a ira, e fogo do Senhor ardeu entre eles e consumiu extremidades do arraial.

Números 11:1, inserção do autor

Quando as coisas esquentavam, esses queixosos reclamavam a Moisés, e Moisés orava ao Senhor e o fogo apagava. Mas eles não paravam aí. Os versículos 4-5 dizem: "E o populacho, que estava

324 MOISÉS: UM HOMEM DEDICADO E GENEROSO

no meio deles, veio a ter grande desejo das comidas dos egípcios; pelo que os filhos de Israel tornaram a chorar, e também disseram: Quem nos dará carne a comer? Lembramo-nos dos peixes que no Egito comíamos de graça; dos pepinos, dos melões, dos alhos silvestres, das cebolas e dos alhos".

Eu então respondo: "E isso que acontece quando se comem coisas desse tipo!" Alhos, peixes e cebolas? Não admira que o apetite deles tenha passado. E eles se queixaram: "Agora, porém, seca-se a nossa alma, e nenhuma coisa vemos senão este maná" (v. 6).

Os resmungos continuaram, conduzindo Moisés diretamente ao seu primeiro perigo.

O PERIGO DO DESÂNIMO E DA DEPRESSÃO

Embora você possa ser uma pessoa piedosa, vai conseguir escutar esse tipo de conversa deprimente só até certo ponto, antes que seu espírito comece a desanimar. Você quer caminhar com Deus, mas tem como companheiros pessoas que não querem. Elas são invariavelmente falantes, mesquinhas e negativas. Não querem seguir o caminho de Deus, mas seu próprio caminho. Estão sempre olhando para trás, dizendo como as coisas costumavam ser boas (antes que você aparecesse).

O dr. Howard Hendricks costumava dizer: "Aqueles bons e velhos tempos criaram esses maus tempos que vivemos hoje". Meu fiel mentor acertou bem no alvo, não acertou? Gostamos de recordar aqueles "bons e velhos tempos" e nem sequer queremos dar uma oportunidade aos desafios dos novos tempos. O populacho nunca compreende isso.

Moisés ouviu esse grupo triste queixar-se e reclamar. Ouviu isso continuamente, à exaustão. "Então Moisés ouviu chorar o povo por famílias, cada um à porta de sua tenda: e a ira do Senhor grandemente se acendeu, e pareceu mal aos olhos de Moisés" (v. 10).

Imagine Moisés andando entre as tendas e ouvindo as queixas constantes. Há murmúrios, choro, cenhos franzidos e caras amarradas, cabeças sacudindo e expressões sombrias. Dentro de pouco tem-

RECLAMAÇÕES CON TRA UM LÍDER PIEDOSO 325

po o homem começa a cansar-se de tudo aquilo. O texto diz que "pareceu mal" aos seus olhos.

Gostaria de dizer que Moisés passou incólume por todos esses perigos. Ele soube resolver quase todos. Mas esse foi um que encontrou dificuldades. Identifico-me com ele. Compreendo que Moisés queria muito que o povo visse o Deus que ele vira na sarça ardente e confiasse na nuvem que se movia diretamente para Canaã, mas não foi assim que agiram. Ele queria que desenvolvessem um apetite celestial que se deleitasse com o alimento celestial, mas isso não aconteceu. Finalmente o deixaram exaurido e ele desanimou. Não é de surpreender que dissesse a Deus:

Por que fizeste mal a teu servo, e por que não achei favor aos teus olhos, visto que puseste sobre mim a carga de todo este povo? Concebi eu porventura todo este povo? Dei-o eu à luz para que me digas: Leva-o ao teu colo, como a ama leva a criança que mama... Donde teria eu carne para dar a todo este povo?...Eu sozinho não posso levar a todo este povo, pois me é pesado demais. Se assim me tratas, mata-me de uma vez [ele está mesmo desanimado, não está?], eu te peço, se tenho achado favor aos teus olhos; e não me deixes ver a minha miséria.

Números 11:11-15 (inserção minha)

Você tem uma idéia de como Moisés se sentia? Já ficou desanimado assim? Quanto mais se dedica, mais pesado se torna o fardo. Quanto mais rápido o navio, mais pesada a âncora. Ouça, quanto maiores os sonhos que Deus lhe der, tanto mais insistente o populacho que o faz esmorecer. Eles vão queixar-se, resmungar, enfurecer-se. Se escutar por algum tempo, ficará completamente deprimido.

Certa vez conheci um jovem professor numa escola secundária de Los Angeles que tentava ensinar matemática a um grupo de garotos. Entre eles havia um "populacho" que não queria aprender nada. O rapaz me disse: "Pastor Chuck, o que faço, na verdade, é ensinar disciplina à classe. Nas horas vagas, incluo um pouco de matemática". Contou-me também que certa vez passou parte da aula tentan-

326 MOISÉS: UM HOMEM DEDICADO E GENEROSO

do convencer um dos alunos a ficar sentado quieto na carteira. "Queria ensinar a ele algumas coisas", disse.

Você acha que esse professor algum dia enfrentou o desânimo? Ele era formado em matemática, adorava a matéria e sabia como ensinar. Mas passou a maior parte do tempo apagando incêndios que não tinham nada a ver com sua profissão. Em vez de lutar com fórmulas e equações, teve de corrigir alunos indisciplinados.

Posso dar uma dica? (Não cobro nada por ela.) Tão logo um grupo ficar suficientemente grande, o populacho vai aparecer. No momento em que sua turma bíblica começar a crescer, mais cedo ou mais tarde você vai notar a presença do populacho. Você freqüenta uma escola bíblica, um seminário, uma faculdade cristã, e encontra o populacho. Visita uma igreja de qualquer tamanho, e lá está o populacho. Começa uma igreja, e é só questão de tempo até que ele apareça. Isso se aplica a grupos da igreja, classes da escola dominical, corais. Não importa como, quando você consegue reunir um grupo grande, o populacho já está instalado.

Isso significa que quando deseja que sua vida agrade ao Senhor, quando deseja ter significado para Cristo, mais cedo ou mais tarde vai estar lado a lado com o populacho, com aqueles que não querem agradar a Deus de modo algum. Se não tiver cuidado, permitirá que tirem o melhor que há em você, levando-o ao desânimo e à depressão.

Uma das maiores batalhas que enfrentei como seminarista foi o populacho. Eu era ingênuo o bastante para acreditar que os homens que nos ensinavam eram todos homens de Deus. Também era inexperiente o bastante para pensar que se você realmente se aplicasse nos estudos, eles valeriam a pena. Mas uma pequena porcentagem de meus colegas não dava a menor importância a eles, e eu tinha de lutar para afastar o desânimo desses rapazes. Agora sei que não era o supersanto que nunca havia pecado, aquele que passara pela vida imaculado. Meus objetivos se chocavam com os de alguns companheiros, e tivemos alguns confrontos. Isso era desagradável, deprimente até.

RECLAMAÇÕES CONTRA UM LÍDER PIEDOSO 327

Se você enfocar esses confrontos, porém, continuará desanimado. Foi isso que aconteceu com Moisés. Ele ouviu alguém chorando nas tendas e finalmente choramingou: "Senhor, tire a minha vida!" Essa é a suprema expressão da depressão.

Um Elias exausto certa vez resmungou palavras similares debaixo de uma árvore mirrada no deserto. Jonas também disse a mesma coisa sob uma planta murcha fora dos muros de Nínive. Ambos estavam prestes a desistir; ambos pediram ao Senhor que lhes desse uma morte rápida. Mas o Senhor recusou-se a tirar a vida de Elias e de Jonas, e também não ia tirar a de Moisés. Cuidou, no entanto, do problema.

Moisés estava novamente tentando fazer demais e o Senhor dividiu então suas tarefas. Você pode ler isso em Números 11:16-25. Deus cuidou da necessidade dele. No momento, porém, em que o perigo saiu pelo lado direito da cena, outro surgiu do lado esquerdo. No encalço do primeiro veio o segundo. É isso que acontece quando decidimos caminhar com Deus. Os perigos às vezes vêm em seqüência.

O PERIGO DO CIÚME E DA INDISPENSABILIDADE

O segundo perigo de Moisés começou com estas palavras no versículo 26: "Porém no arraial ficaram dois homens". Essa declaração pode não significar muito para nós, a não ser que compreendamos que Moisés havia dito a setenta anciãos do povo que saíssem e ficassem perto da tenda da assembléia. Deus nomeara esses setenta para ajudar Moisés a carregar o fardo. Mas ao ser feita a chamada, dois não haviam comparecido. Um se chamava Eldade, o outro Medade. Nenhum era rebelde; de fato, haviam sido guiados pelo Espírito de Deus a permanecer no acampamento. O versículo 26 diz: "Repousou sobre eles o Espírito... e profetizavam no arraial". Um jovem viu o que acontecera e correu afobado para contar a Moisés: "Eldade e Medade estão profetizando no acampamento".

328 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Qual o significado disso? Deus queria dizer: "Moisés, esse trabalho é seu. Você é o profeta. Se alguém vai profetizar, é você que deve fazê-lo". Foi isso que aquele jovem compreendeu.

"Moisés, dois sujeitos não estão seguindo o programa", avisou ele. "E, mais ainda, estão fazendo ali o seu trabalho". É interessante observar o que aconteceu em seguida: "Josué, filho de Num, servidor de Moisés, um dos seus escolhidos, respondeu, e disse: Moisés, meu senhor, proíbe-lho" (v. 28).

Esses jovens tinham ciúmes da posição de Moisés e disseram: "Moisés, não deixe que façam isso. Você é o profeta. O que Eldade e Medade estão fazendo ali? Quem eles pensam que são, profetizando desse modo? Esse trabalho é seu".

Josué diz: "General Moisés, ponha um fim nisso".

Gosto de ver como Moisés reagiu. Ele responde tranqüilamente, sem o menor sinal de ciúmes: "Tens tu ciúmes por mim? Tomara todo o povo do Senhor fosse profeta, que o Senhor lhes desse o seu Espírito!" (v. 29)

Quanta generosidade. Não havia insegurança alguma nesse homem de Deus.

Você está buscando a piedade? Quer ter significado para Cristo? Deus lhe concedeu qualidades para servir? Caso positivo, em algum ponto do caminho, vai enfrentar o perigo dos ciúmes, o sentimento de ser "indispensável" para um determinado ministério. Alguns ao seu redor vão plantar sementes de ciúmes em seu coração, que o tentarão a sentir-se indispensável. Talvez você pense: O que ela está ensinando eu posso ensinar muito melhor. Ou: É preciso cuidado com esse homem, ele está querendo tomar conta de tudo. Todos sabem que eu sou o líder. Ou: Não posso dar-me ao luxo de descer do pedestal, fui eu que fundei esta organização. Você já ouviu essas palavras ou similares? Já as pronunciou? São expressões de inveja mesquinha e de indispensabilidade orgulhosa.

Ouça o que vou dizer! Todos podem descer de sua posição quando Deus está no trono. Algumas das pessoas mais ciumentas e desconfiadas do mundo são as chamadas figuras cristãs públicas,

RECLAMAÇÕES CONTRA UM LÍDER PIEDOSO 329

enamoradas de seus próprios recortes de jornal. É vital para elas dizer os nomes certos, serem vistas com as pessoas certas e que outros pensem bem a seu respeito. Cobiçam a fama. Que Deus ajude aquele cuja fama é maior do que a delas!

Uma velha poesia adverte sobre esse perigo:

Às vezes, quando se sente importante, Às vezes, quando seu ego está em alta; Às vezes, quando você toma como certo que em tudo é o "vencedor"; Às vezes, quando sente que sua ausência deixaria um vazio impreenchível, Siga apenas estas simples instruções, E veja como elas tornam sua alma humilde. Pegue uma vasilha, encha-a de água, Coloque nela a sua mão até o punho. Puxe-a depressa, e o buraco que fica É a medida de quanto será notada sua falta. Você pode espirrar tanta água quanto quiser ao entrar, E movimentar a água à vontade, Mas pare, e descobrirá num minuto Que ela está de volta onde antes se encontrava.1

Você não é indispensável. Nem eu. Ninguém é indispensável, exceto o Senhor Jesus Cristo. Ele é o líder. É o Número Um. E o fundador. É o primeiro lugar. Quando ele move alguém e o substitui por outro, ou quando remove alguém e estabelece outro, é ele quem dá as ordens. Esse é seu direito soberano. O problema surge quando começamos a pensar que nós somos soberanos. Meu amigo, ele o colocou onde queria que estivesse. Foi ele quem lhe deu esse emprego. Ele pode tirar tão depressa quanto dá. Portanto, faça fielmente seu trabalho, seja modesto e exalte a Cristo.

Moisés passou facilmente pelo segundo teste, e você pode então pensar que os testes haviam terminado. Nada mais de perigos. Errado.

330 MOISÉS: UM HOMEM DEDICADO E GENEROSO

O PERIGO DE SER MAL COMPREENDIDO E MAL INTERPRETADO

E muito possível que a mulher de Moisés, Zípora, tivesse morrido e ele se decidira casar com outra, descrita em Números 12:1 como a mulher cusita. Veja a reação a essa escolha de Moisés: "Falaram Miriã e Arão contra Moisés..."

Espere um pouco! Quem são Miriã e Arão? Não são a irmã e o irmão de Moisés? Isso mesmo. Parece incrível, mas os irmãos mais velhos de Moisés começaram uma campanha de murmurações contra o mais moço. Por quê? "Por causa da mulher etíope, que tomara; pois tinha tomado a mulher cusita" (Nm 12:1).

Essa passagem confunde algumas pessoas, porque Deus defendeu Moisés, embora ele se casasse com uma não-israelita. O Senhor não proibira especificamente que qualquer israelita se casasse com uma cananéia? Sim. Mas essa mulher era cusita e não cananéia. Não fora feita proibição contra isso. O problema (na mente deles) era Moisés não ter pedido conselho a Miriã ou a Arão. Eles se consideravam membros indispensáveis do círculo íntimo. Não apreciaram quando Moisés tomou sua decisão sem consultá-los. Disseram então: "Porventura tem falado o Senhor somente por Moisés? Não tem falado também por nós" (v. 2)?

É quase possível ouvir o silêncio da audiência quando o texto declara: "O Senhor o ouviu". Esse não é um pensamento consolador. Em toda fofoca há um fofoqueiro e um ouvinte, e entre os dois está o Senhor. Antes de o ouvinte escutar o comentário, o Senhor já interceptou o que foi dito. Miriã e Arão interpretaram mal esse homem de Deus que tomara uma decisão sobre seu casamento, a qual eles não compreenderam e não queriam aprovar. Por terem se ofendido, começaram a espalhar boatos, deixando implícita a mensagem: "Olhem, nós também somos autoridades como Moisés". Vamos examinar esse ponto mais tarde.

As Escrituras dizem: "Logo o Senhor disse a Moisés, e a Arão, e a Miriã: Vós três saí à tenda da congregação. E saíram eles três" (Nm 12:4).

RECLAMAÇÕES CONTRA UM LÍDER PIEDOSO 331

Quando leio essas palavras, sinto um arrepio na espinha. Lembra-se dos dias de escola quando você recebia um bilhete para comparecer à diretoria? Tinha vontade de sair correndo porta afora, não tinha? Não podia acreditar que você estava sendo chamado pela diretora. E Deus tinha dito: "Vocês três, venham ao meu escritório./^."

É claro que Moisés não tinha nada a perder. Ele ficou alegre por voltar à presença do Senhor. Mas esse não era o caso de Miriã e Arão. Quando o Senhor lhes disse "saí", pode estar certo de que obedeceram. E foi isso que ouviram: "Então, disse: Ouvi agora as minhas palavras; se entre vós há profeta, eu, o Senhor, em visão a ele me faço conhecer, ou falo com ele em sonhos. Não é assim com o meu servo Moisés, que é fiel em toda a minha casa. Boca a boca falo com ele, claramente, e não por enigmas; pois ele vê a forma do Senhor: como, pois, não temestes falar contra o meu servo, contra Moisés?" (w. 6-8)

"Tenho uma relação única com meu servo Moisés", proclamou Deus. "Ninguém vai tomar o seu lugar. Ele vai morrer, mas não haverá ninguém neste acampamento, enquanto ele viver, com quem eu mantenha uma relação cara a cara. Portanto, deixem-no em paz!"

Para se assegurar de que ninguém interpretaria mal a mensagem divina, Deus mandou um pequeno cartão de visita:

A nuvem afastou-se de sobre a tenda; e eis que Miriã achou-se leprosa, branca como neve; e olhou Arão para Miriã, e eis que estava leprosa. Então disse Arão a Moisés: Ai! senhor meu, não ponhas, te rogo, sobre nós este pecado, pois loucamente procedemos, e pecamos. Ora, não seja ela como um aborto, que saindo do ventre de sua mãe, tenha metade de sua carne já consumida.

Números 12:10-12

E como Moisés reagiu? No versículo 13 ele clama ao Senhor: "Ó Deus, rogo-te que a cures".

Quanta humildade! Moisés fora traído e caluniado pela irmã, mas ao vê-la leprosa, ele disse: "Deus, limpe o corpo dela". Deus deu então sua resposta. O versículo 14 registra uma declaração diferente

332 MOISÉS: UM HOMEM DEDICADO E GENEROSO

de qualquer outra feita pelo Senhor. "Se seu pai lhe cuspira no rosto, não seria envergonhada por sete dias? Seja detida sete dias fora do arraial, e depois recolhida".

Em outras palavras: "Que este castigo dure uma semana". Miriã foi então excluída do acampamento por sete dias e o povo não partiu até que ela se reunisse novamente a ele.

Números 12 nos lembra como Deus protege a pessoa piedosa. Você não precisa defender-se, Deus defende você. Posso assegurarlhe de que você vai ser mal interpretado. Mal compreendido. Mas, quando isso acontecer, não tente encobrir todas as calúnias ditas a seu respeito. Deixe que Deus seja o seu defensor.

Acho especialmente interessante que Moisés tenha sido caluniado na esfera pessoal da privacidade doméstica. Afinal, não tinha de prestar contas a ninguém sobre seu casamento. Contudo, a vida doméstica parece ser a área de escândalo que o populacho mais gosta de investigar, especialmente entre os piedosos. Deus não nos diz o motivo pelo qual Moisés se casou com a cusita. Mas acho que se ele defendeu a decisão de Moisés, era porque ambos já tinham conversado a respeito, e Moisés escolheu a mulher com quem Deus queria que ele se casasse. Arão e Miriã, porém, não quiseram aceitar e criaram problemas para o irmão mais moço.

Este é um aviso de que todos necessitamos obedecer: Tenha o máximo de cuidado com o que você diz sobre os assuntos particulares do povo de Deus. Se não conhece os fatos e está preocupado com as aparências, converse pessoalmente com o indivíduo, ou, melhor ainda, não diga nada.

Fico espantado com o que alguns dizem sobre os parceiros que outros escolhem para casar-se. Um dos santos da última geração perdeu a esposa e depois de ficar alguns anos sozinho, casou-se com uma mulher bem mais moça. Uma intrometida foi falar com ele e disse: "Como teve coragem de casar com alguém tão mais jovem que você?" Com sua voz rouca ele respondeu: "Minha cara, prefiro muito mais o cheiro de perfume do que o de remédios!"

Boa resposta! Gostaria de ter visto a cara da mulher. Ela provavelmente não disse nada (se era inteligente). Assegure-se de ter esco-

RECLAMAÇÕES CONTRA UM LÍDER PIEDOSO 333

lhido a mulher ou o homem que Deus quer para você e esqueça tudo o mais. Alguém irá invariavelmente provocá-lo por causa de sua escolha. O mesmo se aplica a seus filhos. Ignore o que as pessoas dizem. Vá em frente. Será útil lembrar as palavras de uma alma sábia: "Maturidade é mudar de uma pele suave e um coração duro para uma pele dura e um coração suave". Conselho sábio. Não permita que seu coração endureça, mas deixe sua pele engrossar. Você jamais será o líder piedoso que pode ser se tiver uma pele fina demais.

Ainda outro perigo aguardava Moisés assim que esse passou.

O PERIGO DE SER IGNORADO E REJEITADO

Quando os israelitas chegaram na fronteira da terra de Canaã, Deus mandou-os espiar a terra. Ele os enviou do deserto de Parã para fazer um reconhecimento de Canaã. Doze espias foram enviados, passando quarenta dias examinando tudo. Ao voltar, eles disseram: "Fomos à terra a que nos enviaste; e verdadeiramente mana leite e mel; este é o fruto dela" (Nm 13:27).

Os espias provaram isso trazendo belos frutos da terra de Canaã. O coração de Moisés bateu mais forte, porque ele podia imaginar o povo entrando na terra e ocupando-a, como Deus havia prometido. Era verdade! Isso iria acontecer! O que Deus lhe dissera no deserto de Midiã seria finalmente cumprido.

Mas de repente algo terrivelmente errado ocorreu. Ao continuarem seu relatório, os espias declararam: "O povo, porém, que habita nessa terra é poderoso, e as cidades mui grandes e fortificadas; também vimos ali os filhos de Enaque" (v. 28).

Quem eram os descendentes de Enaque? Eram gigantes, uma raça de homens enormes, que deixaram os espias aterrorizados. "Estávamos andando e de repente encontramos esses gigantes. Fugimos na mesma hora e nos apressamos para vir contar-lhes tudo sobre isso".

Há muitos anos quando servimos numa igreja de New England, havia ali um casal que poderia ter surpreendido Enaque. O marido e a mulher eram altíssimos, e quando ela punha salto alto, você pensava que havia caído numa cova de gigantes. Eles ficavam lá em cima!

334 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Certa tarde, depois do serviço, eles entraram na mercearia para comprar algumas coisas antes do almoço de domingo. Enquanto empurravam o carrinho em um dos corredores, uma criança entrou repentinamente à frente deles, vinda de outro corredor. A criança parou subitamente, olhou para os dois e gritou: "Gigantes!" e sumiu em outra direção.

Foi o que aconteceu aqui. O relatório dos espias desanimou o povo, e o coração de Moisés se abalou. Embora Calebe e Josué insistissem: "Não dêem ouvidos a esses homens que falam de gigantes. Temos um Deus gigantesco que pode fazer-nos entrar na terra", eles se recusaram a ouvir. Esses homens tinham suas próprias idéias sobre o que fazer. "E diziam uns aos outros: Levantemos a um para nosso capitão, e voltemos para o Egito" (14:4).

Eis aí o perigo de ser ignorado e rejeitado. O povo não queria Canaã. Não queria Moisés também. Seu desejo era voltar para as cadeias na terra carnal do Egito, porque entrar na Terra Prometida significava combater os gigantes. Quão sérios estavam sobre sua retirada total? Quando Calebe e Josué tentaram convencer o povo a entrar em Canaã, e Moisés e Arão caíram de bruços diante de toda a Israel, a Bíblia diz: "Toda a congregação disse que os apedrejassem" (Nm 14:10). Em outras palavras: "Livremo-nos deles. Se não concordarem conosco, nós os matamos. Vamos pegar essas pedras!"

O comportamento violento, ingrato, injusto do povo nesse momento crítico poderia ter facilmente atirado Moisés a um quarto e último perigo.

O PERIGO DO RESSENTIMENTO E DA VINGANÇA

Que boa oportunidade para Moisés dizer: "Deus, mate-os!" Se alguém tinha o direito de sentir ressentimento e desejo de vingança, era Moisés naquele momento. A glória de Deus apareceu imediatamente na tenda da congregação e o Senhor disse a Moisés: "Até quando me provocará este povo, e até quando não crerá em mim, a despeito de todos os sinais que fiz no meio deles? Com pestilência o ferirei, e o deserdarei; e farei de ti povo maior e mais forte do que este" (w. 11-12).

RECLAMAÇÕES CONTRA UM LÍDER PIEDOSO 335

Essa tinha de ser uma proposta tentadora! Começar de novo do ponto zero. Enterre esses reclamadores e chorões no deserto e comece com uma nova nação. O que Moisés faria? Se o Senhor tivesse oferecido isso a mim, eu poderia ter dito: "Olhe, vou pensar um minuto. Não é uma má idéia, Senhor. Posso levar Calebe e Josué também?"

Mas Moisés não fez isso. Esse humilde servo respondeu: "Mas, Senhor, seu testemunho está em jogo aqui. Os egípcios ouvirão falar disso e o que as nações dirão?" Nenhum ressentimento, nenhuma vingança. Nem sequer uma leve ofensa. Moisés na verdade defendeu aquela nação orgulhosa e pediu ao Senhor que detivesse sua mão contra eles. E o Senhor atendeu.

Quando alguém o atinge e no entanto parece ser uma pessoa piedosa, esse último risco de ressentimento e vingança irá corroê-lo como ácido. Muitos homens de Deus, repletos desses sentimentos negativos, transformam o púlpito numa arma para lutar contra o populacho. Plano errado. Muito melhor é deixar as coisas com Deus, como fez Moisés.

TRÊS VERDADES SOBRE UMA VIDA PIEDOSA

Antes de fecharmos esta parte notável da história da vida de Moisés, quero sugerir três afirmações que podem ajudar na história da sua vida.

A VIDA PIEDOSA NUNCA É FÁCIL.

Compensadora? Sim. Plena? Sim. Digna de ser vivida? Mil vezes sim. Mas nunca é fácil. Pense duas vezes antes de entrar no ministério cristão. Pense duas vezes antes de assinar o documento para servir num ministério transcultural ou numa escola crista, porque uma série infindável de dificuldades o aguarda. Cuidado todos vocês, santos de pele delicada!

A VIDA PIEDOSA É MUITAS VEZES POSTA EM RISCO.

Alguém disse que a vida dos apóstolos era como a trilha de uma lebre ferida caminhando pela neve — uma trilha de sangue. Se esti-

336 MOISÉS: UM HOMEM DEDICADO E GENEROSO

ver procurando uma existência segura, sem problemas, a estrada estreita que serpenteia pelos montes escarpados da piedade pode não ser uma boa escolha para você.

A VIDA PIEDOSA É SEMPRE CHEIA DE NOVIDADES.

Um amigo cristão com uma família ativa, aventureira, balançou a cabeça arrependido e disse: "Minha sogra gosta muito de vir visitarnos. Ela diz: 'Algo sempre acontece quando estou aqui'. E tão excitante!"

A verdade é que se você quiser realmente interromper a síndrome do tédio, assuma um compromisso com Jesus Cristo. A vida o começará a envolver! Vai tornar-se eficaz, capacitado pelo céu e a batalha rugirá. Você nunca vai encontrar pessoas adormecidas nas trincheiras. Elas estão na briga. A guerra está explodindo. Quando sua vida conta para Cristo, ela se torna emocionante. O Salmo 34 diz: "Muitas são as aflições do justo, mas o Senhor de todas o livra" (v. 19).

Posso prometer-lhe uma coisa: se sua caminhada com Cristo for firme, o inferno inteiro vai estar à solta. Mas todo o céu virá em seu socorro! E você se encontrará no meio de uma guerra cósmica, na qual os riscos são altos.

Se gostar de cebola, alho e peixe, cobertos com uma xícara de água quente do Nilo, estará melhor fabricando tijolos "no bom e velho Egito". Mas se estiver disposto a entrar para um dos comandos do Senhor, por trás das linhas inimigas, a vida nunca mais será a mesma. Talvez só possa fazer uma refeição rápida de maná enquanto se esquiva das lanças, mas nunca sentirá tédio.

De fato, esse é o único meio de viver!

C erta manha, há muitos anos, lemos em atônita incredulidade as manchetes na mesa do café: "Doze Corpos Foram Encontrados". Um maníaco havia matado a pauladas doze pessoas e as enterrara em sepulturas rasas ao longo do rio Feather, na Carolina do Norte. Depois de uma investigação horripilante, o número de corpos aumentou muito.

Desde aquele dia de primavera, há décadas, têm havido inúmeras manchetes desse tipo. Ataques sangrentos em restaurantes fast food, em bairros elegantes nos subúrbios, prédios do governo, salas de tribunais, correios e até, mais recentemente, nas escolas públicas e parques infantis. As armas se tornaram mais temíveis, os matadores e vítimas bem mais jovens, mas as repercussões de tais tragédias continuam, como sempre, as mesmas.

Posso ainda me lembrar de uma manhã quente no Texas, no dia Io de agosto de 1966, quando Charles Whitman levou um arsenal ao terraço de observação na torre da biblioteca da Universidade do Texas. Antes de terminar sua obra mortal e também ser morto, ele havia matado nada menos do que dezesseis pedestres inocentes nas ruas da cidade de Austin. Alguns meses antes, Richard Speck entrou numa república em Chicago e estrangulou ou esfaqueou até a morte oito estudantes de enfermagem.

338 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Quando ouvimos notícias desse tipo, balançamos a cabeça incrédulos. Como você processa uma informação como essa, que desafia a lógica? Quem pode identificar uma razão para tal carnificina? Nem mesmo os profissionais em psiquiatria, que examinam os assassinos, podem descobrir muito sentido em seus atos mortais de violência. Por mais que detestemos admitir, a paisagem está coberta de destroços de assassinatos e perversidades.

Fui criado na cidade que durante toda a minha infância tinha o índice mais alto de crimes: Houston, Texas. Lembro-me de ler sobre assassinatos como se fossem eventos comuns. À medida que envelhecemos, ficamos nos perguntando como é possível que homens e mulheres ceifem a vida de seus irmãos e irmãs inocentes com as próprias mãos.

Penso que a revista Time indicou o que pode ser a melhor resposta. Ao cobrir uma história de assassinato há vários anos, seus editores publicaram uma foto do criminoso com a legenda: "Um Momento de Ira".

Os comentaristas sociais advertem que as pessoas estão hoje sentadas sobre um barril de pólvora emocional. Passamos praticamente do pavio curto para o sem pavio. De que outro modo seria possível explicar o fenômeno da "raiva na estrada", onde o motorista aponta uma arma pela janela e atira em outro que o enraiveceu? Quer você seja um profissional universitário quer pratique seu ofício em privacidade; quer seja um estudante quer um trabalhador empregado num escritório ou numa fábrica — você vive sobre um tanque de nitroglicerina. Se qualquer coisa insignificante balançar a mistura explosiva, algo vai subitamente para os ares. No geral é a vida de outro ser humano.

CINCO NÍVEIS DE IRA

Os psicólogos estudaram profundamente a ira. Embora não tenham chegado a nenhuma resposta garantida — porque não existe uma resposta final além de Jesus Cristo — eles nos ajudaram a analisar a

UM INSTANTE DE IRA 339

dinâmica emocional da ira. Descobriu-se que a ira surge ao longo de cinco passos, cada um mais intenso que o outro.

É-nos dito que a ira começa com uma leve irritação. Esse estágio é marcado por uma sensação de mal-estar, provocada por algum distúrbio desagradável. Pode ser tão leve quanto um congestionamento no trânsito ou as pressões de criar crianças barulhentas numa casa pequena, em aposentos apertados, sem dinheiro, paciência ou sono suficientes. A leve irritação começa então a crescer.

Isso pode levar à indignação, um nível mais profundo de intensidade. Indignação é uma reação a algo que parece injusto ou ilógico. Pode ser expressa de modo violento, como algumas vezes acontece nos eventos esportivos, quando alguém nas arquibancadas atira uma garrafa de bebida no campo ou na quadra e atinge o árbitro. O sujeito na arquibancada está zangado porque acredita que o juiz foi injusto. Ele se expressa, então, num modo de indigniviolência franca.

O terceiro nível é a cólera, a qual, segundo os psicólogos, nunca deixa de se manifestar. Ninguém retém a cólera. Quando a irritação atinge esse nível, surge um forte desejo de se vingar, revidar ou se defender, e não é possível voltar atrás. A cólera têm muitas caras, e todas são feias.

A irritação incontrolada pode se transformar em fúria, o quarto nível, que pode incluir uma perda momentânea do controle — e até mesmo uma perda temporária da sanidade. Num momento de fúria atacamos outra pessoa. Há alguns anos assisti a um documentário na televisão que apresentava ao espectador casos seguidos de crimes cometidos na região de Los Angeles. A maioria deles ocorrida dentro das casas, entre marido e mulher. Os conflitos domésticos não-resolvidos em geral levam à ftíria.

O quinto estágio é a raiva, o nível mais intenso das expressões da ira. A raiva, aprendemos, é a forma mais perigosa da ira. Ela pode dominar de tal modo o indivíduo que inspira atos brutais de violência, algumas vezes praticados sem percepção consciente. Especialistas dizem que a pessoa enraivecida pode cometer um crime sem quase se dar conta do que está fazendo; psicologicamente, ela fica fora de si.

340 MOISÉS: UM HOMEM DEDICADO E GENEROSO

AJUDA DE DENTRO PARA FORA

O pastorado não é um cargo fácil de exercer. Você tem de tratar ocasionalmente com o lado cru, brutal da vida. Há muitos anos, eu estava sentado no escritório da igreja quando chegou um indivíduo que havia marcado uma entrevista. Visivelmente abalado e com marcas de uma briga recente, ele me contou que tinha acabado de espancar a mulher e a filha. Quando saiu de casa, a filha estava inconsciente e a mulher sentada na beira da cama, chorando e coberta de sangue. Isso me fez lembrar de uma vez em que estive numa cela de prisão, olhando diretamente nos olhos de um homem que matara o filho com as próprias mãos num momento de raiva.

Cheios de remorso, esses dois homens me disseram: "Algo aconteceu dentro de mim e nesse momento de raiva fiz isso". Ambos confessaram abertamente seus crimes.

Ironicamente, o homem que matou o filho disse: "Uma coisa estranha nessa parte do país em que moramos é que as autoridades não vão tirar a minha vida por causa do que fiz, embora mereça isso. Vou ter de viver com a lembrança de ser um assassino".

Antes de nos dispormos a julgar qualquer desses homens, devemos confessar que todos temos dentro de nós o mesmo potencial para a violência. A única diferença é a questão de controle. Aqueles dentre nós que entregaram sua vida a Cristo sabem que temos alguém em nosso íntimo que nos capacita a controlar nossa ira. Não se engane: se tivéssemos liberdade para dar plena vazão à ira, usaríamos os punhos ou outra arma letal para tirar a vida de outros. Os cristãos, porém, possuem dentro de si a pessoa do Espírito Santo, que exerce restrição e controle sem precedentes sobre nossa vida. Ele serve como uma autoridade interior que nos diz: "Agora chega!"

Se você estiver lendo estas palavras e não conhecer Cristo como Salvador, devo dizer-lhe que não tenho esperanças a dar-lhe nesse campo da ira. Não tenho encorajamento a oferecer, quer expresse sua ira por meio de palavras grosseiras, dos punhos, quer mediante algo mais perigoso. O Senhor vivo é o único que conheço que pode ser uma inundação e apagar as chamas de um temperamento rancoroso.

UM INSTANTE DE IRA 341

É possível que, mesmo sendo cristão, você ainda lute com explosões violentas de gênio. Fica envergonhado, sente culpa, mas na verdade não sabe o que fazer a respeito. Se essa descrição serve para você, insisto em que pode encontrar controle. Pode encontrar expressão para sua ira sem recorrer à violência. Se isso não fosse verdade — se não tivéssemos tal esperança — nossa fé não seria então de muita ajuda.

Mas Cristo oferece esperança aos que lutam contra a ira! Muita esperança! Devemos, contudo, aproveitar-nos dos recursos que ele nos oferece. Se falharmos em cumprir nossa parte, continuaremos lutando, como fez Moisés.

De modo geral a maioria de nós não pensa em Moisés como um homem dado a explosões de temperamento. Contudo, creio que o registro mostra que ele nunca conseguiu controlar completamente sua ira.

Essa observação surpreendente pode beneficiar-nos de pelo menos duas maneiras. De um lado, pode nos dar alguma esperança porque, se um homem como Moisés lutou contra a ira, não precisamos nos sentir tão inferiorizados por também termos de lutar. Mas, por outro lado, espero que ela nos leve a compreender as terríveis ramificações de um temperamento incontrolável. Moisés controlava seu temperamento periodicamente, mas quando permitia que ele se manifestasse, a explosão era praticamente certa. De fato, imagino se a raiva dele não chegava às vezes ao nível da cólera. Se não aprender mais nada nesse estudo da vida de Moisés, espero que pelo menos aprenda as tristes conseqüências do temperamento descontrolado. Espero que este episódio motive você a deixar que o Espírito de Deus obtenha pleno controle de sua vida.

Para observar os padrões de ira de Moisés durante a vida, vamos voltar brevemente à sua infância.

342 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Sendo o menino já grande, ela [isto é, a mãe de Moisés] o trouxe à filha de Faraó, da qual passou ele a ser filho. Esta lhe chamou Moisés, e disse: Porque das águas o tirei. Naqueles dias, sendo Moisés já homem, saiu a seus irmãos, e viu os seus labores penosos; e viu que certo egípcio espancava um hebreu, um do seu povo.

Êxodo 2:10-11, inserção do autor

Quando Moisés fez quarenta anos, ele viu um capataz egípcio espancando um hebreu aparentemente indefeso. O castigo era um ato injusto, ilógico, e o hebreu Moisés logo se indignou. A fúria dele ferveu como um gêiser. O versículo 12 nos diz: "Olhou de uma e de outra banda, e vendo que não havia ali ninguém, matou o egípcio, e o escondeu na areia".

Como vimos em capítulo anterior, Moisés cometeu um crime, fez uma cova rasa e jogou apressadamente areia sobre o cadáver.

O Livro de Atos prova que a ira não é simplesmente uma expressão dos ignorantes e incultos, pois ele nos lembra que "Moisés foi educado em toda a ciência dos egípcios, e era poderoso em palavras e obras" (At 7:22). Não pense por um momento que uma educação superior é tudo o que você precisa para controlar um problema de ira, pois ele é muito mais profundo. Você não pode educar sua ira para fazê-la desaparecer.

O texto continua falando de Moisés: "Quando completou quarenta anos, veio-lhe a idéia de visitar seus irmãos, os filhos de Israel. Vendo um homem tratado injustamente, tomou-lhe a defesa e vingou o oprimido, matando o egípcio" (At 7:23-24).

Você notou o motivo que levou Moisés a praticar esse ato? Ele "tomou-lhe a defesa e vingou o oprimido" com as próprias mãos, e por isso assassinou o egípcio.

Logo depois desse incidente, Moisés fugiu para o deserto. Durante os quarenta anos seguintes ele esfriou a cabeça na escola da autodescoberta. Embora tivesse aprendido ali muitas lições valiosas, mesmo assim não aprendeu como controlar seu temperamento.

UM INSTANTE DE IRA 343

IRA DESNECESSÁRIA.

Depois de voltar ao Egito para liderar o Êxodo, Moisés teve nove encontros com Faraó, antes que o décimo e final resultasse na morte do primogênito do Egito. Quando visitou Faraó entre a nona e a décima praga, ele ficou violentamente irado com o rei. Embora o Senhor tivesse dito a Moisés: "Vou endurecer o coração de Faraó", Moisés enfureceu-se com Faraó. Êxodo 11 registra que depois de suas advertências finais ao rei obstinado, Moisés "ardendo em ira, se retirou da presença de Faraó".

O sangue de Moisés chegou ao ponto de fervura. Podemos dizer que ele estava sendo "fritado". Mas nossa expressão moderna não faz justiça aos termos hebraicos subjacentes, pois são as palavras mais fortes disponíveis para exprimir o sentimento de ira. Moisés saiu daquele lugar na agonia da fúria.

Por que isso? Deus já havia dito a Moisés: "Olhe, vou endurecer o coração de Faraó. Não precisa ficar com raiva dele. Tudo o que tem de fazer é dizer-lhe: 'Homem, você está condenado. Não tem outra saída, senão deixar libertar meu povo'". Mas Moisés não conseguiu fazer isso. Não ficou satisfeito em transmitir simplesmente a mensagem, expressou-a com fúria, muito além da intenção ou desejo de Deus.

A história lamentavelmente não pára aí. Meses mais tarde, o povo de Israel saíra do Egito e chegara ao Sinai. Moisés subira a montanha para receber as tábuas da lei das mãos do Senhor. Enquanto isso, o povo que ele deixara no sopé do monte se cansou de esperar. Os israelitas começaram a ficar inquietos com sua ausência e finalmente disseram: "Vamos fazer um bezerro de ouro e adorá-lo". Na sua incredulidade, o povo começou a dançar e cometer obscenidades na frente do seu novo ídolo. No auge da baderna, Moisés voltou ao acampamento israelita:

E, voltando-se, desceu Moisés do monte com as duas tábuas do Testemunho na mão; tábuas escritas de ambas as bandas; de

344 MOISF.S: UM HOMEM DEDICADO E GENEROSO uma e de outra banda estavam escritas. As tábuas eram obra de Deus; também a escritura era a mesma escritura de Deus, esculpida nas tábuas.

Êxodo 32:15-16

Lembre-se, essas tábuas, escritas pelo Deus Todo-Poderoso, eram os documentos mais preciosos que o homem já tivera em sua posse. Pense num livro escrito em pedra pelo dedo de Deus! Imagine possuir uín documento escrito, assinado e confiado pessoalmente por Deus a você. Moisés tinha nas mãos os documentos preciosos da Torá inspirada. Quando desceu do Sinai com as tábuas, viu o povo dançando diante do bezerro de ouro. E sua velha ira inflamou-se.

"Logo que se aproximou do arraial, viu ele o bezerro e as danças; então, acendendo-se-lhe a ira..."(v. 19)

Você pergunta: "Mas ele não devia ficar zangado?" Claro que sim. É o que chamaríamos de "indignação justa". É o tipo de ira que o pai sente quando vê o filho desobedecer-lhe deliberadamente. O pai tem o direito de ficar zangado com esse ato de desobediência. Mas como a expressar? Ah, essa é a questão!

Veja o que Moisés fez. Ele pegou os preciosos documentos de Deus e, num momento de fúria, "arrojou das mãos as tábuas e quebrou-as ao pé do monte" (v. 19). Mas não parou aí. Êxodo nos conta: "e pegando no bezerro, que tinham feito, queimou-o no fogo, e o reduziu a pó que espalhou sobre a água e deu de beber aos filhos de Israel" (v. 20). Visualize isso. E difícil imaginar uma cena assim.

Voltemos, porém, às tábuas. Não é estranho que tenhamos ouvido essa história a vida inteira e nunca paramos para pensar que esse ato de Moisés era simplesmente uma atitude de temperamento fora de controle? Durante toda a nossa vida desculpamos Moisés pelo que fez; mas Deus não o desculpou. Se estudar o texto subseqüente, vai ver que Deus jamais aprovou a atitude de Moisés. De fato, quando lhe entregou novamente a Lei, Deus disse: "Lavra duas tábuas de pedra, como as primeiras; e eu escreverei nelas as mesmas palavras que estavam nas primeiras tábuas, que quebraste (Êx 34:1)".

UM INSTANTE DE IRA 345

Em outras palavras: "Dessa vez você prepara as tábuas, Moisés. Eu já as fiz antes". Em tolerância silenciosa, Deus continuou a lidar com seu filho nessa área ainda não submetida ao seu controle.

Vamos avançar agora muitos anos. O povo de Israel se encontra novamente na fronteira de Canaã. A essa altura os hebreus já tinham peregrinado durante trinta e nove anos e se queixado a cada passo do caminho, ao que parece. Quando a nação chegara perto da Terra Prometida, quase quatro décadas antes, o povo recusou-se a entrar por causa da incredulidade. Eles não acreditavam que Deus poderia dar-lhes força suficiente para vencer os inimigos e derrotar os gigantes que percorriam os campos de Canaã.

Como resultado dessa desobediência, Deus disse a eles: "Toda esta geração vai morrer; nenhum dos adultos entrará na terra, exceto Calebe e Josué. Não vou enviar nenhum de vocês da antiga geração, porque não creram no meu poder".

Lembre-se de que a nação era formada por cerca de dois milhões de pessoas. Vamos dizer que metade fosse composta por adultos que deveriam morrer durante os trinta e oito a quarenta anos seguintes. Se apenas a metade morresse nessas quatro décadas, os israelitas teriam de enterrar pessoas todos os dias. Contudo, apesar dos enterros, apesar das lápides que se estendiam pelo Deserto de Zim, o povo de Israel continuou a reclamar. Não há dúvida de que em ocasiões freqüentes Moisés encheu-se de ira, irritado com a impaciência deles.

É como a mãe que diz ao filho: "Não faça isso novamente. Não faça isso nem mais uma vez . Mas tão logo a mãe vai embora, a criança repete o ato. Ela então a castiga. Duas semanas depois, quando a mãe chega, a criança está fazendo a mesma coisa. Ela aplica novamente um castigo. Menos de uma semana se passa e tudo recomeça. Quem não ficaria irritado?

Foi assim que Moisés se sentiu com os hebreus. Quando chegamos a Números 20, cai o pingo que enche a taça. O homem está fervendo por dentro. Ele está à beira da fúria desenfreada:

346 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Chegando os filhos de Israel, toda a congregação, ao deserto de Zim, no mês primeiro, o povo ficou em Cades. Ali morreu Miriã e, ali foi sepultada. Não havia água para o povo: então se ajuntaram contra Moisés e contra Arão.

Números 20:1-2

Que cena familiar! Quando as coisas não funcionam de acordo com o plano de todos, chame o pelotão para linchar os líderes.

E o povo contendeu com Moisés, e disseram: Antes tivéssemos perecido quando expiraram nossos irmãos perante o Senhor! Por que trouxestes a congregação do Senhor a este deserto, para morrermos aqui, nós e os nossos animais? E por que nos fizestes subir do Egito, para nos trazer a este mau lugar, que não é de cereais, nem de figos, nem de vides, nem de romãs, nem de água para beber?

Números 20:3-5

É sempre o mesmo velho refrão. Continuam reclamando, se lamentando, se queixando da sorte, da negligência, da miséria, do abuso, e das injustiças que sofrem, que são dignos de pena. Moisés já ouvira tudo isso milhares de vezes. O que o povo não compreendia e que Moisés talvez também não percebesse, é que eles estavam prestes a empurrar seu líder precipício abaixo. Observe cuidadosamente o trecho seguinte, tendo em mente a luta constante de Moisés com a ira:

Então Moisés e Arão se foram de diante do povo para a porta da tenda da congregação, e se lançaram sobre seu rosto; e a glória do Senhor lhes apareceu. Disse o Senhor a Moisés: Toma a vara, ajunta o povo, tu e Arão, teu irmão, e, diante dele, falai à rocha, e dará a sua água; assim lhe tirareis água da rocha, e dareis a beber à congregação e aos seus animais, (w. 6-8)

O que poderia ser mais claro? Não havia nada ambíguo nessas instruções: "Toma a vara, vai até a rocha, fala com a rocha e deixa o resto por minha conta. A água vai correr." Lembre-se, porém, de que

UM INSTANTE DE IRA 347

Moisés está furioso. Está extremamente zangado com os queixosos e a ponto de perder o controle. De fato, está quase enlouquecido. Ele toma, pois, a vara, como ordenado pelo Senhor, vai até a rocha, como ordenado pelo Senhor, mas depois desvia para seu próprio curso irado:

Então Moisés tomou a vara de diante do Senhor, como lhe tinha ordenado. Moisés e Arão reuniram o povo diante da rocha, e lhe disseram: Ouvi, agora, rebeldes, porventura faremos sair água desta rocha para vós outros? (w. 9-10)

Espere um pouco! Será que perdemos algo? Onde Moisés obteve permissão para fazer esse discurso áspero? A verdade é que ele não a obteve. Então de onde veio? Da ira. Transbordando hostilidade e reagindo sem fé, ele toma o cajado e prega um sermão severo para o povo. Seu pavio curto o leva a tirar proveito da oportunidade de castigar aqueles rebeldes com sua verbosidade candente.

Acho que há até uma insinuação de blasfêmia aqui. "Faremos sair água desta rocha?" pergunta ele. Mas Moisés, quando você tirou água de uma rocha? Não é Deus quem dá ordens à água? Isso mesmo. Mas quando você cede à ira, praticamente perde a razão; põe de lado o bom senso e se deixa levar pelas emoções descontroladas dela. O texto afirma então: "Moisés levantou a mão, e feriu a rocha duas vezes com a sua vara" (20:11, grifo meu).

Deus lhe dissera para falar à rocha. Moisés a feriu, não uma, mas duas vezes. Duvido francamente que ele se importasse se a água iria ou não correr. Provavelmente esperava que ela não corresse. Estava tão zangado que desejava que a garganta deles ficasse seca. Queria que sufocassem e sofressem com a sede. " Vocês pensam que vamos dar-lhes água, seus insubordinados? Sonhem então!" Ele bate então na rocha — Pum! Pum! — e para sua grande surpresa a água corre. As Escrituras nos dizem que "saíram muitas águas; e bebeu a congregação e os seus animais" (v. 11). Absolutamente espantoso! Graça surpreendente!

348 MOISÉS: UM HOMEM DEDICADO E GENEROSO

É assim que a graça de Deus funciona, não é? Você já agiu com completa incredulidade, e mesmo assim Deus se adiantou e abriu a porta apesar de você? A completa humilhação acontece quando você tira férias espirituais, quando está caminhando na carne e sabe disso. Você sabia desde o começo, e sabia a profundidade e intensidade de sua atitude carnal, mas Deus bondosamente lhe dá o que é melhor, afinal de contas. É notável, não é, essa coisa chamada graça? Foi a graça que fez brotar aquela água fresca para os rebeldes israelitas, assim como para o genioso Moisés.

O FRUTO AMARGO DA IRA

Não pense nem por um momento que Deus esqueceu ou desculpou o acesso de raiva de Moisés, porque não fez isso:

Mas o Senhor disse a Moisés e a Arão: Visto que não crestes em mim, para me santificardes diante dos filhos de Israel, por isso não fareis entrar este povo na terra que lhe dei.

Números 20:12

Ao ler essas palavras somos tentados a pensar: Esse castigo não é duro demais? Um tanto severo? Tudo o que Moisés fez foi bater numa rocha. E, afinal de contas, ele foi provocado! A obstinação daquele povo era tamanha que tentaria até a paciência de Jó.

Se continuar lendo Deuteronômio, descobrirá que Moisés orou três vezes para que o juízo fosse modificado. Deus disse finalmente: "Não faça mais essa petição. Minha resposta é não". Essas palavras foram decisivas.

Veja bem, Deus tolerou a ira de Moisés, trabalhou pacientemente com ele, poliu-o, moldou-o, e, mesmo assim, Moisés deixou sua ira explodir. Ele vinha perdendo a calma desde que tinha quarenta anos. Simplesmente não aprendeu essa lição. Deus tolerou isso e suportou que Moisés continuasse com seu temperamento intempestivo, quebrando tábuas e batendo em rochas. Até que finalmente disse: "Chega Moisés. Agora basta!"

UM INSTANTE DE IRA 349

O QUE PODEMOS APRENDER

O apóstolo Tiago oferece um conselho melhor do que você receberia no divã de um psicólogo. Ele escreve: "Todo homem, pois, seja pronto para ouvir, tardio para falar, tardio para se irar. Porque a ira do homem não produz a justiça de Deus" (Tg 1:19-20).

Moisés devia saber disso em seu coração. Bem lá no fundo, ele devia ter consciência que seu temperamento raivoso não poderia servir à causa justa de um Deus santo. Todavia, com o passar dos anos, ele nunca permitiu que seu Senhor paciente aniquilasse esse monstro destrutivo em seu íntimo, que finalmente surgiu e o consumiu. Que tragédia!

O que podemos aprender com a má vontade de Moisés em domesticar sua ira? Suponho que há dezenas de pontos a ponderar, mas quero destacar três dos mais importantes que me vêm à mente.

Deus disse que Moisés o desobedeceu porque "não crestes em mim" (Nm 20:12). Moisés não dissera: "Não quero fazer as coisas a seu modo, Senhor". Não foi simples assim. Sua desobediência teve origem na sua incredulidade.

Quando você conhece a vontade de Deus e deliberadamente segue em outra direção, isso é incredulidade pura e simples. Você está dizendo ao Senhor: "Não creio que o seu plano seja o melhor". Foi por isso que Deus disse a Moisés: "Porque não crestes em mim..." Quando abandonou a presença do Senhor, com a vara na mão e a glória de Deus ainda pairando sobre ele, Moisés não tinha intenção de falar à rocha. Estava enfurecido. Não queria saber de mais nada! Planejou desobedecer. Ao sair, não deu ouvidos a Deus e disse, com efeito: "Meu plano é melhor do que o seu. Vou bater na rocha". Ao agir assim, demonstrou no que realmente acreditava — que Deus não sabia como tratar aqueles rebeldes.

F.B. Meyer, um comentarista confiável das Escrituras de uma geração anterior, escreveu com respeito a essa falta de fé: "E uma

350 MOISÉS: UM HOMEM DEDICADO E GENEROSO

questão solene para todos nós perguntar-nos se somos suficientemente exatos em nossa obediência. Um fardo repetido desses tristes capítulos de Hebreus, que contam a história das peregrinações no deserto — os capítulos tumulares do Novo Testamento —, e mostram que eles não puderam entrar por causa da incredulidade. Mas em todos os versículos as notas sugerem a leitura alternativa de 'desobediência'; eles não puderam entrar por causa da desobediência, porque, como se sabe, desobediência e incredulidade são os dois lados da mesma moeda — uma moeda cunhada pelo diabo. Os que desobedecem não crêem, e os que não crêem desobedecem".1

A Nova Versão Internacional traduz Hebreus 3:18-19 nestes termos: "E a quem jurou que nunca haveriam de entrar no seu descanso, senão àqueles que foram desobedientes? Vemos, assim, que foi por causa da incredulidade que não puderam entrar" (grifos do autor).

Não posso explicar por que isso acontece, mas, para minha vergonha, devo admitir que fiz a mesma coisa. Você não? Há ocasiões em que fico tão zangado e tão decidido a fazer minha vontade que bloqueio o plano melhor de Deus. Faço isso por pura teimosia. Cerro o queixo e os dentes. Mais tarde, porém, ao fazer um retrospecto, admito invariavelmente que o ato não me trouxe nenhuma satisfação. Com profundo remorso compreendo que meu pecado não passou de extrema incredulidade, e não simples desobediência.

Deus declarou que a incredulidade de Moisés impediu que o Senhor fosse tratado como santo aos olhos dos filhos de Israel (Nm 20:12). Em outras palavras: "Você manchou minha santidade, Moisés. Incentivou o povo a esquecer que sou um Deus santo". Essa é uma consideração especialmente importante para um servo de Deus, colocado por ele num posto de liderança. Talvez seja por isso que Tiago aconselha: "Meus irmãos, não sejam muitos de vocês mestres, pois vocês sabem que nós, os que ensinamos, seremos julgados com maior rigor" (Tg 3:1, NVT).

UM INSTANTE DE IRA 351

Todos os líderes-servos de Deus vivem num aquário dourado, por assim dizer. Estamos expostos. Se você tem um cargo em sua igreja, se é conhecido por ocupar uma posição de liderança numa instituição cristã, é então uma carta pública diante do mundo. Um ato seu de desobediência voluntária lança publicamente uma sombra sobre a glória de Deus, e ele não quer que tal coisa aconteça de modo algum.

Certo homem escreveu: "A lição clara e solene é que Deus trata com mais rigor os pecados dos líderes, especialmente quando os atos públicos deles envolvem sua glória". Há ocasiões em que esse pensamento me persegue.

3. Qualquer ato desse tipo, embora perdoado>, resulta em conseqüências penosas.

Depois que, impelido pela ira, Moisés cometeu esse pecado, o Senhor declarou: "por isso não fareis entrar este povo na terra que lhe dei" (Nm 20:12).

Deus disse claramente a seu servo: "Você não vai colocar os pés na Terra Prometida".

Espere um pouco. Deus não havia perdoado Moisés do ato pecaminoso que cometera? Sim, de fato. Mais especificamente, você talvez pergunte: "Deus não me perdoaria se eu lhe desobedecesse hoje?" Sim, perdoaria. Mas vamos supor que você cometesse esse pecado freqüentemente (como no caso de Moisés) e seu hábito contínuo trouxesse reprovação ao nome e à glória de Cristo. Ele perdoa o pecado cada vez que é confessado com sinceridade, mas as conseqüências terrenas do pecado repetido podem ser terrivelmente penosas.

Deus perdoou Davi pelo seu grave pecado contra Bate-Seba e pelo assassinato e fraude durante o ano que se seguiu ao seu adultério? Sim. Mas se você estudar a vida de Davi, notará que ela pode ser descrita como o ponto mais alto de um telhado. Na primeira parte de seu governo, Davi só subiu. O filho de Jessé jamais perdeu uma batalha, e as fronteiras de Israel aumentaram de quinze mil, quinhentos e quarenta quilômetros quadrados para cento e oitenta e

352 MOISÉS: UM HOMEM DEDICADO E GENEROSO

um mil e trezentos. Seu reinado era como um trem expresso de sucesso, avançando sem parar, até Bate-Seba.

De repente, ele começou a ser derrotado no campo de batalha. O vagão perdeu as rodas. Tudo mudou. Inquietação e desarmonia irromperam em sua casa. Suas habilidades de liderança fracassaram. Ele perdeu o apoio de seu filho e foi forçado a fugir de Absalão. Tornou-se, literalmente, um fugitivo em seu próprio reino. Conseqüências terríveis!

Deus não olha favoravelmente para as manchas que seu filho faz em sua glória. Ele pode ser paciente, mas nem sempre permanece assim. Magnânimo? Sim. Não se esqueça, no entanto, que há ocasiões em que até os pecados perdoados produzem graves conseqüências.

Você não gostaria de poder voltar no tempo e mudar algo que disse ou fez? Sei que houve momentos em minha vida — momentos terríveis em que agi no impulso da carne — que adoraria poder reviver e corrigir. Mas infelizmente isso não é possível.

Você não acha que Moisés teria dado de bom grado seu braço direito para poder reviver aquele incidente junto à rocha, naqueles dias que antecederam seu retorno ao lar? "Oh, Senhor, se eu apenas pudesse voltar e fazer tudo de novo! Teria pedido sua ajuda para controlar minha ira. Teria me preocupado mais com sua glória. Teria agido exatamente conforme suas instruções. "

Mas não era possível voltar. Num único momento de raiva (pense nisso!), ele perdeu o direito de guiar Israel e jogou fora a oportunidade de entrar na Terra Prometida. Quando reflito sobre esse mínimo espaço de tempo na vida de Moisés, minha mente passa pelas Escrituras em busca de outros momentos, como:

• O que Eva daria por outra oportunidade diante da árvore no Jardim?

UM INSTANTE DE IRA 353

• O que Jefté daria para reaver o voto impulsivo que fez a caminho da guerra com os amorreus? • O que Davi daria para reviver aquela noite no terraço, quando viu Bate-Seba pela primeira vez? • O que o rei Uzias daria para voltar àquele dia em que entrou intempestivamente no templo, empurrando os sacerdotes de Deus para oferecer um sacrifício proibido?

O triste fato, porém, é que não podemos voltar. Nenhum de nós pode. Não nos é possível desfazer os atos pecaminosos ou apagar as palavras pecaminosas que dissemos. Não podemos recuperar aqueles momentos em que fomos possuídos pela raiva, cobiça, crueldade, indiferença ou orgulho obstinado. Do mesmo modo que Moisés, podemos ser perdoados por esses erros e vê-los apagados do nosso registro pelo sangue de Cristo. Mesmo assim, temos de viver com as conseqüências de nossas palavras e atos. O que semeamos, também colheremos, dizem as Escrituras.

Este é um solene lembrete para mim de que a vida na terra não passa de uma fieira de momentos, um após outro. Não quero que o meu testemunho por Jesus Cristo seja destruído por um único momento de fraqueza da carne. Não quero que um momento de raiva, orgulho ou arrogância lance uma sombra sobre uma vida de caminhada com meu Senhor. Francamente, temo essa possibilidade. E sabe o que mais? Quero temer essa possibilidade. Quando deixo de temê-la, corro grave perigo.

Davi orou certa vez: "Também da soberba guarda o teu servo, que ela não me domine; então serei irrepreensível, e ficarei livre de grande transgressão" (SI 19:13). A Bíblia Viva traduz esse versículo: "Perdoa estes meus pecados ocultos! Não deixes que eu seja dominado pelo orgulho. Assim ficarei livre da culpa, e escaparei de cometer grandes pecados".

Que comovente oração! "Senhor, o Senhor conhece minha capacidade para jogar tudo para o alto num único ato estúpido, carnal. Não permita isso! Restrinja-me! Proteja-me de estragar tudo num horrível momento de raiva ou cobiça. Se o Senhor me guardar e

354 MOISÉS: UM HOMEM DEDICADO E GENEROSO

proteger, jamais terei de olhar para trás e arrepender-me de ter cometido tal ato".

Não, não podemos voltar. Nosso bondoso Senhor cobriu nosso passado com seu sangue, dado na cruz por nós. Davi nos lembra que: "Quanto dista o Oriente do Ocidente, assim afasta de nós as nossas transgressões" (SI 103:12).

Podemos, porém, aprender a andar mais perto dele, dia-a-dia, hora a hora, momento a momento. Podemos confiar nele e nos apoiar no Espírito Santo para guardar nosso coração e proteger-nos dos pecados destrutivos que podem aniquilar nossa vida. Ele o fará. O Senhor prometeu dar-nos um meio de fuga, a fim de podermos suportar qualquer tentação (Hb 10:13) — qualquer tentação a qualquer momento.

Se adotarmos esse estilo de vida, meu amigo, quando Deus disser para falar à rocha, iremos falar e não bater. A água que flui desses momentos de obediência irá refrescar a multidão, incluindo nós mesmos, sem nenhum resquício de remorso.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A decisão de andar de perto com Deus o torna alvo do inimigo; você está disposto a buscar intimidade com Ele mesmo sabendo que isso atrai oposição?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Moisés enfrentou reclamações justamente por liderar com piedade; como você tem reagido às críticas e ataques que surgem quando decide viver para agradar a Cristo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O Princípio do Perigo diz que quem se rende à mornidão não incomoda o inimigo; será que a ausência de batalha na sua vida revela acordos que você tem feito com o mundo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Pondo-se no Lugar de Moisés$t$, 14,
$conteudo$F/ difícil substituir um herói. Quanto maior o herói, tanto mais difícil a tarefa. Não é brincadeira se pôr na delicada posição de uma lenda.

O homem ou a mulher que segue um grande predecessor é quase sempre esquecido, embora ele ou ela possa ser muito competente. Ponha-se no lugar de Andrew Johnson, que teve de assumir a presidência depois que Lincoln foi morto por um assassino. Que tarefa! Não importa o que falasse, nem o que fizesse, sempre parecia estar abaixo do melhor. E isso que acontece quando você segue um gigante.

Você é capaz de dizer quem tomou o lugar do general Douglas MacArthur quando o presidente Truman o chamou de volta da Coréia? Por mais que tente, também não me lembro desse nome. Quem se mudou para o número 10 da Downing Street depois que Churchill deixou o cargo? Certamente não me lembro.

Como você acha que o pastor que foi chamado para substituir o grande Peter Marshall em Washington, DC, se sentiu? Você não sabe sequer quem ele era, não é? Nem eu. E o homem que substituiu Donald Barnhouse na Tenth Memorial Presbyterian Church de Filadélfia?

356 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Ou quem tomou o posto da professora bíblica Henrietta Mears? Alguém se lembra de sua substituta? E os que assumiram os deveres de Harry Ironside, ou G. Campbell Morgan, ou Charles Haddon Spurgeon, ou ocuparam a cadeira deixada pelo falecido e grande B.B. Warfield do Princeton Seminary? Papéis difíceis de preencher! Tão difíceis, de fato, que os que substituem grandes líderes são geralmente chamados de "cordeiros sacrificiais", uma vez que raramente permanecem muito tempo.

Dawson Trotman fundou os Navegadores, um ministério paraeclesiástico que se especializou no discipulado cristão. Ele era um homem de grande disciplina, incrível entusiasmo, determinação férrea e visão ampla. Foi quem primeiro organizou o ministério de acompanhamento ainda usado pela equipe das cruzadas de Billy Graham.

Bem cedo, aos cinqüenta anos, Trotman foi chamado para estar com o Senhor num acidente que resultou em seu afogamento no lago Schroon, em Nova York. Pouco antes de afogar-se, ele contou à esposa que tivera uma premonição de sua morte; eles então sentaram e mapearam juntos o futuro dos Navegadores, algo como comprar antecipadamente os pregos e a madeira para o próprio caixão.

A pessoa que Deus chamou para substituir Trotman foi Lorne Sanny, um indivíduo em tudo diferente de Trotman: na personalidade, aparência, físico, estilo e expressão. Quem pensaria que um Sanny se seguiria a um Trotman? É claro que Sanny não acreditava nisso. Ele afirmou muitas vezes que quando os líderes do ministério foram procurá-lo dizendo: "sentimos que Deus pôs você no coração deste trabalho", ele teve vontade de fugir na direção oposta. Mas que escolha notável!

Penso também em Richard Seume, que ocupou o púlpito da Emmanuel Baptist Church de Richmond, na Virgínia, por mais de doze anos. Ele era eloqüente, bonito, alto e moreno, um evangelista dedicado e um expositor cordial com uma personalidade cativante. Na maravilhosa providência de Deus, Seume foi subitamente arrancado da Virgínia e enviado da Emmanuel para a Wheaton Bible Church de Wheaton, Illinois, uma mudança que pegou quase todos nós de surpresa.

PONDO-SE NO LUGAR DE MOISÉS 3 57

O bom povo da Emmanuel esperou muito tempo pelo homem de Deus. Finalmente, Deus chamou para aquele púlpito em Richmond o dr. Stanley Touissant—um nome que duvido que muitos conhecessem na época, mas que foi útil no aprimoramento de minhas habilidades (e na de vários outros no Dallas Seminary), para lidar com o Novo Testamento Grego. Ele não é alto e moreno, nem tão bonito quanto Seume. De fato, é baixo, atarracado e manqueja (resultado de uma batalha com a poliomielite que travou na infância). Mas que homem de Deus notável! Não é um orador devocional caloroso, mas o tipo professoral clássico — mais como um expositor. Embora muito diferente do dr. Seume, Deus usou o dr. Touissaint durante vários e produtivos anos na Emmanuel. Graças ao Senhor, ele está de novo no Dallas Seminary — o lugar a que pertencei

A verdade é que os indivíduos que assumem os deveres de grandes homens e mulheres são quase sempre muito diferentes de seus predecessores; mas, ainda assim, são nomeados por Deus para fazer o trabalho que tem de ser feito. Deus se utiliza freqüentemente deles para mudar a direção de um grupo ou organização, o que nem sempre é uma tarefa fácil ou agradável, mas no entanto é necessária.

Por exemplo, você provavelmente não sabe o nome de quem substituiu Hudson Taylor na Missão para o Interior da China, mas esse novo líder remodelou toda a missão. Deus usou um sucessor na seqüência de um predecessor muito bem-sucedido para fazer uma obra completamente nova.

Não sei qual o plano de Deus para a sua vida. Nem você sabe. Mas pelo menos sabe que ele o está treinando e moldando neste exato momento para servir como pastor, ou oficial, ou membro da diretoria oü líder do corpo estudantil, a fim de ocupar a posição de alguém que fez um excelente trabalho. E claro que você é diferente dessa pessoa. Mas se Deus o está chamando para esse cargo nada invejável indicado por ele, é porque vai usá-lo de maneira notável.

Como você substitui um grande homem ou uma grande mulher? O que faz quando chega a hora de escolher um sucessor para um líder eficiente, quer a posição de liderança seja numa escola,

358 MOISÉS: UM HOMEM DEDICADO E GENEROSO

negócio, ministério, quer na política? Como você conduz uma pesquisa eficaz e toma a decisão certa, especialmente quando a posição a ser preenchida pertenceu a alguém notável?

E um fato que todos os grandes líderes precisam ser eventualmente substituídos, até mesmo homens como Lincoln, Roosevelt, MacArthur, Walvoord, Billy Graham ou Moisés.

Embora essas partidas nos peguem de surpresa, elas nunca surpreendem a Deus. Quando um homem de Deus sai de cena, nada de Deus desaparece. Ele tem sempre os seus Josués à espera.

O CANDIDATO DE DEUS

Como você deve estar lembrado, Moisés não teve permissão para entrar na Terra Prometida não só por ter cedido à ira ou por ter desobedecido a Deus, ferindo a pedra em vez de falar com ela, conforme o ordenado. Mediante esse ato de desobediência, ele havia manchado publicamente a glória que pertencia ao Senhor. Deus dissera: "Agora chega, Moisés. Você vai ser substituído. Estou chamando outra pessoa". Esse deve ter sido um momento comovente para Israel e certamente penoso para o homem que liderava a nação há tanto tempo.

Mas quem estaria qualificado? Quem poderia tomar o lugar de Moisés? Teria de ser um líder incrivelmente forte, alguém que não se intimidasse com a lembrança da grandeza de Moisés. Os problemas dos muitos desafios externos e as dificuldades com as oposições internas não deveriam assustá-lo. O substituto teria de ser um indivíduo em quem a mão de Deus pousasse. Em Números 14 lemos a respeito desse homem.

Nesse ponto da narrativa, a nação hebréia havia chegada perto de Canaã e enviara doze espiões para investigar a terra. Quando os espiões voltaram, dez deles disseram: "Esqueçam qualquer idéia de conquistar essa terra. Há gigantes nela!" Deus ficou tão aborrecido com o povo que disse a Moisés e Arão:

PONDO-SE NO LUGAR DR MOISÉS 359

Até quando sofrerei esta má congregação que murmura contra mim? Tenho ouvido as murmurações que os filhos de Israel proferem contra mim. Dize-lhes: Por minha vida, diz o Senhor, que, como falastes aos meus ouvidos, assim farei a vós outros. Neste deserto cairá o vosso cadáver, como também todos os que de vós foram contados segundo o censo, de vinte anos para cima, os que dentre vós contra mim murmurastes; não entrareis na terra, pela qual jurei que vos faria habitar nela, salvo Calebe... e Josué.

Números 14:27-30, grifos do autor

Quem era qualificado para ocupar o lugar de Moisés? Só dois homens possuíam as credenciais necessárias. Só dois líderes haviam tido anos de treinamento junto a Moisés e observado a mão de Deus na vida do povo; a saber: Calebe e Josué.

Por que Deus não nomeou Calebe como substituto de Moisés? Por que Josué? Penso que Números 11:28 revela a provável razão de sua escolha. As Escrituras chamam Josué de "servidor de Moisés, um dos seus escolhidos".

É altamente significativo que Josué tenha servido desse modo a Moisés. Não há dúvida de que Calebe era tão piedoso, corajoso e qualificado quanto Josué, mas ele não fora preparado e ensinado por Moisés. Pense como seria ter trabalhado como servo de Moisés desde os primeiros anos. Que singular privilégio! Na verdade, é assim que a maioria dos que entravam no ministério costumava ser treinada. Há cem anos ou mais, o homem que se preparava para o ministério nem sempre freqüentava um seminário. Ele simplesmente passava a viver na casa de um ministro mais velho, mais experiente, e assimila- va pela vida do homem mais idoso os princípios piedosos, as disciplinas de estudo e oração, a sabedoria para tratar com problemas complexos relacionados ao ministério, e a orientação envolvida na liderança de uma congregação. Ele aprendia o que era necessário vivendo lado a lado, durante um longo período de tempo, com um ministro experiente.

360 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Charles Spurgeon treinava habitualmente jovens aos seus pés, por assim dizer, e depois os enviava para o ministério. G. Campbell Morgan fazia o mesmo. Esse não é um plano muito mau. Os seminários estão percebendo hoje a sabedoria dessa tática. A maioria deles requer que os alunos participem de pastorais, como internos, onde obtêm experiência de primeira mão no ministério, sob a direção de pastores veteranos e equipes pastorais experientes.

Essa é a razão de Josué ter sido mais bem qualificado do que Calebe para substituir Moisés; ele fora pessoalmente treinado para a tarefa. Não creio, porém, que ele soubesse que estava sendo treinado para ocupar o lugar de Moisés. (Isso teria provavelmente assustado demais o jovem, pensar que estava em treinamento para liderar a nação rumo à Terra Prometida.) Mas foi exatamente isso que Deus planejou durante aqueles longos anos em que Josué serviu a Moisés.

Números 27 ilustra um princípio simples e básico: Quando um homem de Deus morre, nada de Deus morre. Quando um homem de Deus é mudado para outra posição, nada de Deus muda. Quando um indivíduo ocupa a mesma posição durante muitos anos, sendo usado por Deus para realizar muito em seu ministério, é fácil que ele venha (quase) a substituir Deus na mente das pessoas. No momento em que esse indivíduo é então enviado a outro ministério, ou morre, ou falha, muitos que idolatravam o líder caem pelo caminho. Deus nos ensina em Números 27 que quando ele remove um homem, como aconteceu com Moisés, e o sepulta na montanha, nada de Deus é sepultado. O Senhor continua trabalhando como sempre. Seus planos avançam, seus negócios são competentemente cuidados por outras mãos.

Quando Donald Barnhouse morreu, nada de Deus morreu na obra e no ministério da Tenth Memorial Presbyterian Church. Nada dos Navegadores morreu quando Trotman partiu deste mundo. Nada da Missão para o Interior da China chegou ao fim quando Taylor foi

PONDO-SE NO LUGAR DE MOISÉS 361

chamado para ir embora. Por que não? Porque Deus continua vivo. Um de seus servos invariavelmente pega a tocha e avança com ela. É fácil desenvolver uma visão míope, em vez de ver Deus trabalhando na vida dos indivíduos talentosos através do tempo.

Em Números 27 encontramos Moisés às vésperas da morte, contemplando a terra em que fora proibido de entrar. Que momento agridoce deve ter sido aquele!

Depois disse o Senhor a Moisés: Sobe este monte de Abarim, e vê a terra que dei aos filhos de Israel. E, tendo-a visto, serás recolhido também ao teu povo [uma forma do Antigo Testamento anunciar a sua morte], assim como o foi teu irmão Arão...

Números 27:12-13, inserções do autor

Deus disse a seu servo: "Depois de ver a Terra Prometida, você morrerá". Alguns podem ler este aviso e pensar: Quanta crueldade! Isso se compara para eles a um jovem que se apaixona por uma moça, mas ouve Deus dizer: "Olhe pela última vez para ela esta noite, porque amanhã ela vai casar-se com outro". Ou seria como dizer a um cão faminto: "Está vendo este lindo osso? Não é para você". Por que Deus faria tal coisa a Moisés?

Primeiro, Deus não é brincalhão nem cruel. Jamais encontramos Moisés imerso na autopiedade. Nunca o vemos sacudindo o dedo e dizendo a Deus: "Por que fez isso comigo?" Não, Deus não estava provocando Moisés, mas abençoando-o. Ele mostrava a Moisés que cumpre sua palavra.

Veja bem, quarenta anos antes Deus dissera a Moisés: "Vou levar esse povo à Terra Prometida". Portanto, adequadamente, na região que fazia fronteira com a terra, o Senhor mandou Moisés subir aquela cadeia de montanhas e observar Canaã. Ao fazer isso, ele veria que Deus cumpre sua promessa. Era como se Deus dissesse a seu servo: "Moisés, você perdeu o direito de entrar na terra por causa da sua desobediência e incredulidade. Usurpou a glória que me pertencia e fez isso publicamente. Não posso deixar um homem assim fazer o povo entrar na terra. Contudo, quero que veja que cumpro minha palavra".

362 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Algo aconteceu no coração de Moisés ao contemplar aquela terra. Sentimentos mais fortes que a nostalgia agitaram sua alma. Nas profundezas de seu coração de pastor, Moisés compreendeu que Israel precisava de um líder. Inimigos ferozes o aguardavam em Canaã — muros altos, carros de ferro, adversários intratáveis, tentações sutis.

Aqueles cananeus eram em regra um povo ímpio. Os documentos históricos e descobertas arqueológicas mostraram que a pornografia provavelmente teve início em Canaã, como também a perversão do sexo em grande escala. Os boatos eram tão rápidos e devastadores naqueles dias quanto hoje, e Moisés sabia que aqueles pagãos eram terrivelmente pervertidos. Sabia igualmente que, a fim de preservar o povo de Deus da derrota militar e espiritual, havia necessidade de um líder forte e inflexível.

Reconhecer, porém, é uma coisa, agir é outra. Em seus últimos momentos na terra, Moisés demonstrou novamente como podia ser grande em ambos os aspectos. Em seu último ato oficial, ele revelou outra vez a magnanimidade de seu coração. Atente às palavras de um homem suficientemente generoso para pensar no futuro:

Então disse Moisés ao Senhor: O Senhor, autor e conservador de toda vida, ponha um homem sobre esta congregação, que saia adiante deles, e que entre adiante deles, e que os faça sair, e que os faça entrar; para que a congregação do Senhor não seja como ovelhas que não têm pastor.

Números 27:15-17

Moisés fez dois pedidos ao Senhor com relação a seu substituto. Ele sabia que esse líder deveria ter duas qualidades essenciais.

Primeiro, Moisés solicitou que o seu sucessor fosse alguém escolhido por Deus. Ele disse: "Ó Senhor, ponha um homem..."

Seria fácil ignorar palavras tão simples. Mas pense no que Moisés poderia ter dito. Ele poderia muito bem ter tirado uma lista do bolso

PONDO-SE NO LUGAR DE MOISÉS 363

de trás e dito: "Se não se importa, Senhor, gostaria de entregar-lhe alguns nomes e ouvir sua opinião".

Os líderes fortes tendem a lutar com o desejo de nomear seus próprios sucessores. Já vi isso acontecer e falhar inúmeras vezes. Quando um líder forte nomeia seus sucessores, no geral indica alguém muito parecido com ele. Contudo, freqüentemente faz parte do plano de Deus escolher um tipo diferente de homem que introduza toda uma nova dimensão que, de outro modo, não seria desenvolvida.

Moisés foi sábio o bastante para notar esse perigo e disse:"Senhor, que a escolha seja sua. Basta dizer-me quem é o escolhido". Ele não entregou a Deus o nome de alguns candidatos e disse: "Escolha um cartão. Tenho quatro em mente, qualquer um que escolha está bom para mim". Em vez disso, falou: "Não tenho sugestões. Dê-nos o nome do homem e vamos indicá-lo". Moisés sabia que o líder de Israel deveria ser um homem escolhido por Deus.

Isso é especialmente importante quando você considera quem é Deus. Moisés o chama de "autor e conservador da vida". Deus não é como o homem, pois vê diretamente o espírito, enquanto nós só vemos a fina embalagem exterior. Deus nos lembra dessa verdade em 1 Samuel 16:7 em que diz: "O homem vê o exterior, porém o Senhor, o coração".

Samuel aprendeu muito bem o que isso significa séculos depois da era de Moisés, quando chegou o momento de procurar um sucessor para Saul, o primeiro rei de Israel. Saul era um homem alto, a cabeça e os ombros se sobressaíam em relação a todos os demais. Era provavelmente belo, atraente e impressionante. Teria sido um grande candidato político em nossos dias. Com seu físico avantajado e boa aparência certamente teria sido disputado para anúncios de TV e capas de revista. E bem provável que tivesse uma profunda voz de barítono que levaria muitas fãs a fazerem fila para votar a seu favor.

Por mais cativante que pudesse ter sido fisicamente, o homem era um desastre moral e espiritual. Perdeu a credibilidade por andar na carne. Deus removeu-o então do cargo e disse a Samuel: "Vá procurar o meu escolhido, Samuel. Ele está na casa de Jessé".

364 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Como profeta obediente que era, Samuel montou em seu animal e foi para a fazenda indicada, perto de Belém. Ao chegar, viu Eliabe, o primogênito da família de Jessé. Ao olhar o rapaz, pensou: "Bingo! Esse é o homem. O ungido de Deus está diante de mim". Mas o Senhor disse: "Espere aí! Não se apresse tanto". (Paráfrase de Swindoll.) E esclareceu imediatamente as coisas para Samuel: "Este não é o meu escolhido".

Você sabe o que Samuel procurava? É interessante, mas tinha em mente uma cópia de Saul. Eliabe tinha a mesma estatura e boa aparência do primeiro e fracassado rei de Israel. Deus disse, porém: "Não é ele! Espere um pouco. Já escolhi o meu homem". E quem ele escolheu? Alguém totalmente diferente de Saul — um jovem pastor, um adolescente esquecido até pelo próprio pai. Jessé não pensou em chamar Davi para apresentá-lo ao profeta junto com os outros filhos. Samuel teve de perguntar a Jessé: "Esses são todos os seus filhos?" Voltando à realidade com a pergunta, Jessé respondeu: "Oh, quase esqueci. Há mais um. Ele está fora com as ovelhas". (É isso que acontece quando você tem um curral cheio de filhos.) Como deve estar lembrado, o jovem Davi tinha as qualidades interiores necessárias ao substituto de Saul.

Deus vê o íntimo da pessoa, não só o exterior. Isso faz toda a diferença. Havia, porém, um segundo pedido na oração de Moisés.

Moisés pede um homem "que saia adiante deles, e que entre adiante deles, e que os faça sair, e que os faça entrar; para que a congregação do Senhor não seja como ovelhas que não têm pastor" (Nm 27:17).

Em outras palavras: "Senhor, precisamos de um homem que compreenda que deve ficar em contato com o povo antes de poder servilo. Precisa ser alguém que se comunique com o povo".

Moisés estava dizendo: "Esse povo não precisa de um místico. Não precisa de um homem preocupado com seu amor pela pesquisa, por mais importante que isso seja. Essas pessoas não precisam

PONDO-SE NO LUGAR DE MOISÉS Mt 5

realmente de um executivo elegante ou de um gênio organizacional supereficiente. Elas precisam de um pastor. De um homem que conheça as pessoas, que as ministre e compreenda, que saiba como as guiar".

Qualquer que seja a área em que você ministre — como professor bíblico, estudante preparando-se para o ministério, mulher de Deus numa área de acordo com o seu dom — seu ministério é constituído principalmente de pessoas e não de papéis, números, telefonemas, cartas, planejamento de programas, preparo de estratégias para a próxima década. E claro que todas essas coisas precisam ser resolvidas. Tenho de assinar e/ou escrever cerca de quarenta a cinqüenta cartas por semana e me envolver também em sessões de planejamento. Detalhes administrativos têm de ser tratados. (O menor número possível deles, é claro!) Mas como ensino freqüentemente aos alunos do Dallas Seminary: "Não se esqueçam disto: O ministério é pessoas". Aprendi essa lição mediante a experiência difícil da vida no ministério e cometendo erros ridículos por não estar sintonizado com o coração das pessoas.

Sabe qual a coisa mais comum que ouço dos indivíduos que começam a freqüentar a igreja? Querem muito conhecer alguns de nós da diretoria e dizem: "Você não me conhece, mas venho aos domingos ouvi-lo pregar". E quase se desculpam, como se afirmando: "Sinto muito ocupar seu tempo, mas só quero apertar sua mão". Eu me esforço para dizer a cada um: "Você é tão importante quanto qualquer outro da igreja. Na família de Deus não há membros insignificantes". Não digo isso para mostrar que sou um bom relações públicas nem para impressionar. Digo porque creio nisso. Independentemente de quem você é, o que quer que faça, você é especial diante do Deus que o escolheu.

Gosto do álbum gravado há muitos anos pelo Trio Bill Gaither, chamado Specially for Children. Ele contém uma canção intitulada I am a Promise. Sei que há dois volumes dele porque gastamos o volume 1 e tivemos de correr para comprar o volume 2. Meu filho Chuck, então com cinco anos, insistiu.

366 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Chuck gostava mais do que eu desses discos. Ele ouvia a mesma música todos os dias, sem parar. Era incansável. Com o tempo encontramos o remédio — fones de ouvido!

Chuck ficava sentado horas seguidas numa poltrona na sala de estar, cantando com aqueles enormes fones de ouvido grudados nas orelhas.

Dedique um momento de sua atenção e leia a letra que tanto cativou nosso filho caçula:

Sou uma promessa, sou uma possibilidade, Sou uma promessa com P maiúsculo. Posso ser qualquer coisa, qualquer coisa que Deus quer que eu seja. Você é uma promessa, uma possibilidade, Você é uma promessa com P maiúsculo. É um grande pacote de potencialidade.

{Adoro essa linha!)

E se prestar atenção, vai ouvir a voz de Deus, E se tentar, ele o ajudará a fazer a escolha certa. Você é uma promessa para ser qualquer coisa que ele quer que você seja!1

Para dizer a verdade, Chuck poderia ter tocado aquele velho disco até que as ranhuras desaparecessem e eu não me teria importado. Por quê? Porque a música tem razão. As pessoas não conhecem o próprio potencial. Isso faz parte do problema de nossa época, com toda essa confusão de identidade. Homens e mulheres, meninos e meninas não compreendem quem são aos olhos de Deus.

Aparentemente, porém, esse não era o principal problema do jovem Chuck. A professora do coral da igreja bateu em minha porta certo dia e disse: "Quero contar-lhe algo que aconteceu com seu filho mais moço. Estávamos falando sobre ir para o céu. Eu dizia às crianças como isso seria bom. Chuck ficou ali, só ouvindo. Eu dizia: 'Quando estivermos no céu seremos iguais a Jesus. Teremos um corpo completamente novo. Seremos diferentes do que somos agora.

PONDO-SE NO LUGAR DE MOISÉS 367

"Então Chuck levantou a mãozinha, pedindo para falar, e declarou: 'Não quero ir para o céu'. 'Você não quer ir para o céu?' perguntei. 'Por que não?' Ele respondeu com firmeza: 'Porque gosto do meu corpo'."

Pensei: "Você está certo, filho! Você deve gostar do seu corpo. Deus lhe deu esse corpo e, não importa quem seja,'você é um grande pacote de potencialidade!' Deus sabe exatamente o que você é e de que precisa".

Uma das coisas de que você precisa é de um pastor que acredite em você tanto quanto necessita crer em si mesmo. Foi por isso que Moisés disse: "Por favor, Senhor, não nos mande um erudito estéril! Não escolha algum executivo elegante num terno sob medida. Envie-nos um homem com o coração aberto para as pessoas. Alguém que cuide do rebanho". Esse é um equilíbrio crucial que nunca poderá ser aprendido num livro ou numa classe no seminário. Posso citar dúzias de professores, dezenas de pregadores excelentes e muitos administradores capazes. Mas não posso citar muitos pastores verdadeiros, amorosos, com coração de servo.

Moisés orou, portanto, para que Deus indicasse o homem certo e que este fosse um pastor para o rebanho de Deus. E sabe de uma coisa? Deus tinha exatamente o homem adequado em mente: "Toma a Josué..." (v. 18)

Adoro isso! Deus não roía as unhas no céu, perguntando-se quem substituiria Moisés. Ele não precisou consultar uma agência de recursos humanos, fazer uma pesquisa na Internet ou lançar uma expedição corporativa de head-hunters. Ele sabia desde o início a quem chamaria, pois já tinha o currículo de Josué no alto da pilha. Ele o estivera treinando durante anos.

As diretorias das igrejas e organizações missionárias muitas vezes ficam indecisas sobre quem poderia substituir uma "estrela" que se está aposentando. Elas acham difícil decidir quem poderia tomar as ' rédeas. Algumas vezes têm em mente alguém que julgam ser ideal para isso; mas sábios são aqueles que esperam em Deus para ter certeza. "Senhor, temos algumas idéias, mas quem o Senhor indicaria para pastorear o rebanho? Quer nos revelar isso, Senhor?"

368 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Quando você espera assim por Deus, com fé, não se surpreenda ao ver como ele aponta diretamente um nome específico. Foi isso que fez com o pedido de Moisés: "Toma Josué, filho de Num, homem em quem há o Espírito, e impõe-lhe a mão" (v. 18).

Deus não deu a Moisés múltipla escolha. Ele não opôs uma personalidade à outra, dizendo: "Escolham entre esses cinco homens; a maioria ganha". O Senhor disse: " Toma a Josué e imponha as mãos sobre ele, pois tem as qualidades necessárias. Ele tem o meu Espírito. E a minha escolha".

Por que o Senhor mandou Moisés impor as mãos sobre Josué? Nos tempos bíblicos, a imposição de mãos conferia autoridade ao recipiente. A prática era uma imagem da ordenação, se quiser, e ligava a liderança de uma geração à de outra. Foi por isso que Paulo, no Novo Testamento, disse a Timóteo: "A ninguém imponhas precipitadamente as mãos. Não te tornes cúmplice de pecados de outrem. Conserva-te a ti mesmo puro" (1 Tm 5:22).

O rito não transmite força física, mas estabelece uma conexão espiritual de transmissão de autoridade. A fim de se certificar de que todos entendessem o significado de sua ordem, o Senhor instruiu Moisés para colocar Josué diante do sacerdote e de toda a congregação num serviço público de incumbência: "Põe sobre ele da tua autoridade, para que lhe obedeça toda a congregação dos filhos de Israel" (Nm 27:20). Em outras palavras: "Moisés, torne público que você apóia este homem".

No momento em que recebeu suas ordens, Moisés obedeceu. "Fez Moisés como lhe ordenara o Senhor; porque tomou a Josué, e apresentou-o perante Eleazar, o sacerdote, e perante toda a congregação; e lhe impôs as mãos, e lhe deu as suas ordens, como o Senhor falara por intermédio de Moisés" (w. 22-23).

Moisés seguiu o plano do Senhor sem discutir. Isso me impressiona. Ele não disse: "Mas, Senhor, eu preferia Calebe". Moisés ouviu a decisão de Deus e aceitou-a. Então ele chamou o homem de Deus e o apresentou publicamente como o novo líder de Israel.

Que ombros largos! Não percebi um mínimo de autopiedade, ressentimento ou amargura nesse ponto da sua biografia. Nada de

PONDO-SE NO LUGAR DE MOISÉS 369

reclamações. Nenhum sinal de inveja ou ciúmes. Não acho que ele levou Josué para sua tenda algumas horas depois e choramingou: "Seu sortudo!" ou: "Não é justo!" Esse não é o estilo de Moisés. Ele disse (sem dúvida com um largo sorriso): "Josué, você é o homem de Deus. Orgulho-me de você". Não podia sair do caminho de Josué tão depressa.

Esse é um bom exemplo para todos nós. Se quiser viver para observar seu sucessor entrar em cena, aplauda a chegada dele ou dela e depois saia do caminho. Recue. Recuse-se a continuar procedendo do mesmo modo. Deixe que Deus ministre e trabalhe da maneira esplêndida que só ele sabe fazer. Apoie esse indivíduo de todo o coração e alma. Faça isso verbalmente, em particular e em público. Faça isso pessoalmente. Afinal de contas, ele foi indicado por Deus. E o homem ou a mulher de Deus. Você já teve seu dia, agora é a vez dele ou dela brilhar.

A MÃO FIRME DE DEUS EM NOSSAS TRANSIÇÕES

Vejo três lições essenciais nesse episódio da vida de Moisés que podem ajudar-nos em nossa caminhada de fé.

QUANDO DEUS RETIRA, ELE SUBSTITUI.

Quero repetir algo que já escrevi antes: Quando um homem de Deus morre, nada de Deus morre. Quando Deus estende a mão e colhe uma flor, ele cultiva outra. Quando ele arranca uma planta, já tem outra pronta para desabrochar. Ele nunca fica sem substitutos qualificados.

Não importa quem você é, pois tem uma parte nesse processo. Quero encorajá-lo a orar pelas igrejas que procuram pastor. Ore pelas escolas que necessitam de presidentes e/ou membros do corpo docente, pelas entidades missionárias que precisam de diretores, e pelas organizações cristãs que precisam de líderes para assumir cargos de responsabilidade pública. Ore por aqueles a quem Deus irá chamar para preencher posições singulares em seu plano do reino. Ore pelos

370 MOISÉS: UM HOMEM DEDICADO E GENEROSO

novos oficiais que vão substituir os antigos ocupantes desses postos. Ore para que o povo de Deus aceite e aprove as indicações divinas. Em termos humanos, o futuro da igreja depende de sua liderança qualificada. Ore para que tenhamos líderes escolhidos por Deus.

Se você for abordado para uma indicação de ministério em sua igreja ou fora da sua zona de conveniência, pense seriamente a respeito e ore. Não dê uma resposta precipitada. Considere isto: é bem possível que Deus faça parte do plano. Pense nele como Josué deve ter feito quando Deus disse: "Você vai ficar no lugar de Moisés". Substituir um líder religioso é uma tremenda responsabilidade. Trate-a como tal.

QUANDO DEUS INDICA, ELE APROVA.

Sempre que Deus assume o controle, ele abençoa. Ele aprova quando buscamos seu conselho para uma substituição. Quando Deus disse a Moisés: "Toma a Josué", ele não precisou acrescentar: "Vou abençoálo". Por que não? Porque Josué era a escolha de Deus. A bênção veio com a indicação.

A experiência de ser escolhido por Deus para uma posição de grande responsabilidade traz inerente a ela um sentimento de humildade. Você presta contas a ele. Não tem de bater um cartão para que homens o examinem. Seu trabalho só é conhecido por ele. Ninguém o verifica.

Vejo muitas igrejas cometendo um ou dois erros comuns quando procuram alguém para substituir um grande líder. Primeiro, querem achar alguém comparável ao anterior. Ou, segundo, entram em pânico e pegam o primeiro homem disponível que aparece. Ambas as abordagens são fatais. A melhor escolha é sempre a escolha de Deus.

A vida de Josué ilustra perfeitamente essa verdade. Deus sustentou a vida dele e o Antigo Testamento não registra um único pecado cometido por Josué. Estou certo de que Josué pecou, mas o registro deixa claro que sua vida não era caracterizada por grandes falhas. Seu sucesso foi em razão do fato de ele ser sustentado por Deus.

PONDO-SE NO LUGAR DE MOISÉS 371

A propósito, quando Deus recebe o controle de um ministério, fracasso é coisa inexistente. Esse não é um pensamento maravilhoso? "Você quer dizer que não teremos dias de vacas magras? Não encontraremos problemas e oposição?" Eu não disse isso. Disse apenas que não haverá fracassos se Deus estiver no controle de um ministério. Por que não? Porque quando ele sustenta o ministério, este é bemsucedido, assim como o ministro escolhido por ele.

O DEUS DE CADA DETALHE

Fico sempre surpreso quando me contam como o Senhor usa a sua Palavra na vida do seu povo. Não conheço suas circunstâncias. Não sei como Deus pretende usar esse episódio da vida de Moisés em sua vida.

É possível que estas palavras caiam num coração faminto. Ou talvez você tenha sido fortalecido e encorajado com o pensamento de que é muito especial para Deus, que nenhum de seus filhos é insignificante. Pode ser também que esteja envolvido na tarefa apavorante de encontrar um homem ou uma mulher para uma posição que represente uma grande responsabilidade e foi lembrado de que depende mais do que nunca de Deus para obter o seu Josué. Pode ser que esse Josué seja você e talvez tenha sido convidado a aceitar uma responsabilidade maior do que qualquer coisa que já sonhou.

Quaisquer que sejam suas circunstâncias, quero lembrá-lo de que nosso Pai celestial cuida de áreas de sua vida que poderiam parecer triviais para uma divindade distante. Ele nunca está ocupado demais para ouvir suas queixas, secar suas lágrimas, sussurrar palavras de encorajamento e pôr seu forte ombro debaixo do seu fardo.

Ao escrever estas palavras, oro para que nosso Deus soberano seja um consolo pessoal para você nesta semana. Oro especialmente por aqueles que estão lutando contra a solidão e o desânimo. Embora esteja cercado de pessoas, bem lá no fundo seu coração dói. Amigo, Deus pode satisfazer sua necessidade de maneira úni-

372 MOISÉS: UM HOMEM DEDICADO E GENEROSO

ca, como fez com o coração de Moisés poucas horas antes da morte desse grande homem.

Se você for o Josué de Deus, não precisa preocupar-se com a possibilidade de ser esquecido. Não precisa preocupar-se com a idéia de que a sombra de seu predecessor (ou sucessor) possa eclipsar você e seu ministério nos anos por vir. De fato, não precisa preocupar-se com nada. Se for o Josué de Deus, está exatamente onde deve estar. Lembre-se de que Deus é soberano. Ele tem tudo sob controle. Fará a própria vontade, no próprio tempo, para a própria glória, e isso inclui sua vida, sua posição e seu futuro. Preocupar-se com qualquer uma dessas coisas é desperdício. Ele tem todos os detalhes cobertos — todos.

Pense nisso deste modo: Não é possível que Deus seja quase soberano.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Deus muitas vezes chama sucessores muito diferentes dos grandes líderes que os antecederam; como você lida com a tentação de se comparar a quem veio antes de você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Substituir um herói é tarefa nada invejável, mas Deus capacita quem Ele chama; em que função hoje você precisa confiar que Ele o moldou de propósito, mesmo se sentindo pequeno?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Todo grande líder um dia é substituído, até mesmo Moisés; o que essa verdade ensina sobre a humildade e sobre preparar outros para continuarem a obra depois de você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Obituário de um Herói$t$, 15,
$conteudo$C ^ e r t a tarde, há muitos anos, Curt, meu filho mais velho, e eu fomos ver as lápides 110 cemitério. Eu estivera pensando no trigésimo quarto capítulo de Deuteronômio antes de pregar sobre ele, e sentia alguma dificuldade em entrar no espírito do tema.

Passei pela sala de estar lá de casa e vi meu filho deitado no chão, descansando.

"Curt", eu disse, "vou dar uma olhada nos túmulos". "Posso ir junto?"

"Claro, filho. Seria ótimo." Entramos então no carro e fomos a té um cemitério próximo, onde passeamos cerca de uma hora e meia. Você já fez isso? Pode parecer estranho, mas você aprende muito quando lê os epitáfios nos túmulos. É fascinante!

Um túmulo em Loma Vista, na Califórnia, apresenta apenas quatro palavras: "Você não pode vencer" e depois um nome. Isso nos diz algo, não diz? Em outro lemos: "Nosso querido filho, 3.5.1940 a

7.5.194o". Cheio de emoção.

Gosto de perambular pelos cemitérios quando visito cidades históricas. Pode chamar-me de excêntrico se quiser, mas visitar esses lugares se tornou um de meus passatempos favoritos. Acho intrigan- te ler o que foi gravado em granito sobre pessoas há muito desapare- cidas desta velha terra.

Um amigo que compartilha esse interesse singular, enviou-me por e-mail algumas páginas de epitáfios para a minha coleção. Não esqueça que alguém teve de aproximar-se desses túmulos e limpar a sujeira e o musgo para ler essas inscrições:

Uma viúva solitária compôs evidentemente este epitáfio n u m cemitério de Vermont:

Lavrado para lembrança de meu marido John Barnes que morreu a 3 de janeiro de 1803. Sua jovem e atraente esposa de 23 anos tem muitas qualidades de uma boa esposa e anseia por ser consolada.

N u m túmulo na Inglaterra, alguém viu gravada esta inscrição:

Sir John Strange Aqui jaz um advogado honesto, E isso é Estranho.

Eu lhe disse que estava doente!

Na sepultura de Eilen Shannon, em Girard, Pensilvânia, o epitá- fio parece um aviso ao consumidor:

Fatalmente queimada em 21 de março de 1870 pela explosão de um lampião cheio com o "Fluido Não-Explosivo de R.E. Danforth".

O que devemos então pensar da mensagem no túmulo de Ezekiel

Aikle no Cemitério de East Dalhousie, Nova Escócia?

Aqui jaz Ezequiel Aikle Com 102 anos Os Bons Morrem Cedo

OBITUÁRIO DE UM HERÓI 375

Uma coisa notei: cada sepultura representa a passagem do tempo exatamente do mesmo modo. Onde quer que vá não há diferença. O tempo que passamos nesta terra é sempre representado por um pequeno traço horizontal, e isso é tudo. A pessoa pode ter vivido até os oitenta ou noventa anos, mas a lápide encerra a vida inteira em um pequeno traço. Essa é a vida, e então ela se foi.

Suponho que comecei a pensar seriamente na morte depois do falecimento de meu pai, em meio a um culto de adoração, numa manhã de domingo, há quase vinte e cinco anos. Ele estava hospitalizado e as coisas iam de mal a pior. Primeiro teve um ataque cardíaco que resultou em vários derrames, causando paralisia e dificultando a deglutição. Mais complicações ocasionaram a contração de um vírus, e com ele uma febre. A seguir veio a pneumonia.

Numa noite fria de quarta-feira, visitei-o em seu quarto de hospital mal iluminado. Vi enfermeiras de branco se movimentando em sua rotina e olhei para o homem morrendo em seu leito de metal. No dia seguinte voltei e vi um homem sem dentes, quase inconsciente, com um olhar vazio e distante. Esse homem que um dia pegara a minha mão e a quem mais tarde segurei, toquei e abracei, estava nos deixando. Apenas um curto traço e num instante ele se foi.

Essa experiência, associada à minha ida silenciosa às lápides, de repente começou a me fazer sentir parte da cena que se desenrolou no monte Pisga, onde Moisés morreu. Ela envolve você de mansinho, mas penetra fundo. Acho errado aproximar-se de uma passagem bíblica como se fosse completar uma lição ou, como neste caso, um livro. O Livro de Deus é um livro de vida. E, com exceção da morte do seu Filho, o Autor das Escrituras não se demora muito sobre a morte. Posso contar em ambas as mãos, com sobra de alguns dedos, o número de obituários longos encontrados na Palavra de Deus. O povo de Deus simplesmente morre, e então começa uma dimensão inteiramente nova de vida.

Mas quando se estuda um homem tão importante quanto Moisés, quando o sepultamos no final do estudo e depois fazemos v<> M( )ISES: UM HOMEM DEDICADO E GENEROSO um retrospecto sobre onde estivemos, descobrimos que as coisas se resumiram a alguns fatos realmente básicos. Pode-se aprender muito na leitura de um obituário. Deus nos convida então a refletir sobre o funeral, o enterro e a lápide de Moisés para descobrir a avaliação do céu sobre este grande servo de Deus — homem dedicado e generoso.

A VISÃO DO ALTO

O capítulo 34 de Deuteronômio começa contando sobre o lugar e propósito da morte de Moisés: "Então subiu Moisés das campinas de Moabe ao monte Nebo, ao cume de Pisga..." (v. 1).

O topo do monte Pisga chega a alcançar 1371 metros de altura. Não são muitos os homens com cento e vinte anos que conseguem subir uma montanha assim alta e viver para contar a história. Contudo, Moisés fez isso. Escalou-a com o auxílio das mãos, pois não havia uma trilha com espaço suficiente para uma pessoa, e Moisés não precisava na verdade disso.

Se você está imaginando quais eram as condições dele, esse feito por si só irá dar-lhe a resposta. Quando foi a última vez em que escalou uma montanha? Provavelmente faz algum tempo. Ou, quem sabe, nunca fez isso. Só pratiquei esse esporte duas vezes e não planejo fazê-lo novamente. Em ambas as tentativas fiquei sem fôlego e bufei o tempo todo até o alto, e a montanha não tinha sequer novecentos metros de altura. Senti-me um mártir!

Contudo, lá estava Moisés, com quase um século e um quarto, subindo até o pico de um monte com 1371 metros de altura e desfrutando de um lindo cenário lá de cima. Você não vai notar nenhu- ma autopiedade em Moisés. Ele sabia que estava prestes a morrer; Deus lhe contara. O Senhor também já havia posto um homem, Josué, em seu lugar. Pela primeira vez em seus quarenta anos finais, o enorme peso de guiar a nação saiu de suas costas. Com os ombros aliviados, Moisés pôde subir a encosta a passos largos. Ele sabia muito bem que logo daria seu último suspiro.

OBITUÁRIO DE UM HERÓI 377

Moisés nos ensina que o crente não tem razão para temer ou fugir em pânico para a rua quando o assunto é morte. Todos morremos; a vida é isso. Não estamos realmente prontos para viver até que esteja- mos prontos para morrer. Quando, portanto, ficamos prontos para morrer, vamos então morrer.

Compreendo, é claro, que a idéia de morrer provoca todo tipo de emoções fortes. Tudo em nós anseia por se manter preso aos entes queridos que estão morrendo. Esse desejo de prender-se é dolorosa- mente refletido nesta poesia:

O que há de errado comigo, Senhor?

Semana após semana Pedi que a levasse. Em agonia, chorei e esperei Enquanto ela lutava com uma dor insidiosa. Observei o declínio gradual De seu corpo antes forte e belo. Vi as linhas de cansaço,

Seu desconforto constante. Ouvi seus soluços tristes Enquanto suplicava alívio. Senti a pressão dos dedos trêmulos Quando o sofrimento aumentava. Senti sua crescente fraqueza, Sua profunda depressão. Durante noites insones Ouvi sua respiração difícil Na escuridão clamei a ti— Clamei muitas vezes... Então ontem de manhã, Senhor, No primeiro alvor da madrugada, Respondeste à minha oração. Suavemente a levaste contigo — Recompensaste-a com a plenitude da glória. Obrigado, Senhor. Contudo, mesmo enquanto agradeço,

378 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Fico desejando tê-la mantido Pelo menos mais um dia. O que há de errado comigo, Senhor?1

Quando cheguei ao último versículo de Deuteronômio 34, não queria que a história de Moisés terminasse. Queria ficar com ele mais alguns capítulos; não queria que ele fizesse aquela subida final pelas encostas íngremes de Pisga.

Você já se viu numa situação em que desejava agarrar-se a um ente querido prestes a fazer essa última jornada? Claro que já. Essa é a parte da carne profundamente arraigada em nós — guardar, não dar, agarrar-se, não compartilhar. Eu queria manter Moisés por per- to e ouvir um pouco mais sua voz. Queria que ele ficasse, mas Deus disse: "Isso basta. Agora ele é meu". E assim o escolta até o pico e lhe dá aquela visão finai, que nem você nem eu podemos imaginar. Nunca veremos a Terra Prometida como Moisés a viu — aquele solo virgem que tinha ainda de se unir a Israel.

Imagine a vista que se estendia à frente dele. Moisés olhou "e o Senhor lhe mostrou toda a terra de Gileade até Dã; e todo o Naftali, e a terra de Efraim, e Manassés; e toda a terra de Judá, até ao mar ocidental; e o Neguebe, e a campina do vale de Jericó, a cidade das

Palmeiras até Zoar" (w. 1-3).

Deus deu a Moisés uma visão abrangente. Ele começa olhando o norte, depois se volta e vê o oeste, a seguir avista o sul e, finalmente, olha para o leste. Moisés é como um facho de luz n u m farol, girando em círculos. E uma cena comovente até na sua geografia. Moisés deve ter estalado a língua o tempo todo e dito a si mesmo: "Veja só isso! Lindo! Lindo! Ó, Senhor, veja que terra!"

Em última análise, a morte de um crente abre uma visão celestial panorâmica que confunde a mente. É uma dimensão completamen- te nova. Paulo nos diz: "Olho nenhum viu, ouvido nenhum ouviu, mente nenhuma concebeu o que Deus preparou para aqueles que o amam" (1 Co 2:9, NVI). Era por isso que Moisés ansiava quando desfrutou dessa última visão magnífica da Terra Prometida, um pe- daço da herança real onde nunca colocaria os pés.

OBITUÁRIO DE UM HERÓI 379

Deus disse então: "É isso mesmo, Moisés. Agora venha para casa".

Disse-lhe o Senhor: Esta é a terra que, sob juramento, prometi a Abraão, a Isaque e a Jacó, dizendo: à tua descendência a darei; eu te faço vê-la com os teus próprios olhos; porém não irás para lá. Assim morreu ali Moisés, servo do Senhor, na terra de Moabe, segundo a palavra do Senhor.

Deuteronômio 34:4-5

Moisés entregou o espírito. Heróis ou não, todos chegamos a esse momento em que deixamos o corpo para trás e passamos para outra esfera. Quando penso na morte de Moisés, uma dupla mensa- gem me vem à mente.

Não sua solidão, mas sua solitude — há uma diferença. Solidão sugere uma ânsia vazia que procura, em vão, outra pessoa. Solitude significa que ninguém vai acompanhá-lo. É o que vejo aqui. Um vôo solo.

Você nunca leva junto um companheiro quando viaja para a morte; vai sozinho. O Talmude diz: "O homem nasce com o punho fechado, mas morre com as mãos abertas". Você não leva nada consigo; tudo fica para trás. A vida de Moisés, e não os seus bens, era o seu legado. Ele morreu no alto do monte Pisga, e morreu sozinho.

Se formos sinceros, teremos de admitir que a maioria de nós quase nunca fica sozinha. Temos rádios, TV e um fax. Temos e-maií, telefone e provavelmente um celular ou pager. Temos um carro, múltiplos pontos de contato com amigos e uma porção de lugares onde nos encontrar. É um sinal que nosso tempo é gregário. Gostamos de envolvimentos. Minha amiga poetisa, Ruth Harms Calkin, oferece uma visão interessante sobre este assunto:

Tu sabes, Senhor, como eu o sirvo Com grande fervor emocional

380 MOISÉS: UM HOMEM DEDICADO E GENEROSO

À luz dos holofotes. Sabe de meu entusiasmo quando falo de ti No clube feminino. Sabe como exulto ao promover Um grupo de fraternidade. Conhece meu entusiasmo genuíno Num estudo bíblico.

Mas imagino como eu reagiria, Se mostrasses uma bacia de água E pedisse que lavasse os pés calosos Deu uma velha curva e enrugada Dia após dia, Mês após mês, Num quarto onde ninguém visse E ninguém conhecesse?2

Essa é uma história diferente, não é? Tudo é ótimo desde que não tenhamos de ficar sozinhos. O que torna a morte tão temível para alguns talvez seja exatamente isso. Ficamos poucas vezes sozinhos. Mas, no alto do monte Pisga, Moisés estava só. Josué não teve per- missão para acompanhá-lo. Arão já tinha ido. Na ausência de uma trilha, uma única figura solitária escalou com dificuldade as rochas até o cimo.

Moisés morreu "segundo a palavra do Senhor". Tudo terminou para o ancião exatamente como Deus havia providenciado.

Sinto-me absolutamente à vontade com o fato de que Deus não só conhece os nossos dias, como também o fim deles. Portanto, não fico com medo ao entrar num avião. Não tenho apreensões quando faço uma longa viagem de carro pela faixa estreita do Texas, ou vou a

Oklahoma, ou visito o Novo México. Nem sequer temo as vias ex- pressas de Los Angeles. Sei que no plano de Deus, ele arranjou a extensão da minha vida e, de fato, o exato dia de minha morte.

OBITUÁRIO DE UM HERÓI 381

É possível que você não aceite facilmente esse pensamento. Talvez a idéia seja pesada demais. Caso positivo, você provavelmente tende a temer a idéia da morte. Permita-me então lhe oferecer uma palavra de encorajamento.

Examine novamente o versículo 5, mas, dessa vez, posicionando duas frases lado a lado. Leia o seguinte de uma só vez: "Assim mor- reu ali Moisés, servo do Senhor... segundo a palavra do Senhor".

Elas se completam, e foi isso que trouxe grande segurança à mor- te dele.

A associação dos dois pensamentos de solitude e segurança pode parecer estranho para nós, especialmente quando se trata de morte. Contudo, se quisermos vencer nosso medo, eles precisam unir-se em nossa mente. Isso certamente se deu com o apóstolo Paulo, e ele pôde então escrever: "Aguardo ansiosamente e espero que em nada serei envergonhado. Pelo contrário, com toda determinação de sem- pre, também agora Cristo será engrandecido em meu corpo, quer pela vida quer pela morte; porque para mim o viver é Cristo e o morrer é lucro" (Fp 1:20-21, NVI). Muitos de nós engrandecem Cristo em sua vida, mas a história é outra quando se trata de morrer.

Não precisa ser assim.

Moisés morreu sozinho, mas com segurança. O registro de sua morte se estende pelos seis últimos versículos de Deuteronômio 34.

As Escrituras nos dá primeiro a sua idade: "Tinha Moisés a idade de cento e vinte anos..." (v. 7). Mais de um século — doze décadas. Ao morrer, tudo da educação, da fama, da fortuna, da experiência e de todas as coisas às quais ele normalmente se apegaria foram com ele. Nenhuma dessas coisas permaneceu nesta terra.

UMA PERSPECTIVA MAIS AMPLA

A morte tem um meio de pôr as coisas na perspectiva adequada, não tem? Essa é uma das coisas que me agradam no ministério — não há dois dias iguais. Eu geralmente transito em caminhos eternos: nascimento, morte, doenças graves, tragédias. Vivo na fronteira áspera da

382 MOISÉS: UM HOMEM DEDICADO E GENEROSO

vida. Lidar com os mortos é tão familiar para o homem de Deus quanto fechar uma venda para o vendedor, ou preparar uma refeição para a dona-de-casa, ou trocar as velas para o mecânico. Os pastores poderiam correr o risco de se tornarem calejados ao lidar com a morte, como se fosse um negócio, mas devo dizer que não me lembro de ter enterrado nenhum jovem de cento e vinte anos.

Deixei o hospital tarde da noite, depois do infarto de meu pai, e disse uma palavra amável à enfermeira que fora tão gentil com ele quando ficou inconsciente, nos momentos em que ele não sabia que ela estava ali.

"Sabe, ele viveu oitenta e três maravilhosos anos", eu disse a ela.

"E verdade", ela respondeu, "não há muitos que vivam quase até a idade de Moisés".

Ela não sabia que eu estava refletindo sobre esse evento enquan- to falava. Não pude deixar de pensar: "Tem razão, nunca sepultei ninguém com mais de cem anos. Não há muitos deles ainda vivos".

A maioria dos centenários que conheço não tem muita saúde. São cegos, aleijados, surdos. Não há muitos alpinistas aos noventa. E

Moisés tinha cento e vinte! Pensamos: Provavelmente ele deve ter ficado inútil. Não é isso, porém, que o registro declara. As Escrituras, dizem que: "Não se lhe escureceram os olhos, nem se lhe abateu o vigor" (Dt 34:7). Lemos na Bíblia Viva:

"Enxergava perfeitamente e era forte como um rapaz".

Minha reação? Que estilo de vida esplêndido! Cento e vinte anos e você não precisa de óculos; um século e um quinto e você não precisa de muletas. Moisés jamais se sentou numa cadeira de balan- ço, passando linimento e bebendo chás. Ele continuou em atividade, como fez Calebe, permanecendo saudável até o fim.

Sabe qual o nosso problema? Ficamos velhos antes de ser velhos.

Começamos a viver como um ancião antes de chegarmos aos seten- ta. Isso é um crime! Um sujeito ganha o título de doutor em filosofia e sente que já dobrou o Cabo da Boa Esperança, só porque trabalhou na sua tese durante alguns anos. Você se acha envolvido em um negócio que está progredindo, fazendo sua parte, e seu sexagésimo

OBITUÁRIO DE UM HERÓI 383

quinto aniversário chega. Você se pergunta: Estou ficando velho de- mais para isso? Tolice! Longfellow escreveu:

É tarde demais! Ah, para nada é tarde demais — Catão aprendeu grego aos oitenta; Sófocles escreveu seu grandioso Édipo, e Simônides ganhou o prêmio de poesia de seus pares Quando todos já tinham mais de oitenta anos. Teofrasto, aos noventa, Dera começo ao seu Caráter dos Homens. Chaucer, em Woodstock, com seus rouxinóis, Aos sessenta escreveu os Contos de Canterbury.

Goethe, em Weimar, trabalhando até o fim, Completou Fausto depois dos oitenta. E então? Devemos sentar-nos ociosos e dizer: "A noite chegou, o dia se foi"? A idade é oportunidade, nada menos Que a juventude em si, só que em outros trajes. Quando se dissipa o crepúsculo, O céu se enche de estrelas invisíveis à luz do dia.

Você é tão velho quanto deseja ser. Acho uma pena não vivermos tanto quanto Moisés. O falecido Jim Elliott disse: "Onde quer que esteja, fique por inteiro ali". Viva ao máximo cada situação que julgue ser da vontade de Deus. Se for um estudante, viva como tal!

Se seu ramo é negócios, vá fundo no ramo! Se perder o emprego, fique realmente desempregado. Se for nascer um filho, dê uma fes- ta! Se sua única filha for se casar ou iniciar um negócio, deixe que vá! Continue vivendo! "Esteja por inteiro" onde quer que se en- contre.

Pare e pense. Qual a alternativa? Entrar no armário e fechar a porta? E lamentável, mas encontro homens e mulheres todos os dias que escolheram esse caminho. Sei que fizeram isso porque, ao contrário de Moisés, os olhos deles escureceram e o vigor se abateu.

384 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Mais importante do que o aspecto físico, porém, é o espiritual. O que Deus escreveu no túmulo de Moisés sobre essa categoria da vida de seu servo? O que diz o obituário celestial? "Nunca mais se levantou em Israel profeta algum como Moisés, com quem o Senhor houvesse tratado face a face" (Dt 34:10).

Quando o sucessor de Moisés, Josué, queria obter uma direção de Deus, ele tinha de ir ao sumo sacerdote. Mas não Moisés. Surpreendentemente, ele recebia as instruções de Deus mediante contato visual direto com o Senhor vivo. Sua vida de cento e vinte anos foi uma caminhada de dedicação face a face.

Você já passou dos sessenta? Se passou, como está sendo sua caminhada com Jesus Cristo? Vocês dois ainda se falam? Você continua carregando seu Livro e dedica algum tempo a ele? "Ah, sou aposentado". Do Livro? De sua caminhada com Cristo?

O Senhor diz no Novo Testamento que as mulheres idosas devem proceder de maneira séria, a fim de instruírem as mais jovens (Tt 2:3-4). Não posso, no entanto, citar muitas mulheres jovens que tenham tido essa experiência. E muitas desejam isso desesperadamente. Sabe por que existe essa triste situação? Porque as mulheres mais velhas crêem na mentira de que já não são mais úteis ou não conseguem relacionar-se com a geração mais jovem. Isso não é verdade! A pessoa de sessenta e setenta anos pode manter-se incrivelmente útil para Cristo.

Quando iniciava meu ministério, parte dos melhores conselhos que recebi veio de homens na casa dos sessenta e setenta anos que haviam estudado tão minuciosamente o Livro de Deus que tiveram o caráter modelado por ele. Eu costumava orar com um homem que literalmente gastara a tinta da página em muitos dos Salmos, simplesmente porque se demorava muito tempo nesse livro. Quando orávamos juntos era como se estivesse ajoelhado junto a Davi.

Os que estiveram sob a tutela do falecido dr. Merrill E Unger, do Dallas Seminary, sabiam que valia a pena estar sob a proteção de suas orações. O dr. Unger costumava orar: "Senhor, muitos desses indivíduos estão desanimados hoje". E o estudante que estava atrás de mim

OBITUÁRIO DE UM HERÓI 385

dizia: "Esse sou eu, Senhor. Sou eu neste momento". O dr. Unger continuava: "E muitos deles não podem sustentar-se financeiramente". "Sou eu, Senhor, sou eu novamente". Estávamos compartilhando a vida de oração repleta de poder desse homem. Alguns talvez achassem tedioso orar em conjunto durante cinco minutos. Mas nao com Merrill Unger! Passar cinco minutos sob a oração desse homem era uma educação completa no seminário! Seguíamos professores como Unger, Hendricks e Pentecost como sombras, só para ficar perto deles.

Eu quero estar na companhia de homens que conhecem o Senhor como Moisés conhecia. Moisés o conhecia pessoalmente. Você e eu, no entanto, não temos a promessa de conhecer pessoalmente Deus deste lado do céu. Paulo escreve: "Porque agora vemos como em espelho obscuramente, então veremos face a face. Agora conheço em parte; então conhecerei como também sou conhecido" (1 Co 13:12).

O "então" do apóstolo é aquele tempo futuro em que receberemos nosso corpo glorificado e seremos como Jesus. Isso não será agora. Ao contrário de Moisés, não podemos conhecer o Senhor face a face por enquanto.

Por outro lado, o apóstolo pôde pregar que sejam "iluminados os olhos do vosso coração, para saberdes qual é a esperança do seu chamamento, qual a riqueza da glória da sua herança nos santos, e qual a suprema grandeza do seu poder para com os que cremos, segundo a eficácia da força do seu poder" (Ef 1:18-19). Ele pôde pedir ao Senhor: "...que transbordeis de pleno conhecimento da sua vontade, em toda a sabedoria e entendimento espiritual, a fim de viverdes de modo digno do Senhor, para o seu inteiro agrado, frutificando em toda boa obra, e crescendo no pleno conhecimen- to de Deus" (Cl 1:9-10). Pôde dizer em nível pessoal: "Sim, deveras considero tudo como perda, por causa da sublimidade do conhecimento de Cristo Jesus, meu Senhor... para o conhecer e o poder da sua ressurreição e a comunhão dos seus sofrimentos, conformando-me com ele na sua morte" (Fp 3:8,10). E pôde escrever sobre Moisés:

386 MOISÉS: UM HOMEM DEDICADO E GENEROSO

E, se o ministério da morte, gravado com letras em pedras, se revestiu de glória, a ponto de os filhos de Israel não poderem fitar a face de Moisés, por causa da glória do seu rosto, ainda que desvanecente, como não será de maior glória o ministério do Espírito?... Porque, se o que se desvanecia teve sua glória, muito mais glória tem o que é permanente. Tendo, pois, tal esperança, servimo-nos de muita ousadia no falar. E não somos como Moisés que punha véu sobre a face, para que os filhos de Israel não atentassem na terminação do que se desvanecia... E todos nós, com o rosto desvendado, contemplando, como por espelho, a glória do Senhor, somos transformados de glória em glória, na sua própria imagem, como pelo Senhor, o Espírito.

2 Coríntios 3:7,8,11,12,13,18

Temos possibilidade de conhecer profundamente o Senhor, de um modo que o próprio Moisés não podia. As Escrituras, no entan- to, dizem que Moisés falou ao Senhor face a face. Esse é o legado que esse grande homem de Deus deixou, um legado e uma belíssima lembrança que seu povo nunca esqueceu. Você fica pensando: Será que aqueles hebreus queixosos realmente o amaram, ou ele foi apenas um alvo conveniente — uma vara-relâmpagopara o descontentamento deles? Eles o viam como um homem de Deus distante eprofundo?

A resposta está no versículo 8. Quando ele morreu, "os filhos de

Israel prantearam Moisés por trinta dias nas campinas de Moabe".

Pense nisso! Por que, quando muitos morrem hoje em dia, os herdeiros dividem a herança em trinta dias? Eles não faziam isso nos dias de Moisés, estavam ocupados chorando. O h , como os israelitas amavam seu líder morto! O ministério dele inflamara de tal modo o coração das pessoas que foi necessário um mês inteiro para prantear sua memória. Mas, finalmente, esse luto terminou.

Isso devia aplicar-se também à nossa vida. Quando perder um ente querido, não se acanhe em chorar por ele. Chore à vontade. Não chore como os que não têm esperança, mas chore pela sua perda.

Lamente a partida terrena dele. Extravase isso e depois pare.

OBITUÁRIO DE UM HERÓI 387

No dia em que visitei o cemitério com Curt, vi duas pessoas em dois lugares diferentes falando para as sepulturas. Eu tinha uma boa amiga que, quando o marido morreu, ficou tão triste que passava boa parte do tempo no túmulo dele. Quando minha mãe conversou com ela sobre sua fé em Jesus Cristo, ela respondeu maravilhosamente às reivindicações de Jesus e alguns dias depois da morte do marido se tornou uma filha de Deus. Deus Jevou-a então a um ministério aos enlutados. Até praticamente o dia de sua morte, minha amiga passava o fim de semana no cemitério, testemunhando às pes- soas que conversavam com os túmulos.

Depois da morte vem o sepultamento, e isso ocorreu com Moisés. O versículo 6, porém, contém uma das declarações mais notáveis sobre toda a incrível carreira dele: "Este [Deus!] o sepultou num vale, na terra de Moabe, defronte de Bete-Peor; e ninguém sabe, até hoje, o lugar da sua sepultura" (Dt 34:6, inserções do autor).

Moisés é a única pessoa na Bíblia que Deus sepultou pessoalmente. Você sabia disso? A seguir, o Senhor ocultou a sepultura. Por que fez isso? Porque esse túmulo teria se tornado uma segunda Meca. Eles estariam ainda arrumando a estrada para Nebo até hoje, construindo santuários, vendendo pipoca e amendoim, oferecendo toda sorte de passeios, talvez construindo uma linha de trem até lá, com grandes faixas anunciando: "Sepultura de Moisés!"

"Nada disso", disse o Senhor. "Coloquem-no na sepultura, fechem-na e escondam-na, de modo que nunca venham a saber onde ela se encontra". Isso era tão importante para o Senhor que chegou até a provocar um confronto angélico. Judas 9 contém um dos relatos mais estranhos da Bíblia sobre esse evento. Judas escreve: "Contudo, o arcanjo Miguel, quando contendia com o diabo, e disputava a respeito do corpo de Moisés, não se atreveu a proferir juízo infamatório contra ele; pelo contrário, disse: O Senhor te repreenda". O diabo tinha aparentemente seus próprios planos para o corpo de Moisés, mas Deus disse: "Não. O corpo dele é meu, da mesma forma que a alma, e vou enterrar o cadáver onde ninguém o achará. Fim da história".

388 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Todas as coisas têm seu final apropriado, como a história de

Moisés:

Nunca mais se levantou em Israel profeta algum como Moisés, com quem o Senhor houvesse tratado face a face, no tocante a todos os sinais e maravilhas, que, por mando do Senhor, fez na terra do Egito, a Faraó, a todos os seus oficiais e a toda a sua terra; e no tocante a todas as obras de sua poderosa mão, e aos grandes e terríveis feitos que operou Moisés à vista de todo o Israel.

Deuteronômio 34:10-12

"Todos... todos... todas." A palavra está incluída nessa passagem inteira. Ernest Renan, o famoso filólogo e historiador francês, disse a respeito de Moisés: "Ele é um colosso entre figuras humanas".

Quando lemos essa parte do epitáfio e pensamos em todo o imenso poder e todos os milagres operados por Moisés, muitos de nós tendem a pensar: Moisés está em outro setor. Não posso tocá-lo. Essa vida que examinei não passa de apenas outro estudo teórico. Ela quase escarnece de mim, porque não sou como Moisés.

Que tremendo erro cometemos se chegarmos a'tão deturpada dedução. Moisés era, naturalmente, único, mas não passava de um homem a serviço de Deus. Podemos tirar muito proveito pessoal de sua vida e morte.

Vamos finalizar nosso estudo de Moisés com três observações úteis.

O segredo da realização na vida é o envolvimento.

Não deixe de ouvir essa primeira observação, mesmo se sua audição já não for mais a mesma. Uma das piores pragas de um país é a da atitude da aposentadoria. Não se trata da aposentadoria em si, mas da atitude que diz: "Não perturbe. Ganhei meu descanso"; ou: "Estou no fim da vida; não me amole".

Algumas vezes isso se manifesta no pensamento: "Eu realmente não tenho muito mais a contribuir". Não é de admirar que o índice

OBITUÁRIO DE UM HERÓI 389

de suicídios de pessoas com mais de sessenta anos seja tão alto, e isso inclui alguns que têm muito dinheiro. O segredo da realização é o envolvimento — colaborando, ocupando-se na tarefa multifacetada de Deus.

Como já descobrimos nesse estudo, só duas coisas na terra são eternas: as pessoas e a Bíblia. Quando você planejar se aposentar, não pense em se manter longe das pessoas ou da Palavra de Deus. Se fizer isso, estará se distanciando daquilo que é eterno, e essa é a direção errada, meu amigo. Mantenha-se em contato. Dê até que não tenha mais nada a dar, e então busque suprimento no reservatório de Deus e dê um pouco mais. E isso que aumenta o significado e propósito e, algumas vezes, os anos de vida.

O segredo da realidade na vida é a humildade.

Se o envolvimento dá extensão à vida, a humildade lhe dá então amplitude. Moisés nos apresenta um quadro belíssimo da verdadeira humanidade combinada com profunda humildade e genuína piedade.

Moisés jamais acreditou em seus próprios relatórios de marketing. Ele nunca se impressionou com sua folha de serviço. Nunca se levantou de manhã para ver o que as manchetes tinham a dizer sobre sua atuação na véspera. É verdade que ele estabeleceu recordes incríveis que não foram e nunca serão alcançados, mas nunca se perdeu em seu orgulho. Permaneceu real, confiável e humilde.

A humildade dá amplitude à vida. Portanto, permaneça acessível. Permaneça disponível. Permaneça confiável. Salomão escreveu: "Seja outro o que te louve, e não a tua boca, o estrangeiro, e não os teus lábios" (Pv 27:2).

O louvor pode vir, mas não permita que venha de sua própria boca.

O segredo da felicidade na vida é a perspectiva.

Acho que este é o melhor dos três. Se o envolvimento aumenta a vida e a humildade a amplia, então a perspetiva dá profundidade à vida.

390 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Quero ser franco com você. Sei que alguns que estão lendo este livro agora se encontram numa situação difícil. Não têm certeza do futuro. É possível que estejam num dilema sobre sua carreira, ou que tenham algum problema de saúde os perturbando. Você talvez tenha terminado recentemente um romance que parecia ir bem, ou tenha chegado a um impasse em seu casamento e não vê solução para ele. Sente-se como se estivesse preso e não consegue sair da situação.

Se é assim que se sente, então preste especial atenção à história seguinte. Considere o que este conhecido escritor diz sobre a perspectiva, porque acredito que grande parte da depressão que o indivíduo sente é provocada por uma perspectiva incorreta:

Quando comecei a ir ao meu consultório no hospital, em 1966, notei um senhor simpático que invariavelmente ficava na janela de um velho prédio de apartamentos, localizado do outro lado da rua do estacionamento dos médicos. Manhãs seguidas esse mesmo homem, que julguei estar por volta dos quarenta e cinco anos, aparecia na mesma janela aberta quando eu passava. Quando eu voltava para casa, no fim do dia, ele também estava sempre a li. Comecei a acenar ou a sorrir para o homem na janela, e ele retribuía minha saudação com um gesto similar. Embora pareça improvável, começamos uma amizade, mesmo sem haver qualquer conhecimento pessoal entre nós, sem que tivéssemos conversado uma única vez.

Minha curiosidade finalmente me obrigou a conhecer melhor o homem que estava por trás do sorriso. Certo dia, na hora do almoço, andei do consultório até o prédio onde meu simpático amigo morava e subi uma escada escura até o segundo andar. Bati na porta e ela foi aberta pelo "homem da janela". Ele se apresentou como Tommy e me convidou para entrar em seu apartamento de dois cômodos. Durante a meia hora seguinte, Tommy contou sua história. Ele fora um executivo bem-sucedido até que sofreu uma trombose coronária há cerca de seis anos. Seu problema cardíaco foi agravado por um enfisema e outros distúrbios físicos que o impediram de exercer qualquer tipo de trabalho. Notei também que seu braço direito era deformado, muito mais curto

OBITUÁRIO DE UM HERÓI

que o esquerdo. Soube que Tommy quase nunca saía do pequeno apartamento. Não era casado e parecia não ter parentes ou amigos íntimos. Estava então praticamente confinado a viver numa ceia solitária de dois comôdos.

A parte positiva da história de Tommy é como ele decidiu enfrentar sua tragédia pessoal. Aquele homem tinha toda a razão do mundo para ficar deprimido e desanimado, mas transpirava confiança e otimismo. Decidira fazer o maior número de amigos possível entre os que passavam de carro na ida e na volta do trabalho, e essa era toda a sua vida social.

Eu disse: "Tommy, o que posso fazer por você? Precisa de alguma coisa? Posso ajudá-lo de algum modo?"

Ele respondeu: "Obrigado, senhor, aprecio sua oferta, mas estou indo bem. Não preciso realmente de nada".

Não notei o mínimo de autopiedade em ponto algum de nossa conversa, e ele se recusou firmemente a permitir que o tratasse como inválido. Seu único reconhecimento de que a vida era difícil veio em resposta à minha pergunta: "Você nunca desanima com a sua situação aqui?"

Tommy respondeu: "De manhã, quando todos estão indo para o trabalho, gosto de cumprimentar as pessoas no começo de um novo dia. Mas quando estão voltando para casa à noite e me despeço, algumas vezes me sinto triste".

Essa foi a única declaração negativa que ouvi dele. Tommy havia evidentemente decidido aceitar a vida como ela era.

Por mais de quinze anos, Tommy ficou firme em sua vigília sobre o ruído e o trânsito da rua e permanecemos bons amigos. Parei o carro debaixo de sua janela no dia três de janeiro deste ano para cumprimentá-lo, depois de ter feito uma rápida viagem de férias no Natal. Sem pensar, perguntei: "Você teve um bom feriado?"

Tommy respondeu: "Foi ótimo".

Soube mais tarde que passara toda a semana de Natal na solidão daquele quarto, observando os compradores apressados e os motoristas que passavam pela rua lá embaixo.

392 MOISÉS: UM HOMEM DEDICADO E GENEROSO

Algumas semanas depois, Tommy não apareceu na janela como lhe era habitual. No dia seguinte estava também ausente, e as cortinas, fechadas. Soube pelo funcionário do estacionamento que Tommy tivera um colapso e morrera no fim de semana anterior. Meu amigo se fora. Já tinha sido enterrado, embora eu duvide que alguém tenha assistido ao seu funeral. Agora, quando passo pelo prédio de apartamentos todas as manhãs, posso ouvir Tommy repetindo suas últimas palavras para mim: "Foi ótimo".

Meu intuito, ao escrever-lhe sobre Tommy, é ilustrar o fato de que a depressão é geralmente um problema de perspectiva.3

Meu amigo de longa data, o dr. James Dobson, escreveu essas palavras há alguns anos e venho pensando nessa história desde então.

Você pode ter tido uma vida dura, mas provavelmente não tão dura quanto a de Tommy, porque está sentado aí lendo este livro. De algum modo você é capaz, seja com alguém ou sozinho, de adquirir este exemplar, abrir suas páginas, acender a luz e ler ou ouvir as palavras contidas nele. Você talvez enfrente um amanhã difícil, e se não tomar cuidado, pode sucumbir à autopiedade. Tudo depende da sua perspectiva.

Veja, a felicidade na vida cristã depende em grande parte de como a concebemos. Aos olhos de Tommy, a vida era ótima. E para você? Se morrer antes de mim, e eu visitar o lugar onde tiver sido enterrado para descansar, o que estará escrito em sua lápide? A perspectiva fez parte integrante da vida de Moisés, e é por isso que seu epitáfio nos dá tanta esperança.

U M ALVO VALIOSO

A morte chega para todos nós. A não ser que o Senhor venha nas nuvens para nos buscar primeiro, esse dia de despedida vai chegar... talvez cedo, talvez tarde. Não temos controle sobre isso, mas temos controle sobre a maneira como vivemos até o momento em que dei- xarmos este mundo.

OBITUÁRIO DE UM HERÓI 393

Quando nos entregamos à autopiedade, devemos lembrar-nos de Tommy e dos milhares de outros Tommys deste planeta que vivem todos os dias com esperança. Temos um Deus pelo qual vale a pena viver e certamente morrer. Além disso, está na hora de ajustar nossa perspectiva quando começamos a viver como se isso não fosse verdade.

Moisés nos ensina que, quer vivamos quer morramos, Deus permanece digno de nosso louvor. Nosso alvo então, como foi o de Moisés, deve ser honrá-lo, quer pela vida quer pela morte.

Nossa lápide então vai responsabilizar-se por si própria.

Q , « grande viagem fizemos juntos! Nosso companheiro durante essa jornada foi esse venerável líder do Êxodo — Moisés. Quando começamos, mal conhecíamos o homem. Agora que completamos a jornada, ele pode parecer um novo amigo. Talvez até íntimo. Espero que sim.

A viagem foi nostálgica para mim. Permitiu-me entrar deliberadamente no mundo dele. Detive-me no caminho para refletir sobre momentos penosos. Entrei em cenas diferentes, demorei-me naquelas ocasiões em que nosso amigo passou por dificuldades, senti o aguilhão do desapontamento quando seu coração foi afligido, e sorri com ele quando desfrutou do surpreendente poder de Deus. Penso que quase pude sentir a névoa quando guiou aqueles espantados hebreus através do mar Vermelho até a terra seca.

A jornada foi também difícil — mais difícil do que de costume. Enquanto estava envolvido neste projeto, enquanto escrevia sobre as pragas do Egito, recebi logo de manha um telefonema do Dallas Seminary. Um cano de água na rua adjacente à escola se partira durante a noite. Depois que a prefeitura o consertou, entretanto, um aumento súbito da pressão fez a válvula do banheiro no segundo andar de um de nossos prédios mais velhos explodir, e a água começou a correr pelo corredor.

412 MOISÉS: UM HOMEM DEDICADO E GENEROSO

O fluxo de água só foi notado depois de muitas horas. Durante esse período, ela correu para o primeiro andar, onde milhares dos meus livros estavam guardados, e depois desceu para o porão, onde havia estantes que continham centenas dos meus volumes de pesquisa. Uma vez descoberto e notificado o problema, rever a cena me fez lembrar das monções no sudeste da Ásia que eu suportara há muitos anos, onde a umidade e a água encharcam tudo.

Não vou ocupar o tempo e o espaço para descrever todas as peripécias da limpeza ou quantas dessas preciosas obras foram destruídas (com a graça de Deus, a maioria pôde ser restaurada), mas o trabalho neste livro continuou, sem ser prejudicado. Parecia vontade do Senhor que eu experimentasse minhas próprias pragas durante esses meses ao lado de Moisés e do povo hebreu. Portanto, de certo modo, sinto uma especial afinidade com eles nas circunstâncias que tiveram de suportar.

Enquanto seguíamos para o término de sua vida, detendo-nos finalmente nas encostas de Pisga varridas pelo vento, senti como se tivesse perdido um companheiro íntimo de viagem. Meu coração bateu mais depressa ao testemunhar o sepultamento secreto, ler seu epitáfio e rever sua notável peregrinação aos cento e vinte anos. Dizer adeus a Moisés foi uma experiência comovente da qual não me esquecerei por muito tempo, algo semelhante àquele dia sombrio em que me despedi de meu pai e o levamos para seu descanso. Temos muito a aprender com o silêncio de um túmulo.

As palavras de Clarence Macartney falam eloqüentemente desses momentos: "Não tenho temor algum de um cemitério", escreveu ele. "Algumas vezes é melhor estar lá e ter comunhão com os mortos sepultados do que andar pelas ruas das nossas cidades e encontrar-se com os mortos não-sepultados; isto é, aqueles cuja fé, esperança, amor e pureza morreram há muito, deixando apenas o animai vivo.

No cemitério, a Bíblia da vida está aberta e vozes calmas lêem para nós suas grandes lições e nos dizem para aplicar nosso coração na sabedoria. Podemos às vezes aprender mais com o silêncio dos mortos do que com os pronunciamentos dos vivos."

CONCLUSÃO 413

Ele prossegue: "Quer seja um pequeno pátio de igreja, onde os mortos descansam sob os olmos antigos junto aos muros santos; os espaços escuros em alguma venerável catedral, onde eles dormem sob sarcófagos entalhados e mármores marcados com letras; algum campo de batalha no deserto onde a nação reuniu os corpos dos soldados que deixaram ali sua plena medida de devoção; uma colina rural onde o vento sopra livremente, quer um lugar tranqüilo à margem de um rio que corre silencioso e rápido como a vida do homem — onde quer que seja, o lugar de repouso dos mortos tem sempre algo valioso a dizer para os vivos".

Do silêncio do túmulo de Moisés aprendemos lições dignas de nota. O grande líder com coração de servo morreu realmente, mas as coisas que nos ensinou jamais perderão o significado. Sua vida permanece para sempre como um dos blocos sólidos de granito cujos entalhes profundos e permanentes nenhuma tempestade pode apagar ou desastre terreno remover. Em tempos como os nossos, precisamos de tais pontos de referência.

Agradeço por você ter viajado comigo. Se fez a viagem através de cada uma das minhas outras obras biográficas, pode então marcar esta como sua quarta jornada pela série Heróis da Fé. Pela graça de Deus e mediante sua capacitação, haverá outras. Por agora, no entanto, que esta possa lançar sementes e crescer em você. Que a história deste homem, Moisés, um Homem Dedicado e Generoso, o inspire a fazer o que ele fez tão bem: suportar, "como quem vê aquele que é invisível".$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Se toda uma vida cabe num pequeno traço entre duas datas na lápide, o que você deseja que esse traço represente diante de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Moisés foi lembrado pelo céu como um servo dedicado e generoso; que avaliação Deus faria hoje da maneira como você tem vivido e servido?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Para o povo de Deus, a morte é apenas a entrada numa nova dimensão de vida; como essa esperança transforma o modo como você encara o tempo que ainda tem nesta terra?$p$, 'reflexao', null);
  end if;

end $migration$;
