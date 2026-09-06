-- 278_perspectivas_licao3.sql
-- Lição 3 ("O Messias para o mundo"): o guia de estudo e as nove leituras
-- enviadas. Ladd cap. 9 (2 PDFs) e Hawthorne cap. 13 (3 PDFs) voltam a ser um
-- capítulo só, com "PARTE N DE M" marcando onde cada arquivo começa.
--
-- Bradford cap. 10 entra por último: ele NÃO é citado em nenhum ponto do guia
-- da Lição 3 — veio junto dos links, mas o guia não o chama.
--
-- Regrava também três leituras das Lições 1 e 2 (Kaiser, Ellisen e Adeney).
-- Alguns PDFs mandam cada letra como um trecho separado, sem espaço, e o
-- espaço tem de sair do vão horizontal. O corte candidato era validado só
-- contra palavra GRUDADA; faltava a guarda do outro lado, contra palavra
-- ESTILHAÇADA em letras soltas — que é o que acontece quando a linha é uma
-- palavra só e não existe vão de palavra nenhum pra achar. Agora o corte é
-- checado nos dois sentidos e, se nenhum candidato sair limpo, vale o menos
-- pior em vez de um corte fixo.
--
-- Transcrição literal, conferida por contagem de caracteres contra a fonte:
-- nenhuma letra falta em nenhuma das peças.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 3) then
    update aulas set titulo = $t$Lição 1 · Leitura — Kaiser: A chamada missionária de Israel$t$, conteudo = $conteudo$A Chamada Missionária de Israel

Walter c. Kaiser Jr

Existe um rumor bem difundido de que o Antigo Testamento não possui uma mensagem ou visão missionária. O Antigo Testamento é, de acordo com a crença popular, um livro e uma mensagem dedicados unicamente aos judeus e ao seu destino como nação. Mas esse rumor e ponto de vista não se enquadram dentro das reivindicações que o próprio Antigo Testamento faz. Mesmo que limitemos nossa investigação a três textos básicos do Antigo Testamento, imediatamente observaremos que tais textos trazem três das mais incisivas declarações de chamada missionária.

Hesitaremos mais em suspeitar que o Antigo Testamento não traz qualquer desafio missionário caso tivéssemos dedicado atenção mais cuidadosa ao seu início. Certamente a mensagem e o propósito dos capítulos iniciais de Gênesis, a saber, Gênesis 1-11, são universais quanto ao apelo e globais quanto ao público. Porventura Deus não tratou "todas as famílias da terra" com graça salvadora quando agiu em três ocasiões específicas em Gênesis 1-11? Ou mais detalhadamente, não é verdade que depois da queda do homem, do dilúvio e do insucesso da torre de Babel, Deus proclamou as magníficas mensagens de salvação em Gênesis 3.15; 9.27 e 12.1-3?

Caso duvidemos que a palavra dita a Abraão em Gênesis 12.1-3 tenha sido global e universal em seu oferecimento e propósito, lembremo-nos, então, rapidamente que ela foi proferida tendo como contexto a tábua das setenta nações de todo o mundo, que se encontra descrita em Gênesis 10. As mesmas "famílias da terra" aparecem nesse texto e em Gênesis 12.3.

Os Gentios do Antigo Testamento Alcançaram a Fé

O fenômeno de gentios depositando sua fé na "semente" ou no "Homem da Promessa" que viria não era desconhecido nem deixava de ser frequentemente lembrado no Antigo Testamento. Pense em Melquisedeque (Gênesis 14), um rei-sacerdote da cidade de Salém (Jerusalém); este gentio confessou abertamente sua fé em Jeová (Yahweh). Jetro, um midianita e sogro de Moisés, demonstrou sua consagração ao mesmo Senhor de Moisés e Arão quando se sentou com eles para participar de uma refeição comunitária sacrificial (Êxodo 18). Ninguém poderia acusar Balaão de ter uma posição pró-judaica ou de ser exageradamente nacionalista, pois desejava ardentemente favorecer o rei de Moabe e amaldiçoar a nação de Israel. Ainda assim, ele foi o oráculo divino da verdade, muito embora o começo tenha sido meio difícil quando sua mula demonstrou discernimento mais profundo do que o próprio profeta. Balaão, todavia, deixou para nós dois impressionantes capítulos (Números 23-24), inclusive a grande e única profecia que relaciona o Messias a uma estrela.

Falta-me tempo para mencionar as cidades inteiras que se arrependeram com a pregação de um único profeta judeu – por exemplo, Jonas e os ninivitas. Mesmo que o servo de Deus tenha ficado mais que relutante e bem triste e tenha tido uma "experiência tão grande quanto uma baleia" (literalmente), antes de finalmente pregar aos gentios imundos que massacraram os judeus, a cidade veio a conhecer ao Senhor em grandes proporções porque Jonas de fato pregou. Mesmo assim, esperava que esse fosse um sermão a cujo apelo ninguém respondesse.

Alguém, todavia, ainda poderá duvidar que o Antigo Testamento tivesse explicitamente ordenado aos crentes e mensageiros de sua época que fossem aos gentios. Perguntam se, por acaso, Deus alguma vez enviou um israelita ou a nação inteira com a Grande Comissão.

Três Textos Básicos

Há três textos básicos que deixam claro que Deus fez exatamente assim. Os textos são: Gênesis 12.1-3; Êxodo 19.4-6 e Salmo 67. Estes três textos são tão básicos para compreendermos o mandato missionário que Deus entregou a toda a nação de Israel que é impossível considerar o Antigo Testamento de modo adequado sem tratar destes textos em seu contexto missionário. Israel sempre foi, no plano e propósito de Deus, responsável por comunicar a mensagem da graça de Deus às nações. Israel foi destinada a ser uma nação comunicadora.

A menos que pensemos que essas três passagens do Antigo Testamento não tenham qualquer relevância para nós que vivemos na era cristã e que sua mensagem seja uma prescrição com data de antes de Cristo, deve ficar bem claro que elas são também uma ordem de Deus para nós. Em forma de esboço, sua mensagem é a ordem de Deus a nós para:

I. Proclamar Seu plano de abençoar as nações – Gn 12.3;

II. Participar do Seu sacerdócio como agentes dessa bênção – Êx 19.4-6; e

III. Provar Seu propósito de abençoar todas as nações – Sl 67

Gênesis 1-11

Ninguém pode dizer que o Antigo Testamento se inicia de modo extremadamente nacionalista ou que o Deus desse testamento fosse tão favorável aos judeus que o trabalho missionário não aconteceria até que o tempo dos gentios tivesse chegado. Como já afirmamos, Gênesis 1-11 claramente defende o contrário. A abrangência desses capítulos é mundial na oferta de salvação para todos que crerem. O tema oposto nestes mesmos capítulos é as nações buscando um "nome" para si. Em Gênesis 6.4 e 11.4, o propósito único da humanidade era ter um "nome" para si e tornar sua reputação cada vez mais conhecida – mas à custa do "nome" de Deus.

Desta forma, os "filhos de Deus" (pelo contexto de Gênesis 6, acredito terem sido déspotas tiranos e poligâmicos) tomaram para si este título divino, juntamente com suas prerrogativas inerentes, e fizeram mau uso dos próprios instrumentos de autoridade que Deus havia estabelecido para justiça, e usaram esses instrumentos indevidamente para satisfazerem seus próprios desejos e cobiças. Este foi o segundo grande fracasso da era patriarcal (Gênesis 1-11). Foi precedido pela queda do homem em Gênesis 3 e teve seu ponto mais alto no terceiro fracasso, o da torre de Babel, em Gênesis 1 1 .

Gênesis 12.1-3: Proclamar Seu Plano

Entretanto, para cada um desses três fracassos, nosso Senhor pronunciou uma palavra salvadora de graça: Gênesis 3.15; 9.27 e 12.1-3. É essa terceira palavra de graça que nos interessa aqui, pois enfatiza a palavra divina de graça em contraste com os fracassos dos homens e sua busca idólatra por um "nome" ou fama. Cinco vezes Deus fala em bênção: "te abençoarei", "te abençoarei", "te abençoarei", "abençoarei os que te abençoarem", e "em ti serão benditas todas as famílias da terra".

Não há dúvida de que a palavra principal aqui é bênção ou abençoar. A mesma palavra caracterizou a seção inteira, começando com a palavra a Adão e Eva "E Deus os abençoou, e lhes disse: Sede fecundos; multiplicai-vos", da mesma maneira como já havia graciosamente prometido abençoar os animais.

Apesar dessa palavra, o homem continuou a lutar por um significado para sua vida ao procurar ter um "nome". Em oposição ao vazio daqueles dias (e dos nossos dias), o vazio de procurar fora de Deus posição, fama e realização humanas, Gênesis 12.2 anuncia repentinamente que Deus daria a Abraão um "nome" como bênção dos céus e não como resultado de obras que colocassem Deus de lado.

O significado mais maravilhoso de todos esses textos missionários não pode ser inteiramente compreendido até que comecemos a perceber que na verdade existem três promessas de bênção em Gênesis 12.2-3, onde Deus promete:

1 . "De ti farei uma grande nação",

2. "E te abençoarei", e

3. "Te engrandecerei o nome"

Mas estas promessas são imediatamente seguidas de uma conjunção subordinativa final: "para que tu sejas uma bênção" (isto é, indicativo de propósito). Nenhuma destas três promessas de bênção seria para o engrandecimento pessoal de Abraão. Na verdade, ele e sua nação seriam abençoados para que pudessem ser uma bênção. Mas bênção para quem? Como? Para encontrarmos respostas a estas perguntas devemos analisar mais duas promessas.

Passariam a existir duas classes distintas de pessoas: as que abençoariam a Abraão e as que o amaldiçoariam. As duas outras promessas foram:

4. "Abençoarei os que te abençoarem", e

5. "Amaldiçoarei os que te amaldiçoarem"

Mais uma vez, no entanto, o escritor de Gênesis acrescenta uma conjunção final, ao mesmo tempo em que muda o tempo verbal, de modo que se tenha uma declaração mais completa de seu propósito. Isto aconteceria "para que em ti sejam benditas todas as famílias da terra".

Isso, então, explica por que deveria haver tantas bênçãos. Este homem e seus descendentes deveriam ser desde o início, missionários e canais da verdade. É de extrema importância que reconheçamos que o verbo hebraico neste caso deve ser traduzido na voz passiva ("'ser abençoado") em vez de na reflexiva ("abençoar-se"), uma vez que o entendimento de todas as mais antigas versões e gramáticas hebraicas, e do Novo Testamento, insiste nesse ponto. É uma questão de graça, não de obras. As nações seriam abençoadas através da "semente" deste homem. De fato, a "semente" da mulher (Gn 3.15), a "semente" de Sem, em cujas tendas Deus viria a "tabernacular" ou "habitar" (Gn 9.27) e a "semente" de Abraão formaram um todo coletivo. Esse todo foi resumido através de sua sucessão de representantes, os quais foram como sinal e penhor até que Cristo mesmo viesse naquela mesma linhagem e como parte daquela sucessão e entidade corporativa.

Inicialmente, os beneficiários desta bênção foram apenas as setenta famílias relacionadas em Gênesis 10 como todas as "famílias" da terra. Do ponto de vista do assunto tratado, esse capítulo precede o terceiro fracasso da humanidade, em Babel, o qual, por sua vez, conduz Gênesis à significativa palavra acerca do propósito e plano divinos de trazer todas as nações do mundo a Si mesmo. Esperava-se que a palavra dita a Abraão tivesse um grande impacto sobre todas as famílias que habitam sobre a face da terra. Sem dúvida alguma, este é um ensino muito significativo em termos missionários.

Alguém poderá permanecer um tanto quanto cético, dizendo que não consegue perceber qualquer evangelho ou boas novas em Gênesis 12.2-3. Nossa resposta para tais questionadores ainda não convencidos é que observem que Paulo, em Romanos 4.13, declarou Abraão como o herdeiro de todo o mundo. Obviamente, essa herança tem de ser de natureza espiritual. Além do mais, Paulo claramente afirmou em Gálatas 3.8 que o evangelho foi antecipadamente pregado a Abraão quando recebeu a promessa de Gênesis 12.3: "em ti serão benditas todas as famílias da terra". Essa era, e ainda é, as boas novas do evangelho.

Se hoje temos fé, então somos parte da "semente" de Abraão (Gl 3.29). O objeto da fé e confiança ainda é o mesmo; o ponto central para Israel e as nações da terra é que o Homem da Promessa, que devia vir na "semente" de Abraão e de Davi, veio em Jesus Cristo.

A mensagem e seu conteúdo, que é de fato, o propósito total de Deus, era que Ele constituiria uma nação e lhe daria um "nome", também a abençoaria para que pudesse ser luz para as nações e, portanto, uma bênção a todas as nações. Da parte de Israel, recuar seria um erro. A nação de Israel seria missionária de Deus ao mundo – e nós também o somos em virtude destes mesmos versículos! A missão não mudou em nossos dias. Deus não tinha o propósito de que Abraão e Israel fossem transmissores da "semente" mais passivos do que nós devamos ser. Eles deveriam ser uma bênção para que pudessem realmente comunicar o dom de Deus ao mundo.

As nações foram vistas de diferentes maneiras, mas o modo pelo qual Deus lidou com elas foi sempre diretamente relacionado à maneira como reagiram ao Homem da Promessa, o qual viria através da nação que Deus havia tornado grande e à qual dera o chamamento de abençoar e de ser uma bênção. O chamado de Israel não se constituiu na oportunidade nem na base para a rejeição de qualquer das nações do mundo, mas, ao contrário, no próprio meio de abençoá-las. A busca de um "nome", de fama, de reputação, ainda existe hoje, mas ainda hoje Deus se dispõe a dar o Seu próprio "nome". Ele ainda dará Seu "nome" especial àqueles que crerem naquela mesma "semente". Esta semente é o único meio pelo qual eles e todos os seus parentes sobre a face da terra serão abençoados e farão parte da família de Deus.

Alguém poderá concordar que o objeto da fé foi, de fato, a semente que viria da linhagem de Abraão, mas talvez não concorde que Deus, por essa razão, esperasse ou exigisse de Abraão e seus descendentes qualquer coisa parecida com a nossa tarefa missionária. Talvez devessem ser completamente passivos enquanto Deus agia como o único protagonista no Antigo Testamento.

Êxodo 19:4-6: Participar do Seu Sacerdócio

Êxodo 19.4-6, o segundo texto do Antigo Testamento para nossa consideração, não permitirá tal interpretação. No conhecido discurso de Moisés, em que ele se refere às asas da águia, Deus relembra Israel de como Moisés os sustentou desde o Egito, tal como uma águia transportaria seus filhotes que estivessem aprendendo a voar. Uma vez que eram os destinatários deste dom da libertação, o texto propositadamente diz: "Agora, pois ..." Essas palavras deixam implícita uma consequência natural que deveria ser resultado do auxílio miraculoso de Deus na fuga deles do Egito.

Começar a ler Êxodo 19.5 sem o "agora, pois", e enfatizar apenas as condições apresentadas a seguir, é perder a ênfase do texto. Tal como Êxodo 20.1 , este texto deve começar no ambiente da graça. "Eu sou o Senhor teu Deus, que te tirei da terra do Egito." O "agora, pois" vem em seguida por causa da bênção anterior de Deus.

Êxodo 19.5-6 prossegue: "se diligentemente ouvirdes a minha voz, e guardardes a minha aliança, então sereis a minha propriedade peculiar entre todos os povos porque toda a terra é minha; vós me sereis reino de sacerdotes e nação santa" (itálicos do autor). Estes são os três ministérios que Deus especifica para os descendentes de Abraão.

Em primeiro lugar, eles deviam ser a propriedade peculiar de Deus, ou como também poderia ser traduzido, a Sua possessão especial. A palavra "peculiar" veio de uma palavra latina que significava objetos de valor ou quaisquer tipos de bens transportáveis que, em contraste com bens imóveis, não estão presos à terra. É o caso de joias, rebanhos e vínculos. O ponto central é que Israel devia ser filho de Deus, Seu povo, Seu primogênito (Êx 4.22) e, agora, Seu tesouro especial. A ênfase aqui é sobre a portabilidade daquela mensagem e sobre o fato de que Deus atribuiu um valor tão elevado a pessoas. É exatamente assim que Malaquias 3.17 nos descreve: "joias", "tesouro".

Outro papel que Israel devia desempenhar era o de ser rei e sacerdote para Deus. A forma possessiva (ou o construto hebraico) "reino de sacerdotes" é mais bem traduzida (com base em seis ocorrências em textos de prosa) por "reis e sacerdotes" ou "sacerdotes reais". Se alguma dúvida ainda existia, é aqui que o papel missionário de Israel se torna explícito. Como representante do reino de Deus, a nação toda devia agir exercendo um papel mediador em relação às demais nações.

De fato, foi esta passagem que se tornou a base para a famosa doutrina do Novo Testamento a respeito do sacerdócio dos crentes (veja 1Pe 2.9; Ap 1.6; 5.10). Infelizmente para Israel, eles rejeitaram este sacerdócio de todos os crentes e insistiram com Moisés para que subisse ao monte Sinai em seu favor e como seu representante. Entretanto, muito embora o plano original de Deus tenha sido momentaneamente frustrado e adiado até a época do Novo Testamento, ele não foi derrotado, substituído ou desprezado. Continuou sendo o plano de Deus para os crentes. Eles ainda teriam um papel mediador.

Israel devia realizar uma terceira tarefa: a de "nação santa". Na Bíblia, a santidade não é uma espécie de anestésico que atinge os participantes de um culto dominical e os torna como que apáticos e passivos. Santidade é inteireza. Ser "santo" é pertencer "inteiramente" ao Senhor.

É pena que em português tenhamos que usar duas palavras de origem totalmente distinta (a que sugere o aspecto religioso, "santo", e a que sugere o secular, "inteiro"), enquanto em hebraico as duas palavras têm uma raiz comum. Como nação, Israel devia se apresentar inteira ao Senhor. Eles deviam estar separados não apenas em suas vidas, mas também no seu trabalho. A chamada e a eleição recebidas de Deus eram para servir, e esse serviço já havia sido definido ainda nos dias de seu ancestral Abraão.

Assim com os sacerdotes deviam representar a Deus e mediar Sua palavra às nações, da mesma maneira Israel, com uma nação santa, devia assumir dois relacionamentos: um com Deus, seu Rei, e outro com as nações. Israel devia ser uma nação separada para todas as eras e para todos os povos. Em vez disso, todavia, Israel começou a se comportar egoisticamente, como frequentemente fazemos, agindo como um clube de piedosos, em vez de se lembrarem de que foram chamados para compartilhar com as nações as bênçãos, a verdade, as dádivas e a "Semente". Pode-se dizer que carregavam um documento que os identificava como "Embaixadores do Homem da Promessa que Viria".

Todavia, não esqueci a distinção entre Israel e a Igreja. É possível fazer distinção entre estas duas instituições da mesma maneira como é possível fazer distinção entre macho e fêmea. Apesar disso, a morte de Cristo derrubou a parede de separação existente no templo, na qual estava inscrita a advertência de que seria castigado com a morte qualquer gentio que desobedecesse e ultrapassasse seus limites. Homem, mulher, judeu, grego, escravo – não importa mais nenhuma dessas ou de quaisquer outras condições. Todos os que creem constituem um só "povo de Deus". Esta é, de fato, a expressão que dá ideia de continuidade e identifica todos os que em todas as épocas pertencem ao Salvador. E Pedro deixa a ideia bem clara ao chamar os crentes gentios de sua época de "raça eleita, sacerdócio real, nação santa, povo de propriedade exclusiva de Deus" (1Pe 2.9). A citação de Êxodo 19 é bem óbvia e clara. A questão é: será que reconhecemos a continuidade no propósito e plano divinos?

Pedro continua a esclarecer o assunto. Deus havia chamado Seu povo por estes quatro títulos (1Pe 2.9) "a fim de (que proclamassem) as virtudes daquele que (os) chamou das trevas para a sua maravilhosa luz". A razão pela qual Israel, e agora os gentios crentes, ter sido chamado de sacerdócio real, nação santa, povo de Deus, Sua raça escolhida, Sua possessão especial e transportável, é que possamos anunciar, declarar e ser Seus missionários e testemunhas.

Nenhuma destas dádivas devia ser utilizada unicamente para nós mesmos. Não nos foram dadas para servirem de simples distintivos. Tinham o propósito de declarar Seus atos poderosos e de chamar pessoas para a Sua maravilhosa luz. Outrora, diz Pedro nesse mesmo contexto (tomando emprestados os nomes cheios de simbolismo dos filhos de Oseias), "não éramos povo" (Lo-Ami), "não tínhamos misericórdia" (Lo-Ruama). Mas agora somos o povo de Deus. Agora recebemos a misericórdia e a graça de Deus.

Pedro está tentando nos mostrar que o povo de Deus, em todas as épocas, tem sido um. Ainda que possamos identificar dentro desse único povo de Deus diversos aspectos, tais como Israel e Igreja, e ainda que possamos relacionar diversos aspectos desse plano e propósito divinos de que todas as nações da terra sejam abençoadas, mesmo assim é mais do que certa a unidade de todos os crentes e a continuidade desse programa entre o Antigo Testamento e o Novo. E nos dois testamentos vemos que o plano de Deus é que participemos desse sacerdócio, sendo agentes de bênção a todas as nações da terra. Êxodo 19 nos mostra que este era o plano de Deus.

Salmo 67: Provar Seu Propósito

Nosso terceiro e último texto vem do Salmo 67. Vimos como Deus nos chama a todos: 1) a proclamar Seu plano às nações (Gênesis 12), 2) a participar do Seu sacerdócio como agentes de bênção a todas as nações (Êxodo 19), e agora 3) a provar Seu propósito de abençoar todas as nações (Salmo 67). Este Salmo é baseado na bênção arônica, que se encontra em Números 6.24-26:

O Senhor te abençoe e te guarde;

O Senhor faça resplandecer o seu rosto sobre ti, e tenha misericórdia de ti;

O Senhor sobre ti levante o seu rosto, e te dê a paz.

Hoje em dia, frequentemente se ouvem estas palavras no fim de cultos evangélicos.

Mas repare no que o salmista faz aqui. Em vez de dizer "Yahweh" (isto é, SENHOR), que para Israel era o nome pessoal de Deus e usado nas alianças, ele emprega Elohim (isto é, Deus), o nome usado quando o relacionamento de Deus com todos os homens, nações e a criação é necessário. O salmista orou: "Seja Deus gracioso para conosco, e nos abençoe". E mais uma vez o salmista muda ligeiramente as palavras, usando as palavras "entre nós" (literalmente), em vez de "sobre nós"... "e faça resplandecer entre nós o seu rosto".

É significativo que este salmo missionário tenha aplicado a todos os povos o que Deus havia dado através de Arão e dos sacerdotes. O propósito desta bênção estendida se encontra imediatamente no versículo 2: "para que se conheça na terra o teu caminho; em todas as nações (ou, entre todos os gentios), a tua salvação". Esta é a razão por que Deus foi gracioso e abençoou Israel e todos os que creram. Isto, então, está em concordância com Gênesis 12.3.

A ideia destes versículos era: Que o Senhor nos abençoe, concidadãos israelitas. Que Ele Se agrade em nos beneficiar. Que as nossas colheitas produzam cada vez mais e que os nossos rebanhos se reproduzam abundantemente. Que nossas famílias cresçam e que prosperemos espiritualmente, para que as nações possam olhar para nós e dizer que aquilo pelo qual Arão orou aconteceu de fato através da bênção de Deus. A própria generosidade de Deus demonstra que Ele nos abençoou. Portanto, que o restante de Seu propósito também venha a acontecer: que por abençoar Israel, todas as nações da terra também possam conhecer a Deus.

Este salmo tem sido chamado de Pater Noster ("Pai Nosso"), ou a Oração do Senhor do Antigo Testamento. Ela tem três estrofes: vv. 1-3 (terminando com: "Louvem-te os povos, ó Deus; louvem-te os povos, todos") vv.4-5 (terminando com o mesmo refrão) vv. 6-7.

Provavelmente este salmo era cantado durante a festa de Pentecostes. O salmo é ainda mais notável pelo fato de que seria no Pentecostes que Deus iria derramar o Seu Espírito sobre todas as nações e que uma colheita incomum iria acontecer, uma colheita maior do que a acontecida anteriormente em qualquer outra festa. Deliberadamente, o salmista se refere à colheita como um penhor, um sinal e um símbolo da colheita espiritual de cada tribo, língua e nação. De modo que possa o Senhor ser verdadeiramente gracioso (cheio de graça) conosco e nos abençoe.

Três vezes este salmo se refere à bênção divina: nos versículos um, seis e sete. A estrutura é uma réplica quase exata de Gênesis 12.2-3. Abençoa-nos, abençoa-nos, abençoa-nos ... para que todas as nações possam conhecer o Senhor.

O salmista nos conclama a provar e testar os propósitos de Deus por três razões. Essas razões se enquadram na estrutura que já observamos. A primeira razão é que Deus tem sido gracioso conosco (vv.1-3). Temos experimentado a graça de Deus no Seu jeito e maneira de lidar com Israel. Temos experimentado essa graça ao sabermos que Sua salvação foi estendida a todas as nações. Como seria se todos os povos de todas as nações viessem a conhecer pessoalmente essa mesma graça!

Uma segunda razão é que Deus governa e guia todas as nações (vv.4-5). Neste contexto, todavia, Ele não é um juiz no sentido forense, com a função de condenar ou punir. Ao contrário, é um governante real que governa legalmente com justiça, como lemos em Isaías 11.3ss. Na qualidade de Grande Pastor do Salmo 23.3, é um guia para as nações. Por esta razão, o refrão aparece de novo: Venham, todos os povos da terra. Venham ouvir. Está na hora de vocês começaram a louvar o Senhor.

E por fim temos a terceira razão: a própria bondade de Deus (vv.6-7). Devemos provar o propósito de Deus de abençoar as nações porque Ele tem sido tão bom conosco. A terra tem dado cada vez mais frutos, e nossos celeiros, depósitos de cereais e silos estão transbordando. Será que isto não foi uma evidência de que Deus respondeu à oração de Arão e dos sacerdotes, mencionada em Números 6.24-26? O poder de Deus é evidente na própria abundância da colheita.

Esse mesmo poder e essa presença de Deus que trouxeram o crescimento material estão disponíveis também para o crescimento espiritual. Caso este poderfosse mais evidente em nossas vidas e pregação, os resultados espirituais no exterior entre todas as nações e em nossa própria nação seriam testemunhados por todas as pessoas. O que se deve destacar é que o salmista não pronunciou palavras e formas vazias, mas compôs o Salmo para que Israel e nós experimentássemos uma verdadeira mudança em nossas vidas. A bênção de Deus vem para que os confins da terra recebam benefício espiritual. O que aconteceu materialmente era apenas para ser um sinal de uma bênção de dimensões muito mais amplas.

Sim, "Abençoe-nos Deus, e todos os confins da terra o temerão" (v.7). A palavra "temer" não traz a ideia de terror ou medo. Existem dois diferentes usos da palavra "temer". Êxodo 20.20 nos exorta: "Não tenha medo, ao contrário, tema o Senhor". Não tenha medo, ao contrário, confie e ponha toda a dedicação de sua alma nEle.

Por essa razão, o temor do Senhor é o princípio de tudo – da compreensão, da vida, da santidade pessoal, bem como de um relacionamento pessoal e vital com Ele. Temor é uma das palavras do Antigo Testamento que designam confiança e fé. A bondade de Deus para com Israel tinha o propósito de ser uma das maneiras de Deus trazer todas as nações do planeta Terra a temê-lo, isto é, à fé no Homem da Promessa que viria, nosso Senhor Jesus Cristo. Israel devia ser uma nação que testemunhasse, proclamasse e evangelizasse. Os gentios tinham que ser trazidos à luz.

Este propósito para Israel é visto ainda mais claramente numa passagem que não faz parte desta discussão, a saber, as passagens acerca do "Servo do Senhor" em Isaías 42 e 49. Israel é aquele servo do Senhor, ainda que o Messias seja o representante final por excelência de todo o grupo. Como tal, Israel devia ser uma "luz para as nações", tal como Abraão fora ordenado a ser, o escritor de Êxodo havia exortado e o salmista havia cantado.

O salmista ansiava e desejava profundamente que Deus, o Rei de Israel, fosse reconhecido como Senhor e Salvador de todas as famílias da terra. Nosso desejo e anseio deveriam ser menores? Será que Deus nos chama a algo menos do que também provar, juntamente com Israel, Seu propósito nesta passagem do Salmo 67? O desafio de Deus a Israel também é nosso: devemos ter um papel mediador na proclamação de Seu nome entre as nações. Esse ainda é o propósito de Deus. Ele está se cumprindo em sua vida?

Uma Multidão de Testemunhas

Espero que a chama do evangelho, encapsulada em Gênesis 12.2-3, e o chamado para sermos uma nação santa e um sacerdócio real despertem em nós o desejo de proclamar o evangelho nos dias que ainda temos pela frente. Que anunciemos não apenas ao nosso país, mas a cada nação sobre a face da terra, que Jesus é o Senhor para a glória de Deus Pai. Creio que nossas faculdades teológicas e seminários farão um excelente trabalho de preparar homens para pregarem como nunca antes nos púlpitos deste país, mas também creio, e oro nesse sentido, para que de nossas faculdades teológicas, seminários e de cada segmento da sociedade surja uma imensa multidão de homens e mulheres que literalmente circundem o globo pelo nome que está acima de todo nome, o nome de nosso grande Deus.

Que Deus abençoe vocês que já atenderam a Seu chamado. Apenas lamento que não haja ainda mais pessoas indo. Que o Senhor nos repreenda e nos sonde para que descubramos se nós mesmos não devamos nos juntar a este grande grupo. Oro para que apoiemos aqueles que estão indo a fim de que possam apresentar relatórios com tal plenitude do poder e bênção do Espírito de Deus para que outra multidão seja acrescentada à primeira. E oro para que os recursos materiais necessários surjam enquanto Deus fala a cada um de nós; oro para que sejamos generosos com o Senhor, o qual tem sido muito generoso conosco. Assim seja. Amém.

Perguntas Para Estudo

1 . Deus deu um mandato missionário ao povo de Israel no Antigo Testamento da maneira como o fez com a Igreja no Novo Testamento? Explique sua resposta com base em textos bíblicos. 2. Qual a continuidade existente entre a missão de Deus no Antigo Testamento e a mesma missão no Novo?

Walter C. Kaiser Jr. é professor de Línguas Semíticas e de Antigo Testamento bem

como deão e vice-presidente de educação da Escola Teológica Evangélica da Trindade, em Deerfield, Illinois, EUA. Anteriormente ensinou na Faculdade Wheaton e atuou como pastor. Adaptado de uma mensagem apresentada em 14 de maio de 1981 aos alunos da Escola Teológica Evangélica da Trindade, Deerfield, Illinois, EUA. Usado com permissão de Walter C. Kaiser Jr.$conteudo$
     where curso_id = v_curso and ordem = 3;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 1 · Leitura — Kaiser: A chamada missionária de Israel$t$, $conteudo$A Chamada Missionária de Israel

Walter c. Kaiser Jr

Existe um rumor bem difundido de que o Antigo Testamento não possui uma mensagem ou visão missionária. O Antigo Testamento é, de acordo com a crença popular, um livro e uma mensagem dedicados unicamente aos judeus e ao seu destino como nação. Mas esse rumor e ponto de vista não se enquadram dentro das reivindicações que o próprio Antigo Testamento faz. Mesmo que limitemos nossa investigação a três textos básicos do Antigo Testamento, imediatamente observaremos que tais textos trazem três das mais incisivas declarações de chamada missionária.

Hesitaremos mais em suspeitar que o Antigo Testamento não traz qualquer desafio missionário caso tivéssemos dedicado atenção mais cuidadosa ao seu início. Certamente a mensagem e o propósito dos capítulos iniciais de Gênesis, a saber, Gênesis 1-11, são universais quanto ao apelo e globais quanto ao público. Porventura Deus não tratou "todas as famílias da terra" com graça salvadora quando agiu em três ocasiões específicas em Gênesis 1-11? Ou mais detalhadamente, não é verdade que depois da queda do homem, do dilúvio e do insucesso da torre de Babel, Deus proclamou as magníficas mensagens de salvação em Gênesis 3.15; 9.27 e 12.1-3?

Caso duvidemos que a palavra dita a Abraão em Gênesis 12.1-3 tenha sido global e universal em seu oferecimento e propósito, lembremo-nos, então, rapidamente que ela foi proferida tendo como contexto a tábua das setenta nações de todo o mundo, que se encontra descrita em Gênesis 10. As mesmas "famílias da terra" aparecem nesse texto e em Gênesis 12.3.

Os Gentios do Antigo Testamento Alcançaram a Fé

O fenômeno de gentios depositando sua fé na "semente" ou no "Homem da Promessa" que viria não era desconhecido nem deixava de ser frequentemente lembrado no Antigo Testamento. Pense em Melquisedeque (Gênesis 14), um rei-sacerdote da cidade de Salém (Jerusalém); este gentio confessou abertamente sua fé em Jeová (Yahweh). Jetro, um midianita e sogro de Moisés, demonstrou sua consagração ao mesmo Senhor de Moisés e Arão quando se sentou com eles para participar de uma refeição comunitária sacrificial (Êxodo 18). Ninguém poderia acusar Balaão de ter uma posição pró-judaica ou de ser exageradamente nacionalista, pois desejava ardentemente favorecer o rei de Moabe e amaldiçoar a nação de Israel. Ainda assim, ele foi o oráculo divino da verdade, muito embora o começo tenha sido meio difícil quando sua mula demonstrou discernimento mais profundo do que o próprio profeta. Balaão, todavia, deixou para nós dois impressionantes capítulos (Números 23-24), inclusive a grande e única profecia que relaciona o Messias a uma estrela.

Falta-me tempo para mencionar as cidades inteiras que se arrependeram com a pregação de um único profeta judeu – por exemplo, Jonas e os ninivitas. Mesmo que o servo de Deus tenha ficado mais que relutante e bem triste e tenha tido uma "experiência tão grande quanto uma baleia" (literalmente), antes de finalmente pregar aos gentios imundos que massacraram os judeus, a cidade veio a conhecer ao Senhor em grandes proporções porque Jonas de fato pregou. Mesmo assim, esperava que esse fosse um sermão a cujo apelo ninguém respondesse.

Alguém, todavia, ainda poderá duvidar que o Antigo Testamento tivesse explicitamente ordenado aos crentes e mensageiros de sua época que fossem aos gentios. Perguntam se, por acaso, Deus alguma vez enviou um israelita ou a nação inteira com a Grande Comissão.

Três Textos Básicos

Há três textos básicos que deixam claro que Deus fez exatamente assim. Os textos são: Gênesis 12.1-3; Êxodo 19.4-6 e Salmo 67. Estes três textos são tão básicos para compreendermos o mandato missionário que Deus entregou a toda a nação de Israel que é impossível considerar o Antigo Testamento de modo adequado sem tratar destes textos em seu contexto missionário. Israel sempre foi, no plano e propósito de Deus, responsável por comunicar a mensagem da graça de Deus às nações. Israel foi destinada a ser uma nação comunicadora.

A menos que pensemos que essas três passagens do Antigo Testamento não tenham qualquer relevância para nós que vivemos na era cristã e que sua mensagem seja uma prescrição com data de antes de Cristo, deve ficar bem claro que elas são também uma ordem de Deus para nós. Em forma de esboço, sua mensagem é a ordem de Deus a nós para:

I. Proclamar Seu plano de abençoar as nações – Gn 12.3;

II. Participar do Seu sacerdócio como agentes dessa bênção – Êx 19.4-6; e

III. Provar Seu propósito de abençoar todas as nações – Sl 67

Gênesis 1-11

Ninguém pode dizer que o Antigo Testamento se inicia de modo extremadamente nacionalista ou que o Deus desse testamento fosse tão favorável aos judeus que o trabalho missionário não aconteceria até que o tempo dos gentios tivesse chegado. Como já afirmamos, Gênesis 1-11 claramente defende o contrário. A abrangência desses capítulos é mundial na oferta de salvação para todos que crerem. O tema oposto nestes mesmos capítulos é as nações buscando um "nome" para si. Em Gênesis 6.4 e 11.4, o propósito único da humanidade era ter um "nome" para si e tornar sua reputação cada vez mais conhecida – mas à custa do "nome" de Deus.

Desta forma, os "filhos de Deus" (pelo contexto de Gênesis 6, acredito terem sido déspotas tiranos e poligâmicos) tomaram para si este título divino, juntamente com suas prerrogativas inerentes, e fizeram mau uso dos próprios instrumentos de autoridade que Deus havia estabelecido para justiça, e usaram esses instrumentos indevidamente para satisfazerem seus próprios desejos e cobiças. Este foi o segundo grande fracasso da era patriarcal (Gênesis 1-11). Foi precedido pela queda do homem em Gênesis 3 e teve seu ponto mais alto no terceiro fracasso, o da torre de Babel, em Gênesis 1 1 .

Gênesis 12.1-3: Proclamar Seu Plano

Entretanto, para cada um desses três fracassos, nosso Senhor pronunciou uma palavra salvadora de graça: Gênesis 3.15; 9.27 e 12.1-3. É essa terceira palavra de graça que nos interessa aqui, pois enfatiza a palavra divina de graça em contraste com os fracassos dos homens e sua busca idólatra por um "nome" ou fama. Cinco vezes Deus fala em bênção: "te abençoarei", "te abençoarei", "te abençoarei", "abençoarei os que te abençoarem", e "em ti serão benditas todas as famílias da terra".

Não há dúvida de que a palavra principal aqui é bênção ou abençoar. A mesma palavra caracterizou a seção inteira, começando com a palavra a Adão e Eva "E Deus os abençoou, e lhes disse: Sede fecundos; multiplicai-vos", da mesma maneira como já havia graciosamente prometido abençoar os animais.

Apesar dessa palavra, o homem continuou a lutar por um significado para sua vida ao procurar ter um "nome". Em oposição ao vazio daqueles dias (e dos nossos dias), o vazio de procurar fora de Deus posição, fama e realização humanas, Gênesis 12.2 anuncia repentinamente que Deus daria a Abraão um "nome" como bênção dos céus e não como resultado de obras que colocassem Deus de lado.

O significado mais maravilhoso de todos esses textos missionários não pode ser inteiramente compreendido até que comecemos a perceber que na verdade existem três promessas de bênção em Gênesis 12.2-3, onde Deus promete:

1 . "De ti farei uma grande nação",

2. "E te abençoarei", e

3. "Te engrandecerei o nome"

Mas estas promessas são imediatamente seguidas de uma conjunção subordinativa final: "para que tu sejas uma bênção" (isto é, indicativo de propósito). Nenhuma destas três promessas de bênção seria para o engrandecimento pessoal de Abraão. Na verdade, ele e sua nação seriam abençoados para que pudessem ser uma bênção. Mas bênção para quem? Como? Para encontrarmos respostas a estas perguntas devemos analisar mais duas promessas.

Passariam a existir duas classes distintas de pessoas: as que abençoariam a Abraão e as que o amaldiçoariam. As duas outras promessas foram:

4. "Abençoarei os que te abençoarem", e

5. "Amaldiçoarei os que te amaldiçoarem"

Mais uma vez, no entanto, o escritor de Gênesis acrescenta uma conjunção final, ao mesmo tempo em que muda o tempo verbal, de modo que se tenha uma declaração mais completa de seu propósito. Isto aconteceria "para que em ti sejam benditas todas as famílias da terra".

Isso, então, explica por que deveria haver tantas bênçãos. Este homem e seus descendentes deveriam ser desde o início, missionários e canais da verdade. É de extrema importância que reconheçamos que o verbo hebraico neste caso deve ser traduzido na voz passiva ("'ser abençoado") em vez de na reflexiva ("abençoar-se"), uma vez que o entendimento de todas as mais antigas versões e gramáticas hebraicas, e do Novo Testamento, insiste nesse ponto. É uma questão de graça, não de obras. As nações seriam abençoadas através da "semente" deste homem. De fato, a "semente" da mulher (Gn 3.15), a "semente" de Sem, em cujas tendas Deus viria a "tabernacular" ou "habitar" (Gn 9.27) e a "semente" de Abraão formaram um todo coletivo. Esse todo foi resumido através de sua sucessão de representantes, os quais foram como sinal e penhor até que Cristo mesmo viesse naquela mesma linhagem e como parte daquela sucessão e entidade corporativa.

Inicialmente, os beneficiários desta bênção foram apenas as setenta famílias relacionadas em Gênesis 10 como todas as "famílias" da terra. Do ponto de vista do assunto tratado, esse capítulo precede o terceiro fracasso da humanidade, em Babel, o qual, por sua vez, conduz Gênesis à significativa palavra acerca do propósito e plano divinos de trazer todas as nações do mundo a Si mesmo. Esperava-se que a palavra dita a Abraão tivesse um grande impacto sobre todas as famílias que habitam sobre a face da terra. Sem dúvida alguma, este é um ensino muito significativo em termos missionários.

Alguém poderá permanecer um tanto quanto cético, dizendo que não consegue perceber qualquer evangelho ou boas novas em Gênesis 12.2-3. Nossa resposta para tais questionadores ainda não convencidos é que observem que Paulo, em Romanos 4.13, declarou Abraão como o herdeiro de todo o mundo. Obviamente, essa herança tem de ser de natureza espiritual. Além do mais, Paulo claramente afirmou em Gálatas 3.8 que o evangelho foi antecipadamente pregado a Abraão quando recebeu a promessa de Gênesis 12.3: "em ti serão benditas todas as famílias da terra". Essa era, e ainda é, as boas novas do evangelho.

Se hoje temos fé, então somos parte da "semente" de Abraão (Gl 3.29). O objeto da fé e confiança ainda é o mesmo; o ponto central para Israel e as nações da terra é que o Homem da Promessa, que devia vir na "semente" de Abraão e de Davi, veio em Jesus Cristo.

A mensagem e seu conteúdo, que é de fato, o propósito total de Deus, era que Ele constituiria uma nação e lhe daria um "nome", também a abençoaria para que pudesse ser luz para as nações e, portanto, uma bênção a todas as nações. Da parte de Israel, recuar seria um erro. A nação de Israel seria missionária de Deus ao mundo – e nós também o somos em virtude destes mesmos versículos! A missão não mudou em nossos dias. Deus não tinha o propósito de que Abraão e Israel fossem transmissores da "semente" mais passivos do que nós devamos ser. Eles deveriam ser uma bênção para que pudessem realmente comunicar o dom de Deus ao mundo.

As nações foram vistas de diferentes maneiras, mas o modo pelo qual Deus lidou com elas foi sempre diretamente relacionado à maneira como reagiram ao Homem da Promessa, o qual viria através da nação que Deus havia tornado grande e à qual dera o chamamento de abençoar e de ser uma bênção. O chamado de Israel não se constituiu na oportunidade nem na base para a rejeição de qualquer das nações do mundo, mas, ao contrário, no próprio meio de abençoá-las. A busca de um "nome", de fama, de reputação, ainda existe hoje, mas ainda hoje Deus se dispõe a dar o Seu próprio "nome". Ele ainda dará Seu "nome" especial àqueles que crerem naquela mesma "semente". Esta semente é o único meio pelo qual eles e todos os seus parentes sobre a face da terra serão abençoados e farão parte da família de Deus.

Alguém poderá concordar que o objeto da fé foi, de fato, a semente que viria da linhagem de Abraão, mas talvez não concorde que Deus, por essa razão, esperasse ou exigisse de Abraão e seus descendentes qualquer coisa parecida com a nossa tarefa missionária. Talvez devessem ser completamente passivos enquanto Deus agia como o único protagonista no Antigo Testamento.

Êxodo 19:4-6: Participar do Seu Sacerdócio

Êxodo 19.4-6, o segundo texto do Antigo Testamento para nossa consideração, não permitirá tal interpretação. No conhecido discurso de Moisés, em que ele se refere às asas da águia, Deus relembra Israel de como Moisés os sustentou desde o Egito, tal como uma águia transportaria seus filhotes que estivessem aprendendo a voar. Uma vez que eram os destinatários deste dom da libertação, o texto propositadamente diz: "Agora, pois ..." Essas palavras deixam implícita uma consequência natural que deveria ser resultado do auxílio miraculoso de Deus na fuga deles do Egito.

Começar a ler Êxodo 19.5 sem o "agora, pois", e enfatizar apenas as condições apresentadas a seguir, é perder a ênfase do texto. Tal como Êxodo 20.1 , este texto deve começar no ambiente da graça. "Eu sou o Senhor teu Deus, que te tirei da terra do Egito." O "agora, pois" vem em seguida por causa da bênção anterior de Deus.

Êxodo 19.5-6 prossegue: "se diligentemente ouvirdes a minha voz, e guardardes a minha aliança, então sereis a minha propriedade peculiar entre todos os povos porque toda a terra é minha; vós me sereis reino de sacerdotes e nação santa" (itálicos do autor). Estes são os três ministérios que Deus especifica para os descendentes de Abraão.

Em primeiro lugar, eles deviam ser a propriedade peculiar de Deus, ou como também poderia ser traduzido, a Sua possessão especial. A palavra "peculiar" veio de uma palavra latina que significava objetos de valor ou quaisquer tipos de bens transportáveis que, em contraste com bens imóveis, não estão presos à terra. É o caso de joias, rebanhos e vínculos. O ponto central é que Israel devia ser filho de Deus, Seu povo, Seu primogênito (Êx 4.22) e, agora, Seu tesouro especial. A ênfase aqui é sobre a portabilidade daquela mensagem e sobre o fato de que Deus atribuiu um valor tão elevado a pessoas. É exatamente assim que Malaquias 3.17 nos descreve: "joias", "tesouro".

Outro papel que Israel devia desempenhar era o de ser rei e sacerdote para Deus. A forma possessiva (ou o construto hebraico) "reino de sacerdotes" é mais bem traduzida (com base em seis ocorrências em textos de prosa) por "reis e sacerdotes" ou "sacerdotes reais". Se alguma dúvida ainda existia, é aqui que o papel missionário de Israel se torna explícito. Como representante do reino de Deus, a nação toda devia agir exercendo um papel mediador em relação às demais nações.

De fato, foi esta passagem que se tornou a base para a famosa doutrina do Novo Testamento a respeito do sacerdócio dos crentes (veja 1Pe 2.9; Ap 1.6; 5.10). Infelizmente para Israel, eles rejeitaram este sacerdócio de todos os crentes e insistiram com Moisés para que subisse ao monte Sinai em seu favor e como seu representante. Entretanto, muito embora o plano original de Deus tenha sido momentaneamente frustrado e adiado até a época do Novo Testamento, ele não foi derrotado, substituído ou desprezado. Continuou sendo o plano de Deus para os crentes. Eles ainda teriam um papel mediador.

Israel devia realizar uma terceira tarefa: a de "nação santa". Na Bíblia, a santidade não é uma espécie de anestésico que atinge os participantes de um culto dominical e os torna como que apáticos e passivos. Santidade é inteireza. Ser "santo" é pertencer "inteiramente" ao Senhor.

É pena que em português tenhamos que usar duas palavras de origem totalmente distinta (a que sugere o aspecto religioso, "santo", e a que sugere o secular, "inteiro"), enquanto em hebraico as duas palavras têm uma raiz comum. Como nação, Israel devia se apresentar inteira ao Senhor. Eles deviam estar separados não apenas em suas vidas, mas também no seu trabalho. A chamada e a eleição recebidas de Deus eram para servir, e esse serviço já havia sido definido ainda nos dias de seu ancestral Abraão.

Assim com os sacerdotes deviam representar a Deus e mediar Sua palavra às nações, da mesma maneira Israel, com uma nação santa, devia assumir dois relacionamentos: um com Deus, seu Rei, e outro com as nações. Israel devia ser uma nação separada para todas as eras e para todos os povos. Em vez disso, todavia, Israel começou a se comportar egoisticamente, como frequentemente fazemos, agindo como um clube de piedosos, em vez de se lembrarem de que foram chamados para compartilhar com as nações as bênçãos, a verdade, as dádivas e a "Semente". Pode-se dizer que carregavam um documento que os identificava como "Embaixadores do Homem da Promessa que Viria".

Todavia, não esqueci a distinção entre Israel e a Igreja. É possível fazer distinção entre estas duas instituições da mesma maneira como é possível fazer distinção entre macho e fêmea. Apesar disso, a morte de Cristo derrubou a parede de separação existente no templo, na qual estava inscrita a advertência de que seria castigado com a morte qualquer gentio que desobedecesse e ultrapassasse seus limites. Homem, mulher, judeu, grego, escravo – não importa mais nenhuma dessas ou de quaisquer outras condições. Todos os que creem constituem um só "povo de Deus". Esta é, de fato, a expressão que dá ideia de continuidade e identifica todos os que em todas as épocas pertencem ao Salvador. E Pedro deixa a ideia bem clara ao chamar os crentes gentios de sua época de "raça eleita, sacerdócio real, nação santa, povo de propriedade exclusiva de Deus" (1Pe 2.9). A citação de Êxodo 19 é bem óbvia e clara. A questão é: será que reconhecemos a continuidade no propósito e plano divinos?

Pedro continua a esclarecer o assunto. Deus havia chamado Seu povo por estes quatro títulos (1Pe 2.9) "a fim de (que proclamassem) as virtudes daquele que (os) chamou das trevas para a sua maravilhosa luz". A razão pela qual Israel, e agora os gentios crentes, ter sido chamado de sacerdócio real, nação santa, povo de Deus, Sua raça escolhida, Sua possessão especial e transportável, é que possamos anunciar, declarar e ser Seus missionários e testemunhas.

Nenhuma destas dádivas devia ser utilizada unicamente para nós mesmos. Não nos foram dadas para servirem de simples distintivos. Tinham o propósito de declarar Seus atos poderosos e de chamar pessoas para a Sua maravilhosa luz. Outrora, diz Pedro nesse mesmo contexto (tomando emprestados os nomes cheios de simbolismo dos filhos de Oseias), "não éramos povo" (Lo-Ami), "não tínhamos misericórdia" (Lo-Ruama). Mas agora somos o povo de Deus. Agora recebemos a misericórdia e a graça de Deus.

Pedro está tentando nos mostrar que o povo de Deus, em todas as épocas, tem sido um. Ainda que possamos identificar dentro desse único povo de Deus diversos aspectos, tais como Israel e Igreja, e ainda que possamos relacionar diversos aspectos desse plano e propósito divinos de que todas as nações da terra sejam abençoadas, mesmo assim é mais do que certa a unidade de todos os crentes e a continuidade desse programa entre o Antigo Testamento e o Novo. E nos dois testamentos vemos que o plano de Deus é que participemos desse sacerdócio, sendo agentes de bênção a todas as nações da terra. Êxodo 19 nos mostra que este era o plano de Deus.

Salmo 67: Provar Seu Propósito

Nosso terceiro e último texto vem do Salmo 67. Vimos como Deus nos chama a todos: 1) a proclamar Seu plano às nações (Gênesis 12), 2) a participar do Seu sacerdócio como agentes de bênção a todas as nações (Êxodo 19), e agora 3) a provar Seu propósito de abençoar todas as nações (Salmo 67). Este Salmo é baseado na bênção arônica, que se encontra em Números 6.24-26:

O Senhor te abençoe e te guarde;

O Senhor faça resplandecer o seu rosto sobre ti, e tenha misericórdia de ti;

O Senhor sobre ti levante o seu rosto, e te dê a paz.

Hoje em dia, frequentemente se ouvem estas palavras no fim de cultos evangélicos.

Mas repare no que o salmista faz aqui. Em vez de dizer "Yahweh" (isto é, SENHOR), que para Israel era o nome pessoal de Deus e usado nas alianças, ele emprega Elohim (isto é, Deus), o nome usado quando o relacionamento de Deus com todos os homens, nações e a criação é necessário. O salmista orou: "Seja Deus gracioso para conosco, e nos abençoe". E mais uma vez o salmista muda ligeiramente as palavras, usando as palavras "entre nós" (literalmente), em vez de "sobre nós"... "e faça resplandecer entre nós o seu rosto".

É significativo que este salmo missionário tenha aplicado a todos os povos o que Deus havia dado através de Arão e dos sacerdotes. O propósito desta bênção estendida se encontra imediatamente no versículo 2: "para que se conheça na terra o teu caminho; em todas as nações (ou, entre todos os gentios), a tua salvação". Esta é a razão por que Deus foi gracioso e abençoou Israel e todos os que creram. Isto, então, está em concordância com Gênesis 12.3.

A ideia destes versículos era: Que o Senhor nos abençoe, concidadãos israelitas. Que Ele Se agrade em nos beneficiar. Que as nossas colheitas produzam cada vez mais e que os nossos rebanhos se reproduzam abundantemente. Que nossas famílias cresçam e que prosperemos espiritualmente, para que as nações possam olhar para nós e dizer que aquilo pelo qual Arão orou aconteceu de fato através da bênção de Deus. A própria generosidade de Deus demonstra que Ele nos abençoou. Portanto, que o restante de Seu propósito também venha a acontecer: que por abençoar Israel, todas as nações da terra também possam conhecer a Deus.

Este salmo tem sido chamado de Pater Noster ("Pai Nosso"), ou a Oração do Senhor do Antigo Testamento. Ela tem três estrofes: vv. 1-3 (terminando com: "Louvem-te os povos, ó Deus; louvem-te os povos, todos") vv.4-5 (terminando com o mesmo refrão) vv. 6-7.

Provavelmente este salmo era cantado durante a festa de Pentecostes. O salmo é ainda mais notável pelo fato de que seria no Pentecostes que Deus iria derramar o Seu Espírito sobre todas as nações e que uma colheita incomum iria acontecer, uma colheita maior do que a acontecida anteriormente em qualquer outra festa. Deliberadamente, o salmista se refere à colheita como um penhor, um sinal e um símbolo da colheita espiritual de cada tribo, língua e nação. De modo que possa o Senhor ser verdadeiramente gracioso (cheio de graça) conosco e nos abençoe.

Três vezes este salmo se refere à bênção divina: nos versículos um, seis e sete. A estrutura é uma réplica quase exata de Gênesis 12.2-3. Abençoa-nos, abençoa-nos, abençoa-nos ... para que todas as nações possam conhecer o Senhor.

O salmista nos conclama a provar e testar os propósitos de Deus por três razões. Essas razões se enquadram na estrutura que já observamos. A primeira razão é que Deus tem sido gracioso conosco (vv.1-3). Temos experimentado a graça de Deus no Seu jeito e maneira de lidar com Israel. Temos experimentado essa graça ao sabermos que Sua salvação foi estendida a todas as nações. Como seria se todos os povos de todas as nações viessem a conhecer pessoalmente essa mesma graça!

Uma segunda razão é que Deus governa e guia todas as nações (vv.4-5). Neste contexto, todavia, Ele não é um juiz no sentido forense, com a função de condenar ou punir. Ao contrário, é um governante real que governa legalmente com justiça, como lemos em Isaías 11.3ss. Na qualidade de Grande Pastor do Salmo 23.3, é um guia para as nações. Por esta razão, o refrão aparece de novo: Venham, todos os povos da terra. Venham ouvir. Está na hora de vocês começaram a louvar o Senhor.

E por fim temos a terceira razão: a própria bondade de Deus (vv.6-7). Devemos provar o propósito de Deus de abençoar as nações porque Ele tem sido tão bom conosco. A terra tem dado cada vez mais frutos, e nossos celeiros, depósitos de cereais e silos estão transbordando. Será que isto não foi uma evidência de que Deus respondeu à oração de Arão e dos sacerdotes, mencionada em Números 6.24-26? O poder de Deus é evidente na própria abundância da colheita.

Esse mesmo poder e essa presença de Deus que trouxeram o crescimento material estão disponíveis também para o crescimento espiritual. Caso este poderfosse mais evidente em nossas vidas e pregação, os resultados espirituais no exterior entre todas as nações e em nossa própria nação seriam testemunhados por todas as pessoas. O que se deve destacar é que o salmista não pronunciou palavras e formas vazias, mas compôs o Salmo para que Israel e nós experimentássemos uma verdadeira mudança em nossas vidas. A bênção de Deus vem para que os confins da terra recebam benefício espiritual. O que aconteceu materialmente era apenas para ser um sinal de uma bênção de dimensões muito mais amplas.

Sim, "Abençoe-nos Deus, e todos os confins da terra o temerão" (v.7). A palavra "temer" não traz a ideia de terror ou medo. Existem dois diferentes usos da palavra "temer". Êxodo 20.20 nos exorta: "Não tenha medo, ao contrário, tema o Senhor". Não tenha medo, ao contrário, confie e ponha toda a dedicação de sua alma nEle.

Por essa razão, o temor do Senhor é o princípio de tudo – da compreensão, da vida, da santidade pessoal, bem como de um relacionamento pessoal e vital com Ele. Temor é uma das palavras do Antigo Testamento que designam confiança e fé. A bondade de Deus para com Israel tinha o propósito de ser uma das maneiras de Deus trazer todas as nações do planeta Terra a temê-lo, isto é, à fé no Homem da Promessa que viria, nosso Senhor Jesus Cristo. Israel devia ser uma nação que testemunhasse, proclamasse e evangelizasse. Os gentios tinham que ser trazidos à luz.

Este propósito para Israel é visto ainda mais claramente numa passagem que não faz parte desta discussão, a saber, as passagens acerca do "Servo do Senhor" em Isaías 42 e 49. Israel é aquele servo do Senhor, ainda que o Messias seja o representante final por excelência de todo o grupo. Como tal, Israel devia ser uma "luz para as nações", tal como Abraão fora ordenado a ser, o escritor de Êxodo havia exortado e o salmista havia cantado.

O salmista ansiava e desejava profundamente que Deus, o Rei de Israel, fosse reconhecido como Senhor e Salvador de todas as famílias da terra. Nosso desejo e anseio deveriam ser menores? Será que Deus nos chama a algo menos do que também provar, juntamente com Israel, Seu propósito nesta passagem do Salmo 67? O desafio de Deus a Israel também é nosso: devemos ter um papel mediador na proclamação de Seu nome entre as nações. Esse ainda é o propósito de Deus. Ele está se cumprindo em sua vida?

Uma Multidão de Testemunhas

Espero que a chama do evangelho, encapsulada em Gênesis 12.2-3, e o chamado para sermos uma nação santa e um sacerdócio real despertem em nós o desejo de proclamar o evangelho nos dias que ainda temos pela frente. Que anunciemos não apenas ao nosso país, mas a cada nação sobre a face da terra, que Jesus é o Senhor para a glória de Deus Pai. Creio que nossas faculdades teológicas e seminários farão um excelente trabalho de preparar homens para pregarem como nunca antes nos púlpitos deste país, mas também creio, e oro nesse sentido, para que de nossas faculdades teológicas, seminários e de cada segmento da sociedade surja uma imensa multidão de homens e mulheres que literalmente circundem o globo pelo nome que está acima de todo nome, o nome de nosso grande Deus.

Que Deus abençoe vocês que já atenderam a Seu chamado. Apenas lamento que não haja ainda mais pessoas indo. Que o Senhor nos repreenda e nos sonde para que descubramos se nós mesmos não devamos nos juntar a este grande grupo. Oro para que apoiemos aqueles que estão indo a fim de que possam apresentar relatórios com tal plenitude do poder e bênção do Espírito de Deus para que outra multidão seja acrescentada à primeira. E oro para que os recursos materiais necessários surjam enquanto Deus fala a cada um de nós; oro para que sejamos generosos com o Senhor, o qual tem sido muito generoso conosco. Assim seja. Amém.

Perguntas Para Estudo

1 . Deus deu um mandato missionário ao povo de Israel no Antigo Testamento da maneira como o fez com a Igreja no Novo Testamento? Explique sua resposta com base em textos bíblicos. 2. Qual a continuidade existente entre a missão de Deus no Antigo Testamento e a mesma missão no Novo?

Walter C. Kaiser Jr. é professor de Línguas Semíticas e de Antigo Testamento bem

como deão e vice-presidente de educação da Escola Teológica Evangélica da Trindade, em Deerfield, Illinois, EUA. Anteriormente ensinou na Faculdade Wheaton e atuou como pastor. Adaptado de uma mensagem apresentada em 14 de maio de 1981 aos alunos da Escola Teológica Evangélica da Trindade, Deerfield, Illinois, EUA. Usado com permissão de Walter C. Kaiser Jr.$conteudo$, 3);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 5) then
    update aulas set titulo = $t$Lição 1 · Leitura — Ellisen: A pergunta de todos$t$, conteudo = $conteudo$A pergunta de Todos: O que Deus

está tentando fazer?

Stanley A.Ellisen

O Reino Eterno de Deus

A bíblia apresenta a Deus como um rei eterno: "O Senhor é rei eterno" (Sal.10:16).

Também declara que Ele é soberano sobre todas as coisas (Sal.103:19). Por ser infinito, está em todo lugar. De modo que, em todo momento e lugar, na vastidão de

Seu universo, Deus sempre tem pleno controle. Nunca abriu mão desta prerrogativa suprema de sua divindade. Proceder assim seria fazer-Se menos do que Deus. Se desejamos ter uma idéia correta de Seu reino, é essencial reconhecer Sua ilimitada soberania. A obra da criação, com todos os riscos aparentemente envolvidos, foi a obra da Sua soberania.

A primeira Rebelião

Na administração de Seu reino, Deus governa através do princípio de autoridade delegada. Ele organizou os anjos como uma hierarquia, atribuindo níveis de responsabilidade e esferas de serviço. Para poder atuar como Seu mais destacado auxiliar na direção deste reino, Deus concedeu a um determinado arcanjo beleza, sabedoria e poder marcantes (Ez. 28:12-17; Jud.9). Deu-lhe o nome de Lúcifer e um trono a partir do qual governaria (Is.14:12-14). Este anjo governava como o primeiro de Deus por excelência.

Não se sabe quanto tempo durou este relacionamento este relacionamento harmonioso naquele passado longínquo. Possuindo liberdade de escolha, o teste crucial de qualquer criatura era a submissão à vontade de Deus. Esse teste crucial aconteceu para Lúcifer quando passou a admirar a si mesmo e as características esplendorosas que havia recebido de Deus. Inebriado por sua própria grandeza, proclamou independencia e imaginou ser "semelhante ao Altíssimo" (Is. 14:14). Naquele momento de decisão lançou-se para longe do eixo estabilizador da vontade de Deus e iniciou a queda alucinante de um ser ímpio. Sua decisão foi final e dela nunca se arrependeu. Lúcifer, todavia, não fez esta escolha sozinho. Evidentemente foi seguido por um terço dos anjos do céu (Apoc. 12:4-7), o que também sugere o grande fascínio de sua liderança. Com esta multidão de rebeldes ele estabeleceu um reino todo seu, o falso reino de trevas. Seu nome foi mudado para Satanás (adversário), fazendo justiça ao seu comportamento. Se Deus é soberano, porque não destruiu imediatamente este arqui-rebelde? Porque não realizou uma execução em massa de toda a horda de anjos desobedientes? Ou, pelo menos, porque não os trancafiou para sempre no abismo do inferno? A resposta é que Deus tem tal plano, mas no momento está usando estes rebeldes para alcançar um outro objetivo. Na realização de Seu programa, Deus não ficou limitado a um plano sem alternativas, mas foi capaz de Se adaptar às circunstâncias. Sua soberania é tão grande que é capaz de fazer com que a ira dos homens se torne em louvor a Ele e com que todos os Seus inimigos O sirvam (Sal. 76:10). Para Seus Inimigos a ironia devastadora da soberania está em que no final, e apesar de si mesmos, eles terminam servindo-O. Quanto aos anjos caídos, a uns aprisionou até o juízo, a outros concedeu uma liberdade limitada até que Seu objetivo maior seja alcançado. O fato crucial que se deve observar é que Deus de fato permitiu a formação de um reino de trevas. Este reino foi formado por forças voluntárias sob a liderança de Satanás, e não por um ato criador de Deus. Tornou-se assim um pólo contrário ao reino divino de luz e uma opção fascinante para todas as criaturas morais no exercício de sua liberdade moral. É um reino falso que existe simultaneamente com o reino verdadeiro de Justiça.Com bastante frequência parece ter o domínio, não apenas coagindo homens e mulheres, mas inclusive conquistando-os. Isto em parte acontece por causa de seu modus operandi. E ao contrário de muitas idéias infantis, o demônio não é um monstro vermelho com um tridente na mão, mas frequentemente um benfeitor. Seu propósito de vida é adulterar as obras de Deus. Isto é o que mais ambiciona desde que passou a ter o seu próprio negócio. O primeiro desejo que foi registrado termina com as palavras: "serei semelhante ao altíssimo" (Is.14:14). Este esforço falsificador é o seu mais eficiente empreendimento, pois quando mais fielmente puder imitar a Deus, menos provável será que os homens se inclinem a buscar a Deus ou a Sua vontade.

O Início do Reino Terrestre de Deus

Depois da queda de Satanás. Deus iniciou uma outra criação: o homem. De modo semelhante, concedeu a este ser a liberdade de escolha, por mais perigoso que este segundo empreendimento pudesse parecer.A liberdade de escolha era essencial à personalidade humana para que o homem e a mulher fossem feitos à imagem de Deus. O grande desígnio de Deus é reproduzir-Se a Si mesmo em personalidades humanas, especialmente nelas reproduzir Seus traços de amor e santidade. E estas características divinas só podem crescer no ambiente de liberdade moral. Comunhão implica escolha moral.

Com esta liberdade Deus procurou colocar o homem e a mulher num relacionamento íntegro com Sua soberania. Procurou Se relacionar com eles com amor, não pela coação. A força de união do amor é infinitamente mais forte do que a de um músculo. Com isto em mente, tornou Adão e Eva participantes de Seu Governo. Como teste inicial foram proibidos de comer da "árvore do conhecimento do bem e do mal" (Gên. 2:17). Foi-lhes dada oportunidade de escolha, clara e simples, entre submissão e desobediência. A árvore não foi posta no jardim para importunação ou como armadilha, mas como um teste inevitável. Deu ao casal a opção de escolher se seriam leais a Deus ou se submeteriam às alternativas enganadoras apresentadas pela serpente.Caso houvessem rejeitado esta idéia maligna em favor de uma série dedicação a Deus, poderiam ter comido da "árvore da vida" e ser eternamente confirmados na justiça (Gên. 3:24; Apoc. 22:2). Mas cada um deles desobedeceu ao mandamento claro de Deus, e a queda do homem aconteceu. Nesta ação deliberada proclamaram sua independência da vontade de Deus e sua filiação ao reino das trevas de Satanás. A causa deste desastre não foi a árvore, nem a serpente, nem o demônio por detrás da serpente (Apoc. 12:9). Estes somente criaram oportunidade para que duas pessoas expressassem liberdade de escolha em relação à vontade de Deus. A causa do desastre estava na decisão dos dois Neste Teste de obediência falharam e caíram, junto com o exército de anjos que já haviam ca íd o . A julgar pelas aparências, esta segunda queda da criação de Deus pareceu acabar com as grandes esperanças que o criador tinha de ampliar o Seu reino aos agentes morais. O homem recebera responsabilidades cósmicas a fim de ter domínio sobre a terra. Mas não se podia confiar nele nem que fosse por uma única fruta. Será que a dádiva divina da livre escolha era por demais arriscada? Será que a outorga desta liberdade não conduziria à eliminação suicida de toda a raça? Certamente pareceu ser contraproducente ao propósito de Deus, pois o pecado teve o aspecto de se tornar vitorioso.

Os dois problemas em resumo

O dilema a esta altura pode ser resumido como sendo dois problemas que Deus passou a ter em Sua atividade criadora. Um foi o fato de que Seu auxiliar de confiança, Lúcifer, desertara e dera início a um reino adulterado, roubando também a submissão de um grande contingente de anjos. O segundo foi que o homem, feito à imagem de Deus, também desertara e caíra num estado de pecado e de desintegração pessoal. Por mais razões o reino de Deus estava dividido e parcialmente usurpado.

A pergunta frequentemente feita é por que Deus iria Se preocupar com uma operação de resgate. Por que não destruir tudo e começar de novo? É claro que isto não estava dentro de Seu plano soberano e também que isto não seria a resposta certa para o profundo desafio que a dupla rebelião apresentava. Deus não apenas reagiu ao insidioso desafio que a dupla rebelião apresentava. Deus não apenas reagiu ao insidioso desafio do pecado, como também, por Sua graça, iniciou uma operação que iria maravilhosamente redimir os pecadores. Neste plano Ele se defrontou com dois problemas: 1) como reivindicar Seu reino, que havia sido usurpado, e 2) como providenciar redenção à humanidade. A solução que Deus procurava não podia lidar com os dois problemas separadamente. Ele, então, idealizou um plano pelo qual a vitória sobre o falso reino proporcionaria a salvação da humanidade. Não poderia ser alcançada com uma simples demonstração dos músculos divinos; a resposta não seria o estalar do chicote. Um julgamento cataclísmico e abrangente seria adiado. Seria necessário ação, junto com a profundeza e o poder de Seu maior atributo: o amor.

O Reino de Deus e os programas Redentivos

Quando Adão e Eva pecaram pela primeira vez, Deus iniciou Seu julgamento pela serpente (Gên. 3:14-15). Neste julgamento também apresentou o proto-evangelho, anunciando Seu propósito redentivo para os homens. À serpente disse: "Porei inimizade entre ti e a mulher, entre a tua descendência e o seu descendente. Este te ferirá a cabeça, e tu lhe ferirás o calcanhar." Esta mensagem foi obviamente dirigida tanto ao homem quanto a Satanás, talvez mais a este. Nela Deus profetizou que, devido à inimizade recíproca, aconteceriam duas contusões ou esmagamentos. A cabeça da serpente seria esmagada pela semente da mulher, e o calcanhar da semente da mulher seria esmagado pela serpente. Mais tarde se descobre que os dois personagens deste conflito são Cristo, que é a semente nascida de uma mulher (Gál. 4:4), e Satanás, chamado de "a antiga serpente" (Apoc. 20:2).

Ao analisarmos estes dois esmagamentos, temos uma descrição curta e vivida do programa de Deus com relação a Satanás e ao homem. A primeira afirmação, "Ele te ferirá a cabeça", era uma profecia de que Cristo destruiria o diabo. Cristo mesmo falou de prender Satanás, o homem "valente" deste sistema mundial, e de expulsá-lo (Mat. 12:29; João 12:31). A morte de Cristo na cruz estabeleceu a base para a destruição final de Satanás, pois "quem com ferro fere, com ferro será ferido". E com este julgamento final, o falso reino que criou também será destruído. Isto, é, claro, ainda não aconteceu, mas terá lugar depois do reino milenar de Cristo. Pode-se pensar em todo este processo, pelo qual Deus reivindica Sua autoridade em todas as esferas e interrompe para sempre toda rebelião, como o programa divino do reino

O segundo esmagamento anunciado em Gênesis 3:15 é o esmagamento, pela serpente, do calcanhar da semente da mulher. Este ataque diabólico se cumpriu na cruz, tendo Satanás sido a força impulsionadora da crucificação de Cristo. O esmagamento do calcanhar sugere a natureza temporária da morte de Cristo. O esmagamento da cabeça da serpente. A morte de Cristo na cruz tornou-se, então, a base para o programa redentivo de Deus, programa através do qual proporcionou salvação aos homens.

É assim que, neste proto-evangelho apresentado no Éden, Deus introduziu em forma de esboço o duplo programa que Ele tem para o Seu reino e para a redenção do homem. No final das contas, Deus iria reivindicar todo o Seu reino ao destruir Satanás e seu reino, e iria redimir aqueles que cressem nesse Seu programa, através da morte de Cristo.

O Duplo programa de Deus é Revelado

As demais partes do Antigo Testamento apresentam o desenvolvimento progressivo deste duplo propósito de Deus na terra. O Senhor escolheu dois homens de fé, através dos quais deu início a estes programas e os colocou em movimento. O primeiro foi Abraão, o qual viveu por volta de 2000 a.C. Com ele Deus fez uma aliança, prometendo, entre outras coisas, uma semente que seria bênção a todas as nações. Paulo identificou esta semente como sendo Cristo, e a bênção que viria através de Abraão como sendo a redenção ou justificação (Gál. 3:6-16). A semente de Abraão traria redenção aos homens, cumprindo o programa redentivo. Para cumprir o propósito de Seu reino, Deus escolheu a Davi a partir da mesma linhagem, por volta de 1000 a.C., e fez uma aliança a respeito de um reino e de uma semente real (2 Sam. 7:12-16). Algum dia esta semente de Davi iria governar sobre toda a casa de Israel para sempre. Foi mais tarde revelado que este Ungido, além de governar sobre Israel, estenderia Seu governo sobre todo o mundo (Am. 9:12; Zac. 14:9). Através da semente de Davi, Deus completaria o programa de Seu reino ao destruir os rebeldes e governar o mundo com justiça.

Dois filhos típicos

É interessante também observar que cada um destes dois homens recebera um filho que tipificava a semente que lhes fora prometida. O filho de Abraão, Isaque, tipificava Cristo em Sua tarefa redentiva, sendo oferecido no Monte Moriá como um sacrifício vivo. O filho de Davi, Salomão, tipificava Cristo em Sua realeza, sendo um rei de glória e esplendor. Estes dois filhos tipificaram de modo marcante a semente de Abraão e de Davi, a qual foi aguardada com enorme expectativa durante todo o período restante do Antigo Testamento. À luz disto, não é de se maravilhar que o Espírito de Deus principie o Novo Testamento introduzindo Seu principal personagem como"filho de Davi,filho de Abraão"(Mat. 1:1).

Dois animais típicos

O Antigo Testamento também apresenta as tarefas redentiva e real de Cristo através de dois animais simbólicos. O cordeiro sacrificial tipificava Cristo em sua obra redentiva como o "cordeiro de Deus que tira o pecado do mundo" (João 1:29). Apresentava-O como o servo do Senhor que foi levado "como cordeiro... ao matadouro" (Is. 53:7).

O outro animal que tipifica Cristo no Antigo Testamento é o leão (Gên. 49:9-10). João, em Apocalipse 5:5, se refere a esta metáfora do Antigo Testamento quando descreve a Cristo como o "Leão da tribo de Judá". Como rei dos animais, o leão representa a autoridade real. O que se destaca aqui é que da tribo de Judá sairia um Governante que iria governar Israel e o mundo.

A relação entre os dois programas

Embora estas duas funções de Cristo estejam inextricavelmente ligadas por toda a Bíblia, são distintas em seus propósitos. Basicamente o propósito real diz respeito a Deus, tendo a ver com a reivindicação que faz do que havia sido perdido de Seu reino. Por seu lado, o propósito redentivo tem a ver basicamente com o homem, proporcionando-lhe a base para sua salvação. Embora o propósito real seja mais amplo, abrangendo todo o aspecto espiritual, não poderia ser alcançado sem o programa redentivo para o homem. Observe como João relaciona os dois em sua visão profética de Apocalipse 5. Depois de ter a visão de Cristo como o Leão e o Cordeiro, ele ouve a multidão angelical proclamar em alta voz: "Digno é o Cordeiro, que foi morto, de receber o poder, e riqueza, e sabedoria, e força, e honra, e glória, e louvor" (Apoc. 5:12). Ele terá mostrado não apenas o direito, mas também o mérito que tem de governar como o Leão de Deus, pois foi morto como o Cordeiro de Deus. Antes de começar a destruir com ira o reino das trevas, teve de passar pelo fogo do julgamento para poder salvar pecadores, entregando Sua vida como um cordeiro. Estes dois papéis estão entrelaçados, mas caminham para duas direções diferentes e demonstram duas qualidades da natureza de Deus. Quanto a este reino reivindicado, Cristo finalmente o apresentará de novo ao Pai (1 Cor. 15:24). Essa apresentação constituirá o cumprimento da dupla comissão que recebeu do Pai, em Seu papel como a semente da mulher. E, de suprema importância, há o fato de que o processo pelo qual terá reivindicado aquele reino será o Seu amor redentivo, e não o Seu poder coercivo. Esta graça redentiva é a força de Seu duplo programa, e também constituirá a base de Sua comunhão eterna com os homens. Aquela comunhão divino-humana não será baseada no temor ou na força, mas no amor.

Perguntas Para Estudo

1 . Descreva em suas próprias palavras o duplo problema de Deus.

2. Examine os comentários de Ellisen sobre os programas Redentivo e Real. Ele está querendo dizer que os dois programas são distintos? Você pode demonstrar uma unidade completa e abrangente no propósito de Deus de lidar com a criação?

Stanley A. Ellisen é professor de Literatura Bíblica e responsável pela Divisão de

Estudos Bíblicos no Seminário Batista Conservador do Oeste, localizado em Portland, Oregon, E.U.A. Autor de cinco livros e inúmeros artigos, Ellisen também atuou como pastor em diversas igrejas na costa oeste dos Estados Unidos. Republicado, com permissão de Biography of a Great Planet ("Biografia de um Grande Planeta"), capítulo 2, Tyndale House Publishers, Inc., Wheaton, Illinois.$conteudo$
     where curso_id = v_curso and ordem = 5;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 1 · Leitura — Ellisen: A pergunta de todos$t$, $conteudo$A pergunta de Todos: O que Deus

está tentando fazer?

Stanley A.Ellisen

O Reino Eterno de Deus

A bíblia apresenta a Deus como um rei eterno: "O Senhor é rei eterno" (Sal.10:16).

Também declara que Ele é soberano sobre todas as coisas (Sal.103:19). Por ser infinito, está em todo lugar. De modo que, em todo momento e lugar, na vastidão de

Seu universo, Deus sempre tem pleno controle. Nunca abriu mão desta prerrogativa suprema de sua divindade. Proceder assim seria fazer-Se menos do que Deus. Se desejamos ter uma idéia correta de Seu reino, é essencial reconhecer Sua ilimitada soberania. A obra da criação, com todos os riscos aparentemente envolvidos, foi a obra da Sua soberania.

A primeira Rebelião

Na administração de Seu reino, Deus governa através do princípio de autoridade delegada. Ele organizou os anjos como uma hierarquia, atribuindo níveis de responsabilidade e esferas de serviço. Para poder atuar como Seu mais destacado auxiliar na direção deste reino, Deus concedeu a um determinado arcanjo beleza, sabedoria e poder marcantes (Ez. 28:12-17; Jud.9). Deu-lhe o nome de Lúcifer e um trono a partir do qual governaria (Is.14:12-14). Este anjo governava como o primeiro de Deus por excelência.

Não se sabe quanto tempo durou este relacionamento este relacionamento harmonioso naquele passado longínquo. Possuindo liberdade de escolha, o teste crucial de qualquer criatura era a submissão à vontade de Deus. Esse teste crucial aconteceu para Lúcifer quando passou a admirar a si mesmo e as características esplendorosas que havia recebido de Deus. Inebriado por sua própria grandeza, proclamou independencia e imaginou ser "semelhante ao Altíssimo" (Is. 14:14). Naquele momento de decisão lançou-se para longe do eixo estabilizador da vontade de Deus e iniciou a queda alucinante de um ser ímpio. Sua decisão foi final e dela nunca se arrependeu. Lúcifer, todavia, não fez esta escolha sozinho. Evidentemente foi seguido por um terço dos anjos do céu (Apoc. 12:4-7), o que também sugere o grande fascínio de sua liderança. Com esta multidão de rebeldes ele estabeleceu um reino todo seu, o falso reino de trevas. Seu nome foi mudado para Satanás (adversário), fazendo justiça ao seu comportamento. Se Deus é soberano, porque não destruiu imediatamente este arqui-rebelde? Porque não realizou uma execução em massa de toda a horda de anjos desobedientes? Ou, pelo menos, porque não os trancafiou para sempre no abismo do inferno? A resposta é que Deus tem tal plano, mas no momento está usando estes rebeldes para alcançar um outro objetivo. Na realização de Seu programa, Deus não ficou limitado a um plano sem alternativas, mas foi capaz de Se adaptar às circunstâncias. Sua soberania é tão grande que é capaz de fazer com que a ira dos homens se torne em louvor a Ele e com que todos os Seus inimigos O sirvam (Sal. 76:10). Para Seus Inimigos a ironia devastadora da soberania está em que no final, e apesar de si mesmos, eles terminam servindo-O. Quanto aos anjos caídos, a uns aprisionou até o juízo, a outros concedeu uma liberdade limitada até que Seu objetivo maior seja alcançado. O fato crucial que se deve observar é que Deus de fato permitiu a formação de um reino de trevas. Este reino foi formado por forças voluntárias sob a liderança de Satanás, e não por um ato criador de Deus. Tornou-se assim um pólo contrário ao reino divino de luz e uma opção fascinante para todas as criaturas morais no exercício de sua liberdade moral. É um reino falso que existe simultaneamente com o reino verdadeiro de Justiça.Com bastante frequência parece ter o domínio, não apenas coagindo homens e mulheres, mas inclusive conquistando-os. Isto em parte acontece por causa de seu modus operandi. E ao contrário de muitas idéias infantis, o demônio não é um monstro vermelho com um tridente na mão, mas frequentemente um benfeitor. Seu propósito de vida é adulterar as obras de Deus. Isto é o que mais ambiciona desde que passou a ter o seu próprio negócio. O primeiro desejo que foi registrado termina com as palavras: "serei semelhante ao altíssimo" (Is.14:14). Este esforço falsificador é o seu mais eficiente empreendimento, pois quando mais fielmente puder imitar a Deus, menos provável será que os homens se inclinem a buscar a Deus ou a Sua vontade.

O Início do Reino Terrestre de Deus

Depois da queda de Satanás. Deus iniciou uma outra criação: o homem. De modo semelhante, concedeu a este ser a liberdade de escolha, por mais perigoso que este segundo empreendimento pudesse parecer.A liberdade de escolha era essencial à personalidade humana para que o homem e a mulher fossem feitos à imagem de Deus. O grande desígnio de Deus é reproduzir-Se a Si mesmo em personalidades humanas, especialmente nelas reproduzir Seus traços de amor e santidade. E estas características divinas só podem crescer no ambiente de liberdade moral. Comunhão implica escolha moral.

Com esta liberdade Deus procurou colocar o homem e a mulher num relacionamento íntegro com Sua soberania. Procurou Se relacionar com eles com amor, não pela coação. A força de união do amor é infinitamente mais forte do que a de um músculo. Com isto em mente, tornou Adão e Eva participantes de Seu Governo. Como teste inicial foram proibidos de comer da "árvore do conhecimento do bem e do mal" (Gên. 2:17). Foi-lhes dada oportunidade de escolha, clara e simples, entre submissão e desobediência. A árvore não foi posta no jardim para importunação ou como armadilha, mas como um teste inevitável. Deu ao casal a opção de escolher se seriam leais a Deus ou se submeteriam às alternativas enganadoras apresentadas pela serpente.Caso houvessem rejeitado esta idéia maligna em favor de uma série dedicação a Deus, poderiam ter comido da "árvore da vida" e ser eternamente confirmados na justiça (Gên. 3:24; Apoc. 22:2). Mas cada um deles desobedeceu ao mandamento claro de Deus, e a queda do homem aconteceu. Nesta ação deliberada proclamaram sua independência da vontade de Deus e sua filiação ao reino das trevas de Satanás. A causa deste desastre não foi a árvore, nem a serpente, nem o demônio por detrás da serpente (Apoc. 12:9). Estes somente criaram oportunidade para que duas pessoas expressassem liberdade de escolha em relação à vontade de Deus. A causa do desastre estava na decisão dos dois Neste Teste de obediência falharam e caíram, junto com o exército de anjos que já haviam ca íd o . A julgar pelas aparências, esta segunda queda da criação de Deus pareceu acabar com as grandes esperanças que o criador tinha de ampliar o Seu reino aos agentes morais. O homem recebera responsabilidades cósmicas a fim de ter domínio sobre a terra. Mas não se podia confiar nele nem que fosse por uma única fruta. Será que a dádiva divina da livre escolha era por demais arriscada? Será que a outorga desta liberdade não conduziria à eliminação suicida de toda a raça? Certamente pareceu ser contraproducente ao propósito de Deus, pois o pecado teve o aspecto de se tornar vitorioso.

Os dois problemas em resumo

O dilema a esta altura pode ser resumido como sendo dois problemas que Deus passou a ter em Sua atividade criadora. Um foi o fato de que Seu auxiliar de confiança, Lúcifer, desertara e dera início a um reino adulterado, roubando também a submissão de um grande contingente de anjos. O segundo foi que o homem, feito à imagem de Deus, também desertara e caíra num estado de pecado e de desintegração pessoal. Por mais razões o reino de Deus estava dividido e parcialmente usurpado.

A pergunta frequentemente feita é por que Deus iria Se preocupar com uma operação de resgate. Por que não destruir tudo e começar de novo? É claro que isto não estava dentro de Seu plano soberano e também que isto não seria a resposta certa para o profundo desafio que a dupla rebelião apresentava. Deus não apenas reagiu ao insidioso desafio que a dupla rebelião apresentava. Deus não apenas reagiu ao insidioso desafio do pecado, como também, por Sua graça, iniciou uma operação que iria maravilhosamente redimir os pecadores. Neste plano Ele se defrontou com dois problemas: 1) como reivindicar Seu reino, que havia sido usurpado, e 2) como providenciar redenção à humanidade. A solução que Deus procurava não podia lidar com os dois problemas separadamente. Ele, então, idealizou um plano pelo qual a vitória sobre o falso reino proporcionaria a salvação da humanidade. Não poderia ser alcançada com uma simples demonstração dos músculos divinos; a resposta não seria o estalar do chicote. Um julgamento cataclísmico e abrangente seria adiado. Seria necessário ação, junto com a profundeza e o poder de Seu maior atributo: o amor.

O Reino de Deus e os programas Redentivos

Quando Adão e Eva pecaram pela primeira vez, Deus iniciou Seu julgamento pela serpente (Gên. 3:14-15). Neste julgamento também apresentou o proto-evangelho, anunciando Seu propósito redentivo para os homens. À serpente disse: "Porei inimizade entre ti e a mulher, entre a tua descendência e o seu descendente. Este te ferirá a cabeça, e tu lhe ferirás o calcanhar." Esta mensagem foi obviamente dirigida tanto ao homem quanto a Satanás, talvez mais a este. Nela Deus profetizou que, devido à inimizade recíproca, aconteceriam duas contusões ou esmagamentos. A cabeça da serpente seria esmagada pela semente da mulher, e o calcanhar da semente da mulher seria esmagado pela serpente. Mais tarde se descobre que os dois personagens deste conflito são Cristo, que é a semente nascida de uma mulher (Gál. 4:4), e Satanás, chamado de "a antiga serpente" (Apoc. 20:2).

Ao analisarmos estes dois esmagamentos, temos uma descrição curta e vivida do programa de Deus com relação a Satanás e ao homem. A primeira afirmação, "Ele te ferirá a cabeça", era uma profecia de que Cristo destruiria o diabo. Cristo mesmo falou de prender Satanás, o homem "valente" deste sistema mundial, e de expulsá-lo (Mat. 12:29; João 12:31). A morte de Cristo na cruz estabeleceu a base para a destruição final de Satanás, pois "quem com ferro fere, com ferro será ferido". E com este julgamento final, o falso reino que criou também será destruído. Isto, é, claro, ainda não aconteceu, mas terá lugar depois do reino milenar de Cristo. Pode-se pensar em todo este processo, pelo qual Deus reivindica Sua autoridade em todas as esferas e interrompe para sempre toda rebelião, como o programa divino do reino

O segundo esmagamento anunciado em Gênesis 3:15 é o esmagamento, pela serpente, do calcanhar da semente da mulher. Este ataque diabólico se cumpriu na cruz, tendo Satanás sido a força impulsionadora da crucificação de Cristo. O esmagamento do calcanhar sugere a natureza temporária da morte de Cristo. O esmagamento da cabeça da serpente. A morte de Cristo na cruz tornou-se, então, a base para o programa redentivo de Deus, programa através do qual proporcionou salvação aos homens.

É assim que, neste proto-evangelho apresentado no Éden, Deus introduziu em forma de esboço o duplo programa que Ele tem para o Seu reino e para a redenção do homem. No final das contas, Deus iria reivindicar todo o Seu reino ao destruir Satanás e seu reino, e iria redimir aqueles que cressem nesse Seu programa, através da morte de Cristo.

O Duplo programa de Deus é Revelado

As demais partes do Antigo Testamento apresentam o desenvolvimento progressivo deste duplo propósito de Deus na terra. O Senhor escolheu dois homens de fé, através dos quais deu início a estes programas e os colocou em movimento. O primeiro foi Abraão, o qual viveu por volta de 2000 a.C. Com ele Deus fez uma aliança, prometendo, entre outras coisas, uma semente que seria bênção a todas as nações. Paulo identificou esta semente como sendo Cristo, e a bênção que viria através de Abraão como sendo a redenção ou justificação (Gál. 3:6-16). A semente de Abraão traria redenção aos homens, cumprindo o programa redentivo. Para cumprir o propósito de Seu reino, Deus escolheu a Davi a partir da mesma linhagem, por volta de 1000 a.C., e fez uma aliança a respeito de um reino e de uma semente real (2 Sam. 7:12-16). Algum dia esta semente de Davi iria governar sobre toda a casa de Israel para sempre. Foi mais tarde revelado que este Ungido, além de governar sobre Israel, estenderia Seu governo sobre todo o mundo (Am. 9:12; Zac. 14:9). Através da semente de Davi, Deus completaria o programa de Seu reino ao destruir os rebeldes e governar o mundo com justiça.

Dois filhos típicos

É interessante também observar que cada um destes dois homens recebera um filho que tipificava a semente que lhes fora prometida. O filho de Abraão, Isaque, tipificava Cristo em Sua tarefa redentiva, sendo oferecido no Monte Moriá como um sacrifício vivo. O filho de Davi, Salomão, tipificava Cristo em Sua realeza, sendo um rei de glória e esplendor. Estes dois filhos tipificaram de modo marcante a semente de Abraão e de Davi, a qual foi aguardada com enorme expectativa durante todo o período restante do Antigo Testamento. À luz disto, não é de se maravilhar que o Espírito de Deus principie o Novo Testamento introduzindo Seu principal personagem como"filho de Davi,filho de Abraão"(Mat. 1:1).

Dois animais típicos

O Antigo Testamento também apresenta as tarefas redentiva e real de Cristo através de dois animais simbólicos. O cordeiro sacrificial tipificava Cristo em sua obra redentiva como o "cordeiro de Deus que tira o pecado do mundo" (João 1:29). Apresentava-O como o servo do Senhor que foi levado "como cordeiro... ao matadouro" (Is. 53:7).

O outro animal que tipifica Cristo no Antigo Testamento é o leão (Gên. 49:9-10). João, em Apocalipse 5:5, se refere a esta metáfora do Antigo Testamento quando descreve a Cristo como o "Leão da tribo de Judá". Como rei dos animais, o leão representa a autoridade real. O que se destaca aqui é que da tribo de Judá sairia um Governante que iria governar Israel e o mundo.

A relação entre os dois programas

Embora estas duas funções de Cristo estejam inextricavelmente ligadas por toda a Bíblia, são distintas em seus propósitos. Basicamente o propósito real diz respeito a Deus, tendo a ver com a reivindicação que faz do que havia sido perdido de Seu reino. Por seu lado, o propósito redentivo tem a ver basicamente com o homem, proporcionando-lhe a base para sua salvação. Embora o propósito real seja mais amplo, abrangendo todo o aspecto espiritual, não poderia ser alcançado sem o programa redentivo para o homem. Observe como João relaciona os dois em sua visão profética de Apocalipse 5. Depois de ter a visão de Cristo como o Leão e o Cordeiro, ele ouve a multidão angelical proclamar em alta voz: "Digno é o Cordeiro, que foi morto, de receber o poder, e riqueza, e sabedoria, e força, e honra, e glória, e louvor" (Apoc. 5:12). Ele terá mostrado não apenas o direito, mas também o mérito que tem de governar como o Leão de Deus, pois foi morto como o Cordeiro de Deus. Antes de começar a destruir com ira o reino das trevas, teve de passar pelo fogo do julgamento para poder salvar pecadores, entregando Sua vida como um cordeiro. Estes dois papéis estão entrelaçados, mas caminham para duas direções diferentes e demonstram duas qualidades da natureza de Deus. Quanto a este reino reivindicado, Cristo finalmente o apresentará de novo ao Pai (1 Cor. 15:24). Essa apresentação constituirá o cumprimento da dupla comissão que recebeu do Pai, em Seu papel como a semente da mulher. E, de suprema importância, há o fato de que o processo pelo qual terá reivindicado aquele reino será o Seu amor redentivo, e não o Seu poder coercivo. Esta graça redentiva é a força de Seu duplo programa, e também constituirá a base de Sua comunhão eterna com os homens. Aquela comunhão divino-humana não será baseada no temor ou na força, mas no amor.

Perguntas Para Estudo

1 . Descreva em suas próprias palavras o duplo problema de Deus.

2. Examine os comentários de Ellisen sobre os programas Redentivo e Real. Ele está querendo dizer que os dois programas são distintos? Você pode demonstrar uma unidade completa e abrangente no propósito de Deus de lidar com a criação?

Stanley A. Ellisen é professor de Literatura Bíblica e responsável pela Divisão de

Estudos Bíblicos no Seminário Batista Conservador do Oeste, localizado em Portland, Oregon, E.U.A. Autor de cinco livros e inúmeros artigos, Ellisen também atuou como pastor em diversas igrejas na costa oeste dos Estados Unidos. Republicado, com permissão de Biography of a Great Planet ("Biografia de um Grande Planeta"), capítulo 2, Tyndale House Publishers, Inc., Wheaton, Illinois.$conteudo$, 5);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 10) then
    update aulas set titulo = $t$Lição 2 · Leitura — Adeney: Deus é daltônico?$t$, conteudo = $conteudo$Deus é daltônico?

O evangelho, a globalização e como Deus

enxerga a diversidade cultural

Miriam Adeney

Isabell Ides tinha 101 anos quando faleceu em junho de 2008. Uma Índia Makah, povo caçador de baleias, morava na última casa da última rua na ponta mais ao noroeste dos Estados Unidos. Isabell era muito conhecida na região porque ela amava e ensinava a cultura Makah e a sua língua. Centenas de pessoas aprenderam a tecer cestos por causa das mãos de Isabell. Várias gerações aprenderam palavras na sua própria língua pelos lábios dela. Jovens mães traziam seu salmão defumado para ela. Depois de mastigar um pouco, ela sabia se a madeira estava seca demais. Os arqueólogos traziam a ela suas cestas de 3.000 anos atrás que haviam acabado de escavar, e ela conseguia identificar que tipo de cestos que elas eram e como foram utilizadas. "É como perder uma biblioteca", disse um antropólogo no funeral dela.

Isabell também ensinava na Escola Bíblica na Igreja das Assembleias de Deus que havia dentro da reserva. Ela atribuiu a longa vida que ela teve à sua fé cristã.

Será que os cestos da Isabell eram importantes para Deus, igual que a sua Escola Bíblica no domingo? Quão importante era a sua herança étnica para a visão global do Reino de Deus? Essa pergunta reverbera à medida que exploramos a globalização.

Destruição criativa

Na primavera de 2001, representantes de 34 nações se uniram em Quebec para discutir um acordo de livre comércio que cobriria todo o continente americano. Haviam muitas preocupações. Como poderia haver um equilíbrio justo entre os EUA e Canadá com Honduras e Bolívia, entre alguns dos países mais pobres e mais ricos do planeta? Os

O que é etnicidade? O critério mais fundamental para etnicidade é a auto-atribuição de uma pessoa como membro de uma cultura compartilhada. Outras atribuições limitam isso, mas são secundárias. Componentes de identidade étnica podem ou não incluir o seguinte: uma terra ancestral (seja ela habitada ou não por membros do grupo na atualidade), uma língua ancestral (seja ela falada ou não pelos membros do grupo na atualidade), história compartilhada (especialmente se ela inclui sofrimento e heróis), comida, humor e comportamento apropriado entre familiares próximos. As diferenças compartilhadas podem ser triviais; a auto-classificação é importante. O que uma etnia significa é continuamente reformulado. Para um aprofundamento na discussão, leia Williams (2001).

países pequenos não seriam simplesmente engolidos? Até mesmo o Brasil, a maior economia da América Latina, estava duvidoso.

Entrando nessa discussão, o presidente de economia federal dos EUA, Alan Greenspan, soltou a frase "destruição criativa". Sim, disse ele, uma maior abertura no comércio global significa mais "destruição criativa". Negócios vão fechar. Empregos serão perdidos. "Não há dúvida", constatou Greenspan (como citado em Workers, 2001), "de que essa transição para uma economia nova e de alta tecnologia, da qual o comércio crescente é parte, tem se provado desafiadora para um grande segmento da nossa força de trabalho… O processo de adequação está contorcendo a força trabalhadora atual que foi feita redundante sem ser culpa dela". Mas tais traumas são apenas parte do preço do progresso. Como normalmente é dito, não se pode fazer um omelete sem quebrar ovos. Não se pode jardinar sem podar. Não se pode usar o computador sem apertar o botão de deletar de vez em quando. Não se pode treinar um atleta sem descamar seus maus hábitos. Forjar, afiar, limpar, frear - todos esses são termos positivos. E assim Greenspan falou sobre a "destruição criativa" inerente da globalização. Mas, ele agregou, "a história nos ensina que não é apenas tolice tentar evitar esse processo, é impossível".

Etnicidade é uma das arena de destruição. No sistema global de hoje, os valores da etnia local estão sendo esmagados. E os valores culturais são muito mais do que mercadorias. Eles são partes de heranças que não podemos colocar um preço. E ainda assim, como espécies em perigo de extinção, valores culturais têm sido ameaçados. Como deveríamos responder quando a globalização afoga a etnicidade?

Um lugar na história

Qual é a visão de Deus sobre etnicidade? Deus nos fez à sua imagem, concedendo-nos criatividade e nos colocando em um mundo de possibilidades e desafios. Quando aplicamos a nossa criatividade concedida por Deus, as culturas do mundo surgem e se desenvolvem.

No princípio, Deus afirmou que não era bom que os seres humanos estivessem sozinhos. Os seres humanos foram feitos para viverem em comunidades repletas de significado. Então Deus deu a sua bênção para as áreas culturais, como família, estado, trabalho, adoração, artes, educação e até mesmo para festivais. Ele prestou atenção às leis que preservam ecologia, concediam relacionamentos sociais em ordem, providenciou saneamento, e protegeu os direitos dos fracos, dos cegos, dos surdos, das viúvas e dos órfãos, do estrangeiro, do pobre e dos devedores.

Ele afirmou o mundo físico, de onde a cultura material é desenvolvida. Ele se deleita no próprio solo e nos rios que ele concedeu ao seu povo. Era "a terra da qual o Senhor, seu

Deus, cuida; os olhos do Senhor, Deus de vocês, estão sobre ela continuamente, desde o princípio até o fim do ano" (Dt. 11:12, NAA). Sabendo dos deleites materiais do seu povo, Deus os estabeleceu em:

● Uma terra boa, uma terra de riachos de água, de fontes e profundidades que jorram e regam os vales e as montanhas.

● Uma terra de trigo e cevada, vinhedos, figueiras e romãzeiras.

● Uma terra de azeite e mel.

● Uma terra onde se come pão sem escassez, onde não há falta de nada nela.

● Uma terra onde as pedras são de ferro, e de onde se pode cavar e minerar bronze (Dt. 8:7-9).

Na linguagem visual do Antigo Testamento, Deus deu ao seu povo azeite para fazer seus rostos brilhar, vinho para alegrar seus corações, amigos como o ferro para afiá-los, esposas como videiras frutíferas, e filhos como flechas lançadas por seus arcos. Padrões econômicos sociais e artísticos se combinam para formar a cultura. Esse é o contexto onde vivemos. É onde nós fomos feitos para viver. Sistemas globais podem nos submergir em realidade virtual - mídia, música empacotada, bolsa de valores, resultados dos esportes e notícias de última hora - onde grandes tragédias são contrapostas com propagandas de cerveja. Ainda assim, se somos absorvidos no nível global ou virtual, perdemos os ritmos reais da natureza e sociedade. Tempo de plantio e de colheita, a saúde do solo, árvores e água. Amizades, cortejo, casamento, educação de filhos, envelhecimento e morte. Criação, uso, manutenção e reparo. Esses são ritmos do viver no mundo de Deus. São expressados localmente, por meio de padrões culturais específicos. Conhecer esses padrões nos ajuda a conhecermos a nós mesmos, nossas potencialidades e nossos limites, nossos recursos e sequências que precisaremos costurar e tecer para escolhas e decisões felizes. Elas não podem ser conhecidas no nível abstrato e global. Disciplinar uma criança, por exemplo, não é virtual. Ser demitido de um emprego não é uma experiência de mídia. Ter um bebê não é um jogo. Lutar contra o câncer não é abstrato.

Quando eu vivia nas Filipinas, eu via famílias fortes. Hospitalidade acolhedora. Tempos esbanjados com as crianças. Amizades duradouras. Uma herança de liberdade econômica para as mulheres. A habilidade de viver generosamente com pouco dinheiro. Temperos que se estendem a pouca quantidade de carne que muito têm. O deleite em compartilhar. A destreza na arte de relaxar. Agilidade, corpos flexíveis. A habilidade de desfrutar estar com um número grande de pessoas continuamente. Posto que todo bom presente vem dos céus (Tg. 1:17) e já que toda sabedoria e conhecimento vem de Jesus (Col. 2:13), tais qualidades lindas da cultura filipina devem ser vistas como presentes de Deus. Nosso Criador se deleita nas cores. Ele gera cheiros, desde a cebola até a rosa. Ele forma cada floco de neve. Ele faz nascer bilhões de personalidades únicas. Será que é uma surpresa ele ter nos programado com a capacidade de criar um caleidoscópio de culturas para enriquecer o seu mundo?

Culturas contêm pecado e devem ser julgadas, como discutiremos na próxima seção. Mas o orgulho étnico não é automaticamente pecado. É como a alegria que os pais sentem na formatura do filho. A criança sobe ao palco. O seu peito martela com orgulho. E isso não é orgulho às custas do seu próximo, já que o rosto dele também se ilumina e durante a formatura. Não, o seu coração incha porque você conhece a história do seu filho. Os aborrecimentos que ele passou. E os presentes que floresceram nele como flores que se abrem diante do sol. Você mesmo chorou e riu e gastou anos da sua vida no moldar de algumas dessas histórias.

Na sua melhor expressão, a etnia é uma expansão desse orgulho familiar. Etnicidade é um sentimento de identificação com pessoas que compartilham uma cultura e uma história, com seus sofrimentos e suas vitórias, heróis e mártires. Como a membresia de uma família, a etnicidade não pode ser comprada. Ela é um direito de nascimento, recebido você querendo ou não.

Os seres humanos foram criados para viver em comunidade. No mundo de hoje, ainda sentimos essa necessidade. "Mesmo com as necessidades materiais atendidas, ainda assim a nossa motivação… resiliência emocional… e força moral… precisam vir de alguma visão de propósito público ancorado em uma imagem de realidade social cativante", segundo o antropólogo Clifford Geertz (1964, p. 70). Ser um cidadão globalizado é muito vago para fornecer essa motivação e força, diz Geertz. Cidadania globalizada faz com que a pessoa comum se sinta insignificante. Até mesmo uma cidadania nacional pode gerar apatia. Mas quando você é parte de um grupo étnico, você passa a ter celebridades que lhe dão entusiasmo, valores que lhe dão uma estrutura cognitiva, padrões de comportamento que direcionam os seus dias, e laços associativos que lhe enraízam em um contexto humano. Você tem um lugar no tempo no universo, uma base para a convicção de que você é parte da continuidade da vida fluindo do passado e pulsando em direção ao futuro. Você está dentro da história.

Quando a etnicidade se torna um ídolo

Deus ordenou a cultura. Mas os costumes que glorificam a Deus não são a única realidade que observamos ao nosso redor. Ao invés de amabilidade, criatividade harmoniosa e autoridade admirável, vemos fragmentação, alienação, luxúria, corrupção, egoísmo, injustiça e violência cultivados pela nossa cultura. E nenhuma parte permaneceu pura. A ciência tende a servir o militarismo ou o hedonismo, ignorando a moral. Aarte normalmente vira adoração separada de Deus. Meios de comunicação de massa estão cheios de prostitutos verbais. Homens de negócios fazem acordos sombrios. Políticos enchem os próprios bolsos. Trabalhadores fazem serviços de má qualidade. Maridos enganam suas esposas. Esposas manipulam seus maridos. Filhos ignoram seus pais como pessoas .

Não somos apenas criados à imagem de Deus. Também somos pecadores. Porque nós nos separamos de Deus, as culturas que criamos agora estão repletas de maldade. Somos chamados a, então, não apenas nos alegramos nos padrões de sabedoria, beleza e gentileza nas nossas culturas, mas também de confrontarmos e julgarmos os padrões de idolatria e exploração.

Às vezes a etnicidade se torna um ídolo. Como outros ídolos da sociedade moderna - dinheiro, sexo e poder, por exemplo - etnicidade não é ruim em si mesma. Entretanto, quando ela é exaltada como se fosse o bem maior, a etnicidade se torna um mal. Racismo, rixas, guerras e "pureza racial" são o resultado. Quando a etnicidade se torna um ídolo, ela precisa ser confrontada e julgada.

Implicações para a Missão

A etnicidade se opõe à tendência desumanizadora da globalização. Até mesmo em sua melhor expressão, a globalização econômica tende a tratar os valores culturais como mercadorias. A etnicidade nos lembra de guardarmos a fé com nossos avós e com nossas comunidades humanas. É um contrapeso vital. E nesse contexto atual, o que a etnicidade significa para a missão? Vamos sugerir quatro aplicações.

1. Valorizaro local

Em primeiro lugar, a missão precisa valorizar as culturas locais. Nós não fazemos isso de forma acrítica. Ao trabalharmos com e debaixo de cristãos locais, nós julgamos padrões de idolatria e exploração, como explicamos anteriormente. E ainda assim amamos a cultura local. Nós a recebemos como um presente de Deus. Ao mesmo tempo que vivemos naquele lugar, nós nos adaptamos gradualmente a essas dimensões dos valores locais que trazem pleno pertencimento.

Nós falamos a língua local. Onde quer que os cristãos vão, eles traduzem a Bíblia. Isso tem sido destacado por Lamin sanneh, um cristão com antecedente muçulmano que é professor da universidade de Yale. Os muçulmanos insistem que as pessoas precisam aprender árabe porque é a língua de Deus. Mas os cristãos dizem: "Deus fala a sua língua".

Como cristãos, apoiamos e sustentamos empreendedores e empreendedoras locais. Nós encorajamos artistas, músicos e escritores locais, ao invés de constantemente apoiar livros estrangeiros ou traduzi-los. Nós nos hospedamos em hotéis locais e casas. Aprendemos sobre as tradições vegetais locais. Nós protegemos as florestas da região. Nós aprendemos habilidades novas com jogos e competições esportivas locais. Nós nos esforçamos para estar presentes nas festas locais e funerais. Nós simpatizamos com reformadores sociais locais. Se somos missionários, disciplinamos os nossos pensamentos para não ficarmos preocupados com os padrões culturais da nossa terra natal. Heranças específicas importam. Até mesmo a épica do século XX chamada O Senhor dos Anéis (Tolkien, 1954) valoriza a cultura local. O colunista Mike Hickerson (2002) observa:

O Senhor dos Anéis sugere que a vitória de Deus na terra (ou terra-média) é incompleta até que a vitória preencha os "pequenos lugares". [...] A batalha final entre o bem e o mal não é um confronto histórico gigantesco - como a destruição da Estrela da Morte - mas, na verdade, é uma batalha pequena, seguida por uma pequena reconstrução de um pequeno local.

As Boas Novas preenchem todos os vales… Após seu retorno ao

Condado, os hobbits continuaram a sua missão até a sua conclusão apropriada. Sem seu trabalho humilde entre seu próprio povo humilde, o mal teria retido um bastião avançado na Terra-Média. O global é importante da mesma forma que o local é.

Nos programas de treinamento missionários, essa ênfase precisa ser feita. Há a tendência dos missionários de culturas dominantes forçarem a sua herança étnica como se ela fosse um padrão divino para todas as pessoas. Os missionários ocidentais fazem isso. Os missionários chineses e coreanos fazem isso no Centro e no Sudeste Asiáticos. Os latinos o fazem em comunidades indígenas.

Até mesmo dentro do mesmo país os missionários que são da população majoritária podem perder apreço pelas minorias culturais e tratá-las de forma desrespeitosa. Considere um convite enviado por e-mail que recebi esta manhã. A mensagem diz o seguinte:

Quando vier, você poderia dar uma palestra sobre a teologia da cultura?

No nosso país temos muitos grupos étnicos diferentes e os preconceitos são assustadores. É possível que haja pessoas de um grupo étnico trabalhando em um vilarejo com muitos outros grupos étnicos. Mas eles tendem a trabalhar de forma independente e inventam desculpas para não cooperar uns com os outros.

Por toda a história temos exemplos de missionários que igualam a sua herança cultural com a forma preferida de trabalho de Deus. É fácil criticá-los ao olharmos para trás. Entretanto, nós não vamos descartá-los de forma tão simples. Ao mesmo tempo que a teologia da cultura dos primeiros missionários possa ter sido acanhada, as suas práticas normalmente eram bem robustas. Eles aprendiam a língua local. Eles eram as principais fontes de cultura local para os primeiros antropólogos. Sem aviões, eles passavam por guerras, epidemias, secas e enchentes. Os seus filhos e esposas eram enterrados lá.

Em contraste, os missionários atuais adoram falar sobre contextualização, mas temos vivido isso? Jesus passou 33 anos imerso em uma única cultura local.

2. Serperegrinos

Muitas pessoas têm várias identidades étnicas. Considere esta situação: no oeste dos EUA, gerações anteriores de asiáticos foram impedidos por lei de casar-se com caucasaianos. Por isso, alguns imigrantes filipinos se casaram com nativos americanos. Agora, imagine três filhos crescidos em uma família assim. Um se identifica principalmente como filipino, o segundo como nativo americano, e o terceiro como americano. Mas os três trocam suas identidades étnicas continuamente.

Além disso, as culturas mudam continuamente. No processo, novas combinações de identidade emergem. O renomado Museu Wing Luke (museu que representa todas as culturas asiáticas nos EUA) teve sua reabertura nesta semana aqui na cidade onde moro, em Seattle, no estado de Washington. Supostamente é o único museu nos EUA que é Pan-Asiático Pacífico Americano. Mas o que é ser um Asiático Pacífico Americano? "Não é uma raça, nem um grupo étnico ou nacionalidade" segundo Jack Broom no Seattle Times. "É uma categoria identificada no censo que combinou historicamente pessoas de mais de 40 países tomando uma vasta porção do globo, indo desde o Tahiti até o Paquistão, do Japão à Indonésia, do Havaí à Índia" (2008, p. A16).

Quatorze por cento da população do meu país é Asiático Pacífico Americano. Apesar do que disse o Seattle Times, essa categoria étnica é significativa e relevante, um grupo mensurável com identidade o suficiente para sustentar um renomado museu. Em um agrupamento de identidades étnicas, ele constitui um nível. O artigo do Times prossegue dizendo que os altos números "refletem o posto avançado do noroeste no Círculo Pacífico".

Identidades múltiplas não são excepcionais. Os falantes de espanhol nos EUA cresceram 50% de 1980 para 1990. Eles agora compõem 30% da população da cidade de Nova York. A maioria também fala inglês. Na mesma década, o número de falantes de chinês cresceu 98%. Quatro quintos deles continuam preferindo falar chinês em casa, por mais que também falem inglês.

No seu nível mais essencial, a identidade étnica se baseia na auto-identificação de um membro com uma cultura compartilhada, com uma comunidade compartilhada. Em uma sociedade multiétnica, as diferenças de padrões econômicos, sociais ou perspectiva não são tão evidentes, por mais que essas pessoas venham de diferentes países. Eles podem comprar nas mesmas lojas e fazer piadas sobre os mesmos eventos de esportes.

Assim, o que importa não é a profundidade observável, mas a profundidade da identificação com comunidades diferenciáveis. A história de um povo, por exemplo, é sua propriedade particular. Os judeus tem a sua história. Os chineses tem a sua história. Os afro-americanos tem a sua história. Ninguém pode tirar isso deles. É a sua herança e o seu legado. Quando a história envolve sofrimento, e quando heróis se levantam em meio ao sofrimento, laços comunitários ficam ainda mais fortes.

E a herança é relevante, mas muitas pessoas possuem mais de uma e estão em vários pontos de identidade contínua. Alguns articulam várias identidades. Alguns podem até não expressar isso com palavras, ou talvez nem com pensamentos conscientes. Mas eles sabem quando estão desconfortáveis, quando são forçados a entrarem em categorias inapropriadas ou formas que não encaixam. É importante respeitar a forma identitária de cada povo em qualquer momento; entretanto, fazer isso pode atropelar as nossas categorias ou listas de grupos de povos. Indivíduos de um mesmo ancestral - até mesmo irmãos - podem escolher se identificar de formas diferentes.

Qual é a identidade do refugiado imigrante? A criança bi-racial? E menino da tribo Navaho que se pergunta se "casa" fica na reserva ou na cidade? E quanto aos cosmopolitas ou os jovens que compram e usam bens de todos os lugares e que leem, ouvem e consomem mídia de todos os lugares? Qual é o povo deles? Eles estão destinados a serem nômades globais?

Onde quer que eles estiverem, o evangelho lhes oferece um lar e uma família. Deus não usa estereótipos conosco. Ele se encontra conosco como as exceções que somos, com nossas identidade múltiplas e que se sobrepõem, com nossas peregrinações únicas e preferências singulares. Deus não nos prende a jaulas e preconceitos. Seja alguém que perdeu a sua família de forma permanente, ou que está vagando por um tempo, ou alguém que uniu pedaços de diferentes heranças, Deus acolhe a todos dentro do seu povo. O evangelho nos oferece uma casa e um lar além das estruturas deste mundo.

Culturas locais são presentes de Deus, mas elas nunca são suficientes. Sim, como Jeremias disse, nós "buscamos a paz da cidade" onde quer que nos encontremos (Jr. 29:7, NAA). e ainda assim, como Abraão, nós sabemos que aqui não é o nosso descanso final. Nós permanecemos peregrinos, buscando a cidade "cujo arquiteto e construtor é Deus" (Heb. 11:8-10).

3. Construir pontes

Em 1964, com 14 anos de idade, Zia entrou em uma escola para cegos no Afeganistão. Ele havia se tornado um cristão fervoroso. Nos anos seguintes, ele aprendeu a falar dari, pushtu, árabe, inglês, alemão, russo, e as línguas urdo, e a ler esses idiomas que possuíam braille. Durante a ocupação russa do Afeganistão, Zia foi encarregado da escola para os cegos. Mais tarde, devido a que ele não podia se juntar ao Partido Comunista, ele foi lançado na prisão. Ele escapou disfarçado de mendigo cego para o Paquistão, o que era seu estado verdadeiro.

No Paquistão, como Zia estava traduzindo o Antigo Testamento, ele recebeu uma bolsa para ir aos Estados Unidos estudar hebraico, mas ele rejeitou a proposta. Por quê? Ele estava muito ocupado com o ministério local. E, por mais que ele não achasse que tinha tempo para estudar hebraico, ele aprendeu o urdo como sua sétima língua porque queria alcançar os paquistaneses. Eventualmente ele morreu como mártir.

Zia representa os milhões de cristãos que testemunharam através dos séculos e que descobriram que os vínculos do evangelho nos unem por todo o globo. Nós começamos de forma local, mas não paramos por aí.

Hoje o mundo precisa desesperadamente de mais pessoas como Zia. A globalização tecnológica e econômica nos conecta de formas superficiais. As sociedades precisam de pessoas que possam fazer conexões mais profundas que essas. Thomas Friedman (1999) explora essa ideia no seu profundo livro The Lexus and the Olive Tree:: Understanding Globalization [O lexus e a oliveira: compreendendo a globalização]: o Lexus representa a economia global e a oliveira representa as tradições locais. Clifford Geertz (1973) escreve sobre a tensão entre epocalismo e o essencialismo, entre a necessidade de ser parte da época contemporânea versus a necessidade de manter as nossas identidades essenciais, de sabermos quem somos. Manuel Castells (1996, p. 456) no seu livro The Rise of the Networked Society [O surgimento da sociedade conectada por rede] defende que, apesar de um globo interconectado resulta em uma integração de poder, isso ocorre num nível cada vez mais divorciado das nossas vidas pessoais. Ele chama isso de "esquizofrenia estrutural" e adverte: "A menos que as pontes culturais, políticas e físicas sejam deliberadamente construídas… nós podemos estar indo em direção à vida em universos paralelos onde os tempos não conseguem se encontrar".

Quem pode construir essas pontes? Qual movimento ultrapassa nações, raças, gêneros, ethne, ricos e pobres, analfabetos e doutores? É algo maravilhoso perceber que dificilmente qualquer outro povo será mais adequadamente capacitado para criar conexões interculturais do que a Igreja Global de Cristo.

Quando os laços civis se rompem, normalmente são os cristãos que podem conduzir as sociedades através de pontes de reconciliação, abrindo o caminho para apertar a mão dos irmãos e irmãs do outro lado. Nossas lealdades não param nas bordas de nossa cultura. Somos peregrinos. Podemos ir para as margens. De fato, esse sempre foi o mandato cristão. Abraão foi chamado para ser uma bênção para todas as famílias da Terra (Gênesis 12:1-3). Davi cantou: "Que todos os povos te louvem, ó Deus" (Sl 67:3,5). Paulo foi impulsionado por uma paixão pelos povos não alcançados (Rm 15:20-21). João vibrou com uma visão de povos, tribos, tribos e nações reunidos em torno do trono de Deus no final dos tempos (Ap 4-5).

Estabelecer conexões interculturais tem sido nossa missão desde o início. Nosso envolvimento na globalização não está enraizado na economia, mas no amor de Deus por seu mundo. Não podemos ser isolacionistas, satisfeitos em nossos casulos. O amor de Deus nos obriga a sairmos de nossas fronteiras. Onde há conflito, saímos como pacificadores. Onde o evangelho não é conhecido, saímos como testemunhas. As conexões globais também possibilitam que saiamos para servir a Igreja de Jesus Cristo em todo o mundo de forma mais rápida e abrangente do que nunca.

A quem muito foi dado, muito será exigido. E nós, estamos construindo pontes?

4. Cultivar igrejas étnicas

Por fim, devemos considerar as igrejas étnicas distintas em nossas próprias comunidades. Algumas pessoas perguntam: "Se o horário das 11 horas da manhã de domingo é o mais segregado dos Estados Unidos, as igrejas étnicas não são racistas? Sem dúvida, elas promovem o evangelismo e a comunhão. Mas o fato de algo funcionar não significa que seja correto. O diabo também tem muito sucesso."

Como podemos responder? Neste capítulo, lançamos a base para argumentar que as igrejas étnicas são justificadas não apenas por razões pragmáticas, porque funcionam, mas também porque estão enraizadas na doutrina da criação. Feitos à Imagem de Deus e expressando a criatividade dada por Ele, as pessoas desenvolveram diferentes culturas. Essas culturas oferecem vislumbres complementares de beleza e verdade e críticas complementares do mal.

Toda igreja deve acolher pessoas de todas as raças e culturas. Algumas pessoas florescem em igrejas multiculturais. Outras valorizam sua própria tradição. Para elas, a cultura continua sendo importante na adoração. Elas oram em sua língua materna, com gestos significativos, ululações e prostrações. Sua cultura afetará a maneira como realizam o evangelismo, o discipulado, o ensino, a administração, o aconselhamento, as finanças, o trabalho com os jovens, o treinamento de líderes, a disciplina, o desenvolvimento do currículo, a assistência, o desenvolvimento e a defesa de direitos. Seus teólogos complementam o entendimento da Bíblia de outras culturas.

Congregações separadas não são ruins. O que é ruim é a falta de amor. Essa falta de amor é encontrada com muita frequência em igrejas nas quais a maioria dos membros é da subcultura no topo da hierarquia de poder. As igrejas mais ricas e poderosas têm, de fato, obrigações especiais. Se nossos irmãos e irmãs não tiverem assistência médica, boas

Para um argumento contra as igrejas étnicas, consulte Padilla (1983).

escolas, ou ruas seguras - ou se não tiverem comentários bíblicos em seu idioma, ou dinheiro para pagar as mensalidades para que seus pastores possam ir ao seminário - não podemos simplesmente sorrir e seguir em frente. Como escreveu o apóstolo Tiago,

Meus irmãos, qual é o proveito, se alguém disser que tem fé, mas não tiver obras? Será que essa fé pode salvá-lo? Se um irmão ou uma irmã estiverem com falta de roupa e necessitando do alimento diário, e um de vocês lhes disser: "Vão em paz! Tratem de se aquecer e de se alimentar bem", mas não lhes dão o necessário para o corpo, qual é o proveito disso? (Tg. 2:14-16).

Nesse contexto, as igrejas étnicas têm grande valor. Como um mosaico, como um caleidoscópio, todo o espectro de culturas e igrejas étnicas enriquece o mundo de Deus. Assim como famílias fortes e saudáveis são os alicerces de comunidades fortes e saudáveis, igrejas étnicas fortes podem ser os alicerces de associações multiculturais fortes. É quando aprendemos o compromisso e a cooperação em casa que estamos preparados para praticar essas habilidades em geral.

As igrejas étnicas também são um bom lugar para começar o trabalho missionário global. Podemos fazer parcerias com cristãos internacionais que vivem em nossas próprias cidades: estudantes, empresários, visitantes temporários, refugiados, imigrantes. Muitos representam povos relativamente "não alcançados". Muitos retornam regularmente à sua terra natal para ajudar a cavar poços, montar clínicas, ensinar em escolas bíblicas, publicar hinários e livros didáticos de treinamento, etc. Podemos orar com eles, ajudá-los a crescer até a maturidade como discípulos de Cristo e, juntos, alcançar suas etnias.

Quando a etnia é valorizada como uma dádiva, mas não adorada como um ídolo, o mundo de Deus é abençoado, e desfrutamos de um vislumbre da alegria do céu. Mantenhamos essa visão adiante de nós.

Perguntas de estudo

1. ComoAdeney descreve o valorda etnia? 2. Quando a etnia se torna um ídolo? Como podemos confrontá-lo? 3. Adeney escreve sobre quatro maneiras pelas quais a missão deve abordar a "tendência desumanizadora da globalização". Quais são elas?

Broom, J. (2008, May). "A New Wing Luke." Seattle Times, p. a16. Castells, M. (1996). The Rise ofthe Networked Society. London, UK: Blackwell Publishers. Friedman, T. L. (1 999). The Lexus and the Olive Tree. New York, NY: Farrar, Straus, Giroux. Geertz, C. (1964). "Ideology as a Cultural System." In D. Apter (Ed.), Ideology and

Discontent (pp. 47-56). New York, NY: Macmillan Publishing Company. Hickerson, M. (2002, Winter). Editor's note. EtCetera: Newsletter of Regent College

Students. Vancouver, British Columbia, Canada. Padilla, R. (1983). "The Unity of the Church and the Homogenous Unit Principle." In W.

Shenk (Ed.), Exploring Church Growth. Grand Rapids, MI: Wm. B. Eerdmans

Publishing Company. Robert, D. (2002, April). "The First Globalization: The Internationalization of the Protestant

Missionary Movement Between the Wars." International Bulletin of Missionary

Research, 26:2, pp. 50-66. Williams, D. (2001 ). Castrating Culture: A Christian Perspective on Ethnic Identity From the

Margins. Cumbria, UK: Paternoster Press.$conteudo$
     where curso_id = v_curso and ordem = 10;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 2 · Leitura — Adeney: Deus é daltônico?$t$, $conteudo$Deus é daltônico?

O evangelho, a globalização e como Deus

enxerga a diversidade cultural

Miriam Adeney

Isabell Ides tinha 101 anos quando faleceu em junho de 2008. Uma Índia Makah, povo caçador de baleias, morava na última casa da última rua na ponta mais ao noroeste dos Estados Unidos. Isabell era muito conhecida na região porque ela amava e ensinava a cultura Makah e a sua língua. Centenas de pessoas aprenderam a tecer cestos por causa das mãos de Isabell. Várias gerações aprenderam palavras na sua própria língua pelos lábios dela. Jovens mães traziam seu salmão defumado para ela. Depois de mastigar um pouco, ela sabia se a madeira estava seca demais. Os arqueólogos traziam a ela suas cestas de 3.000 anos atrás que haviam acabado de escavar, e ela conseguia identificar que tipo de cestos que elas eram e como foram utilizadas. "É como perder uma biblioteca", disse um antropólogo no funeral dela.

Isabell também ensinava na Escola Bíblica na Igreja das Assembleias de Deus que havia dentro da reserva. Ela atribuiu a longa vida que ela teve à sua fé cristã.

Será que os cestos da Isabell eram importantes para Deus, igual que a sua Escola Bíblica no domingo? Quão importante era a sua herança étnica para a visão global do Reino de Deus? Essa pergunta reverbera à medida que exploramos a globalização.

Destruição criativa

Na primavera de 2001, representantes de 34 nações se uniram em Quebec para discutir um acordo de livre comércio que cobriria todo o continente americano. Haviam muitas preocupações. Como poderia haver um equilíbrio justo entre os EUA e Canadá com Honduras e Bolívia, entre alguns dos países mais pobres e mais ricos do planeta? Os

O que é etnicidade? O critério mais fundamental para etnicidade é a auto-atribuição de uma pessoa como membro de uma cultura compartilhada. Outras atribuições limitam isso, mas são secundárias. Componentes de identidade étnica podem ou não incluir o seguinte: uma terra ancestral (seja ela habitada ou não por membros do grupo na atualidade), uma língua ancestral (seja ela falada ou não pelos membros do grupo na atualidade), história compartilhada (especialmente se ela inclui sofrimento e heróis), comida, humor e comportamento apropriado entre familiares próximos. As diferenças compartilhadas podem ser triviais; a auto-classificação é importante. O que uma etnia significa é continuamente reformulado. Para um aprofundamento na discussão, leia Williams (2001).

países pequenos não seriam simplesmente engolidos? Até mesmo o Brasil, a maior economia da América Latina, estava duvidoso.

Entrando nessa discussão, o presidente de economia federal dos EUA, Alan Greenspan, soltou a frase "destruição criativa". Sim, disse ele, uma maior abertura no comércio global significa mais "destruição criativa". Negócios vão fechar. Empregos serão perdidos. "Não há dúvida", constatou Greenspan (como citado em Workers, 2001), "de que essa transição para uma economia nova e de alta tecnologia, da qual o comércio crescente é parte, tem se provado desafiadora para um grande segmento da nossa força de trabalho… O processo de adequação está contorcendo a força trabalhadora atual que foi feita redundante sem ser culpa dela". Mas tais traumas são apenas parte do preço do progresso. Como normalmente é dito, não se pode fazer um omelete sem quebrar ovos. Não se pode jardinar sem podar. Não se pode usar o computador sem apertar o botão de deletar de vez em quando. Não se pode treinar um atleta sem descamar seus maus hábitos. Forjar, afiar, limpar, frear - todos esses são termos positivos. E assim Greenspan falou sobre a "destruição criativa" inerente da globalização. Mas, ele agregou, "a história nos ensina que não é apenas tolice tentar evitar esse processo, é impossível".

Etnicidade é uma das arena de destruição. No sistema global de hoje, os valores da etnia local estão sendo esmagados. E os valores culturais são muito mais do que mercadorias. Eles são partes de heranças que não podemos colocar um preço. E ainda assim, como espécies em perigo de extinção, valores culturais têm sido ameaçados. Como deveríamos responder quando a globalização afoga a etnicidade?

Um lugar na história

Qual é a visão de Deus sobre etnicidade? Deus nos fez à sua imagem, concedendo-nos criatividade e nos colocando em um mundo de possibilidades e desafios. Quando aplicamos a nossa criatividade concedida por Deus, as culturas do mundo surgem e se desenvolvem.

No princípio, Deus afirmou que não era bom que os seres humanos estivessem sozinhos. Os seres humanos foram feitos para viverem em comunidades repletas de significado. Então Deus deu a sua bênção para as áreas culturais, como família, estado, trabalho, adoração, artes, educação e até mesmo para festivais. Ele prestou atenção às leis que preservam ecologia, concediam relacionamentos sociais em ordem, providenciou saneamento, e protegeu os direitos dos fracos, dos cegos, dos surdos, das viúvas e dos órfãos, do estrangeiro, do pobre e dos devedores.

Ele afirmou o mundo físico, de onde a cultura material é desenvolvida. Ele se deleita no próprio solo e nos rios que ele concedeu ao seu povo. Era "a terra da qual o Senhor, seu

Deus, cuida; os olhos do Senhor, Deus de vocês, estão sobre ela continuamente, desde o princípio até o fim do ano" (Dt. 11:12, NAA). Sabendo dos deleites materiais do seu povo, Deus os estabeleceu em:

● Uma terra boa, uma terra de riachos de água, de fontes e profundidades que jorram e regam os vales e as montanhas.

● Uma terra de trigo e cevada, vinhedos, figueiras e romãzeiras.

● Uma terra de azeite e mel.

● Uma terra onde se come pão sem escassez, onde não há falta de nada nela.

● Uma terra onde as pedras são de ferro, e de onde se pode cavar e minerar bronze (Dt. 8:7-9).

Na linguagem visual do Antigo Testamento, Deus deu ao seu povo azeite para fazer seus rostos brilhar, vinho para alegrar seus corações, amigos como o ferro para afiá-los, esposas como videiras frutíferas, e filhos como flechas lançadas por seus arcos. Padrões econômicos sociais e artísticos se combinam para formar a cultura. Esse é o contexto onde vivemos. É onde nós fomos feitos para viver. Sistemas globais podem nos submergir em realidade virtual - mídia, música empacotada, bolsa de valores, resultados dos esportes e notícias de última hora - onde grandes tragédias são contrapostas com propagandas de cerveja. Ainda assim, se somos absorvidos no nível global ou virtual, perdemos os ritmos reais da natureza e sociedade. Tempo de plantio e de colheita, a saúde do solo, árvores e água. Amizades, cortejo, casamento, educação de filhos, envelhecimento e morte. Criação, uso, manutenção e reparo. Esses são ritmos do viver no mundo de Deus. São expressados localmente, por meio de padrões culturais específicos. Conhecer esses padrões nos ajuda a conhecermos a nós mesmos, nossas potencialidades e nossos limites, nossos recursos e sequências que precisaremos costurar e tecer para escolhas e decisões felizes. Elas não podem ser conhecidas no nível abstrato e global. Disciplinar uma criança, por exemplo, não é virtual. Ser demitido de um emprego não é uma experiência de mídia. Ter um bebê não é um jogo. Lutar contra o câncer não é abstrato.

Quando eu vivia nas Filipinas, eu via famílias fortes. Hospitalidade acolhedora. Tempos esbanjados com as crianças. Amizades duradouras. Uma herança de liberdade econômica para as mulheres. A habilidade de viver generosamente com pouco dinheiro. Temperos que se estendem a pouca quantidade de carne que muito têm. O deleite em compartilhar. A destreza na arte de relaxar. Agilidade, corpos flexíveis. A habilidade de desfrutar estar com um número grande de pessoas continuamente. Posto que todo bom presente vem dos céus (Tg. 1:17) e já que toda sabedoria e conhecimento vem de Jesus (Col. 2:13), tais qualidades lindas da cultura filipina devem ser vistas como presentes de Deus. Nosso Criador se deleita nas cores. Ele gera cheiros, desde a cebola até a rosa. Ele forma cada floco de neve. Ele faz nascer bilhões de personalidades únicas. Será que é uma surpresa ele ter nos programado com a capacidade de criar um caleidoscópio de culturas para enriquecer o seu mundo?

Culturas contêm pecado e devem ser julgadas, como discutiremos na próxima seção. Mas o orgulho étnico não é automaticamente pecado. É como a alegria que os pais sentem na formatura do filho. A criança sobe ao palco. O seu peito martela com orgulho. E isso não é orgulho às custas do seu próximo, já que o rosto dele também se ilumina e durante a formatura. Não, o seu coração incha porque você conhece a história do seu filho. Os aborrecimentos que ele passou. E os presentes que floresceram nele como flores que se abrem diante do sol. Você mesmo chorou e riu e gastou anos da sua vida no moldar de algumas dessas histórias.

Na sua melhor expressão, a etnia é uma expansão desse orgulho familiar. Etnicidade é um sentimento de identificação com pessoas que compartilham uma cultura e uma história, com seus sofrimentos e suas vitórias, heróis e mártires. Como a membresia de uma família, a etnicidade não pode ser comprada. Ela é um direito de nascimento, recebido você querendo ou não.

Os seres humanos foram criados para viver em comunidade. No mundo de hoje, ainda sentimos essa necessidade. "Mesmo com as necessidades materiais atendidas, ainda assim a nossa motivação… resiliência emocional… e força moral… precisam vir de alguma visão de propósito público ancorado em uma imagem de realidade social cativante", segundo o antropólogo Clifford Geertz (1964, p. 70). Ser um cidadão globalizado é muito vago para fornecer essa motivação e força, diz Geertz. Cidadania globalizada faz com que a pessoa comum se sinta insignificante. Até mesmo uma cidadania nacional pode gerar apatia. Mas quando você é parte de um grupo étnico, você passa a ter celebridades que lhe dão entusiasmo, valores que lhe dão uma estrutura cognitiva, padrões de comportamento que direcionam os seus dias, e laços associativos que lhe enraízam em um contexto humano. Você tem um lugar no tempo no universo, uma base para a convicção de que você é parte da continuidade da vida fluindo do passado e pulsando em direção ao futuro. Você está dentro da história.

Quando a etnicidade se torna um ídolo

Deus ordenou a cultura. Mas os costumes que glorificam a Deus não são a única realidade que observamos ao nosso redor. Ao invés de amabilidade, criatividade harmoniosa e autoridade admirável, vemos fragmentação, alienação, luxúria, corrupção, egoísmo, injustiça e violência cultivados pela nossa cultura. E nenhuma parte permaneceu pura. A ciência tende a servir o militarismo ou o hedonismo, ignorando a moral. Aarte normalmente vira adoração separada de Deus. Meios de comunicação de massa estão cheios de prostitutos verbais. Homens de negócios fazem acordos sombrios. Políticos enchem os próprios bolsos. Trabalhadores fazem serviços de má qualidade. Maridos enganam suas esposas. Esposas manipulam seus maridos. Filhos ignoram seus pais como pessoas .

Não somos apenas criados à imagem de Deus. Também somos pecadores. Porque nós nos separamos de Deus, as culturas que criamos agora estão repletas de maldade. Somos chamados a, então, não apenas nos alegramos nos padrões de sabedoria, beleza e gentileza nas nossas culturas, mas também de confrontarmos e julgarmos os padrões de idolatria e exploração.

Às vezes a etnicidade se torna um ídolo. Como outros ídolos da sociedade moderna - dinheiro, sexo e poder, por exemplo - etnicidade não é ruim em si mesma. Entretanto, quando ela é exaltada como se fosse o bem maior, a etnicidade se torna um mal. Racismo, rixas, guerras e "pureza racial" são o resultado. Quando a etnicidade se torna um ídolo, ela precisa ser confrontada e julgada.

Implicações para a Missão

A etnicidade se opõe à tendência desumanizadora da globalização. Até mesmo em sua melhor expressão, a globalização econômica tende a tratar os valores culturais como mercadorias. A etnicidade nos lembra de guardarmos a fé com nossos avós e com nossas comunidades humanas. É um contrapeso vital. E nesse contexto atual, o que a etnicidade significa para a missão? Vamos sugerir quatro aplicações.

1. Valorizaro local

Em primeiro lugar, a missão precisa valorizar as culturas locais. Nós não fazemos isso de forma acrítica. Ao trabalharmos com e debaixo de cristãos locais, nós julgamos padrões de idolatria e exploração, como explicamos anteriormente. E ainda assim amamos a cultura local. Nós a recebemos como um presente de Deus. Ao mesmo tempo que vivemos naquele lugar, nós nos adaptamos gradualmente a essas dimensões dos valores locais que trazem pleno pertencimento.

Nós falamos a língua local. Onde quer que os cristãos vão, eles traduzem a Bíblia. Isso tem sido destacado por Lamin sanneh, um cristão com antecedente muçulmano que é professor da universidade de Yale. Os muçulmanos insistem que as pessoas precisam aprender árabe porque é a língua de Deus. Mas os cristãos dizem: "Deus fala a sua língua".

Como cristãos, apoiamos e sustentamos empreendedores e empreendedoras locais. Nós encorajamos artistas, músicos e escritores locais, ao invés de constantemente apoiar livros estrangeiros ou traduzi-los. Nós nos hospedamos em hotéis locais e casas. Aprendemos sobre as tradições vegetais locais. Nós protegemos as florestas da região. Nós aprendemos habilidades novas com jogos e competições esportivas locais. Nós nos esforçamos para estar presentes nas festas locais e funerais. Nós simpatizamos com reformadores sociais locais. Se somos missionários, disciplinamos os nossos pensamentos para não ficarmos preocupados com os padrões culturais da nossa terra natal. Heranças específicas importam. Até mesmo a épica do século XX chamada O Senhor dos Anéis (Tolkien, 1954) valoriza a cultura local. O colunista Mike Hickerson (2002) observa:

O Senhor dos Anéis sugere que a vitória de Deus na terra (ou terra-média) é incompleta até que a vitória preencha os "pequenos lugares". [...] A batalha final entre o bem e o mal não é um confronto histórico gigantesco - como a destruição da Estrela da Morte - mas, na verdade, é uma batalha pequena, seguida por uma pequena reconstrução de um pequeno local.

As Boas Novas preenchem todos os vales… Após seu retorno ao

Condado, os hobbits continuaram a sua missão até a sua conclusão apropriada. Sem seu trabalho humilde entre seu próprio povo humilde, o mal teria retido um bastião avançado na Terra-Média. O global é importante da mesma forma que o local é.

Nos programas de treinamento missionários, essa ênfase precisa ser feita. Há a tendência dos missionários de culturas dominantes forçarem a sua herança étnica como se ela fosse um padrão divino para todas as pessoas. Os missionários ocidentais fazem isso. Os missionários chineses e coreanos fazem isso no Centro e no Sudeste Asiáticos. Os latinos o fazem em comunidades indígenas.

Até mesmo dentro do mesmo país os missionários que são da população majoritária podem perder apreço pelas minorias culturais e tratá-las de forma desrespeitosa. Considere um convite enviado por e-mail que recebi esta manhã. A mensagem diz o seguinte:

Quando vier, você poderia dar uma palestra sobre a teologia da cultura?

No nosso país temos muitos grupos étnicos diferentes e os preconceitos são assustadores. É possível que haja pessoas de um grupo étnico trabalhando em um vilarejo com muitos outros grupos étnicos. Mas eles tendem a trabalhar de forma independente e inventam desculpas para não cooperar uns com os outros.

Por toda a história temos exemplos de missionários que igualam a sua herança cultural com a forma preferida de trabalho de Deus. É fácil criticá-los ao olharmos para trás. Entretanto, nós não vamos descartá-los de forma tão simples. Ao mesmo tempo que a teologia da cultura dos primeiros missionários possa ter sido acanhada, as suas práticas normalmente eram bem robustas. Eles aprendiam a língua local. Eles eram as principais fontes de cultura local para os primeiros antropólogos. Sem aviões, eles passavam por guerras, epidemias, secas e enchentes. Os seus filhos e esposas eram enterrados lá.

Em contraste, os missionários atuais adoram falar sobre contextualização, mas temos vivido isso? Jesus passou 33 anos imerso em uma única cultura local.

2. Serperegrinos

Muitas pessoas têm várias identidades étnicas. Considere esta situação: no oeste dos EUA, gerações anteriores de asiáticos foram impedidos por lei de casar-se com caucasaianos. Por isso, alguns imigrantes filipinos se casaram com nativos americanos. Agora, imagine três filhos crescidos em uma família assim. Um se identifica principalmente como filipino, o segundo como nativo americano, e o terceiro como americano. Mas os três trocam suas identidades étnicas continuamente.

Além disso, as culturas mudam continuamente. No processo, novas combinações de identidade emergem. O renomado Museu Wing Luke (museu que representa todas as culturas asiáticas nos EUA) teve sua reabertura nesta semana aqui na cidade onde moro, em Seattle, no estado de Washington. Supostamente é o único museu nos EUA que é Pan-Asiático Pacífico Americano. Mas o que é ser um Asiático Pacífico Americano? "Não é uma raça, nem um grupo étnico ou nacionalidade" segundo Jack Broom no Seattle Times. "É uma categoria identificada no censo que combinou historicamente pessoas de mais de 40 países tomando uma vasta porção do globo, indo desde o Tahiti até o Paquistão, do Japão à Indonésia, do Havaí à Índia" (2008, p. A16).

Quatorze por cento da população do meu país é Asiático Pacífico Americano. Apesar do que disse o Seattle Times, essa categoria étnica é significativa e relevante, um grupo mensurável com identidade o suficiente para sustentar um renomado museu. Em um agrupamento de identidades étnicas, ele constitui um nível. O artigo do Times prossegue dizendo que os altos números "refletem o posto avançado do noroeste no Círculo Pacífico".

Identidades múltiplas não são excepcionais. Os falantes de espanhol nos EUA cresceram 50% de 1980 para 1990. Eles agora compõem 30% da população da cidade de Nova York. A maioria também fala inglês. Na mesma década, o número de falantes de chinês cresceu 98%. Quatro quintos deles continuam preferindo falar chinês em casa, por mais que também falem inglês.

No seu nível mais essencial, a identidade étnica se baseia na auto-identificação de um membro com uma cultura compartilhada, com uma comunidade compartilhada. Em uma sociedade multiétnica, as diferenças de padrões econômicos, sociais ou perspectiva não são tão evidentes, por mais que essas pessoas venham de diferentes países. Eles podem comprar nas mesmas lojas e fazer piadas sobre os mesmos eventos de esportes.

Assim, o que importa não é a profundidade observável, mas a profundidade da identificação com comunidades diferenciáveis. A história de um povo, por exemplo, é sua propriedade particular. Os judeus tem a sua história. Os chineses tem a sua história. Os afro-americanos tem a sua história. Ninguém pode tirar isso deles. É a sua herança e o seu legado. Quando a história envolve sofrimento, e quando heróis se levantam em meio ao sofrimento, laços comunitários ficam ainda mais fortes.

E a herança é relevante, mas muitas pessoas possuem mais de uma e estão em vários pontos de identidade contínua. Alguns articulam várias identidades. Alguns podem até não expressar isso com palavras, ou talvez nem com pensamentos conscientes. Mas eles sabem quando estão desconfortáveis, quando são forçados a entrarem em categorias inapropriadas ou formas que não encaixam. É importante respeitar a forma identitária de cada povo em qualquer momento; entretanto, fazer isso pode atropelar as nossas categorias ou listas de grupos de povos. Indivíduos de um mesmo ancestral - até mesmo irmãos - podem escolher se identificar de formas diferentes.

Qual é a identidade do refugiado imigrante? A criança bi-racial? E menino da tribo Navaho que se pergunta se "casa" fica na reserva ou na cidade? E quanto aos cosmopolitas ou os jovens que compram e usam bens de todos os lugares e que leem, ouvem e consomem mídia de todos os lugares? Qual é o povo deles? Eles estão destinados a serem nômades globais?

Onde quer que eles estiverem, o evangelho lhes oferece um lar e uma família. Deus não usa estereótipos conosco. Ele se encontra conosco como as exceções que somos, com nossas identidade múltiplas e que se sobrepõem, com nossas peregrinações únicas e preferências singulares. Deus não nos prende a jaulas e preconceitos. Seja alguém que perdeu a sua família de forma permanente, ou que está vagando por um tempo, ou alguém que uniu pedaços de diferentes heranças, Deus acolhe a todos dentro do seu povo. O evangelho nos oferece uma casa e um lar além das estruturas deste mundo.

Culturas locais são presentes de Deus, mas elas nunca são suficientes. Sim, como Jeremias disse, nós "buscamos a paz da cidade" onde quer que nos encontremos (Jr. 29:7, NAA). e ainda assim, como Abraão, nós sabemos que aqui não é o nosso descanso final. Nós permanecemos peregrinos, buscando a cidade "cujo arquiteto e construtor é Deus" (Heb. 11:8-10).

3. Construir pontes

Em 1964, com 14 anos de idade, Zia entrou em uma escola para cegos no Afeganistão. Ele havia se tornado um cristão fervoroso. Nos anos seguintes, ele aprendeu a falar dari, pushtu, árabe, inglês, alemão, russo, e as línguas urdo, e a ler esses idiomas que possuíam braille. Durante a ocupação russa do Afeganistão, Zia foi encarregado da escola para os cegos. Mais tarde, devido a que ele não podia se juntar ao Partido Comunista, ele foi lançado na prisão. Ele escapou disfarçado de mendigo cego para o Paquistão, o que era seu estado verdadeiro.

No Paquistão, como Zia estava traduzindo o Antigo Testamento, ele recebeu uma bolsa para ir aos Estados Unidos estudar hebraico, mas ele rejeitou a proposta. Por quê? Ele estava muito ocupado com o ministério local. E, por mais que ele não achasse que tinha tempo para estudar hebraico, ele aprendeu o urdo como sua sétima língua porque queria alcançar os paquistaneses. Eventualmente ele morreu como mártir.

Zia representa os milhões de cristãos que testemunharam através dos séculos e que descobriram que os vínculos do evangelho nos unem por todo o globo. Nós começamos de forma local, mas não paramos por aí.

Hoje o mundo precisa desesperadamente de mais pessoas como Zia. A globalização tecnológica e econômica nos conecta de formas superficiais. As sociedades precisam de pessoas que possam fazer conexões mais profundas que essas. Thomas Friedman (1999) explora essa ideia no seu profundo livro The Lexus and the Olive Tree:: Understanding Globalization [O lexus e a oliveira: compreendendo a globalização]: o Lexus representa a economia global e a oliveira representa as tradições locais. Clifford Geertz (1973) escreve sobre a tensão entre epocalismo e o essencialismo, entre a necessidade de ser parte da época contemporânea versus a necessidade de manter as nossas identidades essenciais, de sabermos quem somos. Manuel Castells (1996, p. 456) no seu livro The Rise of the Networked Society [O surgimento da sociedade conectada por rede] defende que, apesar de um globo interconectado resulta em uma integração de poder, isso ocorre num nível cada vez mais divorciado das nossas vidas pessoais. Ele chama isso de "esquizofrenia estrutural" e adverte: "A menos que as pontes culturais, políticas e físicas sejam deliberadamente construídas… nós podemos estar indo em direção à vida em universos paralelos onde os tempos não conseguem se encontrar".

Quem pode construir essas pontes? Qual movimento ultrapassa nações, raças, gêneros, ethne, ricos e pobres, analfabetos e doutores? É algo maravilhoso perceber que dificilmente qualquer outro povo será mais adequadamente capacitado para criar conexões interculturais do que a Igreja Global de Cristo.

Quando os laços civis se rompem, normalmente são os cristãos que podem conduzir as sociedades através de pontes de reconciliação, abrindo o caminho para apertar a mão dos irmãos e irmãs do outro lado. Nossas lealdades não param nas bordas de nossa cultura. Somos peregrinos. Podemos ir para as margens. De fato, esse sempre foi o mandato cristão. Abraão foi chamado para ser uma bênção para todas as famílias da Terra (Gênesis 12:1-3). Davi cantou: "Que todos os povos te louvem, ó Deus" (Sl 67:3,5). Paulo foi impulsionado por uma paixão pelos povos não alcançados (Rm 15:20-21). João vibrou com uma visão de povos, tribos, tribos e nações reunidos em torno do trono de Deus no final dos tempos (Ap 4-5).

Estabelecer conexões interculturais tem sido nossa missão desde o início. Nosso envolvimento na globalização não está enraizado na economia, mas no amor de Deus por seu mundo. Não podemos ser isolacionistas, satisfeitos em nossos casulos. O amor de Deus nos obriga a sairmos de nossas fronteiras. Onde há conflito, saímos como pacificadores. Onde o evangelho não é conhecido, saímos como testemunhas. As conexões globais também possibilitam que saiamos para servir a Igreja de Jesus Cristo em todo o mundo de forma mais rápida e abrangente do que nunca.

A quem muito foi dado, muito será exigido. E nós, estamos construindo pontes?

4. Cultivar igrejas étnicas

Por fim, devemos considerar as igrejas étnicas distintas em nossas próprias comunidades. Algumas pessoas perguntam: "Se o horário das 11 horas da manhã de domingo é o mais segregado dos Estados Unidos, as igrejas étnicas não são racistas? Sem dúvida, elas promovem o evangelismo e a comunhão. Mas o fato de algo funcionar não significa que seja correto. O diabo também tem muito sucesso."

Como podemos responder? Neste capítulo, lançamos a base para argumentar que as igrejas étnicas são justificadas não apenas por razões pragmáticas, porque funcionam, mas também porque estão enraizadas na doutrina da criação. Feitos à Imagem de Deus e expressando a criatividade dada por Ele, as pessoas desenvolveram diferentes culturas. Essas culturas oferecem vislumbres complementares de beleza e verdade e críticas complementares do mal.

Toda igreja deve acolher pessoas de todas as raças e culturas. Algumas pessoas florescem em igrejas multiculturais. Outras valorizam sua própria tradição. Para elas, a cultura continua sendo importante na adoração. Elas oram em sua língua materna, com gestos significativos, ululações e prostrações. Sua cultura afetará a maneira como realizam o evangelismo, o discipulado, o ensino, a administração, o aconselhamento, as finanças, o trabalho com os jovens, o treinamento de líderes, a disciplina, o desenvolvimento do currículo, a assistência, o desenvolvimento e a defesa de direitos. Seus teólogos complementam o entendimento da Bíblia de outras culturas.

Congregações separadas não são ruins. O que é ruim é a falta de amor. Essa falta de amor é encontrada com muita frequência em igrejas nas quais a maioria dos membros é da subcultura no topo da hierarquia de poder. As igrejas mais ricas e poderosas têm, de fato, obrigações especiais. Se nossos irmãos e irmãs não tiverem assistência médica, boas

Para um argumento contra as igrejas étnicas, consulte Padilla (1983).

escolas, ou ruas seguras - ou se não tiverem comentários bíblicos em seu idioma, ou dinheiro para pagar as mensalidades para que seus pastores possam ir ao seminário - não podemos simplesmente sorrir e seguir em frente. Como escreveu o apóstolo Tiago,

Meus irmãos, qual é o proveito, se alguém disser que tem fé, mas não tiver obras? Será que essa fé pode salvá-lo? Se um irmão ou uma irmã estiverem com falta de roupa e necessitando do alimento diário, e um de vocês lhes disser: "Vão em paz! Tratem de se aquecer e de se alimentar bem", mas não lhes dão o necessário para o corpo, qual é o proveito disso? (Tg. 2:14-16).

Nesse contexto, as igrejas étnicas têm grande valor. Como um mosaico, como um caleidoscópio, todo o espectro de culturas e igrejas étnicas enriquece o mundo de Deus. Assim como famílias fortes e saudáveis são os alicerces de comunidades fortes e saudáveis, igrejas étnicas fortes podem ser os alicerces de associações multiculturais fortes. É quando aprendemos o compromisso e a cooperação em casa que estamos preparados para praticar essas habilidades em geral.

As igrejas étnicas também são um bom lugar para começar o trabalho missionário global. Podemos fazer parcerias com cristãos internacionais que vivem em nossas próprias cidades: estudantes, empresários, visitantes temporários, refugiados, imigrantes. Muitos representam povos relativamente "não alcançados". Muitos retornam regularmente à sua terra natal para ajudar a cavar poços, montar clínicas, ensinar em escolas bíblicas, publicar hinários e livros didáticos de treinamento, etc. Podemos orar com eles, ajudá-los a crescer até a maturidade como discípulos de Cristo e, juntos, alcançar suas etnias.

Quando a etnia é valorizada como uma dádiva, mas não adorada como um ídolo, o mundo de Deus é abençoado, e desfrutamos de um vislumbre da alegria do céu. Mantenhamos essa visão adiante de nós.

Perguntas de estudo

1. ComoAdeney descreve o valorda etnia? 2. Quando a etnia se torna um ídolo? Como podemos confrontá-lo? 3. Adeney escreve sobre quatro maneiras pelas quais a missão deve abordar a "tendência desumanizadora da globalização". Quais são elas?

Broom, J. (2008, May). "A New Wing Luke." Seattle Times, p. a16. Castells, M. (1996). The Rise ofthe Networked Society. London, UK: Blackwell Publishers. Friedman, T. L. (1 999). The Lexus and the Olive Tree. New York, NY: Farrar, Straus, Giroux. Geertz, C. (1964). "Ideology as a Cultural System." In D. Apter (Ed.), Ideology and

Discontent (pp. 47-56). New York, NY: Macmillan Publishing Company. Hickerson, M. (2002, Winter). Editor's note. EtCetera: Newsletter of Regent College

Students. Vancouver, British Columbia, Canada. Padilla, R. (1983). "The Unity of the Church and the Homogenous Unit Principle." In W.

Shenk (Ed.), Exploring Church Growth. Grand Rapids, MI: Wm. B. Eerdmans

Publishing Company. Robert, D. (2002, April). "The First Globalization: The Internationalization of the Protestant

Missionary Movement Between the Wars." International Bulletin of Missionary

Research, 26:2, pp. 50-66. Williams, D. (2001 ). Castrating Culture: A Christian Perspective on Ethnic Identity From the

Margins. Cumbria, UK: Paternoster Press.$conteudo$, 10);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 12) then
    update aulas set titulo = $t$Lição 3 · Guia de estudo — O Messias para o mundo$t$, conteudo = $conteudo$Exaltamos a Jesus como Salvador pessoal, mas quando buscamos honrar a Cristo pelo valor da sua morte e ressurreição é possível perder de vista as realizações extraordinárias da Sua própria vida. Jesus não somente garantiu a salvação, mas ainda lançou um movimento que levaria essa mesma salvação a todas as partes do mundo. Ele escolheu os Seus seguidores e as Suas ações com intenções estratégicas e disse ao Seu Pai no fim de Sua vida: “Eu te glorifiquei na terra, completando a obra que me deste para fazer” (João 17.4 - NVI).

Jesus tinha somente um tema predominante em todo o Seu ensino: o Reino de Deus. Ele usou esse tema para chamar as pessoas a segui-lo e usou a mesma linguagem para irem além: enfrentar a batalha global contra o maligno nos estágios finais. O foco no Reino nos desafia quanto a questões de grande significado nessa batalha. Não é uma tarefa pequena estabelecer comunidades que representam a vida no Reino como postos avançados no meio da escuridão espiritual. Por causa da incomparável certeza quanto à invasão do Reino, não é raro encontrar servos de Cristo que amam suas próprias vidas tão pouco que nem a morte os ameaça. Essas pessoas oram e trabalham para nada menos do que a vinda do Reino na terra, assim como nos céus. O Reino de Deus é a essência de toda missão.

O mandato que Cristo nos deu explica detalhadamente a nossa tarefa de continuar a obra que Ele iniciou durante Sua vida na terra, até que ela seja completada entre todos os povos. É óbvio que perderemos o sentido da nossa missão se não entendermos como ele cumpriu a Sua própria missão. Para aqueles que abraçaram o Seu propósito, nenhuma frase se torna mais preciosa do que: “Assim como o Pai me enviou, eu os envio” (João 20.21 - NVI).

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Explicar o valor estratégico do foco de Jesus no povo Judeu.

2. Entender como Jesus ensinou e modelou o ministério aos Gentios.

3. Entender os conceitos bíblicos do Reino e do seu “mistério” em termos do Messias vir não uma, mas duas vezes.

4. Explicar o significado missionário deste mistério do Reino, ou seja, do conceito que já veio e que ainda virá.

5. Explicar a Grande Comissão em termos da expectativa de Jesus a respeito daquilo que precisa ser completado entre as nações.

6. Explicar o conceito da frase grega: “panta ta ethne” e o seu significado para a evangelização do mundo.

NO NÍVEL AVANÇADO:

7. Entender a estratégia de Jesus ao trabalhar com poucos líderes para promover um movimento de alcance mundial.

8. Explicar como Mateus 24.14 traz esperança e foco para completar a evangelização do mundo.

9. Orar com esperança e propósito estratégico para Deus restringir os poderes malignos para que as pessoas ouçam o Evangelho e esperem por uma mudança duradoura.

10. Explicar como a cruz está centrada na maneira pela qual os sinais do Reino serão manifestados.

Palavra chave:

[cite] MANDATO Viver debaixo de um mandato quer dizer que nos foi confiada uma tarefa de importância permanente. Mandatos não são ordens. Por ordens diretas designamos pequenas tarefas ou afazeres diários. Um mandato, por outro lado, transfere autoridade e responsabilidade para alcançar alvos de interferência histórica. Deus confiou a Cristo, e com Ele à Sua Igreja, o mandato de cumprir o Seu propósito para toda a história.

1. O FOCO ESTRATÉGICO DE JESUS

Jesus atuou com um propósito estratégico. Ele não somente modelou o interesse que Deus tem pela evangelização mundial, mas também preparou, ou propôs, um movimento dinâmico, multiplicador, capaz de evangelizar todo o mundo.

A. A Concentração de Jesus no Povo Judeu

Jesus nasceu dentro de um mundo como o nosso, dividido por tensões étnicas e religiosas. Ele encarou hostilidade desde os primeiros momentos do seu ministério público, em parte porque desafiava os conceitos do Seu próprio povo sobre Seu papel no plano de Deus. O povo judeu foi escolhido por Deus para alcançar os demais, mas ele guardou a mensagem com atitudes etnocêntricas e agiu com exclusividade.

Jesus trabalhou dentro dos limites do Seu povo, para oferecer o máximo de oportunidade e para compreender Sua mensagem e submeter-se a Deus. Por exemplo, enviou os doze primeiramente às “ovelhas perdidas da casa de Israel” acrescentando que eles não se dirigissem “aos Gentios” (Mt 10.5-6). Ao mesmo tempo, porém, exerceu ministério notável entre as pessoas desprezadas que viviam à margem da sociedade judaica (ex. os publicanos, prostitutas e pessoas possessas).

B. O Cuidado de Jesus com os Gentios

Os Evangelhos relatam que Jesus também tinha um cuidado profundo com os não judeus. Ele nunca recusou uma oportunidade de ministrar aos gentios quando o buscavam.

Mais tarde, Jesus enviou os setenta “a todas as cidades e lugares para onde ele estava prestes a ir” (Lc 10.1). Por somar setenta, o número das nações ou povos para os israelitas daquela época, é provável que Jesus estivesse prefigurando a eventual comissão para evangelizar cada lugar e povo na face da terra.

O ensino de Jesus ao longo do Seu ministério sempre enfatizou a abrangência global do coração de Deus. A Grande Comissão não era um acréscimo em cima da hora no seu ensino. Quando olhamos para o relato todo, tudo o que Jesus fez e disse culminou justamente na Grande Comissão.

Embora muitos judeus o rejeitassem, uma porção substancial do povo judeu o recebeu como Messias ao final do Seu ministério. O desejo de Deus em fazer do povo hebreu uma luz para as nações verdadeiramente se cumpriu.

[cite] Leia na platafomra Cornell Goerner: Jesus e os gentios (desde a seção “Primeiro aos judeus” até o final do artigo.)

2. A ESTRATÉGIA DE JESUS

Robert Coleman, em seu livro clássico “O Plano Mestre de Evangelismo”, aponta para o fato de que Jesus selecionou algumas pessoas, as formou e as capacitou como líderes num movimento que impactaria toda a terra. A estratégia de Jesus focalizou em:

Reproduzir caráter. Jesus sabia que as pessoas precisavam ser “imbuídas de Sua vida” para refletir e reproduzir o Seu caráter. Assim, Ele se concentrou em derramar a Sua própria vida em alguns que fariam a mesma coisa com outros.

Reproduzir estrutura. Jesus sabia que a única maneira de alcançar o mundo era lançar um movimento que se reproduzisse em si mesmo. Uma igreja que se multiplicava continuaria a expandir em “círculos cada vez maiores”, até que as multidões da terra tivessem ouvido o Evangelho.

Coleman observa que para os discípulos a ordem da evangelização mundial era “progressivamente esclarecida ao longo da convivência com o Mestre, até que finalmente foi expressa em termos claros” na Grande Comissão.

[cite] Leia Coleman (cap. 11, p. 107-111): O plano do Mestre.

3. VENHA O TEU REINO

Na introdução do seu artigo O evangelho do Reino, George Eldon Ladd explica que, ao contrário de muitos conceitos antigos e modernos, a fé cristã expressa sua esperança no Reino de Deus. Os profetas do Antigo Testamento anunciaram o dia do juízo final, depois do qual os homens irão viver juntos e em paz. Nesta situação, não somente os problemas da sociedade humana, mas os que envolvem o meio ambiente também serão resolvidos.

Jesus começou Seu ministério público com as seguintes palavras: “Arrependam-se, pois o Reino dos céus está próximo” (Mateus 4.17 – NVI). O tema da vinda do Reino era fundamental para Sua missão. Verificamos isso nos mais variados aspectos: no ensino (Mt 5.20; 7.21), nas obras (Mt 12.28), nas parábolas (Mt 13.11), na oração (Mt 6.10), nas palavras proféticas (Lc 22.22-30; Mt 25.31,34) e ainda no ensino depois da Sua ressurreição (At 1.3).

4. CONCEITOS BÁSICOS DO REINO

A. O Significado de “Reino”

Muitas vezes usamos a palavra “reino” para designar o domínio geográfico de um rei ou as pessoas pertencentes a tal região (um território e seus cidadãos). Mas a Bíblia usa o termo de um modo diferente e mais dinâmico: “reino” é a dignidade, a autoridade e a soberania exercidas por um rei, mais do que sua propriedade real.

B. O “Reino de Deus”

Refere-se ao reinado de Deus propriamente dito, à Sua autoridade, ao seu governo universal, à sua soberania sobre toda a terra e ao direito de governar baseado em Sua grandeza, poder e glória. Portanto, a oração “venha o teu Reino” é um pedido para que Deus “manifeste sua soberania e poder reais, dispersando todo inimigo da justiça e de seu governo divino, que só Deus seja o Rei sobre todo o mundo” (Ladd, p. 84).

5. CONFLITOS BÁSICOS DO REINO

A. O Mistério do Reino

A surpresa que define o mistério estava nas duas vindas do Messias: a que já se esperava viria não uma, mas duas vezes. Ele viria na glória resplandecente como o Filho do Homem (Daniel 7). Mas esta vinda foi precedida por Sua primeira vinda em humildade e forma escondida de Servo Sofredor de Deus (Isaías 42, 49, 53). Jesus usou a ideia do “mistério do Reino” para descrever um tempo de misericórdia para as nações antes do juízo final. Da perspectiva do Antigo Testamento, o Reino de Deus é visto como somente um evento cataclísmico do juízo de Deus sobre os seus inimigos, seguido por um tempo de paz e poder da parte de Deus.

[cite] A Visão do Reino no Antigo Testamento

[cite] A era vindoura

[cite] A vinda do

[cite] Messias

[cite] A presente era

[cite] O Messias introduz o Dia do Senhor caracterizado por Paz e Poder

A primeira vinda de Jesus: O Reino já chegou, mas opera de maneira escondida, quebrando o poder satânico, livrando pessoas de todas as nações do domínio e do poder do maligno e oferecendo as bênçãos espirituais do governo de Deus para todos.

A segunda vinda, no final: Jesus virá abertamente, e à vista de todo o mundo, esmagará todos os poderes do mundo, destruirá toda tentativa humana de usurpar o legítimo governo de Deus, purificará a terra de todo pecado e do maligno. Esta visão cumpre a perspectiva do Antigo Testamento.

[cite] O Mistério do Reino A era vindoura

[cite] A primeira vinda A segunda vinda

[cite] de Cristo de Cristo

[cite] A presente era

[cite] Messias Vindo Duas Vezes

B. A Vitória do Reino

O reino de Deus é uma vitória progressiva sobre o domínio satânico, através da qual pessoas de todas as nações são resgatadas do poder das trevas. Esta “presente era perversa” já foi invadida pela “era vindoura” do reino de Deus. Satanás já foi derrotado, mas foi destinado a ser destruído na “era vindoura”. Vivemos na sobreposição das eras. Trabalhamos entre o “já” da primeira vinda de Jesus e o “ainda não” da sua segunda vinda. O tempo entre as duas vindas é fundamentalmente um tempo de conflito resultante da sobreposição das eras.

A tarefa missionária da Igreja (evangelizar as nações) é a razão primária deste período interino. A vitória do Reino está sendo alcançada em três grandes atos:

A primeira vinda de Cristo: quebrando o poder de Satanás – a missão de Jesus na terra através da sua vida, morte e ressurreição.

Entre as vindas: desfazendo as obras de Satanás – Jesus continua sua missão às nações, trabalhando com e por meio da Igreja.

A segunda vinda de Cristo: destruindo o reino de Satanás – Cristo virá em plena glória.

[cite] Leia Ladd (cap. 9, p. 84-88): O evangelho do Reino (desde a seção “O mistério do Reino” até a seção “O evangelho do Reino”).

6. O MANDATO DO REINO

George Ladd reconhece a enorme força do mandato em Mateus 24.14. Enfatizamos este versículo não porque estamos predizendo o tempo específico da volta de Cristo, mas porque Deus aparentemente tem a intenção de esperar até que todos os povos tenham a oportunidade de responder a um testemunho adequado do Evangelho do Reino.

A. A Mensagem do Reino

O Evangelho do Reino declara e demonstra o triunfo de Deus sobre os três inimigos que têm provocado a ruína das pessoas através da história: a morte, Satanás e o pecado. Foram derrotados na Sua primeira vinda, serão destruídos na Sua segunda vinda.

O Evangelho do Reino anuncia o que Deus tem feito e continua fazendo para conquistar os seus inimigos (o pecado, a morte e o diabo). Deus tem a intenção de trazer cura substancial e transformação duradoura no presente, e promover vida eterna no Reino eterno. O Evangelho do Reino não é somente uma proclamação, mas é uma promessa do que Deus fará para reconciliar todas as coisas debaixo do reinado de Cristo.

B. A Missão do Reino

Mateus 24.14 é o único versículo da Bíblia que diz, “e então virá o fim”. A evangelização do mundo é uma condição explícita para o seu retorno. O Evangelho do Reino deve ser proclamado em toda a terra, e então, somente depois virá o fim. O que representa um “testemunho” adequado ou quem representa “todos os povos” ,no entendimento de Cristo, não pode ser discernido com precisão. Não deveríamos levar a sério qualquer barreira significativa entre povos que possa bloquear o fluxo do Evangelho e evitar que algum dos “povos” mencionados em Mateus 24.14 seja esquecido? Não deveríamos trabalhar para estabelecer o “testemunho” mais pleno possível – uma comunidade de obediência debaixo do senhorio de Cristo?

Sentido para a História. A verdade de que Deus mantém a história aberta para que a Igreja complete a sua tarefa faz sentido à história e confere um significado enorme à obediência da Igreja.

Motivo do Reino. Considerando a verdade de que a vinda do Messias seja, de certa forma, dependente da Igreja proclamar o Evangelho do Reino a todos os povos, então, temos uma maior

Motivação: a vitória final espera a conclusão da tarefa. Não existe maior esperança! Ladd tanto pergunta quanto responde, “Você ama a volta do Senhor?” Então, fará tudo que puder para levar o Evangelho ao mundo todo.

[cite] Continue lendo Ladd (cap. 9, p. 88-97): O evangelho do Reino (da seção “O evangelho do Reino” até o final).

7. A ORAÇÃO DO REINO

A essência da intercessão, assim como ensinada por Jesus, é argumentar uma causa no tribunal de Deus. Não é uma questão de explicar ou de se submeter ao maligno, mas sim, de lutar contra ele. O teólogo proeminente David Wells expõe algumas pressuposições que estão profundamente enraizadas em um nível de cosmovisão. Oramos pouco, porque não cremos que surtirá efeito contra o mal que vemos no mundo. Mas Wells declara que a cosmovisão judaico-cristã nega que o mal que encontramos na terra seja a vontade e o plano de Deus. Por isso Jesus encarregou os seus seguidores a “rebelarem-se” contra o status quo através da intercessão. Devemos orar para que o Seu nome seja honrado, santificado e abençoado, até nos lugares onde esse nome é negado. Devemos pedir que o governo do Seu Reino se torne efetivo, mesmo onde ele seja desafiado, e que Sua vontade seja feita mesmo onde enfrente oposição de Seus inimigos.

[cite] Leia Wells (cap. 25, p. 190-193): Oração: rebelião contra o status quo.

8. O MESSIAS NA MISSÃO DO REINO

Imagine Jesus lendo a Bíblia dele. A quais conclusões ele chegaria sobre os propósitos de Deus e a sua própria parte neles? Não há dúvida de que quando Jesus começou Seu Ministério, o Reino de Deus era mais que um tópico qualquer de seus ensinamentos. A realidade do Reino de Deus era a base e montou o cenário para tudo o que Jesus fez, falou e orou. Ele sabia que Ele era o personagem principal na batalha global entre o bem e o mal. Ele sabia que Ele havia sido enviado para a guerra do Reino. Quando Jesus envia os seus discípulos, Ele lhes deu uma imagem clara do drama em que Deus está envolvido, guerreando para e em favor da redenção das nações.

A. O Dia do Senhor.

Cornell Goerner mostra como o livro de Malaquias colabora para mostrar a visão do ministério tanto de João Batista como de Jesus.

1. O Dia do Juízo de Deus. Malaquias havia avisado Israel que o juízo de Deus cairia primeiro sobre eles ao invés das nações, os quais eram vistos como inimigos de Deus. Mas, por que juízo sobre Israel? Por causa do desejo de Deus de ser adorado entre todos os povos (Mal. 1:10-11). Israel havia falhado nos mandamentos mais básicos, os de adoração e temor ao nome de Deus (Mal. 2:1-3; 4:1-6).

2. As Advertências de João sobre o Reino. Malaquias descreve uma visão clássica do Antigo Testamento sobre o juízo de Deus, chegando com um único golpe de poder destrutivo contra os inimigos do Senhor. João Batista advertiu o povo da vinda de um enorme juízo.

3. As Palavras de Jesus sobre o Reino. Jesus continuou com essa mesma mensagem, chamando o povo ao arrependimento porque o momento decisivo da história estava prestes a chegar (“o tempo se cumpriu, o Reino dos céus é chegado; arrependam-se e creiam no evangelho” Marcos 1:15). Ao observarem a vinda de Jesus, a expectativa de João Batista e dos outros era de que o Messias confrontasse corajosamente os líderes, sacerdotes e poderes governantes de acordo com o modelo de Malaquias (Mal. 3:1-5), ao ponto de ir contra o domínio do Império Romano.

[cite] Leia na plataforma Cornell Goerner, Jesus e os Gentios, Desde o início até o final da seção “Malaquias e Mateus”

B. A surpresa: o Dia de Misericórdia para as Nações.

Patrick Johnstone nos ajuda na compreensão de um dos primeiros atos do ministério público de Jesus. Ele se encontra em Lucas 4:14-30. Abra sua Bíblia nessa passagem, bem como para Isaías 61:1-2, enquanto lê as sugestões de Johnstone sobre como o idioma original poderia ser traduzido. Pense o possível significado da abrupta parada de Jesus no meio de uma linha de poesia hebraica. Qual era a ideia popular do “dia da vingança” com relação às nações?

Lembre-se do contexto que examinamos sobre a guerra apocalíptica, o qual esperava a eclosão de um julgamento de Deus sobre as nações. Os habitantes da cidade estavam pensando no “dia da vingança” na linha final da profecia como um fim há muito esperado da opressão romana. Ao omitir essa frase final, Johnstone diz que Jesus estava, de fato, mudando o esquema do fim dos tempos. Ele estava declarando que Deus estava dando um tempo de misericórdia aberta a todos. Justamente quando o povo começou a compreender o que Jesus queria dizer ao interromper a leitura, Jesus confirmou os seus pensamentos, dizendo: “Hoje se cumpriu esta escritura”.

Eles compreenderam que Jesus estava abrindo um tempo de misericórdia. Estas eram as “palavras de graça” que vinham de seus lábios. Mas Jesus não os deixou apenas pensando que Deus havia prolongado o tempo de misericórdia exclusivamente para o povo de Israel. Jesus deixou bem claro que a misericórdia de Deus estava direcionada às nações. E foi essa declaração que fez com que eles quisessem matá-lo.

[cite] Leia na plataforma Johnstone: Uma Reação Violenta diante da Misericórdia

Goerner também chama a atenção para esse incidente em Lucas 4. Jesus estava demonstrando desde o início do seu ministério que o propósito do Reino de Deus era para todas as nações. Goerner diz que Jesus certamente “aspirava por dominação mundial”, mas ele rejeitou os métodos de poder, escolhendo o oposto, um “caminho de sofrimento e redenção”.

[cite] Leia na plataforma Goerner: Jesus e os Gentios, a seção “Desde o início”

C. A surpresa do Messias.

Como Ladd descreveu anteriormente (“O Evangelho do Reino”, p. 86), Jesus surpreendeu e desapontou João Batista. Ao invés de uma conquista sobre os poderes políticos, Jesus declarou que o tempo presente seria uma época de cura dos oprimidos e de pregação das boas novas aos pobres. E logo ficou claro para seus discípulos que as curas e pregação de Jesus aos pobres era o começo da batalha contra o mal e a proclamação do evangelho aos pobres por todas as nações. Que tipo de Messias era Ele? Muitos do tempo de Jesus se perguntavam o mesmo que João, dizendo “Você é aquele que haveria de vir, ou devemos esperar algum outro?” (Mat. 11:3). Três modelos de Messias, ou de “aquele que haveria de vir”, eram comuns em Israel. O primeiro era o modelo do Filho de Davi, o qual seria um grande líder militar, reunindo as tropas de Israel de forma miraculosa para acabar com todos os seus inimigos, bem parecido com o Davi antigo (Sal. 89:20-29 e muitos outros). Dois outros modelos eram encontrados no Antigo Testamento: o do Filho do Homem e o Servo Sofredor.

1. O Filho do Homem. Jesus usou esse título messiânico deliberadamente e frequentemente. Ele encontrou esse título em Daniel, que viu Deus inaugurando o reinado do Filho do Homem como rei de todos os povos e reinos. As ramificações globais dessa visão eram claras para todas as pessoas da época de Jesus.

[cite] Leia na plataforma Goerner: Jesus e os Gentios a seção “Filho do homem”

2. O Servo Sofredor. Jesus não cumpriu as expectativas gerais do povo de um governante conquistador como Filho de Davi nem uma tempestade cataclísmica de juízo vindo do Filho do Homem. Jesus sabia que havia outro modelo do Messias prometido e do Reino. E ele encontrou esse modelo nas páginas de Isaías para se referir ao Servo: Isaías 42:1-12; 49:1-6; 52:13-53:12. Estas passagens nos dizem que o Messias vai sofrer, que o seu domínio se estenderá a todas as nações e que Ele trará o reino de formas não-convencionais entre os pobres ao invés de conquistar os poderosos.

9. A GRANDE COMISSÃO

Não deveria ser surpresa que cada um dos Evangelhos, tanto quanto o Livro de Atos, relata a expressão direta do mandato para completar a evangelização mundial.

Marcos 16.15-16 é um imperativo direto para comunicar o Evangelho a todas as pessoas em todos os lugares. O resultado é descrito como crença e salvação ou descrença e perdição eterna.

Lucas 24.46-49 inclui o resumo de Jesus daquilo que as Escrituras prometem que acontecerá entre todas as nações. Ele indica que os Seus seguidores devem ser testemunhas que completarão a proclamação do perdão do pecado a todas as nações.

Mais do que um mandamento, Atos 1.8 é promessa que os discípulos seriam Suas testemunhas, no entanto, ele carrega a força de um mandato de viver de acordo com toda a intenção de Cristo para que sejam Suas testemunhas em todas as partes do mundo (mais detalhes na próxima lição).

João 20.21-23 não tem um mandamento direto quanto às nações, mas no contexto, Jesus nos presenteia com o Espírito Santo de Deus e declara que somos enviados da mesma maneira e para o mesmo propósito que Ele foi.

Mateus 28.18-20. Geralmente conhecido como a “Grande Comissão” é a expressão mais clara do mandato de Cristo para a evangelização mundial.

Steven Hawthorne descreve Mateus 28 convidando os leitores a se colocarem ao lado dos onze quando estes ouviram o mandato pela primeira vez. A palavra “todos/toda(s)” é usada quatro vezes no texto original, como, por exemplo, na versão Revista e Atualizada.

A. Toda a autoridade

A comissão é baseada numa transferência de autoridade do Pai para o Filho. O que era essa autoridade? Quando foi dada para Jesus? Como essa autoridade capacita os crentes a cumprirem o mandato? Jesus estava se referindo ao Pai que lhe outorgou autoridade espiritual para submeter, como inimigos derrotados, todos os poderes malignos e trazer como servos fiéis debaixo da Sua supremacia, pessoas de todas as tribos e línguas. Este tipo de autoridade é necessário para o mandato que segue. Com “fazei discípulos”, Ele quer dizer, recrutar seguidores novos como discípulos leais e ensináveis. Cristo espera mais do que um entendimento de Sua mensagem, ele espera obediência ao conjunto de todos os Seus mandamentos. Ele ordena que as pessoas sejam treinadas a viver sob o Seu Senhorio.

[cite] Leia Hawthorne (cap. 13, p. 119-121): Mandato na montanha.

B. Todos os Povos

O mandato para “discipular os povos” não se refere a alguma atividade ministerial em particular. Antes, discipular “todos os povos” precisa ser entendido como uma meta global conferida à Igreja. Cultivar e treinar indivíduos e pequenos grupos nas habilidades básicas do discipulado é uma tarefa maravilhosa e necessária, além de saber que em seguida, esta atividade será passada adiante para outros. Porém, este não é o significado central dessa passagem. De acordo com o escrito original, Mateus 28 ensina que haveria um momento na história em que um movimento para Cristo seria implantado dentro de todos os povos e etnias. Quando compreendemos esse princípio, podemos falar de “completar” a tarefa de evangelização mundial.

A comissão de Cristo é expressa na frase grega, panta ta ethne, que na maioria das traduções para o português traz o significado impreciso de “todas as nações”. A frase grega deve ser entendida em português como “todos os povos”. Baseado na maneira em que está sendo usada a frase panta ta ethne, podemos descartar duas possíveis interpretações e afirmar uma terceira:

Países? São os ethne nações geopolíticas ou países? Este é provavelmente o mal-entendido mais comum em nossos dias. Jesus não pensava em países politicamente definidos. Os primeiros ouvintes não entenderam assim as palavras gregas na Grande Comissão.

Gentios em geral? Jesus estava se referindo aos Gentios em geral? Outro mal-entendido é que Jesus estava simplesmente enviando Seus discípulos para fora das fronteiras de Israel, aos não judeus. A maneira pela qual a frase panta ta ethne é usada em outras passagens bíblicas não sustenta essa visão. A palavra ethnos no singular nunca é usada para “Gentios em geral”, mas sempre se refere a um grupo étnico. O uso no plural, às vezes, pode significar Gentios, mas a frase completa panta ta ethne, é sempre usada para descrever grupos étnicos definidos por raça, língua ou cultura.

Grupos de povos? A interpretação de panta ta ethne, com o maior apoio do uso no Novo Testamento, é que Jesus visava os “grupos de povos” (grupos étnicos) do mundo como eles tendem a se definir a si mesmos: por língua, linhagem ou fatores socioculturais.

[cite] Continue lendo Hawthorne (cap. 13, p. 122-123): Mandato na montanha (da seção “Todas as nações” até “Todas as coisas que vos tenho ordenado”).

C. Tudo que eu ordenei

Duas atividades específicas, batizar e ensinar, definem o que significa “discipular todos os povos”. Com o ministério de João Batista como pano de fundo para o mandamento de Jesus, o batismo deveria marcar uma mudança de lealdade, uma preparação para a vinda do Messias. O batismo forma uma comunidade de fiéis ao Deus que se revelou completamente pelo Seu nome – como o Pai que enviou Seu Filho e dá o Seu Espírito Santo. Neste contexto, “ensinar” vai além de apenas educar as pessoas, fazendo-as conhecedoras dos mandamentos de Jesus, mas refere-se ao trabalho de treinar pessoas a viverem em obediência diária e vital a Jesus. Essas duas facetas — fidelidade proclamada ao Deus da Bíblia e obediência crescente a Cristo como Senhor — formam o cerne do que significa estabelecer comunidades do Reino, que chamamos de igrejas.

D. Todos os dias

Esta frase revela claramente que Jesus creditava um mandato para todos os dias e todos os crentes. Não é um mandamento que uma pessoa sozinha pode cumprir, é um mandato que só pode ser cumprido coletivamente.

[cite] Continue lendo Hawthorne (cap. 13, p. 123-125): Mandato na montanha.

[cite] Leia em sua Bíblia: Apocalipse 5.1-14, Daniel 7.9-14 e Salmo 110 (a passagem do AT mais citada no NT). Como essas passagens o ajudam a entender melhor Mateus 28.18? Que diferença faz para sua obediência diária à Grande Comissão? Como é saber que existe tal autoridade por trás dela?

9. FOCO EM COMPLETAR A TAREFA

A. A prioridade de Povos

A Grande Comissão define a tarefa em termos de grupos de povos. Em nossos dias, muitos têm reconhecido a importância de focar em grupos de povos, no entanto, precisamos nos certificar de que estamos fazendo isso pelo melhor motivo. Pode parecer importante priorizar os grupos de povos porque eles estão repletos de pe ssoas perdidas que ainda não ouviram o evangelho. Essa consideração, embora significativa, não é nem de longe tão importante quanto abordar os grupos de povos do ponto de vista estratégico do cumprimento da tarefa de evangelizar todos os grupos de povos do mundo.

Completar totalmente a tarefa exige que em cada um dos grupos de povos, em algum ponto da história, exista um movimento de discípulos batizados e obedientes, capazes de evangelizar todo o seu povo. Até que haja tais movimentos em cada povo, não teremos cumprido a ordem que Cristo nos deu. Isso significa que não importa exatamente o número de indivíduos desses grupos de povos. Se um grupo possui dez mil ou dez milhões, a prioridade estratégica é virtualmente a mesma no que diz respeito à finalização total do mandato global.

A prioridade estratégica dos povos “não alcançados” não é que eles sejam os povos mais carentes. Embora eles frequentemente sejam necessitados em todos os sentidos, a prioridade estratégica dos povos não alcançados é que eles carecem de um movimento de discipuladores de algum tipo. Eles não são os povos mais carentes, eles são os povos restantes na tarefa que Cristo nos entregou.

B. A Grande Comissão como Realização Histórica com o Grande Mandamento como Constante Imperativo

Esses dois imperativos não devem ser considerados equivalentes ou concorrentes.

Ambos são para Deus. Os dois imperativos de amar ao próximo e discipular as nações têm o mesmo ponto central: ambos são para Deus. Mateus 28 mostra discípulos que invocam e obedecem a Deus. O ponto principal de Mateus 22 é que Deus seria amado de todo o coração, alma, mente e forças.

Uma Diferença Crucial. Os dois imperativos importantes são diferentes, porém, em uma maneira crucial: Mateus 28 convoca para a realização histórica de uma tarefa, cumprida no decorrer de muitas gerações. Mateus 22 ordena que as pessoas amem a Deus e aos outros em todo o tempo e de todas as maneiras.

Uma tarefa não acontece sem a outra. O mundo não pode ser evangelizado sem cristãos que amem a seu próximo. Contudo, não haverá amor a Deus e ao próximo em muitas comunidades sem o cumprimento da tarefa de criar movimentos de pessoas comprometidas em obedecer aos mandamentos de Cristo.

[cite] Leia na plataforma Hawthorne: A Grande Comissão e o Grande Mandamento

10. DISCIPULANDO TODOS OS POVOS

Temos visto que a palavra grega para “fazer discípulos” requer um objeto direto para fazer sentido. Em Mateus 28:19-20, o objeto direto da frase é o que traduzimos como “todas as nações”. John Piper examina o significado grego por trás dessas palavras. Ele faz isso com uma simplicidade metódica que facilita a compreensão, de modo que uma pessoa não precisa ser um erudito de grego para entender o impacto da frase panta ta ethne (πάντα τὰ ἔθνη)

A. Comparando o uso singular com o do plural.

A palavra grega ethnos sempre significa um grupo de povo definido por uma língua ou linhagem, quando usado no singular. O uso do plural raramente é referente aos gentios em geral. A grande maioria do uso da palavra se refere a grupos de povos.

B. As referências Cruzadas do Antigo Testamento.

Das cinco repetições do pacto com Abraão, duas delas (Gn. 12:1-3; 28:14) usam o termo khol mishpahot. Esta frase se refere até mesmo a grupos menores do que a palavra grega ethnos, como os clãs e as tribos pequenas. As outras três repetições da promessa (Gn. 18:18; 22:18; 26:4) são traduzidas na versão grega do Antigo Testamento (a Septuaginta, LXX) com a frase panta ta ethne. E essas passagens são as que Pedro se refere em Atos 3:25.

Piper conclui que a Grande Comissão define a tarefa de discipular os grupos de povos identificados por língua, linhagem ou barreiras tribais. O peso da evidência exclui a ideia de que Jesus estava mandando apenas um alcance mais abrangente apenas para fora dos não-judeus no geral, ou um alcance apenas aos países politicamente identificados. Esta aclaração é importante porque o mandato que nos foi dado é uma tarefa a ser completada. Para completar o nosso mandato, nós devemos compreender o objetivo que devemos alcançar.

[cite] Leia Piper (dentro do cap. 13, p. 120): Todas as nações

As palavras do Senhor são fundamentais...

[cite] Como você pode responder à Grande Comissão? Será que é suficiente se esforçar para fazer tudo que pode para compartilhar o Evangelho pessoalmente? Ou será que Deus espera que sejamos colaboradores com outros para cumprir toda a tarefa? Como você receberá este mandato?

11. COM CRISTO OU IMITANDO A CRISTO? OS LIMITES DO NOSSO MANDATO

Obter nosso mandato à partir do exemplo de Cristo pode ser complicado. É muito fácil encontrar uma agenda própria em alguma palavra ou obra de Jesus. Lesslie Newbigin reflete sobre João 20.21 e diz que quando executamos a missão que Jesus nos deu, necessariamente enfrentaremos os poderes do sistema deste mundo. Isto não quer dizer que somos chamados a implantar o Reino de Deus na sua plenitude, mas a produzir sinais do Reino – “a realidade do reinado de Deus”. A ideia central no artigo do Newbigin está na realidade da cruz – o símbolo principal do Reino na realidade deste mundo, que também deve ser a marca na vida dos seus discípulos.

[cite] Leia Newbigin (cap. 14, p. 126-127): O Reino de Deus na realidade do mundo

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO E AVANÇADO.

E DE CO$conteudo$
     where curso_id = v_curso and ordem = 12;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Guia de estudo — O Messias para o mundo$t$, $conteudo$Exaltamos a Jesus como Salvador pessoal, mas quando buscamos honrar a Cristo pelo valor da sua morte e ressurreição é possível perder de vista as realizações extraordinárias da Sua própria vida. Jesus não somente garantiu a salvação, mas ainda lançou um movimento que levaria essa mesma salvação a todas as partes do mundo. Ele escolheu os Seus seguidores e as Suas ações com intenções estratégicas e disse ao Seu Pai no fim de Sua vida: “Eu te glorifiquei na terra, completando a obra que me deste para fazer” (João 17.4 - NVI).

Jesus tinha somente um tema predominante em todo o Seu ensino: o Reino de Deus. Ele usou esse tema para chamar as pessoas a segui-lo e usou a mesma linguagem para irem além: enfrentar a batalha global contra o maligno nos estágios finais. O foco no Reino nos desafia quanto a questões de grande significado nessa batalha. Não é uma tarefa pequena estabelecer comunidades que representam a vida no Reino como postos avançados no meio da escuridão espiritual. Por causa da incomparável certeza quanto à invasão do Reino, não é raro encontrar servos de Cristo que amam suas próprias vidas tão pouco que nem a morte os ameaça. Essas pessoas oram e trabalham para nada menos do que a vinda do Reino na terra, assim como nos céus. O Reino de Deus é a essência de toda missão.

O mandato que Cristo nos deu explica detalhadamente a nossa tarefa de continuar a obra que Ele iniciou durante Sua vida na terra, até que ela seja completada entre todos os povos. É óbvio que perderemos o sentido da nossa missão se não entendermos como ele cumpriu a Sua própria missão. Para aqueles que abraçaram o Seu propósito, nenhuma frase se torna mais preciosa do que: “Assim como o Pai me enviou, eu os envio” (João 20.21 - NVI).

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Explicar o valor estratégico do foco de Jesus no povo Judeu.

2. Entender como Jesus ensinou e modelou o ministério aos Gentios.

3. Entender os conceitos bíblicos do Reino e do seu “mistério” em termos do Messias vir não uma, mas duas vezes.

4. Explicar o significado missionário deste mistério do Reino, ou seja, do conceito que já veio e que ainda virá.

5. Explicar a Grande Comissão em termos da expectativa de Jesus a respeito daquilo que precisa ser completado entre as nações.

6. Explicar o conceito da frase grega: “panta ta ethne” e o seu significado para a evangelização do mundo.

NO NÍVEL AVANÇADO:

7. Entender a estratégia de Jesus ao trabalhar com poucos líderes para promover um movimento de alcance mundial.

8. Explicar como Mateus 24.14 traz esperança e foco para completar a evangelização do mundo.

9. Orar com esperança e propósito estratégico para Deus restringir os poderes malignos para que as pessoas ouçam o Evangelho e esperem por uma mudança duradoura.

10. Explicar como a cruz está centrada na maneira pela qual os sinais do Reino serão manifestados.

Palavra chave:

[cite] MANDATO Viver debaixo de um mandato quer dizer que nos foi confiada uma tarefa de importância permanente. Mandatos não são ordens. Por ordens diretas designamos pequenas tarefas ou afazeres diários. Um mandato, por outro lado, transfere autoridade e responsabilidade para alcançar alvos de interferência histórica. Deus confiou a Cristo, e com Ele à Sua Igreja, o mandato de cumprir o Seu propósito para toda a história.

1. O FOCO ESTRATÉGICO DE JESUS

Jesus atuou com um propósito estratégico. Ele não somente modelou o interesse que Deus tem pela evangelização mundial, mas também preparou, ou propôs, um movimento dinâmico, multiplicador, capaz de evangelizar todo o mundo.

A. A Concentração de Jesus no Povo Judeu

Jesus nasceu dentro de um mundo como o nosso, dividido por tensões étnicas e religiosas. Ele encarou hostilidade desde os primeiros momentos do seu ministério público, em parte porque desafiava os conceitos do Seu próprio povo sobre Seu papel no plano de Deus. O povo judeu foi escolhido por Deus para alcançar os demais, mas ele guardou a mensagem com atitudes etnocêntricas e agiu com exclusividade.

Jesus trabalhou dentro dos limites do Seu povo, para oferecer o máximo de oportunidade e para compreender Sua mensagem e submeter-se a Deus. Por exemplo, enviou os doze primeiramente às “ovelhas perdidas da casa de Israel” acrescentando que eles não se dirigissem “aos Gentios” (Mt 10.5-6). Ao mesmo tempo, porém, exerceu ministério notável entre as pessoas desprezadas que viviam à margem da sociedade judaica (ex. os publicanos, prostitutas e pessoas possessas).

B. O Cuidado de Jesus com os Gentios

Os Evangelhos relatam que Jesus também tinha um cuidado profundo com os não judeus. Ele nunca recusou uma oportunidade de ministrar aos gentios quando o buscavam.

Mais tarde, Jesus enviou os setenta “a todas as cidades e lugares para onde ele estava prestes a ir” (Lc 10.1). Por somar setenta, o número das nações ou povos para os israelitas daquela época, é provável que Jesus estivesse prefigurando a eventual comissão para evangelizar cada lugar e povo na face da terra.

O ensino de Jesus ao longo do Seu ministério sempre enfatizou a abrangência global do coração de Deus. A Grande Comissão não era um acréscimo em cima da hora no seu ensino. Quando olhamos para o relato todo, tudo o que Jesus fez e disse culminou justamente na Grande Comissão.

Embora muitos judeus o rejeitassem, uma porção substancial do povo judeu o recebeu como Messias ao final do Seu ministério. O desejo de Deus em fazer do povo hebreu uma luz para as nações verdadeiramente se cumpriu.

[cite] Leia na platafomra Cornell Goerner: Jesus e os gentios (desde a seção “Primeiro aos judeus” até o final do artigo.)

2. A ESTRATÉGIA DE JESUS

Robert Coleman, em seu livro clássico “O Plano Mestre de Evangelismo”, aponta para o fato de que Jesus selecionou algumas pessoas, as formou e as capacitou como líderes num movimento que impactaria toda a terra. A estratégia de Jesus focalizou em:

Reproduzir caráter. Jesus sabia que as pessoas precisavam ser “imbuídas de Sua vida” para refletir e reproduzir o Seu caráter. Assim, Ele se concentrou em derramar a Sua própria vida em alguns que fariam a mesma coisa com outros.

Reproduzir estrutura. Jesus sabia que a única maneira de alcançar o mundo era lançar um movimento que se reproduzisse em si mesmo. Uma igreja que se multiplicava continuaria a expandir em “círculos cada vez maiores”, até que as multidões da terra tivessem ouvido o Evangelho.

Coleman observa que para os discípulos a ordem da evangelização mundial era “progressivamente esclarecida ao longo da convivência com o Mestre, até que finalmente foi expressa em termos claros” na Grande Comissão.

[cite] Leia Coleman (cap. 11, p. 107-111): O plano do Mestre.

3. VENHA O TEU REINO

Na introdução do seu artigo O evangelho do Reino, George Eldon Ladd explica que, ao contrário de muitos conceitos antigos e modernos, a fé cristã expressa sua esperança no Reino de Deus. Os profetas do Antigo Testamento anunciaram o dia do juízo final, depois do qual os homens irão viver juntos e em paz. Nesta situação, não somente os problemas da sociedade humana, mas os que envolvem o meio ambiente também serão resolvidos.

Jesus começou Seu ministério público com as seguintes palavras: “Arrependam-se, pois o Reino dos céus está próximo” (Mateus 4.17 – NVI). O tema da vinda do Reino era fundamental para Sua missão. Verificamos isso nos mais variados aspectos: no ensino (Mt 5.20; 7.21), nas obras (Mt 12.28), nas parábolas (Mt 13.11), na oração (Mt 6.10), nas palavras proféticas (Lc 22.22-30; Mt 25.31,34) e ainda no ensino depois da Sua ressurreição (At 1.3).

4. CONCEITOS BÁSICOS DO REINO

A. O Significado de “Reino”

Muitas vezes usamos a palavra “reino” para designar o domínio geográfico de um rei ou as pessoas pertencentes a tal região (um território e seus cidadãos). Mas a Bíblia usa o termo de um modo diferente e mais dinâmico: “reino” é a dignidade, a autoridade e a soberania exercidas por um rei, mais do que sua propriedade real.

B. O “Reino de Deus”

Refere-se ao reinado de Deus propriamente dito, à Sua autoridade, ao seu governo universal, à sua soberania sobre toda a terra e ao direito de governar baseado em Sua grandeza, poder e glória. Portanto, a oração “venha o teu Reino” é um pedido para que Deus “manifeste sua soberania e poder reais, dispersando todo inimigo da justiça e de seu governo divino, que só Deus seja o Rei sobre todo o mundo” (Ladd, p. 84).

5. CONFLITOS BÁSICOS DO REINO

A. O Mistério do Reino

A surpresa que define o mistério estava nas duas vindas do Messias: a que já se esperava viria não uma, mas duas vezes. Ele viria na glória resplandecente como o Filho do Homem (Daniel 7). Mas esta vinda foi precedida por Sua primeira vinda em humildade e forma escondida de Servo Sofredor de Deus (Isaías 42, 49, 53). Jesus usou a ideia do “mistério do Reino” para descrever um tempo de misericórdia para as nações antes do juízo final. Da perspectiva do Antigo Testamento, o Reino de Deus é visto como somente um evento cataclísmico do juízo de Deus sobre os seus inimigos, seguido por um tempo de paz e poder da parte de Deus.

[cite] A Visão do Reino no Antigo Testamento

[cite] A era vindoura

[cite] A vinda do

[cite] Messias

[cite] A presente era

[cite] O Messias introduz o Dia do Senhor caracterizado por Paz e Poder

A primeira vinda de Jesus: O Reino já chegou, mas opera de maneira escondida, quebrando o poder satânico, livrando pessoas de todas as nações do domínio e do poder do maligno e oferecendo as bênçãos espirituais do governo de Deus para todos.

A segunda vinda, no final: Jesus virá abertamente, e à vista de todo o mundo, esmagará todos os poderes do mundo, destruirá toda tentativa humana de usurpar o legítimo governo de Deus, purificará a terra de todo pecado e do maligno. Esta visão cumpre a perspectiva do Antigo Testamento.

[cite] O Mistério do Reino A era vindoura

[cite] A primeira vinda A segunda vinda

[cite] de Cristo de Cristo

[cite] A presente era

[cite] Messias Vindo Duas Vezes

B. A Vitória do Reino

O reino de Deus é uma vitória progressiva sobre o domínio satânico, através da qual pessoas de todas as nações são resgatadas do poder das trevas. Esta “presente era perversa” já foi invadida pela “era vindoura” do reino de Deus. Satanás já foi derrotado, mas foi destinado a ser destruído na “era vindoura”. Vivemos na sobreposição das eras. Trabalhamos entre o “já” da primeira vinda de Jesus e o “ainda não” da sua segunda vinda. O tempo entre as duas vindas é fundamentalmente um tempo de conflito resultante da sobreposição das eras.

A tarefa missionária da Igreja (evangelizar as nações) é a razão primária deste período interino. A vitória do Reino está sendo alcançada em três grandes atos:

A primeira vinda de Cristo: quebrando o poder de Satanás – a missão de Jesus na terra através da sua vida, morte e ressurreição.

Entre as vindas: desfazendo as obras de Satanás – Jesus continua sua missão às nações, trabalhando com e por meio da Igreja.

A segunda vinda de Cristo: destruindo o reino de Satanás – Cristo virá em plena glória.

[cite] Leia Ladd (cap. 9, p. 84-88): O evangelho do Reino (desde a seção “O mistério do Reino” até a seção “O evangelho do Reino”).

6. O MANDATO DO REINO

George Ladd reconhece a enorme força do mandato em Mateus 24.14. Enfatizamos este versículo não porque estamos predizendo o tempo específico da volta de Cristo, mas porque Deus aparentemente tem a intenção de esperar até que todos os povos tenham a oportunidade de responder a um testemunho adequado do Evangelho do Reino.

A. A Mensagem do Reino

O Evangelho do Reino declara e demonstra o triunfo de Deus sobre os três inimigos que têm provocado a ruína das pessoas através da história: a morte, Satanás e o pecado. Foram derrotados na Sua primeira vinda, serão destruídos na Sua segunda vinda.

O Evangelho do Reino anuncia o que Deus tem feito e continua fazendo para conquistar os seus inimigos (o pecado, a morte e o diabo). Deus tem a intenção de trazer cura substancial e transformação duradoura no presente, e promover vida eterna no Reino eterno. O Evangelho do Reino não é somente uma proclamação, mas é uma promessa do que Deus fará para reconciliar todas as coisas debaixo do reinado de Cristo.

B. A Missão do Reino

Mateus 24.14 é o único versículo da Bíblia que diz, “e então virá o fim”. A evangelização do mundo é uma condição explícita para o seu retorno. O Evangelho do Reino deve ser proclamado em toda a terra, e então, somente depois virá o fim. O que representa um “testemunho” adequado ou quem representa “todos os povos” ,no entendimento de Cristo, não pode ser discernido com precisão. Não deveríamos levar a sério qualquer barreira significativa entre povos que possa bloquear o fluxo do Evangelho e evitar que algum dos “povos” mencionados em Mateus 24.14 seja esquecido? Não deveríamos trabalhar para estabelecer o “testemunho” mais pleno possível – uma comunidade de obediência debaixo do senhorio de Cristo?

Sentido para a História. A verdade de que Deus mantém a história aberta para que a Igreja complete a sua tarefa faz sentido à história e confere um significado enorme à obediência da Igreja.

Motivo do Reino. Considerando a verdade de que a vinda do Messias seja, de certa forma, dependente da Igreja proclamar o Evangelho do Reino a todos os povos, então, temos uma maior

Motivação: a vitória final espera a conclusão da tarefa. Não existe maior esperança! Ladd tanto pergunta quanto responde, “Você ama a volta do Senhor?” Então, fará tudo que puder para levar o Evangelho ao mundo todo.

[cite] Continue lendo Ladd (cap. 9, p. 88-97): O evangelho do Reino (da seção “O evangelho do Reino” até o final).

7. A ORAÇÃO DO REINO

A essência da intercessão, assim como ensinada por Jesus, é argumentar uma causa no tribunal de Deus. Não é uma questão de explicar ou de se submeter ao maligno, mas sim, de lutar contra ele. O teólogo proeminente David Wells expõe algumas pressuposições que estão profundamente enraizadas em um nível de cosmovisão. Oramos pouco, porque não cremos que surtirá efeito contra o mal que vemos no mundo. Mas Wells declara que a cosmovisão judaico-cristã nega que o mal que encontramos na terra seja a vontade e o plano de Deus. Por isso Jesus encarregou os seus seguidores a “rebelarem-se” contra o status quo através da intercessão. Devemos orar para que o Seu nome seja honrado, santificado e abençoado, até nos lugares onde esse nome é negado. Devemos pedir que o governo do Seu Reino se torne efetivo, mesmo onde ele seja desafiado, e que Sua vontade seja feita mesmo onde enfrente oposição de Seus inimigos.

[cite] Leia Wells (cap. 25, p. 190-193): Oração: rebelião contra o status quo.

8. O MESSIAS NA MISSÃO DO REINO

Imagine Jesus lendo a Bíblia dele. A quais conclusões ele chegaria sobre os propósitos de Deus e a sua própria parte neles? Não há dúvida de que quando Jesus começou Seu Ministério, o Reino de Deus era mais que um tópico qualquer de seus ensinamentos. A realidade do Reino de Deus era a base e montou o cenário para tudo o que Jesus fez, falou e orou. Ele sabia que Ele era o personagem principal na batalha global entre o bem e o mal. Ele sabia que Ele havia sido enviado para a guerra do Reino. Quando Jesus envia os seus discípulos, Ele lhes deu uma imagem clara do drama em que Deus está envolvido, guerreando para e em favor da redenção das nações.

A. O Dia do Senhor.

Cornell Goerner mostra como o livro de Malaquias colabora para mostrar a visão do ministério tanto de João Batista como de Jesus.

1. O Dia do Juízo de Deus. Malaquias havia avisado Israel que o juízo de Deus cairia primeiro sobre eles ao invés das nações, os quais eram vistos como inimigos de Deus. Mas, por que juízo sobre Israel? Por causa do desejo de Deus de ser adorado entre todos os povos (Mal. 1:10-11). Israel havia falhado nos mandamentos mais básicos, os de adoração e temor ao nome de Deus (Mal. 2:1-3; 4:1-6).

2. As Advertências de João sobre o Reino. Malaquias descreve uma visão clássica do Antigo Testamento sobre o juízo de Deus, chegando com um único golpe de poder destrutivo contra os inimigos do Senhor. João Batista advertiu o povo da vinda de um enorme juízo.

3. As Palavras de Jesus sobre o Reino. Jesus continuou com essa mesma mensagem, chamando o povo ao arrependimento porque o momento decisivo da história estava prestes a chegar (“o tempo se cumpriu, o Reino dos céus é chegado; arrependam-se e creiam no evangelho” Marcos 1:15). Ao observarem a vinda de Jesus, a expectativa de João Batista e dos outros era de que o Messias confrontasse corajosamente os líderes, sacerdotes e poderes governantes de acordo com o modelo de Malaquias (Mal. 3:1-5), ao ponto de ir contra o domínio do Império Romano.

[cite] Leia na plataforma Cornell Goerner, Jesus e os Gentios, Desde o início até o final da seção “Malaquias e Mateus”

B. A surpresa: o Dia de Misericórdia para as Nações.

Patrick Johnstone nos ajuda na compreensão de um dos primeiros atos do ministério público de Jesus. Ele se encontra em Lucas 4:14-30. Abra sua Bíblia nessa passagem, bem como para Isaías 61:1-2, enquanto lê as sugestões de Johnstone sobre como o idioma original poderia ser traduzido. Pense o possível significado da abrupta parada de Jesus no meio de uma linha de poesia hebraica. Qual era a ideia popular do “dia da vingança” com relação às nações?

Lembre-se do contexto que examinamos sobre a guerra apocalíptica, o qual esperava a eclosão de um julgamento de Deus sobre as nações. Os habitantes da cidade estavam pensando no “dia da vingança” na linha final da profecia como um fim há muito esperado da opressão romana. Ao omitir essa frase final, Johnstone diz que Jesus estava, de fato, mudando o esquema do fim dos tempos. Ele estava declarando que Deus estava dando um tempo de misericórdia aberta a todos. Justamente quando o povo começou a compreender o que Jesus queria dizer ao interromper a leitura, Jesus confirmou os seus pensamentos, dizendo: “Hoje se cumpriu esta escritura”.

Eles compreenderam que Jesus estava abrindo um tempo de misericórdia. Estas eram as “palavras de graça” que vinham de seus lábios. Mas Jesus não os deixou apenas pensando que Deus havia prolongado o tempo de misericórdia exclusivamente para o povo de Israel. Jesus deixou bem claro que a misericórdia de Deus estava direcionada às nações. E foi essa declaração que fez com que eles quisessem matá-lo.

[cite] Leia na plataforma Johnstone: Uma Reação Violenta diante da Misericórdia

Goerner também chama a atenção para esse incidente em Lucas 4. Jesus estava demonstrando desde o início do seu ministério que o propósito do Reino de Deus era para todas as nações. Goerner diz que Jesus certamente “aspirava por dominação mundial”, mas ele rejeitou os métodos de poder, escolhendo o oposto, um “caminho de sofrimento e redenção”.

[cite] Leia na plataforma Goerner: Jesus e os Gentios, a seção “Desde o início”

C. A surpresa do Messias.

Como Ladd descreveu anteriormente (“O Evangelho do Reino”, p. 86), Jesus surpreendeu e desapontou João Batista. Ao invés de uma conquista sobre os poderes políticos, Jesus declarou que o tempo presente seria uma época de cura dos oprimidos e de pregação das boas novas aos pobres. E logo ficou claro para seus discípulos que as curas e pregação de Jesus aos pobres era o começo da batalha contra o mal e a proclamação do evangelho aos pobres por todas as nações. Que tipo de Messias era Ele? Muitos do tempo de Jesus se perguntavam o mesmo que João, dizendo “Você é aquele que haveria de vir, ou devemos esperar algum outro?” (Mat. 11:3). Três modelos de Messias, ou de “aquele que haveria de vir”, eram comuns em Israel. O primeiro era o modelo do Filho de Davi, o qual seria um grande líder militar, reunindo as tropas de Israel de forma miraculosa para acabar com todos os seus inimigos, bem parecido com o Davi antigo (Sal. 89:20-29 e muitos outros). Dois outros modelos eram encontrados no Antigo Testamento: o do Filho do Homem e o Servo Sofredor.

1. O Filho do Homem. Jesus usou esse título messiânico deliberadamente e frequentemente. Ele encontrou esse título em Daniel, que viu Deus inaugurando o reinado do Filho do Homem como rei de todos os povos e reinos. As ramificações globais dessa visão eram claras para todas as pessoas da época de Jesus.

[cite] Leia na plataforma Goerner: Jesus e os Gentios a seção “Filho do homem”

2. O Servo Sofredor. Jesus não cumpriu as expectativas gerais do povo de um governante conquistador como Filho de Davi nem uma tempestade cataclísmica de juízo vindo do Filho do Homem. Jesus sabia que havia outro modelo do Messias prometido e do Reino. E ele encontrou esse modelo nas páginas de Isaías para se referir ao Servo: Isaías 42:1-12; 49:1-6; 52:13-53:12. Estas passagens nos dizem que o Messias vai sofrer, que o seu domínio se estenderá a todas as nações e que Ele trará o reino de formas não-convencionais entre os pobres ao invés de conquistar os poderosos.

9. A GRANDE COMISSÃO

Não deveria ser surpresa que cada um dos Evangelhos, tanto quanto o Livro de Atos, relata a expressão direta do mandato para completar a evangelização mundial.

Marcos 16.15-16 é um imperativo direto para comunicar o Evangelho a todas as pessoas em todos os lugares. O resultado é descrito como crença e salvação ou descrença e perdição eterna.

Lucas 24.46-49 inclui o resumo de Jesus daquilo que as Escrituras prometem que acontecerá entre todas as nações. Ele indica que os Seus seguidores devem ser testemunhas que completarão a proclamação do perdão do pecado a todas as nações.

Mais do que um mandamento, Atos 1.8 é promessa que os discípulos seriam Suas testemunhas, no entanto, ele carrega a força de um mandato de viver de acordo com toda a intenção de Cristo para que sejam Suas testemunhas em todas as partes do mundo (mais detalhes na próxima lição).

João 20.21-23 não tem um mandamento direto quanto às nações, mas no contexto, Jesus nos presenteia com o Espírito Santo de Deus e declara que somos enviados da mesma maneira e para o mesmo propósito que Ele foi.

Mateus 28.18-20. Geralmente conhecido como a “Grande Comissão” é a expressão mais clara do mandato de Cristo para a evangelização mundial.

Steven Hawthorne descreve Mateus 28 convidando os leitores a se colocarem ao lado dos onze quando estes ouviram o mandato pela primeira vez. A palavra “todos/toda(s)” é usada quatro vezes no texto original, como, por exemplo, na versão Revista e Atualizada.

A. Toda a autoridade

A comissão é baseada numa transferência de autoridade do Pai para o Filho. O que era essa autoridade? Quando foi dada para Jesus? Como essa autoridade capacita os crentes a cumprirem o mandato? Jesus estava se referindo ao Pai que lhe outorgou autoridade espiritual para submeter, como inimigos derrotados, todos os poderes malignos e trazer como servos fiéis debaixo da Sua supremacia, pessoas de todas as tribos e línguas. Este tipo de autoridade é necessário para o mandato que segue. Com “fazei discípulos”, Ele quer dizer, recrutar seguidores novos como discípulos leais e ensináveis. Cristo espera mais do que um entendimento de Sua mensagem, ele espera obediência ao conjunto de todos os Seus mandamentos. Ele ordena que as pessoas sejam treinadas a viver sob o Seu Senhorio.

[cite] Leia Hawthorne (cap. 13, p. 119-121): Mandato na montanha.

B. Todos os Povos

O mandato para “discipular os povos” não se refere a alguma atividade ministerial em particular. Antes, discipular “todos os povos” precisa ser entendido como uma meta global conferida à Igreja. Cultivar e treinar indivíduos e pequenos grupos nas habilidades básicas do discipulado é uma tarefa maravilhosa e necessária, além de saber que em seguida, esta atividade será passada adiante para outros. Porém, este não é o significado central dessa passagem. De acordo com o escrito original, Mateus 28 ensina que haveria um momento na história em que um movimento para Cristo seria implantado dentro de todos os povos e etnias. Quando compreendemos esse princípio, podemos falar de “completar” a tarefa de evangelização mundial.

A comissão de Cristo é expressa na frase grega, panta ta ethne, que na maioria das traduções para o português traz o significado impreciso de “todas as nações”. A frase grega deve ser entendida em português como “todos os povos”. Baseado na maneira em que está sendo usada a frase panta ta ethne, podemos descartar duas possíveis interpretações e afirmar uma terceira:

Países? São os ethne nações geopolíticas ou países? Este é provavelmente o mal-entendido mais comum em nossos dias. Jesus não pensava em países politicamente definidos. Os primeiros ouvintes não entenderam assim as palavras gregas na Grande Comissão.

Gentios em geral? Jesus estava se referindo aos Gentios em geral? Outro mal-entendido é que Jesus estava simplesmente enviando Seus discípulos para fora das fronteiras de Israel, aos não judeus. A maneira pela qual a frase panta ta ethne é usada em outras passagens bíblicas não sustenta essa visão. A palavra ethnos no singular nunca é usada para “Gentios em geral”, mas sempre se refere a um grupo étnico. O uso no plural, às vezes, pode significar Gentios, mas a frase completa panta ta ethne, é sempre usada para descrever grupos étnicos definidos por raça, língua ou cultura.

Grupos de povos? A interpretação de panta ta ethne, com o maior apoio do uso no Novo Testamento, é que Jesus visava os “grupos de povos” (grupos étnicos) do mundo como eles tendem a se definir a si mesmos: por língua, linhagem ou fatores socioculturais.

[cite] Continue lendo Hawthorne (cap. 13, p. 122-123): Mandato na montanha (da seção “Todas as nações” até “Todas as coisas que vos tenho ordenado”).

C. Tudo que eu ordenei

Duas atividades específicas, batizar e ensinar, definem o que significa “discipular todos os povos”. Com o ministério de João Batista como pano de fundo para o mandamento de Jesus, o batismo deveria marcar uma mudança de lealdade, uma preparação para a vinda do Messias. O batismo forma uma comunidade de fiéis ao Deus que se revelou completamente pelo Seu nome – como o Pai que enviou Seu Filho e dá o Seu Espírito Santo. Neste contexto, “ensinar” vai além de apenas educar as pessoas, fazendo-as conhecedoras dos mandamentos de Jesus, mas refere-se ao trabalho de treinar pessoas a viverem em obediência diária e vital a Jesus. Essas duas facetas — fidelidade proclamada ao Deus da Bíblia e obediência crescente a Cristo como Senhor — formam o cerne do que significa estabelecer comunidades do Reino, que chamamos de igrejas.

D. Todos os dias

Esta frase revela claramente que Jesus creditava um mandato para todos os dias e todos os crentes. Não é um mandamento que uma pessoa sozinha pode cumprir, é um mandato que só pode ser cumprido coletivamente.

[cite] Continue lendo Hawthorne (cap. 13, p. 123-125): Mandato na montanha.

[cite] Leia em sua Bíblia: Apocalipse 5.1-14, Daniel 7.9-14 e Salmo 110 (a passagem do AT mais citada no NT). Como essas passagens o ajudam a entender melhor Mateus 28.18? Que diferença faz para sua obediência diária à Grande Comissão? Como é saber que existe tal autoridade por trás dela?

9. FOCO EM COMPLETAR A TAREFA

A. A prioridade de Povos

A Grande Comissão define a tarefa em termos de grupos de povos. Em nossos dias, muitos têm reconhecido a importância de focar em grupos de povos, no entanto, precisamos nos certificar de que estamos fazendo isso pelo melhor motivo. Pode parecer importante priorizar os grupos de povos porque eles estão repletos de pe ssoas perdidas que ainda não ouviram o evangelho. Essa consideração, embora significativa, não é nem de longe tão importante quanto abordar os grupos de povos do ponto de vista estratégico do cumprimento da tarefa de evangelizar todos os grupos de povos do mundo.

Completar totalmente a tarefa exige que em cada um dos grupos de povos, em algum ponto da história, exista um movimento de discípulos batizados e obedientes, capazes de evangelizar todo o seu povo. Até que haja tais movimentos em cada povo, não teremos cumprido a ordem que Cristo nos deu. Isso significa que não importa exatamente o número de indivíduos desses grupos de povos. Se um grupo possui dez mil ou dez milhões, a prioridade estratégica é virtualmente a mesma no que diz respeito à finalização total do mandato global.

A prioridade estratégica dos povos “não alcançados” não é que eles sejam os povos mais carentes. Embora eles frequentemente sejam necessitados em todos os sentidos, a prioridade estratégica dos povos não alcançados é que eles carecem de um movimento de discipuladores de algum tipo. Eles não são os povos mais carentes, eles são os povos restantes na tarefa que Cristo nos entregou.

B. A Grande Comissão como Realização Histórica com o Grande Mandamento como Constante Imperativo

Esses dois imperativos não devem ser considerados equivalentes ou concorrentes.

Ambos são para Deus. Os dois imperativos de amar ao próximo e discipular as nações têm o mesmo ponto central: ambos são para Deus. Mateus 28 mostra discípulos que invocam e obedecem a Deus. O ponto principal de Mateus 22 é que Deus seria amado de todo o coração, alma, mente e forças.

Uma Diferença Crucial. Os dois imperativos importantes são diferentes, porém, em uma maneira crucial: Mateus 28 convoca para a realização histórica de uma tarefa, cumprida no decorrer de muitas gerações. Mateus 22 ordena que as pessoas amem a Deus e aos outros em todo o tempo e de todas as maneiras.

Uma tarefa não acontece sem a outra. O mundo não pode ser evangelizado sem cristãos que amem a seu próximo. Contudo, não haverá amor a Deus e ao próximo em muitas comunidades sem o cumprimento da tarefa de criar movimentos de pessoas comprometidas em obedecer aos mandamentos de Cristo.

[cite] Leia na plataforma Hawthorne: A Grande Comissão e o Grande Mandamento

10. DISCIPULANDO TODOS OS POVOS

Temos visto que a palavra grega para “fazer discípulos” requer um objeto direto para fazer sentido. Em Mateus 28:19-20, o objeto direto da frase é o que traduzimos como “todas as nações”. John Piper examina o significado grego por trás dessas palavras. Ele faz isso com uma simplicidade metódica que facilita a compreensão, de modo que uma pessoa não precisa ser um erudito de grego para entender o impacto da frase panta ta ethne (πάντα τὰ ἔθνη)

A. Comparando o uso singular com o do plural.

A palavra grega ethnos sempre significa um grupo de povo definido por uma língua ou linhagem, quando usado no singular. O uso do plural raramente é referente aos gentios em geral. A grande maioria do uso da palavra se refere a grupos de povos.

B. As referências Cruzadas do Antigo Testamento.

Das cinco repetições do pacto com Abraão, duas delas (Gn. 12:1-3; 28:14) usam o termo khol mishpahot. Esta frase se refere até mesmo a grupos menores do que a palavra grega ethnos, como os clãs e as tribos pequenas. As outras três repetições da promessa (Gn. 18:18; 22:18; 26:4) são traduzidas na versão grega do Antigo Testamento (a Septuaginta, LXX) com a frase panta ta ethne. E essas passagens são as que Pedro se refere em Atos 3:25.

Piper conclui que a Grande Comissão define a tarefa de discipular os grupos de povos identificados por língua, linhagem ou barreiras tribais. O peso da evidência exclui a ideia de que Jesus estava mandando apenas um alcance mais abrangente apenas para fora dos não-judeus no geral, ou um alcance apenas aos países politicamente identificados. Esta aclaração é importante porque o mandato que nos foi dado é uma tarefa a ser completada. Para completar o nosso mandato, nós devemos compreender o objetivo que devemos alcançar.

[cite] Leia Piper (dentro do cap. 13, p. 120): Todas as nações

As palavras do Senhor são fundamentais...

[cite] Como você pode responder à Grande Comissão? Será que é suficiente se esforçar para fazer tudo que pode para compartilhar o Evangelho pessoalmente? Ou será que Deus espera que sejamos colaboradores com outros para cumprir toda a tarefa? Como você receberá este mandato?

11. COM CRISTO OU IMITANDO A CRISTO? OS LIMITES DO NOSSO MANDATO

Obter nosso mandato à partir do exemplo de Cristo pode ser complicado. É muito fácil encontrar uma agenda própria em alguma palavra ou obra de Jesus. Lesslie Newbigin reflete sobre João 20.21 e diz que quando executamos a missão que Jesus nos deu, necessariamente enfrentaremos os poderes do sistema deste mundo. Isto não quer dizer que somos chamados a implantar o Reino de Deus na sua plenitude, mas a produzir sinais do Reino – “a realidade do reinado de Deus”. A ideia central no artigo do Newbigin está na realidade da cruz – o símbolo principal do Reino na realidade deste mundo, que também deve ser a marca na vida dos seus discípulos.

[cite] Leia Newbigin (cap. 14, p. 126-127): O Reino de Deus na realidade do mundo

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO E AVANÇADO.

E DE CO$conteudo$, 12);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 13) then
    update aulas set titulo = $t$Lição 3 · Leitura — Goerner: Jesus e os Gentios$t$, conteudo = $conteudo$Jesus e os Gentios

H. Cornell Goerner

Temos tentado ler nossa Bíblia tal como Jesus a lia. Isto nos conduziu rapidamente por todo o Antigo Testamento, as únicas Escrituras de que Jesus dispunha. Em todas as três secções da Bíblia hebraica, os livros de Moisés, os Profetas e os Salmos, defrontamo-nos com a preocupação divina com as nações e povos da terra, e com Seu plano de tratar com eles por meio do Messias. Cremos que Jesus mentalmente "sublinhou" estas passagens em Sua Bíblia, e deliberadamente planejou cumpri-las com Sua vida, morte e ressurreição.

Voltando agora para o Novo Testamento, descobrimos nos Evangelhos que as palavras e obras de Jesus confirmam este conceito todo abrangente de Seu ministério. O Novo Testamento surge diretamente do Antigo, sem qualquer quebra de continuidade. No título característico que escolheu para Si mesmo, na estratégia de Seu ministério, e em Seus claros ensinos, é óbvio que Jesus tomou sobre Si uma missão em favor de toda a humanidade.

Malaquias e Mateus

Em nossas Bíblias o Evangelho de Mateus vem logo após Malaquias, o que é muito apropriado. Qualquer que seja a data deste último dos profetas, pelo menos dois ou três séculos se passaram desde que Deus falara a Seu povo através de Malaquias. Mesmo assim, ao fechar o Antigo Testamento e abrir o Novo, é como se apenas um intervalo de uns poucos dias houvesse ocorrido entre ambos os Testamentos. Mateus principia bem onde Malaquias havia terminado. E ninguém estava mais consciente disso do que Jesus. Sabia que viera cumprir o que Malaquias predissera.

Os quatro curtos capítulos de Malaquias são uma denúncia atrás da outra contra a nação de Israel, a advertência de um dia iminente de juízo a ser anunciado por um precursor e a ser, então, instituído pelo "mensageiro da aliança", o qual viria de repente ao templo e inauguraria uma nova era, não somente para o povo de Israel, mas para todo o mundo.

O anunciado julgamento foi chamado de "o Dia do Senhor". Este seria um "grande e terrível dia" de provações, ocasião em que os justos seriam separados dos ímpios assim como o ouro é refinado pelo fogo, assim como a sujeira é retirada da roupa pelo sabão que contém componentes cáusticos, assim como a palha é separada do trigo na eira, e assim como a árvore infrutífera é derrubada e consumida pelo fogo (Mal. 3:2; 4:1 , 5).

O juízo seria particularmente severo com Israel e seus líderes por causa de pecados específicos que foram denunciados: fraude e hipocrisia nos cultos de adoração (1:7-14); injustiça social (2:10); práticas religiosas pagās (2:11); divórcio (2:16); sonegação do dízimo (3:8-10). Mas, o profeta declara que, acima de tudo, a paciência de Deus está-se esgotando porque o povo, que se esperava que exaltasse a Yahweh e fizesse com que fosse reverenciado e adorado entre as nações do mundo, falhou nesta tarefa. Ao contrário, eles profanaram o nome de Deus e fizeram com que Deus fosse desonrado (1:5-14). Mas o propósito de Deus não será derrotado, pois, desde o oriente até o ocidente, por todo o mundo, Seu nome será exaltado entre as nações e, em todo lugar, orações e culto Lhe serão dedicados (1:11).

Achave para a compreensão de Malaquias está em 1:10-11:

Oxalá houvesse entre vós quem feche as portas, para que não acendêsseis debalde o fogo do meu altar. Eu não tenho prazer em vós, diz o Senhor dos Exércitos, nem aceitarei da vossa mão a vossa oferta. Mas desde o nascente do sol até ao poente é grande entre as nações o meu nome; e em todo lugar lhe é queimado incenso e trazidas ofertas puras; porque o meu nome é grande entre as nações, diz o Senhor dos Exércitos.

Malaquias adverte que Deus, por estar tão preocupado em ser exaltado entre as nações, está na iminência de agir. Primeiro enviará um mensageiro para lhe preparar o caminho (Mal. 3:1). Então Ele mesmo virá, na qualidade de mensageiro da aliança, e dará início ao período de juízo (Mal. 3:2-3). O precursor será um "Elias", um profeta veemente da destruição (Mal. 4:5). Se não se lhe der atenção, então é certo que sobrevirão juízo ardente e destruição.

Todos esses elementos de Malaquias se refletem no terceiro capítulo do Evangelho de Mateus. João Batista surgiu pregando: "Arrependei-vos, porque está próximo o reino dos céus" (Mat. 3:2). Este é o equivalente ao "Dia do Senhor" em Malaquias. A hora do julgamento divino está-se aproximando rapidamente. Esta é a "ira vindoura" (Mat. 3:7). João usa as mesmas figuras de linguagem que se encontram em Malaquias: o trigo e a palha devem ser separados. Para realçar que esse será um julgamento dos israelitas e não apenas dos gentios, tal como alguns judeus criam, João até mesmo declarou: "Não pensem que vocês escaparão porque são 'filhos de Abraão'. Eu lhes digo que Deus não depende de vocês. Se quiser, Ele é capaz de fazer surgirem 'filhos de Abraão' destas pedras. Ele usará outros se vocês não forem dignos. Vocês serão julgados e punidos, apesar da sua origem hebraica" (Mat. 3:9, paráfrase do autor).

Jesus assimilou esta mensagem de advertência à nação de Israel. Os Evangelhos nos ensinam que logo depois de Seu batismo, e a partir de então, Jesus começou a pregar e a dizer: "Arrependam-se antes que seja tarde demais. Há pouco tempo. O dia do juízo divino é iminente."

Jesus identificou João Batista com o Elias que Malaquias havia prometido. Logo depois do aprisionamento de João, Jesus declarou: "Porque todos os profetas e a lei profetizaram até João. E, se o quereis reconhecer, ele mesmo é Elias, que estava paravir.Quemtemouvidos,ouça"(Mat. 11: 13-15).

Jesus estava advertindo que uma importante página da história estava para ser virada. O último dos profetas fora enviado para pronunciar uma advertência final antes que o juízo caísse sobre a nação de Israel. Alguns meses mais tarde, após a morte de João Batista, Jesus mais uma vez identificou João como sendo o Elias predito por Malaquias:

Eu, porém, vos declaro que Eliasjá veio, e não o reconheceram, antes fizeram com ele tudo quanto quiseram. Assim também o Filho do homem há de padecer nas mãos deles. Então os discípulos entenderam que lhes falara a respeito de João Batista (Mat. 17:12-13).

Durante Sua última semana em Jerusalém, enquanto ensinava no templo, Jesus foi cumprindo conscientemente o que se acha escrito em Malaquias 3:1-2:

Eis que eu envio o meu mensageiro que preparará o caminho diante de mim; de repente virá ao seu templo o Senhor, a quem vós buscais, o Anjo da aliança a quem vós desejais; eis que ele vem, diz o Senhor dos Exércitos. Mas quem pode suportar o dia da sua vinda? e quem pode subsistir quando ele aparecer? Porque ele é como o fogo do ourives e como a potassa dos lavandeiros.

João Batista fora enviado como um mensageiro para preparar o caminho. Fizera seu trabalho. Agora o próprio Senhor viera anunciar uma Nova Aliança para substituir a Antiga, que fora quebrada. ("O Senhor, a quem buscais" não é Yahweh, mas o Messias esperado, o que é indicado pela palavra Adon no hebraico. O Senhor dos

Exércitos, que anuncia a vinda do Senhor (Adon) é Yahweh. Com Seu conhecimento de hebraico Jesus compreendia esta distinção.) O povo pensava que ansiava pela vinda do Messias, mas, na verdade, não estava preparado para Sua vinda nem para o julgamento que traria. Só aqueles que estavam espiritualmente preparados poderiam suportar Sua vinda.

Isto é o que significa fechar o Antigo Testamento e abrir o Novo Testamento. Jesus sabia que a aliança feita no Sinai fora quebrada repetidas vezes por um povo desobediente, e que, depois que uma longa sucessão de profetas que foram enviados para reconquistá-los havia falhado, a paciência de Deus estava-se esgotando. Uma nova aliança teria de ser selada com um remanescente fiel de Israel, que, então, chamaria as nações gentílicas ao arrependimento no nome do Messias, o juiz de vivos e mortos.

O juízo deve começar pela casa de Israel. Deve, então, ser proclamado a todas as nações. Este foi o sentido de urgência com que Jesus começou Seu ministério. Mateus cumpre Malaquias!

O Filho do Homem

Nada é mais revelador que o título pessoal que Jesus escolheu para Si mesmo. Vimos que Ele não apreciava a expressão "Filho de Davi", o título popular do Messias. Ele percebeu que era de fato "o Filho de Deus" mencionado no Salmo 2:7, e durante Seu julgamento perante o Sinédrio Ele o admitiu. Mas o título que usou durante todo o Seu ministério foi "Filho do homem". A expressão é usada mais de quarenta vezes nos Evangelhos, e em todas elas Jesus está Se referindo a Si mesmo. Os discípulos nunca a empregaram, mas chamavam-no de "Senhor" e "Mestre". Para Jesus, essas palavras eram quase um substituto para o pronome pessoal "eu". Vez após vez Ele disse: "O Filho do homem não tem onde reclinar a cabeça" (Mat. 8:20). "O Filho do homem tem sobre a terra autoridade para perdoar pecados" (Mat. 9:6). "O Filho do homem é senhor do sábado" (Mat. 12:8). "Então verão o Filho do homem vir nas nuvens, com grande poder e glória" (Mat. 1 3:26).

Jesus extraiu esta expressão de duas fontes principais: os livros de Ezequiel e Daniel. "Filho do homem" é um título distintivo empregado por Deus para designar o profeta Ezequiel, e ocorre oitenta e sete vezes. O hebraico é ben Adam, literalmente "Filho de Adão" ou "Filho da humanidade", Originalmente significava apenas "homem", em contraste com Deus, e lembrava Ezequiel de sua condição humilde. Mas à época de Jesus, a expressão havia-se tornado um título honorífico do Messias, e muitas passagens em Ezequiel foram idealizadas e interpretadas messianicamente. Enquanto lia o livro, Jesus deve ter ouvido Deus falar diretamente a Ele: "Filho do homem, eu te envio aos filhos de Israel, às nações rebeldes" (Ez. 2:3). "Filho do homem: Eu te dei por atalaia sobre a casa de Israel; da minha boca ouvirás a palavra, e os avisarás da minha parte" (Ez. 3:17).

Especialmente significativas para Jesus eram as passagens a respeito de um remanescente que seria poupado (6:8); do novo coração e espírito (11:19; 36:26-27); da nova e eterna aliança (37:26); e da promessa de que as nações gentílicas viriam a conhecer ao Senhor, Deus de Israel (37:28; 38:23; 39:7). Todas estas profecias seriam cumpridas por Ele, como Filho do homem.

Não pode haver qualquer dúvida de que Jesus tinha Daniel 7:13-14 na mente quando usou o título "Filho do homem". Nessa passagem há uma expressão aramaica, bar enash, em vez de ben Adam. Mas o sentido é semelhante, pois enash é uma palavra que designa a humanidade em geral, em contraste com um único indivíduo do sexo masculino. Nos comentários rabínicos e no pensamento popular a expressão já havia sido totalmente espiritualizada, tendo o sentido do homem ideal, quase divino em sua natureza. O livro de Enoque, um discurso apocalíptico de larga circulação durante o século primeiro, exaltou a figura do Filho do homem muito além da visão de Daniel. Mas não é necessário pressupor que Jesus tenha sido influenciado por Enoque. As palavras de Daniel são bem claras:

Eu estava olhando nas minhas visões da noite,

E eis que vinha com as nuvens do céu, um como o Filho do homem,

E dirigiu-se aoAncião de dias,

E o fizeram chegaraté ele.

Foi-lhe dado o domínio

E glória, e o reino,

Para que os povos, nações e homens de todas as línguas

O servissem;

O seu domínio é domínio eterno,

Que não passará,

E o seu reino

Jamais será destruído (7:13-14). Jesus sabia que isto só iria acontecer depois de Seu sofrimento e glorificação. Reivindicou o título para Si mesmo, dessa forma Se identificando não somente com o povo hebreu ou com a nação judaica, mas com toda a raça humana, com todas as famílias da terra. Sabia que era o Filho do homem e o Servo Sofredor.

Desde o Início

Como já tivemos oportunidade de ver, a visão de um reino universal foi parte integrante do plano de Jesus desde o início de Seu ministério. É conclusivo o fato de que uma das tentações no deserto envolvesse "todos os reinos do mundo e a glória deles" (Mat. 4:8). Jesus realmente aspirava ao domínio do mundo. Sua ambição de governar as nações não estava errada. A tentação significava tomar um atalho para atingir aquele nobre objetivo: era adotar os métodos do diabo. Ao rejeitar os métodos de Satanás, Jesus não renunciou ao propósito de ter autoridade mundial. Pelo contrário, escolheu o caminho do sofrimento e da redenção, que Ele encontrou esboçado nas Escrituras.

Seu primeiro sermão, em Nazaré, demonstra que Seu propósito de vida se estendia muito além da nação de Israel. Não Se surpreendeu que Seu próprio povo não recebesse Sua mensagem. "É sempre assim que tem sido", Ele disse. "Os profetas sempre encontraram maior fé entre os estrangeiros do que entre seu próprio povo" (Luc. 4:24, paráfrase do autor). E deu um exemplo: "Muitas viúvas havia em Israel no tempo de Elias...mas a nenhuma delas foi Elias enviado, senão a uma viúva de Sarepta de Sidom" (Luc. 4:25-26). Seus ouvintes conheciam o resto da história, contada em 1 Reis 17. Recebido em um lar gentílico, Elias realizou o notável milagre de suprir aquele lar de farinha e azeite, e mais tarde ressuscitou o filho da viúva - não de uma viúva judia, mas de uma gentílica!

Todavia Jesus não Se limitou a mencionar Elias. Com a história deste profeta, Jesus atirou sal nos sentimentos feridos de Seus ouvintes. Agora Ele cita Naamã, o sírio, que não era apenas um gentio, mas um líder militar, um capitão do exército sírio, o qual se encontrava àquela época em guerra com Israel e quase havia arrancado aquela pequena e infeliz nação do mapa (2 Reis 5:1-14). Apesar disso, embora houvesse muitos leprosos em Israel, "nenhum deles foi purificado, senão Naamã, o siro" (Luc. 4:27). Não havia ilustração mais dramática que pudesse ser dada de que a graça de Deus não estava limitada ao povo de Israel e de que os gentios freqüentemente demonstravam uma fé maior do que aqueles que eram considerados "filhos do reino". Não é de se admirar que os orgulhosos moradores de Nazaré tenham ficado furiosos com este jovem impetuoso, que insultou a nação e questionou a condição privilegiada que desfrutavam, de "Povo Escolhido" de Deus. Não fosse

Seu poder miraculoso, eles O teriam executado, atirando-O precipício abaixo (Luc. 4:28-30).

Ao Judeu Primeiro

Jesus possuía uma profunda convicção de uma missão especial à nação judaica. Demonstrou isto de maneira tão incisiva que algumas pessoas chegaram à conclusão de que Ele não pensava em qualquer missão além dos limites de Israel. Entretanto, uma análise cuidadosa de todas as Suas palavras e ações revela que isto era uma questão de estratégia: como Paulo mais tarde afirmou, sua missão era "ao judeu primeiro,etambémaogrego"(Rom. 1:16;2:10).

O interesse de Jesus por Israel ficou demonstrado nas instruções dadas. aos doze discípulos, quando os enviou em sua primeira missão de pregação. Disse: "Não tomeis rumo aos gentios, nem entreis em cidades de samaritanos; mas, de preferência, procurai as ovelhas perdidas da casa de Israel" (Mat. 10:5-6). A razão é óbvia. Havia pouco tempo e a catástrofe se aproximava da nação, caso não houvesse um urgente arrependimento. A necessidade era premente, mais para Israel do que para as nações gentílicas, cuja época de julgamento aconteceria mais tarde. De fato, neste mesmo contexto encontramos a predição de que o ministério dos discípulos de pregação se estenderia aos gentios: "Sereis levados à presença de governadores e de reis, para lhes servir de testemunho, a eles e aos gentios" (v. 18). Todavia devem se concentrar primeiro nas cidades judaicas, pois o tempo de oportunidade para elas é curto (v. 23).

Lucas fala de uma missão posterior de pregação, na qual outros setenta discípulos foram enviados dois a dois (Luc. 10:1). Tal como os doze apóstolos representam simbolicamente as doze tribos de Israel, os setenta simbolizam as nações dos gentios. Em Gênesis 10 temos a relação dos descendentes de Noé, setenta ao todo.

A tradição rabínica acreditava que este era o número total de nações espalhadas sobre a face da terra após a Torre de Babel, e mencionava constantemente os setenta povos gentílicos. Talvez Jesus tenha usado este número como meio de simbolizar o seu propósito de longo alcance. Os doze foram enviados para advertirem as tribos de Israel de um juízo iminente. Mais tarde os setenta foram enviados em uma missão de treinamento, como preparação para a missão derradeira, a missão a todo o mundo.

Contatos com Gentios

A maior parte do ministério público de Jesus aconteceu em território judaico. Levando em conta as circunstâncias, é surpreendente o número de contatos pessoais com gentios registrados nos Evangelhos. Curou um endemoninhado gadareno (Mat. 8:28-34). Dentre os dez leprosos curados um era samaritano, e Jesus destacou o fato de que somente o estrangeiro voltara para Lhe agradecer (Luc. 17:12-19).

Uma mulher samaritana foi o único público que ouviu um dos maiores sermões de Jesus, Através desse sermão ela passou a ter certeza de que estava chegando o tempo em que Deus seria adorado não apenas em Jerusalém ou no monte Gerizim, mas também em todo o mundo, "em espírito e em verdade" (João 4:5-42).

A fé de uma mulher cananita foi recompensada com a cura de sua filha. Muita atenção já foi dada à intrigante observação que Jesus fez no início do encontro: "Não fui enviado senão às ovelhas perdidas da casa de Israel" (Mat. 15:24). Talvez esta tenha sido uma repreensão deliberada a Seus discípulos, que desejavam mandá-la embora sem atender seu pedido, e que também tinham o preconceito racial, que era comum àquela época. O dado significativo é que Jesus realmente ministrou àquela mulher gentia, e elogiou sua fé na presença de Seus discípulos e dos espectadores judeus (v. 28).

Era quase certo que o centurião cujo servo foi curado fosse um romano. Comandante de um bando de cem soldados estrangeiros aquartelados em Cafarnaum com o objetivo de manterem a paz, este oficial era odiado pelos judeus, os quais estavam ressentidos com a presença desse "exército de ocupação". Cônscio de sua própria autoridade como militar, afirmou humildemente a Jesus que não seria necessário que Jesus viesse à sua casa para curar o servo (e assim talvez tornar-se impuro por entrar num lar gentílico). "Apenas diga a palavra e o meu servo ficará curado", foi o que disse com uma fé genuína. Jesus, então, Se voltou para a multidão de judeus que O seguiam e afirmou: "Estou lhes dizendo a verdade: Jamais encontrei um único judeu que mostrasse tanta fé como este oficial militar gentio" (Mat. 8:10, paráfrase do autor). E Jesus não terminou com essa afirmação, mas prosseguiu com esta solene predição: "Eu lhes digo que, tal como este, muitos estrangeiros virão do oriente e do ocidente para se juntarem a Abraão, Isaque e Jacó no reino dos céus. Mas muitos outros, que pensa- vam que eram 'filhos do reino' (o Povo Escolhido de Israel), serão jogados para fora" (vv. 1 1 -1 2, paráfrase do autor).

A chegada de um grupo de gregos precipitou a crise final da vida íntima de Jesus: Sua decisão de ir para a cruz. Está claro que estas pessoas não eram simples judeus helenizados, mas estrangeiros, quer interessados ou prosélitos, que haviam aceitado o judaísmo e que, desta forma, estavam em condições de adorar nas dependências do templo, pelo menos no pátio dos gentios. Seu pedido para se avistarem com Jesus levou-O a declarar: "É chegada a hora de ser glorificado o Filho do homem." O profundo interesse dos gregos era evidência de que o mundo estava pronto para Sua missão redentora, a qual culminaria com Sua morte propiciatória: "E eu, quando for levantado da terra, atrairei todos a mim mesmo." "Todos" – quer gregos, - quer judeus; tanto gentios como hebreus - esta é a implicação clara destas profundas palavras registradas porJoão (João 12:32).

A Última Semana

Os acontecimentos daquela última semana em Jerusalém dão testemunho eloqüente do fato de que Jesus, ao recusar ser um Messias judeu nacionalista, caminhou decididamente em direção à cruz, plenamente cônscio de que iria estabelecer um novo povo, inter-racial e internacional, o novo Israel, destinado a ser, na condição de reino espiritual, mundial na sua natureza. Entrou na cidade montado num jumento, para cumprir a profecia de Zacarias acerca de um rei que falaria de paz às nações e cujo domínio seria de mar a mar (Zac. 9:9-10). Purificou o pátio dos gentios, declarando rudemente: "A minha casa será chamada casa de oração, para todas as nações" (Mar. 1 1 : 1 7). De pé no templo, acusou os principais sacerdotes e os fariseus, líderes oficiais da nação judaica, de terem falhado na tarefa de serem bons mordomos das verdades que foram confiadas ao Povo Escolhido, e declarou solenemente: "Portanto vos digo que o reino de Deus vos será tirado e será entregue a um povo que lhe produza os respectivos frutos" (Mat. 21:43). Predisse a queda de Jerusalém e a destruição do templo durante aquela geração (Mar. 13:30; Mat. 24:34; Luc. 21:32), mas quando Lhe indagaram acerca dos fins dos tempos, Ele de fato disse: "Não se deixem enganar. Não será tão já como alguns pensam. Pois este evangelho do reino será pregado em todo o mundo para testemunho a todas as nações, e depois disso o fim virá" (Mat. 24:4-14, paráfrase do autor). A respeito de Sua volta em glória, foi propositadamente vago, tendo declarado: "Mas a respeito daquele dia e hora ninguém sabe, nem os anjos dos céus, nem o Filho, senão somente o Pai" (Mat. 24:36). Mas prometeu que, quando vier, "todas as nações serão reunidas em sua presença, e ele separará uns dos outros, como o pastor separa dos cabritos as ovelhas" (25:32, itálicos do autor).

Logo antes da Páscoa, numa casa em Betânia, uma adoradora ungiu Seu corpo com bálsamo caríssimo. Ao ser criticada por sua extravagância, Jesus a defendeu vigorosamente, dizendo: "Ela o fez para o meu sepultamento. Em verdade vos digo: Onde for pregado em todo o mundo este evangelho, será também contado o que ela fez, para memória sua" (26:13).

Na noite seguinte, no cenáculo, com Seus discípulos, selou a Nova Aliança com eles, numa antecipação de Sua morte. Enquanto passava o cálice, declarou: "Isto é o meu sangue, o sangue da aliança, derramado em favor de muitos, para remissão dos pecados" (v. 28). Só os onze estavam presentes, e todos eram judeus. Mas Jesus sabia que o pequeno núcleo de um novo Povo Escolhido, o remanescente de Israel, logo seria ampliado, à medida que os muitos, pelos quais morrera, ouvissem as boas novas e O aceitassem como Senhore Salvador.

Perguntas Para Estudo

1 . Que acontecimentos e declarações poderiam dar a impressão de que Jesus veio somente para a nação de Israel? 2. Por que Goerner afirma que a ênfase de Jesus nas "ovelhas perdidas da casa de Israel" era uma ênfase estratégica? 3. Descreva alguns pontos em comum entre o Antigo e o Novo Testamentos que dão continuidade à Bíblia.$conteudo$
     where curso_id = v_curso and ordem = 13;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Goerner: Jesus e os Gentios$t$, $conteudo$Jesus e os Gentios

H. Cornell Goerner

Temos tentado ler nossa Bíblia tal como Jesus a lia. Isto nos conduziu rapidamente por todo o Antigo Testamento, as únicas Escrituras de que Jesus dispunha. Em todas as três secções da Bíblia hebraica, os livros de Moisés, os Profetas e os Salmos, defrontamo-nos com a preocupação divina com as nações e povos da terra, e com Seu plano de tratar com eles por meio do Messias. Cremos que Jesus mentalmente "sublinhou" estas passagens em Sua Bíblia, e deliberadamente planejou cumpri-las com Sua vida, morte e ressurreição.

Voltando agora para o Novo Testamento, descobrimos nos Evangelhos que as palavras e obras de Jesus confirmam este conceito todo abrangente de Seu ministério. O Novo Testamento surge diretamente do Antigo, sem qualquer quebra de continuidade. No título característico que escolheu para Si mesmo, na estratégia de Seu ministério, e em Seus claros ensinos, é óbvio que Jesus tomou sobre Si uma missão em favor de toda a humanidade.

Malaquias e Mateus

Em nossas Bíblias o Evangelho de Mateus vem logo após Malaquias, o que é muito apropriado. Qualquer que seja a data deste último dos profetas, pelo menos dois ou três séculos se passaram desde que Deus falara a Seu povo através de Malaquias. Mesmo assim, ao fechar o Antigo Testamento e abrir o Novo, é como se apenas um intervalo de uns poucos dias houvesse ocorrido entre ambos os Testamentos. Mateus principia bem onde Malaquias havia terminado. E ninguém estava mais consciente disso do que Jesus. Sabia que viera cumprir o que Malaquias predissera.

Os quatro curtos capítulos de Malaquias são uma denúncia atrás da outra contra a nação de Israel, a advertência de um dia iminente de juízo a ser anunciado por um precursor e a ser, então, instituído pelo "mensageiro da aliança", o qual viria de repente ao templo e inauguraria uma nova era, não somente para o povo de Israel, mas para todo o mundo.

O anunciado julgamento foi chamado de "o Dia do Senhor". Este seria um "grande e terrível dia" de provações, ocasião em que os justos seriam separados dos ímpios assim como o ouro é refinado pelo fogo, assim como a sujeira é retirada da roupa pelo sabão que contém componentes cáusticos, assim como a palha é separada do trigo na eira, e assim como a árvore infrutífera é derrubada e consumida pelo fogo (Mal. 3:2; 4:1 , 5).

O juízo seria particularmente severo com Israel e seus líderes por causa de pecados específicos que foram denunciados: fraude e hipocrisia nos cultos de adoração (1:7-14); injustiça social (2:10); práticas religiosas pagās (2:11); divórcio (2:16); sonegação do dízimo (3:8-10). Mas, o profeta declara que, acima de tudo, a paciência de Deus está-se esgotando porque o povo, que se esperava que exaltasse a Yahweh e fizesse com que fosse reverenciado e adorado entre as nações do mundo, falhou nesta tarefa. Ao contrário, eles profanaram o nome de Deus e fizeram com que Deus fosse desonrado (1:5-14). Mas o propósito de Deus não será derrotado, pois, desde o oriente até o ocidente, por todo o mundo, Seu nome será exaltado entre as nações e, em todo lugar, orações e culto Lhe serão dedicados (1:11).

Achave para a compreensão de Malaquias está em 1:10-11:

Oxalá houvesse entre vós quem feche as portas, para que não acendêsseis debalde o fogo do meu altar. Eu não tenho prazer em vós, diz o Senhor dos Exércitos, nem aceitarei da vossa mão a vossa oferta. Mas desde o nascente do sol até ao poente é grande entre as nações o meu nome; e em todo lugar lhe é queimado incenso e trazidas ofertas puras; porque o meu nome é grande entre as nações, diz o Senhor dos Exércitos.

Malaquias adverte que Deus, por estar tão preocupado em ser exaltado entre as nações, está na iminência de agir. Primeiro enviará um mensageiro para lhe preparar o caminho (Mal. 3:1). Então Ele mesmo virá, na qualidade de mensageiro da aliança, e dará início ao período de juízo (Mal. 3:2-3). O precursor será um "Elias", um profeta veemente da destruição (Mal. 4:5). Se não se lhe der atenção, então é certo que sobrevirão juízo ardente e destruição.

Todos esses elementos de Malaquias se refletem no terceiro capítulo do Evangelho de Mateus. João Batista surgiu pregando: "Arrependei-vos, porque está próximo o reino dos céus" (Mat. 3:2). Este é o equivalente ao "Dia do Senhor" em Malaquias. A hora do julgamento divino está-se aproximando rapidamente. Esta é a "ira vindoura" (Mat. 3:7). João usa as mesmas figuras de linguagem que se encontram em Malaquias: o trigo e a palha devem ser separados. Para realçar que esse será um julgamento dos israelitas e não apenas dos gentios, tal como alguns judeus criam, João até mesmo declarou: "Não pensem que vocês escaparão porque são 'filhos de Abraão'. Eu lhes digo que Deus não depende de vocês. Se quiser, Ele é capaz de fazer surgirem 'filhos de Abraão' destas pedras. Ele usará outros se vocês não forem dignos. Vocês serão julgados e punidos, apesar da sua origem hebraica" (Mat. 3:9, paráfrase do autor).

Jesus assimilou esta mensagem de advertência à nação de Israel. Os Evangelhos nos ensinam que logo depois de Seu batismo, e a partir de então, Jesus começou a pregar e a dizer: "Arrependam-se antes que seja tarde demais. Há pouco tempo. O dia do juízo divino é iminente."

Jesus identificou João Batista com o Elias que Malaquias havia prometido. Logo depois do aprisionamento de João, Jesus declarou: "Porque todos os profetas e a lei profetizaram até João. E, se o quereis reconhecer, ele mesmo é Elias, que estava paravir.Quemtemouvidos,ouça"(Mat. 11: 13-15).

Jesus estava advertindo que uma importante página da história estava para ser virada. O último dos profetas fora enviado para pronunciar uma advertência final antes que o juízo caísse sobre a nação de Israel. Alguns meses mais tarde, após a morte de João Batista, Jesus mais uma vez identificou João como sendo o Elias predito por Malaquias:

Eu, porém, vos declaro que Eliasjá veio, e não o reconheceram, antes fizeram com ele tudo quanto quiseram. Assim também o Filho do homem há de padecer nas mãos deles. Então os discípulos entenderam que lhes falara a respeito de João Batista (Mat. 17:12-13).

Durante Sua última semana em Jerusalém, enquanto ensinava no templo, Jesus foi cumprindo conscientemente o que se acha escrito em Malaquias 3:1-2:

Eis que eu envio o meu mensageiro que preparará o caminho diante de mim; de repente virá ao seu templo o Senhor, a quem vós buscais, o Anjo da aliança a quem vós desejais; eis que ele vem, diz o Senhor dos Exércitos. Mas quem pode suportar o dia da sua vinda? e quem pode subsistir quando ele aparecer? Porque ele é como o fogo do ourives e como a potassa dos lavandeiros.

João Batista fora enviado como um mensageiro para preparar o caminho. Fizera seu trabalho. Agora o próprio Senhor viera anunciar uma Nova Aliança para substituir a Antiga, que fora quebrada. ("O Senhor, a quem buscais" não é Yahweh, mas o Messias esperado, o que é indicado pela palavra Adon no hebraico. O Senhor dos

Exércitos, que anuncia a vinda do Senhor (Adon) é Yahweh. Com Seu conhecimento de hebraico Jesus compreendia esta distinção.) O povo pensava que ansiava pela vinda do Messias, mas, na verdade, não estava preparado para Sua vinda nem para o julgamento que traria. Só aqueles que estavam espiritualmente preparados poderiam suportar Sua vinda.

Isto é o que significa fechar o Antigo Testamento e abrir o Novo Testamento. Jesus sabia que a aliança feita no Sinai fora quebrada repetidas vezes por um povo desobediente, e que, depois que uma longa sucessão de profetas que foram enviados para reconquistá-los havia falhado, a paciência de Deus estava-se esgotando. Uma nova aliança teria de ser selada com um remanescente fiel de Israel, que, então, chamaria as nações gentílicas ao arrependimento no nome do Messias, o juiz de vivos e mortos.

O juízo deve começar pela casa de Israel. Deve, então, ser proclamado a todas as nações. Este foi o sentido de urgência com que Jesus começou Seu ministério. Mateus cumpre Malaquias!

O Filho do Homem

Nada é mais revelador que o título pessoal que Jesus escolheu para Si mesmo. Vimos que Ele não apreciava a expressão "Filho de Davi", o título popular do Messias. Ele percebeu que era de fato "o Filho de Deus" mencionado no Salmo 2:7, e durante Seu julgamento perante o Sinédrio Ele o admitiu. Mas o título que usou durante todo o Seu ministério foi "Filho do homem". A expressão é usada mais de quarenta vezes nos Evangelhos, e em todas elas Jesus está Se referindo a Si mesmo. Os discípulos nunca a empregaram, mas chamavam-no de "Senhor" e "Mestre". Para Jesus, essas palavras eram quase um substituto para o pronome pessoal "eu". Vez após vez Ele disse: "O Filho do homem não tem onde reclinar a cabeça" (Mat. 8:20). "O Filho do homem tem sobre a terra autoridade para perdoar pecados" (Mat. 9:6). "O Filho do homem é senhor do sábado" (Mat. 12:8). "Então verão o Filho do homem vir nas nuvens, com grande poder e glória" (Mat. 1 3:26).

Jesus extraiu esta expressão de duas fontes principais: os livros de Ezequiel e Daniel. "Filho do homem" é um título distintivo empregado por Deus para designar o profeta Ezequiel, e ocorre oitenta e sete vezes. O hebraico é ben Adam, literalmente "Filho de Adão" ou "Filho da humanidade", Originalmente significava apenas "homem", em contraste com Deus, e lembrava Ezequiel de sua condição humilde. Mas à época de Jesus, a expressão havia-se tornado um título honorífico do Messias, e muitas passagens em Ezequiel foram idealizadas e interpretadas messianicamente. Enquanto lia o livro, Jesus deve ter ouvido Deus falar diretamente a Ele: "Filho do homem, eu te envio aos filhos de Israel, às nações rebeldes" (Ez. 2:3). "Filho do homem: Eu te dei por atalaia sobre a casa de Israel; da minha boca ouvirás a palavra, e os avisarás da minha parte" (Ez. 3:17).

Especialmente significativas para Jesus eram as passagens a respeito de um remanescente que seria poupado (6:8); do novo coração e espírito (11:19; 36:26-27); da nova e eterna aliança (37:26); e da promessa de que as nações gentílicas viriam a conhecer ao Senhor, Deus de Israel (37:28; 38:23; 39:7). Todas estas profecias seriam cumpridas por Ele, como Filho do homem.

Não pode haver qualquer dúvida de que Jesus tinha Daniel 7:13-14 na mente quando usou o título "Filho do homem". Nessa passagem há uma expressão aramaica, bar enash, em vez de ben Adam. Mas o sentido é semelhante, pois enash é uma palavra que designa a humanidade em geral, em contraste com um único indivíduo do sexo masculino. Nos comentários rabínicos e no pensamento popular a expressão já havia sido totalmente espiritualizada, tendo o sentido do homem ideal, quase divino em sua natureza. O livro de Enoque, um discurso apocalíptico de larga circulação durante o século primeiro, exaltou a figura do Filho do homem muito além da visão de Daniel. Mas não é necessário pressupor que Jesus tenha sido influenciado por Enoque. As palavras de Daniel são bem claras:

Eu estava olhando nas minhas visões da noite,

E eis que vinha com as nuvens do céu, um como o Filho do homem,

E dirigiu-se aoAncião de dias,

E o fizeram chegaraté ele.

Foi-lhe dado o domínio

E glória, e o reino,

Para que os povos, nações e homens de todas as línguas

O servissem;

O seu domínio é domínio eterno,

Que não passará,

E o seu reino

Jamais será destruído (7:13-14). Jesus sabia que isto só iria acontecer depois de Seu sofrimento e glorificação. Reivindicou o título para Si mesmo, dessa forma Se identificando não somente com o povo hebreu ou com a nação judaica, mas com toda a raça humana, com todas as famílias da terra. Sabia que era o Filho do homem e o Servo Sofredor.

Desde o Início

Como já tivemos oportunidade de ver, a visão de um reino universal foi parte integrante do plano de Jesus desde o início de Seu ministério. É conclusivo o fato de que uma das tentações no deserto envolvesse "todos os reinos do mundo e a glória deles" (Mat. 4:8). Jesus realmente aspirava ao domínio do mundo. Sua ambição de governar as nações não estava errada. A tentação significava tomar um atalho para atingir aquele nobre objetivo: era adotar os métodos do diabo. Ao rejeitar os métodos de Satanás, Jesus não renunciou ao propósito de ter autoridade mundial. Pelo contrário, escolheu o caminho do sofrimento e da redenção, que Ele encontrou esboçado nas Escrituras.

Seu primeiro sermão, em Nazaré, demonstra que Seu propósito de vida se estendia muito além da nação de Israel. Não Se surpreendeu que Seu próprio povo não recebesse Sua mensagem. "É sempre assim que tem sido", Ele disse. "Os profetas sempre encontraram maior fé entre os estrangeiros do que entre seu próprio povo" (Luc. 4:24, paráfrase do autor). E deu um exemplo: "Muitas viúvas havia em Israel no tempo de Elias...mas a nenhuma delas foi Elias enviado, senão a uma viúva de Sarepta de Sidom" (Luc. 4:25-26). Seus ouvintes conheciam o resto da história, contada em 1 Reis 17. Recebido em um lar gentílico, Elias realizou o notável milagre de suprir aquele lar de farinha e azeite, e mais tarde ressuscitou o filho da viúva - não de uma viúva judia, mas de uma gentílica!

Todavia Jesus não Se limitou a mencionar Elias. Com a história deste profeta, Jesus atirou sal nos sentimentos feridos de Seus ouvintes. Agora Ele cita Naamã, o sírio, que não era apenas um gentio, mas um líder militar, um capitão do exército sírio, o qual se encontrava àquela época em guerra com Israel e quase havia arrancado aquela pequena e infeliz nação do mapa (2 Reis 5:1-14). Apesar disso, embora houvesse muitos leprosos em Israel, "nenhum deles foi purificado, senão Naamã, o siro" (Luc. 4:27). Não havia ilustração mais dramática que pudesse ser dada de que a graça de Deus não estava limitada ao povo de Israel e de que os gentios freqüentemente demonstravam uma fé maior do que aqueles que eram considerados "filhos do reino". Não é de se admirar que os orgulhosos moradores de Nazaré tenham ficado furiosos com este jovem impetuoso, que insultou a nação e questionou a condição privilegiada que desfrutavam, de "Povo Escolhido" de Deus. Não fosse

Seu poder miraculoso, eles O teriam executado, atirando-O precipício abaixo (Luc. 4:28-30).

Ao Judeu Primeiro

Jesus possuía uma profunda convicção de uma missão especial à nação judaica. Demonstrou isto de maneira tão incisiva que algumas pessoas chegaram à conclusão de que Ele não pensava em qualquer missão além dos limites de Israel. Entretanto, uma análise cuidadosa de todas as Suas palavras e ações revela que isto era uma questão de estratégia: como Paulo mais tarde afirmou, sua missão era "ao judeu primeiro,etambémaogrego"(Rom. 1:16;2:10).

O interesse de Jesus por Israel ficou demonstrado nas instruções dadas. aos doze discípulos, quando os enviou em sua primeira missão de pregação. Disse: "Não tomeis rumo aos gentios, nem entreis em cidades de samaritanos; mas, de preferência, procurai as ovelhas perdidas da casa de Israel" (Mat. 10:5-6). A razão é óbvia. Havia pouco tempo e a catástrofe se aproximava da nação, caso não houvesse um urgente arrependimento. A necessidade era premente, mais para Israel do que para as nações gentílicas, cuja época de julgamento aconteceria mais tarde. De fato, neste mesmo contexto encontramos a predição de que o ministério dos discípulos de pregação se estenderia aos gentios: "Sereis levados à presença de governadores e de reis, para lhes servir de testemunho, a eles e aos gentios" (v. 18). Todavia devem se concentrar primeiro nas cidades judaicas, pois o tempo de oportunidade para elas é curto (v. 23).

Lucas fala de uma missão posterior de pregação, na qual outros setenta discípulos foram enviados dois a dois (Luc. 10:1). Tal como os doze apóstolos representam simbolicamente as doze tribos de Israel, os setenta simbolizam as nações dos gentios. Em Gênesis 10 temos a relação dos descendentes de Noé, setenta ao todo.

A tradição rabínica acreditava que este era o número total de nações espalhadas sobre a face da terra após a Torre de Babel, e mencionava constantemente os setenta povos gentílicos. Talvez Jesus tenha usado este número como meio de simbolizar o seu propósito de longo alcance. Os doze foram enviados para advertirem as tribos de Israel de um juízo iminente. Mais tarde os setenta foram enviados em uma missão de treinamento, como preparação para a missão derradeira, a missão a todo o mundo.

Contatos com Gentios

A maior parte do ministério público de Jesus aconteceu em território judaico. Levando em conta as circunstâncias, é surpreendente o número de contatos pessoais com gentios registrados nos Evangelhos. Curou um endemoninhado gadareno (Mat. 8:28-34). Dentre os dez leprosos curados um era samaritano, e Jesus destacou o fato de que somente o estrangeiro voltara para Lhe agradecer (Luc. 17:12-19).

Uma mulher samaritana foi o único público que ouviu um dos maiores sermões de Jesus, Através desse sermão ela passou a ter certeza de que estava chegando o tempo em que Deus seria adorado não apenas em Jerusalém ou no monte Gerizim, mas também em todo o mundo, "em espírito e em verdade" (João 4:5-42).

A fé de uma mulher cananita foi recompensada com a cura de sua filha. Muita atenção já foi dada à intrigante observação que Jesus fez no início do encontro: "Não fui enviado senão às ovelhas perdidas da casa de Israel" (Mat. 15:24). Talvez esta tenha sido uma repreensão deliberada a Seus discípulos, que desejavam mandá-la embora sem atender seu pedido, e que também tinham o preconceito racial, que era comum àquela época. O dado significativo é que Jesus realmente ministrou àquela mulher gentia, e elogiou sua fé na presença de Seus discípulos e dos espectadores judeus (v. 28).

Era quase certo que o centurião cujo servo foi curado fosse um romano. Comandante de um bando de cem soldados estrangeiros aquartelados em Cafarnaum com o objetivo de manterem a paz, este oficial era odiado pelos judeus, os quais estavam ressentidos com a presença desse "exército de ocupação". Cônscio de sua própria autoridade como militar, afirmou humildemente a Jesus que não seria necessário que Jesus viesse à sua casa para curar o servo (e assim talvez tornar-se impuro por entrar num lar gentílico). "Apenas diga a palavra e o meu servo ficará curado", foi o que disse com uma fé genuína. Jesus, então, Se voltou para a multidão de judeus que O seguiam e afirmou: "Estou lhes dizendo a verdade: Jamais encontrei um único judeu que mostrasse tanta fé como este oficial militar gentio" (Mat. 8:10, paráfrase do autor). E Jesus não terminou com essa afirmação, mas prosseguiu com esta solene predição: "Eu lhes digo que, tal como este, muitos estrangeiros virão do oriente e do ocidente para se juntarem a Abraão, Isaque e Jacó no reino dos céus. Mas muitos outros, que pensa- vam que eram 'filhos do reino' (o Povo Escolhido de Israel), serão jogados para fora" (vv. 1 1 -1 2, paráfrase do autor).

A chegada de um grupo de gregos precipitou a crise final da vida íntima de Jesus: Sua decisão de ir para a cruz. Está claro que estas pessoas não eram simples judeus helenizados, mas estrangeiros, quer interessados ou prosélitos, que haviam aceitado o judaísmo e que, desta forma, estavam em condições de adorar nas dependências do templo, pelo menos no pátio dos gentios. Seu pedido para se avistarem com Jesus levou-O a declarar: "É chegada a hora de ser glorificado o Filho do homem." O profundo interesse dos gregos era evidência de que o mundo estava pronto para Sua missão redentora, a qual culminaria com Sua morte propiciatória: "E eu, quando for levantado da terra, atrairei todos a mim mesmo." "Todos" – quer gregos, - quer judeus; tanto gentios como hebreus - esta é a implicação clara destas profundas palavras registradas porJoão (João 12:32).

A Última Semana

Os acontecimentos daquela última semana em Jerusalém dão testemunho eloqüente do fato de que Jesus, ao recusar ser um Messias judeu nacionalista, caminhou decididamente em direção à cruz, plenamente cônscio de que iria estabelecer um novo povo, inter-racial e internacional, o novo Israel, destinado a ser, na condição de reino espiritual, mundial na sua natureza. Entrou na cidade montado num jumento, para cumprir a profecia de Zacarias acerca de um rei que falaria de paz às nações e cujo domínio seria de mar a mar (Zac. 9:9-10). Purificou o pátio dos gentios, declarando rudemente: "A minha casa será chamada casa de oração, para todas as nações" (Mar. 1 1 : 1 7). De pé no templo, acusou os principais sacerdotes e os fariseus, líderes oficiais da nação judaica, de terem falhado na tarefa de serem bons mordomos das verdades que foram confiadas ao Povo Escolhido, e declarou solenemente: "Portanto vos digo que o reino de Deus vos será tirado e será entregue a um povo que lhe produza os respectivos frutos" (Mat. 21:43). Predisse a queda de Jerusalém e a destruição do templo durante aquela geração (Mar. 13:30; Mat. 24:34; Luc. 21:32), mas quando Lhe indagaram acerca dos fins dos tempos, Ele de fato disse: "Não se deixem enganar. Não será tão já como alguns pensam. Pois este evangelho do reino será pregado em todo o mundo para testemunho a todas as nações, e depois disso o fim virá" (Mat. 24:4-14, paráfrase do autor). A respeito de Sua volta em glória, foi propositadamente vago, tendo declarado: "Mas a respeito daquele dia e hora ninguém sabe, nem os anjos dos céus, nem o Filho, senão somente o Pai" (Mat. 24:36). Mas prometeu que, quando vier, "todas as nações serão reunidas em sua presença, e ele separará uns dos outros, como o pastor separa dos cabritos as ovelhas" (25:32, itálicos do autor).

Logo antes da Páscoa, numa casa em Betânia, uma adoradora ungiu Seu corpo com bálsamo caríssimo. Ao ser criticada por sua extravagância, Jesus a defendeu vigorosamente, dizendo: "Ela o fez para o meu sepultamento. Em verdade vos digo: Onde for pregado em todo o mundo este evangelho, será também contado o que ela fez, para memória sua" (26:13).

Na noite seguinte, no cenáculo, com Seus discípulos, selou a Nova Aliança com eles, numa antecipação de Sua morte. Enquanto passava o cálice, declarou: "Isto é o meu sangue, o sangue da aliança, derramado em favor de muitos, para remissão dos pecados" (v. 28). Só os onze estavam presentes, e todos eram judeus. Mas Jesus sabia que o pequeno núcleo de um novo Povo Escolhido, o remanescente de Israel, logo seria ampliado, à medida que os muitos, pelos quais morrera, ouvissem as boas novas e O aceitassem como Senhore Salvador.

Perguntas Para Estudo

1 . Que acontecimentos e declarações poderiam dar a impressão de que Jesus veio somente para a nação de Israel? 2. Por que Goerner afirma que a ênfase de Jesus nas "ovelhas perdidas da casa de Israel" era uma ênfase estratégica? 3. Descreva alguns pontos em comum entre o Antigo e o Novo Testamentos que dão continuidade à Bíblia.$conteudo$, 13);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 14) then
    update aulas set titulo = $t$Lição 3 · Leitura — Coleman, cap. 11: O plano do Mestre$t$, conteudo = $conteudo$O plano do Mestre

Robert E. Coleman

O propósito deste estudo é acompanhar os passos de Cristo, tal como retratados nos evangelhos, sem ter de apelar indevidamente para fontes secundárias de informação. Nessa investigação, a narrativa inspirada da vida de Jesus foi examinada muitas vezes, e de vários ângulos, sempre com o objetivo de discernir um elemento motivador nos métodos que ele utilizou para cumprir sua missão. Suas estratégias foram analisadas do ponto de vista de seu ministério como um todo, na esperança de se captar o sentido mais lato de seus métodos em sua interação com a humanidade.

Seu objeti vo era claro

Os dias em que Jesus viveu em carne foram apenas o desdobramento temporal do plano divino traçado desde o princípio. A encarnação sempre esteve nos pensamentos de Deus. Sua intenção era salvar um povo para si mesmo, tirado deste mundo, e com esse povo edificar uma Igreja espiritual, que jamais viesse a perecer. Também contemplava, no futuro, a chegada de seu Reino com poder e grande glória. Este mundo lhe pertencia por direito de criação, mas Jesus não procurou fazer dele sua moradia permanente.

Ninguém ficaria excluído de seu propósito gracioso. Seu amor é universal, não devemos nos enganar quanto a isso. Ele é “o Salvador do mundo” (Jo 4.42). O desejo de Deus era que toda a humanidade fosse salva e chegasse ao pleno conhecimento da verdade. Foi com a finalidade de conceder salvação ao ser humano e libertá-lo de todo pecado que Jesus entregou a si mesmo. No que ele morreu por um, também morreu por todos. De forma contrária à nossa superficial maneira de pensar, jamais houve em sua mente qualquer distinção entre missões nacionais e missões estrangeiras. Para Jesus, só há um tipo de evangelismo: o de escopo mundial.

Sua meta era a vitória

Sua vida seguiu certas diretrizes, visando aos seus objetivos. Tudo que ele fez e declarou fazia parte de um único padrão. Tudo se revestia de significado, pois contribuía para o propósito final de sua vida — a redenção do mundo para Deus. Foi essa perspectiva motivadora que governou a conduta de Cristo. Seus passos foram orientados por ela. Não se esqueça disto: nem por um momento Jesus perdeu seu alvo de vista.

Eis por que é tão importante observar o caminho que Jesus trilhou para atingir seus objetivos. O Mestre desvendou a estratégia de Deus para conquistar o mundo. Cristo demonstrava confiança no futuro, porque vivia de conformidade com o plano que tinha sempre diante de si. Assim, nada fazia por acaso — não havia desperdício de energias, nem mesmo era proferida uma única palavra inútil. Estava sempre ocupado com a obra de Deus (Lc 2.49). Jesus viveu, morreu e ressuscitou, tudo de acordo com o que fora determinado. À semelhança do general que segue seu plano de batalha, o Filho de Deus traçou uma estratégia vencedora. Não lhe foi dada oportunidade de arriscar-se. Pesando cada fator variável e cada alternativa da experiência humana, ele concebeu um plano que não podia falhar.

Seu método: recursos humanos

Tudo começou quando Jesus chamou uns poucos homens para que o seguissem. Essa atitude revelava, de imediato, a direção que sua estratégia evangelística assumiria, porquanto, sua preocupação não era elaborar programas para atingir as multidões, e sim treinar os homens a quem as multidões iriam seguir. Por mais espantoso que pareça, Jesus começou a reunir esses homens antes que houvesse organizado qualquer campanha evangelística ou pregado qualquer sermão em público. Os homens seriam seu método de conquistar o mundo para Deus.

Na execução de seu plano, o primeiro ato de Jesus foi alistar homens que pudessem dar testemunho acerca de sua vida e continuar o trabalho do Senhor depois que ele retornasse ao Pai.

Depois de chamar os discípulos, Jesus estabeleceu a prática de estar com eles. Esta era a essência de seu programa de treinamento: ele deixava que seus discípulos o seguissem.

Jesus esperava que os homens que o acompanhavam fossem obedientes. Não requeria que fossem espertos, mas tinham de ser leais, e essa se tornou a marca distintiva dos discípulos, mediante a qual seriam conhecidos. Eles foram chamados “discípulos”, o que significava que eram “aprendizes” ou “alunos” do Mestre. Só bem mais tarde passaram a ser designados “cristãos” (At 11.26), embora fosse inevitável, pois com o passar do tempo os seguidores obedientes invariavelmente assumem o caráter de seu líder.

Jesus foi progredindo no trabalho ministerial até o tempo em que os discípulos teriam de substitui-lo em seu trabalho, saindo pelo mundo a pregar o evangelho da redenção. Esse plano foi explicado gradativamente, enquanto os discípulos o seguiam.

Sua estratégia

Por quê? Por que Jesus dedicou deliberadamente sua vida a tão poucas pessoas? Não veio ele salvar o mundo? Depois do arrebatador anúncio feito por João Batista, que ainda retinia nos ouvidos das multidões, o Mestre poderia facilmente arrebanhar milhares de seguidores, se assim o desejasse. Então, por que ele não aproveitou a oportunidade de obter um exército poderoso de seguidores, capaz de conquistar o mundo pela força bruta da quantidade? Sem dúvida, o Filho de Deus poderia ter adotado um programa mais atraente de recrutamento das massas. Não é um tanto desapontador o fato de alguém com todos os poderes do Universo à disposição, que viveu e morreu como jamais alguém viveu e morreu para salvar o mundo, no fim de sua vida terrena apresentar apenas uns poucos e assustados discípulos como fruto de seu labor?

A resposta a essas perguntas invoca de imediato o propósito real de seu projeto evangelístico. Jesus não estava procurando impressionar as multidões, e sim inaugurar seu Reino. Isso significava que ele precisava de homens capazes de conduzir as multidões. Que proveito haveria, para seu objetivo final, se as massas fossem impelidas a segui-lo e depois não pudessem contar com supervisão nem instrução acerca do Caminho? Já se demonstrou, em inúmeras ocasiões, que as multidões são presa fácil dos deuses falsos quando abandonadas sem o devido cuidado. As massas eram como ovelhas que vagavam sem rumo, sem a orientação de um pastor (ver Mt 9.36; 14.14; Mc 6.34). As multidões se dispunham a seguir qualquer líder que lhes prometesse bem-estar, sem importar que fosse amigo ou adversário. Esta era a grande tragédia daquela hora: as nobres aspirações do povo eram facilmente insufladas por Jesus, mas com idêntica facilidade eram distorcidas por malévolas autoridades religiosas, que controlavam as multidões. Os líderes religiosos de Israel, espiritualmente cegos ( Jo 8.44; 9.39-41; 12.40; v. Mt 23.1-39), embora pequenos em número, dominavam completamente as atividades populares. Por esse motivo, a menos que os convertidos a Jesus fossem orientados e protegidos dos ensinos enganosos por competentes homens de Deus, em breve cairiam vítimas da confusão e do desespero, e seu último estado tornar-se-ia pior que o primeiro. Assim, antes que o mundo pudesse ser ajudado de modo permanente, era necessário escolher homens capazes de conduzir as multidões pelo caminho da fé.

Jesus era realista. Percebeu perfeitamente a debilidade da natureza humana depravada, bem como as forças satânicas deste mundo, que se lançam contra a humanidade. Ele baseou seu plano evangelístico nesse conhecimento, de modo que pôde satisfazer essa necessidade. As multidões de almas desnorteadas e aflitas estavam potencialmente preparadas para segui-lo, contudo, Jesus não podia cuidar delas sozinho. Sua única esperança consistia em reunir homens imbuídos de sua vida, que realizassem esse trabalho por ele. Por essa razão, ele concentrou seus esforços naqueles que seriam os primeiros líderes de seu Reino. Embora Jesus tivesse feito tudo quanto estava ao seu alcance para ajudar as multidões, ele precisou dar maior atenção ao pequeno grupo de homens-chave, e não às massas, a fim de que essas multidões, fi - nalmente, pudessem ser salvas. Era essa a marca de sua estratégia.

Tudo voltava a se concentrar nos discípulos de Jesus. Eles eram a vanguarda de seu envolvente movimento. “Por intermédio da sua palavra”, Jesus esperava que outros viessem a confiar nele (Jo 17.20), os quais, por sua vez, passariam adiante a Palavra da salvação, até o tempo em que o mundo viesse a conhecer quem é Cristo e o que ele veio fazer (v. 21,23). A estratégia evangelística de Jesus, em sua natureza — isto é, o cumprimento de seu propósito ao vir a este mundo para morrer na cruz e ressuscitar dentre os mortos — dependia da fidelidade dos discípulos que foram escolhidos para essa gigantesca tarefa. Não importava quão pequeno fosse o grupo inicial, contanto que se reproduzissem e ensinassem outros discípulos a se reproduzir também. Assim, a Igreja de Cristo haveria de conquistar o mundo mediante vidas consagradas tão íntimas do Salvador que seriam constrangidas pelo seu Espírito e seu método a proclamar à humanidade a mensagem do Senhor.

Era intenção de Jesus que os discípulos produzissem outros discípulos semelhantes a eles mesmos, recolhidos do mundo por meio da Igreja. Dessa forma, seu ministério, por intermédio do Espírito Santo, seria multiplicado muitas vezes na vida dos discípulos. Por meio deles e de outros semelhantes a eles, o Reino continuaria a se expandir em círculos concêntricos cada vez maiores, até que as multidões viessem a saber, em particular, a oportunidade que lhes era oferecida pelo Mestre. Mediante essa estratégia, a conquista do mundo seria apenas questão de tempo e de fidelidade ao plano.

Jesus conseguiria insuflar em seus discípulos a estrutura de uma Igreja capaz de desafiar todos os poderes da morte e do inferno e triunfar sobre eles. O Reino começara minúsculo como um grão de mostarda, mas haveria de agigantar-se em tamanho e força até se tornar “o maior dos arbustos” (Mt 13.32; cf. Mc 4.32; Lc 13.18,19). Jesus não alimentava a expectativa de que todos os seres humanos fossem salvos (porquanto reconhecia, realisticamente, a rebeldia dos homens, a despeito da graça divina). Contudo, previa o tempo em que o evangelho da salvação em seu nome seria proclamado de modo convincente a toda criatura. Por meio desse testemunho, sua Igreja militante viria a ser a Igreja universal, quando então seria arrebatada para tornar-se a Igreja triunfante.

Não seria uma conquista fácil. Muitos crentes haveriam de padecer perseguição e martírio no decorrer da batalha. Contudo, sem importar quão grandes provações tivessem de passar ou quantos conflitos temporais fossem perdidos durante a luta, a vitória final estava garantida de antemão. Sua Igreja, finalmente, seria vitoriosa. Nada poderia prevalecer permanentemente contra ela (Mt 16.18).

O princípio de determinar tarefas específicas aos discípulos foi conclusivamente demonstrado pouco antes de o Senhor retornar ao céu, após sua crucificação e ressurreição. Em pelo menos quatro oportunidades, o Senhor veio ao encontro de seus discípulos a fim de ordenar que partissem para realizar sua obra. Essa ordem foi dada aos discípulos, à exceção de Tomé, pela primeira vez naquele primeiro domingo de Páscoa, na noite em que estavam reunidos no cenáculo. Depois que Jesus mostrou aos assustados discípulos as mãos e os pés marcados pelos cravos (Lc 24.38-40) e de acompanhá-los na refeição (Lc 24.41-43), declarou: “Paz seja convosco! Assim como o Pai me enviou, eu também vos envio” ( Jo 20.21). Com essas palavras, Jesus assegurou mais uma vez aos discípulos a promessa e a autoridade proporcionada pela vinda do Espírito Santo, que os capacitaria a cumprir a tarefa.

Mais tarde, Jesus tomou o desjejum na companhia dos discípulos, à beira do mar de Tiberíades, quando então recomendou a Pedro, por três vezes, que alimentasse suas ovelhas ( Jo 21.15-17). Essa admoestação foi interpretada pelo grande pescador como a prova de seu amor ao Mestre.

Em alguma montanha da Galileia, Jesus anunciou a Grande Comissão, não apenas aos Onze (Mt 28.16), mas igualmente à Igreja inteira, que a essa altura consistia de cerca de 500 irmãos (1Co 15.6). Foi uma clara proclamação de sua estratégia de conquista mundial.

Toda a autoridade me foi dada no céu e na terra. Ide, portanto, fazei discípulos de todas as nações, batizando-os em nome do Pai, e do Filho, e do Espírito Santo; ensinando-os a guardar todas as coisas que vos tenho ordenado. E eis que estou convosco todos os dias até à consumação do século (Mt 28.18-20;

cf. Mc 16.15-18).

Finalmente, antes de voltar para o Pai, nas alturas, Jesus repassou pela última vez todos os aspectos da obra aos seus discípulos, mostrando-lhes as coisas que tiveram de se cumprir enquanto estava na companhia deles (Lc 24.44,45). Assim, seu sofrimento e sua morte, bem como sua ressurreição dentre os mortos, ao terceiro dia, estavam de acordo com um programa previamente traçado (Lc 24.46). Jesus passou então a mostrar aos discípulos “que em seu nome se [pregaria] arrependimento para remissão de pecados a todas as nações, começando de Jerusalém” (Lc 24.47). Para o cumprimento dos propósitos divinos, os discípulos não desempenhariam papel menor que o do Mestre. Haveriam de ser instrumentos humanos no anúncio das boas novas, depois que o Espírito Santo os capacitasse para realizar a contento a tarefa: “Recebereis poder, ao descer sobre vós o Espírito Santo, e sereis minhas testemunhas tanto em Jerusalém como em toda a Judéia e Samaria e até aos confins da terra” (At 1.8; v. Lc 24.48,49).

É óbvio que Jesus não deixou a obra evangelística sujeita às impressões ou conveniências humanas. Para seus discípulos, tratava-se de uma ordem bem definida, percebida por impulso no início do discipulado deles, mas progressivamente esclarecida ao longo da convivência com o Mestre até que finalmente foi expressa em termos claros. Ninguém que seguisse a Jesus por muito tempo podia escapar a essa conclusão. Foi assim naquela época e assim continua sendo até hoje.

Os discípulos cristãos são enviados especiais — comissionados para o mesmo trabalho do qual o Senhor foi incumbido e pelo qual deu a própria vida: a evangelização do mundo. O evangelismo, por conseguinte, não é um acessório opcional à vida cristã. É o próprio pulsar de tudo que fomos chamados a ser e fazer. É a comissão entregue à Igreja que confere significado a tudo quanto é empreendido em nome de Cristo. Concentrados nesse objetivo, tudo quanto fizermos e dissermos terá um glorioso cumprimento no propósito remidor de Deus.

Perguntas para estudo

1.Por que Jesus não usou sua reputação, poder e influência para recrutar um exército poderoso

de seguidores, que conquistasse o mundo pela força bruta da quantidade?

2.Qual era a marca da estratégia de Jesus? Você acha que devemos proceder assim nos dias de

hoje? Por quê?

3.Como podemos comparar as estratégias evangelísticas de hoje à estratégia de Jesus?

[cite] ROBERT E. COLEMAN é professor emérito de evangelismo na Trinity Evangelical Divinity School. Atua como diretor do Billy Graham Institute of Evangelism. Ele é membro fundador do Comitê de Lausanne Evangelização Mundial. Coleman é autor de 20 livros, entre eles O plano mestre de evangelismo. Este arti go foi extraído da segunda edição desse livro (São Paulo: Mundo Cristão, 2006). Usado com permissão.$conteudo$
     where curso_id = v_curso and ordem = 14;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Coleman, cap. 11: O plano do Mestre$t$, $conteudo$O plano do Mestre

Robert E. Coleman

O propósito deste estudo é acompanhar os passos de Cristo, tal como retratados nos evangelhos, sem ter de apelar indevidamente para fontes secundárias de informação. Nessa investigação, a narrativa inspirada da vida de Jesus foi examinada muitas vezes, e de vários ângulos, sempre com o objetivo de discernir um elemento motivador nos métodos que ele utilizou para cumprir sua missão. Suas estratégias foram analisadas do ponto de vista de seu ministério como um todo, na esperança de se captar o sentido mais lato de seus métodos em sua interação com a humanidade.

Seu objeti vo era claro

Os dias em que Jesus viveu em carne foram apenas o desdobramento temporal do plano divino traçado desde o princípio. A encarnação sempre esteve nos pensamentos de Deus. Sua intenção era salvar um povo para si mesmo, tirado deste mundo, e com esse povo edificar uma Igreja espiritual, que jamais viesse a perecer. Também contemplava, no futuro, a chegada de seu Reino com poder e grande glória. Este mundo lhe pertencia por direito de criação, mas Jesus não procurou fazer dele sua moradia permanente.

Ninguém ficaria excluído de seu propósito gracioso. Seu amor é universal, não devemos nos enganar quanto a isso. Ele é “o Salvador do mundo” (Jo 4.42). O desejo de Deus era que toda a humanidade fosse salva e chegasse ao pleno conhecimento da verdade. Foi com a finalidade de conceder salvação ao ser humano e libertá-lo de todo pecado que Jesus entregou a si mesmo. No que ele morreu por um, também morreu por todos. De forma contrária à nossa superficial maneira de pensar, jamais houve em sua mente qualquer distinção entre missões nacionais e missões estrangeiras. Para Jesus, só há um tipo de evangelismo: o de escopo mundial.

Sua meta era a vitória

Sua vida seguiu certas diretrizes, visando aos seus objetivos. Tudo que ele fez e declarou fazia parte de um único padrão. Tudo se revestia de significado, pois contribuía para o propósito final de sua vida — a redenção do mundo para Deus. Foi essa perspectiva motivadora que governou a conduta de Cristo. Seus passos foram orientados por ela. Não se esqueça disto: nem por um momento Jesus perdeu seu alvo de vista.

Eis por que é tão importante observar o caminho que Jesus trilhou para atingir seus objetivos. O Mestre desvendou a estratégia de Deus para conquistar o mundo. Cristo demonstrava confiança no futuro, porque vivia de conformidade com o plano que tinha sempre diante de si. Assim, nada fazia por acaso — não havia desperdício de energias, nem mesmo era proferida uma única palavra inútil. Estava sempre ocupado com a obra de Deus (Lc 2.49). Jesus viveu, morreu e ressuscitou, tudo de acordo com o que fora determinado. À semelhança do general que segue seu plano de batalha, o Filho de Deus traçou uma estratégia vencedora. Não lhe foi dada oportunidade de arriscar-se. Pesando cada fator variável e cada alternativa da experiência humana, ele concebeu um plano que não podia falhar.

Seu método: recursos humanos

Tudo começou quando Jesus chamou uns poucos homens para que o seguissem. Essa atitude revelava, de imediato, a direção que sua estratégia evangelística assumiria, porquanto, sua preocupação não era elaborar programas para atingir as multidões, e sim treinar os homens a quem as multidões iriam seguir. Por mais espantoso que pareça, Jesus começou a reunir esses homens antes que houvesse organizado qualquer campanha evangelística ou pregado qualquer sermão em público. Os homens seriam seu método de conquistar o mundo para Deus.

Na execução de seu plano, o primeiro ato de Jesus foi alistar homens que pudessem dar testemunho acerca de sua vida e continuar o trabalho do Senhor depois que ele retornasse ao Pai.

Depois de chamar os discípulos, Jesus estabeleceu a prática de estar com eles. Esta era a essência de seu programa de treinamento: ele deixava que seus discípulos o seguissem.

Jesus esperava que os homens que o acompanhavam fossem obedientes. Não requeria que fossem espertos, mas tinham de ser leais, e essa se tornou a marca distintiva dos discípulos, mediante a qual seriam conhecidos. Eles foram chamados “discípulos”, o que significava que eram “aprendizes” ou “alunos” do Mestre. Só bem mais tarde passaram a ser designados “cristãos” (At 11.26), embora fosse inevitável, pois com o passar do tempo os seguidores obedientes invariavelmente assumem o caráter de seu líder.

Jesus foi progredindo no trabalho ministerial até o tempo em que os discípulos teriam de substitui-lo em seu trabalho, saindo pelo mundo a pregar o evangelho da redenção. Esse plano foi explicado gradativamente, enquanto os discípulos o seguiam.

Sua estratégia

Por quê? Por que Jesus dedicou deliberadamente sua vida a tão poucas pessoas? Não veio ele salvar o mundo? Depois do arrebatador anúncio feito por João Batista, que ainda retinia nos ouvidos das multidões, o Mestre poderia facilmente arrebanhar milhares de seguidores, se assim o desejasse. Então, por que ele não aproveitou a oportunidade de obter um exército poderoso de seguidores, capaz de conquistar o mundo pela força bruta da quantidade? Sem dúvida, o Filho de Deus poderia ter adotado um programa mais atraente de recrutamento das massas. Não é um tanto desapontador o fato de alguém com todos os poderes do Universo à disposição, que viveu e morreu como jamais alguém viveu e morreu para salvar o mundo, no fim de sua vida terrena apresentar apenas uns poucos e assustados discípulos como fruto de seu labor?

A resposta a essas perguntas invoca de imediato o propósito real de seu projeto evangelístico. Jesus não estava procurando impressionar as multidões, e sim inaugurar seu Reino. Isso significava que ele precisava de homens capazes de conduzir as multidões. Que proveito haveria, para seu objetivo final, se as massas fossem impelidas a segui-lo e depois não pudessem contar com supervisão nem instrução acerca do Caminho? Já se demonstrou, em inúmeras ocasiões, que as multidões são presa fácil dos deuses falsos quando abandonadas sem o devido cuidado. As massas eram como ovelhas que vagavam sem rumo, sem a orientação de um pastor (ver Mt 9.36; 14.14; Mc 6.34). As multidões se dispunham a seguir qualquer líder que lhes prometesse bem-estar, sem importar que fosse amigo ou adversário. Esta era a grande tragédia daquela hora: as nobres aspirações do povo eram facilmente insufladas por Jesus, mas com idêntica facilidade eram distorcidas por malévolas autoridades religiosas, que controlavam as multidões. Os líderes religiosos de Israel, espiritualmente cegos ( Jo 8.44; 9.39-41; 12.40; v. Mt 23.1-39), embora pequenos em número, dominavam completamente as atividades populares. Por esse motivo, a menos que os convertidos a Jesus fossem orientados e protegidos dos ensinos enganosos por competentes homens de Deus, em breve cairiam vítimas da confusão e do desespero, e seu último estado tornar-se-ia pior que o primeiro. Assim, antes que o mundo pudesse ser ajudado de modo permanente, era necessário escolher homens capazes de conduzir as multidões pelo caminho da fé.

Jesus era realista. Percebeu perfeitamente a debilidade da natureza humana depravada, bem como as forças satânicas deste mundo, que se lançam contra a humanidade. Ele baseou seu plano evangelístico nesse conhecimento, de modo que pôde satisfazer essa necessidade. As multidões de almas desnorteadas e aflitas estavam potencialmente preparadas para segui-lo, contudo, Jesus não podia cuidar delas sozinho. Sua única esperança consistia em reunir homens imbuídos de sua vida, que realizassem esse trabalho por ele. Por essa razão, ele concentrou seus esforços naqueles que seriam os primeiros líderes de seu Reino. Embora Jesus tivesse feito tudo quanto estava ao seu alcance para ajudar as multidões, ele precisou dar maior atenção ao pequeno grupo de homens-chave, e não às massas, a fim de que essas multidões, fi - nalmente, pudessem ser salvas. Era essa a marca de sua estratégia.

Tudo voltava a se concentrar nos discípulos de Jesus. Eles eram a vanguarda de seu envolvente movimento. “Por intermédio da sua palavra”, Jesus esperava que outros viessem a confiar nele (Jo 17.20), os quais, por sua vez, passariam adiante a Palavra da salvação, até o tempo em que o mundo viesse a conhecer quem é Cristo e o que ele veio fazer (v. 21,23). A estratégia evangelística de Jesus, em sua natureza — isto é, o cumprimento de seu propósito ao vir a este mundo para morrer na cruz e ressuscitar dentre os mortos — dependia da fidelidade dos discípulos que foram escolhidos para essa gigantesca tarefa. Não importava quão pequeno fosse o grupo inicial, contanto que se reproduzissem e ensinassem outros discípulos a se reproduzir também. Assim, a Igreja de Cristo haveria de conquistar o mundo mediante vidas consagradas tão íntimas do Salvador que seriam constrangidas pelo seu Espírito e seu método a proclamar à humanidade a mensagem do Senhor.

Era intenção de Jesus que os discípulos produzissem outros discípulos semelhantes a eles mesmos, recolhidos do mundo por meio da Igreja. Dessa forma, seu ministério, por intermédio do Espírito Santo, seria multiplicado muitas vezes na vida dos discípulos. Por meio deles e de outros semelhantes a eles, o Reino continuaria a se expandir em círculos concêntricos cada vez maiores, até que as multidões viessem a saber, em particular, a oportunidade que lhes era oferecida pelo Mestre. Mediante essa estratégia, a conquista do mundo seria apenas questão de tempo e de fidelidade ao plano.

Jesus conseguiria insuflar em seus discípulos a estrutura de uma Igreja capaz de desafiar todos os poderes da morte e do inferno e triunfar sobre eles. O Reino começara minúsculo como um grão de mostarda, mas haveria de agigantar-se em tamanho e força até se tornar “o maior dos arbustos” (Mt 13.32; cf. Mc 4.32; Lc 13.18,19). Jesus não alimentava a expectativa de que todos os seres humanos fossem salvos (porquanto reconhecia, realisticamente, a rebeldia dos homens, a despeito da graça divina). Contudo, previa o tempo em que o evangelho da salvação em seu nome seria proclamado de modo convincente a toda criatura. Por meio desse testemunho, sua Igreja militante viria a ser a Igreja universal, quando então seria arrebatada para tornar-se a Igreja triunfante.

Não seria uma conquista fácil. Muitos crentes haveriam de padecer perseguição e martírio no decorrer da batalha. Contudo, sem importar quão grandes provações tivessem de passar ou quantos conflitos temporais fossem perdidos durante a luta, a vitória final estava garantida de antemão. Sua Igreja, finalmente, seria vitoriosa. Nada poderia prevalecer permanentemente contra ela (Mt 16.18).

O princípio de determinar tarefas específicas aos discípulos foi conclusivamente demonstrado pouco antes de o Senhor retornar ao céu, após sua crucificação e ressurreição. Em pelo menos quatro oportunidades, o Senhor veio ao encontro de seus discípulos a fim de ordenar que partissem para realizar sua obra. Essa ordem foi dada aos discípulos, à exceção de Tomé, pela primeira vez naquele primeiro domingo de Páscoa, na noite em que estavam reunidos no cenáculo. Depois que Jesus mostrou aos assustados discípulos as mãos e os pés marcados pelos cravos (Lc 24.38-40) e de acompanhá-los na refeição (Lc 24.41-43), declarou: “Paz seja convosco! Assim como o Pai me enviou, eu também vos envio” ( Jo 20.21). Com essas palavras, Jesus assegurou mais uma vez aos discípulos a promessa e a autoridade proporcionada pela vinda do Espírito Santo, que os capacitaria a cumprir a tarefa.

Mais tarde, Jesus tomou o desjejum na companhia dos discípulos, à beira do mar de Tiberíades, quando então recomendou a Pedro, por três vezes, que alimentasse suas ovelhas ( Jo 21.15-17). Essa admoestação foi interpretada pelo grande pescador como a prova de seu amor ao Mestre.

Em alguma montanha da Galileia, Jesus anunciou a Grande Comissão, não apenas aos Onze (Mt 28.16), mas igualmente à Igreja inteira, que a essa altura consistia de cerca de 500 irmãos (1Co 15.6). Foi uma clara proclamação de sua estratégia de conquista mundial.

Toda a autoridade me foi dada no céu e na terra. Ide, portanto, fazei discípulos de todas as nações, batizando-os em nome do Pai, e do Filho, e do Espírito Santo; ensinando-os a guardar todas as coisas que vos tenho ordenado. E eis que estou convosco todos os dias até à consumação do século (Mt 28.18-20;

cf. Mc 16.15-18).

Finalmente, antes de voltar para o Pai, nas alturas, Jesus repassou pela última vez todos os aspectos da obra aos seus discípulos, mostrando-lhes as coisas que tiveram de se cumprir enquanto estava na companhia deles (Lc 24.44,45). Assim, seu sofrimento e sua morte, bem como sua ressurreição dentre os mortos, ao terceiro dia, estavam de acordo com um programa previamente traçado (Lc 24.46). Jesus passou então a mostrar aos discípulos “que em seu nome se [pregaria] arrependimento para remissão de pecados a todas as nações, começando de Jerusalém” (Lc 24.47). Para o cumprimento dos propósitos divinos, os discípulos não desempenhariam papel menor que o do Mestre. Haveriam de ser instrumentos humanos no anúncio das boas novas, depois que o Espírito Santo os capacitasse para realizar a contento a tarefa: “Recebereis poder, ao descer sobre vós o Espírito Santo, e sereis minhas testemunhas tanto em Jerusalém como em toda a Judéia e Samaria e até aos confins da terra” (At 1.8; v. Lc 24.48,49).

É óbvio que Jesus não deixou a obra evangelística sujeita às impressões ou conveniências humanas. Para seus discípulos, tratava-se de uma ordem bem definida, percebida por impulso no início do discipulado deles, mas progressivamente esclarecida ao longo da convivência com o Mestre até que finalmente foi expressa em termos claros. Ninguém que seguisse a Jesus por muito tempo podia escapar a essa conclusão. Foi assim naquela época e assim continua sendo até hoje.

Os discípulos cristãos são enviados especiais — comissionados para o mesmo trabalho do qual o Senhor foi incumbido e pelo qual deu a própria vida: a evangelização do mundo. O evangelismo, por conseguinte, não é um acessório opcional à vida cristã. É o próprio pulsar de tudo que fomos chamados a ser e fazer. É a comissão entregue à Igreja que confere significado a tudo quanto é empreendido em nome de Cristo. Concentrados nesse objetivo, tudo quanto fizermos e dissermos terá um glorioso cumprimento no propósito remidor de Deus.

Perguntas para estudo

1.Por que Jesus não usou sua reputação, poder e influência para recrutar um exército poderoso

de seguidores, que conquistasse o mundo pela força bruta da quantidade?

2.Qual era a marca da estratégia de Jesus? Você acha que devemos proceder assim nos dias de

hoje? Por quê?

3.Como podemos comparar as estratégias evangelísticas de hoje à estratégia de Jesus?

[cite] ROBERT E. COLEMAN é professor emérito de evangelismo na Trinity Evangelical Divinity School. Atua como diretor do Billy Graham Institute of Evangelism. Ele é membro fundador do Comitê de Lausanne Evangelização Mundial. Coleman é autor de 20 livros, entre eles O plano mestre de evangelismo. Este arti go foi extraído da segunda edição desse livro (São Paulo: Mundo Cristão, 2006). Usado com permissão.$conteudo$, 14);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 15) then
    update aulas set titulo = $t$Lição 3 · Leitura — Ladd, cap. 9: O evangelho do Reino$t$, conteudo = $conteudo$PARTE 1 DE 2

mesma verdade. O Reino de Deus é o poder de Deus. Salmos 145.13: “O teu reino é o de todos os séculos, e o teu domínio subsiste por todas as gerações”. O domínio do governo de Deus é o céu e a ter ra, mas o versículo não faz referência ao caráter permanente desse domí nio. É o governo de Deus que é eterno. Daniel 2.37: “Tu, ó rei, rei de reis, a quem o Deus do céu conferiu o reino, o poder, a força e a glória”. Observe os sinônimos de “reino”: “poder”, “força”, “glória” — todos são expressões de autorida de. Esses termos definem “reino” como o “governo” que Deus concedeu ao rei. Sobre Belsazar, está escrito: “Contou Deus o teu reino e deu cabo dele” (Dn 5.26). Está claro que o domínio sobre o qual Belsazar reinava não foi destruído. O domínio da Babilônia e o povo não chegaram a um fim: foram transferidos para outro governante. Foi o governo do rei que terminou, e o poder foi dado a Dario, o medo (Dn 5.31).

Uma referência nos evangelhos torna esse significado bem claro. Lemos em Lucas 19.11,12:

Ouvindo eles estas coisas, Jesus propôs uma parábola, visto estar perto de Jerusalém e lhes parecer que o reino de Deus havia de manifestar-se imediatamente. Então, disse:

Certo homem nobre partiu para uma terra distante, com o fim de tomar posse de um reino [basileia] e voltar.

O nobre não foi atrás de um domínio, uma área sobre a qual governar. O domínio sobre o qual ele desejava governar estava ali mesmo. O território sobre o qual ele ia governar era o lugar que ele havia deixado. O problema é que ele não era um rei. Ele carecia de autoridade, do direito de reinar. Ele saiu para obter um “reino”, isto é, realeza, autori dade. A Revised Standard Version traduz a palavra por “poder real”.

Alguns anos antes dos dias de nosso Senhor aconteceu o se guinte. No ano 40 a.C., as condições políticas da Palestina eram caóticas. Os romanos haviam subjugado o país no ano 63 a.C., mas a es tabilidade veio lentamente. Herodes, o Grande, foi finalmente a Roma pa ra receber o reino do Senado romano. Ali, foi declarado rei. Ele literalmente foi a um país distante para receber um reino, a autoridade de ser rei na Judeia, sobre os judeus. É bem possível que nosso Senhor tivesse esse fato em mente, nessa parábola. De qualquer forma ela exemplifica o significa do fundamental de reino.

O Reino de Deus é a realeza, o governo, a autoridade de Deus. Se entendermos isso, poderemos atravessar o Novo Testamento e encontrar diversas passagens nas quais esse significado é evidente. O Reino não é um lugar ou um povo, mas o reinado de Deus. Jesus disse que de vemos “receber o reino de Deus” como criancinhas (Mc 10.15). O que é recebido? A Igreja? O céu? É o governo de Deus. Para entrar na futura esfera do Reino, é preciso submeter-se em perfeita confiança ao governo de Deus aqui e agora.

Devemos também buscar, “em primeiro lugar, o seu reino e a sua justiça” (Mt 6.33). Qual o objetivo de nossa busca? A Igreja? O céu? Não. Devemos buscar a justiça de Deus — seu controle, seu governo, seu reinado sobre nossa vida.

Quando oramos: “Venha o teu reino”, estamos orando para que o céu venha à terra? Num certo sentido, sim, mas o céu é um objeto do desejo apenas porque o reinado de Deus será percebido mais perfeitamente que agora. À parte do reinado de Deus, o céu não tem significado. Portanto, oramos: “Venha o teu reino; faça-se a tua vontade, assim na terra como no céu”. Essa oração é um pedido para que Deus reine, que manifeste sua sobera nia e poder reais, dispersando todo inimigo da justiça e de seu governo di vino, que só Deus seja o Rei sobre todo o mundo.

O mistério do Reino

O capítulo 4 de Marcos e o capítulo 13 de Mateus contêm um grupo de parábolas que apresentam “o mistério do reino de Deus” (Mc 4.11). A parábola é uma história extraída da experiência diária das pessoas ese destina a ilustrar a verdade central da mensagem de nosso Senhor. Essa ver dade central é chamada o “mistério” do Reino.

Antes de tudo, devemos determinar o significado do termo “mistério”. O mistério, no sentido bíblico, não é algo misterioso nem pro fundo, obscuro, oculto e difícil. No linguajar moderno, a palavra pode ter tais conotações, mas não podemos interpretar a Bíblia pelas expressões modernas. Nas Escrituras, “mistério” geralmente é um conceito técnico cujo significado é apresentado em Romanos 16.25,26. Paulo escreve:

Ora, àquele que é poderoso para vos confirmar segundo o meu evangelho e a pregação de

Jesus Cristo, conforme a revelação do mistério guardado em silêncio nos tempos eternos, e que, agora, se tornou manifesto e foi dado a conhecer por meio das Escrituras proféticas, segundo o mandamento do Deus eterno, para a obediência por fé, entre todas as nações.

Esta é a ideia bíblica de mistério: algo que foi mantido em segredo durante longo período, mas agora está sendo revelado. É um propósito divino que Deus estabeleceu desde a eternidade, mas que foi mantido oculto da humanidade. Finalmente, entretanto, no decorrer de seu plano redentor, Deus re vela esse propósito e, por meio das Escrituras dos profetas, torna-o conhecido a todos os homens. O mistério é um propósito divino, escondido nos conse lhos de Deus durante longas eras, mas por fim manifesto numa nova re velação da obra redentora de Deus.

As parábolas apresentam o mistério do Reino — uma nova verdade so bre o Reino de Deus que não está explicada no Antigo Testamento, mas que finalmente foi revelada no ministério terreno de nosso Senhor. Que mistério é esse?

A perspecti va do Anti go Testamento a respeito do Reino

Encontramos no Antigo Testamento a resposta a essa pergunta numa tí pica profecia sobre a chegada do Reino de Deus. Em Da niel 2, o rei Nabucodonosor recebe a visão de uma grande imagem que tinha a cabeça de ouro, o peito de prata, os quadris de bronze, as pernas de ferro e os pés de ferro e barro. Então ele viu uma pedra ser cortada sem ajuda de mãos, que atingiu a imagem nos pés e a reduziu a pó. O pó foi varrido pelo vento, e dele “não se viram mais vestígios”. Então a pedra que des truiu a imagem tornou-se uma grande montanha e encheu toda a terra (Dn 2.31-35).

A interpretação é dada nos versículos 44 e 45. A imagem representa as sucessivas nações que iriam dominar o rumo da história mundial. O sig nificado da pedra é explicado com estas palavras:

Nos dias destes reis, o Deus do céu suscitará um reino que não será jamais destruído; este reino não passará a outro povo; esmiuçará e consumirá todos estes reinos, mas ele mesmo subsistirá para sempre, como viste que do monte foi cortada uma pedra, sem auxílio de mãos, e ela esmiuçou o ferro, o bronze, o barro, a prata e o ouro. O Grande Deus fez saber ao rei o que há de ser futuramente.

Eis a perspectiva do futuro profético do Antigo Testamento. Os profe tas aguardavam um dia glorioso, em que viria o Reino de Deus e Deus estabeleceria seu reinado sobre a terra. Você deve estar lembrado de que o significado básico do Reino de Deus é o reinado de Deus. Naquele dia, quando estabelecer SEU reinado, Deus destituirá todos os outros reinados, todos os outros reinos e autoridades. Extinguirá a soberania orgulhosa do homem, manifestada no governo das na ções que têm dominado o cenário da história da terra. O reinado de Deus, o Reino de Deus, o governo de Deus eliminará todo governo contrário. Só Deus será Rei naqueles dias.

Na perspectiva do Antigo Testamento, a vinda do Reino de Deus é vista como um grande e único acontecimento, uma poderosa manifestação do poder divino, que destruirá os reinos perversos da soberania hu mana e encherá a terra com justiça.

Uma nova revelação do Reino

Devemos retornar agora ao evangelho de Mateus e relacionar essa verdade com nosso estudo anterior. João Batista anunciou a chegada do Reino de Deus (Mt 3.2), que ele entendia ser a vinda do Reino previsto no Antigo Testamento. Aquele que viria traria um batismo duplo. Alguns seriam batizados com o Espírito Santo e experimentariam a salvação mes siânica do Reino de Deus, enquanto outros seriam batizados com o fogo do juízo final (Mt 3.11). Que essa é a interpretação de João, está claro no versículo seguinte. A obra do Messias será peneirar e separar os seres humanos. Assim como o lavrador debulha e peneira o grão, preservando este e jogan do fora a palha, o Messias virá para limpar sua eira, ajuntando o grão em seu celeiro (salvação para os justos) e lançando os perversos no fogo inextinguível (v. 12). A expressão “fogo inextinguível” indica que não é uma re ferência à experiência humana comum, mas ao juízo escatológico.

De sua prisão, João envia mensageiros a Jesus, para saber se ele é realmente aquele que devia vir, ou se deviam esperar outro. A dúvida de João tem sido interpretada como perda de confian ça na própria missão e na vocação divina por causa de seu aprisionamen to. Contudo, as palavras elogiosas de Jesus a respeito de João tornam tal interpretação improvável. João não era uma vara que podia ser sacudida pelo vento (Mt 11.7).

A dúvida de João surgiu pelo fato de Jesus não estar agindo como o Messias que João havia anunciado. Onde estava o batismo do Espí rito Santo? Onde estava o julgamento dos perversos?

Jesus respondeu que era realmente o Portador do Reino, que os si nais da era messiânica da profecia estavam se manifestando. Jesus disse ainda: “Bem-aventurado é aquele que não achar em mim motivo de tropeço” (Mt 11.6). “És tu aquele que estava para vir ou havemos de esperar outro?” Por que João fez essa pergunta? Porque a profecia de Daniel não parecia estar em processo de cumprimento. Herodes Antipas governava na Galileia. As legiões romanas marchavam pelas ruas de Jerusalém. A autorida de repousava nas mãos de Pilatos, um romano pagão. A Roma idólatra, politeísta e imoral governava o mundo com mão de ferro. Embora Roma tives se grande sabedoria e precaução em governar seus súditos, garantindo aos judeus concessões por causa de seus escrúpulos religiosos, ainda assim só Deus possuía o direito de governar seu povo. A soberania pertence a Deus somente. Eis aí a dúvida de João, e era a dúvida de cada judeu devoto, até mesmo dos discípulos mais íntimos de Jesus, em seus esforços por entender e interpretar a pessoa e o ministério dele. Como ele podia ser o Portador do Reino se o pecado e as instituições pecadoras permaneciam sem punição?

Jesus respondeu: “Bem-aventurado é aquele que não achar em mim motivo de tropeço”. O que Jesus quis dizer foi o seguinte: “Sim, o Reino de Deus está aqui, mas existe um mistério — uma nova revelação sobre o Reino. O Reino de Deus está aqui, mas em vez de destruir a soberania humana, ele atacou a soberania de Satanás. O Reino de Deus está aqui, mas em vez de fazer mudanças na ordem vigente no plano visível e político, está fazendo mudanças no plano espiritual e na vida de homens e mulheres”.

Esse é o mistério do Reino, a verdade que Deus agora revela pela primei ra vez na história da redenção. O Reino de Deus deve operar entre a humanidade em duas etapas diferentes. O Reino ainda está para vir na forma profetizada por Daniel, quando toda soberania humana será desalojada pela soberania de Deus. O mundo ainda verá a vinda do Reino de Deus com poder, mas o mistério, a nova revelação, é que esse mesmo Reino veio agora para operar entre os homens, mas não da forma imaginada. Ele não está destruindo agora o governo humano; não está abolindo agora o pe cado na terra; não está produzindo agora o batismo de fogo que João anunciou. Ele veio silenciosa, discreta e secretamente. Ele pode operar entre os homens e nunca ser reconhecido pelas multidões. Na esfera espiritual, o Reino oferece agora aos homens as bênçãos do governo divino, libertando-os do poder de Satanás e do pecado. O Reino de Deus é uma oferta, um dom que pode ser aceito ou rejeitado. O Reino está aqui e agora persuadindo, em vez de demonstrar poder.

Cada uma das parábolas de Mateus 13 ilustra o mistério de que o Reino de Deus que ainda está por vir em poder e grande glória já está presente entre os homens, para, antecipada e surpreendentemente, trazer aos homens da presente era do mal as bênçãos da era vindoura.

Esse é o mistério do Reino. Antes do dia da colheita, antes do fim dos sé culos, Deus entrou na História pela pessoa de Cristo para operar entre os ho mens, para trazer-lhes a vida e as bênçãos do Reino, o qual chegou de forma humilde e discreta. Ele veio à humanidade na forma de um carpintei ro galileu que percorreu as cidades da Palestina pregando o evangelho do Reino e libertando os homens da escravidão ao Diabo. Veio na forma dos discípulos daquele carpinteiro, que percorreram as vilas da Galileia com a mesma mensagem. Vem aos homens de hoje quando os discípu los de Jesus ainda levam o evangelho do Reino a todo o mundo. O Reino vem mansa e humildemente, sem fogo do céu, sem resplendor de gló ria, sem derrubar montanhas ou fender os céus. Vem como a semente se meada na terra. Pode ser rejeitado pelos corações endurecidos, pode ser su focado, sua vida pode às vezes parecer se abater e morrer, mas é o Reino de Deus. Ele produz o milagre da vida divina entre os homens e apresen ta aos homens as bênçãos do governo divino. É para eles a obra sobrenatural da graça de Deus. Esse Reino, esse poder sobrenatural de Deus, é o mesmo que se manifestará no final dos tempos, porém não mais de maneira silenciosa nas vidas daqueles que o recebem, mas em poder e grande glória, removendo todo o pecado e todo o mal da terra. Esse é o evangelho do Reino.

Quando virá o Reino?

Neste estudo final, iremos examinar um único versículo dos ensinamentos de nosso Senhor. A verdade contida nesse versículo é, sob certo aspec to, a mais importante de toda esta série de estudos para a Igreja de hoje. É um texto cujo significado só pode ser percebido se tivermos a base do estudo mais abrangente sobre o Reino de Deus.

Descobrimos que o Reino de Deus é o reinado de Deus que impõe derrota aos seus inimigos e leva a humanidade a desfrutar das bênçãos do reinado divi no. Descobrimos que o reinado de Deus é alcançado em três grandes atos, de modo que podemos dizer que a chegada do Reino se dá em três etapas. A terceira e última vitória acontece no fim do Milênio, quando a morte, Satanás e o pe cado são finalmente destruídos, e o reino é instalado em sua perfeição final. A segunda vitória acontece no começo do Milênio quando Satanás é acorrentado e lançado no abismo. No entanto, o pecado e a morte, ao que parece, con tinuarão nesse período, pois a morte só será lançada no lago de fogo até o final do Milênio.

A manifestação inicial do Reino de Deus encontra-se na missão de nosso Senhor na terra. Antes da era vindoura, antes do reinado milenar de Cristo, o Reino de Deus penetrou imediatamente na presente era do mal, por meio da pessoa e obra de Cristo. Portanto, podemos experimentar agora seu poder; podemos conhecer sua vida; podemos começar a participar de suas bênçãos. Depois de adentrarmos o gozo das bênçãos do Reino de Deus, nossa última pergunta é: o que vamos fazer como resultado dessas bênçãos? Iremos passivamente desfrutar a vida do Reino enquanto aguarda mos a consumação que se dará por ocasião da volta do Senhor? Sim, temos de aguardar, mas não passivamente. Talvez o versículo mais importante da Palavra de Deus para o povo de Deus na atualidade seja o texto deste estu do: Mateus 24.14.

Esse versículo sugere o assunto deste artigo: “Quando virá o Reino?”. Essa pergunta naturalmente se refere à manifestação do Reino de Deus com poder e glória quando o Senhor Jesus retornar. Há muito interesse entre o povo de Deus acerca do tempo da volta de Cristo. Será logo, ou vai demorar? Mui tas conferências bíblicas apresentam mensagens que examinam a Bíblia e folheiam os jornais para entender as profecias e ossinais dos tem pos, na tentativa de determinar a proximidade do fim. Nosso texto é a de claração mais explícita da Palavra de Deus sobre a época da vinda de nosso Senhor. Não há outro versículo que fale tão concisa e especificamente sobre a hora em que o Reino virá.

O capítulo tem início com as perguntas dos discípulos ao Senhor que admiravam o templo, cuja destruição Jesus acabara de anunciar: “Dize-nos quando sucederão estas coisas e que sinal haverá da tua vinda e da consumação do século” (Mt 24.3). Os discípulos esperavam que esta era terminasse com a volta de Cristo em glória. O Reino viria com o início da era vindoura. Eis a pergunta: “Quando terminará esta era? Quando retornarás, trazendo o Reino?”.

Jesus deu uma resposta detalhada à pergunta deles. Começou por des crever o curso desta era até o final. Esta era do mal irá durar até sua volta e sempre será hostil ao evangelho e ao povo de Deus. O mal prevalece rá. Influências sutis, enganadoras, procurarão afastar os homens de Cristo. Religiões falsas, messias enganadores irão desviar a muitos. As guerras con tinuarão; haverá fomes e terremotos. A perseguição e o martírio assolarão a Igreja. Os crentes sofrerão ódio até o fim desta era. Os homens irão tropeçar e trair-se uns aos outros. Falsos profetas se levantarão, a iniquidade irá proliferar, e o amor de muitos vai esfriará.

É um quadro sombrio, mas é o que devemos esperar de uma era sob os dominadores deste mundo tenebroso (Ef 6.12). Contudo, o quadro não é de escuridão e maldade irrestritas. Deus não abandonou a presente era às trevas. Es crituras apocalípticas judaicas do período do Novo Testamento concebiam uma era sob o controle absoluto do mal. Deus havia se retirado da participação ativa nos negócios humanos; a salvação pertencia apenas ao futuro quando o Reino de Deus viesse em glória. O presente testemunharia apenas tristezas e sofrimentos.

Alguns cristãos têm refletido a mesma atitude pessimista. Sata nás é o “deus deste século”, portanto, dizem, o povo de Deus não deve esperar na da além do mal e da derrota nesta era. A Igreja se tornará apóstata; a civilização será inteiramente corrompida. Os cristãos lutarão uma batalha perdida até a volta de Cristo.

De fato, a Palavra de Deus ensina que haverá uma intensificação do mal no fim do século, pois Satanás permanece como deus deste século. Entretanto, negamos de forma veemente que Deus tenha abandonado a presente era ao Malig no. Na verdade, o Reino de Deus já penetrou nesta era do mal. Satanás já foi derrotado. O Reino de Deus, em Cristo, criou a Igreja e opera no mundo por meio dela na realização dos propósitos divinos de expansão de seu Reino no mundo. Somos apanhados numa grande luta — o conflito dos séculos. O Reino de Deus opera neste mundo pelo poder do evangelho: “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”.

O evangelho do Reino

Nesse texto encontro três coisas: uma mensagem, uma missão e um motivo. A mensagem é o evangelho do Reino, as boas novas do Reino de Deus.

Alguns ensinam que o evangelho do Reino não é o evangelho da salvação, e sim um evangelho que anuncia a volta de Cristo, a ser pregado na tribulação por um remanescente judeu depois que a Igreja tiver partido. Não há como discutir aqui amplamente esse problema, mas podemos descobrir que o evangelho do Reino é o evangelho que foi proclamado pelos apóstolos na Igreja primitiva.

Contudo, devemos, em primeiro lugar, observar uma íntima relação en tre o versículo em estudo e a Grande Comissão. Na ascensão, o Senhor comis sionou os discípulos: “Ide,

PARTE 2 DE 2

naturalmente se refere à manifestação do Reino de Deus com poder e glória quando o Senhor Jesus retornar. Há muito interesse entre o povo de Deus acerca do tempo da volta de Cristo. Será logo, ou vai demorar? Mui tas conferências bíblicas apresentam mensagens que examinam a Bíblia e folheiam os jornais para entender as profecias e ossinais dos tem pos, na tentativa de determinar a proximidade do fim. Nosso texto é a de claração mais explícita da Palavra de Deus sobre a época da vinda de nosso Senhor. Não há outro versículo que fale tão concisa e especificamente sobre a hora em que o Reino virá.

O capítulo tem início com as perguntas dos discípulos ao Senhor que admiravam o templo, cuja destruição Jesus acabara de anunciar: “Dize-nos quando sucederão estas coisas e que sinal haverá da tua vinda e da consumação do século” (Mt 24.3). Os discípulos esperavam que esta era terminasse com a volta de Cristo em glória. O Reino viria com o início da era vindoura. Eis a pergunta: “Quando terminará esta era? Quando retornarás, trazendo o Reino?”.

Jesus deu uma resposta detalhada à pergunta deles. Começou por des crever o curso desta era até o final. Esta era do mal irá durar até sua volta e sempre será hostil ao evangelho e ao povo de Deus. O mal prevalece rá. Influências sutis, enganadoras, procurarão afastar os homens de Cristo. Religiões falsas, messias enganadores irão desviar a muitos. As guerras con tinuarão; haverá fomes e terremotos. A perseguição e o martírio assolarão a Igreja. Os crentes sofrerão ódio até o fim desta era. Os homens irão tropeçar e trair-se uns aos outros. Falsos profetas se levantarão, a iniquidade irá proliferar, e o amor de muitos vai esfriará.

É um quadro sombrio, mas é o que devemos esperar de uma era sob os dominadores deste mundo tenebroso (Ef 6.12). Contudo, o quadro não é de escuridão e maldade irrestritas. Deus não abandonou a presente era às trevas. Es crituras apocalípticas judaicas do período do Novo Testamento concebiam uma era sob o controle absoluto do mal. Deus havia se retirado da participação ativa nos negócios humanos; a salvação pertencia apenas ao futuro quando o Reino de Deus viesse em glória. O presente testemunharia apenas tristezas e sofrimentos.

Alguns cristãos têm refletido a mesma atitude pessimista. Sata nás é o “deus deste século”, portanto, dizem, o povo de Deus não deve esperar na da além do mal e da derrota nesta era. A Igreja se tornará apóstata; a civilização será inteiramente corrompida. Os cristãos lutarão uma batalha perdida até a volta de Cristo.

De fato, a Palavra de Deus ensina que haverá uma intensificação do mal no fim do século, pois Satanás permanece como deus deste século. Entretanto, negamos de forma veemente que Deus tenha abandonado a presente era ao Malig no. Na verdade, o Reino de Deus já penetrou nesta era do mal. Satanás já foi derrotado. O Reino de Deus, em Cristo, criou a Igreja e opera no mundo por meio dela na realização dos propósitos divinos de expansão de seu Reino no mundo. Somos apanhados numa grande luta — o conflito dos séculos. O Reino de Deus opera neste mundo pelo poder do evangelho: “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”.

O evangelho do Reino

Nesse texto encontro três coisas: uma mensagem, uma missão e um motivo. A mensagem é o evangelho do Reino, as boas novas do Reino de Deus.

Alguns ensinam que o evangelho do Reino não é o evangelho da salvação, e sim um evangelho que anuncia a volta de Cristo, a ser pregado na tribulação por um remanescente judeu depois que a Igreja tiver partido. Não há como discutir aqui amplamente esse problema, mas podemos descobrir que o evangelho do Reino é o evangelho que foi proclamado pelos apóstolos na Igreja primitiva.

Contudo, devemos, em primeiro lugar, observar uma íntima relação en tre o versículo em estudo e a Grande Comissão. Na ascensão, o Senhor comis sionou os discípulos: “Ide, portanto, fazei discípulos de todas as nações, batizando-os em nome do Pai, e do Filho, e do Espírito Santo; ensinando-os a guardar todas as coisas que vos tenho ordenado. E eis que estou convosco todos os dias até à consumação do século” (Mt 28.19,20). Quando comparamos estes versículos, eles falam por si mesmos: “Dize-nos [...] que sinal haverá da tua vinda e da consumação do século”; “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”; “Ide, [...] fazei discípulos de todas as na ções. E eis que estou convosco até à consumação do século”. Os ver sículos falam da mesma missão: a evangelização do mundo até o fim do século. Esse fato liga Mateus 28.19 a Mateus 24.14.

O livro de Atos relata que os apóstolos partiram em cumprimento dessa missão. Em Atos 8.12, está registrado que Filipe foi à Samaria e “evangelizava a respeito do reino de Deus”. Mateus 24.14 refere-se ao “evangelho do reino”. Esse evangelho deve ser pregado a todo o mundo. Filipe foi a Samaria, evangelizando a respeito do Reino de Deus, isto é, pregando o evangelho do Reino. Em Atos 8.12, temos as mesmas expressões de Mateus 24.14, com a exceção de que em Atos temos um verbo, em vez de um substan tivo, sendo a locução prepositiva “a respeito de” inserida na frase.

Paulo, quando foi a Roma, reuniu os judeus, pois sempre pregava o evangelho “primeiro para os judeus”. Qual foi sua mensagem? “Havendo-lhe eles marcado um dia, vieram em grande número ao encontro de Paulo na sua própria residência. Então, desde a manhã até à tarde, lhes fez uma exposição em testemunho do reino de Deus, procurando persuadi-los a respeito de Jesus” (At. 28.23). O testemunho do Reino de Deus, o evangelho do Reino, foi a mensagem que Paulo proclamou aos judeus em Roma.

Contudo, Paulo enfrentou a mesma reação que nosso Senhor quando este apareceu em Israel anunciando o Reino de Deus (Mt 4.17). Alguns creram, porém, a maioria dos judeus rejeitou sua mensa gem. Paulo anunciou, então, o propósito divino para os gentios diante da incredulidade de Israel. “Tomai, pois, conhecimento de que esta salvação de Deus foi enviada aos gentios. E eles a ouvirão” (At. 28.28). Paulo pregava aos judeus o Reino de Deus, contudo, eles o rejeitaram. Portanto, “esta salvação de Deus” foi oferecida aos gentios. O fato de que o evangelho do Reino de Deus é o mesmo que a mensagem da salvação fica comprovado ainda nos versículos seguintes. “Por dois anos, permaneceu Paulo na sua própria casa, que alugara, onde recebia todos que o procuravam, pregando o reino de Deus, e, com toda a intrepidez, sem impedimento algum, ensinava as coisas referentes ao Senhor Jesus Cristo” (v. 30,31). O Reino foi pregado aos judeus, e, quando eles o rejeitaram, passou a ser proclamado aos gentios. As boas novas do Reino de Deus constituíam a mensagem de Paulo tanto para os judeus quanto para os gentios.

Vitória sobre a morte

Retornemos às passagens bíblicas que definem com clareza e simplicidade evangelho do reino o evangelho do Reino. Em 1Coríntios 15.24-26, Paulo esboça as etapas da obra redentora de nosso Senhor. Ele descreve a vitória do reinado messiânico de Cristo com estas palavras: “... então, virá o fim, quando ele entregar o reino ao Deus e Pai, quando houver destruído todo principado, bem como toda potestade e poder. Porque convém que ele reine”. Jesus tem de reinar como Rei, tem de reinar em seu Reino. “até que haja posto todos os inimigos debaixo dos pés. O último inimi go a ser destruído é a morte”.

Eis a explicação bíblica do significado do reinado de Cristo pelo qual o seu Reino atingirá seu objetivo. É o reinado de Deus na pessoa do seu Fi lho, Jesus Cristo, com o propósito de colocar seus inimigos debaixo de seus pés. “O último inimigo a ser destruído é a morte”: a destruição da morte é a missão do Reino de Deus. O Reino de Deus também deverá destruir qualquer ou tro inimigo, entre eles o pecado e Satanás, pois a morte é o salário do pecado (Rm 6.23) e é Satanás que detém o poder sobre a morte (Hb 2.14). Só quando a morte, o pecado e Satanás forem destruídos, os redimi dos conhecerão as bênçãos perfeitas do reinado de Deus.

O evangelho do Reino é o anúncio da conquista da morte por Cristo. Descobrimos que Cristo já derrotou a morte, embora a consumação dessa vitória seja futura, quando a morte finalmente for lançada no lago de fogo (Ap 20.14). Falando da graça de Deus, Paulo diz que ela foi “manifestada, agora, pelo aparecimento de nosso Salvador Cristo Jesus, o qual não só destruiu a morte, como trouxe à luz a vida e a imortalidade, mediante o evangelho” (2Tm 1.10). A palavra aqui traduzida por “destruir” não significa “acabar com”, e sim “derrotar”, “quebrar seu poder”, “colocar fora de ação”. A mesma palavra grega é usada em 1Coríntios 15.26: “O último inimigo a ser destruído é a morte”. Essa palavra aparece também em 1Coríntios 15.24: “... então, virá o fim, quando ele entregar o reino ao Deus e Pai, quando houver destruído todo principado, bem como toda potestade e poder”.

Portanto, há dois estágios na destruição — extinção, derrota — da morte. Sua destruição final aguarda a segunda vinda de Cristo, mas por meio de sua morte e ressurreição, Cristo já a destruiu. Ele quebrou seu poder. A morte ainda é um inimigo, porém um inimigo derrotado. Estamos certos da vitória futura por causa da vitória que já foi alcançada. Temos uma vitória alcançada a proclamar.

Essas são as boas novas do Reino de Deus. Como a humanidade precisa desse evangelho! Aonde quer que formos, encontramos a sepultura escanca rada engolindo os que morrem. Lágrimas de perda, de separação, de parti da final escorrem por todas as faces. Cada mesa, mais cedo ou mais tarde, verá uma cadeira vazia, cada sala terá um lugar desocupado no sofá ou na poltrona. A morte é a grande niveladora. Riqueza ou pobreza, fama ou obscuridade, poder ou fraqueza, sucesso ou fracasso, raça, credo ou cultura: as diferenças humanas nada significam diante desse golpe irresistível e final da segadora da morte, que nos derruba a todos. O túmulo pode ser o fabuloso Taj Mahal, uma pirâmide maciça, uma cova esquecida de grama pisada ou as profundezas insondáveis do mar, mas o fato permanece: a morte reina.

Depois do evangelho do Reino, a morte é o poderoso conquistador dian te do qual todos nos vemos desamparados. Podemos, embora inutilmente, apenas esmurrar a tumba, que não cede nem responde. As boas novas, no entanto, são estas: a morte já foi derrotada. Nosso conquistador foi conquistado. Diante do poder do Reino de Deus em Cristo, a morte é impotente. Ela não pôde mantê-lo preso. A morte foi derrotada, e a vida e a imortalidade foram trazidas à luz. Uma sepultura vazia em Jerusalém é a prova disso. Esse é o evangelho do Reino.

Vitória sobre Satanás

O inimigo do Reino de Deus é Satanás. Cristo deve reinar até que tenha co locado Satanás sob seus pés. Essa vitória também aguarda a vinda de Cristo. Durante o Milênio, Satanás será amarrado no abismo. Só no final do Milênio ele será lançado no lago de fogo.

Contudo, descobrimos que Cristo já derrotou Satanás. A vitória do Reino de Deus não é apenas futura: uma grande vitória inicial já aconteceu. Cristo participou da carne e do sangue. Ele encarnou “para que, por sua morte, destruísse aquele que tem o poder da morte, a saber, o diabo, e livrasse todos que, pelo pavor da morte, estavam sujeitos à escravidão por toda a vida” (Hb 2.14,15). A palavra traduzida por “destruir” é a mes ma encontrada em 2Timóteo 1.10 e 1Coríntios 15.24,26. Cristo anulou o poder da morte. Ele anulou também o poder de Satanás. Satanás ainda anda ao redor como um leão que ruge em perseguição ao povo de Deus (1Pe 5.8) e se insinua como um anjo de luz nos círculos reli giosos (2Co 11.14). Entretanto, ele é um inimigo derrotado. Seu poder, isto é, seu domínio foi desfeito. Seu destino é certo. Uma vitória decisiva, ou melhor, a vitória decisiva foi ganha. Cristo expulsa demônios, libertando os ho mens da escravidão satânica, demonstrando que o Reino de Deus liberta os homens da escravidão de Satanás. O Reino tira-os das trevas e os conduz à luz salvadora e restauradora do evangelho. Estas são as boas novas acerca do Reino de Deus: Satanás está derrotado e podemos ser libertados do temor demoníaco e do mal satânico para conhecer a gloriosa liberdade dos filhos de Deus.

Vitória sobre o pecado

O pecado é um inimigo do Reino de Deus. Cristo já fez alguma coisa em relação ao pecado, ou apenas prometeu um livramento futuro, quando o Reino vier em glória? Temos de admitir que o pecado, assim como a morte, es tá circulando pelo mundo. Cada jornal e cada revista dão um testemunho eloquente da atuação do pecado. No entanto, o pecado, a exemplo da morte e de Sa tanás, já foi derrotado. Cristo apareceu para acabar com o pecado pelo sacrifício de si mesmo (Hb 9.26). O poder do pecado foi desfeito, “sabendo isto: que foi crucificado com ele o nosso velho homem, para que o corpo do pecado seja destruído, e não sirvamos o pecado como escravos” (Rm 6.6). Aqui encontramos pela terceira vez a palavra “destruir”. A atuação de Cristo como Rei tem o objetivo de “destruir” cada inimigo (1Co 15.24, 26). Essa obra é futura, mas também passada. O que nosso Senhor irá concluir em sua segunda vinda, ele já começou com sua morte e ressurreição. A “morte” foi delimitada, destruída (2Tm 1.10). Satanás foi destruído (Hb 2.14). Em Romanos 6.6, vemos o “corpo do pecado” eliminado, destruído. A mesma palavra de vitória e de destrui ção dos inimigos de Cristo é usada três vezes nesta vitória tripla: sobre Satanás, sobre a morte e sobre o pecado.

Portanto, não estamos mais escravizados pelo pecado (Rm 6.6). A escravidão é coisa do passado. O pecado está no mundo, mas seu poder já não é o mesmo. O ser humano já não fica mais desamparado diante dele, pois seu domínio foi desfeito. O poder do Reino de Deus invadiu esta era, um poder que pode libertar a humanidade da escravidão do pecado.

O evangelho do Reino é o anúncio do que Deus fez e irá fazer. É sua vitória sobre os inimigos. São as boas novas de que Cristo irá voltar a fim de destruir para sempre seus inimigos. É um evangelho de esperança. São também as boas novas do que ele já fez. Ele já desfez o poder da morte, derrotou Satanás e venceu o domínio do pecado. O evangelho é uma promessa, mas também uma experiência, e a promessa está fundamentada na experiência. O que Cristo fez garante o que ele fará. Esse é o evangelho que devemos levar a todo o mundo.

A missão do Reino

Em Mateus 24.14, encontramos também uma missão,além da mensagem. O evangelho do Reino — as boas novas da vitória de Cristo sobre os inimigos de Deus — deve ser pregado em todo o mundo para teste munho a todas as nações. Essa é a nossa missão. Esse versículo é um dos mais importantes de toda a Palavra de Deus para explicar o significado e o propósito da história humana.

O significado da História

O significado da História é um problema que confunde a men te dos pensadores. Não é preciso que alguém nos lembre que a presente geração enfrenta uma destruição potencial de proporções tão imensas que poucos de nós tentamos imaginar como seria a terrível realidade. Diante da ameaça de tal catástrofe, a humanidade está se questionando, como nunca antes. Qual o significado da História? Por que o ser humano está na terra? Para onde ele vai? Existe algum significado, propósito ou destino que leve a humanidade a algum objetivo? Ou, repetindo uma metáfo ra, somos meros fantoches percorrendo desajeitada mente o palco da História, tendo como destino incendiar o palco, destruin do com ele os fantoches e não deixando nada além de um punhado de cinzas e o cheiro de queimado? Será esse o destino da história humana?

Numa geração anterior, a filosofia do progresso foi amplamente acei ta. Alguns pensadores traçavam o significado da História por meio de uma simples linha reta que levava a uma inclinação gradual, porém contínua, do co meço selvagem e primitivo para um nível superior de cultura e civilização. A filosofia do progresso ensinava que a humanidade, por causa de seu caráter intrínseco, destina-se a melhorar até que um dia venha a atingir a so ciedade perfeita, livre de todo mal, de todas as guerras, de toda a pobreza e de toda a animosidade. Esse ponto de vista despedaçou-se na bigorna da História. Os atuais acontecimentos tornaram o conceito de progresso inevi tável, uma ideia intolerável e irreal.

Outro ponto de vista interpreta a História como uma série de ciclos numa grande espiral. Há movimentos para cima e para baixo. Existem altos e bai xos na espiral, porém cada subida é um pouco mais elevada que a última e cada descida é tão baixa quanto a precedente. Embora tenhamos nossos “altos e baixos”, o movimento da espiral como um todo é para cima. É uma modificação da doutrina do progresso.

Outras interpretações são pessimistas. Alguém já suge riu que a ilustração mais acertada sobre o significado da História é o con junto de pegadas feitas por uma mosca bêbada com os pés molhados de tin ta, cambaleando sobre um pedaço de papel branco. Seus passos não levam a lugar algum nem refletem um padrão de significado. Um dos maiores eruditos contemporâneos do Novo Testamento, Rudolf Bultmann, escre veu: “Atualmente não podemos declarar que conhecemos o fim e o alvo da História. Portanto, a questão do significado da história tornou-se sem signi ficado”.

Muitas das mentes mais brilhantes de nossa geração estão com esse pro blema. O determinismo econômico do sistema marxista repousa sobre a filosofia da história, que é inteiramente baseada no material. Entretanto, é uma filosofia e promete um destino aos seus seguidores. Spengler acreditava que o progresso era impossível e que a história estava conde nada ao declínio e à degeneração inevitáveis. Toynbee produziu um estudo monumental onde tenta encontrar padrões e ciclos de significado na histó ria das civilizações.

Já eruditos como Niebuhr, Rust e Piper escreveram estu dos profundos que oferecem indicações quanto ao significado da História de acordo com a verdade bíblica da revelação. Trata-se de um proble ma profundo, e não queremos pôr de lado as complexidades da questão com um dar de ombros. Contudo, é convicção do autor que o sig nificado final da História deve ser encontrado na ação de Deus na história humana conforme registrado e interpretado nas Escrituras inspiradas. Aqui, a fé cristã deve falar. Se não há Deus, o homem está perdido num labirinto de experiências assustadoras sem nenhum significado para orientá-lo. Se Deus não agiu na História, o fluxo e refluxo das marés dos séculos vêm e vão sem destino entre as areias da eternidade. Entretanto, o fato básico da Palavra de Deus é que Deus falou, Deus operou de forma redentora na História, e a ação divina ainda a conduzirá a um alvo divinamente estabelecido.

Se não há um Deus com a mão no leme da História, então sou pessimista. Todavia, creio em Deus. Creio que Deus tem um propósito e que ele revelou seu propósito na História, em Cristo e em sua Pa lavra. Qual é esse propósito? Onde encontramos seu esboço?

Viajando pelo Oriente Médio, observamos, maravilhados, as ruínas que dão um testemunho silencioso de civilizações outrora poderosas. Colunas maciças ainda estão de pé na direção dos céus, enquanto em outros lu gares apenas imensos amontoados de terra marcam planícies estéreis com os escombros acumulados de civilizações extintas. A Esfinge, as pirâmides de Gizé, as colunas de Persépolis e as torres de Tebas ainda dão um testemu nho eloquente da glória que havia no Egito e na Pérsia. Podemos ainda su bir a Acrópole de Atenas ou pisar o Fórum, em Roma, e sentir algo do es plendor e da glória das civilizações do primeiro século que, sob alguns as pectos, jamais foram ultrapassadas. Contudo, hoje não passam de ruínas, colunas tomba das, estátuas derrubadas, civilizações mortas.

Qual o significado de tudo isso? Por que as nações se levantam e caem? Existe algum propósito? Ou será que a Terra irá um dia se tornar uma estrela morta e sem vida, como a Lua?

O propósito divino e o povo escolhido

A Bíblia tem uma resposta. O tema central de toda a Bíblia é a obra reden tora de Deus na História. Há muito tempo, Deus escolheu um povo peque no e desprezado, Israel. Deus não estava interessado nesse povo por causa do povo propriamente dito. O propósito de Deus visava a toda a humanida de. Deus, em seu desígnio soberano, escolheu esse povo insignificante para que por meio dele pudesse executar seu propósito redentor que depois se estenderia a toda a raça humana. O significado final do Egito, dos assírios, dos caldeus e de outras nações do antigo Oriente encontra-se em seu relacionamento com a pequenina nação de Israel. Deus estabeleceu gover nantes e os derrubou para que pudesse criar Israel. Ele criou esse povo e o preservou. Ele tinha um plano e desenvolveu esse plano na História. Queremos dizer com isso a história redentiva. Só a Bíblia, em toda a literatura antiga, contém uma filosofia da história, e é uma filosofia de redenção.

Então chegou a “plenitude dos tempos”, e apareceu na terra o Senhor Jesus Cristo, um judeu, um filho de Abraão segundo a carne. O propósito de Deus para Israel teve um maravilhoso cumprimento. Isso não significa que Deus tenha exaurido seu propósito em relação a Israel. Significa que, quando Cristo apareceu, o propósito redentor de Deus por meio de Israel alcançou seu objetivo inicial. Até então, a pista para o significado do propósito divi no na História identificava-se com Israel como nação. Quando Cristo realizou sua obra redentora de morte e ressurreição, o propósito divino na história passou de Israel, que rejeitara o evangelho, para a

Igreja, que é a comunhão de judeus e gentios que aceitaram o evangelho. Isso é comprovado nas palavras de nosso Senhor em Mateus 21.43, dirigidas à nação de Israel: “O reino de Deus vos será tirado e será entregue a um povo que lhe produza os respectivos frutos”. A Igreja é “raça eleita, sacerdócio real, nação santa” (1Pe 2.9), e é na atual missão da Igreja, de levar as boas novas do Reino de Deus a todo o mundo, que o propósito redentor de Deus na História está sendo executado.

O significado final da História entre a ascensão de nosso Senhor e seu retorno em glória encontra-se na expansão e atuação do evangelho no mundo: “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”. O propósito divino nos 20 séculos que se passaram desde que nosso Senhor viveu na terra encontra-se na história do evangelho do Reino. O desenrolar do significado acha-se entretecido no programa missionário da Igreja. Um dia, quando entrarmos nos ar quivos do céu para procurar um livro que exponha o significado da história humana como Deus o vê, não apanharemos uma obra intitulada “A his tória do Ocidente”, “O progresso da civilização”, “A glória do Império Britânico” ou “O crescimento e a expansão da América”. O li vro que procuramos será intitulado A preparação e a expansão do evange lho entre as nações,pois só aqui o propósito redentivo de Deus foi exe cutado.

É um fato chocante. Deus confiou a pessoas como nós, pecadores redi midos, a responsabilidade de executar o propósito divino na História. Por que Deus tomou tal decisão? Não estaria assumindo o grande risco de que seu propósito não fosse cumprido? Já são quase 2 mil anos, e o alvo ainda não foi atingido. Por que Deus mesmo não assumiu a tarefa? Por que não enviou as hostes angelicais, em quem podia confiar, para realizar o trabalho? Por que o confiou a nós? Não tentamos res ponder à pergunta, exceto para dizer que essa é a vontade de Deus. Eis os fatos: Deus nos confiou essa missão, e, se nós não a executarmos, ela não se rá feita.

Esse fato devia nos servir de estímulo, mas a Igreja de hoje tem com plexo de inferioridade. Há algumas gerações, o pastor de uma igreja era o líder mais culto e respeitado da comunidade. Foi a época em que, por causa dessa situação cultural, a Igreja exercia uma influência predominante na estrutura da vida comunitária ocidental. Esses dias, porém, há muito já se foram. Sentimos que o mundo jogou a Igreja a um can to e nos passou para trás. A Igreja, de modo geral, não conta mais no mundo. As Nações Unidas não procuram a Igreja em busca de conselhos na solução de seus problemas. Os líderes políticos pouco dependem dos líderes da Igreja para sua orientação. A ciência, a indústria, a educação e o trabalho são áreas em que se buscam a sabedoria e a li derança. A Igreja é deixada de lado. Às vezes, temos a impressão de que realmente não valemos nada. Estamos à margem da influência, fomos em purrados para a periferia e não estamos mais ali, firmes no centro. Temos pena de nós mesmos, desejando que o mundo preste atenção em nós. As sim, assumimos uma atitude defensiva e tentamos justificar nossa existência. De fato, nossa preocupação principal parece ser a autopreservação. Adotamos uma interpretação derrotista de nosso significado e de nosso papel no mundo!

Que esse versículo possa arder em nosso coração. Deus não disse isso de nenhum outro grupo de pessoas. As boas novas do Reino de Deus devem ser pregadas pela Igreja em todo o mundo, para testemu nho a todas as nações. Esse é o programa de Deus.Significa que, para o sentido último da civilização moderna e o destino da história humana, você e eu somos mais importantes que as Nações Unidas. O que a Igreja faz com o evangelho tem mais importância que as decisões do Kremlin. Pela perspectiva da eternidade, a missão da Igreja é mais importan te que o avanço dos exércitos ou as ações das capitais do mundo, porque é no cumprimento dessa missão que o propósito divino para a história humana é realizado. Nossa missão é exatamente essa.

Vamos acabar com esse complexo de inferioridade! Vamos deixar de la do para sempre essa atitude de autocomiseração! Vamos parar de lamentar nossa insignificância! Vamos reconhecer o que somos, isto é, como Deus nos vê, e cumprir o programa divinamente estabelecido! As boas novas do Reino devem ser pregadas em todo o mundo, para testemunho a todas as nações, e então virá o fim. Estou feliz, realmente orgulhoso de fazer parte da Igreja de Cristo, porque a nós foi confiada a mais significativa e digna tarefa confiada a uma instituição humana. Essa responsabilidade confere à minha vida um sig nificado eterno, pois estou participando do plano de Deus para a História. O significado e o destino da História repousam em minhas mãos.

O moti vo do Reino

Finalmente, nosso texto contém um motivo poderoso: “Então virá o fim”. O assunto deste artigo é: “Quando virá o Reino?”. Não estou estabele cendo datas. Não sei quando virá o fim, mas sei o seguinte: quando a Igreja concluir a tarefa de evangelizar o mundo, Cristo voltará. A Pa lavra de Deus o diz. Por que ele não veio no ano 500? Porque a Igreja não havia evangelizado o mundo. Por que ele não voltou no ano 1000? Porque a Igreja ainda não havia concluído a tarefa da evangelização mundial. Será que ele vem em breve? Ele virá — se nós, o povo de Deus, for mos obedientes à ordem do Senhor de levar o evangelho a todo o mundo.

Que tarefa solene! Ela é tão surpreendente que algumas pessoas dizem: “Não posso acreditar nisso! Simplesmente não pode ser verdade que Deus tenha dado tal responsabilidade aos homens”. Quando William Carey expressou seu desejo de levar o evangelho à Índia, no século XVIII, obteve esta resposta: “Sente-se, jovem! Quando Deus quiser evangelizar os pagãos, ele o fará sem sua ajuda”. Carey, no entanto, tinha visão e conhecimento da Palavra de Deus suficientes para rejeitar tal conselho. Ele se levantou e foi para a Índia. Com essa atitude, deu início ao movimento de missões mundiais dos tempos modernos.

Nossa responsabilidade: completar a tarefa

Deus nos confiou a continuação e a consumação da tarefa. Eis algo que me deixa entusiasmado. Estamos próximos do término da missão mais que qualquer geração anterior. Fizemos mais nos últimos séculos pela evangelização do mundo que em todos os séculos ante riores desde a era apostólica. A tecnologia dos últimos séculos nos proporcionou a imprensa, o automóvel, o avião, o rádio e muitos outros meios de realizar a tarefa de levar o evangelho a todo o mundo. Línguas antes desconhecidas estão sendo condicionadas à forma escrita. A Palavra de Deus já está traduzida em milhares de línguas e dialetos, e o número cresce a cada ano. Eis o fato desafiador. Se o povo de Deus, apenas no mundo de língua inglesa, levasse esse texto a sério e correspondesse ao seu desafio, poderíamos concluir a tarefa da evangelização do mundo ainda em nossa geração e testemunharíamos a volta do Senhor.

Alguém dirá: “Isso é impossível. Muitos países estão fecha dos ao evangelho. Não podemos entrar na China. As portas da Índia estão se fechando. Se a volta do Senhor aguarda a evangelização do mundo pela Igreja, então é quase certo que Cristo não irá retornar nesta geração, pois há muitos países fechados ao evangelho, o que torna impossível concluir a tarefa em nossos dias”.

Essa atitude não leva Deus em conta. É verdade que muitas portas estão fechadas no momento, mas Deus é capaz de abrir portas fecha das da noite para o dia e também de trabalhar por trás de portas fe chadas. Minha preocupação não é com as portas fechadas: é com as portas que estão abertas e pelas quais não entramos. Se o povo de Deus fosse realmente fiel e fizesse o possível para con cluir a tarefa, Deus providenciaria a abertura das portas. Nossa responsa bilidade são as muitas portas que estão escancaradas e pelas quais não esta mos entrando. Somos um povo desobediente. Discutimos conceitos de evangelização mundial e debatemos detalhes da escatologia, ao mesmo tempo em que negligenciamos a ordem da Palavra de Deus de evan gelizar o mundo.

Alguém dirá: “Como saberemos que a missão foi cumprida? Em que ponto estamos na realização da tarefa? Que países foram evangelizados e quais os que ainda não foram? Quanto falta para chegarmos ao fim? Não iríamos incorrer com isso no erro de estabelecer datas?”.

Respondo que não sei. Só Deus conhece a definição dos termos. Não preciso definir exatamente o que são “todas as nações”. Só Deus conhece o significado exato de “evangelizar”. Só ele, que nos garantiu que o evangelho do Reino será pregado em todo o mundo, para testemunho a todas as nações, saberá quando esse objetivo for alcançado. Mas eu não preciso saber. Só sei uma coisa: Cristo ainda não voltou, portanto, a tarefa ainda não foi concluída. Quando for, Cristo voltará. Nossa res ponsabilidade não é definir os termos de nossa tarefa, e sim cumpri-la. Enquanto Cristo não volta, nossa tare fa continua inacabada. Apressemo-nos em completar nossa missão.

Tornando-nos realistas pela Bíblia

Nossa responsabilidade não é salvar o mundo. Não nos foi pedido que transformássemos este século. O próprio parágrafo do qual o versículo em estudo serve de conclusão nos diz que haverá guerras e rumores de guerras, perseguições e martírios até o último instante. Sintome feliz por essas palavras estarem na Bíblia. Elas me dão estabilidade e mantêm minha sanidade mental. Elas me afastam do otimismo irrealista. Não devemos nos desencorajar nos momentos difíceis.

Contudo, temos uma mensagem de poder para levar ao mundo. É o evangelho do Reino. Durante o desenrolar desta era, duas forças estão ope rando: o poder do mal e o Reino de Deus. O mundo é o cenário de um con flito. As forças do mal estão investindo contra o povo de Deus, mas o evangelho do Reino está investindo contra o reino de Satanás. Esse conflito con tinuará até o fim desta era. A vitória final só será alcançada com o retorno de Cristo. Não há lugar para um otimismo ilimitado. O Sermão Profético, pregado por nosso Senhor, indica que até o fim o mal caracterizará esta era. A forma original do Sermão Profético dizia respeito tanto à queda de Jerusalém (Lc 21.20ss) quanto ao fim dos tempos, o que envolve problemas de crítica que não podem ser discutidos aqui. Falsos profetas e falsos messias irão se levantar e desviar a muitos. A iniquidade e o mal se multiplicarão de tal maneira que o amor de muitos se esfriará. O povo de Deus não escapará às dificuldades: “No mundo, passais por aflições” ( Jo 16.33); “Através de muitas tribulações, nos importa entrar no reino de Deus” (At 14.22). Devemos estar sempre prontos a participar da tribulação, bem como do Reino e da paciência que estão em Jesus (Ap 1.9). Na verdade, o Senhor mesmo declarou: “Aquele [...] que perseverar até o fim, esse será salvo” (Mt 24.13). Aquele que suportar a tribulação e a perse guição até o final, a ponto de entregar a própria vida, não perecerá, mas encontrará a salvação. “Matarão alguns dentre vós [...] Contudo, não se perderá um só fio de cabelo da vossa cabeça” (Lc 21.16,18). A Igreja, em seu caráter essencial, terá de ser sempre uma Igreja mártir. Ao levar o evangelho a todo o mundo, não devemos esperar um sucesso ilimitado. Temos de estar pre parados para a oposição, para a resistência, até mesmo para a perseguição e o martí rio. Este século permanece mau, hostil ao evangelho do Reino.

No entanto, não há lugar para pessimismo. Algumas mensagens e estudos sobre escatologia dão a impressão de que o fim dos tempos, os últimos dias, serão caracterizados pelo mal absoluto. Uma ênfase indevida se dá às vezes à atmosfera sombria dos últimos dias (2Tm 3.1). A Igreja visível, somos informados, será inteiramente dominada por doutrinas malignas. A apostasia irá permear a Igreja de tal forma que apenas um pequeno remanescente será achado fiel à Palavra de Deus. Os dias finais serão o período laodicense, quando a Igreja visível se mostrará indiferente às questões eternas, assumindo um aspecto repugnante. No quadro geral dos últimos dias, o povo de Deus só pode esperar derrota e frustração. O mal governará. O fim da era da Igreja será marcado por uma vitória sem paralelo do mal. A ênfase ao caráter maligno dos últimos dias é tão forte que temos a impressão (não intencional, é verdade) de que quanto mais de pressa o mundo se deteriorar, melhor, pois mais cedo virá o Senhor.

Não posso negar que as Escrituras enfatizam o caráter maligno dos últimos dias. Na verdade, já destacamos esse aspecto. O mal que caracteriza a presente era experimentará terrível intensificação bem perto do fim, quando demonstrará sua oposição e seu ódio ao Reino de Deus. Isso não significa, entretanto, que devemos cair no pessi mismo e abandonar o mundo, o mal e a Satanás. O fato é que o evangelho do Reino tem de ser proclamado em todo o mundo. O Reino de Deus invadiu a presente era do mal. Os poderes da era vindoura atacam esta era. Os últimos dias serão de fato ruins, mas, “nestes últimos dias,[Deus] nos falou pelo Filho” (Hb 1.2). Deus nos deu um evangelho de salvação para os últimos dias, um evangelho personificado em alguém que é o Filho de Deus. Além disso, “acontecerá nos últimos dias”, declara Deus, “que derramarei do meu Espírito sobre toda a carne” (At 2.17). Deus falou sobre os últimos dias. Ele derramou seu Espírito nos últi mos dias a fim de nos conceder poder para a proclamação da Palavra. Os últimos dias serão maus, porém não de maldade contínua. Deus nos deu um evangelho pa ra os últimos dias e nos concedeu poder para levar o evangelho a todo o mundo, para testemunho a todas as nações. Então virá o fim.

Esse deve ser o espírito de nossa missão nesta era. Não somos otimistas românticos, a ponto de acreditar que o evangelho conquistará o mundo e estabelecerá o Reino de Deus. Não somos também pessimistas desesperados, a ponto de concluir que nossa tarefa é impossível diante do mal desta era. Somos realistas, realistas segundo a Bíblia: reconhecemos o terrível poder do mal e ainda as sim prosseguimos com a missão da evangelizar o mundo a fim de obter vitórias para o Reino de Deus até que Cristo retorne em glória para conquistar a última e maior vitória.

Eis o motivo de nossa missão: a vitória final aguarda o término de nossa tarefa. “Então virá o fim.” Não há outro versículo na Palavra de Deus que diga: “Então virá o fim”. Quando Cristo vai voltar? Quando a Igreja tiver concluído sua tarefa. Quando esta era terrível terminará? Quando o mundo for evangelizado. “Dize-nos [...] que sinal haverá da tua vinda e da consumação do século” (Mt 24.3) “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim.” Quando? Então — quando a Igreja tiver cumprido sua missão, conforme Deus lhe designou.

“Ide, Portanto...”

Você ama a volta do Senhor? Então não medirá esforços para levar o evangelho a todo o mundo. Fico perturbado, à luz dos ensinamentos claros da Palavra de Deus e da definição explícita que nosso Senhor faz de nossa tarefa na Grande

Comissão (Mt 28.18-20), ao ver que a encaramos com tanta leviandade. “Toda a autoridade me foi dada no céu e na terra”: essas são as boas novas do Reino. Cristo despojou Satanás da autoridade que este possuía. O Reino de Deus tem investido contra o reino de Satanás. A presente era tem sido atacada pela era vindoura, na pessoa de Cristo. Toda a autoridade agora é de Cristo, mas ele só demonstrará essa autoridade, naquela gloriosa vitória final, quando regressar a esta terra. No entanto, a autoridade já pertence a ele. Satanás foi derrotado e está sob ataque. A morte foi vencida. O pecado foi lançado por terra. Cristo detém “toda a autoridade”. “Ide, portanto...” Por quê? Porque toda a autoridade e todo o poder pertencem a ele e porque ele está esperando que terminemos nossa tarefa. Dele é o Reino. Ele reina no céu e manifesta seu Reino na terra, em sua Igreja e por meio dela. Quando concluirmos nossa tarefa, ele voltará para estabe lecer seu Reino em glória. A nós foi dado não apenas aguardar, mas tam bém apressar “a vinda do Dia de Deus” (2Pe 3.12). Essa é a missão do evangelho do Reino. Essa é nossa missão.

Perguntas para estudo

1.Qual é o “mistério” do Reino?

2.Que relação existe entre a missão da Igreja e a vinda do Reino? É possível influenciar a vinda

do Reino?

3.Explique, de modo claro e conciso, a mensagem do evangelho do Reino.

4.De acordo com a Bíblia, qual o significado final da História?

5.Escreva um esboço para o livro mencionado na página 75: A preparação e a expansão do evan-

gelho entre as nações.

[cite] History and Eschatology (Edinburgh: The University Press, 1957), p. 120.$conteudo$
     where curso_id = v_curso and ordem = 15;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Ladd, cap. 9: O evangelho do Reino$t$, $conteudo$PARTE 1 DE 2

mesma verdade. O Reino de Deus é o poder de Deus. Salmos 145.13: “O teu reino é o de todos os séculos, e o teu domínio subsiste por todas as gerações”. O domínio do governo de Deus é o céu e a ter ra, mas o versículo não faz referência ao caráter permanente desse domí nio. É o governo de Deus que é eterno. Daniel 2.37: “Tu, ó rei, rei de reis, a quem o Deus do céu conferiu o reino, o poder, a força e a glória”. Observe os sinônimos de “reino”: “poder”, “força”, “glória” — todos são expressões de autorida de. Esses termos definem “reino” como o “governo” que Deus concedeu ao rei. Sobre Belsazar, está escrito: “Contou Deus o teu reino e deu cabo dele” (Dn 5.26). Está claro que o domínio sobre o qual Belsazar reinava não foi destruído. O domínio da Babilônia e o povo não chegaram a um fim: foram transferidos para outro governante. Foi o governo do rei que terminou, e o poder foi dado a Dario, o medo (Dn 5.31).

Uma referência nos evangelhos torna esse significado bem claro. Lemos em Lucas 19.11,12:

Ouvindo eles estas coisas, Jesus propôs uma parábola, visto estar perto de Jerusalém e lhes parecer que o reino de Deus havia de manifestar-se imediatamente. Então, disse:

Certo homem nobre partiu para uma terra distante, com o fim de tomar posse de um reino [basileia] e voltar.

O nobre não foi atrás de um domínio, uma área sobre a qual governar. O domínio sobre o qual ele desejava governar estava ali mesmo. O território sobre o qual ele ia governar era o lugar que ele havia deixado. O problema é que ele não era um rei. Ele carecia de autoridade, do direito de reinar. Ele saiu para obter um “reino”, isto é, realeza, autori dade. A Revised Standard Version traduz a palavra por “poder real”.

Alguns anos antes dos dias de nosso Senhor aconteceu o se guinte. No ano 40 a.C., as condições políticas da Palestina eram caóticas. Os romanos haviam subjugado o país no ano 63 a.C., mas a es tabilidade veio lentamente. Herodes, o Grande, foi finalmente a Roma pa ra receber o reino do Senado romano. Ali, foi declarado rei. Ele literalmente foi a um país distante para receber um reino, a autoridade de ser rei na Judeia, sobre os judeus. É bem possível que nosso Senhor tivesse esse fato em mente, nessa parábola. De qualquer forma ela exemplifica o significa do fundamental de reino.

O Reino de Deus é a realeza, o governo, a autoridade de Deus. Se entendermos isso, poderemos atravessar o Novo Testamento e encontrar diversas passagens nas quais esse significado é evidente. O Reino não é um lugar ou um povo, mas o reinado de Deus. Jesus disse que de vemos “receber o reino de Deus” como criancinhas (Mc 10.15). O que é recebido? A Igreja? O céu? É o governo de Deus. Para entrar na futura esfera do Reino, é preciso submeter-se em perfeita confiança ao governo de Deus aqui e agora.

Devemos também buscar, “em primeiro lugar, o seu reino e a sua justiça” (Mt 6.33). Qual o objetivo de nossa busca? A Igreja? O céu? Não. Devemos buscar a justiça de Deus — seu controle, seu governo, seu reinado sobre nossa vida.

Quando oramos: “Venha o teu reino”, estamos orando para que o céu venha à terra? Num certo sentido, sim, mas o céu é um objeto do desejo apenas porque o reinado de Deus será percebido mais perfeitamente que agora. À parte do reinado de Deus, o céu não tem significado. Portanto, oramos: “Venha o teu reino; faça-se a tua vontade, assim na terra como no céu”. Essa oração é um pedido para que Deus reine, que manifeste sua sobera nia e poder reais, dispersando todo inimigo da justiça e de seu governo di vino, que só Deus seja o Rei sobre todo o mundo.

O mistério do Reino

O capítulo 4 de Marcos e o capítulo 13 de Mateus contêm um grupo de parábolas que apresentam “o mistério do reino de Deus” (Mc 4.11). A parábola é uma história extraída da experiência diária das pessoas ese destina a ilustrar a verdade central da mensagem de nosso Senhor. Essa ver dade central é chamada o “mistério” do Reino.

Antes de tudo, devemos determinar o significado do termo “mistério”. O mistério, no sentido bíblico, não é algo misterioso nem pro fundo, obscuro, oculto e difícil. No linguajar moderno, a palavra pode ter tais conotações, mas não podemos interpretar a Bíblia pelas expressões modernas. Nas Escrituras, “mistério” geralmente é um conceito técnico cujo significado é apresentado em Romanos 16.25,26. Paulo escreve:

Ora, àquele que é poderoso para vos confirmar segundo o meu evangelho e a pregação de

Jesus Cristo, conforme a revelação do mistério guardado em silêncio nos tempos eternos, e que, agora, se tornou manifesto e foi dado a conhecer por meio das Escrituras proféticas, segundo o mandamento do Deus eterno, para a obediência por fé, entre todas as nações.

Esta é a ideia bíblica de mistério: algo que foi mantido em segredo durante longo período, mas agora está sendo revelado. É um propósito divino que Deus estabeleceu desde a eternidade, mas que foi mantido oculto da humanidade. Finalmente, entretanto, no decorrer de seu plano redentor, Deus re vela esse propósito e, por meio das Escrituras dos profetas, torna-o conhecido a todos os homens. O mistério é um propósito divino, escondido nos conse lhos de Deus durante longas eras, mas por fim manifesto numa nova re velação da obra redentora de Deus.

As parábolas apresentam o mistério do Reino — uma nova verdade so bre o Reino de Deus que não está explicada no Antigo Testamento, mas que finalmente foi revelada no ministério terreno de nosso Senhor. Que mistério é esse?

A perspecti va do Anti go Testamento a respeito do Reino

Encontramos no Antigo Testamento a resposta a essa pergunta numa tí pica profecia sobre a chegada do Reino de Deus. Em Da niel 2, o rei Nabucodonosor recebe a visão de uma grande imagem que tinha a cabeça de ouro, o peito de prata, os quadris de bronze, as pernas de ferro e os pés de ferro e barro. Então ele viu uma pedra ser cortada sem ajuda de mãos, que atingiu a imagem nos pés e a reduziu a pó. O pó foi varrido pelo vento, e dele “não se viram mais vestígios”. Então a pedra que des truiu a imagem tornou-se uma grande montanha e encheu toda a terra (Dn 2.31-35).

A interpretação é dada nos versículos 44 e 45. A imagem representa as sucessivas nações que iriam dominar o rumo da história mundial. O sig nificado da pedra é explicado com estas palavras:

Nos dias destes reis, o Deus do céu suscitará um reino que não será jamais destruído; este reino não passará a outro povo; esmiuçará e consumirá todos estes reinos, mas ele mesmo subsistirá para sempre, como viste que do monte foi cortada uma pedra, sem auxílio de mãos, e ela esmiuçou o ferro, o bronze, o barro, a prata e o ouro. O Grande Deus fez saber ao rei o que há de ser futuramente.

Eis a perspectiva do futuro profético do Antigo Testamento. Os profe tas aguardavam um dia glorioso, em que viria o Reino de Deus e Deus estabeleceria seu reinado sobre a terra. Você deve estar lembrado de que o significado básico do Reino de Deus é o reinado de Deus. Naquele dia, quando estabelecer SEU reinado, Deus destituirá todos os outros reinados, todos os outros reinos e autoridades. Extinguirá a soberania orgulhosa do homem, manifestada no governo das na ções que têm dominado o cenário da história da terra. O reinado de Deus, o Reino de Deus, o governo de Deus eliminará todo governo contrário. Só Deus será Rei naqueles dias.

Na perspectiva do Antigo Testamento, a vinda do Reino de Deus é vista como um grande e único acontecimento, uma poderosa manifestação do poder divino, que destruirá os reinos perversos da soberania hu mana e encherá a terra com justiça.

Uma nova revelação do Reino

Devemos retornar agora ao evangelho de Mateus e relacionar essa verdade com nosso estudo anterior. João Batista anunciou a chegada do Reino de Deus (Mt 3.2), que ele entendia ser a vinda do Reino previsto no Antigo Testamento. Aquele que viria traria um batismo duplo. Alguns seriam batizados com o Espírito Santo e experimentariam a salvação mes siânica do Reino de Deus, enquanto outros seriam batizados com o fogo do juízo final (Mt 3.11). Que essa é a interpretação de João, está claro no versículo seguinte. A obra do Messias será peneirar e separar os seres humanos. Assim como o lavrador debulha e peneira o grão, preservando este e jogan do fora a palha, o Messias virá para limpar sua eira, ajuntando o grão em seu celeiro (salvação para os justos) e lançando os perversos no fogo inextinguível (v. 12). A expressão “fogo inextinguível” indica que não é uma re ferência à experiência humana comum, mas ao juízo escatológico.

De sua prisão, João envia mensageiros a Jesus, para saber se ele é realmente aquele que devia vir, ou se deviam esperar outro. A dúvida de João tem sido interpretada como perda de confian ça na própria missão e na vocação divina por causa de seu aprisionamen to. Contudo, as palavras elogiosas de Jesus a respeito de João tornam tal interpretação improvável. João não era uma vara que podia ser sacudida pelo vento (Mt 11.7).

A dúvida de João surgiu pelo fato de Jesus não estar agindo como o Messias que João havia anunciado. Onde estava o batismo do Espí rito Santo? Onde estava o julgamento dos perversos?

Jesus respondeu que era realmente o Portador do Reino, que os si nais da era messiânica da profecia estavam se manifestando. Jesus disse ainda: “Bem-aventurado é aquele que não achar em mim motivo de tropeço” (Mt 11.6). “És tu aquele que estava para vir ou havemos de esperar outro?” Por que João fez essa pergunta? Porque a profecia de Daniel não parecia estar em processo de cumprimento. Herodes Antipas governava na Galileia. As legiões romanas marchavam pelas ruas de Jerusalém. A autorida de repousava nas mãos de Pilatos, um romano pagão. A Roma idólatra, politeísta e imoral governava o mundo com mão de ferro. Embora Roma tives se grande sabedoria e precaução em governar seus súditos, garantindo aos judeus concessões por causa de seus escrúpulos religiosos, ainda assim só Deus possuía o direito de governar seu povo. A soberania pertence a Deus somente. Eis aí a dúvida de João, e era a dúvida de cada judeu devoto, até mesmo dos discípulos mais íntimos de Jesus, em seus esforços por entender e interpretar a pessoa e o ministério dele. Como ele podia ser o Portador do Reino se o pecado e as instituições pecadoras permaneciam sem punição?

Jesus respondeu: “Bem-aventurado é aquele que não achar em mim motivo de tropeço”. O que Jesus quis dizer foi o seguinte: “Sim, o Reino de Deus está aqui, mas existe um mistério — uma nova revelação sobre o Reino. O Reino de Deus está aqui, mas em vez de destruir a soberania humana, ele atacou a soberania de Satanás. O Reino de Deus está aqui, mas em vez de fazer mudanças na ordem vigente no plano visível e político, está fazendo mudanças no plano espiritual e na vida de homens e mulheres”.

Esse é o mistério do Reino, a verdade que Deus agora revela pela primei ra vez na história da redenção. O Reino de Deus deve operar entre a humanidade em duas etapas diferentes. O Reino ainda está para vir na forma profetizada por Daniel, quando toda soberania humana será desalojada pela soberania de Deus. O mundo ainda verá a vinda do Reino de Deus com poder, mas o mistério, a nova revelação, é que esse mesmo Reino veio agora para operar entre os homens, mas não da forma imaginada. Ele não está destruindo agora o governo humano; não está abolindo agora o pe cado na terra; não está produzindo agora o batismo de fogo que João anunciou. Ele veio silenciosa, discreta e secretamente. Ele pode operar entre os homens e nunca ser reconhecido pelas multidões. Na esfera espiritual, o Reino oferece agora aos homens as bênçãos do governo divino, libertando-os do poder de Satanás e do pecado. O Reino de Deus é uma oferta, um dom que pode ser aceito ou rejeitado. O Reino está aqui e agora persuadindo, em vez de demonstrar poder.

Cada uma das parábolas de Mateus 13 ilustra o mistério de que o Reino de Deus que ainda está por vir em poder e grande glória já está presente entre os homens, para, antecipada e surpreendentemente, trazer aos homens da presente era do mal as bênçãos da era vindoura.

Esse é o mistério do Reino. Antes do dia da colheita, antes do fim dos sé culos, Deus entrou na História pela pessoa de Cristo para operar entre os ho mens, para trazer-lhes a vida e as bênçãos do Reino, o qual chegou de forma humilde e discreta. Ele veio à humanidade na forma de um carpintei ro galileu que percorreu as cidades da Palestina pregando o evangelho do Reino e libertando os homens da escravidão ao Diabo. Veio na forma dos discípulos daquele carpinteiro, que percorreram as vilas da Galileia com a mesma mensagem. Vem aos homens de hoje quando os discípu los de Jesus ainda levam o evangelho do Reino a todo o mundo. O Reino vem mansa e humildemente, sem fogo do céu, sem resplendor de gló ria, sem derrubar montanhas ou fender os céus. Vem como a semente se meada na terra. Pode ser rejeitado pelos corações endurecidos, pode ser su focado, sua vida pode às vezes parecer se abater e morrer, mas é o Reino de Deus. Ele produz o milagre da vida divina entre os homens e apresen ta aos homens as bênçãos do governo divino. É para eles a obra sobrenatural da graça de Deus. Esse Reino, esse poder sobrenatural de Deus, é o mesmo que se manifestará no final dos tempos, porém não mais de maneira silenciosa nas vidas daqueles que o recebem, mas em poder e grande glória, removendo todo o pecado e todo o mal da terra. Esse é o evangelho do Reino.

Quando virá o Reino?

Neste estudo final, iremos examinar um único versículo dos ensinamentos de nosso Senhor. A verdade contida nesse versículo é, sob certo aspec to, a mais importante de toda esta série de estudos para a Igreja de hoje. É um texto cujo significado só pode ser percebido se tivermos a base do estudo mais abrangente sobre o Reino de Deus.

Descobrimos que o Reino de Deus é o reinado de Deus que impõe derrota aos seus inimigos e leva a humanidade a desfrutar das bênçãos do reinado divi no. Descobrimos que o reinado de Deus é alcançado em três grandes atos, de modo que podemos dizer que a chegada do Reino se dá em três etapas. A terceira e última vitória acontece no fim do Milênio, quando a morte, Satanás e o pe cado são finalmente destruídos, e o reino é instalado em sua perfeição final. A segunda vitória acontece no começo do Milênio quando Satanás é acorrentado e lançado no abismo. No entanto, o pecado e a morte, ao que parece, con tinuarão nesse período, pois a morte só será lançada no lago de fogo até o final do Milênio.

A manifestação inicial do Reino de Deus encontra-se na missão de nosso Senhor na terra. Antes da era vindoura, antes do reinado milenar de Cristo, o Reino de Deus penetrou imediatamente na presente era do mal, por meio da pessoa e obra de Cristo. Portanto, podemos experimentar agora seu poder; podemos conhecer sua vida; podemos começar a participar de suas bênçãos. Depois de adentrarmos o gozo das bênçãos do Reino de Deus, nossa última pergunta é: o que vamos fazer como resultado dessas bênçãos? Iremos passivamente desfrutar a vida do Reino enquanto aguarda mos a consumação que se dará por ocasião da volta do Senhor? Sim, temos de aguardar, mas não passivamente. Talvez o versículo mais importante da Palavra de Deus para o povo de Deus na atualidade seja o texto deste estu do: Mateus 24.14.

Esse versículo sugere o assunto deste artigo: “Quando virá o Reino?”. Essa pergunta naturalmente se refere à manifestação do Reino de Deus com poder e glória quando o Senhor Jesus retornar. Há muito interesse entre o povo de Deus acerca do tempo da volta de Cristo. Será logo, ou vai demorar? Mui tas conferências bíblicas apresentam mensagens que examinam a Bíblia e folheiam os jornais para entender as profecias e ossinais dos tem pos, na tentativa de determinar a proximidade do fim. Nosso texto é a de claração mais explícita da Palavra de Deus sobre a época da vinda de nosso Senhor. Não há outro versículo que fale tão concisa e especificamente sobre a hora em que o Reino virá.

O capítulo tem início com as perguntas dos discípulos ao Senhor que admiravam o templo, cuja destruição Jesus acabara de anunciar: “Dize-nos quando sucederão estas coisas e que sinal haverá da tua vinda e da consumação do século” (Mt 24.3). Os discípulos esperavam que esta era terminasse com a volta de Cristo em glória. O Reino viria com o início da era vindoura. Eis a pergunta: “Quando terminará esta era? Quando retornarás, trazendo o Reino?”.

Jesus deu uma resposta detalhada à pergunta deles. Começou por des crever o curso desta era até o final. Esta era do mal irá durar até sua volta e sempre será hostil ao evangelho e ao povo de Deus. O mal prevalece rá. Influências sutis, enganadoras, procurarão afastar os homens de Cristo. Religiões falsas, messias enganadores irão desviar a muitos. As guerras con tinuarão; haverá fomes e terremotos. A perseguição e o martírio assolarão a Igreja. Os crentes sofrerão ódio até o fim desta era. Os homens irão tropeçar e trair-se uns aos outros. Falsos profetas se levantarão, a iniquidade irá proliferar, e o amor de muitos vai esfriará.

É um quadro sombrio, mas é o que devemos esperar de uma era sob os dominadores deste mundo tenebroso (Ef 6.12). Contudo, o quadro não é de escuridão e maldade irrestritas. Deus não abandonou a presente era às trevas. Es crituras apocalípticas judaicas do período do Novo Testamento concebiam uma era sob o controle absoluto do mal. Deus havia se retirado da participação ativa nos negócios humanos; a salvação pertencia apenas ao futuro quando o Reino de Deus viesse em glória. O presente testemunharia apenas tristezas e sofrimentos.

Alguns cristãos têm refletido a mesma atitude pessimista. Sata nás é o “deus deste século”, portanto, dizem, o povo de Deus não deve esperar na da além do mal e da derrota nesta era. A Igreja se tornará apóstata; a civilização será inteiramente corrompida. Os cristãos lutarão uma batalha perdida até a volta de Cristo.

De fato, a Palavra de Deus ensina que haverá uma intensificação do mal no fim do século, pois Satanás permanece como deus deste século. Entretanto, negamos de forma veemente que Deus tenha abandonado a presente era ao Malig no. Na verdade, o Reino de Deus já penetrou nesta era do mal. Satanás já foi derrotado. O Reino de Deus, em Cristo, criou a Igreja e opera no mundo por meio dela na realização dos propósitos divinos de expansão de seu Reino no mundo. Somos apanhados numa grande luta — o conflito dos séculos. O Reino de Deus opera neste mundo pelo poder do evangelho: “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”.

O evangelho do Reino

Nesse texto encontro três coisas: uma mensagem, uma missão e um motivo. A mensagem é o evangelho do Reino, as boas novas do Reino de Deus.

Alguns ensinam que o evangelho do Reino não é o evangelho da salvação, e sim um evangelho que anuncia a volta de Cristo, a ser pregado na tribulação por um remanescente judeu depois que a Igreja tiver partido. Não há como discutir aqui amplamente esse problema, mas podemos descobrir que o evangelho do Reino é o evangelho que foi proclamado pelos apóstolos na Igreja primitiva.

Contudo, devemos, em primeiro lugar, observar uma íntima relação en tre o versículo em estudo e a Grande Comissão. Na ascensão, o Senhor comis sionou os discípulos: “Ide,

PARTE 2 DE 2

naturalmente se refere à manifestação do Reino de Deus com poder e glória quando o Senhor Jesus retornar. Há muito interesse entre o povo de Deus acerca do tempo da volta de Cristo. Será logo, ou vai demorar? Mui tas conferências bíblicas apresentam mensagens que examinam a Bíblia e folheiam os jornais para entender as profecias e ossinais dos tem pos, na tentativa de determinar a proximidade do fim. Nosso texto é a de claração mais explícita da Palavra de Deus sobre a época da vinda de nosso Senhor. Não há outro versículo que fale tão concisa e especificamente sobre a hora em que o Reino virá.

O capítulo tem início com as perguntas dos discípulos ao Senhor que admiravam o templo, cuja destruição Jesus acabara de anunciar: “Dize-nos quando sucederão estas coisas e que sinal haverá da tua vinda e da consumação do século” (Mt 24.3). Os discípulos esperavam que esta era terminasse com a volta de Cristo em glória. O Reino viria com o início da era vindoura. Eis a pergunta: “Quando terminará esta era? Quando retornarás, trazendo o Reino?”.

Jesus deu uma resposta detalhada à pergunta deles. Começou por des crever o curso desta era até o final. Esta era do mal irá durar até sua volta e sempre será hostil ao evangelho e ao povo de Deus. O mal prevalece rá. Influências sutis, enganadoras, procurarão afastar os homens de Cristo. Religiões falsas, messias enganadores irão desviar a muitos. As guerras con tinuarão; haverá fomes e terremotos. A perseguição e o martírio assolarão a Igreja. Os crentes sofrerão ódio até o fim desta era. Os homens irão tropeçar e trair-se uns aos outros. Falsos profetas se levantarão, a iniquidade irá proliferar, e o amor de muitos vai esfriará.

É um quadro sombrio, mas é o que devemos esperar de uma era sob os dominadores deste mundo tenebroso (Ef 6.12). Contudo, o quadro não é de escuridão e maldade irrestritas. Deus não abandonou a presente era às trevas. Es crituras apocalípticas judaicas do período do Novo Testamento concebiam uma era sob o controle absoluto do mal. Deus havia se retirado da participação ativa nos negócios humanos; a salvação pertencia apenas ao futuro quando o Reino de Deus viesse em glória. O presente testemunharia apenas tristezas e sofrimentos.

Alguns cristãos têm refletido a mesma atitude pessimista. Sata nás é o “deus deste século”, portanto, dizem, o povo de Deus não deve esperar na da além do mal e da derrota nesta era. A Igreja se tornará apóstata; a civilização será inteiramente corrompida. Os cristãos lutarão uma batalha perdida até a volta de Cristo.

De fato, a Palavra de Deus ensina que haverá uma intensificação do mal no fim do século, pois Satanás permanece como deus deste século. Entretanto, negamos de forma veemente que Deus tenha abandonado a presente era ao Malig no. Na verdade, o Reino de Deus já penetrou nesta era do mal. Satanás já foi derrotado. O Reino de Deus, em Cristo, criou a Igreja e opera no mundo por meio dela na realização dos propósitos divinos de expansão de seu Reino no mundo. Somos apanhados numa grande luta — o conflito dos séculos. O Reino de Deus opera neste mundo pelo poder do evangelho: “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”.

O evangelho do Reino

Nesse texto encontro três coisas: uma mensagem, uma missão e um motivo. A mensagem é o evangelho do Reino, as boas novas do Reino de Deus.

Alguns ensinam que o evangelho do Reino não é o evangelho da salvação, e sim um evangelho que anuncia a volta de Cristo, a ser pregado na tribulação por um remanescente judeu depois que a Igreja tiver partido. Não há como discutir aqui amplamente esse problema, mas podemos descobrir que o evangelho do Reino é o evangelho que foi proclamado pelos apóstolos na Igreja primitiva.

Contudo, devemos, em primeiro lugar, observar uma íntima relação en tre o versículo em estudo e a Grande Comissão. Na ascensão, o Senhor comis sionou os discípulos: “Ide, portanto, fazei discípulos de todas as nações, batizando-os em nome do Pai, e do Filho, e do Espírito Santo; ensinando-os a guardar todas as coisas que vos tenho ordenado. E eis que estou convosco todos os dias até à consumação do século” (Mt 28.19,20). Quando comparamos estes versículos, eles falam por si mesmos: “Dize-nos [...] que sinal haverá da tua vinda e da consumação do século”; “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”; “Ide, [...] fazei discípulos de todas as na ções. E eis que estou convosco até à consumação do século”. Os ver sículos falam da mesma missão: a evangelização do mundo até o fim do século. Esse fato liga Mateus 28.19 a Mateus 24.14.

O livro de Atos relata que os apóstolos partiram em cumprimento dessa missão. Em Atos 8.12, está registrado que Filipe foi à Samaria e “evangelizava a respeito do reino de Deus”. Mateus 24.14 refere-se ao “evangelho do reino”. Esse evangelho deve ser pregado a todo o mundo. Filipe foi a Samaria, evangelizando a respeito do Reino de Deus, isto é, pregando o evangelho do Reino. Em Atos 8.12, temos as mesmas expressões de Mateus 24.14, com a exceção de que em Atos temos um verbo, em vez de um substan tivo, sendo a locução prepositiva “a respeito de” inserida na frase.

Paulo, quando foi a Roma, reuniu os judeus, pois sempre pregava o evangelho “primeiro para os judeus”. Qual foi sua mensagem? “Havendo-lhe eles marcado um dia, vieram em grande número ao encontro de Paulo na sua própria residência. Então, desde a manhã até à tarde, lhes fez uma exposição em testemunho do reino de Deus, procurando persuadi-los a respeito de Jesus” (At. 28.23). O testemunho do Reino de Deus, o evangelho do Reino, foi a mensagem que Paulo proclamou aos judeus em Roma.

Contudo, Paulo enfrentou a mesma reação que nosso Senhor quando este apareceu em Israel anunciando o Reino de Deus (Mt 4.17). Alguns creram, porém, a maioria dos judeus rejeitou sua mensa gem. Paulo anunciou, então, o propósito divino para os gentios diante da incredulidade de Israel. “Tomai, pois, conhecimento de que esta salvação de Deus foi enviada aos gentios. E eles a ouvirão” (At. 28.28). Paulo pregava aos judeus o Reino de Deus, contudo, eles o rejeitaram. Portanto, “esta salvação de Deus” foi oferecida aos gentios. O fato de que o evangelho do Reino de Deus é o mesmo que a mensagem da salvação fica comprovado ainda nos versículos seguintes. “Por dois anos, permaneceu Paulo na sua própria casa, que alugara, onde recebia todos que o procuravam, pregando o reino de Deus, e, com toda a intrepidez, sem impedimento algum, ensinava as coisas referentes ao Senhor Jesus Cristo” (v. 30,31). O Reino foi pregado aos judeus, e, quando eles o rejeitaram, passou a ser proclamado aos gentios. As boas novas do Reino de Deus constituíam a mensagem de Paulo tanto para os judeus quanto para os gentios.

Vitória sobre a morte

Retornemos às passagens bíblicas que definem com clareza e simplicidade evangelho do reino o evangelho do Reino. Em 1Coríntios 15.24-26, Paulo esboça as etapas da obra redentora de nosso Senhor. Ele descreve a vitória do reinado messiânico de Cristo com estas palavras: “... então, virá o fim, quando ele entregar o reino ao Deus e Pai, quando houver destruído todo principado, bem como toda potestade e poder. Porque convém que ele reine”. Jesus tem de reinar como Rei, tem de reinar em seu Reino. “até que haja posto todos os inimigos debaixo dos pés. O último inimi go a ser destruído é a morte”.

Eis a explicação bíblica do significado do reinado de Cristo pelo qual o seu Reino atingirá seu objetivo. É o reinado de Deus na pessoa do seu Fi lho, Jesus Cristo, com o propósito de colocar seus inimigos debaixo de seus pés. “O último inimigo a ser destruído é a morte”: a destruição da morte é a missão do Reino de Deus. O Reino de Deus também deverá destruir qualquer ou tro inimigo, entre eles o pecado e Satanás, pois a morte é o salário do pecado (Rm 6.23) e é Satanás que detém o poder sobre a morte (Hb 2.14). Só quando a morte, o pecado e Satanás forem destruídos, os redimi dos conhecerão as bênçãos perfeitas do reinado de Deus.

O evangelho do Reino é o anúncio da conquista da morte por Cristo. Descobrimos que Cristo já derrotou a morte, embora a consumação dessa vitória seja futura, quando a morte finalmente for lançada no lago de fogo (Ap 20.14). Falando da graça de Deus, Paulo diz que ela foi “manifestada, agora, pelo aparecimento de nosso Salvador Cristo Jesus, o qual não só destruiu a morte, como trouxe à luz a vida e a imortalidade, mediante o evangelho” (2Tm 1.10). A palavra aqui traduzida por “destruir” não significa “acabar com”, e sim “derrotar”, “quebrar seu poder”, “colocar fora de ação”. A mesma palavra grega é usada em 1Coríntios 15.26: “O último inimigo a ser destruído é a morte”. Essa palavra aparece também em 1Coríntios 15.24: “... então, virá o fim, quando ele entregar o reino ao Deus e Pai, quando houver destruído todo principado, bem como toda potestade e poder”.

Portanto, há dois estágios na destruição — extinção, derrota — da morte. Sua destruição final aguarda a segunda vinda de Cristo, mas por meio de sua morte e ressurreição, Cristo já a destruiu. Ele quebrou seu poder. A morte ainda é um inimigo, porém um inimigo derrotado. Estamos certos da vitória futura por causa da vitória que já foi alcançada. Temos uma vitória alcançada a proclamar.

Essas são as boas novas do Reino de Deus. Como a humanidade precisa desse evangelho! Aonde quer que formos, encontramos a sepultura escanca rada engolindo os que morrem. Lágrimas de perda, de separação, de parti da final escorrem por todas as faces. Cada mesa, mais cedo ou mais tarde, verá uma cadeira vazia, cada sala terá um lugar desocupado no sofá ou na poltrona. A morte é a grande niveladora. Riqueza ou pobreza, fama ou obscuridade, poder ou fraqueza, sucesso ou fracasso, raça, credo ou cultura: as diferenças humanas nada significam diante desse golpe irresistível e final da segadora da morte, que nos derruba a todos. O túmulo pode ser o fabuloso Taj Mahal, uma pirâmide maciça, uma cova esquecida de grama pisada ou as profundezas insondáveis do mar, mas o fato permanece: a morte reina.

Depois do evangelho do Reino, a morte é o poderoso conquistador dian te do qual todos nos vemos desamparados. Podemos, embora inutilmente, apenas esmurrar a tumba, que não cede nem responde. As boas novas, no entanto, são estas: a morte já foi derrotada. Nosso conquistador foi conquistado. Diante do poder do Reino de Deus em Cristo, a morte é impotente. Ela não pôde mantê-lo preso. A morte foi derrotada, e a vida e a imortalidade foram trazidas à luz. Uma sepultura vazia em Jerusalém é a prova disso. Esse é o evangelho do Reino.

Vitória sobre Satanás

O inimigo do Reino de Deus é Satanás. Cristo deve reinar até que tenha co locado Satanás sob seus pés. Essa vitória também aguarda a vinda de Cristo. Durante o Milênio, Satanás será amarrado no abismo. Só no final do Milênio ele será lançado no lago de fogo.

Contudo, descobrimos que Cristo já derrotou Satanás. A vitória do Reino de Deus não é apenas futura: uma grande vitória inicial já aconteceu. Cristo participou da carne e do sangue. Ele encarnou “para que, por sua morte, destruísse aquele que tem o poder da morte, a saber, o diabo, e livrasse todos que, pelo pavor da morte, estavam sujeitos à escravidão por toda a vida” (Hb 2.14,15). A palavra traduzida por “destruir” é a mes ma encontrada em 2Timóteo 1.10 e 1Coríntios 15.24,26. Cristo anulou o poder da morte. Ele anulou também o poder de Satanás. Satanás ainda anda ao redor como um leão que ruge em perseguição ao povo de Deus (1Pe 5.8) e se insinua como um anjo de luz nos círculos reli giosos (2Co 11.14). Entretanto, ele é um inimigo derrotado. Seu poder, isto é, seu domínio foi desfeito. Seu destino é certo. Uma vitória decisiva, ou melhor, a vitória decisiva foi ganha. Cristo expulsa demônios, libertando os ho mens da escravidão satânica, demonstrando que o Reino de Deus liberta os homens da escravidão de Satanás. O Reino tira-os das trevas e os conduz à luz salvadora e restauradora do evangelho. Estas são as boas novas acerca do Reino de Deus: Satanás está derrotado e podemos ser libertados do temor demoníaco e do mal satânico para conhecer a gloriosa liberdade dos filhos de Deus.

Vitória sobre o pecado

O pecado é um inimigo do Reino de Deus. Cristo já fez alguma coisa em relação ao pecado, ou apenas prometeu um livramento futuro, quando o Reino vier em glória? Temos de admitir que o pecado, assim como a morte, es tá circulando pelo mundo. Cada jornal e cada revista dão um testemunho eloquente da atuação do pecado. No entanto, o pecado, a exemplo da morte e de Sa tanás, já foi derrotado. Cristo apareceu para acabar com o pecado pelo sacrifício de si mesmo (Hb 9.26). O poder do pecado foi desfeito, “sabendo isto: que foi crucificado com ele o nosso velho homem, para que o corpo do pecado seja destruído, e não sirvamos o pecado como escravos” (Rm 6.6). Aqui encontramos pela terceira vez a palavra “destruir”. A atuação de Cristo como Rei tem o objetivo de “destruir” cada inimigo (1Co 15.24, 26). Essa obra é futura, mas também passada. O que nosso Senhor irá concluir em sua segunda vinda, ele já começou com sua morte e ressurreição. A “morte” foi delimitada, destruída (2Tm 1.10). Satanás foi destruído (Hb 2.14). Em Romanos 6.6, vemos o “corpo do pecado” eliminado, destruído. A mesma palavra de vitória e de destrui ção dos inimigos de Cristo é usada três vezes nesta vitória tripla: sobre Satanás, sobre a morte e sobre o pecado.

Portanto, não estamos mais escravizados pelo pecado (Rm 6.6). A escravidão é coisa do passado. O pecado está no mundo, mas seu poder já não é o mesmo. O ser humano já não fica mais desamparado diante dele, pois seu domínio foi desfeito. O poder do Reino de Deus invadiu esta era, um poder que pode libertar a humanidade da escravidão do pecado.

O evangelho do Reino é o anúncio do que Deus fez e irá fazer. É sua vitória sobre os inimigos. São as boas novas de que Cristo irá voltar a fim de destruir para sempre seus inimigos. É um evangelho de esperança. São também as boas novas do que ele já fez. Ele já desfez o poder da morte, derrotou Satanás e venceu o domínio do pecado. O evangelho é uma promessa, mas também uma experiência, e a promessa está fundamentada na experiência. O que Cristo fez garante o que ele fará. Esse é o evangelho que devemos levar a todo o mundo.

A missão do Reino

Em Mateus 24.14, encontramos também uma missão,além da mensagem. O evangelho do Reino — as boas novas da vitória de Cristo sobre os inimigos de Deus — deve ser pregado em todo o mundo para teste munho a todas as nações. Essa é a nossa missão. Esse versículo é um dos mais importantes de toda a Palavra de Deus para explicar o significado e o propósito da história humana.

O significado da História

O significado da História é um problema que confunde a men te dos pensadores. Não é preciso que alguém nos lembre que a presente geração enfrenta uma destruição potencial de proporções tão imensas que poucos de nós tentamos imaginar como seria a terrível realidade. Diante da ameaça de tal catástrofe, a humanidade está se questionando, como nunca antes. Qual o significado da História? Por que o ser humano está na terra? Para onde ele vai? Existe algum significado, propósito ou destino que leve a humanidade a algum objetivo? Ou, repetindo uma metáfo ra, somos meros fantoches percorrendo desajeitada mente o palco da História, tendo como destino incendiar o palco, destruin do com ele os fantoches e não deixando nada além de um punhado de cinzas e o cheiro de queimado? Será esse o destino da história humana?

Numa geração anterior, a filosofia do progresso foi amplamente acei ta. Alguns pensadores traçavam o significado da História por meio de uma simples linha reta que levava a uma inclinação gradual, porém contínua, do co meço selvagem e primitivo para um nível superior de cultura e civilização. A filosofia do progresso ensinava que a humanidade, por causa de seu caráter intrínseco, destina-se a melhorar até que um dia venha a atingir a so ciedade perfeita, livre de todo mal, de todas as guerras, de toda a pobreza e de toda a animosidade. Esse ponto de vista despedaçou-se na bigorna da História. Os atuais acontecimentos tornaram o conceito de progresso inevi tável, uma ideia intolerável e irreal.

Outro ponto de vista interpreta a História como uma série de ciclos numa grande espiral. Há movimentos para cima e para baixo. Existem altos e bai xos na espiral, porém cada subida é um pouco mais elevada que a última e cada descida é tão baixa quanto a precedente. Embora tenhamos nossos “altos e baixos”, o movimento da espiral como um todo é para cima. É uma modificação da doutrina do progresso.

Outras interpretações são pessimistas. Alguém já suge riu que a ilustração mais acertada sobre o significado da História é o con junto de pegadas feitas por uma mosca bêbada com os pés molhados de tin ta, cambaleando sobre um pedaço de papel branco. Seus passos não levam a lugar algum nem refletem um padrão de significado. Um dos maiores eruditos contemporâneos do Novo Testamento, Rudolf Bultmann, escre veu: “Atualmente não podemos declarar que conhecemos o fim e o alvo da História. Portanto, a questão do significado da história tornou-se sem signi ficado”.

Muitas das mentes mais brilhantes de nossa geração estão com esse pro blema. O determinismo econômico do sistema marxista repousa sobre a filosofia da história, que é inteiramente baseada no material. Entretanto, é uma filosofia e promete um destino aos seus seguidores. Spengler acreditava que o progresso era impossível e que a história estava conde nada ao declínio e à degeneração inevitáveis. Toynbee produziu um estudo monumental onde tenta encontrar padrões e ciclos de significado na histó ria das civilizações.

Já eruditos como Niebuhr, Rust e Piper escreveram estu dos profundos que oferecem indicações quanto ao significado da História de acordo com a verdade bíblica da revelação. Trata-se de um proble ma profundo, e não queremos pôr de lado as complexidades da questão com um dar de ombros. Contudo, é convicção do autor que o sig nificado final da História deve ser encontrado na ação de Deus na história humana conforme registrado e interpretado nas Escrituras inspiradas. Aqui, a fé cristã deve falar. Se não há Deus, o homem está perdido num labirinto de experiências assustadoras sem nenhum significado para orientá-lo. Se Deus não agiu na História, o fluxo e refluxo das marés dos séculos vêm e vão sem destino entre as areias da eternidade. Entretanto, o fato básico da Palavra de Deus é que Deus falou, Deus operou de forma redentora na História, e a ação divina ainda a conduzirá a um alvo divinamente estabelecido.

Se não há um Deus com a mão no leme da História, então sou pessimista. Todavia, creio em Deus. Creio que Deus tem um propósito e que ele revelou seu propósito na História, em Cristo e em sua Pa lavra. Qual é esse propósito? Onde encontramos seu esboço?

Viajando pelo Oriente Médio, observamos, maravilhados, as ruínas que dão um testemunho silencioso de civilizações outrora poderosas. Colunas maciças ainda estão de pé na direção dos céus, enquanto em outros lu gares apenas imensos amontoados de terra marcam planícies estéreis com os escombros acumulados de civilizações extintas. A Esfinge, as pirâmides de Gizé, as colunas de Persépolis e as torres de Tebas ainda dão um testemu nho eloquente da glória que havia no Egito e na Pérsia. Podemos ainda su bir a Acrópole de Atenas ou pisar o Fórum, em Roma, e sentir algo do es plendor e da glória das civilizações do primeiro século que, sob alguns as pectos, jamais foram ultrapassadas. Contudo, hoje não passam de ruínas, colunas tomba das, estátuas derrubadas, civilizações mortas.

Qual o significado de tudo isso? Por que as nações se levantam e caem? Existe algum propósito? Ou será que a Terra irá um dia se tornar uma estrela morta e sem vida, como a Lua?

O propósito divino e o povo escolhido

A Bíblia tem uma resposta. O tema central de toda a Bíblia é a obra reden tora de Deus na História. Há muito tempo, Deus escolheu um povo peque no e desprezado, Israel. Deus não estava interessado nesse povo por causa do povo propriamente dito. O propósito de Deus visava a toda a humanida de. Deus, em seu desígnio soberano, escolheu esse povo insignificante para que por meio dele pudesse executar seu propósito redentor que depois se estenderia a toda a raça humana. O significado final do Egito, dos assírios, dos caldeus e de outras nações do antigo Oriente encontra-se em seu relacionamento com a pequenina nação de Israel. Deus estabeleceu gover nantes e os derrubou para que pudesse criar Israel. Ele criou esse povo e o preservou. Ele tinha um plano e desenvolveu esse plano na História. Queremos dizer com isso a história redentiva. Só a Bíblia, em toda a literatura antiga, contém uma filosofia da história, e é uma filosofia de redenção.

Então chegou a “plenitude dos tempos”, e apareceu na terra o Senhor Jesus Cristo, um judeu, um filho de Abraão segundo a carne. O propósito de Deus para Israel teve um maravilhoso cumprimento. Isso não significa que Deus tenha exaurido seu propósito em relação a Israel. Significa que, quando Cristo apareceu, o propósito redentor de Deus por meio de Israel alcançou seu objetivo inicial. Até então, a pista para o significado do propósito divi no na História identificava-se com Israel como nação. Quando Cristo realizou sua obra redentora de morte e ressurreição, o propósito divino na história passou de Israel, que rejeitara o evangelho, para a

Igreja, que é a comunhão de judeus e gentios que aceitaram o evangelho. Isso é comprovado nas palavras de nosso Senhor em Mateus 21.43, dirigidas à nação de Israel: “O reino de Deus vos será tirado e será entregue a um povo que lhe produza os respectivos frutos”. A Igreja é “raça eleita, sacerdócio real, nação santa” (1Pe 2.9), e é na atual missão da Igreja, de levar as boas novas do Reino de Deus a todo o mundo, que o propósito redentor de Deus na História está sendo executado.

O significado final da História entre a ascensão de nosso Senhor e seu retorno em glória encontra-se na expansão e atuação do evangelho no mundo: “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim”. O propósito divino nos 20 séculos que se passaram desde que nosso Senhor viveu na terra encontra-se na história do evangelho do Reino. O desenrolar do significado acha-se entretecido no programa missionário da Igreja. Um dia, quando entrarmos nos ar quivos do céu para procurar um livro que exponha o significado da história humana como Deus o vê, não apanharemos uma obra intitulada “A his tória do Ocidente”, “O progresso da civilização”, “A glória do Império Britânico” ou “O crescimento e a expansão da América”. O li vro que procuramos será intitulado A preparação e a expansão do evange lho entre as nações,pois só aqui o propósito redentivo de Deus foi exe cutado.

É um fato chocante. Deus confiou a pessoas como nós, pecadores redi midos, a responsabilidade de executar o propósito divino na História. Por que Deus tomou tal decisão? Não estaria assumindo o grande risco de que seu propósito não fosse cumprido? Já são quase 2 mil anos, e o alvo ainda não foi atingido. Por que Deus mesmo não assumiu a tarefa? Por que não enviou as hostes angelicais, em quem podia confiar, para realizar o trabalho? Por que o confiou a nós? Não tentamos res ponder à pergunta, exceto para dizer que essa é a vontade de Deus. Eis os fatos: Deus nos confiou essa missão, e, se nós não a executarmos, ela não se rá feita.

Esse fato devia nos servir de estímulo, mas a Igreja de hoje tem com plexo de inferioridade. Há algumas gerações, o pastor de uma igreja era o líder mais culto e respeitado da comunidade. Foi a época em que, por causa dessa situação cultural, a Igreja exercia uma influência predominante na estrutura da vida comunitária ocidental. Esses dias, porém, há muito já se foram. Sentimos que o mundo jogou a Igreja a um can to e nos passou para trás. A Igreja, de modo geral, não conta mais no mundo. As Nações Unidas não procuram a Igreja em busca de conselhos na solução de seus problemas. Os líderes políticos pouco dependem dos líderes da Igreja para sua orientação. A ciência, a indústria, a educação e o trabalho são áreas em que se buscam a sabedoria e a li derança. A Igreja é deixada de lado. Às vezes, temos a impressão de que realmente não valemos nada. Estamos à margem da influência, fomos em purrados para a periferia e não estamos mais ali, firmes no centro. Temos pena de nós mesmos, desejando que o mundo preste atenção em nós. As sim, assumimos uma atitude defensiva e tentamos justificar nossa existência. De fato, nossa preocupação principal parece ser a autopreservação. Adotamos uma interpretação derrotista de nosso significado e de nosso papel no mundo!

Que esse versículo possa arder em nosso coração. Deus não disse isso de nenhum outro grupo de pessoas. As boas novas do Reino de Deus devem ser pregadas pela Igreja em todo o mundo, para testemu nho a todas as nações. Esse é o programa de Deus.Significa que, para o sentido último da civilização moderna e o destino da história humana, você e eu somos mais importantes que as Nações Unidas. O que a Igreja faz com o evangelho tem mais importância que as decisões do Kremlin. Pela perspectiva da eternidade, a missão da Igreja é mais importan te que o avanço dos exércitos ou as ações das capitais do mundo, porque é no cumprimento dessa missão que o propósito divino para a história humana é realizado. Nossa missão é exatamente essa.

Vamos acabar com esse complexo de inferioridade! Vamos deixar de la do para sempre essa atitude de autocomiseração! Vamos parar de lamentar nossa insignificância! Vamos reconhecer o que somos, isto é, como Deus nos vê, e cumprir o programa divinamente estabelecido! As boas novas do Reino devem ser pregadas em todo o mundo, para testemunho a todas as nações, e então virá o fim. Estou feliz, realmente orgulhoso de fazer parte da Igreja de Cristo, porque a nós foi confiada a mais significativa e digna tarefa confiada a uma instituição humana. Essa responsabilidade confere à minha vida um sig nificado eterno, pois estou participando do plano de Deus para a História. O significado e o destino da História repousam em minhas mãos.

O moti vo do Reino

Finalmente, nosso texto contém um motivo poderoso: “Então virá o fim”. O assunto deste artigo é: “Quando virá o Reino?”. Não estou estabele cendo datas. Não sei quando virá o fim, mas sei o seguinte: quando a Igreja concluir a tarefa de evangelizar o mundo, Cristo voltará. A Pa lavra de Deus o diz. Por que ele não veio no ano 500? Porque a Igreja não havia evangelizado o mundo. Por que ele não voltou no ano 1000? Porque a Igreja ainda não havia concluído a tarefa da evangelização mundial. Será que ele vem em breve? Ele virá — se nós, o povo de Deus, for mos obedientes à ordem do Senhor de levar o evangelho a todo o mundo.

Que tarefa solene! Ela é tão surpreendente que algumas pessoas dizem: “Não posso acreditar nisso! Simplesmente não pode ser verdade que Deus tenha dado tal responsabilidade aos homens”. Quando William Carey expressou seu desejo de levar o evangelho à Índia, no século XVIII, obteve esta resposta: “Sente-se, jovem! Quando Deus quiser evangelizar os pagãos, ele o fará sem sua ajuda”. Carey, no entanto, tinha visão e conhecimento da Palavra de Deus suficientes para rejeitar tal conselho. Ele se levantou e foi para a Índia. Com essa atitude, deu início ao movimento de missões mundiais dos tempos modernos.

Nossa responsabilidade: completar a tarefa

Deus nos confiou a continuação e a consumação da tarefa. Eis algo que me deixa entusiasmado. Estamos próximos do término da missão mais que qualquer geração anterior. Fizemos mais nos últimos séculos pela evangelização do mundo que em todos os séculos ante riores desde a era apostólica. A tecnologia dos últimos séculos nos proporcionou a imprensa, o automóvel, o avião, o rádio e muitos outros meios de realizar a tarefa de levar o evangelho a todo o mundo. Línguas antes desconhecidas estão sendo condicionadas à forma escrita. A Palavra de Deus já está traduzida em milhares de línguas e dialetos, e o número cresce a cada ano. Eis o fato desafiador. Se o povo de Deus, apenas no mundo de língua inglesa, levasse esse texto a sério e correspondesse ao seu desafio, poderíamos concluir a tarefa da evangelização do mundo ainda em nossa geração e testemunharíamos a volta do Senhor.

Alguém dirá: “Isso é impossível. Muitos países estão fecha dos ao evangelho. Não podemos entrar na China. As portas da Índia estão se fechando. Se a volta do Senhor aguarda a evangelização do mundo pela Igreja, então é quase certo que Cristo não irá retornar nesta geração, pois há muitos países fechados ao evangelho, o que torna impossível concluir a tarefa em nossos dias”.

Essa atitude não leva Deus em conta. É verdade que muitas portas estão fechadas no momento, mas Deus é capaz de abrir portas fecha das da noite para o dia e também de trabalhar por trás de portas fe chadas. Minha preocupação não é com as portas fechadas: é com as portas que estão abertas e pelas quais não entramos. Se o povo de Deus fosse realmente fiel e fizesse o possível para con cluir a tarefa, Deus providenciaria a abertura das portas. Nossa responsa bilidade são as muitas portas que estão escancaradas e pelas quais não esta mos entrando. Somos um povo desobediente. Discutimos conceitos de evangelização mundial e debatemos detalhes da escatologia, ao mesmo tempo em que negligenciamos a ordem da Palavra de Deus de evan gelizar o mundo.

Alguém dirá: “Como saberemos que a missão foi cumprida? Em que ponto estamos na realização da tarefa? Que países foram evangelizados e quais os que ainda não foram? Quanto falta para chegarmos ao fim? Não iríamos incorrer com isso no erro de estabelecer datas?”.

Respondo que não sei. Só Deus conhece a definição dos termos. Não preciso definir exatamente o que são “todas as nações”. Só Deus conhece o significado exato de “evangelizar”. Só ele, que nos garantiu que o evangelho do Reino será pregado em todo o mundo, para testemunho a todas as nações, saberá quando esse objetivo for alcançado. Mas eu não preciso saber. Só sei uma coisa: Cristo ainda não voltou, portanto, a tarefa ainda não foi concluída. Quando for, Cristo voltará. Nossa res ponsabilidade não é definir os termos de nossa tarefa, e sim cumpri-la. Enquanto Cristo não volta, nossa tare fa continua inacabada. Apressemo-nos em completar nossa missão.

Tornando-nos realistas pela Bíblia

Nossa responsabilidade não é salvar o mundo. Não nos foi pedido que transformássemos este século. O próprio parágrafo do qual o versículo em estudo serve de conclusão nos diz que haverá guerras e rumores de guerras, perseguições e martírios até o último instante. Sintome feliz por essas palavras estarem na Bíblia. Elas me dão estabilidade e mantêm minha sanidade mental. Elas me afastam do otimismo irrealista. Não devemos nos desencorajar nos momentos difíceis.

Contudo, temos uma mensagem de poder para levar ao mundo. É o evangelho do Reino. Durante o desenrolar desta era, duas forças estão ope rando: o poder do mal e o Reino de Deus. O mundo é o cenário de um con flito. As forças do mal estão investindo contra o povo de Deus, mas o evangelho do Reino está investindo contra o reino de Satanás. Esse conflito con tinuará até o fim desta era. A vitória final só será alcançada com o retorno de Cristo. Não há lugar para um otimismo ilimitado. O Sermão Profético, pregado por nosso Senhor, indica que até o fim o mal caracterizará esta era. A forma original do Sermão Profético dizia respeito tanto à queda de Jerusalém (Lc 21.20ss) quanto ao fim dos tempos, o que envolve problemas de crítica que não podem ser discutidos aqui. Falsos profetas e falsos messias irão se levantar e desviar a muitos. A iniquidade e o mal se multiplicarão de tal maneira que o amor de muitos se esfriará. O povo de Deus não escapará às dificuldades: “No mundo, passais por aflições” ( Jo 16.33); “Através de muitas tribulações, nos importa entrar no reino de Deus” (At 14.22). Devemos estar sempre prontos a participar da tribulação, bem como do Reino e da paciência que estão em Jesus (Ap 1.9). Na verdade, o Senhor mesmo declarou: “Aquele [...] que perseverar até o fim, esse será salvo” (Mt 24.13). Aquele que suportar a tribulação e a perse guição até o final, a ponto de entregar a própria vida, não perecerá, mas encontrará a salvação. “Matarão alguns dentre vós [...] Contudo, não se perderá um só fio de cabelo da vossa cabeça” (Lc 21.16,18). A Igreja, em seu caráter essencial, terá de ser sempre uma Igreja mártir. Ao levar o evangelho a todo o mundo, não devemos esperar um sucesso ilimitado. Temos de estar pre parados para a oposição, para a resistência, até mesmo para a perseguição e o martí rio. Este século permanece mau, hostil ao evangelho do Reino.

No entanto, não há lugar para pessimismo. Algumas mensagens e estudos sobre escatologia dão a impressão de que o fim dos tempos, os últimos dias, serão caracterizados pelo mal absoluto. Uma ênfase indevida se dá às vezes à atmosfera sombria dos últimos dias (2Tm 3.1). A Igreja visível, somos informados, será inteiramente dominada por doutrinas malignas. A apostasia irá permear a Igreja de tal forma que apenas um pequeno remanescente será achado fiel à Palavra de Deus. Os dias finais serão o período laodicense, quando a Igreja visível se mostrará indiferente às questões eternas, assumindo um aspecto repugnante. No quadro geral dos últimos dias, o povo de Deus só pode esperar derrota e frustração. O mal governará. O fim da era da Igreja será marcado por uma vitória sem paralelo do mal. A ênfase ao caráter maligno dos últimos dias é tão forte que temos a impressão (não intencional, é verdade) de que quanto mais de pressa o mundo se deteriorar, melhor, pois mais cedo virá o Senhor.

Não posso negar que as Escrituras enfatizam o caráter maligno dos últimos dias. Na verdade, já destacamos esse aspecto. O mal que caracteriza a presente era experimentará terrível intensificação bem perto do fim, quando demonstrará sua oposição e seu ódio ao Reino de Deus. Isso não significa, entretanto, que devemos cair no pessi mismo e abandonar o mundo, o mal e a Satanás. O fato é que o evangelho do Reino tem de ser proclamado em todo o mundo. O Reino de Deus invadiu a presente era do mal. Os poderes da era vindoura atacam esta era. Os últimos dias serão de fato ruins, mas, “nestes últimos dias,[Deus] nos falou pelo Filho” (Hb 1.2). Deus nos deu um evangelho de salvação para os últimos dias, um evangelho personificado em alguém que é o Filho de Deus. Além disso, “acontecerá nos últimos dias”, declara Deus, “que derramarei do meu Espírito sobre toda a carne” (At 2.17). Deus falou sobre os últimos dias. Ele derramou seu Espírito nos últi mos dias a fim de nos conceder poder para a proclamação da Palavra. Os últimos dias serão maus, porém não de maldade contínua. Deus nos deu um evangelho pa ra os últimos dias e nos concedeu poder para levar o evangelho a todo o mundo, para testemunho a todas as nações. Então virá o fim.

Esse deve ser o espírito de nossa missão nesta era. Não somos otimistas românticos, a ponto de acreditar que o evangelho conquistará o mundo e estabelecerá o Reino de Deus. Não somos também pessimistas desesperados, a ponto de concluir que nossa tarefa é impossível diante do mal desta era. Somos realistas, realistas segundo a Bíblia: reconhecemos o terrível poder do mal e ainda as sim prosseguimos com a missão da evangelizar o mundo a fim de obter vitórias para o Reino de Deus até que Cristo retorne em glória para conquistar a última e maior vitória.

Eis o motivo de nossa missão: a vitória final aguarda o término de nossa tarefa. “Então virá o fim.” Não há outro versículo na Palavra de Deus que diga: “Então virá o fim”. Quando Cristo vai voltar? Quando a Igreja tiver concluído sua tarefa. Quando esta era terrível terminará? Quando o mundo for evangelizado. “Dize-nos [...] que sinal haverá da tua vinda e da consumação do século” (Mt 24.3) “Será pregado este evangelho do reino por todo o mundo, para testemunho a todas as nações. Então, virá o fim.” Quando? Então — quando a Igreja tiver cumprido sua missão, conforme Deus lhe designou.

“Ide, Portanto...”

Você ama a volta do Senhor? Então não medirá esforços para levar o evangelho a todo o mundo. Fico perturbado, à luz dos ensinamentos claros da Palavra de Deus e da definição explícita que nosso Senhor faz de nossa tarefa na Grande

Comissão (Mt 28.18-20), ao ver que a encaramos com tanta leviandade. “Toda a autoridade me foi dada no céu e na terra”: essas são as boas novas do Reino. Cristo despojou Satanás da autoridade que este possuía. O Reino de Deus tem investido contra o reino de Satanás. A presente era tem sido atacada pela era vindoura, na pessoa de Cristo. Toda a autoridade agora é de Cristo, mas ele só demonstrará essa autoridade, naquela gloriosa vitória final, quando regressar a esta terra. No entanto, a autoridade já pertence a ele. Satanás foi derrotado e está sob ataque. A morte foi vencida. O pecado foi lançado por terra. Cristo detém “toda a autoridade”. “Ide, portanto...” Por quê? Porque toda a autoridade e todo o poder pertencem a ele e porque ele está esperando que terminemos nossa tarefa. Dele é o Reino. Ele reina no céu e manifesta seu Reino na terra, em sua Igreja e por meio dela. Quando concluirmos nossa tarefa, ele voltará para estabe lecer seu Reino em glória. A nós foi dado não apenas aguardar, mas tam bém apressar “a vinda do Dia de Deus” (2Pe 3.12). Essa é a missão do evangelho do Reino. Essa é nossa missão.

Perguntas para estudo

1.Qual é o “mistério” do Reino?

2.Que relação existe entre a missão da Igreja e a vinda do Reino? É possível influenciar a vinda

do Reino?

3.Explique, de modo claro e conciso, a mensagem do evangelho do Reino.

4.De acordo com a Bíblia, qual o significado final da História?

5.Escreva um esboço para o livro mencionado na página 75: A preparação e a expansão do evan-

gelho entre as nações.

[cite] History and Eschatology (Edinburgh: The University Press, 1957), p. 120.$conteudo$, 15);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 16) then
    update aulas set titulo = $t$Lição 3 · Leitura — Wells, cap. 25: Oração, rebelião contra o status quo$t$, conteudo = $conteudo$Oração: rebelião contra o status quo

David Wells

ocê ficará chocado com a história que vou lhe contar. Isto é, caso tenha pelo menos um pouco de consciência social. Uma senhora pobre e negra vivia em sua casinha numa das nado marido

De início o juiz nem mesmo tirou os olhos da revista que estam, possesso de raiva cativa sobre “o sistema”

Ao apresentar essa história, não fui muito honesto. Na verdade,

Obviamente, o paralelo que Jesus estabelece não é entre Deus tem dois aspectos. Primeiro: a viúva recusou-se a aceitar aquela situação injusta em que estava envolvida, assim como o cristão não deve resignar-se ao mundo decaído. Segundo: apesar dos desencorajamentos, a viúva insistiu em seu pleito, como devem os cristãos também proceder. O primeiro aspecto diz respeito à natureza da oração, e o segundo, à sua prática.

Desejo demonstrar que nossas orações irregulares e fraquejantes, especialmente no que se refere a pedidos, são em geral feitas de maneira equivocada. Diante do fracasso na oração, tendemos a nos flagelar por causa da pouca disposição, dos desejos insípidos, da técnica ineficiente ou da mente dispersiva. Percebemos que, de alguma maneira, nossa prática está errada e nos esforçamos para descobrir onde estamos falhando. Creio que o problema está na compreensão inadequada da natureza da oração e que nossa oração, na prática, nunca terá a persistência da viúva até que nosso entendimento do assunto seja tão claro quanto o dela.

Qual seria, então, a natureza da oração de petição? Em sua essência, é a rebeldia — rebeldia contra o mundo em seu estado caído, a recusa absoluta e definitiva em aceitar como normal o que é ameaçadoramente anormal. Nesse aspecto negativo, é a rejeição a todo programa, todo esquema, toda interpretação que destoe da norma estabelecida originariamente por Deus. Dessa maneira, é uma afirmação do abismo intransponível que separa o bem do mal, a declaração de que o mal não é uma variação do bem: é sua antítese.

Expressando de outra maneira, aceitar a vida “do jeito que ela é” (o que significa reconhecer a inevitabilidade da forma em que ela acontece) é aceitar a derrota do ponto de vista cristão acerca de Deus. A aceitação do que é anormal traz em si a pressuposição oculta e não reconhecida de que o poder de Deus para mudar o mundo, para vencer o mal com o bem não se manifestará.

Nada destrói tão rapidamente a oração de petição (e com ela, o ponto de vista cristão acerca de Deus) quanto a resignação. Jesus fez menção do “dever de orar sempre e nunca esmorecer”, isto é, jamais aceitar a situação vigente (Lc 18.1).

O desaparecimento da oração de petição em face da resignação tem uma origem histórica interessante. As religiões que dão ênfase à aceitação silenciosa sempre fazem pouco caso da oração de petição. Já os estóicos afirmavam que esse tipo de oração revelava a recusa em aceitar o mundo existente como expressão da vontade de Deus. Diziam que era uma tentativa de fuga tentar modificá-lo. Eles criam que tal mudança seria ruim. Um argumento semelhante é encontrado no budismo. O mesmo pensamento, embora obtido por um processo diferente de raciocínio, pode ser detectado em nossa cultura secular.

Secularismo é a atitude que entende a vida como um fim em si mesmo. Ele pressupõe a impossibilidade de qualquer relacionamento com Deus. A consequência é que a única norma ou regra na vida, seja na busca de um sentido, seja na procura de padrões morais, é o mundo tal como é. O pensamento secular argumenta que temos de chegar a um acordo com o mundo tal como é. Procurar outro referencial para estruturar a vida é futilidade, uma tentativa de “fuga”. Desse ponto de vista, Deus, a quem dirigimos a oração de petição, não apenas costuma ser visto como uma ideia vaga, mas também a forma de ele se relacionar com o mundo é entendida de maneira diferente. Essa concepção de Deus não contradiz as crenças seculares. Deus pode estar “presente” e “ativo” no mundo, mas sua presença e sua atividade em nada mudam a situação.

Contra tudo isso, deve-se dizer que a oração de petição só floresce onde houver uma dupla crença. Primeira: que o nome de Deus tem sido santificado de maneira muito irregularmente, que seu Reino se apresenta com pouca intensidade e que sua vontade é feita em raras ocasiões. Segunda: que Deus pode mudar essa situação. A oração de petição é, portanto, a expressão da esperança de que a vida, tal como existe, não apenas pode, mas deve ser diferente. Portanto, é impossível viver no mundo de Deus da maneira que Deus deseja e realizar sua obra de modo coerente com quem ele é sem se dedicar à oração regular.

Creio que esse é o verdadeiro significado da oração de petição na vida de nosso Senhor. Grande parte de sua vida de oração não é explicada pelos escritores dos evangelhos (por exemplo, Mc 1.35; Lc 5.16; 9.18; 11.1), mas percebemos algumas características nas circunstâncias da vida de oração de Jesus.

Em primeiro lugar, a oração de petição precedeu as grandes decisões de sua vida, como a escolha dos discípulos (Lc 6.12). De fato, a única explicação possível para a escolha daquele bando de homens sem projeção, orgulhosos, ignorantes e desprovidos de entendimento é que ele orou antes de escolhê-los. Em segundo lugar, ele orava quando se via sob enorme pressão, após um dia caracterizado por intensas atividades, que lhe exigiram todas as suas energias e total atenção (por exemplo, Mt 14.23). Em terceiro lugar, ele orava nas situações de crise e nos momentos decisivos de sua vida, como em seu batismo, na transfiguração e na cruz (Lc 3.21; 9.28,29). Em quarto lugar, ele orava antes e durante alguma tentação incomum, sendo o Getsêmani a ocasião mais marcante (Mt 26.36-45). À medida que a “hora” se aproximava, o contraste entre a maneira em que Jesus a enfrentou e o comportamento dos discípulos só se explica pelo fato de ele ter perseverado em oração, enquanto eles dormiam vencidos pelo desânimo.

Cada um desses acontecimentos revela nosso Senhor diante da possibilidade de adotar um programa, aceitar uma ideia ou tomar um caminho diferente do que era pretendido por Deus. A oração de petição marcou cada ocasião em que ele rejeitou uma alternativa errada. Era a maneira de recusar-se a viver neste mundo ou a realizar os negócios do Pai de outra maneira que não a estabelecida por Deus. Desse modo, a oração de petição era um ato de rebeldia contra o mundo em sua anormalidade perversa e decaída.

A oração é a afirmação de que Deus e o mundo têm objetivos antagônicos. “Dormir”, estar “desanimado” ou “esmorecido” é agir como se Deus e o mundo não estivessem em campos opostos. Por que então oramos tão pouco a favor de nossa igreja local? Qual o problema: técnica ruim, disposição pequena, mente desatenta? Não creio nisso. São muitos e acalorados os debates (justificados parcial ou totalmente) em torno da mediocridade da pregação, da aridez do culto, da superficialidade da comunhão e da ineficiência do evangelismo. Por que então não oramos com tanta persistência quanto discutimos esses assuntos? A resposta, muito simples, é que não cremos que fará qualquer diferença. Por mais desesperadora que seja a situação, aceitamos que seja imutável: o que é sempre será. Esse não é um problema relacionado com a prática da oração, e sim com sua natureza. Ou, mais precisamente, com a natureza de Deus e seu relacionamento com este mundo.

Ao contrário da viúva da parábola, achamos mais fácil fazer acordo com o mundo injusto e caído que nos rodeia, mesmo quando ele invade as instituições cristãs. Às vezes, estamos conscientes do mal à nossa volta, mas nos sentimos impotentes para mudar qualquer coisa. Por mais que nos desagrade, a impotência nos faz declarar trégua na luta contra o erro. Perdemos a disposição, tanto no que diz respeito ao nosso testemunho social quanto em persistir na oração. Felizmente, Deus não nos perdeu, pois sua ira é a oposição que ele faz ao que está errado, é o meio pelo qual a verdade é entronizada para sempre e o erro é enviado ao patíbulo. Sem a ira de Deus, não haveria razão para viver moralmente no mundo, e os argumentos contra esse estilo de vida seriam inúmeros. É nesse sentido que a ira de Deus está intimamente ligada à oração de petição, porque ela também almeja o triunfo da verdade em todas as áreas e o consequente banimento do mal.

A estrutura que Jesus nos deu para pensar a respeito do assunto foi o Reino de Deus. Reino é a esfera em que a soberania do rei é reconhecida, e a natureza de nosso Rei implica que essa soberania seja exercida de modo sobrenatural. Em Jesus, a tão esperada era “que há de vir” já chegou. Nele e por meio dele deu-se a incursão messiânica no mundo. Ser cristão não é, portanto, ter tido a experiência religiosa correta, mas começar a viver naquela esfera, que é verdadeiramente divina. O evangelismo é frutífero não porque nossa técnica seja “correta”, mas porque essa “era” irrompe na vida dos pecadores. A era “que há de vir” e que já está alvorecendo não é propriedade de alguma pessoa ou cultura. A “era” de Deus, a “era” de seu Filho crucificado está alvorecendo em todo o mundo. Nossas orações, portanto, devem ir além da preocupação com assuntos particulares e incluir o amplo horizonte de toda vida humana, na qual Deus está interessado. Se o evangelho é universal, a oração não poderá ser restrita a questões locais.

Assim, não é fora de propósito enxergar o mundo como um tribunal em que possamos apresentar nosso caso contra o que está errado e a favor do que é certo. A fragilidade na oração ocorre porque não levamos em conta essa realidade, e até que a recuperemos não insistiremos em nosso papel de litigantes. Contudo, há inúmeras razões por que devemos recuperar nossa visão e aproveitar a oportunidade, pois o Juiz perante o qual nos apresentamos não é ateu nem corrupto: é o glorioso Deus e Pai de nosso Senhor Jesus Cristo. Você acha que ele falhará em fazer “justiça aos seus escolhidos, que a ele clamam dia e noite”? Deixará Deus de atendê-los? Diante dessa dúvida, Jesus afirmou: “Digo-vos que, depressa, lhes fará justiça” (Lc 18.7,8).

Perguntas para estudo

1.Que relação existe entre a oração de petição e a missão da Igreja?

2.Wells afirma que temos duas áreas problemáticas na oração de petição: sua prática e sua natu-

reza. Descreva com suas palavras esses problemas. Qual área é mais importante? Por quê?

3.Observe a interpretação que Wells faz acerca da Oração Dominical, o pai-nosso. Por que ela

é uma oração “missionária”?

[cite] DAVID WELLS é professor de história da doutrina e de teologia sistemáti ca no Gordon-Conwell Theological Seminary, em South Hamilton, Massachusett s, nos Estados Unidos. Também leciona na Trinity Evangelical Divinity School. É autor de inúmeros arti gos e de dois livros. Adaptado de “Prayer: Rebelling Against the Status Quo”, Christianity Today, v. 17, n. 6, 2 nov. 1979. Usado com permissão. V principais cidades do país. A casa, construída pelo finum terreno diminuto que comprara com sacrifício, era o único bem que possuía. Certo dia, o vizinho começou a fazer reformas na casa dele, e, como resultado, as paredes da casa da viúva começaram a rachar, com perigo de desabamento. Apesar das leis existentes, o vizinho sempre se esquivava de reparar os danos. Viúva, desespe- radamente pobre e sem qualquer conhecimento do sistema legal, a mulher, mesmo assim, levou o caso à justiça. Ela acreditava que a justiça seria feita. Não tendo recursos, o juiz nomeou um advogado para lhe dar assistência jurídica gratuita. Infelizmente, o advogado pouco se interessou pelo caso, e o juiz designado para resolver a pendência revelou-se um ateu intolerante. O único princípio pelo qual se orientava, como ele mesmo disse, era que “os negros devem ficar no seu canto”. As possibilidades de uma sentença favorável à viúva eram, portanto, muito remotas. Tornaram-se ainda mais remotas quando ela percebeu que não dispunha do ingrediente indispensável para obter uma sentença favorável em casos assim, a saber, uma boa gorjeta. Mesmo assim, ela insistiu. va lendo e mandou-a embora, marcando a audiência para outro dia. Audiência após audiência, sempre adiando o estudo do caso, o juiz começou a reparar na pobre viúva. Finalmente, a insistência da mulher, que não desistia do caso, despertou nele um pouco de consciência. Sentiu-se culpado e irado. Por fie envergonhado, atendeu ao pedido da mulher e fez com que a lei fosse cumprida. Foi uma vitória signifi — pelo menos naquele tribunal corrupto. até onde eu saiba, nunca aconteceu um caso como esse, em todos os detalhes, mas também não se trata de uma história inventada por mim. É uma parábola contada por Jesus (Lc 18.1-8) para ilustrar a natureza da oração de petição. e o juiz corrupto, mas entre a viúva e seu pedido. Esse paralelo$conteudo$
     where curso_id = v_curso and ordem = 16;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Wells, cap. 25: Oração, rebelião contra o status quo$t$, $conteudo$Oração: rebelião contra o status quo

David Wells

ocê ficará chocado com a história que vou lhe contar. Isto é, caso tenha pelo menos um pouco de consciência social. Uma senhora pobre e negra vivia em sua casinha numa das nado marido

De início o juiz nem mesmo tirou os olhos da revista que estam, possesso de raiva cativa sobre “o sistema”

Ao apresentar essa história, não fui muito honesto. Na verdade,

Obviamente, o paralelo que Jesus estabelece não é entre Deus tem dois aspectos. Primeiro: a viúva recusou-se a aceitar aquela situação injusta em que estava envolvida, assim como o cristão não deve resignar-se ao mundo decaído. Segundo: apesar dos desencorajamentos, a viúva insistiu em seu pleito, como devem os cristãos também proceder. O primeiro aspecto diz respeito à natureza da oração, e o segundo, à sua prática.

Desejo demonstrar que nossas orações irregulares e fraquejantes, especialmente no que se refere a pedidos, são em geral feitas de maneira equivocada. Diante do fracasso na oração, tendemos a nos flagelar por causa da pouca disposição, dos desejos insípidos, da técnica ineficiente ou da mente dispersiva. Percebemos que, de alguma maneira, nossa prática está errada e nos esforçamos para descobrir onde estamos falhando. Creio que o problema está na compreensão inadequada da natureza da oração e que nossa oração, na prática, nunca terá a persistência da viúva até que nosso entendimento do assunto seja tão claro quanto o dela.

Qual seria, então, a natureza da oração de petição? Em sua essência, é a rebeldia — rebeldia contra o mundo em seu estado caído, a recusa absoluta e definitiva em aceitar como normal o que é ameaçadoramente anormal. Nesse aspecto negativo, é a rejeição a todo programa, todo esquema, toda interpretação que destoe da norma estabelecida originariamente por Deus. Dessa maneira, é uma afirmação do abismo intransponível que separa o bem do mal, a declaração de que o mal não é uma variação do bem: é sua antítese.

Expressando de outra maneira, aceitar a vida “do jeito que ela é” (o que significa reconhecer a inevitabilidade da forma em que ela acontece) é aceitar a derrota do ponto de vista cristão acerca de Deus. A aceitação do que é anormal traz em si a pressuposição oculta e não reconhecida de que o poder de Deus para mudar o mundo, para vencer o mal com o bem não se manifestará.

Nada destrói tão rapidamente a oração de petição (e com ela, o ponto de vista cristão acerca de Deus) quanto a resignação. Jesus fez menção do “dever de orar sempre e nunca esmorecer”, isto é, jamais aceitar a situação vigente (Lc 18.1).

O desaparecimento da oração de petição em face da resignação tem uma origem histórica interessante. As religiões que dão ênfase à aceitação silenciosa sempre fazem pouco caso da oração de petição. Já os estóicos afirmavam que esse tipo de oração revelava a recusa em aceitar o mundo existente como expressão da vontade de Deus. Diziam que era uma tentativa de fuga tentar modificá-lo. Eles criam que tal mudança seria ruim. Um argumento semelhante é encontrado no budismo. O mesmo pensamento, embora obtido por um processo diferente de raciocínio, pode ser detectado em nossa cultura secular.

Secularismo é a atitude que entende a vida como um fim em si mesmo. Ele pressupõe a impossibilidade de qualquer relacionamento com Deus. A consequência é que a única norma ou regra na vida, seja na busca de um sentido, seja na procura de padrões morais, é o mundo tal como é. O pensamento secular argumenta que temos de chegar a um acordo com o mundo tal como é. Procurar outro referencial para estruturar a vida é futilidade, uma tentativa de “fuga”. Desse ponto de vista, Deus, a quem dirigimos a oração de petição, não apenas costuma ser visto como uma ideia vaga, mas também a forma de ele se relacionar com o mundo é entendida de maneira diferente. Essa concepção de Deus não contradiz as crenças seculares. Deus pode estar “presente” e “ativo” no mundo, mas sua presença e sua atividade em nada mudam a situação.

Contra tudo isso, deve-se dizer que a oração de petição só floresce onde houver uma dupla crença. Primeira: que o nome de Deus tem sido santificado de maneira muito irregularmente, que seu Reino se apresenta com pouca intensidade e que sua vontade é feita em raras ocasiões. Segunda: que Deus pode mudar essa situação. A oração de petição é, portanto, a expressão da esperança de que a vida, tal como existe, não apenas pode, mas deve ser diferente. Portanto, é impossível viver no mundo de Deus da maneira que Deus deseja e realizar sua obra de modo coerente com quem ele é sem se dedicar à oração regular.

Creio que esse é o verdadeiro significado da oração de petição na vida de nosso Senhor. Grande parte de sua vida de oração não é explicada pelos escritores dos evangelhos (por exemplo, Mc 1.35; Lc 5.16; 9.18; 11.1), mas percebemos algumas características nas circunstâncias da vida de oração de Jesus.

Em primeiro lugar, a oração de petição precedeu as grandes decisões de sua vida, como a escolha dos discípulos (Lc 6.12). De fato, a única explicação possível para a escolha daquele bando de homens sem projeção, orgulhosos, ignorantes e desprovidos de entendimento é que ele orou antes de escolhê-los. Em segundo lugar, ele orava quando se via sob enorme pressão, após um dia caracterizado por intensas atividades, que lhe exigiram todas as suas energias e total atenção (por exemplo, Mt 14.23). Em terceiro lugar, ele orava nas situações de crise e nos momentos decisivos de sua vida, como em seu batismo, na transfiguração e na cruz (Lc 3.21; 9.28,29). Em quarto lugar, ele orava antes e durante alguma tentação incomum, sendo o Getsêmani a ocasião mais marcante (Mt 26.36-45). À medida que a “hora” se aproximava, o contraste entre a maneira em que Jesus a enfrentou e o comportamento dos discípulos só se explica pelo fato de ele ter perseverado em oração, enquanto eles dormiam vencidos pelo desânimo.

Cada um desses acontecimentos revela nosso Senhor diante da possibilidade de adotar um programa, aceitar uma ideia ou tomar um caminho diferente do que era pretendido por Deus. A oração de petição marcou cada ocasião em que ele rejeitou uma alternativa errada. Era a maneira de recusar-se a viver neste mundo ou a realizar os negócios do Pai de outra maneira que não a estabelecida por Deus. Desse modo, a oração de petição era um ato de rebeldia contra o mundo em sua anormalidade perversa e decaída.

A oração é a afirmação de que Deus e o mundo têm objetivos antagônicos. “Dormir”, estar “desanimado” ou “esmorecido” é agir como se Deus e o mundo não estivessem em campos opostos. Por que então oramos tão pouco a favor de nossa igreja local? Qual o problema: técnica ruim, disposição pequena, mente desatenta? Não creio nisso. São muitos e acalorados os debates (justificados parcial ou totalmente) em torno da mediocridade da pregação, da aridez do culto, da superficialidade da comunhão e da ineficiência do evangelismo. Por que então não oramos com tanta persistência quanto discutimos esses assuntos? A resposta, muito simples, é que não cremos que fará qualquer diferença. Por mais desesperadora que seja a situação, aceitamos que seja imutável: o que é sempre será. Esse não é um problema relacionado com a prática da oração, e sim com sua natureza. Ou, mais precisamente, com a natureza de Deus e seu relacionamento com este mundo.

Ao contrário da viúva da parábola, achamos mais fácil fazer acordo com o mundo injusto e caído que nos rodeia, mesmo quando ele invade as instituições cristãs. Às vezes, estamos conscientes do mal à nossa volta, mas nos sentimos impotentes para mudar qualquer coisa. Por mais que nos desagrade, a impotência nos faz declarar trégua na luta contra o erro. Perdemos a disposição, tanto no que diz respeito ao nosso testemunho social quanto em persistir na oração. Felizmente, Deus não nos perdeu, pois sua ira é a oposição que ele faz ao que está errado, é o meio pelo qual a verdade é entronizada para sempre e o erro é enviado ao patíbulo. Sem a ira de Deus, não haveria razão para viver moralmente no mundo, e os argumentos contra esse estilo de vida seriam inúmeros. É nesse sentido que a ira de Deus está intimamente ligada à oração de petição, porque ela também almeja o triunfo da verdade em todas as áreas e o consequente banimento do mal.

A estrutura que Jesus nos deu para pensar a respeito do assunto foi o Reino de Deus. Reino é a esfera em que a soberania do rei é reconhecida, e a natureza de nosso Rei implica que essa soberania seja exercida de modo sobrenatural. Em Jesus, a tão esperada era “que há de vir” já chegou. Nele e por meio dele deu-se a incursão messiânica no mundo. Ser cristão não é, portanto, ter tido a experiência religiosa correta, mas começar a viver naquela esfera, que é verdadeiramente divina. O evangelismo é frutífero não porque nossa técnica seja “correta”, mas porque essa “era” irrompe na vida dos pecadores. A era “que há de vir” e que já está alvorecendo não é propriedade de alguma pessoa ou cultura. A “era” de Deus, a “era” de seu Filho crucificado está alvorecendo em todo o mundo. Nossas orações, portanto, devem ir além da preocupação com assuntos particulares e incluir o amplo horizonte de toda vida humana, na qual Deus está interessado. Se o evangelho é universal, a oração não poderá ser restrita a questões locais.

Assim, não é fora de propósito enxergar o mundo como um tribunal em que possamos apresentar nosso caso contra o que está errado e a favor do que é certo. A fragilidade na oração ocorre porque não levamos em conta essa realidade, e até que a recuperemos não insistiremos em nosso papel de litigantes. Contudo, há inúmeras razões por que devemos recuperar nossa visão e aproveitar a oportunidade, pois o Juiz perante o qual nos apresentamos não é ateu nem corrupto: é o glorioso Deus e Pai de nosso Senhor Jesus Cristo. Você acha que ele falhará em fazer “justiça aos seus escolhidos, que a ele clamam dia e noite”? Deixará Deus de atendê-los? Diante dessa dúvida, Jesus afirmou: “Digo-vos que, depressa, lhes fará justiça” (Lc 18.7,8).

Perguntas para estudo

1.Que relação existe entre a oração de petição e a missão da Igreja?

2.Wells afirma que temos duas áreas problemáticas na oração de petição: sua prática e sua natu-

reza. Descreva com suas palavras esses problemas. Qual área é mais importante? Por quê?

3.Observe a interpretação que Wells faz acerca da Oração Dominical, o pai-nosso. Por que ela

é uma oração “missionária”?

[cite] DAVID WELLS é professor de história da doutrina e de teologia sistemáti ca no Gordon-Conwell Theological Seminary, em South Hamilton, Massachusett s, nos Estados Unidos. Também leciona na Trinity Evangelical Divinity School. É autor de inúmeros arti gos e de dois livros. Adaptado de “Prayer: Rebelling Against the Status Quo”, Christianity Today, v. 17, n. 6, 2 nov. 1979. Usado com permissão. V principais cidades do país. A casa, construída pelo finum terreno diminuto que comprara com sacrifício, era o único bem que possuía. Certo dia, o vizinho começou a fazer reformas na casa dele, e, como resultado, as paredes da casa da viúva começaram a rachar, com perigo de desabamento. Apesar das leis existentes, o vizinho sempre se esquivava de reparar os danos. Viúva, desespe- radamente pobre e sem qualquer conhecimento do sistema legal, a mulher, mesmo assim, levou o caso à justiça. Ela acreditava que a justiça seria feita. Não tendo recursos, o juiz nomeou um advogado para lhe dar assistência jurídica gratuita. Infelizmente, o advogado pouco se interessou pelo caso, e o juiz designado para resolver a pendência revelou-se um ateu intolerante. O único princípio pelo qual se orientava, como ele mesmo disse, era que “os negros devem ficar no seu canto”. As possibilidades de uma sentença favorável à viúva eram, portanto, muito remotas. Tornaram-se ainda mais remotas quando ela percebeu que não dispunha do ingrediente indispensável para obter uma sentença favorável em casos assim, a saber, uma boa gorjeta. Mesmo assim, ela insistiu. va lendo e mandou-a embora, marcando a audiência para outro dia. Audiência após audiência, sempre adiando o estudo do caso, o juiz começou a reparar na pobre viúva. Finalmente, a insistência da mulher, que não desistia do caso, despertou nele um pouco de consciência. Sentiu-se culpado e irado. Por fie envergonhado, atendeu ao pedido da mulher e fez com que a lei fosse cumprida. Foi uma vitória signifi — pelo menos naquele tribunal corrupto. até onde eu saiba, nunca aconteceu um caso como esse, em todos os detalhes, mas também não se trata de uma história inventada por mim. É uma parábola contada por Jesus (Lc 18.1-8) para ilustrar a natureza da oração de petição. e o juiz corrupto, mas entre a viúva e seu pedido. Esse paralelo$conteudo$, 16);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 17) then
    update aulas set titulo = $t$Lição 3 · Leitura — Johnstone: Uma reação violenta à misericórdia$t$, conteudo = $conteudo$Uma reação violenta à misericórdia

Patrick Johnstone

O ensino de Jesus atingia o núcleo das visões de mundo erradas que os judeus e seus discípulos tinham. Lucas até mostra o início do ministério público de Jesus sendo uma dramática anunciação da sua visão global que provoca os judeus a uma reação violenta.

Lucas 4:16-30 registra que Jesus se levantou para ler Isaías 61 com resultados surpreendentes. Nas nossas versões em português (ARC, NAA, NVI, NVT) nós vemos uma "atenção repentina" no v. 20, admiração aberta no v. 22, mas no v. 28, pouco tempo depois, eles são se opõem tão violentamente a Jesus que eles querem matá-lo lançando-o de um precipício. O que aconteceu para as coisas irem tão mal assim? Talvez as nossas traduções em português se esqueceram do foco - porque a natureza missiológica do anúncio de Jesus não foi entendida pelos tradutores. A NVI traduz Lucas 4:22: da seguinte forma:

Todos falavam bem dele, e estavam admirados com as palavras de graça que saíam de seus lábios.

As palavras em itálico poderiam ser traduzidas literalmente do grego como "todos testemunhavam a respeito dele", o que é ambíguo e poderia também ter um significado negativo como "e todos o condenavam". Uma versão de tradução nova e iluminadora coloca o texto da seguinte forma:

Eles protestavam com uma só voz e estavam furiosos porque

Ele falou apenas sobre (o ano do) favor (do Senhor), (e omitiu as palavras sobre a vingança do Messias).

Os judeus conheciam muito bem essa passagem, e esperavam Jesus continuar lendo as palavras da segunda frase de Isaías 61 :2, mas ele terminou com a leitura no meio da frase e omitiu as palavras:

…e o ano da vingança do nosso Deus.

A surpresa dos judeus logo virou raiva por causa da esperada vingança sobre os gentios não foi expressa. Jesus ainda complicou as coisas lembrando os manifestantes sobre o ministério de Elias a uma viúva sidônia e o de Eliseu a um general sírio. Ele amplamente demonstrou que ele havia deliberadamente omitido a frase de Isaías e que o seu ministério não buscava trazer vingança sobre os gentios, mas salvá-los - até mesmo passando pelos mais necessitados da sociedade judaica, como os leprosos e as viúvas. Isso era algo que os judeus não podiam aceitar e os provocou ao extremo, buscando assassiná-lo.

Fonte: A Igreja é maior do que você pensa. 1998, Christian Focus Publications, Reino Unido. Usado com autorização.$conteudo$
     where curso_id = v_curso and ordem = 17;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Johnstone: Uma reação violenta à misericórdia$t$, $conteudo$Uma reação violenta à misericórdia

Patrick Johnstone

O ensino de Jesus atingia o núcleo das visões de mundo erradas que os judeus e seus discípulos tinham. Lucas até mostra o início do ministério público de Jesus sendo uma dramática anunciação da sua visão global que provoca os judeus a uma reação violenta.

Lucas 4:16-30 registra que Jesus se levantou para ler Isaías 61 com resultados surpreendentes. Nas nossas versões em português (ARC, NAA, NVI, NVT) nós vemos uma "atenção repentina" no v. 20, admiração aberta no v. 22, mas no v. 28, pouco tempo depois, eles são se opõem tão violentamente a Jesus que eles querem matá-lo lançando-o de um precipício. O que aconteceu para as coisas irem tão mal assim? Talvez as nossas traduções em português se esqueceram do foco - porque a natureza missiológica do anúncio de Jesus não foi entendida pelos tradutores. A NVI traduz Lucas 4:22: da seguinte forma:

Todos falavam bem dele, e estavam admirados com as palavras de graça que saíam de seus lábios.

As palavras em itálico poderiam ser traduzidas literalmente do grego como "todos testemunhavam a respeito dele", o que é ambíguo e poderia também ter um significado negativo como "e todos o condenavam". Uma versão de tradução nova e iluminadora coloca o texto da seguinte forma:

Eles protestavam com uma só voz e estavam furiosos porque

Ele falou apenas sobre (o ano do) favor (do Senhor), (e omitiu as palavras sobre a vingança do Messias).

Os judeus conheciam muito bem essa passagem, e esperavam Jesus continuar lendo as palavras da segunda frase de Isaías 61 :2, mas ele terminou com a leitura no meio da frase e omitiu as palavras:

…e o ano da vingança do nosso Deus.

A surpresa dos judeus logo virou raiva por causa da esperada vingança sobre os gentios não foi expressa. Jesus ainda complicou as coisas lembrando os manifestantes sobre o ministério de Elias a uma viúva sidônia e o de Eliseu a um general sírio. Ele amplamente demonstrou que ele havia deliberadamente omitido a frase de Isaías e que o seu ministério não buscava trazer vingança sobre os gentios, mas salvá-los - até mesmo passando pelos mais necessitados da sociedade judaica, como os leprosos e as viúvas. Isso era algo que os judeus não podiam aceitar e os provocou ao extremo, buscando assassiná-lo.

Fonte: A Igreja é maior do que você pensa. 1998, Christian Focus Publications, Reino Unido. Usado com autorização.$conteudo$, 17);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 18) then
    update aulas set titulo = $t$Lição 3 · Leitura — Hawthorne, cap. 13: Mandamento na montanha$t$, conteudo = $conteudo$PARTE 1 DE 3

Mandamento na montanha

Steven C. Hawthorne

EO anjo, dirigindo-se às mulheres, disse: Ide, pois, depressa e dizei aos seus discípulos que ele [...] vai adiante de vós para a Galileia;

ali o vereis (Mt 28.5-7).

Ide avisar a meus irmãos que se dirijam à Galileia e lá me verão (Mt 28.10).

Seguiram os onze discípulos para a Galileia, para o monte que

Jesus lhes designara. E, quando o viram, o adoraram; mas alguns duvidaram (Mt 28.16,17).

les esperaram na montanha, um dos montes mais altos com vista para o mar da Galileia. Não havia dúvida de que estavam no lugar certo, pois já haviam se encontrado com Jesus ali. O próprio Jesus costumava orar nesse monte. Na verdade, Tiago, João e Pedro levaram os discípulos ao exato local onde o tinham visto em glória resplandecente.

Eles contemplaram o lago abaixo, quebrando o silêncio para recordar em voz alta algumas das coisas que aconteceram ao redor dele. Havia apenas 11 deles agora. Um a um, cada um deles intimamente questionava o que aconteceria quando Jesus aparecesse. As expectativas estavam nas alturas. O tempo passava lentamente. Eles esperavam e conjecturavam.

Jesus jamais foi previsível, mesmo nos primeiros dias na Galileia. O que aconteceria agora que havia morrido? Ou estaria vivo? Cada um deles já o tinha visto outra vez, ou pelo menos o que parecia ser ele, e nenhum desses encontros fora rotineiro. Ele atravessou portas trancadas; caminhou quilômetros ao lado de amigos chegados sem ser reconhecido e depois desapareceu diante deles quando o reconheceram; aparentou ser um jardineiro realizando as tarefas matutinas ou um homem qualquer na praia. Era possível encarálo sem perceber que era ele e depois olhar de novo e quase morrer com o choque de reconhecê-lo. Desde sua morte e o que parecia ser sua ressurreição, ele os encontrou sem se anunciar, de surpresa, em momentos aparentemente arbitrários. Agora, porém, havia um lugar marcado para o encontrarem. O que ele diria? Era difícil imaginar como um encontro marcado por Jesus poderia chamar a atenção deles mais do que já chamava.

Embora todos estivessem atentos para avistá-lo, quando ele finalmente apareceu tomou-os de surpresa ao caminhar lentamente em direção a eles. Quem era aquele homem? Estava mesmo vivo? Ou será que era um fantasma? Alguns duvidaram, mas todos, sem exceção, se curvaram e o adoraram. Isso deve tê-los surpreendidos também. Era a primeira vez que o adoravam, dando-lhe toda a honra de acordo com a pessoa que ele realmente era. Eles jamais se esqueceriam disso nem do que ele lhes disse.

Quando falou, sua voz não era elevada. No entanto, as palavras eram tão diretas que os discípulos sentiam que os atravessavam, como se houvesse uma multidão de pessoas atrás deles. Mais tarde, perceberiam que Jesus estava falando a todos que o seguiriam para sempre.

“Todas as nações”

As palavras do Senhor são fundamentais para se decidir qual deve ser, hoje, a tarefa missionária da Igreja. Especificamente a frase “fazei discípulos de todas as nações” deve ser examinada a fundo. Elas contêm a importantí ssima expressão “todas as nações”, que é frequentemente referida na forma grega ethne (panta, “todas”, ta, “as”; ethne,“nações”). A razão de ser uma frase tão importante é pelo fato de a palavra ethne,quando traduzida por “nações”, soar como um agrupamento polí o emprego mais comum nos dias de hoje, mas veremos que não é o que signi

Em seu discurso, Jesus usou quatro vezes a palavra “todo(a)” para declarar o destino de toda a História. Olhar para cada um dos quatro “todos(as)” pode ser a maneira mais simples de entender o que ele disse: “toda a autoridade”, “todas as nações”, “todas as coisas” (que ele ordenou) e “todos os dias”.

“Toda a autoridade”

Eles observaram algo diferente em Jesus enquanto ele se aproximava. Sim, ele havia ressurgido dentre os mortos, e isso bastava para confundir-lhes a cabeça. Entretanto, havia algo mais, como se ele fosse portador de um poder imenso. Desde que o conheceram, ele sempre exerceu uma autoridade confiante e sempre fora muito direto em relação a isso. Ele simplesmente fez tudo que seu Pai lhe ordenara fazer com a autoridade recebida dos céus. Agora, porém, ele era maior, mesmo não usando uma coroa nem segurando um cetro. Ele era o amigo deles, Jesus, com o mesmo sorriso profundo e graça paciente. Contudo, parecia imenso para eles. Ele se mostrava régio, global e perigoso. Ele era o rei de toda a terra, e os discípulos perceberam isso antes mesmo de ele lhes dirigir a palavra.

John Piper panta ta ti co ou geográfico. Esse é fica no grego.

“Toda a autoridade me foi dada no céu e na terra.” Não os surpreendeu que Jesus falasse de si mesmo. Fez sentido quando ele falou. Afinal, o Deus todo-poderoso, o Ancião, outorgou a Jesus autoridade insuperável. Eles poderiam refletir sobre isso durante anos sem jamais conceber a profundidade de seu significado, mesmo assim fazia sentido: Cristo triunfou sobre todo o mal na cruz, e, por causa dessa vitória, o Pai exaltou e honrou o Filho como Cabeça de toda a humanidade. Ele agora detinha o domínio sobre todas as entidades angelicais que habitam os reinos celestes invisíveis. Ele agora tinha o poder para guiar a História na direção que lhe agradasse. A ele foi dada autoridade soberana para instaurar a plenitude do Reino de Deus.

Acho que a João, um dos Onze que estavam na montanha, muitos anos depois, foi revelada essa mesma transferência de autoridade do Pai para o Filho, do ponto de vista atemporal do céu (Ap 5.1-14). João viu o Deus todo-poderoso assentado em seu trono, segurando um rolo com sete selos na mão. Todo o céu ansiava por ver o conteúdo daquele documento: praticamente a declaração do destino da terra. A resposta de Deus a toda injustiça e dor parecia estar contida nele, pronta para ser implantada. O rolo continha os destinos e as glórias da última geração de todas as nações. As mais elevadas esperanças, jamais imaginadas, foram ultrapassadas nele:

Das 18 ocorrências de panta ta ethne (ou suas variantes), somente uma, em Mateus 25.32, parece requerer o significado de “indivíduos genti os”. Três requerem, com base no contexto, o signi de pessoas (At 2.5; 10.35; 17.26). Seis requerem o sen com o Anti go Testamento (Mc 11.17; Lc 21.24; At 15.17; Gl 3.8; Ap 12.5; 15.4). As oito restantes (Mt 24.9,14; 28.19; Lc 12.30; 24.47; At 14.16; 2Tm 4.17; Rm 1.5) podem ser aplicadas a um ou outro sen

O que podemos concluir em relação ao senti do de te, ao seu significado missionário? O uso do singular de um grupo de pessoas. O uso do plural de ethnos às vezes representa um grupo de pessoas, e outras, indivíduos genti os, porém pode ser um ou outro. A frase uma vez, mas a grupos de pessoas nove vezes. As oito ocorrências restantes podem se referir a grupos de pessoas. A combinação desses resultados sugere que o sen na direção de “todas as nações [grupos de pessoas].” os maus foram todos derrotados, e as pessoas dignas, honradas. Era o capítulo final que faltava à história humana, um final maravilhoso, sob o senhorio do Messias.

Por que João chorou quando viu a esperança por escrito? Sem uma pessoa digna, os propósitos de Deus não seriam cumpridos, pois não haveria quem os executasse. Seria possível que não houvesse alguém com autoridade suficiente para levar a cabo a vontade divina? “Não chores”, disseram a João, pois haviam encontrado uma pessoa digna: “Eis que o Leão da tribo de

Judá, a Raiz de Davi, venceu para abrir o livro e os seus sete selos” (Ap 5.5). A pessoa que Deus escolheu era perfeitamente humana, da linhagem de Davi, e ao mesmo tempo inteiramente divina, o Cordeiro que advém do âmago do trono celeste. O Pai concedeu a esse glorioso homem, Cristo Jesus, a autoridade máxima para realizar sua vontade.

O Ancião concedeu todas as coisas como prêmio ao Filho do Homem. Quem poderá opor-se à sua sabedoria? Quem poderá aplacar sua determinação de curar todas as nações? Que poder demoníaco poderá intimidá-lo, mesmo que só um pouco? Quem poderá desviar seu desejo de congregar todos os povos ao seu redor?

Jamais houve tanto poder nas mãos de pessoa alguma. Ele jamais será superado. Ele jamais abdicará de sua coroa. Ele não desistirá até que cumpra plenamente o propósito do Pai.

ficado de grupo ti do de grupo de pessoas, baseando-se na conexão ti do. panta ta ethne em Mateus 28.19 e, mais amplamenethnos no Novo Testamento sempre se refere a panta ta ethne refere-se a indivíduos genti os apenas ti do de panta ta ethne inclina-se fortemente

[cite] Anjos os mandaram à Galileia: “Ele [...] vai adiante de vós para a Galileia; ali o vereis” (Mt 28.7), e a uma montanha, “para o monte que Jesus lhes designa- ra” (Mt 28.16). Provavelmente, era a mesma montanha, perto do mar da Galileia ( Mc 9.9,14,30), onde Jesus apareceu em glória e ouviu a voz do Pai com Pedro, Tiago e João presentes (Mt 17.1-8; Mc 9.1-9; Lc 9.28-36). Esse incidente é às vezes denominado “transfiguração”. 2 2 Depois de Jesus ser visto andando sobre as águas, Mateus 14.33 menciona que aqueles que estavam no barco o adora- ram. Marcos diz que eles estavam apenas assombrados e com o coração endurecido. Mateus 28.17 pode estar descrevendo uma situação semelhante de temor curioso, mas, a meu ver, Mateus 28 é o ponto de partida de uma adoração contínua a Jesus por tudo que eles sabiam que ele era. John Piper é pastor na Bethlehem Bapti st Church, em Minneapolis, Minnesota (Estados Unidos), onde exerce seu mi- nistério desde 1980. Entre seus muitos livros estão The Pleasures of God [Os prazeres de Deus], Em busca de Deus (São Paulo: Shedd Publicações, 2008), Deus é o evangelho (São Jose dos Campos: Fiel, 2006), O que Jesus espera de seus seguidores (São Paulo: Vida, 2008) e Não jogue sua vida fora (São Paulo: Cultura Cristã, 2006). Extraído de Alegrem-se os povos (São Paulo: Cultura Cristã, 2001)Usado com permissão.

[cite] STEVEN C. HAWTHORNE é fundador e diretor de WayMakers, em Austi n, Texas, nos Estados Unidos. É coeditor do livro Missões transculturais (São Paulo: Mundo Cristão, 1987). É também responsável por expedições de pesquisa entre povos não alcançados em cidades cosmopolitas — o Projeto Josué. Ele é coautor (com Graham Kendrick) de Prayerwalking: Praying on Site with Insight [Orando e caminhando: orando no local e com entendimento] e autor de vários arti gos.

PARTE 2 DE 3

“Todas as nações”

Esse homem glorioso estava agora diante deles. Ele fez uma pausa depois de mencionar sua autoridade, deixando sua determinação quase a crepitar no ambiente. Ele tinha a capacidade de autorizar qualquer coisa. O que lhes iria pedir? “Fazei discípulos de todas as nações.”

Eles compreenderam, então, o que milhares de leitores de traduções talvez não percebam: que a palavra de ação primária era: “Fazei discípulos”. As outras palavras de ação, “Ide [...] batizando [...] ensinando”, eram todas imperativas, mas cada uma cumpre parte do que Jesus quis dizer pela ordem principal: “Fazei discípulos de todas as nações”.

Um alvo, não um processo

Jesus falou como se eles pudessem enxergar todas as nações do monte onde estavam. Discipular cada uma das nações significava uma mudança radical em todas as tribos, línguas e povos.

Na sintaxe de sua ordem, a palavra grega traduzida por “fazei discípulos” exige um objeto para a ação de fazer discípulos. A abrangência desse objeto (nesse caso, “todas as nações”) definiria a abrangência da ação discipuladora. A ordem jamais seria limitada à ação de “fazer discípulos”, como se Jesus quisesse apenas que o processo do discipulado ocorresse. A expressão precisava estar completa: “Fazei discípulos de todas as nações”. Jesus estava estabelecendo um objetivo maior. Um movimento de discipulado estava no destino de todas as nações da terra, e ele os estava incumbindo da tarefa de iniciar esse movimento.

Jesus não enfatizou o processo de comunicar o evangelho. Na verdade, ele nada disse do evangelho em si. Eles não receberam ordem de apenas expor os povos ao evangelho. Eles foram comissionados a apresentar um resultado, uma resposta, um séquito global de Jesus a todos os povos. Era uma tarefa a ser assumida e cumprida. Não havia dúvida na mente deles quanto a isso. Jesus sempre terminava o que decidia fazer.

Os povos

A maioria das traduções hoje diz “todas as nações”. Quando ouvidos modernos ouvem a palavra “nação”, imediatamente pensam num “país”, numa “nação-Estado”. Entretanto, a palavra grega é ethne, da qual obtemos a palavra “etnia”. Embora o termo, às vezes, designe todos os não judeus ou não cristãos, quando usado com a palavra grega que significa “todo”, a ele deve ser atribuído o sentido mais comum: um grupo social étnico ou cultural.

Para melhor compreensão, utilizaremos o termo “grupos sociais”. Hoje, assim como nos dias dos discípulos, as pessoas ainda se agrupam em identidades étnicas duradouras. Há várias facetas nos modos em que se identificam os grupos sociais. Os fatores linguísticos, culturais, sociais, econômicos, geográficos, religiosos e políticos podem ser, cada um, parte do que dá forma aos povos da terra. Do ponto de vista do evangelismo, “grupo social” é o maior grupo possível dentro do qual o evangelho pode se espalhar como um movimento de discipulado, ou plantio de igrejas, sem encontrar barreiras de compreensão ou aceitação.

Os discípulos não pensaram, por um momento sequer, que a ordem se referia às naçõesEstado do mundo. Os Onze pertenciam a uma região chamada “Galileia dos gentios” (a palavra grega traduzida por “gentios” em Mt 4.15 é justamente ethne, que significa “povos” ou “nações” em Mt 24.14 e 28.19). A Galileia daqueles dias era conhecida por uma multiplicidade de povos distintos, com diferentes línguas e costumes ( Jo 12.10-21, Mt 8.28 etc.).

Eles sabiam que as Escrituras falavam de povos. Eles reconheciam a si próprios como descendentes de Abraão, destinados a abençoar os clãs e “famílias” do mundo (Gn 12.3; 22.18;

28.14). Eles sabiam sobre o Filho do Homem messiânico, cujo reino se estenderia sobre todos “os povos, nações e homens de todas as línguas” (Dn 7.14).

“Ide [a] todas as nações”

Cristo ordenou que os discípulos estivessem prontos para mudar de localidade a fim de realizar a tarefa. O “ir” não era questão de circunstância, como se ele dissesse: “Se, por acaso, você for viajar, tente fazer alguns discípulos onde você estiver”. Durante anos, eles tinham viajado com Jesus, observando e ajudando enquanto ele cobria, sistematicamente, regiões inteiras (Mc 1.38; Mt 4.23-25). Ele os enviara mais de uma vez a povos e lugares predeterminados, sempre os encorajando a formar relacionamentos significativos, com o objetivo de estimular movimentos duradouros de esperança no Reino de Cristo. O evangelho não era para ser anunciado sem que eles, de fato, fossem aos lugares onde as pessoas viviam (Mt 10.5,6,11-13; Lc 10.1-3,6-9). Agora, ele os enviava a terras longínquas, para continuar fazendo isso, com o intuito de deixar para trás o movimento doméstico de discipulado e oração.

“Todas as coisas que vos tenho ordenado”

Jesus deu aos discípulos apenas duas especificidades sobre o discipulado dos povos: batizar e ensinar. Antes de infundir nosso entendimento, muito posterior ao fato, sobre o que significa o batismo ou quais os assuntos ideais para o ensino, consideremos o que aqueles primeiros seguidores de Jesus, possivelmente, ouviram.

Um povo para seu nome

Jesus formulou a diretriz: “... batizando-os em nome do Pai, e do Filho, e do Espírito Santo”. Os discípulos conheceram a Jesus enquanto João ainda batizava o povo. O batismo marcava um arrependimento da vida anterior, uma purificação e a adesão ao povo de Deus, em preparação para a plenitude do Reino de Deus.

Os discípulos também começaram a batizar o povo, chegando a batizar mais pessoas que

João Batista ( Jo 4.1,2). Por meio desse batismo, cada pessoa declarava seu arrependimento e a disposição para seguir o vindouro Messias, marcando uma mudança de lealdade. A pessoa batizada estava jurando viver sob o governo do Messias quando este chegasse.

Agora, mais uma vez, Jesus os enviava a batizar. Talvez eles não tivessem compreendido tudo no momento, mas logo veriam o que Jesus queria dizer com o resultado: uma nova comunidade se formaria por meio desse batismo. O nome tríplice não era uma fórmula vã a ser repetida na realização do ritual. As pessoas que eles iriam batizar seriam apresentadas pessoalmente a Deus, visto que ele havia se revelado plenamente. Elas não mais esperavam um Messias misterioso. Todo discípulo batizado poderia se encontrar de modo relacional com o Pai, que dera seu Filho e que concederia ainda o Espírito Santo de Deus.

Em todo o mundo, por meio do batismo, Deus conquistaria para si um povo, o qual saberia exatamente o que Deus queria ver declarado ao mundo. O povo batizado vestiria publicamente seu nome em todos os grupos sociais e reconheceria que Deus estava formando, dentre todos os povos, “um povo para o seu nome” (At 15.14).

Vivendo sob sua autoridade

Quando Jesus disse “ensinando”, os discípulos não pensaram, em momento algum, tratar-se de mera transferência de conhecimento. Eles o ouviram dizer: “... ensinando-os a guardar [obedecer]...”. Eles não estavam sendo enviados para arrebanhar alunos para aulas de costumes e filosofias hebraicas. Eles precisavam treinar pessoas de modo a torná-las aptas a conhecer e seguir a Jesus plenamente. O evangelismo deles seria, antes de tudo, uma questão de obediência vitalícia, em vez de uma busca por conformidade de credo. Era uma questão de fé, porém voltada, como Paulo descreveria posteriormente, “para a obediência por fé, entre todos os gentios”.

Obedecer a Jesus nunca foi um assunto vago e subjetivo, em torno do qual cada seguidor de

[cite] 3 3 O verbo mathetuesate, nessa forma, é transitivo, o que significa que exige um objeto direto para fazer sentido. A frase precisa ser considerada como um todo: mathesuesate panta ta ethne, como uma ideia verbal inteira.

PARTE 3 DE 3

28.14). Eles sabiam sobre o Filho do Homem messiânico, cujo reino se estenderia sobre todos “os povos, nações e homens de todas as línguas” (Dn 7.14).

“Ide [a] todas as nações”

Cristo ordenou que os discípulos estivessem prontos para mudar de localidade a fim de realizar a tarefa. O “ir” não era questão de circunstância, como se ele dissesse: “Se, por acaso, você for viajar, tente fazer alguns discípulos onde você estiver”. Durante anos, eles tinham viajado com Jesus, observando e ajudando enquanto ele cobria, sistematicamente, regiões inteiras (Mc 1.38; Mt 4.23-25). Ele os enviara mais de uma vez a povos e lugares predeterminados, sempre os encorajando a formar relacionamentos significativos, com o objetivo de estimular movimentos duradouros de esperança no Reino de Cristo. O evangelho não era para ser anunciado sem que eles, de fato, fossem aos lugares onde as pessoas viviam (Mt 10.5,6,11-13; Lc 10.1-3,6-9). Agora, ele os enviava a terras longínquas, para continuar fazendo isso, com o intuito de deixar para trás o movimento doméstico de discipulado e oração.

“Todas as coisas que vos tenho ordenado”

Jesus deu aos discípulos apenas duas especificidades sobre o discipulado dos povos: batizar e ensinar. Antes de infundir nosso entendimento, muito posterior ao fato, sobre o que significa o batismo ou quais os assuntos ideais para o ensino, consideremos o que aqueles primeiros seguidores de Jesus, possivelmente, ouviram.

Um povo para seu nome

Jesus formulou a diretriz: “... batizando-os em nome do Pai, e do Filho, e do Espírito Santo”. Os discípulos conheceram a Jesus enquanto João ainda batizava o povo. O batismo marcava um arrependimento da vida anterior, uma purificação e a adesão ao povo de Deus, em preparação para a plenitude do Reino de Deus.

Os discípulos também começaram a batizar o povo, chegando a batizar mais pessoas que

João Batista ( Jo 4.1,2). Por meio desse batismo, cada pessoa declarava seu arrependimento e a disposição para seguir o vindouro Messias, marcando uma mudança de lealdade. A pessoa batizada estava jurando viver sob o governo do Messias quando este chegasse.

Agora, mais uma vez, Jesus os enviava a batizar. Talvez eles não tivessem compreendido tudo no momento, mas logo veriam o que Jesus queria dizer com o resultado: uma nova comunidade se formaria por meio desse batismo. O nome tríplice não era uma fórmula vã a ser repetida na realização do ritual. As pessoas que eles iriam batizar seriam apresentadas pessoalmente a Deus, visto que ele havia se revelado plenamente. Elas não mais esperavam um Messias misterioso. Todo discípulo batizado poderia se encontrar de modo relacional com o Pai, que dera seu Filho e que concederia ainda o Espírito Santo de Deus.

Em todo o mundo, por meio do batismo, Deus conquistaria para si um povo, o qual saberia exatamente o que Deus queria ver declarado ao mundo. O povo batizado vestiria publicamente seu nome em todos os grupos sociais e reconheceria que Deus estava formando, dentre todos os povos, “um povo para o seu nome” (At 15.14).

Vivendo sob sua autoridade

Quando Jesus disse “ensinando”, os discípulos não pensaram, em momento algum, tratar-se de mera transferência de conhecimento. Eles o ouviram dizer: “... ensinando-os a guardar [obedecer]...”. Eles não estavam sendo enviados para arrebanhar alunos para aulas de costumes e filosofias hebraicas. Eles precisavam treinar pessoas de modo a torná-las aptas a conhecer e seguir a Jesus plenamente. O evangelismo deles seria, antes de tudo, uma questão de obediência vitalícia, em vez de uma busca por conformidade de credo. Era uma questão de fé, porém voltada, como Paulo descreveria posteriormente, “para a obediência por fé, entre todos os gentios”.

Obedecer a Jesus nunca foi um assunto vago e subjetivo, em torno do qual cada seguidor de

Jesus pudesse fabricar um conceito próprio de disciplina. Jesus lhes dera poucas e claras ordens, e nenhuma delas estava relacionada com a fabricação de méritos legalistas de sistemas religiosos. A ordem principal é simples e universal, extensiva a todos os seus seguidores: “Que vos ameis uns aos outros”. É impossível amar “um ao outro” sozinho. São necessários dois ou mais para cumprir esse mandamento recíproco de forma consciente. Jesus, portanto, estava formando uma comunidade de alegria vivificante sob sua autoridade.

Os discípulos estavam espantados com a certeza de tudo isso. Quão adequado e urgente (embora sem atropelos) era convocar pessoas de todas as nações para segui-lo! Jesus não estava expressando ambições desenfreadas. O Ancião o exaltara como único Redentor e Juiz definitivo de todos os homens, mulheres e crianças existentes. Somente ele cumpriria o destino de todos os clãs e tribos dos povos da terra.

“Todos os dias”

“Eis que estou convosco...” O último mandamento, na verdade, era: “Atenção!”, que significava: “Olhem para mim. Mantenham-se concentrados em mim. Inclinem-se e atentem para mim”. Jesus acabara de comissioná-los para ir aos lugares mais distantes do planeta, contudo, ele não os estava enviando para longe dele. Ele estava, na verdade, chamando-os para estarem mais perto dele, como nunca tinham estado. Ele não estava apenas transferindo um pouco de seu poder. Teria sido o caso se ele estivesse anunciando sua partida. Em vez disso, ele declarou que estava no planeta para ficar, exercendo toda fibra de sua autoridade até o fim dos dias.

Ele próprio estaria com eles a cada dia, todos os dias “até à consumação do século”.

Pouco tempo depois, em outra montanha perto de Jerusalém, eles o veriam ser elevado ao céu (At 1.9-12). Daquela cidade saíram “por toda parte pregando a palavra”. Ao partir, estavam convencidos de que Jesus não havia desaparecido, mas fora entronizado no céu, porém se lembraram do que ele dissera sobre estar com eles. E ele estava! Como relata o evangelho de Marcos, ao mesmo tempo em que Jesus “assentou-se à destra de Deus”, ele também estava “cooperando com eles” enquanto partiam para os quatro cantos da terra a fim de evangelizar as terras longínquas (Mc 16.19,20).

O século de que Jesus falava ainda não terminou. Todos os dias, desde aquele encontro, Jesus está “com” aqueles que cumprem sua ordem.

Enquanto você lê este, vive também um desses dias. Jesus sabia que esse dia iria chegar quando falava na montanha. Ele sabia de você e sabia dos povos que o seguiriam. Você consegue imaginar-se na montanha, ajoelhado no chão, com 11 homens ao seu lado, calados, ouvindo Jesus dizer essas palavras? Você tem todo o direito de se imaginar ali, porque Jesus realmente proferiu essas palavras. Quando ele as proferiu, falou com clareza deliberada a todos que iriam segui-lo, o que inclui você e eu. O que faremos em resposta? Ele deu a todo o seu povo uma ordem de trabalhar com toda a sua autoridade para ensinar obediência a tudo que ele ordenou entre todos os povos. Como podemos lhe dar menos do que tudo o que temos?

Perguntas para estudo

1.Quais são os quatro “todos” em Mateus 28.18-20?

2.Por que a autoridade de Cristo é essencial para essa ordem específica?

3.Por que Hawthorne afirma que a ordem é maior que o processo de fazer discípulos?

[cite] 5 6 4 4 Algumas versões traduzem a palavra “ver” como uma interjeição, em vez de um imperativo acompanhado da palavra “eis”. 5 A expressão grega traduzida por “todos os dias” ou “sempre” emprega a mesma palavra grega traduzida por “todo/ toda” três vezes anteriormente na passagem. 6 Quanto à expressão “estou convoco”, comp. com Gn 26.3,24; 28.14-21; Êx 3.12; Dt 31.8,23; Js 1.5; Jz 6.16. Quando Deus diz a Isaque, Jacó, Moisés, Josué e Gideão: “Serei contigo”, é no contexto de uma missão quase impossível. Os construtores do templo de Salomão e depois os que trabalharam com Ageu foram instruídos a estar atentos à presença de Deus com eles (1Rs 11.38 e Ag 1.13; 2.4). Visto que Deus anuncia que ele mesmo será a principal fonte de poder, enquanto cada um deles cumpre sua respectiva missão, é como se o próprio Deus estivesse dizendo: “Estareis comigo”. Nessas passagens, e muito pro- vavelmente em Mateus 18.20, a questão não é a segurança ou o consolo na solidão, e sim a liderança capacitadora de Deus.$conteudo$
     where curso_id = v_curso and ordem = 18;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Hawthorne, cap. 13: Mandamento na montanha$t$, $conteudo$PARTE 1 DE 3

Mandamento na montanha

Steven C. Hawthorne

EO anjo, dirigindo-se às mulheres, disse: Ide, pois, depressa e dizei aos seus discípulos que ele [...] vai adiante de vós para a Galileia;

ali o vereis (Mt 28.5-7).

Ide avisar a meus irmãos que se dirijam à Galileia e lá me verão (Mt 28.10).

Seguiram os onze discípulos para a Galileia, para o monte que

Jesus lhes designara. E, quando o viram, o adoraram; mas alguns duvidaram (Mt 28.16,17).

les esperaram na montanha, um dos montes mais altos com vista para o mar da Galileia. Não havia dúvida de que estavam no lugar certo, pois já haviam se encontrado com Jesus ali. O próprio Jesus costumava orar nesse monte. Na verdade, Tiago, João e Pedro levaram os discípulos ao exato local onde o tinham visto em glória resplandecente.

Eles contemplaram o lago abaixo, quebrando o silêncio para recordar em voz alta algumas das coisas que aconteceram ao redor dele. Havia apenas 11 deles agora. Um a um, cada um deles intimamente questionava o que aconteceria quando Jesus aparecesse. As expectativas estavam nas alturas. O tempo passava lentamente. Eles esperavam e conjecturavam.

Jesus jamais foi previsível, mesmo nos primeiros dias na Galileia. O que aconteceria agora que havia morrido? Ou estaria vivo? Cada um deles já o tinha visto outra vez, ou pelo menos o que parecia ser ele, e nenhum desses encontros fora rotineiro. Ele atravessou portas trancadas; caminhou quilômetros ao lado de amigos chegados sem ser reconhecido e depois desapareceu diante deles quando o reconheceram; aparentou ser um jardineiro realizando as tarefas matutinas ou um homem qualquer na praia. Era possível encarálo sem perceber que era ele e depois olhar de novo e quase morrer com o choque de reconhecê-lo. Desde sua morte e o que parecia ser sua ressurreição, ele os encontrou sem se anunciar, de surpresa, em momentos aparentemente arbitrários. Agora, porém, havia um lugar marcado para o encontrarem. O que ele diria? Era difícil imaginar como um encontro marcado por Jesus poderia chamar a atenção deles mais do que já chamava.

Embora todos estivessem atentos para avistá-lo, quando ele finalmente apareceu tomou-os de surpresa ao caminhar lentamente em direção a eles. Quem era aquele homem? Estava mesmo vivo? Ou será que era um fantasma? Alguns duvidaram, mas todos, sem exceção, se curvaram e o adoraram. Isso deve tê-los surpreendidos também. Era a primeira vez que o adoravam, dando-lhe toda a honra de acordo com a pessoa que ele realmente era. Eles jamais se esqueceriam disso nem do que ele lhes disse.

Quando falou, sua voz não era elevada. No entanto, as palavras eram tão diretas que os discípulos sentiam que os atravessavam, como se houvesse uma multidão de pessoas atrás deles. Mais tarde, perceberiam que Jesus estava falando a todos que o seguiriam para sempre.

“Todas as nações”

As palavras do Senhor são fundamentais para se decidir qual deve ser, hoje, a tarefa missionária da Igreja. Especificamente a frase “fazei discípulos de todas as nações” deve ser examinada a fundo. Elas contêm a importantí ssima expressão “todas as nações”, que é frequentemente referida na forma grega ethne (panta, “todas”, ta, “as”; ethne,“nações”). A razão de ser uma frase tão importante é pelo fato de a palavra ethne,quando traduzida por “nações”, soar como um agrupamento polí o emprego mais comum nos dias de hoje, mas veremos que não é o que signi

Em seu discurso, Jesus usou quatro vezes a palavra “todo(a)” para declarar o destino de toda a História. Olhar para cada um dos quatro “todos(as)” pode ser a maneira mais simples de entender o que ele disse: “toda a autoridade”, “todas as nações”, “todas as coisas” (que ele ordenou) e “todos os dias”.

“Toda a autoridade”

Eles observaram algo diferente em Jesus enquanto ele se aproximava. Sim, ele havia ressurgido dentre os mortos, e isso bastava para confundir-lhes a cabeça. Entretanto, havia algo mais, como se ele fosse portador de um poder imenso. Desde que o conheceram, ele sempre exerceu uma autoridade confiante e sempre fora muito direto em relação a isso. Ele simplesmente fez tudo que seu Pai lhe ordenara fazer com a autoridade recebida dos céus. Agora, porém, ele era maior, mesmo não usando uma coroa nem segurando um cetro. Ele era o amigo deles, Jesus, com o mesmo sorriso profundo e graça paciente. Contudo, parecia imenso para eles. Ele se mostrava régio, global e perigoso. Ele era o rei de toda a terra, e os discípulos perceberam isso antes mesmo de ele lhes dirigir a palavra.

John Piper panta ta ti co ou geográfico. Esse é fica no grego.

“Toda a autoridade me foi dada no céu e na terra.” Não os surpreendeu que Jesus falasse de si mesmo. Fez sentido quando ele falou. Afinal, o Deus todo-poderoso, o Ancião, outorgou a Jesus autoridade insuperável. Eles poderiam refletir sobre isso durante anos sem jamais conceber a profundidade de seu significado, mesmo assim fazia sentido: Cristo triunfou sobre todo o mal na cruz, e, por causa dessa vitória, o Pai exaltou e honrou o Filho como Cabeça de toda a humanidade. Ele agora detinha o domínio sobre todas as entidades angelicais que habitam os reinos celestes invisíveis. Ele agora tinha o poder para guiar a História na direção que lhe agradasse. A ele foi dada autoridade soberana para instaurar a plenitude do Reino de Deus.

Acho que a João, um dos Onze que estavam na montanha, muitos anos depois, foi revelada essa mesma transferência de autoridade do Pai para o Filho, do ponto de vista atemporal do céu (Ap 5.1-14). João viu o Deus todo-poderoso assentado em seu trono, segurando um rolo com sete selos na mão. Todo o céu ansiava por ver o conteúdo daquele documento: praticamente a declaração do destino da terra. A resposta de Deus a toda injustiça e dor parecia estar contida nele, pronta para ser implantada. O rolo continha os destinos e as glórias da última geração de todas as nações. As mais elevadas esperanças, jamais imaginadas, foram ultrapassadas nele:

Das 18 ocorrências de panta ta ethne (ou suas variantes), somente uma, em Mateus 25.32, parece requerer o significado de “indivíduos genti os”. Três requerem, com base no contexto, o signi de pessoas (At 2.5; 10.35; 17.26). Seis requerem o sen com o Anti go Testamento (Mc 11.17; Lc 21.24; At 15.17; Gl 3.8; Ap 12.5; 15.4). As oito restantes (Mt 24.9,14; 28.19; Lc 12.30; 24.47; At 14.16; 2Tm 4.17; Rm 1.5) podem ser aplicadas a um ou outro sen

O que podemos concluir em relação ao senti do de te, ao seu significado missionário? O uso do singular de um grupo de pessoas. O uso do plural de ethnos às vezes representa um grupo de pessoas, e outras, indivíduos genti os, porém pode ser um ou outro. A frase uma vez, mas a grupos de pessoas nove vezes. As oito ocorrências restantes podem se referir a grupos de pessoas. A combinação desses resultados sugere que o sen na direção de “todas as nações [grupos de pessoas].” os maus foram todos derrotados, e as pessoas dignas, honradas. Era o capítulo final que faltava à história humana, um final maravilhoso, sob o senhorio do Messias.

Por que João chorou quando viu a esperança por escrito? Sem uma pessoa digna, os propósitos de Deus não seriam cumpridos, pois não haveria quem os executasse. Seria possível que não houvesse alguém com autoridade suficiente para levar a cabo a vontade divina? “Não chores”, disseram a João, pois haviam encontrado uma pessoa digna: “Eis que o Leão da tribo de

Judá, a Raiz de Davi, venceu para abrir o livro e os seus sete selos” (Ap 5.5). A pessoa que Deus escolheu era perfeitamente humana, da linhagem de Davi, e ao mesmo tempo inteiramente divina, o Cordeiro que advém do âmago do trono celeste. O Pai concedeu a esse glorioso homem, Cristo Jesus, a autoridade máxima para realizar sua vontade.

O Ancião concedeu todas as coisas como prêmio ao Filho do Homem. Quem poderá opor-se à sua sabedoria? Quem poderá aplacar sua determinação de curar todas as nações? Que poder demoníaco poderá intimidá-lo, mesmo que só um pouco? Quem poderá desviar seu desejo de congregar todos os povos ao seu redor?

Jamais houve tanto poder nas mãos de pessoa alguma. Ele jamais será superado. Ele jamais abdicará de sua coroa. Ele não desistirá até que cumpra plenamente o propósito do Pai.

ficado de grupo ti do de grupo de pessoas, baseando-se na conexão ti do. panta ta ethne em Mateus 28.19 e, mais amplamenethnos no Novo Testamento sempre se refere a panta ta ethne refere-se a indivíduos genti os apenas ti do de panta ta ethne inclina-se fortemente

[cite] Anjos os mandaram à Galileia: “Ele [...] vai adiante de vós para a Galileia; ali o vereis” (Mt 28.7), e a uma montanha, “para o monte que Jesus lhes designa- ra” (Mt 28.16). Provavelmente, era a mesma montanha, perto do mar da Galileia ( Mc 9.9,14,30), onde Jesus apareceu em glória e ouviu a voz do Pai com Pedro, Tiago e João presentes (Mt 17.1-8; Mc 9.1-9; Lc 9.28-36). Esse incidente é às vezes denominado “transfiguração”. 2 2 Depois de Jesus ser visto andando sobre as águas, Mateus 14.33 menciona que aqueles que estavam no barco o adora- ram. Marcos diz que eles estavam apenas assombrados e com o coração endurecido. Mateus 28.17 pode estar descrevendo uma situação semelhante de temor curioso, mas, a meu ver, Mateus 28 é o ponto de partida de uma adoração contínua a Jesus por tudo que eles sabiam que ele era. John Piper é pastor na Bethlehem Bapti st Church, em Minneapolis, Minnesota (Estados Unidos), onde exerce seu mi- nistério desde 1980. Entre seus muitos livros estão The Pleasures of God [Os prazeres de Deus], Em busca de Deus (São Paulo: Shedd Publicações, 2008), Deus é o evangelho (São Jose dos Campos: Fiel, 2006), O que Jesus espera de seus seguidores (São Paulo: Vida, 2008) e Não jogue sua vida fora (São Paulo: Cultura Cristã, 2006). Extraído de Alegrem-se os povos (São Paulo: Cultura Cristã, 2001)Usado com permissão.

[cite] STEVEN C. HAWTHORNE é fundador e diretor de WayMakers, em Austi n, Texas, nos Estados Unidos. É coeditor do livro Missões transculturais (São Paulo: Mundo Cristão, 1987). É também responsável por expedições de pesquisa entre povos não alcançados em cidades cosmopolitas — o Projeto Josué. Ele é coautor (com Graham Kendrick) de Prayerwalking: Praying on Site with Insight [Orando e caminhando: orando no local e com entendimento] e autor de vários arti gos.

PARTE 2 DE 3

“Todas as nações”

Esse homem glorioso estava agora diante deles. Ele fez uma pausa depois de mencionar sua autoridade, deixando sua determinação quase a crepitar no ambiente. Ele tinha a capacidade de autorizar qualquer coisa. O que lhes iria pedir? “Fazei discípulos de todas as nações.”

Eles compreenderam, então, o que milhares de leitores de traduções talvez não percebam: que a palavra de ação primária era: “Fazei discípulos”. As outras palavras de ação, “Ide [...] batizando [...] ensinando”, eram todas imperativas, mas cada uma cumpre parte do que Jesus quis dizer pela ordem principal: “Fazei discípulos de todas as nações”.

Um alvo, não um processo

Jesus falou como se eles pudessem enxergar todas as nações do monte onde estavam. Discipular cada uma das nações significava uma mudança radical em todas as tribos, línguas e povos.

Na sintaxe de sua ordem, a palavra grega traduzida por “fazei discípulos” exige um objeto para a ação de fazer discípulos. A abrangência desse objeto (nesse caso, “todas as nações”) definiria a abrangência da ação discipuladora. A ordem jamais seria limitada à ação de “fazer discípulos”, como se Jesus quisesse apenas que o processo do discipulado ocorresse. A expressão precisava estar completa: “Fazei discípulos de todas as nações”. Jesus estava estabelecendo um objetivo maior. Um movimento de discipulado estava no destino de todas as nações da terra, e ele os estava incumbindo da tarefa de iniciar esse movimento.

Jesus não enfatizou o processo de comunicar o evangelho. Na verdade, ele nada disse do evangelho em si. Eles não receberam ordem de apenas expor os povos ao evangelho. Eles foram comissionados a apresentar um resultado, uma resposta, um séquito global de Jesus a todos os povos. Era uma tarefa a ser assumida e cumprida. Não havia dúvida na mente deles quanto a isso. Jesus sempre terminava o que decidia fazer.

Os povos

A maioria das traduções hoje diz “todas as nações”. Quando ouvidos modernos ouvem a palavra “nação”, imediatamente pensam num “país”, numa “nação-Estado”. Entretanto, a palavra grega é ethne, da qual obtemos a palavra “etnia”. Embora o termo, às vezes, designe todos os não judeus ou não cristãos, quando usado com a palavra grega que significa “todo”, a ele deve ser atribuído o sentido mais comum: um grupo social étnico ou cultural.

Para melhor compreensão, utilizaremos o termo “grupos sociais”. Hoje, assim como nos dias dos discípulos, as pessoas ainda se agrupam em identidades étnicas duradouras. Há várias facetas nos modos em que se identificam os grupos sociais. Os fatores linguísticos, culturais, sociais, econômicos, geográficos, religiosos e políticos podem ser, cada um, parte do que dá forma aos povos da terra. Do ponto de vista do evangelismo, “grupo social” é o maior grupo possível dentro do qual o evangelho pode se espalhar como um movimento de discipulado, ou plantio de igrejas, sem encontrar barreiras de compreensão ou aceitação.

Os discípulos não pensaram, por um momento sequer, que a ordem se referia às naçõesEstado do mundo. Os Onze pertenciam a uma região chamada “Galileia dos gentios” (a palavra grega traduzida por “gentios” em Mt 4.15 é justamente ethne, que significa “povos” ou “nações” em Mt 24.14 e 28.19). A Galileia daqueles dias era conhecida por uma multiplicidade de povos distintos, com diferentes línguas e costumes ( Jo 12.10-21, Mt 8.28 etc.).

Eles sabiam que as Escrituras falavam de povos. Eles reconheciam a si próprios como descendentes de Abraão, destinados a abençoar os clãs e “famílias” do mundo (Gn 12.3; 22.18;

28.14). Eles sabiam sobre o Filho do Homem messiânico, cujo reino se estenderia sobre todos “os povos, nações e homens de todas as línguas” (Dn 7.14).

“Ide [a] todas as nações”

Cristo ordenou que os discípulos estivessem prontos para mudar de localidade a fim de realizar a tarefa. O “ir” não era questão de circunstância, como se ele dissesse: “Se, por acaso, você for viajar, tente fazer alguns discípulos onde você estiver”. Durante anos, eles tinham viajado com Jesus, observando e ajudando enquanto ele cobria, sistematicamente, regiões inteiras (Mc 1.38; Mt 4.23-25). Ele os enviara mais de uma vez a povos e lugares predeterminados, sempre os encorajando a formar relacionamentos significativos, com o objetivo de estimular movimentos duradouros de esperança no Reino de Cristo. O evangelho não era para ser anunciado sem que eles, de fato, fossem aos lugares onde as pessoas viviam (Mt 10.5,6,11-13; Lc 10.1-3,6-9). Agora, ele os enviava a terras longínquas, para continuar fazendo isso, com o intuito de deixar para trás o movimento doméstico de discipulado e oração.

“Todas as coisas que vos tenho ordenado”

Jesus deu aos discípulos apenas duas especificidades sobre o discipulado dos povos: batizar e ensinar. Antes de infundir nosso entendimento, muito posterior ao fato, sobre o que significa o batismo ou quais os assuntos ideais para o ensino, consideremos o que aqueles primeiros seguidores de Jesus, possivelmente, ouviram.

Um povo para seu nome

Jesus formulou a diretriz: “... batizando-os em nome do Pai, e do Filho, e do Espírito Santo”. Os discípulos conheceram a Jesus enquanto João ainda batizava o povo. O batismo marcava um arrependimento da vida anterior, uma purificação e a adesão ao povo de Deus, em preparação para a plenitude do Reino de Deus.

Os discípulos também começaram a batizar o povo, chegando a batizar mais pessoas que

João Batista ( Jo 4.1,2). Por meio desse batismo, cada pessoa declarava seu arrependimento e a disposição para seguir o vindouro Messias, marcando uma mudança de lealdade. A pessoa batizada estava jurando viver sob o governo do Messias quando este chegasse.

Agora, mais uma vez, Jesus os enviava a batizar. Talvez eles não tivessem compreendido tudo no momento, mas logo veriam o que Jesus queria dizer com o resultado: uma nova comunidade se formaria por meio desse batismo. O nome tríplice não era uma fórmula vã a ser repetida na realização do ritual. As pessoas que eles iriam batizar seriam apresentadas pessoalmente a Deus, visto que ele havia se revelado plenamente. Elas não mais esperavam um Messias misterioso. Todo discípulo batizado poderia se encontrar de modo relacional com o Pai, que dera seu Filho e que concederia ainda o Espírito Santo de Deus.

Em todo o mundo, por meio do batismo, Deus conquistaria para si um povo, o qual saberia exatamente o que Deus queria ver declarado ao mundo. O povo batizado vestiria publicamente seu nome em todos os grupos sociais e reconheceria que Deus estava formando, dentre todos os povos, “um povo para o seu nome” (At 15.14).

Vivendo sob sua autoridade

Quando Jesus disse “ensinando”, os discípulos não pensaram, em momento algum, tratar-se de mera transferência de conhecimento. Eles o ouviram dizer: “... ensinando-os a guardar [obedecer]...”. Eles não estavam sendo enviados para arrebanhar alunos para aulas de costumes e filosofias hebraicas. Eles precisavam treinar pessoas de modo a torná-las aptas a conhecer e seguir a Jesus plenamente. O evangelismo deles seria, antes de tudo, uma questão de obediência vitalícia, em vez de uma busca por conformidade de credo. Era uma questão de fé, porém voltada, como Paulo descreveria posteriormente, “para a obediência por fé, entre todos os gentios”.

Obedecer a Jesus nunca foi um assunto vago e subjetivo, em torno do qual cada seguidor de

[cite] 3 3 O verbo mathetuesate, nessa forma, é transitivo, o que significa que exige um objeto direto para fazer sentido. A frase precisa ser considerada como um todo: mathesuesate panta ta ethne, como uma ideia verbal inteira.

PARTE 3 DE 3

28.14). Eles sabiam sobre o Filho do Homem messiânico, cujo reino se estenderia sobre todos “os povos, nações e homens de todas as línguas” (Dn 7.14).

“Ide [a] todas as nações”

Cristo ordenou que os discípulos estivessem prontos para mudar de localidade a fim de realizar a tarefa. O “ir” não era questão de circunstância, como se ele dissesse: “Se, por acaso, você for viajar, tente fazer alguns discípulos onde você estiver”. Durante anos, eles tinham viajado com Jesus, observando e ajudando enquanto ele cobria, sistematicamente, regiões inteiras (Mc 1.38; Mt 4.23-25). Ele os enviara mais de uma vez a povos e lugares predeterminados, sempre os encorajando a formar relacionamentos significativos, com o objetivo de estimular movimentos duradouros de esperança no Reino de Cristo. O evangelho não era para ser anunciado sem que eles, de fato, fossem aos lugares onde as pessoas viviam (Mt 10.5,6,11-13; Lc 10.1-3,6-9). Agora, ele os enviava a terras longínquas, para continuar fazendo isso, com o intuito de deixar para trás o movimento doméstico de discipulado e oração.

“Todas as coisas que vos tenho ordenado”

Jesus deu aos discípulos apenas duas especificidades sobre o discipulado dos povos: batizar e ensinar. Antes de infundir nosso entendimento, muito posterior ao fato, sobre o que significa o batismo ou quais os assuntos ideais para o ensino, consideremos o que aqueles primeiros seguidores de Jesus, possivelmente, ouviram.

Um povo para seu nome

Jesus formulou a diretriz: “... batizando-os em nome do Pai, e do Filho, e do Espírito Santo”. Os discípulos conheceram a Jesus enquanto João ainda batizava o povo. O batismo marcava um arrependimento da vida anterior, uma purificação e a adesão ao povo de Deus, em preparação para a plenitude do Reino de Deus.

Os discípulos também começaram a batizar o povo, chegando a batizar mais pessoas que

João Batista ( Jo 4.1,2). Por meio desse batismo, cada pessoa declarava seu arrependimento e a disposição para seguir o vindouro Messias, marcando uma mudança de lealdade. A pessoa batizada estava jurando viver sob o governo do Messias quando este chegasse.

Agora, mais uma vez, Jesus os enviava a batizar. Talvez eles não tivessem compreendido tudo no momento, mas logo veriam o que Jesus queria dizer com o resultado: uma nova comunidade se formaria por meio desse batismo. O nome tríplice não era uma fórmula vã a ser repetida na realização do ritual. As pessoas que eles iriam batizar seriam apresentadas pessoalmente a Deus, visto que ele havia se revelado plenamente. Elas não mais esperavam um Messias misterioso. Todo discípulo batizado poderia se encontrar de modo relacional com o Pai, que dera seu Filho e que concederia ainda o Espírito Santo de Deus.

Em todo o mundo, por meio do batismo, Deus conquistaria para si um povo, o qual saberia exatamente o que Deus queria ver declarado ao mundo. O povo batizado vestiria publicamente seu nome em todos os grupos sociais e reconheceria que Deus estava formando, dentre todos os povos, “um povo para o seu nome” (At 15.14).

Vivendo sob sua autoridade

Quando Jesus disse “ensinando”, os discípulos não pensaram, em momento algum, tratar-se de mera transferência de conhecimento. Eles o ouviram dizer: “... ensinando-os a guardar [obedecer]...”. Eles não estavam sendo enviados para arrebanhar alunos para aulas de costumes e filosofias hebraicas. Eles precisavam treinar pessoas de modo a torná-las aptas a conhecer e seguir a Jesus plenamente. O evangelismo deles seria, antes de tudo, uma questão de obediência vitalícia, em vez de uma busca por conformidade de credo. Era uma questão de fé, porém voltada, como Paulo descreveria posteriormente, “para a obediência por fé, entre todos os gentios”.

Obedecer a Jesus nunca foi um assunto vago e subjetivo, em torno do qual cada seguidor de

Jesus pudesse fabricar um conceito próprio de disciplina. Jesus lhes dera poucas e claras ordens, e nenhuma delas estava relacionada com a fabricação de méritos legalistas de sistemas religiosos. A ordem principal é simples e universal, extensiva a todos os seus seguidores: “Que vos ameis uns aos outros”. É impossível amar “um ao outro” sozinho. São necessários dois ou mais para cumprir esse mandamento recíproco de forma consciente. Jesus, portanto, estava formando uma comunidade de alegria vivificante sob sua autoridade.

Os discípulos estavam espantados com a certeza de tudo isso. Quão adequado e urgente (embora sem atropelos) era convocar pessoas de todas as nações para segui-lo! Jesus não estava expressando ambições desenfreadas. O Ancião o exaltara como único Redentor e Juiz definitivo de todos os homens, mulheres e crianças existentes. Somente ele cumpriria o destino de todos os clãs e tribos dos povos da terra.

“Todos os dias”

“Eis que estou convosco...” O último mandamento, na verdade, era: “Atenção!”, que significava: “Olhem para mim. Mantenham-se concentrados em mim. Inclinem-se e atentem para mim”. Jesus acabara de comissioná-los para ir aos lugares mais distantes do planeta, contudo, ele não os estava enviando para longe dele. Ele estava, na verdade, chamando-os para estarem mais perto dele, como nunca tinham estado. Ele não estava apenas transferindo um pouco de seu poder. Teria sido o caso se ele estivesse anunciando sua partida. Em vez disso, ele declarou que estava no planeta para ficar, exercendo toda fibra de sua autoridade até o fim dos dias.

Ele próprio estaria com eles a cada dia, todos os dias “até à consumação do século”.

Pouco tempo depois, em outra montanha perto de Jerusalém, eles o veriam ser elevado ao céu (At 1.9-12). Daquela cidade saíram “por toda parte pregando a palavra”. Ao partir, estavam convencidos de que Jesus não havia desaparecido, mas fora entronizado no céu, porém se lembraram do que ele dissera sobre estar com eles. E ele estava! Como relata o evangelho de Marcos, ao mesmo tempo em que Jesus “assentou-se à destra de Deus”, ele também estava “cooperando com eles” enquanto partiam para os quatro cantos da terra a fim de evangelizar as terras longínquas (Mc 16.19,20).

O século de que Jesus falava ainda não terminou. Todos os dias, desde aquele encontro, Jesus está “com” aqueles que cumprem sua ordem.

Enquanto você lê este, vive também um desses dias. Jesus sabia que esse dia iria chegar quando falava na montanha. Ele sabia de você e sabia dos povos que o seguiriam. Você consegue imaginar-se na montanha, ajoelhado no chão, com 11 homens ao seu lado, calados, ouvindo Jesus dizer essas palavras? Você tem todo o direito de se imaginar ali, porque Jesus realmente proferiu essas palavras. Quando ele as proferiu, falou com clareza deliberada a todos que iriam segui-lo, o que inclui você e eu. O que faremos em resposta? Ele deu a todo o seu povo uma ordem de trabalhar com toda a sua autoridade para ensinar obediência a tudo que ele ordenou entre todos os povos. Como podemos lhe dar menos do que tudo o que temos?

Perguntas para estudo

1.Quais são os quatro “todos” em Mateus 28.18-20?

2.Por que a autoridade de Cristo é essencial para essa ordem específica?

3.Por que Hawthorne afirma que a ordem é maior que o processo de fazer discípulos?

[cite] 5 6 4 4 Algumas versões traduzem a palavra “ver” como uma interjeição, em vez de um imperativo acompanhado da palavra “eis”. 5 A expressão grega traduzida por “todos os dias” ou “sempre” emprega a mesma palavra grega traduzida por “todo/ toda” três vezes anteriormente na passagem. 6 Quanto à expressão “estou convoco”, comp. com Gn 26.3,24; 28.14-21; Êx 3.12; Dt 31.8,23; Js 1.5; Jz 6.16. Quando Deus diz a Isaque, Jacó, Moisés, Josué e Gideão: “Serei contigo”, é no contexto de uma missão quase impossível. Os construtores do templo de Salomão e depois os que trabalharam com Ageu foram instruídos a estar atentos à presença de Deus com eles (1Rs 11.38 e Ag 1.13; 2.4). Visto que Deus anuncia que ele mesmo será a principal fonte de poder, enquanto cada um deles cumpre sua respectiva missão, é como se o próprio Deus estivesse dizendo: “Estareis comigo”. Nessas passagens, e muito pro- vavelmente em Mateus 18.20, a questão não é a segurança ou o consolo na solidão, e sim a liderança capacitadora de Deus.$conteudo$, 18);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 19) then
    update aulas set titulo = $t$Lição 3 · Leitura — Hawthorne: A Grande Comissão e o Grande Mandamento$t$, conteudo = $conteudo$A Grande Comissão e o Grande

Mandamento

Steven Hawthorne

A "Grande Comissão" de Mateus 28 tem sido encarada como uma contrapartida, ou complemento, ao chamado "Grande Mandamento", no qual Jesus aponta o mais importante de todos os mandamentos das Escrituras. Nessa conhecida passagem (Mateus 22:25-37 com relatos paralelos em Marcos 12:28-34 e Lucas 10:25-37), Jesus afirma que o maior de todos os mandamentos bíblicos é amar a Deus e amar ao próximo.

Muitas vozes importantes no meio evangélico têm colocado esses dois imperativos lado a lado como uma maneira de expressar a plena responsabilidade dos cristãos no mundo.

Como o Grande Mandamento está relacionado com a Grande Comissão? Eles são frequentemente apresentados como iguais equilibrados, correspondendo a diferentes dimensões da necessidade humana. A Grande Comissão enfocaria os assuntos espirituais enquanto o Grande Mandamento se dirigiria às questões físicas e sociais. No entanto, quando são defendidos lado a lado em resposta à necessidade humana, pode haver confusão no esforço de integrar essas ordens como a missão cristã.

Diferentes: Realização Histórica e Imperativo Constante

Podemos entender melhor como as duas ordens trabalham em conjunto se respeitarmos suas diferenças. Igualá-las, porém, pode levar ao fracasso do pleno cumprimento de ambas.

Amar a Deus e ao próximo com devoção e serviço não é uma tarefa que possamos finalizar completamente um dia. O amor é algo que só cresce com o passar do tempo e deve ser uma busca contínua. A Grande Comissão, por sua vez, é uma realização histórica, global, e uma tarefa a ser completada. Apesar da compreensão popular ser o oposto, a Grande Comissão não se trata de um mandamento para evangelizarmos tão frequentemente quanto possível. Ela é, na verdade, um mandato para todos os seguidores de Jesus que exige o trabalho de muitas gerações para o cumprimento dessa obra que será encerrada no final da história

O Mesmo Foco: Os Dois Imperativos são para Deus

Tentar equilibrar ou comparar o Grande Mandamento com a Grande Comissão pode obscurecer o objetivo de ambos. Nenhum deles tem como alvo fundamental a necessidade humana, seja ela espiritual ou de outra natureza. O fim primário de ambos é a realidade relacional dirigida a Deus. Embora a gente preste mais atenção ao aspecto do "amor ao próximo" no Grande Mandamento, o ponto principal das palavras de Jesus é que Deus deve ser amado de todo o coração, alma, mente e com todas as forças. O resultado essencial da Grande Comissão é igualmente em função de Deus: que Ele seja servido por discípulos obedientes em cada povo.

A questão não é apenas amar a Deus, mas trabalhar para que Ele seja amado. A maneira mais sublime de amar ao nosso Senhor é certificar que Ele seja adorado, seguido e amado em todos os povos. Além disso, nos foi dado algo muito melhor do que a mera oportunidade de estender nosso amor ao próximo. Temos a ordem de transformar comunidades inteiras pela multiplicação daqueles que amam uns aos outros como Cristo mandou.

Como Eles Trabalham Juntos?

Nenhum desses mandamentos pode ser priorizado em detrimento do outro. E, na verdade, um não pode acontecer sem o outro. Não podemos evangelizar os povos sem amarmos as pessoas profundamente. Da mesma forma, não podemos considerar nossa evangelização completa a menos que as pessoas estejam crescendo em amor por Deus e amando o próximo em obediência a Ele$conteudo$
     where curso_id = v_curso and ordem = 19;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Hawthorne: A Grande Comissão e o Grande Mandamento$t$, $conteudo$A Grande Comissão e o Grande

Mandamento

Steven Hawthorne

A "Grande Comissão" de Mateus 28 tem sido encarada como uma contrapartida, ou complemento, ao chamado "Grande Mandamento", no qual Jesus aponta o mais importante de todos os mandamentos das Escrituras. Nessa conhecida passagem (Mateus 22:25-37 com relatos paralelos em Marcos 12:28-34 e Lucas 10:25-37), Jesus afirma que o maior de todos os mandamentos bíblicos é amar a Deus e amar ao próximo.

Muitas vozes importantes no meio evangélico têm colocado esses dois imperativos lado a lado como uma maneira de expressar a plena responsabilidade dos cristãos no mundo.

Como o Grande Mandamento está relacionado com a Grande Comissão? Eles são frequentemente apresentados como iguais equilibrados, correspondendo a diferentes dimensões da necessidade humana. A Grande Comissão enfocaria os assuntos espirituais enquanto o Grande Mandamento se dirigiria às questões físicas e sociais. No entanto, quando são defendidos lado a lado em resposta à necessidade humana, pode haver confusão no esforço de integrar essas ordens como a missão cristã.

Diferentes: Realização Histórica e Imperativo Constante

Podemos entender melhor como as duas ordens trabalham em conjunto se respeitarmos suas diferenças. Igualá-las, porém, pode levar ao fracasso do pleno cumprimento de ambas.

Amar a Deus e ao próximo com devoção e serviço não é uma tarefa que possamos finalizar completamente um dia. O amor é algo que só cresce com o passar do tempo e deve ser uma busca contínua. A Grande Comissão, por sua vez, é uma realização histórica, global, e uma tarefa a ser completada. Apesar da compreensão popular ser o oposto, a Grande Comissão não se trata de um mandamento para evangelizarmos tão frequentemente quanto possível. Ela é, na verdade, um mandato para todos os seguidores de Jesus que exige o trabalho de muitas gerações para o cumprimento dessa obra que será encerrada no final da história

O Mesmo Foco: Os Dois Imperativos são para Deus

Tentar equilibrar ou comparar o Grande Mandamento com a Grande Comissão pode obscurecer o objetivo de ambos. Nenhum deles tem como alvo fundamental a necessidade humana, seja ela espiritual ou de outra natureza. O fim primário de ambos é a realidade relacional dirigida a Deus. Embora a gente preste mais atenção ao aspecto do "amor ao próximo" no Grande Mandamento, o ponto principal das palavras de Jesus é que Deus deve ser amado de todo o coração, alma, mente e com todas as forças. O resultado essencial da Grande Comissão é igualmente em função de Deus: que Ele seja servido por discípulos obedientes em cada povo.

A questão não é apenas amar a Deus, mas trabalhar para que Ele seja amado. A maneira mais sublime de amar ao nosso Senhor é certificar que Ele seja adorado, seguido e amado em todos os povos. Além disso, nos foi dado algo muito melhor do que a mera oportunidade de estender nosso amor ao próximo. Temos a ordem de transformar comunidades inteiras pela multiplicação daqueles que amam uns aos outros como Cristo mandou.

Como Eles Trabalham Juntos?

Nenhum desses mandamentos pode ser priorizado em detrimento do outro. E, na verdade, um não pode acontecer sem o outro. Não podemos evangelizar os povos sem amarmos as pessoas profundamente. Da mesma forma, não podemos considerar nossa evangelização completa a menos que as pessoas estejam crescendo em amor por Deus e amando o próximo em obediência a Ele$conteudo$, 19);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 20) then
    update aulas set titulo = $t$Lição 3 · Leitura — Newbigin, cap. 14: O Reino de Deus na realidade do mundo$t$, conteudo = $conteudo$O Reino de Deus na

realidade do mundo

Lesslie Newbigin

uando Jesus, após a ressurreição, disse aos apóstolos: “Assim como o Pai me enviou, eu também vos envio”, e lhes mostrou

Contudo, a implantação do reinado de Deus não aconteceu elmente a justiça de Deus. O meio pelo qual acondesarmados, porém não foram

Aceitar esse envio, essa missão definida pelas cicatrizes da cação significa necessariamente que a Igreja missionária m dessa estrada, a

A menos que seja reconhecida essa essência radical de “outro não é produto final a ambos terminará em frustração e desilusão. Isso pode ser evidenciado com facilidade (e talvez cruamente) nas bem-aventuranças. Porque são considerados felizes os pobres, oprimidos, perseguidos, famintos e mansos? Pelo simples fato de que esses, na nova era, é que serão ricos, livres e alegres. A maior parte deles será pobre e faminta, oprimida e sofredora por toda a sua vida terrena. Eles são felizes porque algo infinitamente bom lhes está prometido no novo mundo. “No céu, tudo será maravilhoso”: esse ensinamento não faz muito sucesso. Alguns talvez até considerassem tal esperança melhor que as maravilhas que aproveitariam seus bisnetos, se sobrevivessem a uma revolução e pertencessem ao partido certo. Contudo, a questão é que a essência do ensinamento de Jesus claramente implicava essa ênfase no “outro mundo”.

Qual seria então a relação desse ensinamento com a missão da Igreja no mundo? Não o quietismo. Não a submissão passiva ao domínio da injustiça, da ganância e da hipocrisia. O ministério terreno de Jesus proporciona refutação suficiente a essa conclusão. Ou deveria ser suficiente, pois temos de confessar que a Igreja quase sempre optou pelo quietismo nos tempos em que o governo esteve nas mãos de homens da própria Igreja. Jesus, conforme narrado pelo apóstolo João, foi manifestado a fim de destruir as obras do Diabo, não para se sujeitar a elas. Todo o seu ministério é retratado nos evangelhos como um poderoso golpe nas obras do Maligno — na forma de enfermidades e possessões demoníacas entre o povo, na hipocrisia, na crueldade e na dureza de coração entre os governantes. Todo o seu ministério é visto como uma inserção, por parte do reinado de Deus, na realidade do mundo, a fim de libertar os que Satanás aprisionou. Citando o título de um livro famoso, ele ensinava uma “fé em revolução”. Nenhum dos enfermos que foram levados a Jesus recebeu como resposta que deveria aceitar a doença como vontade de Deus. Jesus era sempre compelido a agir — compelido, aparentemente, tanto por compaixão quanto pela ira, por haver Satanás oprimido tão severamente os filhos de Deus.

Até o último instante, sua mão esteve estendida para curar. Mesmo na cruz, ele pronunciou uma palavra libertação a um assassino moribundo. Ainda assim, como disse o observador zombeteiro, aquele que salvou os outros não podia, ou não queria, salvar a si mesmo. No final — apenas no final —, emitiu um clamor que expressa sujeição: “Pai, nas tuas mãos entrego o meu espírito!”. A vinda do Reino está nas mãos do Pai, do outro lado da morte e da derrota. O ministério terreno de Jesus não foi o lançamento de um projeto que gradativamente transformará o mundo no Reino de Deus. Antes, foi uma demonstração, dentro dos confinamentos da presente era, da realidade que constituirá a era por vir — a realidade do reinado de Deus.

Desse modo, quando Jesus, após a ressurreição, disse aos apóstolos: “Assim como o Pai me enviou, eu também vos envio”, e lhes mostrou as mãos e o lado, ele estava ordenando que levassem adiante o que ele viera fazer: incorporar e anunciar a realidade da nova era do reinado de Deus em justiça e misericórdia, dentro dos limites da presente era, sujeita como está ao pecado e à morte. Com a ordem, veio a capacitação do Espírito Santo para que, pelo mesmo Espírito, cuja unção possibilitou a Jesus realizar obras de cura e de libertação, a Igreja igualmente recebesse poder. Contudo, o resultado não será um plano bem-sucedido de transformação gradativa do mundo atual naquele mundo novo. Jesus “lhes mostrou as mãos e o lado”. A intervenção na História pelo poder soberano de Deus de fato produzirá acontecimentos que desafiarão os poderes que oprimem e desumanizam, e irá desmascarar as pretensões dos principados e potestades. Ainda assim, o símbolo principal do Reino na realidade deste mundo é a cruz — a cruz daquele que, na ressurreição, foi manifestado como Senhor sobre todos os poderes, até mesmo sobre o poder da morte.

[cite] LESSLIE NEWBIGIN foi teólogo, missionário, pastor, apologista e estadista britânico esti mado internacionalmente. Depois de exercer durante anos o ministério de evangelista numa aldeia da Índia, voltou à Inglaterra para trabalhar como professor universitário e pastor. Entre seus muitos livros estão: The Open Secret [O segredo aberto] e The Gospel in a Pluralist Society [O evangelho numa sociedade pluralista]. Extraído de Signs Amid the Rubble: The Purposes of God in Human History [Sinais entre os escombros: os propósitos de Deus na história humana] (Grand Rapids, Eerdmans: 2003). Usado com permissão. Q as mãos e o lado, ele estava relacionando a missão à qual os enviava com o caminho da cruz (Jo 20.19-23). Esse caminho era, de certa forma, o caminho de protesto geral contra os poderes estabeleci- dos. Anunciar a iminência do Reino, anunciar que o justo reinado de Deus está prestes a se estabelecer no mundo implica, necessa- riamente, entrar em rota de colisão com os poderes dominantes da presente época. por meio de manobras políticas bem-sucedidas, capazes de remo- ver os poderes dominadores e substituí-los por governantes que executem fiteceu foi por uma derrota humilhante, ainda que, no momento da ressurreição, essa derrota se revelasse a algumas testemunhas escolhidas como a vitória decisiva do Reino de Deus. Ele reina de sobre o madeiro. Assim, como diz o apóstolo, os principados e potestades foram desmascarados, e suas pretensões a sabedoria foram desmascaradas. Eles foram destruídos. Eles ainda existem e têm uma função, a qual exer- cem por autorização e, portanto, é limitada pela justiça de Deus manifesta em Jesus. crucificontinuará esse protesto, desmascarando a hipocrisia, a cruel- dade e a ganância que contaminam o exercício de todo poder político. Ela ainda aceitará o fato de que o fiolhos vistos, é a cruz, e que somente além da cruz, de todos os programas terrenos e da morte, a vitória da justiça de Deus será manifestada. mundo” que caracteriza o evangelho, o verdadeiro papel da igreja na política estará absolutamente comprometido. Em vez de um movimento radical de protesto, sofrimento e esperança, have- rá apenas uma utopia ineficaz e ingênua. O reinado de Deus, que é o tema da mensagem do evangelho, de desenvolvimento político, e qualquer tentativa de mesclar$conteudo$
     where curso_id = v_curso and ordem = 20;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Newbigin, cap. 14: O Reino de Deus na realidade do mundo$t$, $conteudo$O Reino de Deus na

realidade do mundo

Lesslie Newbigin

uando Jesus, após a ressurreição, disse aos apóstolos: “Assim como o Pai me enviou, eu também vos envio”, e lhes mostrou

Contudo, a implantação do reinado de Deus não aconteceu elmente a justiça de Deus. O meio pelo qual acondesarmados, porém não foram

Aceitar esse envio, essa missão definida pelas cicatrizes da cação significa necessariamente que a Igreja missionária m dessa estrada, a

A menos que seja reconhecida essa essência radical de “outro não é produto final a ambos terminará em frustração e desilusão. Isso pode ser evidenciado com facilidade (e talvez cruamente) nas bem-aventuranças. Porque são considerados felizes os pobres, oprimidos, perseguidos, famintos e mansos? Pelo simples fato de que esses, na nova era, é que serão ricos, livres e alegres. A maior parte deles será pobre e faminta, oprimida e sofredora por toda a sua vida terrena. Eles são felizes porque algo infinitamente bom lhes está prometido no novo mundo. “No céu, tudo será maravilhoso”: esse ensinamento não faz muito sucesso. Alguns talvez até considerassem tal esperança melhor que as maravilhas que aproveitariam seus bisnetos, se sobrevivessem a uma revolução e pertencessem ao partido certo. Contudo, a questão é que a essência do ensinamento de Jesus claramente implicava essa ênfase no “outro mundo”.

Qual seria então a relação desse ensinamento com a missão da Igreja no mundo? Não o quietismo. Não a submissão passiva ao domínio da injustiça, da ganância e da hipocrisia. O ministério terreno de Jesus proporciona refutação suficiente a essa conclusão. Ou deveria ser suficiente, pois temos de confessar que a Igreja quase sempre optou pelo quietismo nos tempos em que o governo esteve nas mãos de homens da própria Igreja. Jesus, conforme narrado pelo apóstolo João, foi manifestado a fim de destruir as obras do Diabo, não para se sujeitar a elas. Todo o seu ministério é retratado nos evangelhos como um poderoso golpe nas obras do Maligno — na forma de enfermidades e possessões demoníacas entre o povo, na hipocrisia, na crueldade e na dureza de coração entre os governantes. Todo o seu ministério é visto como uma inserção, por parte do reinado de Deus, na realidade do mundo, a fim de libertar os que Satanás aprisionou. Citando o título de um livro famoso, ele ensinava uma “fé em revolução”. Nenhum dos enfermos que foram levados a Jesus recebeu como resposta que deveria aceitar a doença como vontade de Deus. Jesus era sempre compelido a agir — compelido, aparentemente, tanto por compaixão quanto pela ira, por haver Satanás oprimido tão severamente os filhos de Deus.

Até o último instante, sua mão esteve estendida para curar. Mesmo na cruz, ele pronunciou uma palavra libertação a um assassino moribundo. Ainda assim, como disse o observador zombeteiro, aquele que salvou os outros não podia, ou não queria, salvar a si mesmo. No final — apenas no final —, emitiu um clamor que expressa sujeição: “Pai, nas tuas mãos entrego o meu espírito!”. A vinda do Reino está nas mãos do Pai, do outro lado da morte e da derrota. O ministério terreno de Jesus não foi o lançamento de um projeto que gradativamente transformará o mundo no Reino de Deus. Antes, foi uma demonstração, dentro dos confinamentos da presente era, da realidade que constituirá a era por vir — a realidade do reinado de Deus.

Desse modo, quando Jesus, após a ressurreição, disse aos apóstolos: “Assim como o Pai me enviou, eu também vos envio”, e lhes mostrou as mãos e o lado, ele estava ordenando que levassem adiante o que ele viera fazer: incorporar e anunciar a realidade da nova era do reinado de Deus em justiça e misericórdia, dentro dos limites da presente era, sujeita como está ao pecado e à morte. Com a ordem, veio a capacitação do Espírito Santo para que, pelo mesmo Espírito, cuja unção possibilitou a Jesus realizar obras de cura e de libertação, a Igreja igualmente recebesse poder. Contudo, o resultado não será um plano bem-sucedido de transformação gradativa do mundo atual naquele mundo novo. Jesus “lhes mostrou as mãos e o lado”. A intervenção na História pelo poder soberano de Deus de fato produzirá acontecimentos que desafiarão os poderes que oprimem e desumanizam, e irá desmascarar as pretensões dos principados e potestades. Ainda assim, o símbolo principal do Reino na realidade deste mundo é a cruz — a cruz daquele que, na ressurreição, foi manifestado como Senhor sobre todos os poderes, até mesmo sobre o poder da morte.

[cite] LESSLIE NEWBIGIN foi teólogo, missionário, pastor, apologista e estadista britânico esti mado internacionalmente. Depois de exercer durante anos o ministério de evangelista numa aldeia da Índia, voltou à Inglaterra para trabalhar como professor universitário e pastor. Entre seus muitos livros estão: The Open Secret [O segredo aberto] e The Gospel in a Pluralist Society [O evangelho numa sociedade pluralista]. Extraído de Signs Amid the Rubble: The Purposes of God in Human History [Sinais entre os escombros: os propósitos de Deus na história humana] (Grand Rapids, Eerdmans: 2003). Usado com permissão. Q as mãos e o lado, ele estava relacionando a missão à qual os enviava com o caminho da cruz (Jo 20.19-23). Esse caminho era, de certa forma, o caminho de protesto geral contra os poderes estabeleci- dos. Anunciar a iminência do Reino, anunciar que o justo reinado de Deus está prestes a se estabelecer no mundo implica, necessa- riamente, entrar em rota de colisão com os poderes dominantes da presente época. por meio de manobras políticas bem-sucedidas, capazes de remo- ver os poderes dominadores e substituí-los por governantes que executem fiteceu foi por uma derrota humilhante, ainda que, no momento da ressurreição, essa derrota se revelasse a algumas testemunhas escolhidas como a vitória decisiva do Reino de Deus. Ele reina de sobre o madeiro. Assim, como diz o apóstolo, os principados e potestades foram desmascarados, e suas pretensões a sabedoria foram desmascaradas. Eles foram destruídos. Eles ainda existem e têm uma função, a qual exer- cem por autorização e, portanto, é limitada pela justiça de Deus manifesta em Jesus. crucificontinuará esse protesto, desmascarando a hipocrisia, a cruel- dade e a ganância que contaminam o exercício de todo poder político. Ela ainda aceitará o fato de que o fiolhos vistos, é a cruz, e que somente além da cruz, de todos os programas terrenos e da morte, a vitória da justiça de Deus será manifestada. mundo” que caracteriza o evangelho, o verdadeiro papel da igreja na política estará absolutamente comprometido. Em vez de um movimento radical de protesto, sofrimento e esperança, have- rá apenas uma utopia ineficaz e ingênua. O reinado de Deus, que é o tema da mensagem do evangelho, de desenvolvimento político, e qualquer tentativa de mesclar$conteudo$, 20);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 21) then
    update aulas set titulo = $t$Lição 3 · Leitura — Bradford, cap. 10: Ministério radical em um mundo polarizado$t$, conteudo = $conteudo$Ministério radical em um

mundo polarizado

Kevin D. Bradford

eus tinha um único Filho e fez dele um missionário”, diz a conhecida expressão popular. Outros contestam essa

Para começar a respondê-la, será de grande ajuda observar que

A Palestina do primeiro século era extremamente polarizada.

O surgimento do povo samaritano deu-se em 722 a.C., quan-

Por fim, os gentios, representados principalmente pelos roma-

Santa

ti na do primeiro século

cos.

Os judeus e os samaritanos

Desde os primórdios, os judeus basicamente consideravam os samaritanos idólatras e inimigos (v. 2Rs 17.34,41). Sambalate, governador de Samaria, esteve entre os que fizeram oposição a Neemias e à construção do muro de Jerusalém (Ne 2.10; 4.1,2).

No ressurgimento judaico, o período macabeu, João Hircano destruiu o templo samaritano que fora erigido para competir com o de Jerusalém (c. 128 a.C). Por sua vez, os samaritanos tentaram violar o templo de Jerusalém. Dizia-se também que os samaritanos importunavam os viajantes judeus a caminho de Jerusalém. A literatura intertestamentária judaica faz referência ao “povo louco” de Samaria (v. Eclesiástico 50.28; Testamento de Levi).

Na época de Jesus, apesar dos laços históricos e religiosos em comum, os judeus não consideravam os samaritanos melhores que um estrangeiro (Lc 17.18). O comentário do apóstolo João de que “os judeus não se dão com os samaritanos” (Jo 4.9), provavelmente era uma declaração suavizada do que acontecia na realidade.

Os judeus e os romanos

O relacionamento entre judeus e romanos dificilmente poderia ser considerado melhor que com os samaritanos. Parte da dificuldade achava-se na interpretação das leis cerimoniais do Antigo Testamento, que predominava na época.

Desde a conquista de Jerusalém pelos babilônios, em 586 a.C, e o subsequente cativeiro, a nação foi motivada a abandonar a idolatria, e surgiram inúmeras tradições com o propósito de impedir a contaminação do povo. Infelizmente, as tradições também acabaram por impedir os judeus de manter a convivência normal com os gentios. Edersheim conclui que os gentios “deveriam, tanto quanto possível, ser evitados, exceto em casos de necessidade ou por motivo de negócios. Eles e tudo que era deles eram impuros. Suas casas eram imundas, porque continham ídolos ou coisas dedicadas a eles. Suas celebrações e ocasiões festivas e quaisquer de seus contatos eram manchados pela idolatria. Também não era seguro deixar um pagão a sós num cômodo, pois ele poderia, quer por malícia, quer por descuido, profanar o vinho ou a carne sobre a mesa, ou o óleo e trigo no estoque”.

Esse tipo de atitude era incentivado pelos líderes religiosos judeus, principalmente pelos fariseus e sacerdotes:

O sacerdote classificava os caminhos afastados do mundo do outro lado do Templo primeiramente como menos santos, depois como profanos, posteriormente como impuros [...] Todos os povos, exceto Israel, eram, por natureza, impuros como os cadáveres.

Do outro lado dessa situação crítica estão os romanos e a forma de tratamento por eles dispensada à Palestina. O general Pompeu prefigurou a atitude romana em voga nos tempos de Cristo. Além de capturar a área do Templo, ele insistiu em entrar no Santo dos Santos, área explicitamente vedada a todos exceto ao sumo sacerdote, e somente no dia da Expiação.

Após um breve período de autonomia sob o governo de Julio César, Herodes, o Grande, auxiliado pelas tropas romanas, comandou um novo cerco a Jerusalém, o qual durou três meses (37 a.C). A administração implacável imposta por Herodes ao reino judeu foi muito bem documentada, inclusive com um breve relato nos registros bíblicos (v. Mt 2.1-16).

Os problemas se intensificaram quando, em 6 a.D., a Judeia foi reorganizada como província romana e perdeu grande parte de sua independência. O recenseamento vinculado a essa reorganização resultou numa rebelião liderada por Judas (At 5.37). Grato (15-26), antecessor de Pôncio Pilatos no posto de governador da Judeia, destituiu quatro sumo sacerdotes e indicou outros quatro. Muito provavelmente foi esse um dos meios pelos quais o governador aumentou sua fortuna.

O próprio Pilatos, aproveitando a escuridão da noite, colocou o estandarte imperial em Jerusalém, apesar da orientação recebida e da objeção dos judeus acerca da exibição de imagens. Quando os judeus descobriram o fato, ameaçaram deflagrar tal revolta por toda a província que nem mesmo a ameaça de um massacre poderia detê-los.

O total da carga de impostos (sacerdotais e romanos) sobre os judeus na época de Jesus chegava à casa dos 30% ou 40%. O pagamento dos impostos aos romanos era visto, de modo geral, como um roubo organizado ou algo próximo disso. Entretanto, após a construção de um aqueduto para aumentar o suprimento de água da cidade, Pilatos dilapidou os tesouros do templo, alegando pagamento pelos serviços, o que causou enorme revolta (v. Lc 13.1). Em razão dos precedentes históricos e das constantes dificuldades, os romanos precisavam colocar tropas extras em Jerusalém durante as grandes festas, para evitar possíveis tumultos. O período no qual Jesus iniciou o seu ministério era realmente tenso.

O ensino e o exemplo de Jesus

Apesar do mundo polarizado no qual vivia, Jesus foi radical e enfático em sua mensagem: o Reino de Deus é para todos os povos.

O início do ministério público de Jesus caracterizou-se pela ênfase nesse tema. Em suas pregações na Galileia, ele fez uma referência favorável ao ministério de Elias para com a viúva de Sarepta, bem como à bênção oferecida a Naamã, o siro (Lc 4.25-27; v. 1Rs 17.8-24; 2Rs 5.1-14). Não é de se estranhar que a simples menção desses contatos transculturais tenha sido a razão de Jesus ter sido expulso da cidade. O ensino coerente de Jesus apontava a possibilidade de gentios e samaritanos serem parceiros equivalentes aos judeus em questões de fé.

A prática de Jesus reforçava seu ensino. Em pelo menos seis episódios de seu ministério, três com samaritanos e três com gentios, essa abertura de possibilidades a eles foi realçada.

O contato com os samaritanos

1) As declarações de Jesus à mulher samaritana no poço ( Jo 4.1-42) indicam, no mínimo, um desejo de interação pessoal. Se Jesus apenas desejasse descansar e beber alguma coisa, é de duvidar que tivesse provocado o interesse da mulher com uma declaração tão enigmática após seu pedido inicial ( Jo 4.10). Em sua abordagem, ele rapidamente a conduziu de um tema superficial a uma reflexão de seu estado moral e de suas práticas religiosas, demonstrando, de modo inequívoco, seu interesse na samaritana como pessoa.

À parte de sua capacidade profética, enquanto conversava, Jesus demonstrou sabedoria, principalmente por sua notável sensibilidade para com as necessidades de uma mulher que tinha tudo para estar amargurada. Pode-se notar sua disposição em tratar as questões delicadas que considerava importantes (por exemplo, a fonte de salvação e o modo de adorar a Deus), bem como, a capacidade de ignorar questões potencialmente polêmicas, porém secundárias, como o lugar correto da adoração. Além disso, o texto sugere que o sentido de propósito de Jesus (v. Jo 4.34-36) foi sua motivação durante toda a conversa.

2) Em outra ocasião, Jesus não interagiu diretamente com os samaritanos. Contudo, sua reação à hostilidade deles (Lc 9.53) é muito instrutiva. Embora Tiago e João (e muito provavelmente os outros discípulos) se mostrassem favoráveis a um julgamento imediato e impetuoso (v. 54; v. Mc 3.17), a resposta de Jesus foi surpreendente. Ele não repreendeu os samaritanos por sua falta de hospitalidade, e sim, aos seus mal orientados discípulos (Lc 9.55,56). Demonstrando extraordinária humildade, Jesus levou-os a outro povoado, provavelmente samaritano. De modo sugestivo, no capítulo seguinte, Lucas registra a parábola de Jesus sobre o bom samaritano (Lc 10.30-37). Jesus não apenas enfrentou a rejeição transcultural, como também, mais tarde foi capaz de reagir a ela de forma generosa.

3) Em outro episódio, quando viajava da Galileia para Jerusalém, Jesus curou dez leprosos (Lc 17.11-19). O fato de apenas o leproso samaritano ter voltado para agradecer (v. 16) expõe universalidade da graça de Deus. O exercício poderoso da fé (v. 19) não estava de maneira alguma limitado a uma única cultura.

O contato com os genti os

Apesar de o distanciamento cultural ser ainda maior, Jesus também ministrou aos gentios.

4) Quando o centurião romano mandou chamá-lo e lhe contou sobre o servo doente, Jesus pôs-se a caminho e, ao que parece, teria entrado em sua casa (Mt 8.5-13; v. Lc 7.1-10). Pedro, refletindo a típica atitude judaica, posteriormente declara que esse tipo de conduta era contrário à lei (At 10.28; v. 11.2,3). Jesus, porém, não se intimidava. Seu interesse primordial estava na pessoa necessitada de ajuda, sem importar o contexto cultural. O fato de os líderes religiosos apresentarem os méritos do homem (Lc 7.4,5), aparentemente não teve muita importância para ele.

5) De modo semelhante, é fato que, quando solicitado pela mulher cananeia (Mt 15.21-28; Mc 7.24-30), Jesus não atendeu prontamente ao seu pedido. Contudo, Jesus terminou por reconhecer sua humildade e fé e lhe concedeu o que desejava, apesar da resistência por parte de seus discípulos (Mt 15.23). Ao contrário do encontro com o centurião, Jesus não fez menção de ir à casa da mulher, todavia, rompeu com o costume da época ao estender suas bênçãos a representantes de outra cultura.

6) Finalmente, sabemos que Filipe e André trouxeram os “gregos” até Jesus (Jo 12.20-22). Não temos maiores informações sobre o contexto cultural desses homens, nem mesmo sabemos como Jesus os influenciou. Contudo, a localização desse episódio exclusivo da narrativa de João pouco antes do encontro no cenáculo (Jo 13—16) demonstra sua importância. Esse fato parece implicar o reconhecimento de que o ministério de Jesus alcançara seu ápice ( Jo 12.23,27; 13.1; v. 2.4; 7.6,8,30; 8.20). Poucos dias depois, uma missão cuja abrangência chegaria a todos os povos haveria de ser revelada (v. Jo 12.19,32).

Alargando as fronteiras

É bem provável que o contato de Jesus com os samaritanos tenha sido maior que com os gentios.

Muitos peregrinos judeus, ao viajar da Galileia para Jerusalém, preferiam contornar a cidade de Samaria a atravessá-la, a fim de evitar o contato com essa cultura, embora essa medida tornasse a viagem mais longa. Jesus, porém, pelo menos em três ocasiões preferiu atravessar Samaria (v. Jo 4.3,4; Lc 9.51,52; 17.11). A interação com os gentios pode se tornar um fator de impedimento a que Jesus testemunhasse mais efetivamente para a maioria dos judeus. No entanto, por mais desprezível que fosse tal atitude aos olhos dos judeus, o contato com os samaritanos não tornava Jesus “impuro”. Da mesma forma que os judeus, os samaritanos respeitavam o rito da circuncisão, a guarda do sábado e as leis dietéticas. Talvez isso explique a iniciativa de Jesus em conversar com a mulher no poço ( Jo 4.7) e os dois dias a mais de permanência na cidade de Sicar ( Jo 4.40). Outro fator que pode ter encorajado o encontro foi a sugestão/ acusação feita por seus inimigos de que ele próprio era samaritano ( Jo 8.48).

Jesus, entretanto, costumava colocar a si e aos seus discípulos em situações nas quais o contato com os gentios era inevitável. Ele cresceu na Galileia, também conhecida como “Galileia dos gentios” (v. Mt 4.15). Embora fosse de esperar que um rabino judeu se mudasse para Jerusalém, foi na Galileia que ele não apenas passou a maior parte de seu tempo, como também recrutou a maioria dos discípulos.

Jesus foi criado na tranquila cidade rural de Nazaré. Mais tarde, porém, escolheu Cafarnaum como sua “base de operações”, fato muito curioso, principalmente porque Cafarnaum era uma cidade costeira, o último vestígio significativo da cultura judaica antes de se chegar a Traconites (v. Lc 3.1) e à Síria. Isso hoje equivale a alguém que afirma pretender alcançar todo o Brasil estabelecendo residência em Foz do Iguaçu!

Jesus também atravessou o mar da Galileia até Decápolis pelo menos duas vezes. Em cada uma delas realizou grandes milagres: expulsou o demônio de um homem possesso (v. Mt 8.28-34; Mc 5.1-20; Lc 8.26-37) e curou um surdomudo (v. Mc 7.31-37). A região de Decápolis (literalmente “dez cidades”, em grego) era influenciada pelas culturas grega e romana. Ambos os impérios fixaram muitos de seus soldados reformados nessas cidades fronteiriças, com o propósito de defender suas possessões. Também foi ali que Herodes, o Grande, construiu inúmeros templos pagãos.

Houve ainda outras ocasiões nas quais Jesus levou seus discípulos consigo para além dos limites da Palestina. Passando pela região além do Jordão (Mt 19.1; Mc 10.1; Jo 10.40-42), eles seguiram para Tiro e Sidom, isto é, o Líbano (Mt 15.21; Mc 7.24), e depois para Cesareia de Filipe, isto é, a Síria (Mt 16.13; Mc 8.27).

O episódio da confissão de Pedro acerca de Cristo deu-se em Cesareia de Felipe, e é extremamente significativo. Nisso se observa a ênfase na disponibilidade do evangelho para todos, pelo fato de ter ocorrido, dentre todas as viagens do ministério de Jesus, no local mais distante de Jerusalém. Apesar de não termos muitas informações sobre o ministério de Jesus nessas regiões, os eventos registrados parecem ter sido frequentes ou positivos o bastante para levantar a suspeita de que Jesus poderia considerar ir além dos limites da Palestina para ministrar aos gregos da Dispersão ( Jo 7.35).

Por que concentrar-se nos judeus?

À luz das tensões antes descritas, talvez não se possa considerar estranha a orientação dada por Cristo aos seus discípulos: “Não tomeis rumo aos gentios, nem entreis em cidade de samaritanos” (Mt 10.5). Pouco tempo depois, quando abordado pela mulher siro-fenícia, ele respondeu ter sido enviado apenas “às ovelhas perdidas da casa de Israel” (Mt 15.24). Jesus estava consciente das limitações culturais de seu público principal: os judeus. É certo que, pelo menos durante a primeira parte de seu ministério, ele concedeu muitas oportunidades aos judeus para que correspondessem à sua mensagem antes que o aspecto multicultural de seu ministério se tornasse comprovadamente uma barreira. Se ele tivesse ministrado com mais frequência e mais estritamente aos romanos (ou mesmo aos samaritanos), os judeus provavelmente teriam se afastado dele muito tempo antes.

Um ponto primordial para o ministério de qualquer obreiro deveria ser o exercício do discernimento no que tange ao seu público-alvo. Ter uma abordagem contextualizada do ministério ajudará a evitar escândalos desnecessários, bem como facilitará o alcance de um número maior de pessoas. Ele deve manter-se fiel à mensagem básica, no entanto, a boa comunicação começa por se chegar até onde o povo está. Seu campo de experiência determinará o que é compreendido e até mesmo o que é ouvido.

Na linguagem de hoje, podemos observar que muitas vezes o cristianismo é visto pelos muçulmanos (e por outros grupos) como uma religião ocidental, o que a torna indigna. Eles fecham os ouvidos para a mensagem de estrangeiros antes mesmo de ouvir sobre o Messias nascido no Oriente Médio. O maior ou menor grau em que um missionário é capaz de remover essa barreira geralmente será o indicador de seu sucesso em alcançá-los.

Jesus também preparou seus discípulos passo a passo para um ministério mundial. A princípio, eles eram judeus comuns que apenas haviam começado a seguir Jesus. Seus preconceitos eram semelhantes aos dos judeus de sua época (v. Mt 15.23; Lc 9.54; Jo 4.27). Se eles tivessem sido enviados aos gentios nesse estágio inicial, dificilmente a vida deles confirmaria a mensagem que pregavam. Eles precisavam aprender mais de Jesus e testemunhar sua compaixão por todos, o que, por fim, os faria superar o preconceito étnico. É significativo o fato de os Setenta enviados mais tarde (Lc 10.1-16) não terem recebido restrição alguma. No período posterior à ressurreição, eles receberam o mandamento expresso de irem por todo o mundo (Mt 28.19; Mc 16.15; Lc 24.47; At 1.8).

Conclusão

Foi Jesus um missionário transcultural? A dúvida se instala quando observamos o escopo limitado das viagens de Jesus e sua atenção concentrada na ministração aos judeus. A resposta, entretanto, deverá ser um “sim”, se apenas notarmos sua aproximação contextualizada, frequente e sensível de pessoas cujas origens diferiam das suas. Ele chegou mesmo a confrontar os judeus com o fato de que a promessa de Deus era multicultural. Se a partir desse ponto Jesus tivesse recuado, não há dúvida de que a oposição dos fariseus e de outros líderes religiosos teria sido consideravelmente menor. Em vez disso, ele elogiou a fé dos estrangeiros (v. Mt 8.10; 15.28; Lc 7.9), enquanto condenou com veemência a falta de fé de seu povo (Mt 8.26; 11.20-24; 13.58; 14.31; 16.8; 17.20).

Deixando um pouco de lado a mensagem falada de Jesus, pode-se observar quão arrojada era sua mensagem não verbal. Ele não receava dar aos gentios e aos samaritanos uma chance de resposta, enquanto mantinha aberta a porta aos judeus. O ministério da encarnação exige proximidade física. Jesus manteve-se perto dos de fora. Ele era capaz de dialogar com líderes religiosos e até mesmo receber alguém importante como Nicodemos em sua casa. Ainda assim, fazia-se amigo dos marginalizados.

Esse princípio é ilustrado mais claramente quando observamos que Jesus alcançou os excluídos da sociedade. Ele não se absteve do contato com doentes (cegos, leprosos, coxos), possessos por demônios e imorais (por exemplo, prostitutas). Em muitas ocasiões, a própria iniciativa para o contato foi dele.

Dentre os “imorais”, é provável que os coletores de impostos fossem considerados os piores. Contudo, Jesus chamou Mateus para ser um dos Doze (Mt 9.9; Mc 2.15; Lc 5.27). Ele frequentou a casa dos coletores de impostos em diversas ocasiões (v. Mt 9.10; Mc 2.15,16; Lc 5.29; 19.1-10) e ganhou a reputação de ser “amigo de publicanos e pecadores” (Mt 11.19; Lc 7.34; 19.7). O fato de serem judeus representava um tópico que a maioria dos acusadores de Jesus gostava de discutir (v. Mt 9.11; 12.24; Mc 2.16; 3.22; Lc 5.30; 7.39; 11.15; 15.2; 19.7; Jo 8.4-6). Entretanto, não há dúvidas sobre a natureza radical do ministério de Jesus.

A compaixão de Jesus por todos o levou a confrontar muitos dos padrões sociais de seu tempo. Ele chamou a atenção para os grupos relegados ao esquecimento pela sociedade de sua época e os aproximou dela. Diante disso, somos forçados a nos perguntar sobre as pessoas socialmente discriminadas que estão ao nosso redor. É possível que nem mesmo percebamos que há pessoas diferentes de nós, que dirá sobre a nossa tentativa de ministrar a elas. Será que, de algum modo, esse tipo de pessoa se sentiria “entre amigos” caso chegasse a algumas de nossas igrejas?

A mensagem cristã sempre envolverá escândalo (v. 1Co 1.23,24). O ministro cristão deve evitar a contextualização com o propósito exclusivo de ser aceito. Entretanto, a contextualização com o propósito de ajudar os outros na compreensão da mensagem de Deus é necessária para o alcance generalizado do povo. É imprescindível ter discernimento e equilíbrio. Nossa busca pela contextualização poderá ser criticada por alguns, mas faremos bem em seguir o exemplo de Jesus. A crescente polarização do mundo em que vivemos apresentará muitas oportunidades para o exercício de um ministério radical em nossos dias.

C, D. A. Matthew. In: Gaebelein, F. E. (Org.).

Rapids: Zondervan, 1984, v. 8.

E, Alfred. The Life and Times of Jesus the Messiah

J, Joachim. Jerusalém no tempo de Jesus. São Paulo: Paulinas, 1983.

J, Flávio. História dos hebreus: obra completa. 8. ed. Rio de Janeiro: CPAD, 2004.

K, Craig S. The IVP Bible Background Commentary:

terVarsity, 1993.

L, Richard N. Acts. In: Gaebelein, F. E. (Org.).

Grand Rapids: Zondervan, 1981, v. 9.

M, Leon. The Gospel According to John. In:

Testament. Grand Rapids: Eerdmans, 1983

N, Jacob. Judaism in the Beginning of Christianity.

W, Christopher J. The Mission of God. Downers Grove: InterVarsity, 2006.

The Expositor’s Bible Commentary. Grand

. Grand Rapids: Eerdmans, 1971.

New Testament. Downers Grove: In-

The Expositor’s Bible Commentary.

New International Commentary on the New

Philadelphia: Fortress Press, 1984.

Perguntas para estudo

1.Qual teria sido o resultado mais provável entre os judeus se Jesus tivesse concentrado seu minis-

tério público inicial nos gentios? Qual teria sido o resultado mais provável entre os gentios?

2.Cite alguns dos grupos negligenciados pela Igreja ou “escondidos” no meio dela hoje em dia.

Bibliografia

B, F. F. New Testament History. Garden City: Doubleday, 1980.

_____. Book of Acts. In: New International Commentary on the New Testament. Grand Rapids:

Eerdmans, 1983.

[cite] 3 1 4 2 5 1 Craig S. Keener, The IVP Bible Background Commentary:New Testament, p. 215. 2 Os romanos inicialmente favoreciam os samaritanos da Judeia. Herodes, o Grande, fez de Samaria uma das maiores cidades da Palestina, lá construindo, entre outras coisas, um grande tempo pagão. Uma de suas esposas também era samari- tana, a mãe de Herodes Antipas. Depois de Herodes, o Grande, porém, a relação entre Roma e Samaria tornou-se cada vez mais hostil. Os governadores que vieram a seguir foram ineficazes. Pouco tempo depois de Cristo, no ano 36, Pilatos enviou um destacamento de soldados para atacar um grupo de viajantes samaritanos no monte sagrado de Gerizim, pro- vocando muitas mortes (Flávio Josefo, História dos hebreus, livro XVIII, cap. 5). 3 A questão da pureza racial também era importante entre os judeus, principalmente os de linhagem mais pura ( Joachim Jeremias, Jerusalém no tempo de Jesus). Os que estavam à margem da sociedade judaica tinham muito menor motivação para observar as regras sobre violação. 4 Alfred Edersheim, The Life and Times of Jesus the Messiah, livro I, p. 92. 5 Pelas mesmas razões, o povo de Jerusalém tendia a se distanciar dos galileus e até mesmo dos da província da Judeia. Os dois últimos grupos não se preocupavam com os rituais de purificação. A animosidade entre os moradores urbanos e rurais geralmente se era intensa ( Jacob Neusner, Judaism in the Beginning of Christianity, p. 24-5, 38). 9 10 11 6 12 7 13 8 6 F. F. Bruce, New Testament History, p. 34. 7 Flávio Josefo, op. cit., livro XVIII, cap. 4. 8 Apud F. F. Bruce, New Testament History, p. 40. 9 Jacob Neusner, op. cit., p. 22. 10 F. F. Bruce, New Testament History, p. 33. 11 Toda essa turbulência levou alguns judeus a se unirem aos zelotes, descritos como a “quarta filosofia” por Josefo (F. F. Bruce, New Testament History, p. 96-7). Eles promoveram uma ação hostil contra várias formas de apostasia e qual- quer coisa considerada ameaça à prática religiosa judaica. Sua origem é traçada até a rebelião de Judas, que, em 6 d.C., protestou contra o pagamento de tributo pelo povo de Deus a um monarca gentio (At 5.37). Eles foram ativos durante toda a vida adulta de Cristo e ainda por muitas décadas depois dele (v. Lc 6.15; At 1.13). A instigação da guerra dos judeus contra Roma (iniciada em 66) é atribuída à influência dos zelotes. 12 A implicação clara, também, é que os judeus seriam rejeitados, a favor dos gentios. 13 Exceto os comentários claros de Jesus quando ministrando aos estrangeiros (por exemplo, elogiando a fé do centu- rião; Mt 7.10), seu ensino geralmente enfatizava o interesse de alcançar o mundo. Por exemplo, Jesus falou sobre ser o pastor de ovelhas de outro aprisco ( Jo 10.16). Na parábola dos arrendatários da vinha, um ponto alto dos ensinos de Jesus 15 14 16 nos evangelhos sinópticos (Mt 21.33-46; Mc 12.1-12; Lc 20.9-19), ele faz referência aos “outros lavradores” que deverão receber a vinha. A parábola do banquete de casamento (Mt 22.1-10; Lc 14.15-24), de igual modo, menciona os “estran- geiros” a quem Deus irá favorecer. Com respeito a ela, Christopher J. Wright (The Mission of God, p. 510) observa que a figura da festa de casamento era muito significativa, em razão da importância projetada sobre a “comunhão à mesa” no mundo antigo, principalmente entre os judeus. 14 O fato de Jesus ter falado com uma mulher torna a interação ainda mais notável ( Jo 4.27). Leon Morris (The Gospel According to John, p. 274) observa que era inconcebível a um rabino normal conversar com uma mulher. 15 A parábola também apresenta um contraste nítido com a preocupação farisaica pelo ritual de purificação (v. Mt 15.2; Mc 7.5; Lc 11.38). Craig S. Keener (op. cit., p. 152-3) observa que os fariseus eram muito escrupulosos com respeito a lavar as mãos, embora isso não tivesse nenhum embasamento veterotestamentário. 16 A proibição de entrar em prédios gentios é encontrada mais tarde no mundo idealista do Talmude, porém, não no Antigo Testamento (Richard N. Longenecker, Acts, p. 390). 17 20 18 21 19 17 Talvez Jesus quisesse testar a fé da mulher para que ela chegasse à sua expressão total. Literalmente, porém, a de- claração de Jesus confirma que, nessa fase de seu ministério, os judeus eram sua prioridade. Sua orientação ao enviar os Doze foi semelhante. No momento, era necessário restringir sua atenção aos judeus (Mt 10.5,6). No entanto, a promessa do futuro testemunho aos gentios é clara (Mt 10.18). 18 Alguns estudiosos sugerem que eles eram “tementes a Deus”, ou seja, eram prosélitos gentios que participavam das festas judaicas (v. At 10.2). Os prosélitos gentios foram recebidos para uma comunhão total com Jesus e observava um ritual triplo: 1) a circuncisão (para homens); 2) o batismo purificador na presença de testemunhas; 3) a oferta de um sacri- fício. Os homens designados como “tementes a Deus” em geral cumpriam as duas últimas exigências e as leis morais do judaísmo, mas não chegavam a se tornar prosélitos de fato (F. F. Bruce, Book of Acts, p. 64). 19 V. Leon Morris, op. cit., p. 590. A doença do filho do oficial do rei (Jo 4.46-54) pode representar também o ministério aos gentios. Alguém poderia considerar o testemunho de Jesus perante Pilatos (e, em menor grau, Herodes) como um tes- temunho transcultural (v. Mc 15.1-5; Lc 21.1-5; Jo 18.33-38; 19.8-12). Além desses acontecimentos específicos, podemos notar as multidões que vinham a Jesus da Síria, Decápolis e do outro lado do Jordão (Mt 4.24,25; Mc 3.8; Lc 6.17). 20 Nota-se, por exemplo, que Jesus não tomou a iniciativa na maioria de seus encontros com os gentios. Geralmente, eram estes que vinha até ele (v. Mt 8.5; 15.22; Jo 12.21,22). 21 A acusação mais adiante indica o nível de intolerância existente entre os povos. No mesmo contexto, ser samaritano, para os judeus, era como ser possesso por demônios! 22 23 24 25 22 Na condição de cidade costeira, Cafarnaum tinha uma coletoria (Mc 2.14) e contava com uma guarnição (Mt 8.5-13). Era, com certeza, também a cidade natal de Pedro, André, Tiago e João. 23 Essa pode ter sido a região que Jesus tinha em mente quando descreveu a viagem do filho pródigo para uma “terra distante” (Lc 15.13). Muitos intérpretes acreditam que a alimentação dos 4 mil (Mt 15.32-38; Mc 8.1-9) ocorreu em Decápolis. Além da referência geográfica de Marcos, D. A. Carson (Matthew, p. 357) observa que a expressão “Deus de Israel” (Mt 15.31) só faria sentido num contexto gentílico. A distância do lugar (v. 33) confirma essa interpretação. Se for assim, esse milagre entre uma multidão predominantemente gentia pode complementar a miraculosa alimentação anterior entre os judeus e sugere a ampliação do alcance do ministério de Jesus. 24 Essa era, com certeza, mais uma barreira para os judeus, entre muitas. A necessidade de arrependimento das obras mortas era outra. 25 Parte do interesse de Jesus também era evitar confusão desnecessária. Ele viveu numa época em que havia uma expectativa, muito difundida, de que o Messias viria em breve. Os comentários dos rabinos relacionavam não menos que 456 passagens do Antigo Testamento à promessa da vinda do Messias (Alfred Edersheim, op. cit., livro 2, p. 163). No ambiente tenso do primeiro século, os aspirantes a Messias não eram raros (v. At 5.36). Falsos messias estilizariam seu ministério de acordo com Moisés e começariam no deserto (v. Mt 24.23-26). Além de Teudas (c. 44), Menahem (c. 60) é notável no primeiro século. 27 26 O conceito de Messias estava intimamente relacionado com a monarquia (também o “ungido” do Senhor). No pensa- mento do povo, um rei messiânico chegaria com demonstração de força (v. Mt 16.21-23) e derrotaria o regime existente (v. Jo 11.48). Apesar da compaixão de Jesus, certo comentarista observou que pode ser mais apropriado pensar nas mul- tidões que o seguiam como um “exército sem capitão”, que como “ovelhas sem pastor” (apud F. F. Bruce, New Testament History, p. 185). Contudo, Jesus não permitiria que seus discípulos ou outros o interpretassem como um Messias militar. Seu Reino era, antes de tudo, espiritual, não deste mundo ( Jo 18.36,37). Muitas das “parábolas do Reino” ressaltam esse ponto (Mt 13.21,22,25). Quando o povo desejou fazê-lo rei à força, ele se afastou ( Jo 6.15; v. Mt 4.8,9). O chamado “segredo messiânico” pode ser julgado também à luz dessa verdade. 26 Muitos intérpretes veem o número 70 (embora contestado textualmente) como simbólico do interesse em alcançar o mundo (v. as 70 nações em Gn 10). 27 Mais uma vez, é importante destacar outras razões para a oposição, principalmente a declaração de Jesus de ser igual ao Pai — uma blasfêmia na mente da maioria dos judeus. 28 29 28 Nos dias da ocupação romana, a profissão de coletor de impostos era praticamente sinônimo de extorsão. As escolas rabínicas debatiam seriamente se era possível a tais pessoas se arrependerem (F. F. Bruce, New Testament History, p. 82). 29 O termo “pecadores” era usado às vezes como descrição de pessoas comuns, que não observavam todas as tradições de pureza. Hillel, um dos líderes dos fariseus, declarou: “Um‘am ha’ ares [‘o povo da terra’, isto é, ‘pessoas comuns’, ‘a ralé’] não pode ser piedoso” (F. F. Bruce, New Testament History, p. 81; v. Jo 7.49). RUCE ARSON DERSHEIM EREMIAS OSEFO EENER ONGENCKER ORRIS EUSNER RIGHT

[cite] O dr. KEVIN D. BRADFORD coordenou o departamento de missões do Seminário Bíblico Palavra da Vida (Ati baia, SP) de 1994 a 2004. Atualmente, ministra treinamento aos candidatos a missões em diversas escolas e agências missionárias, além de cooperar para a mobilização das igrejas locais por meio do movimento Perspecti vas e do Insti tuto Missionário para Mobilização Intensiva (IMMI).É pós-graduado pelo Dallas Theological Seminary e obteve seu doutorado pela Trinity Internati onal University. “D afirmação, dizendo que Jesus desenvolveu um ministério muito restrito entre os não judeus. Teria mesmo sido ele um missionário? Em que sentido devemos entender sua “missão”? É fato inegável que Jesus deixou o lar celestial do Pai, tornou-se homem e cum- priu sua tarefa divina: sua missão (v. Jo 16.28; 19.30; Fp 2.6-11). A questão é: em que sentido Jesus pode ser considerado um mis- sionário transcultural? Israel é um país de pequena extensão territorial, sendo um pouco menor que Sergipe, o menor dos estados brasileiros, e pode ser atravessado de carro em poucas horas. Até mesmo para quem se desloca a pé, as distâncias não são tão grandes. Três culturas principais predominavam, além de numerosos gru- pos menores. Obviamente, desde o tempo do êxodo os judeus se tornaram os nativos da terra. do a Assíria conquistou o Reino do Norte (v. 2Rs 17.5,6). Como parte da estratégia para enfraquecer Israel, os assírios trouxe- ram habitantes de outras terras para casar-se com os judeus que não haviam sido deportados. O resultado dessa miscigenação foi o sincretismo religioso e o surgimento de uma nova raça (v. 2Rs 17.24-33). nos, chegaram em 63 a.C., logo após a conquista da Terra pelo general Pompeu. Apesar de, no período do ministério de Cristo, estarem presentes havia menos de um século, os romanos exerciam seu domínio não somente na política, mas também na área social e até mesmo no âmbito religioso. Na melhor das hi- póteses, o relacionamento entre os três grupos na época pode ser considerado apenas uma tensa coexistência. As tensões na Pales A história sugere que, durante o primeiro século, os tempos não eram exatamente pacífi$conteudo$
     where curso_id = v_curso and ordem = 21;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 3 · Leitura — Bradford, cap. 10: Ministério radical em um mundo polarizado$t$, $conteudo$Ministério radical em um

mundo polarizado

Kevin D. Bradford

eus tinha um único Filho e fez dele um missionário”, diz a conhecida expressão popular. Outros contestam essa

Para começar a respondê-la, será de grande ajuda observar que

A Palestina do primeiro século era extremamente polarizada.

O surgimento do povo samaritano deu-se em 722 a.C., quan-

Por fim, os gentios, representados principalmente pelos roma-

Santa

ti na do primeiro século

cos.

Os judeus e os samaritanos

Desde os primórdios, os judeus basicamente consideravam os samaritanos idólatras e inimigos (v. 2Rs 17.34,41). Sambalate, governador de Samaria, esteve entre os que fizeram oposição a Neemias e à construção do muro de Jerusalém (Ne 2.10; 4.1,2).

No ressurgimento judaico, o período macabeu, João Hircano destruiu o templo samaritano que fora erigido para competir com o de Jerusalém (c. 128 a.C). Por sua vez, os samaritanos tentaram violar o templo de Jerusalém. Dizia-se também que os samaritanos importunavam os viajantes judeus a caminho de Jerusalém. A literatura intertestamentária judaica faz referência ao “povo louco” de Samaria (v. Eclesiástico 50.28; Testamento de Levi).

Na época de Jesus, apesar dos laços históricos e religiosos em comum, os judeus não consideravam os samaritanos melhores que um estrangeiro (Lc 17.18). O comentário do apóstolo João de que “os judeus não se dão com os samaritanos” (Jo 4.9), provavelmente era uma declaração suavizada do que acontecia na realidade.

Os judeus e os romanos

O relacionamento entre judeus e romanos dificilmente poderia ser considerado melhor que com os samaritanos. Parte da dificuldade achava-se na interpretação das leis cerimoniais do Antigo Testamento, que predominava na época.

Desde a conquista de Jerusalém pelos babilônios, em 586 a.C, e o subsequente cativeiro, a nação foi motivada a abandonar a idolatria, e surgiram inúmeras tradições com o propósito de impedir a contaminação do povo. Infelizmente, as tradições também acabaram por impedir os judeus de manter a convivência normal com os gentios. Edersheim conclui que os gentios “deveriam, tanto quanto possível, ser evitados, exceto em casos de necessidade ou por motivo de negócios. Eles e tudo que era deles eram impuros. Suas casas eram imundas, porque continham ídolos ou coisas dedicadas a eles. Suas celebrações e ocasiões festivas e quaisquer de seus contatos eram manchados pela idolatria. Também não era seguro deixar um pagão a sós num cômodo, pois ele poderia, quer por malícia, quer por descuido, profanar o vinho ou a carne sobre a mesa, ou o óleo e trigo no estoque”.

Esse tipo de atitude era incentivado pelos líderes religiosos judeus, principalmente pelos fariseus e sacerdotes:

O sacerdote classificava os caminhos afastados do mundo do outro lado do Templo primeiramente como menos santos, depois como profanos, posteriormente como impuros [...] Todos os povos, exceto Israel, eram, por natureza, impuros como os cadáveres.

Do outro lado dessa situação crítica estão os romanos e a forma de tratamento por eles dispensada à Palestina. O general Pompeu prefigurou a atitude romana em voga nos tempos de Cristo. Além de capturar a área do Templo, ele insistiu em entrar no Santo dos Santos, área explicitamente vedada a todos exceto ao sumo sacerdote, e somente no dia da Expiação.

Após um breve período de autonomia sob o governo de Julio César, Herodes, o Grande, auxiliado pelas tropas romanas, comandou um novo cerco a Jerusalém, o qual durou três meses (37 a.C). A administração implacável imposta por Herodes ao reino judeu foi muito bem documentada, inclusive com um breve relato nos registros bíblicos (v. Mt 2.1-16).

Os problemas se intensificaram quando, em 6 a.D., a Judeia foi reorganizada como província romana e perdeu grande parte de sua independência. O recenseamento vinculado a essa reorganização resultou numa rebelião liderada por Judas (At 5.37). Grato (15-26), antecessor de Pôncio Pilatos no posto de governador da Judeia, destituiu quatro sumo sacerdotes e indicou outros quatro. Muito provavelmente foi esse um dos meios pelos quais o governador aumentou sua fortuna.

O próprio Pilatos, aproveitando a escuridão da noite, colocou o estandarte imperial em Jerusalém, apesar da orientação recebida e da objeção dos judeus acerca da exibição de imagens. Quando os judeus descobriram o fato, ameaçaram deflagrar tal revolta por toda a província que nem mesmo a ameaça de um massacre poderia detê-los.

O total da carga de impostos (sacerdotais e romanos) sobre os judeus na época de Jesus chegava à casa dos 30% ou 40%. O pagamento dos impostos aos romanos era visto, de modo geral, como um roubo organizado ou algo próximo disso. Entretanto, após a construção de um aqueduto para aumentar o suprimento de água da cidade, Pilatos dilapidou os tesouros do templo, alegando pagamento pelos serviços, o que causou enorme revolta (v. Lc 13.1). Em razão dos precedentes históricos e das constantes dificuldades, os romanos precisavam colocar tropas extras em Jerusalém durante as grandes festas, para evitar possíveis tumultos. O período no qual Jesus iniciou o seu ministério era realmente tenso.

O ensino e o exemplo de Jesus

Apesar do mundo polarizado no qual vivia, Jesus foi radical e enfático em sua mensagem: o Reino de Deus é para todos os povos.

O início do ministério público de Jesus caracterizou-se pela ênfase nesse tema. Em suas pregações na Galileia, ele fez uma referência favorável ao ministério de Elias para com a viúva de Sarepta, bem como à bênção oferecida a Naamã, o siro (Lc 4.25-27; v. 1Rs 17.8-24; 2Rs 5.1-14). Não é de se estranhar que a simples menção desses contatos transculturais tenha sido a razão de Jesus ter sido expulso da cidade. O ensino coerente de Jesus apontava a possibilidade de gentios e samaritanos serem parceiros equivalentes aos judeus em questões de fé.

A prática de Jesus reforçava seu ensino. Em pelo menos seis episódios de seu ministério, três com samaritanos e três com gentios, essa abertura de possibilidades a eles foi realçada.

O contato com os samaritanos

1) As declarações de Jesus à mulher samaritana no poço ( Jo 4.1-42) indicam, no mínimo, um desejo de interação pessoal. Se Jesus apenas desejasse descansar e beber alguma coisa, é de duvidar que tivesse provocado o interesse da mulher com uma declaração tão enigmática após seu pedido inicial ( Jo 4.10). Em sua abordagem, ele rapidamente a conduziu de um tema superficial a uma reflexão de seu estado moral e de suas práticas religiosas, demonstrando, de modo inequívoco, seu interesse na samaritana como pessoa.

À parte de sua capacidade profética, enquanto conversava, Jesus demonstrou sabedoria, principalmente por sua notável sensibilidade para com as necessidades de uma mulher que tinha tudo para estar amargurada. Pode-se notar sua disposição em tratar as questões delicadas que considerava importantes (por exemplo, a fonte de salvação e o modo de adorar a Deus), bem como, a capacidade de ignorar questões potencialmente polêmicas, porém secundárias, como o lugar correto da adoração. Além disso, o texto sugere que o sentido de propósito de Jesus (v. Jo 4.34-36) foi sua motivação durante toda a conversa.

2) Em outra ocasião, Jesus não interagiu diretamente com os samaritanos. Contudo, sua reação à hostilidade deles (Lc 9.53) é muito instrutiva. Embora Tiago e João (e muito provavelmente os outros discípulos) se mostrassem favoráveis a um julgamento imediato e impetuoso (v. 54; v. Mc 3.17), a resposta de Jesus foi surpreendente. Ele não repreendeu os samaritanos por sua falta de hospitalidade, e sim, aos seus mal orientados discípulos (Lc 9.55,56). Demonstrando extraordinária humildade, Jesus levou-os a outro povoado, provavelmente samaritano. De modo sugestivo, no capítulo seguinte, Lucas registra a parábola de Jesus sobre o bom samaritano (Lc 10.30-37). Jesus não apenas enfrentou a rejeição transcultural, como também, mais tarde foi capaz de reagir a ela de forma generosa.

3) Em outro episódio, quando viajava da Galileia para Jerusalém, Jesus curou dez leprosos (Lc 17.11-19). O fato de apenas o leproso samaritano ter voltado para agradecer (v. 16) expõe universalidade da graça de Deus. O exercício poderoso da fé (v. 19) não estava de maneira alguma limitado a uma única cultura.

O contato com os genti os

Apesar de o distanciamento cultural ser ainda maior, Jesus também ministrou aos gentios.

4) Quando o centurião romano mandou chamá-lo e lhe contou sobre o servo doente, Jesus pôs-se a caminho e, ao que parece, teria entrado em sua casa (Mt 8.5-13; v. Lc 7.1-10). Pedro, refletindo a típica atitude judaica, posteriormente declara que esse tipo de conduta era contrário à lei (At 10.28; v. 11.2,3). Jesus, porém, não se intimidava. Seu interesse primordial estava na pessoa necessitada de ajuda, sem importar o contexto cultural. O fato de os líderes religiosos apresentarem os méritos do homem (Lc 7.4,5), aparentemente não teve muita importância para ele.

5) De modo semelhante, é fato que, quando solicitado pela mulher cananeia (Mt 15.21-28; Mc 7.24-30), Jesus não atendeu prontamente ao seu pedido. Contudo, Jesus terminou por reconhecer sua humildade e fé e lhe concedeu o que desejava, apesar da resistência por parte de seus discípulos (Mt 15.23). Ao contrário do encontro com o centurião, Jesus não fez menção de ir à casa da mulher, todavia, rompeu com o costume da época ao estender suas bênçãos a representantes de outra cultura.

6) Finalmente, sabemos que Filipe e André trouxeram os “gregos” até Jesus (Jo 12.20-22). Não temos maiores informações sobre o contexto cultural desses homens, nem mesmo sabemos como Jesus os influenciou. Contudo, a localização desse episódio exclusivo da narrativa de João pouco antes do encontro no cenáculo (Jo 13—16) demonstra sua importância. Esse fato parece implicar o reconhecimento de que o ministério de Jesus alcançara seu ápice ( Jo 12.23,27; 13.1; v. 2.4; 7.6,8,30; 8.20). Poucos dias depois, uma missão cuja abrangência chegaria a todos os povos haveria de ser revelada (v. Jo 12.19,32).

Alargando as fronteiras

É bem provável que o contato de Jesus com os samaritanos tenha sido maior que com os gentios.

Muitos peregrinos judeus, ao viajar da Galileia para Jerusalém, preferiam contornar a cidade de Samaria a atravessá-la, a fim de evitar o contato com essa cultura, embora essa medida tornasse a viagem mais longa. Jesus, porém, pelo menos em três ocasiões preferiu atravessar Samaria (v. Jo 4.3,4; Lc 9.51,52; 17.11). A interação com os gentios pode se tornar um fator de impedimento a que Jesus testemunhasse mais efetivamente para a maioria dos judeus. No entanto, por mais desprezível que fosse tal atitude aos olhos dos judeus, o contato com os samaritanos não tornava Jesus “impuro”. Da mesma forma que os judeus, os samaritanos respeitavam o rito da circuncisão, a guarda do sábado e as leis dietéticas. Talvez isso explique a iniciativa de Jesus em conversar com a mulher no poço ( Jo 4.7) e os dois dias a mais de permanência na cidade de Sicar ( Jo 4.40). Outro fator que pode ter encorajado o encontro foi a sugestão/ acusação feita por seus inimigos de que ele próprio era samaritano ( Jo 8.48).

Jesus, entretanto, costumava colocar a si e aos seus discípulos em situações nas quais o contato com os gentios era inevitável. Ele cresceu na Galileia, também conhecida como “Galileia dos gentios” (v. Mt 4.15). Embora fosse de esperar que um rabino judeu se mudasse para Jerusalém, foi na Galileia que ele não apenas passou a maior parte de seu tempo, como também recrutou a maioria dos discípulos.

Jesus foi criado na tranquila cidade rural de Nazaré. Mais tarde, porém, escolheu Cafarnaum como sua “base de operações”, fato muito curioso, principalmente porque Cafarnaum era uma cidade costeira, o último vestígio significativo da cultura judaica antes de se chegar a Traconites (v. Lc 3.1) e à Síria. Isso hoje equivale a alguém que afirma pretender alcançar todo o Brasil estabelecendo residência em Foz do Iguaçu!

Jesus também atravessou o mar da Galileia até Decápolis pelo menos duas vezes. Em cada uma delas realizou grandes milagres: expulsou o demônio de um homem possesso (v. Mt 8.28-34; Mc 5.1-20; Lc 8.26-37) e curou um surdomudo (v. Mc 7.31-37). A região de Decápolis (literalmente “dez cidades”, em grego) era influenciada pelas culturas grega e romana. Ambos os impérios fixaram muitos de seus soldados reformados nessas cidades fronteiriças, com o propósito de defender suas possessões. Também foi ali que Herodes, o Grande, construiu inúmeros templos pagãos.

Houve ainda outras ocasiões nas quais Jesus levou seus discípulos consigo para além dos limites da Palestina. Passando pela região além do Jordão (Mt 19.1; Mc 10.1; Jo 10.40-42), eles seguiram para Tiro e Sidom, isto é, o Líbano (Mt 15.21; Mc 7.24), e depois para Cesareia de Filipe, isto é, a Síria (Mt 16.13; Mc 8.27).

O episódio da confissão de Pedro acerca de Cristo deu-se em Cesareia de Felipe, e é extremamente significativo. Nisso se observa a ênfase na disponibilidade do evangelho para todos, pelo fato de ter ocorrido, dentre todas as viagens do ministério de Jesus, no local mais distante de Jerusalém. Apesar de não termos muitas informações sobre o ministério de Jesus nessas regiões, os eventos registrados parecem ter sido frequentes ou positivos o bastante para levantar a suspeita de que Jesus poderia considerar ir além dos limites da Palestina para ministrar aos gregos da Dispersão ( Jo 7.35).

Por que concentrar-se nos judeus?

À luz das tensões antes descritas, talvez não se possa considerar estranha a orientação dada por Cristo aos seus discípulos: “Não tomeis rumo aos gentios, nem entreis em cidade de samaritanos” (Mt 10.5). Pouco tempo depois, quando abordado pela mulher siro-fenícia, ele respondeu ter sido enviado apenas “às ovelhas perdidas da casa de Israel” (Mt 15.24). Jesus estava consciente das limitações culturais de seu público principal: os judeus. É certo que, pelo menos durante a primeira parte de seu ministério, ele concedeu muitas oportunidades aos judeus para que correspondessem à sua mensagem antes que o aspecto multicultural de seu ministério se tornasse comprovadamente uma barreira. Se ele tivesse ministrado com mais frequência e mais estritamente aos romanos (ou mesmo aos samaritanos), os judeus provavelmente teriam se afastado dele muito tempo antes.

Um ponto primordial para o ministério de qualquer obreiro deveria ser o exercício do discernimento no que tange ao seu público-alvo. Ter uma abordagem contextualizada do ministério ajudará a evitar escândalos desnecessários, bem como facilitará o alcance de um número maior de pessoas. Ele deve manter-se fiel à mensagem básica, no entanto, a boa comunicação começa por se chegar até onde o povo está. Seu campo de experiência determinará o que é compreendido e até mesmo o que é ouvido.

Na linguagem de hoje, podemos observar que muitas vezes o cristianismo é visto pelos muçulmanos (e por outros grupos) como uma religião ocidental, o que a torna indigna. Eles fecham os ouvidos para a mensagem de estrangeiros antes mesmo de ouvir sobre o Messias nascido no Oriente Médio. O maior ou menor grau em que um missionário é capaz de remover essa barreira geralmente será o indicador de seu sucesso em alcançá-los.

Jesus também preparou seus discípulos passo a passo para um ministério mundial. A princípio, eles eram judeus comuns que apenas haviam começado a seguir Jesus. Seus preconceitos eram semelhantes aos dos judeus de sua época (v. Mt 15.23; Lc 9.54; Jo 4.27). Se eles tivessem sido enviados aos gentios nesse estágio inicial, dificilmente a vida deles confirmaria a mensagem que pregavam. Eles precisavam aprender mais de Jesus e testemunhar sua compaixão por todos, o que, por fim, os faria superar o preconceito étnico. É significativo o fato de os Setenta enviados mais tarde (Lc 10.1-16) não terem recebido restrição alguma. No período posterior à ressurreição, eles receberam o mandamento expresso de irem por todo o mundo (Mt 28.19; Mc 16.15; Lc 24.47; At 1.8).

Conclusão

Foi Jesus um missionário transcultural? A dúvida se instala quando observamos o escopo limitado das viagens de Jesus e sua atenção concentrada na ministração aos judeus. A resposta, entretanto, deverá ser um “sim”, se apenas notarmos sua aproximação contextualizada, frequente e sensível de pessoas cujas origens diferiam das suas. Ele chegou mesmo a confrontar os judeus com o fato de que a promessa de Deus era multicultural. Se a partir desse ponto Jesus tivesse recuado, não há dúvida de que a oposição dos fariseus e de outros líderes religiosos teria sido consideravelmente menor. Em vez disso, ele elogiou a fé dos estrangeiros (v. Mt 8.10; 15.28; Lc 7.9), enquanto condenou com veemência a falta de fé de seu povo (Mt 8.26; 11.20-24; 13.58; 14.31; 16.8; 17.20).

Deixando um pouco de lado a mensagem falada de Jesus, pode-se observar quão arrojada era sua mensagem não verbal. Ele não receava dar aos gentios e aos samaritanos uma chance de resposta, enquanto mantinha aberta a porta aos judeus. O ministério da encarnação exige proximidade física. Jesus manteve-se perto dos de fora. Ele era capaz de dialogar com líderes religiosos e até mesmo receber alguém importante como Nicodemos em sua casa. Ainda assim, fazia-se amigo dos marginalizados.

Esse princípio é ilustrado mais claramente quando observamos que Jesus alcançou os excluídos da sociedade. Ele não se absteve do contato com doentes (cegos, leprosos, coxos), possessos por demônios e imorais (por exemplo, prostitutas). Em muitas ocasiões, a própria iniciativa para o contato foi dele.

Dentre os “imorais”, é provável que os coletores de impostos fossem considerados os piores. Contudo, Jesus chamou Mateus para ser um dos Doze (Mt 9.9; Mc 2.15; Lc 5.27). Ele frequentou a casa dos coletores de impostos em diversas ocasiões (v. Mt 9.10; Mc 2.15,16; Lc 5.29; 19.1-10) e ganhou a reputação de ser “amigo de publicanos e pecadores” (Mt 11.19; Lc 7.34; 19.7). O fato de serem judeus representava um tópico que a maioria dos acusadores de Jesus gostava de discutir (v. Mt 9.11; 12.24; Mc 2.16; 3.22; Lc 5.30; 7.39; 11.15; 15.2; 19.7; Jo 8.4-6). Entretanto, não há dúvidas sobre a natureza radical do ministério de Jesus.

A compaixão de Jesus por todos o levou a confrontar muitos dos padrões sociais de seu tempo. Ele chamou a atenção para os grupos relegados ao esquecimento pela sociedade de sua época e os aproximou dela. Diante disso, somos forçados a nos perguntar sobre as pessoas socialmente discriminadas que estão ao nosso redor. É possível que nem mesmo percebamos que há pessoas diferentes de nós, que dirá sobre a nossa tentativa de ministrar a elas. Será que, de algum modo, esse tipo de pessoa se sentiria “entre amigos” caso chegasse a algumas de nossas igrejas?

A mensagem cristã sempre envolverá escândalo (v. 1Co 1.23,24). O ministro cristão deve evitar a contextualização com o propósito exclusivo de ser aceito. Entretanto, a contextualização com o propósito de ajudar os outros na compreensão da mensagem de Deus é necessária para o alcance generalizado do povo. É imprescindível ter discernimento e equilíbrio. Nossa busca pela contextualização poderá ser criticada por alguns, mas faremos bem em seguir o exemplo de Jesus. A crescente polarização do mundo em que vivemos apresentará muitas oportunidades para o exercício de um ministério radical em nossos dias.

C, D. A. Matthew. In: Gaebelein, F. E. (Org.).

Rapids: Zondervan, 1984, v. 8.

E, Alfred. The Life and Times of Jesus the Messiah

J, Joachim. Jerusalém no tempo de Jesus. São Paulo: Paulinas, 1983.

J, Flávio. História dos hebreus: obra completa. 8. ed. Rio de Janeiro: CPAD, 2004.

K, Craig S. The IVP Bible Background Commentary:

terVarsity, 1993.

L, Richard N. Acts. In: Gaebelein, F. E. (Org.).

Grand Rapids: Zondervan, 1981, v. 9.

M, Leon. The Gospel According to John. In:

Testament. Grand Rapids: Eerdmans, 1983

N, Jacob. Judaism in the Beginning of Christianity.

W, Christopher J. The Mission of God. Downers Grove: InterVarsity, 2006.

The Expositor’s Bible Commentary. Grand

. Grand Rapids: Eerdmans, 1971.

New Testament. Downers Grove: In-

The Expositor’s Bible Commentary.

New International Commentary on the New

Philadelphia: Fortress Press, 1984.

Perguntas para estudo

1.Qual teria sido o resultado mais provável entre os judeus se Jesus tivesse concentrado seu minis-

tério público inicial nos gentios? Qual teria sido o resultado mais provável entre os gentios?

2.Cite alguns dos grupos negligenciados pela Igreja ou “escondidos” no meio dela hoje em dia.

Bibliografia

B, F. F. New Testament History. Garden City: Doubleday, 1980.

_____. Book of Acts. In: New International Commentary on the New Testament. Grand Rapids:

Eerdmans, 1983.

[cite] 3 1 4 2 5 1 Craig S. Keener, The IVP Bible Background Commentary:New Testament, p. 215. 2 Os romanos inicialmente favoreciam os samaritanos da Judeia. Herodes, o Grande, fez de Samaria uma das maiores cidades da Palestina, lá construindo, entre outras coisas, um grande tempo pagão. Uma de suas esposas também era samari- tana, a mãe de Herodes Antipas. Depois de Herodes, o Grande, porém, a relação entre Roma e Samaria tornou-se cada vez mais hostil. Os governadores que vieram a seguir foram ineficazes. Pouco tempo depois de Cristo, no ano 36, Pilatos enviou um destacamento de soldados para atacar um grupo de viajantes samaritanos no monte sagrado de Gerizim, pro- vocando muitas mortes (Flávio Josefo, História dos hebreus, livro XVIII, cap. 5). 3 A questão da pureza racial também era importante entre os judeus, principalmente os de linhagem mais pura ( Joachim Jeremias, Jerusalém no tempo de Jesus). Os que estavam à margem da sociedade judaica tinham muito menor motivação para observar as regras sobre violação. 4 Alfred Edersheim, The Life and Times of Jesus the Messiah, livro I, p. 92. 5 Pelas mesmas razões, o povo de Jerusalém tendia a se distanciar dos galileus e até mesmo dos da província da Judeia. Os dois últimos grupos não se preocupavam com os rituais de purificação. A animosidade entre os moradores urbanos e rurais geralmente se era intensa ( Jacob Neusner, Judaism in the Beginning of Christianity, p. 24-5, 38). 9 10 11 6 12 7 13 8 6 F. F. Bruce, New Testament History, p. 34. 7 Flávio Josefo, op. cit., livro XVIII, cap. 4. 8 Apud F. F. Bruce, New Testament History, p. 40. 9 Jacob Neusner, op. cit., p. 22. 10 F. F. Bruce, New Testament History, p. 33. 11 Toda essa turbulência levou alguns judeus a se unirem aos zelotes, descritos como a “quarta filosofia” por Josefo (F. F. Bruce, New Testament History, p. 96-7). Eles promoveram uma ação hostil contra várias formas de apostasia e qual- quer coisa considerada ameaça à prática religiosa judaica. Sua origem é traçada até a rebelião de Judas, que, em 6 d.C., protestou contra o pagamento de tributo pelo povo de Deus a um monarca gentio (At 5.37). Eles foram ativos durante toda a vida adulta de Cristo e ainda por muitas décadas depois dele (v. Lc 6.15; At 1.13). A instigação da guerra dos judeus contra Roma (iniciada em 66) é atribuída à influência dos zelotes. 12 A implicação clara, também, é que os judeus seriam rejeitados, a favor dos gentios. 13 Exceto os comentários claros de Jesus quando ministrando aos estrangeiros (por exemplo, elogiando a fé do centu- rião; Mt 7.10), seu ensino geralmente enfatizava o interesse de alcançar o mundo. Por exemplo, Jesus falou sobre ser o pastor de ovelhas de outro aprisco ( Jo 10.16). Na parábola dos arrendatários da vinha, um ponto alto dos ensinos de Jesus 15 14 16 nos evangelhos sinópticos (Mt 21.33-46; Mc 12.1-12; Lc 20.9-19), ele faz referência aos “outros lavradores” que deverão receber a vinha. A parábola do banquete de casamento (Mt 22.1-10; Lc 14.15-24), de igual modo, menciona os “estran- geiros” a quem Deus irá favorecer. Com respeito a ela, Christopher J. Wright (The Mission of God, p. 510) observa que a figura da festa de casamento era muito significativa, em razão da importância projetada sobre a “comunhão à mesa” no mundo antigo, principalmente entre os judeus. 14 O fato de Jesus ter falado com uma mulher torna a interação ainda mais notável ( Jo 4.27). Leon Morris (The Gospel According to John, p. 274) observa que era inconcebível a um rabino normal conversar com uma mulher. 15 A parábola também apresenta um contraste nítido com a preocupação farisaica pelo ritual de purificação (v. Mt 15.2; Mc 7.5; Lc 11.38). Craig S. Keener (op. cit., p. 152-3) observa que os fariseus eram muito escrupulosos com respeito a lavar as mãos, embora isso não tivesse nenhum embasamento veterotestamentário. 16 A proibição de entrar em prédios gentios é encontrada mais tarde no mundo idealista do Talmude, porém, não no Antigo Testamento (Richard N. Longenecker, Acts, p. 390). 17 20 18 21 19 17 Talvez Jesus quisesse testar a fé da mulher para que ela chegasse à sua expressão total. Literalmente, porém, a de- claração de Jesus confirma que, nessa fase de seu ministério, os judeus eram sua prioridade. Sua orientação ao enviar os Doze foi semelhante. No momento, era necessário restringir sua atenção aos judeus (Mt 10.5,6). No entanto, a promessa do futuro testemunho aos gentios é clara (Mt 10.18). 18 Alguns estudiosos sugerem que eles eram “tementes a Deus”, ou seja, eram prosélitos gentios que participavam das festas judaicas (v. At 10.2). Os prosélitos gentios foram recebidos para uma comunhão total com Jesus e observava um ritual triplo: 1) a circuncisão (para homens); 2) o batismo purificador na presença de testemunhas; 3) a oferta de um sacri- fício. Os homens designados como “tementes a Deus” em geral cumpriam as duas últimas exigências e as leis morais do judaísmo, mas não chegavam a se tornar prosélitos de fato (F. F. Bruce, Book of Acts, p. 64). 19 V. Leon Morris, op. cit., p. 590. A doença do filho do oficial do rei (Jo 4.46-54) pode representar também o ministério aos gentios. Alguém poderia considerar o testemunho de Jesus perante Pilatos (e, em menor grau, Herodes) como um tes- temunho transcultural (v. Mc 15.1-5; Lc 21.1-5; Jo 18.33-38; 19.8-12). Além desses acontecimentos específicos, podemos notar as multidões que vinham a Jesus da Síria, Decápolis e do outro lado do Jordão (Mt 4.24,25; Mc 3.8; Lc 6.17). 20 Nota-se, por exemplo, que Jesus não tomou a iniciativa na maioria de seus encontros com os gentios. Geralmente, eram estes que vinha até ele (v. Mt 8.5; 15.22; Jo 12.21,22). 21 A acusação mais adiante indica o nível de intolerância existente entre os povos. No mesmo contexto, ser samaritano, para os judeus, era como ser possesso por demônios! 22 23 24 25 22 Na condição de cidade costeira, Cafarnaum tinha uma coletoria (Mc 2.14) e contava com uma guarnição (Mt 8.5-13). Era, com certeza, também a cidade natal de Pedro, André, Tiago e João. 23 Essa pode ter sido a região que Jesus tinha em mente quando descreveu a viagem do filho pródigo para uma “terra distante” (Lc 15.13). Muitos intérpretes acreditam que a alimentação dos 4 mil (Mt 15.32-38; Mc 8.1-9) ocorreu em Decápolis. Além da referência geográfica de Marcos, D. A. Carson (Matthew, p. 357) observa que a expressão “Deus de Israel” (Mt 15.31) só faria sentido num contexto gentílico. A distância do lugar (v. 33) confirma essa interpretação. Se for assim, esse milagre entre uma multidão predominantemente gentia pode complementar a miraculosa alimentação anterior entre os judeus e sugere a ampliação do alcance do ministério de Jesus. 24 Essa era, com certeza, mais uma barreira para os judeus, entre muitas. A necessidade de arrependimento das obras mortas era outra. 25 Parte do interesse de Jesus também era evitar confusão desnecessária. Ele viveu numa época em que havia uma expectativa, muito difundida, de que o Messias viria em breve. Os comentários dos rabinos relacionavam não menos que 456 passagens do Antigo Testamento à promessa da vinda do Messias (Alfred Edersheim, op. cit., livro 2, p. 163). No ambiente tenso do primeiro século, os aspirantes a Messias não eram raros (v. At 5.36). Falsos messias estilizariam seu ministério de acordo com Moisés e começariam no deserto (v. Mt 24.23-26). Além de Teudas (c. 44), Menahem (c. 60) é notável no primeiro século. 27 26 O conceito de Messias estava intimamente relacionado com a monarquia (também o “ungido” do Senhor). No pensa- mento do povo, um rei messiânico chegaria com demonstração de força (v. Mt 16.21-23) e derrotaria o regime existente (v. Jo 11.48). Apesar da compaixão de Jesus, certo comentarista observou que pode ser mais apropriado pensar nas mul- tidões que o seguiam como um “exército sem capitão”, que como “ovelhas sem pastor” (apud F. F. Bruce, New Testament History, p. 185). Contudo, Jesus não permitiria que seus discípulos ou outros o interpretassem como um Messias militar. Seu Reino era, antes de tudo, espiritual, não deste mundo ( Jo 18.36,37). Muitas das “parábolas do Reino” ressaltam esse ponto (Mt 13.21,22,25). Quando o povo desejou fazê-lo rei à força, ele se afastou ( Jo 6.15; v. Mt 4.8,9). O chamado “segredo messiânico” pode ser julgado também à luz dessa verdade. 26 Muitos intérpretes veem o número 70 (embora contestado textualmente) como simbólico do interesse em alcançar o mundo (v. as 70 nações em Gn 10). 27 Mais uma vez, é importante destacar outras razões para a oposição, principalmente a declaração de Jesus de ser igual ao Pai — uma blasfêmia na mente da maioria dos judeus. 28 29 28 Nos dias da ocupação romana, a profissão de coletor de impostos era praticamente sinônimo de extorsão. As escolas rabínicas debatiam seriamente se era possível a tais pessoas se arrependerem (F. F. Bruce, New Testament History, p. 82). 29 O termo “pecadores” era usado às vezes como descrição de pessoas comuns, que não observavam todas as tradições de pureza. Hillel, um dos líderes dos fariseus, declarou: “Um‘am ha’ ares [‘o povo da terra’, isto é, ‘pessoas comuns’, ‘a ralé’] não pode ser piedoso” (F. F. Bruce, New Testament History, p. 81; v. Jo 7.49). RUCE ARSON DERSHEIM EREMIAS OSEFO EENER ONGENCKER ORRIS EUSNER RIGHT

[cite] O dr. KEVIN D. BRADFORD coordenou o departamento de missões do Seminário Bíblico Palavra da Vida (Ati baia, SP) de 1994 a 2004. Atualmente, ministra treinamento aos candidatos a missões em diversas escolas e agências missionárias, além de cooperar para a mobilização das igrejas locais por meio do movimento Perspecti vas e do Insti tuto Missionário para Mobilização Intensiva (IMMI).É pós-graduado pelo Dallas Theological Seminary e obteve seu doutorado pela Trinity Internati onal University. “D afirmação, dizendo que Jesus desenvolveu um ministério muito restrito entre os não judeus. Teria mesmo sido ele um missionário? Em que sentido devemos entender sua “missão”? É fato inegável que Jesus deixou o lar celestial do Pai, tornou-se homem e cum- priu sua tarefa divina: sua missão (v. Jo 16.28; 19.30; Fp 2.6-11). A questão é: em que sentido Jesus pode ser considerado um mis- sionário transcultural? Israel é um país de pequena extensão territorial, sendo um pouco menor que Sergipe, o menor dos estados brasileiros, e pode ser atravessado de carro em poucas horas. Até mesmo para quem se desloca a pé, as distâncias não são tão grandes. Três culturas principais predominavam, além de numerosos gru- pos menores. Obviamente, desde o tempo do êxodo os judeus se tornaram os nativos da terra. do a Assíria conquistou o Reino do Norte (v. 2Rs 17.5,6). Como parte da estratégia para enfraquecer Israel, os assírios trouxe- ram habitantes de outras terras para casar-se com os judeus que não haviam sido deportados. O resultado dessa miscigenação foi o sincretismo religioso e o surgimento de uma nova raça (v. 2Rs 17.24-33). nos, chegaram em 63 a.C., logo após a conquista da Terra pelo general Pompeu. Apesar de, no período do ministério de Cristo, estarem presentes havia menos de um século, os romanos exerciam seu domínio não somente na política, mas também na área social e até mesmo no âmbito religioso. Na melhor das hi- póteses, o relacionamento entre os três grupos na época pode ser considerado apenas uma tensa coexistência. As tensões na Pales A história sugere que, durante o primeiro século, os tempos não eram exatamente pacífi$conteudo$, 21);
  end if;

end
$curso$;
