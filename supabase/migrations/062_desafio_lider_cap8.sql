-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 8 — Lidando bem com o desencorajamento (aula ordem = 8)
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
  -- Capítulo 8 — Lidando bem com o desencorajamento
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 8;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 8 — Lidando bem com o desencorajamento',
      8,
$conteudo$Esse é um dos assuntos mais complicados na área de liderança. Críticas e desencorajamento têm o potencial de arrasar o líder que não aprender a reagir bem a elas.

É fácil reconhecer uma crítica, mas e quanto ao desencorajamento, como reconhecer quando ele surge? A resposta a essa pergunta é crucial e nos ajudará a entender melhor a nossa própria experiência.

CAUSAS INTERNAS

Por que é tão difícil reagir positivamente a adversidades e críticas? Pelo simples fato de que elas ferem nosso amor-próprio e a nossa autoimagem, tendo o potencial de nos desmotivar imensamente. Vejamos isso com mais detalhes.

Medo de fracassar

Essa é uma das razões mais graves que impede uma reação positiva da nossa parte. Líderes, em geral, escondem, negam, temem, ignoram e odeiam o fracasso. Eles devem se lembrar, porém, de que aquele que nunca teve um fracasso é porque nunca tentou fazer algo na vida.

Recentemente, duas experiências científicas foram realizadas na Austrália. Uma delas foi na área da transposição de matéria na luz. Os cientistas conseguiram realizar, com sucesso, pela primeira vez na história, uma transmissão molecular. Por meio dela, na velocidade da luz, um objeto sólido foi transferido, por cem vezes, de um local a outro, dentro de uma mesma sala. Que coisa estupenda! Contudo, é importante notar que, para esses cientistas alcançarem os cem casos de sucesso, eles tiveram de passar por cinco mil testes fracassados.

A outra experiência foi realizada por um grupo de cientistas japoneses que, no deserto da Austrália, conseguiram, pela primeira vez, fazer voar o avião do futuro, que é um foguete a 9.300 km/h. Isso tornará possível que se viaje do Brasil a Nova York em uma hora. Quarenta dias antes de conseguirem chegar à sua experiência bem-sucedida, esse mesmo grupo experimentou um grande fracasso, que quase os levou a desistir do projeto.

Este é um princípio universal muito importante. Na maioria das vezes, um momento de sucesso acontece após muitos momentos de fracasso. Se você alcançar o sucesso sem passar pelo fracasso, provavelmente deve ter havido alguém que fracassou em seu lugar. Se você não errou ou não sofreu, é porque alguém o fez por você. Assim, o direito de errar é tão sagrado quanto o direito de acertar. É o medo do fracasso que nos faz esquecer essa verdade.

O desencorajamento também bate à nossa porta quando temos a impressão de que perdemos a chance de sucesso. Isso pode ser bastante frequente para os líderes mais velhos, que, em função da idade, sentem que não têm muito tempo de sobra para alcançar o sucesso. Quando tomamos uma atitude e, posteriormente, consideramos que a decisão foi errada, que o tempo passou e parece que não teremos uma segunda chance, a sensação de perda é desestimulante.

Contudo, o líder deve continuar aceitando correr riscos. Ele deve subir na árvore onde o fruto se encontra, pois muitas pessoas ainda estão abraçadas ao tronco, perguntando-se por que não estão recebendo o fruto. Muitos líderes em potencial têm se tornado grandes decepções por não terem se disposto a correr riscos. Muitos recebedores em potencial nada têm recebido, por nada haverem pedido. Tiago nos diz que não recebemos porque não pedimos. Na realidade, não pedimos porque tememos a rejeição do pedido. Com isso, não aceitamos correr o risco.

Um autor anônimo escreveu o seguinte sobre correr riscos:

"Sorrir é correr o risco de parecer tolo. Chorar é correr o risco de parecer muito sentimental. Tentar se aproximar de outra pessoa é correr o risco do envolvimento. Expor os seus sentimentos é correr o risco de expor o seu verdadeiro eu. Colocar suas ideias e pensamentos diante dos outros é correr o risco de perder a atenção deles. Amar é arriscar não ser amado. Viver é arriscar morrer. Esperar é arriscar o desespero. Tentar é arriscar fracassar. Mas o risco existe para que passemos por ele, pois nada é pior na vida do que nada arriscar. A pessoa que nada arrisca nada faz, nada tem e nada é. Ela pode evitar o sofrimento e a tristeza, mas, simplesmente, não pode aprender, crescer, sentir, amar e viver. Acorrentada por sua atitude, ela é uma escrava que abriu mão da sua liberdade."

Assim sendo, temos que vencer esse medo interior de que a nossa autoimagem seja maculada pelo fracasso, porque, como foi visto, ninguém alcança o sucesso sem passar pelo fracasso. Aquele que nada arrisca nada faz, nada tem e nada é, porque é um escravo de seus próprios receios.

Autoimagem negativa

Essa é a segunda razão interna pela qual é tão difícil reagir positivamente às adversidades. Criamos uma autoimagem negativa quando nos sentimos perdendo a luta contra o pecado ou contra os desafios da vida.

Sobre sentir-se perdendo a luta contra os desafios da vida, temos um grande exemplo na vida do profeta Elias (1Rs 18-19). No capítulo 18, ele vive um momento de glória no Monte Carmelo, sendo o instrumento usado por Deus para derrotar os profetas de Baal. No capítulo 19, porém, encontramos o profeta em uma caverna, dominado por um profundo desencorajamento, pedindo até mesmo para morrer.

Você já passou por uma situação em que, num primeiro momento, experimentou o gozo da glória, mas logo viu aquele momento ser substituído por outro de grande desencorajamento? Essa experiência que o leva do topo ao abismo em pouco tempo, é traumática e nos faz sentir que somos fracassados.

Sobre sentir-se perdendo a luta contra o pecado, Paulo deixa isso bem claro em Romanos 7.24-25, onde diz: "Desventurado homem que sou! Quem me livrará do corpo desta morte? Graças a Deus por Jesus Cristo, nosso Senhor. De maneira que eu, de mim mesmo, com a mente, sou escravo da lei de Deus, mas, segundo a carne, da lei do pecado".

No meio de sua agonia, ele confessa sua luta. O seu espírito estava pronto, inclinando-se para as coisas boas geradas pelo Espírito de Deus. No entanto, ele travava uma verdadeira guerra dentro de si, com a sua velha natureza pecaminosa ainda tentando-o para o erro.

Essa luta contra o pecado, principalmente se cairmos seguidamente em uma área específica, traz com ela o germe e dissabor do desencorajamento. Porém, a história não termina aqui. Como cristãos, devemos manter viva a esperança, apesar da nossa natureza pecaminosa, de que o que é hoje mortal e corruptível verá ainda o seu dia eterno de imortalidade e incorruptibilidade. Naquele dia, as derrotas serão tragadas pela vitória definitiva da obra divina em nós.

Enquanto aguardamos o dia da nossa eterna redenção, continuamos lutando contra o pecado que tenazmente nos assedia. Suzana Wesley, a mãe de John e Charles Wesley, disse: "Qualquer coisa que enfraqueça a nossa razão, bloqueie a ternura da nossa consciência, obscureça a nossa percepção de Deus ou remova o nosso desejo pelas coisas espirituais é pecado para nós".

São essas as coisas que nos desencorajam, pois somos atingidos por elas na nossa jornada diária. Muitas vezes, o desencorajamento deve-se muito mais às coisas que nós mesmos pensamos a nosso respeito, à nossa autoimagem deturpada, do que àquilo que Deus diz. Por isso, é difícil ter uma atitude positiva diante de uma situação em que a própria pessoa se julga uma desventurada.

Egoísmo

As pessoas que mais se sentem desencorajadas são aquelas que só pensam em uma coisa: nelas mesmas. Isso ocorre porque o objetivo delas, naquilo que estavam fazendo, estava centrado em si mesmas: "meu ministério, minha pessoa, minha reputação". Como não obtiveram sucesso, desencorajam-se por falta de um objetivo maior do que sua própria glória.

Falta de planejamento

A inatividade e a falta de planejamento são fatores poderosos na equação que leva ao desencorajamento. Como dizia o filósofo Sócrates, "para o capitão que não sabe onde seu barco deve ancorar, os ventos são sempre contrários". Se o líder tem um plano e este falha em algum ponto, ele ainda tem um objetivo e, por isso, continua tentando alcançá-lo de outras formas. Contudo, se ele não tiver um propósito claro e um bom planejamento, o desencorajamento o levará a desistir.

Falta de firmeza de propósito

A Bíblia diz, em 1Coríntios 14.8: "Pois também se a trombeta der som incerto, quem se preparará para a batalha?" O som incerto normalmente é resultado do líder que não tem visão ou que está tentando sobreviver, baseado na visão do outro. O que precisa acontecer é um sonido que brote de dentro do líder, como resultado da visão que ele tem desenvolvido. Somente quando começarmos o processo olhando para dentro de nós é que estaremos pisando em terreno firme, o qual nos ajudará a vencer as dificuldades que são e serão enormes.

Qual é o seu sonho, quais são as coisas que fazem seu coração palpitar mais rápido?

Beethoven via-se como um compositor e a sua surdez não o impediu de alcançar o seu sonho. Platão via-se como um grande pensador e o fato de andar de muletas não representou um empecilho para ele. William Carey era uma pessoa simples que pertencia a uma pequena igreja batista no interior da Inglaterra, o que não o impediu de se tornar o pai das missões modernas. Joni Eareckson Tada é uma mulher tetraplégica, mas isso não a impediu de ser uma grande escritora e palestrante, que tem influenciado milhões de pessoas pelo mundo. John Bunyan era um presidiário, mas isso não o impediu de abençoar o mundo com o seu livro O peregrino. Madre Teresa era uma mulher fisicamente frágil, tímida e de origem humilde, mas isso não a impediu de inspirar o mundo por meio de seu ministério na Índia. Júlio César, o imperador romano, era epiléptico, mas isso não o impediu de conquistar o mundo. Händel era um deficiente físico, mas isso não o impediu de compor a obra-prima da música sacra cristã de todos os tempos. Sílvio Santos era apenas um caixeiro viajante, mas isso não o impediu de se tornar o maior empresário da comunicação da história do Brasil. Paulo, o apóstolo, estava preso, mas isso não o impediu de alcançar o mundo com o evangelho.

As dificuldades virão, mas os modelos estão aí, para nos inspirar. Tudo começa dentro de você, com o fogo que incendeia sua alma. Cuide dele com atenção, pois este fogo será o responsável pela sua grande realização.

CAUSAS EXTERNAS

Como no caso das razões internas do desencorajamento, existem várias causas externas que provocam o abatimento na vida e ministério de um líder. Vejamos algumas delas.

Críticas

Sabemos que, no geral, críticas são ferinas e não poupam ninguém.

Porém, alguém já disse que, para evitar críticas, a receita é a seguinte: "não diga nada, não faça nada e não seja nada, mesmo assim talvez isso não funcione, porque provavelmente você será chamado de inoperante". Logo, se você deseja impactar este mundo para Cristo ou mesmo se simplesmente deseja viver, é impossível não sofrer críticas.

Nem mesmo Jesus, sendo o Senhor do Universo, esteve livre de críticas. Ele foi chamado de samaritano (o que era uma ofensa naquela época), de companheiro de pecadores, beberrão, glutão e até mesmo de endemoninhado. Se o próprio Senhor foi criticado com acusações sem fundamento, quanto mais nós! A beleza do exemplo de Jesus está no fato de que ele não se tornou amargo. Muito pelo contrário. Ele guardou o seu coração da contaminação pela ira e desilusão, e, mesmo criticado e incompreendido, não se tornou derrotado ou desencorajado.

Problemas

Os problemas estão ao nosso redor o tempo todo, e devemos nos conscientizar disto. A questão principal não é se teremos ou não problemas, pois eles com certeza virão. O que importa é a maneira como reagimos a eles. São as nossas reações, e não os problemas em si, que tendem a nos desencorajar.

"O que são problemas? Os problemas são um prognóstico que nos ajuda a formar o nosso futuro. Os problemas são um lembrete de que não somos autossuficientes, de que precisamos de Deus e dos outros. Os problemas são oportunidades, porque nos desestabilizam e nos levam a pensar criativamente. Os problemas são bênçãos, porque abrem portas para nós passarmos que, normalmente, estariam fechadas. Os problemas são lições e cada novo desafio é um novo professor. Os problemas são mensagens, pois nos avisam de desastres em potencial. Os problemas são soluções, porque não existem problemas sem soluções."

Muitos anos atrás, eu li um pequeno livro intitulado Perfil de três reis. Naquele livro, o autor, com muita perspicácia, criou um cenário imaginário dos diálogos feitos durante o confronto de Davi com Golias. Ele descreveu a cena mais ou menos assim:

"Quando Davi estava se preparando para lutar com Golias, o exército de Israel disse a ele: 'Você é louco, Davi! Olhe o tamanho de Golias, ele vai aniquilá-lo!' Davi respondeu-lhes: 'De modo algum. Enquanto vocês olham para Golias e dizem que eu estou perdido, eu olho para o tamanho dele e penso: eu não posso errar!'"

Esse simples diálogo imaginário ensina-nos que, na maioria das situações pelas quais passamos, é sempre possível desenvolver uma atitude positiva. Tudo é uma questão de perspectiva. Enquanto para o exército de Israel o tamanho de Golias era motivo de temor, para Davi era motivo de encorajamento, pois seria quase que impossível errar um alvo tão grande. Se o líder aprender a desenvolver esse tipo de perspectiva, será capaz de ver os obstáculos como oportunidades e não como motivo de desencorajamento.

A palavra crise, em japonês, significa o ponto de intersecção entre o perigo e a oportunidade. Na crise, o perigo e a oportunidade andam juntos. A atitude que tomamos determina o nosso sucesso ou fracasso. A crise decorrente da crítica pode ser vista, da mesma forma, como perigo, tensão ou oportunidade, dependendo da nossa reação a ela.

Demora para obter sucesso

O obreiro que, logo de início, alcança muito sucesso em seu ministério geralmente terá um grande desafio pela frente, que será o de manter um desempenho constante, que alcance as grandes expectativas de sua comunidade. O começar bem é algo maravilhoso. O maior desafio, no entanto, é o de manter o curso e terminar bem a carreira.

Ao chegar em uma igreja, o obreiro quase sempre lidera a partir da posição que lhe é conferida. A sua posição lhe confere responsabilidades e privilégios, mas não lhe outorga automaticamente a admiração, amor e submissão dos liderados, pois estes ainda não o conhecem pessoalmente. Portanto, normalmente ele chega com ideias próprias que coloca em prática. Alguns se animam, a maioria espera para ver o que acontecerá.

Como ainda não revelou a si mesmo para o seu povo, ele ainda não obteve da comunidade a permissão para liderar. Sua plataforma de autoridade vem somente da sua posição. Com o tempo, pode ser que a comunidade perceba algumas facetas de sua personalidade e ministério que não se encaixam com aquilo que esperavam. Como consequência, ele, que liderava somente a partir de sua posição, perde essa posição e tem que sair da igreja.

Portanto, o líder deve ter em mente que não deve se desencorajar quando não for imediatamente bem-sucedido, mas deve manter a calma, pois a construção de relacionamentos leva tempo. Demora um pouco para que ele conquiste a confiança das pessoas e vice-versa. O importante é não desistir.

Uma pesquisa feita pela Associação Americana de Telemarketing (ATA) para medir a eficiência dos vendedores produziu o seguinte resultado:

"48% de todos os vendedores fazem apenas uma chamada por cliente e não conseguem realizar a venda; 25% fazem duas chamadas e também não são bem-sucedidos; 15% fazem três chamadas e desistem; 12% dos vendedores não desistem com poucas chamadas, continuam sempre tentando e fazem 80% de todas as vendas."

Mudanças

Não existe algo a que ofereçamos maior resistência do que às mudanças. Experimente propor uma mudança na instituição na qual você trabalha, especialmente se ela já tiver muitos anos de atividade! Eu quase posso lhe garantir que haverá conflitos. Essa resistência ocorre em razão de que tudo se desenvolve — pessoas e instituições — a partir da criação de hábitos que, uma vez consolidados, tornam bastante difícil a introdução de mudanças. O desenvolvimento de novos hábitos em substituição aos anteriores é sempre um processo complicado, que envolve muito mais do que uma proposta de mudança. Envolve fatores como cultura organizacional, dinâmicas de renovação, administração de conflitos gerenciais e geracionais, e formação de novos hábitos.

Poucas áreas sofrem mais em relação aos conflitos do que a do relacionamento intergeracional. Isto se deve, na maioria das vezes, a uma ausência do entendimento da relação profunda e interdependente entre as gerações. Como nada acontece no vácuo, podemos dizer que as gerações se relacionam da seguinte maneira: a mais antiga passa para a seguinte os valores que lhe foram passados pela anterior. A segunda, que recebeu os valores da primeira, tem a função de receber o tesouro dos valores e tradições, analisá-los e propor mudanças e inovações. Tal processo de receber, analisar criticamente, conservar e inovar é o que chamamos de mudança.

Assim, o passado, o presente e o futuro sempre se encontram em cada geração. A geração que perde a capacidade de criar está morta. A geração que perde a capacidade de interpretar o passado acaba se perdendo e desconectando-se da sua identidade, levando a geração seguinte a se radicalizar para sobreviver.

Outro bom exemplo de mudança à qual há resistência é a introdução de novos líderes. Nesse caso, não há um confronto direto em relação ao novo líder. Sua liderança aparentemente é aceita, mas as críticas contra ele são constantes, causando-lhe um grande desencorajamento.

Quando isso acontece, os responsáveis pelas críticas já ocupam uma posição de liderança. Fruto de sua insegurança, diante da chegada de uma nova pessoa, eles buscam primeiro cooptá-la. Não conseguindo, passam a desacreditá-la para tentar manter-se em evidência e diminuir o impacto da chegada da nova liderança.

A solução, a longo e médio prazo, é investir no treinamento de novos líderes, preferencialmente levantados de dentro da comunidade, e suportar, em amor, a situação conturbada decorrente das críticas dos líderes já existentes.

A curto prazo, contudo, a atitude a ser tomada em relação aos líderes já existentes é a de exortá-los, se a pessoa estiver em posição para fazê-lo. Geralmente, os líderes evitam praticar a exortação por medo do fracasso e das possíveis consequências em relacionamentos. Contudo, o líder não deve temer, pois o Senhor irá honrá-lo. A precaução que deve ser tomada, nesses casos, antes de exortar o outro, é a de checar a si mesmo, para verificar se ele próprio está modelando a integridade que irá exigir do outro. Se estiver, então exorte-o, porque nesse caso o outro não poderá acusá-lo de coisa alguma.

A coragem para exortar constitui um exercício para vencer o medo. Não é fácil, pois toda pessoa teme o fracasso. Muitas vezes, a liderança da igreja controla o líder economicamente e este, temeroso de perder sua função e não ser capaz de prover o sustento de sua família, sucumbe ao temor.

O domínio econômico é o mais tirano. Para manter sua situação, o líder se submete, perdendo a sua dignidade e seu valor. Portanto, se o líder estiver em paz com a sua consciência, deve tomar a atitude de exortar a liderança e arcar com as consequências que vierem, mesmo que sejam as piores possíveis, tendo fé de que o Senhor proverá para ele.

CONSEQUÊNCIAS

A história de Elias que vimos há pouco mostra que temos muito a perder ao nos deixarmos levar pelo desencorajamento. As consequências são preocupantes.

Autoimagem distorcida

Se nos deixarmos dominar pelo desencorajamento, como ocorreu com Elias, este tem a capacidade de afetar a nossa autoimagem: "Basta; toma agora, ó Senhor, a minha alma, pois não sou melhor do que meus pais" (1Rs 19.4). Como Elias poderia se julgar dessa forma, quando seus pais são anônimos na Bíblia, mas ele foi o que derrotou os quatrocentos profetas de Baal? Os feitos e as realizações dele são, na verdade, muito maiores do que os de seus pais. Porém, quando somos desencorajados por alguma situação pela qual passamos, tal desencorajamento faz com que menosprezemos a nós mesmos, sentindo-nos sem valor, quando na realidade não somos assim.

Abandono de responsabilidades

Em 1Reis 19.9 está escrito: "Ali, entrou numa caverna, onde passou a noite; e eis que lhe veio a palavra do Senhor e lhe disse: Que fazes aqui, Elias?" O segundo aspecto resultante do desencorajamento é que este nos leva a abrir mão de nossas responsabilidades. Elias não poderia estar ali, naquela caverna. O lugar dele era outro. Por esta razão, Deus lhe pergunta sobre o que estava fazendo ali. Elias, assim como nós, não fora criado para viver nas cavernas. Fomos criados para o monte Carmelo. A fé nos conduz ao ministério, mas o desencorajamento e o temor nos conduzem à miséria.

Acusação

Em 1Reis 19.10, Elias disse: "os filhos de Israel deixaram a tua aliança, derribaram os teus altares e mataram os teus profetas à espada; e eu fiquei só, e procuram tirar-me a vida". O desencorajamento nos tenta a acusar outras pessoas, colocando nelas a culpa pelas nossas tribulações, como se o problema fosse elas e não nós mesmos. Assim, apontando o dedo para os outros, isentamo-nos da nossa própria parcela de culpa, em face da situação que vivemos.

Realidade distorcida

Em 1Reis 19.18 está escrito: "Também conservei em Israel sete mil, todos os joelhos que não se dobraram a Baal, e toda boca que o não beijou". O desencorajamento gera em nós a tendência de alterar a realidade, criando situações que não são verdadeiras. O profeta afirmou que ele era o único que havia permanecido fiel a Deus. Porém, o Senhor lhe mostrou que isso não correspondia à verdade. De fato, havia outros sete mil israelitas que tinham resistido à tentação da idolatria.

REAGINDO POSITIVAMENTE

Apesar de críticas e desencorajamento serem terríveis e inevitáveis, é possível lidar com eles eficientemente. Pense e adote essas sugestões:

Espere receber críticas

Se sabemos que críticas com certeza virão, temos a possibilidade de tirar vantagem disso, no sentido de nos prepararmos para reagir a elas com uma atitude positiva e correta quando acontecerem. É prudente desenvolver, mentalizar e orar por maneiras de reagir ao criticismo por meio de instrumentos que não sejam tão negativos.

Seja otimista

Uma das formas de combater o desencorajamento é partir para a ação positiva. O derrotismo não vai levar ninguém a lugar algum. Deste modo, assim que a pessoa estiver certa acerca da fonte, da origem de seu desencorajamento, deve procurar tratar dela imediatamente.

Ficamos otimistas ao entregar nossos pensamentos a Deus. A Bíblia nos diz que somos vencedores em todas as coisas (Rm 8.37). Este é um pensamento positivo maravilhoso. Se adotarmos uma perspectiva positiva, aquilo que pensamos tem grande chance de dar certo. Não se trata de seguir a teoria do pensamento positivo, mas de acreditar na Palavra de Deus, que nos incentiva a pensar desse modo.

Além disso, outra forma de ser otimista é lembrando que as críticas podem ser um alerta que o líder sábio desejará entender a fim de agir para sanar. Alguém, certa vez, disse: "A maioria das críticas de um seguidor corresponde a necessidades deste que não estão sendo supridas". Isso não implica em criar uma falsa expectativa de que o líder deva tentar suprir todas as necessidades dos seguidores, o que seria uma tarefa impossível de ser executada, mas sim que, ao ouvir as críticas, ele buscará reagir de forma compreensiva, não permitindo o surgimento da desmotivação e da amargura em seu coração.

Aqui vão algumas sugestões de um autor desconhecido citadas em muitas obras literárias, que podem ajudar o leitor nesta jornada: "avalie suas próprias atitudes; entenda que a fé é mais forte do que o temor do fracasso; deseje mudar, pois não se pode fossilizar; procure ter constantemente a reação correta; vença o mal com o bem".

A seguir temos algumas atitudes para vencer o desencorajamento, relacionadas a referências bíblicas de apoio. Utilize-as como um instrumento de ajuda para superar seus conflitos e desestímulos:

• Nunca desistirei, desde que saiba que estou certo (Ap 2.10);
• Creio que todas as coisas contribuirão para o meu benefício (Rm 8.28);
• Serei corajoso e firme diante dos sofrimentos (1Pe 4.12-16);
• Não permitirei que ninguém me intimide ou me impeça de alcançar os meus alvos (Fp 3.14);
• Lutarei para vencer todas as traições e barreiras físicas (Rm 8.31-39);
• Eu me revigorarei na fé, por saber que todos os homens e mulheres de fé vitoriosa tiveram que lutar contra a adversidade e a derrota (Hb 11);
• Nunca me entregarei ao desencorajamento ou ao desespero, não importa os obstáculos que tiver à minha frente (Rm 8.37).

Busque exemplos positivos e seja você mesmo um deles

Busque exemplos de pessoas que passaram por situação semelhante à sua e conseguiram superá-la. Procure observar e aprender por meio desses exemplos. Eles podem ser encontrados em personagens bíblicos, históricos ou contemporâneos. Tais exemplos tornam-se nossos mentores e melhores incentivadores para vencer o desencorajamento e seguir adiante.

Lembre-se de que o líder deve modelar as pessoas. A postura que o líder deseja ver em seus seguidores deve ser exemplificada em suas próprias reações diante das críticas que recebe. As atitudes do líder determinam o tipo de relacionamento que ele terá com seus seguidores. Em outras palavras, a maneira como o líder age e reage pode chocar seus seguidores ou inspirar neles admiração e respeito.

Lembre-se de que sua atitude será a diferença entre o fracasso e o sucesso

Na encruzilhada do momento crucial no qual tem que decidir que atitude irá tomar, a pessoa precisa lembrar que as consequências da atitude tomada é que determinarão seu sucesso ou fracasso. Portanto, desenvolva uma atitude positiva diante da adversidade. Se aquele for um momento estratégico, ela pode representar o diferencial entre ser bem ou malsucedido. O líder deve desenvolver uma disciplina mental e criar o hábito de analisar essas situações de uma maneira diferente, perguntando-se: O que posso aprender de construtivo nesta situação? Na resposta a esta pergunta pode estar o segredo do seu sucesso ou o embrião do seu fracasso.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Superando o Desencorajamento
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Reflita sobre um momento em que você se sentiu desencorajado como líder. O que causou esse desânimo?',
     'reflexao', null),
    (v_aula_id, 2,
     'Identifique três estratégias práticas que você pode adotar para lidar com o desencorajamento quando ele surgir.',
     'reflexao', null),
    (v_aula_id, 3,
     'Escolha um mentor ou confidente com quem você pode compartilhar suas lutas emocionais e espirituais, e agende uma conversa para discutir maneiras de manter-se motivado.',
     'reflexao', null);
  end if;
end
$migration$;
