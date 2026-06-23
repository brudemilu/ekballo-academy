-- Curso: Gálatas para Você (Timothy Keller) — slug galatas-para-voce. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'galatas-para-voce';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('galatas-para-voce','Gálatas para Você','Estudo a partir de Gálatas para Você, de Timothy Keller. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/galatas-para-voce', false, 0, 'ensino', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Singularidade do Evangelho$t$, 1,
$conteudo$Talvez o que mais chame a atenção na abertura de Gálatas seja o tom usado por Paulo e o estado de espírito por trás dele. Paulo está surpreso. Ele também parece zangado. Sua linguagem, quase desde o início, é extraordinariamente incisiva. Se, como é comum, as cartas de Paulo, após a saudação, dão espaço para uma ação de graças por aqueles para quem ele está escrevendo (veja, por exemplo, Fp 1.3-8, Cl 1.3-8 e 1C0 1.4-9), aqui ele se limita a dizer: “Estou admirado...” (v. 6a). O que despertou sentimentos tão intensos nele?

Desvio

Em primeiro lugar, Paulo fica admirado porque aqueles cristãos recém-convertidos estão se deixando levar por um evangelho que não é evangelho de fato (v. 7), expondo-se a um enorme perigo. Eles estão perturbados (v. 7b).

Em segundo lugar, o alvo principal de sua furia são aqueles que estão desencaminhando os convertidos da igreja, ou seja, aqueles que “querem perverter o evangelho” (v. 7b). Paulo invoca maldição sobre eles (v. 9). De uma forma mais secundária, ele também está zangado com os próprios cristãos da Galácia, e os adverte de que estão se desviando do Deus que os chamou (v. 6b)... uma acusação grave!

Ao percorrermos a carta de Paulo, veremos que seu acesso de raiva na introdução foi causado por um grupo de mestres

G aiatas 1.19־

que vinha ensinando aos cristãos gentios convertidos que eles eram obrigados a cumprir os costumes culturais judaicos da lei mosaica — em relação ao que comer, à circuncisão e às demais leis cerimoniais — a fim de agradar a Deus de verdade. Para os gálatas, é provável que isso não parecesse uma diferença radical do que lhes fora ensinado. Com certeza, o ponto central da vida cristã é agradar a Deus! Mas Paulo diz: “Isso é uma rejeição completa de tudo que lhes tenho dito”.

Ele bate para valer! Mas, se cremos no que Paulo cria sobre o evangelho, sua atitude nos parecerá plenamente justificável. Se os gálatas estão mesmo dando as costas para Deus e abraçando um evangelho que não é, de forma alguma, o evangelho, sua situação é perigosa. A ansiedade e a raiva expressas por Paulo são as mesmas que qualquer pai ou amigo amoroso sentiria se um filho ou colega se desviasse seriamente do caminho.

Paulo tem o direito d e se m anifestar

Mas quem é Paulo para escrever a esses cristãos dessa maneira?

Um “apóstolo” (v. 1): um homem enviado com autoridade divina imediata. A palavra grega apostolos dá ênfase ao fato de ser “enviado”. A frase “não da parte de homens, nem por meio de homem algum” deixa claro o caráter exclusivo dos primeiros apóstolos. Tampouco aqueles que hoje são chamados ao ministério pelo Espírito Santo recebem o chamado “da parte de homens” — a razão última de seu ministério é o chamado de Jesus, e a autoridade máxima desse ministério é a palavra de Jesus na Bíblia. Mas eles são designados “por meio de homem”. (O termo grego aqui, dia, significa “por” ou “através”, como em “diâmetro”.) Ou seja, embora os ministros recebam seu chamado de Deus, são chamados por intermédio de outros ministros humanos, ou por meio da eleição de uma congregação etc.

Paulo reivindica algo mais acerca de si próprio. Diz que não recebeu sua comissão apostólica por meio de ninguém, em

G álatas 1.1-9

absoluto. Nenhum outro apóstolo o comissionou. Ele foi comissionado e ensinado diretamente pelo próprio Jesus ressurreto (veja At 9.1-19).

Em segundo lugar, nos versículos 8 e 9, Paulo diz que foi enviado com uma mensagem divina específica·, o evangelho. Isso quer dizer que seu ensinamento divino serve de padrão para julgar quem é ortodoxo e quem é herege, como ele diz no versículo 9: “Se alguém vos pregar um evangelho diferente daquele que já recebestes, seja maldito”. Nem mesmo um apóstolo pode mudar a mensagem de Cristo, revisá-la ou acrescentar algo a ela. O que ele diz não é resultado de seu estudo, pesquisa, reflexão e sabedoria. E dado por Deus, sendo tanto intocável quanto imutável.

Poderiamos nos perguntar: ainda existem apóstolos hoje? Não no sentido pleno, como foram Paulo e os D oze. Na igreja primitiva, outros foram considerados apóstolos das igrejas (por exemplo, cf. 2Coríntios 9.3). Barnabé foi “enviado” para Antioquia e, nesse sentido, era “apóstolo” (cf. At 11.22; veja também At 14.14). No entanto, embora fossem enviados como missionários, eram comissionados por outros, pelos apóstolos originais ou pelas igrejas — “por meio de homem”. Barnabé nunca se encontrou com o Cristo ressurreto; nunca foi ensinado e educado no evangelho pelo Cristo presente em corpo, como acontecera com Paulo e os Doze. Assim, podemos chamar pessoas dotadas de dons incomuns de Üderança, seja daquela época, seja de agora, de apóstolos com “a” minúsculo. Mas Paulo é um Apóstolo, com “A” maiúsculo, comissionado pelo próprio Jesus. Os Apóstolos com “A” maiúsculo tinham, e têm, autoridade absoluta. O que eles escrevem é Escritura.

O qu e é o evan gelh o?

Assim, esse Apóstolo divinamente designado lembra aos cristãos da Galácia sua mensagem divina especial: o evangelho.

G álatas 1.1-9

Na abertura, traça um esboço rápido, ainda que bastante abrangente, da mensagem do evangelho:

Quem somos: impotentes e perdidos. E o que sugere a palavra “livrar” no versículo 4. Outros fundadores de religiões vieram ensinar, não livrar. Jesus foi um grande mestre; mas, quando Paulo nos dá essa versão resumida do ministério de Jesus, não faz nenhuma menção disso, em absoluto. A pessoa comum das ruas acredita que o cristão é alguém que segue o ensinamento e o exemplo de Cristo. Paulo, no entanto, sugere que isso é impossível. Afinal de contas, não se pode livrar pessoas a menos que estejam perdidas e em condição de impotência! Imagine que você veja uma mulher se afogando. Não será de nenhuma ajuda lhe atirar um manual de natação. Você não lhe lança um ensinamento — você lhe joga uma corda. E Jesus é mais libertador do que mestre — porque é disso que mais ne- cessitamos. Nada do que soA substituição é o motivo de o evangelho ser tâo revolucionário.

mos ou fazemos nos salva. A isso os teólogos dão o nome de “incapacidade espiritual”.

0 que Jesusfez: como Jesus nos liberta? Ele “se entregou a si mesmo pelos nossos pecados” (v. 4a).Temos um sacrifício substitutivo por natureza. A palavra “pelos” significa “em benefício de” ou “no lugar de”. A substituição é o motivo de o evangelho ser tão revolucionário. A morte de Cristo não foi apenas um sacrifício geral, mas substitutivo. Ele não nos comprou apenas uma “segunda chance”, dando-nos nova oportunidade de endireitar a vida e agir certo com Deus. Ele fez tudo que precisávamos fazer, mas não conseguimos. Se a morte de Jesus de fato pagou por nossos pecados em nosso lugar, nunca podemos retroceder para a condenação. Por quê? Porque, nesse caso, Deus recebería dois pagamentos pelo mesmo pecado, o que é injusto! Jesus fez tudo que deveriamos ter feito, em nosso lugar, de modo que, quando

G álatas 1.1-9

ele se torna nosso Salvador, somos absolutamente libertos da penalidade e da condenação.

O que 0 Pai fez: Deus aceitou a obra de Cristo em nosso benefício ressuscitando-o “dentre os mortos” (v. 1) e dando-nos a “graça [...] e paz” (v. 3) que Cristo conquistou e alcançou por nós.

Por que Deus 0 fez: tudo isso foi feito por graça — não por algo que tenhamos feito, mas “segundo a vontade de nosso Deus e Pai” (v. 4d). Não pedimos socorro, mas Deus, em sua graça, planejou o que não tínhamos percebido que necessitávamos, e Cristo, por sua graça (v. 6), veio realizar a Übertação que jamais alcançaríamos por nós mesmos.

Não há nenhum indicativo de qualquer outra motivação ou causa para a missão de Cristo, exceto a vontade de Deus. Não há nada em nós que a mereça. A salvação é pura graça.

Por isso, o único que recebe “glória para todo o sempre” é Deus (v. 5). Se tivéssemos contribuído com nossa salvação... se tivéssemos nos libertado... ou se Deus tivesse visto em nós algo que merecesse ser salvo, ou que fosse útil para seus planos... ou, ainda, se tivéssemos nos limitado a clamar por libertação baseados em nosso próprio raciocínio e entendimento... então poderiamos nos congratular pelo papel que desempenhamos para nos salvar.

Mas o evangelho bíblico — o evangelho de Paulo — deixa claro que a salvação, do início ao fim, é obra de Deus. O chamado, o plano, a ação, a obra são todos seus. Assim, é ele que merece toda a glória, em todo o tempo.

Essa é a verdade humilhante que constitui o cerne do cristianismo. Nós adoramos ser nossos próprios salvadores. Nosso coração adora fabricar glória para si. Por isso consideramos as mensagens de autossalvação tão atraentes, sejam elas religiosas (Siga essas regras e você ganhará bênçãos eternas) ou seculares (Conquiste essas coisas e experimentará bênçãos agora mesmo). O evangelho chega e vira tudo isso de cabeça para baixo: você está

G álatas 1.1-9

em posição de tamanha impotência e necessita de uma salvação que não depende de você em absolutamente nada. Em seguida, diz: Deus, em Jesus, oferece uma salvação que lhe concede muito mais do que qualquer salvação falsa que seu coração queira buscar.

Paulo nos lembra de que, no evangelho, somos mais rebaixados e mais exaltados do que poderiamos imaginar. E o único que tem direito de receber toda a glória por isso é o “nosso Deus e Pai [...] para todo o sempre. A mém” (v. 4,5).

para reflexão Perguntas

1. O tom de Paulo nos lembra de que a fé cristã é uma questão de coração, bem como de cabeça — de sentimentos tanto quanto de intelecto. Como isso lhe serve de incentivo? Como o desafia?

2. Quando você acha mais difícil aceitar a autoridade do ensino apostólico do Novo Testamento? Por quê?

3. Como você explicaria o evangelho para alguém que lhe perguntasse hoje em que você acredita?

SEGUNDA PARTE

R evisão do evan gelh o - reversão do evan gelh o

O evangelho bíblico da graça é algo precioso. Era esse evangelho glorioso que os líderes das igrejas da Galácia estavam pervertendo, e era dele que os membros da igreja local haviam se desviado.

Isso é importante porque Paulo diz que qualquer mudança no evangelho significa transformá-lo em algo “que, na realidade, não é o evangelho” (cf. v. 7, NVI). Por que isso? Por que qualquer mudança no evangelho, por menor que seja, o anula e esvazia?

Porque, diz Paulo, os crstãos são chamados “pela graça de Cristo” (v. 6). Deus nos chamou; não fomos nós que o

G aiatas 1.1-9

chamamos. E Deus nos aceitou de pronto, apesar de não merecermos. Essa é a ordem do evangelho. Deus nos aceita, então o seguimos. Já outros sistemas religiosos propõem a ordem inversa. Temos de dar algo a Deus e então ele nos aceita. Assim, no versículo 7, Paulo diz que qualquer ensinamento que acrescente a manutenção da lei mosaica cerimonial à fé em Cristo “perverte” o evangelho. Literalmente, a palavra que ele escolhe usar quer dizer “reverte”.

Isso é esclarecedor. Se você acrescentar qualquer coisa a Cristo como um requisito para ser aceito por Deus — se começa a dizer: Para ser salvo, preciso da graça de Cristo mais alguma coisa —, você reverte por completo a “ordem” do evangelho e o anula e esvazia. Qualquer revisão do evangelho o reverte. Por isso, no versículo 6, Paulo diz que os falsos mestres estão apresentando “outro evangelho”, que, logo no versículo 7, ele diz que “na realidade, não é o evangelho”.

Isso é claro como água. Não se pode conceber a ideia de outro evangelho. Outro evangelho é nenhum evangelho. Mudar o evangelho no mínimo que seja significa perdê-lo tão completamente que o novo ensinamento não tem o direito de ser chamado de “evangelho”. Martinho Lutero, o reformador do século 16, resumiu bem essa ideia:

Não há meio-termo entre a justificação cristã e a justifi- cação pelas obras. Não existe alternativa à justificação cristã, senão a justificação pelas obras; se você não edificar sua fé so- bre a obra de Cristo, deve edificá-la sobre suas próprias obras.1

Perdendo o ev a n g elh o hoje

O que Paulo combateu em sua época, e contra o que Lutero batalhou na dele, testemunhamos também na nossa. Lembre-se,

1“Preface”, in: Commentary on the Epistle to the Galatians (London: Suzeteo Enterprise, 2011).

G álatas 1.1-9

Paulo condena qualquer ensino que não seja baseado no fato de que:

■ Pecamos demais para contribuir para nossa salvação (precisamos de uma libertação completa). ■ Somos salvos pela fé na obra de Jesus — a “graça de Cristo” — e mais nada.

Aqui estão três exemplos de perspectivas atuais que negam uma dessas verdades ou ambas:

1. Em algumas igrejas, ensina-se implícita ou explicitamente que você é salvo por meio de sua "entrega” a Cristo, somada às crenças e ao comportamento certo. Esse é um erro bem comum nas igrejas evangélicas. As pessoas são desafiadas a “entregar sua vida aJesus” e/ou a “convidá-lo a entrar em sua vida”. Isso soa muito bíblico, mas ainda assim tende a rejeitar com facilidade o princípio da graça em primeiro lugar. A ideia é de que somos salvos por uma fé vigorosa e pela confiança em Deus, bem como por amá-lo, mas tudo isso acompanhado de uma vida comprometida com ele. Portanto, as pessoas sentem que devem primeiro gerar um alto nível espiritual de pesar, fome e amor, a fim de garantir a presença de Cristo. Em seguida, devem manter tudo isso de alguma forma, se pretendem “permanecer salvas”. Assim, em termos funcionais — ou seja, na realidade prática —, tais igrejas estão ensinando o conceito de que somos salvos devido ao nível da nossa fé. Mas o evangelho diz que somos salvos por intermédio da nossa fé. A primeira abordagem, na verdade, faz com que nosso desempenho seja o salvador, e a segunda faz do desempenho de Cristo o Salvador. Não é o nível, mas o objeto da nossa fé que nos salva. 2. Em outras igrejas, ensina-se que, na verdade, não tem muita importância aquilo em que você crê, desde que seja uma pessoa

G álatas 1.19־

amorosa e boa. Trata-se de um erro bastante comum nas igrejas “liberais”. Essa visão ensina que todas as pessoas boas, independentemente de sua religião (ou falta dela), encontrarão a Deus. Embora a ideia pareça revelar uma mente muito aberta, de fato ela é intolerante para com a graça, em dois sentidos.

Primeiro, ensina que as boas obras são suficientes para se chegar a Deus. Se todas as pessoas boas podem conhecer a Deus, então a morte de Jesus não era necessária; basta a virtude. O problema é que isso quer dizer que pessoas más não têm esperança nenhuma, contradizendo o evangelho, que convida “tanto maus quanto bons”

Se as pessoas boas podem conhecer a

Deus, a morte de Jesus não era necessária.

ao banquete divino (Mt 22.10). Se você afirma que as pessoas são salvas por serem boas, então só “os bons” podem se achegar ao banquete de Deus. A oferta do evangelho torna-se exclusiva, não inclusiva.

Segundo, encoraja as pessoas a pensar que, se forem tolerantes e abertas, agradarão a Deus. Elas não precisam de graça; podem conseguir a vida eterna por si mesmas. Assim, a “glória para todo o sempre” (v. 5) é transferida para elas por serem boas o suficiente para o céu. Todavia, o evangelho desafia as pessoas a verem seu pecado radical. Sem esse senso do próprio mal, o conhecimento da graça divina não será transformador, e deixaremos de compreender o quanto Deus é glorificado pela presença de qualquer pessoa no céu. 3. Um terceiro exemplo é encontrado em igrejas intolerantes ao extremo com pequenas diferenças de vestuário ou costumes. Os falsos mestres de Gálatas queriam (como veremos) impor muitas regras e regulamentos antigos, relacionados com o modo de vestir, com o que comer e com as observâncias rituais. É natural associarmos tais mestres a igrejas

G álatas 1.1-9

altamente regulamentadas e comunidades religiosas que exercem um controle muito firme de seus membros, dirigindo-os quanto ao modo “certo” de comer, vestir, namorar, passar o tempo e assim por diante. Ou talvez eles insistam em uma observância detalhada de vários rituais complicados. Os exemplos modernos de uma igreja semelhante à da Galácia seriam as igrejas muito autoritárias ou ritualísticas e legalistas demais. Tenho em mente que essas igrejas são o mais evidente dos três exemplos que analisamos, portanto o menos perigoso. O primeiro e o segundo são muito mais predominantes e arriscados.

N osso ev a n g elh o é o verdadeiro?

Já que o único evangelho verdadeiro é tão fundamental, e é revertido com tanta frequência e facilidade, isso desperta em nós uma pergunta inquietante: como assegurar que o evangelho em que nós cremos é de fato verdadeiro? Como sabemos não se tratar apenas de um evangelho que sentimos ser verdadeiro, ou que nos é dito ser verdadeiro, ou que pensamos ser verdadeiro, ou que nos parece verdadeiro, e sim do evangelho real, objetivo e, portanto, capaz, de salvar, verdadeira e eternamente?

Paulo utiliza, com a linguagem mais vigorosa possível, um prumo para julgar todas as afirmações de verdade, sejam elas externas (de mestres, escritores, pensadores, pregadores) ou internas (sentimentos, sensações, experiências). Esse padrão é o evangelho que ele, junto com os outros Apóstolos com “A” maiúsculo, receberam de Cristo e ensinaram, o qual é encontrado nessa carta e em todo o restante da Bíblia.

“Ainda que nós [...] ou um anjo [...] vos pregue um evangelho diferente [...] seja maldito” (v. 8). Aqui está o padrão para julgar autoridades externas, tais como mestres humanos ou líderes institucionais humanos, ou mesmo oficiais ordenados em uma hierarquia eclesiástica.

G álatas 1.1-9

É digno de nota que, ao dizer “nós”, Paulo se inclui como autoridade humana. Paulo está dizendo que ele deve ser rejeitado se algum dia disser: Mudei de ideia em relação ao que é 0 evangelho. Como Paulo nos alertará, o evangelho não veio a ele por meio de um processo de raciocínio e reflexão; o evangelho não foi conquistado, antes recebido. Portanto, o próprio Paulo não tem a liberdade de alterá-lo por meio de raciocínio e reflexão. Em Gálatas 2, Paulo nos contará que seu evangelho foi confirmado por outros que também tinham recebido a mensagem por revelação do Cristo ressurreto. Esse consenso apostólico — o “depósito do evangelho” original feito por Cristo — é, portanto, a medida para julgar todas as afirmações de verdade, externas e internas.

Isso é muito importante. Paulo está dizendo, no versículo 8, que até sua autoridade apostólica deriva da autoridade do evangelho, não o contrário. Ele diz aos gálatas para avaliarem e julgarem tanto seu apostolado quanto seu ensino à luz do evangelho bíblico. A Bíblia julga a igreja; a igreja não julga a Bíblia. A Bíblia é que cria e fundamenta a igreja; a igreja não cria nem fundamenta a Bíblia. A igreja e sua hierarquia devem ser avaliadas pelo crente à luz do evangelho bíblico, considerando-o o padrão ou prumo para julgar todas as afirmações de verdade.

Tampouco nossa experiência pessoal é o prumo definitivo da verdade. Não julgamos a Bíblia por nossos sentimentos ou convicções; julgamos nossas experiências pela Bíblia. Isso significa que, se um anjo aparecesse literalmente perante uma multidão de pessoas e ensinasse que a salvação é pelas boas obras (ou por qualquer outra coisa, exceto somente a fé, somente em Cristo), você deveria colocá-lo para correr (v. 8). Ao dizer “ainda que nós mesmos ou um anjo do céu”, Paulo faz um resumo amplo da “epistemologia” cristã adequada — como sabemos o que é verdade.

G aiatas 1.1-9

Por qu e im porta

No começo deste capítulo, observamos que 0 tom de Paulo é intransigente, para dizer o mínimo! Mas isso porque o evangelho é algo acerca do que precisamos ser intransigentes. Porque, primeiro, outro evangelho significa que você está se desviando daquele que 0 chamou (v. 6). Abandonar a teologia do evangelho é abandonar Cristo em pessoa. O que você faz em teologia acaba afetando sua experiência. Em outras palavras, uma diferença na sua compreensão da doutrina leva a uma diferença em sua compreensão de quem é Jesus — e significa que é questionável se de fato você o conhece.

Segundo, outro evangelho não é de fato evangelho (v. 7). Isso quer dizer que a mensagem do evangelho, por natureza, não pode ser alterada, nem de leve, sem se perder. E como um vácuo. Não se pode permitir a entrada de um pouco de ar e * 1 -----------------------------------_ dizer que ele é agora “90% No momento em que revisa o evangelho, você o reverte.

vacuo ou um vacuo enrií quecido de ar”. O vácuo ou é | completo ou não é vácuo, em 1 hipótese alguma! Da mesma forma, a mensagem do evangelho é: você é salvo pela graça por meio da obra de Cristo, e nada mais. Quando você faz qualquer acréscimo a isso, perdeu tudo de uma vez. No momento em que revisa o evangelho, você o reverte.

Terceiro, outro evangelho produz maldição (v. 8,9). Mais adiante, Paulo diz que “evangelhos” diferentes trazem consigo uma maldição. Isso quer dizer, em última análise, que alterar o evangelho é brincar com a vida e a morte eternas. Mas significa também, em sentido muito prático, que medo, ansiedade e culpa (o sentimento de condenação e maldição) sempre estarão atrelados a diferentes “evangelhos”, mesmo nesta vida. Como veremos mais adiante, até os cristãos experimentam às vezes um senso de condenação. Isso acontece porque, em

G álatas 1.1-9

termos funcionais, estão confiando em outros “evangelhos”, outras maneiras de fazer por merecer a salvação. Este “mundo mau” (v. 4) ainda consegue influenciar os que creem.

Agora conseguimos enxergar por que Paulo adota uma linguagem tão intensa e severa. O que está em jogo é algo muito sério: nosso conhecimento de Cristo, a verdade do evangelho e o destino eterno da alma das pessoas. São coisas pelas quais vale a pena lutar, sobre as quais vale a pena discorrer, das quais vale a pena lembrar a nós mesmos e aos outros, continuamente. A franqueza rude de Paulo é por amor. Ele é um Apóstolo com “A” maiúsculo que ama o Senhor, o evangelho do Senhor e o povo do Senhor. Se amarmos como ele amou, entenderemos por que ele escreveu como escreveu — e seremos gratos por isso.

p a ra reflex ã o Perguntas

1. Qual a importância da verdade do evangelho para você? Como isso é demonstrado em sua vida?

2. Por que a compreensão do verdadeiro evangelho nos deixa com raiva dos falsos “evangelhos”?

3. Em qual dos três perigos modernos do falso evangelho você ou sua igreja poderíam cair com maior facilidade?

VERSÍCULOS 10-24 GÁLATAS ■ CAPÍTULO 1$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo se admira de que os gálatas já estejam "passando para outro evangelho"; que outro evangelho tem se infiltrado em você, somando à cruz alguma exigência sua para se sentir aceito?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante da maldição que Paulo pronuncia sobre quem perverte o evangelho, examine onde você tem suavizado a graça acrescentando condições que Deus não acrescentou.$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se o evangelho que você anuncia a si mesmo nas horas de fracasso fosse posto à prova, ele soaria como boa notícia ou como mais uma cobrança?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Surpreendente Graça de Deus$t$, 2,
$conteudo$As igrejas costumam pedir a seus membros que compartilhem um testem unho durante o culto ou na reunião de oração. Aqui encontramos o apóstolo Paulo compartilhando o dele. Na verdade, Gálatas 1.10—2.21 costuma ser chamado de seção autobiográfica da epístola, uma vez que Paulo relata sua conversão e experiências cristãs iniciais. Isso não é algo raro para Paulo; nós o vemos falando sobre a própria conversão e experiência em Atos 22.2b-21 e 26.4-23. Aqui, como em Atos, Paulo não está compartilhando seu testemunho para a inspiração dos outros ou para se recomendar a nós. Ele o faz para refutar as afirmações de pessoas que querem enfraquecer sua mensagem, e só quer que seu testemunho aponte para o Deus da surpreendente graça.

C ontra-argum entos

Quando Paulo nos conta como se tornou um seguidor de Jesus — ou, talvez sendo mais exato, como Jesus fez dele seu seguidor —, defende-se de três ataques que “alguns” (v. 7) estavam fazendo contra ele e sua mensagem do evangelho.

Primeiro, cie refuta a ideia de que chegou à sua mensagem do evangelho por meio de reflexão, raciocínio e pensamento próprios. Conta que, até sua conversão, era “violentamente” hostil à igreja e ao cristianismo (v. 13). Queria “destruí-lo”. Não houve nenhum processo gradual de análise, discussão, revisão.

G álatas 1.10-24

Não havia como a mensagem cristã de Paulo ser produto de sua própria linha de raciocínio. Ao contrário, ela era exatamente o extremo oposto do rumo que ele seguira até então.

O Paulo pré-cristão opunha-se a Cristo com tamanha intensidade, que a demonstração de fé e segurança dos mártires cristãos não causava nenhum efeito sobre ele (At 7.54—8.1). Sua experiência é forte evidência de que se converteu por revelação direta. Como Atos 9.1-9 nos mostra, o Jesus ressurreto foi ao encontro de Paulo e o instruiu diretamente. Paulo não passou por simples transe ou sonho. Cristo estava lá no tempo e no espaço, já que até os outros homens que o acompanhavam reconheceram sua presença (At 9.7). De modo que Paulo se tornou um apóstolo com “A” maiús--------------------------- ----------- culo, como aqueles que eram | | | Paulo não passou apóstolos antes dele (G11.17). |g| pQr simples transe ou

Segundo, Paulo enfra- | | sonho. Cristo estava lá quece a afirmação de que sua jj^ no tempo e no espaço, mensagem do evangelho era derivada de terceiros, ou seja, dos líderes cristãos em J erusalém. “Não consultei ninguém. Também não subi a Jerusalém para encontrar os que já eram apóstolos antes de mim” (v. 16,17). Três anos se passaram entre a conversão dc Paulo e sua primeira viagem a Jerusalém (v. 18,19), e mesmo então ele não foi instruído por ninguém, de nenhuma forma sistemática.

A referência repetida de Paulo aos apóstolos em Jerusalém sugere que “alguns” (v. 7) andavam afirmando que ele obtivera sua mensagem do evangelho a partir desse “quartel-general”. Isso lhes permitiria argumentar: Nós também fomos treinados no O. G. de Jerusalém. E sabemos que Paulo não lhes contou a história inteira. Existem outras coisas que vocês devem fazer a fim de agradar a Deus.

Terceiro, Paulo mostra que seu evangelho dado por Deus “conferia"com a mensagem que os outros apóstolos tinham recebido

G álatas 1.10-24

de Deus. Pedro (v. 18), Tiago (v. 19) e as igrejas da Judeia (v. 22) estavam entre aqueles que “glorificavam a Deus” (v. 24) pelo que ele fizera por Paulo e pela mensagem que lhe entregara. Ele não recebera sua comissão ou mensagem dos outros apóstolos; no entanto, sua mensagem concordava com a que os outros apóstolos tinham recebido do Senhor ressurreto (Lc 24.45-49).

Assim, o relato de Paulo elimina afirmações como: Isso é 0 que Paulo pensa — eis 0 que nós pensamos, e é tão válido quanto; a mensagem de Paulo é excelente, mas incompleta; a mensagem de Paulo é apenas a sua mensagem — não o que a igreja ensina em Jerusalém.

Todavia, o testemunho de Paulo não serve apenas para estabelecer sua autoridade como mestre do evangelho. Ele também ilustra alguns aspectos do que o evangelho da graça é. Você pode pensar: Já tratamos disso no capítulo 1 deste livro\ E foi mesmo — mas esta carta, tanto na estrutura quanto em seu conteúdo, nos mostra que o evangelho da graça sustenta cada passo da vida cristã. Paulo continuará retornando a ele; devemos fazer o mesmo — em nossa vida, em nossas orações, em nossos pensamentos, em nosso testemunho, pregação e ensino.

Surpreendente graça: quem era Paulo

Paulo foi um homem que fez muitas coisas terríveis. Ele “perseguia violentamente a igreja de Deus, tentando destruí-la” (v. 13). Quando Jesus o encontrou na estrada de D amasco, ele já matara muita gente inocente. Estava a caminho de prender e encarcerar outras tantas. Estava cheio de ódio.

No entanto, Paulo era também um homem responsável por muitos feitos religiosos. Passara anos buscando viver de acordo com as tradições e os costumes judaicos. Ele diz que ultrapassara quase todos da sua geração (“da minha idade”, v. 14)

G álatas 1.10-24

quanto a ser zeloso da justiça moral (v. 14). Contudo, nada disso lhe permitira acertar-se com Deus.

Até esse ponto do livro, não nos foi dita a natureza do ensino de “alguns” que estavam tentando “perverter o evangelho de Cristo” (v. 7), mas aqui está a primeira pista. Mais adiante, veremos que eles estavam incentivando os cristãos gentios a se tornarem convertidos plenos ao judaísmo e a guardarem todas as leis mosaicas relacionadas com alimentos e roupas, incluindo a circuncisão (2.12; 3.5; 6.12). Mas Paulo está dizendo: Eu também jáfiz isso! Conheço tudo sobre 0 assunto! Vocês não podem tornar-se aceitáveis a Deus seguindo códigos morais, éticos ou culturais da maneira mais zelosa e detalhada.

Antes da conversão, Paulo era um grande cumpridor de regras religiosas — e tinha consciência disso. Era cheio de orgulho. No entanto, apesar de tudo, ele havia sido não apenas salvo por Cristo, mas também chamado para ser pregador e líder da fé. Seu depoimento é um testemunho poderoso do coração pulsante do cristianismo — o evangelho da graça.

Graça é o favor imerecido e gratuito de Deus operando de maneira poderosa na mente e no coração para transformar vidas. Paulo é 0 exemplo mais claro de que a salvação é só pela graça, não mediante nosso desempenho moral e religioso. Embora seus pecados fossem muito graves, ele havia sido convidado a participar da graça.

A experiência de Paulo prova de modo vivido que o evangelho não é mera “religião”, como o termo costuma ser interpretado. O evangelho nos chama para fora da religião tanto quanto nos chama para fora da irreligião.

Ninguém é tão bom que não precise da graça do evangelho nem tão ruim que não possa recebê-la. Paulo era profundamente religioso, mas precisava do evangelho. Como C. S. Lewis disse certa vez: “O cristianismo deve ser de Deus, pois quem mais poderia tê-lo concebido?”.

G álatas 1.10-24

Surpreendente graça: o que Deus está fazendo

Olhando para trás, Paulo consegue agora reconhecer que a graça soberana de Deus estivera agindo em sua vida muito antes da conversão em si. Quando diz que Deus “desde o ventre de minha mãe me separou” (v. 15), ele quer dizer que a graça de Deus o estivera moldando e preparando a vida inteira para as coisas que Deus o chamaria para fazer.

Isso é espantoso. Paulo resistira a Deus e fizera muita coisa errada (veja At 26.14), mas Deus invalidara todas as suas intenções e usara suas experiências, inclusive os fracassos, para prepará-lo primeiro para a conversão, depois para ser um pregador para os gentios (v. 16). O conhecimento do Antigo Testamento, o zelo, o treinamento, o esforço que ele empregara para se opor a Deus e à sua igreja (v. 13) — tudo estava sendo usado por Deus para quebrantá-lo e capacitá-lo para ser instrumento de Deus na edificação de sua igreja. Deus trabalhara o tempo todo para usar Paulo exatamente no estabelecimento da fé a que ele se opusera (v. 23).

Esse é um tema importante na Bíblia. Em Gênesis, José disse a seus irmãos que o esforço deles para rejeitá-lo como libertador escolhido por Deus — chegando ao ponto de tentar matá-lo, mas acabando por vendê-lo com

No final, ficará claro que toda oposição a Deus só serviu para confirmar e ajudar a concretizar seu desígnio.

sucesso como escravo (Gn 37.5-8,19,20) — na verdade foi instrumento para estabelecer José como seu libertador (Gn 50.19,20). Os apóstolos repetiam constantemente que as pessoas que se opuseram a Jesus só contribuíram para promover os propósitos divinos (At 2.23; 4.27,28). No final, ficará claro que toda oposição a Deus só serviu para confir­ mar e ajudar a concretizar seu desígnio.

G álatas 1.10-24

No capítulo 9 de sua autobiografia espiritual Surprised by joyd C. S. Lewis fala a respeito de Kirkpatrick, um de seus professores na escola. Apelidado de Bofetão, ele era um eloquente lógico e debatedor que ensinou Lewis a construir uma tese e apresentar argumentos fortes. Kirkpatrick era ateu e pretendia fortalecer Lewis em sua própria descrença. Anos mais tarde, contudo, quando Lewis se tornou cristão, ficou evidente que o Bofetão o treinara bem para se tornar um dos maiores defensores da fé cristã do século 20.

O evangelho nos dá um par de óculos através dos quais podemos rever nossa própria vida e enxergar Deus preparando-nos e moldando-nos, inclusive por meio dos nossos próprios fracassos e pecados, para nos tornar vasos da sua graça no mundo.

Mas, afinal, por que tudo isso aconteceu? Por que Deus escolheu, preparou e a seguir chamou Paulo, o orgulhoso perseguidor da sua igreja? Será que foi porque Paulo agradava a Deus de alguma maneira, de qualquer maneira? Não. Foi simplesmente porque Deus “se agradou”de agir assim (v. 15). Deus derramou sua graça amorosa sobre Paulo, não porque ele fosse digno de recebê-la, mas apenas por se deleitar ou ter prazer em fazê-lo. Deus sempre agiu assim. E como Moisés diz ao povo de Deus, Israel, em Deuteronômio 7.7,8: “O Senhor não se agradou de vós nem vos escolheu porque fôsseis mais numerosos do que todos os outros povos, pois éreis menos numerosos do que qualquer outro povo; mas o Senhor vos tirou com mão forte e vos resgatou da casa da escravidão, da mão do faraó, rei do Egito, porque vos amou ?

Deus não nos ama porque somos úteis; ele nos ama pelo simples fato de que nos ama. Esse, é claro, é o único tipo de

,Edição em português: Surpreendido pela alegria (São Paulo: Mundo Cristão, 1998). 2Grifo nosso.

G álatas 1.10-24

amor de que podemos estar seguros, uma vez que é o único tipo de amor que não temos como perder. Isso é graça.

Perguntas | para reflexão

1. Já aconteceu de você se pegar achando que merece a graça de Deus? O que o leva a pensar assim?

2. Como o evangelho da graça liberta você do orgulho e da culpa?

3. Em quais aspectos você consegue perceber que Deus operou em sua vida antes da conversão de modo a equipá-lo para servi-lo posteriormente?

SEGUNDA PARTE

Surpreendente graça: o qu e Deus está fazendo

O Deus da graça salva pecadores como Paulo. Ele revela seu Filho ressurreto tanto para o orgulhoso quanto para o mau — para o religioso e o irreligioso. E trabalha em seu povo antes mesmo de salvá-lo, de modo a conduzi-lo à fé e equipá-lo para o serviço.

Mas não é nesse ponto que a graça dá por concluída sua obra. A graça continua a operar em e por meio de Paulo. O apóstolo testifica não só quem era e como Deus o converteu, mas também como é a vida vivida debaixo da graça.

Primeiro, lemos que Deus se agradou “em revelar seu Filho em mim, para que eu o pregasse” (v. 16). O que Paulo quer dizer aqui não fica claro de imediato. O que significa Deus ter revelado Jesus “em” Paulo? A melhor interpretação é que Paulo está combinando duas experiências em uma. Por um lado, é evidente que Deus revelou Jesus a Paulo na estrada de

G álatas 1.10-24

Damasco. Ali ele enfim compreendeu quem era Jesus. Teve um encontro pessoal com o Cristo vivo. Mas, por outro lado (como demonstra o resto do v. 16), Paulo imediatamente constatou que estava sendo chamado para mostrar a outros quem era Jesus. Assim, podemos dizer que Deus revelou Cristo para Paulo de modo que pudesse revelar Cristo por meio de Paulo.

Isso nos mostra uma diferença crítica entre uma simples pessoa religiosa ou de boa moral e um cristão. O cristão tem mais do que uma crença intelectual em Cristo; ambos estabelecem um relacionamento pessoal. E ele sabe que esse relacionamento não lhe é dado com o intuito exclusivo do seu próprio conforto e alegria pessoal. Sabe que tem a responsabilidade de revelar Cristo a outros por meio de quem é, do que faz e do que diz.

Segundo, vemos algo no caminho de crescimento e discipulado do próprio Paulo. Ele tinha momentos a sós com Deus. Durante os três anos que passou na A rábia (v. 17,18), presumimos que tenha aprendido de Deus muito do que mais tarde ensinou. Embora não devamos pensar que esse período na Arábia tenha sido de solidão (havia cidades prósperas ali), sabemos da importância do estudo, da reflexão e do desenvolvimento da nossa própria familiaridade com Deus. Vivemos em uma época que enfatiza demais a atividade e a realização, e não o suficiente a reflexão e a contemplação.

O cristão tem mais do que um a crença intelectual em Cristo.

(Essa referência à Arábia é única no Novo Testamento. Se interpretarmos o versículo 17 como algo imediato, parece que surge um conflito com Atos 9.19-22, quando Paulo fez algumas pregações na sinagoga logo após seu batismo. Mas a questão que Paulo quer deixar clara aqui é que ele foi para a Arábia, em vez de Jerusalém, para seu primeiro período contínuo de reflexão e preparação.)

G álatas 1.10-24

Tempo a sós com Deus é fundamental para a vida cristã; no entanto, a vida cristã não é solitária. Paulo subiu para Jerusalém não para ser instruído, mas para prestar contas e promover a união (v. 18). Até Paulo precisou trabalhar em união com os outros apóstolos e demonstrar que sua mensagem se coadunava com a deles. Será que nós, com muito mais razão, não precisamos ter a mesma responsabilidade? Nós também devemos estar profundamente enraizados em comunidades eclesiásticas. Temos de evitar o hábito de pegar o que necessitamos aqui e ali, sem jamais sermos enxertados em uma comunidade coesa, composta de outros crentes.

Essa vida cristã enraizada no relacionamento com Deus, por meio de Cristo, mantendo a comunhão e servindo a outros crentes, leva à adoração a Deus. Os cristãos em Jerusalém “glorificavam a Deus por minha causa”, diz Paulo (v. 24). A mudança na vida de Paulo e seu serviço em favor dos outros não levou as pessoas a tratá-lo como uma celebridade, mas a amar a Deus.

Surpreendente graça: com o e la nos transforma

Esta seção inteira do testemunho de Paulo é introduzida pelo versículo 10: “Será que eu procuro agora o favor dos homens ou o favor de Deus?” — ele pergunta. Uma questão com resposta óbvia: o favor de Deus!

O evangelho afasta o espírito de “agradar o homem” — o impulso para conquistar a aprovação dos homens. Ele substitui esse espírito por seu oposto — a ausência da necessidade de conquistar ou buscar a aprovação humana para o que se faz. Em outras palavras, o evangelho produz seguidores de Jesus confiantes e destemidos, que praticam o que é certo sem se preocuparem com a aprovação e a opinião favorável alheia. Paulo diz que não podería ser um “servo de Cristo”, se vivesse para agradar pessoas.

G álatas 1.10-24

Isso significa dizer que o cristão não pode ser e não será alguém que vive para agradar o homem. Isso com certeza enfatiza sua importância!

A Bíblia fala sobre o pecado de agradar o homem sob vários títulos e em frases diferentes. Quando você os coloca todos juntos, descobre que há uma quantidade surpreendente de material sobre o assunto. Provérbios 29.25 diz: “Quem teme o homem arma-lhe ciladas”. Esse temor das pessoas é o oposto do “temor a Deus”. No Antigo Testamento, o temor a Deus não significa ter medo dele, mas estar cheio de respeito, admiração e fascínio por sua grandeza. Portanto, o “temor ao homem” deve referir-se a uma perspectiva humana (ou de uma pessoa em particular, ou de um grupo de pessoas) que faz com que alguém lhe eleve a importância, o venere, anseie pela aprovação dele e tema sua desaprovação. E uma situação em que o desejo pela bênção alheia chega às raias da adoração e da reverência. Quando isso acontece, significa que estamos dando a uma forma de aprovação humana direitos e poderes sobre nosso coração que só Deus deveria ter. Significa que a perda dessa aprovação nos deixará ™*a----------------------------------- tão desolados como se estivéssemos sendo criticados ou condenados por Deus.

O temor ao homem se refere ao desejo pela bênção alheia que chega ãs raias d a adoração.

O temor ao homem se apresenta de diversas maneiras. Quando Saul desobedeceu a Deus, em 1 Samuel 15.24, foi porque teve medo da opinião pública. Quando Sansão cedeu a Dalila (Jz 16), foi porque teve medo de perder a atenção sexual dela.

Em outros lugares, Paulo menciona mais uma forma comum de temor ao homem — que poderiamos chamar de “serviço sob o olhar” (Ef 6.6,7; Cl 3.22,23). Significa executar um trabalho apenas enquanto obtiver a aprovação ou recompensa daqueles

G aiatas 1.10-24

que estão acima de você. Se trabalhar dessa maneira, você fará uma obra inconsistente, de qualidade inferior e negligente. Nunca criará nada para a excelência, pelo simples prazer de criar e fazer um trabalho bem-feito.

Mas, afinal, como o evangelho destrói a necessidade de agradar o homem — o “temor ao homem”? Libertando-nos e motivando-nos para buscarmos “o favor de Deus” (v. 10). No evangelho, descobrimos que confiar em Cristo produz o favor e a aprovação totais e plenos de Deus. Ao olhar para o cristão, Deus enxerga Jesus (3.25-27) — e nos diz: “Em ti me agrado” (Mc 1.11). Deus se agrada de nós.

E porque Deus se agrada de nós, podemos viver de maneira agradável a Deus, o Criador do cosmos. Paulo busca agradar a Deus, em vez de às pessoas (v. 10). Ele insiste com os cristãos para que obedeçam a Deus sacrificialmente, porque isso é “agradável a Deus” (Rm 12.1).

Imagine um pai que está assistindo seu filho amado jogar no time do qual é treinador. Sentado no banco, ele ama o filho plena e completamente. Se o filho esquece suas instruções e comete um erro, isso em nada mudará seu amor por ele ou sua aprovação. O filho tem o amor do pai assegurado, independen- temente de seu desempenho. A aprovação divina nos liberta para vivermos d a m aneira que Deus aprova.

Mas, é claro, o filho quer fazer uma bela jogada. Não por si mesmo — para conquistar o amor paterno —, mas por seu pai, porque já é amado. Se não souber que o pai o ama, seus esforços serão para si mesmo — para conquistar esse amor. Sabendo que o pai já o ama, seus esforços são pelo pai — para agradá-lo.

O cristão tem a garantia do amor e da aprovação de Deus. Ele se agrada de nós em Cristo. Assim, o cristão anseia por obedecer a Deus não por si mesmo, para que Deus o salve, mas

G álatas 1.10-24

por gratidão, sabendo que Deus já o salvou. Por isso, Paulo vive como um “servo de Cristo” (v. 10). A aprovação divina nos liberta para vivermos da maneira que Deus aprova. O evangelho é, ao mesmo tempo, uma certeza e uma motivação poderosa para viver em obediência radical. Não vivemos como Deus quer a fim de nos tornarmos seus filhos, mas em sinal de gratidão por já sermos seus filhos.

O testem unho d e Paulo e o nosso

Paulo não compartilha seu testemunho por hábito, nem com o propósito genérico de inspirar pessoas, nem tampouco porque goste de voltar os refletores para suas experiências pessoais. Ele só o compartilha por acreditar que isso ajudará seus ouvintes a terem um encontro com Cristo e os encorajará a não deixá-lo (v. 6). Ele não tem a menor vontade de chamar a atenção ou de ser aclamado. Está focado por inteiro nos ouvintes. Não os usa para exaltar o próprio ego, mas utiliza seu testemunho para ajudar seus amigos.

Paulo aqui é um bom exemplo para nós. Mostra-nos que devemos ter a coragem de ser vulneráveis e falar em nível pessoai sobre o sentido do evangelho para nós. Por quê? Porque o cristianismo é um apelo para levarmos nossa vida inteira, mente e coração, a Cristo. Deixar de fora o que pensamos ou como nos sentimos é dar uma imagem incompleta do quanto o compromisso cristão é abrangente. Se excluímos nosso testemunho, também transmitimos uma imagem incompleta do quanto a realização cristã é ampla. Cristo não apela só à nossa mente, ele enche nosso coração. Culturas e personalidades diferentes dão ênfases diferentes ao cognitivo (compreensão intelectual) e ao experimental (sentimento). Se você omitir seu testemunho, as culturas e

Cristo nâo apela só à nossa mente, ele enche nosso coração.

G álatos 1.10-24

temperamentos mais focados no coração deixarão de enxergar a capacidade de atração do cristianismo.

Ao mesmo tempo, Paulo também nos lembra de que só devemos compartilhar nosso testemunho se ele for útil para outras pessoas. Por estranho que pareça, é muito fácil usá-lo de modo a ofuscar o evangelho.

Se enfatizarmos detalhes dramáticos, sanguinolentos ou sexuais, talvez transmitamos apenas a mensagem: Vejam que caso incrível eu sou! Paulo recorre ao testemunho pessoal só para deixar claro o evangelho. Não compartilhamos nossa história em benefício próprio, mas para ajudar outros a entender e encontrar Cristo, para guiá-los em direção ao maravilhoso evangelho da graça que transformou nossa vida e que sabemos ser capaz de transformar a deles também.

para reflexão Perguntas

1. Como você pode viver de modo que as pessoas respeitem e louvem mais a Deus por sua causa?

2. Quando você se sente mais tentado a temer os homens e buscar a aprovação deles? O que mudaria se, nesses momentos, você vivesse para agradar ao Deus que se agrada de você?

3. Até que ponto você está comprometido em passar tempo com Deus... em passar tempo com outros crentes... em passar tempo contando seu testemunho a outros?

VERSÍCULOS 1-10 GÃLATAS - CAPÍTULO 2$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo diz que não busca agradar a homens, mas a Deus; em que escolhas recentes você percebe estar vivendo mais para a aprovação das pessoas do que para a de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A conversão de Paulo veio por graça pura, e não por um mérito que ele construiu; que parte da sua história com Deus você ainda atribui ao seu esforço em vez de à graça que o alcançou?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se Deus separou Paulo "desde o ventre", apesar de seu passado de violência contra a igreja, que pecado do seu passado você ainda usa para duvidar de que a graça também o tenha alcançado de graça?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Unidade do Evangelho$t$, 3,
$conteudo$Deveriamos ler essa passagem com grande temor e gratidão. Ela nos leva a uma reunião em Jerusalém que talvez pareça distante das preocupações dos cristãos do século 21. Mas, na verdade, o que estava em jogo não podia ser mais precioso — foi uma reunião com consequências enormes para todos nós, mesmo hoje. E, como veremos, Deus nos protegeu a todos — inclusive você e eu — naquele dia.

O tem or d e Paulo: por qu e e le foi

Ainda escrevendo em tom autobiográfico, Paulo nos transporta para “depois de catorze anos”, em relação a sua primeira visita a Jerusalém, quando subiu “outra vez”, acompanhado de dois integrantes de confiança da sua equipe missionária, Barnabé e Tito (v. 1).

Por que ele resolveu ir até lá? “Por causa de uma revelação” de Deus é a razão externa, e o medo, a interna (v. 2). Isso deveria fazer com que parássemos um instante. O Paulo que conhecemos em Atos e por suas cartas não é homem propenso a sentir medo! Primeiro, ele fora um ousado perseguidor da igreja; depois, tornou-se um pregador do evangelho ainda mais ousado. Então, por que esse homem sentia medo agora?

À primeira vista, podería parecer que Paulo estava preocupado com a possibiüdade de ter errado em sua mensagem ou métodos. Por isso, voltou a Jerusalém para se encontrar com os outros apóstolos “em particular”, a fim de expor “a eles [os líderes] o evangelho que prego entre os gentios” (v. 2) e obter confirmação de que estava agindo certo. Mas isso é impossível por diversas razões.

Primeiro, Paulo foi a Jerusalém “por causa de uma revelação” de Deus (v. 2). Isso nos lembra que ele era um apóstolo com acesso direto a Deus. Recebera seu evangelho dos lábios do Cristo visível, ressurreto (1.12). Não faz o menor sentido alguém ter revelações de Deus e depois ir obter autorização de seja lá quem for! Segundo, caso se sentisse inseguro, por que esperar 14 anos antes de retornar a Jerusalém? E terceiro, Paulo disse em 1.8 que os gálatas deveriam rejeitar a ele próprio (“nós mesmos”) se chegasse e dissesse que mudara de ideia acerca do evangelho!

Nada ameaçava sua certeza, mas alguma coisa estava ameaçando sua capacidade de darfrutos.

Se os outros apóstolos não confirmassem sua mensagem e não renunciassem aos falsos mestres, seria muito difícil para ele manter seus convertidos. Falsos mestres andavam dizendo a esses jovens cristãos que Paulo pregava um evangelho inadequado e não tão completo quanto o evangelho apostólico original pregado pelos líderes de Jerusalém. Insistiam em que Paulo ensinava um “credo fácil”, sua própria mensagem excêntrica.

Paulo sabia que sua mensagem fora revelada por Deus, portanto era verdadeira. Mas ele não seria capaz de manter suas igrejas debaixo do ensino sadio do evangelho, se não conseguisse refutar essas mentiras. Por isso temia o perigo de ter “corrido inutilmente” (v. 2). Receava que seu ministério fosse abafado e relativamente infrutífero.

De igual modo, a viagem de Paulo não fora motivada por medo de que os apóstolos de Jerusalém não tivessem o evangelho verdadeiro. O que ele temia, isto sim, é que os apóstolos de Jerusalém pudessem não ser fiéis a esse evangelho. Talvez

G álatas 2.1-10

não fizessem frente aos falsos mestres, mas, em vez disso, permitissem que os próprios preconceitos culturais os iludissem a ponto de deixar que esses mestres continuassem a fazer suas afirmações prejudiciais.

O q u e esta v a em Jogo: a verdadeira u n id a d e d a igreja

De um lado dessa disputa, temos Paulo a afirmar: O evangelho da fé em Cristo é para gente de todas as culturas. Do outro lado, temos seus opositores dizendo: Nem todo 0 povo judeu é cristão, mas todos os cristãos devem se tornar judeus.

Se os apóstolos de Jerusalém tivessem tomado o partido de quem ensinava contra Paulo, ou mesmo se os tolerassem, teriam dividido a igreja em duas. Nenhum dos lados teria aceitado o outro plenamente, e ambos questionariam se os membros do outro grupo eram mesmo salvos! As igrejas gentias de Paulo duvidariam de que as igrejas judaicas tivessem mesmo fé em Cristo, e as igrejas judaicas também duvidariam da salvação dos gentios.

John Stott analisa a questão do seguinte modo:

Uma coisa era os líderes de Jerusalém aprovarem a conversão dos gentios; mas conseguiríam aprovar [...] o compromisso com o Messias sem a inclusão no judaísmo? A visão deles seria ampla o suficiente para enxergar o evangelho de Cristo não como um movimento reformista dentro do judaísmo, mas como boas-novas para o mundo inteiro, e a igreja de Cristo

[...] como a família internacional de Deus?1

Os outros apóstolos haviam permanecido em Jerusalém e não tinham pensado nas implicações do evangelho para os gentios

1 The message o f Acts (Downers Grove: IVP, 1968), p. 241 [edição em português: A mensagem deAtos (São Paulo: ABU, 1994)].

G álatas 2.1-10

que estavam se convertendo do paganismo. Simplesmente, não tinham se defrontado com a maioria dessas questões na prática. Seria muito fácil para eles deixar de perceber as implicações do evangelho, quando se tratava de viver como um cristão gentio. Teria sido natural para eles dizer: “Claro que todos os cristãos devem comer comida k o s h e r ! ”, ou coisa parecida. Mas os desdobramentos desse “pequeno” erro teriam sido enormes. Existiríam dois partidos opostos dentro do cristianismo, hostis um ao outro na questão fundamental da necessidade de acrescentar comportamentos externos à crença interna em Cristo a fim de sermos salvos.

Os desdobram entos desse "pequeno" erro teriam sido enormes.

Por isso Paulo disse que “a liberdade que temos em Cristo Jesus” (v. 4) se encontrava sob ameaça e que, portanto, “a verdade do evangelho” estava em jogo (v. 5). Essa reunião podia ter acabado por dividir a igreja, ainda em estágio tão inicial de sua vida, fazendo emergir duas religiões diferentes. Não admira que Paulo sentisse medo. O que estava em jogo não podia ser mais valioso.

O veredicto: bem -vindos

Foi crucial que Paulo estivesse “levando Tito também” (v. 1). Ele era grego (v. 3) — um cristão incircunciso de corpo e alma. Os “falsos irmãos” (v. 4) de Paulo que “haviam se intrometido” na igreja teriam insistido em que, a fim de ser salvo, Tito precisava confiar em Cristo e viver de acordo com os rituais judaicos, como a circuncisão. Assim, em Tito, Paulo confrontou os outros apóstolos com um estudo de caso concreto. A reunião de Jerusalém não podia ser uma discussão abstrata. Exigiríam que Tito fosse circuncidado ou não?

“Mas nem mesmo Tito, que estava comigo, foi forçado a se circuncidar, embora fosse grego” (v. 3). Pela graça de Deus,

G álatas 2.1-10

os apóstolos de Jerusalém se mostraram à altura dos acontecimentos e passaram da teoria à prática. Não insistiram na circuncisão de Tito antes de terem comunhão com ele. “Deus não considera a aparência humana” (v. 6). A aparência exterior tem a ver com nossos atos; a interior, com nosso ser; e o cristianismo tem a ver com quem sou em Cristo, não com o que faço por ele.

Tito era um estudo de caso concreto. Os apóstolos exigiriam que ele fosse circuncidado ou não?

Paulo diz que “nada me acrescentaram” (v. 6), ou seja, à sua mensagem. Os apóstolos de Jerusalém concordaram que só a fé em Cristo, e não outra proeza ou ritual qualquer, é necessária para a salvação. A aceitação de Tito por parte deles foi prova de que tinham aceitado o ministério de Paulo e essas implicações radicais do evangelho.

Tais implicações são fundamentais para nossa compreensão do que é a fé cristã. As inúmeras regras para “purificação” das leis de Moisés foram projetadas (entre outras coisas) para nos mostrar como é impossível nos tornarmos perfeitamente aceitáveis diante de um Deus santo. Mas os “falsos irmãos” tinham usado essas regras a fim de ensinar exatamente o oposto: que podemos nos tornar puros e mais aceitáveis a Deus mediante a estrita conformidade às regras.

O número de vezes que o Novo Testamento fala sobre esse erro mostra como é fácil entender tudo errado. “Tanto ofertas como sacrifícios que se oferecem não podem aperfeiçoar quem presta o culto. Essas coisas se referiam somente à comida, bebida e às diversas lavagens cerimoniais, ordenanças humanas impostas até o tempo de uma reforma” (Hb 9.9,10; veja também Cl 2.16). Só em Cristo podemos nos tornar “santos, inculpáveis e irrepreensíveis diante dele” (Cl 1.22). Em outras palavras, as leis cerimoniais não foram tanto abolidas ou

G aiatas 2.1-10

substituídas, e sim cumpridas. Elas são cumpridas em Cristo; é Cristo que nos purifica (veja Mc 7.14-19; Jo 13.2-11).

Portanto, a aceitação de Tito pelos crentes judeus serviu como uma ilustração vivida desse princípio, segundo o qual o indivíduo se torna espiritualmente puro e aceitável através de Cristo, e não por meio de quaisquer feitos ou rituais. Precisamos continuar repetindo essa verdade para nós mesmos e uns para os outros, como fez o Novo Testamento. Os gentios puderam tornar-se membros plenos do povo de Deus sem se tornarem judeus em costumes ou cultura. A aceitação de Tito foi uma declaração pública radical das implicações do evangelho.

O resultado: lib erd ad e

No versículo 4, Paulo caracteriza os dois lados desse argumento de maneira esclarecedora. Os “falsos irmãos” que haviam se infiltrado nas igrejas gentias queriam, diz ele, “nos escravizar”, impedindo-os de desfrutar da “liberdade que temos em Cristo Jesus”. Ele está dizendo que o evangelho bíblico dá liberdade, ao passo que a mensagem de seus oponentes — “faça por merecer sua salvação” — conduziría as pessoas só à escravidão.

Esse é um assunto que ele retomará ao longo da carta (em especial em 4.21-31). Mas, afinal, como o evangelho produz liberdade?

Primeiro, o evangelho leva à liberdade cultural. A religião moralista tende a pressionar seus membros a adotarem regras e regulamentos muito específicos quanto ao que vestir e como se comportar no dia a dia. Por quê? Se sua salvação depende da obediência a regras, você quer que essas regras sejam muito específicas, exequíveis e claras. Você não quer um simples: Ame seu próximo como a si mesmo, porque esse é um padrão inatingível de tão alto, com implicações infinitas! Você quer: Não vá ao cinema ou Não ingira álcool ou Não coma esse tipo de comida.

G álatas 2.1-10

Mas regras e regulamentos desse tipo são da área da vida cultural diária. Se os falsos mestres tivessem imposto sua vontade, um italiano ou africano não poderia tornar-se cristão sem se tornar culturalmente judeu. Os cristãos teriam de formar pequenos guetos culturais em cada cidade. Isso significaria dar muito mais ênfase à separação cultural externa do que à distinção interna de espírito, motivação, percepção e perspectiva. Elevar a adequação cultural ao nível da virtude espiritual induz os cristãos a uma ênfase escravizante no culturalmente “bom” e “apropriado”, além de promover atitudes intolerantes e preconceituosas.

Se sua salvação depende da obediência a regras, você quer que essas regras sejam muito específicas, exequíveis.

Segundo, o evangelho leva à liberdade emocional. Quem acredita que nosso relacionamento com Deus se baseia na observação de um comportamento moral caminha sobre uma esteira móvel infinita de culpa e insegurança. Como revelam as cartas de Paulo, ele não liberou os crentes gentios dos imperativos morais dos dez mandamentos. Os cristãos não podiam mentir, roubar, cometer adultério e assim por diante. Todavia, mesmo não estando livres da lei moral como um modo de vida, os cristãos estão livres dela como um sistema de salvação. Obedecemos, não por medo e insegurança quanto à esperança de merecer nossa salvação, mas na liberdade e segurança de saber que já estamos salvos em Cristo. Obedecemos na liberdade da gratidão.

Logo, tanto os falsos mestres quanto Paulo disseram aos cristãos para obedecerem aos dez mandamentos, mas por razões e motivações completamente diversas. E, a menos que seu motivo para obedecer a lei de Deus seja a gratidão pela graça do evangelho, você está em escravidão. O evangelho oferece liberdade, tanto em termos culturais quanto emocionais. O “outro evangelho” destrói as duas coisas.

G aiatos 2.1-10

para reflexão Perguntas

1. Já houve ocasiões em que você começou a pensar que seu desempenho conta para sua salvação? O que o levou a pensar dessa maneira?

2. Quais as atitudes “boas” e “apropriadas” que sua cultura e criação lhe ensinaram? Como você poderia acrescentar essas coisas à crença em Cristo como uma expectativa para outros cristãos?

3. Você já se sentiu culpado ou inseguro em seu relacionamento com Deus? O que isso pode lhe dizer a respeito do modo como você vê sua aceitação por parte dele?

SEGUNDA PARTE

D uas m arcas d a verdadeira u n id ad e

Em uma época de igrejas divididas e rixas denomínacionais, é muito fácil deixar de perceber a repetida ênfase que o Novo Testamento coloca na unidade cristã. Afinal, como é a verdadeira unidade cristã?

Primeiro, como temos visto, ela significa aceitar qualquer um e todos aqueles que estão “em Cristo Jesus” (v. 4), independentemente de seus antecedentes culturais e étnicos. O cristão norte-americano tem muito mais em comum com o crente no evangelho que leva uma existência nômade nas planícies mon- góis do que com o incrédulo que é seu vizinho de rua, que dirige um carro semelhante ao seu e cujos filhos frequentam a mesma escola que os seus. A unidade cristã não leva em consideração distinções culturais nem depende da similaridade cultural.

A unidade crista não leva em consideração distinções culturais.

Portanto, assim comoTito não foi “forçado a se circuncidar” (v. 3), não devemos hoje insistir em acréscimos à fé no evangelho.

G álatas 2.1-10

Algumas igrejas ensinam que temos de crer em Cristo e ser batizados a fim de alcançarmos a salvação. Outras insistem em que devemos integrar seu rol de membros para que sejamos salvos. Muitos tipos de cristianismo acrescentam ao evangelho distinções próprias, como a crença na predestinação, a abstinência do álcool ou o falar em línguas como meios de termos certeza de que somos cristãos. Em outras palavras, muitas igrejas dirão que somos salvos só pela fé, mas que, para termos certeza de que somos cristãos de verdade, só se apresentarmos tais distinções. Muitas igrejas e grupos cristãos adicionam regras culturais à Bíblia — sobre coisas como o modo de vestir e de se divertir — e insistem em que ninguém que viole esses padrões pode ser cristão.

Segundo, ela significa reconhecer que temos chamados diferentes. Os apóstolos reconheciam isso entre si: “viram que o evangelho da incircuncisão me havia sido confiado, assim como a Pedro o evangelho da circuncisão” (v. 7). Embora Pedro e Paulo pregassem “o [mesmo] evangelho”, reconheciam que existem modos diferentes de abordá-lo. Há quem tenha dons e habilidades para transmitir o evangelho a determinado grupo de pessoas, e há quem os tenha para transmiti-lo a um grupo diferente.

Disso se subentende que podemos adaptar o evangelho a diferentes pessoas, ao mesmo tempo em que lhe conservamos a essência. Essa é uma conclusão importante para a missão. Se falharmos por não adaptar a mensagem do evangelho ao interesse das pessoas, ou se exagerarmos ao fazê-lo e perdermos sua essência, fracassaremos em convencer e conquistar outros para a alegria e a liberdade do evangelho.

Quais são as maneiras mais comuns de fracassarmos na preservação da mensagem hoje? Algumas igrejas e cristãos têm adaptado o evangelho ao mundo moderno retirando os elementos “ofensivos”, como milagres de qualquer natureza ou a pretensão de que só se pode chegar a Deus através de Cristo.

G álatas 2.1-10

Mas, nesses casos, o próprio evangelho se perdeu, uma vez que ficamos na posição de ter de salvar a nós mesmos sendo bons. Esse é um fracasso de preservação.

Por outro lado, é possível ir longe demais na direção oposta e deixar de se adaptar. Muitas igrejas e cristãos se vinculam de tal forma a sua música ou organização ou jargões, que não se dispõem a implementar mudanças para incorporar gostos e suscetibilidades de quem vem de fora.

Por irônico que pareça, se você subadapta ou superadapta, “perde” o evangelho. Se eleva suas tradições à condição de elementos inegociáveis, cria, basicamente, um sistema de legalismo. E como se dissesse: cristãos verdadeiros sempre fazem as coisas dessa maneira. Assim, tanto o conservadorismo e o legalismo (não adaptação) quanto o liberalismo (não preservação) conseguem ameaçar o evangelho. Os apóstolos estavam determinados a preservar a mensagem do evangelho e suas consequências para o estilo de vida; mas estavam igualmente preparados para adaptar os meios à mensagem.

Se você eleva suas tradições à condição de elementos inegociáveis, cria, basicam ente, um sistema de legalismo.

A terceira m arca d esafiad ora

Terceiro, e talvez surpreendentemente: a unidade cristã significa que deveriamos continuar nos lembrando “dos pobres” (v. 10). Pedro e Paulo podem ter sido chamados para campos missionários diferentes, mas ambos estavam obrigados a cuidar dos pobres. Os apóstolos de Jerusalém queriam insistir nisso e encontraram em Paulo um trabalhador disposto, ávido por fazê-lo de qualquer maneira (v. 10). Por que lembrar-se dos pobres é tão fundamental para a unidade cristã?

G álatas 2.1-10

Por dois motivos: um genérico e um particular. O motivo particular, no contexto da reunião em Jerusalém, dizia respeito ao fato de as igrejas judaicas serem muito mais pobres do que as igrejas que Paulo estava implantando nas regiões gentias. Donald Guthrie analisa a questão do seguinte modo:

A condição dos cristãos judeus [era tal que] sua pobreza pro- vocou a solidariedade das igrejas gentias (veja Rm 15.25-28;

ICo 16.1-4; 2Co 8— 9).2

Portanto, os apóstolos de Jerusalém insistiam em que as igrejas gentias e judias permanecessem firmemente interconectadas, compartilhando recursos umas com as outras, da mesma forma que os recursos eram compartilhados na igreja local (At 4.32).

O motivo genérico é que o cuidado com os pobres é um tema constante na Bíblia. Aqui está um resumo (muito condensado!) do ensinamento bíblico sobre o assunto.

Jesus prova a João Batista que é o Cristo salientando que cura corpos e prega aos pobres (Mt 11.16 ,)־como os profetas disseram que faria (Is 11.1-4; 61.1,2). Ele ensina que todo aquele de fato tocado pela graça de um Deus misericordioso será ativo na ajuda aos necessitados (como sugerido por Lc 6.35,36; Mt 5.43-48). Deus julgará se temos ou não a fé justificadora observando nosso trabalho em favor do pobre, do refugiado, do enfermo e do encarcerado (Mt 25.44-46).

E claro, Jesus serviu como o exemplo perfeito disso. Em sua encarnação, ele “passou a viver” com os pobres (Lc 2.24;

2C0 8.9). Viveu, comeu e se juntou com a classe mais baixa da sociedade. Deu a isso o nome de “misericórdia” (Mt 9.13).

2Galatians, New Century Commentary (London: Marshal, Morgan & Scott, 1973), p. 83.

A Bíblia nos manda imitá-lo (2C0 8.8-15). Os cristãos devem abrir as mãos ao necessitado conforme houver necessidade (1J0 3.16,17; veja Dt 15.7,8), e, dentro da igreja, a riqueza deve ser compartilhada com grande generosidade entre ricos e pobres (2Co 8.13-15; veja Lv 25). Fazendo eco aos profetas, os apóstolos ensinam ser inevitável a fé verdadeira mostrar-se através de atos de misericórdia (Tg 2.1-23). O materialismo é ainda um pecado cruel (Tg 5.1-6; lTm 6.17-19).

Não só todos os crentes têm essas responsabilidades, como também uma classe especial de oficiais — os diáconos — é estabelecida para coordenar o ministério de misericórdia da igreja (At 6.1-7). Isso mostra que o ministério de misericórdia é uma obra ordenada e obrigatória da igreja, assim como o ministério da palavra e a disciplina (Rm 15.23-29). Paulo diz aos presbíteros efésios, em seu discurso de despedida, que lhes ensinara todo o propósito de Deus (At 20.27). E bastante significativo, portanto, que em suas últimas palavras ele os exorte a ofertar para o fraco e 0 pobre (v. 35). Não só ele considerava a misericórdia para com o pobre uma parte do propósito total de Deus, como também acreditava que ela era crucial, a ponto de fazer dela objeto do último encorajamento que lhes endereçou — como fizeram os apóstolos de Jerusalém com ele, em Gálatas 2.10. Os cristãos devem estar unidos no cuidado com os pobres, e esse deve ser um dos traços que os caracterizam.

Os lim ites d a u n id ad e

É fácil fazermos pouco caso da unidade cristã hoje, concentrando-nos naquilo que nos divide dos companheiros crentes no evangelho, em vez de focarmos no Senhor e Salvador que nos uniu. Mas o erro oposto é igualmente perigoso: dar importância demais à unidade em detrimento de ela ser cristã.

Lembre-se, essa questão — o motivo da viagem de Paulo a Jerusalém — surgiu “por causa dos falsos irmãos que haviam

G aiatas 2.110־

se intrometido” na igreja (v. 4). A reunião só aconteceu porque Paulo não estava nada disposto a compartilhar a igreja com quem ensinava um evangelho diferente. O relacionamento de cooperação entre os apóstolos era baseado na verdade compartilhada do evangelho. Paulo e seus companheiros todos receberam “a mão direita da comunhão” dos líderes de Jerusalém (v. 9). “Estender a mão direita” era um sinal de amizade, cooperação e aprovação no mundo antigo, assim como hoje. Era mais do que um gesto de cortesia. O gesto teve o efeito de isolar e desacreditar os falsos mestres. Eles não podiam mais dizer que representavam Tiago, Pedro e João (como evidentemente tinham feito; v. 2.12). Ao incluir Paulo, Barnabé e 0 incircuncisoTito,os apóstolos de Jerusalém excluíam os falsos mestres. Ao estabelecer a unidade do evangelho, também marcavam os limites dessa unidade — e os “falsos irmãos” ficaram de fora.

A comunhão com Cristo é base suficiente de comunhão um com o outro. Nunca devemos excluir alguém a quem Deus incluiu em seu povo. Mas, de igual modo, a comunhão com Cristo é a única base para a comunhão um com o outro. As igrejas não devem manter a unidade em detrimento do evangelho.

Liberdade e comunhão

são dois grandes anseios do Liberdade e comunhão coração humano. Nenhum dos dois é satisfeito em definitivo por qualquer visão de mundo ou religião baseada são dois grandes anseios do coração humano.

em dogmas do tipo “faça por merecer sua salvação”. Eles dividem as pessoas em fileiras culturais e as escravizam emo- cionalmente. É “em Cristo Jesus” que conseguimos desfrutar da liberdade da aceitação por Deus, independentemente do nosso desempenho, e que podemos desfrutar de uma unidade que não dá atenção nenhuma às fronteiras de países ou culturas. Foi essa unidade e essa liberdade que 0 evangelho de

G álatas 2.1-10

Paulo ofereceu, e foi em defesa delas que Deus o instigou a ir a Jerusalém, dois mil anos atrás. Divisão e escravidão eram coisas a que Paulo não se submetería (v. 5) — tampouco nós devemos fazê-lo!

para reflexão Perguntas

1. Você consegue pensar em exemplos de igrejas que não valorizam o suficiente a unidade do evangelho ou que buscam a unidade institucional à custa da verdade do evangelho?

2. Como você tem cuidado dos pobres? Como Gálatas 2.10 encorajou e/ou desafiou você?

3. Tanto em sua vida pessoal quanto como parte de uma igreja, você tende a superadaptar ou a subadaptar o evangelho à cultura que o cerca?

VERSÍCULOS Π -21 GÃLATAS ■ CAPÍTULO 2$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo resiste a acrescentar a circuncisão à fé "para que a verdade do evangelho permanecesse"; que pequenas exigências extras você tem deixado se tornarem condição da sua paz com Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A unidade da igreja em Jerusalém girou em torno de sermos salvos só pela fé em Cristo; onde a sua maneira de avaliar outros cristãos revela que, no fundo, você ainda os mede pelo desempenho?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que Deus protegeu o evangelho da graça naquele dia também por você, como muda o modo como você descansa hoje no que Cristo fez, e não no que você faz?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Vivendo Conforme o Evangelho$t$, 4,
$conteudo$A visita de Paulo a Jerusalém estabeleceu a grande verdade unificadora de que somos salvos pela fé em Cristo; nada mais, nada além. Agora ele muda o foco; em vez de se colocar ao lado de Pedro em Jerusalém, capital de Israel, coloca-se contra ele em A ntioquia, uma cidade gentia. Nas duas ocasiões, o que importa para Paulo, acima de qualquer coisa, é o evangelho — evangelho que, neste trecho da carta, ele resume pela primeira vez como “justificação pela fé”.

M odos à m esa

O versículo 11 é surpreendente; temos aqui o encontro de dois apóstolos, quando um deles lembra que enfrentara outro porque este merecia “ser repreendido”. O que poderia levar dois apóstolos a tal situação?

Paulo explica a situação de maneira simples. Pedro mudara seus hábitos alimentares: “ele estava comendo com os gentios; mas [...] foi se afastando e se separando deles” (v. 12).

Antes de mais nada, para o cristão do primeiro século, muito mais surpreendente do que Pedro parar de comer com os gentios seria o fato de ter começado a comer com eles.

O Antigo Testamento instituiu as “leis da purificação” — uma complicada série de regulamentos a serem seguidos

G álatas 2.11-21

pelos adoradores a fim de estarem “cerimonialmente limpos” e aceitáveis para se apresentarem a Deus na adoração. As pessoas não podiam se aproximar de Deus se tivessem ingerido determinados alimentos “impuros”, tocado coisas mortas, contraído uma enfermidade ou tocado em alguém enfermo, e assim por diante (veja Lv 11; 15; 20). Essa lei “cerimonial” era um método de ensino pelo qual o Deus santo mostrava que pessoas pecadoras não podem entrar em sua presença sem se purificarem. Apesar de Jesus explicar que, com sua chegada, o tempo dessas leis havia passado (Mc 7.14-23), foi preciso Deus enviar a Pedro uma visão para lhe mostrar por que a lei cerimonial terminara. Pedro viu um grande lençol cheio de animais que o Antigo Testamento proibia comer e ouviu uma voz dizendo: “Pedro, mata e come. [...] Não chames de profano ao que Deus purificou” (At 11.7,9). Imediatamente, ele se encontra com um gentio arrependido, Comélio, que recebe Cristo e nasce de novo. O apóstolo constata: “Deus não trata as pessoas com base em preferências. Mas, em qualquer nação, aquele que o teme e pratica o que é justo lhe é aceitável” (At 10.34,35).

A partir de então, ele come com gentios, apesar das críticas (11.2). Mesmo tempos depois, Pedro argumenta que os gentios tiveram purificado “o coração pela fé” (15.7-9). Ele passou a comer com os gentios porque Deus lhe mostrara que ninguém é “impuro” em Cristo.

Assim, quando Pedro se afastou dos gentios, tornou-se culpado de “hipocrisia” (G1 2.13). Não mudara suas convicções — sabia que as leis dos alimentos e das vestes eram apenas costumes judeus, e não guardava todos eles (v. 14). Mas, em se tratando de gentios, ele simplesmente parara de agir de acordo com essas convicções. E sua hipocrisia era infecciosa, “a ponto de até Barnabé [um companheiro de missão do gentio incircunciso Tito!] se deixar levar pela hipocrisia deles” (v. 13).

G álatas 2.11-21

O que causou essa hipocrisia? O medo (v. 12). É provável que Pedro temesse a crítica daqueles que “eram da circuncisão” — que é como Paulo descre_____________________ _____ ve os mestres da “salvação por j||| Pedro havia meio de Cristo e mais algu ma coisa”.

simplesmente parado de agir de acordo com xaeoE suas convicções. isso, o orgulho racial deve ter entrado na equação. Fora incrustada em Pedro e em todos os judeus, desde a juventude, a noção de que os gentios eram “impuros”. Embora escondida atrás da fachada da observância religiosa, é provável que Pedro e outros cristãos judeus ainda sentissem desprezo pelos cristãos de origem nacional e racial “inferior”. Pedro estava permitindo que diferenças culturais ganhassem maior importância do que a unidade do evangelho.

Contudo, somando-se ;

Andar n a linha

Paulo não considera o comportamento do colega apóstolo essencialmente rude, ou descortês, ou hostil, como o veriamos, mas, em poucas palavras, percebe que há alguma coisa mais profunda acontecendo. Pedro não agia “corretamente, conforme a verdade do evangelho” (v. 14).

O sentido literal do que Paulo diz é que ele não estava “orto -andando com o evangelho”. (O prefixo orto quer dizer ser correto; assim, vamos ao ortodontista para endireitar os dentes.) Isso significa, primeiro, que o evangelho é uma verdade — ele é uma mensagem, não um conjunto de alegações. Inclui o fato de que somos fracos e pecadores, de que buscamos controlar nossa vida sendo nossos próprios salvadores e senhores, de que a lei de Deus foi cumprida por Cristo em nosso favor, de que agora somos plenamente aceitos, embora continuemos na condição de pecadores e imperfeitos.

G álatas 2.11-21

Em segundo lugar, significa algo de extrema importância: que a verdade do evangelho tem um vasto número de implicações para toda a vida. E nossa função colocar tudo que faz parte de nossa vida “em conformidade” com a direção, com o sentido para o qual o evangelho nos impulsiona. Devemos pensar bem em suas implicações para cada área da nossa vida e buscar colocar nosso pensamento, sentimento e comportamento “em conformidade” com elas.

A “verdade” do evangelho está em franca oposição aos pressupostos do mundo. Todavia, como vivemos no mundo, adotamos vários de seus pressupostos. A vida cristã é, portanto, um contínuo processo de realinhamento, de colocar tudo em conformidade com a verdade do evangelho.

A vida cristã é um contínuo processo de

O erro d e Pedro (e o nosso?)

Em poucas palavras, o pecado de Pedro foi o do nacionalismo. Ele insistiu em que os cristãos não podem agradar a Deus de verdade a menos que se tornem judeus. O nacionalismo é só uma forma de legalismo. O legalismo busca algo além de Jesus Cristo a fim de se apresentar aceitável e puro diante de Deus. Ele resulta sempre em orgulho e medo, no campo da psicologia, e em exclusão e conflito, no campo social.

Hoje em dia, há muitos exemplos de comportamentos sociais exclusivistas semelhantes, baseados no fracasso em compreender e praticar a justificação pela fé. Aqui estão apenas alguns.

Um deles é o sectarismo. Toda denominação ou grupo cristão conta obrigatoriamente com várias distinções de fé e prática, as quais têm menos a ver com as convicções fundamentais do evangelho e mais com crenças específicas acerca de comportamento ético ou política eclesiástica. É muito fácil

G álatas 2.11-21

acentuar nossas diferenças para mostrar a nós mesmos e aos outros que nossa igreja é superior ou a melhor.

Outro exemplo é quando se levam atitudes classistas, nacionalistas ou racistas do mundo para dentro da igreja. Todos conhecemos cristãos que se enquadram em classes, grupos ou tipos de personalidade que eram objeto do nosso desdém na vida que levávamos antes, fora da igreja. Cristãos da classe operária podem ter aversão aos provenientes de um ambiente mais “refinado”, e o contrario também é fato. Cristãos de determina posição política podem se aborrecer com a presença daqueles do outro extremo do espectro. Cristãos muito talentosos podem se sentir infelizes quando pessoas que consideram medíocres são tratadas como iguais em sua igreja. Cristãos socialmente polidos sentem-se pouco à vontade perto de crentes com menos traquejo social ou socialmente marginalizados, e o contrário também é verdadeiro.

Podemos nos sentir desconfortáveis em torno de pessoas cuja ênfase cultural é diferente da nossa. E podemos reagir a tudo isso como Pedro fez, de modo aparentemente educado.

Por educação, sentamo-nos junto “dessas outras pessoas” na igreja, mas não “comemos” com elas; não nos tornaremos seus amigos de verdade. Não manteremos contato social com elas, com quem tampouco compartilharemos nossa vida, casa e outras coisas. Nosso relacionamento será formal e as veremos apenas em reuniões oficiais da igreja.

Por educação, sentamo-nos junto "dessas outras pessoas" na igreja, mas nâo "comemos" com elas.

Tudo isso advém de não viver em conformidade com o evangelho. Sem o evangelho, nosso coração tem de manufaturar a autoestima, comparando nosso grupo com outros grupos. Mas o evangelho nos diz que somos todos impuros sem Cristo e todos puros nele.

G aiatas 2.11-21

Por fim, a maneira mais sutil de decair para o pecado de Pedro é levar nossas preferências pessoais muito a sério e dotar de importância moral o que é apenas cultural. Por exemplo, é muito difícil para cristãos de igrejas com expressividade emocional e música moderna não se sentirem superiores a igrejas com discrição emocional e música clássica, e vice-versa. Não conseguimos enxergar que apenas somos diferentes; acreditamos que nosso estilo e costumes são melhores espiritualmente. Isso conduz a todo tipo de divisão no corpo de Cristo.

A resposta d e Paulo (e a nossa?)

Paulo enxerga o princípio por trás da mudança de prática alimentar de Pedro. E, ao lhe falar a esse respeito, aponta para o princípio, em vez de se limitar a querer alterar seu comportamento.

O raciocínio básico de Paulo é: Deus não estabeleceu comunhão com você com base em sua etnia e cultura (v. 15). Por melhor e mais devoto que você fosse, sua etnia e seus costumes não tiveram nada a ver com isso (v. 16). Então, você acha que pode ter comunhão com base em etnia e cultura (v. 14)?

Paulo não afirma apenas que racismo é pecado, o que é verdade. Ele usa o evangelho para mostrar as raízes espirituais do erro que Pedro comete. Diz que as raízes do racismo são uma resistência ao evangelho da salvação. Em outras palavras, o racismo é a continuidade da justificação pelas obras em parte da nossa vida; ele nasce do desejo de encontrarmos um modo de sentir que somos “melhores” ou “justos” de alguma forma. Equivale a esquecer que somos salvos pela graça; é não alinhar nosso relacionamento com outras culturas em conformidade com a salvação pela graça.

Se você faz parte de uma maioria racial, o orgulho cultural da sua raça é bastante fácil de detectar. Se faz parte de uma minoria racial muitas vezes desprezada, discernir a “justificação

G álatas 2.11-21

pelo orgulho racial” torna-se um pouco mais complexo. Mas ele vem à tona quando você começa a pensar: Sou mais nobre do que você, da raça dominante. Tenho sofrido mais e não sou um opressor como você.

A abordagem de Paulo faz toda a diferença. Ele não se limitou a dizer: Você está infringindo as regras (embora fosse esse o caso de Pedro), mas: Você se esqueceu do evangelho, esqueceu-se de como foi graciosamente recebido em Cristo. Paulo não se concentrou tanto no comportamento pecaminoso, mas, sim, na atitude pecaminosa hipócrita por trás dele.

Paulo nâo se concentrou tanto no comportamento pecaminoso, mas, sim, na atitude pecam inosa hipócrita por trás dele.

Esse é o jeito cristão de fazer “oposição” a alguém. Quando você está tentando motivar pessoas estimulando-as a ver suas riquezas e amor em Cristo, na verdade está pessoalmente apontando para o valor e dignidade que elas têm. Mas, quando tenta motivá-las por meio de ameaça, é provável que sinta pouco respeito por elas. Essas pessoas duvidarão (com razão) de que você esteja do lado delas. Quando usamos a graça de Deus como motivação, podemos criticar de maneira incisiva e direta, mas nosso interlocutor geralmente será capaz de perceber que, de qualquer forma, agimos em seu favor. Não admira que Paulo se mostrasse encantador nessa situação!

Mantenha isso em mente, também. O orgulho racial dc Pedro baseava-se no medo (v. 12 — ele estava com medo). Quando nosso pecado tem raiz no medo, precisamos ser amados e fortalecidos a fim de reunir a coragem para fazer o que é certo, apesar do medo. Não era só o racismo de Pedro que estava “desalinhado” com o evangelho; sua covardia também. Como veremos, Pedro é justificado aos olhos de Deus (v. 15,16).

G álatas 2.11-21

Então, por que precisa ser justificado aos olhos de qualquer outra pessoa? Se Paulo tivesse dito apenas: Sua superioridade cultural é uma violação das regras de Deus, a covardia de Pedro teria permanecido adormecida, sem que ninguém falasse dela, pronta para se manifestar de maneira diferente. Mas, ao lembrá-lo de que ele já estava justificado, Paulo diz: Pedro, você não precisa da aprovação desses homens. Você já tem a de Cristo.

Não nos lembramos sempre de tratar uns aos outros dessa maneira embasada no evangelho. Os cristãos tendem a tentar persuadir pela culpa. Temos a tendência de dizer: Vocês fariam isso se fossem cristãos comprometidos de verdade, sugerindo que nós, sim, somos comprometidos, e basta aos outros se tornarem tão bons quanto nós! E por isso que muitas igrejas reprimem a motivação das pessoas para o ministério. No nosso lugar, Paulo diria: Lembre-se de que a graça de Deus foi derramada sobre você — como é desfrutar dessa graça e vivê-la nesta situação?

para reflexão Perguntos

1. Em que áreas você tem andado cada vez mais em conformidade com o evangelho no último mês? E no último ano?

2. Há pessoas em sua igreja com as quais você não tem “comido” porque elas não são “iguais a você”? Que mentiras moralistas estão por trás dessa atitude?

3. Como você poderia usar menos a culpa e mais o evangelho para motivar a si mesmo e a outros cristãos?

SEGUNDA PARTE

J u stificação p e la fé

O ponto alto do discurso de Paulo a Pedro “na frente de todos” (v. 14) surge no versículo 16: “Nós também temos crido em Cristo Jesus, para sermos justificados pela fé em Cristo e não

G álatas 2.11-21

pelas obras da lei, pois ninguém será justificado pelas obras da lei”.

“Justificados pela fé” é conceito fundamental para a fé cristã. E como Paulo resume, em poucas palavras, o evangelho. No entanto, costumamos presumir que nós (e o mundo inteiro) compreendemos o que isso significa e o impacto que terá em nossa vida. Mesmo ao condenar a presunção de que todos o entendemos, sempre nos esquecemos de deixar claro o que não devemos presumir! Mas, ---------------------------------

Se até um apóstolo como Pedro precisou aprender mais sobre o que significa ser justificado pela fé, é provável que conosco aconteça a m esm a coisa! fgg como vemos aqui, se até um apóstolo como Pedro precisou aprender mais sobre o que significa ser justificado pela fé, é provável que conosco aconteça a mesma coisa!

Portanto, primeiro temos de relacionar o conceito de justificação pela fé com a con- ! trovérsia entre Paulo e Pedro. Em essência, a discussão foi acerca da pureza. Os judeus não comiam com gentios porque eles eram “impuros”, e você tinha de ser “puro” para adorar a Deus.

Quando Pedro passou a evitar comer com os gentios, Paulo lembrou-o do que ele aprendera através de revelação (At 11.8-10; 15.8,9), de que somos “puros” em Cristo. No Antigo Testamento, você precisava ser “puro” — guardando as leis cerimoniais — para entrar em adoração, para ser aceitável diante dos outros e na presença de Deus. Embora o termo “puro” não apareça nos versículos 11-13, era ao que se referia a palavra “draincisão” (v. 12), o ato de comer e todas as regras e regulamentos.

Nesse contexto, Paulo introduz o conceito da “justificação” (v. 15,16). Assim, “justificação” é basicamente a mesma coisa que ser “puro”. Ser justificado é ser aceitável para a comunhão com Deus.

G aiatas 2.11-21

Por que Paulo troca as palavras? O termo “justificação” tem conotação legal, portanto oferece uma perspectiva diferente da nossa salvação em Cristo. O oposto de “puro” é “contaminado”; mas “purificação” não basta para traduzir o que Cristo faz por nós. Isolada, a purificação sugere que Deus nos aceita porque Cristo nos “purifica”, livrando-se de nossos pensamentos e hábitos pecaminosos, de modo que nos tornamos aceitáveis a Deus por nos tornarmos justos de fato em nossas atitudes e ações.

Mas o oposto de “justificado” é “condenado”. Justificação quer dizer que, em Cristo, apesar de na verdade sermos pecadores, não estamos debaixo de condenação. Deus nos aceita apesar do nosso pecado. Não somos aceitáveis a ele porque nos tornamos justos de fato: tornamo-nos justos de fato porque somos aceitáveis a Deus.

J. I. Packer nos ajuda, resumindo o que Paulo quer dizer:

“Justificar”, na Bíblia, significa [...] declarar [...], acerca de um homem levado a julgamento, que ele não está sujeito a nenhuma penalidade, mas tem direito a todos os privilégios devidos a quem guarda a lei. Justificar é o ato do juiz que pronuncia sen- tença oposta à condenação — de indulto e imunidade legal.1

N ão p ela ob servân cia d a lei

Se somos justificados pela fé no que Cristo fez, não somos justificados pelo que fazemos. A observância da lei não é o que salva (v. 16).

Foi ao que Paulo se referiu quando disse: “Pela lei, eu morri para a lei” (v. 19). Ele não pode estar dizendo que deixamos de obedecer à lei de Deus por completo. Considere todo o restante dos seus escritos. Ele não diz aos cristãos que devemos obedecer à lei? Por exemplo, aos coríntios ele diz que a

'God’s words (Downers Grove: IVP, 1981), p. 139-40.

G aiatas 2.11-21

imoralidade sexual é errada, com base no que Gênesis afirma sobre o casamento (lCo 6.15,16).

Isso significa que Paulo morreu para a lei como meio de salvação. Morreu para a condenação da lei. Se não somos justificados pela lei, mas por Cristo (G1 2.16), então a lei não pode nos condenar. Se me sinto condenado e temo que Deus não mais ouvirá minhas orações ou não mais se importará comigo, esqueci que estou morto para a lei. Esqueci que ela não pode me fazer mal.

Como Paulo morreu para a busca da salvação pela observância da lei “por meio da lei”? Porque, ao tentar obedecê-la, constatou que não podia fazê-lo. Ele está dizendo: Eu não sabería 0 que em 0pecado, exceto por intermédio da lei. E não descobriría 0 quanto sou incapaz de guardar a lei, exceto por meio da lei. Por realmente dar ouvidos à lei, Paulo viu que necessitava de um Salvador.

V ivendo para D eus

Se os versículos 16 e 19 ficam claros quando os examinamos de perto, o mesmo não se pode dizer dos versículos 17 e 18, bastante obscuros! Talvez a melhor maneira de lê-los seja como um ditado: Se alguém que sabe ser justificado pela fé comete pecado, éporque a justificação pela fé em Cristo promove 0 pecado? Absolutamente, não! Mas, se alguém que professafé em Cristo mantém 0 mesmo estilo de vida pecaminoso, restaurando sua condição de pecador, cuja penalidade Cristo morreu para destruir, não se esforçando nada para mudar, isso prova que essa pessoa nunca entendeu de fato 0 evangelho. Ela estava só procurando uma desculpa para viver em desobediência a Deus. É provável que Paulo estivesse pensando em pessoas diferentes nesses dois versículos: no pecador justificado e arrependido no primeiro, e no rebelde não justificado e não arrependido no segundo.

O versículo 19 é um breve comentário do apóstolo sobre como alguém verdadeiramente justificado enxerga a vida.

G álatas 2.11-21

Porque morreu para a lei, Paulo agora pode “viver para Deus”. A dedução aqui é que, antes de se render à fé, quando ainda tentava se salvar pela observância da lei, Paulo nunca viveu de verdade para Deus. Fora muito correto e bom — mas tudo por si próprio, nunca para Deus.

Paulo fora muito correto e bom — mas tudo por si próprio, nunca para Deus.

Quando Paulo obedecia a Deus sem saber que fora aceito, agia assim em busca de uma recompensa — pelo que poderia conseguir de Deus, não por amor puro pelo próprio Deus. Agora, justificado e aceito, ele tem nova motivação para a obediência, que é muito mais sadia e poderosa. Paulo só quer viver para aquele “que me amou e se entregou por mim” (v. 20).

Veremos muito mais a esse respeito em Gálatas 5. Por ora, Paulo quer nos fazer entender que nossa aceitação nos dá um motivo novo e mais forte para obedecer a Deus; um mo- tivo mais forte do que a justificação pelas obras jamais conseguiría produzir.

Nossa aceitação nos d á um motivo novo e mais forte para obedecer a Deus.

Eis então uma paráfrase do versículo 19: A própria lei me mostrou que eu jamais conseguiría me tornar aceitável por meio dela. Portanto, deixei de “viver para ela”. Morri para ela como meu salvador. Embora obedecesse a Deus antes, era só para obter coisas dele; era para mim mesmo. Hoje obedeço apenas para agradá-lo. Agora vivo para ele.

Isso nos ajuda a encontrar o sentido e entender as implicações transformadoras de vida do versículo 20. Há uma tensão aparente nessas duas frases. Paulo diz “não sou mais eu quem vive” e, em seguida, “a vida que vivo agora”. Na verdade, essa tensão descreve a maneira pela qual deveriamos enxergar nossa vida como cristãos.

G álatas 2.11-21

O versículo 20 isolado sugeriría que nos recostemos e deixemos Cristo nos dar o poder de viver da maneira certa. O versículo 21 isolado significaria que temos de fazer tudo sozinhos. As duas orações (que são uma só em grego), consideradas juntas, mostram que devemos viver a vida com base em quem somos em Cristo.

O versículo 20 é uma reiteração do versículo 14: precisamos viver a vida “conforme a verdade do evangelho”. Agora que a vida de Cristo é a minha vida, o passado de Cristo é o meu passado. Estou “em Cristo” (v. 17), ou seja, estou tão livre de condenação perante Deus como se já tivesse morrido e sido julgado. Como se tivesse pagado a dívida eu mesmo. E sou tão amado por Deus como se tivesse vivido a vida que Cristo viveu. Assim, “não sou mais eu quem vive, mas é Cristo quem vive em mim” é um lembrete triunfante de que, embora “sejamos pecadores”, em Cristo somos justos.

Então Paulo prossegue para o versículo 21, a fim de dizer: Agora, ao viver minha vida, ao fazer minhas escolhas e meu trabaIho, lembro 0 tempo todo de quem sou pela fé em Cristo, que tanto me amou! A dinâmica interna para viver a vida cristã está bem aqui! Só quando me vejo como alguém completamente amado e santo em Cristo tenho o poder de me arrepender com alegria, vencer meus temores e obedecer àquele que fez tudo isso por mim.

Tudo ou n ad a?

Vale a pena lembrar que Paulo ainda está se dirigindo a Pedro aqui! Ele, então, conclui, relembrando Pedro de que vida cristã tem a ver com viver em conformidade com o evangelho o tempo todo, ao longo de toda a vida. Devemos avançar como cristãos depois de ter iniciado como cristãos. Afinal de contas, se em um instante qualquer, ou de alguma maneira, “a justiça vem por meio da lei, então Cristo morreu inutilmente”! (v. 21). Cristo fará ou tudo ou nada por você. Não há como combinar

G álatas 2.1121־

mérito e graça. Se a justificação for de algum modo pela lei, a morte de Cristo não faz sentido nem na história, nem para você pessoalmente.

ggy Imagine que sua casa peCristo fará ou tudo ou ||j gasse f°g°> mas sua família n ad a por você 111 inte*ra escapasse, e eu lhe dis- sesse: Deixe-me lhe mostrar 0 quanto eu 0 amo!, então corresse para dentro da casa e morresse. Que desperdício de vida trágico e inútil, você pensaria. Mas, agora, imagine que sua casa pegasse fogo, um dos seus filhos ainda estivesse lá dentro e eu lhe dissesse: Deixe-me lhe mostrar 0 quanto 0 amo!, então corresse para dentro das chamas, salvasse seu filho, mas perecesse. Você pensaria: Vejam 0 quanto esse homem nos amava.

Se pudéssemos nos salvar, a morte de Cristo não faria sentido e não significaria nada. Se constatamos que não temos como nos salvar, a morte de Cristo significa tudo para nós. E passaremos a vida que ele nos deu servindo-o alegremente, adequando nossa vida inteira, em conformidade com o evangelho.

Perguntas para reflexão

1. A morte de Cristo é tudo para você? Que diferença isso faz em seu amor por ele e em seus atos na vida?

2. Como você explicaria a “justificação pela fé” a alguém que nunca esteve em uma igreja?

3. Como você expÜcaria a diferença entre ser moralmente correto e ser cristão para alguém que pensa que ser bom o torna aceitável para Deus?

VERSÍCULOS 1-14 GÃLATAS ■ CAPÍTULO 3$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Pedro se afastou da mesa dos gentios por temer certo grupo; em que ambientes você também esconde ou ajusta sua fé para não perder a aprovação de pessoas que respeita?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Paulo chama aquilo de hipocrisia que não anda "de acordo com a verdade do evangelho"; onde a sua vida prática contradiz a graça que você diz crer?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se você foi "crucificado com Cristo" e já não é você quem vive, que identidade construída pelo seu desempenho precisaria morrer para que Cristo de fato vivesse em você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Você Nunca Deixa o Evangelho para Trás$t$, 5,
$conteudo$Os cinco primeiros versículos do capítulo 3 fazem uma afirmação extraordinária — muito negligenciada pelos cristãos, mas absolutamente crítica para eles.

Na segunda metade do capítulo 2, Paulo demonstrou que somos salvos quando paramos de confiar em nossos esforços morais ou na lei (morremos para ela) e confiamos na obra de Cristo, que cria uma motivação inteiramente nova para tudo que fazemos (vivemos para Deus). O evangelho é o caminho de entrada no reino de Deus. Mas agora Paulo mostrará que o evangelho é muito mais do que isso. Não só somos salvos pelo evangelho, mas também crescemos pelo evangelho. Paulo está dizendo que não começamos pela fé para depois prosseguir em nosso crescimento por meio das obras. Não apenas somos justificados pela fé em Cristo, somos também santificados por ela. Nunca deixamos o evangelho para trás.

E o que Paulo declara em 3.1-5, mas, a bem da verdade, esse é o tema dos capítulos 3 e 4 inteiros. Em 3.6-14, ele defenderá a ideia a partir das Escrituras. Os versículos 3.15-25 usam o exemplo do testamento legal para salientá-la e para discutir o papel da lei de Deus em uma vida baseada no evangelho. O trecho que vai de 3.26—4.20 se utiliza do exemplo da adoção e discute os privilégios de ser introduzido na família de

G álatas 3.114־

Deus. E a passagem de 4.21-31 volta às Escrituras para examinar a vida de A braão e seus dois filhos, amarrando os fios soltos dos dois capítulos.

Um retrato nítido d e Cristo

Nos versículos 1-3, Paulo lembra aos cristãos da Galácia como foi que eles se entregaram a Cristo, provenientes do paganismo. Em essência, Jesus Cristo é retratado “como crucificado” (v. 1). Esse retrato é alcançado pela pregação, por meio do “que ouvistes” (v. 2,5). Paulo não fala de uma imagem literal, mas de uma metáfora.

Havia uma mensagem a transmitir: “Jesus Cristo [...] crucificado” (veja ICo 2.1-5). Observe que a essência da mensagem não é como viver, mas o que Jesus fez na cruz por nós. O evangelho é mais um anúncio de acontecimentos históricos do que instruções sobre como viver. É a proclamação do que foi feito em nosso favor mais do que uma orientação do que devemos fazer.

Mas aqui também está escrito que essa mensagem constrangeu o coração. Jesus foi “exposto”. A NIV traduz o grego como “claramente retratado”; “claramente” também significa “detalhadamente”, “vividamente”. É provável que se trate de uma referência ao poder da pregação, que nada tivera de árida, como uma palestra. Ela “pintava um quadro” de Jesus, proporcionando aos ouvintes a visão de um “retrato em movimento” do que Cristo fez. “O nosso evangelho não chegou a vós somente com palavras, mas também com poder, com o Espírito Santo e com absoluta convicção” (lTs 1.5). Um cristão não é alguém que sabe sobre Jesus, mas alguém que o “viu” na cruz. Nosso coração se emociona quando vemos não só que ele morreu, mas que morreu por nós. Entendemos o sentido de sua obra em nosso favor. Somos salvos por uma apresentação racionalmente clara e comovente da obra de Cristo em nosso favor.

G álatas 3.1-14

Foi o que aconteceu àqueles gálatas. Eles tiveram fé no que ouviram (G1 3.2b). Os versículos 2 e 3 são orações paralelas; Paulo chama a atenção para determinado ponto através da repetição. Ele contrasta “fé” com “obras da lei”, “começar pelo Espírito” com “aperfeiçoamento pela carne”. Ter fé no evangelho não é simples- ™ -------------------------------- Nosso coração se emociona quando vemos nâo só que ele morreu, mas que morreu por nós.

mente concordar com as afirmações sobre Cristo (e.g.: ele morreu, ele ressuscitou), mas parar de tentar obter a salvação pela observância da lei. A palavra que Paulo usa para “aperfeiçoando pela carne”, no versículo 3, é epi-teleo, “acabamento”. Ela descreve o curso normal da nossa vida. Todos lutamos para chegar à versão “acabada” de nós mesmos — para nos tornarmos aceitáveis a Deus, a nós mesmos e aos outros —, sendo que confiamos nos nossos esforços para alcançar isso, por meio de realizações morais, vocacionais e relacionais. Paulo diz que ter fé no evangelho (“que ouvistes”) significa abandonar por completo essa abordagem. Paramos de realizar as “obras da lei” (v. 2) ou de nos aperfeiçoar “pela carne” (v. 3).

Antes de nos tornarmos cristãos, confiávamos em vários projetos de esforço pessoal para nos sentirmos plenos. Mas “ter fé” em Cristo é implementar uma revolução naquilo em que confiamos para chegar ao nosso senso de epi-teleo, nossa plenitude ou perfeição.

Um hino antigo escrito por James Proctor resume bem a ideia:

Depositar nossas “obras” mortas

aos pés de Jesus.

Firmados nele, só nele,

gloriosamente completos.

G aiatas 3.1-14

O resultado de crer no evangelho do Cristo retratado em cores vividas foi que os gálatas “[receberam] o Espírito” (v. 2). O Espírito Santo entra em uma vida através da fé na salvação somente pela graça, por intermédio somente de Cristo. O novo nascimento que Paulo descreve está ligado ao evangelho de forma direta e indissociável. Por isso Jesus pode dizer que nos é dado o novo nascimento através do Espírito (Jo 3.5), enquanto Tiago (Tg 1.18) e Pedro (lPe 1.23) afirmam que nos é dado o novo nascimento através da Palavra de Deus. São coisas indivisivelmente conectadas. O Espírito não opera separado do evangelho. O evangelho é o canal e a forma do poder do Espírito.

Carne

Mas algo havia mudado na vida daqueles cristãos. Eles tinham crido no que ouviram a respeito do Cristo crucificado e tinham recebido o Espírito. Agora, no entanto, haviam se tornado “insensatos” e estavam sendo seduzidos (v. 1).

Paulo não poupa palavras aqui! O que deu errado? No versículo 3, ele apresenta sua grande queixa contra os cristãos gálatas e os falsos mestres. Diz que a maneira como o Espírito entra deveria ser a mesma como ele avança em nossa vida. Declara isso duas vezes, com veemência: “Tendo começado pelo Espírito, [estais] agora vos aperfeiçoando pela carne?” (v. 3). A palavra grega utilizada é sarki, traduzida como “carne” mesmo: “Vocês estão tentando alcançar seu objetivo pela carne?”. Como esse termo é paralelo a “obras da lei”, do versículo 2, os tradutores da Bíblia concluíram que estar “na carne” significa deixar de se lembrar do evangelho, ou de nele crer, e buscar a plenitude por meio de esforços empreendidos na confiança em si mesmo. Como Dick Kaufmann, antigo pastor executivo da igreja em que servi, diz:

Os cristãos pensam que somos salvos pelo evangelho, mas que depois crescemos aplicando princípios bíblicos a todas

G álatas 3.1-14

as áreas da vida. Acontece que não somos apenas salvos pelo evangelho, mas crescemos aplicando o evangelho a todas as áreas da vida.

No versículo 5, Paulo é ainda mais veemente. Recorre ao tempo presente e diz que, neste exato momento, as obras do Espírito, inclusive os milagres, são realizadas (e não foram realizadas) pela fé e pelo abandono da observância das “obras da lei”. O Espírito opera quando os cristãos não confiam nas próprias obras, mas antes, consciente e continuamente, descansam só em Cristo para serem aceitos e alcançar a plenitude. Paulo vincula o Espírito e o evangelho nos termos mais inseparáveis. O Espírito opera à medida que você aplica e usa o evangelho.

A m aneira como o Espírito entra deveria ser a m esm a como ele avança em nossa vida.

Pintando o ev an gelh o d e novo

À medida que avançarmos por Gálatas, veremos que nossa incapacidade de obedecer e nos conformar com o caráter de Cristo não é uma questão de simples falta de força de vontade, de modo que não podemos tratar nossos fracassos apenas “esforçando-nos mais”. Afinal de contas, a decisão de “esforçar-nos mais” é resolver confiar em nosso próprio empenho para guardar a lei. Em vez disso, temos de perceber que a raiz de toda a nossa desobediência está em como especificamente continuamos buscando o controle de nossa vida por meio de sistemas baseados na justiça pelas obras.

O caminho para o progresso como cristão é o arrependímento constante e a erradicação contínua desses sistemas, da mesma maneira pela qual nos tornamos cristãos — pela pintura (e repintura) do retrato vivido da obra salvadora de Cristo a

G álatas 3.1-14

nosso favor e pelo abandono dos esforços firmados no próprio eu para alcançar a plenitude. Precisamos voltar repetidamente ao evangelho do Cristo crucificado, para que nossos corações sejam mais profundamente atingidos pela realidade do que ele fez e de quem somos nele.

Portanto, não devemos dizer simplesmente: Senhor, tenho um problema com a raiva. Por favor, remova-o pelo teu poder! Dá-me 0 poder de perdoar. Em vez disso, devemos aplicar o evangelho a nós mesmos nesse ponto. Paulo nos diria que a amargura descontrolada resulta de não viver em conformidade com o evangelho. Significa que, embora tenhamos começado com Jesus como Salvador, alguma outra coisa se tornou agora nossa salvadora funcional, no lugar de Jesus. Em vez de crer que Cristo é nossa esperança e bondade, estamos olhando para outra coisa como esperança, buscando outra maneira de nos sentirmos bem e plenos.

Em vez de esperar que Deus remova nossa raiva ou de exercitar nossa força de vontade contra ela, devemos perguntar: Se estou com raiva e não consigo perdoar, do que eu acho que preciso tanto? O que me está sendo retido e que, na minha opinião, necessito ter para me sentir pleno, ter esperança, ser uma pessoa de valor? Em geral, a raiva profunda é causada por algo desse tipo. Talvez desejemos o conforto acima de tudo, ou alguém dificul________________________ tou nossa vida, de modo que Conforto, aprovação, h ficamos com raiva da pessoa. controle; todos são B Talvez a*>remos a aProva־ sa lv a d o re s fu n cio n ais, f l alheia ־sintamos raiva de _ , , , , 1® qualquer um que, de algum Quando bloqueados, , r modo, frustre nossa proposta ficamos bravos. UI , . ., , . de popularidade e respeito. Conforto, aprovação, controle; todos são salvadores funcionais. Quando bloqueados, ficamos bravos. A solução não é nos esforçarmos mais para controlar a raiva diretamente. É nos

G álatas 3.1-14

arrependermos de nossa justiça própria e da falta de regozijo na obra completa de Cristo, ambas encontradas na raiz da raiva. Ao fazermos nosso coração “olhar” para Cristo crucificado, o Espírito operará em nós para substituir o salvador funcional pelo Salvador, e a raiz da nossa raiva se ressecará.

Perguntas |p a ra reflex ã o

1. Você corre o risco de esquecer que o evangelho é a fonte da sua contínua aceitação? Como e por quê?

2. Como você “repinta” Cristo para si mesmo? Seria capaz de fazê-lo mais vezes?

3. Pense em um pecado que comete com regularidade. O que você está adorando mais do que Jesus e que o leva a resolver desobedecê-lo? Como substituirá esse salvador falso por seu verdadeiro Salvador, da próxima vez que for tentado?

SEGUNDA PARTE

A presentando A braão

Paulo agora quer que paremos e meditemos no que aconteceu a Abraão (v. 6). Parece estranha essa conexão com o versículo 5; na verdade, porém, é um golpe de mestre. Lembre-se, Paulo está apresentando sua réplica às alegações dos mestres judaizantes, que dizem: E ótimo que você tenha fé em Cristo; agora, para continuar sendo aceitável a Deus, precisa viver como os judeus. E o pai dos judeus é Abraão. O povo de Israel começou quando Deus prometeu a seu ancestral, Abraão, que faria de seus descendentes uma grande nação, vivendo em uma terra dada e abençoada por Deus (Gn 12.1-3).

Mas, neste ponto, Paulo convoca Abraão como testemunha do seu argumento. Parem e pensem em Abraão, ele diz aos cristãos gentios, porque 0 ancestral dos judeus lhes mostrará que vocês

G álatas 3.1-14

foram defato “seduzidos” (v. !)pelos mestres judaizantes. Por quê? Porque, ao olharmos para Abraão, vemos um homem que “creu em Deus, e isso lhe foi atribuído como justiça” (v. 6). O mais importante acerca de Abraão é o fato de ele ter sido um homem “da fé” (v. 9). Paulo está dizendo: O pai fundador do povo judeu concordaria comigo.

No versículo 6, Paulo cita Gênesis 15.6 (passagem em que Abraão ainda é conhecido como “Abrão”). A palavra grega empregada por Paulo é elogisthan, de logos, falar.

O mais importante acerca de A braão é o fato de ele ter sido um homem "da fé".

Significa “declarado” ou “contabilizado”. Costumava ser utilizada como um termo contábil quando se queria dizer que o dinheiro estava sendo recebido e contado como pagamento para determinado fim. O verbo “atribuir” também pode ter sentido semelhante, ou seja, conferir um status a algo que não existia antes. Se você compra um carro pelo sistema de leasing, significa que seus pagamentos podem ser aproveitados na compra do bem, se mais tarde for essa sua opção. No momento em que assim decidir, as parcelas pagas lhe serão atribuídas como amortizações de uma dívida. Um novo status lhes é conferido.

Então qual o sentido de dizer que a fé de Abraão “lhe foi [atribuída] como justiça”? Claro que a fé na Palavra de Deus e em suas promessas resulta em justiça! Se cremos que Deus existe e que lhe devemos obediência e adoração, dessa convicção fluirá a vida justa.

Contudo, temos algo mais aqui, algo singular e contraintuitivo. Trata-se da fé atribuída como justiça. Quando a Bíblia nos diz que Deus atribui à fé de Abraão o caráter de justiça, significa que ele está tratando Abraão como um homem que leva uma vida justa.

Muitos comentaristas têm resistido às implicações extraordinárias de Gênesis 15.6. Segundo eles, o trecho nos diz que a

G álatas 3.1-14

fé de Abraão é, em si mesma, uma forma de justiça agradável a Deus. Sua fé era um ato de obediência a merecer o favor divino, uma espécie de justiça. Mas o texto bíblico não diz que a fé era a justiça, mas que foi _______________ contada como (i.e ״como se ■ Tem os algQ sin g u la r fosse) justiça. :111 . , - . . . ^ , J ■ aqui: a íe atribuída Douglas Moo escreve: ■ ,. IS como justiça.

Se compararmos outros versículos em que a mesma construção gramatical é utilizada como em Gênesis 15.6, chegamos à conclusão [...] de que [atribuir] a fé de Abraão como justiça significa “atribuir-lhe uma justiça que não lhe é inerente”.1

Quando Deus “atribui justiça”, confere status legal a alguém. Trata essa pessoa como justa de fato e a livra de condenação, embora ela continue injusta no coração e em comportamento. Ela está “justificada”.

Isso vai contra toda a religião tradicional, que nos diz que, de duas uma: ou vivemos da maneira certa — portanto agradando a Deus e sendo aceitáveis a ele — ou vivemos de modo injusto — portanto separados de Deus. Mas Paulo (e Abraão) está mostrando que é possível ser amado e aceito por Deus, embora sejamos pecadores e imperfeitos. A famosa frase de Martinho Lutero diz que os cristãos são simuljustus etpeccator — simultaneamente justos e pecadores.

Paulo defende a mesma ideia em Romanos, ao declarar que Deus “justifica o ímpio” (Rm 4.5; observe que nesse capítulo, como em G1 3, Paulo cita Abraão para servir de base ao seu argumento). Quando uma pessoa recebe justiça

1lhe Epistle to the Romans, The New International Commentary (Grand Rapids: Eerdmans, 1996), p. 262.

G álatas 3.1-14

atribuída (i.e., é justificada), continua sendo ímpia! O status de justificado não lhe é atribuído por ela ter levado o próprio coração a determinado nível de submissão e adoração.

Você não purifica sua vida a fim de fazer por merecer a justiça atribuída, antes você a recebe enquanto ainda é um pecador.

E possível ser am ado e aceito por Deus em bora sejamos pecadores e imperfeitos.

Seja com o A braão

Eis por que Paulo diz: “Os da fé é que são filhos de Abraão” (v. 7). O que importa não é a linhagem física de Abraão (ser judeu), mas a descendência espiritual (ter a mesma fé que ele). “Os da fé são abençoados juntamente com Abraão” (v. 9, grifo nosso).

Portanto, o que significa ser “da fé” como Abraão? Primeiro, ele nos mostra que fé salvadora é acreditar na promessa do evangelho. “Abraão [...] creu em Deus, e isso lhe foi atribuído como justiça” (v. 6). Note bem, não está escrito que Abraão apenas acreditou em Deus como quem dá um voto de confiança (embora com certeza ele o fizesse!). Esse não seria o tipo de fé salvadora (Tg 2.19 diz que até “os demônios [...] creem”). Antes, ele precisou crer e confiar em tudo que Deus de fato dissera na sua promessa de salvar.

Não se pode crer nas palavras de Deus sem acreditar que ele existe, mas é possível acreditar que Deus existe sem crer nas suas palavras! A fé salvadora é diferente da vaga fé genérica na existência de Deus ou mesmo das doutrinas e ensinamentos da Bíblia como um todo.

Segundo, Abraão mostra que fé salvadora é aquela depositada na provisão divina, não em nosso desempenho. Ele não tinha filhos (Gn 15.2), e sua esposa era estéril. Ele não podia ter filhos, mas Deus prometeu que sua descendência seria tão

G álatas 3.1-14

inumerável quanto as estrelas (v. 5,6). Deus entraria na história e realizaria um feito poderoso, sem depender da capacidade humana para nada. A promessa de um herdeiro dependia inteiramente de Deus, não de Abraão. A ele bastava crer que Deus o faria. E, em Gênesis 15, Abraão creu.

D ois tipos d e p e sso a s

Abraão era um homem “da fé”(Gl 3.9). Mas havia outro modo de viver. Podemos ser “das obras da lei”(v. 10). Há quem tenha “vida por meio [da lei]” (v. 12). Viver “por meio” de alguma coisa significa confiar nisso para encontrar felicidade e satisfação. Seja pelo que for que vivamos, esse é o ponto principal da nossa vida, o que nos dá sentido, segurança e definição. E muito esclarecedor perguntar: Pelo que eu vivo? Em que minha vida é baseada? O que, se eu perdesse, faria com que me sentisse como se não me restasse vida alguma? São perguntas que revelam os fundamentos da sua vida.

Ter fé como a de Abraão traz bênção (v. 9). O resultado de viver pela lei é que estamos “debaixo de maldição” (v. 10). Essa “maldição” tem dois aspectos. Teologicamente, qualquer um que diz: Posso ser salvo obedecendo à lei deve estar preparado para investigar de verdade o que a lei ordena. Para amar a Deus por completo, teríamos de obedecer à lei por completo. Para sermos abençoados em vez de amaldiçoados por Deus, teríamos de analisar a lei e satisfazer todas as suas exigências. E isso não pode ser feito. Objetivamente, buscar a salvação pela observância da lei significa ser amaldiçoado.

Isso quer dizer que, em termos psicológicos, todo aquele que procurar salvar-se por meio do próprio desempenho experimentará uma maldição em termos subjetivos. No mínimo, a tentativa de se salvar pelas obras conduzirá a profunda ansiedade e insegurança, porque nunca se pode ter certeza de estar vivendo suficientemente à altura dos padrões da lei, quaisquer

G álatas 3.114־

que sejam. Isso deixa você supersensível à crítica, intimidado e com inveja de quem o ofusca. Você fica nervoso e receoso (por não saber bem em que posição se encontra), ou então vaidoso e se gabando (por tentar se convencer da própria posição). De um jeito ou de outro, você vive com a sensação de maldição e condenação.

A tentativa de se salvar pelas obras deixa você supersensível à crítica, intim idado e com inveja.

A m a ld içã o a fa sta d a

Como, então, fugir da maldição e desfrutar da bênção prometida às nações (v. 8)? E claro, tudo se deve ao que Jesus fez.

Ele nos introduziu na bênção “tornando-se maldição em nosso favor” (v. 13). Paulo cita Deuteronômio 21.23: “Aquele que é pendurado foi amaldiçoado por Deus”. No Antigo Testamento, quando se executava alguém, costumava ser por apedrejamento. O corpo, então, ficava pendurado em uma árvore como símbolo da rejeição divina. Não que o sujeito fosse amaldiçoado por estar pendurado, mas ele era pendurado como sinal da sua maldição. Paulo estabelece a ligação disso com Cristo, cuja execução fora em um madeiro para mostrar que ele experimentara a maldição da rejeição divina. Ali, ele nos libertou (“nos resgatou”) da maldição da lei, tomando-a por nós.

As palavras “em nosso favor” significam “em benefício de” ou “no lugar de”; Jesus foi nosso substituto. Ele recebeu a maldição que merecíamos (v. 13) a fim de que pudéssemos receber a bênção que ele merecia (v. 14). Nossos pecados e maldição são entregues, ou imputados, a ele; sua justiça e bênção e Espírito são imputados a nós. É uma imputação dupla.

Observe que Paulo não se limita a dizer que Jesus nos resgatou “retirando a maldição”, mas, sim, “tornando-se maldição”. Há um paralelo aqui com 2Coríntios 5.21: “Daquele que

G álatas 3.1-14

não tinha pecado Deus fez um sacrifício pelo pecado em nosso favor, para que nele fôssemos feitos justiça de Deus”. Jesus foi tratado como se fosse pecador, como responsável por tudo pelo que uma pessoa má seria responsável. Legalmente falando, ele se tornou o pecado.

Por que é tão importante entender isso? Porque revela a maravilhosa afirmação relacionada com o que nos acontece quando cremos. Se Jesus “se tornou” um pecador por nós, então nós, da mesma forma, nos tornamos justos. Se o fato de ele tomar para si a maldição significa que foi considerado por Deus como um pecador, então o fato de recebermos a bênção significa que somos considerados por Deus perfeitamente justos e sem defeito.

Salvação significa muito mais do que perdão. Não se trata apenas de ter as dívidas canceladas; também passamos a ser perfeitos aos olhos de Deus. E assim permanecemos. Não começamos confiando na morte de Cristo, que o transforma em maldição e nos abençoa, para depois seguirmos em frente “na carne”, como se agora tivéssemos de fazer por merecer a bênção contínua. Isso é insensatez (v. 1). Prosseguimos como começamos, tendo o coração amolecido e moldado pelo conhecimento e a confiança no Cristo crucificado. Nós não começamos no evangelho e depois passamos para algum estágio mais avançado — não podemos fazer isso, nem precisamos.

para reflexão Perguntas

1. De que maneira o fato de nos ser atribuída justiça muda o modo como vemos a nós mesmos? Ou como vemos nossa vida cristã? Ou como vemos Jesus Cristo?

2. Você já experimentou ou viu outros experimentando a “maldição” psicológica de viver pela lei?

3. Qual verdade em Gálatas 3.13,14 mais o entusiasma hoje?

VERSÍCULOS 15-25 GÃLATAS ■ CAPÍTULO 3$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo pergunta se, tendo começado pelo Espírito, você agora quer ser aperfeiçoado pela carne; em que áreas você começou recebendo a graça mas hoje tenta crescer no esforço da autojustiça?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se não só somos salvos pelo evangelho, mas também santificados por ele, que "trabalho extra" você tem feito para se sentir mais aceito do que a cruz já o fez?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que sinais no seu coração mostram que você tem deixado o evangelho para trás como coisa de iniciante, em vez de voltar a ele todos os dias?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Lei na Vida do Evangelho$t$, 6,
$conteudo$Sempre que ouvimos as afirmações radicais da salvação pela graça, deveriamos, na mesma hora, nos sentir compelidos a perguntar: Se estamos “livres da lei”, quer dizer que não temos de obedecer à lei de Deus? Se sou sempre salvo só pela atuação de Cristo e não pela minha, por que deveria lutar para levar uma vida santa? Tenho alguma obrigação de guardar a lei de Deus? Por quê?

Na verdade, não há questão mais prática do que essa do relacionamento do cristão com a lei de Deus. As outras dúvidas que temos sobre como viver — Como devo tratar meu cônjuge? Em que devo gastar meu dinheiro? Que arestas posso aparar no meu emprego?— são originárias da indagação principal: Como cristão, qual 0 meu relacionamento com a lei de Deus?

No decorrer de sua carta aos gálatas, Paulo estabeleceu que somos salvos, justificados e redimidos somente pela fé em Cristo, e não por nenhum tipo de justiça própria. Portanto, ele chegou ao ponto em que o leitor cuidadoso indagará sobre onde a lei se enquadra. Assim, ele trata dessa questão crucial aqui.

R edigindo um testam ento

Primeiro, Paulo quer chamar a atenção para o que a lei não faz. Por isso começa falando “em termos humanos” (v. 15) — ou, traduzindo literalmente da NIV, ele toma “um exemplo da vida quotidiana”. Salienta que os contratos humanos envolvem obrigações e são difíceis ou impossíveis de se evitar. “Ninguém

G aiatas 3.15-25

anula um testamento já validado, nem lhe acrescenta coisa alguma” (v. 15). A palavra escolhida por Paulo, diatheke, tem mesmo o sentido de testamento legal.

E um bom exemplo, claro, uma vez que, assinado o testamento em seu devido tempo e com valor legal, nós o consideramos um compromisso obrigatório, não importa que mudanças nas condições venham a ocorrer. Assim é com as promessas de Deus. Por exemplo, se uma mulher deixa mais dinheiro para a filha pobre do que para a rica, o documento legal terá força de lei, mesmo se a filha rica perder todo o dinheiro no dia seguinte à morte da mãe. O testamento permanece a despeito das novas condições.

Paulo sabe que alguns poderíam ver que a lei de Moisés “veio quatrocentos e trinta anos mais tarde”, em relação à promessa de salvação feita a Abraão (v. 17), e concluir: Ah! Isso muda tudo! Se pretendemos alcançar a bênção de Abraão, teremos agora de obedecer à lei de Moisés.

Mas ele diz e demonstra que essa conclusão é falsa: “A lei [...] não anula o testamento antes validado por Deus, cancelando a promessa” (v. 17). A lei de Moisés não pode converter a promessa de Deus a Abraão em algo diferente do que ela é — uma promessa. Como pode a vinda da lei mudar a natureza da promessa de Deus a Abraão — a promessa de que haveria uma intervenção sobrenatural, pela graça, para propiciar (Gn 12.1,2; 15.1-6)? O argumento é poderoso. Se a lei de Moisés veio como

Se a lei fosse um a forma de salvação, significaria que Deus fg| decidiu que nâo precisamos de um Salvador.

forma de salvação, significa que Deus mudou de ideia.

Ele teria decidido que não precisamos de um Salvador e que passaria a dar sua bênção com base em desempenho, não em promessa.

G álatas 3.15-25

Se a lei tivesse essa função, nada acrescentaria à promessa; antes a anularia por completo (v. 17). “Pois se a herança provém da lei, já não provém mais da promessa” (v. 18). O princípio é que os próprios conceitos de “promessa” e “lei” são mutuamente excludentes. Se lhe dou algo devido ao que prometi, não é em razão do seu desempenho. Se lhe dou algo devido ao que você fez, não é por causa da minha promessa. Paulo é inflexível: ou algo vem pela graça ou pelas obras; ou algo vem em razão da promessa do doador ou por causa do desempenho do receptor. Tem de ser de um jeito ou do outro.

Vale a pena refletir sobre isso. Para a promessa gerar resultado, ela só precisa ser objeto de fé; mas, para a lei gerar resultado, deve ser obedecida. Por exemplo, se eu lhe disser: Meu tio Jack quer conhecê-lo e lhe dar 10 milhões de dólares, o único modo de você não receber os 10 milhões de dólares é deixando de acreditar nessa afirmação. Se você apenas rir e voltar para casa, em vez de ir à casa do tio Jack lhe fazer uma visita, você talvez nunca ponha as mãos no dinheiro. Mas, se eu lhe disser: Meu tio Jack está disposto a lhe deixar sua herança de 10 milhões de dólares, mas você tem de ir morar com ele e cuidar dele em sua idade avançada, então você precisará cumprir os requisitos e condições, se quiser ficar com o dinheiro.

A promessa de um presente só precisa ser objeto de fé para que se cumpra, mas a lei exige obediência para dar sua recompensa.

A prom essa d a a lia n ç a

Se a lei de Moisés pretendesse ser o meio para a salvação, a promessa a Abraão não teria sido real. E “nesse caso”, a promessa está selada por um testamento. Paulo está mais uma vez nos levando de volta a Gênesis 15. Quando Abraão pergunta a Deus: “Como saberei que hei de recebê-la por herança?” (v. 8), referindo-se à promessa, Deus lhe diz para pegar uma novilha, uma cabra, um carneiro, uma rolinha e um pombinho. Abraão

G álatas 3.15-25

sabe o que fazer com eles: “cortou-os ao meio e colocou cada parte em frente da outra” (v. 10). A atitude parece estranha para nós, mas, na época de Abraão, era a maneira como se “assinava” um testamento ou aliança. Cada signatário passava entre as metades dos animais. Era um jeito (muito!) visuai de quem estava firmando aquele pacto dizer: Se eu romper essa aliança, que também seja partido e separado: merecerei morrer, como aconteceu com estes animais.

O que há de surpreendente na aliança entre Deus e Abraão é que em momento algum Abraão caminhou entre as metades! “Caiu um profundo sono sobre Abrão” (v. 12). Só o que anda entre elas é “um fogo fumegante e uma tocha de fogo que passaram entre aquelas metades” (v. 17). Que estranho fogo é esse? E Deus: “naquele mesmo dia o Senhor fez uma afiança com Abrão” (v. 18).

A promessa de Deus a Abraão é uma promessa de afiança. Trata-se de uma afiança que em nada depende de Abraão, só de Deus. Ele preferiria morrer a quebrar a promessa de bênção a Abraão e a seus descendentes — e morreu de fato, por meio de um descendente em particular (“teu descendente”, G13.16), de modo a oferecer a bênção ao mundo. Esse “descendente”, o homem Jesus Cristo,

A aliança em nada depende de Abraão,

só de Deus. morreu numa cruz.

Com Gênesis 15 em mente,

Paulo apenas chama a atenção dos gálatas para a impossibilidade de Deus acrescentar exigências de obediência à sua promessa feita em afiança. Ele próprio garantira que a cumpriría. Então, como e por que motivo havería a lei de anular “o testa­ mento” (v. 17)?

Portanto, a lei de Moisés deve ter um propósito diferente. Antes, porém, que prossigamos para ver qual era o propósito de Deus ao dar a lei, precisamos perguntar que relevância

G álatas 3.15-25

direta teria o argumento de Paulo aqui para os cristãos gálatas (e para nós hoje). Eles não faziam parte do Israel físico e não estavam vivos na época em que as promessas foram feitas a Abraão, nem quando a lei foi entregue a Moisés.

No entanto, eles corriam o risco de viver o mesmo equívoco na história da redenção contra o qual Paulo argumenta neste contexto. A interpretação errada que Paulo está corrigindo é a de que Deus prometera abençoar seu povo, mas essa bênção seria alcançada ou mantida pela obediência à lei. Como Paulo já salientara, os cristãos gálatas, “tendo começado pelo Espírito”, estavam agora se “aperfeiçoando pela carne” (v. 3). Paulo quer deixar claro que uma oferta iniciada pela graça, como uma promessa voluntária, deve prosseguir até se cumprir nas mesmas bases — ou então deixa de ser promessa. Assim que passa a se basear em desempenho, ela não pode mais ser um dom gratuito. Isso era tão verdadeiro em relação à aceitabilidade dos gálatas diante de Deus quanto em relação ao Israel antigo.

É comum que os crentes comecem a vida cristã olhando além de si mesmos, para “Jesus Cristo [...] exposto [e] crucificado” (v. 1), confiando na promessa divina de que Cristo levou embora nossa maldição e nos concedeu sua bênção. Mas, à medida que avançamos, é tentador e fácil olhar para dentro de nós mesmos, para nossa “carne” (v. 3), apoiados em nosso próprio desempenho para nos dar um senso de aceitação diante de Deus. Fazer isso nos deixa radicalmente inseguros, pois nos priva da certeza e nos incita ao desespero ou ao orgulho.

Paulo quer que os cristãos gálatas tapem os ouvidos para os falsos mestres, a fim de desviar os olhos de si próprios e tornar a voltá-los para a cruz. Qualquer que seja o motivo pelo qual Deus dá ordens ao seu povo sobre como viver, não pode ser para conquistar a aceitação dele. A promessa precede a lei. A lei não pode coexistir com a promessa na produção da bênção; a lei não põe a promessa de lado como fonte de bênção. Israel

G álatas 3.15-25

era uma nação que devia confiar na promessa de Deus; o mesmo vale para cada cristão.

Perguntas jpara reflexão

1. Como os detalhes da cerimônia de aliança entre Deus e Abraão servem de incentivo para você?

2. Quando você se sente mais tentado a olhar para os próprios esforços para se fazer aceitável a Deus?

3. Para ajudá-lo a diagnosticar seu próprio coração, pergunte a si mesmo: O que me faz sentir desespero na vida? O que me leva a sentir orgulho de mim mesmo?

SEGUNDA PARTE

O propósito d a lei

Por fim, no versículo 19, Paulo nos conta qual o objetivo da lei! Ela “foi acrescentada por causa das transgressões”, até a vinda de Cristo. A lei não veio nos falar sobre salvação, mas sobre pecado. Seu principal propósito é mostrar-nos nosso problema —somos infratores da lei — e provar que não podemos ser a solução, visto que somos incapazes de ser perfeitos cumpridores da lei.

O resto dos versículos 19 e 20 é hermético em extremo. Conforme entendem alguns comentaristas, Paulo está dizendo que Deus decretou a lei ao povo através de um mediador, ou seja, M oisés, mas que enunciou a promessa diretamente a Abraão. Mas não há certeza absoluta de que essa interpretação esteja correta. Ninguém sabe com certeza o que Paulo quer dizer ou como o trecho se enquadra em sua argumentação. Felizmente, a direção dada pelo argumento de Paulo e por todos os outros pontos que ele usa como apoio são claros, de modo que não temos urgência em decodificar essas frases para compreendê-lo.

G álatas 3.1525־

No versículo 21, Paulo retorna à declaração com que iniciou o versículo 19. Deus nunca pretendeu que sua lei “concedesse vida”, do contrário conseguiriamos nos tornar justos por meio dela. Na verdade, “a Escritura [i.e., o Antigo Testamento] co- locou tudo debaixo do pecado” (v. 22). O grego de Paulo é um pouco mais vivido do que o português neste trecho. Literalmente, ele diz que “a Escritura aprisionou todo o mundo no pecado”. Essa não é uma função das Escrituras em que costumemos nos concentrar! E provável que Paulo esteja recordando sua própria experiência logo antes da conversão (veja Rm 7.7-13). Ele fora um fariseu satisfeito com a própria vida até sentir o peso da lei contra a cobiça e a inveja (Rm 7.9 diz “quando veio o mandamento”). A lei o fez ver (e sentir) que estava moralmente desamparado. Ele constatou que não era simplesmente pecador, mas prisioneiro do pecado, impotente para se libertar ou curar.

Paulo constatou que era prisioneiro do pecado, impotente para se libertar ou curar.

Esse é o propósito da lei. Ela mostra que o problema não é o fato de “não estarmos à altura” da vontade de Deus — o que exigiria apenas um esforço extra de nossa parte para obtermos melhores resultados —, mas, sim, que estamos completamente debaixo do poder do pecado, precisando de resgate.

A lei tem o poder de nos mostrar que não somos justos; mas não tem como nos dar o poder de sermos justos. Na verdade, quando vemos os padrões de Deus, tentamos alcançá-los e fracassamos, a lei nos mostra que não temos esse poder. Não há como a “justiça” vir “pela lei” (v. 21b). Por irônico que pareça, se pensamos que conseguimos ser justos segundo a lei, deixamos de compreender a ideia principal da lei.

Em suma, Paulo diz, a lei revela nosso pecado “para que a promessa fosse dada aos que creem” (v. 22b). A lei faz seu

G aiatas 3.15-25

trabalho de nos conduzir rumo ao reconhecimento de nossa necessidade de salvação pela graça. A lei, então, não se opõe à salvação pela graça por intermédio de Cristo, antes a apoia, ressaltando a necessidade que temos dela.

A pontando para a prom essa

Paulo usa duas metáforas para caracterizar o modo como a lei opera na vida cristã.

Primeiro, a lei é um guarda. “Mas, antes que viesse a fé, éramos mantidos debaixo da lei, nela confinados para a fé que haveria de ser revelada” (v. 23). As palavras gregas para “mantidos debaixo” e “confinados” significam ser protegidos por guarda militar.

Segundo, a lei é um tutor, um paidagogos, sob cuja supervisão (i.e., tutoria) vivemos. “A lei se tornou nosso guia para nos conduzir a Cristo” (v. 24). Nos lares da época de Paulo, o tutor ou guardião costumava ser um escravo que supervisionava os filhos para os pais. Encontraremos essa metáfora de novo no capítulo 4.

Em ambos os casos, o guarda e o tutor eliminam a liberdade. Em ambos os casos, o relacionamento com a “lei” não é íntimo nem pessoal; baseia-se em recompensas e castigos. E, em ambos os casos, somos tratados como crianças, ou pior.

Assim, Paulo descreve todas as religiões não baseadas no evangelho, caracterizando-as por:

■ um senso de escravidão; ■ uma relação impessoal com o divino, motivada pelo desejo de recompensas e pelo medo de castigos; ■ ansiedade acerca da própria posição perante Deus.

Mas a segunda metáfora (diferente da primeira) nos mostra que o verdadeiro propósito da lei é instrutivo. Ela aponta para

G aiatas 3.15-25

além de si mesma, como o tutor busca preparar as crianças para viver como pessoas adultas e livres. A lei aponta para:

■ não uma vida de confinamento, mas de liberdade; ■ não um relacionamento impessoal, mas pessoal com Deus; ■ não a imaturidade, mas a maturidade de caráter.

Assim, o Antigo Testamento requer que as pessoas amem “o Senhor, [seu] Deus, de todo o [seu] coração” (Dt 6.5) e que sejamos o povo “em cujo coração está a minha [de Deus] lei” (Is 51.7). A lei (se de fato lhe dermos ouvidos) enfatiza sem parar que necessitamos de justiça, de poder, de um amor por Deus que estão além de nós mesmos e além da lei. Necessitamos de salvação pela graça.

Necessitamos de justiça, de poder, de um amor que estão além de nós mesmos.

Vale a pena citar aqui um belo trecho de John Stott:

Depois de dar a promessa a Abraão, Deus deu a lei a Moisés.

Por quê? Tinha de piorar as coisas antes de poder melhorá-

-las. A lei expôs o pecado, provocou-o, condenou-o. O pro- pósito da lei era erguer a capa de respeitabilidade do homem e revelar como ele de fato era por baixo — pecador, rebelde, culpado, sob julgamento de Deus e impotente para se salvar.

Ainda hoje a lei deve ter permissão para cumprir a tarefa dada por Deus. Um dos grandes erros da igreja contempo- rânea é a tendência de amenizar o pecado e o juízo. [...]

Nunca devemos contornar a lei e ir diretamente ao evan- gelho. Fazer isso é contradizer o plano de Deus na história bíblica. [...] Nenhum homem jamais soube apreciar o evan- gelho até que a lei lhe fosse revelada primeiro. Só contra a escuridão do céu noturno, densa como tinta, as estrelas

G álatas 3.15-25

começam a aparecer; e só contra o fundo escuro do pecado e do juízo, o evangelho reluz.1

Muitos cristãos (embora não todos) testemunham que, ao tomarem consciência de sua necessidade de Deus, passaram por um período de imaturidade em que se tornaram extremamente religiosos. Buscaram com diligência emendar seus caminhos e realizar tarefas religiosas para “purificar sua vida”. Renderam-se a Deus com lágrimas nos olhos em vários cultos da igreja. “Entregaram a vida a Jesus” e “o convidaram a entrar em seu coração”. Mas, com grande frequência, na verdade só estavam decidindo ser muito bons e muito religiosos, na esperança de que isso lhes assegurasse o favor e a bênção de Deus. Nesse estágio, tendiam a enfrentar muitos altos e baixos emocionais (como crianças), sentindo-se bem quando assumiam um compromisso espiritual e desanimados quando fracassavam em manter uma promessa para Deus. Experimentavam grande ansiedade.

Como diz Paulo aqui, eram como crianças debaixo de um “tutor”. Estavam a caminho de descobrir Deus no evangelho, mas ainda não tinham chegado lá!

A lei n a vida do cristão

A lei nos confinou “a fim de que pela fé fôssemos justificados” (v. 24). Com o advento da fé, “já não estamos sujeitos a esse guia [i.e., a sua tutela]” (v. 25).

Nossos esforços para conquistar a aprovação de Deus pela obediência à sua lei nos mostram que temos de ir além da lei para encontrar tal aprovação. Quando percebemos isso e

1 The message o f Galatians,,Vac Bible Speaks Today (Downers Grove: I VP, 1968), p. 92-3 [edição cm português: A mensagem de Gálatas (São Paulo: ABU, 1997)].

G álatas 3.15-25

permitimos que Cristo seja nosso Salvador, aprendemos a lição que a lei buscava nos transmitir como nossa tutora.

No entanto, para o cristão, a lei já atingiu o propósito de ser nosso guarda e tutor. Isso quer dizer que podemos esquecê-la? Absolutamente não (como Paulo diria!).

Conforme vimos acima, a lei nos serviu de “supervisora” até encontrarmos Cristo, e foi como o guardião de uma criança até ela alcançar a maturidade. Mas vamos estender um pouco a analogia. A criação de uma criança tem como propósito fazer com que ela, ao chegar à maturidade, se desfaça de todos os valores dos pais ou guardiões e viva de modo completamente diferente?

Não. Se tudo correr bem, a criança agora adulta não mais será constrangida a obedecer como antes, mas internalizou os valores básicos e vive de maneira semelhante à de antes porque assim o quer.

Portanto, Paulo não está indicando que não mais temos qualquer relação com os valores da lei de Deus, mas que não a vemos mais como um sistema de salvação. Ela não impõe mais a obediência por meio da coerção e do medo. O evangelho significa que não mais obedecemos à lei por medo de rejeição e esperança de salvação pelo desempenho. Mas, quando nos apossamos da salvação pela promessa, nosso coração se enche de gratidão e do desejo de ser como nosso Salvador e de agradar a ele — e a maneira de fazer isso é obedecendo à lei. Uma vez que recorremos à lei motivados pela gratidão, somos melhores em nossa obediência à lei do que jamais fomos antes, quando acreditávamos que essa obediência podería nos salvar.

Enchemo-nos do desejo de ser como nosso Salvador — e a m aneira de fazer isso é obedecendo à lei.

Por quê? Primeiro, se pensarmos que a obediência à lei nos salvará, tornamo-nos emocionalmente incapazes de admitir o

G álatas 3.15-25

quanto de fato ela é investigativa e exigente. Por exemplo, Jesus diz que irar-se contra alguém ou desprezá-lo é uma forma de assassinato (Mt 5.21,22). Só se soubermos que não podemos cumprir isso por completo, mas que não precisamos fazê-lo em absoluto para sermos salvos por causa do que Cristo fez por nós, seremos capazes de admitir quão ampla e profunda é essa ordem. Se buscarmos ser salvos pela obediência a ela, ficaremos o tempo todo tentando limitar o escopo e a aplicação da lei de Deus, a fim de torná-la administrável para que a guardemos.

Segundo, a alegria da gratidão é o motivo que levará a uma persistência muito maior na obediência do que a submissão motivada pelo medo. A submissão pelo medo converte a obediência em trabalho penoso que não pode enfrentar adversidades. Em resumo, o evangelho nos permite honrar verdadeiramente a lei de uma maneira que os legalistas não conseguem. Sem o evangelho, podemos obedecer à lei, mas aprenderemos a odiá-la. Faremos uso dela, mas não a amaremos de verdade. Só se obedecermos à lei porque somos salvos, em vez de para sermos salvos, nós o faremos “para Deus” (G1 2.19). Uma vez compreendida a salvação pela promessa, não obedecemos mais a Deus por nós, usando o sistema da salvação pela lei para obter coisas de Deus. Em vez disso, agora obedecemos a Deus por ele, usando o conteúdo da lei para agradar e deleitar nosso Pai.

Lei e graça trabalham juntas na salvação cristã. Muitos desejam alcançar alegria e aceitação, mas não admitem a seriedade do seu pecado. Essas pessoas não dão ouvidos à análise investigativa e dolorosa de sua vida e coração empreendida pela lei. Mas a menos que vejamos quão impotentes e grandes pecadores somos, a mensagem da salvação não entusiasmará nem libertará. A menos que saibamos quão grande é nossa dívida, não podemos fazer qualquer ideia de como foi profundo o pagamento de Cristo. Se pensarmos que não somos tão maus assim, a ideia da graça nunca nos transformará.

G aiatas 3.15-25

A lei nos mostra como de fato somos. Assim, ela nos chama para vermos Cristo como ele de fato é: nosso Salvador, aquele que cumpriu a lei em nosso benefício e depois morreu em nosso lugar para que pudéssemos receber a bênção prometida. A lei nos permite amar Jesus e nos capacita a mostrar nosso amor em grata obediência a ele.

Se pensarm os que não somos tão m aus assim, a ideia da graça nunca nos transformará.

para reflexão Perguntas

1. Relembre sua conversão ou o momento em que entendeu o evangelho. Como sua visão da lei de Deus mudou?

2. De que modo conhecer a lei de Deus aumenta sua gratidão por Cristo? Que diferença isso faz nos seus afetos?

3. Por que você obedece à lei de Deus? Já aconteceu de obedecer a ela pelos motivos errados?

GÁLATAS ■ CAPÍTULO 3

VERSÍCULO 26-29

■ CAPÍTULO 4

VERSÍCULOS 1-7$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A lei não anula a promessa, mas serve para nos mostrar o pecado e nos conduzir a Cristo; você tem usado os mandamentos de Deus para correr para Cristo ou para tentar dispensá-lo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se a lei foi "aio para nos conduzir a Cristo", em que momentos você a transforma em juiz que o condena, em vez de em mestre que o leva à graça?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Estar livre da lei como meio de mérito não é estar livre dela como caminho de amor; onde você usa a graça para se eximir de obedecer, em vez de para obedecer com gratidão?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Filhos de Deus$t$, 7,
$conteudo$Chegamos ao clímax de tudo que Paulo disse até agora. Na verdade, chegamos ao clímax do evangelho:

A ideia de que somos filhos de Deus, filhos e filhas do pró- prio Deus [...] é a mola propulsora da vida cristã. [...] Nossa condição de filhos de Deus é o ápice da criação e o objetivo da redenção.1

Se quisermos entender quem é o cristão e por que ser cristão é um privilégio, temos de saber dar valor à adoção divina. Se Jesus, na condição de “o descendente” (G1 3.19), tem todas as bênçãos prometidas a, . _ . m Se quisermos entender a Abraao, então, automati- |g| M camente, qualquer um que Ej q u e m é O cristão e _ pertença a Cristo pela fé se |f | P or c?u e ser cristáo ® torna herdeiro da promessa | | | u m P rivilégio, temos de Abraão (v. 29). Como essa | | | saber dar valor à herança chega até nós? Por ■ü adoçáo divina. meio do Filho, tornamo-nos filhos de Deus por direito legal (4.4,5), recebendo um novo status; e, por meio do Espírito, tornamo-nos filhos de Deus por experiência (v. 6,7).

1Sinclair B. Ferguson, Children o f the living God (Carlisle: Banner of Truth, 1989), p. 5-6.

G álatas 3.26—4.7

Filhos d e D eus

A essência da vida cristã se encontra em 3.26: “Pois todos sois filhos de Deus pela fé em Cristo Jesus”. Já somos filhos. Não se trata de um objetivo a alcançar, nem de uma conquista futura, mas de algo que já temos. Faz parte do nosso estado presente.

Acontece que essa condição de filhos não é um pressuposto universal. Não somos “filhos de Deus” de modo genérico, pelo fato de termos sido criados por ele. Existe a ideia de que todos os seres humanos são gerados por Deus pelo fato de terem sido feitos à sua imagem (At 17.29). Paulo, no entanto, está se referindo a um tipo de relacionamento bem mais profundo aqui. A condição de filho vem “pela fé em Cristo Jesus”. Só somos seus filhos quando temos fé no Filho. É pela fé que Deus nos adota.

Muitos se ofendem com o uso do substantivo masculino “filhos” para se referir a todos os cristãos, homens e mulheres. Alguns prefeririam traduzir o versículo 26 assim: “Pois todos sois descendência de Deus”. No entanto, se nos apressarmos demais em corrigir a linguagem bíblica, perderemos a natureza revolucionária (e radicalmente igualitária) da afirmação de Paulo. Na maioria das culturas da antiguidade, filhas não herdavam propriedades. Portanto, “filho” significava “herdeiro legal”, status proibido para as mulheres. Mas o evangelho nos diz que somos todos filhos de Deus em Cristo. Somos todos herdeiros. De semelhante modo, a Bíblia descreve todos os cristãos em conjunto, incluindo os homens, como a “noiva de Cristo” (cf. Ap 21.2). Deus é imparcial em suas metáforas que envolvem gêneros. Os homens fazem parte da noiva do seu Filho, e as mulheres são seus filhos, seus herdeiros. Se não permitirmos a Paulo chamar as mulheres cristãs de “filhos de Deus”, deixaremos de perceber o quanto essa afirmação é maravilhosa e radical.

G álatas 3.26—4.7

R evestidos d e Cristo

Como a fé em Cristo faz com que sejamos tratados como filhos de Deus? Versículo 27: Paulo explica a esses crentes que pela fé (cuja manifestação pública é ser batizado “em Cristo”), “vos revestistes de Cristo”. A imagem de alguém que se veste é uma das metáforas prediletas de Paulo (veja Rm 13.12; Ef 4.24; Cl 3.12). Aqui, ele compara o próprio Cristo a uma roupa. E a ideia de nos revestirmos de Cristo implica quatro fatos incríveis:

1. Nossa identidade primordial está em Cristo. As roupas revelam quem somos. Quase todo tipo de roupa é, na verdade, um uniforme que mostra nossa identificação com pessoas do mesmo gênero, classe social ou etnia. Mas dizer que Cristo é nossa roupa equivale a dizer que nossa identidade definitiva não se encontra em nenhuma dessas classificações, mas em Cristo. 2. A proximidade da nossa relação com Cristo. Suas roupas têm maior proximidade com você do que qualquer outro bem. Você depende delas para lhe fornecer proteção o tempo todo. Elas o acompanham por toda parte. Portanto, dizer que Cristo é nossa roupa é chamar-nos à dependência dele e à consciência existencial de Cristo a cada segundo. Espiritualmente, temos de “praticar sua presença”. 3. A imitação de Cristo. Praticar a presença de Cristo acarreta como consequência que nossos pensamentos e atos se desenvolvam o tempo todo como se estivéssemos perante a sua face. Uma expressão bíblica semelhante é “andar na sua presença” (veja, por exemplo, Gn 17.1; SI 56.13). Significa introduzir Jesus em todas as áreas da vida e transformá-las de acordo com sua vontade e Espírito. Devemos “nos revestir” de suas virtudes e atos. Devemos “nos vestir como Jesus”. 4. Nossa aceitabilidade diante de Deus. Por fim, roupas são usadas como adornos. Cobrem nossa nudez. Deus nos tem provido de roupas que cubram nossa vergonha desde a Queda

G aiatas 3.26—4.7

(veja Gn 3.7,21). Dizer que Cristo é nossa roupa é afirmar que, aos olhos de Deus, somos amados devido à obra e à salvação de Jesus. Quando Deus olha para nós, enxerga-nos como seus filhos porque vê seu Filho. O senhor Jesus nos tem dado sua justiça e perfeição para usar.

Deus nos tem provido de roupas que cubram nossa vergonha desde a Queda.

Portanto, Gálatas 3.27 é uma metáfora ousada e abrangente de uma vida totalmente nova. Significa pensar em Cristo o tempo todo, ter seu Espírito e seu caráter inculcado e permeando tudo que se pensa, diz e faz. Isso vai muito além do cumprimento de regras e regulamentos. Vai além até da simples obediência. É estar apaixonado por ele, batizado nele, inundado dele. Jamais o cristão necessitará de algum compromisso adicional com a lei de Moisés a fim de receber ou manter a plena aceitação divina. Ele está revestido de Cristo.

Um em Cristo

O versículo 26 nos revela a espantosa intimidade existente entre cristãos e o Deus criador, nosso Pai. O versículo 27 delineia a maravilhosa proximidade entre os cristãos e Deus Filho, nosso Salvador. O versículo 28 decorre desses dois versículos e nos mostra a unidade entre os cristãos. Não existe nenhuma divisão entre raças diferentes, estrato social ou gêneros.

Isso não quer dizer que não há mais distinção alguma dentro da igreja. Não significa, por exemplo, que os gregos não devem manter sua cultura e consciência distintas — que precisam tornar-se idênticos aos judeus (esse é um dos pontos principais da carta inteira!). Não pode significar, portanto, que não deveria haver nenhuma distinção entre homem e mulher no que diz respeito ao modo de viver. O ensino de Paulo em Efésios 5.22—6.9 e Colossenses 3.18—4.1 mostra que sua afirmação

G álatas 3.26-4.7

não tinha a intenção de suprimir deveres e práticas distintos de diferentes culturas, classes e gêneros. Não somos todos idênticos ou intercambiáveis, mas somos todos “um”.

O evangelho tem implicações sociais radicais. Significa que sou cristão antes de mais nada. Que todas as barreiras que separam os povos do mundo em facções rivais caem por terra em Cristo.

O evangelho significa que sou cristão antes de m ais nada.

Paulo cita as três barreiras que costumam dividir as pessoas:

1. A barreira cultural: “não há judeu nem grego”. Divisões culturais não devem fazer parte da igreja de Cristo. Gente de uma cultura não precisa se tornar igual à de outra cultura para ser aceita por Deus. Portanto, devemos aceitar-nos uns aos outros, sem que um grupo considere ou declare a própria cultura superior à dos demais. Dentro da igreja, devemos nos associar uns com os outros e nos amar uns aos outros, transpassando as barreiras raciais e culturais. 2. A barreira da classe social: “não há escravo nem livre”. De novo, a estratificação econômica não deve se estender para dentro da igreja. As pes- n soas não devem associarse de acordo com a classe social (como acontece no mundo), mas, sim, transpor tais barreiras. Logo, não se deve fazer o pobre ou o trabalhador de salário modesto sentir-se inferior de forma nenhuma. Mas tampouco, o rico deve ser vítima de ressentimentos nem ser marginalizado. 3. A barreira do gênero: “não há homem nem mulher”. Essa talvez fosse a barreira mais forte na época de Paulo. As mulheres eram consideradas inferiores aos homens em tudo.

Não se deve fazer o pobre sentir-se inferior. O rico não deve ser vítima de ressentimentos.

G aiatas 3.26-4.7

A aplicação desse princípio é muito explosiva e controversa até hoje. De qualquer forma, ele era revolucionário. Pelo fato de serem iguais em Cristo, diante de Deus, as mulheres devem ser vistas como pessoas tão dotadas e capazes quanto os homens.

E natural perguntar: qual o entendimento de Paulo acerca das implicações do versículo 28 para a sociedade como um todo? “Não há escravo nem livre” seria um chamado à abolição da escravatura? Em caso afirmativo, por que, em Efésios 6.5-8 e Colossenses 3.22-25, ele diz aos escravos para serem diligentes no trabalho? Note bem, a tese de Paulo em Gálatas 3 é que essa igualdade radical vale para quem está em Cristo. As implicações disso para a sociedade em geral eram só isso mesmo — implicações, que precisaram ser resolvidas por si mesmas ao longo dos anos. Por exemplo, na antiguidade, a maioria das sociedades seguia a lei da “primogenitura”: o filho mais velho herdava praticamente todo o patrimônio da família. Nessa passagem, Paulo contraria esse costume ao dizer a todo cristão, homem e mulher, que ele e ela são herdeiros idênticos de Deus, ou seja, herdeiros de tudo de que Jesus é herdeiro. Evidentemente, Paulo não está desautorizando a lei da primogenitura nesse texto. Não era essa sua preocupação direta. Contudo, não menos evidente é que as famílias cristãs que começam a pensar dessa maneira, tão subversiva para as atitudes sociais pagãs, apresentarão a tendência de abandonar a prática da primogenitura. A longo prazo, essa doutrina de Paulo estava fadada a causar efeito sobre o modo como os cristãos viviam em sociedade como um todo.

A liberdade do evangelho precisa transformar nossa atitude para com tudo na vida. Mas a mudança social mais ampla não é a preocupação imediata de Paulo nesse ensinamento. Ele quer que o evangelho derrube barreiras dentro da comunidade cristã.

G aiatas 3.26-4.7

Só as verdades dos versículos 26,27 levam a esse tipo de unidade. De que maneira? Primeiro, as boas-novas do evangelho criam unidade. Os privilégios que temos no evangelho (filiação, v. 26; o Espírito, v. 14; justiça perfeita, v. 11; tudo graças a nossa união com Cristo, v. 27) são estupendos a ponto de sobrepujar as maiores vantagens terrenas merecidas ou herdadas. Como posso desprezar alguém que está revestido de Cristo? Por que havería de sentir ciúmes de alguém, uma vez que sou filho de Deus?

Segundo, as más notícias do evangelho criam unidade. Como receptores da graça, sabemos que as bênçãos nos vêm imerecidas, de modo que nosso orgulho de raça, status ou gênero é afastado. Sabemos que somos pecadores como qualquer outra pessoa. Não há nenhuma razão para nos considerarmos melhores do que os outros ou para excluí-los. Somos pecadores, adotados pela graça.

Herdeiros por interm édio d e Cristo

Cada versículo desta seção nos amplia os horizontes, fazendo vibrar nosso coração com tudo que somos pela fé. O versículo 26 aponta para o alto — somos filhos do Criador! O versículo 28 abarca todo o globo — estamos unidos a todos os outros cristãos; somos um em Cristo, independentemente de tudo que, segundo o mundo, nos deveria dividir.

O versículo 29 se volta para a história. Ao nos revestirmos de Cristo por intermédio da fé, somos “descendência de Abraão e herdeiros conforme a promessa”. Tudo que prometeu a Abraão, Deus tem cumprido e cumprirá em seu Filho, Jesus. Portanto, na condição de seus filhos adotivos, nós desfrutaremos de tudo que ele prometeu.

para reflexão Perguntas

1. Como você se sente em relação ao fato de ser filho adotivo de Deus?

G aiatas 3.26—4.7

2. Em que área de sua vida você mais precisa lutar para se lembrar de que está revestido de Cristo? Que diferença praticar a presença de Cristo faria nesse aspecto?

3. Que barreiras dividem as pessoas na região em que você vive? Como elas vêm sendo derrubadas dentro de sua igreja, e o que você faz para colaborar nesse sentido?

SEGUNDA PARTE

A p len itu d e dos tem pos

As grandes verdades de 3.26-29 apontam para o alto, para fora e para trás. Requerem uma vida inteira para serem apreciadas e nos oferecem uma eternidade para delas desfrutarmos. No início do capítulo 4, Paulo faz uma pausa nessas verdades para nos ajudar a entender melhor o que significa ser adotado por Deus.

Para ilustrar nossa condição de filhos, ele usa a imagem da criança que herda uma grande propriedade. Enquanto menor de idade, ela “em nada é diferente de um escravo” (4.1), uma vez que “está [sujeita] a tutores e administradores” (v. 2). Quando alcança a maturidade, no entanto, toma posse de sua herança.

Essas verdades requerem um a vida inteira para serem apreciadas e nos oferecem um a eternidade para delas desfrutarmos.

Na antiguidade, a “plenitude dos tempos”, ou maturidade, era um processo importante e bem definido. A criança romana que herdava alguma coisa dependia de tutores até os 14 anos e, de certa forma, continuava dependendo de administradores até os 25. Só então esse jovem podia exercitar o controle completo e independente do seu patrimônio.

O que significa ser “o [...] menor de idade [...] em nada [...] diferente de um escravo” (v. 1)? A ilustração de Paulo se

G aiatas 3.26-4.7

aplica espiritualmente a nós em três níveis diferentes. Diversos comentaristas escolhem níveis diferentes, mas acho que estão todos implícitos no texto.

Primeiro, a ilustração mostra que, na época da liderança de Moisés, o povo de Deus contava com a liberdade espiritual a eles prometida na aliança com Deus, firmada no monte Sin a i. Todavia, ainda não a possuíam nem a vivenciavam. Com poucas exceções, debaixo da lei mosaica as pessoas não experimentavam a intimidade e a liberdade prometidas, porque os meios e a certeza do perdão eram genéricos e vagos (veja Hb 10.1-4).

No segundo nível, ela trata de retrato aplicável a todos os seres humanos. “Assim também nós, quando éramos menores, estávamos debaixo da escravidão aos princípios elementares do mundo” (v. 3, grifo nosso). Paulo delineará com mais detalhes o que entende por “princípios elementares” nos versículos 8-11 (veja o próximo capítulo). Mas, como a maioria dos gálatas não nascera judia, ele deve estar falando que todos os seres humanos são “escravos” espirituais antes de se achegarem a Cristo. Em certo sentido, todos nos encontramos “debaixo da lei”, mesmo que nunca tenhamos ouvido falar da Bíblia ou de Moisés. Por quê? Porque todos tentamos desesperadamente viver à altura de determinados padrões. Somos ansiosos e vivemos sobrecarregados pelas preocupações. Nosso relacionamento com o divino é distante ou inexistente.

Por fim, no terceiro nível, esse é o retrato de como os cristãos podem, de certa forma, deixar de experimentar a liberdade e a alegria de sua salvação. Eles podem continuar vivendo dia após dia como escravos, em vez de como os filhos adotivos de Deus que de fato são. Paulo retornará ao tema nos versículos 8,9 (e 5.1). Apesar de ricos no evangelho, filhos adotivos de Deus com acesso direto e total ao Pai, pode acontecer de voltarmos a nos relacionar com ele apenas por meio de nossos méritos históricos e morais. E como se nos fosse dado um presente e o

G álatas 3.26-4.7

devolvéssemos a quem nos presenteou para podermos lutar até fazer por merecê-lo.

A escravidão é nosso estado natural. Mas Paulo vai mostrar, primeiro, como as pessoas podem alcançar a “plenitude dos tempos”, e depois como elas podem desfrutar desse amadurecimento.

A obra do Filho

“Vindo, porém a plenitude dos tempos” (v. 4) — na história e em nossa própria experiência —, “Deus enviou seu Filho”. E o Filho que nos torna maduros.

Como? Primeiro, resgatando “os que estavam debaixo da lei” (v. 5), afastando toda penalidade ou dívida. Em certo sentido, pertencemos à lei — estamos “debaixo” do seu domínio, somos escravos dela. Temos de cumpri-la, mas não podemos.

Assim, Deus enviou seu Filho, “nascido de mulher” (v. 4) — um ser humano de verdade —, e o enviou “nascido debaixo da lei”. Jesus nasceu, como todo ser humano, em estado de obrigação para com a lei de Deus. Mas Jesus tem a capacidade singular de “resgatar os que estavam debaixo da lei” (v. 5). O mesmo termo empregado em 3.13 reaparece aqui, “resgatar”. Significa libertar o escravo do proprietário pagando seu preço total. Nesse caso, o senhor do escravo é a lei. Jesus paga nosso preço total à lei. Cumpre plenamente todas as exigências da lei sobre nós. E, portanto, é capaz de nos libertar dela.

Segundo, Jesus adquire para nós “a adoção de filhos” (v. 5). A New International Reader’s Version, uma versão em inglês, diz que ele “queria que fôssemos adotados como filhos, com todos os direitos que os filhos têm”. As duas traduções tentam transmitir o sentido de uma única palavra, cujo sentido literal é que, em Cristo, recebemos a “condição de filhos”. Trata-se de terminologia legal. No mundo greco-romano, um homem rico e sem filhos podia escolher um de seus servos e adotá-lo. No momento da adoção, o servo deixava de ser escravo e recebia

G álatas 3.26-4.7

todos os privilégios financeiros e legais, tanto no âmbito da propriedade quanto fora, no mundo, na condição de filho e herdeiro. Mesmo que, por nascimento, ele fosse um escravo, sem relação com o pai, a partir de então ele recebia o status legal de filho. Era uma vida nova de privilégios. Trata-se de uma metáfora extraordinária para o que Jesus nos concedeu.

Portanto, para entender o que Deus enviou seu Filho a fazer, temos de nos transportar para um antigo mercado escravo, a fim de dar valor à redenção, e a uma residência abastada da antiguidade, a fim de compreender o conceito de filiação. Só então, juntos, esses conceitos nos dão um retrato completo do que Cristo realizou por nós.

Ainda assim, é muito fácil e comum pensar em nossa apenas em termos do primeiro conceito, e não do segundo. Ou seja, só como a transferência dos nossos pecados de nós, mas não como a transferência dos direitos e privilégios do Filho para nós. Pensando assim, na verdade nos consideramos apenas “meio salvos pela graça”. Podemos obter o perdão, mas agora temos de ser bons na vida para fazer por merecer e manter o favor e as recompensas de Deus. Paulo quer demonstrar aos gálatas, e a nós, que Cristo não apenas afasta a maldição a que fazíamos jus (3.13; 4.5a) como também nos dá a bênção por ele merecida (3.14; 4.5b). A honra e a recompensa divinas são tão certas e garantidas quanto o nosso perdão.

Para entender o que Deus enviou seu Filho a fazer, temos de nos transportar para um antigo mercado escravo e a um a residência abastada d a antiguidade.

Para usar outra imagem: a salvação de Jesus não é apenas como receber perdão e libertação do corredor da morte e da prisão. Nesse caso, estaríamos livres, mas por nossa conta e risco, abandonados para trilhar nosso próprio caminho no

G álaias 3.26-4.7

mundo, de volta aos nossos próprios esforços, se quiséssemos fazer alguma coisa da vida.

Acontece que, no evangelho, descobrimos que Jesus nos tirou do corredor da morte e pendurou em nosso pescoço uma medalha de honra ao mérito. Somos recebidos e acolhidos como heróis, como se tivéssemos realizado feitos extraordinários.

A menos que nos lembremos disso, ficaremos ansiosos e até desesperados quando pecarmos ou falharmos. Pensaremos que nossas dívidas foram apagadas, mas que nos cabe registrar boas ações em nosso carnê a fim de que Deus nos ame e aceite. E onde nos encontramos, se nos lembrarmos apenas de metade do versículo 5. Mas nosso carnê foi apagado e nele Jesus anotou sua justiça, da primeira à última página. Nossa herança não é um prêmio a ser ganho. É um presente de Cristo.

A obra do Espírito

O versículo 6 — “Deus enviou [...] o Espírito”— está em paraleio com o versículo 4 — “Deus enviou seu Filho”. O propósito do Filho era nos assegurar o status legal de filhos. Em contrapartida, o propósito do Espírito é garantir a experiência real disso.

Trata-se de uma obra diferente da obra do Filho, que nos coloca em uma condição legal objetiva, a qual nos pertence, quer o sintamos, quer não. A obra do Espírito não é assim, em absoluto. O Espírito nos traz uma experiência subjetiva radical. Quais as suas marcas, suas características?

ffl Primeiro, o Espírito nos leva a clamar “Aba, Pai”. A palavra grega krazdon é muito forte e designa um grito alto, rasgado. Refere-se a uma paixão e um sentimento profundos, penetrantes. ® Segundo, “clamar” refere-se a nossa vida de oração. Como um filho não prepara discursos para apresentar aos pais, assim os cristãos que experimentam essa obra

G aiatas 3.26-4.7

do Espírito encontram grande espontaneidade e realidade na oração. Orar não é mais algo mecânico ou formal, mas cheio de fervor, paixão e liberdade. ■ Terceiro, a expressão “clamar” conota um senso da presença real de Deus. Como é automático a criança gritar chamando o pai que está perto quando tem um problema ou dúvida, assim os cristãos que experimentam a obra do Espírito sentem a realidade extraordinária da proximidade de Deus. ■ Quarto, “Aba” — palavra em linguagem de bebê, querendo dizer “papai” ou “paizinho” — expressa confiança no amor e certeza de acolhimento. Como a criança pequena simplesmente presume que o pai a ama e está a postos para ajudá-la, sem jamais duvidar da segurança e sinceridade dos seus braços fortes, assim os cristãos podem ter ousadia e certeza impressionantes de que o amor de Deus por eles é infinito.

A obra do Filho é externa a nós, algo que podemos ter sem sentir. Mas a obra do Espírito é interna e consiste em sermos absolutamente tocados — tanto em termos emocionais quanto intelectuais — pelo amor do Pai. A obra do Filho e a do Espírito jamais devem ser separadas, nem se deve permitir que uma ofiisque a outra. A plenitude do Espírito é experimentada quando meditamos no amor do Filho. Os dons do Filho são desfrutados quando olhamos para o Espírito em busca de direção.

O privilégio d a co n d içã o d e filhos

Quais os direitos de filiação? “Porque sois filhos...” (v. 6): temos intimidade de relacionamento, como vimos na seção anterior, e autoridade sobre os bens.

Filiação significa que cada um de nós é um “herdeiro” (v. 7). A única razão para o servo ser adotado como filho seria o fato

G álatas 3.26—4.7

de o pai não ter nenhum herdeiro. Assim, a pessoa da ilustração de Paulo dispõe de um título legal sobre toda a propriedade paterna, pois está sendo tratada como filha única.

Para o filho de Deus, todos os dias são dias de confiança e ousadia. Não andamos com medo de nada nem de ninguém; nosso Pai é dono de tudo isso aqui! Deus nos honrará como honra seu único Filho. Vivemos com a cabeça bem erguida.

Nossa condição de filhos afasta o medo de não nos realizarmos ou de deixarmos de ser aprovados — medo esse presente na raiz de grande parte da nossa desobediência. E há a garantia de que compartilharemos a glória de Deus no futuro. A espantosa consequência da filiação é que Deus agora nos trata como se tivéssemos feito tudo que Jesus fez. Somos tratados como se fôssemos “filhos únicos”, como Jesus. O próprio Jesus disse isso ao orar por seu povo: “Pai [...] para que o mundo creia que tu me enviaste” e “que me enviaste e os amaste, assim como me amaste. Pai, meu desejo é que aqueles que me deste estejam comigo onde eu estiver” (Jo 17.21,23,24, grifo nosso).

Não andam os com medo de n ad a nem de ninguém; nosso Pai é dono de tudo isso aqui!

Na verdade, tudo isso está implícito no uso do termo “Aba” (G14.6). Por que Paulo usaria uma expressão idiomática do aramaico numa carta para gálatas falantes de grego que provávelmente não conheciam o aramaico, a língua comum da Palestina? Porque Jesus Cristo usou-a ao se dirigir a seu Pai (Mc 14.36). Era um termo familiar atrevido para ser usado ao falar com o Senhor todo-poderoso. Assim, quando diz que deveriamos utilizá-lo, Paulo está afirmando com todas as letras ser legal a condição pela qual herdamos os direitos do próprio Jesus. Podemos nos achegar a Deus como se fôssemos tão belos, heroicos e fiéis quanto Jesus em pessoa. Tudo que é dele é nosso.

G álatas 3.26-4.7

Há, portanto, dois passos específicos que podemos dar a fim de experimentar em maior profundidade nossa filiação. Primeiro, devemos separar tempo significativo para estudar a obra do Filho, pedindo ao Espírito que nos ilumine e a torne real para nós. A conexão estreita dos versículos 4,5 com os versículos 6,7 significa que devemos aprender a meditar sobre a Bíblia, a conectar nossa oração a nosso estudo, e nosso estudo a nossa oração.

Segundo, precisamos “clamar” a nosso Pai com espontaneidade ao longo de todo o dia. Em outras palavras, temos de analisar e tratar as questões da vida diária tendo em mente seu amor paternal. Devemos aprender a perguntar, a cada instante: Estou agindo como um escravo que sente medo de Deus ou como um filho seguro do amor do meu Pai? Ao clamarmos “Aba, Pai” em nossa vida, o Espírito faz sua obra, assegurando-nos “de que somos filhos de Deus [...] e coerdeiros de Cristo” (Rm 8.16,17), inundando nosso coração com uma certeza que transforma a vida.

para reflexão Perguntas

1. O que o entusiasmou mais neste trecho da Bíblia?

2. A adoração é algo que você tanto vivência quanto compreendei De que maneira você pode meditar mais sobre a obra do Filho e pedir ao Espírito que opere mais em seus afetos?

3. Quando você corre mais perigo de viver como um escravo e não como filho?

VERSÍCULOS 8-20 GÁLATAS ■ CAPÍTULO 4$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo diz que você já é filho de Deus pela fé, não um candidato à adoção; o quanto você ainda vive como servo na prova, tentando merecer um lugar que já é seu por direito?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se o Espírito clama "Aba, Pai" em você, em que momentos você trata Deus mais como patrão a ser satisfeito do que como Pai que já o recebeu?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que já é herdeiro de tudo que foi prometido a Abraão, que carência de aprovação você ainda tenta preencher com desempenho, em vez de descansar na sua filiação?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Duas Religiões, Dois Ministérios$t$, 8,
$conteudo$Esses versículos nos apresentam dois contrastes. Um deles, entre a fé do evangelho e as religiões do mundo (v. 8-11), expressa uma das percepções mais importantes e notáveis do livro inteiro. O outro é entre o ministério do evangelho e o ministério do mundo (v. 1220 )־e nos dá esclarecimentos sobre como o evangelho afeta de modo prático nossos relacionamentos com as pessoas.

E importante que entendamos esses contrastes e aprendamos a enxergá-los em nossa vida e ao nosso redor. Paulo “temc”e fica “perplexo” (v. 11,20) ao ver os gálatas fracassarem nesse sentido.

A idolatria d a religião b íb lica

Muitos cristãos da Galácia tinham adorado nos templos dedicados à adoração de ídolos e adotado o estilo de vida licencioso e imoral que acompanhava essas religiões. A menos que paremos e pensemos um pouco, os versículos 8-11 parecem uma advertência aos gálatas para não voltarem ao mesmo tipo de adoração de ídolos pagãos. Afinal de contas, antes de conhecerem a Deus, eles costumavam “servir aos que por natureza não são deuses” (v. 8). Agora, Paulo diz: “como podeis voltar para esses princípios elementares [...] aos quais de novo quereis servir?”(v. 9).

Então nos lembramos de que todo o propósito de Gálatas consiste na advertência de não adotar um legalismo bíblico. Os

G álatas 4.8-20

falsos mestres não estavam encorajando os cristãos gentios a ignorar a lei de Deus, como faziam em seus dias de pagãos. Antes, eles os estimulavam a adotar toda a lei mosaica do Antigo Testamento, a fim de serem justificados e agradarem a Deus (2.14-16).

Em vista disso, Paulo está dizendo que fazer por merecer a própria salvação por meio da moralidade bíblica meticulosa e da religião é escravidão a ídolos tanto quanto o paganismo declarado e todas as suas práticas imorais! No fim, o religioso está tão perdido e escravizado quanto o ateu. Por quê? Ambos tentam ser seu próprio salvador e senhor, mas de maneiras diferentes. Ambos se baseiam nos “princípios elementares do mundo” (v. 3) — stoichea tou cosmou, os “princípios” do versículo 9, que Paulo qualifica como “fracos e pobres”.

O que a expressão significa? Com frequência essas palavras em grego antigo se referiam aos elementos do mundo material e visível que compõem a natureza: fogo, água, ar e terra. Também costumavam aludir à crença pagã de que forças

O religioso está tõo perdido quanto o ateu.

espirituais ou deuses estavam por trás desses elementos, através dos quais controlavam a vida e o destino das pessoas. Esses seres precisavam ser adorados e apaziguados. Por isso os agricultores sacrificavam a um deus do tempo, os amantes ao deus da beleza física, e assim por diante.

Em lCoríntios 8.4 e 10.19, Paulo declara com coragem que não há nenhum deus, a não ser o Deus verdadeiro. Zeus, Apoio e Poseidon não existem. Contudo, logo em seguida ele acrescenta: “Antes digo que as coisas que eles sacrificam, sacrificam-nas a demônios” (ICo 10.20). E adverte os gálatas de que correm o risco de voltar a ser escravizados por essas coisas que “por natureza não são deuses” (G1 4.8). Por quê? Porque, embora os “deuses” não existam como tal, podemos nos tornar

G álatas 4.8-20

sujeitos à escravização pelas forças espirituais malignas se adorarmos qualquer outra coisa que não Jesus Cristo.

O princípio básico do mundo é que precisamos nos salvar. Adoraremos o que considerarmos necessário para nos realizar, para nos dar “vida”. Paulo, no entanto, está dizendo que qualquer “coisa” básica — dinheiro, sexo, montanhas e assim por diante — podem ser adorados, tratados como deuses e tornar-se a base de nossa religião. E que seremos escravizados por seja lá o que for que adoremos.

Por exemplo, se depositarmos nossa maior esperança em adquirir riquezas, seremos controlados e escravizados. Estaremos inteiramente debaixo do poder do dinheiro. Se não conseguirmos ganhá-lo, ficaremos desolados. E, mesmo se juntarmos “o suficiente”, o sentimento será de decepção e de querer buscar mais. Se tratarmos as coisas que não são deuses como se fossem, seremos seus escravos espirituais.

Dessa forma, por que considerar o recurso à salvação pelas obras como uma escravização a falsos deuses? Temos um número infinito de diferentes maneiras dentre as quais escolher para merecermos nossa salvação através das obras, mesmo se não considerarmos que a estamos adquirindo por mérito. Mas, seja qual for nossa opção — conquistas, moralidade, religião ou o serviço em prol de nossa família —, ela será convertida por nós em um salvador, portanto, um “deus”. A justiça pelas obras sempre cria ídolos; acontece, porém, que os falsos salvadores por ela zidos — a frequência à igreja, o ministério em benefício do próximo, a leitura da Bíblia — são coisas que, via de regra, não pensaríamos como ídolos.

Sem o evangelho, só podem os estar debaixo da escravidão a um ídolo.

Precisamos sentir a força da ênfase de Paulo na “escravização”. Se alguma coisa que não seja Jesus for requisito para se

G álatas 4.8-20

sentir feliz ou digno, isso se converterá em nosso feitor. Sem o evangelho, só podemos estar debaixo da escravidão a um ídolo.

O exemplo perfeito disso é o relato de Jesus em Lucas 15 sobre dois irmãos. Certo pai tinha um filho imoral, mais novo, pródigo, e um filho mais velho muito correto. Ambos desejavam não o pai, mas o controle da sua riqueza. Ambos viviam ind iferen tes ao coração do pai. No fim da história, contudo, o filho imoral se arrepende e vai ao encontro do pai, enquanto o correto permanece do lado de fora, com raiva.

A bem da verdade, a idolatria e a escravidão da religião são mais perigosas do que as da irreligião, ainda que menos óbvias. A pessoa irreligiosa sabe que está distante de Deus, mas a religiosa, não.

Por isso, Paulo “teme” pelos gálatas. Eles estavam adotando a guarda de “dias, meses, tempos e anos” (v. 10) — estavam observando religiosamente (no sentido literal da palavra) todas as festividades e cerimônias do Antigo Testamento. E essa nova escravidão a “não deuses” seria pior do que a antiga. Não saberíam que estavam distantes do Pai.

A certeza d e ser “co n h ecid o ”

É fácil deixar passar despercebido, mas Paulo indica aos gálatas, no versículo 9, o retorno a uma relação sadia com o Pai. Ele faz uma comparação entre ser escravo de um ídolo/ deus impessoal e inexistente (v. 8) e conhecer relacionaimente o verdadeiro Deus. Mas, em seguida, parece se corrigir: “agora, porém, que já conheceis a Deus, ou melhor, sendo conhecidos por ele” (v. 9).

Paulo não está dizendo que os gálatas não conhecem a Deus. Todo o mundo que tem a vida eterna conhece a Deus (Jo 17.3), e o apóstolo não questiona se haviam sido revestidos de Cristo (G1 3.27). A expressão “ou melhor” significa “mais importante que isso”. Paulo está dizendo: Como vocês podem

G álatas 4.8-20

voltar para os ídolos se já conhecem a Deus e, mais importante que isso, são conhecidos por ele?!

O que faz de alguém um cristão não é tanto o fato de conhecer a Deus, mas de ser conhecido por ele. “Conhecer” na Bíblia significa mais do que a ciência intelectual. Conhecer alguém é estabelecer relacionamento pessoal com a pessoa. Portanto, diz Paulo, não é tanto seu afeto e amor por Deus, mas, sim, 0 afeto e amor dele por você que faz de você um cristão. Em ICoríntios 8.3, ele afirma que qualquer um que ame a Deus o faz porque Deus o conhece. Ou seja, Deus derramou seu amor sobre nós em Jesus. O conhecimento que temos de Deus aumenta e diminui de acordo com várias coisas. Mas o conhecimento que Deus tem de nós é absolutamente determinado e sólido.

Por que isso serve de antídoto para a idolatria? Porque, como diz Richard Lovelace:

Cristãos que não têm mais certeza de serem amados e aceitos por Deus em Jesus, independentemente de suas realizações espirituais presentes, são pessoas de uma insegurança subconsciente radical, mais do que os não cristãos, devido aos informes constantes que recebem de seu ambiente cristão acerca da santidade de Deus e da justiça que se espera deles próprios. Sua insegurança se traduz em orgulho e em duas atitudes defensivas: a feroz afirmação da própria retidão e a censura dos outros. Agarram-se desesperados à justiça legal, farisaica, mas de sua insegurança básica brotam a inveja, o ciúme e outros [...] pecados.1

Ou seja, nossa insegurança quanto a sermos ou não aceitos por Deus é a razão pela qual fabricamos ídolos. Olhamos para o conhecimento que temos dele (muito variável), e não para o

'Dynamics o f spiritual life (Downers Grove: IVP, 1979), p. 211-2.

G álatas 4.8-20

conhecim ento que ele tem de nós em Cristo. A flitos, tentam os consolidar uma autoim agem positiva com o uso de nossos ido- los. Paulo lembra que o evangelho mostra que não precisamos nos fazer belos ou dignos de sermos amados para Deus; ele já nos conhece. Se é assim, não precisamos criar um ídolo a partir da aprovação alheia ou m esm o de nossa própria aprovação.

A declaração clássica do que

acabo de dizer encontra-se em ICoríntios 4.3,4. Nesse texto, Paulo não só afirma que não se importa com a avaliação dos outros a respeito de sua pessoa, como tampouco se interessa por sua própria avaliação de si mesmo. Antes, tudo que conta é a avaliação que Deus faz dele, ou seu julgamento.

O evangelho mostra que não precisamos nos fazer belos ou dignos de sermos am ados para Deus.

A carta aos gálatas inteira tem a ver com o fato de que, em Jesus Cristo, o juízo de Deus é de que estamos justificados; somos considerados por Deus complctamentc perfeitos e justos. Assim, quando colocamos Gálatas ao lado de ICoríntios 4, vemos que a visão de Paulo de si mesmo consiste em dizer: Como Deus me conhece e vê Cristo quando olha para mim, não me importo com 0 que você pensa a meu respeito, nem mesmo com 0 que eu penso.

O grande fundamento da certeza cristã não é quanto do nosso coração está voltado para Deus, mas quão inabalável é o coração dele voltado para nós. Se começarmos a entender que somos “conhecidos por Deus”, não buscaremos amparar nossa autoimagem em nossas obras, nem comparecermos diante dele baseados nelas. Não adoraremos nenhum ídolo — amaremos a Deus, àquele que nos conhece.

Como nos apropriamos dessa verdade? Hudson Taylor, missionário do século 19 na China, tinha um pedaço de papel que ele mudava de lugar todos os dias em sua agenda, de modo

G álatas 4.8-20

que, quaisquer que fossem os seus demais compromissos para aquele dia, sempre lesse isso:

Senhor Jesus, faça-se para mim uma realidade viva.

Mais presente para a aguçada visão da fé do que parecem meus objetos exteriores.

Mais querido, mais intimamente próximo até do que o mais doce laço terreno.

Se conhecemos Jesus e sabemos que ele nos conhece, desfrutaremos dele e empurraremos para longe os ídolos controladores.

para reflexão Perguntas

1. Que ídolos você corre risco maior de servir?

2. Como o fato de Deus conhecer você o tranquiliza hoje?

3. Até que ponto lembrar que Deus conhece você o livra da tentação de adorar ídolos?

SEGUNDA PARTE

O m inistério do evan gelh o

Paulo foi um homem que se entregou ao ministério. Embora os dois primeiros capítulos autobiográficos da carta que escreveu aos gálatas se refiram a um período anterior a sua ida à Galácia, em 4.12-20 temos uma ideia de como ele plantou uma igreja naquele lugar. Ao tratar desse assunto, Paulo se volta para o passado, para o tempo em que seu ministério do evangelho florescia na Galácia e o relacionamento entre ele e os jovens cristãos dali era sadio. Ou seja, há muita coisa aqui para aprendermos sobre o ministério do evangelho e os relacionamentos no cenário em que nos encontramos hoje.

G álatas 4.8-20

Primeiro, o ministério do evangelho é culturalmenteflexível·. “me tornei como vós” (v. 12). O ministério impulsionado pelo evangelho é flexível e adaptável em relação a tudo, desde que o evangelho seja preservado. Ele não se deixa prender por particularidades culturais e de costumes. Seus Líderes podem chegar e viver de verdade entre o povo que estão buscando alcançar, adotando seus costumes e amando-os.

Uma das marcas registradas da mentalidade legalista, seguidora da justificação pelas obras, é sua inflexibilidade e obsessão pelos detalhes. Alguém assim M deseja que os convertidos se vistam e ajam “exatamente como nós”. Paulo, por outro lado, é o modelo de alguém que se aproxima de verdade e entra na vida daqueles a quem procura alcançar, como Cristo fez em sua encarnação. Paulo não só os conhecia pessoalmente como viveu com eles, comeu com eles, brincou com eles, conversou e caminhou com eles. Aprendeu a conhecer-lhes o mundo e a viver nele de forma a apreciá-lo, mesmo não sendo o seu mundo. Entrou tanto quanto pôde nos questionamentos e problemas daquelas pessoas, em suas esperanças, receios e sensibilidades, c adaptou vida, discurso e mensagem a elas, sem, é claro, alterar o evangelho em si.

O ministério impulsionado pelo evangelho é flexível e adaptável em relação a tudo. desde que o evangelho seja preservado.

Segundo, o ministério do evangelho é transparente: “que vos torneis como eu” (v. 12). Paulo era tão aberto acerca de seu próprio coração c tão coerente em sua vida, que conseguia convidar os gálatas a imitá-lo.

Nossas palavras não são suficientes (e talvez nem sejam o mais importante) para convencer os outros sobre a verdade de Cristo. As pessoas têm de olhar dentro do nosso coração e vida,

G álatas 4.8-20

avaliar como lidamos com os problemas, com a decepção e as interrupções, como conduzimos nossos relacionamentos, como nos sentimos e agimos, de modo a conseguir ver se Cristo é real e de que maneira o evangelho afeta o dia a dia de uma vida humana. Via de regra, encontramos fé principalmente por meio de relacionamentos com cristãos alegres, imperfeitos, mas sinceros, não por meio de argumentos, informações e livros.

Isso não é arrogância. Se Paulo tivesse dito: “Sejam como eu” sem se tornar “como eles”, esse seria um indício de orgulho. Mas ele não os está exortando a serem corretos, mas, sim, alegres como ele é.

Terceiro, o ministério do evangelho procura oportunidades na adversidade. Problemas se transformam em possibilidades.

“Foi por causa de uma enfermidade física”, ele lembra os gálatas, “que vos anunciei o evangelho pela primeira vez” (v. 13). Isso deve significar, é bem provável, que ele esteve na Galácia ou em razão de um desvio do itinerário traçado ou de um atraso na agenda. De um jeito ou de outro, ele não planejava pregar-lhes o evangelho. Mas a enfermidade fez com que isso acontecesse.

O ministério do evangelho procura oportunidades na adversidade.

D eus e o sofrim ento

Aqui cabe uma pequena digressão, pois estamos sendo confrontados com uma das partes mais desafiadoras e perturbadoras do ensino cristão: que Deus admite o sofrimento e as dificuldades do mundo na vida dos cristãos. Romanos 8.28 faz questão de dizer que “Deus faz com que todas as coisas [agradáveis e dolorosas] concorram para o bem daqueles que o amam”. Neste caso, centenas de vidas foram transformadas porque Deus permitiu que uma dolorosa enfermidade se

G álatas 4.8-20

abatesse sobre Paulo. Aqui também temos um exemplo de como Deus frustrou planos bem traçados a fim de proporãonar um bem enorme, embora em meio a sofrimento.

Deus não promete abençoar os cristãos afastando o sofrimento, mas através do sofrimento. Jesus sofreu não para que pudéssemos não sofrer, mas para que em nosso sofrimento nos tornássemos como ele. Deus usa o sofrimento para promover o bem. Às vezes isso envolve circunstâncias — a enfermidade de Paulo lhe trouxe muitos novos amigos e um ministério bem-sucedido na Galácia —, outras vezes o “bem” que Deus opera é em nosso caráter.

Em 2Coríntios 12.7-10, Paulo fala sobre um grande, anônimo e doloroso “espinho” que Deus não removeria, apesar de suas repetidas orações. Mas ele diz que o “espinho” tinha o bem como intuito, porque o mantivera humilde (v. 7: “para que eu não me tomasse arrogante”) e o fortalecera (v. 9: “a fim de que o poder de Cristo repouse sobre mim”). A dor implacável e o senso de fraqueza (qualquer que seja a causa) levaram Paulo à dependência mais profunda e à visão da suficiência da graça (v. 9: “a minha graça te é suficiente”).

Deus não promete abençoar os cristãos afastando o sofrimento, mas através do sofrimento.

Esse também é um excelente lembrete de que o ministério não acontece em estrita conformidade com o plano humano. Paulo não incluira a Galácia em suas sessões de planejamento estratégico, mas Deus o conduzira até ali. Ora, não podemos deduzir desse texto que o planejamento estratégico é errado; Paulo não se arrependeu nem parou de traçar planos para as suas viagens missionárias! Vemos, por exemplo, que ele continuou a ter como alvo, para alcançar uma região, a maior cidade de cada uma delas.

G álatas 4.8-20

Devemos usar nossa sabedoria para fazer planos. Temos de ser mordomos de nosso tempo e recursos e planejar usá-los de tal forma que pareçam produzir os melhores frutos. Mas o trecho em análise ensina que devemos ser bem descontraídos e deixar Deus editar nossos planos à vontade. Quando iniciamos um estudo bíblico visando a determinadas pessoas, é possível que encontremos um grupo completamente diferente sendo alcançado. Ao divulgar um evento, podemos acabar descobrindo que a maioria das pessoas cujas vidas foram transformadas veio por alguma estranha coincidência ou por influência de uma conversa casual muito remota com um estranho, e assim por diante.

A maioria de nós é capaz de apresentar ilustrações pessoais de como Deus operou em nossa vida ou na vida de outros ao nosso redor por meio de erros, “desastres”, problemas e planos frustrados, com frequência muito mais do que por meio de nossos atos e metas deliberados.

Um Inim igo?

Os gálatas haviam recebido Paulo com grande afeto. Teria sido muito fácil tratá-lo com desprezo e rejeição, talvez porque sua enfermidade o desfigurasse. Em vez disso, eles o acolheram “como se eu fosse um anjo de Deus, como o próprio Cristo Jesus” (v. 14). Mas agora temos uma grande reviravolta. A alegria e satisfação que costumavam sentir por ele se fora: “Onde está aquela vossa alegria?” (v. 15). Os gálatas começavam a enxergar em Paulo um agente hostil. Quando ele diz “Será que me tornei vosso inimigo?”(v. 16), insinua que eles estavam começando a tratá-lo como um adversário. Aconteceram hostilidades devido às doutrinas da fé e das boas obras apresentadas na carta. Como Paulo lhes dissera “a verdade”, a amizade deles esfriara drasticamente.

Por que Paulo inclui os versículos 12-16? Para lhes mostrar que, embora não tivesse alterado sua mensagem ou ministério, a reação da igreja para com ele mudara —já que agora eles estavam

G álatas 4.8-20

sob a influência de ministros que tinham uma mensagem muito diferente da dele, por terem objetivos e recursos muito diferentes.

Dois objetivos d e dois m inistérios

O objetivo dos falsos mestres é “para que mostreis interesse pessoal por eles” (v. 17). A NV1 traz “a fim de que vocês também mostrem zelo por eles”, deixando também de fora algumas nuances da oração de Paulo. A expressão “zelo por eles” tenta expressar uma palavra que, no sentido literal, significa “desenvolver” ou “inchar”. Ela é mais bem traduzida como: Eles são lisonjeiros e os tratam como se vocês tivessem grande importância, para que assim os lisonjeiem e tratem como se tivessem também grande importância.

Um ministério impelido pelo evangelho não precisa ter fãs emocionalmentc dependentes dos líderes. Busca agradar a Deus, confiante na salvação pela fé. Os falsos mestres, por sua vez, estão ministrando não porque tenham certeza da salvação, mas a fim de se certificarem da própria salvação e conquistá-la. Assim como convidam os gálatas a fazer por merecer sua salvação através de obras, também estão fazendo por merecer a própria salvação através de obras — a salvação pelo ministério.

Isso quer dizer que precisam, no nível das emoções, ter quem precise deles emocionalmente. Necessitam que seus convertidos e discípulos vivam envolvidos por todos os lados com seus lideres, obedecendo-lhes e adorando-os. Só isso lhes pode assegurar que são crentes bons e grandiosos, abençoados de fato e favorecidos por Deus.

Os íalsos mestres precisam ter quem precise deles.

Esse objetivo afeta os recursos que usam. Querem “que vocês também mostrem zelo por eles” (v. 17). Isso é o mesmo que dizer: Eles falam 0 que vocês querem ouvir; fazem cócegas em seus ouvidos, patrocinando a satisfação dos desejos escusos que vocês

G aiatas 4.8-20

acalentam, a fim de conquistar sua lealdade. Não há nada errado com o zelo em si; o que determina se ele é bom ou ruim é se há “boas intenções”. Os falsos mestres querem ser edificados pela edificação dos gálatas — não no evangelho, mas no orgulho e na justiça própria.

Em contraste, o objetivo de Paulo está no versículo 19: ele se sente agoniado “até que Cristo seja formado em vós”. Isso é bastante crítico. Apesar do apelo de Paulo no versículo 12 para que “vos torneis como eu”, ele só está sendo um exemplo para os gálatas, a fim de que sejam transformados à imagem de Cristo. Paulo não diz “como eu”, mas “vos torneis como eu”. Não está tentando arrebanhar fãs, mas conseguir pessoas que sigam Cristo como ele. Não quer que as pessoas se tornem dependentes dele, mas de Cristo.

Por isso, Paulo usa a imagem do trabalho aqui. Como uma mãe, ele trabalha com “dores de parto” por seus discípulos. A mãe em trabalho de parto fica desesperada para que seu filho saia e viva sua independência! O filho se desenvolve dentro da mãe. A mãe deve sofrer a fim de dar vida ao filho, mas isso não significa que ela queira que o filho permaneça em seu ventre. Trata-se de uma imagem extraordinária do ministério sadio, fundamentado no evangelho.

Os falsos mestres desejam seguidores que os glorifiquem; Paulo quer parceiros que glorifiquem a Deus. E isso direciona os meios ao seu objetivo. Diferente de seus oponentes, Paulo não diz aos gálatas o que gostariam de ouvir. Ele lhes profere “a verdade” (v. 16) e é vilipendiado por isso. Adoraria poder ser afirmativo e gentil, ter a oportunidade de “mudar o tom da minha voz” (v. 20). Mas prefere apresentar o evangelho a receber louvor. Afinal de contas, é o evangelho que leva as pessoas à dependência de Cristo, que as molda à semelhança de Cristo e lhes provoca o louvor a Cristo.

O evangelho nos liberta da necessidade da aprovação e adoração alheias, de modo que podemos confrontar e irritar

G álatas 4.8-20

as pessoas que amamos, se for o melhor para elas. Embora nem sempre funcione, esse é o único tipo de comunicação que transforma de fato as pessoas. Se você ama alguém de maneira tão egoísta que não consegue correr o risco de se expor à sua raiva, jamais lhe dirá a verdade que ela precisa ouvir.

PAULO PREFERE APRESENTAR O EVANGELHO A RECEBER LOUVOR. I

Se, por outro lado, você diz a uma pessoa a verdade que ela necessita ouvir, mas com rispidez e sem a angústia de quem ama, ela não lhe dará ouvidos.

Se, no entanto, ao falar a verdade, seu discurso é acompanhado de verdadeiro amor, há grande probabilidade de que ele penetre o coração alheio e cure. O ministério fundamentado no evangelho é marcado pela sinceridade amorosa, não pela distorção dos fatos, pela preocupação com a imagem e pela adulação.

Esse tipo de ministério do evangelho é oneroso para o ministro. Nem sempre é fácil para quem está recebendo a ministração. Mas baseia-se na verdade, aponta para Cristo e vale a pena, por toda a eternidade. Faríamos bem em imitar Paulo no modo como ministramos aos outros e no amor e gratidão que demonstramos àqueles que nos amam o suficiente para ministrar a nós como Paulo fez aos gálatas.

para reflexão Perguntas

1. O que particularmente lhe chamou mais a atenção na natureza e conduta do verdadeiro ministério do evangelho?

2. A ideia de ter pessoas dependendo de você de alguma forma já lhe foi atraente? Por quê? Você conseguiría ser motivado pelos mesmos objetivos que os dos falsos mestres?

3. Todos podemos ser ministros do evangelho a outros cristãos. Como seu ministério mudará, baseado nesta seção da Bíblia?

VERSÍCULOS 21-31 GÁLATAS ■ CAPÍTULO 4$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo mostra que o legalismo religioso é tão idolatria quanto o paganismo que os gálatas deixaram; que "regras elementares" você voltou a servir, achando que assim agrada mais a Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Ele teme estar "perplexo" ao ver que talvez tenha trabalhado em vão neles; que sinais revelam que você trocou a alegria do evangelho por uma religião pesada que não dá vida?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Os falsos mestres bajulavam os gálatas para os prender; quem ou o que tem cortejado o seu coração, prometendo aprovação em troca de mais desempenho religioso?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Graça para com a Estéril$t$, 9,
$conteudo$Esses versículos são explosivos. Concluem os temas que Paulo vem destacando desde a metade do capítulo 2. A ideia que ele defende aqui é não apenas que o evangelho converte qualquer um em filho de Deus, mas que os mais orgulhosos, corretos e religiosamente “aptos” costumam ser os que ficam de fora da família de Deus. O evangelho subverte os valores do mundo.

Quatro tipos d e p esso a s

Paulo agora se dirige a “vós, que quereis ficar debaixo da lei” (v. 21). Ele olha bem nos olhos (por assim dizer) dos gálatas cristãos que se deixaram convencer da necessidade de acrescentar o próprio desempenho ao de Cristo se quisessem ser aceitáveis a Deus.

Como vimos anteriormente (p. 45), Paulo não se refere à obediência à lei aqui. Estar “debaixo da lei” significa depender da lei para se apresentar diante de Deus. Portanto, essa é uma mensagem que desafiaria o povo religioso de modo particular; como escreveu John Stott:

Há muito disso hoje. Não são judaizantes aqueles para quem

Paulo escreve, mas pessoas cuja religião é legalista, que ima- ginam que o caminho para Deus passa pela observância de determinadas regras.1

1 The message o f Galatians,The. Bible Speaks Today (Downers Grove: Ί VP, 1968), p. 122 Lcdição em português: A mensagem de Gálatas (São Paulo: ABU, 1997)j.

G álatas 4.21-31

Ajuda bastante ver que existem quatro tipos de pessoas no mundo:

1. As que cumprem a lei e dela dependem. Essas pessoas estão debaixo da lei e costumam ser presunçosas, moralistas e superiores. Por fora, têm grande certeza de que se acertaram com Deus, mas, no fundo, experimentam grande insegurança, uma vez que ninguém pode ter plena certeza de viver à altura do padrão exigido. Isso as deixa melindrosas, sensíveis à crítica e arrasadas quando suas orações não são respondidas. Nesse tipo se incluem membros de outras religiões, mas estou pensando basicamente nas pessoas que vão à igreja. Elas têm muito em comum com os fariseus da época de Jesus. 2. As que desobedecem à lei e dela dependem. São as pessoas dotadas de uma consciência religiosa de forte justificação pelas obras, mas que não vivem de maneira coerente com isso. Por conseguinte, são mais humildes e tolerantes com os outros do que os “fariseus” anteriores, embora também sejam sempre assoladas pela culpa, sujeitas a oscilações de humor e às vezes bastante receosas de assuntos religiosos. Algumas podem ir à igreja, mas permanecem sempre na periferia devido a sua baixa autoestima. 3. As que desobedecem à lei e dela não dependem. São as que descartaram o conceito de lei de Deus. São intelectualmente seculares ou rf.lativistas, ou têm uma espiritualidade muito vaga. Escolhem a maior parte dos próprios padrões morais e depois insistem em afirmar que os cumprem. Mas Paulo, em Romanos 1.18-20, diz que, no nível do subconsciente, elas sabem que existe um Deus a quem deveríam obedecer. Tais pessoas costumam ser mais felizes e tolerantes do que as de qualquer um dos grupos anteriores. No entanto, entre elas há sempre um forte sentimento de justiça própria liberal. Fazem por merecer a própria salvação

G álatas 4.21-31

sentindo-se superiores aos outros. Esse é só um tipo menos óbvio de justiça própria. 4. As que obedecem à lei e dela não dependem. Há cristãos que compreendem o evangelho e vivem da liberdade que ele proporciona. Obedecem à lei de Deus pela grata alegria resultante do conhecimento de sua condição de filhos e da liberdade do medo e do egoísmo que os falsos ídolos haviam gerado. São mais tolerantes do que as pessoas do tipo 3, mais solidários do que as do tipo 1 e mais confiantes que as do tipo 2. Todavia, a maioria dos cristãos lutam para ser praticantes do tipo 4 e tendem a ver o mundo como alguém dos tipos 1, 2 ou mesmo 3. Na proporção em que fazem isso, são espiritualmente pobres.

D ebaixo d a lei? O uçam a lei!

A questão no versículo 21 se propõe a mostrar aos que nela confiam que essa posição destrói a si própria. Eles querem ficar debaixo da lei, sob a qual, se lhe dessem ouvidos (v. 21), não haveríam de querer estar! Paulo declara: A mesma lei que vocês dizem que seguem os contradiz.

A palavra “lei” costumava ser usada como referência ao Antigo Testamento de modo geral; era o registro da vontade de Deus. Paulo recorre à história de Agar e Sara, que devia ter sido citada também pelos falsos mestres ao dizerem para os gálatas: Vocês não são filhos de Abraão de verdade, a menos que obedeçam a toda a lei de Moisés.

Paulo vira o jogo contra eles lembrando-os de que “Abraão teve dois filhos, um da escrava, outro da livre” (v. 22). Portanto, há duas maneiras de ser parente de Abraão, uma certa e a outra errada.

É um argumento brilhante. A questão básica dos falsos mestres era: Sim, é bom que vocês creiam em Cristo, mas terão de obedecer à lei inteira para que possam ser considerados filhos de

G álatas 4.21-31

Abraão. A ideia básica defendida por Paulo é: No momento em que creram em Cristo, vocêsforam filhos de Abraão, herdeiros de todas as promessas de Deus! E no momento em que começam a se considerar obrigados a obedecer à lei inteira, não são filhos de Abraão de jeito nenhum!

A prendendo com Agar

Abraão teve dois filhos, Ismael e Isaquc, de duas mulheres diferentes. Eles nasceram em circunstâncias muito diversas, informação crucial para entender a tese que Paulo está defendendo.

Deus prometera fornecer um herdeiro a Abraão que viveria na terra que ele lhe havería de mostrar (Gn 12.1-4; 15.4,5). Acontece que Abraão estava velho, sua mulher, Sara, era estéril, e ele vivera nessa terra mais de uma década sem filhos. Por isso, Sara sugeriu que o marido dormisse com a serva dela, Agar, para que pudessem “ter filhos por meio dela” (Gn 16.1,2). Abraão concordou, Agar concebeu (v. 4) e Ismael nasceu (v. 15).

Passados 14 anos, quando Abraão já contava cem anos, teve outro filho, dessa vez da esposa estéril. “O Senhor [...] fez-lhe como havia prometido. Sara engravidou e deu um filho a Abraão em sua velhice. [...] Abraão pôs o nome de Isaque no filho que lhe nasceu, que Sara lhe tinha dado” (Gn 21.1-3 — observe a repetição feita pelo narrador do nome “Sara”; ele quer deixar muito claro para o leitor que Isaque é o filho de Sara, a mulher estéril, sem filhos!). Paulo resume as diferenças entre os dois nascimentos ao afirmar: “O que era filho da escrava nasceu de modo natural, mas o que era da livre, mediante uma promessa” (G1 4.23).

Abraão tinha consciência de que teria um filho que seria seu herdeiro e perpetuador da linhagem responsável por trazer a salvação ao mundo. Mas como esse filho haveria de nascer? Sara era estéril e muito velha; seria necessário um ato extraordinário, sobrenatural, de Deus para um filho chegar dessa forma.

G álatas 4.21-31

No entanto, a serva Agar era jovem e fértil. Pelos costumes da época, seria perfeitamente legal ter um filho por seu intermédio (mesmo que não estivesse de acordo com a vontade de Deus; veja Gn 2.24).

Abraão resolveu não contar com os atos sobrenaturais de Deus para conseguir seu filho. Em vez disso, decidiu tê-lo mediante realização humana, por meio do que eram capazes tanto ele quanto Agar.

A Inversão controversa

Os judeus sabiam que eram filhos de Abraão, descendentes dele por meio de Isaque e herdeiros das promessas de Deus. Seus antepassados tinham recebido a lei de Deus no monte Sinai; sua nação girava em torno de Jerusalém e do templo.

Os falsos mestres andavam dizendo aos cristãos gálatas gentios que, para serem verdadeiros filhos de Abraão, herdeiros das promessas, eles precisavam tornar-se judeus.

As palavras de Paulo nos versículos 24,25 são incendiárias! Observe a que ele associa Agar: “Essas mulheres simbolizam duas alianças. Uma é a aliança do monte Sinai, que dá à luz filhos para a escravidão: esta é Agar. Agar representa o monte Sinai, na Arábia, e corresponde à Jerusalém atual, pois é escrava com seus filhos”.

Paulo afirma com muita clareza que Agar e seu filho, Ismael, representam a aliança da lei do Sinai e a cidade terrena de Jerusalém, a qual, em termos genéricos, consiste de pessoas que não aceitaram Cristo. Essas pessoas encontram-se em escravidão (v. 25), pois estão debaixo da lei. Paulo estabelece ligação entre várias coisas ao mesmo tempo: a aliança do Sinai ou da lei; a presente Jerusalém; Agar; e todos que fazem da lei o meio de justificação perante Deus e o princípio essencial da vida.

Essa tem sido a ideia defendida por Paulo ao longo dos capítulos 3 e 4. No entanto, de maneira brilhante e com grande

G álatas 4.21-31

dramaticidade, ele volta a apresentá-la agora por meio de um elo surpreendente com Agar e Sara. Estudaremos isso logo mais à frente. Paulo desejava que quem estava dando ouvidos aos falsos mestres sentisse a plena força de sua percepção de que Agar, não Sara, “corresponde à Jerusalém atual” (v. 25).

Dormindo com Agar, Abraão escolhera se fiar em suas próprias capacidades. Optara por “trabalhar” e ganhar seu filho. Agira por fé, mas a fé que depositava em si mesmo, como seu próprio salvador .

O resultado imediato foi desastroso! Sara encheu-se de um ciúme terrível de Agar e a família foi arruinada por divisão e tristeza (Gn 16.4-14; 21.8-21). Isso não surpreende,

Dormindo com Agar, Abraão agira por fé, mas a fé que depositava em si mesmo.

uma vez que a Bíblia invariavelmente condena a poligamia e o costume de ter concubinas. Como vemos aqui, Deus (mesmo tendo cuidado de Agar c Ismael, cf. 16.7-12; 21.17,18) nunca encaminhou suas promessas através desse filho de Abraão: a proposta de autossalvação de Abraão fracassou.

No decorrer da história, brigas e guerras entre os descendentes de Isaque e Ismael se sucederam. Por tradição, Ismael é o pai dos povos árabes; por isso, Paulo se refere ao “monte Sinai na Arábia” (v. 25): pessoas que se fiam na lei (“monte Sinai”), que estão fora do povo de Deus (“Arábia”). Isaque foi o pai dos judeus.

Abraão não dependeu da graça de Deus proveniente de sua ação sobrenatural na história, mas confiou na própria capacidade. Quando não descansamos em Deus e, em vez disso, buscamos fazer o papel de nosso próprio salvador, o resultado é destruição e desintegração — espiritual, psicológica e relacionai.

Embora os falsos mestres se considerassem, com orgulho, descendentes de Abraão por meio de Sara e Isaque, Paulo

G aiatas 4.21-31

afirma que, espiritualmente, descendiam da escrava, dos gentios, dos proscritos. O coração deles e a maneira como abordam Deus são comparáveis a Abraão com Agar, e o fruto de suas vidas, a Ismael — só mais escravidão! Apesar da consanguinidade com Sara, na alma e no coração eles são como o povo que desprezam.

F1am-se na própria capacidade, em vez de na graça sobrenatural de Deus. As pessoas mais religiosas podem ser as mais distantes da liberdade.

para reflexão Perguntas

1. Olhe para o seu passado e analise sua vida espiritual em termos das quatro categorias das páginas 122-24. 2. Abraão resolveu depender só de si mesmo para converter as promessas de Deus em realidade. Você já fez algo semelhante? Quais foram os resultados? 3. Quando você viu Deus fazer o que parecia impossível em sua própria vida ou na vida de pessoas a sua volta?

SEGUNDA PARTE

Uma a leg o ria do evan gelh o

Paulo usa a história de Abraão, Agar c Sara apenas como uma alegoria. Algumas pessoas ficam incomodadas por Agar (na história real, uma vítima inocente) representar algo negativo em Gálatas 4, ao passo que Sara (na história real, uma colaboradora incrédula de Abraão) representa algo positivo. Precisamos nos lembrar, contudo, que o próprio Paulo ressalta: “isso é uma alegoria” (v. 24). Em outras palavras, embora devamos ler o relato como uma história verídica e com ele aprender lições teológicas e morais, não é o que Paulo está fazendo aqui. Ele considera essa história uma ilustração muito boa e simbólica da graça e das obras. Não que tenha deixado de considerá-la um fato histórico. Apenas quer usá-la como ilustração

G álatas 4.21-31

de uma verdade bíblica. Como vimos, quer usá-la para virar o jogo contra seus oponentes.

Nesse sentido restrito, figurado, o filho de Agar representa a busca da salvação pelas obras, e Sara, a dependência da salvação pela graça divina.

De fato, trata-se de uma analogia interessante. Evangelho é não tentar alcançar uma justiça que nossas capacidades podem desenvolver. Antes, devemos receber a justificação por meio de atos sobrenaturais de Deus na história — o nascimento miraculoso de Cristo, sua morte que levou consigo o pecado e sua ressurreição que venceu a morte. Precisamos depender de Deus — como Abraão acabou aprendendo que precisava da obra milagrosa de Deus para lhe prover um filho e herdeiro. Assim como Abraão teve de mudar o foco de sua fé — tirando-o do esforço próprio e colocando-o na obra sobrenatural de Deus—, os cristãos gálatas precisavam voltar os olhos para a obra de Cristo, desviando-os dos esforços próprios no sentido de guardar a lei.

Portanto, Sara, a mulher “livre”, cujo filho “nasceu [...] mediante uma promessa” (v. 23), nada tem a ver com a Jerusalém terrena, que rejeitou

Os gálatas precisavam voltar os olhos para a obra de Cristo, desviando-os dos esforços próprios.

a graça, mas com “a Jerusalém do alto [que] é livre”. No sen- tido em que simboliza aqueles que aprenderam a abrir mão das tentativas de alcançar a salvação e a deixar que Deus os salve, ela “é a nossa mãe” (v. 26). A “cidade-mãe” era o lugar onde o indivíduo se sentia em casa, um cidadão, com direitos.

Portanto, Sara = céu = mãe dos cristãos. O céu, neste exato momento, é nosso lar, ao qual pertencem os cristãos.

O evangelho: g raça para com a estéril

Paulo agora demonstra que o evangelho da “graça para com a estéril” não surge apenas de sua proposta de leitura figurada

G álatas 4.21-31

da história de Agar e Sara; trata-se do evangelho que permeia as Escrituras do Antigo Testamento. Por isso, ele cita Isaías 54.1 no versículo 27: “Os filhos da abandonada são mais numerosos do que os da que tem marido”.

No contexto original, essa palavra profética fora dirigida aos exilados judeus na Babilônia, por volta de 1200 anos após a cpoca de Abraão e 600 anos antes da de Paulo. Os israelitas remanescentes achavam que sua vida como nação chegara ao fim, que jamais voltariam para casa nem teriam um país próprio outra vez. Pareciam fracassados, frágeis e impotentes (o Exílio era um castigo), enquanto outras nações pareciam fortes e hábeis. Mas Deus lhes diz por intermédio de Isaías: Agora que vocês estão impotentes, verão que é na vida dos fracos que minha graça opera! O forte vive ocupado demais confiando em si mesmo. Tornarei vocês numerosos e grandes.

A profecia de Isaías se reporta a Gênesis 16, quando Deus olha para duas mulheres, uma bela e fértil, a outra estéril e velha, e escolhe salvar o mundo através da estéril.

Por intermédio da família dessa mulher chegaria outro filho improvável, nascido de outra mulher sem expectativa nenhuma de engravidar. Não porque fosse estéril, mas porque era virgem. Através desse Filho, todos os povos do mundo seriam abençoados, como Deus prometera a Abraão e Sara. Assim opera a graça de Deus.

Agora Paulo toma a mesma história que Isaías usou e lhe dá uma aplicação ainda mais completa e maravilhosa. Os gálatas estão sendo “massacrados”, falando no sentido espiritual, pelos falsos mestres. Todos lhes dizem que estão contaminados demais e que se equivocam considerando-se filhos amados de Deus a partir do momento em que creram. No entanto, Paulo vira o jogo e consola os gálatas de maneira poderosa. Eles são a “mulher estéril”. Se a salvação é pelas obras, então só a “fértil” pode ter “filhos”; só os moralmente aptos e fortes, as pessoas de

G aiatas 4.21-31

boa família, os que têm uma ficha limpa têm condições de ser espiritualmente frutíferos, usufruir do amor e alegria de Deus e transformar a vida de outros.

Se o evangelho é verdadeiro, não importa quem você é ou foi. Você pode ser um pária espiritual e moral, tão à margem de tudo quanto a mulher solteira e estéril na antiguidade. Não interessa. Você dará fruto, do tipo que permanece. O evangelho diz: Graça não é só para as férteis como Agar, mas para as Saras estéreis. Se existe futuro para Sara, existe para qualquer um!

Na verdade, a questão é ainda mais profunda, pois Paulo está dizendo que o evangelho da graça é, em especial, para a estéril. A capaz e a “fértil” acham que podem conseguir sem Deus, razão pela qual rejeitam o evangelho da graça. Paulo assevera o que Jesus fala na parábola dos dois irmãos, o pródigo e o mais velho, em Lucas 15. O evangelho nos mostra que o “forte”, moral, bom, religioso e dono da verdade, no fim das contas, é o escravo.

Se o evangelho é verdadeiro, nâo importa quem você é ou foi.

O ev an g elh o para fracassad os e d esilu d id os

Sara é um enorme encorajamento para quem se vê como um fracassado. Na época em que ela viveu, o valor de uma mulher consistia quase só em sua capacidade de gerar filhos. Claro, a Bíblia não era conivente com isso. Na verdade, essa passagem destrói por completo o terrível erro cometido por tantas sociedades. Culturas da antiguidade diziam à mulher que seu valor e “justiça” estavam em sua capacidade de produzir filhos e que, se não pudesse tê-los, sua vida era inútil para a tribo. (Até certo ponto, inclusive em nossa sociedade, mulheres solteiras ou sem filhos muitas vezes se sentem bastante estigmatizadas e inúteis, alvo da sugestão sem palavras de que fracassaram de alguma forma.)

G álatas 4.2131־

Todavia, a Bíblia nos mostra aqui que não deveriamos fazer dos filhos nossa vida e valorização, tanto quanto acontece com a carreira profissional, o dinheiro, o poder ou a aprovação social. O evangelho proclama que quem tem mais descobrirá a ruína de suas falsas estratégias de valor próprio — e que a estéril, o pobre, o marginal podem ser mais frutíferos, ricos e poderosos que todos os demais. Têm a chance de produzir grande fruto, se começarem a viver o evangelho e servir aos outros.

O pastor de uma igreja no Harlem, cujos membros, em sua maioria, são negros, uma vez me contou que sua congregação foi fundada mais de 80 anos atrás por uma senhora alemã moradora de Manhattan. Ela era uma cristã dedicada e, por meio do seu estudo bíblico, duas mulheres afro-america-

Quem tem mais descobrirá a ruína de suas íalsas estratégias de valor próprio.

nas do Harlem se entregaram a Cristo. Elas então lhe pediram para começar um ministério no Harlem com o intuito de alcan­ çar seus amigos.

Na época, a senhora alemã estava comprometida, e seu noivo era bastante contrário à sua dedicação a tal ministério. Ameaçou cancelar o casamento, se ela continuasse com aquilo. Enquanto ela se torturava entre o chamado que sentia da parte de Deus e o desejo de se casar, deparou com Isaías 54.1: “A desamparada tem mais filhos do que a casada”. Assim, seguiu o chamado de Deus, ficou sem o noivo e a nova igreja nasceu, hoje conhecida como Bethel Gospel. Ela teve e tem muito mais filhos espirituais do que quaisquer filhos físicos que seu casamento perdido teria gerado. Esse é só um exemplo do princípio.

A religião e a filosofia como um todo dizem que Deus e a salvação estão restritos apenas a quem é bom. Uma mensagem exclusivista. Acontece que o evangelho também é exclusivista. Ele diz que Deus c a salvação estão restritos apenas a quem

G álatas 4.21-31

não é bom. Mas o evangelho é de uma exclusividade muito mais inclusiva! Qualquer um pode pertencer a Deus através do evangelho, independentemente de história e de passado, independentemente de quem tem sido ou do que tem feito ou de quão frágil é. A religião da obediência às regras é para o nobre, o capaz, o moral, o forte, mas o evangelho é para qualquer um. Jesus na verdade disse que o capaz, o moral e o forte, via de regra, estão mais distantes do reino do que os moralmente fracassados e os fracos de espírito.

Essa é a mensagem da parábola menos conhecida de Jesus sobre dois filhos, que ele conta para “os principais sacerdotes e os líderes religiosos” (Mt 21.23). Um ouve do pai que vá trabalhar na vinha, se recusa e mais tarde muda de ideia (v. 28,29). O outro diz que vai, mas na verdade não chega nem perto da vinha (v. 30). É o primeiro filho, não o segundo, que de fato fez o que o pai queria. O que Jesus quer dizer com isso? “Os publicamos e as prostitutas estão entrando antes de vós no reino de Deus”(v. 31). Por quê? Porque vós “não crestes [...] nem [...] reconsiderastes” (v. 32).

Por isso todo mundo, do mais religioso ao mais irreligioso, necessita do evangelho da graça. Gente religiosa está rejeitando Jesus como salvador porque todas as suas obras religiosas são esforços para merecer o favor de Deus. Seu salvador é o conjunto de suas próprias realizações; Jesus pode ser no máximo um bom exemplo ou alguém que ajuda, mas não o Salvador.

Todo o mundo, do mais religioso ao mais irreligioso, necessita do evangelho da graça.

As pessoas não religiosas também adoram algo. Todos nós necessitamos de um senso de mérito ou valor. Assim, todo mundo tem a fé de um adorador em coisas das quais extrai esse valor. Mas essas coisas nos controlam enquanto as buscamos, nos desiludem se as encontramos e nos desolam se as perdemos.

G álatas 4.21-31

Ou seja, em nosso estado natural, os motivos, tanto para servir quanto para rejeitar a Deus, são idênticos. Em ambos os casos, procuramos manter a independência de Deus negando que somos tão pecadores a ponto de necessitar ser salvos inteiramente pela graça. Em vez disso, buscamos fazer por merecer nosso próprio valor. Somos “Ismael”; c todo Ismael está sempre em escravidão. É a isso que a autodependência sempre leva. Só os “Isaques” — “filhos da promessa” (v. 28) — vivem em liberdade.

Com o os Ism aéis tratam os Isaques

Há mais uma surpresa nesses versículos. Paulo extrai uma lição final de Ismael e Isaque: “o que nasceu de modo natural perseguia o que nasceu segundo o Espírito” (v. 29, veja Gn 21.8,9). E “assim também acontece agora”, na Galácia do primeiro século.

Paulo está declarando, sem rodeios, que os filhos da escrava — os que buscam a salvação através da obediência à lei — sempre perseguirão os filhos da mulher livre, os que desfrutam da salvação pela graça. Os Ismaéis perseguirão os Isaques.

Por que acontece isso? Porque o evangelho é mais ameaçador para os que são religiosos do que para os irreligiosos. Os religiosos são muito melindrosos e inquietos acerca de sua posição com Deus. A insegurança os torna hostis ao evangelho, que insiste em que seus melhores feitos são inúteis diante de Deus. Uma das maneiras de reconhecermos que nossa autoimagem é baseada na justificação por Cristo é o fato de não odiarmos nem hostilizarmos quem é diferente de nós; uma das maneiras de sabermos que nossa autoimagem é baseada na justificação pelas obras é observando as perseguições que promovemos!

Ismael riu de Isaque. O senhor Jesus sofreu a oposição mais amarga dos líderes religiosos e foi condenado por sua própria nação. Na Galácia, a perseguição não era física, mas nem por isso menos perigosa; os mestres confiantes na lei dentro da

G aiatas 4.21-31

igreja destruíam a liberdade do evangelho. O mesmo vale para hoje, como John Stott descreve:

A perseguição da verdadeira igreja [...] nem sempre é patro- cinada pelo mundo, como são chamados os estranhos [...], mas por nossos meios-irmãos, por pessoas religiosas, pela igreja nominal. Os maiores inimigos da fé evangélica hoje não são os descrentes [...], mas a igreja, o sistema, a hierar- quia. Isaque é sempre ohjcto de zombaria e perseguição por parte de Ismael.2

Perguntas |para reflexão

1. Você se identifica com Sara de alguma forma? Em caso afirmativo, como a experiência dela o conforta e anima?

2. De que maneira você poderia tratar os filhos (seus ou não) como seus salvadores?

3. Como você usaria essa passagem para responder à objeção: “A mensagem cristã é exclusivista”?

2Op. cit., p. 127.

VERSÍCULOS 1-15 GÃLATAS ■ CAPÍTULO 5$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo mostra que os filhos da promessa nascem da estéril, não do esforço; em que área você ainda tenta gerar pelo seu trabalho aquilo que só a graça de Deus pode dar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se os mais "aptos" e corretos costumam ficar de fora da família de Deus, o quanto a sua correção religiosa tem virado um orgulho que o cega para a sua necessidade de graça?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Estar "debaixo da lei" é depender dela para se apresentar a Deus; de que régua você ainda depende para se sentir digno, em vez de da pura promessa?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Liberdade do Evangelho$t$, 10,
$conteudo$Vimos Paulo dizer (repetidas vezes!) aos gálatas que os cristãos não precisam temer nenhuma condenação em virtude de seu fracasso na obediência à lei, pois são justificados em Cristo. Muita gente, quando ouve isso, exclama: Uau! Se acreditasse nisso, eu seria capaz de viver do jeito que bem entendesse!

A primeira vista, o evangelho parece afastar todo incentivo para se levar uma vida santa. Por isso, ao longo dos séculos, as igrejas sentiram a necessidade de diminuir o impacto das afirmações radicais do evangelho, trocando a liberdade que ele promove por uma mensagem cujo intuito é fazer as pessoas pararem de viver “como bem entendem”.

Portanto, chegamos a uma passagem crítica. Paulo quer nos mostrar que a liberdade do medo e da condenação trazida pelo evangelho nos leva a obedecer a Deus, não a nos satisfazer.

Libertos para a lib erdad e

O versículo 1 resume os dois últimos capítulos do livro (de certa forma, do livro inteiro). Primeiro, Paulo sustenta que temos uma liberdade profunda em Cristo. Sua frase inicial é mesmo tão forte no grego quanto na tradução em português. Literalmente, ele diz: “Cristo vos libertou para a liberdade”. Tanto o substantivo quanto o verbo fazem referência à liberdade; ela é, ao mesmo tempo, o meio e o fim da vida cristã! Tudo relacionado ao evangelho é liberdade. A missão inteira de Jesus

G álatas 5.1-15

era uma operação de libertação. E o verbo traduzido por “nos libertou” está no tempo aoristo. Em grego, ele se refere a uma ação única no passado que agora está consumada.

Portanto, do modo mais definitivo possível, Paulo nos diz que os cristãos foram libertos.

Contudo, em segundo lugar, ele nos adverte que a liberdade que temos no evangelho pode se perder. É importante que ele mencione isso, pois a declaração enfática, triunfante da primeira metade do versículo 1 podería nos levar a crer que essa liberdade é tão grande e forte que não pode ser perdida. Contudo, a despeito de sua fonte divina, Paulo explica que nossa liberdade é frágil e pode escorrer pelos vãos dos nossos dedos.

São duas (pelo menos!) as

implicações desses dois pontos. A primeira é que, para preservar nossa liberdade, devemos “permanecer firmes”.

A despeito de sua fonte divina, nossa liberdade é frágil e pode escorrer pelos váos dos nossos dedos.

Existe um paralelo interessante aqui com a liberdade política. Como já se observou, a manutenção da independência política de um grupo de pessoas ou nação requer vigilância e responsabilidade. Paulo diz que essa verdade vale também para a liberdade espiritual. Os crentes livres precisam permanecer firmes em sua liberdade (veja também lCo 16.13; Fp 1.27; 4.1). “Permanecer firme” é uma expressão de uso basicamente militar e combina as idéias de se manter alerta, ser forte, reststir ao ataque e preservar a unidade.

Em resumo, apesar do fato de já sermos salvos por Cristo, precisamos diligenciar o tempo todo para nos lembrarmos de viver de acordo com nossa salvação, preservar esse estilo de vida e nele nos regozijarmos. Não há como perdermos a salvação, mas é possível perdermos a liberdade da escravidão do medo.

G álatas 5.1-15

A segunda implicação se reporta à verdade radical de Gálatas 4, já discutida aqui: a religião que guarda a lei é de fato escravizantc. Paulo os exorta a não se sujeitarem “a um jugo” (v. 1). No judaísmo da época, era comum a referência ao estudo e à prática de toda a lei de Moisés como colocar-se debaixo de um “jugo”. Mas tanto Cristo quanto a igreja primitiva viam os fariseus e os mestres da lei como pessoas escravizantes com esse jugo (veja At 15.10; compare com Mt 11.29,30).

Os gálatas corriam o risco de se colocar debaixo desse jugo. Mas a palavra que mais assusta na última oração é “novamente”. Os cristãos gálatas haviam sido pagãos, época em que estavam debaixo da escravidão da idolatria literal, dos “princípios elementares do mundo” (G1 4.3,8,9). Mas aqui Paulo mais uma vez faz sua afirmação radical de que a idolatria pagã e o moralismo bíblico (i.e., guardar as leis da Bíblia), na prática, são a mesma coisa. Os gálatas haviam sido liberais amorais e agora estavam prestes a se tornar moralistas conservadores.

Paulo está dizendo que, no final das contas, tudo isso constitui a mesma escravidão espiritual! Sob a circuncisão, os gálatas experimentarão mais uma vez a ansiedade, a culpa e o fardo da vida que conheceram antes como pagãos. Nunca terão certeza de que estão sendo bons 0 suficiente. A vida deles será baseada no medo e assolada pelo orgulho e pela culpa tanto quanto antes; na verdade, é provável que mais ainda! Cairão na sensibilidade excessiva, na insegurança, no orgulho, no desestimulo e na fraqueza das pessoas que nunca sabem com certeza se têm algum valor (i.e., justiça).

Q.uando Cristo n ão tem valor nenhum

Por fim, os gálatas enfrentam uma decisão do tipo ou uma coisa ou outra. Ou farão de Cristo seu tesouro, aquele em quem encontram perdão e realização, ou se voltarão para a obediência à lei, para a circuncisão.

G álatas 5.1-15

O ensino dos judaizantes era: A menos que sejam circuncidados e obedeçam a lei, vocês não poderão ser salvos (veja At 15.1,5)■ Paulo retruca que, pelo contrário, se adotarem esse ensino e o seguirem, aí sim não poderão ser salvos: “Cristo de nada vos servirá” (G1 5.2).

De novo vemos Paulo repetir uma ideia que já tinha esclarecido na carta (nesse caso, no capítulo 1). Portanto, mais uma vez precisamos lembrar que as Escrituras se repetem com um propósito definido: porque precisamos ouvir e continuar ouvindo sempre!

Paulo quer que os gálatas se lembrem de que não se pode acrescentar nada a Cristo sem subtrair Cristo. Ou ele é tudo para eles ou não é nada. Se a . obediência à lei se tornar parte S Não temos como nos do sistema de salvação deles, H apegar à graça se será o único sistema de que g vivermos pelas obras, disporão, de modo que ficarão “[obrigados] a cumprir toda a lei” (v. 3) — o que, como vimos, é simplesmente impossível (3.10,11). Justificação por meio da lei é autossalvação, é estar “separados de Cristo” (v. 4). Não temos como nos apegar à graça se vivermos pelas obras (v. 4).

Em resumo, o versículo 1 nos lembra de nossa liberdade subjetiva em Cristo — que não mais obedecemos a Deus motivados por algo que nos pesa nas costas e escraviza. Os versículos 2-4 nos lembram da nossa liberdade objetiva em Cristo — que estamos livres da obrigação de obedecer a toda a lei a fim de nos apresentarmos justificados perante Deus. Paulo afirma que o evangelho nos liberta tanto da culpa quanto da escravidão do pecado, tanto da condenação do pecado quanto da sua motivação.

Será que o versículo 4 significa que cristãos verdadeiros podem perder a salvação e cair realmente da graça? Talvez pareça que sim. Mas, como veremos logo em seguida (v. 5,6), os cristãos

G aiatas 5.1-15

baseiam sua vida inteira na certeza e na segurança de sua aceitação presente e futura por Deus. A segurança da salvação não é possível se pensarmos que devemos fazer por merecê-la ou mesmo mantê-la com nossos esforços. Se nos conservamos salvos sendo bons, como podemos ter certeza de que estamos sendo bons o suficiente para preservar o favor de Deus? Contudo, a Bíblia sempre declara que nós, cristãos, temos como saber da nossa segurança e salvação (e.g., ljo 2.3). Em outras palavras, não fizemos por merecer a salvação com nosso comportamento, nem podemos “desfazer por merecê-la” com nosso comportamento.

João afirma o seguinte sobre quem dá as costas para a fc em caráter permanente: “Eles [...] não eram dos nossos, pois se fossem dos nossos teriam permanecido conosco” (ljo 2.19). Segundo ele, os verdadeiros cristãos são salvos pela graça e demonstram ser cristãos continuando a confiar na graça! De igual modo, quem cai da graça nunca confiou nela de fato. Por isso Paulo é capaz de dizer, no versículo 10: “Confio no Senhor que não pensareis de outra forma”. Convencido de que eles são cristãos de verdade, entende que reagirão positivamente à sua advertência, demonstrando que creem, sim, de coração, no evangelho.

Mas os cristãos ainda precisam ouvir a advertência dos versículos 2-4. Paulo está dizendo: Não importa que vocês insistam em sua conversão ou que afirmem sentir que Cristo transformou sua vida. Ao decidir que sua salvação depende do seu desempenho em alguma medida, vocês negam a salvação só pela fé em Cristo (estou confiante de que não farão isso), não podendo ser salvos por ele. Para Paulo, esse é um teste decisivo quanto a alguém estar ou não em Cristo.

A esp era n ça do qu e tem os

Em vez de lutarem para se justificar — esforço fadado ao fracasso —, Paulo encoraja os gálatas a aguardarem apenas “a justiça que é nossa esperança” (v. 5).

G álatas 5.1-15

A palavra bíblica elpida, traduzida por “esperança”, não tem sentido tão brando como no português. Na Bíblia, “esperança” não significa “esperar que sim”, como em Vaifazer sol amanhã? Espero que sim (mas não tenho como me sentir confiante de que assim será). O termo faz referência à certeza e à segurança de algo (veja Hb 11.1).

Eis um grande problema para o leitor da Bíblia em português. A palavra que significa “certeza absoluta” em grego foi vertida para “não muito seguro” em português. E fácil, portanto, entender de forma errada muitas passagens!

O verdadeiro sentido do termo “esperança” é indicado no versículo 5 de Gálatas 5, pois Paulo diz que “aguardamos” simplesmente essa justiça. Não trabalhamos nem lutamos por ela. Sabemos que ela está a caminho, se aproximando. Portanto, podemos aguardá-la com fervor, em vez de com ansiedade.

Pelo que aguardamos? Justiça quer dizer mais do que bondade; é ter uma ficha toda limpa com Deus e manter com ele um relacionamento da mais absoluta retidão. Paulo está afirmando que podemos viver hoje à luz da nossa acolhida e glorificação futura, certa e garantida nos braços de Deus, pois sabemos que, “se és filho, és também herdeiro por obra de Deus” (4.7). Nenhum outro ser humano, ninguém do mundo secular, nenhum seguidor de qualquer outra religião pode encarar o próprio futuro dessa maneira! Pessoas não religiosas não fazem ideia de onde estarão dentro de um milhão de anos, e pessoas religiosas sem o evangelho vivem ansiosas acerca de onde estarão, sem conseguir relaxar ou olhar para a frente com entusiasmo. A certeza do nosso futuro com Deus é fruto do evangelho.

Ao falar do futuro, Paulo faz com que nossa imaginação se volte para o que significará ser radiante, glorioso, belo e perfeito. Em outro lugar ele diz que Jesus vive para nos apresentar a si mesmo gloriosos, sem mancha, sem ruga, nem nada

G aiatas 5.1-15

semelhante (cf. Ef 5.27). Sabemos que isso é garantido, portanto, basicamente, é verdade agora. Devemos viver hoje sabendo que somos, e sempre seremos, preciosidades absolutas aos olhos de Deus. Ou, expressando a mesma ideia de outra forma, somos tão amados e honrados por Deus agora como seremos quando estivermos perfeitamente gloriosos no céu.

Paulo diz que pela fé e pela obra do Espírito podemos, e assim será, aguardar com avidez essa justiça, essa glória certa. Portanto, esperar não é simplesmente uma concordância intelectual acerca de nosso destino. A linguagem é vivida demais e os resultados são poderosos demais para estarem descrevendo só isso.

Devemos viver hoje sabendo que somos preciosidades absolutas aos olhos de Deus.

Paulo discorre sobre uma disciplina espiritual. Refere-se ao desenvolvimento de uma atitude do coração, um deleite ávido e passional em tudo que nos tem sido dado em Cristo. Envolve meditação e reflexão sobre nossa justificação, adoção e futura glorificação e, a seguir, o alinhamento de nossas ações em conformidade com isso.

Precisamos voltar a mente para quem somos e o que temos em Cristo com tanta frequência a ponto de nosso coração sofrer uma comoção e nosso comportamento ser ajustado a essas realidades invisíveis. Isso acontece com aqueles que têm fé no Filho, conforme o Espírito executa sua obra.

para reflexão Perguntas

1. Você já chegou perto de perder (ou perdeu de fato) a liberdade que o evangelho lhe dá? Como isso aconteceu? Que lições tira da experiência?

2. Que diferença a esperança da garantia futura faz em sua vida agora?

G álatas 5.1-15

3. De que maneira você pode se certificar de que meditará com mais frequência em seu futuro glorioso? Que passos práticos dará?

SEGUNDA PARTE

Sem valor algu m

A essa altura, já nos acostumamos a ouvir as declarações bombásticas de Paulo em sua carta. O versículo 6 contém uma delas: “Nem a circuncisão [representando as obrigações religiosas] nem a incircuncisão [representando o paganismo ou a imoralidade] valem coisa alguma; mas, sim, a fé que atua pelo amor”.

A palavra traduzida por “valem” significa “ter poder”, quando empregada para descrever pessoas. Mas, quando utilizada para coisas, significa “ter serventia” ou “ser aproveitável”.

Nem o esforço moral nem os fracassos morais valem coisa alguma. Ponto-final.

Por quê? Primeiro, nem a religião nem a falta dela contam no sentido do estabelecimento de uma relação com Deus. Paulo acaba de declarar que nossa aceitação futura por parte de Deus já é certa por meio da obra de Cristo; podemos ávida e confiadamente aguardar nossa gloriosa justiça. Nesse contexto, quando ensina que nem a religião nem a não religião “valem coisa alguma”, ele quer dizer que elas não servem para nada, em se tratando de nossa retidão e posição diante de Deus. Paulo afirma: Meu bom desempenho não me acerta com Deus, nem meu desempenho ruim me torna mais perdido e desesperado. Tudo permanece tão perdido quanto antes e tão apto a ser salvo quanto antes.

Nem o esforço moral nem os fracassos morais valem coisa algum a. Ponto-final.

Quando um cristão tem sucesso em alguma coisa, ele deveria dizer: Este sucesso alcançado não aumenta o amor de Cristo

G álatas 5.1-15

por mim. Na verdade, é só devido ao seu amor por mim que isso aconteceu, não o contrário! E, ao experimentar um fracasso, ele deveria dizer: Se não tivesse fracassado dessa maneira, não seria mais amado e aceito por Deus do que sou neste momento! Meu desempenho é irrelevante. Na verdade, Deus está sempre trabalhando para 0 meu bem (Rm 8.28) — ele permitiu que isso acontecesse porque me ama, não porque não me ama. Que princípio radical!

Isso deveria conduzir a uma paz e um equilíbrio tremendos na vida cristã; deveria eliminar enormes altos e baixos. Pois somos todos da “circuncisão” (sucesso espiritual) ou da “incircuncisão” (fracasso espiritual) o tempo todo, e Paulo diz que nenhuma dessas condições “vale coisa alguma”.

Segundo, nem a religião nem a falta de religião contam no sentido da mudança interior de caráter e do coração cheio de amor verdadeiro. A circuncisão e a incircuncisão não “valem coisa alguma”, mas, sim, “a fé que atua pelo amor” (v. 6). A fé literalmente energiza o amor. Nem o moralismo religioso nem a licenciosidade não religiosa podem fazer isso, porque ambos são egoístas e inseguros em essência. O egoísmo e a insegurança não podem produzir amor, porque o amor é alegre altruísmo. Mas a fé em Cristo pode, pois por ela temos certeza da nossa justiça e acolhida pelo Pai.

Imagine como seria se uma pessoa lhe pedisse em casamento, mas você constatasse que ela só aceitaria se você tivesse uma herança. Você se sentiria usado. Não se consideraria amado, em absoluto. Ora, todos sabemos que não nos sentimos amados por alguém a menos que sejamos amados pelo que somos, não pelo que podemos proporcionar. A analogia nos ajuda a compreender a motivação do evangelho. Quando pensávamos que nossas obras nos salvariam, servíamos a Deus pelo que conseguiriamos obter dele. Nós o$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$"Para a liberdade Cristo nos libertou"; em que pontos você ainda se coloca de volta sob o "jugo da escravidão", vivendo amedrontado por uma condenação da qual Cristo já o livrou?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando ouve que está livre de toda condenação, seu coração pende mais para "então posso viver como quiser" ou para o medo de que isso seja perigoso demais?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Paulo diz que essa liberdade não é pretexto para a carne, mas serviço pelo amor; onde você usa a graça como desculpa para a preguiça, em vez de como força para amar o próximo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$I A fé literalmente energiza o amor.$t$, 11,
$conteudo$G álatas 5.1-15

usávamos. Mas depois que a esperança do evangelho se estabelece e enxergamos a graça e a beleza de Deus, passamos a amá-lo pelo que ele é.

No evangelho, vemos que Cristo morreu em nosso favor c nos valorizou, não pelo que lhe podemos proporcionar. Não somos de proveito algum para ele! Fomos amados pelo que somos. E, na proporção em que vemos isso na fé do evangelho, pagamos na mesma moeda. Agora servimos a Deus, não pelo que ele nos proporciona, pois já temos tudo garantido, mas pelo que ele é e pelo que tem feito em nosso favor. Enfim, conseguimos amar a Deus por quem ele c. Agora também podemos servir aos outros, não pelo que nos proporcionam, mas pelo que são em si mesmos.

A medida que o versículo 5 se torna cada vez mais claro para nós, passamos a vivenciar o versículo 6 cada vez mais. Quanto mais alegria temos em nossa salvação graciosa, mais somos conduzidos pelo amor e pela gratidão a fazer o bem pela pura beleza do bem, pelo puro deleite em Deus, pelo puro amor aos outros. Sc lembrarmos continuamente a nós mesmos e vivermos à luz da nossa esperança segura, teremos um coração transbordante de amor. Não precisamos buscar justiça e acolhida nos outros, uma vez que tais coisas já nos pertencem; somos livres para amar o próximo, buscando seu bem.

Vale a pena inverter isso. Como nossa fé em Cristo nos dá uma esperança segura, que transborda à medida que amamos os outros, se acharmos que nosso amor está ressecando ou esfriando, a raiz da nossa falta de amor estará no fato de que deixamos de olhar para a nossa esperança pela fé. Se descobrirmos que estamos desamando, a solução não será buscar amar mais ou melhor, mas, sim, olhar para Cristo, que nos confere a aceitação inabalável e imperdívcl do Pai. Então, enquanto nos ativermos à nossa esperança, encontraremos nosso coração derretido pelo amor do Pai e transbordando desse amor pelos outros.

G álatas 5.1-15

De modo que a liberdade do evangelho tem no mínimo duas facetas. Há a “liberdade da consciência”: estou livre da culpa por meu desempenho imperfeito. Existe a “liberdade motivacional”: estou livre do velho impulso de desempenhar bem. Não preciso nem quero mais seguir as antigas buscas como modo de ganhar minha justiça ou de me assegurar algum valor.

Termine a corrida

Paulo interrompe o fluxo de idéias para advertir os cristãos gálatas mais uma vez. Eles vinham fazendo uma boa corrida, mas agora, ao darem ouvidos a falsos mestres, estão sendo impedidos “de obedecer à verdade” (v. 7). Eis um excelente lembrete de que essas são questões vitais, de importância eterna: existe uma penalidade a ser paga (v. 10).

Particularmente perigoso é que “aquele que vos perturba” parece ter sugerido que Paulo provavelmente concorda com ele — que Paulo ainda estaria (como fazia quando judeu zeloso em busca da salvação pela obediência) “pregando a circuncisão” (v. 11). Paulo refuta a afirmação salientando que Deus, aquele “que vos chama” (v. 8), jamais procuraria persuadir seu povo a não obedecer à verdade do evangelho da cruz de Cristo. Como temos visto o tempo todo, não existe nenhum tipo de transigência aqui; ou é circuncisão (a autossalvação) ou o “escândalo da cruz” (a salvação por Cristo, v. 11). Paulo prega o segundo claramente, uma vez que está sendo perseguido por aqueles que querem confiar no próprio desempenho, como todos os verdadeiros ministros do evangelho serão (4.29).

Não podemos deixar de notar aqui a urgência das palavras de Paulo, nem a indignação que ele sente contra aqueles que têm impedido a obediência à verdade (v. 7). Ele chega a desejar que os falsos mestres, tão enérgicos em impor a circuncisão aos crentes, chegassem ao extremo de se castrarem (v. 12). Como

G aiatas 5.1-15

John Stott argumenta, esse desejo não nasce de uma sede de vingança, mas do amor profundo pelo povo de Deus.

Arrisco-me a dizer que, se estivéssemos tão preocupados com a igreja de Deus e com a Palavra de Deus quanto Paulo, também desejaríamos que os falsos mestres desaparecessem da face da Terra.1

O sentimento de Paulo nos lembra que isso é importante.

N ão perca, n ão ab u se

Após essa digressão emocional, Paulo retoma o fio da meada do versículo 6. Enquanto a mensagem dos versículos 1-12 é Não perca a liberdade do evangelho, os versículos 14-15 nos advertem; Não abuse da liberdade do evangelho.

Temos visto ao longo de Gálatas a extrema facilidade de perdermos a liberdade, resvalando para o legalismo e a justiça pelas obras. Essa é de fato a grande questão da carta de Paulo. Embora os cristãos possam professar uma crença intelectual no evangelho, nem sempre vivem de maneira fundamentada no evangelho.

Mas agora Paulo faz menção de outro grande erro em que os cristãos podem cair — não o legalismo, mas a pf.rmissividade. Voltar para a obediência de regras significa perder a liberdade, mas resvalar para a permissividade significa abusar dessa nossa liberdade. Vimos que a liberdade do evangelho é a liberdade que tanto leva embora a culpa do pecado quanto destrói a motivação para o pecado. Mas Paulo sabe que falar sobre assuntos como “liberdade” pode ser muito enganoso para as pessoas. Ele tem consciência de que, ao falar sobre estar “livre

'The message ofGalatians, 'lhe Bible Speaks Today (Downers Grove: I VP, 1968), p. 136 [edição cm português: A mensagem de Gálatas (São Paulo: ABU, 1997)].

G álatas 5.1-15

da lei”, na mesma hora alguns acham que ele quer dizer que as pessoas agora são livres para determinar os próprios padrões de comportamento.

Por isso ele declara, em termos nada vagos, que o evangelho não o liberta para o pecado! “Não useis da liberdade como pretexto para a carne” (v. 13). Paulo está dando continuidade a um pensamento que começou lá no versículo 7: “Corríeis bem. Quem vos impediu de obedecer à verdade?”. Os cristãos têm, sim, de obedecer à verdade, e existe uma dinâmica do evangelho ou motivação do evangelho para obedecer à verdade que os gálatas costumavam ter (“corríeis”), mas que agora está diminuindo.

O evangelho nos ensina que Deus é tão santo que nada menos que o pagamento completo pelos pecados e a justiça perfeita de Cristo pode satisfazê-lo. No entanto, o evangelho nos ensina também que Deus é tão amoroso que podemos receber essa justiça perfeita agora e apresentar-nos inteiros perante os seus olhos.

Portanto, o evangelho nem nos leva a viver uma vida culpada (uma vez que Deus nos tem aceitado com amor) nem uma vida ímpia (uma vez que o Deus que nos tem aceitado é perfeitamente santo). Esquecer o primeiro item é cair no erro de que Paulo trata no versículo 1 e perder a liberdade; esquecer o segundo é cometer o erro do versículo 13 e abusar da liberdade. Ambos os erros significam que perdemos o evangelho de vista.

A parente con trad ição

Isso nos ajuda a resolver a aparente contradição dessa passagem. No versículo 3, Paulo dá a entender que os cristãos, encontram-se livres da obrigação de obedecer à lei inteira.

Depois, no versículo 13, ele instrui que sejamos “servos uns dos outros pelo amor”; e, no versículo 14, afirma que o resumo da lei é amar uns aos outros! Assim, sem meias palavras, ele orienta que os cristãos gálatas devem obedecer à lei. Como

G álatas 5.1-15

entender isso? Temos essa obrigação ou não? Em essência, a resposta é “sim”. Por um lado temos a obrigação de guardar a lei, mas por outro não temos.

Se olharmos para o versículo 3, Paulo imediatamente acrescenta ao “[vós estais obrigados] a cumprir toda a lei” o “vos justificais pela lei” (v. 4). A obrigação que acabou para o cristão é a de obedecer à lei para ser salvo, o que é impossível de se atingir.

Mas agora que estamos salvos por completo e somos livres pela graça, estamos mais obrigados do que nunca a obedecer a lei! Por quê? Porque temos mais motivos para amar a Deus do que antes. O amor brota da fé e da esperança do evangelho (v. 5,6) e transborda em amor e serviço para nosso próximo, em vez de usá-los para nos servir. E amar nosso próximo é “toda a lei [que] se resume numa só ordenança” (v. 14).$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo diz que a fé "atua pelo amor"; o seu serviço a Deus brota mais do amor pelo que ele é ou do medo do que ele pode lhe tirar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se você foi amado por Cristo pelo que é, e não pelo que pode lhe proporcionar, em que relacionamentos você ainda ama as pessoas só pelo que elas lhe rendem?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quanto mais alegria você tem na salvação gratuita, mais ama livremente; que falta de alegria na graça pode estar secando o seu amor pelos outros hoje?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Temos mais motivos para am ar a Deus do que antes. I$t$, 12,
$conteudo$Ou seja, os cristãos estão livres da lei como modo de conquistar mérito diante de Deus, mas não como forma de agradar a Deus. Pelo contrário, a obrigação cresceu. Pois a lei é uma expressão da natureza e do coração de Deus, e, assim, agora somos devedores em dobro perante ele de usá-la para agradá-lo e imitá-lo. Devemos isso a ele como nosso Criador, uma vez que ele nos projetou, é nosso dono e tem tanto o conhecimento para saber como devemos viver quanto o direito de exigir que vivamos dessa maneira. Por outro lado, agora também lhe somos devedores como nosso Redentor, uma vez que queremos agradar, por gratidão, àquele que nos salvou a um custo tão imensurável.

Paulo pergunta: se conhece o amor de Deus por você em Cristo e se conhece a sabedoria de Deus demonstrada com mais clareza em Cristo, por que você usaria sua liberdade “como pretexto para a carne” (v. 13), já que foi ela quem o tornou inimigo dele, sem perdão nem sentido de realização?

G álatas 5.1-15

O evangelho destrói com justiça a motivação que você tem para pecar. Ele mina por completo a necessidade e a razão que você tem de viver como bem entende. Qualquer pessoa que insista em dizer que o evangelho nos encoraja a pecar simplesmente ainda não o entendeu nem começou a experimcntar seu poder.

Veja, por exemplo, o caso da mentira. Por um lado, a liberdade do evangelho significa que não tenho de ter medo de ser expulso da presença de Deus se mentir. Estou livre da penalidade legal por essa mentira. A pessoa que busca demonstrar perfeita sinceridade como um modo de conquistar o favor de Deus se sentirá arrasada quando escorregar e mentir. Mas o evangelho nos assegura que a falta de sinceridade não nos condenará.

Todavia, perguntemos então: Por que eu queria mentir? Por sentir que necessitava daquilo que me arriscava a perder se contasse a verdade. Uma pessoa que precisa de aprovação, poder, conforto ou sucesso para ter alegria ou valor mentirá para conseguir ou para manter esse salvador funcional. Alguém que conhece o evangelho, tanto emocionalmente quanto em seu intelecto, dirá: Não preciso disso. Portanto, posso contar a verdade. Se mentisse, não mudaria minha posição perante Deus — sou livre para mentir. Mas não tenho nenhuma necessidade de mentir — por que haver ia de quererfazer isso?

O evangelho o liberta para viver do jeito que quiser. Mas, se, pelo evangelho, você entende de verdade quem é Jesus e o que ele tem feito em seu favor, então se perguntará: Como posso viver para ele ? E a resposta será: olhe para a vontade de Deus expressa na lei. O evangelho nos liberta da lei para a lei. Acaba com nossa velha obediência à lei sem amor e motivada pelo egoísmo, e nos motiva a obedecer à lei por amor.

O evangelho nos liberta d a lei para a lei.

G álatas 5.1-15

para reflexão Perguntas

1. Você reage a seus sucessos e fracassos de maneira compatível com o evangelho ou com base na justificação pelas obras?

2. Em que situações você acha difícil amar os outros? Como o fato de se lembrar de sua esperança aumentará seu amor?

3. Pense em um pecado contra o qual você vem lutando. Por que você deseja pecar dessa maneira? Como sua liberdade no evangelho corrói essa motivação para o pecado?

VERSÍCULOS 16-25 GÃLATAS ■ CAPÍTULO 5$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Livres da lei como mérito, ainda lhe devemos obediência por gratidão; onde você confunde "não preciso obedecer para ser salvo" com "não preciso obedecer", e assim despreza a graça?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Paulo diz que o evangelho destrói a própria motivação para pecar; em que pecado recorrente você ainda acredita que viver "como bem entende" vai realmente satisfazer você?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sendo devedor em dobro, como Criador e Redentor, que área da sua vida você tem subtraído de Deus, como se ela não lhe pertencesse?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Caráter do Evangelho$t$, 13,
$conteudo$Na religião normal, a motivação para uma vida moral se baseia no medo. No cristianismo fundamentado no evangelho, a motivação é uma dinâmica de amor, como vimos no último capítulo (5.6,14). Agora, Paulo explicita como crescemos em caráter por meio dessa nova dinâmica. E sua manchete é: Crescemos à medida que lutamos.

A luta

Existem duas naturezas em operação em todo cristão: o Espírito e a carne (v. 16). A qualquer momento da nossa vida, “andamos”por uma e não “satisfazemos” a outra. Paulo, claro, incentiva os gálatas a “andar pelo Espírito”.

“Carne” traduz o termo grego sarx, interpretado em algumas versões bíblicas como “natureza humana”. A carne, no Novo Testamento, quando oposta ao Espírito, não se refere à nossa natureza física em oposição à nossa natureza espiritual, mas ao aspecto do nosso ser como um todo que anseia pelo pecado, em oposição ao aspecto que anseia por Deus. Sarx é nosso coração pecaminoso. Ou antes, a parte ou o aspecto do nosso coração que ainda não foi renovado pelo Espírito.

Em oposição a ou “contra” (v. 17) a carne está o Espírito. À primeira vista, pode parecer que essa é uma batalha entre algo dentro de nós (nossa sarx) e algo fora de nós (o Espírito Santo). Mas, como Paulo fala de ambos os lados como geradores de

G álatas 5.16-25

qualidades de caráter dentro de nós e devido a sua menção a dois tipos de “desejos”, fica claro que esse conflito ocorre em nosso interior. E mais exato pensar no “Espírito” como o coração cristão renovado, feito novo pelo Espírito Santo. Nossa natureza pecaminosa estava lá, governando sozinha e sem sofrer oposição, antes de sermos cristãos. O Espírito, contudo, entrou sobrenaturalmente quando nos tornamos cristãos e começou a renovação que consiste agora em nossa “nova natureza”. Por isso, em Efésios 4.22-24, Paulo se refere a essa oposição sarx versus o Espírito como a competição entre o “velho homcm” e o “novo homem”.

Qual é exatamente a natureza dessa luta (v. 17)? Trata-se de uma batalha entre os “desejos” do Espírito Santo e os da sarx. No original, Paulo chama os “desejos da carne” de epithumia. Em versões mais antigas, essa palavra era traduzida por “concupiscência”, o que levava o leitor a pensar em desejo sexual. Em traduções modernas, a palavra é traduzida por “desejos” apenas; mas isso talvez ajude menos ainda.

O principal problema que nosso coraçào tem nâo é tanto o desejo por coisas ruins, mas nossos superdesejos por coisas boas.

Em sentido literal, epithumia designa um “superdesejo”, um “desejo excessivo”, um impulso e anseio que a tudo controla. Isso é crucial. O principal problema que nosso coração tem não é tanto o de desejar coisas ruins, mas nossos superdesejos por coisas boas. Quando uma coisa boa se converte em nosso “deus”, ela cria “superdesejos” (veja Ef 2.3; lPe 2.11; ljo 2.16). Paulo diz que os desejos pecaminosos se tornam coisas profundas que nos dirigem e controlam. O pecado cria em nós o sentimento de que precisamos ter isso, ou aquilo, ou aquilo outro.

David Powlison tem uma percepção bastante proveitosa sobre isso:

G álatas 5.16-25

Se “idolatria” é o termo característico e resumido do Antigo

Testamento para nossa tendência a nos afastarmos de Deus, então “desejos” (epithumia) é o termo característico e resumi- do do Novo Testamento para o mesmo movimento [...]. O

Novo Testamento funde o conceito de idolatria e de desejos excessivos que governam a vida [...] para falar de concupis- cência, cobiça, anseio e exigência gananciosa (E f 5.5; Cl 3.5).1

Uma das declarações mais curiosas aqui é quando Paulo diz, no versículo 17, em sentido literal: “A carne superdeseja contra o Espírito, e o Espírito contra a carne”. Observe que ele na verdade não diz que o Espírito “superdeseja” (como podería o Espírito desejar demais alguma coisa?). No entanto, a construção indica que o Espírito tem paixões e anseios também, no mínimo tão fortes quanto os da carne! Pelo que o Espírito anseia? Jesus ensina que o Espírito Santo virá ao mundo para glorificá-lo (Jo 16.14). Portanto, enquanto nossa carne glorifica, adora e anseia por todos os tipos de coisas, condições e pessoas criadas, o Espírito glorifica, adora e anseia por Jesus. Ele fala da beleza e da grandeza de Cristo.

O Espírito, então, anseia por nos mostrar a Cristo e nos conformar com Cristo. Em última análise, isso é o que os cristãos também querem. E fácil não perceber, mas Paulo faz uma declaração extremamente reveladora quando diz que o Espírito e a sarx “se opõem um ao outro, de modo que não conseguis fazer o que quereis” (G15.17). A passagem é paralela a Romanos 7.22,23, quando ele diz que “no que diz respeito ao homem interior, tenho prazer na lei de Deus”, contudo, desçobre que existe “nos membros do meu corpo outra lei guerreando contra a lei da minha mente”.

1“Idols of the heart and ,vanity fair’”, The Journal o f Biblical Counseling, vol. 13, n. 2, Winter 1995, p. 36.

G álatas 5.16-25

Viver do jeito do Espírito é o que mais desejamos; todavia, nossa natureza pecaminosa continua a gerar desejos alternativos e concorrentes, os quais experimentamos e aos quais podemos ceder, mas que agora contradizem nosso amor e objetivos mais eternos. A pessoa nascida de novo tem tanto desejos pecaminosos quanto divinos, mas devemos querer de verdade o que nosso coração renovado pelo Espírito deseja.

O Espírito anseia por nos conformar com Cristo. Em última análise, isso é o que os cristãos tam bém querem.

Essa declaração está carregada de esperança e afir- mação. Mesmo quando resvalamos para o pecado, podemos repetir com Paulo: Esse não é meu verdadeiro eu; isso não é 0 que eu desejo de verdade. Eu quero Deus e sua vontade.

Com o a s a /x funciona

Há um paralelismo impressionante entre os versículos 16 e 18. Devemos andar pelo Espírito e ser guiados pelo Espírito, em vez de optar por satisfazer a carne ou estar debaixo da lei.

Para Paulo, essas duas coisas ou estão intimamente relacionadas ou são apenas maneiras diferentes de falar da mesma coisa. Isso não só nos diz algo sobre os atos da carne, mas também sobre suas motivações; não só que ela desobedece a Deus, mas por que deseja fazê-lo.

Carne é aquilo em nosso interior que deseja ser nosso próprio salvador e senhor. O coração da carne funciona “debaixo da lei”; ele rejeita o dom gratuito da justiça e da salvação de Cristo e continua a buscar a versão própria de ambas as coisas. Portanto, o pecado por baixo de todos os pecados — o motivo da nossa desobediência — é sempre a falta de confiança na graça e bondade de Deus e um desejo de proteger e guardar nossa própria vida por intermédio da autossalvação.

G álatas 5.16-25

À luz disso, vemos que as duas naturezas de que Paulo fala são na verdade dois sistemas motivacionais semi-intactos em nosso interior. Um deles é centrado em um objetivo que a imaginação considera belo e desejável. Esse objetivo gera o que percebemos como “necessidades” e fabrica “impulsos” para obtê-las. A carne é, na verdade, nosso antigo sistema motivacional — com objetivos próprios e, portanto, necessidades e impulsos próprios — de certa forma ainda intacto. Ela se concentra cm algum objeto bom em si mesmo, mas que transforma em ídolo por meio do qual buscamos nossa salvação (“posso ter valor se for amado... se tiver uma boa carreira profissional... se meus filhos me amarem”), e que acaba criando superdesejos por esse ídolo.

O que a sa ra opera

Os versículos 19-21 listam “as obras da carne” (v. 19). Observe que essas obras não são todas ações; as atitudes também funcionam como superdesejos da nossa sarx.

Há três palavras no versículo 19 relacionadas com as obras da carne na área da sexualidade: “imoralidade” (porneia), ou seja, a relação sexual entre pessoas que não são casadas uma com a outra; “impureza” (akatharsia), i.c., práticas e relacionamentos sexuais não naturais, e “indecência” (aselgia), i.e., sexualidade descontrolada.

Há duas palavras no versículo 20 relacionadas com a área da religião: “idolatria” (eidololatria) e “feitiçaria” {pharmakeia). Como aqui a idolatria aparece em conjunto com a feitiçaria, não diz respeito à prática muito ampla e abrangente de converter coisas boas, como uma carreira profissional, em um deus (como em Ef 5.5 e Cl 3.5). Antes, Paulo se refere a práticas religiosas ocultas e pagãs muito específicas. A primeira palavra se relaciona a fornecer um substituto inadequado para Deus, e a segunda, a falsificar a obra do Espírito.

G álatas 5.16-25

A seguir, nos versículos 20 e 21, surgem oito palavras que descrevem como a carne destrói os relacionamentos. Quatro delas são atitudes destrutivas: “ambição egoísta” (eritheia), ou seja, a competitividade, uma motivação voltada para a busca do eu; “inveja” (phthonoi), a cobiça, o desejo do que os outros têm; “ciúmes” {zelos), o zelo e a energia que vêm de um ego faminto; e “rivalidade” (echthrai), designando a hostilidade, uma atitude antagônica. Quatro descrevem os resultados dessas atitudes nos relacionamentos: “inimizades” (eris), ser polêmico ou gostar de provocar brigas; “ira” (thumoi), explosões de raiva; “discórdias” (dichostaiai), divisões entre pessoas (ao que a ira conduz); e “partidarismo” {aireseis), grupos partidários e rivais permanentes.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo diz que crescemos à medida que lutamos entre carne e Espírito; em que ponto você tem confundido a ausência de luta com paz, quando ela pode ser sinal de complacência?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se "andar pelo Espírito" é uma escolha diária, em que momento de hoje você cedeu à carne sem nem perceber que havia uma batalha a travar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O fruto do Espírito cresce, não se fabrica; onde você tenta produzir caráter na força do esforço, em vez de cultivá-lo descansando na graça?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A carne destrói os relacionamentos. I$t$, 14,
$conteudo$Por fim, há duas palavras que se referem ao abuso de substâncias: “bebedeiras” e “orgias”. Essas duas palavras estão conectadas. As orgias não são sexuais, mas de bebedices. Uma das obras da carne é o vício em substâncias e comportamentos que criam o prazer.

Paulo dirige uma advertência severa para os que praticam essas coisas, pois “não herdarão o reino de Deus” (v. 21). Ele faz alusão à prática habitual, em vez de aos lapsos ocasionais que acabam sendo motivo de arrependimento. Que alguém se entregue continuamente à carne sem lutar contra ela significa demonstrar que o Filho não o redimiu e que o Espírito não o renovou. Paulo não está procurando destruir a segurança cristã aqui, mas tem como alvo banir a complacência.

Outra maneira de dividir essa lista em categorias é observando que alguns pecados são característicos de pessoas religiosas (ambição egoísta, inveja, ciúme, partidarismo), enquanto outros são mais característicos de pessoas não religiosas (imoralidade, bebedeira). A lista nos mostra que Deus não faz o tipo de distinção que costumamos fazer, considerando o sexo e a

G álatas 5.16-25

bebida mais pecaminosos do que o ciúme e a ambição. Ela destrói a tendência que as pessoas naturalmente não religiosas têm de rotular como “piores” as falhas da sarx de pessoas religiosas, e a das pessoas religiosas de considerar as obras da sarx das não religiosas como inaceitáveis. Somos muito melhores em observar as obras da carne alheias do que em lutar contra as nossas!

Perguntas | para rellexão

1. Que obras da carne você enxerga em sua vida?

2. Quais são os superdesejos que fazem com que você pense ou se comporte sob a ação desses impulsos?

3. Como você pregará a si mesmo o evangelho da graça e da aceitação com o intuito de destruir esses superdesejos?

SEGUNDA PARTE

Sermos “guiados pelo Espírito” (v. 18) é transformar-nos e sermos transformados na pessoa que desejamos ser. O desenvolvimento do caráter como o de Cristo, quando fomentado pelo Espírito, é libertador, pois ele nos faz chegar mais perto de nos tornarmos as pessoas que fomos feitos para ser e que nosso coração renovado pelo Espírito deseja que sejamos.

Por que Paulo d isse “fruto”

' Paulo sempre escolhe suas imagens com grande cuidado. E é muito revelador que ele fale em “obras da carne” (v. 19), mas depois mude para “fruto do Espírito” (v. 22). O termo isolado “fruto” nos transporta para o mundo da agricultura e nos revela quatro fatos sobre como o Espírito opera.

Primeiro, o crescimento cristão é gradual, tanto quanto o crescimento de um nabo ou de uma batata. Ninguém consegue ver o crescimento botânico — só se pode medi-lo depois de

G álatas 5.16-25

algum tempo. O fruto do Espírito pode estar se desenvolvendo na vida de um cristão sem que ele se dê conta disso, até que um problema ou dificuldade apareçam e ele pense: Algum anos atrás, eu jamais seria tão paciente ou teria tanto autocontrole para enfrentar essa situação. Isso mostra que o fruto do Espírito estava crescendo o tempo todo, pouco a pouco, sem ser notado.

Segundo, o crescimento do fruto do Espírito é inevitável. Haverá crescimento. Conta-se a história de um homem que, ao morrer, foi enterrado sob uma lápide de mármore. Ninguém sabe como, mas o fato é que uma bolota de carvalho entrou em seu túmulo. Com o tempo, gradualmente e sem ser notada, a bolota cresceu. Por fim, partiu o mármore da lápide, tal o seu poder. Uma pequenina semente contra o mármore? Sc não souber nada sobre o crescimento das coisas, você apostará no mármore! Mas, claro, o dinheiro seria melhor aplicado apostando na bolota.

Se alguém tem o Espírito dentro de si — se é cristão —, o fruto crescerá. Não importa como seja a vida do cristão, o íruto do Espírito brotará. É inevitável. Isso nos serve de incentivo quando pensamos no quanto nossa carne parece o mármore, mas também é um desafio. Obriga-nos a perguntar, se somos cristãos há alguns anos: Há frutos crescendo em minha vida? Somos salvos pela fé, não por darmos fruto; mas não somos salvos pela fé infrutífera. Uma pessoa salva pela fé será alguém em quem o fruto do Espírito cresce.

Somos salvos pela fé, nâo por darmos fruto; mas não somos salvos pela fé infrutífera.

Terceiro, o fruto do Espírito tem raízes internas. Isso nada tem a ver com traços e características, mas com uma transformação muito mais profunda. Pense na macieira. As maçãs dão vida à árvore? Não — se você amarrasse maçãs aos galhos de uma árvore morta, isso não lhe daria vida! As maçãs não

G álatas 5.16-25

dão vida; elas são sinal de que a árvore está viva. Mas é a vida que produz o fruto, não o contrário.

Temos a tendência de ver os dons como sinal da obra do Espírito em alguém. Mas a Bíblia nunca faz isso. Judas e o rei Saul foram usados pelo Espírito para profetizar, realizar milagres e assim por diante, mas não tinham o coração renovado pelo Espírito.

Ser de fato conduzido pelo Espírito é desenvolver “o fruto do Espírito” (v. 22). Dons podem ou não operar a partir de um coração transformado pela graça, mas o desenvolvimento do fruto do Espírito só pode acontecer em um filho de Deus. O único teste de que o Espírito realmente passou a habitar em você como filho de Deus é o desenvolvimento do fruto do Espírito. A primeira parte desse fruto, que Paulo menciona aqui, é o “amor”; e, como ele diz em outro lugar, a uma igreja que superdesejava dons espirituais particulares: “Mesmo que eu falasse as línguas dos homens e dos anjos, mas não tivesse amor, seria como o metal que soa [...] eu nada seria [...] nada disso me traria benefício algum” (lCo 13.1-3).

Quarto, o crescimento cristão é simétrico. Paulo faz uso deliberado da palavra “fruto” no singular para descrever toda uma lista de qualidades que crescem na pessoa cheia do Espírito. Com isso, aprendemos um ponto muito importante para a compreensão e o discernimento do fruto do Espírito. O fruto verdadeiro sempre cresce em conjunto. Ele é um só. Jonathan Edwards explica isso da seguinte forma: “Existe uma concatenação das graças do cristianismo”. Isto é, uma parte do fruto do Espírito não cresce sem que todas as outras partes também cresçam.

Quando olhamos para a lista dos frutos, observamos que somos naturalmente mais fortes em alguns do que em outros. Mas nossos pontos fortes que independem do Espírito Santo devem-se ao temperamento natural (temos uma característica produzida pela química cerebral e/ou pelo treinamento

G álatas 5.16-25

precoce) ou ao autointeresse natural (aprendemos a exibir determinado traço a fim de lidar com alguma questão ou situação que tivemos de enfrentar). Por exemplo, algumas pessoas têm temperamento gentil e diplomático (amabilidade). Mas o sinal de que isso não se deve à obra do Espírito Santo é que tais pessoais, via de regra, não são ousadas ou corajosas (fidelidade). Em razão do que Paulo diz sobre a unidade do fruto, esse tipo de amabilidade não é a humildade espiritual real, mas apenas docilidade temperamental.

João ensina “Se alguém diz: Eu amo a Deus, e odeia seu irmão, é mentiroso” (ljo 4.20). Observe que ele não diz Se um homem ama a Deus, mas não ama seu irmão, falta-lhe equilíbrio. Não, ele o chama de mentiroso. O verdadeiro amor a Deus (amor) sempre se faz acompanhar do amor pelos outros (bondade). Sc não estiverem ambos presentes, nenhum deles estará lá em absoluto.

Existem muitos, muitos casos desse tipo. Algumas pessoas parecem felizes e cheias de vida (alegria) e têm facilidade para conhecer novas pessoas, mas são bem pouco dignas de confiança e não conseguem preservar as amizades (fidelidade). Isso não é ter alegria real, mas apenas ser extrovertido por natureza. Algumas pessoas parecem imperturbáveis e tranquilas (em paz), mas não são bondosas nem amáveis. Essa não é a paz real, mas indiferença e talvez cinismo. Tais características ajudam você a atravessar as dificuldades da vida sem se ferir continuamente, mas o dessensibilizam e o tornam menos acessível.

As partes do fruto

Vale a pena examinar de perto cada aspecto do fruto singular do Espírito (v. 22,23): 1

1. Agape = amor. Significa servir uma pessoa para o bem dela e por seu valor intrínseco, não pelo que ela pode nos proporcionar. Seu oposto é o medo: autoproteção e abusar das

G álatas 5.16-25

pessoas. Sua falsificação (imitação falsa) é o afeto egoísta, em que você é atraído por alguém e o trata bem devido ao modo como essa pessoa faz você se sentir acerca de si mesmo. 2. Chara = alegria, o deleite em Deus pela pura beleza e valor de quem ele é. Seu oposto é a desesperança ou o desespero, e sua falsificação, o entusiasmo baseado na experiência de bênçãos, não do Abençoador, provocando oscilações de humor conforme as circunstâncias. 3. Irene = paz, significando a confiança e o descanso na sabedoria e no controle de Deus, em vez de em nós próprios. Substitui a ansiedade e a preocupação. A versão falsa da paz é a indiferença, a apatia e a falta de interesse. 4. Makrothumia = paciência, a capacidade de enfrentar problemas sem perder a cabeça ou partir para o ataque a torto e a direito. Seu oposto é o ressentimento contra Deus e contra os outros. Sua falsificação são o cinismo e a falta de cuidado: Isso épequeno demais para eu me importar. 5. Chrestotes = benignidade, a capacidade de servir ao próximo de maneira prática e de modo a me tornar sensível, provenicnte de uma profunda segurança interior. Seu oposto é a inveja, que me torna incapaz de me regozijar na alegria alheia. E sua ·alternativa falsificada são as boas obras manipuladoras, ao fazer o bem ao próximo de modo que possa me gloriar e sentir que sou “bom o bastante” para os outros ou para Deus. 6. Agathosune = bondade, integridade, ser a mesma pessoa em qualquer situação, em vez de um impostor ou hipócrita. Não é o mesmo que ser sempre verdadeiro, mas nem sempre amoroso, livrar-se do peso no peito apenas para se sentir bem ou parecer melhor. 7. Pis tis =fidelidade, lealdade, coragem, ser plenamente confiável e fiel à própria palavra. Seu oposto é ser oportunista, amigo só nos bons momentos. Sua falsificação é ser amoroso, mas

G álatas 5.16-25

não verdadeiro, de modo que você nunca está disposto ao confronto ou ao desafio. 8. Prauias = amabilidade, humildade, abnegação. O oposto é ser superior ou voltado para o próprio interior. Humildade não é o mesmo que inferioridade (veja o próximo capítulo). 9. Egkrateia = domínio próprio, a capacidade de colocar o importante acima do urgente, em vez de ser sempre impulsivo ou descontrolado. A falsificação levemente surpreendente é a força de vontade baseada no orgulho, a necessidade de se sentir no controle.

Quando examinamos de perto o fruto do Espírito e compreendemos que um aspecto dele não pode ser contemplado isoladamente de qualquer um dos outros, entendemos que necessitamos crescer no fruto do Espírito muito mais do que pensamos. Quando paramos de considerar nossos dons como um sinal de que somos como Cristo, e deixamos de encarar nossos pontos fortes naturais como sinal de que somos como Cristo, mas desafiamos a nós mesmos a olhar para a natureza, unidade e definições do Espírito, temos um senso muito mais profundo do quanto essas coisas nos faltam.

D esenvolvendo o fruto do Espírito

Como, então, o fruto do Espírito pode fincar raiz em nosso coração e ser produzido em nossa vida? Paulo fornece a resposta de imediato.

Primeiro, precisamos lembrar que somos “de Cristo Jesus” (v. 24). Tudo que é dele é nosso. Nossa aprovação e acolhida pelo Pai não depende do nosso caráter ou das nossas ações, mas dele. Somos livres para reconhecer onde cedemos terreno para a sarx em nossa vida; livres para confessar onde não temos buscado acompanhar o Espírito; livres para perceber onde confimdimos nossos dons ou caráter natural com o fruto do Espírito.

G álatas 5.16-25

Segundo, por pertencermos a Cristo, crucificamos “a carne juntamente com suas paixões e desejos” (v. 24, literalmentc, “superdesejos”). “Crucificar a carne” é, na verdade, a identificação e o desmantelamento dos ídolos. Significa pôr fim ao poder governante e atraente que os ídolos têm sobre nossa vida, destruindo-lhes, assim, a capacidade de agitar e inflamar nossos pensamentos e desejos. Crucificar a sarx tem a ver com estrangular o pecado no nível motivacional, em vez de apenas nos colocarmos contra o pecado no nível comportamental. Transformações reais em nossa vida não podem ser leva-

__ das adiante sem discernirmos Temos de nos perguntar nâo apenas o que fazemos errado, mas por que fazemos errado.

nossa carne característica particular — os ídolos e desejos provenientes de nossa natureza pecaminosa individual.

Temos de nos perguntar não apenas 0 que fazemos errado, mas por que fazemos errado. Desobedecemos a Deus para conseguir algo que, assim nos dizem nossos sentimentos, precisamos ter. Esse é um “superdesejo”. Precisamos ter por quê? Porque é uma forma pela qual tentamos permanecer “debaixo da lei”. É algo que aprendemos a acreditar que nos autenticará. Crucificar a carne é dizer: Senhor; meu coração pensa que preciso ter esse determinado item ou não terei valor nenhum. Trata-se de um pseudossalvador. Mas pensar e sentir e viver desse jeito é esquecer 0 que significo para 0 senhor, como 0 senhor me vê em Cristo. Pelo seu Espírito, refletirei sobre seu amor por mim nele, até que isso perca seu poder de atração sobre minha alma.

Vale a pena observar rapidamente o que a crucificação da carne não significa. Paulo não está dizendo: Seja duro consigo mesmo, em especial com 0 seu corpo. Por exemplo, uma velha tradição manda abrir mão de algo durante a quaresma. Em geral isso significa recusar-se a satisfazer algumas necessidades de

G álatas 5.16-25

descanso, conforto ou prazer. Esse é um erro grave. É evidente, pela lista de atos da carne (v. 19-21), que muitos deles não têm nada a ver com o corpo (e.g., ambição, ciúme, inveja). O ascetismo — a negação do prazer — não os afeta.

Além disso, Paulo tampouco está ensinando: Basta dizer "não"para 0 pecado. Nossa sarx deseja viver debaixo da lei de alguma forma. Por instinto, ela quer descobrir uma forma de autossalvação. Apenas dizer “não”, sem examinar os motivos por baixo do comportamento errado, pode na verdade ser parte de uma nova forma de buscar a justiça própria, quando procuramos nos justificar dizendo “não” a atitudes e atos pecaminosos. Os gálatas estavam prestes a simplesmente dizer “não” a muitas coisas, mas de uma maneira que, Paulo os advertia, acabaria por deixá-los “separados de Cristo” (v. 4).

Por fim, Paulo não está falando de um processo passivo. O cristão pode dizer: “Estou crucificado com Cristo” (2.19), como se esse fosse um feito realizado por nós; estamos livres da condenação do pecado, como se já tivéssemos pago a penalidade nós mesmos, com nossa própria morte. A morte de Cristo foi a nossa morte. Mas a passagem de 5.24 fala de uma crucificação contínua a que nós mesmos submetemos nossa carne quando matamos a velha natureza dentro de nós.

Portanto, terceiro, precisamos andar “sob a direção do Espírito” (v. 25). Trata-se de um processo positivo (não do simpies abrir mão de coisas), de um processo ativo (que nós fazemos) e de algo mais do que simples obediência (embora não seja menos do que simples obediência). O Espírito é uma pessoa viva, que glorifica e enaltece a obra de Jesus. Uma vez que encontremos especificamente as falsas crenças particulares da nossa carne, que geram os “superdesejos” c nos levam a pecar, devemos substituí-las por Cristo.

Esse não é apenas um exercício intelectual. Devemos cultuar a Cristo, com a ajuda do Espírito Santo, adorando-o até nosso

G álatas 5.16-25

coração considerá-lo mais belo do que o objetivo que sentíamos que tínhamos de alcançar. Fazendo isso, decretaremos a morte da nossa velha natureza carnal, abrindo espaço para o fruto do Espírito se desenvolver; e descobriremos esse desenvolvimento do fruto, transformando-nos mais e mais na pessoa que ansiamos ser e que Deus deseja que sejamos.

para reflexão Perguntas

1. Examine a si mesmo. Você consegue ver o fruto do Espírito se desenvolvendo em sua vida? Como?

2. Você tem características naturais que poderiam ser confundidas com o fruto do Espírito?

3. Quais são os ídolos que precisam ser identificados e desmantelados em sua vida? Como você pode substituí-los por Cristo?

GÁLATAS - CAPÍTULO 5

VERSÍCULO 26

VERSÍCULOS 1-5

■ CAPÍTULO 6$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo lista junto os pecados "religiosos" (inveja, ambição egoísta, partidarismo) e os "irreligiosos"; quais pecados você costuma desculpar em si por considerá-los menos graves que os dos outros?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se Deus não classifica o ciúme como menos sujo que a embriaguez, que obra da carne você tem tolerado por ela ter aparência respeitável?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A advertência de Paulo mira a prática habitual sem luta, não o lapso arrependido; existe algum pecado ao qual você se entrega continuamente sem nem tentar resistir, e o que isso revela sobre seu coração?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Relacionamentos do Evangelho$t$, 15,
$conteudo$Que diferença o evangelho faz em seus relacionamentos? De que maneira ele afeta o modo como você se vê em relação àqueles que o cercam? E como você vê os outros em relação a si mesmo?

Essa é uma passagem muito curta, mas cheia de princípios práticos para o relacionamento com outras pessoas. O evangelho cria uma autoimagem inteiramente nova que não se baseia em comparações com os outros. Só o evangelho faz com que não nos sintamos nem autoconfiantes demais nem inferiorizados, e tão ousados quanto humildes. Isso funciona em relacionamentos com todo mundo. Em vez de nos compararmos com aqueles que estão “acima” ou “abaixo”, olhamos apenas para nossa própria responsabilidade de tomar o que temos e somos e oferecê-lo a Deus em um sacrifício de gratidão pelo que Cristo fez.

Fom e d e honra

Paulo acaba de encorajar os colegas cristãos a andar “sob a direção do Espírito” (5.25). Como vimos no último capítulo, isso envolve uma crucificação interna e diária dos nossos superdesejos pecaminosos e a adoração sincera de Cristo todos os dias, de modo que o fruto do Espírito cresça em nosso caráter.

G álatas 5.26—6.5

Agora Paulo quer mostrar de que modo o fato de acompanhar o ritmo do Espírito transformará nossos relacionamentos. No fundo, isso significa “não nos tornemos [ou, em alguns casos, deixemos de ser!] orgulhosos” (v. 26).

A palavra grega traduzida aqui como “orgulhosos” é kenodoxoi, que significa literalmente “vangloriosos” ou “vazios de honra”. Portanto, o orgulho é uma insegurança profunda, uma percepção de ausência de honra e glória, levando à necessidade de provar nosso valor para nós mesmos e para as demais pessoas. Isso, por sua vez, fixa nossa mente em nos compararmos com os outros. Quando parecemos melhor do que alguém em algum aspecto, nossa “fome de honra” se infla e faz com que nos sintamos ótimos. Quando parecemos inferiores a alguém, sentimo-nos desolados pela mesma razão. Além disso, a “fome de honra” pode nos tornar muito competitivos. Isso descreve o estado natural do nosso coração sem o evangelho.

Se formos orgulhosos, estaremos “provocando-nos uns aos outros e tendo inveja uns dos outros” (v. 26). “Provocar” — prokaleo — é sinal de competitividade, tendo o sentido de desafiar alguém para uma disputa. “Inveja” significa querer algo que pertence por direito a outra pessoa ou querer que essa pessoa não tenha tal coisa.

É possível que Paulo esteja apenas descrevendo quem é hostil (provocador) àqueles que inveja. O mais provável, no entanto (como acredita John Stott), é que ele esteja falando de duas maneiras diferentes de se relacionar com os outros. “Provocativa” é a postura de alguém que está certo de sua superioridade e menospreza alguém que ele entende que é mais fraco. “Invejosa” é a postura de quem tem consciência da própria inferioridade e se sente olhando “para cima”, para alguém que, na sua opinião, ocupa posição superior à sua.

Assim, Paulo está dizendo que tanto a superioridade quanto a inferioridade são uma forma de orgulho. Isso é impressionante e

G álatas 5.26—6.5

profundo. Tanto a pessoa que se sente superior quanto a que se sente inferior estão absortas em si mesmas. Em ambos os casos, você concentra todas as suas forças em como o outro faz com que você se sinta ou pareça, em vez de em como você faz com que o outro se pareça ou sinta. Outra maneira de explicar

Tanto a pessoa que se sente superior quanto a que se sente inferior isso é em termos de justiça pelas obras, o que estabelece uma ponte entre o versículo 26 e o tema subjacente da carta: a necessidade de viver estão absortas em si mesmas.

em conformidade com o evangelho e não retroceder à vida pelas obras. Tanto a pessoa “superior” quanto a “inferior” estão tentando adquirir valor por meio da competição, às custas dos outros. Ambas querem adquirir uma identidade pela derrota e superação de outros. Ambas querem ser orgulhosas e superiores.

A única diferença entre a pessoa arrogante e aquela dotada de baixa autoestima é que a pessoa inferior perdeu no jogo, desespera-se e inveja os que vê como “vencedores”. A pessoa superior, por outro lado, sente como se tivesse vencido momentaneamente e se compara sem parar com os outros para se certificar de que continua vencendo. Claro, grande parte do tempo estamos tanto provocando em uma área da nossa vida quanto invejando em outra.

Portanto, embora a provocação e a inveja pareçam opostos exatos, são duas formas de orgulho. Como C. S. Lewis salientou, humildade não é pensar menos de si mesmo: c pensar em si mesmo cada vez menos. A autoflagelação e a baixa autoestima não são marcas da humildade do evangelho. São apenas uma rejeição do evangelho, tanto quanto o orgulho e a confiança no próprio eu!

Ou seja, tanto o complexo de superioridade quanto o de inferioridade são, na raiz, frutos da insegurança e da inferioridade.

G álatas 5.26—6.5

Não passam dc dois resultados diferentes do nosso desejo de conquistar glória para nós mesmos, de sentir que valemos a pena como pessoas. O versículo 26 está dizendo, basicamente: Não permita que sua fome de honra 0 leve nem a desprezar nem a invejar as pessoas.

Provocativo ou Invejoso?

Ainda que possamos muito bem ter uma mistura das duas posturas, a maioria de nós tende naturalmente ou a provocar ou a invejar, como resultado do nosso orgulho. Como analisar em qual dos dois me enquadro? Perguntando:

■ Tenho a tendência de me expandir ou de me fechar feito um caramujo? ■ Tenho a tendência de iniciar discussões com as pessoas ou evito totalmente o confronto? ■ Tenho a tendência de me dar muito bem com indivíduos e grupos ou na maioria das vezes fico constrangido e intimidado perto de determinadas classes de pessoas? ■ Quando criticado, fico muito bravo e crítico e simplesmente revido o ataque? Ou me sinto bastante desencorajado e na defensiva, dou montes de desculpas ou desisto da conversa? ■ Costumo pensar Nunca, jamais faria 0 que essa pessoa fez} Ou costumo olhar para a pessoa e dizer: Nunca, jamais atingirei 0 nível de realização dessa pessoa}

Uma a u toim agem b a se a d a no ev an gelh o

O Espírito opera em nós para aplicar o evangelho à nossa autopercepção e visão dos outros. Ele cria uma autoimagem toda nova, a qual não se baseia em comparações com as demais pessoas.

Só o evangelho faz com que não nos sintamos nem autoconfiantes demais nem inferiorizados, e tão ousados quanto humildes. Isso funciona em relacionamentos com todo

G álatas 5.26-6.5

mundo. O evangelho é a única coisa que trata do orgulho, da vangloria. A intensidade com que ainda me esforço para garantir funcionalmente meu valor por meio do desempenho (i.e., ainda operando na justificação pelas obras) é a mesma intensidade com que demonstrarei superioridade ou inferioridade. Por quê? Porque, se sou salvo por minhas obras, posso ou ser confiante, mas não humilde (superior, por ainda sentir que estou “vencendo”), ou humilde, mas não confiante (inferior e invejoso, por sentir que estou perdendo). Separado do evangelho, serei forçado a ser superior ou inferior, ou a oscilar entre uma coisa e outra, ou a ser de um jeito com algumas pessoas e de outro jeito com outras. Estou o tempo todo preso entre esses dois modos de ser devido à natureza de minha autoimagem.

Mas o evangelho cria uma nova autoimagem, como vimos antes. Ele me humilha diante de todo o mundo, dizendo-me que sou um pecador salvo só pela graça. Mas também me encoraja diante de todo o mundo, dizendo-me que sou amado e honrado pelos únicos olhos do universo que de

O evangelho me dá um a ousadia e um a hum ildade capazes de coexistir.

fato contam. Portanto, o evangelho me dá uma ousadia e uma humildade capazes de coexistir e de crescer juntas.

Falando em termos práticos, você tem de usar o evangelho pregando-o a si mesmo bem no meio das situações em que esteja tentando agir em novidade de vida. Por exemplo, caso você se posicione sempre na defensiva para com as pessoas, deve usar o evangelho nesse exato momento, dizendo a si mesmo: O que você pensa de mim não é 0 que importa. A aprovação de Jesus Cristo, não a sua, é minha justiça, minha identidade, meu valor. Caso, porém, perceba que está menosprezando alguém, você precisa se lembrar do evangelho: O que eu penso a meu

G álatas 5.26—6.5

respeito não importa. Sou só um pecador, tanto quanto essa pessoa, e, como ela, não mereço 0 amor de Cristo por mim.

Quando nos sentimos orgulhosos — superiores ou inferiores —, precisamos fincar as raízes de nossa glória, de nosso senso de valor, naquilo que somos em Cristo e por intermédio dele. Temos de meditar e pedir ao Espírito que nos ajude a aplicar às nossas emoções a verdade de 3.26: Sou um filho de Deus —portanto, posso sentir-me seguro —pelafé em Cristo Jesus —portanto, sou humilde.

O orgulho nos relacion am en tos

No capítulo 5, Paulo expôs dois erros, ambos os quais se opõem ao evangelho: perder a liberdade buscando a salvação por meio do cumprimento das regras (moralismo) e abusar da liberdade pela rejeição absoluta das regras (hedonismo).

Quando se trata de relacionamentos, o orgulho do moralista se revela na necessidade que ele tem da aprovação alheia ou de que os outros confiem nele. Ele precisa da aprovação ou da confiança alheia para mostrar que está se saindo suficientemente bem. Mas isso significa que seu papel nos relacionamentos é essencialmente egoísta — os outros existem para validá-lo, para provar-lhe a justiça.

O orgulho hedonista, porém, se mostra na falta de compromisso. Ele precisa dos outros apenas pelo prazer ou satisfação que lhe oferecem; assim que o relacionamento implica maior sacrifício, o hedonista cai fora. Os relacionamentos dele são para servir a si próprio.

Por exemplo, quando o assunto é o relacionamento com os pais, o moralista ou fica tão preocupado em agradá-los que não consegue viver sem pensar neles o tempo todo, ou fica tão bravo com eles por controlarem ou negligenciarem sua vida que não consegue tampouco viver sem pensar neles. Se você é hedonista, isso significa que você não se relaciona com eles em absoluto, exceto quando lhe interessa.

G aiatas 5.26-6.5

O evangelho nos liberta da necessidade moralista de encontrar salvação no fato de agradar ou rejeitar nossos pais; ele nos diz que temos um Pai perfeito. E desafia a recusa do hedonista em pensar nos pais, porque somos obrigados a amá-los.

Vejamos outro exemplo, nos relacionamentos sexuais. O moralista tende a ver o sexo como algo sujo, ou pelo menos como um impulso perigoso, que o tempo todo leva a pecar. A consciência apreensiva do moralista o levará ou a evitar por completo a experiência sexual ou a desenvolver uma necessidade mal direcionada e impetuosa de vivenciá-la. Ambas as possibilidades provêm de um vácuo de glória interior, capaz de fazer do sexo um modo de preencher o vazio.

Um vácuo de glória interior é capaz de íazer do sexo um modo de preencher o vazio.

Já o hedonista enxerga o sexo como mero apetite biológico e físico. E provável que tenha uma relação menos complicada e problemática com o sexo, no entanto ele também desiste do profundo anseio do seu coração de se unir pelo sexo com alguém que seja completa, incondicional e permanentemente verdadeiro com ele. Assim, a satisfação profunda sempre lhe será ilusória.

Mas o evangelho nos mostra que o sexo faz parte da boa criação de Deus. E a sexualidade deve refletir o autossacrifício de Cristo. Ele se entregou por inteiro. Logo, não devemos buscar intimidade sexual para depois retornar ao controle de nossa vida. Se nos entregarmos pelo sexo, devemos nos entregar legal, social e pessoalmente — por inteiro. O sexo só deve acontecer no relacionamento do compromisso absoluto e permanente do casamento. Por meio da transformação de Cristo em nós, esse ideal é algo alcançável, embora nossos casamentos sempre incluam dois pecadores.

G álatas 5.26-6.5

para reflexão Perguntas

1. Usando as perguntas das páginas 170, você diria que tem a tendência de ser provocativo ou invejoso?

2. Como seu orgulho se revela em seus relacionamentos?

3. Como o fato de ter uma autoimagem baseada no evangelho pode mudar sua maneira de ver a si mesmo e aos outros? Quando você mais necessita pregar o evangelho para si próprio?

SEGUNDA PARTE

A judando nossos irm ãos

“Orgulhar-se” — buscar nossa própria glória nos relacionamentos — quer dizer que, por mais perto que estejamos de alguém, a maneira de tratarmos tal pessoa será sempre marcada pelo egoísmo. O evangelho destrói isso, capacitando-nos a viver como “irmãos” (6.1).

Irmãos (e irmãs) conseguem se encorajar na vida cristã. “Se alguém for surpreendido em algum pecado” (v. 1), a superioridade orgulhosa nos levará a menosprezar essa pessoa, a nos alegrarmos por não sermos como ela e a nos sentirmos justos em nós mesmos. Apontar para o pecado alheio nada mais será que sublinhar como parecemos bons em comparação. A inferioridade orgulhosa fará ou que invejemos a vida que o outro está levando, por mais pecaminosa que seja, ou a ansiar tanto por sua aprovação que não correremos nem o risco de apontar para o seu fracasso em viver em conformidade com o evangelho.

O que um “irmão”, que se sabe filho de Deus, fará? Paulo adverte para que não ignoraremos uma situação ao depararmos com alguém “surpreendido” em um pecado. Isso não quer dizer que confrontaremos de qualquer jeito todo mundo que virmos pecando. “O amor cobre um grande número de

G álatas 5.26—6.5

pecados” (lPe 4.8) — não devemos ser rápidos em criticar e falar às pessoas sobre suas falhas (veja também lCo 13.5,7). Mas não devemos ignorar alguém “surpreendido”, apanhado em um pecado. Isso indica que o comportamento pecaminoso é um padrão, e um pecado específico tem, em certo sentido, levado a melhor na vida dessa pessoa. E um hábito de comportamento pecaminoso que a pessoa não será capaz de vencer sem ajuda e sem intervenção externa. Os cristãos não devem ser nem rápidos em criticar nem receosos de confrontar.

Aceitaremos nossa responsabilidade de ajudar como irmãos cheios do Espírito. Paulo se dirige a “vós, que sois espirituais”

(v. 1), ou seja, àqueles que “andam pelo Espírito” (5.16,25). Ele não se refere a um grupo superespiritual de cristãos de elite; fala a cristãos comuns: Se vocês seguirem os desejos do

Não devemos ser nem rápidos em criticar nem receosos do confrontar.

Espírito, agirão assim. Essa responsabilidade pertence a absolutamente todos que estejam tentando levar uma vida cristã.

Qual será seu objetivo? “Restaurar essa pessoa com espírito de humildade” (v. 1). O termo grego traduzido como “restaurar” é katartizdo. Esse era o termo usado para pôr no lugar um osso deslocado. Um osso que se desloca provoca dor extrema porque não está mantendo o relacionamento natural, para o qual foi projetado, com as demais partes do corpo. É inevitável que o ato de pôr um osso no lugar produza dor, mas é a dor da cura. Significa que devemos confrontar, mesmo quando for doloroso, mas nosso confronto deve ter como objetivo instigar a mudança de vida e de coração.

Todavia, o “irmão” confrontará “com espírito de humildade”.

Paulo diz que essa gentileza só lhe sobrevirá se você cuidar de si mesmo, para não ser tentado também (v. 1). Um conselho difícil, mas prático. Não conseguiremos ser encantadores ao confrontar

G álatas 5.26—6.5

alguém se nos considerarmos incapazes de pecado similar ou igual. Se nos sentirmos acima da pessoa, nosso ar de superioridade ficará evidente e acabaremos destruindo, em vez de restaurar.

Levar os fardos uns dos outros

Confrontar alguém surpreendido em pecado é uma forma de “[levar] os fardos uns dos outros” (v. 2), embora, claro, não seja a única. No versículo 2, Paulo junta uma abordagem centrada no outro — que substitui o orgulho à medida que o Espírito firma as raízes do nosso senso de valor em Cristo — com a obediência à lei motivada pelo evangelho, que esboçamos no capítulo 5. Os irmãos que são espirituais (6.1) levarão “os fardos uns dos outros”, e assim estarão “cumprindo a lei de Cristo” (v. 2).

O versículo 2, portanto, espelha 5.13,14: “Sede servos uns dos outros pelo amor. Pois toda a lei se resume numa só ordenança, a saber: Amarás ao próximo como a ti mesmo”. A lei de Cristo é a lei que se resume como o amor ao próximo. Por que a lei do amor ao próximo seria chamada de lei de Cristo? Porque Cristo é o exemplo máximo e insuperável desse tipo de amor. Devemos amar os outros como Cristo nos amou (Jo 13.34; Ef 4.32). Embora toda a lei do Antigo Testamento pudesse ser resumida na ordem para amar, são a vida e a morte de Cristo que se tornam a corporificação suprema do que esse amor deveria ser. Ao olharmos para sua vida e atitude, assim como para todas as suas interações, temos, de certa forma, uma “lei”, um modelo surpreendente do tipo de vida que deveriamos levar.

Colocar 6.2 e 5.13,14 lado a lado nos mostra que ser “servos uns dos outros pelo amor” significa levar “os fardos uns dos outros”. Isso traz o elevado conceito do amor de volta à terra. Não devemos deixar que as pessoas carreguem seus fardos sozinhas. Tais “fardos” podem ser uma simples responsabilidade, como criar um filho ou reformar a casa. Ou então enfrentar uma dificuldade, um problema. Ao caracterizar responsabilidades

G álatas 5.26—6.5

e problemas da vida como “fardos”, Paulo ensina de maneira muito vivida e prática como o cristão se relaciona com os outros. Você não pode ajudar a carregar um fardo a menos que se aproxime bastante da pessoa que o está carregando, que se coloque em sua pele e aplique sua própria força debaixo desse fardo, de modo que o peso dele seja distribuído entre vocês dois, aliviando quem você se dispôs a ajudar. Da mesma forma, o cristão deve ouvir e entender, assumindo, física, emocional e espiritualmente, parte do fardo da outra pessoa.

E provável que Paulo esteja dando mais um golpe nos “judaizantes”, os falsos mestres que tentavam fazer com que os gálatas se sujeitassem à lei de Moisés. Tais exigências tinham sido descritas como “jugo”, um fardo, pela assembléia de Jerusalém, que se reunira e julgara a controvérsia sobre as obrigações dos cristãos gentios de obedecerem à lei cerimonial judaica (At 15.10). Paulo aconselha aos gálatas que, em vez de se colocarem debaixo do fardo do cumprimento da lei, deveriam levar os fardos uns dos outros — e essa, em última análise, é a maneira de cumprir a lei!

Você não pode ajudar com um fardo a menos que se aproxime bastante da pessoa que o está carregando.

“Lei de Cristo” significa moldar nossa vida inteira ao exempio de Cristo, motivados por grata alegria. E a vida centrada em uma pessoa em vez de em um código. Pesa sobre nós outro tipo de obrigação, diferente do anterior. Agora suportamos os fardos dos outros porque Cristo suportou o nosso. O versículo 2 poderia ser resumido assim: Suportem osfardos dos outros e, ao fazer isso, sigam os passos de Cristo, que suportou os de vocês.

Leve seu próprio fardo

No entanto, não conseguiremos suportar os fardos uns dos outros a menos que tenhamos uma visão apropriada de nós

G álatas 5.26-6.5

mesmos, baseada no evangelho. Os versículos 3-5 são, em essência, uma discussão curiosa sobre humildade e orgulho. O versículo 3 começa com “pois”; ou seja, se você cometer o erro delineado aqui, não será capaz de levar o fardo de ninguém, como manda o versículo 2.

Portanto, “se alguém pensa ser importante, não sendo nada” (v. 3), com certeza se considera em posição elevada demais para ter coração de servo, para olhar à sua volta, notar os fardos alheios e ajudar as pessoas a carregá-los. Trata-se de uma advertência dura, e não deveriamos relativizar a declaração de Paulo de que não somos “nada”. Naturalmente, o cristão vive cheio de esperança e confiança, mas isso em razão de Cristo. Como o próprio Jesus disse: “Sem mim nada podeis fazer” (Jo 15.5). E necessário ter a humildade centrada em Cristo para suportar os fardos alheios.

Entretanto, existe um “orgulho somente cm si mesmo” legítimo que o cristão pode ter (v. 4). Ele é completamente diferente do orgulho prepotente da superioridade ou da inferioridade, que faz de nós e da nossa glória o cenário das nossas motivações e atos. O orgulho leva o cristão a se comparar com os outros (v. 4), num convite para se sentir prepotente ou digno de alguma coisa. Por um lado, podemos realmente não ser muito amorosos, mas, se estivermos rodeados de pessoas egoístas, teremos grande orgulho em nosso amor relativo e não buscaremos crescer em amor. Por outro lado, podemos estar vivendo segundo nossas capacidades dadas por Deus, mas, como estamos rodeados de pessoas muito talentosas, ficaremos grandemente desencorajados e não apreciaremos o que Deus nos tem feito e dado.

Deveriamos, em vez disso, avaliar o nosso “próprio procedimento” (v. 4). Isso quer dizer que precisamos verificar nossas oportunidades (dons e provas, conforme Deus os tem permitido) e nossas reações a elas. Deveriamos nos medir, de certa forma, segundo nós mesmos.

G álatas 5.26—6.5

Relacionar o versículo 5 com o 4 ajuda a explicar uma aparente contradição nesse trecho. Como nos seria possível levar

“os fardos uns dos outros” (v. 2) quando “cada um carregará o seu próprio fardo” (v. 5)? A resposta está no fato de que existem dois tipos de fardo aqui. O termo grego traduzido como “fardos” no versículo 2 é um grande peso, mas, no versículo 5, o termo também traduzido como “fardo” é diferente e se refere a uma espccic de mochila. O versículo 5 fala que Deus tem dado a cada um de nós um conjunto diferente dc dificuldades e oportunidades, dc fraquezas e de dons. Esse é o “fardo” que nos pertence — nossa responsabilidade diante de Deus.

Portanto, não devemos nos comparar com os outros. Em vez disso, temos de olhar para nossas provações e deveres particulares e reagir a eles em obediência. Se encararmos a vida dessa maneira, julgaremos nosso dia a dia tendo como padrão quem temos sido e quem poderiamos ter sido. Quando virmos progresso, tiraremos dele o orgulho legítimo, sejamos ou não melhores ou piores do que outra pessoa qualquer. Não nos compararemos com alguém que fez menos do que nós (para experimentar o orgulho pretensioso) ou com alguém que fez mais (para sentir desespero ou inveja pretensiosos). Deus nos tem dado um fardo diferente para carregar e com o qual podemos servi-lo. Nossa tarefa é carregar o nosso fardo individual, não o de mais ninguém, de modo a agradar a Deus.

Nossa tarefa é

carregar o nosso fardo individual de modo a agradar a Deus.

Se encararmos a vida dessa maneira, seremos tardios em julgar os outros também. Seremos acríticos e generosos. Por exemplo, se virmos alguém impaciente, pensaremos: Não sei que pressões essa pessoa está enfrentando, nem com que nível de autocontrole emocional ela começou. Na verdade, talvez, esteja sen- do mais obediente a Deus do que eu hoje!

G álatas 5.26—6.5

Com humildade e gentileza, devemos ajudar os outros em suas tarefas e problemas, com todos os seus fardos. Mas:

Há um fardo que não podemos compartilhar [...] e que é nossa responsabilidade para com Deus no dia do julgamento. Naquele dia, você não poderá carregar minha mochila, nem eu a sua.1 para reflexão Perguntas

1. Há um pecado habitual do qual você precisa, com toda delicadeza, ajudar um irmão a se recuperar? Está disposto a ouvir as pessoas que querem restaurar você?

2. Que oportunidades Deus lhe tem dado de carregar os fardos alheios?

3. De que forma é libertador saber que você só responderá por seu próprio fardo, e não pela maneira como viveu comparada com a dos outros?

1John R. W. Stott, The message o f Galatians. The Bible Speaks Today (Downers Grove: IVP, 1968), p. 160. [edição em português: A mensagem de Gálatas (São Paulo: ABU, 1997)J.

VERSÍCULOS 6-18 GÃLATAS ■ CAPÍTULO 6$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo combate a "vanglória" que vive comparando você aos outros; com quem você anda se comparando ultimamente, e isso o tem deixado orgulhoso ou inferiorizado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se o evangelho lhe dá uma autoimagem que não depende de estar acima de ninguém, em que relação você ainda busca se sentir superior para se sentir bem?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Paulo manda restaurar com mansidão quem caiu e levar os fardos uns dos outros; de quem você tem se afastado por orgulho, quando o evangelho o chamaria a se aproximar e ajudar?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Semeando e Colhendo$t$, 16,
$conteudo$As palavras finais de Paulo podem, à primeira vista, parecer uma série de declarações desconexas, mas na verdade ele está fazendo duas coisas ao mesmo tempo em que anuncia sua despedida. Os versículos 6-10 são uma advertência final, e os versículos 11-18, um convite final. A advertência e o convite de Paulo são basicamente a mesma mensagem, aquela que dá sustentação a cada linha da carta: vivam pelo evangelho!

O professor e o aluno

A primeira instrução de Paulo nesse trecho tanto olha para trás, para a porção anterior da carta, quanto para a frente, para a advertência que ele tem a fazer.

Nos versículos 4,5, Paulo disse que todo indivíduo é responsável diante de Deus por responder com obediência às oportunidades a ele oferecidas por Deus. Não há como repassar essa responsabilidade. Agora, no entanto, Paulo deseja certificar-se de que essa declaração não seja entendida como uma promoção de algum tipo de individualism o radical. A fim de evitar o autoengano, todos necessitamos nos submeter a mestres que se submetem, por sua vez, a outros mestres.

Todo cristão deve se enquadrar na descrição daquele “que está sendo instruído na palavra” (v. 6). O termo grego para “o que está sendo instruído” é katechoumeno$\ aquele que é catequizado. Isso mostra como era importante oferecer aos

G álatas 6.6*18

novos convertidos um corpo de doutrina cristã (catecismo), ministrado por um “instrutor”. Paulo espera que todo cristão novo receba esse ensinamento básico de discipulado c deseja que ele reparta “todas as coisas boas com aquele que o instrui” (v. 6). Koinoneo significa “repartir, compartilhar” ou “ ter compa­ nheirismo”. Podia ser interpretado simplesmente como uma afirmação de que aluno e professor devem cumprir a tarefa da instrução como plenos parceiros. O aluno não é um fantoche passivo, nem o professor, um ditador autoritário.

Mas é quase certo que a expressão “todas as coisas boas” se refira a apoio financeiro. Tanto o aprendiz quanto o mestre se beneficiam se houver apoio para o instrutor realizar seu trabalho em tempo integral. A luz dessa ideia, a palavra koinoneo torna-se ainda mais rica, pois o salário do mestre cristão não deve ser visto como um pagamento. Antes, trata-se de uma relação de “companheirismo”. Como os professores compartilham os dons espirituais que Deus lhes deu com o aluno, também os alunos compartilham os dons financeiros dados por Deus com o professor.

Portanto, deveriamos dar com generosidade às equipes de nossas igrejas. Não como “consumidores” que vão a uma igreja e se limitam a saqueá-la de seus benefícios, sem contribuir de maneira significativa com ela. Mas essa contribuição precisa se fazer acompanhar da atitude correta. O ensino cristão não é só mais

Deveriamos dar com generosidade, nâo como "consumidores" que vão a um a igreja e se limitam a saqueá-la de seus benefícios. um serviço a ser pago, mas uma irmandade rica, um compartilhamento mútuo das dádivas divinas.

Paulo dá imediata sequência à ideia de apoiar aqueles que nos ensinam a verdade do evangelho com a advertência: “Não

G álatas 6.6-18

vos enganeis” (v. 7). De certa forma, esse é o tema da epístola inteira de Gálatas! Presume-se que muitos daqueles cristãos jovens tivessem sido catequizados pelo próprio Paulo; agora corriam grande perigo de serem enganados pelos falsos mestres. Paulo argumenta que os tais mestres não mantêm uma relação de “companheirismo” com os gálatas; antes, usam-nos para conquistar honra e aprovação para si próprios (4.17). Delineando o relacionamento apropriado mestre/discípulo no versículo 6, Paulo introduz esse apelo final para resistir aos falsos e inadequados mestres. “Não vos enganeis” é o início do clímax, o último apelo de Paulo para se apegarem à verdade.

Colher o que você sem eia

Em seguida, Paulo faz uma advertência severa. Alguns a têm chamado de “lei do grande retorno”. Paulo usa uma das experiências mais familiares na história da humanidade: o processo agrícola da semeadura e colheita. “Tudo o que o homem semear, isso também colherá” (v. 7).

Na agricultura ou na jardinagem, esse é um princípio absoluto, e Paulo parece querer que consideremos ao menos dois aspectos dele. Primeiro, 0 que quer que você semeie, será o que colherá. Se lançar sementes de tomate à terra, não obterá milho, não importa o quando deseje que o milho cresça! Segundo, o que quer que você semeie, você haverá de colher. Mesmo que a semente fique no solo sem produzir nenhum efeito aparente por longo tempo, ela brotará. Não é a ceifa que determina a colheita, mas a semeadura.

Essa lei do retorno é tão irrefreável no campo moral e espiritual quanto no da agricultura. “Deus não se deixa zombar” (v. 7), ou seja, não se pode tratá-lo com leviandade. “Quem semeia para a sua carne, da carne colherá ruína” (v. 8). Isso não quer dizer que Deus esteja sentado no céu a procura de alguém contra quem se vingar em razão de quaisquer menosprezos ou

G álatas 6.6-18

insultos. A imagem da semeadura/colheita indica que o processo de consequências morais é muito mais natural e orgânico do que isso. A referência de Paulo à agricultura natural indica que o universo moral tem processos. O pecado contra Deus cria tensões no tecido do universo moral/espiritual, assim como comer alimentos gordurosos cria tensões no tecido físico do seu coração. Se espalhar mal sua semente, você colherá uma produção ruim (e pobre). Se comer alimentos gordos, você colherá um coração pobre (e a morte prematura). Se ceder à sua carne, você colherá o colapso e a ruína espiritual. Para deixar mais clara a ideia, a palavra “ruína” também pode ser traduzida por “corrupção” ou “desintegração”. Paulo está dizendo que o pecado faz as coisas se desintegrarem.

A ruína que colhemos vem da ruptura do “tecido” do universo moral, da mesma forma como determinado comporta- mento tem o poder de romper o tecido e a coesão físicos. Existem inúmeras maneiras pelas quais a semeadura para satisfazer a carne colhe ruína. O livro inteiro de Provérbios é resumido por Gálatas 6.7,8! Semear desonestidade rompe o tecido dos relacionamentos e cria a ruína da solidão. Semear inveja e ciúmes rompe o tecido da satisfação e cria a ruína da amargura. E assim por diante, para sempre.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Paulo diz que cada um é responsável diante de Deus, mas também que todos precisamos nos submeter a mestres; em que ponto você usa a graça para escapar de prestar contas a alguém?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se até os instruídos precisam ser "catequizados" para evitar o autoengano, de que verdade do evangelho você anda fugindo por não querer ser confrontado?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Paulo pede que se sustente quem ensina a Palavra; o que sua maneira de dar tempo, dinheiro e atenção revela sobre onde de fato está o tesouro do seu coração?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$I O pecado faz as coisas se desintegrarem.$t$, 17,
$conteudo$O que quer que semeie, você colherá — o pecado sempre gera ruína, nunca alegria e vida. O que quer que você semeie, colherá — os pecados voltarão para ficar; é impossível manter longe as consequências.

Mas a advertência de Paulo aqui deve ser interpretada à luz de todo o restante da carta. Ele quer dizer algo muito específico quando fala de semear “para a sua carne” (v. 8). Ele já mostrou que a carne, sarx, é a parte do nosso coração que deseja manter o controle da nossa vida, agindo como uma espécie de salvador

G álatas 6.6-18

e senhor próprios — resistente ao evangelho da graça sem preço e buscando continuamente fazer por merecer nossa própria justiça.

Ao longo de toda a epístola, Paulo indicou que os cristãos podem resvalar para algum tipo de escravidão do pecado, o que acontece muitas vezes. Durante esse período de tempo ou nessa área da vida, eles podem também perder o contato com o evangelho. Nessa situação, não deixam de ser cristãos, salvos pela graça.

Mas Paulo também advertiu que, se o evangelho é rejeitado e é adotada formal e completamente a justiça pelas obras, a escravidão e a destruição também serão completas. E provável que ele tivesse em vista ambos os níveis aqui. Se, como cristãos, falhamos em aplicar o evangelho e vivemos “na carne”, tentando fazer por merecer nossa salvação por outros meios, deparamos com uma perda da coerência, da alegria e da força na nossa vida. E se alguém rejeita o evangelho e vive só para a carne, buscando e servindo alguma outra coisa que não Cristo como seu salvador, então esse alguém colherá ruína eterna, em vez de vida eterna.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$"O que o homem semear, isso também ceifará"; que sementes você tem plantado "na carne", supondo que conseguirá manter longe as consequências?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Semear para a carne é tentar ser senhor e salvador de si mesmo; em que área você ainda resiste à graça sem preço, buscando fazer por merecer a própria justiça?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se mesmo um cristão pode resvalar e perder o contato com o evangelho numa certa área, onde sua vida hoje anda sem alegria e força, sinal de que ali você está vivendo na carne?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A advertência é dura, mas a promessa é maravilhosa. I$t$, 18,
$conteudo$A advertência é dura, mas a promessa é maravilhosa. “Quem semeia para o Espírito, do Espírito colherá a vida eterna” (v. 8). Se vivermos pelo Espírito, desfrutaremos da aprovação, da certeza, da satisfação e da alegria da vida cristã agora e saberemos que ela continuará além da morte.

Sem eand o bem

Sendo assim, como podemos ser alguém que “semeia para o Espírito” (v. 8)? Obedecendo a Deus pela alegre gratidão que vem de conhecer nosso status como seus filhos. Ao agirmos assim, os ídolos que controlavam nossa vida são desautorizados e ficamos livres para viver para Deus.

G aiatas 6.6-18

Dia após dia, semear para o Espírito requer que “não nos cansemos de fazer o bem” (v. 9). Há sempre uma defasagem entre semear e colher. No caso de novos agricultores e jardineiros em especial, é certo que experimentarão muita ansiedade, de olho na semente adormecida durante semanas c mais semanas, com a sensação de que ela jamais irá brotar. Mas ela sempre brota no final. Paulo advertiu os pecadores de que, embora por muito tempo seu pecado pareça não os ter encontrado, em algum momento ele o fará. Agora ele quer encorajar aqueles que vivem para Cristo. Quem pratica o bem um dia verá os frutos e benefícios.

Paulo está encorajando esses jovens cristãos a não desanimarem porque, assim como os jardineiros inexperientes poderíam deixar de regar e cortar fora a erva daninha em seu desânimo por causa do lento desenvolvimento da semente, também os cristãos poderíam deixar de perseverar em seu serviço e ministério. A falta de acompanhamento no ministério consegue impedir a “colheita”, como acontece na jardinagem.

Em que consiste a semeadura do “fazer o bem”? E fazer “o bem a todos, principalmente aos da família da fé” (v. 10). Isso é amplo c abrangente em sua simplicidade. Primeiro, mostra o que é a vida cristã; não é reuniões, programas ou mesmo conversões acima de tudo, mas fazer o bem à pessoa que está na sua frente, dando-lhe o que for melhor para ela.

Segundo, o verbo “façamos” mostra que devemos dar aos outros o que quer que o amor venha a discernir como suas necessidades. Claro, compartilhamos o evangelho e evangelizamos, mas apenas como um meio para atingir o fim de amar as pessoas. (Não as amamos como um meio para atingir o fim de convertê-las!) Contudo, esse “façamos” indica que não devemos nos restringir ao evangelismo e ao discipulado. Precisamos amar em ações, tanto quanto em palavras. Devemos lhes dar toda ajuda necessária para suprir qualquer carência que estiver

G álatas 6.6-18

ao nosso alcance minimizar, seja material, social ou espiritual. Essa pequena frase mostra que o ministério cristão engloba ajudar em uma casa de recuperação tanto quanto explicar para alguém como entregar sua vida a Cristo.

Esse amor deve ser direcionado “a todos” (v. 10). Para não nos sentirmos sufocados de imediato, Paulo já havia acrescentado “enquanto temos oportunidade” — não se espera que satisfaçamos pessoalmente todas as necessidades de todo o mundo! Devemos olhar à nossa volta e ver onde esta-

"Façamos" indica que não devemos

mos e quem está perto.

Acima de tudo, no entan­

nos restringir ao evangelismo e ao

to, esse amor é para ser dado “aos da família da fé” (v. 10), uma expressão maravilhosa discipulado.

que mostra que todos os cristãos são uma família. Os cristãos são todos irmãos e irmãs na casa de Deus (4.5). Temos de fazer o bem exaustivamente àqueles que participam da mesma irmandade conosco.

Esse é o estilo de vida a partir do qual, “se não desistirmos, colheremos no tempo certo” — vida real, plena, duradoura (v. 9). No curto prazo, essa vida requer um número tremendo de sacrifícios. Laços emocionais prendem seu coração a pessoas instáveis, obrigando-o a experimentar grande agonia que poderia ser evitada. Você tem de se afastar de muitas opções que estariam à sua disposição se não fossem seus relacionamentos do ministério. Conta com menos dinheiro, uma vez que dá com grande generosidade para indivíduos, ministérios e causas. Os custos são altos, mas as recompensas, Paulo dá a entender, são tão grandes quanto o valor da colheita é maior do que o custo da semente! Primeiro, sempre temos a satisfação direta c profunda de ver vidas transformadas (veja Mt 9.37). Segundo, podemos ter a satisfação direta e profunda de ver famílias e comunidades,

G álatas 6.6-18

até cidades, transformando-se em lugares bons e agradáveis de se viver. Terceiro, podemos chegar a ver pessoas cujos fardos ajudamos a suportar se tornarem sustentadoras de fardos alheios, vidas transformadas que começam a transformar outras vidas.

Mas precisamos perceber que existem colheitas mais profundas acontecendo mesmo quando não conhecemos grande sucesso exterior. Descobriremos nosso próprio caráter passando por mudanças profundas através do ministério. Nossa consciência será limpa e nosso coração feliz, uma vez que agora somos menos autoindulgentes. Desenvolveremos um caráter menos egoísta e mais satisfeito, que nos fará bem quando estivermos debaixo de pressão. Talvez não colhamos rápido e talvez não vejamos tudo que colhemos; mas podemos saber que há uma grande colheita para aqueles que semeiam para o Espírito.

para reflexão Perguntas

1. Você consegue pensar em épocas da sua própria vida em que a semeadura para satisfação de sua natureza pecaminosa o obrigou a colher “ruína”?

2. Como você está colhendo para o Espírito, no conjunto específico de circunstâncias que lhe foi dado por Deus?

3. De que modo esses versículos têm motivado você a “fazer o bem a todos”? Existem mudanças particulares que o Espírito o tem levado a implementar?

SEGUNDA PARTE

Em su a m ão

Agora Paulo toma a pena do seu escriba. Vimos ao longo de toda a carta que esse não é um tratado teológico, mas, sim, a carta de um homem que devota amor profundo aos homens e mulheres aos quais escreve. Aqui está seu último apelo, seu

G álatas 6.6-18

último convite para que os gálatas mantenham a confiança no evangelho para a salvação e o vivenciem dia após dia. E ele resolve redigi-lo “de próprio punho” (v. 11).

Primeiro, Paulo quer convencê-los de que o verdadeiro cristianismo é uma questão de transformação interior, não de observância exterior. É substancial, não superficial. De novo, ele se concentra nas motivações dos falsos mestres. Eles “desejam ostentação exterior” (v. 12).

Paulo já disse que a pregação do evangelho é terrivelmente ofensiva para o coração humano (5.11,12). As pessoas consideram um insulto alguém lhes dizer que são fracas e pecadoras demais para fazer qualquer coisa capaz de contribuir para a própria salvação. O evangelho é ofensivo para pessoas de mente liberal, que o acusam de intolerância por ele declarar que o único modo de ser salvo é pela cruz. Ele é ofensivo para pessoas de mente conservadora, por declarar que, sem a cruz, as pessoas “boas” estão em apuros tanto quanto as “más”. Enfim, o evangelho é ofensivo porque a cruz se levanta contra todo plano de autossalvação. O mundo gosta de “religião” e “moralidade” em geral. Acha que a religião moralista é uma coisa boa para a sociedade. Mas o mundo fica ofendido com a cruz. De modo que os indivíduos que amam a cruz são “perseguidos” (v. 12).

A cruz é ofensiva por natureza! E só conseguimos entender sua docilidade se primeiro soubermos lidar com seu ultraje. Para quem compreende a cruz, ou ela é o ' maior bem da sua vida ou lhe é repulsiva. Se não for nem uma coisa nem outra, ela não foi compreendida.

Só conseguimos entender a docilidade do evangelho se primeiro soubermos lidar com seu ultraje.

O falso salvador que os judaizantes adoram é a aprovação. É ela que está por trás de seu ensino legalista. Eles têm uma

G álatas 6.6-18

única razão para ensinar o que ensinam: “somente para não serem perseguidos por causa da cruz de Cristo” (v. 12). Querem se orgulhar (v. 13). Adotaram a religião pela fama, prestígio e honra que pode lhes proporcionar no mundo. Seu ministério, como vimos em 4.17,18, é uma forma de autossalvação.

Em consequência dessa preocupação com as aparências e com a aceitação pelo mundo, os falsos mestres oferecem uma religião voltada, acima de tudo, para os aspectos exteriores e para comportamentos (circuncisão e lei cerimonial), em vez de para a transformação interior do coração, das motivações e do caráter. O evangelho acontece de dentro para fora: a transformação interior do coração leva a nova motivação e novo comportamento. Eles, ao contrário, agem de fora para fora: focados no comportamento, jamais lidando com o coração, permanecendo sempre superficiais.

Paulo de novo faz a crítica mais rcveladora a esse tipo de religião: “Nem mesmo esses que se circuncidam guardam a lei” (v. 13). O legalismo bíblico não pode funcionar em seus próprios termos. Se de fato estudarmos a lei e analisarmos o que ela ordena (e.g., “Amarás ao próximo como a ti mesmo”, 5.13,14), veremos que é impossível nos salvarmos obedecendo a isso. Uma religião baseada na exterioridade e no comportamento como forma de salvação pode instigar o orgulho e produzir popularidade, mas não pode dar a vida eterna que promete.

De qu e vo cê se orgulha?

Em última análise, diz Paulo, o cerne da sua religião é aquilo de que você se orgulha. No fundo, qual o motivo pelo qual você pensa estar em um relacionamento adequado com Deus?

Se a cruz é só uma ajuda, mas você tem de completar sua salvação com boas obras, na verdade são as suas obras que fazem a diferença entre você rumar para o céu ou não. Portanto, você se orgulha da sua carne (v. 13), dos seus próprios esforços.

G álatas 6.6-18

Que mensagem mais atraente: ser capaz de se autoparabenizar por ter reservado para si um lugar no céu!

Todavia, se você compreende o evangelho, deposita seu “orgulho” só e exclusivamente na cruz. Nossa identidade, nossa autoimagem, é baseada naquilo que nos dá um senso de dignidade e importância — aquilo de que nos orgulhamos. A religião induz a que nos orgulhemos de alguma coisa a nosso respeito. O evangelho, a que nos orgulhemos da cruz de Jesus. Isso significa que nossa identidade em Jesus é confiante e segura — orgulhamo-nos mesmo\ —, mas, ao mesmo tempo, humilde, por basear-se em um senso profundo de nossos erros e miséria.

Portanto, o evangelho pode bem ser resumido cm uma frase notável: “Longe de mim orgulhar-me, a não ser na cruz de nosso Senhor Jesus Cristo, pela qual o mundo está crucificado para mim, e eu para o mundo” (v. 14).

Sou salvo exclusiva e completamente em razão da obra de Cristo, não da minha. Ele reservou um lugar para mim no céu, o qual me concede de graça. “Longe de mim orgulhar-me” — não tomo para mim crédito nenhum por minha posição com Deus — “a não ser na cruz”; o que Cristo fez é agora algo de que me orgulho. Orgulhar-se é exultar com alegria por algo em que também se tem alto nível de confiança. Saber que você é salvo só pela obra de Cristo produz uma alegre confiança digna de orgulho; não a autoconfiança, mas a confiança em Cristo.

E se de fato só me orgulho em Cristo, acontece uma reviravolta surpreendente em minha vida. O mundo está morto para mim. Primeiro, como diz Stott, o cristão não precisa dar importância ao que o mundo pensa dele. Mas é provável que Guthrie se aproxime mais da essência de Paulo ao dizer: “O mundo natural [...] deixou de ter quaisquer reivindicações sobre nós”.1

1Galatians, New Century Commentary. (London: Marshal, Morgan & Scott, 1973), p. 151.

G álatas 6.6-18

Paulo declara aos cristãos que nada do que existe no mundo agora tem qualquer poder sobre eles. Veja bem, ele não diz que o mundo está morto e ponto-final, mas, sim, que está morto para ele, Paulo. O evangelho destrói seu poder. Por quê? Como vimos dizendo o tempo todo, se não há nada no mundo em que situe minha justiça ou salvação ou de que me orgulhe, então não há nada no mundo Se de fato só me orgulho em Cristo, acontece um a reviravolta surpreendente em m inha vida.

que me controle — nada que eu precise ter.

Paulo não está afirmando que nada tenho a ver com as pessoas e coisas do mundo. Por irônico que pareça, se não devo ter nada a ver com o mundo e preciso me afastar dele, então o mundo ainda exerce muito poder sobre mim! Paulo quer dizer que o cristão agora está livre para desfrutar do mundo, pois não necessita mais nem temê-lo, nem adorá-lo.

Portanto, ele confirma o que disse lá atrás, em 5.6: “Nem a circuncisão nem a incircuncisão são coisa alguma, mas, sim, o ser nova criação” (6.15). As realizações religiosas ou morais e os fracassos religiosos ou morais são irrelevantes quando se trata de salvação, porque ela não tem nada a ver com o que eu fiz, mas, sim, com o que Cristo fez.

O cristão agora está livre para desfrutar do mundo, pois não necessita mais nem temê-lo, nem adorá-lo.

Em razão do evangelho do Cristo crucificado, diz Paulo, não me sinto inferior a ninguém nem intimidado por ninguém — a circuncisão não significa nada. E, em razão do evangelho, não me sinto superior a ninguém nem desprezo ninguém — a incircuncisão não significa nada.

G álatas 6.6-18

Tudo que importa é termos sido feitos “nova criação” (v. 15) por intermédio de Cristo crucificado. O evangelho muda meu futuro, conferindo-me um lugar na recriação perfeita de Cristo. E o evangelho transforma meu presente, conferindo-me uma autoimagem inteiramente nova e um modo todo novo de me relacionar com todas as pessoas.

A “nova criação” do versículo 15 está em paralelo com “a fé que atua pelo amor”, de 5.6. Para Paulo, as duas coisas são uma só na essência. O evangelho cria nova motivação para a obediência: o amor grato que se origina de uma visão de fé do que Cristo fez. Essa nova motivação nos renova de dentro para fora. E um novo nascimento, uma transformação sobrenatural do caráter, uma nova criação.

Portanto, os versículos 14,15 resumem o que significa confiar no que Cristo fez, em vez de no que estou fazendo. Paulo diz: O evangelho muda aquilo de que fundamentalmente me orguIho, transforma toda a base da minha identidade. Nada no mundo inteiro tem qualquer poder sobre mim; sou livre, afinal, para desfrutar do mundo, pois não preciso dele. Não preciso me sentir inferior nem superior a ninguém e estou sendo reconstruído, transformado em algo e alguém completamente novos.

Uma vid a d e paz

Se os versículos 14,15 resumem o capítulo 5, o versículo 16 (que passa despercebido com facilidade, depois de uma oração tão sentimental e surpreendente) sintetiza o que Paulo dizia no capítulo 3. Aqui, ele chama viver pelo evangelho de “norma” (v. 16) — um modo de vida, um alicerce para tudo. Todo aquele que estabelecer o evangelho de Cristo como sua “norma”, diz ele, encontrará “paz e misericórdia”. E será membro do “Israel de Deus”. Os cristãos são todos filhos de Abraão, herdeiros da promessa que Deus fez a ele.

Paulo conclui salientando o fato: “trago no corpo as marcas do sofrimento de Jesus” (v. 17). Que sofrimentos são esses?

G álatas 6.6-18

É provável que se referisse a suas cicatrizes literais deixadas pela tortura, pela prisão e pelas surras recebidas por causa de Cristo. Os mestres do evangelho falso, popular, da autossalvação, não tinham nada disso porque o mundo amava ouvir sua mensagem. Mas Paulo é um ministro verdadeiro, um apostolo verdadeiro, como ele argumentou nos capítulos 1 e 2. Não duvidem de mim, diz ele. Tenho as marcas reais da autoridade apostólica — não grandiosidade nem riqueza, mas sinais de sofrimento e fraqueza.

A "graça" é a porta de entrada para a vida cristã, o cam inho para nela continuar e tudo de que sempre necessitaremos ao longo dela.

E então ele se despede. Mas, até nesse momento, Paulo lembra os gálatas da mensagem de sua carta. “A graça do nosso Senhor Jesus Cristo” (v. 18) é a porta de entrada para a vida cristã, o caminho para nela continuar e tudo de que sempre necessitaremos ao longo dela. Começamos pela graça, sendo justificados pela fé no que Cristo fez. Prosseguimos pela graça, não por nada que fazemos. O evangelho da graça é o que os gálatas precisam conhecer e amar no seu “espírito”. Não se trata de um conjunto de verdades abstratas, mas de um modo de vida. Uma vida de profunda realização e segurança, eterna no porvir. Amém.

para reflexão Perguntas

1. Qual o impacto do versículo 14 sobre você? Como ele o desafia?

2. Em que áreas da vida você tem conhecido a paz de viver pelo evangelho? Em quais você tem posto essa paz a perder, vivendo para a aprovação do mundo?

3. Se tivesse de resumir a mensagem de todo o livro de Gálatas em poucas palavras, o que você diria?

O DEBATE RECENTE APÊNDICE

Desenvolveu-se recentemente uma “nova perspectiva” para o significado da expressão “obras da lei” em 2.16; 3.2,5,10.

Muitos intérpretes acreditam que Paulo se refere apenas à lei cerimonial mosaica — da circuncisão, das ordenanças relativas à dieta e outras que versam sobre a “pureza” ritual. Segundo essa visão, “obras da lei” não é o desempenho moral como um todo, mas a adoção dos costumes culturais judaicos e das marcas de fronteiras étnicas. Dessa forma, os judaizantes não estão exortando os cristãos gálatas a adotar o sistema da salvação pelas obras (i.e., a ideia de que você deve obedecer a determinadas leis para se acertar com Deus). Em vez disso, diz o argumento, esses mestres insistem em que os cristãos gentios adotem marcas étnicas judaicas e se tornem culturalmente judeus.

Portanto, por essa “nova perspectiva”, os judaizantes não são legalistas, mas nacionalistas, de modo que Paulo não está se opondo à salvação pelas obras, mas à exclusividade racial e étnica. Isso quer dizer que seu propósito com esse livro de Gálatas é insistir em que todas as raças e classes se sintam em igualdade de condições à “mesa de Deus”, porque todos somos um em Cristo.

Dediquei bastante tempo a pesar os prós e contras dessa “nova perspectiva” e creio que ela seja muito útil em vários sentidos. Entretanto, não consegue subverter a essência da abordagem clássica, histórica. Este não é lugar para uma análise aprofundada, e o que se segue com certeza não tem a pretensão de dar a última palavra, mas aqui estão minhas breves conclusões.

Não se pode provocar uma separação definitiva entre nacionalismo e legalismo como se fossem coisas distintas. Na verdade, o livro de Gálatas trata de uma controvérsia que tinha em seu cerne a superioridade e o orgulho raciais/étnicos. Em

APÊNDICE: o d eb ate recente

2.11-15, está claro que Pedro é prisioneiro dessa ideia, tendo sido influenciado pelos judaizantes (2.12). Esses mestres estavam impondo os marcos limítrofes da cultura judaica aos convertidos cristãos gentios. Ou seja, é provável que as obras da lei também incluíssem isso.

No entanto, o nacionalismo é uma forma de legalismo, que significa acrescentar qualquer coisa a Jesus como um requisito para a plena aceitação por parte de Deus. A superioridade moral proveniente das boas obras ou da linhagem racial e cultural brota da mesma raiz espiritual. O evangelho significa que somos salvos pelo que Cristo faz, não pelo que nós fazemos ou somos. Assim, quando os judaizantes chamaram os convertidos judeus às obras da lei, convidaram-nos a adotar a identidade cultural judaica, mas também os atraíram a uma forma de autossalvação. A realização humana estava se tornando a base da posição que ocupavam perante Deus.

Pode-se ver isso no modo como Paulo fala das “obras da lei” em Romanos (veja 3.20,27,28). Por um lado, a expressão carrega em si uma importância étnica para os judeus. Era pelas obras que Israel buscava se estabelecer em seu relacionamento com Deus (Rm 9.30—10.3). Contudo, por outro lado, Paulo associa as obras da lei ao “orgulho” (Rm 3.27,28).

O entendimento disso é chave porque, ao longo das Escrituras, “orgulhar-se” é usado em relação àquilo em que você confia e em que se gloria (veja Jr 9.23,24; ICo 1.31). Paulo diz que gloriar-se ou confiar em si mesmo é o que sustenta as obras da lei. Ou seja, se as obras da lei podem significar a confiança no nacionalismo (ou a vangloria nele), não podem significar só isso; o nacionalismo é uma forma de autossalvação, ou legalismo. E é a isso que Paulo se refere quando usa a expressão “obras da lei”.

Portanto, em última análise, ainda precisamos ler o livro de Gálatas como a defesa de Paulo do evangelho da graça

APÊNDICE: o d eb ate recente

abundante, em oposição à conquista do favor de Deus por meio de realizações ou status humanos. A nova perspectiva não consegue desbancar o entendimento clássico de Gálatas. De qualquer forma, o debate sobre a expressão “obras da lei” nos é útil em dois sentidos.

Primeiro, ele nos revela a sutileza com que se pode minar o evangelho na igreja e na comunidade cristã. A nova perspectiva nos mostra que os judaizantes não eram legalistas absolutos a rejeitar por completo a Cristo. Como veremos, não estavam dizendo: Você não precisa de Jesus. Se for uma boa pessoa, irá para

0 céu do mesmo jeito. E bastante improvável que os gálatas se deixassem enganar com tanta facilidade por uma contradição assim clamorosa da mensagem do evangelho que os salvara.

Em vez disso, os judaizantes diziam: Jesus foi fundamental, crucial mesmo para você se salvar, é claro. Mas só a fé nele não basta para fazer você atingir a plena aceitação de Deus. Você agora tem de adotar a gama inteira de costumes mosaicos cerimoniais e culturais. Isso é muito mais sutil. Significa dizer: Você se relacionou com Deus pela graça, mas agora tem de crescer nele esforçando-se muito, muito mesmo, de modo a obedecer a todas essas regras especiais (3.1-5).

Da mesma forma, o moralismo que mata o espírito não crescería em nossas igrejas por meio de negações clamorosas e evidentes da doutrina da justificação só pela fé. É muito mais provável que essa verdade seja corroída por novas formas dc se exigir conformidade cultural ou outras abordagens, as quais, em nossa própria cultura e época, são tão sutis quanto as judaizantes eram nas deles.

Segundo, o debate nos mostra que o livro de Gálatas tem sido bastante lido como uma discussão um tanto acadêmica da doutrina. Mas Paulo não está preocupado apenas com a ruptura das crenças doutrinárias dos indivíduos. Ele também demonstra uma preocupação profunda com a ruptura na unidade

APÊNDICE: o d eb ate recente

e na comunidade cristãs. É importante ver o quanto o livro de Gálatas é direcionado para os problemas da exclusividade racial e cultural e para outros aspectos sociais da vida cristã. As verdades do evangelho não são questões só para a torre de marfim, para os auditórios de palestras e para as teses doutrinárias; são fundamentais para a vida cotidiana, no coração e em casa, com os membros da congregação e os colegas dc trabalho.

GLOSSÁRIO

Abraão. Ancestral da nação de Israel e homem com quem Deus firmou um contrato (aliança). Deus prometeu transformar sua família em uma grande nação, dar a essa nação uma terra e abençoar todas as nações por intermédio de seus descendentes (veja Gn 12.1-3). afetos. Inclinações do coração. Nossos afetos são tudo o que guia e dá forma às nossas emoções. alegoria. História que funciona como imagem de um significado ou verdade mais profundos. Por exemplo, O peregrino, de John Bunyan, é uma alegoria da conversão ao cristianismo e da vida como cristão. aliança do monte Sinai. Pacto feito por Deus com seu povo que viajava do Egito para a terra prometida. amém. Verdadeiro. amoral. Que não se interessa cm saber se algo é certo ou errado. É diferente de imoral, que significa algo ou alguém que não se conforma a um padrão geralmente aceito de certo e errado. analogia. Comparação entre dois elementos. Normalmente um desses elementos é usado para explicar o outro. Antioquia. Cidade 482 quilômetros ao norte de Jerusalém, onde hoje é o sul da Turquia. Foi a localização da primeira igreja em que a maior parte dos membros era gentia. Antioquia foi o lugar onde os seguidores de Jesus foram chamados de “cristãos” pela primeira vez (veja At 11.19-26). aoristo. Tempo verbal que se refere a algo que aconteceu no passado e em um instante de tempo pontual. Um exemplo equivalente [em português] é: “Davi matou Golias”. Arábia. Região deserta e inóspita a leste de Israel. Em Gálatas 4.25, Paulo não diz que o monte Sinai fica literalmente na Arábia (não fica!). Ele apenas usa a Arábia como metáfora para esterilidade.

Glossário

catequizado. Aquele a quem são ensinados os princípios centrais da fé cristã, fazendo e respondendo perguntas. circuncisão. Deus disse aos homens dentre seu povo, no Antigo Testamento, para se circuncidarem como forma de mostrar fisicamente que o conheciam e nele confiavam, pertencendo assim ao povo de Deus (veja Gn 17). conceder. Dar. concubina. Mulher que vive com um homem, mas tem status inferior ao de sua esposa (ou esposas); uma espécie de amante oficial dentro de casa. conformar. Mudar para ser igual a alguém ou a alguma coisa. denominacional. Pertencente a um ramo da igreja. Exemplo: presbiteriano, batista, anglicano/episcopal, metodista. dogma. Princípio ou crença. dom. Talento ou habilidade concedido por Deus (veja lCo 12.4-11). doutrina. Estudo do que é verdade acerca de Deus. Doze, os. Os 12 apóstolos. São os 12 discípulos de Jesus menos Judas, que o traiu, mais Matias, escolhido para ficar no lugar de Judas (veja Mc 3.13-19; At 1.15-26). Encarnação. Vinda do Filho divino de Deus como ser humano, na pessoa de Jesus Cristo. epístola. Qualquer carta do Novo Testamento; e.g., Gálatas, Romanos, ICoríntios. estrada de Damasco. Estrada entre Jerusalém (na Israel atual) e Damasco (na Síria atual), uma distância de 217 quilômetros. Foi nessa estrada que o Jesus ressurreto apareceu para o apóstolo Paulo (também chamado Saulo). Paulo se tornou cristão em consequência dessa experiência (veja At 9.1-19). evangelho. Proclamação; termo muitas vezes traduzido como “boas-novas”. Quando o Império Romano fazia uma proclamação império afora, declarando uma vitória ou conquista, dava-se a isso o nome de “evangelho”. O evangelho é uma boa-nova na qual se deve crer, não um bom conselho a ser seguido.

Glossário

evangelizar, evangelismo. Contar às pessoas 0 evangelho de Jesus Cristo. exultar. Demonstrar e sentir felicidade e entusiasmo, falar em línguas. Dom espiritual de falar em outras línguas, às vezes não terrenas. Exemplos: Atos 2, lCoríntios 12.7-11. fariseu. Judeu que vivia pela observância rigorosa tanto da lei de Deus do Antigo Testamento quanto da tradição judaica. Os fariseus achavam que obedecer à lei os acertava com Deus (estavam equivocados; veja, por exemplo, a parábola de Jesus em Lc 18.9-14). O próprio Paulo fora um fariseu antes de se tornar cristão (At 23.6; 26.4,5). funcional. Que exerce a função de. gentio. Pessoa que não é etnicamente judia, glorificação. Momento em que alguém do povo de Deus é aperfeiçoado, como Cristo, e acolhido no reino eterno de Deus. graça. Favor imerecido. Na Bíblia, o termo costuma ser utilizado para descrever como Deus trata seu povo. Por ser cheio de graça, Deus dá aos crentes vida eterna (Efésios 2.4-8); também lhes dá dons para usar no serviço em favor de seu povo (Ef 4.7,11-13). herege. Quem professa crença que se opõe diretamente ao evangelho bíblico (i.e., o oposto de ortodoxo). Herege é alguém que, mesmo contestado, mantém suas convicções heréticas, igualitário. Referente à crença de que todas as pessoas têm basicamente o mesmo valor. indiferente. Que demonstra não se importar, ter inimizade ou hostilizar uma pessoa; e.g., o que ocorreu com Cristo, individualismo. Visão de que somos indivíduos que não fazem parte, não precisam confiar e nem devem prestar contas a nenhum grupo maior de pessoas. Jerusalém. Capital de Israel e local do templo. Na época do Antigo Testamento, era o centro da vida e da adoração para o povo de Deus. Os escritores bíblicos costumam usar “Jerusalém” para se referir a “Israel” ou ao “povo de Deus”. João Batista. Primo de Jesus e profeta, a ele coube o papel de anunciar que o Rei escolhido por Deus (Cristo) em breve viria a Israel,

Glossário

e de conclamar o povo a se voltar para Deus como seu soberano, em preparação para a vinda de Cristo. Veja Marcos 1.4-8. jugo. Pedaço de madeira amarrado ao pescoço de animais e preso a um arado ou carroça que eles têm de puxar, justificação pelas obras. Visão de que as obras da pessoa (i.c., pensamentos, palavras e atos) podem lhes render o relacionamento apropriado com Deus. justo/justiça. Em Gálatas, significa o status de manter um relacionamcnto apropriado com Deus. kosher. Alimento que satisfazia as exigências das leis do Antigo Testamento relacionadas com comida, legalismo. Modo de viver segundo determinadas regras, na crença de que cumprir tais exigências garantirá alguma forma de bênção (por exemplo, vida eterna ou riqueza terrena), lei mosaica. Leis do Antigo Testamento, dadas por Deus a Moisés nos livros de Êxodo, Levítico, Números e Deuteronômio, que estabelecem como Israel deve se relacionar com Deus e viver na condição de seu povo. licenciosidade. Condição da vida que se leva de acordo com os sentimentos, em vez de por princípios, partieularmente no que diz respeito a sexo. mediador. Alguém que promove a aproximação de dois inimigos e possibilita que reatem a amizade, metáfora. Imagem utilizada para explicar algo, mas que não deve ser tomada pelo sentido literal (exemplo: “A notícia foi um punhal para seu coração”). Moisés. Líder do povo de Deus na época em que Deus os libertou da escravidão do Egito. Deus transmitiu sua lei (incluindo os Dez Mandamentos) por meio de Moisés, e sob sua liderança conduziu o povo em direção à terra que prometera lhes dar. monte Sinai. Montanha no deserto entre o Egito e a Terra Prometida (que veio a ser denominada Israel). Ali Deus se rec^elou a Moisés, estabeleceu uma aliança com Israel e transmitiu a lei a seu povo (veja Ex 19). O monte Sinai também é chamado de monte Horebe.

Glossário

nascido de novo. Alguém que depositou sua fé em Cristo e recebeu uma vida nova e eterna (veja Jo 3.5-8; lPe 1.3-5). objetiva, verdade. Verdade baseada em fatos, não em sentimentos. Por exemplo, “Sou casado com esta mulher”, ortodoxo. Ensino cristão padrão, aceito e estabelecido, pagão (paganismo). Alguém que não conhece nem adora o verdadeiro Deus. parábola. História contada por Jesus para ilustrar uma verdade a respeito dele e/ou de seu reino, paralelismo. Grande similaridade, ligação, pecado. Pensamentos, palavras e atos provenientes da rejeição a Deus e de adorar alguma coisa em seu lugar, permissividade. Viver como bem se entende, perseverar. Continuar a pensar ou fazer algo apesar de enfrentar dificuldades. poligamia. Ter mais de uma esposa ao mesmo tempo, predestinação. Doutrina de que Deus escolheu salvar certas pessoas conforme sua graça e amor imerecido, em vez de com base em seu caráter ou atos (veja, por exemplo, Ef 1.4-6). processo passivo. Algo que acontece sem você ter de fazer nada (o oposto de “ativo”). Por exemplo, envelhecer é um processo passivo! pródigo. Esbanjador, aquele que gasta dinheiro de maneira despreocupada ou perdulária. profeta. Pessoa usada por Deus para transmitir uma mensagem ao povo. relativizar/relativista. Ter uma perspectiva baseada na crença de que verdade e moral não são uma questão de absolutos, que valem para toda pessoa em todo contexto em todas as eras, mas são produtos da cultura e/ou experiência da pessoa e, portanto, mudam. Assim, algo pode ser errado para você, mas certo para mim. santificados. Purificados; transformados para nos tornarmos como Cristo (veja Rm 8.29). santo. Completamente puro; separado.

Glossário

secular, vida. Vida sem referência a Deus ou qualquer religião e rejeitar qualquer ideia de espiritualidade. soberano, Soberano. Relativo ao rei; Todo-Poderoso. sobrenaturalmente. Não da maneira natural pela qual o mundo funciona. subjetiva, verdade. Algo que se baseia em sentimentos e opiniões. Exemplo: “Ela é a mulher mais linda do mundo” é uma opinião subjetiva. substitutivo. Ato que envolve uma substituição, quando alguém (ou algo) ocupa o lugar de outro alguém ou coisa, ou é por ele (ou ela) substituído. teologia. Estudo do que é verdade acerca de Deus. testemunho. Relato verídico de como Deus levou um indivíduo à fé em Jesus. traços. Qualidades ou atributos distintivos. transgressão. Pecado. Literalmente, a palavra quer dizer “que ultrapassou um limite”. vácuo. Espaço sem nada dentro e que a natureza sempre tentará preencher. zeloso. Extremamente passional, entusiástico e intransigente acerca de algo.

BIBLIOGRAFIA

Ferguson, Sinclair B. Children of the living God (Carlisle: Banner ofTruth, 1989). G uthrie, Donald. Galatians. New Century Commentary (London: Marshall, Morgan & Scott, 1973). L ewis, C. S. Surprised by joy: the shape of my early life. Ed. rev. (Boston: Houghton Miffilin Harcourt, 1995). _____ . Surpreendido pela alegria (São Paulo: Mundo Cristão,

1998). Tradução de: Surprised by joy. Lovelace, Richard. Dynamics of spiritual life (Downers Grove: IVP, 1979). ______. Teologia da vida crista: a dinâmica da renovação espiritual

(São Paulo: Shedd, 2004). Tradução de: Dynamics of spiritual life. L uther, Martin. Commentary on the Epistle to the Galatians (London: Suzeteo Enterprises, 2011). Moo, Douglas J. The Epistle to the Romans. The New International Commentary (Grand Rapids: Eerdmans, 1996). Packer, J. I. God's words (Downers Grove: IVP, 1981). Powlison, David. “Idols of the heart and ‘vanity fair’”. The Journal of Biblical Counseling, vol. 13, n. 2, Winter 1995. Stott, John. The message of Acts. The Bible Speaks Today (Downers Grove: IVP, 1968). ______. A mensagem de Atos (São Paulo: ABU, 1994). Tradução de: The message of Acts. ______.The message of Galatians. The Bible Speaks Today

(Downers Grove; IVP, 1968). ______.A mensagem de Gálatas (São Paulo: ABU, 1997).Tradução de: The message of Galatians.

“G a ia ta s tem tu d o a ver c o m o e v a n g e lh o — o e v a n g e lh o d e q u e to d o s n e c e s s ita m o s a o lo n g o d a vid a. E ssa ca rta é d in a m ite pura, e oro p a r a q u e su a m e n s a g e m p o d e r o sa v e n h a ex p lo d ir e m se u c o r a ç ã o q u a n d o v o c ê estiv er le n d o e s te livro.”

Junte-se ao dr. Timothy Keller na exposição da Carta de Paulo aos Gálatas. Entenda seu significado e veja como ela transforma nosso coração e nossa vida hoje.

Escrito para pessoas de todas as idades e etapas da vida, de pesquisadores a novos crentes, de pastores a professores, este material pode ser utilizado de diversas formas e foi feito para você...

■ LER E ESTUDAR, servindo de guia para essa carta maravilhosa, levando-o a valorizar e a viver a liberdade do evangelho;

■ MEDITAR E SE ALIMENTAR, proporcionando um devocional diário que o ajudará a crescer em Cristo à medida que for lendo e meditando nessa porção da Palavra de Deus;

■ ENSINAR E LIDERAR, oferecendo uma série de apontamentos que lhe permitirão explicar, ilustrar e aplicar Gálatas quando estiver pregando ou liderando um estudo bíblico.

Timothy Keller nasceu e cresceu na Pensilvânia, com formação acadêmica na Bucknell University, no Seminário Teológico Gordon-Conwell e no Seminário Teológico Westminster. Ele é pastor da Redeemer Presbyterian Church, em Manhattan, igreja que fundou em 1989 com a esposa, Kathy, e seus três filhos. É autor bestseller do New York Times e escreveu vários livros, entre eles, A fé na era do ceticismo, A cruz do Rei, Como integrar fé e trabalho e Igreja centrada, publicados por Vida Nova.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Semear para o Espírito é obedecer pela alegre gratidão de ser filho de Deus; o quanto da sua obediência atual nasce dessa gratidão, e o quanto ainda nasce do medo de ser reprovado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Paulo exorta a "não nos cansarmos de fazer o bem" porque a colheita demora; em que bem você tem desanimado de praticar por ainda não ver fruto algum?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da promessa de que "a seu tempo ceifaremos", que cansaço ou impaciência tem feito você desistir de continuar semeando para o Espírito, e o que essa promessa muda nisso?$p$, 'reflexao', null);
  end if;

end $migration$;
