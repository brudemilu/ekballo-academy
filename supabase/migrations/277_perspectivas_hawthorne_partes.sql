-- 277_perspectivas_hawthorne_partes.sql
-- Marca, dentro da aula do Hawthorne, onde começa cada um dos quatro PDFs em
-- que o capítulo 4 veio partido ("PARTE 1 DE 4" … "PARTE 4 DE 4").
--
-- Os marcadores são acréscimo editorial, a pedido do Bruno — não estão no PDF.
-- Os cortes são por página, não por seção: cada fronteira cai no MEIO de uma
-- frase, então o texto logo abaixo do marcador continua a frase interrompida
-- acima. O conteúdo em si não mudou (conferido por contagem de caracteres:
-- nenhuma letra falta).
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  update aulas set conteudo = $conteudo$PARTE 1 DE 4

A história de sua glória

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

PARTE 2 DE 4

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

PARTE 3 DE 4

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

PARTE 4 DE 4

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
end
$curso$;
