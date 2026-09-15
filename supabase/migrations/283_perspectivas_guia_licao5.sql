-- 283_perspectivas_guia_licao5.sql
-- Guia de estudo da Lição 5 ("A expansão do movimento cristão mundial").
--
-- PROCEDÊNCIA DIFERENTE DAS DEMAIS AULAS: este guia veio em PDF ESCANEADO,
-- sem camada de texto, e por isso é transcrição de OCR — não extração. A
-- garantia é menor que a das Lições 1, 2, 3 e das leituras, onde foi possível
-- provar por contagem de caracteres que nenhuma letra faltava. Aqui a
-- conferência foi por leitura das imagens.
--
-- O escaneamento trazia a página vizinha sangrando na margem. O lado varia com
-- a paridade do caderno: página ímpar sangra pela ESQUERDA, par pela DIREITA.
-- Cortar o lado errado destrói texto bom — foi medido página a página pela
-- densidade de preto nas duas bordas, e o corte aplicado conforme a medição.
--
-- O Woodberry (que o guia chama) passa a vir depois do guia.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
  v_wood uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  -- abre espaço: o Woodberry sai da 26 e vai para a 27
  select id into v_wood from aulas
   where curso_id = v_curso and titulo like 'Lição 5%Woodberry%';
  if v_wood is not null then
    update aulas set ordem = 27 where id = v_wood;
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 26) then
    update aulas set titulo = $t$Lição 5 · Guia de estudo — A expansão do movimento cristão mundial$t$,
                     conteudo = $conteudo$- A expansão do + Movimento cristão mundial

R ESTA LIÇÃO O AJUDARÁ A:

ar de forma resumida como a de Deus continuou a alcançar s povos em 4.000 anos de ever o progresso do Evangelho tes regiões geográficas e áreas em quatro épocas a partir o, e depois da Reforma até a | de William Carey, chamado Missões Modernas (por volta 800 d.C).

car o avanço do Evangelho quando o povo de Deus sobediente, por meio de smos” diferentes, como: “vindo” ou mensageiros “indo”, ia ou involuntariamente.

ir a ideia de que as bênçãos de vem ser passadas adiante, ou ser retiradas.

entar os aspectos culturais do de Jerusalém (descrito em Atos Reforma Protestante.

aver algumas das características formação social que resultou da sionária,

NO NÍVEL AVANÇADO:

crever as duas estruturas is da Igreja ao longo dos séculos o os termos “modalidade” e ade”.

Até agora, vimos como o enredo da Bíblia inteira se desdobra em direção ao cumprimento do propósito global de Deus. Mas o que, de fato, acontece depois de Atos 28? A maioria de nós tem uma noção vaga a respeito dos crentes primitivos, suportando as perseguições ainda do Império Romano. Depois disso, no entendimento popular, a era das trevas medievais apagou o movimento cristão com conceitos como a apostasia da Igreja Católica Romana, as cruzadas e o aparente caos até a Reforma. Se avaliarmos somente esses acontecimentos, as divinas promessas de abençoar as nações teriam sido mais uma esperança falsa do que verdadeira.

Depois do primeiro século, será que Deus se frustrou com seus seguidores e abandonou a sua intenção de fazer com que o Evangelho fosse proclamado até os confins da terra? Será que Deus acordou apenas agora para as claras possibilidades de missões no mundo moderno?

A pergunta central é: Há alguma continuidade na história? Muitos historiadores dizem que não, explicando qualquer sucessão de eventos aparentemente significativa como uma ilusão. Aqueles que creem em Cristo, porém, precisam somente lembrar que o próprio Jesus anunciou o Reino de Deus quando declarou: “O tempo é chegado!” (Marcos 1.15). Essa declaração deveria ser um alerta suficiente para a realidade de um propósito magnífico em toda a história. O Reino de Deus veio e ainda virá com maior poder.

Por que olharmos para a história? Não é uma simples questão de datas e nomes notáveis, mas de perceber a mão de Deus cumprindo Seu propósito. Aqueles que estudam a história da perspectiva de Deus não se decepcionam. São eles que podem, dentro do “enredo” que se desdobra, distinguir entre aquilo que realmente importa e o que é periférico.

Nesta lição, estudaremos como a bênção de Deus estendeu-se sucessivamente de um povo em uma determinada região a outro. Veremos as consequências drásticas para o movimento cristão nos momentos em que a bênção não foi compartilhada. Perceberemos também como, ao longo da história humana, o Espirito Santo não deixou de estar presente e de operar, muitas vezes, através de pessoas inseridas em tradições eclesiásticas as quais mal conhecemos, ou mesmo até discordamos.

Palavra - chave:

CONTINUIDADE Precisamos conciliar que o Deus de todas as nações é o mesmo Deus de todas as gerações. Ele deve ser seguido plenamente por aqueles que o conhecem como o Deus de toda a história, pois não deixou de cumprir Seu propósito entre a era apostótica e a Reforma Protestante.

DDD

1. O TEMA CENTRAL DA HISTÓRIA: O “CONTRA-ATAQUE” DO REINO DE DEUS

Ao longo de toda a história, verificamos a “invasão” de Deus no domínio de Satanás, desfazendo todas as suas obras e libertando as pessoas para glorificar o Seu nome. É uma batalha de custo elevado! Muitas vezes, na história redentora de Deus, seus servos sofrem assim como Cristo sofreu nessa luta,

Seguindo o modelo proposto pelo Dr. Ralph Winter, dividiremos a história desde a era apostólica até os dias de hoje em cinco períodos de 400 anos. Esse esquema nos ajudará a lembrar e acompanhar a história que se desenvolve. Embora padrões fascinantes e temas recorrentes apareçam, Winter obviamente não quer dizer que a história siga um padrão rígido de ciclos. A divisão em períodos serve somente para facilitar a nossa compreensão.

Os cinco períodos são: 1. 0-400 d.€.: Alcançando os Romanos 2. 400-800: Alcançando os Bárbaros 3. 800-1200: Alcançando os Vikings 4. 1200-1600: Alcançando os Muçulmanos (ou Sarracenos) 3. 1600-Hoje: Alcançando Todos os Povos até os Confins da Terra

Durante esses cinco períodos, veremos também quatro “mecanismos” que Deus utilizou para avançar o Seu Reino.

A. Quatro Mecanismos para a Missão

A maior parte da história não foi caracterizada pela fiel obediência do povo de Deus em missões transculturais, porém, mesmo assim, Deus cuida para que a bênção continue a se espalhar. Para vermos essa continuidade maravilhosa através da história, precisamos reconhecer quatro mecanismos que demonstram como Deus avança Sua Missão com ou sem a cooperação do Seu povo escolhido (veja o gráfico completo na p. 243).

Ida Voluntária (com intenção missionária) Exemplos: Os profetas pregando às nações ao redor de Israel - O próprio Senhor Jesus sendo enviado pelo Pai — Paulo e Barnabé em suas viagens missionárias.

Ida Involuntária (inicialmente sem intenção missionária) Exemplos: José sendo vendido como escravo para o Egito — Os hebreus sendo levados para o cativeiro na Babilônia — Os que saíram da Palestina por causa da perseguição.

Vinda Voluntária Exemplos: Naamã da Síria que foi a Eliseu — A Rainha de Sabá foi à corte de Salomão — Os judeus de “todas as nações” presentes em Jerusalém no dia de Pentecoste.

Vinda Involuntária Exemplos: O repovoamento de Samaria (2 Reis 17) - Os Romanos ocupando Judeia e Galileia dos gentios.

B. Redenção através da Bênção

Quando pensamos na bênção de Deus que foi estendida, precisamos distinguir a ideia comum no Ocidente de bênçãos (plural) — benefícios materiais ou sociais — da ideia hebraica de bênção (singular) — uma realidade relacional que confere tanto responsabilidade e obrigação quanto privilégio. Bênção é uma palavra que precisa ser entendida em termos de “família”. Ao estender a Sua bênção, Deus estabelece uma família enorme: uma coleção de famílias resultantes da fé que juntas demonstram Seu Reino e Sua glória. O povo de Deus deve “ser” essa bênção de Deus, bem como passá-la adiante para os outros.

€. O Avanço Cultural e Geográfico

Cada vez que o Evangelho “invade” uma nova área geográfica ou cultural, encontramos uma combinação de grupos de povos, línguas, culturas e sistemas políticos. Ao ler o artigo de Blincoe, atente tanto para a expansão geográfica quanto cultural. Em cada período, reconheceremos também um período de “florescimento” cultural e econômico, resultante da transformação social, graças à entrada do Cristianismo e à presença da comunidade cristã.

teia Blincoe (cap. 33, p. 227-228): Como as águas cobrem o mar, da introdução até a seção: De O a 400: de Jerusalém às fronteiras do império Romano.

2. O PRIMEIRO PERÍODO: ALCANÇANDO OS ROMANOS (DE 0 A 400 D.C.)

A. Mecanismo

O Evangelho avançou através de todos os quatro mecanismos. O método da “ida voluntária”, encontramos no grupo apostólico de Paulo, e o da “ida involuntária”, na dispersão dos cristãos durante as perseguições.

B. Avanço

O Evangelho se espalhou por todo o Império e por todas as'camadas sociais. O avanço geográfico foi facilitado graças às línguas em comum (especialmente o grego, como também o latim), a presença das sinagogas (com gentios tementes a Deus), a paz prevalecente (a Pax Romana) e uma extensa rede de estradas. Durante os primeiros séculos, o Cristianismo foi a única religião sem identidade nacionalista ou política e, por isso, era atraente para muitos em todo o Império. Uma vez que se tornou a religião oficial do Império, carregou consigo um estigma cultural de ser “romana”. Isso causou uma desaceleração considerável em seu avanço nas áreas além do Império Romano, especialmente nas regiões em oposição (como, por exemplo, a Pérsia).

€. Florescimento

No final desse período (o século IV), houve grande prosperidade cultural e econômica entre os povos “cristãos”, O que teria acontecido se os romanos tivessem usado apenas parte da sua riqueza e poder para alcançar os povos além de suas fronteiras? É bem possível que seu destino teria sido outro e que o Evangelho teria avançado mais rapidamente.

Aolero artigo de Blincoe, atente para suas referências à transformação da sociedade pela presença da comunidade cristã (por exemplo, o bloco “Os benefícios de crer”, na página 230) e ao longo da história, a necessidade de “desjudaizar”, “desromanizar” e “desocidentalizar” o Evangelho (leia Atos 15 à luz das observações de Blincoe).

[cite] Leia Blincoe (cap. 33, p. 228-232): Como as águas cobrem o mar, (de O a 400; de Jerusalém às fronteiras do Império Romano).

3. O SEGUNDO PERÍODO: ALCANÇANDO OS BÁRBAROS (400-800 D.C.)

A. Mecanismo

As tribos germânicas (bárbaras) invadiram o Império Romano e acabaram sendo evangelizadas (além do contato com o Cristianismo ariano). Esse é um exemplo da “vinda voluntária”. Mais tarde, houve o estabelecimento das ordens monásticas. A maior parte da tradição monástica ficou conhecida pelo pastoreio das pessoas ao redor do mosteiro, mas alguns mosteiros se tornaram muito missionários, seguindo o padrão da “ida voluntária”. Os mais conhecidos eram os celtas ou “peregrini” irlandeses (evangelistas itinerantes) e seus seguidores anglo-saxões, entre eles, Patrício, Columba, Columbano e Bonifácio.

B. Avanço

Tribos bárbaras, como os godos, os visigodos, os vândalos e os anglo-saxões, invadiram a maior parte da Europa Central e Ocidental. Embora Roma tivesse perdido a metade do seu Império (parte ocidental), o mundo bárbaro ganhou a fé cristã no processo.

€. Florescimento

Carlos Magno, mesmo sendo descendente de uma tribo germânica, facilitou o crescimento da educação e do desenvolvimento econômico que temporariamente tiraram a Europa do caos. Sob a forte influência dos centros monásticos, Carlos Magno promoveu os centros missionários de vida monástica que tinham se espalhado e mantido a fé por toda a Europa. Ainda influenciado por Magno, a “Renascença Carolíngia” dividiu a “Era das Trevas” Medieval em dois períodos distintos. Contudo, por mais que Carlos Magno tenha promovido a fé, todo o seu esforço de evangelizar os Vikings do norte foi pequeno e insuficiente, além de se apresentar tardiamente.

pita à Dc SD

[cite] Leia Blincoe (cap. 33, p. 232-236): Como as águas cobrem o mar (De 400 a 800 — Alcançando os Bárbaros).

4. O TERCEIRO PERÍODO: ALCANÇANDO OS VIKINGS (800-1200 D.C.)

A. Mecanismo

Os saqueadores vikings foram alcançados para Cristo por seus prisioneiros. Outra vez temos o padrão da “vinda voluntária”.

B. Avanço

O Evangelho chegou até a Escandinávia e a outras regiões do norte da Europa.

C€. Florescimento

A Reforma Gregoriana foi reforçada pelos movimentos espirituais da Ordem de Cluny, dos Cistercienses e outros da mesma natureza em busca do Cristianismo autêntico e em reação à crescente corrupção no movimento monástico. No entanto, esse movimento logo perdeu sua expressão missionária, que é descrito no próximo período.

[cite] Leia Blincoe (cap. 33, p. 236-237): Como as águas cobrem o mar (De 800 a 1200: Alcançando os vikings).

5. O QUARTO PERÍODO: “ALCANÇANDO” OS MUÇULMANOS (OU SARRACENOS)? (1200-1600 D.C.) Este período é diferente dos demais em muitos aspectos. Daí as aspas e o ponto de interrogação.

A. Mecanismo

Uma vez que os Vikings se renderam ao “contra-ataque do Evangelho”, eles se tornaram os líderes da maior “perversão” de missões na história: as Cruzadas. Usando um padrão muito falho da “ida voluntária”, eles destruíram e conquistaram territórios sem nenhum sucesso em estender a bênção do Evangelho aos muçulmanos (às vezes chamados de sarracenos).

Ao mesmo tempo, um novo tipo de monasticismo surgia, verdadeiramente missionário. Isso resultou no movimento dos frades que viajaram por toda a Europa propagando o Evangelho. Porém, quando eles começaram a ir para terras além de suas fronteiras, a peste bubônica atacou. Justamente os frades, que cuidavam dos enfermos, foram os mais atingidos. Talvez fosse a maneira que Deus utilizou para tirar os mensageiros do meio daqueles que não queriam ouvir.

B. Avanço

Em termos de avanço do Evangelho, as Cruzadas fracassaram. No final desse período, o início da expansão colonial trouxe avanço da fé cristã, mas não na sua forma protestante. É nesse período que o Cristianismo chega ao Brasil.

€. Florescimento

A Renascença e a Reforma foram tempos de florescimento. A Reforma descentralizou dramaticamente o Cristianismo. A versão católica ou latina do Cristianismo, com suas estruturas monásticas de missões, desenvolveu-se junto com a expansão colonial. Os recém-formados movimentos protestantes se ocuparam mais com reformulações teológicas e ficaram praticamente sem estruturas missionárias para alcançar outras pessoas além de seu próprio povo.

[cite] Leia Blincoe (cap. 33, p. 237-239): Como as águas cobrem o mar (De 1200 a 1600: Alcançando os sarracenos).

42 4

6. O QUINTO PERÍODO: ALCANÇANDO TODOS OS POVOS ATÉ OS CONFINS DA TERRA (DE 1600 ATÉ HOJE)

A. Mecanismo

A expansão católica continuou, mas, por volta do ano 1800, sofreu um declínio repentino devido aos efeitos da

Revolução Francesa (e Napoleão saqueando a Europa) e da popularidade crescente do ateísmo (filósofo Voltaire e outros), deísmo e humanismo. No mesmo período histórico, o mecanismo da “ida voluntária” da missão protestante finalmente começou a funcionar.

B. Avanço

Isso não implica uma ausência do esforço missionário entre o período da Reforma até William Carey (1761- 1834), mas foi relativamente pouco. Mesmo assim, as missões feitas pelos Morávios foram notáveis. Houve movimentos de avivamento que também eram missionários — Pietistas, Puritanos e João Wesley — e que inspiraram William Carey. O grande missionário Carey foi muito mais do que só um evangelista. Ele também exerceu uma forte influência de transformação no subcontinente da Índia. Ele era industrialista, economista, médico, pioneiro na área midiática, tradutor, educador, botânico e reformador moral. Por toda sua postura social humanitária, e ainda mais por ter verificado e proposto a necessidade de organizações dedicadas ao avanço missionário (sociedades missionárias), fez por merecer o título de “Pai das Missões Modernas”.

€. Florescimento

A civilização ocidental, com toda sua prosperidade (e corrupção), pode ser o maior florescimento de todos. De certa forma, muitos países — inclusive o Brasil — desfrutam das vantagens dessa era globalizada. O Brasil é um país emergente, com crescente prosperidade. Porém, a pergunta ainda continua: se insistirmos em manter a bênção somente para nós mesmos, ao invés de compartilhá-la, será que Deus agirá para que as nações atualmente prósperas percam parte dos benefícios materiais que acompanham a bênção, para que o propósito de Deus seja cumprido em todas as nações (assim como fez no passado)?

[cite] Leia Blincoe (cap. 33, p. 239-244): Como as águas cobrem o mar (De 1600 a 2000: A era do silêncio e a era do grande avanço missionário).

7. AVANÇO PARA O LESTE

No primeiro milênio, o evangelho se espalhou mais para o leste do que para o oeste. No leste, entretanto, o evangelho encontrou grandes religiões interculturais e estatais, como Zoroastrismo, Budismo, Hinduísmo e Taoismo. Em contraste, à medida que o evangelho avançava dentro do Império Romano, na Europa e na África, religiões menores, locais e “étnicas” eram encontradas, as quais ofereciam menos resistência. Nas terras do Oriente, o Cristianismo se espalhou de forma abrangente, mas, em quase todos os casos, os cristãos permaneceram como uma minoria até as últimas gerações. Scott Sunquist lista cinco grandes avanços, dos quais o primeiro e o último foram os mais efetivos.

1. Avanço Persa (primeiro milênio)

2. Interlúdio Franciscano-Mongol (1206-1368) 3. Avanço jesuíta (1542-1773)

4. Avanço Protestante (1706-1950)

5. Indígenas Asiáticos (1950-presente)

[cite] Leia Sunquist (cap. 46, p. 352-356): Cristianismo na Ásia.

8. ESTRATÉGIA MISSIONÁRIA

R. Pierce Beaver agrega mais cor e profundidade para algumas das figuras históricas que temos mencionado. Ele explora as diferentes abordagens na estratégia de missões nos tempos antes de William Carey. À medida que você for lendo sobre cada uma das diferentes figuras e períodos, considere as diferentes abordagens que as missões usaram para o avanço do evangelho. Ao explorar o trabalho missionário dos séculos anteriores, é importante identificar as ações que resultaram em atrasos ou as que causaram mais danos do que bênção. Ao mesmo tempo, é importante reconhecer o valor estratégico duradouro de muitos esforços. Temos muito que aprender da sabedoria madura de muitas experiências e avanços.

A lista abaixo destaca alguns dos importantes problemas de comunicação transculturais que exploraremos mais para frente no curso. Permita que os relatos abram o seu apetite para ler além do que o curso Perspectivas pode oferecer, Atenção para estas quatro áreas gerais de estratégia missionária:

Adaptação. Considere as formas com que a cultura local foi respeitada e valorizada ou a transmissão do evangelho foi adaptada ao contexto.

Civitizar. Veja a contextualização dos movimentos resultantes. Até que ponto as igrejas locais eram permitidas de refletir sua cultura local? Ou será que eles se moldaram pela cultura do missionário?

Conquista. Em alguns casos, os missionários seguiram poderes imperialistas e colonizadores. Eles tinham o interesse de colocar os povos debaixo do domínio de seus países de origem? Eles eram vistos como pessoas que ajudavam o controle dos poderes estrangeiros?

Desenvolvimento. Os missionários frequentemente traziam novas formas de solucionar necessidades básicas. Por vezes, esses esforços eram considerados como um serviço de civilização ou parte de uma conquista econômica.

A. Bonifácio

Beaver caracteriza esta importante figura do movimento monástico como uma exibição de uma verdadeira “missão de envio”. Ele foi às tribos ao invés de expandir dominio político. Para encorajar as conversões grupais das tribos, ele usava algo que nós hoje chamamos de “confronto de poder”. Um exemplo claro de Bonifácio aplicando essa estratégia é este: Ele cortou as árvores sagradas dos outros deuses mostrando a impotência deles, confrontando-os com o poder de Cristo. Ele estabeleceu igrejas, mosteiros e escolas. Entretanto, no fim das contas, ele foi visto por aqueles que ele alcançou como um instrumento de expansão imperial,

B. As Cruzadas

De forma trágica, as Cruzadas misturaram missões com conquista. O efeito das Cruzadas tem repercussões no mundo muçulmano até hoje. As Cruzadas destacam duas outras figuras monásticas notáveis, Francisco de Assis e Raimundo Lúlio, que procuraram pregar o evangelho aos muçulmanos ao invés de participar da conquista violenta.

C. Expansão Colonial

Aexpansão imperial portuguesa, holandesa, espanhol, francesa e britânica estavam frequentemente relacionadas com as missões de diferentes formas. Métodos normalmente dependiam de se eles primeiro “cristianizavam” ou “civilizavam”,

D. Estratégias do século 17

Sunquist já mencionou alguns dos aspectos inovadores da estratégia missionária Jesuíta ao levar o evangelho para o leste. Os experimentos e as experiências dos Jesuítas normalmente determinam o clima missiológico que os missionários encontram hoje em dia. Os Jesuítas não apenas encontraram forte resistência no Japão, apesar dos métodos inovadores, mas eles também afetaram a resistência japonesa moderna ao evangelho. Algumas das abordagens criativas de Roberto de Nobili e Matteo Ricci ainda são consideradas como modelos missionários na atualidade.

[cite] Leia Beaver (cap. 35, p. 256-259a): A história da estratégia missionária, até a seção dos “Puritanos”.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

9. AS DUAS ESTRUTURAS DA MISSÃO REDENTORA DE DEUS

Ralph Winter afirma que a Igreja cresceu e se estendeu em missões seguindo formas encontradas dentro da estrutura social da época, tanto quanto formas encontradas na Bíblia. Por toda a história, embora os detalhes mudem, quando falamos da Igreja, vemos duas estruturas fundamentais: a estrutura congregacional e a missionária. Winter introduz os termos sociológicos “modalidade” e “sodalidade” para identificar as estruturas em momentos diferentes da história (observe que versões mais antigas do artigo utilizam os termos “modalício” e “sodalício”).

Ambas as estruturas existem em sociedades civis e religiosas. Também as encontramos na Bíblia, por isso, são legítimas e necessárias na Missão redentora de Deus. As modalidades trabalham para reforçar e ampliar a igreja. As sodalidades fortalecem e apoiam os grupos missionários. Ambas cooperam para uma simbiose essencial.

A. Estruturas Redentivas (antes e depois do Século |)

A estrutura congregacional seguiu o padrão da sinagoga da época. As estruturas missionárias encontraram seu precedente nos esforços missionários dos rabinos judaicos, mas logo se tornaram grupos muito dinâmicos, como o do apóstolo Paulo.

B. Primeiro Desenvolvimento (dentro da Cultura Romana)

Estruturas congregacionais passaram a reconhecer bispos com jurisdição territorial, conforme o padrão dos territórios magisteriais romanos. O termo romano para definir tais territórios era “diocese”. As estruturas missionárias que surgiram, como o movimento monástico, adotaram padrões da prática militar romana. Os protestantes, geralmente, tendem a estereotipar os mosteiros como lugares onde os monges procuram fugir do mundo real, Porém, a bem da verdade, os movimentos monásticos foram responsáveis, em grande parte, por levarem a bênção do Evangelho de Cristo ao mundo.

€. A Síntese Medieval

A sobrevivência das estruturas congregacionais (ou paroquiais) veio a depender, em grande parte, da maior devoção do movimento monástico. Vários dos maiores esforços missionários da história cristã surgiram a partir do movimento monástico. Quando, porém, os mosteiros se tornaram prósperos, os governadores locais tomaram posse da liderança, o que resultou em enfraquecimento espiritual e decadência.

D. A Recuperação Protestante

Já nos perguntamos o porquê de os protestantes celebrarem as maravilhas do Evangelho, mas falharem em estendê-lo ao mundo. Tanto Winter quanto Latourette, e outros estudiosos, apontam para o que pode ser o maior erro do movimento protestante: os reformadores abandonaram a estrutura da sodalidade. A vida monástica foi rejeitada, então praticamente não houve interesse em preservar as estruturas missionárias. William Carey chamou os cristãos a usarem “meios” para completar a comissão de Cristo. Esses “meios” conduzem diretamente às organizações missionárias. Ele propôs a formação de sociedades missionárias. Uma vez iniciadas, houve um aumento explosivo no número de missionários protestantes,

E. O Mal-entendido Moderno

Missões protestantes foram inicialmente organizadas sem o apoio denominacional. Gradualmente, as estruturas, até então independentes, se tornaram altamente reguladas e dominadas pelos líderes denominacionais. Isso trouxe tanto saúde quanto problemas para a expansão missionária. Como resultado, foi lançada uma segunda onda de estruturas missionárias, cnamadas de “missões de fé”, o que era na verdade uma segunda onda de iniciativa não denominacional (o que chamaremos de “A Segunda Era” na Lição 6). Alguns líderes fortes e altamente respeitados reconheceram o valor e a importância de algumas destas estruturas missionárias, sem ligações denominacionais. Mas, em geral, houve pouco apoio às estruturas missionárias, levantando críticas e dúvidas abertas quanto à legitimidade das sodalidades. Como esperado, isso resultou em um fracasso no campo missionário, em termos de iniciativa e encorajamento para as novas igrejas formarem suas próprias estruturas missionárias e enviarem seus próprios missionários. O fenômeno atual do extenso envio de missionários do “Sul Global” (povos não ocidentais) cresceu com pouco apoio missionário da igreja nacional.

[cite] Leia Winter (cap. 34, p. 245-255): As duas estruturas da missão redentora de Deus.

Qual a diferença entre o grupo missionário de Paulo e a igreja de Antioquia? Examine os dois aspectos do “envio” do grupo apostólico em Atos 13. No versículo 4, a palavra para “enviaram” (NVI) ou “despediram” (ARA) tem mais a ver com “liberar” e “deixar partir”. O versículo seguinte começa com “enviados, pois pelo Espírito Santo”, trazendo a palavra grega para “enviar”, com um significado forte, refletindo uma ordem militar. O grupo foi comandado pela igreja ou recomendado aos cuidados e controle de Deus? Perceba como a ideia de recomendação aparece em Atos 14.21-28 como um ato de entrega aos cuidados e autoridade de outra pessoa. Qual foi a importância da oração e do jejum em reconhecer os novos líderes, para uma obra específica debaixo do cuidado de Deus em Atos 13 e 14?

Releia a última frase do artigo de Winter. O que é crucial na insistência de Winter, em que ambas as estruturas não são somente legítimas, mas necessárias?

10. O FRUTO DO MOVIMENTO: TRANSFORMAÇÃO

A ideia central de toda esta lição é a continuidade da história. Deus tem orquestrado incessantemente os seus propósitos através das gerações e dos séculos. E nem todos os tempos são iguais. Existem períodos de declínio e inatividade aparente. Mas o propósito da missão de Deus nunca dependeu completamente das atividades humanas. Nós identificamos a natureza da história das missões como uma batalha prolongada, praticamente uma guerra espiritual. Nós temos visto como Deus usou diferentes mecanismos e movimentos. Nós apresentamos o propósito de Deus como o cumprimento da Sua promessa de abençoar as nações. As nações foram abençoadas? Deus está trabalhando e alcançando o Seu propósito? Qual tem sido o resultado? Segundo uma visão popular, o cristianismo tem sido a fonte de obstáculos e danos ao bom desenvolvimento das sociedades ao redor de todo o mundo. Mas isso não é verdade. Por mais que tenham existido coisas decepcionantes e destrutivas feitas em nome de Cristo, quando olhamos o movimento como um todo, o impacto positivo da pessoa de Jesus Cristo nas sociedades do mundo é incalculável.

A. A missão cristã traz bênção ou dano?

A atual controvérsia sobre as missões cristãs normalmente alega que a missão cristã sempre tem sido a serva fiel do colonialismo e é uma força destrutiva sobre as culturas indígenas. Robert Woodbury desafia essas ideias, normalmente baseadas em anedotas e ficção, com dados sociológicos verificáveis. Se o resultado concreto da presença de missionários é o dano a sociedades, esperariamos condições piores em contextos onde os missionários passaram mais tempo ou estiveram em maior número. Mas Woodberry diz que as estatísticas mostram exatamente o oposto. Nas situações onde os missionários têm estado presentes e tiveram liberdade para trabalhar, sociedades melhoraram em áreas de desenvolvimento humano, como alfabetização, matrículas educacionais, mortalidade infantil, expectativa de vida, desenvolvimento econômico, libertação da corrupção e democracia política.

[cite] Leia na plataforma WoodBerry: O impacto social de missões cristãs.

B. O ideal e o alvo do reino

Segundo o historiador famoso Kenneth Scott Latourette, o ideal e o objetivo do reino de Deus tem moldado abrangentemente a história posterior a Jesus. Latourette documentou o avanço e o desenvolvimento do movimento do Cristianismo Mundial em vários estouros de crescente magnitude e frequência. Segundo a vi do Latourette, o movimento cristão entrou na sua maior expansão durante o último século. O movi explodiu justamente como ele pensava que aconteceria. Latourette não somente contou a história atual cristianismo, ele também resumiu o fruto do movimento.

Fonte: Kenneth Scott Latourette. “A History of Christianity” (Peabody MA: Prince Press, 1997), p. 1470-1471. Traduzido como “Uma história do cristianismo”, feito pela editora Hagnos.

€. A História da Transformação

O fruto de mudar a sociedade em direção à paz e justiça do reino de Deus não era uma questão de esperança passiva. O movimento missionário tem sido quase sempre uma força constante de mudança positiva. Paul Pierson nos conta a história.

1. Monasticismo. Veja novamente a tremenda herança do movimento monástico. Este movimento, apropriadamente entendido, tem sido sal e luz nas mãos de Deus através dos séculos.

2. Precursores. A Igreja tem tido um impacto tremendo nas nações quando os valores centrais do evangelho floresceram e deram frutos com o tempo. Os movimentos dos puritanos, pietistas, morávios e wesleyanos trouxeram um foco maior na esperança bíblica por uma transformação pessoal e comunitária. Não é surpresa que a visão pela evangelização andou de mãos dadas com uma profunda transformação social.

3. O contraste chocante entre a realidade e o relatório falso. William Carrey é reconhecido como o pai das missões modernas. O que normalmente não se sabe é o alcance fenomenal de seus esforços e das incríveis mudanças que ainda estão acontecendo por causa de seu trabalho. Como contraste, temos o estereótipo dos missionários que destroem as culturas. Pierson menciona um pouco da verdade sobre missionários falsamente caluniados para o Havaí.

4. Uma comparação marcante, Nem todos os lugares que foram tocados pelo cristianismo foram transformados da mesma maneira. Existem, claro, muitos fatores que contribuem para os diferentes impactos que o evangelho tem tido em diferentes lugares. Um dos fatores principais é a visão e labor dos missionários em incluir líderes locais em favor de uma transformação intencional na vida da comunidade.

[cite] Leia a seção “Uma Comparação Marcante”, p. 273-274, para imaginar as diferenças dramáticas em tão somente um caso. Havia influência mínima da Igreja Católica em ambos os lados do rio. Quais fatores formaram parte dos diferentes resultados em cada lado do rio? O que isso sugere sobre a necessidade de desenvolvimento comunitário integrado?

5. As diferentes rotas até o fruto. Missionários têm trabalhado na educação, saúde, agricultura e ministérios pelos oprimidos, particularmente mulheres e escravos. Pierson não nos dá uma amostra das contribuições das missões cristãs. Ele apenas nos proporciona alguns exemplos bem específicos de um movimento enorme. O impacto do movimento cristão tem sido tão profundo que é quase impossível considerar todo o impacto. Mas podemos dizer com toda a certeza que nunca existiu uma maior fonte de desenvolvimento da situação humana do que o movimento cristão em termos de educação, saúde e status das mulheres e dos escravos.

[cite] Leia Pierson, (cap. 36, p. 269-276): Uma história de transformação.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO

LEITURAS EXTRAS

11. ESTRATÉGIAS DA MISSÃO

Voltamos para a pesquisa de Beaver sobre estratégia missionária. Mas primeiro devemos considerar o valor de examinar as estratégias antigas aplicadas no decorrer dos séculos. Por que não simplesmente começarmos a trabalhar e resolver os problemas urgentes da atualidade? A história da estratégia está transbordando com aplicações práticas relevantes para qualquer um que queira participar da causa missionária. Alguns dos servos de Deus do passado alcançaram coisas extraordinárias através de incríveis demonstrações de amor, sabedoria e sacrifício, enquanto outros fracassaram, mesmo com intenções admiráveis.

Se a sua parte em missões é primeiramente sustentar os outros que são missionários na linha de frente, familiarizar-se com estes problemas lhe dará uma visão mais abrangente, melhorando as suas decisões e encorajamentos. Se você mesmo for eventualmente trabalhar num campo transcultural missionário, até mesmo por um curto período de tempo, o conhecimento de avanços estratégicos e também de erros pode ajudar a fazer uma contribuição de grande valor.

A. Missões Protestantes Iniciais

1. Puritanos da Nova Inglaterra. A experiência missionária norte-americana de alcançar os “índios” começou com o que parecia uma tentativa de “civilizá-los” em cidades específicas antes de “cristianizá-los”. Evangelismo que retirava os convertidos do contexto mais amplo das sociedades tribais terminou formando um povo separado que não podia “atravessar a barreira e contagiar a fé”. As “Cidades de Oração Índias” podem ter sido estabelecidas para proteger os cristãos Índios tanto dos índios como dos colonizadores. Entretanto, as “Cidades de Oração Índias” eram frequentemente queimadas por colonos rebeldes que vinham da Europa. Figuras notáveis desse período são John Eliot e David Brainerd.

2. A Missão Dinamarquesa de Halle. Uma jovem e famosa missão protestante de envio da Europa se atreveu a aplicar algumas das mais inovadoras estratégias de abordagem para contextualizar a mensagem do evangelho e tomar papéis efetivos de comunicação do evangelho. Dois líderes se destacam: Bartholomew Ziegenhalg e Frederick Schwartz.

3. Morávios. Beaver descreve os esforços dos morávios por respeitar a cultura local. Eles esperavam que os movimentos resultantes seriam diferentes do próprio movimento deles. Eles ensinaram os novos convertidos ferramentas que os ajudaram a estabelecer-se economicamente.

[cite] Leia Beaver (cap. 35, p. 259b-268): A história da estratégia missionária, da seção dos “Puritanos” até o final.

B. O Grande Século das Missões Protestantes

O século XIX é visto como o “Grande Século” por causa do avanço fenomenal do evangelho em cada área geográfica do globo. Vamos continuar lendo o resumo de Pierce Beaver sobre a estratégia missionária, o qual nos dá detalhes surpreendentes a respeito deste período. Para ajudá-lo a acompanhar a história dos primeiros 18 séculos de estratégia missionária, havíamos destacado quatro temas da Seção IX: adaptação, “civilização”, conquista e desenvolvimento. Agora, para o panorama de Beaver sobre o século 19, vamos focar nestes três pontos:

- Contextualização. Por terem uma visão de superioridade sobre as outras culturas, a ideia de “civilizar” as diferentes partes da sociedade era suposta e adotada.

- Controle. Modelos de conquista foram deixados de lado, especialmente porque a era colonial havia subjugado grandes áreas de religiões não evangelizadas. Assim, a conquista foi substituída pela problemática forma sutil de controle.

- Transformação. Os esforços de desenvolvimento se multiplicaram. Beaver usa a palavra “transformação”.

1. Estruturas de Missão. Estruturas de missão operacionais eram uma inovação para os Protestantes. Havia muita confusão por parte das estruturas de envio das igrejas a respeito do controle das operações missionárias, e isso diminuiu a efetividade no início do século. O problema do controle por parte dos países enviadores europeus era tão grande que as estruturas de envio eram dominadas pelas igrejas. Os esforços de William Carey foram atrapalhados por essa confusão.

2. Objetivos da Missão. O objetivo geral eram conversões individuais, plantação de igrejas e transformação social.

a 4

- Cristianização ou civilização? As culturas locais eram vistas como primitivas e supersticiosas. O engajamento meio de uma mudança da cultura deles era visto como um esforço inicial para preparar o caminho para a “Cristianização”. Essa foi uma estratégia que, pouco a pouco, foi deixada de lado pela ideia de que o evangelho em si mesmo já transformaria a cultura. William Carey e o “Trio de Serampore” proporcionaram uma forma valiosa ao difundirem a ideia de igrejas independentes e enfatizarem o poder transformativo do evangelho na sociedade.

- Estações ou Igrejas? O engajamento missionário havia pressionado os convertidos para que se tornassem dependentes dos missionários, tanto social como economicamente. Carey buscava uma liderança instruída e independente e com muitos leigos reunidos nas igrejas. Os líderes missionários Rufus Anderson e Henry Venn exerceram grande influência para quebrar as estruturas de estação missionária e suas pressuposições. Venn e Anderson propuseram a famosa “tríplice fórmula da autonomia” para descrever as igrejas independentes que eles queriam que seus missionários deveriam buscar e criar, mas talvez eles não tiveram influência em sua própria época. No final do século XIX emergiu novamente o colonialismo paternal. Isso os levou a uma apressada “evolução” de autoridade passada das estruturas de missão para as igrejas locais no começo do século XX.

- Transformação e educação. William Carey foi além do que muitos dos seus colegas em gerações posteriores ao ter uma visão de uma liderança altamente capacitada. Visões diferentes na transformação estavam relacionadas a vias teológicas sobre o Reino de Deus e a virada do século. Os missionários trabalhavam arduamente para implementar sistemas de saúde e de educação.

3. Comitê e Continuidade. Esta prática do “comitê” exemplifica a longa herança da união nos esforços missionários. Tal reconhecimento das diversas partes da Igreja abriu o caminho para as conferências missionárias nacionais e internacionais, as quais continuam até hoje.

4. Transição para uma nova era de Missões. Beaver menciona as ideias de Roland Allen como uma estratégia radicalmente diferente. Compare o resumo desta estratégia com o alvo de Carey, Venn e Anderson. Allen articulou um novo nível de simplicidade nos intentos estratégicos, o qual não tinha qualquer estrutura colonial. Preste atenção em como Beaver descreve as igrejas, as quais resultaram da teoria de Allen sobre “espontaneidade missionária”. E então, o parágrafo seguinte menciona como que muitas organizações missionárias foram dissolvidas. Qual dinâmica estava sendo trabalhada? O avanço progressivo de missões ou a dissolução de estruturas missionárias? Essa confusão é um exemplo evidente de duas mentalidades da Missão Protestante em dois momentos de transição significativos. Examinaremos essas transições de forma detalhada na Lição 6.

A avaliação de Beaver dessa estratégia nova e radical pode até ser uma simplificação da igreja e das estruturas da missão, e uma esperança para uma transformação tremenda que não seja dependente da estrutura Ocidental de cultura e poder. Finalmente, a frase final de Beaver sobre a “tarefa central da Igreja” se refere ao chamado missional da Igreja em geral. Na Lição 7, vamos identificar a tarefa missionária essencial que pode ser completada, o que abre o caminho para todo tipo de florescer da bênção do reino de Deus.$conteudo$
     where curso_id = v_curso and ordem = 26;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 5 · Guia de estudo — A expansão do movimento cristão mundial$t$,
            $conteudo$- A expansão do + Movimento cristão mundial

R ESTA LIÇÃO O AJUDARÁ A:

ar de forma resumida como a de Deus continuou a alcançar s povos em 4.000 anos de ever o progresso do Evangelho tes regiões geográficas e áreas em quatro épocas a partir o, e depois da Reforma até a | de William Carey, chamado Missões Modernas (por volta 800 d.C).

car o avanço do Evangelho quando o povo de Deus sobediente, por meio de smos” diferentes, como: “vindo” ou mensageiros “indo”, ia ou involuntariamente.

ir a ideia de que as bênçãos de vem ser passadas adiante, ou ser retiradas.

entar os aspectos culturais do de Jerusalém (descrito em Atos Reforma Protestante.

aver algumas das características formação social que resultou da sionária,

NO NÍVEL AVANÇADO:

crever as duas estruturas is da Igreja ao longo dos séculos o os termos “modalidade” e ade”.

Até agora, vimos como o enredo da Bíblia inteira se desdobra em direção ao cumprimento do propósito global de Deus. Mas o que, de fato, acontece depois de Atos 28? A maioria de nós tem uma noção vaga a respeito dos crentes primitivos, suportando as perseguições ainda do Império Romano. Depois disso, no entendimento popular, a era das trevas medievais apagou o movimento cristão com conceitos como a apostasia da Igreja Católica Romana, as cruzadas e o aparente caos até a Reforma. Se avaliarmos somente esses acontecimentos, as divinas promessas de abençoar as nações teriam sido mais uma esperança falsa do que verdadeira.

Depois do primeiro século, será que Deus se frustrou com seus seguidores e abandonou a sua intenção de fazer com que o Evangelho fosse proclamado até os confins da terra? Será que Deus acordou apenas agora para as claras possibilidades de missões no mundo moderno?

A pergunta central é: Há alguma continuidade na história? Muitos historiadores dizem que não, explicando qualquer sucessão de eventos aparentemente significativa como uma ilusão. Aqueles que creem em Cristo, porém, precisam somente lembrar que o próprio Jesus anunciou o Reino de Deus quando declarou: “O tempo é chegado!” (Marcos 1.15). Essa declaração deveria ser um alerta suficiente para a realidade de um propósito magnífico em toda a história. O Reino de Deus veio e ainda virá com maior poder.

Por que olharmos para a história? Não é uma simples questão de datas e nomes notáveis, mas de perceber a mão de Deus cumprindo Seu propósito. Aqueles que estudam a história da perspectiva de Deus não se decepcionam. São eles que podem, dentro do “enredo” que se desdobra, distinguir entre aquilo que realmente importa e o que é periférico.

Nesta lição, estudaremos como a bênção de Deus estendeu-se sucessivamente de um povo em uma determinada região a outro. Veremos as consequências drásticas para o movimento cristão nos momentos em que a bênção não foi compartilhada. Perceberemos também como, ao longo da história humana, o Espirito Santo não deixou de estar presente e de operar, muitas vezes, através de pessoas inseridas em tradições eclesiásticas as quais mal conhecemos, ou mesmo até discordamos.

Palavra - chave:

CONTINUIDADE Precisamos conciliar que o Deus de todas as nações é o mesmo Deus de todas as gerações. Ele deve ser seguido plenamente por aqueles que o conhecem como o Deus de toda a história, pois não deixou de cumprir Seu propósito entre a era apostótica e a Reforma Protestante.

DDD

1. O TEMA CENTRAL DA HISTÓRIA: O “CONTRA-ATAQUE” DO REINO DE DEUS

Ao longo de toda a história, verificamos a “invasão” de Deus no domínio de Satanás, desfazendo todas as suas obras e libertando as pessoas para glorificar o Seu nome. É uma batalha de custo elevado! Muitas vezes, na história redentora de Deus, seus servos sofrem assim como Cristo sofreu nessa luta,

Seguindo o modelo proposto pelo Dr. Ralph Winter, dividiremos a história desde a era apostólica até os dias de hoje em cinco períodos de 400 anos. Esse esquema nos ajudará a lembrar e acompanhar a história que se desenvolve. Embora padrões fascinantes e temas recorrentes apareçam, Winter obviamente não quer dizer que a história siga um padrão rígido de ciclos. A divisão em períodos serve somente para facilitar a nossa compreensão.

Os cinco períodos são: 1. 0-400 d.€.: Alcançando os Romanos 2. 400-800: Alcançando os Bárbaros 3. 800-1200: Alcançando os Vikings 4. 1200-1600: Alcançando os Muçulmanos (ou Sarracenos) 3. 1600-Hoje: Alcançando Todos os Povos até os Confins da Terra

Durante esses cinco períodos, veremos também quatro “mecanismos” que Deus utilizou para avançar o Seu Reino.

A. Quatro Mecanismos para a Missão

A maior parte da história não foi caracterizada pela fiel obediência do povo de Deus em missões transculturais, porém, mesmo assim, Deus cuida para que a bênção continue a se espalhar. Para vermos essa continuidade maravilhosa através da história, precisamos reconhecer quatro mecanismos que demonstram como Deus avança Sua Missão com ou sem a cooperação do Seu povo escolhido (veja o gráfico completo na p. 243).

Ida Voluntária (com intenção missionária) Exemplos: Os profetas pregando às nações ao redor de Israel - O próprio Senhor Jesus sendo enviado pelo Pai — Paulo e Barnabé em suas viagens missionárias.

Ida Involuntária (inicialmente sem intenção missionária) Exemplos: José sendo vendido como escravo para o Egito — Os hebreus sendo levados para o cativeiro na Babilônia — Os que saíram da Palestina por causa da perseguição.

Vinda Voluntária Exemplos: Naamã da Síria que foi a Eliseu — A Rainha de Sabá foi à corte de Salomão — Os judeus de “todas as nações” presentes em Jerusalém no dia de Pentecoste.

Vinda Involuntária Exemplos: O repovoamento de Samaria (2 Reis 17) - Os Romanos ocupando Judeia e Galileia dos gentios.

B. Redenção através da Bênção

Quando pensamos na bênção de Deus que foi estendida, precisamos distinguir a ideia comum no Ocidente de bênçãos (plural) — benefícios materiais ou sociais — da ideia hebraica de bênção (singular) — uma realidade relacional que confere tanto responsabilidade e obrigação quanto privilégio. Bênção é uma palavra que precisa ser entendida em termos de “família”. Ao estender a Sua bênção, Deus estabelece uma família enorme: uma coleção de famílias resultantes da fé que juntas demonstram Seu Reino e Sua glória. O povo de Deus deve “ser” essa bênção de Deus, bem como passá-la adiante para os outros.

€. O Avanço Cultural e Geográfico

Cada vez que o Evangelho “invade” uma nova área geográfica ou cultural, encontramos uma combinação de grupos de povos, línguas, culturas e sistemas políticos. Ao ler o artigo de Blincoe, atente tanto para a expansão geográfica quanto cultural. Em cada período, reconheceremos também um período de “florescimento” cultural e econômico, resultante da transformação social, graças à entrada do Cristianismo e à presença da comunidade cristã.

teia Blincoe (cap. 33, p. 227-228): Como as águas cobrem o mar, da introdução até a seção: De O a 400: de Jerusalém às fronteiras do império Romano.

2. O PRIMEIRO PERÍODO: ALCANÇANDO OS ROMANOS (DE 0 A 400 D.C.)

A. Mecanismo

O Evangelho avançou através de todos os quatro mecanismos. O método da “ida voluntária”, encontramos no grupo apostólico de Paulo, e o da “ida involuntária”, na dispersão dos cristãos durante as perseguições.

B. Avanço

O Evangelho se espalhou por todo o Império e por todas as'camadas sociais. O avanço geográfico foi facilitado graças às línguas em comum (especialmente o grego, como também o latim), a presença das sinagogas (com gentios tementes a Deus), a paz prevalecente (a Pax Romana) e uma extensa rede de estradas. Durante os primeiros séculos, o Cristianismo foi a única religião sem identidade nacionalista ou política e, por isso, era atraente para muitos em todo o Império. Uma vez que se tornou a religião oficial do Império, carregou consigo um estigma cultural de ser “romana”. Isso causou uma desaceleração considerável em seu avanço nas áreas além do Império Romano, especialmente nas regiões em oposição (como, por exemplo, a Pérsia).

€. Florescimento

No final desse período (o século IV), houve grande prosperidade cultural e econômica entre os povos “cristãos”, O que teria acontecido se os romanos tivessem usado apenas parte da sua riqueza e poder para alcançar os povos além de suas fronteiras? É bem possível que seu destino teria sido outro e que o Evangelho teria avançado mais rapidamente.

Aolero artigo de Blincoe, atente para suas referências à transformação da sociedade pela presença da comunidade cristã (por exemplo, o bloco “Os benefícios de crer”, na página 230) e ao longo da história, a necessidade de “desjudaizar”, “desromanizar” e “desocidentalizar” o Evangelho (leia Atos 15 à luz das observações de Blincoe).

[cite] Leia Blincoe (cap. 33, p. 228-232): Como as águas cobrem o mar, (de O a 400; de Jerusalém às fronteiras do Império Romano).

3. O SEGUNDO PERÍODO: ALCANÇANDO OS BÁRBAROS (400-800 D.C.)

A. Mecanismo

As tribos germânicas (bárbaras) invadiram o Império Romano e acabaram sendo evangelizadas (além do contato com o Cristianismo ariano). Esse é um exemplo da “vinda voluntária”. Mais tarde, houve o estabelecimento das ordens monásticas. A maior parte da tradição monástica ficou conhecida pelo pastoreio das pessoas ao redor do mosteiro, mas alguns mosteiros se tornaram muito missionários, seguindo o padrão da “ida voluntária”. Os mais conhecidos eram os celtas ou “peregrini” irlandeses (evangelistas itinerantes) e seus seguidores anglo-saxões, entre eles, Patrício, Columba, Columbano e Bonifácio.

B. Avanço

Tribos bárbaras, como os godos, os visigodos, os vândalos e os anglo-saxões, invadiram a maior parte da Europa Central e Ocidental. Embora Roma tivesse perdido a metade do seu Império (parte ocidental), o mundo bárbaro ganhou a fé cristã no processo.

€. Florescimento

Carlos Magno, mesmo sendo descendente de uma tribo germânica, facilitou o crescimento da educação e do desenvolvimento econômico que temporariamente tiraram a Europa do caos. Sob a forte influência dos centros monásticos, Carlos Magno promoveu os centros missionários de vida monástica que tinham se espalhado e mantido a fé por toda a Europa. Ainda influenciado por Magno, a “Renascença Carolíngia” dividiu a “Era das Trevas” Medieval em dois períodos distintos. Contudo, por mais que Carlos Magno tenha promovido a fé, todo o seu esforço de evangelizar os Vikings do norte foi pequeno e insuficiente, além de se apresentar tardiamente.

pita à Dc SD

[cite] Leia Blincoe (cap. 33, p. 232-236): Como as águas cobrem o mar (De 400 a 800 — Alcançando os Bárbaros).

4. O TERCEIRO PERÍODO: ALCANÇANDO OS VIKINGS (800-1200 D.C.)

A. Mecanismo

Os saqueadores vikings foram alcançados para Cristo por seus prisioneiros. Outra vez temos o padrão da “vinda voluntária”.

B. Avanço

O Evangelho chegou até a Escandinávia e a outras regiões do norte da Europa.

C€. Florescimento

A Reforma Gregoriana foi reforçada pelos movimentos espirituais da Ordem de Cluny, dos Cistercienses e outros da mesma natureza em busca do Cristianismo autêntico e em reação à crescente corrupção no movimento monástico. No entanto, esse movimento logo perdeu sua expressão missionária, que é descrito no próximo período.

[cite] Leia Blincoe (cap. 33, p. 236-237): Como as águas cobrem o mar (De 800 a 1200: Alcançando os vikings).

5. O QUARTO PERÍODO: “ALCANÇANDO” OS MUÇULMANOS (OU SARRACENOS)? (1200-1600 D.C.) Este período é diferente dos demais em muitos aspectos. Daí as aspas e o ponto de interrogação.

A. Mecanismo

Uma vez que os Vikings se renderam ao “contra-ataque do Evangelho”, eles se tornaram os líderes da maior “perversão” de missões na história: as Cruzadas. Usando um padrão muito falho da “ida voluntária”, eles destruíram e conquistaram territórios sem nenhum sucesso em estender a bênção do Evangelho aos muçulmanos (às vezes chamados de sarracenos).

Ao mesmo tempo, um novo tipo de monasticismo surgia, verdadeiramente missionário. Isso resultou no movimento dos frades que viajaram por toda a Europa propagando o Evangelho. Porém, quando eles começaram a ir para terras além de suas fronteiras, a peste bubônica atacou. Justamente os frades, que cuidavam dos enfermos, foram os mais atingidos. Talvez fosse a maneira que Deus utilizou para tirar os mensageiros do meio daqueles que não queriam ouvir.

B. Avanço

Em termos de avanço do Evangelho, as Cruzadas fracassaram. No final desse período, o início da expansão colonial trouxe avanço da fé cristã, mas não na sua forma protestante. É nesse período que o Cristianismo chega ao Brasil.

€. Florescimento

A Renascença e a Reforma foram tempos de florescimento. A Reforma descentralizou dramaticamente o Cristianismo. A versão católica ou latina do Cristianismo, com suas estruturas monásticas de missões, desenvolveu-se junto com a expansão colonial. Os recém-formados movimentos protestantes se ocuparam mais com reformulações teológicas e ficaram praticamente sem estruturas missionárias para alcançar outras pessoas além de seu próprio povo.

[cite] Leia Blincoe (cap. 33, p. 237-239): Como as águas cobrem o mar (De 1200 a 1600: Alcançando os sarracenos).

42 4

6. O QUINTO PERÍODO: ALCANÇANDO TODOS OS POVOS ATÉ OS CONFINS DA TERRA (DE 1600 ATÉ HOJE)

A. Mecanismo

A expansão católica continuou, mas, por volta do ano 1800, sofreu um declínio repentino devido aos efeitos da

Revolução Francesa (e Napoleão saqueando a Europa) e da popularidade crescente do ateísmo (filósofo Voltaire e outros), deísmo e humanismo. No mesmo período histórico, o mecanismo da “ida voluntária” da missão protestante finalmente começou a funcionar.

B. Avanço

Isso não implica uma ausência do esforço missionário entre o período da Reforma até William Carey (1761- 1834), mas foi relativamente pouco. Mesmo assim, as missões feitas pelos Morávios foram notáveis. Houve movimentos de avivamento que também eram missionários — Pietistas, Puritanos e João Wesley — e que inspiraram William Carey. O grande missionário Carey foi muito mais do que só um evangelista. Ele também exerceu uma forte influência de transformação no subcontinente da Índia. Ele era industrialista, economista, médico, pioneiro na área midiática, tradutor, educador, botânico e reformador moral. Por toda sua postura social humanitária, e ainda mais por ter verificado e proposto a necessidade de organizações dedicadas ao avanço missionário (sociedades missionárias), fez por merecer o título de “Pai das Missões Modernas”.

€. Florescimento

A civilização ocidental, com toda sua prosperidade (e corrupção), pode ser o maior florescimento de todos. De certa forma, muitos países — inclusive o Brasil — desfrutam das vantagens dessa era globalizada. O Brasil é um país emergente, com crescente prosperidade. Porém, a pergunta ainda continua: se insistirmos em manter a bênção somente para nós mesmos, ao invés de compartilhá-la, será que Deus agirá para que as nações atualmente prósperas percam parte dos benefícios materiais que acompanham a bênção, para que o propósito de Deus seja cumprido em todas as nações (assim como fez no passado)?

[cite] Leia Blincoe (cap. 33, p. 239-244): Como as águas cobrem o mar (De 1600 a 2000: A era do silêncio e a era do grande avanço missionário).

7. AVANÇO PARA O LESTE

No primeiro milênio, o evangelho se espalhou mais para o leste do que para o oeste. No leste, entretanto, o evangelho encontrou grandes religiões interculturais e estatais, como Zoroastrismo, Budismo, Hinduísmo e Taoismo. Em contraste, à medida que o evangelho avançava dentro do Império Romano, na Europa e na África, religiões menores, locais e “étnicas” eram encontradas, as quais ofereciam menos resistência. Nas terras do Oriente, o Cristianismo se espalhou de forma abrangente, mas, em quase todos os casos, os cristãos permaneceram como uma minoria até as últimas gerações. Scott Sunquist lista cinco grandes avanços, dos quais o primeiro e o último foram os mais efetivos.

1. Avanço Persa (primeiro milênio)

2. Interlúdio Franciscano-Mongol (1206-1368) 3. Avanço jesuíta (1542-1773)

4. Avanço Protestante (1706-1950)

5. Indígenas Asiáticos (1950-presente)

[cite] Leia Sunquist (cap. 46, p. 352-356): Cristianismo na Ásia.

8. ESTRATÉGIA MISSIONÁRIA

R. Pierce Beaver agrega mais cor e profundidade para algumas das figuras históricas que temos mencionado. Ele explora as diferentes abordagens na estratégia de missões nos tempos antes de William Carey. À medida que você for lendo sobre cada uma das diferentes figuras e períodos, considere as diferentes abordagens que as missões usaram para o avanço do evangelho. Ao explorar o trabalho missionário dos séculos anteriores, é importante identificar as ações que resultaram em atrasos ou as que causaram mais danos do que bênção. Ao mesmo tempo, é importante reconhecer o valor estratégico duradouro de muitos esforços. Temos muito que aprender da sabedoria madura de muitas experiências e avanços.

A lista abaixo destaca alguns dos importantes problemas de comunicação transculturais que exploraremos mais para frente no curso. Permita que os relatos abram o seu apetite para ler além do que o curso Perspectivas pode oferecer, Atenção para estas quatro áreas gerais de estratégia missionária:

Adaptação. Considere as formas com que a cultura local foi respeitada e valorizada ou a transmissão do evangelho foi adaptada ao contexto.

Civitizar. Veja a contextualização dos movimentos resultantes. Até que ponto as igrejas locais eram permitidas de refletir sua cultura local? Ou será que eles se moldaram pela cultura do missionário?

Conquista. Em alguns casos, os missionários seguiram poderes imperialistas e colonizadores. Eles tinham o interesse de colocar os povos debaixo do domínio de seus países de origem? Eles eram vistos como pessoas que ajudavam o controle dos poderes estrangeiros?

Desenvolvimento. Os missionários frequentemente traziam novas formas de solucionar necessidades básicas. Por vezes, esses esforços eram considerados como um serviço de civilização ou parte de uma conquista econômica.

A. Bonifácio

Beaver caracteriza esta importante figura do movimento monástico como uma exibição de uma verdadeira “missão de envio”. Ele foi às tribos ao invés de expandir dominio político. Para encorajar as conversões grupais das tribos, ele usava algo que nós hoje chamamos de “confronto de poder”. Um exemplo claro de Bonifácio aplicando essa estratégia é este: Ele cortou as árvores sagradas dos outros deuses mostrando a impotência deles, confrontando-os com o poder de Cristo. Ele estabeleceu igrejas, mosteiros e escolas. Entretanto, no fim das contas, ele foi visto por aqueles que ele alcançou como um instrumento de expansão imperial,

B. As Cruzadas

De forma trágica, as Cruzadas misturaram missões com conquista. O efeito das Cruzadas tem repercussões no mundo muçulmano até hoje. As Cruzadas destacam duas outras figuras monásticas notáveis, Francisco de Assis e Raimundo Lúlio, que procuraram pregar o evangelho aos muçulmanos ao invés de participar da conquista violenta.

C. Expansão Colonial

Aexpansão imperial portuguesa, holandesa, espanhol, francesa e britânica estavam frequentemente relacionadas com as missões de diferentes formas. Métodos normalmente dependiam de se eles primeiro “cristianizavam” ou “civilizavam”,

D. Estratégias do século 17

Sunquist já mencionou alguns dos aspectos inovadores da estratégia missionária Jesuíta ao levar o evangelho para o leste. Os experimentos e as experiências dos Jesuítas normalmente determinam o clima missiológico que os missionários encontram hoje em dia. Os Jesuítas não apenas encontraram forte resistência no Japão, apesar dos métodos inovadores, mas eles também afetaram a resistência japonesa moderna ao evangelho. Algumas das abordagens criativas de Roberto de Nobili e Matteo Ricci ainda são consideradas como modelos missionários na atualidade.

[cite] Leia Beaver (cap. 35, p. 256-259a): A história da estratégia missionária, até a seção dos “Puritanos”.

CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

9. AS DUAS ESTRUTURAS DA MISSÃO REDENTORA DE DEUS

Ralph Winter afirma que a Igreja cresceu e se estendeu em missões seguindo formas encontradas dentro da estrutura social da época, tanto quanto formas encontradas na Bíblia. Por toda a história, embora os detalhes mudem, quando falamos da Igreja, vemos duas estruturas fundamentais: a estrutura congregacional e a missionária. Winter introduz os termos sociológicos “modalidade” e “sodalidade” para identificar as estruturas em momentos diferentes da história (observe que versões mais antigas do artigo utilizam os termos “modalício” e “sodalício”).

Ambas as estruturas existem em sociedades civis e religiosas. Também as encontramos na Bíblia, por isso, são legítimas e necessárias na Missão redentora de Deus. As modalidades trabalham para reforçar e ampliar a igreja. As sodalidades fortalecem e apoiam os grupos missionários. Ambas cooperam para uma simbiose essencial.

A. Estruturas Redentivas (antes e depois do Século |)

A estrutura congregacional seguiu o padrão da sinagoga da época. As estruturas missionárias encontraram seu precedente nos esforços missionários dos rabinos judaicos, mas logo se tornaram grupos muito dinâmicos, como o do apóstolo Paulo.

B. Primeiro Desenvolvimento (dentro da Cultura Romana)

Estruturas congregacionais passaram a reconhecer bispos com jurisdição territorial, conforme o padrão dos territórios magisteriais romanos. O termo romano para definir tais territórios era “diocese”. As estruturas missionárias que surgiram, como o movimento monástico, adotaram padrões da prática militar romana. Os protestantes, geralmente, tendem a estereotipar os mosteiros como lugares onde os monges procuram fugir do mundo real, Porém, a bem da verdade, os movimentos monásticos foram responsáveis, em grande parte, por levarem a bênção do Evangelho de Cristo ao mundo.

€. A Síntese Medieval

A sobrevivência das estruturas congregacionais (ou paroquiais) veio a depender, em grande parte, da maior devoção do movimento monástico. Vários dos maiores esforços missionários da história cristã surgiram a partir do movimento monástico. Quando, porém, os mosteiros se tornaram prósperos, os governadores locais tomaram posse da liderança, o que resultou em enfraquecimento espiritual e decadência.

D. A Recuperação Protestante

Já nos perguntamos o porquê de os protestantes celebrarem as maravilhas do Evangelho, mas falharem em estendê-lo ao mundo. Tanto Winter quanto Latourette, e outros estudiosos, apontam para o que pode ser o maior erro do movimento protestante: os reformadores abandonaram a estrutura da sodalidade. A vida monástica foi rejeitada, então praticamente não houve interesse em preservar as estruturas missionárias. William Carey chamou os cristãos a usarem “meios” para completar a comissão de Cristo. Esses “meios” conduzem diretamente às organizações missionárias. Ele propôs a formação de sociedades missionárias. Uma vez iniciadas, houve um aumento explosivo no número de missionários protestantes,

E. O Mal-entendido Moderno

Missões protestantes foram inicialmente organizadas sem o apoio denominacional. Gradualmente, as estruturas, até então independentes, se tornaram altamente reguladas e dominadas pelos líderes denominacionais. Isso trouxe tanto saúde quanto problemas para a expansão missionária. Como resultado, foi lançada uma segunda onda de estruturas missionárias, cnamadas de “missões de fé”, o que era na verdade uma segunda onda de iniciativa não denominacional (o que chamaremos de “A Segunda Era” na Lição 6). Alguns líderes fortes e altamente respeitados reconheceram o valor e a importância de algumas destas estruturas missionárias, sem ligações denominacionais. Mas, em geral, houve pouco apoio às estruturas missionárias, levantando críticas e dúvidas abertas quanto à legitimidade das sodalidades. Como esperado, isso resultou em um fracasso no campo missionário, em termos de iniciativa e encorajamento para as novas igrejas formarem suas próprias estruturas missionárias e enviarem seus próprios missionários. O fenômeno atual do extenso envio de missionários do “Sul Global” (povos não ocidentais) cresceu com pouco apoio missionário da igreja nacional.

[cite] Leia Winter (cap. 34, p. 245-255): As duas estruturas da missão redentora de Deus.

Qual a diferença entre o grupo missionário de Paulo e a igreja de Antioquia? Examine os dois aspectos do “envio” do grupo apostólico em Atos 13. No versículo 4, a palavra para “enviaram” (NVI) ou “despediram” (ARA) tem mais a ver com “liberar” e “deixar partir”. O versículo seguinte começa com “enviados, pois pelo Espírito Santo”, trazendo a palavra grega para “enviar”, com um significado forte, refletindo uma ordem militar. O grupo foi comandado pela igreja ou recomendado aos cuidados e controle de Deus? Perceba como a ideia de recomendação aparece em Atos 14.21-28 como um ato de entrega aos cuidados e autoridade de outra pessoa. Qual foi a importância da oração e do jejum em reconhecer os novos líderes, para uma obra específica debaixo do cuidado de Deus em Atos 13 e 14?

Releia a última frase do artigo de Winter. O que é crucial na insistência de Winter, em que ambas as estruturas não são somente legítimas, mas necessárias?

10. O FRUTO DO MOVIMENTO: TRANSFORMAÇÃO

A ideia central de toda esta lição é a continuidade da história. Deus tem orquestrado incessantemente os seus propósitos através das gerações e dos séculos. E nem todos os tempos são iguais. Existem períodos de declínio e inatividade aparente. Mas o propósito da missão de Deus nunca dependeu completamente das atividades humanas. Nós identificamos a natureza da história das missões como uma batalha prolongada, praticamente uma guerra espiritual. Nós temos visto como Deus usou diferentes mecanismos e movimentos. Nós apresentamos o propósito de Deus como o cumprimento da Sua promessa de abençoar as nações. As nações foram abençoadas? Deus está trabalhando e alcançando o Seu propósito? Qual tem sido o resultado? Segundo uma visão popular, o cristianismo tem sido a fonte de obstáculos e danos ao bom desenvolvimento das sociedades ao redor de todo o mundo. Mas isso não é verdade. Por mais que tenham existido coisas decepcionantes e destrutivas feitas em nome de Cristo, quando olhamos o movimento como um todo, o impacto positivo da pessoa de Jesus Cristo nas sociedades do mundo é incalculável.

A. A missão cristã traz bênção ou dano?

A atual controvérsia sobre as missões cristãs normalmente alega que a missão cristã sempre tem sido a serva fiel do colonialismo e é uma força destrutiva sobre as culturas indígenas. Robert Woodbury desafia essas ideias, normalmente baseadas em anedotas e ficção, com dados sociológicos verificáveis. Se o resultado concreto da presença de missionários é o dano a sociedades, esperariamos condições piores em contextos onde os missionários passaram mais tempo ou estiveram em maior número. Mas Woodberry diz que as estatísticas mostram exatamente o oposto. Nas situações onde os missionários têm estado presentes e tiveram liberdade para trabalhar, sociedades melhoraram em áreas de desenvolvimento humano, como alfabetização, matrículas educacionais, mortalidade infantil, expectativa de vida, desenvolvimento econômico, libertação da corrupção e democracia política.

[cite] Leia na plataforma WoodBerry: O impacto social de missões cristãs.

B. O ideal e o alvo do reino

Segundo o historiador famoso Kenneth Scott Latourette, o ideal e o objetivo do reino de Deus tem moldado abrangentemente a história posterior a Jesus. Latourette documentou o avanço e o desenvolvimento do movimento do Cristianismo Mundial em vários estouros de crescente magnitude e frequência. Segundo a vi do Latourette, o movimento cristão entrou na sua maior expansão durante o último século. O movi explodiu justamente como ele pensava que aconteceria. Latourette não somente contou a história atual cristianismo, ele também resumiu o fruto do movimento.

Fonte: Kenneth Scott Latourette. “A History of Christianity” (Peabody MA: Prince Press, 1997), p. 1470-1471. Traduzido como “Uma história do cristianismo”, feito pela editora Hagnos.

€. A História da Transformação

O fruto de mudar a sociedade em direção à paz e justiça do reino de Deus não era uma questão de esperança passiva. O movimento missionário tem sido quase sempre uma força constante de mudança positiva. Paul Pierson nos conta a história.

1. Monasticismo. Veja novamente a tremenda herança do movimento monástico. Este movimento, apropriadamente entendido, tem sido sal e luz nas mãos de Deus através dos séculos.

2. Precursores. A Igreja tem tido um impacto tremendo nas nações quando os valores centrais do evangelho floresceram e deram frutos com o tempo. Os movimentos dos puritanos, pietistas, morávios e wesleyanos trouxeram um foco maior na esperança bíblica por uma transformação pessoal e comunitária. Não é surpresa que a visão pela evangelização andou de mãos dadas com uma profunda transformação social.

3. O contraste chocante entre a realidade e o relatório falso. William Carrey é reconhecido como o pai das missões modernas. O que normalmente não se sabe é o alcance fenomenal de seus esforços e das incríveis mudanças que ainda estão acontecendo por causa de seu trabalho. Como contraste, temos o estereótipo dos missionários que destroem as culturas. Pierson menciona um pouco da verdade sobre missionários falsamente caluniados para o Havaí.

4. Uma comparação marcante, Nem todos os lugares que foram tocados pelo cristianismo foram transformados da mesma maneira. Existem, claro, muitos fatores que contribuem para os diferentes impactos que o evangelho tem tido em diferentes lugares. Um dos fatores principais é a visão e labor dos missionários em incluir líderes locais em favor de uma transformação intencional na vida da comunidade.

[cite] Leia a seção “Uma Comparação Marcante”, p. 273-274, para imaginar as diferenças dramáticas em tão somente um caso. Havia influência mínima da Igreja Católica em ambos os lados do rio. Quais fatores formaram parte dos diferentes resultados em cada lado do rio? O que isso sugere sobre a necessidade de desenvolvimento comunitário integrado?

5. As diferentes rotas até o fruto. Missionários têm trabalhado na educação, saúde, agricultura e ministérios pelos oprimidos, particularmente mulheres e escravos. Pierson não nos dá uma amostra das contribuições das missões cristãs. Ele apenas nos proporciona alguns exemplos bem específicos de um movimento enorme. O impacto do movimento cristão tem sido tão profundo que é quase impossível considerar todo o impacto. Mas podemos dizer com toda a certeza que nunca existiu uma maior fonte de desenvolvimento da situação humana do que o movimento cristão em termos de educação, saúde e status das mulheres e dos escravos.

[cite] Leia Pierson, (cap. 36, p. 269-276): Uma história de transformação.

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO

LEITURAS EXTRAS

11. ESTRATÉGIAS DA MISSÃO

Voltamos para a pesquisa de Beaver sobre estratégia missionária. Mas primeiro devemos considerar o valor de examinar as estratégias antigas aplicadas no decorrer dos séculos. Por que não simplesmente começarmos a trabalhar e resolver os problemas urgentes da atualidade? A história da estratégia está transbordando com aplicações práticas relevantes para qualquer um que queira participar da causa missionária. Alguns dos servos de Deus do passado alcançaram coisas extraordinárias através de incríveis demonstrações de amor, sabedoria e sacrifício, enquanto outros fracassaram, mesmo com intenções admiráveis.

Se a sua parte em missões é primeiramente sustentar os outros que são missionários na linha de frente, familiarizar-se com estes problemas lhe dará uma visão mais abrangente, melhorando as suas decisões e encorajamentos. Se você mesmo for eventualmente trabalhar num campo transcultural missionário, até mesmo por um curto período de tempo, o conhecimento de avanços estratégicos e também de erros pode ajudar a fazer uma contribuição de grande valor.

A. Missões Protestantes Iniciais

1. Puritanos da Nova Inglaterra. A experiência missionária norte-americana de alcançar os “índios” começou com o que parecia uma tentativa de “civilizá-los” em cidades específicas antes de “cristianizá-los”. Evangelismo que retirava os convertidos do contexto mais amplo das sociedades tribais terminou formando um povo separado que não podia “atravessar a barreira e contagiar a fé”. As “Cidades de Oração Índias” podem ter sido estabelecidas para proteger os cristãos Índios tanto dos índios como dos colonizadores. Entretanto, as “Cidades de Oração Índias” eram frequentemente queimadas por colonos rebeldes que vinham da Europa. Figuras notáveis desse período são John Eliot e David Brainerd.

2. A Missão Dinamarquesa de Halle. Uma jovem e famosa missão protestante de envio da Europa se atreveu a aplicar algumas das mais inovadoras estratégias de abordagem para contextualizar a mensagem do evangelho e tomar papéis efetivos de comunicação do evangelho. Dois líderes se destacam: Bartholomew Ziegenhalg e Frederick Schwartz.

3. Morávios. Beaver descreve os esforços dos morávios por respeitar a cultura local. Eles esperavam que os movimentos resultantes seriam diferentes do próprio movimento deles. Eles ensinaram os novos convertidos ferramentas que os ajudaram a estabelecer-se economicamente.

[cite] Leia Beaver (cap. 35, p. 259b-268): A história da estratégia missionária, da seção dos “Puritanos” até o final.

B. O Grande Século das Missões Protestantes

O século XIX é visto como o “Grande Século” por causa do avanço fenomenal do evangelho em cada área geográfica do globo. Vamos continuar lendo o resumo de Pierce Beaver sobre a estratégia missionária, o qual nos dá detalhes surpreendentes a respeito deste período. Para ajudá-lo a acompanhar a história dos primeiros 18 séculos de estratégia missionária, havíamos destacado quatro temas da Seção IX: adaptação, “civilização”, conquista e desenvolvimento. Agora, para o panorama de Beaver sobre o século 19, vamos focar nestes três pontos:

- Contextualização. Por terem uma visão de superioridade sobre as outras culturas, a ideia de “civilizar” as diferentes partes da sociedade era suposta e adotada.

- Controle. Modelos de conquista foram deixados de lado, especialmente porque a era colonial havia subjugado grandes áreas de religiões não evangelizadas. Assim, a conquista foi substituída pela problemática forma sutil de controle.

- Transformação. Os esforços de desenvolvimento se multiplicaram. Beaver usa a palavra “transformação”.

1. Estruturas de Missão. Estruturas de missão operacionais eram uma inovação para os Protestantes. Havia muita confusão por parte das estruturas de envio das igrejas a respeito do controle das operações missionárias, e isso diminuiu a efetividade no início do século. O problema do controle por parte dos países enviadores europeus era tão grande que as estruturas de envio eram dominadas pelas igrejas. Os esforços de William Carey foram atrapalhados por essa confusão.

2. Objetivos da Missão. O objetivo geral eram conversões individuais, plantação de igrejas e transformação social.

a 4

- Cristianização ou civilização? As culturas locais eram vistas como primitivas e supersticiosas. O engajamento meio de uma mudança da cultura deles era visto como um esforço inicial para preparar o caminho para a “Cristianização”. Essa foi uma estratégia que, pouco a pouco, foi deixada de lado pela ideia de que o evangelho em si mesmo já transformaria a cultura. William Carey e o “Trio de Serampore” proporcionaram uma forma valiosa ao difundirem a ideia de igrejas independentes e enfatizarem o poder transformativo do evangelho na sociedade.

- Estações ou Igrejas? O engajamento missionário havia pressionado os convertidos para que se tornassem dependentes dos missionários, tanto social como economicamente. Carey buscava uma liderança instruída e independente e com muitos leigos reunidos nas igrejas. Os líderes missionários Rufus Anderson e Henry Venn exerceram grande influência para quebrar as estruturas de estação missionária e suas pressuposições. Venn e Anderson propuseram a famosa “tríplice fórmula da autonomia” para descrever as igrejas independentes que eles queriam que seus missionários deveriam buscar e criar, mas talvez eles não tiveram influência em sua própria época. No final do século XIX emergiu novamente o colonialismo paternal. Isso os levou a uma apressada “evolução” de autoridade passada das estruturas de missão para as igrejas locais no começo do século XX.

- Transformação e educação. William Carey foi além do que muitos dos seus colegas em gerações posteriores ao ter uma visão de uma liderança altamente capacitada. Visões diferentes na transformação estavam relacionadas a vias teológicas sobre o Reino de Deus e a virada do século. Os missionários trabalhavam arduamente para implementar sistemas de saúde e de educação.

3. Comitê e Continuidade. Esta prática do “comitê” exemplifica a longa herança da união nos esforços missionários. Tal reconhecimento das diversas partes da Igreja abriu o caminho para as conferências missionárias nacionais e internacionais, as quais continuam até hoje.

4. Transição para uma nova era de Missões. Beaver menciona as ideias de Roland Allen como uma estratégia radicalmente diferente. Compare o resumo desta estratégia com o alvo de Carey, Venn e Anderson. Allen articulou um novo nível de simplicidade nos intentos estratégicos, o qual não tinha qualquer estrutura colonial. Preste atenção em como Beaver descreve as igrejas, as quais resultaram da teoria de Allen sobre “espontaneidade missionária”. E então, o parágrafo seguinte menciona como que muitas organizações missionárias foram dissolvidas. Qual dinâmica estava sendo trabalhada? O avanço progressivo de missões ou a dissolução de estruturas missionárias? Essa confusão é um exemplo evidente de duas mentalidades da Missão Protestante em dois momentos de transição significativos. Examinaremos essas transições de forma detalhada na Lição 6.

A avaliação de Beaver dessa estratégia nova e radical pode até ser uma simplificação da igreja e das estruturas da missão, e uma esperança para uma transformação tremenda que não seja dependente da estrutura Ocidental de cultura e poder. Finalmente, a frase final de Beaver sobre a “tarefa central da Igreja” se refere ao chamado missional da Igreja em geral. Na Lição 7, vamos identificar a tarefa missionária essencial que pode ser completada, o que abre o caminho para todo tipo de florescer da bênção do reino de Deus.$conteudo$, 26);
  end if;
end
$curso$;
