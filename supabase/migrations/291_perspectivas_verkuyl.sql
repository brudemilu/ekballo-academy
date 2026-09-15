-- 291_perspectivas_verkuyl_licao1.sql
-- Verkuyl cap. 8, "A base bíblica do mandato missionário mundial" — a leitura
-- que faltava na Lição 1. O guia da lição a chama no fim, depois do Stott
-- cap. 1, e é essa a posição que ela ocupa (ordem 8).
--
-- PROCEDÊNCIA: PDF ESCANEADO, sem camada de texto — transcrição de OCR, como
-- os guias das Lições 4 a 12. As demais leituras do acervo vieram de camada de
-- texto e têm prova por contagem de caracteres; esta não.
--
-- Paridade do caderno seguida como nos guias; largura do corte escolhida por
-- página. Saiu o cabeçalho corrido, que o OCR devolvia mal lido em quase toda
-- página.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then raise exception 'curso perspectivas não existe'; end if;

  -- abre espaço na 8: tudo de 8 pra cima desce uma posição
  update aulas set ordem = ordem + 1
   where curso_id = v_curso and ordem >= 8 and titulo not like '%Verkuyl%';

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.titulo like '%Verkuyl%') then
    update aulas set ordem = 8, titulo = $t$Lição 1 · Leitura — Verkuyl, cap. 8: A base bíblica do mandato missionário mundial$t$, conteudo = $conteudo$A base bíblica do mandato missionário mundial

JOHANNES VERKUYL foi professor chefe do Departamento de Missiologia e Evangelismo da Free University of Amsterdam. Em 1940, foi enviado como missionário para a Indonésia e passou três anos num campo de concentração japonês. É autor de mais de 250 livros e artigos, Extraído de Contemporary Missiology An Introduction [Missialogia contemporânea: uma introdução] (Grand Rapids: Ferdmans, 1978) Usada com permissão,

Johannes Verkuvyl

O significado do Antigo Testamento

O século XX e também o século XXI tém produzido um fluxo con- tínuo de literatura que considera o Antigo Testamento uma base indispensável e insubstituível para a tarefa missionária da Igreja entre as nações e povos deste mundo. Na qualidade de pessoas habituada a consultar tal literatura, desejo examinar quatro temas do Antigo Testamento que constituem a base da chamada neotes- tamentária à Igreja para se envolver na obra missionária mundial: o tema universal, o tema do resgate e da salvação, o tema missio- nário e o tema do antagonismo.

O tema universal

O Deus que no Antigo Testamento se identifica como o Deus de Abraão, de Isaque e de Jacó e que revela a Moisés seu nome pessoal, Yahweh, é o Deus de tado o mundo. À experiência que alguns poucos patriarcas — e mais tarde a nação de Israel ape- nas — tiveram com esse Deus amplia-se para incluir o horizonte de todo o mundo. Citaremos apenas umas poucas passagens do Antigo Testamento para aclarar esse tema,

A tábua das nações em Gênesis 10

Génesis 10, com sua passagem que relaciona a tábua das nações, é importante para a compreensão do tema universal do Antigo Testamento. Gerhard von Rad descreve essa tábua como a con- clusão da história da criação. Todas as nações têm sua origem na mão criadora de Deus e estão sob seu vigilante olhar de paciência e julgamento. Às nações não são meras peças decorativas dispostas ao acaso no cenário do drama real entre Deus e a humanidade. As nações, isto é, a raça humana como um todo, são parte do próprio drama, À obra e a atividade de Deus apontam para a humanidade como um todo,

Essa é uma das verdades fundamentais de Gênesis |—11, que constitui o registro do início da História. Também é encontrada no tocante relato do fim da História, o livro do Apocalipse. O próprio Deus, que se revelou a Israel e habitou entre nós em Jesus Cristo, identifica-se como o Alfa eo Ômega, o Princípio en Fim. Ele não apresentará seu trabalho aa Pai até que roda “língua, povo

É Mação”, uma “grande multidão que ninguém poa enumerar tenha se reunida ao redor de seu trono (Ap 5.910, 7,9-17), Deus se dirige diretamente às atividades cansativas e penosas dos seves humanos na Histária a fim de alcan- var seus olyetivos entre as nações,

A eleição divina de Israel como parte de seu objetivo para com as nações

Depois que a Biblia encerra o relato do julga- mento de Deus sobre as nações, descrito de modo tão ilustrativo no episódio da torre de Babel, em Génesis, segue-se o registro do cha- mado de Abraão, quando Deus lhe ordena que deixe Ur dos caldeus. À primeira vista parece que o “Deus de toda a terra” limitou seus in- teresses à história particular de uma só família e uma única tribo, Na verdade, nada estaria mais longe da verdade que essa ideia, Nas pa- lavras de Groot, “Israel é à primeira palavra dita por Deus na proclamação da salvação, não o Amém”, Durante algum tempo, Israel, o “povo de Abraão”, encontra-se separado das demais nações (Bx 19.355; Dt 7.148s), mas isso acontece apenas para que por meto de Israel Deus possa preparar o caminho para alcançar seus objetivos universais, Ao escolher Israel, um segmento de toda a humanidade, Deus nunca tirou os olhos das outras nações. Israel era uma minoria cha- mada para servir a maioria.

A eleição divina de Abraão e Israel diz res- peito ao mundo inteiro, Seu relacionamento com Israel é intenso justamente por sua insis- tência em reivindicar o mundo inteiro para si. Para falar a este mundo na plenitude dos tem- pos precisava de um povo, Um sem-número de estudos recentes enfatiza exatamente esse ponto. Deus escolheu Israel como preparação para o total desvendamento de seus objetivos universais.

Sempre que Israel se esquecia de que Deus o havia escolhido para que falasse às nações e passava a ignorá-las, numa atitude de orgulho egoísta, profetas como Amós, Jeremias e Isa- tas atacavam de forma veemente a pretensão etnocêntrica dos israelitas, acusando-os de

A base bíblica do mandato missionácio mund, subverter as verdadeiras intenções de Deu, (v. esp. Am 7,9,10),

A irrupção do tema universal no exílio

As experiências de Israel durante os séculos Vi e Via.€, despertaram-no para as intenções uni. versais de Deus. Em meio à experiência catas- trófica de ser aniquilado pelos babilônios e ser levado cativo para o exílio, os profetas passaram a perceber como a carreira de Israel estava tão intimamente ligada à história das nações, Da punição sofrida por Israel, surgiu a firme espe- rança de um novo pacto, um novo êxodo, um novo Filho de Davi. Jeremias, Ezequiel e Isaias: todos esses profetas viram o horizonte que se ampliava e deram testemunho de que agora to- das as nações eram alvo das promessas de Deus, A visão apocalíptica de Daniel prediz a vinda do Filho do Homem, cujo Reino dará fim aos reinos selvagens deste mundo e cujo domínio abrangerá todos os povos (Dn 7).

O tema do resgate e da salvação

Yahweh, o Redentor de Israel

O tema soteriológico da Bíblia, isto é, da obra divina de resgatar e salvar Israel e as demais nações, está intimamente ligado ao tema do universalismo. Yahweh, o Deus de toda a terra, demonstrou seu amor e manteve a palavra dada a Israel, libertando-o das cadeias da escravidão com seu braço forte e estendido (v. Dt 9.26; 13.5; 15.15; 24.18). Esse fato constituía a base do credo de Israel e era crucial à compreen- são do primeiro mandamento. Só esse Deus — que salva e liberta — é Deus. “Não terás outros deuses diante de mim” (Ex 20). Esse credo transformou Israel de mera nação entre muitas em comunidade escolhida, a qual deve sua existência ao ato divino de libertação e re- tribui a Deus com louvor, por meio de salmos e orações de gratidão.

Yahweh, o Redentor das nações

Os profetas de Israel cada vez mais se cons- cientizavam de que não seria apenas Israel O beneficiário dos atos divinos de redenção. Deus tohannes Verkuyl forçaria o restabelecimento de seu senhorio so- bre as nações do mundo inteiro.

Em seus estudos, Sundkder e Blauw desta- cam que os profetas desenvolvem essa ideia de forma centripeta, isto é, depois de seu resgate as outras nações rumam para Sião, o monte do Senhor. Os profetas apresentam o quadro em que pessoas de outras nações afluem para Jeru- salém, onde o Deus de Israel aparecerá como o Deus de todos os povos (v. Is 2,1-4; 25.6-9; 60; Mg 4.1-4; Jr 3.17; Ze 8.20s5).

Vários salmos também celebram esse tema. O salmo 87 proclama Jerusalém a cidade ecu- mênica, que um dia terá como cidadãos também os habitantes de várias nações, mesmo daquelas que em alguma época se opuseram mais inten- samente ao Deus de Israel. Eles se unirão para celebrar a comunhão que Deus restaurou com os povos,

O método divino de conceder libertação

A Bíblia revela os meios que Deus usa para trazer libertação a Israel e às nações. Nenhuma passagem do Antigo Testamento se aprofunda tanto nesse assunto quanto os chamados “cânti- cos do Servo”, de Isaías 40-55, Os cânticos do Servo fazem referência inconfundível à difusão da salvação por todo o mundo. O Servo levará à libertação até os confins da terra (Is 49.6) e não cessará sua obra até que a justiça prevaleça no mundo inteiro, As regiões costeiras estão aguardando sua instrução (Is 42.4).

O quarto cântico do Servo, no capítulo 53, desvenda um segredo: o modo em que o Servo do Senhor se desincumbirá de sua mis- são. Esse texto comovente mostra o Servo na condição de vítima da mais selvagem crueldade humana. Toda espécie de maus-tratos que a mente humana possa conceber serão infligi- dos a ele. Entretanto, nessa ocasião o Servo também atuará como um substituto, tornan- do-se alvo do juízo divino, do qual não apenas Israel era merecedor, mas todos os povos € na- ções. Como substituto de Israel e das nações, o Servo deve trilhar o caminho do sofrimento a fim de trazer-lhes liberdade. Além do mais, o texto apresenta às nações como dádivas de Yahweh ao Servo, como recompensa pela sua obediência voluntária de sofrer a morte. Ele conquistou o direito de trazer salvação e cura a todos os povos.

De passagem devemos observar que Paulo, o apóstolo aos gentios pagãos, baseia sua chamada da parte de Deus para participar da missão mun- dial nesses mesmos cânticos do Servo extraídos do Antigo Testamento (v. At 13.47).

O tema missionário

Relacionado aos outros dois temas do Anti- go Testamento já mencionados, encontramos O tema missionário. Os profetas nunca se can- sam de lembrar Israel de que sua eleição não é um privilégio que possa guardar apenas para si, À eleição é um chamado ao serviço. Implica o dever de testemunhar entre as nações. Israel deve ser para as demais nações um sinal de que Yahweh é tanto o Criador quanto o Libertador. Um dos cânticos do Servo (Is 49.6) refere-se à ordem dada a Israel de se tornar uma luz para as nações.

Quase todo autor que tenta explicar o chama- do de Israel chega ao conceito da presença. Esco- lhido por Deus para se tornar receptor especial da misericórdia e da justiça divinas, Israel tem agora o dever de viver como povo de Deus no meio das outras nações a fim de lhes mostrar a graça, a misericórdia, a justiça e o poder li- bertador de Deus. Vez após outra, os profetas registraram seu profundo desapontamento com a constante sabotagem que Israel praticava con- tra o chamado divino. Por mais que estivessem irados contra a desobediência de Israel, os pro- fetas continuavam a lembrá-lo do real objetivo da ordem de estar presente entre os povos como nação distinta e como sacerdócio real.

Vale a pena observar que, desde a Segunda Guerra Mundial, inúmeros missiólogos vêm insistindo que a presença cristã é um dos prin- cipais métodos de participar da obra missionária hoje, Por diversas razões e de várias maneiras, afirmam que a forma de testemunho mais ade- quada é simplesmente ser um tipo de pessoa em particular enquanto vive entre outras pes- soas. Não é hora de desenvolver essa ideia, mas apenas de destacar que o conceito de que estar presente é testemunhar tem profundas raízes no Antigo Testamento. Os profetas proclama- vam que o simples fato de viver de acordo com a ordem divina de servir, tornaria Israel um sinal e uma ponte para as outras nações.

Não creio, todavia, que seja correto enten- der o tema missionário apenas com base no conceito de presença. Simplesmente não com- preendo por que tantos autores decididamen- te declaram que o Antigo Testamento não faz em absoluto qualquer referência a um mandato missionário.

Em seu livro Mission in the Nexo Testament [Missão no Novo Testamento), Hahn afirma, por exemplo, que o Antigo Testamento apre- senta um “caráter totalmente passivo”, Em mi- nha opinião, isso é exagero. O livro de Bachli, Israel and die Volker [Israel e as nações) está mais próximo da verdade ao observar que o relato do êxodo e a tradição deuteronômica fazem distin- ção entre am (“povo”) e gahat (“a comunidade religiosa”) e expressamente mencionam que já no deserto muitos indivíduos, embora não fos- sem membros do am desde o início, se uniram à gabat. Da mesma forma, os povos pagãos que acompanharam Israel e habitaram como estran- geiros entre o povo de Deus também partici- param da adoração de Israel. Eles ouviram o testemunho dos atos poderosos de Deus e se uniram a Israel em cânticos de louvor.

Temos, então, um significativo número de pessoas que deixaram suas origens pagãs e, por palavras e obras, foram ganhas para confiar no Deus vivo, o qual lhes havia demonstrado mi- sericórdia, e também para o servir. As histórias de Melquisedeque, Rute, Jó, o povo de Nínive descrito no livro de Jonas e de muitos outros no Antigo Testamento são, por assim dizer, como janelas através das quais podemos avis- tar a grande multidão fora da nação de Israel e ouvir a suave música, que já se fazia ouvir, de uma chamada missionária para alcançar todos os povos.

À base bíblica do mandato missionário mmunas,,

A literatura saprencial do Antigo Testarmes. to é semelhante tanto na forma quanto no cor. teúdo às culturas egípcia e grega. Sem dúvida essa hteratura proporcionou a Israel um meio d. comunicar suas crenças às outras nações.

Além do mais, não existe nenhuma outr, explicação para o poderoso impacto misssori. não do judaísmo durante a Diáspora, a não se; a afirmação de que aqueles judeus dispersos ha. viam, desde 0 princípio, ouvido e compreendid,, sua chamada para testemunhar de forma direr, e também por meio de sua presença.

O tema do antagonismo

À lista de temas missionários do Antigo Testa- mento ainda está incompleta. Intricadamente ligado a cada um dos temas mencionados rias seções anteriores, está o tema do antagonism, isto é, a poderosa contenda de Yahweh contra os poderes e forças que se opõem à sua autori- dade libertadora e plena de graça.

Todo o Antigo Testamento (e também o Novo Testamento) está repleto de descrições de como Yahweh-Adonai, o Deus da aliança com Israel, combate aquelas forças que ten- tam se opor aos seus planos para a criação e subvertê-los. Luta contra aqueles deuses falsos que os seres humanos confeccionaram usando o mundo criado como modelo, idolatraram e usaram para seus propósitos. Considere, por exemplo, os baalins e Astarote, cujos adorado- res consideravam divinos a natureza, a tribo, o governo e a nação. Deus opõe-se à magia e à astrologia, as quais, de acordo com Deutero- nômio, alteram a linha limítrofe entre Deus e sua criação. Ele batalha contra toda forma de injustiça social e despe cada disfarce sob o qual a injustiça procura se esconder (v. Amós é Jeremias, por exemplo).

Todo o Antigo Testamento está tomado de um desejo febril de derrotar esses pode- res contrários. Há magníficas visões do Rei- no vindouro, no qual cada relacionamento será adequadamente restabelecido e quando toda 3 criação (humanos, animais, plantas e as demais criaturas) se enquadrará de maneira perfeita nos tohannes Verkuyl ie pemend tomai cm arrimo cm a mm ar a propósitos de Deus (v, Is 2 e 65; Mg 4).O An- tigo Testamento anscia pela manifestação de- fimitiva desse Reino e afirma categoricamente a promessa de que no fim Yahweh será de fato vencedor. Esse é também um tema bastante significativo para a participação missionária. É impossível participar da missão, a menos que se combatam todas as formas de oposição aos propósitos de Deus, onde quer que se encon- trem — nas igrejas, no mundo das nações ou na própria vida.

O Antigo Testamento liga intimamente o tema do antagonismo às questões doxológicas. A glória de Yahweh- Adonai será manifesta en- tre todos os povos. Cada ser humano, então, virá a conhecê-lo como ele realmente é; “Deus clemente, e misericordioso, e tardio em irar-se, e grande em benignidade, e que [se arrepende] do mal” (Jn 4.1,2).

O livro de Jonas O livro de Jonas é fundamental para se enten- der a base bíblica da missão porque trata do mandato de Deus ao seu povo com relação aos povos gentílicos e, dessa forma, serve como pas- so preparatório para o mandato missionário do Novo Testamento. Jonas também é importante para dar uma ideia da profunda resistência que esse mandato encontra no próprio servo que Yahweh escolheu para realizar essa tarefa de alcance mundial,

Hoje muito se fala e se escreve a respei- to de orientar o povo para a missão, Jonas é uma lição de treinamento para quem pretende ser missionário. O livro revela a necessidade de uma conversão radical das tendências natu- rais e da reestruturação completa da vida pes- soal, de modo que o cristão se torne útil para a missão,

Contexto do livro

O título do livro é o nome pessoal de um pro- feta sem disposição, Jonas, e retoma o assunto da época do rei Jeroboão II (787-746 a.C.), quando viveu um profeta chamado Jonas ben Amitai, É óbvio, todavia, que esse midrash foi

escrito por razões outras e não para detalhar os acontecimentos da vida do profeta. O autor usa esse nome pessoal para apresentar aos seus leitores um missionário que não apreciava os gentios e que, à semelhança dos fariseus de épo- cas posteriores, não podia tolerar um Deus que demonstrasse misericórdia para com os gen- tios. Nas palavras do autor holandês Miskotte, “o escritor deseja apresentar uma personagem que seja exatamente o oposto de um apóstolo”, O autor de Jonas adverte seus leitores contra aquela atitude intolerante e pergunta se dese- jam ser transformados em servos que atuam de modo a cumprir as ordens de Deus.

O escritor de Jonas entende que Israel ficou tão preocupado consigo mesmo que se esque- ceu do mundo das nações. Israel, o receptáculo de toda a revelação de Deus, recusava-se a dar um passo em território estrangeiro e proclamar aos outros povos a mensagem divina de juízo e libertação. Entretanto, a mensagem do livro também é destinada à congregação do Novo Testamento, a qual tenta de diversas maneiras escapar ao mandamento de apresentar a men- sagem de Deus ao mundo.

Os hábeis esforços de fuga de Jonas repre- sentam a Igreja preguiçosa e infiel, que não dá atenção ao mandamento de seu Senhor. Deus tem de lutar contra o etnocentrismo bitolado de Israel, que restringe sua atividade às fronteiras da nação, e contra a recusa eclesiocêntrica da Igreja em sair pelo mundo a proclamar a men- sagem de Deus e realizar sua obra. O escritor está decidido a convencer seus leitores de que o alcance da atividade libertadora de Deus é gran- de o bastante para atingir tanto Israel quanto os gentios.

É um milagre que Jonas, com sua dura advertência contra o etnocentrismo, tenha conseguido entrar para o cânon das Escrituras. Sem rodeios, ele mostra a tentativa humana de sabotar os planos divinos para o mundo de modo que seus leitores (Israel, a Igreja do Novo Testamento e nós) possam ouvir o que o Espírito Santo está tentando lhes dizer por meio desse pequeno livro.

Resumo das oito cenas do livro

À primeira cena se inicia com Jonas recebendo a ordem de ir a Nínive. Enquanto o Antigo Testamento geralmente conclama as outras na- ções a virem a Sião, o monte de Deus, Jonas, à semelhança dos discípulos do Novo Testamen- to (v. Mt 28.18-20), recebe a ordem de ir. Na tradução da Septuaginta, o livro de Jonas usa a palavra porettomai em 1.2,3 e de novo em 3.2,3, a mesma usada por Jesus na Grande Comissão, registrada em Mateus 28. Para onde Jonas deve- rá ir? Dentre todos os lugares, justamente para Nínive — o centro do totalitarismo, da brutali- dade e das atitudes belicosas. Nínive, conhecida pela perseguição vergonhosa, tortura selvagem e orgulho imperialista com que tratava os que se opunham à sua política. Deus quer que servo advirta Nínive acerca de um juízo iminente e que a conclame ao arrependimento. Deus quer salvar Nínive!

No entanto, Jonas recusa-se a obedecer. É verdade que ele se prepara para viajar, mas ape- nas para fugir da face de Deus, que é Senhor sobre todos.

Na segunda cena, Deus reage à fuga de Jonas enviando uma fortíssima tempestade (1.4-16). O vento obedece às ordens de Yahweh, mas o desobediente Jonas dorme no porão do navio, esquecido do fato de que é o alvo da tempestade. Às vezes, a Igreja também dorme enquanto a tempestade do juízo de Deus atinge o mundo, imaginando que o vento lá fora não lhe diz res- peito. Enquanto a tripulação tenta, sem êxito, descobrir a causa da tempestade, Jonas confessa que adora e teme ao Deus que fez o mar e a terra seca, ao único Deus que está acima de todas as nações. Ele confessa que esse Deus tem uma acusação contra ele e que a única maneira de acalmar as ondas é lançá-lo ao mar. Nessa cena, a tripulação representa os gentios, um povo a quem Jonas não dá a menor importância, mas que, ainda assim, está interessado em poupar a vida do profeta. Depois de Jonas lhes dar a ordem pela segunda vez, eles o lançam ao mar, e a tempestade cessa, Quase sem conseguir crer no que estão vendo, os marinheiros se derra-

mam em louvor ao Deus de Jonas. À obediê; cia deles ultrapassa à do sabotador Jonas. Est: mais acessíveis a Deus que o próprio profeta

À terceira cena (1.17) mostra um grande pe xe que, sob as ordens de Yahweh, abre a bo: para engolir Jonas e vomitá-lo na praia, no di vido tempo. Jonas simplesmente não consegi evadir-se ao mandato missionário de Deus. ( Deus que levantou os ventos terríveis € cor duziu os marinheiros na realização do propx sito missionário agora dirige um peixe com parte de seu plano para salvar Nínive. Yahwe continua sua obra de reformar e preparar sc missionário para que este seja um instrument adequado aos planos divinos.

Na quarta cena (2.1-10), Jonas implora Deus que o tire do ventre do peixe. Ele, que ni tivera o mínimo de misericórdia para com « gentios e se recusara a admitir que as promess: de Deus também diziam respeito a eles, ago: suplica pela misericórdia divina e, citando fras de vários salmos, almeja as promessas cobrad: pelos adoradores no templo de Deus. Yahwe responde. Fala ao enorme animal, e Jonas v: parar numa praia, são e salvo. Pelo próprio res gate Jonas se tornou, sem qualquer intençã: uma testemunha da misericórdia salvadora d Deus. Embora coberto de algas, ainda assim er um testemunho de que Deus não tem prazs na morte de pecadores e sabotadores, mas s regozija com a conversão deles.

Na quinta cena (3.1-4), Deus repete a order dada ao homem cuja vida é um testemunh vivo do que confessara no ventre do peixe: “A Senhor pertence a salvação”. A Septuagint emprega a palavra kerygma em 3.1ss. Essa pa lavra sozinha resume a missão de Jonas: ele dev proclamar que Nínive, por mais ímpia que sej: ainda é objeto da preocupação de Deus e, menos que se arrependa, será destruída. Su mensagem tem de ser uma tanto de ameaç quanto de promessa, tanto de juízo quanto d boas novas.

Na sexta cena (3.5-10), Nínive atende a apelo de Jonas para se arrepender. O rei tiran e orgulhoso desce do trono, troca o manto re:

tobannes Verkuyl por pó e cinza e ordena a todos os cidadãos e amumais que sigam seu exemplo, O que Israel sempre se recusara a fazer os pagãos gentios fecram! O cruel rei de Nínive é um antitipo dos reis desobedientes de Judá,

O povo une-se ao rei no ato de arrepen- demento. Cessa a obra demoníaca, e os meca- mismos aterrorizantes e coercivos da injustiça politica são reprimidos. Em profunda penitén- cia, abandonam os ídolos para servir ao Deus que é Senhor de cada nação e de toda a criação. Tudo isso é possível porque Yahweh é Deus. O mundo pagão é um campo missionário poten- cialmente produtivo por uma única razão; só o Senhor é Deus.

Às cortinas se fecham nessa cena com estas palavras surpreendentes: “Viu Deus o que fi- zeram, como se converteram do seu mau ca- minho; e Deus se arrependeu do mal que tinha dito lhes faria e não o fez", Yahweh é fiel às suas promessas, Ainda hoje sua vontade para com Moscou, Pequim, Londres e Amsterdã não é menos “graciosa e cheia de misericórdia” do que foi para com Nínive. Tomando emprestada a frase de Lutero, o qual muito apreciava pregar sobre o livro de Jonas, a mão esquerda da ira de Deus foi substituída pela mão direita da bênção e da liberdade.

À sétima cena (4.1-4) relembra o fato de que o maior obstáculo a ser transposto no cum- primento do mandato missionário não foram os marinheiros, nem o peixe, nem o rei e os cidadãos de Nínive, mas o próprio Jonas — a Igreja recaleitrante e de visão estreita. O capí- tulo 4 fala de Jonas, o qual, havia algum tempo, deixara a cidade para procurar abrigo a leste de suas fronteiras. O período de 40 dias para arrependimento já passou, mas como Deus mu- dou de ideia a respeito de destrui-la, a cidade continua a ser alimentada pela graça e pela mi- sericórdia de Yahweh, Jonas está furioso pelo fato de Deus haver estendido sua misericórdia para além dos limites de Israel, alcançando os gentios. Ele queria que Deus se enquadrasse em seu conceito pessoal de Deus: um deus da natureza frio, duro e cruel, com uma atitude inflexível contra os pagãos. Ve não suporta a ideia da participação dos gentios na história da salvação,

Esse é o pes ado de Jonas, “pe ado de um missionário cujo coração não está na missão, Ele, que uma vez implorara a Deus misericórdia ao ver-se abandonado no ventre do peixe, agora está irado porque Deus demonstrou misericór- dia para com as nações, Ele dá vazão à sua fúria na forma de oração, que se encontra em 42 ed o texto-chave do livro; “Ah! Senhor! Não foi isso o que eu disse, estando ainda na minha terra? Por isso, me adiantei, fugindo para 'Társis, pois sabia que és Deus clemente, e misericordioso, é tardio em irar-se, e grande em benignidade, e que te arrependes do mal”, Parte dessa oração tem sua origem numa antiga liturgia de Israel, que cada israelita conhecia de cor e poderia até repetir durante o culto no templo ou na sinago- ga mesmo que estivesse cochilando (v. ix 34.6; S1 86,15; 103.8; 145.8; Ne 9.17). Jonas, porém, não consegue imaginar que essa liturgia seja ver- dadeira não apenas para Jerusalém, onde estava localizado o templo de Deus, mas também para outros lugares — Nínive, São Paulo, Nairóbi, Nova York e Paris.

Por que Jonas está tão irado? Pela única razão de Deus tratar pessoas que estão fora do círculo de sua aliança da mesma maneira em que trata os de dentro. Na verdade, a ira de Jonas o está afastando da aliança, pois ele obstinada- mente se recusa a reconhecer o propósito do pacto, que é levar a salvação aos pagãos. Não aprendeu ainda que Israel não pode ter a pre- sunção de desfrutar favores especiais de Deus. Tanto Israel quanto os gentios vivem pela graça que o Criador concede a todas as suas criatu- ras. Assim, Deus se aproxima de seu profeta não mais como participante da aliança, mas na qualidade de Criador, e pergunta à sua criatura: “É razoável essa tua ira?”

Na oitava e última cena (4.5-11) pode-se notar que Deus ainda se esforça em ensinar as lições ao seu missionário cabeça-dura, Ele não entendeu as lições da tempestade, dos ma- rinheiros, do peixe e da conversão de Nínive

À essa altura, Deus tenta mais uma vez en- sinar seu aluno-missionário, usando a planta como lição objetiva. O próprio Deus, que dirige todo o curso da História, que governa o vento e as ondas do mar e que levou os milhões de ninivitas ao arrependimento, agora pergunta com ternura:

É razoável essa tua ira por causa da planta? Ele respondeu: É razoável a minha ira até à morte. Tomou o Senhor: Tens compaixão da planta que te não custou trabalho, a qual não fizeste crescer, que numa noite nasceu e numa noite pereceu; e não hei de eu ter com- paixão da grande cidade de Nínive, em que há mais de cento e vinte mil pessoas, que não sabem discernir entre a mão direita e a mão esquerda, e também muitos animais?

Deus poupa e resgata. O Deus de Jerusalém também é o Deus de Nínive. Ao contrário de Jonas, Ele não tem qualquer “complexo de gen- tios” e, embora nunca nos constranja, pede-nos que ponhamos nosso coração e nossa alma no trabalho da missão. Deus ainda tem interesse em transformar os Jonas obstinados, indigna- dos, deprimidos e profundamente irritáveis em arautos das boas novas que libertam.

O livro termina com uma pergunta implí- cita, que jamais foi respondida: Deus alcançou seu objetivo com Nínive, mas o que dizer de Jonas? Ninguém sabe. A pergunta acerca de Israel e da igreja e de sua obediência ainda está em aberto.

É o tipo de pergunta que cada geração de cristãos tem de responder por si mesma, Jacques Ellul encerra o livro que escreveu sobre O assunto com as seguintes palavras;

O livro de Jonas não tem conclusão alguma, e a pergunta última do livro não tem respos- ta, exceto por parte daquele que percebe a grandeza da misericórdia de Deus e que, de modo factual, e não apenas mítico, trabalha pela salvação do mundo.!

A igreja do Novo Testamento deve ded car cuidadosa atenção à mensagem do livro d Jonas. Jesus Cristo é aquele que “é maior d que Jonas” (Mt 12.39-41; Le 11.29-32). Su morte na cruz, com aquele horrível grito de té sido abandonado por Deus, e sua ressurreição com a jubilosa exclamação de vitória, são sina de Jonas para nós, apontando para o profund significado da vida de Cristo e confirmando qu Deus amou o mundo “de tal maneira”.

Se alguém recebe uma transfusão vital d sangue daquele que é maior que Jonas e assir mesmo se recusa a espalhar as boas novas, ele est na verdade, sabotando os objetivos do própri Deus. Jonas é o pai de todos os cristãos que de sejam os benefícios e as bênçãos da eleição, m: se recusam a aceitar sua responsabilidade.

Thomas Carlisle termina seu poema “TN Jonas” com os seguintes versos:

E Jonas se aproximou em silêncio de seu banco ensombreado e esperou de Deus passar a ter seu jeito de pensar.

E Deus ainda espera dos incontáveis Jonas em suas casas confortáveis passarem a ter seu jeito de amar.

O período interbíblico

Uma pesquisa acerca do período da Diáspo: judaica revelou evidências de um esforço judai. de fazer prosélitos, o que, de sua parte, marc definitiva e caracteristicamente o trabalho mi sionário posterior realizado por gentios be como por judeus cristãos. A Septuaginta (trad ção grega do Antigo Testamento) espalhou- por todo o mundo civilizado e era explica:

* The Judgment of Jonah (Grand Rapids: Eerdmans, 1971), p. 103,

Johannes Verkuyl nas sinagogas. O impacto missionário do ju- daísmo da época da Diáspora foi bem maior do que muitos pensam. Mais que isso, 0 ju- daísmo influenciou o cristianismo primitivo, pois os cristãos judeus mantinham íntimo re- lacionamento com as comunidades ligadas às sinagogas. À sinagoga desempenhou um papel essencial, pois atraía não apenas os prosélitos (gentios que adotaram o conjunto de crenças e práticas judaicas, até mesmo a circuncisão), mas também um grupo classificado como “os que temem a Deus” (gentios que aceitavam a maior parte da ética e parte da prática religiosa do judaísmo, mas rejeitavam a circuncisão).

Todavia, apesar dos pontos em comum, a mensagem judaica era totalmente diferente do evangelho do Novo Testamento, o qual pregava o Reino de Deus e a crença cristã de que Jesus era o Messias. O judaísmo da Palestina exigia que os pagãos fossem assimilados à comunhão judaica e empreendiam todos os esforços para alcançar essa mudança. Já as comunidades ju- daicas fora da Palestina enfatizavam o mono- teísmo, crença que o mundo pagão, cansado de adorar tantos deuses, achava bem atraente. Eles espiritualizavam a prática religiosa e cen- suravam o estilo de vida decadente do mundo gentílico. Sua mensagem era em grande parte autossotérica, isto é, a pessoa podia salvar a si mesma. Tanto os oráculos sibilinos quanto o li- vro de José e Asenate garantem que a pessoa que cumprir de maneira correta as exigências éticas e rituais poderá reconciliar-se com Deus.

Jesus por certo dirigia as incisivas palavras de Mateus 23.15 contra esses elementos espe- cíficos da mensagem judaica quando lamentou: “Ai de vós, escribas e fariseus, hipócritas, porque rodeais o mar e a terra para fazer um prosélito; e, uma vez feito, o tornais filho do inferno duas vezes mais do que vós!”. Paulo acompanha Jesus ao reprovar, em Romanos 2,17-24, o legalismo Judaico e os esforços de autojustificação.

Jesus e Paulo não eram contrários às missões judaicas aos gentios em si. Na verdade, Paulo entende seu trabalho entre os gentios como a continuação do que os judeus da Diáspora ha-

viam começado a fazer. Contudo, ele e Jesus faziam objeções à pregação dos judeus, de modo que quando Jesus começou a proclamar sua mensagem ele não recorreu às tradições judai- cas recentes em busca de apoio, mas ao próprio Antigo Testamento.

O Novo Testamento, livro mundial de missões

Do início ao fim, o Novo Testamento é um li- vro de missões. Deve sua existência ao trabalho missionário das igrejas cristãs primitivas judai- cas e gregas. Os evangelhos são, por assim dizer, “gravações ao vivo” da pregação missionária, e as epístolas não são tanto apologética missionária quanto são instrumentos autênticos e reais do trabalho missionário. Não temos condições de analisar cada detalhe que salienta a importância do Novo Testamento para a fundamentação e a prática missionária, entretanto, podemos exa- minar alguns deles.

Jesus, o Salvador do mundo

Os inúmeros temas do Antigo Testamento con- vergem para a pessoa e a obra de Jesus de Nazaré. Os cidadãos samaritanos — meio judeus e meio gentios — da cidade de Sicar foram os primei- ros a mencionar essa verdade ao afirmar, em João 4.42: “Sabemos que este é verdadeiramente o Salvador do mundo”.

A chegada do Reino abrangente de Deus No início de seu ministério, Jesus dirigiu-se à sua cidade, Nazaré, e foi à sinagoga para adorar, no sábado. Os líderes então concederam-lhe a honra de ler as Escrituras. Ao concluir a leitu- ra da mensagem do profeta Isaías, capítulo 61, depois de devolver o rolo do profeta, acrescen- tou um comentário que traz uma esperança de valor incalculável para muitas pessoas, mas que também ofende profundamente os que o rejei- tam. Ele disse: “Hoje, se cumpriu a Escritura que acabais de ouvir” (Lc 4.21).

A salvação, que estava por vir e da qual os profetas deram testemunho, revela-se verda- deira na pessoa da Jesus Cristo, A salvação já e — ne er ro chegouçe, portanto, as boas novas anunciadas por Jesus descrevem um Reino que ao mesmo tempo jd chegou e ainda está vindo. Aplican- do as palavras de Isaías 61 a si mesmo, Jesus acrescenta que o Espírito do Senhor está sobre ele. Jesus marca o início do Reino de Deus e amuncia o “ano aceitável do Senhor” com toda a sua rica diversidade, À primeira manifestação do Reino foi provisória e ainda aguarda a con- sumação, mas quando Jesus fez a surpreendente afirmativa “O Espírito do Senhor [...] me ungiu para evangelizar os pobres, enviou-me para pro- clamar libertação aos cativos € restauração da vista aos cegos, para pôr em liberdade os opri- midos, e apregoar o ano aceitável do Senhor” — q Reino de fato chegou, e também a hora da decisão. Por intermédio de Jesus Cristo, Deus demonstrou aos homens sua obra graciosa e salvífica como nunca antes, de maneira direta e urgente. O contorno das coisas vindouras, isto é, o Reino, tornou-se excepcionalmente nítido na pessoa, nas palavras e na obra do Messias. Com poder, ele subjugou aquelas for- ças sinistras que destrufam a alma e o corpo dos homens e renovou os que eram vítimas € escravos de tais forças. Ele chamou o povo ao arrependimento.

Todo o Novo Testamento usa a linguagem da consumação. À obra graciosa e salvadora de Deus Já se tornou visível a todo o mundo (v. Tt 2.11; Ef1.10;G] 4.4,5; Hb 1.1-4). Contudo, também afirma que a manifestação final desse Reino ainda está por vir. Existe ainda uma atmosfera de expectativa no Novo Testamento.

Nos evangelhos, esses temas são recorrentes. Um pressupõe o outro. De acordo com os evan- gelhos, vivemos hoje entre o já do Reino que veio e o ainda não de sua manifestação final; entre a promessa de Lucas 4.21 —“Hoje, se cumpriu a

Escritura que acabais de ouvir” — e a previsão de Mateus 24,14 —“Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”.

Como o Reino chegou

Os milagres e parábolas de Jesus esclarecem de maneira especial a forma em que o Reino fe revelado neste mundo, No evangelho de João, os milagres são chamados “sinais”, que apontam para o Reino vindouro e para o caráter ma- jestoso do Messias. Esses milagres suprem as necessidades humanas: pobreza, doença, fome, pecado, tentação demoníaca e ameaça de morte, Nesses milagres, Jesus antecipa a Páscoa. Cada um deles proclama que em qualquer lugar € a qualquer momento, onde quer que necessida- des e problemas humanos sejam enfrentados e vencidos no nome de Deus, ali o Reino de Deus estará reluzindo. De modo semelhante, as parábolas de Jesus — por exemplo, as pará- bolas do semeador, da rede, do joio, do grão de mostarda e do fermento — ilustram como a mensagem do Reino alcançará as nações € os povos (v. Mt 13; Lc 8; Mc 4).

“Com base na própria pregação de Jesus pode-se afirmar que a obra apostólica da Igreja por todo o mundo é a exata razão do intervalo entre a ascensão de Jesus e seu retorno como

Filho do Homem.”

Jesus e os gentios

Nos encontros de Jesus com os gentios, vejo-o exercendo uma santa impaciência, ansiando pelo dia em que todas as barreiras serão removidas é a mensagem será comunicada aos gentios. Por um breve tempo, ele restringe sua mensagem às ovelhas perdidas da casa de Israel, sabendo que certas condições precisam ser satisfeitas an- tes que a mensagem seja anunciada aos goyim. Israel deve ouvir primeiro (Mt 10) e o sangue do Cordeiro deve ser derramado para trazer perdão a “muitos” (Mc 10.45; 14.24).

A cruz e a ressurreição — o fundamento da missão mundial

Na cruz, Jesus suportou vicariamente o juízo de Deus que era merecido por Israel e pelos

* Relatório da Netherlands Missionary Council sobre as bases bíblicas para missões, De Heerban, n. 4, ago. 1951, p. 197-221.

Johannes Verkuyl Ra antro mero 8 acrescento ma im e gentios. De modo semelhante, sua ressurreição fez com que uma situação libertadora alcançasse toda a comunidade mundial de nações e povos. Á cruz e a ressurreição de Jesus são a base para a missão de alcance mundial, Por essa razão, entremeadas pelos relatos de sua cruz e da res- surreição está a ordem de levar a mensagem a todos os povos. Essa missão só será cumprida quando tiver “entrado a plenitude dos gentios” e o Reino de Deus se tiver manifestado em sua plenitude.

O mandato missionário do evangelho de Mateus

Os estudiosos do Novo Testamento afirmam que o evangelho de Mateus é composto de ma- terial catequético reunido e organizado prin- cipalmente para instruir recém-convertidos a respeito da obra, pessoa e Reino vindouro de Jesus, bem como ajudá-los na transmissão da mensagem a outros.

Em grande parte, Mateus utilizou-se do evangelho de Marcos como fonte de seus relatos acerca dos atos de Jesus, mas sua contribuição singular foi reunir uma série de nove discursos de Jesus. É dessa maneira que o evangelho de Mateus se torna um livro-texto de missões.

Os eruditos discordam acerca da data em que o livro foi escrito. Alguns defendem uma data próxima do ano 75. Outros preferem uma data um pouco posterior, entre 80 e 100. Se os últimos estiverem certos, devemos ter em mente que esse evangelho reflete um período da Igre- ja primitiva em que cristãos judeus e gentios estavam anunciando de igual para igual e de modo poderoso as boas novas. Pode-se então facilmente compreender que esse evangelho re- presente um chamado enérgico a comunicar à fé em Jesus, o Messias, tanto a Israel quanto às nações e povos não judaicos,

Comunicação do evangelho ao povo de Israel

Mateus 10 registra a ordem de Jesus aos discípu- los de proclamar a mensagem a Israel. Observe que as surpreendentes palavras dos versículos

5 € 6 = “Não tomeis rumo aos gentios, nem entreis em cidade de samaritanos, mas, de pre- ferência, procuras as ovelhas perdidas da casa de Israel” = fazem parte do mesmo livro que, no capítulo 28, registra a Grande Comissão, a ordem de ir a todos os povos. Mateus não faz qualquer tentativa de “reconciliar” as duas passagens. Em seu modo de entender, não era necessário, pois as duas se complementam e são igualmente válidas. Quando o evangelho de Mateus foi escrito, havia cristãos judeus vivendo na Palestina, os quais se opunham a qualquer missão aos gentios, pois acreditavam que certos fatos tinham de ocorrer primeiro. O autor-edi- tor do evangelho, provavelmente um membro da comunidade cristã judaica da Síria, escreveu esse livro-texto com a forte convicção de que o chamado a proclamar a mensagem a Israel tinha de ser simultâneo com a missão aos po- vos não israelitas. O escritor acreditava que tal simultaneidade era uma consequência da ordem do Senhor Jesus. Ele entendia que o destaque dado a Israel no período anterior à ressurreição era questão de importância estratégica.

Um segmento da cristandade judaica de- fendia a missão aos judeus em oposição à mis- são aos gentios, crendo que a última só deveria ser assumida depois que outro acontecimento de importância escatológica houvesse ocorri- do, a saber, o ajuntamento das “ovelhas” das doze tribos. Só então o caminho estaria aberto aos gentios.

Todavia, o escritor de Mateus 10 discor- da. Para ele o acontecimento que abria o ca- minho aos gentios era a ressurreição de Jesus. Antes disso toda a atenção estava posta sobre Israel, mas a cruz € a ressurreição são a base para a missão mundial, bem como o sinal para à largada. As palavras de Jesus registradas em Mateus 10.23 — “Em verdade vos digo que não acabareis de percorrer as cidades de Israel, até que venha o Filho do Homem” — são uma referência velada à sua ressurreição. Ferdinand Hahn faz uma bela exegese da relação entre os capítulos 10 e 28 de Mateus. Os dois textos são círculos concêntricos e sincronizam a missão

cristã a judeus e não judeus. Se de um lado o Jesus terreno, ele mesmo, um mensageiro a Israel, conclamou a Igreja a um contato contí- nuo com o antigo povo de Deus, de outro lado o Senhor de todo o mundo, ressurreto e exal- tado, expediu a ordem de ir a todos os povos. O que Mateus deseja afirmar à sua maneira é a prioridade da missão a Israel e a permanente obrigação para com tal missão, pois sem Israel no centro não haveria salvação. Essa missão, entretanto, só será desempenhada a contento se, ao mesmo tempo, a comissão universal for observada pelo trabalho entre as nações.

Os capítulos 10 e 28 do evangelho de Mateus não são, portanto, contraditórios. Pelo contrário, esclarecem o contexto histórico de logo após a ressurreição, quando os discípulos foram cha- mados a participar da missão. Entendidos em conjunto, estes dois textos nos lembram que as portas estão agora abertas a todos.

A Grande Comissão de Mateus 28

Existe uma ideia errada, bem difundida, e que não se consegue mudar, de que só Mateus con- tém o mandamento para a missão mundial. É certo, todavia, que os versículos finais do evan- gelho de Mateus expressam essa ordem de ma- neira a mais direta possível. A conclusão do evangelho de Mateus não apenas é convincente, em comparação com os outros evangelhos e o livro de Atos, como também os versículos finais criam um clímax e apresentam um resumo de tudo que foi escrito previamente. São a chave para a compreensão de todo o livro.

Nesses versículos conclusivos, Jesus, o Senhor ressurreto, de pé sobre uma das mon- tanhas da Galileia, talvez a mesma em que pre- gou o Sermão do Monte (Mt 5.1), apresenta aos discípulos uma mensagem de três pontos;

1) A autoridade de Jesus. Ele faz referência à própria autoridade com palavras que lembram Daniel 7.13,14, que ele mesmo havia pronun- ciado perante o Sinédrio e se encontram re- gistradas em Mateus 26,64, Agora nenhuma

2) O mandamento permanente de Jesus para realizar a missão. Depois de sua entronização, o Senhor crucificado e ressurreto dá a ordem para a missão. O tempo transcorrido entre sua ressurreição e a segunda vinda não será um mero intervalo vazio, mas um período durante o qual o desincumbir-se desse mandamento faz parte do processo de entronização. Filipenses 2.5-11 contém um marcante paralelo com a verdade aqui expressa.

O que o Senhor entronizado ordenou aos seus discípulos? Ele disse: “Ide, portanto...”. O autor escolheu o verbo grego poreuthentes, que significa “partir”, “deixar”, “cruzar fronteiras” — fronteiras sociológicas, raciais, culturais e geo- gráficas. Esse aspecto é mais importante para aquele que tem sobre si a tarefa de comunicar o evangelho. Afeta o trabalho feito na própria região, bem como em lugares longínquos. O missionário deve estar sempre pronto a cruzar fronteiras, estejam elas em seu ambiente ou em lugar distante, O verbo poreuomai nesse texto lembra à Igreja cristã primitiva o Jesus peripaté- tico que com seus discípulos estava sempre cru- zando fronteiras a fim de alcançar alguém. Jesus

3 Mission in the New Testament (London: SCM Press, 1965), p. 127-8.

sohannes Verkuyl também determina aos seus seguidores que fa- çam “discípulos de todas as nações”, Com base na palavra grega mathetes o autor cria um verbo. A forma verbal dessa palavra ocorre quatro vezes no Novo Testamento (Mt 13,52;27.57; At 14.21; e aqui em Mt 28.20). Tornar-se dis- aipulo de Jesus implica partilhar com ele de sua morte e ressurreição e unir-se a ele na marcha rumo à revelação final de seu Reino. Ele nos ordena que façamos discípulos, quer dizer, que levemos pessoas a se submeterem à sua auto- ridade libertadora e a se apresentarem como voluntárias para a marcha, já em andamento, rumo a uma nova ordem das coisas, a saber, seu Reino,

3) 4 promessa de Jesus. Ao acrescentar as pa- lavras finais da promessa — “Eis que estou con- vosco todos os dias até à consumação do século” —, Jesus lembra seus discípulos de que estará presente no meio deles de uma maneira dife-

— sd rente, À promessa continua válida para todas as épocas, Observe, de passagem, a frequência com que a palavra “todo” ocorre nesse texto: “toda a autoridade”, “todas as nações”, “todas as coisas”, “todos os dias”.

Cristo promete estar com sua Igreja todos os dias em que ela existir. Enquanto se desin- cumbe de sua chamada missionária, a Igreja deve sempre se perguntar: “Que dia é hoje”, pois não há dois dias iguais na história da Igre- ja. No entanto, por mais que os dias e épocas possam mudar enquanto a Igreja realiza sua mis- são nos seis continentes, um fato nunca muda: Jesus Cristo insiste que sua igreja cumpra seu chamado missionário enquanto ele a conduz ao destino final. Esse movimento missionário que emana de Jesus não cessará até o fim do mundo, Dessa forma, embora os métodos de realização da missão devam ser mudados continuamente, a tarefa em si permanece inalterada.

Perguntas para estudo

1. Por que Verkuyl discorda de vários autores que afirmam que o Antigo Testamento não faz absolutamente qualquer referência a um mandamento missionário?

2. Jonas é uma lição sobre a necessidade de uma conversão radical de tendências naturais e de uma reestruturação completa da própria vida para torná-la útil à missão. Quais eram as ten- dências naturais de Jonas, e qual reestruturação tinha de ocorrer em sua vida? Como essa mesma necessidade era tipificada na nação de Israel?

3. Como Verkuyl concilia a “disparidade” entre Mateus 10 e 28?$conteudo$
     where curso_id = v_curso and titulo like '%Verkuyl%';
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 1 · Leitura — Verkuyl, cap. 8: A base bíblica do mandato missionário mundial$t$, $conteudo$A base bíblica do mandato missionário mundial

JOHANNES VERKUYL foi professor chefe do Departamento de Missiologia e Evangelismo da Free University of Amsterdam. Em 1940, foi enviado como missionário para a Indonésia e passou três anos num campo de concentração japonês. É autor de mais de 250 livros e artigos, Extraído de Contemporary Missiology An Introduction [Missialogia contemporânea: uma introdução] (Grand Rapids: Ferdmans, 1978) Usada com permissão,

Johannes Verkuvyl

O significado do Antigo Testamento

O século XX e também o século XXI tém produzido um fluxo con- tínuo de literatura que considera o Antigo Testamento uma base indispensável e insubstituível para a tarefa missionária da Igreja entre as nações e povos deste mundo. Na qualidade de pessoas habituada a consultar tal literatura, desejo examinar quatro temas do Antigo Testamento que constituem a base da chamada neotes- tamentária à Igreja para se envolver na obra missionária mundial: o tema universal, o tema do resgate e da salvação, o tema missio- nário e o tema do antagonismo.

O tema universal

O Deus que no Antigo Testamento se identifica como o Deus de Abraão, de Isaque e de Jacó e que revela a Moisés seu nome pessoal, Yahweh, é o Deus de tado o mundo. À experiência que alguns poucos patriarcas — e mais tarde a nação de Israel ape- nas — tiveram com esse Deus amplia-se para incluir o horizonte de todo o mundo. Citaremos apenas umas poucas passagens do Antigo Testamento para aclarar esse tema,

A tábua das nações em Gênesis 10

Génesis 10, com sua passagem que relaciona a tábua das nações, é importante para a compreensão do tema universal do Antigo Testamento. Gerhard von Rad descreve essa tábua como a con- clusão da história da criação. Todas as nações têm sua origem na mão criadora de Deus e estão sob seu vigilante olhar de paciência e julgamento. Às nações não são meras peças decorativas dispostas ao acaso no cenário do drama real entre Deus e a humanidade. As nações, isto é, a raça humana como um todo, são parte do próprio drama, À obra e a atividade de Deus apontam para a humanidade como um todo,

Essa é uma das verdades fundamentais de Gênesis |—11, que constitui o registro do início da História. Também é encontrada no tocante relato do fim da História, o livro do Apocalipse. O próprio Deus, que se revelou a Israel e habitou entre nós em Jesus Cristo, identifica-se como o Alfa eo Ômega, o Princípio en Fim. Ele não apresentará seu trabalho aa Pai até que roda “língua, povo

É Mação”, uma “grande multidão que ninguém poa enumerar tenha se reunida ao redor de seu trono (Ap 5.910, 7,9-17), Deus se dirige diretamente às atividades cansativas e penosas dos seves humanos na Histária a fim de alcan- var seus olyetivos entre as nações,

A eleição divina de Israel como parte de seu objetivo para com as nações

Depois que a Biblia encerra o relato do julga- mento de Deus sobre as nações, descrito de modo tão ilustrativo no episódio da torre de Babel, em Génesis, segue-se o registro do cha- mado de Abraão, quando Deus lhe ordena que deixe Ur dos caldeus. À primeira vista parece que o “Deus de toda a terra” limitou seus in- teresses à história particular de uma só família e uma única tribo, Na verdade, nada estaria mais longe da verdade que essa ideia, Nas pa- lavras de Groot, “Israel é à primeira palavra dita por Deus na proclamação da salvação, não o Amém”, Durante algum tempo, Israel, o “povo de Abraão”, encontra-se separado das demais nações (Bx 19.355; Dt 7.148s), mas isso acontece apenas para que por meto de Israel Deus possa preparar o caminho para alcançar seus objetivos universais, Ao escolher Israel, um segmento de toda a humanidade, Deus nunca tirou os olhos das outras nações. Israel era uma minoria cha- mada para servir a maioria.

A eleição divina de Abraão e Israel diz res- peito ao mundo inteiro, Seu relacionamento com Israel é intenso justamente por sua insis- tência em reivindicar o mundo inteiro para si. Para falar a este mundo na plenitude dos tem- pos precisava de um povo, Um sem-número de estudos recentes enfatiza exatamente esse ponto. Deus escolheu Israel como preparação para o total desvendamento de seus objetivos universais.

Sempre que Israel se esquecia de que Deus o havia escolhido para que falasse às nações e passava a ignorá-las, numa atitude de orgulho egoísta, profetas como Amós, Jeremias e Isa- tas atacavam de forma veemente a pretensão etnocêntrica dos israelitas, acusando-os de

A base bíblica do mandato missionácio mund, subverter as verdadeiras intenções de Deu, (v. esp. Am 7,9,10),

A irrupção do tema universal no exílio

As experiências de Israel durante os séculos Vi e Via.€, despertaram-no para as intenções uni. versais de Deus. Em meio à experiência catas- trófica de ser aniquilado pelos babilônios e ser levado cativo para o exílio, os profetas passaram a perceber como a carreira de Israel estava tão intimamente ligada à história das nações, Da punição sofrida por Israel, surgiu a firme espe- rança de um novo pacto, um novo êxodo, um novo Filho de Davi. Jeremias, Ezequiel e Isaias: todos esses profetas viram o horizonte que se ampliava e deram testemunho de que agora to- das as nações eram alvo das promessas de Deus, A visão apocalíptica de Daniel prediz a vinda do Filho do Homem, cujo Reino dará fim aos reinos selvagens deste mundo e cujo domínio abrangerá todos os povos (Dn 7).

O tema do resgate e da salvação

Yahweh, o Redentor de Israel

O tema soteriológico da Bíblia, isto é, da obra divina de resgatar e salvar Israel e as demais nações, está intimamente ligado ao tema do universalismo. Yahweh, o Deus de toda a terra, demonstrou seu amor e manteve a palavra dada a Israel, libertando-o das cadeias da escravidão com seu braço forte e estendido (v. Dt 9.26; 13.5; 15.15; 24.18). Esse fato constituía a base do credo de Israel e era crucial à compreen- são do primeiro mandamento. Só esse Deus — que salva e liberta — é Deus. “Não terás outros deuses diante de mim” (Ex 20). Esse credo transformou Israel de mera nação entre muitas em comunidade escolhida, a qual deve sua existência ao ato divino de libertação e re- tribui a Deus com louvor, por meio de salmos e orações de gratidão.

Yahweh, o Redentor das nações

Os profetas de Israel cada vez mais se cons- cientizavam de que não seria apenas Israel O beneficiário dos atos divinos de redenção. Deus tohannes Verkuyl forçaria o restabelecimento de seu senhorio so- bre as nações do mundo inteiro.

Em seus estudos, Sundkder e Blauw desta- cam que os profetas desenvolvem essa ideia de forma centripeta, isto é, depois de seu resgate as outras nações rumam para Sião, o monte do Senhor. Os profetas apresentam o quadro em que pessoas de outras nações afluem para Jeru- salém, onde o Deus de Israel aparecerá como o Deus de todos os povos (v. Is 2,1-4; 25.6-9; 60; Mg 4.1-4; Jr 3.17; Ze 8.20s5).

Vários salmos também celebram esse tema. O salmo 87 proclama Jerusalém a cidade ecu- mênica, que um dia terá como cidadãos também os habitantes de várias nações, mesmo daquelas que em alguma época se opuseram mais inten- samente ao Deus de Israel. Eles se unirão para celebrar a comunhão que Deus restaurou com os povos,

O método divino de conceder libertação

A Bíblia revela os meios que Deus usa para trazer libertação a Israel e às nações. Nenhuma passagem do Antigo Testamento se aprofunda tanto nesse assunto quanto os chamados “cânti- cos do Servo”, de Isaías 40-55, Os cânticos do Servo fazem referência inconfundível à difusão da salvação por todo o mundo. O Servo levará à libertação até os confins da terra (Is 49.6) e não cessará sua obra até que a justiça prevaleça no mundo inteiro, As regiões costeiras estão aguardando sua instrução (Is 42.4).

O quarto cântico do Servo, no capítulo 53, desvenda um segredo: o modo em que o Servo do Senhor se desincumbirá de sua mis- são. Esse texto comovente mostra o Servo na condição de vítima da mais selvagem crueldade humana. Toda espécie de maus-tratos que a mente humana possa conceber serão infligi- dos a ele. Entretanto, nessa ocasião o Servo também atuará como um substituto, tornan- do-se alvo do juízo divino, do qual não apenas Israel era merecedor, mas todos os povos € na- ções. Como substituto de Israel e das nações, o Servo deve trilhar o caminho do sofrimento a fim de trazer-lhes liberdade. Além do mais, o texto apresenta às nações como dádivas de Yahweh ao Servo, como recompensa pela sua obediência voluntária de sofrer a morte. Ele conquistou o direito de trazer salvação e cura a todos os povos.

De passagem devemos observar que Paulo, o apóstolo aos gentios pagãos, baseia sua chamada da parte de Deus para participar da missão mun- dial nesses mesmos cânticos do Servo extraídos do Antigo Testamento (v. At 13.47).

O tema missionário

Relacionado aos outros dois temas do Anti- go Testamento já mencionados, encontramos O tema missionário. Os profetas nunca se can- sam de lembrar Israel de que sua eleição não é um privilégio que possa guardar apenas para si, À eleição é um chamado ao serviço. Implica o dever de testemunhar entre as nações. Israel deve ser para as demais nações um sinal de que Yahweh é tanto o Criador quanto o Libertador. Um dos cânticos do Servo (Is 49.6) refere-se à ordem dada a Israel de se tornar uma luz para as nações.

Quase todo autor que tenta explicar o chama- do de Israel chega ao conceito da presença. Esco- lhido por Deus para se tornar receptor especial da misericórdia e da justiça divinas, Israel tem agora o dever de viver como povo de Deus no meio das outras nações a fim de lhes mostrar a graça, a misericórdia, a justiça e o poder li- bertador de Deus. Vez após outra, os profetas registraram seu profundo desapontamento com a constante sabotagem que Israel praticava con- tra o chamado divino. Por mais que estivessem irados contra a desobediência de Israel, os pro- fetas continuavam a lembrá-lo do real objetivo da ordem de estar presente entre os povos como nação distinta e como sacerdócio real.

Vale a pena observar que, desde a Segunda Guerra Mundial, inúmeros missiólogos vêm insistindo que a presença cristã é um dos prin- cipais métodos de participar da obra missionária hoje, Por diversas razões e de várias maneiras, afirmam que a forma de testemunho mais ade- quada é simplesmente ser um tipo de pessoa em particular enquanto vive entre outras pes- soas. Não é hora de desenvolver essa ideia, mas apenas de destacar que o conceito de que estar presente é testemunhar tem profundas raízes no Antigo Testamento. Os profetas proclama- vam que o simples fato de viver de acordo com a ordem divina de servir, tornaria Israel um sinal e uma ponte para as outras nações.

Não creio, todavia, que seja correto enten- der o tema missionário apenas com base no conceito de presença. Simplesmente não com- preendo por que tantos autores decididamen- te declaram que o Antigo Testamento não faz em absoluto qualquer referência a um mandato missionário.

Em seu livro Mission in the Nexo Testament [Missão no Novo Testamento), Hahn afirma, por exemplo, que o Antigo Testamento apre- senta um “caráter totalmente passivo”, Em mi- nha opinião, isso é exagero. O livro de Bachli, Israel and die Volker [Israel e as nações) está mais próximo da verdade ao observar que o relato do êxodo e a tradição deuteronômica fazem distin- ção entre am (“povo”) e gahat (“a comunidade religiosa”) e expressamente mencionam que já no deserto muitos indivíduos, embora não fos- sem membros do am desde o início, se uniram à gabat. Da mesma forma, os povos pagãos que acompanharam Israel e habitaram como estran- geiros entre o povo de Deus também partici- param da adoração de Israel. Eles ouviram o testemunho dos atos poderosos de Deus e se uniram a Israel em cânticos de louvor.

Temos, então, um significativo número de pessoas que deixaram suas origens pagãs e, por palavras e obras, foram ganhas para confiar no Deus vivo, o qual lhes havia demonstrado mi- sericórdia, e também para o servir. As histórias de Melquisedeque, Rute, Jó, o povo de Nínive descrito no livro de Jonas e de muitos outros no Antigo Testamento são, por assim dizer, como janelas através das quais podemos avis- tar a grande multidão fora da nação de Israel e ouvir a suave música, que já se fazia ouvir, de uma chamada missionária para alcançar todos os povos.

À base bíblica do mandato missionário mmunas,,

A literatura saprencial do Antigo Testarmes. to é semelhante tanto na forma quanto no cor. teúdo às culturas egípcia e grega. Sem dúvida essa hteratura proporcionou a Israel um meio d. comunicar suas crenças às outras nações.

Além do mais, não existe nenhuma outr, explicação para o poderoso impacto misssori. não do judaísmo durante a Diáspora, a não se; a afirmação de que aqueles judeus dispersos ha. viam, desde 0 princípio, ouvido e compreendid,, sua chamada para testemunhar de forma direr, e também por meio de sua presença.

O tema do antagonismo

À lista de temas missionários do Antigo Testa- mento ainda está incompleta. Intricadamente ligado a cada um dos temas mencionados rias seções anteriores, está o tema do antagonism, isto é, a poderosa contenda de Yahweh contra os poderes e forças que se opõem à sua autori- dade libertadora e plena de graça.

Todo o Antigo Testamento (e também o Novo Testamento) está repleto de descrições de como Yahweh-Adonai, o Deus da aliança com Israel, combate aquelas forças que ten- tam se opor aos seus planos para a criação e subvertê-los. Luta contra aqueles deuses falsos que os seres humanos confeccionaram usando o mundo criado como modelo, idolatraram e usaram para seus propósitos. Considere, por exemplo, os baalins e Astarote, cujos adorado- res consideravam divinos a natureza, a tribo, o governo e a nação. Deus opõe-se à magia e à astrologia, as quais, de acordo com Deutero- nômio, alteram a linha limítrofe entre Deus e sua criação. Ele batalha contra toda forma de injustiça social e despe cada disfarce sob o qual a injustiça procura se esconder (v. Amós é Jeremias, por exemplo).

Todo o Antigo Testamento está tomado de um desejo febril de derrotar esses pode- res contrários. Há magníficas visões do Rei- no vindouro, no qual cada relacionamento será adequadamente restabelecido e quando toda 3 criação (humanos, animais, plantas e as demais criaturas) se enquadrará de maneira perfeita nos tohannes Verkuyl ie pemend tomai cm arrimo cm a mm ar a propósitos de Deus (v, Is 2 e 65; Mg 4).O An- tigo Testamento anscia pela manifestação de- fimitiva desse Reino e afirma categoricamente a promessa de que no fim Yahweh será de fato vencedor. Esse é também um tema bastante significativo para a participação missionária. É impossível participar da missão, a menos que se combatam todas as formas de oposição aos propósitos de Deus, onde quer que se encon- trem — nas igrejas, no mundo das nações ou na própria vida.

O Antigo Testamento liga intimamente o tema do antagonismo às questões doxológicas. A glória de Yahweh- Adonai será manifesta en- tre todos os povos. Cada ser humano, então, virá a conhecê-lo como ele realmente é; “Deus clemente, e misericordioso, e tardio em irar-se, e grande em benignidade, e que [se arrepende] do mal” (Jn 4.1,2).

O livro de Jonas O livro de Jonas é fundamental para se enten- der a base bíblica da missão porque trata do mandato de Deus ao seu povo com relação aos povos gentílicos e, dessa forma, serve como pas- so preparatório para o mandato missionário do Novo Testamento. Jonas também é importante para dar uma ideia da profunda resistência que esse mandato encontra no próprio servo que Yahweh escolheu para realizar essa tarefa de alcance mundial,

Hoje muito se fala e se escreve a respei- to de orientar o povo para a missão, Jonas é uma lição de treinamento para quem pretende ser missionário. O livro revela a necessidade de uma conversão radical das tendências natu- rais e da reestruturação completa da vida pes- soal, de modo que o cristão se torne útil para a missão,

Contexto do livro

O título do livro é o nome pessoal de um pro- feta sem disposição, Jonas, e retoma o assunto da época do rei Jeroboão II (787-746 a.C.), quando viveu um profeta chamado Jonas ben Amitai, É óbvio, todavia, que esse midrash foi

escrito por razões outras e não para detalhar os acontecimentos da vida do profeta. O autor usa esse nome pessoal para apresentar aos seus leitores um missionário que não apreciava os gentios e que, à semelhança dos fariseus de épo- cas posteriores, não podia tolerar um Deus que demonstrasse misericórdia para com os gen- tios. Nas palavras do autor holandês Miskotte, “o escritor deseja apresentar uma personagem que seja exatamente o oposto de um apóstolo”, O autor de Jonas adverte seus leitores contra aquela atitude intolerante e pergunta se dese- jam ser transformados em servos que atuam de modo a cumprir as ordens de Deus.

O escritor de Jonas entende que Israel ficou tão preocupado consigo mesmo que se esque- ceu do mundo das nações. Israel, o receptáculo de toda a revelação de Deus, recusava-se a dar um passo em território estrangeiro e proclamar aos outros povos a mensagem divina de juízo e libertação. Entretanto, a mensagem do livro também é destinada à congregação do Novo Testamento, a qual tenta de diversas maneiras escapar ao mandamento de apresentar a men- sagem de Deus ao mundo.

Os hábeis esforços de fuga de Jonas repre- sentam a Igreja preguiçosa e infiel, que não dá atenção ao mandamento de seu Senhor. Deus tem de lutar contra o etnocentrismo bitolado de Israel, que restringe sua atividade às fronteiras da nação, e contra a recusa eclesiocêntrica da Igreja em sair pelo mundo a proclamar a men- sagem de Deus e realizar sua obra. O escritor está decidido a convencer seus leitores de que o alcance da atividade libertadora de Deus é gran- de o bastante para atingir tanto Israel quanto os gentios.

É um milagre que Jonas, com sua dura advertência contra o etnocentrismo, tenha conseguido entrar para o cânon das Escrituras. Sem rodeios, ele mostra a tentativa humana de sabotar os planos divinos para o mundo de modo que seus leitores (Israel, a Igreja do Novo Testamento e nós) possam ouvir o que o Espírito Santo está tentando lhes dizer por meio desse pequeno livro.

Resumo das oito cenas do livro

À primeira cena se inicia com Jonas recebendo a ordem de ir a Nínive. Enquanto o Antigo Testamento geralmente conclama as outras na- ções a virem a Sião, o monte de Deus, Jonas, à semelhança dos discípulos do Novo Testamen- to (v. Mt 28.18-20), recebe a ordem de ir. Na tradução da Septuaginta, o livro de Jonas usa a palavra porettomai em 1.2,3 e de novo em 3.2,3, a mesma usada por Jesus na Grande Comissão, registrada em Mateus 28. Para onde Jonas deve- rá ir? Dentre todos os lugares, justamente para Nínive — o centro do totalitarismo, da brutali- dade e das atitudes belicosas. Nínive, conhecida pela perseguição vergonhosa, tortura selvagem e orgulho imperialista com que tratava os que se opunham à sua política. Deus quer que servo advirta Nínive acerca de um juízo iminente e que a conclame ao arrependimento. Deus quer salvar Nínive!

No entanto, Jonas recusa-se a obedecer. É verdade que ele se prepara para viajar, mas ape- nas para fugir da face de Deus, que é Senhor sobre todos.

Na segunda cena, Deus reage à fuga de Jonas enviando uma fortíssima tempestade (1.4-16). O vento obedece às ordens de Yahweh, mas o desobediente Jonas dorme no porão do navio, esquecido do fato de que é o alvo da tempestade. Às vezes, a Igreja também dorme enquanto a tempestade do juízo de Deus atinge o mundo, imaginando que o vento lá fora não lhe diz res- peito. Enquanto a tripulação tenta, sem êxito, descobrir a causa da tempestade, Jonas confessa que adora e teme ao Deus que fez o mar e a terra seca, ao único Deus que está acima de todas as nações. Ele confessa que esse Deus tem uma acusação contra ele e que a única maneira de acalmar as ondas é lançá-lo ao mar. Nessa cena, a tripulação representa os gentios, um povo a quem Jonas não dá a menor importância, mas que, ainda assim, está interessado em poupar a vida do profeta. Depois de Jonas lhes dar a ordem pela segunda vez, eles o lançam ao mar, e a tempestade cessa, Quase sem conseguir crer no que estão vendo, os marinheiros se derra-

mam em louvor ao Deus de Jonas. À obediê; cia deles ultrapassa à do sabotador Jonas. Est: mais acessíveis a Deus que o próprio profeta

À terceira cena (1.17) mostra um grande pe xe que, sob as ordens de Yahweh, abre a bo: para engolir Jonas e vomitá-lo na praia, no di vido tempo. Jonas simplesmente não consegi evadir-se ao mandato missionário de Deus. ( Deus que levantou os ventos terríveis € cor duziu os marinheiros na realização do propx sito missionário agora dirige um peixe com parte de seu plano para salvar Nínive. Yahwe continua sua obra de reformar e preparar sc missionário para que este seja um instrument adequado aos planos divinos.

Na quarta cena (2.1-10), Jonas implora Deus que o tire do ventre do peixe. Ele, que ni tivera o mínimo de misericórdia para com « gentios e se recusara a admitir que as promess: de Deus também diziam respeito a eles, ago: suplica pela misericórdia divina e, citando fras de vários salmos, almeja as promessas cobrad: pelos adoradores no templo de Deus. Yahwe responde. Fala ao enorme animal, e Jonas v: parar numa praia, são e salvo. Pelo próprio res gate Jonas se tornou, sem qualquer intençã: uma testemunha da misericórdia salvadora d Deus. Embora coberto de algas, ainda assim er um testemunho de que Deus não tem prazs na morte de pecadores e sabotadores, mas s regozija com a conversão deles.

Na quinta cena (3.1-4), Deus repete a order dada ao homem cuja vida é um testemunh vivo do que confessara no ventre do peixe: “A Senhor pertence a salvação”. A Septuagint emprega a palavra kerygma em 3.1ss. Essa pa lavra sozinha resume a missão de Jonas: ele dev proclamar que Nínive, por mais ímpia que sej: ainda é objeto da preocupação de Deus e, menos que se arrependa, será destruída. Su mensagem tem de ser uma tanto de ameaç quanto de promessa, tanto de juízo quanto d boas novas.

Na sexta cena (3.5-10), Nínive atende a apelo de Jonas para se arrepender. O rei tiran e orgulhoso desce do trono, troca o manto re:

tobannes Verkuyl por pó e cinza e ordena a todos os cidadãos e amumais que sigam seu exemplo, O que Israel sempre se recusara a fazer os pagãos gentios fecram! O cruel rei de Nínive é um antitipo dos reis desobedientes de Judá,

O povo une-se ao rei no ato de arrepen- demento. Cessa a obra demoníaca, e os meca- mismos aterrorizantes e coercivos da injustiça politica são reprimidos. Em profunda penitén- cia, abandonam os ídolos para servir ao Deus que é Senhor de cada nação e de toda a criação. Tudo isso é possível porque Yahweh é Deus. O mundo pagão é um campo missionário poten- cialmente produtivo por uma única razão; só o Senhor é Deus.

Às cortinas se fecham nessa cena com estas palavras surpreendentes: “Viu Deus o que fi- zeram, como se converteram do seu mau ca- minho; e Deus se arrependeu do mal que tinha dito lhes faria e não o fez", Yahweh é fiel às suas promessas, Ainda hoje sua vontade para com Moscou, Pequim, Londres e Amsterdã não é menos “graciosa e cheia de misericórdia” do que foi para com Nínive. Tomando emprestada a frase de Lutero, o qual muito apreciava pregar sobre o livro de Jonas, a mão esquerda da ira de Deus foi substituída pela mão direita da bênção e da liberdade.

À sétima cena (4.1-4) relembra o fato de que o maior obstáculo a ser transposto no cum- primento do mandato missionário não foram os marinheiros, nem o peixe, nem o rei e os cidadãos de Nínive, mas o próprio Jonas — a Igreja recaleitrante e de visão estreita. O capí- tulo 4 fala de Jonas, o qual, havia algum tempo, deixara a cidade para procurar abrigo a leste de suas fronteiras. O período de 40 dias para arrependimento já passou, mas como Deus mu- dou de ideia a respeito de destrui-la, a cidade continua a ser alimentada pela graça e pela mi- sericórdia de Yahweh, Jonas está furioso pelo fato de Deus haver estendido sua misericórdia para além dos limites de Israel, alcançando os gentios. Ele queria que Deus se enquadrasse em seu conceito pessoal de Deus: um deus da natureza frio, duro e cruel, com uma atitude inflexível contra os pagãos. Ve não suporta a ideia da participação dos gentios na história da salvação,

Esse é o pes ado de Jonas, “pe ado de um missionário cujo coração não está na missão, Ele, que uma vez implorara a Deus misericórdia ao ver-se abandonado no ventre do peixe, agora está irado porque Deus demonstrou misericór- dia para com as nações, Ele dá vazão à sua fúria na forma de oração, que se encontra em 42 ed o texto-chave do livro; “Ah! Senhor! Não foi isso o que eu disse, estando ainda na minha terra? Por isso, me adiantei, fugindo para 'Társis, pois sabia que és Deus clemente, e misericordioso, é tardio em irar-se, e grande em benignidade, e que te arrependes do mal”, Parte dessa oração tem sua origem numa antiga liturgia de Israel, que cada israelita conhecia de cor e poderia até repetir durante o culto no templo ou na sinago- ga mesmo que estivesse cochilando (v. ix 34.6; S1 86,15; 103.8; 145.8; Ne 9.17). Jonas, porém, não consegue imaginar que essa liturgia seja ver- dadeira não apenas para Jerusalém, onde estava localizado o templo de Deus, mas também para outros lugares — Nínive, São Paulo, Nairóbi, Nova York e Paris.

Por que Jonas está tão irado? Pela única razão de Deus tratar pessoas que estão fora do círculo de sua aliança da mesma maneira em que trata os de dentro. Na verdade, a ira de Jonas o está afastando da aliança, pois ele obstinada- mente se recusa a reconhecer o propósito do pacto, que é levar a salvação aos pagãos. Não aprendeu ainda que Israel não pode ter a pre- sunção de desfrutar favores especiais de Deus. Tanto Israel quanto os gentios vivem pela graça que o Criador concede a todas as suas criatu- ras. Assim, Deus se aproxima de seu profeta não mais como participante da aliança, mas na qualidade de Criador, e pergunta à sua criatura: “É razoável essa tua ira?”

Na oitava e última cena (4.5-11) pode-se notar que Deus ainda se esforça em ensinar as lições ao seu missionário cabeça-dura, Ele não entendeu as lições da tempestade, dos ma- rinheiros, do peixe e da conversão de Nínive

À essa altura, Deus tenta mais uma vez en- sinar seu aluno-missionário, usando a planta como lição objetiva. O próprio Deus, que dirige todo o curso da História, que governa o vento e as ondas do mar e que levou os milhões de ninivitas ao arrependimento, agora pergunta com ternura:

É razoável essa tua ira por causa da planta? Ele respondeu: É razoável a minha ira até à morte. Tomou o Senhor: Tens compaixão da planta que te não custou trabalho, a qual não fizeste crescer, que numa noite nasceu e numa noite pereceu; e não hei de eu ter com- paixão da grande cidade de Nínive, em que há mais de cento e vinte mil pessoas, que não sabem discernir entre a mão direita e a mão esquerda, e também muitos animais?

Deus poupa e resgata. O Deus de Jerusalém também é o Deus de Nínive. Ao contrário de Jonas, Ele não tem qualquer “complexo de gen- tios” e, embora nunca nos constranja, pede-nos que ponhamos nosso coração e nossa alma no trabalho da missão. Deus ainda tem interesse em transformar os Jonas obstinados, indigna- dos, deprimidos e profundamente irritáveis em arautos das boas novas que libertam.

O livro termina com uma pergunta implí- cita, que jamais foi respondida: Deus alcançou seu objetivo com Nínive, mas o que dizer de Jonas? Ninguém sabe. A pergunta acerca de Israel e da igreja e de sua obediência ainda está em aberto.

É o tipo de pergunta que cada geração de cristãos tem de responder por si mesma, Jacques Ellul encerra o livro que escreveu sobre O assunto com as seguintes palavras;

O livro de Jonas não tem conclusão alguma, e a pergunta última do livro não tem respos- ta, exceto por parte daquele que percebe a grandeza da misericórdia de Deus e que, de modo factual, e não apenas mítico, trabalha pela salvação do mundo.!

A igreja do Novo Testamento deve ded car cuidadosa atenção à mensagem do livro d Jonas. Jesus Cristo é aquele que “é maior d que Jonas” (Mt 12.39-41; Le 11.29-32). Su morte na cruz, com aquele horrível grito de té sido abandonado por Deus, e sua ressurreição com a jubilosa exclamação de vitória, são sina de Jonas para nós, apontando para o profund significado da vida de Cristo e confirmando qu Deus amou o mundo “de tal maneira”.

Se alguém recebe uma transfusão vital d sangue daquele que é maior que Jonas e assir mesmo se recusa a espalhar as boas novas, ele est na verdade, sabotando os objetivos do própri Deus. Jonas é o pai de todos os cristãos que de sejam os benefícios e as bênçãos da eleição, m: se recusam a aceitar sua responsabilidade.

Thomas Carlisle termina seu poema “TN Jonas” com os seguintes versos:

E Jonas se aproximou em silêncio de seu banco ensombreado e esperou de Deus passar a ter seu jeito de pensar.

E Deus ainda espera dos incontáveis Jonas em suas casas confortáveis passarem a ter seu jeito de amar.

O período interbíblico

Uma pesquisa acerca do período da Diáspo: judaica revelou evidências de um esforço judai. de fazer prosélitos, o que, de sua parte, marc definitiva e caracteristicamente o trabalho mi sionário posterior realizado por gentios be como por judeus cristãos. A Septuaginta (trad ção grega do Antigo Testamento) espalhou- por todo o mundo civilizado e era explica:

* The Judgment of Jonah (Grand Rapids: Eerdmans, 1971), p. 103,

Johannes Verkuyl nas sinagogas. O impacto missionário do ju- daísmo da época da Diáspora foi bem maior do que muitos pensam. Mais que isso, 0 ju- daísmo influenciou o cristianismo primitivo, pois os cristãos judeus mantinham íntimo re- lacionamento com as comunidades ligadas às sinagogas. À sinagoga desempenhou um papel essencial, pois atraía não apenas os prosélitos (gentios que adotaram o conjunto de crenças e práticas judaicas, até mesmo a circuncisão), mas também um grupo classificado como “os que temem a Deus” (gentios que aceitavam a maior parte da ética e parte da prática religiosa do judaísmo, mas rejeitavam a circuncisão).

Todavia, apesar dos pontos em comum, a mensagem judaica era totalmente diferente do evangelho do Novo Testamento, o qual pregava o Reino de Deus e a crença cristã de que Jesus era o Messias. O judaísmo da Palestina exigia que os pagãos fossem assimilados à comunhão judaica e empreendiam todos os esforços para alcançar essa mudança. Já as comunidades ju- daicas fora da Palestina enfatizavam o mono- teísmo, crença que o mundo pagão, cansado de adorar tantos deuses, achava bem atraente. Eles espiritualizavam a prática religiosa e cen- suravam o estilo de vida decadente do mundo gentílico. Sua mensagem era em grande parte autossotérica, isto é, a pessoa podia salvar a si mesma. Tanto os oráculos sibilinos quanto o li- vro de José e Asenate garantem que a pessoa que cumprir de maneira correta as exigências éticas e rituais poderá reconciliar-se com Deus.

Jesus por certo dirigia as incisivas palavras de Mateus 23.15 contra esses elementos espe- cíficos da mensagem judaica quando lamentou: “Ai de vós, escribas e fariseus, hipócritas, porque rodeais o mar e a terra para fazer um prosélito; e, uma vez feito, o tornais filho do inferno duas vezes mais do que vós!”. Paulo acompanha Jesus ao reprovar, em Romanos 2,17-24, o legalismo Judaico e os esforços de autojustificação.

Jesus e Paulo não eram contrários às missões judaicas aos gentios em si. Na verdade, Paulo entende seu trabalho entre os gentios como a continuação do que os judeus da Diáspora ha-

viam começado a fazer. Contudo, ele e Jesus faziam objeções à pregação dos judeus, de modo que quando Jesus começou a proclamar sua mensagem ele não recorreu às tradições judai- cas recentes em busca de apoio, mas ao próprio Antigo Testamento.

O Novo Testamento, livro mundial de missões

Do início ao fim, o Novo Testamento é um li- vro de missões. Deve sua existência ao trabalho missionário das igrejas cristãs primitivas judai- cas e gregas. Os evangelhos são, por assim dizer, “gravações ao vivo” da pregação missionária, e as epístolas não são tanto apologética missionária quanto são instrumentos autênticos e reais do trabalho missionário. Não temos condições de analisar cada detalhe que salienta a importância do Novo Testamento para a fundamentação e a prática missionária, entretanto, podemos exa- minar alguns deles.

Jesus, o Salvador do mundo

Os inúmeros temas do Antigo Testamento con- vergem para a pessoa e a obra de Jesus de Nazaré. Os cidadãos samaritanos — meio judeus e meio gentios — da cidade de Sicar foram os primei- ros a mencionar essa verdade ao afirmar, em João 4.42: “Sabemos que este é verdadeiramente o Salvador do mundo”.

A chegada do Reino abrangente de Deus No início de seu ministério, Jesus dirigiu-se à sua cidade, Nazaré, e foi à sinagoga para adorar, no sábado. Os líderes então concederam-lhe a honra de ler as Escrituras. Ao concluir a leitu- ra da mensagem do profeta Isaías, capítulo 61, depois de devolver o rolo do profeta, acrescen- tou um comentário que traz uma esperança de valor incalculável para muitas pessoas, mas que também ofende profundamente os que o rejei- tam. Ele disse: “Hoje, se cumpriu a Escritura que acabais de ouvir” (Lc 4.21).

A salvação, que estava por vir e da qual os profetas deram testemunho, revela-se verda- deira na pessoa da Jesus Cristo, A salvação já e — ne er ro chegouçe, portanto, as boas novas anunciadas por Jesus descrevem um Reino que ao mesmo tempo jd chegou e ainda está vindo. Aplican- do as palavras de Isaías 61 a si mesmo, Jesus acrescenta que o Espírito do Senhor está sobre ele. Jesus marca o início do Reino de Deus e amuncia o “ano aceitável do Senhor” com toda a sua rica diversidade, À primeira manifestação do Reino foi provisória e ainda aguarda a con- sumação, mas quando Jesus fez a surpreendente afirmativa “O Espírito do Senhor [...] me ungiu para evangelizar os pobres, enviou-me para pro- clamar libertação aos cativos € restauração da vista aos cegos, para pôr em liberdade os opri- midos, e apregoar o ano aceitável do Senhor” — q Reino de fato chegou, e também a hora da decisão. Por intermédio de Jesus Cristo, Deus demonstrou aos homens sua obra graciosa e salvífica como nunca antes, de maneira direta e urgente. O contorno das coisas vindouras, isto é, o Reino, tornou-se excepcionalmente nítido na pessoa, nas palavras e na obra do Messias. Com poder, ele subjugou aquelas for- ças sinistras que destrufam a alma e o corpo dos homens e renovou os que eram vítimas € escravos de tais forças. Ele chamou o povo ao arrependimento.

Todo o Novo Testamento usa a linguagem da consumação. À obra graciosa e salvadora de Deus Já se tornou visível a todo o mundo (v. Tt 2.11; Ef1.10;G] 4.4,5; Hb 1.1-4). Contudo, também afirma que a manifestação final desse Reino ainda está por vir. Existe ainda uma atmosfera de expectativa no Novo Testamento.

Nos evangelhos, esses temas são recorrentes. Um pressupõe o outro. De acordo com os evan- gelhos, vivemos hoje entre o já do Reino que veio e o ainda não de sua manifestação final; entre a promessa de Lucas 4.21 —“Hoje, se cumpriu a

Escritura que acabais de ouvir” — e a previsão de Mateus 24,14 —“Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”.

Como o Reino chegou

Os milagres e parábolas de Jesus esclarecem de maneira especial a forma em que o Reino fe revelado neste mundo, No evangelho de João, os milagres são chamados “sinais”, que apontam para o Reino vindouro e para o caráter ma- jestoso do Messias. Esses milagres suprem as necessidades humanas: pobreza, doença, fome, pecado, tentação demoníaca e ameaça de morte, Nesses milagres, Jesus antecipa a Páscoa. Cada um deles proclama que em qualquer lugar € a qualquer momento, onde quer que necessida- des e problemas humanos sejam enfrentados e vencidos no nome de Deus, ali o Reino de Deus estará reluzindo. De modo semelhante, as parábolas de Jesus — por exemplo, as pará- bolas do semeador, da rede, do joio, do grão de mostarda e do fermento — ilustram como a mensagem do Reino alcançará as nações € os povos (v. Mt 13; Lc 8; Mc 4).

“Com base na própria pregação de Jesus pode-se afirmar que a obra apostólica da Igreja por todo o mundo é a exata razão do intervalo entre a ascensão de Jesus e seu retorno como

Filho do Homem.”

Jesus e os gentios

Nos encontros de Jesus com os gentios, vejo-o exercendo uma santa impaciência, ansiando pelo dia em que todas as barreiras serão removidas é a mensagem será comunicada aos gentios. Por um breve tempo, ele restringe sua mensagem às ovelhas perdidas da casa de Israel, sabendo que certas condições precisam ser satisfeitas an- tes que a mensagem seja anunciada aos goyim. Israel deve ouvir primeiro (Mt 10) e o sangue do Cordeiro deve ser derramado para trazer perdão a “muitos” (Mc 10.45; 14.24).

A cruz e a ressurreição — o fundamento da missão mundial

Na cruz, Jesus suportou vicariamente o juízo de Deus que era merecido por Israel e pelos

* Relatório da Netherlands Missionary Council sobre as bases bíblicas para missões, De Heerban, n. 4, ago. 1951, p. 197-221.

Johannes Verkuyl Ra antro mero 8 acrescento ma im e gentios. De modo semelhante, sua ressurreição fez com que uma situação libertadora alcançasse toda a comunidade mundial de nações e povos. Á cruz e a ressurreição de Jesus são a base para a missão de alcance mundial, Por essa razão, entremeadas pelos relatos de sua cruz e da res- surreição está a ordem de levar a mensagem a todos os povos. Essa missão só será cumprida quando tiver “entrado a plenitude dos gentios” e o Reino de Deus se tiver manifestado em sua plenitude.

O mandato missionário do evangelho de Mateus

Os estudiosos do Novo Testamento afirmam que o evangelho de Mateus é composto de ma- terial catequético reunido e organizado prin- cipalmente para instruir recém-convertidos a respeito da obra, pessoa e Reino vindouro de Jesus, bem como ajudá-los na transmissão da mensagem a outros.

Em grande parte, Mateus utilizou-se do evangelho de Marcos como fonte de seus relatos acerca dos atos de Jesus, mas sua contribuição singular foi reunir uma série de nove discursos de Jesus. É dessa maneira que o evangelho de Mateus se torna um livro-texto de missões.

Os eruditos discordam acerca da data em que o livro foi escrito. Alguns defendem uma data próxima do ano 75. Outros preferem uma data um pouco posterior, entre 80 e 100. Se os últimos estiverem certos, devemos ter em mente que esse evangelho reflete um período da Igre- ja primitiva em que cristãos judeus e gentios estavam anunciando de igual para igual e de modo poderoso as boas novas. Pode-se então facilmente compreender que esse evangelho re- presente um chamado enérgico a comunicar à fé em Jesus, o Messias, tanto a Israel quanto às nações e povos não judaicos,

Comunicação do evangelho ao povo de Israel

Mateus 10 registra a ordem de Jesus aos discípu- los de proclamar a mensagem a Israel. Observe que as surpreendentes palavras dos versículos

5 € 6 = “Não tomeis rumo aos gentios, nem entreis em cidade de samaritanos, mas, de pre- ferência, procuras as ovelhas perdidas da casa de Israel” = fazem parte do mesmo livro que, no capítulo 28, registra a Grande Comissão, a ordem de ir a todos os povos. Mateus não faz qualquer tentativa de “reconciliar” as duas passagens. Em seu modo de entender, não era necessário, pois as duas se complementam e são igualmente válidas. Quando o evangelho de Mateus foi escrito, havia cristãos judeus vivendo na Palestina, os quais se opunham a qualquer missão aos gentios, pois acreditavam que certos fatos tinham de ocorrer primeiro. O autor-edi- tor do evangelho, provavelmente um membro da comunidade cristã judaica da Síria, escreveu esse livro-texto com a forte convicção de que o chamado a proclamar a mensagem a Israel tinha de ser simultâneo com a missão aos po- vos não israelitas. O escritor acreditava que tal simultaneidade era uma consequência da ordem do Senhor Jesus. Ele entendia que o destaque dado a Israel no período anterior à ressurreição era questão de importância estratégica.

Um segmento da cristandade judaica de- fendia a missão aos judeus em oposição à mis- são aos gentios, crendo que a última só deveria ser assumida depois que outro acontecimento de importância escatológica houvesse ocorri- do, a saber, o ajuntamento das “ovelhas” das doze tribos. Só então o caminho estaria aberto aos gentios.

Todavia, o escritor de Mateus 10 discor- da. Para ele o acontecimento que abria o ca- minho aos gentios era a ressurreição de Jesus. Antes disso toda a atenção estava posta sobre Israel, mas a cruz € a ressurreição são a base para a missão mundial, bem como o sinal para à largada. As palavras de Jesus registradas em Mateus 10.23 — “Em verdade vos digo que não acabareis de percorrer as cidades de Israel, até que venha o Filho do Homem” — são uma referência velada à sua ressurreição. Ferdinand Hahn faz uma bela exegese da relação entre os capítulos 10 e 28 de Mateus. Os dois textos são círculos concêntricos e sincronizam a missão

cristã a judeus e não judeus. Se de um lado o Jesus terreno, ele mesmo, um mensageiro a Israel, conclamou a Igreja a um contato contí- nuo com o antigo povo de Deus, de outro lado o Senhor de todo o mundo, ressurreto e exal- tado, expediu a ordem de ir a todos os povos. O que Mateus deseja afirmar à sua maneira é a prioridade da missão a Israel e a permanente obrigação para com tal missão, pois sem Israel no centro não haveria salvação. Essa missão, entretanto, só será desempenhada a contento se, ao mesmo tempo, a comissão universal for observada pelo trabalho entre as nações.

Os capítulos 10 e 28 do evangelho de Mateus não são, portanto, contraditórios. Pelo contrário, esclarecem o contexto histórico de logo após a ressurreição, quando os discípulos foram cha- mados a participar da missão. Entendidos em conjunto, estes dois textos nos lembram que as portas estão agora abertas a todos.

A Grande Comissão de Mateus 28

Existe uma ideia errada, bem difundida, e que não se consegue mudar, de que só Mateus con- tém o mandamento para a missão mundial. É certo, todavia, que os versículos finais do evan- gelho de Mateus expressam essa ordem de ma- neira a mais direta possível. A conclusão do evangelho de Mateus não apenas é convincente, em comparação com os outros evangelhos e o livro de Atos, como também os versículos finais criam um clímax e apresentam um resumo de tudo que foi escrito previamente. São a chave para a compreensão de todo o livro.

Nesses versículos conclusivos, Jesus, o Senhor ressurreto, de pé sobre uma das mon- tanhas da Galileia, talvez a mesma em que pre- gou o Sermão do Monte (Mt 5.1), apresenta aos discípulos uma mensagem de três pontos;

1) A autoridade de Jesus. Ele faz referência à própria autoridade com palavras que lembram Daniel 7.13,14, que ele mesmo havia pronun- ciado perante o Sinédrio e se encontram re- gistradas em Mateus 26,64, Agora nenhuma

2) O mandamento permanente de Jesus para realizar a missão. Depois de sua entronização, o Senhor crucificado e ressurreto dá a ordem para a missão. O tempo transcorrido entre sua ressurreição e a segunda vinda não será um mero intervalo vazio, mas um período durante o qual o desincumbir-se desse mandamento faz parte do processo de entronização. Filipenses 2.5-11 contém um marcante paralelo com a verdade aqui expressa.

O que o Senhor entronizado ordenou aos seus discípulos? Ele disse: “Ide, portanto...”. O autor escolheu o verbo grego poreuthentes, que significa “partir”, “deixar”, “cruzar fronteiras” — fronteiras sociológicas, raciais, culturais e geo- gráficas. Esse aspecto é mais importante para aquele que tem sobre si a tarefa de comunicar o evangelho. Afeta o trabalho feito na própria região, bem como em lugares longínquos. O missionário deve estar sempre pronto a cruzar fronteiras, estejam elas em seu ambiente ou em lugar distante, O verbo poreuomai nesse texto lembra à Igreja cristã primitiva o Jesus peripaté- tico que com seus discípulos estava sempre cru- zando fronteiras a fim de alcançar alguém. Jesus

3 Mission in the New Testament (London: SCM Press, 1965), p. 127-8.

sohannes Verkuyl também determina aos seus seguidores que fa- çam “discípulos de todas as nações”, Com base na palavra grega mathetes o autor cria um verbo. A forma verbal dessa palavra ocorre quatro vezes no Novo Testamento (Mt 13,52;27.57; At 14.21; e aqui em Mt 28.20). Tornar-se dis- aipulo de Jesus implica partilhar com ele de sua morte e ressurreição e unir-se a ele na marcha rumo à revelação final de seu Reino. Ele nos ordena que façamos discípulos, quer dizer, que levemos pessoas a se submeterem à sua auto- ridade libertadora e a se apresentarem como voluntárias para a marcha, já em andamento, rumo a uma nova ordem das coisas, a saber, seu Reino,

3) 4 promessa de Jesus. Ao acrescentar as pa- lavras finais da promessa — “Eis que estou con- vosco todos os dias até à consumação do século” —, Jesus lembra seus discípulos de que estará presente no meio deles de uma maneira dife-

— sd rente, À promessa continua válida para todas as épocas, Observe, de passagem, a frequência com que a palavra “todo” ocorre nesse texto: “toda a autoridade”, “todas as nações”, “todas as coisas”, “todos os dias”.

Cristo promete estar com sua Igreja todos os dias em que ela existir. Enquanto se desin- cumbe de sua chamada missionária, a Igreja deve sempre se perguntar: “Que dia é hoje”, pois não há dois dias iguais na história da Igre- ja. No entanto, por mais que os dias e épocas possam mudar enquanto a Igreja realiza sua mis- são nos seis continentes, um fato nunca muda: Jesus Cristo insiste que sua igreja cumpra seu chamado missionário enquanto ele a conduz ao destino final. Esse movimento missionário que emana de Jesus não cessará até o fim do mundo, Dessa forma, embora os métodos de realização da missão devam ser mudados continuamente, a tarefa em si permanece inalterada.

Perguntas para estudo

1. Por que Verkuyl discorda de vários autores que afirmam que o Antigo Testamento não faz absolutamente qualquer referência a um mandamento missionário?

2. Jonas é uma lição sobre a necessidade de uma conversão radical de tendências naturais e de uma reestruturação completa da própria vida para torná-la útil à missão. Quais eram as ten- dências naturais de Jonas, e qual reestruturação tinha de ocorrer em sua vida? Como essa mesma necessidade era tipificada na nação de Israel?

3. Como Verkuyl concilia a “disparidade” entre Mateus 10 e 28?$conteudo$, 8);
  end if;
end
$curso$;
