-- 276_perspectivas_licao2.sql
-- Lição 2 ("A história de Sua glória"): o guia de estudo e as três leituras
-- enviadas — Hawthorne cap. 4 (que veio em quatro PDFs e aqui volta a ser um
-- capítulo só), Adeney e Dearborn. Faltam ainda Piper (cap. 5),
-- Blackaby/Willis (cap. 6), Lewis (cap. 7) e Verkuyl (cap. 8), que o guia
-- também indica.
--
-- Reescreve de passagem as duas aulas do Stott da Lição 1: a abertura de
-- capítulo saía corrompida. Na página de abertura a assinatura do autor e o
-- número do capítulo ficam na MESMA linha, em lados opostos — pela divisão de
-- colunas o número caía na coluna do texto e virava o começo do capítulo,
-- enquanto a assinatura ia parar na caixa de bio. Além disso a letra capitular
-- era confundida com o número do capítulo. Agora a abertura é lida como uma
-- faixa própria, acima do corpo.
--
-- Transcrição literal: só se desfaz o que a extração quebrou. Conferido por
-- contagem de caracteres contra a fonte — nenhuma letra falta em nenhuma das
-- peças; a diferença é só hífen de fim de linha (que some ao religar a palavra
-- partida) e número de página.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 2) then
    update aulas set titulo = $t$Lição 1 · Leitura — Stott, cap. 3: O Deus vivo é um Deus missionário$t$, conteudo = $conteudo$O Deus vivo é um Deus missionário

John R. W. Stott

Milhões de pessoas no mundo de hoje são extremamente hostis ao empreendimento missionário cristão. Elas o consideram politicamente prejudicial (porque enfraquece os laços que unem a cultura nacional) e religiosamente tacanho (porque reivindica exclusividade para Jesus), enquanto os que se envolvem com missões são tidos como imperialistas arrogantes. O esforço para converter as pessoas a Cristo é visto como uma imperdoável interferência na vida pessoal. “Minha religião é assunto meu”, dizem. “Trate de seus próprios negócios e me deixe com os meus.”

Portanto, é essencial que os cristãos entendam as bases sobre as quais repousa a missão cristã. Só então seremos capazes de perseverar na tarefa missionária, com coragem e humildade, apesar da incompreensão e oposição do mundo. Mais precisamente, os cristãos bíblicos precisam de estímulos bíblicos, pois cremos que a Bíblia é a revelação de Deus e de sua vontade. Por isso, perguntamos: ele revelou nas Escrituras que a obra missionária é sua vontade para seu povo? Só então ficaremos satisfeitos. Pois então as missões se tornarão uma questão de obediência a Deus, a despeito do que os outros possam pensar ou dizer. Iremos aqui nos concentrar no Antigo Testamento, embora toda a Bíblia seja rica em evidências acerca do propósito missionário de Deus.

A chamada de Abraão

Nossa história começa cerca de 4 mil anos atrás, com um homem chamado Abraão, ou mais exatamente Abrão, como ele era chamado naquele tempo. Eis a narrativa da chamada de Abraão:

Disse o Senhor a Abrão: Sai da tua terra, da tua parentela e da casa de teu pai e vai para a terra que te mostrarei; de ti farei uma grande nação, e te abençoarei, e te engrandecerei o nome. Sê tu uma bênção! Abençoarei os que te abençoarem e amaldiçoarei os que te amaldiçoarem; em ti serão benditas todas as famílias da terra.

Partiu, pois, Abrão, como lho ordenara o Senhor, e Ló foi com ele. Tinha Abrão setenta e cinco anos quando saiu de Harã (Gn 12.1-4).

Deus fez uma promessa (complexa, conforme veremos) a Abraão, e para entender a Bíblia e a missão cristã é indispensável entender essa promessa. Talvez esses sejam os versículos que melhor resumem a Bíblia. Todo o propósito de Deus encontra-se condensado aqui.

Como introdução, iremos considerar o cenário da promessa de Deus, o contexto no qual ela foi feita. Então dividiremos em dois o restante de nosso estudo. Na primeira parte, destacaremos a promessa, isto é,o que Deus disse que faria. Na segunda parte, analisaremos, de maneira mais extensa, o cumprimento da promessa,ou seja, como Deus a tem cumprido e irá cumpri-la ainda. Comecemos, entretanto, com o cenário.

Gênesis 12 começa assim: “Ora disse o Senhor a Abrão...”. Parece uma forma abrupta de começar um novo capítulo. Somos levados a perguntar. “Quem é esse ‘Senhor’ que falou a Abrão? Quem é esse ‘Abrão’ a quem ele falou?”. Eles não são introduzidos no texto abruptamente. Há muita coisa por trás dessas palavras. Elas constituem uma chave que abre o todo das Escrituras. Os 11 capítulos anteriores conduzem a elas. O restante da Bíblia é consequência e cumprimento dessas palavras.

O que, então, existe por trás desse texto? É o seguinte: o “Senhor” que escolheu e chamou Abraão é o mesmo que no começo criou os céus e a terra e atingiu o clímax de sua obra criadora trazendo à existência o homem e a mulher, criaturas únicas feitas à semelhança dele. Jamais devemos esquecer que a Bíblia começa com o Universo, não com o planeta Terra; então, com a Terra, não com a Palestina; depois com Adão, na qualidade de pai da raça humana, não com Abraão, o pai da raça escolhida. Considerando, então, que Deus é o Criador do Universo, da Terra e de toda a humanidade, não devemos nunca rebaixá-lo à condição de divindade tribal ou a de um deus insignificante, como Quemos, deus dos moabitas, ou Milcom (Moloque), deus dos amonitas, ou Baal, o deushomem, ou Astarote, a deusa-mulher dos cananeus. Não devemos supor também que Deus escolheu Abraão e seus descendentes por haver perdido o interesse nos outros povos ou porque desistisse deles. Eleição não é sinônimo de elitismo. Pelo contrário, como veremos logo a seguir, Deus escolheu um homem e sua família, a fim de abençoar por meio deles todas as famílias da terra.

Portanto, ficamos profundamente magoados quando vemos o cristianismo relegado a um capítulo dentro de um livro sobre as religiões do mundo, como se fosse uma opção entre muitas, ou quando alguém faz referência ao “Deus cristão”, como se houvesse outros! Não, existe apenas um único Deus vivo e verdadeiro, que se revelou totalmente e, por fim, em seu único Filho Jesus Cristo. O monoteísmo jaz no alicerce das missões, como Paulo escreveu a Timóteo: “Há um só Deus e um só Mediador entre Deus e os homens, Cristo Jesus, homem” (1Tm 2.5).

O registro de Gênesis prossegue desde a criação de todas as coisas pelo Deus único e dos seres humanos conforme a semelhança divina, até nossa rebeldia contra nosso Criador e o julgamento de Deus sobre suas criaturas rebeldes. Esse julgamento, entretanto, é atenuado pela primeira promessa evangélica de que um dia a semente da mulher “pisaria” — na realidade “esmagaria” — a cabeça da serpente (3.15).

Os oito capítulos seguintes (Gn 4—11) descrevem os resultados devastadores da Queda: a alienação progressiva dos seres humanos em relação a Deus e aos outros seres humanos. Esse foi o cenário no qual Deus chamou e fez a promessa a Abraão. Tudo à volta era deterioração moral, trevas e dispersão. A sociedade se desintegrava cada vez mais. Todavia, Deus, o Criador, não abandonou os seres humanos que criara à sua semelhança (Gn 9.6). Dessa constante impiedade, ele chamou um homem e sua família e prometeu abençoar não apenas a eles, mas, por meio deles, a todo o mundo. A dispersão não continuaria descontroladamente: um grande processo de reunião estava começando.

A promessa

Qual foi, então, a promessa que Deus fez a Abraão? Foi uma promessa complexa que consistia de diversas outras promessas.

Primeira: a promessa de uma posteridade. Ele devia deixar sua parentela e a casa de seu pai e, em troca da perda da família, Deus faria dele “uma grande nação”. Mais tarde, para indicar isso, Deus mudou o nome do patriarca de “Abrão” (“pai exaltado”) para “Abraão” (“pai de uma multidão”) e lhe disse: “Por pai de numerosas nações te constituí” (Gn 17.5).

Segunda: a promessa de uma terra. Parece que o chamado divino veio em duas etapas. Primeiramente, em Ur dos caldeus, quando o pai de Abraão ainda vivia (11.31; 15.7), e depois em Harã, após da morte de seu pai (11.32; 12.1). De qualquer modo, ele devia deixar sua terra natal, e, em troca, Deus lhe mostraria outra.

Terceira: a promessa de uma bênção. Cinco vezes as palavras “bênção” e “abençoar”aparecem em 12.2,3. A bênção que Deus prometeu a Abraão transbordaria sobre toda a humanidade.

Uma posteridade, uma terra e uma bênção. Cada uma dessas promessas é desenvolvida nos capítulos que se seguem à chamada de Abraão.

Em primeiro lugar, a terra. Depois que Abraão generosamente permitiu que seu sobrinho Ló escolhesse onde queria se estabelecer (Ló escolheu o fértil vale do Jordão), Deus disse ao patriarca: “Ergue os olhos e olha desde onde estás para o norte, para o sul, para o oriente e para o ocidente; porque toda essa terra que vês, eu ta darei, a ti e à tua descendência, para sempre” (13.14,15).

Em segundo lugar, a posteridade. Um pouco mais tarde, Deus apresentou a Abraão outro recurso ilustrativo, convidando-o agora a olhar não para a terra, mas para o céu. Numa noite escura e desanuviada, Deus levou-o para fora de sua tenda e ordenou-lhe: “Olha para os céus e conta as estrelas”. Que ordem ridícula! Talvez Abraão tivesse começado: “Uma, duas, três, cinco, dez, vinte, trinta...”, mas deve ter desistido logo. Era uma tarefa impossível. Então Deus lhe disse: “Será assim tua posteridade”. E lemos. “Ele creu no Senhor”. Embora provavelmente já estivesse com mais de 80 anos de idade e ele e Sara não tivessem filhos ainda, Abraão creu na promessa de Deus, “e isso lhe foi imputado para justiça” por Deus. Isto é, pelo fato de ele haver confiado em Deus, O Senhor o aceitou como justo.

Em terceiro lugar, a bênção. “[Eu] te abençoarei” — Deus já havia aceitado Abraão como justo ou, tomando emprestada a expressão neotestamentária, “justificado pela fé”. Não podemos imaginar bênção maior. É a bênção fundamental da aliança da graça, a qual alguns anos mais tarde Deus esmiuçaria para Abraão: “Estabelecerei a minha aliança entre mim e ti e a tua descendência [...] aliança perpétua, para ser o teu Deus e da tua descendência. [...] e serei o seu Deus” (17.7,8). Deus instituiu a circuncisão como sinal exterior e visível da aliança da graça ou como penhor de que era o seu Deus. É a primeira vez nas Escrituras que ouvimos a fórmula da aliança, repetida muitas vezes mais tarde: “Eu serei o seu Deus, e eles serão o meu povo”.

“Uma terra, uma posteridade, uma bênção: mas que relação tem tudo isso com missões?”, talvez você se pergunte, impaciente. Minha resposta é: “Tudo! Seja um pouco mais paciente e verá”. Passemos agora da promessa para o cumprimento.

O cumprimento da promessa

Toda a questão do cumprimento das profecias do Antigo Testamento apresenta dificuldades, havendo sempre muitos mal-entendidos e quase nenhum acordo. De importância particular é o princípio, com o qual acho que todos concordamos, de que os autores do Novo Testamento entendiam que a profecia do Antigo Testamento não tinha um único cumprimento,mas que em geral era triplo — passado, presente e futuro. O cumprimento passado fora imediato, ou histórico, na vida da nação de Israel. O cumprimento presente era intermediário, ou evangélico, em Cristo e sua Igreja. O cumprimento futuro será final, ou escatológico, no novo céu e na nova terra.

A promessa de Deus a Abraão teve cumprimento histórico imediato em seus descendentes carnais, o povo de Israel

A promessa de uma posteridade numerosa, realmente incontável, feita por Deus a Abraão foi confirmada ao seu filho Isaque (26.4, “como as estrelas dos céus”) e ao seu neto Jacó (32.12, “como a areia do mar”). A promessa, aos poucos, começou a se cumprir literalmente. Talvez devêssemos examinar algumas das etapas desse desenvolvimento.

A primeira etapa refere-se aos anos de escravidão no Egito, dos quais se escreveu: “Os filhos de Israel foram fecundos, e aumentaram muito, e se multiplicaram, e grandemente se fortaleceram, de maneira que a terra se encheu deles” (Êx 1.7; comp. com At 7.17). A etapa seguinte ocorreu centenas de anos mais tarde, quando o rei Salomão declarou que Israel era um “povo grande, tão numeroso, que se não pode contar” (1Rs 3.8). A terceira etapa teve lugar cerca de 350 anos depois de Salomão. Jeremias advertiu Israel do juízo e do cativeiro iminentes e, então, acrescentou esta promessa divina de restauração: “Como não se pode contar o exército dos céus, nem medir-se a areia do mar, assim tornarei incontável a descendência de Davi, meu servo” ( Jr 33.22).

Tudo isso diz respeito à posteridade de Abraão: e o que dizer da terra? Mais uma vez, observamos com atitude de adoração e gratidão a fidelidade de Deus à sua promessa, pois foi lembrando sua promessa a Abraão, a Isaque e a Jacó que Deus libertou seu povo da escravidão no Egito e lhe deu o território que nessa narrativa é chamado “terra prometida” (Êx 2.24; 3.6; 32.13). Então, cerca de 700 anos depois, trouxe-os de volta a essa terra, após o cativeiro na Babilônia. Não obstante, nem Abraão nem seus descendentes físicos herdaram totalmente a terra. Como diz Hebreus 11, eles “morreram na fé, sem ter obtido as promessas”. Pelo contrário, como “estrangeiros e peregrinos sobre a terra”, eles aguardavam “a cidade que tem fundamentos, da qual Deus é o arquiteto e edifi - cador” (Hb 11.8-16,39,40).

Deus cumpriu suas promessas sobre a posteridade e a terra, pelo menos parcialmente. E as bênçãos? Bem, no Sinai, Deus confirmou e esclareceu sua aliança com Abraão e se comprometeu a ser o Deus de Israel (v. Êx. 19.3-6). No restante do Antigo Testamento, Deus continuou abençoando os obedientes, enquanto os desobedientes caíram sob seu juízo.

Talvez o exemplo mais dramático esteja no início da profecia de Oseias, na qual ele é orientado a dar a seus três filhos nomes que indicam o juízo divino, horrível e progressivo que se abaterá sobre Israel. Seu primogênito (um menino) foi chamado Jezreel, que significa “Deus dispersará”. Depois nasceu uma menina, LoRuama (arc), ou seja, Desfavorecida, pois Deus declarou que não teria mais piedade nem perdoaria seu povo. Finalmente, Oseias teve outro filho, Lo-Ami (arc), isto é, Não-Meu-Povo, pois Deus disse que eles não eram mais seu povo. Que nomes terríveis para o povo escolhido de Deus! Parece uma devastadora contradição da promessa eterna de Deus a Abraão.

Contudo, Deus não parou aí. Além do iminente juízo, haveria uma restauração, afirmada em palavras que mais uma vez fazem eco à promessa feita a Abraão: “Todavia, o número dos filhos de Israel será como a areia do mar, que se não pode medir, nem contar” (Os 1.10). Assim, o juízo implícito nos nomes dos filhos de Oseias seria invertido. Haverá um ajuntamento, em vez de dispersão ( Jezreel é uma palavra ambígua e também pode ter esse significado). Desfavorecida será favorecida, e Não-MeuPovo se transformará em “filhos do Deus vivo” (1.10—2.1).

É maravilhoso que os apóstolos Paulo e Pedro citassem esses versículos de Oseias. Eles viram seu cumprimento não apenas numa futura multiplicação de Israel, mas na inclusão dos gentios na comunidade de Jesus. “Antes, não éreis povo, mas, agora, sois povo de Deus, que não tínheis alcançado misericórdia, mas, agora, alcançastes misericórdia” (1Pe 2.9,10; v. Rm 9.25,26).

Essa perspectiva do Novo Testamento é essencial quando lemos as profecias do Antigo Testamento, pois o que sentimos faltar no Antigo Testamento é uma explicação clara acerca de como a prometida bênção de Deus transbordaria de Abraão e seus descendentes para “todas as famílias da terra”. Embora Israel seja descrito como “luz” para as nações e tenha a missão de levar a justiça a todos os povos (Is 42.1-4,6; 49.6), não é o que vemos acontecendo. Só no Senhor Jesus que essas profecias são cumpridas, pois apenas no seu Dia é que as nações são de fato incluídas na comunidade dos remidos. É para isso que nos voltamos agora.

A promessa de Deus a Abraão recebe cumprimento intermediário, ou evangélico, em Cristo e sua Igreja

“Abraão” é quase a primeira palavra do Novo Testamento, pois o evangelho de Mateus começa assim: “Livro da genealogia de Jesus Cristo, filho de Davi, filho de Abraão. Abraão gerou a Isaque...”. Portanto, Mateus relaciona com Abraão não só o começo da genealogia, mas também o início do evangelho de Jesus Cristo. Ele sabe que está registrando o cumprimento das antigas promessas de Deus a Abraão, feitas cerca de 2 mil anos antes (v. Lc 1.45- 55,67-76).

Desde o começo, porém, Mateus reconhece que não é simplesmente a descendência física de Abraão que qualifica o ser humano a herdar as promessas, mas uma descendência espiritual, isto é, o arrependimento e a fé no Messias que havia de vir. Esta era a mensagem de João Batista às multidões que se ajuntavam para ouvi-lo: “Não comeceis a dizer entre vós mesmos: Temos por pai a Abraão; porque eu vos afirmo que destas pedras Deus pode suscitar filhos a Abraão” (Mt 3.9; v. Lc 3.9; Jo 8.33-40). As implicações de suas palavras devem ter assustado seus ouvintes, uma vez que “era crença generalizada que nenhum dos descendentes de Abraão se perderia”.

Deus suscitou filhos a Abraão não de pedras, mas de uma fonte igualmente improvável, isto é, dos gentios! Portanto, Mateus, embora seja o mais judeu dos quatro escritores dos evangelhos, ele registra estas palavras de Jesus: “Digo-vos que muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus. Ao passo que os filhos do reino serão lançados para fora, nas trevas” (Mt 8.11,12; v. Lc 13.28,29).

É difícil imaginar o choque, a total confusão que essas palavras devem ter causado entre os ouvintes judeus de João Batista e Jesus. Eles eram descendentes de Abraão, portanto eles tinham direito às promessas que Deus fizera a Abraão. Quem eram, então, aqueles estranhos que iriam participar das promessas, aparentemente até usurpá-las, enquanto eles próprios seriam desqualificados? Os judeus ficaram indignados. Eles haviam esquecido completamente que a aliança de Deus com Abraão continha a promessa de um transbordamento de bênçãos sobre todas as nações da terra. Agora os judeus tinham de entender que era por meio Jesus, o Messias, ele próprio semente de Abraão, que todas as nações seriam abençoadas.

Parece que o apóstolo Pedro pelo menos começou a perceber essa realidade em seu segundo sermão após o Pentecostes. Ele se dirigiu a uma multidão de judeus com estas palavras: “Vós sois os filhos dos profetas e da aliança que Deus estabeleceu com vossos pais, dizendo a Abraão: Na tua descendência, serão abençoadas todas as nações da terra. Tendo Deus ressuscitado o seu Servo, enviou-o primeiramente a vós outros para vos abençoar, no sentido de que cada um se aparte das suas perversidades” (At 3.25,26). É uma declaração muito notável porque interpreta a bênção em termos morais de arrependimento e justiça, porque, se Jesus foi enviado “primeiro” aos judeus, ele foi presumivelmente enviado depois aos gentios, às “famílias da terra” que estavam “longe” (v. At 2.39), mas agora participariam das bênçãos.

Foi concedido ao apóstolo Paulo desenvolver plenamente esse maravilhoso tema. Ele foi chamado e designado para ser o apóstolo dos gentios, e a ele foi revelado o propósito eterno — e até então secreto — de Deus: tornar os judeus e os gentios “co-herdeiros, membros do mesmo corpo e coparticipantes da promessa em Cristo Jesus por meio do evangelho” (Ef 3.6).

Negativamente, Paulo declara com grande ousadia: “Nem todos os de Israel são, de fato, israelitas; nem por serem descendentes de Abraão são todos seus filhos” (Rm 9.6,7).

Quem são, então, os verdadeiros descentes de Abraão, os verdadeiros beneficiados pelas promessas de Deus? Paulo não deixa nenhuma dúvida. São os crentes em Cristo, de qualquer raça. Em Romanos 4, ele destaca que Abraão não só foi justificado pela fé, mas também recebeu essa bênção antes de ser circuncidado. Portanto, Abraão é o pai de todos os que, circuncidados ou não (isto é, judeus ou gentios), seguem o exemplo de sua fé (Rm 4.9-12). Se participamos da fé de Abraão, então “Abraão é pai de todos nós, como está escrito: Por pai de muitas nações te constituí” (v. 16,17). Portanto, nem a descendência física de Abraão nem a circuncisão física do judeu tornam a pessoa um verdadeiro filho de Abraão, e sim a fé. Os verdadeiros descendentes de Abraão são os crentes em Jesus Cristo, judeus ou gentios.

Qual é, então, a “terra” que os descendentes de Abraão herdaram? A carta aos Hebreus menciona um “descanso” no qual o povo de Deus entra agora pela fé (Hb 4.3). Numa expressão notável, Paulo menciona que “a Abraão ou a sua descendência coube a promessa de ser herdeiro do mundo” (Rm 4.13). Só podemos presumir que ele quis dizer a mesma coisa quando escreveu aos coríntios, dizendo que em Cristo “tudo é vosso: seja Paulo, seja Apolo, seja Cefas, seja o mundo, seja a vida, seja a morte, sejam as coisas presentes, sejam as futuras, tudo é vosso” (1Co 3.21-23). Os cristãos, pela maravilhosa graça de Deus, são co-herdeiros do Universo com Cristo.

Um ensino semelhante sobre a natureza da bênção prometida e seus beneficiários é apresentado por Paulo em Gálatas 3. Ele explica como Abraão foi justificado pela fé e acrescenta: “Sabei, pois, que os da fé é que são filhos de Abraão” (v. 6-9). Qual é, então, a bênção com a qual todas as nações foram abençoadas (v. 8)? Em uma palavra, é a bênção da salvação. Estávamos sob a maldição da lei, mas Cristo nos remiu, tornando-se maldição em nosso lugar, “para que a bênção de Abraão chegasse aos gentios, em Jesus Cristo, a fim de que recebêssemos, pela fé, o Espírito prometido” (v. 10-14). Cristo tomou sobre si nossa maldição, a fim de que pudéssemos herdar a bênção de Abraão, isto é, a bênção da justificação (v. 8), e a habitação do Espírito Santo (v. 14). Paulo resume essa realidade no versículo 29: “Se sois de Cristo, também sois descendentes de Abraão e herdeiros segundo a promessa”.

Mas ainda não terminamos. Temos o terceiro estágio de cumprimento: o que está por vir.

A promessa de Deus a Abraão terá um cumprimento final, ou escatológico, no destino final de todos os redimidos

No livro de Apocalipse, há outra referência à promessa de Deus a Abraão (7.9ss). João vê numa visão uma “grande multidão que ninguém podia enumerar”. É uma multidão internacional, vinda “de todas as nações, tribos, povos e línguas”. Ela está “em pé diante do trono”, o símbolo do Reino de Deus. Isto é, seu Reino chegou finalmente, e a multidão está desfrutando todas as bênçãos de seu afável governo. Ela está abrigada em sua presença. Seus dias de fome, sede e calor no deserto se acabaram. Finalmente, ela entrou na terra prometida, descrita agora não como “uma terra que mana leite e mel”, mas como uma terra irrigada com fontes de “água viva”, que jamais secarão. Mas como a multidão herdou essas bênçãos? Em parte, porque veio “da grande tribulação” (evidentemente uma referência à vida cristã com todas as suas provações e sofrimentos), mas principalmente porque “lavaram suas vestiduras e as alvejaram no sangue do Cordeiro”, isto é, foram purificados do pecado e vestidos de justiça pelos méritos da morte de Jesus Cristo, “razão por que se acham diante do trono de Deus”.

É comovente vislumbrar na eternidade futura o cumprimento final dessa antiga promessa de Deus a Abraão. Todos os elementos essenciais da promessa podem ser identificados. Aí estão os descendentes espirituais de Abraão, uma “grande multidão que ninguém podia enumerar”, incontáveis como os grãos de areia da praia e as estrelas do céu. Estão aí também “todas as famílias da terra” sendo abençoadas, pois a multidão inumerável é composta de pessoas de todas as nações. Aí está ainda a terra prometida, a saber, todas as ricas bênçãos que fluem do governo cheio da graça de Deus. E, acima de tudo, está Jesus Cristo, a semente de Abraão, que derramou seu sangue por nossa redenção e concede suas bênçãos a todos os que o invocam para serem salvos.

Conclusão

Iremos resumir o que aprendemos acerca de Deus com base em sua promessa a Abraão e o seu cumprimento, destacando cinco características.

Primeira: ele é o Deus da História. A História não é um fluxo de acontecimentos ao acaso. Deus executa, no devido tempo, o plano que concebeu na eternidade passada e será consumado na eternidade futura. No processo histórico, Jesus Cristo, na qualidade de semente de Abraão, é a figura-chave. Regozijemo-nos pelo fato de que, sendo discípulos de Cristo, somos descendentes de Abraão. Pertencemos à sua linhagem espiritual. Se recebemos as bênçãos da justificação pela fé, a aceitação de Deus e a habitação do Espírito, então somos hoje os beneficiários da promessa feita a Abraão há 4 mil anos.

Segunda: ele é o Deus da aliança. Isto é, Deus é suficientemente bom e afável para fazer promessas, e ele sempre cumpre o que promete. Ele é um Deus de amor e fidelidade contínuos. Preste atenção: nem sempre ele cumpre suas promessas imediatamente. Abraão e Sara “morreram na fé, sem ter obtido as promessas; vendo-as, porém, de longe” (Hb 11.13). Ou seja, embora Isaque lhes nascesse em cumprimento da promessa, a semente do casal ainda não era numerosa, nem eles herdaram a terra, nem as nações haviam sido abençoadas. Todas as promessas de Deus se realizam, mas elas são herdadas “pela fé e pela longanimidade” (Hb 6.12), isto é, pela paciência. Devemos nos contentar em esperar a hora divina.

Terceira: ele é o Deus da bênção. “[Eu] te abençoarei”, foi o que disse a Abraão (Gn 12.2). “Deus [...] enviou-o [ Jesus] primeiramente a vós outros para vos abençoar”, exclamou Pedro (At 3.26). A atitude de Deus para com seu povo é positiva, construtiva, enriquecedora. O juízo é sua “obra estranha” (Is 28.21). Sua principal obra e característica é abençoar a humanidade com a salvação.

Quarta: ele é o Deus da misericórdia. Sempre recebi muito alento da declaração de Apocalipse 7.9, segundo a qual a multidão dos remidos no céu será “uma grande multidão que ninguém podia enumerar”. Não tenho a pretensão de saber como será, uma vez que os cristãos sempre parecem ser uma minoria, mas as Escrituras declaram isso para alento nosso. Embora nenhum cristão bíblico possa ser universalista (crendo que toda a humanidade será finalmente salva), uma vez que as Escrituras ensinam a terrível realidade e a eternidade do inferno, o cristão bíblico pode (e até deve) afirmar que os remidos serão, de algum modo, uma multidão internacional tão imensa que não poderá ser contada. A promessa de Deus será cumprida, e a semente de Abraão será tão numerosa quanto o pó da terra, as estrelas do céu e a areia da praia.

Quinta: ele é o Deus das missões. As nações não são reunidas automaticamente. Se Deus prometeu abençoar “todas as famílias da terra”, ele pretendia fazê-lo por meio da descendência de Abraão (Gn 12.3; 22.18). Somos a semente de Abraão pela fé, e as famílias da terra só serão abençoadas se formos a elas com o evangelho. Esse é o propósito explícito de Deus.

Oro para que a expressão “todas as famílias da terra” seja gravada em nosso coração. Ela, mais que qualquer outra, revela o Deus vivo da Bíblia como um Deus missionário. Essa expressão também condena o denominacionalismo mesquinho, o nacionalismo estreito, o orgulho racial (branco ou negro), o paternalismo condescendente e o imperialismo arrogante. Como nos atrevemos a adotar uma atitude hostil, desdenhosa ou mesmo indiferente para com qualquer pessoa de outra cor ou cultura se nosso Deus é o Deus de “todas as famílias da terra”? Precisamos nos tornar cristãos globais, com uma visão global, pois temos um Deus global.

Portanto, que Deus nos ajude a nunca esquecer a antiga promessa de 4 mil anos feita a Abraão: “Em ti e na tua descendência serão abençoadas todas as famílias da terra”.

Perguntas para estudo

1.De acordo com Stott, por que é importante conhecer a base sobre a qual repousa a missão

cristã? Por quais outras razões o conhecimento de tal base é importante?

2.Qual o contexto da promessa feita por Deus a Abraão? Como foi que a promessa de uma

terra, de uma posteridade e de uma bênção se cumpriu no passado? Como essa promessa se

cumpre no tempo presente? Como a promessa de Deus a Abraão receberá cumprimento fi -

nal, no futuro?

[cite] J. Jeremias, Jesus’ Promise to the Nations (London: SCM Press, 1958), p. 48.

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo extraído de James E. Barney (Org.), You Can Tell the World [Você pode contar ao mundo] (Downers Grove: InterVarsity, 1979). Usado com permissão.$conteudo$
     where curso_id = v_curso and ordem = 2;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 1 · Leitura — Stott, cap. 3: O Deus vivo é um Deus missionário$t$, $conteudo$O Deus vivo é um Deus missionário

John R. W. Stott

Milhões de pessoas no mundo de hoje são extremamente hostis ao empreendimento missionário cristão. Elas o consideram politicamente prejudicial (porque enfraquece os laços que unem a cultura nacional) e religiosamente tacanho (porque reivindica exclusividade para Jesus), enquanto os que se envolvem com missões são tidos como imperialistas arrogantes. O esforço para converter as pessoas a Cristo é visto como uma imperdoável interferência na vida pessoal. “Minha religião é assunto meu”, dizem. “Trate de seus próprios negócios e me deixe com os meus.”

Portanto, é essencial que os cristãos entendam as bases sobre as quais repousa a missão cristã. Só então seremos capazes de perseverar na tarefa missionária, com coragem e humildade, apesar da incompreensão e oposição do mundo. Mais precisamente, os cristãos bíblicos precisam de estímulos bíblicos, pois cremos que a Bíblia é a revelação de Deus e de sua vontade. Por isso, perguntamos: ele revelou nas Escrituras que a obra missionária é sua vontade para seu povo? Só então ficaremos satisfeitos. Pois então as missões se tornarão uma questão de obediência a Deus, a despeito do que os outros possam pensar ou dizer. Iremos aqui nos concentrar no Antigo Testamento, embora toda a Bíblia seja rica em evidências acerca do propósito missionário de Deus.

A chamada de Abraão

Nossa história começa cerca de 4 mil anos atrás, com um homem chamado Abraão, ou mais exatamente Abrão, como ele era chamado naquele tempo. Eis a narrativa da chamada de Abraão:

Disse o Senhor a Abrão: Sai da tua terra, da tua parentela e da casa de teu pai e vai para a terra que te mostrarei; de ti farei uma grande nação, e te abençoarei, e te engrandecerei o nome. Sê tu uma bênção! Abençoarei os que te abençoarem e amaldiçoarei os que te amaldiçoarem; em ti serão benditas todas as famílias da terra.

Partiu, pois, Abrão, como lho ordenara o Senhor, e Ló foi com ele. Tinha Abrão setenta e cinco anos quando saiu de Harã (Gn 12.1-4).

Deus fez uma promessa (complexa, conforme veremos) a Abraão, e para entender a Bíblia e a missão cristã é indispensável entender essa promessa. Talvez esses sejam os versículos que melhor resumem a Bíblia. Todo o propósito de Deus encontra-se condensado aqui.

Como introdução, iremos considerar o cenário da promessa de Deus, o contexto no qual ela foi feita. Então dividiremos em dois o restante de nosso estudo. Na primeira parte, destacaremos a promessa, isto é,o que Deus disse que faria. Na segunda parte, analisaremos, de maneira mais extensa, o cumprimento da promessa,ou seja, como Deus a tem cumprido e irá cumpri-la ainda. Comecemos, entretanto, com o cenário.

Gênesis 12 começa assim: “Ora disse o Senhor a Abrão...”. Parece uma forma abrupta de começar um novo capítulo. Somos levados a perguntar. “Quem é esse ‘Senhor’ que falou a Abrão? Quem é esse ‘Abrão’ a quem ele falou?”. Eles não são introduzidos no texto abruptamente. Há muita coisa por trás dessas palavras. Elas constituem uma chave que abre o todo das Escrituras. Os 11 capítulos anteriores conduzem a elas. O restante da Bíblia é consequência e cumprimento dessas palavras.

O que, então, existe por trás desse texto? É o seguinte: o “Senhor” que escolheu e chamou Abraão é o mesmo que no começo criou os céus e a terra e atingiu o clímax de sua obra criadora trazendo à existência o homem e a mulher, criaturas únicas feitas à semelhança dele. Jamais devemos esquecer que a Bíblia começa com o Universo, não com o planeta Terra; então, com a Terra, não com a Palestina; depois com Adão, na qualidade de pai da raça humana, não com Abraão, o pai da raça escolhida. Considerando, então, que Deus é o Criador do Universo, da Terra e de toda a humanidade, não devemos nunca rebaixá-lo à condição de divindade tribal ou a de um deus insignificante, como Quemos, deus dos moabitas, ou Milcom (Moloque), deus dos amonitas, ou Baal, o deushomem, ou Astarote, a deusa-mulher dos cananeus. Não devemos supor também que Deus escolheu Abraão e seus descendentes por haver perdido o interesse nos outros povos ou porque desistisse deles. Eleição não é sinônimo de elitismo. Pelo contrário, como veremos logo a seguir, Deus escolheu um homem e sua família, a fim de abençoar por meio deles todas as famílias da terra.

Portanto, ficamos profundamente magoados quando vemos o cristianismo relegado a um capítulo dentro de um livro sobre as religiões do mundo, como se fosse uma opção entre muitas, ou quando alguém faz referência ao “Deus cristão”, como se houvesse outros! Não, existe apenas um único Deus vivo e verdadeiro, que se revelou totalmente e, por fim, em seu único Filho Jesus Cristo. O monoteísmo jaz no alicerce das missões, como Paulo escreveu a Timóteo: “Há um só Deus e um só Mediador entre Deus e os homens, Cristo Jesus, homem” (1Tm 2.5).

O registro de Gênesis prossegue desde a criação de todas as coisas pelo Deus único e dos seres humanos conforme a semelhança divina, até nossa rebeldia contra nosso Criador e o julgamento de Deus sobre suas criaturas rebeldes. Esse julgamento, entretanto, é atenuado pela primeira promessa evangélica de que um dia a semente da mulher “pisaria” — na realidade “esmagaria” — a cabeça da serpente (3.15).

Os oito capítulos seguintes (Gn 4—11) descrevem os resultados devastadores da Queda: a alienação progressiva dos seres humanos em relação a Deus e aos outros seres humanos. Esse foi o cenário no qual Deus chamou e fez a promessa a Abraão. Tudo à volta era deterioração moral, trevas e dispersão. A sociedade se desintegrava cada vez mais. Todavia, Deus, o Criador, não abandonou os seres humanos que criara à sua semelhança (Gn 9.6). Dessa constante impiedade, ele chamou um homem e sua família e prometeu abençoar não apenas a eles, mas, por meio deles, a todo o mundo. A dispersão não continuaria descontroladamente: um grande processo de reunião estava começando.

A promessa

Qual foi, então, a promessa que Deus fez a Abraão? Foi uma promessa complexa que consistia de diversas outras promessas.

Primeira: a promessa de uma posteridade. Ele devia deixar sua parentela e a casa de seu pai e, em troca da perda da família, Deus faria dele “uma grande nação”. Mais tarde, para indicar isso, Deus mudou o nome do patriarca de “Abrão” (“pai exaltado”) para “Abraão” (“pai de uma multidão”) e lhe disse: “Por pai de numerosas nações te constituí” (Gn 17.5).

Segunda: a promessa de uma terra. Parece que o chamado divino veio em duas etapas. Primeiramente, em Ur dos caldeus, quando o pai de Abraão ainda vivia (11.31; 15.7), e depois em Harã, após da morte de seu pai (11.32; 12.1). De qualquer modo, ele devia deixar sua terra natal, e, em troca, Deus lhe mostraria outra.

Terceira: a promessa de uma bênção. Cinco vezes as palavras “bênção” e “abençoar”aparecem em 12.2,3. A bênção que Deus prometeu a Abraão transbordaria sobre toda a humanidade.

Uma posteridade, uma terra e uma bênção. Cada uma dessas promessas é desenvolvida nos capítulos que se seguem à chamada de Abraão.

Em primeiro lugar, a terra. Depois que Abraão generosamente permitiu que seu sobrinho Ló escolhesse onde queria se estabelecer (Ló escolheu o fértil vale do Jordão), Deus disse ao patriarca: “Ergue os olhos e olha desde onde estás para o norte, para o sul, para o oriente e para o ocidente; porque toda essa terra que vês, eu ta darei, a ti e à tua descendência, para sempre” (13.14,15).

Em segundo lugar, a posteridade. Um pouco mais tarde, Deus apresentou a Abraão outro recurso ilustrativo, convidando-o agora a olhar não para a terra, mas para o céu. Numa noite escura e desanuviada, Deus levou-o para fora de sua tenda e ordenou-lhe: “Olha para os céus e conta as estrelas”. Que ordem ridícula! Talvez Abraão tivesse começado: “Uma, duas, três, cinco, dez, vinte, trinta...”, mas deve ter desistido logo. Era uma tarefa impossível. Então Deus lhe disse: “Será assim tua posteridade”. E lemos. “Ele creu no Senhor”. Embora provavelmente já estivesse com mais de 80 anos de idade e ele e Sara não tivessem filhos ainda, Abraão creu na promessa de Deus, “e isso lhe foi imputado para justiça” por Deus. Isto é, pelo fato de ele haver confiado em Deus, O Senhor o aceitou como justo.

Em terceiro lugar, a bênção. “[Eu] te abençoarei” — Deus já havia aceitado Abraão como justo ou, tomando emprestada a expressão neotestamentária, “justificado pela fé”. Não podemos imaginar bênção maior. É a bênção fundamental da aliança da graça, a qual alguns anos mais tarde Deus esmiuçaria para Abraão: “Estabelecerei a minha aliança entre mim e ti e a tua descendência [...] aliança perpétua, para ser o teu Deus e da tua descendência. [...] e serei o seu Deus” (17.7,8). Deus instituiu a circuncisão como sinal exterior e visível da aliança da graça ou como penhor de que era o seu Deus. É a primeira vez nas Escrituras que ouvimos a fórmula da aliança, repetida muitas vezes mais tarde: “Eu serei o seu Deus, e eles serão o meu povo”.

“Uma terra, uma posteridade, uma bênção: mas que relação tem tudo isso com missões?”, talvez você se pergunte, impaciente. Minha resposta é: “Tudo! Seja um pouco mais paciente e verá”. Passemos agora da promessa para o cumprimento.

O cumprimento da promessa

Toda a questão do cumprimento das profecias do Antigo Testamento apresenta dificuldades, havendo sempre muitos mal-entendidos e quase nenhum acordo. De importância particular é o princípio, com o qual acho que todos concordamos, de que os autores do Novo Testamento entendiam que a profecia do Antigo Testamento não tinha um único cumprimento,mas que em geral era triplo — passado, presente e futuro. O cumprimento passado fora imediato, ou histórico, na vida da nação de Israel. O cumprimento presente era intermediário, ou evangélico, em Cristo e sua Igreja. O cumprimento futuro será final, ou escatológico, no novo céu e na nova terra.

A promessa de Deus a Abraão teve cumprimento histórico imediato em seus descendentes carnais, o povo de Israel

A promessa de uma posteridade numerosa, realmente incontável, feita por Deus a Abraão foi confirmada ao seu filho Isaque (26.4, “como as estrelas dos céus”) e ao seu neto Jacó (32.12, “como a areia do mar”). A promessa, aos poucos, começou a se cumprir literalmente. Talvez devêssemos examinar algumas das etapas desse desenvolvimento.

A primeira etapa refere-se aos anos de escravidão no Egito, dos quais se escreveu: “Os filhos de Israel foram fecundos, e aumentaram muito, e se multiplicaram, e grandemente se fortaleceram, de maneira que a terra se encheu deles” (Êx 1.7; comp. com At 7.17). A etapa seguinte ocorreu centenas de anos mais tarde, quando o rei Salomão declarou que Israel era um “povo grande, tão numeroso, que se não pode contar” (1Rs 3.8). A terceira etapa teve lugar cerca de 350 anos depois de Salomão. Jeremias advertiu Israel do juízo e do cativeiro iminentes e, então, acrescentou esta promessa divina de restauração: “Como não se pode contar o exército dos céus, nem medir-se a areia do mar, assim tornarei incontável a descendência de Davi, meu servo” ( Jr 33.22).

Tudo isso diz respeito à posteridade de Abraão: e o que dizer da terra? Mais uma vez, observamos com atitude de adoração e gratidão a fidelidade de Deus à sua promessa, pois foi lembrando sua promessa a Abraão, a Isaque e a Jacó que Deus libertou seu povo da escravidão no Egito e lhe deu o território que nessa narrativa é chamado “terra prometida” (Êx 2.24; 3.6; 32.13). Então, cerca de 700 anos depois, trouxe-os de volta a essa terra, após o cativeiro na Babilônia. Não obstante, nem Abraão nem seus descendentes físicos herdaram totalmente a terra. Como diz Hebreus 11, eles “morreram na fé, sem ter obtido as promessas”. Pelo contrário, como “estrangeiros e peregrinos sobre a terra”, eles aguardavam “a cidade que tem fundamentos, da qual Deus é o arquiteto e edifi - cador” (Hb 11.8-16,39,40).

Deus cumpriu suas promessas sobre a posteridade e a terra, pelo menos parcialmente. E as bênçãos? Bem, no Sinai, Deus confirmou e esclareceu sua aliança com Abraão e se comprometeu a ser o Deus de Israel (v. Êx. 19.3-6). No restante do Antigo Testamento, Deus continuou abençoando os obedientes, enquanto os desobedientes caíram sob seu juízo.

Talvez o exemplo mais dramático esteja no início da profecia de Oseias, na qual ele é orientado a dar a seus três filhos nomes que indicam o juízo divino, horrível e progressivo que se abaterá sobre Israel. Seu primogênito (um menino) foi chamado Jezreel, que significa “Deus dispersará”. Depois nasceu uma menina, LoRuama (arc), ou seja, Desfavorecida, pois Deus declarou que não teria mais piedade nem perdoaria seu povo. Finalmente, Oseias teve outro filho, Lo-Ami (arc), isto é, Não-Meu-Povo, pois Deus disse que eles não eram mais seu povo. Que nomes terríveis para o povo escolhido de Deus! Parece uma devastadora contradição da promessa eterna de Deus a Abraão.

Contudo, Deus não parou aí. Além do iminente juízo, haveria uma restauração, afirmada em palavras que mais uma vez fazem eco à promessa feita a Abraão: “Todavia, o número dos filhos de Israel será como a areia do mar, que se não pode medir, nem contar” (Os 1.10). Assim, o juízo implícito nos nomes dos filhos de Oseias seria invertido. Haverá um ajuntamento, em vez de dispersão ( Jezreel é uma palavra ambígua e também pode ter esse significado). Desfavorecida será favorecida, e Não-MeuPovo se transformará em “filhos do Deus vivo” (1.10—2.1).

É maravilhoso que os apóstolos Paulo e Pedro citassem esses versículos de Oseias. Eles viram seu cumprimento não apenas numa futura multiplicação de Israel, mas na inclusão dos gentios na comunidade de Jesus. “Antes, não éreis povo, mas, agora, sois povo de Deus, que não tínheis alcançado misericórdia, mas, agora, alcançastes misericórdia” (1Pe 2.9,10; v. Rm 9.25,26).

Essa perspectiva do Novo Testamento é essencial quando lemos as profecias do Antigo Testamento, pois o que sentimos faltar no Antigo Testamento é uma explicação clara acerca de como a prometida bênção de Deus transbordaria de Abraão e seus descendentes para “todas as famílias da terra”. Embora Israel seja descrito como “luz” para as nações e tenha a missão de levar a justiça a todos os povos (Is 42.1-4,6; 49.6), não é o que vemos acontecendo. Só no Senhor Jesus que essas profecias são cumpridas, pois apenas no seu Dia é que as nações são de fato incluídas na comunidade dos remidos. É para isso que nos voltamos agora.

A promessa de Deus a Abraão recebe cumprimento intermediário, ou evangélico, em Cristo e sua Igreja

“Abraão” é quase a primeira palavra do Novo Testamento, pois o evangelho de Mateus começa assim: “Livro da genealogia de Jesus Cristo, filho de Davi, filho de Abraão. Abraão gerou a Isaque...”. Portanto, Mateus relaciona com Abraão não só o começo da genealogia, mas também o início do evangelho de Jesus Cristo. Ele sabe que está registrando o cumprimento das antigas promessas de Deus a Abraão, feitas cerca de 2 mil anos antes (v. Lc 1.45- 55,67-76).

Desde o começo, porém, Mateus reconhece que não é simplesmente a descendência física de Abraão que qualifica o ser humano a herdar as promessas, mas uma descendência espiritual, isto é, o arrependimento e a fé no Messias que havia de vir. Esta era a mensagem de João Batista às multidões que se ajuntavam para ouvi-lo: “Não comeceis a dizer entre vós mesmos: Temos por pai a Abraão; porque eu vos afirmo que destas pedras Deus pode suscitar filhos a Abraão” (Mt 3.9; v. Lc 3.9; Jo 8.33-40). As implicações de suas palavras devem ter assustado seus ouvintes, uma vez que “era crença generalizada que nenhum dos descendentes de Abraão se perderia”.

Deus suscitou filhos a Abraão não de pedras, mas de uma fonte igualmente improvável, isto é, dos gentios! Portanto, Mateus, embora seja o mais judeu dos quatro escritores dos evangelhos, ele registra estas palavras de Jesus: “Digo-vos que muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus. Ao passo que os filhos do reino serão lançados para fora, nas trevas” (Mt 8.11,12; v. Lc 13.28,29).

É difícil imaginar o choque, a total confusão que essas palavras devem ter causado entre os ouvintes judeus de João Batista e Jesus. Eles eram descendentes de Abraão, portanto eles tinham direito às promessas que Deus fizera a Abraão. Quem eram, então, aqueles estranhos que iriam participar das promessas, aparentemente até usurpá-las, enquanto eles próprios seriam desqualificados? Os judeus ficaram indignados. Eles haviam esquecido completamente que a aliança de Deus com Abraão continha a promessa de um transbordamento de bênçãos sobre todas as nações da terra. Agora os judeus tinham de entender que era por meio Jesus, o Messias, ele próprio semente de Abraão, que todas as nações seriam abençoadas.

Parece que o apóstolo Pedro pelo menos começou a perceber essa realidade em seu segundo sermão após o Pentecostes. Ele se dirigiu a uma multidão de judeus com estas palavras: “Vós sois os filhos dos profetas e da aliança que Deus estabeleceu com vossos pais, dizendo a Abraão: Na tua descendência, serão abençoadas todas as nações da terra. Tendo Deus ressuscitado o seu Servo, enviou-o primeiramente a vós outros para vos abençoar, no sentido de que cada um se aparte das suas perversidades” (At 3.25,26). É uma declaração muito notável porque interpreta a bênção em termos morais de arrependimento e justiça, porque, se Jesus foi enviado “primeiro” aos judeus, ele foi presumivelmente enviado depois aos gentios, às “famílias da terra” que estavam “longe” (v. At 2.39), mas agora participariam das bênçãos.

Foi concedido ao apóstolo Paulo desenvolver plenamente esse maravilhoso tema. Ele foi chamado e designado para ser o apóstolo dos gentios, e a ele foi revelado o propósito eterno — e até então secreto — de Deus: tornar os judeus e os gentios “co-herdeiros, membros do mesmo corpo e coparticipantes da promessa em Cristo Jesus por meio do evangelho” (Ef 3.6).

Negativamente, Paulo declara com grande ousadia: “Nem todos os de Israel são, de fato, israelitas; nem por serem descendentes de Abraão são todos seus filhos” (Rm 9.6,7).

Quem são, então, os verdadeiros descentes de Abraão, os verdadeiros beneficiados pelas promessas de Deus? Paulo não deixa nenhuma dúvida. São os crentes em Cristo, de qualquer raça. Em Romanos 4, ele destaca que Abraão não só foi justificado pela fé, mas também recebeu essa bênção antes de ser circuncidado. Portanto, Abraão é o pai de todos os que, circuncidados ou não (isto é, judeus ou gentios), seguem o exemplo de sua fé (Rm 4.9-12). Se participamos da fé de Abraão, então “Abraão é pai de todos nós, como está escrito: Por pai de muitas nações te constituí” (v. 16,17). Portanto, nem a descendência física de Abraão nem a circuncisão física do judeu tornam a pessoa um verdadeiro filho de Abraão, e sim a fé. Os verdadeiros descendentes de Abraão são os crentes em Jesus Cristo, judeus ou gentios.

Qual é, então, a “terra” que os descendentes de Abraão herdaram? A carta aos Hebreus menciona um “descanso” no qual o povo de Deus entra agora pela fé (Hb 4.3). Numa expressão notável, Paulo menciona que “a Abraão ou a sua descendência coube a promessa de ser herdeiro do mundo” (Rm 4.13). Só podemos presumir que ele quis dizer a mesma coisa quando escreveu aos coríntios, dizendo que em Cristo “tudo é vosso: seja Paulo, seja Apolo, seja Cefas, seja o mundo, seja a vida, seja a morte, sejam as coisas presentes, sejam as futuras, tudo é vosso” (1Co 3.21-23). Os cristãos, pela maravilhosa graça de Deus, são co-herdeiros do Universo com Cristo.

Um ensino semelhante sobre a natureza da bênção prometida e seus beneficiários é apresentado por Paulo em Gálatas 3. Ele explica como Abraão foi justificado pela fé e acrescenta: “Sabei, pois, que os da fé é que são filhos de Abraão” (v. 6-9). Qual é, então, a bênção com a qual todas as nações foram abençoadas (v. 8)? Em uma palavra, é a bênção da salvação. Estávamos sob a maldição da lei, mas Cristo nos remiu, tornando-se maldição em nosso lugar, “para que a bênção de Abraão chegasse aos gentios, em Jesus Cristo, a fim de que recebêssemos, pela fé, o Espírito prometido” (v. 10-14). Cristo tomou sobre si nossa maldição, a fim de que pudéssemos herdar a bênção de Abraão, isto é, a bênção da justificação (v. 8), e a habitação do Espírito Santo (v. 14). Paulo resume essa realidade no versículo 29: “Se sois de Cristo, também sois descendentes de Abraão e herdeiros segundo a promessa”.

Mas ainda não terminamos. Temos o terceiro estágio de cumprimento: o que está por vir.

A promessa de Deus a Abraão terá um cumprimento final, ou escatológico, no destino final de todos os redimidos

No livro de Apocalipse, há outra referência à promessa de Deus a Abraão (7.9ss). João vê numa visão uma “grande multidão que ninguém podia enumerar”. É uma multidão internacional, vinda “de todas as nações, tribos, povos e línguas”. Ela está “em pé diante do trono”, o símbolo do Reino de Deus. Isto é, seu Reino chegou finalmente, e a multidão está desfrutando todas as bênçãos de seu afável governo. Ela está abrigada em sua presença. Seus dias de fome, sede e calor no deserto se acabaram. Finalmente, ela entrou na terra prometida, descrita agora não como “uma terra que mana leite e mel”, mas como uma terra irrigada com fontes de “água viva”, que jamais secarão. Mas como a multidão herdou essas bênçãos? Em parte, porque veio “da grande tribulação” (evidentemente uma referência à vida cristã com todas as suas provações e sofrimentos), mas principalmente porque “lavaram suas vestiduras e as alvejaram no sangue do Cordeiro”, isto é, foram purificados do pecado e vestidos de justiça pelos méritos da morte de Jesus Cristo, “razão por que se acham diante do trono de Deus”.

É comovente vislumbrar na eternidade futura o cumprimento final dessa antiga promessa de Deus a Abraão. Todos os elementos essenciais da promessa podem ser identificados. Aí estão os descendentes espirituais de Abraão, uma “grande multidão que ninguém podia enumerar”, incontáveis como os grãos de areia da praia e as estrelas do céu. Estão aí também “todas as famílias da terra” sendo abençoadas, pois a multidão inumerável é composta de pessoas de todas as nações. Aí está ainda a terra prometida, a saber, todas as ricas bênçãos que fluem do governo cheio da graça de Deus. E, acima de tudo, está Jesus Cristo, a semente de Abraão, que derramou seu sangue por nossa redenção e concede suas bênçãos a todos os que o invocam para serem salvos.

Conclusão

Iremos resumir o que aprendemos acerca de Deus com base em sua promessa a Abraão e o seu cumprimento, destacando cinco características.

Primeira: ele é o Deus da História. A História não é um fluxo de acontecimentos ao acaso. Deus executa, no devido tempo, o plano que concebeu na eternidade passada e será consumado na eternidade futura. No processo histórico, Jesus Cristo, na qualidade de semente de Abraão, é a figura-chave. Regozijemo-nos pelo fato de que, sendo discípulos de Cristo, somos descendentes de Abraão. Pertencemos à sua linhagem espiritual. Se recebemos as bênçãos da justificação pela fé, a aceitação de Deus e a habitação do Espírito, então somos hoje os beneficiários da promessa feita a Abraão há 4 mil anos.

Segunda: ele é o Deus da aliança. Isto é, Deus é suficientemente bom e afável para fazer promessas, e ele sempre cumpre o que promete. Ele é um Deus de amor e fidelidade contínuos. Preste atenção: nem sempre ele cumpre suas promessas imediatamente. Abraão e Sara “morreram na fé, sem ter obtido as promessas; vendo-as, porém, de longe” (Hb 11.13). Ou seja, embora Isaque lhes nascesse em cumprimento da promessa, a semente do casal ainda não era numerosa, nem eles herdaram a terra, nem as nações haviam sido abençoadas. Todas as promessas de Deus se realizam, mas elas são herdadas “pela fé e pela longanimidade” (Hb 6.12), isto é, pela paciência. Devemos nos contentar em esperar a hora divina.

Terceira: ele é o Deus da bênção. “[Eu] te abençoarei”, foi o que disse a Abraão (Gn 12.2). “Deus [...] enviou-o [ Jesus] primeiramente a vós outros para vos abençoar”, exclamou Pedro (At 3.26). A atitude de Deus para com seu povo é positiva, construtiva, enriquecedora. O juízo é sua “obra estranha” (Is 28.21). Sua principal obra e característica é abençoar a humanidade com a salvação.

Quarta: ele é o Deus da misericórdia. Sempre recebi muito alento da declaração de Apocalipse 7.9, segundo a qual a multidão dos remidos no céu será “uma grande multidão que ninguém podia enumerar”. Não tenho a pretensão de saber como será, uma vez que os cristãos sempre parecem ser uma minoria, mas as Escrituras declaram isso para alento nosso. Embora nenhum cristão bíblico possa ser universalista (crendo que toda a humanidade será finalmente salva), uma vez que as Escrituras ensinam a terrível realidade e a eternidade do inferno, o cristão bíblico pode (e até deve) afirmar que os remidos serão, de algum modo, uma multidão internacional tão imensa que não poderá ser contada. A promessa de Deus será cumprida, e a semente de Abraão será tão numerosa quanto o pó da terra, as estrelas do céu e a areia da praia.

Quinta: ele é o Deus das missões. As nações não são reunidas automaticamente. Se Deus prometeu abençoar “todas as famílias da terra”, ele pretendia fazê-lo por meio da descendência de Abraão (Gn 12.3; 22.18). Somos a semente de Abraão pela fé, e as famílias da terra só serão abençoadas se formos a elas com o evangelho. Esse é o propósito explícito de Deus.

Oro para que a expressão “todas as famílias da terra” seja gravada em nosso coração. Ela, mais que qualquer outra, revela o Deus vivo da Bíblia como um Deus missionário. Essa expressão também condena o denominacionalismo mesquinho, o nacionalismo estreito, o orgulho racial (branco ou negro), o paternalismo condescendente e o imperialismo arrogante. Como nos atrevemos a adotar uma atitude hostil, desdenhosa ou mesmo indiferente para com qualquer pessoa de outra cor ou cultura se nosso Deus é o Deus de “todas as famílias da terra”? Precisamos nos tornar cristãos globais, com uma visão global, pois temos um Deus global.

Portanto, que Deus nos ajude a nunca esquecer a antiga promessa de 4 mil anos feita a Abraão: “Em ti e na tua descendência serão abençoadas todas as famílias da terra”.

Perguntas para estudo

1.De acordo com Stott, por que é importante conhecer a base sobre a qual repousa a missão

cristã? Por quais outras razões o conhecimento de tal base é importante?

2.Qual o contexto da promessa feita por Deus a Abraão? Como foi que a promessa de uma

terra, de uma posteridade e de uma bênção se cumpriu no passado? Como essa promessa se

cumpre no tempo presente? Como a promessa de Deus a Abraão receberá cumprimento fi -

nal, no futuro?

[cite] J. Jeremias, Jesus’ Promise to the Nations (London: SCM Press, 1958), p. 48.

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo extraído de James E. Barney (Org.), You Can Tell the World [Você pode contar ao mundo] (Downers Grove: InterVarsity, 1979). Usado com permissão.$conteudo$, 2);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 7) then
    update aulas set titulo = $t$Lição 1 · Leitura — Stott, cap. 1: A Bíblia na evangelização do mundo$t$, conteudo = $conteudo$A Bíblia na evangelização do mundo

John R. W. Stott

Sem a Bíblia, a evangelização do mundo seria não apenas impossível, mas também inconcebível. A Bíblia impõe-nos a responsabilidade de evangelizar o mundo, dá-nos um evangelho a proclamar, diz-nos como fazê-lo e declara-se o poder de Deus para a salvação de cada crente.

Além disso, é fato notável, na história passada e contemporânea, que o grau de compromisso da Igreja com a evangelização do mundo é proporcional ao grau de sua convicção da autoridade da Bíblia. Sempre que o cristão perde a confiança na Bíblia, seu zelo pela evangelização acaba se esvaindo. Inversamente, se ele estiver convencido acerca da Bíblia, estará também determinado a evangelizar.

Destaco a seguir quatro razões por que a Bíblia é indispensável à evangelização do mundo.

O mandato da evangelização mundial

Em primeiro lugar, a Bíblia nos dá o mandato da evangelização do mundo. Sem dúvida, precisamos de uma incumbência. Dois fenômenos estão ocorrendo em toda parte: o fanatismo religioso e o pluralismo religioso. O fanatismo caracteriza-se por um zelo irracional que, se pudesse, usaria a força para obrigar a crença e erradicar a incredulidade. O pluralismo religioso incentiva a tendência oposta.

Sempre que o espírito do fanatismo religioso ou de seu oposto, o indiferentismo, prevalece, a evangelização do mundo é profundamente prejudicada. Os fanáticos recusam-se a tolerar o rival representado pelo evangelismo, e os pluralistas rejeitam suas reivindicações exclusivas. O evangelista cristão é considerado um intruso, alguém que sem motivo se intromete nos negócios alheios.

Diante dessa oposição, precisamos esclarecer que o mandato bíblico não se limita à Grande Comissão (por mais importante que seja esta), mas abrange toda a revelação bíblica. Vou recordála rapidamente.

Existe um único Deus vivo e verdadeiro, o Criador do Universo, o Senhor das nações e o Deus de toda carne. Há cerca de 4 mil anos, Deus chamou Abraão e fez uma aliança com ele, prometendo não apenas abençoá-lo, mas também abençoar, por meio da posteridade do patriarca, todas as famílias da terra (Gn 12. l-4). Esse texto bíblico é uma das pedras fundamentais da missão cristã, pois os descendentes de Abraão (por meio de quem todas as nações estão sendo abençoadas) são Cristo e o povo de Cristo. Se pela fé pertencemos a Cristo, somos filhos espirituais de Abraão e temos uma responsabilidade para com a raça humana. Assim, também os profetas do Antigo Testamento profetizaram que Deus faria desse Cristo o herdeiro e a luz das nações (Sl 2.8; Is 42.6; 49.6).

Quando Jesus veio, ele endossou essas promessas. É verdade que durante seu ministério terreno ele ficou restrito “às ovelhas perdidas da casa de Israel” (Mt 10.6; 15.24), contudo, ele profetizou que “muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus” (Mt 8.11; Lc 13.29). Mais ainda, prevendo sua ressurreição e ascensão, ele deu este fantástico testemunho acerca de si mesmo: “Toda a autoridade me foi dada no céu e na terra” (Mt 28.18). Foi em consequência de sua autoridade universal que ele ordenou aos seus seguidores que fizessem discípulos de todas as nações, batizando-os na nova comunidade e ensinando a todos sua doutrina (Mt 28.19).

Isso os cristãos primitivos começaram a fazer quando o Espírito Santo da verdade e do poder desceu sobre eles. Eles se tornaram testemunhas de Jesus até os confins da terra (At 1.8), e o faziam “por amor do seu nome” (Rm 1.5; 3Jo 7). Eles sabiam que Deus havia superexaltado a Jesus, entronizando-o à sua direita e concedendo-lhe a mais alta posição, a fim de que toda língua confessasse seu senhorio. Eles queriam que Jesus recebesse a honra devida ao seu nome. Além disso, um dia ele retornará em glória, para salvar, julgar e reinar. Portanto, o que deveria preencher o espaço entre as duas vindas? A missão mundial da Igreja! O fim da História só viria depois que o evangelho alcançasse os confins da terra (comp. Mt 24.14 com 28.20; At 1.8). Os dois fins iriam coincidir.

Nosso mandato para a evangelização do mundo, portanto, é a Bíblia inteira. Deve ser encontrado na criação de Deus, porque todos os seres humanos são responsáveis diante dele; no caráter de Deus, transcendente, amoroso, compassivo, não desejando que ninguém pereça, mas que todos venham ao arrependimento; nas promessas de Deus, que todas as nações sejam benditas por meio da semente de Abraão e venham a ser a herança do Messias; no Cristo de Deus, agora exaltado com autoridade universal, para receber aclamação universal; no Espírito de Deus, que convence do pecado, dá testemunho de Cristo e impele a Igreja a evangelizar; na Igreja de Deus, que é uma comunidade missionária multinacional, com ordens de evangelizar até que Cristo volte.

A dimensão global da missão cristã é irresistível. O cristão individual e as igrejas locais que não se comprometem com a evangelização do mundo estão contradizendo, por cegueira ou por desobediência, uma parte essencial de sua identidade, a qual provém de Deus. O mandato bíblico para a evangelização do mundo não pode ser ignorado.

A mensagem da evangelização mundial

Em segundo lugar, a Bíblia nos disponibiliza a mensagem para a evangelização do mundo. O Pacto de Lausanne define o evangelismo em termos de evangelho. O parágrafo 4 declara: “Evangelizar é difundir as boas novas de que Jesus Cristo morreu por nossos pecados e ressuscitou segundo as Escrituras, e de que, como Senhor e Rei, ele agora oferece o perdão dos pecados e o dom libertador do Espírito a todos os que se arrependem e creem”.

Nossa mensagem vem da Bíblia, mas quando a buscamos nas Escrituras, imediatamente deparamos com um dilema. De um lado, a mensagem nos é outorgada. Não temos permissão de inventá-la. Ela nos foi confiada como um “depósito” precioso, que nós, como servos fiéis, devemos guardar e distribuir na Casa de Deus (1Tm 6.20; 2Tm 1.12-14; 2Co 4.1,2). Por outro lado, não nos foi dada como uma fórmula matemática simples e exata, e sim numa rica diversidade de formulações nas quais foram usadas imagens ou metáforas diferentes.

Portanto, existe apenas um evangelho, no que todos os apóstolos concordam (1Co 15.1), e Paulo podia invocar a maldição de Deus sobre qualquer um, inclusive ele próprio, que pregasse um evangelho “diferente” do evangelho apostólico original da graça de Deus (Gl 1.6-8). No entanto, os apóstolos expressaram esse evangelho único de diversos modos: sacrifical (o derramamento e a aspersão do sangue de Cristo); messiânico (o surgimento do governo prometido por Deus); legal (o juiz pronunciando a justificação do injusto); pessoal (o Pai reconciliando seus filhos desviados); salvífico (o Libertador celestial que veio para resgatar os desamparados); cósmico (o Senhor universal reivindicando domínio universal) — e esses são apenas alguns exemplos.

O evangelho é assim visto como único e, ao mesmo tempo, como diversificado. Ele é “dado” e, ao mesmo tempo, é culturalmente adaptado à sua audiência. Uma vez que percebamos isso, seremos poupados de cometer dois erros opostos. Ao primeiro chamarei “fluidez total”. Certa vez, ouvi um líder de igreja inglês declarar que não existe coisa tal como o evangelho até que estejamos na situação de dar nosso testemunho. Não levamos nada conosco nessa situação, ele disse. Descobrimos o evangelho apenas quando chegamos lá. Concordo plenamente com a necessidade de ser sensível em cada situação, mas, se esse era o ponto que o líder em questão desejava defender, ele o exagerou grosseiramente. Existe uma coisa tal como o evangelho revelado, ou dado, que não temos liberdade para falsificar.

Ao erro oposto chamarei “rigidez total”. Nesse caso, o evangelista se comporta como se Deus tivesse outorgado algumas fórmulas precisas, que temos de repetir mais ou menos palavra por palavra, e certas imagens, que devemos empregar invariavelmente. Isso nos torna escravos de palavras ou de imagens, ou de ambas. Alguns evangelistas fracassam por usar uma linguagem antiquada, enquanto outros se sentem obrigados a mencionar a toda hora “o sangue de Cristo”, “a justificação pela fé”, “o Reino de Deus” ou qualquer outra imagem.

Entre esses dois extremos, há um terceiro e melhor caminho. Ele combina o compromisso com o fato da revelação e com a tarefa da contextualização. Aceita como permanentemente normativas apenas as formulações bíblicas do evangelho e entende que cada tentativa de proclamar o evangelho na linguagem moderna deve justificar-se como expressão autêntica do evangelho bíblico.

Contudo, se ele se recusa a se desfazer das formulações bíblicas, também recusará recitálas de maneira inexpressiva e sem imaginação. Em vez disso, temos de nos ocupar da luta contínua, por meio da oração, do estudo e da discussão, para relacionar o evangelho recebido com determinada situação. Uma vez que ele vem de Deus, devemos preservá-lo; uma vez que se destina aos homens e mulheres dos tempos modernos, temos de interpretá-lo. Temos de combinar fidelidade (pelo estudo constante do texto bíblico) com sensibilidade (pela observação constante do cenário contemporâneo). Só então teremos condições de relacionar, com fidelidade e relevância, a Palavra com o mundo, o evangelho com o contexto, as Escrituras com a cultura.

O modelo para a evangelização mundial

Em terceiro lugar, a Bíblia nos fornece o modelo para a evangelização do mundo. Além da mensagem (o que temos de dizer), precisamos de um modelo (como dizer). A Bíblia supre isto também. Ela não apenas contém o evangelho: ela é o evangelho. Por meio da Bíblia o próprio Deus está evangelizando, isto é, comunicando as boas novas ao mundo. Você deve estar lembrado da declaração de Paulo acerca de Gênesis 12.3, segundo a qual “a Escritura [...] preanunciou o evangelho a Abraão” (Gl 3.8). Toda a Escritura prega o evangelho. Deus evangeliza por meio dela.

Se, portanto, as Escrituras são a evangelização divina, é evidente que podemos aprender a pregar o evangelho, considerando como Deus o fez. Ele nos proporcionou, no processo da inspiração bíblica, um belo modelo evangelístico.

O que de imediato nos surpreende é a grandeza da condescendência de Deus. Ele tem uma verdade sublime para revelar acerca de si mesmo e de seu Cristo, sua misericórdia, sua justiça e sua total salvação. Ele escolheu fazer essa revelação pelo emprego do vocabulário e da gramática da língua humana, de seres humanos, de imagens humanas e de culturas humanas.

Contudo, por meio desse humilde recurso de palavras e imagens humanas, Deus falava as palavras dele. A doutrina evangélica da inspiração das Escrituras enfatiza sua dupla autoria. Homens falaram, e Deus falou. Homens falaram de Deus (2Pe 1.21), e Deus falou por intermédio de homens (Hb 1.1). As palavras faladas e escritas eram de Deus e também deles. Ele decidiu o que queria dizer, mas não sufocou a personalidade humana. Eles usaram suas faculdades livremente, mas não distorceram a mensagem divina. Os cristãos desejam declarar algo semelhante sobre a encarnação, o clímax da autocomunicação de Deus: “O Verbo se fez carne” ( Jo 1.14). Isto é, a Palavra eterna de Deus, que desde a eternidade estava com Deus e era Deus, o Agente através do qual o Universo foi criado, tornou-se um ser humano, com todas as características de um judeu palestino do primeiro século. Ele se tornou pequeno, fraco, pobre e vulnerável. Ele experimentou a dor e a fome e se expôs à tentação. Tudo isso fazia parte da “carne”, isto é, do ser humano que ele se tornou. Tornando-se um de nós, porém, não deixou de ser ele mesmo. Cristo continuou sendo o Verbo eterno, isto é, o Filho eterno de Deus.

Essencialmente, o mesmo princípio é ilustrado pela inspiração das Escrituras e pela encarnação do Filho. O Verbo se fez carne. O divino foi comunicado pelo humano. Deus se identificou conosco, embora não renunciasse à sua identidade, e esse princípio de “identificação sem perda de identidade” é o modelo para toda a evangelização, especialmente a evangelização transcultural.

Alguns de nós se recusam a identificar-se com o povo que alegam servir. Continuamos sendo nós mesmos e não nos tornamos iguais a eles. Permanecemos afastados. Agarramo-nos desesperadamente à nossa herança cultural, com base na concepção errônea de que é parte indispensável de nossa identidade. Não queremos perdê-la e não apenas mantemos nossas práticas culturais com tenacidade feroz, como também tratamos a herança cultural da terra de nossa adoção sem o respeito que merece. Assim, praticamos um duplo tipo de imperialismo cultural, impondo nossa cultura a outros e desprezando a deles. Não foi esse, porém, o procedimento de Cristo, que se esvaziou de sua glória e se humilhou para poder servir.

Outros mensageiros transculturais do evangelho cometem o erro oposto. Tão determinados estão em identificar-se com o povo que vão servir que até abrem mão de seus padrões e valores cristãos, mas esse também não foi o procedimento de Cristo, uma vez que, ao se tornar humano, ele permaneceu verdadeiramente divino. O Pacto de Lausanne, no parágrafo 10, expressa esse princípio nestas palavras: “Os evangelistas de Cristo têm de, humildemente, procurar esvaziar-se de tudo, exceto de sua autenticidade pessoal, a fim de se tornarem servos dos outros, e as igrejas têm de procurar transformar e enriquecer a cultura; tudo para a glória de Deus”.

Temos de lidar com os motivos que levam as pessoas a rejeitar o evangelho e, em particular, dar o devido valor aos fatores culturais. Alguns rejeitam o evangelho não porque o consideram falso, mas porque o acham estranho à sua cultura.

O dr. Renné Padilla foi criticado em Lau sanne, no Congresso sobre a Evangelização Mundial, de 1974, por afirmar que o evangelho que alguns missionários europeus e norte-americanos exportaram foi um “cristianismo cultural”, uma mensagem cristã distorcida pela cultura materialista e consumista do Ocidente. Foi doloroso ouvi-lo dizer isso, mas obviamente ele estava totalmente certo.

Todos nós precisamos sujeitar nosso evangelho a um escrutínio mais crítico, e, numa situação transcultural, os evangelistas visitantes precisam, com humildade, buscar ajuda dos cristãos locais para discernir as distorções culturais de sua mensagem.

Outros rejeitam o evangelho porque percebem que é uma ameaça à sua cultura. É claro que Cristo desafia cada cultura. Sempre que apresentamos o evangelho aos hindus, budistas, judeus, muçulmanos, secularistas ou marxistas, Jesus Cristo os desafia com a exigência de abandonarem tudo a que se dedicaram até o momento e de os substituírem por ele mesmo. Jesus é o Senhor de cada pessoa e de cada cultura. Essa ameaça, essa confrontação não pode ser evitada. Mas não estará o evangelho que proclamamos apresentando às pessoas outras ameaças desnecessárias, ao exigir o abandono de costumes inofensivos ou porque parece destruir a arte, a arquitetura, a música e as festas nacionais, ou porque nós, que o apresentamos, somos orgulhosos de nossa cultura e cegos para a cultura dos outros?

Resumindo, quando Deus nos falou nas Escrituras ele usou linguagem humana e quando nos falou em Cristo assumiu carne humana. A fim de revelar-se, ele se esvaziou e se humilhou. Esse é o modelo de evangelismo que a Bíblia apresenta. Existe autoesvaziamento e auto-humilhação em todo evangelismo autêntico. Sem eles, contradizemos o evangelho e deturpamos o Cristo que proclamamos.

O poder para a evangelização mundial

Em quarto lugar, a Bíblia nos concede o poder para a evangelização do mundo. É quase desnecessário enfatizar nossa necessidade de poder, pois sabemos quanto nossos recursos humanos são fracos em comparação com a magnitude da tarefa. Também sabemos quão blindadas são as defesas do coração humano. Pior ainda, conhecemos a realidade, a maldade e o poder do Diabo e dos demônios sob seu comando.

As pessoas intelectualizadas podem ridicularizar nossas crenças, e até caricaturizá-las, a fim de tornar mais plausível o ridículo da própria condição delas. No entanto, os cristãos evangélicos são simples o bastante para crer no que Jesus e seus apóstolos ensinaram. Para nós, é fato inegável que, na expressão de João, “o mundo inteiro jaz no Maligno” (1Jo 5.19). Até que sejam libertados por Jesus Cristo e transportados para seu Reino, todos os seres humanos são escravos de Satanás. Além disso, percebemos o poder maligno no mundo contemporâneo — nas trevas da idolatria e no medo dos espíritos; na superstição e no fatalismo; na devoção aos deuses que não são deuses; no materialismo egoísta do Ocidente; na propagação do comunismo ateu; na proliferação de sistemas religiosos irracionais; na violência e na agressão; na deterioração generalizada dos padrões absolutos de bondade e verdade. Tudo isso é resultado da obra daquele que nas Escrituras é chamado “mentiroso”, “enganador”, “caluniador” e “homicida”.

Portanto, a conversão e a regeneração cristãs continuam sendo milagres da graça de Deus. Representam o auge de uma luta poderosa entre Cristo e Satanás ou, na marcante figura de linguagem apocalíptica, entre o Cordeiro e o Dragão. O assalto ao palácio do homem forte só é possível porque ele foi amarrado por Alguém que é ainda mais forte e que por sua morte e ressurreição desarmou os principados e potestades do mal e deles se desfez (Mt 12.27-29; Lc 11.20-22; Cl 2.15).

Como então participaremos da vitória de Cristo e derrotaremos o poder do Diabo? Deixemos que Lutero responda à nossa pergunta: Ein wörtlein will ihn fällen. “Vencido cairá por uma só palavra.” Há poder na Palavra de Deus e na pregação do evangelho. Talvez a expressão mais dramática dessa realidade no Novo Testamento esteja em 2Coríntios 4. Paulo faz menção do “deus deste século”, que “cegou o entendimento dos incrédulos, para que lhes não resplandeça a luz do evangelho da glória de Cristo” (v. 4).

Se a mente humana está cega, como poderá enxergar? Somente por meio da Palavra criadora de Deus. Pois foi Deus quem disse que “de trevas resplandecerá luz” que brilhou em nosso coração “para iluminação do conhecimento da glória de Deus, na face de Cristo” (v. 6). Assim, o apóstolo compara o coração não regenerado ao negro caos inicial e atribui a regeneração ao divino fiat: “Haja luz”.

Se Satanás cega as mentes das pessoas e Deus ilumina o coração delas, em que poderemos contribuir para esse encontro? Não seria mais humilde de nossa parte nos retirarmos do campo de batalha e deixar que lutem? Não, essa não é a conclusão a que Paulo chega.

Pelo contrário, entre os versículos 4 e 6, que descrevem as atividades de Deus e Satanás, o versículo 5 diz qual é a obra do evangelista: “Pregamos [...] a Cristo Jesus como Senhor”. Considerando que a luz que o Diabo deseja evitar que as pessoas vejam e que Deus faz brilhar nelas é o evangelho, o melhor a fazer é pregar. Pregar o evangelho, longe de ser desnecessário, é indispensável. É o meio estabelecido por Deus para que o príncipe das trevas seja derrotado e a luz jorre no coração do ser humano. Há poder no evangelho de Deus — poder de Deus para a salvação (Rm 1.16).

Podemos ser muito fracos. Às vezes, desejo que fôssemos ainda mais fracos. Diante das forças do mal, somos tentados a exibir certa força cristã e a nos envolver em pequenas escaramuças verbais em nome do evangelho. Entretanto, é em nossa fraqueza que a força de Cristo se faz perfeita, e são as palavras marcadas pela fraqueza humana que o Espírito reveste com poder. Portanto, é quando somos fracos que somos fortes (1Co 2.1-5; 2Co 12.9-10).

Vamos proclamar a Palavra no mundo!

Não vamos consumir todas as nossas energias discutindo sobre a Palavra de Deus. Em vez disso, vamos começar a usá-la. Ela comprovará sua origem divina por meio do poder divino. Vamos proclamá-la no mundo! Quem dera todos os missionários cristãos e evangelistas proclamassem o evangelho bíblico com fidelidade e sensibilidade e cada pregador cristão fosse um expositor fiel da Palavra de Deus! Então Deus demonstraria seu poder salvador.

Sem a Bíblia, a evangelização do mundo é impossível, pois sem ela não temos nenhum evangelho para levar às nações, nenhuma garantia para oferecer, nenhuma ideia de como fazer a tarefa e nenhuma esperança de sucesso. É a Bíblia que nos dá o mandato, a mensagem, o modelo e o poder de que precisamos para a evangelização do mundo. Portanto, vamos nos apoderar dela outra vez, por intermédio do estudo e da meditação diligentes. Vamos dar atenção aos seus mandamentos, captar sua mensagem, seguir sua orientação e confiar em seu poder. Vamos levantar nossa voz e tornar a Palavra conhecida.

Perguntas para estudo

1.Qual a crença básica deste artigo? Explique a diferença que ela poderá fazer na vida do can-

didato em potencial ao trabalho missionário.

2.Um missionário, depois de enfrentar muitas críticas quanto ao seu trabalho, começou a pro-

curar uma explicação para ter dado esse passo: “Por que estou fazendo este trabalho?”. Com

base no conteúdo deste artigo, o que você diria a ele?

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo adaptado de uma mensagem apresentada numa sessão plenária da Consulta sobre Evangelização Mundial, realizada em junho de 1980, em Pattaya, na Tailândia. Usado com permissão.$conteudo$
     where curso_id = v_curso and ordem = 7;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 1 · Leitura — Stott, cap. 1: A Bíblia na evangelização do mundo$t$, $conteudo$A Bíblia na evangelização do mundo

John R. W. Stott

Sem a Bíblia, a evangelização do mundo seria não apenas impossível, mas também inconcebível. A Bíblia impõe-nos a responsabilidade de evangelizar o mundo, dá-nos um evangelho a proclamar, diz-nos como fazê-lo e declara-se o poder de Deus para a salvação de cada crente.

Além disso, é fato notável, na história passada e contemporânea, que o grau de compromisso da Igreja com a evangelização do mundo é proporcional ao grau de sua convicção da autoridade da Bíblia. Sempre que o cristão perde a confiança na Bíblia, seu zelo pela evangelização acaba se esvaindo. Inversamente, se ele estiver convencido acerca da Bíblia, estará também determinado a evangelizar.

Destaco a seguir quatro razões por que a Bíblia é indispensável à evangelização do mundo.

O mandato da evangelização mundial

Em primeiro lugar, a Bíblia nos dá o mandato da evangelização do mundo. Sem dúvida, precisamos de uma incumbência. Dois fenômenos estão ocorrendo em toda parte: o fanatismo religioso e o pluralismo religioso. O fanatismo caracteriza-se por um zelo irracional que, se pudesse, usaria a força para obrigar a crença e erradicar a incredulidade. O pluralismo religioso incentiva a tendência oposta.

Sempre que o espírito do fanatismo religioso ou de seu oposto, o indiferentismo, prevalece, a evangelização do mundo é profundamente prejudicada. Os fanáticos recusam-se a tolerar o rival representado pelo evangelismo, e os pluralistas rejeitam suas reivindicações exclusivas. O evangelista cristão é considerado um intruso, alguém que sem motivo se intromete nos negócios alheios.

Diante dessa oposição, precisamos esclarecer que o mandato bíblico não se limita à Grande Comissão (por mais importante que seja esta), mas abrange toda a revelação bíblica. Vou recordála rapidamente.

Existe um único Deus vivo e verdadeiro, o Criador do Universo, o Senhor das nações e o Deus de toda carne. Há cerca de 4 mil anos, Deus chamou Abraão e fez uma aliança com ele, prometendo não apenas abençoá-lo, mas também abençoar, por meio da posteridade do patriarca, todas as famílias da terra (Gn 12. l-4). Esse texto bíblico é uma das pedras fundamentais da missão cristã, pois os descendentes de Abraão (por meio de quem todas as nações estão sendo abençoadas) são Cristo e o povo de Cristo. Se pela fé pertencemos a Cristo, somos filhos espirituais de Abraão e temos uma responsabilidade para com a raça humana. Assim, também os profetas do Antigo Testamento profetizaram que Deus faria desse Cristo o herdeiro e a luz das nações (Sl 2.8; Is 42.6; 49.6).

Quando Jesus veio, ele endossou essas promessas. É verdade que durante seu ministério terreno ele ficou restrito “às ovelhas perdidas da casa de Israel” (Mt 10.6; 15.24), contudo, ele profetizou que “muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus” (Mt 8.11; Lc 13.29). Mais ainda, prevendo sua ressurreição e ascensão, ele deu este fantástico testemunho acerca de si mesmo: “Toda a autoridade me foi dada no céu e na terra” (Mt 28.18). Foi em consequência de sua autoridade universal que ele ordenou aos seus seguidores que fizessem discípulos de todas as nações, batizando-os na nova comunidade e ensinando a todos sua doutrina (Mt 28.19).

Isso os cristãos primitivos começaram a fazer quando o Espírito Santo da verdade e do poder desceu sobre eles. Eles se tornaram testemunhas de Jesus até os confins da terra (At 1.8), e o faziam “por amor do seu nome” (Rm 1.5; 3Jo 7). Eles sabiam que Deus havia superexaltado a Jesus, entronizando-o à sua direita e concedendo-lhe a mais alta posição, a fim de que toda língua confessasse seu senhorio. Eles queriam que Jesus recebesse a honra devida ao seu nome. Além disso, um dia ele retornará em glória, para salvar, julgar e reinar. Portanto, o que deveria preencher o espaço entre as duas vindas? A missão mundial da Igreja! O fim da História só viria depois que o evangelho alcançasse os confins da terra (comp. Mt 24.14 com 28.20; At 1.8). Os dois fins iriam coincidir.

Nosso mandato para a evangelização do mundo, portanto, é a Bíblia inteira. Deve ser encontrado na criação de Deus, porque todos os seres humanos são responsáveis diante dele; no caráter de Deus, transcendente, amoroso, compassivo, não desejando que ninguém pereça, mas que todos venham ao arrependimento; nas promessas de Deus, que todas as nações sejam benditas por meio da semente de Abraão e venham a ser a herança do Messias; no Cristo de Deus, agora exaltado com autoridade universal, para receber aclamação universal; no Espírito de Deus, que convence do pecado, dá testemunho de Cristo e impele a Igreja a evangelizar; na Igreja de Deus, que é uma comunidade missionária multinacional, com ordens de evangelizar até que Cristo volte.

A dimensão global da missão cristã é irresistível. O cristão individual e as igrejas locais que não se comprometem com a evangelização do mundo estão contradizendo, por cegueira ou por desobediência, uma parte essencial de sua identidade, a qual provém de Deus. O mandato bíblico para a evangelização do mundo não pode ser ignorado.

A mensagem da evangelização mundial

Em segundo lugar, a Bíblia nos disponibiliza a mensagem para a evangelização do mundo. O Pacto de Lausanne define o evangelismo em termos de evangelho. O parágrafo 4 declara: “Evangelizar é difundir as boas novas de que Jesus Cristo morreu por nossos pecados e ressuscitou segundo as Escrituras, e de que, como Senhor e Rei, ele agora oferece o perdão dos pecados e o dom libertador do Espírito a todos os que se arrependem e creem”.

Nossa mensagem vem da Bíblia, mas quando a buscamos nas Escrituras, imediatamente deparamos com um dilema. De um lado, a mensagem nos é outorgada. Não temos permissão de inventá-la. Ela nos foi confiada como um “depósito” precioso, que nós, como servos fiéis, devemos guardar e distribuir na Casa de Deus (1Tm 6.20; 2Tm 1.12-14; 2Co 4.1,2). Por outro lado, não nos foi dada como uma fórmula matemática simples e exata, e sim numa rica diversidade de formulações nas quais foram usadas imagens ou metáforas diferentes.

Portanto, existe apenas um evangelho, no que todos os apóstolos concordam (1Co 15.1), e Paulo podia invocar a maldição de Deus sobre qualquer um, inclusive ele próprio, que pregasse um evangelho “diferente” do evangelho apostólico original da graça de Deus (Gl 1.6-8). No entanto, os apóstolos expressaram esse evangelho único de diversos modos: sacrifical (o derramamento e a aspersão do sangue de Cristo); messiânico (o surgimento do governo prometido por Deus); legal (o juiz pronunciando a justificação do injusto); pessoal (o Pai reconciliando seus filhos desviados); salvífico (o Libertador celestial que veio para resgatar os desamparados); cósmico (o Senhor universal reivindicando domínio universal) — e esses são apenas alguns exemplos.

O evangelho é assim visto como único e, ao mesmo tempo, como diversificado. Ele é “dado” e, ao mesmo tempo, é culturalmente adaptado à sua audiência. Uma vez que percebamos isso, seremos poupados de cometer dois erros opostos. Ao primeiro chamarei “fluidez total”. Certa vez, ouvi um líder de igreja inglês declarar que não existe coisa tal como o evangelho até que estejamos na situação de dar nosso testemunho. Não levamos nada conosco nessa situação, ele disse. Descobrimos o evangelho apenas quando chegamos lá. Concordo plenamente com a necessidade de ser sensível em cada situação, mas, se esse era o ponto que o líder em questão desejava defender, ele o exagerou grosseiramente. Existe uma coisa tal como o evangelho revelado, ou dado, que não temos liberdade para falsificar.

Ao erro oposto chamarei “rigidez total”. Nesse caso, o evangelista se comporta como se Deus tivesse outorgado algumas fórmulas precisas, que temos de repetir mais ou menos palavra por palavra, e certas imagens, que devemos empregar invariavelmente. Isso nos torna escravos de palavras ou de imagens, ou de ambas. Alguns evangelistas fracassam por usar uma linguagem antiquada, enquanto outros se sentem obrigados a mencionar a toda hora “o sangue de Cristo”, “a justificação pela fé”, “o Reino de Deus” ou qualquer outra imagem.

Entre esses dois extremos, há um terceiro e melhor caminho. Ele combina o compromisso com o fato da revelação e com a tarefa da contextualização. Aceita como permanentemente normativas apenas as formulações bíblicas do evangelho e entende que cada tentativa de proclamar o evangelho na linguagem moderna deve justificar-se como expressão autêntica do evangelho bíblico.

Contudo, se ele se recusa a se desfazer das formulações bíblicas, também recusará recitálas de maneira inexpressiva e sem imaginação. Em vez disso, temos de nos ocupar da luta contínua, por meio da oração, do estudo e da discussão, para relacionar o evangelho recebido com determinada situação. Uma vez que ele vem de Deus, devemos preservá-lo; uma vez que se destina aos homens e mulheres dos tempos modernos, temos de interpretá-lo. Temos de combinar fidelidade (pelo estudo constante do texto bíblico) com sensibilidade (pela observação constante do cenário contemporâneo). Só então teremos condições de relacionar, com fidelidade e relevância, a Palavra com o mundo, o evangelho com o contexto, as Escrituras com a cultura.

O modelo para a evangelização mundial

Em terceiro lugar, a Bíblia nos fornece o modelo para a evangelização do mundo. Além da mensagem (o que temos de dizer), precisamos de um modelo (como dizer). A Bíblia supre isto também. Ela não apenas contém o evangelho: ela é o evangelho. Por meio da Bíblia o próprio Deus está evangelizando, isto é, comunicando as boas novas ao mundo. Você deve estar lembrado da declaração de Paulo acerca de Gênesis 12.3, segundo a qual “a Escritura [...] preanunciou o evangelho a Abraão” (Gl 3.8). Toda a Escritura prega o evangelho. Deus evangeliza por meio dela.

Se, portanto, as Escrituras são a evangelização divina, é evidente que podemos aprender a pregar o evangelho, considerando como Deus o fez. Ele nos proporcionou, no processo da inspiração bíblica, um belo modelo evangelístico.

O que de imediato nos surpreende é a grandeza da condescendência de Deus. Ele tem uma verdade sublime para revelar acerca de si mesmo e de seu Cristo, sua misericórdia, sua justiça e sua total salvação. Ele escolheu fazer essa revelação pelo emprego do vocabulário e da gramática da língua humana, de seres humanos, de imagens humanas e de culturas humanas.

Contudo, por meio desse humilde recurso de palavras e imagens humanas, Deus falava as palavras dele. A doutrina evangélica da inspiração das Escrituras enfatiza sua dupla autoria. Homens falaram, e Deus falou. Homens falaram de Deus (2Pe 1.21), e Deus falou por intermédio de homens (Hb 1.1). As palavras faladas e escritas eram de Deus e também deles. Ele decidiu o que queria dizer, mas não sufocou a personalidade humana. Eles usaram suas faculdades livremente, mas não distorceram a mensagem divina. Os cristãos desejam declarar algo semelhante sobre a encarnação, o clímax da autocomunicação de Deus: “O Verbo se fez carne” ( Jo 1.14). Isto é, a Palavra eterna de Deus, que desde a eternidade estava com Deus e era Deus, o Agente através do qual o Universo foi criado, tornou-se um ser humano, com todas as características de um judeu palestino do primeiro século. Ele se tornou pequeno, fraco, pobre e vulnerável. Ele experimentou a dor e a fome e se expôs à tentação. Tudo isso fazia parte da “carne”, isto é, do ser humano que ele se tornou. Tornando-se um de nós, porém, não deixou de ser ele mesmo. Cristo continuou sendo o Verbo eterno, isto é, o Filho eterno de Deus.

Essencialmente, o mesmo princípio é ilustrado pela inspiração das Escrituras e pela encarnação do Filho. O Verbo se fez carne. O divino foi comunicado pelo humano. Deus se identificou conosco, embora não renunciasse à sua identidade, e esse princípio de “identificação sem perda de identidade” é o modelo para toda a evangelização, especialmente a evangelização transcultural.

Alguns de nós se recusam a identificar-se com o povo que alegam servir. Continuamos sendo nós mesmos e não nos tornamos iguais a eles. Permanecemos afastados. Agarramo-nos desesperadamente à nossa herança cultural, com base na concepção errônea de que é parte indispensável de nossa identidade. Não queremos perdê-la e não apenas mantemos nossas práticas culturais com tenacidade feroz, como também tratamos a herança cultural da terra de nossa adoção sem o respeito que merece. Assim, praticamos um duplo tipo de imperialismo cultural, impondo nossa cultura a outros e desprezando a deles. Não foi esse, porém, o procedimento de Cristo, que se esvaziou de sua glória e se humilhou para poder servir.

Outros mensageiros transculturais do evangelho cometem o erro oposto. Tão determinados estão em identificar-se com o povo que vão servir que até abrem mão de seus padrões e valores cristãos, mas esse também não foi o procedimento de Cristo, uma vez que, ao se tornar humano, ele permaneceu verdadeiramente divino. O Pacto de Lausanne, no parágrafo 10, expressa esse princípio nestas palavras: “Os evangelistas de Cristo têm de, humildemente, procurar esvaziar-se de tudo, exceto de sua autenticidade pessoal, a fim de se tornarem servos dos outros, e as igrejas têm de procurar transformar e enriquecer a cultura; tudo para a glória de Deus”.

Temos de lidar com os motivos que levam as pessoas a rejeitar o evangelho e, em particular, dar o devido valor aos fatores culturais. Alguns rejeitam o evangelho não porque o consideram falso, mas porque o acham estranho à sua cultura.

O dr. Renné Padilla foi criticado em Lau sanne, no Congresso sobre a Evangelização Mundial, de 1974, por afirmar que o evangelho que alguns missionários europeus e norte-americanos exportaram foi um “cristianismo cultural”, uma mensagem cristã distorcida pela cultura materialista e consumista do Ocidente. Foi doloroso ouvi-lo dizer isso, mas obviamente ele estava totalmente certo.

Todos nós precisamos sujeitar nosso evangelho a um escrutínio mais crítico, e, numa situação transcultural, os evangelistas visitantes precisam, com humildade, buscar ajuda dos cristãos locais para discernir as distorções culturais de sua mensagem.

Outros rejeitam o evangelho porque percebem que é uma ameaça à sua cultura. É claro que Cristo desafia cada cultura. Sempre que apresentamos o evangelho aos hindus, budistas, judeus, muçulmanos, secularistas ou marxistas, Jesus Cristo os desafia com a exigência de abandonarem tudo a que se dedicaram até o momento e de os substituírem por ele mesmo. Jesus é o Senhor de cada pessoa e de cada cultura. Essa ameaça, essa confrontação não pode ser evitada. Mas não estará o evangelho que proclamamos apresentando às pessoas outras ameaças desnecessárias, ao exigir o abandono de costumes inofensivos ou porque parece destruir a arte, a arquitetura, a música e as festas nacionais, ou porque nós, que o apresentamos, somos orgulhosos de nossa cultura e cegos para a cultura dos outros?

Resumindo, quando Deus nos falou nas Escrituras ele usou linguagem humana e quando nos falou em Cristo assumiu carne humana. A fim de revelar-se, ele se esvaziou e se humilhou. Esse é o modelo de evangelismo que a Bíblia apresenta. Existe autoesvaziamento e auto-humilhação em todo evangelismo autêntico. Sem eles, contradizemos o evangelho e deturpamos o Cristo que proclamamos.

O poder para a evangelização mundial

Em quarto lugar, a Bíblia nos concede o poder para a evangelização do mundo. É quase desnecessário enfatizar nossa necessidade de poder, pois sabemos quanto nossos recursos humanos são fracos em comparação com a magnitude da tarefa. Também sabemos quão blindadas são as defesas do coração humano. Pior ainda, conhecemos a realidade, a maldade e o poder do Diabo e dos demônios sob seu comando.

As pessoas intelectualizadas podem ridicularizar nossas crenças, e até caricaturizá-las, a fim de tornar mais plausível o ridículo da própria condição delas. No entanto, os cristãos evangélicos são simples o bastante para crer no que Jesus e seus apóstolos ensinaram. Para nós, é fato inegável que, na expressão de João, “o mundo inteiro jaz no Maligno” (1Jo 5.19). Até que sejam libertados por Jesus Cristo e transportados para seu Reino, todos os seres humanos são escravos de Satanás. Além disso, percebemos o poder maligno no mundo contemporâneo — nas trevas da idolatria e no medo dos espíritos; na superstição e no fatalismo; na devoção aos deuses que não são deuses; no materialismo egoísta do Ocidente; na propagação do comunismo ateu; na proliferação de sistemas religiosos irracionais; na violência e na agressão; na deterioração generalizada dos padrões absolutos de bondade e verdade. Tudo isso é resultado da obra daquele que nas Escrituras é chamado “mentiroso”, “enganador”, “caluniador” e “homicida”.

Portanto, a conversão e a regeneração cristãs continuam sendo milagres da graça de Deus. Representam o auge de uma luta poderosa entre Cristo e Satanás ou, na marcante figura de linguagem apocalíptica, entre o Cordeiro e o Dragão. O assalto ao palácio do homem forte só é possível porque ele foi amarrado por Alguém que é ainda mais forte e que por sua morte e ressurreição desarmou os principados e potestades do mal e deles se desfez (Mt 12.27-29; Lc 11.20-22; Cl 2.15).

Como então participaremos da vitória de Cristo e derrotaremos o poder do Diabo? Deixemos que Lutero responda à nossa pergunta: Ein wörtlein will ihn fällen. “Vencido cairá por uma só palavra.” Há poder na Palavra de Deus e na pregação do evangelho. Talvez a expressão mais dramática dessa realidade no Novo Testamento esteja em 2Coríntios 4. Paulo faz menção do “deus deste século”, que “cegou o entendimento dos incrédulos, para que lhes não resplandeça a luz do evangelho da glória de Cristo” (v. 4).

Se a mente humana está cega, como poderá enxergar? Somente por meio da Palavra criadora de Deus. Pois foi Deus quem disse que “de trevas resplandecerá luz” que brilhou em nosso coração “para iluminação do conhecimento da glória de Deus, na face de Cristo” (v. 6). Assim, o apóstolo compara o coração não regenerado ao negro caos inicial e atribui a regeneração ao divino fiat: “Haja luz”.

Se Satanás cega as mentes das pessoas e Deus ilumina o coração delas, em que poderemos contribuir para esse encontro? Não seria mais humilde de nossa parte nos retirarmos do campo de batalha e deixar que lutem? Não, essa não é a conclusão a que Paulo chega.

Pelo contrário, entre os versículos 4 e 6, que descrevem as atividades de Deus e Satanás, o versículo 5 diz qual é a obra do evangelista: “Pregamos [...] a Cristo Jesus como Senhor”. Considerando que a luz que o Diabo deseja evitar que as pessoas vejam e que Deus faz brilhar nelas é o evangelho, o melhor a fazer é pregar. Pregar o evangelho, longe de ser desnecessário, é indispensável. É o meio estabelecido por Deus para que o príncipe das trevas seja derrotado e a luz jorre no coração do ser humano. Há poder no evangelho de Deus — poder de Deus para a salvação (Rm 1.16).

Podemos ser muito fracos. Às vezes, desejo que fôssemos ainda mais fracos. Diante das forças do mal, somos tentados a exibir certa força cristã e a nos envolver em pequenas escaramuças verbais em nome do evangelho. Entretanto, é em nossa fraqueza que a força de Cristo se faz perfeita, e são as palavras marcadas pela fraqueza humana que o Espírito reveste com poder. Portanto, é quando somos fracos que somos fortes (1Co 2.1-5; 2Co 12.9-10).

Vamos proclamar a Palavra no mundo!

Não vamos consumir todas as nossas energias discutindo sobre a Palavra de Deus. Em vez disso, vamos começar a usá-la. Ela comprovará sua origem divina por meio do poder divino. Vamos proclamá-la no mundo! Quem dera todos os missionários cristãos e evangelistas proclamassem o evangelho bíblico com fidelidade e sensibilidade e cada pregador cristão fosse um expositor fiel da Palavra de Deus! Então Deus demonstraria seu poder salvador.

Sem a Bíblia, a evangelização do mundo é impossível, pois sem ela não temos nenhum evangelho para levar às nações, nenhuma garantia para oferecer, nenhuma ideia de como fazer a tarefa e nenhuma esperança de sucesso. É a Bíblia que nos dá o mandato, a mensagem, o modelo e o poder de que precisamos para a evangelização do mundo. Portanto, vamos nos apoderar dela outra vez, por intermédio do estudo e da meditação diligentes. Vamos dar atenção aos seus mandamentos, captar sua mensagem, seguir sua orientação e confiar em seu poder. Vamos levantar nossa voz e tornar a Palavra conhecida.

Perguntas para estudo

1.Qual a crença básica deste artigo? Explique a diferença que ela poderá fazer na vida do can-

didato em potencial ao trabalho missionário.

2.Um missionário, depois de enfrentar muitas críticas quanto ao seu trabalho, começou a pro-

curar uma explicação para ter dado esse passo: “Por que estou fazendo este trabalho?”. Com

base no conteúdo deste artigo, o que você diria a ele?

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo adaptado de uma mensagem apresentada numa sessão plenária da Consulta sobre Evangelização Mundial, realizada em junho de 1980, em Pattaya, na Tailândia. Usado com permissão.$conteudo$, 7);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 8) then
    update aulas set titulo = $t$Lição 2 · Guia de estudo — A história de Sua glória$t$, conteudo = $conteudo$A maioria de nós estuda a Bíblia abordando uma história de cada vez. Lições geralmente são aplicadas unicamente às nossas questões pessoais. Por causa disso, pode ser que pensemos, erradamente, que a Bíblia seja uma coleção de histórias desconectadas entre si, sem nenhum propósito maior e integrador. Além disso, ainda podemos estar errados — de um modo bastante egoísta — em pensar que a Bíblia só diz respeito às nossas vidas pessoais. A realidade é que ela diz muito mais sobre Deus do que sobre nós mesmos. Com Deus no centro, a Bíblia pode ser entendida como uma só grande narrativa e não como uma coleção de histórias desunidas e de afirmações antigas. É uma história que percorre cada parte das Escrituras — e ainda está se desdobrando até hoje.

Esta história abrangente da Bíblia é sobre aquilo que Deus começou e um dia completará. Quando observamos Deus agindo ao longo da Bíblia, nos deparamos com Sua paixão zelosa. Cristo quer que participemos dessa paixão para entrarmos em Sua missão.

Um renomado líder de missões disse uma vez: “Deixe meu coração ser partido pelas coisas que partem o coração de Deus”. Mais adiante no curso, exploraremos as coisas que entristecem o coração de Deus. Neste momento, começaremos com o que faz o coração de Deus “vibrar”. Vamos deixar que nossos corações primeiramente se alegrem com as coisas que alegram o coração do Senhor. Então, quando nossos corações estiverem alinhados com os desejos do coração de Deus, teremos nossos corações também partidos com aquilo que parte o coração de Deus.

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Explicar como toda a história da Bíblia se desdobra para o propósito da glória de Deus de se manifestar em uma adoração global.

2. Entender a adoração como um ato relacional em que Deus se revela e que tanto agrada a Deus quanto demonstra o Seu amor pelas pessoas.

3. Explicar a história da Bíblia em que Deus revela Sua glória às nações para receber glória delas.

4. Demonstrar a ligação entre vários eventos principais da história da Bíblia e o tema central do plano divino; receber glória global através da adoração dos povos.

5. Reconhecer o propósito missionário encontrado na oração do “Pai Nosso”.

6. Explicar o significado da frase: “As missões existem, porque não há adoração”.

7. Explicar como Deus sempre usou tanto uma força expansiva quanto uma força atrativa para avançar o Seu propósito missionário.

NO NÍVEL AVANÇADO:

8. Compreender como Jesus envia Seus seguidores em missões, da mesma maneira que o Pai o enviou em missão.

9. Entender que nossa motivação principal na missão é a esperança de que Deus seja amado e adorado entre todos os povos.

10. Dar alguns exemplos bíblicos de como Deus envolve o Seu povo em Sua missão, revelando-a a ele.

11. Explicar como a compaixão pelas necessidades das pessoas pode ser integrada à paixão pela glória de Deus.

Palavra chave:

[cite] PAIXÃO Paixão é dedicação àquilo que é realmente digno. Aqueles que se dedicam àquilo que é o mais digno – a glória de Deus – vivem com um desprendimento cheio de alegria. Os seus corações se satisfazem com o desejo de ver Jesus sendo fervorosamente adorado. Esse amor vem a dominar e integrar todos os demais desejos, de modo que vivam na liberdade de um propósito singular.

1. A HISTÓRIA DA SUA GLÓRIA

A história da Bíblia é mais sobre Deus do que sobre pessoas. Para verificarmos como essas histórias formam uma única e contínua história, precisaremos de um novo entendimento de três termos bíblicos:

Glória: valor intrínseco, substância, brilho e beleza.

O Nome de Deus: além da função de referência e revelação, expressa a reputação pública de Deus.

Adoração: aquilo que glorifica a Deus por reconhecer a Sua glória e por honrá-lo com as ofertas de louvor das nações. Adoração não somente satisfaz e revela a Deus, mas também expressa Seu amor pelos povos, pois os leva ao lugar de maior honra diante dEle.

[cite] Leia Hawthorne (cap. 4, p. 41-43): A História da Sua Glória, até a seção “Adoração”.

As duas direções da glória de Deus. Em toda a Bíblia, o propósito da missão de Deus pode ser visto em duas direções: Deus revela Sua glória a todos os povos para receber glória de todos os povos.

Evangelização mundial é a expressão mais completa que Deus utiliza para revelar Sua glória às nações. O propósito da evangelização mundial é que Deus receba glória das nações.

[cite] Continue lendo Hawthorne: A História da Sua Glória até a seção “A Bíblia como a História de Deus”.

A. Abraão: Um Povo para o Seu nome

Abraão inicia a história glorificando abertamente o nome de Deus. A sua vida nos oferece uma previsão da história que seguiria a família da fé: ele fez o nome de Deus conhecido em adoração. Deus engrandeceu o Seu nome através do Seu grande poder redentor. O resultado foi um evento de adoração multinacional dirigido pela figura messiânica de Melquisedeque. Abraão foi abençoado para abençoar — com um propósito maior — para que as nações adorassem o próprio Deus em gratidão.

[cite] Seguindo os três primeiros exemplos, descreva a reputação que Deus procura, preenchendo os espaços da última coluna do exercício abaixo. Procure os versículos em sua Bíblia.

[cite] A fama de Deus entre as nações O nome de Deus: O fama de Deus: Função: Referência (Palavras Função: Reputação (A expressão pública da usadas para se referir a Deus) fama mundial de Deus)

Melquisedeque - Gênesis 14. 1-20 Na presença de Abraão, o rei do Gênesis 14.20: “... que entregou os seus “Deus altíssimo” adversários nas suas mãos”. sodoma e outros reis

Jetro - Êxodo 18.7 - 12 Êxodo 18.11: “Agora sei que o SENHOR é “O Senhor” (Yahweh) Depois da liberação do Egito maior que todos os deuses”.

Os Gibeonitas - Josué 9. 3-10 Josué 9. 9-10: “... Por causa da fama do Cananeus que fingiram ser um povo “O SENHOR o seu Deus” Senhor, o seu Deus. Pois ouvimos falar dele, que veio de uma terra distante e que de tudo o que fez no Egito”. ouviu o nome de Deus

Moisés - Éxodo 33.15 - 34.8 No sinal, Êxodo 34. 6-7: (Escreva o que Deus prodepois que Deus disse que passaria por “O SENHOR Deus“ clamou ser seu nome (Dica: São os dois Moisés e proclamaria Seu nome versículos inteiros).

Números 14.14: O que as nações tinham Moisés - Números 14. 1-21 ouvido. Depois que Deus disse que Ele Números 14. 15-16: O que as nações condestruiria o povo Moisés orou, com “O SENHOR“ cluíriam se Deus destruísse o povo. argumentos baseados no nome de Números 14. 17-18: O que Moisés entendia Deus ser a vontade de Deus a respeito da Sua reputação entre as nações

Jonas - Jonas 3.4 - 4.2 Jonas 4.2: A verdade sobre Deus que Jonas não “Deus” (Elohim) Compare com Moisés acima: quis divulgar para uma nação gentia.

Malaquias 1.14: Malaquias - Malaquias 1.11-14 ”pois eu sou um grande ______________ Deus descreve como a adoração que é e o meu __________________________ é “O Senhor dos exércitos“ pura e de todo o coração revela a Sua (ou deve ser) _______________________ glória real. entre as __________________”.

B. A Grande Revelação:

Deus revela o Seu nome às nações no Êxodo. O estabelecimento do povo de Israel na terra e a abertura do templo deixaram Seu propósito ainda mais claro.

O Êxodo: O momento crucial em que Deus revela a Si mesmo mundialmente, distinguindo e honrando Seu nome acima de qualquer outro deus.

A Conquista: A maneira que Deus estabeleceu a pureza da adoração a Ele mesmo.

O Templo: A maneira que Deus sinalizou que pessoas de todas as nações poderiam encontrá-lo e adorá-lo pessoalmente.

[cite] Continue lendo Hawthorne (cap. 4, p. 43-47): A História da Sua Glória, até a seção “As nações percebem”.

C. O Grande Adiamento:

Justamente quando parecia que Israel ia fazer conhecido o nome de Deus entre as nações, Salomão abriu caminho para a idolatria. A idolatria profanou, ou tornou comum, o nome da reputação internacional que Deus tinha santificado, ou exaltado, à vista das nações. Então, seguiram-se séculos de altos e baixos na luta contra a idolatria. Deus finalmente retirou o povo da terra e o enviou às nações em um período de cativeiro conhecido como o Exílio.

D. A Persistência de Deus e a Promessa Renovada

Deus nunca desistiu de Sua promessa e de Seu propósito originais. O povo foi trazido de volta à terra, o templo foi reconstruído e o Messias ainda era esperado. A palavra de Deus é clara sobre essa restauração; era tudo para o cumprimento do Seu propósito global. Muitas outras expressões dos salmistas e profetas esclarecem o propósito de Deus de ser adorado.

E. A Glória de Deus em Cristo

Jesus Cristo cumpriu o propósito de revelar a glória de Deus ao mundo para receber glória das nações. Podemos verificar isto em dois aspectos:

Orações pelo Nome. Através da oração que ensinou e das orações que orou, podemos ver como Jesus conduziu toda a Sua vida com a finalidade de cumprir o propósito primeiro de fazer o nome de Deus conhecido em todo o mundo. “Santificado seja o Seu nome” significa que este nome é para ser distinguido, exaltado e honrado. Nenhuma oração poderia ser mais fundamental para o propósito missionário de Deus.

Uma casa de adoração de todos os povos. O texto em Isaías citado por Jesus no templo deixa claro que Deus se alegra em receber adoração de outras nações além daquela de Israel. O templo era destinado a ser um lugar de adoração ao qual todos os povos poderiam facilmente ter acesso para encontrar Deus, adorando-o em oração.

[cite] Leia Isaías 56.6-7 cuidadosamente para ver o contexto da declaração: “porque a minha casa será chamada casa de oração...”. Note as referências à oração no versículo 7. Que tipo de oração é descrita? Quem está oferecendo essa oração? Jesus não somente citou esse versículo, mas também o ensinou quando foi provavelmente o momento mais público do seu ministério (Mc 11.17). Que tipos de oração Jesus queria promover? Esta passagem muitas vezes é usada para encorajar a oração em favor das nações. Esta percepção é válida, mas perde o ponto mais importante do ensino ardente de Cristo e da purificação do templo: a esperança de que as próprias nações orarão em adoração de todo coração.

[cite] Continue lendo Hawthorne (cap. 4, p. 47-53): A História da Sua Glória, até a seção “Um ministério de excelsa glória com Paulo”.

[cite] O que Deus fez para sua glória em cada um dos pontos sucessivos da história? Continue o versículo no espaço abaixo, ou acrescente outro comentário que descreva as ações e intenções de Deus.

2000 a.C. 1600 1200 800 400 0

Abraão Êxodo Conquista Templo Exílio Cristo

Gênesis 12.8 Josué 23. 6-8 Daniel 9.17-19 Marcos 11.17 “Construiu ali um “Não invoquem os “Pois a tua cidade e o “A minha altar dedicado ao nomes dos seus teu povo...” casa será Senhor e...” deuses...” chamada...”

[cite] Êxodo 9. 13-16 1 Reis 8. 41-43 “Deixe o meu povo ir para...” “Quanto ao extrangeiro”

2. MISSÃO CENTRADA EM DEUS

Exploramos como o propósito da glória de Deus se desdobra na história. John Piper reitera o argumento de que devemos concentrar a nossa motivação missionária na glória de Deus em adoração pelas nações. Piper diz que a evangelização mundial é secundária, é o meio para alcançar o fim. A glória de Deus é o propósito primário para a missão. Há missões porque não há adoração.

A. A Paixão de Deus

A supremacia de Deus sobre outros deuses estabelece um fundamento lógico e claro para a missão. Mas, encontramos uma motivação ainda mais forte no entusiasmo inesgotável de Deus, que haja louvor vindo de todas as nações. Adoração é tanto o combustível quanto o alvo de missões.

B. Compaixão centrada em Deus

Chamar as nações à adoração é buscar o melhor interesse delas. Nosso entendimento do valor redentor da adoração pode motivar os nossos atos de compaixão até mesmo quando diminui nosso sentimento de amor uns pelos outros. À medida que as nações veem a dignidade de adorar ao Deus vivo, Seu chamado para se aproximarem através da adoração se torna o auge de todas as bênçãos que Ele concede. Torna-se a mensagem mais fácil de compartilhar no mundo: “Louvai ao Senhor... todos os povos”.

[cite] Leia Piper (cap. 5, p. 57-58): Alegrem-se os povos.

3. CUMPRINDO A TAREFA MISSIONÁRIA

Como deveria Israel cumprir o mandato missionário inerente à promessa de Deus, que através dele todas as nações seriam abençoadas? Pode parecer que Israel teve somente um papel passivo: atraindo as nações à adoração a Deus. Alguns concluem que não houve um mandato ativo para ir às nações até os dias do Novo Testamento. Olhe novamente para o relato bíblico e veja o plano de Deus, firme e constante, tanto enviando seu povo às nações a fim de declarar a verdade no Seu nome, como atraindo as nações para se juntarem ao Seu povo em adoração.

A. Duas Forças

Jonathan Lewis descreve dois mecanismos, ou forças de missão, que estavam constantemente ativas. São elas: Expansiva ou Centrífuga. Encontra-se ao longo da história das Escrituras a dinâmica para fora, o que Lewis chama de força expansiva. Outros a chamam de força centrífuga de missões, ou a estrutura do “ide”.

Atrativa ou Centrípeta. Há também por toda a Bíblia a dinâmica para dentro, o que Lewis chama de força atrativa. Outros a chamam de força centrípeta de missões, ou a estrutura do “vinde”.

[cite] Leia Lewis (dentro do cap. 7, p. 64-65): As duas forças.

B. Jonas

Jonas é um dentre vários personagens no Antigo Testamento que foi enviado por Deus para além das fronteiras de Israel. Johannes Verkuyl não considera o envio de Jonas uma exceção, mas um exemplo da atitude egocêntrica do povo de Deus. Ele crê que, através do Espírito Santo, o livro de Jonas ainda fala para a Igreja de hoje. Note como este livro descreve a ira de Jonas quando Deus demonstra compaixão além das fronteiras de Israel, mesmo sabendo que o próprio nome de Deus devia ser conhecido mundialmente como um Deus “gracioso e compassivo”. Observe a descrição da maneira pela qual Jonas rejeita reconhecer o propósito da aliança de Deus com Israel para a salvação das nações.

[cite] Leia Verkuyl (cap. 8, p. 73-76): A base bíblica do mandato missionário mundial, a partir de “O livro de Jonas” até “O período interbíblico”.

4. O VALOR DE CADA ETNIA

Nos parágrafos finais de “A História da Sua Glória”, Hawthorne afirma que Deus “anseia que o único transbordar de amor, justiça, sabedoria e adoração venha de todos os povos” (página 62b). Aquilo a que Hawthorne se refere como “a maravilha característica de cada grupo de pessoas” é parte do motivo pelo qual o Salmo 96:7 conclama as “famílias dos povos” a dar ao Senhor “glória e força” (ver Hawthorne, página 52b). A beleza e valor das culturas humanas, por mais que, agora, as vejamos distorcidas e obscurecidas pelo mal, é algo que a Bíblia celebra com antecipação. Na era vindoura, embora a cidade de Deus seja iluminada pela glória de Deus (Apocalipse 21:23), ela será adornada com as glórias de todas as etnias da humanidade. As nações “trarão para ela a glória e a honra das nações” (Apocalipse 21:26).

Essa alta consideração pela cultura e pelo calor distintivo de cada tribo, língua e povo pode ser vista nos relatos da criação das Escrituras. Miriam Adeney descreve como Deus capacitou a humanidade para criar cultura e florescer em comunidades distintas. Isso significa que a realidade e o valor de cada etnia estão enraizados na criação. Deus valoriza e se deleita com as culturas da humanidade, mesmo que agora, por causa do pecado, como observa Adeney, “as culturas que criamos agora estão repletas de maldade”. Ao buscarmos cumprir o nosso papel na missão de Deus, devemos avaliar e valorizar a cultura desde o ponto de vista de Deus. O trabalho missionário pode ser visto como uma capacitação dos povos para que eles possam começar a trazer a Deus uma medida da “glória e honra das nações”.

[cite] Leia na plataforma o artigo da Adeney, “Deus é dalgônico?”: O evangelho a globalização e como Deus enxerga a diversidade cultural. Somente a seção “Um lugar na história.”

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

5. COOPERANDO COM DEUS EM MISSÃO

O artigo de Tim Dearborn é um dos mais importantes desse curso. Pondere nele cuidadosamente. Ele faz uma das mais importantes distinções possíveis: Nós podemos ver a nossa missão como uma série de projetos de atendimento a necessidades, energizados pela conscientização dos problemas do mundo, ou podemos enquadrar nosso entendimento de missão como um convite para juntar-se a Deus enquanto Ele realiza Seu propósito no mundo. O que torna possível cumprir a missão na segunda proposta é uma visão de Deus realizando Sua missão através da história. Até aqui no curso, temos traçado a história de como Deus tem buscado Sua glória e Seu Reino.

A. Além da Obrigação

Dearborn explora algumas atitudes comuns em relação à motivação da missão. Ele expõe a inadequação de sermos compelidos pelas necessidades humanas. Se a sua paixão primária é direcionada às atividades da missão, a missão inevitavelmente “se degenerará para uma tarefa cansativa e insuportável”. Em vez disso, ele sugere que há uma única paixão: “Quando o Rei e Seu Reino são a força unificadora e controladora e o único objetivo de tudo o que fazemos”, então, a missão se torna uma aventura de alegria, paixão e esperança.

B. Deus em Missão com Sua Igreja

Dearborn diz que é melhor afirmar que “o Deus da missão tem uma Igreja no mundo” que dizer que “a Igreja tem uma missão para Deus no mundo”. Isso significa que a missão de Deus é sempre maior que a missão que Ele confiou à Sua Igreja. Em um sentido muito real, isso significa que não somos necessários. Como essa ideia se compara com o que Piper e Hawthorne têm afirmado?

C. A Realidade Integradora:

O Rei e Seu Reino. Tantas agendas concorrentes e necessidades divergentes chamam nossa atenção. Elas geralmente se somam a notícias tristes de problemas insolúveis. Ao invés de juntar a isso um desafio exaustivo e sem fim, Dearborn nos chama a enxergar a grande vitória de Cristo e a realidade de como o próprio Deus estabelece Seu Reino vindouro. Ele nos tem concedido um papel fundamental, “mas a obra continua sendo de Deus”. D. Sinais do Reino Anote a declaração de Dearborn de que a Igreja não deve ser um “trilho subterrâneo” para o céu. Temos o privilégio de ter um papel na grande história da revelação do Reino de Deus. Ele deseja que nos tornemos sinais vivos de Seu Reino e promovamos sinais da vida do Reino no mundo. Como esses sinais do Reino de Deus trazem glória a Deus?

[cite] Leia na plataforma Dearborn: Além do Dever.

6. EM MISSÃO COM JESUS

Talvez seja mais importante entender a maneira pela qual Jesus envia os seus seguidores do que entender o que Ele os envia a fazer.

A. Assim Como o Pai Me Enviou

Considere uma das declarações mais poderosas em todas as Escrituras: “Assim como o Pai me enviou, eu os envio” (João 20.21 – NVI).

A maneira de Deus. Podemos entender este versículo como dizendo: “Assim como o Pai me enviou, assim também, da mesma maneira, eu os estou enviando”. Como o Pai enviou o Filho? O Pai amou e ouviu o Filho. O Filho amou e observou o que o Pai iniciou. Jesus, em intimidade dinâmica com o Pai, continuou o que o Pai tinha feito através da história. Jesus envia da mesma maneira pela qual foi enviado. O propósito de Deus. O versículo também significa: “Assim como o Pai me enviou, assim também, vocês são enviados para alcançar o mesmo propósito histórico pelo qual Eu fui enviado”. Isso nos deixa perplexos. Jesus confiou a pessoas comuns as mesmas grandiosas causas que o Pai lhe confiou.

B. Deus em Missão

Henry Blackby e Avery Willis descrevem Deus em missão através da história. Embora as frases sejam curtas e simples, elas são profundas. Como Dearborn, eles descrevem a missão de Deus como uma busca do estabelecimento de Seu Reino, porém integrada ao Seu Reino eles veem o Nome de Deus sendo glorificado e o mundo sendo reconciliado com Deus.

1. Deus dá início à Missão. Examine os exemplos de Deus iniciando um ato de avanço de Sua missão pela revelação do que Ele estava para fazer. Em cada caso, Deus dá a Seu povo uma tarefa para cumprir e ainda assim era Ele quem realizava tudo. Por que Deus escolheu fazer as coisas dessa forma? Blackaby e Willis afirmam que Deus deseja ter um relacionamento poderoso, porém amoroso com o Seu povo.

2. Jesus: Em Missão com Seu Pai. Há inúmeros apelos para entendermos nossa missão como uma imitação ou continuação da obra de Jesus no mundo. O que Blackaby e Willis oferecem é algo bem diferente. Observe. Em vez de um chamado para imitar as atividades de Jesus, eles descrevem o que significa seguir o exemplo de Jesus ao unir-se a Seu Pai na Missão. O resultado foi que “Jesus uniu Sua vida à Missão de Seu Pai”. Considere como você pode estar ouvindo a Deus falar com você no decorrer desse curso. Como você pode decidir seguir o exemplo de Cristo para que você possa unir sua vida com a missão de Deus?

[cite] Leia Blackaby/Willis (cap. 6, p. 59-62): Em missão com Deus.

7. PAIXÃO PELA GLÓRIA DE DEUS

Paulo era motivado pela esperança de que Deus fosse glorificado entre as nações. Conforme descrito em Romanos 15, como era a missão que Paulo visava completar? Pode ou deveria ser a nossa visão hoje? Steven Hawthorne descreve três mudanças práticas que devemos considerar enquanto reconhecemos a nossa parte na história contínua da glória de Deus.

A. Aprofunde a motivação básica

Quando missão é meramente uma resposta compassiva à necessidade humana, a motivação pode se limitar a sentimentos de cuidado para com as pessoas. Mobilização pode se limitar em gerar sentimentos de culpa. Mas, quando se define missão primeiramente como um empreendimento que traz algo para Deus, e em segundo como algo que traz benefício às pessoas, então, tanto a nossa motivação quanto a nossa mobilização pode ser mais equilibradas. Assim, a compaixão de fato pode se aprofundar também. Podemos ser profundamente movidos por necessidades enquanto agimos ousadamente para o mais alto propósito de Deus.

B. Defina a tarefa

Focalizando na glória de Deus, percebemos o valor de plantar igrejas entre os povos: elas se tornam uma expressão da santificação daquilo que há de melhor naquela cultura. Essa pode ser uma das melhores motivações para plantar movimentos de igrejas entre cada grupo étnico. A abordagem de grupos étnicos não é tão importante quanto a visão do resultado de grupos étnicos.

C. Una esforços

O que é mais importante? Evangelismo ou ação social? É uma falsa dicotomia que é resolvida quando olhamos para além daquilo que acontece para as pessoas (o que é geralmente enfatizado tanto em evangelismo quanto em ação social) e tomamos como alvo a glória, o louvor e a honra para Deus. Uma visão singular da glória de Deus pode unir e motivar esforços para servir pessoas na sua necessidade atual tanto quanto salvar pessoas da perdição eterna.

[cite] Continue lendo Hawthorne (cap. 4, p. 53-56): A História da Sua Glória (até o final).

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO

TURA DE DE CO$conteudo$
     where curso_id = v_curso and ordem = 8;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 2 · Guia de estudo — A história de Sua glória$t$, $conteudo$A maioria de nós estuda a Bíblia abordando uma história de cada vez. Lições geralmente são aplicadas unicamente às nossas questões pessoais. Por causa disso, pode ser que pensemos, erradamente, que a Bíblia seja uma coleção de histórias desconectadas entre si, sem nenhum propósito maior e integrador. Além disso, ainda podemos estar errados — de um modo bastante egoísta — em pensar que a Bíblia só diz respeito às nossas vidas pessoais. A realidade é que ela diz muito mais sobre Deus do que sobre nós mesmos. Com Deus no centro, a Bíblia pode ser entendida como uma só grande narrativa e não como uma coleção de histórias desunidas e de afirmações antigas. É uma história que percorre cada parte das Escrituras — e ainda está se desdobrando até hoje.

Esta história abrangente da Bíblia é sobre aquilo que Deus começou e um dia completará. Quando observamos Deus agindo ao longo da Bíblia, nos deparamos com Sua paixão zelosa. Cristo quer que participemos dessa paixão para entrarmos em Sua missão.

Um renomado líder de missões disse uma vez: “Deixe meu coração ser partido pelas coisas que partem o coração de Deus”. Mais adiante no curso, exploraremos as coisas que entristecem o coração de Deus. Neste momento, começaremos com o que faz o coração de Deus “vibrar”. Vamos deixar que nossos corações primeiramente se alegrem com as coisas que alegram o coração do Senhor. Então, quando nossos corações estiverem alinhados com os desejos do coração de Deus, teremos nossos corações também partidos com aquilo que parte o coração de Deus.

ESTUDAR ESTA LIÇÃO O AJUDARÁ A:

1. Explicar como toda a história da Bíblia se desdobra para o propósito da glória de Deus de se manifestar em uma adoração global.

2. Entender a adoração como um ato relacional em que Deus se revela e que tanto agrada a Deus quanto demonstra o Seu amor pelas pessoas.

3. Explicar a história da Bíblia em que Deus revela Sua glória às nações para receber glória delas.

4. Demonstrar a ligação entre vários eventos principais da história da Bíblia e o tema central do plano divino; receber glória global através da adoração dos povos.

5. Reconhecer o propósito missionário encontrado na oração do “Pai Nosso”.

6. Explicar o significado da frase: “As missões existem, porque não há adoração”.

7. Explicar como Deus sempre usou tanto uma força expansiva quanto uma força atrativa para avançar o Seu propósito missionário.

NO NÍVEL AVANÇADO:

8. Compreender como Jesus envia Seus seguidores em missões, da mesma maneira que o Pai o enviou em missão.

9. Entender que nossa motivação principal na missão é a esperança de que Deus seja amado e adorado entre todos os povos.

10. Dar alguns exemplos bíblicos de como Deus envolve o Seu povo em Sua missão, revelando-a a ele.

11. Explicar como a compaixão pelas necessidades das pessoas pode ser integrada à paixão pela glória de Deus.

Palavra chave:

[cite] PAIXÃO Paixão é dedicação àquilo que é realmente digno. Aqueles que se dedicam àquilo que é o mais digno – a glória de Deus – vivem com um desprendimento cheio de alegria. Os seus corações se satisfazem com o desejo de ver Jesus sendo fervorosamente adorado. Esse amor vem a dominar e integrar todos os demais desejos, de modo que vivam na liberdade de um propósito singular.

1. A HISTÓRIA DA SUA GLÓRIA

A história da Bíblia é mais sobre Deus do que sobre pessoas. Para verificarmos como essas histórias formam uma única e contínua história, precisaremos de um novo entendimento de três termos bíblicos:

Glória: valor intrínseco, substância, brilho e beleza.

O Nome de Deus: além da função de referência e revelação, expressa a reputação pública de Deus.

Adoração: aquilo que glorifica a Deus por reconhecer a Sua glória e por honrá-lo com as ofertas de louvor das nações. Adoração não somente satisfaz e revela a Deus, mas também expressa Seu amor pelos povos, pois os leva ao lugar de maior honra diante dEle.

[cite] Leia Hawthorne (cap. 4, p. 41-43): A História da Sua Glória, até a seção “Adoração”.

As duas direções da glória de Deus. Em toda a Bíblia, o propósito da missão de Deus pode ser visto em duas direções: Deus revela Sua glória a todos os povos para receber glória de todos os povos.

Evangelização mundial é a expressão mais completa que Deus utiliza para revelar Sua glória às nações. O propósito da evangelização mundial é que Deus receba glória das nações.

[cite] Continue lendo Hawthorne: A História da Sua Glória até a seção “A Bíblia como a História de Deus”.

A. Abraão: Um Povo para o Seu nome

Abraão inicia a história glorificando abertamente o nome de Deus. A sua vida nos oferece uma previsão da história que seguiria a família da fé: ele fez o nome de Deus conhecido em adoração. Deus engrandeceu o Seu nome através do Seu grande poder redentor. O resultado foi um evento de adoração multinacional dirigido pela figura messiânica de Melquisedeque. Abraão foi abençoado para abençoar — com um propósito maior — para que as nações adorassem o próprio Deus em gratidão.

[cite] Seguindo os três primeiros exemplos, descreva a reputação que Deus procura, preenchendo os espaços da última coluna do exercício abaixo. Procure os versículos em sua Bíblia.

[cite] A fama de Deus entre as nações O nome de Deus: O fama de Deus: Função: Referência (Palavras Função: Reputação (A expressão pública da usadas para se referir a Deus) fama mundial de Deus)

Melquisedeque - Gênesis 14. 1-20 Na presença de Abraão, o rei do Gênesis 14.20: “... que entregou os seus “Deus altíssimo” adversários nas suas mãos”. sodoma e outros reis

Jetro - Êxodo 18.7 - 12 Êxodo 18.11: “Agora sei que o SENHOR é “O Senhor” (Yahweh) Depois da liberação do Egito maior que todos os deuses”.

Os Gibeonitas - Josué 9. 3-10 Josué 9. 9-10: “... Por causa da fama do Cananeus que fingiram ser um povo “O SENHOR o seu Deus” Senhor, o seu Deus. Pois ouvimos falar dele, que veio de uma terra distante e que de tudo o que fez no Egito”. ouviu o nome de Deus

Moisés - Éxodo 33.15 - 34.8 No sinal, Êxodo 34. 6-7: (Escreva o que Deus prodepois que Deus disse que passaria por “O SENHOR Deus“ clamou ser seu nome (Dica: São os dois Moisés e proclamaria Seu nome versículos inteiros).

Números 14.14: O que as nações tinham Moisés - Números 14. 1-21 ouvido. Depois que Deus disse que Ele Números 14. 15-16: O que as nações condestruiria o povo Moisés orou, com “O SENHOR“ cluíriam se Deus destruísse o povo. argumentos baseados no nome de Números 14. 17-18: O que Moisés entendia Deus ser a vontade de Deus a respeito da Sua reputação entre as nações

Jonas - Jonas 3.4 - 4.2 Jonas 4.2: A verdade sobre Deus que Jonas não “Deus” (Elohim) Compare com Moisés acima: quis divulgar para uma nação gentia.

Malaquias 1.14: Malaquias - Malaquias 1.11-14 ”pois eu sou um grande ______________ Deus descreve como a adoração que é e o meu __________________________ é “O Senhor dos exércitos“ pura e de todo o coração revela a Sua (ou deve ser) _______________________ glória real. entre as __________________”.

B. A Grande Revelação:

Deus revela o Seu nome às nações no Êxodo. O estabelecimento do povo de Israel na terra e a abertura do templo deixaram Seu propósito ainda mais claro.

O Êxodo: O momento crucial em que Deus revela a Si mesmo mundialmente, distinguindo e honrando Seu nome acima de qualquer outro deus.

A Conquista: A maneira que Deus estabeleceu a pureza da adoração a Ele mesmo.

O Templo: A maneira que Deus sinalizou que pessoas de todas as nações poderiam encontrá-lo e adorá-lo pessoalmente.

[cite] Continue lendo Hawthorne (cap. 4, p. 43-47): A História da Sua Glória, até a seção “As nações percebem”.

C. O Grande Adiamento:

Justamente quando parecia que Israel ia fazer conhecido o nome de Deus entre as nações, Salomão abriu caminho para a idolatria. A idolatria profanou, ou tornou comum, o nome da reputação internacional que Deus tinha santificado, ou exaltado, à vista das nações. Então, seguiram-se séculos de altos e baixos na luta contra a idolatria. Deus finalmente retirou o povo da terra e o enviou às nações em um período de cativeiro conhecido como o Exílio.

D. A Persistência de Deus e a Promessa Renovada

Deus nunca desistiu de Sua promessa e de Seu propósito originais. O povo foi trazido de volta à terra, o templo foi reconstruído e o Messias ainda era esperado. A palavra de Deus é clara sobre essa restauração; era tudo para o cumprimento do Seu propósito global. Muitas outras expressões dos salmistas e profetas esclarecem o propósito de Deus de ser adorado.

E. A Glória de Deus em Cristo

Jesus Cristo cumpriu o propósito de revelar a glória de Deus ao mundo para receber glória das nações. Podemos verificar isto em dois aspectos:

Orações pelo Nome. Através da oração que ensinou e das orações que orou, podemos ver como Jesus conduziu toda a Sua vida com a finalidade de cumprir o propósito primeiro de fazer o nome de Deus conhecido em todo o mundo. “Santificado seja o Seu nome” significa que este nome é para ser distinguido, exaltado e honrado. Nenhuma oração poderia ser mais fundamental para o propósito missionário de Deus.

Uma casa de adoração de todos os povos. O texto em Isaías citado por Jesus no templo deixa claro que Deus se alegra em receber adoração de outras nações além daquela de Israel. O templo era destinado a ser um lugar de adoração ao qual todos os povos poderiam facilmente ter acesso para encontrar Deus, adorando-o em oração.

[cite] Leia Isaías 56.6-7 cuidadosamente para ver o contexto da declaração: “porque a minha casa será chamada casa de oração...”. Note as referências à oração no versículo 7. Que tipo de oração é descrita? Quem está oferecendo essa oração? Jesus não somente citou esse versículo, mas também o ensinou quando foi provavelmente o momento mais público do seu ministério (Mc 11.17). Que tipos de oração Jesus queria promover? Esta passagem muitas vezes é usada para encorajar a oração em favor das nações. Esta percepção é válida, mas perde o ponto mais importante do ensino ardente de Cristo e da purificação do templo: a esperança de que as próprias nações orarão em adoração de todo coração.

[cite] Continue lendo Hawthorne (cap. 4, p. 47-53): A História da Sua Glória, até a seção “Um ministério de excelsa glória com Paulo”.

[cite] O que Deus fez para sua glória em cada um dos pontos sucessivos da história? Continue o versículo no espaço abaixo, ou acrescente outro comentário que descreva as ações e intenções de Deus.

2000 a.C. 1600 1200 800 400 0

Abraão Êxodo Conquista Templo Exílio Cristo

Gênesis 12.8 Josué 23. 6-8 Daniel 9.17-19 Marcos 11.17 “Construiu ali um “Não invoquem os “Pois a tua cidade e o “A minha altar dedicado ao nomes dos seus teu povo...” casa será Senhor e...” deuses...” chamada...”

[cite] Êxodo 9. 13-16 1 Reis 8. 41-43 “Deixe o meu povo ir para...” “Quanto ao extrangeiro”

2. MISSÃO CENTRADA EM DEUS

Exploramos como o propósito da glória de Deus se desdobra na história. John Piper reitera o argumento de que devemos concentrar a nossa motivação missionária na glória de Deus em adoração pelas nações. Piper diz que a evangelização mundial é secundária, é o meio para alcançar o fim. A glória de Deus é o propósito primário para a missão. Há missões porque não há adoração.

A. A Paixão de Deus

A supremacia de Deus sobre outros deuses estabelece um fundamento lógico e claro para a missão. Mas, encontramos uma motivação ainda mais forte no entusiasmo inesgotável de Deus, que haja louvor vindo de todas as nações. Adoração é tanto o combustível quanto o alvo de missões.

B. Compaixão centrada em Deus

Chamar as nações à adoração é buscar o melhor interesse delas. Nosso entendimento do valor redentor da adoração pode motivar os nossos atos de compaixão até mesmo quando diminui nosso sentimento de amor uns pelos outros. À medida que as nações veem a dignidade de adorar ao Deus vivo, Seu chamado para se aproximarem através da adoração se torna o auge de todas as bênçãos que Ele concede. Torna-se a mensagem mais fácil de compartilhar no mundo: “Louvai ao Senhor... todos os povos”.

[cite] Leia Piper (cap. 5, p. 57-58): Alegrem-se os povos.

3. CUMPRINDO A TAREFA MISSIONÁRIA

Como deveria Israel cumprir o mandato missionário inerente à promessa de Deus, que através dele todas as nações seriam abençoadas? Pode parecer que Israel teve somente um papel passivo: atraindo as nações à adoração a Deus. Alguns concluem que não houve um mandato ativo para ir às nações até os dias do Novo Testamento. Olhe novamente para o relato bíblico e veja o plano de Deus, firme e constante, tanto enviando seu povo às nações a fim de declarar a verdade no Seu nome, como atraindo as nações para se juntarem ao Seu povo em adoração.

A. Duas Forças

Jonathan Lewis descreve dois mecanismos, ou forças de missão, que estavam constantemente ativas. São elas: Expansiva ou Centrífuga. Encontra-se ao longo da história das Escrituras a dinâmica para fora, o que Lewis chama de força expansiva. Outros a chamam de força centrífuga de missões, ou a estrutura do “ide”.

Atrativa ou Centrípeta. Há também por toda a Bíblia a dinâmica para dentro, o que Lewis chama de força atrativa. Outros a chamam de força centrípeta de missões, ou a estrutura do “vinde”.

[cite] Leia Lewis (dentro do cap. 7, p. 64-65): As duas forças.

B. Jonas

Jonas é um dentre vários personagens no Antigo Testamento que foi enviado por Deus para além das fronteiras de Israel. Johannes Verkuyl não considera o envio de Jonas uma exceção, mas um exemplo da atitude egocêntrica do povo de Deus. Ele crê que, através do Espírito Santo, o livro de Jonas ainda fala para a Igreja de hoje. Note como este livro descreve a ira de Jonas quando Deus demonstra compaixão além das fronteiras de Israel, mesmo sabendo que o próprio nome de Deus devia ser conhecido mundialmente como um Deus “gracioso e compassivo”. Observe a descrição da maneira pela qual Jonas rejeita reconhecer o propósito da aliança de Deus com Israel para a salvação das nações.

[cite] Leia Verkuyl (cap. 8, p. 73-76): A base bíblica do mandato missionário mundial, a partir de “O livro de Jonas” até “O período interbíblico”.

4. O VALOR DE CADA ETNIA

Nos parágrafos finais de “A História da Sua Glória”, Hawthorne afirma que Deus “anseia que o único transbordar de amor, justiça, sabedoria e adoração venha de todos os povos” (página 62b). Aquilo a que Hawthorne se refere como “a maravilha característica de cada grupo de pessoas” é parte do motivo pelo qual o Salmo 96:7 conclama as “famílias dos povos” a dar ao Senhor “glória e força” (ver Hawthorne, página 52b). A beleza e valor das culturas humanas, por mais que, agora, as vejamos distorcidas e obscurecidas pelo mal, é algo que a Bíblia celebra com antecipação. Na era vindoura, embora a cidade de Deus seja iluminada pela glória de Deus (Apocalipse 21:23), ela será adornada com as glórias de todas as etnias da humanidade. As nações “trarão para ela a glória e a honra das nações” (Apocalipse 21:26).

Essa alta consideração pela cultura e pelo calor distintivo de cada tribo, língua e povo pode ser vista nos relatos da criação das Escrituras. Miriam Adeney descreve como Deus capacitou a humanidade para criar cultura e florescer em comunidades distintas. Isso significa que a realidade e o valor de cada etnia estão enraizados na criação. Deus valoriza e se deleita com as culturas da humanidade, mesmo que agora, por causa do pecado, como observa Adeney, “as culturas que criamos agora estão repletas de maldade”. Ao buscarmos cumprir o nosso papel na missão de Deus, devemos avaliar e valorizar a cultura desde o ponto de vista de Deus. O trabalho missionário pode ser visto como uma capacitação dos povos para que eles possam começar a trazer a Deus uma medida da “glória e honra das nações”.

[cite] Leia na plataforma o artigo da Adeney, “Deus é dalgônico?”: O evangelho a globalização e como Deus enxerga a diversidade cultural. Somente a seção “Um lugar na história.”

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL BÁSICO

5. COOPERANDO COM DEUS EM MISSÃO

O artigo de Tim Dearborn é um dos mais importantes desse curso. Pondere nele cuidadosamente. Ele faz uma das mais importantes distinções possíveis: Nós podemos ver a nossa missão como uma série de projetos de atendimento a necessidades, energizados pela conscientização dos problemas do mundo, ou podemos enquadrar nosso entendimento de missão como um convite para juntar-se a Deus enquanto Ele realiza Seu propósito no mundo. O que torna possível cumprir a missão na segunda proposta é uma visão de Deus realizando Sua missão através da história. Até aqui no curso, temos traçado a história de como Deus tem buscado Sua glória e Seu Reino.

A. Além da Obrigação

Dearborn explora algumas atitudes comuns em relação à motivação da missão. Ele expõe a inadequação de sermos compelidos pelas necessidades humanas. Se a sua paixão primária é direcionada às atividades da missão, a missão inevitavelmente “se degenerará para uma tarefa cansativa e insuportável”. Em vez disso, ele sugere que há uma única paixão: “Quando o Rei e Seu Reino são a força unificadora e controladora e o único objetivo de tudo o que fazemos”, então, a missão se torna uma aventura de alegria, paixão e esperança.

B. Deus em Missão com Sua Igreja

Dearborn diz que é melhor afirmar que “o Deus da missão tem uma Igreja no mundo” que dizer que “a Igreja tem uma missão para Deus no mundo”. Isso significa que a missão de Deus é sempre maior que a missão que Ele confiou à Sua Igreja. Em um sentido muito real, isso significa que não somos necessários. Como essa ideia se compara com o que Piper e Hawthorne têm afirmado?

C. A Realidade Integradora:

O Rei e Seu Reino. Tantas agendas concorrentes e necessidades divergentes chamam nossa atenção. Elas geralmente se somam a notícias tristes de problemas insolúveis. Ao invés de juntar a isso um desafio exaustivo e sem fim, Dearborn nos chama a enxergar a grande vitória de Cristo e a realidade de como o próprio Deus estabelece Seu Reino vindouro. Ele nos tem concedido um papel fundamental, “mas a obra continua sendo de Deus”. D. Sinais do Reino Anote a declaração de Dearborn de que a Igreja não deve ser um “trilho subterrâneo” para o céu. Temos o privilégio de ter um papel na grande história da revelação do Reino de Deus. Ele deseja que nos tornemos sinais vivos de Seu Reino e promovamos sinais da vida do Reino no mundo. Como esses sinais do Reino de Deus trazem glória a Deus?

[cite] Leia na plataforma Dearborn: Além do Dever.

6. EM MISSÃO COM JESUS

Talvez seja mais importante entender a maneira pela qual Jesus envia os seus seguidores do que entender o que Ele os envia a fazer.

A. Assim Como o Pai Me Enviou

Considere uma das declarações mais poderosas em todas as Escrituras: “Assim como o Pai me enviou, eu os envio” (João 20.21 – NVI).

A maneira de Deus. Podemos entender este versículo como dizendo: “Assim como o Pai me enviou, assim também, da mesma maneira, eu os estou enviando”. Como o Pai enviou o Filho? O Pai amou e ouviu o Filho. O Filho amou e observou o que o Pai iniciou. Jesus, em intimidade dinâmica com o Pai, continuou o que o Pai tinha feito através da história. Jesus envia da mesma maneira pela qual foi enviado. O propósito de Deus. O versículo também significa: “Assim como o Pai me enviou, assim também, vocês são enviados para alcançar o mesmo propósito histórico pelo qual Eu fui enviado”. Isso nos deixa perplexos. Jesus confiou a pessoas comuns as mesmas grandiosas causas que o Pai lhe confiou.

B. Deus em Missão

Henry Blackby e Avery Willis descrevem Deus em missão através da história. Embora as frases sejam curtas e simples, elas são profundas. Como Dearborn, eles descrevem a missão de Deus como uma busca do estabelecimento de Seu Reino, porém integrada ao Seu Reino eles veem o Nome de Deus sendo glorificado e o mundo sendo reconciliado com Deus.

1. Deus dá início à Missão. Examine os exemplos de Deus iniciando um ato de avanço de Sua missão pela revelação do que Ele estava para fazer. Em cada caso, Deus dá a Seu povo uma tarefa para cumprir e ainda assim era Ele quem realizava tudo. Por que Deus escolheu fazer as coisas dessa forma? Blackaby e Willis afirmam que Deus deseja ter um relacionamento poderoso, porém amoroso com o Seu povo.

2. Jesus: Em Missão com Seu Pai. Há inúmeros apelos para entendermos nossa missão como uma imitação ou continuação da obra de Jesus no mundo. O que Blackaby e Willis oferecem é algo bem diferente. Observe. Em vez de um chamado para imitar as atividades de Jesus, eles descrevem o que significa seguir o exemplo de Jesus ao unir-se a Seu Pai na Missão. O resultado foi que “Jesus uniu Sua vida à Missão de Seu Pai”. Considere como você pode estar ouvindo a Deus falar com você no decorrer desse curso. Como você pode decidir seguir o exemplo de Cristo para que você possa unir sua vida com a missão de Deus?

[cite] Leia Blackaby/Willis (cap. 6, p. 59-62): Em missão com Deus.

7. PAIXÃO PELA GLÓRIA DE DEUS

Paulo era motivado pela esperança de que Deus fosse glorificado entre as nações. Conforme descrito em Romanos 15, como era a missão que Paulo visava completar? Pode ou deveria ser a nossa visão hoje? Steven Hawthorne descreve três mudanças práticas que devemos considerar enquanto reconhecemos a nossa parte na história contínua da glória de Deus.

A. Aprofunde a motivação básica

Quando missão é meramente uma resposta compassiva à necessidade humana, a motivação pode se limitar a sentimentos de cuidado para com as pessoas. Mobilização pode se limitar em gerar sentimentos de culpa. Mas, quando se define missão primeiramente como um empreendimento que traz algo para Deus, e em segundo como algo que traz benefício às pessoas, então, tanto a nossa motivação quanto a nossa mobilização pode ser mais equilibradas. Assim, a compaixão de fato pode se aprofundar também. Podemos ser profundamente movidos por necessidades enquanto agimos ousadamente para o mais alto propósito de Deus.

B. Defina a tarefa

Focalizando na glória de Deus, percebemos o valor de plantar igrejas entre os povos: elas se tornam uma expressão da santificação daquilo que há de melhor naquela cultura. Essa pode ser uma das melhores motivações para plantar movimentos de igrejas entre cada grupo étnico. A abordagem de grupos étnicos não é tão importante quanto a visão do resultado de grupos étnicos.

C. Una esforços

O que é mais importante? Evangelismo ou ação social? É uma falsa dicotomia que é resolvida quando olhamos para além daquilo que acontece para as pessoas (o que é geralmente enfatizado tanto em evangelismo quanto em ação social) e tomamos como alvo a glória, o louvor e a honra para Deus. Uma visão singular da glória de Deus pode unir e motivar esforços para servir pessoas na sua necessidade atual tanto quanto salvar pessoas da perdição eterna.

[cite] Continue lendo Hawthorne (cap. 4, p. 53-56): A História da Sua Glória (até o final).

[cite] CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO

TURA DE DE CO$conteudo$, 8);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 9) then
    update aulas set titulo = $t$Lição 2 · Leitura — Hawthorne, cap. 4: A História da Sua Glória$t$, conteudo = $conteudo$A história de sua glória

Steven C. Hawthorne

A Bíblia é, basicamente, uma história sobre Deus. Quando olhamos as Escrituras como um livro de autoajuda, acabamos entediados ou frustrados com o que parece ser uma coleção de histórias desconexas. O que aconteceria se descobríssemos que a Bíblia fala mais a respeito de Deus que de nós? Como é emocionante descobrir que todos os elementos das Escrituras — os relatos dos acontecimentos, os versículos de refinada sabedoria, as profecias líricas — convergem numa saga central dessa respeitável pessoa.

Estamos habituados com a ideia de que a Bíblia é uma história verídica. É tão verídica que continua a desenrolar-se neste instante. Estamos acostumados a ouvir que a Bíblia é uma história de amor, mas tendemos ver apenas um lado da história: como Deus ama o ser humano. Se a principal mensagem da Bíblia é que Deus deve ser amado de todo o coração, alma, mente e força, talvez seja sábio ler toda a história do ponto de vista de Deus. Quando partimos do ponto de vista de Deus, a grande história de amor finalmente faz sentido: não é apenas Deus amando as pessoas. Ele as está transformando para que também sejam capazes de amá-lo plenamente. Deus está atraindo adoradores que, espontaneamente, inspirados pelo amor, rendam glória a ele.

Deus só pode ser amado na medida em que é conhecido. É por isso que a história da Bíblia é a história de Deus se revelando para atrair a si obediente adoração e a glória das nações. Com o amor passional de Deus no centro, a Bíblia é realmente a história de sua glória.

CONCEITO BÁSICO DE GLÓRIA

Para traçar a história de Deus como a Bíblia a apresenta, precisamos compreender três ideias relacionadas que definem a história em cada conjuntura: glória, o nome de Deus e adoração.

Glória

Não se deixe levar pelo tom religioso da palavra “glória”. Glória é a beleza relacionada com o que o coração almeja até que efetivamente alcance. A palavra “glória”, nas Escrituras, refere-se à dignidade, à beleza ou ao valor essencial das pessoas, das criaturas e, é claro, do Criador. A palavra hebraica para “glória” significa

“peso”, “substância” e, ao mesmo tempo, “brilho” ou “beleza radiante”. Glorificar alguém é reconhecer seu valor e sua beleza intrínseca; é falar publicamente desses atributos. Glorificar a Deus é louvar ou falar dele aberta e sinceramente. A glória está no coração da verdadeira adoração ao longo das Escrituras: “Todas as nações que fizeste virão, prostrar-se-ão diante de ti, Senhor, e glorificarão o teu nome” (Sl 86.9); “Nós que adoramos a Deus no Espírito, e nos gloriamos em Cristo Jesus...” (Fp 3.3).

A ideia de “glória” também abrange a honra que pode ser dada como presente ou recompensa. Quando alguém é exaltado ou engrandecido, ele é, de certa forma, no sentido bíblico, glorificado. Por ser tão rico em glória, Deus concede extravagantes honras aos seus servos humanos sem comprometer em nada a própria majestade. Jesus expôs nosso hábito de buscar glória “uns dos outros”, mas não “a glória que vem do Deus único” ( Jo 5.44).

O nome de Deus

Por toda a história sagrada, os autores bíblicos usam a ideia do “nome de Deus” como um conceito-chave. Para distinguir as funções de referência, revelação e de reputação, talvez seja útil classificar esse nome em três categorias fáceis de lembrar: crachá, vitrine e nome artístico.

Nome de crachá

Existem nomes próprios usados para designar Deus na Bíblia. Deus nunca é anônimo em sua história. Ele usa muitos nomes para si. Como a função é referencial, podemos chamar esses nomes, para nossos propósitos, “nomes de crachá” de Deus, visto que o crachá é o que distingue e identifica alguém. É igualmente verdadeiro referir-se ao Deus das Escrituras como “Senhor dos Exércitos” e como “Deus Todo-Poderoso”, ou “Juiz de toda a terra”, ou “Rei da Glória”. Cada um desses nomes é, de fato, o nome de Deus.

Nome de vitrine

A vitrine serve para expor ou apresentar algo ao público. Deus gosta de se apresentar com seus nomes bíblicos. Nessa analogia, a função é a revelação. Por exemplo, qualquer um que passe alguns minutos pensando no nome “O Senhor é o meu Pastor” terá um entendimento melhor da bondade de Deus.

Nome artí sti co

A terceira categoria dos nomes de Deus é a mais abundante na Bíblia, embora seja pouco reconhecida. O “nome de Deus”, na maioria das vezes, refere-se à ideia de seu reconhecimento público. Seria algo como o “nome artístico” de Deus. Sua função é indicar a reputação de Deus. O nome de Deus é seu título global. É a memória aberta, baseada em eventos históricos, que estabelece uma reputação digna de futura confiança. O nome de Deus é o corpo de verdades a seu respeito que ele demonstrou e declarou no desenrolar da história bíblica. O povo hebreu devia não só valorizar essa história, mas também divulgá-la. Diferentemente das outras religiões, a revelação de Deus nunca foi destinada a ser uma questão secreta para determinados povos. Isaías pede a Israel: “Tornai manifestos os seus feitos entre os povos”, para que as nações se lembrem de que “é excelso o seu nome” (Is 12.4). Como veremos a seguir, grande parte da história bíblica reconta o que Deus tem feito para tornar seu nome conhecido entre as nações.

Adoração

Por que Deus quer ser conhecido em tal profundidade? Ele quer ser mais que mundialmente famoso: ele deseja ser verdadeiramente adorado.

Deus revela glória para receber glória

A glória de Deus flui em duas direções. A primeira é para o mundo. Ele mostra sua glória à humanidade por toda a terra. Ele revela quem é e o que tem feito a fim de abrir caminho para o segundo direcionamento de sua glória — que os seres humanos possam dar-lhe glória por meio de uma adoração motivada pelo amor. Deus revela glória a todas as nações, a fim de receber glória da humanidade pela adoração.

O salmo 96 mostra as duas direções da glória de Deus. Ele exige a proclamação de sua glória às nações: “Cantai ao Senhor, bendizei o seu nome; proclamai a sua salvação, dia após dia. Anunciai entre as nações a sua glória, entre todos os povos, as suas maravilhas” (v. 1,2).

Que retrato eloquente da evangelização do mundo! Contudo, o salmista faz questão de dizer o propósito da evangelização mundial ao mostrar o segundo aspecto da glória de Deus — a resposta de glória das nações a Deus: “Tributai ao Senhor, ó famílias dos povos, tributai ao Senhor glória e força. Tributai ao Senhor a glória devida ao seu nome; trazei oferendas e entrai nos seus átrios. Adorai o Senhor na beleza da sua santidade; tremei diante dele, todas as terras” (v. 7-9).

O coração das missões flui nesta maravilhosa economia da glória: Deus revela sua glória a todas as nações para receber glória de toda a criação.

Um propósito além da salvação

O ser humano é, de fato, salvo por meio da declaração universal da salvação de Deus, mas o valor máximo dessa salvação não reside apenas na condição de salvo, ou seja, de que ele foi salvo.

O que realmente importa é para que foi salvo. Ele foi salvo para servir a Deus em atitude de adoração. Nesse sentido, podemos dizer que a evangelização mundial é feita para Deus. Por mais acostumados que estejamos a ter os seres humanos em altíssima conta, a Bíblia é clara: o raciocínio por trás das missões é a colossal dignidade de Deus. Observe a lógica de Salmos 96.2-4: “Proclamai a sua salvação, dia após dia [...] entre todos os povos. [...] Porque grande é o Senhor e mui digno de ser louvado, temível mais que todos os deuses”.

Uma lógica maior do que mera supremacia

A lógica por trás de missões parece bastante simples: visto que Deus é supremo, toda criatura deve prostrar-se em submissão a ele. Mas seria apenas isso a lógica no centro do Universo? Nossa mente não se satisfaz com essa ideia. Existe algo mais. As Escrituras afirmam com veemência a verdade de que Deus é amor. Deus convida os seres humanos a amá-lo com tudo que são. Onde está o amor de Deus? E o nosso, como resposta?

Um Deus que exige adoração só porque é supremo não nos parece ser tão amoroso — na verdade, nem mesmo digno de admiração. A exigência de louvor faz parecer que Deus está lutando com um problema de baixa autoestima. É tolice falar do zelo de Deus pela adoração como se ele fosse uma divindade tribal petulante ameaçada por deuses rivais. Deus nunca é ameaçado, ele se entristece com a falsa adoração. Quando adora qualquer um ou qualquer coisa além de Deus, o ser humano se torna semelhante ao objeto de sua adoração. Deus tem intenções melhores para com a humanidade.

Então, o que é verdadeira adoração? A adoração ocorre quando a pessoa reconhece quem Deus é, quando torna esse reconhecimento público, quando se aproxima dele de livre vontade, oferecendo-lhe face a face gratidão e, diariamente, lealdade. A adoração é um genuíno relacionamento de interação com Deus. É por isso que Deus sempre nos recebe quando nos

[cite] E o nome Javé, ou Jeová, como vemos em algumas traduções, sem dúvida é um nome importante, mas precisamos ter cuidado para não pensar que o Deus vivo tem um único nome jurídico “real”, como se ele tivesse certidão de nascimento em algum arquivo por aí. A Bíblia é consistente em nos impulsionar a conhecê-lo como ele deseja ser universalmente conhecido. A questão de Êxodo 3.13 provavelmente não é de referência (“Qual deus você está representando, Moisés?”), mas de reputação (“Que histórico esse Deus construiu para si que justifique cometermos o ato suicida de insurgir contra o faraó? Qual a base para a fidedignidade desse Deus?”). É possível compreender o tetragrama (YHWH) no sentido ver- bal de “Eu causarei o que se dará”, que está perfeitamente de acordo com um Deus que é Criador e também fiel às suas promessas. O contexto maior dá ênfase à resposta final de Deus à pergunta do povo: “Assim dirás aos filhos de Israel: O Senhor, o Deus de vossos pais, o Deus de Abraão, o Deus de Isaque e o Deus de Jacó, me enviou a vós outros; este é o meu nome eternamente, e assim serei lembrado de geração em geração” (Êx 3.15).

[cite] STEVEN C. HAWTHORNE é fundador e diretor de WayMakers, em Austi n, Texas, nos Estados Unidos. É coeditor do livro Missões transculturais (São Paulo: Mundo Cristão, 1987). É também responsável por expedições de pesquisa entre povos não alcançados em cidades cosmopolitas — o Projeto Josué. Ele é coautor (com Graham Kendrick) de Prayerwalking: Praying on Site with Insight [Orando e caminhando: orando no local e com entendimento] e autor de vários arti gos.

grande parte da história bíblica reconta o que Deus tem feito para tornar seu nome conhecido entre as nações.

Adoração

Por que Deus quer ser conhecido em tal profundidade? Ele quer ser mais que mundialmente famoso: ele deseja ser verdadeiramente adorado.

Deus revela glória para receber glória

A glória de Deus flui em duas direções. A primeira é para o mundo. Ele mostra sua glória à humanidade por toda a terra. Ele revela quem é e o que tem feito a fim de abrir caminho para o segundo direcionamento de sua glória — que os seres humanos possam dar-lhe glória por meio de uma adoração motivada pelo amor. Deus revela glória a todas as nações, a fim de receber glória da humanidade pela adoração.

O salmo 96 mostra as duas direções da glória de Deus. Ele exige a proclamação de sua glória às nações: “Cantai ao Senhor, bendizei o seu nome; proclamai a sua salvação, dia após dia. Anunciai entre as nações a sua glória, entre todos os povos, as suas maravilhas” (v. 1,2).

Que retrato eloquente da evangelização do mundo! Contudo, o salmista faz questão de dizer o propósito da evangelização mundial ao mostrar o segundo aspecto da glória de Deus — a resposta de glória das nações a Deus: “Tributai ao Senhor, ó famílias dos povos, tributai ao Senhor glória e força. Tributai ao Senhor a glória devida ao seu nome; trazei oferendas e entrai nos seus átrios. Adorai o Senhor na beleza da sua santidade; tremei diante dele, todas as terras” (v. 7-9).

O coração das missões flui nesta maravilhosa economia da glória: Deus revela sua glória a todas as nações para receber glória de toda a criação.

Um propósito além da salvação

O ser humano é, de fato, salvo por meio da declaração universal da salvação de Deus, mas o valor máximo dessa salvação não reside apenas na condição de salvo, ou seja, de que ele foi salvo.

O que realmente importa é para que foi salvo. Ele foi salvo para servir a Deus em atitude de adoração. Nesse sentido, podemos dizer que a evangelização mundial é feita para Deus. Por mais acostumados que estejamos a ter os seres humanos em altíssima conta, a Bíblia é clara: o raciocínio por trás das missões é a colossal dignidade de Deus. Observe a lógica de Salmos 96.2-4: “Proclamai a sua salvação, dia após dia [...] entre todos os povos. [...] Porque grande é o Senhor e mui digno de ser louvado, temível mais que todos os deuses”.

Uma lógica maior do que mera supremacia

A lógica por trás de missões parece bastante simples: visto que Deus é supremo, toda criatura deve prostrar-se em submissão a ele. Mas seria apenas isso a lógica no centro do Universo? Nossa mente não se satisfaz com essa ideia. Existe algo mais. As Escrituras afirmam com veemência a verdade de que Deus é amor. Deus convida os seres humanos a amá-lo com tudo que são. Onde está o amor de Deus? E o nosso, como resposta?

Um Deus que exige adoração só porque é supremo não nos parece ser tão amoroso — na verdade, nem mesmo digno de admiração. A exigência de louvor faz parecer que Deus está lutando com um problema de baixa autoestima. É tolice falar do zelo de Deus pela adoração como se ele fosse uma divindade tribal petulante ameaçada por deuses rivais. Deus nunca é ameaçado, ele se entristece com a falsa adoração. Quando adora qualquer um ou qualquer coisa além de Deus, o ser humano se torna semelhante ao objeto de sua adoração. Deus tem intenções melhores para com a humanidade.

Então, o que é verdadeira adoração? A adoração ocorre quando a pessoa reconhece quem Deus é, quando torna esse reconhecimento público, quando se aproxima dele de livre vontade, oferecendo-lhe face a face gratidão e, diariamente, lealdade. A adoração é um genuíno relacionamento de interação com Deus. É por isso que Deus sempre nos recebe quando nos aproximamos dele para adorar com ofertas. Ele não precisa de ofertas de adoração, porém elas trazem o ofertante. É por isto que as nações são convocadas a trazer ofertas: para apresentar a Deus o que têm de melhor (Sl 96.8 etc.). Por meio de seus sacrifícios e ofertas, elas oferecem a si mesmas.

Concedendo plenamente seu amor

Por que Deus deseja tanto ser adorado? Duas razões: ele se agrada do amor sincero dedicado a ele pela verdadeira adoração. E mais: ao atrair o ser humano à verdadeira adoração, Deus pode conferir-lhe plenamente seu amor. Podese ver isso em Salmos 96.6: “Glória e majestade estão diante dele, força e formosura, no seu santuário”.

“Glória e majestade” não é uma referência à experiência de Deus consigo mesmo. Esses dois atributos, unidos a “força e formosura” (a passagem paralela diz “alegria” — 1Cr 16.27, ARC), são aspectos da presença de Deus que devem ser a experiência dos que se aproximam dele em verdadeira atitude de adoração. Não pode haver nada mais esplêndido ou majestoso para o ser humano que estar na maravilhosa e estonteante grandeza da presença régia de Deus.

A adoração é o modo de a humanidade glorificar a Deus. Quando observada do ponto de vista divino, pode-se ver que é também o modo de Deus glorificar o ser humano — no melhor sentido da palavra, conferir ao ser humano a maior honra. A adoração cumpre o amor de Deus. Ele nos ama de maneira tão intensa que deseja exaltar-nos a algo melhor que a grandeza. Ele deseja levar-nos à honrosa proximidade dele. Estenda sua mente e seu coração até onde conseguir, porém jamais conseguirá perceber a extensão do que Deus tem preparado para aqueles que o amam (1Co 2.9).

Em Apocalipse 5.1-14, talvez João tenha vislumbrado a “majestade” e a “glória” daqueles átrios. Ele ouviu todas as miríades celestiais erguerem a voz, aclamando a Deus, pelo maravilhoso ato de comprar gente de todas as tribos e línguas. Por que Deus desejaria adquirir seres humanos ignóbeis ao extravagante custo do sangue de seu Filho? Além disso, por que ele comprou representantes de cada etnia? Que valor eles têm? A preciosidade deles reside nisto: eles serão seus sacerdotes. De cada povo, alguns representantes ofertarão alegremente a Deus distintas honras e glórias. Cada povo tem valor eterno por causa do sangue de Cristo. Cada povo tem um lugar designado diante dele. Deus dispôs seu poderoso coração a reuni-los ali. É necessário que seja assim. A força desse amor não correspondido pelos povos está no âmago de qualquer empreitada missionária.

O salmista reflete o zelo de Deus pelos povos da terra. Deus acena para todas as “famílias dos povos”, pessoas com profundos laços generativos, ligadas pelo sangue e pelo matrimônio. Cada uma dessas extensas famílias tem uma história e um destino diante de Deus. Cada uma delas é convidada formalmente à sua régia presença (Sl 96.7-9). Elas não devem chegar de mãos vazias, pelo contrário, devem entregar a Deus uma amostra da glória e da força singular de seu povo. Os povos devem expressar a Deus ofertas de louvores nas diversas línguas, mas não cabe a nenhum povo oferecer especulações sobre o que constitui o devido louvor. O que o verdadeiro Deus revelou acerca de si mesmo — “a glória devida ao seu nome” — é a única substância e a verdadeira medida do digno louvor (v. 8).

A BÍBLIA COMO A HISTÓRIA DE DEUS

A Bíblia é o envolvente drama do amor de Deus, que procura atrair a adoração das nações. Lembre-se do pressuposto básico: Deus revela sua glória a todas as nações para que possa receber glória de toda a criação. Essa dupla dimensão da glória de Deus ajudará na compreensão de um aparente amontoado de antigas histórias.

Abraão

Quando Abraão chegou à terra da promessa, ele não se sobressaiu como brilhante missionário, seja lá como possamos definir esse papel. Tampouco foi registrado como grande evangelista. Na verdade, ele foi vergonhosamente expulso do Egito (Gn 12.10-20). Os vizinhos de Abraão assustaram-no ao ponto de ele mentir sobre sua família.

O motivo de Abraão ter mentido a respeito de sua esposa não revela a confiança do evangelista em que vidas podem ser transformadas: “Certamente não há temor de Deus neste lugar” (Gn 20.11). Contudo, apesar de todas as suas falhas, quando chegou à nova terra ele tomou uma atitude missionária, a melhor que podia. Sua primeira ação foi estabelecer a adoração pública a Deus: “Edificou um altar ao Senhor e invocou o nome do Senhor” (Gn 12.7-8).

Seus familiares podem ter sido os únicos adoradores no altar, mas de forma explícita e pública Deus foi adorado pelo seu nome.

Abençoado para ser uma bênção abençoadora

À certa altura, Abraão salvou alguns de seus poderosos vizinhos de uma coalizão de nações saqueadoras (Gn 14). Depois da vitória milagrosa, Abraão recusou-se a aceitar a recompensa oferecida pelo rei de Sodoma. Ele sabia que, se aceitasse aquela generosidade, dali em diante ele e sua família seriam vistos como apadrinhados da cidade. Em vez disso, ele escolheu manterse diante das nações como alguém abençoado por Deus.

À vista das nações, Abraão resolutamente declarou Deus como aquele que o recompensaria e o abençoaria. Suas corajosas palavras (Gn 14.21-24) foram comprovadas pela oferta de bens que Abraão ofereceu a Deus. Abraão ofereceu ao Senhor a riqueza de Sodoma, assim como a das outras nações. Ele ajudou nações estrangeiras a apresentar o dízimo a Deus, um reconhecido ato formal de adoração (Gn 14.18-20). Com Melquisedeque presidindo o sacerdócio, Abraão, como sacerdote, adorou ao apresentar ofertas de adoração em nome de outras nações.

Abraão foi abençoado a fim de ser bênção para as nações (Gn 12.1-3), mas o propósito vai além de abençoar nações. O próprio Deus foi bendito! Melquisedeque abertamente reconheceu que Abraão era abençoado pelo Senhor. Pelo poder de Deus, Abraão foi uma bênção para seus vizinhos, resgatando famílias e bens escravizados, porém o grande resultado foi o próprio Deus ser bendito com louvor! Ouça Melquisedeque: “Bendito seja Abrão pelo Deus Altíssimo [...] e bendito seja o Deus Altíssimo” (Gn 14.18-20).

O que aprendemos com todos esses acontecimentos? Por causa de sua contínua adoração, Abraão tornou o nome de Deus conhecido. Deus engrandeceu o próprio nome pelo dramático poder redentor demonstrado em povo. O resultado foi um ajuntamento multinacional em honrosa gratidão a Deus, que foi explícita e verdadeiramente adorado.

O propósito global confirmado pela obediência na adoração

O momento crucial e a maior provação na vida de Abraão implicaram um ato de adoração (Gn 22). Deus ordenou a Abraão que oferecesse em sacrifício seu filho Isaque, num ato de adoração. Era um teste para provar o que Abraão e sua família viriam a ser. Encontraria Deus em Abraão aquela paixão obediente e sacerdotal (literalmente “temor a Deus”, Gn 22.12)?

Provaria Abraão ser zeloso, oferecendo a adoração que Deus solicitara? Caso afirmativo, Deus encontraria nele o tipo de fé que desejava ver multiplicada entre as nações. Você conhece a história. No momento em que Abraão ia cumprir a ordem, o ato de adoração, Deus falou dos céus e fez um juramento solene, declarando veementemente seu propósito universal de abençoar todos os povos da terra por meio da família de Abraão (22.18).

O Êxodo

Deus fez mais pelo seu nome que obter a adoração de Abraão. No Êxodo, Deus ficou mundialmente conhecido, de maneira marcante. De relance, a história do Êxodo não parece ser um grande evento missionário. Milhares de egípcios morreram. O pesar pairava sobre cada lar egípcio. O que Deus estava fazendo?

A passagem-chave é Êxodo 9.13-16, em que Moisés dá o ultimato a Faraó, com uma intrépida palavra a respeito dos planos divinos:

Assim diz o Senhor, o Deus dos hebreus:

Deixa ir o meu povo, para que me sirva. Pois esta vez enviarei todas as minhas pragas sobre o teu coração, e sobre os teus oficiais, e sobre o teu povo, para que saibas que não há quem me seja semelhante em toda a terra.

Pois já eu poderia ter estendido a mão para te ferir a ti e o teu povo com pestilência, e terias sido cortado da terra; mas, deveras, para isso te hei mantido, a fim de mostrarte o meu poder, e para que seja o meu nome anunciado em toda a terra

Perceba que Deus não disse apenas: “Deixa ir o meu povo”. Essa é apenas a metade da frase, sem seu propósito. Atente para ouvir por completo o clamor de salvação: “Deixa ir o meu povo, para que me sirva” (Êx 8.1,20; 9.1,13; 10.3).

Faraó compreendeu bem as exigências de Moisés — que o povo fosse libertado para adorar. Faraó provavelmente pensou que o apelo por um feriado de adoração era um engodo para disfarçar planos de fuga. Talvez muitos dos hebreus tenham se equivocado também, pensando que o plano de adorar a Deus no deserto era apenas um ardil para enganar as autoridades. Não é de admirar que a maioria deles depois só pensasse em conforto, alimentação, segurança e entretenimento! Eles custaram a entender que Deus, naquela fuga, tinha um propósito para si, com vistas às nações. Eles tinham virado a salvação pelo avesso: pensavam que o livramento deles era a principal preocupação de Deus, porém Deus orquestrava um poderoso plano para atrair a atenção das nações para si.

Deus atrai a atenção do mundo para seu nome

Deus estava se destacando sobre todos os deuses da terra. No Êxodo, ele estava “eternizando”, seu nome (Is 63.11-14; Ne 9.9-10). Ele queria que todos no Egito e os demais habitantes da terra soubessem que não havia outro deus como o único Deus vivo. Ele queria que o mundo visse uma multidão de escravos marchando em procissão para o adorar. Deus estabeleceu sua reputação como a maior e verdadeiramente santa (não apenas a mais santa) divindade já cogitada pelo homem: um Deus singular, todo-poderoso e resplendente, absolutamente incomparável. O Êxodo deve ser o principal ponto de referência para toda a revelação subsequente ao mundo sobre seu caráter, sua santidade e seu poder. Como o caos no Egito revelou o Deus vivo?

Julgando os deuses do Egito

Alguns estudiosos perceberam que cada uma das pragas do Egito consistiu num ataque direto aos falsos deuses daquela nação ou às estruturas opressivas de poder, que eram reverenciadas com zelo fanático. Algumas divindades egípcias, como o próprio rio Nilo e o grande deus-sol, foram diretamente desmoralizadas pelas pragas de sangue e de trevas. Outras foram indiretamente envergonhadas, pois tiveram exposta sua completa incapacidade de exercer seus atributos. Alguns deuses eram reverenciados por serem capazes de conter as infestações de insetos e de proteger o gado de doenças. A poderosa elite religiosa foi terrivelmente envergonhada. O exército, muito temido, foi sumariamente aniquilado. Por que Deus arruinou o Egito diante do mundo?

Deus estava executando “juízo sobre todos os deuses do Egito” (Êx 12.12). Ele não pretendia destruir o povo, e sim desmoralizar uma dos mais conceituados panteões de falsos deuses de toda a terra. Se ele quisesse destruir o povo egípcio, o teria feito sem dificuldades: “Já eu poderia ter estendido a mão para te ferir a ti e o teu povo com pestilência, e terias sido cortado da terra; mas, deveras, para isso te hei mantido, a fim de mostrar-te o meu poder, e para que seja o meu nome anunciado em toda a terra” (Êx 9.15,16).

As nações percebem

Funcionou? Teria o mundo percebido que Deus estava engrandecendo o próprio nome? A devastação registrada no livro de Êxodo não foi manchete em hieróglifos egípcios, pois devemos entender que os acontecimentos que desmoralizavam os egípcios jamais seriam talhados em pedra.

A Bíblia relata que as ondas do mar Vermelho mal haviam abaixado quando Moisés conclamou o povo a cantar: “Senhor é o seu nome [...] Ó Senhor, quem é como tu entre os deuses? Quem é como tu, glorificado em santidade...”. Então, depois de mencionar o nome de algumas das nações circunvizinhas, eles declaram: “Os povos o ouviram, eles estremeceram” (Êx 15.3-15).

Jetro entrara na família de Moisés pelo casamento, mas ainda era muito pagão em seu modo de pensar. Sem dúvida, tinha ouvido de Moisés, durante anos, acerca do Deus dos hebreus. Talvez muitos povos e cidades tivessem ouvido algo a respeito daquele grande Deus, mas sem adorá-lo ou sem confiar nele. Contudo, veja o que Jetro comenta depois de saber das pragas do Egito: “Agora , sei que o Senhor é maior que todos os deuses, porque livrou este povo de debaixo da mão dos egípcios, quando agiram arrogantemente contra o povo” (Êx 18.11). Jetro era um grande sacerdote de um povo estrangeiro — qualificado, portanto, para avaliar assuntos religiosos (Êx 18.1).

Hoje, ao ler a história de Moisés e seu confronto com o Egito, pode parecer que este fosse apenas mais um império opressor que abusava dos escravos. Nos dias de Moisés, sabia-se abertamente que o Egito era um emaranhado de poderes religiosos, econômicos e militares entretecidos com poderes espirituais. Deus desfez o sistema deles para mostrar o que de fato representavam aqueles poderes: um horrendo mal espiritual dedicado a impedir os adoradores de se aproximar de Deus. O Senhor havia abençoado o Egito, mas este se tornara inimigo de Deus. O “juízo” de Deus em forma de pragas e o milagre no mar Vermelho (Êx 12.12) não devem ser entendidos como mero castigo por más obras. A intervenção de Deus derrubou o mal opressivo para libertar o povo. Por que foram libertados? “Deixa ir o meu povo, para que me sirva.” Deus orquestrara os eventos do Êxodo para que revelassem sua glória, estabelecendo seu nome universalmente . Então, diante dos olhos do mundo, ele trouxe um povo para junto de si, a fim de estabelecer um modo de adoração do qual todas as outras nações pudessem participar.

A conquista de Canaã

A conquista de Canaã deve ser vista sob o mesmo prisma: Deus requisitando para si um povo único e santo que o adore. A essa nação, com seu testemunho, Deus atrairá todos os outros povos para que também o reverenciem e o conheçam.

[cite] 2 2 Abrão reconheceu que, pela promessa que fizera de abençoar a ele e sua família, Deus estava praticamente consti- tuindo uma nova família. O conceito bíblico de bênção está carregado de matizes de honra familiar e de herança. A bên- ção bíblica constituía muitas vezes uma afirmação de poder que concedia um destino. A bênção familiar muitas vezes se tornava o aspecto mais importante de uma herança. Muitas sociedades nos dias de hoje restringem a ideia de herança ao manejo das posses não despendidas depois da morte de um antecessor. A herança bíblica não era considerada o resto de uma geração destinado a ser consumido pela geração seguinte. Sabia-se que uma bênção era uma herança especial para as futuras gerações da família, multiplicando-se em abundância. O aspecto mais assombroso da bênção prometida a Abraão (Gn 12.3) foi que Deus estava confiando a ele um dote destinado a dar algo substancial a todas as famílias do planeta, muito além de uma família aumentada. 3 3 Outras variações do apelo pela libertação dos hebreus indicam que o termo hebraico geral traduzido por “servir” está ligado ao contexto de culto de adoração (Êx 3.12; 4.23; 5.1; 7.16; 8.27,29; 10.9). V. esp. Êx 10.26, que deixa claro que “servir ao Senhor” corresponde a oferecer sacrifício a Deus. 4 4 V. John Davis, Moses and the Gods of Egypt (Grand Rapids: Baker, 1971).

com zelo fanático. Algumas divindades egípcias, como o próprio rio Nilo e o grande deus-sol, foram diretamente desmoralizadas pelas pragas de sangue e de trevas. Outras foram indiretamente envergonhadas, pois tiveram exposta sua completa incapacidade de exercer seus atributos. Alguns deuses eram reverenciados por serem capazes de conter as infestações de insetos e de proteger o gado de doenças. A poderosa elite religiosa foi terrivelmente envergonhada. O exército, muito temido, foi sumariamente aniquilado. Por que Deus arruinou o Egito diante do mundo?

Deus estava executando “juízo sobre todos os deuses do Egito” (Êx 12.12). Ele não pretendia destruir o povo, e sim desmoralizar uma dos mais conceituados panteões de falsos deuses de toda a terra. Se ele quisesse destruir o povo egípcio, o teria feito sem dificuldades: “Já eu poderia ter estendido a mão para te ferir a ti e o teu povo com pestilência, e terias sido cortado da terra; mas, deveras, para isso te hei mantido, a fim de mostrar-te o meu poder, e para que seja o meu nome anunciado em toda a terra” (Êx 9.15,16).

As nações percebem

Funcionou? Teria o mundo percebido que Deus estava engrandecendo o próprio nome? A devastação registrada no livro de Êxodo não foi manchete em hieróglifos egípcios, pois devemos entender que os acontecimentos que desmoralizavam os egípcios jamais seriam talhados em pedra.

A Bíblia relata que as ondas do mar Vermelho mal haviam abaixado quando Moisés conclamou o povo a cantar: “Senhor é o seu nome [...] Ó Senhor, quem é como tu entre os deuses? Quem é como tu, glorificado em santidade...”. Então, depois de mencionar o nome de algumas das nações circunvizinhas, eles declaram: “Os povos o ouviram, eles estremeceram” (Êx 15.3-15).

Jetro entrara na família de Moisés pelo casamento, mas ainda era muito pagão em seu modo de pensar. Sem dúvida, tinha ouvido de Moisés, durante anos, acerca do Deus dos hebreus. Talvez muitos povos e cidades tivessem ouvido algo a respeito daquele grande Deus, mas sem adorá-lo ou sem confiar nele. Contudo, veja o que Jetro comenta depois de saber das pragas do Egito: “Agora , sei que o Senhor é maior que todos os deuses, porque livrou este povo de debaixo da mão dos egípcios, quando agiram arrogantemente contra o povo” (Êx 18.11). Jetro era um grande sacerdote de um povo estrangeiro — qualificado, portanto, para avaliar assuntos religiosos (Êx 18.1).

Hoje, ao ler a história de Moisés e seu confronto com o Egito, pode parecer que este fosse apenas mais um império opressor que abusava dos escravos. Nos dias de Moisés, sabia-se abertamente que o Egito era um emaranhado de poderes religiosos, econômicos e militares entretecidos com poderes espirituais. Deus desfez o sistema deles para mostrar o que de fato representavam aqueles poderes: um horrendo mal espiritual dedicado a impedir os adoradores de se aproximar de Deus. O Senhor havia abençoado o Egito, mas este se tornara inimigo de Deus. O “juízo” de Deus em forma de pragas e o milagre no mar Vermelho (Êx 12.12) não devem ser entendidos como mero castigo por más obras. A intervenção de Deus derrubou o mal opressivo para libertar o povo. Por que foram libertados? “Deixa ir o meu povo, para que me sirva.” Deus orquestrara os eventos do Êxodo para que revelassem sua glória, estabelecendo seu nome universalmente . Então, diante dos olhos do mundo, ele trouxe um povo para junto de si, a fim de estabelecer um modo de adoração do qual todas as outras nações pudessem participar.

A conquista de Canaã

A conquista de Canaã deve ser vista sob o mesmo prisma: Deus requisitando para si um povo único e santo que o adore. A essa nação, com seu testemunho, Deus atrairá todos os outros povos para que também o reverenciem e o conheçam.

Justa recompensa

Para o leitor dos dias de hoje, a conquista de Canaã pode parecer uma invasão genocida de terras, em vez de um ato de um Deus amoroso, porém, uma observação mais detalhada das passagens pertinentes nas Escrituras, nos mostrará que Deus ordenou essa conquista com um duplo propósito. O primeiro propósito era a justa recompensa pela “maldade” dos povos da terra (Dt 9.5). Muito antes disso, Deus dissera a Abraão: “Não se encheu ainda a medida da iniquidade dos amorreus” (Gn 15.16). Deus permitiu que o pecado fosse praticado. Talvez questionemos como os cananeus se sentiram diante da ira de Deus. A Bíblia registra a declaração de um rei cananeu sobre a conquista, em que reconhece a justa execução do juízo divino: “Assim como eu fiz, assim Deus me pagou” ( Jz 1.7).

Destruindo a falsa adoração

O segundo propósito e a principal razão para a ferocidade da conquista hebreia foi esta: Deus estava aniquilando a idolatria a fim de preservar a devoção singular de seu povo e a santidade de seu nome. Quase todas as passagens que descrevem a lógica por trás da expulsão dos povos que viviam na terra declaram este propósito: a idolatria dos cananeus rapidamente desviaria os israelitas “de mim [Deus], para que servissem a outros deuses” (Dt 4.15-24; 6.13- 15; 7.1-8 etc.).

Josué e Moisés apresentaram o mesmo motivo para a violência da conquista: era, em seu âmago, o banimento da falsa adoração. Deus ordenara a destruição para que “não façais menção dos nomes de seus deuses, nem por eles façais jurar, nem os sirvais, nem os adoreis” (Js 23.7). Embora haja dificuldades para compreender plenamente essa parte da história do povo de Deus, uma coisa é clara a respeito da conquista: ela ocorreu por causa da adoração. O objetivo de Deus não era que Israel fosse o único povo a adorá-lo. Seu alvo era assegurar que ele seria o único Deus a quem o povo cultuasse.

A idolatria profana o nome de Deus

Hoje, a idolatria não parece ameaçar a maioria dos crentes. Dos Dez Mandamentos, os quatro primeiros podem ser mistificados por nós ou até nos entediar. Por que Deus é tão ferozmente zeloso em relação à idolatria? Quando não se percebe os propósitos globais de Deus para a sua glória, pode parecer que ele está apenas aflito por causa de um mau hábito primitivo.

Entretanto, vejamos a idolatria do ponto de vista de Deus. Ele distinguiu seu nome muito acima de qualquer outro nome. Qualquer tipo de idolatria, na verdade, profanaria (isto é, tornaria comum) o nome de Deus, o mesmo nome que ele acabara de destacar e declarar a todo o mundo.

Considere outra vez a conquista. A questão da invasão não era que Israel merecia o território de outros. Deus havia deixado claro a Israel que não fora por conta da própria justiça ou grande nobreza que se tornara um povo especial e favorecido (Dt 7.6,7). Repetidas vezes Deus ameaçou destruir a Israel, caso seu povo desviasse a adoração ao Senhor para outros deuses.

O registro deixa claro que, em várias ocasiões, o povo hebreu ficou próximo da destruição. Por quê? Deus não o havia amado e salvado de modo especial? Apesar de todo amor que prometera aos descendentes de Abraão, Deus estava trabalhando para ser glorificado. Ele não se importava em adiar seus planos para trabalhar com outra geração. O alvo, em cada etapa, era que o povo o adorasse e testemunhasse de sua glória.

Um exemplo torna esse propósito de Deus bem claro: a rebelião em Cades-Barneia. Israel seguira por um caminho que o Senhor mesmo abriu e estava às portas do cumprimento dos propósitos divinos. Os espias foram enviados para reconhecer a terra e seus habitantes. Dez dos espias amedrontaram o povo de Israel, deflagrando uma rebelião histérica pela autopreservação (Nm 13.17—14.10). Deus estava prestes a destruir todo o povo e recomeçar tudo com Moisés, fazendo dele outro povo “maior e mais forte” que os hebreus. O problema não era que eles haviam feito algo ruim o bastante para despertar a ira de Deus, mas que Deus exigia, para seus propósitos, que a nação pelo menos cresse nele.

De fato, Moisés argumenta com Deus, apresentando as mesmas razões alegadas num incidente anterior (Êx 32.1-14): as nações estavam observando tudo. Elas tinha ouvido algo acerca do nome de Deus, que estaria comprometido caso levasse adiante o que pretendia fazer: “Se matares este povo [...] as gentes, pois, que, antes, ouviram a tua fama, dirão: Não podendo o Senhor fazer entrar este povo na terra que lhe prometeu com juramento, os matou no deserto”. Moisés lembra a Deus de que as nações concluirão que o Deus hebreu é fraco: sabe começar, mas não terminar (Nm 14.15,16).

Então, Moisés pede a Deus que engrandeça a si mesmo segundo o que ele mesmo dissera de seu nome: “O Senhor é longânimo e grande em misericórdia, que perdoa a iniquidade e a transgressão…”. Os céus se calam, e então Deus diz que já havia perdoado Israel conforme a oração de Moisés. Nesse instante, Deus ergue a voz, usando, suponho, algumas das expressões mais fortes possíveis: “Tão certo como eu vivo, e como toda a terra se encherá da glória do Senhor […] nenhum deles verá a terra…” (Nm 14.17-23).

O que Deus está dizendo? Que ele continuaria a usar a nação, mas esperaria por outra geração. Embora ele estivesse adiando seus planos, Deus permanecia resoluto em cumprir seu propósito na terra: encher a terra com “a glória do Senhor”. Para cumprir esse propósito, era necessário um povo obediente tanto na adoração quanto no testemunho.

O templo

Talvez a primeira menção clara a respeito do templo tenha sido feita nas planícies de Moabe, antes que Josué levasse o povo terra adentro. Moisés transmite as instruções de Deus: destruir “por completo todos os lugares onde as nações [...] serviram aos seus deuses”. Em vez de reformar os antigos lugares de adoração, os altares precisavam ser completamente destruídos a fim de apagar “o seu nome daquele lugar” (Dt 12.2-14; cf. esp. v. 5).

Considere a declaração de propósito de Deus para o templo: “... para ali pôr o seu nome e sua habitação”. Deus queria fazer duas coisas nesse lugar especial. Ele queria se revelar pelo “seu nome”. Primeira: seria um lugar de revelação onde os adoradores continuamente exaltariam seu caráter e pronunciariam as histórias e as canções sobre suas obras. Segunda: Deus desejava um lugar de encontro, de relacionamento, de habitação. Desde a primeira menção de um tabernáculo, Deus expressou o desejo de uma proximidade exaltada com seu povo: “Farão um santuário, para que eu possa habitar no meio deles” (Êx 25.8). Habitar é uma questão relacional. É a adoração consumada. É Deus achegando-se ao seu povo, e este, ao seu Deus. Salomão sabia que o templo não era o domicílio de Deus. Ao dedicar a fabulosa estrutura, ele orou: “Habitaria Deus com os homens na terra? Eis que os céus e até o céu dos céus não te podem conter, quanto menos esta casa que eu edifiquei” (2Cr 6.18).

Davi havia projetado o templo como um lugar para o povo se aproximar de Deus em atitude de louvor. Salomão instalou os coros e os músicos sacerdotais que seu pai havia planejado. Eles deviam continuamente louvar e glorificar ao Senhor com algumas das canções davídicas e, sem dúvida, o hino dedicatório encontrado em 1Crônicas 16.23-33 (outra versão do salmo 96, já mencionado), que convoca todas as “famílias dos povos” a adorar a Deus (v. 28).

De acordo com a dedicação de Salomão, a Casa de Deus devia ser o lugar em que o Senhor veria, ouviria e responderia ao seu povo. A casa, porém, não era excusiva de Israel. Salomão faz menção especial dos “povos”. Ele sabia que o propósito de Deus para o templo era receber, em adoração, todas as nações.

Salomão conhecia a história até esse ponto. Deus havia se tornado grandemente conhecido. Pessoas de outras nações viriam para conhecer pessoalmente o Deus de Israel. Veja a espantosa oração de Salomão:

Também ao estrangeiro, que não for do teu povo de Israel, porém vier de terras remotas, por amor do teu nome (porque ouvirão do teu grande nome, e da tua mão poderosa, e do teu braço estendido), e orar, voltado para esta casa, ouve tu nos céus, lugar da tua habitação, e faze tudo o que o estrangeiro te pedir, a fim de que todos os povos da terra conheçam o teu nome, para te temerem como o teu povo de Israel e para saberem que esta casa, que eu edifiquei, é chamada pelo teu nome (1Rs 8.41-43).

Salomão orou não para que apenas alguns indivíduos viessem, e sim muitos, de todos os povos. Salomão orou para que as nações encontrassem a Deus quando viessem à sua casa para orar e adorar. Ele não pediu que os gentios conhecessem a Deus à maneira gentia, mas que o conhecessem da mesma forma em que Israel o conhecia. Salomão previu que todos os povos se uniriam a Israel no mesmo tipo de caminhada humilde, alegre e plena de adoração a Deus que Israel desfrutava — o temor do Senhor.

As nações começam a chegar

Será que a fama de Deus se espalhou pelo mundo? Será que os estrangeiros acorreram à Casa de Deus para aprender o temor do Senhor? Será que Deus respondeu à oração de Salomão? A melhor resposta é sim, e também não.

O registro mostra que, pouco tempo depois de o templo ser construído (1Rs 9.25), a rainha de Sabá soube da “fama de Salomão, com respeito ao nome do Senhor” (10.1). Ela veio para aprender, mas também ouvira falar da sabedoria de Salomão (v. 8), e voltou para casa com o conhecimento do Deus que guarda sua aliança e “ama a Israel para sempre”. Apenas como um potentado real pode ver, ela percebeu que o próprio Deus havia estabelecido o poder de Salomão e a esperança de que, por meio da soberania divina, pudesse haver “juízo e justiça” (v. 9).

Será que foi um caso isolado? Aparentemente, não. Mais adiante, está escrito: “Todo o mundo procurava ir ter com ele para ouvir a sabedoria que Deus lhe pusera no coração” (v. 24). O mundo não honrou Salomão por ser inteligente ou perito em questões judiciais. O mundo reconheceu que o próprio Deus pusera sabedoria no coração daquele homem. E qual foi a primeira lição de sabedoria que Salomão divulgou ao mundo? “O temor do Senhor é o princípio do saber [conhecimento]” (Pv 1.7). Salomão estava iniciando o mundo tanto na adoração ao Senhor quanto na vida de sabedoria sob a maestria de Deus.

Os propósitos de Deus pareciam cumprirse. Seu nome era engrandecido. Israel o tornava notório de modo que as nações começaram a chegar para conhecer a Deus pessoalmente. O que poderia ter atrasado o plano de Deus de atrair todas as nações para si? Apenas uma coisa, a questão sobre a qual Deus advertira seu povo mais severamente: a idolatria.

De todos os horrores possíveis, provavelmente o pior aconteceu — o próprio Salomão abriu caminho para a grotesca idolatria. Foi uma das mais amargas ironias da História. Imagine a profunda esperança, as riquezas e os desejos das nações voltados para Israel. Salomão consagrara o templo com um espetáculo inimaginável de glória. Ele encerrou o evento com uma bênção de propósito sobre o edifício e a nação: “... para que todos os povos da terra saibam que o Senhor é Deus e que não há outro” (1Rs 8.60).

Então, apenas três capítulos depois dessa gloriosa inauguração, que abriu as portas às nações para conhecerem e temerem, pelo nome, ao único Deus, o coração de Salomão foi levado a “seguir outros deuses”. Ele chegou a construir santuários à vista do monte santo de Deus (1Rs 11.1-8). Qualquer leitor que creia na veracidade desses versículos se decepcionará a ponto de sentir náusea. É difícil não especular sobre o que poderia ter acontecido se a adoração se tivesse mantido pura e firme por apenas mais uma geração.

A persistência de Deus

O plano de Deus era simples: Deus engrandeceria seu nome, e então Israel tornaria o nome do Senhor conhecido. Ele sempre quis destacar seu nome sobre todos os outros deuses e, assim, receber adoração das nações à luz do nome revelado por meio do testemunho do povo de Israel.

A História, a partir desse ponto, passa a registrar uma luta prolongada, cheia de altos e baixos, contra a idolatria. Vários episódios reavivam a fidelidade na adoração a Deus, mas são seguidos por vertiginosas recaídas de profanação do santo nome. A questão mais importante, ao longo das gerações, é a glória de Deus na adoração de Israel. Às vezes, o povo desprezava a adoração a Deus de tal modo que se passavam gerações sem a menor atenção ao simples regime pelo qual Deus convidara Israel a se encontrar com ele (os mandamentos sobre culto nos livros de Moisés). As palavras de alguns profetas mostram que, mesmo quando os padrões de adoração eram seguidos, quase sempre o culto era superficial. Os profetas denunciaram a adoração perfunctória, desmascarando a perversa carência de justiça e de bondade que deviam florescer por trás de todo sacrifício e de toda oração a Deus (Is 1.11-15; Am 5.21- 24; Mq 6.6-8). Embora Deus tivesse adiado o grande abalo de Israel e de Judá, ele acabou separando da terra o povo que devia servir de vitrine da bênção de Deus. O povo foi exilado em terras longínquas, e — a maior das tragédias — a Casa de Deus foi queimada e reduzida a escombros.

Perto do final do exílio, Daniel clamou a Deus para que cumprisse a promessa de restaurar o templo e o povo. Daniel estava ciente de toda a saga, de como o Senhor havia tirado seu povo da terra do Egito com mão poderosa para fazer para si um nome que permanecia até então (Dn 9.15). A preocupação preponderante de Daniel era que as ruínas da glória, que se queria demonstrar no monte do templo, em Jerusalém, continuavam a ser uma mancha na glória de Deus “para todos os que estão em redor de nós”. Daniel orava para que Deus restaurasse o povo e a cidade, a fim de que a glória de seu nome fosse restaurada. Daniel não baseava seu pedido na suposta grandeza de Israel: “Não te retardes, por amor de ti mesmo, ó Deus meu; porque a tua cidade e o teu povo são chamados pelo teu nome” (Dn 9.16-19).

Ezequiel, contemporâneo de Daniel, expressou os mesmos temas. Deus havia contido sua ira em várias ocasiões para não destruir Israel, mas a paciência de Deus fora “por amor do meu nome” (Ez 20.5-22). O tratamento dispensado por Deus a Israel não era motivado por algum favoritismo doentio, mas apenas por causa da glória divina entre as nações:

Dize, portanto, à casa de Israel: Assim diz o Senhor Deus: Não é por amor de vós que eu faço isto, ó casa de Israel, mas pelo meu santo nome, que profanastes entre as nações para onde fostes. Vindicarei a santidade do meu grande nome, que foi profanado entre as nações, o qual profanastes no meio delas; as nações saberão que eu sou o Senhor (Ez 36.22,23).

O destino de Israel: a glória de todas as nações

Daniel e Ezequiel não foram os únicos profetas a verem que o foco da história de Israel incidia sobre o nome e a glória de Deus. Outros profetas e salmistas falaram da história e do destino de Israel como sendo o de atrair as nações para o nome de Deus, a fim de que o adorassem com diversidade e grande glória:

Aclamai a Deus, toda a terra. Salmodiai a glória do seu nome, dai glória ao seu louvor.

Dizei a Deus: Que tremendos são os teus feitos! Pela grandeza do teu poder, a ti se mostram submissos os teus inimigos. Prostra-se toda a terra perante ti, canta salmos a ti; salmodia o teu nome (Sl 66.1-4).

Render-te-ão graças, ó Senhor, todos os reis da terra, quando ouvirem as palavras da tua boca, e cantarão os caminhos do Senhor, pois grande é a glória do Senhor (Sl 138.45).

Darei lábios puros aos povos, para que todos invoquem o nome do Senhor e o sirvam de comum acordo. Dalém dos rios da Etiópia, os meus adoradores, que constituem a filha da minha dispersão, me trarão sacrifícios (Sf 3.9,10).

Desde o nascente do sol até ao poente, é grande entre as nações o meu nome; e em todo lugar lhe é queimado incenso e trazidas ofertas puras, porque o meu nome é grande entre as nações, diz o Senhor dos Exércitos (Ml 1.11).

Estas são apenas amostras das muitas palavras proféticas que vinculavam a identidade de Israel à culminação dos propósitos de Deus: a glória de Deus na terra atraindo a adoração de todos os povos. Quando o povo de Deus finalmente foi levado de volta à sua terra, construir o templo foi a grande prioridade. Ageu deixou claro que o templo era para a glória de Deus, e para uma glória como jamais houvera antes. “Farei abalar todas as nações, e as coisas preciosas de todas as nações virão, e encherei de glória esta casa” (Ag 2.7; 1.8). A partir do exílio, Israel evitou a idolatria, porém, a pequena glória nacional que desejavam nunca surgiu. Eles esperavam por um libertador messiânico que os livrasse da opressão. Quase não perceberam o Messias quando ele veio porque a visão que Jesus tinha da redenção era que o Reino de Deus fosse concretizado entre todos os povos.

A glória de Deus em Cristo

Com Cristo, a história da glória de Deus chega ao seu clímax. No final de todas as coisas, ele terá comprado e reunido pessoas de todas as tribos e línguas para honrar o Pai. Não surpreende, então, ver como cada passo seu foi dado para impulsionar a história da glória de Deus rumo à sua culminação entre todas as nações.

Jesus resumiu seu ministério ao esforço por glorificar universalmente o Pai: “Eu te glorifiquei na terra, consumando a obra que me confiaste para fazer”. E que obra foi essa? “Manifestei o teu nome aos homens que me deste do mundo” ( Jo 17.4,6).

Santificado seja o teu nome

A oração que Jesus ensinou aos discípulos pode ser mal compreendida por causa de sua tradução: “Santificado seja o teu nome”. Essa oração não é uma afirmação de louvor. É explicitamente um pedido na língua original: “Pai, santifica o teu nome!”. Parafraseando: “Pai, eleva, destaca, exalta, manifesta e revela o teu nome aos povos da terra. Torna-te notório por quem tu és. Faze com que os povos da terra o conheçam e o adorem”. A oração pode ser mais bem expressada na dimensão global que Jesus ensinou: “... assim na terra como no céu”. Não há dúvida quanto à primazia dessa oração para todos os crentes. É necessário compreendê-la. Não há dúvida de que Jesus está ensinando a Igreja a orar pelo cumprimento dos antigos propósitos revelados na lei, na história, nas canções e nas profecias de Israel para a glória de Deus.

Num encontro revelador com a mulher samaritana (uma não-judia), Jesus declarou o futuro de Deus para ela e para as outras nações: “Vem a hora e já chegou, em que os verdadeiros adoradores adorarão o Pai em espírito e em verdade; porque são estes que o Pai procura para seus adoradores” ( Jo 4.23).

Uma casa de adoração para todos os povos

Em sua hora mais pública e em seu momento mais intenso, Jesus tornou manifesta a questão da adoração das nações. Ele purificou o templo do comercialismo religioso, que constituía uma barreira ao ingresso das nações à presença de Deus. Ele citou Isaías 56.7: “A minha casa será chamada Casa de Oração para todos os povos”. Os líderes religiosos que o ouviram imediatamente se lembraram do restante da passagem que Jesus estava citando, e Jesus pretendia que eles ouvissem tudo:

Aos estrangeiros que se chegam ao Senhor, para o servirem e para amarem o nome do

Senhor, sendo deste modo servos seus, sim, todos os que guardam o sábado, não o profanando, e abraçam a minha aliança, também os levarei ao meu santo monte e os alegrarei na minha Casa de Oração; os seus holocaustos e os seus sacrifícios serão aceitos no meu altar, porque a minha casa será chamada Casa de Oração para todos os povos (Is 56.6,7).

Logo antes de ir ao encontro da morte, Jesus mostrou o propósito de sua vida e de sua morte vindoura ( Jo 12.24-32). Abertamente, ele considerou a opção de pedir ao Pai que o livrasse da morte: “Agora, está angustiada a minha alma, e que direi eu? Pai, salva-me desta hora?”. Em vez de pedir um escape, todavia, ele declarou: “Precisamente com este propósito vim para esta hora”. Que propósito era esse? O que salta de seu coração na frase seguinte e se torna a oração de sua morte e de sua vida: “Pai, glorifica o teu nome”. Para espanto dos que estavam ao seu redor, o próprio Deus Pai respondeu dos céus a Jesus: “Eu já o glorifiquei e ainda o glorificarei”. A resposta de Deus ainda troveja, se você puder ouvir. É a resposta de Deus a qualquer um que entregue sua vida ao Pai para glorifi - car ainda mais o nome dele. Jesus disse que a resposta não viera para ele, mas para seus seguidores, que chegariam a idênticos momentos de escolher segui-lo (v. 30) de acordo com o antigo propósito de Deus. Como é que a morte de Jesus glorificaria a Deus? “Eu, quando for levantado da terra, atrairei todos a mim mesmo” (v. 32).

Um ministério de excelsa glória com Paulo

Paulo viu sua vida como a continuação do antigo propósito, rumo ao fluir imenso de adoração obediente de todas as nações. Sua mais precisa declaração de missão e propósito era, por meio dele, “receber graça [...] por amor do seu nome, para a obediência por fé, entre todos os gentios” (Rm 1.5, ênfase minha). Paulo via todo o mundo dividido em duas categorias: onde Cristo era conhecido por “nome” e onde ainda não o era. Paulo resolutamente dirigia seus esforços de modo a trabalhar onde Cristo não era conhecido pelo nome (Rm 15.20).

Podemos ver a via dupla da glória de Deus no ministério de Paulo. Ele trabalhava para glorificar a Deus ao revelar Cristo às nações, tornando Cristo conhecido, porém seu maior zelo, o orgulho de sua alma, estava naquilo que retornaria a Deus das nações. “… por causa da graça que me foi outorgada por Deus, para que eu seja ministro de Cristo Jesus entre os gentios, no sagrado [sacerdotal] encargo de anunciar o

[cite] 4 4 V. John Davis, Moses and the Gods of Egypt (Grand Rapids: Baker, 1971). 5 6 5 Deus apresentou um sumário da abrangência de seu nome no Sinai (Êx 33.19; 34.6-8). São boas novas numa cápsula sobre como Deus age com as pessoas. É uma afirmação muito significativa e reconhecida pelas gerações posteriores de Israel como um resumo do que devia ser proclamado entre as nações (Sl 86.9-15; 145.1,2,8-12,21). O próprio Jonas reconheceu esse pacote de verdades como algo que ele sabia e que reteve dos ninivitas ( Jn 3.9—4.2). 6 Não considere a pergunta de Salomão sobre Deus habitar com a humanidade na terra uma expressão de desespero, como se Deus nunca o fizesse. A oração dele não pretendia ser um mapa definitivo do cosmos. Antes, ela se encaixa na aproximação humilde do Altíssimo. Salomão prossegue com um apelo de profunda humildade, no linguajar judicial mais formal, que o Rei de toda a terra se rebaixaria a voltar os olhos para o lugar de encontro e ouvir o povo, como prometera (2Cr 6.19-21). Ver 2Cr 6.1,2, em que Salomão reconhece a nuvem da glória de Deus, que preenchia o templo de tal modo que nenhum sacerdote conseguia suportar o terrível brilho (2Cr 5.13,14). 7 7 Um olhar mais aprofundado ao contexto mostra o que Paulo quer dizer com “conhecer” a Cristo. Não era questão de a mensagem de Cristo ser pregada uma vez por um missionário, e sim de assentar um “fundamento” (Rm 15.20). Antes disso, Paulo mencionou regiões específicas onde o evangelho estava sendo “divulgado” (Rm 15.19). Traduções como “pregar plenamente” ou “proclamar plenamente” enfatizam a transferência cognitiva da informação do evangelho de forma muito ambiciosa, especialmente à luz do cardápio completo de atividades evangelísticas dos v. 18 e 19. À luz do conceito paulino de “fundamento” (alicerce) em outros lugares (especificamente, 1Co 3.8-15), concluo que Cristo é “conhecido” quando há um movimento crescente e estabelecido de obediência a ele que tem potencial comprovado de articular e demonstrar a vida de Cristo à comunidade como um todo. Isso é o que muitos considerariam uma igreja.

adoradores adorarão o Pai em espírito e em verdade; porque são estes que o Pai procura para seus adoradores” ( Jo 4.23).

Uma casa de adoração para todos os povos

Em sua hora mais pública e em seu momento mais intenso, Jesus tornou manifesta a questão da adoração das nações. Ele purificou o templo do comercialismo religioso, que constituía uma barreira ao ingresso das nações à presença de Deus. Ele citou Isaías 56.7: “A minha casa será chamada Casa de Oração para todos os povos”. Os líderes religiosos que o ouviram imediatamente se lembraram do restante da passagem que Jesus estava citando, e Jesus pretendia que eles ouvissem tudo:

Aos estrangeiros que se chegam ao Senhor, para o servirem e para amarem o nome do

Senhor, sendo deste modo servos seus, sim, todos os que guardam o sábado, não o profanando, e abraçam a minha aliança, também os levarei ao meu santo monte e os alegrarei na minha Casa de Oração; os seus holocaustos e os seus sacrifícios serão aceitos no meu altar, porque a minha casa será chamada Casa de Oração para todos os povos (Is 56.6,7).

Logo antes de ir ao encontro da morte, Jesus mostrou o propósito de sua vida e de sua morte vindoura ( Jo 12.24-32). Abertamente, ele considerou a opção de pedir ao Pai que o livrasse da morte: “Agora, está angustiada a minha alma, e que direi eu? Pai, salva-me desta hora?”. Em vez de pedir um escape, todavia, ele declarou: “Precisamente com este propósito vim para esta hora”. Que propósito era esse? O que salta de seu coração na frase seguinte e se torna a oração de sua morte e de sua vida: “Pai, glorifica o teu nome”. Para espanto dos que estavam ao seu redor, o próprio Deus Pai respondeu dos céus a Jesus: “Eu já o glorifiquei e ainda o glorificarei”. A resposta de Deus ainda troveja, se você puder ouvir. É a resposta de Deus a qualquer um que entregue sua vida ao Pai para glorifi - car ainda mais o nome dele. Jesus disse que a resposta não viera para ele, mas para seus seguidores, que chegariam a idênticos momentos de escolher segui-lo (v. 30) de acordo com o antigo propósito de Deus. Como é que a morte de Jesus glorificaria a Deus? “Eu, quando for levantado da terra, atrairei todos a mim mesmo” (v. 32).

Um ministério de excelsa glória com Paulo

Paulo viu sua vida como a continuação do antigo propósito, rumo ao fluir imenso de adoração obediente de todas as nações. Sua mais precisa declaração de missão e propósito era, por meio dele, “receber graça [...] por amor do seu nome, para a obediência por fé, entre todos os gentios” (Rm 1.5, ênfase minha). Paulo via todo o mundo dividido em duas categorias: onde Cristo era conhecido por “nome” e onde ainda não o era. Paulo resolutamente dirigia seus esforços de modo a trabalhar onde Cristo não era conhecido pelo nome (Rm 15.20).

Podemos ver a via dupla da glória de Deus no ministério de Paulo. Ele trabalhava para glorificar a Deus ao revelar Cristo às nações, tornando Cristo conhecido, porém seu maior zelo, o orgulho de sua alma, estava naquilo que retornaria a Deus das nações. “… por causa da graça que me foi outorgada por Deus, para que eu seja ministro de Cristo Jesus entre os gentios, no sagrado [sacerdotal] encargo de anunciar o evangelho de Deus, de modo que a oferta deles seja aceitável, uma vez santificada pelo Espírito Santo. Tenho, pois, motivo de gloriar-me em Cristo Jesus nas coisas concernentes a Deus” (Rm 15.15-17).

A apaixonada ambição de Paulo por “proclamar o evangelho” baseava-se na comissão muito mais fundamental (ou, em sua língua, uma “graça que [lhe] foi outorgada por Deus”), o “sacerdócio do evangelho”. Não há como ignorar a ilustração. Paulo vê a si mesmo diante de Deus, servindo as nações como se fosse um sacerdote, instruindo-as e levando-as para perto de Deus, ajudando-as a trazer a glória de suas nações ao Senhor para o prazer dele. O trabalho de Paulo não era mudar sociedades e culturas. O Espírito de Deus estava operando para transformar e santificar a melhor demonstração possível de glória dos povos.

Paulo pagou caro, trabalhando com uma brilhante visão à sua frente. Era algo pelo qual ele sabia que valia a pena trabalhar e esperar. “A uma voz”, uma gama de crentes, judeus e gentios, fracos e fortes juntamente glorificarão “ao Deus e Pai de nosso Senhor Jesus Cristo” (Rm 15.6).

Um ensaio para a glória eterna

No fim da História, iremos nos maravilhar ao ver como o abundante amor de Deus se cumpriu. Seu amor terá triunfado ao conquistar, de todos os povos, apaixonada devoção. Jesus, então, terá cumprido plenamente a promessa que fez ao Pai: “Eu lhes fiz conhecer o teu nome [...] a fim de que o amor com que me amaste esteja neles ” ( Jo 17.26).

Muito além da história, descobriremos que todo culto de adoração dos muitos povos, ao longo de gerações, foram ensaios para declarações ainda maiores de amor e de glória, ainda envolvendo a glória beatificada de todas as nações.

Os céus encherão a terra: “Eis o tabernáculo de Deus com os homens. Deus habitará com eles. Eles serão povos de Deus, e Deus mesmo estará com eles” (Ap 21.3).

Os povos irão perdurar para sempre. A cidade, que é o céu na terra, será adornada por reis dos muitos povos, que trarão continuamente tesouros e frutos das nações ao trono de Deus (Ap 21.22-26). Nós o serviremos, assombrados e honrados, por termos o nome dele gravado na fronte. Contemplando seu rosto, nós o serviremos como sacerdotes amados (v. 1-5).

Para que serve um mundo evangelizado?

Até agora, clamamos: “Que a terra ouça sua voz!”. Que nós nunca deixemos de proclamar sua palavra a toda criatura. Contudo, logo chegará o dia em que, por todos os cálculos, a terra terá ouvido. E depois?

Há outro clamor, muito mais antigo. É um brado pelo destino da terra. Deve ser erguido hoje mais do que nunca: “Louvem-te os povos, ó Deus” (Sl 67.3-5). Mesmo agora, ouvimos um crescente louvor das nações. Concentremos então nossas mais profundas afeições e ousados planos para ver o esplendor de cada povo amando a Deus com o melhor de sua sociedade santificada. Que esperança magnífica!

MUDANÇAS NA PRÁTICA

A ênfase na glória de Deus é muito mais que uma flor decorativa na Grande Comissão. Mais do que nunca, devemos trabalhar juntos e com igual paixão para que Cristo seja conhecido por nome e louvado em todos os povos. Uma visão “doxológica” (relativa à glória) da evangelização mundial oferece sabedoria prática essencial para o cumprimento da tarefa restante. Adentrar a história de sua glória nos ajudará de três maneiras práticas:

1. Aprofundando nossa moti vação básica no amor pela glória de Deus

A evangelização mundial é para Deus. É comum trabalharmos com base na preocupação pela situação dos povos — ou para vê-los salvos do inferno, ou para vê-los partilhar de integridade comunitária, ou ambos. Tal compaixão é bíblica e necessária. Contudo, nosso amor pelo ser humano se equilibra e fortalece quando nossa impetuosa paixão é ver Deus honrado pela bondade estendida em seu nome e ver Deus receber ações de graças de povos transformados pelo poder do evangelho.

Jesus se comoveu com abundante compaixão ao ver as multidões como ovelhas abandonadas, mas ele não atendeu apenas à necessidade nua e crua delas. Deliberadamente, reformulou sua visão das mesmas multidões perdidas com outra metáfora. Em vez de ovelhas dispersas, viuas como algo precioso para Deus: uma “seara”. Quem pode compreender o prazer de Deus na plenitude dos frutos que recebe da vida das pessoas? Jesus começou exatamente isso. Olhando dessa perspectiva, ele implorou ao Senhor da seara que enviasse mais trabalhadores para levar a Deus sua colheita (Mt 9.35-38). Jesus sabia que, nos caminhos de Deus, o voluntariado tem pouco valor. Algo que tenha poder duradouro vem do autêntico “envio” de Deus. A compaixão flui como um rio daquele que é realmente enviado.

Esforços missionários que extraem sua motivação de uma reação compassiva à situação do homem não conseguem realizar tanto. Os apelos à culpa, aos cuidados pelos necessitados e perdidos continuam a amolecer, por pouco tempo, nosso coração. Na prática, porém, eles exaurem e endurecem os crentes até uma demonstração mínima de obediência. É preciso realizar o trabalho difícil e caro. Tal trabalho não se sustenta com o zelo fugaz e momentâneo gerado pelo clamor das almas desesperadas e condenadas. O propósito universal de Deus é uma questão antiga, muito mais que uma necessidade urgente. Agora, mais do que nunca, os crentes precisam cultivar um profundo zelo pela glória de Deus. Assim, confiantes de que Deus cumprirá sua promessa, seremos profundamente tocados pelas necessidades alheias e agiremos com intrepidez pelo propósito de Deus.

2. Definindo a tarefa como um acréscimo à glória de Deus

Nunca houve época em que os crentes se ocuparam tanto em alcançar todos os povos da terra. Levar em conta as etnias e suas culturas ajuda a planejar a comunicação eficaz do evangelho a cada cultura. A abordagem étnica parece útil para avaliar o progresso e designar tarefas diferentes para a colaboração eficaz.

Mesmo assim, a abordagem étnica é sempre uma questão delicada. É comum a acusação de que ela desintegra a unidade das igrejas ou acoberta atitudes obstinadas de dominação colonial pelo Ocidente. Em tempos recentes, alguns discretamente abandonaram a abordagem étnica a favor de paradigmas que parecem mais viáveis. Embora os Estados possam se desintegrar da noite para o dia, nos povos competidores que as compreendem, abordagens evangelísticas país a país ainda se mostram atraentes. Outras abordagens geográficas vão desde a demarcarcação de centros urbanos até o traçado de janelas, longitude e latitude e o mapeamento de forças espirituais posicionadas contra o evangelho. É claro, os povos da terra são entidades geográfi - cas, urbanizadas e nacionalizadas. Precisamos levar em consideração essas dimensões como fatores importantes para tecer abordagens úteis a qualquer povo. Nosso objetivo não pode ser reduzido à mera tentativa de causar “impacto” aos “alvos”. Precisamos pensar além do encontro com o evangelho. Precisamos desejar ver como resultado uma adoração obediente a Deus.

Proponho, como o mais importante, não a abordagem étnica, e sim o resultado étnico. Qual o resultado do evangelho? Certamente, algo mais que uma chance de cada pessoa dar um veredicto acerca da mensagem. Deus prometeu que obterá glória obediente para si de toda tribo e língua. Ele anseia pelo singular derramamento de amor, de justiça, de sabedoria e de adoração que só pode vir de todos os povos. Esse seria o melhor motivo para plantar igrejas autóctones. Assim se elevará a maravilha peculiar de cada etnia e, ao mesmo tempo, se realçará o valor de estender o impacto do evangelho a todos os lugares. A geografia se torna, então, ainda mais importante. Cada cidade e lugar adquire maior significado como a praça da singular demonstração do Reino de Deus.

3. Somando esforços para a glória de Deus

A dicotomia, obviamente falsa, entre evangelismo e ação social pode ser deixada de lado pela abordagem doxológica. Argumenta-se em torno do que é mais importante: salvar uma alma ou curar uma comunidade? A pergunta é igualmente repugnante a todos. A resposta mais comum são generalizações vagas com a sugestão de se tratar o assunto como uma questão de “tanto quanto” em vez de “isto ou aquilo”. Talvez possamos melhorar. E se as questões forem resolutamente examinadas e abraçadas pelos que proclamam o nome de Deus?

A glória chega a Deus pela proclamação do evangelho ou por uma ação praticada em seu nome. A glória maior ressoa quando comunidades inteiras conseguem ver a mão de Deus transformando vidas.

Alguns, inutilmente, propõem um duplo mandato, de modo a obter um ponto de equilíbrio. A chamada ordem cultural de encher a terra tem como contraponto a ordem de evangelizar o mundo. Não há um único propósito de que todos os povos prestem culto a Deus em todos os lugares da terra? O culto das nações precisa ser uma vida de completa obediência em justiça e retidão. Os sacrifícios de adoração, que agora devem ser levados a Deus por meio de Jesus, são tanto palavras quanto obras.

Na perspectiva da glória de Deus jaz a substância da verdadeira unidade entre as igrejas. Em nosso zelo pela glória singular a ser conferida a Deus por todos os povos, podemos facilmente deixar de lado exigências de uniformidade de adoração e de conduta. Podemos nos alegrar na variedade de estilos de justiça, de paz e de alegria, enquanto crescemos no zelo pela verdade singular confessada por todos na pessoa de Cristo.

Perguntas para estudo

1.Como a oração para que Deus santifique seu nome funciona no cumprimento de um antigo

propósito do Senhor?

2.Explique como o cumprimento da Grande Comissão resultará na adoração por parte “de to-

dos os povos”.

3.Explique como a adoração revela a glória de Deus tanto quanto permite que ele realize ple-

namente seu amor pela Humanidade.

4.Hawthorne diz que a história da Bíblia está voltada tanto para o conhecimento quanto para

a adoração a Deus. Critique sua tese. Há uma história coerente ao longo da Bíblia? A glória

de Deus é o tema supremo? Que outras opções existem?

[cite] 7 7 Um olhar mais aprofundado ao contexto mostra o que Paulo quer dizer com “conhecer” a Cristo. Não era questão de a mensagem de Cristo ser pregada uma vez por um missionário, e sim de assentar um “fundamento” (Rm 15.20). Antes disso, Paulo mencionou regiões específicas onde o evangelho estava sendo “divulgado” (Rm 15.19). Traduções como “pregar plenamente” ou “proclamar plenamente” enfatizam a transferência cognitiva da informação do evangelho de forma muito ambiciosa, especialmente à luz do cardápio completo de atividades evangelísticas dos v. 18 e 19. À luz do conceito paulino de “fundamento” (alicerce) em outros lugares (especificamente, 1Co 3.8-15), concluo que Cristo é “conhecido” quando há um movimento crescente e estabelecido de obediência a ele que tem potencial comprovado de articular e demonstrar a vida de Cristo à comunidade como um todo. Isso é o que muitos considerariam uma igreja. 8 10 9 8 Paulo usa a ideia de um sacerdote, ativando-a como um verbo a fim de dizer, para todos os efeitos, que está “sacer- dotando” o evangelho. A imagem é a de um sacerdote hebreu cuja principal tarefa é ajudar o povo para apresentar suas ofertas de adoração a Deus. 9 A ideia é “voltado para Deus” como se estivesse num templo. 10 Alguns manuscritos bem aceitos mantêm nessa passagem a palavra “povos”, no plural.$conteudo$
     where curso_id = v_curso and ordem = 9;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 2 · Leitura — Hawthorne, cap. 4: A História da Sua Glória$t$, $conteudo$A história de sua glória

Steven C. Hawthorne

A Bíblia é, basicamente, uma história sobre Deus. Quando olhamos as Escrituras como um livro de autoajuda, acabamos entediados ou frustrados com o que parece ser uma coleção de histórias desconexas. O que aconteceria se descobríssemos que a Bíblia fala mais a respeito de Deus que de nós? Como é emocionante descobrir que todos os elementos das Escrituras — os relatos dos acontecimentos, os versículos de refinada sabedoria, as profecias líricas — convergem numa saga central dessa respeitável pessoa.

Estamos habituados com a ideia de que a Bíblia é uma história verídica. É tão verídica que continua a desenrolar-se neste instante. Estamos acostumados a ouvir que a Bíblia é uma história de amor, mas tendemos ver apenas um lado da história: como Deus ama o ser humano. Se a principal mensagem da Bíblia é que Deus deve ser amado de todo o coração, alma, mente e força, talvez seja sábio ler toda a história do ponto de vista de Deus. Quando partimos do ponto de vista de Deus, a grande história de amor finalmente faz sentido: não é apenas Deus amando as pessoas. Ele as está transformando para que também sejam capazes de amá-lo plenamente. Deus está atraindo adoradores que, espontaneamente, inspirados pelo amor, rendam glória a ele.

Deus só pode ser amado na medida em que é conhecido. É por isso que a história da Bíblia é a história de Deus se revelando para atrair a si obediente adoração e a glória das nações. Com o amor passional de Deus no centro, a Bíblia é realmente a história de sua glória.

CONCEITO BÁSICO DE GLÓRIA

Para traçar a história de Deus como a Bíblia a apresenta, precisamos compreender três ideias relacionadas que definem a história em cada conjuntura: glória, o nome de Deus e adoração.

Glória

Não se deixe levar pelo tom religioso da palavra “glória”. Glória é a beleza relacionada com o que o coração almeja até que efetivamente alcance. A palavra “glória”, nas Escrituras, refere-se à dignidade, à beleza ou ao valor essencial das pessoas, das criaturas e, é claro, do Criador. A palavra hebraica para “glória” significa

“peso”, “substância” e, ao mesmo tempo, “brilho” ou “beleza radiante”. Glorificar alguém é reconhecer seu valor e sua beleza intrínseca; é falar publicamente desses atributos. Glorificar a Deus é louvar ou falar dele aberta e sinceramente. A glória está no coração da verdadeira adoração ao longo das Escrituras: “Todas as nações que fizeste virão, prostrar-se-ão diante de ti, Senhor, e glorificarão o teu nome” (Sl 86.9); “Nós que adoramos a Deus no Espírito, e nos gloriamos em Cristo Jesus...” (Fp 3.3).

A ideia de “glória” também abrange a honra que pode ser dada como presente ou recompensa. Quando alguém é exaltado ou engrandecido, ele é, de certa forma, no sentido bíblico, glorificado. Por ser tão rico em glória, Deus concede extravagantes honras aos seus servos humanos sem comprometer em nada a própria majestade. Jesus expôs nosso hábito de buscar glória “uns dos outros”, mas não “a glória que vem do Deus único” ( Jo 5.44).

O nome de Deus

Por toda a história sagrada, os autores bíblicos usam a ideia do “nome de Deus” como um conceito-chave. Para distinguir as funções de referência, revelação e de reputação, talvez seja útil classificar esse nome em três categorias fáceis de lembrar: crachá, vitrine e nome artístico.

Nome de crachá

Existem nomes próprios usados para designar Deus na Bíblia. Deus nunca é anônimo em sua história. Ele usa muitos nomes para si. Como a função é referencial, podemos chamar esses nomes, para nossos propósitos, “nomes de crachá” de Deus, visto que o crachá é o que distingue e identifica alguém. É igualmente verdadeiro referir-se ao Deus das Escrituras como “Senhor dos Exércitos” e como “Deus Todo-Poderoso”, ou “Juiz de toda a terra”, ou “Rei da Glória”. Cada um desses nomes é, de fato, o nome de Deus.

Nome de vitrine

A vitrine serve para expor ou apresentar algo ao público. Deus gosta de se apresentar com seus nomes bíblicos. Nessa analogia, a função é a revelação. Por exemplo, qualquer um que passe alguns minutos pensando no nome “O Senhor é o meu Pastor” terá um entendimento melhor da bondade de Deus.

Nome artí sti co

A terceira categoria dos nomes de Deus é a mais abundante na Bíblia, embora seja pouco reconhecida. O “nome de Deus”, na maioria das vezes, refere-se à ideia de seu reconhecimento público. Seria algo como o “nome artístico” de Deus. Sua função é indicar a reputação de Deus. O nome de Deus é seu título global. É a memória aberta, baseada em eventos históricos, que estabelece uma reputação digna de futura confiança. O nome de Deus é o corpo de verdades a seu respeito que ele demonstrou e declarou no desenrolar da história bíblica. O povo hebreu devia não só valorizar essa história, mas também divulgá-la. Diferentemente das outras religiões, a revelação de Deus nunca foi destinada a ser uma questão secreta para determinados povos. Isaías pede a Israel: “Tornai manifestos os seus feitos entre os povos”, para que as nações se lembrem de que “é excelso o seu nome” (Is 12.4). Como veremos a seguir, grande parte da história bíblica reconta o que Deus tem feito para tornar seu nome conhecido entre as nações.

Adoração

Por que Deus quer ser conhecido em tal profundidade? Ele quer ser mais que mundialmente famoso: ele deseja ser verdadeiramente adorado.

Deus revela glória para receber glória

A glória de Deus flui em duas direções. A primeira é para o mundo. Ele mostra sua glória à humanidade por toda a terra. Ele revela quem é e o que tem feito a fim de abrir caminho para o segundo direcionamento de sua glória — que os seres humanos possam dar-lhe glória por meio de uma adoração motivada pelo amor. Deus revela glória a todas as nações, a fim de receber glória da humanidade pela adoração.

O salmo 96 mostra as duas direções da glória de Deus. Ele exige a proclamação de sua glória às nações: “Cantai ao Senhor, bendizei o seu nome; proclamai a sua salvação, dia após dia. Anunciai entre as nações a sua glória, entre todos os povos, as suas maravilhas” (v. 1,2).

Que retrato eloquente da evangelização do mundo! Contudo, o salmista faz questão de dizer o propósito da evangelização mundial ao mostrar o segundo aspecto da glória de Deus — a resposta de glória das nações a Deus: “Tributai ao Senhor, ó famílias dos povos, tributai ao Senhor glória e força. Tributai ao Senhor a glória devida ao seu nome; trazei oferendas e entrai nos seus átrios. Adorai o Senhor na beleza da sua santidade; tremei diante dele, todas as terras” (v. 7-9).

O coração das missões flui nesta maravilhosa economia da glória: Deus revela sua glória a todas as nações para receber glória de toda a criação.

Um propósito além da salvação

O ser humano é, de fato, salvo por meio da declaração universal da salvação de Deus, mas o valor máximo dessa salvação não reside apenas na condição de salvo, ou seja, de que ele foi salvo.

O que realmente importa é para que foi salvo. Ele foi salvo para servir a Deus em atitude de adoração. Nesse sentido, podemos dizer que a evangelização mundial é feita para Deus. Por mais acostumados que estejamos a ter os seres humanos em altíssima conta, a Bíblia é clara: o raciocínio por trás das missões é a colossal dignidade de Deus. Observe a lógica de Salmos 96.2-4: “Proclamai a sua salvação, dia após dia [...] entre todos os povos. [...] Porque grande é o Senhor e mui digno de ser louvado, temível mais que todos os deuses”.

Uma lógica maior do que mera supremacia

A lógica por trás de missões parece bastante simples: visto que Deus é supremo, toda criatura deve prostrar-se em submissão a ele. Mas seria apenas isso a lógica no centro do Universo? Nossa mente não se satisfaz com essa ideia. Existe algo mais. As Escrituras afirmam com veemência a verdade de que Deus é amor. Deus convida os seres humanos a amá-lo com tudo que são. Onde está o amor de Deus? E o nosso, como resposta?

Um Deus que exige adoração só porque é supremo não nos parece ser tão amoroso — na verdade, nem mesmo digno de admiração. A exigência de louvor faz parecer que Deus está lutando com um problema de baixa autoestima. É tolice falar do zelo de Deus pela adoração como se ele fosse uma divindade tribal petulante ameaçada por deuses rivais. Deus nunca é ameaçado, ele se entristece com a falsa adoração. Quando adora qualquer um ou qualquer coisa além de Deus, o ser humano se torna semelhante ao objeto de sua adoração. Deus tem intenções melhores para com a humanidade.

Então, o que é verdadeira adoração? A adoração ocorre quando a pessoa reconhece quem Deus é, quando torna esse reconhecimento público, quando se aproxima dele de livre vontade, oferecendo-lhe face a face gratidão e, diariamente, lealdade. A adoração é um genuíno relacionamento de interação com Deus. É por isso que Deus sempre nos recebe quando nos

[cite] E o nome Javé, ou Jeová, como vemos em algumas traduções, sem dúvida é um nome importante, mas precisamos ter cuidado para não pensar que o Deus vivo tem um único nome jurídico “real”, como se ele tivesse certidão de nascimento em algum arquivo por aí. A Bíblia é consistente em nos impulsionar a conhecê-lo como ele deseja ser universalmente conhecido. A questão de Êxodo 3.13 provavelmente não é de referência (“Qual deus você está representando, Moisés?”), mas de reputação (“Que histórico esse Deus construiu para si que justifique cometermos o ato suicida de insurgir contra o faraó? Qual a base para a fidedignidade desse Deus?”). É possível compreender o tetragrama (YHWH) no sentido ver- bal de “Eu causarei o que se dará”, que está perfeitamente de acordo com um Deus que é Criador e também fiel às suas promessas. O contexto maior dá ênfase à resposta final de Deus à pergunta do povo: “Assim dirás aos filhos de Israel: O Senhor, o Deus de vossos pais, o Deus de Abraão, o Deus de Isaque e o Deus de Jacó, me enviou a vós outros; este é o meu nome eternamente, e assim serei lembrado de geração em geração” (Êx 3.15).

[cite] STEVEN C. HAWTHORNE é fundador e diretor de WayMakers, em Austi n, Texas, nos Estados Unidos. É coeditor do livro Missões transculturais (São Paulo: Mundo Cristão, 1987). É também responsável por expedições de pesquisa entre povos não alcançados em cidades cosmopolitas — o Projeto Josué. Ele é coautor (com Graham Kendrick) de Prayerwalking: Praying on Site with Insight [Orando e caminhando: orando no local e com entendimento] e autor de vários arti gos.

grande parte da história bíblica reconta o que Deus tem feito para tornar seu nome conhecido entre as nações.

Adoração

Por que Deus quer ser conhecido em tal profundidade? Ele quer ser mais que mundialmente famoso: ele deseja ser verdadeiramente adorado.

Deus revela glória para receber glória

A glória de Deus flui em duas direções. A primeira é para o mundo. Ele mostra sua glória à humanidade por toda a terra. Ele revela quem é e o que tem feito a fim de abrir caminho para o segundo direcionamento de sua glória — que os seres humanos possam dar-lhe glória por meio de uma adoração motivada pelo amor. Deus revela glória a todas as nações, a fim de receber glória da humanidade pela adoração.

O salmo 96 mostra as duas direções da glória de Deus. Ele exige a proclamação de sua glória às nações: “Cantai ao Senhor, bendizei o seu nome; proclamai a sua salvação, dia após dia. Anunciai entre as nações a sua glória, entre todos os povos, as suas maravilhas” (v. 1,2).

Que retrato eloquente da evangelização do mundo! Contudo, o salmista faz questão de dizer o propósito da evangelização mundial ao mostrar o segundo aspecto da glória de Deus — a resposta de glória das nações a Deus: “Tributai ao Senhor, ó famílias dos povos, tributai ao Senhor glória e força. Tributai ao Senhor a glória devida ao seu nome; trazei oferendas e entrai nos seus átrios. Adorai o Senhor na beleza da sua santidade; tremei diante dele, todas as terras” (v. 7-9).

O coração das missões flui nesta maravilhosa economia da glória: Deus revela sua glória a todas as nações para receber glória de toda a criação.

Um propósito além da salvação

O ser humano é, de fato, salvo por meio da declaração universal da salvação de Deus, mas o valor máximo dessa salvação não reside apenas na condição de salvo, ou seja, de que ele foi salvo.

O que realmente importa é para que foi salvo. Ele foi salvo para servir a Deus em atitude de adoração. Nesse sentido, podemos dizer que a evangelização mundial é feita para Deus. Por mais acostumados que estejamos a ter os seres humanos em altíssima conta, a Bíblia é clara: o raciocínio por trás das missões é a colossal dignidade de Deus. Observe a lógica de Salmos 96.2-4: “Proclamai a sua salvação, dia após dia [...] entre todos os povos. [...] Porque grande é o Senhor e mui digno de ser louvado, temível mais que todos os deuses”.

Uma lógica maior do que mera supremacia

A lógica por trás de missões parece bastante simples: visto que Deus é supremo, toda criatura deve prostrar-se em submissão a ele. Mas seria apenas isso a lógica no centro do Universo? Nossa mente não se satisfaz com essa ideia. Existe algo mais. As Escrituras afirmam com veemência a verdade de que Deus é amor. Deus convida os seres humanos a amá-lo com tudo que são. Onde está o amor de Deus? E o nosso, como resposta?

Um Deus que exige adoração só porque é supremo não nos parece ser tão amoroso — na verdade, nem mesmo digno de admiração. A exigência de louvor faz parecer que Deus está lutando com um problema de baixa autoestima. É tolice falar do zelo de Deus pela adoração como se ele fosse uma divindade tribal petulante ameaçada por deuses rivais. Deus nunca é ameaçado, ele se entristece com a falsa adoração. Quando adora qualquer um ou qualquer coisa além de Deus, o ser humano se torna semelhante ao objeto de sua adoração. Deus tem intenções melhores para com a humanidade.

Então, o que é verdadeira adoração? A adoração ocorre quando a pessoa reconhece quem Deus é, quando torna esse reconhecimento público, quando se aproxima dele de livre vontade, oferecendo-lhe face a face gratidão e, diariamente, lealdade. A adoração é um genuíno relacionamento de interação com Deus. É por isso que Deus sempre nos recebe quando nos aproximamos dele para adorar com ofertas. Ele não precisa de ofertas de adoração, porém elas trazem o ofertante. É por isto que as nações são convocadas a trazer ofertas: para apresentar a Deus o que têm de melhor (Sl 96.8 etc.). Por meio de seus sacrifícios e ofertas, elas oferecem a si mesmas.

Concedendo plenamente seu amor

Por que Deus deseja tanto ser adorado? Duas razões: ele se agrada do amor sincero dedicado a ele pela verdadeira adoração. E mais: ao atrair o ser humano à verdadeira adoração, Deus pode conferir-lhe plenamente seu amor. Podese ver isso em Salmos 96.6: “Glória e majestade estão diante dele, força e formosura, no seu santuário”.

“Glória e majestade” não é uma referência à experiência de Deus consigo mesmo. Esses dois atributos, unidos a “força e formosura” (a passagem paralela diz “alegria” — 1Cr 16.27, ARC), são aspectos da presença de Deus que devem ser a experiência dos que se aproximam dele em verdadeira atitude de adoração. Não pode haver nada mais esplêndido ou majestoso para o ser humano que estar na maravilhosa e estonteante grandeza da presença régia de Deus.

A adoração é o modo de a humanidade glorificar a Deus. Quando observada do ponto de vista divino, pode-se ver que é também o modo de Deus glorificar o ser humano — no melhor sentido da palavra, conferir ao ser humano a maior honra. A adoração cumpre o amor de Deus. Ele nos ama de maneira tão intensa que deseja exaltar-nos a algo melhor que a grandeza. Ele deseja levar-nos à honrosa proximidade dele. Estenda sua mente e seu coração até onde conseguir, porém jamais conseguirá perceber a extensão do que Deus tem preparado para aqueles que o amam (1Co 2.9).

Em Apocalipse 5.1-14, talvez João tenha vislumbrado a “majestade” e a “glória” daqueles átrios. Ele ouviu todas as miríades celestiais erguerem a voz, aclamando a Deus, pelo maravilhoso ato de comprar gente de todas as tribos e línguas. Por que Deus desejaria adquirir seres humanos ignóbeis ao extravagante custo do sangue de seu Filho? Além disso, por que ele comprou representantes de cada etnia? Que valor eles têm? A preciosidade deles reside nisto: eles serão seus sacerdotes. De cada povo, alguns representantes ofertarão alegremente a Deus distintas honras e glórias. Cada povo tem valor eterno por causa do sangue de Cristo. Cada povo tem um lugar designado diante dele. Deus dispôs seu poderoso coração a reuni-los ali. É necessário que seja assim. A força desse amor não correspondido pelos povos está no âmago de qualquer empreitada missionária.

O salmista reflete o zelo de Deus pelos povos da terra. Deus acena para todas as “famílias dos povos”, pessoas com profundos laços generativos, ligadas pelo sangue e pelo matrimônio. Cada uma dessas extensas famílias tem uma história e um destino diante de Deus. Cada uma delas é convidada formalmente à sua régia presença (Sl 96.7-9). Elas não devem chegar de mãos vazias, pelo contrário, devem entregar a Deus uma amostra da glória e da força singular de seu povo. Os povos devem expressar a Deus ofertas de louvores nas diversas línguas, mas não cabe a nenhum povo oferecer especulações sobre o que constitui o devido louvor. O que o verdadeiro Deus revelou acerca de si mesmo — “a glória devida ao seu nome” — é a única substância e a verdadeira medida do digno louvor (v. 8).

A BÍBLIA COMO A HISTÓRIA DE DEUS

A Bíblia é o envolvente drama do amor de Deus, que procura atrair a adoração das nações. Lembre-se do pressuposto básico: Deus revela sua glória a todas as nações para que possa receber glória de toda a criação. Essa dupla dimensão da glória de Deus ajudará na compreensão de um aparente amontoado de antigas histórias.

Abraão

Quando Abraão chegou à terra da promessa, ele não se sobressaiu como brilhante missionário, seja lá como possamos definir esse papel. Tampouco foi registrado como grande evangelista. Na verdade, ele foi vergonhosamente expulso do Egito (Gn 12.10-20). Os vizinhos de Abraão assustaram-no ao ponto de ele mentir sobre sua família.

O motivo de Abraão ter mentido a respeito de sua esposa não revela a confiança do evangelista em que vidas podem ser transformadas: “Certamente não há temor de Deus neste lugar” (Gn 20.11). Contudo, apesar de todas as suas falhas, quando chegou à nova terra ele tomou uma atitude missionária, a melhor que podia. Sua primeira ação foi estabelecer a adoração pública a Deus: “Edificou um altar ao Senhor e invocou o nome do Senhor” (Gn 12.7-8).

Seus familiares podem ter sido os únicos adoradores no altar, mas de forma explícita e pública Deus foi adorado pelo seu nome.

Abençoado para ser uma bênção abençoadora

À certa altura, Abraão salvou alguns de seus poderosos vizinhos de uma coalizão de nações saqueadoras (Gn 14). Depois da vitória milagrosa, Abraão recusou-se a aceitar a recompensa oferecida pelo rei de Sodoma. Ele sabia que, se aceitasse aquela generosidade, dali em diante ele e sua família seriam vistos como apadrinhados da cidade. Em vez disso, ele escolheu manterse diante das nações como alguém abençoado por Deus.

À vista das nações, Abraão resolutamente declarou Deus como aquele que o recompensaria e o abençoaria. Suas corajosas palavras (Gn 14.21-24) foram comprovadas pela oferta de bens que Abraão ofereceu a Deus. Abraão ofereceu ao Senhor a riqueza de Sodoma, assim como a das outras nações. Ele ajudou nações estrangeiras a apresentar o dízimo a Deus, um reconhecido ato formal de adoração (Gn 14.18-20). Com Melquisedeque presidindo o sacerdócio, Abraão, como sacerdote, adorou ao apresentar ofertas de adoração em nome de outras nações.

Abraão foi abençoado a fim de ser bênção para as nações (Gn 12.1-3), mas o propósito vai além de abençoar nações. O próprio Deus foi bendito! Melquisedeque abertamente reconheceu que Abraão era abençoado pelo Senhor. Pelo poder de Deus, Abraão foi uma bênção para seus vizinhos, resgatando famílias e bens escravizados, porém o grande resultado foi o próprio Deus ser bendito com louvor! Ouça Melquisedeque: “Bendito seja Abrão pelo Deus Altíssimo [...] e bendito seja o Deus Altíssimo” (Gn 14.18-20).

O que aprendemos com todos esses acontecimentos? Por causa de sua contínua adoração, Abraão tornou o nome de Deus conhecido. Deus engrandeceu o próprio nome pelo dramático poder redentor demonstrado em povo. O resultado foi um ajuntamento multinacional em honrosa gratidão a Deus, que foi explícita e verdadeiramente adorado.

O propósito global confirmado pela obediência na adoração

O momento crucial e a maior provação na vida de Abraão implicaram um ato de adoração (Gn 22). Deus ordenou a Abraão que oferecesse em sacrifício seu filho Isaque, num ato de adoração. Era um teste para provar o que Abraão e sua família viriam a ser. Encontraria Deus em Abraão aquela paixão obediente e sacerdotal (literalmente “temor a Deus”, Gn 22.12)?

Provaria Abraão ser zeloso, oferecendo a adoração que Deus solicitara? Caso afirmativo, Deus encontraria nele o tipo de fé que desejava ver multiplicada entre as nações. Você conhece a história. No momento em que Abraão ia cumprir a ordem, o ato de adoração, Deus falou dos céus e fez um juramento solene, declarando veementemente seu propósito universal de abençoar todos os povos da terra por meio da família de Abraão (22.18).

O Êxodo

Deus fez mais pelo seu nome que obter a adoração de Abraão. No Êxodo, Deus ficou mundialmente conhecido, de maneira marcante. De relance, a história do Êxodo não parece ser um grande evento missionário. Milhares de egípcios morreram. O pesar pairava sobre cada lar egípcio. O que Deus estava fazendo?

A passagem-chave é Êxodo 9.13-16, em que Moisés dá o ultimato a Faraó, com uma intrépida palavra a respeito dos planos divinos:

Assim diz o Senhor, o Deus dos hebreus:

Deixa ir o meu povo, para que me sirva. Pois esta vez enviarei todas as minhas pragas sobre o teu coração, e sobre os teus oficiais, e sobre o teu povo, para que saibas que não há quem me seja semelhante em toda a terra.

Pois já eu poderia ter estendido a mão para te ferir a ti e o teu povo com pestilência, e terias sido cortado da terra; mas, deveras, para isso te hei mantido, a fim de mostrarte o meu poder, e para que seja o meu nome anunciado em toda a terra

Perceba que Deus não disse apenas: “Deixa ir o meu povo”. Essa é apenas a metade da frase, sem seu propósito. Atente para ouvir por completo o clamor de salvação: “Deixa ir o meu povo, para que me sirva” (Êx 8.1,20; 9.1,13; 10.3).

Faraó compreendeu bem as exigências de Moisés — que o povo fosse libertado para adorar. Faraó provavelmente pensou que o apelo por um feriado de adoração era um engodo para disfarçar planos de fuga. Talvez muitos dos hebreus tenham se equivocado também, pensando que o plano de adorar a Deus no deserto era apenas um ardil para enganar as autoridades. Não é de admirar que a maioria deles depois só pensasse em conforto, alimentação, segurança e entretenimento! Eles custaram a entender que Deus, naquela fuga, tinha um propósito para si, com vistas às nações. Eles tinham virado a salvação pelo avesso: pensavam que o livramento deles era a principal preocupação de Deus, porém Deus orquestrava um poderoso plano para atrair a atenção das nações para si.

Deus atrai a atenção do mundo para seu nome

Deus estava se destacando sobre todos os deuses da terra. No Êxodo, ele estava “eternizando”, seu nome (Is 63.11-14; Ne 9.9-10). Ele queria que todos no Egito e os demais habitantes da terra soubessem que não havia outro deus como o único Deus vivo. Ele queria que o mundo visse uma multidão de escravos marchando em procissão para o adorar. Deus estabeleceu sua reputação como a maior e verdadeiramente santa (não apenas a mais santa) divindade já cogitada pelo homem: um Deus singular, todo-poderoso e resplendente, absolutamente incomparável. O Êxodo deve ser o principal ponto de referência para toda a revelação subsequente ao mundo sobre seu caráter, sua santidade e seu poder. Como o caos no Egito revelou o Deus vivo?

Julgando os deuses do Egito

Alguns estudiosos perceberam que cada uma das pragas do Egito consistiu num ataque direto aos falsos deuses daquela nação ou às estruturas opressivas de poder, que eram reverenciadas com zelo fanático. Algumas divindades egípcias, como o próprio rio Nilo e o grande deus-sol, foram diretamente desmoralizadas pelas pragas de sangue e de trevas. Outras foram indiretamente envergonhadas, pois tiveram exposta sua completa incapacidade de exercer seus atributos. Alguns deuses eram reverenciados por serem capazes de conter as infestações de insetos e de proteger o gado de doenças. A poderosa elite religiosa foi terrivelmente envergonhada. O exército, muito temido, foi sumariamente aniquilado. Por que Deus arruinou o Egito diante do mundo?

Deus estava executando “juízo sobre todos os deuses do Egito” (Êx 12.12). Ele não pretendia destruir o povo, e sim desmoralizar uma dos mais conceituados panteões de falsos deuses de toda a terra. Se ele quisesse destruir o povo egípcio, o teria feito sem dificuldades: “Já eu poderia ter estendido a mão para te ferir a ti e o teu povo com pestilência, e terias sido cortado da terra; mas, deveras, para isso te hei mantido, a fim de mostrar-te o meu poder, e para que seja o meu nome anunciado em toda a terra” (Êx 9.15,16).

As nações percebem

Funcionou? Teria o mundo percebido que Deus estava engrandecendo o próprio nome? A devastação registrada no livro de Êxodo não foi manchete em hieróglifos egípcios, pois devemos entender que os acontecimentos que desmoralizavam os egípcios jamais seriam talhados em pedra.

A Bíblia relata que as ondas do mar Vermelho mal haviam abaixado quando Moisés conclamou o povo a cantar: “Senhor é o seu nome [...] Ó Senhor, quem é como tu entre os deuses? Quem é como tu, glorificado em santidade...”. Então, depois de mencionar o nome de algumas das nações circunvizinhas, eles declaram: “Os povos o ouviram, eles estremeceram” (Êx 15.3-15).

Jetro entrara na família de Moisés pelo casamento, mas ainda era muito pagão em seu modo de pensar. Sem dúvida, tinha ouvido de Moisés, durante anos, acerca do Deus dos hebreus. Talvez muitos povos e cidades tivessem ouvido algo a respeito daquele grande Deus, mas sem adorá-lo ou sem confiar nele. Contudo, veja o que Jetro comenta depois de saber das pragas do Egito: “Agora , sei que o Senhor é maior que todos os deuses, porque livrou este povo de debaixo da mão dos egípcios, quando agiram arrogantemente contra o povo” (Êx 18.11). Jetro era um grande sacerdote de um povo estrangeiro — qualificado, portanto, para avaliar assuntos religiosos (Êx 18.1).

Hoje, ao ler a história de Moisés e seu confronto com o Egito, pode parecer que este fosse apenas mais um império opressor que abusava dos escravos. Nos dias de Moisés, sabia-se abertamente que o Egito era um emaranhado de poderes religiosos, econômicos e militares entretecidos com poderes espirituais. Deus desfez o sistema deles para mostrar o que de fato representavam aqueles poderes: um horrendo mal espiritual dedicado a impedir os adoradores de se aproximar de Deus. O Senhor havia abençoado o Egito, mas este se tornara inimigo de Deus. O “juízo” de Deus em forma de pragas e o milagre no mar Vermelho (Êx 12.12) não devem ser entendidos como mero castigo por más obras. A intervenção de Deus derrubou o mal opressivo para libertar o povo. Por que foram libertados? “Deixa ir o meu povo, para que me sirva.” Deus orquestrara os eventos do Êxodo para que revelassem sua glória, estabelecendo seu nome universalmente . Então, diante dos olhos do mundo, ele trouxe um povo para junto de si, a fim de estabelecer um modo de adoração do qual todas as outras nações pudessem participar.

A conquista de Canaã

A conquista de Canaã deve ser vista sob o mesmo prisma: Deus requisitando para si um povo único e santo que o adore. A essa nação, com seu testemunho, Deus atrairá todos os outros povos para que também o reverenciem e o conheçam.

[cite] 2 2 Abrão reconheceu que, pela promessa que fizera de abençoar a ele e sua família, Deus estava praticamente consti- tuindo uma nova família. O conceito bíblico de bênção está carregado de matizes de honra familiar e de herança. A bên- ção bíblica constituía muitas vezes uma afirmação de poder que concedia um destino. A bênção familiar muitas vezes se tornava o aspecto mais importante de uma herança. Muitas sociedades nos dias de hoje restringem a ideia de herança ao manejo das posses não despendidas depois da morte de um antecessor. A herança bíblica não era considerada o resto de uma geração destinado a ser consumido pela geração seguinte. Sabia-se que uma bênção era uma herança especial para as futuras gerações da família, multiplicando-se em abundância. O aspecto mais assombroso da bênção prometida a Abraão (Gn 12.3) foi que Deus estava confiando a ele um dote destinado a dar algo substancial a todas as famílias do planeta, muito além de uma família aumentada. 3 3 Outras variações do apelo pela libertação dos hebreus indicam que o termo hebraico geral traduzido por “servir” está ligado ao contexto de culto de adoração (Êx 3.12; 4.23; 5.1; 7.16; 8.27,29; 10.9). V. esp. Êx 10.26, que deixa claro que “servir ao Senhor” corresponde a oferecer sacrifício a Deus. 4 4 V. John Davis, Moses and the Gods of Egypt (Grand Rapids: Baker, 1971).

com zelo fanático. Algumas divindades egípcias, como o próprio rio Nilo e o grande deus-sol, foram diretamente desmoralizadas pelas pragas de sangue e de trevas. Outras foram indiretamente envergonhadas, pois tiveram exposta sua completa incapacidade de exercer seus atributos. Alguns deuses eram reverenciados por serem capazes de conter as infestações de insetos e de proteger o gado de doenças. A poderosa elite religiosa foi terrivelmente envergonhada. O exército, muito temido, foi sumariamente aniquilado. Por que Deus arruinou o Egito diante do mundo?

Deus estava executando “juízo sobre todos os deuses do Egito” (Êx 12.12). Ele não pretendia destruir o povo, e sim desmoralizar uma dos mais conceituados panteões de falsos deuses de toda a terra. Se ele quisesse destruir o povo egípcio, o teria feito sem dificuldades: “Já eu poderia ter estendido a mão para te ferir a ti e o teu povo com pestilência, e terias sido cortado da terra; mas, deveras, para isso te hei mantido, a fim de mostrar-te o meu poder, e para que seja o meu nome anunciado em toda a terra” (Êx 9.15,16).

As nações percebem

Funcionou? Teria o mundo percebido que Deus estava engrandecendo o próprio nome? A devastação registrada no livro de Êxodo não foi manchete em hieróglifos egípcios, pois devemos entender que os acontecimentos que desmoralizavam os egípcios jamais seriam talhados em pedra.

A Bíblia relata que as ondas do mar Vermelho mal haviam abaixado quando Moisés conclamou o povo a cantar: “Senhor é o seu nome [...] Ó Senhor, quem é como tu entre os deuses? Quem é como tu, glorificado em santidade...”. Então, depois de mencionar o nome de algumas das nações circunvizinhas, eles declaram: “Os povos o ouviram, eles estremeceram” (Êx 15.3-15).

Jetro entrara na família de Moisés pelo casamento, mas ainda era muito pagão em seu modo de pensar. Sem dúvida, tinha ouvido de Moisés, durante anos, acerca do Deus dos hebreus. Talvez muitos povos e cidades tivessem ouvido algo a respeito daquele grande Deus, mas sem adorá-lo ou sem confiar nele. Contudo, veja o que Jetro comenta depois de saber das pragas do Egito: “Agora , sei que o Senhor é maior que todos os deuses, porque livrou este povo de debaixo da mão dos egípcios, quando agiram arrogantemente contra o povo” (Êx 18.11). Jetro era um grande sacerdote de um povo estrangeiro — qualificado, portanto, para avaliar assuntos religiosos (Êx 18.1).

Hoje, ao ler a história de Moisés e seu confronto com o Egito, pode parecer que este fosse apenas mais um império opressor que abusava dos escravos. Nos dias de Moisés, sabia-se abertamente que o Egito era um emaranhado de poderes religiosos, econômicos e militares entretecidos com poderes espirituais. Deus desfez o sistema deles para mostrar o que de fato representavam aqueles poderes: um horrendo mal espiritual dedicado a impedir os adoradores de se aproximar de Deus. O Senhor havia abençoado o Egito, mas este se tornara inimigo de Deus. O “juízo” de Deus em forma de pragas e o milagre no mar Vermelho (Êx 12.12) não devem ser entendidos como mero castigo por más obras. A intervenção de Deus derrubou o mal opressivo para libertar o povo. Por que foram libertados? “Deixa ir o meu povo, para que me sirva.” Deus orquestrara os eventos do Êxodo para que revelassem sua glória, estabelecendo seu nome universalmente . Então, diante dos olhos do mundo, ele trouxe um povo para junto de si, a fim de estabelecer um modo de adoração do qual todas as outras nações pudessem participar.

A conquista de Canaã

A conquista de Canaã deve ser vista sob o mesmo prisma: Deus requisitando para si um povo único e santo que o adore. A essa nação, com seu testemunho, Deus atrairá todos os outros povos para que também o reverenciem e o conheçam.

Justa recompensa

Para o leitor dos dias de hoje, a conquista de Canaã pode parecer uma invasão genocida de terras, em vez de um ato de um Deus amoroso, porém, uma observação mais detalhada das passagens pertinentes nas Escrituras, nos mostrará que Deus ordenou essa conquista com um duplo propósito. O primeiro propósito era a justa recompensa pela “maldade” dos povos da terra (Dt 9.5). Muito antes disso, Deus dissera a Abraão: “Não se encheu ainda a medida da iniquidade dos amorreus” (Gn 15.16). Deus permitiu que o pecado fosse praticado. Talvez questionemos como os cananeus se sentiram diante da ira de Deus. A Bíblia registra a declaração de um rei cananeu sobre a conquista, em que reconhece a justa execução do juízo divino: “Assim como eu fiz, assim Deus me pagou” ( Jz 1.7).

Destruindo a falsa adoração

O segundo propósito e a principal razão para a ferocidade da conquista hebreia foi esta: Deus estava aniquilando a idolatria a fim de preservar a devoção singular de seu povo e a santidade de seu nome. Quase todas as passagens que descrevem a lógica por trás da expulsão dos povos que viviam na terra declaram este propósito: a idolatria dos cananeus rapidamente desviaria os israelitas “de mim [Deus], para que servissem a outros deuses” (Dt 4.15-24; 6.13- 15; 7.1-8 etc.).

Josué e Moisés apresentaram o mesmo motivo para a violência da conquista: era, em seu âmago, o banimento da falsa adoração. Deus ordenara a destruição para que “não façais menção dos nomes de seus deuses, nem por eles façais jurar, nem os sirvais, nem os adoreis” (Js 23.7). Embora haja dificuldades para compreender plenamente essa parte da história do povo de Deus, uma coisa é clara a respeito da conquista: ela ocorreu por causa da adoração. O objetivo de Deus não era que Israel fosse o único povo a adorá-lo. Seu alvo era assegurar que ele seria o único Deus a quem o povo cultuasse.

A idolatria profana o nome de Deus

Hoje, a idolatria não parece ameaçar a maioria dos crentes. Dos Dez Mandamentos, os quatro primeiros podem ser mistificados por nós ou até nos entediar. Por que Deus é tão ferozmente zeloso em relação à idolatria? Quando não se percebe os propósitos globais de Deus para a sua glória, pode parecer que ele está apenas aflito por causa de um mau hábito primitivo.

Entretanto, vejamos a idolatria do ponto de vista de Deus. Ele distinguiu seu nome muito acima de qualquer outro nome. Qualquer tipo de idolatria, na verdade, profanaria (isto é, tornaria comum) o nome de Deus, o mesmo nome que ele acabara de destacar e declarar a todo o mundo.

Considere outra vez a conquista. A questão da invasão não era que Israel merecia o território de outros. Deus havia deixado claro a Israel que não fora por conta da própria justiça ou grande nobreza que se tornara um povo especial e favorecido (Dt 7.6,7). Repetidas vezes Deus ameaçou destruir a Israel, caso seu povo desviasse a adoração ao Senhor para outros deuses.

O registro deixa claro que, em várias ocasiões, o povo hebreu ficou próximo da destruição. Por quê? Deus não o havia amado e salvado de modo especial? Apesar de todo amor que prometera aos descendentes de Abraão, Deus estava trabalhando para ser glorificado. Ele não se importava em adiar seus planos para trabalhar com outra geração. O alvo, em cada etapa, era que o povo o adorasse e testemunhasse de sua glória.

Um exemplo torna esse propósito de Deus bem claro: a rebelião em Cades-Barneia. Israel seguira por um caminho que o Senhor mesmo abriu e estava às portas do cumprimento dos propósitos divinos. Os espias foram enviados para reconhecer a terra e seus habitantes. Dez dos espias amedrontaram o povo de Israel, deflagrando uma rebelião histérica pela autopreservação (Nm 13.17—14.10). Deus estava prestes a destruir todo o povo e recomeçar tudo com Moisés, fazendo dele outro povo “maior e mais forte” que os hebreus. O problema não era que eles haviam feito algo ruim o bastante para despertar a ira de Deus, mas que Deus exigia, para seus propósitos, que a nação pelo menos cresse nele.

De fato, Moisés argumenta com Deus, apresentando as mesmas razões alegadas num incidente anterior (Êx 32.1-14): as nações estavam observando tudo. Elas tinha ouvido algo acerca do nome de Deus, que estaria comprometido caso levasse adiante o que pretendia fazer: “Se matares este povo [...] as gentes, pois, que, antes, ouviram a tua fama, dirão: Não podendo o Senhor fazer entrar este povo na terra que lhe prometeu com juramento, os matou no deserto”. Moisés lembra a Deus de que as nações concluirão que o Deus hebreu é fraco: sabe começar, mas não terminar (Nm 14.15,16).

Então, Moisés pede a Deus que engrandeça a si mesmo segundo o que ele mesmo dissera de seu nome: “O Senhor é longânimo e grande em misericórdia, que perdoa a iniquidade e a transgressão…”. Os céus se calam, e então Deus diz que já havia perdoado Israel conforme a oração de Moisés. Nesse instante, Deus ergue a voz, usando, suponho, algumas das expressões mais fortes possíveis: “Tão certo como eu vivo, e como toda a terra se encherá da glória do Senhor […] nenhum deles verá a terra…” (Nm 14.17-23).

O que Deus está dizendo? Que ele continuaria a usar a nação, mas esperaria por outra geração. Embora ele estivesse adiando seus planos, Deus permanecia resoluto em cumprir seu propósito na terra: encher a terra com “a glória do Senhor”. Para cumprir esse propósito, era necessário um povo obediente tanto na adoração quanto no testemunho.

O templo

Talvez a primeira menção clara a respeito do templo tenha sido feita nas planícies de Moabe, antes que Josué levasse o povo terra adentro. Moisés transmite as instruções de Deus: destruir “por completo todos os lugares onde as nações [...] serviram aos seus deuses”. Em vez de reformar os antigos lugares de adoração, os altares precisavam ser completamente destruídos a fim de apagar “o seu nome daquele lugar” (Dt 12.2-14; cf. esp. v. 5).

Considere a declaração de propósito de Deus para o templo: “... para ali pôr o seu nome e sua habitação”. Deus queria fazer duas coisas nesse lugar especial. Ele queria se revelar pelo “seu nome”. Primeira: seria um lugar de revelação onde os adoradores continuamente exaltariam seu caráter e pronunciariam as histórias e as canções sobre suas obras. Segunda: Deus desejava um lugar de encontro, de relacionamento, de habitação. Desde a primeira menção de um tabernáculo, Deus expressou o desejo de uma proximidade exaltada com seu povo: “Farão um santuário, para que eu possa habitar no meio deles” (Êx 25.8). Habitar é uma questão relacional. É a adoração consumada. É Deus achegando-se ao seu povo, e este, ao seu Deus. Salomão sabia que o templo não era o domicílio de Deus. Ao dedicar a fabulosa estrutura, ele orou: “Habitaria Deus com os homens na terra? Eis que os céus e até o céu dos céus não te podem conter, quanto menos esta casa que eu edifiquei” (2Cr 6.18).

Davi havia projetado o templo como um lugar para o povo se aproximar de Deus em atitude de louvor. Salomão instalou os coros e os músicos sacerdotais que seu pai havia planejado. Eles deviam continuamente louvar e glorificar ao Senhor com algumas das canções davídicas e, sem dúvida, o hino dedicatório encontrado em 1Crônicas 16.23-33 (outra versão do salmo 96, já mencionado), que convoca todas as “famílias dos povos” a adorar a Deus (v. 28).

De acordo com a dedicação de Salomão, a Casa de Deus devia ser o lugar em que o Senhor veria, ouviria e responderia ao seu povo. A casa, porém, não era excusiva de Israel. Salomão faz menção especial dos “povos”. Ele sabia que o propósito de Deus para o templo era receber, em adoração, todas as nações.

Salomão conhecia a história até esse ponto. Deus havia se tornado grandemente conhecido. Pessoas de outras nações viriam para conhecer pessoalmente o Deus de Israel. Veja a espantosa oração de Salomão:

Também ao estrangeiro, que não for do teu povo de Israel, porém vier de terras remotas, por amor do teu nome (porque ouvirão do teu grande nome, e da tua mão poderosa, e do teu braço estendido), e orar, voltado para esta casa, ouve tu nos céus, lugar da tua habitação, e faze tudo o que o estrangeiro te pedir, a fim de que todos os povos da terra conheçam o teu nome, para te temerem como o teu povo de Israel e para saberem que esta casa, que eu edifiquei, é chamada pelo teu nome (1Rs 8.41-43).

Salomão orou não para que apenas alguns indivíduos viessem, e sim muitos, de todos os povos. Salomão orou para que as nações encontrassem a Deus quando viessem à sua casa para orar e adorar. Ele não pediu que os gentios conhecessem a Deus à maneira gentia, mas que o conhecessem da mesma forma em que Israel o conhecia. Salomão previu que todos os povos se uniriam a Israel no mesmo tipo de caminhada humilde, alegre e plena de adoração a Deus que Israel desfrutava — o temor do Senhor.

As nações começam a chegar

Será que a fama de Deus se espalhou pelo mundo? Será que os estrangeiros acorreram à Casa de Deus para aprender o temor do Senhor? Será que Deus respondeu à oração de Salomão? A melhor resposta é sim, e também não.

O registro mostra que, pouco tempo depois de o templo ser construído (1Rs 9.25), a rainha de Sabá soube da “fama de Salomão, com respeito ao nome do Senhor” (10.1). Ela veio para aprender, mas também ouvira falar da sabedoria de Salomão (v. 8), e voltou para casa com o conhecimento do Deus que guarda sua aliança e “ama a Israel para sempre”. Apenas como um potentado real pode ver, ela percebeu que o próprio Deus havia estabelecido o poder de Salomão e a esperança de que, por meio da soberania divina, pudesse haver “juízo e justiça” (v. 9).

Será que foi um caso isolado? Aparentemente, não. Mais adiante, está escrito: “Todo o mundo procurava ir ter com ele para ouvir a sabedoria que Deus lhe pusera no coração” (v. 24). O mundo não honrou Salomão por ser inteligente ou perito em questões judiciais. O mundo reconheceu que o próprio Deus pusera sabedoria no coração daquele homem. E qual foi a primeira lição de sabedoria que Salomão divulgou ao mundo? “O temor do Senhor é o princípio do saber [conhecimento]” (Pv 1.7). Salomão estava iniciando o mundo tanto na adoração ao Senhor quanto na vida de sabedoria sob a maestria de Deus.

Os propósitos de Deus pareciam cumprirse. Seu nome era engrandecido. Israel o tornava notório de modo que as nações começaram a chegar para conhecer a Deus pessoalmente. O que poderia ter atrasado o plano de Deus de atrair todas as nações para si? Apenas uma coisa, a questão sobre a qual Deus advertira seu povo mais severamente: a idolatria.

De todos os horrores possíveis, provavelmente o pior aconteceu — o próprio Salomão abriu caminho para a grotesca idolatria. Foi uma das mais amargas ironias da História. Imagine a profunda esperança, as riquezas e os desejos das nações voltados para Israel. Salomão consagrara o templo com um espetáculo inimaginável de glória. Ele encerrou o evento com uma bênção de propósito sobre o edifício e a nação: “... para que todos os povos da terra saibam que o Senhor é Deus e que não há outro” (1Rs 8.60).

Então, apenas três capítulos depois dessa gloriosa inauguração, que abriu as portas às nações para conhecerem e temerem, pelo nome, ao único Deus, o coração de Salomão foi levado a “seguir outros deuses”. Ele chegou a construir santuários à vista do monte santo de Deus (1Rs 11.1-8). Qualquer leitor que creia na veracidade desses versículos se decepcionará a ponto de sentir náusea. É difícil não especular sobre o que poderia ter acontecido se a adoração se tivesse mantido pura e firme por apenas mais uma geração.

A persistência de Deus

O plano de Deus era simples: Deus engrandeceria seu nome, e então Israel tornaria o nome do Senhor conhecido. Ele sempre quis destacar seu nome sobre todos os outros deuses e, assim, receber adoração das nações à luz do nome revelado por meio do testemunho do povo de Israel.

A História, a partir desse ponto, passa a registrar uma luta prolongada, cheia de altos e baixos, contra a idolatria. Vários episódios reavivam a fidelidade na adoração a Deus, mas são seguidos por vertiginosas recaídas de profanação do santo nome. A questão mais importante, ao longo das gerações, é a glória de Deus na adoração de Israel. Às vezes, o povo desprezava a adoração a Deus de tal modo que se passavam gerações sem a menor atenção ao simples regime pelo qual Deus convidara Israel a se encontrar com ele (os mandamentos sobre culto nos livros de Moisés). As palavras de alguns profetas mostram que, mesmo quando os padrões de adoração eram seguidos, quase sempre o culto era superficial. Os profetas denunciaram a adoração perfunctória, desmascarando a perversa carência de justiça e de bondade que deviam florescer por trás de todo sacrifício e de toda oração a Deus (Is 1.11-15; Am 5.21- 24; Mq 6.6-8). Embora Deus tivesse adiado o grande abalo de Israel e de Judá, ele acabou separando da terra o povo que devia servir de vitrine da bênção de Deus. O povo foi exilado em terras longínquas, e — a maior das tragédias — a Casa de Deus foi queimada e reduzida a escombros.

Perto do final do exílio, Daniel clamou a Deus para que cumprisse a promessa de restaurar o templo e o povo. Daniel estava ciente de toda a saga, de como o Senhor havia tirado seu povo da terra do Egito com mão poderosa para fazer para si um nome que permanecia até então (Dn 9.15). A preocupação preponderante de Daniel era que as ruínas da glória, que se queria demonstrar no monte do templo, em Jerusalém, continuavam a ser uma mancha na glória de Deus “para todos os que estão em redor de nós”. Daniel orava para que Deus restaurasse o povo e a cidade, a fim de que a glória de seu nome fosse restaurada. Daniel não baseava seu pedido na suposta grandeza de Israel: “Não te retardes, por amor de ti mesmo, ó Deus meu; porque a tua cidade e o teu povo são chamados pelo teu nome” (Dn 9.16-19).

Ezequiel, contemporâneo de Daniel, expressou os mesmos temas. Deus havia contido sua ira em várias ocasiões para não destruir Israel, mas a paciência de Deus fora “por amor do meu nome” (Ez 20.5-22). O tratamento dispensado por Deus a Israel não era motivado por algum favoritismo doentio, mas apenas por causa da glória divina entre as nações:

Dize, portanto, à casa de Israel: Assim diz o Senhor Deus: Não é por amor de vós que eu faço isto, ó casa de Israel, mas pelo meu santo nome, que profanastes entre as nações para onde fostes. Vindicarei a santidade do meu grande nome, que foi profanado entre as nações, o qual profanastes no meio delas; as nações saberão que eu sou o Senhor (Ez 36.22,23).

O destino de Israel: a glória de todas as nações

Daniel e Ezequiel não foram os únicos profetas a verem que o foco da história de Israel incidia sobre o nome e a glória de Deus. Outros profetas e salmistas falaram da história e do destino de Israel como sendo o de atrair as nações para o nome de Deus, a fim de que o adorassem com diversidade e grande glória:

Aclamai a Deus, toda a terra. Salmodiai a glória do seu nome, dai glória ao seu louvor.

Dizei a Deus: Que tremendos são os teus feitos! Pela grandeza do teu poder, a ti se mostram submissos os teus inimigos. Prostra-se toda a terra perante ti, canta salmos a ti; salmodia o teu nome (Sl 66.1-4).

Render-te-ão graças, ó Senhor, todos os reis da terra, quando ouvirem as palavras da tua boca, e cantarão os caminhos do Senhor, pois grande é a glória do Senhor (Sl 138.45).

Darei lábios puros aos povos, para que todos invoquem o nome do Senhor e o sirvam de comum acordo. Dalém dos rios da Etiópia, os meus adoradores, que constituem a filha da minha dispersão, me trarão sacrifícios (Sf 3.9,10).

Desde o nascente do sol até ao poente, é grande entre as nações o meu nome; e em todo lugar lhe é queimado incenso e trazidas ofertas puras, porque o meu nome é grande entre as nações, diz o Senhor dos Exércitos (Ml 1.11).

Estas são apenas amostras das muitas palavras proféticas que vinculavam a identidade de Israel à culminação dos propósitos de Deus: a glória de Deus na terra atraindo a adoração de todos os povos. Quando o povo de Deus finalmente foi levado de volta à sua terra, construir o templo foi a grande prioridade. Ageu deixou claro que o templo era para a glória de Deus, e para uma glória como jamais houvera antes. “Farei abalar todas as nações, e as coisas preciosas de todas as nações virão, e encherei de glória esta casa” (Ag 2.7; 1.8). A partir do exílio, Israel evitou a idolatria, porém, a pequena glória nacional que desejavam nunca surgiu. Eles esperavam por um libertador messiânico que os livrasse da opressão. Quase não perceberam o Messias quando ele veio porque a visão que Jesus tinha da redenção era que o Reino de Deus fosse concretizado entre todos os povos.

A glória de Deus em Cristo

Com Cristo, a história da glória de Deus chega ao seu clímax. No final de todas as coisas, ele terá comprado e reunido pessoas de todas as tribos e línguas para honrar o Pai. Não surpreende, então, ver como cada passo seu foi dado para impulsionar a história da glória de Deus rumo à sua culminação entre todas as nações.

Jesus resumiu seu ministério ao esforço por glorificar universalmente o Pai: “Eu te glorifiquei na terra, consumando a obra que me confiaste para fazer”. E que obra foi essa? “Manifestei o teu nome aos homens que me deste do mundo” ( Jo 17.4,6).

Santificado seja o teu nome

A oração que Jesus ensinou aos discípulos pode ser mal compreendida por causa de sua tradução: “Santificado seja o teu nome”. Essa oração não é uma afirmação de louvor. É explicitamente um pedido na língua original: “Pai, santifica o teu nome!”. Parafraseando: “Pai, eleva, destaca, exalta, manifesta e revela o teu nome aos povos da terra. Torna-te notório por quem tu és. Faze com que os povos da terra o conheçam e o adorem”. A oração pode ser mais bem expressada na dimensão global que Jesus ensinou: “... assim na terra como no céu”. Não há dúvida quanto à primazia dessa oração para todos os crentes. É necessário compreendê-la. Não há dúvida de que Jesus está ensinando a Igreja a orar pelo cumprimento dos antigos propósitos revelados na lei, na história, nas canções e nas profecias de Israel para a glória de Deus.

Num encontro revelador com a mulher samaritana (uma não-judia), Jesus declarou o futuro de Deus para ela e para as outras nações: “Vem a hora e já chegou, em que os verdadeiros adoradores adorarão o Pai em espírito e em verdade; porque são estes que o Pai procura para seus adoradores” ( Jo 4.23).

Uma casa de adoração para todos os povos

Em sua hora mais pública e em seu momento mais intenso, Jesus tornou manifesta a questão da adoração das nações. Ele purificou o templo do comercialismo religioso, que constituía uma barreira ao ingresso das nações à presença de Deus. Ele citou Isaías 56.7: “A minha casa será chamada Casa de Oração para todos os povos”. Os líderes religiosos que o ouviram imediatamente se lembraram do restante da passagem que Jesus estava citando, e Jesus pretendia que eles ouvissem tudo:

Aos estrangeiros que se chegam ao Senhor, para o servirem e para amarem o nome do

Senhor, sendo deste modo servos seus, sim, todos os que guardam o sábado, não o profanando, e abraçam a minha aliança, também os levarei ao meu santo monte e os alegrarei na minha Casa de Oração; os seus holocaustos e os seus sacrifícios serão aceitos no meu altar, porque a minha casa será chamada Casa de Oração para todos os povos (Is 56.6,7).

Logo antes de ir ao encontro da morte, Jesus mostrou o propósito de sua vida e de sua morte vindoura ( Jo 12.24-32). Abertamente, ele considerou a opção de pedir ao Pai que o livrasse da morte: “Agora, está angustiada a minha alma, e que direi eu? Pai, salva-me desta hora?”. Em vez de pedir um escape, todavia, ele declarou: “Precisamente com este propósito vim para esta hora”. Que propósito era esse? O que salta de seu coração na frase seguinte e se torna a oração de sua morte e de sua vida: “Pai, glorifica o teu nome”. Para espanto dos que estavam ao seu redor, o próprio Deus Pai respondeu dos céus a Jesus: “Eu já o glorifiquei e ainda o glorificarei”. A resposta de Deus ainda troveja, se você puder ouvir. É a resposta de Deus a qualquer um que entregue sua vida ao Pai para glorifi - car ainda mais o nome dele. Jesus disse que a resposta não viera para ele, mas para seus seguidores, que chegariam a idênticos momentos de escolher segui-lo (v. 30) de acordo com o antigo propósito de Deus. Como é que a morte de Jesus glorificaria a Deus? “Eu, quando for levantado da terra, atrairei todos a mim mesmo” (v. 32).

Um ministério de excelsa glória com Paulo

Paulo viu sua vida como a continuação do antigo propósito, rumo ao fluir imenso de adoração obediente de todas as nações. Sua mais precisa declaração de missão e propósito era, por meio dele, “receber graça [...] por amor do seu nome, para a obediência por fé, entre todos os gentios” (Rm 1.5, ênfase minha). Paulo via todo o mundo dividido em duas categorias: onde Cristo era conhecido por “nome” e onde ainda não o era. Paulo resolutamente dirigia seus esforços de modo a trabalhar onde Cristo não era conhecido pelo nome (Rm 15.20).

Podemos ver a via dupla da glória de Deus no ministério de Paulo. Ele trabalhava para glorificar a Deus ao revelar Cristo às nações, tornando Cristo conhecido, porém seu maior zelo, o orgulho de sua alma, estava naquilo que retornaria a Deus das nações. “… por causa da graça que me foi outorgada por Deus, para que eu seja ministro de Cristo Jesus entre os gentios, no sagrado [sacerdotal] encargo de anunciar o

[cite] 4 4 V. John Davis, Moses and the Gods of Egypt (Grand Rapids: Baker, 1971). 5 6 5 Deus apresentou um sumário da abrangência de seu nome no Sinai (Êx 33.19; 34.6-8). São boas novas numa cápsula sobre como Deus age com as pessoas. É uma afirmação muito significativa e reconhecida pelas gerações posteriores de Israel como um resumo do que devia ser proclamado entre as nações (Sl 86.9-15; 145.1,2,8-12,21). O próprio Jonas reconheceu esse pacote de verdades como algo que ele sabia e que reteve dos ninivitas ( Jn 3.9—4.2). 6 Não considere a pergunta de Salomão sobre Deus habitar com a humanidade na terra uma expressão de desespero, como se Deus nunca o fizesse. A oração dele não pretendia ser um mapa definitivo do cosmos. Antes, ela se encaixa na aproximação humilde do Altíssimo. Salomão prossegue com um apelo de profunda humildade, no linguajar judicial mais formal, que o Rei de toda a terra se rebaixaria a voltar os olhos para o lugar de encontro e ouvir o povo, como prometera (2Cr 6.19-21). Ver 2Cr 6.1,2, em que Salomão reconhece a nuvem da glória de Deus, que preenchia o templo de tal modo que nenhum sacerdote conseguia suportar o terrível brilho (2Cr 5.13,14). 7 7 Um olhar mais aprofundado ao contexto mostra o que Paulo quer dizer com “conhecer” a Cristo. Não era questão de a mensagem de Cristo ser pregada uma vez por um missionário, e sim de assentar um “fundamento” (Rm 15.20). Antes disso, Paulo mencionou regiões específicas onde o evangelho estava sendo “divulgado” (Rm 15.19). Traduções como “pregar plenamente” ou “proclamar plenamente” enfatizam a transferência cognitiva da informação do evangelho de forma muito ambiciosa, especialmente à luz do cardápio completo de atividades evangelísticas dos v. 18 e 19. À luz do conceito paulino de “fundamento” (alicerce) em outros lugares (especificamente, 1Co 3.8-15), concluo que Cristo é “conhecido” quando há um movimento crescente e estabelecido de obediência a ele que tem potencial comprovado de articular e demonstrar a vida de Cristo à comunidade como um todo. Isso é o que muitos considerariam uma igreja.

adoradores adorarão o Pai em espírito e em verdade; porque são estes que o Pai procura para seus adoradores” ( Jo 4.23).

Uma casa de adoração para todos os povos

Em sua hora mais pública e em seu momento mais intenso, Jesus tornou manifesta a questão da adoração das nações. Ele purificou o templo do comercialismo religioso, que constituía uma barreira ao ingresso das nações à presença de Deus. Ele citou Isaías 56.7: “A minha casa será chamada Casa de Oração para todos os povos”. Os líderes religiosos que o ouviram imediatamente se lembraram do restante da passagem que Jesus estava citando, e Jesus pretendia que eles ouvissem tudo:

Aos estrangeiros que se chegam ao Senhor, para o servirem e para amarem o nome do

Senhor, sendo deste modo servos seus, sim, todos os que guardam o sábado, não o profanando, e abraçam a minha aliança, também os levarei ao meu santo monte e os alegrarei na minha Casa de Oração; os seus holocaustos e os seus sacrifícios serão aceitos no meu altar, porque a minha casa será chamada Casa de Oração para todos os povos (Is 56.6,7).

Logo antes de ir ao encontro da morte, Jesus mostrou o propósito de sua vida e de sua morte vindoura ( Jo 12.24-32). Abertamente, ele considerou a opção de pedir ao Pai que o livrasse da morte: “Agora, está angustiada a minha alma, e que direi eu? Pai, salva-me desta hora?”. Em vez de pedir um escape, todavia, ele declarou: “Precisamente com este propósito vim para esta hora”. Que propósito era esse? O que salta de seu coração na frase seguinte e se torna a oração de sua morte e de sua vida: “Pai, glorifica o teu nome”. Para espanto dos que estavam ao seu redor, o próprio Deus Pai respondeu dos céus a Jesus: “Eu já o glorifiquei e ainda o glorificarei”. A resposta de Deus ainda troveja, se você puder ouvir. É a resposta de Deus a qualquer um que entregue sua vida ao Pai para glorifi - car ainda mais o nome dele. Jesus disse que a resposta não viera para ele, mas para seus seguidores, que chegariam a idênticos momentos de escolher segui-lo (v. 30) de acordo com o antigo propósito de Deus. Como é que a morte de Jesus glorificaria a Deus? “Eu, quando for levantado da terra, atrairei todos a mim mesmo” (v. 32).

Um ministério de excelsa glória com Paulo

Paulo viu sua vida como a continuação do antigo propósito, rumo ao fluir imenso de adoração obediente de todas as nações. Sua mais precisa declaração de missão e propósito era, por meio dele, “receber graça [...] por amor do seu nome, para a obediência por fé, entre todos os gentios” (Rm 1.5, ênfase minha). Paulo via todo o mundo dividido em duas categorias: onde Cristo era conhecido por “nome” e onde ainda não o era. Paulo resolutamente dirigia seus esforços de modo a trabalhar onde Cristo não era conhecido pelo nome (Rm 15.20).

Podemos ver a via dupla da glória de Deus no ministério de Paulo. Ele trabalhava para glorificar a Deus ao revelar Cristo às nações, tornando Cristo conhecido, porém seu maior zelo, o orgulho de sua alma, estava naquilo que retornaria a Deus das nações. “… por causa da graça que me foi outorgada por Deus, para que eu seja ministro de Cristo Jesus entre os gentios, no sagrado [sacerdotal] encargo de anunciar o evangelho de Deus, de modo que a oferta deles seja aceitável, uma vez santificada pelo Espírito Santo. Tenho, pois, motivo de gloriar-me em Cristo Jesus nas coisas concernentes a Deus” (Rm 15.15-17).

A apaixonada ambição de Paulo por “proclamar o evangelho” baseava-se na comissão muito mais fundamental (ou, em sua língua, uma “graça que [lhe] foi outorgada por Deus”), o “sacerdócio do evangelho”. Não há como ignorar a ilustração. Paulo vê a si mesmo diante de Deus, servindo as nações como se fosse um sacerdote, instruindo-as e levando-as para perto de Deus, ajudando-as a trazer a glória de suas nações ao Senhor para o prazer dele. O trabalho de Paulo não era mudar sociedades e culturas. O Espírito de Deus estava operando para transformar e santificar a melhor demonstração possível de glória dos povos.

Paulo pagou caro, trabalhando com uma brilhante visão à sua frente. Era algo pelo qual ele sabia que valia a pena trabalhar e esperar. “A uma voz”, uma gama de crentes, judeus e gentios, fracos e fortes juntamente glorificarão “ao Deus e Pai de nosso Senhor Jesus Cristo” (Rm 15.6).

Um ensaio para a glória eterna

No fim da História, iremos nos maravilhar ao ver como o abundante amor de Deus se cumpriu. Seu amor terá triunfado ao conquistar, de todos os povos, apaixonada devoção. Jesus, então, terá cumprido plenamente a promessa que fez ao Pai: “Eu lhes fiz conhecer o teu nome [...] a fim de que o amor com que me amaste esteja neles ” ( Jo 17.26).

Muito além da história, descobriremos que todo culto de adoração dos muitos povos, ao longo de gerações, foram ensaios para declarações ainda maiores de amor e de glória, ainda envolvendo a glória beatificada de todas as nações.

Os céus encherão a terra: “Eis o tabernáculo de Deus com os homens. Deus habitará com eles. Eles serão povos de Deus, e Deus mesmo estará com eles” (Ap 21.3).

Os povos irão perdurar para sempre. A cidade, que é o céu na terra, será adornada por reis dos muitos povos, que trarão continuamente tesouros e frutos das nações ao trono de Deus (Ap 21.22-26). Nós o serviremos, assombrados e honrados, por termos o nome dele gravado na fronte. Contemplando seu rosto, nós o serviremos como sacerdotes amados (v. 1-5).

Para que serve um mundo evangelizado?

Até agora, clamamos: “Que a terra ouça sua voz!”. Que nós nunca deixemos de proclamar sua palavra a toda criatura. Contudo, logo chegará o dia em que, por todos os cálculos, a terra terá ouvido. E depois?

Há outro clamor, muito mais antigo. É um brado pelo destino da terra. Deve ser erguido hoje mais do que nunca: “Louvem-te os povos, ó Deus” (Sl 67.3-5). Mesmo agora, ouvimos um crescente louvor das nações. Concentremos então nossas mais profundas afeições e ousados planos para ver o esplendor de cada povo amando a Deus com o melhor de sua sociedade santificada. Que esperança magnífica!

MUDANÇAS NA PRÁTICA

A ênfase na glória de Deus é muito mais que uma flor decorativa na Grande Comissão. Mais do que nunca, devemos trabalhar juntos e com igual paixão para que Cristo seja conhecido por nome e louvado em todos os povos. Uma visão “doxológica” (relativa à glória) da evangelização mundial oferece sabedoria prática essencial para o cumprimento da tarefa restante. Adentrar a história de sua glória nos ajudará de três maneiras práticas:

1. Aprofundando nossa moti vação básica no amor pela glória de Deus

A evangelização mundial é para Deus. É comum trabalharmos com base na preocupação pela situação dos povos — ou para vê-los salvos do inferno, ou para vê-los partilhar de integridade comunitária, ou ambos. Tal compaixão é bíblica e necessária. Contudo, nosso amor pelo ser humano se equilibra e fortalece quando nossa impetuosa paixão é ver Deus honrado pela bondade estendida em seu nome e ver Deus receber ações de graças de povos transformados pelo poder do evangelho.

Jesus se comoveu com abundante compaixão ao ver as multidões como ovelhas abandonadas, mas ele não atendeu apenas à necessidade nua e crua delas. Deliberadamente, reformulou sua visão das mesmas multidões perdidas com outra metáfora. Em vez de ovelhas dispersas, viuas como algo precioso para Deus: uma “seara”. Quem pode compreender o prazer de Deus na plenitude dos frutos que recebe da vida das pessoas? Jesus começou exatamente isso. Olhando dessa perspectiva, ele implorou ao Senhor da seara que enviasse mais trabalhadores para levar a Deus sua colheita (Mt 9.35-38). Jesus sabia que, nos caminhos de Deus, o voluntariado tem pouco valor. Algo que tenha poder duradouro vem do autêntico “envio” de Deus. A compaixão flui como um rio daquele que é realmente enviado.

Esforços missionários que extraem sua motivação de uma reação compassiva à situação do homem não conseguem realizar tanto. Os apelos à culpa, aos cuidados pelos necessitados e perdidos continuam a amolecer, por pouco tempo, nosso coração. Na prática, porém, eles exaurem e endurecem os crentes até uma demonstração mínima de obediência. É preciso realizar o trabalho difícil e caro. Tal trabalho não se sustenta com o zelo fugaz e momentâneo gerado pelo clamor das almas desesperadas e condenadas. O propósito universal de Deus é uma questão antiga, muito mais que uma necessidade urgente. Agora, mais do que nunca, os crentes precisam cultivar um profundo zelo pela glória de Deus. Assim, confiantes de que Deus cumprirá sua promessa, seremos profundamente tocados pelas necessidades alheias e agiremos com intrepidez pelo propósito de Deus.

2. Definindo a tarefa como um acréscimo à glória de Deus

Nunca houve época em que os crentes se ocuparam tanto em alcançar todos os povos da terra. Levar em conta as etnias e suas culturas ajuda a planejar a comunicação eficaz do evangelho a cada cultura. A abordagem étnica parece útil para avaliar o progresso e designar tarefas diferentes para a colaboração eficaz.

Mesmo assim, a abordagem étnica é sempre uma questão delicada. É comum a acusação de que ela desintegra a unidade das igrejas ou acoberta atitudes obstinadas de dominação colonial pelo Ocidente. Em tempos recentes, alguns discretamente abandonaram a abordagem étnica a favor de paradigmas que parecem mais viáveis. Embora os Estados possam se desintegrar da noite para o dia, nos povos competidores que as compreendem, abordagens evangelísticas país a país ainda se mostram atraentes. Outras abordagens geográficas vão desde a demarcarcação de centros urbanos até o traçado de janelas, longitude e latitude e o mapeamento de forças espirituais posicionadas contra o evangelho. É claro, os povos da terra são entidades geográfi - cas, urbanizadas e nacionalizadas. Precisamos levar em consideração essas dimensões como fatores importantes para tecer abordagens úteis a qualquer povo. Nosso objetivo não pode ser reduzido à mera tentativa de causar “impacto” aos “alvos”. Precisamos pensar além do encontro com o evangelho. Precisamos desejar ver como resultado uma adoração obediente a Deus.

Proponho, como o mais importante, não a abordagem étnica, e sim o resultado étnico. Qual o resultado do evangelho? Certamente, algo mais que uma chance de cada pessoa dar um veredicto acerca da mensagem. Deus prometeu que obterá glória obediente para si de toda tribo e língua. Ele anseia pelo singular derramamento de amor, de justiça, de sabedoria e de adoração que só pode vir de todos os povos. Esse seria o melhor motivo para plantar igrejas autóctones. Assim se elevará a maravilha peculiar de cada etnia e, ao mesmo tempo, se realçará o valor de estender o impacto do evangelho a todos os lugares. A geografia se torna, então, ainda mais importante. Cada cidade e lugar adquire maior significado como a praça da singular demonstração do Reino de Deus.

3. Somando esforços para a glória de Deus

A dicotomia, obviamente falsa, entre evangelismo e ação social pode ser deixada de lado pela abordagem doxológica. Argumenta-se em torno do que é mais importante: salvar uma alma ou curar uma comunidade? A pergunta é igualmente repugnante a todos. A resposta mais comum são generalizações vagas com a sugestão de se tratar o assunto como uma questão de “tanto quanto” em vez de “isto ou aquilo”. Talvez possamos melhorar. E se as questões forem resolutamente examinadas e abraçadas pelos que proclamam o nome de Deus?

A glória chega a Deus pela proclamação do evangelho ou por uma ação praticada em seu nome. A glória maior ressoa quando comunidades inteiras conseguem ver a mão de Deus transformando vidas.

Alguns, inutilmente, propõem um duplo mandato, de modo a obter um ponto de equilíbrio. A chamada ordem cultural de encher a terra tem como contraponto a ordem de evangelizar o mundo. Não há um único propósito de que todos os povos prestem culto a Deus em todos os lugares da terra? O culto das nações precisa ser uma vida de completa obediência em justiça e retidão. Os sacrifícios de adoração, que agora devem ser levados a Deus por meio de Jesus, são tanto palavras quanto obras.

Na perspectiva da glória de Deus jaz a substância da verdadeira unidade entre as igrejas. Em nosso zelo pela glória singular a ser conferida a Deus por todos os povos, podemos facilmente deixar de lado exigências de uniformidade de adoração e de conduta. Podemos nos alegrar na variedade de estilos de justiça, de paz e de alegria, enquanto crescemos no zelo pela verdade singular confessada por todos na pessoa de Cristo.

Perguntas para estudo

1.Como a oração para que Deus santifique seu nome funciona no cumprimento de um antigo

propósito do Senhor?

2.Explique como o cumprimento da Grande Comissão resultará na adoração por parte “de to-

dos os povos”.

3.Explique como a adoração revela a glória de Deus tanto quanto permite que ele realize ple-

namente seu amor pela Humanidade.

4.Hawthorne diz que a história da Bíblia está voltada tanto para o conhecimento quanto para

a adoração a Deus. Critique sua tese. Há uma história coerente ao longo da Bíblia? A glória

de Deus é o tema supremo? Que outras opções existem?

[cite] 7 7 Um olhar mais aprofundado ao contexto mostra o que Paulo quer dizer com “conhecer” a Cristo. Não era questão de a mensagem de Cristo ser pregada uma vez por um missionário, e sim de assentar um “fundamento” (Rm 15.20). Antes disso, Paulo mencionou regiões específicas onde o evangelho estava sendo “divulgado” (Rm 15.19). Traduções como “pregar plenamente” ou “proclamar plenamente” enfatizam a transferência cognitiva da informação do evangelho de forma muito ambiciosa, especialmente à luz do cardápio completo de atividades evangelísticas dos v. 18 e 19. À luz do conceito paulino de “fundamento” (alicerce) em outros lugares (especificamente, 1Co 3.8-15), concluo que Cristo é “conhecido” quando há um movimento crescente e estabelecido de obediência a ele que tem potencial comprovado de articular e demonstrar a vida de Cristo à comunidade como um todo. Isso é o que muitos considerariam uma igreja. 8 10 9 8 Paulo usa a ideia de um sacerdote, ativando-a como um verbo a fim de dizer, para todos os efeitos, que está “sacer- dotando” o evangelho. A imagem é a de um sacerdote hebreu cuja principal tarefa é ajudar o povo para apresentar suas ofertas de adoração a Deus. 9 A ideia é “voltado para Deus” como se estivesse num templo. 10 Alguns manuscritos bem aceitos mantêm nessa passagem a palavra “povos”, no plural.$conteudo$, 9);
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

Deus ordenou a cultura. Mas os costumes que glorificam a Deus não são a única realidade que observamos ao nosso redor. Ao invés de amabilidade, criatividade harmoniosa e autoridade admirável, vemos fragmentação, alienação, luxúria, corrupção, egoísmo, injustiça e violência cultivados pela nossa cultura. E nenhuma parte permaneceu pura. A ciência tende a servir o militarismo ou o hedonismo, ignorando a moral. A arte normalmente vira adoração separada de Deus. Meios de comunicação de massa estão cheios de prostitutos verbais. Homens de negócios fazem acordos sombrios. Políticos enchem os próprios bolsos. Trabalhadores fazem serviços de má qualidade. Maridos enganam suas esposas. Esposas manipulam seus maridos. Filhos ignoram seus pais como pessoas .

Não somos apenas criados à imagem de Deus. Também somos pecadores. Porque nós nos separamos de Deus, as culturas que criamos agora estão repletas de maldade. Somos chamados a, então, não apenas nos alegramos nos padrões de sabedoria, beleza e gentileza nas nossas culturas, mas também de confrontarmos e julgarmos os padrões de idolatria e exploração.

Às vezes a etnicidade se torna um ídolo. Como outros ídolos da sociedade moderna - dinheiro, sexo e poder, por exemplo - etnicidade não é ruim em si mesma. Entretanto, quando ela é exaltada como se fosse o bem maior, a etnicidade se torna um mal. Racismo, rixas, guerras e "pureza racial" são o resultado. Quando a etnicidade se torna um ídolo, ela precisa ser confrontada e julgada.

Implicações para a Missão

A etnicidade se opõe à tendência desumanizadora da globalização. Até mesmo em sua melhor expressão, a globalização econômica tende a tratar os valores culturais como mercadorias. A etnicidade nos lembra de guardarmos a fé com nossos avós e com nossas comunidades humanas. É um contrapeso vital. E nesse contexto atual, o que a etnicidade significa para a missão? Vamos sugerir quatro aplicações.

1 . Valorizar o local

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

1 . Como Adeney descreve o valor da etnia? 2. Quando a etnia se torna um ídolo? Como podemos confrontá-lo? 3. Adeney escreve sobre quatro maneiras pelas quais a missão deve abordar a "tendência desumanizadora da globalização". Quais são elas?

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

Deus ordenou a cultura. Mas os costumes que glorificam a Deus não são a única realidade que observamos ao nosso redor. Ao invés de amabilidade, criatividade harmoniosa e autoridade admirável, vemos fragmentação, alienação, luxúria, corrupção, egoísmo, injustiça e violência cultivados pela nossa cultura. E nenhuma parte permaneceu pura. A ciência tende a servir o militarismo ou o hedonismo, ignorando a moral. A arte normalmente vira adoração separada de Deus. Meios de comunicação de massa estão cheios de prostitutos verbais. Homens de negócios fazem acordos sombrios. Políticos enchem os próprios bolsos. Trabalhadores fazem serviços de má qualidade. Maridos enganam suas esposas. Esposas manipulam seus maridos. Filhos ignoram seus pais como pessoas .

Não somos apenas criados à imagem de Deus. Também somos pecadores. Porque nós nos separamos de Deus, as culturas que criamos agora estão repletas de maldade. Somos chamados a, então, não apenas nos alegramos nos padrões de sabedoria, beleza e gentileza nas nossas culturas, mas também de confrontarmos e julgarmos os padrões de idolatria e exploração.

Às vezes a etnicidade se torna um ídolo. Como outros ídolos da sociedade moderna - dinheiro, sexo e poder, por exemplo - etnicidade não é ruim em si mesma. Entretanto, quando ela é exaltada como se fosse o bem maior, a etnicidade se torna um mal. Racismo, rixas, guerras e "pureza racial" são o resultado. Quando a etnicidade se torna um ídolo, ela precisa ser confrontada e julgada.

Implicações para a Missão

A etnicidade se opõe à tendência desumanizadora da globalização. Até mesmo em sua melhor expressão, a globalização econômica tende a tratar os valores culturais como mercadorias. A etnicidade nos lembra de guardarmos a fé com nossos avós e com nossas comunidades humanas. É um contrapeso vital. E nesse contexto atual, o que a etnicidade significa para a missão? Vamos sugerir quatro aplicações.

1 . Valorizar o local

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

1 . Como Adeney descreve o valor da etnia? 2. Quando a etnia se torna um ídolo? Como podemos confrontá-lo? 3. Adeney escreve sobre quatro maneiras pelas quais a missão deve abordar a "tendência desumanizadora da globalização". Quais são elas?

Broom, J. (2008, May). "A New Wing Luke." Seattle Times, p. a16. Castells, M. (1996). The Rise ofthe Networked Society. London, UK: Blackwell Publishers. Friedman, T. L. (1 999). The Lexus and the Olive Tree. New York, NY: Farrar, Straus, Giroux. Geertz, C. (1964). "Ideology as a Cultural System." In D. Apter (Ed.), Ideology and

Discontent (pp. 47-56). New York, NY: Macmillan Publishing Company. Hickerson, M. (2002, Winter). Editor's note. EtCetera: Newsletter of Regent College

Students. Vancouver, British Columbia, Canada. Padilla, R. (1983). "The Unity of the Church and the Homogenous Unit Principle." In W.

Shenk (Ed.), Exploring Church Growth. Grand Rapids, MI: Wm. B. Eerdmans

Publishing Company. Robert, D. (2002, April). "The First Globalization: The Internationalization of the Protestant

Missionary Movement Between the Wars." International Bulletin of Missionary

Research, 26:2, pp. 50-66. Williams, D. (2001 ). Castrating Culture: A Christian Perspective on Ethnic Identity From the

Margins. Cumbria, UK: Paternoster Press.$conteudo$, 10);
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 11) then
    update aulas set titulo = $t$Lição 2 · Leitura — Dearborn: Além do Dever$t$, conteudo = $conteudo$Além do Dever

Tim Dearborn

Tim Dearborn é diretor do Faith and Development Programs for World Vision Internati onal. Anteriormente, atuou como diretor de staff da Visão Mundial – Estados Unidos e professor de teologia na Universidade Seatt le Pacific. Ele também serviu os esquimós e povos das primeiras nações no Alasca e escreveu vários livros sobre espiritualidade, globalização e questões relacionadas à missão. De Beyond Duty, 1997. Usado com permissão da World Vision Inc., Federal Way, WA.

Muitas vezes nos concentramos na pergunta: "O que devemos fazer para obedecer à Grande Comissão, fazer discípulos de todas as nações e apressar o retorno de nosso Senhor?" Esse é o ponto de partida errado, pois nos tranca dentro de uma perspectiva centrada no ser humano. Se começarmos com a orientação centrada no ser humano, continuamente nos sentiremos constrangidos por ter recursos insuficientes – e as tarefas são muito maiores do que possivelmente podemos realizar.

Ao contrário, as prioridades bíblicas refletidas repetidas vezes nas Escrituras nos pedem para começar com estas perguntas:

Quem é o Deus trino?

O que Deus está fazendo no mundo?

Como devemos participar com Deus em seus propósitos redentores?

Em última análise, missões não é uma resposta humana às necessidades humanas. O envolvimento da Igreja na missão é sua participação privilegiada nas ações do Deus trino.

Uma Paixão Singular

A falta de interesse em missões não é fundamentalmente causada pela ausência de compaixão ou compromisso, nem por falta de informação ou exortação. E a falta de interesse em missões não é resolvida por mais estatisticas chocantes, mais histórias horríveis ou mais ordens emocionalmente manipulativas à obediência. A melhor solução é intensificar a paixão dos povos por Cristo, para que as paixões de Seu coração se tornem as paixões que impulsionam nossos corações.

Missões nunca deve ter o primeiro lugar na vida da Igreja. A Igreja deve ter um só Senhor – uma paixão – Aquele em quem habita toda a plenitude de Deus, que reconciliou todas as coisas consigo mesmo (Cl 1:19-20). Se a Igreja hoje precisa de conversão, é sempre e somente a Jesus Cristo. Devemos dizer um enfático "Não!" aos deuses menores que clamam por nossa fidelidade, e um vivo e alegre "Sim!" para

Aquele em quem toda a criação converge.

É insuficiente proclamar que a Igreja de Deus tem uma missão no mundo. Mas sim que o Deus da missão tem uma Igreja no mundo. Compreenda esta inversão de sujeito e objeto, e a participação na missão de Deus se tornará um privilégio alegre e vivificante. Deixe de compreendê-la, e o envolvimento em missões se transformará no futuro em um dever cansativo e pesado.

Se a Igreja for fiel ao evangelho, então seu foco, paixão e deleite são sempre e somente Jesus Cristo. Uma vez que nossos corações estiverem no mesmo compasso com o de nosso Senhor, poderemos experimentar um engajamento alegremente apaixonado em missões.

O Tema Integrador de Missões

Tantas missões conflitantes e concorrentes clamam por nossa atenção. Somos tão facilmente atraídos e divididos pelo impulso de necessidades e chamados divergentes. Sem um entendimento central da ênfase bíblica sobre o reino de Deus, nossa terminologia torna-se a de "Trago-lhe más noticias a respeito de problemas tristes".

Os esforços para provocar o interesse em missões são muitas vezes baseados em más noticias – catástrofes naturais, desastres humanitários complexos, grupos de povos não alcançados, minorias oprimidas e exploradas, problemas urbanos ou suburbanos e guerras civis.

Essas coisas são importantes, mas o evangelho começa com "Estou lhes trazendo boas novas de grande alegria!"

Entrelaçadas no tecido de nossa fé cristã estão as boas novas! E mesmo assim temos transformado missões em uma discussão sobre más noticias e necessidades não atendidas. Alguma dessas soa familiar?

Milhares de pessoas estão indo todos os dias para a eternidade sem Cristo;

34.000 crianças morrem diariamente devido a desnutrição e doenças evitáveis;

Existem milhares de povos não alcançados sem igreja;

Mais cristãos foram mortos por sua fé no século 20 do que em todos os outros séculos juntos;

Genocídio, limpeza étnica, analfabetismo, falta de moradia, pobreza, opressão... a lista continua.

Noticias Tristes sobre Problemas Insolúveis

Devo confessar que uma vez desafiei e mobilizei pessoas para missões usando estatisticas semelhantes às mencionadas acima. Não estou de todo sugerindo que não sejam necessidades reais. A questão é esta: Como devemos responder a essas necessidades?

Pessoas de bom coração sempre querem responder com compaixão e bondade. Trabalhamos exaustivamente com exortações para dar mais, fazer mais, ser mais, se importar mais, servir mais, amar mais, se sacrificar mais. Por mais frutifero que isso pudesse ser, algo sempre parecia estar faltando.

Os membros de minha igreja – inclusive eu – pareciam exaustos. Os missionários que enviamos pareciam esgotados pelo árduo dever e responsabilidade sobre seus ombros. Materiais escritos para motivar a igreja por missões estão repletos de descrições de tarefas que devemos realizar, responsabilidades a serem cumpridas, o mandamento e a comissão de nosso Senhor para a igreja; e as necessidades desesperadas dos não alcançados, subnutridos e oprimidos. E assim a Igreja sai em missão por causa de um senso de dever, obrigação e responsabilidade de realizar estas tarefas.

Não é de se surpreender que esse compromisso com o empreendimento missionário da Igreja produza servos exaustos. As tarefas são tão imensas e nossos recursos parecem ser tão pequenos. Sim, devemos enfrentar enormes problemas e questões fundamentais – mas no contexto de um reino vindouro, não no contexto de um caos cada vez mais profundo. Missões não é, em última análise, a nossa resposta à grande necessidade.

Não é de se admirar que a Igreja e os mantenedores de muitas organizações estejam cada vez mais desinteressados por missões! As pessoas não conseguem lidar com uma exposição constante a catástrofes e crises. Isso não é o evangelho. O evangelho é boas novas de grande alegria!

O Reino de Deus: Boas Novas de Grande Esperança

Somos testemunhas de grande esperança, não meramente de severa dor. Isso deveria estar profundamente incutido em nossa psique como cristãos. As Escrituras nos dizem que "já que estamos recebendo um Reino inabalável, sejamos agradecidos" (Hb 12:28). Francamente, não colocamos nossos corações na esperança. Olhamos para o mundo e parece-nos que tudo está sendo abalado. Tudo parece estar andando à beira do desastre – e, no entanto, a noticia fundamental das Escrituras é que temos um reino que não pode ser abalado. O autor de Hebreus afirma isso, dizendo:

"...nós, que nos refugiamos nele para tomar posse da esperança a nós proposta.

Temos esta esperança como âncora da alma" (Hb 6.18-19).

A Grande Vitória de Cristo

Se tivermos esta âncora absolutamente confiável, esta esperança certa e firme, então será realmente uma blasfêmia concentrar nossa comunicação missionária em descrições do grande vazio de necessidades não satisfeitas no mundo. P.T. Forsyth faz a afirmação de que:

A fraqueza de muitos trabalhos missionários atuais é que [nós] traímos o senti mento de que o que ainda está por fazer é maior do que o que [Cristo] já fez. A maior necessidade do mundo é menor do que a grande vitória de Cristo.

Se entendermos a fé bíblica, entenderemos que o que Cristo já realizou é muito mais determinante, significativo, completo e importante do que qualquer coisa ainda por fazer.

No meu trabalho com a Visão Mundial e discussões com seus líderes, começamos a reconhecer que às vezes não representamos a missão de forma adequada em nossas atividades bem intencionadas de promoção e angariação de fundos. Aperfeiçoamos a arte de retratar histórias verdadeiramente de partir o coração e apresentar às pessoas imagens e descrições de crises, necessidades e desastres reais. Deus tem usado nossos melhores esforços, embora falhos, e Seu povo tem respondido com compaixão.

Entretanto, se Forsyth estiver certo – e a Bíblia é enfática em sua documentação da verdade de sua declaração – então devemos mudar como comunicamos as oportunidades de missões. Em vez de nos basearmos inteiramente nas apresentações de necessidade, devemos começar a convidar as pessoas a participar da obra de Deus, fazendo conhecer a todos as "grandezas daquele que os chamou das trevas para a sua maravilhosa luz" (1Pe 2:9).

Participação Privilegiada – Ação Não Exaustiva

Sem essa noticia de grande esperança e plena confiança em um Deus completamente soberano, teremos o senso de missões como um empreendimento humano exaustivo. Sentiremos como se tivéssemos recebido um mandato, uma comissão e um dever, e que o trabalho depende completamente de nós. Isso inevitavelmente leva ao "burnout". Missões nunca pretendeu ser um empreendimento humano exaustivo. Missões é a nossa participação privilegiada na ação vivificadora do Deus Trino.

Buscando Primeiro o Reino

Jesus nos convida a participar do que Deus está fazendo ao trazer seu reino. Mas o que é isso? Todos nós conhecemos Mateus 6:33: "Busquem, pois, em primeiro lugar o Reino de Deus". Se o reino era tão central na vida e ministério de Jesus, então não podemos nos dar ao luxo de ficarmos em dúvida sobre seu significado e importância. Veja o que Jesus disse sobre o reino de Deus:

O reino de Deus foi o tema da primeira mensagem de Jesus quando disse às pessoas que o Reino de Deus está próximo (Mc 1:15, Lc 4:18);

O reino foi também o tema de sua última mensagem (At 1:1-8);

O próprio Jesus disse que o reino era o objetivo, a intenção e o propósito de todo seu ensino (Lc 8:10);

Até mesmo os milagres de Jesus foram chamados de "sinais do reino";

Todos nós conhecemos a oração do Senhor: "Venha o teu reino, seja feita a tua vontade";

Jesus chega até a dizer que o fim desta era não virá até que o evangelho do reino tenha sido proclamado a todos os grupos étnicos (Mt 24:14).

Sinais do Reino

Sem essa visão integradora do Reino de Deus, o envolvimento em missões pode vir a se transformar em algo negativo como competição entre nossos próprios programas, ambições e desejos. Quando o reino de Deus é o objetivo de tudo o que fazemos, então os chamados concorrentes e ambições opostas desaparecem sob o som das ordens do Rei para marcharmos. Envolver-se em missões é participar das atividades do Rei.

O próprio Deus causa resultados para o Seu Reino. Ele o estabelece – não nós. Deus escolhe nos deixar participar em Seu trabalho. Não vemos nas Escrituras que somos nós que trazemos, causamos ou criamos o Reino. Somos chamados pelo Espírito de Deus a participar com Ele na construção do reino de Deus, mas a responsabilidade é dEle. Isso não é meramente uma questão semântica. Estes termos significam a diferença entre algo que é vivificador ou algo que pode ser causador de morte. Temos um papel fundamental no reino vindouro de Deus. O Espírito de Deus é enviado para manifestar sinais do Reino através de nós. Mas a obra permanece sendo de Deus.

Sinais da Vida do Reino

Os milagres de Jesus foram sinais da vida do reino. Porque ele escolheu limitar-se ao tempo e espaço, ele pôde expulsar apenas alguns demônios, e alimentar apenas algumas pessoas milagrosamente. Em comparação com a população do mundo na época, relativamente muito poucos tiveram o privilégio de ver Jesus em ação. Apenas os que viviam na Palestina e especificamente ao redor da Galileia tiveram a oportunidade de experimentar uma parte relativa ao reino. Mas a reputação de Jesus começou a se espalhar, de modo que quando ele chegava a uma nova cidade, as pessoas traziam os enfermos para ele curar. Cada ato de cura ilustrava a mensagem: "O Reino de Deus está próximo de vocês" (Lc 10:9). Toda a plenitude de Deus está a caminho. Cidades e regiões inteiras foram transformadas pela esperança do reino.

De modo semelhante, a falecida Madre Teresa, por exemplo, só cuidava de cerca de 200.000 pessoas em Calcutá, mas todos os 18 milhões de pessoas naquela cidade sabiam que a vida poderia ser diferente por causa de seu exemplo. De fato, suas boas obras vieram a ser conhecidas na aldeia global e impactaram o mundo.

Deus deseja que sejamos sinais vivos do reino, para fornecer ajudas visuais de como a vida vai ser um dia quando o reino estiver plenamente aqui. Não traremos o reino ou construiremos o reino, mas o nosso privilégio é vivenciar as prévias de "atrações futuras", revelando como será este reino.

As Duas Mãos do Evangelho

O Rei busca restaurar o bem-estar e a integridade de sua criação. A Igreja não deve ser uma estrada de ferro subterrânea para o céu, escondendo as pessoas na terra até que possam escapar para a glória. A Igreja também não é outra organização filantrópica, fazendo bondosamente boas obras e dispensando ajuda aos necessitados. Em vez disso, a Igreja é o Corpo de Cristo, participando consciente e explicitamente no estabelecimento de seu reinado na Terra. A Igreja deve ser consciente e explicitamente de Cristo, independentemente da atividade.

Por isso, estendemos ambas as mãos do evangelho: a mão que convida as pessoas ao arrependimento, à fé e à eterna reconciliação com Deus através de Cristo Jesus, e a mão que manifesta atos de misericórdia e compaixão, estendendo a bondade do Reino de Deus na Terra. Uma não é um meio para a outra. Ambas são igualmente significativas para a vida no reino eterno como descrito pelas Escrituras.

Não Mais um Dever Sombrio

Envolver-se em missões é participar da vinda do Reino de Deus. Quando o Rei e seu reino são a fonte unificadora e controladora e o objetivo de tudo o que fazemos, então chamados concorrentes e ambições opostas desaparecem sob o som das ordens do rei para marcharmos. A participação na missão de Deus não é mais um dever sombrio. Torna-se um privilégio alegre e uma aventura de paixão e esperança.

Perguntas para estudo

1. Em longo prazo, pode ser contraproducente provocar interesse em missões levando as pessoas a se preocuparem com as necessidades humanas?

2. O que Dearborn quer dizer com "sinais do reino"?

3. Como missões pode se tornar uma paixão alegre em vez de um dever?$conteudo$
     where curso_id = v_curso and ordem = 11;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 2 · Leitura — Dearborn: Além do Dever$t$, $conteudo$Além do Dever

Tim Dearborn

Tim Dearborn é diretor do Faith and Development Programs for World Vision Internati onal. Anteriormente, atuou como diretor de staff da Visão Mundial – Estados Unidos e professor de teologia na Universidade Seatt le Pacific. Ele também serviu os esquimós e povos das primeiras nações no Alasca e escreveu vários livros sobre espiritualidade, globalização e questões relacionadas à missão. De Beyond Duty, 1997. Usado com permissão da World Vision Inc., Federal Way, WA.

Muitas vezes nos concentramos na pergunta: "O que devemos fazer para obedecer à Grande Comissão, fazer discípulos de todas as nações e apressar o retorno de nosso Senhor?" Esse é o ponto de partida errado, pois nos tranca dentro de uma perspectiva centrada no ser humano. Se começarmos com a orientação centrada no ser humano, continuamente nos sentiremos constrangidos por ter recursos insuficientes – e as tarefas são muito maiores do que possivelmente podemos realizar.

Ao contrário, as prioridades bíblicas refletidas repetidas vezes nas Escrituras nos pedem para começar com estas perguntas:

Quem é o Deus trino?

O que Deus está fazendo no mundo?

Como devemos participar com Deus em seus propósitos redentores?

Em última análise, missões não é uma resposta humana às necessidades humanas. O envolvimento da Igreja na missão é sua participação privilegiada nas ações do Deus trino.

Uma Paixão Singular

A falta de interesse em missões não é fundamentalmente causada pela ausência de compaixão ou compromisso, nem por falta de informação ou exortação. E a falta de interesse em missões não é resolvida por mais estatisticas chocantes, mais histórias horríveis ou mais ordens emocionalmente manipulativas à obediência. A melhor solução é intensificar a paixão dos povos por Cristo, para que as paixões de Seu coração se tornem as paixões que impulsionam nossos corações.

Missões nunca deve ter o primeiro lugar na vida da Igreja. A Igreja deve ter um só Senhor – uma paixão – Aquele em quem habita toda a plenitude de Deus, que reconciliou todas as coisas consigo mesmo (Cl 1:19-20). Se a Igreja hoje precisa de conversão, é sempre e somente a Jesus Cristo. Devemos dizer um enfático "Não!" aos deuses menores que clamam por nossa fidelidade, e um vivo e alegre "Sim!" para

Aquele em quem toda a criação converge.

É insuficiente proclamar que a Igreja de Deus tem uma missão no mundo. Mas sim que o Deus da missão tem uma Igreja no mundo. Compreenda esta inversão de sujeito e objeto, e a participação na missão de Deus se tornará um privilégio alegre e vivificante. Deixe de compreendê-la, e o envolvimento em missões se transformará no futuro em um dever cansativo e pesado.

Se a Igreja for fiel ao evangelho, então seu foco, paixão e deleite são sempre e somente Jesus Cristo. Uma vez que nossos corações estiverem no mesmo compasso com o de nosso Senhor, poderemos experimentar um engajamento alegremente apaixonado em missões.

O Tema Integrador de Missões

Tantas missões conflitantes e concorrentes clamam por nossa atenção. Somos tão facilmente atraídos e divididos pelo impulso de necessidades e chamados divergentes. Sem um entendimento central da ênfase bíblica sobre o reino de Deus, nossa terminologia torna-se a de "Trago-lhe más noticias a respeito de problemas tristes".

Os esforços para provocar o interesse em missões são muitas vezes baseados em más noticias – catástrofes naturais, desastres humanitários complexos, grupos de povos não alcançados, minorias oprimidas e exploradas, problemas urbanos ou suburbanos e guerras civis.

Essas coisas são importantes, mas o evangelho começa com "Estou lhes trazendo boas novas de grande alegria!"

Entrelaçadas no tecido de nossa fé cristã estão as boas novas! E mesmo assim temos transformado missões em uma discussão sobre más noticias e necessidades não atendidas. Alguma dessas soa familiar?

Milhares de pessoas estão indo todos os dias para a eternidade sem Cristo;

34.000 crianças morrem diariamente devido a desnutrição e doenças evitáveis;

Existem milhares de povos não alcançados sem igreja;

Mais cristãos foram mortos por sua fé no século 20 do que em todos os outros séculos juntos;

Genocídio, limpeza étnica, analfabetismo, falta de moradia, pobreza, opressão... a lista continua.

Noticias Tristes sobre Problemas Insolúveis

Devo confessar que uma vez desafiei e mobilizei pessoas para missões usando estatisticas semelhantes às mencionadas acima. Não estou de todo sugerindo que não sejam necessidades reais. A questão é esta: Como devemos responder a essas necessidades?

Pessoas de bom coração sempre querem responder com compaixão e bondade. Trabalhamos exaustivamente com exortações para dar mais, fazer mais, ser mais, se importar mais, servir mais, amar mais, se sacrificar mais. Por mais frutifero que isso pudesse ser, algo sempre parecia estar faltando.

Os membros de minha igreja – inclusive eu – pareciam exaustos. Os missionários que enviamos pareciam esgotados pelo árduo dever e responsabilidade sobre seus ombros. Materiais escritos para motivar a igreja por missões estão repletos de descrições de tarefas que devemos realizar, responsabilidades a serem cumpridas, o mandamento e a comissão de nosso Senhor para a igreja; e as necessidades desesperadas dos não alcançados, subnutridos e oprimidos. E assim a Igreja sai em missão por causa de um senso de dever, obrigação e responsabilidade de realizar estas tarefas.

Não é de se surpreender que esse compromisso com o empreendimento missionário da Igreja produza servos exaustos. As tarefas são tão imensas e nossos recursos parecem ser tão pequenos. Sim, devemos enfrentar enormes problemas e questões fundamentais – mas no contexto de um reino vindouro, não no contexto de um caos cada vez mais profundo. Missões não é, em última análise, a nossa resposta à grande necessidade.

Não é de se admirar que a Igreja e os mantenedores de muitas organizações estejam cada vez mais desinteressados por missões! As pessoas não conseguem lidar com uma exposição constante a catástrofes e crises. Isso não é o evangelho. O evangelho é boas novas de grande alegria!

O Reino de Deus: Boas Novas de Grande Esperança

Somos testemunhas de grande esperança, não meramente de severa dor. Isso deveria estar profundamente incutido em nossa psique como cristãos. As Escrituras nos dizem que "já que estamos recebendo um Reino inabalável, sejamos agradecidos" (Hb 12:28). Francamente, não colocamos nossos corações na esperança. Olhamos para o mundo e parece-nos que tudo está sendo abalado. Tudo parece estar andando à beira do desastre – e, no entanto, a noticia fundamental das Escrituras é que temos um reino que não pode ser abalado. O autor de Hebreus afirma isso, dizendo:

"...nós, que nos refugiamos nele para tomar posse da esperança a nós proposta.

Temos esta esperança como âncora da alma" (Hb 6.18-19).

A Grande Vitória de Cristo

Se tivermos esta âncora absolutamente confiável, esta esperança certa e firme, então será realmente uma blasfêmia concentrar nossa comunicação missionária em descrições do grande vazio de necessidades não satisfeitas no mundo. P.T. Forsyth faz a afirmação de que:

A fraqueza de muitos trabalhos missionários atuais é que [nós] traímos o senti mento de que o que ainda está por fazer é maior do que o que [Cristo] já fez. A maior necessidade do mundo é menor do que a grande vitória de Cristo.

Se entendermos a fé bíblica, entenderemos que o que Cristo já realizou é muito mais determinante, significativo, completo e importante do que qualquer coisa ainda por fazer.

No meu trabalho com a Visão Mundial e discussões com seus líderes, começamos a reconhecer que às vezes não representamos a missão de forma adequada em nossas atividades bem intencionadas de promoção e angariação de fundos. Aperfeiçoamos a arte de retratar histórias verdadeiramente de partir o coração e apresentar às pessoas imagens e descrições de crises, necessidades e desastres reais. Deus tem usado nossos melhores esforços, embora falhos, e Seu povo tem respondido com compaixão.

Entretanto, se Forsyth estiver certo – e a Bíblia é enfática em sua documentação da verdade de sua declaração – então devemos mudar como comunicamos as oportunidades de missões. Em vez de nos basearmos inteiramente nas apresentações de necessidade, devemos começar a convidar as pessoas a participar da obra de Deus, fazendo conhecer a todos as "grandezas daquele que os chamou das trevas para a sua maravilhosa luz" (1Pe 2:9).

Participação Privilegiada – Ação Não Exaustiva

Sem essa noticia de grande esperança e plena confiança em um Deus completamente soberano, teremos o senso de missões como um empreendimento humano exaustivo. Sentiremos como se tivéssemos recebido um mandato, uma comissão e um dever, e que o trabalho depende completamente de nós. Isso inevitavelmente leva ao "burnout". Missões nunca pretendeu ser um empreendimento humano exaustivo. Missões é a nossa participação privilegiada na ação vivificadora do Deus Trino.

Buscando Primeiro o Reino

Jesus nos convida a participar do que Deus está fazendo ao trazer seu reino. Mas o que é isso? Todos nós conhecemos Mateus 6:33: "Busquem, pois, em primeiro lugar o Reino de Deus". Se o reino era tão central na vida e ministério de Jesus, então não podemos nos dar ao luxo de ficarmos em dúvida sobre seu significado e importância. Veja o que Jesus disse sobre o reino de Deus:

O reino de Deus foi o tema da primeira mensagem de Jesus quando disse às pessoas que o Reino de Deus está próximo (Mc 1:15, Lc 4:18);

O reino foi também o tema de sua última mensagem (At 1:1-8);

O próprio Jesus disse que o reino era o objetivo, a intenção e o propósito de todo seu ensino (Lc 8:10);

Até mesmo os milagres de Jesus foram chamados de "sinais do reino";

Todos nós conhecemos a oração do Senhor: "Venha o teu reino, seja feita a tua vontade";

Jesus chega até a dizer que o fim desta era não virá até que o evangelho do reino tenha sido proclamado a todos os grupos étnicos (Mt 24:14).

Sinais do Reino

Sem essa visão integradora do Reino de Deus, o envolvimento em missões pode vir a se transformar em algo negativo como competição entre nossos próprios programas, ambições e desejos. Quando o reino de Deus é o objetivo de tudo o que fazemos, então os chamados concorrentes e ambições opostas desaparecem sob o som das ordens do Rei para marcharmos. Envolver-se em missões é participar das atividades do Rei.

O próprio Deus causa resultados para o Seu Reino. Ele o estabelece – não nós. Deus escolhe nos deixar participar em Seu trabalho. Não vemos nas Escrituras que somos nós que trazemos, causamos ou criamos o Reino. Somos chamados pelo Espírito de Deus a participar com Ele na construção do reino de Deus, mas a responsabilidade é dEle. Isso não é meramente uma questão semântica. Estes termos significam a diferença entre algo que é vivificador ou algo que pode ser causador de morte. Temos um papel fundamental no reino vindouro de Deus. O Espírito de Deus é enviado para manifestar sinais do Reino através de nós. Mas a obra permanece sendo de Deus.

Sinais da Vida do Reino

Os milagres de Jesus foram sinais da vida do reino. Porque ele escolheu limitar-se ao tempo e espaço, ele pôde expulsar apenas alguns demônios, e alimentar apenas algumas pessoas milagrosamente. Em comparação com a população do mundo na época, relativamente muito poucos tiveram o privilégio de ver Jesus em ação. Apenas os que viviam na Palestina e especificamente ao redor da Galileia tiveram a oportunidade de experimentar uma parte relativa ao reino. Mas a reputação de Jesus começou a se espalhar, de modo que quando ele chegava a uma nova cidade, as pessoas traziam os enfermos para ele curar. Cada ato de cura ilustrava a mensagem: "O Reino de Deus está próximo de vocês" (Lc 10:9). Toda a plenitude de Deus está a caminho. Cidades e regiões inteiras foram transformadas pela esperança do reino.

De modo semelhante, a falecida Madre Teresa, por exemplo, só cuidava de cerca de 200.000 pessoas em Calcutá, mas todos os 18 milhões de pessoas naquela cidade sabiam que a vida poderia ser diferente por causa de seu exemplo. De fato, suas boas obras vieram a ser conhecidas na aldeia global e impactaram o mundo.

Deus deseja que sejamos sinais vivos do reino, para fornecer ajudas visuais de como a vida vai ser um dia quando o reino estiver plenamente aqui. Não traremos o reino ou construiremos o reino, mas o nosso privilégio é vivenciar as prévias de "atrações futuras", revelando como será este reino.

As Duas Mãos do Evangelho

O Rei busca restaurar o bem-estar e a integridade de sua criação. A Igreja não deve ser uma estrada de ferro subterrânea para o céu, escondendo as pessoas na terra até que possam escapar para a glória. A Igreja também não é outra organização filantrópica, fazendo bondosamente boas obras e dispensando ajuda aos necessitados. Em vez disso, a Igreja é o Corpo de Cristo, participando consciente e explicitamente no estabelecimento de seu reinado na Terra. A Igreja deve ser consciente e explicitamente de Cristo, independentemente da atividade.

Por isso, estendemos ambas as mãos do evangelho: a mão que convida as pessoas ao arrependimento, à fé e à eterna reconciliação com Deus através de Cristo Jesus, e a mão que manifesta atos de misericórdia e compaixão, estendendo a bondade do Reino de Deus na Terra. Uma não é um meio para a outra. Ambas são igualmente significativas para a vida no reino eterno como descrito pelas Escrituras.

Não Mais um Dever Sombrio

Envolver-se em missões é participar da vinda do Reino de Deus. Quando o Rei e seu reino são a fonte unificadora e controladora e o objetivo de tudo o que fazemos, então chamados concorrentes e ambições opostas desaparecem sob o som das ordens do rei para marcharmos. A participação na missão de Deus não é mais um dever sombrio. Torna-se um privilégio alegre e uma aventura de paixão e esperança.

Perguntas para estudo

1. Em longo prazo, pode ser contraproducente provocar interesse em missões levando as pessoas a se preocuparem com as necessidades humanas?

2. O que Dearborn quer dizer com "sinais do reino"?

3. Como missões pode se tornar uma paixão alegre em vez de um dever?$conteudo$, 11);
  end if;

end
$curso$;
