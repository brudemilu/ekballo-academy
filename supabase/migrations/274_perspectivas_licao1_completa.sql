-- 274_perspectivas_licao1_completa.sql
-- Lição 1 inteira, em transcrição literal: o guia de estudo e as seis
-- leituras que ele indica, na ordem em que o guia as chama.
--
-- Substitui as cargas 272/273 das mesmas aulas. O texto é palavra por palavra
-- o do PDF: só foi desfeito o que a EXTRAÇÃO quebrou (espaço perdido entre
-- palavras, ligadura devolvida como glifo + espaço, hifenização de fim de
-- linha, ordem das colunas). Caixa, pontuação, prefixos de subseção e até o
-- erro de digitação do original ("CONLUSÃO DO NÍVEL BÁSICO") ficam como estão.
--
-- Recria as aulas do curso: idempotente, e sem perda porque a Lição 1 ainda
-- não tem matrícula, progresso nem anotação vinculada.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe — rode 272 antes';
  end if;

  delete from aulas where curso_id = v_curso;

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (v_curso, $t$Lição 1 · Guia de estudo — Deus é um Deus Missionário$t$, $conteudo$Nosso Deus tem um propósito global. Ele colocou em nossos corações o desejo de sermos Seus amigos. Temos o desejo de colaborar com Deus nesta tarefa e de vivermos na dignidade de um propósito que é maior do que nossos próprios interesses. Realmente queremos servir a Deus da melhor maneira possível. O que nos impede? Nosso maior problema é que nossa visão é limitada.

Embora saibamos que Deus não é apenas aquele que só serve para resolver os nossos problemas pessoais, ainda é comum considerarmos Deus do nosso ponto de vista, como se Ele estivesse de plantão para nos ajudar cada vez que enfrentamos circunstâncias difíceis. Nossa visão é limitada pelo horizonte das nossas próprias preocupações e cultura. Mas existe um destino melhor, um propósito maior. Podemos nos apropriar disso ao conhecermos e seguirmos a Deus em direção a uma visão que ultrapassa nossa própria percepção acerca de nós mesmos.

Nesta lição começaremos uma jornada para descobrir o que Deus revelou a respeito do Seu propósito. Os Seus propósitos fazem mais sentido quando são vistos ao longo da história da Bíblia. Uma caminhada com Deus através da história das Escrituras nos lançará no centro do significado do restante da história.

Com o progresso da história, o propósito de Deus fica mais claro, pois tudo está se cumprindo assim como Ele prometeu. Porque Ele é um Deus de grande propósito e há uma missão que Ele se propôs a cumprir. Nosso Deus é um Deus missionário.

ESTUDAR ESTA LIÇÃO O AJUDARÁ:

1. Entender por que a aliança que Deus fez com Abraão revela o Seu propósito para cada povo.

2. Explicar como toda a Bíblia apresenta um forte mandato para a missão em todas as nações.

3. Compreender como Deus cumpre Suas promessas progressivamente através da história e como elas formam uma parte importante do nosso mandato para fazer missões.

4. Entender por que o empreendimento de missões tem base bíblica substancial que convoca cada crente a cumprir a sua parte.

5. Demonstrar como empreender o propósito missionário de Deus que se dá em três direções: em relação ao próprio Deus, em prol de todas as nações e a respeito dos poderes malignos de satanás.

NO NÍVEL AVANÇADO:

6. Compreender como a primeira promessa de Deus no jardim do Éden reflete o Seu propósito missionário.

7. Explicar como a Bíblia fornece a mensagem o modelo e o poder para realizar missões.

Palavra chave:

[cite] PROPÓSITO Fomos feitos para viver com um propósito. O próprio Deus vive com um propósito. A maneira de viver uma vida significativa é dedicar a sua vida a um propósito maior do que a sua própria vida.

1. A PROMESSA DE DEUS REVELA O SEU PROPÓSITO

Deus poderia ter revelado o Seu propósito na forma de mandamentos diretos a respeito daquilo que Ele queria que fosse feito. Em vez disso, Deus escolheu revelar o Seu propósito na forma de uma promessa, que é tanto pessoal quanto global: abençoar todas as famílias da terra.

[cite] Abra sua Bíblia em Gênesis 12. Este é o ponto da virada na Bíblia. Olhe as páginas de Gênesis 1-11. Que coisas estão acontecendo nessas passagens? A quais nações ou povos estas passagens estão se referindo? Agora atente para as páginas de Gênesis 12 em diante. Esta porção diz respeito a outros povos diferentes dos hebreus? Qual é a diferença central entre o que acontece em Gênesis 1-11 e o que acontece no restante da Bíblia a partir de Gênesis 12?

A. A Promessa de Deus

Um mandato é melhor do que um mero mandamento. Deus deu o Seu mandato inicialmente na forma de uma promessa em vez de um mandamento direto, pois a ênfase está muito mais naquilo que Deus iria fazer do que naquilo que Abraão deveria fazer. Deus enfatizou o resultado que Ele quis ver entre todos os povos da terra ao invés de ordenar Abraão a fazer alguma coisa e dar-lhe orientações detalhadas. Pensando bem, haveria uma maneira melhor de Deus entregar o Seu propósito para Sua família de fé que estaria trabalhando com Ele por milhares de anos?

A promessa revela as intenções de Deus claramente a cada estágio do seu cumprimento. Cada vez mais, Deus cumpre Sua promessa de forma mais plena. John Stott descreve o cumprimento triplo desta promessa. Primeiro, ela se cumpriu parcialmente nos dias de Abraão e ao longo do período do Antigo Testamento. Segundo a promessa foi retratada plenamente na vida de Jesus. E, por fim, a promessa será cumprida completamente no fim dos tempos, considerando que está sendo cumprida agora enquanto Ele edifica a Sua Igreja. Através da promessa, podemos ver Deus como o Deus da história, o Deus da aliança e o Deus da missão.

[cite] Leia Stott (cap. 3, p. 33-40): O Deus vivo é um Deus missionário.

[figura] /figuras/perspectivas/cumprimento-progressivo.png | O Cumprimento Progressivo da Promessa de Deus

B. A Promessa de Deus Repetida

O desejo de Deus em trazer bênção a todas as nações não é uma ideia pequena que, de repente, aparece no Novo Testamento. O propósito de Deus está embutido na própria formação do seu povo escolhido. Deus repete esta promessa cinco vezes para Abraão e sua família.

[cite] Leia em sua Bíblia: Gênesis 12.1-3; 18.18; 26.4; 28.14. Qual o significado do fato de Deus repetir a promessa diretamente para Isaque e Jacó?

C. A Promessa de Deus Confirmada

Deus poderia ter revelado o Seu propósito dando uma lista de tarefas que precisavam ser feitas ou Deus poderia ter abençoado Abraão de tal maneira que se criasse uma obrigação de retribuir esta bondade realizando tarefas “missionárias”. Mas Deus não se utiliza de contratos, como uma obrigação, para que o seu povo fosse servi-lo em Seu propósito missionário. Em vez disso, Deus espera ganhar esta obediência por amor. Em Gênesis 22, Abraão demonstra sua disposição em obedecer livremente pela fé, deixando que Deus, gerador da promessa, determine como e quando Ele a cumpriria. Nesse momento, Deus declara que, por causa da obediência de Abraão, certamente se cumpriria Sua promessa quanto à parte de Abraão no destino global.

[cite] Leia a história de Gênesis 22.1-18. Por que Deus declarou que a promessa para as nações se cumpriria por causa desse ato particular de obediência? O que Abraão provou?

2. POVO DE DEUS FORMADO PARA PARTICIPAR DO SEU PROPÓSITO

Embora a promessa enfatize que o próprio Deus faria uma obra maravilhosa no meio das nações, Abraão e seus descendentes não deveriam ser apenas espectadores passivos.

A. Comunicadores Ativos da Bênção

As declarações da bênção prometida vieram com um propósito claramente ligado: “para que tu sejas uma bênção” (v.2) e “para que em ti sejam benditas todas as famílias da terra” (v.3). [Nota do Tradutor: nos dois versículos a conjunção “para que” ficou subentendida na maioria das versões em português]. O propósito pelo qual Deus escolheu Abraão era para que ele e sua família exercessem um papel-chave dentro do Seu propósito global.

B. Significado Verdadeiro

Em contraste com o povo de Babel, que queria tornar famoso o seu próprio nome (Gn 11.4), Deus garantiu a Abraão que Ele engrandeceria o seu nome. O caminho do significado mais elevado na vida não está em obter segurança e prestígio. Assim como para Abraão, para nós o significado também está em ser uma bênção para as nações. Somos abençoados para sermos bênção. É muito mais do que um dever, é nosso destino.

C. Participando com Deus como Seu Sacerdócio

A aliança de Deus no Sinai revela Seu propósito para Seu povo. Este não é um relato isolado nas Escrituras. O Êxodo e a aliança feita no Sinai, formaram a ocasião mais marcante da história de Israel. O povo de Deus foi constituído com um propósito. Pedro deixa muito claro que as intenções de Deus continuaram as mesmas nos tempos do Novo Testamento e depois. Primeiro, o povo de Deus deve ser distinto, um povo santo e de valor único entre os povos do mundo. Segundo o povo de Deus deve ser o sacerdócio de Deus declarando Suas virtudes ao mundo.

[cite] Leia na plataforma Kaiser: A chamada missionára de Israel, até a seção “Salmo 67: Provar seu propósito”

D. Provando Seu Propósito

Os hinos do povo hebreu refletem o seu entendimento do mandato divino de abençoar as nações. Salmo 67 mostra que Israel sabia que as nações estavam olhando para o povo como uma demonstração daquilo que Deus queria fazer entre as nações. O destino final das nações — não de algumas, mas de todas — é de cantar louvores a Deus. O propósito de Deus é o foco do Salmo: “Deus nos abençoa” com um propósito: “para que os confins da terra o temam”. O propósito final de Deus é que as nações O glorifiquem, reconhecendo duas coisas: Sua bênção, de redenção e transformação que nos confere vida (vv. 1-2 e 6-7) e a supremacia do Seu reinado (v. 4)

[cite] Leia na plataforma Kaiser: A chamada missionára de Israel, toda a seção “Salmo 67: Provar seu propósito”

3. QUAL É O PROPÓSITO DE DEUS?

Deus tem um propósito singular que é refletido no Salmo 67: que Ele seja glorificado em adoração global. Para realizar esse fim, Deus age de acordo com um determinado propósito que não somente afetará todos os povos, mas também derrotará as forças espirituais malignas. Observe a ideia das três direções da missão de Deus:

A. Em Função de Deus

Deus deseja que adoração venha a Ele de cada nação. Por isso, a evangelização mundial, em última análise, é para Deus.

B. Para Pessoas

O desejo de Deus é trazer bênção redentora a cada povo. Ele redimirá um povo dentre todos os povos.

C. Com Respeito ao Maligno

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

A. Criação e Maldição

Bauckham segue o tema de bênção desde a criação e como Deus derrota definitivamente a maldição resultante do pecado com a bênção de Cristo.

B. O Evangelho em Gênesis 12

Bauckham cita Gálatas 3:8 “Prevendo a Escritura que Deus justificaria pela fé os gentios, anunciou primeiro as boas novas a Abraão: Por meio de você todas as nações serão abençoadas”. O texto diz que o evangelho é prenunciado e resumido na promessa de bênção de Deus.

C. O Pleno Propósito de Deus

Perceba na leitura do texto que Bauckham menciona as mesmas três direções do propósito de Deus. O “evangelho” anunciado tão precocemente a Abraão venceu, no devido tempo, a maldição e as consequências do mal, fazendo brotar vida e salvação aos povos a fim de trazer louvor a Deus.

1. Para Deus: “Aqueles que experimentam a bênção de Deus bendizem, por sua vez, a Deus, o que significa que eles dão aquilo que todas as criaturas de fato podem Lhe dar: ações de graça e louvor.”

2. Para os Povos: A bênção se refere a todo o tipo de abundância e salvação.

3. Contra o Mal: “O segredo da promessa está no fato de Cristo ter tomado sobre si a maldição para que a bênção prevaleça.”

[cite] Leia na plataforma Bauckham: A História de Bênção: Prevalecendo sobre a maldição

6. A PRIMEIRA PROMESSA DE DEUS DEMONSTRA A SUA VITÓRIA FINAL

Muito tempo antes de Abraão, Deus já tinha prometido derrotar o maligno e redimir pessoas, conforme verificamos em Gênesis 3.14-15. Este fato, muitas vezes, é chamado de o “protoevangelho” (primeiro evangelho).

[cite] Leia Gênesis 3.14-15. Repare que a palavra “descendente” está na forma singular, e que, de maneira semelhante a Gálatas 3.16, nos faz compreender “que se trata de um só, isto é, Cristo” (NVI).

A. Problema Duplo

Precisamos entender que o desafio do maligno causou um problema duplo:

1. Surgiu um reino satânico contrário ao reino de Deus, com a intenção de roubar a lealdade do povo, enganá-lo e destruí-lo.

2. Homens em rebelião renunciaram a sua posição real como guardiões da terra e, ironicamente, numa tentativa de alcançar maior poder, cederam à mentira do diabo, resultando em escravidão ao pecado e a morte.

B. A Estratégia Dupla de Deus com o Propósito Único

A estratégia e o propósito de Deus estão prefigurados no “protoevangelho”, referindo- se a dois “ferimentos”. Deus promete que uma figura humana destruiria completamente o diabo, ferindo a sua cabeça. No mesmo momento, Deus diz que Satanás feriria a figura humana, prefigurando o sofrimento redentivo de Cristo. É importante entender que Deus resolve os dois problemas em uma só missão: redime para governar e governa para redimir. As duas ênfases estratégicas têm um só propósito: a glória de Deus em adoração.

[cite] O Propósito Final de Deus: Atrair adoração leal de cada povo, demonstrando a Sua glória e manifestando o Seu amor pleno. A Estratégia Dupla de Deus: Enquanto o propósito final de Deus diz respeito a Sua glória, Ele tem trabalhado decisiva e incessantemente com uma estratégia integrada contra o maligno e em prol de pessoas.

[cite] Com respeito a Satanás: Deus trava uma batalha de libertação contra o reino satânico, contrariando as trevas, a fim de resgatar a humanidade e, no fim, destruir toda obra de Satanás.

[cite] Com respeito a pessoas: Deus redime um povo dentre os povos, trazendo-o para debaixo do governo de Cristo através da cruz e da ressurreição.

[cite] Leia na plataforma Ellisen. A pergunta de todos: O que Deus está tentando fazer.

[cite] Agora, entendendo melhor o propósito de Deus, repare como Ele sempre esperou que as bênçãos concedidas fossem compartilhadas em cumprimento deste propósito. Quando combatemos a injustiça, através do Evangelho, estendemos o Reino de Deus para sua glória eterna em adoração universal.

CONLUSÃO DO NÍVEL BÁSICO

7. BÊNÇÃO COMO TRANSFORMAÇÃO

Voltamos à revelação da história de Deus trazendo bênção a todos os povos da terra. Vemos na promessa a Abraão a intenção de Deus de que nos tornemos uma bênção para as nações. Mas o que significa “ser uma bênção”? Como fazer? Como serão as coisas quando ela acontecer? Sarita Gallagher e Steven Hawthorne seguem a história de bênção em Gênesis. A lógica de seu artigo é simples: Seja o que for que Deus quis dizer com “ser uma bênção” na promessa de Gênesis 12, pode ser observado no restante do livro de Gênesis.

A. A Bênção como uma Declaração de Legado e um Cumprimento Tangível

1. Declaração de Legado. A bênção não é um conceito comum em muitas sociedades ocidentais. Pronunciar ou transmitir uma bênção é conceder à pessoa ou ao objeto abençoado um potencial de vida para florescer em uma plenitude pretendida. Pronunciar uma bênção era considerado uma transação de poder vivificador e não apenas uma mera emissão de palavras.

2. Cumprimento Tangível. No relato de Gênesis, vemos muitos exemplos de cumprimento tangível de bênçãos. Quando isso ocorre, a pessoa é considerada como abençoada. Percebemos três categorias de bênção:

Bênção Material e Abundância Física. Deus trouxe grande riqueza, pelos padrões do Oriente Médio, a Abraão e seus descendentes.

Presença de Deus. A presença de Deus foi reconhecida por aqueles que observavam Abraão e sua família.

Paz com as Nações Vizinhas. Os exemplos no relato de Gênesis sugerem que onde Deus traz bênção, há um início de paz entre irmãos ou nações em rixa.

[cite] Leia na plataforma Gallagher e Hawthorne, “Benção como Transformação”, do início até chegar na seção “Bênção além da família de Abraão.”

B. Ser uma Bênção

Uma coisa é observar a incrível gama de bondade que a bênção representa. Uma coisa bem diferente é ver como uma pessoa ou um povo pode se tornar uma bênção para outras pessoas. Embora Abraão e seus descendentes em algumas ocasiões não fossem tão abençoadores, a história de Gênesis cita várias ocasiões em que Deus trouxe bênção a outras nações e famílias através deles.

1. Abraão, Isaque e Jacó. Deus ajudou Abraão a resgatar seus vizinhos em Sodoma e Gomorra. Abraão intercedeu por toda a cidade de Sodoma em outro momento. Abraão orou para que Deus restaurasse a capacidade de ter filhos ao clã de Abimeleque. Isaque cavou poços que forneceram água suficiente para ele e para as nações vizinhas. O trabalho de Jacó na casa de Labão foi obviamente obra de Deus.

2. José. A história de José é o ápice da história do livro de Gênesis e pode muito bem oferecer uma figura profética do ápice da história. Deus deu a José a capacidade de interpretar um sonho específico do faraó e então o ajudou a estocar cereal suficiente para ajudar muitas pessoas a sobreviver à fome que “havia espalhado por toda a terra” (Gênesis 41:56). “E de toda a terra vinha gente ao Egito para comprar trigo de José” (Gênesis 41:57). À medida que a fome se agravava, José não apenas ajudou o povo egípcio a sobreviver, mas os preparou com suprimentos suficientes até que os ciclos agrícolas normais fossem restaurados. O povo declarou “tu nos salvaste a vida” (Gênesis 47:25).

C. Cumprimento em Descendentes

A promessa de que ele e sua família seriam uma bênção para as nações foi repetida a Abraão três vezes e então, dirigida a Isaque e ainda uma quinta vez a Jacó. À medida que a promessa foi repetida, a linguagem mudou para que ficasse óbvio que grande parte do cumprimento da promessa não ocorreria durante a vida de Abraão, Isaque e Jacó, mas na vida de seus descendentes.

D. Cumprimento em Cristo

No livro de Gálatas, Paulo deixa claro que a promessa de bênção às nações, o próprio “evangelho” anunciado anteriormente, foi cumprido em um proeminente descendente de Abraão: Jesus Cristo. Paulo vai além e diz que todos os que creem em Cristo se unem a Ele, portanto, tornam-se filhos e filhas da família de Abraão. Isso significa que os crentes em Jesus devem se considerar descendentes de Abraão e herdeiros da promessa de Deus de abençoá-los para que se tornem uma bênção para as nações.

[cite] Leia na plataforma Gallagher e Hawthorne “Benção como Transformação” começando na seção “Bênção além da família de Abraão” até chegar na seção “A promessa de Deus se torna nosso mandato” (dentro das leituras desse guia de estudo).

E. A promessa se torna ordem

Se recebemos a ordem de ser Seus agentes de bênção entre todos os povos da terra, o que significa para as nações serem abençoadas? E como cumpriremos esse alvo?

1. Bênção Relacional. A bênção das nações significa muito mais que evangelismo, mas certamente não pode significar menos do que a evangelização de todos os povos. O convite para pertencer à família de Deus, confiando em Cristo como salvador é estendido a todos os povos. Assim, espera-se que os filhos de Abraão se multipliquem em cada povo. Como no livro de Gênesis, a presença de Deus sobre aqueles que O seguem é o início de todos os demais aspectos tangíveis de bênção que Deus deseja trazer. Isso significa que a evangelização tem uma prioridade especial: ela conduz a todas as coisas boas que Deus deseja levar às nações.

2. Bênção Material e Social. “Devemos esperar que Deus gere todo o tipo de bênção como economias que florescem com justiça e retidão, agricultura e indústrias que se desenvolvem com fartura para todos e paz nas comunidades e entre os povos e raças. Podemos esperar que Deus capacite Seu povo para combater doenças, quebrar os ciclos viciosos de pobreza, providenciar água em terras áridas e estar presente trazendo cura em meio às catástrofes.”

3. Não é “Evangelho da Prosperidade”. Note bem que Gallagher e Hawthorne distinguem a abundância material em Gênesis do “evangelho da prosperidade” que é ensinado em alguns círculos. Eles afirmam: “Os que advogam o chamado “evangelho da prosperidade” podem ter mais em comum com a cosmovisão (mágica) que reduz a bênção a um método de obtenção de riqueza material de Deus” (pg.35d). A doutrina do evangelho da prosperidade pode se aproximar da visão de que a bênção de Deus é uma “recompensa” para aqueles que realizam procedimentos de “fé” de maneira adequada. Em suas formas extremas, alguns cristãos veem a bênção como Deus relocando a riqueza financeira das nações para os cristãos ao invés de ver os cristãos como agentes da bênção de Deus sobre as nações.

F. Benção como Transformação

A ideia e a promessa de bênção podem nos dar substância bíblica para agendas, às vezes, concorrentes que exigem “transformação”. No sentido bíblico de bênção, encontramos o maravilhoso poder de Deus trabalhando ao lado da ação estratégica e vigorosa de Seu povo. No entanto, não há expectativa que produzamos soluções para todos os problemas ou criemos uma perfeição utópica.

G. José: O Primeiro a Ser Enviado

O modelo de José nos ajuda a entender como podemos cooperar com Deus para trazer bênção de vida. Ele é a primeira pessoa que as Escrituras mencionam como sendo “enviado por Deus” (Gênesis 45:5).

[cite] Leia na plataforma Gallagher e Hawthorne “Benção como Transformação” começando com a seção “A promessa de Deus se torna nosso mandato” até o fim.

UMA INTRODUÇÃO AO RESTANTE DE PERSPECTIVAS

Este curso foi organizado em torno de quatro dimensões básicas, ou “perspectivas” no Movimento Cristão Mundial: Bíblica, Histórica, Cultural e Estratégica. As palavras de John Stott em seu artigo (a seguir) podem nos servir como introdução ao restante do curso. O seu resumo da história da Bíblia nos ajuda a iniciar a seção Bíblica (lições 1 a 4), e a seção Histórica (lições 5 e 6). Ao explorar a história bíblica com mais profundidade, seguiremos muitos dos mesmos temas e abordagens para observarmos a continuidade ao longo dos séculos em direção ao cumprimento do propósito de Deus. Stott também introduz a seção Cultural (lições 8 e 9) e a seção Estratégica (lições 7 e 10-12) com os seus comentários sobre como a Bíblia fornece o modelo e o poder para a missão. As Escrituras revelam uma sabedoria muito necessária sobre a maneira de comunicar efetivamente o Evangelho em situações transculturais. A Bíblia também nos oferece os parâmetros básicos para o sábio pensamento estratégico, sobre como completar a tarefa por inteiro no poder e da maneira de Deus.

8. A BÍBLIA TODA COMO UM MANDATO MAIOR

A. Mandato para a Missão

O mandato bíblico para missões não é limitado a poucos versos bíblicos. Nunca deveríamos confiar em textos que querem provar uma causa, mas devemos sempre olhar além de versos isolados para verificarmos o mandato através de toda a história da Bíblia. Ao longo do caminho notaremos muitas referências do cuidado de Deus para com o mundo todo. E claro, também examinaremos as poucas passagens nas quais Deus expressa um mandamento explícito para a atividade missionária. Verificaremos melhor o enorme mandato para a missão mundial quando trilharmos através da Bíblia como um todo.

B. Mensagem, Modelo e Poder para a Missão

A Bíblia revela o que Deus tem feito e o que Ele quer que seja feito. Ele nos tem mostrado através da Bíblia como podemos realizar o propósito de Deus da maneira que Ele quer.

[cite] Leia Stott (cap. 1, p. 33-40): A Bíblia na evangelização do mundo

9. A BASE BÍBLICA EM CINCO TEMAS

Johannes Verkuyl apresenta cinco temas que se estendem por todo o Antigo Testamento e que fundamentam a ideia de que o povo judeu “desde seus primórdios ouviu e entendeu seu chamado para testemunhar diretamente bem como por sua presença”.

A. O Tema Universal.

Para aproveitar melhor esta seção é preciso abrir a Bíblia e examinar algumas passagens.

1. A TABELA DAS NAÇÕES. Veja Gênesis 10, onde se encontra a lista dos povos que foram dispersos em Babel em Gênesis 11. As nações são uma parte fundamental do drama bíblico. Deus sempre se preocupa com toda a humanidade.

A ELEIÇÃO DE ISRAEL. A eleição de Abraão e Israel revela que os olhos de Deus estão voltados para as nações.

AVANÇO DURANTE O EXÍLIO. Cerca de 400 anos antes de Cristo, Deus dispersou o povo judeu entre as nações. Depois de setenta anos, alguns foram reunidos de volta à terra de Israel, algo que alguns autores bíblicos consideram como o segundo êxodo. Verkuyl mostra que a visão dos judeus do mundo amadureceu durante esse período.

B. O Tema do Resgate e da Libertação.

Deus ter resgatado Israel era algo fundamental. Que Deus resgataria as nações foi um tema que ganhou força e atenção à medida que as gerações passaram e foi muito trabalhado pelos profetas e salmistas. Os “Cânticos do Servo” de Isaías apresentavam o propósito de Deus de levar a salvação às nações (42:1-12; 43:1-13; 49:1-13; 52:13-53:12).

C. O Tema Missionário.

Verkuyl nos proporciona seu ponto de vista sobre a frequente acusação de que Israel deveria apenas estar presente de forma passiva entre as nações e que Deus faria o resto. Lembre-se de que partes da própria Bíblia foram escritas em linguagem e formas que teriam sido significativas para as nações vizinhas.

D. O Tema do Antagonismo.

Deus está em guerra com Seus inimigos a fim de resgatar Seus servos. Isto corrobora o que Ellisen afirmou sobre o programa de Deus para derrotar o mal. Observe particularmente como o zelo ardente de Deus contra seus inimigos está ligado à grande visão do reino vindouro. A guerra de Deus está ligada à Sua ambição pela revelação de Sua glória, o que é, na verdade, um quinto tema.

E. O Tema Doxológico.

“Doxológico” refere-se à grandeza da glória de Deus. A palavra “doxológico” vem do termo grego para “glória”. Esse tema é pouco mencionado por Verkuyl, mas ele o menciona.

[cite] Leia Verkuyl (cap. 8, p. 69-73): A base bíblica do mandato missionário mundial (Até ”O livro de Jonas”).

CONCLUSÃO DAS LEITURAS NO NÍVEL AVANÇADO$conteudo$, 1);

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (v_curso, $t$Lição 1 · Leitura — Stott, cap. 3: O Deus vivo é um Deus missionário$t$, $conteudo$O Deus vivo é um Deus missionário

John R. W. Stott

3ilhões de pessoas no mundo de hoje são extremamenMte hostis ao empreendimento missionário cristão. Elas o consideram politicamente prejudicial (porque enfraquece os laços que unem a cultura nacional) e religiosamente tacanho (porque reivindica exclusividade para Jesus), enquanto os que se envolvem com missões são tidos como imperialistas arrogantes. O esforço para converter as pessoas a Cristo é visto como uma imperdoável interferência na vida pessoal. “Minha religião é assunto meu”, dizem. “Trate de seus próprios negócios e me deixe com os meus.”

Portanto, é essencial que os cristãos entendam as bases sobre as quais repousa a missão cristã. Só então seremos capazes de perseverar na tarefa missionária, com coragem e humildade, apesar da incompreensão e oposição do mundo. Mais precisamente, os cristãos bíblicos precisam de estímulos bíblicos, pois cremos que a Bíblia é a revelação de Deus e de sua vontade. Por isso, perguntamos: ele revelou nas Escrituras que a obra missionária é sua vontade para seu povo? Só então ficaremos satisfeitos. Pois então as missões se tornarão uma questão de obediência a Deus, a despeito do que os outros possam pensar ou dizer. Iremos aqui nos concentrar no Antigo Testamento, embora toda a Bíblia seja rica em evidências acerca do propósito missionário de Deus.

A chamada de Abraão

Nossa história começa cerca de 4 mil anos atrás, com um homem chamado Abraão, ou mais exatamente Abrão, como ele era chamado naquele tempo. Eis a narrativa da chamada de Abraão:

Disse o Senhor a Abrão: Sai da tua terra, da tua parentela e da casa de teu pai e vai para a terra que te mostrarei; de ti farei uma grande nação, e te abençoarei, e te engrandecerei o nome. Sê tu uma bênção! Abençoarei os que te abençoarem e amaldiçoarei os que te amaldiçoarem; em ti serão benditas todas as famílias da terra.

Partiu, pois, Abrão, como lho ordenara o Senhor, e Ló foi com ele. Tinha Abrão setenta e cinco anos quando saiu de Harã (Gn 12.1-4).

Deus fez uma promessa (complexa, conforme veremos) a Abraão, e para entender a Bíblia e a missão cristã é indispensável entender essa promessa. Talvez esses sejam os versículos que melhor resumem a Bíblia. Todo o propósito de Deus encontra-se condensado aqui.

Como introdução, iremos considerar o cenário da promessa de Deus, o contexto no qual ela foi feita. Então dividiremos em dois o restante de nosso estudo. Na primeira parte, destacaremos a promessa, isto é,o que Deus disse que faria. Na segunda parte, analisaremos, de maneira mais extensa, o cumprimento da promessa,ou seja, como Deus a tem cumprido e irá cumpri-la ainda. Comecemos, entretanto, com o cenário.

Gênesis 12 começa assim: “Ora disse o Senhor a Abrão...”. Parece uma forma abrupta de começar um novo capítulo. Somos levados a perguntar. “Quem é esse ‘Senhor’ que falou a Abrão? Quem é esse ‘Abrão’ a quem ele falou?”. Eles não são introduzidos no texto abruptamente. Há muita coisa por trás dessas palavras. Elas constituem uma chave que abre o todo das Escrituras. Os 11 capítulos anteriores conduzem a elas. O restante da Bíblia é consequência e cumprimento dessas palavras.

O que, então, existe por trás desse texto? É o seguinte: o “Senhor” que escolheu e chamou Abraão é o mesmo que no começo criou os céus e a terra e atingiu o clímax de sua obra criadora trazendo à existência o homem e a mulher, criaturas únicas feitas à semelhança dele. Jamais devemos esquecer que a Bíblia começa com o Universo, não com o planeta Terra; então, com a Terra, não com a Palestina; depois com Adão, na qualidade de pai da raça humana, não com Abraão, o pai da raça escolhida. Considerando, então, que Deus é o Criador do Universo, da Terra e de toda a humanidade, não devemos nunca rebaixá-lo à condição de divindade tribal ou a de um deus insignificante, como Quemos, deus dos moabitas, ou Milcom (Moloque), deus dos amonitas, ou Baal, o deushomem, ou Astarote, a deusa-mulher dos cananeus. Não devemos supor também que Deus escolheu Abraão e seus descendentes por haver perdido o interesse nos outros povos ou porque desistisse deles. Eleição não é sinônimo de elitismo. Pelo contrário, como veremos logo a seguir, Deus escolheu um homem e sua família, a fim de abençoar por meio deles todas as famílias da terra.

Portanto, ficamos profundamente magoados quando vemos o cristianismo relegado a um capítulo dentro de um livro sobre as religiões do mundo, como se fosse uma opção entre muitas, ou quando alguém faz referência ao “Deus cristão”, como se houvesse outros! Não, existe apenas um único Deus vivo e verdadeiro, que se revelou totalmente e, por fim, em seu único Filho Jesus Cristo. O monoteísmo jaz no alicerce das missões, como Paulo escreveu a Timóteo: “Há um só Deus e um só Mediador entre Deus e os homens, Cristo Jesus, homem” (1Tm 2.5).

O registro de Gênesis prossegue desde a criação de todas as coisas pelo Deus único e dos seres humanos conforme a semelhança divina, até nossa rebeldia contra nosso Criador e o julgamento de Deus sobre suas criaturas rebeldes. Esse julgamento, entretanto, é atenuado pela primeira promessa evangélica de que um dia a semente da mulher “pisaria” — na realidade “esmagaria” — a cabeça da serpente (3.15).

Os oito capítulos seguintes (Gn 4—11) descrevem os resultados devastadores da Queda: a alienação progressiva dos seres humanos em relação a Deus e aos outros seres humanos. Esse foi o cenário no qual Deus chamou e fez a promessa a Abraão. Tudo à volta era deterioração moral, trevas e dispersão. A sociedade se desintegrava cada vez mais. Todavia, Deus, o Criador, não abandonou os seres humanos que criara à sua semelhança (Gn 9.6). Dessa constante impiedade, ele chamou um homem e sua família e prometeu abençoar não apenas a eles, mas, por meio deles, a todo o mundo. A dispersão não continuaria descontroladamente: um grande processo de reunião estava começando.

A promessa

Qual foi, então, a promessa que Deus fez a Abraão? Foi uma promessa complexa que consistia de diversas outras promessas.

Primeira: a promessa de uma posteridade. Ele devia deixar sua parentela e a casa de seu pai e, em troca da perda da família, Deus faria dele “uma grande nação”. Mais tarde, para indicar isso, Deus mudou o nome do patriarca de “Abrão” (“pai exaltado”) para “Abraão” (“pai de uma multidão”) e lhe disse: “Por pai de numerosas nações te constituí” (Gn 17.5).

Segunda: a promessa de uma terra. Parece que o chamado divino veio em duas etapas. Primeiramente, em Ur dos caldeus, quando o pai de Abraão ainda vivia (11.31; 15.7), e depois em Harã, após da morte de seu pai (11.32; 12.1). De qualquer modo, ele devia deixar sua terra natal, e, em troca, Deus lhe mostraria outra.

Terceira: a promessa de uma bênção. Cinco vezes as palavras “bênção” e “abençoar”aparecem em 12.2,3. A bênção que Deus prometeu a Abraão transbordaria sobre toda a humanidade.

Uma posteridade, uma terra e uma bênção. Cada uma dessas promessas é desenvolvida nos capítulos que se seguem à chamada de Abraão.

Em primeiro lugar, a terra. Depois que Abraão generosamente permitiu que seu sobrinho Ló escolhesse onde queria se estabelecer (Ló escolheu o fértil vale do Jordão), Deus disse ao patriarca: “Ergue os olhos e olha desde onde estás para o norte, para o sul, para o oriente e para o ocidente; porque toda essa terra que vês, eu ta darei, a ti e à tua descendência, para sempre” (13.14,15).

Em segundo lugar, a posteridade. Um pouco mais tarde, Deus apresentou a Abraão outro recurso ilustrativo, convidando-o agora a olhar não para a terra, mas para o céu. Numa noite escura e desanuviada, Deus levou-o para fora de sua tenda e ordenou-lhe: “Olha para os céus e conta as estrelas”. Que ordem ridícula! Talvez Abraão tivesse começado: “Uma, duas, três, cinco, dez, vinte, trinta...”, mas deve ter desistido logo. Era uma tarefa impossível. Então Deus lhe disse: “Será assim tua posteridade”. E lemos. “Ele creu no Senhor”. Embora provavelmente já estivesse com mais de 80 anos de idade e ele e Sara não tivessem filhos ainda, Abraão creu na promessa de Deus, “e isso lhe foi imputado para justiça” por Deus. Isto é, pelo fato de ele haver confiado em Deus, O Senhor o aceitou como justo.

Em terceiro lugar, a bênção. “[Eu] te abençoarei” — Deus já havia aceitado Abraão como justo ou, tomando emprestada a expressão neotestamentária, “justificado pela fé”. Não podemos imaginar bênção maior. É a bênção fundamental da aliança da graça, a qual alguns anos mais tarde Deus esmiuçaria para Abraão: “Estabelecerei a minha aliança entre mim e ti e a tua descendência [...] aliança perpétua, para ser o teu Deus e da tua descendência. [...] e serei o seu Deus” (17.7,8). Deus instituiu a circuncisão como sinal exterior e visível da aliança da graça ou como penhor de que era o seu Deus. É a primeira vez nas Escrituras que ouvimos a fórmula da aliança, repetida muitas vezes mais tarde: “Eu serei o seu Deus, e eles serão o meu povo”.

“Uma terra, uma posteridade, uma bênção: mas que relação tem tudo isso com missões?”, talvez você se pergunte, impaciente. Minha resposta é: “Tudo! Seja um pouco mais paciente e verá”. Passemos agora da promessa para o cumprimento.

O cumprimento da promessa

Toda a questão do cumprimento das profecias do Antigo Testamento apresenta dificuldades, havendo sempre muitos mal-entendidos e quase nenhum acordo. De importância particular é o princípio, com o qual acho que todos concordamos, de que os autores do Novo Testamento entendiam que a profecia do Antigo Testamento não tinha um único cumprimento,mas que em geral era triplo — passado, presente e futuro. O cumprimento passado fora imediato, ou histórico, na vida da nação de Israel. O cumprimento presente era intermediário, ou evangélico, em Cristo e sua Igreja. O cumprimento futuro será final, ou escatológico, no novo céu e na nova terra.

A promessa de Deus a Abraão teve cumprimento histórico imediato em seus descendentes carnais, o povo de Israel

A promessa de uma posteridade numerosa, realmente incontável, feita por Deus a Abraão foi confirmada ao seu filho Isaque (26.4, “como as estrelas dos céus”) e ao seu neto Jacó (32.12, “como a areia do mar”). A promessa, aos poucos, começou a se cumprir literalmente. Talvez devêssemos examinar algumas das etapas desse desenvolvimento.

A primeira etapa refere-se aos anos de escravidão no Egito, dos quais se escreveu: “Os filhos de Israel foram fecundos, e aumentaram muito, e se multiplicaram, e grandemente se fortaleceram, de maneira que a terra se encheu deles” (Êx 1.7; comp. com At 7.17). A etapa seguinte ocorreu centenas de anos mais tarde, quando o rei Salomão declarou que Israel era um “povo grande, tão numeroso, que se não pode contar” (1Rs 3.8). A terceira etapa teve lugar cerca de 350 anos depois de Salomão. Jeremias advertiu Israel do juízo e do cativeiro iminentes e, então, acrescentou esta promessa divina de restauração: “Como não se pode contar o exército dos céus, nem medir-se a areia do mar, assim tornarei incontável a descendência de Davi, meu servo” ( Jr 33.22).

Tudo isso diz respeito à posteridade de Abraão: e o que dizer da terra? Mais uma vez, observamos com atitude de adoração e gratidão a fidelidade de Deus à sua promessa, pois foi lembrando sua promessa a Abraão, a Isaque e a Jacó que Deus libertou seu povo da escravidão no Egito e lhe deu o território que nessa narrativa é chamado “terra prometida” (Êx 2.24; 3.6; 32.13). Então, cerca de 700 anos depois, trouxe-os de volta a essa terra, após o cativeiro na Babilônia. Não obstante, nem Abraão nem seus descendentes físicos herdaram totalmente a terra. Como diz Hebreus 11, eles “morreram na fé, sem ter obtido as promessas”. Pelo contrário, como “estrangeiros e peregrinos sobre a terra”, eles aguardavam “a cidade que tem fundamentos, da qual Deus é o arquiteto e edifi - cador” (Hb 11.8-16,39,40).

Deus cumpriu suas promessas sobre a posteridade e a terra, pelo menos parcialmente. E as bênçãos? Bem, no Sinai, Deus confirmou e esclareceu sua aliança com Abraão e se comprometeu a ser o Deus de Israel (v. Êx. 19.3-6). No restante do Antigo Testamento, Deus continuou abençoando os obedientes, enquanto os desobedientes caíram sob seu juízo.

Talvez o exemplo mais dramático esteja no início da profecia de Oseias, na qual ele é orientado a dar a seus três filhos nomes que indicam o juízo divino, horrível e progressivo que se abaterá sobre Israel. Seu primogênito (um menino) foi chamado Jezreel, que significa “Deus dispersará”. Depois nasceu uma menina, LoRuama (arc), ou seja, Desfavorecida, pois Deus declarou que não teria mais piedade nem perdoaria seu povo. Finalmente, Oseias teve outro filho, Lo-Ami (arc), isto é, Não-Meu-Povo, pois Deus disse que eles não eram mais seu povo. Que nomes terríveis para o povo escolhido de Deus! Parece uma devastadora contradição da promessa eterna de Deus a Abraão.

Contudo, Deus não parou aí. Além do iminente juízo, haveria uma restauração, afirmada em palavras que mais uma vez fazem eco à promessa feita a Abraão: “Todavia, o número dos filhos de Israel será como a areia do mar, que se não pode medir, nem contar” (Os 1.10). Assim, o juízo implícito nos nomes dos filhos de Oseias seria invertido. Haverá um ajuntamento, em vez de dispersão ( Jezreel é uma palavra ambígua e também pode ter esse significado). Desfavorecida será favorecida, e Não-MeuPovo se transformará em “filhos do Deus vivo” (1.10—2.1).

É maravilhoso que os apóstolos Paulo e Pedro citassem esses versículos de Oseias. Eles viram seu cumprimento não apenas numa futura multiplicação de Israel, mas na inclusão dos gentios na comunidade de Jesus. “Antes, não éreis povo, mas, agora, sois povo de Deus, que não tínheis alcançado misericórdia, mas, agora, alcançastes misericórdia” (1Pe 2.9,10; v. Rm 9.25,26).

Essa perspectiva do Novo Testamento é essencial quando lemos as profecias do Antigo Testamento, pois o que sentimos faltar no Antigo Testamento é uma explicação clara acerca de como a prometida bênção de Deus transbordaria de Abraão e seus descendentes para “todas as famílias da terra”. Embora Israel seja descrito como “luz” para as nações e tenha a missão de levar a justiça a todos os povos (Is 42.1-4,6; 49.6), não é o que vemos acontecendo. Só no Senhor Jesus que essas profecias são cumpridas, pois apenas no seu Dia é que as nações são de fato incluídas na comunidade dos remidos. É para isso que nos voltamos agora.

A promessa de Deus a Abraão recebe cumprimento intermediário, ou evangélico, em Cristo e sua Igreja

“Abraão” é quase a primeira palavra do Novo Testamento, pois o evangelho de Mateus começa assim: “Livro da genealogia de Jesus Cristo, filho de Davi, filho de Abraão. Abraão gerou a Isaque...”. Portanto, Mateus relaciona com Abraão não só o começo da genealogia, mas também o início do evangelho de Jesus Cristo. Ele sabe que está registrando o cumprimento das antigas promessas de Deus a Abraão, feitas cerca de 2 mil anos antes (v. Lc 1.45- 55,67-76).

Desde o começo, porém, Mateus reconhece que não é simplesmente a descendência física de Abraão que qualifica o ser humano a herdar as promessas, mas uma descendência espiritual, isto é, o arrependimento e a fé no Messias que havia de vir. Esta era a mensagem de João Batista às multidões que se ajuntavam para ouvi-lo: “Não comeceis a dizer entre vós mesmos: Temos por pai a Abraão; porque eu vos afirmo que destas pedras Deus pode suscitar filhos a Abraão” (Mt 3.9; v. Lc 3.9; Jo 8.33-40). As implicações de suas palavras devem ter assustado seus ouvintes, uma vez que “era crença generalizada que nenhum dos descendentes de Abraão se perderia”.

Deus suscitou filhos a Abraão não de pedras, mas de uma fonte igualmente improvável, isto é, dos gentios! Portanto, Mateus, embora seja o mais judeu dos quatro escritores dos evangelhos, ele registra estas palavras de Jesus: “Digo-vos que muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus. Ao passo que os filhos do reino serão lançados para fora, nas trevas” (Mt 8.11,12; v. Lc 13.28,29).

É difícil imaginar o choque, a total confusão que essas palavras devem ter causado entre os ouvintes judeus de João Batista e Jesus. Eles eram descendentes de Abraão, portanto eles tinham direito às promessas que Deus fizera a Abraão. Quem eram, então, aqueles estranhos que iriam participar das promessas, aparentemente até usurpá-las, enquanto eles próprios seriam desqualificados? Os judeus ficaram indignados. Eles haviam esquecido completamente que a aliança de Deus com Abraão continha a promessa de um transbordamento de bênçãos sobre todas as nações da terra. Agora os judeus tinham de entender que era por meio Jesus, o Messias, ele próprio semente de Abraão, que todas as nações seriam abençoadas.

Parece que o apóstolo Pedro pelo menos começou a perceber essa realidade em seu segundo sermão após o Pentecostes. Ele se dirigiu a uma multidão de judeus com estas palavras: “Vós sois os filhos dos profetas e da aliança que Deus estabeleceu com vossos pais, dizendo a Abraão: Na tua descendência, serão abençoadas todas as nações da terra. Tendo Deus ressuscitado o seu Servo, enviou-o primeiramente a vós outros para vos abençoar, no sentido de que cada um se aparte das suas perversidades” (At 3.25,26). É uma declaração muito notável porque interpreta a bênção em termos morais de arrependimento e justiça, porque, se Jesus foi enviado “primeiro” aos judeus, ele foi presumivelmente enviado depois aos gentios, às “famílias da terra” que estavam “longe” (v. At 2.39), mas agora participariam das bênçãos.

Foi concedido ao apóstolo Paulo desenvolver plenamente esse maravilhoso tema. Ele foi chamado e designado para ser o apóstolo dos gentios, e a ele foi revelado o propósito eterno — e até então secreto — de Deus: tornar os judeus e os gentios “co-herdeiros, membros do mesmo corpo e coparticipantes da promessa em Cristo Jesus por meio do evangelho” (Ef 3.6).

Negativamente, Paulo declara com grande ousadia: “Nem todos os de Israel são, de fato, israelitas; nem por serem descendentes de Abraão são todos seus filhos” (Rm 9.6,7).

Quem são, então, os verdadeiros descentes de Abraão, os verdadeiros beneficiados pelas promessas de Deus? Paulo não deixa nenhuma dúvida. São os crentes em Cristo, de qualquer raça. Em Romanos 4, ele destaca que Abraão não só foi justificado pela fé, mas também recebeu essa bênção antes de ser circuncidado. Portanto, Abraão é o pai de todos os que, circuncidados ou não (isto é, judeus ou gentios), seguem o exemplo de sua fé (Rm 4.9-12). Se participamos da fé de Abraão, então “Abraão é pai de todos nós, como está escrito: Por pai de muitas nações te constituí” (v. 16,17). Portanto, nem a descendência física de Abraão nem a circuncisão física do judeu tornam a pessoa um verdadeiro filho de Abraão, e sim a fé. Os verdadeiros descendentes de Abraão são os crentes em Jesus Cristo, judeus ou gentios.

Qual é, então, a “terra” que os descendentes de Abraão herdaram? A carta aos Hebreus menciona um “descanso” no qual o povo de Deus entra agora pela fé (Hb 4.3). Numa expressão notável, Paulo menciona que “a Abraão ou a sua descendência coube a promessa de ser herdeiro do mundo” (Rm 4.13). Só podemos presumir que ele quis dizer a mesma coisa quando escreveu aos coríntios, dizendo que em Cristo “tudo é vosso: seja Paulo, seja Apolo, seja Cefas, seja o mundo, seja a vida, seja a morte, sejam as coisas presentes, sejam as futuras, tudo é vosso” (1Co 3.21-23). Os cristãos, pela maravilhosa graça de Deus, são co-herdeiros do Universo com Cristo.

Um ensino semelhante sobre a natureza da bênção prometida e seus beneficiários é apresentado por Paulo em Gálatas 3. Ele explica como Abraão foi justificado pela fé e acrescenta: “Sabei, pois, que os da fé é que são filhos de Abraão” (v. 6-9). Qual é, então, a bênção com a qual todas as nações foram abençoadas (v. 8)? Em uma palavra, é a bênção da salvação. Estávamos sob a maldição da lei, mas Cristo nos remiu, tornando-se maldição em nosso lugar, “para que a bênção de Abraão chegasse aos gentios, em Jesus Cristo, a fim de que recebêssemos, pela fé, o Espírito prometido” (v. 10-14). Cristo tomou sobre si nossa maldição, a fim de que pudéssemos herdar a bênção de Abraão, isto é, a bênção da justificação (v. 8), e a habitação do Espírito Santo (v. 14). Paulo resume essa realidade no versículo 29: “Se sois de Cristo, também sois descendentes de Abraão e herdeiros segundo a promessa”.

Mas ainda não terminamos. Temos o terceiro estágio de cumprimento: o que está por vir.

A promessa de Deus a Abraão terá um cumprimento final, ou escatológico, no destino final de todos os redimidos

No livro de Apocalipse, há outra referência à promessa de Deus a Abraão (7.9ss). João vê numa visão uma “grande multidão que ninguém podia enumerar”. É uma multidão internacional, vinda “de todas as nações, tribos, povos e línguas”. Ela está “em pé diante do trono”, o símbolo do Reino de Deus. Isto é, seu Reino chegou finalmente, e a multidão está desfrutando todas as bênçãos de seu afável governo. Ela está abrigada em sua presença. Seus dias de fome, sede e calor no deserto se acabaram. Finalmente, ela entrou na terra prometida, descrita agora não como “uma terra que mana leite e mel”, mas como uma terra irrigada com fontes de “água viva”, que jamais secarão. Mas como a multidão herdou essas bênçãos? Em parte, porque veio “da grande tribulação” (evidentemente uma referência à vida cristã com todas as suas provações e sofrimentos), mas principalmente porque “lavaram suas vestiduras e as alvejaram no sangue do Cordeiro”, isto é, foram purificados do pecado e vestidos de justiça pelos méritos da morte de Jesus Cristo, “razão por que se acham diante do trono de Deus”.

É comovente vislumbrar na eternidade futura o cumprimento final dessa antiga promessa de Deus a Abraão. Todos os elementos essenciais da promessa podem ser identificados. Aí estão os descendentes espirituais de Abraão, uma “grande multidão que ninguém podia enumerar”, incontáveis como os grãos de areia da praia e as estrelas do céu. Estão aí também “todas as famílias da terra” sendo abençoadas, pois a multidão inumerável é composta de pessoas de todas as nações. Aí está ainda a terra prometida, a saber, todas as ricas bênçãos que fluem do governo cheio da graça de Deus. E, acima de tudo, está Jesus Cristo, a semente de Abraão, que derramou seu sangue por nossa redenção e concede suas bênçãos a todos os que o invocam para serem salvos.

Conclusão

Iremos resumir o que aprendemos acerca de Deus com base em sua promessa a Abraão e o seu cumprimento, destacando cinco características.

Primeira: ele é o Deus da História. A História não é um fluxo de acontecimentos ao acaso. Deus executa, no devido tempo, o plano que concebeu na eternidade passada e será consumado na eternidade futura. No processo histórico, Jesus Cristo, na qualidade de semente de Abraão, é a figura-chave. Regozijemo-nos pelo fato de que, sendo discípulos de Cristo, somos descendentes de Abraão. Pertencemos à sua linhagem espiritual. Se recebemos as bênçãos da justificação pela fé, a aceitação de Deus e a habitação do Espírito, então somos hoje os beneficiários da promessa feita a Abraão há 4 mil anos.

Segunda: ele é o Deus da aliança. Isto é, Deus é suficientemente bom e afável para fazer promessas, e ele sempre cumpre o que promete. Ele é um Deus de amor e fidelidade contínuos. Preste atenção: nem sempre ele cumpre suas promessas imediatamente. Abraão e Sara “morreram na fé, sem ter obtido as promessas; vendo-as, porém, de longe” (Hb 11.13). Ou seja, embora Isaque lhes nascesse em cumprimento da promessa, a semente do casal ainda não era numerosa, nem eles herdaram a terra, nem as nações haviam sido abençoadas. Todas as promessas de Deus se realizam, mas elas são herdadas “pela fé e pela longanimidade” (Hb 6.12), isto é, pela paciência. Devemos nos contentar em esperar a hora divina.

Terceira: ele é o Deus da bênção. “[Eu] te abençoarei”, foi o que disse a Abraão (Gn 12.2). “Deus [...] enviou-o [ Jesus] primeiramente a vós outros para vos abençoar”, exclamou Pedro (At 3.26). A atitude de Deus para com seu povo é positiva, construtiva, enriquecedora. O juízo é sua “obra estranha” (Is 28.21). Sua principal obra e característica é abençoar a humanidade com a salvação.

Quarta: ele é o Deus da misericórdia. Sempre recebi muito alento da declaração de Apocalipse 7.9, segundo a qual a multidão dos remidos no céu será “uma grande multidão que ninguém podia enumerar”. Não tenho a pretensão de saber como será, uma vez que os cristãos sempre parecem ser uma minoria, mas as Escrituras declaram isso para alento nosso. Embora nenhum cristão bíblico possa ser universalista (crendo que toda a humanidade será finalmente salva), uma vez que as Escrituras ensinam a terrível realidade e a eternidade do inferno, o cristão bíblico pode (e até deve) afirmar que os remidos serão, de algum modo, uma multidão internacional tão imensa que não poderá ser contada. A promessa de Deus será cumprida, e a semente de Abraão será tão numerosa quanto o pó da terra, as estrelas do céu e a areia da praia.

Quinta: ele é o Deus das missões. As nações não são reunidas automaticamente. Se Deus prometeu abençoar “todas as famílias da terra”, ele pretendia fazê-lo por meio da descendência de Abraão (Gn 12.3; 22.18). Somos a semente de Abraão pela fé, e as famílias da terra só serão abençoadas se formos a elas com o evangelho. Esse é o propósito explícito de Deus.

Oro para que a expressão “todas as famílias da terra” seja gravada em nosso coração. Ela, mais que qualquer outra, revela o Deus vivo da Bíblia como um Deus missionário. Essa expressão também condena o denominacionalismo mesquinho, o nacionalismo estreito, o orgulho racial (branco ou negro), o paternalismo condescendente e o imperialismo arrogante. Como nos atrevemos a adotar uma atitude hostil, desdenhosa ou mesmo indiferente para com qualquer pessoa de outra cor ou cultura se nosso Deus é o Deus de “todas as famílias da terra”? Precisamos nos tornar cristãos globais, com uma visão global, pois temos um Deus global.

Portanto, que Deus nos ajude a nunca esquecer a antiga promessa de 4 mil anos feita a Abraão: “Em ti e na tua descendência serão abençoadas todas as famílias da terra”.

Perguntas para estudo

1.De acordo com Stott, por que é importante conhecer a base sobre a qual repousa a missão

cristã? Por quais outras razões o conhecimento de tal base é importante?

2.Qual o contexto da promessa feita por Deus a Abraão? Como foi que a promessa de uma

terra, de uma posteridade e de uma bênção se cumpriu no passado? Como essa promessa se

cumpre no tempo presente? Como a promessa de Deus a Abraão receberá cumprimento fi -

nal, no futuro?

[cite] J. Jeremias, Jesus’ Promise to the Nations (London: SCM Press, 1958), p. 48.

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo extraído de James E. Barney (Org.), You Can Tell the World [Você pode contar ao mundo] (Downers Grove: InterVarsity, 1979). Usado com permissão. O Deus vivo é um Deus missionário$conteudo$, 2);

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (v_curso, $t$Lição 1 · Leitura — Kaiser: A chamada missionária de Israel$t$, $conteudo$A Chamada Missionária de Israel

Walter c. Kaiser Jr

Existe um rumor bem difundido de que o Antigo Testamento não possui uma mensagem ou visão missionária. O Antigo Testamento é, de acordo com a crença popular, um livro e uma mensagem dedicados unicamente aos judeus e ao seu destino como nação. Mas esse rumor e ponto de vista não se enquadram dentro das reivindicações que o próprio Antigo Testamento faz. Mesmo que limitemos nossa investigação a três textos básicos do Antigo Testamento, imediatamente observaremos que tais textos trazem três das mais incisivas declarações de chamada missionária.

Hesitaremos mais em suspeitar que o Antigo Testamento não traz qualquer desafio missionário caso tivéssemos dedicado atenção mais cuidadosa ao seu início. Certamente a mensagem e o propósito dos capítulos iniciais de Gênesis, a saber, Gênesis 1-11, são universais quanto ao apelo e globais quanto ao público. Porventura Deus não tratou "todas as famílias da terra" com graça salvadora quando agiu em três ocasiões específicas em Gênesis 1-11? Ou mais detalhadamente, não é verdade que depois da queda do homem, do dilúvio e do insucesso da torre de Babel, Deus proclamou as magníficas mensagens de salvação em Gênesis 3.15; 9.27 e 12.1-3?

Caso duvidemos que a palavra dita a Abraão em Gênesis 12.1-3 tenha sido global e universal em seu oferecimento e propósito, lembremo-nos, então, rapidamente que ela foi proferida tendo como contexto a tábua das setenta nações de todo o mundo, que se encontra descrita em Gênesis 10. As mesmas "famílias da terra" aparecem nesse texto e em Gênesis 12.3.

Os Gentios do Antigo Testamento Alcançaram a Fé

O fenômeno de gentios depositando sua fé na "semente" ou no "Homem da Promessa" que viria não era desconhecido nem deixava de ser frequentemente lembrado no Antigo Testamento. Pense em Melquisedeque (Gênesis 14), um rei-sacerdote da cidade de Salém (Jerusalém); este gentio confessou abertamente sua fé em Jeová (Yahweh). Jetro, um midianita e sogro de Moisés, demonstrou sua consagração ao mesmo Senhor de Moisés e Arão quando se sentou com eles para participar de uma refeição comunitária sacrificial (Êxodo 18). Ninguém poderia acusar Balaão de ter uma posição pró-judaica ou de ser exageradamente nacionalista, pois desejava ardentemente favorecer o rei de Moabe e amaldiçoar a nação de Israel. Ainda assim, ele foi o oráculo divino da verdade, muito embora o começo tenha sido meio difícil quando sua mula demonstrou discernimento mais profundo do que o próprio profeta. Balaão, todavia, deixou para nós dois impressionantes capítulos (Números 23-24), inclusive a grande e única profecia que relaciona o Messias a uma estrela.

Falta-me tempo para mencionar as cidades inteiras que se arrependeram com a pregação de um único profeta judeu – por exemplo, Jonas e os ninivitas. Mesmo que o servo de Deus tenha ficado mais que relutante e bem triste e tenha tido uma "experiência tão grande quanto uma baleia" (literalmente), antes de finalmente pregar aos gentios imundos que massacraram os judeus, a cidade veio a conhecer ao Senhor em grandes proporções porque Jonas de fato pregou. Mesmo assim, esperava que esse fosse um sermão a cujo apelo ninguém respondesse.

Alguém, todavia, ainda poderá duvidar que o Antigo Testamento tivesse explicitamente ordenado aos crentes e mensageiros de sua época que fossem aos gentios. Perguntam se, por acaso, Deus alguma vez enviou um israelita ou a nação inteira com a Grande Comissão.

Três Textos Básicos

Há três textos básicos que deixam claro que Deus fez exatamente assim. Os textos são: Gênesis 12.1-3; Êxodo 19.4-6 e Salmo 67. Estes três textos são tão básicos para compreendermos o mandato missionário que Deus entregou a toda a nação de Israel que é impossível considerar o Antigo Testamento de modo adequado sem tratar destes textos em seu contexto missionário. Israel sempre foi, no plano e propósito de Deus, responsável por comunicar a mensagem da graça de Deus às nações. Israel foi destinada a ser uma nação comunicadora.

A menos que pensemos que essas três passagens do Antigo Testamento não tenham qualquer relevância para nós que vivemos na era cristã e que sua mensagem seja uma prescrição com data de antes de Cristo, deve ficar bem claro que elas são também uma ordem de Deus para nós. Em forma de esboço, sua mensagem é a ordem de Deus a nós para:

I. Proclamar Seu plano de abençoar as nações – Gn 12.3;

II. Participar do Seu sacerdócio como agentes dessa bênção – Êx 19.4-6; e

III. Provar Seu propósito de abençoar todas as nações – Sl 67

Gênesis 1-11

Ninguém pode dizer que o Antigo Testamento se inicia de modo extremadamente nacionalista ou que o Deus desse testamento fosse tão favorável aos judeus que o trabalho missionário não aconteceria até que o tempo dos gentios tivesse chegado. Como já afirmamos, Gênesis 1-11 claramente defende o contrário. A abrangência desses capítulos é mundial na oferta de salvação para todos que crerem. O tema oposto nestes mesmos capítulos é as nações buscando um "nome" para si. Em Gênesis 6.4 e 11.4, o propósito único da humanidade era ter um "nome" para si e tornar sua reputação cada vez mais conhecida – mas à custa do "nome" de Deus.

Desta forma, os "filhos de Deus" (pelo contexto de Gênesis 6, acredito terem sido déspotas tiranos e poligâmicos) tomaram para si este título divino, juntamente com suas prerrogativas inerentes, e fizeram mau uso dos próprios instrumentos de autoridade que Deus havia estabelecido para justiça, e usaram esses instrumentos indevidamente para satisfazerem seus próprios desejos e cobiças. Este foi o segundo grande fracasso da era patriarcal (Gênesis 1-11). Foi precedido pela queda do homem em Gênesis 3 e teve seu ponto mais alto no terceiro fracasso, o da torre de Babel, em Gênesis 1 1 .

Gênesis 12.1-3: Proclamar Seu Plano

Entretanto, para cada um desses três fracassos, nosso Senhor pronunciou uma palavra salvadora de graça: Gênesis 3.15; 9.27 e 12.1-3. É essa terceira palavra de graça que nos interessa aqui, pois enfatiza a palavra divina de graça em contraste com os fracassos dos homens e sua busca idólatra por um "nome" ou fama. Cinco vezes Deus fala em bênção: "te abençoarei", "te abençoarei", "te abençoarei", "abençoarei os que te abençoarem", e "em ti serão benditas todas as famílias da terra".

Não há dúvida de que a palavra principal aqui é bênção ou abençoar. A mesma palavra caracterizou a seção inteira, começando com a palavra a Adão e Eva "E Deus os abençoou, e lhes disse: Sede fecundos; multiplicai-vos", da mesma maneira como já havia graciosamente prometido abençoar os animais.

Apesar dessa palavra, o homem continuou a lutar por um significado para sua vida ao procurar ter um "nome". Em oposição ao vazio daqueles dias (e dos nossos dias), o vazio de procurar fora de Deus posição, fama e realização humanas, Gênesis 12.2 anuncia repentinamente que Deus daria a Abraão um "nome" como bênção dos céus e não como resultado de obras que colocassem Deus de lado.

O significado mais maravilhoso de todos esses textos missionários não pode ser inteiramente compreendido até que comecemos a perceber que na verdade existem três promessas de bênção em Gênesis 12.2-3, onde Deus promete:

1 . "De ti farei uma grande nação",

2. "E te abençoarei", e

3. "Te engrandecerei o nome"

Mas estas promessas são imediatamente seguidas de uma conjunção subordinativa final: "para que tu sejas uma bênção" (isto é, indicativo de propósito). Nenhuma destas três promessas de bênção seria para o engrandecimento pessoal de Abraão. Na verdade, ele e sua nação seriam abençoados para que pudessem ser uma bênção. Mas bênção para quem? Como? Para encontrarmos respostas a estas perguntas devemos analisar mais duas promessas.

Passariam a existir duas classes distintas de pessoas: as que abençoariam a Abraão e as que o amaldiçoariam. As duas outras promessas foram:

4. "Abençoarei os que te abençoarem", e

5. "Amaldiçoarei os que te amaldiçoarem"

Mais uma vez, no entanto, o escritor de Gênesis acrescenta uma conjunção final, ao mesmo tempo em que muda o tempo verbal, de modo que se tenha uma declaração mais completa de seu propósito. Isto aconteceria "para que em ti sejam benditas todas as famílias da terra".

Isso, então, explica por que deveria haver tantas bênçãos. Este homem e seus descendentes deveriam ser desde o início, missionários e canais da verdade. É de extrema importância que reconheçamos que o verbo hebraico neste caso deve ser traduzido na voz passiva ("'ser abençoado") em vez de na reflexiva ("abençoar-se"), uma vez que o entendimento de todas as mais antigas versões e gramáticas hebraicas, e do Novo Testamento, insiste nesse ponto. É uma questão de graça, não de obras. As nações seriam abençoadas através da "semente" deste homem. De fato, a "semente" da mulher (Gn 3.15), a "semente" de Sem, em cujas tendas Deus viria a "tabernacular" ou "habitar" (Gn 9.27) e a "semente" de Abraão formaram um todo coletivo. Esse todo foi resumido através de sua sucessão de representantes, os quais foram como sinal e penhor até que Cristo mesmo viesse naquela mesma linhagem e como parte daquela sucessão e entidade corporativa.

Inicialmente, os beneficiários desta bênção foram apenas as setenta famílias relacionadas em Gênesis 10 como todas as "famílias" da terra. Do ponto de vista do assunto tratado, esse capítulo precede o terceiro fracasso da humanidade, em Babel, o qual, por sua vez, conduz Gênesis à significativa palavra acerca do propósito e plano divinos de trazer todas as nações do mundo a Si mesmo. Esperava-se que a palavra dita a Abraão tivesse um grande impacto sobre todas as famílias que habitam sobre a face da terra. Sem dúvida alguma, este é um ensino muito significativo em termos missionários.

Alguém poderá permanecer um tanto quanto cético, dizendo que não consegue perceber qualquer evangelho ou boas novas em Gênesis 12.2-3. Nossa resposta para tais questionadores ainda não convencidos é que observem que Paulo, em Romanos 4.13, declarou Abraão como o herdeiro de todo o mundo. Obviamente, essa herança tem de ser de natureza espiritual. Além do mais, Paulo claramente afirmou em Gálatas 3.8 que o evangelho foi antecipadamente pregado a Abraão quando recebeu a promessa de Gênesis 12.3: "em ti serão benditas todas as famílias da terra". Essa era, e ainda é, as boas novas do evangelho.

Se hoje temos fé, então somos parte da "semente" de Abraão (Gl 3.29). O objeto da fé e confiança ainda é o mesmo; o ponto central para Israel e as nações da terra é que o Homem da Promessa, que devia vir na "semente" de Abraão e de Davi, veio em Jesus Cristo.

A mensagem e seu conteúdo, que é de fato, o propósito total de Deus, era que Ele constituiria uma nação e lhe daria um "nome", também a abençoaria para que pudesse ser luz para as nações e, portanto, uma bênção a todas as nações. Da parte de Israel, recuar seria um erro. A nação de Israel seria missionária de Deus ao mundo – e nós também o somos em virtude destes mesmos versículos! A missão não mudou em nossos dias. Deus não tinha o propósito de que Abraão e Israel fossem transmissores da "semente" mais passivos do que nós devamos ser. Eles deveriam ser uma bênção para que pudessem realmente comunicar o dom de Deus ao mundo.

As nações foram vistas de diferentes maneiras, mas o modo pelo qual Deus lidou com elas foi sempre diretamente relacionado à maneira como reagiram ao Homem da Promessa, o qual viria através da nação que Deus havia tornado grande e à qual dera o chamamento de abençoar e de ser uma bênção. O chamado de Israel não se constituiu na oportunidade nem na base para a rejeição de qualquer das nações do mundo, mas, ao contrário, no próprio meio de abençoá-las. A busca de um "nome", de fama, de reputação, ainda existe hoje, mas ainda hoje Deus se dispõe a dar o Seu próprio "nome". Ele ainda dará Seu "nome" especial àqueles que crerem naquela mesma "semente". Esta semente é o único meio pelo qual eles e todos os seus parentes sobre a face da terra serão abençoados e farão parte da família de Deus.

Alguém poderá concordar que o objeto da fé foi, de fato, a semente que viria da linhagem de Abraão, mas talvez não concorde que Deus, por essa razão, esperasse ou exigisse de Abraão e seus descendentes qualquer coisa parecida com a nossa tarefa missionária. Talvez devessem ser completamente passivos enquanto Deus agia como o único protagonista no Antigo Testamento.

Êxodo 19:4-6: Participar do Seu Sacerdócio

Êxodo 19.4-6, o segundo texto do Antigo Testamento para nossa consideração, não permitirá tal interpretação. No conhecido discurso de Moisés, em que ele se refere às asas da águia, Deus relembra Israel de como Moisés os sustentou desde o Egito, tal como uma águia transportaria seus filhotes que estivessem aprendendo a voar. Uma vez que eram os destinatários deste dom da libertação, o texto propositadamente diz: "Agora, pois ..." Essas palavras deixam implícita uma consequência natural que deveria ser resultado do auxílio miraculoso de Deus na fuga deles do Egito.

Começar a ler Êxodo 19.5 sem o "agora, pois", e enfatizar apenas as condições apresentadas a seguir, é perder a ênfase do texto. Tal como Êxodo 20.1 , este texto deve começar no ambiente da graça. "Eu sou o Senhor teu Deus, que te tirei da terra do Egito." O "agora, pois" vem em seguida por causa da bênção anterior de Deus.

Êxodo 19.5-6 prossegue: "se diligentemente ouvirdes a minha voz, e guardardes a minha aliança, então sereis a minha propriedade peculiar entre todos os povos porque toda a terra é minha; vós me sereis reino de sacerdotes e nação santa" (itálicos do autor). Estes são os três ministérios que Deus especifica para os descendentes de Abraão.

Em primeiro lugar, eles deviam ser a propriedade peculiar de Deus, ou como também poderia ser traduzido, a Sua possessão especial. A palavra "peculiar" veio de uma palavra latina que significava objetos de valor ou quaisquer tipos de bens transportáveis que, em contraste com bens imóveis, não estão presos à terra. É o caso de joias, rebanhos e vínculos. O ponto central é que Israel devia ser filho de Deus, Seu povo, Seu primogênito (Êx 4.22) e, agora, Seu tesouro especial. A ênfase aqui é sobre a portabilidade daquela mensagem e sobre o fato de que Deus atribuiu um valor tão elevado a pessoas. É exatamente assim que Malaquias 3.17 nos descreve: "joias", "tesouro".

Outro papel que Israel devia desempenhar era o de ser rei e sacerdote para Deus. A forma possessiva (ou o construto hebraico) "reino de sacerdotes" é mais bem traduzida (com base em seis ocorrências em textos de prosa) por "reis e sacerdotes" ou "sacerdotes reais". Se alguma dúvida ainda existia, é aqui que o papel missionário de Israel se torna explícito. Como representante do reino de Deus, a nação toda devia agir exercendo um papel mediador em relação às demais nações.

De fato, foi esta passagem que se tornou a base para a famosa doutrina do Novo Testamento a respeito do sacerdócio dos crentes (veja 1Pe 2.9; Ap 1.6; 5.10). Infelizmente para Israel, eles rejeitaram este sacerdócio de todos os crentes e insistiram com Moisés para que subisse ao monte Sinai em seu favor e como seu representante. Entretanto, muito embora o plano original de Deus tenha sido momentaneamente frustrado e adiado até a época do Novo Testamento, ele não foi derrotado, substituído ou desprezado. Continuou sendo o plano de Deus para os crentes. Eles ainda teriam um papel mediador.

Israel devia realizar uma terceira tarefa: a de "nação santa". Na Bíblia, a santidade não é uma espécie de anestésico que atinge os participantes de um culto dominical e os torna como que apáticos e passivos. Santidade é inteireza. Ser "santo" é pertencer "inteiramente" ao Senhor.

É pena que em português tenhamos que usar duas palavras de origem totalmente distinta (a que sugere o aspecto religioso, "santo", e a que sugere o secular, "inteiro"), enquanto em hebraico as duas palavras têm uma raiz comum. Como nação, Israel devia se apresentar inteira ao Senhor. Eles deviam estar separados não apenas em suas vidas, mas também no seu trabalho. A chamada e a eleição recebidas de Deus eram para servir, e esse serviço já havia sido definido ainda nos dias de seu ancestral Abraão.

Assim com os sacerdotes deviam representar a Deus e mediar Sua palavra às nações, da mesma maneira Israel, com uma nação santa, devia assumir dois relacionamentos: um com Deus, seu Rei, e outro com as nações. Israel devia ser uma nação separada para todas as eras e para todos os povos. Em vez disso, todavia, Israel começou a se comportar egoisticamente, como frequentemente fazemos, agindo como um clube de piedosos, em vez de se lembrarem de que foram chamados para compartilhar com as nações as bênçãos, a verdade, as dádivas e a "Semente". Pode-se dizer que carregavam um documento que os identificava como "Embaixadores do Homem da Promessa que Viria".

Todavia, não esqueci a distinção entre Israel e a Igreja. É possível fazer distinção entre estas duas instituições da mesma maneira como é possível fazer distinção entre macho e fêmea. Apesar disso, a morte de Cristo derrubou a parede de separação existente no templo, na qual estava inscrita a advertência de que seria castigado com a morte qualquer gentio que desobedecesse e ultrapassasse seus limites. Homem, mulher, judeu, grego, escravo – não importa mais nenhuma dessas ou de quaisquer outras condições. Todos os que creem constituem um só "povo de Deus". Esta é, de fato, a expressão que dá ideia de continuidade e identifica todos os que em todas as épocas pertencem ao Salvador. E Pedro deixa a ideia bem clara ao chamar os crentes gentios de sua época de "raça eleita, sacerdócio real, nação santa, povo de propriedade exclusiva de Deus" (1Pe 2.9). A citação de Êxodo 19 é bem óbvia e clara. A questão é: será que reconhecemos a continuidade no propósito e plano divinos?

Pedro continua a esclarecer o assunto. Deus havia chamado Seu povo por estes quatro títulos (1Pe 2.9) "a fim de (que proclamassem) as virtudes daquele que (os) chamou das trevas para a sua maravilhosa luz". A razão pela qual Israel, e agora os gentios crentes, ter sido chamado de sacerdócio real, nação santa, povo de Deus, Sua raça escolhida, Sua possessão especial e transportável, é que possamos anunciar, declarar e ser Seus missionários e testemunhas.

Nenhuma destas dádivas devia ser utilizada unicamente para nós mesmos. Não nos foram dadas para servirem de simples distintivos. Tinham o propósito de declarar Seus atos poderosos e de chamar pessoas para a Sua maravilhosa luz. Outrora, diz Pedro nesse mesmo contexto (tomando emprestados os nomes cheios de simbolismo dos filhos de Oseias), "não éramos povo" (Lo-Ami), "não tínhamos misericórdia" (Lo-Ruama). Mas agora somos o povo de Deus. Agora recebemos a misericórdia e a graça de Deus.

Pedro está tentando nos mostrar que o povo de Deus, em todas as épocas, tem sido um. Ainda que possamos identificar dentro desse único povo de Deus diversos aspectos, tais como Israel e Igreja, e ainda que possamos relacionar diversos aspectos desse plano e propósito divinos de que todas as nações da terra sejam abençoadas, mesmo assim é mais do que certa a unidade de todos os crentes e a continuidade desse programa entre o Antigo Testamento e o Novo. E nos dois testamentos vemos que o plano de Deus é que participemos desse sacerdócio, sendo agentes de bênção a todas as nações da terra. Êxodo 19 nos mostra que este era o plano de Deus.

Salmo 67: Provar Seu Propósito

Nosso terceiro e último texto vem do Salmo 67. Vimos como Deus nos chama a todos: 1) a proclamar Seu plano às nações (Gênesis 12), 2) a participar do Seu sacerdócio como agentes de bênção a todas as nações (Êxodo 19), e agora 3) a provar Seu propósito de abençoar todas as nações (Salmo 67). Este Salmo é baseado na bênção arônica, que se encontra em Números 6.24-26:

O Senhor te abençoe e te guarde;

O Senhor faça resplandecer o seu rosto sobre ti, e tenha misericórdia de ti;

O Senhor sobre ti levante o seu rosto, e te dê a paz.

Hoje em dia, frequentemente se ouvem estas palavras no fim de cultos evangélicos.

Mas repare no que o salmista faz aqui. Em vez de dizer "Yahweh" (isto é, SENHOR), que para Israel era o nome pessoal de Deus e usado nas alianças, ele emprega Elohim (isto é, Deus), o nome usado quando o relacionamento de Deus com todos os homens, nações e a criação é necessário. O salmista orou: "Seja Deus gracioso para conosco, e nos abençoe". E mais uma vez o salmista muda ligeiramente as palavras, usando as palavras "entre nós" (literalmente), em vez de "sobre nós"... "e faça resplandecer entre nós o seu rosto".

É significativo que este salmo missionário tenha aplicado a todos os povos o que Deus havia dado através de Arão e dos sacerdotes. O propósito desta bênção estendida se encontra imediatamente no versículo 2: "para que se conheça na terra o teu caminho; em todas as nações (ou, entre todos os gentios), a tua salvação". Esta é a razão por que Deus foi gracioso e abençoou Israel e todos os que creram. Isto, então, está em concordância com Gênesis 12.3.

A ideia destes versículos era: Que o Senhor nos abençoe, concidadãos israelitas. Que Ele Se agrade em nos beneficiar. Que as nossas colheitas produzam cada vez mais e que os nossos rebanhos se reproduzam abundantemente. Que nossas famílias cresçam e que prosperemos espiritualmente, para que as nações possam olhar para nós e dizer que aquilo pelo qual Arão orou aconteceu de fato através da bênção de Deus. A própria generosidade de Deus demonstra que Ele nos abençoou. Portanto, que o restante de Seu propósito também venha a acontecer: que por abençoar Israel, todas as nações da terra também possam conhecer a Deus.

Este salmo tem sido chamado de Pater Noster ("Pai Nosso"), ou a Oração do Senhor do Antigo Testamento. Ela tem três estrofes: vv. 1-3 (terminando com: "Louvem-te os povos, ó Deus; louvem-te os povos, todos") vv.4-5 (terminando com o mesmo refrão) vv. 6-7.

Provavelmente este salmo era cantado durante a festa de Pentecostes. O salmo é ainda mais notável pelo fato de que seria no Pentecostes que Deus iria derramar o Seu Espírito sobre todas as nações e que uma colheita incomum iria acontecer, uma colheita maior do que a acontecida anteriormente em qualquer outra festa. Deliberadamente, o salmista se refere à colheita como um penhor, um sinal e um símbolo da colheita espiritual de cada tribo, língua e nação. De modo que possa o Senhor ser verdadeiramente gracioso (cheio de graça) conosco e nos abençoe.

Três vezes este salmo se refere à bênção divina: nos versículos um, seis e sete. A estrutura é uma réplica quase exata de Gênesis 12.2-3. Abençoa-nos, abençoa-nos, abençoa-nos ... para que todas as nações possam conhecer o Senhor.

O salmista nos conclama a provar e testar os propósitos de Deus por três razões. Essas razões se enquadram na estrutura que já observamos. A primeira razão é que Deus tem sido gracioso conosco (vv.1-3). Temos experimentado a graça de Deus no Seu jeito e maneira de lidar com Israel. Temos experimentado essa graça ao sabermos que Sua salvação foi estendida a todas as nações. Como seria se todos os povos de todas as nações viessem a conhecer pessoalmente essa mesma graça!

Uma segunda razão é que Deus governa e guia todas as nações (vv.4-5). Neste contexto, todavia, Ele não é um juiz no sentido forense, com a função de condenar ou punir. Ao contrário, é um governante real que governa legalmente com justiça, como lemos em Isaías 11.3ss. Na qualidade de Grande Pastor do Salmo 23.3, é um guia para as nações. Por esta razão, o refrão aparece de novo: Venham, todos os povos da terra. Venham ouvir. Está na hora de vocês começaram a louvar o Senhor.

E por fim temos a terceira razão: a própria bondade de Deus (vv.6-7). Devemos provar o propósito de Deus de abençoar as nações porque Ele tem sido tão bom conosco. A terra tem dado cada vez mais frutos, e nossos celeiros, depósitos de cereais e silos estão transbordando. Será que isto não foi uma evidência de que Deus respondeu à oração de Arão e dos sacerdotes, mencionada em Números 6.24-26? O poder de Deus é evidente na própria abundância da colheita.

Esse mesmo poder e essa presença de Deus que trouxeram o crescimento material estão disponíveis também para o crescimento espiritual. Caso este poderfosse mais evidente em nossas vidas e pregação, os resultados espirituais no exterior entre todas as nações e em nossa própria nação seriam testemunhados por todas as pessoas. O que se deve destacar é que o salmista não pronunciou palavras e formas vazias, mas compôs o Salmo para que Israel e nós experimentássemos uma verdadeira mudança em nossas vidas. A bênção de Deus vem para que os confins da terra recebam benefício espiritual. O que aconteceu materialmente era apenas para ser um sinal de uma bênção de dimensões muito mais amplas.

Sim, "Abençoe-nos Deus, e todos os confins da terra o temerão" (v.7). A palavra "temer" não traz a ideia de terror ou medo. Existem dois diferentes usos da palavra "temer". Êxodo 20.20 nos exorta: "Não tenha medo, ao contrário, tema o Senhor". Não tenha medo, ao contrário, confie e ponha toda a dedicação de sua alma nEle.

Por essa razão, o temor do Senhor é o princípio de tudo – da compreensão, da vida, da santidade pessoal, bem como de um relacionamento pessoal e vital com Ele. Temor é uma das palavras do Antigo Testamento que designam confiança e fé. A bondade de Deus para com Israel tinha o propósito de ser uma das maneiras de Deus trazer todas as nações do planeta Terra a temê-lo, isto é, à fé no Homem da Promessa que viria, nosso Senhor Jesus Cristo. Israel devia ser uma nação que testemunhasse, proclamasse e evangelizasse. Os gentios tinham que ser trazidos à luz.

Este propósito para Israel é visto ainda mais claramente numa passagem que não faz parte desta discussão, a saber, as passagens acerca do "Servo do Senhor" em Isaías 42 e 49. Israel é aquele servo do Senhor, ainda que o Messias seja o representante final por excelência de todo o grupo. Como tal, Israel devia ser uma "luz para as nações", tal como Abraão fora ordenado a ser, o escritor de Êxodo havia exortado e o salmista havia cantado.

O salmista ansiava e desejava profundamente que Deus, o Rei de Israel, fosse reconhecido como Senhor e Salvador de todas as famílias da terra. Nosso desejo e anseio deveriam ser menores? Será que Deus nos chama a algo menos do que também provar, juntamente com Israel, Seu propósito nesta passagem do Salmo 67? O desafio de Deus a Israel também é nosso: devemos ter um papel mediador na proclamação de Seu nome entre as nações. Esse ainda é o propósito de Deus. Ele está se cumprindo em sua vida?

Uma Multidão de Testemunhas

Espero que a chama do evangelho, encapsulada em Gênesis 12.2-3, e o chamado para sermos uma nação santa e um sacerdócio real despertem em nós o desejo de proclamar o evangelho nos dias que ainda temos pela frente. Que anunciemos não apenas ao nosso país, mas a cada nação sobre a face da terra, que Jesus é o Senhor para a glória de Deus Pai. Creio que nossas faculdades teológicas e seminários farão um excelente trabalho de preparar homens para pregarem como nunca antes nos púlpitos deste país, mas também creio, e oro nesse sentido, para que de nossas faculdades teológicas, seminários e de cada segmento da sociedade surja uma imensa multidão de homens e mulheres que literalmente circundem o globo pelo nome que está acima de todo nome, o nome de nosso grande Deus.

Que Deus abençoe vocês que já atenderam a Seu chamado. Apenas lamento que não haja ainda mais pessoas indo. Que o Senhor nos repreenda e nos sonde para que descubramos se nós mesmos não devamos nos juntar a este grande grupo. Oro para que apoiemos aqueles que estão indo a fim de que possam apresentar relatórios com tal plenitude do poder e bênção do Espírito de Deus para que outra multidão seja acrescentada à primeira. E oro para que os recursos materiais necessários surjam enquanto Deus fala a cada um de nós; oro para que sejamos generosos com o Senhor, o qual tem sido muito generoso conosco. Assim seja. Amém.

Perguntas Para Estudo

1 . Deus deu um mandato missionário ao povo de Israel no Antigo Testamento da maneira como o fez com a Igreja no Novo Testamento? Explique sua resposta com base em textos bíblicos. 2. Qual a continuidade existente entre a missão de Deus no Antigo Testamento e a mesma missão no Novo?

Walter C. Kaiser Jr. é professor de Línguas Semíticas e de Antigo Testamento bem

como deão e vice-presidente de educação da Escola Teológica Evangélica da Trindade, em Deerfield, Illinois, EUA. Anteriormente ensinou na Faculdade Wheaton e atuou como pastor. Adaptado de uma mensagem apresentada em 14 de maio de 1981 aos alunos da Escola Teológica Evangélica da Trindade, Deerfield, Illinois, EUA. Usado com permissão de Walter C. Kaiser Jr.$conteudo$, 3);

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (v_curso, $t$Lição 1 · Leitura — Bauckham: A história da bênção$t$, $conteudo$A história da bênção:

prevalecendo sobre a maldição

Richard Bauckham

Em Gênesis 12, Abraão é escolhido por Deus imediatamente após a narrativa completamente universal dos primeiros onze capítulos de Gênesis. A história nos leva ao grande catálogo de todas as nações, 70 delas, descendentes dos três filhos de Noé, encontradas no capítulo 10. Então, o capítulo 11 conta a história de Babel, a partir da qual toda a raça humana foi espalhada por toda a terra para formar as várias nações, divididas pelo idioma e geografia. Gênesis 10-11 define, por assim dizer, a cena internacional para todo o restante da história da Bíblia. Ao contrário da escolha de Noé e de sua família, a escolha de Abraão não é de modo algum para ser entendida como Deus abandonando as nações. No caso de Abraão, ele é escolhido precisamente para que a bênção possa vir a todas as nações, a todas as setenta nações que Deus espalhou sobre a face de toda a terra.

Bênção é a palavra-chave nas promessas de Deus a Abraão: o próprio Abraão será abençoado, em que seus descendentes serão uma grande nação, e Abraão será uma bênção, em que todas as famílias da terra serão abençoadas (Gn 12:2-3). A promessa de que todas as nações serão abençoadas é repetida mais quatro vezes em Gênesis (18:18; 22:18; 26:4; 28:14). Na última destas ocasiões é dada ao filho de Abraão, Isaque, e ao neto, Jacó. Além disso, mesmo nas histórias de Jacó e seus filhos, a bênção das nações começa – ou pelo menos é anunciada – quando Jacó traz bênção a Labão (30:27) e José a Potifar (39:5). Depois, há a cena peculiarmente significativa quando o velho patriarca Jacó, em sua chegada ao Egito, dá sua bênção a ninguém menos do que o Faraó do Egito (47:7).

Bênção é uma rica noção bíblica que tem sido bastante negligenciada em nossa teologia. A bênção na Bíblia refere-se à generosidade e abundância características de Deus no ato de dar tudo que é bom às suas criaturas e sua contínua renovação da abundância da vida criada. A bênção é a provisão de Deus para o florescimento humano. Mas também é relacional: ser abençoado por Deus não é apenas conhecer as boas dádivas de Deus, mas conhecer ao próprio Deus em sua generosa liberalidade. Porque a bênção é relacional, o movimento da bênção é um movimento que sai de Deus e retorna a Ele. A bênção de Deus sobre as pessoas transborda na bênção delas aos outros e, aqueles que experimentam a bênção de Deus, por sua vez, bendizem a Deus, o que significa que eles dão tudo o que todas as criaturas realmente podem dar a Deus: ações de graças e louvor.

A bênção destaca o relacionamento entre criação e salvação de uma maneira diferente de outras formas de caracterizar a atividade de Deus no mundo. Já no quinto dia da criação Deus abençoa (Gn 1:22). Bênção é a maneira como Deus capacita que sua criação seja fértil e frutífera, para crescer e florescer. É no sentido mais abrangente o propósito de Deus para sua criação. Onde quer que a vida humana desfrute das coisas boas da criação e produza os bons frutos da atividade humana, Deus está derramando sua bênção. Onde quer que as pessoas bendigam a Deus por suas bênçãos, Deus é conhecido como o bom Criador que provê para o florescimento humano. A bênção de Deus é universal.

Mas não devemos pensar na ideia de bênção como algo que descreve a bondade de Deus na criação, mas que também não nos ajuda a entender sua bondade na salvação. A salvação também é bênção de Deus, uma vez que a salvação é o cumprimento dos propósitos de Deus, apesar do dano que o mal faz à criação de Deus. A bênção abraâmica é mais do que a bênção da criação, porque ela é projetada para lutar e superar seu oposto: a maldição de Deus.

Com o pecado, a maldição de Deus entra na criação juntamente com a bênção de Deus. Encontramos o histórico universal da promessa de Deus a Abraão no relato sobre as nações em Gênesis 10-11. Mas há um histórico ainda mais antigo em Gênesis 3 e 4, onde as bênçãos da criação se transformam em maldição (3:17; 4:11). A maldição entra até mesmo na promessa de Deus a Abraão, aparentemente em paralelo com a bênção. Deus diz a Abraão, em Gênesis 12: "Abençoarei os que te abençoarem e amaldiçoarei os que te amaldiçoar" (Gn 12:3, cf. 27:29; Nm 24:9). Mas a bênção predomina na promessa (como a diferença entre o plural "os que te abençoarem" e o singular "quem te amaldiçoar" parece sugerir), e é claramente a bênção, não maldição, que é o objetivo do chamado de Deus a Abraão. Portanto, a bênção tem a última palavra na promessa: "por meio de você todos os povos da terra serão abençoados".

Através da história de Israel, a maldição acompanha continuamente a bênção (por exemplo, Dt 7:12-16; 27-28), mas o objetivo final da promessa de Deus a Abraão é a bênção que prevalecerá sobre a maldição. Isso acontece quando a descendência de Abraão, o descendente de Abraão escolhido, o Messias, torna-se "uma maldição em nosso lugar... para que em Cristo Jesus a bênção de Abraão chegasse também aos gentios" (Gl 3:13 -14). É por isso que a promessa de Deus de que as nações serão abençoadas é chamada de "o evangelho" segundo Paulo (Gl 3:8). O segredo da promessa é que Cristo leve a maldição para que a bênção possa prevalecer. O evangelho é que em Jesus Cristo a maldição foi posta de lado e o propósito criativo de Deus para a bênção sobre sua criação está estabelecido além de qualquer possibilidade de reversão. A última e eficaz palavra de Deus é Sua bênção. É uma palavra particular, falada na vida, morte e ressurreição de Jesus, difundida por aqueles que, como Paulo, não podem deixar de transmiti-la, de tão poderoso que é o seu efeito, inundando de bênçãos vindas daqueles que, abençoados por ela, tornam-se bênção para os outros.

Richard Bauckham é Professor de Estudos do Novo Testamento na Universidade de St.

Andrews. Publicou muitas obras em teologia histórica e Novo Testamento. From Bible and Mission, 2003. Usado com permissão de Baker Academic Books, Grand Rapids, MI.$conteudo$, 4);

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (v_curso, $t$Lição 1 · Leitura — Ellisen: A pergunta de todos$t$, $conteudo$A pergunta de Todos: O que Deus

está tentando fazer?

Stanley A.Ellisen

O Reino Eterno de Deus

A bíblia apresenta a Deus como um rei eterno: "O Senhor é rei eterno" (Sal.10:16).

Também declara que Ele é soberano sobre todas as coisas (Sal.103:19). Por ser infinito, está em todo lugar. De modo que, em todo momento e lugar, na vastidão de

Seu universo, Deus sempre tem pleno controle. Nunca abriu mão desta prerrogativa suprema de sua divindade. Proceder assim seria fazer-Se menos do que Deus. Se desejamos ter uma idéia correta de Seu reino, é essencial reconhecer Sua ilimitada soberania. A obra da criação, com todos os riscos aparentemente envolvidos, foi a obra da Sua soberania.

A primeira Rebelião

Na administração de Seu reino, Deus governa através do princípio de autoridade delegada. Ele organizou os anjos como uma hierarquia, atribuindo níveis de responsabilidade e esferas de serviço. Para poder atuar como Seu mais destacado auxiliar na direção deste reino, Deus concedeu a um determinado arcanjo beleza, sabedoria e poder marcantes (Ez. 28:12-17; Jud.9). Deu-lhe o nome de Lúcifer e um trono a partir do qual governaria (Is.14:12-14). Este anjo governava como o primeiro de Deus por excelência.

Não se sabe quanto tempo durou este relacionamento este relacionamento harmonioso naquele passado longínquo. Possuindo liberdade de escolha, o teste crucial de qualquer criatura era a submissão à vontade de Deus. Esse teste crucial aconteceu para Lúcifer quando passou a admirar a si mesmo e as características esplendorosas que havia recebido de Deus. Inebriado por sua própria grandeza, proclamou independencia e imaginou ser "semelhante ao Altíssimo" (Is. 14:14). Naquele momento de decisão lançou-se para longe do eixo estabilizador da vontade de Deus e iniciou a queda alucinante de um ser ímpio. Sua decisão foi final e dela nunca se arrependeu. Lúcifer, todavia, não fez esta escolha sozinho. Evidentemente foi seguido por um terço dos anjos do céu (Apoc. 12:4-7), o que também sugere o grande fascínio de sua liderança. Com esta multidão de rebeldes ele estabeleceu um reino todo seu, o falso reino de trevas. Seu nome foi mudado para Satanás (adversário), fazendo justiça ao seu comportamento. Se Deus é soberano, porque não destruiu imediatamente este arqui-rebelde? Porque não realizou uma execução em massa de toda a horda de anjos desobedientes? Ou, pelo menos, porque não os trancafiou para sempre no abismo do inferno? A resposta é que Deus tem tal plano, mas no momento está usando estes rebeldes para alcançar um outro objetivo. Na realização de Seu programa, Deus não ficou limitado a um plano sem alternativas, mas foi capaz de Se adaptar às circunstâncias. Sua soberania é tão grande que é capaz de fazer com que a ira dos homens se torne em louvor a Ele e com que todos os Seus inimigos O sirvam (Sal. 76:10). Para Seus Inimigos a ironia devastadora da soberania está em que no final, e apesar de si mesmos, eles terminam servindo-O. Quanto aos anjos caídos, a uns aprisionou até o juízo, a outros concedeu uma liberdade limitada até que Seu objetivo maior seja alcançado. O fato crucial que se deve observar é que Deus de fato permitiu a formação de um reino de trevas. Este reino foi formado por forças voluntárias sob a liderança de Satanás, e não por um ato criador de Deus. Tornou-se assim um pólo contrário ao reino divino de luz e uma opção fascinante para todas as criaturas morais no exercício de sua liberdade moral. É um reino falso que existe simultaneamente com o reino verdadeiro de Justiça.Com bastante frequência parece ter o domínio, não apenas coagindo homens e mulheres, mas inclusive conquistando-os. Isto em parte acontece por causa de seu modus operandi. E ao contrário de muitas idéias infantis, o demônio não é um monstro vermelho com um tridente na mão, mas frequentemente um benfeitor. Seu propósito de vida é adulterar as obras de Deus. Isto é o que mais ambiciona desde que passou a ter o seu próprio negócio. O primeiro desejo que foi registrado termina com as palavras: "serei semelhante ao altíssimo" (Is.14:14). Este esforço falsificador é o seu mais eficiente empreendimento, pois quando mais fielmente puder imitar a Deus, menos provável será que os homens se inclinem a buscar a Deus ou a Sua vontade.

O Início do Reino Terrestre de Deus

Depois da queda de Satanás. Deus iniciou uma outra criação: o homem. De modo semelhante, concedeu a este ser a liberdade de escolha, por mais perigoso que este segundo empreendimento pudesse parecer.A liberdade de escolha era essencial à personalidade humana para que o homem e a mulher fossem feitos à imagem de Deus. O grande desígnio de Deus é reproduzir-Se a Si mesmo em personalidades humanas, especialmente nelas reproduzir Seus traços de amor e santidade. E estas características divinas só podem crescer no ambiente de liberdade moral. Comunhão implica escolha moral.

Com esta liberdade Deus procurou colocar o homem e a mulher num relacionamento íntegro com Sua soberania. Procurou Se relacionar com eles com amor, não pela coação. A força de união do amor é infinitamente mais forte do que a de um músculo. Com isto em mente, tornou Adão e Eva participantes de Seu Governo. Como teste inicial foram proibidos de comer da "árvore do conhecimento do bem e do mal" (Gên. 2:17). Foi-lhes dada oportunidade de escolha, clara e simples, entre submissão e desobediência. A árvore não foi posta no jardim para importunação ou como armadilha, mas como um teste inevitável. Deu ao casal a opção de escolher se seriam leais a Deus ou se submeteriam às alternativas enganadoras apresentadas pela serpente.Caso houvessem rejeitado esta idéia maligna em favor de uma série dedicação a Deus, poderiam ter comido da "árvore da vida" e ser eternamente confirmados na justiça (Gên. 3:24; Apoc. 22:2). Mas cada um deles desobedeceu ao mandamento claro de Deus, e a queda do homem aconteceu. Nesta ação deliberada proclamaram sua independência da vontade de Deus e sua filiação ao reino das trevas de Satanás. A causa deste desastre não foi a árvore, nem a serpente, nem o demônio por detrás da serpente (Apoc. 12:9). Estes somente criaram oportunidade para que duas pessoas expressassem liberdade de escolha em relação à vontade de Deus. A causa do desastre estava na decisão dos dois Neste Teste de obediência falharam e caíram, junto com o exército de anjos que já haviam ca íd o . A julgar pelas aparências, esta segunda queda da criação de Deus pareceu acabar com as grandes esperanças que o criador tinha de ampliar o Seu reino aos agentes morais. O homem recebera responsabilidades cósmicas a fim de ter domínio sobre a terra. Mas não se podia confiar nele nem que fosse por uma única fruta. Será que a dádiva divina da livre escolha era por demais arriscada? Será que a outorga desta liberdade não conduziria à eliminação suicida de toda a raça? Certamente pareceu ser contraproducente ao propósito de Deus, pois o pecado teve o aspecto de se tornar vitorioso.

Os dois problemas em resumo

O dilema a esta altura pode ser resumido como sendo dois problemas que Deus passou a ter em Sua atividade criadora. Um foi o fato de que Seu auxiliar de confiança, Lúcifer, desertara e dera início a um reino adulterado, roubando também a submissão de um grande contingente de anjos. O segundo foi que o homem, feito à imagem de Deus, também desertara e caíra num estado de pecado e de desintegração pessoal. Por mais razões o reino de Deus estava dividido e parcialmente usurpado.

A pergunta frequentemente feita é por que Deus iria Se preocupar com uma operação de resgate. Por que não destruir tudo e começar de novo? É claro que isto não estava dentro de Seu plano soberano e também que isto não seria a resposta certa para o profundo desafio que a dupla rebelião apresentava. Deus não apenas reagiu ao insidioso desafio que a dupla rebelião apresentava. Deus não apenas reagiu ao insidioso desafio do pecado, como também, por Sua graça, iniciou uma operação que iria maravilhosamente redimir os pecadores. Neste plano Ele se defrontou com dois problemas: 1) como reivindicar Seu reino, que havia sido usurpado, e 2) como providenciar redenção à humanidade. A solução que Deus procurava não podia lidar com os dois problemas separadamente. Ele, então, idealizou um plano pelo qual a vitória sobre o falso reino proporcionaria a salvação da humanidade. Não poderia ser alcançada com uma simples demonstração dos músculos divinos; a resposta não seria o estalar do chicote. Um julgamento cataclísmico e abrangente seria adiado. Seria necessário ação, junto com a profundeza e o poder de Seu maior atributo: o a m o r.

O Reino de Deus e os programas Redentivos

Quando Adão e Eva pecaram pela primeira vez, Deus iniciou Seu julgamento pela serpente (Gên. 3:14-15). Neste julgamento também apresentou o proto-evangelho, anunciando Seu propósito redentivo para os homens. À serpente disse: "Porei inimizade entre ti e a mulher, entre a tua descendência e o seu descendente. Este te ferirá a cabeça, e tu lhe ferirás o calcanhar." Esta mensagem foi obviamente dirigida tanto ao homem quanto a Satanás, talvez mais a este. Nela Deus profetizou que, devido à inimizade recíproca, aconteceriam duas contusões ou esmagamentos. A cabeça da serpente seria esmagada pela semente da mulher, e o calcanhar da semente da mulher seria esmagado pela serpente. Mais tarde se descobre que os dois personagens deste conflito são Cristo, que é a semente nascida de uma mulher (Gál. 4:4), e Satanás, chamado de "a antiga serpente" (Apoc. 20:2).

Ao analisarmos estes dois esmagamentos, temos uma descrição curta e vivida do programa de Deus com relação a Satanás e ao homem. A primeira afirmação, "Ele te ferirá a cabeça", era uma profecia de que Cristo destruiria o diabo. Cristo mesmo falou de prender Satanás, o homem "valente" deste sistema mundial, e de expulsá-lo (Mat. 12:29; João 12:31). A morte de Cristo na cruz estabeleceu a base para a destruição final de Satanás, pois "quem com ferro fere, com ferro será ferido". E com este julgamento final, o falso reino que criou também será destruído. Isto, é, claro, ainda não aconteceu, mas terá lugar depois do reino milenar de Cristo. Pode-se pensar em todo este processo, pelo qual Deus reivindica Sua autoridade em todas as esferas e interrompe para sempre toda rebelião, como o programa divino do reino

O segundo esmagamento anunciado em Gênesis 3:15 é o esmagamento, pela serpente, do calcanhar da semente da mulher. Este ataque diabólico se cumpriu na cruz, tendo Satanás sido a força impulsionadora da crucificação de Cristo. O esmagamento do calcanhar sugere a natureza temporária da morte de Cristo. O esmagamento da cabeça da serpente. A morte de Cristo na cruz tornou-se, então, a base para o programa redentivo de Deus, programa através do qual proporcionou salvação aos homens.

É assim que, neste proto-evangelho apresentado no Éden, Deus introduziu em forma de esboço o duplo programa que Ele tem para o Seu reino e para a redenção do homem. No final das contas, Deus iria reivindicar todo o Seu reino ao destruir Satanás e seu reino, e iria redimir aqueles que cressem nesse Seu programa, através da morte de Cristo.

O Duplo programa de Deus é Revelado

As demais partes do Antigo Testamento apresentam o desenvolvimento progressivo deste duplo propósito de Deus na terra. O Senhor escolheu dois homens de fé, através dos quais deu início a estes programas e os colocou em movimento. O primeiro foi Abraão, o qual viveu por volta de 2000 a.C. Com ele Deus fez uma aliança, prometendo, entre outras coisas, uma semente que seria bênção a todas as nações. Paulo identificou esta semente como sendo Cristo, e a bênção que viria através de Abraão como sendo a redenção ou justificação (Gál. 3:6-16). A semente de Abraão traria redenção aos homens, cumprindo o programa redentivo. Para cumprir o propósito de Seu reino, Deus escolheu a Davi a partir da mesma linhagem, por volta de 1000 a.C., e fez uma aliança a respeito de um reino e de uma semente real (2 Sam. 7:12-16). Algum dia esta semente de Davi iria governar sobre toda a casa de Israel para sempre. Foi mais tarde revelado que este Ungido, além de governar sobre Israel, estenderia Seu governo sobre todo o mundo (Am. 9:12; Zac. 14:9). Através da semente de Davi, Deus completaria o programa de Seu reino ao destruir os rebeldes e governar o mundo com justiça.

Dois filhos típicos

É interessante também observar que cada um destes dois homens recebera um filho que tipificava a semente que lhes fora prometida. O filho de Abraão, Isaque, tipificava Cristo em Sua tarefa redentiva, sendo oferecido no Monte Moriá como um sacrifício vivo. O filho de Davi, Salomão, tipificava Cristo em Sua realeza, sendo um rei de glória e esplendor. Estes dois filhos tipificaram de modo marcante a semente de Abraão e de Davi, a qual foi aguardada com enorme expectativa durante todo o período restante do Antigo Testamento. À luz disto, não é de se maravilhar que o Espírito de Deus principie o Novo Testamento introduzindo Seu principal personagem como"filho de Davi,filho de Abraão"(Mat. 1:1).

Dois animais típicos

O Antigo Testamento também apresenta as tarefas redentiva e real de Cristo através de dois animais simbólicos. O cordeiro sacrificial tipificava Cristo em sua obra redentiva como o "cordeiro de Deus que tira o pecado do mundo" (João 1:29). Apresentava-O como o servo do Senhor que foi levado "como cordeiro... ao matadouro" (Is. 53:7).

O outro animal que tipifica Cristo no Antigo Testamento é o leão (Gên. 49:9-10). João, em Apocalipse 5:5, se refere a esta metáfora do Antigo Testamento quando descreve a Cristo como o "Leão da tribo de Judá". Como rei dos animais, o leão representa a autoridade real. O que se destaca aqui é que da tribo de Judá sairia um Governante que iria governar Israel e o mundo.

A relação entre os dois programas

Embora estas duas funções de Cristo estejam inextricavelmente ligadas por toda a Bíblia, são distintas em seus propósitos. Basicamente o propósito real diz respeito a Deus, tendo a ver com a reivindicação que faz do que havia sido perdido de Seu reino. Por seu lado, o propósito redentivo tem a ver basicamente com o homem, proporcionando-lhe a base para sua salvação. Embora o propósito real seja mais amplo, abrangendo todo o aspecto espiritual, não poderia ser alcançado sem o programa redentivo para o homem. Observe como João relaciona os dois em sua visão profética de Apocalipse 5. Depois de ter a visão de Cristo como o Leão e o Cordeiro, ele ouve a multidão angelical proclamar em alta voz: "Digno é o Cordeiro, que foi morto, de receber o poder, e riqueza, e sabedoria, e força, e honra, e glória, e louvor" (Apoc. 5:12). Ele terá mostrado não apenas o direito, mas também o mérito que tem de governar como o Leão de Deus, pois foi morto como o Cordeiro de Deus. Antes de começar a destruir com ira o reino das trevas, teve de passar pelo fogo do julgamento para poder salvar pecadores, entregando Sua vida como um cordeiro. Estes dois papéis estão entrelaçados, mas caminham para duas direções diferentes e demonstram duas qualidades da natureza de Deus. Quanto a este reino reivindicado, Cristo finalmente o apresentará de novo ao Pai (1 Cor. 15:24). Essa apresentação constituirá o cumprimento da dupla comissão que recebeu do Pai, em Seu papel como a semente da mulher. E, de suprema importância, há o fato de que o processo pelo qual terá reivindicado aquele reino será o Seu amor redentivo, e não o Seu poder coercivo. Esta graça redentiva é a força de Seu duplo programa, e também constituirá a base de Sua comunhão eterna com os homens. Aquela comunhão divino-humana não será baseada no temor ou na força, mas no amor.

Perguntas Para Estudo

1 . Descreva em suas próprias palavras o duplo problema de Deus.

2. Examine os comentários de Ellisen sobre os programas Redentivo e Real. Ele está querendo dizer que os dois programas são distintos? Você pode demonstrar uma unidade completa e abrangente no propósito de Deus de lidar com a criação?

Stanley A. Ellisen é professor de Literatura Bíblica e responsável pela Divisão de

Estudos Bíblicos no Seminário Batista Conservador do Oeste, localizado em Portland, Oregon, E.U.A. Autor de cinco livros e inúmeros artigos, Ellisen também atuou como pastor em diversas igrejas na costa oeste dos Estados Unidos. Republicado, com permissão de Biography of a Great Planet ("Biografia de um Grande Planeta"), capítulo 2, Tyndale House Publishers, Inc., Wheaton, Illinois.$conteudo$, 5);

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (v_curso, $t$Lição 1 · Leitura — Gallagher e Hawthorne: Bênção como transformação$t$, $conteudo$Bênção como transformação

Sarita D. Gallagher e Steven C. Hawthorne

Sarita D. Gallagher é professora adjunta em Estudos Globais na Universidade Azusa Pacific. Ela atuou tanto na Austrália quanto em Papua-Nova Guiné, ensinando Teologia e Estudos Interculturais em universidades locais e Insti tutos Bíblicos. Seu foco está no significado missiológico da bênção abraâmica nas Escrituras.

Steven C. Hawthorne é Diretor de WayMakers, um ministério de mobilização de missão e oração. Depois de coeditar o curso e o livro Perspecti vas, em 1981, lançou o "Projeto Josué", uma série de expedições de pesquisa entre os povos não alcançados na Ásia e no Oriente Médio. Ele também é coautor de Prayerwalking: Praying on Site with Insight (Caminhada de Oração: Orando no local com entendimento) com Graham Kendrick.

A promessa de Deus a Abraão foi efetivamente uma promessa para o mundo. Em Gênesis 12:1-2, Deus declarou que não somente abençoaria Abrão (seu nome naquele tempo), mas que Abrão se tornaria uma bênção. O versículo seguinte revela a incrível magnitude dessa bênção: "Por meio de você todos os povos da terra serão abençoados". Como é possível que um homem se tornasse uma bênção para todos os povos em toda a terra?

Mesmo que Abrão tenha obedecido a Deus, é improvável que ele tenha entendido as implicações globais imediatamente. A promessa completa, como Abraão ouviu repetida nos anos vindouros, tinha três partes: terra, povo e bênção. As duas primeiras partes sobre a terra e família provavelmente fizeram algum sentido imediatamente. Mas o que provavelmente permaneceu um mistério foi a promessa de que, de alguma forma através de sua família, a bênção viria sobre todas as nações da terra.

Embora os anos passassem sem receber a terra ou os filhos prometidos, Abraão deve ter ponderado exatamente como seria o cumprimento da promessa de Deus. Faríamos bem em ponderar também. A promessa de que "todos os povos serão abençoados" ainda está sendo cumprida em nossos dias. O que significa uma nação ou povo ser abençoado? O que deveríamos estar procurando como mordomos da bênção prometida de Abraão pela fé em Cristo?

O que significa "bênção"?

Se a nossa única fonte fosse o livro do Gênesis, aprenderíamos muito sobre a ideia de bênção. Em Gênesis, a palavra "bênção" é usada de duas maneiras distintas. Primeiro, vemos o termo bênção usado para descrever um pronunciamento ou concessão de bênção. É um ato no qual um destino futuro ou bondade é pronunciado, e assim concedido à pessoa ou entidade que está sendo abençoada. Em segundo lugar, o termo bênção é usado para descrever o cumprimento do que foi prometido, seja material ou não. A palavra bênção, portanto, se refere tanto à concessão de bênção quanto aos benefícios que a bênção produz.

BÊNÇÃO COMO CONCESSÃO

Deus pronunciou bênção já no quinto dia da criação. Depois que Ele criou a primeira vida animal, Ele declarou as criaturas do mar e pássaros do ar como "boas". Imediatamente Ele as abençoou, capacitando-as a cumprir o mandato que ele lhes deu, "sejam férteis e multipliquem-se e encham" seus respectivos domínios. Ao abençoá-las, Deus as tinha feito mais do que meramente boas. Sua bênção dotou-as de uma fecundidade e uma plenitude que certamente se desdobrariam. No sexto dia da criação, Deus criou animais e seres humanos. Mais uma vez, tudo o que Deus criou naquele dia foi declarado "bom". Ele então abençoou a humanidade, dotando o homem do mandato e capacitação para "ser fecundo e multiplicar e encher a terra". Por todo o restante da Escritura, a ideia de bênção permanece ligada à ideia de vida florescendo em direção a uma plenitude planejada. Quando a bênção é cumprida nas criaturas, pessoas, lares ou nações, elas são capacitadas para avançar em direção ao seu destino pretendido. Essa mudança pode ser lenta ou rápida. Bênção nunca é vista como mágica, mas sim uma dinâmica da vida de Deus. Bênção é a bondade de Deus feita melhor.

Mais adiante no registro de Gênesis, vemos mais ocasiões em que palavras de bênção são pronunciadas. A luta de Jacó com Esaú para obter o pronunciamento de bênção de seu pai é o exemplo mais proeminente (Gn 27). Sua luta com um anjo (ou com Deus?) para obter um pronunciamento de bênção é digno de nota: "Não te deixarei ir, a não ser que me abençoes" (32:26-29). Em todos os casos, essa concessão verbal de bênção era entendida como muito mais do que palavras, mas como uma transferência irrevogável da habilidade especial e abundância de Deus.

BÊNÇÃO COMO CUMPRIMENTO

Em Gênesis, também vemos referências claras a como a promessa de bênção foi cumprida de forma tangível. Próximo ao fim da vida de Abraão, lemos que Deus "em tudo o abençoara" (24:1). Quais foram exatamente essas diversas maneiras com as quais Abraão tinha sido abençoado?

Podemos encontrar três grandes categorias de bênçãos na história de Gênesis. Em primeiro lugar, vemos a bênção como riqueza material e fecundidade. Segundo, vemos a bênção como um relacionamento favorecido com Deus e a experiência de Sua presença. E terceiro, vemos bênção produzindo uma medida de paz entre famílias e povos.

1. Riqueza material e Fecundidade

O servo de Abraão enumera as maneiras que Deus abençoou a Abraão: "O SENHOR o abençoou muito, e ele se tornou muito rico. Deu-lhe ovelhas e bois, prata e ouro, servos e servas, camelos e jumentos" (24:35). Note a expressão: "O SENHOR abençoou.. para que.." Estava óbvio para este servo que a riqueza material era o resultado da bênção de Deus. Deus também abençoou Isaque materialmente. "Depois da morte de Abraão, Deus abençoou seu filho Isaque" (25:11). O relato descreve o perfeito ato de bênção: transformando esterilidade em fecundidade. "Isaque orou ao SENHOR em favor de sua mulher, porque era estéril. O SENHOR respondeu à sua oração, e Rebeca, sua mulher, engravidou" (25:21). A bênção de Isaque abundou em riqueza material: "Isaque formou lavoura naquela terra e no mesmo ano colheu a cem por um, porque o SENHOR o abençoou. O homem enriqueceu, e a sua riqueza continuou a aumentar, até que ficou riquíssimo. Possuía tantos rebanhos e servos" (26:12-14). Deus deu a Isaque um suprimento de água abundante, que para ele significava que "prosperaremos na terra". Os filisteus observavam que o suprimento de água era uma prova de que Isaque era "abençoado pelo Senhor" (26:15-22).

O mesmo tipo de abundância material foi descrito como bênção na vida do neto de Abraão, Jacó. Depois de ter trabalhado na casa de Labão, Labão disse a Jacó que seu sucesso financeiro e material estava diretamente ligado a Jacó: "O Senhor me abençoou por sua causa" (30:27). Jacó concordou, dizendo a Labão que Deus o "abençoou depois que vim para cá" (30:30).

É importante notar que em muitas partes do mundo, a bênção é comumente considerada como uma força mágica ou um poder místico pelo qual alguém pode obter os benefícios desejados. Nessa mentalidade, a bênção não é muito mais do que sorte ou destino, que às vezes pode ser manipulada com procedimentos ou por pessoas a quem são atribuídos poderes especiais. Defensores da famosa "teologia da prosperidade" podem ter mais em comum com esta cosmovisão que reduz a bênção a um método de obter riqueza de Deus.

2. Mais do que riqueza material: Presença de Deus

A bênção era mais do que fecundidade abundante e riquezas. As nações vizinhas reconheciam alguns aspectos intangíveis da bênção. O mais notável era a presença de Deus com Abraão. Seus vizinhos lhe disseram: "Deus está contigo em tudo o que fazes" (21:22). Com as pessoas da cidade de Sodoma observando, uma pessoa de não menos importância que Melquisedeque celebrou publicamente o favor de Abrão com Deus, "Bendito seja Abrão pelo Deus Altissimo... que entregou seus inimigos em suas mãos" (14:19-20). Da mesma forma, os vizinhos de Isaque disseram: "Vimos claramente que o SENHOR está contigo" (26:22).

3. Mais do que Aliança com Deus: Paz entre os Povos

Reconhecendo a presença extraordinária de Deus com Abraão, seus vizinhos filisteus aproximaram-se dele, a fim de elaborar um acordo de paz (21:22-23). Isso trouxe a paz a uma disputa sobre o uso da água e o resultado que "morou Abraão na terra dos filisteus por longo tempo", desfrutando de uma prolongada boa vontade (21:24- 34). Anos mais tarde, na época de Isaque, o relacionamento com os filisteus tornou-se tenso novamente. Os filisteus tentaram expulsar a família de Isaque de seu território (26:12-17). Deus ajudou Isaque a descobrir fontes de água repetidas vezes. Finalmente, houve tal abundância de água para todos que os filisteus se aproximaram de Isaque para "fazer um acordo" de paz com ele. Os filisteus finalmente declararam a Isaque: "Agora sabemos que o SENHOR te tem abençoado" (26:18-29).

FIM DA LEITURA DA 1ª PARTE

BÊNÇÃO ALÉM DA FAMÍLIA DE ABRAÃO

Vimos o que significou para Abraão e sua família serem abençoados. Mas vemos também as nações abençoadas nas histórias da família de Abraão em Gênesis?

Menos que abençoado

Abraão e sua casa peregrinaram duas vezes para viver em nações estrangeiras, e duas vezes ele mentiu sobre sua esposa (em Gênesis 12 e novamente no capítulo 20). Cada vez, Sarai (seu nome na época) foi levada para ser a esposa do rei, o que trouxe juízo para a nação anfitriã. No segundo caso, quando o rei percebeu que a ira de Deus estava prestes a cair sobre todo o seu povo, ele confrontou Abraão dizendo: "O que fizeste conosco? Em que foi que pequei contra ti para que trouxesses tamanha culpa sobre mim e sobre o meu reino? O que me fizeste não se faz a ninguém!" (20:9). Embora Abraão tivesse orado pela casa do rei para que Deus restaurasse a capacidade de ter filhos, é diticil considerar todo o evento como um ato de bênção para outra nação.

Derramamento sobre vizinhos e nações

Apesar destes e de outros acontecimentos, Deus trouxe ajuda a outras nações através de Abraão e seus descendentes. Por exemplo, Abraão veio ao resgate das cidades de Sodoma e Gomorra (Gn 14), que haviam sido levadas cativas por tropas invasoras que haviam tomado "todos os bens de Sodoma e de Gomorra e todo o seu mantimento" (14:11). Não muito tempo depois disso, Abraão orou para que Deus poupasse toda a cidade de Sodoma (sem dúvida, incluindo alguns que ele já havia resgatado do cativeiro). Ele apresentou seu caso diante de Deus, não apenas em favor de Ló e sua família, mas de "toda a planície" (19:28). Embora a cidade tenha sido destruída, o ponto é que Abraão iniciou uma intercessão para salvar a cidade inteira.

A água mencionada anteriormente para os filisteus por fornecida através da escavação do poço por Isaque (26:12-22) e a bênção sobre os negócios de Labão através de Jacó (30:27) são exemplos adicionais de bênção sobre as nações e famílias vizinhas.

É significativo que perto do fim de Gênesis, vemos o neto de Abraão, Jacó, pronunciando uma bênção sobre o próprio Faraó. As palavras exatas não estão registradas, mas houve uma ocasião formal em que "Jacó abençoou o faraó" (47:7, 10).

O auge de Gênesis é a história de José. Como Abraão e Isaque antes dele, a incrível produtividade da obra de José fez com que estrangeiros concluíssem que a presença de Deus com José trouxera uma abundância surpreendente. "o SENHOR estava com ele e que o fazia prosperar em tudo o que realizava" (Gênesis 39: 3). Seu mestre reconheceu que "a bênção do SENHOR estava sobre tudo o que Potifar possuía, tanto em casa como no campo" (39:5) por causa de José.

Abençoando o Egito e o Povo de Toda a Terra

Deus deu a José uma interpretação de um sonho que previu uma fome de sete anos. Faraó reconheceu a sabedoria de José como tendo vindo de Deus e declarou: "Entrego a você agora o comando de toda a terra do Egito", e ainda: "sem a sua palavra ninguém poderá levantar a mão nem o pé em todo o Egito" (41:41, 44). Quando a fome chegou, sua devastação "se havia espalhado por toda a terra" (41:56). José estava em posição de estender bênção a muitas nações, pois "toda a terra vinha gente ao Egito para comprar trigo de José" (41:57).

No segundo ano da fome de sete anos, José distribuiu comida em troca de dinheiro e gado (47:14-17). Quando o último ano da fome veio, ele tinha organizado tudo para a sobrevivência do povo do Egito. Em troca da propriedade da terra e de um imposto de 20 por cento (um acordo muito generoso em comparação com a maioria dos sistemas feudais), ele ofereceu grãos para serem usados como semente para plantar como uma forma de reiniciar os ciclos agrícolas após a fome (47:18-24). Quando a fome terminou com a esperança de sobrevivência em longo prazo, a declaração do povo está dizendo: "tu nos salvaste a vida!" (47:25).

Mais tarde será maior: Cumprimento nos Descendentes

Abraão compreendeu a bênção às nações que Deus estava prometendo, especialmente a sua futura magnitude? Em cada uma das cinco vezes em que Deus prometeu bênção às nações, observe como Deus amplificou e esclareceu como Sua promessa seria cumprida.

Três Vezes a Abraão

No chamado e promessa iniciais, Deus disse a Abrão que ele se tornaria "uma grande nação". A promessa foi formulada como se em uma só pessoa "todos os povos da terra serão abençoados" (12:3).

No segundo anúncio, a promessa parece quase idêntica. Numa grande pessoa, "todas as nações da terra serão abençoadas" (18:18). Mas o versículo seguinte acrescenta que Deus faria "o que foi dito" a Abraão, referindo-se à promessa, em conexão com "a justiça" vivida por "seus filhos e sua casa depois dele". Desse ponto em diante, a promessa enfatizaria o que aconteceria nos descendentes de Abraão.

No drama do terceiro anúncio em Gênesis 22, encontramos uma mudança significativa. Abraão obedeceu a Deus oferecendo seu filho Isaque. Deus providenciou um sacriticio substituto e imediatamente repetiu a promessa, mas com uma diferença significativa. A promessa de bênção já não é para ser cumprida durante a vida de Abraão, mas sim, nos dias de seus filhos ainda por vir. "... por meio dela, todos os povos da terra serão abençoados" (22:18). A palavra singular "descendência" é um termo genérico que descreve as gerações dos futuros descendentes de Abraão. Deus prometeu isso com a surpreendente seriedade de juramento solene: "Juro por mim mesmo..." (22:16). O propósito do juramento era assegurar às gerações futuras que Deus não deixaria de cumprir Sua promessa de abençoar todas as nações, e que Ele faria esta coisa incrível através deles.

Novamente a Isaque e a Jacó

Deus deu a promessa uma quarta vez, desta vez diretamente a Isaque. Mais uma vez Ele disse que "por meio da sua descendência todos os povos da terra serão abençoados" (26:4). A palavra "descendência" é ampliada, entendida como descendentes tão numerosos como as estrelas no céu (15:5, 22:17). Na quinta declaração, Deus prometeu a Jacó que seus descendentes seriam numerosos e "se espalhariam para o Oeste e para o Leste, para o Norte e para o Sul" (28:14). Na ocasião, Jacó pode ter pensado que a expansão geográfica não era nada mais do que povoar a terra da promessa. Mas é possível que a vigorosa expansão geográfica esteja relacionada com o futuro cumprimento global da promessa.

A PROMESSA CUMPRIDA EM CRISTO

A maioria dos cristãos foi bem ensinada sobre Jesus Cristo vindo para prover um caminho para que as pessoas sejam adotadas como filhos e filhas na família de Deus. No livro de Gálatas, Paulo diz que "quando chegou a plenitude do tempo, Deus enviou seu Filho... para que recebêssemos" a adoção como filhos de Deus (Gl 4:4-5). Mas alguns versículos anteriores no mesmo livro, Paulo diz que aqueles que creem em Cristo foram unidos com Cristo de tal maneira que se tornaram parte da família de Abraão. "Se vocês são de Cristo, são descendência de Abraão e herdeiros segundo a promessa" (Gl 3:29).

A forma como a promessa foi dada a Abraão, a bênção seria cumprida na "descendência" de Abraão. Esta palavra é frequentemente usada como um "singular coletivo", falando de muitas descendências. Assim, o termo pode se referir a um descendente ou a uma multidão de descendentes. Qual é?

Paulo responde da seguinte maneira: Ambas são verdadeiras. Há um filho preeminente de Abraão: "As promessas foram ditas a Abraão e à sua descendência. Ele não diz: ‘E às descendências', como se referindo a muitas, mas sim a uma, ‘E à sua descendência', isto é, Cristo" (Gl 3:29). Cristo é a única descendência de Abraão, mas Paulo também declara que, uma vez que as pessoas se tornam filhos e filhas da família de Abraão pela fé, a promessa está sendo cumprida pela fé deles como os que herdam a promessa:

"Estejam certos, portanto, de que os que são da fé, estes é que são filhos de Abraão. Prevendo a Escritura que Deus justi ficaria os genti os pela fé, anunciou primeiro as boas novas a Abraão: ‘Por meio de você todas as nações serão abençoadas'. Assim, os que são da fé são abençoados junto com Abraão, homem de fé" (Gl 3:7-9).

Cristo acabou com a maldição e abriu a família de Deus. Agora, as pessoas de todas as famílias da terra podem fazer parte da família de Abraão pela fé em Cristo. Eles herdam toda a herança familiar de serem abençoados para ser uma bênção para as nações.

FIM DA LEITURA DA 2ª PARTE

A PROMESSA DE DEUS SE TORNA NOSSO MANDATO

A promessa de Deus de abençoar as nações através dos descendentes de Abraão carrega a força de mandato para todos que se uniram com Cristo pela fé. A promessa revela muito claramente o propósito de Deus, que os cristãos considerem corretamente transmitir o mandato de Deus de servir como seus agentes de bênção entre todos os povos da terra. Somos abençoados em Cristo para trazer a bênção de Cristo entre todas as nações. Mas o que estamos esperando? O que significa para as nações serem abençoadas? E como vamos realizar isso? A promessa de abençoar molda e integra nossa missão de duas maneiras importantes.

Bênção Relacional: Pertencendo à Família de Deus

A maior bênção imaginável é o privilégio de pertencer ao povo de Deus e, portanto, pertencer a Deus como Seus filhos. Cristo abriu a família de Abraão a todos. Agora estamos vendo pessoas de todos os povos, tribos e clãs sendo unidas com Cristo pela fé e recebido no povo de Deus. Estender o convite para pertencer à família de Deus é a melhor parte do que significa levar a bênção às nações. Não podemos considerar que a bênção abraâmica tenha visitado um povo se o evangelho de Jesus Cristo ainda não foi claramente transmitido a ele.

Como será quando este aspecto da bênção de Deus for cumprido? Podemos aguardar com expectativa o dia em que veremos pelo menos alguns de cada povo na terra confiando e seguindo a Cristo. Abençoar as nações significa muito mais do que o evangelismo, mas certamente não pode significar nada menos que a evangelização de todos os povos.

Vimos no livro do Gênesis que Deus mostrou evidência de Sua presença dinâmica com Seu povo. Deus não será menos presente entre os povos da terra à medida que grupos de obedientes seguidores de Cristo surgirem e crescerem entre as nações. Como no livro de Gênesis, a presença de Deus com Seu povo em nossos dias é o início de todos os aspectos mais tangíveis da bênção que Deus criou. Isto significa que a evangelização tem uma prioridade especial. A promessa de Deus de abençoar as nações é a estrutura na qual a comissão de Cristo faz sentido. Esta mesma promessa autoriza os seguidores de Cristo a esperar e a trabalhar para que a vida de Deus abunde em todos os povos.

Bênção Material e Social: Abundância e Paz

Podemos esperar que a bênção de pertencer a Deus se torne uma realidade em meio a todos os povos. Mas podemos esperar muito mais! Podemos esperar ver demonstrações significativas da abundância da vida de Deus. Não devemos esperar uma perfeição utópica. Mas podemos trabalhar e orar com uma forte esperança, parcialmente informada pelo que vemos no livro de Gênesis, que Deus estará com Seu povo para produzir medidas significativas de bênção entre as nações.

E então perguntamos de novo, como será o cumprimento da promessa de Deus de abençoar as nações? Naturalmente, será diferente em todos os lugares e povos, mas devemos esperar que Deus produza todo tipo de bênção, como economias que florescem com justiça e retidão, agricultura e indústria que em abundância para todos e paz para as comunidades e entre povos e raças. Podemos esperar que Deus capacite Seu povo declare guerra contra doenças, rompa os ciclos viciosos da pobreza, forneça água em terras desérticas e estar presente com cura em meio a catástrofes.

Devemos esperar que alguns dos filhos de Abraão pela fé sejam usados por Deus para preservar a vida segundo o exemplo de José. Provavelmente vemos agora em muitas cidades uma resposta à oração de Abraão pela cidade de Sodoma em Gênesis 18. Nessa oração, Deus disse que uma cidade inteira seria poupada das consequências imediatas de seu pecado por causa da retidão de alguns. Nos dias de Abraão havia menos de dez. Agora há milhões de sua família de fé espalhada por muitas das cidades da terra.

BÊNÇÃO COMO TRANSFORMAÇÃO

Recentemente, o termo "transformação" ajudou muitos a expressar a esperança de que a missão cristã pode ser direcionada para além do evangelismo bem-sucedido para buscar também mudanças duradouras na sociedade que refletem a justiça e o caráter de Cristo. O fundamento bíblico para a integração de evangelismo com ação social é geralmente encontrado em vários textos bíblicos que tratam da esperança e realidade do reino de Deus. Pode ser que estejamos negligenciando um conjunto de verdades bíblicas que apoia um holismo robusto e estratégico. A antiga promessa de bênção de Deus fornece uma estrutura vívida, rica e poderosa para integrar a busca da transformação social e a conclusão da evangelização mundial. Aqui estão seis razões pelas quais a promessa abraâmica de bênção fornece uma estrutura para que possamos orar, planejar e trabalhar em conjunto para a evangelização de todos os povos da terra com esperança de que haverá transformação significativa.

1. Deus trabalha com e através de Seu povo

O povo de Deus trabalha com intencionalidade, estratégia e esperança, usando toda a graça, habilidades e recursos que Deus lhes confiou. Mas, ao mesmo tempo, Deus infunde o trabalho de Seu povo com Seu poder e vida. Bênção é uma função do trabalho das pessoas e da presença de Deus. Bênção é sempre mais do que a soma de todos os esforços humanos.

2. Aumento e Plenitude, mas Nunca Perfeição ou Utopia

Uma cidade ou povo abençoado não é uma sociedade perfeita. Em vez disso, a esperança da bênção nos dá coragem para orar e trabalhar em prol de sociedades que florescem em todos os sentidos – espiritual, relacional, tisica, econômica, estética e ambientalmente.

3. Não é exclusivo do povo de Deus

Enquanto o povo de Deus é distintamente abençoado, Deus pretende que a bênção se estenda além do Seu povo. O bem-estar de cidades e nações inteiras pode ser perseguido não importando como o evangelho pode ter sido recebido ou rejeitado.

4. Crescimento em vez de Redistribuição

Generosidade é certamente uma virtude de qualquer pessoa que deseja ser bênção no sentido bíblico. Mas ser uma bênção significa algo diferente de simplesmente compartilhar riqueza com igualdade em vista. A ideia básica de bênção é que a vida de Deus se multiplica e chega à abundância ou plenitude pela ação de Deus.

5. Bênção Mesmo dos Pobres e Impotentes

Ao longo de Gênesis, Deus produziu grandes bênçãos através de pessoas fracas, comparativamente pobres ou impotentes. Ser uma bênção nas mãos de Deus nunca é o privilégio exclusivo daqueles que são ricos ou bem posicionados considerados assim por padrões globais.

6. A Bênção é Variável, de Formação Lenta e de Longa Duração

As mudanças que podem ser atribuídas à bênção de Deus muitas vezes acontecem ao longo de um período de anos ou mesmo gerações. A fruição da bênção aparece de maneiras comparáveis, mas nunca idênticas em cada povo ou lugar.

COOPERADORES DE DEUS PARA LEVAR A BÊNÇÃO

Encontramos no relato de Gênesis um esboço profético incrivelmente claro do amplo escopo do propósito de Deus para Seu povo. Uma vez que a promessa de Deus a Abraão encarna Seu propósito e nossa missão, então estamos certos em esperar que nossa missão conduza à mudança e transformação social e material. Mas a principal lição a ser aprendida não é que a missão de Deus inclua interesses por questões sociais e tisicas. As maiores lições que podemos encontrar são aquelas que nos mostram como cooperar com Deus para gerar Sua bênção. Ser bênção de Deus entre todos os povos exigirá nosso maior esforço de alguma forma junto com o exercício do poder milagroso e vivificante de Deus. À medida que Deus continua o cumprimento de Sua promessa em nossos dias, podemos aprender lições importantes sobre como podemos cooperar com Deus a partir da vida da família de Abraão. Talvez a pessoa em Gênesis que exemplifica o mistério de Deus em ação com Seu povo para gerar bênção é o bisneto de Abraão, José.

1. Cooperando com Deus

José trabalhou com Deus e Deus trabalhou através de José. Quando a casa de Potifar foi abençoada, o crescimento milagroso foi dito ser "a bênção do Senhor". Mas a abundância se multiplicou de maneiras extraordinárias por causa da diligência e sabedoria dos esforços de José. Vemos Deus atuando de maneira sobrenatural, dando a José habilidades para interpretar sonhos. Mas foi a habilidade e sabedoria de José, dada por Deus, que elaborou um plano de longo alcance para ajudar o povo do Egito a sobreviver à fome e restaurar a abundância econômica e agrícola.

2. Trabalhar Fielmente Independentemente da Posição

Quando José trabalhava como escravo, ele trabalhava diligentemente para que a bênção abundasse em todos os assuntos de seu mestre. Mesmo estando na prisão do Faraó como prisioneiro, ele se mostrou confiável e foi encarregado de administrar a prisão porque o Senhor "lhe concedia bom êxito em tudo o que realizava" (Gn 39:23). Ele foi promovido ao mais alto pináculo de poder em um extenso império. Nessa posição, ele foi usado para salvar muitas vidas e restaurar a economia agrícola fértil do Egito.

3. Servindo como Um Enviado por Deus

José gradualmente veio a entender que ele tinha sido enviado por Deus. Ele poderia ter vivido uma história de vitimização como alguém que foi brutalizado por sua família, injustamente tratado como escravo e acusado e esquecido na prisão. Mas em vez disso, reconheceu que Deus estava apontando para algo muito além de seu próprio bem-estar. Deus estava usando circunstâncias destinadas ao mal e transformando-as para o bem (50:20). José disse a seus irmãos: "foi para salvar vidas que Deus me enviou adiante de vocês" (45:5). José é a primeira pessoa na história das Escrituras que se diz ter sido expressamente enviada por Deus para realizar qualquer tipo de missão.

4. Cumprir o Propósito de Deus

Como José declarou, o propósito que Deus o enviou para realizar era simplesmente "salvar vidas". José salvou as vidas de sua própria família, mas a exclamação de gratidão do povo egípcio conta a maior história de vidas salvas em todo o Egito e Canaã: "tu nos salvaste a vida!" (47:25).

Sem clareza sobre o propósito maior de Deus desdobrando-se ao longo de muitos anos, é duvidoso que José teria reconhecido que Deus o havia enviado. José poderia ter determinado que seus restos fossem sepultados em grande estilo egípcio. Em vez disso, ele insistiu que seus restos fossem levados de volta à terra que Deus tinha prometido a Abraão (Gn 50:25, Hb 11:22). José percebeu que estava perseguindo um propósito que seria cumprido além da duração de sua própria vida.

Você foi Esperado por Muito Tempo

Sabemos que Abraão olhou para o céu, contando as estrelas, acreditando que sua família seria numerada em bilhões. Mas, de acordo com Jesus, Abraão viu mais do que o céu à noite. Ele viu o dia. O dia de Cristo. Um dia em que bilhões de seus filhos seriam abençoados e seriam uma bênção entre todos os povos da terra. Não é de admirar que ele se emocionasse de alegria. Jesus disse: "Abraão, pai de vocês, regozijou-se porque veria o meu dia; ele o viu e alegrou-se" (Jo 8:56).

Notas de rodapé

1. Alguns observadores interpretaram a ação de José como um ato astuto de opressão, negando às pessoas empobrecidas a propriedade da terra. O relato enfatiza que muitas vidas foram salvas. Quando vista à luz da maioria das fomes que aniquilou milhões de pessoas no mundo antigo com a probabilidade de muitos regimes terem permitido que grande parte da população morresse de fome lentamente, é possível ver o trabalho de José como uma obra de salvação. Mas por haver uma restauração da abundância agrícola, ela deve ser considerada um ato de bênção.

2. Em Gênesis 12:2, a expressão hebraica "ser uma bênção" está no modo imperativo. Tomado por si mesmo, este verbo poderia ser considerado um claro mandamento para Abrão, de alguma forma, se tornar uma bênção. Mas mesmo que a própria palavra esteja no modo imperativo, a gramática da expressão inteira enquadra essa frase como uma maneira vigorosa de expressar o propósito dos três verbos hebraicos coortativos imediatamente antes dela (tornar Abrão uma grande nação, abençoá-lo, e tornar seu nome famoso).$conteudo$, 6);

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (v_curso, $t$Lição 1 · Leitura — Stott, cap. 1: A Bíblia na evangelização do mundo$t$, $conteudo$A Bíblia na evangelização do mundo

John R. W. Stott

1em a Bíblia, a evangelização do mundo seria não apenas imSpossível, mas também inconcebível. A Bíblia impõe-nos a responsabilidade de evangelizar o mundo, dá-nos um evangelho a proclamar, diz-nos como fazê-lo e declara-se o poder de Deus para a salvação de cada crente.

Além disso, é fato notável, na história passada e contemporânea, que o grau de compromisso da Igreja com a evangelização do mundo é proporcional ao grau de sua convicção da autoridade da Bíblia. Sempre que o cristão perde a confiança na Bíblia, seu zelo pela evangelização acaba se esvaindo. Inversamente, se ele estiver convencido acerca da Bíblia, estará também determinado a evangelizar.

Destaco a seguir quatro razões por que a Bíblia é indispensável à evangelização do mundo.

O mandato da evangelização mundial

Em primeiro lugar, a Bíblia nos dá o mandato da evangelização do mundo. Sem dúvida, precisamos de uma incumbência. Dois fenômenos estão ocorrendo em toda parte: o fanatismo religioso e o pluralismo religioso. O fanatismo caracteriza-se por um zelo irracional que, se pudesse, usaria a força para obrigar a crença e erradicar a incredulidade. O pluralismo religioso incentiva a tendência oposta.

Sempre que o espírito do fanatismo religioso ou de seu oposto, o indiferentismo, prevalece, a evangelização do mundo é profundamente prejudicada. Os fanáticos recusam-se a tolerar o rival representado pelo evangelismo, e os pluralistas rejeitam suas reivindicações exclusivas. O evangelista cristão é considerado um intruso, alguém que sem motivo se intromete nos negócios alheios.

Diante dessa oposição, precisamos esclarecer que o mandato bíblico não se limita à Grande Comissão (por mais importante que seja esta), mas abrange toda a revelação bíblica. Vou recordála rapidamente.

Existe um único Deus vivo e verdadeiro, o Criador do Universo, o Senhor das nações e o Deus de toda carne. Há cerca de 4 mil anos, Deus chamou Abraão e fez uma aliança com ele, prometendo não apenas abençoá-lo, mas também abençoar, por meio da posteridade do patriarca, todas as famílias da terra (Gn 12. l-4). Esse texto bíblico é uma das pedras fundamentais da missão cristã, pois os descendentes de Abraão (por meio de quem todas as nações estão sendo abençoadas) são Cristo e o povo de Cristo. Se pela fé pertencemos a Cristo, somos filhos espirituais de Abraão e temos uma responsabilidade para com a raça humana. Assim, também os profetas do Antigo Testamento profetizaram que Deus faria desse Cristo o herdeiro e a luz das nações (Sl 2.8; Is 42.6; 49.6).

Quando Jesus veio, ele endossou essas promessas. É verdade que durante seu ministério terreno ele ficou restrito “às ovelhas perdidas da casa de Israel” (Mt 10.6; 15.24), contudo, ele profetizou que “muitos virão do Oriente e do Ocidente e tomarão lugares à mesa com Abraão, Isaque e Jacó no reino dos céus” (Mt 8.11; Lc 13.29). Mais ainda, prevendo sua ressurreição e ascensão, ele deu este fantástico testemunho acerca de si mesmo: “Toda a autoridade me foi dada no céu e na terra” (Mt 28.18). Foi em consequência de sua autoridade universal que ele ordenou aos seus seguidores que fizessem discípulos de todas as nações, batizando-os na nova comunidade e ensinando a todos sua doutrina (Mt 28.19).

Isso os cristãos primitivos começaram a fazer quando o Espírito Santo da verdade e do poder desceu sobre eles. Eles se tornaram testemunhas de Jesus até os confins da terra (At 1.8), e o faziam “por amor do seu nome” (Rm 1.5; 3Jo 7). Eles sabiam que Deus havia superexaltado a Jesus, entronizando-o à sua direita e concedendo-lhe a mais alta posição, a fim de que toda língua confessasse seu senhorio. Eles queriam que Jesus recebesse a honra devida ao seu nome. Além disso, um dia ele retornará em glória, para salvar, julgar e reinar. Portanto, o que deveria preencher o espaço entre as duas vindas? A missão mundial da Igreja! O fim da História só viria depois que o evangelho alcançasse os confins da terra (comp. Mt 24.14 com 28.20; At 1.8). Os dois fins iriam coincidir.

Nosso mandato para a evangelização do mundo, portanto, é a Bíblia inteira. Deve ser encontrado na criação de Deus, porque todos os seres humanos são responsáveis diante dele; no caráter de Deus, transcendente, amoroso, compassivo, não desejando que ninguém pereça, mas que todos venham ao arrependimento; nas promessas de Deus, que todas as nações sejam benditas por meio da semente de Abraão e venham a ser a herança do Messias; no Cristo de Deus, agora exaltado com autoridade universal, para receber aclamação universal; no Espírito de Deus, que convence do pecado, dá testemunho de Cristo e impele a Igreja a evangelizar; na Igreja de Deus, que é uma comunidade missionária multinacional, com ordens de evangelizar até que Cristo volte.

A dimensão global da missão cristã é irresistível. O cristão individual e as igrejas locais que não se comprometem com a evangelização do mundo estão contradizendo, por cegueira ou por desobediência, uma parte essencial de sua identidade, a qual provém de Deus. O mandato bíblico para a evangelização do mundo não pode ser ignorado.

A mensagem da evangelização mundial

Em segundo lugar, a Bíblia nos disponibiliza a mensagem para a evangelização do mundo. O Pacto de Lausanne define o evangelismo em termos de evangelho. O parágrafo 4 declara: “Evangelizar é difundir as boas novas de que Jesus Cristo morreu por nossos pecados e ressuscitou segundo as Escrituras, e de que, como Senhor e Rei, ele agora oferece o perdão dos pecados e o dom libertador do Espírito a todos os que se arrependem e creem”.

Nossa mensagem vem da Bíblia, mas quando a buscamos nas Escrituras, imediatamente deparamos com um dilema. De um lado, a mensagem nos é outorgada. Não temos permissão de inventá-la. Ela nos foi confiada como um “depósito” precioso, que nós, como servos fiéis, devemos guardar e distribuir na Casa de Deus (1Tm 6.20; 2Tm 1.12-14; 2Co 4.1,2). Por outro lado, não nos foi dada como uma fórmula matemática simples e exata, e sim numa rica diversidade de formulações nas quais foram usadas imagens ou metáforas diferentes.

Portanto, existe apenas um evangelho, no que todos os apóstolos concordam (1Co 15.1), e Paulo podia invocar a maldição de Deus sobre qualquer um, inclusive ele próprio, que pregasse um evangelho “diferente” do evangelho apostólico original da graça de Deus (Gl 1.6-8). No entanto, os apóstolos expressaram esse evangelho único de diversos modos: sacrifical (o derramamento e a aspersão do sangue de Cristo); messiânico (o surgimento do governo prometido por Deus); legal (o juiz pronunciando a justificação do injusto); pessoal (o Pai reconciliando seus filhos desviados); salvífico (o Libertador celestial que veio para resgatar os desamparados); cósmico (o Senhor universal reivindicando domínio universal) — e esses são apenas alguns exemplos.

O evangelho é assim visto como único e, ao mesmo tempo, como diversificado. Ele é “dado” e, ao mesmo tempo, é culturalmente adaptado à sua audiência. Uma vez que percebamos isso, seremos poupados de cometer dois erros opostos. Ao primeiro chamarei “fluidez total”. Certa vez, ouvi um líder de igreja inglês declarar que não existe coisa tal como o evangelho até que estejamos na situação de dar nosso testemunho. Não levamos nada conosco nessa situação, ele disse. Descobrimos o evangelho apenas quando chegamos lá. Concordo plenamente com a necessidade de ser sensível em cada situação, mas, se esse era o ponto que o líder em questão desejava defender, ele o exagerou grosseiramente. Existe uma coisa tal como o evangelho revelado, ou dado, que não temos liberdade para falsificar.

Ao erro oposto chamarei “rigidez total”. Nesse caso, o evangelista se comporta como se Deus tivesse outorgado algumas fórmulas precisas, que temos de repetir mais ou menos palavra por palavra, e certas imagens, que devemos empregar invariavelmente. Isso nos torna escravos de palavras ou de imagens, ou de ambas. Alguns evangelistas fracassam por usar uma linguagem antiquada, enquanto outros se sentem obrigados a mencionar a toda hora “o sangue de Cristo”, “a justificação pela fé”, “o Reino de Deus” ou qualquer outra imagem.

Entre esses dois extremos, há um terceiro e melhor caminho. Ele combina o compromisso com o fato da revelação e com a tarefa da contextualização. Aceita como permanentemente normativas apenas as formulações bíblicas do evangelho e entende que cada tentativa de proclamar o evangelho na linguagem moderna deve justificar-se como expressão autêntica do evangelho bíblico.

Contudo, se ele se recusa a se desfazer das formulações bíblicas, também recusará recitálas de maneira inexpressiva e sem imaginação. Em vez disso, temos de nos ocupar da luta contínua, por meio da oração, do estudo e da discussão, para relacionar o evangelho recebido com determinada situação. Uma vez que ele vem de Deus, devemos preservá-lo; uma vez que se destina aos homens e mulheres dos tempos modernos, temos de interpretá-lo. Temos de combinar fidelidade (pelo estudo constante do texto bíblico) com sensibilidade (pela observação constante do cenário contemporâneo). Só então teremos condições de relacionar, com fidelidade e relevância, a Palavra com o mundo, o evangelho com o contexto, as Escrituras com a cultura.

O modelo para a evangelização mundial

Em terceiro lugar, a Bíblia nos fornece o modelo para a evangelização do mundo. Além da mensagem (o que temos de dizer), precisamos de um modelo (como dizer). A Bíblia supre isto também. Ela não apenas contém o evangelho: ela é o evangelho. Por meio da Bíblia o próprio Deus está evangelizando, isto é, comunicando as boas novas ao mundo. Você deve estar lembrado da declaração de Paulo acerca de Gênesis 12.3, segundo a qual “a Escritura [...] preanunciou o evangelho a Abraão” (Gl 3.8). Toda a Escritura prega o evangelho. Deus evangeliza por meio dela.

Se, portanto, as Escrituras são a evangelização divina, é evidente que podemos aprender a pregar o evangelho, considerando como Deus o fez. Ele nos proporcionou, no processo da inspiração bíblica, um belo modelo evangelístico.

O que de imediato nos surpreende é a grandeza da condescendência de Deus. Ele tem uma verdade sublime para revelar acerca de si mesmo e de seu Cristo, sua misericórdia, sua justiça e sua total salvação. Ele escolheu fazer essa revelação pelo emprego do vocabulário e da gramática da língua humana, de seres humanos, de imagens humanas e de culturas humanas.

Contudo, por meio desse humilde recurso de palavras e imagens humanas, Deus falava as palavras dele. A doutrina evangélica da inspiração das Escrituras enfatiza sua dupla autoria. Homens falaram, e Deus falou. Homens falaram de Deus (2Pe 1.21), e Deus falou por intermédio de homens (Hb 1.1). As palavras faladas e escritas eram de Deus e também deles. Ele decidiu o que queria dizer, mas não sufocou a personalidade humana. Eles usaram suas faculdades livremente, mas não distorceram a mensagem divina. Os cristãos desejam declarar algo semelhante sobre a encarnação, o clímax da autocomunicação de Deus: “O Verbo se fez carne” ( Jo 1.14). Isto é, a Palavra eterna de Deus, que desde a eternidade estava com Deus e era Deus, o Agente através do qual o Universo foi criado, tornou-se um ser humano, com todas as características de um judeu palestino do primeiro século. Ele se tornou pequeno, fraco, pobre e vulnerável. Ele experimentou a dor e a fome e se expôs à tentação. Tudo isso fazia parte da “carne”, isto é, do ser humano que ele se tornou. Tornando-se um de nós, porém, não deixou de ser ele mesmo. Cristo continuou sendo o Verbo eterno, isto é, o Filho eterno de Deus.

Essencialmente, o mesmo princípio é ilustrado pela inspiração das Escrituras e pela encarnação do Filho. O Verbo se fez carne. O divino foi comunicado pelo humano. Deus se identificou conosco, embora não renunciasse à sua identidade, e esse princípio de “identificação sem perda de identidade” é o modelo para toda a evangelização, especialmente a evangelização transcultural.

Alguns de nós se recusam a identificar-se com o povo que alegam servir. Continuamos sendo nós mesmos e não nos tornamos iguais a eles. Permanecemos afastados. Agarramo-nos desesperadamente à nossa herança cultural, com base na concepção errônea de que é parte indispensável de nossa identidade. Não queremos perdê-la e não apenas mantemos nossas práticas culturais com tenacidade feroz, como também tratamos a herança cultural da terra de nossa adoção sem o respeito que merece. Assim, praticamos um duplo tipo de imperialismo cultural, impondo nossa cultura a outros e desprezando a deles. Não foi esse, porém, o procedimento de Cristo, que se esvaziou de sua glória e se humilhou para poder servir.

Outros mensageiros transculturais do evangelho cometem o erro oposto. Tão determinados estão em identificar-se com o povo que vão servir que até abrem mão de seus padrões e valores cristãos, mas esse também não foi o procedimento de Cristo, uma vez que, ao se tornar humano, ele permaneceu verdadeiramente divino. O Pacto de Lausanne, no parágrafo 10, expressa esse princípio nestas palavras: “Os evangelistas de Cristo têm de, humildemente, procurar esvaziar-se de tudo, exceto de sua autenticidade pessoal, a fim de se tornarem servos dos outros, e as igrejas têm de procurar transformar e enriquecer a cultura; tudo para a glória de Deus”.

Temos de lidar com os motivos que levam as pessoas a rejeitar o evangelho e, em particular, dar o devido valor aos fatores culturais. Alguns rejeitam o evangelho não porque o consideram falso, mas porque o acham estranho à sua cultura.

O dr. Renné Padilla foi criticado em Lau sanne, no Congresso sobre a Evangelização Mundial, de 1974, por afirmar que o evangelho que alguns missionários europeus e norte-americanos exportaram foi um “cristianismo cultural”, uma mensagem cristã distorcida pela cultura materialista e consumista do Ocidente. Foi doloroso ouvi-lo dizer isso, mas obviamente ele estava totalmente certo.

Todos nós precisamos sujeitar nosso evangelho a um escrutínio mais crítico, e, numa situação transcultural, os evangelistas visitantes precisam, com humildade, buscar ajuda dos cristãos locais para discernir as distorções culturais de sua mensagem.

Outros rejeitam o evangelho porque percebem que é uma ameaça à sua cultura. É claro que Cristo desafia cada cultura. Sempre que apresentamos o evangelho aos hindus, budistas, judeus, muçulmanos, secularistas ou marxistas, Jesus Cristo os desafia com a exigência de abandonarem tudo a que se dedicaram até o momento e de os substituírem por ele mesmo. Jesus é o Senhor de cada pessoa e de cada cultura. Essa ameaça, essa confrontação não pode ser evitada. Mas não estará o evangelho que proclamamos apresentando às pessoas outras ameaças desnecessárias, ao exigir o abandono de costumes inofensivos ou porque parece destruir a arte, a arquitetura, a música e as festas nacionais, ou porque nós, que o apresentamos, somos orgulhosos de nossa cultura e cegos para a cultura dos outros?

Resumindo, quando Deus nos falou nas Escrituras ele usou linguagem humana e quando nos falou em Cristo assumiu carne humana. A fim de revelar-se, ele se esvaziou e se humilhou. Esse é o modelo de evangelismo que a Bíblia apresenta. Existe autoesvaziamento e auto-humilhação em todo evangelismo autêntico. Sem eles, contradizemos o evangelho e deturpamos o Cristo que proclamamos.

O poder para a evangelização mundial

Em quarto lugar, a Bíblia nos concede o poder para a evangelização do mundo. É quase desnecessário enfatizar nossa necessidade de poder, pois sabemos quanto nossos recursos humanos são fracos em comparação com a magnitude da tarefa. Também sabemos quão blindadas são as defesas do coração humano. Pior ainda, conhecemos a realidade, a maldade e o poder do Diabo e dos demônios sob seu comando.

As pessoas intelectualizadas podem ridicularizar nossas crenças, e até caricaturizá-las, a fim de tornar mais plausível o ridículo da própria condição delas. No entanto, os cristãos evangélicos são simples o bastante para crer no que Jesus e seus apóstolos ensinaram. Para nós, é fato inegável que, na expressão de João, “o mundo inteiro jaz no Maligno” (1Jo 5.19). Até que sejam libertados por Jesus Cristo e transportados para seu Reino, todos os seres humanos são escravos de Satanás. Além disso, percebemos o poder maligno no mundo contemporâneo — nas trevas da idolatria e no medo dos espíritos; na superstição e no fatalismo; na devoção aos deuses que não são deuses; no materialismo egoísta do Ocidente; na propagação do comunismo ateu; na proliferação de sistemas religiosos irracionais; na violência e na agressão; na deterioração generalizada dos padrões absolutos de bondade e verdade. Tudo isso é resultado da obra daquele que nas Escrituras é chamado “mentiroso”, “enganador”, “caluniador” e “homicida”.

Portanto, a conversão e a regeneração cristãs continuam sendo milagres da graça de Deus. Representam o auge de uma luta poderosa entre Cristo e Satanás ou, na marcante figura de linguagem apocalíptica, entre o Cordeiro e o Dragão. O assalto ao palácio do homem forte só é possível porque ele foi amarrado por Alguém que é ainda mais forte e que por sua morte e ressurreição desarmou os principados e potestades do mal e deles se desfez (Mt 12.27-29; Lc 11.20-22; Cl 2.15).

Como então participaremos da vitória de Cristo e derrotaremos o poder do Diabo? Deixemos que Lutero responda à nossa pergunta: Ein wörtlein will ihn fällen. “Vencido cairá por uma só palavra.” Há poder na Palavra de Deus e na pregação do evangelho. Talvez a expressão mais dramática dessa realidade no Novo Testamento esteja em 2Coríntios 4. Paulo faz menção do “deus deste século”, que “cegou o entendimento dos incrédulos, para que lhes não resplandeça a luz do evangelho da glória de Cristo” (v. 4).

Se a mente humana está cega, como poderá enxergar? Somente por meio da Palavra criadora de Deus. Pois foi Deus quem disse que “de trevas resplandecerá luz” que brilhou em nosso coração “para iluminação do conhecimento da glória de Deus, na face de Cristo” (v. 6). Assim, o apóstolo compara o coração não regenerado ao negro caos inicial e atribui a regeneração ao divino fiat: “Haja luz”.

Se Satanás cega as mentes das pessoas e Deus ilumina o coração delas, em que poderemos contribuir para esse encontro? Não seria mais humilde de nossa parte nos retirarmos do campo de batalha e deixar que lutem? Não, essa não é a conclusão a que Paulo chega.

Pelo contrário, entre os versículos 4 e 6, que descrevem as atividades de Deus e Satanás, o versículo 5 diz qual é a obra do evangelista: “Pregamos [...] a Cristo Jesus como Senhor”. Considerando que a luz que o Diabo deseja evitar que as pessoas vejam e que Deus faz brilhar nelas é o evangelho, o melhor a fazer é pregar. Pregar o evangelho, longe de ser desnecessário, é indispensável. É o meio estabelecido por Deus para que o príncipe das trevas seja derrotado e a luz jorre no coração do ser humano. Há poder no evangelho de Deus — poder de Deus para a salvação (Rm 1.16).

Podemos ser muito fracos. Às vezes, desejo que fôssemos ainda mais fracos. Diante das forças do mal, somos tentados a exibir certa força cristã e a nos envolver em pequenas escaramuças verbais em nome do evangelho. Entretanto, é em nossa fraqueza que a força de Cristo se faz perfeita, e são as palavras marcadas pela fraqueza humana que o Espírito reveste com poder. Portanto, é quando somos fracos que somos fortes (1Co 2.1-5; 2Co 12.9-10).

Vamos proclamar a Palavra no mundo!

Não vamos consumir todas as nossas energias discutindo sobre a Palavra de Deus. Em vez disso, vamos começar a usá-la. Ela comprovará sua origem divina por meio do poder divino. Vamos proclamá-la no mundo! Quem dera todos os missionários cristãos e evangelistas proclamassem o evangelho bíblico com fidelidade e sensibilidade e cada pregador cristão fosse um expositor fiel da Palavra de Deus! Então Deus demonstraria seu poder salvador.

Sem a Bíblia, a evangelização do mundo é impossível, pois sem ela não temos nenhum evangelho para levar às nações, nenhuma garantia para oferecer, nenhuma ideia de como fazer a tarefa e nenhuma esperança de sucesso. É a Bíblia que nos dá o mandato, a mensagem, o modelo e o poder de que precisamos para a evangelização do mundo. Portanto, vamos nos apoderar dela outra vez, por intermédio do estudo e da meditação diligentes. Vamos dar atenção aos seus mandamentos, captar sua mensagem, seguir sua orientação e confiar em seu poder. Vamos levantar nossa voz e tornar a Palavra conhecida.

Perguntas para estudo

1.Qual a crença básica deste artigo? Explique a diferença que ela poderá fazer na vida do can-

didato em potencial ao trabalho missionário.

2.Um missionário, depois de enfrentar muitas críticas quanto ao seu trabalho, começou a pro-

curar uma explicação para ter dado esse passo: “Por que estou fazendo este trabalho?”. Com

base no conteúdo deste artigo, o que você diria a ele?

[cite] JOHN R. W. STOTT é pastor emérito da All Souls Church, em Londres. Foi presidente do London Institute for Contemporary Christianity e capelão honorário da rainha da Inglaterra. Foi orador em cinco das Conferências Missionárias Estudantis realizadas em Urbana, nos Estados Unidos, e durante 25 anos (1952-1977) empreendeu viagens missionárias a cinco continentes. É autor de muitos livros, entre eles Cristianismo básico (publicado por Edições Vida Nova), e Christian Mission in the Modern World [Missões cristãs no mundo moderno]. Capítulo adaptado de uma mensagem apresentada numa sessão plenária da Consulta sobre Evangelização Mundial, realizada em junho de 1980, em Pattaya, na Tailândia. Usado com permissão. A Bíblia na evangelização do mundo$conteudo$, 7);

end
$curso$;
