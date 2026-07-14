-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 10 — Testado e aprovado (aula ordem = 10)
--
-- Localiza o curso já criado pela migration 058 (slug
-- 'o-desafio-de-todo-lider') e insere a aula no ordem do
-- capítulo, com as perguntas do Desafio Prático como reflexões.
--
-- Idempotente: pode ser reaplicada sem duplicar aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
begin
  select id into v_curso_id from public.cursos
  where slug = 'o-desafio-de-todo-lider';

  if v_curso_id is null then
    raise exception 'Curso o-desafio-de-todo-lider não encontrado. Aplique a migration 058 primeiro.';
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 10 — Testado e aprovado
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 10;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 10 — Testado e aprovado',
      10,
$conteudo$Como vimos no capítulo anterior, no decurso de toda a nossa vida em nossa linha do tempo, Deus permite que passemos por alguns testes para formar nosso caráter, a fim de verificar nossa consistência com relação aos valores interiores. Se fracassarmos, e especialmente se tal fracasso envolver nossa relação pessoal com Deus, o arrependimento e o perdão resolvem o problema, não restando mágoas ou sequelas que atinjam futuramente o nosso ministério. No entanto, se fracassarmos em um teste que envolva a vida de outras pessoas, dependendo da quantidade de pessoas e do tamanho do problema causado, tal fracasso (ou fracassos) podem provocar sérias complicações para nosso ministério. A jornada de um líder testado e aprovado é marcada pela superação de desafios e pela busca incessante da excelência.

Os testes de Deus têm grandes benefícios. Eles nos levam a:

• Manter-nos fiéis a uma promessa ou voto que fizemos;
• Ativar ou aumentar o fogo pelo ministério e pela visão;
• Permitir o fortalecimento do caráter interior;
• Aumentar a fé em Deus;
• Estabelecer valores interiores, que serão extremamente importantes para a nova esfera de liderança;
• Ensinar submissão e servir de exemplo a outras pessoas sobre a seriedade da obediência a Deus.
• Ter marcas claras de avanço, estagnação ou retrocesso.

A seguir, trataremos dos quatro tipos de testes usados por Deus para formar o interior do líder: testes de integridade, da Palavra, de obediência e de consciência.

OS TESTES DE INTEGRIDADE

Todo líder será testado, mas o verdadeiro desafio é superar esses testes e continuar avançando com eficiência e excelência. Os testes de integridade são o instrumento usado por Deus para avaliar as intenções do coração, visando formar o caráter da pessoa. No cerne das qualificações bíblicas para a liderança está a integridade, aquela adesão completa a um código de valores morais, que se revela em sinceridade, honestidade e pureza, e evita o engano e a artificialidade.

O significado literal de integridade é o estado de ser completo e indivisível, o que traduz a qualidade característica da pessoa íntegra: a de resistir às pressões e aguentar firme, não permitindo a dicotomia entre os seus valores e suas ações. Integridade não se baseia nas circunstâncias; integridade não se baseia em credenciais. Alguém já disse: "as credenciais são passageiras, elas põem o foco nos direitos, valorizam uma pessoa, isto é, só valorizam aquele que as possui; já o caráter é permanente, põe o foco nas responsabilidades, valoriza muitas pessoas".

A relevância dos testes de integridade magnifica-se quando todos sabemos que é possível encontrar pessoas em posição de liderança sem qualquer senso de integridade. O que não é possível acontecer, no entanto, é ser um homem ou uma mulher de Deus, com unção e aprovação ministerial, sem passar nos testes de integridade.

Em todos esses testes, Deus prova nossos valores interiores, e a nossa resposta determina a possibilidade de expansão ou retração do nosso ministério. Os líderes que são testados e aprovados demonstram sua capacidade de alcançar resultados eficientes, mesmo nas circunstâncias mais difíceis. A Bíblia menciona muitos exemplos.

Daniel é um caso clássico. No capítulo primeiro de seu livro, ele passou por um teste de integridade ao resolver firmemente não se contaminar com as finas iguarias do rei nem com o vinho que ele bebia, pois eram oferecidos aos deuses babilônicos. Ele fez, então, uma proposta alternativa, sugerindo que fosse feita uma experiência, permitindo que ele e seus amigos se alimentassem, por dez dias, apenas com água e legumes. Ao final deste período, o cozinheiro-chefe compararia a aparência deles com a dos outros jovens e veria qual grupo obtivera o melhor resultado. Após os dez dias, eles estavam mais robustos do que os outros jovens, que comiam das finas iguarias do rei. Daniel foi provado, passou no teste e Deus expandiu seu ministério. Ele chegou a ser a segunda pessoa na cadeia de autoridade do império babilônico.

Seus amigos Sadraque, Mesaque e Abede-Nego, que foram testados na área da sua fidelidade a Deus, são um outro exemplo deste mesmo princípio. Eles se recusaram a se curvar aos deuses babilônicos, pondo em risco a própria vida. Os caldeus os denunciaram ao rei Nabucodonosor, que os mandou lançar na fornalha de fogo ardente, por terem desobedecido ao seu decreto. Devido à sua fidelidade, Deus os honrou e eles sobreviveram à fornalha. Seus ministérios foram expandidos e eles foram postos como governadores da província da Babilônia. Os três foram, como Daniel, líderes espirituais que terminaram bem a sua jornada, firmes em suas convicções e mantendo sua integridade.

Em Gênesis 39, José resistiu à sedução da mulher de Potifar, mesmo tendo que expor-se ao ridículo de sair correndo do quarto dela praticamente despido. Sua integridade para com Deus ocupava a posição mais importante da sua lista de valores. Ele preferiu ser mandado para a prisão a abrir mão de suas convicções, pagando um alto preço por responder positivamente ao teste de integridade. Deus, contudo, o recompensou nos meses e anos seguintes, ao restituir a sua sorte e expandir tremendamente o seu ministério.

No Novo Testamento, em Atos 4, temos Pedro e João, que foram ameaçados pelos líderes do templo de Jerusalém, os quais lhes ordenaram que não falassem nem ensinassem em nome de Jesus. A resposta dos dois discípulos denota a preocupação de ambos com a integridade do seu chamado. Eles disseram: "Julgai se é justo diante de Deus ouvir-vos antes a vós outros do que a Deus; pois nós não podemos deixar de falar das coisas que vimos e ouvimos" (vv. 19-20). Como resultado de terem passado no teste de integridade, a Igreja continuou crescendo, pois Deus expandiu o ministério deles.

Por outro lado, temos o exemplo negativo do rei Saul, que falhou no teste da integridade de caráter e de ministério, perdendo sua unção. Saul desobedeceu a ordem de Deus para que destruísse tudo na fortaleza dos amalequitas. Ele decidiu preservar a vida do rei inimigo e tudo o que havia de melhor entre os despojos. A ordem de Deus foi clara, como também clara foi a escolha de Saul pela desobediência. Quando foi confrontado pelo profeta Samuel, Saul espiritualizou a mentira, alegando que não havia desobedecido a Deus, mas sim que havia trazido os melhores animais para oferecê-los ao Senhor. Samuel não aceitou a desobediência e a mentira e disse que Saul havia sido rejeitado por Deus e perdido a unção do Senhor. A perda da unção é a consequência mais trágica que pode resultar de uma reprovação no teste da integridade. O líder pode até permanecer na sua posição de liderança por um tempo, porém, sem a unção, não irá longe.

Os exemplos acima mostram que há vários tipos de testes de integridade. Vejamos alguns deles em detalhes.

O TESTE DA TENTAÇÃO

Deus testa a integridade do líder especificamente na área da tentação. A palavra grega para tentação é usada com o significado de testar. Isso indica que uma mesma situação pode indicar algo positivo (um teste) ou negativo (uma tentação) dependendo da reação do líder.

Deus permite essas situações porque elas podem ser resistidas. A Bíblia diz que não sobreveio tentação aos coríntios que não fosse humana (1Co 10.13). Isso significa que a tentação se encontra dentro da nossa capacidade de resistir. O versículo continua dizendo que, juntamente com a tentação, Deus proverá também o livramento, para que possamos suportá-la.

Desta forma, o "teste da tentação" é aquele em que nos é dada a oportunidade de, em resposta à tentação, quebrar os padrões pecaminosos. A pessoa que passa nesse teste sente-se perseverante, mais forte e confiante. Na verdade, somos tentados e testados em todo o tempo. Deus pode, por meio da tentação, dar-nos uma oportunidade para crescimento e libertação, dando-nos força para que possamos resisti-la e vencê-la.

Portanto, o objetivo do teste da tentação é pôr à prova as nossas convicções para verificar até onde nós suportamos, até que ponto permanecemos fiéis a elas, lembrando sempre que não há tentação que seja irresistível, insuportável ou invencível. Deus não nos tenta, ele apenas nos testa. Quem nos tenta são o inimigo e a carne. Deus apenas usa esta situação de tentação para que possamos crescer, formando em nós a imagem de Jesus.

O TESTE DA RESTITUIÇÃO

Esse teste consiste em devolver, em todos os aspectos – emocionais, espirituais, relacionais ou financeiros – aquilo que foi tirado da outra pessoa, como Zaqueu fez. Ele implica em checar a nossa disposição de sermos honestos, em todas as áreas de nossa vida.

O TESTE DA FIDELIDADE

Somos também testados em relação à lealdade para com Deus e com o nosso próximo. Esse é um teste muito difícil, porque a lealdade baseia-se em confiança, que é o ponto-chave desta questão. Implica em confiarmos no outro, apesar das suas imperfeições. Uma das maiores tragédias que pode nos acontecer é perdermos o privilégio de sermos leais uns para com os outros.

A grande herança que precisamos resgatar no cristianismo é o sentido de mutualidade, especialmente neste aspecto de confiança e lealdade. Tal aspecto da vida cristã encontra-se muito desgastado em nossos dias. Qual é a imagem que estamos passando ao mundo quando agimos desta forma? De que maneira isso tem comprometido a mensagem que pregamos? Se não confiamos uns nos outros, como acreditarão na mensagem que pregamos?

O TESTE DO CONFLITO NA VISÃO MINISTERIAL

Deus permite o conflito nesta área de visão para que sejamos testados na questão de como a conduzimos e para estabelecer os nossos limites (até onde estamos realmente convictos daquilo que estamos praticando).

O conflito pode surgir por meio das circunstâncias ou das pessoas. Exemplos de situações em que surge o conflito por meio das circunstâncias são aqueles casos em que o líder tem clara convicção da direção que deve seguir, mas falta dinheiro, falta sustento, faltam recursos humanos etc. O líder, nesse caso, está sendo testado na sua persistência, na sua perseverança e na sua atitude, checando se manterá a sua integridade na condução do conflito.

Esse é um teste bastante estratégico, pois demonstra a integridade da pessoa e sua capacidade de perseverança, mesmo em meio a um grande conflito. Uma pessoa sem integridade simplesmente abandona a instituição e vai tentar a sorte em outro lugar. Quando esse tipo de teste acontece, Deus está testando o líder na área do conflito na visão, para ver até onde ele sustentará o rumo, mesmo que, eventualmente, as circunstâncias ou as pessoas sejam adversas, entrando em conflito com a sua visão.

O TESTE DA PERSEGUIÇÃO

Esse teste ocorre quando as circunstâncias se voltam contra o líder sem que haja, aparentemente, algum motivo que justifique tal fato. Deus está testando a firmeza do líder em não abrir mão daquilo em que ele acredita.

O TESTE DA TRAIÇÃO

Esse é o teste de integridade mais complicado e desestimulador que pode existir. Há poucas coisas mais desestimulantes do que ser traído, como Jesus foi. No entanto, se o líder for fiel, Deus honrará o seu ministério, como fez com Jesus. Deus testa a fé do líder e a maneira como ele vai se conduzir frente a uma situação em que está sendo traído por outros líderes que se rebelam, querendo ocupar o seu lugar.

A Bíblia nos ensina, em Provérbios 4.23. "Sobre tudo o que se deve guardar, guarda o coração, porque dele procedem as fontes da vida". Este teste é um dos poucos que têm a capacidade de macular o coração do líder, tornando-o amargurado pelo fato de ter sido traído por alguém que estava a seu lado, alguém em quem ele confiava. Os líderes que enfrentam esta situação mas não passam no teste frequentemente ficam com o coração cheio de amargura, raiva e ressentimento, incapazes de liberar o perdão em relação ao que aconteceu.

O aspecto positivo é que, se o líder for sábio, ele passará a se concentrar ainda mais na maneira como seleciona os líderes que o cercam. Ele terá a oportunidade de basear sua seleção em critérios que enfatizam a integridade, espiritualidade, experiência e boa reputação, tanto na sociedade quanto na comunidade. É preciso que o líder saiba selecionar homens e mulheres de Deus que possam ajudá-lo, não o atrapalhar.

Muitos hoje fazem a clara opção de selecionar e treinar líderes oriundos de dentro do próprio contexto local onde a pessoa esteja atuando, ao invés de importar líderes. Os defensores dessa ideia alegam que, por melhores que sejam as credenciais da pessoa que está chegando, é muito difícil para o líder que está estruturando o seu grupo de cooperadores conhecer as intenções, o caráter, a personalidade, os pontos fracos e fortes de uma pessoa com a qual não teve nenhum tipo de relacionamento anterior.

Outro ponto importante a ser considerado é que uma pessoa estranha ao contexto também desconhece o líder que já se encontra lá, o trabalho que vem sendo desenvolvido, bem como a visão da igreja. Nesses casos, comparado com outra pessoa de dentro da comunidade, o resultado em geral é que a pessoa não agrega muito à vida da igreja.

Igrejas em crescimento, em geral, são comunidades que desfrutam de longos pastorados. Isso ocorre porque, para que haja crescimento, é necessário que se desenvolva uma relação de confiança entre a comunidade e o líder. Com a tendência a ministérios de curta duração no mundo do cristianismo evangélico ocidental, não causa surpresa a prevalência atual de igrejas fracas e desnorteadas, sem convicção do rumo a seguir.

Além da dificuldade apresentada pelos ministérios de curta duração, deve-se adicionar a questão do conflito com colegas na mesma realidade ministerial, para se entender a tristeza e desencorajamento na liderança. Portanto, o que Deus espera do líder que está sendo testado nesta área é que não se amargure nem se deixe desencorajar, mas que caminhe em perseverança, fé, firmeza e comprometimento com Deus e, desta forma, ele se encarregará de expandir o seu ministério.

OS TESTES DE INTEGRIDADE E AS DIMENSÕES DE COMPROMETIMENTO DO LÍDER

Todo ser humano tem três áreas em seu mundo interior: área cognitiva (conhecimento, lógica e sabedoria), área afetiva (sentimentos) e área volitiva (vontade, valores e obediência; é a soma do que fazemos com o que sabemos – área cognitiva – e sentimos – área afetiva).

O teste da integridade enfatiza a formação do caráter das pessoas e, por isso, trabalha a partir da área da dimensão volitiva, que envolve a obediência e os valores. As igrejas, por meio do seu ensino, normalmente enfatizam o aspecto da informação, trabalhando, portanto, a partir da dimensão cognitiva, que envolve o conhecimento de doutrinas e peculiaridades relacionadas às práticas particulares da comunidade. Como resultado, a análise do que significa ser cristão em nossas comunidades é feita com base no que a pessoa sabe, no conhecimento que ela tem a respeito das doutrinas ensinadas, no fato de ela saber responder às perguntas-chave de determinada denominação.

Na realidade, embora a doutrinação faça parte do crescimento na santidade, Deus não está prioritariamente preocupado com a quantidade de informações que possuímos, nem tampouco com a maneira como expressamos nossas emoções perante ele. Para Deus, o que realmente importa é o que fazemos com aquilo que sabemos e sentimos.

O teste da integridade é a nossa resposta, em obediência e valores, à pergunta: "O que nós fazemos (atitudes) com o que sabemos (conhecimento) e sentimos (emoções)?" Não seremos cobrados sobre aquilo que não sabemos. No entanto, temos responsabilidade de agir a partir daquilo que já sabemos. À luz daquilo que nos foi ensinado, como estamos respondendo? É precisamente neste ponto que Deus quer trabalhar em nós, e é aqui que somos testados. O que temos feito com aquilo que já sabemos? Temos obedecido à voz de Deus? Temos vivido conforme os valores do reino que nos foram ensinados? Ser discípulo implica em sermos íntegros na resposta a estas perguntas. Afinal, "Como definimos o que é ser cristão?" Ser cristão é saber as respostas certas? Ser cristão é chorar, alegrar-se e dizer: "eu te amo, Jesus?" Ou cristão é aquele que, de dentro para fora, ao nível de obediência e valores, submete-se à vontade revelada de Deus em sua Palavra? A submissão e o comprometimento com os valores do reino é que devem ser a marca do cristão.

O TESTE DA PALAVRA

O teste da Palavra é "o processo no qual Deus examina a habilidade do líder para receber, entender e responder à verdade revelada de Deus". Foi por isso que, logo no início deste livro, enfatizamos a importância de ser um líder centrado na Bíblia e liderar a partir dela.

O direito do líder espiritual de influenciar seus seguidores vem da sua habilidade de tornar claro o que ele recebe do Senhor. Muitas vezes, uma frase ou verso destaca-se diante dos nossos olhos e tem um tremendo impacto em nossas vidas. Uma reação positiva a este tipo de teste resulta em um aumento na capacidade do líder de receber, entender e aplicar a verdade de Deus. Como vimos então, apesar de a Palavra de Deus ser a base do direcionamento que o líder recebe do Senhor, ela não é o único meio pelo qual isto ocorre. O líder também recebe direcionamento por aqueles momentos de intimidade, nos quais a pessoa não tem dúvida de que Deus falou com ela. Nesses casos, o líder ouve diretamente de Deus e, posteriormente, embasa isso nas Escrituras: "A intimidade do Senhor é para os que o temem" (Sl 25.14).

Portanto, o teste da Palavra consiste nesta habilidade de ouvir a voz de Deus por meio das perspectivas objetiva e subjetiva. A primeira perspectiva consiste em ouvir a voz de Deus por meio de sua Palavra. A perspectiva subjetiva, quando o líder ouve diretamente a voz de Deus, deve ser ratificada pelo embasamento das Escrituras, porque Deus não contraria sua Palavra. No entanto, esse direcionamento é particular e individualmente dirigido ao líder.

Essa habilidade de receber a Palavra de Deus, de aplicá-la e transmiti-la tem o propósito de desenvolver convicções íntimas, chamar pessoas para o ministério, motivar em direção à visão, encorajar a fé, dar garantias divinas ao líder emergente, que se sente reafirmado ao sentir que Deus, de uma maneira muito pessoal, falou com ele. Assim, o direito do líder de influenciar outras vidas tem por base a sua habilidade de clarificar os ditames de Deus para si mesmo e para as outras pessoas.

Um líder cristão íntegro é sempre caracterizado pelo seu amor pela Palavra de Deus. Ele a estuda não somente para ministrar aos outros, mas para seu próprio crescimento espiritual. A paixão do líder é encarnar a Palavra em sua vida, para que o seu estilo de vida seja uma verdadeira Bíblia aberta.

Um exemplo claro disto na Bíblia é o de Samuel. O jovem Samuel recebeu uma palavra de Deus sobre o julgamento que viria sobre a casa de Eli, e revelou a este o que Deus tinha lhe falado (1Sm 3.10-18). O resultado de sua fidelidade à palavra revelada foi que "o Senhor era com ele, e nenhuma de todas as suas palavras deixou cair em terra. Todo o Israel, desde Dã até Berseba, conheceu que Samuel estava confirmado como profeta do Senhor" (1Sm 3.19-20).

O TESTE DA OBEDIÊNCIA

O princípio que embasa esse teste afirma que obediência primeiro se aprende e depois se ensina. O teste da Palavra consiste em saber receber a Palavra de Deus; já o teste da obediência consiste em responder a ela.

O teste da obediência está intrinsecamente ligado à vida espiritual do líder, que gira em torno de um único e simples tema: submissão. O servo se submete e obedece ao comando do seu senhor.

Em 1Samuel 16.1-13, o profeta encontra-se com os filhos de Jessé em sua busca por um possível rei para Israel. Não podemos saber exatamente o que ele tinha em mente ao buscar um rei naquela localidade coberta de poeira. Uma coisa sabemos: o velho profeta não ungiria ninguém a quem Deus não aprovasse. Talvez todos os filhos de Jessé tivessem aparência de realeza, mas o que somente um deles tinha era a atitude de um líder espiritual. Só um deles tinha a obediente postura de servo. Isso indica que a liderança cristã tem que ser vista sob a ótica dupla de duas lentes. Uma delas é uma lente fraca e menor: a da aparência. A outra é forte e maior: a atitude de obediência. Liderança espiritual é, antes de tudo, uma questão de obediência a Deus e seu chamado.

Em sua prévia escolha de um rei, Samuel encontrara Saul, uma pessoa de boa aparência e conversa convincente. Apesar de Saul não ter sido um bom rei, ele foi um rei necessário. Necessário porque tornou-se o exemplo clássico do que um rei não deveria ser e fazer. Saul era um rei superficial. Mas como definir superficialidade? Superficial vem de duas palavras latinas: super e facia, que significam "sobre a face" ou "valor aparente". Em outras palavras, o que se vê é o que vale. Nada mais sai daquela fonte. Isto é o que Stephen Covey chama de "seguir a ética da personalidade do mundo corporativo. É seguir o símbolo e não a substância".

Uma grande liderança cristã é aquela que, quando tocada, logo se percebe que há mais a descobrir. Davi foi um desses líderes. Ele tinha muito mais substância do que se podia perceber pela sua aparência.

O líder cristão autêntico e bíblico demonstra sua substância em atitudes de obediência, diante dos desafios e testes da vida.

Outro caso clássico de obediência é Abraão. A Bíblia diz em Romanos 4 que Deus lhe fez uma promessa aparentemente impossível, humanamente falando: a ele foi prometida uma grande descendência, a despeito de sua idade e dormência em sua habilidade reprodutiva. Qual foi a sua resposta? Ele creu, esperando, mesmo tendo que lutar contra a esperança e a incredulidade de Sara, sua mulher.

Passado algum tempo, Deus lhe deu um filho, Isaque. Quando o menino estava com seus doze a treze anos, Deus lhe fez o estranho pedido de oferecer o seu filho como sacrifício ao Senhor. Apesar daquela exigência não lhe parecer muito lógica, Abraão obedeceu ao Senhor. Deus estava testando os limites da obediência do seu servo. Quando o teste da obediência foi satisfeito, Deus proveu o substituto para o sacrifício e expandiu o ministério de Abraão, para que ele se tornasse o pai da fé. Assim, de diferentes maneiras, Deus nos põe à prova, embora nem sempre de acordo com a nossa lógica, a fim de testar a nossa resposta aos desafios de fé. Como respondemos a esses testes é o ponto crucial da questão.

Existem alguns tipos de testes que checam a nossa disposição em obedecer a Deus:

• Aprender a respeito do ter e do dar, quando Deus nos pede para investirmos naquilo que não é pão, mas que pertence ao reino;
• Aprender a colocar Deus em primeiro lugar na área sentimental;
• Aprender a desejar ser usado por Deus no ministério;
• Aprender o princípio de que Deus vai nos testando e abençoando em doses crescentes, sendo que aquele que reclama do pouco não irá receber o muito, pois, segundo nos ensina Lucas 16.10, quem é fiel no pouco, também é fiel no muito, e quem é injusto no pouco, também é injusto no muito;
• Aprender a prontidão para confiar em uma verdade divina, quando Deus pode nos pedir para que soframos por ele e permaneçamos firmes, mesmo diante da oposição de muitos;
• Aprender a questão da confissão do erro, como no caso clássico de Pedro, que por três vezes negou Jesus e, também por três vezes, teve de ser restaurado. Deus pode revelar pecados não confessados que precisam ser tratados, se queremos caminhar com Ele e sermos aprovados no teste da obediência.

O TESTE DA CONSCIÊNCIA

Acertar relacionamentos problemáticos e tratar de pecados não confessados tem tanto a ver com o teste da obediência quanto com o teste da consciência. A Bíblia fala sobre consciência boa, consciência pura, consciência limpa, consciência cauterizada e consciência ruim. Mas, afinal, o que é a consciência?

Consciência é a faculdade do nosso espírito que é sensível à verdade como ela é. A consciência é a única área onde não há disfarces ou mentiras, onde não enganamos a nós mesmos. Quanto às demais áreas, nós, muitas vezes, usamos máscaras e tentamos nos enganar. Mas não em nossa consciência, pois ela é sensível à verdade, não aceitando disfarces.

Paulo diz, em 1Timóteo 1.5, que o objetivo dele para seu filho espiritual era que ele tivesse uma consciência boa. A manutenção de uma consciência limpa e boa é, portanto, uma condição indispensável para um líder ter um ministério aprovado e abençoado.

Esse ponto torna-se mais relevante pelo fato de uma consciência boa poder se corromper. A consciência pode deixar de ser boa pelo acúmulo de culpa (Sl 32.2; Tg 1.21) e por usar um padrão não consistente com a Palavra de Deus. O acúmulo de culpa se resolve com a limpeza da consciência pela confissão e aceitação do perdão divino; um padrão não consistente com as Escrituras requer uma decisão radical de transformação e comprometimento com Deus.

Como dissemos acima, há vários tipos de consciência. Uma consciência boa e limpa, por exemplo, é aquela que não nos acusa, que é irrepreensível, embora isso não signifique que a pessoa nunca erre, mas sim que ela não fica sem tratar de seus erros e acertá-los. Assim, a pessoa tem a consciência limpa porque, apesar de haver errado, tratou de seus erros e a sua consciência não mais a acusa.

Um dos muitos pontos negativos em não tratar dos erros não está apenas no fato de que a pessoa perde muito do horizonte de seu ministério, mas também no fato de que ela dá início a um processo que a Bíblia chama de "cauterização da consciência" (1Tm 4.2). O indivíduo que chega a esse terrível estágio torna-se insensível, calejado, não mais tratando de consertar os seus erros, pois não se considera mais afetado por eles.

O objetivo do Senhor é a consciência boa. No ministério, é grande a tentação e facilidade de corrompermos as nossas consciências quando nos envolvemos em situações nas quais somos tentados a encobrir, sublimar ou justificar os erros daqueles que são grandes contribuintes financeiros, ou daqueles que possuem vários membros de sua família na igreja. Isto se dá porque consideramos, erroneamente, que a igreja depende dessas pessoas e que sua saída representaria um grande prejuízo para a comunidade. Na verdade, com frequência ocorre o fato de muitos líderes terem dois pesos e duas medidas, dependendo com quem se está tratando. Nesses casos, mesmo que a nossa consciência ainda não esteja cauterizada, ela já está corrompida.

A consciência também está relacionada com o conceito de perdoar e de ser perdoado. O aprendizado do perdão é sempre um caminho de mão dupla: todos precisamos perdoar e sermos perdoados.

Apesar desta ser uma necessidade humana universal, muitos cristãos têm grande dificuldade em conciliar o perdão gracioso divino com o perdão a si mesmo. Apesar de afirmarem que Deus os perdoou de todos os seus pecados, eles continuam se condenando por erros cometidos no passado. A sua consciência continua acusando-os, e eles vivem o terrível dilema dessa incoerência.

Como saber se temos que purificar a nossa consciência pela prática do perdão? Primeiro, precisamos conferir o espelho de nossa consciência. Cada um de nós deve checar sua própria consciência, buscando lembrar daquelas situações que precisam ser tratadas. Segundo, precisamos conferir o espelho das atitudes dos outros, dos amigos, dos conhecidos que mudaram a maneira como nos tratam. Talvez uma mudança repentina de atitude por parte de outra pessoa para conosco seja uma indicação da necessidade do perdão mútuo.

Nessa purificação da consciência pelo perdão estão envolvidos o arrependimento ou a tristeza, a confissão, a restituição, se houver necessidade, e a mudança. Homens e mulheres de Deus que chegam à celebração não são aqueles que não possuem pecados, mas sim os que são irrepreensíveis, no sentido de que procuram acertar os erros, para que a sua consciência não os acuse.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Superando Testes
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Identifique um teste ou desafio recente que você enfrentou como líder. Como você reagiu? O que aprendeu com essa experiência?',
     'reflexao', null),
    (v_aula_id, 2,
     'Liste três maneiras de se preparar melhor para os testes e desafios futuros.',
     'reflexao', null),
    (v_aula_id, 3,
     'Reflita sobre como Deus o tem moldado através das dificuldades e escreva uma oração agradecendo por esse crescimento.',
     'reflexao', null);
  end if;
end
$migration$;
