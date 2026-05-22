-- =============================================================
-- Curso 05: Olhe para Jesus (Douglas Gonçalves)
-- 7 aulas + 14 reflexões + 70 múltiplas escolha + 280 alternativas
--
-- Conteúdo: síntese de estudo autoral a partir do livro de Douglas
-- Gonçalves "Olhe para Jesus", organizada como material didático
-- interno da comunidade Ekballo Academy. Cada aula sintetiza um
-- capítulo do livro original e remete o leitor à obra completa.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula1 uuid; v_aula2 uuid; v_aula3 uuid; v_aula4 uuid;
  v_aula5 uuid; v_aula6 uuid; v_aula7 uuid;
  v_atv uuid;
  v_next_ordem int;
begin
  -- Próxima ordem disponível na vitrine de cursos
  select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;

  -- Curso
  insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
  values (
    'olhe-para-jesus',
    'Olhe para Jesus',
    'Estudo guiado a partir do livro de Douglas Gonçalves. Sete aulas sobre o objetivo eterno do cristão — tornar-se cada vez mais parecido com Cristo —, passando pela visão de Deus para a sua vida, pelo método bíblico de transformação, pelos inimigos que cegam nossa visão e pelos caminhos da família, da Bíblia e da oração. Cada aula libera a próxima quando todas as questões são respondidas corretamente.',
    null,
    false,
    0,
    v_next_ordem,
    true
  )
  returning id into v_curso_id;

  -- =============================================================
  -- AULAS
  -- =============================================================
  insert into public.aulas (curso_id, titulo, ordem, video_url, conteudo) values

  -- ============= AULA 1 =============
  (v_curso_id, 'Deus quer que você se pareça com Jesus', 1, null,
$A1$Nos Evangelhos, Jesus está quase sempre diante de dois grupos. De um lado, a multidão — larga, volumosa, marcada por dor, doença, fome, opressão. Do outro, os discípulos — um número pequeno de homens e mulheres que o Mestre chamou para perto e a quem ele revelava "os mistérios do Reino" (Mt 13.10-11). Os dois grupos estavam juntos em muitos dos episódios mais conhecidos: no Sermão do Monte, na multiplicação dos pães, nas margens do mar da Galileia. Mas as perguntas que cada grupo trazia para Jesus eram diferentes.

A multidão chegava perguntando: "O que o Senhor pode fazer por mim?" Vinham com filhos atormentados, corpos doentes, finanças quebradas, com a esperança de receber algo de Cristo. Jesus os recebia, tinha compaixão deles (Mt 9.36; 14.14), curava, libertava, multiplicava o pão. Mas, terminado o milagre, a multidão se dispersava — alguns voltavam, a maioria seguia a vida.

Os discípulos faziam outra pergunta. Para entendê-la, é preciso lembrar o que significava se tornar discípulo de um rabino na época de Jesus. As crianças judias começavam, por volta dos cinco anos, na "casa do livro" (bet sefer), decorando a Torá. Os melhores avançavam para a "casa da aprendizagem" (bet midrash), até os dezesseis anos. A imensa maioria voltava para casa para aprender o ofício da família. Apenas os mais inteligentes e dedicados podiam tentar o próximo passo: encontrar um rabino renomado e implorar para ser aceito como discípulo. Era como ser admitido nas melhores universidades de hoje. A maior parte ouvia "não" e voltava para a vida comum.

É nesse pano de fundo que precisamos ouvir Jesus dizendo a pescadores e cobradores de impostos: "Siga-me". Eles não estavam buscando o rabino — o rabino os escolheu. E eles deixaram tudo, imediatamente: emprego, família, casa. Por quê? Porque a pergunta que pulsava em seus corações não era "o que ele pode fazer por mim", mas "como eu posso me tornar como ele?" O discípulo é o aprendiz que olha para o Mestre e quer ser igual.

Por isso, quando Pedro vê Jesus andando sobre as águas, ele clama: "Senhor, manda-me ir ter contigo por sobre as águas" (Mt 14.28). Se o Mestre pode, eu também quero aprender. O discípulo não está em um relacionamento com Cristo por causa dos benefícios que pode tirar dele — esse seria o princípio da idolatria. Está com ele porque o ama, é fascinado por ele, e quer se tornar como ele.

Muitos querem o perdão de Jesus, mas poucos desejam ter a capacidade de perdoar como o Mestre. Muitos querem o amor incondicional que ele oferece, mas nem todos desejam amar como ele amou. Muitos querem os benefícios da cruz; nem todos desejam tomar a sua cruz e segui-lo.

A "altura" do evangelho que cada um conhece tem duas pontas. A primeira é o conhecimento de Deus — sua bondade, sua graça, seu amor escandaloso. A segunda é o reconhecimento do próprio pecado — a clareza de quão merecedor da condenação eterna eu era. A distância entre essas duas verdades é a amplitude do evangelho que conheço. "Aquele que muito foi perdoado, muito ama" (Lc 7.47). Por isso há tantos cristãos mornos: a revelação do quão pecadores são é estreita, então o amor também é pequeno.

Mas o evangelho não termina no perdão dos pecados passados. O "resto do evangelho" — como descrevem alguns autores — é que Jesus não veio só pagar a dívida que era impagável. Ele veio para que sua natureza fosse formada em nós. No momento em que cremos, morremos com Cristo, ressuscitamos com ele e fomos assentados nas regiões celestiais (Ef 2.4-6). O Espírito Santo veio habitar em nós, lidar com nossos pecados do presente e nos selar com a promessa da glorificação futura. Já não somos apenas perdoados — somos transformados.

Pense em filmes ou séries que retratam a vida de Jesus, como "Os Escolhidos". Com qual personagem você se identifica? Raramente alguém responde: "me identifico com Jesus". Quase sempre nos reconhecemos no paralítico, na mulher do fluxo, em Pedro impulsivo, em Mateus que era detestado. Mas todas essas figuras são distorções da identidade original de Deus para a sua vida. Você não foi criado para ser igual ao leproso. Você foi criado para ser semelhante a Jesus (Rm 8.29).

O desejo eterno de Deus é ter uma família de muitos filhos parecidos com o Primogênito. Por isso Paulo chama Cristo de "o último Adão" (1Co 15.45). Cristo é a revelação perfeita de quem Deus é — "a imagem do Deus invisível" (Cl 1.15) — e, ao mesmo tempo, a revelação perfeita de quem nós deveríamos ser. "Fomos criados à imagem de Deus" (Gn 1.26) + "Cristo é a imagem do Deus invisível" (Cl 1.15) = fomos criados para ser como Jesus.

A cruz, portanto, não é o propósito eterno de Deus. Ela é o caminho que nos autoriza a viver novamente esse propósito. Amamos a cruz porque ela cancelou nossa dívida (Cl 2.14) e nos transportou do império das trevas para o Reino do Filho amado (Cl 1.13). Mas o objetivo final continua sendo o de sempre: ter muitos filhos espalhando a imagem do Primogênito por toda a terra (Ef 2.19).

— Síntese de estudo a partir de: Douglas Gonçalves, Olhe para Jesus, capítulo 1. Material didático interno da Ekballo Academy.$A1$),

  -- ============= AULA 2 =============
  (v_curso_id, 'O método de copiar Jesus', 2, null,
$A2$A mensagem que ouvimos em todos os meios de comunicação hoje é simples: "seja autêntico". Filmes, séries e propagandas destacam o personagem que rompe com os padrões e tem coragem de ser ele mesmo. E qual é o método de autenticidade ditado pelo nosso século? Olhe para dentro do seu coração, explore-o, decifre-o e siga-o. Não seja o que seus pais querem, nem o que a sociedade pressiona. Seja o que o seu coração mandar.

Atenção: há veneno nesse conselho. Porque o pecado corrompeu exatamente essa parte da nossa vida — o coração. "Enganoso é o coração, mais do que todas as coisas, e desesperadamente corrupto. Quem poderá entendê-lo?" (Jr 17.9). A nossa bússola está quebrada. Nós não sabemos querer o que é bom.

Em Romanos 1, Paulo descreve um tipo de pessoa que, mesmo tendo contemplado a Deus por meio das coisas criadas (Rm 1.20), não o glorificou e adorou ídolos feitos por suas mãos. E qual é a "punição" descrita no próximo verso? "Por isso, Deus os entregou à impureza, pelos desejos do coração deles, para desonrarem o seu corpo entre si" (Rm 1.24). A grande punição de Deus para a impiedade é exatamente: "seja feito tudo o que o seu coração quer". Não é ser entregue a Satanás — embora o inimigo se aproveite disso. É ser entregue às próprias vontades. Assim se revela a ira de Deus.

Em contrapartida, o autor de Hebreus revela que o Pai celestial, por nos amar tanto, nos disciplina (Hb 12.7-10). O amor de Deus é revelado em seus "nãos" para nossa vida. Ele não nos deixa ser feitos só do que queremos.

E qual é, então, o método de Deus para nos transformar? Para entender, precisamos partir de uma verdade sobre como somos feitos. Em seu livro "O Custo do Discipulado", Jonas Madureira apresenta a "teoria mimética" de René Girard, que diz: nossos desejos nunca são totalmente originais. Eles são sempre mediados por alguém que admiramos. Quando desejo um objeto, é porque acredito que, ao tê-lo, me tornarei mais parecido com alguém que admiro.

As grandes marcas descobriram isso e gastam milhões com influenciadores. Eu quero o tênis que o jogador de futebol usa — não pelo objeto, mas para me parecer com aquele que admiro. Carros, carreiras, estilos de vida — tudo isso opera por mediação. Eu fui criado para ser imagem. Minha vida será sempre organizada para me tornar parecido com aquela pessoa que admiro.

Esse princípio aparece no Salmo 115.4-8: "Os ídolos das nações são prata e ouro, obra de mãos humanas. […] Tornam-se semelhantes a eles os que os fazem, e todos os que neles confiam". Nós nos tornamos como aquilo que adoramos. Pessoas que adoram a Mamom (o dinheiro) tratam relacionamentos como transações; pessoas ao redor delas começam a ter um preço. Adoradores de prazer perdem a capacidade de amar fielmente. Mas o princípio também funciona ao contrário: quando adoramos o Senhor, nos tornamos cada vez mais parecidos com ele.

Em 2Coríntios 3.16-18, Paulo descreve esse processo. Ele lembra do episódio em que Moisés desce do monte e tem o rosto brilhando (Êx 34). Israel, depois, foi para o cativeiro e leu o Antigo Testamento com um véu. "Quando, porém, alguém se converte ao Senhor, o véu é tirado." E o que acontece então? "Todos nós, com o rosto descoberto, contemplando a glória do Senhor, somos transformados, de glória em glória, na sua própria imagem, como pelo Senhor, que é o Espírito."

Aqui está o método: contemplação. Antes da conversão, a Bíblia é apenas um livro antigo com alguma sabedoria. Após a conversão, o Espírito Santo abre nossos olhos e podemos contemplar a glória de Deus em Cristo Jesus. Esse véu, no entanto, só pode ser retirado pela ação de Deus — em Mateus 16, quando Pedro confessa "Tu és o Cristo, Filho do Deus vivo", Jesus afirma que isso não veio de carne e sangue, mas da revelação do Pai.

Aqui está o ponto crucial: a mudança em nossa vida não começa por um adestramento dos nossos comportamentos, mas por uma alteração dos nossos afetos. Não é apenas mudar o que faço, mas por quem sou fascinado. Por isso muitas igrejas produzem falsa transformação:

- **Medo**: alertar sobre o inferno e as maldições do pecado faz alguém abandonar certos hábitos, mas o medo só gera falsa transformação. As pessoas mudam aparência sem mudar coração.
- **Bênçãos**: ensinar que Deus prospera os obedientes faz pessoas se esforçarem em mudar comportamentos para colher bênçãos terrenas e celestiais. Mesmo que essas promessas estejam na Palavra, conhecê-las não é o caminho para Deus gerar transformação.
- **Aceitação**: desde cedo aprendemos a ler o ambiente e ajustar nosso comportamento para ser aceitos por cada grupo. A igreja também tem códigos — fazer longas orações, evitar certos pecados, parecer espiritual. Isso também é falsa transformação.

A verdadeira transformação não é exterior. É a alteração dos afetos, a mudança de "quem você ama de todo o seu coração". Quando contemplo Cristo, descubro o mais belo, o mais digno de fascínio, o mais amável. E ao ser fascinado por ele, naturalmente passo a fazer o que ele faz. "Eu só faço o que eu vejo meu Pai fazer" (Jo 5.19) — essa era a resposta de Jesus. Contemplar o Pai era o que o movia. Cristo é a imagem visível do Deus invisível (Cl 1.15) porque ele é a imagem daquele a quem contempla e por quem é fascinado.

— Síntese de estudo a partir de: Douglas Gonçalves, Olhe para Jesus, capítulo 2.$A2$),

  -- ============= AULA 3 =============
  (v_curso_id, 'Inimigos da visão', 3, null,
$A3$Antes de aprendermos como olhar para Jesus na prática, é preciso identificar tudo o que pode nos impedir de contemplá-lo. O autor chama isso de "inimigos da visão".

Imagine uma viagem em caravana, onde um carro vai à frente e os demais o seguem. Sua missão é simples: seguir o líder. Mas, na prática, é desafiador. Você precisa estar com os olhos fixos no líder e não pode deixar nada se interpor entre vocês — outro carro, um caminhão, qualquer coisa que bloqueie a visão e faça você perder o líder no caminho.

É exatamente isso que pode estar acontecendo entre você e Jesus. Há "carros" e "caminhões" se interpondo na sua visão de Cristo. Vamos examinar os principais.

**1. Ignorância.** O primeiro inimigo é a falta de conhecimento. A maior parte da igreja hoje não sabe qual é o plano eterno de Deus, por isso não vive alinhada a esse propósito. Quando o Senhor revela que nascemos para estar diante dele, conhecê-lo e ser fascinados por ele, podemos reorganizar a vida em torno dessa realidade. Mas ainda há outra forma de ignorância: desconhecer os inimigos que tentam nos afastar do cumprimento desse propósito. É isso que este capítulo busca dissolver.

**2. Pecado.** O pior dos inimigos. A Bíblia trata o pecado em duas dimensões. "O pecado" (singular) é a força interna que herdamos de Adão e que nos arrasta a desobedecer (Rm 5.12; 7.20). Ninguém precisa nos ensinar a pecar. "Os pecados" (plural) são as múltiplas formas que essa força encontra para ocupar o lugar de Deus em nossa vida — os ídolos. João Calvino afirmou: "O coração humano é uma fábrica de ídolos". Quando não adoramos o Criador acima de todas as coisas, vamos adorar alguma coisa criada.

Quais são esses ídolos? O diagnóstico pode ser feito com perguntas simples: O que dá sentido à sua existência? Quem é o seu salvador? Onde está sua esperança? O que você ama acima de tudo? Sua vida perderia o sentido na ausência de que ou de quem? As respostas apontam para seus ídolos. Lembre-se do jovem rico (Mc 10.17-22): Jesus lhe pediu que entregasse seus bens, e ele se foi triste. O pecado (o amor ao dinheiro) o cegou para a beleza do Cristo.

**3. "Agoralatria".** A palavra não existe no dicionário, mas é a melhor descrição de um inimigo poderoso. O deus desta era está nos ensinando a idolatrar o agora. Quais são suas vontades agora? Quais os prazeres disponíveis agora? "Coma tudo o que puder, assista a tudo o que quiser, jogue todos os jogos disponíveis — a hora é AGORA." Esse ídolo tem cegado uma geração inteira para a beleza de Deus, pois o sistema atual dita que tudo o que não tiver recompensa AGORA não tem valor.

Jesus profetizou em Lucas 17.26-27 que os dias da sua volta seriam como os dias de Noé: comiam, bebiam, casavam, davam-se em casamento — todas coisas lícitas, criadas pelo próprio Deus. Por que esse estilo de vida foi condenado? Porque eles não conseguiam ver além do AGORA. Estavam embriagados com a vida cotidiana, vivendo sem considerar o plano eterno de Deus. Viviam um ateísmo prático.

**4. Falta de tempo.** Contemplar Cristo requer uma moeda muito cara: tempo. Orar leva tempo, meditar nas Escrituras leva tempo, ter comunhão verdadeira com a igreja leva tempo. Quando falhamos nessas práticas, usamos a desculpa: "não tenho tempo". Mas todos recebemos a mesma quantidade — 24 horas, 1.440 minutos, 86.400 segundos por dia. A questão é prioridade. Olhe para sua agenda e descubra qual é, de fato, sua prioridade número um.

**5. Preguiça.** Por muito tempo eu acreditava não ser preguiçoso porque trabalhava muito. Mas descobri que preguiça não está apenas relacionada a não fazer nada — é sempre escolher o que é mais fácil. Diante de uma bifurcação entre o que é certo e o que é fácil, o preguiçoso sempre escolhe o fácil. Um homem pode trabalhar quatorze horas em vez de voltar para casa e ajudar os filhos com as tarefas — e, mesmo trabalhando muito, está sendo preguiçoso, porque seu ofício se tornou uma fuga do que é correto. Olhar para Jesus não é tarefa fácil, especialmente no início.

**6. Falsa contemplação.** O inimigo mais sutil e difícil de identificar: a falsa sensação de estar olhando para Jesus. O Senhor encontrou muitas pessoas em seu ministério, mas havia um grupo em particular cego à revelação de Cristo: os religiosos. Achavam que já estavam vendo, mas sua visão estava obstruída por substitutos da contemplação:

- **Ministério**: por servir muito a Deus, podemos achar que estamos crescendo no conhecimento dele. Jesus confrontou Marta exatamente nisso (Lc 10.38-42): ela corria para servi-lo, enquanto Maria sentou aos seus pés. Servir é importante, mas nunca pode vir antes da contemplação.
- **Acúmulo de informações**: estudo teológico é fundamental, mas saber sobre Deus não é o mesmo que conhecer a Deus. Você pode ser o líder do fã-clube oficial de alguém famoso e ter mais dados sobre ele do que os amigos íntimos — mas nunca entrar na casa dele. Acúmulo de informação dá a falsa sensação de intimidade.
- **Ativismo**: estar em todas as reuniões da igreja, fazer cursos, ouvir podcasts. Judas estava com Jesus em quase todos os momentos importantes do ministério, e ainda assim não o conhecia.

A oração que fica é: que o Espírito Santo nos revele quais inimigos estão hoje entre nós e a beleza de Cristo, para que possamos eliminá-los e contemplar a glória do Filho de Deus.

— Síntese de estudo a partir de: Douglas Gonçalves, Olhe para Jesus, capítulo 3.$A3$),

  -- ============= AULA 4 =============
  (v_curso_id, 'Olhe para Jesus em família', 4, null,
$A4$Em uma reunião da igreja caseira, enquanto cantávamos pedindo ao Senhor: "Qual a beleza que há em ti que eu ainda não vi?", eu senti o Espírito Santo falar ao meu interior: "Se você quer me conhecer mais, abra seus olhos, pois eu espalhei partes de quem eu sou em cada pessoa desta sala". Por anos aprendi a contemplar o Senhor sozinho, em meu quarto com a Bíblia aberta — e isso é maravilhoso. Mas existe uma dimensão de Cristo que só pode ser conhecida por meio dos irmãos.

Em Mateus 13.58, lemos sobre Jesus voltando a Nazaré, sua cidade. Ele já havia iniciado seu ministério, pregando, ensinando e curando por todo Israel. Era hora de levar o evangelho do Reino também para a sua terra. As pessoas ouviam suas palavras, admiravam sua sabedoria e autoridade — e, no entanto, lemos: "Ali Jesus não pôde fazer muitos milagres" (Mt 13.58). Como assim, "não pôde"? Ele é Deus encarnado, ele pode todas as coisas. O que estava impedindo os milagres?

A incredulidade gerada pela familiaridade. "Não conhecemos as irmãs e os irmãos dele?" (Mt 13.56), diziam. Em outras palavras: "Não tem como alguém tão comum, tão perto de nós, nos revelar grandezas do Eterno". A proximidade com o Jesus-homem fez aquelas pessoas perderem a revelação do Deus encarnado.

Isso pode estar acontecendo com você hoje. As pessoas que você vê todos os dias, que nasceram de novo e são habitação do Espírito Santo, são parcela da revelação de quem Jesus é — mas você não consegue percebê-las. Elas são "comuns demais" para você. A familiaridade está cegando seus olhos para a parte de Cristo revelada no seu irmão.

Em Efésios 3.16-19, Paulo ora pelos efésios. Pede que sejam fortalecidos no íntimo pelo Espírito, que Cristo habite pela fé em seus corações. Mas para quê? "Assim, vocês perceberão, com todos os santos, qual é a largura, o comprimento, a altura e a profundidade do amor de Cristo e conhecerão esse amor que excede todo conhecimento, para que sejam cheios da plenitude de Deus".

Repare na expressão "com todos os santos". Se você e eu conhecêssemos a plenitude do amor de Deus, seríamos perfeitos. Por isso experimentamos tão pouco disso — porque ignoramos o "com todos os santos". Tentamos conhecer Cristo sozinhos. A familiaridade nos torna cegos à revelação de Cristo estampada neles.

A história de Saulo (Atos 9) confirma essa verdade. Saulo perseguia a igreja quando Jesus lhe apareceu na luz gloriosa. Mas observe a pergunta de Cristo: "Saulo, Saulo, por que me persegues?" Jesus não disse "por que persegue minha igreja?" Ele disse "por que me persegues a mim?". Jesus e sua igreja são um. Rejeitar a igreja é rejeitar Cristo. Amar a igreja é amar Cristo. Trabalhar com a igreja é trabalhar com Cristo.

Por isso, o autor encoraja: "Quem o Pai deu a você como irmão? Para quem o Pai deu a sua vida como irmão?" Esse é o verdadeiro conceito de irmão e irmã. Nós escolhemos muitos relacionamentos — cônjuge, amigos, empregados, patrão. Mas a relação humana que Deus escolheu para descrever as pessoas na igreja foi a de "irmãos", e estes nós não escolhemos. Para enxergar Cristo na igreja, é necessário fazer uma aliança com aqueles que Deus nos deu. Aliança significa não abandoná-los por qualquer motivo banal. Permanecer na doença e na saúde, na tristeza e na alegria, nos momentos de bonança e nos de escassez.

A cena do chamado de Mateus aparece em três Evangelhos. Marcos enfatiza a família de origem ("Levi, filho de Alfeu"); Lucas enfatiza a profissão ("um publicano, chamado Levi"); mas Mateus, ao relatar sua própria conversão, escreve: "Jesus viu um homem chamado Mateus" (Mt 9.9). Lembre-se: Mateus era seu novo nome dado pelo próprio Cristo, e significa "presente de Deus". Mateus está dizendo: "Naquele dia, Jesus não viu meu passado, minha profissão, meu pecado, minha traição. Ele viu Mateus, o presente de Deus".

Eu quero os olhos de Jesus para enxergar meus irmãos. Não quero meus olhos contaminados pelo pecado, que só veem as falhas, me impedindo de ver a obra de Cristo neles. Peço a Deus que me dê seus olhos para enxergar seus desígnios eternos nas pessoas que ele colocou ao meu redor — para reconhecer em cada uma a parte de Jesus que ela carrega.

— Síntese de estudo a partir de: Douglas Gonçalves, Olhe para Jesus, capítulo 4.$A4$),

  -- ============= AULA 5 =============
  (v_curso_id, 'Olhe para Jesus na Bíblia', 5, null,
$A5$João começa seu Evangelho com uma constatação impressionante: "No princípio era a Palavra, e a Palavra estava com Deus, e a Palavra era Deus. […] Aquele que é a Palavra tornou-se carne e viveu entre nós" (Jo 1.1,14). Jesus é o Verbo encarnado (Ap 19.13) — a Palavra de Deus, que deu origem e sustenta todas as coisas (Cl 1.16), envolta em carne. Portanto, olhar para Jesus é olhar para a Palavra de Deus, e conhecer a Palavra de Deus é conhecer Jesus.

A forma mais clara e confiável de contemplarmos Jesus é por meio da Bíblia. De Gênesis a Apocalipse, podemos mergulhar no conhecimento do Filho do Homem e nos deleitar em sua beleza fascinante. Que privilégio temos hoje — Bíblias em múltiplas traduções, aplicativos, áudio, ferramentas de estudo, mestres levantados para nos ajudar. Qual será a nossa desculpa diante de Deus?

Por muito tempo eu olhei para a Bíblia como um compilado de regras a serem obedecidas para entrar no Céu. Esse é o engano da religiosidade — a mesma mentira que a serpente contou a Eva: "se você fizer X, vai se tornar Y". Ninguém se torna filho porque faz algo certo, nem deixa de sê-lo por fazer algo errado. Para ser filho, é preciso nascer de novo (Jo 3.3). E só nos tornamos filhos pela graça do Pai, acessada pela fé em Cristo (Jo 1.12; Ef 2.8).

Então, o que é a Lei de Deus espalhada por toda a Bíblia? Não é uma lista de pré-requisitos para virar filho — é o código genético dos filhos de Deus. Imagine um livro que descreve como um cachorro se comporta: late, levanta a pata para urinar, anda em quatro patas, usa o nariz para se localizar. Você não interpretaria esse livro como uma lista de mandamentos a obedecer para se tornar cachorro. Você o leria como a descrição da natureza dos cachorros.

Da mesma forma, os Dez Mandamentos descrevem como vivem os nascidos de novo. O Sermão do Monte revela o estilo de vida dos discípulos de Cristo. É impossível viver a Bíblia pela própria força — só na natureza de Cristo em nós (Rm 8.9) podemos abraçar essa realidade. Por isso Jesus é o código genético encarnado. A Palavra o descreve perfeitamente porque ele é o Filho perfeito de Deus.

Em Lucas 24, dois discípulos voltam para Emaús depois da crucificação, tristes, decepcionados. Jesus se aproxima — eles não o reconhecem. Quando expõem sua frustração, Jesus os repreende: "Como vocês custam a entender e como são lentos para crer em tudo o que os profetas falaram! Não devia o Cristo sofrer estas coisas e entrar na sua glória?" E começou em Moisés, prosseguiu por todos os profetas, e explicou o que constava a respeito dele em todas as Escrituras (Lc 24.25-27). Mais tarde, os discípulos diriam: "Não ardia o nosso coração enquanto ele nos falava no caminho e nos explicava as Escrituras?" (Lc 24.32).

De Gênesis a Apocalipse, é possível encontrar a beleza da redenção em Cristo (Gl 3.8,16; Ap 1.1). Toda a Bíblia revela Jesus. Por isso, precisamos abrir as Escrituras procurando contemplar Cristo em cada livro.

Jesus mesmo "sangrava Bíblia". Aos doze anos, ele já tinha conhecimento bíblico suficiente para sentar com mestres e fazer perguntas e respostas (Lc 2.46-47). Mais tarde, na cruz, sob a maior pressão imaginável, o que saiu dele? "Meu Deus, meu Deus, por que me abandonaste?" — citando o Salmo 22.1. "Pai, em tuas mãos entrego o meu espírito" — citando o Salmo 31.5. Quando você é espremido, pressionado, apertado pela vida, o que sai do seu interior? Aquilo que está em abundância dentro de você. Seja cheio da Palavra de Deus.

Mas há quatro grandes perigos para quem não se aprofunda nas Escrituras:

**1. Criar seu próprio Jesus.** Sem o empenho real de conhecer a Palavra, todos correm o risco de fabricar um ídolo e o chamá-lo de "Jesus". "Eu não acho que Jesus enviaria pessoas para o inferno." "Eu acho que Deus..." Quando o assunto é o conhecimento de Deus, não cabem expressões como "eu acho" — o que pode ser aprendido da parte de Deus foi revelado por ele mesmo em sua Palavra.

**2. Ser enganado.** Em Mateus 24-25, no Sermão Escatológico, Jesus revela sinais dos últimos dias — guerras, catástrofes, doenças, perseguição. Mas a evidência mais citada por ele é: "Cuidado, que ninguém os engane. Pois muitos virão em meu nome, dizendo: 'Eu sou o Cristo', e enganarão a muitos" (Mt 24.4-5). No fim dos tempos, muitos serão enganados — porque não conhecem a Palavra.

**3. Superficialidade.** Hernandes Dias Lopes disse: "A igreja brasileira é como um lago com quilômetros de largura e centímetros de profundidade". Nossa geração tem muitas informações sobre tudo e profundidade em quase nada. Quem cava raso é destruído por qualquer vento, onda, tempestade (Mt 7.26-27).

**4. Sucesso inútil.** Francis Chan disse: "Pior do que fracassar na vida é ter sucesso naquilo que é eternamente inútil". Quantas pessoas estão perdendo a saúde na tentativa de construir uma vida que o Senhor declara irrelevante? A Bíblia responde a duas perguntas fundamentais: "Quem é Deus?" e "Qual é a sua vontade para minha vida?". Sua eternidade depende dessas respostas.

Dicas práticas para ler a Bíblia: (1) reconheça suas duas naturezas, humana e divina; (2) leia grandes porções de uma vez; (3) leia uma Bíblia sem comentários, depois confira com bons comentários; (4) use várias versões; (5) deixe a Bíblia ler você — meditação requer tempo e atenção; (6) coloque em prática (Jo 4.34); (7) papel e caneta na mão, registre o que o Espírito está lhe ensinando.

— Síntese de estudo a partir de: Douglas Gonçalves, Olhe para Jesus, capítulo 5.$A5$),

  -- ============= AULA 6 =============
  (v_curso_id, 'Olhe para Jesus na oração', 6, null,
$A6$"É mais difícil orar do que pregar", disse John Piper. "Muitas vezes preguei mal, mas nunca esqueci que estava pregando no meio de uma mensagem. Porém, com frequência, esqueço que estou orando em meio à oração."

Está cada vez mais difícil orar. Em um mundo que nos hiperestimula, parece cada vez mais desafiador parar, fechar os olhos e se concentrar em Deus. Quantos pensamentos puxam nossa mente para fora desse lugar de comunhão? Precisamos urgentemente mudar nossos hábitos para cultivar uma vida de oração.

Se quisermos olhar para Jesus e ser fascinados por ele, não há outro caminho que não seja um relacionamento vivo e vibrante com o Senhor. E nesse processo relacional, o principal fator que nos permite conhecer alguém e aprofundar o relacionamento é, sem dúvida, o ato de conversar. Conexão se constrói falando e ouvindo.

Imagine reencontrar um amigo da escola, com quem tinha uma amizade sólida, mas que depois seguiu por outro caminho. A sensação é estranha — uma mistura da lembrança da intimidade vivida no passado e a incerteza do relacionamento no presente. Sem profundidade no relacionamento sem conversas constantes.

Portanto, não me diga que conhece Jesus se você não fala com ele constantemente. O caminho para uma vida de contemplação de Cristo passa pela oração. Orar é crescer em intimidade com Deus, é conhecer mais o nosso Criador, é ficar cada dia mais fascinado por sua beleza.

Jesus morreu para abrir o caminho de volta ao trono da graça (Hb 4.16). A cruz foi o preço pago para nos devolver ao propósito eterno de Deus (Ef 1.3-5). Por isso, não desenvolver uma vida de oração é desperdiçar o sacrifício de Jesus.

A pergunta que fica é: como orar? Permita-me começar por "como não orar".

**Não ore como um hipócrita** (Mt 6.5). Jesus chama os religiosos da época de "sepulcros caiados" — aparência exterior de piedade, mas por dentro arrogância e iniquidade (Mt 23.27). A palavra "hipócrita" se refere aos atores da época, que atuavam usando máscaras. O Mestre estava dizendo que a vida de oração desses homens era, na verdade, uma atuação. Jesus não está condenando esses homens por orarem pouco tempo, por usarem as palavras erradas ou por não se ajoelharem. Sua desaprovação tem outro foco: a denúncia está na palavra "para". A distorção dos hipócritas estava na motivação para orar — orar como os religiosos é não ter o relacionamento com Deus como foco, mas uma agenda pessoal escondida. Eles idolatravam a reputação diante dos homens; a oração era a forma de conseguir o que sua carne desejava.

**Não ore como um pagão** (Mt 6.7). No contexto de Jesus, os pagãos eram pessoas que oravam muito, principalmente porque tinham mais de um deus como alvo de sua oração. Havia temporadas em que oravam ao deus da chuva; outras épocas, à deusa da fertilidade; em outros momentos, ao deus da colheita. Para essas pessoas, a oração era a forma de convencer um deus a dar-lhes alguma coisa de que tinham necessidade. Para os pagãos, Deus era como o dono de um restaurante: não tem compromisso em saciar sua fome, apenas quer vender seu serviço. Para comer, você não pode confiar na bondade dele, mas sim descobrir qual o preço que você precisa pagar.

Atenção! Não ore tentando convencer Deus a lhe abençoar. A oração é um relacionamento de comunhão com Deus — e não uma moeda de troca.

**Ore como filho.** O antídoto que Jesus apresenta aos seus discípulos para a falsa oração é: "O Pai de vocês sabe o que vocês precisam, antes mesmo de lhe pedirem" (Mt 6.8). Jesus está nos ensinando que não devemos orar como os pagãos, tentando convencer Deus a nos abençoar; devemos orar como filhos, com a certeza de que o Pai nos ama e conhece todas as nossas necessidades.

Quantas vezes você ficou frustrado porque sua oração não "funcionou"? O que significa "a oração funcionar" para você? Por ser um Pai de amor, ele não responderá muitos de nossos desejos. Um Pai que dá tudo o que um filho pede não o ama, pois, de fato, não sabemos pedir, e muitas coisas que pedimos, na realidade, podem destruir nossa vida.

**Oração é intimidade.** Jesus convida no Sermão do Monte: "Mas, ao orar, entre no seu quarto e, fechada a porta, ore ao seu Pai, que está em secreto" (Mt 6.6). O quarto é o lugar da casa onde apenas os mais íntimos entram. Pessoas estranhas podem visitar nossa cozinha, mas no quarto apenas os íntimos entram. Ele está nos chamando para o lugar onde o objetivo é somente um: desenvolver um relacionamento pessoal com ele.

Ninguém nunca ganhou o prêmio Nobel por aquilo que faz no quarto, com a porta fechada. As recompensas deste mundo são dadas por aquilo que fazemos em público. Você consegue orar quando não tem nenhuma recompensa visível envolvida, apenas a intimidade?

**Orar é conversar.** Quando os discípulos perceberam o quanto Jesus orava, fizeram um pedido a ele: "Ensina-nos a orar" (Lc 11.1). Sua resposta foi simples. Quando vocês forem orar, lembrem-se, a oração é uma conversa com o Pai. Não é necessário nenhum protocolo, tampouco sacrifícios exuberantes; apenas o coração de um filho que sabe que é amado por Deus. Quanto mais simples forem as palavras, melhor.

**Ore a Palavra de Deus.** "Pedem e não recebem, porque pedem mal, para esbanjarem em seus prazeres" (Tg 4.3). Tiago nos ensina por que muitas das nossas orações não são respondidas: é porque elas são expressões de nossas vontades, e não da vontade de Deus. Orar é falar para Deus a vontade de Deus. Por isso, a única forma de orar corretamente é orar com base na Palavra de Deus. Quando você lê as Escrituras, é Deus falando com você; quando você ora, é você respondendo para Deus. Oração e Bíblia precisam funcionar juntas.

— Síntese de estudo a partir de: Douglas Gonçalves, Olhe para Jesus, capítulo 6.$A6$),

  -- ============= AULA 7 =============
  (v_curso_id, 'Olhe para a humildade, santidade e identidade de Jesus', 7, null,
$A7$Neste último capítulo, o autor escolheu três características de Cristo que o fascinam e que deseja manifestar em sua vida — três fendas para contemplar a beleza de Jesus na prática.

Antes de avançarmos, é preciso lembrar a parábola do semeador (Mc 4.1-9). Cristo descreve quatro tipos de solo — quatro tipos de pessoa que ouvem a Palavra:

- **À beira do caminho — os distraídos.** A Palavra cai num solo tão pisado e endurecido que não consegue penetrar e logo é roubada.
- **Solo rochoso — os apressados.** A semente cai e germina, mas não há profundidade. Por falta de raiz, secam diante das provações.
- **Entre os espinhos — os divididos.** Recebem a Palavra, mas amam também as riquezas e preocupações desta vida. Querem Jesus, mas não exclusivamente.
- **Boa terra — os frutíferos.** Recebem a Palavra sem distração, sem pressa e sem amores rivais. Dão fruto a trinta, sessenta, cem por um.

Frutificar é ser cada dia mais parecido com Jesus. Fruto é aquilo que a árvore produz como consequência natural de quem ela é.

**1. Olhe para a HUMILDADE de Jesus.** Em João 13, antes da Páscoa, Jesus se levanta, tira a vestimenta, pega uma toalha, uma bacia, se abaixa e lava os pés dos discípulos. O Rei lavando os pés dos súditos. O Criador tocando a sujeira das criaturas. O Deus encarnado fazendo o papel de escravo. O constrangimento toma conta do ambiente.

Mas o que é humildade? A maioria aprendeu que humildade é pensar menos de si mesmo. Mas Jesus declarava: "Eu Sou o Caminho, a Verdade e a Vida". Ele tinha plena consciência de sua grandeza. Humildade também não é sinônimo de pobreza, pois o dono do Universo é a pessoa mais humilde que existe. Humildade é não viver para si mesmo, a fim de glorificar a Deus e servir ao próximo. É pensar menos em si para abençoar os outros. Jesus não era humilde porque se considerava pequeno, mas por usar sua grandeza para glorificar o Pai e servir ao mundo.

Há alguns anos, meus pais foram para os Estados Unidos pregar e voltaram com várias encomendas para amigos. Quando perguntei à minha mãe: "Mãe, o que você comprou para você?", ela respondeu: "Nada, esqueci das minhas coisas". Isso é humildade. Andar pela vida com uma lista que não contém o seu próprio nome. Jesus veio à Terra com uma lista que continha o seu e o meu nome. Ele entregou toda a sua vida para encontrar cada um dessa lista.

A tentação no deserto (Mt 4) ilustra essa humildade. Satanás propôs a Jesus transformar pedras em pão. Que tipo de tentação é essa? "Use o poder de Deus, use suas habilidades, use seus recursos para o próprio benefício. Viva para você." Jesus não caiu, porque tinha a clareza de que o Pai era a sua satisfação, e por isso vivia para amar o próximo.

**2. Olhe para a SANTIDADE de Jesus.** Em João 4, Jesus está com a mulher samaritana no poço. Quando os discípulos voltam, estranham vê-lo conversando com uma mulher — e ainda por cima, samaritana. Por causa da visão de santidade que tinham, achavam que aquela aproximação contaminaria Jesus.

Mas Cristo eleva a ideia de santidade. A palavra hebraica é kadosh — "consagrado" ou "separado". Quando lemos sobre os objetos do tabernáculo, vemos que eles eram chamados de santos não porque eram perfeitos, mas porque foram separados para uso exclusivo de Deus. Santidade não está condicionada à perfeição, mas à consagração ao Senhor.

A santidade não se resume "apenas" em abandonarmos o pecado, mas em consagrarmos nossa vida para uso exclusivo de Deus. Antes de sermos separados do pecado, precisamos ser separados para Deus. Pecado não é apenas fazer o que Deus reprova, mas também não fazer o que Deus aprova. Santidade não é só não roubar — é ser generoso. Não é só não mentir — é falar a verdade em amor. Não é só não cometer adultério — é amar nossas esposas como Cristo amou a igreja.

Quando Jesus disse "Minha comida consiste em fazer a vontade daquele que me enviou" (Jo 4.34), revelou que aquilo que o alimentava — produzia vida e satisfação nele — era fazer a vontade do Pai.

Oração de santidade (faça todas as manhãs, com as mãos sobre cada parte mencionada):
- Mente: "Senhor, consagro minha mente. Que tudo o que eu pensar, sentir e desejar seja para tua glória."
- Olhos: "Consagro meus olhos a ti. Quero olhar para onde estás olhando. Quero ter a pureza de Cristo em meus olhos."
- Ouvidos: "Consagro meus ouvidos. Que tudo o que eu ouvir seja filtrado pelo teu Santo Espírito."
- Boca: "Consagro minha boca. Que tudo o que eu falar agrade ao teu coração."
- Coração: "Consagro meu coração. Tu és o dono das minhas afeições. Que todos os amores rivais sejam destronados."

**3. Olhe para a IDENTIDADE de Jesus.** Em João 8, os fariseus contestam o testemunho de Jesus sobre si mesmo. Sua resposta é poderosa: "Sei de onde vim e para onde vou" (Jo 8.14). Cristo afirma que a identidade de uma pessoa é composta por duas verdades: número um, de onde ela veio (origem); número dois, para onde ela vai (destino).

Você saberia responder essas duas perguntas? Jesus vivia na segurança de sua identidade por ter total clareza dessas duas respostas. Ele veio do céu (origem), e seu destino era fazer a vontade do Pai. Por isso sabia que voltaria ao céu, depois de passar pela cruz (At 1.9).

Até o documento de identidade civil reconhece isso: nele estão os nomes dos pais (origem) e o seu próprio nome (destino, no sentido bíblico). Para saber quem você é, é necessário saber de onde você vem.

Se você que está lendo este livro já colocou sua fé em Cristo Jesus (Jo 1.12), fez uma aliança com Deus e recebeu o Espírito Santo (Jo 20.22), você nasceu de novo (Jo 3.3). Esse novo nascimento é da água e do Espírito (Jo 3.5-6); você é uma nova criação (2Co 5.17) e tornou-se coparticipante da natureza divina (2Pe 1.4).

Como uma nova certidão de nascimento na qual o campo "local de origem" indica "Céu". Se pudéssemos ter um novo documento de identidade, no campo "filiação" estaria escrito: Deus.

Ao olhar para Jesus, precisamos aprender que o céu não é o nosso destino, mas a nossa origem (Fp 3.20). O céu não é o prêmio que receberemos se andarmos em santidade. **Santidade é a natureza daqueles que vieram do céu.**

Na Bíblia, o nome de uma pessoa apontava para seu destino. Esse é o motivo de alguns nomes terem sido trocados pelo Senhor. Abrão tornou-se Abraão. Sarai foi chamada de Sara. Jacó recebeu um novo nome: Israel. Jesus mudou o nome de Levi para Mateus. Simão tornou-se Pedro.

Qual é o destino daqueles que estão em Cristo? O mesmo destino de Jesus: passar pela cruz e voltar para o Pai. Por isso, ele afirma: "Se alguém quer vir após mim, negue a si mesmo, tome a sua cruz e siga-me" (Mt 16.24). Nosso destino é nos entregarmos para a glória de Deus; é morrermos para nós mesmos, para abraçarmos a vida de Cristo.

Por que as pessoas estão cada vez mais perdidas na vaidade dos seus pensamentos? Porque foram ensinadas a construir sua vida na tentativa de salvá-la. Conforto e proteção se tornaram ídolos do nosso tempo. Só existe uma forma de encontrar a vida: OLHAR PARA JESUS.

— Síntese de estudo a partir de: Douglas Gonçalves, Olhe para Jesus, capítulo 7.$A7$);

  -- Captura dos IDs das aulas
  select id into v_aula1 from public.aulas where curso_id = v_curso_id and ordem = 1;
  select id into v_aula2 from public.aulas where curso_id = v_curso_id and ordem = 2;
  select id into v_aula3 from public.aulas where curso_id = v_curso_id and ordem = 3;
  select id into v_aula4 from public.aulas where curso_id = v_curso_id and ordem = 4;
  select id into v_aula5 from public.aulas where curso_id = v_curso_id and ordem = 5;
  select id into v_aula6 from public.aulas where curso_id = v_curso_id and ordem = 6;
  select id into v_aula7 from public.aulas where curso_id = v_curso_id and ordem = 7;

  -- =============================================================
  -- REFLEXÕES (2 por aula, ordens 1 e 2)
  -- Aproveitamos as "Perguntas para discussão" do próprio livro.
  -- =============================================================
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  -- A1
  (v_aula1, 1, 'Você tem se relacionado com Jesus mais como parte da multidão ou como discípulo? O que suas orações e expectativas revelam sobre sua motivação ao segui-lo?', 'reflexao', null),
  (v_aula1, 2, 'Qual é a pergunta que mais define sua jornada com Jesus hoje: "O que o Senhor pode fazer por mim?" ou "Como posso me tornar como o Senhor?"', 'reflexao', null),
  -- A2
  (v_aula2, 1, 'Qual é a diferença entre seguir os desejos do seu coração e seguir a Cristo? Você já tomou decisões baseadas no que sentia ser certo e depois percebeu que estava enganado?', 'reflexao', null),
  (v_aula2, 2, 'Quem ou o que você tem contemplado com mais frequência? Quais "ídolos sutis" da nossa cultura podem estar moldando seus afetos e comportamentos sem que você perceba?', 'reflexao', null),
  -- A3
  (v_aula3, 1, 'O que hoje tem se colocado entre você e uma visão clara de Jesus? Você consegue identificar quais "inimigos da visão" estão mais presentes na sua rotina: ignorância, pecado, agoralatria, falta de tempo, preguiça ou falsa contemplação?', 'reflexao', null),
  (v_aula3, 2, 'Sua agenda revela que Jesus é sua prioridade? O que a forma como você administra seu tempo revela sobre seus amores e prioridades?', 'reflexao', null),
  -- A4
  (v_aula4, 1, 'Você consegue enxergar a beleza de Cristo nas pessoas com quem convive? A familiaridade tem cegado seus olhos para a revelação de Jesus nos seus irmãos?', 'reflexao', null),
  (v_aula4, 2, 'Como você reage diante de conflitos ou frustrações com irmãos da fé? Você tem vivido uma aliança de permanência ou trocando de relacionamentos quando as coisas ficam difíceis?', 'reflexao', null),
  -- A5
  (v_aula5, 1, 'Você lê a Bíblia com o objetivo de conhecer Cristo, ou apenas como um manual de instruções? Qual foi a última vez que você viu algo sobre Jesus nas Escrituras que o deixou fascinado ou constrangido?', 'reflexao', null),
  (v_aula5, 2, 'O que hoje impede você de se dedicar com mais profundidade ao estudo da Palavra de Deus — distração, pressa, falta de direção ou desânimo? Como sua rotina poderia ser reorganizada para valorizar mais o tempo com a Escritura?', 'reflexao', null),
  -- A6
  (v_aula6, 1, 'Qual tem sido sua maior dificuldade para manter uma vida constante de oração — distração, falta de tempo, desânimo ou motivação errada? Como você poderia reorganizar sua rotina (ou seu coração) para buscar mais o Senhor no lugar secreto?', 'reflexao', null),
  (v_aula6, 2, 'Quando você ora, qual é geralmente sua motivação: amor e intimidade com o Pai ou a esperança de receber algo? Você já percebeu em si o padrão dos hipócritas (orar para ser visto) ou dos pagãos (orar para "comprar" bênçãos)?', 'reflexao', null),
  -- A7
  (v_aula7, 1, 'Em quais áreas da sua vida você percebe que ainda tem vivido "com seu nome na lista"? Como seria viver esta semana com uma lista que não inclui seus interesses e desejos?', 'reflexao', null),
  (v_aula7, 2, 'Você consegue afirmar com convicção de onde veio e para onde está indo, como Jesus fez? O que tem moldado a sua identidade: o que Deus diz ou o que as pessoas dizem?', 'reflexao', null);

  -- =============================================================
  -- MÚLTIPLAS ESCOLHA (10 por aula, ordens 3 a 12)
  -- =============================================================

  -- ===== AULA 1 (MCs ordens 3-12) =====

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 3, 'Quais eram os dois grupos diante de Jesus, com frequência, nos Evangelhos?', 'multipla_escolha',
   'Os Evangelhos descrevem Jesus com frequência diante de dois grupos: a multidão (larga e volumosa, focada em receber benefícios) e os discípulos (menor, focado em ser como o Mestre).')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Os fariseus e os saduceus', false),
  (v_atv, 2, 'A multidão e os discípulos', true),
  (v_atv, 3, 'Os judeus e os gentios', false),
  (v_atv, 4, 'Os romanos e os escribas', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 4, 'Qual era a pergunta característica da multidão?', 'multipla_escolha',
   'A multidão vinha em busca de cura, libertação, prosperidade — tudo focado em "o que Jesus pode me dar".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, '"Quem é esse homem?"', false),
  (v_atv, 2, '"Como posso me tornar como o Senhor?"', false),
  (v_atv, 3, '"O que o Senhor pode fazer por mim?"', true),
  (v_atv, 4, '"Quando virá o Reino?"', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 5, 'Qual era a pergunta característica do discípulo?', 'multipla_escolha',
   'A palavra "discípulo" tem o mesmo sentido de "aprendiz". O discípulo não quer apenas o que o Mestre pode dar — quer aprender a ser como ele.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, '"O que o Senhor pode fazer por mim?"', false),
  (v_atv, 2, '"Quanto custa seguir o Senhor?"', false),
  (v_atv, 3, '"Quando o Reino virá?"', false),
  (v_atv, 4, '"Como eu posso me tornar como o Senhor?"', true);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 6, 'Como era o caminho até se tornar discípulo de um rabino na época de Jesus?', 'multipla_escolha',
   'As crianças estudavam Torá na bet sefer (5-12 anos), alguns avançavam à bet midrash (até 16); poucos procuravam um rabino e suplicavam para serem aceitos. Era como ser admitido nas melhores universidades. A maioria voltava para a profissão da família.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Bastava se aproximar do rabino e pagar uma taxa', false),
  (v_atv, 2, 'Era um processo educacional rigoroso e seletivo (bet sefer, bet midrash) — só os melhores eram aceitos', true),
  (v_atv, 3, 'Os pais escolhiam pelo filho ainda criança', false),
  (v_atv, 4, 'Era hereditário — só filhos de rabinos podiam ser discípulos', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 7, 'Por que o autor diz que os discípulos não seguiam Cristo por causa dos benefícios?', 'multipla_escolha',
   'O autor afirma: "Os discípulos não estão em um relacionamento com Cristo pelos benefícios que podem receber dele, que é o princípio da idolatria. E porque o amam e estão fascinados por ele, seus seguidores são tomados pelo desejo de se tornarem como ele".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque a multidão já havia recebido todos os benefícios', false),
  (v_atv, 2, 'Porque buscar Cristo por benefícios é princípio da idolatria — eles o amavam e queriam ser como ele', true),
  (v_atv, 3, 'Porque os discípulos eram ricos e não precisavam de nada', false),
  (v_atv, 4, 'Porque eles ainda não tinham fé para pedir milagres', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 8, 'Segundo o autor, qual é a "amplitude do evangelho" que conhecemos?', 'multipla_escolha',
   'A amplitude do evangelho é a distância entre duas verdades: o conhecimento de Deus (sua bondade, graça, santidade) e o reconhecimento do próprio pecado. "Quem muito foi perdoado muito ama" (Lc 7.47).')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'A quantidade de versículos bíblicos memorizados', false),
  (v_atv, 2, 'A distância entre o conhecimento de Deus e o reconhecimento do próprio pecado', true),
  (v_atv, 3, 'O tempo de igreja que a pessoa tem', false),
  (v_atv, 4, 'A intensidade da emoção sentida no momento da conversão', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 9, 'O que é "o resto do evangelho", segundo o autor?', 'multipla_escolha',
   'O evangelho não termina no perdão dos pecados passados — ele continua resolvendo os pecados do presente (Espírito Santo nos santificando) e nos preparando para a glorificação futura.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Apenas perdoar pecados do passado', false),
  (v_atv, 2, 'Lidar com os pecados do presente e futuro, por meio da habitação do Espírito Santo', true),
  (v_atv, 3, 'Eliminar todo sofrimento desta vida', false),
  (v_atv, 4, 'Garantir prosperidade material aos cristãos', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 10, 'Por que dificilmente alguém se identifica com Jesus ao assistir filmes sobre sua vida (como "Os Escolhidos")?', 'multipla_escolha',
   'Quase sempre nos identificamos com o paralítico, o cobrador de impostos ou o discípulo de personalidade forte — mas o autor afirma que esses personagens são "distorções da identidade original de Deus" para nossa vida. Fomos criados para nos parecer com Jesus.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque Jesus é divino e nós não podemos imitá-lo', false),
  (v_atv, 2, 'Porque vivemos distorcidos pelo pecado e nos vemos nos personagens errados, mas Deus nos criou para sermos como Cristo', true),
  (v_atv, 3, 'Porque os filmes mostram Jesus de forma inacessível', false),
  (v_atv, 4, 'Porque os outros personagens são mais interessantes', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 11, 'Qual texto bíblico expressa o propósito eterno de Deus de ter "muitos filhos parecidos com o Primogênito"?', 'multipla_escolha',
   'Em Romanos 8.29, Paulo afirma que Deus "predestinou para serem conformes à imagem de seu Filho, a fim de que ele seja o primogênito entre muitos irmãos".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'João 3.16', false),
  (v_atv, 2, 'Romanos 8.29', true),
  (v_atv, 3, 'Salmo 23.1', false),
  (v_atv, 4, 'Apocalipse 21.4', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 12, 'Para o autor, qual o papel da cruz no plano eterno de Deus?', 'multipla_escolha',
   'O autor afirma: "A cruz não é o propósito eterno de Deus, mas sim o caminho que nos autoriza a viver novamente esse propósito" — uma família de muitos filhos parecidos com Jesus (Ef 2.19).')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'É o ponto final do plano eterno — o objetivo último de Deus', false),
  (v_atv, 2, 'É o caminho que nos autoriza a voltar a viver o propósito eterno: ser uma família de muitos filhos parecidos com Jesus', true),
  (v_atv, 3, 'É algo opcional para os mais maduros', false),
  (v_atv, 4, 'Substituiu o propósito original de Deus', false);

  -- ===== AULA 2 (MCs ordens 3-12) =====

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 3, 'Qual é a mensagem que o século atual está ditando para a transformação pessoal, segundo o autor?', 'multipla_escolha',
   'O autor identifica como mensagem da nossa era: "seja autêntico, olhe para dentro do seu coração, decifre-o e siga-o". Mas alerta que há veneno nesse conselho — o pecado corrompeu exatamente essa parte da nossa vida.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, '"Submeta-se à tradição da sua família"', false),
  (v_atv, 2, '"Olhe para dentro do seu coração e siga-o — seja autêntico"', true),
  (v_atv, 3, '"Aceite o que a sociedade impõe"', false),
  (v_atv, 4, '"Imite cegamente seus pais"', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 4, 'O que Jeremias 17.9 diz sobre o coração humano?', 'multipla_escolha',
   'Jeremias 17.9: "Enganoso é o coração, mais do que todas as coisas, e desesperadamente corrupto. Quem poderá entendê-lo?" A bússola está quebrada — não sabemos querer o que é bom.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Que o coração é puro e confiável', false),
  (v_atv, 2, 'Que o coração precisa apenas de educação', false),
  (v_atv, 3, 'Que o coração é enganoso e desesperadamente corrupto', true),
  (v_atv, 4, 'Que o coração é livre de pecado depois da conversão', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 5, 'Em Romanos 1.24, qual é a "punição" de Deus para a impiedade descrita por Paulo?', 'multipla_escolha',
   'A grande punição de Deus na carta de Paulo aos Romanos é "ser entregue às vontades do próprio coração" — seja feito tudo o que seu coração quer. Não é ser entregue a Satanás, mas a si mesmo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Ser entregue a Satanás e seus demônios', false),
  (v_atv, 2, 'Ser entregue aos desejos do próprio coração', true),
  (v_atv, 3, 'Receber pragas físicas imediatas', false),
  (v_atv, 4, 'Perder o livre-arbítrio', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 6, 'Como o amor de Deus é revelado, em contraste com o entregar à própria vontade?', 'multipla_escolha',
   'Em Hebreus 12.7-10, lemos que Deus, por nos amar, nos disciplina — não nos deixa fazer tudo o que queremos. O amor de Deus se revela em seus "nãos".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Dando tudo o que pedimos', false),
  (v_atv, 2, 'Nos disciplinando — não deixando nossas vontades sempre serem feitas', true),
  (v_atv, 3, 'Removendo todo sofrimento da nossa vida', false),
  (v_atv, 4, 'Ignorando nossos pecados', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 7, 'O que diz a "teoria mimética" de René Girard, citada no livro?', 'multipla_escolha',
   'Nossos desejos não nascem espontaneamente — são sempre mediados por alguém que admiramos. Quando desejo algo, é porque acredito que, ao tê-lo, me tornarei mais parecido com aquela pessoa. As marcas usam influenciadores exatamente por causa desse princípio.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Nossos desejos são totalmente espontâneos e originais', false),
  (v_atv, 2, 'Nossos desejos são sempre mediados — admiramos alguém e queremos nos parecer com ele', true),
  (v_atv, 3, 'Devemos ignorar todos os nossos desejos', false),
  (v_atv, 4, 'Desejos vêm exclusivamente de instintos biológicos', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 8, 'O que diz o princípio bíblico do Salmo 115.4-8 sobre nossos afetos?', 'multipla_escolha',
   'O salmista afirma um princípio: "Tornam-se semelhantes a eles os que os fazem, e todos os que neles confiam". Nós nos tornamos como aquilo que adoramos.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Os ídolos não influenciam quem os adora', false),
  (v_atv, 2, 'Nós nos tornamos semelhantes àquilo (ou àquele) que adoramos', true),
  (v_atv, 3, 'Devemos adorar muitos deuses para sermos completos', false),
  (v_atv, 4, 'A adoração não muda o caráter de uma pessoa', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 9, 'Segundo Paulo em 2Coríntios 3.16-18, como acontece a transformação no cristão?', 'multipla_escolha',
   'Paulo descreve: "Todos nós, com o rosto descoberto, contemplando a glória do Senhor, somos transformados, de glória em glória, na sua própria imagem". Quando o véu é tirado (na conversão), passamos a contemplar — e contemplar transforma.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Pelo esforço próprio de mudar comportamento', false),
  (v_atv, 2, 'Contemplando a glória do Senhor com o rosto descoberto, somos transformados de glória em glória na imagem dele', true),
  (v_atv, 3, 'Por meio de rituais religiosos', false),
  (v_atv, 4, 'Apenas no momento da glorificação final', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 10, 'Em Mateus 16, quando Pedro confessa que Jesus é o Cristo, qual a explicação de Jesus para essa revelação?', 'multipla_escolha',
   'Jesus responde a Pedro: "Bem-aventurado é você, Simão Barjonas, porque não foi carne e sangue que revelaram isso a você, mas meu Pai, que está nos céus". Só a ação de Deus tira o véu que nos cega à revelação de Cristo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Veio do raciocínio inteligente de Pedro', false),
  (v_atv, 2, 'Resultou do esforço dos grandes estudantes de teologia', false),
  (v_atv, 3, 'Veio da revelação do Pai — não foi carne e sangue que revelou isso', true),
  (v_atv, 4, 'Pedro adivinhou por causa dos milagres', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 11, 'Quais são as três formas de "falsa transformação" identificadas no livro?', 'multipla_escolha',
   'O autor identifica três métodos que produzem mudança aparente sem real conversão dos afetos: medo (do inferno), bênçãos (obedecer para receber prosperidade) e aceitação (performar para ser acolhido pelo grupo).')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Estudo, oração e jejum', false),
  (v_atv, 2, 'Medo, bênçãos e aceitação', true),
  (v_atv, 3, 'Disciplina, ministério e ofertas', false),
  (v_atv, 4, 'Comunhão, leitura e meditação', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 12, 'Qual é, então, a essência da verdadeira transformação, segundo o livro?', 'multipla_escolha',
   'Verdadeira transformação não é adestramento de comportamentos, mas alteração dos afetos — mudança de "quem você ama de todo o seu coração". "Mostre-me quem/o que você ama de todo o seu coração e lhe mostrarei no que você vai se transformar."')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Adestramento dos comportamentos exteriores', false),
  (v_atv, 2, 'Alteração dos afetos — mudança de quem se ama de todo o coração', true),
  (v_atv, 3, 'Acúmulo de informação teológica', false),
  (v_atv, 4, 'Esforço pessoal de força de vontade', false);

  -- ===== AULA 3 (MCs ordens 3-12) =====

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 3, 'O que o autor chama de "inimigos da visão"?', 'multipla_escolha',
   'O autor define "inimigos da visão" como tudo o que se interpõe entre nós e a beleza de Cristo, impedindo-nos de contemplá-lo. Usa a metáfora de uma viagem em caravana, onde outros carros podem se interpor entre o seguidor e o líder.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Pessoas que se opõem à fé cristã', false),
  (v_atv, 2, 'Tudo o que se interpõe entre nós e a contemplação de Cristo', true),
  (v_atv, 3, 'Líderes religiosos hipócritas', false),
  (v_atv, 4, 'Problemas de saúde ocular', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 4, 'Qual é o primeiro "inimigo da visão" apresentado pelo autor?', 'multipla_escolha',
   'O primeiro inimigo apresentado é a ignorância — tanto do propósito eterno de Deus quanto dos inimigos que tentam nos afastar desse propósito.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Pecado', false),
  (v_atv, 2, 'Ignorância (falta de conhecimento)', true),
  (v_atv, 3, 'Preguiça', false),
  (v_atv, 4, 'Falta de tempo', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 5, 'Como a Bíblia trata o conceito de pecado, segundo o capítulo?', 'multipla_escolha',
   'A Bíblia traz duas definições de pecado: "o pecado" (singular) — a força interna herdada de Adão que nos arrasta a desobedecer; e "os pecados" (plural) — as múltiplas formas que essa força encontra para ocupar o lugar de Deus em nossa vida (os ídolos).')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Apenas como ações ruins isoladas', false),
  (v_atv, 2, 'Como "o pecado" (força interna) e "os pecados" (múltiplos ídolos que ocupam o lugar de Deus)', true),
  (v_atv, 3, 'Como uma fraqueza moral que pode ser superada pela educação', false),
  (v_atv, 4, 'Como algo que afeta só os não convertidos', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 6, 'O que João Calvino afirmou sobre o coração humano, citado no livro?', 'multipla_escolha',
   'João Calvino afirmou: "O coração humano é uma fábrica de ídolos". Quando não adoramos o Criador acima de todas as coisas, vamos adorar alguma coisa criada.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'O coração humano é puro até que prove o contrário', false),
  (v_atv, 2, 'O coração humano é uma fábrica de ídolos', true),
  (v_atv, 3, 'O coração humano não tem importância na vida cristã', false),
  (v_atv, 4, 'O coração humano é uma fábrica de bondade', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 7, 'O que o autor chama de "agoralatria"?', 'multipla_escolha',
   'O autor cunha o termo "agoralatria" — a idolatria do agora. O deus desta era ensina: "coma tudo o que puder, assista a tudo o que quiser, jogue todos os jogos — a hora é AGORA". Tudo o que não tiver recompensa AGORA não tem valor.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Adoração de antepassados', false),
  (v_atv, 2, 'A idolatria do agora — buscar prazer e recompensa imediata, ignorando o eterno', true),
  (v_atv, 3, 'Falta de pontualidade', false),
  (v_atv, 4, 'Adoração de profetas modernos', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 8, 'Em Lucas 17.26-27, sobre os dias de Noé, por que o estilo de vida descrito é condenável, segundo o autor?', 'multipla_escolha',
   'O autor mostra que comer, beber, casar e dar-se em casamento são coisas lícitas criadas por Deus. O problema era que aquelas pessoas estavam "embriagadas com a vida cotidiana", vivendo sem considerar o plano eterno de Deus — um ateísmo prático.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque comer e beber são pecados em si', false),
  (v_atv, 2, 'Porque essas pessoas estavam embriagadas com a vida cotidiana, sem considerar o plano eterno de Deus — viviam um ateísmo prático', true),
  (v_atv, 3, 'Porque não tinham obras suficientes', false),
  (v_atv, 4, 'Porque não eram religiosos o bastante', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 9, 'Como o autor define a preguiça espiritual?', 'multipla_escolha',
   'O autor descobriu que preguiça não está apenas relacionada a não fazer nada — é sempre escolher o que é mais fácil. Um homem pode trabalhar muito (mesmo 14 horas) e ainda assim ser preguiçoso, se seu ofício se tornou fuga do que é correto.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Apenas não fazer nada o dia inteiro', false),
  (v_atv, 2, 'Sempre escolher o que é mais fácil em vez do que é certo, mesmo que isso envolva muito trabalho', true),
  (v_atv, 3, 'Não ir à igreja todos os domingos', false),
  (v_atv, 4, 'Não ler livros teológicos', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 10, 'Qual é o "inimigo mais sutil e difícil de identificar", segundo o capítulo?', 'multipla_escolha',
   'O autor apresenta a "falsa contemplação" — a falsa sensação de estar olhando para Jesus. Os religiosos do tempo de Jesus eram cegos à revelação de Cristo, mas achavam que já estavam vendo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'A perseguição externa', false),
  (v_atv, 2, 'A falsa contemplação — achar que está olhando para Jesus quando não está', true),
  (v_atv, 3, 'A falta de dinheiro', false),
  (v_atv, 4, 'A solidão', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 11, 'Na cena de Marta e Maria (Lc 10.38-42), o que Jesus está confrontando?', 'multipla_escolha',
   'Jesus está afirmando que servir nunca pode vir antes da maior das prioridades: olhar para Jesus, estar fascinado por ele e buscar conhecê-lo. Marta corria para servir; Maria sentou aos pés. "Maria escolheu a boa parte."')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'A importância do ministério é dispensável', false),
  (v_atv, 2, 'Servir não pode vir antes da contemplação — sentar aos pés de Jesus é prioridade', true),
  (v_atv, 3, 'Maria estava errada por não ajudar', false),
  (v_atv, 4, 'Os discípulos deveriam fazer o jantar', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 12, 'Qual exemplo bíblico o autor usa para ilustrar o "ativismo" como falsa contemplação?', 'multipla_escolha',
   'O autor cita Judas — discípulo presente em momentos cruciais do ministério (Sermão do Monte, Sermão Profético, milagres, pregação, expulsão de demônios), mas que ainda assim não conhecia o Senhor. É possível estar em todas as reuniões e não conhecer Cristo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Pedro', false),
  (v_atv, 2, 'João Batista', false),
  (v_atv, 3, 'Judas', true),
  (v_atv, 4, 'Tomé', false);

  -- ===== AULA 4 (MCs ordens 3-12) =====

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 3, 'Qual revelação o autor diz ter recebido durante uma reunião de igreja caseira (DNA)?', 'multipla_escolha',
   'Durante a oração, ele sentiu o Espírito Santo dizer: "Se você quer me conhecer mais, abra seus olhos, pois eu espalhei partes de quem eu sou em cada pessoa desta sala". Há dimensões de Cristo que só são conhecidas por meio dos irmãos.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Que ele deveria pregar mais', false),
  (v_atv, 2, 'Que Deus espalhou partes de quem ele é em cada pessoa da igreja — para conhecê-lo, é preciso olhar para os irmãos', true),
  (v_atv, 3, 'Que deveria abandonar a igreja', false),
  (v_atv, 4, 'Que conhecer Deus sozinho é suficiente', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 4, 'Em Mateus 13.58, por que Jesus "não pôde fazer muitos milagres" em Nazaré?', 'multipla_escolha',
   'A incredulidade gerada pela familiaridade. As pessoas que cresceram com Jesus o viam apenas como o filho do carpinteiro, irmão de fulano e ciclano — perderam a revelação do Deus encarnado por excesso de familiaridade.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque ele estava cansado da viagem', false),
  (v_atv, 2, 'Por causa da incredulidade gerada pela familiaridade — eles o conheciam comum demais', true),
  (v_atv, 3, 'Porque os fariseus o impediram', false),
  (v_atv, 4, 'Porque ainda não tinha autoridade espiritual', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 5, 'Em Efésios 3.16-19, o que Paulo ora para que os efésios conheçam, e com quem?', 'multipla_escolha',
   'Paulo ora para que conheçam "a largura, o comprimento, a altura e a profundidade do amor de Cristo" — mas a expressão crucial é "com todos os santos". Tentamos conhecer Cristo sozinhos e por isso experimentamos tão pouco da plenitude do seu amor.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Que conheçam o sucesso material, sozinhos', false),
  (v_atv, 2, 'A largura, comprimento, altura e profundidade do amor de Cristo — "com todos os santos"', true),
  (v_atv, 3, 'Que conheçam dons espirituais individuais', false),
  (v_atv, 4, 'Que conheçam a história da igreja antiga', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 6, 'Qual a raiz dos nossos pecados, segundo a leitura do livro sobre o jardim do Éden?', 'multipla_escolha',
   'O autor afirma: "Nossos pecados têm raiz na dúvida que temos se somos, de fato, amados por Deus". Foi plantando essa dúvida que a serpente atacou Eva no jardim ("É verdade que Deus disse...?"). Nossas transgressões são tentativas de encontrar valor, prazer e amor fora de Deus.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'A falta de inteligência', false),
  (v_atv, 2, 'Na dúvida que temos se somos, de fato, amados por Deus', true),
  (v_atv, 3, 'A influência da cultura grega', false),
  (v_atv, 4, 'A pobreza material', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 7, 'Em Atos 9, qual a pergunta exata que Jesus faz a Saulo a caminho de Damasco?', 'multipla_escolha',
   'Jesus não diz "por que persegue minha igreja?", mas "Saulo, Saulo, por que me persegues?" (At 9.4). Jesus e sua igreja são um — rejeitar a igreja é rejeitar Cristo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, '"Saulo, por que persegue minha igreja?"', false),
  (v_atv, 2, '"Saulo, por que me ignoras?"', false),
  (v_atv, 3, '"Saulo, Saulo, por que me persegues?"', true),
  (v_atv, 4, '"Saulo, por que persegue os meus apóstolos?"', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 8, 'Qual é o verdadeiro conceito bíblico de "irmão" na igreja, segundo o autor?', 'multipla_escolha',
   'Diferente de cônjuge, amigo, empregado e patrão — relações que nós escolhemos —, o "irmão" é dado pelo Pai. Ninguém escolhe seus irmãos. A pergunta certa não é "quem eu escolheria", mas "quem o Pai deu a mim?"')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'É quem nós escolhemos para conviver na igreja', false),
  (v_atv, 2, 'É quem o Pai nos deu — não escolhemos, recebemos', true),
  (v_atv, 3, 'É somente o membro da família biológica', false),
  (v_atv, 4, 'É qualquer pessoa que frequenta a mesma igreja', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 9, 'O que significa fazer "aliança" com os irmãos da igreja, segundo o capítulo?', 'multipla_escolha',
   'Aliança significa não abandoná-los por motivos banais — permanecer na doença e na saúde, na tristeza ou na alegria, nos momentos de bonança e nos de escassez.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Assinar um documento legal', false),
  (v_atv, 2, 'Decidir não abandoná-los por motivos banais — permanecer na doença e saúde, tristeza e alegria, bonança e escassez', true),
  (v_atv, 3, 'Concordar em todas as opiniões', false),
  (v_atv, 4, 'Fazer doações financeiras à igreja', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 10, 'O que significa o nome "Mateus", dado por Jesus a Levi?', 'multipla_escolha',
   'Mateus significa "presente de Deus". Levi (que significava "unir" ou "ligar") era publicano, traidor do próprio povo. Jesus mudou seu nome — passou a chamá-lo de "presente de Deus".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Aquele que perdoa', false),
  (v_atv, 2, 'Presente de Deus', true),
  (v_atv, 3, 'Pescador de homens', false),
  (v_atv, 4, 'Rocha firme', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 11, 'Como Mateus relata o próprio chamado em seu Evangelho (Mt 9.9), em contraste com Marcos e Lucas?', 'multipla_escolha',
   'Marcos destaca a família ("Levi, filho de Alfeu"), Lucas a profissão ("um publicano"), mas Mateus relata seu próprio chamado escrevendo: "Jesus viu um homem chamado Mateus". Ele está dizendo: "Jesus não olhou para meu passado, profissão ou traição — viu Mateus, o presente de Deus".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Destacando sua família ("filho de Alfeu")', false),
  (v_atv, 2, 'Destacando sua profissão ("publicano")', false),
  (v_atv, 3, 'Escrevendo "Jesus viu um homem chamado Mateus" — destacando que Jesus viu nele o "presente de Deus", não seu passado', true),
  (v_atv, 4, 'Não escreveu sobre seu próprio chamado', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 12, 'Por que o autor diz que precisa pedir a Deus "os olhos de Jesus"?', 'multipla_escolha',
   'Olhar para o irmão com olhos contaminados pelo pecado só vê falhas — o que afasta. É preciso pedir a Deus seus olhos para enxergar nos irmãos os desígnios eternos que ele colocou, a parte de Jesus que cada um carrega.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Para ter visão profética', false),
  (v_atv, 2, 'Para enxergar nos irmãos os desígnios eternos de Deus e a parte de Cristo que carregam, em vez de só ver falhas', true),
  (v_atv, 3, 'Para descobrir quem é o melhor amigo', false),
  (v_atv, 4, 'Para identificar lobos infiltrados', false);

  -- ===== AULA 5 (MCs ordens 3-12) =====

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 3, 'Por que olhar para a Bíblia é olhar para Jesus, segundo João 1.1,14?', 'multipla_escolha',
   'João abre seu Evangelho afirmando que Jesus é "o Verbo" — a Palavra de Deus encarnada. Portanto, olhar para a Bíblia é olhar para Cristo; conhecer a Palavra é conhecer Jesus.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque a Bíblia contém algumas histórias sobre Jesus', false),
  (v_atv, 2, 'Porque Jesus é o Verbo (a Palavra de Deus) encarnado — toda a Escritura aponta para ele', true),
  (v_atv, 3, 'Porque a Bíblia foi escrita só por Jesus', false),
  (v_atv, 4, 'Porque não existe outra forma de revelação', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 4, 'Qual é o engano da religiosidade ao olhar para a Lei de Deus, segundo o capítulo?', 'multipla_escolha',
   'A mesma mentira da serpente no Éden: "se você fizer X, vai se tornar Y". Ninguém se torna filho de Deus por fazer algo certo, nem deixa de sê-lo por fazer algo errado. Para ser filho, é preciso nascer de novo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Negar a existência da Lei', false),
  (v_atv, 2, 'Acreditar que obedecendo à Lei nos tornamos filhos de Deus — quando na verdade é a fé em Cristo que nos faz filhos', true),
  (v_atv, 3, 'Ler a Lei apenas em português', false),
  (v_atv, 4, 'Memorizar a Lei sem entendê-la', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 5, 'Como o autor descreve a função da Lei de Deus na Bíblia?', 'multipla_escolha',
   'Os mandamentos, leis e preceitos descritos nas Escrituras "não representam comportamentos que nos tornam filhos de Deus; eles descrevem como um filho de Deus deve se comportar". A Lei é o código genético dos filhos.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Pré-requisitos para entrar no Céu', false),
  (v_atv, 2, 'O código genético dos filhos de Deus — descreve a natureza de quem já nasceu de novo', true),
  (v_atv, 3, 'Sugestões opcionais para os mais maduros', false),
  (v_atv, 4, 'Regras culturais apenas para os judeus', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 6, 'Na cena de Emaús (Lc 24), qual era a chave que abriu o entendimento dos discípulos sobre as Escrituras?', 'multipla_escolha',
   'Jesus, "começando em Moisés e prosseguindo por todos os profetas, explicou-lhes o que constava a respeito dele em todas as Escrituras". Toda a Bíblia revela Cristo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'A explicação de profecias políticas futuras', false),
  (v_atv, 2, 'Jesus mostrou que toda a Bíblia — de Moisés aos profetas — falava a respeito dele', true),
  (v_atv, 3, 'A revelação da data exata do fim dos tempos', false),
  (v_atv, 4, 'Um milagre físico durante a refeição', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 7, 'O que o autor quer dizer com "Jesus sangrava Bíblia"?', 'multipla_escolha',
   'Aos doze anos, Jesus já tinha conhecimento bíblico suficiente para discutir com mestres no templo (Lc 2.46-47). E na cruz, sob a maior pressão, o que saiu de dentro dele foram Salmos (Sl 22.1; 31.5). Quando somos pressionados, sai o que está em abundância dentro de nós.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Que ele escreveu vários livros da Bíblia', false),
  (v_atv, 2, 'Que mesmo sob a maior pressão (na cruz), citava Escrituras — o que estava em abundância dentro dele', true),
  (v_atv, 3, 'Que ele só lia a Bíblia em hebraico', false),
  (v_atv, 4, 'Que tinha problemas físicos para ler', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 8, 'Qual é o "maior perigo" de não se empenhar em conhecer a Palavra de Deus, segundo o capítulo?', 'multipla_escolha',
   'O autor abre listando 4 perigos, mas começa pelo "maior de todos": criar um próprio Jesus. Sem empenho real, corremos o risco de fabricar um ídolo nas nossas mentes e o chamarmos de "Jesus".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Ficar sem assunto para conversar com cristãos', false),
  (v_atv, 2, 'Criar seu próprio Jesus — um ídolo na mente que recebe o nome do verdadeiro', true),
  (v_atv, 3, 'Não passar nas provas de catecismo', false),
  (v_atv, 4, 'Não conseguir pregar em público', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 9, 'No Sermão Escatológico (Mt 24-25), qual o sinal mais citado por Jesus sobre os últimos dias?', 'multipla_escolha',
   'Apesar de Jesus falar de guerras, catástrofes, doenças, frieza e perseguição, a evidência mais citada por ele e mais vezes ignorada por nós é: "Cuidado, que ninguém os engane. Pois muitos virão em meu nome".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Guerras e fome', false),
  (v_atv, 2, 'O engano — "Cuidado para que ninguém os engane"', true),
  (v_atv, 3, 'A vinda de Elias', false),
  (v_atv, 4, 'O eclipse total', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 10, 'Qual frase de Hernandes Dias Lopes é citada para descrever a superficialidade da igreja brasileira?', 'multipla_escolha',
   'A famosa frase: "A igreja brasileira é como um lago com quilômetros de largura e centímetros de profundidade". Muitas informações sobre tudo e profundidade em quase nada.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, '"A igreja brasileira é o futuro do cristianismo"', false),
  (v_atv, 2, '"A igreja brasileira é como um lago com quilômetros de largura e centímetros de profundidade"', true),
  (v_atv, 3, '"A igreja brasileira ora muito e estuda pouco"', false),
  (v_atv, 4, '"A igreja brasileira não precisa de comentários bíblicos"', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 11, 'Qual é a frase de Francis Chan, citada no livro, sobre o "sucesso inútil"?', 'multipla_escolha',
   'Francis Chan: "Pior do que fracassar na vida, é ter sucesso naquilo que é eternamente inútil". Muitos perdem a saúde tentando construir uma vida que o Senhor declara irrelevante.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, '"O sucesso é a maior bênção de Deus"', false),
  (v_atv, 2, '"Pior do que fracassar na vida é ter sucesso naquilo que é eternamente inútil"', true),
  (v_atv, 3, '"Devemos sempre fracassar para sermos santos"', false),
  (v_atv, 4, '"Só os pobres entram no Reino"', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula5, 12, 'Segundo o capítulo, quais são as duas perguntas fundamentais que a Bíblia responde?', 'multipla_escolha',
   'A Bíblia responde a duas perguntas fundamentais para a vida de qualquer ser humano: "Quem é Deus?" e "Qual é a sua vontade para minha vida?". A eternidade depende das respostas a essas duas perguntas.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, '"Quem é o homem?" e "Como ganhar dinheiro?"', false),
  (v_atv, 2, '"Quem é Deus?" e "Qual é a sua vontade para minha vida?"', true),
  (v_atv, 3, '"Como chegar ao Céu?" e "Como evitar o inferno?"', false),
  (v_atv, 4, '"O que devo fazer?" e "O que devo evitar?"', false);

  -- ===== AULA 6 (MCs ordens 3-12) =====

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 3, 'Que frase de John Piper abre o capítulo sobre oração?', 'multipla_escolha',
   'John Piper: "É mais difícil orar do que pregar. Muitas vezes eu preguei mal, mas nunca esqueci que estava pregando no meio de uma mensagem. Porém, com frequência, eu esqueço que estou orando em meio à oração".')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, '"Orar pouco é o segredo do crescimento"', false),
  (v_atv, 2, '"É mais difícil orar do que pregar — esqueço que estou orando em meio à oração"', true),
  (v_atv, 3, '"A oração não passa do teto"', false),
  (v_atv, 4, '"Pregar é mais espiritual que orar"', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 4, 'Por que, segundo o capítulo, não desenvolver uma vida de oração é "desperdiçar o sacrifício de Jesus"?', 'multipla_escolha',
   'Jesus morreu para abrir o caminho de volta ao trono da graça (Hb 4.16). A cruz foi o preço pago para nos devolver ao propósito eterno de Deus. Não orar é não usufruir do que a cruz nos comprou.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque a oração é o que nos salva', false),
  (v_atv, 2, 'Porque a cruz abriu o caminho de volta ao Pai — não orar é não usufruir do que foi conquistado', true),
  (v_atv, 3, 'Porque a oração paga nossos pecados', false),
  (v_atv, 4, 'Porque a oração impede a volta de Cristo', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 5, 'Em Mateus 6.5, Jesus condena "os hipócritas" na oração. O que era a "hipocrisia" condenada?', 'multipla_escolha',
   'Jesus não está condenando esses homens por orarem pouco, por usarem as palavras erradas ou por não se ajoelharem. A denúncia está na palavra "para": eles oravam para serem vistos. Sua motivação era a reputação diante dos homens.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Orar com palavras erradas', false),
  (v_atv, 2, 'Orar em pé em vez de ajoelhado', false),
  (v_atv, 3, 'Orar "para serem vistos pelos outros" — a motivação era o prestígio diante dos homens', true),
  (v_atv, 4, 'Orar muito tempo de uma só vez', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 6, 'Em Mateus 6.7, Jesus condena também "orar como os pagãos". Quem eram os pagãos e por que oravam mal?', 'multipla_escolha',
   'No contexto de Jesus, pagãos eram pessoas que oravam muito, porque tinham vários deuses. A oração era para "convencer" um deus a dar algo. Tratavam Deus como o dono de um restaurante: descobrir o preço para "comprar" o que precisavam.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Eram ateus que não oravam', false),
  (v_atv, 2, 'Eram politeístas que oravam muito tentando "comprar" bênçãos de seus vários deuses', true),
  (v_atv, 3, 'Eram judeus muito espirituais', false),
  (v_atv, 4, 'Eram cristãos das primeiras igrejas', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 7, 'Qual é a postura correta de oração, segundo Mateus 6.8 ("o Pai sabe o que vocês precisam antes mesmo de lhe pedirem")?', 'multipla_escolha',
   'Jesus está nos ensinando a orar como filhos, com a certeza de que o Pai nos ama e conhece todas as nossas necessidades. Não é convencer Deus — é crescer em intimidade.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Convencer Deus por argumentos sólidos', false),
  (v_atv, 2, 'Orar como filho, confiando que o Pai conhece todas as nossas necessidades e nos ama', true),
  (v_atv, 3, 'Listar exaustivamente cada pedido várias vezes', false),
  (v_atv, 4, 'Negociar bênçãos por meio de sacrifícios', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 8, 'Por que Jesus convida em Mateus 6.6 a orar "no seu quarto, com a porta fechada"?', 'multipla_escolha',
   'O quarto é o lugar da casa onde só os mais íntimos entram. Pessoas estranhas podem visitar a cozinha, mas no quarto só os íntimos. Cristo nos chama para o lugar onde o objetivo é apenas um: desenvolver um relacionamento pessoal com ele.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Para evitar perseguição', false),
  (v_atv, 2, 'Porque o quarto representa o lugar da intimidade — só ali há recompensa em buscar a Deus pela própria comunhão com ele', true),
  (v_atv, 3, 'Para ninguém saber o que se ora', false),
  (v_atv, 4, 'Porque o ambiente fechado tem melhor acústica espiritual', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 9, 'O que Jesus quis ensinar com a expressão "em secreto" sobre a oração?', 'multipla_escolha',
   'As recompensas deste mundo são dadas pelo que fazemos em público. Ninguém ganhou o Nobel, Oscar ou Grammy por aquilo que faz no quarto fechado. Cristo nos chama para o lugar onde não há recompensa visível — apenas a intimidade com ele.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Que toda oração pública é pecaminosa', false),
  (v_atv, 2, 'Que a oração no secreto não tem recompensa visível — a única recompensa é a própria intimidade com Deus', true),
  (v_atv, 3, 'Que ninguém deve saber que oramos', false),
  (v_atv, 4, 'Que palavras devem ser sussurradas', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 10, 'Por qual nome Jesus ensina seus discípulos a chamarem Deus na oração?', 'multipla_escolha',
   '"Pai" — esse é o nome favorito de Deus, segundo Jesus. Não devemos orar como pagãos tentando convencer Deus a nos abençoar, mas como filhos que sabem que são amados por um Pai.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Senhor dos Exércitos', false),
  (v_atv, 2, 'Pai', true),
  (v_atv, 3, 'Eterno', false),
  (v_atv, 4, 'Altíssimo', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 11, 'Por que muitas das nossas orações não são respondidas, segundo Tiago 4.3?', 'multipla_escolha',
   'Tiago 4.3: "Pedem e não recebem, porque pedem mal, para esbanjarem em seus prazeres". Muitas das nossas orações são expressões das nossas vontades, e não da vontade de Deus.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque Deus não escuta a maioria das pessoas', false),
  (v_atv, 2, 'Porque pedimos mal — para esbanjarmos em prazeres; oramos nossas vontades, não a vontade de Deus', true),
  (v_atv, 3, 'Porque não oramos em pé', false),
  (v_atv, 4, 'Porque não temos fé suficiente', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula6, 12, 'Qual é a relação entre oração e Bíblia, no método sugerido pelo autor?', 'multipla_escolha',
   'O autor afirma que oração e Bíblia precisam funcionar juntas. Quando você lê as Escrituras, é Deus falando com você; quando você ora, é você respondendo a Deus. Por isso, orar com base na Palavra é a única forma de orar corretamente.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Bíblia é teórica, oração é prática — não se conectam', false),
  (v_atv, 2, 'Bíblia é Deus falando conosco; oração é nossa resposta — funcionam juntas', true),
  (v_atv, 3, 'Devemos orar antes para depois ler a Bíblia', false),
  (v_atv, 4, 'A Bíblia não tem relação com a vida de oração', false);

  -- ===== AULA 7 (MCs ordens 3-12) =====

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 3, 'Quais são os quatro tipos de solo na parábola do semeador (Mc 4.1-9), segundo a divisão proposta no capítulo?', 'multipla_escolha',
   'O autor descreve quatro tipos de pessoa que ouvem a Palavra: à beira do caminho (distraídos), solo rochoso (apressados), entre os espinhos (divididos) e boa terra (frutíferos).')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Trigo, joio, tares e cizânia', false),
  (v_atv, 2, 'Distraídos, apressados, divididos e frutíferos', true),
  (v_atv, 3, 'Pais, filhos, irmãos e amigos', false),
  (v_atv, 4, 'Sacerdotes, profetas, reis e juízes', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 4, 'O que é "frutificar", na linguagem do capítulo?', 'multipla_escolha',
   'Fruto é aquilo que a árvore produz como consequência natural de quem ela é. Frutificar é ser cada dia mais parecido com Jesus — resultado natural de quem está olhando para ele.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Ganhar muitas almas em campanhas evangelísticas', false),
  (v_atv, 2, 'Ser cada dia mais parecido com Jesus — consequência natural de quem está olhando para ele', true),
  (v_atv, 3, 'Acumular bens materiais como bênção de Deus', false),
  (v_atv, 4, 'Pregar em grandes congressos', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 5, 'O que é a humildade, segundo o autor — em contraste com as definições populares?', 'multipla_escolha',
   'Humildade não é pensar menos de si mesmo (Jesus dizia "Eu Sou o Caminho"), nem sinônimo de pobreza (o Dono do Universo é o mais humilde). É não viver para si mesmo, a fim de glorificar a Deus e servir ao próximo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Pensar menos de si mesmo, considerando-se insignificante', false),
  (v_atv, 2, 'Pensar menos em si mesmo, a fim de glorificar a Deus e servir ao próximo', true),
  (v_atv, 3, 'Viver na pobreza material', false),
  (v_atv, 4, 'Nunca expressar opinião própria', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 6, 'A história da mãe do autor (a "lista" das compras nos EUA) ilustra qual virtude?', 'multipla_escolha',
   'A mãe do autor voltou dos EUA dizendo "Não comprei nada, esqueci das minhas coisas". Humildade é andar pela vida com uma lista que não contém o próprio nome — viver dedicado a amar o próximo para a glória de Deus.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Esquecimento natural com a idade', false),
  (v_atv, 2, 'Humildade — andar pela vida com uma lista que não contém o próprio nome', true),
  (v_atv, 3, 'Generosidade financeira com a igreja', false),
  (v_atv, 4, 'Desorganização', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 7, 'O que estava por trás da tentação "transforme estas pedras em pão" (Mt 4) no deserto?', 'multipla_escolha',
   'Satanás propôs: "Use o poder de Deus, use suas habilidades, use seus recursos para o próprio benefício. Viva para você". Jesus não caiu porque tinha clareza de que o Pai era sua satisfação e por isso vivia para amar o próximo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Era apenas uma tentação alimentar trivial', false),
  (v_atv, 2, 'Era a tentação de usar o poder de Deus para o próprio benefício — viver para si mesmo', true),
  (v_atv, 3, 'Era uma sugestão de generosidade aos pobres', false),
  (v_atv, 4, 'Era um teste de habilidade culinária', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 8, 'O que significa a palavra hebraica "kadosh", usada no Antigo Testamento para santidade?', 'multipla_escolha',
   'Kadosh significa "consagrado" ou "separado". Os objetos do tabernáculo eram santos não por serem perfeitos, mas por estarem separados para uso exclusivo de Deus. Santidade não está condicionada à perfeição, mas à consagração.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Perfeito, sem defeitos', false),
  (v_atv, 2, 'Consagrado, separado para uso exclusivo de Deus', true),
  (v_atv, 3, 'Sagrado em si mesmo, independente de Deus', false),
  (v_atv, 4, 'Limpo materialmente', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 9, 'Como o autor amplia a definição de pecado, ao olhar para a santidade de Jesus?', 'multipla_escolha',
   'O autor afirma: "podemos pecar ativamente, fazendo o que não agrada a Deus; e, sim, santidade é não fazer o que desagrada a Deus. Porém, também é pecado deixar de fazer aquilo que agrada a Deus". Santidade não é só não roubar — é ser generoso; não é só não mentir — é falar a verdade em amor.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Pecado é apenas fazer o que Deus reprova', false),
  (v_atv, 2, 'Pecado também é deixar de fazer o que Deus aprova — santidade inclui ser generoso, falar a verdade, amar', true),
  (v_atv, 3, 'Só atos exteriores são pecados', false),
  (v_atv, 4, 'Pecado é qualquer pensamento humano', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 10, 'No diálogo com a samaritana (Jo 4.34), o que Jesus chamou de sua "comida"?', 'multipla_escolha',
   'Jesus respondeu aos discípulos: "Minha comida consiste em fazer a vontade daquele que me enviou e em terminar a sua obra". Comida é aquilo que produz vida e satisfação — para Cristo, era fazer a vontade do Pai.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Pão sem fermento', false),
  (v_atv, 2, 'Fazer a vontade daquele que o enviou', true),
  (v_atv, 3, 'Peixe e mel', false),
  (v_atv, 4, 'Manjar dos anjos', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 11, 'Em João 8.14, Jesus afirma "sei de onde vim e para onde vou". Que duas verdades compõem a identidade de uma pessoa, segundo o autor?', 'multipla_escolha',
   'Cristo afirma que a identidade de uma pessoa é composta por duas verdades: número um, de onde ela vem (origem); número dois, para onde ela vai (destino). Até o documento de identidade civil reconhece isso.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Conquistas e fracassos', false),
  (v_atv, 2, 'Origem (de onde veio) e destino (para onde vai)', true),
  (v_atv, 3, 'Família biológica e profissão', false),
  (v_atv, 4, 'Pecados e virtudes', false);

  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula7, 12, 'Segundo o capítulo, o céu é o destino ou a origem do cristão? E qual a consequência disso?', 'multipla_escolha',
   'O autor faz uma inversão importante: "O céu não é o nosso destino, mas a nossa origem" (Fp 3.20). E "santidade é a natureza daqueles que vieram do céu". Os mandamentos não são pré-requisitos para entrar no Reino — são o código genético de quem nasceu de novo.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'O céu é o destino — o prêmio por quem viver em santidade', false),
  (v_atv, 2, 'O céu é a origem — santidade é a natureza daqueles que nasceram de novo (vieram do céu)', true),
  (v_atv, 3, 'O céu é apenas uma metáfora — não tem importância prática', false),
  (v_atv, 4, 'O céu é o que ganhamos quando os mandamentos foram bem cumpridos', false);

end
$migration$;
