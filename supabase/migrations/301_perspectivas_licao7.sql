-- 301_perspectivas_licao7.sql
-- As três leituras da Lição 7 que existem no livro, nas posições em que o guia
-- as chama. Falta só o Grimes ("De todas as línguas"), que o guia pede com
-- "Leia na plataforma" — artigo do site, não capítulo. A Lição 7 fica em 5 de 6.
--
-- PROCEDÊNCIA: PDF com 57 páginas fotografadas. Três vieram deitadas (12, 16 e
-- 26) e foram giradas. Três pares são a mesma página (2/3, 22/23, 55/56) e as
-- duplicatas saíram.
--
-- TRÊS FIGURAS entram no Winter e Koch, capítulo que se apoia nelas: os dois
-- mapas da Nigéria (fronteiras políticas contra povos etnolinguísticos, p. 551),
-- "A grande desproporção" (p. 558) e "O planeta num relance" (p. 559).
-- Nas páginas com figura, a região da figura é excluída do texto.
--
-- NOTA sobre a varredura de figuras: o critério de densidade de texto achou as
-- das p. 551 e 559, que ocupam a página quase inteira, mas NÃO achou a da
-- p. 558, que divide a página com duas colunas de texto. O critério pega figura
-- de página cheia e erra a encaixada em coluna — achei essa olhando as páginas
-- vizinhas. Vale lembrar disso nas próximas lições.
--
-- O lote trouxe quatro capítulos que NENHUM guia pede: Johnstone ("Cobrindo o
-- globo"), Luis Bush ("A Janela 10/40"), Lidório ("Novas fronteiras") e Del Pino
-- ("Cidades"). Ficam para a seção de leitura extra, ainda a criar.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 1000 where curso_id = cid and ordem >= 60;
  update aulas set ordem = 61 where curso_id = cid and titulo like 'Lição 7 · Leitura — Adeney%';
  update aulas set ordem = 63 where curso_id = cid and titulo like 'Lição 7 · Leitura — Winter, cap. 44%';
  update aulas set ordem = 65 where curso_id = cid and titulo like 'Lição 8 · Guia%';
  update aulas set ordem = 66 where curso_id = cid and titulo like 'Lição 9 · Guia%';
  update aulas set ordem = 67 where curso_id = cid and titulo like 'Lição 10 · Guia%';
  update aulas set ordem = 68 where curso_id = cid and titulo like 'Lição 11 · Guia%';
  update aulas set ordem = 69 where curso_id = cid and titulo like 'Lição 11 · Leitura — McGavran%';
  update aulas set ordem = 70 where curso_id = cid and titulo like 'Lição 12 · Guia%';
  update aulas set ordem = 71 where curso_id = cid and titulo like 'Apêndice 1%';
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 7 · Leitura — Winter e Koch, cap. 73: Completando a tarefa', 'Ralph D, Winter Bruce À, Koch

e

Nasi) Nyteres

ESA)

à eat) o RALPHD WINTER fol convidado para professor de missões na School of ser World Mission, dofullerTheoogical

Seminary, após trabalhar dez anos

como missionário entre os índios maias nos planaltos da Guatemala, o 8 depois 6 HA AOS

Roberta, fundaram uma sociedade

missionária denominada Frontier

Mission Fellowship, em Pasadena, na Califórnia, Essa empreitada deu

origem ao U, 5, Center for World Nissione à William Carey International

University, que cooperam com

outras missões em tarefas pioneiras "No campo missionário.

E

E

À

A O unummam

qa BRUCE A, KOCH atuou com a Frontier

Mission Fellowship desde 1988 e foi "editor associado da terceira e quarta E "edição e do currículo de Perspectivas. Em 1991, fez parte de uma pesquisa etnográfica numa grande cidade não evangelizada, Atualmente, é

0 facilitador internacional da rede mundial de Perspectivos.

É 3 (6 Fede entre as nações, olhai, maravilhai-vos e desvanecei,

porque realizo, em vossos dias, obra tal, que vós não cre» reis, quando vos for contada” (He 1,5), À promessa de Deus de abençoar “todas as famílias da terra”, feita primeiramente a Abraão há 4 mil anos, está se tornando realidade num ritmo “que vós não crereis”, ORAR RÃ Apesar Vi de ser possível o questionamento de certos detalhes, a tendência geral é indiscutível, RES À fé bíblica está crescendo esc difundindo até os confins da terra, como nunca antes na história da humanidade, O impressionante progresso do evangelho Uma em cada dez pessoas do planeta pertence à corrente do crístianismo que lê a Bíblia habitualmente e nela crê de fato. O número de crentes nos outrora chamados “campos missionários” hoje supera o número de crentes nos P países de origem 5 dos propr próprios misstonários RORLEOIDEA O CU CEPE pese na erro recorre ang Percentual de crentes em relação à população global no século XX 129%

Fonte: Força-Tarefa de Estatísticas de Lausanne 109

8%

6%

4%

2%

Vo

EA ANE BRO erica GRE ARDE A a ia RARE o TRIO o A

Di Do DDD BD e e om Foram necessários 18 séculos PARRA para que os cristãos E dedicados A crescessem de 0% da população mundial Era para 2,5%; mas foram E necessários SEDA apenas 70 anos para crescerem de 2,5% para 5%, em 1970, eapenas os últimos 30 anos para crescerem de 5% para 11,2% da população mundial. Agora, pela primeira vez na história, há um crente para cada nove. descrentes nomundo, Do PECA SON pi

Corps Dera

Escala-E ajuda distâncias culturais cristãos precisam de

evangelismo à cultura, através de barreira, “cultura de igreja”, O evangelismo E2 alcança cultura próxima, ainda diferente. O evangelismo E3 busca culturas muito diferentes.

A Escala-P é mais que um A a comparar as diferenças culturais convertidos potencial precisam transpor fim de se unir à igreja mais próxima.

Escala-E

Igreja

ço cultura Cultura fi qe 4 diferente diferente muito

E1

E2

PRO E3

A a comparar as nicar o evangelho a outros. EO refere-se ao se mesma uma a que espelho da Escala-E.

que em enviados. De fato, atualmente, mais missionários são enviados de igrejas não ocidentais que das tradicionais bases de envio missionário no Ocidente, O índice de crescimento dos protestantes na América Latina é superior ao triplodo índice de crescimento demográfico. Os protestantes na China cresceram de cerca deum milhão para mais de 80 milhões de crentes em menos de 50 anos, sendo a maior parte dessas conversões em décadas recentes. Na década de 1980, o Nepal era ainda um reino solidamente hindu, contando apenas com uma pequena igreja perseguida. Hoje, existem centenas de milhares de crentes, e igrejas foram fundadas em cada um dos mais de cem grupos de povos. Uma trágica realidade: 2 bilhões ainda são excluídos 4 Esse impressionante progresso do evangelho, ao mesmo tempo em que nos dá muito motivo para celebrar, também obscurece uma trágica realidade. Como pode ser? A verdade é que o evangelho geralmente se expande dentro de uma comunidade, mas não costuma “saltar” as barreiras que separam os povos, especialmente

Escala-P

Igreja

Cultura cultura aa

muito diferente [3 diferente

P1

p3 pares que os transpor a fim comude cristãos frequentadores de igreja, El estendeuma Escala-P ajuda diversas a aquelas criadas pelo ódio e pelo preconceito. As pessoas conseguem influenciar seu “vizinho do lado”, cujo idioma e cultura compreendem, mas onde há fronteiras causadas pelo preconceito contra a fé religiosa, via de regra atrelada a vários aspectos culturais do grupo de onde se origina, não “salta” facilmente para o outro grupo, a menos que este deseje absorver a outra cultura em detrimento da sua.

O que significa isso? Se todos os membros de todas as igrejas do mundo trouxessem todos os seus amigos e parentes, da mesma cultura, à obediência a Cristo por meio da fé, e estes, por sua vez, pudessem trazer todos os seus amigos e parentes a Cristo, e assim por diante, independentemente de quanto tempo lhes fosse permitido, ainda haveria bilhões que nunca se converteriam. Estes permaneceriam distantes do evangelho por causa das fronteiras do preconceito e da cultura. À igreja não cresce imediatamente no seio de um povo onde não há igrejas relevantes. Um terço da população do mundo pertence a povos que não têm igreja alguma. Estes não estão mais “perdidos” espiritualmente do que patentes que nunca entraram

Il. Evangelismo: por meio de obreiro da própria cultura, ocorreu o pioneirismo missiológico de uma Igreja 3

ESSES EE CTTOSO TETE SE SE EESC AE SER TSE ORE

Ralph D. Winter e Bruce A. Koch Missões regulares e missões pioneiras

Escala-E; Distância cultural entre

Povo sem igreja, cuja cultura é muito

diferente da cultura do povo mais próximo com igreja gre estabelecida

Povo sem igreja, cuja cultura é semelhante

ao povo que tem igreja

Povo cuja cultura dispõe de uma

igreja local

Povo que participa de uma Igreja local

relevante em sua cultura um onde já autossustentada. Il. Missões regulares: evangelismo transcultural exercido por meio de um obreiro de outra cultura, com o auxílio de obreiros daquela cultura, se possível EA onde já ocorreu o pioneirismo missiológico. SL

HH. Missões pioneiras: o evangelismo trans- as cultural é fundamental, já que ainda não houve pioneirismo missiológico, RE numa igreja, contudo, ao contrário destes, não dispõem de nenhuma igreja composta por pessoas que lhe sejam semelhantes e com quem possam ter comunhão.

Ássim, enquanto dezenas de milhões continuam sem jamais ter escutado o nome de Jesus, outras centenas de milhões talvez já tenham ouvido falar dele e até mesmo o tenham em alta conta, mas não dispõem de um meio parasetornar discípulos dele. Diante deles, encontram-se barreiras, desde as essencialmente triviais até as que parecem intransponíveis, muitas das quais estão além das exigências do evangelho. Cornélio, em Atos 10, teria de ultrapassar, já como adulto, a barreira da circuncisão um preço doloroso e de fato perigoso a pagar para adentrar a comunhão dos crentes judeus. De modo semelhante, o muçulmano turco teria de encarar imensos obstáculos, caso se tornasse “cristão”. Por. toda a sua vida, disseram-lhe que “ser turco éser

49 (a o evangelista e o convertido em potencial Menor at po Malor 8

IN. Missões pioneiras pa ê 5

Ê 0 E 8 us

I. Missô Mis c Evangelismo E di rliibis u

2

Monocultural nscuktural É E

VE V8E8 Ro q 2 4 O E

“ue É a EL E po O Ci Ro E g E/ 4 o é g o

S é

p ME E á muçulmano”. Para ele, o cristianismo é a religião dos bárbaros infiéis das Cruzadas, os quais devastaram brutalmente a terra e a população da Turquia, fossem muçulmanos, fossem cristãos. Tornar-se cristão é tornar-se traidor, é voltar as costas para a família, a comunidade e o país. Um “testemunho a todas as nações” Na verdade, não devemos nos surpreender com os empolgantes avanços do evangelho mundo afora, pois correspondem exatamente ao que Jesus disse que aconteceria: “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim” (Mt 24.14). Uma observação atenta do final desse versículo nos informa o que devemos esperar e pelo que devemos nos esforçar no final desta era. Jesus diz que, à medida que a tarefa missionária for concluída, haverá um “testemunho a todas as nações.

(om 550

O que Jesus quis dizer com “testemunho” é que o evangelho do Reino será estabelecido à vista de todos e em todas as comunidades humanas. O evangelho do Reino é a supremacia de Cristo sobre o mal, quando as pessoas são libertas a fim de viver em liberdade e obediência debaixo de sua soberania e de sua bênção. É desejo de Deus que uma demonstração convincente da vitória de seu Reino se manifeste em todos os povos, e que a demonstração do Reino de Deus poderá ser melhor do queuma comunidade de pessoas vivendo sob o reinado de Cristo? Por isso, devemos nos esforçar por movimentos de implantação de igrejas entretodos os povos. Ainda que não seja o único meio de glorificar a Deus, nada revela a soberania de Cristo tão bem quanto uma comunidade empenhada em segui-lo.

À expressão “todas as nações” usada por Jesus, não se refere a todos os países ou a todos os Estados e nações. Na verdade, o termo que ele escolheu (a palavra grega ethne) indicaas etnias, idiomas e famílias que, no sentido mais amplo, constituem os povos da terra.

Quem são esses povos? Jesus não forneceu uma lista deles nem definiu o conceito em detalhes precisos. O mais importante não é que Os povos possam ser contados, mas que a tarefa missionária seja concluída entre todos os povos da terra. Saberemos que concluímos a tarefa quando um testemunho visível do evangelho do Reino um movimento de implantação de igrejas tenha sido estabelecido entre cada povo. DIFERENTES ABORDAGENS DO CONCEITO DE “GRUPO DE POVO” À fim de trabalharem juntos estrategicamente, os líderes missionários têm buscado definir com mator precisão o conceito de grupo de povo, como medida geral de nosso progresso rumo à conclusão da tarefa como um todo. Existem várias maneiras úteis de considerar a ideia de “grupo de povo, sendo cada uma de valor significativo e correspondendo a aspectos distintos do pensamento estratégico.

Completando à tarefa 1. Povos etnolinguísticos para mobilização e preparação Povo etnolinguístico é um grupo étnico ou racial distinguido por uma identidade própria, com tradições oriundas de descendência, história, hábitos e idioma em comum.

Por exemplo, o povo laz, da região do mar Negro, na Turquia, é facilmente identificado pelos demais turcos não apenas por suas feições singulares, mas também por sua pronúncia única, “romântica” do turco.

Às vezes, o que a princípio parece ser um grupo etnolinguístico unificado revela-se uma composição de grupos menores. Cameron Townsend, fundador da Associação Wycliffe de Iradutores da Bíblia, iniciou seu projeto de tradução da Bíblia entre o povo cakchiquel, da Guatemala, Os tradutores que o sucederam descobriram que os cakchiquels não seriam alcançados com apenas uma tradução: seriam necessárias, na verdade, traduções escritas para seis dialetos diferentes. Se fossem produzir fitas cassetes com o evangelho, em vez de traduções escritas, iriam deparar com mais diferenças ainda entre os dialetos. Às divergências de pronúncia em geral fazem com que pessoas se indisponham a ouvir uma mensagem pronunciada por um membro de um grupo relacionado, ainda que as palavras impressas sejam as mesmas.

Esforços recentes entre pesquisadores de missões que atuam em cooperação produziram listas razoavelmente completas de grupos etnolinguísticos. Tais listas proporcionaram um grande impulso à causa de missões pioneiras. Boa parte da informação está sendo utilizada para produzir um perfil desses povos e outras informações relevantes, por meio de material impresso e da rede mundial de computadores. 2. Povos socioculturais e o evangelismo preliminar Povo sociocultural é uma associação relativamente pequena de colegas que partilham afinidade mútua com base em algum interesse, atividade ou ocupação em comum.

[figura] /figuras/perspectivas/nigeria-fronteiras-e-povos.png | Fronteiras políticas: a Nigéria e países vizinhos — e, na mesma área, os povos etnolinguísticos por língua

missionários concordam quanto a definições estratégicas Em março de 1982 um grupo de líderes missionários reuniu-se em Chicago para uma reunião patrocinadefinir a tarefa missionária remanescente, Nunca, antes ou depois desse encontro, um grupo tão grande para os povos não Duas básicas surgiram encontro: 1, Grupo de é “um agrupamento consideravelmente grande de indivíduos cogitam ter afinidade mútua partilharem um mesmo Idioma, religião, Identidade étnica, local de residência, ocupação, classe social ou casta, condição etc,, alguma combinação desses Itens”, Para propósitos evangelísticos, é “o maior dentro do qual o evangelho pode se difundir por meio de um movimento de fundação de igrejas, sem deparar com 2, Grupo de povo não alcançado é "um grupo de povo dentro do qual não haja uma comunidade autóctone criscapaz esse mesmo grupo (o 552 Líderes da pelo Grupo de Desenvolvimento Estratégico de ou tão abrangente se reuniu por dois dias a fim de estratégia voltada alcançados.

povo ou de compreensão ou aceitação”.

tãos convertidos, de evangelizar PERESTERITEN TO TON OSSEC

Uma vez que enviamos missionários para um trabalho de longo prazo nos campos missionários pioneiros, eles precisam aprender muitas coisas, apenas para conseguir viver, comunicar-se e compreender melhor o povo que têm como alvo. Após a fase inicial de aprendizado e adaptação cultural, permanece a questão de como iniciar a implantação de uma igreja entre tal povo.

Com muita frequência, conseguimos efetivamente evangelizar indivíduos iniciando um estudo bíblico ou um pequeno grupo de oração dentro desses grupos especializados. O grupo pode ser de mulheres que lavam roupa à beirado rio, motoristas de táxi, universitários que moram em repúblicas ou migrantes recém-chegados da zona rural à cidade grande. As oportunidades em potencial para esse tipo de evangelismo em grupo são quase ilimitadas no mundo atual. Visando propósitos missionários, podemos atuar entre povos socioculturais a fim de evangelizar preliminarmente, estabelecendo uma ponte intermediária para metas de plantação de igrejas a longo prazo.

Assim, abordar um povo sociocultural pode ser uma boa estratégia para estabelecerum foco de ministério em uma parcela específica deuma sociedade maior, sendo esse o primeiro passo paraa plantação de uma igreja. Alguns grupos podem ser especialmente úteis ao se estabelecer uma igreja, enquanto outros dificultam o processo. Líderes natos e mestres da Bíblia para

De

Completando a tarefa Lausanne. O propósito do encontro era esclarecer e tratar especificamente do desenvolvimento de uma definições desse que por os grupo barreiras de de povo”. TREO ET PE ER SO PESE as igrejas podem ser encontrados entre executivos e professores, se forem alcançados primeiro. Esforços para alcançar líderes religiosos, como monges budistas ou mulás (muçulmanos), podem ser eficazes por já serem reconhecidos como líderes espirituais. Todavia, pode-se escolher o grupo errado como priorizar o ministério com crianças no evangelismo inicial de um povo, o que pode ser interpretado como uma ameaça às famílias naturais.

Grupos de povos para “movimentos de povo” por Cristo Para os propósitos evangelísticos, um grupo de povo é o maior grupo dentro do qual o evangelho pode se difundir por meio de um movimento de fundação de igrejas sem deparar com barreiras de compreensão ou aceitação (ver seção anterior). À tribo na mata e outro povo pequeno e geograficamente remoto quase sempre formam um grupo de povo único. Descobrir a realidade do grupos de povos dentro dos povos etnolinguísticos maiores em sociedades complexas é bastante mais desafiador.

Embora o idioma seja o principal meio usado no início para que alguém compreenda sua identidade cultural, devemos levar em consideração outros fatores que os separam a fim de alcançar todos os povos. Religião, distinções de classes, educação, convicções políticas e ideológicas, hostilidade histórica entre clãs ou tribos, hábitos e comportamentos e outros

1 Rajph D. Winter e Bruce A. Koch têm potencial para desenvolver fortes barreiras socioculturais dentro de agrupamentos etnolinguísticos, Esse fato em si coopera na explicação da existência de estimativas diferentes quanto ao número de “povos não alcançados”.

Por exemplo, a Índia não pode ser considerada apenas pela perspectiva etnolinguística. Além de contar com mais de 1.600 idiomas e dialetos, a Índia também é dividida por religião, castas e outras barreiras socioculturais. Certa pesquisa sociológica, realizada em 1991, identificou 4.635 povos somente na Índia.

Infelizmente, grupos vizinhos quase sempre se odeiam e temem um ao outro. Assim, em estágios iniciais do evangelismo, muitas vezes tais grupos se negam a tornar-se parte da mesma igreja de um “movimento de povo”. À rivalidade entre clãs proeminentes de muçulmanos da Somália é tão intensa que eles quase levaram o país inteiro à ruína. Em estágios iniciais de evangelismo e plantação de igrejas, tais hostilidades em ebulição provavelmente significam que grupos assim serão mais alcançados com mais eficácia se a mensagem cristã for pregada separadamente. À resplandecente esperança do evangelho é, naturalmente, que novos movimentos de obediência a Cristo em tais ambientes de conflito efetuem a cura das inimizades entre povos.

De fato, a história mostra que é comum acontecer que, quando certo número de pequenos grupos hostis entre si se torna cristão, Três abordagens ao conceito de grupos

353 (o a tendência é se unificarem, formando grupos maiores. Por exemplo, quando o cristianismo começou a ser adotado na região escandinava, centenas de tribos mutuamente hostis povoavam o local, Os atuais territórios norueguês, sueco e dinamarquês são resultado da ampla reconciliação e consequente unificação que surgiram com a adoção da fé enstã por parte dos numerosos, pequenos e beligerantes grupos originais.

Às duas primeiras abordagens ao conceito de grupo de povo povos etnolinguísticos e povos socioculturais ajudam a compreender e cumprir a tarefa da qual Cristo nos incumbiu. Ambas, de uma forma ou de outra, apontam o caminho para o início da tarefa. Essa terceira forma de entender os povos está mais relacionada com a conclusão da tarefa não no sentido de que não haja mais nada a ser feito, mas de que se cumpriu o primeiro passo primordial para que o evangelho prospere no meio de um povo. Abordar os povos com esse conceito de grupos de povos pode nos ajudar a prosseguir rumo ao encerramento nossa conclusão comunitária do que se compreende ser todo o mandato missionário com que Cristo nos comissionou.

O valor dessa abordagem de grupos de povos está na forma em que ela identifica as fronteiras que criam barreiras ao progresso do evangelho enquanto, ao mesmo tempo, promove, nos cristãos dedicados, o desejo intenso de evangelizar os povos que estão além dessas fronteiras, sem permitir que grupos menores passem despercebidos dentro de um contingente maior, É possível contá-las? Para quem observa de fora, essas barreiras socioculturais, quase sempre sutis, mas poderosas, são reais dentro de grupos que parecem unidos. Alguns descartaram a utilidade do conceito de. grupo de povo porque as barreiras de preconceito sociocultural não são facilmente identificáveis ou precisamente enumeradas. No entanto, ainda que não se possam quantificar as intangíveis barreiras de preconceito, esses fatores não são irrelevantes, O que poderia ser mais relevante que identificar e transpor todas as barreiras que impede as pessoas de seguir a Cristo?

À definição de grupo de povo não foi desenvolvida para quantificar precisamente a tarefa total da Igreja, porém ela nos ajuda na percepção de quando a tarefa de alcançar os povos não alcançados terminou e identificar onde a tarefa ainda não começou, Abordando os povos com cautela Cada uma dessas três abordagens aos vários tipos de povos tem sua utilidade e valor, À abordagem etnolinguística impele-nos à mobilização. A dos povos socioculturais ajuda-nos a dar início ao evangelismo, Contudo, esteja atento para não concentrar o foco da plantação de igrejas em povos etnolinguísticos ou socioculturais que apenas apareçam numa lista. Os obreiros ficam desanimados quando descobrem que existem muito mais grupos de povos do que imaginavam encontrar. O contrário também pode ocorrer. Às vezes, o mesmo grupo de povo aparece duas vezes numa lista, por ser encontrado em lados opostos de uma fronteira política. Na verdade, trata-se do mesmo grupo de povo, e talvez seja necessário apenas um projeto de plantação de igrejas que faça a ponte de um lado para o outro da fronteira. Por exemplo, grupos uzbeques estão relacionados a 20 países, além dos que se encontram no Uzbequistão.

Já no território do Uzbequistão existem 56 grupos que não falam o uzbeque, Apenas um fala o idioma, com uma população de 15 milhões! É quase certo que esse “único” grupo represente uma quantidade de diferentes grupos de povos que precisam ser alcançados separadamente,

Valer-se de fronteiras políticas para diístinguir grupos de povos é como usar forminhas de moldar biscoitos sobre a distribuição geográfica desse grupo e depois dizer que cada pedaço moldado é de um tipo de massa diferente. É verdade que, em vários casos, quando há uma separação muito prolongada, os grupos se tornam distintos principalmente se já não houver movimentos migratórios mas raramente se tornam antagônicos. Em grande parte do mundo em desenvolvimento, o conceito de separação política é bastante artificial, uma vez que as fronteiras são bastante permeáveis.

Consideremos o desafio dos curdos. Esse povo, que se mantém bravamente independente, tem sua terra natal no território de cinco países: Turquia, Irã, Iraque, Síria e Azerbaijão. No que diz respeito à estratégia missionária, certamente não constituem um único grupo de povo, nem mesmo apenas cinco. Além de haver quatro subgrupos principais caracterizados por idiomas diferentes, antigas rivalidades provocam conflitos constantes entre eles, mesmo quando é esperado que se unam para combater os não curdos e conquistar território.

Os missionários precisam estar cientes da possibilidade, como no caso dos curdos, de que certos povos não estejam necessariamente unificados, mesmo quando milhões deles vivem no mesmo país. Ainda assim, pequenas comunidades de curdos, reunidas em quantidade significativa em 13 países fora da região curda, têm o potencial de ser uma “ponte” estratégica para os grupos que estão em sua terra natal. Além disso, os que se encontram distantes de sua terra de origem quase sempre são mais abertos ao evangelho. Uma porção remota de um grupo maior que aceita a Cristo pode se tornar uma ponte eficaz para alcançar o mesmo povo na terra de sra ar

Ralph D. Wife... origem. Às fronteiras políticas não costumam ser empecilho para a propagação do evangelho. Sem dúvida, toda informação específica sobre determinado país pode ser muito útil no planejamento estratégico e na formação de parcerias que pretendam alcançar grupos de povos espalhados sobre uma vasta região. A ESSÊNCIA DA TAREFA MISSIONÁRIA O que se faz necessário em cada grupo de povo é que o evangelho exerça sua influência entre o povo com poder convincente e vivificador, de modo que as igrejas recém-plantadas possam por si mesmas levar adiante o evangelho a cada indivíduo. Metas inferiores a essa, ainda que boas, poderão nos retardar ou nos distrair. O evangelismo aos vendedores ambulantes ou entre universitários pode nos conduzir a grupos de discipulado que promovam crescimento pes"soaleaté mesmo mais evangelismo. No entanto, por que nos contentarmos com menos que um "movimento florescente de seguidores de Cristo, "composto essencialmente por famílias inteiras? Porque não nos firmamos na convicção de que -Deustanto pode como deseja atrair ao seu Filho um movimento consistente, que se espalhe "de modo rápido, espontâneo e completamente por povos inteiros?

À essência da tarefa missionária é estabelecer um movimento de plantação de igrejas autóctones e autossustentáveis que tenham em si o potencial de renovar famílias inteiras, bem como, em sentido mais amplo, transformar sociedades inteiras. Elas serão autossustentáveis por conseguirem crescer por conta própria; autóctones, por não serem entendidas como estrangeiras; um movimento de plantação de igrejas porque continuamente irão produzir comunhão entre as diversas gerações, de modo que se evangelize o restante daquele grupo de povo. Muitosse referem a tal êxito do movimento de plantação de igrejas autóctones como “um rompimento missiológico de barreiras”,

Nossa tarefa missionária estará basicamente encerrada quando os indivíduos de uma sociedade (mesmo os que não pertencem à Igreja)

reconhecerem que tal movimento já é parte dessa sociedade, Só depois que esse nível de adaptação cultural for alcançado, o amor de Jesus, dinâmico e transformador de vidas, estará disponível para transitar livremente por todo o grupo de povo. Donald McGavran refere-se a esse rompimento missiológico de barreiras como “movimentos de povo por Cristo”, Precisamos manter essa meta como a realização mínima dentro de cada povo, a fim de proporcionar a todos os que fazem parte desse povo uma oportunidade real de dizer “sim” a Jesus Cristo, sem o acréscimo de barreiras culturais às demandas espirituais do evangelho, já suficientemente complicadas. Esse é o único modo de oferecermos a todos os povos do mundo uma oportunidade de dizer “sim” a Cristo e ao seu Reino. O que Jesus nos comissionou a realizar não é menos que isso. Portanto, não devemos nos satisfazer com menos que isso. Encerramento missiológico: o rompimento de barreiras em cada grupo de povo O termo “encerramento” refere-se simplesmente à ideia de finalização. Na década de 1970, o Senhor começou a abrir os olhos de muitos para o fato de que o essencial inegociável concernente à tarefa missionária, que é o rompimento de barreiras em cada grupo de povo, é algo que pode ser concluído. Na época, mais da metade da população mundial pertencia a grupos de povos não alcançados. Mesmo assim, um pequeno grupo de ativistas missionários teve fé suficiente para acreditar que, se iniciassem um movimento voltado para esses povos, os quais por um tempo foram denominados “povos escondidos”, então a tarefa missionária essencial poderia ser concluída em poucas décadas. Pela fé, cunharam o lema: “Uma igreja para cada povo até o ano 2000”, a fim de comunicar que o mandato missionário é, em essência, possível de ser concluído, Ainda que ninguém ousasse afirmar que ele seria concluído até o final do ano 2000, estavam confiantes de que isso era possível. Esse lema conseguiu acender no coração de muitos um ardente desejo de ver Cristo honrado, ir (um 556 adorado e obedecido em todos os povos. Deus operou de forma semelhante em muitos outros cristãos, a fim de trazer à tona o movimento global que temos hoje, cujo foco está no desafio de alcançar os povos não alcançados.

Não é razoável nem mesmo falar em evangelizar cada pessoa, uma vez que todos os dias centenas de milhares de crianças chegam à idade em que respondem por si. No entanto, aideiade “uma igreja para cada povo” é uma interpretação que se aproxima, de forma possível e plausível, do que a Grande Comissão possa significar e é uma tarefa que pode ser concluída. Não conhecemos interpretação que melhor expresseo cumprimento da ordem de Jesus de haver “testemunho” em cada povo, de fazer “discípulos de todas as nações” (Mt 24.14; 28.19,20).

Podemos falar com confiança no encerramento da missão de alcançar os povos não alcançados. Em 1976, estimava-se haver 17 mil povos não alcançados. Hoje, a estimativa é de 8 mil, e há um movimento global, dinâmico e comprometido com o estabelecimento de “uma igreja para cada povo”. Alcançando grupos de povos: não mensurável, porém verificável Seria possível determinar quão mensuráveléa presença de “um movimento de plantação de igrejas autóctones e autossustentáveis”? Talvez seja melhor dizer “verificável”, em vez de “mensurável”. Não dizemos que a mulher está “meio” grávida ou que alguém está parcialmente contaminado com AIDS. Em tais casos, “verificamos a presença ou a ausência de uma condição.

No que diz respeito a alcançar grupos de povos, existem apenas três possibilidades: 1) certamente alcançado; 2) certamente não alcançado; 3) dúvidas se foi ou não alcançado. Nossa expectativa, pela lógica, deve ser empenhar os maiores esforços em priorizar os povos sobre os quais temos dúvida ou que certamente não foram alcançados. Assim como no caso do número de povos não alcançados, não podemos avaliar com certeza se determinado grupo veio a ter realmente um rompimento missiológico, em

Completando a tarefa razão da distância ou de fontes que não estão preocupadas com tais informações,

É possível fazer suposições seguras com base em informações estatísticas quanto à presença ou ausência de um movimento de plantação de igreja. Mas o que pensar, se um povo etnolinguístico for, na verdade, um aglomerado de grupos de povos, e um deles estiver vivenciando um forte crescimento em implantação de igrejas, enquanto nos outros grupos pouco ou nada esteja acontecendo? Os não alcançados desse aglomerado de grupos podem se tornar uma vigorosa oposição ao movimento a favor de Cristo, ao qual o grupo tocado por Deus aderiu. Além disso, o crescimento da igreja num dos grupos pode desviar a atenção missionária quanto às necessidades dos demais grupos daquele povo. O MANDATO É MAIS DO QUE APENAS ENCERRAR O que Deus realiza é sempre mais do que o que nos designou fazer. Deus nos deu uma missão muito simples e clara: assegurarmo-nos de que Cristo seja adorado e seguido por cada povo existente. Essa é a essência da tarefa missionária, e devemos levá-la adiante, com paixão e dedicação, até que a concluamos. Há, contudo, muito mais que fazer. O rompimento das barreiras missiológicas é apenas o início de tudo quanto Deus realizar no meio de cada povo. Ele continuamente cumprirá a promessa de desfazer as obras de Satanás e trazer as bênçãos de Abraão a todos os povos. A proclamação de sua glória por todas as nações Jesus ensinou seus discípulos a orar: “Venha o teu reino; faça-se a tua vontade, assim na terra como no céu”. Nossa concepção sobre o desejo de Deus de alcançar todos os povos e indivíduos é, evidentemente, parte do desejo de que seu Reino venha sobre a terra. Outros versículos dizem que ele aguarda o tempo em que todas as nações do mundo proclamem sua glória (Is movem

Assim, esperamos em confiante expectativa

E 0 tempo em que “o reino do mundo se tornou

denosso Senhor e do seu Cristo, e ele reinará pelos séculos dos séculos” (Ap 11.15). Sem "dúvida, Deus busca derrotar “os dominadores deste mundo tenebroso” (Ef 6.12).

Muito em breve, talvez não haja mais um

reino do mundo” sequer onde seu nome não seja glorificado. O rompimento das barreiras espirituais em cada povo fará com que o evangelho se torne disponível a todos os povos da terra. Satanás mantém cativos povos inteiros.

Não há como batalhar por uma única alma de UM povo que esteja sob seu domínio sem que isso represente um desafio à sua autoridade sobre esse povo em particular. Em cada grupo de povo no qual ainda não haja ocorrido o rompimento das barreiras, haverá uma “confrontação de poderes"entre os exércitos de Deus c os poderes das trevas. Conquistar os reinos “do mundo” requer uma invasão da glória de Deus em cada povo.

O apóstolo Paulo foi enviado aos povos não judeus especificamente “para lhes abrires os olhos e os converteres das trevas para a luz eda potestade de Satanás para Deus, a fim de que recebam eles remissão de pecados e herança entre os que são santificados pela fé em mim” (At 26.18). Será que não estamos enredados em nossoscritérios de mensurar o evangelismo, reforma social e crescimento econômico a ponto de termos esquecido que Deus está, acima de tudo, interessado em expandir o domínio do seu Reino e em derrotar Satanás?

Mesmo sendo essa uma batalha essencialmente espiritual, não significa que possamos deixar de lado o planejamento meticuloso, bem "como o treinamento em evangelismo e as incursões pioneiras, e nos acomodarmos ao simplesato de orar para que Deus realize sua obra, "porque a nossa luta não é contra o sangue ea

Carne, e sim contra os principados e potestades, Contra os dominadores deste mundo tenebroso, contra as forças espirituais do mal, nas regiões

Celestes” (Ef 6,12). E Estamos cientes de que a luta também é nossa, não apenas dele, e que a ele nos unimos na batalha contra o Maligno. Sabemos que em todos os lugares da terra a chave para a vitória não está em nossa sabedoria ou mesmo no trabalho árduo. Serão essas coisas aliadas ao seu soberano poder que farão desmoronar as fortalezas dos inimigos de Deus, a fim de que sua glória alcance os confins da terra.

Jesus, com autoridade singular, claramente ordenou que discipulássemos “todas as nações Todos nós podemos e devemos obedecer-lhe, Sem dúvida, devemos considerar seriamente nossos métodos de avaliação evangelística, mas não como parâmetros finais do plano de Deus, Prossigamos, pois, sabendo que cle avalia todas as coisas por métodos que não compreendemos em sua totalidade: seus pensamentos são muito mais elevados que os nossos.

Não devemos reduzir tudo a simples planejamento humano, todavia a obra requer de nós muito esforço de planejamento, todas as abordagens criativas e todo o sacrifício que pudermos oferecer. Sabemos que nossas formas de avaliação de povos e indivíduos são apenas metas objetivas. O mais importante é que estamos com ele, e ele conosco, e continuamos a perscverar em obediência enquanto cle nos conduz ao cumprimento do chamado celestial. VISUALIZANDO A TAREFA EM GRÁFICOS Embora o mundo seja grande e complexo, existem meios úteis de quantificar o progresso rumo à finalização da tarefa missionária essencial. Atualmente, com o advento da informática, os pesquisadores têm condições de reunir, administrar e resumir grandes volumes de informação. Temos uma grande dívida para com os que procuram seguir os traços da mão de Deus, enquanto ele prossegue na busca por todos os povos. Todas as tabelas e gráficos globais feitos até hoje são dependentes de pesquisas alheias, bem como de estatísticas próprias em que alguns dados adicionais se fazem necessários. Contudo, nenhum banco de dados pode oferecer mais que uma estimativa da realidade dinâmica do mundo.

Ao analisar os gráficos deste capítulo, é necessário compreender que estamos usando a religião predominante de determinado grupo como característica cultural a fim de entendermos o grupo como um todo. Isso não significa que todas as pessoas desse grupo sejam membros daquela religião, Desse modo, podemos ter um grupo muçulmano “alcançado”, caso haja em seu meio um movimento de plantação de igrejas, ainda que o grupo continue sendo predominantemente muçulmano. A grande desproporção Observando o gráfico “O planeta num relance”, logo se percebe que o número maciço dos indivíduos pertencentes a povos não alcançados (branco) estão entre os muçulmanos, indígenas, hindus e budistas. Precisamos continuar enviando missionários visionários e bem treinados a esses povos que representam um grande desafio. Alguns movimentos de povo animadores ocorreram num limitado número de grupos hindus, budistas e muçulmanos. Esses três blocos são

Completando à tarefa rém temos aprendido que, quando um povo parece resistente, pode apenas significar uma reação à nossa abordagem defeituosa. Metade dos que pertencem a povos não alcançados estão no bloco muçulmano, o qual tem uma postura muito favorável a Jesus Cristo,

Apenas uma pequena fração de toda a força missionária estrangeira no mundo atua entre os 8 mil grupos não alcançados, enquanto uma quantidade muito superior de missionários estrangeiros continua a investir em grupos de povos já alcançados. Que desproporção! Mesmo que se incluam os missionários estrangeiros que trabalham com cristãos em todos os blocos culturais principais (v, os gráficos “A grande desproporção” e “Distribuição da força missionária protestante nos principais blocos culturais”), é ainda fato notório que a maioria dos missionários estrangeiros trabalha entre povos que são predominantemente cristãos.

Patrick Johnstone avalia essas informações

[figura] /figuras/perspectivas/grande-desproporcao.png | A grande desproporção — alcançados e não alcançados entre grupos de povos, não cristãos, cristãos praticantes e missionários estrangeiros (fontes: David B. Barrett, Todd M. Johnson, Patrick Johnstone)

em geral considerados os mais resistentes, po-A grande desproporção

Alcançados Não alcançados Grupos de povos No ras id Cia ESONETaS Ei areas

10% eo Eu dedicados

N (149%

N Não cristãos

Cristãos» emeruposnão

nominais alcançados

Ep iiti

Nãocristãos

alcánçadãs

27,2% Fontes: David B, Barrett, Todd M. Johnson, Patrick Johnstone em seu livro Intercessão mundial (1993) para estimar a distribuição da força missionária protestante. Ainda que o quadro atual seja melhor que qualquer outro visto até então, ele constatou uma grande desproporção, uma vez que apenas 26% do esforço missionário “protestante” é dirigido aos dois terços predominantemente não cristãos do mundo. Será necessário o maior investimento do melhor que a Igreja tem a oferecer, se quisermos concluir em breve a tarefa de missões pioneiras.

Após quase 2 mil anos de cristianismo, 8 mil grupos de povos, totalizando quase 3 bilhões de P pessoas, ainda estão fora do alcance e de qualquer igreja local.

bri Uma ocasião mais que oportuna Conquanto pareça assustador pensar em termos de bilhões de pessoas, progressos impressionantes têm ocorrido, Em 1974, ficamos espantados com a revelação de que quatro em cada cinco não cristãos no mundo estavam fora do alcance do evangelismo (realizado dentro da própria cultura). Hoje, apenas três em cada cinco não cristãos estão fora de tal alcance! Uma nova

[figura] /figuras/perspectivas/planeta-num-relance.png | O planeta num relance — os blocos culturais e os povos não alcançados dentro de cada um

força de trabalho, por meio de discipulado e capacitação 77 “Cristãos” meramente nominais, necessitando uma renovação evangelística tipo EO Não cristãos, que não admitem qualquer confissão cristã, mas que pertencem a povos alcançados, e que necessitam de alcance evangelístico tipo Ei ão cristãos Pi que pertencem a grupos de povos não alcançados, necessitando de evangelismo transcultural tipo E2 e E3 população mundial pode ser encontrada em algum lugar desse diagrama. A religião é vista como parte da identidade cultural do grupo como um todo. Por exemplo, quando um movimento de plantação de igrejas se estabelece dentro de um povo Frnpes ab seo sado cond Fo Es Sem cãE Add o ESPESSAS E budi Apenas um em cada quatro missionários é atuante num ministério pioneiro entre

E 7 Esse gráfico representa uma visão inclusivista da força missionária protestante, com"posta de missionários estrangeiros, missionários atuando no próprio pais (tanto transculturalmente quanto em culturas próximas), missionários bivocacionais e a “equipe de base”, missionários que oferecem apoio 305 que estão no campo. Esse resumo é uma avaliação preliminar baseada em vários dias de análise, realizada

PTE Ecs A Ran: POE especificamente para e esta obra. ur

Ea Fonte: Patrick Johnstone

2. Deacordo qual essência da tarefa missionária?

560 percepção, fácil de ser lembrada e que pode ser observada no gráfico “A grande desproporção” é de que o mundo pode ser dividido em três partes significativas: um terço do mundo pelo menos afirma ser cristão; o outro terço é de não cristãos que pertencem a povos alcançados; o último terço é de não cristãos que pertencem a povos não alcançados.

Uma vez mais, esse é um progresso significativo, visto que, em 1974, cerca de 60% da população mundial estava fora do alcance da Igreja. pg em dia, 40% da população vive sema Da ai áeis E ni movi did pa is RA de nosestabe- em se m oennos oe ans ão igrejas outros povos não alcançados.

Este é o momento final da era missionária. TORO Pela primeira aa vez na história, EE Pa é possível ver E o fim do túnel”, apaç o tempo em que acontecerá um movimento de plantação de igrejas no idioma E e na estrutura social de cada grupo de povo do planeta, e o evangelismo pessoal eficaz se expandirá E por todos os povos. Deus está a agindo por meio do corpo de Cristo em todaaterra,a fim de cumprir sua promessa às pai nações de formas que jamais teríamos imaginado há três ou quatro décadas. Milhares de novos candidatos a missionários as não apenas no Ocidente, mas também na Ásia, na África e na América “Latina, e fruto de movimentos missionários, Pa e abraçam com fervor q Grande Comissão. Mais que em qualquer tempo anterior, esse movimento é global e cooperativo. Temos de nos preparar para novas parcerias, novas percepções e novas abordagens oferecidas por estruturas missionárias não ocidentais. Ao mesmo tempo,

Perguntas 1. Como se define um “grupo de povo”? Qual com os autores, a

Completando a tarefa precisamos reconhecer que a história das missões ocidentais é um acervo de experiências que muito pode servir às missões emergentes.

A tarefa é grande, contudo se torna relativamente pequena quando comparada ao enorme contingente de crentes em todo o mundo. São cerca de mil igrejas no globo para cada grupo de povo não alcançado restante! Precisaremos apenas mobilizar e capacitar um pequeno percentual de cristãos dedicados. Avaliar a tarefa remanescente com base na força de trabalho em potencial a fará bastante reduzida e viável, em contraste com a perspectiva proibitiva enfrentada por nossos antepassados.

Observe como a tarefa missionária só ni parece se tornar muito mais fit factível quando nos concentramos no tamanho da força missionária em potencial e para o envolvimento com grupos de povos. Em vez de pensar em evangelizar 4 bilhões E de descrentes, podemos pensar em começar com 3 mil povos etnolinguísticos Ed e então terminar com, talvez, 8 mil grupos de povos. De ato, ma d quase todos os à 5 mil mil ca grupo fá EO Fa Ís-COS ne vange em e os pá estao ne e NOS pianos de alguma das estruturas de envio Missionário NO mundo.

Identificar e penetrar os grupos de povos remanescentes OND o O discipular todas as na ma —=eogr 4 ande desafio que ainda e permaneéce diante de nós. Deus haverá de revelar d glór 1a de seu Reino a todos os povos. Estamos perto de concluir a tarefa, numa ocasião que se faz mais oportuna que qualquer outra era na história. Seja parte disso “Proclame sua glória entre as nações”! para estudo o valor dessa definição?

É', 60 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 7 · Leitura — Greenway, cap. 76: O Desafio das Cidades', 'O desafio das

Roger 5.

oi q e EA “AR eemsus OG GHEEINN Ho rolar de misslologia mundial no Calvin Theological Seminary e professor de missões e comunicação do evangelho no Westminster Theological Seminary. PIAUIE A? ada ADI E missões transculturais, primeiro no

Lanka e depois na América latina, Mais tarde, foi diretor executivo de Christian Reformed World Ministries.

cidades Gi 6 Greenway JA cidades são a nova fronteira de missões cristãs, Por causa de seu tamanho, influência, diversidade e necessidades, elas apresentam desafios enormes, Negligenciar as cidades éum erro estratégico, porque o mundo caminha conforme as cidades caminham. Elas são os centros do poder político, da atividade econômica, da comunicação, da pesquisa científica, da instrução acadêmica e da influência moral e religiosa, O que acontece nas cidades afeta nações inteiras, Quando o Reino de Cristo avança nas cidades, o número de pessoas que adoram e servem ao Deus verdadeiro se multiplica,

Foi no século XX que o mundo se tornou urbano, No começo do século, apenas 13% da população mundial vivia em cidades, Já no fim do século, metade da população do mundo era urbana, Em 1950, só duas cidades, Nova York e Londres, tinham mais de 8 milhões de habitantes. Estima-se que até o ano 2015 as cidades com mais de 8 milhões de habitantes serão 33, c 19 delas estarão na Ásia, A migração das áreas rurais para os centros urbanos explica a metade do crescimento das cidades. À outra metade deve-se ao crescimento interno, determinado pelo número de nascimentos em relação às mortes. O movimento de mais de um bilhão de pessoas para as cidades nas duas décadas anteriores é o maior movimento populacional da história. Causas da migração rural-urbana Uma causa subjacente da migração para as cidades é o aumento da população mundial. O ser humano hoje vive mais tempo, a mortalidade infantil diminuiu e os remédios mantêm vivasas pessoas que, sem eles, há anos teriam morrido. O aumento da população, porém, traz a necessidade de mais empregos, o que obriga milhões a deixar a área rural e mudar-se para as cidades, à procura de emprego.

Há outras causas também, As cidades oferecem oportunidades educacionais não disponíveis em pequenas cidades e vilas. Háhospitais e centros de saúde nas cidades para pessoas com necessidades Médicas especiais. Sao Os jovens, especialmente, são E atraídos para as cidades porque elas oferecem entretenimento e oportunidades novas. Muitas vezes, eles vêm para a cidade sonhando com riqueza e com

Ásia (em milhões) Megacidades de amanhã

Os analistas estimam as seguintes populações (em milhões) para à 7

Bangladesh

Dhaka 19,0 gUumas das malores cidades do mundo no ano 2015,

..eecererresoo»

Lembre-se de que cada uma desses milhões de pessoas é um ser China

Pequim 19,4 humano feito à imagem de Deus, com suas necessidades e, acima de cesso

Xangai... tudo, com necessidade de Jesus Cristo e da salvação por meio dele.

Tianjin esc 10,4 Que desafio missionário tremendo espera por nós que habitamos as

ShenyanB ...ccssesserererens 9,4 cidades!

do checa AÍNIÇA América do Norte nesnsccssmosinra

Coreia LAGOS .esevesesesesserpssasráisss 24,4 Cidade do México 18,8

DEUS: coscecossiisome secs into did pda República Democrática Estados Unidos

Tailândia do Congo Nova York... 17,6 ses

BAREDE.. costs ras ssa ESA Kinshasa .......sssseos 13,9 Los Angeles... 14,3 ti 27,4 Europa e Oriente Médio América do Sul asmmerentererriaeo

Novo Délhi... 17,6 Egito Aroentino

COIBUTA 730 COND ses secericis ciussiss Loc Buenos Aires... 12,4 secura scssiisasssssei

Hyderabad 10,4 França Brasil

Madras... 8,4 DARE ss terras a DO SãO Paulo 20,8 iss:

Indonésia Irã Rio de Janeiro 11,6

....se

JOCAR. ce cssrisssissitica Cid TECIS 14,6 Peru

Li issariisiieiicii

Paquistão Rússia EMA essscossseitoaciaisrrsostso RAÇA

Karathi.....iesssessescoscssits 20,6 MOSCOU 9,2

...cccestensenrremmesivs

Filipinas IstambUl ccrensissdesseres 12,3 áreas metropolitanas maiores em torno das cida-

MANHA 14,7 des. Os números acima incluem apenas cidades.

...ccciiiciesinrentéris uma vida melhor, mas têm seus sonhos destruí- viajando em transporte público, Com isso, a vida dos pela dura realidade da vida urbana. em família sofre, uma vez que jovens e velhos trabalham sete dias por semana em qualquer Pobreza e sofrimento urbanos emprego que possam encontrar. Os piores sofrimentos atingem os recém-chega- À vida é difícil para o pobre na cidade. O dos à cidade. Os moradores das áreas ruraisem crime prevalece, e a segurança é pouca, mesmo geral não estão preparados para as dificuldades assim um grande número de pessoas continua que encontram: não têm as habilidades neces- chegando dos vilarejos, atraídas para a cidade sárias para os empregos disponíveis; não têm como se esta fosse um ímã. Apesar da pobreza condições financeiras de comprar propriedades e do sofrimento, o nível de otimismo quanto ao ou pagar aluguel caro; são forçadas a viverem futuro é geralmente alto. Elas acreditam que, assentamentos ilegais, em casebres de madeira, se não os pais, certamente os filhos desfrutarão de lata e de papelão, normalmente situados nas. uma vida melhor na cidade. periferias da cidade. Na primeira etapa, comunidades de áreas invadidas não têm água, esgoto, Abertura ao evangelho eletricidade nem ruas. Como a terra não per- Como regra geral, os que se mudam com fretence a eles, os residentes estão vulneráveis aa quência, experimentando grandes mudanças em despejo e à perda súbita de moradia. Os mais sua vida, se mostram mais abertos ao evangelho. afortunados encontram trabalho, mas passam Em minha experiência, isso vale também para “horas exaustivas, todos os dias, caminhando e os recém-chegados à cidade. Eles estão abertos a cu a novas ideias, até mesmo sobre Deus e religião. Por conseguinte, cheguei à conclusão de que Deus está por trás da migração em massa de pessoas para as cidades. Ele está criando novas oportunidades para a expansão do evangelho entre grupos não alcançados, provenientes de cidades e vilarejos distantes. É nossa tarefa aproveitar a oportunidade e executar a ordem missionária de Cristo.

Enquanto estava na Cidade do México, trabalhei com estudantes na evangelização e plantação de igrejas em comunidades de ocupação ilegal e outras áreas de baixa renda. No início, tentamos outras áreas da população urbana, porém descobrimos que a maior abertura ao evangelho era entre os que haviam chegado à cidade havia menos de dez anos. Utilizando os métodos mais simples e baratos, indo de porta em porta, testemunhando pessoalmente às famílias, orando pelos doentes e ministrando estudos biblicos, começamos dúzias de “células” e igrejas nas casas, muitas delas transformadas em congregações estáveis. Isso me levou a crer que a migração maciça para as cidades, que ocorre hoje no mundo, pode ser, na providência de Deus, uma chave para a evangelização mundial. Por meio da urbanização, Deus está trazendo pessoas de toda raça, tribo e língua a lugares onde possam ser alcançadas com o evangelho. Questões práticas em missões urbanas Há cinco considerações importantes parao ministério nas cidades:

1. Pobreza. Em muitas cidades, os pobres correspondem de 30% a 50% da população, muitas vezes desesperadamente pobre. O trabalho missionário urbano, na maioria dos casos, exige que os missionários sigam uma estratégia abrangente, que proclame o evangelho do amor salvador de Deus e demonstre o mesmo evangelho de modo prático. Lidar diariamente com a injustiça social e as diferenças econômicas éuma questão prática para os missionários urbanos.

2. Diversidade racial, étnica e cultural. Em muitos países, as populações urbanas são compostas de pessoas de vários contextos. Elas representam tribos diferentes, castas, raças classes sociais e falam idiomas diferentes. Inevitavelmente, isso afeta a estratégia missionária e o desenvolvimento da Igreja e exige misstonários que gostem de estar perto de tipos humanos diversificados.

3. Pluralismo religioso. Nos vilarejos, a maioria das pessoas segue uma determinada religião, mas os habitantes da cidade seguem várias crencase práticas religiosas. Os missionários urbanos podem dar atenção principal a um grupo, mas devem estar preparados para testemunhar a outros grupos, bem como para responder aos que rejeitam todas as religiões e aos que consideram verdadeiras todas as religiões.

4. Atitudes antiurbanas. Até algum tempo, a maior parte do trabalho missionário era feita em áreas rurais. No passado, isso fazia sentido pois a maior parte da população vivia em comunidades rurais. No entanto, o maior desafio está agora nas cidades, e existe uma grande carência de obreiros. Muitos missionários são tão incomodados pelo barulho, tráfego, poluição e problemas sociais como o crime e a falta de moradia adequada da cidade que preferem trabalhar em áreas rurais. Vilarejos não alcançados sem dúvida precisam ouvir o evangelho, mas, em vista das massas de não salvos e de pessoas sem igreja nas cidades, uma atenção maior deve ser dada aos centros urbanos.

5. Álto preço. Uma questão prática para as agências missionárias é o alto custo financeiro do trabalho urbano. Em primeiro lugar, a moradia para os missionários é mais cara na cidade. Nos vilarejos, um pedaço de terra para a construção de uma igreja custa muito pouco ou nada, e os próprios crentes podem construir seu lugar de adoração. Já nas cidades, a propriedade é cara, há normas de construção a seguir, sindicatos e salários mais altos a pagar. Esses e outros fatores levam os missionários a evitar as cidades e procurar as áreas rurais. E A Palavra de Deus para as cidades À Palavra de Deus deve sempre sero ponto de partida em missões. Para entender a vontade e Deus para as cidades, precisamos mais que versículos espalhados pela Bíblia. Temos de ver “e plano total de Deus, desde a criação ca queda do homem à redenção e consumação, no E que diz respeito à aplicação às cidades. Diante disso, sugiro que os seguintes ensinos bíblicos sejam considerados; E 1. Todos os seres humanos são criaturas de Deus,

Peitos sua imagem e caídos em pecado, e o evange“Aba da graça salvadora de Deus em Cristo aplica-se a todos. Com isso, quero dizer que o evangelho satisfaz as necessidades espirituais de pessoas de todas as raças, nacionalidades, tribos e classes sociais, As cidades impressionam pelo fato de serem multiétnicas, multiculturais e multir"religiosas, À Bíblia, porém, ensina que há um "evangelho, de um Deus único, pormeio deum "nico Salvador, oferecido a todos os que vivem "nas cidades, Essa verdade é básica para entender a missão urbana. E 2. Enquanto as necessidades são diferentes de pessoa para pessoa e de lugar para lugar, as necessidades vitais são universais e devem ser atendidas.

Os habitantes da cidade têm uma percepção

diferente quanto às suas necessidades. Alguns identificarão suas necessidades como emprego, melhor moradia, assistência médica e educação. Essas necessidades são verdadeiras e legítimas, -euma abordagem holística da missão urbana irá atender muitas delas. Contudo, a tendên"Cia é que o missionário fique tão envolvido em ajudar a satisfazer as necessidades do povo que "acabe negligenciando o mais importante. As "necessidades mais importantes são aquelas que a Bíblia declara serem as mais urgentes e críticas dos povos: as necessidades universais do arrependimento e da conversão, da reconciliação com Deus e da vida eterna por meio da fé em Cristo.

É da vontade de Deus que as cidades sejam

evangelizadas. Em vista do viés antiurbano que mencionamos, essa questão deve ser enfatiza- “da, Na Bíblia, as missões urbanas começaram

E com a história de Jonas, o profeta do Antigo

Testamento, a quem Deus chamou para pregar

aos perdidos na cidade de Nínive. Jonas representa todos aqueles que, através dos anos, tentaram evitar o chamado à cidade. Entretanto, como Jonas descobriu, Deus levava a sério à pregação de sua mensagem nos limites urbanos. Deus importou-se com os ninivitas, seus filhos, e até com os animais (Jn 4,11). À comissão de Cristo de “ir e fazer discípulos de todas as nações” proíbe negligenciar as cidades com suas multidões de todas as tribos e raças. É significativo que a estratégia missionária do apóstolo Paulo foi inteiramente urbana. Embora tenha sofrido hostilidade na maior parte das cidades nas quais trabalhou, Paulo sabia que Deus queria as cidades evangelizadas.

4. Igrejas vivas que pregam o evangelho são a esperança das cidades, e desenvolver tais igrejaséa chave para as missões urbanas. O Novo Testamento trata as igrejas como comunidades da “nova aliança” em Cristo, cuja missão é comunicar o evangelho e, pela sua presença e atividade, serem faróis e arautos do Reino de Cristo. Podemos dizer que as igrejas nas cidades são agentes transformadores de Cristo na sociedade, À estratégia de Paulo começou com evangelismo, continuou com plantação de igrejas e, por meio de seu ensino, escritos e exemplo, preparou as igrejas para serem luz, sale fermento em suas respectivas comunidades. As igrejas que falham nisso são de pouca utilidade para a cidade.

5. As cidades são campos de batalha onde a guerra espiritual entre o Reino de Cristo e o de Satanás é muito evidente. Agostinho escreveu que em cada cidade há duas cidades: a cidade de Deus e a cidade de Satanás, e elas estão em conflito contínuo uma com a outra. E inegável que as cidades possuem fortalezas de poder satânico que resistem à expansão do evangelho e promovem injustiça na sociedade. As cidades não são más porque são cidades. Para ser mais exato, elas maximizam o potencial humano tanto para o bem quanto para o mal. Há muito de belo e bom nas cidades: escolas, hospitais, produtividade. As cidades melhoram a qualidade de vida das pessoas. Ao mesmo tempo, o poder do mal é evidente: o pecado manifesta-se não

280 só no mal praticado por pessoas, mas também em instituições cuja política e ações exploram e oprimem, bem como no uso incorreto dos sistemas pelos quais as cidades são conduzidas. Obreiros urbanos devem manter-se afastados do otimismo excessivo quanto ao que se pode realizar e da depressão, quando vêm as recaídas. Devem também possuir a consciência bíblica de que a guerra espiritual continua.

6. Trazer shalom a paz do Reino de Deus à cidade, com suas variedades de povos, culturas, religiões e problemas, necessita de ministérios holísticos multifacetados. Esses ministérios holísticos devem ser projetados para fazer discípulos de Jesus Cristo; para multiplicar igrejas em cada povo; para demonstrar compaixão e promover a justiça; para cuidar do meio ambiente como criação de Deus; para orar constantemente, de modo que Satanás seja derrotado e Cristo seja exaltado em cada esquina da cidade. Em cidades com muitas línguas e culturas, a plantação de uma igreja forte deve ser executada em todasas diferentes comunidades para que o evangelho possa ser ouvido e entendido por todos.

O cuidado pela criação de Deus é uma obrigação cristã, e os discípulos de Cristo em centros urbanos devem estar na vanguarda dos esforços para conservar e proteger a terra, o are a água. Não só as pessoas são prejudicadas, mas o próprio Deus é desonrado pelo ar poluído, a água tóxica e a terra contaminada. À oração pelas cidades é atividade missionária. “Procuraia paz da cidade,” disse Jeremias ao povo de Deus na Babilônia, “e orai por ela”. Nem Satanás, nem os problemas da cidade podem resistir aos efeitos da oração.

7. À visão escatológica da nova Jerusalém inspira os obreiros urbanos de Cristo e influencia a agenda missionária. O movimento da história através da Bíblia vai desde o jardim do Éden, onde ocorreu a queda do homem, atéa nova Jerusalém, cidade que Deus está preparando para nós. À vida na cidade está diante de nós, por isso, acredite ou não, todos os filhos de Deus serão urbanos no futuro! À nova Jerusalém será uma cidade na qual a verdade e retidão serão o modo

O desafio das cidades de vida, e só o nome de Cristo será honrado (Ap 21.10-27). Essa é uma visão que deve nos motivar agora a continuar, apesar dos obstáculos, pois, como Abraão, nossa face está voltada para “a cidade que tem fundamentos, da qual Deus é o arquiteto e edificado” (Hb 11.10). Passos para o engajamento em missões urbanas Suplico a todos os envolvidos na realização da vontade de Deus em alcançar os perdidos para Cristo a considerar o desafio das cidades em crescimento do mundo. À migração para as cidades é tão grande que deve haver um propósito divino e redentor por trás dela. Que resposta, então, daremos? Essa resposta não deve depender de nossa preferência ou não por viver em cidades. Como foi para Jonas, e sem dúvida para Paulo, a pergunta é se iremos para onde obreiros são necessários e aonde Deus quer que estejamos. Para os que estão dispostos a explorar o que Deus pode ter em mente, sugiro alguns passos:

1. Cresça. O mais importante é seu desenvolvimento espiritual. O ministério na cidade necessita que você vista “toda a armadura de Deus” (Ef 6.11), não apenas uma vez ou ocasionalmente, mas todos os dias. Portanto, estenda seus horizontes espirituais, vá além de seu desenvolvimento individual nos assuntos relacionados à Igreja e às áreas de ministério nas quais você deve pagar um preço para fortalecer os outros.

2. Envolva-se. Envolva-se em algum tipo de trabalho missionário urbano organizado. Ele lhe dará uma experiência valiosa e testará seus dons para o ministério. Ofereça-se como “aprendiz” de um pastor urbano eficaz, ou de um evangelista, ou de um missionário. Observe cuidadosamente como o Senhor usa seus obreiros. Aprenda tudo que você puder sobre como apresentar o evangelho a tipos diferentes de pessoas ea como suprir necessidades diversas.

3. Aprenda. Leia livros e jornais que fale do trabalho missionário nas cidades e aprenda tudo que puder sobre modelos diferentes de ministério urbano. Se possível, faça um curso deminis-

ER siim io

para 1. por são tão estratégicas missões hoje.

Explique milhões de migrando

se preparar para o nas 4. guiar agências missionárias entre trabalho que você cidades, faz evitar tério urbano numa faculdade teológica ou num seminário, Algumas escolas oferecem programas acadêmicos avançados em missões urbanas.

4. Explore. Estude uma determinada cidade. Comece pelo mapa, identificando suas diferentes regiões: as áreas comerciais, as zonas industriais e os bairros residenciais, Analise atentamente as áreas que estão crescendo em população e os tipos de pessoas de culturas encontrados ali, Então escolha um bairro e estude sua gente: religiões, culturas, idiomas condições sociais, Pergunte sobre suas necessidades espirituais, sociais e materiais, Descubra se há igrejas vitais para cada grupo linguístico, Pense, então, em meios de promover o Reino de Cristo nesse bairro. ESTES TE IEEE ST AEE

Perguntas

Explique que as cidades 2. por que pessoas estão

Como os missionários devem

Que fatores devem as

vilarejos e nas cidades? 5. O atrai para as e o que o

5. Ore. Desenvolva e mantenha um ministério de oração pelas cidades, pois a oração é ação missionária, Você pode começar sua missão urbana imediatamente, fazendo uma lista de cidades de várias partes do mundo, Aprenda tudo que puder sobre o povo suas necessidades, orando regularmente para que Deus estabeleça seu Reino ali, diga esses passos e você aumentará sua compreensão do que seja uma missão urbana, Deus aumentará o desejo de seu coração pelas cidades e lhe mostrará que papel ele quer que você desempenhe, Considere um grande privilégio se ele o chamar para ser seu cooperador no estabelecimento de seu Reino nos lugares mais estratégicos do mundo as cidades, TE E RESIDIR TREE estudo para as para as cidades.

trabalho missionário cidades?

na divisão de pessoas o nos querer as cidades?', 62 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 7 · Leitura — Johnstone, cap. 32: A Igreja é maior que você pensa', 'lereja gre maior você você 2 “A é E! Es e a E E go da

E ER:

EE o: o: é, E ud ó. mmmmmm à

ERR PATRICK JOHNSTONE foi diretor de E usa dá nteagidal de “18802 2004, Durante o longo período em gue trabalhou como missionário na África, começou a compilar material gue auxbiasse os cristãos a interceder sia ia E e a dó tais O efórco “resultou no livro Intercessão mundial, "hoje utilizado em todo o mundo como

Serramenta para a oração emproldos

ão aicançados, Atualmente, resídeno

Reino Unido, onde escreve livros, dá EE Endless é meniprela lideres,

Astigo adaptado dos capítulos de 6

aBdeAlgrejaémaior que vocêpensa (Monte Verde; Missão Horizontes,

Usado com permissão,

que que p pensa

Patrick Johnstone

eres 53 descreve o plano de Deus para a redenção dos pecadores, a ser obtida pelo Servo sofredor. Como retrato do Messias, o texto continha certo significado para o povo judeu, porém o sentido mais amplo só seria percebido após a morte expiatória do Senhor Jesus Cristo. É uma redenção espiritual. As palavras de Isaías 54 também têm aplicação espiritual, mais significativa para a Igreja dos gentios e judeus da nova aliança que para os judeus da antiga aliança. O texto prevê a restauração física de Israel após o exílio na Babilônia, porém se trata do tênue prenúncio de uma verdade espiritual maior: o retorno para Deus, que teria implicações globais e estava relacionada à pregação do evangelho. O próprio Paulo aplica Isaías 54.1 à Igreja. Muitos grandes comentaristas também aplicam essa profecia à Igreja. James Denney diz: “Vindo à Igreja, Isaías faz-nos compreender mais profundamente o valor e a eficácia do trabalho expiatório do Servo. Os sofrimentos do Servo foram pela Igreja, seu Corpo, não por si mesmo”.

Portanto, faço sem receio a mesma aplicação aqui, O versículo em si é extraordinário: “Canta alegremente, ó estéril, que não deste à luz; exulta com alegre canto e exclama, tu que não tiveste dores de parto; porque mais são os filhos da mulher solitária do que os filhos da casada, diz o Senhor” (Is 54.1).

A mulher estéril não está mais lamentando a vergonha de não ter filhos. Repentinamente, passa a se regozijar com o estrondoso aumento de sua descendência espiritual, em vez dos filhos físicos esperados de uma mulher casada.

Há um tom de restauração, de nova vída e de alegria. É a linguacom da vida, do reavivamento e do crescimento espiritual abundante. D eus concede de tempos tempos de de despertamento, despertamento, tempos tempos de de renovação renovação e tempos de restauração. Alguns alimentam uma visão pessimista do mundo e da Igreja, que vive nele: “As coisas só vão piorar!”, dizem. “Tal declaração reflete uma perspectiva sombria das Escrituras e da compreensão de como serão as coisas quando Jesus retornar: “Quando nai vier o Filho do Homem, achará, FEREDÃS porventura, fé ado na terra?” ERR (Lc 18.8) CASE Muitos utilizam esse versículo como justificativa para o cor ação descrente. Jesus não nos desafiou a sermos sombrios nem a desistir, aa aa Fa diria

360. Es MA a E a conta como usou e outros para a que no Grande Avivamento Grã-Bretanha depois Estados Unidos deu impulso ao novo movimento missionário. “Roy Hession, livro, The Calvary Road (Fort Washington: Christian Literature Crusade, 1950), menarte e que o que era a terra se “Todd Burke, Anointed for Burial (Gainesville: Bridge-Logos Publishers, Kurt K. Koch, Revival in Indonesia (Grand Rapids, Michigan: Kregel Publications, 1970).

222 mas a acreditar nele quando intercedemos. Em Isaías 54,1, temos a promessa de uma colheita mundial presente e futura para o Reino. A base histórica para aguardar uma colheita Na história da Igreja, houve períodos de esterilidade, épocas em que a vida espiritual estevcem baixa. Então Deus interveio com derramamentos do Espírito Santo, em avivamentos locais, nacionais até mesmo mundiais.

O primeiro e mais marcante foi no dia de Pentecostes, após a ressurreição de Jesus. Foi quando a estéril Igreja do Antigo Testamento, dos judeus, recebeu poder do Espírito Santo para se propagar pelo mundo conhecido da época. À profecia de Isaías 54.1 teve significado especial para aqueles tempos, e Jesus sem dúvida aplicou-a em seu ministério de ressurreição. E provável que tivesse em mente essa profecia quando prometeu que as portas do inferno não prevaleceriam contra a Igreja (Mt 16.18,19). No entanto, aquele avivamento certamente não seria o último. Ao longo de toda a história da Igreja, ocorreram reavivamentos semelhantes, os quais são meticulosamente analisados e descritos na obra de Edwin Orr sobre a história dos reavivamentos.? A frequência e o impacto desses despertamentos têm crescido de maneira marcante nos últimos 200 anos. Os que vivem no Ocidente anseiam para que isso ocorra outra vez e se perguntam se acontecerá algum dia, mas talvez não saibam que maravilhosos avivamentos têm sido verificados em outros continentes nos últimos anos.

Há muitos exemplos de avivamentos nacionais. À Grã-Bretanha experimentou-os século após século, por intermédio de Wycliffe no século XV, da Reforma no XVI, dos puritanos no XVII, do avivamento liderado por Wesleye

*(1973). Esse livro Deus William Carey na e nos em seu agem desse reavivamento ao redor do mundo, que começou da África Oriental Central. É trágico ''rra dos ódios étnicos e do genocídio da década de 1990.

“Arch Campbell, The Christ of the Korean Heart (London:

A Igreja é maior que você perca Whiteficd no século XVIII e o pelo avivamento evangelical em meados do século XIX, Ás igrejas luteranas da Finlândia, Noruega c Suécia tém experimentado uma série de reavivamentos nos últimos 200 anos. Os efeitos dos avivamentos galês e pentecostal, do início do século XX, repercutem ao redor do mundo até os dias de hoje. Nosúltimos 50 anos, milhões foram reavivados e pecadores foram conduzidos ao Reino por meio desses derramamentos do Espírito. Alguns dos mais significativos ocorreram na África Oriental, nos anos 1940 e 1950;º na Coreia, em meio à terrível Guerra da Coreia," nas décadas de 1950 e 1960; na China, no período de 1945 a 1948; no Camboja,” em 1975, na calmaria que precedeu a tempestade do comunismo, a qual dizimou a Igreja naquelas terras, na Indonésia e especialmente no Timor Oeste* e em muitas outras partes daquela imensa nação muçulmana. Nagaland e Mizoram, estados distantes do nordeste da India, tornaram-se os mais evangélicos do mundo nos últimos anos, nos quais a maioria da população foi radicalmente transformada pela obra de avivamento do Espírito Santo. Nas décadas de 1970 e 1980 vieram as conversões maciças a Deus na China e na América Latina, que decisivamente deslocaram o centro da gravidade do cristianismo evangélico das terras que por séculos foram seu local de nascimento, abrigo e prisão.

Há muita razão para regozijo. O crescimento atual da Igreja é de proporção única na história do mundo. O derramamento do Espírito no princípio da Igreja teve alcance e resultados no mundo inteiro, porém os números envolvidos não foram na escala que temos visto, com números crescentes nos últimos 200 anos. Podese esperar que isso aconteça, pois o que mais começar Union of Prayer, resultou Segundo e propaga a em Ruanda, na década de 1930, é se espalhou para a maior do avivamento há duas gerações tenha tonadoa

Naa ERNEST, Ri dos era

Dai Christian Literature Crusade, 1957),

expansão do cristianismo “em ministério Mundo B pe

É ERROR t “à visão fi nosúltimos séculos temsido BELL “telação ao mundo e fu- Pao o E E Sou devedor David Barrett estatísticas.

daria a prova convincente da vitória de Jesus, “senão uma demonstração mundial de poder? Mais ainda, acredito que vivemos o tempo da colheita final, antes do fim. Na década de 1990, mais pessoas foram acrescentadas à comunidade evangélica por meio de conversões, do novo pascimento e do nascimento em famílias evangélicas que a população mundial naquele ano do Pentecostes.

Estamos muito mais próximos de alcançar os objetivos básicos designados para nós pelo Senhor Jesus em seu ministério de ressurreição do que muitos reconhecem. Ainda há muito que fazer, porém é uma tarefa que pode ser cum-

Jesus estabeleceu um objetivo alcançável, “prida, e pretendo demonstrar isso. Jesus disse claramente que o mundo se tornaria um lugar muito desagradável e que o mal iria multiplicar-see até mesmo, aparentemente, triunfar (Mt 24), mas ao mesmo tempo seu povo iria multiplicarse e espalhar-se pela face da terra. Tudo está se voltando para um clímax, tanto o mal quanto o bem. Será uma maré alta à meia-noite: a escuridão aumentará nessa hora, mas também será a maré alta para a Igreja, uma vez que ela está “pronta para o Noivo.

Há muito pelo que se regozijar. Sinto-me realizado ao compartilhar com os crentes a base factual para tal afirmação. Fa-— lar sobre o Reino não tem de ser um assunto sombrio: na verdade quase sempre é aleadd gre. Há muitas causas para preocupação, e com motivos, “porém muitos pregadores se 00% estendem nos aspectos negativos, e isso é transmitido 40% seu público. Acredito que um dos obs- 20%

E

missionáti à visão) Missionária profundo pessimismo em ES ao “turo, Os cristãos respondem ne E a pelas definições e melhor ao encorajamento, Serão mais capazes de enfrentar os pontos negativos se pisarem o terreno firme c positivo da prometida esperancade crescimento e sucesso do Reino de Deus. Isaías faz exatamente isso. Ele oferece a esperança de uma colheita gloriosa para o desanimado povo de Deus. Esse é o meu alvo atual. Acredito que cada pregador e professor deva estar armado com os fatos do Reino, no mundo inteiro, com seus desafios e crescimento, comunicá-los ao povo. Isso irá incitar a visão, a intercessão a ação. A expansão do evangelho O diagrama “À expansão do cristianismo” mostra quanto progresso foi obtido pelos apóstolos primitivos. São apresentados três mundos e suas proporções para cada século ao longo dos últimos 2 mil anos. Esses mundos não são definidos geograficamente, mas baseados na resposta à fé cristã.

Mundo C. Todos os cristãos, em qualquer lugar do mundo. É a expressão mais ampla do cristianismo e inclui católicos romanos, ortodoxos, protestantes, anglicanos, evangélicos e todas as formas derivadas ou desviadas do cristianismo. O crescimento e o declínio

E fa E O Minde emma E A mo

Me

ss.

AE

ER

Ano RPE

PO

RIR

calada

Pois ab milênios Ea de evangelização RE, dos povos

que evangelismo e conversão não são coisa em bíblico, embora em quero com que o só é no não é nos mundos B precisam ouvir compreender evangelho tiveram oportunidade. Entretanto, que tencem mundos B e têm a probabilidade de ouvir evangelho evangelismo existente,

224 percentual do cristianismo nesses dois milênios em relação à população mundial são mostrados claramente. 2. Mundo B. Todos os não cristãos que ouviram o evangelho ou que vivem em sociedades e áreas nas quais provavelmente ouviram ou ouvirão o evangelho durante o tempo de sua vida. Esses são os não cristãos evangelizados.º É uma medida da margem crescente do Reino de Deus que deveria ser muito maior que a Igreja visível. Essa realidade só se constatou na Igreja primitiva e em nossos dias.” 3. Mundo À. Todos os não cristãos que não foram evangelizados e provavelmente assim permanecerão, caso não haja um novo esforço dos cristãos em levar o evangelho a eles.

É possível que no intervalo daqueles primeiros 45 a 50 anos cerca de 30% da população mundial tenha ouvido a mensagem do evangelho. Os apóstolos sem dúvida compensaram o tempo perdido no início. Eles de fato estavam virandoo mundo de pernas para o ar. No 14000 final do século V, a proporção

12000 aumentou para 40%. Apesar do lento início, édeadmiraros 8 10000 feitos extraordinários docristianismo apostólico. 3 8000

Seguiu-se então um mi- o 6000 lênio de conflito e declínio, à 5

dói medida que o cristianismo se tornava mais e mais um fe- 2000 nômeno europeu. Observe q como de 500 a 1800 a proporção de não cristãos no mun- E do aumentou, a população de

David Barrett (1987) demonstra muitos livros modernos os dois sejam igualados.

Não isso dizer trabalho missionário

e que e o aos o

À

A Igreja é malor que você pensa cristãos ficou estática ou em declínio ca proporção da população mundial em contato evangelho reduziu-se a números preocupantes. Só nos tempos atuais a porcentagem da população mundial evangelizada apresentou rápido crescimento. O gráfico mostra que o cumprimento da ordem de Jesus, em Marcos 16.15, de pregarmos o evangelho a cada pessoa, finalmente se mostra atingível nos tempos atuais. É óbvio que isso não cumpre toda a Grande Comissão. À apresentação do evangelho é o primeiro passo, um precursor necessário aos ministérios de discipulado e plantação de igrejas referidos em Mateus 28.18,19. O avanço do evangelho entre os povos Agora é possível enxergar como progredimos no discipulado dos povos do mundo. Isso é tão fundamental para o cumprimento pleno da Grande Comissão que será descrito em detalhes. O diagrama a seguir apresenta um quadro do progresso de 2 mil anos de pregação do evangelho.

Às duas linhas do diagrama mostram o número estimado de povos durante os dois últimos milênios. Em Gênesis 11, estão listados os 70 E Total alcançado ria a

Pe SAR

a

Po

SO

o e a. E EA a

Ano

a mesma ensino

Tear válido mundo A. Isso verdade. Há muitos milhões e não os percom o

Maioria Ruptura Ministérios Os menos e provável século XXI número de línguas faladas diminua rapidamente, à medida grupos em massa os Association, desenvolveu o termo em manuais cristãos, o número em países cristianizados que muito tempo não mantêm com nem possuem uma mas e Mission Frontiers (Pasadena: USCWM, diversas edições).

povos que foram registrados após o fiasco de

Babel. Ninguém sabe quantos povos etnolinyuísticos existiam na época de Cristo a estimativa aqui é razoável. O número de povos tem crescido consideravelmente nos últimos dois séculos, por duas razões principais: aumento numérico de nações-Estado, que divide povos “em múltiplos componentes; migração de comunidades étnicas de continente para continente. Calcula-se que existam hoje cerca de 13 mil povos etnolinguísticos distintos nos vários países do mundo."

O número de povos evangelizados em diferentes períodos da história subsequente é mais preciso. É interessante observar que eram poucos os povos alcançados por volta de 1800. O número de povos alcançados aumentou consideravelmente em torno de 1900, mesmo assim "tais da metade dos povos do mundo ainda era "composta de não alcançados. A mudança dramática ocorreu na última parte do século XX.

Embora ainda haja muitos povos não alcançados, o número representa apenas uma fração "do contingente de cem anos atrás. EO objetivo, portanto, é atingível Os povos do "nesta geração se nos mobilizar- FM mos emoração, esforço e trabalho 6,000 "conjunto para discipular o restante dos não alcançados. E o 5,000

O próximo diagrama mos- Ê 4.000 tra uma discriminação dos 13 e mil povos do mundo, pela difu- à 3,000 são do evangelho. Para simplifi- 5 dinda "cas, eles são arredondados de 500 à Essa representação simplificada do estado de discipulado dos povos do mundo serve como uma

É que no o

menoresse extingam. Alguns acreditam que serão perdidas “mundial e o uso dos meios de comunicação são E International Bulletin of Missionary Research (1985 em EA “Peter Brierley, da Christian Research

20 classificar grande de indivíduos E gação significativa o cristianismo organizado Que aínda se consideram “cristãos”, medida do progresso da obra. Resumidamente, este é o significado dessas quatro colunas; 7. Coluna 1. Atualmente, quase metade dos povos do mundo é de maioria presumidamente cristã. Isso inclui todos os grupos protestantes, católicos, ortodoxos, nativos e sectários marginais. É o que um indivíduo perceberia ser a sua identidade religiosa, qualquer que fosse nosso juízo de valor quanto à validade dessa afirmação, Essa é a base de todas as estimativas usadas nas obras World Christian Encyclopedia, Annual Statistics Table on World Mission, de Barrett, e Intercessão mundial, de Johnstone." Tratase de culturas que foram permeadas com o evangelho e valores cristãos, embora as gerações subsequentes mantenham apenas uma noção conceitual do que é ser cristão.” 2. Coluna 2. “Ruptura missiológica” é o termo cunhado por Ralph Winter!? para definir aquele ponto da evangelização de um povo mundo e seu discipulado Ee é pi

Liar E

A o cristá missiológica pioneiros alcançados

que linguísticos 3 mil línguas e culturas a elas associadas. À rápida urbanização dois principais fatores contribuintes. diante).

“cristão nocional” vários há que nenhuma licompreensão clara do conteúdo do evangelho,

Es

“A lista do Projeto Josué foi compilada pesquisadores, tendo base várias listas de do mundo, partir e o avanço entre os grupos povos terra.

a no qual o impacto do evangelho se torna tão significativo que cria uma “massa crítica” de crentes nativos e onde o cristianismo se torna uma parte viável da cultura nativa. Entre os cerca de 3 mil povos dessa categoria estão os coreanos, que experimentaram um enorme crescimento da Igreja no século XX, embora os cristãos representem ainda menos de um terço da população total. O mesmo vale para os chineses de Cingapura, os tâmiles da Índia e os turkanas do Quênia, 3. Colunas 3 e Representam os cerca de 3.500 povos nos países que ainda são campos pioneiros para o empreendimento missionário, À igreja nativa não existe, ou ainda é pequena demais ou culturalmente marginalizada para causar impacto nesta geração sem ajuda externa. Estima-se que de 1.200a 1.500 povos não possuem uma única igreja nativa ou uma equipe transcultural de missionários trabalhando entre eles. 4. Colunas 3 e 4 (partes mais escuras). Representam os povos com população acima de por de 1994.

Perguntas 1. Explique a diferença entre acompanhar o acompanhar do evangelho mais animadora? 2. Por que Johnstone acha possível completar

ANJ O QUO VOCÊ pera

10 mil e menos de 5% de cristãos ou 2% de evangélicos.

Nunca antes foi elaborado um quadro tão claro dos limites da tarefa inacabada de discipular os povos. Não se ousou subestimar os duros desafios a serem enfrentados, a fim de se alcançar essa tarefa, mas finalmente é possível perceber que o cumprimento da tarefa está ao nosso alcance,

O Projeto Josué é a maior mobilização estratégica de cristãos da história da Igreja para discipular os povos do mundo, Apoio e entusiasmo têm vindo de um espectro amplo de denominações, agências e países. Nestes, o envolvimento tem sido predominantemente não ocidental. À visão era de uma igreja para cada povo até o ano 2000. Essa meta pode não ter sido alcançada, mas foi verificado um aumento significativo no nível de compromisso de ministérios de plantação de igrejas aos povos que não têm igrejas. À conversão real dos indivíduos e o momento para o avanço do evangelho são obra do Espírito Santo, em quem confiamos, e não resultado de nossos planos grandiosos e técnicas inteligentes.

por povos a para estudo avanço do evangelho para a população da terra de da Qual medida é

Res ie na a tarefa da evangelização mundial?', 64 from cursos where slug = 'perspectivas';

commit;
