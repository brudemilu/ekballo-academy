-- 298_perspectivas_licao5.sql
-- As quatro leituras que faltavam na Lição 5, nas posições em que o guia as
-- chama. Com isso a Lição 5 fecha em 6 de 6.
--
-- PROCEDÊNCIA: 45 FOTOS de celular (~385 DPI), não scan. Diferente da foto da
-- p. 210 do McClung, aqui a perspectiva NÃO derrubou o OCR: quase toda página
-- saiu com 47 a 91 linhas e ruído perto de zero. Ainda assim é transcrição de
-- OCR, sem prova por contagem de caracteres.
--
-- Três fotos vieram de cabeça para baixo (4, 5 e 36) e foram giradas antes da
-- leitura. As fotos 13 e 14 são a MESMA página (98% de sobreposição, p. 239
-- fotografada duas vezes) — a duplicata saiu da montagem. São 44 páginas únicas.
--
-- SEIS FIGURAS entram no Blincoe, que sem elas fica incompreensível: o texto
-- remete a mapas que não existiam na transcrição. Nas páginas com figura, a
-- região da figura é EXCLUÍDA do texto — senão os rótulos dos mapas (IRLANDA,
-- Mar do Norte, Columban) viram parágrafos soltos, que era o que acontecia.
--
-- COMO AS FIGURAS FORAM ENCONTRADAS: página cuja densidade de texto destoa das
-- vizinhas é candidata a figura, e cada candidata foi conferida na imagem. Esse
-- critério achou as seis; o detector de tinta residual que tentei antes dava
-- zero até em página com diagrama.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';

  update aulas set ordem = ordem + 1000 where curso_id = cid and ordem >= 43;
  update aulas set ordem = ordem - 1000 + 4 where curso_id = cid and ordem >= 1000;

  -- Winter e Woodberry assumem as posições que o guia lhes dá
  update aulas set ordem = 46 where curso_id = cid and titulo = 'Lição 5 · Leitura — Winter, cap. 34: As duas estruturas da missão redentora de Deus';
  update aulas set ordem = 47 where curso_id = cid and titulo like 'Lição 5 · Leitura — Woodberry%';
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 5 · Leitura — Blincoe, cap. 33: Como as águas cobrem o mar', 'E

A

A E.

EA

a) mmumpa É É ROBERTA. BLINCOE é diretor da

agência Frontiers, nos Estados Unidos,

io je para O Muro,

islâmico, É autor de Ethnic Realities

ond the Church: Lessons from kurdiston

IRealidades étnicas e a Igreja: lições É

do Curdistão), Trabalhou entre os E curdos da Turquia e do norte do lraque

durante nove anos. E Artigo extraído de Meg Crossman E (Org.) Worldwide Perspectives

[Perspectivas mundiais) (Seattle:

“YWAM, 2003). Usado com permissão,

cobrem o mar 3 3

Robert A. Blincoe ID; Abraão a Jesus: 20 séculos. De Jesus aos dias de hoje: mais

20 séculos. Cristo está no ponto intermediário entre Abraão e nossos dias. Durante a primeira metade, Deus levou adiante, com afinco, seu propósito de redimir os povos do mundo. Nos outros 20 séculos, o povo de Deus levou a mensagem da Bíblia a muitos outros povos e lugares. À história da expansão do cristianismo é o registro de como sua glória chegou às nações.

Como isso aconteceu? Dentre as muitas razões para sua expansão ininterrupta, sua habilidade inata de ser transferível talvez seja uma das mais significativas. O cristianismo, mais que as outras religiões, foi capaz de crescer além de qualquer nacionalidade com a qual estivesse plena e até irremediavelmente identificada, vindo a se instalar em culturas distantes por meios imprevisíveis. Como disse Ralph Winter, “o cristianismo é a única religião sem nenhum nacionalismo em suas raízes”!

É da natureza do evangelho que cada cultura o ouça pela primeira vez de alguém que não seja de seu meio. Daniel T. Niles, do Sri Lanka, afirma: “É uma fé que necessariamente vem de fora”.? Alguém invadiu sua cultura ou, mais provavelmente, a cultura de seus antepassados, trazendo as boas novas do Senhor ressurreto. Meus antepassados, que moravam próximo a Hadrian''s Wall, no norte da Inglaterra, ouviram o evangelho muitos séculos atrás de missionários que vieram do outro lado do mar. Para alguns leitores, o evangelho chegou muito recentemente. À despeito de mensageifos frágeis e estruturas missionárias débeis, Deus fez com que a fé fosse passada adiante. Essa é a mais extraordinária de todas as histórias, e ela gloriosamente avança mais e mais em nosso tempo.

Quem diria, há 50 anos, que a Nigéria contaria hoje com mais bispos anglicanos que a Inglaterra? Quem, um século atrás, previu TUE milhões Res de chineses abraçariam a fé, À num movimento À que se espalhou de modo notavelmente semelhante ao movimento dos três primeiros séculos da era cristã? Quem poderia prenunciar, durante o domínio colonial, que tantos missionários iriam pregar

Ralph Winter e Steven C. Hawthorne (Org.), Perspectives on the World Christian Movement: À Reader (Pasadena: William Carey Library, 1981, 1992, 1999), p. 201, RE E A

2 Upon the Earth (New York: McGraw-Hill, 1962),

pos,” por sua história acerca de um visitante do espaço que vem para estudar o cristianismo da terra, Vo, de Andrew Walls,

228 a outras culturas, partindo da América Latina, das Filipinas e da Índia? Talvez, alguns dos leitores deste artigo logo estejam levando as boas novas à um povo não alcançado, pois “viemos a receber graça e apostolado por amor doseu noime, para à obediência por fé, entre todos os gentios” (Rm 1,5). De 0 a 400: de Jerusalém às fronteiras do Império Romano Para compreender como o evangelho se inseriu em centenas de culturas e descobrir nossa parte em abençoar todas as famílias da terra, precisamos começar com o tempo em que os missionários eram judeus. Quando os missionários eram judeus Imaginemos um visitante! do espaço, longevo e estudioso, que pudesse visitar a Terra de poucos em poucos séculos a fim de realizar pesquisa de campo, Além disso, presumamos que seu intuito seja dedicar-se ao estudo do cristianismo:

Sua visita é a um grupo de cristãos primiti-

vos em Jerusalém, próximo do ano 37 d.C.

Ele percebe que são todos judeus; de fato,

reúnem-se no templo, onde apenas judeus

podem entrar. Oferecem animais em sacrifi-

cio, Guardam o sábado, sem trabalhar nesse

dia. Circuncidam seus filhos, Seguem me-

ticulosamente uma série de rituais e de-

leitam-se na leitura de antigos livros de

legislação, O que os difere de outros judeus

é simplesmente o fato de identificarem as

figuras do Messias, do Filho do Homem e

do Servo sofredor (todas mencionadas nos

livros de legislação) com o Profeta-Mestre

de há pouco, Jesus de Nazaré, quem creem

ter inaugurado a era final.

Com essa percepção de fé e prática pri-

mitivas, nosso visitante espacial volta para

Sou devedor a Andrew Walls, a quem Ralph Winter se o capítulo inicial de The Missionary Movement in Christian

Como as águas cobrem o imar

casa e redige um artigo: “A prática da religião

normal de Jesus em 37

Não devemos ignorar o aspecto judaico da fé eda prática cristã primitivas, Após o Pentecostes, Pedro, Tiago e João continuaram a adorar no templo e “milhares [de] judeus creram, e todos são zelosos da lei” (At 21.20). Os pais em Jerusalém contentavam-se em permanecer judeus em todos os sentidos e tinham a expectativa de que os judeus crentes em Jesus continuassem a guardar a Lei, Até mesmo insistiam nisso (At 21,21-24),

Contudo, os crentes em Jerusalém foram confrontados por outros judeus Paulo e Barnabé que partilhavam a fé com os gentios (ethne) sem requerer deles rituais que os tornassem judeus. Paulo e Barnabé estavam desjudaizando o evangelho. Quando questionado, Paulo defendia com veemência seus argumentos. O resultado foi um divisor de águas: a decisão tomada pelo Concílio de Jerusalém, em Atos 15. Na ocasião, os pais em Jerusalém decidiram, em oração, permitir que o movimento minoritário de Paulo prosseguisse: “Não devemos criar dificuldades para as etnias que estão se voltando para Deus” (At 15.18, paráfrase minha).

Essa era a abertura que Paulo e sua pequena equipe esperavam obter. De forma cautelosa, eles removeram a roupagem cultural da mensagem do evangelho e a revestiram com terminologias e conceitos não judaicos. Paulo escreveu o que Pedro não teria escrito: “Para os que estão sem lei, [fiz-me] como se estivera sem lei para ganhar os que estão sem lei

E eu faço isso por causa do evangelho” (1Co 9.21,23, arc).

Pedro, Tiago e João por certo nunca imaginaram que centenas de milhares de não judeus passariam por essa abertura, Os cristãos judeus: referiu como *o missiólogo mais proeminente de nossos tem-History (Maryknoll: Orbis, 1996),

movimento cristão havia se difundido até os pontos mais remotos do Império Romano,

Rodney Stark questiona a verdadeira natureza da hostilidade, frequentemente mencionada, da Igreja primitiva para

judeus. Ele alega muitos judeus da Diáspora foram atraídos cristianismo libertava dos árduos

requerimentos da lei cerimonial judaica (a qual era difícil de manter fora de sua terra natal), ao mesmo tempo em que os

que uma crentes e a “in the World in (Princeton: Princeton University, 1996), 49-72.

ra crentes mais tarde se tornariam uma minúscula minoria num mar “mediterrâneo” de convertidos, de fala latina e grega, incircuncisos e comedores de carne de porco, os quais levariam o evangelho nos pontos mais remotos e aos povos mais diversos do Império Romano, O que atralu os gentios? O que atraiu aquelas centenas de milhares de gentios para o cristianismo? Às vezes, o óbvio precisa ser dito: 0 atrativo era o próprio Jesus, Ele abençoou e capacitou homens e mulheres a ter vida significativa neste mundo e uma firme esperança no porvir, Jesus era a presença viva em todos os ajuntamentos cristãos. Nenhuma ameaça impediria seu povo de proclamar sua mensagem e de afirmar que Jesus era o Senhor, e não César (Senhor em grego é kyrios, termo que o imperador reservava apenas para si).

Além disso, o mundo no qual as virtudes cristãs eram demonstradas era deveras brutal: um mundo onde o filho do imperador comemorava seu aniversário assistindo aos animais dilacerarem pessoas na arena; onde a vida conjugal via de regra fracassava; onde a promiscuidade, as prostitutas cultuais e a prática homossexual eram comuns; onde a população decresceu nos primeiros três séculos da era cristã (simplesmente por ser esse mundo um lugar terrível demais para criar filhos); onde muitas filhas tecém-nascidas eram abandonadas à morte, a fim de que os homens excedessem as mulheres em número; onde povos conquistados eram escravizados para possibilitar o estilo de vida da minoria elitizada. Até mesmo suas práticas religiosas eram detestáveis: as divindades romanas não promoviam a moralidade entre seus segui-

No Concílio de Arles, convocado por Constantino em com que “mantinha ligados às raízes bíblicas. Stark crê havia comunidade cristã ainda no século V. Para saber mais, v. o ded”, de seu livro The Rise of Christianity: How the Obscure,

Western a Few Centuries

dores, havendo, em vez disso, ritos ocultistas indecentes e cerimônias dispendiosas, Século IV; o evangelho prevalece Às perseguições cessaram e as dificuldades foram amenizadas quando o imperador Constantino publicou o Édito de tolerância, no ano 313. Quer tivesse se convertido, quer não, Constantino astuciosamente consolidou seu império em torno da crença mais poderosa de seu tempo, À proteção proporcionada pelo imperador aumentou em muito o discipulado cristão à população em geral, bem como a influência da Igreja sobre assuntos de interesse público (por exemplo, Constantino aboliu os combates entre gladiadores nas arenas). Infelizmente, em consequência de o cristianismo haver se tornado a religião estatal, milhares de pagãos nominais passaram a ser membros nominais da Igreja,

O pesquisador extraterrestre faz uma segunda visita a Terra, mas não a Jerusalém (o exército romano reduziu a cidade a ruínas ainda no tempo em que os primeiros apóstolos estavam vivos). Ão indagar do paradeiro dos crentes em Jesus, disseram ao visitante espacial que fosse à nova capital do império: Constantinopla.

Sua visita seguinte a Terra dá-se no ano 325.

Ele participa de um grande encontro de lí-

deres eclesiásticos talvez o Concílio de

Niceia. Os participantes provêm de todo o

mundo mediterrâneo e além, mas é pouco

provável que algum deles seja judeu, Aliás,

de modo geral, mostram-se um tanto hostis

com os judeus. Ficam horrorizados com a

ideia de sacrifício de animais; quando falam

de apresentar sacrifícios, referem-se ao pão 314, três bispos ingleses compareceram, o que indica como o

ao porque este os aproximação significativa entre de origem judaica capítulo “The Mission to the Jews: Why It Probably Succee-Marginal Jesus Movement Became the Dominant Religious Forte

p.

O cio o vinho, num ritual que segue o costume das em Jerusalém utilizavam. Dão igual valor q refeições domésticas que nosso observador outro conjunto de escritos, que nem sequer vira em Jerusalém. Os líderes eclesiásticos haviam sido compostos quando os cristãos não devem se casar, e vários deles conside- em Jerusalém se reuniam”, ram o casamento algo inferior e tratam um pai que circuncide o filho como alguém que O visitante espacial fica maravilhado 20 ver traiu a fé, Consideram o sétimo dia como dia que, embora a fé continue centralizada em Jesus, normal de trabalho e mantêm certas práticas sua prática mudou drasticamente e se expanreligiosas especiais no primeiro dia da sema- diu significativamente. Os líderes eclesiásticos na, mas não necessariamente se abstêm do desjudaizaram a mensagem e adaptaram o evantrabalho e de outras atividades. Usam tradu- gelho ao mundo romano. Eles tiraram proveições dos livros de legislação que os cristãos to das estradas imperiais e da segurança dos Andrew Walls, op. cit., p. 3-4. serrana Prado e Ci É

Os benefícios de crer O mundo romano foi atraído para a fé e para a comunidade cristã pelo seu monoteísmo, sua moralidade e sua historicidade, Além disso, havia benefícios reais. Rodney Stark, sociólogo da Universidade de Washington que estuda os movimentos religiosos, documentou-os em The Rise of Christianity [A ascensão do cristianismo). Dentre suas conclusões:

O ensino da Igreja proibia o aborto, uma das principais causas de infertilidade e

morte entre mulheres romanas.

Infanticídio, particularmente de meninas, era expressamente proibido.

Em casos de pragas e epidemias, as quais dizimaram milhares nos três primeiros sé-

culos da era cristã, os cristãos davam assistência aos doentes, em vez de abandonar a

cidade, que era a prática comum.

No mundo romano, em que as mulheres normalmente não tinham quaisquer direi-

tos e pouco respeito da sociedade, as mulheres cristãs ocupavam cargos de honra e

de autoridade.

Em cidades repletas de viúvas e órfãos, o cristianismo proporcionou uma nova e mais

ampla noção de família.

O cristianismo proporcionou uma mentalidade com relação à harmonia étnica e a

revitalização urbana que possibilitava unir e renovar diversas populações urbanas.

A expectativa de fidelidade conjugal aumentou significativamente a fertilidade e re-

duziu os índices de mortalidade entre os cristãos,

Os cristãos apresentaram uma nova concepção de humanidade a um mundo exausto É

da crueldade voraz do paganismo.

Em suma, os cristãos tinham uma vida melhor que a de seus concidadãos. À amabilidade e cuidado cristãos foram visivelmente estendidos à comunidade em geral, de forma que, de década em década, a fé cristã crescia, a despeito de ameaças, insultos, acusações

falsas e perseguição direta. ane Ee E

Gerald H. Anderson, Biographical Dictionary of Christian Missions (New York: Simon Schuster MacMillan, 1998),

Robert A. Blincoe viajantes proporcionada pela pax romana, bem como o amplo uso de dois idiomas latim e grego para levar o evangelho às principais cidades do Império Romano entre Espanha e Babilônia (ver mapa). No entanto, apesar deo cristianismo ter sido declarado religião oficial do Império Romano, não havia qualquer plano desenvolvido com o propósito de evangelizar nações além da esfera romana. Havia a necessidade de missionários que enxergassem longe,

CESSA a de igreja para os PETS Ac saga a ão romano: calamidade ianitdad p para a missão de Cristo é A identificação Se do Império Romano com o cristianismo pai era tão EE intensa que, no século IV, ambos os termos o! “romano” À e ria “cristão” eram usados de modo intercambiável.

As identidades o estavam fundidas. Em

tal ambiente de opiniões P não haveria

argumentação que os convencesse à levar

ae” báipáros á A ãos. N pógios pé ma

proeminente autoridade dos dias de hoje, “ao

longo de toda a spoça da Imperio-Romaão,

não se tem conhecimento de um exemplo se-

quer de um homem que fosse ordenado bispo

com a tarefa específica de cruzar a fronteira

e se estabelecer numa região pagã a fim de

converter os bárbaros que ali residissem”.*

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

invasões foi que esses bárbaros godos

eram, guardadas as devidas proporções, res-

peitadores da vida e da propriedade, espe-

cialmente no que dizia respeito às igrejas! O

esforço informal de missionários pioneiros

(pelo qual os cristãos latino-romanos po-

diam reclamar pouco crédito) trouxe gran-

des benefícios para os cidadãos de Roma, ao

apresentar a esses povos pelo menos uma fé

cristã superficial. Até mesmo alguns romanos

seculares mencionaram a sorte que tiveram,

pois os invasores mantinham como priorida-

de certos padrões da moralidade cristã.!!

Num curto espaço de tempo, os conquistadores foram conquistados pelo poder do evangelho, à medida que os bárbaros invasores abraçavam a fé dos que haviam sofrido a invasão, De 400 a 800 Alcançando os Bárbaros A influência da igreja institucional começou a minguar no século V, Ondas sucessivas de povos crueis oriundos da Ásia Central empurraram práticas cruéis de anglos, saxões e frísios na Bretanha, a força

[figura] /figuras/perspectivas/expansao-do-cristianismo.png | Expansão do cristianismo — regiões cristianizadas até 325 d.C. e até 600 d.C.

Mark A. Noll, Turning Points: Decisive Moments in the History of Christianity (Grand Rapids: Baker, 1997), p. 84.

bou por acelerar seu declínio. A luz da fée do aprendizado foi quase perdida, exceto entreos monastérios. Os protestantes estão começando a dar valor à contribuição feita por Bento (ou Benedito)e outros que o seguiram: O surgimento do monasticismo foi, depois da comissão de Cristo aos seus discípulos, o evento institucional mais importante (e em vários sentidos o mais benéfico) na história do cristianismo. Por mais de um milênio, nos séculos desde o reinado de Constantino até a Reforma protestante, quase tudo na Igreja que se aproximava dos ideais mais elevados, nobres e verdadeiros do evangelho era realizado por aqueles que escolheram o caminho “do monastério ou por aqueles cuja vida cristã se inspirava no monges.!2 À maior parte do que conhecemos acerca -do-mundo antigo, tanto em literatura quanto em tecnologia (tratamento de couro, tinturaria, alvenaria, tecelagem, construção de pontes), te“tia se perdido não fosse o esforço acadêmico de

partida da maior parte da atividade missionária ao longo da Idade das Trevas. Os celtas iluminam a Idade das Trevas Contudo, apesar das trevas, Deus operava ativamente. Num local improvável da Europa não romana, outra forma do cristianismo assumiu e levou adiante a tarefa através do continente europeu a fim de alcançar as tribos germânicas. Esse local era a Irlanda, com seus habitantes, os celtas. Esse povo era tão embrutecido que tanto Júlio César quanto Jerônimo mantinham distância deles, por serem caçadores de cabeças e canibais.

Na terceira visita à Terra, o viajante interplanetário de Andrew Walls encontra Roma em ruínas. No entanto, depara com uma fé vibrante na Irlanda, longe das fronteiras que antes delimitavam tanto o Império Romano quanto a fé romana:

Certos monges estão reunidos em uma orla

rochosa. Alguns estão de pé, imóveis, em

oração, com os braços estendidos em forma

de cruz. Outros estão partindo num pequeno

234 Como as águas cobrem o mar barco, sob condições climáticas arriscadas, le- (não na Irlanda), o pai de Patrício era diácono, é vando consigo uma caixa de belos manuscri- seu avô, sacerdote. Quando era adolescente, foi tos e pouco mais, a fim de se dividirem pelas sequestrado por salteadores celtas, que o vendeilhas do estuário de Clyde e convidar seus ram como escravo na Irlanda. Mais tarde, Paatônitos habitantes a abandonar a adoração trício deu graças por esse infortúnio, pois foi o às divindades da natureza e buscar alegria meio que Deus usou para levá-lo à fé em Cristo. no reino celestial vindouro.” Após anos de escravidão, Patrício recebeu ins-

trução divina por meio de sonho, fugiu, voltou A igreja celta reevangelizou, com êxito, para casa e estudou para o sacerdócio. Contugrandes partes da Inglaterra e da Europa con- do, uma visão subsequente instruiu-o a voltar tinental. Duas gerações após terem sido apre- à Irlanda. Mesmo sabendo que sua vida corria sentados ao cristianismo, os celtas ensinavam a perigo, ele optou por obedecer. O fruto de seu si mesmos grego, latim e hebraico. Eles se de- ministério: centenas de milhares foram batizadicaram, por amor, à tarefa de traduzir e copiar dos e centenas de igrejas foram fundadas. à mão a Bíblia e comentários clássicos. De fato, Ele inspirou uma geração de líderes, como mais da metade dos comentários datados de 650 Columba e Columbano, que edificaram cena 850 foram escritos por irlandeses. tros de treinamento de missionários, como Patrício foi o principal missionário usado por Tona e Lindisfarne, que enviaram os peregrini Deus para converter os celtas dos rituais druídi- exilados peregrinos, que fizeram o voto de cos pagãos ao Deus vivo. Nascido na Bretanha levar o evangelho aos confins da terra. 3 Andrew Walls, op. cit., p. 4.

Quem eram os celtas? Um possível e intrigante caso de transferência natural do evangelho dentro de uma unidade social é o dos celtas. Estudos históricos esclarecem que a província da Galácia, na Ásia Menor, recebeu esse nome por ser povoada pelos galatoi da Europa Ocidental (os quais, até o século IV, ainda falavam seu idioma original, o celta, além do grego falado naquela região do Império Romano). Quer os gálatas conhecidos por Paulo fossem apenas comerciantes judeus que moravam na província da Galácia, quer fossem ga/atoi celtas que, desde o início, foram atraídos à sinagoga por serem “tementes a Deus”, percebemos que, de qualquer forma, a carta de Paulo aos gálatas é particularmente cautelosa quanto ao intuito de alguém impor aos seus leitores costumes da cultura judaica e confundir tais costumes com a fé bíblica essencial que Paulo pregava tanto a judeus quanto a gregos (Rm 1.16).

Uma questão de grande interesse missionário é o fato de que a pregação de Paulo alcançou uma veia cultural dos celtas, que pode logo ter incluído amigos, parentes e contatos comerciais, alcançando grande distância no Ocidente. Assim, os esforços de Paulo na Galácia podem nos dar uma pista da surpreendente entrada do evangelho em tão pouco tempo nas regiões de origem dos celtas na Europa, delineadas por um cinturão que atravessa o sul da Europa e se estende até a Galícia, na Espanha, e a Britânia, na França, subindo em direção às regiões oeste e norte das ilhas Britânicas.

e op. p.

Os missionários celtas tinham por característica a espontaneidade, ausência de tradicionalismo e individualismo robusto. Eles foram a lugares a que ninguém mais iria, sem credenciais nem apoio financeiro. Confiantes e dependentes de Deus, realizaram muito mais que suas estatísticas poderiam respaldar. Eles mantinham um monasticismo fervorosamente missionário. Assim, o monastério não era um lugar de reclusão do mundo, mas um local de preparação para as missões.”

Há vestígios de monastérios celtas na Bélgica, nos Alpes, na Morávia e até em Kiev. Mulheres peregrini também foram enviadas, e igrejas dedicadas à sua patrona, Brígida, ainda permanecem de pé na França, na Alemanha, na Áustria e na Itália (ver mapa). Até mesmo o historiador secular Thomas Cahill enaltece o trabalho dela:

Aonde quer que fossem, os irlandeses leva-

vam consigo seus livros muitos ausentes

da Europa havia séculos amarrados à cin-

tura como símbolos de triunfo, do mesmo

modo em que os heróis irlandeses de outrora

amarravam à cintura a cabeça de seus ini-

migos. Nas baías e vales de seu exílio, eles

restabeleceram a dedicação à literatura e so-

praram nova vida à exausta cultura literária

da Europa. Dessa forma, os irlandeses pre-

servaram a civilização."

Patrício e os irlandeses desromanizaram o evangelho, adaptando-o a forma e práticasaos quais os celtas estavam mais familiarizados, Os sacerdotes cristãos celtas (que podiam se casar) continuaram a usar os mantos brancos dos druidas celtas. À diocese e o bispo foram substituídos pelo monastério e pelo abade. A liderança das igrejas eram passadas de um parente mais velho para outro mais jovem,

4 Pierson, Paul, The Celtic Missionary Moviment, in: A. Mission (Grand Rapids: Baker, 2000), p. 170.

Ralph Winter Steven C. Hawthorne (Org.), cit.,

“é Encyclopedia Brittanica (Chicago, 1991), p. 743.

conforme o padrão de regras tribais celtas. Winter escreve:

Curiosamente, a expressão “Terceiro Mun-

do” vem daqueles dias, quando o grego e o

latim eram os dois primeiros mundos, e os

bárbaros, ao norte, eram o Terceiro Mundo.

Assim, a Europa dos bárbaros foi ganha mais

pelo testemunho e trabalho de “Missionários

do Terceiro Mundo” os celtas e anglo-

saxões convertidos pelos celtas do que

pelos esforços de missionários oriundos da

Itália ou da Gália.!é Século VIII: o evangelho por toda a Europa Ocidental A fé cristã acelerou sua expansão no século VIII. Bonifácio (Winfried), o maior missionário da Inglaterra, pregou durante três décadas aos saxões (na Alemanha) e aos frísios, na atual Holanda. Ele conduziu muita gente à conversão ao cortar, dramaticamente, o famoso Carvalho de Thor. Contudo, em razão da suspeita de que fosse um agente de Carlos Magno, inimigo declarado dos saxões, Bonifácio foi martirizado em 754.

Carlos Magno, rei dos franco-germanos, foi o monarca mais poderoso do Sacro Império Romano em 400 anos. Ele restabeleceu a segurança ao longo das estradas, consolidou seu domínio sobre toda a Europa Ocidental e cristianizou as tribos germânicas. Assegurada a paz, deu-se um renascimento cultural por todo o império de Carlos Magno:

Houve esforços para elevar o nível da obser-

vância religiosa, da moralidade e do processo

judicial por todo o império O movi-

mento espiritual e literário chamado “re-

nascimento carolíngio” dividia-se em vários

centros, especialmente nos monastérios do Scott Moreau (Org.), The Evangelical Dictionary of World 204.

[figura] /figuras/perspectivas/missoes-celtas.png | Missões celtas — rotas de Iona, Lindisfarne, Armagh e Kells rumo à Britânia, Gália e Baviária

Contudo, mais uma vez, um povo além do alcance missionário abalou o mundo cristão, e o ressurgimento da cultura foi bruscamente interrompido. De 800 a 1200: alcançando os vikings Suponha que nosso viajante intergalático faça outra visita a Terra, agora no início do século X. Onde estão os famosos monastérios irlandeses? Estão em ruínas, porque um povo do norte, poucas vezes visitados pelos peregrini,os atacou a fim de despojá-los de seus tesouros. Saqueadores cruéis, eles aterrorizavam o povo soltando cães ferozes antes de atacar e causavam estragos por todo lado, Os navios vikings, de calado raso, conseguiam navegar rio acima, chegando a Londres, York, Rouen e Hamburgo. “Deus nos proteja dos nórdicos e de seus

mundo cristão no ano 793, quando Lindisfarne, o centro de treinamento missionário insular celta, foi devastado. Aqueles nórdicos, que orgulhosamente se intitulavam frenéticos, vinham em ondas impiedosas, atacando repetidas vezes Iona, Lindisfarne e dezenas de outros monastérios. Por haverem se tornado centros de riqueza, os monastérios eram os alvos prediletos.

Mais uma vez, o povo de Deus deixou de partilhar as bênçãos que acompanham a verdade de Deus, e outros povos vieram arrancar deles as bênçãos. Ao contrário dos bárbaros, os vikings não tinham qualquer contato com o evangelho. Eram um povo sanguinário, e seus ataques eram cruéis.

Então, numa dessas grandes guinadas da história, o poder do evangelho da salvação começou a transformar essa cultura bélica. Alguns prisioneiros levados à força para o Norte

Kenneth Scott Latourette, 4 History of Christianity (New York: Harper and Row, s.d.), 1, 558. 3 Originariamente, tribos nômades da Síria. O termo veio a denotar qualquer muçulmano, especialmente

Robert A. Blincoe na

sacerdotes (que sabiam ler e escrever) e mulheres (futuras esposas, escravas e concubinas)

levaram consigo a fé cristã. Pouco a pouco, o evangelho apoderou-se de seus captores. Talvea por não representarem nenhuma ameaça política, o testemunho cristão foi absorvido com facilidade pela cultura nórdica.

No decorrer dos séculos X, XL e XIl,a fé cristã avançou em terras escandinavas (Dinamarca, Noruega e Suécia). O estudo de corpos preservados, exumados de pântanos da Dinamarca, comprova que os escandinavos praticanum rituais de sacrifício humano por uns mil unos. Entretanto, “com o advento do cristianismo, cessaram os sacrifícios nas regiões pantanosas”.!* De inúmeras maneiras, a qualidade de vida melhorou sob a influência cristã. O rei Olavo da Noruega proibiu o “abandono de recém-nascidos” e ordenou que doravante, toda primavera, na abertura da assembleia nacional, não mais se açoitaria um escravo, mas se libertaria um.!

À fé expandiu-se em várias direções. Os monges Cirilo e Metódio deram aos eslavos uma língua escrita (a base do alfabeto cirílico), e sua tradução da Bíblia tornou-se a inspiração para a atividade literária entre os eslavos. Vladimir, governante de Kiev, assumiua fédos Ortodoxos, dando início à Igreja Ortodoxa Russa. Os magiares invadiram a Hungria, mataram a população cristã e queimaram as igrejas. No entanto, eles também se converteram ao cristianismo, no século X: “Europa e cristianismo se tornaram sinônimos”.?

Na maioria dos casos, a conversão era comunitária: chefes e reis conduziam o povo ao batismo e à fé, numa espécie de conversão em massa. De fato, movimentos que englobavam toda a comunidade, por influência de seus governantes, era a norma: “Na Europa Ocidental da época,

Kenneth Scott Latourette, ibidem, p. 401.

Kenneth Scott Latourette, ibidem, p. 351. 2 Kenneth Scott Latourette, ibidem, p. 289.

2 Ralph Winter e Steven C, Hawthorne (Org.), opx cit. “opunham às Cruzadas.

237 a fé era adotada como a religião da comunidade, geralmente por ordem do príncipe ou pelo menos com sua enérgica assistência”?!

Esse método secular, imposto de cima para baixo, expandiu grandemente o cristianismo entre 900 e 1386, ano em que a Lituânia se tornou a última parte da Europa a aceitar o cristianismo. A ascensão do islamismo Uma terceira religião monoteísta surgiu no século VII. Influenciado por judeus e cristãos, Maomé proclamou a adoração a Alá como o único Deus em toda a Arábia. Após sua morte, O islamismo espalhou-se pelo norte da África, alcançando a Espanha e metade dos países mediterrâncos. Os cristãos fugiram para a Sicília, Espanha, Grécia, Gália e até mesmo para a Alemanha, Esse êxodo foi um golpe fatal ao cristianismo do norte da África. Em outros lugares, cristãos nominais converteram-se ao islamismo, em parte com o propósito de evitar a sobrecarga de impostos, em parte por causa das vitórias militares estarrecedoras, “pois eles surgiram para demonstrar que o islamismo desfrutava o favor especial de Deus”.2

Os governantes muçulmanos logo impuseram restrições maiores às igrejas cristãs. Tornou-se quase impossível a conversão ao cristianismo, Em razão disso, as igrejas sob o domínio muçulmano foram perpetuadas pelos laços familiares. As igrejas temiam que seu estilo de vida desaparecesse por completo se eles de alguma forma desagradassem o povo ou promovessem alguma inovação. Com isso, as igrejas da Arábia e da Pérsia tornaram-se extremamente conservadoras. De 1200 a 1600: alcançando os sarracenos? Nosso viajante espacial retorna e percebe uma grande quantidade de povos em trânsito. As

v. p.

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

Cruzadas. Francisco de Assis (m. 1226) fundou a Ordem dos Frades com o intuito de

trazer à luz um “novo tipo de cavaleiro”. O voto era simples: “Seguir os ensinos de nosso

Senhor Jesus Cristo e andar em seus passos”. Homens e mulheres seguiram sua lideran-

ça, e, por ocasião da morte de Francisco, a ordem contava com o espantoso número de 5

mil membros.

Em 1219, Francisco atravessou terra de ninguém, separando os exércitos europeus É “das Cruzadas dos exércitos muçulmanos do Egito. Ele implorou ao sultão que perdoasse

o erro de seus concidadãos europeus com sua versão deturpada da missão de Cristo na É

terra. Talvez Francisco tenha sido atendido, talvez não, quando pediu para permanecer É

ali duas semanas e pregar ao sultão a mensagem de Jesus Cristo, Sabemos que, quando É

partiu, estava perplexo com o fracasso de sua missão e só pôde explicá-lo como um “ainda É

não” nos planos de Deus. É Domingos de Gusmão, que fundou a Ordem dos Pregadores, desejava levar o cvange- E “lho ao inalcançado povo tatar, no Oriente. E

Raimundo Lúlio, franciscano espanhol, também desejava ver os muçulmanos alcança-

É E dos por meio do amor, e não da espada. Ele ensinava, escrevia e pregava com esse intento É

e acabou morrendo como mártir no norte da África. A contribuição desses homens foi E o “advogar uma abordagem “desmilitarizada” aos muçulmanos. Ao contrário das Cruzadas, É “À eles não representavam uma potência secular de esnada em minha ido Et

[A 240 familiares às tradições germânicas, Lutero, por exemplo, escrevia no vernáculo alemão e traduziu as Escrituras para o idioma do homem comum. Ele des/atinizou o evangelho. Povos que falavam as “línguas latinas” ou eram influenciadas pela cultura latina, via de regra permaneceram no âmbito católico, com sua liturgia e prática latinas. Os povos germânicos estavam mais propensos a se identificar com a mensagem da Reforma.

Mas onde estavam as missões protestantes? Lutero e Calvino criam nas reivindicações universais de Cristo sobre a humanidade. Por que, então, a Reforma protestante não levou a cabo um grande avanço missionário? Por 350 anos, essa questão embaraçosa permaneceu sem solução, enquanto missionários católicos seguiam seus exploradores até os confins da terra: Matteo Ricci, à China; Francisco Xavier, à Índia, China e Japão; Junípero Serra e Bartolomeu de las Casas, ao Novo Mundo; Alexandre de Rhodes, ao Vietnã. (Para um debate mais amplo sobre estratégia missionária católica, veja o capítulo “A história da estratégia missionária”, de R.

Y iii Como as águas cobrem o mar

Quando confiscou e fechou os monastérios, Lutero recolheu as velas que o Espírito Santo vinha usando para enviar missionários havia mil anos. Sem uma estrutura organizada, os protestantes só podiam ocupar terreno já conquistado. Eles não estavam preparados para enviar traba-Ihadores a pregar o evangelho nos lugares em que Cristo ainda não era conhecido (Rm 15.20). Os líderes luteranos em Wittenberg chegaram a condenar um leigo, Justiniano Welz, por propor a criação de uma sociedade com o intuito de enviar missionários além-mar. A exceção dos morávios Uma luminosa exceção alivia o histórico dos protestantes, que de resto é sombrio. O conde Nicolau Zinzendorf permitiu que um grupo de refugiados religiosos da Morávia se estabelecesseem sua propriedade, no leste da Alemanha, em 1722. Após um singular derramamento do Espírito Santo, em 1727, teve início um movimento de oração que se estendeu, noite e dia, por mais de cem anos. Na coroação do rei da Dinamarca, Zinzendorf conheceu dois nativos

[figura] /figuras/perspectivas/rota-primeiras-cruzadas.png | Rota das primeiras Cruzadas — a Cruzada de Lisboa (1147), a Primeira (1096-1099), a Segunda (1147-1149) e a Terceira (1189-1191)

Ocidentais. Ele ficou tão impressionado com ele propôs a seguinte questão: “Se o evangelho seu clamor por missionários que retornou para é digno de toda aceitação, porque não é pregado casa com um forte senso de urgência. Um ano a todos?”, Sua proposta supriu o elemento que depois, seus dois primeiros missionários foram faltava para iniciar o avanço missionário dos enviados às ilhas Virgens. protestantes: organizações que levassem adiante

O método morávio consistia de enviar co- a empreitada. munidades inteiras, compostas por trabalhado- À Investigação de Carey proporcionou aos res hábeis, a fim de estabelecer residência entre protestantes a motivação e os meios para impleos não cristãos e ensiná-los. Seus missionários mentar a evangelização de não cristãos mundo eram leigos, treinados em evangelismo, mas sem afora. O livreto foi o estopim da expansão misformação teológica. Eles partiam na condição sionária moderna. de trabalhadores, sem sustento, e exerciam cada um sua profissão entre o povo que desejavam Século XX: fim da era colonial alcançar. Em apenas duas décadas, o minúsculo Duas guerras mundiais, nas quais cristãos masgrupo enviou mais missionários que todos os sacraram milhões de companheiros cristãos, protestantes em duzentos anos. despertaram muitas nações à ação. Elas bata-

lharam para se tornar independentes de países William Carey e os métodos das que haviam sido seus dominadores coloniais. No missões modernas que Winter denomina “Os incríveis 25 anos” Os morávios inspiraram um pregador leigo ba- (1945-1969), as nações ocidentais perderam o tista da Inglaterra a propor um método radical domínio sobre todo o mundo não ocidental, de implementar a obediência à Grande Comis- exceto 5% desse território.” Na segunda metasão de Cristo. Seu nome era William Carey, e de do século XX, dezenas de países declararam

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

Dessa vez [chega] a Lagos, na Nigéria. Um

grupo, todo vestido de branco, segue dan-

cando e cantando pelas ruas a caminho da

igreja. Eles convidam o povo a experimentar

o poder de Deus em seus cultos. Afirmam

que Deus tem uma mensagem para cada pes-

sos ém parficulár é qué seu podei póde ser

desanimado cars fics: Eles canesiá

poi é Macaco Eva dé alisa de todas

à é Mi AIC CORE É GÓR O

poder, que se revela na pregação, nas curas

e em visões individuais.”

Qual dessas “porções do tempo” observadas pelo visitante intergalático representa o “verdadeiro cristianismo”? Todas. Se quisermos ser honestos com Atos 15, temos de ter cautela em não agregar nossas pressuposições culturais ao evangelho e afirmar que exemplificam a verdade a ser proclamada, O evangelho cria raízes numa cultura e se torna nativo dali, tomando formas bem diferentes das experimentadas pelo mensageiro. O evangelho é o libertador de todas as

Kenneth Scott Latourette, op. cit., p. 271,

Rom as dguas cobrem ma, culturas. Por toda parte, povos atraídos pela pessoa e pelo ensino de Jesus resistem ao evangelho quando este se apresenta permeado de conceitos alheios. O padrão bíblico agora consistirá em desocidentalizar a mensagem. Nossa mensagem precisa ser Jesus, tudo acerca de Jesus, mais de Jesus, apenas Jesus, o Salvador de toda a humanidade e aquele que une as nações.

Deus não será obstruído em sua busca persistente. Ele encontrará mensageiros que pregarão a mensagem da cruz com clareza e “não criarão dificuldades para as etnias que se aproximam da fé” com o acréscimo de regras instituídas por homens. “Mais do que qualquer outra crença da humanidade, o cristianismo provou sua capacidade de durar mais Mus 88 culturas comas quais parecia estar identificado, algumas das quais ajudou â formar.”

O mundo já deu muitas voltas desde que Yahweh fez a aliança com Abrão, o adorador da Lua que veio da Caldeia (Js 24.1-3) 40 séculos atrás. De geração em geração, de Jerusalém aos confins da terra, Deus tem cortejado a humanidade rebelde, resgatando nações do pecado, de Satanás e da morte e convidando q povo para seu banquete vindouro. Foi a missão que deu aos filhos de Abraão. Essa é a tarefa da qual nos incumbe hoje. Os que abriram o coração se juntaram à ele nessa busca persistente oram para que as bênçãos que chegaram a nós logo cheguem a todos os povos do mundo.

“Se nós, ocidentais, insistirmos em re-

ter nossas bênçãos, em vez de parti

lhá-las, logo iremos perdê-las, e outras

nações as receberão, como ocorreu

com outras nações antes de nós”.

[figura] /figuras/perspectivas/mecanismos-de-missoes.png | Mecanismos de missões — IDE e VINDE, voluntário e involuntário, ao longo do período do AT, do NT, da Igreja primitiva a 1800 e das missões modernas (adaptado de Ralph D. Winter, USCWM)

Perguntas para estudo 1. De cada período descrito pelo autor, aliste um princípio relevante para o evangelismo ds

mundo em nossos dias. 2. Houve uma época em que o avanço do evangelho foi mais fácil? Por quê?', 43 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 5 · Leitura — Sunquist, cap. 46: Cristianismo na Ásia', 'Scott W, Sunquist

WE

mummmm SOFT AUNQUIST É pers missões mundiais e evangelismo de W. Don Melure no Pittsburgh Theological Seminary. Ele lecionou em Cingapurae é coautor, com Dale Irvin, de História do movimento cristão mundial (são Paulo: Pauli, OA esvome Ee récebeu seu título de mestre em divindade do Gordon-Conwel TeologicalSeminary e de doutor em filosofia do Princeton Theological Seminar

na Ásia 4 6 e esus nasceu na Ásia, morreu na Ásia, e seus primeiros segui-

da Ásia ocidental evangelizaram tanto o Oriente quanto o Ocidente. Em Atos 2, lemos que, dentre os peregrinos que se encontravam em Jerusalém no Pentecostes, alguns vinham dos atuais Irã (partos, medos e clamitas), Iraque (Mesopotâmia) e Turquia (Capadócia, Ponto, Ásia, Frígia e Panfília). Ao se expandir na direção do Oriente, o cristianismo transpôs as fronteiras do Império Romano e chegou à Pérsia, inimiga de Roma. A hostilidade entre ambos os impérios forçou os cristãos persas a desenvolver maneiras próprias e únicas de adoração, teologia e prática cristã. Eles também organizaram seus concílios. Os cristãos primitivos da Ásia, a maioria dos atuais Irã, Síria e Iraque, adoravam voltados para o Oriente ao nascer do Sol. Eles ficavam de pé, com os braços abertos, imitando a cruz, em homenagem à ressurreição. Os cristãos persas orgulhavam-se de serem os primeiros a adorar Jesus, enquanto ele ainda era bebê, na manjedoura, já que Deus usou as estrelas para informar os magos (astrólogos persas) que o Salvador nascera na Ásia Ocidental. Os sermões asiáticos eram mais poéticos (como Salmos) que didáticos (como Romanos), e o idioma comum era o siríaco, em vez de grego ou latim. Durante os primeiros quatro séculos, o cristianismo expandiu-se por todo o Império Persa, indo além. Entretanto, só na Ásia os seguidores de Jesus depararam com religiões “mundiais”, bem estabelecidas e interculturais. O encontro com essas religlões zoroastrismo, budismo, hinduísmo, taoísmo quase sempre religiões estatais, era um desafio muito maior ao avanço do cristianismo que as religiões “étnicas”, menores e regionais da Europa e da África.

O cristianismo na Ásia teve cinco períodos de crescimento. Dacia questão de conveniência, lenda estão éstão Jdenticad identificados aqui com os gru pos que se destacaram em cada período: persa (primeiro milênio), franciscano-mongol (1206-1368), jesuíta (1542-1773), protestantes (1706-1950) e asiáticos autóctones (de 1950 até hoje). O primeipoe óifltiinio avanços mais eficazes estavam arraigados 20 compromisso dos asiáticos A na obra missionária PARAN transcultural a outros asiáticos, mas sem a intervenção da obra dos franciscanos, jesuítas e protestantes não se teriam lançado os fundamentos

Scott W. Sunquist para a obra missionária asiática mais recente, O cristianismo asiático é devedor aos monges missionários primitivos, que peregrinavam pela Ásia, aos missionários ocidentais e aos atuais missionários do Extremo Oriente. Crescimento no período persa Nos primeiros dias, o cristianismo difundiu-se na Ásia ao longo das rotas comerciais terrestres (antiga Rota da Seda) e marítimas. Algumas das primeiras comunidades cristãs estabeleceramse ao longo da costa sul da Índia, primeiro a sudeste e depois a sudoeste. Segundo tradições bastante confiáveis, o apóstolo Tomé viajou para a Índia e fundou comunidades cristãs primitivas, antes de ser martirizado por uma furiosa turba de hindus. O cristianismo sobreviveu a essas primeiras perseguições, mas as reações dos hinduístas e do próprio sistema de castas dos hindus limitaram em muito as oportunidades de testemunho cristão na Índia.

O idioma comum no comércio transasiático da época era o siríaco, um dialeto do aramaico, que era a língua materna de Jesus. Muitos dos missionários primitivos, fazedores de tenda, eram comerciantes de origem judaica e levavam consigo, além de seus produtos, a mensagem do Messias, quando viajavam ou se estabeleciam na Ásia Central. Nesse período, a Pérsia era arqui-inimiga do Império Romano (durante a dinastia Parta, de 247 a.C. a 226 continuando durante a dinastia Sasaniana, de 226-651 d.C.). Era difícil viajar através das fronteiras inimigas, de forma que a Igreja asiática se desenvolveu independentemente da Igreja Católica Romana (de fala latina), etinha não mais que um contato limitado coma Igreja Ortodoxa (de fala grega). Com isso, os cristãos persas estudavam em escolas monásticas próprias, em cidades como Nisibis, Mosulou Selêucia-Ctesiphon (no atual Iraque). Muitos haviam se convertido do dualismo zoroastria“no, por isso sua teologia se voltava mais para a pureza dos rituais, o conflito cósmico entre o bem e o mal e Deus como Criador de todas “as coisas. Os cristãos persas eram missionários

353 zelosos, Viajavam por toda a Ásia Central e chegaram à China com a intenção de pregar o evangelho, fundar monastérios e implantar igrejas.

Por volta do ano 635, o monge persa Alopen levou uma equipe de missionários à cidade de Xi''an, capital da dinastia Tang. O momento era oportuno para chegar a XY''an, pois a dinastia Tang era razoavelmente jovem e, por isso, aberta a ideias originárias do Ocidente. Assim, os monges persas (geralmente denominados nestorianos) foram convidados a traduzir as Escrituras numa casa bastante próxima à residência do imperador. Um documento público sobreviveu àquela época na forma do monumento Nestoriano, de mais de três metros de altura, do ano 781, Segundo esse monumento, foram fundados monastérios e igrejas por todo o país, e a nova religião foi bem recebida na China. Contudo, como acontece com frequência na Ásia, o cristianismo florescia ou era esmagado, conforme mudavam as dinastias, Nesse caso, quando a dinastia Tang entrou em declínio, iniciaram-se as perseguições às religiões estrangeiras (até mesmo ao budismo e ao zoroastrismo). O budismo acabou se adaptando e encontrando seu espaço na China, mas o cristianismo foi severamente perseguido durante séculos. A maioria dos povos do Ocidente esqueceu-se da presença cristã na China. O cristianismo sobreviveu na região, mas a adoração era realizada em siríaco, idioma que já não se compreendia.

De volta às terras de origem, na Pérsia, a conquista muçulmana árabe, por volta de 650, ofereceu aos cristãos, a princípio, liberdade de culto. Todavia, pouco a pouco foram acrescentadas restrições: as igrejas eram impedidas de ser reformadas, construídas ou remodeladas, e era proibido evangelizar ou se casar com alguém de fora da comunidade. Com essas restrições no cotidiano, na adoração nas viagens, chegou ao fim a campanha missionária persa ao Oriente, O cristianismo sobreviveu, mas foi minimizado por seu isolamento e pelas restrições.

[1% DO 354 Interlúdio franciscano-mongol O segundo período de crescimento foi breve e tinha um tema comum; domínios dinásticos redirecionam o desenvolvimento cristão. Os chineses foram conquistados pelos mongóis,os quais não faziam objeções às várias religiões que encontravam. Sob líderes como Gêngis e seu neto Kublai Khan, os mongóis conquistaram e absorveram culturas da Coreia à Polônia. Inocêncio IV (1245) enviou João de Carpini, da Ordem dos Frades Menores, mais para apaziguar que para converter os mongóis. Ele chegou em 1246 com uma carta do papa, implorando que Khan se convertesse, fosse batizado ese su-Jeitasse à autoridade papal. Essa estranha estratégia missionária serviu apenas para suscitar a ira de Guyuk Khan, cujos exércitos estavam de prontidão, às portas da Hungria. A resposta de Guyuk foi que o papa e os reis da Europa deveriam pagar tributos aos mongóis. Quando, em 1271, Marco Polo retornou de sua viagem de 17 anos entre os mongóis na China, Kublai Khan deu-lhe uma carta a ser entregue ao papa, pedindo que cem professores fossem enviados a fim de ensinar os mongóis a respeito do cristianismo. O pedido jamais foi atendido, poisos papas europeus estavam mais preocupados em se defender militarmente que em expandir o evangelho espiritualmente. A resposta ao pedido de Kublai, ainda que tímida e tardia (ele já havia falecido), veio por João de Montecorvino, que chegou a Khanbaliq (Pequim) em 1294. Montecorvino recebeu do novo Khan permissão para permanecer no país, pregar sua religião e traduzir sua mensagem. Sua nobre obra missionária durou até sua morte, 34 anos mais tarde (1328). Chegou à Europa a notícia de que a Igreja Católica Romana recebia apoio da corte imperial. Duas igrejas de maior porte e dois lares franciscanos foram construídos, e muitos mongóis foram batizados. Contudo, os mongóis eramos dominadores estrangeiros na China, eseu breve império começou a ruir em meados do século XIV. Quando o Império Mongol caiu, caíram também as pequenas e poucas comunidades católicas. O apoio da realeza é sempre transitório.

Cristianismo na Ásia Avanço jesuíta O terceiro período principal de avanço do cristianismo foi no tumultuado século XVI, As comunidades cristãs na Índia e na Pérsia continuavam pequenas, mas cheias de vida ede disposição. Entretanto, em sua maioria estavam isoladas do contato com outros cristãos. Quando os portugueses e espanhóis começaram a sair da península Ibérica, partiram com o anseio de realizar descobertas e fazer lucro, mas também com a ordem do papa de cristianizar asterras que fossem descobertas. À maioria dos navegadores portugueses tinha pouco interesse em atividades missionárias, mas levavam consigo, em seus navios, dominicanos, agostinianos, franciscanos e, mais tarde, jesuítas (Companhia de Jesus). Os missionários jesuítas voltaram a atenção primeiramente para o sul da Índia. Valendo-se das inovações e da criatividade de Francisco Xavier, exerceram pioneirismo também em Málaca, ilhas Molucas, Japão, Vietnã, Sião (Tailândia) e China. Em todas essas regiões e em diversos impérios, os jesuítas respeitaram os idiomas e culturas locais. Como resultado dessa estima, o trabalho deles perdurou. As igrejas jesuítas têm sobrevivido desde o século XVI, quase sempre em meio a grandes perseguições. Contudo, sua adaptação ao contexto cultural de cada região gerou polêmica.

Na China, o missionário italiano Matteo Ricci, insistia em que se fizesse uso de um nome local para Deus. Ele também permitiu que os católicos chineses continuassem a honrar seus ancestrais por meio de tábuas ancestrais, pois entendia que tais rituais eram uma expressão do quinto mandamento, e não de idolatria. Os outros católicos e o papa discordavam. Na Índia, Roberto de Nobili apresentou-se como um sannyasi, ou seja, alguém que renuncia aos confortos mundanos a fim de seguirum caminho espiritual. Dessa forma, ele vivia como um indiano piedoso que seguia a Cristo. Sua postura agradava tanto às castas inferiores quanto. as superiores, mas seus métodos entraram em choque com a Igreja. Alexandre de Rodes, ojesuíta francês que trabalhava no Vietnã, adaptou

seu Catecismo de oito dias às perguntas específicas feitas pelos confucionistas, budistas e taoístas (a chamada “tríplice religião”, ou tâm gido). Essa estratégia missionária tinha por objetivo compreender a cultura local e apresentaro ensinamento católico de um modo que não a ofendesse desnecessariamente, Também buscava preparar os nativos para a liderança das igrejas. Por razões diversas, as comunidades cristãs nesses países sofreram perseguições severas, No Japão, veio a Revolução Meiji, em 1603. Na China, o Império Qing representava o poder por volta de 1636. No Vietnã, havia hostilidades entre o Norte e o Sul, até que Gia Long unificou o país, em 1802. Na Índia, sofreram resistência por parte dos hindus e dos muçulmanos do Império Mughal. Diante de tudo isso,as comunidades cristãs tiveram dificuldades, mas sobreviveram sob liderança local. O advento do protestantismo O cristianismo protestante não teve início de fato até que a missão dano-germânica enviasse seus primeiros missionários, Bartolomeu Ziegenbalg e Henrique Plutschau, à Índia, em 1706. Esse trabalho, porém, não teve muita expressividade até as primeiras décadas do século XIX. Se por um lado os missionários católicos romanos eram patrocinados pelos reisda Espanha e de Portugal, por outro os missionários protestantes enfrentavam dificuldades com as companhias particulares que os transportavam para a Ásia: a Companhia Britânica das Índias Orientais e Companhia Holandesa das Índias Orientais. O trabalho protestante na Ásia diferia do católico romano em outros aspectos. Os protestantes dedicavam-se à tradução integral da Bíblia. De 1727 a 1920, os protestantes haviam traduzido a Bíblia para 50 idiomas asiáticos, e o Novo Testamento para outras 14 línguas. Os protestantes também enfatizavam mais o ensino, especialmente nos idiomas locais. Por toda a Ásia, os missionários protestantes prepararam o terreno para o que se tornou a moderna campanha universitária na Ásia, em meados do século XIX. Os protestantes na Ásia

também deram início a avanços pioneiros na área da medicina e trouxeram as técnicas mais recentes de inoculação, cirurgia e leprosário. Na educação, introduziram as ciências modernas e a matemática, além do estudo da Bíblia. Os protestantes apresentavam a ética popular, a vestimenta os hábitos ocidentais como parte da mensagem do evangelho. No entanto, boa parte da expansão do cristianismo na Ásia se deu graças aos próprios asiáticos. Com isso, a tendência era surgirem estilos e práticas regionais do cristianismo, enquanto os líderes nativos ensinavam a Bíblia nos idiomas locais, Na Coreia, por exemplo, os primeiros convertidos ao protestantismo viajaram à Manchúria para pedir ao tradutor da Bíblia, John Ross, que os acompanhasse e batizasse um grupo de coreanos. À conversão deles se deu pela leitura dos evangelhos, que foram traduzidas na China por Ross, com a ajuda de um corcano,

Uma das maiores tensões do trabalho missionário protestante na Ásia dizia respeito à necessidade de os asiáticos assimilarem ou não o conhecimento e a cultura ocidentais, ou se apenas a Bíblia e um ensino básico seriam apropriados, Muitos missionários mantiveram sua mensagem interligada com pressuposições ocidentais de imperialismo, progresso e superioridade da cultura ocidental, Eles impunham uma educação superior à moda ocidental, ensinando temas e conhecimento ocidentais. Outros concentravam-se mais nos princípios dos três “próprios” (sustento próprio, administração própria e propagação própria) e sé preocupavam menos com o desenvolvimento de escolas para educação superior e de instituições que necessitassem apoio externo. Na maioria dos lugares, o impacto maior das missões protestantes deu-se entre os grupos tribais mais pobres, entre os dalits (castas marginalizadas) e entre minorias. Foram fundadas igrejas protestantes, mas o principal período de crescimento ocorreu após a Guerra do Pacífico, à medida que as colônias se tornavam independentes. Conforme o domínio ocidental diminuía, o cristianismo na Ásia aumentava. O trabalho missionário foi

EE ESSES SE E EEE E

para 1. Dos primeiro quatro avanços, qual parece ser mais eficaz no estabelecimento da Igreja no 2. O autor menciona impedimentos políticos, econômicos e religiosos para o avanço do evangelho

na é a pior para a asiática atual? Por quê?

importante e estabeleceu os fundamentos, mas o maior trabalho e crescimento se deu sob a liderança asiática. Penetração interasiática Apesar de os asiáticos terem sempre um papel na expansão e no desenvolvimento do cristianismo na Ásia, a maior parte da história do avanço do cristianismo foi severamente tolhida sob o opressivo sistema meet do zoroastrismo, o sistema dhimmi do islamismo e o sistema de castas do hinduísmo. Neste pós-colonialismo ocidental e japonês, o cristianismo está se desenvolvendo em várias regiões da Ásia, com muito vigor. Nos lugares em que a religião nacional ainda é forte (Iraque, Irã, Arábia Saudita, Tailândia, Bangladesh e Israel), o cristianismo tem experimentado um crescimento lento ou mesmo uma redução. No entanto, na maioria dos países da Ásia, o cristianismo tem crescido, principalmente pelos esforços dos asiáticos. Boa parte do crescimento da Igreja na Índiase deve aos mais de 20 mil missionários indianos que atuam transculturalmente no próprio país. O cristianismo está forte como nunca, em países como Nepal, Camboja, Vietnã e Laos, por

contexto asiático?

Ásia. Qual dessas influências

causa dos missionários provenientes da Índia, Coreia, Malásia, Taiwan, China é Cingapura, Muitos asiáticos desempenham um ministério criativo em países estrangeiros, plantando igrejas enquanto se dedicam ao comércio, à trabalhos braçais e à manufatura. Dois dos principais exemplos são Coreia e China, Na Coreia do Sul, o cristianismo cresceu a ponto de se tornar quase um terço da população, desde que se separou do Norte. Na China, o cristianismo cresceu de cerca de 2 milhões, em 1950, para os mais de 60 milhões atuais, provavelmente o maior crescimento da história num lapso de duas gerações. Quase todo o crescimento se deve aos esforços dos chineses.

Hoje, numa situação inversa à dos primeiros sete séculos, os cristãos chineses estão convictos de que devem levar o evangelho ao Ocidente, tanto por terra quanto pelo mar. O projeto De Volta a Jerusalém é uma reversão da primeira campanha do cristianismo na Ásia, que levou o evangelho à China. Assim, o primeiro e o quinto projeto de expansão do cristianismo na Ásia partiram de uma margem para a outra: da Ásia Ocidental para a Ásia Oriental, e agora, da Ásia Oriental para a Ocidental.

Perguntas para estudo

1. Dos primeiro quatro avanços, qual parece ser mais eficaz no estabelecimento da Igreja no

contexto asiático?

2. O autor menciona impedimentos políticos, econômicos e religiosos para o avanço do evangelho na Ásia. Qual dessas influências é a pior para a igreja asiática atual? Por quê?', 44 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 5 · Leitura — Beaver, cap. 35: A história da estratégia missionária', '4 história da EM

Ê. E

euuuua R. PIERCE BEAVER foi professor emérito da Universidade de Chicago. Ele se especializou em história das remota in da Missionary Research Library, nã cidade de Nova York. Beaver é autor de vários livros, entre eles, All Loves Excelling [Todos os amores excede), a E marie

Extraído de Southwestem Jourmalof Theology, v. 13, n. 2, primavera 1970, Usado com permissão,

estratégia missionária 3 5

R. Pierce Beaver OQ uinze séculos de ação missionária precederam o aparecimen-

das missões mundiais protestantes. À ação missionária não começou, portanto, de novo e, de acordo com a teoria católica romana moderna, constitui apenas o último capítulo de uma longa história. Estas páginas apresentam um resumo histórico da estratégia missionária antes de surgirem os esforços protestantes e traçam rapidamente o curso da estratégia protestante. Infelizmente, por falta de espaço, omitiremos por completo as missões católicas romanas modernas. Bonifácio O primeiro exemplo de uma estratégia missionária bem desenvolvida, de acordo com a interpretação do termo no século XX, foi a empregada na missão inglesa ao continente europeu por Bonifácio, no século VIII. Bonifácio pregou aos pagãos germânicos numa língua parecida com a deles, de modo que puderam entendê-lo. Ele foi bastante agressivo: desafiou os deuses deles, destruiu seus santuários, cortou as árvores sagradas e edificou igrejas em locais sagrados. Contudo, teve seus convertidos e os educou e civilizou. Bonifácio fundou mosteiros que não só tinham instituições acadêmicas, como também programas para ensinar agricultura, pastoreio e economia doméstica ao povo.

Isso tornou possível a existência de uma sociedade estável, de UMa igreja bem fundamentada e de um bom sistema de formação cristã. Numa segunda linha de instituições educacionais e de ciências domésticas, Bonifácio trouxe freiras da Inglaterra. Esse foi o primeiro caso de mulheres formal e ativamente engajadas na obra missionária. O clero e os monges foram recrutados do meio do povo, Toda essa atividade foi apoiada pela igreja da Inglaterra. Bonifácio enviava relatórios e pedidos. Ele discutia estratégia com os que haviam ficado em sua pátria, Os bispos, os monges e as freiras enviavam, por sua vez, pessoal, dinheiro e suprimentos a Bonifácio. Também envolveram a missão em orações intercessórias.

Essa verdadeira obra missionária infelizmente deixou de existir Por causa da devastação que invasores causaram ao povo da Inglaterra, À missão no continente transformou-se num verdadeiro instrumento de expansão imperial, tanto política quanto eclesiástica,

R. Plerce Beaver pois foi empregada pelos reis francos, por seus sucessores germânicos, pelo imperador bizantino é pelo papa. Em razão disso, os reis escandinavos não permitiam que os missionários do continente entrassem em seus países. Preferiam confiar a evangelização aos missionários ingleses, que eram seus súditos ou não tinham conexões políticas. As Cruzadas À série de guerras europeias contra os muçulmanos, as Cruzadas, dificilmente pode ser considerada uma forma de verdadeira missão. Elas tornaram as missões junto aos muçulmanos quase impossíveis até o dia de hoje por causa da herança de ódio que deixaram em terras islâmicas. Mesmo assim, antes de as Cruzadas acabarem, Francisco de Assis falou com amor ao sultão e criou uma força missionária a fim de pregar em amor e paz. Raimundo Lúlio, o grande franciscano, desistiu de seu status na nobreza da corte de Aragão e dedicou sua vida à obra missionária entre os muçulmanos, conhecido como Louco de Amor. Ele convencia e convertia pela razão, usando o instrumento do debate. Para esse fim, escreveu o seu Magna, com a intenção de responder de maneira convincente a qualquer pergunta ou objeção que pudesse ser feita pelos muçulmanos ou pagãos. Idealizou uma espécie de computador intelectual, em que os diversos fatores podiam ser registrados, e a resposta certa aparecia. Lúlio implorou incessantemente, durante muitas décadas antes de seu martírio, a papas e reis que criassem colégios para o ensino da língua árabe e outras para treinamento de missionários erecomendou-lhes muitos esquemas para o envio deles ao estrangeiro. A expansão colonial O cristianismo só veio a ser uma religião mundial. por estar ligado à expansão dos impérios português, espanhol e francês no período do século XVI ao XVIII. Quando o papa dividiuas terras não cristãs, já descobertas ou a descobrir, entre as coroas de Portugal e Espanha, impôs

257 aos monarcas a evangelização dos povos daquelas terras, bem como a obrigação de estabelecer a Igreja e mantê-la. As missões transformaram-se, portanto, numa função governamental.

Os portugueses construíram um império comercial e, com exceção do Brasil, mantiveram sob seu domínio direto apenas pequenos territórios. Ali suprimiram as religiões étnicas, expulsaram a classe alta, que opunha resistência, e criaram uma comunidade cristã composta dos descendentes mestiços e convertidos das classes inferiores da sociedade.

A Espanha empenhou-se em transplantar o cristianismo e a civilização, ambos de acordo com o modelo espanhol. A exploração cruel acabou com os indígenas do Caribe e estimulou uma luta heroica pelos direitos dos indígenas remanescentes, por parte de Bartolomeu de las Casas e outros missionários. Desde então, a defesa do povo primitivo contra a exploração pelos brancos e pelos governos coloniais tem sido uma importante função das missões. Depois que aquele poderoso esforço aboliu a escravidão e o batismo forçado, os missionários foram transformados em civilizadores e protetores dos indígenas. À missão era estabelecida em regiões remotas, tendo um posto central ao redor do qual se formava uma cidade, para onde os indígenas se dirigiam a fim de fixar residência. Ali havia, quase sempre, uma pequena guarnição de soldados a fim de proteger os missionários e os indígenas cristãos. Postos avançados e cidades menores eram ligados ao posto central. Os indígenas recebiam instrução de catequistas e eram supervisionados por sacerdotes na vida cultual da igreja. Eram ativamente envolvidos na participação dos cultos, servindo como acólitos, cantores e músicos. As festas populares foram cristianizadas, e as festas e jejuns cristãos, introduzidos. Oficiais civis nativos ocupavam diversas funções de supervisão sob o controle cuidadoso dos missionários. Fazendas e sítios foram formados, e os indígenas recebiam as instruções necessárias sobre pastoreio e agricultura. Os indígenas, portanto, foram preservados, civilizados e cristiânizados,

e não mortos ou desalojados, como aconteceu mais tarde nos Estados Unidos. Infelizmente, quando o governo percebeu que as missões haviam civilizado os indígenas, elas foram “secularizadas”. Os missionários foram substituídos pelo clero diocesano, geralmente de qualidade inferior e pequeno em número. As autoridades governamentais passaram a dirigir tudo, mas sem ter amor pelo povo. As terras foram distribuídas entre os colonizadores espanhóis, e os indígenas, aos poucos, foram relegados à condição de peões.

A política francesa no Canadá contrastou com a da Espanha. Apenas uma pequena colônia foi criada para servir de base para o comércio e como fortaleza contra os ingleses. Os franceses queriam as peles e outros produtos das florestas e, consequentemente, perturbaram o menos possível a civilização indígena. Os missionários tiveram de desenvolver uma estratégia consoante com essa política. Por isso, conviveram com os indígenas em suas vilas, adaptando-se às condições na medida do possível, pregando, ensinando, batizando, realizando os rituais da igreja, permitindo que os convertidos continuassem a ser índios. Algumas cidades permanentes foram fundadas, com igreja e escola, nas regiões fronteiras ao território francês, mas a maioria dos habitantes viviam ali temporariamente.

Do outro lado do globo, no que veio a ser a Indochina francesa, atual Vietnã, região que passou para o domínio francês bem mais tarde, uma estratégia evangelística radicalmente nova foi idealizada por Alexandre de Rhodes. A inovação foi necessária porque os missionários franceses foram perseguidos e expulsos da região por longos períodos. A evangelização só poderia ser realizada por agentes nativos. Rhodes criou uma ordem de evangelistas nativos leigos que viviam sob voto e conquistavam convertidos aos milhares, Animados com a experiência, Rhodes e seus companheiros fundaram a Sociedade de Missões Estrangeiras de Paris, dedicada à política de recrutar e treinar um clero diocesano, cujos membros constituiriam os agentes principais na evangelização do país e no cuidado pastoral

das igrejas, em vez de se tornarem missionários TEssa política obteve enorme sucesso. As estratégias missionárias do século XVII Os primeiros teóricos das missões modernas surgiram no século XVII, associados áquela grande expansão da fé, entre eles José de Acosta, Brancati e Thomas a Jesu, Eles escreveram manuais de princípios e práticas missionárias, descreveram as qualificações dos missionários e os ensinaram a trabalhar com o povo. Em 1622, foi criada em Roma a Sagrada Congregação para a Propagação da Fé, Essa entidade passou então a dar orientação central às missões católicas romanas e criou colégios e institutos para treinamento missionário.

Os corajosos inovadores desse período foram os jesuítas, que seguiram para o Oriente através dos canais portugueses, mas desafiaram as restrições de Portugal. Eram homens de várias nacionalidades e foram os pioneiros modernos na acomodação, aculturação, adaptação ou autoctonia como queiram chamar esse processo. A primeira tentativa deu-se no Japão, onde os missionários adaptaram casas, trajes, a maioria dos costumes e a etiqueta do convívio social japonês. Eles não usaram, no entanto, os termos, conceitos, formas ou rituais xintoístas e budistas na apresentação do evangelho nem no estabelecimento de igrejas. Fizeram grande uso do modo de falar japonês na produção da literatura cristã, impressa na gráfica da missão pelos convertidos japoneses. À parte mais pesada da evangelização e do ensino foi assumida por diáconos e catequistas nativos. Alguns poucos foram admitidos no sacerdócio. Logo surgiu uma grande comunidade cristã. Quando oxógum,no século XVII, temendo agressão estrangeira, fechouo Japão a todos os estrangeiros e perseguiu o cristianismo, milhares de cristãos sofreram o martírio. O cristianismo ocultou-se e sofreu até que o Japão se abriu para o intercâmbio com o Ocidente, dois séculos mais tarde.

Em Madurai, no sul da Índia, uma segunda experiência foi muito além. Roberto de Nobi acreditava que a casta dos brâmanes tinha de

ser conquistada Índia para que o cristianismo obtivesse sucesso na Ele se tornou então um cristão brâmance. Vestia-se como guru (mestre religioso), observava as leis e os costumes da casta e aprendeu o sânscrito, De Nobili estudou as principais escolas da filosofia hindu e apresentou a doutrina cristã tanto quanto possível em termos hindus. Ele é um dos pouquíssimos evangelistas a levar um grande número de brámanes à conversão.

À tentativa de acomodação mais notável foi na China, Matteo Ricci estabeleceu uma estratégia, e ela foi desenvolvida por Schalle Verbiest, seus sucessores como dirigentes da missão. Assim como no Japão, os missionários adotaram o estilo de vida do país e os fundamentos da civilização chinesa, mas foram muito além e aos poucos introduziram princípios c doutrina cristãos por meio de conceitos confucionistas. Eles permitiam que os convertidos se envolvessem em rituais relacionados com os ancestrais e com o Estado, considerando-os de caráter social e civil, em vez de religioso. Os missionários exerceram tremenda influência como matemáticos, astrônomos, cartógrafos e mestres em diversas ciências, apresentando assim o conhecimento ocidental aos chineses, fazendo amizade com pessoas influentes e descobrindo oportunidades de apresentar a fé. Eles serviram o imperador em muitos ofícios. Tudo isso tinha um único propósito: abrir o caminho para oevangelho. À estratégia foi coroada de êxito, e desenvolveu-se ali uma grande comunidade cristá,da qual faziam parte até mesmo pessoas influentes que ocupavam cargos importantes.

Outros missionários, entretanto, não conseguiam valorizar nada que não fosse europeu e eram totalmente apegados à terminologia e às práticas tradicionais católicas romanas. Motivados por ciúmes nacionalistas e partidários, atacaram os jesuítas e os acusaram em Roma, que finalmente se pronunciou contra os princípios Jesuítas, proibiu suas práticas e exigiu que todos os missionários que seguissem para o Oriente jurassem conformidade a essas determinações. “Os cristãos foram proibidos de praticar rituais

familiares e cívicos. Tornou-se assim impossível que um cristão fosse ao mesmo tempo cristão genuíno e chinês verdadeiro. À profissão da fé cristã parecia atacar as raízes da piedade filial, que erao próprio fundamento da sociedade chinesa. Dois séculos depois, o juramento foi abolido, e os rituais modificados, permitidos. Os jesuítas perderam a batalha, mas venceram a guerra. Hoje, quase todos os missionários de todas as igrejas reconhecem a necessidade da acomodação. Os puritanos da Nova Inglaterra: missões aos índios americanos À participação dos protestantes em missões mundiais começou cedo no século XVII, simultancamente com a obra evangelística dos capelães da Companhia das índias Orientais Holandesas e as missões da Nova Inglaterra entre os indígenas americanos. Às missões eram uma atividade da companhia comercial, porém muitos de seus capelães foram autênticos missionários. Eles tiveram pouca influência na estratégia missionária posterior, mas foram as missões dos puritanos entre os índios que forneceram às missões posteriores inspiração e exemplos. O alvo dos missionários era pregar o evangelho de maneira tão efetiva que os indígenas se convertessem, aceitassem a salvação individualmente e se reunissem em igrejas onde pudessem ser alimentados na fé debaixo de uma disciplina estrita. À intenção era transformar o indígena num cristão do mesmo tipo e com o mesmo caráter do puritano inglês, membro de uma igreja congregacional. Isso implicava civilizar o indígena de acordo com o modelo britânico.

A evangelização foi o primeiro item na estratégia. À pregação constituía o “grande meio” e era suplementada pelo ensino. A maioria dos missionários seguia o exemplo de John Eliot e começava com a pregação pública, embora Thomas Mayhew Jr. obtivesse muito êxito em Martha''s Vineyard, começando com uma aproximação lenta e individual. Pesados sermões doutrinários sobre a ira de Deus e os sofrimentos do inferno, iguais aos que seriam apresentados a uma igreja inglesa, eram dirigidos aos indígenas.

David Brainerd, porém, à semelhança dos morávios, pregava o amor de Deus mais que sua ira. Seu ministério conduziu muitos homens e mulheres ao arrependimento,

O segundo ponto da estratégia consistiu em reunir os convertidos em igrejas, mas os novos cristãos tinham de passar por longos anos de experiência antes que as primeiras igrejas fossem organizadas, mas na segunda fase das missões indígenas, na década de 1730, essa demora já não era mais imposta, e as igrejas foram rapidamente reunidas e organizadas. Antes e depois da organização das igrejas, os convertidos recebiam instruções e eram disciplinados na fé.

A terceira ênfase estratégica foi o estabelecimento de cidades cristãs. John Eliot e seus colegas missionários acreditavam que a segregação e o isolamento eram necessários para que os convertidos crescessem na graça. Elestinham de ser removidos da influência perniciosa de seus irmãos pagãos e dos homens brancos ruins. Pensava-se que em “cidades puramente cristãs de índios fiéis” os novos membros poderiam conviver em harmonia sob a disciplina estrita e a educação cuidadosa dos missionários brancos e dos pastores e professores indígenas. Isso garantia o que Cotton Mather chamava “um modo de vida mais decente e inglês”.

A cristianização e a civilização seriam simultâneas e indistinguíveis. Eliot implantou em suas cidades uma forma bíblica de governo baseada em Exodo 18, mas a Corte Geral de Massachusetts, que deu a terra e construiu a igreja e a escola, em 1658 designou comissários para supervisionarem as cidades. Dentro delas, os indígenas viviam sob uma aliança firmada entre eles e o Senhor, e tanto a vida pessoal quanto a vida comunitária eram reguladas por leis influenciadas pelos ensinos bíblicos.

A maior parte das cidades dos índios cristãos não conseguiu sobreviver à devastação da Guerra do Rei Filipe, em 1674, mas a estratégia da cidade cristã especial ressurgiu quando John Sergeant fundou a missão de Stockbridge, em 1734, Stockbridge não era um lugar tão fechado quanto aquelas primeiras cidades. Havia

A iStÓrIA da estratégia MisSIONárIA constante movimento entre a cidade e à Noresta, até mesmo de grandes distâncias, Os cristãos de Stockbridge podiam ser, portanto, agentes evangelísticos em seus relacionamentos naturais.

Não importa o que tenha sido alcançado no desenvolvimento do caráter cristão nas primei. ras cidades, o fato é que nenhuma influência evangelística podia ser exercida por seus habitantes, pois estavam separados dos outros indígenas. Durante o século XIX e início do XX, os missionários entre os povos primitivos da África e das ilhas continuavam enamorados da ideia de garantir a pureza da fé e da conduta dos convertidos por meio da segregação em vilas e distritos cristãos. Essa prática teve como efeito alienar os cristãos de seu próprio povo, criando uma espécie de sociedade “mestiça”, nem nativa nem europeia, e impedindo qualquer impacto evangelístico sobre o restante da população. Um povo separado não pode contagiar os outros com sua fé.

No centro de cada cidade ou posto missionário havia uma igreja com uma escola ao lado. Os sermões aos domingos e as reuniões de oração, a catequização e a educação elementar em geral, tudo se inclinava a educar o convertido na fé e na civilização.

O Indian Catechism [Catecismo indígena], de John Eliot, foi o primeiro livro publicado numa língua indígena americana. Usava-se tanto o vernáculo quanto a língua inglesa. O inglês facilitava aos indígenas o ajustamento à sociedade dos brancos, enquanto o idioma nativo era mais eficiente para a compreensão das verdades cristãs. Eliot criou livros de texto em ambos os idiomas.

Os índios aprenderam a ler e escrever e a fazer as operações mais simples de aritmética, além de receberem instrução bíblica e religiosa. Técnicas agrícolas e artesanato doméstico também foram introduzidos para que os índios pudessem obter sustento num estilo de vida estabelecido e civilizado. No segundo século dessa missão, considerações estratégicas levaram John Sergeant a introduzir o colégio interno, a fim de que os jovens pudessem ser totalmente separados

R. Pierce Beaver da velha vida e criados dentro da nova. Essa instituição também víria a ser também um recurso estratégico importante para as missões do século XIX.

Os puritanos da Nova Inglaterra merecem o crédito de nunca ter duvidado do poder transformador do evangelho nem da capacidade em potencial dos indígenas. Eles esperavam que pelo menos alguns alcançassem o padrão dos ingleses. Por isso, foi preciso mais que a educação rudimentar das cidades. Alguns jovens promissores foram enviados à Boston Latin Grammar School e uns poucos foram matriculados na Faculdade Indígena da Universidade Harvard. O colégio interno de Sergeant, em Stockbridge, e a escola de Eleazer Wheelock, em Lebanon, Connecticut foram alguns dos esforços mais bem elaborados em prol de uma educação em alto nível.

O culto, a educação espiritual e a educação secular, tudo exigia uma literatura vernácula de dimensões mais ou menos extensas. Para isso, Eliot produziu uma Bíblia e criou uma biblioteca variada, para a qual alguns de seus colegas contribuíram.

O recrutamento e treinamento de pastores e professores nativos foram absolutamente fundamentais para a estratégia missionária da Nova Inglaterra. Tanto os missionários quanto seus patrocinadores perceberam que apenas os agentes nativos podiam evangelizar com eficiência e proporcionar cuidado pastoral ao seu povo. Em 1700, havia 37 pregadores indígenas em Massachusetts, Infelizmente, as antigas cidades indígenas cristãs entraram em decadência por causa da contínua pressão dos brancos. Com isso, diminuiu também a oferta de pastores e professores até a extinção. É Os efeitos mais duradouros das missões indígenas dos séculos XVII e XVI talvez fossem dois. Primeiro: inspiraram numerosas vocações missionárias, quando as histórias de Eliote de Brainerd foram lidas. Segundo: proporciona-ram ao grande empreendimento protestante no estrangeiro seu programa estratégico inicial, Constava desse programa evangelização por

261 (o meio da pregação, organização de igrejas, educação com vistas ao crescimento cristão, processo de civilização em termos europeus, tradução de Bíblias, produção de literatura, uso da língua vernácula e recrutamento e treinamento de pastores e professores nativos. A Missão Dinamarquesa de Halle Às missões americanas entre a população indígena foram sustentadas por sociedades missionárias organizadas na Inglaterra e na Escócia, mas os missionários não foram enviados a partir da Grã-Bretanha. À primeira missão a enviar missionários da Europa foi a Missão Dinamarquesa de Halle. Em 1705, o rei da Dinamarca começou a enviar missionários luteranos alemães à colônia de Tranquebar, no litoral do sudeste da Índia. O líder pioneiro Bartolomeu Ziegenbalg desenvolveu uma estratégia que se tornou um legado para as futuras gerações de missionários. Contudo, ele estava muito à frente de seu tempo, sob muitos aspectos. Ele destacavao culto, a pregação, a catequese, a educação, o trabalho de tradução e a produção de literatura vernácula. Ziegenbalg foi pioneiro no estudo da filosofia e da religião hindu, percebendo a grande importância desse conhecimento para a evangelização e para o crescimento da igreja, mas as autoridades na Alemanha negaram o valor dessa atividade. Essa missão logo acrescentou o trabalho médico ao programa. Também foi a primeira a usar a poesia tâmil no culto.

O mais famoso dentre os missionários de Halle, depois de Ziegenbalg, foi um dos últimos: Christian Frederick Schwartz, que dedicou sua vida ao ministério na parte sul da Índia controlada pelos ingleses. Ele exerceu enorme influência sobre os indianos de todas as religiões e europeus de diversas nacionalidades, militares e civis, Sua estratégia era singular e não planejada. Embora fosse um europeu na aparência, Schwartz realmente se transformou num guru amado e respeitado por todos. Pessoas de todas as religiões e castas reuniam-se à sua volta como discípulos, sem levar em conta. as diferenças sociais que havia entre elas.

am A NitÓIA dá estrAtógIa MNISSTONAFIA

Qu As missões morávias A estratégia mais notável aplicada no século XVII foi a da Igreja Morávia, desenvolvida sob a direção do conde Zinzendorfe do bispo Spangenberg. Em 1734, começou-se a enviar missionários aos povos mais desprezados e negligenciados. Esses missionários deviam sustentar-se por conta própria. À proposta levou à criação de indústrias e negócios que não só mantinham a obra, mas também colocavam os missionários em íntimo contato com o povo. Esse sistema de automanutenção, porém, não podia ser aplicado aos índios americanos, por isso as colônias comunais, como as de Bethlehem, na Pensilvânia, e Salém, na Carolina do Norte, foram fundadas com base numa grande variedade de atividades artesanais, cujo lucro sustentava a missão.

Os missionários morávios foram instruídos a não aplicar a “medida de Herrnhut” (isto é,os padrões dos morávios alemães) aos outros povos ea ficar alertas para reconhecer as principais qualidades e características concedidas por Deusa esses povos. Além disso, os missionários deviam atuar como cooperadores do Espírito Santo. Deviam ser principalmente mensageiros, evangelistas e pregadores. Em vez de destacar as pesadas doutrinas teológicas, estavam incumbidos de contar a história simples do evangelho do amor de Deus e agir para conciliar os nativos em Cristo, nosso Salvador, que viveu e morreu por toda a humanidade. Na providência de Deus, chegaria a época em que o Espírito Santo introduziria convertidos na Igreja em grande quantidade. Enquanto isso, os mensageiros missionários iriam colher os primeiros frutos. Se não fossem ouvidos, deveriam partir para outro lugar. Na verdade, os missionários só iam embora quando perseguidos ou expulsos. Eram notavelmente pacientes e não desistiam com facilidade. O Grande Século das missões protestantes Dessas iniciativas pioneiras, surgiu o grande empreendimento missionário protestante no estrangeiro do século XIX, Ele tomou forma

inicial na Inglaterra com a fundação da Sociedade Missionária Batista por William Carey, em 1792. À organização havia começado nos Estados Unidos em 1787, e agora havia cerca de duas dezenas, todas tendo por objetivo a evangelização mundial, Contudo, os assentamentos nas regiões recém-desbravadas do território americano e os índios absorviam todos os seus recursos. Um movimento estudantil, em 1810, resolveu finalmente o problema e se lançou às missões estrangeiras com a formação da Junta Americana de Comissionados para Missões Estrangeiras. À Convenção Trienal da Denominação Batista para Missões Estrangeiras foi organizada a seguir, em 1814, e depois, em 1816, a Sociedade Unida de Missões Estrangeiras.

Às novas sociedades e juntas começaram seu trabalho com pressuposições e métodos estratégicos herdados das missões entre os indígenas americanos e da Missão Dinamarquesa de Halle. Durante muitos anos, os diretores nacionais pensaram saber tudo sobre o trabalho a ser executado, e instruções detalhadas eram passadas às mãos de cada missionário que embarcava para o campo. Cerca de meio século depois, descobriu-se que os experimentados missionários no campo podiam formular melhor a estratégia e a política, que podiam ser então ratificadas pela junta no país de origem. Em 1795, houve um choque de estratégias entre dois homens de forte personalidade na Sociedade Missionária de Londres. Um deles queria enviar missionários ordenados e de elevado nível cultural a países de civilização e religiões desenvolvidas. O outro queria enviar missionários artesãos, submissos a um superintendente ordenado, aos povos dos mares do Sul, para cristianizá-los e civilizá-los. Os dois objetivos acabaram sendo aceitos.

Mesmo em países de cultura elevada, como a Índia e a China, os missionários acentuaram o objetivo “civilizador”, como seus colegas em regiões primitivas, por considerarem a cultura local degenerada e supersticiosa uma barreira à cristianização, Durante as primeiras décadas não houve qualquer debate sobre a legitimidade

da ênfase na função civilizadora das missões. Houve debate apenas acerca das prioridadesso que vem primeiro, cristianização ou civilização? Alguns argumentavam que um certo grau de civilização era necessário para ajudar o povo a entender e aceitar a fé. Outros argumentavam que se podia começar com a civilização, uma vez que o evangelho inevitavelmente produzia um desejo de civilização. Muitos acreditavam que os dois itens interagiam mutuamente e podiam ser igual e simultaneamente destacados.

A Índia logo recebeu o maior grau de atenção das juntas e sociedades missionárias, ca estratégia e táticas ali desenvolvidas foram copiadas e aplicadas em outras regiões. O trio batista “Serampore” de Carey, Marshman e Ward, teve grande influência no período inicial. Embora procurasse conversões individuais, Carey desejava também promover o crescimento deuma igreja independente, bem sustentada por leigos alfabetizados que lessem a Bíblia e administrada e pastoreada por um ministério nativo culto. Esse gênio autodidata não se contentouem criar escolas elementares, mas fundou uma faculdade. O rei da Dinamarca (Serampore era uma colônia dinamarquesa) deu-lhe licença para a criação de uma faculdade, que permitia o funcionamento de cursos superiores de teologia, cujos diplomas seriam reconhecidos. Em Serampore, havia escolas para os indianos cas crianças estrangeiras. O vasto programa detradução e impressão da Bíblia não apenas nas línguas vernáculas indianas, mas até em chinês

ressaltava a alta prioridade dessa obra entre todos os protestantes. Outras publicações foram produzidas para as igrejas. O trio também demonstrou a importância da pesquisa acadêmica para ação e a estratégia missionárias, produzindo materiais linguísticos necessários a todos cassumindo a liderança no estudo do hinduísmo,

Além disso, os três homens trabalharam pela transformação da sociedade com o impacto do evangelho e criaram um poderoso método de reforma social, que pressionava o governo colonialista e conduzia os hindus a considerações esclarecedoras sobre velhos erros e sua eliminação.

Esses homens foram influentes na abolição do entree (ato em que a viúva éra queimada viva na pira crematória de seu marido), da prostituição nos templos e outros costumes desumanos, Carey também introduziu o jornalismo moderno, publicando jornais e revistas em bengali e inglês. Ele estimulou o renascimento da literatura bengali. Sem dúvida, a tarefa da missão com base em Serampore foi bastante abrangente.

À semelhança de Roberto de Nobili antes dele, o escocês Alexander Duff acreditava que o povo indiano em geral só poderia ser ganho para Cristo se a casta brâmane fosse a primeira a ser levada a nosso Senhor. Ele tentou ganhar os jovens brâmanes por meio de um programa de educação superior na língua inglesa. Onde ele obteve amplo sucesso, outros falharam, porém sua iniciativa resultou numa forte tendência de se criar escolas e faculdades em língua inglesa. Elas produziram poucos convertidos, mas deram aos cristãos das classes inferiores uma oportunidade de progresso social e econômico que contribuiu para o bem-estar das igrejas. Para satisfação do governo colonial, produziram também funcionários que falavam inglês, utilizados no serviço civil e nas casas comerciais. Essa educação logo consumiu grande parte dos recursos das missões.

Ao mesmo tempo, sem qualquer planejamento estratégico, desenvolveram-se imensos postos missionários centrais bem povoados, onde os convertidos se aglomeravam na dependência econômica e social dos missionários. Se alguém aceitasse o cristianismo sem que houvesse a conversão de todo o seu grupo social, ele era expulso da família e perdia seus meios de sobrevivência. Para manter tais pessoas vivas, elas eram empregadas como funcionários, professores e evangelistas do centro. À igreja tomou um aspecto de superprofissionalização, e os leigos eram pagos para desempenhar tarefas que cabiam a voluntários. Essa prática defeituosa foi repassada a missões de outras localidades. No posto principal, ficavam a igreja-mãe, as escolas, o hospital e geralmente a gráfica. Um missionário era o pastor e dirigente da comunidade.

e En Esse sistema tinha pouco espaço para um pastor nativo, como queria William Carey,e não havia igrejas organizadas nas vilas situadas a mais de 80 quilômetros interior adentro, apenas pontos de pregação. Em 1854-1855, Rufus Anderson realizou uma viagem de verificação à Índia e ao Ceilão (atual Sri Lanka). Ele levou os mis= sionários da Junta Americana com a tarefa de acabar com os imensos postos centrais, organizar igrejas nas vilas e ordenar pastores nativos para essas igrejas. Determinou também que a educação na língua vernácula fosse a regra geral, e a educação em inglês, a exceção. Os estrategistas missionários do século XIX Os dois maiores teóricos e estrategistas de missões do século XIX também foram os diretores executivos das maiores agências missionárias. Henry Venn ocupou o cargo de secretário geral da Sociedade Missionária Londrina, e Rufus Anderson, o de secretário para o estrangeiro da Junta Americana de Comissionados para Missões Estrangeiras. À estratégia missionária de Anderson dominou a obra missionária americana por mais de um século, enquanto à de Venn se destacou no cenário britânico. Os dois homens chegaram, cada um por sua vez, praticamente aos mesmos princípios básicos e nos anos posteriores acabaram influenciando um ao outro. Juntos, eles estabeleceram como objetivo estratégico reconhecido da missão protestante a famosa “tríplice fórmula da autonomia”, com a qual as missões britânicas e americanas consentiram desde meados do século XIX até a Segunda Guerra Mundial. O alvo das missões era fundar igrejas e patrocinar seu desenvolvimento, a fim de que viessem a ser autogovernadas, autossuficientes e autônomas na propagação do evangelho.

Rufus Anderson era congregacionalista, e Venn, episcopal anglicano, mas ambos edificaram a igreja regional de baixo para cima, Venn queria que a nomeação de um bispo fosse o remate do processo do desenvolvimento, pois assim haveria um clero nativo adequado euma igreja sustentada pelo povo. Anderson protes-

A história da estratágia missionária tava contra o destaque dado à “civilização” é contra a tentativa de reformar a sociedade da noite parao dia, Para ele, essa mudança deveria ser resultado da ação do fermento do evangelho na vida da nação, Ele fundamentou sua estratégia nos métodos de Paulo, conforme registra o Novo Testamento.

De acordo com Anderson, a tarefa do missionário era pregar o evangelho e reunir os convertidos em igrejas. Ele seria sempre um evangelista, e nunca um pastor ou dirigente. As igrejas tinham de ser organizadas imediatamente com os convertidos que demonstrassem mudança de vida em relação a Cristo, sem aguardar que atingissem o padrão esperado dos cristãos americanos com 2 mil anos de passado cristão. Essas igrejas tinham de ser dirigidas por pastores nativos e desenvolver uma política própria, local e regional. Os missionários seriam os conselheiros, irmãos mais velhos na fé para os pastores e o povo.

Anderson e Venn ensinavam que, quando as igrejas estivessem funcionando bem, os missionários deveriam partir para “regiões mais remotas” e recomeçar o processo evangelístico. À questão principal da fundação de igrejas deveria ser evangelização e missões. Às igrejas se engajariam espontaneamente na evangelização local e na missão de enviar missionários a outros povos. Uma missão deveria produzir outra missão. No conceito de Anderson, a educação na língua vernácula teria apenas o propósito de servir a igreja ou desenvolver um grupo de leigos de alta qualidade e um ministério adequadamente treinado. Todas as formas auxiliares de trabalho deveriam ser apenas para a evangelização e para a edificação da igreja.

As missões britânicas resistiram à opinião de Anderson sobre a educação no idioma vernáculo. Todavia, de modo oficial ou não, as missões americanas adotaram a estratégia dele ena teoria se apegaram ao seu sistema por mais de um século, Contudo, depois de sua morte passou-se a enfatizar a educação secundária e superior em língua inglesa num grau ainda maior. Isso se deu em parte por causa do darwinismo

ii social, que converteu os americanos à doutrina do progresso inevitável e levou à substituição da antiga escatologia pela ideia de que o Reino de Deus chegaria por influência de institui ções cristãs, como as escolas. Também no fim do século XIX, um segundo grande objetivo estratégico foi acrescentado, de maneira mais ou menos explícita, à tríplice fórmula da autonomia, a saber, a fermentação e transformação da sociedade por efeito dos princípios cristãos e do espírito cristão do serviço, infundidos na vida comum. Os colégios e faculdades seriam essenciais para se atingir esse objetivo.

John L. Nevius, missionário presbiteriano em Shantung, idealizou uma estratégia que modificou um pouco a de Anderson, dando mais responsabilidade aos leigos. Ele defendia a ideia de deixar o leigo em sua profissão ou negócio e em seu lugar costumeiro na sociedade. Ele devia ser encorajado a participar como voluntário, um evangelista não remunerado. Nevius também defendia um estudo bíblico constante e uma mordomia rigorosa em combinação com o trabalho voluntário e propôs um governo eclesiástico simples e flexível. Seus irmãos na China não adotaram seu sistema, porém os missionários na Coreia fizeram uso dele com espantoso sucesso. Uma mentalidade colonialista Apesar da adesão permanente declarada à fórmula de Anderson-Venn, houve uma grande mudança na mentalidade missionária e, consequentemente, na estratégia do último quarto do século XIX. Sob a influência de Venn, as missões britânicas na África Ocidental buscaram: 1) a criação de uma igreja independente, com clero próprio, que evangelizasse o interior do continente; 2) a criação de uma elite africana, isto é, uma intelectualidade e uma classe média que formasse uma sociedade e uma economia que sustentassem essa igreja e sua missão, Quase imediatamente após o fim da liderança de Venn, os missionários executivos e de campo adotaram o ponto de vista de que os africanos eram inferiores e não conseguiriam fornecer uma

a liderança ministerial, tendo esta de ser então indefinidamente mantida pelos europeus. O intelectual é o homem de negócios da classe média africana foram desprezados. Essa opinião imperialista constituiu uma variante eclesiástica do apego crescente à teoria da “responsabilidade do homem branco” e reduziu a igreja nativa a uma colônia da igreja estrangeira que a implantara.

Algo muito semelhante ocorreu na Índia, na década de 1880. Os americanos e outros foram contagiados pela mentalidade colonialista dos britânicos. Às missões germânicas, sob a orientação de seu principal estrategista, o professor Gustav Warneck, desejavam simultaneamente a criação das Volkskirchen, as igrejas nacionais, mas até que seu desenvolvimento pleno fosse atingido, as igrejas seriam mantidas sob a autoridade dos missionários. O paternalismo deformou o desenvolvimento. Desse modo, todas as missões, na passagem do século, eram paternalistas e colonialistas. Essa infeliz situação durou até que alguns estudos e pesquisas realizados para a Conferência Missionária Mundial de Edimburgo, em 1910, subitamente destruíram a complacência e a inércia. Eles revelaram que a igreja nativa era um fato e se mostrava indócil sob o domínio paternalista. Em razão disso, depois da conferência houve um tremendo impulso no sentido de a organização missionária devolver a autoridade para a igreja, e praticamente todas as juntas e sociedades pelo menos se comprometeram com esse ideal. Evangelismo, educação e medicina Em resumo, a estratégia missionária do século XIX (até a Conferência de Edimburgo, em 1910), tinha por alvo as conversões individuais, a fundação de igrejas e a transformação social com base em três tipos principais de ação, que vieram a ser conhecidos como evangelização, educação e medicina. À evangelização incluía a pregação em todas as suas formas, a organização de igrejas e o apoio a estas, tradução de Bíblias, produção de literatura e distribuição de Bíblias e literatura.

Na área da educação, as escolas industriais destacaram-se no começo, mas acabaram abandonadas por causa do desejo de uma educação acadêmica. Por volta do final do século, um vasto sistema educacional existia nos países asiáticos, indo do jardim de infância à faculdade até mesmo de medicina e de teologia. A África, no entanto, foi negligenciada no que se refere à educação secundária e superior.

Os primeiros médicos que seguiram parao estrangeiro foram enviados a missão principal de cuidar das famílias dos outros missionários, mas logo se descobriu que o serviço médico junto ao povo em geral despertava boa vontade e abria as portas para a evangelização. Porisso, ele veio a tornar-se um ramo importante da obra missionária. Só em meados do século XX é que os serviços de saúde prestados em nome e no espírito do Médico dos médicos passaram a ser considerados em si mesmos uma forma dramática de pregar o evangelho. Muito antes disso, porém, até mesmo o missionário evangelístico rural já levava consigo uma maleta de médico em suas andanças.

Com esse mesmo espírito de ajuda geral e cultivo da boa vontade, além de querer melhorar a base econômica da igreja, os missionários introduziram aves domésticas, gado de melhor qualidade e sementes selecionadas em novos tipos de plantação. A grande indústria da fruticultura foi introduzida em Shantung desse modo.

Quanto às outras religiões, a estratégia missionária mostrou-se agressiva, procurando sua substituição pela conversão total das pessoas. Esse espírito agressivo diminuiu no finaldo século, e uma espécie de apreciação pela obra de Deus nas outras religiões desenvolveu-se lentamente até que, em 1910, muitos passaram a considerá-las “luzes defeituosas”, que precisavam ser consertadas em Cristo e usadas como pontes para o evangelho.

Os costumes dos povos do Oriente tornavam quase impossível aos missionários do sexo masculino falar às mulheres e por isso também era difícil chegar às crianças. As esposas dos

PA NIRÓA A EStPARÉgIA INISSTONATIA missionários esforçaram-se por criar escolas para meninas e penetrar nos lares, aposentos de mulheres e haréns, mas não tinham liberdade suficiente por causa dos próprios afazeres domésticos e filhos e não podiam viajar. Uma estratégia realista exigia que se cuidasse adequadamente das mulheres e crianças, porém as juntas e sociedades resistiam tenazmente ao envio de mulheres solteiras ao estrangeiro. Finalmente, em desespero de causa, na década de 1860 as mulheres começaram a organizar suas sociedades e a enviar mulheres solteiras. Uma dimensão totalmente nova foi assim acrescentada à estratégia missionária: o vasto empreendimento de alcançar mulheres e crianças com o evangelho, educar meninas e proporcionar cuidados médicos adequados às mulheres.

As mulheres então começaram a frequentar as reuniões da igreja, e seus filhos menores as acompanhavam. À educação feminina provou sera força mais eficaz para a libertação e elevação social da mulher. A dedicação das missionárias aos serviços médicos obrigou as juntas que mantinham diferentes trabalhos a elevar o nível de qualidade do serviço médico e a destacar mais ainda o conhecimento de medicina. Em vista desses dois grandes empreendimentos das mulheres americanas, no que foram seguidas pelas britânicas e europeias, abriu-se para as mulheres do Oriente o campo que constitui hoje suas profissões de maior prestígio: o serviço na área de saúde (médicas e enfermeiras) eo magistério. Boa vizinhança E preciso citar outro aspecto da estratégia missionária do século XIX: a prática da cortesia. Os missionários enviados pelos batistas do sul dos Estados Unidos foram alguns dos que estabeleceram e praticaram a política de boa vizinhança, À boa mordomia de homens e de recursos financeiros era objeto de alta prioridade entre as juntas e sociedades missionárias. O desperdício era detestado, e havia um forte desejo de aproveitar ao máximo os recursos. À prática da boa vizinhança tinha o objetivo de

R. Pierce Beaver fazer com que alguma agência se responsabilizasse pela evangelização de cada pedaço de território ainda não explorado e de cada pessoa. Era igualmente intenção deles evitar a ocupação duplicada de uma região (exceto nas grandes cidades), sobrepondo programas missionários, de modo que a competição fosse eliminada com as diferenças denominacionais, que confundiriam os habitantes c atrapalhariam a evangelização. Respeitavam-se os territórios ocupados, cas missões recém-chegadas procuravam uma área não explorada. Esse costume produziu o “denominacionalismo geográfico”, mas a expectativa geral era que, no momento em que os missionários partissem para as “regiões mais remotas”,os nacionais juntassem os diferentes pedaços numa igreja nacional diferente de qualquer uma das igrejas fundadoras.

As missões concordavam que todas se reconhecessem como ramos válidos da Igreja única de Cristo, no batismo, na transferência de membros, na disciplina, nos salários ena mudança de obreiros nacionais. Esses acordos levaram a uma cooperação maior no estabelecimento de juntas regionais e nacionais que atuariam no arbitramento de conflitos entreas missões e para a união de projetos de tradução da Bíblia, casas publicadoras, escolas secundárias, faculdades, escolas normais e escolas de medicina. Uma estratégia eficiente exigia cada vez cooperação em tarefas que seriam realizadas com mais eficácia por meio de esforço conjunto. Conferências missionárias urbanas, regionais e nacionais em quase todos os países proporcionavam ocasiões para a discussão eo planejamento das parcerias. Consultas e conferências A colaboração nos campos missionários deu origema consultas e planejamento em escala cada vez maior nos países que enviavam missionários. A Conferência Missionária Mundial de Edimburgo, em 1910, inaugurou uma série de grandes conferências: Jerusalém (1928), Madras (1938), Whitby (1947), Willingen (1952) e Gana (1957-1958). Nessas conferências, foram

267 (4 estabelecidos, em parte, os rumos da estratégia que foi então aplicada a nível local, por meio de estudos e discussões mais aprofundados nas organizações nacionais e regionais, O Concílio Missionário Internacional foi organizado em 1921 e englobava as conferências missionárias nacionais (como à Conferência de Missões Estrangeiras da América do Norte, em 1892) os concílios cristãos nacionais (como o Concílio Nacional de Igrejas, da China), Assim, estabeleceu-se um sistema universal em diversos níveis para o estudo voluntário de problemas e planejamento de estratégia em comum, realizado por um exército de juntas missionárias soberanas. Em 1961, o Concílio Missionário Internacional veio a se transformar na Divisão de Missão Mundial e Evangelização, do Concílio Mundial das Igrejas.

De 1910 até a Segunda Guerra Mundial, o mais notável desenvolvimento de estratégia foi colocar cada vez mais a igreja nacional numa posição-chave, dando-lhe total independência e autoridade e desenvolvendo a colaboração entre as igrejas ocidentais e as mais novas. “A igreja autóctone” e a “cooperação na obediência” foram lemas que expressaram o impulso da estratégia predominante. Os participantes da Conferência de Jerusalém, em 1928, definiram a igreja autóctone, destacando a acomodação cultural, A Conferência de Madras, em 1938, reafirmou a definição e enfatizou o testemunho de Cristo num “relacionamento direto, claro e íntimo com a herança cultural e religiosa do país”. Whitby, em 1947, apresentou o ideal da “cooperação na obediência”. Da Segunda Guerra Mundial em diante Uma estratégia missionária radicalmente diversa, baseada no apóstolo Paulo, foi apresentada por Roland Allen em seus livros Missionary Methods: St. Pauls or Qurs? [Métodos missionários: o de Paulo ou os nossos?] e The Spontancous Expansion of''the Church [A expansão espontânea da Igreja], mas ele não conquistou seguidores, a não ser depois da Segunda Guerra Mundial, quando os missionários das missões

para 1. Desde que este artigo foi escrito, cristãos evangélicos têm realizado consultas, reconhecendo que “chegou uma nova era de missões mundiais”, Dentre esses encontros, os mais notáveis fomeios, caminhos e métodos” você espera que esses encontros ofereçam? Dados apresentados 2. Descreva com suas próprias palavras as estratégias missionárias empregadas por três indivi3. Beaver descreve detalhes missões puritanas índios da Nova Inglaterra, Estados Unidos. Que efeitos esses esforços tiveram sobre as iniciativas missionárias posteriores?

268 de fé passaram a adotar de modo especial o padrão de Allen. Esta é, em resumo, sua estratégia: o missionário comunica o evangelho e transmite à nova comunidade de convertidosos ensinos mais simples acerca da fé, da Bíblia, dos sacramentos e do princípio do ministério. Em seguida, ele se coloca de lado, como um irmão mais velho, um conselheiro, enquanto o Espírito Santo orienta a nova igreja autogovernada eautossubsistente para desenvolver formas próprias de política, ministério, culto e vida. Uma igreja assim é espontaneamente missionária. À teoria de Allen era aplicável a trabalhos pioneiros. As antigas juntas e sociedades ocupavam de igrejas antigas e acomodadas, raramente buscando campos novos e não alcançados.

Às organizações missionárias nos campos foram sendo dissolvidas uma após outra. Os recursos foram colocados à disposição de igrejas e do pessoal missionário designado para dirigi-las.

Às juntas e sociedades ocidentais quase não produziram algo novo em termos de estratégia, porém muito fizeram para desenvolver novos métodos: missões agrícolas ou de desenvolvimento rural, algumas indústrias urbanas, meios de comunicação de massa, literatura mais ef-

e discutidos nas três consultas mencionadas

duos e três organizações.

A história da estratégia missionária ciente, Essa foi a etapa final de uma missão que estivera em progresso por 300 anos, Agora, o mundo já não se achava mais dividido entre cristianismo e paganismo. Já não podia mais haver uma missão unilateral do Ocidente para o resto do mundo. À base para uma missão já foi estabelecida em quase todos os países, pois neles existe uma igreja e comunidade cristãs com a obrigação de levar o evangelho a todo o mundo. Chegou a hora de uma nova missão mundial com uma estratégia radicalmente nova. À revolução que varreu as regiões não ocidentais do mundo durante e depois da Segunda Guerra Mundial inequivocamente acabou com o antigo regime das missões protestantes.

Chegou uma nova era de missões mundiais, uma era na qual as outras religiões também estão ocupadas em missões mundiais, Uma nova compreensão de missão, uma nova estratégia, uma nova organização, novos meios, caminhos e métodos são as necessidades desta hora na tarefa central da Igreja, tarefa que jamais terminará até que o Reino de Deus se manifeste em toda a sua glória. Enquanto oramos, estudamos, planejamos e experimentamos, será de grande ajuda conhecer a história passada da estratégia missionária.

Perguntas para estudo

1. Desde que este artigo foi escrito, cristãos evangélicos têm realizado consultas, reconhecendo que “chegou uma nova era de missões mundiais”, Dentre esses encontros, os mais notáveis fo- ram os de Berlim (1966), Lausanne (1974), Pattaya (1980) e Edimburgo (1980). Que “novos meios, caminhos e métodos” você espera que esses encontros ofereçam? Dados apresentados e discutidos nas três consultas mencionadas estão registrados em outro parte desta obra.

2. Descreva com suas próprias palavras as estratégias missionárias empregadas por três indiví-

duos e três organizações.

3. Beaver descreve com detalhes as missões puritanas entre os índios da Nova Inglaterra, nos Estados Unidos. Que efeitos esses esforços tiveram sobre as iniciativas missionárias posteriores?', 45 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 5 · Leitura — Pierson, cap. 36: Uma história de transformações', 'Uma ma história história

“Vim mms PAUL PIERSON é professor sêniorde missões e estudos latino-americanos da School of World Mission do Fuller Theological Seminar. Ele foi deão da School of World Mission de 1980 a 1992, Trabalhou como evangelista e professor de seminário no Brasil e em Portugal e pastoreou duas igrejas nos Estados Unidos.

de de t transformações 3 6

Paul Pierson Ai de Jesus Cristo, especialmente seu braço missionário,

costuma entender a transformação da sociedade como parte essencial de sua tarefa. Uma vez que o foco das missões sempre foi comunicar as boas novas de Cristo, chamar os povos ao arrependimento, à fé e ao batismo, os cristão sempre entenderam que sua tarefa estará cumprida quando os povos tiverem aprendido a “guardar todas as coisas” que Cristo ordenou. À expectativa de ver as pessoas obedecendo a Cristo sempre nutriu a esperança de que o auge desse processo de evangelização acarretaria a transformação das situações sociais, das condições físicas e da vida espiritual dos crentes. Em certas ocasiões, as mudanças foram notáveis; em outras, decepcionantes. Contudo, mesmo havendo desentendimentos e erros culturais, o desejo de aproximar os indivíduos e a sociedade da conformidade com o Reino de Deus continua a fazer parte das missões.

Muitos missionários foram trabalhar em culturas que já estavam em processo de transformação. Eles ajudaram produzir alguma mudança, em geral canalizando-a de modo positivo ou atuando contra alguns de seus aspectos mais difíceis. Outros concebiam modelos de comunidades transformadas que se pareciam bastante com as que eles conheciam sua cultura de origem. Contudo, não há dúvida de que essa dimensão transformadora era um aspecto essencial das missões e, em grande parte, até benéfico.! Monasticismo: comunidade de preservação e transformação Quase todos os missionários, do século IV ao século XVIII, eram monges. Embora a maioria dos movimentos monásticos fosse expressamente missionária, alguns não eram, mas quase todos acarretavam transformações sociais significativas.

Havia dezenas de movimentos monásticos, entre eles os henedi,;moç e os movimentos que nasceram a partir destes; os nestorianos,

Sa ÇÃO que passaram da Ásia Menor para a Arábia ipa e Índia dE e atravessaram a Ásia Central até a China; os ortodoxos, que rumaram para 0 norte, em direção aos Bálcãs e à Rússia; os celtas, que surgiram na Irlanda e depois foram para a Escócia e Inglaterra e, em seguida,

William Hutchinson, Errand to the World (Chicago: University of Chicago, 1987).

ema “John Stewart, The Nestorian Missionary Enterprise (Edinburgh: T and T Clark, 1928), p. 26.

VEN voltaram ao continente; mais tarde, os francis canos, os dominicanos e OS jesuttas,

Embora os Beneditinos não fossem intencionalmente missionários, eles e outros grupos se deslocavam para lugares onde a fé cristã ainda não havia chegado, formando comunidades que demonstravam e ensinavam a fé às tribos “bárbaras”, passando para a Europa Centrale Ocidental. À intenção original do monasticismo era encorajar homens a desenvolver uma vida de disciplina e de oração, longe das preocupações da vida normal. À maioria dos mosteiros, porém, e as casas para mulheres que logo surgiram, tornaram-se comunidades autossuficientes organizadas em torno de regras para a vida diária que incluíam o trabalho e a adoração. O trabalho, nos campos e na biblioteca, era tanto manual quanto intelectual. Tratava-se de um conceito revolucionário no mundo antigo, onde o trabalho manual era tarefa de escravos. Os monges também se tornaram estudiosos, de modo que, pela primeira vez, o prático e o teórico foram incorporados às mesmas pessoas. Assim, os monges são considerados os primeiros estudiosos de mãos calejadas! Essa condição ajudoua criar um ambiente favorável ao desenvolvimento científico, e os mosteiros tornaram-se centrosde fé, de aprendizado e de progresso técnico.

A contribuição do monasticismo para o aprendizado é bem conhecida, mas seu impacto no desenvolvimento agrícola não é tão amplamente reconhecido. Ian Hannah escreveu que, no século XVII, “eram os monges que possuíam habilidade, capital, organização e fé no futuro para empreender grandes projetos de recuperação de campos desolados havia muito tempo pelo sistema escravagista da vida aldeã e das hordas bárbaras Imensos terrenos não cultivados e brejos foram, pelas mãos dos mosteiros, transformados em excelentes terras agrícolas”?

No século XII, os cistercienses retiraram-se da sociedade e foram cultivar novas terras em luga-

A história de trANSTOIMAÇÕES res desertos. Eles desenvolveram novos métodos de administração agrícola e tornaram-se 08 maio res produtores de lá da Europa e fornecedores de matéria-prima para a indústria têxtil.

Os nestorianos, que floresceram do século V ao século XII, atravessaram a Ásia Central atéa Índia e a China. Os cristãos do Ocidente conhecem muito pouco sobre esse interessante movimento porque a maioria dos frutos de seu trabalho se perdeu, Contudo, como certo estudioso destacou, “os missionários nestoríanos introduziram as letras e o ensino entre povos analfabetos, entre eles os turcos, os vigures,os mongóis e os manchus, povos que afirmam terem seus alfabetos derivados do siríaco,a língua dos nestorianos”.

Os monges ortodoxos da Igreja oriental fizeram o mesmo. Ulfilas deslocou-se paraonortedo Danúbio, no século IV, e foi o primeiroaconverter uma língua do norte da Europa à forma escrita, fazendo-o, é claro, para traduzir as Escrituras. No século III, os armênios foram o primeiro grupo nacional a adotar o cristianismo, e, em 406, sua língua foi convertida à forma escrita para que as Escrituras e outras obras cristãs se tornassem acessíveis. Constantino (depois conhecido como Cirilo) e seu irmão Metódio foram para os Bálcãs e ali desenvolveram dois alfabetos para traduzir as Escrituras e estabelecer a Igreja. O alfabeto cirílico ainda é usado na Rússia hoje.

Patrício, ao retornar da Inglaterra para a Irlanda, iniciou o notável movimento missionário celta, que continuaria por séculos e seria uma fonte de fervor e de ensino missionário. Seus descendentes espirituais foram da Irlanda para a Escócia e, depois, para a Inglaterra

cruzando o canal para as terras baixas e, finalmente, chegaram à Alemanha Central. Posteriormente, foram instrumentos na conversão da Escandinávia. Eles combinavam um amor profundo pelo aprendizado, pela disciplina espiritual e pelo fervor missionário. Como resultado, “a Irlanda foi alfabetizada pela primeira vez na

“The Theology of Missions in the Puritan Tradition (Grand Rapids: Eerdmans, 1965). "Gary Sattles, Gods Glory, Neighbor''s Good (Chicago: Covenant, 1982), p.9.

PaulPierson geração de Patrício”,* O grande mosteiro de Fulda, também dessa tradição, fundado por Bonifácio no século VIII, tornou-se o principal centro de ensino para grande parte da Alemanha.

Durante o Renascimento Carolíngio, na época de Carlos Magno, os mosteiros de tradição celta tornaram-se mais uma vez os grandes centros de educação e de transformação. Hannah escreveu:

Como um todo, na condição de fermento

cristão numa sociedade rude, eles eram ca-

pazes de alcançar seu objetivo para plantar e

preservar a cultura cristã, como um jardim cul-

tivado em meio a um ermo de desordem. Precursores do movimento missionário protestante Durante quase dois séculos depois da Reforma,os protestantes engajaram-se em todo tipo deatividade missionária fora da Europa, mas no finaldo século XVI surgiram diversos movimentos, cujos membros tentavam renovara Igreja e levara Reforma adiante, da doutrina para a vida. Essesmovimentos formariam a plataforma de lançamento para as missões protestantes. Dentre eles, podemos citar o puritanismo, O pietismo,o moravianismo e os avivamentos wesleyanos/evangélicos.

Os puritanos concentravam-se na conversão e numa vida cristã mais autêntica. Eles também desenvolveram a primeira teologia missionária protestante. Dois de seus principais representantes missionários foram Richard Baxter, pastor eficiente e prolífico escritor, e John Eliot. Este foi para a Nova Inglaterra e tornou-seum missionário eficaz entre as tribos indígenas dos algonquinos, traduzindo a Bíblia para a língua deles e formando várias vilas cristãs. A respeito de Eliot, Sydney Rooy comenta:

“Ele viajava a pé e a cavalo, exaurindo sua

força ao extremo para levar o evangelho “Edward Stimson, Renewal in Christ (New York: Vantage,

aos nativos, Ele apresentava tribunal as

demandas deles para evitar as fraudes com

as terras indígenas; pedia clemência para os

prisioneiros condenados; lutava contra a ven-

da de índios à escravidão; defendia terras e

ribeiros para uso indígena; estabelecia escolas

para crianças e adultos indígenas; traduzia

livros tentava mostrar quão profundo era

o humanitarismo que acompanhava seu zelo

pela salvação.*

Na hora certa, o pietismo lançou os alicerces para mudanças maiores. No século XVII, a Guerra dos Trinta Anos havia devastado a Alemanha. À miséria prevalecia, a desigualdade social era acentuada, a qualidade de vida e da compreensão cristã era baixa. Além disso, a Igreja Luterana estava sob o domínio do Estado. À verdade da fé era vista em termos de proposições, em vez de atos e exigências éticas eexperienciais. Assim, diante da irrelevância da Igreja e do abrangente desespero e do ateísmo acarretados pela Guerra dos Trinta Anos, o cristianismo logo perdeu seu poder transformador e restaurador.”

Philip Jacob Spener, influenciado pelos escritores puritanos em seus estudos teológicos, deplorou a situação de suas paróquias quando se tornou pastor em Frankfurt, Ele começou a reunir grupos de cristãos em sua casa para discutir sermões, estudar a Bíblia, orar e prestar apoio mútuo. Iniciou, assim, um movimento chamado “pietismo” por seus oponentes.

Spener insistia em que o cristianismo consiste não apenas de conhecimento, mas também da prática da fé. À sua ênfase na necessidade do novo nascimento e de uma vida santa, ele acrescentava uma grande preocupação pelos necessitados.

A.H. Francke, como líder do movimento, foi o sucessor de Spener. Ele ensinava que o novo nascimento deveria levar os regenerados a 1979), p. 147. 7

Dubose Classics of Christian Mission (Nashville: Broadman, 1979), p. 776. À "John W. Bready, This Freedom Whence (New York: American Tract Society, 1942), p. 113.

o, 272 promover mudanças na sociedade e no mundo, Para ele, fé e ação eram inseparáveis. Ele demonstrou isso de forma notável, pela influência que exerceu sobre a Universidade de Halle e sobre sua paróquia, em Glaucha. Piedade significava preocupação genuína pelo bem-estar espiritual e físico do próximo. Assim, os petistas alimentavam, vestiam e educavam os pobres. Francke estabeleceu escolas para crianças pobres, até mesmo para meninas uma novidade na época. Ele também fundou um orfanato e outras instituições para amparar os pobres. Essas instituições eram sustentadas apenas pela fée tornaram-se, depois, modelo para o ministério de George Mueller, em Bristol, e na Missão para o Interior da China.

Os Ásia primeiros missionários protestantes air para a pertenciam ao movimento pietista. Influenciado por seu capelão real, um pietista, Frederico IV, da Dinamarca, enviou dois homens de Halle à sua colônia em Tranquebar, na Índia. Bartolomeu Ziegenbalg e Henrique Plutschau foram os primeiros, dentre cercade 60 pietistas, que trabalharam na Índia no século XVIII. Ziegenbalg, que permaneceu naquele país até a sua morte, em 1719, era notavelmente holístico em sua compreensão da tarefa. Ele estudou as crenças e práticas religiosas dos hindus, traduziu as Escrituras, plantou uma igreja, advogou a favor da ordenação de pastores indianos, fundou uma editora e estabeleceu duas escolas.

O maior dos seus sucessores, C.F Schwartz, não só edificou a igreja, mas trabalhou com órfãos e se tornou um embaixador da paz entre os governantes muçulmanos e britânicos. Ele chegou em 1750 e permaneceu ali até sua morte, em 1798. Um grande missiólogo alemão escreveu que “o pietismo foi o pai das missões aos pagãos e também de todas essas agências salvadoras que têm surgido na cristandade para curar os males religiosos, morais e sociais

uma combinação já demonstrada por À. H. Francke”

Francis (Org.),

uma nistoria de transformações

Os morávios, com raízes no movimento hussita, da pré-Reforma, e também no pietismo, fundaram um dos mais notáveis movimentos da história da Igreja. Conhecidos por sua vigilia ininterrupta de cem anos, constituíam uma comunidade quase monástica, disciplinada e composta basicamente de homens e mulheres casados, pessoas dedicadas a ganhar “almas parao Cordeiro”. Nos primeiros anos de sua existência, um de cada 14 membros se tornou missionário, não raro nos campos mais difíceis.

O quarto rio que leva ao movimento missionário protestante fluiu do avivamento rwesleyano/evangélico, na Inglaterra, com John Wesley, seu líder mais conhecido, eo Primeiro Grande Avivamento, na América do Norte. Visto que o avivamento da América do Norte, em muitos aspectos, teve origem no puritanismo, examinaremos apenas o movimento da Inglaterra.

Mesmo antes da conversão, os Wesleys e outros membros do Clube Santo, em Oxford, demonstravam preocupação pelos pobres e pelos prisioneiros. Ao mesmo tempo, buscavam as disciplinas espirituais, o que lhes rendeu a alcunha de “metodistas”.

John Wesley começou a pregar imediatamente após sua conversão, em 1734. Enquanto o foco incidia sobre o evangelismo e o crescimento cristão, especialmente entre os pobres negligenciados, ele escreveu: “O cristianismoé essencialmente uma religião social. Fazer dele: uma religião solitária é, de fato, destruí-lo”? O impacto do movimento na reforma social da Inglaterra é bem conhecido. Robert Raikes criou a escola dominical para ensinar ascrianças pobres a ler e dar-lhes instrução moral e religiosa no único dia da semana em que não trabalhavam. Outros organizaram escolas entre mineiros e carvoeiros. John Howard trabalhou incansavelmente para a reforma das terríveis condições nas prisões locais e apresentou ao Parlamento leis para a reforma carcerária.

Os evangélicos trabalharam para controlar o trabalho infantil nas fábricas emergentes e

promoveram a educação das massas, Um grupo de abastados anglicanos de Clapham, subúrbio de Londres, investiu seu tempo, sua fortuna e as influências políticas em projetos religiosose sociais, como a longa e bem-sucedida campanha de William Wilberforce e outros para abolira escravidão no Império Britânico, À Sociedade Missionária Eclesiástica, a maior das sociedades anglicanas, foi estabelecida em 1799, Várias outras sociedades foram estabelecidas, todas motivadas pelo avivamento. O movimento missionário protestante É com justiça que William Carey é chamado Pai das Missões Protestantes, ainda que outros antes dele tenham se engajado na obra missionária. Em 1792, ele formou a Sociedade Missionária Batista. No ano seguinte, embarcou para a Índia, Seus escritos e seu exemplo foram os catalisadores na criação de sociedades semelhantes, tanto na Europa quanto nos Estados Unidos, levando-nos, portanto, ao que tem sido chamado o Grande Século das missões. Seu principal objetivo era levar os povos à fé pessoalem Jesus Cristo e à salvação eterna. Contudo, ele não via conflito algum entre esse alvo e suas outras atividades nas áreas de educação, agricultura e botânica.

Carey esforçou-se muito para suportar os males sociais e promover mudanças na Ásia, Ele é mais conhecido como horticultor que como missionário. Ele lutou bravamente contra a prática do infanticídio, da queima de viúvas, do tratamento desumano aos leprosos (muitas vezes enterrados ou queimados vivos) e contra as mortes desnecessárias nas grandes peregri“nações da época. Ele também fundou a Faculdade de Serampore, cujo principal propósito era formar pastores e professores, mas também proporcionar educação nas áreas de literatura Cristã e ciência europeia, Falso reconhecimento Muitos movimentos missionários do século XIX trabalharam intencionalmente por transformação Social, a maioria sem reconhecimento, exceto

sob uma luz negativa ou falsa. Por exemplo, no Seminário Andover, Samuel Mills e seus colegas da Reunião de Oração do Monte de Feno tomaram a iniciativa de estabelecer a Junta Americana de Comissionados para Missões Estrangeiras, em 1810, Um dos primeiros campos escolhidos foi o Havaí (então conhecido como ilhas Sandwich).

Aqueles primeiros missionários foram difamados por James Michner, mas a realidade era muito diferente do retrato que ele pintou, O principal objetivo deles era a conversão de homens e mulheres a Cristo e a reunião dos convertidos nas igrejas, mas também trabalharam para proteger o povo havaiano da exploração sexual e econômica dos marinheiros e mercadores que aportavam nas ilhas.

Os missionários trabalharam para dar fim ao infanticídio e a outras práticas destrutivas. Depois de algumas décadas, as ilhas estavam pontilhadas não só de igrejas, mas também de escolas. Nestas, as crianças havaianas eram ensinadas por professores havaianos. Alguns anos depois, outros missionários criaram um sistema de escrita da língua baseado em caracteres romanos, traduzindo a Bíblia e vários livros. Por volta de 1873, já haviam sido publicados 153 livros e 13 revistas, além de um almanaque na língua local. Uma comparação marcante Muitos missionários menos conhecidos têm demonstrado grande preocupação pela totalidade da carência humana. Um deles foi Willis Banks, evangelista presbiteriano, muito pouco conhecido, que trabalhou numa região remota do sul do Brasil. Ele foi o primeiro a construir com alvenaria na região. Trazia crianças para viver com sua família, ensinava-as a ler e então as enviava de volta a fim de poder ensinar outras. Usando um guia de medicina doméstica, tratou infecções, tuberculose, malária, verminoses e subnutrição.

Banks introduziu métodos mais eficazes de agricultura e de cuidado pecuário e construiu a primeira serraria na região. Instalou também o

Emílio Williams, Followers of the New Faith (Nashville: Vanderbilt University, 1967), p. Paul Pierson, 4 Younger Church in Search of Maturity (San Antonio, Trinity University, 1974), 107-8.

am O e ii A aa o DES primeiro maquinário para cortar silagem. Um antropólogo que visitou a região 20 anos depois da morte de Banks fez uma comparação marcante do desenvolvimento comunitário resultante desse trabalho. Ele visitou duas vilas isoladas, ambas em condições praticamente idênticas, cujos habitantes apresentavam o mesmo histórico étnico e cultural. A vila de Volta Grandeera presbiteriana e fora beneficiada com o evangelismo e a liderança de Banks. Seus habitantes viviam em casas de tijolo e de madeira, usavam filtros de água e, em alguns casos, produziam a própria eletricidade, Possufam canoas e lanchas motorizadas para viajar até a cidade mais próxima e cultivavam verduras e legumes, além das tradicionais plantações de arroz, feijão, milho, mandioca e banana. Possufam dois rebanhos de gado leiteiro e produziam e consumiam leite, queijo e manteiga. Eles recebiam e liam jornais e tinham a Bíblia e outros livros à disposição. Todos os moradores eram alfabetizados. À comunidade construiu uma escola com recursos acumulados, a qual foi doada ao Estado sob a condição de que este providenciasse e pagasse um professor. Consequentemente, havia ali uma excelente escola de ensino fundamental, e muitos de seus formandos continuavam os estudos na cidade, Cultos religiosos eram realizados três vezes por semana, embora o pastor pudesse visitá-los apenas uma vez por mês.

Os habitantes de Jipovura, a outra vila, viviam em casas de pau a pique e sem mobília. Sua agricultura era rudimentar, e ninguém fervia ou filtrava a água. Não possuíam canoas, usavam pequenas lamparinas de querosene para iluminação e eram, na maioria, analfabetos. Uma escola fora doada por algumas famílias japonesas que por algum tempo haviam morado na região, mas o povo não demonstrou interesse em mantê-la, por isso depredaram o edifício e roubaram suas portas e janelas. O tempo de lazer era ocupado com baralho e cachaça. O alcoolismo era comum.!º

ra à Quase todos os movimentos missionários se preocuparam com a transformação social, de uma forma ou de outra, atitude vista como parte do ministério de comunicar e viver o evangelho. Sempre houve grande ênfase na educação, na saúde, na agricultura e nos ministérios de edificação social para meninas, mulheres e outros membros negligenciados ou oprimidos da sociedade. Estabelecimentos de ensino As instituições de ensino cristãs em geral têm três objetivos: formar lideranças para a igreja, ser um instrumento de melhoria da sociedade e evangelizar alunos não cristãos. Os graus de sucesso variam, mas podemos citar estes exemplos: Os grupos tribais do nordeste da Índia, que se tornaram cristãos dedicados no final do século XIX, apresentam o segundo maior índice de alfabetização do país. Em 1915, a taxa de analfabetismo entre os católicos nominais do Brasil oscilava entre 60% e 80%, enquanto entre os protestantes (geralmente os mais pobres) o índice correspondia a um quarto desse percentual." A maioria das escolas da África, durante o período colonial, foram estabelecidas por missionários. Lesslie Newbigin relata que, na década de 1950, um documento de 400 páginas apresentado à ONU sobre a educação na África nem sequer fez menção fato de que 90% das escolas daquele continente existiam por causa dos missionários. Muitas universidades de destaque da Ásia são resultado de trabalho missionário, como a Universidade de Yonsei e a Universidade Ehwa para Mulheres, em Seul. Ao apresentar um relatório sobre o trabalho educacional da Missão Basel, na Costa

p.

do Ouro (Gana), a Comissão Phelps-

Stokes afirmou, em 1921:“Os esforços

educacionais da Missão Basel na Costa

"Dourada produziram um dos sistemas

escolares mais interessantes e eficazes já

observados na África. Primeiro: suas

oficinas mecânicas treinaram e emprega-

ram um grande número de nativos

Segundo: as atividades comerciais alcan-

çaram a vida econômica do povo, influen-

ciando suas atividades culturais e seus

gastos com alimentação e vestuário”.

Além das escolas missionárias de ensino

fundamental e médio, instituições para

formação de professores foram estabele-

cidas, a fim de expandir as oportunidades

de educação. Missões médicas No início do movimento, um conhecimento mínimo de medicina muitas vezes era exigido dos missionários. Em meados do século XIX, porém, vários médicos formados começaram a trabalhar campo missionário. O primeiro foi o dr. John Scudder, enviado à Índia pela Junta Americana. A neta dele, a dra. Ida Scudder, depois estabeleceu talvez o maior de todos os centros médicos missionários, em Vellore, na Índia. O dr. Peter Parker introduziu a cirurgia ocular na China. Seu sucessor, o dr. John Kerr, “publicou 12 artigos médicos em chinês, construiu um grande hospital e foi o primeiro acriar na China uma instituição para tratamento de doentes mentais, Na Tailândia, os presbiteria"nos estabeleceram 13 hospitais e 12 centrosde distribuição de medicamentos. Preocupação com os pobres e oprimidos Além dos ministérios educacionais, médicose agrícolas, alguns se concentraram nos membros mais pobres e esquecidos suas sociedades. Metade da assistência aos tuberculosos da Índia era prestada por missões e instituições cristãs, que tomavam a dianteira tanto no tratamento quanto na formação de profissionais para atender os doentes. As missões também tomaram a

275 «o iniciativa no trabalho com leprosos em vários países asiáticos e no estabelecimento de orfanatos para crianças abandonadas.

Alguns missionários foram além do serviço social e combateram as injustiças políticas e sociais do colonialismo. Um exemplo célebre deu-se no Congo Belga, na virada do século XX. Dois missionários presbiterianos dos Estados Unidos, depois de observar as condições desumanas de trabalho dos africanos na indústria da borracha, publicaram artigos sobre aquela exploração econômica monopolista, denominando-a “escravidão do século XX”. À denúncia chamou a atenção da comunidade internacional. Os missionários foram processados por difamação, mas finalmente o processo foi arquivado. Assistência à mulher Em muitas sociedades, os resultados mais significativos das missões cristãs foram verificados nos ministérios dedicados a melhorar a condição da mulher. Em muitas culturas, as mulheres eram relegadas a uma posição execrável e quase não tinham direitos. Às missionárias, geralmente mulheres solteiras, evangelizavam-nas, ensinando-as a verem a si mesmas como filhas de Deus. Assim, meninas e mulheres eram incentivadas a estudar, a desenvolver seus dons e, em alguns casos, a se profissionalizar em áreas como a educação e a medicina.

Concentrando-se na evangelização das mulheres em culturas em que os homens não podiam ter contato com a maioria delas, as missionárias logo expandiram seu trabalho para a educação e a saúde das mulheres. Logo, as convertidas foram aproveitadas como evangelistas leigas, chamadas “mulheres da Bíblia”, especialmente na China e na Coreia. Embora ainda não desfrutassem os mesmos privilégios que os homens, essas obreiras fiéis causaram forte impacto, não só no crescimento da Igreja, mas também na condição de outras mulheres. Quando os primeiros missionários protestantes chegaram à Coreia, em 1884 e 1885, a mulher não tinha reconhecimento algum da sociedade, exceto como filha de seu pai, esposa de seu

2 Beaver, R. Pierce. American Protestant Women in Mission. (Grand Rapids: Eerdmans, 1980), 135.

Perguntas para estudo 1. Em relação à obra evangelística, como era vista a transformação educacional, econômica social,

que caracterizava os primeiros esforços missionários: separada ou integrada?

276 marido ou a mãe do filho mais velho. Por volta da metade do século XX, a maior universidade para mulheres do mundo foi estabelecida em Seul, e sua diretora, a dra. Helen Kim, foi reconhecida como uma das maiores educadoras, sendo também uma líder em evangelização.

Algumas missionárias dos Estados Unidos foram pioneiras no trabalho médico para mulheres na Índia e na China. Estabeleceram as primeiras escolas para meninas e, finalmente, fundaram escolas de medicina e de enfermagem para mulheres. Esse trabalho causou profundo impacto no tratamento médico de mulheres, bem como em seu status na sociedade. Como resultado, a medicina, entre as profissões abertas às mulheres na Índia, é uma das mais prestigiadas, e hoje há milhares de médicas naquele país. À dra. Clara Swain, primeira missionária médica enviada ao campo, chegou à Índiaem 1870. Beaver deixou claro que Swain e outros não viam separação entre o trabalho médico e RESETE ESSES ES E 2. Qual a contribuição singular do movimento

Uma história de transformações o evangelístico. Sua atitude de amor cuidadoso para com os pacientes e a mediação do amor de Deus em Cristo a favor das pessoas eram tão importantes quanto seu conhecimento científico esua habilidade técnica. Os escritos e discursos de missionárias médicas tornam claro que elas se consideravam evangelistas.!?

À história continua. O movimento míssionário cristão tem causado um efeito dramaticamente positivo em todos os continentes e continua a fazê-lo, de forma ainda mais acentuada. Embora o alvo principal de muitas missões seja convidar as pessoas à fé em Cristo e plantar igrejas, os efeitos desses esforços estendem-se a todas as áreas das sociedades, sempre que uma igreja é estabelecida. A história da Igreja registra muitos casos decepcionantes, porém, no todo, o movimento cristão está ajudando a cumprir,em certa medida, a promessa de Deusfeitaa Abraão, segundo a qual seus descendentes abençoariam a todos os povos da terra.

p.

ES EE RECO

e monástico no campo da ciência agrícola?', 48 from cursos where slug = 'perspectivas';

commit;
