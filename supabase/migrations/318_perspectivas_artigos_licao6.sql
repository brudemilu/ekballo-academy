-- 318_perspectivas_artigos_licao6.sql
-- Os dois artigos de plataforma da Lição 6: o Zwemer e o Koch. São os primeiros
-- itens do curso que NÃO vêm do livro — o guia manda ler na plataforma do EAD, e
-- o Bruno mandou os PDFs pelo Dropbox.
--
-- PROCEDÊNCIA: link do Dropbox com download desabilitado, como sempre neste
-- acervo — curl devolve a página do visualizador, não o arquivo. O texto saiu do
-- stream de preview, lido com Playwright. Os dois PDFs TÊM camada de texto
-- (Arial), então não houve OCR: o Koch tem 3 páginas e o Zwemer 11.
--
-- O stream manda CADA LETRA como um trecho separado, sem espaço; o espaço é
-- deduzido do vão horizontal, com corte adaptativo por linha. Por isso sobram
-- palavras coladas, consertadas uma a uma: 3 no Koch e 26 no Zwemer.
--
-- AUDITORIA FECHADA EM ZERO. Como há camada de texto, dá para provar a
-- transcrição por conjunto de caracteres: tudo que a fonte tem está no gravado,
-- e o que falta são só os números de página, retirados de propósito.
--
-- UM ERRO MEU QUE A AUDITORIA PEGOU: eu havia "corrigido" "Personal Lifee of
-- David Livingstone" para "Life" numa referência bibliográfica. A auditoria
-- acusou um "e" faltando e eu reverti — a regra aqui é transcrição literal, e
-- erro do original fica.
--
-- TÍTULO DIVERGENTE: o guia chama o artigo do Koch de "O surgimento da força
-- missionária não-ocidental"; o próprio artigo se intitula "A crescente força
-- missionária não ocidental". Vale o título do documento, como já valeu para o
-- cap. 118 e para o Ekström — o guia deste acervo erra título com frequência.
--
-- POSIÇÃO: na ordem em que o guia os chama — o Zwemer depois do McGavran cap. 43
-- e o Koch depois do Townsend cap. 42.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 54;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 6 · Leitura — Zwemer: A Glória do Impossível', 'A Glória do Impossível

Samuel Zwemer

Quando Robert Wilder visitou o Hope College (Faculdade Hope) em 1887, representando o Movimento Voluntário Estudantil, Samuel Zwemer se achava no seu último ano de Faculdade. Respondendo ao apelo de Wilder, Zwemerse tornou um voluntário e logo organizou uma missão à Arábia junto com outros estudantes. Depois de 23 anos trabalhando com a Missão Árabe em Basra, Bahrain, Mascate e Kuwait, e de serviços prestados com oprimeiro candidato a secretário do Movimento Voluntário Estudantil, Zwemer iniciou uma carreira de oradore escritor que se estendeu por todo o mundo muçulmano a partirde um centro de estudos de caráter interdenominacional localizado no Cairo (Egito). Autorprolífico e de grande capacidade, Zwemer escreveu livros e artigos com o objetivo de desafiara igreja evangelizar os muçulmanos, desenvolveu estudos profundos acerca do islamismo histórico e popular, e preparou escritos e folhetos em árabe, tanto para muçulmanos como para cristãos que viviam no Oriente Médio. Durante 36 anos ele editou The Muslim World ("O Mundo Muçulmano"), uma revista trimestral em inglês acerca de assuntos atuais do mundo muçulmano e que também servia de foro de debates sobre a estratégia missionária entre osmuçulmanos, complementando este trabalho com evangelismo pessoal entre alunos e professores de Al-Azhar, o famoso centro cairota de treinamento de missionários muçulmanos. Zwemer foi um líder evangélico destacado, um oradorbem aceito nas reuniões de Movimento Voluntário Estudantil e a força propulsora das conferências do Cairo (1906) e de Lucknow (1911), as quais deram início a uma atitude mais positiva e de menos animosidade para com os muçulmanos. James Hunt fez o seguinte comentário acerca deste estadista: "Pode-se dizer que ele é homem de uma única idéia. Embora seus interesses e conhecimentos sejam vastos, nunca conversei com ele pormais de dez minutos sem que o assunto da conversa não se dirigisse para o islamismo..." "The Glory of the Impossible" ("A Glória do Impossível") é extraído de uma publicação de 1911 do Movimento Voluntário Estudantil.

O desafio dos campos de mundo ainda não alcançados é para uma grande fé, e, portanto, para um grande sacrifício. Nossa disposição em nos sacrificarmos porum empreendimento está sempre na proporção de nossa fé nesse empreendimento. A fé tem a capacidade de transformar o quase impossível em realidade. Quando os homens são dominados pela convicção de que uma coisa tem de ser feita, eles não permitem interrupção até que esteja realizada. Nós recebemos as nossas "ordens para marchar" , como disse o Duque de Ferro (Arthur Wesley, Duque de Wellington) e considerando que o nosso Comandante-em-Chefe não está ausente, mas conosco, o impossível se torna não apenas viável mas também imperativo. Charles Spurgeon, pregando sobre o texto: " Toda autoridade (i. e., poder) mefoi dada...Eis que estou convosco", usou as seguintes palavras: "Temos aqui um fatorqueé absolutamente infinito, e que importa quais sejam os demais fatores? ‘Eu farei o que puder'', diz alguém. Qualquer tolo pode realizar uma coisa como assim. Aquele que crê em Cristo faz o que não pode fazer, tenta o impossível e o realiza".¹

Revesses frequentes e supostos fracassos jamais desanimam o pioneiro autêntico. Os martírios ocasionais são apenas um novo incentivo. Aoposição é um estímulo para maior atividade. Uma grande vitória jamais foi possível sem grande sacrifício. Se a tomada de Port Arthur, atual Lushun, na China, exigiu balas humanas², não podemos esperar apossar-nos dos Portos Arthur e dos Gibraltares do mundo não-cristão sem perdas de vidas. Será que realmente importa quantos morrem ou quanto dinheiro gastamos na abertura de portas fechadas e na ocupação de diferentes campos, se realmente cremos que as missões são um estado de guerra e que a glória do Rei está em jogo? A guerra sempre significa sangue e riquezas. Nossa única preocupação deveria ser a de sustentara luta agressiva e a de obtera vitória, sem levar em conta o custo e o sacrifício. Os campos não tomados do mundo precisam ter o seu Calvário antes de ter o seu Pentecoste. Raymond Lull, o primeiro missionário ao mundo muçulmano, expressou o mesmo pensamento em linguagem medieval, quando escreveu: "Assim como um homem faminto se apressa a agarrar grandes bocado de alimento por causa de sua grande fome, assim também o Teu servo sente um grande desejo de morrer para que possa Te glorificar.

Ele se apressa, dia e noite, para completar a sua obra a fim de que possa entregar seu sangue e suas lágrimas para serem derramados por Ti".³

"Saudades da Pátria Invertidas"

Os campos ainda não ocupados do mundo aguardam por aqueles que estão prontos a ficar sozinhos por amor a Cristo. Para o Missionário pioneiro as palavras de nosso Senhor Jesus Cristo aos apóstolos, quando mostrou-lhes Suas mãos e Seus pés, têm uma força especial: "Assim como o Pai me enviou, em também vos envio." Ele veio ao mundo, o qual era um grande campo missionário ainda não ocupado. "Veio para o que era seu, e os seus não o receberam." Ele veio e O receberam com escárnio, a Sua vida foi sofrimento e o Seu trono foi a cruz. Assim como Ele veio, Ele espera que vamos. Devemos seguir suas pegadas. O missionário pioneiro, quando vence obstáculos e dificuldades, tem o privilégio não só de conhecer a Cristo e o poder de Sua ressurreição, mas também algo da comunhão do Seu sofrimento. Pois o povo do Tibete ou da Somália, da Mongólia ou do Afeganistão, da Arábia ou do Nepal, do Sudão ou da Abissínia (atual Etiópia), pode ser chamado para dizer com Paulo: "Agora me regozijo nos meus sofrimentos por vós; e preencho o que resta das aflições de Cristo, na minha carne, a favor do seu corpo, que é a igreja" (Col. 1:24; cf. Luc. 21:4 e Mar. 12:44). Trata-se nada menos do que a glória do impossível! Quem naturalmente preferiria deixaro aconchego e o conforto do lar e o carinho do círculo da família para ir buscar uma ovelha perdida, cujo balido mal ouvimos em meio ao ruído da tempestade? Mastal é a glória da tarefa que nem os laços familiares nem as necessidades da família conseguem segurar aqueles que tiveram a visão e o espírito do Grande Pastor. Considerando que os perdidos são ovelhas Suase que Ele nos fez Seus pastores e não Seus mercenários, temos de levá-la de volta.

Embora seja o caminho rude e escarpado

Vou minhas ovelhas buscar no descampo.

"Não há nada melhor nem mais patético para mim", diz o Sr. Forsyth, "do que a maneira pela qual os missionários desaprendem o amor pelo antigo lar, morrem para a sua terra natal e casam seus corações com o povo a quem têm servidoe conquistado; de modo que não conseguem descansar na Inglaterra, mas precisam retornar para sepultar os seus ossos onde gastaram os corações por Cristo. Como parece vulgar o patriotismo comum em comparação com esta saudade às avessas, com esta paixão por um reino que não tem fronteiras nem raça privilegiada, a paixão de um Cristo sem lar!"

James Gilmpur na Mongólia, David Livingstone na África Central, Grenfell no Congo, ta Keith Falconer na Arábia, o Dr. Rijnhart e a Sr. Annie Taylor no Tibete, Chalmers na Nova Guiné, Morrison na China, Henry Martyn na Pérsia (atual Irã), e todos os outros iguais a eles sofreram desta "saudade invertida", esta paixão de chamarde lar o país que tivesse a maior necessidade do evangelho. Nesta paixão, todas as outras desvaneceram; diante desta visão todas as outras se acabaram; este chamado afogou todas as outras vozes. Eles foram os pioneiros do reino, os desbravadores de Deus, ansiosos em cruzar as fronteiras e descobrir novas terras ou ganharum novo império.

O Espírito Pioneiro

Estes desbravadores de Deus não foram com machado e espada, mas com a espada do Espírito e com o fogo da Verdade e abrirem assim caminho para aqueles que vieram depois. Suas cicatrizes foram o selo de seu apostolado, e eles também se gloriaram na tribulação. Como oApóstolo pioneiro, que trazia sempre ne "corpo o morrer de Jesus", foram aprovados como "ministros de Deus: na muita paciência, nas aflições, nas privações, nas angústias, nos açoites, nas prisões nostumultos, nos trabalhos, nasvigílias, nosjejuns".

Thomas Valpy French, Bispo de Lahore, a quem o Dr. Eugene Stock chamava de "o mais notável de todos os missionários da Sociedade Missionária da Igreja", tinha o verdadeiro espírito pioneiro e conhecia a glória do impossível. Depois de quarenta anos de abundantes e frutíferos trabalhos na Índia, ele renunciou à sua posição de bispo e planejou alcançar o interior da Arábia com o evangelho. French era um intelectual e gigante espiritual. "Viver com ele era beber uma atmosfera espiritualmente estimulante. Aquilo que o ar de Engadine (conhecido ponto turístico da Suíça) é para o corpo, a intimidade com ele era para a alma. Acompanhia de era instrutiva. Não havia nada que achasse que um homem não deveria abandonar– lar, esposa, saúde – se a chamada de Deus fosse explícita. Mas todos sabiam que ele só pedia dos outros o que ele mesmo tinha feito e estava sempre fazendo." E quando Mackay, de Uganda, em seu notável pedido de uma missão para os árabes de Omã solicitou "meia dúzia de jovens, a fina flor das universidades inglesas, para se arriscarem pela fé," este veterano de coração de leão com sessenta e seis anos foi o único que respondeu. Era a glória do impossível. Mas de Mascate ele escreveu pouco antes de sua morte:

Se eu não puder conseguir qualquer servo e guia fiel para a viagem pelo interior, um que seja experiente no trato com os árabes e que consiga os suprimentos corriqueiros necessários (eu preciso de muito pouco), posso tentar Bahrein, ou Hodeida e Sana, e se isto falhar, o norte da África novamente, em alguma região da montanhosa; pois sem uma casa própria o clima seria insuportável – pelo menos durante os meses mais quentes – e o trabalho ficaria interrompido. Mas eu não desistirei, se Deus quiser, mesmo temporariamente, dos meus planos para o interior, a não ser que todos os caminhos sejam fechados e seja loucura total tentar pô-los em prática.

"Eu não desistirei – e ele não desistiu até morrer. Nem a igreja de Cristo desistirá da obra pela qual ele e outros iguais a ele deram suas vidas em Omã. E assim por diante.

A Ambição Apostólica

As províncias ainda não ocupadas da Arábia e do Sudão esperam homens com o espírito do Bispo French. Pois a ambição de partir dos centros já ocupados para as regiões mais remotas, mesmo quando estes centros são mal dirigidos e precisam de reforços, não coisa quixotesca ou fantástica, mas realmente apostólica. "Esforçando-me deste modo", dizia Paulo, "por pregaro evangelho, não onde Cristo já fora anunciado, para não edificar sobre fundamento alheio; antes, como está escrito: Hão de vê-lo aqueles que não tiveram notícia dele, e compreendê-lo os que nada tinham ouvido a seu respeito" (Rom. 15:20-24). Ele escreveu isto quando partia de uma cidade tão importante como Corinto, e prosseguiu declarando que este é o motivo para não visitar ainda Roma, mas que desejava fazê-lo em sua ida para a Espanha! Se os confins do império romano faziam parte do seu programa, dele que no primeiro séculojá pregara Cristo de Jerusalém até o Ilírio; nós, certamente, no começo do século vinte, não deveríamos ter ambição menor para entrar em cada campo ainda não ocupado para que O vejam "aqueles que não tiveram notícias dele" e O compreenderam "os que nada tinham ouvido a seu respeito".

Não temos exemplo de um apóstolo que fosse enviado sob a compulsão de uma ordem qualquer. Cada um foi como um amante ao encontro marcado com sua noiva. Tudo era instintivo e natural. Eles foram igualmente controlados pela visão comum, mas tiveram visões pessoais particulares que os levaram para o lugar onde eram necessários. No começo do cristianismo, havia uma ausência de espírito calculista. A maior parte dos apóstolos morreu fora da Palestina, embora a lógica humana os tivesse proibido de abandonar o país antes de este estar cristianizado. O instinto calculista é a morte da fé, e se os apóstolos tivessem permitido que ele controlasse suas motivações e realizações, teriam dito: "A necessidade em

Jerusalém é tão profunda, as nossas responsabilidades para com o povo de nosso próprio sangue são tão óbvias, que temos de viver segundo o princípio de que a caridade começa no lar. Depois de ganharmos o povo de Jerusalém, da Judeia e da Terra santa em geral, então já será tempo para irmos ao estrangeiro; mas os nossos problemas políticos, morais e religiosos são tão insolúveis aqui que seria manifestamente absurdo arcar com novos fardos.

Foi a grandeza da tarefa e sua dificuldade que entusiasmaram a igreja primitiva. Sua aparente impossibilidade foi a sua glória, seu caráter mundial e sua grandeza. O mesmo é verdadeiro hoje. "Eu me sinto feliz", escreveu Neemias do Japão, "em meditarsobre o maravilhoso crescimento do cristianismo no mundo, e creio que se encontrar obstáculos vai avançar ainda mais depressa e mais agilmente, assim como a correnteza é mais rápida quando encontra obstáculos no seu percurso".

Esperança e Paciência

Aquele que trabalha o solo virgem deveria fazê-lo com esperança. Deus nunca desaponta os Seus lavradores. Após a sementeira sempre vem a colheita. "Quando chegamos pela primeira vez ao nosso campo", escreve da Ásia Central o missionário Hogberg, "foi impossível reunir sequer algumas pessoas para que ouvissem as boas novas do evangelho. Nem conseguíamos reunir algumas crianças para ter uma escola. Não podíamos distribuir evangelhos ou folhetos. Quando construímos a missão, construímos também uma pequena capela. Então ficamos imaginando: Será que este recinto vai um dia se encher de muçulmanos para ouvir o evangelho? Nossa capelinha se encheu de ouvintes e foi preciso um recinto maior! Dia após dia, podemos pregar tanto quanto nossas forças nos permitem, e os muçulmanos já não se opõem a ouvir a verdade do evangelho. ‘Antes de vocês chegarem ninguém falava ou pensava em Jesus Cristo, agora se ouve o Seu nome por toda parte'', desse-me um muçulmano. No começo de nosso trabalho eles jogavam fora os evangelhos ou os queimavam, ou os devolviam; agora eles os compram, beijam os evangelhos, encostando-os em suas frontes, apertando-os junto ao coração, demonstram o mais alto respeito que um muçulmano pode demonstrar para com um livro."

Mas o lavrador pioneiro deve ter muita paciência. Quando Judson jazia acorrentado em uma prisão da Birmânia, um companheiro de cela lhe perguntou com um sorriso de desdém sobre as perspectivas de converteros pagãos. Judson respondeu claramente: "As perspectivas são tão brilhantes quanto as promessas de Deus". Hoje quase não há nenhum país que não seja tão acessível, ou onde haja maiores dificuldades, como foi o caso quando Judson enfrentou e superou os problemas na Birmânia.

O Desafio da Porta Fechada

As perspectivas para a evangelização de todos os campos ainda não ocupados são "tão brilhantes como as promessas de Deus". Porque deveríamos aguardar ainda mais para evangelizá-los? "Aevangelização do mundo nesta geração não é umjogo de palavras", diz Robert E. Speer. "Não é um lema para ser atirado de um lado para outro. A evangelização do Mundo neste Geração é a intimação de Jesus Cristo a cada um dos seus discípulos para que se coloque em uma cruz, que ande nas pegadas dAquele que, embora fosse rico, tornou-se pobre por amor a nós, para que nós através de Sua pobreza pudéssemos ser ricos, que não dê valor à sua vida para que Deus possa gastá-la como Cristo gastou a Sua pela redençãodo mundo." Quem fará isto pelos campos ainda não ocupados?

Os estudantes voluntários de hoje não devem descansar satisfeitos até que o lema, que é particularmente seu, encontre aplicação prática nos campos mais negligenciados e mais difíceis, como também nos países onde é hora da colheita e onde o chamado é para ceifeiros em número sempre crescente. O clamor dos destituídos é ainda mais forte do que o da oportunidade. O oportunista não é a última palavra em missões. A porta aberta nos chama; a porta fechada desafia aquele que tem o direito de entrar. Os campos ainda não ocupados do mundo têm, portanto, uma reivindicação de peso e urgência peculiares. "Neste séculovinteda história cristã não deveria haver campos ainda não ocupados. A igreja tem obrigação de remediara lamentável condição com a menor demora possível."

Edificar a Vida, Não Ganhá-la

Os campos não ocupados são portanto um desafio para todos aqueles cujas vidas estão vazias de tudo aquilo que é melhor e mais elevado; para todos cujas vidas estão ocupadas apenas com as coisas fracas ou desprezíveis, que não valem nada. Há olhos que nunca foram iluminados por uma grande visão, mentes que nunca foram tomadas por um pensamento altruísta, corações que nunca se emocionaram cheios de compaixão por causa dos erros de outrem, e mãos que nunca se cansaram nem se fortaleceram com o levantamento de um grande fardo. Para tais, saber da existência destes milhões sem Cristo nas terras ainda não ocupadas deveria vir como um novo chamado da Macedônia e uma visão espantosa da vontade de Deus para eles. Como observa o Bispo Brent: "Nunca sabemos que medida da capacidade moral está à nossa disposição até que tentemos expressá-la em ação. Não é incomum que um empreendimento de certa proporção seja tudo o que um rapaz precisa para determinar e fixar a sua capacidade viril." Haverá um teste mais heroico para os poderes da virilidade do que o trabalho pioneiro em um campo missionário? Eis uma oportunidade para aqueles que em casa talvez nunca descobriram onde exercer suas capacidades latentes, que talvez nunca encontrem um ambiente adequado para todos os poderes de suas mentes e almas. Há centenas de universitários cristãos que esperam passara vida administrando algum tipo de negocio para ganharem a vida, mas que têm força e talento suficientes para penetrar neste campos ainda não ocupados. Hájovens médicos que poderiam reunir à sua volta em algum posto missionário milhares daquelas pessoas que "sofrem os horrores do paganismo e do islamismo", e levantar o fardo de dorque elas carregam, mas eles confiam seus esforços a alguma "Utica particular" onde a arte da cura fica sujeita à lei da competição e é medida muito frequentemente em termos de ganhos e lucros apenas. Eles estão ganhando a vida; poderiam estar edificando a vida.

O Bispo Phillips Brooks uma vez lançou um desafio de uma grande tarefa com estas palavras: "Não orem pedindo vidas fáceis, orem para serem homens mais fortes. Não orem pedindo tarefas segundo as suas forças, orem pedindo forças para as suas tarefas. A execução delas não será então um milagre, mas vocês é que serão um milagre". Ele não poderia ter encontrado palavras mais adequadas se tivesse falado da evangelização dos campos ainda não ocupados do mundo com todas as dificuldades desconcertantes e suas gloriosas impossibilidades. Deus pode nos dar o poder para a tarefa. Ele foi suficiente para aqueles que no passado partiram para o campo e é suficiente para aqueles que partem em nossos dias.

Diante destes milhões nas trevas e na degradação, conhecendo a condição de suas vidas segundo o testemunho indubitável daqueles que visitaram estes países, esta grande tarefa inacabada, esta tarefa ainda não começada, chama hoje por aqueles que estão desejosos de suportare sofrer na sua realização.

Não um Sacrifício, Mas um Privilégio

Quando David Livingstone visitou a universidade de Cambridge, em 4 de dezembro de 1857, ele fez um ardente apelo por aquele continente que era então quase todo um campo ainda não ocupado. As suas palavras, que foram num certo sentido seu último desejo e seu testamento para os universitários no que se refere à África, podem muito bem conclui este livro:

De minha parte, jamais deixei de me regozijar que Deus tenha me designado para um tal trabalho. As pessoas falam do sacrifício que eu fiz gastando tanto de minha vida na África.

Posso chamar de sacrifício o que é simplesmente retribuir uma pequena parte de um grande débito para com o nosso Deus, o qual nunca poderemos pagar? Será que é um sacrifício se traz suas próprias benditas recompensas em atividades sadia, a consciência de fazer o bem, e a paz de espírito e uma bendita esperança de um glorioso destino na vida vindoura? Vamos acabar com essa palavra e com tal pensamento! Com todas as forças digo que não é sacrifício. Digamos, antes, que é um privilégio. A ansiedade, a doença, o sofrimento ou o perigo, de vez em quando, com a ausência das pequenas comodidades e coisas boas da vida, podem nos levar a fazer uma pausa e levar nosso espírito a fraquejar e a alma a se abater; mais isto é só por um momento. Tudo isto é nada quando comparado com a glória que será futuramente revelada em nós e por nós. Eu nunca fiz sacrifício.

Quero chamar a atenção de vocês para a África. Sei que em poucos anos eu morrerei naquela terra, que agora está aberta. Não permitam que ela se feche de novo! Eu volto para a África para tentar abrir um caminho desimpedido para o comércio e o cristianismo.

Continuem a obra que eu comecei. Eu a deixo para vocês.

Perguntas Para Estudo

1. Responda à pergunta de Zwemer: "Haverá um teste mais heroico

para os poderes da virilidade do que o trabalho pioneiro em um campo missionário? Explique.

2. Os desafios deste artigo trazem inspiração ou desassossego para a

sua vida? Exprima com suas próprias palavras o desafio deste artigo.

Notas Finas

1. Sermão intitulado "Our Omnipotent Leader" ("Nosso Líder Onipotente") em The Evangelization of

the World ("A evangelização do Mundo"; Londres, 1887). 2. "Human Bullets" ("Projéteis Humanos"), uma novela por Tadyoshi Sakurai. A experiência de um oficial japonês em Port Arthur e a revelação do patriotismo e obediência japonesa. 3. Raymond Lull, "Liber de Contemplations in Deo", citado na biografia escrita por Samuel M.

Zwemer, Raymond Lull: First Missionary to the Moslems ("Raymond Lull: O Primeiro Missionário aos Muçulmanos"; Nova Iorque e Londres: Funk and Wagnalls, 1902), p.132. 4. P. T. Forsyth, Missions in State and Church: Sermons and Addresses ("As Missões diante do

Estado e da Igreja: Sermões e Palestras"; Nova Iorque: A. C. Armstrong, 1908), p 36. 5. Sr.ª J. W. Harrison, "Mackay of Uganda" ("Mackey de Uganda"), pp. 417-430. 6. S. M. Zwemer, Arabia: The Cradle of Islam; studies in one georgraphy, people and politics of one península, with na account of Islam and mission work... ("Arábia: o berço do Islam; estudos sobre a geografia, população e política da península, com um relato acerca do islamismo e do trabalho missionário..."; Nova Iorque: F. H. Revelll, 1900, p. 350. 7. Charles H. Brent, Adventure for God ("Uma aventura em Nome de Deus"; Nova Iorque:

Longmans, Green, 1905),pp. 11-12. 8. Robert E. Speer, Missionary Principles and Practice: a discussion of Christian missions ando f some criticisms upon them ("Princípios e Práticas Missionários: Uma análise das missões cristãs e de algumas críticas que lhes são feitas"; Nova Iorque: Fleming H. Revell, 1902), p.541. 9. Carta escrita à Comissão nº 1, Conferência Missionária Mundial, Edimburgo, 1910. 10. Arthur Judson Brown, The Foreign Missionary; na incarnation of a world movement ("O

Missionário Estrangeiro: a encarnação de um movimento mundial"; Nova Iorque: Fleming H.

Revell, cl932), p.374. 11. Speer,op.Cit.,p.526. 12. Anais da conferência Missionária Mundial, Edimburgo, 1910, Volume I. 13. Brent,op.Cit.,p.135.

14. Phillips Brooks, Twenty Sermons ("Vinte Sermões"; Nova Iorque: E. P. Dutton & Co., 1903), p.

330. 15. William Garden Balikie, Personal Lifee of David Livingstone... ("A vida Pessoal de David

Livingstone"; Nova Iorque: Harper& Bros., 1895?), pp. 243-244.

Extraído de The Unoccupied Mission Fields os Africa and Asia ("Os Campos Missionários Não Ocupados na África e na Ásia"). Student VolunteerMovement for Foreign Missions, Capítulo 8, pp. 215-231,19911.', 54
  from cursos where slug = 'perspectivas';

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 57;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 6 · Leitura — Koch: A crescente força missionária não ocidental', 'A crescente força missionária não

ocidental

Bruce A. Koch

Em um livro intitulado From Every People (De todos os povos), Larry Pate fez uma projeção ousada em 1989. Ele estimou que, até o ano2000, a maioria dos missionários protestantes seria do mundo não ocidental. Essa projeção surpreendente gerou grande interesse e foi citada com frequência.

No ano de 2004, Michael Jaffarian apontou que a projeção de Pate comparava o total de missionários estrangeiros e domésticos no exterior com apenas os missionários estrangeiros do Ocidente.

Para corrigir a distorção, Jaffarian comparou apenas os missionários estrangeiros de ambos os mundos. Seus resultados mostraram que a força missionária estrangeira não ocidental havia crescido impressionantes 210% de 1990 a 2000, em comparação com o crescimento de 12% daforça missionária estrangeira ocidental. No entanto, no ano 2000, a força missionária estrangeira ocidental ainda era 3,5 vezes maior (70.000) do que sua contraparte não ocidental (20.000).

A análise de Jaffarian levantou a seguinte questão: "O que veríamos se comparássemos os totais de missionários transculturais estrangeiros e nacionais?" Essa comparação ignoraria efetivamente o fator de cruzar fronteiras.

Fazendo os mesmos ajustes que Jaffarian fez, descobri que, entre 1990 e 2000, a força missionária transcultural ocidental era apenas 56% maior, em vez de 350% maior, como Jaffarian havia descoberto ao comparar apenas os missionários estrangeiros. Durante essa década, a força não ocidental cresceu oito vezes mais rápido do que suas contrapartes ocidentais! Ao projetar essas taxas de crescimento para 2010, obtemos o gráfico abaixo:

Embora o método de Pate possa ter sido falho, ele estava correto ao nos alertar sobre uma tendência inegável. Se minha análise estiver próxima da realidade, Pate não estava muito longe. Aforça da missão transcultural do mundo não ocidental pode ter ultrapassado a força dos países tradicionais de envio no Ocidente por volta de 2005.

Somos muito incentivados e desafiados pelo compromisso da Igreja no que hoje é "o Mundo Majoritário" para concluir a tarefa da evangelização

Jonathan Edwards, "A Humble Attempt", The Works of President Edwards, Vol. 3 (Nova York: Leavitt, Trow and Co., 1818), pp. 432, 433. O discurso completo, que abrange as páginas 423-508, levanta a promessa de um reavivamento mundial e a necessidade de orar em conjunto por ele, mais do que qualquer outro escrito na língua inglesa. O apelo por concertos de oração também aparece no ministério de George Whitefield durante esse mesmo período e, de fato, continuou nos esforços de reavivamento durante o século XIX. Nos últimos anos, ele foi retomado por vozes internacionais como o Comitê de Lausanne para a Evangelização Mundial. Para uma exposição contemporânea do movimento e orientações práticas sobre como se envolver, consulte With Concerts of Prayer (Ventura: Regal Books, 1 984), de David Bryant; ou seu mais recente, Operation: Prayer (Madison: Inter-Varsity Christian Fellowship, 1987); J. Edwin Orr fornece o contexto histórico em The Eager Feet: Evangelical Awakenings, 1 790-1 830 (Chicago: Moody Press, 1975). Billy Graham, "The King is Coming", em Let the Earth Hear His Voice, Official Reference Volume for International Congress on World Evangelization, Lausanne, Switzerland, ed., J. D. Douglas (Minneapolis World Wide Publications, 1975), p. 1466. J. D. Douglas (Minneapolis: World Wide Publications, 1975), p. 1466.

mundial. Como Beram Kumar destaca a força missionária não ocidental não está mais emergindo - está mais para emergente.

Referências:

1. Larry D. Pate, Every People: A Handbook of Two Thirds World Missions (Monrovia, A: MARC, 1989), pp.47,51,54.

2. Michael Jaffarian, "Are There More Non-Western Missionaries than Western

Missionaries?" (Há mais missionários não ocidentais do que missionários ocidentais?) (IBMR 28:3, ano 2004, pp. 129-130).', 57
  from cursos where slug = 'perspectivas';

commit;
