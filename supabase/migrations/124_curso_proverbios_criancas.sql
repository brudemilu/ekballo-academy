-- =============================================================
-- Curso: Provérbios para Crianças
-- Transcrição na íntegra, dividida em 31 aulas. Atividades = perguntas
-- de reflexão (tipo='reflexao') elaboradas a partir do conteúdo.
-- Cabeçalhos de seção em CAIXA ALTA renderizam como títulos (ehTitulo()).
-- Idempotente.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'proverbios-para-criancas';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values ('proverbios-para-criancas','Provérbios para Crianças','Leitura guiada de Provérbios para crianças: 31 dias de ensinamentos, de Caiene Cassoli. São trinta e uma historinhas curtas que ensinam, com carinho e à luz da Palavra, valores como obediência, sabedoria, honestidade, bondade e perdão. Cada dia traz a história, uma oração e um versículo para meditar, além de perguntas simples para a criança refletir e aplicar o que aprendeu.','/api/og/curso/proverbios-para-criancas', false, 0, v_next_ordem, true)
    returning id into v_curso_id;
  end if;


  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 1$t$, 1,
$conteudo$Do alto dos Céus, Deus, que está sentado em seu trono, espia os pequeninos. É noite. Belas e sinceras orações chegam aos seus ouvidos. É a hora mais aguardada do dia, pois antes de dormir, os pequeninos gostam de sentir o conforto do seu grande Pai, que de longe os embala e protege durante o sono. Lá embaixo, Júlia se preparava para dormir, já era tarde, segundo sua mãe. Por ela, seguiria brincando, mas se sua mãe dissera que era hora de ir dormir, então era hora de ir dormir. Escovou os dentes, vestiu o pijama e já em seu quarto, ajoelhou-se apoiada em sua cama e iniciou suas preces noturnas:

Papai do Céu, obrigada por mais um dia de vida, obrigada por tudo o que faz por mim. Obrigada principalmente por meus pais. Perdoe-me se eu os desrespeito às vezes, quando ouço e não obedeço tudo o que me pedem para fazer. Ensina-me a ser uma filha sempre melhor, a ouvir o que me ensinam, a respeitar suas regras. Sei que é isso que o Senhor deseja de mim e não quero decepcioná-lo e nem a eles. Também me ensina a te ouvir, não quero apenas buscá-lo em meus momentos de tristeza e medo, quero estar ao teu lado todos os dias. Quero ouvir seus conselhos e somente assim saberei que estarei protegida de todo o mal. Obrigada por tudo até agora e por tudo o que o Senhor faz em minha vida. Amém.

Para meditar:

Ouve, meu filho, a instrução de teu pai: não desprezes o ensinamento de tua mãe. Provérbios 1,8$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Assim como a Júlia, o que você gosta de conversar com o Papai do Céu antes de dormir?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você pode ouvir e obedecer com carinho o que seu pai e sua mãe te ensinam?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 2$t$, 2,
$conteudo$Lucas observava. Observava e pensava. Estava sentado no banco da praça, com seus pais, que desfrutavam de um dia ensolarado para poder sair de casa, após três fins de semana de chuva. Sentado ali, admirava a família que tinha e torcia secretamente para que todas as crianças pudessem ter o que ele tinha em seu lar. Mas sabia que nem sempre era assim e que graças a Deus, ele era abençoado daquela forma. Aprendeu desde cedo que o dia a dia é guiado pela sabedoria de Deus, que ao acolhê-lo, viria também o conhecimento e o entendimento para lidar com as situações simples e complicadas da vida. Viu desde sempre isso em seus pais e desejava crescer com essa sabedoria. Pois eles conseguiam resolver todos os problemas, nada era demasiado complicado. Antes de tomarem qualquer decisão, pediam em suas orações que Deus lhes desse sabedoria e entendimento para que escolhessem a coisa certa. Para Lucas, era como se recebessem superpoderes. Por isso, nunca deixava de fazer o mesmo em suas orações:

Deus Pai, o Senhor é o Deus dos meus pais e também o meu. Aprendi desde pequeno a confiar no Senhor, meus pais sempre confiaram e eu também confiarei. Sei que para tudo em minha vida, precisarei de ti, por isso peço que me dê só um pouquinho da sua sabedoria, para que eu possa sempre saber o que fazer; para que eu nunca faça o que é errado; para que eu nunca fique feliz com a injustiça; para que eu jamais me envolva com pessoas mentirosas; para que eu nunca deixe que me levem para um mal caminho. Peço só um pouquinho dessa sabedoria que o Senhor também dá aos meus pais, não precisa ser muito, pois muitas outras pessoas também precisam, mas não se esqueça de mim quando for reparti-la entre nós todos. Vou ficar muito feliz. Amém.

Para meditar:

O Senhor é quem dá a sabedoria, e de sua boca é que procedem a ciência e a prudência. Provérbios 2,6$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Lucas pedia a Deus um pouquinho de sabedoria para saber o que fazer; em que momento do seu dia você gostaria de pedir essa ajudinha?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você não sabe se uma escolha é boa, como conversar com Deus pode te ajudar?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 3$t$, 3,
$conteudo$Sara achava que ser criança não era fácil. Era uma menina repleta de vontades e ao menos uma vez ao dia, era repreendida por alguma coisa. Ora não fazia a lição de casa, ora não queria ajudar nas tarefas, vez ou outra fazia malcriação com seus pais. Sara não entendia o porquê de seus pais não gostarem dela e se dedicarem tanto a fazê-la se irritar. Parecia que faziam de propósito, pensava ela. Eram tantas repreensões em um dia, que ela passou a ter a ideia absurda de que era melhor nem ter nascido. Certo dia, Julia trancou-se em seu quarto e após um longo período de choro adormeceu. Quando acordou, foi até a sala, encontrou seus pais sentadas conversando entre si. Chamou-os, eles a olharam de relance e voltaram a conversar. Sara foi à cozinha e voltou com um prato de bolachas e um copo de leite, sentou no tapete e ligou a TV, mesmo sabendo que sua mãe outrora havia pedido que comece sentada à mesa. Sara comeu e bebeu, voltou à cozinha e encheu novamente seu prato e copo. Sua mãe nem percebeu. Tempo depois, pegou seu caderno de atividades escolares e começou a desenhar, mesmo que não fosse essa a lição. Mostrou o desenho ao seu pai, que já havia dito a ela para terminar os afazeres antes do jantar. O pai olhou e saiu. Não se incomodou com o que ela estava fazendo. O que estava acontecendo? Eles não se importavam mais com ela? Será que eles haviam desistido dela, depois de tantas as vezes que não os obedeceu? Pensando bem, ela não duvidava disso, ela realmente não se comportava bem. Começou a chorar. Queria ir até eles e pedir desculpas, dizer que sabia que estava errada, que sabia que só lhe repreendiam por se importarem. Mas quando foi procurálos, a casa estava vazia, não tinha mais ninguém; a casa não tinha móveis, o quarto de seus pais estava vazio. Ela estava sozinha. Quando se deu conta, estava acordando de um pesadelo. Seu primeiro impulso foi fazer aquilo que não conseguiu fazer em sonho. Correu até seus pais e disse tudo aquilo que sonhou dizer e o quanto os amava e sabia como se importavam com ela. Depois voltou para o quarto e fez uma breve oração a Deus:

Querido Deus, obrigada por ter feito eu existir, peço perdão por ter duvidado de que essa fosse a decisão certa. Obrigada pelos pais amorosos que me deu. Amém.

Para meditar:

O Senhor castiga aquele a quem ama, e pune o filho a quem muito estima. Provérbios 3,12$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Sara descobriu que seus pais a repreendem porque a amam muito; como você se sente sabendo que seus pais cuidam de você desse jeito?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você faz algo errado, como pode pedir desculpas com o coração, igual a Sara fez?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 4$t$, 4,
$conteudo$Como sempre fazia, Deus, lá de cima, observava seus pequeninos. Observava e desejava que seus dias fossem longos e prósperos, que mais que tudo, não desviassem de seu caminho e passassem por sofrimentos que não precisariam passar. Todas as vezes que viu um de seus pequenos, indo para o caminho errado, sabendo que não havia nada que pudesse fazer, a não ser aguardar ansiosamente por seu retorno, se entristecia. Queria poder segura-los ao seu lado e não deixá-los partir, mas sabia que não podia impedi-los, só poderia continuar a observá-los, amorosamente e pacientemente. Por essa preocupação diária, sentia-se muito feliz com orações como as de Maria, que mesmo com sua pouca idade, reconhecia com facilidade o certo do errado e ainda, pedia a Ele que também ajudasse os outros a discernir bem o caminho bom, do mau. Paizinho do céu. Guia meus pezinhos para que eu nunca saia do seu caminho, não quero nunca me afastar de ti. Não deixe que eu conheça as coisas ruins, a violência, a maldade. Não deixe que eu caminhe na escuridão, sem sua luz para me guiar. Não deixe que de mim, saia o mal a mim mesma ou ao próximo. Guarda meu coraçãozinho, só quero sentir seu amor. E por favor, ajude todas as crianças a seguirem firmes por seu caminho, mesmo as que não O conhecem e amam como eu, ajude-as a encontrá-Lo. Amém. Que bela oração, pensava Deus. Tudo o que Maria pedira, era exatamente o que Ele também queria.

Para meditar:

Não entres pela vereda dos ímpios, nem andes no caminho dos maus. Provérbios 4,14$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Maria pediu a Deus para guiar os pezinhos dela no caminho bom; o que ajuda você a escolher o caminho certinho todos os dias?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você pode torcer e orar para que seus amiguinhos também sigam pelo caminho do bem?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 5$t$, 5,
$conteudo$Joana sonhava com o dia de seu casamento, como muitas meninas o fazem. Passava horas se fantasiando, enrolava-se em lençóis brancos e calçava os saltos da mãe. Carregando flores arrancadas do jardim, andava de queixo erguido pelo corredor da casa, acenando e sorrindo. Ela já ouvira algumas vezes que era nova demais para pensar em casamento, mas não se importava. Sabia que o dia estava longe de chegar e que deveria ter outras preocupações, como com os estudos. Também esperava ter algumas aventuras antes do casamento, viajar e conhecer lugares diferentes, por exemplo. Na verdade, ela não tinha pressa, sabia que o dia chegaria e que seria preparado por Deus, mas nunca deixava de tocar no assunto em suas orações. Afinal de contas, um dia Deus lhe prepararia alguém, então que mal faria, pedir por ele? Senhor Deus, sou muito nova, eu sei. Não pretendo casar tão cedo, embora eu sonhe com esse dia. Mas não tenho pressa, sei que o Senhor preparará tudo com muito amor. Mas te peço por ele, aquele a quem o Senhor escolherá. Guarda-o e tire de seu caminho tudo que o desvie de ti. Proteja-o, guarde a inocência de seu coração, ensina-o a ser um bom filho para Ti. Amém. Lá do alto, Deus ouvia aquela oração. Via ele, que anos depois, Joana estaria feliz, com seu sonho concretizado. Ela cresceria sabendo ser uma filha fiel e constituiria uma família feliz. O filho que teria, a usaria como exemplo quando escolhesse sua esposa, passaria longe de todas que lhe tirariam a inocência e também constituiria uma família feliz. E assim seria, geração em geração. Pois Joana, amou a Deus e seguiu seus ensinamentos.

Para meditar:

Pois os lábios da mulher imoral destilam mel; sua voz é mais suave que o azeite, mas no final é amarga como fel, afiada como uma espada de dois gumes. Provérbios 5,3-4$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Joana confiava que Deus prepara as coisas boas com muito amor e no tempo certo; em que coisa você gostaria de aprender a esperar com confiança?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como ser uma criança fiel a Deus, como a Joana, pode deixar o seu coração feliz?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 6$t$, 6,
$conteudo$Carlos é admirador de formigas. Coisa de criança. Vez ou outra seus pais lhe flagram tentando fazer um viveiro em seu próprio quarto. Se não é isso, está em seu quintal, vistoriando a fila em que andam as formigas ou pegando pedaços de folha e colocando no formigueiro, para que possam terminar mais cedo e descansar. Quando lhe perguntam o porquê de sua admiração, sempre diz que é por gostar de vê-las trabalhar, pois trabalham faça chuva ou faça sol e nunca são preguiçosas. Diz que uma ou outra tenta fugir da fila, mas que acaba retornando pois fica entediada sem fazer nada. Mas o que mais gosta nelas, é que são tão pequeninas e tão fortes ao mesmo tempo, se não trabalhassem tanto, certamente não sobreviveriam. Fato é que Carlos sempre desejou ser uma formiga, talvez por sua baixa estatura, talvez por almejar carregar um peso muito maior que seu próprio ou por gostar de brincar com terra, como gostam as crianças. Deus, me dê a força da formiguinha e sua perseverança. Tira de mim a preguiça, ajude-me a levantar todos os dias, com ânimo e garra. Me ajude a não ter sono na hora de ir para a escola e a não sentir cansaço durante as tarefas de casa. Sou pequeno, pois sou criança, mas com Sua ajuda, posso ser forte, determinado e ágil como a formiga. Amém.

Para meditar:

Observe a formiga, preguiçoso, reflita nos caminhos dela e seja sábio! Provérbios 6,6$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Carlos admira a formiguinha porque ela é pequena mas trabalha com força e ânimo; em quais tarefas você pode ser caprichoso e não deixar a preguiça vencer?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como pedir ajuda a Deus pode te dar mais garra para acordar e fazer suas coisas com alegria?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 7$t$, 7,
$conteudo$Lá de cima, Deus gostava de consultar os corações de seus pequenos, para conferir como andavam guardando seus mandamentos. Via que, às vezes, nem sempre todos eram seguidos. De vez em quando, um deles não honrava pai e mãe, fazia alguma malcriação que os magoava. Outros faziam uma coisa bem feia, roubavam. Deus se entristecia muito quando os via fazer algo errado, mas roubar era uma das coisas que mais o magoava. Às vezes, uma criança ficava cobiçando um brinquedo de outra ou contava uma mentira sobre alguém. Quase nunca era por maldade, Deus sabia que em seus corações, nem sempre percebiam que estavam fazendo algo errado, então Ele tentava fazer de tudo para que de alguma forma, aprendessem a fazer o certo e a fazer o bem. Coração de criança é cheio de amor e criança aprende fácil. Gostava de cuidar delas, pois delas saíriam os melhores frutos. Bastasse que em seus corações estivessem guardados seus mandamentos e ensinamentos e com certeza, tomariam ótimas decisões no futuro, honrando o Seu nome. Enquanto Deus as acompanhava de perto, orações lhe chegavam aos ouvidos. Uma delas era a de Paulo, que pedia com a sinceridade única, de um coração de criança. Meu Deus, hoje eu fiz coisas feias. Contei uma mentira para meu pai, pois fiquei com medo de levar bronca. Sei que foi errado mesmo assim, então me dê coragem para contar a verdade a ele. Eu também peguei escondido uma moeda do meu irmão, para comprar doce. Eu já comprei o doce, mas me sinto mal pelo que fiz. Como posso corrigir isso? Pois até o doce já comi. Me ajuda a também pedir desculpas a ele. Também peço que o Senhor me perdoe pelas coisas erradas que fiz hoje, sei que não Te alegram. Não fique chateado comigo, vou fazer melhor da próxima vez. Amém.

Ao ouvir, Deus riu. Claro que o perdoava e já lhe enchia de coragem para assumir seus erros. Apesar de tudo, ficava feliz em ver a humildade daquele coraçãozinho.

Para meditar:

Filho meu, guarda as minhas palavras e esconde dentro de ti os meus mandamentos. Provérbios 7,1$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Paulo teve coragem de contar a Deus as coisas erradas que fez e quis consertar; quando você erra, como você pode pedir desculpas e fazer o certo de novo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que você acha que falar a verdade e devolver o que não é nosso deixa o coração mais leve?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 8$t$, 8,
$conteudo$Já era tarde, nem noite mais era e em algumas horas, amanheceria. Nesse horário, as crianças dormiam. Quase não se ouvia lá nos céus, uma oração delas. Mas aquele não era um dia comum, Deus, que nunca dormia e a tudo observava, estava muito atento, velando o sono de seus pequenos, quando palavras começaram a chegar aos seus ouvidos. Era Antonia, que acordara assustada após um pesadelo e decidira fazer uma oração, pois sempre perdia o medo quando conversava com Deus, que por sua vez, ouviu-a com amor e atenção. Papai do céu, eu sei que deveria estar dormindo, mas me assustei e senti medo de voltar a fechar os olhos. Eu sei que já fiz minha oração antes de dormir, mas queria fazer outra e pedir que o Senhor cuide de mim enquanto durmo. Falar com o Senhor me faz sentir bem, pois sei que me escuta em qualquer momento. Também sei que me ama muito, pois eu também te amo muito. Obrigada, porque já sinto que meu medo está indo embora e não me preocupo mais com pesadelos, nada é mais forte que o Senhor e sei que estará comigo até eu voltar a acordar. Boa noite, Amém.

Claro que Deus a amava e com ela estaria a cada segundo, mas saber que era isso que ela queria, o fazia amá-la ainda mais. Soprou lá de cima, bons sonhos à Antonia, certificou-se de que anjos a protegiam e alegrou-se ao vê-la dormir tranquila.

Para meditar:

Amo os que me amam. Quem me procura, encontra-me. Provérbios 8,17$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Antonia perdia o medo quando conversava com Deus à noite; o que você gosta de dizer a Deus quando fica com medo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como é bom saber que Deus te escuta em qualquer hora, de dia ou de noite?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 9$t$, 9,
$conteudo$Lara é uma menina esperta, sabe quem é uma boa companhia e quem não é. Ela sabe que se andar com más companhias, correrá o risco de ficar como elas. Más companhias, segundo a mãe de Lara, são aquelas que te ensinam a fazer coisas erradas, coisas que Deus não se agradaria de vê-la fazendo. Como roubar, mentir, brigar, fofocar e várias outras coisas. Então sempre que Lara vê isso acontecendo, ela se afasta. Nem sempre é fácil se afastar, então sempre que ela sente alguma dificuldade, pede ajuda a Deus. Deus, quero andar no seu caminho e não quero me desviar. Por favor me ajude a ter boas amizades, me ajude a escolher bem com quem andar. Se algum dia eu me enganar, faça-me ver com clareza para que eu possa reconhecer quem não me quer bem e não permita que eu me afaste do seu caminho. Por favor, Deus, coloque bons amigos no meu caminho e que juntos possamos te amar. Amém.

Felizmente, Lara tem amigos que amam a Deus, tanto quanto ela, amigos que gostam de aprender mais sobre Seus ensinamentos e que não se zangam quando são repreendidos por fazer algo errado, pelo contrário, ficam felizes por terem a chance de melhorar. Enquanto ela preservasse amigos que também honrassem o nome de Deus, sempre teria boa companhia.

Para meditar:

Deixai a insensatez e vivereis; andai direito no caminho da inteligência! Provérbios 9,6$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Lara sabe escolher bons amigos que amam a Deus; o que faz alguém ser um amiguinho de verdade pra você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você e seus amigos podem se ajudar a fazer sempre o que é bom e bonito?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 10$t$, 10,
$conteudo$Os pais fazem tantos sacrifícios por seus filhos que muitas vezes nem ficam sabendo. Mas Jonas sabia e desejava do fundo de seu coração, agradar-lhes e mostrar seu reconhecimento. Não havia muito que pudesse fazer, era uma criança, não tinha dinheiro para comprar presentes legais, não tinha tido tempo para aprender algum tipo de oficio que lhe permitisse construir um presente, mas sabia que havia algo que os faria feliz. Para isso, precisava pedir a ajuda de Deus. Meu Deus, graças ao Senhor eu tenho pais maravilhosos que me amam, cuidam de mim e se esforçam muito para serem bons pais. Eu queria poder mostrar como agradeço, mas preciso que o Senhor me ajude, me ajude a ser mais sábio. Pois se eu for sábio, nunca darei motivos para eles ficarem preocupados comigo. Se eu for sábio, eles vão saber que todo o esforço valeu a pena e ficarão felizes comigo. Me ajuda, Deus, a andar certinho no seu caminho, me dê sabedoria para que eu saiba diferenciar o certo do errado. E quando algo errado me parecer bom, não me deixa fazer nada que vá magoar meus pais. Quero que sintam orgulho de mim. Obrigado.

Jonas terminou sua oração com a certeza de que seria motivo de alegria e orgulho aos seus pais, tremia só de pensar em magoá-los. Nenhum pai ou mãe merece a preocupação de saber que o filho não está em um bom caminho e esse tipo de preocupação, seus pais jamais teriam.

Para meditar O filho sábio é a alegria de seu pai; o insensato, porém, a aflição de sua mãe. Provérbios 10,1$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Jonas queria deixar seus pais felizes sendo um filho sábio e bem comportado; de que jeitinho você pode alegrar e deixar seus pais orgulhosos hoje?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como pedir sabedoria a Deus pode te ajudar a saber o que é certo e o que é errado?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 11$t$, 11,
$conteudo$Não é por terem pouca idade que crianças não saibam o significado de justiça. Não conseguem diferenciar o certo do errado e ter consciência do que estão fazendo quando escolhem pelo errado. Sophia bem sabia, acompanhava seus pais feirantes todo domingo e no decorrer do dia, observava como as pessoas compravam sendo levadas a entender pelos vendedores, que o produto era bom e estava barato, sem ser verdade. Havia até aqueles que enganava o freguês na hora de pesar na balança. Seus pais, que eram cristãos e tementes a Deus, sempre lhe passaram o valor da justiça, sempre lhe explicaram que não se devia levar vantagem ao aproveitar-se da inocência ou confiança das pessoas, que cobra-se o que é certo e justo. Sophia orgulhava-se dos pais que tinham, trabalhavam sempre com honestidade e nunca precisaram tirar vantagem de ninguém para conseguirem conquistar seus objetivos, tudo sempre foi fruto de trabalho duro e honesto. Sophia então, fez uma oração. Deus Pai, obrigada por ter me ensinado, através de meus pais, sobre honestidade e justiça. Quero ser uma pessoa boa e conquistar minhas coisas através de meu próprio esforço, sem nunca enganar ninguém. Se um dia eu me sentir tentada a fazer isso, me ajude a não fazer. E se eu fizer sem perceber, me faça ver e me ajude a me redimir. Farei o máximo possível para isso nunca acontecer, mas sei que nem sempre conseguimos ser fortes para permanecer no caminho certo, então esteja sempre comigo, me guiando e ensinando. Amém.

Para meditar:

A balança fraudulenta é abominada pelo Senhor, mas o peso justo lhe é agradável. Provérbios 11,1$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Sophia aprendeu com os pais a ser honesta e nunca enganar ninguém; como você pode ser honesto nas suas brincadeiras e com seus amigos?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que você acha que Deus fica feliz quando a gente é justo e não tira vantagem dos outros?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 12$t$, 12,
$conteudo$Carlinha nasceu diferente de seus amiguinhos, nasceu com síndrome de down. Embora seja uma menina linda, meiga e inteligente, outras pessoas costumam julgá-la pela aparência e vez ou outra, lhe magoam com o que falam. Quando não se referem a ela com termos pejorativos, falam dela como se ela não fosse capaz de ouvir e compreender as coisas feias que pensam sobre ela. Felizmente, ela tem muitas pessoas em sua vida que a amam e que estão sempre ao seu lado quando está triste. Sua avó, por exemplo, que passava um bom tempo com ela enquanto os pais trabalhavam, lhe dava ótimos conselhos para ignorar os comentários maldoso e lhe ensinava que o melhor que podia fazer quando sentia-se triste, era falar com Deus. Então, Carlinha orava. Papai, não me deixa ficar triste por causa da maldade das pessoas. Ensine-as a serem mais amorosas e me ensine a não ser como elas. Não deixe que eu fale coisas que machucam outras pessoas, me ensina a falar coisas boas para alegrá-las quando estiverem tristes e falar com sabedoria quando alguém precisar de ajuda. Prefiro não falar nada a falar coisas ruins. Amém.

Para meditar:

O falador fere com golpes de espada; a língua dos sábios, porém, cura. Provérbios 12,18$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Carlinha aprendeu a falar palavras boas que alegram as pessoas, e não palavras que machucam; quais palavras carinhosas você pode dizer para alegrar alguém hoje?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você pode cuidar de não falar coisas feias que deixam os outros tristes?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 13$t$, 13,
$conteudo$Olhando para seu passado, Matheus sentia-se orgulhoso de tudo que havia conquistado, desde o dia em que aprendera uma valiosa lição durante sua infância. Quando pequeno, seu melhor amigo havia ganhado um carrinho elétrico que movia-se a pilha e na época, era o brinquedo que os meninos mais queriam ter, mas só seu amigo tinha. Secretamente, Matheus o invejava e desejava que seus pais fossem tão legais quanto os dele, pois os seus não pretendiam lhe dar um presente tão caro, como era aquele. Por dias, ele mal quis brincar com seu amigo, que sempre o chamava para brincarem juntos com o tão cobiçado carrinho à pilha. Um dia, quando já não aguentava mais de curiosidade, aceitou o convite. Na casa de seu amigo, brincaram a tarde toda, quando por fim, confessou ao amigo que tinha sentido inveja por ele ter ganhado o presente de seus pais quando os seus nem queriam pensar no assunto. Matheus, perplexo ouviu o amigo contar-lhe que ele não havia ganhado, ao contrário, passou meses fazendo tarefas extras para seus pais e familiares em troca de alguns reais. E foi com esse dinheiro, que comprou o carrinho. Matheus foi para casa, envergonhado. Não só por ter sentido inveja, não só por ter pensado mal de seus pais, mas por ter percebido que ele era o tipo de pessoa que queria conseguir as coisas do jeito fácil, sem trabalhar por isso. Então ele fez uma oração. Deus, estou envergonhado pela forma que tenho agido. Eu não queria ser invejoso e não queria ser preguiçoso. Me perdoe por não ter me esforçado, pelas coisas ruins que pensei e sentimentos ruins que tive. Vou me esforçar a partir de agora, para entender o merecimento de quem consegue algo, sem inveja-la. Também me esforçarei para conseguir o que quero e não esperarei ganhar sem merecer. Por favor, me capacita para ser melhor e conseguir o melhor. Amém.

Para meditar:

O preguiçoso cobiça, mas nada obtém. É o desejo dos homens diligentes que é satisfeito. Provérbios 13,4$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Matheus aprendeu que é mais bonito conquistar as coisas com esforço do que sentir inveja; o que você gostaria de conseguir se esforçando bastante?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você sente vontade de ter o que é do coleguinha, como conversar com Deus pode ajudar seu coração?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 14$t$, 14,
$conteudo$Na casa de Luana, as coisas são bem simples. Ela e suas 3 irmãs dormem no mesmo quarto, as mais novas dividem a mesma cama. Seus pais dormem em um sofá-cama na sala, onde uma cortina separa o cômodo, da cozinha. E o banheiro, nem sempre tem água quente para o banho. Na mesa, embora não haja fartura, nunca falta o que comer. No frio, embora não tenham os tecidos mais finos, as cobertas nunca lhe deixam passar frio, as paredes, embora tenham a tintura descascando, nunca lhes deixaram desabrigados. Os pais, embora ganhem pouco, nunca ficaram sem emprego ou adoecidos sem poder trabalhar. E todos, sem exceção de nenhum membro daquela família, não só agradeciam como também ajudavam com frequência qualquer um que precisasse. Não tinham muito, mas sempre que podiam, alimentavam quem tinha fome, cobriam quem tinha frio, abraçavam aquele que estava sozinho e aflito. O pouco que tinham nunca fora motivo para não ajudar o próximo, se alguém sofria, a família estava sempre à disposição com todo seu amor e simplicidade. Luana, toda noite, agradecia a Deus por terem essa capacidade e sempre pedia por mais. Senhor Deus, o Senhor sabe que não temos muito a oferecer, mas não deixe que nos passe despercebido alguém em necessidade, encha nosso coração de amor e boa vontade pelo próximo, pois somos todos filhos do mesmo Pai. Não pedimos nada em troca, só queremos poder ajudar quem necessita, assim como o Senhor sempre nos ajudou. Amém.

Para meditar:

Quem despreza seu próximo comete um pecado; feliz aquele que tem compaixão dos desgraçados. Provérbios 14,21$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A família da Luana tinha pouco, mas sempre ajudava quem precisava; de que jeitinho você pode ajudar alguém, mesmo com coisas pequenas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você se sente quando divide o que tem ou dá um abraço em quem está triste?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 15$t$, 15,
$conteudo$Lá do alto, Deus, como estava sempre a fazer, observava suas preciosas crianças. Estavam todos lá, não importava a distância uma das outras, Ele as observava, as conhecia pelo nome, reconhecia seus rostos e amava a todas. Nem sempre gostava do que via, às vezes, uma delas ou um grupo delas, fazia coisas que Ele não aprovava. Mas fizessem coisas boas ou más, seus olhos não se desgrudavam delas por nenhum segundo. Algumas sabiam que Deus as observava, outras nem faziam ideia. Queria Ele que todas soubessem, para que não se sentissem sozinhas e abandonadas como muitas se sentiam. Queria que soubessem o quanto Ele as amava e o quanto queria cuidar delas. De qualquer forma, não as deixaria nunca, torcia para que as que soubessem disso, não esquecessem e as que não sabiam, descobrissem. Como gostava de ouvir as suas orações tanto quanto gostava de acompanhá-las, ouviu oração por oração, uma delas, a de Marina. Papai do céu, às vezes, eu faço coisas boas, mas também faço coisas más. Eu sei que quando erro, preciso pedir perdão. Eu não quero errar e fico triste quando isso acontece, mas sei que mesmo assim o senhor me ama e cuida de mim. Sei que aí de cima o Senhor me vê e quero que só veja coisas boas, não só de mim, mas de todo mundo. Sei que nem sempre é assim e que o Senhor fica muito triste com isso. Vou sempre tentar ser melhor e se eu puder contar para o máximo de pessoas possíveis que o senhor está a nos observar, eu contarei. Talvez elas prestem mais atenção no que fazem por saber que há quem olhe por elas o tempo todo. Amém.

Para meditar:

Em todo o lugar estão os olhos do Senhor, observando os maus e os bons. Provérbios 15,3$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Marina lembra que Deus a vê e a ama o tempo todo, mesmo quando ela erra; como você se sente sabendo que Deus está sempre cuidando de você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A Marina quis contar pros outros que Deus os observa com amor; pra quem você gostaria de contar isso?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 16$t$, 16,
$conteudo$Suzana é uma menina inteligente, cheia de sonhos e planos para o futuro. Quando crescer, quer ser 1001 coisas e um pouco mais. Quer aprender muitas coisas interessantes, ter muitas aventuras, fazer viagens, salvar o mundo, alimentar os pobres, quer ser médica, astronauta, professora, veterinária, chef de cozinha e presidente da república. Ainda não sabia por onde começar e embora soubesse que não daria para ser tudo, queria ser e faria de tudo para conseguir. Seus pais e professores a incentivavam a sonhar e fazê-los se tornarem reais, mas ela sabia que não bastava simplesmente querer, precisava também que Deus estivesse com ela em todo o caminho. Sabia que se confiasse Nele, seus planos teriam muito mais chances de se tornarem reais. Por isso, em suas orações, Suzana nunca esquecia de confiar seus planos a Deus. Senhor Deus, o Senhor sabe o que meu coração deseja. Saiba que confio em Ti. Peço que me acompanhe em meu caminho e me ajude a conquistar meus sonhos. E aquilo que eu não conseguir, ajude-me a compreender que foi o melhor, pois o Senhor sabe de todas as coisas e cuidará de mim a todo tempo. Amém.

Para meditar:

Confia teus negócios ao Senhor e teus planos terão bom êxito Provérbios 16,3$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Suzana tem muitos sonhos e confia eles a Deus; qual é um sonho seu que você gostaria de contar para Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como confiar em Deus pode te dar mais coragem para correr atrás dos seus sonhos?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 17$t$, 17,
$conteudo$Lucas, menino bondoso e cheio de compaixão, fazia o que podia para ajudar quem precisava e sentia-se profundamente triste quando alguém tratava mal àquele que pouco tinha. Desde cedo aprendeu que fazia a Deus feliz sempre que cuidava de alguém com poucas condições. Não havia muito que pudesse fazer, além de doar seus pertences não mais utilizados e convencer os pais a separar alguns mantimentos, tentava incentivar outras pessoas a fazer o mesmo. Infelizmente, algumas pessoas não sentiam a mesma compaixão que ele, falavam coisas feias e tratavam os pobres com desprezo e maldade. Lucas sofria com isso, então fazia a única coisa que podia, orava. Deus, muitas pessoas passam necessidades e muitas outras, nem se importam. Pessoas que tem muito, mas que não fazem nada para ajudar. Pessoas que falam maldades e desprezam aqueles que mais precisam. Eu gostaria de te pedir, Deus, que mude o coração destes. Eles nunca devem ter tido alguém que os ensinasse sobre amor e bondade. Eu sei que o Senhor cuida de quem precisa e também cuida de quem cuida deles. Nos ajude a poder ajudá-los cada vez mais e não deixe que lhes façam mal. Amém.

Para meditar:

Aquele que zomba do pobre insulta seu criador; quem se ri de um infeliz não ficará impune. Provérbios 17,5$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Lucas é bondoso e gosta de cuidar de quem tem pouco; como você pode tratar com carinho as pessoas que mais precisam?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O Lucas orava pedindo que as pessoas tivessem o coração mais amoroso; por quem você gostaria de orar assim?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 18$t$, 18,
$conteudo$Para uma menina de sua idade, Dayane tinha a vida bem agitada. Onde quer que fosse, fazia amizade com muita facilidade. Todos pareciam gostar dela de imediato e por isso sempre recebia convites de seus amigos para fazer várias coisas. Até então, acreditava ela que sempre que precisasse de alguém, teria muitos amigos para pedir ajuda. Por um infortúnio, Dayane precisou ficar alguns dias afastada da escola, mas não se preocupou, tinha amigos que a ajudariam a acompanhar as matérias para que não se atrasasse. Isso não aconteceu. Todos os seus amiguinhos preferiram fazer coisas mais divertidas que ajudá-la com os deveres de casa. Por um tempo, ela ficou triste, mas logo ficou aliviada. Agora sabia que aquilo não era amizade e por ter tido a oportunidade de descobrir isso, agradeceu a Deus. Obrigada Deus, por ter me mostrado a verdade sobre amizade. Descobri de um jeito triste, mas estou feliz com isso. Eu te peço por favor, que quando eu me tornar amiga de alguém, eu saiba como ser uma boa amiga. E quando alguém se tornar o meu, que seja uma amizade verdadeira e recíproca. Não quero falsas amizades, sei que o Senhor colocará em meu caminho aqueles que realmente serão amigos e tirará os que não forem. Me ajude a enxergar melhor quem são eles. Amém.

Para meditar:

O homem cercado de muitos amigos tem neles sua desgraça, mas existe um amigo mais unido que um irmão. Provérbios 18,24$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Dayane descobriu como é uma amizade de verdade; o que você acha que um amigo de verdade faz quando você precisa de ajuda?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você pode ser um bom amigo, daqueles que ajudam mesmo quando dá um pouquinho de trabalho?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 19$t$, 19,
$conteudo$Muito chateava a Deus, sempre que via alguns de seus pequeninos tratar mal os pais. Não importava quem fossem os pais ou o quão errantes pudessem ser, para ele, ver um filho faltar com respeito, era uma das piores coisas que as crianças podiam fazer. Para Deus, amar ao próximo era essencial na vida de qualquer um que quisesse ser feliz e seguir seus caminhos. Amar e respeitar aos pais, é saber amar ao próximo e ainda mais. Afinal, geraram uma vida. Com frequência e infelizmente, Deus ouvia orações de crianças que sofriam ou por terem pais ausentes, ou pais abusivos, ou pais alcoólatras, pais que no geral, também não se portavam como bons pais. Mas orgulhava- se destes e muito lhes prometia para o futuro. Como Ana, que fazia toda noite a seguinte oração:

Boa noite, Deus. Hoje senti falta de meus pais, desde que me deixaram aos cuidados de minha avó. Me ajude a não sentir raiva deles, me ajude a entendê-los, a respeitá-los, a ser grata por terem me gerado. Obrigada por ter me dado a oportunidade de ser filha deles, pois sem eles, eu não estaria aqui. Cuide deles onde quer que estejam. Amém. Também ouvia a de Thiago:

Deus, hoje meu pai bebeu mais que o normal. Não gosto quando ele fica assim, quando o vejo chegar em casa fora de si e com machucados pelo corpo. Por favor, ajude meu pai, me use se necessário. Me ajude a cuidar dele para que um dia ele melhore. Amém. E felizmente, ouvia muitas também como a de Cecilia:

Pai, assim como o Senhor, meus pais são maravilhosos e por isso, Te agradeço. Se em algum momento eu os magoar com alguma atitude, me corrija e me ajude a me redimir. Eles merecem de mim todo o amor e respeito que eu posso dar. Amém.

No fim das contas, felizes seriam todos eles que seguissem esse conselho de Deus. Estes, jamais seriam motivo de vergonha.

Para meditar:

Quem maltrata seu pai, quem expulsa sua mãe é um filho infame do qual todos se envergonham. Provérbios 19,26$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Ana, o Thiago e a Cecilia oraram por seus pais de jeitos diferentes; como você pode orar com amor pela sua família hoje?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que maneira carinhosa você pode mostrar respeito e gratidão por quem cuida de você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 20;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 20$t$, 20,
$conteudo$Tem quem faça de tudo para evitar uma briga, mas também há aqueles que fazem de tudo para começar uma. Seja o motivo que for, do mais banal ao mais sério. Miguel era o tipo de menino que evitava brigas, aprendeu desde cedo que brigar, discutir, esbravejar, nunca é a solução. Além do que são atitudes que podem trazer sérias consequências, pessoas se machucam em brigas, se magoam, podem até fazer algo ilegal. Miguel sempre soube que agir de tal forma não agradava a Deus, então sempre buscou ser pacifico. Algumas crianças diziam que ele era medroso quando se recusava a brigar, mas ele respondia dizendo que medroso é quem precisa agir assim para provar algo a alguém e que ele não precisava provar nada. Sempre que alguém o desafiava, em silêncio, Miguel orava. Deus, esteja comigo e me ajude a ser forte, forte para lutar contra os impulsos que me levariam a fazer algo que não quero. Me ajude a ser sábio, para que eu possa sempre evitar qualquer contenda, para que eu saiba resolver qualquer situação sem usar da força e sem erguer a voz. Me ensina a propagar a paz. Amém.

Para meditar:

É uma glória para o homem abster-se de contendas; o tolo, porém, é o único que as procura. Provérbios 20,3$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Miguel preferia fazer as pazes em vez de brigar; o que você pode fazer para resolver uma briguinha sem gritar nem machucar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como pedir ajuda a Deus pode te dar forças para ser um espalhador de paz?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 21;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 21$t$, 21,
$conteudo$Carlinhos, assim era chamado. Carlinhos sempre foi baixo, menor que os colegas da mesma idade e por isso, sempre lhe tiravam sarro e muitas vezes, era intimidado com brincadeiras maldosas por garotos maiores. Por algum motivo, achavam que por ele ser baixinho, era legal lhe dar petelecos, lhe fazer tropeçar, entre outras “brincadeiras”. Fato era que Carlinhos não achava graça nenhuma, mas não revidava, pois não acreditava que a violência era a forma correta de resolver os problemas. E sabem? Carlinhos tem toda a razão. Claro que não sucumbir a vontade de fazer com os outros meninos o que faziam com ele, era uma tarefa difícil, mas ele sabia onde encontrar força e coragem para agir melhor com os outros do que como agiam com ele. Carlinhos orava. Deus, em Sua palavra aprendi que nada justifica a violência e desejo do fundo do coração, nunca recorrer a ela. Às vezes, é difícil, mas sei que O Senhor me dá a força e coragem para enfrentar meus problemas sem precisar usar da força, sem precisar machucar ninguém, sem precisar sentir raiva e fazer dela o guia dos meus atos. Te peço que continue sendo meu guia, para que o amor sempre prevaleça em meu coração e que a violência nunca tome conta de mim. Amém.

Para meditar:

A violência dos ímpios os conduz à [ruína], porque se recusam a praticar a justiça. Provérbios 21,7$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Carlinhos não revidava as provocações porque sabia que a violência não é o caminho certo; o que você pode fazer quando alguém te provoca?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como deixar o amor guiar o seu coração, em vez da raiva, pode te ajudar nos momentos difíceis?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 22;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 22$t$, 22,
$conteudo$Lá do alto, como fazia todos os dias, Deus observava seus filhos. Era-lhe muito precioso ver os adultos ensinando às crianças sobre seu grande amor e bondade. Pois para serem bons adultos, é muito importante que conheçam desde cedo, sobre o caminho correto, o caminho de seu grande Pai. Deus via papais e mamães, avós, professores, tios e tias, e tantas outras pessoas falando de Seu bom nome aos pequenos e sentia muito orgulho. Todos eles haviam sido crianças e a maioria deles tiveram em sua infância, adultos que lhes ensinaram o que agora estão ensinando. E graças a isso, as crianças de agora, fariam o mesmo quando crescessem. Por isso amava ouvir orações como a de Pedro. Papai do céu, queria muito te agradecer por ter colocado em minha vida tanta gente boa que me ensina sobre Ti, sei que por isso, vou poder fazer muitas boas escolhas no meu futuro, pois saberei escolher de acordo com seus ensinamentos. E eu gostaria muito de poder fazer o mesmo por outras crianças quando eu já estiver grande. Amém.

Para meditar:

Ensina à criança o caminho que ela deve seguir; mesmo quando envelhecer, dele não se há de afastar. Provérbios 22,6 Obs: Querido amiguinho, querida amiguinha: leve esta historinha para que os adultos de sua família leiam. Esta historinha também foi escrita para eles, pois precisam saber como Deus ama quando te ensinam sobre seu grande amor e que não devem nunca deixar de fazê-lo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Pedro agradeceu pelas pessoas boas que lhe ensinam sobre Deus; quem são as pessoas que te ensinam coisas boas e sobre o amor de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você crescer, o que você gostaria de ensinar de bom para outras crianças?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 23;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 23$t$, 23,
$conteudo$Nem tudo que brilha, é ouro. Às vezes, algo que parece bom e bonito, é fruto de algo errado. Às vezes, as pessoas preferem conseguir coisas boas, fazendo coisas ruins. E por isso, abrem mão de ter um coração puro e alma tranquila. Abrem mão de ensinamentos, por um punhado de bens e riquezas, abrem mão do amor de Deus, por coisas que fornecem uma felicidade momentânea. Depois, essas mesmas pessoas choram quando percebem que estão sozinhas e sem amor. Mas ficaram assim, por que assim escolheram. Por isso, crianças, em suas orações, nunca esqueçam de pedir a Deus, sabedoria para não os deixar querer coisas que não agradam a Deus, ou conseguir coisas usando de métodos que não sejam corretos e justos. Orem como Lorenzo ora:

Senhor Deus, me desculpa por em alguns momentos, querer coisas que eu sei não serem boas para mim. Me desculpa se, às vezes, penso em fazer algo errado para conseguir algo que eu queira muito. Mas obrigado por me ajudar a perceber antes que seja tarde, que o caminho certo nunca será fazer algo que tire meu coração do caminho reto, do caminho da justiça e da honestidade. Por favor, te peço que sempre me corrija, sempre me mostre quando eu estiver prestes a cometer um erro. Me ajude a sempre estar de coração aberto e ouvidos atentos a ti, pois não desejo nunca, abrir mão de todo seu amor por nada e nem por ninguém. Amém.

Para meditar:

Que teu coração não inveje os pecadores, mas permaneça sempre no temor do Senhor Provérbios 23,17$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Lorenzo pediu a Deus para nunca querer coisas conseguidas de um jeito errado; por que é melhor conquistar as coisas pelo caminho certo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você sente vontade de fazer algo que não é bom, como Deus pode te ajudar a perceber e escolher o certo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 24;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 24$t$, 24,
$conteudo$Raul estava com alguns problemas na escola. Alguns meninos implicavam com ele, pois era péssimo na aula de educação física, acabava sempre ficando no banco da reserva e sempre era escolhido por último na formação de times. Os colegas de classe diziam que era era atrapalhado e tinha dois pés esquerdos, comentários que o deixava triste. Ele sabia que era verdade, mas não precisavam caçoar dele por isso, havia outras coisas em que ele era bom e não tinha problema não saber fazer algo. Depois de muitos jogos no banco, Raul percebeu que não estava sentado sozinho daquela vez. Um dos meninos que implicavam com ele, também estava lá e muito triste. Como as crianças costumam conversar sobre tudo que acontece na turma, ele sabia que o colega ali sentado, estava indo muito mal em algumas matérias e por isso, seus pais haviam proibido qualquer brincadeira até que recuperasse suas notas. E seus professores, sugeriram que na aula de educação física, ele passasse estudando para que não corresse o risco de passar as férias em recuperação. Raul sentiu vontade de rir, por um momento, alegrou-se. Mas sentiu vergonha por tais sentimentos, não era certo se alegrar quando alguém se dava mal. Então foi até o colega, ofereceu ajuda nos estudos e sentou ao seu lado em todos os jogos seguintes. Um tempo depois, Raul fez a seguinte oração:

Obrigado, Deus, por ter ajudado meu amigo a passar nas provas. Ele ficou muito feliz por ter conseguido e eu fiquei feliz por ele. Me perdoa, pois eu tinha me alegrado quando soube que ele estava indo mal, sei que estava errado, mas o Senhor me mostrou isso na hora e eu entendi. Obrigado por sempre me ensinar as melhores lições.

Para meditar:

Não te alegres, se teu inimigo cair, se tropeçar, que não se rejubile teu coração; Provérbios 24,17$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Raul, em vez de rir do coleguinha que estava mal, decidiu ajudá-lo; como você pode ajudar um amiguinho que está passando por um momento difícil?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que é mais bonito torcer pelo coleguinha do que se alegrar quando ele se dá mal?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 25;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 25$t$, 25,
$conteudo$Mariana sempre teve uma vida privilegiada, estudou nas melhores escolas, vestiu as melhores roupas, calçou os melhores sapatos, viajou aos lugares mais incríveis. Agradecia a Deus todos os dias por ter tido tantas oportunidades. Deus a observava lá do alto e se orgulhava dela, pois nunca agiu como se fosse melhor do que alguém só por ter tido mais recursos durante a infância e agora durante a vida adulta. Deus lembrava-se dela quando mais nova, lembrava-se de todas as vezes que ela rejeitou que lhe dessem coisas que não merecia, todas as vezes que ela negou favores. Sempre tentou ser justa e nunca deixou que a tratassem melhor do que outras pessoas só por causa de suas boas condições. Lembrava principalmente, de suas orações, que eram mais ou menos assim:

Senhor Deus, sou feliz por tudo que o Senhor deu a mim e a minha família. Fico triste quando percebo que outras pessoas querem me tratar como se eu fosse melhor que qualquer um que não tenha o que eu tenho. Por favor, eu te peço que nunca me deixe ceder e permita que meu coração seja sempre humilde. Me ensine cada vez mais sobre a humildade, pois sei que como qualquer outro, eu sou Sua filha e isso me torna igual a todos. Amém.

Para meditar:

Não te faças de pretensioso diante do rei, não te ponhas no lugar dos grandes. Provérbios 25,6$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Mariana tinha muitas coisas, mas nunca se achava melhor que ninguém; como você pode tratar todo mundo como igual, com humildade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que você acha que Deus fica feliz quando a gente tem um coração humilde?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 26;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 26$t$, 26,
$conteudo$Oque Deus deseja aos seus pequenos? Que sejam sábios para andar no caminho certo, para escolher os amigos certos, para que consigam diferenciar os bons dos maus, os que lhe querem bem dos que lhe querem mal. Pois é inevitável que no decorrer de suas vidas, se deparem com pessoas que não serão aquilo que aparentam ser e não farão aquilo que aparentam fazer. Então lá de cima, Deus faz o que pode para afastar de seus pequenos qualquer um que lhes queira mal, mas nem sempre poderá fazê-lo. Um dia, eles vão querer tomar a própria decisão, então só lhe bastará observar e esperar. Não era à toa que a felicidade era tanta quando as crianças já demonstravam saber sobre essas escolhas difíceis do futuro. Amava quando ouvia orações como as de Felipe. Escutava cheio de alegria. Felipe orou, assim:

Deus, meu pai do céu. Eu sei como é difícil, às vezes, diferenciar uma pessoa boa que nos quer bem, de uma pessoa ruim que nos quer mal. As pessoas mentem, querem enganar, querem nos fazer acreditar em falsidades. Eu te peço, por favor, que revele estas pessoas a mim para que eu possa manter-me longe. Me ensine a ser sábio para poder diferenciar uma de outra e não me deixe ficar enganado. Mantenha próximo a mim aqueles que verdadeiramente me amam e que principalmente, nunca fariam nada para me afastar do Senhor. Amém.

Para meditar:

pode dissimular seu ódio sob aparências, e sua malícia acabará por ser revelada ao público. Provérbios 26,26$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Felipe pediu a Deus sabedoria para reconhecer quem o quer bem; como você percebe que alguém é uma pessoa boa e amiga de verdade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como pedir ajuda a Deus pode te proteger das pessoas que querem te enganar?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 27;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 27$t$, 27,
$conteudo$Angélica é o tipo de menina que tem todos os passos planejados. Se preocupa com tudo que diga respeito a sua vida futura. Já sabe o curso universitário que vai fazer, já decidiu o tipo de casa em que vai morar, já sabe inclusive quantos filhos vai ter e as profissões que eles terão, se depender dela. Ela sabe que são preocupações exageradas. Sabe que o amanhã pertence a Deus e que nada depende dela. Mas se tem uma coisa que ela não consegue fazer, é esperar. Gosta de decidir tudo, gosta de saber de tudo, gosta de estar no controle. Felizmente, inteligente como é, com frequência pede ajuda a Deus, para que ele a controle e a ajude a ser menos preocupada com o futuro, pede que independente de suas vontades, que as dele sejam feitas. Deus, eu sei que meus planos podem não ser os seus e que o amanhã só a ti pertence. Reconheço minha dificuldade em agir de forma condizente a isso e peço que me ajude a corrigir este problema. Me ensine a confiar mais em ti, me ensine a saber esperar o seu amanhã, me ensine a esperar que o senhor aja, antes que eu mesma tome uma decisão precipitada. O Senhor sabe das vontades do meu coração, mas só o Senhor sabe o que será bom para mim. Eu confio em ti e peço que esteja sempre a frente de mim. Amém.

Para meditar:

Não te gabes do dia de amanhã porque não sabes o que ele poderá engendrar. Provérbios 27,1$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Angélica está aprendendo a confiar mais em Deus e a não se preocupar tanto com o amanhã; o que te ajuda a ficar tranquilo quando você fica preocupado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como confiar que o amanhã pertence a Deus pode deixar o seu coração em paz?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 28;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 28$t$, 28,
$conteudo$Henrique estava chateado, havia feito algo errado e não havia conseguido contar aos seus pais a respeito. Sentia uma tremenda culpa e passou a semana toda angustiado e decepcionado consigo mesmo. Queria muito contar aos seus pais que perdeu uma importante prova na escola, pois faltou a aula sem autorização e foi ao cinema com os amigos. Não era para ter dado problemas, mas houve uma prova surpresa em uma matéria em que ele não estava bem e por causa disso, teria que ficar de recuperação. De início contou aos pais uma mentira, contou que havia feito a prova e ido mal, mas arrependeu-se assim que terminou de contar a falsa história. Agora, trancado em seu quarto, só conseguiu pensar em fazer uma coisa. Uma oração:

Deus, me desculpe pela mentira que contei aos meus pais. Fiquei com medo de falar a verdade e achei que não fosse importar. Mas sei que importa, sei que quem omite seus erros e não admite tê-los cometido, não será perdoado. E eu não quero passar a minha vida carregando um erro sem perdão. Eu vou falar a verdade aos meus pais assim que acabar esta oração. Me ajude a ter força e coragem e obrigado pelos ensinamentos. Amém.

Para meditar:

Quem dissimula suas faltas, não há de prosperar; quem as confessa e as detesta, obtém misericórdia. Provérbios 28,13$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Henrique decidiu falar a verdade aos pais depois de ter contado uma mentira; por que você acha que falar a verdade deixa a gente mais aliviado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando você faz algo errado, como pedir coragem a Deus pode te ajudar a ser sincero?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 29;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 29$t$, 29,
$conteudo$Se as crianças pudessem governar, as decisões seriam com certeza, tomadas com muito mais amor ao próximo, com mais justiça, com mais inocência. Se nossos governantes pudessem ter uma mente e um coração mais parecido com o de uma criança, com menos ganância, menos egoísmo, menos injustiças, como estaríamos melhor cuidados e protegidos. Mas enquanto isso não acontece, nada nos impede de pedir a Deus que nos ajude a chegar lá. Ser criança e não poder governar, não diminui a responsabilidade em lutar por mudanças. E como fazer isso? Com uma oração, é claro. Oremos assim:

Senhor Deus, governante de todo o mundo, justo e amoroso. Por favor, olhe por nós, cuide de nós mesmo que estejamos cercados de injustiças e que o amor pareça estar acabando entre as pessoas. Não nos deixe crescer achando que isso seja normal. E para aqueles que estão no poder, guie-os para que possam ajudar a melhorar a vida das pessoas. Não permita que continuem cegos pela ganância, pela corrupção, pelo egoísmo. Que eles possam um dia, ser mais parecidos com o Senhor. Amém.

Para meditar:

Quando dominam os justos, alegra-se o povo; quando governa o ímpio, o povo geme. Provérbios 29,2$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A oração de hoje pede mais justiça e amor no mundo; mesmo sendo criança, o que você pode fazer de bom para deixar o mundo mais gentil?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por quem você gostaria de orar para que as pessoas sejam cuidadas e tratadas com amor?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 30;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 30$t$, 30,
$conteudo$Se tem algo que criança gosta, é de ganhar presentes. Não é verdade? Lucia, Jéssica, Enzo, Carlos, Eduardo, Karen e tantas outras, alegram-se por ter brinquedos divertidos, roupas legais, e muitas coisas mais. Não estão erradas em gostar, só não podem esquecer que a verdadeira felicidade não vem deles, e sim de Deus. Outras crianças, como Manoela, Davi, Dayane, Miguel, são daquelas que fazem amizade fácil, conversam com todos e fazem desses seus melhores amigos. Também não estão erradas, só não podem acreditar que substituem o amor de Deus. Por isso, se você é criança e com certeza faz parte destes grupos, lembre-se de fazer suas orações e sempre mencionar o seguinte:

Deus, obrigado por tudo que fazes por mim. Sei que acima de todas as coisas, o mais importante é o amor que recebo de ti. Sei que sempre me proverá o melhor. Sei que sempre cuidará de mim e que se um dia alguém me magoar, o Senhor irá curar minhas feridas. Não vou te pedir nada, pois só preciso de Ti em minha vida. E por isso, só quero te agradecer com toda minha sinceridade. Amém.

Para meditar:

afasta de mim falsidade e mentira, não me dês nem pobreza nem riqueza, concede-me o pão que me é necessário Provérbios 30,8$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$É gostoso ganhar presentes e ter amigos, mas a maior alegria vem do amor de Deus; o que te faz sentir o amor de Deus no seu dia?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você pode agradecer a Deus, mesmo sem pedir nada, só porque o ama?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 31;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 31$t$, 31,
$conteudo$Ésábado, Deus não está descansando. Está a trabalhar arduamente, tem muito a cuidar lá de cima. Mas mesmo assim, sempre tem tempo para observar seus filhos mais preciosos, suas lindas e inocentes, cheias de amor e pureza, crianças. E como lhe enche o coração de felicidade ver como se importam em fazer o bem. Não é só uma criança, são grupinhos da catequese, são grupos escolares, crianças de outras religiões, crianças que ainda não tiveram a oportunidade de conhecer a Deus. São crianças que neste momento e em muitos outros, estão ajudando o próximo. Visitam aqueles de idade avançada que a família já não procura mais. Fazem mutirões para arrecadar alimentos ou vestes, para aqueles que perderam tudo de alguma forma. Dão abraços quando alguém chora sozinho. Defendem aqueles que não conseguem falar por si e não tem quem fale por eles. Como Deus se agrada de ver seus pequenos agindo com amor e bondade e ouvir suas orações tão livres de vaidade, é o que completa a perfeição de seus atos. Senhor Deus, não é por sermos crianças que não podemos fazer o bem. Temos muito amor no coração e queremos sempre seguir seus ensinamentos que falam sobre caridade, amar o próximo, respeitar os mais velhos e tantos outros. Ajude-nos a ser uma esperança para aqueles que precisam de algum tipo de conforto. A ser o amor daqueles que precisam de carinho. A ser a compaixão para aqueles que estão envergonhados. Nos ajude a ser um espelho de Ti. Amém.

Para meditar:

Abre tua boca a favor do mundo, pela causa de todos os abandonados; Provérbios 31,8$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$As crianças da história ajudam os outros de muitos jeitos, com abraços, visitas e carinho; qual gesto de bondade você gostaria de fazer por alguém?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você pode ser um espelho do amor de Deus para quem precisa de conforto?$p$, 'reflexao', null);
  end if;

end $migration$;
