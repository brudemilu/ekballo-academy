-- 311_perspectivas_blincoe_cirurgico.sql
-- DESFAZ a remontagem da migration 310 e resolve o problema do Bruno de outro
-- jeito, porque a 310 consertava os quatro trechos apontados e PIORAVA o resto.
--
-- Medida: a 310 derrubou a proporção de palavras reconhecíveis do capítulo de
-- 84,7% para 80,0%. Eu tinha otimizado o sintoma visível e degradado o conjunto
-- — o mesmo erro da 309, que havia partido ao meio o quadro "Os benefícios de
-- crer".
--
-- O QUE ESTA MIGRATION FAZ: parte da versão MELHOR (a anterior à 310) e enxerta
-- nela apenas a p. 230, transcrita à mão a partir da imagem. É a página do
-- quadro sombreado, onde o fundo cinza degrada o OCR a ponto de "cristianismo"
-- virar "erictianicmo", e é de onde vinham os quatro trechos reclamados.
--
-- Resultado: 84,9% — acima da base de 84,7% — e os quatro trechos leem corridos.
--
-- LIÇÃO QUE FICA: remontagem ampla, mesmo com método melhor, precisa ser
-- comparada com o que já está publicado ANTES de subir. Foi essa comparação que
-- pegou o erro — e que também mostrou que reprocessar as outras 11 leituras
-- afetadas teria piorado TODAS elas, de 2 a 6 pontos. Nenhuma foi substituída.

begin;

update aulas set conteudo = 'Robert A. Blincoe

ROBERT A. BLINCOE é diretor da agência Frontiers, nos Estados Unidos, ministério voltado para o mundo islâmico. É autor de Ethnic Realities and the Church: Lessons from Kurdistan [Realidades étnicas e a Igreja: lições do Curdistão]. Trabalhou entre os curdos da Turquia e do norte do Iraque durante nove anos.

Artigo extraído de Meg Crossman (Org.), Worldwide Perspectives [Perspectivas mundiais] (Seattle: YWAM, 2003). Usado com permissão.

De Abraão a Jesus: 20 séculos. De Jesus aos dias de hoje: mais

20 séculos. Cristo está no ponto intermediário entre Abraão e nossos dias. Durante a primeira metade, Deus levou adiante, com afinco, seu propósito de redimir os povos do mundo. Nos outros 20 séculos, o povo de Deus levou a mensagem da Bíblia a muitos outros povos e lugares. À história da expansão do cristianismo é o registro de como sua glória chegou às nações.

Como isso aconteceu? Dentre as muitas razões para sua expansão ininterrupta, sua habilidade inata de ser transferível talvez seja uma das mais significativas. O cristianismo, mais que as outras religiões, foi capaz de crescer além de qualquer nacionalidade com a qual estivesse plena e até irremediavelmente identificada, vindo a se instalar em culturas distantes por meios imprevisíveis. Como disse Ralph Winter, “o cristianismo é a única religião sem nenhum nacionalismo em suas raízes”!

É da natureza do evangelho que cada cultura o ouça pela primeira vez de alguém que não seja de seu meio. Daniel T. Niles, do Sri Lanka, afirma: “É uma fé que necessariamente vem de fora”.? Alguém invadiu sua cultura ou, mais provavelmente, a cultura de seus antepassados, trazendo as boas novas do Senhor ressurreto. Meus antepassados, que moravam próximo a Hadrian''s Wall, no norte da Inglaterra, ouviram o evangelho muitos séculos atrás de missionários que vieram do outro lado do mar. Para alguns leitores, o evangelho chegou muito recentemente. À despeito de mensageifos frágeis e estruturas missionárias débeis, Deus fez com que a fé fosse passada adiante. Essa é a mais extraordinária de todas as histórias, e ela gloriosamente avança mais e mais em nosso tempo.

Quem diria, há 50 anos, que a Nigéria contaria hoje com mais bispos anglicanos que a Inglaterra? Quem, um século atrás, previu TUE milhões Res de chineses abraçariam a fé, À num movimento À que se espalhou de modo notavelmente semelhante ao movimento dos três primeiros séculos da era cristã? Quem poderia prenunciar, durante o domínio colonial, que tantos missionários iriam pregar

Ralph Winter e Steven C. Hawthorne (Org.), Perspectives on the World Christian Movement: À Reader (Pasadena: William Carey Library, 1981, 1992, 1999), p. 201, RE E A

2 Upon the Earth (New York: McGraw-Hill, 1962), pos,” por sua história acerca de um visitante do espaço que vem para estudar o cristianismo da terra, Vo, de Andrew Walls,

228 a outras culturas, partindo da América Latina, das Filipinas e da Índia? Talvez, alguns dos leitores deste artigo logo estejam levando as boas novas à um povo não alcançado, pois “viemos a receber graça e apostolado por amor doseu noime, para à obediência por fé, entre todos os gentios” (Rm 1,5). De 0 a 400: de Jerusalém às fronteiras do Império Romano Para compreender como o evangelho se inseriu em centenas de culturas e descobrir nossa parte em abençoar todas as famílias da terra, precisamos começar com o tempo em que os missionários eram judeus. Quando os missionários eram judeus Imaginemos um visitante! do espaço, longevo e estudioso, que pudesse visitar a Terra de poucos em poucos séculos a fim de realizar pesquisa de campo, Além disso, presumamos que seu intuito seja dedicar-se ao estudo do cristianismo:

Sua visita é a um grupo de cristãos primitivos em Jerusalém, próximo do ano 37 d.C.

Ele percebe que são todos judeus; de fato,

reúnem-se no templo, onde apenas judeus podem entrar. Oferecem animais em sacrificio, Guardam o sábado, sem trabalhar nesse dia. Circuncidam seus filhos, Seguem meticulosamente uma série de rituais e deleitam-se na leitura de antigos livros de legislação, O que os difere de outros judeus é simplesmente o fato de identificarem as figuras do Messias, do Filho do Homem e do Servo sofredor (todas mencionadas nos livros de legislação) com o Profeta-Mestre de há pouco, Jesus de Nazaré, quem creem ter inaugurado a era final.

Com essa percepção de fé e prática primitivas, nosso visitante espacial volta para

Sou devedor a Andrew Walls, a quem Ralph Winter se o capítulo inicial de The Missionary Movement in Christian

Como as águas cobrem o imar

casa e redige um artigo: “A prática da religião normal de Jesus em 37

Não devemos ignorar o aspecto judaico da fé eda prática cristã primitivas, Após o Pentecostes, Pedro, Tiago e João continuaram a adorar no templo e “milhares [de] judeus creram, e todos são zelosos da lei” (At 21.20). Os pais em Jerusalém contentavam-se em permanecer judeus em todos os sentidos e tinham a expectativa de que os judeus crentes em Jesus continuassem a guardar a Lei, Até mesmo insistiam nisso (At 21,21-24),

Contudo, os crentes em Jerusalém foram confrontados por outros judeus Paulo e Barnabé que partilhavam a fé com os gentios (ethne) sem requerer deles rituais que os tornassem judeus. Paulo e Barnabé estavam desjudaizando o evangelho. Quando questionado, Paulo defendia com veemência seus argumentos. O resultado foi um divisor de águas: a decisão tomada pelo Concílio de Jerusalém, em Atos 15. Na ocasião, os pais em Jerusalém decidiram, em oração, permitir que o movimento minoritário de Paulo prosseguisse: “Não devemos criar dificuldades para as etnias que estão se voltando para Deus” (At 15.18, paráfrase minha).

Essa era a abertura que Paulo e sua pequena equipe esperavam obter. De forma cautelosa, eles removeram a roupagem cultural da mensagem do evangelho e a revestiram com terminologias e conceitos não judaicos. Paulo escreveu o que Pedro não teria escrito: “Para os que estão sem lei, [fiz-me] como se estivera sem lei para ganhar os que estão sem lei

E eu faço isso por causa do evangelho” (1Co 9.21,23, arc).

Pedro, Tiago e João por certo nunca imaginaram que centenas de milhares de não judeus passariam por essa abertura, Os cristãos judeus: referiu como *o missiólogo mais proeminente de nossos tem-History (Maryknoll: Orbis, 1996), movimento cristão havia se difundido até os pontos mais remotos do Império Romano,

Rodney Stark questiona a verdadeira natureza da hostilidade, frequentemente mencionada, da Igreja primitiva para judeus. Ele alega muitos judeus da Diáspora foram atraídos cristianismo libertava dos árduos requerimentos da lei cerimonial judaica (a qual era difícil de manter fora de sua terra natal), ao mesmo tempo em que os que uma crentes e a “in the World in (Princeton: Princeton University, 1996), 49-72.

ra crentes mais tarde se tornariam uma minúscula minoria num mar “mediterrâneo” de convertidos, de fala latina e grega, incircuncisos e comedores de carne de porco, os quais levariam o evangelho nos pontos mais remotos e aos povos mais diversos do Império Romano, O que atralu os gentios? O que atraiu aquelas centenas de milhares de gentios para o cristianismo? Às vezes, o óbvio precisa ser dito: 0 atrativo era o próprio Jesus, Ele abençoou e capacitou homens e mulheres a ter vida significativa neste mundo e uma firme esperança no porvir, Jesus era a presença viva em todos os ajuntamentos cristãos. Nenhuma ameaça impediria seu povo de proclamar sua mensagem e de afirmar que Jesus era o Senhor, e não César (Senhor em grego é kyrios, termo que o imperador reservava apenas para si).

Além disso, o mundo no qual as virtudes cristãs eram demonstradas era deveras brutal: um mundo onde o filho do imperador comemorava seu aniversário assistindo aos animais dilacerarem pessoas na arena; onde a vida conjugal via de regra fracassava; onde a promiscuidade, as prostitutas cultuais e a prática homossexual eram comuns; onde a população decresceu nos primeiros três séculos da era cristã (simplesmente por ser esse mundo um lugar terrível demais para criar filhos); onde muitas filhas tecém-nascidas eram abandonadas à morte, a fim de que os homens excedessem as mulheres em número; onde povos conquistados eram escravizados para possibilitar o estilo de vida da minoria elitizada. Até mesmo suas práticas religiosas eram detestáveis: as divindades romanas não promoviam a moralidade entre seus segui-

No Concílio de Arles, convocado por Constantino em com que “mantinha ligados às raízes bíblicas. Stark crê havia comunidade cristã ainda no século V. Para saber mais, v. o ded”, de seu livro The Rise of Christianity: How the Obscure,

Western a Few Centuries

dores, havendo, em vez disso, ritos ocultistas indecentes e cerimônias dispendiosas, Século IV; o evangelho prevalece Às perseguições cessaram e as dificuldades foram amenizadas quando o imperador Constantino publicou o Édito de tolerância, no ano 313. Quer tivesse se convertido, quer não, Constantino astuciosamente consolidou seu império em torno da crença mais poderosa de seu tempo, À proteção proporcionada pelo imperador aumentou em muito o discipulado cristão à população em geral, bem como a influência da Igreja sobre assuntos de interesse público (por exemplo, Constantino aboliu os combates entre gladiadores nas arenas). Infelizmente, em consequência de o cristianismo haver se tornado a religião estatal, milhares de pagãos nominais passaram a ser membros nominais da Igreja,

O pesquisador extraterrestre faz uma segunda visita a Terra, mas não a Jerusalém (o exército romano reduziu a cidade a ruínas ainda no tempo em que os primeiros apóstolos estavam vivos). Ão indagar do paradeiro dos crentes em Jesus, disseram ao visitante espacial que fosse à nova capital do império: Constantinopla.

Sua visita seguinte a Terra dá-se no ano 325.

Ele participa de um grande encontro de líderes eclesiásticos talvez o Concílio de

Niceia. Os participantes provêm de todo o mundo mediterrâneo e além, mas é pouco provável que algum deles seja judeu, Aliás, de modo geral, mostram-se um tanto hostis com os judeus. Ficam horrorizados com a ideia de sacrifício de animais; quando falam de apresentar sacrifícios, referem-se ao pão 314, três bispos ingleses compareceram, o que indica como o ao porque este os aproximação significativa entre de origem judaica capítulo “The Mission to the Jews: Why It Probably Succee-Marginal Jesus Movement Became the Dominant Religious Forte p.

o vinho, num ritual que segue o costume das refeições domésticas que nosso observador vira em Jerusalém. Os líderes eclesiásticos não devem se casar, e vários deles consideram o casamento algo inferior e tratam um pai que circuncide o filho como alguém que traiu a fé. Consideram o sétimo dia como dia normal de trabalho e mantêm certas práticas religiosas especiais no primeiro dia da semana, mas não necessariamente se abstêm do trabalho e de outras atividades. Usam traduções dos livros de legislação que os cristãos em Jerusalém utilizavam. Dão igual valor a outro conjunto de escritos, que nem sequer haviam sido compostos quando os cristãos em Jerusalém se reuniam.

7 Andrew Walls, op. cit., p. 3-4.

O visitante espacial fica maravilhado ao ver que, embora a fé continue centralizada em Jesus, sua prática mudou drasticamente e se expandiu significativamente. Os líderes eclesiásticos desjudaizaram a mensagem e adaptaram o evangelho ao mundo romano. Eles tiraram proveito das estradas imperiais e da segurança dos

[quadro] Os benefícios de crer

O mundo romano foi atraído para a fé e para a comunidade cristã pelo seu monoteísmo, sua moralidade e sua historicidade. Além disso, havia benefícios reais. Rodney Stark, sociólogo da Universidade de Washington que estuda os movimentos religiosos, documentou-os em The Rise of Christianity [A ascensão do cristianismo]. Dentre suas conclusões:

• O ensino da Igreja proibia o aborto, uma das principais causas de infertilidade e morte entre mulheres romanas.

• Infanticídio, particularmente de meninas, era expressamente proibido.

• Em casos de pragas e epidemias, as quais dizimaram milhares nos três primeiros séculos da era cristã, os cristãos davam assistência aos doentes, em vez de abandonar a cidade, que era a prática comum.

• No mundo romano, em que as mulheres normalmente não tinham quaisquer direitos e pouco respeito da sociedade, as mulheres cristãs ocupavam cargos de honra e de autoridade.

• Em cidades repletas de viúvas e órfãos, o cristianismo proporcionou uma nova e mais ampla noção de família.

• O cristianismo proporcionou uma mentalidade com relação à harmonia étnica e a revitalização urbana que possibilitava unir e renovar diversas populações urbanas.

• A expectativa de fidelidade conjugal aumentou significativamente a fertilidade e reduziu os índices de mortalidade entre os cristãos.

• Os cristãos apresentaram uma nova concepção de humanidade a um mundo exausto da crueldade voraz do paganismo.

Em suma, os cristãos tinham uma vida melhor que a de seus concidadãos. A amabilidade e cuidado cristãos foram visivelmente estendidos à comunidade em geral, de forma que, de década em década, a fé cristã crescia, a despeito de ameaças, insultos, acusações falsas e perseguição direta.

Gerald H. Anderson, Biographical Dictionary of Christian Missions (New York: Simon Schuster MacMillan, 1998),

Robert A. Blincoe viajantes proporcionada pela pax romana, bem como o amplo uso de dois idiomas latim e grego para levar o evangelho às principais cidades do Império Romano entre Espanha e Babilônia (ver mapa). No entanto, apesar deo cristianismo ter sido declarado religião oficial do Império Romano, não havia qualquer plano desenvolvido com o propósito de evangelizar nações além da esfera romana. Havia a necessidade de missionários que enxergassem longe,

CESSA a de igreja para os PETS Ac saga a ão romano: calamidade ianitdad p para a missão de Cristo é A identificação Se do Império Romano com o cristianismo pai era tão EE intensa que, no século IV, ambos os termos o! “romano” À e ria “cristão” eram usados de modo intercambiável.

As identidades o estavam fundidas. Em tal ambiente de opiniões P não haveria argumentação que os convencesse à levar ae” báipáros á A ãos. N pógios pé ma proeminente autoridade dos dias de hoje, “ao longo de toda a spoça da Imperio-Romaão, não se tem conhecimento de um exemplo sequer de um homem que fosse ordenado bispo com a tarefa específica de cruzar a fronteira e se estabelecer numa região pagã a fim de converter os bárbaros que ali residissem”.*

O cristianismo que se espalhou por todo o mundo romano o cristianismo do Império Romano limitou-se às fronteiras imperiais, Para ir mais longe, a mensagem do evangelho teria de ser desromanizada, A fé só seria capaz de abençoar outras nações quando se libertasse de sua identidade cultural romana,

Contudo, exatamente como os primeiros seguidores judeus, os líderes da Igreja do cristianismo romano acreditavam que o mundo inteiro

8 Richard Fletcher, The Barbarian Conversion (New York: p.33.

231 deveria se adaptar à sua prática eclesiástica. No norte da África, Agostinho, bispo de Hipona (na atual Tunísia), estava convencido de que seus companheiros berberes tinham de se tornar culturalmente romanizados antes de abracar a fé em Jesus. Os berberes, em sua maioria, resistiam à conquista cultural do papa, assim como seus ancestrais cartagineses resistiram a César, Frederick Norris escreve: “Exatamente quando a contextualização do evangelho para os berberes carecia de uma orientação pastoral, a cultura latina de Agostinho impediu-o de enxergar as possibilidades”. Uma vez que o alcance da Igreja PAS se limitou ME às fronteiras imperiais ja de Roma, sua parte no mandamento bíblico de abençoar as nações E esteve muito gude próximo da inércia. ar Teria Fogo sido essa

Aceitação oficial Quando Constantino fez do cristianis- e mo à religião oficial do Império Ro- Í mano, Igreja e Estado apoiavam-se mutuamente. Os impostos romanos subsidiavam a construção de catedrais imensas. Líderes eclesiásticos tornavam-se influentes na política, chegando a absorver a terminologia do império. A província romana, a diocese, passouaser governada porum vig dio Gistãd (“vigário” era o termo imperial para governador). O bispo em Roma assumiu parasi o título de imperador: pontifius maximus, “o grande construtor de pontes”. O feriado romano das Calendas, observado todo 1.º de janeiro, tornou-se o início do calendário da Igreja. Assim, a igreja É de Roma tomou a forma do governo que já era familiar àquela sociedade.

1º Apud Ruth Tucker, até aos confins da terra, 2. ed. (São Paulo: Vida Nova, 1986), p. 38. invasora gótica não matou os sacerdotes, nem violentou mulheres, destruiu igrejas.

Mo uma das causas do declínio e queda de Roma? De fato, Agostinho estava em seu leito de morte, no ano 430, enquanto os “bárbaros” faziam o cerco a Hipona.

Será que a história teria sido diferente sea Igreja tivesse pregado o evangelho da paz aos que estavam além de suas fronteiras? À luz se apagava na parte latina do Império Romano. No entanto, a irreprimível mensagem da Bíblia lançava raízes e verdejava em lugares que os cristãos do Império Romano não imaginavam que ela pudesse crescer. Alcançando os godos Tribos germânicas denominadas godos começaram a incursionar no Império Romano no século III. Eles capturaram muitos romanos, entre eles o jovem Ulfilas e sua família, e os levaram da Capadócia (atual Turquia Central) para o norte do rio Danúbio. Ulfilas foi criado entre eles e, à semelhança de Paulo, tornouse “bicultural”. Ele provavelmente encontrou alguns cristãos entre os godos, porque depois de estudar em Constantinopla foi consagrado bispo e retornou ao norte para continuar a evangelização dos godos. À forma amenizada de arianismo que ele ensinava pode ter tornado sua mensagem mais agradável às tribos góticas. Uma vez que os arianos tinham reservas quanto à teologia romana, pode ter sido um fator positivo na conquista dos godos, que temiam Roma,

Ulfilas pregava destemidamente no terrià tório que é a atual Romênia, levando muitos à conversão em 40 anos de ministério, Sua maior obra, motivada pelo amor, foi dar aos godos um alfabeto próprio e traduzir grande parte das Escrituras para eles, a primeira grande obra em qualquer língua germânica, Adaptando sua mensagem ao estilo de vida deles, transitava com eles em suas carroças, de forma que se dizia: “Os que antes usavam carroças para morar, agora se utilizam delas como igreja”,

1 Op. cit.., p. 202. Winter menciona que, ao contrário das

À

ComOAS Aguas cobrem O mag

Alguns godos desconfiavam que Ulfilas fosse um agente do Império Romano e resistiam à sua mensagem. No ano 348, após sete anos de pregação, Ulfilas foi obrigado a mudar-se para o sul do Danúbio com seus convertidos, em buscada proteção das legiões romanas. Ele continuou a pregar até sua morte, em 382, treinando muitos obreiros cristãos dentre os chamados “bárbaros”, No ano 410, menos de trinta anos após sua morte, as tribos góticas, enxergando cada vez mais as bênçãos contidas nas cidades romanas, tomaram o império.

Ralph Winter cita o fato de que o contato que tiveram com o cristianismo fez considerável diferença no modo em que conduziam suas invasões:

A única razão pela qual a própria cidade de

Roma não foi fisicamente devastada pelas

invasões foi que esses bárbaros godos eram, guardadas as devidas proporções, respeitadores da vida e da propriedade, especialmente no que dizia respeito às igrejas! O esforço informal de missionários pioneiros (pelo qual os cristãos latino-romanos podiam reclamar pouco crédito) trouxe grandes benefícios para os cidadãos de Roma, ao apresentar a esses povos pelo menos uma fé cristã superficial. Até mesmo alguns romanos seculares mencionaram a sorte que tiveram, pois os invasores mantinham como prioridade certos padrões da moralidade cristã.!!

Num curto espaço de tempo, os conquistadores foram conquistados pelo poder do evangelho, à medida que os bárbaros invasores abraçavam a fé dos que haviam sofrido a invasão, De 400 a 800 Alcançando os Bárbaros A influência da igreja institucional começou a minguar no século V, Ondas sucessivas de povos crueis oriundos da Ásia Central empurraram práticas cruéis de anglos, saxões e frísios na Bretanha, a força

[figura] /figuras/perspectivas/expansao-do-cristianismo.png | Expansão do cristianismo — regiões cristianizadas até 325 d.C. e até 600 d.C.

Mark A. Noll, Turning Points: Decisive Moments in the History of Christianity (Grand Rapids: Baker, 1997), p. 84.

bou por acelerar seu declínio. A luz da fée do aprendizado foi quase perdida, exceto entreos monastérios. Os protestantes estão começando a dar valor à contribuição feita por Bento (ou Benedito)e outros que o seguiram: O surgimento do monasticismo foi, depois da comissão de Cristo aos seus discípulos, o evento institucional mais importante (e em vários sentidos o mais benéfico) na história do cristianismo. Por mais de um milênio, nos séculos desde o reinado de Constantino até a Reforma protestante, quase tudo na Igreja que se aproximava dos ideais mais elevados, nobres e verdadeiros do evangelho era realizado por aqueles que escolheram o caminho “do monastério ou por aqueles cuja vida cristã se inspirava no monges.!2 À maior parte do que conhecemos acerca -do-mundo antigo, tanto em literatura quanto em tecnologia (tratamento de couro, tinturaria, alvenaria, tecelagem, construção de pontes), te“tia se perdido não fosse o esforço acadêmico de partida da maior parte da atividade missionária ao longo da Idade das Trevas. Os celtas iluminam a Idade das Trevas Contudo, apesar das trevas, Deus operava ativamente. Num local improvável da Europa não romana, outra forma do cristianismo assumiu e levou adiante a tarefa através do continente europeu a fim de alcançar as tribos germânicas. Esse local era a Irlanda, com seus habitantes, os celtas. Esse povo era tão embrutecido que tanto Júlio César quanto Jerônimo mantinham distância deles, por serem caçadores de cabeças e canibais.

Na terceira visita à Terra, o viajante interplanetário de Andrew Walls encontra Roma em ruínas. No entanto, depara com uma fé vibrante na Irlanda, longe das fronteiras que antes delimitavam tanto o Império Romano quanto a fé romana:

Certos monges estão reunidos em uma orla

rochosa. Alguns estão de pé, imóveis, em oração, com os braços estendidos em forma de cruz. Outros estão partindo num pequeno

234 Como as águas cobrem o mar barco, sob condições climáticas arriscadas, le- (não na Irlanda), o pai de Patrício era diácono, é vando consigo uma caixa de belos manuscri- seu avô, sacerdote. Quando era adolescente, foi tos e pouco mais, a fim de se dividirem pelas sequestrado por salteadores celtas, que o vendeilhas do estuário de Clyde e convidar seus ram como escravo na Irlanda. Mais tarde, Paatônitos habitantes a abandonar a adoração trício deu graças por esse infortúnio, pois foi o às divindades da natureza e buscar alegria meio que Deus usou para levá-lo à fé em Cristo. no reino celestial vindouro.” Após anos de escravidão, Patrício recebeu instrução divina por meio de sonho, fugiu, voltou A igreja celta reevangelizou, com êxito, para casa e estudou para o sacerdócio. Contugrandes partes da Inglaterra e da Europa con- do, uma visão subsequente instruiu-o a voltar tinental. Duas gerações após terem sido apre- à Irlanda. Mesmo sabendo que sua vida corria sentados ao cristianismo, os celtas ensinavam a perigo, ele optou por obedecer. O fruto de seu si mesmos grego, latim e hebraico. Eles se de- ministério: centenas de milhares foram batizadicaram, por amor, à tarefa de traduzir e copiar dos e centenas de igrejas foram fundadas. à mão a Bíblia e comentários clássicos. De fato, Ele inspirou uma geração de líderes, como mais da metade dos comentários datados de 650 Columba e Columbano, que edificaram cena 850 foram escritos por irlandeses. tros de treinamento de missionários, como Patrício foi o principal missionário usado por Tona e Lindisfarne, que enviaram os peregrini Deus para converter os celtas dos rituais druídi- exilados peregrinos, que fizeram o voto de cos pagãos ao Deus vivo. Nascido na Bretanha levar o evangelho aos confins da terra. 3 Andrew Walls, op. cit., p. 4.

Quem eram os celtas? Um possível e intrigante caso de transferência natural do evangelho dentro de uma unidade social é o dos celtas. Estudos históricos esclarecem que a província da Galácia, na Ásia Menor, recebeu esse nome por ser povoada pelos galatoi da Europa Ocidental (os quais, até o século IV, ainda falavam seu idioma original, o celta, além do grego falado naquela região do Império Romano). Quer os gálatas conhecidos por Paulo fossem apenas comerciantes judeus que moravam na província da Galácia, quer fossem ga/atoi celtas que, desde o início, foram atraídos à sinagoga por serem “tementes a Deus”, percebemos que, de qualquer forma, a carta de Paulo aos gálatas é particularmente cautelosa quanto ao intuito de alguém impor aos seus leitores costumes da cultura judaica e confundir tais costumes com a fé bíblica essencial que Paulo pregava tanto a judeus quanto a gregos (Rm 1.16).

Uma questão de grande interesse missionário é o fato de que a pregação de Paulo alcançou uma veia cultural dos celtas, que pode logo ter incluído amigos, parentes e contatos comerciais, alcançando grande distância no Ocidente. Assim, os esforços de Paulo na Galácia podem nos dar uma pista da surpreendente entrada do evangelho em tão pouco tempo nas regiões de origem dos celtas na Europa, delineadas por um cinturão que atravessa o sul da Europa e se estende até a Galícia, na Espanha, e a Britânia, na França, subindo em direção às regiões oeste e norte das ilhas Britânicas.

e op. p.

Os missionários celtas tinham por característica a espontaneidade, ausência de tradicionalismo e individualismo robusto. Eles foram a lugares a que ninguém mais iria, sem credenciais nem apoio financeiro. Confiantes e dependentes de Deus, realizaram muito mais que suas estatísticas poderiam respaldar. Eles mantinham um monasticismo fervorosamente missionário. Assim, o monastério não era um lugar de reclusão do mundo, mas um local de preparação para as missões.”

Há vestígios de monastérios celtas na Bélgica, nos Alpes, na Morávia e até em Kiev. Mulheres peregrini também foram enviadas, e igrejas dedicadas à sua patrona, Brígida, ainda permanecem de pé na França, na Alemanha, na Áustria e na Itália (ver mapa). Até mesmo o historiador secular Thomas Cahill enaltece o trabalho dela:

Aonde quer que fossem, os irlandeses levavam consigo seus livros muitos ausentes da Europa havia séculos amarrados à cintura como símbolos de triunfo, do mesmo modo em que os heróis irlandeses de outrora amarravam à cintura a cabeça de seus inimigos. Nas baías e vales de seu exílio, eles restabeleceram a dedicação à literatura e sopraram nova vida à exausta cultura literária da Europa. Dessa forma, os irlandeses preservaram a civilização."

Patrício e os irlandeses desromanizaram o evangelho, adaptando-o a forma e práticasaos quais os celtas estavam mais familiarizados, Os sacerdotes cristãos celtas (que podiam se casar) continuaram a usar os mantos brancos dos druidas celtas. À diocese e o bispo foram substituídos pelo monastério e pelo abade. A liderança das igrejas eram passadas de um parente mais velho para outro mais jovem,

4 Pierson, Paul, The Celtic Missionary Moviment, in: A. Mission (Grand Rapids: Baker, 2000), p. 170.

Ralph Winter Steven C. Hawthorne (Org.), cit., “é Encyclopedia Brittanica (Chicago, 1991), p. 743.

conforme o padrão de regras tribais celtas. Winter escreve:

Curiosamente, a expressão “Terceiro Mundo” vem daqueles dias, quando o grego e o latim eram os dois primeiros mundos, e os bárbaros, ao norte, eram o Terceiro Mundo.

Assim, a Europa dos bárbaros foi ganha mais

pelo testemunho e trabalho de “Missionários do Terceiro Mundo” os celtas e anglosaxões convertidos pelos celtas do que pelos esforços de missionários oriundos da

Itália ou da Gália.!é Século VIII: o evangelho por toda a Europa Ocidental A fé cristã acelerou sua expansão no século VIII. Bonifácio (Winfried), o maior missionário da Inglaterra, pregou durante três décadas aos saxões (na Alemanha) e aos frísios, na atual Holanda. Ele conduziu muita gente à conversão ao cortar, dramaticamente, o famoso Carvalho de Thor. Contudo, em razão da suspeita de que fosse um agente de Carlos Magno, inimigo declarado dos saxões, Bonifácio foi martirizado em 754.

Carlos Magno, rei dos franco-germanos, foi o monarca mais poderoso do Sacro Império Romano em 400 anos. Ele restabeleceu a segurança ao longo das estradas, consolidou seu domínio sobre toda a Europa Ocidental e cristianizou as tribos germânicas. Assegurada a paz, deu-se um renascimento cultural por todo o império de Carlos Magno:

Houve esforços para elevar o nível da observância religiosa, da moralidade e do processo judicial por todo o império O movimento espiritual e literário chamado “renascimento carolíngio” dividia-se em vários centros, especialmente nos monastérios do Scott Moreau (Org.), The Evangelical Dictionary of World 204.

[figura] /figuras/perspectivas/missoes-celtas.png | Missões celtas — rotas de Iona, Lindisfarne, Armagh e Kells rumo à Britânia, Gália e Baviária

Contudo, mais uma vez, um povo além do alcance missionário abalou o mundo cristão, e o ressurgimento da cultura foi bruscamente interrompido. De 800 a 1200: alcançando os vikings Suponha que nosso viajante intergalático faça outra visita a Terra, agora no início do século X. Onde estão os famosos monastérios irlandeses? Estão em ruínas, porque um povo do norte, poucas vezes visitados pelos peregrini,os atacou a fim de despojá-los de seus tesouros. Saqueadores cruéis, eles aterrorizavam o povo soltando cães ferozes antes de atacar e causavam estragos por todo lado, Os navios vikings, de calado raso, conseguiam navegar rio acima, chegando a Londres, York, Rouen e Hamburgo. “Deus nos proteja dos nórdicos e de seus mundo cristão no ano 793, quando Lindisfarne, o centro de treinamento missionário insular celta, foi devastado. Aqueles nórdicos, que orgulhosamente se intitulavam frenéticos, vinham em ondas impiedosas, atacando repetidas vezes Iona, Lindisfarne e dezenas de outros monastérios. Por haverem se tornado centros de riqueza, os monastérios eram os alvos prediletos.

Mais uma vez, o povo de Deus deixou de partilhar as bênçãos que acompanham a verdade de Deus, e outros povos vieram arrancar deles as bênçãos. Ao contrário dos bárbaros, os vikings não tinham qualquer contato com o evangelho. Eram um povo sanguinário, e seus ataques eram cruéis.

Então, numa dessas grandes guinadas da história, o poder do evangelho da salvação começou a transformar essa cultura bélica. Alguns prisioneiros levados à força para o Norte

Kenneth Scott Latourette, 4 History of Christianity (New York: Harper and Row, s.d.), 1, 558. 3 Originariamente, tribos nômades da Síria. O termo veio a denotar qualquer muçulmano, especialmente

Robert A. Blincoe na sacerdotes (que sabiam ler e escrever) e mulheres (futuras esposas, escravas e concubinas)

levaram consigo a fé cristã. Pouco a pouco, o evangelho apoderou-se de seus captores. Talvea por não representarem nenhuma ameaça política, o testemunho cristão foi absorvido com facilidade pela cultura nórdica.

No decorrer dos séculos X, XL e XIl,a fé cristã avançou em terras escandinavas (Dinamarca, Noruega e Suécia). O estudo de corpos preservados, exumados de pântanos da Dinamarca, comprova que os escandinavos praticanum rituais de sacrifício humano por uns mil unos. Entretanto, “com o advento do cristianismo, cessaram os sacrifícios nas regiões pantanosas”.!* De inúmeras maneiras, a qualidade de vida melhorou sob a influência cristã. O rei Olavo da Noruega proibiu o “abandono de recém-nascidos” e ordenou que doravante, toda primavera, na abertura da assembleia nacional, não mais se açoitaria um escravo, mas se libertaria um.!

À fé expandiu-se em várias direções. Os monges Cirilo e Metódio deram aos eslavos uma língua escrita (a base do alfabeto cirílico), e sua tradução da Bíblia tornou-se a inspiração para a atividade literária entre os eslavos. Vladimir, governante de Kiev, assumiua fédos Ortodoxos, dando início à Igreja Ortodoxa Russa. Os magiares invadiram a Hungria, mataram a população cristã e queimaram as igrejas. No entanto, eles também se converteram ao cristianismo, no século X: “Europa e cristianismo se tornaram sinônimos”.?

Na maioria dos casos, a conversão era comunitária: chefes e reis conduziam o povo ao batismo e à fé, numa espécie de conversão em massa. De fato, movimentos que englobavam toda a comunidade, por influência de seus governantes, era a norma: “Na Europa Ocidental da época,

Kenneth Scott Latourette, ibidem, p. 401.

Kenneth Scott Latourette, ibidem, p. 351. 2 Kenneth Scott Latourette, ibidem, p. 289.

2 Ralph Winter e Steven C, Hawthorne (Org.), opx cit. “opunham às Cruzadas.

237 a fé era adotada como a religião da comunidade, geralmente por ordem do príncipe ou pelo menos com sua enérgica assistência”?!

Esse método secular, imposto de cima para baixo, expandiu grandemente o cristianismo entre 900 e 1386, ano em que a Lituânia se tornou a última parte da Europa a aceitar o cristianismo. A ascensão do islamismo Uma terceira religião monoteísta surgiu no século VII. Influenciado por judeus e cristãos, Maomé proclamou a adoração a Alá como o único Deus em toda a Arábia. Após sua morte, O islamismo espalhou-se pelo norte da África, alcançando a Espanha e metade dos países mediterrâncos. Os cristãos fugiram para a Sicília, Espanha, Grécia, Gália e até mesmo para a Alemanha, Esse êxodo foi um golpe fatal ao cristianismo do norte da África. Em outros lugares, cristãos nominais converteram-se ao islamismo, em parte com o propósito de evitar a sobrecarga de impostos, em parte por causa das vitórias militares estarrecedoras, “pois eles surgiram para demonstrar que o islamismo desfrutava o favor especial de Deus”.2

Os governantes muçulmanos logo impuseram restrições maiores às igrejas cristãs. Tornou-se quase impossível a conversão ao cristianismo, Em razão disso, as igrejas sob o domínio muçulmano foram perpetuadas pelos laços familiares. As igrejas temiam que seu estilo de vida desaparecesse por completo se eles de alguma forma desagradassem o povo ou promovessem alguma inovação. Com isso, as igrejas da Arábia e da Pérsia tornaram-se extremamente conservadoras. De 1200 a 1600: alcançando os sarracenos? Nosso viajante espacial retorna e percebe uma grande quantidade de povos em trânsito. As v. p.

é p. 20.

[figura] /figuras/perspectivas/cinco-periodos-historia-missionaria.png | Cinco períodos da história missionária: Romanos, Bárbaros, Vikings, Sarracenos e Confins da terra, de 400 a 2000

na suposição de estarem fazendo a vontade de Cristo, os soldados marcham fervorosamente para “salvar a Terra Santa dos infiéis”.

A História demonstra que essa empreitada.

fechou corações e mentes por todo o Oriente Médio para a palavra “cristão”, até o dia de hoje. “Nunca antes um grupo de nações, em nome de Cristo, lançara uma campanha tão

[figura] /figuras/perspectivas/invasoes-vikings.png | Invasões vikings — da Escandinávia à Irlanda, França, Emirado de Córdoba e Rússia de Kiev

dai ia nie como fez a Europa na trágica enxurrada das De 1600 a 2000: a era do silêncio e a era do Cruzadas" grande avanço missionário

Ambição, ganância e fanatismo impeliram O conhecimento que a maioria dos cristãos esses homens a derramar sangue impicdosa- ocidentais tem de como a glória de Deus chemente, crendo que assim honravam a Cristo. gou às nações inicia com Martinho Lutero, O Os povos muçulmanos pagaram um preço que poucos entendem é o papel que as quescaríssimo nessas guerras mal orientadas, mas ões culturais tiveram na Reforma protestante, não foram as únicas vítimas. Judeus de toda a Nessa época, ocorria uma grande quantidade Europa e cristãos ortodoxos no Oriente bizan- de reformas espirituais na tradição católica: o tino também foram pilhados diante do fascínio retorno às Escrituras, um novo anseio pela vida por despojos e território. Winter ressalta que, de santidade e pela pregação do evangelho. Por“ironicamente, a missão das Cruzadas não seria que, então, os Estados do norte da Europa se tão espantosamente negativa se não envolvesse separaram? Muito do fermento subjacente era uma quantidade tão elevada de compromisso resquício das diferenças entre a cultura latina cristão desprezível. A grande lição das Cruza- ca cultura teutônica, ou germânica, das é que boa vontade ou mesmo a obediência A revolta do Norte foi motivada, em parte, sacrifical a Deus não substituem a nítida com- pelo desejo de vivenciar uma adoração uma preensão de sua vontade”. teologia que refletissem costumes culturais

Ralph Winter e Steven C. Hawthorne (Org.), op. cit., p. 20.

Francisco e a desmilitarização do evangelho

Membros do movimento monástico deram forma a uma mentalidade alternativa à das

Cruzadas. Francisco de Assis (m. 1226) fundou a Ordem dos Frades com o intuito de trazer à luz um “novo tipo de cavaleiro”. O voto era simples: “Seguir os ensinos de nosso

Senhor Jesus Cristo e andar em seus passos”. Homens e mulheres seguiram sua liderança, e, por ocasião da morte de Francisco, a ordem contava com o espantoso número de 5 mil membros.

Em 1219, Francisco atravessou terra de ninguém, separando os exércitos europeus É “das Cruzadas dos exércitos muçulmanos do Egito. Ele implorou ao sultão que perdoasse o erro de seus concidadãos europeus com sua versão deturpada da missão de Cristo na É terra. Talvez Francisco tenha sido atendido, talvez não, quando pediu para permanecer É ali duas semanas e pregar ao sultão a mensagem de Jesus Cristo, Sabemos que, quando É partiu, estava perplexo com o fracasso de sua missão e só pôde explicá-lo como um “ainda É não” nos planos de Deus. É Domingos de Gusmão, que fundou a Ordem dos Pregadores, desejava levar o cvange- E “lho ao inalcançado povo tatar, no Oriente. E

Raimundo Lúlio, franciscano espanhol, também desejava ver os muçulmanos alcança-

É E dos por meio do amor, e não da espada. Ele ensinava, escrevia e pregava com esse intento É e acabou morrendo como mártir no norte da África. A contribuição desses homens foi E o “advogar uma abordagem “desmilitarizada” aos muçulmanos. Ao contrário das Cruzadas, É “À eles não representavam uma potência secular de esnada em minha ido Et

[A 240 familiares às tradições germânicas, Lutero, por exemplo, escrevia no vernáculo alemão e traduziu as Escrituras para o idioma do homem comum. Ele des/atinizou o evangelho. Povos que falavam as “línguas latinas” ou eram influenciadas pela cultura latina, via de regra permaneceram no âmbito católico, com sua liturgia e prática latinas. Os povos germânicos estavam mais propensos a se identificar com a mensagem da Reforma.

Mas onde estavam as missões protestantes? Lutero e Calvino criam nas reivindicações universais de Cristo sobre a humanidade. Por que, então, a Reforma protestante não levou a cabo um grande avanço missionário? Por 350 anos, essa questão embaraçosa permaneceu sem solução, enquanto missionários católicos seguiam seus exploradores até os confins da terra: Matteo Ricci, à China; Francisco Xavier, à Índia, China e Japão; Junípero Serra e Bartolomeu de las Casas, ao Novo Mundo; Alexandre de Rhodes, ao Vietnã. (Para um debate mais amplo sobre estratégia missionária católica, veja o capítulo “A história da estratégia missionária”, de R.

Y iii Como as águas cobrem o mar

Quando confiscou e fechou os monastérios, Lutero recolheu as velas que o Espírito Santo vinha usando para enviar missionários havia mil anos. Sem uma estrutura organizada, os protestantes só podiam ocupar terreno já conquistado. Eles não estavam preparados para enviar traba-Ihadores a pregar o evangelho nos lugares em que Cristo ainda não era conhecido (Rm 15.20). Os líderes luteranos em Wittenberg chegaram a condenar um leigo, Justiniano Welz, por propor a criação de uma sociedade com o intuito de enviar missionários além-mar. A exceção dos morávios Uma luminosa exceção alivia o histórico dos protestantes, que de resto é sombrio. O conde Nicolau Zinzendorf permitiu que um grupo de refugiados religiosos da Morávia se estabelecesseem sua propriedade, no leste da Alemanha, em 1722. Após um singular derramamento do Espírito Santo, em 1727, teve início um movimento de oração que se estendeu, noite e dia, por mais de cem anos. Na coroação do rei da Dinamarca, Zinzendorf conheceu dois nativos

[figura] /figuras/perspectivas/rota-primeiras-cruzadas.png | Rota das primeiras Cruzadas — a Cruzada de Lisboa (1147), a Primeira (1096-1099), a Segunda (1147-1149) e a Terceira (1189-1191)

Ocidentais. Ele ficou tão impressionado com ele propôs a seguinte questão: “Se o evangelho seu clamor por missionários que retornou para é digno de toda aceitação, porque não é pregado casa com um forte senso de urgência. Um ano a todos?”, Sua proposta supriu o elemento que depois, seus dois primeiros missionários foram faltava para iniciar o avanço missionário dos enviados às ilhas Virgens. protestantes: organizações que levassem adiante

O método morávio consistia de enviar co- a empreitada. munidades inteiras, compostas por trabalhado- À Investigação de Carey proporcionou aos res hábeis, a fim de estabelecer residência entre protestantes a motivação e os meios para impleos não cristãos e ensiná-los. Seus missionários mentar a evangelização de não cristãos mundo eram leigos, treinados em evangelismo, mas sem afora. O livreto foi o estopim da expansão misformação teológica. Eles partiam na condição sionária moderna. de trabalhadores, sem sustento, e exerciam cada um sua profissão entre o povo que desejavam Século XX: fim da era colonial alcançar. Em apenas duas décadas, o minúsculo Duas guerras mundiais, nas quais cristãos masgrupo enviou mais missionários que todos os sacraram milhões de companheiros cristãos, protestantes em duzentos anos. despertaram muitas nações à ação. Elas batalharam para se tornar independentes de países William Carey e os métodos das que haviam sido seus dominadores coloniais. No missões modernas que Winter denomina “Os incríveis 25 anos” Os morávios inspiraram um pregador leigo ba- (1945-1969), as nações ocidentais perderam o tista da Inglaterra a propor um método radical domínio sobre todo o mundo não ocidental, de implementar a obediência à Grande Comis- exceto 5% desse território.” Na segunda metasão de Cristo. Seu nome era William Carey, e de do século XX, dezenas de países declararam

26 Winter, Ibid.

Normalmente, são identificadas oito Cruzadas:

À terceira, conduzida por Filipe Augusto e Ricardo Coração de Leão, de 1188 a

1192.

À quarta, durante a qual Constantinopla foi tomada, em 1204.

À quinta, que incluiu a conquista de Damietta, em 1217.

À sexta, da qual Frederico II participou, de 1228 a 1229.

À oitava, também liderada por Luís IX, em 1270.

Essa divisão é arbitrária e exclui muitas expedições importantes, como as dos séculos

Fonte; www.newadyent.org

Moo independência, estabeleceram governo próprio e se uniram às Nações Unidas.

No início da década de 1990, as colônias russas libertaram-se do abraço de urso de Moscou. Países da Ásia Central até então inacessíveis agora estavam abertos para o testemunho. Será que agora a resistência à religião de seus colonizadores diminuiria? Será que o fervor nacionalista que produzira essas mudanças também provocaria na Igreja do mundo não ocidental o desejo de participar na divulgação do evangelho? Século XXI: desocidentalizar o evangelho? A flexibilidade cultural permitida pelo Concílio de Jerusalém possibilita uma diversidade sempre crescente de práticas cristãs, à medida que a mensagem alcança os confins da terra. Nosso visitante espacial visita-nos mais uma vez, agora em nossos dias:

Dessa vez [chega] a Lagos, na Nigéria. Um grupo, todo vestido de branco, segue dancando e cantando pelas ruas a caminho da igreja. Eles convidam o povo a experimentar o poder de Deus em seus cultos. Afirmam que Deus tem uma mensagem para cada pessos ém parficulár é qué seu podei póde ser desanimado cars fics: Eles canesiá poi é Macaco Eva dé alisa de todas à é Mi AIC CORE É GÓR O poder, que se revela na pregação, nas curas e em visões individuais.”

Qual dessas “porções do tempo” observadas pelo visitante intergalático representa o “verdadeiro cristianismo”? Todas. Se quisermos ser honestos com Atos 15, temos de ter cautela em não agregar nossas pressuposições culturais ao evangelho e afirmar que exemplificam a verdade a ser proclamada, O evangelho cria raízes numa cultura e se torna nativo dali, tomando formas bem diferentes das experimentadas pelo mensageiro. O evangelho é o libertador de todas as

Kenneth Scott Latourette, op. cit., p. 271,

Rom as dguas cobrem ma, culturas. Por toda parte, povos atraídos pela pessoa e pelo ensino de Jesus resistem ao evangelho quando este se apresenta permeado de conceitos alheios. O padrão bíblico agora consistirá em desocidentalizar a mensagem. Nossa mensagem precisa ser Jesus, tudo acerca de Jesus, mais de Jesus, apenas Jesus, o Salvador de toda a humanidade e aquele que une as nações.

Deus não será obstruído em sua busca persistente. Ele encontrará mensageiros que pregarão a mensagem da cruz com clareza e “não criarão dificuldades para as etnias que se aproximam da fé” com o acréscimo de regras instituídas por homens. “Mais do que qualquer outra crença da humanidade, o cristianismo provou sua capacidade de durar mais Mus 88 culturas comas quais parecia estar identificado, algumas das quais ajudou â formar.”

O mundo já deu muitas voltas desde que Yahweh fez a aliança com Abrão, o adorador da Lua que veio da Caldeia (Js 24.1-3) 40 séculos atrás. De geração em geração, de Jerusalém aos confins da terra, Deus tem cortejado a humanidade rebelde, resgatando nações do pecado, de Satanás e da morte e convidando q povo para seu banquete vindouro. Foi a missão que deu aos filhos de Abraão. Essa é a tarefa da qual nos incumbe hoje. Os que abriram o coração se juntaram à ele nessa busca persistente oram para que as bênçãos que chegaram a nós logo cheguem a todos os povos do mundo.

“Se nós, ocidentais, insistirmos em reter nossas bênçãos, em vez de parti lhá-las, logo iremos perdê-las, e outras nações as receberão, como ocorreu com outras nações antes de nós”.

[figura] /figuras/perspectivas/mecanismos-de-missoes.png | Mecanismos de missões — IDE e VINDE, voluntário e involuntário, ao longo do período do AT, do NT, da Igreja primitiva a 1800 e das missões modernas (adaptado de Ralph D. Winter, USCWM)

Perguntas para estudo 1. De cada período descrito pelo autor, aliste um princípio relevante para o evangelismo ds mundo em nossos dias. 2. Houve uma época em que o avanço do evangelho foi mais fácil? Por quê?'
where curso_id = (select id from cursos where slug = 'perspectivas')
  and titulo like 'Lição 5 · Leitura — Blincoe%';

commit;
