-- =============================================================
-- Curso: Cultura da Honra — Danny Silk
-- Transcrição do livro na íntegra, dividida por capítulo na ordem
-- de leitura. As atividades de cada aula são perguntas de reflexão
-- (tipo='reflexao') elaboradas a partir do conteúdo do capítulo —
-- não bloqueiam o avanço e ficam disponíveis para devolutiva
-- pastoral. Cabeçalhos de seção em CAIXA ALTA renderizam como
-- títulos (ver ehTitulo() em components/AulaConteudo.tsx).
--
-- Idempotente: pode ser reaplicada sem duplicar curso/aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos
  where slug = 'cultura-da-honra';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values (
      'cultura-da-honra',
      'Cultura da Honra',
      'Estudo guiado a partir de Cultura da Honra: vivendo em uma atmosfera sobrenatural, de Danny Silk, sobre a cultura de honra desenvolvida na Bethel Church (Redding). O livro mostra como criar um lugar seguro, governar a partir do céu, tratar as pessoas pela identidade que Deus lhes deu e confrontar de um jeito que restaura em vez de punir. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para você examinar como lidera, honra e cria cultura.',
      '/api/og/curso/cultura-da-honra',
      false,
      0,
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  end if;

  -- ---------------------------------------------------------------
  -- Prefácio  (aula ordem = 1)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 1;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Prefácio$t$,
      1,
$conteudo$U ma mulher adúltera foi lançada aos pés de Jesus. Ela sabia que a punição

para o seu pecado era o apedrejamento público. O fato de ter sido surpreendida no próprio ato apenas aumentava a vergonha e intensificava seu medo de uma morte dolorosa. Seus acusadores se levantaram confiantes porque a Lei de Deus sustentava a posição deles. Eles seguravam as pedras que em breve tirariam sua vida, enquanto ela esperava pela demonstração de indignação por sua total desconsideração ao padrão de santidade de Deus. Então o Mestre começou a escrever na areia.

Não sabemos o que Ele escreveu. Tudo o que sabemos é que a atmosfera criada pelos escritos do “doador da graça” desarmou completamente os acusadores da mulher. Eles fugiram enquanto a graça de Deus expulsava os julgamentos dos homens tão depressa quanto a luz desaloja as trevas. Essa é a superioridade da graça.

Ninguém precisou dizer à mulher para colocar sua fé em Cristo. A atmosfera cheia de graça fez da fé em Jesus sua reação mais lógica. Talvez seja por isso que o apóstolo Paulo nos ensinou que a fé é “segundo a graça” (Romanos 4:16). A raça é a atmosfera criada pelo amor que torna a fé a única reação razoável.

Poucas coisas me deixam mais maravilhado do que uma demonstração autêntica da graça de Deus. Toda vez que a presença de Deus permite que uma pessoa se torne livre de problemas que duraram toda uma vida, não se pode evitar ficar assombrado com um Salvador tão maravilhoso. Mas a graça vai além da cura do passado: ela também nos lança em nosso destino divino.

Li este manuscrito com grande alegria. Mas também o li com muitas lágrimas ao relembrar as situações impossíveis que enfrentamos juntos como família na igreja. Eram tipos de problemas que só Deus podia curar. E Ele o fez, uma vez após a outra. É essa mesma graça que goteja das páginas deste livro. Não é uma nova teologia. É apenas uma manifestação mais clara do plano original — o coração de Deus revelado na pessoa de Jesus Cristo. Mas essa é apenas metade da história, pois a graça éapenas uma das expressões dessa força revolucionária do Reino de Deus manifesto na terra — a cultura da honra.

Quando ensino sobre a cultura da honra, quase todas as pessoas dizem “amém” para demonstrar que já creem nela e a apoiam. Logo após a mensagem, as pessoas me dizem que também possuem uma cultura de honra. Mas a reação émuito diferente quando elas têm a chance de vir à nossa igreja, a Bethel Church, por uma semana ou duas e observar a interação entre a equipe e a família da igreja. Invariavelmente, todas elas saem nos pedindo que, por favor, lhes ensinemos a desenvolver a cultura da honra como um modo de vida reformador. Dar honra realmente libera a vida de Deus em uma situação.

Muitas pessoas vivem em atmosferas destituídas de honra e buscam desesperadamente a nossa ajuda para criarem essa cultura. Pastores costumam nos pedir para ensinarmos suas igrejas e equipes a demonstrarem honra. A necessidade é real, e o desejo é genuíno. Mas essa cultura nunca é construída em torno do que “eu necessito”. Ela é construída em torno do que “eu posso dar”. E se não aprendermos a dar isso àqueles que menos merecem, continuaremos a viver em um ambiente sem honra.

Eu absolutamente amo este livro, Cultura da Honra. Esperei por muito tempo para ver esse modo de vida revolucionário capturado e colocado em palavras. Embora muitos da minha equipe ensinem sobre esse tema, Deus deu a Danny Silk a melhor linguagem para expressá-lo. E os tesouros que ele conquista para o Mestre por meio de suas percepções maravilhosas estão se tornando lendários. Ao levar a presença de Jesus, que nos dá poder, em tudo o que faz, Danny vive para mostrar o valor de Deus em cada pessoa a quem serve, não importa que posição ela tenha em sua vida.

A igreja precisa de uma reforma radical. Creio que este livro faz parte da receita de Deus para tratar essa necessidade. À medida que tivermos êxito, estaremos posicionados para ajudar a levar as cidades do nosso mundo à transformação. E será uma transformação por meio da honra — aquela que transmite tão lindamente a graça de Deus.

Bill Johnson

Pastor sênior da Bethel Church

Redding, Califórnia

Autor de O Poder Sobrenatural de Uma Mente Transformada e

Quando o Céu Invade a Terra

PRÓLOGO

E ntendo que neste livro desafio o que muitos consideram como verdade,

pois reorganizo paradigmas muito antigos. Apesar disso, vejo-me avançando com ousadia em uma trajetória para trazer luz sobre váriostópicos que hámuito têm sido mantidos em um tipo de trevas pela minha amada comunidade, a igreja. Por ser o primeiro cristão em minha família, existem muitas tradições culturais que não afetaram diretamente a minha vida ou família. E também há muitas tradições que ainda não foram firmadas em meu caráter nem fortaleceram meu legado. Infelizmente, considero algumas dessas tradições altamente injustas e creio que elas são uma representação negativa Daquele que passei a conhecer como meu Senhor. A “cultura da honra” é uma concorrente para esses valores essenciais e abordagens muito antigos que se pode facilmente encontrar na cultura da igreja cristã contemporânea.

Não tenho a intenção de desrespeitar ninguém ao apresentar este ponto de vista. Ele confronta e redefine o que conhecemos sobre liderança, autoridade e disciplina na igreja, literalmente há séculos. Por favor, saiba que tenho consciência de que tudo isso ainda é uma “grande experiência” na Bethel Church e que temos muito a aprender sobre como exercer a mordomia de um ambiente de liberdade. Ainda assim, apresentarei o que aprendemos até agora.

Paz!$conteudo$
    )
    returning id into v_aula_id;

  end if;

  -- ---------------------------------------------------------------
  -- Introdução  (aula ordem = 2)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 2;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Introdução$t$,
      2,
$conteudo$N estas páginas, você encontrará o que um de meus amigos chama de

“receita”. Os ingredientes dessa receita são um conjunto de crenças e práticas. Os passos dessa receita combinam os ingredientes de tal maneira que eles criam algo poderoso — um ambiente incomum na terra hoje. É um ambiente que atrai e abriga a presença de Deus. Nós, da Bethel Church, em Redding, Califórnia, chamamos esse ambiente de a cultura da honra. Isso não significa que é somente a nossa “receita” que cria uma cultura que abriga a presença de Deus, mas podemos dizer-lhe que é algo que funciona.

Quando Deus fala sobre honra pela primeira vez nos Dez Mandamentos, Ele promete que a nossa recompensa por honrarmos nossos pais será uma longa vida. Na Bethel Church, cremos que essa ordem revela um princípio de honra em geral. Costumamos dizer: “A vida flui através da honra”.

O princípio da honra especifica que reconhecer com exatidão quem as pessoas são nos posicionará para dar a elas o que merecem e para receber o presente de quem elas são em nossas vidas.

A honra gera relacionamentos que dão vida e promovem vida. O segredo aqui é “reconhecer com exatidão quem as pessoas são”. Só podemos fazer isso quando reconhecemos as identidades e os papéis que Deus deu a elas. Éisso que vemos na afirmação de Jesus: “Quem recebe um profeta, no caráter de profeta, receberá o galardão de profeta; quem recebe um justo, no caráter de justo, receberá o alardão de justo”.[1]Nomes e títulos são importantes. Mãe, pai, filho, filha, apóstolo, profeta, cristão, ser humano — esses nomes definem o papel e a identidade de uma pessoa e, quando usados corretamente, estabelecem relacionamentos designados por Deus onde “recompensas” específicas são dadas e recebidas para nos edificar e fortalecer.

Uma cultura de honra é criada na medida em que uma comunidade aprende a discernir e a receber as pessoas em suas identidades dadas por Deus. Ao longo deste livro, exploraremos alguns dos “nomes” que nos permitiram estabelecer tipos de relacionamentos muito específicos na comunidade Bethel. São esses relacionamentos que atraem e sustentam o derramamento da presença e do poder de Deus em nosso meio. Os nomes “apóstolo”, “profeta”, “mestre”, “pastor” e “evangelista” e suas respectivas unções, mentalidades e dons distintos criam uma rede de relacionamentos destinada a trazer o foco e as prioridades do Céu à terra. Nomes como “filhos livres” e “filhos da luz” definem a maneira como devemos honrar uns aos outros e nos relacionar uns com os outros, particularmente quando tratamos de áreas de comportamento e relacionamentos que precisam de disciplina e restauração. Nomes descritivos como “realeza”, “riqueza” e “benfeitor” moldam a forma como nos relacionamos com os nossos recursos e com a comunidade mais ampla que a igreja é chamada a se conectar e abençoar com o amor e o poder do Céu.

Em uma cultura de honra, os líderes lideram com honra, tratando corajosamente as pessoas de acordo com os nomes que Deus lhesdáe não de acordo com os apelidos que elas recebem de outras pessoas. Eles as tratam como filhos e filhas livres e não como escravos; como justos, e não como pecadores; como ricos, e não como pobres. Os líderes também reconhecem a independência dessas pessoas nas diversas unções que Deus distribuiu entre seus líderes e de acordo com o projeto divino para cada uma, como uma equipe que gera um “funil” que desce do Céu à terra. Eles lideram ensinando e pregando um Evangelho que reconhece com exatidão a identidade de Deus como bom, como amor e como shalom, e procuram por manifestações claras dessas realidades como sinais de que a presença de Deus é realmente bem-vinda na cultura. E na segurança e liberdade que cresce à medida que a Sua presença aumenta, os líderes lideram desenvolvendo formas de ajudar as pessoas a conviverem umas com as outras em uma cultura livre. Eles têm ferramentas para o confronto que são compatíveis com as identidades dadas por Deus às pessoas. Eles são motivados pela paixão por proteger e aumentar as conexões que Deus está construindo entre nós. Finalmente, os líderes em uma cultura de honra lideram o povo naturalmente, estendendo a honra do Reino à comunidade mais ampla e criando formas para que nossas cidades experimentem a vida que flui entre nós.

A vida flui através da honra. O fruto que se manifesta claramente quando se estabelece uma cultura de honra é que a vida de ressurreição de Deus começa a fluir para as vidas, os lares e as comunidades, trazendo cura, restauração, bênção, alegria, esperança e santidade. Se não vemos esse fruto, então precisamos nos perguntar se estamos realmente honrando aqueles que nos cercam como devíamos. Como você verá nas páginas seguintes, estou convencido de que existem alguns padrões de relacionamento na igreja que se baseiam em versões falsas de quem as pessoas são, cujo conceito precisamos confrontar e derrubar se esperamos ver a vida abundante crescer em nosso meio.

Minha oração e esperança é que este livro o guie enquanto você busca os ingredientes e passos para criar uma cultura ao seu redor que receba a presença de Deus. Não há dúvidas de que este livro é apenas um começo, mas é um grande começo!$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Danny diz que 'a vida flui através da honra' e que honrar é reconhecer com exatidão quem a pessoa é, tratando-a pelo nome que Deus lhe deu e não pelo apelido que ela carrega. Pense em alguém que você lidera ou discipula hoje: que 'nome' o ambiente colou nessa pessoa que você precisa corajosamente trocar pelo nome que Deus deu a ela?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O texto afirma que existem padrões de relacionamento na igreja baseados em 'versões falsas de quem as pessoas são', que precisam ser confrontados e derrubados para que a vida abundante cresça. Que versão falsa de identidade você percebe operando na sua mesa, na sua casa ou na sua liderança — e o que ela tem impedido de florescer?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Danny propõe um teste simples: se não vemos o fruto (cura, restauração, alegria, vida) fluindo, é hora de nos perguntar se estamos realmente honrando os que nos cercam. Olhando para o fruto concreto nos seus relacionamentos de liderança neste momento, o que ele revela sobre o quanto você tem de fato honrado essas pessoas?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 1 — Uma cultura sobrenatural  (aula ordem = 3)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 3;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 1 — Uma cultura sobrenatural$t$,
      3,
$conteudo$“Não por força nem por poder, mas pelo meu Espírito”, diz o Senhor dos Exércitos. Zacarias 4:6 S e você já ouviu falar da Bethel Church, em Redding, Califórnia, é provável que tenha escutado testemunhos dos eventos sobrenaturais que ocorrem ali regularmente, particularmente dos milagres de cura. O que você talvez não tenha ouvido é que esses acontecimentos sobrenaturais estão diretamente relacionados à cultura sobrenatural que a comunidade dos santos na Bethel tem desenvolvido há mais de uma década. O coração dessa cultura é a convicção de que Jesus foi o modelo de vida cristã para nós. Jesus explicou que todas as coisas sobrenaturais que aconteciam por meio dele fluíam diretamente de Sua relação íntima com Seu Pai, e essa mesma relação foi o que Ele veio nos dar por intermédio de Sua morte e ressurreição. Portanto, manter um estilo de vida sobrenatural, em que os sinais e maravilhas nos seguem, depende totalmente de vivermos a nossa verdadeira identidade como filhos e filhas de Deus. Armados com essas verdades, os líderes da Bethel entendem que o seu papel principal é capacitar os santos para conhecerem a Deus e para andarem na plenitude de quem o Pai diz que eles são. Àmedida que esses valores foram ensinados e demonstrados, um grupo de pessoas cresceu com fé e coragem para trazer o Céu à terra.

Para ajudá-lo a entender a cultura de capacitação sobrenatural da Bethel, quero lhe mostrar como ela é. Vou compartilhar algo que aconteceu em nossa Escola de Ministério Sobrenatural há sete anos. A partir desse incidente, centenas de outros como ele foram acrescentados à lista, mas essa história em particular é o caso clássico ao qual nos referimos quando ensinamos nossa equipe a criar um lugar seguro. (Essa expressão será explicada em maiores detalhes no capítulo intitulado “A Prioridade Máxima da Liderança”.)

Para definir o cenário dessa história, preciso mencionar que cada membro da nossa equipe tem grande alegria em nossos formandos do primeiro ano. Temos muito orgulho do zelo e do amor deles pelo avivamento. Depois de cada recesso de verão, nossa equipe entrevista os formandos que retornam para o segundo ano, e isso sempre reacende o entusiasmo deles em passarem outro ano com as pessoas incríveis que chamamos de nossos alunos. Esses alunos do segundo ano são os melhores e se tornamlíderes da nossa nova leva de alunos do primeiro ano.

Houve um ano em que tivemos dois alunos de primeiro ano, pessoas incríveis, que eram líderes de louvor e de outras atividades ministeriais. Depois de se formarem no primeiro ano, eles decidiram se casar em dezembro, após frequentarem o segundo ano. Então, eles se inscreveram no segundo ano e foram aceitos. É claro que foram — eles são incríveis!

Pouco depois do início do segundo ano, Banning Liebscher, pastor do segundo ano, procurou-me e disse:

— Temos um problema. Tenho dois alunos que me confessaram que fizeram sexo durante o verão.

Perguntei-lhe o que ele iria fazer. Então Banning disse:

— Bem, se fazer sexo fosse tudo o que aconteceu, esse não seria um grande problema. Eles pararam cerca de um mês antes de a escola recomeçar e estão realmente arrependidos. E eu realmente acreditei naquele cara quando ele me disse isso.

— O que mais está acontecendo? — perguntei.

— Acabei de descobrir que ela está grávida — ele disse.

Bem, essa era uma situação mais complicada — uma aluna solteira, grávida, do segundo ano da Escola Bethel de Ministério Sobrenatural, andando pelos corredores. Isso era algo que teríamos de explicar. Percebi certo temor nos olhos de Banning. Ele sabia que teríamos de retirar esses dois alunos da escola. Essa era a primeira vez que ele, comolíder, tinha de enfrentar um cenário tão extremo.

Eu disse:

— Vamos nos encontrar com eles e conversar sobre isso.

Assim, Banning e sua pastora assistente Jill entraram em meu gabinete, acompanhados dos dois alunos. Ora, eu não os conhecia e eles não me conheciam. Nenhum deles fez contato visual comigo quando entrou no meu gabinete. A cabeça deles estava baixa e seus olhos fitavam o chão. Ficou claro que eles estavam absolutamente envergonhados do que haviam feito, e eles entraram esperando que nós os puníssemos pelos seus erros. Eles não apenas acreditavam que mereciam ser julgados pelo pecado que cometeram, como também estavam bem conscientes da convicção generalizada de que os líderes da igreja devem proteger o grupo maior dos poucos rebeldes. Eles sabiam que tinham sido rebeldes e que aquela provavelmente seria “a conversa”. O que mais poderíamos fazer senão lhes dizer que os amávamos e lhes mostrar a saída?

Dei início ao processo, dizendo:

— Muito obrigado a vocês dois. Vocês não me conhecem nem sabem o que vai acontecer. Obrigado pela abertura e confiança que vocês acabam de demonstrar. Não tomamos nenhuma decisão porque realmente não sabemos qual é o problema. Vocês querem tomar um copo d’água? Vocês estão bem?

Depois que responderam, dirigi-me ao rapaz.

— Agora, preciso lhe perguntar qual é o problema.

Ele olhou para Banning, perplexo, e perguntou:

— Banning não lhe contou o que aconteceu? Ele não falou com você?

Pude perceber que a pergunta o deixara desconfortável.

— Sim, falou. Banning conversou comigo — respondi.

Ele perguntou:

— Você quer que eu diga?

— Se você sabe qual é o problema, eu quero que você me diga — eu disse. Meu pressentimento era de que ele provavelmente ainda não sabia qual era o problema.

— Fizemos sexo neste verão — um monte de vezes! — ele exclamou.

— Ora, eu pensei que vocês tivessem parado de fazer isso.

Ele disse:

— Sim, paramos totalmente. Paramos há cerca de um mês antes do início das aulas.

— Então, qual é o problema? — Perguntei novamente, tentando fazer com que ele buscasse mais profundamente em seu coração qual era o problema.

— Bem, ela está grávida — ele disse, procurando a informação seguinte que talvez eu não soubesse.

Perguntei:

— Bem, há alguma coisa que possamos fazer a respeito?

— Não! — Ele respondeu enfaticamente, transmitindo-me a mensagem clara de que o aborto não era uma opção. Ele estava claramente frustrado com as minhas perguntas. Aparentemente, ele não esperava ter de pensar tanto ao longo desse processo. Ele havia previsto uma punição, mas aquela conversa o estava pegando completamente de surpresa.

— Tudo bem, então qual é o problema? — Perguntei mais uma vez.

Ele olhou para mim por alguns instantes, sacudiu a cabeça e disse:

— Não creio que eu esteja entendendo a pergunta.

Eu ri. Banning e Jill riram. Todos nós rimos. Ninguém parecia saber qual era o problema, e todos estavam se perguntando onde eu queria chegar com a minha pergunta.

Finalmente eu disse:

— Se fôssemos passar o nosso tempo hoje resolvendo um problema, que problema seria?

— Não sei.

— Perguntei se ele havia se arrependido.

— Sim. É claro que sim — ele respondeu, como se essa não fosse uma pergunta difícil.

— De que você se arrependeu? — Perguntei.

Depois de uma longa pausa, ele admitiu:

— Não sei.

Eu disse:

— Tudo bem. Bem, isso é parte do problema, não é? Como você pode se arrepender de um problema se não sabe que problema é esse?

— Estou conseguindo entender o que você está dizendo. Éverdade.

— Então, precisamos encontrar um problema aqui para resolver — eu disse. — É sobre isso que temos de tratar. Deixe-me fazer-lhe mais algumas perguntas.

Meu plano era simplesmente fazer perguntas a ele. Eu não iria dizer-lhe o que eu pensava ou falar-lhe o que pensar. Não estava tentando convencê-lo dos meus pontos de vista impressionantes ou da minha percepção poderosa. Eu estava em busca da glória, da sabedoria e da capacidade daquele jovem. Ela precisava vir à tona a fim de que ele pudesse se lembrar de quem era nessa casa. A vergonha do seu erro havia feito ele se esquecer de quem era. Ele pensou que era uma dessas pessoas que precisavam ser chutadas e cuspidas, e estava pronto para que a nossa liderança o expulsasse para o meio da rua. As perguntas o conduziram, com a ajuda do Espírito Santo, a percorrer o seu interior em busca da sabedoria e do conhecimento que havia dentro dele e encontrar uma solução que transformasse sua vida para sempre.

Dei mais algumas ideias para ele.

— Diga-me, você sabia que não era uma boa ideia dormir com a sua namorada?

— Eu tinha plena convicção disso.

— Bem, então, o que aconteceu?

— Não sei — ele abaixou a cabeça, rompendo o contato visual.

Dei a ele uma escolha para considerar e uma oportunidade de continuar a conversa comigo.

— Você não sabe, ou não está querendo pensar mais sobre isso?

— Bem, provavelmente foi porque nós ficávamos acordados até tarde, assistindo a filmes na casa dela.

— Você acha? — Ergui as sobrancelhas.

— Mas eu tentei ir embora. Eu quis sair várias vezes. Eu dizia a ela que não devíamos estar naquela situação. Não devíamos estar ali fazendo aquilo. Dizia a ela que havíamos ido longe demais da última vez, e que não devíamos fazer isso.

Ele olha para ela timidamente, ela está franzindo os lábios e seu rosto está ruborizado, mas o medo do desconhecido e de estar naquela sala a mantém em uma espécie de paralisia verbal.

Ele continua:

— Ela ficava muito zangada comigo! Ela me dizia palavras duras e que eu a estava rejeitando, e as coisas se tornavam um inferno nos dias seguintes. Então eu simplesmente não dizia mais nada e ficava ali. Não estou dizendo que eu não gostei ou que não tive participação nisso. Tive sim, e muito. Simplesmente não valia a pena brigar com ela por isso.

— Certo. Então o que você está me dizendo é que você estava mais preocupado com o fato de ela ficar zangada com você do que em fazer o seu trabalho em protegê-la de você.

— Lentamente, ele respondeu:

— Sim.

— Então o que você está me dizendo é que quando está com pessoas zangadas acaba deixando que elas controlem quem você é. É isso que está me falando?

— Sim — ele disse timidamente.

— Então tudo o que é preciso para você abandonar o seu caráter e a sua integridade é que alguém fique zangado com você.

— Sim — ele estava começando a ter uma revelação.

Perguntei:

— Cara, é este o problema?

— Sim.

— Assim, se pudéssemos achar uma solução para esse problema, isso faria com que o nosso tempo hoje valesse alguma coisa para você?

— Totalmente.

Ele levantou os olhos novamente e fez contato visual, querendo esconder um sorriso. Eu pude perceber que ele estava inseguro por se sentir melhor quando aquele deveria ser um processo que o faria sentir-se pior com o que ele havia feito.

— Fantástico. Então vamos trabalhar nisso — eu disse, com um grande sorriso em meu rosto.

A sala inteira sentiu um ar de esperança. Banning e Jill estavam sorrindo. Eu pude sentir a expectativa deles e seu senso de responsabilidade em ajudar aquele jovem a lidar com o problema que ele acabara de identificar. Mas, em vez disso, voltei-me para a garota, que havia assistido a todo o processo com seu namorado. Eu podia ver que ela não queria passar pela mesma coisa. Seus braços e pernas estavam cruzados e seu queixo encostado no peito. Ainda assim, aventurei-me.

— Qual é o problema?

— Não sei — ela rebateu depressa, na defensiva.

— Você não sabe ou tem medo de pensar sobre isso?

— Não sei.

Eu disse calmamente:

— Posso ver que você está assustada. Não quero que tenha medo. Realmente quero ajudá-la a descobrir o que está fazendo com que você acrescente tanta dor à sua vida. Você vai me deixar ajudar?

Para poupar tempo, vou cortar o diálogo e dizer simplesmente que finalmente chegamos à revelação de que ela não confiava nas pessoas. Essa era uma fortaleza em sua vida, a qual se mostrava em inúmeros comportamentos. Ela lutava contra a desconfiança, e isso impedia que ela permitisse que as pessoas abençoassem a sua vida com palavras. Diversos alunos haviam tentado tratar da situação deles durante o verão, mas ela não permitia que isso afetasse as suas decisões. Ela se sentia como se aquelas pessoas estivessem querendo controlá-la, e o seu medo a cegava, impedindo-a de ver o cuidado e a preocupação que sentiam por ela. Esse problema devastara sua vida por muitos anos. Aquela jovem tinha medo, tinha tendência de isolar-se, muitas vezes era teimosa e se protegia dos outros. Fui até o fundo do problema com ela por meio do mesmo processo: perguntas. Eu só fazia perguntas — muitas e muitas perguntas, mas as perguntas certas.

Fazer as perguntas corretas da maneira certa é uma das chaves para se criar um lugar seguro. Um confronto bem-sucedido depende do quanto as pessoas que estão sendo confrontadas se sentem seguras. Se ignorarmos a necessidade delas de um lugar seguro, nós as predispomos a agir como pessoas egoístas, não amorosas, que se colocam na defensiva, que colocam a culpa em outros e que estão mais interessadas em salvar a sua própria pele do que em consertar os erros que cometeram. Então perdemos completamente quem elas realmente são e as culpamos por seu comportamento. Um processo que respeita a necessidade de confiança e honra terá um resultado totalmente diferente, porque permitirá que as pessoas sejam livres — livres do controle, da punição e do medo. É assim que confrontamos de acordo com o padrão do Reino. (Exploraremos esse processo mais plenamente em um capítulo posterior.)

Tínhamos duas pessoas na mesma situação com dois problemas totalmente diferentes. Ele tinha medo que as pessoas ficassem iradas com ele, e ela temia que as pessoas a controlassem. Quando descobrimos esses problemas, eles não esperavam mais ser decapitados por eles. Havíamos criado um lugar seguro para eles serem eles mesmos, as pessoas incríveis que realmente são. Então era hora de ajudá-los a consertar seus problemas e libertá-los da vergonha do erro.

Fiz outra pergunta:

— Quem é afetado por esses problemas na vida de vocês? É como se vocês passassem por uma sala com um grande balde de tinta e o deixassem cair. A tinta se espalhou por todo o lugar. Quem ficou sujo de tinta?

Eles começaram a se lembrar das pessoas a quem amavam, das pessoas que ainda não sabiam que ela estava grávida. Aqueles que os amavam, que acreditavam neles e que os tinham honrado. Estes eram os relacionamentos que eles queriam proteger: seus pais, irmãos, líderes da Escola de Ministério e líderes em casa. Sua pequena igreja local levantara uma oferta mensal para ajudar a pagar a mensalidade escolar do casal. A moça tinha um irmão novo convertido que a considerava uma pessoa incrível. Aqueles dois representavam Jesus para ele.

Foi como se Banning, Jill e eu pudéssemos ver aqueles dois lembrando todas essas pessoas uma após a outra, e quando elas vinham às suas mentes, eles entendiam o quanto aquela situação iria feri-los. Eles choraram enquanto relacionavam os nomes, finalmente sentindo a dor que aquele problema criara em suas vidas. Nossa equipe ficou sentada em silêncio, reconhecendo que aquela era a tristeza segundo Deus de que a Bíblia fala. [1] Ela estava conduzindo aqueles dois ao arrependimento, então precisávamos deixá-la fazer a sua obra e produzir o seu fruto.

Eles continuaram a soluçar. Nenhum tipo de ameaça ou punição poderia ter criado o que estava acontecendo dentro deles naquele instante. Era algo lindo, e tudo aconteceu de dentro para fora. Ninguém os obrigou a ver nada. Ninguém tentou convencê-los a se arrepender. Tudo isso veio à tona porque confiamos que eles tinham muito amor e respeito dentro deles, e porque fizemos as perguntas certas.

Depois que eles relacionaram as pessoas que seriam mais afetadas com a notícia da gravidez, Banning, Jill e eu mencionamos algumas pessoas que eles não incluíram, pessoas que eram importantes para nós. Perguntei:

— E quanto ao restante dos alunos do segundo ano? Como eles serão afetados por isto?

— Esta notícia irá afetá-los totalmente. Eles são nossos colegas de turma — disse ele.

Mas ela retrucou:

— Alguns deles se importarão, mas a maioria nem sequer precisa saber disso!

— Ah, isto é mais um pouco do mesmo problema? — perguntei a ela.

— O quê? — ela perguntou, parecendo não entender.

— Esta é mais uma vez em que você acha que precisa defender-se das pessoas que provavelmente mais se importam com você?

— Não sei — disse ela, sabendo que havia sido flagrada.

— Você não sabe ou você entende o que estou dizendo?

— Entendo o que está dizendo — ela admitiu.

— Bom. Obrigado por considerar isso. Agora, e quanto aos alunos do primeiro ano que veem vocês como líderes nesta comunidade? Como eles serão afetados por este problema? — dirigi-me especificamente a ela com essa pergunta.

— O quê? Eles são um monte de estranhos para nós! Por que eles seriam afetados por isto? — Ela bradou, irritada com a minha audácia.

Mas o namorado dela disse:

— Você está certo. Devemos ser líderes nesta escola. Eles serão totalmente afetados por nós e pelo que fizemos.

Perguntei a ela o que achava desse ponto de vista. Ela não gostou, mas concordou que isso poderia afetar alguns deles.

— Poderia ou irá afetá-los? — perguntei a ela. Eu estava comprometido em pressioná-la todas as vezes que aquele problema de confiança e vulnerabilidade tentasse impedi-la de mostrar o melhor de si mesma na situação.

— Irá! — Ela deixou escapar, seguido de um meio sorriso para me agradecer por não deixar que ela contornasse a situação.

Então perguntei:

— O que vocês vão fazer? Vocês criaram um problemão aqui. Sabemos quem está sujo de tinta. O que vocês vão fazer para limpar isso?

Eles percorreram a lista e começaram a propor soluções.

— Vamos telefonar para os membros da nossa família e vamos escrever cartas a essas pessoas. Vamos informá-las do que está acontecendo, arrependidos, e pedir que nos perdoem.

Perguntei a eles:

— De quanto tempo vocês precisam?

Depois de conversarem entre si, ele disse:

— Uma semana. Queremos uma semana para poder entrar em contato com a nossa família e consertar o problema.

— Tudo bem — eu disse. — Vamos esperar e cuidar dos alunos da Escola de Ministérios envolvidos no problema mais tarde.

E assim eles fizeram o que haviam dito. Ao longo da semana, entraram em contato com os membros de sua família e com os líderes de sua igreja e também procuraram os pastores Bill Johnson e Kris Valloton, além de alguns membros da equipe da escola. Aquelas pessoas não estavam mais prestes a ser expulsas da escola. Aquelas não eram mais pessoas que mereciam ser punidas. Eles se depararam com um rio de reações amorosas e de apoio por parte de quase todas as pessoas que abordaram. Houve algumas reações desfavoráveis, mas aquele casal recebeu graça mais do que o suficiente.

Veja, a vergonha é removida por meio do amor . A vergonha tenta manter as pessoas presas em seus erros convencendo-as de que não há nada que elas possam fazer, que são impotentes. Quando removemos amorosamente a vergonha de sobre eles, aqueles dois se tornaram poderosos novamente, enfrentaram as consequências e corrigiram seu erro. Tudo o que eles podiam fazer era consertar seu erro. Eles não podiam mudar o passado, mas podiam ir até aqueles a quem amavam e pedir perdão. Ao pedir perdão, eles estavam dizendo: “Por favor, permitam que eu manifeste o meu amor por vocês e proteja este relacionamento. Por favor, deixem-me consertar o meu erro”. O amor lançou fora o medo deles e os tornou poderosos outra vez.

Na semana seguinte, eles voltaram à escola. Banning e Jill encontraram um intervalo no horário das aulas. Banning ligou para o meu escritório e me pediu para ir até o segundo ano e facilitar a “limpeza”. Eu sabia o quanto isso poderia ser difícil para alguns dos alunos. Sabia que alguns deles não conseguiriam lidar com o que estava prestes a acontecer, por isso me propus a colocar aquela experiência em um contexto no qual eles considerassem refletir ao longo dos minutos e meses seguintes. Reuni a turma e disse: “Tudo bem, venham aqui todos vocês. Muitos de vocês talvez nunca tenham vivido o que acontecerá aqui. ntes que digam uma palavra, quero que todos vocês se lembrem de algo muito importante. Pode ser tentador julgar estes dois pelo que eles vão contar a vocês. Portanto, por favor, lembrem-se disto: cada um de vocês que está nesta sala, sem exceção, é um indivíduo desprezível sem Jesus em sua vida. Por favor, tenham isso em mente enquanto ouvem o que eles têm a compartilhar com vocês. Se um de vocês fizer algum julgamento a respeito deles, quero que venham e conversem comigo pessoalmente, antes que eu ouça isso de outra pessoa com quem vocês conversarem”.

Então fiz sinal para que o casal viesse à frente. O jovem começou dizendo: “Quero pedir perdão a esta turma porque sei que somos parte de vocês e que vocês são parte de nós. Durante o verão acabamos fazendo o que não devíamos, e agora vamos ter um bebê”.

Fiquei chocado com a humildade e a vulnerabilidade dele. Ele estava realmente se arrependendo diante daquele grupo de colegas. Ele continuou dizendo: “Descobri um problema em minha vida que eu não sabia que tinha. Ele tem causado muitos problemas para mim. Estou trabalhando nisso. Agora tenho mais esperança do que jamais tive em resolver esse problema. Mas é assim que as coisas estão, é isto que está acontecendo”. Ele explicou tudo que acontecera. Ela ficou em pé ao lado dele, humilde e aberta, e depois que ele terminou, ela fez o mesmo.

Convidei um dos alunos, Brandon, que exercia um papel paternal na turma, para vir orar por eles, perdoá-los e restaurá-los a um padrão celestial de relacionamento com o restante da turma. Quando ele se levantou, 47 outros alunos — toda a turma — se levantaram com ele e cercaram aqueles dois, apoiando-os. Alguns começaram a chorar. Brandon fez orações de perdão e amor. Ele os recebeu de volta à comunhão com a comunidade da turma. Outra pessoa disse a eles o quanto eles os amavam, e agradeceram a eles por não saírem da escola. Outro aluno agradeceu a eles por confiarem na turma abrindo suas vidas.

Então os alunos profetizaram sobre eles e sobre o bebê. Eles aceitaram o bebê na comunidade. Toda a turma chorou em conjunto. Foi realmente um momento impressionante. Fiquei perplexo com a reação, mas ao mesmo tempo eu sabia que aquelas pessoas e todos eles eram impressionantes!

A turma se sentiu muito mais leve enquanto as pessoas se abraçavam e sorriam em meio aos rostos cobertos de lágrimas. Então alguém do primeiro ano entrou e disse:

— Ei! O primeiro ano também precisa fazer isso.

— Vocês querem fazer isso agora? — perguntei.

Eles disseram:

— Podemos sim.

— Tudo bem, vamos lá.

Eu fui na frente. Quando os dois se dirigiram para a sala do primeiro ano, os 47 alunos do segundo ano os seguiram. Os alunos do primeiro ano não puderam evitar a consciência de uma tremenda presença entrando em sua sala de aula. A comitiva de 47 alunos enfileirou-se ao longo das paredes da sala como um exército de anjos da guarda enquanto aquele casal se colocava em pé diante de 100 estranhos e se arrependia.

Pedi a Kevin Drury, um pastor que havia tirado um ano de licença do ministério para vir para a BSSM (Escola Bethel de Ministério Sobrenatural), para orar por eles, abençoá-los e perdoá-los. Quando ele se levantou, os 100 alunos do primeiro ano se levantaram e se reuniram ao redor do casal para orar e abençoá-los. Kevin começou a orar e a profetizar sobre eles, quebrando a maldição da vergonha e da ilegitimidade sobre aquele bebê e cortando o acesso legal do inimigo para destruir aquela criança por meio da vergonha. Foi um tempo poderoso de amor e reconciliação.

Cem estranhos abraçaram e amaram aquele casal naquele dia. Eles haviam feito tudo o que podiam para reparar o seu erro e seguiram em frente como alguns dos principais exemplos entre os nossos alunos do segundo ano durante o restante do ano.

Eles se casaram meses depois, e pouco depois trouxeram a sua filha ao mundo. Mas desde o dia em que a menina nasceu, ela lutou por sua vida. Havia algo errado com seu sangue, e ela morria dia a dia. Sua luz estava se apagando. Eles estavam morando em um hospital para crianças com necessidades especiais na Carolina do Norte, de onde nos enviavam notícias de que o bebê estava morrendo. Onde quer que estivéssemos quando esses relatórios chegavam, inclusive nos cultos de nossa igreja e nas reuniões de equipe, nós orávamos. Mas o estado dela continuou a piorar por semanas.

Havia um tom de desespero no último telefonema que recebemos daquela mãe de primeira viagem. “Ela vai morrer. Os médicos disseram que ela não vai passar desta noite. Por favor, orem!” Depois desse telefonema, lembrei-me especificamente da oração de Kevin e fiz menção a ela. Lembrei-me de que não havia vergonha sobre aquela criança. Lembrei-me de que o inimigo não tinha direito sobre aquele bebê. Lembrei à nossa equipe o processo de restauração pelo qual eles passaram. Nossa equipe orou durante a nossa reunião e declarou que a oração de Kevin cancelou a vergonha. A morte e a destruição não tinham jurisdição sobre a vida daquela criança.

No dia seguinte, recebemos uma ligação.

“Os médicos não sabem o que aconteceu, mas eles estão chamando o nosso bebê de ‘o bebê Lázaro’”, disse uma mãe muito entusiasmada. Até o dia de hoje, a garotinha deles está viva e bem. Ela é forte, linda e cheia de vida.

No ano seguinte, aquela mesma jovem mãe foi uma das palestrantes em uma reunião do terceiro ano. Ela se levantou e, em meio a lágrimas, disse: “Quero apenas agradecer aos líderes desta casa. Vocês transmitem a força e a vida desta cultura a todos os que entram nela. Vocês edificam a força nas outras pessoas. Vocês nos deram uma herança. Nunca mais seremos os mesmos por vocês terem lidado com a nossa situação da maneira que o fizeram. Vocês jamais saberão a profundidade que isso nos afetou. Vocês nos deram vida em uma situação que poderia facilmente ter nos tirado dos trilhos por muitos anos. Vocês nos deram um relacionamento pelo qual estamos dispostos a morrer. Obrigada!”

A recuperação milagrosa daquela criança não pode ser chamada de outra coisa senão de sobrenatural. Mas o ambiente no qual ela ocorreu é o que simplesmente chamamos “Bethel”. Como mencionei, este está se tornando um lugar conhecido por seus muitos testemunhos milagrosos. Mas são as histórias das pessoas que compõem essa cultura milagrosa que ilustram o estilo de vida e os relacionamentos que realmente criam um ambiente que atrai o Céu à terra. Este livro trata da nossa cultura. Sem entender os valores essenciais que nos conduzem, você não entenderá o fruto que estamos colhendo.

No coração dessa cultura está o valor da liberdade. Não permitimos que as pessoas usem essa liberdade para gerar caos. Temos limites, mas usamos esses limites a fim de abrir espaço para um nível de expressão pessoal que traga à superfície o que realmente existe dentro das pessoas. Quando são dadas escolhas às pessoas, isso revela o nível de liberdade com o qual elas estão preparadas para lidar. Quando as pessoas descobrem a sua verdadeira capacidade de domínio próprio e de responsabilidade, então elas têm a revelação e a oportunidade que precisam para crescer rumo à liberdade que Deus deseja para cada um de Seus filhos e filhas.

Porém, antes de começarmos a explorar os valores essenciais da cultura Bethel, sinto que é importante compartilhar com você nossa estrutura de liderança. Nossa liderança é responsável por capacitar e equipar os santos com a revelação e a transferência de unção que eles necessitam para exercer sua liberdade em um lugar seguro, mas creio que temos tido êxito nisso porque nossos líderes estão alinhados com a unção apostólica e profética. Explicarei esses termos e como eles funcionam no capítulo seguinte.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$No confronto com o casal, Danny não acusa nem pune; ele faz perguntas até que a glória e a sabedoria do próprio jovem venham à tona, porque 'a vergonha do erro o havia feito esquecer quem era'. Quando alguém erra debaixo da sua liderança, sua reação instintiva tende mais a lembrar a pessoa de quem ela é ou a confirmar a vergonha que ela já sente? Por quê?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo ensina que um confronto bem-sucedido depende de quanto a pessoa confrontada se sente segura — sem lugar seguro, ela age na defensiva, culpa os outros e tenta salvar a própria pele. Pense num confronto recente que você conduziu: você criou um lugar seguro primeiro, ou foi direto ao problema? Que diferença isso fez no resultado?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Danny diz à turma que cada um ali, sem exceção, é 'um indivíduo desprezível sem Jesus', desarmando o julgamento antes que ele nascesse, e o fruto foi uma comunidade que cercou e profetizou sobre o casal em vez de expulsá-lo. Como líder, o que você tem feito na prática para que sua comunidade responda à falha de um irmão com restauração em vez de julgamento?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 2 — O funil que vem do céu  (aula ordem = 4)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 4;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 2 — O funil que vem do céu$t$,
      4,
$conteudo$Não há nada como voltar a um lugar que permanece imutável para descobrir

como você mesmo foi transformado. (Nelson Mandela, estadista da África do Sul) C reio que um dos principais fatores que mantiveram a Bethel Church em um estado de preparação e mordomia para o derramamento do Espírito é o “odre” da liderança da igreja, que foi estabelecida com um fundamento apostólico e profético e como uma expressão da graça de cada um dos demais cinco ministérios descritos em Efésios 4:11 — pastor, mestre e evangelista. Acredito que isso é verdade porque eu, como membro dessa equipe, vi em primeira mão como essas diversas unções tratam de uma parte essencial da identidade e propósito da igreja por meio de suas áreas específicas de foco e motivação. Sem uma expressão completa e madura dessas graças que equipam os santos, o povo de Deus não pode ser preparado adequadamente para receber o que Deus está derramando e liberar isso para o mundo que o cerca.

Estou convencido de que um dos motivos pelos quais os principais líderes da igreja passam pelo ciclo desalentador de ver os grandes derramamentos gradualmente voltarem à rotina normal é a falta de entendimento acerca dos cinco ministérios, bem como de sua própria unção e chamado ministerial — e de como essa unção se molda à direção de sua igreja. Espero neste capítulo e ao longo deste livro estabelecer um fundamento para a compreensão desses papéis e unções, a fim de que os líderes possam começar a ter acesso à graça que Deus depositou neles e a administrá-la.

Antes de fazer isso, para que você não pense que todos os líderes da Bethel já nasceram sabendo que foram chamados para o ministério e exatamente como Deus os ungiu, quero contar a história do meu próprio chamado pastoral.

Minha história como líder da igreja teve início em março de 1995. Naquela época, eu estava trabalhando em um orfanato chamado Remi Vista, em Mt. Shasta, na Califórnia. Eu havia acabado de concluir oito anos de faculdade e estava completando o meu Mestrado em Serviço Social na Universidade UC- Sacramento. Minha esposa Sheri, nossos filhos Brittney, Levi e Taylor e eu finalmente estávamos prontos para seguir a minha carreira em terapia de casais e de família. Ao longo daquela jornada extremamente estressante de oito anos, Sheri tinha o hábito de brincar: “Mostre-me o dinheiro!” Estávamos prontos para começar a receber algum tipo de pagamento.

Em um fim de semana de março, fizemos nossa viagem anual de duas horas pelas estradas montanhosas rumo ao lar: a Mountain Chapel em Weaverville, Califórnia. Sheri e eu crescemos nessa pequena comunidade e frequentamos a mesma escola juntos ali. Tínhamos muitas lembranças daquela pequena cidade da época que ainda “não éramos cristãos”. E ambos havíamos aceitado o Senhor no ministério de Bill Johnson em Mountain Chapel, um no mês seguinte ao outro.

Participar dos cultos na igreja em Weaverville era sempre muito agradável para nós. Essa viagem específica, como todas elas, foi marcada por uma grande comunhão. Aproveitamos para saber as novidades da vida de muitos amigos e compartilhamos com eles todos os acontecimentos atuais da nossa própria jovem família. Após o culto naquele domingo, Kris Vallotton convidou Sheri e eu para almoçarmos porque ele tinha uma “proposta” para nós. Estávamos animados apenas em fazer contato com mais um amigo querido, mas também com certeza curiosos para descobrir a respeito dessa nova ideia que Kris tinha na manga e que, como ele nos deu a dica, poderia transformar totalmente as nossas vidas.

Depois de um pouco de conversa corriqueira, ele nos perguntou se sabíamos que Bob Johnson, irmão de Bill, estava deixando a Mountain Chapel para começar uma nova obra em Redding. Não sabíamos disso. Então ele prosseguiu, nos informando que ele tinha permissão de Bill e da direção da igreja para nos perguntar se consideraríamos a possibilidade de substituir Bob como o novo pastor associado abaixo de Bill. Minhas mãos e meu nariz começaram a ficar frios. Eu podia ver a boca de Kris se mexer, mas não conseguia ouvir o que ele estava dizendo. Fiquei em choque. Dissemos-lhe que precisaríamos de algum tempo para pensar.

Lembro-me de ficar deitado naquela noite ao lado de Sheri no escuro total. Estávamos em silêncio, o que era raro, já que Sheri, um processador verbal de última geração, ainda estava acordada. Finalmente, em meio ao silêncio e à escuridão, ela perguntou:

— Você está pensando no que eu estou pensando?

— Sim — eu disse, e começamos a rir nervosamente. Não podíamos acreditar no que estava acontecendo.

Alguns meses depois, mudamos com a nossa família para Weaverville, para que as crianças pudessem começar a escola em setembro. Continuei a trabalhar em Mt. Shasta e dirigia para casa nos finais de semana. Em novembro, iniciei no meu novo cargo na equipe em Mount Chapel. Mas entre esses dois eventos, algo interessante aconteceu.

Em um domingo de setembro, Bill e Beni Johnson nos chamaram ao gabinete de Bill para conversar. Imaginamos que haveria muitas dessas “pequenas conversas” para nos ajudar a nos orientar, para nos manter informados a respeito da nossa nova posição e para nos explicar as coisas, considerando que estávamos chegando ali completamente novos e sem treinamento para o ministério. Porém, estávamos enganados.

Observamos que Bill e Beni pareciam estar rindo nervosamente quando começamos a reunião. Beni começou a conversa nos dizendo o quanto estavam felizes por estarmos ali. Ela disse que eles nunca haviam sentido a paz que agora sentiam e que estavam muito confortados com a nossa presença na equipe. Ela e Bill falaram acerca de nossos dons pastorais e disseram que as pessoas seriam amadas e bem cuidadas sob a nossa liderança. Senti algo se mover dentro de mim enquanto eles continuavam falando, mas não era orgulho ou uma grande satisfação. Era medo. Quanto mais eles falavam conosco, mais eu sentia essa sensação aumentar. A bomba finalmente caiu quando Beni disse:

— Temos sentido que o Senhor vai nos mudar daqui. Temos sentido isso há muitos anos, mas até agora nunca conseguimos nos sentir bem quanto a quem confiaríamos para liderar a igreja. Bem, agora que vocês estão aqui, nós nos sentimos muito aliviados.

Eu podia sentir o sangue se esvair do meu rosto, ficando lívido. Parecia que eu iria desmaiar. Será que eu havia acabado de ouvir o que pensava que tinha ouvido? Meus pensamentos corriam na minha mente. Você acha que voltei aqui ara arruinar a igreja que amo, o lar onde fui salvo? Você tem ideia do que seria astorear esta igreja de radicais na pequena cidade onde você cresceu como um incrédulo? Você está brincando?!

Bill e Beni estavam rindo. Estou certo de que o meu rosto estava congelado de choque e terror, apesar dos meus maiores esforços para esconder o que sentia. De repente, tive um pensamento claro. Qual era o prazo que eles tinham em mente para essa mudança?, perguntei.

— Vocês estão falando em se mudar daqui a cinco anos? Três anos?

Beni respondeu:

— Fevereiro. Achamos que sairemos em fevereiro. Não temos ideia do motivo, mas esse é o mês que sempre nos vem à mente.

— Fevereiro do ano 2000? — sussurrei.

— Não — ela riu. — Fevereiro, daqui a seis meses. 1996.

Àquela altura, pensei que com certeza iria desmaiar ou vomitar.

Essa foi a última “pequena conversa” a respeito de nossa subida a bordo do navio. E como haviam dito, seis meses depois eles partiram. A Bethel Church entrevistara Bill em dezembro daquele ano, 1995, oferecendo-lhe uma posição como pastor sênior. Ele informou a eles que precisava “treinar” um novo pastor em Mountain Chapel e que necessitaria de algum tempo. “Fevereiro”, ele disse a eles, “será a data mais próxima que poderei vir para Bethel”. De uma hora para a outra, estávamos passando para o papel de liderança como pastores. Suponho que podíamos ter dito não, mas sabíamos que o Senhor tinha um plano.

Depois da nossa reunião com Bill e Beni naquela manhã de setembro, porém, fiquei furioso. Eu estava totalmente furioso, principalmente porque estava muito assustado. Eu pensara que iríamos para Weaverville aprender com o “Pastor Mestre”. Essa esperança havia sido desfeita em alguns instantes e, de repente, se transformara em uma... promoção inesperada e aterrorizante. Esforcei-me para dominar meus medos dizendo a mim mesmo: Talvez Deus esteja nisto. Talvez Ele vá ficar aqui, mesmo que Bill saia. Talvez isto acabe bem. Talvez Ele fique comigo. Talvez seja isto que Ele estava tentando me dizer há treze anos.

Treze anos antes, eu tinha 21 anos de idade e havia acabado de entregar meu coração ao Senhor. Comecei ajudando Kris Vallotton, que já era líder na igreja em Mountain Chapel, com o grupo jovem do colegial. Certo dia, Kris profetizou isto para mim: “Um dia você pastoreará aqui em Weaverville”. Eu mal podia imaginar algo assim naquela época, mas fiz o meu melhor para fazer a palavra se cumprir procurando um seminário pelo qual eu pudesse pagar. Depois de algum tempo de esforço infrutífero, porém, desisti. Dois anos depois, esqueci-me totalmente daquela palavra — até que ela reascendeu novamente em minha mente no início do processo de retorno a Weaverville. Com o tempo, essa palavra se tornou a arma com a qual combati meus temores e inadequações.

Lembrar que “Ele está comigo” mudou a minha maneira de encarar tudo aquilo. Depois de perdoar Bill por me atrair para uma situação da qual eu não podia fugir, comecei a ver o que ele viu em mim — uma unção pastoral. Eu não a chamava assim, mas comecei a reconhecer que a paz e o conforto que ele e Beni mencionaram na nossa “pequena conversa” naquele dia realmente vinham dessa unção que eles podiam ver em nossas vidas. Eles sabiam que os nossos corações estariam focados nas pessoas. Nós garantiríamos que o rebanho deles, as pessoas em quem eles investiram dezessete anos de suas vidas, receberia o melhor de nós.

Felizmente, eles estavam certos. Como pastor, passei a ensinar e a pregar com base no meu histórico em aconselhamento. Comecei construindo nos corações e na mente do povo a verdadeira identidade como filhos muito amados de Deus. Minha agenda estava cheia de compromissos para me encontrar com pessoas. Casais, famílias, pais, homens e mulheres iam continuamente ao meu gabinete para serem curados e fortalecidos. Nossa equipe de liderança deu início a uma série chamada “A Busca pela Liberdade”, começando uma jornada para curar as feridas e as mentiras do passado de seus membros. Um dos nossos presbíteros teve uma transformação radical durante esse período, que levou toda a nossa igreja a outro nível de cura, libertação e comunhão.

O tipo de crescimento que acabo de descrever é a paixão da unção pastoral. O pastor precisa saber que as pessoas estão saudáveis e fortes. Ele ou ela sabe que o Evangelho adquire vida à medida que os santos aplicam e manifestam o verdadeiro amor e liberdade em suas vidas. Essa unção permite que Deus cultive o Seu coração no Seu povo. O Bom Pastor entra em ação por meio da unção dos pastores.

Bill e Beni sabiam que sua igreja vivia há anos sem uma forte unção pastoral. unção apostólica de Bill havia se tornado mais forte ao longo da década anterior, e o seu foco estava cada vez mais concentrado nas preocupações do Céu do que nas preocupações humanas. Seu pastor associado e irmão, Bob Johnson, carregava uma forte unção evangelística, por isso seu foco eram os perdidos. E o outro líder com uma forte unção na igreja era um profeta, Kris Vallotton. Cada uma dessas unções desvia a atenção e a prioridade dos santos e a coloca sobre outra área, como explicarei em maiores detalhes em um instante.

Entrar nesse “vácuo” pastoral foi um pouco impetuoso. Por eu não estar substituindo o apóstolo, mas trazendo uma nova perspectiva que atendia a necessidades diferentes, foi fácil para a igreja me valorizar e me receber como líder. Lembro-me de Bill me dizendo que a transição da liderança era sobrenatural, descrevendo-a como algo que acontecia com uma “suavidade assustadora”. Ele estava certo. A Mountain Chapel estava pronta para o que a unção pastoral traria. Nós dois esperávamos ter muito mais adversidades a enfrentar com sua saída, depois de seus dezessete anos como líder sênior. Mas não houve nenhuma. Essa foi a minha primeira lição acerca da compreensão da natureza e da importância de cada membro dos cinco ministérios. Desde então, o Senhor apenas continuou a construir sobre esse importante entendimento. s Cinco Unções Creio que posso apresentar melhor os atributos das cinco unções descrevendo o que poderia acontecer se todas elas chegassem juntas à cena de um acidente de automóvel:

O pastor é o primeiro a sair do carro. Ele vasculha o local para avaliar a situação e começa a fazer uma triagem com a intenção de aplicar os primeiros socorros às vítimas feridas. Ele recolhe cobertores, casacos, água e qualquer coisa que possa encontrar para dar conforto a elas. Ele avalia a situação para ver se alguma coisa representa uma ameaça à segurança tanto daqueles que estão recebendo cuidados quanto daqueles que foram atraídos à cena do acidente. Ele conversa com cada pessoa para descobrir seu nome, seu estado civil e se ele ou ela tem filhos. Reúne informações dos sinais vitais e qualquer informação de contato de emergência disponível a fim de ajudar a equipe de emergência quando ela chegar. Ele traz uma sensação de calma à situação, e cada pessoa ali tem um sentimento genuíno de cuidado e conexão com o pastor. Ele se pergunta se não deveria ter sido médico. O mestre é o próximo a entrar em cena. Ele estuda a situação a fim de entender o que causou o acidente. Ele recua, observa os padrões das marcas de pneus e a distância que cada carro avançou antes e depois do impacto, avaliando a velocidade de cada veículo no ponto de impacto. Com base no seu profundo conhecimento do manual do motorista e das leis de trânsito, ele desenvolve uma teoria sobre quem foi o culpado. Sua conclusão é a de que, acima de tudo, os motoristas precisam de mais treinamento e muito provavelmente teriam grandes benefícios se fizessem aulas obrigatórias e cumprissem exigências contínuas de atualização. O evangelista chega à cena e pergunta a todos os que estão deitados seguros, em um lugar confortável (graças ao pastor): “Se você morresse em resultado das suas lesões, sabe para onde iria — o céu ou o inferno?” Então ele observa que há um grande aglomerado de espectadores e de pessoas em seus carros que estacionaram para observar. Ele começa a se dirigir à multidão com a mesma pergunta. “Não há garantia de que vocês chegarão em casa em segurança. Vocês sabem para onde iriam?” As pessoas entregam seus corações ao Senhor bem ali, ao lado da estrada. Ele explica a todos esses novos crentes que o maior presente que se pode dar a outra pessoa é o presente da salvação. Ele as treina para levar outros a Cristo e ora para que o batismo no Espírito Santo venha sobre todas elas. Depois ele diz: “Uau, isso foi tremendo!” e decide que irá comprar um rádio de polícia quando voltar à cidade. O profeta sabia que isso iria acontecer porque teve um sonho com aquela cena na noite anterior. Pelo fato de que todos os envolvidos no sonho sobreviveram ao acidente, ele repreende o espírito de morte e declara com grande fé e unção que todos viverão e ninguém morrerá. Ele também proclama que há anjos cercando a cena do acidente e ora para que os olhos do coração de todas as pessoas sejam abertos para ver no Espírito. Então ele anda pelo local e começa a invocar o destino de vida sobre diversas pessoas. Ele libera o espírito de revelação dentro do grupo. E finalmente, e muito naturalmente, ele começa a perguntar em volta para descobrir quem está no comando da cena. Quando ele descobre quem está no comando, ele discerne se aquele é o líder escolhido por Deus ou não. Ou se descobre que ninguém está no comando, ele indica um líder. O apóstolo ora pelos feridos. Ele convida o toque sobrenatural de cura de Deus a entrar em cena. Ele começa a contar testemunhos de quando esteve no cenário de acidentes de automóveis e testemunhou o poder de Deus se manifestar nessas situações. O nível de fé das pessoas começa a aumentar. Então ele pergunta se alguém sente calor em suas mãos. Ele convida os que levantaram as mãos a orar pelos outros, a fim de que eles sejam curados. Ele demonstra a todos que estão próximos que o Reino do céu está às portas. Então ele abre uma escola para “aqueles que chegam às cenas de acidentes de carro” e os envia por todo o mundo para fazerem sinais e maravilhas. Espero que essa ilustração ajude você a entender a realidade de que cada unção é também uma mentalidade. Cada unção determina como uma pessoa perceberá as diferentes circunstâncias e situações, e como ela agirá em resultado disso, propondo distintas soluções aplicáveis para cada situação. Nenhuma unção é mais importante ou mais correta que a outra. Elas são simplesmente os dons de Deus para a Sua igreja, a fim de ajudar a trazer a perspectiva do Céu à terra. póstolos e Profetas ntes de explicarmos as cinco principais unções em maiores detalhes, juntamente com seus pontos fortes e fracos, deixe-me indicar a base bíblica tanto para os ofícios quanto para a ordem de prioridade do apóstolo e do profeta: Ora, vós sois corpo de Cristo; e, individualmente, membros desse corpo. A uns estabeleceu Deus na igreja, primeiramente, apóstolos; em segundo lugar, profetas; em terceiro lugar, mestres; depois, operadores de milagres; depois, dons de curar, socorros, governos, variedades de línguas...[1]

Paulo estabelece claramente uma ordem de prioridade nessa passagem, a qual está relacionada às esferas do sobrenatural que correspondem a cada ofício específico. Como você pôde observar na ilustração anterior, a unção que está sobre o apóstolo e o profeta cria uma perspectiva focada principalmente em perceber o que está acontecendo no Céu e trazer isso à terra. O mestre está focado em ser capaz de descrever tudo o que aconteceu com exatidão, e o evangelista e o pastor estão focados nas pessoas. Cada uma dessas áreas de foco é essencialmente importante, mas a fim de que elas funcionem juntas como Deus pretendeu, precisam se relacionar uma com a outra de acordo com a ordem de prioridade dele. As áreas de foco celestial vêm em primeiro lugar e influenciam as áreas de foco terreno.

Quando Paulo coloca os apóstolos em primeiro, os profetas em segundo e os mestres em terceiro, ele está descrevendo um fluxo. O fluxo passa por intermédio do mestre, é liberado em milagres e cura, e em seguida continua por meio de socorros, governos e línguas. Tragicamente, em muitas igrejas de hoje, as práticas de ensino, socorros e governos tiveram seu aspecto sobrenatural totalmente destituído. Parece que esses dons foram retirados da lista e separados do fluxo do suprimento sobrenatural do Céu. Na verdade, foi exatamente isso que aconteceu. Para proteger esse fluxo, a igreja precisa ser fundamentada sobre líderes que carreguem um valor essencial primordial pelo aspecto sobrenatural.

Em vez de ter o apóstolo e o profeta como o fundamento da cultura da igreja, nos dias de hoje a igreja tem colocado na direção do leme em sua maior parte o mestre, o pastor ou o evangelista. Infelizmente, separar efetivamente o sobrenatural do ministério desse modo afetou drasticamente a compreensão geral do verdadeiro papel de cada unção. Hoje, na maioria das igrejas, o papel de um mestre é afirmar claramente e com exatidão as verdades da Bíblia em uma mensagem teologicamente saudável, no esforço de construir segurança nas vidas dos crentes. O papel do pastor é criar uma igreja que tenha fortes valores e sistemas familiares estabelecidos, a fim de alimentar um caráter forte e relacionamentos fortes. O papel do evangelista é enfatizar o crescimento da igreja e treinar seus membros a compartilharem sua fé, levando outros a Cristo.

O problema é que esses são modelos de liderança focados na terra. Sem o fluir da graça dos apóstolos e profetas, que não estão apenas focados em ver o que está acontecendo no Céu, mas também em liberar essa realidade aqui na terra, esses modelos irão inevitavelmente nos levar a focar no que sabemos que Deus fez no passado e a perder o que Ele está fazendo agora. Esses modelos nos levam a nos importarmos mais com o conhecimento do que com a experiência.

É ainda mais difícil evitar esse desequilíbrio quando vivemos em uma sociedade que está permeada por ele. A maioria das escolas, faculdades e universidades da nossa terra abraçou uma visão mundial dualista que separa o conhecimento da experiência. Essa visão de mundo reduz o objetivo do ensino à mera transmissão de informação. Esse paradigma certamente está presente na igreja, e o resultado é que grande parte do ministério de ensino da igreja hoje está destituído de revelação e poder sobrenatural. Ele está limitado ao que pode ser feito com base na autoridade e nos recursos da terra.

Mas a unção quíntupla de ensino, um dos dons de Cristo, o qual deixou para nós o modelo exato do que cada unção faz, é muito diferente. Jesus exerceu Seu dom de ensino tanto pregando quanto demonstrando Sua mensagem com milagres. Aqueles que experimentaram o Seu ensino ficaram chocados com o quanto ele era diferente, e era diferente porque, diferentemente de seus outros mestres, Jesus ensinava com autoridade. [2] Cristo é o modelo que define o ministério do ensino da igreja, e as consequências do Seu modelo de ensino é que se não levarmos as pessoas à realidade palpável e sobrenatural do Evangelho, não temos autoridade para ensiná-lo.

Entendo que o tipo de governo que estou descrevendo, no qual existe uma ordem de prioridade clara nos diversos papéis, é difícil de entender e abraçar na cultura norte-americana e mundial. Nosso estilo de governo democrático destina-se a manter todos os seus membros governantes em um sistema de restrições e inspeções no qual cada ramo do governo deve prestar contas a outro ramo, a fim de que nenhum legislador, juiz ou presidente possa adquirir o controle de todo o governo. Entendo isso e valorizo esse princípio em um modelo terreno. No entanto, está escrito claramente na Bíblia: “... primeiramente apóstolos, em segundo lugar profetas, em terceiro mestres...”. Creio que grande parte da igreja tem ignorado essa porção das Escrituras e tem usado modelos com base nos governadores da terra, na tentativa de duplicar o Céu. Mas apenas o modelo do Céu pode reproduzir o Céu na terra.

Quando usamos outros modelos, a igreja se torna nada mais do que as pessoas já esperam de suas experiências terrenas. Esse é um erro enorme fundamental, com sérias consequências. Creio que fomos ludibriados! Quando usamos os sistemas de governo dos homens para definir ou reproduzir o Céu, começamos a percorrer o caminho de aplicar um sistema inferior. O Céu não se conformará a um sistema inferior nem duplicará um sistema inferior. O Céu precisa ser a fonte.

Na passagem de 1 Coríntios 12 citada, Paulo apontou para o modelo de governo do Céu. Ele define claramente uma ordem para o ministério da igreja, acerca da qual, ao longo dos meus vinte anos como cristão, poucas vezes ouvi além do ambiente no qual geralmente convivo. Essa ordem é apoiada por Efésios 2:17-22:

E, vindo, evangelizou paz a vós outros que estáveis longe e paz também aos que estavam perto; porque, por ele, ambos temos acesso ao Pai em um Espírito. Assim, já não sois estrangeiros e peregrinos, mas concidadãos dos santos, e sois da família de Deus, edificados sobre o fundamento dos apóstolos e profetas, sendo Ele mesmo, Cristo Jesus, a pedra angular; no qual todo o edifício, bem ajustado, cresce para santuário dedicado ao Senhor, no qual também vós juntamente estais sendo edificados para habitação de Deus no Espírito.

A “família de Deus” literalmente repousa sobre o fundamento da liderança dos apóstolos e profetas. Esse projeto permite que o Corpo de Cristo seja edificado em um “santuário” e finalmente se torne uma “habitação de Deus no Espírito”. Não é isso que desejamos?

Como tenho afirmado, a falha crucial que vejo no projeto norte-americano para a estrutura e o governo da igreja, embora não se limite ao nosso país, é a desordem, o que significa que os papéis e os relacionamentos dos líderes estão fora de ordem de acordo com a Bíblia. Os fundamentos e a liderança da maioria das igrejas de hoje consiste em pastores, mestres e administradores. Temos conferido poder ao grupo errado de pessoas da lista de 1 Coríntios 12, fazendo delas os líderes principais, e o raciocínio que está por trás dessa decisão não é espiritual, mas sim terreno. Tiago 3:13-18 nos adverte contra essa prática de trazer a sabedoria da terra para dentro das nossas vidas:

Quem entre vós é sábio e inteligente? Mostre em mansidão de sabedoria, mediante condigno proceder, as suas obras. Se, pelo contrário, tendes em vosso coração inveja amargurada e sentimento faccioso, nem vos glorieis disso, nem mintais contra a verdade. Esta não é a sabedoria que desce lá do alto; antes é terrena, animal e demoníaca. Pois onde há inveja e sentimento faccioso, aí há confusão e toda espécie de coisas ruins. A sabedoria, porém, lá do alto, é, primeiramente, pura, depois, pacífica, indulgente, tratável, plena de misericórdia e de bons frutos, imparcial, sem fingimento. Ora, é em paz que se semeia o fruto da justiça, para os que promovem a paz.

Quando o Céu é o modelo da nossa cultura, o resultado principal é a paz. A paz é o objetivo do Céu porque ela é a qualidade principal do governo de Deus. Mas as formas desordenadas de governo às quais todos nós nos acostumamos criam não a paz, mas o controle, que é o objetivo pretendido por elas. O homem tem o objetivo oposto ao Céu. A estrutura de liderança da terra é motivada pelo desejo de proteger o governo daqueles que estão no cargo. Quando estruturamos primordialmente o ambiente da casa de Deus para proteger a vontade das pessoas, saímos do caminho da “sabedoria do alto”.

A fim de compreendermos quão grave é o fato de fazermos as coisas de acordo com o raciocínio humano em vez de fazê-las de acordo com o raciocínio do Céu, precisamos apenas nos lembrar de uma das mais fortes repreensões dos evangelhos: a repreensão que Jesus fez ao Seu bom amigo Pedro. Se você se lembra, Pedro tentou convencer Jesus a não morrer na cruz. Pedro queria proteger o que ele considerava como algo bom. Sua principal preocupação e motivação foi manter aquele benefício atual fluindo para a terra. Jesus voltou-se para ele e disse: “ Para trás de Mim, Satanás!... Pois tu não cogitas das coisas de Deus, mas das coisas dos homens”.[3] Aquele não foi um dos melhores momentos de Pedro, mas essa é uma palavra clara para todos nós que estamos observando. O Céu é o modelo — não a terra. “Primeiramente Apóstolos...” Você provavelmente ouviu o termo ministério apostólico ser mais usado nos últimos anos. Estou confiante de que ouviremos e veremos mais desse ministério nos anos que estão por vir. Esse termo é algo que precisa ser definido bem no início neste livro, porque farei referências frequentes a ele daqui em diante. Ao fazer uso desse termo, estarei me referindo aos objetivos e alvos primordiais da liderança do apóstolo, e portanto, aos objetivos com os quais todas as pessoas que estão debaixo da liderança do apóstolo se alinham.

Quando Jesus ensinou os discípulos a orar, Ele disse uma frase fundamental para os valores essenciais deles. Ele lhes disse para orar: Venha o Teu reino. Seja eita a Tua vontade assim na terra como no céu. [4] As instruções de Jesus os ensinaram a ansiar pelo Céu na terra. Creio que esse valor essencial é o objetivo primordial do ministério do apóstolo. Os líderes apostólicos estão focados no Céu, e a missão deles é ver a realidade sobrenatural do Céu estabelecida na terra. Eles anseiam por ver a evidência do toque do Céu no ambiente que lideram ou influenciam. Ter essa motivação como o fundamento de uma igreja leva a uma ênfase inteiramente diferente nas prioridades de governo da igreja. O apóstolo fará da presença de Deus, da adoração a Deus e da agenda do Céu as prioridades máximas no ambiente. Um governo apostólico destina-se a proteger essas prioridades.

O apóstolo Paulo refere-se a si mesmo como o chefe de construção em 1 Coríntios 3:10. Essa é uma tradução da palavra grega architeckton, a palavra da qual deriva-se a palavra “arquiteto”. Isso descreve perfeitamente o papel do ministério apostólico. É como se o próprio Deus tivesse dado projetos a certos indivíduos para reproduzirem o Céu na terra. Com esse projeto, a unção do apóstolo contém uma qualidade que estimula e desperta as diversas unções nas pessoas que o cercam, trazendo-as para fora. À medida que os que estão ao redor do apóstolo começam a manifestar sua própria unção única, isso cria um ambiente de “encarregados” que ajudam o “chefe de construção” a realizar os projetos do Céu.

A seguir estão algumas das características-chave de um ambiente e cultura apostólicos:

A adoração e a atividade sobrenatural são prioridades no ambiente e no estilo de vida dos santos, porque a presença de Deus é a prioridade máxima.

Os santos são enviados, como Jesus foi, para destruir as obras do diabo, inclusive a doença, a enfermidade e a aflição. Os santos vivem para demonstrar a todas as pessoas da terra que Deus é sempre bom e que o diabo é sempre mau.

O Reino de Deus é “ alegria no Espírito Santo”.[5] Portanto, a igreja deve ser um lugar de extrema e abundante alegria.

Deus deseja que aqueles que ainda não o conhecem entrem em um relacionamento com Ele no qual a ênfase principal seja o amor, e não meramente o serviço.

O Corpo de Cristo está sendo edificado e equipado para se tornar uma Noiva gloriosa e vitoriosa, independente de como as condições da terra possam parecer atualmente.

A igreja deve criar despertamento e impacto global.

As gerações posteriores devem ser equipadas para compreender e demonstrar a revelação do Reino.

Na Bethel Church, fazemos uma leitura específica no momento das ofertas que declaramos juntos, como congregação, sobre a nossa região todos os domingos. Há alguns anos, Mike e Debbie Adams se mudaram para Redding de outro Estado para frequentar a Escola Bethel de Negócios Sobrenaturais. Depois de passar um tempo conosco e absorver nossa cultura, Debbie escreveu o que se tornou carinhosamente conhecido como nossa “segunda leitura para o ofertório”. Ela realmente resume melhor o que entendo por ministério apostólico:

Ao receber as ofertas de hoje, cremos em Ti para: Céus abertos, Terra invadida Depósitos abertos e milagres criados Sonhos e visões Visitações angelicais Declarações, transferências de unção e manifestações divinas Unções, dons e chamados Posições e promoções Provisões e recursos Para irmos às nações Almas e mais almas De todas as gerações Salvas e libertas Carregando consigo o avivamento do Reino Obrigado, Pai, porque quando uno o meu sistema de valores ao Teu, Tu derramas FAVOR, BÊNÇÃO e AUMENTO sobre mim para que eu tenha mais do

que o suficiente para colaborar com o Céu para ver Jesus ter a Sua PLENA

RECOMPENSA!

ALELUIA!

Um ambiente apostólico é um lugar empolgante, porque o foco no Céu permite que a oração, a adoração, os milagres, os sinais e as maravilhas se tornem normais em nossas vidas diárias. Entretanto, há uma área em particular que o papel do apóstolo não se destina a tratar diretamente: as necessidades das pessoas. Você se lembra do que os apóstolos disseram quando foram confrontados com as necessidades das pessoas em Atos 6:4? “ E, quanto a nós, nos consagraremos à oração e ao ministério da palavra”. Eles estavam agindo como apóstolos. As necessidades crescentes das pessoas eram uma distração para o papel e a unção deles. Não é que eles não se importassem com as pessoas, afinal, eles realmente fizeram algo para garantir que homens de qualidade de sua comunidade cuidassem dessas necessidades. Mas um apóstolo precisa ter a liberdade para buscar o Céu se ele quiser efetivamente cumprir o seu chamado apostólico. O Lado Negativo Quando um apóstolo busca cumprir o seu chamado sem ter ao seu redor as graças dos outros ministérios estabelecidas, diversos problemas reais se manifestam no ambiente e ameaçam o sucesso do líder apostólico. Manifestações incomuns não encontradas na Bíblia, cenários e questões sem precedentes, um foco desconfortável no sobrenatural e uma desatenção evidente para com as necessidades das pessoas começam a gerar problemas para qualquer líder apostólico. Tudo que as pessoas conseguem ver é a distância crescendo entre elas e o apóstolo. À medida que as necessidades das pessoas não são atendidas, elas podem começar a se ressentir com a forma que o apóstolo está decidindo usar o seu tempo. Viagens, reuniões, relações com outros líderes apostólicos e tempos de oração parecem um grande desperdício de tempo quando as necessidades das pessoas estão gritando em seus próprios ouvidos.

Já ouvi pessoas dizerem: “Sinais e maravilhas são ótimos. Os milagres são incríveis. Fico feliz por todas essas pessoas cegas que agora podem ver. Mas vamos para outra igreja onde eles cuidem das pessoas, onde eles ensinem a Bíblia, onde eles sejam menos emocionais. Esta igreja nem sequer tem um planejamento para ajudar os novos membros a se encaixarem”. Isso pode parecer pequeno, mas é uma reclamação real que afasta as pessoas de um líder apostólico e de um ambiente de avivamento depois de algum tempo. Céus abertos e portas dos fundos abertas são o lado doce e o lado amargo da liderança apostólica. É por isso que eles precisam do apoio do restante da equipe. “Em Segundo Lugar Profetas...” peça vital seguinte no governo de uma cultura de avivamento é o papel do profeta. Essa é a próxima peça da tubulação que bombeia o Céu até a terra. O fundamento está incompleto sem a presença da unção profética. Deus enfatiza o papel crucialmente importante do profeta ao longo das Escrituras:

Ouvi-me, ó Judá, e vós, moradores de Jerusalém: Crede no Senhor vosso Deus, e estareis seguros; crede nos seus profetas, e prosperareis. [6]

O sucesso é construído a partir do valor que damos às vozes proféticas no nosso ambiente, porque a nossa prosperidade vem por intermédio da nossa concordância com a cultura do Céu, e os profetas esclarecem a realidade dessa cultura para nós e nos convidam a entrar nela. Nossa experiência com a liderança profética na cultura da Bethel Church veio de muitas formas diferentes. O número de vozes proféticas que fizeram parte da formação do nosso caminho e destino como igreja parece enorme, desde Bob Jones a Bobby Conner, passando por Dick Joyce a Dick Mills, de Mario Murillo a Michael Ratliff, de Jill Austin a ohn Paul Jackson; de Paul Cain a Patricia King, Larry Randolph, Mahesh e Bonnie Chavda, Iverna Tompkins, Cindy Jacobs, Wes e Stacy Campbell, e Rolland e Heidi Baker. Juntamente com essas vozes proféticas globais e nacionais, mais outras vozes locais e regionais igualmente importantes moldaram a nossa cultura e destino, entre elas Wendall McGowen, Mary Andersen, Deborah Reed, Dan McCollam, Judy Franklin, Nancy Cobb, e muitos outros.

Kris Vallotton é o escultor principal do ambiente profético da Bethel. Ele é uma dádiva de Cristo para a nossa casa e para o Corpo de Cristo. Seu papel como profeta no nosso ambiente cultivou a nossa expectativa de descobrir as alturas e profundidades das boas-novas. O Evangelho é mais do que as palavras da Bíblia. Ele é uma realidade que precisa se desenvolver na vida de cada crente, e uma das principais maneiras de isso acontecer é por intermédio do ministério profético, que tome posse das promessas do Reino para destinos individuais e os chama à realidade por meio da declaração profética. (Em seu livro The Supernatural Ways of Royalty [Os Caminhos Sobrenaturais da Realeza] Kris apresenta ao mundo os valores essenciais e a revelação pelos quais ele estabeleceu uma cultura profética na Bethel.)

A liderança e a influência de Kris como profeta também moldou a nossa expectativa da presença de Deus. Precisamos que alguém nos mantenha em expectativa e conscientes da realidade sempre presente do Reino. Os apóstolos nos mantêm crendo, mas os profetas nos mantêm na expectativa de que Deus está vindo. As maneiras dinâmicas pelas quais Deus fala ao profeta, inclusive por sonhos, visões e êxtases, criam a consciência do envolvimento de Deus conosco. Essas ferramentas sobrenaturais produzem um grande aumento da sensibilidade para com a atividade e os planos do Céu.

Porém, mais do que nos tornar conscientes do Céu por intermédio de suas experiências, a unção que está sobre o profeta realmente nos prepara para termos as nossas próprias experiências celestiais. Mateus 10:41 nos diz: “ Quem recebe um rofeta, no caráter de profeta, receberá o galardão de profeta... ”. O que é esse galardão? O galardão é ver e ouvir o que o Espírito está fazendo e dizendo. A unção profética carrega uma dimensão de vidência, que dá às pessoas a visão para ver aquilo que antes da influência do profeta era invisível.

Jesus, que foi o modelo do ofício de profeta, andava por toda parte dando uma visão sobrenatural às pessoas o dia inteiro. Ele costumava perguntar aos Seus discípulos e aos que o cercavam: “ Não considerastes nem compreendestes ainda?”[7] A resposta era sempre “não”, porque Jesus estava apresentando a esses homens uma visão inteiramente diferente da vida, principalmente para os líderes religiosos daquele tempo. Mas essa pergunta levou aquelas mesmas pessoas a começarem a procurar algo que elas nunca haviam considerado ver antes. O resultado foi que elas receberam olhos para ver.

O profeta e o apóstolo podem conviver de uma maneira excepcional porque ambos estão observando o Céu e recriando na terra o que veem ali. Eles devem trabalhar juntos, como um arco e flecha, em busca dos mesmos objetivos. Não há dúvidas de que essa é a razão pela qual eles são o fundamento da igreja do Novo Testamento. “Em terceiro Mestres...” Em seguida temos os mestres. Como mencionei, o mestre é geralmente aceito como o nível de unção mais elevado em nossas igrejas ocidentais. Mas a verdade é que essa não é a unção mais elevada, mas apenas o terceiro nível de unção. É como um “C” em uma escala de classificação. Ela mantém a igreja apenas no nível médio em seus efeitos e influência. Felizmente, nossa necessidade e oportunidade de fazer uma “subida de categoria” na unção para um “A” está aumentando.

Antes de avançar um pouco mais nesse tema dos mestres, preciso confessar que as informações contidas aqui não satisfarão as necessidades dos mestres que estão lendo este livro. Para a maioria dos mestres, este assunto precisaria ter um livro inteiro dedicado a ele, porque os mestres necessitam de muita informação antes de poder concluir praticamente qualquer coisa. Respeito essa característica dos mestres, por isso não vou tentar me esforçar muito para convencer os mestres de que estou certo ou de que eles estão errados. Vou simplesmente apresentar a razão pela qual creio que cometemos um grande erro ao fazer do mestre a mais alta unção que atua na liderança da maioria das nossas igrejas.

A cultura da igreja atual valoriza grandemente a segurança que sentimos quando somos capazes de provar que aquilo a que dedicamos nossa vida é certo. Para afirmar a nossa fé, supomos que devemos ser capazes de defender uma causa e levá-la a uma conclusão lógica. Mas o fato é que a nossa necessidade de tanta certeza vem de uma grande incerteza. Quando o Céu para de se manifestar na igreja, os cristãos precisam provar de alguma forma que eles estão certos por seguirem a Jesus. Quando o poder do Evangelho é substituído por argumentos, todos deveriam se preocupar. Mas quando as pessoas são curadas em seus corpos de câncer, paralisia, tumores e doenças mentais, não exigimos um argumento. O fato de uma pessoa experimentar o toque do Céu passa a ser a prova suficiente de que Jesus é quem Ele diz que é.

O fato é que quando a igreja insiste em ter uma cultura lógica, exigimos um evangelho lógico e, portanto, nos voltamos para os mestres. A maioria dos mestres hoje está focada na Palavra de Deus escrita. Eles acreditam que a Palavra de Deus é a fonte da vida e da verdade na terra. O valor que eles dão à Palavra é muito superior à necessidade deles pelo sobrenatural. Eles são os advogados, escribas e fariseus do nosso tempo. Eles são os melhores em brandir a “Espada”. O mestre tem uma necessidade profunda e impulsiva de estar certo, e vê o mundo predominantemente em termos de “bíblico” e “antibíblico”. Pelo fato de que o foco do mestre está na Palavra, a unção do mestre influencia a igreja a focar na Palavra. Por favor, não me entenda mal. Não estou querendo desvalorizar a Bíblia. Mas quero que entendamos o quanto o Céu se tornou pouco importante por causa desse erro e desordem terríveis. Quando os mestres se tornaram a principal influência sobre a igreja, voltamos nossa atenção para a lei.

Quando focamos unicamente na Palavra, com o tempo acabamos lutando entre nós mesmos acerca da Palavra. Começamos a dividir o Corpo de Cristo entre os que estão “certos” e os que estão “errados”. Cada mestre é compelido a estar certo. Como Paulo disse aos coríntios, temos “muitos mestres” no Corpo de Cristo.[8] E quando os mestres discordam, e muitos deles discordam entre si, há divisão. Os líderes defendem sua causa doutrinária e sua teologia, um após o outro, levantando uma bandeira para provar o seu ponto de vista e refutar os demais.

Qual é então o papel do mestre na igreja, se não é provar que os cristãos estão certos ao crer no que creem? Para que os mestres exerçam o seu verdadeiro papel na cultura da igreja, eles primeiramente terão de estar dispostos a buscar um estilo de vida sobrenatural. Eles terão de se sentir insatisfeitos com a armadura dos seus argumentos e com a sua teologia destituída de vida. Eles precisarão aumentar a sua coragem de correr o risco de fracassar e viver uma vida que é incapaz de responder a todas as perguntas de seu mundo. Os mestres precisam abraçar o mistério.

A unção que está sobre os mestres sempre fará com que eles valorizem grandemente a instrução. Eles serão aqueles que acreditam que a maioria dos problemas pode ser resolvida com um treinamento e informando as pessoas de acordo com a Bíblia. Mas a verdadeira mudança que eles anseiam por ver somente virá sob a liderança de uma cultura apostólica e profética. Em uma cultura sobrenatural, os mestres ensinarão com resultados sobrenaturais.

Quando Jesus ensinava a uma multidão sobre o Reino dos Céus, Ele sempre lhes mostrava o Reino. Seus discípulos viviam todos os dias em uma experiência interminável de sala de aula. Jesus levou o modo de ensino de “mostrar e dizer” a um nível inteiramente novo. Nossos mestres precisam colocar novamente em seus planos de aula a parte da “demonstração”. Ouvi Bill Johnson dizer muitas vezes: “Jesus é a teologia perfeita”. Concordo com ele. Se Jesus ensinou desse modo, então significa que isso é algo bom. Se Jesus não tivesse feito nada semelhante ao que estamos fazendo, seria melhor nos perguntarmos “O que saiu errado?”

Os mestres devem pegar a paixão e a revelação dos apóstolos e dos profetas e nos mostrar como ela se torna uma verdade que aplicamos em nossas vidas. O papel do mestre é ajudar a reproduzir os processos do sobrenatural e depois treinar e equipar os santos para cooperarem com esses processos. O amor à Bíblia e o conhecimento que os mestres têm os ajudam a transmitir processos complexos com analogias e aplicações simples.

Randy Clark, da Global Awakening, é um exemplo primordial para mim de alguém que tem o dom de ensino e que o usa para ajudar o mundo e a igreja a entender o sobrenatural. Embora ele seja um líder apostólico, seu dom de ensino opera naquela unção superior. Portanto, ele usa o seu entendimento da Bíblia, da História, da Teologia e das pessoas para conectar revelações misteriosas à vida prática diária. Seus modelos para treinamento de pessoas para orarem pelos enfermos são métodos altamente eficazes e excelentes de mobilização de equipes de oração para ministrarem a grandes grupos em suas cruzadas. Crentes que nunca oraram por outros para que fossem curados em toda a sua experiência cristã, após algumas horas de treinamento, começam a ver um milagre após o outro.

Uma cultura de avivamento de sucesso tem mestres que perpetuam o sobrenatural nela. Os dias de ensinar as nossas experiências limitadas acabaram. gora precisamos aprender o quê e como o Céu está fazendo todos os dias a todos. Onde os Pastores se Encaixam? h, os amados pastores! Onde encaixaremos esse outro papel que tem ajudado a completar a desordem no governo da igreja? Pastor Sênior ou Pastor Principal. Que título estranho quando olhamos para a lista que Paulo estabeleceu em 1 Coríntios 12. Na verdade, se você olhar para essa lista, verá que o pastor nem sequer é mencionado, muito menos numerado. Como então o “Pastor Principal” é o título da pessoa mais importante na estrutura da igreja? Tenho uma ideia sobre isso.

Quando um grupo de pessoas se reúne, seja uma família, uma comunidade, uma empresa, uma escola ou uma igreja, não demora muito para que esse grupo se organize de tal maneira a ter as suas necessidades atendidas. Imagine a cena de sobrevivência de um filme: o navio afunda, o avião cai e as pessoas estão perdidas. As prioridades são comida e água, abrigo, segurança, e depois a esperança de resgate. Quanto mais o resgate demora, mais outra prioridade se desenvolve: quem vai nos liderar? O voto geralmente vai para aquele que tem o plano mais agressivo para salvar o grupo, o “Indiana Jones”, digamos assim. Se isso não funcionar, então o grupo começa a pensar a tentar sobreviver por um longo prazo. O novo líder que eles escolhem para liderá-los durante aquele longo período é muito mais compassivo, firme, prático e previsível. Esse líder garantirá que as necessidades das pessoas sejam atendidas. Ele garantirá que elas sejam civilizadas e estejam seguras. Ele será o pastor delas.

Os pastores surgem como líderes em longo prazo, quando toda esperança de resgate se vai. As pessoas se reúnem em torno de um líder que elas acreditam que cuidará das suas necessidades particulares. Isso é evidenciado na política e nos negócios, assim como nas igrejas. Se o foco principal das pessoas estiver nelas mesmas, elas elegerão um líder que tenha o mesmo foco. Quando a questão passa a ser sobrevivência em longo prazo, as pessoas procuram por uma unção pastoral em seu líder. Simples assim.

Se os pastores não estiverem ligados aos apóstolos e profetas, porém, então a liderança deles só levará as pessoas a recolocarem o foco em si mesmas. E o pastor terá de dar a elas uma alternativa natural para uma vida sobrenatural. Quando alguém com uma unção pastoral é o líder principal, as pessoas esperam ser o centro do universo. E infelizmente, o pastor tem sucesso por algum tempo em responder a essa expectativa, geralmente seguindo-se o esgotamento.

Mas quando a unção pastoral está ligada ao apóstolo e ao profeta, isso gera outra peça vital do fluxo do Céu para a terra. Esses líderes atenciosos e compassivos são a solução necessária para o problema da “porta dos fundos”, que os apóstolos e profetas têm em seus ambientes de liderança. Em uma cultura de avivamento, os pastores levam liderança às pessoas. A unção pastoral gera grande favor junto às pessoas por causa da conexão que os pastores desenvolvem com elas. Eles são os líderes que estarão nas vidas delas, em suas casas e em suas famílias. São os líderes que se sentarão com elas e resolverão problemas no casamento. São os líderes que saberão a respeito das dificuldades delas no emprego ou na criação de filhos adolescentes.

Se os pastores puderem aprender a manter o foco no Céu e nas pessoas, então eles serão aqueles que trarão uma cultura de avivamento às vidas diárias dos santos. Manter esse foco equilibrado requer esforço, porque os pastores naturalmente querem que as pessoas se sintam amadas, discipuladas, conectadas e protegidas. Mas quando os pastores são submetidos à liderança apostólica, eles são capazes de desenvolver células, por exemplo, sem fazer dos grupos celulares o foco primordial da igreja.

Com a expansão do propósito e da visão, os pastores passam a ser muito menos territoriais e a exercer menos poder. Permitir que outros pastores trabalhem ao lado do apóstolo não significa dar uma oportunidade para a competição ou a ameaça. Ao contrário, quando os pastores exercem seu chamado debaixo de uma unção apostólica, podem liderar muito mais pessoas, porque elas não precisam mais do poder da presença do pastor.

Os pastores levam a presença substancial de Deus às vidas das pessoas. Eles ligam as pessoas ao ambiente sobrenatural criado pelos apóstolos e profetas. Em vez de conduzirem as pessoas a si mesmos e depois lhes mostrar o amor que eles têm por aqueles que sofrem, os pastores começam a conduzir as pessoas à presença de Deus a fim de que elas possam encontrar ali as soluções para os problemas da vida. É motivo de satisfação para o pastor ver os santos encontrarem os pastos verdejantes da liberdade e do consolo proporcionados pelo ministério apostólico. “E Quanto aos Perdidos?” Os evangelistas formam o fim do funil que garante que o fluxo do Céu — partindo dos apóstolos e passando pelos profetas, mestres e pastores — chegue ao seu alvo pretendido: os que estão em trevas. A unção do evangelista faz com que ele se concentre nas almas que ainda não conhecem Jesus como a preocupação e a motivação primordial do ministério. E falando de forma realista, a não ser que o ministério da igreja esteja alcançando aqueles que ainda não conhecem o Senhor, a função das outras unções é bastante sem propósito. Talvez seja essa convicção que, de modo bastante estranho, faça com que os evangelistas sejam cristãos que parecem estar irados com os outros cristãos! Pode ser uma eterna frustração para aqueles que carregam essa unção ver que estamos promovendo outro estudo bíblico ou almoço de comunhão na igreja, enquanto as pessoas da cidade estão perecendo na condenação eterna. Isso simplesmente não faz sentido algum para eles.

Mas o fato é que estamos todos no mesmo time. Ficar frustrados uns com os outros não nos ajuda a fluir juntos, então, qual é a solução? Creio que é hora do ministério de evangelista — que alcança tanto os não salvos quanto prepara os santos para fazerem o mesmo — estar mais profundamente integrado aos propósitos maiores do ministério apostólico.

É fácil acreditarmos que qualquer um pode conduzir outra pessoa a Cristo. Temos uma grande fé de que quando oramos com alguém para que ele aceite esus, a pessoa realmente nasce de novo, bem ali, na mesma hora. A grande maioria da igreja cristã, atualmente, acredita que isso é verdade. Esse conceito só vem ganhando força desde que foi apresentado há várias centenas de anos no avivamento. Ele foi captado por mestres e pastores e preservado entre as pessoas da igreja. Hoje, os metodistas, batistas e outros evangélicos são os campeões da salvação em todo o mundo, e praticamente toda denominação cristã envia missionários para levarem a mensagem da salvação aos confins da terra. A cultura de muitas igrejas tem uma prática de evangelização entre as pessoas. Os mestres a ensinam e os pastores a encorajam. Os evangelistas anunciam aonde quer que vão: “Precisamos sair e ganhar almas!” Mas a questão maior é: “E depois?”

O objetivo da igreja é fazer o Reino do Céu invadir a terra, e não levar as pessoas não salvas a invadirem a igreja. A cooperação entre todos os dons ministeriais é a única maneira de realizar o objetivo primordial da igreja. Precisamos cooperar com o Espírito Santo para montar, de modo cuidadoso e deliberado, a tubulação que faz fluir o Céu e todo o seu poder e liberdade para a terra. Quando fizermos isso, o conceito da importância de que toda igreja cristã deve estar plenamente equipada com todos os dons ministeriais para que o Reino do Céu “vaze” de nossas vidas, logo será tão amplamente aceito quanto a ideia de fazermos uma oração de salvação. Honra É a Ferramenta honra é a ferramenta que une toda essa tubulação. Esse “funil” é, na verdade, uma rede de relacionamentos nos quais o “fluxo” que estou descrevendo só continua fluindo na medida em que aprendemos a reconhecer esses papéis e unções dados por Deus, liberamos as pessoas para atuar neles e depois recebemos o que elas têm a dar. Aqueles que são chamados a operar em uma unção quíntupla, como a minha história pessoal mostra, precisam dos outros cinco ministérios, principalmente dos profetas e apóstolos, para identificar essas unções. Nenhum de nós pode se “auto-indicar” para assumir uma posição no Reino. Deus unge uma pessoa, e o Seu Espírito no restante da equipe cria um testemunho corporativo que reconhece a unção de Deus e recebe a pessoa em sua posição. Somente atos de honra como esses podem estabelecer e sustentar esses relacionamentos.

O projeto dos cinco ministérios para a liderança é obviamente um projeto de equipe, portanto o conceito do “exército de um homem só” claramente não é uma expressão desse projeto para a liderança da igreja. O mesmo acontece com o estilo de liderança burocrático, homogêneo, de “todo mundo pode fazer todos os trabalhos” — ele tampouco se aplica à igreja. Diversas unções contribuem, cada uma ao seu modo, para algo inteiramente único no projeto de trazer o Céu à terra, e isso requer uma atitude de honra (e não democrática) que diz: “Você tem algo que eu não tenho, e preciso do que você tem”.

Quando os líderes dos cinco ministérios são um modelo desse tipo de honra entre eles, então “equipar os santos” se torna uma questão de estender a honra liberando cada crente individual para viver sua identidade e destino únicos. Cada crente passa a entender sua importância no relacionamento com todo o Corpo, e a convicção começa a se manifestar entre as pessoas: “Eu carrego algo que ninguém mais carrega. Eu preciso desenvolver e liberar os meus dons para a igreja e o mundo e fazer a minha parte para trazer o Céu à terra”. A honra reveste as pessoas de poder.

É hora de todos na igreja começarem a honrar aqueles que têm uma das cinco unções, principalmente entre aqueles que têm as cinco unções! Apóstolos, profetas, mestres, pastores e evangelistas precisam honrar uns aos outros e receber um ao outro com o “nome” correto. Os líderes da igreja e os crentes igualmente precisam entrar em um relacionamento correto com o governo do Céu. À medida que fizermos isso, essas coisas que estão em desordem serão restauradas ao seu lugar de direito e serão ligadas ao sistema central no fluir do funil.

A honra tem passado por tempos difíceis em nossa cultura. A independência é adorada. Focamos nos nossos relacionamentos particulares com Deus e temos dificuldade em reconhecer a autoridade espiritual e em considerar os outros mais importantes do que nós mesmos. O resultado é que estamos cortados do fluir do Céu. O crescimento notável que a Bethel Church tem experimentado nos últimos dez anos é um testemunho da diferença notável que as pessoas estão vendo em um ambiente no qual o funil está conectado e as pessoas estão entrando no fluxo.

Como Moisés derramando óleo sobre a cabeça de Arão, Deus está continuamente derramando vida, alegria, saúde, paz e todas as outras bênçãos do Céu dentro do Seu funil. Os muitos efeitos maravilhosos de um ambiente cheio do sobrenatural são impactantes. “Melhor apertar os cintos”, é a sensação que muitos têm quando experimentam uma igreja onde o Céu enche o ambiente. É a experiência poderosa de um odre que é perfeitamente capaz de carregar e liberar o derramamento que Deus nos prometeu desde o começo — um derramamento para o qual fomos criados. Mas somente a honra edificará esse odre, o manterá intacto e fará com que nos envolvamos com o que está dentro dele.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Danny descreve cada uma das cinco unções como uma mentalidade distinta — pastor, mestre, evangelista, profeta e apóstolo veem a mesma 'cena de acidente' de maneiras diferentes. Olhando para como você naturalmente percebe e responde às situações que lidera, qual dessas unções mais descreve a sua mentalidade, e o que isso te ajuda a ver — e o que tende a te cegar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O autor argumenta que muitas igrejas colocam mestre, pastor ou evangelista no leme e, sem o fundamento apostólico e profético, acabam focando no que Deus já fez no passado e perdendo o que Ele faz agora. No ambiente que você lidera ou frequenta, quem está 'no leme', e que efeito isso tem tido sobre a expectativa de céus abertos e do sobrenatural?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Danny afirma que ninguém pode se 'auto-indicar' para uma posição no Reino: Deus unge, e o Espírito no restante da equipe reconhece e recebe a pessoa, e é a honra que mantém esse funil conectado. Onde, na sua história, alguém enxergou e nomeou uma unção em você que você ainda não reconhecia — e a quem você precisa hoje fazer esse mesmo gesto de honra?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 3 — Governando a partir do céu  (aula ordem = 5)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 5;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 3 — Governando a partir do céu$t$,
      5,
$conteudo$... O governo está sobre os Seus ombros... Para que se aumente o Seu governo e venha paz sem fim sobre o trono de Davi e sobre o Seu Reino, para o estabelecer e o firmar mediante o juízo e a justiça, desde agora e para sempre. O zelo do Senhor dos

exércitos fará isto. (Isaías 9:6-7) mensagem deste capítulo é um ataque ao coração do Acusador. Mas, primeiro, tenho de lhe fazer uma pequena advertência porque vou escandalizar você por alguns instantes. Vou confundir todo o seu paradigma de justiça. Vou trazê-lo para fora, vou rir dele, vou fazer cócegas nele e depois vou chutá-lo escada abaixo. Tudo bem? Você vai ter de correr atrás dele pelas escadas se quiser tê-lo de volta.

Imagine isto. Seu filho que está na quinta série vem até você e diz: “Aqui está o meu boletim”. Você pega o boletim dele, abre-o, e ali está um zero. Seu filho da quinta série tirou zero. Ughhh! O espírito de medo se manifesta em você, assim como aconteceria com o coração de todo pai ou mãe. “Um aluno da quinta série com um zero! Ele está condenado. Condenado! É o fim. Não se pode tirar um zero no ensino fundamental!”.

Sem dúvida, com o medo apertando o seu coração, tudo em que você consegue pensar é: Como posso controlar os resultados dessa criança na escola? Poderíamos achar isso acerca de qualquer bom pai ou mãe. Como você pode controlar seu filho para atingir o seu objetivo, porque você o ama? Isso faz parte da lição de amor que a maioria de nós passamos para os nossos filhos: Aquilo que amamos, tentamos controlar.

Eu gostaria de apresentar outra opção. Imagine o pai ou a mãe indo até a criança e dizendo: “Nãããão! Um zero na quinta série? Temos um pioneiro! Você se adiantou aos acontecimentos, eu sabia que isso ia acontecer com você. Só quero que você saiba que sua mãe e eu conversamos. Nós tomamos uma decisão e queremos que você saiba: vamos amá-lo apesar de quantos anos demore para você ser aprovado na quinta série. E filho, nós pensamos em mais uma coisa: se você repetir apenas mais dois anos, sua irmãzinha estará na sua turma com você. Você e ela poderão ir a festas de aniversário juntos, etc.”

Seu filho vai olhar para você nos olhos e dizer: “Anos?”

“Hã-hãn”.

“Eu não vou levar anos para ser aprovado na quinta série!” E para a sua surpresa, o problema se instala no coração daquele que, desde o início, deveria ser o dono dele.

A maneira como criamos nossos filhos quando eles cometem erros reflete muito claramente o que acreditamos sobre o fracasso humano, particularmente sobre o pecado. Muitos de nós pensamos que o pecado, os erros e o fracasso são mais poderosos que o amor de Deus por nós. Muitos de nós pensamos que o fracasso humano é aquela força poderosa que tenta nos vencer, e que, portanto, precisamos manifestar um aparente poder sobre ela por intermédio da parceria com o espírito de medo! Mas quando os discípulos queriam invocar fogo sobre a multidão que foi desrespeitosa com Jesus, o Mestre apenas sacudiu a cabeça. “ Vós não sabeis de que tipo de espírito sois ”.[1] Além disso, 2 Timóteo 1:7 nos diz que não recebemos esse espírito de medo, mas de poder, de amor e de moderação, ou domínio próprio. Note que não é um espírito de “domínio dos outros”.

Quando temos medo do pecado dos outros, isso nos deixa loucos diante do pecado. Não somos nós mesmos. Não somos nós mesmos quando estamos lidando com os erros dos outros. Essa coisa estranha acontece conosco, e o resultado é que acabamos dando um nome negativo à criação de filhos e à liderança. Você sabe quantas pessoas estão fazendo aconselhamento por causa de relacionamentos danosos com a liderança? É uma experiência bastante familiar para nós ver líderes cooperarem com um plano demoníaco motivado pelo espírito de medo. Quando somos confrontados com os erros das pessoas, com algo que talvez não possamos controlar bem ali naquele instante, ficamos assustados e exercemos a nossa autoridade com o espírito errado.

Então projetamos em Deus a ideia de que Ele está com tanto medo do pecado quanto nós. Mas de que exatamente Deus está com medo, afinal? De nada. Exatamente — de nada. Ele não tem medo de nada porque o amor lança fora o medo, e Ele é amor. [2] Ele é o amor. Se você não está sentindo o amor quando Ele está presente, algo está errado, porque Ele é isto — amor! Quando você está sentindo medo, isso não é Deus.

Então, temos de decidir algo: que parcerias vamos fazer quando estivermos na presença do pecado? Era isso que fazia Jesus parecer um gênio. Jesus podia entrar e sair da vida dos pecadores. Ele entrava em um bar com prostitutas e ladrões, e dizia: “Ei, pessoal, como vocês estão? Sabe, havia um rabino, um sacerdote e um pregador batista...”. E as pessoas o adoravam! Elas diziam: “Não sei quem é esse cara, mas eu o amo, amo, amo!”

Mas os fariseus reagiam mais ou menos assim: “Olhe aqui, leproso. Toque este sino quando se aproximar, porque você me assusta. Ui, uma mulher menstruada! Ui, pessoas mortas! Onde podemos nos esconder? Para onde podemos ir? Vamos entrar no templo. Não pingue seu suor sobre mim, nada de suar em mim!” Jesus tinha o amor em cada poro, mas os fariseus nem sabiam do que ele se tratava. Assim, diante do pecado, os fariseus tinham medo, mas quando Jesus estava diante do pecado, Ele era a solução, o remédio. Ele era poderoso! Não Podemos Ser Punidos Por intermédio da cruz, Jesus apresentou algo ao mundo que ainda não entendemos. Ele fez com que cada um de nós não pudesse ser punido. Não podemos ser punidos! Essa afirmação não é uma questão de pensamento positivo, embora provavelmente você já tenha ouvido isso ser pregado. É nossa teologia alcançar os perdidos. “Entre no Reino do Céu livre e purificado dos seus pecados”. Declaramos isso de todos os púlpitos da terra.

Mas o pecado não precisa ser punido. Ele não precisa ser controlado. Ele não é uma força poderosa. O problema é que nós não cremos nisso. É fácil pregar sobre alguma coisa. Difícil é vivê-la!

Vamos considerar um pouco do que o apóstolo João tinha a dizer sobre como lidamos com o pecado após a cruz:

Meus filhinhos, estas coisas vos escrevo, para que não pequeis; e, se alguém pecar, temos um Advogado para com o Pai, Jesus Cristo, o justo.[3]

João mencionou algo sobre o que não falamos o suficiente. Pelo menos, eu não tenho ouvido essa mensagem há muito tempo. Ele disse: “Temos um advogado em Jesus Cristo. Temos o melhor advogado da cidade. Vamos sair desta”. Jesus está bem ali conosco em cada momento para ajudar a garantir a vitória. Ele venceu o pecado em nossas vidas. Depois de afirmar esse ponto de vista, João segue em frente e passa o restante do livro explicando que, por causa da cruz, a nossa vida não tem mais a ver com tentar pecar, mas com cumprir o mandamento que nos ordena amar. Mas só conseguiremos cumprir o mandamento de amar à medida que realmente entendermos o que a vitória que esus conquistou significa:

E ele é a propiciação pelos nossos pecados, e não somente pelos nossos, mas também pelos de todo o mundo.[4]

Ora, esse versículo apresenta alguma coisa, mas você precisa saber o que significa a palavra propiciação, certo? Ela tem de significar alguma coisa para você. Você não pode simplesmente ler por alto e dizer: “Blá, blá. Blá. Seja lá o que for, deve ser algo... algo velho”. Propiciação é a palavra para reparação. Ele pagou o resgate. Isso quer dizer literalmente que Jesus satisfez a ira de Deus para com o pecado. A morte de Jesus na cruz satisfez a necessidade de Deus de punir o pecado no homem. Quando Jesus foi para a cruz e entregou Sua vida como o sacrifício perfeito, Ele pôs fim a uma condição insaciável. Ele também apresentou uma realidade totalmente diferente com base em um relacionamento totalmente distinto entre Deus e a humanidade. Ele removeu a necessidade de punição. Ele removeu o medo do nosso relacionamento com Ele.

Diz 1 João 4:18: “No amor não há medo; ao contrário o perfeito amor expulsa o medo, porque o medo supõe castigo. Aquele que tem medo não está aperfeiçoado no amor” (NVI). Se quisermos conduzir as nossas comunidades ao avivamento e construir uma casa para a presença do amor, temos de saber como interagir uns com os outros de tal maneira que elimine a opção da punição, a necessidade de controlar as pessoas quando elas falharem. Quando estamos na presença do pecado e reagimos com medo e controle, isso nos faz parecer tolos. Seria bom aprendermos isso. Seria bom quebrar a nossa concordância com isso. Aqueles que pecam não precisam ser punidos. Temos de encontrar uma resposta para as vidas reais das pessoas que nos cercam, as vidas reais das pessoas que pastoreamos, as vidas reais das pessoas das comunidades em que vivemos — uma resposta para o pecado que não inclua punição. Bifurcação na Estrada Creio que a principal coisa que nos ajudará a mudar a nossa reação ao pecado é adquirirmos uma compreensão mais profunda da nova aliança que Cristo estabeleceu para nós. O apóstolo Paulo era apaixonado por nos mostrar que temos a escolha de viver em dois tipos de relacionamentos diferentes com Deus, e quando não entendemos a natureza desses relacionamentos, isso gera problemas. Em Gálatas 3, Paulo pergunta aos gálatas: “Quem os enfeitiçou? O que aconteceu com vocês? Quem enganou vocês? Quem permitiu que vocês alterassem completamente o seu sistema de crenças?” Então, ele diagnostica o problema: “Vocês estão tentando praticar duas alianças. Vocês estão tentando viver em dois acampamentos”.

Em Gálatas 4, ele distingue a Velha e a Nova Aliança, comparando-as aos dois descendentes de Abraão. Ismael, o filho da escrava Agar, representa a Velha liança, e Isaque, o filho de Sara, a mulher livre, representa a Nova Aliança. Em Gálatas 4:30 ele cita Gênesis: “ Lança fora a escrava e seu filho, porque de modo algum o filho da escrava será herdeiro com o filho da livre”. Em outras palavras, as duas alianças não podem coexistir no mesmo lugar. Ou você é um escravo sob a lei, ou você é um filho livre. Não há comunhão entre o amor e o medo. Você não pode ter os dois; você precisa escolher.

Ele conclui identificando aqueles que abraçaram Cristo: “ E assim, irmãos, somos filhos não da escrava, e sim da livre”.[5] O versículo seguinte, Gálatas 5:1, diz: “Para a liberdade foi que Cristo nos libertou. Permanecei, pois, firmes e não vos submetais, de novo, a jugo de escravidão ”. Em outras palavras, o apóstolo está dizendo: “Tudo bem, vocês têm duas opções. Se quiserem, vocês podem viver uma vida protegendo seu relacionamento com as regras. Mas se vocês quiserem dedicar sua vida a preservar seu relacionamento com as regras, vocês estarão na Velha Aliança”.

O motivo pelo qual Paulo está tão preocupado é que essas duas alianças diferentes produzem resultados diferentes. Anteriormente em sua carta, ele menciona que havia repreendido Pedro, que deveria saber o que era certo, por tentar levar os crentes gentios a obedecerem às regras da Velha Aliança, e depois explica por que isso estava causando problemas:

Nós, judeus por natureza e não pecadores dentre os gentios, sabendo, contudo, que o homem não é justificado por obras da lei, e sim mediante a fé em Cristo Jesus, também temos crido em Cristo Jesus, para que fôssemos justificados pela fé em Cristo e não por obras da lei, pois, por obras da lei, ninguém será justificado. “Mas se, procurando ser justificados em Cristo, fomos nós mesmos também achados pecadores, dar-se-á o caso de ser Cristo ministro do pecado? Claro que não! Porque se torno a edificar aquilo que destruí, a mim mesmo me constituo transgressor. Porque eu, mediante a própria lei, morri para a lei, a fim de viver para Deus. Estou crucificado com Cristo; logo, já não sou eu quem vive, mas Cristo vive em mim; e esse viver que, agora, tenho na carne, vivo pela fé no Filho de Deus, que me amou e a Si mesmo se entregou por mim. Não anulo a graça de Deus, pois se a justiça é mediante a lei, segue-se que Cristo morreu em vão”.[6]

Ele está dizendo que quando começamos a obedecer às regras da Velha liança, nos permitimos ser definidos como aqueles para quem essa aliança foi dada, a saber, os pecadores. Quando nos definimos como pecadores, nós, por definição, merecemos ser julgados e punidos. Quando protegemos o nosso relacionamento com as regras, o resultado não pode ser nada a não ser punição. Não apenas isso, quando escolhemos essa aliança sabendo que Cristo já tratou com o problema do pecado e abriu o caminho para nós nos relacionarmos com o Pai como filhos e filhas, então estamos realmente dizendo que a morte de Cristo foi sem propósito e estamos nos abstendo da única coisa que pode nos salvar: a graça. Agora você pode ver por que Paulo estava tão irritado com Pedro.

Infelizmente, o mesmo problema ainda precisa ser tratado em muitas das nossas igrejas. O declínio da unção do mestre acontece quando ela eleva o ensino das regras e o torna supremo no ambiente, levando as pessoas a seguirem e a cultivarem um relacionamento com as regras, em vez de um relacionamento com Cristo. Dizemos: “Ei, não se trata de religião, mas de um relacionamento”. Promovemos essa ideia em adesivos para carros e camisetas. Mas veja como a maioria dos ambientes eclesiásticos reage quando alguém quebra as regras. Todas as reações se voltam a pastorear a pessoa de volta a um relacionamento correto com as regras. A punição é a ferramenta por excelência para restaurar uma pessoa a um relacionamento correto com a cultura das regras.

O problema é que em Cristo não recebemos, de fato, um relacionamento com as regras, mas um relacionamento com o Espírito, um relacionamento de coração para coração, um relacionamento que pratica o amor. Em Romanos 7, Paulo fala sobre duas leis — a lei do pecado e a lei da vida em Cristo — e declara que a lei do Espírito de vida em Cristo nos libertou da lei do pecado e da morte, da lei do relacionamento com as regras. Mas esse não é o relacionamento ou a realidade para muitas pessoas. A maioria das pessoas tem um relacionamento com as regras, por isso o comportamento delas é motivado pelo medo da punição e não pelo amor.

Vou lhe dar um exemplo simples. Você está dirigindo pela estrada. Todos estão seguindo o fluxo do trânsito... Exceto um sujeito que está se desviando para lá e para cá. Esse sujeito está indo um pouco mais rápido que o fluxo do trânsito. Quando você se dá conta, há um carro da polícia rodoviária vindo pela via de acesso. Lá está ele. Todos estão extremamente cientes de que o carro de polícia está bem ali. “Ah, meu Deus, há um policial ali. Vou me atrasar. Não calculei isso quando programei o meu tempo de viagem. O que vou fazer?!” É como: “Tubarão na água! Tudo bem, pessoal, quem ele vai pegar?” E todos aceleram, certo? Não. Geralmente não. Todos diminuem a velocidade. “Vou ficar atrás dele. Vou desacelerar. Vamos todos ficar atrás dele”. Por quê? Todos querem proteger seu relacionamento com as regras e evitar a punição. Quando o policial encosta o carro e detém o sujeito ou sai da estrada, todos voltam a “fluir com o trânsito”.

É claro que todos sabem que as leis do trânsito são boas e devem ser respeitadas. Do mesmo modo, Paulo explica que a lei de Deus é boa no sentido de que ela revelou o poder do pecado em sua vida e a sua necessidade de redenção. Esse foi o propósito da Velha Aliança. Entretanto, a lei em si não pode trazer essa salvação. Somente na morte de Cristo podemos morrer para o pecado e ser livres para viver de acordo com uma lei diferente.

Paulo disse:

Porque, no tocante ao homem interior, tenho prazer na lei de Deus; mas vejo, nos meus membros, outra lei que, guerreando contra a lei da minha mente, me faz prisioneiro da lei do pecado que está nos meus membros... Quem me livrará do corpo desta morte?[7]

Ele continua dizendo:

Graças a Deus por Jesus Cristo, nosso Senhor. De maneira que eu, de mim mesmo, com a mente, sou escravo da lei de Deus, mas, segundo a carne, [aquela que morreu com Cristo], da lei do pecado.[8]

No capítulo anterior, ele nos dá uma chave para nos conduzirmos a andar na realidade que nos tira da Velha Aliança e nos leva para a Nova: “ Considerai-vos mortos para o pecado, mas vivos para Deus em Cristo Jesus ”.[9] Essa palavra considerar significa considerar a evidência e fazer um julgamento. O veredito de Deus sobre todo crente é que estamos mortos para o pecado em Cristo.

Paulo explica que a lei era apenas para os pecadores. Considerando que estamos mortos para o pecado em Cristo, fomos libertos de uma vida destinada a proteger uma relação com as regras. Romanos 8:1 nos diz: “ Agora, pois, já nenhuma condenação há para os que estão em Cristo Jesus, que andam de acordo com o Espírito e não de acordo com a carne”. A nossa experiência de vida sem condenação acontece de acordo com a maneira como andamos. Não passamos por condenação quando andamos, não de acordo com um relacionamento com as regras, mas de acordo com um relacionamento de amor. Não poder ser punido é o resultado de andar, através da fé e da graça, em um relacionamento com o Espírito. Tudo tem a ver com a minha conexão de coração para coração, com a minha união, com a minha atenção a um relacionamento com Cristo.

À medida que andamos no Espírito, a pergunta que devemos fazer constantemente é: como a minha vida está afetando o nosso relacionamento? Manter a lei da vida em Cristo significa que eu me administro a fim de preservar e proteger a minha relação com o coração dele. Não se trata de viver para me proteger do castigador quando quebro as regras. Muitos de nós acreditamos que quando Jesus disse: “ Se me amais, guardareis os Meus mandamentos”,[10] Ele queria dizer: “Se vocês Me amam, vocês Me deixarão controlá-los”. Se eu ainda tiver uma mentalidade formada a partir da lei do pecado e da morte, ouço Jesus dizer: “Mantenha o seu relacionamento com as Minhas regras!”

Uma perspectiva do Antigo Testamento faz com que João 14:15 soe como outra tentativa de Deus nos controlar. “Se você Me ama, obedecerá aos meus mandamentos.” O problema é, logicamente, que não existe uma lista de mandamentos de Jesus. Podemos tentar criar uma no esforço de proteger o nosso relacionamento com as regras dele, mas esse não é o ponto desse versículo. Jesus não está querendo apresentar o Novo Antigo Testamento àqueles que Ele morreu para libertar!

Mas quando ouvimos essa ordem com a nossa mentalidade da lei de Cristo, na verdade, nós ouvimos: “Se você Me ama, esse amor irá se refletir na maneira como você trata as coisas que Eu lhe disse que são importantes para Mim. A forma como você se comporta no nosso relacionamento será uma indicação clara para Mim do seu amor. O que você vai fazer? Não quero controlá-lo e não tenho controle sobre você. Foi por isso que Eu lhe dei o espírito de domínio próprio. É a sua atenção com o nosso relacionamento a fim de criar e manter a intimidade que manifesta a lei da vida em Cristo. Intimidade é como você aprende o que é importante para Mim, e se você Me ama, você ajustará o seu comportamento para proteger o Meu coração”.

No Sermão do Monte, Jesus fez algumas declarações que se parecem terrivelmente com uma versão mais rígida das velhas regras. Na verdade, o tipo de comportamento que Ele descreveu é impossível para qualquer pecador. Mas esus não estava dando aquelas ordens a pecadores — Ele as estava dando aos filhos e filhas da Nova Aliança que teriam acesso a uma natureza inteiramente nova e a uma graça sobrenatural. Ele estava simplesmente descrevendo como essas novas pessoas se comportariam. Lembre-se de que a Velha Aliança era uma aliança externa, um sistema de controles destinado a manter os pecadores na linha. Mas a Nova Aliança é uma aliança interna para filhos e filhas a quem, por causa da sua nova natureza, pode ser confiada a responsabilidade de se governarem e que têm acesso ao poder do domínio próprio por intermédio do Espírito Santo. O comportamento que Jesus descreve é evidência do poder superior que os filhos e filhas da Nova Aliança têm para andar em justiça.

É lógico que enfrentamos desafios ao aprender a andar no Espírito, mas esses não são os desafios que enfrentamos quando estamos querendo cumprir as regras. Eles são os desafios de morrer para nós mesmos e de exercer o nosso domínio próprio para permanecermos ligados ao fluir da graça de Deus que nos capacita a viver vidas livres do pecado. Assim, de certa forma, essa lei de Cristo é muito mais difícil do que simplesmente seguir o “fluxo do trânsito”. Mas as recompensas são infinitas porque é aí que entra o Reino. A lei que governa o Reino é a lei de Cristo, a lei do amor, e não a lei do cumprimento de regras. Quando nos alinhamos com o amor, o Reino do amor se manifesta em nossas vidas. O ponto que Paulo procura provar é: “Se vocês não têm amor, se vocês não têm isso, vocês não têm nada”. [11] Não existe vida nas regras. Você pode ser excepcionalmente obediente às regras, mas não manifestar a vida do Reino porque não há vida nas regras.

Se você acha que tem um relacionamento com Jesus e o amor não está se mostrando nos seus relacionamentos com as pessoas, então não sei o que você tem. Se você não pode cultivar relacionamentos de coração para coração e praticar a intimidade com as pessoas, adivinhe quem está seguindo quem? Se você não conhece a Deus, Ele se parecerá muito com você. Você o inventará, e você será uma estrela do rock nesse relacionamento. Quando não sabemos quem Deus é, isso acontece porque não conhecemos o Seu amor nem sabemos como o Seu amor funciona, então ficamos assustados e o transformamos (e ao nosso relacionamento com Ele) em algo que já conhecemos.

E adivinhe o que vamos ensinar aos nossos filhos? Vamos ensinar aos nossos filhos o que já sabemos. Não vamos ensinar aos nossos filhos um relacionamento de ligação de coração para coração. Não vamos ensinar intimidade aos nossos filhos. Não vamos ensiná-los a administrar a metade deles de “nós” se vivemos a vida em um relacionamento de cumprir regras. Você sabe o quanto é desanimador ter um relacionamento com as regras? Pergunte ao seu filho adolescente. Ele lhe mostrará.

A verdade é que damos a todos os que fazem parte do nosso círculo de influência o que conhecemos, e isso contribui para o desenvolvimento de uma cultura de relacionamento que é guiada por regras ou guiada pelo amor. E só uma cultura promove a honra, porque apenas ela reconhece com exatidão a plenitude da identidade que Deus nos deu. Não existe cultura da honra sem uma convicção forte de que somos filhos e filhas livres da Nova Aliança, e não escravos da Velha. Precisamos fazer o que for preciso para abraçar corajosamente essa verdade de quem somos, andar nela e passar a conhecê-la como a nossa realidade. Só então poderemos criar e transmitir vida, amor e liberdade — o Reino — aos que nos cercam. Sempre transmitimos o que conhecemos e o que temos. Se tudo o que conhecemos é medo e controle, e é isso que continuamos vendo no nosso ambiente, então precisamos corrigir as nossas convicções essenciais sobre nós mesmos, o pecado e a obra da cruz.

Geração após geração, as pessoas da igreja têm vivido a vida tentando proteger um relacionamento com um livro de regras. Você pode até dizer que não é assim, mas o que acontece quando alguém quebra as regras? Esse é o seu termômetro. O que acontece quando alguém transgride o que você está vivendo para proteger? É nesse momento que essa cultura vai se manifestar. Esse é o seu teste. O que acontece quando o Joãozinho traz um zero para casa no boletim? Sua reação é a evidência do quanto as regras são importantes para você.

Quando entramos em pânico diante do pecado, isso é evidência do quanto as regras são importantes para nós. Eu diria que temos evidência suficiente para garantir que as regras são extremamente importantes em grande parte da cultura da igreja. É hora de olharmos para essa evidência e admitirmos que as nossas reações temerosas contradizem diretamente a mensagem de Cristo que pregamos. A Bíblia é clara ao dizer que temos duas opções — podemos escolher proteger as regras e criar uma cultura religiosa ou proteger os nossos relacionamentos e criar uma cultura de amor. E só uma dessas opções representa a aliança que Cristo morreu para fazer conosco.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Danny diz que 'aquilo que amamos, tentamos controlar', e que diante do erro dos outros entramos em pânico e exercemos autoridade com o espírito de medo em vez do espírito de poder, amor e domínio próprio. Pense na última vez em que alguém que você lidera falhou e te assustou: você governou a partir do medo ou do amor — e como a pessoa percebeu isso?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo distingue dois relacionamentos: um que protege as regras (e por isso só pode punir) e um que protege o relacionamento (e por isso pode restaurar). Danny dá um termômetro: 'o que acontece quando alguém quebra a regra' revela qual cultura você de fato cultiva. Quando alguém transgride aquilo que você vive para proteger, sua reação revela uma cultura de regras ou de amor?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Danny afirma que a Nova Aliança é uma aliança interna, em que a filhos e filhas pode ser confiado o governo de si mesmos pelo domínio próprio, e que 'guardar os mandamentos' não é deixar Deus te controlar, mas ajustar seu comportamento para proteger o coração dele. Você lidera as pessoas como filhos a quem se pode confiar o autogoverno, ou como pecadores que precisam ser mantidos na linha por controle externo?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 4 — Filhos da luz muito amados  (aula ordem = 6)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 6;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 4 — Filhos da luz muito amados$t$,
      6,
$conteudo$Frequentemente damos às crianças respostas para lembrar em lugar de problemas

para resolver.[1] (Roger Lewin, Teórico Científico) P orque noutro tempo éreis trevas, mas agora sois luz no Senhor; andai como filhos da luz...”.[2] Paulo faz uma declaração impressionante e apresenta uma revelação penetrante com essa afirmação. Muitos cristãos estão empacados na revelação apresentada na primeira metade desse versículo. creditamos que a “natureza” do homem é trevas, por isso tivemos uma grande dificuldade no período de transição entre as trevas e a luz do Novo Testamento. Nós nos demoramos tanto na mentalidade de enganoso é o coração, mais do que todas as coisas, e perverso; quem o conhecerá? ,[3] que falhamos em cultivar a verdade de que somos “filhos da luz”. Sim, um dia fomos trevas, mas essa natureza mudou completamente. O nosso medo do pecado precisa ser removido e as nossas ofensas desarmadas antes de permitirmos que o Céu governe na terra por meio de nós.

Quando as pessoas pecam, isso é ofensivo. Quando as pessoas quebram as regras, isso é ofensivo à natureza humana. O mundo fica ofendido com o pecado. Veja as manchetes do seu jornal:

“Estrela de Hollywood vai para a cadeia.”

“Não, ela não vai para a cadeia.”

“Sim, ela vai voltar para a cadeia.”

“Ela encontrou Deus na cadeia.”

“Ela abandonou Deus na cadeia.”

“Sabe aquele sujeito do rádio, de quem a maioria de nós nunca ouviu falar até que ele fez uns comentários raciais infames, vamos crucificá-lo publicamente, chutando-o escada abaixo e fazer uma votação nacional para despedi-lo.”

“Professor de escola molesta criança.”

“Policial viola a lei.”

As pessoas amam essas coisas. “Espere, deixe-me ler! Não vou comprar o seu jornal, exceto se houver algo ofensivo nele.” É natural ficar ofendido quando alguém quebra as regras. Colocamos as pessoas na prisão e as chamamos de ofensores. Nossa sociedade está cheia de pecadores cometendo pecado e, naturalmente, nossa sociedade está presa a um relacionamento com as regras. lgumas pessoas definem seu relacionamento com as regras quebrando-as. A mensagem que elas desejam transmitir é: “Não serei controlado”. Mas sem um relacionamento com o amor, a única opção que a nossa sociedade tem é descobrir uma maneira de viver a vida dentro do confinamento das regras.

Muitas regras exigem muitos juízes, e as pessoas amam fazer o papel de juiz. É para isso que são as manchetes e as edições de notícias, para nos ajudar em nossas habilidades de juízes. Imagine a imensidão de pessoas que se sentam todas as noites para assistirem suas TVs com uma atitude de julgamento e repugnância. Agora, considere quantas dessas pessoas são cristãs.

Nós, como crentes vivendo nesta cultura mais ampla, precisamos estar cientes dos esquemas do inimigo. Temos de estar cientes do quanto é natural ser ofendido, e o que a ofensa nos causa. O que a ofensa faz com você é que ela justifica que você retenha o seu amor. Eu posso reter o meu amor de você quando você quebra regras, porque as pessoas que falham são indignas de amor, e elas merecem ser punidas. Na verdade, punição é reter o amor. E quando eu retenho o amor, a ansiedade preenche o vazio, e um espírito de medo dirige o meu comportamento para com o ofensor.

Quando temos medo, queremos controlar, e as nossas reações ao pecado das outras pessoas são um conjunto de controles que nos ajudam a sentir que ainda estamos no comando. As práticas típicas da família, das igrejas e do governo são um conjunto de séries de comportamentos chamados de “punições” diante de um ofensor, exigindo que ele passe por essas punições, a fim de provar que a família, as igrejas e o governo ainda estão no comando do ambiente. Ao fazer isso, ajudamos a confirmar a crença, na pessoa que optou por pecar, de que ela é incapaz para mudar e para assumir a responsabilidade pelo seu comportamento. Todo esse negócio é justamente aquilo de que Jesus morreu para nos livrar. Ele nos apresentou um mundo totalmente novo com outro caminho inteiramente diferente. Um Homem Segundo o Coração de Deus Embora tenha vivido sob a Velha Aliança, Davi era um homem que valorizava o seu relacionamento com Deus mais do que as regras. E em 2 Samuel podemos perceber o que aconteceu a esse homem quando ele as quebrou. Em 2 Samuel 11 lemos a história do dia em que Davi deveria ter ido para a guerra, mas ficou em casa. Ele ficou em casa e mandou Joabe ir trabalhar.

Uma tarde, levantou-se Davi do seu leito e andava passeando no terraço da casa real; daí viu uma mulher que estava tomando banho; era ela mui formosa.[4]

Ele perguntou: “Quem é aquela?” E disseram: “Bem, aquela é a mulher de Urias”. Urias o hitita era um dos valentes de Davi — um do círculo íntimo, um dos seus amigos. E então lemos em 2 Samuel 11:4: “ Então, enviou Davi mensageiros que a trouxessem; ela veio, e ele se deitou com ela”.

Se sabemos alguma coisa sobre Bate-Seba, sabemos que ela era uma mulher impressionante. Como sabemos disso? Por causa de com quem ela era casada. Urias era brilhante. Ele não teria se casado com uma mulher atirada. Davi a tomou, levou-a para o seu quarto e se deitou com ela. É muito provável que Davi tenha violentado Bate-Seba.

Esse mesmo versículo segue em frente dizendo: “Tendo-se ela purificado da sua imundícia, voltou para sua casa” — apenas para enviar algum tempo depois uma mensagem a Davi dizendo que estava grávida. Ora, isso não aconteceu em um fim de semana. Isso levou meses. Isso foi antes de terem criado os testes de farmácia, em uma época que não se podia antecipar essa notícia. Estou certo de que ela esperou até ter certeza para dizer ao rei que estava grávida, portanto deve ter sido meses depois.

Quando Davi descobriu, ele disse: “Onde está Urias? Ei, vão procurá-lo e vamos dar a ele um tempo de folga. Ah, Urias! Como é bom ver você! Vamos lá, tragam-no aqui. Urias, que homem incrível você é, venha cá. Eu gosto muito de você. Obrigado por tudo o que você está fazendo apoiando o esforço da guerra. gora, vá dormir com a sua mulher. Ouvi dizer que ela engordou porque tem comido muito ultimamente. Acho que ela está meio angustiada. Talvez você queira consolá-la. Preciso de ajuda para encobrir a consequência do meu pecado”.

Mas Urias não quis fazer isso. Davi mandou comida para ele. “Ei, sabe de uma coisa, vá e alegre-se”. Mas Urias dormiu nos degraus diante da casa do rei. Ele não quis ir para casa. Ele disse: “Por que eu iria dormir com minha mulher em minha cama quando os homens estão deitados em um campo? Não irei”.

Davi pensou: Maldição! Um homem de caráter. Eu não esperava por isto. Então ele decidiu: “Ei, vamos fazer uma festinha. Vamos ver se conseguimos embriagá-lo. Talvez se conseguirmos embriagá-lo, possamos fazer com que ele fique fora de si e então podemos fazê-lo encobrir o meu pecado. Urias! Ei, cara, eis aqui um pouco de vinho, o melhor que tenho. Quer que eu encha de novo para você? Aqui está, companheiro. Por que eu dei a você a taça grande? Bem, é uma taça de honra. É, é isso aí”.

Naquele momento, Urias realmente dormiu em uma cama — nos aposentos dos criados. O que Davi ia fazer? “Está certo, tudo bem. Meu tempo está se esgotando aqui. Ela vai dar à luz em breve e eu preciso resolver isto. Olhe, Urias, pegue este bilhete e o entregue a Joabe. Tome a sua sentença de morte e a entregue ao seu comandante”.

Isso não aconteceu em um fim de semana. Essa não foi apenas uma pequena aberração no caráter de Davi. Davi estava praticando algo. Sem duvidar, Joabe enviou Urias para a frente de batalha, recuou as tropas, e ele foi morto. O mensageiro voltou e Joabe disse: “Diga a Davi que perdemos alguns homens muito bons nesta batalha. Se ele ficar irritado com você, diga a ele: ‘Ah, e por falar nisso, Urias morreu’”.

Então o mensageiro voltou com a mensagem: “Perdemos bons homens... e Urias morreu”. Davi disse: “Sabe, pessoas boas morrem. Diga a Joabe: ‘Pessoas boas morrem em batalha. Faz parte da guerra. Tomem a cidade amanhã’. Isto deixará Joabe feliz — ele gosta de matar”.

Você conhece a história. A esta altura, já era hora de confrontar a situação. O profeta Natã foi até ele e disse: “Cara, é você!” Então Davi passou sete dias se arrependendo de cara no chão, e a criança morreu como Natã disse que aconteceria. Então lemos em 2 Samuel 12:24: “Então, Davi veio a Bate-Seba, consolou-a e se deitou com ela; teve ela um filho a quem Davi deu o nome de Salomão”.

Então... hummm. Sim, o Senhor tirou a vida da criança. Mas algo não está bem entendido aqui. Onde está a punição do “Antigo Testamento” nessa história — uma punição que realmente “se encaixe no crime”? O Reino não foi retirado dele como aconteceu com o rei Saul. Ele também não foi derrotado por uma nação inimiga nem levado cativo. Sua família ficou marcada para sempre pelos atos de Davi. Mas geralmente não sentimos o peso do que Davi fez com Urias e Bate-Seba, porque Deus disse que ele era um homem segundo o Seu coração. Mas quem entre nós quer ter Davi como o nosso pastor nos dias atuais?

Precisamos entender que se Davi fosse o presidente dos Estados Unidos, ele seria equivalente a um Bill Clinton dos nossos dias — exceto pelo fato de que Bill Clinton nunca matou nenhum de seus amigos nem se casou com a esposa de seu amigo. Você se lembra de ficar ofendido com Bill Clinton? Você se lembra de ter se alegrado ao pensar na punição de Bill Clinton? Você percebe qual é a reação natural ao pecado que existe no homem?

Há outros exemplos na Bíblia dignos de nota, exemplos que desafiam as expectativas da justiça criada pelas regras. Veja Abigail. Ela era uma mulher insubmissa, basicamente. Ela fez o que seu marido Nabal havia se recusado a fazer: pegou as coisas de seu marido e as entregou a Davi, que estava muito irritado. Davi estava indo matar Nabal, mas Abigail reverteu a situação, e isso fez dela uma mulher rebelde e insubmissa — de acordo com as regras. E qual foi a reação? Deus matou seu marido estúpido e ela se casou com Davi. [5]

E houve Pedro. “Pedro, você vai Me negar.”

“Ah, isso jamais acontecerá. Eu jamais O negarei.”

“Antes que o galo cante.”

“Nunca acontecerá.”

“E sabe de uma coisa? Se vocês Me negarem diante dos homens, Eu os negarei diante de Meu Pai.”

Sem dúvida, Pedro O negou. E o que Jesus fez?

“Pedro, Você Me ama?”

“Sim.”

“Pedro, Você Me ama? Pedro, você vai proteger as coisas que Eu lhe disse que são tão importantes para Mim? Pedro, você vai administrar a sua vida de tal maneira a Me proteger?”

“Sim, Senhor. Sim, eu vou.”[6]

E temos a mulher adúltera. Qual foi a resposta de Jesus para ela? Vá e não eques mais.[7] Uau! Isso vai deixar uma marca! Ou não, na verdade, com certeza não. Pelo menos não o tipo de marca que o restante das pessoas estava esperando deixar nela. Qual É a Diferença? Então, por que Deus reagiu de forma diferente com essas pessoas? Por que Davi e Pedro tiveram um resultado diferente do que mereciam? Por que eles tiveram uma resposta diferente das outras pessoas que cometeram os mesmos erros? Qual era a diferença entre Davi e Saul, por exemplo? Bem, Saul simplesmente não matou todos os que devia matar. Qual foi a diferença entre Pedro e Judas? Pedro negou Jesus três vezes, enquanto Judas o traiu uma vez. Na verdade, a verdadeira diferença é algo extremamente importante, e não está no pecado deles, mas sim no que eles fizeram depois. É o arrependimento. Mas o arrependimento só funciona quando a prioridade do ambiente é uma relação de coração para coração.

O arrependimento não satisfaz as regras quebradas. O arrependimento não funcionará em um ambiente onde estamos protegendo um relacionamento com as regras. Em um ambiente movido pelas regras, o arrependimento tem um significado diferente. Ele significa a sua disposição em me deixar puni-lo. Você está arrependido quando permite que eu imponha as minhas punições a você. E o problema do coração, que o levou a cometer o erro em primeiro lugar, nunca é tratado, porque o problema do relacionamento e do amor nunca é abordado. A atitude geral para com alguém que está arrependido em uma cultura regida pelas regras é: “Você submeteu a sua vontade a mim no nosso ambiente. Porém, nunca poderei confiar em você, porque você provou ser alguém que quebra regras, e isso ficará na minha memória por muito tempo. Até que eu comece a esquecer o quanto fiquei chocado com você, nunca poderei lhe dar poder novamente”. Essa atitude é o que rege o que chamamos de “processo de restauração”.

Mas o verdadeiro arrependimento é um dom. Ele não é a sua opção. Não é o seu chamado. É um dom que surge em um relacionamento. Não há lugar para o arrependimento nas regras, somente para a punição. Se você quebrar as nossas regras, então pagará o preço. É assim que funciona. Você paga o preço para aliviar as ansiedades das pessoas que fazem parte do ambiente e que vivem de acordo com as regras. Se você cometer o crime, então terá de pagar o preço. Quando praticamos isso na igreja, estamos nos permitindo ser definidos pelos limites do governo da terra. Quando você quebra a lei, o melhor que o governo da terra pode fazer é dizer: “Nós os ferimos o suficiente para que vocês se acalmem”.

O dom do arrependimento gera a oportunidade para a verdadeira restauração. Na verdade, ele é absolutamente necessário para curar um relacionamento que foi ferido por um comportamento pecaminoso. O verdadeiro arrependimento só pode vir por intermédio de um relacionamento com Deus, no qual entramos em contato com a graça do Senhor para mudar. Davi passou sete dias no chão se arrependendo diante de Deus. Saul também tentou arrepender-se diante de Samuel por quebrar as regras. Mas quando Davi se levantou do chão, ele era outro homem. Como sabemos disso? Ele nunca mais fez o mesmo. Não houve outra Bate-Seba.

Então, o que é a verdadeira restauração? Um velho significado da palavra “restauração” é “encontrar alguém com uma linhagem real que foi removido do trono e depois restaurar essa pessoa a esse trono, a uma posição de honra”. Mas colocar um monarca de volta em seu lugar de autoridade raramente é o que chamamos de “processo de restauração” quando lidamos com os líderes da igreja que quebraram regras. Muitos líderes que caíram deixaram suas igrejas ou denominações e foram em busca de um “novo começo”. Isso significa que eles encontram um grupo de pessoas que não têm medo que eles quebrem as regras outra vez.

Mas quando Deus restaura aqueles que se arrependeram, o processo de restauração dele é como restabelecer um membro da família real ao seu lugar de domínio e honra. O crente restaurado pode dizer: “Agora sou um filho de Deus outra vez”. A restauração para o crente é sempre uma restauração de relacionamento, porque a restauração é definida pela cruz, e restaurar um relacionamento foi o que a cruz fez. Depois que João declarou que Jesus se tornou a propiciação pelos nossos pecados, ele concluiu: “ Se Deus assim nos amou” — isto é, se Deus estava tão disposto a proteger o Seu relacionamento conosco em vez de proteger o nosso relacionamento com Suas regras — “também nós devemos amar uns aos outros” (1 João 4:11). Em outras palavras, devemos amar uns aos outros dessa mesma forma. O padrão do governo do Céu é aprendermos a cultivar e proteger o nosso relacionamento com Deus, com o amor e uns com os outros. E se não pudermos fazer isso, não refletiremos o Céu para a sociedade em que vivemos. Apenas teremos regras mais rígidas que nos ofendem mais depressa, e julgaremos com mais frequência e ficaremos famosos por sermos juízes ofendidos.

Jesus nos deu uma chave para ficarmos livres da lei que nos mantém presos a um modelo de governo terreno, particularmente de como esse modelo reage ao pecado. Em minha opinião, o motivo pelo qual um ambiente apostólico e profético é tão importante é porque ele renova constantemente e refrigera a nossa consciência e confiança nos valores essenciais do Céu, para podermos trazê-los à terra. Parece claro para mim que o melhor que podemos fazer em um ambiente onde os mestres e pastores lideram, é simplesmente justificar o comportamento equivocado de utilizar modelos terrenos para lidar com o povo de Deus. Quando começarmos a aplicar os valores essenciais do Céu à cultura das nossas congregações e famílias, entre eles esse valor essencial de que não podemos ser punidos, creio que essas culturas serão verdadeiramente reformadas. s pessoas experimentarão vida de uma maneira completamente nova. Cheio de Luz Quero lhe contar uma história que resume o que é a restauração celestial. Um amigo meu, um pastor e mestre — um dos mestres mais capazes e brilhantes que conheço pessoalmente — chamou-me um dia e disse: “Estou com um problema. Tenho um líder de adoração que acaba de confessar para a sua esposa um relacionamento imoral. Isso acontecia havia anos. Era com a melhor amiga da esposa dele. Na verdade, ele e sua esposa foram os mentores dessa mulher e do marido dela quando o casal veio para a igreja e assumiu uma posição na equipe trabalhando com a juventude. Ele acaba de contar para a esposa, e eles estão saindo de férias amanhã”.

“Não sabemos o que fazer, porque ele não é apenas um líder de adoração qualquer. Esse cara é impressionante. Ele tem levado nossa igreja a novas alturas em Deus. Durante os últimos quatro anos, a unção em nossa igreja aumentou. Iniciamos uma escola de ministério, e ele e sua esposa dirigem essa escola. Este é o nosso terceiro ano. Praticamente dobramos o número de matrículas em nossa escola em três anos. Esse casal é pioneiro na criação de um ambiente fantástico.”

Esse pastor havia me telefonado porque ele sabia algo. Ele sabia o que tinha de acontecer quando a verdade aparecesse, porque ele sabia o que costuma acontecer em nossas igrejas quando você quebra as regras e está em um relacionamento com elas. Eles tinham de fazer aquele homem passar pelo “processo de restauração”. Mas esse pastor também sabia que o processo de restauração que tínhamos na Bethel Church era diferente do que ele sempre conhecera. Então ele perguntou se eu estava disposto a me encontrar com esse casal primeiro e depois dar a ele alguma ideia de como agir.

Eu disse: “Ficaremos felizes em nos encontrarmos com eles”. Minha esposa Sheri e eu nos encontramos com o casal cerca de dois dias depois. Quando eles entraram, a esposa parecia estar chorando há uma semana. Ele parecia ter sido arrastado pelo fundo do carro durante as oito horas de viagem que fizeram pela estrada. Ele estava simplesmente arrasado de vergonha. Sabia que havia destruído seu relacionamento com as regras, e sabia que precisava ser punido. Ela estava simplesmente devastada — seu coração estava partido. Toda a confiança que ela um dia teve estava destruída; cada pedacinho da vida que ela vivera até aquele momento estava perdido e transformado para sempre. Ela ia perder o seu precioso ministério na igreja. A vida dela havia terminado por causa do incrível egoísmo dele.

Então simplesmente nos sentamos e os ouvimos por alguns minutos, e ele fez o melhor que pôde para nos dizer o quão terrível ele era. “Sabem, vocês têm de entender, eu sabia o que era certo. Eu sabia o que estava fazendo. Eu estava escondendo aquilo. Havia uma guerra dentro de mim e eu tive esse problema a vida inteira. Há dezoito anos, quando nos casamos e ela estava grávida do nosso primeiro filho, cometi adultério com a melhor amiga dela também.” Ele continuou tentando nos convencer de que merecia ser punido.

Então, Sheri profetizou algo sobre ele. Ela disse: “Vejo uma mão saindo do céu, segurando um cabo e virando uma chave, e então todas as luzes se acendem. É como se você estivesse cheio de luz, e tudo está completamente diferente. É isso que o Senhor vai fazer”.

Ele disse: “É muito gentil da sua parte dizer isso. Apenas não posso acreditar nisso agora. Sinto-me a um milhão de quilômetros de distância disso neste momento”.

Estamos assistindo ao choque entre dois reinos: o reino do medo e o reino do amor, o reino da liberdade e o reino do controle, o reino da luz e o reino das trevas. O reino terreno que esse casal conhecia era gravemente limitado em seu poder para restaurar um filho da luz. Mais uma vez, a verdade é: “Um dia vocês oram trevas. Agora vocês são luz. Vivam como amados filhos da luz”. [8] Mas os amados filhos da luz não podem ser governados pelas trevas, nem mesmo pelas melhores trevas que pudermos encontrar. Por mais misericordiosas, justas, capitalistas e democráticas que as trevas sejam, elas não podem governar os filhos da luz.

Sheri e eu tínhamos o objetivo de convidá-los a experimentar o poder de um ambiente apostólico que tornou os recursos do Céu permanentemente disponíveis. Estávamos cientes de que tínhamos acesso ao recurso da luz em uma atmosfera que requer luz. Quando o Céu invade a terra, ele vence as limitações do homem natural e das perspectivas naturais.

Não acreditávamos que o que aquele homem havia feito era evidência da sua verdadeira identidade. Paulo disse que um dia fomos trevas, mas agora somos luz. Só porque você tem trevas em você, isso não muda a sua verdadeira identidade.

Um amigo e eu estávamos andando pela propriedade de Mountain Chapel um dia. Estávamos tentando decidir onde construir o prédio da nova igreja. Enquanto caminhávamos, pisei em uma tábua e um prego entrou no meu pé. Levantei o pé e vi que havia uma tábua presa embaixo do meu sapato. Eu podia ver claramente que um prego entrara no meu pé. Mas nem por um instante pensei: “Sou um prego!” E quando um filho da luz descobre que há trevas dentro de si, isso levanta a questão: “O que você vai fazer? O que você vai fazer?”

Como líderes, podemos ajudar as pessoas nessa situação ficando ao lado delas e ajudando-as a ter a convicção de que isso é o que Deus está lhes pedindo. Precisamos transmitir a mensagem: “Não é o meu trabalho controlá-lo. Eu não estou assustado. O que você vai fazer?”

Então, iniciamos o processo de restauração com esse casal fazendo algumas perguntas. Levamos a nossa luz conosco. Viver em um sistema de governo apostólico nos ajuda a naturalmente extrair luz do Céu para os nossos relacionamentos pastorais. Portanto, temos um processo que cura os nossos relacionamentos com as pessoas que quebram as regras. Isso nos torna poderosos diante do pecado. Não temos medo do pecado. O pecado não é nada! O pecado é trevas! Basta um giro da chave e clique — acabou!

Então fiz a pergunta que faço a todos nesta situação:

— Qual é o problema?

Ele me olhou como se eu estivesse bêbado, porque ele pensava que havia feito um trabalho excelente me dizendo qual era o problema.

— Acabo de lhe dizer. Sou um miserável promíscuo, fantasiado de filho da luz. O que você quer dizer com “qual é o problema”?

— Qual é o problema? Você não sabia que fazer isso era uma má ideia? — perguntei.

— Sim — ele respondeu.

— Você não sabia que quando sua esposa ou seu pastor descobrissem isso, a coisa iria acabar mal? — Inclinei-me para a frente em minha cadeira.

— Sim — ele respondeu novamente.

— Mas, assim mesmo, você seguiu em frente? — Insisti.

— Sim — ele não tinha certeza se eu estava me preparando para dar um soco no seu nariz ou o quê.

— Então, qual é o problema? — perguntei novamente.

— O quê? — ele perguntou, com a testa franzida e a boca puxada para um lado.

— Qual é o problema que levou um homem a provocar tamanha destruição em sua família, na igreja que ele ama e na sua paz com Deus? O que faria um homem chegar a esse ponto? Qual é o problema?

— Não sei — ele respondeu desanimado.

— Você se arrependeu?

— Sim — ele respondeu com um fervor firme, embora o seu tom o traísse e mostrasse uma dúvida de que esse arrependimento estivesse pronto para passar por um teste.

— De quê? — perguntei, encurralando-o.

Ele olhou para mim, sem saber se eu estava a favor dele ou contra ele, e respondeu:

— Não sei.

— Era isso que eu estava pensando. Como essa situação pode mudar se você nem sequer sabe como se arrepender? — perguntei.

— Não sei — ele disse, resignado.

— Era isso que eu estava pensando também!

Sheri e eu estávamos olhando para aquele homem a partir de uma perspectiva de luz. Pretendíamos resolver aquele problema a partir de um contexto celestial, porque aquilo fazia parte da nossa cultura. Era natural para nós abordarmos o pecado e o fracasso a partir de uma perspectiva que torna Deus mais poderoso que o pecado. O homem, no entanto, estava convencido de que ele era trevas. Ele sabia que o governo da terra estava esperando para julgálo. Ele concordava com o paradigma da terra e estava pronto para aceitar o seu veredicto de julgamento. Era o nosso trabalho fazê-lo passar a ver a si mesmo a partir de outro ponto de vista. Ele precisava acreditar que era um filho da luz muito amado.

— Mais uma vez. Qual você acha que é o problema aqui? — perguntei.

— Eu realmente não sei.

A esta altura do confronto, eu não sabia qual era o problema também. Então decidi explorar um pouco.

— Bem, diga-me uma coisa. Como é a sua relação com a sua esposa? — perguntei, sabendo que era improvável que ele tivesse uma ligação muito forte com ela. O adultério geralmente é um sintoma de que um casal tem problemas de intimidade um com o outro.

— Nós não temos uma relação, ou uma relação muito forte — ele respondeu tristemente.

— Qual é a linguagem de amor da sua esposa? — perguntei. Eu queria ver se ele sabia como amar sua esposa.

— Palavras de encorajamento — ele disse, olhando para ela.

A esposa, soluçando, disse:

— Em dezoito anos, ele quase nunca disse que me ama.

Finalmente estávamos chegando a algum lugar. Eu podia ouvir os perseguidores do céu gritando em meus ouvidos. Eu sabia que aquele homem era um homem apaixonado. Aquele homem estava levando o ministério deles a grandes alturas em unção. A igreja deles havia crescido incrivelmente ao longo dos anos, e era vibrante e cheia de vida sob a liderança daquele homem. Então eu disse:

— Sua esposa se sente amada quando você a enaltece por meio de palavras, e você não consegue balbuciar um “eu te amo” para ela. Enquanto isso, ela o assiste liderar as massas cantando “Eu te amo” para Deus. É isso que você está me dizendo?

Eu podia ver que ele não estava me acompanhando, então procurei ajudá-lo novamente a ver a contradição que estava vivendo.

— Deixe-me ver se entendo o que você está me dizendo. Você lidera pessoas na adoração e na busca apaixonada pelo coração de Deus. Você escreve canções que expressam essa paixão e esse amor incrível por Deus. Mas você não direciona nada dessa força para a sua esposa. E quanto aos seus filhos?

— Não consigo dizer “eu te amo” a ninguém, nem mesmo aos meus filhos — ele disse em meio às lágrimas. — Eu sou exatamente como o meu pai. Meu pai também não consegue expressar amor por ninguém.

Havíamos acabado de encontrar o problema. Ficamos sentados ali um pouco perplexos. Aquele era o fundo do poço que ninguém de fora dessa família conhecia ou havia experimentado. Mas também tínhamos outro problema. Eu não sabia o que fazer em seguida. Ficamos sentados em silêncio, interrompidos apenas pelo som de choro e de narizes fungando. Então, de repente, recebi uma palavra do Senhor. Eu não sabia se era uma palavra de sabedoria ou uma palavra de conhecimento ou o que era. Tudo que soube foi que eu não sabia o que fazer antes de recebê-la. Inclinei-me para a frente, agora confiante de que esta era a chave. Perguntei:

— Você está querendo me dizer que só pode amar aquilo que você acha que é perfeito?

Ele olhou para mim, fez uma pausa e disse:

— Não.

— Deixe-me dizer isto de novo. Você está me dizendo que só pode se arriscar a amar onde não existe chance de fracasso? Você está me falando que só pode amar o que você acredita ser perfeito, para que não haja possibilidade de se magoar?

Sua esposa entendeu claramente o que eu estava perguntando, e novas lágrimas começaram a descer.

Ele olhou para mim como se eu o tivesse atingido no nariz com um jornal enrolado.

Perguntei novamente:

— Você está me dizendo que não pode arriscar o seu coração em nada que possa não ter um resultado perfeito?

Ele começou a sacudir a cabeça, mas então começou a sacudi-la negativamente. De repente ele disse:

— Fui enganado. exatamente isso que eu detestava em meu pai. Fui enganado! — ele disse duas vezes seguidas.

Então, a esta altura, convidei-o para passar alguns minutos perdoando ao seu pai. Depois que ele fez isso, uau! Ele se virou para a sua esposa e disse com uma sinceridade total:

— Eu amo você tanto. Eu sinto muito!

Em um instante toda a sala se acendeu. Aquilo nos fez ter vontade de cantar: Sou livre finalmente, Sou livre finalmente! Obrigado, Deus Todo-Poderoso! Sou livre inalmente! O Céu me tocou!

Ele continuou confessando para a sua esposa:

— Eu amo você. Eu amo você. Eu não sabia o que havia de errado comigo...

Quando ele disse isso, o semblante de sua esposa mudou completamente. A desesperança deixou a sala enquanto aquela mulher começou a experimentar aquilo que alguns minutos antes ela pensava que só iria acontecer no Céu. E ela estava certa. É lá que eles guardam essas coisas. Nós apenas tínhamos de ir buscar um pouco delas e trazê-las à terra. Depois de alguns instantes eles eram um casal de pombinhos apaixonados, sentados ali abraçados.

Foram dois milagres que aconteceram naquela manhã. Um foi o dom do arrependimento que o atingiu e o nocauteou. E o outro foi a disposição dela em perdoá-lo em um instante. Em um instante, as luzes se acenderam e ele tinha uma vida completamente nova — eles tinham um casamento novo em folha. Então ficamos sentados ali simplesmente observando-os. Foi estranho. Mas simplesmente deixamos isso acontecer.

Ele disse:

— Sinto-me como se as luzes de repente tivessem se acendido. Posso ver como nunca pude ver antes. Sinto que estou cheio de luz!

Simultaneamente, todos nós nos lembramos da Palavra que Sheri dera a ele anteriormente quando estávamos juntos. Conversamos e oramos mais com eles, e Sheri profetizou sobre eles novamente. Foi um tempo glorioso que passamos com pessoas maravilhosas.

Momentos depois, ele disse:

— Sabem... Eu realmente não sei se deveria me sentir tão feliz! Sinto-me esperançoso. Sinto-me tão feliz. Mas sinto-me mal por me sentir feliz.

Um olhar curioso atravessou o seu rosto e ele perguntou:

— Bem, agora que sou um homem diferente, o que a liderança da minha igreja vai fazer comigo?

Essa era uma pergunta muito boa. Por mais que eles fossem uma igreja com um grupo maravilhoso, eu tinha certeza de que eles teriam uma visão diferente da situação. Felizmente, tínhamos uma vantagem fundamental para nos ajudar a guiar aquele processo a uma conclusão de sucesso: o pastor deles. Como eu disse, o pastor principal deles era um mestre — um mestre forte, dos cinco ministérios. Portanto, ele tinha uma forte necessidade de estar certo e de entender o que Deus estava fazendo. Mas felizmente, ele reconhecia isso sobre si mesmo e havia entendido que poderia reduzir o teto da unção de todo o seu mundo simplesmente fazendo com que a sua necessidade de estar certo e de entender tudo fosse o guia principal da sua liderança, da sua vida e das suas decisões. quele homem tinha tirado a tampa da sua vida colocando-se debaixo de um ministério apostólico, o que abriu espaço para a unção de uma liderança apostólica e profética em seu ambiente. Esse é um dos motivos pelos quais ele nos telefonou pedindo ajuda. Como eu disse, ele conhecia o que acontece aqui em nossa igreja.

Aquele casal voltou para casa e não ouvi falar deles por algum tempo, principalmente porque eu havia levado um grupo da nossa equipe pastoral para uma caminhada. Havíamos estado fora por quatro dias. (Quando falo em “caminhada”, quero dizer que fizemos uma caminhada de 3.200 quilômetros de mochilas nas costas. Consumimos oitenta trutas em três dias. Na verdade, foi mais uma viagem do que uma caminhada. No ano anterior, eu os levara em uma excursão de 61 quilômetros percorrendo seis lagos pelos Alpes Trinity. Nossa equipe se refere a essa viagem como “A Marcha da Morte de Danny”. Aquilo foi uma caminhada.) Quando voltamos para casa, fui direto para o chuveiro porque eu realmente precisava disso. O telefone tocou quando passei por ele. Nunca atendo o telefone quando estou em casa, principalmente se for um número que não conheço, como foi o caso. Mas por algum motivo, atendi.

— Alô?

Era o meu amigo pastor. Ele disse:

— Danny! Ei, tenho tentado falar com você!

— Sim — eu disse. — Estive fora.

— Você tem um minuto? Eu gostaria de lhe fazer algumas perguntas a respeito do casal que enviamos até você.

Como sabia que ele não podia sentir o meu cheiro pelo telefone, eu disse:

— É claro!

— Ah, ótimo! — disse ele, como se soubesse que eu iria falar isso. — Estamos com você no viva-voz agora na nossa reunião de presbitério. Estamos procurando resolver esta situação. Ouvimos falar sobre as ideias que vocês compartilharam com eles. Gostaríamos que você falasse um pouco sobre elas.

— Sem problema.

Aceitei a ideia de que o chuveiro com o qual eu havia sonhado durante toda a viagem teria de esperar. Meu amigo primeiro compartilhou algumas das ideias que a diretoria deles havia abordado. O plano básico era algo parecido com isto:

Informar à congregação o que estava acontecendo e pedir que eles orassem pela restauração daqueles líderes. Fazer uma pausa nas funções do casal por alguns meses, para que eles pudessem trabalhar em seu casamento. Rever o progresso deles depois de três a seis meses e, caso fosse favorável, reintroduzi-los lentamente no ministério.

Esse é o modelo “da terra para o Céu”, que sei que a maioria das igrejas tentará colocar em prática. É o melhor que a terra pode fazer para construir a confiança e a credibilidade novamente nas pessoas. Ele se destina primeiramente a consolar as pessoas, e depois a tratar da vida do líder. É difícil admitir, mas quando a unção do líder sênior está focada primordialmente nas pessoas, então as necessidades das pessoas governam o ambiente. Mais uma vez, isso é apenas o melhor esforço da terra para gerar justiça, igualdade ou outro consolo humano necessário.

Quando aquele casal esteve no meu gabinete algumas semanas antes, eu havia compartilhado um modelo “do Céu para a terra” para lidar com a situação. Eles foram encorajados ouvindo sobre o processo, mas perceberam que seria um esforço quase impossível para os líderes deles aceitarem aquilo. Percebi que meu amigo pastor queria entender o que eu compartilhara com eles. O que ele realmente queria dizer com aquele telefonema, mesmo sem ter dito, era: “Creio que entendo o que você compartilhou com eles. Quero chegar onde você está. Quero tratar essa situação à luz do Céu e não segundo as trevas dos modelos da terra. Apenas não tenho certeza de como provar isso biblicamente”. A necessidade de “provar” algo biblicamente fazia parte da limitação dele, uma limitação que fortalecia o seu foco como mestre, mas reduzia sua capacidade de lidar com outras prioridades no que se referia a outras tarefas da liderança diferentes do ensino. Ele reconhecia essa limitação e estava se esforçando para receber a perspectiva de outra unção, a fim de reconhecer e agir com base nas prioridades do Céu para aquela situação.

Ele disse:

— Realmente gostaríamos de ter algumas informações para nos ajudar a tomar a nossa decisão.

— Tudo bem, bom, eis o que vejo — comecei. — Vejo que durante os últimos quatro anos você teve um homem que conduziu a sua congregação ao coração de Deus, e Deus tem derramado a Sua bênção sobre a congregação. Cada vez mais pessoas passaram a ser atraídas para a liberdade que está crescendo no seu ambiente. Vejo que nesses quatro anos você gerou novos ministérios que são abençoados e estão transbordando de vida e vigor. E em todo esse tempo, você teve um líder que era um grande mentiroso, desprezível e imoral, que vivia uma vida dupla. Você lhe deu aumentos e o capacitou, assim como aumentou a influência dele no seu ambiente mais e mais.

Agora, o que você tem é um homem que está na melhor forma espiritual de sua vida. Ele voltou para casa depois daquela semana de férias um homem transformado. Ele foi para casa, reuniu seus filhos, pediu que se sentassem, olhou-os nos olhos e disse: “Por favor, perdoem-me. Tenho retido o meu amor de vocês a vida inteira. Sinto muito. Eu apenas amo vocês. Eu apenas adoro vocês”. Ele derramou amor sobre seus filhos pela primeira vez na vida deles e depois os convidou para falar a qualquer momento em que eles sentissem esse amor diminuindo. Toda a família deles está se enchendo de luz.

Então, continuei:

— Esse homem se arrependeu. Ele é um homem transformado. Mas porque agora vocês conhecem o que estava oculto durante os últimos quatro anos, acreditam que precisam puni-lo. Se vocês fizerem isso, então não teria sido melhor que ele tivesse continuado sendo um mentiroso desprezível, um prisioneiro do seu cativeiro, em benefício de sua igreja? O que vocês vão fazer com a verdade? Aquele homem não precisa de punição, de remoção, de férias, de uma licença, de uma liminar ou de qualquer coisa dessa natureza. Aquele homem precisa prestar contas a alguém para garantir que ele mantenha a luz acesa. E ele precisa limpar a sujeira que fez.

Eles disseram:

— Bem, isto traz à tona outra questão. Pretendíamos fazer com que ele comparecesse diante da congregação para contar o que aconteceu à igreja, como medida de prestação de contas. O que você pensa a esse respeito?

Eu disse:

— Bem, deixe-me ver se entendo. Fazer isso, ao que me parece, é como se ele tivesse um galão de tinta, o tivesse deixado cair e tivesse respingado em toda a sua equipe de presbíteros, sobre este outro casal, sobre você e sobre a esposa e a família dele. Agora, vocês querem dar ao homem um balde de tinta de 1.800 litros e uma granada como uma forma de limpar a sujeira que ele fez. Ora, eu sou totalmente a favor das pessoas assumirem a responsabilidade pelos seus atos. penas não entendo por que vocês criariam um caos ainda maior do que o que já têm. Creio que esse caos pode ser corrigido de maneira bem fácil, e creio que ele pode ser restaurado muito facilmente. É o que penso.

Houve um enorme silêncio do outro lado da linha. Um deles fez outra pergunta sobre alguma coisa, e isso foi tudo. Eu disse:

— Deus abençoe a todos. Preciso ir tomar um banho.

Isso aconteceu em agosto de 2006. Três meses depois, na Reunião Leader’s dvance da Bethel Church, encontrei com meu amigo pastor e ele disse: “Você não vai acreditar no quanto eles estão se saindo maravilhosamente bem. Parece que toda a família dele ressuscitou dos mortos. A luz e o cuidado que entrou naquela casa são de tirar o folego”. Ele disse também: “Lidamos com a situação exatamente como você sugeriu. É tremendo e está dando certo!” Enquanto escrevo este livro, isso faz aproximadamente dois anos e todos eles estão ficando mais fortes.

O diabo está trabalhando para nos destruir, e o modelo “da terra para o Céu” geralmente o ajudará a realizar o seu objetivo na igreja. Sei que não estamos tentando ser destrutivos, mas estamos confinados às nossas limitações terrenas quando nossos líderes principais são mestres, pastores, administradores e evangelistas, que não foram ligados ao fluir da unção e da revelação em um governo apostólico.

Por favor, entenda uma coisa. Não estou propondo que “mantenhamos as coisas em família” como uma forma de lidar com os comportamentos destrutivos entre os cristãos na igreja. Se você acender a luz e vir que alguém precisa ir para a cadeia, não envie uma equipe ministerial para lidar com essa pessoa, chame a polícia! Enquanto eu era o pastor sênior em Weaverville, denunciei cinco pessoas ao Serviço de Proteção à Criança, e duas delas foram encarceradas. Não tenho problemas em envolver as autoridades públicas nas situações quando sei que a igreja não pode responsabilizar as pessoas nem dar a elas o nível de abordagem necessário para que elas fiquem bem. Precisamos estabelecer limites definidos, como a Bíblia ensina, para lidar com as pessoas que não se arrependem. Mas também precisamos aprender a parar de ter de punir as pessoas que se arrependem.

Não estou dizendo que vamos dar a elas permissão para “sair livres da cadeia”. Mas em vez de puni-las, chamamos as pessoas para andarem na sua identidade superior e na sua responsabilidade como filhos da luz, em vez de esmagá-las ainda mais, confinando-as a viverem como pecadores. Quando o Céu nos confronta nos nossos erros, é como o Senhor encontrando Jó: “ Prepara-te como homem!”[9] Andar na luz não é para os fracos. Requer uma profunda fé no amor de Deus e no poder da Sua graça para nos dar o que precisamos para mudar.

Uma cultura de disciplina é construída na igreja para proteger o que as pessoas pensam — o que elas pensam sobre os líderes e o que elas pensam sobre aqueles que falham. Mais uma vez, quando o conforto ou as expectativas das pessoas são a preocupação principal dessa cultura, e quando a convicção essencial é que as pessoas que cometem erros são pecadoras, e não filhos, então a disciplina simplesmente não será administrada da maneira do Reino, pois a preocupação principal na cultura do Reino é: “Venha o Teu Reino Seja feita a Tua vontade assim na terra como é no Céu”.

O propósito principal da punição é aliviar a ansiedade das pessoas. Procuramos chamar isso de justiça, mas é simplesmente o medo do homem tomando conta dos líderes que precisam ficar a favor das pessoas. Como vimos nas vidas de Davi e de Pedro, a justiça de Deus é desconcertante para os líderes humanos. Só podemos entender isso quando abrimos mão de querer proteger o nosso relacionamento com as regras. Quando começamos a proteger um relacionamento com a lei da vida em Cristo, nosso objetivo nunca é aplacar o medo, mas restaurar um relacionamento partido e fazer a vida e o amor fluírem novamente. E só existe um processo que realmente faz isso. Há satisfação por intermédio do arrependimento. Precisamos perder o nosso medo do pecado e o nosso medo do homem, e precisamos parar de punir aqueles que se arrependem.

Foi para a liberdade que Jesus nos libertou. [10] Ele nos deu um caminho para ficarmos livres do jugo de escravidão às regras e nos oferece um modo para vivermos nossas vidas protegendo os nossos relacionamentos — primeiramente com Deus e depois com as nossas famílias e com os que estão dentro da nossa esfera de influência. Nossos filhos são aqueles a quem influenciamos mais profundamente. Eles refletem claramente em suas próprias ações aquilo que lhes mostramos como modelo. Quando nossos filhos não precisam ser punidos pelo pecado deles e começam a aprender que a prioridade quando eles falham é restaurar o relacionamento, e não aplicar a punição, eles começam a cultivar um alto valor pelos relacionamentos como a prioridade em nossa cultura. É assim que ensinamos as pessoas a viverem uma vida de amor e liberdade, e é assim que aprendemos o poder da confiança e da intimidade.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Danny insiste que o que aquele homem fez não era evidência da sua verdadeira identidade — assim como um prego no pé não o tornava 'um prego', as trevas dentro de um filho da luz não mudam quem ele é. Quando você descobre 'trevas' em alguém que admirava (ou em si mesmo), você consegue separar o erro da identidade, ou o erro passa a definir a pessoa aos seus olhos?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo mostra que o verdadeiro arrependimento é um dom que nasce no relacionamento, e não um pagamento de preço para aliviar a ansiedade do ambiente — e que punir quem genuinamente se arrependeu é dar 'um balde de 1.800 litros de tinta' para limpar a sujeira. No seu 'processo de restauração', você tem buscado curar o relacionamento e o problema do coração, ou apaziguar o medo e a expectativa das pessoas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Danny escolhe não dizer ao homem qual era o problema, mas conduzi-lo por perguntas até ele mesmo descobrir a raiz ('só posso amar o que é perfeito') e perdoar o pai. Como líder, você tende a entregar respostas prontas para a pessoa lembrar, ou tem a paciência de fazer as perguntas certas até que ela encontre e assuma a própria solução? O que costuma te apressar para o atalho?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 5 — A prática da liberdade: desenvolvendo uma mentalidade próspera  (aula ordem = 7)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 7;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 5 — A prática da liberdade: desenvolvendo uma mentalidade próspera$t$,
      7,
$conteudo$Não posso me dar ao luxo de ter um pensamento em minha mente que não esteja

na mente Dele. (Bill Johnson, Bethel Church) D epois que meu filho mais velho, Levi, terminou a oitava série na Escola Cristã Bethel, ele enfrentou a decisão de onde iria cursar o ensino médio. Sua irmã mais velha, Brittney, havia iniciado em uma escola pública e terminou o ensino fundamental tendo aulas em casa. Mas estudar em casa não era uma opção para Levi, porque ele queria jogar futebol americano. Então ele nos perguntou se poderia frequentar uma escola secundária pública.

Bem, essa era uma decisão familiar, porque afetaria toda a nossa família. Nossos problemas variavam desde o transporte para a escola até a confiança. Também sabíamos que essa decisão estabeleceria um precedente para o nosso filho mais novo, Taylor. A maior preocupação para nós era o fato de que, na escola pública, Levi se depararia com a liberdade e com opções com as quais ele nunca se deparara. Mais do que nunca, precisamos tomar a decisão certa. A Escola Cristã Bethel tinha cerca de 140 alunos quando Levi estudava ali, sendo que 40 desses alunos representavam as turmas de ensino médio e 15 eram da turma de oitava série. A escola pública que ele queria frequentar tinha 500 calouros e um total de 1.800 alunos — metade da população de Weaverville, a pequena cidade onde ele havia crescido. Além de ter de se acostumar com uma escola maior, ele estaria se mudando do ambiente de uma escola cristã que apoiava os valores essenciais da nossa família, para uma escola pública, onde parecia que ele estaria vivendo praticamente no cenário de praia de um programa de TV para adolescentes. Aquela definitivamente não era a nossa praia!

O novo nível de consequências para as escolhas que Levi faria em sua vida encarava a mim e a Sheri. Será que acreditávamos que Levi nos protegeria com as suas decisões? Será que o nosso coração confiava nele? Estávamos dispostos a permitir que a jornada de aprendizado dele nos afetasse tão profundamente quanto aquelas decisões poderiam nos afetar? Estávamos dispostos a correr aquele risco com um menino vulnerável de 14 anos?

Primeiramente, afirmamos a ele que aquela ideia nos assustava. Depois lembramos a ele o quanto poderíamos nos transformar em pessoas viciadas em controle quando estávamos assustados. E, finalmente, perguntamos como ele pretendia nos proteger ao tomar a decisão sobre aquela etapa. Nosso futuro calouro franziu a testa e começou a perceber que era um participante poderoso nessa conversa e nessa decisão. Ele pensou por um instante e depois declarou simplesmente: “Serei esperto... e não vou partir o coração de vocês”.

Uau! Esta era a resposta certa. E nós acreditamos nele.

O verão anterior ao seu ano como calouro começou com práticas de futebol americano à tarde no calor abrasador de Redding, Califórnia. Levi começou a trabalhar duro para entrar para o time, cercado pelos outros setenta calouros que estavam tentando o mesmo. Quando a estação dos jogos começou, o treinador instruiu os jogadores calouros a assistirem a um jogo do time da escola. Ele queria reforçar a ideia deles sobre como jogar no time da escola secundária mostrando como os “meninos grandes” jogavam.

No dia em que o técnico pediu que os alunos fizessem isso, Levi chegou em casa e nos disse: “O treinador quer todos nós no jogo esta sexta-feira à noite, para assistir ao time da escola jogar. Posso ir?”

Quando olhei nos olhos de Sheri, pude ver que ela estava pensando. Ela estava pensando o mesmo que eu. Estávamos tendo, os dois, flashbacks sobre o que havíamos feito nos jogos de futebol da escola secundária — e posso garantir não tinha nada a ver com jogos de futebol! Nós nos voltamos e olhamos para Levi. Sabíamos que não podíamos lançar sobre ele nenhum dos nossos erros da adolescência, mas ainda assim estávamos assustados com as inúmeras possibilidades que existiam naquela noite de sexta-feira esperando para tentá-lo. Então eu disse: “Filho, estamos muito assustados, mas você pode ir”.

“Posso ir!” ele gritou, sacudindo a mão no ar como um jogador que acaba de marcar um ponto. “De verdade? Posso ir? Maravilha!”

Eu estava certo de que ele não havia me ouvido dizer que estávamos assustados. Ele estava animado demais em se reunir com os seus colegas de time na sua busca por aprender mais sobre futebol. Levei-o ao jogo e concordei em pegá-lo às 10 da noite. Àquela hora, voltei ao campo e com o dom da tecnologia que é o telefone celular, encontrei-o. Ali estava ele, bem onde disse que estaria. Meu coração ficou aliviado porque toda a minha noite de preocupação fora inútil. Ele saltou para dentro da caminhonete e me contou tudo que aprendera naquela noite. A maior parte tinha a ver com o quanto os uniformes e os capacetes do time da escola eram legais.

Estacionamos em casa e saímos da caminhonete. Enquanto nos dirigíamos para dentro de casa, Levi esticou-se, tocou o meu braço e disse: “Papai, obrigado por confiar em mim”.

“De nada, Levi”, eu disse. “Obrigado por nos proteger esta noite, filho.”

“De nada.” O Poder do “Nós” Levi sabe que ele carrega uma tremenda responsabilidade no nosso relacionamento. Ele sabe que ninguém pode fazer o papel dele entre “nós”, a não ser ele. Ele sente o peso do “nós” sempre que está fora vivendo a sua liberdade. Ele sabe que é livre para fazer o que estiver no seu coração. O coração dele pertence a ele, por isso ele deve administrá-lo. E porque está no coração dele proteger o relacionamento dele com sua mãe e seu pai, ele toma decisões considerando como essas decisões vão nos afetar.

Isso é treinar alguém para a liberdade. Paulo falou sobre isso do seguinte modo com os coríntios: “ Todas as coisas me são lícitas, mas nem todas convêm”.[1] liberdade faz com que a nossa responsabilidade pessoal venha à tona. Ou nos elevamos com ela ou perdemos a nossa liberdade. A única maneira de cultivar a liberdade é através da experiência e do aprendizado em lidar com um número crescente de opções. Administrar opções cada vez maiores é a maneira como expandimos nossas vidas para uma abundância cada vez maior.

Jesus disse que o ladrão é aquele que vem para roubar, matar e destruir. o diabo que nos apresenta limitações, que remove as nossas opções e nos faz ter medo de viver uma vida livre. Mas Jesus veio para que tenhamos vida, e vida em abundância.[2] O desejo do coração de Jesus é nos oferecer uma vida de opções ilimitadas.

Abundância, liberdade e escolhas são maneiras de descrever uma condição da alma que precisamos dominar se quisermos viver uma cultura de avivamento. Desenvolver e expandir uma mentalidade próspera é a chave essencial para o nosso sucesso em trazer o Céu à terra — e fazer com que ele permaneça na terra. s práticas da prosperidade são exercícios de abundância. Se desejamos ser mordomos dos recursos do Céu, precisamos primeiramente aprender a praticar uma mentalidade de abundância. bundância Gera Liberdade O primeiro erro que muitos crentes cometem quando alguém menciona a prosperidade é compará-la às riquezas. Mas a ideia de que o dinheiro torna alguém próspero é como sugerir que segurar uma bola de futebol faz de você um zagueiro da primeira divisão. As riquezas ou o dinheiro são condições externas e a prosperidade é uma realidade interna. O nosso interior sempre se manifestará no nosso exterior.

Durante muitos séculos, uma falácia religiosa tentou governar a mente dos crentes e convencê-los de que as riquezas são a raiz de todo o mal e, assim, quanto mais pobre você for, mais espiritual você será. De algum modo, de acordo com essa mentalidade, ser um cristão pobre, fraco, humilde e sem instrução é algo que Deus está encorajando no Céu. Seria o mesmo que você incentivar os seus filhos a serem dependentes da assistência social e expulsos da escola. Estou plenamente ciente de que, nas últimas décadas, a igreja passou para o extremo oposto e experimentou um “Evangelho da Prosperidade” que levou muitos a buscarem carros luxuosos e estilos de vida confortáveis em vez de estilos de vida poderosos e o Consolador. Entretanto, uma mentalidade de prosperidade não tem a ver com dinheiro ou idolatria. Tem a ver com liberdade. Deus e Abrão Para ajudar a definir uma mentalidade de prosperidade, quero lhe apresentar uma jornada pela qual Deus conduziu Abraão. Nessa jornada, Abraão começou como “Abrão” e finalmente se tornou “Abraão” quando Deus o fez passar por um processo que extraiu toda a medida da grandeza que Deus planejara para a vida dele. Quando esse processo teve início, Abrão já era um homem rico. Ele tinha muitos bens e muitas terras e era fiel na mordomia de sua riqueza. Ele era um homem cujo exterior já se equiparava ao seu interior. Mas para que Deus o levasse ao nível seguinte, Ele apresentou um conjunto poderoso de instruções e passos que expandiram Abrão interiormente.

Ao apresentar a jornada de Abrão, quero desafiar você a abraçar esse mesmo processo em sua vida. Esse é o processo que nos permite confrontar a nossa própria mentalidade e as limitações que trazemos conosco para o nosso relacionamento com o Céu. Limitamos a nossa vida em Deus tão facilmente e com tanta frequência justamente porque não vemos aquilo que nos impede.

Em Gênesis 12 lemos sobre a primeira interação de Deus com Abrão:

Ora, o Senhor disse a Abrão: “Sai-te da tua terra, da tua parentela e da casa de teu pai, para a terra que eu te mostrarei. E far-te-ei uma grande nação, e abençoar-te-ei e engrandecerei o teu nome; e tu serás uma bênção. E abençoarei os que te abençoarem, e amaldiçoarei os que te amaldiçoarem; e em ti serão benditas todas as famílias da terra”.[3]

Essa é uma apresentação e tanto! Desde o princípio, Deus deixou claro que iria transformar a vida de Abrão de algo que ele achava muito bom em algo que ele nunca poderia imaginar: “Em ti, Abrão, serão benditas todas as famílias da terra”.

No Novo Testamento, o apóstolo Paulo nos conectou a essa mesma promessa. Ele escreveu em Gálatas que se você está em Cristo, você é semente de braão e herdeiro da promessa que foi dada a Abraão. [4] Portanto, por intermédio da sua vida, também, todas as famílias da terra serão abençoadas. É isso que você carrega no seu DNA. É isso que você carrega no nome de seu Pai e na sua identidade como filho do Altíssimo Deus. Quatro Chaves para uma Nova Liberdade Existem quatro aspectos-chave para o processo que Deus iniciou com Abrão em Gênesis 12. O primeiro aspecto está no nome de Abrão. Costumamos nos concentrar no fato de que Abraão significa “pai de muitas nações”. Mas é importante considerar que Abrão significa “pai exaltado”. Um pai exaltado não é apenas um pai. Abrão não era apenas um sujeito comum. O seu próprio nome revela que ele estava disposto a assumir uma posição mais elevada, com mais responsabilidade do que um pai comum. Esse era o sujeito com quem Deus estava trabalhando: “Pai Exaltado”. Do mesmo modo, aqueles de nós que estamos avançando para entender e carregar a unção e o avivamento que estão acontecendo hoje, precisamos entender que Deus nos pediu para assumirmos um nível de responsabilidade maior do que as pessoas comuns. Entender essa responsabilidade é o que nos molda para sermos pessoas que estão dispostas a seguir a Deus até um lugar cujo construtor e arquiteto é Deus.[5]

O segundo aspecto do processo vivido por Abrão é a primeira coisa que Deus disse a ele, e quero que você observe isto como se Deus estivesse dizendo o mesmo a você. Ele disse: “Abrão, quero que você saia do seu país”. Em outras palavras, Deus disse: “Quero que você saia da sua terra. Quero que você deixe o seu território, a sua geografia. Quero que você saia dos limites que você passou a aceitar como o seu esconderijo, a sua segurança, a sua esfera de conforto e influência”.

Em um mover de Deus, uma das mensagens que ouvimos repetidamente é a de que Deus quer que saiamos da nossa zona de conforto. O motivo pelo qual devemos sair da nossa zona de conforto é porque precisamos não ter nada como nosso apoio, exceto Deus, se quisermos ter acesso à prosperidade do Céu. Recentemente preguei na Conferência Spiritual Hunger (Fome Espiritual) em Spokane, Washington. Heidi Baker era uma das palestrantes, e em uma de suas mensagens ela lembrou gentilmente aos presentes ali que muitos de nós temos um “Plano B” pronto para seguir caso Deus não apareça. Ela explicou que isso mata a nossa fome. Quando canalizamos os nossos recursos para prover o nosso próprio conforto em lugar de canalizá-los em direção às agendas do Céu, isso também paralisa os céus. A mentalidade de prosperidade, a mentalidade que nos prepara para participarmos do fluir do Céu à terra, é uma mentalidade que abraça a ordem de Cristo de buscarmos o Reino em primeiro lugar, sabendo que Deus cuidará das nossas necessidades e desejos.

O terceiro aspecto do processo de Abrão foi a afirmação seguinte de Deus: “Quero que você deixe a sua família”. É interessante observar que quando Abrão obedeceu a Deus, ele levou sua família com ele. Mas por que Deus estava dizendo claramente: “Estou dividindo a sua família”? Bem, nossa família define as circunstâncias do nosso nascimento. Você e eu adquirimos uma identidade a partir daqueles com quem crescemos, e é muito difícil essa identidade mudar e se expandir quando ela já está estabelecida na percepção daqueles que nos cercam.

É mais ou menos assim: digamos que você seja o mais moço de uma família de cinco filhos. Embora você seja adulto, todos ainda o veem como o “Joãozinho!” Quando você chega para as reuniões de família, eles o agarram, se revezam esfregando sua cabeça e desmanchando seu cabelo, e dizem: “Como vai o nosso Joãozinho? Como vai você, Joãozinho?”

“Mas papai, eu sou o principal executivo da IBM”.

“Eu sei, filho, mas você vai ser sempre o nosso Joãozinho.”

Você carrega uma identidade particular em um ambiente cheio de pessoas que lhe são muito familiares. Toda vez que você está com elas, elas olham para você de uma maneira que diz: “Há, há! Olhe para você! Você nunca vai fugir da caixa onde o colocamos”. Ora, essa identidade pode ser uma caixa muito confortável. Você pode ser respeitado e admirado por sua família. Mas a realidade é que só Deus, Aquele que projetou cada um de nós, entende a nossa verdadeira identidade e chamado. E para descobrir e se tornar quem Ele nos criou para sermos, precisaremos ir além dos limites do que a nossa família espera de nós.

O Senhor nos diz, como Ele disse a Abrão: “Quero que você saia dos seus limites físicos e geográficos, e quero que você saia dos seus limites de autoridade. Quero que você saia do território onde você passou a se sentir confortável e quero que você saia da identidade que tem origem nas pessoas que estão mais familiarizadas com quem você foi”.

E, por fim, o quarto aspecto desse processo que precisamos avaliar é o fato de que Deus nos diz, assim como disse a Abrão: “ Quero que você saia da casa de seu ai”.

Essa questão de sair da casa do seu pai é o ponto que quero focar durante o restante deste capítulo. A casa do nosso pai é o lugar onde recebemos a identidade do nosso pai, a cobertura do nosso pai e, particularmente, o status econômico do nosso pai. Por exemplo, digamos que você nasceu em uma família cujo pai é um trabalhador humilde que ganha 15 dólares por hora. Sua mãe ficou em casa criando você e seus quatro irmãos, e tinha um negócio de venda de produtos pela internet. A renda anual da família combinada era por volta de 50 mil dólares por ano. Essa experiência colocou você em uma classe socioeconômica, e essa classe socioeconômica lhe deu uma lente através da qual você vê o mundo e os recursos em sua vida. Você funciona naturalmente dentro de uma classe específica de pessoas. Você identifica o que é valioso, o que é possível, e o que circunstâncias diferentes significam por meio da sua classe socioeconômica.

Nossa classe socioeconômica geralmente vem com um acompanhamento — um grupo de pessoas que confirmam o que acreditamos que é verdade e o que vemos como valioso. Estamos cercados de pessoas que veem o mundo como nós vemos: nossos vizinhos, os amigos dos nossos pais, nossos amigos mais chegados e nossas escolas. Todas essas pessoas, juntamente com inúmeros reforços culturais dos quais praticamente não estamos conscientes, criam o nosso “normal”, e geralmente, não temos motivos para pensar que as coisas são de outra maneira. Todos nós julgamos ou ridicularizamos as outras classes e nos apegamos à nossa como se fosse a única classe verdadeira, a única verdadeira visão do mundo. Para muitos de nós, nossos olhos ainda não foram abertos para o fato de que existem outras formas de ver o mundo além da que conhecemos.

Então, o que quero apresentar a você em seguida é algo que espero que abra a sua consciência para a maneira como você vê as coisas agora e a forma como a sua nova identidade, a sua verdadeira identidade, está destinada a ver as coisas. Espero expor e confrontar o modo como você vê as coisas, porque você foi chamado para ser rei. Você foi chamado para ser um príncipe ou uma princesa. Você é realeza. Você é próspero de um modo que está além da sua imaginação mais incrível. Contudo, a não ser que você pense como uma pessoa próspera, não será capaz de lidar com a sua identidade, o seu papel, a sua responsabilidade e os seus recursos. Chamados para Ser Reis Provérbios 28:16 diz: “O príncipe falto de inteligência multiplica as opressões, mas o que aborrece a avareza viverá muitos anos”. Deixe-me afirmar isso assim: “Um príncipe que não se vê como um benfeitor punirá os outros com o seu poder, mas aquele que detesta o lucro obtido com violência ou controlando os outros construirá um legado duradouro”. Quando um príncipe pensa como um pobre, ele vive como um grande e poderoso sobrevivente.

O pobre aprende uma lição poderosa na vida, que é como continuar vivo neste planeta. A visão socioeconômica de mundo do pobre é completamente definida e governada pelo medo de que os seus recursos diários se esgotem. E quando você dá a alguém que foi treinado para sobreviver um acordo empresarial ou um contrato esportivo profissional, ou um bilhete de loteria vencedor, ele se torna um supersobrevivente. Ele tem grandes recursos, mas os utiliza para se proteger em vez de usá-los para beneficiar outros, porque ele acredita naturalmente que é para isso que os recursos são. Ele vê o mundo como algo que está ali para servi-lo. Ele é um oportunista. O que ele não entende é que, empregando mal os seus recursos, ele está oprimindo os que o cercam. Ele destrói sua vida e, muitas vezes, as vidas daqueles que o cercam, porque sua visão de mundo foi formada com base em como sobreviver, e não em como prosperar.

Como crentes, todos nós corremos o risco de sermos príncipes que pensam e vivem como pobres. Se não formos renovados em nosso pensamento, não apenas estaremos abusando do grande poder e responsabilidade que nos foram dados, como nem sequer estaremos cientes de que estamos fazendo isso. Pobreza, Classe Média e Prosperidade Todos nós somos restringidos pela visão de classe que recebemos na casa do nosso pai. Para entender essas restrições e identificarmos tanto a maneira como pensamos quanto o modo como deveríamos pensar, vou lhe mostrar três visões de classe socioeconômica: uma visão que olha através da lente da pobreza, uma visão que olha através da lente da classe média, e uma visão que olha através da lente da prosperidade. Vou lhe apresentar como cada uma dessas classes vê e experimenta as coisas de uma forma completamente diferente.

Ao fazer este exercício, quero que você entenda que a visão de classe com a qual você concorda muito provavelmente seja a sua. Você possivelmente também tem uma teoria de por que as outras duas estão erradas. Nesse caso, tudo bem, porque todos os que estão lendo este livro farão o mesmo. Não vamos discutir o que é certo ou errado. Quero simplesmente lhe dar a oportunidade de perceber que, embora você agora seja próspero como um filho ou filha do Rei dos reis, talvez, como muitos de nós, você não carregue uma lente de prosperidade para enxergar a sua vida.

Na página a seguir, há um quadro elaborado pela Dra. Ruby Payne, extraído de seu livro intitulado Understanding a Framework of Poverty (Compreendendo o Esquema da Pobreza). Esse livro é um esforço para diagnosticar e tratar algumas das principais causas que estão por trás dos fracassos do sistema educacional nas escolas das cidades do interior do Texas. Ao fazer essa pesquisa, o interesse particular da Dra. Payne era levar os professores da classe média a compreenderem melhor e a influenciarem as crianças pobres em suas salas de aula. Ela afirmou que, pelo fato de a visão de mundo e as experiências de vida dos professores e dos alunos serem completamente diferentes, os professores não tinham o poder de educar as crianças que não pertenciam à sua própria classe socioeconômica. Assim, a Dra. Payne deu início a um sistema de apresentar aos professores outro conjunto de valores, convicções e motivações, capacitando-os assim a “saírem” das suas próprias limitações e alcançarem uma visão de classe sobre a qual eles nada sabiam.

Em seu livro, a Dra. Payne ilustra como as diferentes classes experimentam e veem o mundo. Quando o li, achei a análise feita por ela extremamente perspicaz e útil para a compreensão dessas diferenças. Ela faz um ótimo trabalho descrevendo como todos nós vivemos em mundos muito diferentes enquanto compartilhamos do mundo em que vivemos. Esse quadro descreve o que cada classe mais valoriza em diversos aspectos da vida. Mais uma vez, ao rever os tópicos a seguir, creio que você se sentirá confrontado ao constatar o que considera como mais valioso e também será desafiado pelos valores das outras classes. Depois de apresentar esse quadro, selecionarei alguns desses tópicos para detalhá-los melhor, no esforço de lhe mostrar por que precisamos “sair da casa do nosso pai” e nos alinharmos com a nossa nova “casa do Pai”. Esquema para Entender a Pobreza por Ruby K. Payne, PhD [6]

Pobreza Classe Média Riqueza Bens Pessoas Coisas Exemplares únicos de objetos, marcas, legados Dinheiro Para ser usado, gasto Para ser administrado Para ser reservado, investido Personalidade É para diversão. É para aquisição e É para relações. As relações O senso de humor é estabilidade. A realização é financeiras, políticas e sociais são altamente valorizado altamente valorizada altamente valorizadas Ênfase Social Inclusão social das A ênfase está na Ênfase na exclusão social pessoas de quem autossuficiência e na gostam autonomia Comida A quantidade é mais A qualidade é mais A apresentação é mais importante importante importante Roupas Estilo individual e Qualidade e aceitação Senso e expressão artística, o expressão da pelos colegas, a marca é estilista é importante personalidade importante Tempo O presente é mais O futuro é mais Tradições e história importante importante Educação Valorizada como Crucial para subir a escada Tradição necessária para fazer e abstrata, mas não como do sucesso e para ganhar manter conexões realidade dinheiro Destino Acredita no destino, Acredita na escolha; tem Seus membros têm a obrigação mas se sente impotente poder para mudar o moral de agir de determinada para mudá-lo muito futuro com boas decisões maneira (noblesse oblige) Pobreza Classe Média Riqueza Linguagem Sobrevivência Negociação Redes de Comunicação Estrutura Matriarcal Patriarcal Qualquer um que tenha Familiar dinheiro Visão de Local Nacional Internacional Mundo Amor Depende de se gostar Depende das realizações Depende da posição social e das conexões Força motriz Sobrevivência, Trabalho, realização Relações financeiras, políticas e relacionamentos, sociais diversão

Gostaria de observar com mais atenção os tópicos comida, destino, visão de mundo e força motriz — primeiramente para analisar as diferenças entre essas perspectivas de classes mais claramente, e em segundo lugar para perceber a influência dessas perspectivas em nós como crentes na igreja. Feito isso, poderemos reconhecer onde precisamos nos alinhar com o Céu. Todas as 14 áreas mencionadas no quadro anterior são interessantes, por isso espero que a minha análise dessas quatro encoraje você a avaliar as demais e fazer o mesmo tipo de comparação.

Pobreza Classe Média Riqueza Comida A quantidade é mais A qualidade é mais A apresentação é mais importante importante importante

Escolhi a comida em primeiro lugar apenas por diversão. É uma experiência tão diária que pensei que poderíamos rir de nós mesmos por um instante. O fato é que a maneira como nos relacionamos com a comida indica muito sobre a forma como nos relacionamos com todos os recursos por meio dos quais suprimos as nossas necessidades básicas.

Quando vamos a um restaurante com a mentalidade de pobreza, temos certa expectativa. Vamos ali porque eles nos darão quilos e mais quilos de comida:

“Se vou gastar dinheiro saindo para comer, quero sair de lá empanturrado.” “Ei, Bob! Vamos àquela lanchonete hoje à noite. Adoramos aquele lugar. Eles nos dão porções enormes para qualquer prato que peçamos. É ótimo!” “Vamos ao self-service. Vamos ao self-service porque é um lugar onde você come tudo o que puder por um preço único. Eles vão lamentar por eu ter entrado ali, com certeza!”

Quando nossa principal preocupação é a sobrevivência, nosso relacionamento com a comida é um relacionamento de acúmulo. A ideia de que não temos certeza de quando vamos comer de novo não precisa corresponder exatamente à realidade para que nos comportemos como se assim fosse. Com um sistema de crenças fundamentado na prioridade da sobrevivência, vivo uma experiência que atende à minha necessidade de “quantidade” quando me relaciono com a comida: coma à vontade e pague barato!

Quando cultivo o impulso de acumular, quer eu esteja acumulando comida ou outra coisa, isso efetivamente me impede de ser generoso com alguém — exceto com aqueles que acho que estão piores do que eu mesmo. Tenho amigas que são garçonetes. Um consenso geral entre elas é de que a “multidão do domingo à tarde” é o pior grupo de pessoas para atender. Eles são tipicamente exigentes, irritantes e sovinas com as gorjetas. Infelizmente, os cristãos que têm mentalidade de pobreza saem para almoçar depois da igreja e compartilham sua visão limitada do Céu com a sua comunidade.

Digo que costumamos ver uma mentalidade de pobreza em operação quando levantamos uma oferta na igreja. É mais ou menos assim que acontece: “Hoje vamos lhes mostrar um vídeo de crianças famintas na África. Essas crianças estão muito piores do que vocês. Vamos tocar uma música de adoração triste e lhes mostrar cenas trágicas para vocês se sentirem mais culpados por guardar seu dinheiro e tenham menos medo de dá-lo. Obrigado pela sua generosidade”.

A classe média é mais do que livre para comer sempre que desejar. Os recursos deles lhes dão muito mais opções. Portanto, a quantidade não é uma força motriz para escolherem o que querem comer. A classe média recomenda um restaurante assim:

“Ah! Você precisa ir lá. Eles têm o melhor frango cordon bleu do mundo! É muito bom. Eles também têm o melhor filé que já comi na minha vida. E o molho... Ah, é muito bom. É um pouco caro, mas é muito bom, você precisa experimentar”. “Ah, sim, já experimentamos esse lugar quando abriu, mas está meio sujo agora. Então, estamos frequentando este outro lugar que é muito mais limpo, e a comida é ótima.”

O valor dado à comida é determinado pela sua qualidade. Se não é saboroso, então a classe média irá rejeitar. Mas se for delicioso, eles pagarão a mais e voltarão depois. Eles sabem que podem escolher onde gastar o seu dinheiro e preferem ter qualidade, tanto na comida quanto no serviço, ou simplesmente não irão ser clientes daquele lugar no futuro. Nem recomendarão o local para os seus amigos e a sua família.

A visão dessa classe geralmente aparece na maneira como os crentes escolhem uma igreja. A classe média sabe que tem opções. Eles podem frequentar qualquer igreja da cidade. Então, é melhor que a qualidade da experiência seja boa ou eles não ficarão ali. Como foi o ensino? Como é o berçário? Eles têm um programa infantil de qualidade nesta igreja? Qual é a dificuldade de estacionamento nesta igreja? Eles foram gentis e amigáveis quando chegamos? Eles entendem que podemos escolher qualquer igreja da cidade, por isso é função deles manter o nosso dinheiro e nós por aqui? Eles sabem que conhecemos as pessoas desta cidade? Eles sabem que podemos ir para outro lugar, certo?

Os ricos são como pássaros estranhos para a maioria de nós. Eles podem ter a quantidade que quiserem da comida da mais alta qualidade que possam desejar. Portanto, eles veem a comida como uma obra de arte, algo que deve ter uma boa apresentação:

“Se a comida não me impressionar na maneira como é apresentada, então não estou no lugar certo. Elegância, estilo e beleza são o que fazem valer a pena frequentar um estabelecimento. Então, quando chegar a hora de comer, faça com que isso me diga alguma coisa!”

Todos os que servem comida aos ricos competem na maneira de se vestir. Os restaurantes dos ricos não têm cozinheiros; eles têm artistas e escultores criativos que trabalham na cozinha. Agora, se um sujeito pobre entra em um restaurante para ricos, ele ficará chocado com o tamanho da porção delicada coberta por um monte de “ervas”. Ele provavelmente ficará furioso e pensará que está sendo roubado quando descobrir que aquele leve chuvisco custa uma semana do seu salário. As perspectivas das nossas classes nos predispõem a nos relacionarmos com os recursos de determinada maneira. Se temos pouco, então não esperamos muito mais além de termos as nossas necessidades mais básicas supridas. Mas se temos mais do que o suficiente, então esperamos que até a experiência diária de comer seja um encontro com a beleza.

Os crentes que têm uma visão de mundo de riqueza esperam muito mais da sua experiência com Deus do que a salvação. Embora isso seja bom e eles estejam felizes por estarem indo para o Céu, esses crentes estão muito conscientes de como deve ser a vida na terra. Eles sabem que há mais provisão, mais beleza, mais poder e mais alegria de uma fonte que jamais poderia se esgotar, então eles se certificam de que estão vivendo isso todos os dias, o dia inteiro. Qualquer coisa menos do que isso seria ridícula.

Pobreza Classe Média Riqueza Destino Acredita no destino, mas Acredita na escolha; tem Seus membros têm a obrigação se sente impotente para poder para mudar o futuro moral de agir de determinada mudá-lo muito com boas decisões maneira (noblesse oblige)

A impotência é um dos principais efeitos da pobreza. Quando as pessoas vivem em um ambiente destituído de recursos, elas logo sentem as restrições muito reais da limitação. A falta de opções faz com que elas se sintam como vítimas, como se suas vidas estivessem determinadas por forças externas mais poderosas. O resultado é que elas vivem supersticiosamente, acreditando que uma força que não podem controlar determina sua vida. Elas acreditam no destino, na ideia de que a vida é algo que simplesmente acontece, e que o seu trabalho é fazer o melhor possível para se adaptar aos fatos. Acreditar no destino é como dirigir à noite com os faróis desligados. Você não pode realmente fazer muito acerca do que acontece, então simplesmente procura impedir que o seu carro sofra perda total com aquilo que você possa atingir.

O destino é opressivo para os pobres, porque uma força externa tem todo o poder e os deixa sem poder algum. Os pobres são escravos de suas vidas, e o sentimento de impotência naturalmente produz ansiedade, levando os pobres a procurarem consolo colocando suas esperanças em uma mudança de acontecimentos provocada pela sorte. Não são os ricos que compram bilhetes de loteria; são os pobres que querem um resgate milagroso das condições de suas vidas que eles não podem mudar. A vida tem a ver com sobreviver dentro do contexto do seu nascimento, e todos os que eles conhecem têm a mesma mentalidade. Os jovens podem escapar desse contexto, mas as esperanças dos mais velhos entre eles foram esmagadas pela vida cruel de pobreza — e eles acreditam que isso seja imutável. Eles podem conhecer algumas pessoas dotadas e “abençoadas” que escaparam dessa opressão, mas a maioria está presa em um conjunto de limitações que as mantiveram cativas por gerações.

Quando os crentes veem o seu destino em Deus através de uma visão de classe de pobreza, vivem uma vida natural e não sobrenatural, permanecendo presos aos problemas naturais sem esperança de intervenção celestial. Eles aprendem a culpar a Deus, que tem o poder para fazer alguma coisa a respeito de sua situação desesperadora, mas que opta por não fazer nada. Enquanto vivem um Evangelho sem poder, eles criam uma teologia para comprovar essa experiência, uma teologia na qual o Céu é muito semelhante à terra, Deus é muito semelhante a eles, e o resultado de suas vidas é predeterminado. O destino chama-se “vontade de Deus” e uma vida de limitações e destituída de poder é chamada de “humildade” e “perseverança”. Essas são virtudes que devemos alcançar e estabelecer como modelo — afinal, está na Bíblia, então deve ser verdade.

O grande “bilhete de loteria” a cada nova geração é o Arrebatamento. Já que Deus aparentemente não é poderoso o bastante nem está inclinado a mudar as circunstâncias deles, o que lhes dá esperança é a ideia de que Ele está planejando resgatá-los dessas circunstâncias. O conceito de ser poderoso ilude os que pertencem a essa classe de pobreza porque a vida em Deus não é uma experiência sobrenatural, mas é apenas mais do que eles têm experimentado até agora.

A classe média, por sua vez, tem uma interação muito mais poderosa com a vida. Eles acreditam que seus destinos e a qualidade de suas vidas são influenciados pelo fato de que eles têm escolhas. Ter opções cria uma expectativa de liberdade, e o acesso a recursos produz uma expectativa de que a pessoa tem poder para mudar o ambiente acrescentando a ela. Quando se deparam com problemas, as pessoas da classe média esperam ser capazes de mudar um sistema ou a maioria das limitações, a fim de seguir em frente com o desejo dentro delas. classe média acredita que os sonhos podem se realizar. Ela acredita que pode ter qualquer coisa que quiser, desde que continue fazendo escolhas sábias e seguindo práticas morais e saudáveis. Ela acredita que é seu direito viver livre e que possui o poder que necessita para preservar essa liberdade. Antes de tudo, a classe média patrocina as guerras e as economias. Ela pode escolher entre a vida e a morte, ou a quantidade de impostos que irá pagar para proteger a sua liberdade.

Mas a classe média também sofre limitações. Há um teto na quantidade de dinheiro ao qual ela tem acesso, um limite ao poder sobre o ambiente dela. A política, a mídia e a educação são as esferas de influência e de poder para os quais ela se volta em busca de ajuda para melhorar a sua vida. Quando essas fontes se esgotam, as pessoas da classe média procuram consolo na construção de algo novo em cada uma dessas áreas, para que a futura geração possa tentar uma mudança. Um novo prédio, uma nova campanha, uma nova especialidade nos levará mais longe rumo ao sucesso na realização e no cumprimento do nosso destino.

A maioria dos crentes nos Estados Unidos está presa na visão de classe média. Geralmente, somos conhecidos pelos nossos esforços para manipular o ambiente que nos cerca. É muito tentador querer fazer as pessoas pensarem como nós. Afinal, amamos as pessoas e desejamos o melhor para elas. Esperamos que as pessoas conheçam a Jesus e tenham o que nós temos. Pretendemos que as pessoas venham à nossa igreja e que a qualidade das nossas vidas esteja disponível a todos. Queremos que o nosso Evangelho encha as transmissões de rádio e televisão, seja ensinado em todas as escolas e legislado nos mais elevados governos da nação. Talvez a única coisa com a qual os crentes de classe média concordem é com essa visão do Evangelho como um remédio social e político para todos os males. A Coalizão Cristã como um movimento político pareceu uma ótima ideia na época e ainda pode parecer para alguns. Muitos de nós adoraríamos ouvir Rush Limbaugh, Oprah ou Bono dizerem “Deus” ou “Jesus” mais uma vez.

Os ricos, por sua vez, vivem uma existência sem limites, onde não há falta de nada. Ninguém lhes impede de conseguir o que desejam em sua mente e coração. Os ricos estão acostumados a conseguir as coisas do seu jeito. Seja o que for que peçam, eles recebem. Essa situação produz uma mentalidade que poucos experimentam — uma mentalidade de abundância. Ter mais do que você poderia usar e viver nessa realidade constrói um senso de obrigação dentro da vida da classe rica. Eles veem o seu papel na vida como um papel de noblesse oblige. Esse é o termo francês para a ideia de que as pessoas que nasceram na nobreza ou nas classes sociais superiores devem se comportar de forma honrada e generosa para com os menos privilegiados.

A mentalidade da riqueza é uma mentalidade de generosidade. Eles veem o favor e o privilégio de suas vidas como uma responsabilidade de levar capacidade e cuidado ao ambiente que os cerca. Destino, para os ricos, é dedicar suas vidas em longo prazo em benefício da sociedade e da geração em que vivem. Eles vivem para honrar a bravura de seus ancestrais e para ampliar a herança da família para os seus descendentes. Os ricos entendem que a prosperidade deve se expandir se precisa durar.

Quando nós, como crentes, começarmos a cultivar uma visão de mundo da classe rica, veremos o que os apóstolos e profetas veem. Veremos e teremos acesso aos recursos absolutamente ilimitados do Céu. Também veremos que esses recursos são uma herança, algo a que temos acesso porque fomos enxertados na linhagem real de Deus. Essa identidade é o que define a nossa responsabilidade de usar esses vastos recursos para beneficiar os que nos cercam. Quando começarmos a crer na inesgotabilidade do que temos e na responsabilidade do que fomos chamados para fazer com isso, passaremos a conhecer e a experimentar a realidade da promessa de que receberemos tudo o que pedirmos.[7] O sobrenatural invadirá as nossas vidas e finalmente perderemos a ansiedade, que tem sido parte tão grande da nossa cultura no Cristianismo — ansiedade que naturalmente é consequência de vivermos uma vida na qual não experimentamos todas as realidades que enchem as páginas da Bíblia que professamos crer e viver.

Espero que você possa perceber que “deixar a casa do nosso pai” e entrar na nova casa do nosso Pai, automaticamente transporta nossas vidas para outra experiência diferente da que os nossos pais viveram. Embora valorizemos e entendamos o legado daqueles que vieram antes de nós, não estamos ansiando pelos dias antigos. Não estamos orando para que voltemos à igreja do “Livro de tos”. Você pode imaginar o líder da empresa General Electric dizendo: “Tudo bem, rapazes, precisamos voltar aos dias gloriosos da vela. Mãos à obra! Levemnos de volta!”

Pobreza Classe Média Riqueza Visão de Mundo Local Nacional Internacional

Todos nós temos uma visão do mundo. Ela é o conteúdo e a dimensão com os quais nos preocupamos enquanto vivemos nossas vidas. A internet e a televisão a satélite ajudaram a expandir nossa consciência dos assuntos globais, mas cada classe continua com a sua própria prioridade no que se refere à visão do mundo.

A classe pobre vê a vida localmente. Pelo fato de que os recursos são escassos, eles não podem se dar ao luxo de se preocupar com muita coisa fora da sua esfera de responsabilidade imediata. Um bairro, uma aldeia, uma cidade ou parte de uma cidade é o perímetro de preo-cupação e investimento para a mentalidade da pobreza. As igrejas que possuem uma mentalidade de pobreza veem o mundo no contexto da sua congregação, da sua propriedade, da sua denominação ou do seu programa de missões. Ela está limitada ao que eles podem beneficiar diretamente ou ao que pode beneficiá-los diretamente.

Os indivíduos da classe média tendem a se preocupar mais com a sua nação, porque eles se sentem mais afetados com a situação do clima econômico e político nacional. Votação, notícias nacionais e previsões econômicas são preocupações sobre as quais eles assumem a responsabilidade mais prontamente para investir. As igrejas de classe média são aquelas que fazem as campanhas de “saia e vá votar” e que garantem que os cristãos saibam quem são os candidatos. Os temas de oração estão voltados para o clima social e político da nação.

A classe rica pensa internacionalmente. Essas pessoas são investidas globalmente, por isso elas estão entusiasticamente conscientes de como a atividade nos lugares de todo o mundo afeta a economia global. A mentalidade da riqueza entende o “quadro maior”, e como uma comunidade global, precisa ter êxito assim como as comunidades nacionais e locais.

Os crentes que têm uma visão de mundo rica viajam. Eles investem suas vidas em uma macroinfluência. Creio que Randy Clark oferece um veículo como ninguém mais que eu conheça para dar aos crentes uma experiência de visão de mundo rica. Há um poder em viajar para outras nações, juntando-se a outros crentes para ver o Céu tocar a terra enquanto você pratica o ministério de milagres e cura, que promove uma expectativa ilimitada em sua vida. Isso ajuda você a se conectar ao fato de que o Evangelho, a Igreja e o Reino de Deus são realidades globais. É uma demonstração prática do comissionamento que Cristo nos deu de “ide por todo o mundo e pregai o evangelho a toda criatura”. [8] Sua visão de mundo se expande à medida que você percebe que a agenda e os recursos do Céu se destinam a impactar o globo, e que você foi chamado para ser parceiro desse quadro global.

Pobreza Classe Média Riqueza Força Sobrevivência, relacionamentos, Trabalho, Financeira, política, relações Motriz entretenimento realização sociais

O que motiva você? Por que você se levanta de manhã? Vemos uma série de motivações nas diferentes classes sociais. Cada uma tem o seu próprio conjunto de valores essenciais fundamentados no que as impulsiona ao longo da vida. A força motriz para cada classe está arraigada em como elas veem o mundo onde vivem e como se relacionam com os recursos.

Para as pessoas da classe pobre, a preocupação diária com a sobrevivência é como uma bússola para as suas decisões, e pelo fato de que acreditam com convicção em sua impotência, essas decisões geralmente seguem o curso de encontrar o caminho de menor resistência a fim de evitar a dor. A busca pelo prazer e a fuga começa a cada dia, porque a vida carrega muita dor.

A importância dos relacionamentos para os pobres é a experiência do amor e a conexão social que eles oferecem. Sua família e seus bons amigos são o seu mundo e eles costumam estar juntos durante boa parte de suas vidas. Construir relacionamento entre os vizinhos é natural e esses relacionamentos são vitais, porque eles geralmente oferecem uma via de recursos para a sobrevivência. Infelizmente, porém, a tensão dos recursos limitados e o ímpeto pela sobrevivência geralmente levam ao detrimento e ao abuso nos relacionamentos.

O entretenimento oferece um método fantástico de escapar da dureza da realidade da pobreza. A capacidade de um indivíduo entreter outros com habilidade, humor ou música, o projeta para os lugares mais desejáveis na classe pobre. O valor do entretenimento e dos que atuam nesse ramo faz com que esse grupo produza a ambos.

Quando a força motriz dos crentes é a sobrevivência e escapar da dor, eles vivem em um caos contínuo. Divórcios, adolescentes rebeldes, violência doméstica e crises financeiras são a cultura do lar. A ansiedade e o medo ameaçam devorar qualquer coisa que tente crescer nesses ambientes domésticos. s igrejas movidas por essa força motriz lutam para criar um ambiente de crescimento e avanço, tendendo, em vez disso, a construir um legado de conflito e contenda. Geralmente, os recursos são a fonte de contendas. Como acontece com muitas nações que gastam décadas em guerras civis, essas igrejas são incapazes de se recuperar da última batalha com as autoridades governantes. Os despojos esfarrapados do que um dia foi um lugar rico em recursos tendem a marcar os destroços de uma igreja cuja força motriz é a sobrevivência.

A capacidade de realizar é a força motriz da classe média, o que explica por que esse grupo em geral é mencionado como a “classe trabalhadora”. A classe média dá valor àqueles que estão trabalhando para contribuir para a melhoria da sociedade. Poucas coisas são tão vergonhosas ou ofensivas para a classe média quanto as pessoas que não trabalham para ganhar a vida. Trabalhar duro para ganhar a vida está no topo do sistema de valores dessa classe devido ao valor que ela dá às coisas, ao planejamento do futuro e à realização. A educação, a personalidade e até a linguagem são motivadas pela necessidade da classe média de ter êxito em subir a escada do sucesso por intermédio do trabalho.

Em uma família de classe média, os pais trabalham para criar oportunidades para os seus filhos terem uma educação que lhes permita conseguir um emprego que pague bem. Quando o filho encontra essa carreira, o círculo está completo. Esses filhos então trabalham e se tornam bem-sucedidos para poder enviar seus filhos para uma boa escola que lhes dê a oportunidade de conseguir um emprego que pague bem. O amor é dispensado nesse sistema. Quando um filho fracassa em completar o círculo, os pais têm dificuldades para se sentirem bons pais, e a dinâmica da família sofre certa confusão e, às vezes, divisão, porque um filho quebrou o ciclo.

Motivados pela realização, os crentes da classe média têm um Evangelho de “obras” que os faz trabalhar para Deus. Ele lhes deu uma “boa educação” na igreja e agora espera que eles sejam trabalhadores de sucesso no Seu Reino. Os planos e objetivos da igreja da classe média são cheios de obras e realizações. Quanto mais realizamos “para Deus”, mais bem-sucedidos somos no ministério.

A igreja da classe média é muito semelhante a uma empresa, e capacita aqueles que são bons homens e mulheres de negócios ou grandes empreendedores. Eles geralmente se reúnem em torno de um empreendedor de sucesso para colocá-lo na liderança: “O Dr. Fulano de Tal é o nosso líder porque ele tem inúmeras credenciais e endossos por parte de outros líderes cristãos altamente empreendedores que todos nós conhecemos e respeitamos”. Sem perceber, acabamos vivendo um Evangelho de amor condicional. Essa ideia se infiltra no ambiente porque estamos tão ocupados celebrando os empreendedores que não vemos como tratamos aqueles que não estão “mostrando resultados”. No fim, todos entendem que Deus ama a todos nós, mas que Ele realmente ama aqueles que são bem-sucedidos. E essa mensagem é reforçada por toda a nossa cultura de classes.

Os ricos têm uma força motriz que, mais uma vez, não faz muito sentido para as outras classes. Eles saem da cama de manhã para estabelecer e fortalecer suas conexões com outros transformadores do mundo. Os ricos entendem que existem poucos tomadores de decisão poderosos que fazem do clima econômico, social e político global o que ele é. Eles estão muito preocupados em ter conexões com esses tomadores de decisão e trabalham para estar tão próximos deles quanto possível.

Os ricos não desperdiçam suas vidas trabalhando em um emprego. Eles não estão treinando os seus filhos para conseguirem um emprego. Em vez disso, eles enviam seus filhos para escolas as quais outros transformadores poderosos do mundo enviam seus filhos. As relações são a força motriz da classe alta. Eles acreditam que não é o que você sabe, mas quem você conhece e quem conhece você que o torna bem-sucedido.

Proteger e desenvolver esses relacionamentos uns com os outros lhes ajuda a saber o que está acontecendo em todo o mundo. Os líderes mundiais na política, nas finanças e na sociedade estão optando por passar o seu tempo uns com os outros por uma razão: sabendo que eles dirigem a porção maior dos recursos do mundo, eles trabalham para proteger o ímpeto da sua classe governante e de seus membros. Eles entendem coisas que as outras classes não entendem. Eles viveram vidas sem limites e sabem o que é preciso em termos de caráter e responsabilidade para manter a liberdade viva ao longo desta geração e da próxima. Os ricos farão tudo que for possível para ensinar seus filhos a lidarem, protegerem e passarem adiante os segredos de viver com liberdade ilimitada.

Os crentes que abraçam a prioridade e o poder das relações investirão o seu tempo e a sua energia em construir relacionamentos com outros avivalistas e investirão em treinar seus filhos para fazer o mesmo. Eles farão sacrifícios para estar onde a unção de Deus está sendo derramada. Eles estudarão e experimentarão as obras e maravilhas de Deus que estão acontecendo em todo o globo. Eles não ficarão satisfeitos em “trabalhar” para Deus, mas não pararão até que Ele derrame recursos ilimitados por intermédio da vida deles nas vidas dos que os cercam. Os crentes que têm a mentalidade da riqueza estão unindo seus corações a líderes apostólicos e proféticos em todo o mundo e dirigindo as energias, os recursos e o tempo de suas vidas para o sucesso desses líderes. Eles sabem que para que o conhecimento da glória do Senhor cubra a terra como as águas cobrem o mar, a igreja precisa ser cheia até transbordar como um todo.

Aqueles que têm recursos ilimitados não estão focados nesses recursos como fins em si, mas em investi-los nas coisas que realmente importam: pessoas, legados culturais, beleza. Eles estão buscando causas “dignas” — coisas dignas de honra. É por isso que os crentes que carregam uma mentalidade de prosperidade criam uma cultura de honra. Como a maioria das coisas na vida cristã, a honra não é uma ideia, mas uma prática, uma prática de dar. Os crentes com uma mentalidade de prosperidade não praticam “atos de bondade aleatórios”; eles abraçam o estilo de vida de benfeitores. E eles acham uma causa digna, um lugar para demonstrar honra, em todas as pessoas que encontram. Isso, afinal, é o que a cruz, que liberou os recursos do Céu a nós, nos ensina a ver nas pessoas.

Todos os motivos da classe pobre e da classe média para dar não podem se comparar ao que Deus fez por nós ao enviar o Seu Filho, porque Ele não enviou esus por piedade ou porque queria algo de nós, e certamente não porque nós merecíamos isso. Deus deu à raça humana a honra suprema tornando-se um de nós. Então Ele nos deu a honra ainda maior — em Sua morte e ressurreição, Ele abriu o caminho para nós nos tornarmos um com Ele. E para aqueles de nós que recebemos esse dom exorbitante de Deus, é a nossa honra suprema imitar Aquele que nos honrou convidando pessoas para a generosidade de Deus e dando a elas a oportunidade de provarem o que nós experimentamos.

Bill Johnson costuma declarar: “Devemos às pessoas um encontro com Deus”. Devemos a elas essa honra. A honra é dada com base em quem as pessoas são; não no que elas mereceram ou mesmo no que elas necessitam. Toda pessoa que você encontra é alguém que Cristo honrou com Sua vida, morte e ressurreição. Ela talvez não saiba quem realmente é do ponto de vista eterno, mas nós sabemos, e quando temos uma mentalidade de riqueza e um coração de honra, nós a trataremos de acordo com essa verdade.

Espero que você consiga ver que um crente que tem uma mentalidade de prosperidade é um dos componentes mais importantes para trazer o Céu à terra. Essa mentalidade não apenas nos treina para vermos as nossas circunstâncias imediatas a partir de uma perspectiva ilimitada, como também nos fundamenta nas nossas relações tanto com o Corpo de Cristo global quanto com as gerações que vieram antes de nós e com as que virão depois. Isso nos permite lançar fora as restrições do nosso passado e criar uma herança para os nossos filhos, a fim de que deixar a casa do pai e entrar na nova Casa do Pai não seja um abismo tão difícil de atravessar para eles.

Você pode imaginar como nossos filhos poderiam viver se eles fossem treinados desde o nascimento para andar na liberdade ilimitada do Reino? Você pode imaginar uma geração cujo sonho é beneficiar o mundo que a cerca aprendendo a administrar e a dar a outros os recursos ilimitados e transformadores do Reino?

Gênesis 12:1-3 diz:

Ora, disse o Senhor a Abrão: “Sai da tua terra, da tua parentela e da casa de teu pai e vai para a terra que te mostrarei; de ti farei uma grande nação, e te abençoarei, e te engrandecerei o nome. Sê tu uma bênção! Abençoarei os que te abençoarem e amaldiçoarei os que te amaldiçoarem; em ti serão benditas todas as famílias da terra.”$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Danny diz que toda pessoa que você encontra é alguém que Cristo já honrou com Sua vida, e que devemos a ela um encontro com Deus, com base em quem ela é e não no que merece. Pense em alguém difícil que você lidera ou pastoreia hoje: você o trata a partir da escassez (o que ele merece) ou a partir da abundância do Céu (a honra que Cristo já lhe deu)?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo confronta o crente que é 'príncipe, mas pensa como pobre' — que tem recursos do Reino, mas os usa para se proteger em vez de beneficiar os outros. Em que área da sua liderança ou da sua vida você percebe que ainda administra os recursos de Deus a partir do medo de que falte, e não a partir da herança ilimitada que recebeu?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Silk afirma que a honra não é uma ideia, mas uma prática de dar, e que quem tem mentalidade de prosperidade vive como benfeitor e enxerga em cada pessoa uma causa digna de honra. Olhando para sua semana concreta, onde você tem deixado de 'sair da casa do seu pai' — repetindo o normal herdado — em vez de criar uma nova cultura de generosidade ao seu redor?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 6 — A prioridade máxima da liderança  (aula ordem = 8)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 8;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 6 — A prioridade máxima da liderança$t$,
      8,
$conteudo$No amor não há medo; ao contrário o perfeito amor expulsa o medo, porque o

medo supõe castigo. Aquele que tem medo não está aperfeiçoado no amor.

(1 João 4:18, NVI) T homas Jefferson recebeu o crédito por dizer: “Pessoas livres são as mais difíceis de liderar”. Isso é extremamente pertinente para os líderes da igreja, porque as pessoas livres são exatamente o grupo que eles foram chamados a liderar.

Infelizmente, muitos líderes da igreja não dominaram as dificuldades de liderar pessoas livres. Para liderar pessoas livres, precisamos estabelecer um ambiente para que elas adquiram liberdade e um governo para que elas mantenham essa liberdade. Geralmente, o ambiente clássico das igrejas não é conhecido por nenhuma dessas duas coisas. As pessoas que observam de fora não esperam manter sua liberdade quando estiverem dentro da “instituição”. Aquelas que realmente entram, na maioria das vezes, estão dispostas a abrir mão de tudo que tiverem para se livrarem da sua dor. Quando essas pessoas aprendem que Deus é um senhor que quer controlá-las, como acontece tantas vezes, isso me faz desconfiar que os líderes da igreja não entenderam o nosso próprio Evangelho de liberdade. Um Deus controlador, que usualmente é representado por uma liderança eclesiástica controladora, simplesmente não é o Deus das boas-novas.

Como a liderança da igreja pode produzir liberdade e não mais regras? Como podemos extrair o melhor dos seres humanos e manter isso na superfície, até mesmo quando lidamos com os problemas e imperfeições deles? Podemos capacitar outros e liberá-los para viver sua melhor natureza e a partir das verdadeiras razões pelas quais eles estão vivos? Será que assumiremos a responsabilidade, como líderes, pais e empregadores cristãos, de aprender a extrair os sonhos e os destinos das pessoas que lideramos?

Deixe-me lhe mostrar um exemplo de como liderar pessoas livres (isso pode lhe ser familiar se você já leu meu livro Amando Nossos Filhos no Propósito). Minha filha Brittney tinha 14 anos de idade. E, como a maioria das meninas de 14 anos de idade, ela fazia uma ideia completamente diferente da ideia de minha esposa do que significava lavar a louça. Por esse motivo, eu costumava ouvir a conversa entre elas, que era mais ou menos assim:

Sheri dizia: “Britt, está na hora de lavar a louça”.

E Britt respondia: “Já vou, só um minuto”.

Aquele minuto se transformava em vinte, e Sheri falava novamente: “Britt, está na hora de lavar aquela louça”.

Britt rebatia a bola dizendo: “Estou fazendo o dever de casa como você mandou!” ou “Estou no telefone! Só mais um minuto”.

Esse diálogo fez parte do nosso ritual noturno por vários meses. Era como se elas duas não conseguissem chegar ao dia seguinte sem essa troca verbal. Inúmeras vezes, Britt se comprometia verbalmente a lavar a louça, apenas para falhar e deixar minha esposa acordar pela manhã e se deparar com a louça suja. Existem várias coisas que minha esposa não gosta nesta vida: injustiça, sushi, filmes de terror e louça suja. Ela realmente não quer acordar e ver a louça suja!

Finalmente, isso aconteceu pela última vez. Britt foi se deitar tarde em uma sexta-feira à noite e esqueceu de lavar a louça. No sábado de manhã, ela e Sheri tiveram uma pequena conversa a respeito disso pouco depois que Sheri encontrou a louça suja. Eu pude ouvir a “pequena conversa” delas do outro lado da casa. Quando terminou com Brittney, Sheri veio me dizer o que havia acontecido. Eu lhe disse que já ouvira. Enquanto isso, a amiga de Brittney, Rebecca, apareceu em casa e estava visitando Brittney em seu quarto. Quando Sheri e eu fomos procurar Brittney para discutir a situação da louça, descobrimos que, sem nos avisar, Britt e Rebecca haviam saído de casa e descido a rua até a casa de Rebecca. Sheri me olhou com fogo nos olhos. De repente, parecia que a cabeça dela estava explodindo em chamas, seu crânio se abrira e um dragão saía do alto da sua cabeça. O dragão olhou para mim e disse:

— O que você vai fazer?

— Eu? — respondi, abafando um sorriso.

— Sim! — disse o dragão. — O que você vai fazer a respeito da sua filha?

— Agora você quer que eu lide com esta situação? É isto que você está dizendo?

— Sim! — disse o dragão, cuspindo fogo.

Então eu corri e lavei a louça.

Agora, “lavar a louça” na nossa casa envolvia tirar a louça da pia e colocar na máquina de lavar. Isso foi tudo o que fiz. Devo ter levado seis minutos. Talvez.

Brittney e Rebecca voltaram para casa arrumadas, com maquiagens e rabos de cavalos iguais. — Mamãe, papai, posso ir ao shopping com Rebecca e a mãe dela?

Pensei que todos nós iriamos ver o dragão novamente, mas, em vez disso, Sheri estava mordendo o lado da mão, um sinal de que ela iria lidar com toda aquela questão. Eu disse:

— Brittney, querida. Eu lavei a louça para você.

Ela disse:

— Papai, isso não é justo! Eu ia lavá-la! Argh!

Britt começou a dar pequenos saltos que na verdade não a faziam sair do chão, mas que pretendiam comunicar a ideia de que ela não gostou do que estava acontecendo.

Rebecca observou a conversa com um olhar confuso no rosto. Ela finalmente perguntou a Britt:

— Você está com problemas? Como você sabe que está com problemas? Ninguém está gritando.

Brittney disse:

— Ele vai trocar de tarefa comigo!

— Querida, qual tarefa você gostaria de trocar comigo? Você gostaria de tirar o lixo para mim ou de limpar o galinheiro?

— Arghh! Bem, posso olhar?

— É claro que pode! É claro que você pode escolher qual você vai fazer.

E assim eu dei poder à criança. Eu queria que ela se sentisse poderosa junto de mim. E lá foi ela.

Para aqueles que não sabem, despejar o lixo é uma experiência cultural em nossa cidade, Weaverville. Se as latas de lixo fossem deixadas do lado de fora, acabariam com os cachorros, gatos ou guaxinins dentro deles, por isso tínhamos de colocar o lixo em uma área cercada. A porta do galpão tinha uma janela, e quando eu via os sacos de lixo pela janela, eu sabia que era hora de levar o lixo para o depósito. Era um trabalhão, de modo que eu sempre esperava que um de meus filhos trocasse de tarefa comigo.

Britt abriu a porta do galpão. Dez milhões de moscas começaram a voar ao redor do seu rosto. — Nojento!

Rebecca quase começou a correr para trás, gritando: “O que estamos fazendo aqui fora?” Brittney cuspiu uma mosca e revirou os olhos. Então ela foi até o galinheiro. Quando chegou lá ela estava bem zangada e chutou as galinhas ao entrar.

— Galinhas estúpidas! — Ela abriu a gaiola e ficou totalmente enjoada com o cheiro.

Então ela voltou para casa e me disse:

— Galinheiro.

— Que ótimo, Britt! Obrigado! — Respondi, animado por não ter de fazer aquela tarefa desta vez. Então perguntei:

— Agora, você gostaria de fazer isso hoje, ou amanhã após a igreja?

— Posso fazer amanhã? Realmente? Posso ir ao shopping hoje com Rebecca?

— É claro, se você quiser.

— Eu posso! Ah, papai! Obrigada! Obrigada!

Você deve estar pensando: “O quê? Você permite que um transgressor saia? Você deixa o pecador escapar da punição devida? Seu filho pode ter liberdade e privilégio sem primeiro experimentar o sofrimento que lhe ensina uma lição? Você não sabe que é necessário derramamento de sangue para expiar o pecado? Como essa criança vai aprender a lição?

Espere um pouco. A história não terminou.

Assim, lá foram elas para o shopping e se divertiram muito. Na manhã seguinte, fomos à igreja e quando voltamos, estava chovendo muito. Por quê? Porque Jesus me ama! Brittney estava tentando ser invisível.

Disse-lhe:

— Ei, Britt, querida! Você gostaria de usar as minhas botas de borracha ou esses chinelos bonitos que você está usando?

— Suas botas de borracha.

— Você quer usar a minha capa de chuva ou este suéter bonito que você está vestindo?

— A sua capa de chuva.

— Você quer usar o forcado ou a pá?

— Provavelmente vou precisar dos dois.

E lá foi ela. Uma... Duas... Três horas depois, ela entrou, arrastando a pá e o forcado. Britt tinha pedaços de palha pendurados na cabeça ensopada. Encontrei-a na porta dos fundos e perguntei se precisava de algo.

Ela disse:

— Acabei.

— Ótimo. Muito obrigado.

— Tudo bem! — E ela foi tomar banho.

Algum tempo depois, naquela semana, ouvi Sheri dizer:

— Brittney, lave aquela louça.

Então ouvi Brittney dizer:

— Arghh! Só um minuto!

Então me levantei e disse:

— Britt, eu vou lavá-la para você!

Assim que saí do sofá, ela veio voando pela casa, gritando:

— Fique longe da minha louça!

Eu sorri e disse:

— Ei, estou apenas tentando ser útil. Mas se você precisar que eu faça o seu trabalho para você, estou aqui.

Há um modo de liderar as pessoas para serem livres que permite que a responsabilidade pessoal venha à tona. Para liderar assim, no entanto, precisamos confiar nas pessoas. E sempre me impressiona o fato de que, quando confiamos que as pessoas perceberão a sabedoria de suas próprias escolhas, então vemos uma pessoa se tornar cada vez melhor nos nossos relacionamentos. As pessoas querem que confiemos nelas e elas querem ser livres. Crie um Lugar Seguro Por que você acha que as pessoas livres são tão difíceis de liderar? Bem, posso lhe dizer que o problema de liderar pessoas livres está ligado a uma questão sobre o universo em que os filósofos e teólogos trabalharam por séculos. Ela está ligada ao fato de que Deus, o líder do universo, nos criou para ser livres. Na verdade, Deus nos confiou a liberdade. C. S. Lewis apresentou um relato resumido dessa situação em seu livro Cristianismo Puro e Simples:

Deus criou coisas que tinham livre-arbítrio. Isso significa criaturas que podem ir para o lado certo ou errado. Algumas pessoas acham que podem imaginar uma criatura que era livre, mas não tinha possibilidade de errar; eu não posso. Se alguma coisa é livre para ser boa ela também é livre para ser má. É o livre-arbítrio que torna o mal possível. Por que, então, Deus lhes deu livre-arbítrio? Porque o livre-arbítrio, embora torne o mal possível, também é a única coisa que possibilita que valha a pena ter amor, bondade ou alegria. Um mundo de autômatos — de criaturas que funcionam como máquinas — não valeria a pena ser criado. A felicidade que Deus pretende para as Suas criaturas mais elevadas é a felicidade de estar livre e voluntariamente unidas a Ele e umas às outras, em um êxtase de amor e prazer que sequer se compara ao amor mais avassalador entre um homem e uma mulher nesta terra. E para isso eles precisam ser livres. É claro que Deus sabia o que aconteceria se eles usassem a liberdade da maneira errada: aparentemente, Ele achou que valia a pena correr o risco. [1]

A dificuldade em liderar pessoas livres é o risco — o risco de que elas usem a liberdade da maneira errada. Mas diferentemente de Deus, muitos de nós na igreja não entendemos por que o risco vale a pena. A ameaça da liberdade mal utilizada parece maior que o prêmio da verdadeira liberdade. E, por causa disso, ficamos assustados. Esse medo pode ser endêmico em sociedades supostamente livres. Nos Estados Unidos, suposto líder do mundo livre, o medo cresce desenfreado. Nós, como crentes, precisamos ter acesso a algumas coisas bastante poderosas se quisermos resistir ao medo na nossa cultura e mostrar confiança a Deus e às pessoas. Também necessitamos inserir em nosso sistema de crenças o valor que o Céu dá à liberdade.

Como Lewis indicou, todo o valor da liberdade, todo o propósito da liberdade, é o amor. Quando usamos a nossa liberdade para amar, como pretendido, a nossa liberdade e a liberdade dos que nos cercam são protegidas e cultivadas. Como líderes, precisamos realizar muitas coisas, desde definir a realidade a ensinar objetivos produtivos. Mas a prioridade do Céu é muito clara: “Se vocês não tiverem amor... vocês serão apenas barulhentos”. [2] Os líderes que extinguem o amor no processo de atingir objetivos talvez consigam atingir as prioridades da terra. Mas os objetivos mais elevados do Céu exigem que cultivemos e preservemos o amor, e assim a liberdade, pois não se pode ter amor sem liberdade. Deus é amor, e o Seu Reino é um reino de liberdade. Será por isso que a Bíblia nos diz: “ O Senhor é Espírito, e onde o Espírito de Deus está, aí há liberdade”?[3] Esse versículo está dizendo que quando Deus aparece, as pessoas se sentem livres. Se isso não está acontecendo, precisamos perguntar por quê. Por que a liberdade não está surgindo em mais lugares? Seria porque muitas pessoas, inclusive os líderes, entendem mal o objetivo da liderança de Deus em nossas vidas?

Quero propor que o objetivo da liderança de Deus em nossas vidas e, por conseguinte, o objetivo dos líderes da igreja, é criar um lugar seguro para descobrirmos quem somos e por que estamos aqui. Um lugar seguro é um lugar onde o medo da liberdade mal utilizada não consegue se levantar e nos intimidar, impedindo-nos de arriscar a confiar e a amar nos nossos relacionamentos uns com os outros. Um lugar seguro é o que é cultivado quando a liberdade é expressa através do amor. A essência do amor é segurança e conexão. Se as pessoas não se sentem seguras para ser elas mesmas e não têm uma sensação de conexão com as pessoas que as cercam, então é difícil convencê-las de que elas estão em um lugar amoroso.

No entanto, não vamos experimentar um lugar seguro com Deus e com o Seu povo enquanto não entendermos e acreditarmos que é isso que Deus quer para nós. Minha experiência é a de que a maioria das pessoas, inclusive os cristãos, pensa que Deus quer que nós entremos na linha, que fiquemos na linha e que sejamos bons. Abraçamos a ideia de que Ele é paciente, mas ainda está a um passo da ira. Para muitas pessoas, Deus é um personagem assustador, imprevisível e duro. Mas considere o que Deus disse por meio do profeta Isaías: “Porque os montes se retirarão, e os outeiros serão removidos; mas a minha misericórdia não se apartará de ti, e a aliança da minha paz não será removida, diz o Senhor, que se compadece de ti”.[4] As montanhas e os outeiros serão removidos? Você pode imaginar assistir uma montanha sendo removida? Você pode presumir o que seria preciso para que isso acontecesse? Exigiria mais que um pouco de violência, algo muito assustador.

Deus está dizendo que Ele não é imprevisível. Ele quer que estejamos completamente seguros da Sua atitude para conosco: “A minha misericórdia não se apartará de ti, e a aliança da minha paz não será removida”. Deus quer que tenhamos uma certeza bendita, uma verdade que nos posiciona para procurarmos a liberdade que vem até nós quando Jesus aparece. Essa mentalidade, essa expectativa e essa segurança nos permitem ser livres onde quer que estejamos.

Seja qual for a tese que você defenda contra Deus, sejam quais forem as passagens bíblicas que você use para defendê-la, seja o que for que você faça para construir uma realidade diferente, a bondade e a paz de Deus nunca serão retiradas de você. Essa palavra “paz” é literalmente a palavra shalom. Temos diversas definições poderosas para essa palavra. Veja o que diz o Dicionário Hebraico de Strong:

07965 shaw-lome; seguro, bem, feliz, amigável; saúde, prosperidade, paz, bem.

Observe que a primeira definição de shalom é “seguro” ou “segurança”. Nossa aliança com Deus é um lugar seguro. O poder dessa realidade é que nós, como seres humanos, florescemos na segurança. É por isso que shalom também significa “saúde” e “integridade”. Os efeitos substanciais da presença de Deus estimulam as partes mais profundas do melhor que há em nós. É por isso que Ele diz que a Sua aliança é para o nosso bem-estar e não para a nossa calamidade. [5] Sua aliança gera paz, felicidade, segurança e plenitude, e ela nunca será tirada de nós. Quando Ele se faz presente, a Sua presença é um lugar seguro.

Isso são boas-novas! Vá em frente e sorria. Quando o Senhor se faz presente, a Sua atmosfera está carregada de shalom.Ele leva um lugar seguro a todos os lugares onde se manifesta. Nunca deixo de me impressionar ao ver quantas pessoas querem defender a tese de que Deus é assustador. Mas isso acontece. É por isso que nós, como líderes da Bethel Church, entendemos que uma das nossas principais funções é declarar a verdadeira natureza e atitude de Deus para conosco regularmente. Quase todas as vezes que fazemos isso, podemos sentir que isso confronta diretamente o pensamento errado no ambiente. Muitas vezes, ouvi Bill Johnson declarar a uma congregação que Deus está de bom humor, apenas para ouvir risos nervosos irromperem por todo o lugar, como se dizendo: “Ah, ah! Nunca pensei em Deus desta forma”. Eu mesmo já fiz esse comentário em alguns lugares, dizendo: “Deus está de bom humor!” Quando digo isso, posso ver a confusão nos olhos de algumas pessoas. É como se elas quisessem pegar o seu Antigo Testamento e gritar: “Não, nesta parte da Bíblia Ele não está!” Sim, Ele está! Ele está de bom humor, do começo ao fim, e você pode defender essa tese também.

Não deveria ser necessário tanto esforço mental para entender essa verdade, já que Jesus veio e apresentou uma Nova Aliança. E isso foi há dois mil anos. Já deveríamos ter entendido isso a esta altura. Deus está muito familiarizado com o Seu projeto original para nós, de precisarmos de um lugar seguro. O Jardim do Éden era esse lugar. Fomos projetados para necessitar de liberdade. Estamos na nossa melhor forma quando estamos seguros, quando estamos felizes, quando nos sentimos saudáveis e quando temos paz. Se a nossa paz ou segurança é perturbada, então o nosso corpo físico inicia um processo de paralisação do nosso melhor e começa a nos preparar para mostrarmos o nosso pior. Funciona mais ou menos assim:

Deus colocou esta pequena glândula dentro do nosso cérebro chamada amígdala. Ela é uma massa de núcleos em forma de amêndoa localizada no fundo dos lobos temporais do cérebro. Essa glândula é importante para determinar as reações emocionais, principalmente aquelas associadas ao medo. Quando alguém faz alguma coisa ameaçadora ou inesperada, quando você não se sente seguro, a sua amígdala é ativada e começa a inundar o seu corpo com estas mensagens: reaja, defenda-se, desapareça, lute ou fuja. Essas são algumas das reações nas quais mostramos o nosso pior. Não é preciso ser um cientista espacial para descobrir que as pessoas que estão assustadas não estão no seu melhor momento criativo. Se você já esteve perto de uma pessoa que está se afogando e está apavorada com o medo de morrer, você sabe que seria uma boa ideia manter distância. Jogue uma corda ou um pau, mas não deixe que essa pessoa se segure em você ou você se tornará uma boia. Ah, sem dúvida a pessoa pedirá desculpas depois, se você sobreviver! Mas as pessoas apavoradas não estão pensando na equipe, na família, na igreja ou em qualquer pessoa além delas mesmas. O medo é um elemento perigoso para os seres humanos. A maioria deles não o administra bem.

Como você pode perceber, quando não nos sentimos seguros é provável que nos tornemos perigosos, permitindo que o medo comece a dirigir o nosso comportamento. E imagine o que acontece quando o líder é dirigido pelo medo. Muitos líderes, não apenas os líderes cristãos, são bastante tensos. O mesmo se aplica a muitos pais. Quando precisam ir a algum lugar com seus filhos, muitos pais ficam tensos desde o momento em que dizem: “Está na hora de sair!” Se você é um pastor que está se preparando para a manhã de domingo, há uma boa chance de você estar tenso. Se existe alguma coisa importante acontecendo, e o resultado importa para você, há uma boa chance de você levar a tensão com você por onde for. Isso é muito comum.

É claro que outra palavra para tenso (ou estresse, ou ansiedade) é medo. E este é o ponto: quando temos medo por dentro, há grandes chances de levarmos esse medo para os que estão do lado de fora. Como pessoas, quer crentes quer não, somos criativos e espirituais por natureza. Somos condutores espirituais e criamos uma atmosfera, uma realidade, um espírito, por assim dizer, ao redor de nós. Mas só podemos reproduzir do lado de fora aquilo que está do lado de dentro. Se nossos pensamentos e sentimentos estiverem cercados por um espírito de medo, embora estejamos pensando que o estamos escondendo facilmente, não conseguiremos mascarar a ansiedade que permitimos viver dentro de nossas vidas.

Infelizmente, muitas pessoas se acostumam a viver em um ambiente no qual aqueles que estão no comando são tensos. A maioria de nós é treinada bem cedo na vida a pensar que as pessoas que estão no comando não são seguras e podem nos ferir. Às vezes, aprendemos que as pessoas poderosas vão nos magoar. Desde as nossas primeiras experiências na infância, até a nossa mais recente interação com uma figura de autoridade, construímos um conceito sobre o que esperar de Deus, a figura de autoridade por excelência. Se o que aprendemos foi medo, imagine o que as nossas amígdalas estão fazendo durante todo o tempo em que estamos na presença de pessoas poderosas. O que isso está fazendo com o nosso potencial em Deus? Como nos tornaremos íntegros, livres ou saudáveis vivendo sob essas condições?

A resposta é simplesmente que isso não acontecerá. Mas a boa notícia é que a situação está mudando. O Céu, o reino de amor e liberdade, está invadindo a terra, e o amor está confrontando diretamente o medo que nos governou. O medo e o amor são inimigos. Esses dois espíritos não ocuparão o mesmo lugar juntos. O amor e o medo são como luz e trevas... Água fresca e água salgada... Bênção e maldição. E um deles precisa vencer. O amor lança fora o medo. [6] O amor não apenas lança fora o medo; ele gera segurança e shalom. Esse é o fruto que vemos em um ambiente apostólico. O medo sai da vida das pessoas. A liberdade cresce na adoração e nos nossos relacionamentos uns com os outros à medida que o povo começa a entender que há um lugar seguro em Deus.

Como indiquei no primeiro capítulo, criar um lugar seguro é a condição essencial para uma cultura de avivamento. O fato de que os milagres, os sinais e maravilhas não apenas aconteceram em nosso meio, mas têm continuado a acontecer por anos, aponta para o fato de que algo foi estabelecido — um odre de pessoas e relacionamentos saudáveis que se manifestam e carregam a shalom do Céu. E como expliquei no segundo capítulo, há uma ordem para a liderança, uma estrutura que sustenta o fluir da realidade celestial da graça nas vidas das pessoas e promove os valores e as verdades essenciais de uma liderança apostólica. É muito importante que o nosso líder esteja declarando regularmente a bondade de Deus sobre nós. Se os líderes acreditam que Deus é bom e que está de bom humor, então o povo o seguirá e aprenderá que isso é verdade para ele.

Quando os líderes entendem que a sua prioridade máxima é tornar a casa de Deus um lugar seguro, então, à medida que as pessoas encontram o lugar seguro da aliança de Deus em suas vidas e o seu potencial, a unção e a criatividade delas começam a se manifestar na superfície, e haverá espaço para manifestar essas coisas na igreja. Se os líderes puderem criar um ambiente onde as pessoas possam se sentir amadas, seguras e livres para serem elas mesmas, então começaremos a mudar o mundo com o Reino dos Céus. Então estaremos no nosso melhor momento. Então confrontaremos os principados e potestades que têm governado o planeta. Honra e Conflito honra é um dos valores essenciais mais vitais para criar um lugar seguro onde as pessoas possam ser livres. A honra protege o valor que as pessoas dão àqueles que são diferentes delas. Esse valor essencial é central em uma cultura apostólica porque, como vimos no capítulo 2, o padrão dos cinco ministérios é construído quando entendemos, valorizamos e abrimos espaço para as diferentes graças que repousam sobre diferentes pessoas e fluem por intermédio delas. As pessoas livres não podem viver juntas sem a honra; em contrapartida, a honra só pode ser usada com êxito entre pessoas poderosas que tenham um verdadeiro senso de responsabilidade pessoal em preservar a liberdade ao redor delas. Precisamos ser capazes de ser nós mesmos nesta vida e nessa comunidade, juntos.

Como você provavelmente deve estar ciente, altos níveis de liberdade podem gerar conflito, geralmente porque nos relacionamos com pessoas que estão vivendo de uma maneira que incomoda as nossas amígdalas. Sem o valor essencial da honra, descobrimos que o nosso desconforto perto daqueles que optam por viver de uma forma que nós não faríamos nos leva a impedir a liberdade deles. É típico, por exemplo, que quando um adolescente começa a explorar a sua liberdade, seus pais fiquem com medo. O medo se origina do fato de que o filho está escolhendo opções que os pais jamais escolheriam ou não escolheriam novamente para si mesmos. A guerra é sobre o quanto o filho pode ser diferente a ponto de se diferenciar de seus pais e o quanto os pais podem manter o filho parecido com eles. Quanto mais o filho se afasta da maneira como os pais vivem, mais provável será que os pais entrem em cena e retirem as escolhas do filho. O resultado é conflito. Mas quando o adolescente e os pais praticam a honra, que promove amor e confiança, o medo não tem permissão para governar as decisões deles, e a liberdade pode ser preservada.

Obviamente, quando falo sobre diferentes maneiras de viver, não estou dizendo que a imoralidade ou a transgressão do nosso relacionamento com Deus são opções viáveis para qualquer um de nós. Mas muitos cristãos discordam sobre como viver. Quando as pessoas começam a andar em liberdade, elas dirão e farão coisas que demonstram a todos ao redor que a conformidade não é uma prioridade. Isso bate de frente com muito da nossa experiência da cultura cristã. Mais uma vez, não estou defendendo a tese de que as pessoas sejam rudes, sem consideração ou teimosas, mas estou procurando apontar para o fato de que as pessoas livres não estão terrivelmente interessadas em usar uma máscara diante de ninguém.

Desde a maneira como nos vestimos até o estilo de música que ouvimos, se bebemos álcool ou não, se falamos português ou evangeliquês, até o fato de se os dons do Espírito estão em operação hoje ou não, a realidade é que a liberdade trará as nossas diferenças à tona e gerará atrito dentro de uma comunidade. Quando as pessoas que nos cercam não estão mais protegendo os nossos paradigmas, as nossas amígdalas são ativadas. É assim que muitas vezes acabamos mostrando aos outros o nosso pior lado.

Como você pôde perceber, a cultura da honra tanto promove um lugar seguro, quanto, ao mesmo tempo, cria um ambiente de grande conflito. A questão é se aprenderemos a usar a honra para enfrentar o conflito quando ele surgir. O conflito não é necessariamente ruim. Na verdade, quando o conflito passa, a vida muito provavelmente se vai com ele. Às vezes, esperamos que a paz signifique a ausência de conflito, mas a verdadeira paz é sempre o resultado da vitória. E não consigo pensar em uma vitória que não tenha começado primeiramente com uma luta.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Danny diz que a prioridade máxima da liderança é criar um lugar seguro, e que só reproduzimos por fora aquilo que vive por dentro — se há medo dentro de nós, levamos esse medo para quem lideramos. Que medo você tem carregado para dentro da sua casa, da sua liderança ou da sua mesa, e como ele tem ativado a 'amígdala' das pessoas ao seu redor?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo mostra que liderar pessoas livres exige correr o risco de que elas usem mal a liberdade, e que muitos de nós, ao nos assustarmos, viramos 'viciados em controle' e retiramos as escolhas do outro. Em que relacionamento você tem retirado a liberdade de alguém para diminuir o seu próprio medo, em vez de confiar e preservar essa liberdade pelo amor?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Silk insiste que o perfeito amor expulsa o medo e que amor e medo não ocupam o mesmo lugar — um precisa vencer. Quando você pensa na atmosfera que cria como líder, as pessoas ao seu redor experimentam mais shalom (segurança, bondade, descanso) ou mais tensão e cautela quando você chega?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 7 — Confrontando segundo o modelo do reino  (aula ordem = 9)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 9;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 7 — Confrontando segundo o modelo do reino$t$,
      9,
$conteudo$É mais difícil fazer as pazes com um amigo ofendido do que capturar uma cidade fortificada. As discussões separam os amigos como um portão trancado com barras de ferro. (Provérbios 18:19, New Living Translation, tradução livre) N ão haverá cultura da honra sem o uso ativo do confronto eficaz. A habilidade de combinar estes dois elementos relacionais — a honra e o confronto — é a chave para manter-se um ambiente de graça. Por favor, concentre-se neste capítulo. Ele lhe ajudará imensamente a gerar o que acredito que seja a sua esperança.

Paulo escreveu aos gálatas extensamente sobre o fato de que somos um povo que foi chamado para andar em liberdade e amor por intermédio do governo interno do Espírito de Deus. Mais uma vez, essa ideia não é nova; apenas parece que nós, assim como os gálatas, temos dificuldade em entendê-la. Abordamos uma parte do que Paulo escreveu ao falar de por que não podemos ser punidos, e essa convicção é fundamental para praticarmos o confronto segundo o modelo do Reino. Para o nosso propósito aqui, vamos rever a descrição que Paulo faz de nós como herdeiros maduros:

Digo, pois, que, durante o tempo em que o herdeiro é menor, em nada difere de escravo, posto que é ele senhor de tudo. Mas está sob tutores e curadores até ao tempo predeterminado pelo pai. Assim, também nós, quando éramos menores, estávamos servilmente sujeitos aos rudimentos do mundo; vindo, porém, a plenitude do tempo, Deus enviou seu Filho, nascido de mulher, nascido sob a lei, para resgatar os que estavam sob a lei, a fim de que recebêssemos a adoção de filhos. E, porque vós sois filhos, enviou Deus ao nosso coração o Espírito de seu Filho, que clama: “Aba, Pai!” De sorte que já não és escravo, porém filho; e, sendo filho, também herdeiro por Deus.[1]

Não somos mais escravos, mas filhos! Nossa condição de vida passou da necessidade de um guardião e mordomo (controles externos) para a de filhos poderosos e livres do Deus vivo. [2] E muito mais é exigido para atuar na liberdade de ser uma pessoa poderosa e rica do que nas limitações de um escravo.

Você se lembra do filme Matrix? Em seu primeiro encontro com Morfeu, Neo ouve: “Você é um escravo, Neo. Como todos os outros, você nasceu escravo, nasceu dentro de uma prisão que você não pode cheirar, provar ou tocar. Uma prisão para a sua mente”. Então ele oferece a Neo a liberdade dessa prisão — a pílula vermelha. Mas quando Neo desperta no “mundo real”, ele se encontra em uma mesa de cirurgia com todo tipo de coisas saindo dele. Morfeu explica que eles estão reconstruindo os seus músculos, pois ele nunca os usou antes. Essa é uma imagem dramática, porém bastante clara, do que acontece conosco, que nascemos “em cativeiro sob os elementos do mundo”, para entrarmos na vida de liberdade.

Como escravos, seguimos o caminho da menor resistência, onde não era exigido que assumíssemos a plena responsabilidade pelo nosso pensamento e comportamento. Nunca desenvolvemos os músculos morais para lidar com opções ilimitadas. Mas no “mundo real” do Reino, espera-se que os filhos e filhas de Deus não apenas sejam livres, mas também entendam por que são livres e que eles exerçam essa liberdade visando o propósito dela — o amor. Como Paulo continua dizendo:

Porque vós, irmãos, fostes chamados à liberdade; porém não useis da liberdade para dar ocasião à carne; sede, antes, servos uns dos outros, pelo amor... Digo, porém: andai no Espírito e jamais satisfareis à concupiscência da carne.[3]

Nosso sucesso em usar a liberdade para amar se resume em andar no Espírito. Por esse motivo, se como líderes quisermos edificar um povo que pode lidar com a liberdade, então nossos métodos de liderança precisam amadurecer para tratar com o espírito do homem e não simplesmente com o seu comportamento.

Paulo continua dizendo: “Irmãos, se alguém for surpreendido nalguma falta, vós, que sois espirituais, corrigi-o com espírito de brandura; e guarda-te para que não sejas também tentado”.[4] Ele está dando instrução para o que fazer quando algum de nós por acaso passar por alguém que caiu em um buraco. No capítulo anterior, Paulo descreveu aqueles que são guiados pelo Espírito e expressam o Seu caráter (fruto) em suas vidas. Aqui ele se dirige a “vós, que sois espirituais” — aqueles que sabem e demonstram o amor e o caráter de Deus — e declara que devemos lidar com essas situações com um “espírito de brandura”, que é um dos frutos do Espírito.

Também devemos ser muito cuidadosos com o preço de julgarmos as outras pessoas. Como Jesus ensinou, o mesmo julgamento que emitimos sobre o pecado de outra pessoa será medido e usado em nós. [5] Julgar os outros pinta um enorme alvo em nossos rostos e dá ao inimigo a oportunidade de se voltar contra nós.

“Um espírito de brandura” é uma expressão importante. Ela descreve especificamente a atitude de coração da pessoa que realiza o confronto. A brandura é o termo perfeito para descrever a atitude que devemos ter para com aqueles que cometeram erros ou falharam de alguma forma. Brandura não significa ser bom, nem quer dizer ser educado. O coração brando é a convicção de que “eu não preciso controlar você”. Imagine você se aproximar de um veado querendo domesticá-lo. Se esse veado por um instante pensar que você pretende capturá-lo, então tudo está perdido. Aqueles de nós que conhecemos o coração de Deus devemos ter a convicção em nosso interior, a cada confronto, de que não tentaremos controlar a pessoa que está com problemas. Essa é a primeira e a mais importante habilidade a ser desenvolvida. E também a mais difícil.

O domínio da brandura começa em nosso sistema de crenças. Será que acreditamos que podemos controlar os outros? Vamos rever a maneira simples de testar isso. O que acontece com você quando outra pessoa não permite que você a controle? Você fica irado? Você interpreta isso como desonra? Você encontra uma maneira de se justificar punindo-a? Um sim a qualquer dessas perguntas expõe o fato de que você ainda acredita na mentira de que pode e deve controlar as pessoas. O confronto segundo o modelo do Reino requer que você se arrependa disso e comece a permitir que os outros controlem a si mesmos.

Eu tinha uma expectativa secreta de que o avivamento eliminaria todos os problemas do meu ambiente, e com o tempo essa expectativa acabou se revelando. Um dia, senti uma onda de incredulidade vir sobre mim, porque os problemas das pessoas estavam me cercando — adultério, abuso infantil, vícios, mentiras e outras coisas mais. Pensei comigo mesmo: Se Deus está realmente aqui e o Seu Reino está vindo, então por que tantas pessoas ainda estão com as vidas tão arrasadas? Essa pergunta fez com que eu pensasse sobre o Reino de Deus como eu nunca pensara. O Céu é um lugar onde Deus controla todas as escolhas? E quanto ao Jardim? Aquele lugar certamente tinha opções!

Então percebi que também há escolhas negativas no Céu. Tem de haver escolhas negativas no Céu, porque ele é um lugar livre. Lúcifer encontrou uma escolha ruim. Desde então, ouvi Bill Johnson dizer muitas vezes: “A graça em uma cultura dá ao pecado que habita no coração das pessoas a oportunidade de se manifestar”. Quando vivemos em um lugar de amor e aceitação e estamos aplicando o amor incondicional de Deus às vidas das pessoas em todo o tempo, o pecado que está dormente em suas vidas ou contra o qual elas têm lutado ou escondido, sairá à luz e acabará no chão.

Creio que podemos aprender uma lição sobre a cultura da graça observando a evolução da criação de porcos. Os porcos são famosos pela sujeira e pelo cheiro. Durante séculos, as fazendas de porcos eram os ambientes mais desagradáveis que se pode imaginar. Pelo fato de que os porcos não têm uma maneira natural de esfriarem seus corpos, os fazendeiros providenciavam um buraco de lama para os porcos, a fim de impedi-los de superaquecerem. Esses buracos de lama, onde os porcos chafurdavam durante boa parte do dia, finalmente ficavam cheios de urina e fezes porque... Bem, parece que os porcos não encontravam um banheiro. Se você já esteve perto de uma pocilga, conhece o odor forte que permeia toda a área e que se espalha até tão longe quanto o vento pode levá-lo. Imundície, doenças, bactérias e infecções são coisas que se encontram aos montes nesses lugares.

Mas nos últimos tempos, alguém decidiu separar os porcos dessa sujeira. Em lugar de aceitar que a sujeira faça parte da criação de porcos, hoje os fazendeiros constroem instalações projetadas para proteger os porcos de tudo que é desagradável. Em vez de usar lama para esfriar os porcos, eles usam água. O chão e as áreas onde os porcos vivem têm drenos e sistemas de enxágue que levam embora os dejetos. Os porcos agora podem viver em ambientes limpos e ser tão higiênicos quanto os animais domésticos. Isso era inimaginável há muito pouco tempo, e ainda não se tornou universal; muitos criadores de porcos ainda usam os antigos métodos porque os novos sistemas são muito caros.

O Pai pagou o mais alto preço para colocar à nossa disposição um novo sistema para tratar com as nossas sujeiras. Se a humanidade pode encontrar uma maneira de criar porcos limpos e está disposta a pagar o preço, então certamente o custo do sangue de Jesus pode realizar o desejo do coração do nosso Pai para nós. Jesus declarou: “ Vós já estais limpos pela palavra que vos tenho falado ”.[6] Estamos limpos!

Portanto, seria melhor que tivéssemos um mecanismo em nossa cultura cristã que lide eficazmente com o pecado quando ele aparece bem na nossa frente. Seja qual for o motivo, passamos a esperar que a igreja seja um lugar onde não vai haver nenhum pecado. Isso simplesmente não é verdade. Se não soubermos como lidar com o pecado, então não saberemos como lidar com as pessoas. Criamos inevitavelmente uma cultura da lei, a fim de impedir as pessoas de pecar. A mensagem dessa cultura é: “Contenha o seu pecado dentro de você. Não o mostre a mim; eu não sei lidar com ele”.

Lembre-se de que essa era a fala dos fariseus. Eles eram famosos por ter medo do pecado, em grande parte devido ao fato de que o único remédio para o pecado nos dias deles era aplicar vários níveis de punição. O medo da punição governava o coração deles, os seus relacionamentos e a sua cultura. Jesus, no entanto, tinha um grupo de companheiros improváveis. Eles eram ladrões, coletores de impostos e prostitutas da época. Comparado aos outros líderes religiosos daquele tempo, Ele era como o “Jesus de Vegas”. Ele não tinha o menor medo do caos que as pessoas faziam em suas vidas e de permitir que elas estivessem com Ele. Até mesmo as pessoas que passaram três anos andando pessoalmente com Jesus ainda cometiam erros na noite da Sua crucificação. Mas, finalmente, o Seu amor e a maneira como Ele liderava as pessoas as capacitou a se erguerem acima dos seus erros e problemas.

Se quisermos cultivar uma cultura da graça, precisamos ter maneiras eficazes de lidar com os problemas das outras pessoas. Necessitamos de ambientes que retirem os dejetos para longe das pessoas em vez de fazer deles parte de quem elas são. Nossos métodos precisam retirar os dejetos, porém, sem reforçar a expectativa de que as outras pessoas nos controlem e de que nós controlemos os outros. Como já afirmei, ninguém pode nos controlar. Já estamos muito ocupados tentando controlar a nós mesmos. Assim, também carecemos de formas que nos capacitem a administrar a nós mesmos na presença dos problemas das outras pessoas. Nosso poder e nossa paz estão fundamentados em sermos capazes de manter a nossa liberdade uns com os outros por intermédio do domínio próprio. Sem a prioridade no domínio próprio, vivemos reagindo constantemente uns aos outros, o que gera uma cultura de culpa e irresponsabilidade que nos leva a agir mais ou menos assim: “A sua coisa dispara a minha coisa, e não sei o que fazer quando você faz isso. Pare com isso! Agora vou culpar você pelo que faço. Se você não fizer isso, eu não terei de fazer aquilo”.

As pessoas terão de volta o seu poder mais rapidamente em uma cultura com líderes poderosos que liderem em liberdade e honra. Essa cultura valoriza altamente o confronto, um valor que deriva do entendimento de que não consertar os erros gera um ambiente tóxico para todos. Entretanto, quero descrever o que é o confronto e o que ele não é, porque existe uma confusão sobre esse ponto que criou um caos ainda maior que o confronto mal administrado causou. Vou lhe mostrar passagens na Bíblia nas quais ele funcionou lindamente. Oro para que você receba uma transferência da verdade no seu pensamento acerca de como abordar o problema do pecado nas vidas daqueles que o cercam e de como administrar a si mesmo nos relacionamentos. Objetivos do Confronto Primeiramente, vamos identificar os objetivos do confronto. Eles devem estar no seu coração e motivá-lo quando você realizar um confronto. O confronto tem a ver com trazer alguma coisa à luz. Quando eu vou até você com um espírito de brandura, eu estou indo para acender as luzes para que você tenha a oportunidade de ver. Mais uma vez, brandura significa que eu não preciso controlar você. Esse confronto não é uma tentativa de forçá-lo a fazer alguma coisa. É um esforço amoroso para lhe mostrar, face a face, o que quem sabe você não esteja vendo ou talvez não saiba sobre suas ações, ou sobre como você está afetando o mundo que o cerca. A brandura ajudará a ansiedade a permanecer em baixa e o amor a aumentar nesse processo de confronto.

Tradicionalmente, confronto e conflito são sinônimos. Essas palavras ativam pensamentos de luta e ofensa. Com frequência, as pessoas que se importam umas com as outras acabam feridas, e o culpado nessas lutas é o controle. Os objetivos errados causarão um resultado indesejado. Portanto, é importante identificar e entender os objetivos corretos do confronto:

Apresentar as consequências de uma situação a fim de ensinar e fortalecer. Trazer à tona o que as pessoas esquecem acerca de si mesmas quando falham. Fazer um convite a fortalecer um vínculo de relacionamento com alguém. Aplicar pressão estrategicamente a fim de expor áreas que precisam de força e graça.

Deixe-me explicar como apresentar as consequências a fim de ensinar e ortalecer. Mais uma vez, esse objetivo não poderá ser alcançado enquanto você não lidar com sua convicção de que pode controlar os outros. Não devemos ter intenção alguma de fazer com que a pessoa faça algo. Em vez disso, esse processo ajudará a pessoa a perceber o problema que ela criou e a enxergar um aliado útil em você.

Em segundo lugar, precisamos entender que há uma diferença entre uma consequência e uma punição, e ser cuidadosos em apresentar a primeira.

Muitos de nós somos confrontados nesse ponto porque ouvimos a punição ser chamada de disciplina. Todos nós sabemos que disciplina é algo bom — a Bíblia indica claramente que o amor e a disciplina estão ligados. [7] Infelizmente, o que chamamos de disciplina parece muito com punição, e nós a sentimos como uma punição. Isso nos ajuda a mascarar o nosso medo e a justificar a nossa necessidade de controle. Não há poder dado àquele que recebe essa disciplina. quele que administra a disciplina exige a obediência completa daquele que está sendo disciplinado, e aí está a diferença entre a disciplina que na verdade é punição e a disciplina por meio das consequências. As consequências são diferentes da punição, porque com as consequências o poder é dado àquele que causou o problema.

O processo do confronto segundo o Reino é um processo de capacitação, e não de dominação. Quando uma pessoa falha e produz uma consequência por essa falha em sua vida, o confronto conduz e capacita a pessoa a reparar o erro. Um dos nossos ditados na Bethel Church é: “Sinta-se tão livre para criar uma grande confusão quanto você estiver disposto a arrumá-la depois”. Isso não é um anúncio irreverente de irresponsabilidade. É simplesmente um recado a todos que diz que a responsabilidade pessoal é exigida nesse ambiente. Ninguém ficará empacado no seu erro, mas ninguém será capaz de corrigir um problema que você criou tão bem quanto você.

Na Bethel, nossa intervenção está em estabelecer a expectativa que as pessoas, motivadas pelo respeito nos relacionamentos, responderão por ter domínio por suas escolhas e as consequências que virão delas. Essa resposta somente é possível quando as pessoas souberem que são livres. Elas são livres para jogar fora a coisa toda. Somente elas podem escolher honrar e respeitar a sua comunidade e relacionamentos.

Se tirarmos essa opção porque queremos controlar o resultado, então nós retiramos o poder das pessoas e criamos vítimas impotentes e irresponsáveis. Vítimas impotentes nunca possuem nada e não transformam suas circunstâncias. Portanto, os nossos confrontos devem ter o objetivo da capacitação ou do revestimento de poder desde o começo. O nosso processo de confronto indicará as conse-quências das escolhas das pessoas e lhes oferecerá força e sabedoria em vez de controle e punição.

No primeiro capítulo deste livro, contei a história de um casal de alunos do nosso ministério que ficaram grávidos durante as férias de verão entre o primeiro e o segundo ano. Como você deve se lembrar, apresentei o processo que atravessamos com eles como um exemplo de como fazemos a maioria dos confrontos em nossa cultura. Nossa equipe e eu tivemos um grande respeito e honra por aqueles dois alunos. Nossa prioridade era proteger o nosso relacionamento com eles enquanto lhes mostrávamos algo que eles não estavam vendo: o problema e as suas consequências. Durante o confronto, buscávamos e protegíamos esses objetivos. Sabíamos que o confronto traria para eles uma tremenda percepção, sabedoria e entendimento, à medida que os ajudávamos a resolver o problema e a corrigir seu erro. Também os capacitamos de uma maneira que trouxe esperança e alegria, o que fortaleceu a ambos em meio ao processo de correção do erro.

Nosso processo com aquele casal também ajudou a revelar e a confirmar as verdadeiras identidades deles como filho e filha do Rei dos reis, atingindo assim o objetivo seguinte do confronto: trazer à tona o que as pessoas esquecem sobre si mesmas quando falham. Em uma cultura de regras, as pessoas não apenas esperam ser punidas quando falham, como também ficam oprimidas pelo poder da vergonha. De acordo com o tamanho do erro delas ou da sensibilidade delas ao fracasso, a vergonha cria raízes no coração e na mente daqueles que falham. Ora, a vergonha não é apenas um sentimento; é um espírito. É um espírito que ataca a identidade dos indivíduos. Esse espírito mente para as pessoas e as leva a acreditar que o mau comportamento delas tem origem em quem elas são: “Você não falhou; você é um fracasso. Você não cometeu um erro: você é um erro!”

Nossos dois alunos são pessoas incríveis. Eles cometeram um grande erro e ainda continuam sendo pessoas incríveis. As pessoas que queríamos ver aparecer durante o nosso confronto eram as melhores pessoas que eles têm dentro deles. A vergonha havia se decidido a cobrir essas pessoas e procurava destruí-las. Nosso trabalho era trazer o melhor deles à tona e depois lhes apresentar a realidade da situação, sabendo que o melhor deles tomará as melhores decisões e transformará a tragédia em triunfo. Por termos começado com esse objetivo, fazia sentido permitir que aquelas pessoas se manifestassem e confiar nelas. Se tivéssemos tido a necessidade de puni-los, teríamos acabado colaborando com a vergonha e exigindo que eles assumissem uma posição de impotência que nos permitisse controlá-los e fazer com que eles realizassem os nossos desejos.

A grandeza que habita no centro de cada crente deve vir à tona se quisermos verdadeiramente representar o nosso Pai do Céu. Vestir-se com o manto da vergonha e da culpa não apenas é impróprio para nós como Seus filhos e filhas, como é uma armadilha de impotência. Estender a mão para as pessoas e trazer a tona suas verdadeiras identidades é um ato de amor que viverá por muito mais tempo que o aguilhão do fracasso e das consequências. As pessoas podem ver e pensar quando a identidade delas está livre do medo e da vergonha. Vez após vez, vimos a grandeza daqueles que cometeram erros assumir o comando e transformar o mal em bem. E com isso, vemos os nossos relacionamentos de aliança serem fortalecidos e aprofundados.

Este é o nosso próximo objetivo no confronto: fazer um convite para ortalecer um vínculo de relacionamento com alguém. Precisamos ver o processo de trazer um problema à luz como um convite para praticar os nossos relacionamentos de aliança. Pode parecer que a nossa prioridade é resolver uma questão ou mudar um comportamento. Mas, na verdade, o confronto segundo o Reino é um teste da aliança entre duas ou mais pessoas, e esse relacionamento é sempre a prioridade máxima. Quando mantemos as outras pessoas responsáveis pela maneira como elas estão nos afetando, ou afetando a comunidade que as cerca, expomos os níveis de confiança que temos com esses indivíduos. Quando testamos a relação entre nós por meio do confronto, aprendemos a verdadeira força da nossa aliança com outra pessoa.

Com frequência, encontramos relações fracas e frágeis quando confrontamos. s vezes, é chocante o pouco valor que as pessoas dão ao seu relacionamento conosco. Outras vezes, isso simplesmente confirma o que pensávamos e esperávamos encontrar.

A confiança é a chave para um confronto bem-sucedido. Sem ela, descobriremos as nossas limitações rapidamente. Se e quando descobrirmos que um confronto não está indo bem, a primeira coisa a ser verificada é o nível de confiança. Quando a confiança é baixa, a ansiedade geralmente é alta. Quando a ansiedade aumenta, nossa prioridade no encontro muda para a autopreservação, na maioria das vezes procurando controlar um ao outro. Se tivermos alguém diante de nós que acredita que precisa se proteger de nós, então não estaremos falando à grandeza dele, mas sim às suas táticas de sobrevivência. Para ter confiança, a pessoa que confrontamos precisa acreditar que estamos a favor dela e que protegeremos os seus melhores interesses ao longo do confronto.

Nossos dois alunos eram totalmente estranhos para mim quando nos encontramos naquele dia. Antes da nossa conversa em meu gabinete, eu nunca havia falado com nenhum deles. Aqueles dois estavam apostando todas as suas fichas ao entrarem no gabinete de um completo estranho — um estranho que tinha o poder para puni-los, nada menos que isso. Cientes da posição extremamente vulnerável deles, eu agradeci por confiarem em mim. Vergonha, ansiedade e a expectativa da punição eram elementos contrários a nós desde o princípio. Pedi aos líderes da escola para estarem presentes na reunião conosco para que eu pudesse “tomar emprestada” a confiança que o casal já tinha construído junto a eles. Eu sabia que precisava estabelecer a confiança antes de poder aplicar qualquer pressão sobre eles na esperança de encontrar a fonte do problema.

Nosso objetivo final é aplicar pressão estrategicamente a fim de expor as áreas que necessitam de força e graça. Precisamos encontrar os “pontos de rachadura” e trabalhar para começar a restaurá-los. A minha melhor analogia para “aplicar pressão” vem dos meus primeiros anos de vida adulta em uma loja de pneus. Uma das minhas funções era consertar os pneus furados. Eu levantava o caminhão com um macaco, retirava a roda do caminhão, tirava o aro e separava o anel, retirava o pneu da roda e a câmara de ar furada. Então eu ligava a mangueira de ar à válvula da câmera interna e a enchia de ar — muito mais ar do que ela podia conter quando estava dentro do pneu. Quando a câmara era esticada à sua capacidade máxima, eu a levava para um tanque cheio de água e começava a submergir partes dela sob a água. Enquanto eu mantinha partes da câmara de ar debaixo d’água, eu a girava em minhas mãos e procurava uma coisa: bolhas. Eu estava tentando encontrar o “ponto da rachadura” por onde o ar estava vazando. Assim que eu localizava de onde as bolhas vinham, eu marcava o local e começava a reparar o pneu furado.

Esse processo só funcionava se eu enchesse a câmara de ar com pressão interna suficiente. O “ponto de rachadura” nunca se revelava se eu não aplicasse a pressão certa. A pressão externa jamais exporá o “ponto de rachadura” de alguém. Gritar com ele, ameaçar cortá-lo em pedacinhos, persuadi-lo ou interrogá-lo nunca me ajudarão a encontrar o lugar que precisa de cura. Esse trabalho é realizado de dentro para fora.

O confronto é o processo de aplicar pressão na vida de outra pessoa, deliberadamente, para expor os pontos de rachadura. Precisamos encontrar esses pontos se quisermos transformar os ciclos de destruição nos quais as pessoas costumam viver. Não podemos tomar decisões diferentes e produzir um resultado diferente até que saibamos o que está errado.

Isaías 1:18 diz: “ Vinde, pois, e arrazoemos, diz o Senhor: ainda que os vossos ecados são como a escarlata...”. Embora os seus pecados estejam visivelmente por toda parte, Deus diz: “Podemos fazer alguma coisa a respeito”. Há esperança. E o que é mais importante, Deus diz: Vinde e arrazoemos. A emoção, a natureza e o desejo de Deus é que venhamos. Nesta palavra “arrazoemos”, o Senhor nos convida a olharmos juntos alguma coisa para corrigi-la. “Venha, vamos ver isto juntos para trazer correção. Você está vendo o que Eu vejo? Espero que sim, porque até que você veja, o que Eu digo não fará nenhum sentido para você. Se você não vir o que eu estou vendo, todo o Meu conselho não fará o menor sentido para você. Você vê o que Eu vejo? Você está Me ouvindo?”

Deus não precisa nos controlar, e Ele não tem medo do nosso “ponto de rachadura”. Ele sabe que a única maneira de realmente mudarmos é quando formos livres para mudar. Gerando Pressão Interna O poder do confronto vem de dentro para fora. Não é um trabalho de convencimento ou uma tática manipuladora para fazer com que alguém faça alguma coisa. Não pode ser! Ele precisa ser genuinamente motivado de dentro se esperamos que tenha efeito. Um erro comum que cometemos é levar alguém a dizer algo mágico do tipo: “Sinto muito”. Se você já tentou fazer com que dois irmãos consertassem algum problema que criaram um com o outro ordenando “Peça desculpas”, então você sabe que isso não funciona. Eles dirão o que for preciso para se livrarem do problema e seguirem em frente; você pode ver nos olhos deles e ouvir na voz deles que eles estão longe de se reconciliarem com esse exercício. As soluções para a mágoa e a ruptura em um relacionamento vêm do coração. Chegar ao coração exige um processo que gera pressão interna.

Há um exemplo brilhante no livro de Jó. Jó passou por um tempo difícil em sua vida. Seus amigos bem-intencionados foram até ele e fizeram o melhor que podiam para gerar pressão em Jó de fora para dentro. Cada amigo tinha um ponto de vista que foi transmitido a ele como um sermão. Suas suposições dolorosas quanto a qual poderia ser o problema só aumentavam a impotência e a dor do sofrimento de Jó. Embora seus amigos tivessem feito o melhor para ajudá-lo, eles só pioravam as coisas a cada diálogo.

Finalmente, no capítulo 38, o Senhor de todos apareceu. Se alguém tinha uma percepção profética ou uma palavra de conhecimento sobre qual era exatamente o problema, esse alguém era o próprio Deus. Com certeza, se alguém podia entender bem aquilo, seria o Deus Onisciente. Mas Aquele que sabe todas as coisas fez algo muito diferente:

Depois disto, o Senhor, do meio de um redemoinho, respondeu a Jó: “Quem é este que escurece os meus desígnios com palavras sem conhecimento? Cinge, pois, os lombos como homem, pois eu te perguntarei, e tu me farás saber”.[8]

Deus iniciou Sua intervenção na situação repreendendo a multidão de conjeturadores. “Quem é este que escurece os Meus desígnios com palavras sem conhecimento?” Na essência, Deus apareceu e disse: “Calem a boca! Todos vocês, fiquem quietos!” Em seguida, Ele usou o segredo da pressão interna: “ Eu te erguntarei, e tu Me farás saber”. Que gênio tremendo! O processo de fazer perguntas inteligentes dá início à máquina de combustão interna nos seres humanos.

É um processo que evita acionar as defesas naturais que empregamos contra as pessoas que pretendem nos controlar. As pessoas podem sentir a armadilha das perguntas que se destinam a controlá-las. A maioria de nós tem experiências com figuras de autoridade que querem que respondamos às perguntas delas “corretamente”. Esse processo de confronto causa medo e elimina o que pode acontecer quando as pessoas se sentem seguras.

As perguntas certas dão início à jornada interna que leva as pessoas a um encontro com a Verdade. Deus adverte Jó de que esse processo irá prová-lo ao máximo. “Cinge, pois, os lombos como homem!” Vindo do Rei da Glória, esse comentário faria qualquer um perder todo o controle sobre suas funções corpóreas. Mas esse é o processo do confronto segundo o modelo do Reino.

Minha esposa e eu fomos a um rodeio há algum tempo com alguns amigos. Conseguimos os melhores lugares da arena. É bom ter amigos ricos. Nós nos sentamos próximos à cabine do anunciante. Eu podia olhar por sobre o parapeito e ver os cavaleiros de touros logo ali abaixo de mim. Vi quando um daqueles caubóis estava se alongando. Ele colocou a perna na cerca como uma bailarina ou como um ginasta. Sua bota estava acima de sua cabeça. Foi então que percebi que aqueles sujeitos eram atletas. Acho que eu nunca havia pensado nisso. Eles estavam se preparando como homens. Porque você sabe o que estava prestes a acontecer. Ooa! Eles estavam prestes a entrar no redemoinho.

Deus disse: “Lá vamos nós! Prepare-se como um homem. Eu vou lhe fazer as perguntas e você vai me responder. Há coisas boas em você, Jó, e Eu vou chamar essas coisas para fora”. É assim que Deus lida com alguém a quem Ele ama. Esse é o tipo de confronto que causa libertação. Deus aplicou pressão, mas Ele fez isso com um espírito de brandura, no sentido de que, por intermédio das Suas perguntas, Ele transmitiu claramente a mensagem de que não precisava controlar ó. Ele protegeu a oportunidade para Jó descobrir o que realmente estava acontecendo dentro dele, convidando-o a envolver a sua vontade no processo.

Vemos Jesus demonstrar esse processo várias vezes. Ele perguntou a um homem que era obviamente tão cego que o seu primeiro nome era Cego — Cego Bartimeu: “O que queres que Eu te faça?” [9] E, é claro, o Cego Bartimeu respondeu: “Quero recuperar a minha visão!” Por que o Senhor fez uma pergunta tão óbvia? Ou por que, quando Ele se aproximou do homem coxo no Tanque de Betesda, que estava ali havia dezoito anos esperando o anjo agitar a água, Ele perguntou: “Queres ser curado?” [10] Por que o Homem cujo ministério de cura tinha uma taxa de sucesso de 100% parou e fez perguntas que aparentemente tinham respostas óbvias?

Aqui está o poder da pressão interna. Jesus sabia que aquele homem nascera para ser livre. Se não temos o poder para escolher, então nunca seremos responsáveis pela escolha. Deus joga segundo as Suas próprias regras e o Seu próprio projeto — Ele honra a maneira como nos fez. Na sua presença há liberdade, para pensar, decidir e sermos os donos das nossas vidas.

Jesus parou e fez àqueles homens essas perguntas, porque existe uma linha. Há uma linha de demarcação — ela marca onde a vida de alguém para e a de outro começa. Se acreditamos que podemos controlar os outros ou que devemos demonstrar o nosso grande amor, então não existe linha. Sua vida me pertence quando eu quero alguma coisa de você. Mas se eu quiser honrar a sua vida e o seu domínio próprio, então deve haver uma linha onde eu paro e você começa. A prática de limites saudáveis entre as pessoas é um tópico que foi bem discutido em outros livros, portanto não vou me aprofundar nele aqui. Mas quero enfatizar o lugar crucial dos limites para dar poder às pessoas durante um confronto.

As perguntas certas atendem a uma série de grandes benefícios em um confronto bem-sucedido, inclusive os objetivos que já discuti:

Elas estimulam o pensamento dentro do indivíduo que tem o problema. Elas permitem que a pessoa tenha uma oportunidade de elaborar a maior parte dos pensamentos sobre o problema de dentro para fora. Elas ajudam a pessoa a ter acesso à sua grandeza e demonstrá-la durante o confronto. Elas lembram à pessoa coisas que ela tende a esquecer sobre si mesma quando falha. Elas demonstram o relacionamento de aliança entre as duas partes. Elas permitem que a pessoa que faz o confronto continue sendo uma aliada. Quem É “Confrontável”? Em Gênesis 18 há uma história maravilhosa a respeito de dois amigos. É a história a respeito de Abraão e Deus. É um exemplo absolutamente impressionante para mim do fato de que Deus é uma pessoa real. Ele não é um espectro cósmico perfeito que não precisa de mim nem me tolera. Ele não é o “Chefão que está lá em cima” que se as coisas não saírem do Seu jeito alguém tem de morrer. Leia isto: Tendo-se levantado dali aqueles homens, olharam para Sodoma; e Abraão ia com eles, para os encaminhar. Disse o Senhor: “Ocultarei eu a Abraão o que estou para fazer, visto que Abraão certamente virá a ser uma grande e poderosa nação, e nele serão benditas todas as nações da terra?”[11]

Deus estava a caminho para destruir Sodoma. Mas primeiro Ele iria consultar o Seu amigo Abraão, que poderia ter algo a dizer sobre isso. Deus disse a ele que o clamor contra Sodoma era grande e que Ele precisava fazer alguma coisa a respeito. Abraão ficou perplexo! Qual foi a reação dele?

E aproximando-se a Ele, disse: “Destruirás o justo com o ímpio?” Abraão então continuou a fazer mais perguntas: “Se houver, porventura, cinquenta justos na cidade, destruirás ainda assim e não pouparás o lugar por amor dos cinquenta justos que nela se encontram? Longe de ti o fazeres tal coisa, matares o justo com o ímpio, como se o justo fosse igual ao ímpio; longe de ti. Não fará justiça o Juiz de toda a terra?”[12]

Deus ficou ali, sendo confrontado por Abraão, e respondeu: “É, você está certo. Eu pouparia a cidade por cinquenta justos”. Isso é profundo! Deus é confrontável! Isso é raro, porque a “liderança” que estamos acostumados a ver geralmente é inconfrontável. Classicamente, interpretamos confrontar a liderança como uma desonra.

Diante da reação de Deus, Abraão seguiu em frente. Como um leiloeiro, ele reduziu gradualmente o tamanho do grupo necessário para que Deus tivesse misericórdia da cidade: “Tudo bem, 40... 30... 20... 10?” Ele lançou algumas perguntas e esclareceu que não pretendia ser desrespeitoso ao longo do caminho. No fim, “Tendo cessado de falar a Abraão, retirou-se o Senhor, e Abraão voltou para o seu lugar”.[13]

Abraão confiava em Deus e Deus confiava em Abraão. Se o próprio Deus se abriu para ser confrontado por um homem, isso leva à pergunta: quem está acima de ser confrontado? Um ambiente seguro deve ser cheio de pessoas livres e poderosas, ou logo será um lugar inseguro controlado por aqueles que pensam que têm todo o poder. O Ingrediente-chave É a Confiança Se você sabe que eu o valorizo muito, então você pode me convidar a dar a minha opinião. Se você confia que eu tenho o seu melhor interesse no meu coração, então poderemos construir um relacionamento de aliança mais profundo por meio do confronto. Se você tiver a mínima desconfiança de que eu não o respeito ou o valorizo, você se protegerá contra a minha ajuda. O problema clássico da dinâmica pais/adolescentes é que, à medida que a criança se torna um jovem ou uma jovem, ele ou ela pode sentir o desrespeito que os pais têm por sua capacidade de pensar e de tomar decisões. Por sentir que não tem a confiança dos pais, ele ou ela resiste ao confronto.

A natureza do confronto é a verdade. O propósito de criar pressão externa é encontrar a verdade, e não obter uma confissão. As pessoas que não conseguem confiar não mostrarão a ninguém a verdade do que está se passando dentro delas. Elas se sentem mais seguras mantendo o “lugar de rachadura” escondido. É preciso um lugar seguro para expor uma área vulnerável, uma área que precisa de cura. Por esse motivo, importa menos que o confrontador acredite que tem grande autoridade e deve receber confiança e importa mais que aquele que está assustado acredite que é cuidado e protegido.

Na essência, o confronto é um exame. É um procedimento que confia em outra pessoa para olhar para alguma área da sua vida que você talvez não conheça ou não entenda. Ele é tanto vulnerável quanto necessário, se esperamos construir vidas saudáveis e viver em paz. Isso me lembra de quando fiz 40 anos. Foi naquele ano que fiz o meu primeiro verdadeiro exame físico. Minha médica me pediu para tirar a roupa e debruçar-me sobre a mesa. Eu sabia que isso iria acontecer; simplesmente não conseguia encontrar uma maneira de fingir que não seria realmente como eu havia ouvido falar. A luva de borracha e a vaselina na bandeja ao meu lado fizeram-me perceber isso. O procedimento seria invasivo! E foi, sem dúvida, uma invasão que ia e vinha. Eu mal conseguia olhar minha médica nos olhos. Um riso nervoso tomou conta de mim como se eu tentasse disfarçar meu incômodo. Eu disse: “Devo contar à minha esposa o que acaba de acontecer?”

Minha médica riu comigo, depois ela disse: “A sua próstata está lisa. Isso é bom. Eu o vejo daqui a um ano mais ou menos”.

O rei Davi falou sobre isso, deste modo:

Sonda-me, ó Deus, e conhece o meu coração, prova-me e conhece os meus pensamentos; vê se há em mim algum caminho mau e guia-me pelo caminho eterno.[14]

Jesus é o Grande Confrontador. Não é coincidência que Ele não tenha medo na presença dos erros das pessoas nem tenha medo de confrontar essas pessoas com uma invasão amorosa da verdade. Quer fossem os Seus discípulos, o jovem rico ou a mulher junto ao poço, Ele era capaz de ajudar as pessoas a identificarem o que estava se passando abaixo da superfície melhor do que qualquer um. E, ao mesmo tempo, as criancinhas iam correndo para Ele como um “lugar seguro”. As crianças identificam naturalmente as pessoas que se sentem seguras. Uma das chaves para o domínio de Jesus no confronto é que as Suas interações com as pessoas eram motivadas pela compaixão. Lembro-me de Bill Johnson dizendo: “Se confrontar outra pessoa não faz você sofrer, então provavelmente você está tendo a atitude errada”.

O confronto e a capacitação andam de mãos dadas em uma cultura de honra, e a misericórdia, a compaixão e a coragem são as qualidades necessárias para manter um fluxo saudável desses dois elementos em seu ambiente. O confronto bem-sucedido constrói relacionamentos e fortalece vínculos de aliança. Ele é uma arte construída sobre certas habilidades, mas o que é mais importante, é um estilo de vida que flui das suas convicções e valores essenciais. Quanto mais você estabelecer os objetivos do Céu para o confronto em seu pensamento, mais estará posicionado para liberar o Céu quando for preciso confrontar alguém.$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$O coração brando, diz Danny, é a convicção de que 'eu não preciso controlar você', e ele propõe um teste simples: o que acontece em você quando alguém não se deixa controlar — você se ira, sente desonra, procura justificar uma punição? Respondendo com sinceridade, o que esse teste revela sobre quanto você ainda acredita que pode e deve controlar as pessoas que lidera?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo distingue confrontar para punir de confrontar para restaurar, dizendo que o objetivo é trazer à tona a verdadeira identidade da pessoa e devolver-lhe o poder de reparar o próprio erro, nunca colaborar com a vergonha que sussurra 'você é um fracasso'. Lembrando do seu último confronto, você falou à grandeza daquela pessoa ou ao erro dela — e qual das duas você fez crescer?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Silk mostra que a pressão que cura vem de dentro para fora, pelo modelo de Deus com Jó e de Jesus com Bartimeu: perguntas certas, e não sermões, que convidam a pessoa a se envolver. Onde, no seu jeito de confrontar, você tem aplicado pressão externa (gritar, persuadir, interrogar) que nunca expõe o verdadeiro 'ponto de rachadura', em vez de fazer perguntas que despertam a verdade no coração do outro?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 8 — Revolução para reformar, reformar para transformar  (aula ordem = 10)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 10;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 8 — Revolução para reformar, reformar para transformar$t$,
      10,
$conteudo$Pois a terra se encherá do conhecimento da glória do Senhor, como as águas cobrem o mar. (Habacuque 2:14) H ouve um tempo na história das nossas nações em que era considerado normal e aceitável possuir outros seres humanos. Adotamos e passamos adiante uma visão e uma prática cultural de que a escravidão era “necessária” para o nosso comércio e famílias funcionarem. Escravizávamos, vendíamos, oprimíamos e puníamos as pessoas como animais porque isso era “normal”.

O aspecto mais difícil dessa tragédia é o fato de que ela era bíblica. Tanto o ntigo quanto o Novo Testamento aparentemente toleram e mostram a bênção de Deus sobre os proprietários de escravos. O apóstolo Paulo instruiu os escravos a se submeterem aos seus senhores.[1] Ele não deu sequer uma dica acerca disso ser uma enorme injustiça e uma ofensa ao paradigma do Céu. Jesus não instruiu os Seus discípulos dizendo “deixa o Meu povo ir” nem fez uma campanha contra a escravidão.

Ou será que fez? Ele introduziu o Seu ministério afirmando que fora ungido “para proclamar libertação aos cativos”.[2] Mais tarde, Ele comissionou todos os que quisessem segui-lo a imitarem o Seu exemplo. Isso deixa cada geração de crentes com a pergunta acerca de como fazer isso. Como podemos transgredir a nossa própria Bíblia e, principalmente as nossas tradições, para encontrar um lugar mais elevado de honra e liberdade para as pessoas? Geralmente, isso requer uma guerra. Como a história dos Estados Unidos comprova, às vezes é preciso uma guerra civil.

Harriet Beecher Stowe lutou contra essa questão em seu livro A Cabana do Pai Tomás. Ela disse:

Escrevi o que fiz porque, como mulher e mãe, eu ficava oprimida e de coração partido com as tristezas e a injustiça que via, porque como cristã eu sentia a desonra ao Cristianismo. E fiz isso porque, como alguém que ama o meu país, eu tremia diante do dia da ira que viria.[3]

Muitos historiadores consideram A Cabana do Pai Tomás uma influência significativa nos acontecimentos que levaram à Guerra Civil norte-americana, que resultou na abolição da escravidão nos Estados Unidos. Quando Abraham Lincoln finalmente encontrou-se com Harriet, ele lhe disse: “Então você é a pequena mulher que escreveu o livro que fez esta grande guerra!” [4] Mas o irmão de Stowe e seu companheiro abolicionista, Henry Ward Beecher, deu a outro homem o crédito pela destruição da escravidão. Quando perguntaram a Beecher após a Guerra Civil: “Quem aboliu a escravidão?” ele respondeu: “O Reverendo ohn Rankin e seus filhos fizeram isso”. [5]

John Rankin nasceu no Condado de Jefferson, no Tennessee, e foi criado em um lar rígido calvinista. Em 1800, o oitavo ano da vida de Rankin, sua visão do mundo e a sua fé religiosa foram profundamente afetadas por duas coisas: os avivamentos do Segundo Grande Despertamento que estava varrendo a região dos Apalaches, e a maior rebelião de escravos organizada (embora malsucedida) da história dos Estados Unidos até aquele momento, liderada por um homem escravizado, Gabriel Prosser, que foi executado com 27 de seus conspiradores. nn Hagedorn escreveu:

Para Rankin, os acontecimentos do seu oitavo ano ecoaram profundamente. Em sua memória, a história de um homem perdendo sua vida na busca pela liberdade sempre se misturaria com as muitas noites de manifestação nas florestas do Leste do Tennessee. Viria um tempo em que Rankin poderia olhar para trás e saber que as paixões do verão de 1800 inspiraram o seu próprio despertamento particular.[6]

Convencido como estava de que o impulso do Evangelho era erradicar a opressão do mundo, em particular a escravidão, Rankin lutou profundamente contra os trechos da Bíblia que pareciam admitir a escravidão — trechos das Escrituras que eram ensinados em muitos púlpitos dos seus dias. Finalmente, ele resolveu esse conflito determinando que o equilíbrio da Palavra ensinava que Deus nunca pretendeu que a humanidade fosse escravizada, e que era dever de todo homem e mulher justos buscar os mais elevados propósitos de Deus para a humanidade. Em um discurso para uma delegação de sociedades antiescravagistas, ele disse:

As Escrituras representam todos os homens como tendo nascido de um pai em comum — todos como “feitos de um sangue”... Por conseguinte, todos foram criados igualmente livres. Sejam quais forem os direitos que o primeiro homem tinha, todos os seus filhos devem ter. Deus não criou escravos. Ele deu a todos os homens os mesmos direitos originais... (...) Que a igreja universal, como o exército do Deus vivo, erga-se em ajuda ao Senhor contra os poderosos, que a sua voz seja ouvida como a voz de muitas águas, proclamando libertação aos cativos e abertura da prisão àqueles que estão presos. Que a igreja proclame que as fontes venenosas da morte serão secas, os rios de angústia deixarão de correr e a tristeza e os suspiros desaparecerão. A união nesta grande obra preparará a igreja para o nascimento da glória milenar, quando a liberdade será universal e o cântico do amor redentor subirá de cada língua.[7]

A paixão que nasceu no coração de Rankin quando menino finalmente o levou a enfrentar corajosamente perigos de toda espécie, desde multidões iradas que atiravam ovos podres e jornais caluniadores, até ataques físicos diretos a si, à sua família e à sua propriedade. Ele não apenas era destemido e impossível de ser detido ao pregar a mensagem de liberdade, mas também em vivê-la. Ele e sua família continuamente utilizavam seu tempo e recursos para ajudar escravos fugitivos a alcançarem a liberdade — sua casa e seu nome estavam entre os mais conhecidos na Estrada de Ferro Subterrânea — e para apoiar outros abolicionistas nos seus esforços para fazer o mesmo. Como testemunhou Henry Ward Beecher, que observou o heroísmo de Rankin em primeira mão, a mensagem e o exemplo desse único homem eram tão poderosos e tinham tão grande alcance, que o desmantelamento de todo um sistema de opressão, um sistema que muitos, até aqueles que o desprezavam, acreditavam ser impossível remover, foi creditado a ele.

A vida de John Rankin é evidência de que quando o Céu toca a terra com avivamento, ele produz algo dentro de uma pessoa: uma visão de como Deus criou o mundo para ser e um clamor para fazer parte da restauração de todas as coisas, até o dia em que “a liberdade será universal”. Encontrar o Deus vivo e receber uma revelação fresca do Seu coração nos dá uma maior fome pela liberdade em nossas próprias vidas e exige que “libertemos os cativos”. Esse apetite nos leva a ir além das normas culturais e nos alimenta com uma coragem sobrenatural para ignorar a perseguição contra nós daqueles que desejam manter as coisas como são. O avivamento desperta a vida nas pessoas para irem contra os limites da sociedade. Ele clama às partes mais profundas da humanidade e grita “Liberdade!” tão alto que o mesmo grito sai de nossas bocas. O avivamento desperta a revolução e a revolução promove a reforma.

É nesse contexto que estamos posicionados como um movimento em nossa geração. Vivemos os dias de surgimento de uma reforma. Não toleraremos mais o estado atual de uma existência governada externamente. Não aceitaremos mais ser treinados na impotência. Não viveremos mais como servos e escravos. A motivação religiosa da iminente ira de Deus e os ideais de uma vida pequena não são mais uma opção para nós. Somos filhos e filhas do Altíssimo. Estamos em treinamento para reinar como nunca. Agora, esperamos ser poderosos, vivendo uma vida abundante em Cristo até que os reinos desta terra se tornem o Reino do nosso Deus.

Tenho o privilégio de liderar a Escola Bethel de Transformação. Essa escola dá às pessoas um vislumbre por trás dos bastidores da cultura de liberdade que estamos construindo na Bethel Church. Desde que a iniciamos em 2005, tivemos mais de cem igrejas que fizeram esse treinamento de aventura de quatro dias e viram o que estamos fazendo aqui. Sem exceção, cada líder de cada escola perguntou: “Como vamos conseguir fazer isso em nossa igreja?” Quero dizer que, se você também está fazendo essa pergunta, você não está sozinho.

Quero compartilhar um testemunho a respeito de um homem, um bom amigo meu, que fez essa mesma pergunta. Steve Doerter, um pastor da Carolina do Norte, envolveu-se com a cultura da Bethel Church há dois anos. Ele começou a ouvir nossas mensagens e a vir a algumas conferências, levando os princípios que estava aprendendo para a sua congregação e para os seus demais líderes. Esses princípios representavam algumas mudanças significativas para aquelas pessoas. A igreja historicamente era batista, havia se tornado não denominacional e agora, sob a liderança de Steve, buscava mais liberdade e poder do que tinham tido até então. Entretanto, eles ainda não conheciam o que ele experimentara na Bethel Church, e assim, achavam muito difícil estar em sintonia com ele.

Ele se perguntava: Como vou fazer esta coisa avançar? Finalmente, ele decidiu compartilhar com seus líderes o que estava buscando levando-os à Conferência vançada para Líderes na Bethel Church. A Conferência Avançada para Líderes é uma conferência apenas para convidados, para aqueles líderes que têm relacionamento com outros líderes da nossa rede. É um tempo poderoso para todos os participantes.

Uma noite, na conferência, minha esposa Sheri e eu estávamos sentados à mesa de jantar com Steve, sua esposa Joyce e sua diretoria. Eles eram um grupo bastante amigável, mas obviamente não entendiam muito do que estava ocorrendo ao seu redor. Uma das coisas que acontecem na conferência é que os nossos alunos da Escola de Ministério Sobrenatural servem às mesas. Esses alunos estão constantemente “sob a influência” do Espírito Santo, e naquela noite em especial, os nossos garçons ficaram extremamente “embriagados”. Eles estavam felizes, extremamente felizes. Por fim, os líderes de Steve perguntaram:

— O que há de errado com essas pessoas?

Respondi:

— Eles apenas estão felizes, e estão embriagados.

— Eles estão embriagados? — eles perguntaram.

Então, eu expliquei:

— Veja, há um sujeito, o nome dele é Georgian Banov. Ele está lá em cima em outra sala de jantar orando pelas pessoas, e imagino que todos que estão lá em cima estão embriagados a esta altura. Vocês deveriam subir até lá e ver isso! Vocês devem ir dar uma olhada, chegar perto o bastante para ver isso.

Eles disseram:

— Bem, nós gostaríamos de fazer isso. Gostaríamos de ir ver o que é isto.

E lá foram eles.

O que soube depois disso foi que eles finalmente formaram o seu próprio conselho — seu próprio conselho de ex-anciãos batistas! Na vez seguinte em que vi aquelas pessoas distintas, o cabelo delas estava todo desgrenhado e um deles estava com a perna da calça enfiada dentro do sapato. Foi então que pude perceber que Steve estava ganhando ímpeto com a sua equipe de líderes.

Desde que sua equipe veio àquela conferência, houve diversos milagres significativos na igreja deles. Tumores cancerosos desapareceram no corpo de uma mulher. Milagres financeiros, curas interiores e libertações agora fazem parte das experiências do dia a dia dessa igreja. Mas um milagre chamou a minha atenção.

Havia um garotinho de três anos chamado Pablo que foi diagnosticado com um distúrbio de desenvolvimento incluído em dos aspectos do autismo. Ele era tão agitado que sua mãe não conseguia abraçá-lo, beijá-lo ou ser afetuosa com ele de modo algum. Ele se contorcia para sair dos braços dela ou dos de qualquer pessoa e fugia deles o mais rápido possível. Ele só conseguia dizer frases de uma palavra de cada vez. Ele era incapaz de dizer seu nome ou idade e não tinha qualquer conceito de cores ou formas. Ele era altamente sensível à textura da comida — a ponto de cuspir qualquer alimento que fosse introduzido e assim só comia uma textura de alimento de cada vez. Ninguém conseguia tirá-lo de casa, nem mesmo para ir ao shopping, por causa da cena que ele fazia. Quando ele ficava perturbado ou ansioso, começava a bater com a cabeça no chão ou na parede. Ele ignorava a presença das pessoas que o cercavam e ficava completamente aprisionado no seu próprio pequeno mundo particular. Ele nunca dormira uma noite inteira em sua vida; ele geralmente acordava às duas ou três da manhã e ficava em pé pelo restante da noite.

Você pode imaginar o quanto seus pais estavam esgotados depois de três anos de sono inconstante. Ele tinha um irmão que morria de medo dele. Uma grande divisão foi gerada naquela família por causa da condição do filho deles.

O pastor Steve levantou-se em uma manhã de domingo para entregar a mensagem. Ao chegar ao púlpito, o Senhor falou com ele “audivelmente” no púlpito. Então ele mudou a mensagem e chamou seu novo sermão de “Deus é Bom, e Eu o Recomendo Enfaticamente”. Ele começou a falar sobre a bondade de Deus, a fidelidade de Deus e o coração de Deus para com as pessoas. Não demorou muito e eles estavam contando testemunhos e ativando a fé das pessoas ali. Ao final da mensagem, eles começaram a orar pelos que queriam ter o que acabara de ser profetizado nos testemunhos. A mãe de Pablo se levantou em favor de seu filho e diversos líderes impuseram as mãos sobre ela. Eles começaram a ordenar a cura e a liberação de milagres, a liberação do Céu, na situação de sua família.

A mãe de Pablo creu nas orações e foi para casa, após o culto. Ela chegou tarde naquela noite e acordou de manhã, sem perceber que, pela primeira vez em três anos, todos haviam dormido a noite inteira! Ela acordou e pensou: Alguma coisa está mudando. Ela foi até seu filho e perguntou:

— Qual é o seu nome?

Ele respondeu:

—– Pablo.

Ela perguntou:

— Quantos anos você tem?

— Três.

As pessoas que ficaram com ele enquanto ela estava fora começaram a contar que mudanças como aquela aconteceram desde o dia anterior — os milagres começaram assim que ela recebeu oração. Meses depois, Pablo ainda está dormindo a noite inteira. Ele não bate mais com a cabeça em lugar nenhum. Ele agora diz o seu nome, sua idade e pode interagir em 80% das perguntas que alguém lhe faz. Os especialistas que trabalhavam com ele esperavam que ele só pudesse se comunicar com frases de uma palavra e por meio da linguagem de sinais. Ele agora está falando com frases completas. Ele sabe a diferença entre quatro cores e sabe os nomes das outras. Ele sabe a diferença entre um círculo e um quadrado e um paralelogramo. (Nem eu sei o que é um paralelogramo!) Ele consegue contar até 20. Ele está cantando canções. Ele está começando a brincar com outras crianças por curtos períodos. A mãe o levou ao McDonald’s para almoçar sem qualquer incidente. Eles podem segurá-lo, abraçá-lo e beijá-lo e ser afetuosos com ele.

A terapeuta que estava visitando a casa da família e trabalhando com Pablo chorou ao dizer à mãe o que estava testemunhando acontecer com ele. Ela não conseguia compreender aquela melhora drástica em apenas três curtas semanas. Mas o principal para essa mãe, o motivo pelo qual ela escreveu tudo isso, foi que a diretora da escola que Pablo frequenta foi encontrar-se com ela no seu carro um dia, chorando. Ela disse: “Isso foi nada mais nada menos que um milagre que aconteceu na nossa cidade”. Revolucionários Quero lhe mostrar por que o Céu está invadindo a terra. Uma revolução está acontecendo, e você é uma testemunha dela. Na verdade, se você chegou até este ponto neste livro, então muito provavelmente você é um participante dela. Você é um revolucionário! Seu envolvimento como revolucionário vai nos conduzir à nossa próxima grande reforma na igreja. Estamos no meio de uma grande transformação. O Céu está infiltrando o Corpo de Cristo e está ativando a paixão e os corações daqueles que passaram a esperar por mais.

Todos os anos em nossa Conferência Avançada para Líderes, perguntamos: “Quem está aqui pela primeira vez nesta Conferência?” Metade da sala levanta a mão. Ficamos perplexos todas as vezes. Como metade da sala é composta de novos participantes, sempre? A lista fica cada vez mais e mais longa, e a sala fica cada vez menor. Há um movimento se desenvolvendo, e cada vez mais e mais pessoas estão ouvindo acerca do Céu sendo derramado sobre a terra. Em todos os lugares onde os membros da nossa equipe ministram, as pessoas nos dizem: “O Céu está sendo derramado sobre a terra, e a nossa cidade está começando a ouvir sobre isso”.

Há algo poderoso acontecendo em todo o globo. De repente, não estamos mais nos sentindo tão únicos. Igrejas em todo o mundo estão experimentando as mesmas coisas que nós. Os testemunhos da invasão do Céu são cada vez mais e mais comuns. Mas a parte animadora é que essas histórias não estão vindo apenas da África, da Ásia e da América do Sul, mas também das igrejas locais de todos os Estados Unidos. Estamos começando a nos sentir como parte de um impulso, parte de um movimento, parte de uma transformação.

Antes que eu use a palavra “revolucionário” muito mais, deixe-me dar-lhe uma definição diretamente do dicionário:

Revolução: mudança impetuosa, penetrante e muitas vezes violenta de ordem social ou política, por um segmento de tamanho considerável da população de um país ( Encarta Encyclopedia).

Essa definição praticamente está pedindo para ser associada a Mateus 11:12: “... o Reino do céu sofre violência, e os homens violentos o tomam pela força ”. À medida que o Reino avança em avivamento, ele está gerando a destituição impetuosa de um governo na igreja, o desafio impetuoso de uma ordem social a qual muitos de nós temos sido confinados ao longo da nossa experiência na igreja. Há uma maneira de fazer as coisas que têm impedido o Céu de incendiar a terra. Mas um número crescente de pessoas de toda a terra disse: “Basta! Já estamos fartos disso!” E isso deu início a uma revolução. Iniciamos uma revolução que está levando a uma reforma, e uma reforma é simplesmente isto:

Reforma: 1. Melhorar (uma lei ou instituição) corrigindo os abusos (Farlex Dictionary).

As instituições se desenvolvem porque a maneira de fazer as coisas se torna tão confortável, tão previsível, tão rotineira, que não temos mais de pensar, não temos mais de nos arriscar e não temos mais de acreditar. Tudo se transforma simplesmente em uma questão de rotina, e assim vamos levando nossa vida cristã, porque essa é a forma que sempre fizemos as coisas. Uma reforma é algo que vem e pergunta: “Por que você está fazendo o que faz? Você percebe que o que está fazendo não está funcionando? Tudo que você estabeleceu em suas tradições precisa mudar. E agora, o que você vai fazer?” A resposta é que vamos ter de criar algo que nunca vimos antes. E quando a reforma se completa, ela gera transformação:

Transformação: Uma mudança completa ou dramática em forma ou aparência (Encyclopedia.com). Nossa transformação demonstra ao mundo algo totalmente novo, algo que ninguém nunca viu. Estamos vivendo em um tempo, em uma época e em um governo que nos permite mudar. Vivemos uma postura e um relacionamento com a nossa cidade que é completamente diferente do passado. Entretanto, preciso ser sincero acerca de um elemento necessário nessa transformação que pode ser uma quebra de confiança para muitas pessoas. É comum as pessoas dizerem: “Queremos mudar. Queremos que as coisas sejam diferentes. Fomos a uma conferência e as coisas agora vão ser diferentes. Compramos a série de vídeos e agora, companheiro, as coisas vão ser diferentes por aqui”. Entretanto, há uma peça que está faltando. As pessoas têm toda uma série de “vacas sagradas” no mundo delas que não querem se mover.

Alguém prendeu um folheto na porta da minha casa recentemente. Era de uma igreja da nossa vizinhança. Ele dizia: “Não Somos Como Todas as Outras Igrejas”. Eu o abri porque esperava que fosse verdade. Na frente do folheto havia uma foto do pastor e de sua esposa, o “Sr. e Sra. Ed Jones”. Abaixo dessa foto havia fotos de outros casais, “Sr. e Sra. Tom Smith, Sr. e Sra. Ozzie Wald, Sr. e Sra. Harry Chin, Sr. e Sra. etc...” Quando li isso, pensei: Há duas pessoas em cada uma dessas fotos, e apenas um nome. Para onde foi ela? Ela desapareceu. Sabe de uma coisa? Isto não é diferente coisa nenhuma. Na verdade, é a mesma velha bobagem. Quanto mais uma mulher se aproxima dessa igreja, mais ela desaparece. Este é um lugar assustador para uma mulher.

A igreja é uma das últimas instituições da nossa sociedade que praticam o sexismo livremente e “biblicamente”. Por algum motivo, ainda é tolerado desonrar e retirar o poder das nossas mulheres. O folheto era uma mentira. quela igreja não era diferente da maioria das igrejas. Puxa! Dizer que tudo é diferente é muito fácil: “Não estamos fazendo as coisas como todas as outras igrejas, como nossos avós faziam”. É, mas parece a mesma coisa e a sensação é a mesma. A mesma ansiedade e controle ainda estão lá. E acabamos soando como um desses políticos tolos, daqueles que vão trazer “mudanças” e imediatamente instituem “a mesma coisa”! Os revolucionários sabem que a transformação vem quando finalmente estamos dispostos a fazer um “churrasco com as vacas sagradas”. Mudanças de Governo No capítulo 2, apresentei algumas das mudanças de governo que são necessárias para que o Céu flua para a terra. A transformação teve sucesso na Bethel Church quando colocamos em prática este novo conjunto de valores e paradigmas essenciais. O governo que está tipicamente instituído nas nossas igrejas e tem estado ali por séculos é aquele a que me referi como governo pastoral, cuja diretriz é pastoral, com os seguintes personagens no leme: pastores, administradores, mestres, e até evangelistas. Mais uma vez, os problemas começam nas prioridades desse governo:

Governo Atual/Prioridades Atuais: Pastores – Pessoas Administradores – Coisas Mestres – Doutrina Evangelistas – Mensagem da Salvação

A primeira prioridade em um governo pastoral são as pessoas. Qual é o nível de segurança, de conforto e de felicidade das pessoas no ambiente da nossa igreja? Precisamos saber isso, porque sabemos que essas pessoas têm escolhas, e se não estiverem felizes neste ambiente, elas irão para outro. Podemos fingir que não nos importamos, mas esse sistema de governo se importa com os “traseiros nos assentos”.

A prioridade seguinte são as nossas coisas. Em um governo pastoral, há muitos ensinos sobre mordomia e acerca de cuidar do nosso dinheiro, da nossa vaga de estacionamento, do nosso prédio e das nossas coisas. Essas são as forças motrizes desse modo de “fazer igreja”.

A próxima prioridade, a doutrina, nos leva a focar no certo e no errado, na verdade e no erro. Essa atitude diz: “O que é certo ou verdadeiro é tudo que ensinamos, e o que é errado é ensinado por todos os outros na cidade que discordam de nós”. Acabamos querendo ensinar às pessoas a se defenderem contra outros cristãos, a defenderem suas vidas como crentes e a defenderem sua escolha de igreja e sua participação nessa igreja em particular.

O Evangelho da salvação é a última prioridade. Levar as pessoas a serem salvas é geralmente a única atividade sobrenatural no ambiente pastoral. Mas sem a presença do sobrenatural, acabamos ensinando aos convertidos: “Você era um pecador, você fez uma oração, e agora a graça de Deus foi aplicada à sua vida. Seus pecados foram perdoados, mas você ainda é um pecador e estamos de olho em você”.

Os valores essenciais desse ambiente fluem da unção e da estrutura de sua liderança. Por exemplo, eis um valor essencial que tem sido propagado liberalmente entre as congregações da nossa nação: “Deus está sempre certo, portanto seja como Ele. Seja uma das pessoas mais difíceis do planeta de se lidar. Nós lhe ensinamos a verdade, e não ouse considerar nada a não ser o que lhe ensinamos porque você pode ser enganado. Alguém pode lhe apresentar a ideia de que o sobrenatural faz parte do Reino do Céu. O ‘sobrenatural’ é sempre suspeito e é cheio de enganos. Só o diabo tem poder sobrenatural na terra”.

Esses valores essenciais criam um ambiente centralizado nas coisas que podem ser provadas e controladas. Esse tipo de ambiente se infiltrou nas igrejas em toda a terra, e estou certo de que todos vocês que estão lendo um livro como este desejam dar um tempo nesse modo de fazer as coisas. Se você se encontra em um governo pastoral, você terá alguns problemas ao querer introduzir valores essenciais contrários a esse ambiente.

Essas prioridades que mencionei não são más, assim como a infância não é má. Elas fazem parte de um Cristianismo inferior, por assim dizer. Mas um sistema que efetivamente impede os crentes de crescer produz sintomas de desordem. As pessoas não crescem como Deus planejou em um ambiente pastoral porque, no fundo, o governo pastoral define seu povo como pecadores desenvolvendo a sua salvação. Isso significa que não somos confiáveis e que somos essencialmente servos esperando por novas instruções. Nossas vidas são definidas por uma lista divina de “tarefas a realizar”. Por mais difícil que isso possa ser, algumas vacas sagradas precisam ir para a “grelha”.

É assustador dizer que a doutrina não é a parte mais importante do nosso relacionamento com Deus. E sugerir que a mensagem da salvação não é primordial pode parecer heresia. Mas até que estejamos dispostos a reorganizar o nosso pensamento, a sermos renovados na nossa mente, o ontem determinará o nosso amanhã.

Precisamos ter permissão no ambiente das nossas igrejas para desafiar as vacas sagradas dos nossos dias, como Jesus o fez. Lembre-se de que Jesus veio e confrontou os judeus, o povo do Seu tempo que sabia mais sobre Deus do que ninguém. Ele repreendeu o caso de amor que eles tinham com sua própria interpretação de Seu Reino. Infelizmente, a maioria deles recusou o convite dele para o churrasco das vacas sagradas, e não deveríamos ficar surpresos se algo semelhante acontecer quando começarmos a fazer o mesmo em nossa geração. Mais uma vez, uma das principais coisas que precisamos confrontar é a questão da ordem na Casa de Deus, e fazemos isso com a Bíblia:

E a uns pôs Deus na igreja, primeiramente apóstolos, em segundo lugar profetas, em terceiro mestres, depois milagres, depois dons de curar, socorros, governos, variedades de línguas.[8]

Não entendo como isso foi ignorado por tantos anos na nossa abordagem do governo da igreja de Deus. Não vejo como Paulo poderia ter deixado isso mais claro do que “primeiramente... depois... depois”. Para onde isso foi?

Como um ambiente pastoral se tornou o nível supremo da igreja? O “pastor” nem mesmo está na lista. Ele não é sequer o quarto item. Assim, todas as nossas vacas precisam morrer, principalmente aquelas que estão passeando diante dos nossos olhos, ou o que é pior, aquelas que estão na nossa sala de jantar.

Lembro-me de ter assistido a um programa sobre leões no Discovery Channel, certa noite. Ele mostrava dois leões lutando em um campo, um leão velho e um leão jovem. O leão jovem venceu o velho e ganhou o primeiro lugar como líder. Foi triste ver o antigo líder do bando ir embora mancando ao pôrdo-sol do Serengueti. Ele estava desgastado pelas batalhas de anos defendendo sua posição, com a face coberta de cicatrizes. O que aconteceu em seguida foi, creio eu, tanto interessante quanto bárbaro. A primeira coisa que o leão jovem fez como novo governante do bando foi atacar e matar todos os filhotes do velho leão. Foi chocante ver aquele animal enorme quebrando os pescoços da descendência do antigo líder. Esse ato fez com que todas as fêmeas entrassem no cio para que o novo líder pudesse gerar uma linhagem inteiramente nova — uma linhagem que carregaria o seu DNA.

Eu vi Bill Johnson fazer isso. Fique comigo por apenas um minuto. Quando Bill chegou à Bethel Church, a Bethel tinha um governo pastoral, dirigido por um evangelista. Quando Bill foi convidado para uma entrevista para a posição de líder sênior, a comissão de presbíteros disse: “Achamos que você é o cara”.

Ele disse: “Só virei para cá se esta comissão estiver 100% de acordo que eu venha”.

Eles ficaram perplexos. “Nunca tivemos um voto unânime desta natureza”, eles lhe disseram.

Ele disse que não viria a não ser que o voto fosse unânime. Esta foi a primeira de muitas mudanças que ele exigiria desse governo. Eles o chamaram de volta e disseram: “Ei, é um milagre. Pela primeira vez, um voto unânime!” Naquela época, a igreja tinha duas mil pessoas. Nos dois anos seguintes, Bill a fez decair para cerca de mil pessoas. Enquanto isso, o governo pastoral, que existira por cerca de cinquenta anos, agonizava: “Aaaahhhhhhh!” Havia um novo xerife na cidade e um novo governo estava sendo estabelecido. O resultado foi que as prioridades iam mudar. Aqueles presbíteros merecem tanto crédito quanto Bill por uma transformação de sucesso. Eles seguraram as pontas durante a revolução e todas as baixas da guerra. Eles venceram durante a reforma de como as coisas seriam feitas por aqui. Vivemos hoje nessa transformação.

O novo governo que Bill introduziu estava alinhado com o que Paulo estabeleceu: “primeiramente apóstolos, em segundo lugar profetas, em terceiro mestres...” e por meio disso introduziu um novo conjunto de prioridades no ambiente da Bethel Church:

Novo Governo/Novas Prioridades: Apóstolos – Céu Profetas – Mundo Espiritual Mestres – Expressar o Reino Operadores de Milagres – Atividade Sobrenatural dos Crentes

Nesse governo, as prioridades têm a ver com o Céu, com a presença de Deus e com o projeto do Céu sendo reproduzido na terra. Há um novo valor essencial para a atividade do mundo espiritual, para que os santos tenham os olhos e os ouvidos abertos pelo profeta, para ouvir a batida do coração do Céu e terem consciência da atividade do terceiro Céu, o que invalida as estratégias do diabo. Sinais, maravilhas e milagres levam as pessoas a ter encontros com Deus que mudam radicalmente a maneira como a vida é vivida aqui na terra. Não é mais um ambiente de medo e reação, mas um lugar para se estabelecer de forma proativa a arquitetura e o projeto do Céu na terra — para fazer da oração “Venha o Teu Reino, seja feita a Tua vontade, assim na terra como no Céu” uma realidade na vida dos crentes e da comunidade que os cerca.

Mais uma vez, o papel do mestre nesse novo governo não é mais o de querer construir uma rede defensiva para os crentes contra outros crentes, ou até para os crentes contra as seitas. A função do mestre é ajudar as pessoas a verem na Bíblia o Céu e um Deus sobrenatural em operação na terra. Eles dão às pessoas um contexto bíblico para entender os apóstolos e profetas e seus valores essenciais. Eles nos ensinam que esses líderes projetam um lugar onde o Céu continua sendo a prioridade, onde qualquer coisa pode acontecer, e acontece. Se as pessoas não entenderem o que está acontecendo, elas terão medo e procurarão um lugar onde estejam novamente no comando. Os mestres ajudarão a trazer esse entendimento e a reduzir a ansiedade do povo de Deus que pode impedir que eles entrem na experiência de tudo o que está disponível na Sua presença.

Não irei rever o papel dos pastores em um ambiente apostólico, mas quero dar atenção ao papel seguinte que Paulo menciona nessa lista em particular: os operadores de milagres. Creio que “operadores de milagres” é outra descrição para o papel do evangelista em um governo apostólico. Creio que perdemos a conexão entre esses dois papéis porque, sem a liderança dos apóstolos e profetas, os operadores de milagres geralmente não conseguem atuar nos seus papéis. Mas em um ambiente apostólico, os apóstolos e profetas atraem o sobrenatural para o ambiente, e os operadores de milagres começam a apertar todos os botões para ver o que pode acontecer. Eles trazem a prioridade da atividade sobrenatural para as vidas práticas diárias dos crentes, assim como para as vidas de todos os da sua comunidade, juntamente com um alto valor pela proteção dessa atividade. Eles produzem uma difusão da disposição de se correr riscos e de viver na dimensão do impossível.

À medida que o odre novo da liderança apostólica for estabelecido, uma nova onda de evangelismo será liberada por intermédio dos operadores de milagres. Durante o século passado, a igreja enfatizou a prática do evangelismo. Pessoas como D. L. Moody, William Booth e Charles Finney ensinaram a igreja a “ganhar pessoas para Cristo”. Essa experiência trouxe muitos para o Reino — muitos crentes mencionam isso quando dão o seu testemunho da salvação. Também é algo que a maioria dos cristãos modernos é treinada para fazer em suas congregações locais.

Mas os operadores de milagres estão trazendo uma nova prática de evangelismo para o ambiente da igreja. Esses radicais da fé estão liberando “encontros com Deus” em todo lugar aonde vão, seja no local de trabalho, seja nas esquinas das ruas, no supermercado, no restaurante ou no shopping. Curas, milagres, palavras de conhecimento, ministério profético, e revelação celestial estão levando as pessoas a Jesus em rebanhos. No lugar de onde venho, chamamos essas pessoas de “caçadores de tesouros”.

Esse ministério revolucionário chamado “caçadores de tesouros” está varrendo o globo. Kevin Dedmon, autor de The Ultimate Treasure Hunt (A Caça ao Tesouro por Excelência), treinou milhares de pessoas para fazerem essa obra sobrenatural. Resumindo, funciona assim: eles oram juntos e recebem uma “lista dos tesouros” do Céu. Essa lista tem coisas como nomes, lugares, cores de roupas, dor em áreas específicas do corpo, doenças, situações nas vidas das pessoas, gênero e todo tipo de outras “pistas”. A equipe então sai pela comunidade para encontrar o seu “tesouro”. Assim que um “caçador de tesouros” localiza alguém que está na lista, ele se aproxima da pessoa e lhe mostra que ela está na “lista dos tesouros”. Nesse momento, o “caçador de tesouros” pergunta se há algo pelo qual ele possa orar pela pessoa. Todas as vezes que isso acontece, o Céu abala essas pessoas. Deus se manifesta com poder! Sinais, maravilhas e milagres são o testemunho progressivo da caça ao tesouro.

Nossa comunidade chegou a um ponto em que as pessoas estão na expectativa de um encontro com Deus. Uma equipe de líderes de outra comunidade veio à Escola de Transformação Bethel e acabou fazendo uma caça ao tesouro na nossa cidade com um de nossos alunos do segundo ano da Escola de Ministério Sobrenatural. Enquanto estavam em uma loja de departamentos popular da cidade, eles abordaram um homem que se encaixava em um dos itens da “lista do tesouro”. Quando eles lhe disseram que ele estava na lista e que, portanto, era um dos tesouros de Deus, ele exclamou: “Ouvi falar sobre isso. Eu sempre quis ser o tesouro que vocês encontrariam!”

O homem recebeu com entusiasmo o que Deus tinha para ele e a equipe seguiu em frente até o tesouro seguinte. Não houve discussões sobre teologia, nem ameaças de morrer e ir para o inferno. Esse encontro foi simplesmente um lembrete simples e poderoso de que Deus está vivo e ama aquele homem. Embora muitas pessoas entreguem seus corações a Jesus nesses encontros, esse não é o objetivo principal. A prioridade é que os crentes sejam canais na terra para que o Céu aconteça. Estamos criando oportunidades para que os projetos do Céu sejam expressos. Transformando as Cidades com a Honra Outra prioridade de uma missão apostólica é deixar o Reino transbordar sobre a comunidade, em vez de fazer a comunidade vir para a igreja. Essa prioridade é motivada pela honra e por uma mentalidade próspera, que nos leva a procurar maneiras de beneficiar aqueles que nos cercam.

É impressionante observar o que pode acontecer quando você tem mil alunos invadindo a nossa comunidade todas as semanas fazendo evangelismo e caça ao tesouro. Mas quero lhe falar sobre um amigo meu que está vendo o projeto se desenvolver em sua cidade no México. O nome dele é Angel Nava. Ele e sua esposa Esther lideram uma igreja e uma escola de ministério sobrenatural na parte sul de Baja California, em uma cidade chamada La Paz. Em 2003, eles encontraram outro casal que virou o mundo cristão que eles conheciam tão bem de cabeça para baixo.

Denny e Danette Taylor foram enviados da Bethel Church para iniciar uma escola de ministério sobrenatural em La Paz. A primeira tarefa deles era encontrar as pessoas que Deus estava convidando para se tornarem os catalisadores do avivamento na sua cidade, abraçando e reproduzindo o que experimentamos em Redding. Por meio de uma série de acontecimentos, eles conheceram Angel e Esther Nava. Os anos seguintes se tornaram um testemunho de como a cultura da honra transforma uma cidade.

Lembro-me da transformação absoluta que aconteceu primeiramente na vida desse casal, que estava pastoreando uma boa e tranquila igreja por alguns anos antes de conhecer os Taylors. Quando viu pela primeira vez o poder de Deus em operação em uma reunião com Bill Johnson e Kris Vallotton, Esther soube que havia descoberto o motivo pelo qual estava viva. Angel, no entanto, tinha medo das manifestações sobrenaturais e não queria nada com elas. Mas o Senhor lentamente o levou a um estado de curiosidade e finalmente a uma condição em que ele reconheceu que o Céu estava invadindo sua cidade.

Entretanto, com esse reconhecimento veio também a percepção de que se ele voltasse seu coração para o avivamento, isso lhe custaria tudo. Primeiramente, ele perderia seu relacionamento com a sua liderança; os que supervisionavam sua igreja com base em um paradigma pastoral se retirariam de sua vida se ele se voltasse para o sobrenatural. Ele também sabia que diversos dos seus amigos pastores mais chegados sairiam simultaneamente. Ainda assim, ele e Esther se propuseram a fazer tudo que fosse necessário para receber Deus e o Céu em La Paz.

O primeiro passo foi começar a apoiar os esforços de Denny e Danette para levar uma escola de ministério sobrenatural para a cidade. Ao fazer isso, eles imediatamente começaram a ver curas e milagres. No primeiro ano da escola, eles viram uma mulher ressuscitar dos mortos. Por mais novo e empolgante que isso fosse na vida e no ministério deles, o coração de Angel estava voltado para ver sua cidade transformada. Ele devorava todo o material que conseguia com os professores da Bethel. Ele queria entender melhor o que era necessário para que o Céu fosse bem-vindo no México. Ele começou a perceber que Deus eram bemhumorado e queria que as pessoas conhecessem o Seu amor. Ele também acreditou que sua grande cidade poderia experimentar Deus de forma mais eficaz se ele ajudasse Jesus a sair da igreja e entrar na cidade.

Mas como ele poderia fazer isso? Tudo o que conhecera até aquele momento era como ir para a cidade e trazer as pessoas para a igreja. Mas onde ele colocaria um quarto de milhão de pessoas? Ele precisava mudar sua estratégia. Angel precisava encontrar uma maneira de ser o “fermento na massa” de La Paz.

O México não tem um sistema de doação de sangue eficaz. Eles têm um funcionário do governo, que é responsável por receber doações, mas ninguém doa. É habitual entre os cidadãos mexicanos ter de encontrar seus próprios doadores se precisarem de uma cirurgia. Angel teve uma ideia. Ele foi ao departamento de doação de sangue local e falou com o novo diretor sobre como estavam indo as coisas ali. Ciente de que as coisas avançavam lentamente, Angel fez algumas perguntas acerca de como a doação de sangue funcionava em La Paz. Na semana seguinte, ele compartilhou com sua congregação a nova estratégia de transformação da cidade: “Vamos nos tornar os maiores doadores de sangue da nossa cidade. Sigam-me”.

Angel tornou-se o líder da doação de sangue em sua cidade. Os membros da congregação atualmente doam sangue três vezes ao ano. Conhecendo a natureza competitiva das igrejas, Angel convidou outras igrejas e pastores para fazer parte da doação de sangue. Atualmente, diversas igrejas competem para ser as que doam mais sangue todos os anos. O resultado foi que La Paz agora é líder no Estado em doação de sangue, e o novo diretor do banco de sangue recebeu um prêmio do governo pelo aumento nas doações. Angel fez com que aquele oficial do Estado parecesse um gênio. O resultado foi que aquele homem quer que ngel tenha êxito.

Foi divertido para Angel apresentar à sua comunidade de crentes um paradigma de prosperidade no qual eles se tornaram os benfeitores da cidade, servindo a ela de uma maneira que doa vida. Mas ele queria levar isso a outro nível. Ele e Esther começaram a fazer trabalhos assistenciais em algumas das aldeias indígenas no continente. Eles ensinaram seu povo a servir aos pobres e a amar aqueles que nunca poderiam fazer nada para retribuir o favor.

Entretanto, a igreja deles não é como uma igreja norte-americana. Lá os recursos materiais são escassos e as pessoas vivem uma vida modesta. Angel ensinou seu povo a dar e a servir de maneiras que pareciam impossíveis à mente natural. Eles agora estão levando o povo a novas alturas em amor, serviço e sacrifício. Eles estão exportando milagres, cura e generosidade para os Estados que os cercam.

Permanecendo fiel a esse modelo, Angel teve outra “ideia de Deus” de causar impacto em sua cidade. Seus filhos frequentam uma escola particular católica em La Paz. Essa escola particular possui um orfanato associado a ela, e o padre da escola também está envolvido com esse orfanato. As conversas de Angel com o padre o informaram sobre algumas das necessidades dos órfãos; ele soube que uma das maiores necessidades deles eram sapatos novos.

Ora, os protestantes e católicos mexicanos são como cão e gato. Eles não convivem bem. Não há comunhão uns com os outros e parecem não valorizar muito uns aos outros. Os protestantes antagonizam os católicos e têm inúmeras justificativas para desprezá-los. Há uma separação intensa entre esses dois campos. Mas quando Angel compartilhou com sua congregação que o orfanato católico precisava de sapatos, a igreja decidiu comprar pares suficientes de sapatos novos para todos os órfãos — 70 pares. Eles não compraram sapatos baratos. Ao contrário, compraram Nikes. O proprietário de uma loja de sapatos local, que era crente, descobriu o gesto deles e disse que queria entrar nesse negócio. Ele concordou em vender os sapatos para a igreja a preço de custo.

A igreja de Angel ficou tão empolgada em abençoar os órfãos católicos que levou isso ao nível seguinte. Eles convidaram as crianças para irem à sua igreja um domingo de manhã para que pudessem apresentar os presentes como família. O padre e as crianças não sabiam o que a igreja de Angel pretendia, mas inesperadamente o padre concordou em levar todas as suas crianças para a igreja protestante Semente de Vida em um domingo de manhã. Isso nunca acontecera na história do México!

No culto, a igreja levou as coisas a um nível ainda maior de extravagância. Eles queriam que aquelas crianças sentissem a honra e o amor que Deus tem por elas. Famílias que Angel e Esther sabiam que não podiam comprar bicicletas para os próprios filhos estavam se reunindo para levantar recursos para dar uma bicicleta de presente para o orfanato. Eles alinharam cadeiras na frente da igreja e fizeram as crianças se sentarem e lavaram os pés das crianças e depois lhes presentearam com os novos sapatos. Então, as crianças da igreja de Angel ficaram atrás de seus convidados e profetizaram sobre eles. Lágrimas correram dos olhos de todos na sala. Angel então convidou o padre para sentar-se em uma cadeira. Ele lavou os pés do padre diante do povo. O padre não conseguia acreditar no que ele e suas crianças estavam vivendo. Nenhum deles jamais seria o mesmo.

A escola de ministério em La Paz continua a crescer e a igreja continua a construir novas estruturas para expandir sua capacidade. Eles estão formando equipes de cura, equipes proféticas, operadores de milagres, e estão ensinando o povo sobre o Céu e o sobrenatural. Os alunos começaram a ministrar o sobrenatural à congregação. Não há volta! Tudo isso está se tornando rapidamente a vida cristã normal para eles. A assistência aos necessitados na cidade está fluindo, e os milagres estão acontecendo nos ambientes da vida diária como escolas, lojas e calçadas. O Céu está invadindo a vida diária de La Paz.

Angel e Esther continuam a crescer em sua própria fé e caráter. Eles estão aprendendo sobre o amor e a intimidade um pelo outro e por sua família. Estão aprendendo sobre cultivar a liberdade e a honra como líderes. Eles lideram a criação de um lugar seguro para as pessoas que até então acreditavam que a vida se resume a sobreviver. Eles estão desafiando uma cultura empobrecida a extrair os recursos ilimitados do Céu. Eles estão transmitindo poder aos impotentes, esperança aos desesperados e liberdade aos cativos. A transformação em que eles estão vivendo agora está se tornando uma realidade transformadora para os que os cercam. Eles são catalisadores do Céu.

Mais recentemente, Angel e Esther levaram a reconciliação entre protestantes e católicos a um nível histórico. Em outubro de 2008, recebi este e-mail de ngel:

Apenas uma breve nota para compartilhar como a reunião da noite passada foi um sucesso. Cerca de três mil pessoas se reuniram na praça do governo em La Paz, a maioria delas pessoas católicas, mas muitos crentes também. Todos nós nos reunimos para orar pelo México no primeiro evento desse tipo. Nunca havíamos tido católicos e crentes orando juntos em nosso país. Ao final do evento, ergui minha voz para pedir perdão aos católicos porque havíamos construído muralhas em vez de pontes. Uma grande ovação foi ouvida quando abracei o bispo. Mas foi ainda mais poderoso ver crentes e católicos se abraçando e expressando perdão e reconciliação.

Um dos momentos mais poderosos para mim foi no final da reunião, quando minha esposa Esther e eu estávamos descendo da plataforma, e encontrei uma multidão de pessoas esperando por mim para me abraçar e agradecer... Todas elas eram católicas.

Sei que este é um novo dia... E coisas novas estão prestes a acontecer aqui.

O avivamento está aqui. Estamos fazendo história.

Semanas depois dessa reunião de oração sem precedentes, o padre local informou a Angel que o seu bispo estava doente e internado no hospital. Ele sabia que o ministério de Angel testemunha muitas pessoas curadas. Ele pediu a ngel para visitar o bispo no hospital e liberar o poder de cura de Deus sobre ele. ngel ficou honrado e encorajado com essa demonstração de confiança e favor. Ele está em contato regular e tem um relacionamento com o bispo agora, e eles são bons amigos. Um novo entusiasmo está no ar acerca da cura e da parceria entre protestantes e católicos na cidade deles.

Mas a mudança não vem sem um preço. Enquanto eu visitava os Navas no mês seguinte, Angel recebeu uma ligação de um grupo de pastores protestantes contrários a essa associação com os católicos. O líder do grupo disse que ele e outros estariam indo a La Paz na semana seguinte e queriam encontrar com ele para discutir a sua recente “reunião de oração” com os católicos. Aquele líder deixou claro que eles não estavam felizes com o que ele havia feito. Na verdade, eles estavam indo para fazê-lo arrepender-se do seu erro.

O pedido público de desculpas de Angel aos católicos foi a parte mais humilhante e preocupante — eles queriam que ele retirasse seus comentários e pedisse desculpas a eles imediatamente. Seus próprios amigos, seus irmãos em Cristo, estavam irritados por ele levar cura à sua comunidade. Esse seria um confronto e um teste de sua honra uns pelos outros. Depois do meu retorno de La Paz, recebi este e-mail de meu amigo Angel:

Na quinta-feira, encontrei-me com os pastores [locais], como eu lhe disse que faria. Foi muito bom. Eles vieram com um humor e um espírito muito bom. Eles apresentaram os pontos com os quais não concordavam. O problema é a maneira como eles retratam Deus e a igreja. A mentalidade religiosa não permite que eles vejam Deus se movendo além das “nossas igrejas”. Confrontei a mentalidade deles e eles não tiveram respostas para as minhas perguntas. Tivemos uma reviravolta na situação, principalmente porque, independentemente das nossas diferenças, no fim da reunião o relacionamento entre eles e nós foi fortalecido.

Eles conseguiram preservar seus relacionamentos, mesmo diante das divergências. Este pode ser o milagre seguinte que veremos em La Paz: líderes cristãos que discordam e continuam honrando e amando uns aos outros. A transformação se manifesta em uma região quando os líderes podem revelar as prioridades do Céu, o que leva as pessoas a fazerem o mesmo. Angel e Esther estão levando uma cidade inteira a um período de transformação. Eles estão deixando uma impressão e um impacto poderosos sobre os funcionários municipais, os proprietários de empresas, os cidadãos locais e os líderes de outras igrejas. Agora estão somando forças com o prefeito, o governador do Estado e a polícia. Sim, o alvo seguinte de Angel é a polícia do México. Jesus! Construindo uma Estrutura de Honra queles de nós que experimentamos o atual avivamento sabemos sobre os milagres que estão acontecendo. Nós os vemos crescer todos os dias em todo o mundo. Agora, precisamos construir uma estrutura para transformar nossas comunidades, nossas cidades e nossas nações. O avivamento global não terá um impacto duradouro se não virmos os valores essenciais do Céu surgirem nos governos das nossas nações.

Não quero dizer que simplesmente vamos eleger pessoas que dizem que são crentes e frequentam a igreja. Quero dizer que precisamos construir um paradigma que convide uma nação a ser salva em um dia. Costumamos colocar no governo aqueles que protegerão o que é importante para nós. Elegemos líderes em nossa nação que protegerão a nossa economia, a nossa segurança e os nossos direitos. O ingrediente-chave que está faltando é um governo que proteja as prioridades do Céu e a presença de Deus na nossa terra.

Às vezes, gostamos de acreditar que estamos fazendo isso nas nossas igrejas, exceto por uma realidade evidente: a presença e o poder de Deus estão ausentes em muitas das nossas igrejas. Portanto, estamos simplesmente criando governos eclesiásticos que protegem as nossas preciosas tradições e teologias. O sobrenatural não está em lugar algum na maioria das grandes denominações cristãs da nossa terra. Os incrédulos teriam de ser tolos para entrar em parceria com a igreja e correr o risco de tornar todo o país tão limitado quanto a maioria das igrejas é!

A cultura da honra não se limita a dar aos líderes da igreja mais controle. Espero que eu tenha deixado claro que ela se resume em se livrar do controle e em cultivar o domínio próprio e a liberdade. A igreja deve estar na liderança para trazer mais liberdade à terra. O Céu está pedindo para invadir a prisão que encarcera tantas pessoas, seja a depressão, seja a dor, a doença ou o medo. Nosso papel é eliminar essas coisas em nossas vidas, lares e comunidades eclesiásticas a fim de levarmos aos outros a paz, a alegria, a liberdade e o amor que encontramos para nós mesmos.

Minha oração é que este livro tenha despertado a sua esperança em enxergar que a honra é um fator poderoso para recebermos aquilo que o Céu está derramando na nossa geração. Sem um aumento da prática do amor, de honrar os relacionamentos que enfatizam liberdade ilimitada e de oportunidade ilimitada para todos os envolvidos, muito provavelmente assistiremos a esse avivamento passar pelas nossas mãos e ter de ser reiniciado por outra geração. Somos privilegiados por viver em um momento tão lindo da história da humanidade. Vamos honrá-lo!$conteudo$
    )
    returning id into v_aula_id;

    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Danny conta a história de John Rankin e de Angel em La Paz para mostrar que o avivamento desperta uma revolução que reforma a cultura, e que isso quase sempre exige 'fazer um churrasco com as vacas sagradas' — confrontar tradições confortáveis que impedem o Céu de tocar a terra. Que 'vaca sagrada' no seu ministério ou na sua liderança você sabe que precisa ir para a grelha, mas tem evitado tocar por causa do preço?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O capítulo expõe que o governo pastoral coloca como prioridade as pessoas-na-cadeira, as coisas e a defesa da doutrina, mantendo o crente como 'pecador sob vigilância', enquanto o governo apostólico prioriza o Céu e libera as pessoas como filhos poderosos. Quando você examina aquilo que de fato protege e prioriza na sua liderança, qual desses dois governos suas prioridades revelam?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Angel descobriu que transformar a cidade não era trazê-la para dentro da igreja, mas deixar o Reino transbordar como benfeitor — doando sangue, lavando os pés do padre, abraçando o católico que era seu 'inimigo'. E isso lhe custou amigos e o confronto de outros pastores. Que passo concreto de honra e generosidade para fora dos seus muros Deus tem colocado no seu coração, e o que tem impedido você de pagar o preço de dá-lo?$p$, 'reflexao', null);
  end if;

end $migration$;
