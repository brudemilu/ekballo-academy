-- 272_curso_perspectivas.sql
-- Curso "Perspectivas no Movimento Cristão Mundial" (guia de estudo).
-- Cada lição reúne mais de um conteúdo: o guia de estudo e as leituras
-- indicadas por ele. Por isso o título da aula traz a lição e a peça
-- ("Lição 1 · Guia de estudo", "Lição 1 · Leitura ...") — a `ordem` mantém
-- a sequência de leitura dentro da lição.
-- Idempotente: pode rodar de novo sem duplicar.

do $curso$
declare
  v_curso uuid;
begin
  insert into cursos (slug, titulo, descricao, imagem_url, categoria,
                      autor, aulas_livres, publicado, ordem)
  values (
    'perspectivas',
    'Perspectivas no Movimento Cristão Mundial',
    $desc$Guia de estudo do curso Perspectivas: uma caminhada pela história bíblica do propósito de Deus entre todos os povos, nas quatro dimensões do Movimento Cristão Mundial — bíblica, histórica, cultural e estratégica.$desc$,
    '/api/og/curso/perspectivas',
    'ensino',
    'Ralph D. Winter e Steven C. Hawthorne (org.)',
    true,
    true,
    (select coalesce(max(ordem), 0) + 1 from cursos)
  )
  on conflict (slug) do update
    set titulo = excluded.titulo,
        descricao = excluded.descricao,
        imagem_url = excluded.imagem_url,
        categoria = excluded.categoria,
        autor = excluded.autor,
        aulas_livres = excluded.aulas_livres
  returning id into v_curso;

  if v_curso is null then
    select id into v_curso from cursos where slug = 'perspectivas';
  end if;

  -- Lição 1 · Guia de estudo
  if exists (select 1 from aulas where curso_id = v_curso and ordem = 1) then
    update aulas
       set titulo = $t$Lição 1 · Guia de estudo — Deus é um Deus Missionário$t$,
           conteudo = $conteudo$Nosso Deus tem um propósito global. Ele colocou em nossos corações o desejo de sermos Seus amigos. Temos o desejo de colaborar com Deus nesta tarefa e de vivermos na dignidade de um propósito que é maior do que nossos próprios interesses. Realmente queremos servir a Deus da melhor maneira possível. O que nos impede? Nosso maior problema é que nossa visão é limitada.

Embora saibamos que Deus não é apenas aquele que só serve para resolver os nossos problemas pessoais, ainda é comum considerarmos Deus do nosso ponto de vista, como se Ele estivesse de plantão para nos ajudar cada vez que enfrentamos circunstâncias difíceis. Nossa visão é limitada pelo horizonte das nossas próprias preocupações e cultura. Mas existe um destino melhor, um propósito maior. Podemos nos apropriar disso ao conhecermos e seguirmos a Deus em direção a uma visão que ultrapassa nossa própria percepção acerca de nós mesmos.

Nesta lição começaremos uma jornada para descobrir o que Deus revelou a respeito do Seu propósito. Os Seus propósitos fazem mais sentido quando são vistos ao longo da história da Bíblia. Uma caminhada com Deus através da história das Escrituras nos lançará no centro do significado do restante da história.

Com o progresso da história, o propósito de Deus fica mais claro, pois tudo está se cumprindo assim como Ele prometeu. Porque Ele é um Deus de grande propósito e há uma missão que Ele se propôs a cumprir. Nosso Deus é um Deus missionário.

ESTUDAR ESTA LIÇÃO O AJUDARÁ

1. Entender por que a aliança que Deus fez com Abraão revela o Seu propósito para cada povo.

2. Explicar como toda a Bíblia apresenta um forte mandato para a missão em todas as nações.

3. Compreender como Deus cumpre Suas promessas progressivamente através da história e como elas formam uma parte importante do nosso mandato para fazer missões.

4. Entender por que o empreendimento de missões tem base bíblica substancial que convoca cada crente a cumprir a sua parte.

5. Demonstrar como empreender o propósito missionário de Deus que se dá em três direções: em relação ao próprio Deus, em prol de todas as nações e a respeito dos poderes malignos de satanás.

NO NÍVEL AVANÇADO

6. Compreender como a primeira promessa de Deus no jardim do Éden reflete o Seu propósito missionário.

7. Explicar como a Bíblia fornece a mensagem o modelo e o poder para realizar missões.

PALAVRA CHAVE

[cite] PROPÓSITO Fomos feitos para viver com um propósito. O próprio Deus vive com um propósito. A maneira de viver uma vida significativa é dedicar a sua vida a um propósito maior do que a sua própria vida.

1. A PROMESSA DE DEUS REVELA O SEU PROPÓSITO

Deus poderia ter revelado o Seu propósito na forma de mandamentos diretos a respeito daquilo que Ele queria que fosse feito. Em vez disso, Deus escolheu revelar o Seu propósito na forma de uma promessa, que é tanto pessoal quanto global: abençoar todas as famílias da terra.

[cite] Abra sua Bíblia em Gênesis 12. Este é o ponto da virada na Bíblia. Olhe as páginas de Gênesis 1-11. Que coisas estão acontecendo nessas passagens? A quais nações ou povos estas passagens estão se referindo? Agora atente para as páginas de Gênesis 12 em diante. Esta porção diz respeito a outros povos diferentes dos hebreus? Qual é a diferença central entre o que acontece em Gênesis 1-11 e o que acontece no restante da Bíblia a partir de Gênesis 12?

A Promessa de Deus

Um mandato é melhor do que um mero mandamento. Deus deu o Seu mandato inicialmente na forma de uma promessa em vez de um mandamento direto, pois a ênfase está muito mais naquilo que Deus iria fazer do que naquilo que Abraão deveria fazer. Deus enfatizou o resultado que Ele quis ver entre todos os povos da terra ao invés de ordenar Abraão a fazer alguma coisa e dar-lhe orientações detalhadas. Pensando bem, haveria uma maneira melhor de Deus entregar o Seu propósito para Sua família de fé que estaria trabalhando com Ele por milhares de anos?

A promessa revela as intenções de Deus claramente a cada estágio do seu cumprimento. Cada vez mais, Deus cumpre Sua promessa de forma mais plena. John Stott descreve o cumprimento triplo desta promessa. Primeiro, ela se cumpriu parcialmente nos dias de Abraão e ao longo do período do Antigo Testamento. Segundo a promessa foi retratada plenamente na vida de Jesus. E, por fim, a promessa será cumprida completamente no fim dos tempos, considerando que está sendo cumprida agora enquanto Ele edifica a Sua Igreja. Através da promessa, podemos ver Deus como o Deus da história, o Deus da aliança e o Deus da missão.

[cite] Leia Stott (cap. 3, p. 33-40): O Deus vivo é um Deus missionário.

[figura] /figuras/perspectivas/cumprimento-progressivo.png | O Cumprimento Progressivo da Promessa de Deus

A Promessa de Deus Repetida

O desejo de Deus em trazer bênção a todas as nações não é uma ideia pequena que, de repente, aparece no Novo Testamento. O propósito de Deus está embutido na própria formação do seu povo escolhido. Deus repete esta promessa cinco vezes para Abraão e sua família.

[cite] Leia em sua Bíblia: Gênesis 12.1-3; 18.18; 26.4; 28.14. Qual o significado do fato de Deus repetir a promessa diretamente para Isaque e Jacó?

A Promessa de Deus Confirmada

Deus poderia ter revelado o Seu propósito dando uma lista de tarefas que precisavam ser feitas ou Deus poderia ter abençoado Abraão de tal maneira que se criasse uma obrigação de retribuir esta bondade realizando tarefas "missionárias". Mas Deus não se utiliza de contratos, como uma obrigação, para que o seu povo fosse servi-lo em Seu propósito missionário. Em vez disso, Deus espera ganhar esta obediência por amor. Em Gênesis 22, Abraão demonstra sua disposição em obedecer livremente pela fé, deixando que Deus, gerador da promessa, determine como e quando Ele a cumpriria. Nesse momento, Deus declara que, por causa da obediência de Abraão, certamente se cumpriria Sua promessa quanto à parte de Abraão no destino global.

[cite] Leia a história de Gênesis 22.1-18. Por que Deus declarou que a promessa para as nações se cumpriria por causa desse ato particular de obediência? O que Abraão provou?

2. POVO DE DEUS FORMADO PARA PARTICIPAR DO SEU PROPÓSITO

Embora a promessa enfatize que o próprio Deus faria uma obra maravilhosa no meio das nações, Abraão e seus descendentes não deveriam ser apenas espectadores passivos.

Comunicadores Ativos da Bênção

As declarações da bênção prometida vieram com um propósito claramente ligado: "para que tu sejas uma bênção" (v.2) e "para que em ti sejam benditas todas as famílias da terra" (v.3). [Nota do Tradutor: nos dois versículos a conjunção "para que" ficou subentendida na maioria das versões em português]. O propósito pelo qual Deus escolheu Abraão era para que ele e sua família exercessem um papel-chave dentro do Seu propósito global.

Significado Verdadeiro

Em contraste com o povo de Babel, que queria tornar famoso o seu próprio nome (Gn 11.4), Deus garantiu a Abraão que Ele engrandeceria o seu nome. O caminho do significado mais elevado na vida não está em obter segurança e prestígio. Assim como para Abraão, para nós o significado também está em ser uma bênção para as nações. Somos abençoados para sermos bênção. É muito mais do que um dever, é nosso destino.

Participando com Deus como Seu Sacerdócio

A aliança de Deus no Sinai revela Seu propósito para Seu povo. Este não é um relato isolado nas Escrituras. O Êxodo e a aliança feita no Sinai, formaram a ocasião mais marcante da história de Israel. O povo de Deus foi constituído com um propósito. Pedro deixa muito claro que as intenções de Deus continuaram as mesmas nos tempos do Novo Testamento e depois. Primeiro, o povo de Deus deve ser distinto, um povo santo e de valor único entre os povos do mundo. Segundo o povo de Deus deve ser o sacerdócio de Deus declarando Suas virtudes ao mundo.

[cite] Leia na plataforma Kaiser: A chamada missionára de Israel, até a seção "Salmo 67: Provar seu propósito"

Provando Seu Propósito

Os hinos do povo hebreu refletem o seu entendimento do mandato divino de abençoar as nações. Salmo 67 mostra que Israel sabia que as nações estavam olhando para o povo como uma demonstração daquilo que Deus queria fazer entre as nações. O destino final das nações — não de algumas, mas de todas — é de cantar louvores a Deus. O propósito de Deus é o foco do Salmo: "Deus nos abençoa" com um propósito: "para que os confins da terra o temam". O propósito final de Deus é que as nações O glorifiquem, reconhecendo duas coisas: Sua bênção, de redenção e transformação que nos confere vida (vv. 1-2 e 6-7) e a supremacia do Seu reinado (v. 4)

[cite] Leia na plataforma Kaiser: A chamada missionára de Israel, toda a seção "Salmo 67: Provar seu propósito"

3. QUAL É O PROPÓSITO DE DEUS?

Deus tem um propósito singular que é refletido no Salmo 67: que Ele seja glorificado em adoração global. Para realizar esse fim, Deus age de acordo com um determinado propósito que não somente afetará todos os povos, mas também derrotará as forças espirituais malignas. Observe a ideia das três direções da missão de Deus:

Em Função de Deus

Deus deseja que adoração venha a Ele de cada nação. Por isso, a evangelização mundial, em última análise, é para Deus.

Para Pessoas

O desejo de Deus é trazer bênção redentora a cada povo. Ele redimirá um povo dentre todos os povos.

Com Respeito ao Maligno

Deus vencerá os poderes malignos para libertar pessoas e, no final, trazer todas as coisas debaixo do seu governo eterno e completo. Este governo do seu Reino é a substância da bênção que Ele traz às nações.

[cite] Resumo do Propósito de Deus: Para sua glória em adoração global, Deus se propõe a redimir um povo dentre todos os povos e a estabelecer um Reino sobre todos os reinos.

4. O PROPÓSITO DE DEUS NA POESIA

Kaiser menciona o Salmo 67. Outra maneira de analisar a estrutura do Salmo 67 é enxergá-lo em forma de ampulheta onde as ideias repetidas vão sendo colocadas paralelamente. Esse formato de poesia era comum no mundo antigo.

[cite] Salmo 67
1 Que Deus tenha misericórdia de nós e nos abençoe, e faça resplandecer o seu rosto sobre nós, Pausa
2 para que sejam conhecidos na terra os teus caminhos, a tua salvação entre todas as nações.
3 Louvem-te os povos, ó Deus; louvem-te todos os povos.
4 Exultem e cantem de alegria as nações, pois governas os povos com justiça e guias as nações na terra. Pausa
5 Louvem-te os povos, ó Deus; louvem-te todos os povos.
6 Que a terra dê a sua colheita, e Deus, o nosso Deus, nos abençoe!
7 Que Deus nos abençoe, e o temam todos os confins da terra.

Para os Povos: Bênção

Os versos 1-2 e os versos 6-7 contém temas paralelos em que Deus abençoa Seu povo a fim de revelar Sua salvação ao mundo todo.

A Deus: A Glória na Adoração

Os versos 3 e 5 são obviamente similares, descrevendo o movimento do propósito de Deus em direção a Si mesmo na adoração de todos os povos.

Contra o Mal: Seu Reino

Na posição central do poema, o verso 4 veicula a ideia fundamental que possibilita todas as outras. O que fará com que as nações se regozijem é a intervenção do juízo de Deus em benefício de todos os povos. A ideia do juízo será mais bem explorada na Lição 3. O juízo nesse texto não é a simples condenação e punição pela transgressão. Ela expressa a enérgica ação de Deus confrontando e vencendo o mal. O verso afirma que Deus não somente agirá redentivamente contra o mal, mas estabelecerá um relacionamento pelo qual conduzirá as nações a viverem sob o governo de Seu Reino. Essa é uma das mais belas expressões do Reino de Deus em toda a Bíblia.

5. A HISTÓRIA DE BÊNÇÃO

Richard Bauckham estuda a deslumbrante beleza e poder de bênção como um tema que percorre toda a história da Bíblia. Ele descreve a dinâmica impulsionada pela missão da suprema expressão da bênção de Deus: a palavra a respeito da vida, morte e ressurreição de Jesus. Aqueles que são abençoados por essa palavra, tornam-se bênção para os outros.

Criação e Maldição

Bauckham segue o tema de bênção desde a criação e como Deus derrota definitivamente a maldição resultante do pecado com a bênção de Cristo.

O Evangelho em Gênesis 12

Bauckham cita Gálatas 3:8 "Prevendo a Escritura que Deus justificaria pela fé os gentios, anunciou primeiro as boas novas a Abraão: Por meio de você todas as nações serão abençoadas". O texto diz que o evangelho é prenunciado e resumido na promessa de bênção de Deus.

O Pleno Propósito de Deus

Perceba na leitura do texto que Bauckham menciona as mesmas três direções do propósito de Deus. O "evangelho" anunciado tão precocemente a Abraão venceu, no devido tempo, a maldição e as consequências do mal, fazendo brotar vida e salvação aos povos a fim de trazer louvor a Deus.

1. Para Deus: "Aqueles que experimentam a bênção de Deus bendizem, por sua vez, a Deus, o que significa que eles dão aquilo que todas as criaturas de fato podem Lhe dar: ações de graça e louvor."

2. Para os Povos: A bênção se refere a todo o tipo de abundância e salvação.

3. Contra o Mal: "O segredo da promessa está no fato de Cristo ter tomado sobre si a maldição para que a bênção prevaleça."

[cite] Leia na plataforma Bauckham: A História de Bênção: Prevalecendo sobre a maldição

6. A PRIMEIRA PROMESSA DE DEUS DEMONSTRA A SUA VITÓRIA FINAL

Muito tempo antes de Abraão, Deus já tinha prometido derrotar o maligno e redimir pessoas, conforme verificamos em Gênesis 3.14-15. Este fato, muitas vezes, é chamado de o "protoevangelho" (primeiro evangelho).

[cite] Leia Gênesis 3.14-15. Repare que a palavra "descendente" está na forma singular, e que, de maneira semelhante a Gálatas 3.16, nos faz compreender "que se trata de um só, isto é, Cristo" (NVI).

Problema Duplo

Precisamos entender que o desafio do maligno causou um problema duplo:

1. Surgiu um reino satânico contrário ao reino de Deus, com a intenção de roubar a lealdade do povo, enganá-lo e destruí-lo.

2. Homens em rebelião renunciaram a sua posição real como guardiões da terra e, ironicamente, numa tentativa de alcançar maior poder, cederam à mentira do diabo, resultando em escravidão ao pecado e a morte.

A Estratégia Dupla de Deus com o Propósito Único

A estratégia e o propósito de Deus estão prefigurados no "protoevangelho", referindo- se a dois "ferimentos". Deus promete que uma figura humana destruiria completamente o diabo, ferindo a sua cabeça. No mesmo momento, Deus diz que Satanás feriria a figura humana, prefigurando o sofrimento redentivo de Cristo. É importante entender que Deus resolve os dois problemas em uma só missão: redime para governar e governa para redimir. As duas ênfases estratégicas têm um só propósito: a glória de Deus em adoração.

[cite] O Propósito Final de Deus: Atrair adoração leal de cada povo, demonstrando a Sua glória e manifestando o Seu amor pleno. A Estratégia Dupla de Deus: Enquanto o propósito final de Deus diz respeito a Sua glória, Ele tem trabalhado decisiva e incessantemente com uma estratégia integrada contra o maligno e em prol de pessoas.

[cite] Com respeito a Satanás: Deus trava uma batalha de libertação contra o reino satânico, contrariando as trevas, a fim de resgatar a humanidade e, no fim, destruir toda obra de Satanás.

[cite] Com respeito a pessoas: Deus redime um povo dentre os povos, trazendo-o para debaixo do governo de Cristo através da cruz e da ressurreição.

[cite] Leia na plataforma Ellisen. A pergunta de todos: O que Deus está tentando fazer.

[cite] Agora, entendendo melhor o propósito de Deus, repare como Ele sempre esperou que as bênçãos concedidas fossem compartilhadas em cumprimento deste propósito. Quando combatemos a injustiça, através do Evangelho, estendemos o Reino de Deus para sua glória eterna em adoração universal.

CONCLUSÃO DO NÍVEL BÁSICO

7. BÊNÇÃO COMO TRANSFORMAÇÃO

Voltamos à revelação da história de Deus trazendo bênção a todos os povos da terra. Vemos na promessa a Abraão a intenção de Deus de que nos tornemos uma bênção para as nações. Mas o que significa "ser uma bênção"? Como fazer? Como serão as coisas quando ela acontecer? Sarita Gallagher e Steven Hawthorne seguem a história de bênção em Gênesis. A lógica de seu artigo é simples: Seja o que for que Deus quis dizer com "ser uma bênção" na promessa de Gênesis 12, pode ser observado no restante do livro de Gênesis.

A Bênção como uma Declaração de Legado e um Cumprimento Tangível

1. Declaração de Legado. A bênção não é um conceito comum em muitas sociedades ocidentais. Pronunciar ou transmitir uma bênção é conceder à pessoa ou ao objeto abençoado um potencial de vida para florescer em uma plenitude pretendida. Pronunciar uma bênção era considerado uma transação de poder vivificador e não apenas uma mera emissão de palavras.

2. Cumprimento Tangível. No relato de Gênesis, vemos muitos exemplos de cumprimento tangível de bênçãos. Quando isso ocorre, a pessoa é considerada como abençoada. Percebemos três categorias de bênção:

Bênção Material e Abundância Física. Deus trouxe grande riqueza, pelos padrões do Oriente Médio, a Abraão e seus descendentes.

Presença de Deus. A presença de Deus foi reconhecida por aqueles que observavam Abraão e sua família.

Paz com as Nações Vizinhas. Os exemplos no relato de Gênesis sugerem que onde Deus traz bênção, há um início de paz entre irmãos ou nações em rixa.

[cite] Leia na plataforma Gallagher e Hawthorne, "Benção como Transformação", do início até chegar na seção "Bênção além da família de Abraão."

Ser uma Bênção

Uma coisa é observar a incrível gama de bondade que a bênção representa. Uma coisa bem diferente é ver como uma pessoa ou um povo pode se tornar uma bênção para outras pessoas. Embora Abraão e seus descendentes em algumas ocasiões não fossem tão abençoadores, a história de Gênesis cita várias ocasiões em que Deus trouxe bênção a outras nações e famílias através deles.

1. Abraão, Isaque e Jacó. Deus ajudou Abraão a resgatar seus vizinhos em Sodoma e Gomorra. Abraão intercedeu por toda a cidade de Sodoma em outro momento. Abraão orou para que Deus restaurasse a capacidade de ter filhos ao clã de Abimeleque. Isaque cavou poços que forneceram água suficiente para ele e para as nações vizinhas. O trabalho de Jacó na casa de Labão foi obviamente obra de Deus.

2. José. A história de José é o ápice da história do livro de Gênesis e pode muito bem oferecer uma figura profética do ápice da história. Deus deu a José a capacidade de interpretar um sonho específico do faraó e então o ajudou a estocar cereal suficiente para ajudar muitas pessoas a sobreviver à fome que "havia espalhado por toda a terra" (Gênesis 41:56). "E de toda a terra vinha gente ao Egito para comprar trigo de José" (Gênesis 41:57). À medida que a fome se agravava, José não apenas ajudou o povo egípcio a sobreviver, mas os preparou com suprimentos suficientes até que os ciclos agrícolas normais fossem restaurados. O povo declarou "tu nos salvaste a vida" (Gênesis 47:25).

Cumprimento em Descendentes

A promessa de que ele e sua família seriam uma bênção para as nações foi repetida a Abraão três vezes e então, dirigida a Isaque e ainda uma quinta vez a Jacó. À medida que a promessa foi repetida, a linguagem mudou para que ficasse óbvio que grande parte do cumprimento da promessa não ocorreria durante a vida de Abraão, Isaque e Jacó, mas na vida de seus descendentes.

Cumprimento em Cristo

No livro de Gálatas, Paulo deixa claro que a promessa de bênção às nações, o próprio "evangelho" anunciado anteriormente, foi cumprido em um proeminente descendente de Abraão: Jesus Cristo. Paulo vai além e diz que todos os que creem em Cristo se unem a Ele, portanto, tornam-se filhos e filhas da família de Abraão. Isso significa que os crentes em Jesus devem se considerar descendentes de Abraão e herdeiros da promessa de Deus de abençoá-los para que se tornem uma bênção para as nações.

[cite] Leia na plataforma Gallagher e Hawthorne "Benção como Transformação" começando na seção "Bênção além da família de Abraão" até chegar na seção "A promessa de Deus se torna nosso mandato" (dentro das leituras desse guia de estudo).

A promessa se torna ordem

Se recebemos a ordem de ser Seus agentes de bênção entre todos os povos da terra, o que significa para as nações serem abençoadas? E como cumpriremos esse alvo?

1. Bênção Relacional. A bênção das nações significa muito mais que evangelismo, mas certamente não pode significar menos do que a evangelização de todos os povos. O convite para pertencer à família de Deus, confiando em Cristo como salvador é estendido a todos os povos. Assim, espera-se que os filhos de Abraão se multipliquem em cada povo. Como no livro de Gênesis, a presença de Deus sobre aqueles que O seguem é o início de todos os demais aspectos tangíveis de bênção que Deus deseja trazer. Isso significa que a evangelização tem uma prioridade especial: ela conduz a todas as coisas boas que Deus deseja levar às nações.

2. Bênção Material e Social. "Devemos esperar que Deus gere todo o tipo de bênção como economias que florescem com justiça e retidão, agricultura e indústrias que se desenvolvem com fartura para todos e paz nas comunidades e entre os povos e raças. Podemos esperar que Deus capacite Seu povo para combater doenças, quebrar os ciclos viciosos de pobreza, providenciar água em terras áridas e estar presente trazendo cura em meio às catástrofes."

3. Não é "Evangelho da Prosperidade". Note bem que Gallagher e Hawthorne distinguem a abundância material em Gênesis do "evangelho da prosperidade" que é ensinado em alguns círculos. Eles afirmam: "Os que advogam o chamado "evangelho da prosperidade" podem ter mais em comum com a cosmovisão (mágica) que reduz a bênção a um método de obtenção de riqueza material de Deus" (pg.35d). A doutrina do evangelho da prosperidade pode se aproximar da visão de que a bênção de Deus é uma "recompensa" para aqueles que realizam procedimentos de "fé" de maneira adequada. Em suas formas extremas, alguns cristãos veem a bênção como Deus relocando a riqueza financeira das nações para os cristãos ao invés de ver os cristãos como agentes da bênção de Deus sobre as nações.

Benção como Transformação

A ideia e a promessa de bênção podem nos dar substância bíblica para agendas, às vezes, concorrentes que exigem "transformação". No sentido bíblico de bênção, encontramos o maravilhoso poder de Deus trabalhando ao lado da ação estratégica e vigorosa de Seu povo. No entanto, não há expectativa que produzamos soluções para todos os problemas ou criemos uma perfeição utópica.

José: O Primeiro a Ser Enviado

O modelo de José nos ajuda a entender como podemos cooperar com Deus para trazer bênção de vida. Ele é a primeira pessoa que as Escrituras mencionam como sendo "enviado por Deus" (Gênesis 45:5).

[cite] Leia na plataforma Gallagher e Hawthorne "Benção como Transformação" começando com a seção "A promessa de Deus se torna nosso mandato" até o fim.

UMA INTRODUÇÃO AO RESTANTE DE PERSPECTIVAS

Este curso foi organizado em torno de quatro dimensões básicas, ou "perspectivas" no Movimento Cristão Mundial: Bíblica, Histórica, Cultural e Estratégica. As palavras de John Stott em seu artigo (a seguir) podem nos servir como introdução ao restante do curso. O seu resumo da história da Bíblia nos ajuda a iniciar a seção Bíblica (lições 1 a 4), e a seção Histórica (lições 5 e 6). Ao explorar a história bíblica com mais profundidade, seguiremos muitos dos mesmos temas e abordagens para observarmos a continuidade ao longo dos séculos em direção ao cumprimento do propósito de Deus. Stott também introduz a seção Cultural (lições 8 e 9) e a seção Estratégica (lições 7 e 10-12) com os seus comentários sobre como a Bíblia fornece o modelo e o poder para a missão. As Escrituras revelam uma sabedoria muito necessária sobre a maneira de comunicar efetivamente o Evangelho em situações transculturais. A Bíblia também nos oferece os parâmetros básicos para o sábio pensamento estratégico, sobre como completar a tarefa por inteiro no poder e da maneira de Deus.

8. A BÍBLIA TODA COMO UM MANDATO MAIOR

Mandato para a Missão

O mandato bíblico para missões não é limitado a poucos versos bíblicos. Nunca deveríamos confiar em textos que querem provar uma causa, mas devemos sempre olhar além de versos isolados para verificarmos o mandato através de toda a história da Bíblia. Ao longo do caminho notaremos muitas referências do cuidado de Deus para com o mundo todo. E claro, também examinaremos as poucas passagens nas quais Deus expressa um mandamento explícito para a atividade missionária. Verificaremos melhor o enorme mandato para a missão mundial quando trilharmos através da Bíblia como um todo.

Mensagem, Modelo e Poder para a Missão

A Bíblia revela o que Deus tem feito e o que Ele quer que seja feito. Ele nos tem mostrado através da Bíblia como podemos realizar o propósito de Deus da maneira que Ele quer.

[cite] Leia Stott (cap. 1, p. 33-40): A Bíblia na evangelização do mundo

9. A BASE BÍBLICA EM CINCO TEMAS

Johannes Verkuyl apresenta cinco temas que se estendem por todo o Antigo Testamento e que fundamentam a ideia de que o povo judeu "desde seus primórdios ouviu e entendeu seu chamado para testemunhar diretamente bem como por sua presença".

O Tema Universal

Para aproveitar melhor esta seção é preciso abrir a Bíblia e examinar algumas passagens.

1. A TABELA DAS NAÇÕES. Veja Gênesis 10, onde se encontra a lista dos povos que foram dispersos em Babel em Gênesis 11. As nações são uma parte fundamental do drama bíblico. Deus sempre se preocupa com toda a humanidade.

A ELEIÇÃO DE ISRAEL. A eleição de Abraão e Israel revela que os olhos de Deus estão voltados para as nações.

AVANÇO DURANTE O EXÍLIO. Cerca de 400 anos antes de Cristo, Deus dispersou o povo judeu entre as nações. Depois de setenta anos, alguns foram reunidos de volta à terra de Israel, algo que alguns autores bíblicos consideram como o segundo êxodo. Verkuyl mostra que a visão dos judeus do mundo amadureceu durante esse período.

O Tema do Resgate e da Libertação

Deus ter resgatado Israel era algo fundamental. Que Deus resgataria as nações foi um tema que ganhou força e atenção à medida que as gerações passaram e foi muito trabalhado pelos profetas e salmistas. Os "Cânticos do Servo" de Isaías apresentavam o propósito de Deus de levar a salvação às nações (42:1-12; 43:1-13; 49:1-13; 52:13-53:12).

O Tema Missionário

Verkuyl nos proporciona seu ponto de vista sobre a frequente acusação de que Israel deveria apenas estar presente de forma passiva entre as nações e que Deus faria o resto. Lembre-se de que partes da própria Bíblia foram escritas em linguagem e formas que teriam sido significativas para as nações vizinhas.

O Tema do Antagonismo

Deus está em guerra com Seus inimigos a fim de resgatar Seus servos. Isto corrobora o que Ellisen afirmou sobre o programa de Deus para derrotar o mal. Observe particularmente como o zelo ardente de Deus contra seus inimigos está ligado à grande visão do reino vindouro. A guerra de Deus está ligada à Sua ambição pela revelação de Sua glória, o que é, na verdade, um quinto tema.

O Tema Doxológico

"Doxológico" refere-se à grandeza da glória de Deus. A palavra "doxológico" vem do termo grego para "glória". Esse tema é pouco mencionado por Verkuyl, mas ele o menciona.

[cite] Leia Verkuyl (cap. 8, p. 69-73): A base bíblica do mandato missionário mundial (Até "O livro de Jonas").

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO$conteudo$
     where curso_id = v_curso and ordem = 1;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso,
            $t$Lição 1 · Guia de estudo — Deus é um Deus Missionário$t$,
            $conteudo$Nosso Deus tem um propósito global. Ele colocou em nossos corações o desejo de sermos Seus amigos. Temos o desejo de colaborar com Deus nesta tarefa e de vivermos na dignidade de um propósito que é maior do que nossos próprios interesses. Realmente queremos servir a Deus da melhor maneira possível. O que nos impede? Nosso maior problema é que nossa visão é limitada.

Embora saibamos que Deus não é apenas aquele que só serve para resolver os nossos problemas pessoais, ainda é comum considerarmos Deus do nosso ponto de vista, como se Ele estivesse de plantão para nos ajudar cada vez que enfrentamos circunstâncias difíceis. Nossa visão é limitada pelo horizonte das nossas próprias preocupações e cultura. Mas existe um destino melhor, um propósito maior. Podemos nos apropriar disso ao conhecermos e seguirmos a Deus em direção a uma visão que ultrapassa nossa própria percepção acerca de nós mesmos.

Nesta lição começaremos uma jornada para descobrir o que Deus revelou a respeito do Seu propósito. Os Seus propósitos fazem mais sentido quando são vistos ao longo da história da Bíblia. Uma caminhada com Deus através da história das Escrituras nos lançará no centro do significado do restante da história.

Com o progresso da história, o propósito de Deus fica mais claro, pois tudo está se cumprindo assim como Ele prometeu. Porque Ele é um Deus de grande propósito e há uma missão que Ele se propôs a cumprir. Nosso Deus é um Deus missionário.

ESTUDAR ESTA LIÇÃO O AJUDARÁ

1. Entender por que a aliança que Deus fez com Abraão revela o Seu propósito para cada povo.

2. Explicar como toda a Bíblia apresenta um forte mandato para a missão em todas as nações.

3. Compreender como Deus cumpre Suas promessas progressivamente através da história e como elas formam uma parte importante do nosso mandato para fazer missões.

4. Entender por que o empreendimento de missões tem base bíblica substancial que convoca cada crente a cumprir a sua parte.

5. Demonstrar como empreender o propósito missionário de Deus que se dá em três direções: em relação ao próprio Deus, em prol de todas as nações e a respeito dos poderes malignos de satanás.

NO NÍVEL AVANÇADO

6. Compreender como a primeira promessa de Deus no jardim do Éden reflete o Seu propósito missionário.

7. Explicar como a Bíblia fornece a mensagem o modelo e o poder para realizar missões.

PALAVRA CHAVE

[cite] PROPÓSITO Fomos feitos para viver com um propósito. O próprio Deus vive com um propósito. A maneira de viver uma vida significativa é dedicar a sua vida a um propósito maior do que a sua própria vida.

1. A PROMESSA DE DEUS REVELA O SEU PROPÓSITO

Deus poderia ter revelado o Seu propósito na forma de mandamentos diretos a respeito daquilo que Ele queria que fosse feito. Em vez disso, Deus escolheu revelar o Seu propósito na forma de uma promessa, que é tanto pessoal quanto global: abençoar todas as famílias da terra.

[cite] Abra sua Bíblia em Gênesis 12. Este é o ponto da virada na Bíblia. Olhe as páginas de Gênesis 1-11. Que coisas estão acontecendo nessas passagens? A quais nações ou povos estas passagens estão se referindo? Agora atente para as páginas de Gênesis 12 em diante. Esta porção diz respeito a outros povos diferentes dos hebreus? Qual é a diferença central entre o que acontece em Gênesis 1-11 e o que acontece no restante da Bíblia a partir de Gênesis 12?

A Promessa de Deus

Um mandato é melhor do que um mero mandamento. Deus deu o Seu mandato inicialmente na forma de uma promessa em vez de um mandamento direto, pois a ênfase está muito mais naquilo que Deus iria fazer do que naquilo que Abraão deveria fazer. Deus enfatizou o resultado que Ele quis ver entre todos os povos da terra ao invés de ordenar Abraão a fazer alguma coisa e dar-lhe orientações detalhadas. Pensando bem, haveria uma maneira melhor de Deus entregar o Seu propósito para Sua família de fé que estaria trabalhando com Ele por milhares de anos?

A promessa revela as intenções de Deus claramente a cada estágio do seu cumprimento. Cada vez mais, Deus cumpre Sua promessa de forma mais plena. John Stott descreve o cumprimento triplo desta promessa. Primeiro, ela se cumpriu parcialmente nos dias de Abraão e ao longo do período do Antigo Testamento. Segundo a promessa foi retratada plenamente na vida de Jesus. E, por fim, a promessa será cumprida completamente no fim dos tempos, considerando que está sendo cumprida agora enquanto Ele edifica a Sua Igreja. Através da promessa, podemos ver Deus como o Deus da história, o Deus da aliança e o Deus da missão.

[cite] Leia Stott (cap. 3, p. 33-40): O Deus vivo é um Deus missionário.

[figura] /figuras/perspectivas/cumprimento-progressivo.png | O Cumprimento Progressivo da Promessa de Deus

A Promessa de Deus Repetida

O desejo de Deus em trazer bênção a todas as nações não é uma ideia pequena que, de repente, aparece no Novo Testamento. O propósito de Deus está embutido na própria formação do seu povo escolhido. Deus repete esta promessa cinco vezes para Abraão e sua família.

[cite] Leia em sua Bíblia: Gênesis 12.1-3; 18.18; 26.4; 28.14. Qual o significado do fato de Deus repetir a promessa diretamente para Isaque e Jacó?

A Promessa de Deus Confirmada

Deus poderia ter revelado o Seu propósito dando uma lista de tarefas que precisavam ser feitas ou Deus poderia ter abençoado Abraão de tal maneira que se criasse uma obrigação de retribuir esta bondade realizando tarefas "missionárias". Mas Deus não se utiliza de contratos, como uma obrigação, para que o seu povo fosse servi-lo em Seu propósito missionário. Em vez disso, Deus espera ganhar esta obediência por amor. Em Gênesis 22, Abraão demonstra sua disposição em obedecer livremente pela fé, deixando que Deus, gerador da promessa, determine como e quando Ele a cumpriria. Nesse momento, Deus declara que, por causa da obediência de Abraão, certamente se cumpriria Sua promessa quanto à parte de Abraão no destino global.

[cite] Leia a história de Gênesis 22.1-18. Por que Deus declarou que a promessa para as nações se cumpriria por causa desse ato particular de obediência? O que Abraão provou?

2. POVO DE DEUS FORMADO PARA PARTICIPAR DO SEU PROPÓSITO

Embora a promessa enfatize que o próprio Deus faria uma obra maravilhosa no meio das nações, Abraão e seus descendentes não deveriam ser apenas espectadores passivos.

Comunicadores Ativos da Bênção

As declarações da bênção prometida vieram com um propósito claramente ligado: "para que tu sejas uma bênção" (v.2) e "para que em ti sejam benditas todas as famílias da terra" (v.3). [Nota do Tradutor: nos dois versículos a conjunção "para que" ficou subentendida na maioria das versões em português]. O propósito pelo qual Deus escolheu Abraão era para que ele e sua família exercessem um papel-chave dentro do Seu propósito global.

Significado Verdadeiro

Em contraste com o povo de Babel, que queria tornar famoso o seu próprio nome (Gn 11.4), Deus garantiu a Abraão que Ele engrandeceria o seu nome. O caminho do significado mais elevado na vida não está em obter segurança e prestígio. Assim como para Abraão, para nós o significado também está em ser uma bênção para as nações. Somos abençoados para sermos bênção. É muito mais do que um dever, é nosso destino.

Participando com Deus como Seu Sacerdócio

A aliança de Deus no Sinai revela Seu propósito para Seu povo. Este não é um relato isolado nas Escrituras. O Êxodo e a aliança feita no Sinai, formaram a ocasião mais marcante da história de Israel. O povo de Deus foi constituído com um propósito. Pedro deixa muito claro que as intenções de Deus continuaram as mesmas nos tempos do Novo Testamento e depois. Primeiro, o povo de Deus deve ser distinto, um povo santo e de valor único entre os povos do mundo. Segundo o povo de Deus deve ser o sacerdócio de Deus declarando Suas virtudes ao mundo.

[cite] Leia na plataforma Kaiser: A chamada missionára de Israel, até a seção "Salmo 67: Provar seu propósito"

Provando Seu Propósito

Os hinos do povo hebreu refletem o seu entendimento do mandato divino de abençoar as nações. Salmo 67 mostra que Israel sabia que as nações estavam olhando para o povo como uma demonstração daquilo que Deus queria fazer entre as nações. O destino final das nações — não de algumas, mas de todas — é de cantar louvores a Deus. O propósito de Deus é o foco do Salmo: "Deus nos abençoa" com um propósito: "para que os confins da terra o temam". O propósito final de Deus é que as nações O glorifiquem, reconhecendo duas coisas: Sua bênção, de redenção e transformação que nos confere vida (vv. 1-2 e 6-7) e a supremacia do Seu reinado (v. 4)

[cite] Leia na plataforma Kaiser: A chamada missionára de Israel, toda a seção "Salmo 67: Provar seu propósito"

3. QUAL É O PROPÓSITO DE DEUS?

Deus tem um propósito singular que é refletido no Salmo 67: que Ele seja glorificado em adoração global. Para realizar esse fim, Deus age de acordo com um determinado propósito que não somente afetará todos os povos, mas também derrotará as forças espirituais malignas. Observe a ideia das três direções da missão de Deus:

Em Função de Deus

Deus deseja que adoração venha a Ele de cada nação. Por isso, a evangelização mundial, em última análise, é para Deus.

Para Pessoas

O desejo de Deus é trazer bênção redentora a cada povo. Ele redimirá um povo dentre todos os povos.

Com Respeito ao Maligno

Deus vencerá os poderes malignos para libertar pessoas e, no final, trazer todas as coisas debaixo do seu governo eterno e completo. Este governo do seu Reino é a substância da bênção que Ele traz às nações.

[cite] Resumo do Propósito de Deus: Para sua glória em adoração global, Deus se propõe a redimir um povo dentre todos os povos e a estabelecer um Reino sobre todos os reinos.

4. O PROPÓSITO DE DEUS NA POESIA

Kaiser menciona o Salmo 67. Outra maneira de analisar a estrutura do Salmo 67 é enxergá-lo em forma de ampulheta onde as ideias repetidas vão sendo colocadas paralelamente. Esse formato de poesia era comum no mundo antigo.

[cite] Salmo 67
1 Que Deus tenha misericórdia de nós e nos abençoe, e faça resplandecer o seu rosto sobre nós, Pausa
2 para que sejam conhecidos na terra os teus caminhos, a tua salvação entre todas as nações.
3 Louvem-te os povos, ó Deus; louvem-te todos os povos.
4 Exultem e cantem de alegria as nações, pois governas os povos com justiça e guias as nações na terra. Pausa
5 Louvem-te os povos, ó Deus; louvem-te todos os povos.
6 Que a terra dê a sua colheita, e Deus, o nosso Deus, nos abençoe!
7 Que Deus nos abençoe, e o temam todos os confins da terra.

Para os Povos: Bênção

Os versos 1-2 e os versos 6-7 contém temas paralelos em que Deus abençoa Seu povo a fim de revelar Sua salvação ao mundo todo.

A Deus: A Glória na Adoração

Os versos 3 e 5 são obviamente similares, descrevendo o movimento do propósito de Deus em direção a Si mesmo na adoração de todos os povos.

Contra o Mal: Seu Reino

Na posição central do poema, o verso 4 veicula a ideia fundamental que possibilita todas as outras. O que fará com que as nações se regozijem é a intervenção do juízo de Deus em benefício de todos os povos. A ideia do juízo será mais bem explorada na Lição 3. O juízo nesse texto não é a simples condenação e punição pela transgressão. Ela expressa a enérgica ação de Deus confrontando e vencendo o mal. O verso afirma que Deus não somente agirá redentivamente contra o mal, mas estabelecerá um relacionamento pelo qual conduzirá as nações a viverem sob o governo de Seu Reino. Essa é uma das mais belas expressões do Reino de Deus em toda a Bíblia.

5. A HISTÓRIA DE BÊNÇÃO

Richard Bauckham estuda a deslumbrante beleza e poder de bênção como um tema que percorre toda a história da Bíblia. Ele descreve a dinâmica impulsionada pela missão da suprema expressão da bênção de Deus: a palavra a respeito da vida, morte e ressurreição de Jesus. Aqueles que são abençoados por essa palavra, tornam-se bênção para os outros.

Criação e Maldição

Bauckham segue o tema de bênção desde a criação e como Deus derrota definitivamente a maldição resultante do pecado com a bênção de Cristo.

O Evangelho em Gênesis 12

Bauckham cita Gálatas 3:8 "Prevendo a Escritura que Deus justificaria pela fé os gentios, anunciou primeiro as boas novas a Abraão: Por meio de você todas as nações serão abençoadas". O texto diz que o evangelho é prenunciado e resumido na promessa de bênção de Deus.

O Pleno Propósito de Deus

Perceba na leitura do texto que Bauckham menciona as mesmas três direções do propósito de Deus. O "evangelho" anunciado tão precocemente a Abraão venceu, no devido tempo, a maldição e as consequências do mal, fazendo brotar vida e salvação aos povos a fim de trazer louvor a Deus.

1. Para Deus: "Aqueles que experimentam a bênção de Deus bendizem, por sua vez, a Deus, o que significa que eles dão aquilo que todas as criaturas de fato podem Lhe dar: ações de graça e louvor."

2. Para os Povos: A bênção se refere a todo o tipo de abundância e salvação.

3. Contra o Mal: "O segredo da promessa está no fato de Cristo ter tomado sobre si a maldição para que a bênção prevaleça."

[cite] Leia na plataforma Bauckham: A História de Bênção: Prevalecendo sobre a maldição

6. A PRIMEIRA PROMESSA DE DEUS DEMONSTRA A SUA VITÓRIA FINAL

Muito tempo antes de Abraão, Deus já tinha prometido derrotar o maligno e redimir pessoas, conforme verificamos em Gênesis 3.14-15. Este fato, muitas vezes, é chamado de o "protoevangelho" (primeiro evangelho).

[cite] Leia Gênesis 3.14-15. Repare que a palavra "descendente" está na forma singular, e que, de maneira semelhante a Gálatas 3.16, nos faz compreender "que se trata de um só, isto é, Cristo" (NVI).

Problema Duplo

Precisamos entender que o desafio do maligno causou um problema duplo:

1. Surgiu um reino satânico contrário ao reino de Deus, com a intenção de roubar a lealdade do povo, enganá-lo e destruí-lo.

2. Homens em rebelião renunciaram a sua posição real como guardiões da terra e, ironicamente, numa tentativa de alcançar maior poder, cederam à mentira do diabo, resultando em escravidão ao pecado e a morte.

A Estratégia Dupla de Deus com o Propósito Único

A estratégia e o propósito de Deus estão prefigurados no "protoevangelho", referindo- se a dois "ferimentos". Deus promete que uma figura humana destruiria completamente o diabo, ferindo a sua cabeça. No mesmo momento, Deus diz que Satanás feriria a figura humana, prefigurando o sofrimento redentivo de Cristo. É importante entender que Deus resolve os dois problemas em uma só missão: redime para governar e governa para redimir. As duas ênfases estratégicas têm um só propósito: a glória de Deus em adoração.

[cite] O Propósito Final de Deus: Atrair adoração leal de cada povo, demonstrando a Sua glória e manifestando o Seu amor pleno. A Estratégia Dupla de Deus: Enquanto o propósito final de Deus diz respeito a Sua glória, Ele tem trabalhado decisiva e incessantemente com uma estratégia integrada contra o maligno e em prol de pessoas.

[cite] Com respeito a Satanás: Deus trava uma batalha de libertação contra o reino satânico, contrariando as trevas, a fim de resgatar a humanidade e, no fim, destruir toda obra de Satanás.

[cite] Com respeito a pessoas: Deus redime um povo dentre os povos, trazendo-o para debaixo do governo de Cristo através da cruz e da ressurreição.

[cite] Leia na plataforma Ellisen. A pergunta de todos: O que Deus está tentando fazer.

[cite] Agora, entendendo melhor o propósito de Deus, repare como Ele sempre esperou que as bênçãos concedidas fossem compartilhadas em cumprimento deste propósito. Quando combatemos a injustiça, através do Evangelho, estendemos o Reino de Deus para sua glória eterna em adoração universal.

CONCLUSÃO DO NÍVEL BÁSICO

7. BÊNÇÃO COMO TRANSFORMAÇÃO

Voltamos à revelação da história de Deus trazendo bênção a todos os povos da terra. Vemos na promessa a Abraão a intenção de Deus de que nos tornemos uma bênção para as nações. Mas o que significa "ser uma bênção"? Como fazer? Como serão as coisas quando ela acontecer? Sarita Gallagher e Steven Hawthorne seguem a história de bênção em Gênesis. A lógica de seu artigo é simples: Seja o que for que Deus quis dizer com "ser uma bênção" na promessa de Gênesis 12, pode ser observado no restante do livro de Gênesis.

A Bênção como uma Declaração de Legado e um Cumprimento Tangível

1. Declaração de Legado. A bênção não é um conceito comum em muitas sociedades ocidentais. Pronunciar ou transmitir uma bênção é conceder à pessoa ou ao objeto abençoado um potencial de vida para florescer em uma plenitude pretendida. Pronunciar uma bênção era considerado uma transação de poder vivificador e não apenas uma mera emissão de palavras.

2. Cumprimento Tangível. No relato de Gênesis, vemos muitos exemplos de cumprimento tangível de bênçãos. Quando isso ocorre, a pessoa é considerada como abençoada. Percebemos três categorias de bênção:

Bênção Material e Abundância Física. Deus trouxe grande riqueza, pelos padrões do Oriente Médio, a Abraão e seus descendentes.

Presença de Deus. A presença de Deus foi reconhecida por aqueles que observavam Abraão e sua família.

Paz com as Nações Vizinhas. Os exemplos no relato de Gênesis sugerem que onde Deus traz bênção, há um início de paz entre irmãos ou nações em rixa.

[cite] Leia na plataforma Gallagher e Hawthorne, "Benção como Transformação", do início até chegar na seção "Bênção além da família de Abraão."

Ser uma Bênção

Uma coisa é observar a incrível gama de bondade que a bênção representa. Uma coisa bem diferente é ver como uma pessoa ou um povo pode se tornar uma bênção para outras pessoas. Embora Abraão e seus descendentes em algumas ocasiões não fossem tão abençoadores, a história de Gênesis cita várias ocasiões em que Deus trouxe bênção a outras nações e famílias através deles.

1. Abraão, Isaque e Jacó. Deus ajudou Abraão a resgatar seus vizinhos em Sodoma e Gomorra. Abraão intercedeu por toda a cidade de Sodoma em outro momento. Abraão orou para que Deus restaurasse a capacidade de ter filhos ao clã de Abimeleque. Isaque cavou poços que forneceram água suficiente para ele e para as nações vizinhas. O trabalho de Jacó na casa de Labão foi obviamente obra de Deus.

2. José. A história de José é o ápice da história do livro de Gênesis e pode muito bem oferecer uma figura profética do ápice da história. Deus deu a José a capacidade de interpretar um sonho específico do faraó e então o ajudou a estocar cereal suficiente para ajudar muitas pessoas a sobreviver à fome que "havia espalhado por toda a terra" (Gênesis 41:56). "E de toda a terra vinha gente ao Egito para comprar trigo de José" (Gênesis 41:57). À medida que a fome se agravava, José não apenas ajudou o povo egípcio a sobreviver, mas os preparou com suprimentos suficientes até que os ciclos agrícolas normais fossem restaurados. O povo declarou "tu nos salvaste a vida" (Gênesis 47:25).

Cumprimento em Descendentes

A promessa de que ele e sua família seriam uma bênção para as nações foi repetida a Abraão três vezes e então, dirigida a Isaque e ainda uma quinta vez a Jacó. À medida que a promessa foi repetida, a linguagem mudou para que ficasse óbvio que grande parte do cumprimento da promessa não ocorreria durante a vida de Abraão, Isaque e Jacó, mas na vida de seus descendentes.

Cumprimento em Cristo

No livro de Gálatas, Paulo deixa claro que a promessa de bênção às nações, o próprio "evangelho" anunciado anteriormente, foi cumprido em um proeminente descendente de Abraão: Jesus Cristo. Paulo vai além e diz que todos os que creem em Cristo se unem a Ele, portanto, tornam-se filhos e filhas da família de Abraão. Isso significa que os crentes em Jesus devem se considerar descendentes de Abraão e herdeiros da promessa de Deus de abençoá-los para que se tornem uma bênção para as nações.

[cite] Leia na plataforma Gallagher e Hawthorne "Benção como Transformação" começando na seção "Bênção além da família de Abraão" até chegar na seção "A promessa de Deus se torna nosso mandato" (dentro das leituras desse guia de estudo).

A promessa se torna ordem

Se recebemos a ordem de ser Seus agentes de bênção entre todos os povos da terra, o que significa para as nações serem abençoadas? E como cumpriremos esse alvo?

1. Bênção Relacional. A bênção das nações significa muito mais que evangelismo, mas certamente não pode significar menos do que a evangelização de todos os povos. O convite para pertencer à família de Deus, confiando em Cristo como salvador é estendido a todos os povos. Assim, espera-se que os filhos de Abraão se multipliquem em cada povo. Como no livro de Gênesis, a presença de Deus sobre aqueles que O seguem é o início de todos os demais aspectos tangíveis de bênção que Deus deseja trazer. Isso significa que a evangelização tem uma prioridade especial: ela conduz a todas as coisas boas que Deus deseja levar às nações.

2. Bênção Material e Social. "Devemos esperar que Deus gere todo o tipo de bênção como economias que florescem com justiça e retidão, agricultura e indústrias que se desenvolvem com fartura para todos e paz nas comunidades e entre os povos e raças. Podemos esperar que Deus capacite Seu povo para combater doenças, quebrar os ciclos viciosos de pobreza, providenciar água em terras áridas e estar presente trazendo cura em meio às catástrofes."

3. Não é "Evangelho da Prosperidade". Note bem que Gallagher e Hawthorne distinguem a abundância material em Gênesis do "evangelho da prosperidade" que é ensinado em alguns círculos. Eles afirmam: "Os que advogam o chamado "evangelho da prosperidade" podem ter mais em comum com a cosmovisão (mágica) que reduz a bênção a um método de obtenção de riqueza material de Deus" (pg.35d). A doutrina do evangelho da prosperidade pode se aproximar da visão de que a bênção de Deus é uma "recompensa" para aqueles que realizam procedimentos de "fé" de maneira adequada. Em suas formas extremas, alguns cristãos veem a bênção como Deus relocando a riqueza financeira das nações para os cristãos ao invés de ver os cristãos como agentes da bênção de Deus sobre as nações.

Benção como Transformação

A ideia e a promessa de bênção podem nos dar substância bíblica para agendas, às vezes, concorrentes que exigem "transformação". No sentido bíblico de bênção, encontramos o maravilhoso poder de Deus trabalhando ao lado da ação estratégica e vigorosa de Seu povo. No entanto, não há expectativa que produzamos soluções para todos os problemas ou criemos uma perfeição utópica.

José: O Primeiro a Ser Enviado

O modelo de José nos ajuda a entender como podemos cooperar com Deus para trazer bênção de vida. Ele é a primeira pessoa que as Escrituras mencionam como sendo "enviado por Deus" (Gênesis 45:5).

[cite] Leia na plataforma Gallagher e Hawthorne "Benção como Transformação" começando com a seção "A promessa de Deus se torna nosso mandato" até o fim.

UMA INTRODUÇÃO AO RESTANTE DE PERSPECTIVAS

Este curso foi organizado em torno de quatro dimensões básicas, ou "perspectivas" no Movimento Cristão Mundial: Bíblica, Histórica, Cultural e Estratégica. As palavras de John Stott em seu artigo (a seguir) podem nos servir como introdução ao restante do curso. O seu resumo da história da Bíblia nos ajuda a iniciar a seção Bíblica (lições 1 a 4), e a seção Histórica (lições 5 e 6). Ao explorar a história bíblica com mais profundidade, seguiremos muitos dos mesmos temas e abordagens para observarmos a continuidade ao longo dos séculos em direção ao cumprimento do propósito de Deus. Stott também introduz a seção Cultural (lições 8 e 9) e a seção Estratégica (lições 7 e 10-12) com os seus comentários sobre como a Bíblia fornece o modelo e o poder para a missão. As Escrituras revelam uma sabedoria muito necessária sobre a maneira de comunicar efetivamente o Evangelho em situações transculturais. A Bíblia também nos oferece os parâmetros básicos para o sábio pensamento estratégico, sobre como completar a tarefa por inteiro no poder e da maneira de Deus.

8. A BÍBLIA TODA COMO UM MANDATO MAIOR

Mandato para a Missão

O mandato bíblico para missões não é limitado a poucos versos bíblicos. Nunca deveríamos confiar em textos que querem provar uma causa, mas devemos sempre olhar além de versos isolados para verificarmos o mandato através de toda a história da Bíblia. Ao longo do caminho notaremos muitas referências do cuidado de Deus para com o mundo todo. E claro, também examinaremos as poucas passagens nas quais Deus expressa um mandamento explícito para a atividade missionária. Verificaremos melhor o enorme mandato para a missão mundial quando trilharmos através da Bíblia como um todo.

Mensagem, Modelo e Poder para a Missão

A Bíblia revela o que Deus tem feito e o que Ele quer que seja feito. Ele nos tem mostrado através da Bíblia como podemos realizar o propósito de Deus da maneira que Ele quer.

[cite] Leia Stott (cap. 1, p. 33-40): A Bíblia na evangelização do mundo

9. A BASE BÍBLICA EM CINCO TEMAS

Johannes Verkuyl apresenta cinco temas que se estendem por todo o Antigo Testamento e que fundamentam a ideia de que o povo judeu "desde seus primórdios ouviu e entendeu seu chamado para testemunhar diretamente bem como por sua presença".

O Tema Universal

Para aproveitar melhor esta seção é preciso abrir a Bíblia e examinar algumas passagens.

1. A TABELA DAS NAÇÕES. Veja Gênesis 10, onde se encontra a lista dos povos que foram dispersos em Babel em Gênesis 11. As nações são uma parte fundamental do drama bíblico. Deus sempre se preocupa com toda a humanidade.

A ELEIÇÃO DE ISRAEL. A eleição de Abraão e Israel revela que os olhos de Deus estão voltados para as nações.

AVANÇO DURANTE O EXÍLIO. Cerca de 400 anos antes de Cristo, Deus dispersou o povo judeu entre as nações. Depois de setenta anos, alguns foram reunidos de volta à terra de Israel, algo que alguns autores bíblicos consideram como o segundo êxodo. Verkuyl mostra que a visão dos judeus do mundo amadureceu durante esse período.

O Tema do Resgate e da Libertação

Deus ter resgatado Israel era algo fundamental. Que Deus resgataria as nações foi um tema que ganhou força e atenção à medida que as gerações passaram e foi muito trabalhado pelos profetas e salmistas. Os "Cânticos do Servo" de Isaías apresentavam o propósito de Deus de levar a salvação às nações (42:1-12; 43:1-13; 49:1-13; 52:13-53:12).

O Tema Missionário

Verkuyl nos proporciona seu ponto de vista sobre a frequente acusação de que Israel deveria apenas estar presente de forma passiva entre as nações e que Deus faria o resto. Lembre-se de que partes da própria Bíblia foram escritas em linguagem e formas que teriam sido significativas para as nações vizinhas.

O Tema do Antagonismo

Deus está em guerra com Seus inimigos a fim de resgatar Seus servos. Isto corrobora o que Ellisen afirmou sobre o programa de Deus para derrotar o mal. Observe particularmente como o zelo ardente de Deus contra seus inimigos está ligado à grande visão do reino vindouro. A guerra de Deus está ligada à Sua ambição pela revelação de Sua glória, o que é, na verdade, um quinto tema.

O Tema Doxológico

"Doxológico" refere-se à grandeza da glória de Deus. A palavra "doxológico" vem do termo grego para "glória". Esse tema é pouco mencionado por Verkuyl, mas ele o menciona.

[cite] Leia Verkuyl (cap. 8, p. 69-73): A base bíblica do mandato missionário mundial (Até "O livro de Jonas").

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO$conteudo$,
            1);
  end if;
end
$curso$;
