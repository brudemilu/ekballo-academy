-- =============================================================
-- Curso: Uma Garota Segundo o Coração de Deus
-- Devocional infantojuvenil de Elizabeth George (CPAD), 11 aulas.
-- Transcricao na integra. Atividades = perguntas de reflexao
-- (tipo='reflexao'). Cabecalhos de secao em CAIXA ALTA renderizam como
-- titulos (ehTitulo()). Idempotente.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'garota-segundo-coracao-de-deus';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('garota-segundo-coracao-de-deus','Uma Garota Segundo o Coração de Deus','Um devocional cheio de carinho para meninas, a partir de Uma Garota Segundo o Coração de Deus, de Elizabeth George. Em onze aulas, a autora — com a ajuda da personagem Emma — conversa com a leitora sobre amar a Jesus em cada área da vida: o coração, o quarto, os pais, a família, a escola, as amigas, a igreja, a autoimagem, o tempo e a grande aventura de caminhar com Ele. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão simples e gentis para aplicar no dia a dia.','/api/og/curso/garota-segundo-coracao-de-deus', false, 0, 'infantil', v_next_ordem, true)
    returning id into v_curso_id;
  end if;


  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução — Uma Mensagem só para Você$t$, 1,
$conteudo$Olá!

Eu sou Elizabeth, e estou muito feliz em conhecê-la! E estou tão feliz por você estar segurando este livro em suas mãos! Mal posso esperar para lhe dizer o quanto estou animada por que você e eu vamos fazer uma caminhada juntas com Jesus! Eu também convidei uma garota chamada Emma para vir conosco. Ela é uma pré-adolescente assim como você que ama a Deus e quer ser uma garota segundo o coração dEle.

Enquanto você se prepara para fazer essa emocionante viagem, aqui está uma pequena lista para começar sua aventura.

Abra seu livro ...

... e aproveite. É só um livro! Não é lição de casa. Não é uma leitura obrigatória. Não é uma tarefa. Não, escrevi este livro para ser uma aventura divertida. Tudo o que você precisa está aqui — exceto sua caneta ou lápis favorito. Eu até coloquei os versículos da Bíblia no livro para você. E se você tiver sua própria Bíblia à mão, ótimo!

Abra seu coração...

... para suas amigas. Vai ser tão legal ir nessa aventura com suas melhores amigas! Quanto mais garotas você conseguir juntar, mais feliz será sua aventura. E se a sua mãe é sua melhor amiga, você tem sorte. Peça-lhe para ler o livro com você. ... e ore. Peça a Jesus para ajudá-la a perceber o quanto Ele a ama. Peça também a Ele que a ajude a entender o que significa ser uma garota segundo o coração dEle.

... e sonhe! Sonhe com o seu futuro. Sonhe com todas as coisas legais que você quer fazer, adora fazer e espera fazer. Você é muito especial, e nunca é demais sonhar seus sonhos especiais. Eles são uma parte da pessoa maravilhosa que você é. Eu sei que você vai pegar muitas dicas deste livro que irão ajudá-la a viver o seu sonho Número Um — ser uma garota segundo o coração de Deus!

Você está pronta para deixar a diversão começar? Eu estou! Ao ler, lembre-se de que todas as páginas deste livro estão cobertas de minhas orações por você. E cada palavra foi escrita com vocês em minha mente e em meu coração. Eu tenho estado com vocês em meu coração enquanto me sento aqui no meu escritório pensando em vocês, orando por vocês e escrevendo para vocês. Também tentei imaginá-las na casa de vocês — seja em um apartamento na cidade ou em uma casa no subúrbio ou em uma fazenda. E tentei imaginar você em seu quarto e com sua família. Quando digo que considero você como uma amiga sem nem conhecê-la pessoalmente, estou falando sério!

Entãooo — fiquem em suas posições... aqui vamos nós!

No grande e maravilhoso amor de Jesus,

sua amiga e irmã em Cristo,

Elisabeth George$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Elizabeth diz que escreveu este livro como uma aventura divertida com Jesus, e não como uma tarefa de casa; o que mais deixa você animada para começar essa caminhada com Ele?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Ela conta que orou por você ao escrever cada página; como você se sente sabendo que Jesus também ama você e cuida de você desse jeito carinhoso?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A autora convida você a sonhar com o seu futuro e diz que o sonho Número Um é ser uma garota segundo o coração de Deus; qual é um sonho bonito que você gostaria de viver junto com Jesus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 1 — Meu Coração$t$, 2,
$conteudo$“E mma? Emma! Emma Thomas!” A Sra. Jones gritou. Não adiantou até que a amiga de Emma, Jenny, sacudiu o braço dela e Emma deixou de olhar pela janela e percebeu que todos na sua turma estavam olhando para ela.

“A senhora poderia, por favor, repetir a pergunta, Sra. Jones?” Emma perguntou timidamente à sua professora de história.

Emma estava em uma grande confusão desde que recebeu um convite para a festa de aniversário de Tiffany. Isso foi há uma semana, e Emma ainda estava presa na emoção de ser convidada para uma festa oferecida pela garota mais legal de sua sala. Durante meses, Emma ficou totalmente absorta em invadir o círculo da “garota legal”. Por fim, parecia que seu trabalho duro estava finalmente valendo a pena. E agora que ela estava prestes a “entrar” nesse grupo de garotas, ela queria se concentrar em como permanecer “dentro” do círculo.

Diversão na Palavra de Deus!

Muitas coisas em nossas vidas atraem nossa atenção e nos distraem do que é realmente importante. Para Emma, foi um convite de aniversário que tirou sua mente de seus deveres escolares — e tudo mais. Ela simplesmente não conseguia parar de pensar naquela festa de aniversário! Então, qual é o problema? O que há de errado com uma festa e se divertir? Bem, não há nada de errado, claro! Mas a verdadeira questão era o foco do coração de Emma. O que ela realmente precisava era de uma melhor compreensão de onde Deus quer que suas garotas concentrem seus corações.

Para ajudá-la a olhar mais de perto o coração — seu coração — vamos nos divertir com o acróstico abaixo, formado pela palavra H-E-A-R-T (que quer dizer coração em Inglês). Eu estou supondo que você tem uma caneta ou lápis favorito, de sua cor preferida. (A minha é azul turquesa!) Qualquer que seja o seu favorito, pegue-o e mantenha-o à mão. Uma aventura com Jesus e uma viagem para dentro da Palavra de Deus estão prestes a começar!

Ao ler os versículos nos capítulos seguintes, você pode marcar o que gostar e aprender. E sinta-se livre para escrever em todas as margens! Também tente responder às perguntas, mesmo que apenas em sua mente. E se você não tiver uma caneta à mão ou se apenas sentir vontade de ler, tudo bem! Eu quero que a leitura deste livro seja divertida — não sinta como se fosse uma obrigação de outro trabalho de casa.

Bem, aqui vai! Sussurre uma oração a Deus e peça a Ele que trabalhe em seu coração.

Hoje, faça uma checagem no coração. Uau, Jesus estava sempre correto quando Ele dizia às pessoas que queriam segui-lo: “Pois onde estiverem as suas riquezas, aí estará o coração de vocês” (Mateus 6.21). Para Emma, seu “tesouro” — que era o seu coração — estava nos amigos, nas festas e “inserida” na multidão. Para as outras garotas, o tesouro de seu coração pode ser garantir as notas mais altas, ganhar troféus na ginástica ou usar as roupas certas.

Agora a grande questão é: onde está o seu tesouro? Onde está o seu foco? Onde está o seu coração? Uma garota segundo o coração de Deus quer ter a certeza de que seu tesouro — o que ela considera mais valioso e importante — é o que Deus diz que deveria ser.

Ao começar esta aventura em amar a Jesus e segui-lo, aqui está um versículo muito importante que mostra o que Deus quer para ser o primeiro em sua vida. É Atos 13.22 (TB) — e é puro dinamite! Neste versículo, Deus descreve o coração do homem que Ele escolheu para ser o rei sobre o seu povo. Aqui está o que Ele diz:

Achei a Davi, filho de Jessé, homem segundo o meu coração, e ele fará todas as minhas vontades. O que uma pessoa segundo o coração de Deus faz que a diferencia das demais?

Minha nova amiga, este é o objetivo deste livro — que você cresça como uma garota segundo o coração de Deus, uma garota que segue a Deus e esteja disposta a seguir a aventura de fazer o que Ele quer que você faça. Isso parece impossível?

Bem, não é. Leia!

Experimente o amor de Deus. Ter um coração para Deus começa com a percepção de que Deus ama você. Por mais que seus pais e avós a amem, ninguém a ama mais do que Deus. A Bíblia nos diz essas coisas sobre o amor de Deus: Deus é amor (1 João 4.8). O que você aprende sobre Deus neste versículo?

Porque Deus amou o mundo tanto [inclusive você!], que deu o seu único Filho, para que todo aquele que nele crer não morra, mas tenha a vida eterna. (João 3.16). Jesus, o único Filho de Deus, morreu pelos pecadores. O que isso lhe diz sobre o quanto Deus a ama?

Admita/permita que Deus lhe guie. Saber que Deus lhe ama requer uma resposta de você. Uma maneira fundamental de mostrar seu amor por Deus é fazendo o que Ele quer que você faça. Jesus nos diz na Bíblia quão importante é fazer a sua vontade. Ele disse:

Se vocês me amam, obedeçam aos meus mandamentos (João 14.15). O que um coração que ama a Jesus faz?

Como já descobrimos, uma garota segundo o coração de Deus é uma garota que fará o que Deus quer que ela faça. Seu pensamento é assim: “Se Deus quer que eu faça isso, vou fazê-lo. E se Deus não quiser que eu faça isso, não o farei”.

Você está se perguntando: “Como? Como posso saber o que Deus quer que eu faça? Como posso ter certeza do que Ele quer?” Bem, tenho boas notícias! Deus já declarou a sua vontade em sua Palavra, a Bíblia. Portanto, certifique-se de reservar algum tempo para ler sua Bíblia. Se você não tem certeza sobre o que está lendo, converse com seus pais, pastores ou professores da Escola Dominical. Deus lhe deu essas pessoas para guiá-la e ajudá-la a entender o que fazer.

A tua palavra é lâmpada para guiar os meus passos, é luz que ilumina o meu caminho. (Salmos 119.105). Como a Bíblia vai ajudá-la? Guardo a tua palavra no meu coração para não pecar contra ti (Salmos 119.11). Como o aprendizado e a memorização da Palavra de Deus irão ajudá-la?

Relembre, Deus quer que você o ame. Agora pense em algumas das coisas que você ama. Espero que sua mãe e seu pai surjam em sua mente. E talvez uma melhor amiga. Talvez você tenha pensado em seu novo filhote ou em um hobby como tricô, artesanato, patinação no gelo, natação, balé, música ou sua coleção de bonecas. Ou talvez praticar esportes como futebol, basquete ou tênis. Ou até mesmo coisas que você gosta de comer como sorvete, chocolate, batatas fritas e doces — humm!

Agora é hora de você fazer sua lista de “Coisas que eu amo”: Agora — de volta a Deus! Deus quer que você o ame. Na verdade, Ele quer estar no topo da sua lista de “coisas que eu amo”. Ele quer que você o ame mais do que todas as outras coisas. E Ele quer que você o ame de todo o seu coração. Jesus diz:

Ame o Senhor, seu Deus, com todo o coração, com toda a alma e com toda a mente (Mateus 22.37). Circule a palavra “todo (a)” todas as vezes que ela é usada.

Amor como este é uma tarefa difícil, não é? Mas é possível amar a Deus mais do que qualquer outra coisa. Tudo o que você precisa fazer é escolher colocá-lo em primeiro lugar em sua vida e em seu coração, um dia de cada vez. Aqui estão algumas maneiras de começar:

Quando você for para a cama à noite, diga a Deus que você o ama e que você vai pensar nEle primeiro assim que acordar. Então diga: “Boa noite, Senhor. Eu o amo!”

Quando você acordar, diga: “Bom dia!” para Deus. É como o rei Davi disse no Salmo 5.3: “Pela manhã, ouvirás a minha voz, ó SENHOR” (ARC). Agradeça ao Senhor por seu amor, suas bênçãos, todas as coisas boas em sua vida e seu dia novinho em folha. Eu não sei você, mas quando eu era uma menina, eu amava muito escrever no meu diário. Era um lugar especial e privado onde eu pude compartilhar sobre meu coração e minha vida. Muitas coisas acontecem em um dia, coisas que você não quer esquecer. Então escreva sobre elas! Mas não se esqueça de que a coisa mais importante a escrever é o que você aprendeu sobre Deus ou Jesus, e o quanto você o ama. Tente! Será apenas entre você e Deus, um tempo para dizer: “Obrigada por meu dia especial, Senhor.”

Tire a temperatura do seu coração. Ao longo deste livro, falaremos muito sobre o seu coração. Mas agora é hora de tirar a temperatura do seu coração. Você já sabe como sua mãe mede a temperatura do corpo com um termômetro quando você não está se sentindo bem. Isso a ajuda saber se você está doente ou não. E, se você estiver doente, isso a ajudará saber se você está um pouco doente ou realmente doente!

Pense nessa cena do livro do Apocalipse. Jesus está falando para as pessoas em uma certa igreja. Aqui está o que Ele disse para elas:

Eu sei o que vocês têm feito. Sei que não são nem frios nem quentes. Como gostaria que fossem uma coisa ou outra! Mas, porque são apenas mornos — nem frios nem quentes — vou logo vomitá-los da minha boca (Apocalipse 3.15, 16).

Jesus menciona três condições ou temperaturas cardíacas. Liste-as aqui. Ter um coração frio significa ser sem emoção, inconsciente de Deus. É difícil imaginar ser uma pessoa que nem sequer pensa em Deus! Ser morno significa ser indiferente e entediado. Oh céus! Imagine estar insensível em relação a Deus, entediado de Deus! A terceira temperatura — quente! — significa que o calor do seu coração e suas emoções em relação a Deus estão altíssimas. Isso significa que seu amor por Deus está transbordando de emoção, entusiasmo e paixão. É ardente! É o coração de alguém — você! — que ama a Deus e está comprometido com Ele.

DE CORAÇÃO PRA CORAÇÃO

Pense sobre o amor de Jesus só por um minuto. Ele lhe amou tanto que morreu por você para que você pudesse ter a vida eterna e estar com Ele para sempre. E pense em como Ele a amava antes mesmo de você amá-lo. Espero que seu coração esteja tão animado com Jesus agora quanto o meu. Se não estiver, espero que o seu coração se aqueça, acenda e comece a queimar com um verdadeiro amor por Jesus.

Todos os tipos de coisas excitantes e positivas podem acontecer quando você aumenta o calor do seu amor por Jesus. Então, vamos descobrir como você pode entender um pouco mais sobre Jesus e o plano dEle para você. Mas primeiro, faça esta oração. Suas palavras dirão a Jesus seu desejo de conhecê-lo e amá-lo cada vez mais: Querido Jesus, me ajude

a amá-lo mais,

a conhecê-lo melhor,

e segui-lo com todo o meu coração.

Amém.

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus, aprendendo sobre a importância do H-E-A-R-T (coração em inglês). Nesta página, escreva o assunto para cada letra. (Eu vou começar com o “H”.)

Hoje, faça uma checagem no coração.

E

A

R

T Agora, escreva uma coisa que você gostou, aprendeu ou quer fazer sobre seu coração e seu amor por Jesus. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Emma ficou tão distraída pensando na festa que esqueceu até da aula; o que costuma roubar a sua atenção e te faz esquecer de pensar em Jesus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Jesus disse que onde está o seu tesouro, ali está o seu coração; o que hoje é o tesouro mais importante do seu coração?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Uma maneira de amar a Deus em primeiro lugar é falar com Ele de manhã e de noite; qual é um jeito simples de você dizer "eu te amo" para Jesus quando acorda ou antes de dormir?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 2 — Meu Espaço$t$, 3,
$conteudo$Emma estava muito contente, extasiada. Sua avó estava vindo para uma visita! Ela mal podia esperar para ter sua Mimi em sua casa.

Finalmente Mimi chegou. Mesmo que a mãe de Emma tivesse dito a ela para dar a sua avó alguns minutos para descansar da viagem, Emma simplesmente não podia esperar. Assim que ela conseguiu um grande abraço de sua avó, ela disse: “Mimi, Mimi, venha ver meu quarto!”

Agora foi a vez de Mimi ficar animada quando Emma colocou um lenço sobre os seus olhos e cuidadosamente a guiou para o seu quarto. Quando Emma descobriu seus olhos, Mimi gritou “Emma, eu não posso acreditar no que estou vendo! Que quarto maravilhoso! Eu só posso imaginar toda a diversão que você tem aqui. Parece o tipo de lugar que você gostaria de desfrutar.”

Emma estava exultante! Ela teve tanta alegria em mostrar para Mimi sua cama aconchegante e seus cobertores fofinhos favoritos, sua fantástica lâmpada de leitura presa na armação da cama, e a cesta especial debaixo da cama onde ela guardava seus livros da biblioteca, seus livros divertidos e seu diário. Emma até abriu sua linda caixa onde estava escrito “Mantenha distância! Privado!” que ela mantinha ao lado de seu travesseiro, então Mimi podia ver suas coisas mais preciosas.

Diversão na Palavra de Deus Tenho certeza de que você viu sua mãe trabalhando duro para cuidar do lugar onde você e sua família moram. Você viu como ela limpa, decora e cuida de sua casa. Bem, você pode fazer as mesmas coisas para o seu pequeno lar doce lar. Quando você cuida da sua área da casa — seja sua cama no quarto que você compartilha com uma irmã ou um quarto todo seu — você vai se sentir muito bem com isso. E aqui está um bônus — você terá uma boa experiência para o futuro que Deus planejou para você.

Para descobrir quais são alguns desses planos, ponha as mãos na sua caneta favorita novamente! É hora de marcar o que você aprende nos versículos abaixo sobre o seu S-P-A-C-E (que quer dizer espaço, em inglês) — seu pequeno lar doce lar.

Surpreenda mostrando bom caráter, cuidando do seu espaço. Você se lembra do nosso versículo-chave? É Atos 13.22. Uma garota que quer seguir a Deus é aquela que quer o que Deus quer. Ela quer fazer a vontade de Deus. E ela quer agradar a Deus. Você já pensou que uma parte do plano de Deus para você é aprender a cuidar do seu espaço? Está certo! A Bíblia diz:

O que vocês fizerem façam de todo o coração, como se estivessem servindo o Senhor e não as pessoas (Colossenses 3.23). Como uma garota adolescente, você não tem um “emprego” como um adulto tem. Mas você tem o seu quarto. E você mostra boas qualidades de caráter quando cuida dele. Como esse versículo diz que você deve fazer o seu trabalho, inclusive cuidar de suas roupas e pertences? Para quem este verso diz que você está trabalhando? Procure orar, agradecendo a Jesus pelo seu espaço. Como Emma, seu espaço também é importante para você. É o seu pequeno “lugar”. Então, reserve um tempo para descrever seu quarto. Quando estiver feito isso, não se esqueça de agradecer a Jesus pelas coisas que você tem e por um lugar e espaço próprios. A Bíblia diz: “E sejam agradecidos” (Colossenses 3.15).

Admita o seu dever, reconhecendo-o. Você pode fazer muitas coisas com o seu tempo — assistir TV, jogar videogame, aproveitar sua coleção de bonecas ou brincar do lado de fora da casa. Mas há outra coisa que requer seu tempo — seu quarto! E Deus está pedindo para você cuidar desse lugar especial. Ele diz:

Ela nunca tem preguiça e está sempre cuidando da sua família (Provérbios 31.27). Este versículo descreve as ações de uma mulher sábia — e uma garota sábia — enquanto ela cuida de sua casa ou do seu espaço. O que este versículo diz que é o segredo para cuidar do seu quarto? Cuidar do seu lugar leva tempo. De acordo com este versículo, de onde vem esse tempo?

Cai bem uma limpeza geral aqui. Por favor, não surte quando falarmos sobre ser uma pessoa que tem obsessão por limpeza! Pense nisso por um minuto. Seu quarto é você . Se for limpo, isso diz às pessoas algo sobre você e seu caráter — que você é uma pessoa limpa e organizada. Você também envia uma mensagem sobre você mesma se o seu espaço é um verdadeiro chiqueiro. O que você quer ser é limpa e organizada.

Dê uma olhada no gráfico a seguir. Primeiro, quero que você circule a palavra “seu” toda vez que ela ocorrer no gráfico. Em seguida, marque a coluna que representa a pessoa que normalmente faz cada uma das seguintes tarefas básicas. Se for outra pessoa (“outro”), escreva no nome delas para cada tarefa que fizerem. Quando terminar, adicione as marcas de seleção para ver quem realmente cuida do seu quarto.

TAREFA VOCÊ MÃE OUTROS

Aspirar/varrer seu chão Espanar sua mobília

Pendurar suas roupas

Guardar suas roupas

Lavar suas roupas

Dobrar suas roupas

Guardar suas roupas dobradas

Totais de marcas de verificação — — — Agora, dê uma olhada nos seus totais. O que você vê? Quem está fazendo a maior parte do seu trabalho?

Aqui está um desafio. Tente ser uma “obsecada por limpeza” por alguns dias. Eu sei, você provavelmente terá que dar uma folga para a sua mãe durante esses dias! Mas eu garanto que você vai amar os resultados. Você vai se sentir tão bem sobre o seu quarto — e sobre si mesma. Por quê? Porque você vai perceber que você deixou seu quarto limpo e convidativo! Aqui está um pensamento de Deus sobre ser limpa e organizada:

Portanto, façam tudo com... ordem (1 Coríntios 14.40). Este versículo nos dá um princípio geral para a vida, incluindo a maneira como você vive e cuida das suas coisas. O que isso diz sobre a ordem e sobre ser uma obsecada em limpeza?

Expresse-se no seu espaço. Quando se trata de seu quarto, percebo que sua mãe provavelmente tem muito a dizer sobre a cor de seus móveis e lençóis, se você tem ou não aquele tapete bonito e o que você pendura nas paredes. Deus quer que você ouça e respeite a opinião dela.

Há boas razões pelas quais sua mãe diz sim ou não às suas ideias. Por exemplo, coisas para o seu quarto custam dinheiro. Uma parede com buracos de cartazes e fotos precisa ser corrigida e pintada mais tarde. E as opções de cores de pintura e carpete (ou piso) podem ser determinadas pelo proprietário do imóvel onde vocês moram, ou por um esquema geral de cores para toda a casa. Por favor, perceba que você precisa trabalhar com sua mãe quando se trata de seu quarto. Compartilhe suas ideias. Procure em revistas e mostre para ela as fotos do que você gosta. Peça-lhe por conselhos de decoração. E se estiver tudo bem para a sua mãe, recorte algumas fotos de revistas e comece um caderno para criar o quarto dos seus sonhos. Quando se trata de instruções, de ajuda da sua mãe e conselhos sobre o seu quarto, a Bíblia tem algo a dizer para você:

As mulheres mais jovens ... [devem ser ensinadas] a estarem ocupadas em casa (Tito 2.4, 5, parafraseado pela autora). Quem é a melhor pessoa para lhe ensinar sobre como cuidar do seu quarto?

DE CORAÇÃO PRA CORAÇÃO

Você já pensou que o Deus do Universo estaria interessado em você e nas coisas que você faz e não faz? Bem, incrivelmente, Ele está! Deus está definitivamente interessado em como você cuida da sua pequena casa, do seu quarto, do seu espaço.

Enquanto você segue o desejo de Deus nesta área, prepare-se para uma g-r-a-n-d-e recompensa! Você não vai acreditar em como vai se sentir bem quando terminar de cuidar do seu quarto. Quando você olha para o seu quarto brilhante, para todas as suas coisas, para a ordem, você ficará satisfeita e orgulhosa de seus esforços. Você ficará contente por seguir o coração de Deus e seguir a sua instrução. E você será recompensada em seu coração pelo que fez.

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus, aprendendo sobre a importância do S-P-A-C-E (espaço, em inglês). Nesta página, escreva o assunto para cada letra. (Eu vou começar com “S”.)

Surpreenda mostrando bom caráter, cuidando do seu espaço.

P

A

C

E Agora, escreva uma coisa que você gostou, aprendeu ou quer fazer sobre o seu espaço. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Emma teve muita alegria em mostrar seu quarto bem cuidado para a Mimi; como você se sente quando o seu cantinho ou quarto está limpo e arrumado?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A Bíblia diz para fazermos tudo de coração, como se estivéssemos servindo ao Senhor; qual é uma tarefa do seu quarto que você pode fazer hoje pensando em agradar a Jesus?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A autora lembra que sua mãe ajuda a cuidar da casa e tem boas ideias; como você pode conversar com a sua mãe para deixar o seu espaço bonito e organizado juntas?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 3 — Meus Pais$t$, 4,
$conteudo$“E mma? Emma! Emma Thomas!” Meu Deus! Emma estava olhando pela janela para o lado de fora da escola — de novo. Mas desta vez ela não estava perdida em pensamentos sobre a próxima “festa de aniversário da garota legal”. Não, isso era muito mais sério. Ela estava pensando sobre o quanto ela sentia falta da mãe.

Agora, antes de você ter uma ideia errada, entenda que a Sra. Thomas está viva e bem! O que Emma estava perdendo era o tempo com a mãe dela. Recentemente, a mãe dela tinha assumido um projeto de trabalho. Era temporário, mas ainda assim, Emma sentia falta dela. Por quê? Porque sua mãe era a sua melhor amiga. Elas tiveram momentos tão bons juntas. Não havia mais ninguém com quem Emma queria estar ou conversar mais do que a mãe dela.

Mas as coisas mudaram. Sua mãe trabalhava durante as tardes e chegava em casa bem a tempo de preparar o jantar, limpar a casa e deixar Emma e seus irmãos prontos para dormir. A sua mãe não parecia ter muito tempo para ela. Como resultado, Emma se sentia triste — e furiosa! Ela sentia como se tivesse perdido sua melhor amiga! Ela não gostou disso, e sua atitude era ruim. Ela estava até começando a discutir com sua mãe! Emma sempre esteve disposta a agradar e obedecer a seus pais, mas sua amargura e confusão estavam fazendo com que ela ficasse de mau humor e se recusasse a seguir até mesmo as instruções mais simples de seus pais. Diversão na Palavra de Deus!

Você provavelmente ouve muitas crianças criticando seus pais e tirando sarro deles. Você provavelmente já os ouviu falar coisas como: “Meus pais são tão estúpidos. O que eles sabem afinal?” Se você ouvir muito desse tipo de conversa, começará a pensar que é assim que você deve falar sobre seus pais. Eu ouvi muito disso quando estava crescendo. E eu ainda ouço muito disso agora. Mas eu me lembro do dia em que olhei para Tiago 1.17 com os meus pais em mente. Foi então que percebi: “Espere um minuto! Deus me deu meus pais exatamente como eles são e quem são. Isso significa que eles são um presente de Deus para mim!”

Eu não posso começar a dizer-lhe como isso mudou minha atitude em relação à minha mãe e ao meu pai. Em vez de vê-los como bobões, fora de moda, muito rigorosos e exigentes, comecei a vê-los como presentes especiais de Deus, só para mim. E Deus gostaria que você tivesse essa mesma atitude sobre seus pais.

Vamos nos divertir enquanto escrevemos a palavra P-A-R-E-N-T-S (que quer dizer pais, em inglês). Prepare sua caneta ou lápis especial e deixe sua aventura na Palavra de Deus continuar!

Peça a Deus por seus pais. A oração é um hábito maravilhoso. Não importa onde você esteja ou o que está acontecendo, você pode falar com Deus. Ele se importa com você e se importa com os seus pais também. Orar por sua mãe ou seu pai é uma coisa boa. Isso ajuda você a amar e cuidar deles ainda mais. Você pode até mesmo criar uma página especial em seu caderno ou diário apenas para as coisas pelas quais deseja orar em relação à mamãe e ao papai.

Em nome do nosso Senhor Jesus Cristo, agradeçam sempre todas as coisas a Deus, o Pai (Efésios 5.20). O que Deus está dizendo para você fazer aqui? Quando você vai fazer isso? Você deu graças a Deus por seus pais? Lembre-se sempre de que dar graças é parte da oração. Portanto, não se esqueça de agradecer a Deus todos os dias pelos seus pais especiais.

E não se esqueça de agradecer a seus pais todos os dias, o dia todo, por tudo. Seus pais fazem muito por você. Se eles comprarem roupas novas, diga-lhes “obrigada”. Se você assistir a aulas de balé ou ginástica ou estiver em uma equipe esportiva, diga “obrigada”. Quando você comer uma refeição, diga “obrigada” Quando as roupas limpas aparecerem magicamente em suas gavetas, diga “obrigada”. E quando você for para a cama, diga: “Obrigada, mamãe e papai, por outro grande dia!”

Aprenda a pedir o conselho deles. Deus lhe deu seus pais. E adivinha? Eles podem ajudá-la a tomar boas decisões, dando-lhe grandes conselhos, e guiando-lhe na direção certa. Eles têm sabedoria para compartilhar. (Sim, eles também tiveram que crescer!) E acima de tudo, eles a amam e querem o melhor para você. Ninguém lhe ama mais do que seus pais — exceto Deus, é claro!

Uma vez que seus pais lhe dão conselhos ou fazem uma regra ou tomam uma decisão, é importante fazer o que eles dizem. Uma vez meus pais disseram não quando perguntei se eu poderia ir a uma festa do pijama. Eu fiquei tão brava porque queria tanto fazer parte do alvoroço — e do grupo! Eu chorei, lamentei, implorei, e pensei em coisas horríveis sobre meus pais. Mas você acredita que um monte de garotos apareceu na casa onde era a festa do pijama? Então as crianças fizeram tanto barulho que os vizinhos chamaram a polícia, que também veio. Uau, como eu estava feliz por meus pais terem dito não!

Normalmente, se a sua atitude é correta, você pode conversar com seus pais. Você pode perguntar por que eles tomaram uma certa decisão. Você pode perguntar o que você precisa fazer para ganhar um benefício. No final, porém, você quer fazer o que eles dizem — com um coração feliz.

[Minha filha], escute o que o seu pai ensina e preste atenção no que a sua mãe diz (Provérbios 1.8). Qual é o conselho de Deus para você em relação ao seu pai e sua mãe?

Respeite seus pais. Pense por um minuto sobre seus professores na escola. Você responde quando eles chamam você. Você faz o que eles pedem. E você não iria discutir com eles. Bem, por que você mostraria tal respeito por um professor que você vê por algumas horas a cada semana, e escolhe não tratar seus pais da mesma maneira? Por que você se submeteria à autoridade na escola, mas não em casa? Mais uma vez, Jesus tem algo a dizer sobre isso:

Respeite o seu pai e a sua mãe (Mateus 15.4). Qual é o mandamento claro e simples de Jesus para você? Você sabia que, quando Jesus disse essas palavras, Ele estava falando sobre um dos Dez Mandamentos? O que torna isso uma coisa muito importante para se lembrar, não é? O que significa respeitar seus pais? Significa tratá-los educadamente e com honra. Significa admirá-los. Significa escutar quando eles falam. Significa aceitar suas decisões, seguir suas regras e procurar agradá-las. E isso significa que você não responde ou discute!

Experimente a bênção de Deus por meio da obediência. Cada um de nós é um indivíduo com uma mente própria. Temos ideias sobre o modo como queremos fazer as coisas. Como sabemos se o que queremos fazer é a coisa certa a fazer? Deus lhe deu seus pais para ajudá-la a tomar as decisões certas em cada etapa da sua vida. Assim como você quer a aprovação de seus pais, você também deve querer a aprovação de Deus. Como você recebe a aprovação ou a bênção de Deus? Esses versículos lhe dizem como. (E não perca a promessa que acompanha a bênção!)

Filhos, o dever cristão de vocês é obedecer ao seu pai e à sua mãe, pois isso é certo (Efésios 6.1). Qual é o mandamento de Deus para você? Por que você deveria obedecer a seus pais? Respeite o seu pai e a sua mãe... Faça isso a fim de que tudo corra bem para você (Efésios 6.2, 3). Qual é o mandamento de Deus para você e qual é o resultado de fazer isso?

Nunca critique seus pais para os outros. Esta é uma parte do mandamento de Deus que você honra seu pai e sua mãe. Portanto, tenha cuidado para não criticar alguém que você ama, respeita e honra. Você deve ter muito cuidado para não humilhar seus pais quando conversar com outras pessoas. Em vez disso, você deve falar bem deles. Mais uma vez, não importa o quão popular seja para as crianças falarem mal dos pais, você não deveria. Por quê?

O filho sem juízo despreza a sua mãe (Provérbios 15.20). “Desprezar” significa zombar e não ter respeito. Como Deus descreve um filho ou filha que despreza sua mãe?

Tenha confiança em Deus. É preciso confiar em Deus para ouvir seus pais e fazer o que eles dizem. Você tem que confiar em Deus por que Ele está conduzindo e desenvolvendo você através de seus pais. Não importa o que aconteça, você sempre pode confiar em Deus.

Confie no SENHOR de todo o coração e não se apoie na sua própria inteligência. Lembre de Deus em tudo o que fizer, e ele lhe mostrará o caminho certo. (Provérbios 3.5, 6). Qual é a promessa de Deus para sua vida se você confiar nEle e segui-lo com todo o seu coração?

Sempre diga “Eu te amo”. Não é ótimo quando seus pais dizem “Eu te amo” ou mostram seu amor por você? E você os ama tanto quanto eles lhe amam, certo? Então, por que não dizer a eles que você os ama — com frequência? E o amor não é apenas palavras que você diz. É também ação e comportamento. Leia!

Meus filhinhos, o nosso amor não deve ser somente de palavras e de conversa. Deve ser um amor verdadeiro, que se mostra por meio de ações (1 João 3.18). Além de dizer “Eu te amo”, como você prova que ama seus pais?

DE CORAÇÃO PRA CORAÇÃO

Vamos voltar para Emma mais uma vez. Lembra-se de como ela estava confusa e chateada com a mudança em seu relacionamento com sua mãe? Então, o que Emma fez? Ela começou a fazer coisas como não obedecer e não demonstrar respeito.

Agora, pense — quem Emma estava ferindo? Com certeza, ela provavelmente estava ferindo sua mãe. Mas, de acordo com o que acabamos de aprender da Bíblia, quem mais ficaria desapontado? Deus é a resposta certa.

Uma garota segundo o coração de Deus segue a instrução do Senhor para honrar seus pais. Você se lembra do nosso versículo-chave — Atos 13.22? Ele nos diz que uma garota segundo o coração de Deus é uma menina que fará tudo o que Deus quer que ela faça. Se você foi malvada com seus pais, é hora de mudar de atitude. Diga a Deus o que está acontecendo e peça seu perdão. Diga a Deus que você sente muito e peça a ajuda dEle. E diga a Ele que você quer seguir a sua Palavra e amar, honrar e obedecer aos seus pais.

E depois dê o último passo — faça! Faça as mudanças que você precisa fazer! Ore e trabalhe para ter um coração feliz e obediente em todas as coisas, e veja que diferença maravilhosa isso faz em casa com seus pais.

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus, aprendendo sobre a importância dos P-A-R-E-N-T-S (pais, em inglês). Nesta página, escreva o assunto para cada letra. (Eu vou começar com o “P”.)

Peça a Deus por seus pais.

A

R

E

N T

S

Agora, escreva uma coisa que você gostou, aprendeu ou quer fazer sobre ser uma filha melhor. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A autora descobriu que seus pais são um presente de Deus, só para ela; o que você mais agradece a Deus quando pensa no seu pai e na sua mãe?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A Bíblia ensina a respeitar e obedecer aos pais com um coração feliz; qual é um jeito de você obedecer hoje sem responder nem discutir?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O amor não é só palavra, mas também ação; além de dizer "eu te amo", o que você pode fazer hoje para mostrar amor aos seus pais?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 4 — Minha Família$t$, 5,
$conteudo$“S aia do meu quarto, sua pirralha!” gritou Brittany, a irmã de Emma. Brittany era cinco anos mais velha que Emma, e parecia que ela vivia em um planeta diferente. Emma amava suas bonecas e bichos de pelúcia, mas Brittany gostava muito de roupas, música, amigos e especialmente de meninos. Ui!

Brittany era bonita. E é verdade que ela usava roupas muito legais. E sim, ela tinha amigos legais. Emma adorava Brittany e a admirava. Ela queria, mais do que tudo, passar horas e horas com sua irmã mais velha. Mas parecia que Brittany tinha decidido aproveitar todas as oportunidades para ser má com Emma e seu irmão mais novo, Pete. Sempre que Brittany estava por perto, Emma e Pete não pareciam fazer nada certo. Brittany se considerava a princesa da família, e Emma e Pete estavam lá para servi-la — ou então dereviam sair do caminho dela!

Sim, Emma sentiu como se estivesse vivendo uma versão moderna da Cinderela, exceto que Brittany não era uma meia-irmã. E ela definitivamente não era feia! Por que Brittany tem que ser tão má? Por que elas não poderiam ser apenas amigas?

Diversão na Palavra de Deus! É hora da caneta ou do lápis de novo! Desta vez, estamos indo em uma aventura para descobrir o que Deus nos diz sobre os membros da nossa família. Conforme você se diverte com o acróstico abaixo que soletra F-A-M-I-L-Y (família, em inglês), mantenha sua caneta à mão. Ao ler, peça a Deus algumas boas ideias sobre ser um membro melhor da família.

Família em primeiro lugar. Não há nada tão especial como uma família. Ao longo dos anos seus amigos vão e vêm, mas você sempre vai ter a sua família. E, acredite ou não, chegará o dia em que você e seus irmãos e irmãs irão se dar bem uns com os outros e vão querer passar muito tempo juntos.

Como a família é sua principal prioridade (depois de Deus), você precisa tomar a decisão de ser leal aos seus irmãos. Você pode apoiar seu irmão mais novo em seus esforços para jogar futebol ou Tee-ball. O mesmo vale para os encontros de natação de uma irmã mais velha ou recitais de piano. E depois do jogo ou atividade, não se esqueça de parabenizá-los pelo excelente trabalho que fizeram. Ou, se eles não tocarem ou não correrem tão bem, dê-lhes um tapinha nas costas e diga: “Eu ainda estou orgulhosa de você. Seu dia chegará”. Seja solidária das muitas maneiras que puder.

O amigo ama sempre e na desgraça ele se torna um irmão (Provérbios 17.17). Agora leia este versículo novamente e diga ou pense a palavra “irmã” em vez de “amigo” ou “irmão”. É você! Este versículo está explicando como a família é importante quando alguém está sofrendo. Quantas vezes uma amiga ou irmã ama sua família? Mesmo quando as coisas ficam difíceis, o que Deus está pedindo de você como amiga ou membro da família? Aprenda a pedir ajuda a Deus. É difícil de entender, mas orar pelos outros, incluindo uma irmã mais velha, muda seu coração. É fácil brigar ou gritar com seu irmão ou irmã. É fácil dizer coisas ruins para eles. E é fácil chamá-los de nomes. Orar por eles pode ser difícil — especialmente se seus sentimentos foram feridos ou se você foi ignorada ou maltratada. Mas vá em frente e peça a Deus para ajudá-la a amá-los, não importa o que aconteça. Peça a Ele para ajudá-la a ser gentil, mesmo quando eles forem maus com você. É difícil orar por alguém e odiá-lo ao mesmo tempo. Logo você descobrirá que tem um pouco mais de paciência com eles e seus sentimentos se transformarão em amor.

Jesus tem conselhos que ajudarão você e seu coração:

Mas eu lhes digo: amem os seus inimigos e orem pelos que perseguem vocês (Mateus 5.44). Quais são os dois passos que Jesus lhe pede? Más atitudes devem ir embora. Tenho certeza de que você tem recebido piadas, provocações e xingamentos. Bem, você não pode controlar o que os outros dizem e fazem, mas você está totalmente no controle do que você diz e faz! Você pode escolher ser malvada e tirar sarro dos outros — ou não. Você pode decidir rir dos outros e colocá-los para baixo — ou não. E adivinha? O melhor lugar para você começar a ser legal é em casa.

Você não pode fazer com que os outros sejam gentis com você ou com os outros, mas pode ter certeza de que você não age de maneira errada com os outros. Você pode se certificar de não machucar seus irmãos e irmãs através de suas palavras ou ações. Você pode ajudar seus irmãos e irmãs a se sentirem melhor. Deus diz:

Não digam palavras que fazem mal aos outros, mas usem apenas palavras boas, que ajudam os outros a crescer na fé e a conseguir o que necessitam, para que as coisas que vocês dizem façam bem aos que ouvem (Efésios 4.29). Quais são as regras de Deus para sua boca e o que você diz aos outros?

Não fale o que é

Fala o que é ...

Por quê?

Inicie uma mudança em sua atitude. Há uma história assustadora no Antigo Testamento sobre dois irmãos, Caim e Abel. Caim estava zangado com seu irmão porque Deus gostava mais da oferta de Abel do que da oferta de Caim. Ouça agora a conversa de Deus com Caim sobre sua atitude:

Então o SENHOR disse: “Por que você está com raiva? Por que anda carrancudo? Se tivesse feito o que é certo, você estaria sorrindo; mas você agiu mal, e por isso o pecado está na porta, à sua espera. Ele quer dominá-lo, mas você precisa vencê-lo” (Gênesis 4.6, 7). Como Deus descreveu a ira de Caim? O que Deus lhe disse para fazer sobre sua atitude de raiva?

Agora aqui está a parte assustadora. Caim não fez o que Deus disse para fazer. Caim não mudou sua atitude. Em vez disso, “Caim atacou Abel, o seu irmão, e o matou” (versículo 8). A mensagem de Deus para o seu coração é a seguinte: Da próxima vez que você ficar brava com um irmão ou irmã, lembre-se de Caim. E faça o que Deus disse para Caim fazer — controlar sua má atitude antes que ela controle você!

Lembre-se: ame seus irmãos e irmãs, não importa o que aconteça. Quando se trata de amor, Emma teve a ideia certa. Mesmo que Brittany fosse má com ela e Pete, Emma ainda amava sua irmã mais velha e queria estar com ela. O amor de Emma não foi baseado em qualquer coisa legal que Brittany fez por ela. Na verdade, foi exatamente o oposto. Apesar das ações de Brittany, Emma ainda a amava.

E quanto a você? Você tem esse tipo de amor por seus familiares, especialmente seus irmãos e irmãs? É o tipo de amor que Deus quer que você tenha, um amor que não é baseado nas ações dos outros, mas um amor que vem do amor de Deus por você. Dê uma olhada nestes versos:

Eu lhes dou este novo mandamento: amem uns aos outros. Assim como eu os amei, amem também uns aos outros (João 13.34). O amor é tão importante para Deus que Ele nos manda amar uns aos outros, especialmente nossos irmãos e irmãs. Como — e quanto — Jesus diz que você deve amar seus familiares?

Yes! A resposta que você dá à sua família é importante para Deus. Você está começando a ver um tema neste acróstico de F-A-M-I-L-Y? Você está no controle de suas atitudes. Você pode ser gentil e amável — ou você pode ser odiosa e ofensiva. A escolha é toda sua.

Você se lembra de como conversamos sobre falar bem de seus pais em um capítulo anterior? Aprendemos o quanto é importante que você não fale sobre eles de uma maneira negativa, que você não os deixe para baixo nem faça piada deles com os outros. Bem, o mesmo é verdade sobre seus irmãos e irmãs. Você pode responder a eles com gentileza e amor. E você pode falar bem deles para os outros. Sejam bons e atenciosos uns para com os outros. E perdoem uns aos outros, assim como Deus, por meio de Cristo, perdoou vocês (Efésios 4.32). Liste três ações e atitudes que você deve ter em relação aos outros, incluindo seus irmãos e irmãs.

DE CORAÇÃO PRA CORAÇÃO

Os membros da família devem adotar o lema dos Três Mosqueteiros — “Um por todos e todos por um”. Como você pode ajudar a tornar sua casa um lugar melhor para sua família? Isso começa com você sendo uma irmã que está lá para seus pais, irmãos e irmãs. Começa com você pensando nos outros, incentivando os outros e amando os membros de sua família. Então seja você a mudança!

Tem um irmão mais velho? Escreva-lhe um bilhete de agradecimento por ser um super-irmão mais velho e coloque-o sob a porta dele. Tem uma irmã mais velha? Veja se há algo que você possa ajudá-la em sua agenda lotada. Tem um irmãozinho? Ajude-o, brinque com ele, ria com ele, abrace-o e encoraje-o. Tem uma irmãzinha? Envolva-se em sua vida. Diga: “Quer jogar?” ou “Aqui, deixe-me ajudá-la”.

Agora, aqui está um pensamento: Talvez você seja a irmã mais velha. Você está sendo uma “Brittany” ou você está sendo a irmã bondosa e gentil de Deus? Infelizmente a irmã mais velha de Emma estava tão envolvida em si mesma que não notou o quanto Emma queria passar um tempo com ela, espero e oro para que você não viva tanto em seu próprio mundo e que ignore seus irmãos mais novos. Uma garota segundo o coração de Deus também é uma irmã segundo o coração de Deus. O que você pode fazer hoje para amar seus irmãos e irmãs?

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus, aprendendo sobre a importância da F-A-M-I-L-Y (família). Nesta página, escreva o assunto para cada letra. (Eu vou começar com “F”.)

Família em primeiro lugar.

A

M

I

L Y

Agora, escreva uma coisa que você gostou, aprendeu ou quer fazer sobre ser uma irmã melhor. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Mesmo quando a Brittany era má, a Emma continuava amando a irmã; como você pode amar seus irmãos ou primos mesmo nos dias em que eles te chateiam?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Deus pediu para o Caim controlar a raiva antes que ela o controlasse; o que você pode fazer da próxima vez que ficar com raiva de alguém da sua família?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A Bíblia diz para usarmos só palavras boas que ajudam os outros; qual é uma palavra gentil que você pode dizer hoje para um irmão, irmã ou alguém da sua casa?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 5 — Minha Escola$t$, 6,
$conteudo$Quando chegou à escola, Emma se sentiu como duas pessoas diferentes. Qualquer coisa que tenha a ver com a Sra. Abrams era a coisa mais excitante do mundo para ela. Seja o que for que a Sra. Abrams dissesse ou mesmo insinuava, Emma corria com grande prazer para fazer o seu melhor. Mas além de sua professora favorita e seu assunto favorito — Inglês — Emma não estava tão animada com a escola. Matemática era muito difícil. História era muito chato. Ciências era muito confuso. O outro ponto brilhante nos dias de Emma era aula de Educação Física, onde ela adorava jogar basquete, vôlei e até softball quando o tempo estava bom.

E depois da escola? Toda essa lição de casa — eca! Tudo o que Emma queria fazer depois da escola era relaxar e descansar com um lanche e um tempo na frente da TV com seu irmãozinho Pete. Ou passear pelo bairro com algumas de suas melhores amigas, que estudavam em casa. Mas o que ela mais gostava de fazer era reunir-se com várias outras garotas da vizinhança que estavam em um clube de escrita secreta que se encontravam depois da aula na casa da árvore da amiga Stephanie.

“Emma? Emma Elaine! Você está fazendo sua lição de casa ainda?” Chiii! Era a mãe chamando Emma de volta à realidade!

Diversão na Palavra de Deus! Eu acho que todas as garotas estão ansiosas para ficarem mais velhas. Talvez seja por isso que nós amamos aniversários! Todos aqueles presentes e o bônus de ser um pouco mais velha e mais adulta. Mas a cada novo ano vem mais responsabilidade, como levar a escola mais a sério. A escola é uma parte importante do crescimento. Requer dedicação, comprometimento e tempo, mas também pode ser muito emocionante e divertido!

Eu quero que você se divirta agora com o acróstico abaixo que soletra S-C-H-O-O-L (escola, em inglês). Antes de começar, aqui está algo para lembrar se você está lutando com a escola e com os trabalhos escolares — você pode pedir a Deus por uma mudança de atitude.

Sempre veja a escola como um campo de treinamento para a vida. Quer você frequente uma escola pública, uma escola particular ou estude em casa, a escola é formada por várias coisas diferentes. A localização física e o tempo que você gasta lá fornecem muitas oportunidades para o seu crescimento. Pense nas muitas habilidades maravilhosas que você desenvolve na escola.

Na escola, você tem muitas oportunidades de conversar e trabalhar com professores, colegas e amigos.

Na escola, você aprende como fazer e responder perguntas, fazer relatórios e apresentações e conversar com um grupo.

Na escola, você também aprende a pensar e a encontrar soluções para problemas e desafios. Na escola, você aprende a agir de maneira apropriada em relação aos que têm autoridade e aos seus colegas. Além disso, estar na escola ensina você a restringir suas emoções — e sua boca! — e a concentrar sua mente e energia ativas.

Você está maravilhada? Você está entendendo um pouco melhor por que a escola é tão importante? Acredito que sim! Aqui está algo da Bíblia para ajudá-la com sua atitude em relação à escola.

Se você procura [sabedoria] como a prata e busca por ela como um tesouro escondido, então você entenderá o temor do SENHOR e encontrará o conhecimento de Deus (Provérbios 2.4, 5). Circule as palavras que descrevem a riqueza e o valor da sabedoria. Em seguida, sublinhe as palavras que descrevem o que você deve fazer para obter sabedoria e conhecimento. Qual é o resultado de ganhar sabedoria?

Confira sua atitude. Você já ouviu o ditado: “Atitude é tudo?” Bem, eu acho que definitivamente aplica-se à escola. Não importa onde seja a sua escola, o importante é a qualidade do tempo que você passa dentro da escola. Pode ser divertido e emocionante, algo que você vai olhar para trás com lembranças maravilhosas — ou pode ser um verdadeiro pesadelo! E o mais incrível é que você escolhe qual será!

Sua felicidade e sucesso na escola começam com sua atitude. Você pode dizer: “Vou tornar meus anos escolares divertidos, emocionantes e significativos?” Eu tenho uma frase favorita que quero passar para você. Ela diz o seguinte: “Onde quer que você esteja, esteja lá por completo”.¹ Já que você tem que “estar” na escola, por que não decidir “estar lá por completo?” Talvez este versículo ajude!

O que vocês fizerem façam de todo o coração, como se estivessem servindo o Senhor e não as pessoas (Colossenses 3.23). Como você vai fazer todo o seu trabalho, inclusive ir à escola?

Hoje o dever de casa é uma prioridade. É claro que Deus é sua prioridade Número Um. Toda a sua vida envolve Deus e gira em torno dEle. Ele é a pessoa mais importante em sua vida. Mas uma das principais prioridades de Deus para você é que você aprenda e cresça indo para a escola e faça sua lição de casa. A vontade de Deus neste momento da sua vida é que você seja uma estudante — indo à escola, aprendendo o máximo que puder.

Se você é como a maioria das garotas que eu conheço, começar a fazer alguma coisa — inclusive fazer sua lição de casa — é a parte mais difícil de qualquer tarefa. Parece haver muito mais coisas interessantes para fazer! Mas para fazer sua lição de casa, você precisa começar. Deus tem algumas dicas sobre como fazer isso — e com a atitude certa! Façam todo o possível para juntar a bondade à fé que vocês têm. À bondade juntem o conhecimento e ao conhecimento, o domínio próprio. Ao domínio próprio juntem a perseverança e à perseverança, a devoção a Deus (2 Pedro 1.5,6). O que as quatro primeiras palavras nestes versículos dizem é a primeira coisa que você deve fazer para ter sua lição de casa feita?

Como você pode ver, o crescimento exige algo de você — esforço e trabalho duro! E o esforço que você faz vai valer a pena, já que uma boa qualidade depois da outra se torna parte de sua vida.

Organize-se para o sucesso. A escola é um lugar para aprender. Mas para aprender bem, você precisa ser organizada. Uma coisa que você precisa fazer para o sucesso escolar é criar um lugar especial para fazer sua lição de casa. Claro, você vai querer a aprovação da sua mãe a respeito do lugar que você escolher. Mas onde quer que seja, tente fazer com que seja um lugar que você quer estar. Pense em lápis especiais e canetas — e borrachas legais! Peça à mamãe um temporizador bonitinho ou um relógio para que você possa tentar terminar sua lição de casa por um tempo determinado.

Em seguida, escolha um horário fixo para fazer sua lição de casa. Eu conheço garotas que fazem um pouco do dever de casa enquanto estão no ponto de ônibus. Ou enquanto elas estão esperando nos degraus da escola para voltar para casa. Ou enquanto estão na casa da avó, enquanto a mãe está voltando do trabalho para casa. Ou mesmo sentadas ao redor da mesa da cozinha durante toda a manhã com irmãos e irmãs enquanto eles estão sendo educados em casa. Tudo o que funciona para você e sua família, esse será o seu tempo. E aqui está uma dica — mais cedo é melhor! Faça o seu “trabalho” (em forma de dever de casa) primeiro. Depois faça artesanato, assista TV ou vá ao encontro secreto das meninas.

Eu sou uma escritora. Até agora eu escrevi quase 60 livros. Como isso aconteceu? Isso aconteceu porque todos os dias eu vou para minha mesa (meu lugar onde todas as minhas coisas favoritas estão) em um determinado momento (meu tempo). Então fico lá até escrever cinco páginas.

Minha melhor amiga é uma artista. Até agora ela pintou cerca de 100 quadros. Como isso aconteceu? Isso aconteceu porque todos os dias ela vai para o seu espaço de trabalho (seu lugar onde todas as suas belas obras de arte estão) em um determinado momento (seu tempo). Então ela fica lá até que ela tenha feito seu trabalho por aquele dia.

Minha jovem amiga, vou lhe dizer que os anos e anos — e anos! — de fazer lição de casa em um determinado lugar, em um determinado momento, prepararam Judy e eu para o que fazemos agora.

Outras atividades fazem parte da escola. A escola oferece oportunidades para se envolver em diferentes atividades como esportes ou música. Talvez você não seja tão boa em corridas, mas a equipe de natação é onde você se encaixa. Ou, se você não está interessada em atividades físicas, que tal o clube de matemática ou o grupo de teatro? Deus lhe deu algumas habilidades super criativas e talentos naturais. Com a permissão de seus pais, experimente tudo e qualquer coisa até encontrar sua “coisa” especial.

Conforme crescia, Jesus ia crescendo também em sabedoria, e tanto Deus como as pessoas gostavam cada vez mais dele (Lucas 2.52). Liste as quatro áreas do desenvolvimento de Jesus desde uma criança até se tornar um adulto. (E adivinhe? Você precisa crescer nessas mesmas áreas também!) Leve em conta tudo aquilo que seus pais disserem. Por todos os meios, ouça seus pais! Eles sabem tudo sobre fazer lição de casa. Eles também sabem tudo sobre o que é preciso para ser um estudante — a disciplina, o esforço, o trabalho duro, o tempo, a fidelidade e o compromisso. Então, pergunte como é a escola para eles. Pergunte-lhes sobre seus assuntos favoritos — e por quê. Peça-lhes para falar sobre seus professores favoritos — e por quê. Esta será uma conversa divertida! Você pode até mesmo escrever suas respostas aqui!

A aula favorita da minha mãe / meu pai na escola e por quê.

O (a) professor (a) favorito (a) da minha mãe / pai na escola, e por quê. Eu disse ao longo de todo o caminho que você deve fazer o que seus pais dizem. Então, faça sua lição de casa quando eles querem que você a faça. E seja fiel para fazê-lo. Essa é uma maneira de ganhar o privilégio de fazer parte de uma equipe ou participar de algumas atividades extra-escolares. E lembre-se — quanto mais cedo, melhor é fazer com que o dever de casa fique fora do caminho. Ao ler o versículo abaixo, pense em quão importante é o aprendizado e seu trabalho escolar diário.

Estes provérbios aumentam a sabedoria dos sábios e orientam os instruídos (Provérbios 1.5). O que a garota sábia faz?

DE CORAÇÃO PRA CORAÇÃO

Você está tendo um vislumbre do plano de Deus para você aprender e crescer? Você está percebendo que o seu trabalho escolar é uma parte importante da sua grande aventura ao longo da vida? Espero que você esteja!

Mas também é importante perceber que, como uma garota segundo o coração de Deus, seu relacionamento com Jesus é a coisa mais importante. É uma coisa boa ir à escola, trabalhar duro, fazer o dever de casa e tirar boas notas. Apenas tenha certeza de que você está cuidando da sua caminhada com Jesus. Isso porque é o SENHOR quem dá sabedoria; a sabedoria e o entendimento vêm dele (Provérbios 2.6).

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus aprendendo sobre a importância da S-C-H-O-O-L (escola em inglês). Nesta página, escreva o assunto para cada letra. (Eu vou começar com o “S”.)

Sua escola é composta de muitas coisas diferentes.

C

H

O

O L

Agora, escreva uma coisa que você gostou, aprendeu ou quer fazer sobre seu tempo na escola e fazer sobre a sua lição de casa. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A autora diz que a escola é um campo de treinamento para a vida; qual é uma coisa boa que você está aprendendo na escola, mesmo nas matérias mais difíceis?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Ela ensina que "atitude é tudo" e que você escolhe se a escola vai ser legal; o que você pode fazer para ter uma atitude mais alegre com os seus estudos?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A Bíblia diz para fazer tudo de todo o coração, como para o Senhor; qual é um jeito de você fazer sua lição de casa com capricho para agradar a Jesus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 6 — Minhas Amigas$t$, 7,
$conteudo$Jenny tinha sido a melhor amiga de Emma desde o dia em que a família de Emma se mudou para a casa ao lado da família de Jenny. Emma e Jenny tinham cinco anos naquela época. Elas começaram o primeiro ano juntas. Elas aprenderam a ler e escrever juntas. Elas compartilhavam livros e liam os sonhos pessoais uma da outra em seus diários. Elas sempre estiveram juntas e eram melhores amigas — até o dia em que Tiffany começou a ser legal com Emma.

Emma não podia acreditar que Tiffany e suas amigas legais queriam ser amigas dela. Mas elas queriam! Havia apenas dois problemas com a amizade de Emma com a turma da garota legal. A primeira foi que Jenny não estava incluída, o que significava que Emma precisava escolher entre passar um tempo com Jenny ou com o novo grupo de amigas. A segunda foi a maneira como as garotas legais trataram as garotas não tão legais, incluindo Jenny. Elas eram mesquinhas e achavam que eram muito melhores do que as outras meninas da sala. Emma se sentia desconfortável com suas terríveis atitudes e ações. Ela estava começando a perceber que, se não agisse como elas, elas a excluiriam. Hummm. Isso faria de Emma ninguém de novo.

Diversão na Palavra de Deus!

Amigos. Às vezes parece que você não pode viver com eles, e às vezes parece que você não pode viver sem eles! Amigos são definitivamente uma parte importante da sua vida, não são? Os amigos tornam a vida mais divertida e interessante. Os amigos ajudam você a crescer nas suas habilidades de comunicação enquanto fala — e fala — e fala um pouco mais! Os amigos também ajudam você a desenvolver muitas qualidades fortes de caráter. Por exemplo, você aprende a importância de dizer a verdade e não espalhar fofocas e aprende o que significa ser leal.

Tenho certeza de que você está vendo como é importante escolher seus amigos com cuidado. Você deve tentar escolher amigos que a ajudem a se transformar em uma garota segundo o coração de Deus. E ao mesmo tempo, você tem que ser uma amiga fiel e verdadeira para os outros. Você está pronta para trabalhar a sua mágica com sua caneta, enquanto vemos o que Deus diz sobre essa importante área da sua vida — F-R-I-E-N-D-S (que quer dizer amigos, em inglês)?

Faça amizades que amem em todos os momentos. Amigas amam em todos os momentos. Você pode se identificar de alguma forma com a história de Emma e Jenny? Você está tendo que escolher entre uma amiga testada e comprovada como Jenny e uma nova amiga? Talvez você e sua amiga de longa data estejam agora em escolas diferentes, e é difícil ficar perto e conectada. Eu li uma história sobre duas garotas que eram melhores amigas. Elas gostavam das mesmas coisas, riam das mesmas piadas e compartilhavam o mesmo amor pela cor roxa — e pelas batatas fritas! Elas eram como irmãs gêmeas — sempre juntas. Quando elas não estavam mais matriculadas na mesma classe, elas tiveram que trabalhar duro para permanecerem amigas.

O que elas fizeram? Elas se asseguraram de que conversariam por telefone — muito! Elas se reuniam na casa de uma ou na casa da outra. Elas se inscreveram para o programa de jovens da igreja e memorizaram seus versículos bíblicos juntas. E elas escreviam bilhetes uma para a outra todos os dias. Elas viveram este versículo da Bíblia: O amigo ama sempre e na desgraça ele se torna um irmão (Provérbios 17.17). Descreva o que um amigo verdadeiro faz. Quando é que um amigo é mais necessário?

Recuse-se a fazer parte de um círculo. Um círculo é um grupo exclusivo de pessoas que passam todo o tempo juntas e não permitem que outras pessoas se juntem a elas. Na escola ou na igreja, essas são as meninas que se sentam juntas, andam juntas, conversam entre si e geralmente não têm nada a ver com mais ninguém. Elas podem até se vestir da mesma maneira ou ter o mesmo estilo de cabelo.

Agora, não há nada de errado em ter um grupo de amigas que tenha coisas semelhantes em comum. O problema surge quando o grupo se torna mesquinho e exclusivo e acredita que são as melhores, mais bonitas e mais “com isso” do que as pessoas de fora.

Esse é o tipo de grupo do qual você quer fazer parte? Eu penso que não, mesmo que (como Emma) você se considere uma “ninguém”. Lembre-se, você é um “alguém” para Jesus! Podemos aprender uma lição de Jesus. Ele era amigo de todos, mas foi criticado porque comia e bebia e conversava com pessoas erradas que eram consideradas “pecadoras” ou rejeitadas por outros.

Como Jesus, você provavelmente sabe como é ser evitado, ignorado, excluído e negligenciado pelos outros. Então o que você pode fazer? Cresça em Deus e você não se importará tanto com as panelinhas. Além disso, à medida que você cresce em Cristo, atrairá outras amigas que querem ser mais parecidas com Jesus.

Ore para Deus trazer uma amiga piedosa em sua vida, e ore pelas pessoas do grupo ruim.

Seja amigável com todos e seja grata pelas amigas que você tem. Além disso, seja uma verdadeira amiga para suas verdadeiras amigas!

Inicie amizades com cuidado. Escolha suas amigas com sabedoria. Por quê? Porque você se torna o que elas são. É por isso que a Bíblia é muito clara quando diz a você o que procurar em uma amiga — e também o que evitar a todo custo. Procure amigas que estão indo na direção certa espiritualmente — em direção a Jesus. Como são essas amigas? Você as conhecerá porque elas a levarão em sua jornada com Jesus e a elevarão em seu amor por Jesus. Onde você vai encontrar amigas assim? Você normalmente as encontrará na igreja ou em grupos ou atividades cristãs.

Quem anda com os sábios será sábio, mas quem anda com os tolos acabará mal (Provérbios 13.20). Se suas amigas são sábias, o que acontece com você? Se suas amigas são tolas, o que acontece com você? Escolha ser amiga, pois todos merecem sua amizade. Espero que você esteja recebendo a mensagem de Deus sobre como é importante escolher amigas e amizades cuidadosamente. Mas essa cautela não deve deixá-la com medo de ser amigável com todos. O que significa ser amigável? Tente viver pelos “Dez Mandamentos da Amizade.” ²

1. Fale com as pessoas — não há nada tão agradável quanto uma palavra alegre de saudação.

2. Sorria para as pessoas — são necessários setenta e dois músculos para franzir a testa e apenas quatorze para sorrir!

3. Chame as pessoas pelo nome — a música mais doce para o ouvido de qualquer pessoa é o som do seu próprio nome.

4. Seja simpática e prestativa — se você tiver amigas, seja amigável.

5. Seja cordial — fale e aja como se tudo que você faz seja um verdadeiro prazer.

6. Esteja genuinamente interessada em pessoas — você pode gostar de todos, se você tentar.

7. Seja generosa com elogios — cautelosa com críticas.

8. Seja atenciosa com os sentimentos dos outros — isso será apreciado.

9. Seja atenciosa com as opiniões dos outros.

10. Esteja alerta para prestar serviço — o que mais conta na vida é o que fazemos pelos outros!

Na amizade, quem é legal está sempre aí para o outro. Então seja legal! Você já ouviu falar da Regra de Ouro? Ela diz o seguinte: “Faça aos outros como você gostaria que fizessem a você”. Você sabia que Jesus foi a pessoa que ensinou isso? (veja Lucas 6.31). A Regra de Ouro é uma razão importante para ser gentil com os outros porque queremos que eles sejam gentis conosco! Mas você sabia que a Bíblia nunca nos diz para sermos apenas gentis? Aqui está o que ela diz em vez disso:

Sejam bons e atenciosos uns para com os outros (Efésios 4.32). Como você deve tratar qualquer pessoa e todo mundo? Você está se perguntando: “Então, qual é a diferença?” Bem, aqui está. Ser legal é ser educada. Mas ser gentil é ser solidária e atenciosa. Como você provavelmente sabe, você pode “agir” bem com alguém mesmo quando você realmente não aguenta mais! Mas ser gentil é uma ação profunda, leal e sincera. Aqui está outro versículo sobre ser gentil:

Quem ama é paciente e bondoso (1 Coríntios 13.4). Como você demonstra amor pelos outros?

Deixe as fofocas de fora! Amigos de verdade não contam segredos nem espalham boatos sobre seus amigos. Um verdadeiro amigo é leal e sabe guardar segredo. A Bíblia tem muito a dizer sobre rumores de fofocas e como isso prejudica as amizades.

Quem espalha mexericos não tem juízo (Provérbios 10.18). É fácil entender o significado desse verso! Não fofoque e espalhe rumores sobre os outros. Se você faz isso, o que esse versículo diz sobre você?

O mexeriqueiro revela os segredos, mas aquele que é fiel de coração os encobre (Provérbios 11.13, TB). O que faz um mexeriqueiro ou uma fofoca? O que um amigo fiel faz em vez disso?

Se você já foi ferida por fofocas, você sabe muito bem o significado deste provérbio! Então não fofoque. Você deveria ser uma amiga para os outros, não alguém que fere os outros, compartilhando segredos ou mentiras sobre eles. Compartilhar os segredos de alguém é trair um amigo. Isso machuca suas amizades. E adivinha o que mais? Isso machuca você também! Em vez disso, você deve ser leal, confiável e sincera — uma verdadeira amiga. Sempre compartilhe Jesus com seus amigos. Se você tem um relacionamento pessoal com Jesus, então você tem um amigo em Jesus. Ele é o amigo mais verdadeiro que você poderia ter e sempre terá (João 15.15). Pelo fato de Jesus ser o melhor amigo que qualquer garota poderia ter, você quer contar aos outros sobre Ele, certo? Escreva brevemente o que Jesus significa para você. Então ore por uma chance de compartilhar com os amigos o que você escreveu.

DE CORAÇÃO PRA CORAÇÃO

Tenho certeza de que você percebe a importância das amigas e especialmente do tipo certo de amigas. O tipo certo de amiga irá encorajá-la no Senhor. Ela irá desafiá-la em seu crescimento espiritual e em sua aventura com Jesus. Na verdade, ela estará bem ali ao seu lado curtindo a aventura com Jesus! E ela vai ficar com você mesmo durante os tempos difíceis. Então, quando você sair com o propósito de procurar uma amiga, comece com oração. Aqui está uma oração que você pode fazer. Ou sinta-se livre para fazer a sua própria. O que quer que você ore, ore com o seu coração. Uma Oração para Amigas

Querido Senhor e Pai,

Eu oro pela minha vida social e minhas amigas. Traga amigas para a minha vida que me amem e me encorajem, que trarão alegria e riso nos bons momentos e conforto e apoio nas horas de dificuldades e decepções. Conceda-me sabedoria enquanto busco amigas verdadeiras. Eu peço que o Senhor preencha a minha vida com relacionamentos próximos e carinhosos. Amém.³

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus, aprendendo sobre a importância das F-R-I-E-N-D-S (amigas em inglês). Nesta página, escreva o assunto para cada letra. (Eu vou começar com o “F”.)

Faça amizades que amem em todos os momentos.

R

I

E

N D

S

Agora, escreva uma coisa que você gostou, aprendeu ou quer fazer sobre suas amizades e ser uma amiga melhor. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O versículo diz que o amigo ama em todos os momentos; como você pode ser uma amiga fiel para alguém mesmo quando ela está triste ou passando por um momento difícil?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A Emma viu que as garotas "legais" eram más com quem ficava de fora; o que você pode fazer para ser gentil com uma colega que costuma ficar sozinha?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A Bíblia ensina a não espalhar fofocas e a guardar os segredos das amigas; qual é um jeito de você mostrar que é uma amiga em quem se pode confiar?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 7 — Minha Igreja$t$, 8,
$conteudo$“N ão seria bom dormir em apenas um dia da semana?” Emma disse para si mesma quando se virou na cama para pegar outra soneca. Mas a mãe de Emma se certificou de que o domingo não seria um dia de sono. Ela estava fazendo as rondas, acordando Emma, seu irmão e sua irmã. Ela suspirou quando ouviu a voz de sua mãe: “Emma? Emma Elaine! Levante-se A-G-O-R-A!”

Emma saiu da cama e cambaleou até a janela. Tudo estava quieto. Então ela sorriu quando se tocou — Domingo, finalmente! Ela havia arrumado sua Bíblia e sua lição de Escola Dominical na noite anterior. Além disso, ela havia separado a sua roupa de ir a igreja e seus novos sapatos legais.

Emma estava ficando cada vez mais animada a cada minuto que passava sobre ir à igreja. Isso nem sempre foi verdade. Mas recentemente, os domingos haviam se tornado o destaque da semana de Emma por causa de Jill, sua nova professora da Escola Dominical. Jill era uma estudante da faculdade local que amava Jesus e gostava de ensinar a Bíblia para garotas de sexto e sétimo anos. O amor óbvio de Jill pelo Senhor acendera um fogo espiritual no coração de Emma.

“Obrigada, Jesus, pela Jill!” Emma orava enquanto descia as escadas para o café da manhã. Domingo, finalmente!

Diversão na Palavra de Deus! Na igreja, você pode se divertir com suas amigas e as outras crianças em sua aula da Escola Dominical. E se você tem uma professora como a Jill, você pode aprender muito sobre Jesus e ser uma garota segundo o coração de Deus. Além disso, a igreja é onde você e sua família podem adorar a Deus juntos. Igreja é sem dúvidas um bom lugar para se estar!

Se você é como a maioria das garotas que eu conheço, alguns domingos passam e você não sente vontade de se levantar e se vestir para ir a lugar algum. Quem não gosta de descansar em seus pijamas e comer pipocas? Mas ir à igreja é algo que Deus quer que você e eu façamos. É um ótimo lugar para ouvir a sua Palavra, aprender sobre Ele e aprender como Ele quer que vivamos.

Agora é hora de mais diversão na Palavra de Deus. E você sabe o que fazer, certo? Vamos ver o que Deus tem a dizer sobre o seu envolvimento na C-H-U-R-C-H (que quer dizer igreja, em inglês).

Creia que a igreja é o plano de Deus. No Antigo Testamento, Deus pediu ao seu povo para adorá-lo em um lugar específico, como um Tabernáculo (uma tenda) ou um Templo. Mas no Novo Testamento, Deus construiu sua igreja dentre as pessoas . Então a Igreja não é um edifício. Ela é um grupo de pessoas que creem em Cristo como seu Senhor.

Cristo amou a Igreja e deu a sua vida por ela (Efésios 5.25). Qual é a importância da igreja para Jesus? Hoje, decida ter uma atitude positiva. Quando se trata de ir à igreja, ore para que você preste atenção em tudo que é dito ali. Tente obter tudo o que puder da aula de seu professor. Participe da discussão. Se uma lição foi designada com antecedência para ser realizada em casa, faça isso.

Adorem o SENHOR com alegria e venham cantando até a sua presença ... Entrem pelos portões do Templo com ações de graças, entrem nos seus pátios com louvor. Louvem a Deus e sejam agradecidos a ele. (Salmos 100.2 e 4). Nestes versículos, circule pelo menos quatro atitudes para adorar a Deus.

Quando você frequenta a igreja e seu grupo de jovens com um coração disposto e aberto, você glorifica a Deus. Isso é fantástico!

Usufrua das atividades juvenis e entenda a importância delas. Igreja não é escola e não é casa. É um lugar especial fornecido por Deus para o seu povo especial — aqueles que o amam — se unirem.

A maioria das igrejas tem clubes bíblicos onde você pode jogar, memorizar as Escrituras, falar sobre Jesus e se divertir com outras crianças da sua idade. Sua igreja também pode oferecer acampamentos de dia especiais ou acampamentos de fim de semana onde você pode se afastar e ficar com outras crianças e líderes que amam a Jesus. Pessoalmente, o meu favorito era o acampamento de inverno anual. Eu adorava ir até às montanhas e rolar na neve. E eu adorava me reunir em torno de uma lareira mais tarde para me aquecer e ouvir o meu líder da juventude falar sobre a pessoa mais importante no mundo — Jesus! E que tal o acampamento de verão — que fica em uma cabana, nadando todos os dias e fazendo caminhadas na natureza? Então, se for possível, não perca essas atividades da igreja. As coisas que você faz e aprende e os compromissos que você faz durante estes períodos de tempo podem ser alguns dos mais importantes e memoráveis que você faz em toda a sua vida. Além disso, você pode fazer grandes e genuínas amizades com outras meninas que amam a Jesus também.

Há uma história na Bíblia que fala sobre o tempo especial que Jesus passou com seus discípulos. Ele disse-lhes:

Venham! Vamos sozinhos para um lugar deserto (Marcos 6.31). Como esse versículo encoraja você a participar da próxima atividade juvenil da igreja (com a aprovação de seus pais, é claro)?

Relacione-se com outras garotas. A Igreja está cheia de crianças que amam a Jesus e querem saber mais sobre Ele e sua Palavra. Como ouvi toda a minha vida, “o chão está nivelado ao pé da cruz”. Em Cristo, somos todos um. Sublinhe o que esses versos dizem sobre como Cristo nos torna iguais.

Desse modo não existe diferença entre judeus e não judeus, entre escravos e pessoas livres, entre homens e mulheres: todos vocês são um só por estarem unidos com Cristo Jesus (Gálatas 3.28). Aqui estão algumas coisas que você pode fazer para alcançar outras pessoas da sua classe na igreja. Você pode facilmente fazer todos esses atos de amizade. Tudo o que é preciso para fazê-los acontecer é a sua decisão de fazê-los!

Diga oi para todos — e sorria.

Sente-se com qualquer garota que esteja sozinha. Se você está com uma amiga, vocês duas podem se sentar com ela.

Se alguém é nova ou visitante, não deixe de dizer olá. Pergunte a ela onde ela mora ou quem ela está visitando e quanto tempo ela ficará lá. Seja amigável!

Cristo é tudo sobre o que significa a igreja. Jesus é o que faz com que ir à igreja seja diferente de ir à escola ou à aula de ginástica. É a sua igreja. E você vai lá para aprender sobre Ele.

Seus pais podem falar sobre Jesus em casa e fazerem cultos domésticos juntos como uma família. Mas a igreja é outro lugar em que você pode aprender mais sobre Jesus e sua incrível vida e milagres. Você vai ler sobre seu amor e suas qualidades de caráter. Você descobrirá como Ele espera que você aja e se comporte. Você vai adorar aprender sobre o que Jesus fez por você, que Ele morreu por você e pelo seu pecado. E você ouvirá sobre o modo de aproveitar a vida eterna no céu para sempre.

Muitos cristãos que conheço deram seus corações e vidas a Jesus na igreja, ao descobrirem mais sobre o Senhor. A decisão mais importante que você tomará é se seguirá a Jesus e se você dará o seu coração e sua vida para Ele. Estou orando para que Deus use a sua Palavra a fim de abrir o seu coração para a verdade do seu amor por você, para que você responda ao seu convite para “vir a mim.”

Você lerá mais sobre como se tornar uma cristã e o que está no coração de uma aventura com Jesus no capítulo 10. Mas por enquanto, o que esse versículo lhe fala sobre Jesus?

Jesus respondeu: Eu sou o caminho, a verdade e a vida; ninguém pode chegar até o Pai a não ser por mim (João 14.6).

Habitue-se a ajudar de alguma maneira e de todas as formas. A igreja é às vezes chamada de “o Corpo de Cristo”. As pessoas no Corpo de Cristo ajudam umas às outras — e você também pode! Se cupcakes são necessários para a sua aula na igreja, pergunte à sua mãe se ela pode ajudá-la a fazer alguns poucos para você levar. Se precisar de ajuda para arrumar a sala de aula ou limpá-la depois, pergunte à mamãe e ao papai se não há problema em ir um pouco mais cedo ou ficar alguns minutos depois da aula para que você possa ajudar.

Você também pode ajudar seus pais com seus ministérios. Eu conheço uma mãe e um pai que se oferecem para cuidar dos bebês no berçário da igreja — e seus filhos os ajudam alegremente depois que o culto termina. Sua filha Katie (de nove anos) ajuda a limpar e arrumar os brinquedos e equipamentos, enrola os tapetes e aspira o chão. Ou aqui está outra maneira que você pode ajudar. Quando houver um dia de trabalho na igreja, pergunte ao seu pai se você pode ir junto com ele. É muito divertido plantar e regar flores, varrer as folhas e ajudar a tornar a igreja mais bonita.

O que você quer desenvolver é um coração que serve. Essa é uma maneira de você ser mais parecida com Jesus.

Porque até o Filho do Homem não veio para ser servido, mas para servir e dar a sua vida para salvar muita gente (Marcos 10.45). O que esse versículo lhe fala sobre Jesus?

DE CORAÇÃO PRA CORAÇÃO

Emma estava feliz. Ela tinha Jill! E Jill fez a igreja se tornar divertida e emocionante. Mas talvez você não tenha uma Jill. Isso pode significar que você terá que se esforçar mais para crescer espiritualmente e aprender mais sobre Jesus enquanto estiver na igreja. E, como descobrimos, parte desse aprendizado vem quando vamos à igreja e fazemos parte das atividades dos adolescentes.

E pense nas coisas legais que acontecem quando você está na igreja. Por um lado, você está separada do mundo e de suas influências negativas por algumas horas. E você pode estar em um lugar onde os pré-adolescentes estão pensando e falando sobre Jesus. Você pode criar amizades com garotas que têm as mesmas prioridades que você. E quem sabe? Algum dia no futuro distante, no tempo de Deus, você pode até encontrar um garoto legal que pensa em Jesus como você!

Eu espero e oro para que você ame ir à igreja. E se você não está exatamente “amando” a ideia de ir à igreja, espero e oro para que você tenha uma mudança de coração. Peça a Deus para ajudá-la a entender como é importante encontrar-se com os cristãos e crescer no Senhor. Você também pode orar para encontrar uma nova amiga lá — uma irmã em Cristo segundo o coração de Deus, a quem você pode esperar ver a cada semana.

Então, para resumir as coisas, aqui estão quatro boas razões para desfrutar e apreciar o seu tempo na igreja. Cada uma é importante, e cada uma é uma razão excitante para querer ir à igreja. Você vai à igreja ...

adorar a Jesus.

ser ensinada mais sobre Jesus.

trazer as crianças que precisam conhecer Jesus.

servir aos outros como Jesus.

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus, aprendendo sobre a importância da C-H-U-R-C-H (igreja em inglês). Nesta página, escreva o assunto para cada letra. (Eu vou começar com “C”.)

Creia que a igreja é o plano de Deus.

H

U

R

C H

Agora, escreva uma coisa que você gostou, aprendeu ou quis fazer sobre seu envolvimento em sua igreja. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Emma ficou feliz por ir à igreja por causa da professora Jill, que amava Jesus; o que você mais gosta de aprender ou fazer quando vai à igreja?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O Salmo convida a adorar a Deus com alegria, cantando e agradecendo; qual é um jeito de você participar e prestar atenção da próxima vez que estiver na igreja?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Jesus veio para servir, e a igreja é um lugar onde podemos ajudar uns aos outros; como você poderia ajudar de alguma forma na sua igreja nesta semana?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 8 — Meu Eu$t$, 9,
$conteudo$“U au! Oh, uau!” Isso foi tudo o que Emma poderia dizer. Ela estava absolutamente impressionada! Ela e sua mãe tinham acabado de entrar no auditório cívico, onde a feira anual de artesanato do condado estava sendo realizada. Essa foi a primeira vez que a mãe de Emma a convidou para a feira. (Bem, a mãe dela a convidou no ano passado, mas na época ela estava mais interessada em brincar com as crianças do bairro.)

Mas esse ano foi diferente. Com os anos, Emma observou sua mãe criar presentes para os outros. Agora ela estava animada para começar a aprender como fazer esse artesanato legal, e ela estava animada com esse momento especial junto com sua mãe!

Enquanto Emma ficou lá, ela não pôde deixar de refletir sobre como as coisas estavam mudando em sua vida, em seus interesses, seu corpo e seus sonhos. A cada ano que passava, o trabalho da escola estava ficando mais exigente. À medida que suas amigas cresciam e mudavam também, ficava mais difícil ter amizades verdadeiras. E ela não conseguia entender o que estava acontecendo, mas ela percebeu que estava ficando mais mal-humorada. Às vezes ela se sentia como se estivesse em uma montanha russa de emoções. Coisas que antes eram divertidas não eram mais tão divertidas. Parecia que a vida se tornara mais complicada.

Bem, graças a Deus pela feira de artesanato! A visão emocionante dos muitos estandes de artesanato rapidamente apagou todas as inquietações e preocupações de Emma quando ela se perguntou: “Agora, qual estande devo visitar primeiro? Uau! Oh, uau!”.

Diversão na Palavra de Deus

Algumas partes do crescimento são muito divertidas. Para começar, há muitas coisas novas para fazer quase todos os dias. E conforme você cresce fisicamente, adivinhe? Você precisa de roupas novas — e isso significa s-h-o-p-p-i-n-g! Quando você entra nos grupos de pré-adolescentes e adolescentes, você pode precisar de aparelho dentário — e escolher uma combinação maluca de cores para seus elásticos que coloca no aparelho toda vez que for ao ortodontista. E um dia você acorda e se dá conta de que cresceu a uma altura que a qualifica para usufruir de mais brinquedos no parque de diversões. Sim, há tantas coisas novas que enchem seus dias de aventura!

E um pouco do seu novo crescimento pode ser intrigante e até assustador à medida que seu corpo muda e suas responsabilidades aumentam — como estar na responsabilidade de seu irmãozinho ou irmãzinha, ajudar com um novo bebê ou ficar em casa sozinha até que seus pais chegam do trabalho.

O que quer que esteja acontecendo em sua vida, a Palavra de Deus tem ajuda, respostas e um doce encorajamento para você, enquanto você se aventura pela vida com Jesus. Então, vamos nos preparar para descobrir algumas verdades radicais sobre o seu S-E-L-F (que quer dizer sobre si mesma, em inglês). Aqui vamos nós!

Sempre comece cada dia com ação de graças! Agradeça a Deus a cada nova manhã pelo seu amor por você. Você percebe que nunca há um minuto em sua vida em que você não deixa de ser especial para Deus e amada por Ele? Ele fez você. Ele sabe tudo sobre você. E ele a ama — não importa o quê.

Como isso ajuda uma menina que está ocupada a crescer, uma menina que está no processo de se tornar uma menina segundo o coração de Deus? Bem, isso ajuda a perceber que, não importa o que está acontecendo em casa com seus pais e irmãos e irmãs, ou na escola, Deus ama você. Ou quando você sente que não é muito especial — para si mesma ou para qualquer outra pessoa — você pode saber que é um tesouro para Deus e muito amada por Ele. Ou quando as crianças na escola não parecem muito amigáveis ou agradáveis, você pode sempre confiar no amor de Deus por você. Mergulhe, de verdade, no amor de Deus ao olhar para esses versículos.

Porque Deus amou o mundo tanto, que deu o seu único Filho (João 3.16). Quão grande é o amor de Deus pelo seu mundo e por você?

Deus disse: “Eu nunca os deixarei e jamais os abandonarei” (Hebreus 13.5). Quão forte e por quanto tempo é o amor de Deus? Experimente aproveitar a sua vida, a si mesma, seus dias. Quando eu era uma nova convertida, encontrei o Salmo 118.24. Enquanto lia várias vezes e meditava naquelas palavras, tomei uma decisão. Decidi que, antes mesmo de sair da cama todas as manhãs, começaria cada dia com estas palavras do Salmo 118.24 (ARC):

Este é o dia que fez o SENHOR;

regozijemo-nos e alegremo-nos nele.

Veja bem, eu tinha um mau hábito. Assim que meu despertador tocava, eu começava a lamentar, gemer e pensar: “Ah, não! Me diga que não é hora de levantar! Estou tão cansada! Alguém me dê um tempo!” Mas então comecei a lembrar minha decisão de cumprimentar cada novo dia com alegria. Então eu dizia essas palavras no meu coração ou em voz alta, não importando o que estivesse acontecendo, não importando o que eu tivesse que fazer naquele dia: Este é o dia que fez o SENHOR; regozijemo-nos e alegremo-nos nele.

Eu escolhi começar cada dia lembrando de Deus e sendo feliz. Mesmo se eu tivesse um grande teste, fiz de Deus meu primeiro pensamento. Mesmo se eu estivesse doente, a alegria em Deus me dava um espírito mais alegre. Mesmo se eu estivesse indo ao dentista (eca!), Eu me lembrava de que, como Deus estava no comando do meu dia, eu poderia ser feliz.

Não me entenda mal. Eu adorava ir à escola. Quero dizer, que é onde meus amigos estavam. É onde meus professores estavam. Era lá que a ação estava. Mas sempre houve desafios. Como sentir que eu não era tão bonita ou fofa ou inteligente como algumas das outras garotas. Como acreditar que eu era burra quando chegava na matemática. Gostaria de saber se alguém iria brincar comigo ou sair comigo durante o almoço e o recreio.

Oh, havia muitas coisas que eu temia! Como sempre estava com medo, eu dava uma resposta errada quando o professor me chamava. Como fazer o teste de soletração das sextas-feiras. E havia coisas fora da escola que eu super-temia ... como meus recitais de piano. Eu amava música e amava praticar e tocar piano. Mas os recitais eram 100% pavorosos.

Você sabe o que me ajudou nas coisas difíceis dos meus dias? Salmos 118.24! Não importa o que estava à frente no meu dia, lembrando que “este é o dia que fez o SENHOR” me ajudou a entregar o dia a Deus e me alegrar, ter prazer e me divertir!

Espírito de Deus produz ... a alegria (Gálatas 5.22). Qual é a marca de um cristão cheio do Espírito e que está andando pelo Espírito de Deus? De onde vem essa qualidade?

Lembre-se de olhar para dentro do seu coração tanto quanto você se olha no espelho. Pense sobre isso “e se”. E se houvesse um temporizador secreto escondido dentro do seu espelho que registrasse quanto tempo você gasta olhando para si mesma? A que ponto você acha que chegaria o número total de minutos — ou horas! — a cada dia?

E aqui está uma questão mais importante: o que você vê quando olha para o seu reflexo no seu espelho? Muitas de nós, meninas, vemos imediatamente tudo o que há de errado conosco — ou o que pensamos que está errado conosco. Não importa nossas boas características! Oh não, nossos olhos vão direto para um nariz que não gostamos, orelhas que pensamos estarem para fora, dentes que, com certeza, nunca endireitarão. Parece que somos feitas de manchas, cabelos que não cooperam e muitas sardas. É impossível escapar de espelhos. Mas aqui está uma coisa que você pode fazer em relação ao espelho: você pode se olhar no espelho com menos frequência. Use-o para ter certeza de que sua aparência é perfeita e envie a mensagem de que você é uma garota segundo o coração de Deus — inocente, modesta, pura e doce. Mas uma vez que você saiba que está bem, volte para a vida real. Graças a Deus pelo que você está se tornando — uma garota que está mais preocupada com seu coração e caráter do que com sua aparência.

Porque o SENHOR não vê como vê o homem. Pois o homem vê o que está diante dos olhos, porém o SENHOR olha para o coração (1 Samuel 16.7, ARC). Como o Senhor é diferente das pessoas? Onde as pessoas tendem a focar sua atenção? Onde o Senhor olha no lugar de olhar o mesmo que as outras pessoas?

Foque a sua atenção no que Deus diz que é bom para você. Em Deus e através de Cristo, você é o objeto do seu amor. Você é um troféu de sua graça. Você é, assim espero, um membro da família de Deus. Isto é quem você realmente é! Não importa como se pareça ou quais habilidades tenha ou não, você é preciosa para Ele. Ao olhar para o versículo a seguir, preste mais atenção em como Deus a vê. Também não se esqueça de notar a atitude que Ele quer que você tenha sobre quem você é.

Eu te louvo porque deves ser temido. Tudo o que fazes é maravilhoso ... (Salmos 139.14). Deus nunca comete um erro. O que você aprende aqui sobre si mesma?

DE CORAÇÃO PRA CORAÇÃO

Enquanto observo este capítulo, meus olhos estão pousando em palavras como “amor”, “alegria” e “beleza”. Quão positivo é isso? Quão maravilhoso é isso? Mas por que é que pensamos em nós mesmas de forma tão negativa quando Deus está constantemente nos dizendo como somos belas aos olhos dEle? Por que somos tão duras com nós mesmas quando Deus foi tão longe — a morte de seu Filho Jesus — para gritar e mostrar seu amor por nós? Por que nos colocamos para baixo quando Deus está expressando quão satisfeito está conosco?

Claro, às vezes cometemos erros. Somos indelicadas com alguém, ou prestamos muita atenção ao que as garotas “populares” estão usando e queremos nos vestir como elas em vez de buscar o jeito que Deus quer para nós. E às vezes ficamos muito mal-humoradas e rabugentas.

Mas aqui está o que é importante lembrar:

Lembre-se de que você é feita de forma terrível e maravilhosa — exatamente do jeito que é. O próprio Deus fez você e Ele nunca comete erros! Lembre-se de que você pode ser feliz a cada segundo de cada dia — não importa o que esteja acontecendo com você — porque Deus está com você.

Lembre-se de que você está em constante mudança à medida que cresce, ano após ano. Algumas dessas mudanças são novas, portanto, converse sobre essas mudanças com sua mãe.

Lembre-se de que você é tão especial quanto um floco de neve único e sem igual, uma das obras verdadeiramente maravilhosas de Deus!

Aproveite a sua jornada com Jesus enquanto você, como Ele, cresce “em sabedoria, e em estatura, e em graça para com Deus e os homens” (Lucas 2.52, ARC).

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus, aprendendo sobre a importância do S-E-L-F (sobre si mesma, em inglês). Nesta página, escreva o assunto para cada letra. (Eu vou começar com o “S”.)

Sempre comece cada dia com ação de graças!

E

L

F

Agora, escreva uma coisa que você gostou, aprendeu ou quis fazer sobre você e sobre você mesma. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A autora ensina que você é um tesouro para Deus e amada por Ele, não importa o que aconteça; como você se sente ao saber que Deus ama você exatamente como você é?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A Bíblia diz que Deus olha para o coração, e não para a aparência; qual é uma coisa bonita do seu coração que você gostaria que crescesse cada vez mais?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A Elizabeth começava o dia dizendo "este é o dia que fez o Senhor, vamos nos alegrar"; o que você pode falar ou agradecer logo ao acordar para começar o dia feliz com Jesus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 9 — Meu Tempo$t$, 10,
$conteudo$“Q ue dia!” Emma resmungou quando ela caiu em sua cama. Ela estava se sentindo absolutamente muito cansada. Ela mal podia esperar para apagar a luz, deitar-se e finalmente dormir um pouco. Mas assim que Emma estava prestes a adormecer, outro pensamento a abalou — ela não passara um tempo com Jesus hoje. Sua professora da Escola Dominical pedira às crianças que encontrassem alguns minutos todos os dias para ler a Bíblia e orar. “Oh, não!” Emma argumentou, “Eu simplesmente não tenho tempo hoje. E eu fui longe demais agora. Farei isso amanhã.”

Sim, Emma tinha feito muitas atividades. Teve aula o dia todo. E depois da escola havia ensaiado para a peça da escola. Isso foi seguido por uma ida ao shopping com sua mãe para escolher um presente de aniversário para seu irmão. O dia dela estava tão cheio que parecia que ela não tinha tempo livre.

Mas enquanto pensava sobre isso, Emma teve que admitir que tinha desperdiçado algum tempo. Ela adiara suas tarefas, teve um devaneio sobre o tempo que passara antes da escola, de alguma forma — como conseguiu conversar com todos os amigos no telefone e se demorou em seu dever de casa, terminando bem a tempo de ir para a cama. Mesmo no que parecia ser um dia incrivelmente ocupado, Emma poderia pensar em muitas ocasiões em que poderia ter feito o mais importante — passar algum tempo com Jesus.

Diversão na Palavra de Deus! Eu acho que você e eu podemos nos identificar com o cansaço de Emma. E também podemos nos identificar com sua percepção de que a vida é muito ocupada. Parece que não há o T-I-M-E (que quer dizer tempo, em inglês) suficiente em um dia para fazer tudo o que precisamos. Então, vamos dar uma olhada em como gastamos nosso tempo e como devemos gastá-lo.

Tempo é um tesouro. Você nunca jogaria fora tesouros como ouro, prata, diamantes e pérolas, não é? Como uma garota segundo o coração de Deus, você não deve jogar fora seus dias e minutos também. Por quê? Porque eles também são riquezas e tesouros!

Você pode não pensar muito sobre o valor do seu tempo e sobre o que você gasta. Mas Deus diz que é sensato realçar quão precioso é o tempo. Ninguém sabe quanto tempo ele ou ela viverá, mas sabemos que temos hoje. E hoje é um tesouro que Deus lhe deu para gastar e usar com sabedoria. Aqui está o que a Palavra de Deus diz:

Faze com que saibamos como são poucos os dias da nossa vida para que tenhamos um coração sábio. (Salmos 90.12). Qual é o resultado quando valorizamos cada dia e prestamos atenção em como gastamos nosso tempo? Importante é “fazer isso agora”. Você tem o mau hábito de adiar as coisas, especialmente se é algo que você não quer fazer? Sua mãe lhe diz para limpar seu quarto ou fazer sua lição de casa. Mas você diz a si mesma: “Eu vou fazer isso depois”. Ou você tem um teste chegando para fazer na escola. Seu professor vem avisando a classe todos os dias, durante uma semana, sobre este teste. E você ainda nem começou a estudar.

Notícias de última hora! Adivinha? Seu quarto bagunçado, seu trabalho de casa e esse teste não vão simplesmente desaparecer no reino enevoado da Terra do Nunca.

Você sabe como é chamado esse ato de adiar as coisas? Procrastinação. É o que estamos fazendo — procrastinar — quando decidimos deixar algo para depois, em vez de fazê-lo agora. Mas Deus nos dá uma maneira melhor de fazer as coisas. Leia!

Com toda a pressa e sem demora, procuro obedecer aos teus mandamentos. (Salmos 119.60). Que palavras neste versículo falam sobre a importância de fazer as coisas agora?

Maximize e aproveite ao máximo seu tempo. Emma pensou que não havia horas suficientes no dia para fazer todas as coisas que ela tinha para fazer e queria fazer. O que a Palavra de Deus fala a respeito disso? Tudo neste mundo tem o seu tempo; cada coisa tem a sua ocasião. (Eclesiastes 3.1). Este versículo diz que há um momento para você fazer todas as coisas que você quer fazer que são verdadeiramente importantes!

OK. Às vezes seus dias estão cheios de coisas que você tem que fazer. Mas aqui está outra cena da vida real. Você está em casa... e parece que não há absolutamente nada para fazer! Ninguém está por perto para brincar. Você fez o seu trabalho escolar e todas as suas tarefas. Na verdade, você já fez tudo o que pode pensar em fazer! Então sai da sua boca um grande suspiro e aquelas palavras terríveis — “Estou entediada!”

Oh céus! Você quer saber o segredo para nunca mais ficar entediada? Aqui está. Faça uma lista de “5 Coisas que Eu Quero Fazer”. As coisas na sua lista podem incluir metas ou sonhos, hobbies, uma série de livros que você gostaria de ler, algo que você gostaria de conhecer ou aprender a fazer.

Você percebe o quanto algum tempo livre poderia ser realmente emocionante? Dá-lhe a oportunidade de escrever um livro completo com as suas próprias ilustrações. Você também pode escrever para um missionário ou um amigo por correspondência. Você pode retirar sua caixa de artesanato e fazer algo para alguém especial. Você pode desenhar uma história em quadrinhos. Você pode projetar e fazer joias. Você pode ler uma coleção de livros da biblioteca. Você pode aproveitar o tempo com sua coleção de bonecas e costurar roupas para elas. Você pode até trabalhar em um estudo pessoal da Bíblia que seja apenas para você.

Existem muitas coisas que você pode aprender a fazer. Você pode usar seu tempo para aprender a fazer coisas legais com seu cabelo, pode aprender a tricotar ou fazer joias frisadas. Se você tem uma câmera, pode passar esse tempo tirando fotos de flores, insetos e cenas legais. Você pode até ler um livro da biblioteca sobre fotografia.

Eu sei que seus pais determinam como grande parte do seu tempo é gasto. Mas você provavelmente ainda tem muito tempo livre todos os dias — quando você pode escolher o que faz. É fácil pensar em ligar a TV e dar uma olhada (como Emma fez). É fácil preencher seu tempo livre jogando um jogo no computador ou em um aparelho de jogos portátil. Mas uma vez que você faça sua lista de tarefas, descobrirá que existem maneiras muito mais interessantes de gastar seu tempo. Você nunca mais dirá: “Estou entediada!”

Como aprendemos, o tempo é um tesouro. E, como nosso versículo disse, devemos valorizar cada dia e prestar atenção em como gastamos nosso tempo. Eu coloquei cinco linhas aqui para que você possa começar a sua lista de...

5 COISAS QUE EU QUERO FAZER

1.

2.

3.

4.

5.

Estime o valor das suas prioridades. Uma prioridade é algo que é mais importante que outras coisas. Há muitas maneiras de usar seu tempo. Agora, a questão é: como você pode começar a escolher as melhores opções em vez de opções que não são as melhores?

Muitas de suas atividades — como a escola — foram decididas por outras pessoas. Outras, como esportes, aulas de música e atividades da igreja, foram estabelecidas para você por seus pais. Além disso, você tem suas tarefas em casa. Essas prioridades são “gravadas em pedra”. Então, como Deus quer que você se aproxime dessas prioridades estabelecidas?

E tudo o que vocês fizerem ou disserem, façam em nome do Senhor Jesus (Colossenses 3.17). Como você faz tudo, inclusive cuidando de suas tarefas importantes?

Se você não fizer algum planejamento (como Emma descobriu!), o tempo com Jesus pode ser sacrificado em sua vida. Jesus não quer que você negligencie a escola, a família ou outras atividades importantes. Mas, assim como você reserva um tempo para ir à escola ou praticar um instrumento musical, precisa planejar um tempo para se encontrar com Deus. Você precisa escolher um momento em que lerá a sua Palavra e orará. Passar tempo com Jesus é a prioridade mais importante que você tem todos os dias. Olhe para estes grandes versículos e circule a palavra “buscar” em cada verso: Mas buscai primeiro o Reino de Deus, e a sua justiça, e todas essas coisas vos serão acrescentadas (Mateus 6.33, ARC).

Bem-aventurados [felizes] os que guardam os seus testemunhos e o buscam de todo o coração. (Salmo 119.2, ARC).

De todo o meu coração te busquei; não me deixes desviar dos teus mandamentos. (Salmos 119.10, ARC).

Ó Deus, tu és o meu Deus; ansiosamente te buscarei. (Salmo 63.1, TB).

DE CORAÇÃO PRA CORAÇÃO

Espero que você esteja começando a perceber o quão importante é o seu tempo, especialmente quando se trata de tempo com Jesus. Você faz de Jesus uma prioridade quando se compromete a passar tempo com Ele. Você falharia em aparecer para uma reunião com um professor e faltaria? Você poderia faltar a festa de aniversário de uma amiga? Acho que não! Então, por que você não quer dar tempo para Jesus, a pessoa mais importante do mundo?

Quando você passa um tempo com Jesus, grandes coisas acontecem! Ele torna os seus dias mais emocionantes. Ele lhe dá um coração feliz. Ele ajuda você a fazer o seu melhor e fazê-lo de uma maneira que o honre. Ele mostra como ser mais gentil e prestativa com os outros. E Ele faz o seu trabalho incrível de transformá-la no que você realmente quer ser — uma garota segundo o seu próprio coração! Então, quando você coloca sua cabeça em seu travesseiro à noite, em vez de se sentir mal (como Emma), você pode agradecer a Jesus por um dia maravilhoso!

MINHA AVENTURA COM JESUS

Neste capítulo, nos divertimos na Palavra de Deus, aprendendo sobre a importância do T-I-M-E (que quer dizer tempo, em inglês). Nesta página, escreva o assunto para cada letra. (Eu vou começar com o “T”.)

Tempo é um tesouro.

I

M

E

Agora, escreva uma coisa que você gostou, aprendeu ou quer fazer sobre como você gasta seu tempo. Então aproveite a aventura!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A Emma percebeu que tinha desperdiçado tempo e deixado de ficar com Jesus; em que momentos do seu dia você poderia separar alguns minutinhos para orar e ler a Bíblia?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A autora diz que o tempo é um tesouro que não devemos jogar fora; qual é uma coisa legal e boa que você gostaria de fazer no seu tempo livre em vez de só ficar entediada?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A Bíblia ensina a buscar primeiro o Reino de Deus; como você pode fazer de Jesus a sua prioridade mais importante todos os dias, sem deixar para depois?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 10 — Minha Aventura com Jesus$t$, 11,
$conteudo$Uau, que viagem! Eu não posso acreditar em todas as coisas que falamos em nossa jornada juntas com Jesus. Eu realmente espero que você tenha gostado da nossa aventura. Eu sei que eu gostei!

Enquanto viajávamos, vimos Emma lutando com a vida diária em casa, na escola, na igreja e com as amigas. (Você poderia relacionar?) Nós olhamos para algumas das principais áreas da vida de uma garota pré-adolescente. Nós também discutimos o que significa ser uma garota segundo o coração de Deus — uma garota que quer conhecer a Deus e fazer a sua vontade.

Antes de seguirmos caminhos separados, aqui estão algumas coisas importantes a serem lembradas sobre Jesus, seu coração e sua vida. Tenho certeza de que você não está surpresa que trago outro acróstico! Na verdade, é uma sentença. (E, claro, ele soletra J-E-S-U-S.)

Jesus, o Filho de Deus

Entrou neste mundo como um bebê, e Sacrificou-se pelos pecadores para

Uni-los com o Pai dando a

Segurança da vida eterna a todos que creem nEle.

Você notou que ao longo deste livro nós falamos sobre Jesus e sobre sermos cristãs? Talvez você tenha perguntado: “O que significa ser cristã? Eu sou cristã? Como posso me tornar cristã?”

Até agora você provavelmente não está surpresa em saber que a Bíblia nos diz como ter um relacionamento pessoal com Jesus. Aqui estão alguns versículos, muitas vezes chamados de “A Estrada de Romanos para a Salvação”. Isso porque todos os versículos dessa “estrada” são do livro de Romanos no Novo Testamento da Bíblia.

A ESTRADA DE ROMANOS

Romanos 3.23 fala sobre sua condição pecaminosa — Todos pecaram e estão afastados da presença gloriosa de Deus. Romanos 6.23 mostra-lhe o resultado da sua condição pecaminosa e revela o dom (presente) que Deus lhe oferece em vez disso — Pois o salário do pecado é a morte, mas o presente gratuito de Deus é a vida eterna, que temos em união com Cristo Jesus, o nosso Senhor.

Romanos 5.8 aponta a graça e o amor de Deus por você como uma solução de Cristo para sua condição pecaminosa — Mas Deus nos mostrou o quanto nos ama: Cristo morreu por nós quando ainda vivíamos no pecado.

Romanos 10.9, 10 revela alguns passos para se tornar um cristão — Se você disser com a sua boca: “Jesus é Senhor” e no seu coração crer que Deus ressuscitou Jesus, você será salvo. Porque nós cremos com o coração e somos aceitos por Deus; falamos com a boca e assim somos salvos.

O tempo todo eu conheço meninas — e mulheres — que não têm certeza se são cristãs ou não. Elas querem ser cristãs, mas não sabem como.

O caminho para se tornar uma cristã é receber Jesus Cristo como seu Salvador pessoal. Se ser cristã e tornar-se filha de Deus é o desejo do seu coração, você pode fazer uma oração sincera do seu coração como esta:

UMA ORAÇÃO DE ENTREGA

Deus, eu quero ser sua filha, uma verdadeira garota segundo o seu coração — uma garota que vive a vida em Ti, e através de Ti, e por Ti, não por mim mesma. Eu admito que sou uma pecadora e muitas vezes não faço o que o Senhor diz ser o certo. Eu recebo seu Filho, Jesus Cristo, em meu coração carente. Eu lhe agradeço porque Ele morreu na cruz por meus pecados. Obrigada por me dar sua graça e sua força para que eu possa segui-lo com todo o meu coração. Amém.

DE CORAÇÃO PRA CORAÇÃO

Quando você terminar este livro e chegar ao final desta aventura com Jesus, adivinha o quê? Não é o fim! Isso porque você continuará a andar com Jesus por toda a sua vida. Você continuará sua jornada com Jesus e crescerá cada vez mais com o passar dos anos. Por exemplo:

Você vai crescer em amor — amor por Jesus, amor por sua família e amor pelos outros.

Você vai crescer no conhecimento da Palavra de Deus ao ler sua Bíblia, ir à igreja e cercar-se de amigos que também amam a Jesus.

Você vai crescer em sabedoria para não cometer muitos erros. Você aprenderá o que é certo e o que é errado. E você aprenderá a fazer escolhas sábias ao ler sua Bíblia e conversar com seus pais e outros cristãos.

Você crescerá na graça de Deus ao atingir bloqueios ou tropeços ao longo do caminho e experimentar provações. Mas louvado seja Deus, por que sua graça é suficiente para ajudá-la e ensiná-la a lidar com seus problemas.

Você crescerá em alegria ao se apaixonar cada vez mais por Jesus e caminhar de perto com Ele. A alegria do Senhor fortalecerá você para cada desafio. E você conhecerá verdadeira alegria quando Deus lhe recompensar por cada vitória, conquista e realização que você experimenta pela graça divina.

Deus tem grandes planos para você. Terminar este livro é apenas um passo em direção à descoberta do plano de Deus. Então, parabéns por completar essa parte da jornada para se tornar uma garota segundo o coração de Deus! Continue seguindo em frente. Sua aventura está apenas começando!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A autora explica que Jesus se sacrificou na cruz para nos unir a Deus e dar vida eterna a quem crê nEle; o que o seu coração sente ao saber o quanto Jesus te ama?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A "Estrada de Romanos" mostra que todos pecam, mas Deus oferece o presente da vida eterna em Jesus; o que significa para você receber Jesus no seu coração?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A Elizabeth diz que esta é só a primeira parte da aventura e que você vai crescer em amor, sabedoria e alegria; como você quer continuar caminhando com Jesus a partir de agora?$p$, 'reflexao', null);
  end if;

end $migration$;
