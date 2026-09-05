-- 273_perspectivas_licao1_leituras.sql
-- Leituras que o guia da Lição 1 manda ler, como partes da mesma lição:
-- Stott cap. 3 (citado na seção 1.A) e cap. 1 (citado na seção 8).
-- O texto veio do visualizador do Dropbox, remontado a partir do layout de
-- duas colunas da coletânea.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe — rode 272 antes';
  end if;

  if exists (select 1 from aulas where curso_id = v_curso and ordem = 2) then
    update aulas
       set titulo = $t$Lição 1 · Leitura — Stott, cap. 3: O Deus vivo é um Deus missionário$t$,
           conteudo = $conteudo$O DEUS VIVO É UM DEUS MISSIONÁRIO

JOHN R. W. STOTT

3ilhões de pessoas no mundo de hoje são extremamenMte hostis ao empreendimento missionário cristão. Elas o consideram politicamente prejudicial (porque enfraquece os laços que unem a cultura nacional) e religiosamente tacanho (porque reivindica exclusividade para Jesus), enquanto os que se envolvem com missões são tidos como imperialistas arrogantes. O esforço para converter as pessoas a Cristo é visto como uma imperdoável interferência na vida pessoal. "Minha religião é assunto meu", dizem. "Trate de seus próprios negócios e me deixe com os meus."

Portanto, é essencial que os cristãos entendam as bases sobre as quais repousa a missão cristã. Só então seremos capazes de perseverar na tarefa missionária, com coragem e humildade, apesar da incompreensão e oposição do mundo. Mais precisamente, os cristãos bíblicos precisam de estímulos bíblicos, pois cremos que a Bíblia é a revelação de Deus e de sua vontade. Por isso, perguntamos: ele revelou nas Escrituras que a obra missionária é sua vontade para seu povo? Só então ficaremos satisfeitos. Pois então as missões se tornarão uma questão de obediência a Deus, a despeito do que os outros possam pensar ou dizer. Iremos aqui nos concentrar no Antigo Testamento, embora toda a Bíblia seja rica em evidências acerca do propósito missionário de Deus.

A CHAMADA DE ABRAÃO

Nossa história começa cerca de 4 mil anos atrás, com um homem chamado Abraão, ou mais exatamente Abrão, como ele era chamado naquele tempo. Eis a narrativa da chamada de Abraão:

Disse o Senhor a Abrão: Sai da tua terra, da tua parentela e da casa de teu pai e vai para a terra que te mostrarei; de ti farei uma grande nação, e te abençoarei, e te engrandecerei o nome. Sê tu uma bênção! Abençoarei os que te abençoarem e amaldiçoarei os que te amaldiçoarem; em ti serão benditas todas as famílias da terra.

Partiu, pois, Abrão, como lho ordenara o Senhor, e Ló foi com ele. Tinha Abrão setenta e cinco anos quando saiu de Harã (Gn 12.1-4).

Deus fez uma promessa (complexa, conforme veremos) a Abraão, e para entender a Bíblia e a missão cristã é indispensável entender essa promessa. Talvez esses sejam os versículos que melhor resumem a Bíblia. Todo o propósito de Deus encontra-se condensado aqui.

Como introdução, iremos considerar o cenário da promessa de Deus, o contexto no qual ela foi feita. Então dividiremos em dois o restante de nosso estudo. Na primeira parte, destacaremos a promessa, isto é,o que Deus disse que faria. Na segunda parte, analisaremos, de maneira mais extensa, o cumprimento da promessa,ou seja, como Deus a tem cumprido e irá cumpri-la ainda. Comecemos, entretanto, com o cenário.

Gênesis 12 começa assim: "Ora disse o Senhor a Abrão...". Parece uma forma abrupta de começar um novo capítulo. Somos levados a perguntar. "Quem é esse ‘Senhor' que falou a Abrão? Quem é esse ‘Abrão' a quem ele falou?". Eles não são introduzidos no texto abruptamente. Há muita coisa por trás dessas palavras. Elas constituem uma chave que abre o todo das Escrituras. Os 11 capítulos anteriores conduzem a elas. O restante da Bíblia é consequência e cumprimento dessas palavras.

O que, então, existe por trás desse texto? É o seguinte: o "Senhor" que escolheu e chamou Abraão é o mesmo que no começo criou os céus e a terra e atingiu o clímax de sua obra criadora trazendo à existência o homem e a mulher, criaturas únicas feitas à semelhança dele. Jamais devemos esquecer que a Bíblia começa com o Universo, não com o planeta Terra; então, com a Terra, não com a Palestina; depois com Adão, na qualidade de pai da raça humana, não com Abraão, o pai da raça escolhida. Considerando, então, que Deus é o Criador do Universo, da Terra e de toda a humanidade, não devemos nunca rebaixá-lo à condição de divindade tribal ou a de um deus insignificante, como Quemos, deus dos moabitas, ou Milcom (Moloque), deus dos amonitas, ou Baal, o deushomem, ou Astarote, a deusa-mulher dos cananeus. Não devemos supor também que Deus escolheu Abraão e seus descendentes por haver perdido o interesse nos outros povos ou porque desistisse deles. Eleição não é sinônimo de elitismo. Pelo contrário, como veremos logo a seguir, Deus escolheu um homem e sua família, a fim de abençoar por meio deles todas as famílias da terra.

Portanto, ficamos profundamente magoados quando vemos o cristianismo relegado a um capítulo dentro de um livro sobre as religiões do mundo, como se fosse uma opção entre muitas, ou quando alguém faz referência ao "Deus cristão", como se houvesse outros! Não, existe apenas um único Deus vivo e verdadeiro, que se revelou totalmente e, por fim, em seu único Filho Jesus Cristo. O monoteísmo jaz no alicerce das missões, como Paulo escreveu a Timóteo: "Há um só Deus e um só Mediador entre Deus e os homens, Cristo Jesus, homem" (1Tm 2.5).

O registro de Gênesis prossegue desde a criação de todas as coisas pelo Deus único e dos seres humanos conforme a semelhança divina, até nossa rebeldia contra nosso Criador e o julgamento de Deus sobre suas criaturas rebeldes. Esse julgamento, entretanto, é atenuado pela primeira promessa evangélica de que um dia a semente da mulher "pisaria" — na realidade "esmagaria" — a cabeça da serpente (3.15).

Os oito capítulos seguintes (Gn 4—11) descrevem os resultados devastadores da Queda: a alienação progressiva dos seres humanos em relação a Deus e aos outros seres humanos. Esse foi o cenário no qual Deus chamou e fez a promessa a Abraão. Tudo à volta era deterioração moral, trevas e dispersão. A sociedade se desintegrava cada vez mais. Todavia, Deus, o Criador, não abandonou os seres humanos que criara à sua semelhança (Gn 9.6). Dessa constante impiedade, ele chamou um homem e sua família e prometeu abençoar não apenas a eles, mas, por meio deles, a todo o mundo. A dispersão não continuaria descontroladamente: um grande processo de reunião estava começando.

A PROMESSA

Qual foi, então, a promessa que Deus fez a Abraão? Foi uma promessa complexa que consistia de diversas outras promessas.

Primeira: a promessa de uma posteridade. Ele devia deixar sua parentela e a casa de seu pai e, em troca da perda da família, Deus faria dele "uma grande nação". Mais tarde, para indicar isso, Deus mudou o nome do patriarca de "Abrão" ("pai exaltado") para "Abraão" ("pai de uma multidão") e lhe disse: "Por pai de numerosas nações te constituí" (Gn 17.5).

Segunda: a promessa de uma terra. Parece que o chamado divino veio em duas etapas. Primeiramente, em Ur dos caldeus, quando o pai de Abraão ainda vivia (11.31; 15.7), e depois em Harã, após da morte de seu pai (11.32; 12.1). De qualquer modo, ele devia deixar sua terra natal, e, em troca, Deus lhe mostraria outra.

Terceira: a promessa de uma bênção. Cinco vezes as palavras "bênção" e "abençoar"aparecem em 12.2,3. A bênção que Deus prometeu a Abraão transbordaria sobre toda a humanidade.

Uma posteridade, uma terra e uma bênção. Cada uma dessas promessas é desenvolvida nos capítulos que se seguem à chamada de Abraão.

Em primeiro lugar, a terra. Depois que Abraão generosamente permitiu que seu sobrinho Ló escolhesse onde queria se estabelecer (Ló escolheu o fértil vale do Jordão), Deus disse ao patriarca: "Ergue os olhos e olha desde onde estás para o norte, para o sul, para o oriente e para o ocidente; porque toda essa terra que vês, eu ta darei, a ti e à tua descendência, para sempre" (13.14,15).

Em segundo lugar, a posteridade. Um pouco mais tarde, Deus apresentou a Abraão outro recurso ilustrativo, convidando-o agora a olhar não para a terra, mas para o céu. Numa noite escura e desanuviada, Deus levou-o para fora de sua tenda e ordenou-lhe: "Olha para os céus e conta as estrelas". Que ordem ridícula! Talvez Abraão tivesse começado: "Uma, duas, três, cinco, dez, vinte, trinta...", mas deve ter desistido logo. Era uma tarefa impossível. Então Deus lhe disse: "Será assim tua posteridade". E lemos. "Ele creu no Senhor". Embora provavelmente já estivesse com mais de 80 anos de idade e ele e Sara não tivessem filhos ainda, Abraão creu na promessa de Deus, "e isso lhe foi imputado para justiça" por Deus. Isto é, pelo fato de ele haver confiado em Deus, O Senhor o aceitou como justo.

Em terceiro lugar, a bênção. "[Eu] te abençoarei" — Deus já havia aceitado Abraão como justo ou, tomando emprestada a expressão neotestamentária, "justificado pela fé". Não podemos imaginar bênção maior. É a bênção fundamental da aliança da graça, a qual alguns anos mais tarde Deus esmiuçaria para Abraão: "Estabelecerei a minha aliança entre mim e ti e a tua descendência [...] aliança perpétua, para ser o teu Deus e da tua descendência. [...] e serei o seu Deus" (17.7,8). Deus instituiu a circuncisão como sinal exterior e visível da aliança da graça ou como penhor de que era o seu Deus. É a primeira vez nas Escrituras que ouvimos a fórmula da aliança, repetida muitas vezes mais tarde: "Eu serei o seu Deus, e eles serão o meu povo".

"Uma terra, uma posteridade, uma bênção: mas que relação tem tudo isso com missões?", talvez você se pergunte, impaciente. Minha resposta é: "Tudo! Seja um pouco mais paciente e verá". Passemos agora da promessa para o cumprimento.

O CUMPRIMENTO DA PROMESSA

Toda a questão do cumprimento das profecias do Antigo Testamento apresenta dificuldades, havendo sempre muitos mal-entendidos e quase nenhum acordo. De importância particular é o princípio, com o qual acho que todos concordamos, de que os autores do Novo Testamento entendiam que a profecia do Antigo Testamento não tinha um único cumprimento,mas que em geral era triplo — passado, presente e futuro. O cumprimento passado fora imediato, ou histórico, na vida da nação de Israel. O cumprimento presente era intermediário, ou evangélico, em Cristo e sua Igreja. O cumprimento futuro será final, ou escatológico, no novo céu e na nova terra.

A PROMESSA DE DEUS A ABRAÃO TEVE CUMPRIMENTO HISTÓRICO IMEDIATO EM SEUS DESCENDENTES CARNAIS, O POVO DE ISRAEL

A promessa de uma posteridade numerosa, realmente incontável, feita por Deus a Abraão foi confirmada ao seu filho Isaque (26.4, "como as estrelas dos céus") e ao seu neto Jacó (32.12, "como a areia do mar"). A promessa, aos poucos, começou a se cumprir literalmente. Talvez devêssemos examinar algumas das etapas desse desenvolvimento.

A primeira etapa refere-se aos anos de escravidão no Egito, dos quais se escreveu: "Os filhos de Israel foram fecundos, e aumentaram muito, e se multiplicaram, e grandemente se fortaleceram, de maneira que a terra se encheu deles" (Êx 1.7; comp. com At 7.17). A etapa seguinte ocorreu centenas de anos mais tarde, quando o rei Salomão declarou que Israel era um "povo grande, tão numeroso, que se não pode contar" (1Rs 3.8). A terceira etapa teve lugar cerca de 350 anos depois de Salomão. Jeremias advertiu Israel do juízo e do cativeiro iminentes e, então, acrescentou esta promessa divina de restauração: "Como não se pode contar o exército dos céus, nem medir-se a areia do mar, assim tornarei incontável a descendência de Davi, meu servo" ( Jr 33.22).

Tudo isso diz respeito à posteridade de Abraão: e o que dizer da terra? Mais uma vez, observamos com atitude de adoração e gratidão a fidelidade de Deus à sua promessa, pois foi lembrando sua promessa a Abraão, a Isaque e a Jacó que Deus libertou seu povo da escravidão no Egito e lhe deu o território que nessa narrativa é chamado "terra prometida" (Êx 2.24; 3.6; 32.13). Então, cerca de 700 anos depois, trouxe-os de volta a essa terra, após o cativeiro na Babilônia. Não obstante, nem Abraão nem seus descendentes físicos herdaram totalmente a terra. Como diz Hebreus 11, eles "morreram na fé, sem ter obtido as promessas". Pelo contrário, como "estrangeiros e peregrinos sobre a terra", eles aguardavam "a cidade que tem fundamentos, da qual Deus é o arquiteto e edifi - cador" (Hb 11.8-16,39,40).

Deus cumpriu suas promessas sobre a posteridade e a terra, pelo menos parcialmente. E as bênçãos? Bem, no Sinai, Deus confirmou e esclareceu sua aliança com Abraão e se comprometeu a ser o Deus de Israel (v. Êx. 19.3-6). No restante do Antigo Testamento, Deus continuou abençoando os obedientes, enquanto os desobedientes caíram sob seu juízo.

Talvez o exemplo mais dramático esteja no início da profecia de Oseias, na qual ele é orientado a dar a seus três filhos nomes que indicam o juízo divino, horrível e progressivo que se abaterá sobre Israel. Seu primogênito (um menino) foi chamado Jezreel, que significa "Deus dispersará". Depois nasceu uma menina, LoRuama (arc), ou seja, Desfavorecida, pois Deus declarou que não teria mais piedade nem perdoaria seu povo. Finalmente, Oseias teve outro filho, Lo-Ami (arc), isto é, Não-Meu-Povo, pois Deus disse que eles não eram mais seu povo. Que nomes terríveis para o povo escolhido de Deus! Parece uma devastadora contradição da promessa eterna de Deus a Abraão.

Contudo, Deus não parou aí. Além do iminente juízo, haveria uma restauração, afirmada em palavras que mais uma vez fazem eco à promessa feita a Abraão: "Todavia, o número dos filhos de Israel será como a areia do mar, que se não pode medir, nem contar" (Os 1.10). Assim, o juízo implícito nos nomes dos filhos de Oseias seria invertido. Haverá um ajuntamento, em vez de dispersão ( Jezreel é uma palavra ambígua e também pode ter esse significado). Desfavorecida será favorecida, e Não-MeuPovo se transformará em "filhos do Deus vivo" (1.10—2.1).

É maravilhoso que os apóstolos Paulo e Pedro citassem esses versículos de Oseias. Eles viram seu cumprimento não apenas numa futura multiplicação de Israel, mas na inclusão dos gentios na comunidade de Jesus. "Antes, não éreis povo, mas, agora, sois povo de Deus, que não tínheis alcançado misericórdia, mas, agora, alcançastes misericórdia" (1Pe 2.9,10; v. Rm 9.25,26).

Essa perspectiva do Novo Testamento é essencial quando lemos as profecias do Antigo Testamento, pois o que sentimos faltar no Antigo Testamento é uma explicação clara acerca de como a prometida bênção de Deus transbordaria de Abraão e seus descendentes para "todas as famílias da terra". Embora Israel seja descrito como "luz" para as nações e tenha a missão de levar a justiça a todos os povos (Is 42.1-4,6; 49.6), não é o que vemos acontecendo. Só no Senhor Jesus que essas profecias são cumpridas, pois apenas no seu Dia é que as nações são de fato incluídas na comunidade dos remidos. É para isso que nos voltamos agora.

A PROMESSA DE DEUS A ABRAÃO RECEBE CUMPRIMENTO INTERMEDIÁRIO, OU EVANGÉLICO, EM CRISTO E SUA IGREJA

"Abraão" é quase a primeira palavra do Novo Testamento, pois o evangelho de Mateus começa assim: "Livro da genealogia de Jesus Cristo, filho de Davi, filho de Abraão. Abraão gerou a Isaque...". Portanto, Mateus relaciona com Abraão não só o começo da genealogia, mas também o início do evangelho de Jesus Cristo. Ele sabe que está registrando o cumprimento das antigas promessas de Deus a Abraão, feitas cerca de 2 mil anos antes (v. Lc 1.45- 55,67-76).

Desde o começo, porém, Mateus reconhece que não é simplesmente a descendência física de Abraão que qualifica o ser humano a herdar as promessas, mas uma descendência espiritual, isto é, o arrependimento e a fé no Messias que havia de vir. Esta era a mensagem de João Batista às multidões que se ajuntavam para ouvi-lo: "Não comeceis a dizer entre vós mesmos: Temos por pai a Abraão; porque eu vos afirmo que destas pedras Deus pode suscitar filhos a Abraão" (Mt 3.9; v. Lc 3.9; Jo 8.33-40). As implicações de suas palavras devem ter assustado seus ouvintes, uma vez que "era crença generalizada que nenhum dos descendentes de Abraão se perderia".

Deus suscitou filhos a Abraão não de pedras, mas de uma fonte igualmente improvável, isto é, dos gentios! Portanto, Mateus, embora seja o mais judeu dos quatro escritores dos evangelhos, ele registra estas palavras de Jesus: "Digo-vos que muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus. Ao passo que os filhos do reino serão lançados para fora, nas trevas" (Mt 8.11,12; v. Lc 13.28,29).

É difícil imaginar o choque, a total confusão que essas palavras devem ter causado entre os ouvintes judeus de João Batista e Jesus. Eles eram descendentes de Abraão, portanto eles tinham direito às promessas que Deus fizera a Abraão. Quem eram, então, aqueles estranhos que iriam participar das promessas, aparentemente até usurpá-las, enquanto eles próprios seriam desqualificados? Os judeus ficaram indignados. Eles haviam esquecido completamente que a aliança de Deus com Abraão continha a promessa de um transbordamento de bênçãos sobre todas as nações da terra. Agora os judeus tinham de entender que era por meio Jesus, o Messias, ele próprio semente de Abraão, que todas as nações seriam abençoadas.

Parece que o apóstolo Pedro pelo menos começou a perceber essa realidade em seu segundo sermão após o Pentecostes. Ele se dirigiu a uma multidão de judeus com estas palavras: "Vós sois os filhos dos profetas e da aliança que Deus estabeleceu com vossos pais, dizendo a Abraão: Na tua descendência, serão abençoadas todas as nações da terra. Tendo Deus ressuscitado o seu Servo, enviou-o primeiramente a vós outros para vos abençoar, no sentido de que cada um se aparte das suas perversidades" (At 3.25,26). É uma declaração muito notável porque interpreta a bênção em termos morais de arrependimento e justiça, porque, se Jesus foi enviado "primeiro" aos judeus, ele foi presumivelmente enviado depois aos gentios, às "famílias da terra" que estavam "longe" (v. At 2.39), mas agora participariam das bênçãos.

Foi concedido ao apóstolo Paulo desenvolver plenamente esse maravilhoso tema. Ele foi chamado e designado para ser o apóstolo dos gentios, e a ele foi revelado o propósito eterno — e até então secreto — de Deus: tornar os judeus e os gentios "co-herdeiros, membros do mesmo corpo e coparticipantes da promessa em Cristo Jesus por meio do evangelho" (Ef 3.6).

Negativamente, Paulo declara com grande ousadia: "Nem todos os de Israel são, de fato, israelitas; nem por serem descendentes de Abraão são todos seus filhos" (Rm 9.6,7).

Quem são, então, os verdadeiros descentes de Abraão, os verdadeiros beneficiados pelas promessas de Deus? Paulo não deixa nenhuma dúvida. São os crentes em Cristo, de qualquer raça. Em Romanos 4, ele destaca que Abraão não só foi justificado pela fé, mas também recebeu essa bênção antes de ser circuncidado. Portanto, Abraão é o pai de todos os que, circuncidados ou não (isto é, judeus ou gentios), seguem o exemplo de sua fé (Rm 4.9-12). Se participamos da fé de Abraão, então "Abraão é pai de todos nós, como está escrito: Por pai de muitas nações te constituí" (v. 16,17). Portanto, nem a descendência física de Abraão nem a circuncisão física do judeu tornam a pessoa um verdadeiro filho de Abraão, e sim a fé. Os verdadeiros descendentes de Abraão são os crentes em Jesus Cristo, judeus ou gentios.

Qual é, então, a "terra" que os descendentes de Abraão herdaram? A carta aos Hebreus menciona um "descanso" no qual o povo de Deus entra agora pela fé (Hb 4.3). Numa expressão notável, Paulo menciona que "a Abraão ou a sua descendência coube a promessa de ser herdeiro do mundo" (Rm 4.13). Só podemos presumir que ele quis dizer a mesma coisa quando escreveu aos coríntios, dizendo que em Cristo "tudo é vosso: seja Paulo, seja Apolo, seja Cefas, seja o mundo, seja a vida, seja a morte, sejam as coisas presentes, sejam as futuras, tudo é vosso" (1Co 3.21-23). Os cristãos, pela maravilhosa graça de Deus, são co-herdeiros do Universo com Cristo.

Um ensino semelhante sobre a natureza da bênção prometida e seus beneficiários é apresentado por Paulo em Gálatas 3. Ele explica como Abraão foi justificado pela fé e acrescenta: "Sabei, pois, que os da fé é que são filhos de Abraão" (v. 6-9). Qual é, então, a bênção com a qual todas as nações foram abençoadas (v. 8)? Em uma palavra, é a bênção da salvação. Estávamos sob a maldição da lei, mas Cristo nos remiu, tornando-se maldição em nosso lugar, "para que a bênção de Abraão chegasse aos gentios, em Jesus Cristo, a fim de que recebêssemos, pela fé, o Espírito prometido" (v. 10-14). Cristo tomou sobre si nossa maldição, a fim de que pudéssemos herdar a bênção de Abraão, isto é, a bênção da justificação (v. 8), e a habitação do Espírito Santo (v. 14). Paulo resume essa realidade no versículo 29: "Se sois de Cristo, também sois descendentes de Abraão e herdeiros segundo a promessa".

Mas ainda não terminamos. Temos o terceiro estágio de cumprimento: o que está por vir.

A PROMESSA DE DEUS A ABRAÃO TERÁ UM CUMPRIMENTO FINAL, OU ESCATOLÓGICO, NO DESTINO FINAL DE TODOS OS REDIMIDOS

No livro de Apocalipse, há outra referência à promessa de Deus a Abraão (7.9ss). João vê numa visão uma "grande multidão que ninguém podia enumerar". É uma multidão internacional, vinda "de todas as nações, tribos, povos e línguas". Ela está "em pé diante do trono", o símbolo do Reino de Deus. Isto é, seu Reino chegou finalmente, e a multidão está desfrutando todas as bênçãos de seu afável governo. Ela está abrigada em sua presença. Seus dias de fome, sede e calor no deserto se acabaram. Finalmente, ela entrou na terra prometida, descrita agora não como "uma terra que mana leite e mel", mas como uma terra irrigada com fontes de "água viva", que jamais secarão. Mas como a multidão herdou essas bênçãos? Em parte, porque veio "da grande tribulação" (evidentemente uma referência à vida cristã com todas as suas provações e sofrimentos), mas principalmente porque "lavaram suas vestiduras e as alvejaram no sangue do Cordeiro", isto é, foram purificados do pecado e vestidos de justiça pelos méritos da morte de Jesus Cristo, "razão por que se acham diante do trono de Deus".

É comovente vislumbrar na eternidade futura o cumprimento final dessa antiga promessa de Deus a Abraão. Todos os elementos essenciais da promessa podem ser identificados. Aí estão os descendentes espirituais de Abraão, uma "grande multidão que ninguém podia enumerar", incontáveis como os grãos de areia da praia e as estrelas do céu. Estão aí também "todas as famílias da terra" sendo abençoadas, pois a multidão inumerável é composta de pessoas de todas as nações. Aí está ainda a terra prometida, a saber, todas as ricas bênçãos que fluem do governo cheio da graça de Deus. E, acima de tudo, está Jesus Cristo, a semente de Abraão, que derramou seu sangue por nossa redenção e concede suas bênçãos a todos os que o invocam para serem salvos.

CONCLUSÃO

Iremos resumir o que aprendemos acerca de Deus com base em sua promessa a Abraão e o seu cumprimento, destacando cinco características.

Primeira: ele é o Deus da História. A História não é um fluxo de acontecimentos ao acaso. Deus executa, no devido tempo, o plano que concebeu na eternidade passada e será consumado na eternidade futura. No processo histórico, Jesus Cristo, na qualidade de semente de Abraão, é a figura-chave. Regozijemo-nos pelo fato de que, sendo discípulos de Cristo, somos descendentes de Abraão. Pertencemos à sua linhagem espiritual. Se recebemos as bênçãos da justificação pela fé, a aceitação de Deus e a habitação do Espírito, então somos hoje os beneficiários da promessa feita a Abraão há 4 mil anos.

Segunda: ele é o Deus da aliança. Isto é, Deus é suficientemente bom e afável para fazer promessas, e ele sempre cumpre o que promete. Ele é um Deus de amor e fidelidade contínuos. Preste atenção: nem sempre ele cumpre suas promessas imediatamente. Abraão e Sara "morreram na fé, sem ter obtido as promessas; vendo-as, porém, de longe" (Hb 11.13). Ou seja, embora Isaque lhes nascesse em cumprimento da promessa, a semente do casal ainda não era numerosa, nem eles herdaram a terra, nem as nações haviam sido abençoadas. Todas as promessas de Deus se realizam, mas elas são herdadas "pela fé e pela longanimidade" (Hb 6.12), isto é, pela paciência. Devemos nos contentar em esperar a hora divina.

Terceira: ele é o Deus da bênção. "[Eu] te abençoarei", foi o que disse a Abraão (Gn 12.2). "Deus [...] enviou-o [ Jesus] primeiramente a vós outros para vos abençoar", exclamou Pedro (At 3.26). A atitude de Deus para com seu povo é positiva, construtiva, enriquecedora. O juízo é sua "obra estranha" (Is 28.21). Sua principal obra e característica é abençoar a humanidade com a salvação.

Quarta: ele é o Deus da misericórdia. Sempre recebi muito alento da declaração de Apocalipse 7.9, segundo a qual a multidão dos remidos no céu será "uma grande multidão que ninguém podia enumerar". Não tenho a pretensão de saber como será, uma vez que os cristãos sempre parecem ser uma minoria, mas as Escrituras declaram isso para alento nosso. Embora nenhum cristão bíblico possa ser universalista (crendo que toda a humanidade será finalmente salva), uma vez que as Escrituras ensinam a terrível realidade e a eternidade do inferno, o cristão bíblico pode (e até deve) afirmar que os remidos serão, de algum modo, uma multidão internacional tão imensa que não poderá ser contada. A promessa de Deus será cumprida, e a semente de Abraão será tão numerosa quanto o pó da terra, as estrelas do céu e a areia da praia.

Quinta: ele é o Deus das missões. As nações não são reunidas automaticamente. Se Deus prometeu abençoar "todas as famílias da terra", ele pretendia fazê-lo por meio da descendência de Abraão (Gn 12.3; 22.18). Somos a semente de Abraão pela fé, e as famílias da terra só serão abençoadas se formos a elas com o evangelho. Esse é o propósito explícito de Deus.

Oro para que a expressão "todas as famílias da terra" seja gravada em nosso coração. Ela, mais que qualquer outra, revela o Deus vivo da Bíblia como um Deus missionário. Essa expressão também condena o denominacionalismo mesquinho, o nacionalismo estreito, o orgulho racial (branco ou negro), o paternalismo condescendente e o imperialismo arrogante. Como nos atrevemos a adotar uma atitude hostil, desdenhosa ou mesmo indiferente para com qualquer pessoa de outra cor ou cultura se nosso Deus é o Deus de "todas as famílias da terra"? Precisamos nos tornar cristãos globais, com uma visão global, pois temos um Deus global.

Portanto, que Deus nos ajude a nunca esquecer a antiga promessa de 4 mil anos feita a Abraão: "Em ti e na tua descendência serão abençoadas todas as famílias da terra".

PERGUNTAS PARA ESTUDO

1.De acordo com Stott, por que é importante conhecer a base sobre a qual repousa a missão cristã? Por quais outras razões o conhecimento de tal base é importante?

2.Qual o contexto da promessa feita por Deus a Abraão? Como foi que a promessa de uma terra, de uma posteridade e de uma bênção se cumpriu no passado? Como essa promessa se cumpre no tempo presente? Como a promessa de Deus a Abraão receberá cumprimento fi - nal, no futuro?

NOTA

[cite] J. Jeremias, Jesus' Promise to the Nations (London: SCM Press, 1958), p. 48.

SOBRE O AUTOR

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo extraído de James E. Barney (Org.), You Can Tell the World [Você pode contar ao mundo] (Downers Grove: InterVarsity, 1979). Usado com permissão. O Deus vivo é um Deus missionário$conteudo$
     where curso_id = v_curso and ordem = 2;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 1 · Leitura — Stott, cap. 3: O Deus vivo é um Deus missionário$t$, $conteudo$O DEUS VIVO É UM DEUS MISSIONÁRIO

JOHN R. W. STOTT

3ilhões de pessoas no mundo de hoje são extremamenMte hostis ao empreendimento missionário cristão. Elas o consideram politicamente prejudicial (porque enfraquece os laços que unem a cultura nacional) e religiosamente tacanho (porque reivindica exclusividade para Jesus), enquanto os que se envolvem com missões são tidos como imperialistas arrogantes. O esforço para converter as pessoas a Cristo é visto como uma imperdoável interferência na vida pessoal. "Minha religião é assunto meu", dizem. "Trate de seus próprios negócios e me deixe com os meus."

Portanto, é essencial que os cristãos entendam as bases sobre as quais repousa a missão cristã. Só então seremos capazes de perseverar na tarefa missionária, com coragem e humildade, apesar da incompreensão e oposição do mundo. Mais precisamente, os cristãos bíblicos precisam de estímulos bíblicos, pois cremos que a Bíblia é a revelação de Deus e de sua vontade. Por isso, perguntamos: ele revelou nas Escrituras que a obra missionária é sua vontade para seu povo? Só então ficaremos satisfeitos. Pois então as missões se tornarão uma questão de obediência a Deus, a despeito do que os outros possam pensar ou dizer. Iremos aqui nos concentrar no Antigo Testamento, embora toda a Bíblia seja rica em evidências acerca do propósito missionário de Deus.

A CHAMADA DE ABRAÃO

Nossa história começa cerca de 4 mil anos atrás, com um homem chamado Abraão, ou mais exatamente Abrão, como ele era chamado naquele tempo. Eis a narrativa da chamada de Abraão:

Disse o Senhor a Abrão: Sai da tua terra, da tua parentela e da casa de teu pai e vai para a terra que te mostrarei; de ti farei uma grande nação, e te abençoarei, e te engrandecerei o nome. Sê tu uma bênção! Abençoarei os que te abençoarem e amaldiçoarei os que te amaldiçoarem; em ti serão benditas todas as famílias da terra.

Partiu, pois, Abrão, como lho ordenara o Senhor, e Ló foi com ele. Tinha Abrão setenta e cinco anos quando saiu de Harã (Gn 12.1-4).

Deus fez uma promessa (complexa, conforme veremos) a Abraão, e para entender a Bíblia e a missão cristã é indispensável entender essa promessa. Talvez esses sejam os versículos que melhor resumem a Bíblia. Todo o propósito de Deus encontra-se condensado aqui.

Como introdução, iremos considerar o cenário da promessa de Deus, o contexto no qual ela foi feita. Então dividiremos em dois o restante de nosso estudo. Na primeira parte, destacaremos a promessa, isto é,o que Deus disse que faria. Na segunda parte, analisaremos, de maneira mais extensa, o cumprimento da promessa,ou seja, como Deus a tem cumprido e irá cumpri-la ainda. Comecemos, entretanto, com o cenário.

Gênesis 12 começa assim: "Ora disse o Senhor a Abrão...". Parece uma forma abrupta de começar um novo capítulo. Somos levados a perguntar. "Quem é esse ‘Senhor' que falou a Abrão? Quem é esse ‘Abrão' a quem ele falou?". Eles não são introduzidos no texto abruptamente. Há muita coisa por trás dessas palavras. Elas constituem uma chave que abre o todo das Escrituras. Os 11 capítulos anteriores conduzem a elas. O restante da Bíblia é consequência e cumprimento dessas palavras.

O que, então, existe por trás desse texto? É o seguinte: o "Senhor" que escolheu e chamou Abraão é o mesmo que no começo criou os céus e a terra e atingiu o clímax de sua obra criadora trazendo à existência o homem e a mulher, criaturas únicas feitas à semelhança dele. Jamais devemos esquecer que a Bíblia começa com o Universo, não com o planeta Terra; então, com a Terra, não com a Palestina; depois com Adão, na qualidade de pai da raça humana, não com Abraão, o pai da raça escolhida. Considerando, então, que Deus é o Criador do Universo, da Terra e de toda a humanidade, não devemos nunca rebaixá-lo à condição de divindade tribal ou a de um deus insignificante, como Quemos, deus dos moabitas, ou Milcom (Moloque), deus dos amonitas, ou Baal, o deushomem, ou Astarote, a deusa-mulher dos cananeus. Não devemos supor também que Deus escolheu Abraão e seus descendentes por haver perdido o interesse nos outros povos ou porque desistisse deles. Eleição não é sinônimo de elitismo. Pelo contrário, como veremos logo a seguir, Deus escolheu um homem e sua família, a fim de abençoar por meio deles todas as famílias da terra.

Portanto, ficamos profundamente magoados quando vemos o cristianismo relegado a um capítulo dentro de um livro sobre as religiões do mundo, como se fosse uma opção entre muitas, ou quando alguém faz referência ao "Deus cristão", como se houvesse outros! Não, existe apenas um único Deus vivo e verdadeiro, que se revelou totalmente e, por fim, em seu único Filho Jesus Cristo. O monoteísmo jaz no alicerce das missões, como Paulo escreveu a Timóteo: "Há um só Deus e um só Mediador entre Deus e os homens, Cristo Jesus, homem" (1Tm 2.5).

O registro de Gênesis prossegue desde a criação de todas as coisas pelo Deus único e dos seres humanos conforme a semelhança divina, até nossa rebeldia contra nosso Criador e o julgamento de Deus sobre suas criaturas rebeldes. Esse julgamento, entretanto, é atenuado pela primeira promessa evangélica de que um dia a semente da mulher "pisaria" — na realidade "esmagaria" — a cabeça da serpente (3.15).

Os oito capítulos seguintes (Gn 4—11) descrevem os resultados devastadores da Queda: a alienação progressiva dos seres humanos em relação a Deus e aos outros seres humanos. Esse foi o cenário no qual Deus chamou e fez a promessa a Abraão. Tudo à volta era deterioração moral, trevas e dispersão. A sociedade se desintegrava cada vez mais. Todavia, Deus, o Criador, não abandonou os seres humanos que criara à sua semelhança (Gn 9.6). Dessa constante impiedade, ele chamou um homem e sua família e prometeu abençoar não apenas a eles, mas, por meio deles, a todo o mundo. A dispersão não continuaria descontroladamente: um grande processo de reunião estava começando.

A PROMESSA

Qual foi, então, a promessa que Deus fez a Abraão? Foi uma promessa complexa que consistia de diversas outras promessas.

Primeira: a promessa de uma posteridade. Ele devia deixar sua parentela e a casa de seu pai e, em troca da perda da família, Deus faria dele "uma grande nação". Mais tarde, para indicar isso, Deus mudou o nome do patriarca de "Abrão" ("pai exaltado") para "Abraão" ("pai de uma multidão") e lhe disse: "Por pai de numerosas nações te constituí" (Gn 17.5).

Segunda: a promessa de uma terra. Parece que o chamado divino veio em duas etapas. Primeiramente, em Ur dos caldeus, quando o pai de Abraão ainda vivia (11.31; 15.7), e depois em Harã, após da morte de seu pai (11.32; 12.1). De qualquer modo, ele devia deixar sua terra natal, e, em troca, Deus lhe mostraria outra.

Terceira: a promessa de uma bênção. Cinco vezes as palavras "bênção" e "abençoar"aparecem em 12.2,3. A bênção que Deus prometeu a Abraão transbordaria sobre toda a humanidade.

Uma posteridade, uma terra e uma bênção. Cada uma dessas promessas é desenvolvida nos capítulos que se seguem à chamada de Abraão.

Em primeiro lugar, a terra. Depois que Abraão generosamente permitiu que seu sobrinho Ló escolhesse onde queria se estabelecer (Ló escolheu o fértil vale do Jordão), Deus disse ao patriarca: "Ergue os olhos e olha desde onde estás para o norte, para o sul, para o oriente e para o ocidente; porque toda essa terra que vês, eu ta darei, a ti e à tua descendência, para sempre" (13.14,15).

Em segundo lugar, a posteridade. Um pouco mais tarde, Deus apresentou a Abraão outro recurso ilustrativo, convidando-o agora a olhar não para a terra, mas para o céu. Numa noite escura e desanuviada, Deus levou-o para fora de sua tenda e ordenou-lhe: "Olha para os céus e conta as estrelas". Que ordem ridícula! Talvez Abraão tivesse começado: "Uma, duas, três, cinco, dez, vinte, trinta...", mas deve ter desistido logo. Era uma tarefa impossível. Então Deus lhe disse: "Será assim tua posteridade". E lemos. "Ele creu no Senhor". Embora provavelmente já estivesse com mais de 80 anos de idade e ele e Sara não tivessem filhos ainda, Abraão creu na promessa de Deus, "e isso lhe foi imputado para justiça" por Deus. Isto é, pelo fato de ele haver confiado em Deus, O Senhor o aceitou como justo.

Em terceiro lugar, a bênção. "[Eu] te abençoarei" — Deus já havia aceitado Abraão como justo ou, tomando emprestada a expressão neotestamentária, "justificado pela fé". Não podemos imaginar bênção maior. É a bênção fundamental da aliança da graça, a qual alguns anos mais tarde Deus esmiuçaria para Abraão: "Estabelecerei a minha aliança entre mim e ti e a tua descendência [...] aliança perpétua, para ser o teu Deus e da tua descendência. [...] e serei o seu Deus" (17.7,8). Deus instituiu a circuncisão como sinal exterior e visível da aliança da graça ou como penhor de que era o seu Deus. É a primeira vez nas Escrituras que ouvimos a fórmula da aliança, repetida muitas vezes mais tarde: "Eu serei o seu Deus, e eles serão o meu povo".

"Uma terra, uma posteridade, uma bênção: mas que relação tem tudo isso com missões?", talvez você se pergunte, impaciente. Minha resposta é: "Tudo! Seja um pouco mais paciente e verá". Passemos agora da promessa para o cumprimento.

O CUMPRIMENTO DA PROMESSA

Toda a questão do cumprimento das profecias do Antigo Testamento apresenta dificuldades, havendo sempre muitos mal-entendidos e quase nenhum acordo. De importância particular é o princípio, com o qual acho que todos concordamos, de que os autores do Novo Testamento entendiam que a profecia do Antigo Testamento não tinha um único cumprimento,mas que em geral era triplo — passado, presente e futuro. O cumprimento passado fora imediato, ou histórico, na vida da nação de Israel. O cumprimento presente era intermediário, ou evangélico, em Cristo e sua Igreja. O cumprimento futuro será final, ou escatológico, no novo céu e na nova terra.

A PROMESSA DE DEUS A ABRAÃO TEVE CUMPRIMENTO HISTÓRICO IMEDIATO EM SEUS DESCENDENTES CARNAIS, O POVO DE ISRAEL

A promessa de uma posteridade numerosa, realmente incontável, feita por Deus a Abraão foi confirmada ao seu filho Isaque (26.4, "como as estrelas dos céus") e ao seu neto Jacó (32.12, "como a areia do mar"). A promessa, aos poucos, começou a se cumprir literalmente. Talvez devêssemos examinar algumas das etapas desse desenvolvimento.

A primeira etapa refere-se aos anos de escravidão no Egito, dos quais se escreveu: "Os filhos de Israel foram fecundos, e aumentaram muito, e se multiplicaram, e grandemente se fortaleceram, de maneira que a terra se encheu deles" (Êx 1.7; comp. com At 7.17). A etapa seguinte ocorreu centenas de anos mais tarde, quando o rei Salomão declarou que Israel era um "povo grande, tão numeroso, que se não pode contar" (1Rs 3.8). A terceira etapa teve lugar cerca de 350 anos depois de Salomão. Jeremias advertiu Israel do juízo e do cativeiro iminentes e, então, acrescentou esta promessa divina de restauração: "Como não se pode contar o exército dos céus, nem medir-se a areia do mar, assim tornarei incontável a descendência de Davi, meu servo" ( Jr 33.22).

Tudo isso diz respeito à posteridade de Abraão: e o que dizer da terra? Mais uma vez, observamos com atitude de adoração e gratidão a fidelidade de Deus à sua promessa, pois foi lembrando sua promessa a Abraão, a Isaque e a Jacó que Deus libertou seu povo da escravidão no Egito e lhe deu o território que nessa narrativa é chamado "terra prometida" (Êx 2.24; 3.6; 32.13). Então, cerca de 700 anos depois, trouxe-os de volta a essa terra, após o cativeiro na Babilônia. Não obstante, nem Abraão nem seus descendentes físicos herdaram totalmente a terra. Como diz Hebreus 11, eles "morreram na fé, sem ter obtido as promessas". Pelo contrário, como "estrangeiros e peregrinos sobre a terra", eles aguardavam "a cidade que tem fundamentos, da qual Deus é o arquiteto e edifi - cador" (Hb 11.8-16,39,40).

Deus cumpriu suas promessas sobre a posteridade e a terra, pelo menos parcialmente. E as bênçãos? Bem, no Sinai, Deus confirmou e esclareceu sua aliança com Abraão e se comprometeu a ser o Deus de Israel (v. Êx. 19.3-6). No restante do Antigo Testamento, Deus continuou abençoando os obedientes, enquanto os desobedientes caíram sob seu juízo.

Talvez o exemplo mais dramático esteja no início da profecia de Oseias, na qual ele é orientado a dar a seus três filhos nomes que indicam o juízo divino, horrível e progressivo que se abaterá sobre Israel. Seu primogênito (um menino) foi chamado Jezreel, que significa "Deus dispersará". Depois nasceu uma menina, LoRuama (arc), ou seja, Desfavorecida, pois Deus declarou que não teria mais piedade nem perdoaria seu povo. Finalmente, Oseias teve outro filho, Lo-Ami (arc), isto é, Não-Meu-Povo, pois Deus disse que eles não eram mais seu povo. Que nomes terríveis para o povo escolhido de Deus! Parece uma devastadora contradição da promessa eterna de Deus a Abraão.

Contudo, Deus não parou aí. Além do iminente juízo, haveria uma restauração, afirmada em palavras que mais uma vez fazem eco à promessa feita a Abraão: "Todavia, o número dos filhos de Israel será como a areia do mar, que se não pode medir, nem contar" (Os 1.10). Assim, o juízo implícito nos nomes dos filhos de Oseias seria invertido. Haverá um ajuntamento, em vez de dispersão ( Jezreel é uma palavra ambígua e também pode ter esse significado). Desfavorecida será favorecida, e Não-MeuPovo se transformará em "filhos do Deus vivo" (1.10—2.1).

É maravilhoso que os apóstolos Paulo e Pedro citassem esses versículos de Oseias. Eles viram seu cumprimento não apenas numa futura multiplicação de Israel, mas na inclusão dos gentios na comunidade de Jesus. "Antes, não éreis povo, mas, agora, sois povo de Deus, que não tínheis alcançado misericórdia, mas, agora, alcançastes misericórdia" (1Pe 2.9,10; v. Rm 9.25,26).

Essa perspectiva do Novo Testamento é essencial quando lemos as profecias do Antigo Testamento, pois o que sentimos faltar no Antigo Testamento é uma explicação clara acerca de como a prometida bênção de Deus transbordaria de Abraão e seus descendentes para "todas as famílias da terra". Embora Israel seja descrito como "luz" para as nações e tenha a missão de levar a justiça a todos os povos (Is 42.1-4,6; 49.6), não é o que vemos acontecendo. Só no Senhor Jesus que essas profecias são cumpridas, pois apenas no seu Dia é que as nações são de fato incluídas na comunidade dos remidos. É para isso que nos voltamos agora.

A PROMESSA DE DEUS A ABRAÃO RECEBE CUMPRIMENTO INTERMEDIÁRIO, OU EVANGÉLICO, EM CRISTO E SUA IGREJA

"Abraão" é quase a primeira palavra do Novo Testamento, pois o evangelho de Mateus começa assim: "Livro da genealogia de Jesus Cristo, filho de Davi, filho de Abraão. Abraão gerou a Isaque...". Portanto, Mateus relaciona com Abraão não só o começo da genealogia, mas também o início do evangelho de Jesus Cristo. Ele sabe que está registrando o cumprimento das antigas promessas de Deus a Abraão, feitas cerca de 2 mil anos antes (v. Lc 1.45- 55,67-76).

Desde o começo, porém, Mateus reconhece que não é simplesmente a descendência física de Abraão que qualifica o ser humano a herdar as promessas, mas uma descendência espiritual, isto é, o arrependimento e a fé no Messias que havia de vir. Esta era a mensagem de João Batista às multidões que se ajuntavam para ouvi-lo: "Não comeceis a dizer entre vós mesmos: Temos por pai a Abraão; porque eu vos afirmo que destas pedras Deus pode suscitar filhos a Abraão" (Mt 3.9; v. Lc 3.9; Jo 8.33-40). As implicações de suas palavras devem ter assustado seus ouvintes, uma vez que "era crença generalizada que nenhum dos descendentes de Abraão se perderia".

Deus suscitou filhos a Abraão não de pedras, mas de uma fonte igualmente improvável, isto é, dos gentios! Portanto, Mateus, embora seja o mais judeu dos quatro escritores dos evangelhos, ele registra estas palavras de Jesus: "Digo-vos que muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus. Ao passo que os filhos do reino serão lançados para fora, nas trevas" (Mt 8.11,12; v. Lc 13.28,29).

É difícil imaginar o choque, a total confusão que essas palavras devem ter causado entre os ouvintes judeus de João Batista e Jesus. Eles eram descendentes de Abraão, portanto eles tinham direito às promessas que Deus fizera a Abraão. Quem eram, então, aqueles estranhos que iriam participar das promessas, aparentemente até usurpá-las, enquanto eles próprios seriam desqualificados? Os judeus ficaram indignados. Eles haviam esquecido completamente que a aliança de Deus com Abraão continha a promessa de um transbordamento de bênçãos sobre todas as nações da terra. Agora os judeus tinham de entender que era por meio Jesus, o Messias, ele próprio semente de Abraão, que todas as nações seriam abençoadas.

Parece que o apóstolo Pedro pelo menos começou a perceber essa realidade em seu segundo sermão após o Pentecostes. Ele se dirigiu a uma multidão de judeus com estas palavras: "Vós sois os filhos dos profetas e da aliança que Deus estabeleceu com vossos pais, dizendo a Abraão: Na tua descendência, serão abençoadas todas as nações da terra. Tendo Deus ressuscitado o seu Servo, enviou-o primeiramente a vós outros para vos abençoar, no sentido de que cada um se aparte das suas perversidades" (At 3.25,26). É uma declaração muito notável porque interpreta a bênção em termos morais de arrependimento e justiça, porque, se Jesus foi enviado "primeiro" aos judeus, ele foi presumivelmente enviado depois aos gentios, às "famílias da terra" que estavam "longe" (v. At 2.39), mas agora participariam das bênçãos.

Foi concedido ao apóstolo Paulo desenvolver plenamente esse maravilhoso tema. Ele foi chamado e designado para ser o apóstolo dos gentios, e a ele foi revelado o propósito eterno — e até então secreto — de Deus: tornar os judeus e os gentios "co-herdeiros, membros do mesmo corpo e coparticipantes da promessa em Cristo Jesus por meio do evangelho" (Ef 3.6).

Negativamente, Paulo declara com grande ousadia: "Nem todos os de Israel são, de fato, israelitas; nem por serem descendentes de Abraão são todos seus filhos" (Rm 9.6,7).

Quem são, então, os verdadeiros descentes de Abraão, os verdadeiros beneficiados pelas promessas de Deus? Paulo não deixa nenhuma dúvida. São os crentes em Cristo, de qualquer raça. Em Romanos 4, ele destaca que Abraão não só foi justificado pela fé, mas também recebeu essa bênção antes de ser circuncidado. Portanto, Abraão é o pai de todos os que, circuncidados ou não (isto é, judeus ou gentios), seguem o exemplo de sua fé (Rm 4.9-12). Se participamos da fé de Abraão, então "Abraão é pai de todos nós, como está escrito: Por pai de muitas nações te constituí" (v. 16,17). Portanto, nem a descendência física de Abraão nem a circuncisão física do judeu tornam a pessoa um verdadeiro filho de Abraão, e sim a fé. Os verdadeiros descendentes de Abraão são os crentes em Jesus Cristo, judeus ou gentios.

Qual é, então, a "terra" que os descendentes de Abraão herdaram? A carta aos Hebreus menciona um "descanso" no qual o povo de Deus entra agora pela fé (Hb 4.3). Numa expressão notável, Paulo menciona que "a Abraão ou a sua descendência coube a promessa de ser herdeiro do mundo" (Rm 4.13). Só podemos presumir que ele quis dizer a mesma coisa quando escreveu aos coríntios, dizendo que em Cristo "tudo é vosso: seja Paulo, seja Apolo, seja Cefas, seja o mundo, seja a vida, seja a morte, sejam as coisas presentes, sejam as futuras, tudo é vosso" (1Co 3.21-23). Os cristãos, pela maravilhosa graça de Deus, são co-herdeiros do Universo com Cristo.

Um ensino semelhante sobre a natureza da bênção prometida e seus beneficiários é apresentado por Paulo em Gálatas 3. Ele explica como Abraão foi justificado pela fé e acrescenta: "Sabei, pois, que os da fé é que são filhos de Abraão" (v. 6-9). Qual é, então, a bênção com a qual todas as nações foram abençoadas (v. 8)? Em uma palavra, é a bênção da salvação. Estávamos sob a maldição da lei, mas Cristo nos remiu, tornando-se maldição em nosso lugar, "para que a bênção de Abraão chegasse aos gentios, em Jesus Cristo, a fim de que recebêssemos, pela fé, o Espírito prometido" (v. 10-14). Cristo tomou sobre si nossa maldição, a fim de que pudéssemos herdar a bênção de Abraão, isto é, a bênção da justificação (v. 8), e a habitação do Espírito Santo (v. 14). Paulo resume essa realidade no versículo 29: "Se sois de Cristo, também sois descendentes de Abraão e herdeiros segundo a promessa".

Mas ainda não terminamos. Temos o terceiro estágio de cumprimento: o que está por vir.

A PROMESSA DE DEUS A ABRAÃO TERÁ UM CUMPRIMENTO FINAL, OU ESCATOLÓGICO, NO DESTINO FINAL DE TODOS OS REDIMIDOS

No livro de Apocalipse, há outra referência à promessa de Deus a Abraão (7.9ss). João vê numa visão uma "grande multidão que ninguém podia enumerar". É uma multidão internacional, vinda "de todas as nações, tribos, povos e línguas". Ela está "em pé diante do trono", o símbolo do Reino de Deus. Isto é, seu Reino chegou finalmente, e a multidão está desfrutando todas as bênçãos de seu afável governo. Ela está abrigada em sua presença. Seus dias de fome, sede e calor no deserto se acabaram. Finalmente, ela entrou na terra prometida, descrita agora não como "uma terra que mana leite e mel", mas como uma terra irrigada com fontes de "água viva", que jamais secarão. Mas como a multidão herdou essas bênçãos? Em parte, porque veio "da grande tribulação" (evidentemente uma referência à vida cristã com todas as suas provações e sofrimentos), mas principalmente porque "lavaram suas vestiduras e as alvejaram no sangue do Cordeiro", isto é, foram purificados do pecado e vestidos de justiça pelos méritos da morte de Jesus Cristo, "razão por que se acham diante do trono de Deus".

É comovente vislumbrar na eternidade futura o cumprimento final dessa antiga promessa de Deus a Abraão. Todos os elementos essenciais da promessa podem ser identificados. Aí estão os descendentes espirituais de Abraão, uma "grande multidão que ninguém podia enumerar", incontáveis como os grãos de areia da praia e as estrelas do céu. Estão aí também "todas as famílias da terra" sendo abençoadas, pois a multidão inumerável é composta de pessoas de todas as nações. Aí está ainda a terra prometida, a saber, todas as ricas bênçãos que fluem do governo cheio da graça de Deus. E, acima de tudo, está Jesus Cristo, a semente de Abraão, que derramou seu sangue por nossa redenção e concede suas bênçãos a todos os que o invocam para serem salvos.

CONCLUSÃO

Iremos resumir o que aprendemos acerca de Deus com base em sua promessa a Abraão e o seu cumprimento, destacando cinco características.

Primeira: ele é o Deus da História. A História não é um fluxo de acontecimentos ao acaso. Deus executa, no devido tempo, o plano que concebeu na eternidade passada e será consumado na eternidade futura. No processo histórico, Jesus Cristo, na qualidade de semente de Abraão, é a figura-chave. Regozijemo-nos pelo fato de que, sendo discípulos de Cristo, somos descendentes de Abraão. Pertencemos à sua linhagem espiritual. Se recebemos as bênçãos da justificação pela fé, a aceitação de Deus e a habitação do Espírito, então somos hoje os beneficiários da promessa feita a Abraão há 4 mil anos.

Segunda: ele é o Deus da aliança. Isto é, Deus é suficientemente bom e afável para fazer promessas, e ele sempre cumpre o que promete. Ele é um Deus de amor e fidelidade contínuos. Preste atenção: nem sempre ele cumpre suas promessas imediatamente. Abraão e Sara "morreram na fé, sem ter obtido as promessas; vendo-as, porém, de longe" (Hb 11.13). Ou seja, embora Isaque lhes nascesse em cumprimento da promessa, a semente do casal ainda não era numerosa, nem eles herdaram a terra, nem as nações haviam sido abençoadas. Todas as promessas de Deus se realizam, mas elas são herdadas "pela fé e pela longanimidade" (Hb 6.12), isto é, pela paciência. Devemos nos contentar em esperar a hora divina.

Terceira: ele é o Deus da bênção. "[Eu] te abençoarei", foi o que disse a Abraão (Gn 12.2). "Deus [...] enviou-o [ Jesus] primeiramente a vós outros para vos abençoar", exclamou Pedro (At 3.26). A atitude de Deus para com seu povo é positiva, construtiva, enriquecedora. O juízo é sua "obra estranha" (Is 28.21). Sua principal obra e característica é abençoar a humanidade com a salvação.

Quarta: ele é o Deus da misericórdia. Sempre recebi muito alento da declaração de Apocalipse 7.9, segundo a qual a multidão dos remidos no céu será "uma grande multidão que ninguém podia enumerar". Não tenho a pretensão de saber como será, uma vez que os cristãos sempre parecem ser uma minoria, mas as Escrituras declaram isso para alento nosso. Embora nenhum cristão bíblico possa ser universalista (crendo que toda a humanidade será finalmente salva), uma vez que as Escrituras ensinam a terrível realidade e a eternidade do inferno, o cristão bíblico pode (e até deve) afirmar que os remidos serão, de algum modo, uma multidão internacional tão imensa que não poderá ser contada. A promessa de Deus será cumprida, e a semente de Abraão será tão numerosa quanto o pó da terra, as estrelas do céu e a areia da praia.

Quinta: ele é o Deus das missões. As nações não são reunidas automaticamente. Se Deus prometeu abençoar "todas as famílias da terra", ele pretendia fazê-lo por meio da descendência de Abraão (Gn 12.3; 22.18). Somos a semente de Abraão pela fé, e as famílias da terra só serão abençoadas se formos a elas com o evangelho. Esse é o propósito explícito de Deus.

Oro para que a expressão "todas as famílias da terra" seja gravada em nosso coração. Ela, mais que qualquer outra, revela o Deus vivo da Bíblia como um Deus missionário. Essa expressão também condena o denominacionalismo mesquinho, o nacionalismo estreito, o orgulho racial (branco ou negro), o paternalismo condescendente e o imperialismo arrogante. Como nos atrevemos a adotar uma atitude hostil, desdenhosa ou mesmo indiferente para com qualquer pessoa de outra cor ou cultura se nosso Deus é o Deus de "todas as famílias da terra"? Precisamos nos tornar cristãos globais, com uma visão global, pois temos um Deus global.

Portanto, que Deus nos ajude a nunca esquecer a antiga promessa de 4 mil anos feita a Abraão: "Em ti e na tua descendência serão abençoadas todas as famílias da terra".

PERGUNTAS PARA ESTUDO

1.De acordo com Stott, por que é importante conhecer a base sobre a qual repousa a missão cristã? Por quais outras razões o conhecimento de tal base é importante?

2.Qual o contexto da promessa feita por Deus a Abraão? Como foi que a promessa de uma terra, de uma posteridade e de uma bênção se cumpriu no passado? Como essa promessa se cumpre no tempo presente? Como a promessa de Deus a Abraão receberá cumprimento fi - nal, no futuro?

NOTA

[cite] J. Jeremias, Jesus' Promise to the Nations (London: SCM Press, 1958), p. 48.

SOBRE O AUTOR

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo extraído de James E. Barney (Org.), You Can Tell the World [Você pode contar ao mundo] (Downers Grove: InterVarsity, 1979). Usado com permissão. O Deus vivo é um Deus missionário$conteudo$, 2);
  end if;

  if exists (select 1 from aulas where curso_id = v_curso and ordem = 3) then
    update aulas
       set titulo = $t$Lição 1 · Leitura — Stott, cap. 1: A Bíblia na evangelização do mundo$t$,
           conteudo = $conteudo$A BÍBLIA NA EVANGELIZAÇÃO DO MUNDO

JOHN R. W. STOTT

1em a Bíblia, a evangelização do mundo seria não apenas imSpossível, mas também inconcebível. A Bíblia impõe-nos a responsabilidade de evangelizar o mundo, dá-nos um evangelho a proclamar, diz-nos como fazê-lo e declara-se o poder de Deus para a salvação de cada crente.

Além disso, é fato notável, na história passada e contemporânea, que o grau de compromisso da Igreja com a evangelização do mundo é proporcional ao grau de sua convicção da autoridade da Bíblia. Sempre que o cristão perde a confiança na Bíblia, seu zelo pela evangelização acaba se esvaindo. Inversamente, se ele estiver convencido acerca da Bíblia, estará também determinado a evangelizar.

Destaco a seguir quatro razões por que a Bíblia é indispensável à evangelização do mundo.

O MANDATO DA EVANGELIZAÇÃO MUNDIAL

Em primeiro lugar, a Bíblia nos dá o mandato da evangelização do mundo. Sem dúvida, precisamos de uma incumbência. Dois fenômenos estão ocorrendo em toda parte: o fanatismo religioso e o pluralismo religioso. O fanatismo caracteriza-se por um zelo irracional que, se pudesse, usaria a força para obrigar a crença e erradicar a incredulidade. O pluralismo religioso incentiva a tendência oposta.

Sempre que o espírito do fanatismo religioso ou de seu oposto, o indiferentismo, prevalece, a evangelização do mundo é profundamente prejudicada. Os fanáticos recusam-se a tolerar o rival representado pelo evangelismo, e os pluralistas rejeitam suas reivindicações exclusivas. O evangelista cristão é considerado um intruso, alguém que sem motivo se intromete nos negócios alheios.

Diante dessa oposição, precisamos esclarecer que o mandato bíblico não se limita à Grande Comissão (por mais importante que seja esta), mas abrange toda a revelação bíblica. Vou recordála rapidamente.

Existe um único Deus vivo e verdadeiro, o Criador do Universo, o Senhor das nações e o Deus de toda carne. Há cerca de 4 mil anos, Deus chamou Abraão e fez uma aliança com ele, prometendo não apenas abençoá-lo, mas também abençoar, por meio da posteridade do patriarca, todas as famílias da terra (Gn 12. l-4). Esse texto bíblico é uma das pedras fundamentais da missão cristã, pois os descendentes de Abraão (por meio de quem todas as nações estão sendo abençoadas) são Cristo e o povo de Cristo. Se pela fé pertencemos a Cristo, somos filhos espirituais de Abraão e temos uma responsabilidade para com a raça humana. Assim, também os profetas do Antigo Testamento profetizaram que Deus faria desse Cristo o herdeiro e a luz das nações (Sl 2.8; Is 42.6; 49.6).

Quando Jesus veio, ele endossou essas promessas. É verdade que durante seu ministério terreno ele ficou restrito "às ovelhas perdidas da casa de Israel" (Mt 10.6; 15.24), contudo, ele profetizou que "muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus" (Mt 8.11; Lc 13.29). Mais ainda, prevendo sua ressurreição e ascensão, ele deu este fantástico testemunho acerca de si mesmo: "Toda a autoridade me foi dada no céu e na terra" (Mt 28.18). Foi em consequência de sua autoridade universal que ele ordenou aos seus seguidores que fizessem discípulos de todas as nações, batizando-os na nova comunidade e ensinando a todos sua doutrina (Mt 28.19).

Isso os cristãos primitivos começaram a fazer quando o Espírito Santo da verdade e do poder desceu sobre eles. Eles se tornaram testemunhas de Jesus até os confins da terra (At 1.8), e o faziam "por amor do seu nome" (Rm 1.5; 3Jo 7). Eles sabiam que Deus havia superexaltado a Jesus, entronizando-o à sua direita e concedendo-lhe a mais alta posição, a fim de que toda língua confessasse seu senhorio. Eles queriam que Jesus recebesse a honra devida ao seu nome. Além disso, um dia ele retornará em glória, para salvar, julgar e reinar. Portanto, o que deveria preencher o espaço entre as duas vindas? A missão mundial da Igreja! O fim da História só viria depois que o evangelho alcançasse os confins da terra (comp. Mt 24.14 com 28.20; At 1.8). Os dois fins iriam coincidir.

Nosso mandato para a evangelização do mundo, portanto, é a Bíblia inteira. Deve ser encontrado na criação de Deus, porque todos os seres humanos são responsáveis diante dele; no caráter de Deus, transcendente, amoroso, compassivo, não desejando que ninguém pereça, mas que todos venham ao arrependimento; nas promessas de Deus, que todas as nações sejam benditas por meio da semente de Abraão e venham a ser a herança do Messias; no Cristo de Deus, agora exaltado com autoridade universal, para receber aclamação universal; no Espírito de Deus, que convence do pecado, dá testemunho de Cristo e impele a Igreja a evangelizar; na Igreja de Deus, que é uma comunidade missionária multinacional, com ordens de evangelizar até que Cristo volte.

A dimensão global da missão cristã é irresistível. O cristão individual e as igrejas locais que não se comprometem com a evangelização do mundo estão contradizendo, por cegueira ou por desobediência, uma parte essencial de sua identidade, a qual provém de Deus. O mandato bíblico para a evangelização do mundo não pode ser ignorado.

A MENSAGEM DA EVANGELIZAÇÃO MUNDIAL

Em segundo lugar, a Bíblia nos disponibiliza a mensagem para a evangelização do mundo. O Pacto de Lausanne define o evangelismo em termos de evangelho. O parágrafo 4 declara: "Evangelizar é difundir as boas novas de que Jesus Cristo morreu por nossos pecados e ressuscitou segundo as Escrituras, e de que, como Senhor e Rei, ele agora oferece o perdão dos pecados e o dom libertador do Espírito a todos os que se arrependem e creem".

Nossa mensagem vem da Bíblia, mas quando a buscamos nas Escrituras, imediatamente deparamos com um dilema. De um lado, a mensagem nos é outorgada. Não temos permissão de inventá-la. Ela nos foi confiada como um "depósito" precioso, que nós, como servos fiéis, devemos guardar e distribuir na Casa de Deus (1Tm 6.20; 2Tm 1.12-14; 2Co 4.1,2). Por outro lado, não nos foi dada como uma fórmula matemática simples e exata, e sim numa rica diversidade de formulações nas quais foram usadas imagens ou metáforas diferentes.

Portanto, existe apenas um evangelho, no que todos os apóstolos concordam (1Co 15.1), e Paulo podia invocar a maldição de Deus sobre qualquer um, inclusive ele próprio, que pregasse um evangelho "diferente" do evangelho apostólico original da graça de Deus (Gl 1.6-8). No entanto, os apóstolos expressaram esse evangelho único de diversos modos: sacrifical (o derramamento e a aspersão do sangue de Cristo); messiânico (o surgimento do governo prometido por Deus); legal (o juiz pronunciando a justificação do injusto); pessoal (o Pai reconciliando seus filhos desviados); salvífico (o Libertador celestial que veio para resgatar os desamparados); cósmico (o Senhor universal reivindicando domínio universal) — e esses são apenas alguns exemplos.

O evangelho é assim visto como único e, ao mesmo tempo, como diversificado. Ele é "dado" e, ao mesmo tempo, é culturalmente adaptado à sua audiência. Uma vez que percebamos isso, seremos poupados de cometer dois erros opostos. Ao primeiro chamarei "fluidez total". Certa vez, ouvi um líder de igreja inglês declarar que não existe coisa tal como o evangelho até que estejamos na situação de dar nosso testemunho. Não levamos nada conosco nessa situação, ele disse. Descobrimos o evangelho apenas quando chegamos lá. Concordo plenamente com a necessidade de ser sensível em cada situação, mas, se esse era o ponto que o líder em questão desejava defender, ele o exagerou grosseiramente. Existe uma coisa tal como o evangelho revelado, ou dado, que não temos liberdade para falsificar.

Ao erro oposto chamarei "rigidez total". Nesse caso, o evangelista se comporta como se Deus tivesse outorgado algumas fórmulas precisas, que temos de repetir mais ou menos palavra por palavra, e certas imagens, que devemos empregar invariavelmente. Isso nos torna escravos de palavras ou de imagens, ou de ambas. Alguns evangelistas fracassam por usar uma linguagem antiquada, enquanto outros se sentem obrigados a mencionar a toda hora "o sangue de Cristo", "a justificação pela fé", "o Reino de Deus" ou qualquer outra imagem.

Entre esses dois extremos, há um terceiro e melhor caminho. Ele combina o compromisso com o fato da revelação e com a tarefa da contextualização. Aceita como permanentemente normativas apenas as formulações bíblicas do evangelho e entende que cada tentativa de proclamar o evangelho na linguagem moderna deve justificar-se como expressão autêntica do evangelho bíblico.

Contudo, se ele se recusa a se desfazer das formulações bíblicas, também recusará recitálas de maneira inexpressiva e sem imaginação. Em vez disso, temos de nos ocupar da luta contínua, por meio da oração, do estudo e da discussão, para relacionar o evangelho recebido com determinada situação. Uma vez que ele vem de Deus, devemos preservá-lo; uma vez que se destina aos homens e mulheres dos tempos modernos, temos de interpretá-lo. Temos de combinar fidelidade (pelo estudo constante do texto bíblico) com sensibilidade (pela observação constante do cenário contemporâneo). Só então teremos condições de relacionar, com fidelidade e relevância, a Palavra com o mundo, o evangelho com o contexto, as Escrituras com a cultura.

O MODELO PARA A EVANGELIZAÇÃO MUNDIAL

Em terceiro lugar, a Bíblia nos fornece o modelo para a evangelização do mundo. Além da mensagem (o que temos de dizer), precisamos de um modelo (como dizer). A Bíblia supre isto também. Ela não apenas contém o evangelho: ela é o evangelho. Por meio da Bíblia o próprio Deus está evangelizando, isto é, comunicando as boas novas ao mundo. Você deve estar lembrado da declaração de Paulo acerca de Gênesis 12.3, segundo a qual "a Escritura [...] preanunciou o evangelho a Abraão" (Gl 3.8). Toda a Escritura prega o evangelho. Deus evangeliza por meio dela.

Se, portanto, as Escrituras são a evangelização divina, é evidente que podemos aprender a pregar o evangelho, considerando como Deus o fez. Ele nos proporcionou, no processo da inspiração bíblica, um belo modelo evangelístico.

O que de imediato nos surpreende é a grandeza da condescendência de Deus. Ele tem uma verdade sublime para revelar acerca de si mesmo e de seu Cristo, sua misericórdia, sua justiça e sua total salvação. Ele escolheu fazer essa revelação pelo emprego do vocabulário e da gramática da língua humana, de seres humanos, de imagens humanas e de culturas humanas.

Contudo, por meio desse humilde recurso de palavras e imagens humanas, Deus falava as palavras dele. A doutrina evangélica da inspiração das Escrituras enfatiza sua dupla autoria. Homens falaram, e Deus falou. Homens falaram de Deus (2Pe 1.21), e Deus falou por intermédio de homens (Hb 1.1). As palavras faladas e escritas eram de Deus e também deles. Ele decidiu o que queria dizer, mas não sufocou a personalidade humana. Eles usaram suas faculdades livremente, mas não distorceram a mensagem divina. Os cristãos desejam declarar algo semelhante sobre a encarnação, o clímax da autocomunicação de Deus: "O Verbo se fez carne" ( Jo 1.14). Isto é, a Palavra eterna de Deus, que desde a eternidade estava com Deus e era Deus, o Agente através do qual o Universo foi criado, tornou-se um ser humano, com todas as características de um judeu palestino do primeiro século. Ele se tornou pequeno, fraco, pobre e vulnerável. Ele experimentou a dor e a fome e se expôs à tentação. Tudo isso fazia parte da "carne", isto é, do ser humano que ele se tornou. Tornando-se um de nós, porém, não deixou de ser ele mesmo. Cristo continuou sendo o Verbo eterno, isto é, o Filho eterno de Deus.

Essencialmente, o mesmo princípio é ilustrado pela inspiração das Escrituras e pela encarnação do Filho. O Verbo se fez carne. O divino foi comunicado pelo humano. Deus se identificou conosco, embora não renunciasse à sua identidade, e esse princípio de "identificação sem perda de identidade" é o modelo para toda a evangelização, especialmente a evangelização transcultural.

Alguns de nós se recusam a identificar-se com o povo que alegam servir. Continuamos sendo nós mesmos e não nos tornamos iguais a eles. Permanecemos afastados. Agarramo-nos desesperadamente à nossa herança cultural, com base na concepção errônea de que é parte indispensável de nossa identidade. Não queremos perdê-la e não apenas mantemos nossas práticas culturais com tenacidade feroz, como também tratamos a herança cultural da terra de nossa adoção sem o respeito que merece. Assim, praticamos um duplo tipo de imperialismo cultural, impondo nossa cultura a outros e desprezando a deles. Não foi esse, porém, o procedimento de Cristo, que se esvaziou de sua glória e se humilhou para poder servir.

Outros mensageiros transculturais do evangelho cometem o erro oposto. Tão determinados estão em identificar-se com o povo que vão servir que até abrem mão de seus padrões e valores cristãos, mas esse também não foi o procedimento de Cristo, uma vez que, ao se tornar humano, ele permaneceu verdadeiramente divino. O Pacto de Lausanne, no parágrafo 10, expressa esse princípio nestas palavras: "Os evangelistas de Cristo têm de, humildemente, procurar esvaziar-se de tudo, exceto de sua autenticidade pessoal, a fim de se tornarem servos dos outros, e as igrejas têm de procurar transformar e enriquecer a cultura; tudo para a glória de Deus".

Temos de lidar com os motivos que levam as pessoas a rejeitar o evangelho e, em particular, dar o devido valor aos fatores culturais. Alguns rejeitam o evangelho não porque o consideram falso, mas porque o acham estranho à sua cultura.

O dr. Renné Padilla foi criticado em Lau sanne, no Congresso sobre a Evangelização Mundial, de 1974, por afirmar que o evangelho que alguns missionários europeus e norte-americanos exportaram foi um "cristianismo cultural", uma mensagem cristã distorcida pela cultura materialista e consumista do Ocidente. Foi doloroso ouvi-lo dizer isso, mas obviamente ele estava totalmente certo.

Todos nós precisamos sujeitar nosso evangelho a um escrutínio mais crítico, e, numa situação transcultural, os evangelistas visitantes precisam, com humildade, buscar ajuda dos cristãos locais para discernir as distorções culturais de sua mensagem.

Outros rejeitam o evangelho porque percebem que é uma ameaça à sua cultura. É claro que Cristo desafia cada cultura. Sempre que apresentamos o evangelho aos hindus, budistas, judeus, muçulmanos, secularistas ou marxistas, Jesus Cristo os desafia com a exigência de abandonarem tudo a que se dedicaram até o momento e de os substituírem por ele mesmo. Jesus é o Senhor de cada pessoa e de cada cultura. Essa ameaça, essa confrontação não pode ser evitada. Mas não estará o evangelho que proclamamos apresentando às pessoas outras ameaças desnecessárias, ao exigir o abandono de costumes inofensivos ou porque parece destruir a arte, a arquitetura, a música e as festas nacionais, ou porque nós, que o apresentamos, somos orgulhosos de nossa cultura e cegos para a cultura dos outros?

Resumindo, quando Deus nos falou nas Escrituras ele usou linguagem humana e quando nos falou em Cristo assumiu carne humana. A fim de revelar-se, ele se esvaziou e se humilhou. Esse é o modelo de evangelismo que a Bíblia apresenta. Existe autoesvaziamento e auto-humilhação em todo evangelismo autêntico. Sem eles, contradizemos o evangelho e deturpamos o Cristo que proclamamos.

O PODER PARA A EVANGELIZAÇÃO MUNDIAL

Em quarto lugar, a Bíblia nos concede o poder para a evangelização do mundo. É quase desnecessário enfatizar nossa necessidade de poder, pois sabemos quanto nossos recursos humanos são fracos em comparação com a magnitude da tarefa. Também sabemos quão blindadas são as defesas do coração humano. Pior ainda, conhecemos a realidade, a maldade e o poder do Diabo e dos demônios sob seu comando.

As pessoas intelectualizadas podem ridicularizar nossas crenças, e até caricaturizá-las, a fim de tornar mais plausível o ridículo da própria condição delas. No entanto, os cristãos evangélicos são simples o bastante para crer no que Jesus e seus apóstolos ensinaram. Para nós, é fato inegável que, na expressão de João, "o mundo inteiro jaz no Maligno" (1Jo 5.19). Até que sejam libertados por Jesus Cristo e transportados para seu Reino, todos os seres humanos são escravos de Satanás. Além disso, percebemos o poder maligno no mundo contemporâneo — nas trevas da idolatria e no medo dos espíritos; na superstição e no fatalismo; na devoção aos deuses que não são deuses; no materialismo egoísta do Ocidente; na propagação do comunismo ateu; na proliferação de sistemas religiosos irracionais; na violência e na agressão; na deterioração generalizada dos padrões absolutos de bondade e verdade. Tudo isso é resultado da obra daquele que nas Escrituras é chamado "mentiroso", "enganador", "caluniador" e "homicida".

Portanto, a conversão e a regeneração cristãs continuam sendo milagres da graça de Deus. Representam o auge de uma luta poderosa entre Cristo e Satanás ou, na marcante figura de linguagem apocalíptica, entre o Cordeiro e o Dragão. O assalto ao palácio do homem forte só é possível porque ele foi amarrado por Alguém que é ainda mais forte e que por sua morte e ressurreição desarmou os principados e potestades do mal e deles se desfez (Mt 12.27-29; Lc 11.20-22; Cl 2.15).

Como então participaremos da vitória de Cristo e derrotaremos o poder do Diabo? Deixemos que Lutero responda à nossa pergunta: Ein wörtlein will ihn fällen. "Vencido cairá por uma só palavra." Há poder na Palavra de Deus e na pregação do evangelho. Talvez a expressão mais dramática dessa realidade no Novo Testamento esteja em 2Coríntios 4. Paulo faz menção do "deus deste século", que "cegou o entendimento dos incrédulos, para que lhes não resplandeça a luz do evangelho da glória de Cristo" (v. 4).

Se a mente humana está cega, como poderá enxergar? Somente por meio da Palavra criadora de Deus. Pois foi Deus quem disse que "de trevas resplandecerá luz" que brilhou em nosso coração "para iluminação do conhecimento da glória de Deus, na face de Cristo" (v. 6). Assim, o apóstolo compara o coração não regenerado ao negro caos inicial e atribui a regeneração ao divino fiat: "Haja luz".

Se Satanás cega as mentes das pessoas e Deus ilumina o coração delas, em que poderemos contribuir para esse encontro? Não seria mais humilde de nossa parte nos retirarmos do campo de batalha e deixar que lutem? Não, essa não é a conclusão a que Paulo chega.

Pelo contrário, entre os versículos 4 e 6, que descrevem as atividades de Deus e Satanás, o versículo 5 diz qual é a obra do evangelista: "Pregamos [...] a Cristo Jesus como Senhor". Considerando que a luz que o Diabo deseja evitar que as pessoas vejam e que Deus faz brilhar nelas é o evangelho, o melhor a fazer é pregar. Pregar o evangelho, longe de ser desnecessário, é indispensável. É o meio estabelecido por Deus para que o príncipe das trevas seja derrotado e a luz jorre no coração do ser humano. Há poder no evangelho de Deus — poder de Deus para a salvação (Rm 1.16).

Podemos ser muito fracos. Às vezes, desejo que fôssemos ainda mais fracos. Diante das forças do mal, somos tentados a exibir certa força cristã e a nos envolver em pequenas escaramuças verbais em nome do evangelho. Entretanto, é em nossa fraqueza que a força de Cristo se faz perfeita, e são as palavras marcadas pela fraqueza humana que o Espírito reveste com poder. Portanto, é quando somos fracos que somos fortes (1Co 2.1-5; 2Co 12.9-10).

VAMOS PROCLAMAR A PALAVRA NO MUNDO!

Não vamos consumir todas as nossas energias discutindo sobre a Palavra de Deus. Em vez disso, vamos começar a usá-la. Ela comprovará sua origem divina por meio do poder divino. Vamos proclamá-la no mundo! Quem dera todos os missionários cristãos e evangelistas proclamassem o evangelho bíblico com fidelidade e sensibilidade e cada pregador cristão fosse um expositor fiel da Palavra de Deus! Então Deus demonstraria seu poder salvador.

Sem a Bíblia, a evangelização do mundo é impossível, pois sem ela não temos nenhum evangelho para levar às nações, nenhuma garantia para oferecer, nenhuma ideia de como fazer a tarefa e nenhuma esperança de sucesso. É a Bíblia que nos dá o mandato, a mensagem, o modelo e o poder de que precisamos para a evangelização do mundo. Portanto, vamos nos apoderar dela outra vez, por intermédio do estudo e da meditação diligentes. Vamos dar atenção aos seus mandamentos, captar sua mensagem, seguir sua orientação e confiar em seu poder. Vamos levantar nossa voz e tornar a Palavra conhecida.

PERGUNTAS PARA ESTUDO

1.Qual a crença básica deste artigo? Explique a diferença que ela poderá fazer na vida do candidato em potencial ao trabalho missionário.

2.Um missionário, depois de enfrentar muitas críticas quanto ao seu trabalho, começou a procurar uma explicação para ter dado esse passo: "Por que estou fazendo este trabalho?". Com base no conteúdo deste artigo, o que você diria a ele?

SOBRE O AUTOR

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo adaptado de uma mensagem apresentada numa sessão plenária da Consulta sobre Evangelização Mundial, realizada em junho de 1980, em Pattaya, na Tailândia. Usado com permissão. A Bíblia na evangelização do mundo$conteudo$
     where curso_id = v_curso and ordem = 3;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 1 · Leitura — Stott, cap. 1: A Bíblia na evangelização do mundo$t$, $conteudo$A BÍBLIA NA EVANGELIZAÇÃO DO MUNDO

JOHN R. W. STOTT

1em a Bíblia, a evangelização do mundo seria não apenas imSpossível, mas também inconcebível. A Bíblia impõe-nos a responsabilidade de evangelizar o mundo, dá-nos um evangelho a proclamar, diz-nos como fazê-lo e declara-se o poder de Deus para a salvação de cada crente.

Além disso, é fato notável, na história passada e contemporânea, que o grau de compromisso da Igreja com a evangelização do mundo é proporcional ao grau de sua convicção da autoridade da Bíblia. Sempre que o cristão perde a confiança na Bíblia, seu zelo pela evangelização acaba se esvaindo. Inversamente, se ele estiver convencido acerca da Bíblia, estará também determinado a evangelizar.

Destaco a seguir quatro razões por que a Bíblia é indispensável à evangelização do mundo.

O MANDATO DA EVANGELIZAÇÃO MUNDIAL

Em primeiro lugar, a Bíblia nos dá o mandato da evangelização do mundo. Sem dúvida, precisamos de uma incumbência. Dois fenômenos estão ocorrendo em toda parte: o fanatismo religioso e o pluralismo religioso. O fanatismo caracteriza-se por um zelo irracional que, se pudesse, usaria a força para obrigar a crença e erradicar a incredulidade. O pluralismo religioso incentiva a tendência oposta.

Sempre que o espírito do fanatismo religioso ou de seu oposto, o indiferentismo, prevalece, a evangelização do mundo é profundamente prejudicada. Os fanáticos recusam-se a tolerar o rival representado pelo evangelismo, e os pluralistas rejeitam suas reivindicações exclusivas. O evangelista cristão é considerado um intruso, alguém que sem motivo se intromete nos negócios alheios.

Diante dessa oposição, precisamos esclarecer que o mandato bíblico não se limita à Grande Comissão (por mais importante que seja esta), mas abrange toda a revelação bíblica. Vou recordála rapidamente.

Existe um único Deus vivo e verdadeiro, o Criador do Universo, o Senhor das nações e o Deus de toda carne. Há cerca de 4 mil anos, Deus chamou Abraão e fez uma aliança com ele, prometendo não apenas abençoá-lo, mas também abençoar, por meio da posteridade do patriarca, todas as famílias da terra (Gn 12. l-4). Esse texto bíblico é uma das pedras fundamentais da missão cristã, pois os descendentes de Abraão (por meio de quem todas as nações estão sendo abençoadas) são Cristo e o povo de Cristo. Se pela fé pertencemos a Cristo, somos filhos espirituais de Abraão e temos uma responsabilidade para com a raça humana. Assim, também os profetas do Antigo Testamento profetizaram que Deus faria desse Cristo o herdeiro e a luz das nações (Sl 2.8; Is 42.6; 49.6).

Quando Jesus veio, ele endossou essas promessas. É verdade que durante seu ministério terreno ele ficou restrito "às ovelhas perdidas da casa de Israel" (Mt 10.6; 15.24), contudo, ele profetizou que "muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus" (Mt 8.11; Lc 13.29). Mais ainda, prevendo sua ressurreição e ascensão, ele deu este fantástico testemunho acerca de si mesmo: "Toda a autoridade me foi dada no céu e na terra" (Mt 28.18). Foi em consequência de sua autoridade universal que ele ordenou aos seus seguidores que fizessem discípulos de todas as nações, batizando-os na nova comunidade e ensinando a todos sua doutrina (Mt 28.19).

Isso os cristãos primitivos começaram a fazer quando o Espírito Santo da verdade e do poder desceu sobre eles. Eles se tornaram testemunhas de Jesus até os confins da terra (At 1.8), e o faziam "por amor do seu nome" (Rm 1.5; 3Jo 7). Eles sabiam que Deus havia superexaltado a Jesus, entronizando-o à sua direita e concedendo-lhe a mais alta posição, a fim de que toda língua confessasse seu senhorio. Eles queriam que Jesus recebesse a honra devida ao seu nome. Além disso, um dia ele retornará em glória, para salvar, julgar e reinar. Portanto, o que deveria preencher o espaço entre as duas vindas? A missão mundial da Igreja! O fim da História só viria depois que o evangelho alcançasse os confins da terra (comp. Mt 24.14 com 28.20; At 1.8). Os dois fins iriam coincidir.

Nosso mandato para a evangelização do mundo, portanto, é a Bíblia inteira. Deve ser encontrado na criação de Deus, porque todos os seres humanos são responsáveis diante dele; no caráter de Deus, transcendente, amoroso, compassivo, não desejando que ninguém pereça, mas que todos venham ao arrependimento; nas promessas de Deus, que todas as nações sejam benditas por meio da semente de Abraão e venham a ser a herança do Messias; no Cristo de Deus, agora exaltado com autoridade universal, para receber aclamação universal; no Espírito de Deus, que convence do pecado, dá testemunho de Cristo e impele a Igreja a evangelizar; na Igreja de Deus, que é uma comunidade missionária multinacional, com ordens de evangelizar até que Cristo volte.

A dimensão global da missão cristã é irresistível. O cristão individual e as igrejas locais que não se comprometem com a evangelização do mundo estão contradizendo, por cegueira ou por desobediência, uma parte essencial de sua identidade, a qual provém de Deus. O mandato bíblico para a evangelização do mundo não pode ser ignorado.

A MENSAGEM DA EVANGELIZAÇÃO MUNDIAL

Em segundo lugar, a Bíblia nos disponibiliza a mensagem para a evangelização do mundo. O Pacto de Lausanne define o evangelismo em termos de evangelho. O parágrafo 4 declara: "Evangelizar é difundir as boas novas de que Jesus Cristo morreu por nossos pecados e ressuscitou segundo as Escrituras, e de que, como Senhor e Rei, ele agora oferece o perdão dos pecados e o dom libertador do Espírito a todos os que se arrependem e creem".

Nossa mensagem vem da Bíblia, mas quando a buscamos nas Escrituras, imediatamente deparamos com um dilema. De um lado, a mensagem nos é outorgada. Não temos permissão de inventá-la. Ela nos foi confiada como um "depósito" precioso, que nós, como servos fiéis, devemos guardar e distribuir na Casa de Deus (1Tm 6.20; 2Tm 1.12-14; 2Co 4.1,2). Por outro lado, não nos foi dada como uma fórmula matemática simples e exata, e sim numa rica diversidade de formulações nas quais foram usadas imagens ou metáforas diferentes.

Portanto, existe apenas um evangelho, no que todos os apóstolos concordam (1Co 15.1), e Paulo podia invocar a maldição de Deus sobre qualquer um, inclusive ele próprio, que pregasse um evangelho "diferente" do evangelho apostólico original da graça de Deus (Gl 1.6-8). No entanto, os apóstolos expressaram esse evangelho único de diversos modos: sacrifical (o derramamento e a aspersão do sangue de Cristo); messiânico (o surgimento do governo prometido por Deus); legal (o juiz pronunciando a justificação do injusto); pessoal (o Pai reconciliando seus filhos desviados); salvífico (o Libertador celestial que veio para resgatar os desamparados); cósmico (o Senhor universal reivindicando domínio universal) — e esses são apenas alguns exemplos.

O evangelho é assim visto como único e, ao mesmo tempo, como diversificado. Ele é "dado" e, ao mesmo tempo, é culturalmente adaptado à sua audiência. Uma vez que percebamos isso, seremos poupados de cometer dois erros opostos. Ao primeiro chamarei "fluidez total". Certa vez, ouvi um líder de igreja inglês declarar que não existe coisa tal como o evangelho até que estejamos na situação de dar nosso testemunho. Não levamos nada conosco nessa situação, ele disse. Descobrimos o evangelho apenas quando chegamos lá. Concordo plenamente com a necessidade de ser sensível em cada situação, mas, se esse era o ponto que o líder em questão desejava defender, ele o exagerou grosseiramente. Existe uma coisa tal como o evangelho revelado, ou dado, que não temos liberdade para falsificar.

Ao erro oposto chamarei "rigidez total". Nesse caso, o evangelista se comporta como se Deus tivesse outorgado algumas fórmulas precisas, que temos de repetir mais ou menos palavra por palavra, e certas imagens, que devemos empregar invariavelmente. Isso nos torna escravos de palavras ou de imagens, ou de ambas. Alguns evangelistas fracassam por usar uma linguagem antiquada, enquanto outros se sentem obrigados a mencionar a toda hora "o sangue de Cristo", "a justificação pela fé", "o Reino de Deus" ou qualquer outra imagem.

Entre esses dois extremos, há um terceiro e melhor caminho. Ele combina o compromisso com o fato da revelação e com a tarefa da contextualização. Aceita como permanentemente normativas apenas as formulações bíblicas do evangelho e entende que cada tentativa de proclamar o evangelho na linguagem moderna deve justificar-se como expressão autêntica do evangelho bíblico.

Contudo, se ele se recusa a se desfazer das formulações bíblicas, também recusará recitálas de maneira inexpressiva e sem imaginação. Em vez disso, temos de nos ocupar da luta contínua, por meio da oração, do estudo e da discussão, para relacionar o evangelho recebido com determinada situação. Uma vez que ele vem de Deus, devemos preservá-lo; uma vez que se destina aos homens e mulheres dos tempos modernos, temos de interpretá-lo. Temos de combinar fidelidade (pelo estudo constante do texto bíblico) com sensibilidade (pela observação constante do cenário contemporâneo). Só então teremos condições de relacionar, com fidelidade e relevância, a Palavra com o mundo, o evangelho com o contexto, as Escrituras com a cultura.

O MODELO PARA A EVANGELIZAÇÃO MUNDIAL

Em terceiro lugar, a Bíblia nos fornece o modelo para a evangelização do mundo. Além da mensagem (o que temos de dizer), precisamos de um modelo (como dizer). A Bíblia supre isto também. Ela não apenas contém o evangelho: ela é o evangelho. Por meio da Bíblia o próprio Deus está evangelizando, isto é, comunicando as boas novas ao mundo. Você deve estar lembrado da declaração de Paulo acerca de Gênesis 12.3, segundo a qual "a Escritura [...] preanunciou o evangelho a Abraão" (Gl 3.8). Toda a Escritura prega o evangelho. Deus evangeliza por meio dela.

Se, portanto, as Escrituras são a evangelização divina, é evidente que podemos aprender a pregar o evangelho, considerando como Deus o fez. Ele nos proporcionou, no processo da inspiração bíblica, um belo modelo evangelístico.

O que de imediato nos surpreende é a grandeza da condescendência de Deus. Ele tem uma verdade sublime para revelar acerca de si mesmo e de seu Cristo, sua misericórdia, sua justiça e sua total salvação. Ele escolheu fazer essa revelação pelo emprego do vocabulário e da gramática da língua humana, de seres humanos, de imagens humanas e de culturas humanas.

Contudo, por meio desse humilde recurso de palavras e imagens humanas, Deus falava as palavras dele. A doutrina evangélica da inspiração das Escrituras enfatiza sua dupla autoria. Homens falaram, e Deus falou. Homens falaram de Deus (2Pe 1.21), e Deus falou por intermédio de homens (Hb 1.1). As palavras faladas e escritas eram de Deus e também deles. Ele decidiu o que queria dizer, mas não sufocou a personalidade humana. Eles usaram suas faculdades livremente, mas não distorceram a mensagem divina. Os cristãos desejam declarar algo semelhante sobre a encarnação, o clímax da autocomunicação de Deus: "O Verbo se fez carne" ( Jo 1.14). Isto é, a Palavra eterna de Deus, que desde a eternidade estava com Deus e era Deus, o Agente através do qual o Universo foi criado, tornou-se um ser humano, com todas as características de um judeu palestino do primeiro século. Ele se tornou pequeno, fraco, pobre e vulnerável. Ele experimentou a dor e a fome e se expôs à tentação. Tudo isso fazia parte da "carne", isto é, do ser humano que ele se tornou. Tornando-se um de nós, porém, não deixou de ser ele mesmo. Cristo continuou sendo o Verbo eterno, isto é, o Filho eterno de Deus.

Essencialmente, o mesmo princípio é ilustrado pela inspiração das Escrituras e pela encarnação do Filho. O Verbo se fez carne. O divino foi comunicado pelo humano. Deus se identificou conosco, embora não renunciasse à sua identidade, e esse princípio de "identificação sem perda de identidade" é o modelo para toda a evangelização, especialmente a evangelização transcultural.

Alguns de nós se recusam a identificar-se com o povo que alegam servir. Continuamos sendo nós mesmos e não nos tornamos iguais a eles. Permanecemos afastados. Agarramo-nos desesperadamente à nossa herança cultural, com base na concepção errônea de que é parte indispensável de nossa identidade. Não queremos perdê-la e não apenas mantemos nossas práticas culturais com tenacidade feroz, como também tratamos a herança cultural da terra de nossa adoção sem o respeito que merece. Assim, praticamos um duplo tipo de imperialismo cultural, impondo nossa cultura a outros e desprezando a deles. Não foi esse, porém, o procedimento de Cristo, que se esvaziou de sua glória e se humilhou para poder servir.

Outros mensageiros transculturais do evangelho cometem o erro oposto. Tão determinados estão em identificar-se com o povo que vão servir que até abrem mão de seus padrões e valores cristãos, mas esse também não foi o procedimento de Cristo, uma vez que, ao se tornar humano, ele permaneceu verdadeiramente divino. O Pacto de Lausanne, no parágrafo 10, expressa esse princípio nestas palavras: "Os evangelistas de Cristo têm de, humildemente, procurar esvaziar-se de tudo, exceto de sua autenticidade pessoal, a fim de se tornarem servos dos outros, e as igrejas têm de procurar transformar e enriquecer a cultura; tudo para a glória de Deus".

Temos de lidar com os motivos que levam as pessoas a rejeitar o evangelho e, em particular, dar o devido valor aos fatores culturais. Alguns rejeitam o evangelho não porque o consideram falso, mas porque o acham estranho à sua cultura.

O dr. Renné Padilla foi criticado em Lau sanne, no Congresso sobre a Evangelização Mundial, de 1974, por afirmar que o evangelho que alguns missionários europeus e norte-americanos exportaram foi um "cristianismo cultural", uma mensagem cristã distorcida pela cultura materialista e consumista do Ocidente. Foi doloroso ouvi-lo dizer isso, mas obviamente ele estava totalmente certo.

Todos nós precisamos sujeitar nosso evangelho a um escrutínio mais crítico, e, numa situação transcultural, os evangelistas visitantes precisam, com humildade, buscar ajuda dos cristãos locais para discernir as distorções culturais de sua mensagem.

Outros rejeitam o evangelho porque percebem que é uma ameaça à sua cultura. É claro que Cristo desafia cada cultura. Sempre que apresentamos o evangelho aos hindus, budistas, judeus, muçulmanos, secularistas ou marxistas, Jesus Cristo os desafia com a exigência de abandonarem tudo a que se dedicaram até o momento e de os substituírem por ele mesmo. Jesus é o Senhor de cada pessoa e de cada cultura. Essa ameaça, essa confrontação não pode ser evitada. Mas não estará o evangelho que proclamamos apresentando às pessoas outras ameaças desnecessárias, ao exigir o abandono de costumes inofensivos ou porque parece destruir a arte, a arquitetura, a música e as festas nacionais, ou porque nós, que o apresentamos, somos orgulhosos de nossa cultura e cegos para a cultura dos outros?

Resumindo, quando Deus nos falou nas Escrituras ele usou linguagem humana e quando nos falou em Cristo assumiu carne humana. A fim de revelar-se, ele se esvaziou e se humilhou. Esse é o modelo de evangelismo que a Bíblia apresenta. Existe autoesvaziamento e auto-humilhação em todo evangelismo autêntico. Sem eles, contradizemos o evangelho e deturpamos o Cristo que proclamamos.

O PODER PARA A EVANGELIZAÇÃO MUNDIAL

Em quarto lugar, a Bíblia nos concede o poder para a evangelização do mundo. É quase desnecessário enfatizar nossa necessidade de poder, pois sabemos quanto nossos recursos humanos são fracos em comparação com a magnitude da tarefa. Também sabemos quão blindadas são as defesas do coração humano. Pior ainda, conhecemos a realidade, a maldade e o poder do Diabo e dos demônios sob seu comando.

As pessoas intelectualizadas podem ridicularizar nossas crenças, e até caricaturizá-las, a fim de tornar mais plausível o ridículo da própria condição delas. No entanto, os cristãos evangélicos são simples o bastante para crer no que Jesus e seus apóstolos ensinaram. Para nós, é fato inegável que, na expressão de João, "o mundo inteiro jaz no Maligno" (1Jo 5.19). Até que sejam libertados por Jesus Cristo e transportados para seu Reino, todos os seres humanos são escravos de Satanás. Além disso, percebemos o poder maligno no mundo contemporâneo — nas trevas da idolatria e no medo dos espíritos; na superstição e no fatalismo; na devoção aos deuses que não são deuses; no materialismo egoísta do Ocidente; na propagação do comunismo ateu; na proliferação de sistemas religiosos irracionais; na violência e na agressão; na deterioração generalizada dos padrões absolutos de bondade e verdade. Tudo isso é resultado da obra daquele que nas Escrituras é chamado "mentiroso", "enganador", "caluniador" e "homicida".

Portanto, a conversão e a regeneração cristãs continuam sendo milagres da graça de Deus. Representam o auge de uma luta poderosa entre Cristo e Satanás ou, na marcante figura de linguagem apocalíptica, entre o Cordeiro e o Dragão. O assalto ao palácio do homem forte só é possível porque ele foi amarrado por Alguém que é ainda mais forte e que por sua morte e ressurreição desarmou os principados e potestades do mal e deles se desfez (Mt 12.27-29; Lc 11.20-22; Cl 2.15).

Como então participaremos da vitória de Cristo e derrotaremos o poder do Diabo? Deixemos que Lutero responda à nossa pergunta: Ein wörtlein will ihn fällen. "Vencido cairá por uma só palavra." Há poder na Palavra de Deus e na pregação do evangelho. Talvez a expressão mais dramática dessa realidade no Novo Testamento esteja em 2Coríntios 4. Paulo faz menção do "deus deste século", que "cegou o entendimento dos incrédulos, para que lhes não resplandeça a luz do evangelho da glória de Cristo" (v. 4).

Se a mente humana está cega, como poderá enxergar? Somente por meio da Palavra criadora de Deus. Pois foi Deus quem disse que "de trevas resplandecerá luz" que brilhou em nosso coração "para iluminação do conhecimento da glória de Deus, na face de Cristo" (v. 6). Assim, o apóstolo compara o coração não regenerado ao negro caos inicial e atribui a regeneração ao divino fiat: "Haja luz".

Se Satanás cega as mentes das pessoas e Deus ilumina o coração delas, em que poderemos contribuir para esse encontro? Não seria mais humilde de nossa parte nos retirarmos do campo de batalha e deixar que lutem? Não, essa não é a conclusão a que Paulo chega.

Pelo contrário, entre os versículos 4 e 6, que descrevem as atividades de Deus e Satanás, o versículo 5 diz qual é a obra do evangelista: "Pregamos [...] a Cristo Jesus como Senhor". Considerando que a luz que o Diabo deseja evitar que as pessoas vejam e que Deus faz brilhar nelas é o evangelho, o melhor a fazer é pregar. Pregar o evangelho, longe de ser desnecessário, é indispensável. É o meio estabelecido por Deus para que o príncipe das trevas seja derrotado e a luz jorre no coração do ser humano. Há poder no evangelho de Deus — poder de Deus para a salvação (Rm 1.16).

Podemos ser muito fracos. Às vezes, desejo que fôssemos ainda mais fracos. Diante das forças do mal, somos tentados a exibir certa força cristã e a nos envolver em pequenas escaramuças verbais em nome do evangelho. Entretanto, é em nossa fraqueza que a força de Cristo se faz perfeita, e são as palavras marcadas pela fraqueza humana que o Espírito reveste com poder. Portanto, é quando somos fracos que somos fortes (1Co 2.1-5; 2Co 12.9-10).

VAMOS PROCLAMAR A PALAVRA NO MUNDO!

Não vamos consumir todas as nossas energias discutindo sobre a Palavra de Deus. Em vez disso, vamos começar a usá-la. Ela comprovará sua origem divina por meio do poder divino. Vamos proclamá-la no mundo! Quem dera todos os missionários cristãos e evangelistas proclamassem o evangelho bíblico com fidelidade e sensibilidade e cada pregador cristão fosse um expositor fiel da Palavra de Deus! Então Deus demonstraria seu poder salvador.

Sem a Bíblia, a evangelização do mundo é impossível, pois sem ela não temos nenhum evangelho para levar às nações, nenhuma garantia para oferecer, nenhuma ideia de como fazer a tarefa e nenhuma esperança de sucesso. É a Bíblia que nos dá o mandato, a mensagem, o modelo e o poder de que precisamos para a evangelização do mundo. Portanto, vamos nos apoderar dela outra vez, por intermédio do estudo e da meditação diligentes. Vamos dar atenção aos seus mandamentos, captar sua mensagem, seguir sua orientação e confiar em seu poder. Vamos levantar nossa voz e tornar a Palavra conhecida.

PERGUNTAS PARA ESTUDO

1.Qual a crença básica deste artigo? Explique a diferença que ela poderá fazer na vida do candidato em potencial ao trabalho missionário.

2.Um missionário, depois de enfrentar muitas críticas quanto ao seu trabalho, começou a procurar uma explicação para ter dado esse passo: "Por que estou fazendo este trabalho?". Com base no conteúdo deste artigo, o que você diria a ele?

SOBRE O AUTOR

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo adaptado de uma mensagem apresentada numa sessão plenária da Consulta sobre Evangelização Mundial, realizada em junho de 1980, em Pattaya, na Tailândia. Usado com permissão. A Bíblia na evangelização do mundo$conteudo$, 3);
  end if;

end
$curso$;
