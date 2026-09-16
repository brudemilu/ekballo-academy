-- 293_perspectivas_licao2_completa.sql
-- As quatro leituras que faltavam na Lição 2: Piper (cap. 5), Lewis (quadro
-- dentro do cap. 7), Verkuyl (cap. 8, p. 73-76) e Blackaby/Willis (cap. 6).
-- Com isso a Lição 2 fecha em 7 de 7 leituras pedidas pelo guia.
--
-- PROCEDÊNCIA: PDF ESCANEADO (267-281 DPI), sem camada de texto — transcrição
-- por OCR, como os guias das Lições 4 a 12 e a leitura do Verkuyl da Lição 1.
-- NÃO tem prova por contagem de caracteres: não existe texto-fonte com que
-- comparar. As caixas de biografia, que o OCR devolvia ilegíveis, foram
-- transcritas à mão a partir da imagem.
--
-- Remontagem por coordenadas: as colunas são separadas pela calha ANTES de
-- agrupar as palavras em linhas, e a régua vertical entre colunas (que o
-- tesseract lia como "|" no meio das palavras) é descartada na origem.
-- O recorte de sangria foi DESCARTADO: a medição de linhas truncadas mostrou
-- que cortar piorava em 10 das 12 páginas — este scan não tem sangria que atrapalhe.
--
-- Duas figuras entram junto: o ciclo "Deus em missões" (diagrama de Henry T.
-- Blackaby) e o diagrama das duas forças, do quadro do Lewis.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';

  -- abre espaço: tudo da Lição 3 em diante desce 4 posições
  update aulas set ordem = ordem + 1000 where curso_id = cid and ordem >= 13;
  update aulas set ordem = ordem - 1000 + 4 where curso_id = cid and ordem >= 1000;

  -- Adeney e Dearborn passam a vir depois das três leituras novas
  update aulas set ordem = 14 where curso_id = cid and titulo like 'Lição 2 · Leitura — Adeney%';
  update aulas set ordem = 15 where curso_id = cid and titulo like 'Lição 2 · Leitura — Dearborn%';
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 2 · Leitura — Piper, cap. 5: Alegrem-se os povos', 'os povos John Piper

Alegrem-se

À

oniieots remimChud

Minnesota (Estados Unidos), onde E enercê seu ministério desde 1980, o Entre seus muitos livros estão: The

Plegsures of God [Os prazeres de Deus)

Em busca de Deus (Sho Paulo Shedd Publicações, 2008) Deus to vvongelho

eme joe otro et Solado vos DodeNo

Paio: Cultura Cristã, 2001) Sto

Usado com permissão,

5 As missões não representam o alvo principal da Igreja, a adora-Ação sim, As missões existem porque não existe adoração, esta sim fundamental, pois Deus é essencial, é não o homem, Quando esta era se encerrar e 05 incontáveis milhões de redimidos estiverem perante o trono de Deus, não haverá mais missões, Elas representam, no momento, uma necessidade temporária, mas à adoração permanece para sempre,

A adoração é, portanto, o combustível e a meta das missões, É a meta das missões porque nelas simplesmente procuramos levar as nações ao júbilo inflamado da glória de Deus, O objetivo das missões é a alegria dos povos na grandiosidade de Deus, “Reina o Senhor, Regozije-se a terra, alegrem-se as muitas ilhas” (51 97,1), “Louvem-te os povos, ó Deus; louvem-te os povos todos, Alegrem-se e exultem as gentes (51 67,3,4).

No entanto, a adoração é também o combustível das missões, A paixão por Deus na adoração precede a apresentação de Deus por meio da pregação, Você não pode recomendar o que não aprecia, Os missionários jamais exclamarão: “Alegrem-se 05 povos”, se não puderem dizer de coração, “Eu me alegrarei no Senhor Alegrar-me-et é exultaret em ti; ao teu nome, ó Altíssimo, eu cantarei louvores” (81 104.34; 9.2), As missões começam terminam com adoração,

Se a busca da glória de Deus não for colocada acima da busca do bem do ser humano nas afeições do coração e nas prioridades dagreja, o homem não será bem servido, e Deus não será devidamente missionário, honrado, e sim Não a exaltação estou pleiteando de Deus, unia Quando redução à chama no trabalho da adoração arder com o calor da verdadeira excelência de Deus, a Juz das missões brilhará para os povos mais remotos da terra, Anseio a chegada desse dia!

Onde a paixão por Deus for fraca, o zelo pelas missões será fraco, As igrejas que não primam pela exaltação da majestade é beleza de Deus raramente ve inflamam por um desejo fervente de anunciar “entre às nações à sua glória” (81 96.3), À segunda maior atividade no mundo O aspecto mais dificil das missões é colocar Deus como à centro grandeza de Deus, como poderão ser enviados com a mensagem vibrante de Salmos 96,4: Grande é o Senhor é mui digno de sor

seneciaaracaeecnarmenmasavem cem sema BURITI SÁ LOU

Apud lain Murray, The Puritan Hope (Edinburgh: Banner of Truth Trust, 1971), 140.

2 Tentei expor essa verdade maravilhosa do regozijo do Pai em si mesmo, isto é, seu Filho, em The Pleasures of Got Meditation on God''s Delight on Being God (Portland: Multnomah Press, 1991).

Perguntas para estudo 1, O que significa adoração ser a “meta das missões”? E o “combustível” das missões? 2. De que maneira muda a tarefa missionária quando adoração é vista como meta final?

Qu louvado, temível mais que todos os deuses"? As missões não são o começo e o fim, mas Deus é. Não são meras palavras, Essa verdade é a energia vital da inspiração e da perseverança do missionário. William Carey, o pai das missões modernas, que velejou da Inglaterra à Índia, em 1793, expressa sua experiência:

Quando deixei a Inglaterra, minha esperança de

converter a Índia era muito forte, porém diante

de tantos obstáculos ela minguaria, não fosse

o sustento recebido de Deus. Bem, Deus está

comigo, e sua Palavra é verdadeira. Embora as

superstições dos pagãos fossem mil vezes mais

fortes e o exemplo dos europeus mil vezes pior,

mesmo diante do abandono e da perseguição

minha fé, posta na segurança da Palavra, ainda

superaria todos os obstáculos e suportaria cada

provação. À causa de Deus triunfará.”

Carey e milhares iguais a ele são impelidos pela visão de um Deus grande e triunfante. Essa visão precisa vir em primeiro lugar, devendo o missionário experimentá-la na adoração antes de difundi-la nas missões. Isso se resume a avançar em direção a um grande alvo: a adoração inflamada a Deus e ao seu Filho por todos os povos da terra. As missões não são esse objetivo. São os meios e, por essa razão, constituem a segunda maior atividade no mundo. a A paixão de Deus por si mesmo é o fundamento da nossa Uma das coisas que Deus usa para fazer essa verdade se apoderar de uma pessoa e de uma MESSI

igreja é a surpreendente constatação de que 6 mesmo ocorre com ele. As missões não são a meta suprema de Deus, e sim a adoração, Quando isso penetra o coração de alguém, tudo muda, O mundo está sempre mudando seu curso, e tudo parece diferente, até mesmo o empreendimento missionário.

O princípio fundamental para nossa paíxão por ver Deus glorificado é a paixão que ele próprio tem de ser glorificado. Deus é único e supremo em suas afeições. Não há rivais para q supremacia da glória de Deus no coração dele, Deus não é um idólatra. Ele não desobedece ao primeiro e grande mandamento. Com todo o seu coração, alma, força e mente, ele se deleita na glória de suas múltiplas perfeições? coração mais apaixonado por Deus em todo q Universo é o dele.

Essa verdade, mais que qualquer outra que conheço, ratifica a convicção de que a adoração é o combustível e a meta das missões. À razão mais importante para que nossa paixão por Deus venha a suprir as missões é que a paixão de Deus por si mesmo garante o suprimento para as missões. As missões são o transbordamento de nosso regozijo em Deus porque são o transbordamento do regozijo de Deus em ser ele mesmo. À razão mais importante para a adoração ser o alvo das missões é que ela é o objetivo de Deus. Certificamo-nos desse objetivo pelo registro bíblico da busca incansável de Deus pelo louvor das nações: “Louvai ao Senhor, vós todos os gentios, louvai-o, todos os povos” (81 117.1). Se essa é a meta de Deus, deve ser também a nossa.

ES O', 11 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 2 · Leitura — Lewis: As duas forças', 'As duas forças

Jonathan Lewis

No cumprimento da obrigação de Israel, duas forças estavam em evidência. A primeira era a força atrativo, primeiramente simbolizada pelo tabernáculo e depois pelo templo em Jerusalém. Essas instalações eram os locais da habitação do nome de Deus. Eram lugares sagrados, centro das cerimônias e práticas religiosas de Israel, mas que, no entanto, não foram construídos para servir apenas a Israel, Quando Salomão consagrou O templo, estava claro para ele que o templo tinha um propósito mais abrangente.

A Biblia registra diversos casos de estrangeiros que foram atraídos para Israel por causa da evidência da bênção de Deus, entre eles, Rute, a moabita, e o siro Naamã. Centenas de outras histórias narradas são evidenciadas pelo fato de que, no dia de Pentecostes, havia homens piedosos de “todas as nações debaixo do céu” (At 2.5) habitando em Jerusalém. O plano de Deus para alcançar as nações, todavia, consiste em muto mais que uma atração passiva.

A segunda força em operação era ativa, a força expansiva. Ela fazia com que a mensagem de Deus fosst enviada para além das fronteiras de Israel. Podemos citar exemplos de israelitas cativos usados para pro clamar à mensagem de Deus à outras nações, como José, e exilados, como Daniel e Ester. Podemos const derar também o profeta Jonas, que recebeu a ordem de pregar o arrependimento em Nínive, e Jeremias.

designado “profeta às nações”. Especula-se até que ele e outros mensageiros viajaram por muitos lugares na propagação de seus oráculos. Contudo, Deus não usou apenas os grandes na função de conceber su?

mensagem: afinal, foi uma pequena escrava israelita que anunciou o divino poder de cura ao poderoso, porém leproso, Naamã, capitão do exército siro.

Alguns podem argumentar que esses casos são exceções, pois algumas dessas pessoas eram cativas ou ministraram contra a vontade. Entretanto, o voluntarismo nunca foi o fator decisivo para se promover a missão de Deus. Afinal, ele usa seu povo para anunciar sua mensagem, sejam eles agentes dispostos ou não.

A história trágica de Israel teria sido consideravelmente diferente se a nação tivesse sido um instrumento disposto a realizar o plano redentor de Deus, mas não foi isso que aconteceu. Deus usou o cativeiro e o exílio tanto para julgar a desobediência de Israel quanto para estender seu testemunho além das fronteiras.

Essas duas forças dinâmicas também estão presentes em nossos dias. Na escala global, muitos são atraídos para as “nações cristãs” por causa da evidência da bênção de Deus por meio de riqueza material e estabilidade econômica. Nas comunidades, as congregações em que o poder e a graça de Deus são evidentes também atraem pessoas. Já no nível pessoal, o caráter piedoso exerce atração sobre 05 que desejam possuir as mesmas virtudes. Mesmo assim, o evangelho não será pregado a todas as nações simplesmente pela atração passiva. Há muitas barreiras sociais, culturais e geográficas a serem transpostas para que isso aconteça. O povo de Deus deve se dispor e ir às na» ções com as boas novas para cumprir,

[figura] /figuras/perspectivas/duas-forcas.png | Força atrativa: "Vem pela bênção" · Força expansiva: "Vai às nações"

Jonathan Lewis (Ph.D.) é consultor organizacional da World Evangelical Alliance. Nascido na Argentina, trabalhou na criação de centros de treinamento missionário na América Latina e em outros países. É o editor de três cursos de missões, publicados em diversos idiomas.

Da segunda edição de Jonathan Lewis (Org.), World Mission [Missão mundial] (Pasadena: William Carey Library, 1994). Usado com a permissão.', 12 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 2 · Leitura — Verkuyl, cap. 8: A base bíblica do mandato missionário mundial (p. 73-76)', 'ET

am propósitos de Deus (v, Is 2 e 65; Mg 4).O Antigo Testamento anseia pela manifestação definitiva desse Reino e afirma categoricamente a promessa de que no fim Yahweh será de fato vencedor, Esse é também um tema bastante significativo para a participação missionária, É impossível participar da missão, a menos que se combatam todas as formas de oposição aos propósitos de Deus, onde quer que se encontrem nas igrejas, no mundo das nações ou na própria vida.

O Antigo Testamento liga intimamente o tema do antagonismo às questões doxológicas. A glória de Yahweh-Adonai será manifesta entre todos os povos. Cada ser humano, então, virá a conhecê-lo como ele realmente é:“Deus clemente, e misericordioso, e tardio em irar-se, e grande em benignidade, e que [se arrepende) do mal” (Jn 4.1,2). O livro de Jonas O livro de Jonas é fundamental para se entendera base bíblica da missão porque trata do mandato de Deus ao seu povo com relação aos povos gentílicos e, dessa forma, serve como pas"so preparatório para o mandato missionário do Novo Testamento, Jonas também é importante para dar uma ideia da profunda resistência que esse mandato encontra no próprio servo que Yahweh escolheu para realizar essa tarefa de alcance mundial.

Hoje muito se fala e se escreve a respei"to de orientar o povo para a missão. Jonas é uma lição de treinamento para quem pretende ser missionário. O livro revela a necessidade de uma conversão radical das tendências natufais e da reestruturação completa da vida pes:-Soal, de modo que o cristão se torne útil para A missão, Contexto do livro O título do livro é o nome pessoal de um profeta sem disposição, Jonas, e retoma o assunto da época do rei Jeroboão TI (787-746 a.C,), “quando viveu um profeta chamado Jonas ben Amitai. É óbvio, todavia, que esse midrash foi Ê

escrito por razões outras e não para detalhar os acontecimentos da vida do profeta. O autor usa esse nome pessoal para apresentar aos seus leitores um missionário que não apreciava os gentios e que, à semelhança dos fariseus de épocas posteriores, não podia tolerar um Deus que demonstrasse misericórdia para com os gentios. Nas palavras do autor holandês Miskotte, “o escritor deseja apresentar uma personagem que seja exatamente o oposto de um apóstolo”, O autor de Jonas adverte seus Jeitores contra aquela atitude intolerante e pergunta se desejam ser transformados em servos que atuam de modo a cumprir as ordens de Deus,

O escritor de Jonas entende que Israel ficou tão preocupado consigo mesmo que se esqueceu do mundo das nações, Israel, o receptáculo de toda a revelação de Deus, recusava-se a dar um passo em território estrangeiro e proclamar aos outros povos a mensagem divina de juízo e libertação. Entretanto, a mensagem do livro também é destinada à congregação do Novo Testamento, a qual tenta de diversas maneiras escapar ao mandamento de apresentar a mensagem de Deus ao mundo.

Os hábeis esforços de fuga de Jonas representam a Igreja preguiçosa e infiel, que não dá atenção ao mandamento de seu Senhor. Deus tem de lutar contra o etnocentrismo bitolado de Israel, que restringe sua atividade às fronteiras da nação, e contra a recusa eclesiocêntrica da Igreja em sair pelo mundo a proclamar a mensagem de Deus e realizar sua obra. O escritor está decidido a convencer seus leitores de que o alcance da atividade libertadora de Deus é grande o bastante para atingir tanto Israel quanto os gentios.

É um milagre que Jonas, com sua dura advertência contra o etnocentrismo, tenha conseguido entrar para o cânon das Escrituras. Sem rodeios, ele mostra a tentativa humana de sabotar os planos divinos para o mundo de modo que seus leitores (Israel, a Igreja do Novo Testamento e nós) possam ouvir o que o Espírito Santo está tentando lhes dizer por meio desse pequeno livro.

É as.

[a Resumo das oito cenas do livro A primera cena se inicia com Jonas recebendo a ordem de dr a Nínive, Enquanto o Antigo Testamento geralmente conclama as outras nações à virem a Sião, o monte de Deus, Jonas,à semelhança dos discípulos do Novo Testamento (v Mt 28,18-20), recebe a ordem de ir, Na tradução da Sepimuaginta, o livro de Jonas usa a palavra porettomai em 1,2,3 e de novo em a mesma usada por Jesus na Grande Comissão, registrada em Mateus 28, Para onde Jonas deverá ir? Dentre todos os lugares, justamente para Nínive o centro do totalitarismo, da brutali= dade e das atitudes belicosas, Nínive, conhecida pela perseguição vergonhosa, tortura selvagem e orgulho imperialista com que tratava os que se opunham à sua política, Deus quer que servo advirta Nínive acerca de um juízo iminente e que a conclame ao arrependimento, Deus quer salvar Nínive!

No entanto, Jonas recusa-se a obedecer. É verdade que ele se prepara para viajar, mas apenas para fugir da face de Deus, que é Senhor sobre todos.

Na segunda cena, Deus reage à fuga de Jonas enviando uma fortíssima tempestade (1,4-16). O vento obedece às ordens de Yahweh, mas o desobediente Jonas dorme no porão do navio, esquecido do fato de que é o alvo da tempestade. Às vezes, a Igreja também dorme enquanto a “4 tempestade do juízo de Deus atinge o mundo, imaginando que o vento Já fora não lhe diz respeito, Enquanto a tripulação tenta, sem êxito, descobrir a causa da tempestade, Jonas confessa que adora e teme ao Deus que fez o mar e a terra seca, ao único Deus que está acima de todas as nações, Ele confessa que esse Deus tem uma acusação contra ele e que a única maneira de acalmar as ondas é Jançá-lo ao mar. Nessa cena, a tripulação representa os gentios, um povoa quem Jonas não dá a menor importância, mas que, ainda assim, está interessado em poupar a vida do profeta, Depois de Jonas lhes dar a ordem pela segunda vez, eles o lançam ao mar, e a tempestade cessa. Quase sem conseguir crer no que estão vendo, os marinheiros se derra-

Jo mam em louvor ao Deus de Jonas, À obeditcia deles ultrapassa à do sabotador Jonas. Estãs mais acessíveis a Deus que o próprio profeta.

A terceira cena (1,17) mostra um grande per xe que, sob as ordens de Yahweh, abre a boca para engolir Jonas e vomitá-lo na praia, no devido tempo, Jonas simplesmente não consegue evadir-se ao mandato missionário de Deus, O Deus que levantou os ventos terríveis e conduziu os marinheiros na realização do propósito missionário agora dirige um peixe como parte de seu plano para salvar Nínive. Yahweh continua sua obra de reformar e preparar seu missionário para que este seja um instrumento adequado aos planos divinos,

Na quarta cena (2.1-10), Jonas implora a Deus que o tire do ventre do peixe. Ele, que não tivera o mínimo de misericórdia para com os gentios e se recusara a admitir que as promessas de Deus também diziam respeito a eles, agora suplica pela misericórdia divina e, citando frases de vários salmos, almeja as promessas cobradas pelos adoradores no templo de Deus, Yahweh responde, Fala ao enorme animal, e Jonas vai parar numa praia, são e salvo. Pelo próprio resgate Jonas se tornou, sem qualquer intenção, uma testemunha da misericórdia salvadora de Deus, Embora coberto de algas, ainda assim era um testemunho de que Deus não tem prazer na morte de pecadores e sabotadores, mas se regozija com a conversão deles.

Na quinta cena (3.1-4), Deus repete a ordem dada ao homem cuja vida é um testemunho vivo do que confessara no ventre do peixe:“Ao Senhor pertence a salvação!” A Septuaginta emprega a palavra kerygma em 3.1ss, Essa palavra sozinha resume a missão de Jonas: ele deve proclamar que Nínive, por mais ímpia que seja, aínda é objeto da preocupação de Deus e, a menos que se arrependa, será destruída. Sua mensagem tem de ser uma tanto de ameaça quanto de promessa, tanto de juízo quanto de boas novas,

Na sexta cena (3.5-10), Nínive atende ao apelo de Jonas para se arrepender. O rei tirano e orgulhoso desce do trono, troca o manto red

em seu conceito pessoal de Deus: um deus da não entendeu as lições da tempestade, dos ma-

por pó e cunzá e ordena à todos vs cidadãos e animais que sigam seu exemplo. O que Israel sempre se recusara a fazer os pagãos gentios fizeram! O cruel rei de Nínive é um antitipo dos reis desobedientes de Judá.

O povo une-se ao rei no ato de arrependimento. Cessa a obra demoníaca, e os mecamismo aterrorizantes e coercivos da injustiça politica são reprimidos. Em profunda penitência, abandonam os ídolos para servir ao Deus que é Senhor de cada nação e de toda a criação. Tudo isso é possível porque Yahweh é Deus. O mundo pagão é um campo missionário potencialmente produtivo por uma única razão: só o Senhor é Deus.

Às cortinas se fecham nessa cena com estas palavras surpreendentes: “Viu Deus o que fi= zeram, como se converteram do seu mau caminho; e Deus se arrependeu do mal que tinha dito lhes faria e não o fez”. Yahweh é fiel às suas promessas, Ainda hoje sua vontade para com Moscou, Pequim, Londres e Amsterdã não é menos “graciosa cheia de misericórdia” do que foi para com Nínive. Tomando emprestada a frase de Lutero, o qual muito apreciava pregar sobre o livro de Jonas, a mão esquerda da ira de Deus foi substituída pela mão direita da bênção e da hberdade.

A sétima cena (4,1-4) relembra o fato de que o maior obstáculo a ser transposto no cumprimento do mandato missionário não foram os marinheiros, nem o peixe, nem o reic os cidadãos de Nínive, mas o próprio Jonas a Igreja recalcitrante e de visão estreita. O capítulo 4 fala de Jonas, o qual, havia algum tempo, deixara a cidade para procurar abrigo a leste de suas fronteiras. O período de 40 dias para arrependimento já passou, mas como Deus mudou de ideia à respeito de destrui-la, a cidade continua a ser alimentada pela graça e pelamisericórdia de Yahweh. Jonas está furioso pelo taro de Deus haver estendido sua misericórdia para além dos limites de Israel, alcançando os gentios. Ele queria que Deus se enquadrasse natureza frio, duro e cruel, com uma atitude

inflexível contra os pagãos, Ele não suporta a ideia da participação dos gentios na história da salvação.

Esse é à pecado de Jonas, o pecado de um missionário cujo coração não está na (missão. Ele, que uma vez implorara à Deus misericórdia ao ver-se abandonado no ventre do peixe, agora está irado porque Deus demonstrou misericórdia para com as nações. Ele dá vazão à sua fúria na forma de oração, que se encontraem 4.2 eéo texto-chave do livro: “Ah! Senhor! Não foi isso o que eu disse, estando ainda na minha terra? Por isso, me adiantei, fugindo para Társis, pois sabia que és Deus clemente, e misericordioso, e tardio em irar-se, e grande em benignidade, e que te arrependes do mal”. Parte dessa oração tem sua origem numa antiga liturgia de Israel, que cada israelita conhecia de cor e poderia até repetir durante o culto no templo ou na sinagoga mesmo que estivesse cochilando (v. Ex 34.6;

103.8; 145.8; Ne 9.17). Jonas, porém, não consegue imaginar que essa liturgia seja verdadeira não apenas para Jerusalém, onde estava localizado o templo de Deus, mas também para outros lugares Nínive, São Paulo, Nairóbi, Nova York e Paris.

Por que Jonas está tão irado? Pela única razão de Deus tratar pessoas que estão fora do círculo de sua aliança da mesma maneira em que trata os de dentro. Na verdade, a ira de Jonas o está afastando da aliança, pois ele obstinadamente se recusa a reconhecer o propósito do pacto, que é levar a salvação aos pagãos. Não aprendeu ainda que Israel não pode ter a presunção de desfrutar favores especiais de Deus. Tanto Israel quanto os gentios vivem pela graça que o Criador concede a todas as suas criaturas. Assim, Deus se aproxima de seu profeta não mais como participante da aliança, mas na qualidade de Criador, e pergunta à sua criatura: “É razoável essa tua ira?”

Na citava e vltima cena (4.5-11) pode-se notar que Deus ainda se esforça em ensinar as lições ao seu missionário cabeça-dura, Ele rinheiros, do peixe e da conversão de Nínive

O READ porque não quis, e agora Yawwch faz outra tentatuva à árvore muraculosa. Uma trepadeira cresce rapidamente, oferece a Jonas proteção contra o sol forte, mas também logo seca e sooere, vitima do ataque de um verme. Jonas fica irritadissimo.

A essa altura, Deus tenta mais uma vez ensunar seu aluno-missionário, usando a planta como lição objetiva. O próprio Deus, que dirige todo o curso da História, que governa o vento

as ondas do mar e que levou os milhões de minivitas ao arrependimento, agora pergunta com termura:

É razoável essa tua ira por causa da planta?

Ele respondeu: É razoável a minha ira até

à morte. Tornou o Senhor: Tens compaixão

da planta que te não custou trabalho, a qual

não fizeste crescer, que numa noite nasceu e

numa noste pereceu; e não hei de eu ter com-

paixão da grande cidade de Nínive, em que

há smais de cento e vinte mil pessoas, que não

sabem discernir entre a mão direita e a mão

esquerda, e também muitos animais?

Deus poupa e resgata. O Deus de Jerusalém também é o Deus de Nínive. Ao contrário de Jonas, Ele não tem qualquer “complexo de gentios” e, embora nunca nos constranja, pede-nos que ponhamos nosso coração e nossa alma no trabalho da missão. Deus ainda tem interesse em transformar os Jonas obstinados, indigna"dos, deprimidos e profundamente irritáveis em atautos das boas novas que libertam. ã O livro termina com uma pergunta implíú cita, que jamais foi respondida: Deus alcançou seu objetivo com Nínive, mas o que dizer de. Jonas? Ninguém sabe. À pergunta acerca de Israel e da igreja e de sua obediência ainda está k em aberto.

É o tipo de pergunta que cada geração de cristãos tem de responder por si mesma. Jacques Ellul encerra o livro que escreveu sobre É o assunto com as seguintes palavras:

“The Judgment of Jonab (Grand Rapids: Eerdmans, 1971),

Ao DD,

O livro de Jonas não tem conclusão alguma,

ea pergunta última do livro não tem respos-

ta, exceto por parte daquele que percebe a

grandeza da misericórdia de Deus e que, de

modo factual, e não apenas mútico, trabalha

pela salvação do mundo.”

A igreja do Novo Testamento deve dedicar cuidadosa atenção à mensagem do livro de Jonas. Jesus Cristo é aquele que “é maior do que Jonas” (Mt 12.39-41; Lc 11.29-32). Sus morte na cruz, com aquele horrível grito de ter sido abandonado por Deus, e sua ressurreição, com a jubilosa exclamação de vitória, são sinais de Jonas para nós, apontando para o profundo significado da vida de Cristo e confirmando que Deus amou o mundo “de tal maneira”,

Se alguém recebe uma transfusão vital de sangue daquele que é maior que Jonas e assim mesmo se recusa a espalhar as boas novas, ele está, na verdade, sabotando os objetivos do próprio Deus. Jonas é o pai de todos os cristãos que desejam os benefícios e as bênçãos da eleição, mas se recusam a aceitar sua responsabilidade.

Thomas Carlisle termina seu poema “Tu, Jonas” com os seguintes versos:

E Jonas se aproximou em silêncio

de seu banco ensombreado

e esperou de Deus

passar a ter seu jeito de pensar.

E Deus ainda espera dos incontáveis Jonas

em suas casas confortáveis

passarem a ter seu jeito de amar. O período interbíblico Uma pesquisa acerca do período da Diáspora judaica revelou evidências de um esforço judaico de fazer prosélitos, o que, de sua parte, marcou definitiva e caracteristicamente o trabalho missionário posterior realizado por gentios bem como por judeus cristãos. A Septuaginta (tradução grega do Antigo Testamento) espalhou-se por todo o mundo civilizado e era explicada p. 103.', 13 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 2 · Leitura — Blackaby e Willis, cap. 6: Em missão com Deus', 'Em missão Deus 6

Henry T. Blackaby e

euzuus NEN TI IRADY Pserorad é pendente emérito tos Bachady presu eterno coneyhore à diversas apar Fo mes brvas de vida comunitária UA depertonento eepitiual msi tepoêcriça É reto autor de vários mami livros, ento elos Emperibacioé com Deus (São Fauc Bompóstor 1994) é Spiritual ieodership Inderança espiritual. Pr no

SUEERE ara hq 16. é diretor ein fi iiionidnadã ido di Overseas Operetuons na intersgtona! Wssigr Bogré cf the Southern Suprist Convention (Estedos Unidos! no

gas ds ot, Diagrama de try É Riechasy é pude V King entrado o de Experiencing Goê (Nestyihe. isfesvas Press, 1990). Todos os diretos reservagos Veado com permissão.

com Avery T. Willis dr.

[figura] /figuras/perspectivas/ciclo-em-missao-com-deus.png | Deus em missões: ao longo da História, para que o nome de Deus seja glorificado, o reino de Deus seja estabelecido e o mundo seja reconciliado com Deus

está agindo. Ele interferiu na História para realizar seu propósito na terra. Cada vez que vemos Deus na Bíblia, ele está agindo de acordo com seu propósito: revelar-se para que seu nome possa ser glorificado e seu Reino estabelecido e pará reconciliar consigo representantes de tados os povos. Deus se revela para reconciliar consigo o mundo Deus decidiu revelar -se à «é mesmo, seu propósito seus caminhos, envolvendo seu povo, à fim de convidar todas os povos do mundo

é Por meio de Abraão, Deus revelou-se como o Senhor, o Todo-Poderoso e o Provedor que quer abençoar todos povos do mundo por meio de seu povo. Por meio de Moisés, Deus revelou-se como Eu Sou o Que Sou, cujo plano esa mostrar a sua glória A ao mundo por meio A do povo que deveria ser um reino de sacerdotes para as demais nações da terra: Isrácl. Porsmeio de Davi, Deus revelou que sua Semente governaria todas as nações e que seu Reino seria para todos os povos. Por meio de Jesus, Deus revelou seu amor é seu propósito de reconciliar consigo o mundo por meio da encarnação, da crucificação, da ressurreição e da ascensão de Cristo. é Por meio de Paulo, Deus revelou que o mistério das eras é à inclusão de todos os povos na redenção divina. Por meio de João, Deus revelou que representantes de todas as nações, tribos, linguas e povos o adorarão para sempre. Deus está trabalhando o tempo todo, até mesmo no fim dos tempos, trazendo essa revelação para à reconciliação de todos os povos, Quando essa missão for cumprida, não será apenas a mais completa expressão de louvor da terra, mas também 2 mais plena revelação do amor de Deus. teto, Deus em O rmome de Deus sejo glorificado

cepa A oiee

To «O mundo seja reconciludo com Deus

4. Deus fala 6. Ajuste

co e [Sa a la SESS RES ÉS SIS ER AG O Ce

1, Deus em missões Ea

Eq e

N

O

5 Crise de crenças Deus começa sua obra por meio de seu povo Deus deu início a todas as etapas de sua obra ao longo da História, Em vez de realizá-la sozinho, preferiu conclui-la de modo muito pessoal. Ele envolveu seu povo, operando por meio dele para cumprir os propósitos divinos. Na hora de dar um passo adiante em sua missão, ele se aproximava de um ou mais de seus servos e lhes mostrava o que queria fazer. Ele os convidavaa se juntarem a ele, pedindo-lhes que ajustassem sua vida ao plano divino para que ele pudesse realizar todos os aspectos de sua missão por meio deles. O profeta Amós conclui: “Certamente, o Senhor Deus não fará coisa alguma, sem primeiro revelar o seu segredo aos seus servos, os profetas” (Am 3.7).

Quando Deus estava pronto para julgar o mundo, ele veio a Noé. Deus pretendia glorificar seu nome preservando a justiça na terrae 4 o faria por meio de Noé. Quando Deus estava "pronto para separar um povo para sí,ele veio a Abraão. Deus realizaria sua vontade por meio E de Abraão. Quando Deus ouviu o clamor dos filhos de Israel e decidiu libertá-los, apareceu a Moisés. Deus veio a Moisés por causa de seu propósito. Ele planejava livrar Israel por meio de Moisés e revelar-lhes seu propósito. o trabalhar com Moisés e Israel, Deus se revelou ao mundo inteiro. É A experiência de Moisés é uma boa ilustração de como Deus lida com o seu povo. O "diagrama mostra sete realidades que Moisés aprendeu, que são verdades pata todo o povo de Deus. Esse processo pode ajudar você aen-

E

Ni a

O nome de Deus seja

onte O reino de Deus seja

Obedecer e conheçer

na prético reconciliado com Deus tender como Deus o receberá, para que você faça parte de sua missão,

Ão longo do Antigo e do Novo Testamento, Deus operou da mesma maneira como operou com Moisés, convidando seu povo a participar da missão com ele. Seus métodos continuam os mesmos, Deus se revela a nós para que possamos conhecê-lo pessoalmente, Deus estabelece um relacionamento conosco e nos convida trabalhar com ele. À medida que Deus se revela a nós, é natural passarmos por uma crise de crenças, que exige grandes ajustes em nossa vida para que possamos nos relacionar com ele e com sua missão. À medida que fazemos os ajustes e lhe obedecemos, ele nos leva ao centro de sua ação, a fim de o conhecermos na prática e nos deleitarmos por saber quão significativo é estar na obra com Deus. Jesus: na obra com o Pai Deus quer que sejamos como Jesus sempre foi: obediente. Por meio de sua vida, Jesus mostrou que sempre esteve na obra de Deus ao lado do Pai, Ele anunciou que viera não para fazer à própria vontade, mas a do Pai que o enviara (Mt 26.42;J0 4.34;5.30; 6.38; 8.29; 17.4). Jesus declarou que, para conhecer a vontade do Pas. observava o que o Pai estava fazendo. Então, Jesus se uniu a ele nessa obra: “Em verdade, em verdade vos digo que o Filho nada pode fazer de si mesmo, senão somente aquilo que vir fazer o Pai, porque tudo o que este fizer, o Filho também semelhantemente o faz” (Jo 5.19). Jesus ouvia o Pai, e tudo que Pai dizia acerca dessas coisas então ele falava (Jo 14.10,11). Jesus não

O AT “O

ARES ANDO PIER AIN IS DANO tomava a iniciativa, mas dependia do Pai para Nossos caminhos nos parecem bons. Poderevelar à si mesmo (Jo 17.6-8) eo que fazia era mos obter êxito em pequenas realizações, Contestemunhar do Pai. Por isso, o Pai agiu por tudo, se tentarmos fazer a obra de Deus à nossa meio dele (Jo 14,10). mancira jarmais veremos o grande poder de Deus

O Pai amava o Filho e tomava a iniciativa naquilo que fazemos, é o mundo jamais verá a de ir a ele e revelar-lhe o que estava fazendo manifestação do Senhor. As pessoas só virão ou estava para fazer. Jesus mantinha-se atento a conhecé-lo e adorá-lo pelo poder de Deus, às atividades do Pai ao seu redor, de modo que Quando Deus realiza, à sua maneira, seus propudesse unir sua vida à missão do Pai, pósitos por nosso intermédio, as pessoas então

vêm a conhecê-lo, Elas reconhecem que o que Conhecendo e trabalhando nos lhes ocorreu só pode ser explicado por Deus. Ele caminhos de Deus receberá, portanto, a glória! Até mesmo um leitor casual da Bíblia pode ver Aprender a seguir os caminhos de Deus pode queoscaminhos os planos de Deus são bem ser mais importante que os esforços sinceros para diferentes das maneiras em que as pessoas cumprir sua vontade, Deus anscia por revelar seus alcançam seus objetivos. Deus disse: “Os meus caminhos a nós, porque é a única maneira de reapensamentos não são os vossos pensamentos, lizar seus propósitos. Deus quer completar a obra nem os vossos caminhos, os meus caminhos” dele por meio de você, mas só fará isso se você (1s 55.8). Por si só, as pessoas alcançam obje- ajusta sua vida a ele e à aos caminhos dele, Tentivos por sua eficiência e habilidade, Com te entender o modo em que Deus o chama para Deus, em sua obra, é preciso seguir os prin- aderir à sua obra e para conhecê-lo na prática, Ele cípios do Reino para alcançar os propósitos tem envolvido seu povo em sua obra da mesma do Reino. forma ao longo da história:

1. Deus está sempre ao seu redor para realizar Espere que Deus o encontre para revelar o que está fazendo

sua obra. a redor de você ou entre povos longinquos para reconciliar

consigo um mundo perdido.

2. Deus busca, com você, um relacionamento Responda a Deus quando ele o convidar para um relacio-

real, pessoal e de amor perene. namento caracterizado por promessas e obediência. Deus

quer aprofundar seu relacionamento de amor com você

muito mais que meramente incumbl-lo de uma tarefa.

3. Deus o convida a se envolver em sua obra me- Atenda quando Deus o chamar para fazer a obra.

diante a revelação de si e de sua obra em re-

lação a você.

4, Deus fala com você pelo Espírito Santo, por Atenda ao chamado de Deus depois que aprender seu

meio da Bíblia, da oração, das circunstâncias caminho com outros cristãos e que ele tiver preparado

e da igreja para se revelar, revelar seus pro- você para a missão,

pósitos e seus caminhos.

5. O convite de Deus para trabalhar com ele irá Obedeça a Deus quando ele o enviar à um lugar diferente,

levar você a uma crise de crenças, que exigirá pois é ali que a missão poderá ser realizada a contento.

6. Você precisa fazer importantes ajustes em sua Espere até que Deus o capacite, enquanto você faz em sua

vida para aderir a Deus e ao que ele está fa- vida os ajustes que lhe permitirão colaborar com Deus se-

zendo. gundo seus caminhos.

7. Você passará a conhecer à Deus na prática, Deixe que Deus o guie em sua missão, para que assim ele

à medida que obedecer a ele e enquanto ele possa se revelar e reconciliar consigo o mundo perdido.

realiza sua obra por meio de você.

iii ii ESET IETDORESSSRR ET

Perguntas para estudo

zendo,” Que ajustes cada um destes servos da história sagrada precisou fazer para obedecer ao

(Gn 6 7); (Êx 4); (At 2. Que ajustes você precisaria fazer vida Deus chamasse ministério 3, Você concorda todo sendo enviado 20.21)?

Caso afirmativo, explique como o crente poderá ser treinado e preparado para a obra.

Conhecendo e fazendo a vontade de Deus Como conhecer a vontade de Deus? Uma vez que toda verdadeira missão é, na verdade, Deus realizando sua obra, não há uma missão diferente para você, para mim, para aqueles que viveram milhares de anos atrás ou para os crentes do outro lado do mundo. Ele nunca desejou que ninguém perecesse. À missão de Deus é glorificar seu nome, estabelecer seu Reino e reconciliar consigo o mundo.

Dentro desse imenso propósito global, Deus não precisa esperar que você adivinhe qual é a vontade dele. Visto que ele está buscando um relacionamento de amor com você, não será possível conhecer a vontade dele sem conhecê-lo melhor. À medida que você o conhece melhor, ele se revela de maneira mais clara. Você será transformado também e descobrirá que deseja fazer a vontade dele mais e mais (Fp 2.13).

Em missão com Deus, você descobrirá que Deus é amor. À vontade dele é sempre a melhor. Ele busca um relacionamento de amor com você para que você se una a ele em sua missão.

Em missão com Deus, você descobrirá que ele é onisciente. Seus caminhos estão sempre corretos. Ele os revelará se você for obediente a ele.

Em missão com Deus, você descobrirá que ele é todo-poderoso. Ele o capacitará a read Í 1. “Você precisa fazer importantes ajustes em

chamado de Deus: Noé e Moisés

diferente ou para viver num lugar distante?

em que crente está Ê

Em missão com Deus lizar sua vontade se você se colocar na total dependência dele.

Permita que Deus o oriente mais de perto, e então você será orientado para cumprir a vontade dele. O servo não diz ao mestre que tipo de tarefa precisa realizar. O servo espera que seu mestre lhe diga o que fazer. Se você for obediente, Deus providenciará a tarefa perfeita para você. Em missão com Jesus Os crentes são súditos do Reino, e o próprio Cristo é o Rei eterno sobre seu Reino. Ele “nos constituiu reino, sacerdotes para O seu Deus e Pai” (Ap 1.6). Você foi chamado para ser parceiro de Cristo, o Rei. Nessa parceria, você se envolverá na missão divina de reconciliar o mundo perdido com Deus. Relacionarse assim com Cristo é estar na obra com ele, Você não pode firmar um relacionamento com Jesus sem estar na obra. Jesus disse: “Assim como o Pai me enviou, eu também vos envio” (Jo 20.21).

Jesus estava em missão com o Pai e conclamou cada um de seus seguidores a unir-se a ele nesse relacionamento de amor, de poder e de propósito. Não se esqueça de quão maravilhosa é essa realidade. Nada pode ser mais precioso que seguir a Deus em sua missão da maneira em que Jesus o fez. sua vida para aderir a Deus e ao que ele está fa-

por Jesus “numa missão” (Jo', 16 from cursos where slug = 'perspectivas';

commit;
