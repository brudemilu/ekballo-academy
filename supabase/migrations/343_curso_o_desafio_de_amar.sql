-- Curso: O Desafio de Amar (Stephen e Alex Kendrick) — transcrição sem perguntas. Issue #233.
do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'o-desafio-de-amar';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, autor, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values (
      'o-desafio-de-amar',
      $titulo$O Desafio de Amar$titulo$,
      $titulo$Stephen e Alex Kendrick$titulo$,
      $desc$Leitura guiada de O Desafio de Amar, de Stephen e Alex Kendrick. Em quarenta e cinco aulas: A jornada de quarenta dias do filme Prova de Fogo: a cada dia, um traço do amor de 1 Coríntios 13 e um desafio prático para vivê-lo no casamento. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
      '/capas/o-desafio-de-amar.jpg',
      false,
      0,
      'pastoral',
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
    set titulo = $titulo$O Desafio de Amar$titulo$,
        autor = $titulo$Stephen e Alex Kendrick$titulo$,
        descricao = $desc$Leitura guiada de O Desafio de Amar, de Stephen e Alex Kendrick. Em quarenta e cinco aulas: A jornada de quarenta dias do filme Prova de Fogo: a cada dia, um traço do amor de 1 Coríntios 13 e um desafio prático para vivê-lo no casamento. Cada aula traz a transcrição do texto, sem perguntas de reflexão.$desc$,
        imagem_url = '/capas/o-desafio-de-amar.jpg',
        categoria = 'pastoral',
        publicado = true
    where id = v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apresentação$t$, 1,
$conteudo$Receba este livro como um alerta. Esta jornada de quarenta dias não pode ser encarada superficialmente.

Ela é um desafio e, na maioria das vezes, um processo difícil, mas incrivelmente recompensador. Aceitar esse desafio exige uma mente determinada e decisões firmes.

O seu propósito não é o de ser experimentado ou testado por pouco tempo, e aqueles que desistirem cedo, perderão os maiores benefícios. Se você se comprometer com um dia de cada vez em um período de quarenta dias, os resultados poderão mudar a sua vida e o seu casamento.

Considere este livro um desafio vindo de quem já o aceitou antes de você.

AS ESCRITURAS DIZEM que Deus projetou e criou o casamento para ser algo bom. Ele é um presente lindo e inestimável. Deus usa o casamento para nos ajudar a acabar com a solidão, multiplicar nossa eficiência, construir famílias, criar filh os, curtir a vida e nos abençoar com o relacionamento íntimo. Mas além disso, o casamento também nos mostra a necessidade de crescer e de lidar com nossas próprias dificuldades e com o egocentrismo, através da ajuda de um companheiro para toda a vida. Se somos "ensináveis", iremos aprender a fazer aquilo que é mais importante no casamento - amar. Esta poderosa união lhe mostra o caminho para amar incondicionalmente outra pessoa imperfeita. Isto é maravilhoso. É difícil. É uma mudança de vida.

Este livro é sobre o amor, sobre a aprendizagem e sobre o desafio de viver um relacionamento amoroso. E essa jornada se inicia com a pessoa que está mais próxima de você: seu cônjuge. Que Deus lhe abençoe nesta aventura. Mas esteja certo de uma coisa: você precisará de coragem. Ao aceitar esse desafio, você precisa ter a consciência de que ao invés de seguir o coração, terá que governálo. O mundo diz para seguir o coração, mas se você não estiver governando o seu, então alguém ou alguma outra coisa estará. A bíblia diz que "enganoso é o coração, mais do que todas as coisas" (Jeremias 17:9), e ele sempre perseguirá aquilo que parece certo no momento.

Nós desafiamos você a pensar de maneira diferente - escolher direcionar o seu coração para aquilo que será melhor ao longo do caminho. esta é a chave para relacionamentos permanentes e recompensadores.

A jornada de o desafio de amar não é um processo para tentar fazer do seu cônjuge a pessoa que você quer que ele seja. Com certeza você já descobriu que o esforço em tentar mudar seu marido ou sua esposa acabou em fracasso e frustração. Pelo contrário, esta é uma jornada de exploração e demonstração genuína de amor, mesmo quando o seu desejo acaba e quando as suas motivações estão enfraquecidas. A verdade é que o amor é uma decisão e não apenas um sentimento. Ele não busca os seus próprios interesses, é sofredor e transformador. E quando o amor é demonstrado verdadeiramente, como foi planejado para ser, o seu relacionamento tem grandes chances de mudar para melhor.

Em cada dia dessa jornada estão incluídos três elementos muito importantes: Primeiro, um aspecto único do amor será discutido. Leia cada um desses aspectos cuidadosamente e esteja aberto a um novo entendimento do que significa amar alguém verdadeiramente.

Segundo, você terá um desafio específico para fazer com o seu cônjuge. Alguns serão fáceis e outros bem desafiadores. Mas leve cada desafio a sério e seja criativo e corajoso o suficiente para realizá-lo. Não desista se situações externas lhe impedirem de completar um desafio específico. Apenas faça-o o mais rápido possível e prossiga na jornada.

Por último, você terá um espaço para anotar o que está aprendendo, fazendo e como o seu cônjuge está reagindo.

É importante que você aproveite este espaço para registrar o que está acontecendo com você e seu cônjuge ao longo do caminho. O seu progresso estará registrado nessas anotações que provavelmente se tornarão inestimáveis para você no futuro. Lembre-se, você tem a responsabilidade de proteger e guiar o seu coração. Não desista e não fique desencorajado. Decida dirigi-lo e agir assim até o final. Aprender a amar verdadeiramente é uma das coisas mais importantes que você fará.

AGORA, POIS, PERMANECEM A FÉ, A ESPERANÇA E O AMOR, ESTES TRÊS;

MAS O MAIOR DESTES É O AMOR 1 Coríntios 13: 13 AINDA QUE EU FALASSE AS LÍNGUAS DOS HOMENS E DOS ANJOS, E NÃO TIVESSE AMOR, SERIA COMO O METAL QUE SOA OU COMO O CÍMBALO QUE RETINE.

E AINDA QUE TIVESSE O DOM DE PROFECIA, E CONHECESSE TODOS OS MISTÉRIOS E TODA A CIÊNCIA, E AINDA QUE TIVESSE TODA FÉ, DE MANEIRA TAL QUE TRANSPORTASSE OS MONTES, E NÃO TIVESSE AMOR, NADA SERIA.

E AINDA QUE DISTRIBUÍSSE TODOS OS MEUS BENS PARA SUSTENTO DOS POBRES, E AINDA QUE ENTREGASSE O MEU CORPO PARA SER QUEIMADO, E NÃO TIVESSE AMOR, NADA DISSO ME APROVEITARIA.

1 CORÍNTIOS 13:1-3$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 1 - O Amor é paciente$t$, 2,
$conteudo$Sejam completamente humildes e dóceis, e sejam pacientes, suportando uns aos outros com amor. - Efésios 4:2

O amor funciona. É o motivador mais poderoso e tem uma profundidade e um significado bem maiores do que a maioria das pessoas pensa. O amor sempre faz o que é melhor para os outros e tem o poder de nos fortalecer para enfrentar grandes problemas. Nascemos com uma sede perpétua de amor. Nosso coração precisa de amor, assim como nossos pulmões precisam de oxigênio. O amor muda a nossa motivação de vida. Os relacionamentos se tornam significativos com ele. Nenhum casamento é bem sucedido sem amor.

O amor é construído sobre dois pilares que melhor definem o que ele é. Esses pilares são a paciência e a bondade. Todas as outras características do amor são extensões desses dois atributos. E é aqui que começa o seu desafio, com a paciência. O amor irá lhe inspirar a ser uma pessoa paciente. Quando você decide ser paciente, você responde de maneira positiva à uma situação negativa. Você é tardio em irar-se. Prefere ter um "pavio longo" a se irritar facilmente. Ao invés de ser impaciente e exigente, o amor lhe ajuda a se acalmar e a transmitir misericórdia aos que estão ao seu redor. A paciência traz a calma interior em meio à tempestade exterior.

Ninguém gosta de ter uma pessoa impaciente por perto. Estar próximo de alguém assim faz você reagir com raiva, insensatez e de maneiras lamentáveis. A ironia da raiva em uma ação errada está em gerar novos erros por si só. A raiva quase nunca torna as coisas melhores. Na verdade, ela geralmente cria mais problemas. Mas a paciência paralisa o andamento do problema. A paciência, mais do que morder a língua, mais do que bater a mão na boca, é respirar fundo. Ela purifica o ar. Ela impede a insensatez de espalhar seu veneno por toda casa. Ter paciência é escolher controlar suas emoções ao invés de permitir que elas lhe controlem. É demonstrar discrição ao invés de pagar mal com mal.

Se o seu cônjuge lhe ofende, você rapidamente revida ou você se controla? Você reage com raiva quando lhe tratam injustamente? Se a resposta for sim, você está espalhando veneno ao invés de remédio.

A raiva é causada, na maioria das vezes, quando um forte desejo por algo é combinado com decepção ou tristeza. Você não consegue o que quer, então começa a se irritar por dentro. Muitas vezes ela é a reação emocional que resulta das nossas razões egoístas, tolas e más.

Por outro lado, a paciência nos torna sábios. Ela não se apressa em julgar, mas ouve o que a outra pessoa está dizendo. Ela espera na entrada enquanto a raiva deseja invadir com violência. A paciência aguarda para ver toda a situação antes de julgar. A bíblia diz: "o homem paciente dá prova de grande entendimento, mas o precipitado revela insensatez" (Provérbios 14:29).

Assim como a falta de paciência fará do seu lar uma zona de guerra, a prática da paciência estimulará a paz e a tranqüilidade. "O homem irritável provoca dissensão, mas quem é paciente acalma a discussão" (Provérbios 15:18). Frases como esta do livro de Provérbios são princípios claros de aplicação eterna. A paciência é o lugar onde o amor encontra sabedoria. E todo casamento precisa desta combinação para permanecer saudável.

A paciência lhe ajuda a dar ao seu cônjuge o direito de ser humano. A paciência entende que todos falham. Quando um erro é cometido, a paciência decide dar mais tempo do que ele (a) precisa para corrigi-lo. A paciência lhe capacita a permanecer firme durante os tempos difíceis do seu relacionamento, ao invés de lhe esgotar com as pressões.

Mas o seu cônjuge pode contar com um marido ou com uma esposa paciente? Ela pode ter certeza de que se trancar as chaves dentro do carro poderá contar com a sua compreensão ao invés de ouvir um sermão que a fará sentir-se como uma criança? Ele pode se assegurar de que se comemorar os últimos segundos do jogo de futebol não vai ouvir uma lista de sugestões de como poderia usar melhor o seu tempo? Acontece que poucas pessoas são tão difíceis de se conviver quanto uma pessoa impaciente.

Como seria o tom de voz do seu lar se você colocasse em prática essa abordagem bíblica: "tenham cuidado para que ninguém retribua mal com mal, mas sejam sempre bondosos uns para com os outros e para com todos." (1 Tessalonicenses 5: 15)? Poucos de nós praticam a paciência de forma adequada, e nenhum de nós a pratica naturalmente. Mas o homem e a mulher sábios verão a paciência como um ingrediente essencial no casamento. Este é um bom ponto de partida para demonstrar o amor verdadeiro.

Essa jornada de O Desafio de Amar é um processo, e a primeira atitude que você deve decidir ter é ser paciente. Pense nisso como uma maratona, não como uma corrida de 100 metros rasos. Uma maratona que vale à pena correr.

» Desafio de hoje »

A primeira a parte do desafio de hoje é bastante simples. Apesar do amor se comunicar de várias formas, as palavras, na maioria das vezes, refletem o estado do nosso coração. Para o próximo dia, decida demonstrar paciência e de modo algum diga algo negativo para o seu cônjuge. Se a tentação surgir, não diga nada. É melhor segurar a língua do que dizer algo de que possa se arrepender depois.

- Anote aqui quando o desafio de hoje estiver completo.

Aconteceu alguma coisa hoje que lhe deixou com raiva do seu cônjuge? Você foi tentado a ter pensamentos condenáveis e a expressá-los com palavras?

Sejam todos prontos para ouvir, tardios para falar e tardios para irar-se. (Tiago 1:19).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 2 - O Amor é bondoso$t$, 3,
$conteudo$Sejam bondosos e compassivos uns para com os outros, perdoando-se mutuamente, assim como Deus os perdoou em Cristo. - Efésios 4:32

A bondade é o amor em ação. Se a paciência é a maneira pela qual o amor reage para minimizar uma circunstância negativa, a bondade é a maneira como o amor age para maximizar uma circunstância positiva. A paciência evita o problema; a bondade abençoa. Uma é preventiva, a outra é ativa. Estes dois lados do amor são a pedra fundamental onde são construídos muitos dos outros atributos que discutiremos. O amor lhe faz bondoso, e a bondade lhe torna agradável. Quando você é bom, as pessoas desejam ficar ao seu redor. Elas vêem você como sendo bom com elas e para elas.

A chave bíblica para a importância da bondade é: "Não se afastem de ti a benignidade e a fidelidade; ata-as ao teu pescoço, escreve-as na tábua do teu coração; assim acharás favor e bom entendimento à vista de Deus e dos homens" (Provérbios 3:3-4). Pessoas bondosas acham favor aonde quer que vão, até mesmo em casa. Mas a "bondade" pode parecer um pouco ampla ao ser definida, e principalmente ao ser vivida. Então, vamos dividi-la em quatro ingredientes principais:

Gentileza. Quando você é movido pela bondade, você é cuidadoso no modo como trata seu cônjuge, nunca sendo rude desnecessariamente. Você é sensível, tenro. Mesmo quando precisar dizer coisas duras, fará um grande esforço para que a sua censura ou provocação soe o mais leve possível. Você fala a verdade em amor.

Prestabilidade. Ser bom significa que você supre as necessidades do momento. Se forem os afazeres domésticos, você se ocupa com eles. Um ouvido? Você dá o seu. A bondade agracia a esposa com a habilidade de servir ao marido sem se preocupar com os seus próprios direitos. A bondade torna o marido curioso para saber as necessidades da esposa, e depois o motiva para ser aquele que fará de tudo para suprir essas necessidades - mesmo que as dele sejam postas em segundo plano.

Boa vontade. A bondade lhe inspira a ser agradável. Ao invés de ser obstinado, relutante ou teimoso, você coopera, é flexível. Em lugar de reclamar ou dar desculpas, você busca razões para se comprometer e ajudar. Um marido gentil acaba com milhares de argumentos em potencial, tendo boa vontade para ouvir primeiro ao invés de exigir que as coisas sejam feitas à sua maneira.

Iniciativa. A bondade pensa à frente, e dá o primeiro passo. Ela não se senta esperando ser estimulada ou forçada a sair do sofá. O marido ou a esposa gentil será o que cumprimenta primeiro, sorri primeiro, serve primeiro e perdoa primeiro. Ele (a) não espera o outro agir para então demonstrar amor. Quando agimos segundo a bondade, vemos as necessidades, e então tomamos a atitude primeiro.

Jesus descreveu de forma criativa a bondade do amor na parábola do Bom Samaritano, encontrada na Bíblia - Lucas, capítulo 10. Um homem judeu atacado por assaltantes foi deixado quase morto em uma estrada deserta. Um sacerdote e um levita, respeitados no meio do povo, passaram pelo outro lado decidindo não parar. Muito ocupados. Muito importantes. Apreciadores de mãos limpas. Mas um homem comum de outra etnia os odiados samaritanos, cujo ódio pelos judeus era cruel e mútuo - vê o homem em sua necessidade e é movido de compaixão. Atravessando todos os limites culturais e arriscando se expor ao ridículo, ele parou para ajudar o homem. Enfaixando-lhe as feridas e colocando-o sobre seu próprio animal, ele o carrega até uma hospedaria e paga todas as despesas médicas do seu próprio bolso.

Onde anos de racismo causaram rixa e divisão, um ato de bondade aproximou dois inimigos. Gentilmente, prestativarnente, de boa vontade. Tomando a iniciativa, esse samaritano demonstrou a bondade verdadeira de todas as maneiras possíveis. Não foi a bondade uma das principais coisas que uniram você e seu cônjuge em primeiro lugar? Quando se casou, você não esperava curtir a bondade dele para o resto de sua vida? O seu cônjuge não esperava o mesmo de você? Mesmo que os anos sejam capazes de afastar essa esperança, a alegria no casamento ainda está ligada ao nível diário de bondade expressada.

A Bíblia descreve uma mulher cujo marido e filhos a abençoam e honram. Entre todos os seus atributos, se destacam estes: "Fala com sabedoria e ensina com amor" (Provérbios 31:26). E você? Como seu marido ou sua esposa lhe descreveria à luz da bondade? Você é áspero? É gentil e prestativo? Você espera que lhe peçam alguma coisa ou você toma a iniciativa de ajudar? Não espere seu cônjuge ser bondoso primeiro para que então, você pratique a bondade.

É difícil expressar amor quando existe pouca ou nenhuma motivação. Mas o amor em sua essência não é baseado em sentimentos. Pelo contrário, faz parte da natureza do amor ter consideração e ser atencioso, mesmo quando parece não haver recompensa. Você nunca aprenderá a amar até que aprenda a demonstrar bondade.

» Desafio de hoje »

Além de, mais uma vez, não dizer palavras negativas ao seu cônjuge hoje, demonstre bondade com, no mínimo, um gesto inesperado.

- Anote aqui quando o desafio de hoje estiver completo.

Que descobertas sobre o amor você fez hoje? O que você fez especificamente com relação a este desafio? Como você demonstrou bondade?

O que faz um homem desejável é a sua benignidade. (Provérbios 19:22).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 3 - O Amor não é egoísta$t$, 4,
$conteudo$Dediquem-se uns aos outros com amor fraternal. Prefiram dar honras aos outros mais do que a si próprios. - Romanos 12: 1 O.

Vivemos em um mundo dominado pelo "ego". A cultura ao nosso redor nos ensina a priorizar nossa aparência, sentimentos e desejos pessoais. Ao que parece, o objetivo é buscar o nível mais elevado possível de felicidade. Porém, o perigo desse pensamento se torna visivelmente doloroso, uma vez dentro do casamento. Se algum dia existiu alguma palavra que significasse o contrário de amor, essa palavra seria egoísmo. Infelizmente, o egoísmo é algo arraigado em todos nós desde o nascimento. Você pode perceber isso no modo como as crianças se comportam e, geralmente, na maneira como os adultos se maltratam. Quase todas as ações pecaminosas já cometidas podem ser relacionadas a um motivo egoísta. O egoísmo é uma característica que odiamos nos outros mas que justificamos em nós mesmos. Além disso, você não pode apontar as várias formas de egoísmo do seu cônjuge sem admitir que você também é egoísta. Isso seria hipocrisia.

Por que será que esperamos tão pouco de nós mesmos, mas estabelecemos padrões tão elevados para o nosso cônjuge? A resposta é difícil de engolir. Somos todos egoístas.

Quando um marido coloca os seus interesses, desejos e prioridades à frente de sua esposa é sinal de egoísmo. Quando uma esposa reclama constantemente sobre o tempo e a energia gastos em suprir as necessidades de seu marido, é sinal de egoísmo.

Mas o amor "não busca os seus próprios interesses" (1 Coríntios 13:5). Os casais apaixonados - aqueles que vivem o pleno propósito do casamento - são inclinados a cuidar bem do outro ser humano, falho, que eles escolheram para compartilhar a vida. É por isso que o amor verdadeiro busca maneiras de dizer "sim". Um aspecto irônico do egoísmo é que mesmo as ações generosas podem ser egoístas se o objetivo for vangloriar-se ou receber alguma recompensa. Se você faz algo, ainda que bom, para manipular seu marido ou sua esposa, você ainda está sendo egoísta. Na verdade, o ponto principal é a sua decisão entre amar os outros ou amar a si mesmo. O amor não se satisfaz senão na felicidade do outro. Você não pode agir com amor e ao mesmo tempo com egoísmo. Escolher amar o seu marido ou a sua esposa lhe levará a dizer "não" aos seus desejos, para que você diga "sim" à necessidade do outro. Isso é colocar a felicidade do seu (sua) companheiro (a) acima da sua própria vontade. Não significa que você nunca vai experimentar a felicidade, mas significa que você não negará a felicidade do seu cônjuge para vivê-la você mesmo.

O amor também leva a uma alegria interior. Quando você prioriza o bem-estar do seu cônjuge, uma satisfação interior, que não pode ser adquirida através de ações egoístas, nasce dentro de você. Esse é um benefício criado por Deus e reservado para aqueles que verdadeiramente demonstram amor. A verdade é, quando você renuncia aos seus interesses em benefício do seu marido ou da sua esposa, você tem a chance de se sacrificar pelo propósito maior do casamento.

Ninguém lhe conhece tão bem como o seu cônjuge. E isso significa que ninguém reconhecerá tão rápido a mudança, quando você começar a sacrificar, deliberadamente, os seus desejos e vontades para se assegurar de que os desejos dele estão sendo satisfeitos. Se você acha difícil sacrificar seus próprios desejos para beneficiar seu cônjuge, então você tem um problema mais profundo com o egoísmo do que imagina.

Faça essas perguntas para você mesmo:

• Eu realmente desejo o que é melhor para o meu marido ou para a minha esposa?

• Eu quero que ele (a) sinta-se amado (a) por mim?

• Ele (a) acredita que eu tenho seus maiores interesses em mente?

• Ele (a) me vê buscando os meus interesses em primeiro lugar? Goste ou não, você tem uma reputação aos olhos das pessoas que estão ao seu redor, especialmente aos olhos do seu cônjuge. Mas essa é uma reputação amorosa? Lembre-se, o (a) seu (sua) companheiro (a) também tem o desafio de amar uma pessoa egoísta. Então, seja o primeiro a demonstrar amor verdadeiro, com os seus olhos bem abertos. E quando tudo for dito e feito, ambos se sentirão mais satisfeitos. "Nada façam por ambição egoísta ou por vaidade, mas humildemente considere os outros superiores a si mesmos" (Filipenses 2:3).

» Desafio de hoje »

Aquilo em que você colocar seu tempo, energia e dinheiro, será mais importante para você. É difícil se importar com algo em que você não está investindo. Além de evitar comentários negativos, compre para o seu cônjuge alguma coisa que diga: "eu estava pensando em você hoje".

- Anote aqui quando o desafio de hoje estiver completo.

O que você escolheu dar ao seu cônjuge? O que aconteceu quando você entregou o presente?

Pois onde há inveja e ambição egoísta, aí há confusão. (Tiago 3: 16).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 4 - O Amor é atencioso$t$, 5,
$conteudo$Como são preciosos para mim os teus pensamentos... Como é grande a soma deles! Se eu os contasse, seriam mais do que os grãos de areia. - Salmos 139: 17-18

O amor pensa. Ele não é um sentimento tolo que passeia pelas ondas da emoção e então cai no sono mental. Ele se mantém ocupado em pensamentos, sabendo que os pensamentos amorosos precedem as atitudes amorosas.

Quando você se apaixonou, o pensamento veio quase que naturalmente. Você passou horas imaginando como seria a pessoa amada, imaginando o que ela estaria fazendo; ensaiando coisas marcantes para dizer e, depois, curtindo doces memórias do tempo que passaram juntos. Você disse sinceramente: "Eu não consigo parar de pensar em você."

Mas, para a maioria dos casais as coisas começam a mudar logo depois do casamento. A esposa finalmente tem seu marido; o marido já tem seu troféu. A caça está terminada e a perseguição encerrada, Fagulhas de romance vagarosamente tornam-se cinzas e a motivação para o pensamento esfria. Você se deixa focar em seu trabalho, seus amigos, seus problemas, seus desejos pessoais, em você. Depois de algum tempo, você involuntariamente começa a ignorar as necessidades do seu cônjuge.

Mas o fato de que o casamento acrescentou outra pessoa em seu universo não mudou. Então, se o seu pensamento não amadureceu o bastante para constantemente incluir esta pessoa, você se pega sendo surpreendido ao invés de reflexivo. “Hoje é nosso aniversario?” “Por que você não me inclui nesta decisão?” “Você nunca pensa em ninguém além de você mesmo?”

Se você não aprender a ser reflexivo, acabará se arrependendo por ter perdido oportunidades de demonstrar amor. A falta de atenção é um inimigo silencioso para um relacionamento amoroso.

Sejamos honestos. Os homens lutam mais contra a falta de atenção do que as mulheres. O homem tem a capacidade de focar em apenas uma coisa, como um laser, e esquecer-se do resto do mundo. Enquanto isto pode beneficiá-lo naquela área específica, pode também fazê-lo ignorar outras coisas que precisam de sua atenção.

A mulher, por outro lado, é mais multiconsciente, capaz de manter-se incrivelmente atenta a vários fatos ao mesmo tempo. Ela tem a capacidade de falar ao telefone, cozinhar, saber em que cômodo da casa as crianças estão e se perguntar por que seu marido não a está ajudando... Tudo simultaneamente. Além disso, a mulher também pensa no coletivo. Quando ela se envolve em algum trabalho específico, fica a par de todas as pessoas que de alguma forma estão ligadas a ele.

Essas duas tendências são exemplos de como Deus projetou as mulheres para completarem os seus maridos. Como Deus disse na criação: "Não é bom que o homem esteja só; farei para ele alguém que o auxilie e o corresponda" (Gênesis 2: 18). Porém, essas diferenças também criam oportunidades para o desentendimento. Homens, por exemplo, tendem a pensar de forma objetiva e a dizer exatamente o que querem dizer. Não é preciso mais nada para compreender a mensagem. Suas palavras são mais literais e não devem ser analisadas além do que foi dito. Mas, as mulheres falam e pensam nas entrelinhas. Elas têm a tendência de fazer insinuações. Um homem precisa ouvir também o que está implícito se quiser obter o significado completo do que uma mulher diz.

Se um casal não tem essa compreensão um do outro, isso pode resultar em desentendimentos sem fim. Ele fica frustrado tentando entender por que ela fala em enigmas ao invés de falar de uma vez o que quer. Ela fica frustrada tentando entender por que ele é tão desatento e não soma dois mais dois para compreender o que ela diz.

Uma mulher deseja profundamente que seu marido seja atencioso e reflexivo. Essa é uma das chaves que a ajuda a sentir-se amada. Quando ela fala, o homem sábio ouve como um detetive para descobrir as necessidades e desejos implícitos em suas palavras. Contudo, se ela sempre tem que juntar as peças, ele perde a oportunidade de demonstrar que a ama.

Isto também explica por que as mulheres ficam chateadas com seus maridos sem dizer a eles o porquê. Ela pensa: "Eu não deveria ter que explicar isso para ele. Ele precisa ser capaz de olhar a situação e entender o que está acontecendo aqui." Ao mesmo tempo, ele se sente mal porque não pode ler a mente dela e deseja saber por que está sendo punido por um crime que não sabia que havia cometido.

O amor requer atenção - dos dois lados - o tipo de atenção que constrói pontes através da combinação de paciência, bondade e generosidade. O amor ensina a acertar o alvo, a respeitar e a apreciar a maneira única de pensar do seu cônjuge.

O marido deve ouvir a sua esposa e aprender a considerar as mensagens não ditas. A esposa deve aprender a se comunicar com atenção e não dizer uma coisa significando outra.

Porém, com freqüência você fica irado e se frustra, seguindo o padrão destrutivo "Preparar, apontar, fogo!" Você fala de forma dura e só depois pensa se deveria ter dito o que disse. Mas a natureza atenciosa do amor lhe ensina a usar a mente antes de usar os lábios. O amor pensa antes de falar. Ele filtra as palavras com a peneira da verdade e da bondade.

Quando foi a última vez que você gastou alguns minutos pensando em como poderia demonstrar amor ao seu cônjuge e entendê-lo melhor? Qual a necessidade imediata que você pode suprir? Para qual próximo evento (aniversário, data comemorativa, feriado) você já pode se preparar? Grandes casamentos vêm de grandes reflexões.

» Desafio de hoje »

Faça contato com o seu cônjuge em algum momento durante a agitação do dia. Não faça outra coisa senão perguntar como ele está e se tem algo que você pode fazer por ele.

- Anote aqui quando o desafio de hoje estiver completo.

O que você aprendeu sobre si mesmo e sobre o seu cônjuge ao aceitar o desafio de hoje? Como isso poderia se tornar mais natural, rotineiro e parte verdadeiramente útil do seu estilo de vida?

Agradeço a meu Deus toda vez que me lembro de vocês. (Filipenses 1:3).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 5 - O Amor não maltrata$t$, 6,
$conteudo$A bênção dada aos gritos cedo de manhã, como maldição é recebida. - Provérbios 27:14 Nada irrita o outro tão rápido quanto à grosseria. Arrogância é dizer coisas desnecessárias ou fazer coisas desagradáveis para a pessoa ao nosso lado. Ser rude é ser inconveniente, constrangedor ou irritante. No casamento, isso poderia ser o falar grosseiro, certos comportamentos à mesa, ou o hábito de ser sarcástico. Apesar de convivermos com isso, ninguém gosta de estar com uma pessoa rude. Comportamentos rudes podem parecer insignificantes para a pessoa que é grosseira, mas é desagradável para aqueles que recebem a grosseria.

Como sempre, o amor tem algo a dizer sobre isso. Quando um homem é guiado pelo amor, ele se comporta intencionalmente de forma a fazer sua esposa se sentir confortável onde estiver. Se ela deseja amá-lo, ela irá propositadamente evitar coisas que o frustram ou causam desconforto para ele.

O ponto principal é que o amor verdadeiro presta atenção em seu comportamento. Adotar este conceito pode trazer refrigério ao seu casamento. Boas maneiras expressam para sua esposa ou para o seu marido: "Eu lhe valorizo o suficiente para exercitar autocontrole perto de você. Eu quero ser uma companhia agradável." Quando permitimos que o amor mude o nosso comportamento - mesmo que nos menores aspectos - restauramos uma atmosfera de honra em nosso relacionamento. As pessoas que praticam boa etiqueta tendem a aumentar o nível de respeito no ambiente onde se encontram.

Para a maioria, a etiqueta usada em casa é muito diferente da usada com amigos, e até mesmo com os estranhos. Podemos estar aos berros ou mal humorados, mas se a campainha tocar, abrimos a porta sorrindo e com muita gentileza. Mas, se nos desafiamos a amar, também iremos querer dar o melhor de nós. Se não deixarmos o amor nos motivar a fazer as mudanças necessárias em nosso comportamento, a qualidade do nosso casamento será atingida por conta disso.

As mulheres tendem a ser muito melhores em certos tipos de comportamento do que os homens, apesar de serem rudes de outras formas. O rei Salomão disse: "Melhor é viver num canto sob o telhado do que repartir a casa com uma mulher briguenta" (Provérbios 25:24). Mas, principalmente os homens, precisam aprender essa importante lição. A Bíblia diz: "Bem irá ao homem que se compadece" (Salmos 112:5). Um homem prudente sabe discernir o que é apropriado e, conseqüentemente, ajustar seu comportamento de acordo com a situação. Há duas razões principais pelas quais as pessoas são rudes: ignorância e egoísmo. Com certeza, nenhuma das duas é boa. Uma criança nasce ignorante no que se refere à etiqueta, precisando de muita ajuda e treinamento. Os adultos, contudo, demonstram sua ignorância em outro nível. Sabemos as regras, mas podemos nos fazer de cegos sobre como as quebramos ou ser egocêntricos demais para nos importar. De fato, não percebemos o quão desagradáveis podemos ser.

Ponha-se à prova com essas perguntas:

• Como o seu cônjuge se sente com o seu jeito de agir e falar com ele?

• Como o seu comportamento afeta o senso de auto-estima e de importância do seu cônjuge?

• Seu marido ou sua esposa diria que você é uma bênção, ou que você é condescendente e constrangedor?

Se você está pensando que o seu cônjuge - não você - é quem precisa ser trabalhado nesta área, você está provavelmente sofrendo de um caso grave de ignorância e egoísmo. Lembre-se, o amor não maltrata, mas leva você a um padrão mais elevado.

Você deseja que seu cônjuge pare de fazer coisas que lhe chateiam? Então, é hora de parar de fazer coisas que o chateiam. Você será reflexivo e amoroso o suficiente para descobrir e evitar o comportamento que torna a vida desagradável para seu (sua) companheiro (a)? Você aceitará o desafio de ser agradável?

Aqui estão três princípios norteadores para que você pratique a etiqueta em seu casamento:

• Guarde a Regra de Ouro. Trate seu cônjuge da mesma maneira que você deseja ser tratado (veja Lucas 6:31).

• Nada de Padrões Diferentes. Seja tão atencioso com o seu cônjuge quanto você é com estranhos ou com colegas de trabalho.

• Atenda às Solicitações. Considere o que o seu marido ou esposa lhe pediu para fazer ou não fazer. Se estiver em dúvida, então pergunte.

» Desafio de hoje »

Peça ao seu cônjuge para lhe dizer três coisas sobre você que o deixam desconfortável e irritado. Faça isso sem atacá-lo e sem justificar seu comportamento. Preocupe-se apenas com a perspectiva dele.

-Anote aqui quando o desafio de hoje estiver completo.

Quais foram as três coisas que o seu cônjuge disse sobre você que precisam da sua atenção? Como você reagiu ao ouvi-las? O que você pretende fazer para melhorar essas áreas?

____ Nas palavras da boca do sábio há favor. (Eclesiastes 10: 12).$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 6 - O Amor não se irrita facilmente$t$, 7,
$conteudo$Melhor é o homem paciente do que o guerreiro, mais vale controlar o seu espírito do que conquistar uma cidade. - Provérbios 16:32

O amor é tardio em ofender e pronto a perdoar. Você se irrita e se ofende facilmente? Algumas pessoas têm a frase: "Nunca perca uma oportunidade de ficar chateado com o seu cônjuge" como lema. Quando alguma coisa dá errada, elas rapidamente conseguem um jeito de se beneficiarem, expressando o quanto estão frustradas ou machucadas. Mas essa reação é oposta ao amor.

Irritar-se facilmente significa "estar próximo à ponta de uma faca". Não livre de ser ferido. As pessoas que se irritam facilmente são fechadas, oprimidas e prontas para reagir.

Quando sob pressão, o amor não se irrita. Problemas pequenos não criam grandes contra-ataques. A verdade é, amor não se ira ou se machuca a menos que exista uma razão legítima e justa diante de Deus. Um marido amoroso permanecerá calmo e paciente, mostrando misericórdia e contendo seu temperamento. Raiva e violência estão fora de cogitação. A esposa amorosa não é extremamente sensível ou malhumorada, mas exerce o autocontrole emocional. Ela prefere ser uma flor entre os espinhos e responde amigavelmente às situações difíceis.

Se você está caminhando sob a influência do amor, você será motivo de alegria, não de dor. Pergunte a si mesmo, "Sou uma brisa suave ou uma tempestade esperando para agir?"

Por que as pessoas se irritam facilmente? Existem, pelo menos, duas razões principais que contribuem para isso:

Estresse. O estresse nos sobrecarrega, suga nossa energia, enfraquece nossa saúde, e nos deixa mal-humorados. O estresse pode ser causado por problemas de relacionamento: discussões, divisões e amargura. Existem as questões de excesso: trabalhar muito, jogar muito e gastar excessivamente, e existem as deficiências: não descansar, não se alimentar e não se exercitar o suficiente. Muitas vezes, nos submetemos a esses males, e isso nos torna irritáveis.

A vida é uma maratona, não uma corrida de 100 metros rasos. Isto significa que você deve balancear, priorizar e medir seus passos. Com freqüência jogamos a cautela ao vento e corremos disparados, fazendo o que parece correto no momento. Em pouco tempo ficamos sem ar, presos em amarras e prestes a falar de maneira dura. A crescente pressão pode acabar com a nossa paciência e, conseqüentemente, com o nosso relacionamento.

A Bíblia pode nos ajudar a evitar o estresse que é prejudicial à saúde. Ela nos ensina a deixar o amor guiar nosso relacionamento e a não cair em discussões desnecessárias (Colossenses 3:12-14). A orar pelas nossas ansiedades ao invés de lidar com elas por nós mesmos (Filipenses 4:6-7). A delegar tarefas quando estivermos sobrecarregados (Êxodo 18: 17-23). A evitar prazeres excessivos (Provérbios 25:16).

A Bíblia também nos exorta a guardar o "sábado", tirar um dia por semana para adorar e descansar. Estrategicamente isto nos permite recarregar a bateria, ajustar o foco e acrescentar um tempo para respirar em nossa agenda. Estabelecer esse tipo de espaço extra faz com que os impactos das pressões ao nosso redor sejam amortecidos, reduzindo o estresse que nos mantém no limite com nosso cônjuge. Mas existe uma razão mais profunda que contribui para uma pessoa se irritar facilmente. Egoísmo. Quando nos irritamos facilmente, o coração do problema é primeiramente um problema do coração. Jesus disse, "Pois do que há em abundância no coração, disso fala a boca" (Mateus 12:34). Algumas pessoas são como limão: quando a vida as espreme, elas liberam uma resposta azeda. Alguns são mais parecidos com o pêssego: quando pressionados, a resposta ainda é doce.

Irar-se facilmente é um indicador de que uma área escondida de egoísmo e insegurança está presente onde o amor deveria reinar. Mas o egoísmo também veste muitas outras máscaras:

A cobiça, por exemplo, é o resultado de ser ingrato pelo que você tem e escolher encobrir ou se apaixonar por algo que é proibido. Quando o coração é ambicioso, ele se irrita e se frustra facilmente (Tiago 4:1-3). A amargura cria raiz quando respondemos de maneira crítica e nos recusamos a tratar nossa raiva. A raiva não resolvida de uma pessoa amargurada vem à tona quando é provocada (Efésios 4:31). A ambição por mais dinheiro e posse nos frustrará com desejos inalcançáveis (1 Timóteo 6:9-10). Essas fortes paixões, unidas com a insatisfação, nos levam a ofender qualquer um que esteja em nosso caminho. O orgulho nos leva a agir de forma áspera para protegermos nosso ego e reputação.

Estas motivações nunca serão satisfeitas. Mas quando o amor entra em nosso coração, ele nos acalma e nos inspira a tirar o foco de nós mesmos. Ele liberta nosso entendimento e nos ajuda a liberar as coisas desnecessárias.

O amor nos levará a perdoar ao invés de guardar rancor. A sermos gratos em lugar de mesquinhos. A sermos satisfeitos ao invés de prontos a fazer dívidas. O amor nos encoraja a ficarmos felizes quando o outro é bem sucedido, em lugar de perder o sono de tanta inveja. O amor diz, "compartilhe a herança" ao invés de "dispute com seus parentes". O amor nos lembra de priorizar a família em lugar de sacrificá-la por uma promoção no trabalho. No final das contas, o amor diminui o estresse e ajuda a acabar com o veneno que pode crescer dentro de nós em cada decisão que tomamos. Assim, ele prepara o nosso coração para responder ao nosso cônjuge com paciência! e encorajamento, ao invés de responder com raiva e irritação.

» Desafio de hoje »

Escolha hoje para reagir de maneira amorosa, apesar das circunstâncias do seu casamento. Comece fazendo uma lista das áreas em que você precisa separar um tempo para respirar. Então, faça uma lista das motivações negativas e abra mão delas.

- Anote aqui quando o desafio de hoje estiver completo.

Em que áreas da sua vida você precisa estabelecer limites? Quando foi a última vez que reagiu de forma exagerada? Qual foi a motivação real por trás disso? Quais foram as decisões que você tomou hoje?

Por isso procuro sempre conservar minha consciência limpa diante de Deus e dos homens. (Atos 24: 16)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 7 - O Amor acredita sempre no melhor$t$, 8,
$conteudo$[O amor] tudo crê, tudo espera. - 1 Coríntios 13:7

Nos corredores profundos e secretos do nosso coração, existe uma sala. Ela é chamada de Sala da Admiração. É para esta sala que vão os seus pensamentos quando você se depara com coisas positivas e encorajadoras a respeito do seu cônjuge. E com freqüência, você gosta de visitar esse lugar especial.

Nas paredes estão escritas palavras gentis e frases que descrevem bons atributos do seu esposo ou da sua esposa. Elas incluem características como "honestidade" e "inteligência", ou frases como "trabalho diligente", "comida maravilhosa" ou "olhos bonitos". São coisas que você descobriu sobre seu marido ou sobre sua esposa que ficaram gravadas em sua memória.

Quando você pensa nessas coisas, a admiração que você tem pelo seu cônjuge começa a aumentar. De fato, quanto mais tempo você passa meditando nesses atributos positivos, mais grato você é pelo seu marido ou esposa.

A maioria das coisas da Sala da Admiração foi escrita nas fases iniciais do seu relacionamento. Você as resumiria nos aspectos que gostava e respeitava em seu (sua) amado (a). Elas eram verdadeiras, honrosas e boas. E você passou um bom tempo habitando com elas nesta sala... Antes de se casar. Mas, você deve ter notado que não visita essa sala especial com tanta freqüência como fazia no passado. Isso acontece porque existe outra sala competindo com esta.

Mais adiante, outro corredor do seu coração leva à Sala da Depreciação e, infelizmente, você visita esta sala também. Nas paredes deste cômodo está escrito aquilo que seu cônjuge faz que lhe deixa chateado e irritado. Essas palavras foram escritas lá como resultado de frustrações, sentimentos feridos e expectativas não correspondidas.

Esta sala tem ligação com as fraquezas e falhas do seu marido ou esposa. Seus péssimos hábitos, palavras grosseiras e decisões erradas estão escritas em letras grandes que cobrem as paredes de um lado a outro. Se você permanecer por muito tempo neste cômodo, certamente ficará depressivo e pensará coisas do tipo, “Minha esposa é tão egoísta", ou "Meu marido é um imbecil", ou talvez, ''Acho que casei com a pessoa errada".

Algumas pessoas escrevem coisas detestáveis nesta sala, onde censuras são ensaiadas para serem usadas como argumento na próxima briga. Ferimentos emocionais se inflamam aqui fazendo crescer as observações negativas nas paredes. É aqui que as munições são preparadas para a próxima luta e a amargura é espalhada como doença. As pessoas param de amar aqui.

Mas saiba de uma coisa: gastar tempo na Sala da Depreciação destrói casamentos. Os divórcios nascem nessa sala e os planos malignos são esquematizados lá. Quanto mais tempo você gastar neste lugar, mais o seu coração desvalorizará o seu cônjuge. Este processo tem início no momento em que você passa pela porta desta sala, já que todas as vezes que uma marca é deixada lá, a importância dada ao seu cônjuge diminui.

Você pode dizer, "Mas o que escrevo lá é ver dade!" Sim, mas o que está escrito na Sala da Admiração também é verdade. Todos falham e possuem áreas que precisam de crescimento.

Todos têm questões não resolvidas, feridas e cargas pessoais. Este é um aspecto triste do ser humano. Todos nós pecamos. Mas temos essa tendência infeliz de subestimar nossos atributos negativos enquanto colocamos os do nosso próximo sob uma lente de aumento. Vamos analisar a verdadeira questão aqui. O amor tem conhecimento da Sala da Depreciação e não vive negando sua existência.

Mas o amor escolhe não viver nela.

Você precisa tomar a atitude de não correr mais para esta sala e de não permanecer por lá após cada acontecimento frustrante no seu relacionamento. Isso não lhe faz nenhum bem, e rouba de você a alegria do casamento.

O amor escolhe acreditar no melhor das pessoas. Ele dá a elas o benefício da inocência. Ele se recusa a preencher o desconhecido com suposições negativas. E quando nossas piores expectativas se tornam verdade, o amor faz todo o esforço para lidar com elas e ir em frente. O amor foca no positivo enquanto for possível. É hora de começar a pensar de maneira diferente. É hora de deixar o amor guiar os seus pensamentos e o seu foco. O único motivo que você tem para dar uma olhada na Sala da Depreciação é o de saber como orar pelo seu cônjuge. E a única razão que você tem para entrar nesta sala, é escrever "COBERTO EM AMOR" com letras garrafais em todas as paredes.

É hora de nos mudar para a Sala da Apreciação, nos acomodar e fazer dela o nosso lar. Como escolhemos meditar nos aspectos positivos, descobriremos que muitas outras qualidades maravilhosas poderão ser escritas nestas paredes. O seu cônjuge é um livro vivo e infinito a ser lido. Ainda existem sonhos e desejos para serem realizados. Talentos e habilidades para serem descobertos, como tesouros escondidos. Mas a escolha de explorá-los começa com uma decisão sua.

É preciso desenvolver o hábito de frear seus pensamentos negativos e focar nos atributos positivos do seu cônjuge. Esta é uma etapa crucial pela qual temos que passar para aprender a conduzir nosso coração ao verdadeiro amor. Essa é uma decisão sua, mereça ele ou não.

» Desafio de hoje »

Para o desafio de hoje, pegue duas folhas de papel. Na primeira, passe alguns minutos escrevendo coisas positivas a respeito do seu cônjuge. Depois, na segunda folha, faça o mesmo com as coisas negativas. Coloque as duas folhas em um lugar secreto para o próximo dia. Existe um propósito e um plano diferente para cada uma dessas listas. Em algum ponto durante o resto do dia, escolha um atributo positivo e agradeça ao seu cônjuge por ter essa característica.

- Anote aqui quando o desafio de hoje estiver completo.

Qual lista foi a mais fácil de fazer? O que essa atitude revelou sobre os seus pensamentos? Por qual atributo você agradeceu ao seu cônjuge?

Se há algum louvor - nisso pensai. (Filipenses 4:8)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 8 - O Amor não arde em ciúmes$t$, 9,
$conteudo$Pois o amor é tão forte quanto à morte, e o ciúme é tão inflexível quanto à sepultura. Suas brasas são fogo ardente, são labaredas do Senhor. - Cantares de Salomão 8:6

O ciúme é um dos impulsos mais fortes do ser humano. Ele vem da raiz da palavra zelo e significa "Queimar com um fogo intenso". As Escrituras sutilmente dizem, "O rancor é cruel e a fúria é destruidora, mas quem consegue suportar a inveja? (Provérbios 27:4)

Na verdade, existem duas formas de ciúme: o ciúme legítimo, baseado no amor, e o ilegítimo, baseado na inveja. O ciúme legítimo aparece quando alguém que você ama, que pertence a você, desvia o coração e lhe substitui por outra pessoa. Se a mulher tem um caso amoroso e se entrega a outra pessoa, seu esposo tem um ciúme justificado por causa do amor que ele tem por ela. Ele está ansioso para ter de volta o que é seu por direito.

A Bíblia descreve Deus como tendo esse tipo de ciúme justo pelo Seu povo. Isso não quer dizer que Ele tem inveja de nós, desejando ter o que temos (mesmo porque Ele já possui tudo).

Quer dizer que Ele sente saudade de nós, desejando que Ele seja nosso primeiro amor. Ele não quer que deixemos que outras coisas venham antes d’Ele em nosso coração. A Bíblia nos adverte a adorar somente a Deus, porque "o Senhor, seu Deus, é zeloso; é fogo consumidor." (Deuteronômio 4:24).

Com isso em mente, tiramos o nosso foco do tipo de ciúme ilegítimo, o que se opõe ao amor; aquele que tem origem no egoísmo, onde ter ciúme de alguém é o mesmo que ser "movido com inveja."

Você luta contra o ciúme? Sua amiga é mais popular e você sente ódio dela por isso. Seu colega de trabalho ganha uma promoção e você não consegue dormir à noite. Ele deve ter feito tudo errado, mas você se tornou amargurado por causa do seu sucesso. Dizem que as pessoas ficam felizes com nosso sucesso, desde que não seja maior do que o delas.

O ciúme é uma luta comum. Ele é ativado quando alguém "passa a sua frente" e consegue algo que você quer. Isso pode ser muito doloroso dependendo do seu nível de egoísmo. Em lugar de parabenizá-lo, você se enche de raiva e pensa maldades a respeito dele. Se não tomarmos cuidado, o ciúme rastejará como uma cobra em nosso coração e acabará com as nossas motivações e com os nossos relacionamentos. Ele pode nos envenenar a não viver a vida que o Senhor deseja.

Se não acabarmos com a nossa raiva aprendendo a amar os outros, provavelmente conspiraremos contra eles. A Bíblia diz que a inveja nos leva a confusão, a briga e a toda espécie de males (Tiago 3:16, 4:1-2).

Existe uma seqüência de ciúmes ilegítimos nas Escrituras. Ele causou o primeiro assassinato quando Caim desprezou a aceitação de Deus à oferta do seu irmão. Sara mandou sua criada embora porque Hagar podia gerar filhos, enquanto ela não. Os irmãos de José viram que ele era o preferido de seu pai, então eles o jogaram em um poço e o venderam como escravo. Jesus foi mais amoroso, poderoso e popular que o principal dos sacerdotes, então eles tramaram Sua traição e crucificação.

Na maioria das vezes, não temos inveja de estranhos. Aqueles por quem sentimos ciúmes estão, primeiramente, na mesma esfera que nós. Eles trabalham em nosso escritório, jogam em nosso time, estão em nosso círculo de amizade... Ou moram em nossa casa. Sim, se não vigiarmos, a inveja pode, também, contagiar nosso casamento.

Quando você se casou, assumiu o papel de maior torcedor e de capitão do fã clube do seu cônjuge. Vocês se tornaram um e compartilharam da alegria um do outro. Mas, se o egoísmo entrar, qualquer coisa boa que aconteça com apenas um de vocês pode ser um estimulante para a inveja ao invés da parabenização.

Ele pode estar jogando golfe no final de semana, enquanto ela está limpando a casa. Ele se sente o máximo por conseguir um bom placar, e ela sente vontade de atirar nele.

Ou, talvez, ela é constantemente convidada para sair com as amigas enquanto ele fica em casa com o cachorro. Se ele não vigiar, ele pode se ofender com a popularidade dela.

Em virtude do amor não ser ciumento e sim colocar os outros à sua frente, ele se recusa a permitir que o ciúme entre. O amor lhe conduz a celebrar o sucesso do seu cônjuge ao invés de se ressentir dele. Um esposo amoroso não se importa se a sua esposa for melhor em algumas coisas, se divertir mais, ou ganhar mais aplausos. Ele a vê como um complemento dele, não como uma concorrente.

Quando ele recebe louvor, ele a agradece publicamente pelo suporte em ajudá-lo em seu sucesso. Ele se recusa a vangloriar-se de forma que ela se sinta ressentida. Uma esposa amorosa será a primeira a se alegrar pelo marido quando ele vencer. Ela não compara suas fraquezas com as forças dele. Em lugar de se lamentar, ela dá uma festa de celebração.

É hora de deixar o amor, a humildade e a gratidão destruir todo o ciúme que nasce em seu coração. É hora de deixar o sucesso de seu cônjuge unir vocês e lhe proporcionar grandes oportunidades de mostrar amor genuíno.

» Desafio de hoje »

Decida ser o maior fã do seu cônjuge, e decida rejeitar qualquer pensamento invejoso. Para ajudá-lo a manter o coração em seu cônjuge e a focar nas conquistas dele, pegue a lista de atributos negativos que você fez ontem e, discretamente, queime-a. Depois, compartilhe com seu cônjuge o quanto você está feliz com o sucesso que ele conquistou recentemente.

- Anote aqui quando o desafio de hoje estiver completo.

Foi difícil queimar a lista? Quais são os aspectos positivos na vida de seu cônjuge que deixam você feliz? Como você pode encorajá-lo a obter sucessos futuros?

Alegrem-se com os que se alegram; chorem com os que choram. (Romanos 12:15)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 9 - O Amor deixa boas impressões$t$, 10,
$conteudo$Saúdem uns aos outros com beijo de santo amor.

1 Pedro 5:14

Tratamos de alguns fundamentos sérios ao longo dessa jornada. Aprender a demonstrar aspectos do amor como a paciência, a bondade e o encorajamento nem sempre é fácil, mas certamente é crucial para um relacionamento saudável. Dessa forma, a preocupação com a maneira como tratamos nosso cônjuge diariamente pode parecer inconseqüente, mas essa simples questão carrega surpresas significantes. A maneira como um casal cumprimenta um ao outro, pode dizer muito a respeito de como anda o relacionamento dele. Isso pode ser notado em suas expressões e feições, assim como na maneira pela qual eles falam um com o outro. Fica ainda mais óbvio pelo seu contato físico. Mas qual a importância que devemos dar a um cumprimento?

A Bíblia tem mais a dizer sobre maneiras de tratar os outros do que podemos imaginar. O apóstolo Paulo separou um tempo para encorajar seus leitores a cumprimentar calorosamente o próximo quando o encontrasse. Na verdade, ao final da sua carta aos Romanos, Paulo pediu aos seus companheiros cristãos para cumprimentar vinte e sete dos seus amigos e amados. Ele até gastou tempo fazendo uma lista com o nome de cada um desses amigos e amados.

Contudo, não devemos agir assim apenas com os nossos amigos. Jesus apontou no Sermão da Montanha que até os pagãos falam gentilmente com as pessoas que gostam. Isso é fácil para qualquer um. Mas, Ele dá um passo além e diz "que ser temente a Deus inclui ser humilde e gracioso o suficiente para tratar com bondade até os inimigos.

Isso levanta uma questão interessante. Como cumprimentamos os nossos amigos, colegas de trabalho e os nossos vizinhos? E os nossos familiares e aqueles que encontramos em público?

Podemos até encontrar alguém de quem não necessariamente gostamos, mas mesmo assim tratá-lo com cortesia. Então, se somos tão agradáveis e educados com os outros, nosso cônjuge não merece o mesmo multiplicado por dez?

Essa é uma questão que você provavelmente não pensa com freqüência - a primeira coisa que dizemos a ele quando acordamos de manhã, o olhar quando entramos no carro, o entusiasmo na voz quando falamos ao telefone. Mas aqui está outra questão que também não é pensada com freqüência - a diferença que pode fazer no dia do seu cônjuge se tudo em você expressar o fato de que está muito, muito feliz em vê-lo.

Quando alguém diz que está feliz em nos ver, a nossa auto-estima aumenta. Nos sentimos mais importantes e valorizados. É porque um bom cumprimento prepara o caminho para uma interação positiva e saudável. Assim como o amor, ele traz o vento à nossa navegação.

Pense novamente na história que Jesus contou do filho pródigo. Este jovem rebelde exigiu em dinheiro a sua herança e depois gastou tudo com um estilo de vida imprudente. Mas logo as conseqüências de suas más escolhas apareceram, e ele se viu comendo restos em um chiqueiro. Humilhado e envergonhado, ele treinou suas desculpas e pensou na melhor maneira de voltar para casa e encarar seu pai. Porém, o cumprimento que ele estava esperando não foi exatamente o que recebeu. "Estando ainda longe, seu pai o viu e, cheio de compaixão, correu para seu filho, e o abraçou e beijou" (Lucas 15:20). De tudo o que-esse jovem idealizou, a atitude do pai foi, provavelmente, a última que ele esperava. Mas como você acha que ele se sentiu ao receber o abraço e ao ouvir o tom de gratidão de seu pai? Sem dúvida, ele se sentiu mais uma vez amado e precioso. O que você acha que isso fez no relacionamento deles?

Que tipo de cumprimento faria nosso cônjuge se sentir assim? Como podemos despertar os seus sentidos com uma simples palavra, um simples toque, um tom de voz? Um cumprimento amoroso pode abençoar o nosso cônjuge pelo que ele vê, ouve e sente.

Pensemos nas oportunidades que temos de cumprimentar um ao outro. Ao entrar em casa. Ao encontrar para almoçar. Ao dizer boa noite. Ao falar por telefone. Não precisamos ser ousados e dramáticos todas as vezes. Mas acrescentar ternura e entusiasmo aos cumprimentos nos dá a chance de tocar o coração do nosso cônjuge de maneiras delicadas e sem palavras.

Pense sobre as suas saudações. Você as utiliza adequadamente? Seu cônjuge se sente precioso e apreciado? Ele se sente amado? Mesmo quando você não está bem, pode aliviar a tensão e valorizá-lo no modo como o cumprimenta.

Lembre-se sempre, amar é uma escolha. Então, escolha mudar a maneira como cumprimenta. Escolha amar.

» Desafio de hoje »

Pense em uma maneira especial de cumprimentar o seu cônjuge hoje. Faça isso com um sorriso e com entusiasmo. Então, decida mudar a maneira como o cumprimenta de modo que reflita o seu amor por ele.

- Anote aqui quando o desafio de hoje estiver completo.

Quando e onde você escolheu fazer o seu cumprimento especial? Como você vai mudar o modo como cumprimenta seu cônjuge a partir de hoje?

Seu amor me tem dado grande alegria e consolação. (Filemon 7)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 10 - O Amor é incondicional$t$, 11,
$conteudo$Mas Deus demonstra o Seu amor por nós: Cristo morreu em nosso favor quando ainda éramos pecadores. - Romanos 5:8

Se alguém perguntasse, "Por que você ama a sua esposa?" ou "Por que você ama o seu marido?" - o que você diria?

A maioria dos homens mencionaria a beleza de sua esposa, seu senso de humor, sua bondade ou sua força interior. Talvez falasse da sua comida, do seu bom gosto para decoração ou quem sabe da boa mãe que ela é.

As mulheres provavelmente diriam algo sobre a aparência de seu marido ou sobre sua personalidade. Elas o elogiariam pela estabilidade ou pelo caráter. Elas poderiam dizer que o amam porque ele está sempre presente. Ele é generoso. Ele é ajudador. Mas e se dentro de alguns anos o seu cônjuge perdesse todas essas coisas? Você ainda o amaria? Baseado nas respostas acima, a única resposta lógica seria "não". Se as suas razões para amar seu cônjuge têm ligação com as qualidades dele - e se essas qualidades, de repente ou gradualmente, desaparecerem - a sua base para amar se vai.

A única maneira de o amor durar por toda uma vida é se ele for incondicional. A verdade é: o amor não é determinado por estar apaixonado, pelo contrário, ele é determinado por escolher amar.

A Bíblia se refere a essa espécie de amor utilizando a palavra grega ágape. Ele se difere dos outros gêneros de amor que são: philos (amizade) e eros (amor sexual). Ambos, amizade e sexo, têm lugar importante no casamento, claro, e são definitivamente partes da casa que construímos juntos como marido e mulher. Contudo, se o casamento depende totalmente de ter interesses em comum ou de uma vida sexual saudável, então a sua fundação é instável.

Pbilos e eros são mais responsivos por natureza e podem flutuar baseados em sentimentos. O amor ágape, por outro lado, é desprendido e incondicional. Então, ao menos que essa espécie de amor forme a fundação do casamento, o desgaste e as rachaduras do tempo irão destruí-lo. O amor ágape é aquele "na saúde ou na doença", "na riqueza ou na pobreza", "até que a morte os separe". É o único gênero de amor que é verdadeiro.

Ele é assim porque é o gênero do amor de Deus. Ele não nos ama porque somos louváveis, mas porque Ele é amor. A Bíblia diz, "Nisto consiste o amor: não em que nós tenhamos amado a Deus, mas em que Ele nos amou e enviou Seu Filho como propiciação pelos nossos pecados" (1 João 4:10). Se Ele insistisse que nos provássemos dignos de Seu amor, falharíamos miseravelmente. Mas o amor de Deus é uma escolha que Ele faz inteiramente por Ele mesmo. É algo que recebemos d’Ele e então compartilhamos com outros. "Nós amamos porque Ele nos amou primeiro" (1 João 4:19).

Se um homem diz à sua esposa, "Eu não lhe amo mais", ele na verdade está dizendo, "Eu nunca lhe amei incondicionalmente desde o início". Seu amor era baseado em sentimentos ou circunstâncias, não em compromisso. É nisso que resulta a construção de um casamento alicerçado no amor pbilos ou eros. Precisa haver no casamento uma fundação mais forte que a amizade ou a atração sexual. O amor incondicional, isto é, o amor ágape, não será governado pelo tempo ou pelas circunstâncias. Isso não quer dizer, no entanto, que o amor que começa por razões erradas não pode ser restaurado e redimido. De fato, quando um casamento é reconstruído com o amor ágape na sua fundação, então os aspectos da amizade e do romance se tornam ainda mais intensos do que antes. Quando a apreciação um do outro como melhores amigos e como amantes é baseada em um compromisso inabalável, experimentamos uma intimidade que não pode ser adquirida de nenhuma outra forma.

Porém, se não permitirmos que Deus plante o Seu amor dentro de nós, iremos lutar e fracassar na busca por esse tipo de casamento. O amor que "tudo sofre, tudo crê, tudo espera, tudo suporta" (1 Coríntios 13:7) não vem de dentro. Ele só pode vir de Deus.

A Bíblia diz que "Porque estou certo de que, nem a morte, nem a vida, nem anjos, nem principados, nem coisas presentes, nem futuras, nem potestades, nem a altura, nem a profundidade, nem qualquer outra criatura nos poderá separar do amor de Deus, que está em Cristo Jesus nosso Senhor" (Romanos 8:38- 39). Esta é a espécie do amor de Deus. E felizmente - por uma escolha nossa - essa pode se tornar a espécie do nosso amor. Mas primeiro precisamos recebê-lo e compartilhá-lo.

E não se surpreenda caso seu cônjuge comece a viver confiantemente à sombra desse amor, se ele se tornar ainda mais adorável com você. Você não dirá mais: "Eu lhe amo porque... ", você dirá: "Eu amo você e ponto final."

» Desafio de hoje »

Faça algo fora do normal para o seu cônjuge - algo que prove (para você e para ele) que o seu amor é baseado em suas escolhas e em nada mais. Lave o carro dela. Limpe a cozinha. Compre a sobremesa favorita dele. Dobre as roupas lavadas. Demonstre amor pela simples alegria de serem parceiros no casamento.

- Anote aqui quando o desafio de hoje estiver completo.

Seu amor era baseado nos atributos e comportamentos do seu cônjuge, ou em seu compromisso? Como você pode continuar demonstrando amor quando ele não retoma da maneira como você espera?

___ Aquele que confia no Senhor, a mi sericórdia o cerca, (Salmos 32:10)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 11 - O Amor cuida$t$, 12,
$conteudo$Assim devem os maridos amar a suas próprias mulheres, como a seus próprios corpos - Efésios 5:28

Considere essas duas situações.

Um homem tem sérios problemas com seu carro velho, então ele o leva ao mecânico. Depois que uma avaliação é feita, ele descobre que o carro precisa de uma revisão geral, o que custaria boa parte do seu orçamento. Por causa do alto custo do reparo, ele decide abrir mão do carro e gastar suas economias em um veículo novo. Parece lógico certo?

Outro homem, um engenheiro, acidentalmente comprime sua mão em um equipamento. Ele corre para o hospital, tira o raio-x, descobrindo que existem vários ossos quebrados.

Apesar de frustrado e com muitas dores, ele utiliza suas finanças de bom grado para ter a mão medicada e restaurada. Então, o engenheiro cuidadosamente trata dela de forma que, nos meses seguintes, seja restabelecida. Este caso, provavelmente, também lhe parece lógico.

O problema com a nossa cultura é que o casamento é tratado mais como o primeiro caso. Quando o seu relacionamento passa por dificuldade, você é encorajado a trocar a sua esposa por um "modelo mais novo". Mas aqueles que têm essa visão não entendem o laço significante entre um esposo e uma esposa. A verdade é: o casamento é mais como o segundo caso. Somos parte um do outro. Você nunca arrancaria a sua mão se ela estivesse ferida, mas pagaria o que pudesse pelo melhor tratamento médico possível. Isso acontece porque a sua mão é muito valiosa para você. Ela é parte de quem você é assim como seu cônjuge. O casamento é um lindo mistério criado por Deus, juntar duas vidas como sendo uma. Isso não só acontece fisicamente, mas espiritualmente e emocionalmente. Você começa compartilhando a mesma casa, a mesma cama, o mesmo sobrenome. Sua certidão individual se tornou uma. Quando o seu cônjuge sofre uma tragédia, ambos sentem a dor. Quando você alcança sucesso no trabalho, ambos se alegram. Mas em algum ponto ao longo do caminho, você é desapontado e a realidade de que se casou com uma pessoa imperfeita se manifesta.

Isso, contudo, não muda o fato do seu cônjuge ainda ser parte de você. Efésios 5:28

diz, "Assim devem os maridos amar a suas próprias mulheres, como a seus próprios corpos. Quem ama a sua mulher, ama-se a si mesmo".

Esse versículo é direcionado aos maridos, mas note como cada membro é visto. Ambos são considerados mesma carne. Ele deve ser tratado com a mesma educação e com o mesmo cuidado com que você se trata. Quando demonstramos amor ao nosso cônjuge, estamos demonstrando amor a nós mesmos.

Mas existe outro lado dessa moeda. Quando você maltrata seu cônjuge, também maltrata a si mesmo. Pense nisso. A vida de vocês está agora trançada uma à outra. O seu cônjuge não pode sentir alegria ou dor, receber bênção ou maldição, sem que você também seja afetado. Então, quando você ataca o seu cônjuge é como atacar o seu próprio corpo.

É hora de deixar o amor dominar seu pensamento. É hora de entender que seu cônjuge é tão parte de você quanto sua mão, seus olhos ou seu coração. Ela também precisa ser amada e cuidada. E se existe algo causando dor e frustração, então você deve tratar disso com o mesmo amor e ternura como trataria uma ferida corporal. Se ele de alguma forma está machucado, você deve se ver como um instrumento que ajuda a levar cura para sua vida.

À luz disso, pense em como você trata o corpo físico do seu cônjuge. Você cuida dele como cuida do seu? Você se dirige a ele com respeito e ternura? Você sente prazer em quem ele é? Ou faz se sentir tolo e envergonhado? Assim como você aprecia os seus próprios olhos, mãos e pés, você deve apreciar o seu cônjuge como quem aprecia um presente muito caro.

Não permita que a cultura ao seu redor determine o valor do casamento. Compará-lo a algo que pode ser descartado ou substituído é desonrar o propósito de Deus para ele. Seria como amputar um membro do seu corpo. Ao invés disso, o casamento deve ser o retrato do amor entre duas pessoas imperfeitas que escolheram amar uma a outra apesar de tudo.

Sempre que o marido olha nos olhos da esposa, ele deve se lembrar de que "aquele que ama a sua esposa ama a si mesmo". E a esposa deve lembrar-se de que quando ela o ama, ela também está amando e honrando a ela mesma.

Quando você olha para o seu cônjuge, está olhando para I fina parte de você. Então, trate bem a sua esposa. Fale bem II. Dele. Nutra e cuide do amor da sua vida.

» Desafio de hoje »

Quais as necessidades da sua esposa ou do seu marido hoje podem ser supridas por você hoje? Você pode adiar uma viagem de negócios? Fazer uma massagem nas costas ou no pé dela)? Tem algum trabalho doméstico onde possa ajudar? Escolha um gesto olje dfga, "eu cuido de você" e faça isso com um sorriso.

- Anote aqui quando o desafio de hoje estiver completo.

O que você escolheu fazer para mostrar que cuida do seu cônjuge? O que você aprendeu com essa experiência?

"O que você quer que eu lhe faça?”; perguntou-lhe Jesus. (Marcos 10:51)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 12 - O Amor deixa o outro vencer$t$, 13,
$conteudo$Não olhe cada um somente para o que é seu, mas cada qual também para o que é dos outros. - Filipenses 2:4

Se lhe pedissem para citar três áreas onde você e seu cônjuge discordam, você seria capaz de fazer isso sem pensar muito. Você pode até ser capaz de fazer uma lista das dez primeiras se lhe dessem mais alguns minutos. E infelizmente, ao menos que um de vocês ceda, essas mesmas questões estarão sempre entre você e seu cônjuge. Infelizmente, a teimosia chega como uma característica padrão do modelo de ambos, marido e esposa. Defender nossos direitos e opiniões faz parte da nossa natureza e construção.

Porém, pode ser algo destrutivo em um casamento, e isso rouba tempo e a produtividade. Pode também ser a causa de grandes frustrações para ambos. Contudo, não é sempre ruim ser teimoso. Algumas coisas são dignas de defesa e proteção. Nossas prioridades, moral e obediência a Deus devem ser guardadas com grande esforço. Mas, na maioria das vezes debatemos por coisas insignificantes, como a cor da parede ou a escolha do restaurante.

Outras vezes, claro, o assunto é mais sério. Um deseja ter mais filhos; o outro não. Um deseja passar as férias com toda família, o outro não. Um deseja que as crianças estudem em uma escola particular; o outro prefere que elas passem para uma escola federal. Um pensa que é hora de um aconselhamento para casais ou acha que podem estar mais envolvidos com a igreja, enquanto o outro não.

Apesar dessas questões não surgirem todos os dias, elas volta e meia aparecem e não vão embora. Parece que nunca chegaremos a uma solução ou a um acordo. Isso acaba se tornando uma obstinação. É como dirigir com o freio de mão puxado. Só existe uma maneira de escapar de becos sem saída como esses e essa solução é encontrada em uma palavra contrária a teimosia - uma palavra que já vimos enquanto discutíamos a bondade. Essa palavra é "disposição". É uma atitude, um espírito de cooperação que deve permear as nossas conversas. É como palmeira à beira do oceano, que resiste aos ventos fortes porque sabe como se curvar de forma graciosa. E o maior exemplo disso é Jesus Cristo, como está escrito em Filipenses 2. Siga a instrução do Seu amor desprendido...

Como Deus, Ele tinha todo o direito de recusar se tornar homem, mas Ele se entregou e fez - porque Ele estava disposto. Ele tinha o direito de ser servido por toda humanidade, mas veio para nos servir. Ele tinha o direito de viver em paz e segurança, mas, de bom grado, rendeu a Sua vida por causa dos nossos pecados. Ele se dispôs até mesmo a suportar a tortura da cruz. Ele amou, cooperou e se colocou sob a vontade de Seu Pai, ao invés da sua própria vontade.

À luz desse maravilhoso testemunho, a Bíblia nos deixa, em resumo, a seguinte frase: "Tende em vós aquele sentimento que houve também em Cristo Jesus" (Filipenses 2:5) - o sentimento de disposição, flexibilidade, submissão e humildade. Significa renunciar pelo bem dos outros, o que temos direito de exigir para nós mesmos. A única conseqüência de suas atuais discussões será que ambos continuarão inflexíveis. Mas no momento em que um dos dois decidir dizer "Eu abro mão da minha opinião para fazer à sua maneira hoje", a discussão vai terminar. E apesar desta atitude nos custar o orgulho e o desconforto, faremos um investimento de amor eterno em nosso casamento. "Sim, mas depois eu vou parecer um bobo. Eu vou perder na discussão. Eu vou perder o controle da situação". Nós parecíamos bobos quando éramos teimosos e nos recusávamos a ouvir. Já perdemos na discussão quando fizemos dela algo mais importante que nosso casamento e a auto-estima do nosso cônjuge. Já perdemos o controle emocional quando dissemos coisas que ofenderam e feriram nosso cônjuge.

A coisa mais sábia e amorosa a se fazer é começar a encarar os desentendimentos com a disposição de nem sempre insistir em fazer as coisas à nossa maneira. Isso não quer dizer que o nosso cônjuge está necessariamente certo ou sendo sábio no que diz respeito a um problema, mas significa que estaremos levando sua preferência em consideração, como forma de valorizá-lo.

O melhor conselho do amor vem da Bíblia, que diz, "Mas a sabedoria que vem do alto é antes pura; depois pacífica, amável, compreensiva" (Tiago 3: 17). Em lugar de tratar nosso cônjuge como inimigo ou como alguém de quem devemos nos proteger, comecemos a tratá-lo como nosso melhor e mais apreciado amigo. Vamos dar às suas palavras grande importância.

Não, não temos que estar sempre de comum acordo. Não temos que ser cópias um do outro. Se fôssemos, um de nós seria desnecessário. Duas pessoas que sempre compartilham as mesmas opiniões e perspectivas não têm o equilíbrio e sabor que aprimoram o relacionamento. Assim, as diferenças existentes entre duas pessoas são para aprendizado.

Você está disposto a se curvar para demonstrar amor ao seu cônjuge? Ou você se recusa a ceder por causa do orgulho? Se para você isso não tem importância ao longo do caminho - especialmente na eternidade - então, abra mão dos seus direitos e escolha honrar o seu amor. Será bom tanto para você quanto para o seu casamento.

» Desafio de hoje »

Demonstre amor através da disposição, escolhendo ceder em uma área de desacordo entre você e seu cônjuge. Diga a ele que você está colocando a preferência dele em primeiro lugar.

- Anote aqui quando o desafio de hoje estiver completo.

Do que você decidiu abrir mão hoje? O que isso lhe custou? Como isso irá lhe ajudar no futuro?

Se for possível, quanto depender de vós tende paz com todos os homens. (Romanos 12: 18)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 13 - O Amor é justo$t$, 14,
$conteudo$Se uma casa se dividir contra si mesma, tal casa não poderá subsistir. - Marcos 3:25

Querendo ou não, os conflitos no casamento são simplesmente inevitáveis. Quando vocês selaram o casamento como noivo e noiva, não juntaram apenas suas esperanças e sonhos, juntaram também o coração, temores, imperfeições e carga emocional. A partir do momento em que saíram da lua de mel, iniciaram o processo real de descoberta um do outro, desagradavelmente percebendo o quão pecador e egoísta cada um pode ser.

De repente, o seu cônjuge escorrega do seu pedestal e você do dele. A aproximação forçada do casamento começou a remover a farsa pública, expondo seus problemas pessoais e hábitos, retos. Bem vindo à humanidade falha.

Ao mesmo tempo, as tempestades da vida começaram a lhe provar e a revelar do que você é feito realmente. Exigências do trabalho, problemas de saúde, discussões familiares e necessidades financeiras incendiaram o casamento em vários aspectos, acrescentando pressão e calor ao relacionamento. Isto prepara o caminho para que desentendimentos ocorram entre os casais. Discutimos e brigamos. Ferimos. Vivemos em conflito. Mas não estamos sozinhos.

Todos os casais passam por tempestades. Faz parte do casamento. Mas nem todos os casais sobrevivem à elas.

Então, não pense que fazer o desafio de hoje acabará com todos os conflitos do casamento. Pelo contrário, pôr em prática este desafio lhe ajudará a lidar com o conflito de forma que vocês saiam saudáveis do outro lado. Os dois, juntos. O dano mais profundo, mais doloroso que um dia podemos cometer (ou já cometemos) no casamento, está mais propício a acontecer em meio ao conflito. E porque é no conflito que o nosso orgulho é forte, nossa raiva é fervente. Somos mais egoístas e críticos. Nossas palavras são venenosas. Tomamos as piores decisões. Um casamento pode começar muito bem na segunda e ficar mal na terça, se conflitos desenfreados assumirem o controle e se nenhum de nós tiver o pé no freio.

Mas o amor chega e modifica as coisas. O amor nos lembra que nosso casamento é valioso demais para permitirmos que se autodestrua, e que o nosso amor por nosso cônjuge é mais importante que qualquer discussão. O amor nos ajuda a instalar air bags e construir corrimãos em nosso relacionamento. Isso nos faz lembrar que os conflitos podem, na verdade, se transformar em algo bom. Os casais que aprendem a viver em meio a conflitos tendem a ser mais chegados, mais confiantes, mais íntimos, e a viver, subseqüentemente, um relacionamento mais profundo.

Mas como? A maneira mais sábia é aprender a discutir com clareza, estabelecendo regras saudáveis para conflitos. Se não houver um guia de como abordar tópicos sérios, não haverá limites quando a discussão esquentar.

Basicamente, existem dois tipos de limites para lidar com conflitos: os limites "nós" e os limites "eu".

Os limites "nós" são regras que ambos concordam de antemão, regras que se aplicam durante qualquer briga ou discussão. Cada um de nós tem o direito de gentilmente, mas diretamente, relembrar esses limites quando forem violados. Eles podem incluir:

1. Nunca mencionaremos divórcio.

2. Não levantaremos casos antigos e irrelevantes do passado.

3. Nunca iremos brigar em público ou na frente de nossos filhos.

4. Daremos um tempo se o conflito chegar a um nível nocivo.

5. Nunca tocaremos um no outro de modo ofensivo.

6. Nunca dormiremos com raiva um do outro.

7. O fracasso não é uma opção. Faremos o que for necessário para sairmos bem dele.

Os limites "eu" são regras que praticamos pessoalmente, por nossa conta. Aqui estão alguns dos exemplos mais eficientes:

1. Eu ouço primeiro para depois falar. "Sabei isto, meus amados irmãos: Todo homem seja pronto para ouvir, tardio para falar e tardio para irar-se" (Tiago 1: 19).

2. Eu lidarei com meus problemas honestamente. "E por que vês o argueiro no olho do teu irmão, e não reparas na trave que está no teu olho?" (Mateus 7:3)

3. Falarei com gentileza e manterei o meu tom de voz baixo. "A resposta branda desvia o furor, mas a palavra dura suscita a ira" (Provérbios 15: 1).

Discutir justamente significa trocar as nossas armas. Desentendimentos com dignidade resultam de construir uma ponte ao invés de destruir. Lembremos: Amar não é uma batalha, mas é sempre digno de batalha.

» Desafio de hoje »

Converse com o seu cônjuge e estabeleça regras saudáveis de conflito. Se o seu cônjuge não estiver pronto para isso, então escreva os seus limites pessoais para a "briga". Decida colocá-los em prática quando o próximo desentendimento ocorrer.

- Anote aqui quando o desafio de hoje estiver completo.

Se o seu cônjuge participou com você, qual foi a reação dele? Que regras você escreveu para si mesmo?

Sedes unânimes entre vós. (Romanos 12:16)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 14 - O Amor sente prazer$t$, 15,
$conteudo$Goza a vida com a mulher que amas, todos os dias da tua vida vã. - Eclesiastes 9:9

Uma das coisas mais importantes que você deve aprender em sua jornada de O Desafio de Amar é que não deve somente seguir o seu coração. Você deve guiá-lo. Não permita que seus sentimentos e emoções assumam o controle. Coloque-os no banco de trás e diga para onde está indo.

Em seu casamento, nem sempre você se sente apaixonado. Seu coração não dispara constantemente com a idéia de passar todos os momentos com o seu cônjuge. Ninguém consegue manter o desejo ardente de estar junto somente com sentimentos. Contudo, também é muito difícil amar alguém só por obrigação.

Os recém casados deleitam-se naquele que agora chamam de cônjuge. Seu amor é recente e jovem, e a esperança por um futuro romântico ganha espaço no coração deles. Porém, existe algo tão poderoso quanto aquele amor recente, novo. Vem da decisão de se deleitar no esposo ou esposa e amá-lo (a), não importando o tempo que estão casados. Em outras palavras, o amor que escolhe amar é tão poderoso quanto o amor que se sente amando. Sob vários aspectos, é um amor ainda mais verdadeiro porque mantém os olhos bem abertos.

Sempre nos comportaremos de forma reprovável um com o outro. Ela vai lhe dar nos nervos. Ele vai lhe irritar. Mas os dias passam muito rápido para serem desperdiçados com discussões por coisas pequenas. A vida é curta demais para isso. Ao contrário, é hora de guiar o coração para mais uma vez se deleitar em seu cônjuge. Aprecie-o. Segure suas mãos e busque sua companhia. Deseje conversar com ele. Lembre-se do motivo que fez você se apaixonar pelo seu caráter. Aceite sua personalidade - manias e tudo o mais – e receba-o com alegria, mais uma vez, em seu coração.

Mais uma vez, você escolhe o que aprecia. Você não nasceu com certas configurações e preferências específicas para agir de acordo com elas. Se você é irritante, é porque escolheu ser assim. Se você só consegue trabalhar com uma casa limpa, é porque não escolheu outra maneira de agir. Se critica seu cônjuge mais do que elogia, é porque está permitindo que seu coração seja egoísta. Você tem se conduzido à crítica. Então agora é a hora de recuar seu coração. É hora de aprender a sentir prazer em seu cônjuge mais uma vez, e não mais esperar que seu coração sinta prazer em quem ele é.

Pode ser surpreendente para você saber que a Bíblia contém muitas histórias românticas, nenhuma mais atrevida e provocante do que os oito capítulos de Cantares de Salomão. Veja a maneira como esses dois apaixonados sentem prazer um no outro neste livro poético...

A mulher: "Qual a macieira entre as árvores do bosque, tal é o meu amado entre os jovens; com grande gozo sentei-me à sua sombra; e o seu fruto era doce ao meu paladar. Levou-me à sala do banquete, e o seu estandarte sobre mim é o amor (Cantaresde Salomão 2:3-4).

O homem: "Levanta-te, amada minha, formosa minha, e vem! Pomba minha, que andas pelas fendas das penhas, no oculto das ladeiras, mostra-me o teu semblante faze-me ouvir a tua voz; porque a tua voz é doce, e o teu semblante formoso (Cantares de Salomão 2: 13- 14).

Sentimental demais? Vigoroso demais? Não para aqueles que direcionam seu coração a se deleitar no amor da sua vida - mesmo quando o vigor desaparece, mesmo quando ela está usando rolos no cabelo, mesmo quando os cabelos dele estão caindo. É hora de lembrarmos por que nos apaixonamos. É tempo de rir e sonhar novamente, prazerosamente.

O desafio de hoje lhe direciona a uma mudança de coração real e radical. Para alguns, o movimento em direção ao deleite pode ser apenas um pequeno passo adiante. Para outros, esse movimento requer um salto gigante para fora de uma repugnância crônica. Mas se você já sentiu prazer antes - o mesmo de quando se casou - você pode se deleitar de novo. Mesmo se isso aconteceu há muito tempo. Mesmo se grandes mudanças ocorreram para mudar sua percepção.

É sua a responsabilidade de reaprender o que ama nesta "nova" pessoa, para quem você se prometeu para sempre.

» Desafio de hoje »

Propositadamente, negligencie uma atividade que normalmente faria. Para gastar um tempo de qualidade com o seu cônjuge. Faça algo que ele amaria fazer, ou um projeto que ele gostaria muito de realizar. Apenas estejam juntos.

- Anote aqui quando o desafio de hoje estiver completo.

Do que você decidiu abrir mão? O que vocês fizeram juntos? Como foi que aconteceu? Que novas coisas você aprendeu (ou reaprendeu) a respeito do seu cônjuge?

Dá-me o teu coração... e deleitem-se os teus olhos nos meus caminhos. (Provérbios 23:26)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 15 - O Amor é nobre$t$, 16,
$conteudo$Igualmente vós, maridos, vivei com elas com entendimento, dando honra à mulher, como sendo elas herdeiras convosco da graça da vida. - (J Pedro 3:7)

Existem certas palavras em nossa língua que têm significados poderosos. Sempre que essas palavras são utilizadas, um ar de respeito é associado a elas. Essas palavras nunca perdem sua qualidade, classe e dignidade. Uma dessas palavras será o nosso foco hoje. É a palavra honra.

Honrar alguém significa respeitá-lo e estimá-lo, tratá-lo como alguém especial e de grande importância. Quando falamos com eles, mantemos nossa linguagem clara e compreensiva. Somos educados e agradáveis. Quando eles falam conosco, levamos a sério o que dizem, dando à suas palavras peso e significância. Quando nos pedem algo, nós os servimos de todas as maneiras possíveis, simplesmente por respeito a quem são.

A Bíblia nos diz para "honrarmos" nosso pai e nossa mãe, assim como aqueles que têm autoridade. É um chamado para conhecer a posição ou o valor de alguém. Honra é uma palavra nobre.

Isso é especialmente verdadeiro no casamento. Honrar o cônjuge significa dar a ele total atenção: não falar com ele por trás do jornal ou com os olhos voltados para a televisão. Quando as decisões que afetam a ambos ou a toda família estão sendo tomadas, damos à voz e à opinião do nosso cônjuge a mesma influência em nossa mente. Honramos o que ele tem a dizer. Ele importa - e é através da maneira como o tratamos que deve saber disso.

Porém, existe outra palavra que nos convida a um lugar mais elevado, uma palavra que, na maioria das vezes, é banida do casamento, apesar de seu significado não poder ser contido. É uma palavra que, na verdade, forma a base da palavra honra - a verdadeira razão pela qual damos respeito e superioridade a nossa esposa ou marido. Esta palavra é santo.

Dizer que o seu (sua) esposo (a) é santo (a) para você não significa que ele (a) é perfeito (a). Santidade significa que ele (a) está separado (a) para um propósito maior - nada que seja comum ou cotidiano, mas especial e único. A pessoa que se tornou santa para você tem um lugar em seu coração que não pode ser ocupado por nenhum rival. Ela é sagrada para você, uma pessoa a ser honrada, elogiada e defendida.

Uma noiva cuida dessa maneira do seu vestido de noiva. Depois de usá-lo em seu dia especial, ela o cobre e o protege, depois o separa de tudo o mais em seu armário. Você não a vê usando o vestido enquanto trabalha no jardim ou enquanto vai à cidade. Seu vestido de noiva tem um valor por si mesmo. Desse ponto de vista, ele é santo e sagrado para ela.

Quando duas pessoas se casam, cada cônjuge se torna "santo" um para o outro, pela união do casamento. Isto significa que nenhuma outra pessoa no mundo inteiro tem o direito de receber este nível de compromisso e afeto de você. O seu relacionamento é incomparável. Você tem intimidade física só com ela, só com ele. Você edifica uma casa, cria seus filhos com essa pessoa. Seu coração, suas posses, sua vida é para ser absorvida em um laço incomum compartilhado com esse ser humano.

É assim que acontece em seu casamento? Seu cônjuge poderia dizer que você o honra e o respeita? Você o considera separado e valioso? Santo?

Talvez você não se sinta dessa maneira, e quem sabe até por uma boa razão. Talvez você deseje que alguém do lado de fora veja o nível de desrespeito que você recebe do seu marido ou da sua esposa - alguém que faça seu cônjuge se sentir envergonho ao expor o que realmente é dentro de casa.

Mas essa não é a questão do amor. O amor honra mesmo quando é rejeitado. O amor trata o seu amado como alguém especial e sagrado mesmo quando suas atitudes ingratas são tudo o que recebe de volta.

É maravilhoso, com toda certeza, quando um marido e uma esposa estão juntos nesse propósito, quando eles estão seguindo o mandamento bíblico "dediquem-se uns aos outros" em amor, quando eles "preferem dar honra aos outros" (Romanos 12: 10). O casamento deve ser honrado por todos e o leito conjugal deve ser conservado puro (Hebreus 13:4).

Mas quando seus esforços em honrar não são recíprocos, você deve honrar da mesma forma. É isso que o amor lhe desafia a fazer - a dizer "De todos os relacionamentos que eu tenho, darei mais valor ao nosso. De todas as coisas que estou disposto a sacrificar, sacrificarei o máximo por você. Com todas as suas falhas, pecados, erros e culpas passadas e presentes - eu ainda escolho amar e honrar você." É assim que uma atmosfera para que o amor seja reaceso é criada. É assim que conduzimos o nosso coração a novamente amar de verdade nosso cônjuge. Essa é a beleza da honra.

» Desafio de hoje »

Escolha uma maneira de demonstrar honra e respeito ao seu cônjuge que vá além da sua rotina. Pode ser abrir a porta para ela. Pode ser separar as roupas que ele irá vestir. Pode ser a forma como você ouve e fala com ele. Mostre ao seu cônjuge que ele é altamente honrado aos seus olhos.

- Anote aqui quando o desafio de hoje estiver completo.

Como você escolheu dar honra ao seu cônjuge? Quais foram os resultados? Que outras maneiras de demonstrar honra você pode utilizar nos próximos dias?

______________________________________________________________sairá deles ação de graças e a voz dos que se alegram; e multiplica-las-ei, e não serão diminuídos; glorificá-los-ei, e não serão apoucados. (Jeremias 30:19)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 16 - O Amor intercede$t$, 17,
$conteudo$Amado, desejo que lhe vá bem em todas as coisas, e que tenhas saúde, assim como bem vai à tua alma. - 3 João 2

Não podemos mudar o nosso cônjuge. Por mais que desejemos, não podemos agir como Deus, alcançar o coração do nosso cônjuge e transformá-lo no que queremos que ele seja. Mas é nisso que a maioria dos casais gastam boa parte do seu tempo - mudar seu cônjuge. A insanidade é conhecida por fazer a mesma coisa repetidamente e esperar resultados diferentes. Mas não é isso que acontece quando tentamos mudar nossa esposa ou nosso marido? É frustração ao nível mais elevado. Em algum ponto temos que aceitar que mudar o nosso cônjuge é algo que não podemos fazer. Mas aqui está o que podemos fazer. Podemos ser um "sábio fazendeiro".

Um fazendeiro não tem poder para fazer de uma semente, uma colheita frutífera. Ele não pode exigir manipular ou discutir com ela para gerar frutos. Mas ele pode plantar a semente em um solo fértil, regá-la e prover nutrientes, protegê-la das ervas daninhas, e então entregá-la nas mãos de Deus. Milhões de fazendeiros vivem deste processo há séculos. Eles sabem que nem todas as sementes germinam. Porém, a maioria crescerá se plantada em solo apropriado e se receber o que precisa. Não há nenhuma garantia de que alguma coisa neste livro mudará seu cônjuge, e além disso, o objetivo não é esse. Pelo contrário, o objetivo é lhe desafiar a amar. Se você levar a sério “O Desafio de Amar”, há uma grande probabilidade de ocorrer uma mudança pessoal em você, de dentro para fora. E se você realizar cada desafio, seu cônjuge será influenciado e o seu casamento florescerá diante dos seus olhos. Podem existir ervas daninhas. Pode até levar anos. Mas independente de como seja o solo onde você está plantando, você terá sucesso. O que precisa ser feito é retirar as ervas daninhas do casamento. É preciso nutrir o solo do coração do nosso cônjuge e então, depender de Deus para colher os resultados.

Contudo, não somos capazes de fazer isso sozinhos. Precisamos de algo que é mais poderoso que tudo o que temos. Esse algo é a oração eficaz.

A oração realmente funciona. É um fenômeno espiritual criado por um Deus ilimitado e poderoso. E ela produz grandes resultados.

Você está a ponto de desistir do seu casamento? Jesus disse para orar ao invés de desistir (Lucas 18:1). Está estressado e preocupado? A oração pode acalmar as tempestades (Filipenses 4:6-7). Você precisa de algo totalmente novo? A oração pode fazer a diferença (Atos 12: 1-17).

Deus é soberano. Ele faz as coisas à Sua maneira. Ele não é um gênio em uma lâmpada que realiza todos os nossos desejos. Mas Ele realmente nos ama e deseja ter um relacionamento íntimo conosco. E isso não acontece sem oração. Existem outros elementos chave que precisam estar em funcionamento para que a oração seja eficaz. Basta dizer que a oração funciona melhor quando vem de um coração humilde, que em um relacionamento correto com Deus e com os outros. A Bíblia diz,. "Confessai, portanto, os vossos pecados uns aos outros, e orai uns pelos outros... A súplica de um justo pode muito na sua atuação" (Tiago 5: 16).

Já se perguntou por que Deus lhe dá uma maravilhosa percepção dos defeitos escondidos do seu cônjuge? Você realmente acha que é para ser motivo de crítica constante? Não, é para ser motivo de oração constante. Ninguém conhece melhor o seu cônjuge que você. Suas censuras e críticas estão funcionando? A resposta é não, porque não é isso que muda um coração. Pelo contrário, é hora de tentar falar com Deus em oração. O marido descobrirá que Deus pode "consertar" a sua esposa bem melhor do que ele. A esposa lucrará mais através de estratégias de oração do que todos os seus esforços persuasivos. Esse é, também, um modo de viver bem mais prazeroso. Então, transforme suas reclamações em oração e veja o Mestre trabalhar enquanto você mantém suas mãos limpas. Se o seu cônjuge não tem nenhum tipo de relacionamento com Deus, então está claro o motivo pelo qual você precisa começar a orar. Além disso, comece a orar exatamente pelo que o seu cônjuge precisa. Ore pelo coração, pelas atitudes e pelas responsabilidades dele diante de Deus. Ore para que as mentiras se transformem em verdades. Ore para que o perdão substitua a mágoa. Ore por uma mudança genuína em seu casamento. E só então ore pelos desejos do seu próprio coração - para que o amor e a honra se tornem normais. Ore para que o romantismo e a intimidade alcancem um nível mais profundo.

Um dos atos mais amorosos que podemos fazer pelo nosso cônjuge é orar por ele. "Pedi, e dar-se-vos-à: buscai, e achareis; batei e abrir-se-vos-a" (Mateus 7:7).

» Desafio de hoje »

Comece hoje orando pelo coração do seu cônjuge. ore por três áreas. Específicas da vida dele onde você deseja que Deus trabalhe. Ore por seu casamento.

- Anote aqui quando o desafio de hoje estiver completo.

Você já experimentou o poder da oração? Pelo que você escolheu orar? Isso foi fácil ou lhe pareceu estranho? Para idéias sobre as chaves da oração específica, veja o apêndice.

Se alguém for temente a Deus, e fizer a sua vontade, a esse ele ouve. (Joâo 9:31}$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 17 - O Amor traz intimidade$t$, 18,
$conteudo$Aquele que cobre uma ofensa promove amor, mas quem a lança em rosto separa bons amigos. - Provérbios 17:9.

Podemos ser próximos de um amigo que conhecemos desde criança ou desde os dias da faculdade. Podemos ser próximos a um irmão ou irmã, a nossos pais, ou a um primo que tem aproximadamente a mesma idade que nós. Mas nada se compara a proximidade existente entre um marido e uma esposa. O casamento é o relacionamento mais íntimo do ser humano.

É por esta razão que precisamos muito da intimidade. Cada um de nós nasce com a necessidade inata de ser conhecido, amado e aceito. Queremos que as pessoas saibam nosso nome, nos reconheçam quando nos encontrarem e nos valorizem. A possibilidade de compartilhar nossa casa com outra pessoa que nos conhece até nos detalhes mais íntimos é parte do prazer mais profundo do casamento. Contudo, essa grande bênção é também terreno de seu maior perigo. Alguém que nos conhece tão intimamente pode nos amar como nunca imaginamos, ou pode nos ferir de formas, quem sabe, irrecuperáveis. Ela é tanto o fogo quanto o temor do casamento.

Qual desses dois você está experimentando em seu lar nesse momento? Os segredos que o seu cônjuge sabe sobre você são motivo de vergonha ou razão para ficarem mais próximos? Se seu cônjuge fosse responder a essa pergunta, ele diria que você o faz sentir seguro ou assustado?

Se o lar não é considerado um lugar de segurança, os dois serão tentados a buscá-la em qualquer outro lugar. Talvez em uma outra pessoa, iniciando um relacionamento que, ou flerta com o adultério ou realmente entra nele. Talvez possamos buscar conforto no trabalho ou em atividades ao ar livre, algo que nos separa parcialmente da intimidade, mas também nos mantém próximo às pessoas que nos respeitam e nos aceitam.

O marido ou a esposa não deve se sentir pressionado a ser perfeito para que receba aprovação. Ele (a) não deve andar sobre cascas de ovos com medo de fazer algo que desagradará o outro, justamente quando deveria se sentir confortável andando com seus próprios pés. A Bíblia diz, "No amor não há medo; antes o perfeito amor lança fora o medo" (I João 4:18). Liberdade deve ser a atmosfera do casamento. Como Adão e Eva no jardim, a proximidade deve intensificar somente a intimidade. Estar "nu" e "não se envergonhar" (Gênesis 2:25) deve existir na mesma frase em seu casamento - fisicamente e emocionalmente.

Evidentemente, este é um território delicado. O casamento descarrega a bagagem da outra pessoa na sua vida, e a sua na dela. Os dois têm motivos para ficarem constrangidos porque tiveram muitas coisas pessoais reveladas a outro ser humano. Mas esta é a sua oportunidade de proteger todas essas informações particulares sobre ele no abraço protetor do seu amor, e de prometer ser o que mais pode ajudá-lo a lidar com isso. Alguns desses segredos precisam de correção. Então, podemos ser agente de cura e restauração - não discursando, não criticando, mas ouvindo em amor e oferecendo apoio.

Alguns desses segredos só precisam ser aceitos. Eles são parte da estrutura e da história da pessoa. E embora essas questões não sejam muito agradáveis de se lidar, elas sempre vão exigir um toque delicado.

Em ambos os casos, somente você possui o poder de rejeitar o seu cônjuge por causa disto ou convidá-lo a entrar - com os defeitos e tudo o mais. Eles irão reconhecer que estão em um lugar seguro onde são livres para cometer erros, ou irão se recolher para si e se afastar emocionalmente de você, talvez para sempre. Amá-lo bem deve ser o trabalho de toda a sua vida.

Pense nisto desta maneira. Ninguém lhe conhece tão bem como Deus, Aquele que lhe formou. O autor do Salmo 139 estava certo quando disse, "Tu conheces. o meu sentar e o meu levantar; de longe entendes o meu pensamento. Esquadrinhas o meu andar, e o meu deitar, e conheces todos os meus caminhos. Sem que haja uma palavra na minha língua, eis que, ó Senhor, tudo conheces" (Salmos 139:2-4).

E ainda assim, Deus, que conhece até os segredos que escondemos de nós mesmos, nos ama tão profundamente que não podemos ao menos medir. Quanto mais nós pessoas imperfeitas - devemos estender a mão a nossos cônjuges em graça e entendimento, aceitando-os por quem são e assegurando-os que seus segredos estão seguros conosco?

Talvez essa seja uma área onde você falhou no passado. Se aconteceu assim, não espere que seu cônjuge lhe dê, imediatamente, acesso livre ao coração dele. Você deve iniciar reconstruindo a confiança. O próprio Jesus é descrito como Aquele que não invade a vida das pessoas, mas que permanece à porta e bate. "Eis que estou à porta e bato; se alguém ouvir a minha voz, e abrir a porta, entrarei em sua casa, e com ele cearei, e ele comigo" (Apocalipse 3:20).

A realidade da intimidade sempre leva tempo para se desenvolver, especialmente depois de ser comprometida. Mas seu compromisso de restabelecê-la pode começar hoje - para qualquer que esteja disposto a aceitar o desafio.

» Desafio de hoje »

Decida guardar os segredos do seu cônjuge (a menos que seja perigoso para ele ou para você) e orar por ele. Fale com seu cônjuge e demonstre amor apesar desses segredos. Ouça-o quando ele compartilha com você seus pensamentos mais secretos e suas lutas. Faça com que ele se sinta seguro.

- Anote aqui quando o desafio de hoje estiver completo.

Quão difícil é para você se conter em fazer uma crítica ou algo parecido? O que você aprendeu sobre o seu cônjuge hoje, simplesmente por ouvir?

Eu sou do meu amado, e o meu amado é meu. (Cantares de Salomão 6:3)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 18 - O Amor busca entender$t$, 19,
$conteudo$Feliz é o homem que acha sabedoria, e o homem que adquire entendimento. - Provérbios 3: 13

Gostamos de descobrir o máximo que podemos sobre as coisas que realmente nos importam. Se é nosso time de futebol favorito, iremos ler todos os artigos que nos ajudarão a acompanhar o seu desempenho. Se é cozinhar, vamos sintonizar no canal de televisão que compartilha as melhores dicas de culinária e receitas de sobremesa. Se é um assunto que nos interessa, anotaremos todas as vezes que algo relacionado a ele aparecer. De fato, é quase como uma área de estudo pessoal.

Não há problema em se interessar por coisas externas e estar "por dentro" de certos assuntos. Mas é aí que o amor faria a seguinte pergunta, "O quanto você conhece o seu cônjuge?"

Pense nos dias em que você estava paquerando aquele que hoje é seu cônjuge. Você não estudava aquele (a) por quem o seu coração ansiava?

Quando um homem tenta ganhar o coração de uma mulher, ele a estuda. Ele descobre do que ela gosta, do que não gosta, seus hábitos e hobbies. Mas depois que ele ganha o coração dela e se casa, geralmente ele para de descobrir coisas novas sobre ela. O mistério e o desafio de conhecê-la parece menos fascinante e ele vê seus interesses deslocados para outras áreas.

Isto também acontece, em muitos casos, com as mulheres que começam admirando e construindo respeito pelo homem com quem desejam estar. Entretanto, depois do casamento estes sentimentos desaparecem à medida que a realidade revela que seu "príncipe" é um homem falho e imperfeito, Mas mesmo depois do casamento, existem coisas que precisam ser descobertas a respeito do seu cônjuge. E esse conhecimento os aproximará. Você pode até obter favor aos olhos da sua esposa. "O bom senso alcança favor" (Provérbios 13:15). Considere a seguinte perspectiva: se tudo o que você conheceu do seu marido ou da sua esposa antes do casamento se comparar a um diploma do ensino médio, então, você precisa continuar aprendendo sobre ele (a) até conquistar um diploma universitário, um mestrado e, por fim, um doutorado. Pense nisso como uma jornada de vida que conduz o seu coração para mais perto do seu cônjuge.

• Você conhece os maiores sonhos e esperanças dele (a)?

• Você tem pleno conhecimento de como ele (a) prefere dar e receber amor?

• Você sabe quais são os maiores medos do seu cônjuge e por que ele luta contra eles?

Alguns dos problemas que você tem no que se refere ao seu cônjuge existem, simplesmente, porque você não o entende bem. Ele provavelmente reage de maneira diferente da que você reagiria, e você não entende o porquê.

Estas diferenças - mesmo aquelas que são relativamente insignificantes - podem ser a causa de muitas brigas e conflitos no casamento. Isto acontece porque, como diz a Bíblia, temos a tendência de "difamar" as coisas que não entendemos (Judas 10). Existe uma razão para cada gosto ou preferência do seu cônjuge. Cada nuance no caráter dele tem uma história. Cada elemento de quem ele é, como ele pensa e com o que se parece é baseado em uma série de princípios que, na maioria das vezes, só fazem sentido para a pessoa que o apóia. Mas vale a pena o tempo investido em descobrir por que seu esposo ou esposa é do jeito que é.

Se você perder o nível de intimidade que uma vez teve com o seu cônjuge, uma das melhores maneiras de destravar o coração dele novamente é se comprometer em conhecê-lo. Estude-o. Leia-o como você lê um livro que está tentando compreender. Faça perguntas. A Bíblia diz, "O ouvido dos sábios busca conhecimento" (Provérbios 18:15). O amor toma a iniciativa de começar a conversa. Para que seu companheiro possa se abrir, ele precisa saber que seu desejo de entendê-lo é real e genuíno. Ouça. "Os sábios entesouram o conhecimento; porém a boca do insensato é uma destruição iminente" (Provérbios 10:14). O objetivo de conhecer o seu cônjuge é ouvi-lo, não dizer a ele tudo o que pensa. Mesmo se o seu cônjuge não for muito falante, o amor lhe convida a descobrir as "águas profundas que habitam dentro dele (Provérbios 20:5).

Peça a Deus discernimento. "Porque o Senhor dá a sabedoria; da sua boca procedem o conhecimento e o entendimento" (Provérbios 2:6). Coisas como diferenças de gênero, antigos problemas familiares e experiências de vida variadas podem encobrir sua habilidade de conhecer o coração e as motivações do seu cônjuge. Mas Deus é generoso em sabedoria. O Senhor lhe mostrará o que você precisa para saber como amar mais o seu cônjuge.

"Com a sabedoria se edifica a casa, e com o entendimento ela se estabelece; e pelo conhecimento se encherão as câmaras de todas as riquezas preciosas e deleitáveis" (Provérbios 24:3-4). Existe uma profundidade de beleza e significado em sua esposa ou seu marido que irá lhe maravilhar a proporção que você descobre mais. Deseje conhecer essa pessoa mais do que você conhece. Faça dele (a) a sua área de estudo escolhida, e você preencherá a sua casa com o tipo de riqueza que só pode ser proporcionada pelo amor.

» Desafio de hoje »

Prepare um jantar especial em casa só para vocês dois. O jantar pode ser tão agradável quanto você preferir. Separe este momento para conhecer seu cônjuge melhor, talvez em áreas que vocês raramente conversam. Decida fazer desta uma noite agradável para você e para o seu amor.

- Anote aqui quando o desafio de hoje estiver completo.

O que você descobriu sobre o seu cônjuge? Como você pode continuar esse processo de descoberta, de outras maneiras? Quais foram alguns dos momentos que tornaram essa noite memorável?

Adquire, pois, a sabedoria; sim, com tudo o que possuis adquire o entendimento. (Provérbios 4:7)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 20;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 19 - É impossível Amar?$t$, 20,
$conteudo$Amados, amemo-nos uns aos outros, porque o amor é de Deus; e todo o que ama é nascido de Deus e conhece a Deus. - 1 João 4:7

O Desafio de Amar se inicia com um segredo. E apesar deste segredo ser um elemento silencioso no decorrer de cada dia, você se tornou a cada dia mais desconfiado dele. Agora que você já chegou até aqui, esse é um segredo que você está descobrindo por você mesmo, ainda que você não saiba exatamente como colocá-lo em palavras.

O segredo é este: não podemos obter amor incondicional (ou o amor ágape) pelo nosso próprio coração. É impossível. Está além das nossas capacidades. Está além de todas as nossas capacidades.

Você pode até ter demonstrado de alguma forma bondade e generosidade, e você deve até ter aprendido a ser mais ponderado, atencioso. Mas, sinceramente, amar alguém de forma abnegada, incondicional é um assunto completamente diferente. Então, como podemos fazer isso? Goste ou não, o amor ágape não é algo que você possa produzir. É algo que apenas Deus pode fazer. Mas por causa do Seu grande amor por você - e do Seu grande amor pelo seu cônjuge - Ele escolheu expressar Seu amor através de você.

Você pode ainda não acreditar nisso. Você pode estar convencido de que com muito trabalho e comprometimento, você pode criar o amor incondicional, a longo prazo e sacrificial a partir do seu próprio coração. Você quer acreditar que este amor está em você.

Mas quantas vezes o seu amor falhou em lhe afastar da mentira, da cobiça, da reação exagerada, do pensamento mau a respeito da pessoa à qual você, diante de Deus, prometeu amar para o resto da sua vida?

Por quantas vezes o seu amor provou ser incapaz de controlar a sua raiva? Quantas vezes o seu amor lhe motivou a perdoar ou promoveu um final de paz em uma discussão constante?

São estes fracassos que revelam a condição pecaminosa da humanidade. Fomos todos destituídos da ordem de Deus (Romanos 3:23). Todos nós demonstramos egoísmo, ódio e orgulho. E ao menos que alguma coisa seja feita para nos purificar desses atributos pecaminosos, iremos permanecer diante de Deus culpados e condenados (Romanos 6:23). É por esta razão que se não estivermos corretos diante de Deus, não podemos amar de verdade nosso cônjuge, porque Ele é a fonte desse amor. Não podemos dar o que não temos. Não podemos acessar reservas e fontes interiores que não podem ser exploradas. Da mesma forma que não podemos pagar um milhão de dólares se não tivermos condições, não podemos demonstrar o amor que não temos. Podemos tentar, mas iremos falhar.

Então a má notícia é: o amor que é capaz de resistir a todas as pressões está fora do nosso alcance, enquanto tentarmos encontrá-lo dentro de nós mesmos. Precisamos de alguém que nos dê esse tipo de amor.

"O amor vem de Deus" (1 João 4:7). E somente aqueles que permitiram que Ele entrasse em seus corações através da fé em Seu Filho, Jesus - somente aqueles que receberam o Espírito de Cristo através da fé em Sua morte e ressurreição - são capazes de alcançar o real poder do amor. "Porque sem mim," disse Jesus, "nada podeis fazer" (João 15: 5).

Mas Ele também disse, "Se vós permanecerdes em mim, e as minhas palavras permanecerem em vós, pedi o que quiserdes, e vos será feito" (João 15:7). Deus prometeu por meio de Cristo habitar em nosso coração através da fé, de forma que possamos "conhecer o amor de Cristo que excede todo entendimento, para que vocês sejam cheios de toda a plenitude de Deus" (Efésios 3:19).

Quando nos rendemos a Cristo, o Seu poder opera através de nós. Mesmo naquilo que somos melhores, não somos capazes de alcançar o padrão de Deus. Mas Ele "é capaz de fazer infinitamente mais do que tudo o que pedimos ou pensamos, de acordo com o seu poder que atua em nós" (Efésios 3:20). E assim que devemos amar nosso cônjuge.

Então, este segredo inquietante - tão poderoso quanto parece _ traz um final feliz para aqueles que não mais resistirem e receberem o amor que Deus tem para eles. Isso significa que o amor que Ele "derramou em nosso coração, por meio do Espírito Santo que Ele nos concedeu" (Romanos 5:5) está sempre disponível, todas as vezes que decidimos nos submeter a ele.

Simplesmente não somos capazes de demonstrar esse amor sem Ele.

Quem sabe, você nunca entregou o seu coração a Cristo, mas O sente lhe atraindo. Você deve estar percebendo pela primeira vez que, também, desobedeceu aos mandamentos de Deus, que a sua culpa lhe impedirá de conhecê-Lo. Mas, as escrituras dizem que se nos arrependermos e abandonarmos o pecado e nos voltarmos para Deus, Ele está de braços abertos para nos perdoar por causa do sacrifício que o Seu filho sofreu na cruz. Ele está lhe chamando, não para lhe escravizar, mas, para lhe libertar, de forma que receba Seu amor e perdão. Então, esse amor pode ser compartilhado com aquele (a) que você foi chamado especificamente para amar.

Talvez, você já seja cristão, mas poderia admitir que está caminhando longe da companhia do Senhor. Você não está vivendo na Palavra, não tem uma vida de oração, pode ser que você nem esteja mais indo aos cultos. O amor que você sentia correr pelas suas veias se reduziu à apatia.

A verdade é, não podemos viver sem Ele e não podemos amar sem Ele. E não existem palavras que expliquem o que Ele pode fazer em seu casamento se você colocar a sua confiança n’Ele.

» Desafio de hoje »

Olhe os desafios dos dias anteriores. Existe algum que parecia impossível para você? Você percebeu que precisa de Deus para mudar seu coração e lhe dar capacidade para amar? Peça a Ele para mostrar onde você precisa da intervenção Dele, e peça força e graça para cumprir o seu destino eterno.

- Anote aqui quando o desafio de hoje estiver completo.

O que Deus está lhe dizendo? Existe alguma agitação em seu coração? Que atitude você tomou em resposta a Ele?

Para o homem é impossível, mas, para Deus todas as coisas são possíveis. (Mateus 19:26)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 21;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 20 - Jesus Cristo é amor$t$, 21,
$conteudo$Pois, quando ainda éramos fracos, Cristo morreu a seu tempo pelos ímpios. - Romanos 5:6

O desafio do dia anterior conduziu a essa conclusão. Felizmente, é uma conclusão que podemos suportar - hoje, amanhã e para sempre.

Jesus veio para lhe "buscar e salvar" (Lucas 19:10). Tudo aquilo que você fez de errado e não consegue fazer corretamente, todos os minutos gastos tentando resolver as coisas à sua maneira - tudo isso pode ser perdoado e justificado se a sua vida for entregue nas mãos d’Aquele que primeiro a entregou a você. Talvez você nunca tenha feito isso, Então hoje é o seu dia. "Eis aqui agora o tempo aceitável, eis aqui agora o dia da salvação". (2 Coríntios 6:2)

Talvez você tenha feito isso há anos, mas você tem caminhado 'distante das suas raízes espirituais. Então ''Arrependei-vos, pois, e convertei-vos, para que sejam apagados os vossos pecados, de sorte que venham os tempos de refrigério, da presença do Senhor" (Atos 3:19). Mesmo que você já caminhe com Cristo e nunca se desviou de Sua companhia, a passagem abaixo é uma boa lembrança de tudo o que Ele tem feito por você.

A Bíblia diz que já nascemos pecadores. "Eis que eu nasci em iniqüidade, e em pecado me concebeu minha mãe" (Salmos 51:5). "Pois todos nós somos como o imundo, e todas as nossas justiças como trapo da imundícia" (Isaías 64:6). Deus não envia pessoas inocentes para o inferno.

Nós merecemos o inferno. Simplesmente, não somos bons o suficiente para vivermos com esse Deus puro e santo. Todavia, "Nisto se manifestou o amor de Deus para conosco: em que Deus enviou seu Filho unigênito ao mundo, para que por meio dele vivamos" (1 João 4:9). "Que, embora sendo Deus, não considerou que o ser igual a Deus era algo a que devia apegar-se; mas esvaziou-se a si mesmo, vindo a ser servo, tornando-se semelhante aos homens. E sendo encontrado em forma humana, humilhou-se a si mesmo e foi obediente até a morte e morte de cruz!" (Filipenses 2:6-8). "Levando Ele mesmo os nossos pecados em seu corpo sobre o madeiro, para que mortos para os pecados pudéssemos viver para a justiça; e pelas Suas feridas fostes sarados" (1 Pedra 2:24). Através de Sua morte Ele mudou nossa realidade de desprezados e sem valor. Se alguma vez você já se sentiu assim, foi porque não olhou para a cruz. Ele provou o Seu amor nela.

Amor como este não pode ser completamente compreendido. "Porque dificilmente haverá quem morra por um justo; pois poderá ser que pelo homem bondoso alguém ouse morrer. Mas Deus dá prova do seu amor para conosco, em que, quando éramos ainda pecadores, Cristo morreu por nós" (Romanos 5:7-8).

Nem pode ser adquirido por meio de esforços. "Porque o salário do pecado é a morte, mas o dom gratuito de Deus é a vida eterna em Cristo Jesus nosso Senhor" (Romanos 6:23). "Porque pela graça sois salvos, por meio da fé; e isto não vem de vós, é dom de Deus; não vem das obras, para que ninguém se glorie" (Efésios 2:8-9). Mas necessitamos receber esse amor. "Porque, se com a tua boca confessares a Jesus como Senhor, e em teu coração creres que Deus o ressuscitou dentre os mortos, será salvo; pois é com o coração que se crê para a justiça, e com a boca se faz confissão para a salvação" (Romanos 10:9-10).

E quando recebemos esta nova vida e esse amor como nossa própria vida e nosso próprio amor, nos tornamos livres para amar de formas que antes eram impossíveis. "Nisto conhecemos o que é o amor: Jesus Cristo deu a sua vida por nós, e devemos dar a nossa vida por nossos irmãos... E este é o mandamento: que creiamos no nome de Seu Filho Jesus Cristo e que nos amemos uns aos outros, como ele nos ordenou" (1 João 3: 16, 23). ''Aquele que não ama não conhece a Deus; porque Deus é amor" (1 João 4:8).

Ele estava disposto a lhe amar mesmo você não sendo merecedor, mesmo quando você não retribui o amor. Ele pôde ver todas as suas falhas e imperfeições e ainda escolheu lhe amar. O Seu amor sofreu o maior sacrifício para suprir a nossa maior necessidade. Como resultado, você é capaz (pela graça) de caminhar na plenitude e na bênção do Seu amor. Agora e para sempre.

Isso significa que agora você compartilha desse mesmo amor com o seu cônjuge. Você é capaz de amar mesmo quando o seu amor não é correspondido. Você pode ver todas as falhas e imperfeições dele e ainda escolher amá-lo. E apesar de não poder suprir as necessidades do seu cônjuge como Deus pode, você pode se tornar instrumento d’Ele para suprir as carências do amor da sua vida. Como resultado, ele pode caminhar na plenitude e na graça do amor. Agora e até a morte. O amor verdadeiro só é encontrado em Cristo. E depois que você receber o Seu dom da nova vida, entendendo e aceitando Sua morte em seu lugar e o perdão pelos seus pecados, você finalmente está pronto para viver o desafio.

» Desafio de hoje »

Desafio você a conhecera Deus pela palavra. Desafio você a crer em Jesus como seu salvador. desafio você a orar, Senhor Jesus, sou pecador, mas o senhor mostrou o teu amor por mim morrendo para perdoar os meus pecados, e o senhor provou o teu poder de me salvar da morte através da ressurreição. Senhor, mude o meu coração, e salve-me pela tua graça."

- Anote aqui quando o desafio de hoje estiver completo.

Escreva como foi essa experiência para você. Mesmo se você estiver apenas renovando o compromisso de receber e expressar Seu amor, o que Ele lhe mostrou hoje?

No seu amor, e na sua compaixão ele os remiu. (Isaias 63:9)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 22;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 21 - O Amor é saciado em Deus$t$, 22,
$conteudo$O Senhor lhe guiará constantemente; satisfará os seus desejos. - Isaías 58: 11

O vigésimo dia foi de vital importância na jornada de O Desafio de Amar - e na sua vida. Você esteve face a face com a maior necessidade do coração de todo ser humano. E talvez pela primeira vez tomou conhecimento do quanto essa necessidade é individual. Você deve ter percebido que nada em sua caixa de talentos e suplementos pode reparar o estrago que o pecado produz e que Jesus é o único que pode suprir o que falta em você. E você O recebeu por fé e permitiu que Ele gerenciasse e governasse a sua vida, então Seu Santo Espírito está renovando o seu oração. Sua sabedoria, graça e poder podem ser liberados agora em tudo o que você faz, incluindo seu casamento.

Contudo, se esse é um território novo para você ou se você é um seguidor de Jesus por algum tempo, agora é a hora de firmar algo em sua mente: você precisa de Deus a cada dia. Não é uma proposta temporária. Somente Ele pode lhe satisfazer, mesmo quando o resto do mundo falha com você.

Seu marido pode estar chegando tarde em casa mais uma vez. Mas Deus sempre chegará na hora.

Sua esposa pode lhe desapontar mais uma vez. Mas podemos sempre confiar que a promessa de Deus será liberada.

Todos os dias você cria expectativas a respeito do seu cônjuge. Algumas vezes ele até preenche suas expectativas. Às vezes não. Mas ele nunca será capaz de satisfazer todas as suas exigências _ em parte porque algumas das suas exigências são absurdas, em parte porque o seu cônjuge é humano.

Deus, por outro lado, não e. E aqueles que se achegam a Ele todos os dias, em total dependência, pelas necessidades verdadeiras da sua vida, são os que descobrem o quanto Deus é digno de confiança.

Seu cônjuge lhe proporciona paz interior? Não. Mas Deus proporciona. "Não andeis ansiosos por coisa alguma; antes em tudo sejam os vossos pedidos conhecidos diante de Deus pela oração e súplica com ações de graças; e a paz de Deus, que excede todo o entendimento, guardará os vossos corações e os vossos pensamentos em Cristo Jesus" (Filipenses 4:6-7)

Seu cônjuge lhe deixa feliz e satisfeito independente do que a vida lhe proporciona? Não. Mas Deus deixa. "Em toda maneira e em todas as coisas estou experimentado... Posso todas as coisas naquele que me fortalece" (Filipenses 4:12-13).

Existem necessidades em sua vida que somente Deus pode satisfazer totalmente. Apesar do seu marido ou da sua esposa poder preencher alguns desses requisitos pelo menos ocasionalmente - só Deus é capaz de supri-los por completo. Sua necessidade de amor. Sua necessidade de aceitação. Sua necessidade de alegria. É hora de parar de esperar que alguém ou alguma coisa lhe faça completo para sempre. Somente Deus pode fazer isso à medida que você aprende a depender d’Ele. Mas Ele quer fazer isso à maneira d’Ele. "Meu Deus suprirá todas as vossas necessidades segundo as suas riquezas na glória em Cristo Jesus" (Filipenses4:19). A necessidade de amor, paz e adequação é real. Ninguém esta dizendo que você não pode tê-las. Porém, em lugar de ficar ligado a coisas que são instáveis e sujeitas a mudanças - saúde, dinheiro, até mesmo os sentimentos e melhores intenções do seu cônjuge -ligue-se a Deus. Ele é o único na sua vida que nunca muda. Sua fidelidade, Sua verdade e Suas promessas para Seus filhos sempre permanecerão. É por esta razão que você precisa buscá-lo todos os dias.

A única razão para não fazermos isso é a falta de confiança em Deus. Não acreditamos que Ele suprirá as nossas necessidades. E a Bíblia ainda diz, "Deleita-te também no Senhor, e ele te concederá o que deseja o teu coração" (Salmos 37:4). Quando buscamos em primeiro lugar, O amamos em primeiro lugar e colocamos o nosso relacionamento com Ele no topo das nossas prioridades, Ele promete nos suprir com o que realmente precisamos _ que é, na verdade, tudo o que nos satisfaz. Certa vez, Jesus conversou com uma mulher samaritana próximo a um poço, uma mulher que procurou satisfazer suas necessidades através de uma série de relacionamentos falidos. Com a vida e o cântaro vazios, ela chegou a esse lugar arruinada e endurecida, mesmo estando desesperadamente necessitada. Mas em Cristo ela encontrou o que Ele chamou de "água viva' (João 4: 1 O) _ um suprimento que não era para matar a sede temporariamente. O que Ele ofereceu foi uma bebida para a satisfação da alma, que nunca para de jorrar dádivas e refrigério. E é isso que está disponível para você a cada manhã ao nascer do sol e a cada noite antes de dormir, independente de quem é o seu cônjuge ou o do que ele lhe fez. Deus é o seu suprimento diário. Ele é tudo o que você precisa.

» Desafio de hoje »

Separe hoje um tempo para orar e ler a bíblia. Tente ler um capítulo de provérbios a cada dia (são trinta e um - um suprimento para o mês todo), ou leia um capítulo dos evangelhos (Mateus, Marcos, Lucas e João). Enquanto você faz isso, mergulhe no amor e nas promessas que Deus tem para você. Isso lhe proporcionará crescimento na sua caminhada com Ele.

- Anote aqui quando o desafio de hoje estiver completo.

Como você acha que passar tempo com Deus mudará sua situação e sua perspectiva? Como você pode fazer d’Ele a parte mais significativa do seu dia?

Abres a mão, e satisfazes o desejo de todos os viventes. (Salmos 145: 16)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 23;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 22 - O Amor é fiel$t$, 23,
$conteudo$E desposar-te-ei comigo em fidelidade, e conhecerás ao Senhor. - Oséias 2:20

Como cristãos, o amor é a base de toda nossa identidade. Nosso novo nascimento veio porque "Deus amou o mundo de tal maneira que deu Seu filho unigênito para que todo aquele que n’Ele crê não pereça mas tenha a vida eterna" (João 3:16). Quando pediram para Jesus esclarecer qual era o maior de todos os mandamentos, Ele respondeu, ''Ame o Senhor, o seu Deus, de todo o seu coração, de toda sua alma, de toda sua força e de todo o seu entendimento e ame o seu próximo como a si mesmo" (Lucas 10:27).

O amor que temos pelo próximo deveria ser o que nos identifica como discípulos de Cristo (João 13:35). Essa é a base e o fundamento da nossa existência (Efésios 3: 17), cujo propósito é expressado com paixão e fervor (I Pedro 4:8). É uma qualidade que precisa crescer e transbordar mais e mais (I Tessalonicenses 3: 12), sempre nos aperfeiçoando e sendo reconhecidos por isto.

Então, se fomos criados para compartilhar o amor, o que você faz quando o amor é rejeitado? Como você reage quando a pessoa para quem você dedica sua vida não aceita o amor para o qual você foi chamado para demonstrar?

O acordo do profeta Oséias é um dos mais extraordinários da Bíblia. Indo contra toda lógica e conveniência, Deus o instruiu a se casar com uma prostituta. Ele desejava que o casamento de Oséias mostrasse como o amor incondicional dos céus por nós se parece. A união de Oséias com Gômer gerou três filhos mas, como esperado, essa mulher que por muito tempo teve uma vida imoral não se contentou em permanecer fiel a um único homem. Então Oséias teve que lidar com um oração ferido e com a vergonha do abandono.

Ele tinha amado Gômer, mas ela desprezou o seu amor. Eles cresceram juntos, mas depois ela foi desleal e adúltera, rejeitando-o por cobiça a homens totalmente estranhos.

O tempo passou e Deus falou novamente com Oséias. Deus disse para ele ir e reafirmar o seu amor pela mulher que por várias vezes lhe fora infiel. Dessa vez ela atingiu um nível mais baixo e teve que ser comprada do meio dos escravos, mas Oséias pagou o preço pela redenção dela e a levou de volta para casa. Sim, ela tratou o amor dele com descaso. Ela traiu seu coração. Mas ele a convidou de volta a sua vida, expressando um amor incondicional.

Esta é uma história real, mas foi usada como exemplo do amor de Deus por nós. Ele derrama o seu amor em nós sem medida, apesar de, como recompensa, geralmente não prestarmos atenção. Às vezes agimos vergonhosamente e consideramos Seu amor intruso, como se Ele estivesse nos privando do que realmente queremos. Nós O rejeitamos de várias maneiras – mesmo depois de receber Seu dom da salvação eterna - e ainda assim Ele nos ama. Ele permanece fiel.

Mesmo assim, Seu amor não O priva de nos chamar a prestar contas pelo nosso descaso por Ele: Pagamos mais por nossa rejeição do que imaginamos. Mas ainda assim, Ele escolhe responder com graça e misericórdia. "Em quem temos a redenção pelo seu sangue, a redenção dos nossos delitos, segundo as riquezas da sua graça (Efésios 1:7).- Nele temos o modelo do que o amor rejeitado faz. Esse amor permanece fiel.

Jesus nos chamou para esse tipo de amor na passagem conhecida como o Sermão da Montanha. Ele disse, ''Amai a vossos inimigos, fazei bem aos que vos odeiam, bendizei aos que vos maldizem, e orai pelos que vos caluniam" (Lucas 6:27-28). "Se amardes aos que vos amam, que mérito há nisso? Pois também os pecadores amam aos que os amam. E se fizerdes bem aos que vos fazem bem, que mérito há nisso? Também os pecadores fazem o mesmo" (Lucas 6:32-33).

"Amai, porém, os seus inimigos, façam-lhes o bem e emprestem a eles, sem esperar receber nada de volta. Então a recompensa que terão será grande e vocês serão filhos do Altíssimo, porque ele é bondoso para com os ingratos e maus" (Lucas 6:35). No momento em que estava no altar, você nunca imaginaria que a pessoa com quem você estava se casando poderia se tornar, mais tarde, um tipo de inimigo, daqueles que você precisaria amar como atitude de sacrifício quase total. E com bastante freqüência no casamento, o relacionamento realmente chega a esse nível. E até mesmo ao ponto de traição ou, infelizmente, à infidelidade.

Para muitos esse é o princípio do fim. Alguns reagem rapidamente indo em direção a um trágico divórcio. Outros, mais protetores de sua reputação do que de sua própria felicidade, decidem deixar a farsa continuar. Mas eles não têm a intenção de apreciá-la - muito menos de amar um ao outro novamente.

Este não é o modelo, contudo, do seguidor de Cristo. Se o amor é para ser igual ao d’Ele, é preciso amar mesmo quando o seu amor é rejeitado. E para que o seu amor seja assim, você necessita do amor de Cristo para iniciar.

Você pode dar amor imerecido ao seu cônjuge porque Deus lhe deu esse tipo de amor - repetidamente e continuamente. O amor é geralmente mais expressado àqueles que menos merecem.

Peça a Ele para lhe encher do amor que só Ele pode prover então, decida dá-lo a seu cônjuge de forma que demonstre a sua gratidão a Deus por lhe amar. Esta é a beleza do amor redimido. Este é o poder da fidelidade.

» Desafio de hoje »

Amar é uma escolha. Não um sentimento. É uma ação inicial não uma ação automática. Hoje, escolha estar comprometido a amar mesmo que seu cônjuge tenha perdido o interesse em receber o seu amor diga a ele hoje em palavras semelhantes a essas, "eu amo você e ponto final. Eu escolho amar você mesmo se você não me amar em troca".

- Anote aqui quando o desafio de hoje estiver completo.

Por que esse tipo de amor é impossível sem o amor de Cristo batendo em seu coração? Como a presença de Deus em você lhe capacita a amar, mesmo quando não é, inicialmente, recíproco?

• Escolhi o caminho da fidelidade. (Salmos 119:30)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 24;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 23 - O Amor sempre protege$t$, 24,
$conteudo$[O amor] tudo sofre - 1 Coríntios 13:7

O casamento é feito de uma série de elementos, incluindo alegrias, tristezas, sucessos e fracassos. Mas quando você pensa em como deseja que seja o casamento, a última coisa que vem à sua mente é que ele se pareça com um campo de batalha. Contudo, existem algumas batalhas que você deve estar mais do que disposto a enfrentar. Essas são batalhas que estão ligadas à proteção do seu cônjuge. Infelizmente, o casamento tem inimigos externos. Eles aparecem em formas diferentes e utilizam estratégias diferentes, e certamente eles irão conspirar para destruir o seu casamento, a menos que você saiba como impedi-los.

Alguns desses inimigos são espertos e parecem atraentes, com o único propósito de minar o amor e a apreciação um pelo outro. Outros tentam seduzir o seu coração, alimentando-o com fantasias e comparações irreais. Essa é uma batalha que você precisa travar para salvar seu casamento - daquelas em que o amor veste sua armadura e levanta a espada para se proteger. Seu casamento e seu cônjuge precisam de uma constante proteção de coisas como:

Influências prejudiciais. Você está permitindo que certos hábitos envenenem sua casa? A internet e a televisão podem ser um acréscimo produtivo e prazeroso à sua vida, mas elas também podem trazer elementos destrutivos e lhe privar de momentos preciosos com a sua família: O mesmo vale para as horas de trabalho, que os mantém separados um do outro por horas preciosas. Você não pode proteger a sua casa se raramente está presente, nem quando está relativamente desconectado. É preciso lutar para manter o equilíbrio.

Relacionamentos doentios. Nem todo mundo pode ser um bom amigo. Não é todo colega com quem você sai para pescar que fala com sabedoria quando o assunto é casamento. Não são todas as mulheres com quem você se relaciona que tem a perspectiva correta em relação a compromisso e prioridades. Na verdade, todo aquele que mina o seu casamento, não merece receber o título de "amigo". E certamente você precisa estar alerta todo tempo para que os relacionamentos com o sexo oposto no trabalho, na academia, ou até mesmo na igreja não lhe afastem emocionalmente daquele para quem você já entregou seu coração.

Desonra. Todo mundo enfrenta algum tipo de inferioridade e fraqueza. E em virtude do casamento expor completamente essas fraquezas um ao outro, você precisa proteger a vulnerabilidade da sua esposa ou do seu marido, nunca falando negativamente dele(a) em público. Os segredos dele (a) são os seus segredos (a menos, claro, se esses segredos envolverem comportamentos destrutivos que colocam você, seus filhos e seu cônjuge em perigo). De um modo geral, o amor esconde as falhas do outro. Ele cobre a vergonha do outro.

Parasitas. Tome cuidado com os parasitas. Um parasita é tudo aquilo que se junta a você ou ao seu cônjuge e suga a vida do seu casamento. Eles, na maioria das vezes, tomam a forma de vício, como drogas, apostas ou pornografia. Eles prometem prazer, mas crescem como uma doença e consomem mais e mais dos seus pensamentos, tempo e dinheiro. Eles roubam sua fidelidade e seu coração daquele (a) que você ama. Raramente o casamento sobrevive quando esses parasitas estão presentes. Se você ama seu cônjuge, deve destruir qualquer tipo de vício do seu coração. Se isso não acontecer, eles lhe destruirão.

A Bíblia fala claramente a respeito desse papel protetor, geralmente utilizando a analogia de um pastor de ovelhas. Deus advertiu, "Meu rebanho ficou sem pastor... e se tornou comida de todos os animais selvagens". Como? "Visto que meu rebanho ficou sem pastor". Não porque esses homens eram ruins em desempenhar suas funções, mas porque eles não prestaram atenção. Em lugar de vigiar para se assegurar que suas ovelhas não estavam sendo pegas por predadores, os pastores se alimentaram e não alimentaram Meu Rebanho" (Ezequiel 34:8). Eles cuidaram das suas próprias necessidades e do seu apetite, mas deram pouca importância à segurança daquelas que estavam sob a supervisão deles.

Esposas - você tem o papel de protetora em seu casamento. Você precisa guardar o seu coração de ser levado por novelas, revistas e outras formas de entretenimento que mancham sua percepção da realidade e fazem você ter expectativas falsas a respeito do seu marido. Ao contrário, você deve fazer a sua parte em ajudar o seu marido a se sentir forte, enquanto também evita pensamentos provenientes de programas de TV que tiram a sua atenção da família. "Toda mulher sábia edifica a sua casa; a Insensata, porém, derruba-a com as suas mãos" (Provérbios 14:1).

Homens - você é o cabeça da casa. É o responsável diante de Deus por guardar os portões e manter-se firme contra, tudo o que ameaça a sua esposa e o seu casamento. Essa não e uma tarefa simples. Requer um coração corajoso e uma cabeça que pense de forma preventiva. Jesus disse, "Se o dono da casa soubesse que vigília da noite havia de vir o ladrão, vigiaria e não deixaria minar a sua casa" (Mateus 24:43). Esse é o seu papel. Leve-o a sério.

» Desafio de hoje »

Remova qualquer coisa que esteja atrapalhando seu relacionamento, qualquer vício ou influência que esteja se infiltrando em seu amor e afastando seu coração do seu cônjuge.

- Anote aqui quando o desafio de hoje estiver completo.

O que você "jogou fora" primeiro? Existem outras coisas que precisam ser eliminadas também? O que você espera como resultado dessa remoção em você, em seu casamento e em seu relacionamento com Deus?

Sereis edificado; se lançares a iniqüidade longe da tua tenda (Jó 22:23)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 25;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 24 - Amor vs. cobiça$t$, 25,
$conteudo$O mundo e a sua cobiça passam, mas aquele que foz a vontade de Deus permanece para sempre. - 1 João 2: 17

Adão e Eva tinham tudo o que precisavam para viver no Jardim do Éden. Eles se relacionavam com Deus e tinham intimidade um com o outro. Mas depois que Eva foi enganada pela serpente, ela viu o fruto proibido e colocou o coração nele. Em pouco tempo, Adão se juntou a ela e, indo contra a ordem de Deus, ambos comeram o fruto proibido.

Esse é o processo. Dos olhos ao coração. E em seguida vergonha e arrependimento. Nós também temos tudo o que precisamos para ter uma vida plena, produtiva e enriquecida. "Porque nada trouxe para este mundo, e nada podemos daqui levar" (1 Timóteo 6:7). Mas a Bíblia insiste em dizer que ter o alimento e a vestimenta básica, é o suficiente para estarmos satisfeitos. E Jesus prometeu que essas duas coisas seriam sempre providas para os filhos de Deus (Mateus 6:25-33).

As bênçãos de Deus, contudo, vão tão além dessas necessidades fundamentais, que poderíamos dizer, com toda razão, que não temos falta de nada. Mesmo assim, como Adão e Eva, nós ainda queremos mais. Colocamos nossos olhos e nosso coração na busca por prazeres desse mundo. Tentamos suprir necessidades legítimas de maneiras ilegítimas. Para muitos, essas necessidades são a busca por satisfação sexual em outra pessoa ou em imagens pornográficas feitas para parecerem uma pessoa real. Olhamos, fixamos o olhar e fantasiamos. Tentamos ser discretos, mas dificilmente afastamos nossos olhos. E uma vez que os nossos olhos são capturados pela curiosidade nosso coração se envolve. Então, agimos de acordo com a cobiça. Também podemos ter a ambição por posses, poder ou vaidade. Vemos o que o outro tem e queremos para nós. Nosso oração se engana dizendo, "Eu seria feliz se tivesse isso." Então, tomamos a decisão de perseguir o que cobiçamos.

"Mas os que querem tornar-se ricos caem em tentação e em laço, e em muitas concupiscências loucas e nocivas, as quais submergem os homens na ruína e na perdição" (1 Timóteo 6:9).

A cobiça está em oposição ao amor. Significa colocar seu coração e suas paixões em algo proibido. E para um cristão, este é o primeiro passo para se afastar do relacionamento com Deus e com os outros. Isso acontece porque todo objeto de cobiça seja uma jovem colega de trabalho ou a atriz de um filme, ou o desejo por uma casa de meio milhão de dólares ou por um carro esportivo - representa o início de uma mentira. Esta coisa ou pessoa que promete satisfação absoluta se assemelha a um abismo de promessas não cumpridas.

Cobiça sempre gera mais cobiça. "Donde vêm as guerras e contendas entre vós? Porventura não vêm disto, dos vossos deleites, que nos vossos membros guerreiam?" (Tiago 4: 1). A cobiça lhe tornará insatisfeito com o seu marido ou esposa. Ela produz raiva, adormece corações e destrói casamentos. Em lugar de levar à plenitude, a cobiça leva ao vazio.

É hora de expor o que realmente é a cobiça - a sede por satisfação que só pode ser preenchida por Deus. A cobiça é como a luz de aviso no painel do seu coração lhe alertando para o fato de que você não está permitindo que Deus lhe preencha. Quando seus olhos e o seu coração estão n’Ele, suas ações lhe conduzirão a uma alegria duradoura, não a ciclos intermináveis de arrependimento e condenação. "Visto como o Seu divino poder nos tem dado tudo o que diz respeito à vida e à piedade, pelo pleno conhecimento daquele que nos chamou por Sua própria glória e virtude; pelas quais ele nos tem dado as suas preciosas e grandíssimas promessas, para que por elas vos torneis participantes da natureza divina, havendo escapado da corrupção, que pela concupiscência há no mundo"(2 Pedro 1:3-4).

Você está cansado de ser enganado pela cobiça? Não agüenta mais acreditar que o prazer em coisas proibidas é capaz de lhe manter feliz e satisfeito? Então, coloque os seus olhos na Palavra de Deus. Deixe Suas promessas de paz e liberdade trabalharem em seu coração. Receba diariamente o amor incondicional que Ele já provou para você através da cruz. Concentre-se em ser grato por tudo o que Deus já lhe deu, em lugar de escolher a ingratidão e o descontentamento.

Você se achará tão completo com o que Deus provê, que não terá mais fome de cobiça.

E quando você estiver na plenitude de Deus, volte seu coração para o seu cônjuge. "Seja bendito o teu manancial; e regozija-te na mulher da tua mocidade... e pelo seu amor sê encantado perpetuamente. E por que, filho meu, andarias atraído pela mulher licenciosa, e abraçarias o seio da adúltera? Porque os caminhos do homem estão diante dos olhos do Senhor, o qual observa todas as suas veredas" (Provérbios 5: 18-21).

"Não ameis o mundo, nem o que há no mundo. Se alguém ama o mundo, o amor do Pai não está nele" (I João 2:15). A cobiça é o melhor que este mundo tem para oferecer, mas o amor lhe oferece a melhor vida do mundo.

» Desafio de hoje »

Acabe com a cobiça agora. Identifique todo objeto dela em sua vida e remova-o. Rejeite todas as mentiras em que você acreditava ter prazer. A cobiça não pode terá permissão de ficar por perto. Ela deve ser destruída e exterminada - hoje - e substituída pelas promessas de deus e por um coração cheio do seu perfeito amor.

- Anote aqui quando o desafio de hoje estiver completo.

O que você identificou como uma área de cobiça? O que ela lhe custou ao longo do tempo? Como ela lhe afastou de ser a pessoa que gostaria? Escreva sobre seu novo compromisso de buscar a Deus - e de buscar seu cônjuge - em lugar de procurar desejos tolos.

Vivam como pessoas livres, mas não usem a liberdade como desculpa para fazer o mal. (J Pedra 2: 16)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 26;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 25 - O Amor perdoa$t$, 26,
$conteudo$O que eu também perdoei, se é que alguma coisa tenho perdoado, por causa de vós o fiz na presença de Cristo - 2 Coríntios 2: 10

Este é difícil - talvez o desafio mais difícil deste livro. Mas se seu casamento precisa de esperança, esse é um desafio que precisa ser levado a sério. Conselheiros e ministros que lidam com casais abalados, geralmente lhe dirão que este é o problema mais complexo de todos, uma ruptura que é, geralmente, a última a ser reparada. O perdão não é para ser apenas considerado e contemplado, mas precisa ser, deliberadamente, posto em prática. O perdão precisa acontecer, ou o casamento não terá sucesso.

Jesus pintou uma imagem realista do perdão em Sua parábola do servo impiedoso. Um homem que devia uma enorme quantia em dinheiro, ficou surpreso quando seu senhor ouviu o seu apelo por misericórdia e cancelou toda a dívida. Porém, depois de ter sido liberado dessa enorme dívida, o servo fez algo totalmente inesperado: ele foi até um outro homem que devia a ele uma quantia muito menor e exigiu o pagamento imediatamente. Quando o senhor tomou conhecimento disso, as coisas mudaram drasticamente em relação ao acordo com o escravo. "Irado, seu senhor entregou-o aos torturadores, até que pagasse tudo o que devia" (Mateus 18:34). Um dia que começou com alegria e alívio, terminou em tristeza e desesperança;

Tortura. Prisão. Quando pensamos em falta de perdão, é isso que deve vir a nossa mente, pois Jesus disse, "Assim vos fará meu Pai celestial, se de coração não perdoardes, cada um a seu irmão" (Mateus 18:35).

Imagine que você está em uma prisão. E quando você olha ao seu redor, avista algumas celas de onde você está. Você vê pessoas do seu passado encarceradas lá – pessoas que lhe feriram quando você era criança. Vê pessoas que já chamou de amigo, mas que erraram com você em algum momento da caminhada. Talvez você veja seu pai ou sua mãe, ou quem sabe os dois lá; talvez um irmão ou irmã ou outra pessoa da sua família. Até o seu cônjuge está trancado nas proximidades, imobilizado com todos os outros nesta cadeia feita por você mesmo.

Esta prisão que você vê é uma sala em seu próprio coração. Esta cela escura, fria e depressiva está em você todos os dias. Mas Jesus está de pé, não muito longe de lá, oferecendo uma chave para você que libertará todos os presidiários.

Não. Você não quer isso. Essas pessoas lhe machucaram muito. Eles sabiam o que estavam fazendo e mesmo assim decidiram ir em frente - até mesmo seu cônjuge, aquele em quem você mais confiava. Então, você resiste e volta. Você não está disposto a permanecer ali por nem mais um minuto – vendo Jesus, vendo a chave em Suas mãos, sabendo o que Ele está lhe pedindo para fazer. É demais para você. Entretanto, ao tentar escapar você descobre algo assustador. Não há saída. Você se encontra aprisionado com todos os outros cativos. Sua falta de perdão, raiva e amargura fizeram de você um prisioneiro também. Assim como o servo na história de Jesus, que foi perdoado de uma enorme dívida, você escolheu não perdoar e, em razão disso, tem sido entregue aos torturadores e carcereiros. Sua liberdade depende, agora, do seu perdão.

Sempre leva algum tempo para chegarmos a essa conclusão. Vemos todo tipo de perigo e risco no que se refere a perdoar. Por exemplo, o que eles fizeram foi muito errado, admitam eles ou não. Eles nem se sentem arrependidos pelo que fizeram. Eles devem achar que suas ações são perfeitamente justificáveis, e chegam ao ponto de lhe culpar por isto. Mas o perdão não absolve ninguém da culpa. Ele não limpa a "ficha" deles com Deus. O perdão livra você de se preocupar em como irá puni-los. Quando você perdoa uma outra pessoa, você não está apenas tornando-a livre. Você a está entregando a Deus, que é capaz de tratar com ela à Sua maneira. Você está se privando do trabalho de preparar mais argumentos ou tentando prevalecer na Situação. Não tem mais relação com ganhar ou perder. Tem a ver com liberdade. Tem a ver com "deixar pra lá".

É por esta razão que sempre ouvimos pessoas que perdoaram genuinamente dizerem, "eu sinto como se um peso fosse retirado dos meus ombros." Sim, é exatamente isso. E como uma brisa fresca passando pelo seu coração. O mau cheiro do mofo da cadeia é inundado por luz e serenidade. Pela primeira vez em muito tempo, você se sente em paz. Você se sente livre.

Mas como você faz isso? Você libera a sua raiva e entrega a responsabilidade de julgar essa pessoa para o Senhor. "Não vos vingueis a vós mesmos, amados, mas dai lugar à ira de Deus, porque está escrito: Minha é a vingança, eu retribuirei, diz o Senhor" (Romanos 12: 19).

Como você sabe que perdoou? Você descobre que perdoou quando no momento que você vê ou pensa na pessoa - ao invés de fazer seu sangue ferver - faz você sentir muito, faz você ter piedade dela, e esperar sinceramente que ela mude de atitude. Existem tantas outras coisas que precisam ser ditas e tantas questões emocionais que precisam ser enfrentadas para que alcancemos nosso objetivo. Contudo, casamentos bem sucedidos não são criados por pessoas que nunca magoam uns aos outros, mas por pessoas que decidem "não guardar rancor" (1 Coríntios 13:5).

» Desafio de hoje »

Seja o que for que você ainda não perdoou em seu cônjuge, perdoe hoje. Esqueça. Assim como pedimos a Deus para "perdoaras nossas dívidas" a cada dia, devemos pedira deus para ajudar-nos a "perdoar os nossos devedores" a cada dia também. a falta de perdão tem mantido você e seu cônjuge na prisão por muito tempo. Diga de coração, "eu escolhi perdoar".

- Anote aqui quando o desafio de hoje estiver completo.

O que você perdoou em seu cônjuge hoje? Por quanto tempo você está carregando esse peso? Quais foram os resultados de entregar esse problema a Deus?

Jesus, porém, dizia: Pai, perdoa-lhes; porque não sabem o que fazem. (Lucas 23:34)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 27;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 26 - O Amor é responsável$t$, 27,
$conteudo$• Quando julgas, (... ) te condenas a ti mesmo naquilo em que julgas a outro; pois tu que julgas, praticas o mesmo. - Romanos 2: 1

Hoje vai ser difícil. Mas enquanto você busca a força e a sabedoria de Deus, será capaz de passar por isso. Hoje pode ser um marco em seu casamento se você assim permitir. Então, decida focar no que Deus está dizendo e proponha-se a seguir Sua direção.

Hoje vamos falar sobre responsabilidade pessoal. É algo que sempre concordamos que os outros devem ter, mas, relutamos quando se trata da nossa própria responsabilidade. Nas últimas décadas, tem ocorrido um declínio no que diz respeito a responsabilidade pessoal. Cada vez mais as pessoas parecem menos conscientes de seus próprios erros. Vemos isso acontecer na política, nos negócios e nas manchetes de celebridades.

Porém, esse não é um problema específico de ricos e famosos. Para ter como exemplo alguém que sempre tem uma desculpa para cada ato, tudo o que temos que fazer é olhar no espelho. Somos tão prontos a justificar nossos motivos. Tão rápidos para desviar a crítica. Tão prontos para encontrar uma falha – especialmente em nosso cônjuge, que é geralmente o mais fácil de culpar.

Temos a tendência de acreditar que nossa visão é correta, ou pelo menos, muito mais correta que a do nosso cônjuge. E não acreditamos que qualquer pessoa, debaixo das mesmas circunstâncias, agiria de forma muito diferente de nós. Até onde sabemos, estamos fazendo o nosso melhor. Nosso cônjuge deve ficar grato por sermos tão bons com ele.

Entretanto, o amor não culpa o outro tão facilmente ou justifica motivos próprios. O amor nem de longe se preocupa com seus próprios interesses da mesma maneira que se preocupa com as necessidades dos outros. Quando o amor se responsabiliza por suas ações, não é para provar o quão nobre você tem sido, mas sim para admitir que você ainda tem um longo caminho a percorrer.

O amor não dá desculpas. O amor continua trabalhando para fazer a diferença em você e em seu casamento.

É por esta razão que da próxima vez que você estiver discutindo com seu cônjuge, em lugar de preparar sua retaliação, pare e veja se existe algo digno de ser ouvido na fala do seu cônjuge. O que pode acontecer em seu relacionamento se em lugar de transferir a culpa, você primeiro admitir seus próprios erros? Como dizem as Escrituras, ''A repreensão faz marca mais profunda no homem de entendimento do que c:em açoites no tolo" (Provérbios 17: 10).

O amor é responsável e disposto a admitir e corrigir seus erros e falhas logo no início. Você está sendo responsável por esta pessoa que você escolheu para ser o amor da sua vida? Você está disposto a se certificar se as necessidades do seu cônjuge estão sendo supridas? Ou você só se preocupa se seu cônjuge está suprindo as suas? O amor nos chama a sermos responsáveis por nosso (a) companheiro (a) no casamento. A amá-lo (a). A honrá-lo (a). A cuidar dele (a).

Você se responsabiliza por seus próprios erros? Você disse ou fez algo de errado para o seu cônjuge ou para Deus? O amor deseja ter um relacionamento correto com seu cônjuge e com Deus. Uma vez que isso esteja acertado, é hora de acertar outras áreas.

Um coração realmente arrependido leva um tempo para crescer,em você. O orgulho é muito resistente à responsabilidade, mas a humildade e a honestidade diante de Deus e do seu cônjuge são cruciais para um relacionamento saudável.

Isso não significa que você está sempre errado e seu cônjuge sempre certo. Não é uma questão de se tornar um capacho. Mas se existe algo que não está certo entre você e Deus, ou você e seu cônjuge, então essa deve ser a sua prioridade. "Se dissermos que não temos pecado nenhum, enganamos a nós mesmos, e a verdade não está em nós" (1 João 1:8). Contudo, "se confessarmos os nossos pecados, [Deus] é fiel e justo para nos perdoar os pecados e nos purificar de toda injustiça" (1 João 1:9). Confesse seus pecados primeiro, depois você estará em um solo melhor para resolver as coisas com o seu cônjuge.

Para caminhar com Deus e alcançar o Seu favor, você precisa estar limpo diante d’Ele. Isso não quer dizer que você não pode falhar, mas que você pode confessar sua falha a Deus e pedir perdão.

Seu cônjuge pode dizer que você errou ou o feriu de alguma forma e nunca corrigiu seu erro? Um dos papéis de quem tem responsabilidade é admitir quando falha e pedir perdão. É hora de se, humilhar, de corrigir suas ofensas e de reparar o prejuízo. Isso e um ato de amor. Deus não quer que haja questões não resolvidas entre vocês.

O problema é: para fazer isso sinceramente você deve "engolir" seu orgulho e buscar perdão independente de como seu cônjuge responde a isso. Ele deve lhe perdoar, mas sua responsabilidade não depende da decisão dele. Admitir seus erros é sua responsabilidade. Se seu cônjuge errou com você, deixe que ele trate disso outra hora.

Peça para Deus lhe mostrar onde você falhou em ter responsabilidade, então se acerte com Ele. Uma vez que você tenha feito isso, você precisa se acertar com seu cônjuge. Essa pode ser a coisa mais difícil que você já tenha feito, mas é crucial para dar o próximo passo em seu casamento e com Deus. Se você for sincero, você será surpreendido pela graça e pela força que Deus lhe da como resultado dessa decisão.

» Desafio de hoje »

Separe um tempo para orar pelas áreas onde você tem errado. Peça o perdão de Deus, então, humilhe-se a ponto de admiti-los ao seu cônjuge. Faça isso sinceramente e verdadeiramente. Peça perdão a seu cônjuge também. Não importa como ele irá responder, certifique-se de ter assumido sua responsabilidade em amor. Mesmo se ele responder com uma crítica, aceite-a como um conselho.

- Anote aqui quando o desafio de hoje estiver completo.

O que o seu cônjuge precisa ver para acreditar que sua confissão foi mais do que palavras?

Mas prove cada um a sua própria obra, e então terá motivo de glória somente em si mesmo. (gálatas 6,4)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 28;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 27 - O Amor encoraja$t$, 28,
$conteudo$Guarda a minha alma, e livra-me; não seja eu envergonhado, porque em Ti me refúgio. - Salmos 25:20

O casamento tem uma maneira de alterar nossa visão. Criamos expectativas de que o nosso cônjuge preencherá nossas esperanças e nos fará feliz. Mas esse é um pedido impossível para nosso cônjuge atender. Expectativas irreais geram decepções. Quanto maior forem suas expectativas, mais seu cônjuge irá falhar com você e lhe causar frustração.

Se a esposa sempre espera que seu esposo seja pontual, esteja sempre limpo e bem arrumado e entenda todas as suas necessidades, é bem provável que ela passe boa parte da vida de casada sofrendo constantes decepções. Mas se ela for realista e entender que ele é humano, esquecido e às vezes desatento, então ela ficará mais satisfeita quando ele for responsável, amoroso e gentil.

O divórcio é quase inevitável quando as pessoas não permitem que seu cônjuge seja humano. Então, é preciso que haja uma transição em seu pensamento. Você deve escolher viver por encorajamento ao invés de viver por expectativas. O jeito de ser do seu cônjuge nos últimos dez anos é o jeito que ele será no futuro, exceto por seu encorajamento amoroso e pela intervenção de Deus.

O amor coloca o foco na responsabilidade pessoal e na sua melhora em lugar de exigir mais dos outros.

Jesus descreveu isso detalhadamente quando falou sobre a pessoa que viu o "argueiro" no olho do seu irmão mas não notou a "trave" em seu próprio olho. "Ou como dirás a teu irmão: Deixa-me tirar o argueiro do teu olho, quando tens a trave no teu: Hipócrita. Tira primeiro a trave do teu olho; e então verás bem para tirar o argueiro do olho do teu irmão". (Mateus 7:4-5).

Seu cônjuge se sente como se convivesse com um inspetor de argueiro? Ele está sempre tenso, temeroso de não atender suas expectativas? Ele diria que passa mais tempo sentindo sua reprovação do que sua aceitação?

Quem sabe você responderá dizendo que o problema não é com você, mas com ele. Se ele realmente se decepciona em várias outras áreas, por que a culpa é sua? Até onde você sabe, é necessário que os dois façam tudo o que podem para o casamento funcionar bem. Se o seu cônjuge não quer que você seja' tão crítico, ele precisa entender que as questões que você levanta são legítimas. Você não está dizendo que é perfeito, de forma alguma, mas que é capaz de dizer o que pensa. Certo?

O problema com este tipo de atitude é que poucas pessoas são capazes de responder à critica com total objetividade. Quando está claro que alguém está infeliz com você - seja por confrontação direta ou por silêncio - é difícil não ficar pessoalmente magoado. Especialmente no casamento.

Apesar de tudo, diferente de qualquer outra amizade, o relacionamento com seu cônjuge começa com os dois fazendo de tudo para agradar um ao outro. Quando vocês namoravam, ele era completamente encantado pela sua personalidade. Você quase não cometia erros. O relacionamento de vocês era bem mais fácil. E mesmo que você não esperasse que fosse assim por toda vida, certamente você não o via tão pecador e tão irado com você. Você nunca esperou que este homem ou mulher que prometeu lhe amar, poderia chegar ao ponto de parecer que não lhe ama. Então, quando esse contraste absoluto se torna realidade de vida, sua reação natural é resisti-lo, Durante os primeiros dias de casamento, você deve ter sido mais inclinado a ouvir e fazer mudanças sutis. Mas com o passar dos anos, a desaprovação do seu cônjuge só tende a lhe deixar defensivo. Em lugar de fazer você querer corrigir as coisas, ela lhe fere cada vez mais profundamente.

O amor é sábio demais para agir assim. Em lugar de colocar seu cônjuge em uma posição de rebeldia, o amor lhe ensina a dar espaço para ele ser ele mesmo. Mesmo se você for do tipo que estabelece padrões elevados para si, o amor lhe convida a não manter seus padrões elevados em relação à atitude do seu, cônjuge. Você precisa entender que o casamento é um relacionamento para ser aproveitado e apreciado ao longo do caminho. É a única amizade criada pelo próprio Deus onde duas pessoas imperfeitas vivem juntas, mas tratam com a imperfeição encorajando um ao outro, não desencorajando.

A Bíblia diz, "Fortalecei as mãos fracas, e firmai os joelhos trementes" (Isaías 35:3). "Pelo que exortai-vos uns aos outros e dedicai-vos uns aos outros, (... ) consoleis os desanimados, ampareis os fracos e sejais longânimos para com todos" (1 Tessalonicenses 5:11,14).

Você não deseja que a vida de casado seja o lugar onde você desfrute a livre expressão de ser quem você é, crescendo em um ambiente seguro que lhe encoraje, mesmo quando você falha? Seu cônjuge também - e o amor dá a ele esse privilégio. Se a sua esposa ou o seu marido lhe disse mais de uma vez que você o(a) fez sentir abatido(a) e derrotado(a), você precisa levar estas palavras em consideração. Tenha o compromisso de deixar as expectativas irreais e se tornar o maior encorajador do seu cônjuge, diariamente. E a pessoa que Deus quer que ele seja começará a surgir com nova confiança e amor por você.

» Desafio de hoje »

Elimine do seu lar o veneno das expectativas erradas. Pense em uma área onde seu cônjuge tenha dito que você está esperando muito, e diga a ele que você está arrependido por ter exigido muito dele. Prometa que você procurará entendê-lo, e o assegure de seu amor incondicional.

- Anote aqui quando o desafio de hoje estiver completo.

O que você descobre a seu respeito quando coloca em seu cônjuge altas expectativas que ele não está internamente motivado a atingir? Quais são as melhores maneiras de lidar com essas divergências?

Consideremo-nos uns aos outros, para nos estimularmos ao amor e às boas obras. (Hebreus 10:24)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 29;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 28 - O Amor se sacrifica$t$, 29,
$conteudo$Cristo deu a sua vida por nós; e nós devemos dar a vida pelos irmãos. - 1 João 3: 16

A vida pode ser difícil. Mas o que geralmente queremos dizer é que a nossa vida pode ser difícil. Somos os primeiros a sentir a dificuldade quando somos maltratados e perturbados. Estamos prontos a nos aborrecer quando somos os que se sentem destituídos ou depreciados. Quando a vida é difícil para nós, percebemos. Entretanto, com freqüência, a única maneira de percebermos que a vida é difícil para nosso cônjuge é quando ele começa a reclamar dela. Então, no lugar do cuidado verdadeiro ou pressa em socorrer, é provável pensarmos que ele teve uma atitude ruim. A dor e a pressão que ele está enfrentando não são sentidas por nós da mesma maneira que sentimos quando é a nossa dor e a nossa pressão. Quando queremos reclamar, esperamos que todos entendam e sintam pena de nós.

Isso não acontece quando o amor está em ação. O amor não reclama pelos sinais óbvios de sofrimentos. Antes das preocupações e problemas começarem a enterrá-lo, o amor já entrou no modo de ação. Ele vê o peso começando a incomodar e intervém para ajudar. É por esta razão que o amor deseja que você seja sensível ao seu cônjuge.

O amor faz sacrifícios. Ele lhe mantém tão sintonizado com as necessidades do seu cônjuge que geralmente você atende antes mesmo de ser solicitado. E quando você não nota previamente e precisa que o seu cônjuge diga o que está acontecendo, o amor age no coração do problema.

Mesmo quando a aflição do seu cônjuge se revela por meio de acusações pessoais, o amor demonstra compaixão em lugar de se tornar defensivo. O amor lhe inspira a dizer "não" ao que você quer, para diz er "sim" às necessidades do seu cônjuge. Foi isso o que Jesus fez. "Ele deu a Sua vida por nós" para nos mostrar que "devemos também dar a nossa vida por outros. Ele nos ensinou que a prova do amor está em reconhecer a necessidade nos outros, e então fazer o possível para satisfazê-las. Porque tive fome, e me destes de comer; tive sede, e me destes de beber; era forasteiro, e me acolhestes; estava nu, e me vestistes; adoeci, e me visitastes; estava na prisão e fostes ver-me" (Mateus 25:35-36).

Esses são os tipos de necessidades as quais você precisa estar atento em sua esposa ou marido. Em lugar de ficar chateado porque ele (a) não lhe trata do jeito que você espera, deixe o amor lhe separar dessa auto piedade e voltar a sua atenção para a necessidade do seu cônjuge.

Ele sente "fome" - precisa de você sexualmente, mesmo quando você não está a fim? Ela tem "sede" - anseia pelo tempo e pela atenção que você dá a todas as outras pessoas?

Ele parece um "estranho" - inseguro no trabalho, precisando que o lar seja um refúgio e um santuário?

Ela está "nua" - assustada ou envergonhada, desesperada pela proteção da afirmação do seu amor?

Ele se sente "doente" - fisicamente cansado e precisando que você o afaste das perturbações?

Ela se sente em uma "prisão" - temerosa e deprimida, precisando de alguma segurança e intervenção?

O amor está disposto a sacrificar-se para ver que as necessidades do seu cônjuge têm o seu melhor esforço e foco. Quando sua esposa ou seu marido encontra-se oprimido (a) e sob extrema pressão, o amor lhe convida a colocar de lado o que é mais essencial em sua própria vida para ajudar, mesmo se for simplesmente a atenção em uma conversa.

Geralmente, ele só precisa falar sobre o problema até que tudo seja acordado. Ele precisa ver em seus olhos atenciosos que você realmente se importa com o que isso está custando a ele, e leva a sério o fato de ajudá-lo a encontrar respostas. Ele precisa que você ore com ele sobre o que fazer, e então acompanhar a questão para ver como ela está se resolvendo.

As palavras "Como posso ajudá-lo?" precisam estar na ponta de sua língua. A solução pode ser simples e fácil de fazer, ou pode ser complexa e custosa, exigindo tempo, energia e muito esforço. Em ambos os casos, você deve fazer o máximo para suprir as verdadeiras necessidades daquele que é parte de quem você é. Afinal de contas, quando você ajuda seu cônjuge, você também está se ajudando. Essa é a parte bela de se sacrificar pelo seu cônjuge. Jesus fez isso por nós e Ele estende a Sua graça para fazermos o mesmo pelos outros.

Quando os cristãos do Novo Testamento começaram a caminhar em amor, a vida de todos eles foi marcada por comunhão e sacrifício. As batidas de seus corações eram para adorar ao Senhor e servir Seu povo. "Todos os que criam estavam unidos e tinham tudo em comum. E vendiam suas propriedades e bens e os repartiam por todos, segundo a necessidade de cada um" (Atos 2:44-45). Como Paulo disse à uma dessas igrejas uma década mais tarde, "Eu de muito boa vontade gastarei, e me deixarei gastar pelas vossas almas" (2 Coríntios 12: 15). As vidas que foram ressuscitadas da morte pelo sacrifício de Jesus devem estar prontas e dispostas a se sacrificarem diariamente para suprir as necessidades dos outros.

» Desafio de hoje »

Qual é a maior necessidade do seu cônjuge nesse momento? Existe alguma necessidade que você pode suprir hoje através de um ato corajoso de sacrifício da sua parte? Independente da necessidade, ser grande ou pequena. Proponha-se a fazer o que você puder para suprira necessidade.

- Anote aqui quando o desafio de hoje estiver completo.

Quanto do estresse do seu cônjuge é causado por sua falta de iniciativa ou preocupação? Quando você expressou o desejo de ajudar, como ele recebeu sua atitude? Existem outras necessidades que você pode e suprir.

Levai as cargas uns dos outros, e assim cumprireis a lei de Cristo. (Gálatas 62)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 30;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 29 - A motivação do Amor$t$, 30,
$conteudo$Servindo de boa vontade como ao Senhor, e não como aos homens. - Efésios 6,7

Não é preciso ter muita experiência para descobrir que o seu cônjuge nem sempre irá lhe motivar. Na realidade, muitas vezes ele irá lhe desmotivar. Com mais freqüência do que você gostaria, parecerá difícil encontrar inspiração para demonstrar amor. Talvez ele nem receba seu amor quando você tentar expressá-lo. Essa é simplesmente a natureza da vida, mesmo em casamentos saudáveis.

Porém, apesar dos temperamentos e emoções criarem motivações oscilantes, certamente o amor permanecerá no mesmo lugar, o tempo inteiro. Quando Deus é a sua razão de amar, sua habilidade para amar é garantida.

Isso acontece porque o amor vem d’Ele.

Pense dessa maneira. Quando você era criança, seus pais certamente estabeleceram regras para você seguir. Você tinha hora para dormir. S eu quarto tinha que ser mantido limpo. Seu dever de casa precisava ser feito antes de você ir brincar. Se você foi igual a maioria das outras pessoas, você se acostumava com essas regras à medida que as obedecia. E provavelmente você não as obedeceria, de modo algum, se hão fosse motivado pelas imposições que, uma vez desrespeitadas, traziam conseqüências sérias.

Mas se você se encontrou com Cristo ao longo do caminho ou recebeu qualquer tipo de ensinamento bíblico, você provavelmente foi exposto à essa idéia - "Vós, filhos, obedecei em tudo a vossos pais; porque isto é agradável ao Senhor" Colossenses 3:20). Se você acreditou nisso de todo coração, certamente você entendeu que não daria satisfação aos seus pais para sempre.

Isso não representava mais uma batalha de vontades entre você e uma figura de autoridade de carne e osso. Era, sim, entre você e Deus. Sua mãe e seu pai eram apenas os intermediários.

Como se constata posteriormente, contudo, o relacionamento entre pais e filhos não é a única coisa aprimorada pelo fato de Deus ser sua motivação principal. Considere as seguintes áreas onde agradar a Deus deve ser o seu alvo:

Trabalho. "E tudo quanto fizerdes, fazei-o de coração, como ao Senhor, e não aos homens" (Colossenses 3:23).

Serviço. "Vós, servos, obedecei em tudo a vossos senhores segundo a carne, não servindo somente à vista como para agradar aos homens, mas em singeleza de coração, temendo ao Senhor" (Colossenses 3:22).

Tudo. "E tudo quanto fizerdes, fazei-o de coração, (como ao Senhor), e não aos homens, sabendo que do Senhor recebereis como recompensa a herança; servi a Cristo, o Senhor" (Colossenses 3:23-25).

Até o casamento. "Vós, mulheres, sede submissas a vossos maridos, como convém no Senhor". (Colossenses 3:18) "Vós, maridos, amai a vossas mulheres, como também Cristo amou a igreja, e a si mesmo se entregou por ela" (Efésios 5:25).

O amor que é exigido por você no casamento não depende da gentileza ou conveniência do seu cônjuge. O amor entre o marido e a esposa deve ter um objetivo principal: honrar ao Senhor com devoção e sinceridade. O fato de que esse processo abençoa ao nosso(a) amado(a) é simplesmente um benefício adicional maravilhoso. Essa mudança de foco e perspectiva é crucial para um cristão. Ser capaz de acordar sabendo que Deus é nossa fonte e provisão - não somente das suas necessidades, mas também das necessidades do seu cônjuge - muda totalmente a razão de interagir com ele.

Não é mais essa pessoa imperfeita que decide quanto amor você demonstrará, mas sim este Deus totalmente perfeito que pode usar até mesmo uma pessoa imperfeita como você para derramar a bênção do amor em outra pessoa.

O relacionamento com a sua esposa tem se tornado cada dia mais difícil? Você está perdendo a paciência com a capacidade dela de sempre discordar de você? Ela não para de fazer isso nem por um instante? Não negue o seu amor só porque ela pensa diferente de você. Ame-a como ao Senhor.

Seu marido está se afastando de você, não compartilhando seus pensamentos e aparentemente mergulhado em algo que não quer compartilhar? Você se sente ofendida pela indisposição dele de se abrir? Você está cansada do modo tão breve como ele lhe trata, e da maneira como ele atende às necessidades das crianças, deixando, às vezes, a desejar? Não reaja com uma dose dupla de silêncio e desatenção. Ame-o assim mesmo como ao Senhor.

O amor motivado por pura obrigação não permanece por muito tempo. E o amor motivado somente por condições favoráveis nunca terá a garantia de oxigênio suficiente para manter-se respirando. Somente o amor ofertado a Deus - devolvido a Ele em gratidão por tudo o que tem feito - é capaz de se manter quando todas as outras razões perderem a capacidade de nos estimular.

Aqueles que se sentem bem com casamentos medíocres podem deixar o seu amor para arriscar esperar pelo melhor. Mas se você assume o compromisso de dar ao seu cônjuge o melhor amor possível, você precisa buscar a maior motivação do amor. O amor que tem a Deus como foco principal é ilimitado no que se refere ao nível que pode atingir.

» Desafio de hoje »

Antes de ver seu cônjuge hoje. Ore por ele e por suas necessidades. Diga "eu te amo" sendo fácil para você ou não. Então expresse amor de maneira sensível. Volte a deus em oração mais uma vez. Agradecendo a ele por ter lhe dado o privilégio de amar essa pessoa tão especial - incondicionalmente. Assim como ele ama vocês dois.

- Anote aqui quando o desafio de hoje estiver completo.

Como essa mudança de motivação afeta seu relacionamento e suas motivações? O que isso lhe inspira afazer? O que isso lhe inspira a deixar de fazer?

Porém eu e a minha "casa serviremos ao Senhor. (Josué 24: 15)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 31;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 30 - O Amor traz unidade$t$, 31,
$conteudo$Pai santo, guarda-os no teu nome, o qual me deste, para que eles sejam um, assim como nós. - João 17:11

Uma das coisas mais importantes a respeito da Bíblia é a maneira como ela está articulada, com temas uniformes em todo seu conteúdo, do início ao fim. Apesar de ter sido escrita num período de 1.600 anos e ter mais de quarenta escritores de várias procedências e níveis de conhecimento, Deus soberanamente a escreveu com uma única voz. E Ele continua falando através da Bíblia hoje, sem que a mensagem chegue errada.

Unidade. União. Igualdade.

Essas são as marcas inabaláveis do nosso Deus.

No início dos tempos, vemos a Sua unidade agir através da Trindade - Pai, Filho e Espírito Santo. Deus, o Pai está lá criando o céu e a terra. O Espírito está se "movendo sobre a face das águas" (Gênesis 1:2). E o Filho, que é "o resplendor da glória de Deus e a expressão exata do Seu ser" (Hebreus 1:3), se juntam para falar e trazer a existência ao mundo. "Façamos o homem à nossa imagem, conforme a nossa semelhança" (Gênesis 1:26).

Façamos. Nossa.

Os três estão em perfeita união de mente e propósito.

Vemos depois Jesus levantando-se das águas do batismo, e o Espírito descendo em forma de pomba e o Pai anunciando nessa cena majestosa, "Este é meu Filho amado em quem me comprazo" (Mateus 3:17).

Jesus mais tarde diz, "Porque eu desci do céu, não para fazer minha vontade, mas a vontade daquele que me enviou" (João 6:38). O Seu desejo de responder às orações dos seus seguidores é "para que o Pai seja glorificado no Filho" (João 14: 13). Ele pede ao Pai para enviar Seu Santo Espírito, sabendo que o Espírito irá fielmente testificar a respeito do Filho que Ele ama, porque "Pois quem conhece os pensamentos do homem, a não ser o espírito do homem que nele está? Da mesma forma, ninguém conhece os pensamentos de Deus a não ser Espírito de Deus" (1 Coríntios 2: 11).

Pai, Filho e Espírito Santo estão em pura unidade. Eles servem um ao outro, amam um ao outro e honram um ao outro. Apesar de iguais, eles se alegram quando o outro é louvado. Apesar de distintos, eles são um, indivisíveis..

E por essa relação ser tão especial - tão representativa da grandeza e do esplendor de Deus - Ele escolheu nos deixar experimentar um aspecto disso. No relacionamento único entre marido e esposa, dois indivíduos distintos estão espiritualmente unidos em "uma só carne" (Gênesis 2:24). E "o que Deus uniu, ninguém o separe" (Marcos 10:9).

Na realidade, esse mistério é tão sério - e o amor entre marido e esp9sa tão entrelaçado e completo - que Deus utiliza a imagem do casamento para explicar o Seu amor pela igreja.

A Igreja (a noiva) é mais honrada quando o seu Salvador é adorado e celebrado. Cristo (o noivo), o qual se entregou a si mesmo por ela, é mais honrado quando ele a vê "como Igreja gloriosa, sem mancha nem ruga ou coisa semelhante, mas santa e inculpável" (Efésios 5:27). Ambos, Cristo e a Igreja, amam e honram um ao outro. Esta é a beleza da unidade.

Marido - O que aconteceria em seu casamento se você se dedicasse em amor, honra e serviço a sua esposa em todas as coisas? O que aconteceria se você determinasse que a preservação da sua unidade com sua mulher é digna de todo o sacrifício e expressão de amor? O que mudaria em seu lar se você tomasse essa abordagem em seu relacionamento como base diária?

Esposa - O que aconteceria se você estabelecesse como missão fazer tudo possível para promover proximidade de coração com o seu marido? O que aconteceria se qualquer ameaça a unidade de vocês fosse tratada como veneno, câncer, um inimigo a ser eliminado pelo amor, pela humildade e renúncia? Em que se tornaria o seu casamento se você nunca mais estivesse disposta a ver a unidade de vocês destruída? A unidade da Trindade, como é vista através da história e continuará sendo vista no futuro, é evidência do poder da unidade. Ela é inquebrável. Infinita. E esta é a mesma realidade espiritual que se esconde em seu lar e endereço. Apesar de se apresentar em forma de planejamento de trabalho; visitas médicas e idas ao supermercado, a unidade é o laço eterno que percorre as experiências diárias do que você chama de "seu casamento", dando a ele um propósito para ser defendido por toda vida.

Então, ame este que é parte do seu corpo tanto quanto você. Sirva a este cuja necessidade não pode ser separada da sua própria necessidade. Honre este que, quando sobe ao pedestal do seu amor, lhe eleva também aos olhos de Deus, tudo ao mesmo tempo.

» Desafio de hoje »

Separe uma área que cause divisão em seu casamento e olhe para ela hoje como uma oportunidade única de orar. Peça deus para revelar o que há no seu ração que está ameaçando sua unidade com seu cônjuge. Ore para que deus faça o mesmo com ele. E se for apropriado, discuta abertamente esse problema, buscando de deus a unidade.

- Anote aqui quando o desafio de hoje estiver completo.

Deus abriu seus olhos para as coisas que podem estar criando um ponto de discórdia? Como você pretende reagir? O que você espera que Deus faça em seu cônjuge também?

O Senhor, o nosso Deus, é o único Senhor. (Deuteronômio 6:4)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 32;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 31 - O Amor e o casamento$t$, 32,
$conteudo$Portanto deixará o homem a seu pai e a sua mãe, e unir-se-a à sua mulher, e serão uma só carne. - Gênesis 2:24

Este versículo é o modelo original de Deus de como o casamento deve funcionar. Ele envolve um rompimento e uma postura", Ele reconstrói relacionamentos já existentes enquanto estabelece um novo. O casamento modifica tudo.

É por esta razão que casais que não levam a sério esta mensagem de "rompimento" e "apego" sofrerão as conseqüências ao longo do caminho, quando os problemas são bem mais difíceis de serem solucionados sem ferir alguém.

"Rompimento" significa que você está quebrando um laço natural. Os conselhos de seus pais devem ser respeitados, mas eles não podem mais lhe dizer o que fazer. Às vezes, a dificuldade de agir dessa maneira vem da fonte original. Os pais podem não estar prontos para liberar seu filho do controle e expectativas deles. Seja por causa de dependência em relação à saúde ou de lutas interiores relacionadas ao fato de "esvaziar o ninho", eles na maioria das vezes não querem compartilhar a responsabilidade que têm. Em casos como estes, o jovem precisa ser corajoso e escolher "romper" por ele mesmo. E, muitas vezes, este rompimento não é feito da maneira adequada.

Você e seu cônjuge estão vivendo com questões não resolvidas por causa da incapacidade de cortar o cordão umbilical? Seu pai ou sua mãe continua criando problemas dentro do seu lar - talvez sem que eles percebam? O que precisa ser feito para colocar um ponto final nesta situação antes que ela crie uma divisão grande demais em seu casamento?

Unidade é uma qualidade do casamento que precisa ser guardada a todo custo. O propósito do "rompimento", claro, não é perder totalmente o contato com o passado, mas preservar a unidade absoluta que o casamento deve ter. Somente em unidade você pode se tornar tudo aquilo que Deus deseja de você.

Se você está estreitamente ligado a seus pais, a identidade do seu casamento não terá a capacidade de florescer. Você sempre se achará preso, e uma raiz de divisão continuará lançando novos dardos em seu relacionamento. Isso não vai embora a menos que você tome uma atitude. Porque sem "rompimento" não pode haver o "apego" que você precisa, a ligação de coração que é necessária para que haja unidade.

''Apego'' traz a idéia de apegar-se a alguém com insistência, a idéia de reconhecer o cônjuge como sua nova fonte de refúgio e segurança. Este homem é agora o líder espiritual de seu novo lar, encarregado da responsabilidade de amar você "como Cristo amou a igreja e se entregou por ela" (Efésios 5:25). Esta mulher agora é uma em união com você, chamada para tratar "o marido com todo respeito" (Efésios 5:33). Como resultado desse processo essencial, você agora é livre para se tornar tudo o que Deus quis dizer quando falou que vocês seriam uma só carne.

• Vocês são capazes de alcançar unidade nas suas decisões, mesmo quando elas se iniciam com pontos de vista diferentes.

• Vocês são capazes de alcançar unidade em suas prioridades, mesmo que tenham "visões" completamente diferentes.

• Vocês são capazes de alcançar unidade em suas afeições sexuais em relação ao outro, mesmo se um de vocês ou os dois tiverem lembranças impuras do tempo vivido antes do casamento.

A decisão de Deus em fazer de vocês "uma só carne" no casamento pode tornar todas as coisas possíveis.

Se não é dessa maneira que as coisas estão acontecendo na sua casa nesse momento, você infelizmente está incluído na maioria. Isso é característico de casais de todos os tipos – até mesmo os cristãos - ignorar o projeto de Deus para o casamento achando que sabem mais do que Deus. Gênesis 2:24 soa agradável e nobre quando enfeitado pelos votos do casamento. Porém, quando considerado um princípio fundamental a ser posto em prática em uma realidade de vida, ele simplesmente parece algo impossível de se fazer. Mas é esta realidade que você precisa fazer todo sacrifício para resgatar.

É difícil- muito difícil, quando a busca pela unidade é basicamente feita por apenas um dos lados. Seu cônjuge pode não estar de todo interessado em resgatar a unidade que vocês tinham a princípio. Mesmo se houver algum interesse da parte dele, ainda deve haver questões entre vocês longe de serem resolvidas.

Mas se você continuar tendo o desejo pela unidade como primeiro plano no coração e na mente, com o passar do tempo seu relacionamento começará a refletir o plano inevitável "uma só carne" que é impresso no DNA do casamento. Você não precisa procurá-lo. Ele já está lá. Mas você precisa vivê-lo, ou não há nada mais a se esperar a não ser a desunião.

Rompa. Apegue-se. E arrisque-se a caminhar como uma só carne.

» Desafio de hoje »

Existe algum "rompimento" que você ainda não teve coragem de realizar? Confesse-o ao seu cônjuge hoje, e decida agir corretamente. A unidade do seu casamento depende disso. Siga a unidade com o compromisso com seu cônjuge e com deus de fazer do seu casamento o relacionamento humano mais importante da sua vida.

- Anote aqui quando o desafio de hoje estiver completo.

Este tem sido um assunto difícil para você? Como isso tem afetado o seu relacionamento? Se o maior ofensor desta área é o seu cônjuge (com seus sogros), como você pode, amorosamente, transformar esse caso em uma situação melhor?

Para que todos sejam um; assim como tu, Ó Pai, és em mim, e eu em Ti. ( João 17:21)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 33;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 32 - O Amor satisfaz as necessidades sexuais$t$, 33,
$conteudo$O marido deve cumprir os seus deveres conjugais para com a sua mulher, e da mesma forma a mulher para com o seu marido. - 1 Coríntios 7:3

Algumas pessoas acreditam que a Bíblia não tem nada de bom para dizer sobre sexo, como se tudo o que Deus quisesse fosse nos dizer quando não fazê-lo e com quem não fazê-lo. Na realidade, contudo, Deus tem grandes coisas a dizer a respeito do sexo e da bênção que ele pode ser para ambos, marido e esposa. Mesmo os limites e as restrições são maneiras de Deus manter a nossa experiência sexual em um nível muito mais elevado do que os anunciados na televisão e nos filmes.

No casamento cristão, o romance deve prosperar e florescer. Afinal de contas ele foi criado por Deus. É tudo uma questão de celebrar o que Deus nos deu, nos tornando um com nosso cônjuge enquanto, simultaneamente, alcançamos pureza e santidade. Ele se alegra em nós quando isso acontece.

Cantares de Salomão, por exemplo, apesar de ser freqüentemente interpretado de forma incorreta como nada mais que uma alegoria da paixão de Deus por Seu povo é, na verdade, uma linda história de amor. Ele descreve o ato sexual entre o marido e a esposa em detalhes poéticos, mostrando como um corresponde ao outro. Ele expressa como a honestidade e o entendimento em assuntos sexuais levam a uma vida segura de amor.

É verdade que o sexo é apenas um dos aspectos do casamento. Contudo, com o passar do tempo, um de vocês dará mais importância a ele do que o outro. Como resultado, a natureza da unidade como homem e mulher estará ameaçada e em perigo.

Mais uma vez, o fundamento bíblico do casamento foi originariamente expresso na criação de Adão e Eva. Ela foi feita para ser "alguém que o auxilie e o corresponda” (Gênesis 2:18). A unidade do relacionamento deles e de seu corpo físico era tão forte que foram considerados como "uma só carne" (Gênesis 2:24).

Esta mesma unidade é a marca de todo casamento. No ato do romance, unimos o 'nosso coração um ao outro em uma expressão de amor que nenhuma outra forma de comunicação pode atingir. É por esta razão que "o leito conjugal deve ser conservado puro" (Hebreus 13:4). Esta mesma experiência não é para ser compartilhada com mais ninguém..

Entretanto, nós somos fracos. E quando essa necessidade ilegítima é invalidada quando é tratada como sendo egoísta, como sendo uma exigência do outro - nosso coração está sujeito a se afastar do casamento, tentado a preencher este desejo em algum outro lugar, de alguma outra forma.

Para agir contra essa tendência, Deus estabeleceu o casamento com a mentalidade de "uma só carne". "A mulher não tem autoridade sobre o seu próprio corpo, mas sim o marido; e também da mesma sorte o marido não tem autoridade sobre o seu próprio corpo, mas sim a mulher" (1 Coríntios 7:4).

O sexo não é para ser utilizado como uma negociação. Ele não é algo que Deus nos permite reter sem conseqüências. Apesar de existirem abusos a esse padrão projetado divinamente, a essência do casamento é a de nos dar ao outro para satisfazer suas necessidades.

O sexo é uma oportunidade dada por Deus para cumprir esse propósito. Então, "não se recusem um ao outro," a Bíblia adverte, "exceto por mútuo consentimento e durante certo tempo, para se dedicarem à oração. Depois, unam-se de novo, para que Satanás não os tente por não terem domínio próprio" (1 Coríntios 7:5).

Você é a única pessoa chamada e designada por Deus para satisfazer as necessidades sexuais do seu cônjuge. Se você permitir que a distância cresça entre vocês nessa área, se você permitir que a rotina tenha lugar em seu casamento, você está tomando algo que, por direito (e exclusivamente), pertence ao seu cônjuge. Se você permitir que seu cônjuge saiba - através de palavras, ações ou falta de ação - que o sexo não precisa ser mais do que você quer que seja, você rouba dele o sentido de honra e ternura que foi estabelecido por ordem bíblica. Você viola a unidade "uma só carne" do casamento.

Então, seja você aquele que se vê como o que está sendo privado, ou aquele que admite estar privando o outro, saiba que o plano de Deus é que vocês encontrem o equilíbrio e cheguem a um acordo. Mas saiba também que o caminho para cheguem até lá não é alcançado com reclamações, argumentações e mau humor. O amor é a única maneira de restabelecer a união apaixonada entre vocês. Cada um dos aspectos que O Desafio de Amar aborda - paciência, bondade, generosidade, atenção, proteção, honra e perdão - terá um papel na renovação da intimidade sexual de vocês. Quando o amor de Cristo é a fundação do seu casamento, a força da amizade e a relação sexual podem ser experimentadas a um nível que o mundo nunca conhecerá.

"Vocês foram comprados por alto preço", Deus declarou (1 Coríntios 6:20). Ele colocou o Seu amor em você e fez tudo para lhe fazer desejá-la. Agora é a sua vez de pagar o preço do amor para ganhar o coração da sua esposa ou do seu marido. Quando agir assim, você sentirá a felicidade absoluta que flui quando o sexo é feito por todas as razões corretas. E, como se não fosse suficiente, você também terá a oportunidade de "glorificar a Deus com o seu próprio corpo" (1 Coríntios 6:20). Que bonito!

» Desafio de hoje »

Se possível, relacione-se sexualmente com o seu marido ou com sua esposa hoje. Faça isso de maneira que honre o que seu cônjuge lhe disse (ou deixou implícito) a respeito das necessidades dele em relação à sexualidade. Peça a Deus para que esse momento seja agradável para os dois e para que também seja um caminho para uma intimidade cada vez maior.

- Anote aqui quando o desafio de hoje estiver completo.

Essa foi uma experiência satisfatória para você? Se não aconteceu da maneira como você esperava, o que você acha que está dificultando a situação? Você já se comprometeu em levar isso a Deus em oração? Se foi bênção para os dois, o que você pode aprender com isto para o futuro?

Quão formosa, e quão aprazível és, ó amor em delicias! (Cantares de Saio mão 7:6)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 34;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 33 - O Amor completa um ao outro$t$, 34,
$conteudo$Também, se dois dormirem juntos, eles se aquentarão;

mas um só como se aquentará? - Eclesiastes 4: 11

Deus cria o casamento com um homem e uma mulher e os faz um. E apesar do amor estar disposto a agir sozinho, se necessário, é sempre melhor quando essa performance não é solitária.

amor pode agir sozinho se não houver outra maneira, mas existe um "caminho sobremodo excelente" (1 Coríntios 12:31). O amor nos desafia a não parar de amar até que se alcance esse caminho.

Esse aspecto "complementar" do amor foi revelado à humanidade desde o princípio. Deus deu origem à raça humana com um macho e uma fêmea - ambos parecidos mas com aspectos que completam um ao outro criados para viverem em harmonia. Nosso corpo é feito um para o outro. Nossa natureza e temperamentos fornecem equilíbrio, nos capacitando a cumprir nossas tarefas de forma mais eficiente. A nossa união pode gerar filhos, e o nosso trabalho em equipe pode conduzi-los melhor a uma vida saudável e à maturidade. Onde um é fraco, o outro é forte. Quando um precisa construir algo, o outro está preparado para ajudar e encorajar. Multiplicamos a alegria um do outro e dividimos nossas tristezas.

A Bíblia diz, "Melhor é serem dois do que um, porque têm melhor paga do seu trabalho. Pois se caírem, um levantará o seu companheiro; mas ai do que estiver só, pois, caindo, não haverá outro que o levante" (Eclesiastes 4:9-10). É como as suas mãos, que não apenas vivem juntas mas multiplicam a eficiência uma da outra. Com o objetivo de fazerem o que fazem, nenhuma das duas é totalmente completa sem a outra.

Embora as nossas diferenças sejam freqüentemente a fonte do desentendimento e do conflito, elas foram criadas por Deus e podem ser bênçãos infinitas se nós as respeitarmos.

Um de vocês pode cozinhar melhor, por exemplo, enquanto o outro é mais eficiente lavando a louça. Um pode ser mais gentil e capaz de manter a paz entre os membros da família, enquanto o outro lida com a disciplina mais direta e efetivamente. Um pode ter uma boa mente para os negócios, mas precisa do outro para ajudá-lo a ser generoso.

Quando aprendemos a aceitar essas diferenças em nosso cônjuge, podemos contornar a crítica e estar prontos para ajudar e apreciar um ao outro.

Mas alguns parecem não estar dispostos a superar as diferenças de seu (sua) companheiro (a). E, como resultado, eles perdem muitas oportunidades. Eles não se beneficiam da singularidade que faz cada um deles mais eficiente quando inclui o outro.

Um exemplo da Bíblia a esse respeito é Pôncio Pilatos, o governador romano que presidiu o julgamento de Jesus. Sem ter ciência de quem era Cristo e contrariando a sua própria opinião, ele permitiu que a multidão o influenciasse a condenar e crucificar Jesus.

Porém, a única pessoa que estava mais sensível ao que estava acontecendo era a esposa de Pilatos, que chegou a ele no auge do alvoroço e o advertiu de que estava cometendo um erro. "E estando ele assentado no tribunal, sua mulher mandou dizer-lhe: Não te envolvas na questão desse justo, porque muito sofri hoje em sonho por causa dele" (Mateus 27:19).

Ela era aparentemente uma mulher de discernimento apurado que captou a magnitude desses eventos antes de seu marido. Certamente, a soberania de Deus estava em ação, e nada teria livrado Seu Filho de ir obedientemente à cruz por nós. Contudo, a rejeição de Pilatos à intuição de sua esposa revela um lado infeliz da natureza do homem que é constantemente ocultado. Deus fez as esposas para completarem seus maridos, e Ele muitas vezes dá a elas discernimento que seu marido não tem. Se esse discernimento é ignorado, a decisão do homem, na maioria das vezes, causa problemas.

A eficiência do seu casamento depende dos dois trabalhando juntos. Você tem alguma decisão importante a tomar sobre finanças ou plano de aposentadoria? Você está enfrentando um sério problema com um colega de trabalho? Está cada vez mais difícil lidar com ele? Você está lutando para saber que atitude tomar? Você está absolutamente convencido que as escolhas educacionais para seus filhos são as corretas, não importando o que seu cônjuge pense?

Não tente analisar tudo por você mesmo. Não desqualifique o direito dele de opinar em questões que dizem respeito a ambos. O amor entende que Deus uniu vocês com um propósito. E mesmo que você acabe discordando das perspectivas do seu cônjuge, ainda assim você deve respeitar e levar em consideração a visão dele. Isto honra o plano de Deus para seu relacionamento e protege a unidade que Ele intenciona. Juntos, vocês são melhores do que sozinhos. Vocês precisam um do outro. Vocês se completam.

Reconheça q!)e o seu cônjuge é essencial para um futuro de sucesso. Faça-o saber hoje que você deseja incluí-lo em suas próximas decisões, e que você precisa do seu conselho e ponto de vista. Se você ignorou as idéias dele no passado, admita seu descuido e peça-o para perdoá-lo.

- Anote aqui quando o desafio de hoje estiver completo.

Quais decisões futuras vocês podem tomar juntos? O que você aprendeu hoje a respeito do papel do seu cônjuge?

Revesti-vos do amor, que é o vínculo da perfeição. (Colossenses 3: 14)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 35;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 34 - O Amor celebra a Deus$t$, 35,
$conteudo$[O amor] Não se regozija com a injustiça, mas se regozija com a verdade. - 1 Coríntios 13:6

A partir do momento em que você fecha a sua Bíblia pela manhã, quase tudo o que você encontra durante o dia lhe afasta das verdades bíblicas. A opinião dos seus colegas de trabalho, as reportagens na televisão, os sites que você costuma visitar, as várias tentações do dia - tudo isso e mais um pouco estarão trabalhando sem parar para moldar suas convicções do que é a verdade e do que é mais importante na vida. Eles dirão que ter uma linda esposa que se veste de forma que chama a atenção dos outros homens é uma coisa boa. Eles dirão que a linguagem obscena e a imoralidade nos filmes são normais para pessoas maduras. Eles dirão que a igreja não tem importância na vida das pessoas. Eles dirão que cada um encontra Deus a sua própria maneira.

Eles dirão várias coisas. E as dirão tão alto e com tanta freqüência que se não formos cuidadosos, vamos começar a acreditar que as coisas funcionam da maneira que eles dizem. Podemos começar a valorizar o que todos eles valorizam e a pensar como pensam.

Entretanto, o significado da "vida real" muda drasticamente quando entendemos que a Palavra de Deus é a verdadeira expressão do que é a vida real. Os ensinamentos que estão contidos nela não são palpites sobre o que realmente importa. Eles são princípios que refletem a maneira como as coisas são, a maneira como Deus as criou para ser. Seus ideais e instruções são o único caminho para a verdadeira bênção, e quando vemos pessoas seguindo-os em obediência ao Senhor, deveríamos nos alegrar. O que lhe faz ter mais orgulho do seu esposo? É quando ele chega em casa com um troféu do campeonato de futebol da empresa ou quando ele junta a família para orar e ler a Palavra antes de dormir?

O que lhe faz ficar extremamente feliz com sua esposa? É vê-la testando uma nova técnica de pintura no quarto das crianças ou vê-Ia perdoar o vizinho cujo cachorro destruiu as suas plantas?

Você é uma das pessoas que exercem mais influência na vida do seu cônjuge. Você tem utilizado essa influência para levá-lo a honrar ou desonrar a Deus? O amor se alegra mais nas coisas que agradam a Deus. Quando o seu cônjuge está crescendo na construção do caráter cristão, na perseverança da fé e adotando comportamentos generosos e de serviço - se tornando espiritualmente responsável pelo seu lar - a Bíblia diz que devemos nos alegrar por isso. A palavra "regozijar" em 1 Coríntios 13:6 leva a idéia de estar absolutamente estimulado, muitíssimo alegre pelo que seu cônjuge está permitindo que Deus faça na vida dele.

O apóstolo Paulo, que ajudou a estabelecer e cuidar de muitas igrejas do primeiro século, escreveu em suas cartas o quão alegre ele estava em ouvir relatos da fé e do crescimento das pessoas em Jesus. "Sempre devemos, irmãos, dar graças a Deus por vós, como é justo, porque a vossa fé cresce muitíssimo e o amor de cada um de vós transborda de uns para com os outros. De maneira que nós mesmos nos gloriamos de vós nas igrejas de Deus por causa da vossa constância e fé em todas as perseguições e aflições que suportais" (2 Tessalonicenses 1:3-4).

O apóstolo João, que caminhou com Jesus e se tornou um dos principais líderes da igreja primitiva, certa vez escreveu ao seu rebanho, "Não tenho maior gozo do que este: o de ouvir que os meus filhos andam na verdade" (3 João 4).

Quando isso acontece com nosso companheiro, devemos nos alegrar. Mais do que quando ele economiza na hora de pagar a Conta do supermercado. Mais do que quando eles alcançam sucesso no trabalho. Algumas vezes, por agir conforme a cultura ao aplaudir nosso cônjuge, podemos ser culpados de encorajá-lo a pecar talvez por alimentar as vaidades dele ou por deixar que sejam meninos.

Contudo, o amor "não se alegra com a injustiça" - nem em nós mesmos e nem em nosso cônjuge. Mas particularmente, o amor "se alegra com a verdade," da maneira como Paulo fez quando disse à igreja em Romanos, "Pois a vossa obediência é conhecida de todos. Comprazo-me, portanto, em vós; e quero que sejais sábios para o bem, mas simples para o mal" (Romanos 16:19). Ele sabia que a busca pelo que é de Deus, pela pureza e pela fidelidade era a única maneira para eles encontrarem alegria e plenitude. Ser "sábio" para a santidade e ser "inocente" para o pecado permanecer incansável e firme na caminhada da vida _ é a maneira de vencer aos olhos de Deus.

E o que mais podemos desejar para nossa esposa ou marido do que eles experimentarem o melhor de Deus para suas vidas?

Alegre-se pelos sucessos que seu cônjuge conquista. Mas guarde sua maior alegria para os momentos em que eles honrarem a Deus com adoração e obediência.

» Desafio de hoje »

Encontre um exemplo específico e recente de quando seu cônjuge demonstrou o caráter cristão de forma notável. Elogie-o verbalmente por isto em algum momento do dia.

- Anote aqui quando o desafio de hoje estiver completo.

Qual o exemplo que você escolheu reconhecer? De que outras formas você pode celebrar o crescimento dele em Deus? Como você pode encorajá-lo a perseverar nisso?

Andarei em minha casa com integridade de coração. (Salmos 101:2)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 36;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 35 - O Amor presta contas$t$, 36,
$conteudo$Os planos fracassam por falta de conselho, mas são bem-sucedidos quando há muitos conselheiros. - Provérbios 15:22

As poderosas sequóias elevam-se a uma altura de até cem metros no ar e podem resistir à pressões ambientais intensas. Os relâmpagos podem atacá-las, ventos violentos podem soprar e os incêndios das florestas podem se alastrar ao redor delas. Mas a sequóia resiste, permanecendo firme, tornando-se cada vez mais firme a cada provação.

Um dos segredos da força dessas árvores gigantes está abaixo da superfície. Ao contrário de muitas árvores, ela se estende e interliga suas raízes com as sequóias ao seu redor. Ela se torna mais fortalecida e resistente pela força das outras. O segredo da sequóia é também a chave para manter um casamento forte e saudável. O casal que enfrenta os problemas sozinho está mais sujeito a se separar durante os tempos difíceis.

Todavia, aqueles que interligam suas vidas em uma rede de outros casamentos fortificados, aumentam radicalmente as chances de sobreviver às tempestades violentas. É fundamental que o marido e a esposa tenham conselhos divinos, amizades saudáveis e conselheiros experientes.

Todos precisam de conselhos sábios no decorrer da vida.

As pessoas sábias constantemente os buscam e os recebem com gratidão. Os tolos nunca pedem conselho e quando alguém os aconselha, é ignorado por eles. Como a Bíblia claramente explica, "O caminho do insensato parece-lhe justo, mas o sábio ouve os conselhos" (Provérbios 12:15). Adquirir conselhos sábios é como ter o mapa detalhado de uma trilha e um guia pessoal enquanto faz uma viagem longa e desafiadora. Pode ser a diferença entre o sucesso contínuo e a destruição de outro casamento. É fundamental que você convide casais fortalecidos para compartilharem a sabedoria que eles adquiriram ao longo de seus sucessos e fracassos. Por que gastar anos da sua vida aprendendo lições dolorosas quando você pode descobrir essas mesmas verdades em poucas horas de aconselhamento? Por que não cruzar a ponte que outros construíram? A sabedoria é mais valiosa que o ouro. Não recebê-la é como deixar que moedas valiosas escorreguem pelos seus dedos. Bons conselheiros para casais lhe alertam antes de você tomar uma decisão ruim. Eles lhe encorajam quando você está quase desistindo. E eles lhe incentivam quando você alcança novos níveis de intimidade em seu casamento.

Você precisa de um casal mais experiente ou um amigo do mesmo sexo a quem possa recorrer para obter bons conselhos, suporte em oração e até mesmo prestar contas regularmente dos seus atos? Você tem alguém que fale honestamente com você? Você e seu cônjuge precisam desse tipo de amigos e conselheiros de base consistente. A Bíblia diz, ''Antes exortai-vos uns aos outros todos os dias para que nenhum de vós se endureça pelo engano do pecado" (Hebreus 3: 13). É comum nos isolarmos dos outros. Se não tomarmos cuidado, podemos afastar as pessoas que mais nos amam. Você precisa se guardar daqueles que influenciam o engano. Todo mundo tem uma opinião e algumas pessoas vão lhe encorajar a agir de forma egoísta e até a deixar o seu cônjuge para ter a sua própria felicidade. Seja cauteloso ao ouvir conselhos de pessoas que não possuem um bom casamento.

Se o seu casamento está se enforcando ou se ele já está direcionado ao divórcio, então você precisa parar tudo e buscar conselho sólido o mais rápido possível. Busque um pastor, um conselheiro cristão ou um aconselhamento para casais ainda hoje. Por mais que a princípio pareça estranho falar da sua vida para alguém que você não conhece, seu casamento merece cada segundo gasto e cada sacrifício que você fará por ele. Mesmo que o seu casamento esteja firme, ainda assim, você precisa da mesma forma de conselheiros honestos e abertos - pessoas que podem lhe incentivar e fazer o seu casamento ainda melhor. Como encontrar um bom conselheiro? Você deve procurar por uma pessoa que tenha o tipo de casamento que você gostaria de ter. Você deve procurar por uma pessoa cujo coração seja direcionado para Cristo antes de todas as outras coisas. Procure alguém que não vive por suas próprias opiniões, mas pela imutável Palavra de Deus. E cada vez mais essa pessoa vai se sentir alegre em poder ajudar. Então, separe um tempo para se encontrarem e conversarem.

Se isso não soa tão importante para você, seria uma excelente idéia se perguntar por quê. Você tem algo a esconder? Está com medo de se sentir envergonhado? Você acha que o seu casamento não precisa de ajuda exterior? Mergulhar em um rio de influências positivas não lhe atrai? Não seja o capitão de outro "divórcio Titanic" por ignorar os sinais de alerta ao seu redor, quando você poderia ter sido ajudado.

Aqui está uma importante lembrança das escrituras: ''Assim, pois, cada um de nós dará conta de si mesmo a Deus" (Romanos 14:12). Este acordo é inviolável. E apesar de sermos todos essencialmente responsáveis pela maneira como lidamos com isso, podemos certamente aceitar toda a ajuda que os outros podem nos dar. Pode ser apenas uma questão de influência que transporta o seu casamento da mediocridade para a excelência.

» Desafio de hoje »

Busque um conselheiro para casais - alguém que seja um cristão firme e que será honesto e amoroso. Se você sente que o aconselhamento é necessário, então dê o primeiro passo para marcar o primeiro encontro. Durante esse processo, peça a deus para direcionar suas decisões e discernimento.

- Anote aqui quando o desafio de hoje estiver completo.

Quem você escolheu? Por que você elegeu esta pessoa? O que você espera aprender com ela?

Na multidão de conselheiros há segurança. (Provérbios 11: 14)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 37;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 36 - O Amor é a palavra de Deus$t$, 37,
$conteudo$Lâmpada para os meus pés é a tua palavra, e luz para o meu caminho. - Salmos 119:105

Para algumas pessoas a Bíblia parece ser grande demais para ser compreendida. É como se fosse uma tarefa impossível. Elas não sabem por onde nem como começar. Mas, como cristãos, não somos deixados sozinhos na compreensão dos maiores temas e dos significados mais profundos da Bíblia. O Espírito Santo, que agora habita em seu coração através da salvação, é o iluminador da verdade. "Pois o Espírito esquadrinha todas as coisas, mesmo as profundezas de Deus" (I Coríntios 2: 10). E em razão da Sua luz interior, a Bíblia agora é para ser lida, absorvida, compreendida e vivida.

Contudo, em primeiro lugar você precisa comprometer-se a fazer o seguinte.

Esteja nela. Se esse ainda não é um hábito seu, agora é a hora de começar a ler uma parte da Bíblia todos os dias. O ideal é lê-la junto com sua esposa ou com seu marido - na parte da manhã, talvez, ou antes de dormir. Seja como o autor do Salmo 119, que disse: "De todo o meu coração tenho te buscado; Escondi a tua palavra no meu coração, para não pecar contra ti" (Salmos 119:10-11).

Aqueles que praticam um padrão de leitura consistente da Bíblia logo descobrem que ela é "mais desejável do que o ouro, do que muito ouro puro; é mais doce do que o mel, do que as gotas do favo" (Salmos 19:10).

Esteja debaixo dela. Você tem razão, a Bíblia pode ser profunda e desafiadora. É por isto que é importante fazer parte de uma igreja onde a Palavra é ensinada e pregada fielmente. Ao ouvi-la explicada em sermões e classes de estudos bíblicos, você obterá uma visão mais ampla e equilibrada do que Deus esta dizendo através da Sua Palavra. Você também estará junto de outros que estão no mesmo caminho que você está, desejando ser alimentado pelas verdades das Escrituras. "Tu, porém, permanece naquilo que aprendeste, e de que foste inteirado, sabendo de quem o tens aprendido" (2 Timóteo 3: 14).

Viva-a. Diferente da maioria dos outros livros, que são designados apenas para serem lidos e digeridos, a Bíblia é um livro vivo. Ela é viva porque o Espírito Santo ainda habita nas suas palavras. Ela é viva porque, ao contrário dos antigos manuscritos das outras religiões, o seu Autor está vivo. E ela é viva porque ela se torna parte de quem você é, de como você pensa e do que você faz. "E sede cumpridores da palavra e não somente ouvintes, enganando-vos a vós mesmos" (Tiago 1:22).

Jesus falou a respeito das pessoas que constroem a vida na areia - na sua própria lógica, nos seus melhores palpites, no pensamento mais recente. Quando as tempestades da vida começam a soprar (e sempre soprarão), as fundações de areia resultarão apenas em desastre total. A casa pode parecer firme e agradável por um momento, mas está só esperando que uma tragédia aconteça. Em algum momento ela cairá.

Mas Jesus disse, "Todo aquele, pois, que ouve estas minhas palavras e as põe em prática, será comparado a um homem prudente, que edificou a casa sobre a rocha. E desceu a chuva, correram as torrentes, sopraram os ventos, e bateram com ímpeto contra aquela casa; contudo não caiu, porque estava fundada sobre a rocha" (Mateus 7:24-25). Quando a sua casa é fundada na rocha da imutável Palavra de Deus, ela não é assolada pela destruição. Isto acontece porque Deus tem um plano certo para tudo e Ele revela esses planos em Sua Palavra. Eles estão lá para aqueles que os lerem e os aplicarem.

Deus tem um plano sobre como você lida com o seu dinheiro, um plano sobre como você cria seus filhos, um plano sobre como você cuida do seu corpo, um plano sobre como você usa o seu tempo e um plano sobre como você lida com os conflitos. Não é exatamente como se seu fabricante soubesse exatamente do que você precisa? Se para você ler a Bíblia regularmente é algo novo, você ficará surpreso com a rápida mudança que seus pensamentos sofrerão, tornando-se diferentes e eternos. E se você tiver seriedade ao estabelecer estratégias para sua vida baseadas na maneira de Deus de fazer as coisas, Ele lhe guiará a fazer conexões entre o que você está lendo e a sua vida. Ela é uma jornada esclarecedora com descobertas a serem feitas a todo tempo.

Com o passar do tempo, os princípios de Deus crescerão mais fortes e mais eternos, em cada aspecto da sua vida que você submeter à Bíblia. Mas tudo aquilo que você recusar entregar a Deus, escolhendo fazer as coisas à sua própria maneira, irá enfraquecer e certamente fracassar quando as tempestades da vida lhe atacarem. Essa deve ser, de fato, a única área que pre cederá a queda do seu casamento e do seu lar.

Casais sábios constroem sua casa na rocha que é a Palavra de Deus. Eles têm visto o que a areia pode fazer. Eles sabem como é quando os pés ficam vacilantes e o chão se vai. É por esta razão que você precisa decidir construir sua vida e seu casamento na rocha sólida que é a Bíblia, e então você pode planejar um futuro mais forte - não importa quão fortes sejam as tempestades.

» Desafio de hoje »

Tenha o compromisso de ler a Bíblia todos os dias. Encontre um livro devocional ou outra fonte que lhe servirá como guia. Se seu cônjuge está aberto a isto, veja se ele se comprometerá a ler a Bíblia diariamente com você. Inicie submetendo cada área da sua vida à direção da palavra de Deus e comece a construir a sua vida e seu casamento na rocha.

- Anote aqui quando o desafio de hoje estiver completo.

Qual a área da sua vida que mais precisa do conselho de Deus: Onde você sente que é mais suscetível a falhar? O que você está pedindo para Deus lhe mostrar através da Sua Palavra?

Pois tudo o que foi escrito no passado, foi escrito para nos ensinar, (Romanos 15:4)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 38;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 37 - O Amor concorda em Oração$t$, 38,
$conteudo$“Se dois de vocês concordarem na terra em qualquer assunto sobre o qual pedirem, isso lhes será feito por meu Pai que está nos céus." _ Mateus 18: 19

Se alguém lhe dissesse que mudando apenas um aspecto do seu casamento você teria quase que cem por cento de garantia de que a vida de vocês como casal melhoraria significativamente, você, no mínimo, gostaria de saber que aspecto é esse. Para muitos casais cristãos esse "aspecto" é a prática diária de orarem juntos.

Para alguém que tende a desvalorizar questões espirituais, isto soa bastante ridículo. E se você dissesse para ele que orar junto é um ingrediente chave para a longevidade matrimonial e para o aumento da intimidade sexual, ele pensaria que você realmente está exagerando. Mas a unidade que cresce entre um homem e uma mulher que regularmente oram juntos cria uma conexão intensa e poderosa. Dentro do santuário do seu casamento, orar junto pode operar maravilhas em todos os níveis do seu relacionamento.

Quando vocês se uniram como marido e esposa, Deus lhes deu um presente de casamento - um parceiro de oração permanente por toda vida. Quando você precisa de sabedoria para certas decisões, você e seu parceiro de oração podem buscar a Deus juntos para achar a resposta. Quando você estiver sofrendo com seus próprios temores e com suas inseguranças, seu parceiro de oração pode segurar a sua mão e interceder em seu favor. Quando você e seu cônjuge não se entendem e não deixam passar uma discussão ou uma "espetadinha' sequer,.você pode parar um pouco, abaixar as suas armas e ir com seu parceiro em direção a uma oração de emergência. Esse deve se tornar seu reflexo automático quando você não sabe mais o que fazer. É difícil ficar muito tempo com raiva de alguém com quem você esteja orando. É difícil não voltar atrás quando você está ouvindo seu cônjuge clamar a Deus humildemente e pedir a Ele por misericórdia em meio a sua pior crise. Em oração, as duas pessoas se lembram de que Deus as fez uma. Em Sua presença unificadora, a discórdia se rende à beleza.

Orar por seu cônjuge leva seu coração a se importar mais profundamente com ele. Porém, ainda mais importante que isto, Deus se agrada, ainda mais, quando vê vocês dois se humilhando e buscando a Sua face juntos. A bênção de Deus desce sobre vocês quando concordam em oração.

A palavra que Jesus usou quando falava de "concordância" em oração dá a idéia de uma sinfonia harmônica. Duas notas separadas, tocadas cada uma a seu tempo, soam de maneira diferente. Elas são opostas uma a outra. Mas se tocadas ao mesmo tempo - em concordância - elas criam uma agradável sensação de harmonia. Juntas elas têm um som mais pleno, mais completo do que quando tocadas separadamente. Concordar em oração é assim - mesmo em meio ao desentendimento. Isso atrai ambos em direção ao que realmente importa. Coloca vocês em solo comum, face a face com o Pai. Restaura a harmonia em meio à contenda.

A igreja, que nas Escrituras tem uma conotação de casa mento com Cristo, pode, às vezes, ser o lugar onde o conflito governa. A discórdia que surge de vários problemas pode afastar a igreja de sua missão e interromper o livre fluir da adoração e da unidade. Por vezes, líderes cristãos percebem o que está acontecendo, acabam com as discussões e chamam o povo de Deus para orar. Em lugar de continuar com a discórdia.e permitir que mais sentimentos sejam feridos, eles buscam a unidade ao voltar o coração para Deus e pedir ajuda a Ele.

A mesma coisa acontece em nossas casas quando existe a intervenção da oração, mesmo em pontos elevados de discórdia; "Ela estanca o sangramento. Aquieta as altas vozes. Quando você entende na presença de quem está, a oração lhe tranqüiliza.

Mas a função da oração é muito mais do que acabar com as brigas. A oração é um privilégio a ser curtido em uma base diária e consistente. Quando você sabe que o tempo de oração lhe espera antes de ir dormir, ela mudará a maneira como você passa suas noites. Mesmo se as orações de vocês forem freqüentemente curtas e objetivas, isso se tornará um compromisso permanente de manter Deus no centro de tudo em sua vida.

É verdade que iniciar um hábito como este pode parecer, a princípio, desconfortável e embaraçoso. No mínimo este hábito lhe surpreenderá com seu peso e sua responsabilidade quando você realmente tentar fazê-lo. Mas tenha em mente que Deus deseja que você se envolva com Ele - de fato, Ele lhe convida – e fará você crescer à medida que levar isso a sério e superar as vezes que você não sabe o que dizer.

Você olhará para o passado, nesta aliança comum que percorre tudo, desde aquela simples decisão, até ao que diz respeito a decisões mais sérias e será muito grato a Deus por este aspecto que mudou tudo. Esta é uma área onde é essencial que vocês concordem.

» Desafio de hoje »

Pergunte ao seu cônjuge se vocês podem começara orar juntos. Conversem sobre a melhor hora para fazer isso, seja pela manha na hora do almoço ou antes de dormir. Utilize este tempo para colocar suas preocupações, discórdias e necessidades diante do senhor. Não esqueça de agradecê-lo pela provisão e pelas bênçãos. Mesmo se o seu cônjuge se recusara fazer isso, decida ter esse tempo de oração diariamente ainda que sozinho.

- Anote aqui quando o desafio de hoje estiver completo.

O que você pode fazer para que o seu marido ou a Sua esposa esteja disposto (a) a orar junto com você? Se vocês concordaram em orar juntos, como foi? O que você aprendeu com isso?

Já de manhã a minha oração chega a Tua presença. (Salmos 88:13)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 39;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 38 - O Amor realiza sonhos$t$, 39,
$conteudo$Deleite-se no Senhor, e ele atenderá aos desejos do seu coração. - Salmos 37•4

O que o seu cônjuge iria gostar muito, mas muito mesmo? Com que freqüência você se faz essa pergunta?

O senso comum nos diz que não podemos dar rude o que nosso marido ou esposa gostaria. Nosso orçamento e saldo bancário nos dizem que provavelmente não poderemos arca com isso de forma alguma. E mesmo se pudéssemos, poderia não ser muito bom para nós. Ou para ele (a).

Contudo, talvez você esteja deixando que o "não" seja a resposta mais rápida. Talvez, você esteja deixando esta configuração negativa se tornar muito racional e lógica, muito automática. O que aconteceria se em lugar de afastar o pensamento, você desse seu melhor para honrar os desejos do seu cônjuge? O que aconteceria se aquilo que você disse que nunca faria por ele se tornasse a próxima coisa a ser feita? O amor, às vezes, precisa ser extravagante. Fazer o que parece impossível. Ele, às vezes, precisa deixar as técnicas de lado e fazer um agrado só porque deseja. Esse pensamento é muito característico de adolescentes? Amor como este não está mais a disposição depois de tantos anos de casamento? Além disso, da forma como o seu casamento deve estar no momento, não seria hipocrisia agradar seu cônjuge se seu coração não está nisso?

Bem, o que você acha de colocar seu coração nisso? O que acha de adotar um novo nível de amor que verdadeiramente queira realizar cada sonho e desejo possível? O amor de Deus já não supriu necessidades em seu coração que já lhe pareceram fora de questão? Você estava vivendo sob uma carga tão grande de pecado e arrependimento, que chegou a pensar que nunca retornaria ao caminho da Sua graça. Mas Ele olhou para você com amor e disse que você não tinha que se preocupar. Ele queria você de volta. Ele desejava que você entendesse o quanto precisa d’Ele e, ao se arrepender e voltar-se para Ele, Ele lhe amaria e perdoaria. "Todavia Deus que é rico em misericórdia, pelo grande amor com que nos amou, deu-nos vida com Cristo, quando ainda estávamos mortos em transgressões" (Efésios 2:4-5).

Você pensou que a vida se acabou quando um certo contratempo tirou todo o vento da sua embarcação. Você perdeu suas forças e clamou a Ele. Você orou como nunca antes havia orado. E mesmo não sendo fácil voltar e prosseguir, de alguma forma você sobreviveu. Ele alcançou você com a paz que prometera "que excede todo o entendimento" (Filipenses 4:7) e lhe manteve firme.

Não foi quando você estava se comportando como um anjo que Deus escolheu derramar Seu amor sobre você. Não foi porque você era tão merecedor que Ele lhe ofereceu Sua graça. "Deus demonstra Seu amor por nós: Cristo morreu em nosso favor quando ainda éramos pecadores" (Romanos 5:8).

Ele é o seu modelo. Ele é Aquele cujo amor é feito para ser imitado. Mesmo você não sendo um candidato adequado ao Seu amor, Ele lhe amou assim mesmo. Ele pagou o preço. Nem tudo o que o seu cônjuge deseja tem um preço muito alto. Nem tudo o que ele deseja pode ser comprado com dinheiro. Sua esposa pode desejar o seu tempo. Ela pode realmente querer a sua atenção. Ela pode desejar ser tratada como uma rainha, desejar saber que seu marido a considera como seu maior tesouro. Ela pode desejar ver em seus olhos um amor que se faz presente não importa o que aconteça.

Seu esposo pode realmente desejar o seu respeito. Ele pode querer que você o reconheça como o cabeça da casa frente aos seus filhos. Ele pode desejar muito que você o abrace sem razões específicas, que o surpreenda com um beijo demorado ou um bilhete de amor quando não tem um aniversário ou uma data comemorativa para justificar. Ele pode precisar muito saber que você ainda o acha forte e bonito, da forma como achava antes.

Os sonhos e desejos vêm em todas as formas e tamanhos, mas o amor observa cuidadosamente cada uma dessas formas e tamanhos.

• O amor convida você a ouvir o que seu cônjuge está dizendo e desejando.

• O amor convida você a lembrar das coisas que são únicas em seu relacionamento, os prazeres e alegrias que trazem o sorriso a face um do outro.

• O amor encoraja você a dar quando é muito mais conveniente esperar.

• E o amor convida você a ter devaneios tão regulares com essas Oportunidades que os desejos de seu cônjuge se tornarão os seus também.

Nós desafiamos você a pensar em termos de inundar o seu cônjuge com amor. A surpreendê-la com Sua bondade. Esse pode ser ou não um sacrifício financeiro, mas necessita refletir um coração que está disposto a se expressar de maneira extravagante.

O que o seu cônjuge iria gostar muito, mas muito mesmo?

É hora de começar a colocar esses pensamentos em prática.

» Desafio de hoje »

Pergunte a si mesmo o que o seu cônjuge iria querer se fosse possível de obter. Leve isso em oração e comece a mapear um plano para atender a alguns ('se não todos) desses? Desejos, em todos os níveis possíveis.

- Anote aqui quando o desafio de hoje estiver completo.

queria você de volta. Ele desejava que você entendesse o quanto precisa d’Ele e, ao se arrepender e voltar-se para Ele, Ele lhe amaria e perdoaria. "Todavia Deus que é rico em misericórdia, pelo grande amor com que nos amou, deu-nos vida com Cristo, quando ainda estávamos mortos em transgressões" (Efésios 2:4-5).

Você pensou que a vida se acabou quando um certo contratempo tirou todo o vento da sua embarcação. Você perdeu suas forças e clamou a Ele. Você orou como nunca antes havia orado. E mesmo não sendo fácil voltar e prosseguir, de alguma forma você sobreviveu. Ele alcançou você com a paz que prometera "que excede todo o entendimento" (Filipenses 4:7) e lhe manteve firme.

Não foi quando você estava se comportando como um anjo que Deus escolheu derramar Seu amor sobre você. Não foi porque você era tão merecedor que Ele lhe ofereceu Sua graça. "Deus demonstra Seu amor por nós: Cristo morreu em nosso favor quando ainda éramos pecadores" (Romanos 5:8).

Ele é o seu modelo. Ele é Aquele cujo amor é feito para ser imitado. Mesmo você não sendo um candidato adequado ao Seu amor, Ele lhe amou assim mesmo. Ele pagou o preço. Nem tudo o que o seu cônjuge deseja tem um preço muito alto. Nem tudo o que ele deseja pode ser comprado com dinheiro. Sua esposa pode desejar o seu tempo. Ela pode realmente querer a sua atenção. Ela pode desejar ser tratada como uma rainha, desejar saber que seu marido a considera como seu maior tesouro. Ela pode desejar ver em seus olhos um amor que se faz presente não importa o que aconteça.

Seu esposo pode realmente desejar o seu respeito. Ele pode querer que você o reconheça como o cabeça da casa frente aos seus filhos. Ele pode desejar muito que você o abrace sem razões específicas, que o surpreenda com um beijo demorado ou um bilhete de amor quando não tem um aniversário ou uma data comemorativa para justificar. Ele pode precisar muito saber que você ainda o acha forte e bonito, da forma como achava antes.

Os sonhos e desejos vêm em todas as formas e tamanhos, mas o amor observa cuidadosamente cada uma dessas formas e tamanhos.

• O amor convida você a ouvir o que seu cônjuge está dizendo e desejando.

• O amor convida você a lembrar das coisas que são únicas em seu relacionamento, os prazeres e alegrias que trazem o sorriso a face um do outro.

• O amor encoraja você a dar quando é muito mais conveniente esperar.

• E o amor convida você a ter devaneios tão regulares com essas Oportunidades que os desejos de seu cônjuge se tornarão os seus também.

Nós desafiamos você a pensar em termos de inundar o seu cônjuge com amor. A surpreendê-la com Sua bondade. Esse pode ser ou não um sacrifício financeiro, mas necessita refletir um coração que está disposto a se expressar de maneira extravagante.

O que o seu cônjuge iria gostar muito, mas muito mesmo?

É hora de começar a colocar esses pensamentos em prática.

» Desafio de hoje »

Pergunte a si mesmo o que o seu cônjuge iria querer se fosse possível de obter. Leve isso em oração e comece a mapear um plano para atender a alguns ('se não todos) desses? Desejos, em todos os níveis possíveis.

- Anote aqui quando o desafio de hoje estiver completo.

O que tem lhe deixado resistente a realizar os desejos que seu cônjuge sempre teve? Se ele soubesse que os sonhos dele são prioridade para você, como seu casamento seria mudado? Quais os desejos que você está tentando realizar?

Deus é poderoso para fazer que lhes seja acrescentada toda graça, (2 Coríntios 9:8)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 40;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 39 - O Amor permanece$t$, 40,
$conteudo$O amor nunca perece. - 1 Coríntios 13:8

De todos os desafios do amor, este é o supremo. Mesmo ameaçado, o amor persevera. Mesmo desafiado ele segue em frente. Mesmo maltratado e rejeitado, ele se recusa a desistir.

O amor nunca perece.

Muitas vezes quando o casamento está em crise, o cônjuge que tenta fazer com que as coisas funcionem bem se chegará ao outro e, declarando com precisão que não importa o que tenha acontecido no passado, ele está comprometido com o casamento. É certo que o seu amor irá permanecer. Ele prometeu. Mas o outra cônjuge ainda não deseja ouvir isso, e conserva sua posição. Eles ainda' resistem. Eles não vêem o casamento a longo prazo. E eles nem mesmo desejam que isso aconteça mais.

Aqueles que foram expostos a essa situação difícil, que tentaram restaurar o que foi destruído, não podem lidar com a rejeição. Assim, eles acabam declarando: "Tudo bem. Se você quer dessa maneira, é assim que vai ser."

Mas se o amor é realmente amor, ele não hesita quando não é recebido da maneira como gostaria. Se podem dizer para o amor desistir de amar, então este verdadeiramente não é amor. O amor que vem de Deus é permanente, impossível de ser parado. Se o objeto desse afeto não quer recebê-lo, o amor continua amando do mesmo jeito.

O amor nunca perece. Nunca.

O amor de Jesus é assim. Os seus discípulos eram totalmente imprevisíveis. Após comemorarem juntos a Páscoa, quando Jesus disse que eles o abandonariam antes da noite terminar, Pedro declarou, Ainda que todos se escandalizem de ti, eu nunca me escandalizarei... Ainda que me seja necessário morrer contigo, de modo algum lhe negarei" (Mateus 26:33,35). E todos os outros discípulos falaram a mesma coisa. Porém, mais tarde, ainda naquela noite, o grupo fechado de seguidores de Jesus - Pedro, Tiago e João - foram capazes de dormir enquanto Jesus passava por agonia no jardim. No caminho da crucificação de Cristo, Pedro o negaria três vezes no pátio. Mas naquele momento preciso, a Bíblia diz que Jesus "virou e olhou" para ele (Lucas 22:61). Os seus discípulos falharam com Ele - mais uma vez - após algumas horas de terem feito promessas. Ainda assim, Ele nunca deixou de amá-los, porque Ele e Seu amor são "o mesmo ontem, hoje e para sempre"

(Hebreus 13:8).

Quando você faz de tudo dentro das suas possibilidades para obedecer a Deus, seu cônjuge pode ainda lhe abandonar e ir embora - assim como os seguidores de Jesus fizeram com Ele. Mas se o seu casamento falhar, se o seu cônjuge for embora, não deixe que a razão disso seja por que você desistiu do casamento ou parou de amá-la. O amor nunca perece.

Dos nove "frutos do Espírito" listado em Gálatas 5, o primeiro de todos é o amor. E porque a fonte desse amor é o imutável Espírito Santo - o mesmo Santo Espírito que habita no coração de todos os cristãos - então o amor que Ele coloca em você é imutável também. Ele é baseado na vontade de Deus, no chamado de Deus e na Palavra de Deus - todos imutáveis. A Bíblia os declara "irrevogáveis" (Romanos 11:29). "Os céus e a terra passarão, mas as minhas palavras jamais passarão" (Lucas 21:33).

Há apenas alguns dias você foi desafiado a construir amorosamente seu casamento na Palavra de Deus. Isso para que quando todo o resto falhar, a verdade de Deus ainda permaneça firme. Ao longo do caminho você também foi desafiado a ser paciente, a não ser egoísta, a se sacrificar pelas necessidades do seu cônjuge.

Estas não são apenas idéias amorosas que existem isoladas. Cada qualidade do amor destacada neste livro está baseada no amor de Deus, capturado e expressado em Sua Palavra. A imutável Palavra de Deus. Não há desafio ou circunstância que possa colocar uma data de vencimento n’Ele ou em Seu amor. Então, o seu amor - feito das mesmas substâncias - produz o mesmo, características imutáveis.

O amor nunca perece.

Então o desafio de hoje é colocar o seu amor inesgotável em palavras mais poderosas e íntimas possíveis. Esta é a sua chance de declarar que não importa quais as imperfeições existentes _ tanto em você quanto em seu cônjuge - o seu amor é ainda maior. Não importa o que ele tenha feito ou com que freqüência fez isso, você escolheu amá-lo assim mesmo. Apesar de você ter sido descuidado no tratamento com ele com o passar dos anos, seus dias de inconsistência no amor acabaram. Você aceita este homem ou esta mulher como um presente especial de Deus para você e promete amá-lo (a) até a morte.

Você está dizendo ao seu cônjuge, "Mesmo que você não goste do que está lendo mesmo que você não goste de mim - eu escolho amar você assim mesmo. Para sempre".

Porque o amor nunca perece.

» Desafio de hoje »

Passe um tempo orando individualmente, então escreva uma carta de comprometimento ao seu cônjuge. Inclua a razão pela qual está se comprometendo com este casamento até a morte e que decidiu amá-lo não importam as razões. Deixe-a em um lugar onde o seu cônjuge possa encontrá-la.

- Anote aqui quando o desafio de hoje estiver completo.

Quais foram as hesitações que você teve ao escrever esta carta? Como você espera que o seu cônjuge responda a ela? Como Deus lhe ajudou a escrevê-la e o que este processo lhe ensinou sobre você mesmo?

Tu... tens prazer em demonstrar amor (Miquéias 7:18)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 41;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dia 40 - O Amor é uma aliança$t$, 41,
$conteudo$Porque aonde quer que tu fores, irei eu; e onde quer que pousares, ali pousarei eu; o teu povo será o meu povo, o teu Deus será o meu Deus. – Rute 1:16

Parabéns. Você chegou ao final de O Desafio de Amar _ o livro. Mas a experiência e o desafio de amar o seu cônjuge é algo que não tem que ter um fim. Continua para o resto da sua vida.

Este livro termina no 40° dia, mas quem disse que o seu desafio terminou? E, à medida que você vê o seu casamento por essa perspectiva, nós desafiamos você a considerá-lo como uma aliança e não como um contrato. Essas duas palavras são parecidas em significado e intenção mas na realidade são bastante diferentes. Ver o casamento como um contrato é como dizer ao seu cônjuge, "Eu tomo você para mim e vamos ver se dá certo". Porém, vê-lo como uma aliança muda a fala para, "Eu me entrego a você e me comprometo com este casamento por toda a minha vida". Existem muitas outras diferenças entre alianças e contratos. Um contrato é geralmente um acordo escrito baseado em desconfiança, traçando as condições e conseqüências caso seja quebrado. Uma aliança é um compromisso verbal baseado na verdade, assegurando a alguém de que a sua promessa é incondicional e boa para a vida. É feita diante de Deus como um ato de amor um pelo outro.

Um contrato é para interesse próprio e vem com responsabilidades limitadas. Ele estabelece um período de tempo para a vida útil de certas mercadorias. Uma aliança é para benefício de outros e vem com responsabilidades ilimitadas. Não tem data.valide. É até que a morte nos separe". Um contrato pode ser quebrado com consentimento mútuo. Uma aliança é planejada para ser inquebrável. A Bíblia contém muitas outras alianças maiores como parte da declarada história do povo de Deus. Deus fez uma aliança com Noé prometendo que a terra nunca mais seria destruída pelas águas de um dilúvio (Gênesis 9:12-17). Ele fez uma aliança com Abraâo prometendo que uma nação inteira de descendentes viria da linhagem da sua família (Gênesis 17: 1-8). Ele fez uma aliança com Moisés declarando que o povo de Israel seria possessão permanente de Deus (Êxodo 19:3-6). Ele fez uma aliança com Davi prometendo que um rei se assentaria em seu trono para sempre (2 Samuel 7:7- 16). No final de tudo, Ele fez uma "nova aliança" pelo sangue de Cristo, estabelecendo uma herança interminável e imutável de perdão de pecados e de vida eterna para aqueles que crêem n’Ele (Hebreus 9:15). E nenhuma vez sequer Deus quebrou alguma dessas alianças.

E tem o casamento - a aliança mais forte entre duas pessoas na terra, a promessa de um homem e uma mulher de estabelecerem um amor que é incondicional e que dura por toda uma vida. No casamento, o anel representa os votos da aliança - não meras obrigações que você espera cumprir, mas promessas pensadas previamente, declaradas publicamente e testemunhadas por outros.

Assim como você leu inúmeras vezes nas páginas desse livro, manter esta aliança não é algo que você pode fazer pelas suas próprias forças. Existe uma razão que explica por que Deus foi o primeiro a estabelecer alianças com Seu povo. Apenas Ele é capaz de cumprir as exigências de Suas próprias promessas. Apenas Ele é capaz de perdoar os que fazem aliança com Ele, mas falham em,manter a sua parte no acordo. Mas o Espírito de Deus está em você em razão da sua fé em Seu Filho e da graça concedida a você em salvação. Isso significa que agora você pode exercitar seu papel de protetor da aliança, não importa o que se levante para desafiar sua fidelidade a ela. Especialmente se o seu cônjuge não está agora no lugar de receber o seu amor, o ato de proteger a aliança pode crescer mais ameaçador com o passar dos dias. Mas o casamento não e um contrato com cláusulas escapatórias e exceções. O casamento é uma aliança projetada para acabar com todos os atalhos de fuga ou retrocesso. Não há nada em todo o mundo que possa separar o que Deus uniu. O seu amor é baseado na aliança.

Centenas de anos após o profeta Malaquias ter registrado estas palavras, as pessoas ainda se perguntam por que Deus às vezes retém Sua mão de abençoar suas casas e casamentos. "Todavia perguntais: Por quê? Porque o Senhor tem sido testemunha entre ti e a mulher da tua mocidade, para com a qual procedeste deslealmente sendo ela a tua companheira e a mulher da tua aliança. Pois eu detesto o divórcio, diz o Senhor Deus de Israel, e aquele que cobre de violência o seu vestido; portanto cuidai de vós mesmos, diz o Senhor dos exércitos; e não sejais infiéis." (Malaquias 2: 14, 16)

Todo casamento é chamado para ser um retrato terreno da aliança celestial de Deus com a igreja. O casamento é para mostrar ao mundo a glória e a beleza do amor incondicional de Deus por nós. Jesus disse, "como o Pai me amou, assim eu os amei; permaneçam no meu amor" (João 15:9). Permita que a Palavra d’Ele o inspire a ser canal do amor de Deus para o seu cônjuge.

A hora é agora, homem ou mulher de Deus, de renovar a sua aliança de amor com toda sinceridade e entrega. O amor é um tesouro sagrado para ser trocado por outro, e um laço muito poderoso para ser quebrado sem conseqüências terríveis. Ligue-se mais uma vez àquele (a) que Deus entregou para você cuidar, apreciar e honrar. A união de vocês está em suas mãos. Seja desafiado a segurá-la e nunca deixá-la acabar.

Nós desafiamos você.

» Desafio de hoje »

Escreva novas promessas assim como você fez no dia do seu casamento. Guarde-as em algum lugar da sua casa. Talvez, se for apropriado, você pode renovar essas promessas formalmente diante de um ministro e com a família presente. Faça dessas promessas um testamento vivo do valor do casamento aos olhos de deus e da grande honra de ser um com seu cônjuge.

- Anote aqui quando o desafio de hoje estiver completo.

O que Deus lhe revelou durante a jornada de O Desafio de Amar? Como a sua visão de casamento mudou? Qual o seu nível de comprometimento com Deus e com o seu cônjuge? Com quem você pode compartilhar isso como testemunho?

Ele se lembra para sempre da sua aliança. (Salmos 105:8)$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 42;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice I - As trancas e as chaves da oração eficaz$t$, 42,
$conteudo$A oração de um justo é poderosa e eficaz. - Tiago 5: 16

AS TRANCAS: DEZ COISAS QUE BLOQUEIAM A ORAÇÃO

1. Orar sem conhecer a Deus por meio de Jesus - João 14:6 - Respondeu-lhe Jesus: "Eu sou o caminho, e a verdade, e a vida; ninguém vem ao Pai, senão por mim."

2. Orar com o coração que não expressa arrependimento - Salmos 66:18-19 - "Se eu acalentasse o pecado no coração, o Senhor não me ouviria; mas Deus me ouviu, deu atenção à oração que lhe dirigi."

3. Orar para aparecer - Mateus 6:5 - "E, quando orardes, não sejais como os hipócritas; pois gostam de orar em pé nas sinagogas, e nas esquinas das ruas, para serem vistos pelos homens. Em verdade vos digo que já receberam a sua recompensa."

4. Orar com palavras repetitivas e vazias - Mateus 6:7-8 - "E, orando, não useis de vãs repetições, como os gentios; porque pensam que pelo seu muito falar serão ouvidos.

Não vos assemelheis, pois, a eles; porque vosso Pai sabe o que vos é necessário, antes de vós lho pedirdes."

5. Orações não feitas - Tiago 4:2 - "Nada tendes, porque não pedis."

6. Orar com coração ambicioso - Tiago 4:3 - "Pedis e não recebeis, porque pedis mal, para o gastardes em vossos deleites."

7. Orar enquanto maltrata seu cônjuge - 1 Pedro 3:7 - "Igualmente vós, maridos, vivei com elas com entendimento, dando honra à mulher... e como sendo elas herdeiras convosco da graça da vida, para que não sejam impedidas as vossas orações."

8. Orar enquanto ignora o pobre - Provérbios 21: 13 - "Quem tapa o seu ouvido ao clamor do pobre, também clamará e não será ouvido."

9. Orar com amargura no coração por alguém - Marcos 11:25-26 - "Quando estiverdes orando, perdoai, se tendes alguma coisa contra alguém, para que também vosso Pai que está no céu, vos perdoe as vossas ofensas."

10. Orar sem fé no coração - Tiago 1:6-8 - "Peça-a, porém, com fé, não duvidando; pois aquele que duvida é semelhante à onda do mar, que é sublevada e agitada pelo vento. Não pense tal homem que receberá do Senhor alguma coisa, homem vacilante que é, e inconstante em todos os seus caminhos."

AS CHAVES: DEZ COISAS QUE TORNAM A ORAÇÃO EFICAZ

1. Orar pedindo, buscando e batendo - Mateus 7: 7-8, 11 - "Pedi, e dar-se-vos-á; buscai, e achareis; batei e abrir-se-vos-á. Pois todo o que pede, recebe; e quem busca, acha; e ao que bate, abrir-se-lhe-a. Se vós, pois, sendo maus, sabeis dar boas dádivas a vossos filhos, quanto mais vosso Pai, que está nos céus, dará boas coisas aos que lhas pedirem?"

2. Orar com fé - Marcos 11:24 - "Por isso vos digo que tudo o que pedirdes em oração, crede que o recebereis, e tê-lo-eis."

3. Orar em secreto - Mateus 6:6 - "Mas tu, quando orares, entra no teu quarto e, fechando a porta, ora a teu Pai que está em secreto; e teu Pai, que vê em secreto, te recompensará."

4. Orar segundo a vontade de Deus - 1 João 5:14 - "E esta é a confiança que temos nele, que se pedirmos alguma coisa segundo a Sua vontade, Ele nos ouve."

5. Orar em nome de Jesus - João 14: 13-14 - "E tudo quanto pedirdes em meu nome, eu o farei, para que o Pai seja glorificado no Filho. Se me pedirdes alguma coisa em meu nome, eu a farei."

6. Orar em concordância com outros crentes - Mateus 18:19-20 - "Ainda vos digo mais: Se dois de vós na terra concordarem acerca de qualquer coisa que pedirem, isso lhes será feito por meu Pai, que está nos céus. Pois onde se acham dois ou três reunidos em meu nome, aí estou eu no meio deles."

7. Orar enquanto jejua - Atos 14:23 - "E, havendo-lhes feito eleger anciãos em cada igreja e orado com jejuns, os encomendaram ao Senhor em quem haviam crido."

8. Orar com uma vida em obediência - 1 João 3:21-22 - "Amados, se o coração não nos condena, temos confiança para com Deus; e qualquer coisa que lhe pedirmos, dele a receberemos, porque guardamos os seus mandamentos e fazemos o que é agradável à sua vista."

9. Orar firme em Deus e em Sua Palavra - João 15:7 - "Se vós permanecerdes em mim, e as minhas palavras permanecerem em vós, pedi o que quiserdes, e vos será feito."

10. Orar enquanto deleita-se no Senhor - Salmos 37:4 - "Deleita-te também no Senhor, e ele te concederá o que deseja o teu coração."

UM RESUMO DAS TRANCAS E DAS CHAVES DA ORAÇÃO

1. Você precisa ter um relacionamento justo com Deus.

2. Você precisa ter um relacionamento justo com outras pessoas.

3. Seu coração precisa ser justo.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 43;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice II - Vinte perguntas para seu cônjuge$t$, 43,
$conteudo$Seja em um encontro ou durante uma conversa particular, tente utilizar as perguntas abaixo para aprender mais sobre o coração do seu cônjuge. Deixe que os tópicos levantem perguntas adicionais que você queira explorar, mas mantenha o foco e o humor positivos. Ouça mais que fale.

PERGUNTAS PESSOAIS

Quais são os maiores sonhos e esperanças do seu cônjuge?

• O que você mais gosta em sua vida agora?

• O que você menos gosta em sua vida agora?

• Como seria o emprego dos seus sonhos?

• Quais são as coisas que você sempre quis fazer mas ainda não teve oportunidade?

• Quais as três coisas que você deseja fazer antes de terminar o ano?

• Com quem você se sente mais "seguro(a)" de estar? Por quê?

• Se você pudesse almoçar com qualquer pessoa desse mundo, quem seria essa pessoa e por quê?

• Quando foi a última vez que você se sentiu muito alegre?

• Se você tivesse que dar um milhão de dólares para alguém, a quem você daria?

CONJUGAL

• Quais são as três coisas que eu faço que você mais gosta?

• Quais são as três coisas que eu faço que deixa você enlouquecido(a)?

• Que coisa eu fiz no passado que fez você se sentir amado (a)?

• O que eu fiz que fez você se sentir desvalorizado(a)?

• Diga três coisas em que eu possa melhorar.

• Das coisas abaixo, qual faria você se sentir mais amada?

Receber massagens e carícias no seu corpo por uma hora.

Sentarmos e conversarmos por uma hora sobre seu assunto favorito.

Ter ajuda com a casa durante uma tarde.

Receber um presente bem legal.

Ouvir palavras encorajadoras que expressam o quanto você é apreciada.

• Quais as coisas que aconteceram no passado que você gostaria que fossem apagadas 'como se nunca tivessem acontecido?

• Qual é a outra grande decisão que Deus quer que tomemos como um casal?

• Como você gostaria que fosse a sua vida daqui a cinco anos?

• Que palavras você gostaria de ouvir de mim com mais freqüência?

Ofereça encorajamento e um ouvido para ouvir. Recuse permitir que isso se torne um argumento ou uma oportunidade para você criticar. Deixe que este seja um tempo para seu cônjuge se expressar.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 44;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice III - A palavra de Deus em minha vida$t$, 44,
$conteudo$Permita que essa declaração o aproxime corretamente da Palavra de Deus. A Bíblia é a Palavra de Deus.

Ela é santa, infalível, verdadeira e completamente leal.

(Provérbios 30:5-6, João 1717, Salmos 119:89)

Ela é capaz de me ensinar, repreender, corrigir e instr uir em justiça. (2 Timóteo 3: 16)

Ela me torna apto e plenamente preparado para toda boa obra. (2 Timóteo 3: 17) Ela é lâmpada para os meus pés e luz para o meu caminho (Salmos 119:105)

Ela me torna mais sábio que os meus inimigos. (Salmos 119:97-100)

Ela me traz estabilidade durante as tempestades da minha vida. (Mateus 7:24-27)

Se eu crer em sua verdade, serei liberto. (João 8:32)

Se eu a esconder em meu coração, serei protegido em tempos de tentação. (Salmos 199: 11)

Se eu permanecer firme na Palavra, serei verdadeiramente um discípulo de Jesus. (João 8:31)

Se eu meditar em suas palavras, serei bem-sucedido. (Josué 1:8)

Se eu guardá-la, serei recompensado e o meu amor aperfeiçoado. (Salmos 19:7-11, 1 João 2:5)

Ela é a viva, eficaz e penetrante Palavra de Deus. (Hebreus 4:12)

Ela é a Espada do Espírito. (Efésios 6•17)

Ela é mais doce que o mel e mais desejável que o ouro. (Salmos 19: 10) Ela é indescritível e para sempre firmada no céu. (2 Coríntios 13:7-8, Salmos 119:89)

Ela é a verdade absoluta sem mistura e sem erro. (João 1717, Tito 1:2)

Ela contém verdades absolutas sobre Deus. (Romanos 3:4, Romanos 1625,27; Colossenses 1)

Ela contém verdades absolutas sobre os homens. (Jeremias 17:9, Salmos 8:4-6)

Ela contém verdades absolutas a respeito do pecado. (Romanos 3:23)

Ela contém verdades absolutas sobre a salvação. (Atos 4:12, Romanos 10:9)

Ela contém verdades absolutas sobre o céu e o inferno. (Apocalipse 21:8; Salmos 119:89)

Senhor, abre os meus olhos para que eu veja a verdade e os meus ouvidos para ouvirem a verdade. Abra meu coração para recebê-la pela fé. Renove a minha mente para guardar a esperança. Entrego a minha vontade para que eu possa viver a Tua Palavra em amor. Lembra-me que sou responsável quando a ouço. Ajuda-me a querer obedecer o que o Senhor diz através da Palavra. Transforme a minha vida para que eu venha conhecer a Tua Palavra. Aflija meu coração para que eu compartilhe a Tua Palavra. Fale agora Senhor. Dá-me paixão para conhecer e seguir a Tua vontade. Nada mais. Nada menos. Apenas isso.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 45;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice IV - Conduzindo o seu coração$t$, 45,
$conteudo$O QUE É O CORAÇÃO?

Sua identidade. O seu coração é a parte mais importante de quem você é. É o centro do seu ser, onde habita o seu "verdadeiro eu". "Como na água o rosto corresponde ao rosto, assim o coração do homem ao homem" (Provérbios 27:19). Como uma pessoa "imaginou na sua alma, assim é" (Provérbios 23:3).

O seu centro. Uma vez que o seu coração físico é o centro do seu corpo e envia sangue que dá a vida a cada célula viva, a palavra "coração" tem sido utilizada há séculos para descrever o lugar onde se inicia todos os pensamentos, crenças, valores, motivações e convicções.

O seu centro de comando. O seu coração é o Pentágono das suas ações. Como resultado, cada área da sua vida é impactada pela direção do seu coração.

O QUE HÁ DE ERRADO EM SEGUIR O MEU CORAÇÃO?

Ele é tolo. O mundo diz "Siga o seu coração!" Esta é a filosofia dos mestres da nova era, dos seminários de auto-ajuda das músicas pop românticas. Esta filosofia vende milhões de livros e gravações porque soa romântica e nobre. O problema é que seguir o seu coração geralmente significa perseguir tudo o que parece correto no momento, seja apropriado ou não.

Significa jogar a cautela e a consciência ao vento. Obter a qualquer custo seus últimos caprichos e desejos, independente do que dizem a lógica e o conselho. A Bíblia diz, "O que confia no seu próprio coração é insensato; mas o que anda sabiamente será livre" (Provérbios 28:26).

Ele é duvidoso. As pessoas esquecem que os sentimentos e emoções são superficiais, inconstantes e duvidosas. Eles podem flutuar dependendo das circunstâncias. Em um esforço de seguir o seu coração, as pessoas têm abandonado seus empregos para fazer parte de uma banda de baixa qualidade no fundo de uma garagem. Têm perdido as economias de toda uma vida para seguir um capricho ou uma corrida de cavalo. Ou têm deixado o cônjuge de toda a vida, para ir em direção a um (a) atraente colega de trabalho que já foi casado (a) por duas vezes. O que parece ser o correto a nível de emoções agradáveis geralmente será considerado um erro terrível anos depois.

Esta filosofia egoísta também é fonte de inúmeros divórcios. Ela leva muitos a se isentarem do compromisso de toda a vida porque não estão mais "apaixonados".

Ele é corrompido. A verdade é, nosso coração é egoísta e pecaminoso. A Bíblia diz, "Enganoso é o coração, mais do que todas as coisas, e perverso; quem o poderá conhecer?" (Jeremias 17:9). Jesus disse, "Porque do coração procedem os maus pensamentos, homicídios, adultérios, prostituição, furtos, falsos testemunhos e blasfêmias" (Mateus 15:19). A menos que o nosso coração seja genuinamente transformado por Deus, ele continuará escolhendo as coisas erradas.

ALGUMA VEZ DEVO SEGUIR O MEU CORAÇÃO?

O Rei Salomão disse, "O coração do sábio o inclina para a direita, mas o coração do tolo o inclina para a esquerda." (Eclesiastes 10:2). Assim como o seu coração pode lhe direcionar ao ódio, à cobiça e à violência, ele também pode ser dirigido pelo amor, pela verdade e pela bondade. Enquanto você caminha com Deus, Ele colocará em seu coração os sonhos que Ele deseja realizar em sua vida. Ele também colocará em seu coração habilidades e dons que deseja desenvolver para a glória d’Ele (Êxodo 35:30-35). Ele colocará em seu coração o desejo de dar (2 Coríntios 9:7) e de adorar (Efésios 5:19).

Quando você coloca Deus em primeiro lugar, Ele irá intervir e cumprir os desejos do seu coração. A Bíblia diz, "Deleita-te também no Senhor, e ele te concederá o que deseja o teu coração" (Salmos 37:4). Mas o único momento em que você se sentirá bem seguindo seu coração é quando você souber que seu coração está inclinado a servir e agradar a Deus.

PORQUE NÃO É SUFICIENTE SEGUIR MEU CORAÇÃO?

Porque o nosso coração é tão sujeito à mudanças e tão suspeito, que as Escrituras deixam uma mensagem muito mais forte do que "siga o seu coração". A Bíblia lhe instrui a direcionar o seu coração. Isso significa tomar a inteira responsabilidade para as condições e direções dele. Entenda que você realmente tem o controle de onde está o seu coração. Você tem o poder que foi dado por Deus de tirar o seu coração de um determinado lugar e colocá-lo em Outro:

Provérbios 23: 17 "Não inveje os pecadores em seu coração."

Provérbios 23: 19 "Guie o seu coração pelo bom caminho."

Provérbios 23:26 "Meu filho, dê-me o seu coração; mantenha os seus olhos em meus caminhos."

1 Reis 8:61 "E seja o vosso coração perfeito para com o Senhor nosso Deus." João 14:27 "Não se turbe o vosso coração, nem se atemorize."

Tiago 4:8 "Purificai os corações."

Tiago 5:8"Fortalecei os vossos corações."

COMO EU GOVERNO O MEU CORAÇÃO?

Primeiro você precisa entender que o seu coração segue seus investimentos. Seja no que for que você colocar o seu tempo, energia e dinheiro, atrairá o seu coração. Isso acontecia antes de você se casar. Vocês escreviam cartas, compravam presentes e passavam tempo juntos como um casal e os seus corações os seguiam. E quando você parou de investir dessa forma no seu relacionamento e se direcionou a outras coisas, o seu coração lhe seguiu até lá também. Se hoje você não está apaixonado por seu cônjuge, deve ser porque parou de investir nele ontem.

Sonde seu coração. Uma das chaves para obter sucesso no governo do seu coração é estar sempre ciente de onde ele está. Você sabe o que tem no seu coração nesse momento? Você pode responder à essa pergunta procurando saber no que você gastou o seu tempo o mês passado, para onde foi o seu dinheiro e do que você está sempre falando?

Guarde o seu coração. Quando algo prejudicial tenta o seu coração, é sua responsabilidade guardá-lo contra a tentação. A Bíblia diz, ''Acima de tudo guarde o seu coração pois dele depende toda a sua vida. (Provérbios 4:23 NVI). Não deixe o seu coração colocar o dinheiro e o trabalho acima do seu cônjuge e da sua família. Não deixe o seu coração cobiçar a beleza de uma outra mulher (Provérbios 6:25). A Bíblia diz, "Não confieis na opressão, nem vos vanglorieis na rapina; se as vossas riquezas aumentarem, não ponhais nelas o coração" (Salmos 62:10).

Procurem as coisas que são do alto. O apóstolo Paulo disse, "Procure as coisas que são do alto, onde Cristo está assentado à direita de Deus" (Colossenses 3:1 NVI). É hora de identificar onde o seu coração precisa estar e então, decidir colocá-lo nessas coisas. Você diz, "Mas na verdade, eu não quero tanto assim investir em meu casamento. Preferiria fazer isso ou aquilo". Eu sei. Você já colocou o seu coração nisso no passado e agora está preso à mentalidade "Siga o seu coração". Porém, você não precisa deixar que os seus sentimentos lhe governem mais. A cobiça é colocar o seu coração em algo que é proibido e errado. Você pode escolher tirar o seu coração das coisas erradas e colocá-lo no que é correto.

Invista em seu coração. Não espere até querer fazer o que é certo. Não espere sentir-se apaixonado por sua esposa para então investir em seu relacionamento.

Comece olhando para o seu casamento e investindo no lugar onde o seu coração precisa estar. Gaste tempo com seu cônjuge. Compre presentes. Escreva cartas. Marque encontros. Quanto mais você investir, mais o seu coração valorizará o seu relacionamento. É sobre isso que trata O Desafio de Amar - quarenta dias direcionando o seu coração a amar seu cônjuge.$conteudo$)
    returning id into v_aula_id;
  end if;
end;
$migration$;
