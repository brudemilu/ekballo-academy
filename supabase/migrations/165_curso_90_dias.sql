-- Curso: 90 Dias em Gálatas, Juízes e Efésios (Vários autores) — slug 90-dias-galatas-juizes-efesios. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = '90-dias-galatas-juizes-efesios';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('90-dias-galatas-juizes-efesios','90 Dias em Gálatas, Juízes e Efésios','Estudo a partir de 90 Dias em Gálatas, Juízes e Efésios, de Vários autores. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/90-dias-galatas-juizes-efesios', false, 0, 'espiritual', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 1.1-5$t$, 1,
$conteudo$P

aulo era um missionário plantador de igrejas. Depois de plantar uma igreja e deixar a região, ele continuava ajudando novas congregações por meio de suas cartas. Uma delas é essa epístola às igrejas cristãs de parte da Turquia moderna e que foi escrita por Paulo apenas quinze a vinte anos depois da morte de Cristo. Paulo e seu papel

Leia Gálatas 1.1,2.

Como Paulo se descreve (v. 1)?

O que você pode aprender no versículo 1 a respeito do que significa ser apóstolo?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Para quem Paulo está escrevendo (v. 2)? Paulo e sua mensagem$t$, 2,
$conteudo$Leia Gálatas 1.3-5.

Nos versículos de 1 a 5, Paulo nos oferece um esboço do evangelho, e tudo se resume a Jesus.

O que Paulo, o “apóstolo” (no sentido de “mensageiro”) de Deus, nos diz a respeito de Jesus nos versículos abaixo?

• Versículo 1. • Versículo 3. • Versículo 4.

Essa carta inteira é sobre o evangelho. Tendo em vista que Paulo está escrevendo para cristãos professos em igrejas, por que isso seria uma surpresa?

O fato mais óbvio a respeito do cenário histórico dessa carta é frequentemente o mais negligenciado! Na Carta aos Gálatas, Paulo explica em detalhes o que o evangelho é e como ele funciona. O público de sua descrição geral do evangelho são pessoas que já se autodenominam cristãs.

Os cristãos precisam do evangelho tanto quanto os não cristãos! Nossos problemas na vida cristã surgem porque muitas vezes perdemos o evangelho ou nos esquecemos dele. E somente avançamos em nossa fé à medida que compreendemos e aplicamos o evangelho de maneiras mais profundas.

É muito comum presumir em círculos cristãos que “o evangelho” é algo apenas para não cristãos.

Quando foi a última vez que você refletiu profundamente a respeito da mensagem do evangelho, simplesmente por seu próprio bem?

Existem partes de sua vida nas quais você ainda não refletiu a respeito de como o evangelho deve moldar suas atitudes ou ações?

Imagine que uma criança lhe perguntasse o que é o evangelho cristão.

Como você resumiria o evangelho para ela?

Agradeça a Deus seu evangelho e peça a ele que o ajude a nunca pensar que deveria ir além do evangelho, passando para doutrinas mais “avançadas”.

Peça a Deus que lhe mostre onde sua vida precisa ser mudada pela mensagem do evangelho.

GÁLATAS 1.6-9

P

aulo recebeu notícias a respeito da igreja da Galácia que o tocaram profundamente. Suas emoções se manifestam quase imediatamente. Ontem vimos o evangelho de Paulo a respeito de Jesus. Como você explicaria agora a mensagem do evangelho a um amigo? Um tipo diferente de saudação

Leia 1Coríntios 1.3,4; Efésios 1.3; Filipenses 1.3,4; Colossenses 1.4. Em seguida, leia Gálatas 1.6.

Na maioria de suas cartas, após sua saudação Paulo prossegue com um parágrafo de gratidão e ação de graças pela vida das pessoas.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 1.10-12$t$, 3,
$conteudo$P

arece que as pessoas que haviam chegado aos cristãos gálatas com um “evangelho” (v. 7) que desafiou o evangelho de Paulo estavam fazendo algumas declarações a respeito da integridade ou da confiabilidade de Paulo. Nesses versículos, ele começa a se defender. Leia Gálatas 1.10-12. A fonte do evangelho

A que tipo de desafio Paulo parece estar respondendo no versículo 11?

Por que essa declaração seria nociva ao argumento de Paulo de que o seu evangelho é o verdadeiro?

Como Paulo recebeu o seu evangelho (v. 12)?

Que grande encorajamento confiar nossa vida e o nosso futuro a essa mensagem! A conversão de Paulo

Leia Atos 9.1-9.

Saulo (também conhecido por Paulo) estava indo a Damasco para prender o povo de Cristo, mas acabou entrando em Damasco como prisioneiro de Cristo!

A conversão de Paulo é um grande lembrete de que ninguém está fora do alcance de Jesus. Se o Senhor pode transformar esse perseguidor em pregador, pode também trazer qualquer pessoa à fé.

Existem pessoas que você conhece e acha mesmo que jamais se tornariam cristãs?

Por que não orar por elas agora? E por que não continuar orando por elas diariamente? A resposta de Paulo

Talvez “algumas pessoas” (Gl 1.7) estivessem afirmando que Paulo havia recebido sua mensagem do “quartel-general” de Jerusalém e estivessem dizendo: “Também recebemos treinamento em Jerusalém e dizemos que Paulo não lhes apresentou toda a história. Há mais elementos na mensagem desse evangelho do que Paulo tem dito”.

No entanto, antes mesmo de ir ao quartel-general em Jerusalém, Paulo já havia pregado por três anos o seu evangelho divinamente recebido (veja os versículos de 15 a 20)! Transformação pelo evangelho

Quais resultados de uma vida transformada pelo evangelho você vê em Gálatas 1.10?

Paulo poderia procurar aprovação de quem (v. 10)?

Se temos convicção da aprovação de Deus, não precisamos temer qualquer desaprovação das pessoas, e, como veremos à medida que trabalharmos a Carta aos Gálatas, o evangelho nos diz que o favor pleno e a aprovação completa de Deus já são nossos por intermédio de Cristo.

Para muitos de nós, o versículo 10 surgirá como um desafio. Temos a tendência de pensar que podemos fazer as duas coisas, isto é, viver de forma cristã e também desfrutar de popularidade. Paulo é bastante claro que haverá muitas ocasiões em que precisaremos escolher um ou outro.

Em quais áreas de sua vida você mais facilmente se vê desejando agradar mais às pessoas do que a Cristo?

O que precisa ser mudado para servir a Cristo nessas áreas?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 1.13-24$t$, 4,
$conteudo$G

álatas 1.10—2.21 é frequentemente chamado de seção autobiográfica da carta, uma vez que Paulo fala a respeito de sua conversão e do início de sua vida cristã. Paulo, porém, não está apenas compartilhando seu testemunho para que sirva de inspiração a todos; ele está usando seu testemunho para defender a confiabilidade de sua mensagem do evangelho. Leia Gálatas 1.13-24. Antes, durante e depois

À medida que Paulo fala sobre como chegou à fé, ele ilustra alguns aspectos do que é o evangelho.

Quando se trata do evangelho:

• quem nos torna capazes de compreendê-lo (v. 15,16)? • do que ele trata (v. 16)? • para quem ele é (v. 16)? Como Paulo vê a graça de Deus trabalhando em sua vida até mesmo antes de sua conversão?

Como esses versículos mostram Paulo sendo preparado para seu ministério em sua conversão e após ela?

Olhando em retrospectiva, você pode ver as maneiras pelas quais Deus trabalhou em sua vida:

• antes mesmo de você ter nascido? • antes de sua conversão? • desde que se tornou cristão?

Fale com Deus agora, agradecendo-o a obra visível e invisível em sua vida. O que os cristãos pensavam

Nos versículos 11 e 12, Paulo diz que seu evangelho não foi inventado, nem foi dado a ele por homens. Sua grande declaração é que sua mensagem chegou a ele diretamente do próprio Jesus.

Como Paulo está destacando esse ponto:

• nos versículos 18 e 19? • nos versículos 21 e 22?

Releia os versículos 23 e 24. Que resultados você enxerga aqui de uma vida transformada pelo evangelho?

Como as igrejas reagiram às notícias a respeito da conversão e do ministério de Paulo?

Os apóstolos e as igrejas não conheceram Paulo antes de ele começar a pregar o evangelho que Deus lhe havia revelado. Eles não o ensinaram a ele e também não buscaram mudá-lo. Paulo ansiava provar que sua mensagem foi dada por Deus (diferentemente do “evangelho” que outros mestres estão pregando na Galácia); e que as igrejas apostólicas, centradas no evangelho, reconheciam esse fato e louvavam a Deus por isso.

Observe que, ao falar a respeito de sua conversão e de sua mensagem, Paulo se certificou de não apontar para si mesmo, mas, sim, para Deus, o qual merece todo o louvor (v. 24).

Que orientação existe aqui a respeito de:

• por que compartilhar nosso testemunho?

• como fazê-lo?

Como você poderia direcionar pessoas para a verdade do evangelho compartilhando o seu testemunho com elas?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 2.1-5$t$, 5,
$conteudo$D

eve ter sido um encontro e tanto. Paulo, que pregava a mensagem de seu evangelho pelo mundo há quatorze anos, estava indo a Jerusalém para ver os homens que haviam vivido ao lado de Jesus durante seu tempo na terra. Será que eles se entenderiam? Será que suas mensagens provariam ser a mesma? Leia Gálatas 2.1-5. Por que Paulo foi a Jerusalém?

No versículo 1, vemos Paulo em Jerusalém. Quem ele levou consigo?

Quem desejava ver (v. 2)?

Paulo, porém, não precisou de autorização humana para pregar o evangelho (1.12)!

Por que, então, ele queria expor “o evangelho que eu prego” diante desses homens (2.2)?

O que havia acontecido que motivou a visita de Paulo (v. 4)?

Essa “liberdade [...] em Cristo Jesus” é a libertação de ter de obedecer a Deus para nos fazer plenamente aceitáveis a ele, a nós mesmos e aos outros. É a liberdade de dizer que somos mais perversos do que jamais ousamos acreditar, porém mais amados e aceitos em Cristo do que jamais ousamos esperar.

Esses “falsos irmãos”, no entanto, haviam ensinado o oposto do que Paulo havia ensinado. Ensinaram que os gentios precisavam ser circuncidados, bem como confiar em Cristo, para serem completamente aceitos por Deus.

Esse deve ter sido um momento de tensão para Paulo. Os líderes de Jerusalém pregavam o mesmo evangelho de liberdade que ele?

A circuncisão era crucial nesse debate. Ela era parte do que é frequentemente chamado de “leis cerimoniais” no Antigo Testamento — prescrições detalhadas a respeito de alimentação, vestimenta e assim por diante que faziam alguém ser ritualmente “puro”.

Assim, todos os gentios sempre estiveram “impuros” e, portanto, em uma condição imprópria para a presença de Deus — a menos que eles fossem circuncidados e adotassem todo o “código mosaico” para a vida cotidiana. O que Paulo encontrou

Qual era a nacionalidade de Tito (v. 3)?

Em outras palavras, ele não era judeu!

Sabendo disso, por que o fato de os líderes cristãos de Jerusalém não exigirem que ele recebesse a marca judaica da circuncisão foi muito significativo?

Imagine que Tito tivesse de ter sido circuncidado. Como “a verdade do evangelho” (v. 5) que Paulo estava pregando teria se perdido?

Por que aquilo que Deus fez naquele dia tem importância para nós hoje?

De quais maneiras o evangelho nos proporciona liberdade que religiões baseadas na conquista da salvação não proporcionam?

Peça a Deus que o proteja de qualquer pessoa ou coisa que possa comprometer “a liberdade que temos em Cristo”.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 2.6-10$t$, 6,
$conteudo$P

ode parecer óbvio para nós hoje o fato de Tito ter sido aceito como cristão sem ser circuncidado (2.3), mas, para a igreja primitiva, isso foi bastante significativo. Foi confirmado que o evangelho diz respeito à fé em Cristo, e não às nossas obras. A questão agora era: De que modo Paulo se entenderia com os líderes de Jerusalém? Eles seriam capazes de trabalhar lado a lado? Leia Gálatas 2.6-10. Unidade manifesta

Ao conhecer esses líderes da igreja, do que Paulo se lembrou (v. 6)?

O que eles perceberam a respeito de Paulo e seu trabalho (v. 6-8)?

Nos versículos de 7 a 10, vemos outro grande momento para a igreja: existe unidade entre os proclamadores do evangelho.

Como essa unidade é manifesta aqui?

O que vemos aqui não é uma unidade que ocorre a qualquer preço, mas, sim, a que ocorre em torno da verdade do evangelho.

A unidade é algo precioso, mas não deve acontecer às custas da verdade. Paulo estava disposto a ser separado daqueles que pregavam o evangelho da escravidão às obras, e não o evangelho da liberdade que vem pela fé em Jesus (v. 5).

Você pode pensar em exemplos em que a igreja ignorou a verdade para permanecer unida?

E quanto a situaçõesem que a igreja concordou a respeito da verdade, mas se permitiu ser dividida em relação a outras questões? Planos feitos

Eles concordaram que Paulo deveria continuar com sua missão aos gentios, enquanto a igreja de Jerusalém se concentrava em ir aos judeus com a mensagem do evangelho de Deus (v. 9).

O que os líderes de Jerusalém pediram a Paulo (v. 10)?

As igrejas judaicas eram muito mais pobres do que as igrejas que Paulo estava plantando em áreas gentílicas mais ricas.

Por que, em sua opinião, era particularmente importante que essas igrejas gentílicas tivessem de se lembrar dos pobres?

Um sinal da verdadeira unidade cristã é o apoio tangível e prático entre as igrejas.

O seu caráter tende a ser de divisão quando isso é desnecessário, ou de exaltar a unidade quando isso é impossível?

Certifique-se de que você considera a verdade do evangelho mais importante do que a unidade ou a divisão.

Quais são as duas prioridades desses líderes cristãos nos versículos 9 e 10? A sua vida pessoal reflete a importância disso?

Agradeça a Deus que ele salva pessoas muito diferentes e lhes dá diferentes tarefas e chamados.

Peça a Deus que mantenha seu povo unido em torno da verdade do evangelho.

GÁLATAS 2.11-16

P

aulo e Pedro nem sempre tinham a mesma opinião. Lemos aqui a respeito de um sério desentendimento. Isso, porém, motivou Paulo a resumir o seu evangelho como “justificação pela fé” e a nos lembrar que toda a vida deve ser pensada e vivida pelos cristãos em consonância com essa verdade maravilhosa. A questão da comida

Leia Gálatas 2.11-14.

O que fez com que Paulo se opusesse a Pedro (v. 11)?

A verdade do evangelho não respeita reputações!

Pedro, anteriormente, estava comendo com gentios (v. 12), mostrando que ele os considerava iguais, membros do povo de Deus por meio da fé, sem nenhuma necessidade de que guardassem as leis judaicas referentes à alimentação.

Leia Atos 11.1-18. Em primeiro lugar, por que Pedro havia começado a “comer com gentios”?

O que fez com que ele parasse de comer com gentios (Gl 2.12)?

O que você acha que Paulo quis dizer quando falou que Pedro não estava “agindo conforme [...] o evangelho” (v. 14)?

Por que Pedro estava sendo particularmente hipócrita em suas atitudes em relação aos cristãos gentios (v. 14)?

QUAL FOI O EFEITO DAS AÇÕES DE PEDRO (V. 13)? A RESPOSTA DO EVANGELHO

Leia Gálatas 2.15,16.

Observe que Paulo não diz simplesmente que aquilo que Pedro está fazendo é errado; ele se concentra em verificar se as ações de Pedro estão “conforme a verdade do evangelho” (v. 14).

Como Paulo diz que alguém é “justificado” (v. 16)? O que Paulo descarta como maneira de ser justificado?

Pedro e Paulo eram ambos judeus circuncidados que haviam passado a vida buscando obedecer à lei de Deus.

Por que é importante que eles ainda precisassem ser “justificados pela fé em Cristo” (v. 16)?

A palavra “justificação” é um termo jurídico. O oposto de “justificado” é “condenado”. Em Cristo, embora sejamos pecadores, não estamos sob condenação. Deus nos aceita, apesar de nosso pecado.

Desse modo, a justificação se refere ao favor imerecido de Deus em tornar um pecador justo perante ele. Ele não apenas nos perdoa de nossa culpa, mas também nos trata como justos, como participantes de seu povo puro e irrepreensível.

E qualquer pessoa pode ter acesso a tudo isso simplesmente por meio da fé em Cristo!

Por que a justificação pela fé é um tema tão empolgante?

Quais são as “leis” mais fáceis de pensarmos que irão nos justificar perante Deus, de modo que paremos de confiar somente no Senhor Jesus?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 2.17-21$t$, 7,
$conteudo$Q

ue diferença faz saber que você é justificado pela fé? Nessa passagem, Paulo lida com a objeção de que ser justificado pela fé tem, na verdade, um efeito negativo e, então, nos mostra a maravilhosa mudança que é produzida ao sermos aceitos por Deus. A objeção

Leia Gálatas 2.17,18.

O versículo 17 é um versículo difícil...

O que, mais cedo ou mais tarde, se tornará claro a respeito do povo que é “justificado em Cristo” (v. 17)?

Assim, será que acreditar que sou justificado por Cristo (e não por guardar a lei) não me motiva a quebrar a lei, a pecar?!

Qual é a resposta direta de Paulo?

O versículo 18 apresenta outra declaração complicada! Pode significar que, se alguém permanece no mesmo estilo de vida após receber Cristo, isso prova que ele está usando o evangelho como uma escusa para continuar a desobedecer a Deus e fazer o que quer. É fácil perceber por que alguém que olhava para a lei em busca de justificação pode se preocupar: para eles, a justificação sem a lei removeria qualquer motivação de viver para Deus por meio da observância da lei. A resposta de Paulo

Leia Gálatas 2.19,20.

Paulo diz que agora está morto para o quê (v. 19)?

O que ele é capaz de fazer agora (v. 19)?

Em que momento o velho Paulo (aquele que estava obedecendo à lei para tentar obter justificação) morreu (v. 20)?

Paulo está dizendo que nunca realmente viveu para Deus quando ten tava se salvar por meio da obediência à lei. Ele estava sendo muito moral e bom, mas tudo era feito para o próprio Paulo, e não para Deus. Agora que está justificado e é aceito por Deus, Paulo tem um novo motivo para a obediência que é muito mais sadio e poderoso. Ele quer simplesmente viver para aquele “que me amou e se entregou por mim” (v. 20).

A resposta de Paulo, então, é a seguinte: tentar ser justificado pelas obras jamais poderia dar ao cristão um motivo novo e mais forte para obedecer a Deus que a justificação por Deus em Jesus dá. Um modo de vida

Leia Gálatas 2.21.

Paulo foi salvo inicialmente pela graça de Deus em Cristo.

O que ele sabe que nunca deve fazer enquanto busca seguir como um cristão?

Se ele agora pudesse merecer a justificação, o que isso significaria a respeito da cruz? Por quê?

Cristo fará tudo ou não fará nada por você. Você não pode combinar seu merecimento com a graça de Deus.

Então, o que isso significa para você? A morte de Jesus significa tudo para você ou não significa nada?

Retorne a Gálatas 2.11-21. Qual versículo é o mais especial para você? Tome algum tempo para memorizá-lo agora.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 3.1-9$t$, 8,
$conteudo$S

e os dois primeiros capítulos de Gálatas dizem respeito à defesa pessoal de Paulo — que usa sua história pessoal para provar que a mensagem que prega é uma revelação direta de Deus —, nos capítulos 3 e 4 temos a defesa teológica que Paulo faz do evangelho. Ele esboça o conteúdo essencial da mensagem do evangelho e o defende com uma variedade de argumentos. O evangelho e a Galácia

Leia Gálatas 3.1-5.

Paulo começa lembrando aos gálatas como eles saíram do paganismo e vieram a Cristo.

O que foi apresentado a eles (v. 1)?

Como eles reagiram (v. 2 — pense em que resposta Paulo espera de sua pergunta!)?

Quem eles receberam em consequência de sua reação (v. 2)?

Foi assim que os gálatas começaram como cristãos. Agora, no entanto, eles haviam começado a pensar de modo insensato, acreditando que precisavam fazer algo mais para continuar sendo cristãos.

Em que eles começaram a confiar a fim de “alcançarem seu objetivo” (v. 3)?

Paulo está alertando os cristãos gálatas de que é fácil retroceder para a justiça pelas obras à medida que tentamos vencer o pecado e viver a vida cristã. Não obstante, precisamos lidar com o pecado não por meio da confiança no “esforço humano”, mas, sim, por meio da “[crença] naquilo que vocês ouviram” — o evangelho.

O ponto de partida de cada dia de nossa vida como cristãos é dizer a nós mesmos aquilo que Martinho Lutero (o grande reformador do século 16) dizia a cada manhã: “Você é aceito”. Não importa o que fazemos ou não fazemos. Por meio de Jesus, ainda somos aceitos.

A vida cristã começa somente por meio da fé no Cristo crucificado; e continua somente por meio da fé no Cristo crucificado — algo que a igreja dos gálatas havia esquecido! O evangelho e Abraão

Leia Gálatas 3.6-9.

O que Abraão “fez” (v. 6)?

O que Deus deu a Abraão mediante o que fizera (v. 6)?

Leia Gênesis 15.1-19 para ver o pano de fundo de Gálatas 3.6.

Isso nos fornece um maior discernimento a respeito do que é “crer” ou do que é “fé”. É confiar que Deus fará o que disse que fará, sabendo que é capaz de fazer o que não podemos fazer.

De que modo a fé salvadora de Abraão é um modelo para nós (Gl 3.9)?

Você está pedindo ao Espírito de Deus que o sustente e faça crescer como cristão ou está confiando em seus próprios esforços?

Você vive e pensa e ora como se sua fé o salvasse ou como se suas obras o salvassem?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 3.10-14$t$, 9,
$conteudo$“S

ou uma boa pessoa.” “Vou à igreja e vivo como a Bíblia diz que devo viver.” “Deus está contente com a minha maneira de viver, então estou bem com ele.”

Seja de modo consciente, seja de modo inconsciente, é muito fácil pensar dessa maneira. Paulo, porém, identifica o grande problema em encontrarmos nossa segurança naquilo que fazemos. O problema

Leia Gálatas 3.10-12.

O que Paulo diz a respeito da pessoa que busca conquistar a aceitação de Deus (v. 10)?

O que confiar na lei tem que ver com a fé (v. 12)?

O destaque crucial no versículo 12 é “fazer”. Cumprir a lei de maneira perfeita levaria à aceitação de alguém por parte de Deus com base naquilo que essa pessoa faz.

Por que, então, esse método de buscar ser justificado está fadado ao fracasso (veja o final do v. 10)? A solução

Uma vez que o início do versículo 10 é verdadeiro, como Deus pode considerar qualquer um de nós justo sem que ele seja injusto?

Se desobedeci à lei de Deus, estou sob sua maldição, enfrentando a vida — agora e eternamente — sem sua presença amorosa. Deus não simplesmente retirará sua maldição; e nada que eu possa fazer a eliminará.

Leia Gálatas 3.13,14.

Como Deus removeu sua maldição de nós (v. 13)?

Por que é importante o fato de Jesus não ter simplesmente recebido nossa maldição por nós, mas, sim, ter se tornado maldição por nós (v. 13)?

Cristo não foi um pecador. No entanto, na cruz ele foi legalmente tratado como se fosse um pecador. Ele se tornou pecado. E se Jesus se tornou o pecador que você é, então você se tornou perfeito e irrepreensível como ele é.

Leia 2Coríntios 5.21; Romanos 3.21-26; 1Pedro 3.18.

Como essas palavras, escritas por Paulo e Pedro, aumentam seu apreço por Gálatas 3.13? O resultado

Qual é a grande conquista de Jesus ao nos comprar da escravidão ou “nos redimir” (v. 14)?

O que Paulo nos lembra no versículo 14 é a maneira pela qual essas conquistas chegam até nós?

Pai,

agradeço que não me deixaste sob maldição, como alguém que guarda a lei de maneira imperfeita.

Agradeço que Cristo Jesus se tornou maldição em meu lugar e assim morreu em meu lugar como um ser humano sob punição.

Agradeço que, pela fé, sou aceitável a ti e tenho teu Espírito.

Agradeço que realizaste tudo isso em favor de um transgressor como eu, Pai.

Amém.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 3.15-25$t$, 10,
$conteudo$O

relacionamento do cristão com a lei de Deus é uma questão prática relevante. A verdade definitiva da justificação pela fé nos leva a perguntar: “Por que, então, Deus nos deu sua lei?” e ainda: “Qual é a finalidade da lei nos dias de hoje?”. Paulo começa a tratar dessas questões complexas aqui. Leia Gálatas 3.15-18. Qual é o exemplo que Paulo usa (v. 15)? Uma vez que um acordo jurídico tenha sido feito (um contrato, por exemplo) e estabelecido (mediante assinatura, por exemplo), ele não pode ser alterado. Está estabelecido. Que acordo vinculativo Paulo menciona em seguida (v. 16)? Esses acordos encontrariam cumprimento em uma “semente” específica de Abraão, “que é Cristo” (v. 16). Por que, então, a lei de Moisés não conseguiu nem suplantar as promessas dadas a Abraão nem suplementá-las (v. 17)? Qual princípio é estabelecido no versículo 18a? A salvação pode dar-se tanto por promessa quanto por lei? O propósito da lei: número 1

Leia Gálatas 3.19,20.

Que pergunta Paulo faz no versículo 19?

Que resposta ele dá (v. 19)?

Então, um motivo pelo qual Deus deu a lei por intermédio de Moisés foi para mostrar ao povo de Deus como viver até que viesse aquele que cumpriria as promessas, isto é, Jesus Cristo, a “semente”. O que o propósito da lei não é

Leia Gálatas 3.21,22.

A lei de Deus não é uma maneira alternativa de se tornar justo perante Deus, independentemente de sua promessa. Por quê? Porque a lei nunca teve a intenção de “transmitir vida”; ela foi dada a um mundo pecaminoso, “um prisioneiro do pecado”.

Como a lei de Deus poderia ter sido um meio alternativo para obtenção da justiça se pecadores não podem obedecer à lei de Deus? Se pensarmos que podemos ser justos por guardar a lei, teremos perdido por completo a finalidade da lei! O propósito da lei: número 2

Leia Gálatas 3.23-25.

De que modo Paulo explica que a lei nos conduz a Cristo?

A lei não se opõe à promessa; ao contrário, ela a sustenta. A promessa se torna clara para nós somente por causa da obra da lei. Se conhecermos os padrões de Deus e a nós mesmos, saberemos quão longe desses padrões perfeitos nós sucumbimos.

Assim, será também um enorme alívio saber que podemos ser justificados por meio da fé no que Cristo realizou, e não em qualquer coisa que tenhamos feito!

Agradeça a Deus que tenha lhe mostrado seu pecado a cada dia por meio de sua lei, de modo que você seja capaz de valorizar mais e mais o que tem em Cristo.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 3.26—4.7$t$, 11,
$conteudo$A

lei e o evangelho não são apenas estágios na história da redenção, no plano de Deus de salvar pecadores. Eles também são estágios na jornada de um indivíduo em direção a Deus. Em Cristo Jesus todos vocês são...

Leia Gálatas 3.26-29.

O que é verdade acerca de cada cristão (v. 26)?

O que aprendemos a respeito do significado disso nos versículos 26 e 27?

Pare por um momento para pensar a respeito da imagem de estar “revestido de Cristo”.

Quais são as implicações da metáfora?

O que Paulo está dizendo no versículo 28?

Como isso se desenrola do versículo 26 em diante? A diferença entre um escravo e um herdeiro

Leia Gálatas 4.1-7.

Após o povo de Deus receber a lei, mas antes que Deus enviasse seu Filho (v. 4), Paulo os apresenta como herdeiros e também como pessoas que “não são diferentes de um escravo”. Deus havia prometido lhes dar a herança, porém ainda não haviam “crescido”, nem podiam lançar mão dela. A herança seria deles, mas ainda não lhes pertencia.

O mesmo ocorre com cada cristão. Todos os seres humanos são “escravos” espirituais antes de virem a Cristo, tentando desesperadamente viver de acordo com algum padrão (v. 3).

Deus nos “amadurece” por meio do evangelho, pois este nos diz que o Deus da graça fez algo para nos conduzir a uma filiação plena, de modo que pudéssemos desfrutar de sua herança...

Quais foram as duas coisas que levaram Deus a enviar seu Filho para conquistá-las (v. 5)?

Muitas pessoas se lembram da primeira delas, mas se esquecem da segunda. Se Deus apenas nos perdoou (ou nos “redimiu”), teremos de viver agora uma vida que é boa o suficiente para manter o favor de Deus.

Contudo, Cristo não apenas removeu a maldição que merecíamos (embora isso já seja incrível!). Ele também nos deu a bênção que ele merecia, isto é, os “direitos plenos de filhos” (v. 5). O favor contínuo e eterno de nosso Pai é tão seguro quanto o nosso perdão. A vida como um filho

Quais são os privilégios da filiação que Paulo expõe nos versículos 6 e 7?

O Espírito foi enviado para qual missão (v. 6,7)?

A palavra aba não tem tradução direta em nossa língua. A tradução mais próxima seria “papai”. Tratase de uma maneira familiar e bastante íntima de dizer “pai”. Vale a pena fazer uma pausa aqui para refletir a respeito do fato de que chamamos Deus de “papai”.

De que forma saber que o Criador é o seu Aba (Papai) influenciará:

• suas orações?

• sua alegria?

• sua obediência a Deus?

• sua reação a quando algo sai errado?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 4.8-11$t$, 12,
$conteudo$Q

uando os cristãos gálatas se voltaram para Cristo, eles também se afastaram de algo. Paulo está seriamente preocupado que eles estejam prestes a retroceder e quer que percebam o prejuízo que isso seria para eles. Leia Gálatas 4.8-11. Antes e agora

De que forma Paulo descreve o tipo de religião que os gálatas gregos tinham antes de ouvir o evangelho (v. 8)?

Se compararmos o antes e o agora, o que mudou (v. 9)?

Para que tipo de religião os cristãos gálatas estão correndo o risco de voltar (v. 9)?

De que modo isso é um antídoto para justificação pelas obras (ou seja, a compreensão de que devemos fazer algo para nos tornarmos justos perante Deus)?

Leia Jeremias 2.13 e Romanos 1.25.

Como esses versículos nos ajudam a compreender o que Paulo está falando aqui?

É legalismo bíblico pensar que seguir regras da Bíblia, como as festas do Antigo Testamento (v. 10), é o que nos torna justos perante Deus — algo muito comum nas igrejas hoje em dia. E o que causa espanto aqui é o fato de Paulo estar dizendo que pensar dessa maneira é, na verdade, “retroceder” (v. 9) para a idolatria.

Os gálatas estavam prestes a tornar sua obediência à lei em um “salvador”, tornando o ato de ser religioso em um deus. Justificação pelas obras sempre cria ídolos, mesmo que tais ídolos sejam nossas igrejas ou até mesmo nossos ministérios para com as pessoas! Então não retroceda!

Lembre-se que Deus torna aqueles que têm fé em Cristo Jesus em “filhos de Deus” (3.26).

O que a idolatria gera (compare com o final de 4.9)?

Por que você acha que isso fez com que Paulo temesse por eles (v. 11)?

David Powlison, especialista em aconselhamento, apresenta alguns questionamentos para ajudar a trazer à tona sistemas de idolatria. Faça as seguintes perguntas a si mesmo:

• Em que coisas eu procuro estabilidade, segurança e aceitação para conservação e continuidade da vida? • O que realmente quero e espero da vida? • O que me faria feliz?

• Em que devo procurar poder e sucesso? • Quem ou o que governa mais meu comportamento: o Senhor ou um ídolo?

Agradeça a Deus que, por meio da fé em Jesus, você é seu filho, tendo a vida eterna como herança.

Peça a Deus que lhe mostre em que área você está vivendo (ou corre o risco de viver) em escravidão a um ídolo, e não como seu filho.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 4.12-20$t$, 13,
$conteudo$V

ocê está se sentindo alegre? Talvez não esteja feliz a respeito de tudo, mas existe um tom de alegria subjacente na melodia de sua vida? A alegria é algo que todos nós queremos, mas frequentemente parece elusiva. A alegria havia sumido dessa igreja. Lidando com mudanças de planos

Leia Gálatas 4.12-16. O que isso nos ensina sobre sofrimento e planos frustrados? Consegue pensar em ilustrações pessoais disso em sua própria vida? Efeitos de um falso evangelho

O que levou Paulo aos gálatas (v. 13)?

Como os gálatas haviam reagido a Paulo (v. 14)?

Como e por que esse relacionamento entre os gálatas e Paulo havia mudado (v. 15,16)?

O que Paulo sente ter desaparecido da vida dos gálatas (v. 15)?

Se sabemos que somos amados por Deus incondicionalmente, por meio de nossa fé em Jesus e em sua morte, então podemos estar em paz. Podemos nos alegrar, pois sabemos que, em Cristo, temos tudo de que precisamos e que nada que fizermos (ou não fizermos) pode retirar o favor de Deus de nós.

Nosso futuro eterno não depende de nós, mas do Senhor Jesus. O evangelho da justificação somente pela fé, de Paulo, produziu grande alegria no passado e ainda produz em nós hoje.

Compare isso com o que a crença na justificação pelas obras produz. Se meu futuro eterno de alguma forma depende de mim, daquilo que faço e daquilo que sou, ficarei ansioso porque sei que fracassei, ou então me tornarei arrogante porque me comparo com os outros que vejo como menos obedientes do que eu. Talvez eu até possa ficar ansioso e ser arrogante ao mesmo tempo — mas não conhecerei a alegria!

A alegria surge somente com a condição de ser filho de Deus (3.26), e nunca de ser escravo daqueles que “não são deuses” (4.8). Não é surpreendente que os gálatas tenham perdido toda a sua alegria à medida que começaram a se desviar da fé em Cristo para confiar em si mesmos e na adoração de seus esforços religiosos! Alvos dos falsos mestres

Leia Gálatas 4.17-20.

Qual é o alvo do ministério dos falsos mestres (v. 17)? Diz respeito a quem?

O que Paulo está buscando como alvo em seu ministério (v. 19)?

Que características de relacionamento cristão saudável você pode extrair dos versículos 19 e 20?

Essas coisas caracterizam:

• sua igreja? • seu grupo pequeno? • sua amizade com outros cristãos?

Se você compartilha das prioridades e emoções de Paulo, o que será diferente em suas orações e ações em favor dos cristãos de sua convivência?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 4.21-31$t$, 14,
$conteudo$P

aulo ensina aos cristãos gálatas que eles eram filhos plenos de Abraão a partir do momento em que cressem em Cristo (3.7). Agora ele usa a ilustração dos dois filhos de Abraão, Ismael e Isaque, para apresentar seu argumento de uma forma definitiva e extraordinária. As diferenças nos dois filhos

Leia Gálatas 4.21-28.

O que significa estar “debaixo da lei” (v. 21)?

O argumento de Paulo não diz respeito àquilo a que estamos obedecendo, mas, sim, àquilo em que estamos depositando nossa confiança.

Leia Gênesis 16.1-4; 18.10-14; 21.1-10.

Quais são as diferenças entre os nascimentos desses dois filhos (Gl 4.23)?

O que Paulo diz que cada mãe biológica representa (v. 24-26)?

Qual é a diferença entre os “filhos” das duas mulheres?

Esse fato provocaria espanto aos ouvidos dos judeus. Os moradores de Jerusalém teriam considerado Sara como sua mãe e Hagar como a mãe dos gentios. Paulo, na verdade, inverteu a ordem das coisas.

Isso porque, confiar na lei de Deus, como Jerusalém estava fazendo, escraviza. São os irmãos cristãos de Paulo que são “filhos da promessa” (v. 28), pois estão confiando em Cristo e, assim, são membros da “Jerusalém” verdadeira (v. 26) — o céu.

O ensinamento básico é que o evangelho não apenas torna absolu tamente qualquer pessoa em filho de Deus, mas que os mais orgulhosos, morais e religiosamente “aptos” frequentemente são aqueles excluídos da família de Deus.

O evangelho inverte os valores do mundo.

Como isso mudará a maneira com que você olha para os membros de sua igreja?

Qual é a diferença entre uma abordagem “religiosa” e uma abordagem cristã a Deus? O relacionamento dos dois filhos

Leia Gálatas 4.29-31.

No versículo 29, Paulo traça outro paralelo entre os dois irmãos.

O que, então, ele está dizendo a respeito do relacionamento entre Ismael e Isaque?

Qual questão ele está suscitando a respeito daqueles que confiam na justificação pelas obras e daqueles que confiam em Cristo no primeiro século (e também no século 21) (veja o final do versículo 29)?

Por que você acha que isso acontece?

Por que pessoas religiosas precisam do evangelho?

Como você deve esperar que pessoas religiosas reajam ao evangelho?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 5.1-6$t$, 15,
$conteudo$O

enfoque do conjunto desses dois últimos capítulos de Paulo é declarado no versículo 1 do capítulo 5. É isso que ele quer que tanto os seus primeiros leitores quanto os leitores atuais façam em resposta à magnífica verdade do evangelho que tem proclamado nos quatro primeiros capítulos. Leia Gálatas 5.1-6. Permaneçam firmes

O que, nas duas frases do versículo 1, Paulo está encorajando seus leitores a fazer?

Os cristãos gálatas foram “libertados”.

Por que para eles seria um absurdo pensar que ainda precisavam obedecer à lei para serem salvos?

Paulo afirma que a expressão exterior da fé salvadora não se dá por meio da circuncisão (v. 6), nem por meio da incircuncisão!

Qual seria então (v. 6)?

Somente se sabemos que estamos salvos por meio da fé em Jesus é que podemos amar aqueles que estão à nossa volta.

Agora podemos servir a Deus não por aquilo que ele nos dá, mas por quem ele é. E podemos servir aos outros não por aquilo que eles nos dão, mas simplesmente por aquilo que podemos lhes dar. O amor de Cristo nos liberta para amar outras pessoas. Altos riscos

No versículo 2, Paulo está alertando os cristãos gálatas a respeito de quê?

Tão logo comecemos a confiar no Senhor Jesus e em algo mais que façamos para salvação, deixamos de confiar plenamente em Cristo. Dessa forma, ele deixa de ser nosso inestimável Salvador. Quando acrescentamos algo a Cristo, significa que o perdemos.

Quais são as sérias consequências de buscar obter justificação por meio daquilo que fazemos (v. 4)?

Em qual área de sua vida suas ações irão mudar caso elas sejam conduzidas pelo amor aos outros?

Como Gálatas 5.5,6 o ajuda a motivá-lo?

Paulo está dizendo no versículo 4 que os gálatas que são verdadeiros cristãos irão perder sua salvação?

Leia Gálatas 5.10. De que maneira o versículo 10 lança luz sobre o versículo 4?

Paulo claramente acredita que se trata de cristãos verdadeiros que não abandonarão o evangelho. Se são cristãos que acreditam no evangelho em seu coração, responderão positivamente ao seu alerta.

Peça a Deus que o capacite a continuar conhecendo o valor inestimável de Jesus, seu único Salvador.

Peça a Deus que o ajude a permanecer firme na liberdade do evangelho todos os dias e que continue a lhe dar a verdadeira fé, a qual se revela em amor verdadeiro.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 5.7-12$t$, 16,
$conteudo$V

ocê quase consegue sentir a emoção e a frustração jorrando da pena de Paulo para as páginas, à medida que ele escreve a esses cristãos que estão considerando abandonar sua fé. Lançados para fora do percurso

Leia Gálatas 5.7-10.

O que Paulo diz no versículo 7 a respeito da performance dos gálatas como cristãos:

• no passado? • no presente?

O que ele sabe ter provocado essa mudança (v. 7)?

Paulo está retratando a vida cristã como uma corrida, e os cristãos gálatas eram corredores velozes. No entanto, alguém claramente os cortou, e foram lançados para fora do percurso. Agora existe a possibilidade de que não continuem mais correndo.

Aquele falso mestre (ou falsos mestres) fez algo particularmente perigoso: ele parece ter convencido os gálatas de que aquela era a verdadeira mensagem cristã. Paulo, então, indica que Deus, “aquele que os chama”, nunca buscaria persuadir seu povo a não obedecer à verdade do evangelho da salvação pela fé (v. 8).

Os falsos mestres eram poucos. No entanto, que tipo de efeito eles tiveram (v. 9)?

Por que você acha que Paulo incluiu a primeira frase do versículo 10? O que ele está encorajando os gálatas a fazer?

É fácil pensar que esse tipo de coisa não aconteceria conosco ou com a nossa igreja. Não obstante, esses cristãos da Galácia estavam “correndo bem” antes de serem lançados para fora do percurso.

Ore por você mesmo para que Deus o mantenha confiando na verdade do evangelho e para que você não mude o percurso por alguém ou por qualquer coisa.

Ore por sua igreja para que Deus a proteja do falso ensino persuasivo que a tudo permeia. Ainda no percurso

Leia Gálatas 5.11,12.

Há dois “evangelhos” sendo pregados:

• “da circuncisão”: no qual confiamos naquilo que fazemos para nos tornar justos diante de Deus; • “da cruz”: no qual confiamos naquilo que Jesus fez para nos tornar justos diante de Deus.

Qual desses evangelhos Paulo está pregando (v. 11)?

Como ele se sente a respeito daqueles que estão pregando o outro “evangelho” (v. 12)?!

Paulo diz que, se esses falsos mestres são tão dispostos a se cortarem por meio da circuncisão, quem dera que eles se castrassem!

O que você diria a alguém que diz: “Aquela igreja ali que afirma que precisamos praticar o bem tanto quanto confiar em Jesus não tem problema; trata-se apenas de uma espécie diferente de cristianismo”?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 17;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 5.13-15$t$, 17,
$conteudo$N

o início do capítulo 5, Paulo reintroduz a ideia da liberdade cristã que havia mencionado anteriormente (2.4). O conceito de “liberdade” cristã é fácil de ser mal compreendido e, nessa seção, Paulo nos ajuda a compreender o que tal conceito significa para o nosso dia a dia. Como fazer uso de sua liberdade

Leia Gálatas 5.13.

O que Paulo lembra aos seus leitores é a condição dos cristãos?

Como podemos fazer mau uso dessa liberdade?

Qual erro de pensamento você acha que está por trás desse mau uso da liberdade?

De que modo os cristãos devem fazer uso de sua liberdade? A liberdade e a lei

Paulo diz que estamos livres da “supervisão” da lei (3.25) e que não estamos mais “debaixo da lei” (5.18). Isso significa, então, que estamos livres para desobedecer a ela ou desconsiderá-la? Essa é a questão que Paulo trata aqui.

Leia Gálatas 5.14.

Como Paulo resume a lei? E quem a resumiu dessa maneira antes dele (v. 14)?

Qual é o relacionamento entre a liberdade, o amor e a lei de Deus?

“Irmãos, vocês foram chamados para a liberdade...” (v. 13). Cristãos não são obrigados a obedecer à lei a fim de que sejam salvos.

Agora, porém, que estamos salvos total e livremente pela graça, estamos, na verdade, mais obrigados a obedecer à lei! Por quê?

Porque temos mais razões para amar a Deus (v. 6) do que nunca. Ao obedecer à lei, agradamos a Deus — e, de maneira grata, desejaremos agradar àquele que nos salvou com tamanho custo. Liberdade para não se morderem e não se devorarem

Leia Gálatas 5.15.

A igreja gálata estava caindo novamente em uma atitude baseada na justiça pelas obras.

Como eles estavam tratando uns aos outros (v. 15)?

Paulo os alerta a respeito de quê (v. 15)?

Por que podemos esperar que isso seja uma consequência do fato de as pessoas confiarem em si mesmas como boas em vez de confiarem em quão bom Cristo é?

Com base nesses versículos, como você responderia a alguém que lhe fizesse a seguinte pergunta: “Por que um cristão obedece a Deus?”.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 5.16-25$t$, 18,
$conteudo$E

m religiões que se baseiam em regras, a motivação para a moralidade está enraizada no medo: “Tenho de fazer coisas boas ou Deus não me aceitará”. No evangelho, a motivação é uma dinâmica de amor: “Deus me aceitou amavelmente; então sou livre para fazer o bem por causa do amor por ele e por outros”. Paulo agora especifica como crescemos em caráter por meio dessa nova dinâmica. A batalha

Leia Gálatas 5.16-18.

Quais são as duas coisas que estão operando em cada cristão (v. 16,17)?

Por que isso produz um conflito em nós (v. 17)?

O que um cristão naturalmente quer fazer?

• Versículo 16 • Versículo 17b

Então, existe uma grande batalha acontecendo dentro de nós!

No versículo 16, Paulo fala de nossa “natureza pecaminosa”; no versículo 18, ele se refere à mesma coisa com a expressão “debaixo da lei”. Isso mostra como funciona a natureza pecaminosa. Quando olhamos para a lei de Deus, às vezes nossa natureza pecaminosa a usa para nos incentivar a pensar em infringi-la de algum modo (veja Rm 7.7-11).

Em outras ocasiões, no entanto, à medida que olhamos para a lei de Deus, nossa natureza pecaminosa indica que temos guardado sua lei, e isso incita em nós orgulho e justiça própria. Trata-se de uma obra mais sutil de nossa natureza pecaminosa, ou seja, justiça própria produzida por nossas boas obras.

Ser guiado pelo Espírito nos liberta disso. A fim de que realmente possamos mudar, ele nos capacita a nos arrependermos em alegria tanto de nossa violação pecaminosa da lei quanto de nossa observância pecaminosa da lei. A vitória

Leia Gálatas 5.24-26.

O que aconteceu à nossa natureza pecaminosa (v. 24)?

Ela já foi derrotada pelo Filho de Deus na cruz! E o Espírito de Deus aplica a vitória de Cristo na cruz à nossa vida hoje, vencendo batalha após batalha contra a nossa derrotada natureza pecaminosa. O resultado

Leia Gálatas 5.19-23.

O que você aprende a respeito do coração humano na lista dos versículos de 19 a 21?

Em que sentido a manifestação da obra do Espírito em nós (v. 22,23) é o oposto dos atos da natureza pecaminosa?

Que ações e atitudes dos versículos de 19 a 21 você reconhece especificamente em si mesmo?

Em quais áreas de sua vida você precisa começar a “andar pelo Espí rito” (v. 25)?

Peça ao Espírito de Deus que o conduza na luta contra sua natureza pecaminosa e que frutifique nessas áreas de sua vida.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 5.26—6.6$t$, 19,
$conteudo$E

ssa breve passagem é repleta de princípios práticos a respeito de como nos relacionarmos com as pessoas. Leia Gálatas 5.26—6.6. Provocação e inveja: como evitar

Paulo alerta seus leitores a não se tornarem o quê (v. 26)?

Como você definiria presunção com base em Gálatas 6.1-5?

A presunção é um desejo de receber honra e glória que consideramos merecer. Queremos ser notados! Assim, sentimos que precisamos provar o nosso valor para nós mesmos e para outros. Isso nos faz concentrarmo-nos em constantemente nos comparar com outros. Quando parecemos ser melhores que alguém de alguma maneira, nossa “fome por reconhecimento” se manifesta e nos deixa eufóricos. Quando parece que somos inferiores a alguém, ficamos arrasados.

De acordo com o versículo 26, quais são os dois possíveis efeitos da presunção nos relacionamentos?

A presunção, então, nos leva a dizer ao outro: “Tenho algo que você não tem!” (o que tem caráter provocador); ou então nos leva a dizer: “Você tem algo que não tenho; isso é injusto!” (o que tem caráter invejoso).

No entanto, o evangelho cria uma autoimagem completamente nova. Ele nos torna humildes perante os outros ao nos dizer que somos pe cadores salvos somente pela graça. Não obstante, ele também nos fornece ousadia perante as pessoas ao nos dizer que somos amados e honrados diante dos únicos olhos no Universo que realmente importam.

O evangelho, então, produz uma ousadia e uma humildade que não competem entre si, mas, sim, que podem crescer juntas. Precisamos pregar o evangelho a nós mesmos em meio a situações em que somos tentados a provocar ou invejar alguém, pensando que somos superiores ou inferiores a outras pessoas.

Você tem uma tendência maior a “provocar” ou a “invejar” em seus relacionamentos?

Como você usará o evangelho para vencer essa tendência? Reparar e carregar o fardo: Como pôr em prática

Quais princípios Paulo estabelece em Gálatas 6.1?

Em Gálatas 5.14, Paulo nos disse que a lei pode ser resumida em “um único mandamento: ‘Ame o próximo como a si mesmo’”.

Como ele diz que podemos cumprir isso em Gálatas 6.2?

Os versículos 2 e 5 parecem ser contraditórios! Entretanto, “fardos” (v. 2) não é a mesma coisa que “carga” (v. 5). “Fardos” são tarefas e problemas com os quais podemos ajudar pessoas. A palavra “carga” refere-se a um tipo de mochila. Deus deu a cada um de nós um conjunto diferente de oportunidades para obedecer a ele. Essas oportunidades são a nossa carga, e cada um de nós deve carregar essa mochila.

De que modo e por que os cristãos lutam para viver Gálatas 6.1 e 6.2 em seus relacionamentos?

Em termos práticos, o que você poderia fazer para melhor obedecer ao:

• versículo 1? • versículo 2?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 20;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 6.7-10$t$, 20,
$conteudo$À

medida que Paulo chega ao fim de sua carta, ele inicia um apelo final e empolgante aos cristãos gálatas para que se apeguem à verdade. Não faça!

Leia Gálatas 6.7,8.

O que Paulo incita os gálatas a não fazerem (v. 7)?

De certa forma, essa é a síntese de Gálatas!

Paulo estabelece qual princípio oriundo da agricultura (v. 7)?

Tudo o que você semear, colherá. Se semear sementes de tomate, não obterá milho — não importa quanto queira que cresça milho.

E, não importa o que você semeie, você colherá. Embora a semente possa permanecer na terra por um longo tempo, ela brotará. Não é a colheita que determina uma safra, mas, sim, a semeadura.

Sempre há consequências para as suas ações. Essa é a maneira pela qual o mundo de Deus funciona, tanto agora como depois da morte.

Quais são as duas maneiras que podemos semear em nossa vida (v. 8)?

Em que resulta a colheita (v. 8)?

Com que frequência você olha para o “campo” de sua vida e reflete a respeito do que tem semeado lá?

A quem buscará agradar hoje: sua natureza pecaminosa ou o Espírito? Faça!

Leia Gálatas 6.9,10.

O que Paulo diz para os cristãos fazerem nos versículos 9 e 10?

Qual é a grande motivação para fazermos isso conforme semeamos para agradar a o Espírito (v. 9)?

Baseado em sua própria experiência, como “colhemos” de um estilo de vida como esse?

O versículo 10 é amplo e abrangente em sua simplicidade. Em primeiro lugar, ele mostra que a vida cristã não se resume a reuniões ou até mesmo a conversões. A vida cristã tem como alvo fazer o bem à pessoa que está diante de mim, dando-lhe o que é melhor.

Em segundo lugar, a palavra “façamos” nos lembra que devemos dar ativamente àqueles que estão ao nosso redor tudo quanto o amor discerne ser melhor para cada pessoa — amor em obras e em palavras. Isso começa com nossa família: nossos irmãos e irmãs adotados na igreja de Deus. No entanto, não se limita a eles.

Como seria “fazer o bem” de modo deliberado a todos os que encontrar hoje?

Agradeça a Deus as oportunidades que lhe dá para fazer o bem às pessoas.

Peça que ele lhe mostre como agradar seu Espírito hoje. Ore pedindo disposição para que você não se canse de fazer o bem.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 21;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Gálatas 6.11-18$t$, 21,
$conteudo$P

ara as últimas linhas de sua carta, Paulo pega a caneta de seu escriba e escreve de próprio punho... Gloriar-se de maneira errada

Leia Gálatas 6.11-13.

O que o versículo 12 revela a respeito das motivações dos oponentes de Paulo?

As pessoas acham que é um insulto lhes dizer que são muito fracas e pecaminosas para fazerem qualquer coisa em prol de sua própria salvação.

Em contrapartida, o mundo valoriza a “religião” e a “moralidade” em geral. O mundo pensa que a religião moral é algo bom para a sociedade. E Paulo diz que a pressão para se conformar ao mundo, ser popular e respeitado por ele é o elemento que motiva os falsos mestres na Galácia.

O que Paulo destaca a respeito daqueles que ensinam a salvação pelas obras, como a circuncisão (v. 13)?

O que eles querem ser capazes de fazer (v. 13)?

Esses homens ingressaram na religião pela notoriedade, pelo prestígio e pela honra que ela pode lhes trazer no mundo. Eles adoram se gloriar de seu sucesso. Seus ministérios são, na verdade, uma forma de autossalvação. Gloriar-se de maneira correta

Leia Gálatas 6.14-18.

Paulo também se gloria, mas a respeito de quê (v. 14)?

No cerne de sua religião está aquilo em que você se gloria. Qual é, no fim das contas, a razão pela qual você está em um relacionamento correto com Deus?

Se a razão for a cruz mais as suas boas obras, então são as suas obras que fazem toda a diferença. São nelas que você deposita sua confiança. Portanto, você se “gloriará na carne” (v. 13).

Se você compreende o evangelho, se “gloriará” apenas na cruz. Você encontrará sua identidade, confiança e segurança não naquilo que é ou faz, mas, sim, em quem Jesus é e naquilo que ele fez.

Qual efeito a cruz de Cristo teve sobre Paulo (v. 14)?

O mundo não tem poder sobre o cristão, e sua opinião também não precisa ter influência sobre o cristão. Se nada no mundo proporciona a minha justiça ou a minha salvação, então não há nada no mundo que eu necessite ter e que, portanto, me controle.

De que modo os versículos 14 e 15 constituem um grande resumo de tudo o que Paulo tem dito em sua carta?

O que viver conforme essa “regra” (isto é, confiando no verdadeiro evangelho e vivendo-o) proporciona (v. 16)?

Quanto você se importa acerca do que o mundo pensa a seu respeito?

De que modo você pode se “gloriar” na cruz, seja em relação a si mesmo, seja diante das pessoas?

Dedique algum tempo agora agradecendo a Cristo sua cruz e verdadeiro evangelho da justificação pela fé.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 22;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 1.1; Josué 1.1-9; 23.1-13$t$, 22,
$conteudo$O

livro de Juízes começa olhando para trás, para a época de Josué. Para que possamos compreender os altos e baixos desse período da história de Israel — reconhecer os triunfos e as (mais frequentes) tragédias do povo de Deus no período dos juízes —, precisamos começar olhando para trás, como nos incentiva o versículo 1. Leia Juízes 1.1. Viva pelas promessas

Leia Josué 1.1-9.

Aqui vemos a missão dos israelitas sob o comando de Josué, o homem que Deus escolheu para suceder a Moisés como líder de Israel (v. 1).

Quais promessas Deus faz a Josué e ao povo?

Quais ordens ele dá (v. 6-9)?

Leia Josué 23.1-13.

Um “longo período” se passou entre os capítulos 1 e 23. Josué agora está velho (v. 1).

O que o povo de Deus viu Josué fazer (v. 3)?

O que resta ser feito (v. 4,5)?

O que Israel não deve fazer (v. 6-8)? Por que não (v. 12,13)?

Esses versículos estabelecem o cenário para o livro de Juízes e fornecem o parâmetro pelo qual ele deve ser medido. O povo está na terra que Deus lhe prometeu quando era escravo no Egito e seus inimigos haviam sido derrotados. No entanto, eles ainda precisa se estabelecer na terra tomando posse dela. Viva corajosamente

O chamado de Deus ao seu povo (naquela época e hoje também) é para unir espiritualidade com bravura. O verdadeiro discipulado envolve assumir riscos, porque verdadeiros discípulos dependem de Deus, que ele mantenha suas promessas de os abençoar, e não de seus próprios instintos, planos ou apólices de seguro.

É difícil ser verdadeiramente corajoso sem fé em Deus. O tipo de bravura que não surge da fé em Deus é aventureirismo, heroísmo machão ou simplesmente crueldade. Estará enraizada em insegurança, desespero de provar a si mesmo ou desesperança. Somente a bravura fundada na fé protegerá as pessoas do egoísmo e da negligência, por um lado, e da covardia e da ineficiência, por outro.

O oponente contra quem Israel escolhe lutar e a maneira com que reage à vitória demonstrarão se ele está verdadeiramente confiando em Deus, se realmente está obedecendo ao SENHOR.

Como escolhemos viver demonstra se realmente confiamos em Deus.

Que riscos você assume por confiar em Deus?

Há momentos em que você é corajoso pelo desejo de provar a si mesmo?

Há momentos em que você é ineficiente ou evita correr riscos pelo desejo de se proteger?

O que faria de maneira diferente nesses momentos se você tivesse uma bravura alimentada pela fé?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 23;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 1.1-36$t$, 23,
$conteudo$J

uízes 1 registra os sucessos e os fracassos de nove das doze tribos de Israel. Será que elas demonstrarão a fé corajosa que deveria ser a marca do povo de Deus? Fidelidade...

Leia Juízes 1.1-18.

De quais maneiras as tribos de Judá e Simeão são bem-sucedidas?

O que Deus diz a Israel, no versículo 2, que ele quer que aconteça?

Judá é obediente ou desobediente (v. 3,4)?

Ao longo do registro da atuação de Judá como um todo, o narrador limita o foco a uma única família de Israel. Da geração que deixou o Egito, Calebe e Josué eram os únicos homens que permaneceram fiéis. Por isso eles foram os dois únicos homens que Deus permitiu que entrassem na terra prometida (Nm 14.30).

De que maneira vemos essa família confiando em Deus e assumindo riscos para obedecer a ele em Juízes 1.12-15?

• Calebe: • Otoniel: • Acsa:

Em seguida, no versículo 16, conhecemos os queneus, que são parentes distantes de Moisés.

O que eles fazem? De que modo isso mostra que eles querem desfrutar das bênçãos de ser parte do povo de Deus?

Essa família e esses estrangeiros manifestam a fé verdadeira e profunda que Josué havia pedido.

Se Calebe e sua família fizessem parte de sua igreja, de que modo você acha que a confiança e a obediência deles seriam demonstradas? ...com falhas

Leia Juízes 1.19-36.

Ainda assim, o que Judá foi incapaz de fazer (v. 19)?

Por que isso é estranho?

Judá teria conquistado vitória até mesmo contra as poderosas carruagens de ferro. Por quê? Porque Deus estava com eles (v. 19). Mesmo assim, o texto nos diz que eles “não conseguiram”. Tendo em vista que Deus havia dito que eles de fato conseguiriam vencer, a declaração de insucesso presente no texto somente pode ser o próprio veredito do povo baseado em cálculos de senso comum, e não na fé que assume riscos. Assim, embora Otoniel tivesse atacado uma cidade na força de Deus, uma tribo inteira concluiu que não conseguiria fazer o mesmo em sua própria força. Desse modo, não fez nada.

De que maneira vemos o restante das tribos falhando completamente em confiar em Deus e obedecer a ele (v. 21-36)?

Não é a nossa falta de força que nos impede de desfrutar das bênçãos de Deus ou faz com que paremos de adorá-lo de todo o coração. É a nossa falta de fé em sua força que provoca isso. Quando dependemos de nós mesmos e baseamos nossa caminhada com Deus em nossos próprios cálculos, e não em suas promessas, vemo-nos tomando decisões como os homens de Judá.

Isso reflete algo a seu respeito no atual momento? Como seria para você a obediência que confia na promessa?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 24;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 2.1-5$t$, 24,
$conteudo$O

capítulo 1 se assemelha um pouco a um conjunto de comunicados de imprensa a respeito da campanha de Israel. Trata-se de uma apresentação tendenciosa de seus sucessos, bem como da razão de não serem tão bem-sucedidos quanto esperávamos que fossem. Quando sabemos que eles não “conseguiram expulsar” os cananeus (v. 19, ESV), somos inclinados a concordar com eles. Eles fizeram o seu melhor. A avaliação de Deus, então, é repentina, chocante e confrontadora... Leia Juízes 2.1-5. Não quiseram

Qual é o veredito de Deus sobre Israel (v. 2)?

O que Deus indica que eles não deveriam ter feito e fizeram (v. 2; veja 1.22-26)?

O que eles deveriam ter feito e não fizeram (2.2)?

Em suma, os israelitas disseram: “Não conseguimos”. E Deus responde: “Não, vocês não quiseram”. Deus diz que, aquilo que Israel pensou serem boas razões, eram desculpas fajutas. “... Deus é fiel; ele não permitirá que vocês sejam tentados além do que podem suportar...” (1Co 10.13). Quando se trata de obedecermos a Deus, nunca existe de verdade um momento “Eu não consigo”. Nossos “Eu não quero”

Pode haver uma porção de coisas em nossa vida que pensamos ser in capazes de fazer, mas que, na verdade, estamos nos recusando a fazer.

Confira abaixo três áreas em que acreditamos ser fácil dizer “Eu não consigo” quando queremos dizer “Eu não quero”.

• Perdão: Não consigo perdoar isso/ele/ela. • Contar a verdade: Não consigo contar a verdade a eles. Isso os destruiria ou arruinaria nosso relacionamento. • Tentação: Simplesmente não consigo resistir, embora saiba que é errado.

Qual é a solução? Lembrar-se de quem Deus é: ele é o Deus que resgata e permanece fiel (v. 1). Desse modo, obedeceremos a ele de maneira profunda e alegre.

Você está dizendo “não consigo” quando, na verdade, significa “não quero” em quaisquer dessas áreas mencionadas?

Em que situações você precisa se lembrar de quem Deus é e mudar seu “Eu não quero” para “Eu quero”?

ABENÇOANDO OS “NÃO ABENÇOÁVEIS”

O que Deus havia prometido (veja o final de Jz 2.1)?

O que Deus promete agora (v. 3)?

Qual é a contradição aparente aqui?

Deus prometeu abençoar seu povo pecaminoso. Ainda assim, porém, ele também julgará os pecadores. Como ele pode fazer ambas as coisas? O livro de Juízes não nos dá uma resposta — a qual está somente na cruz. Lá, Deus derramou seu julgamento sobre seu povo na pessoa de seu Filho, de modo que ele pudesse abençoar seu povo. Leia 2Coríntios 5.21.

Como Juízes 2.4,5 nos mostra a reação correta ao sermos confrontados por causa de nossos “Eu não quero”?

Reconheça para Deus seus “Eu não quero”. Agradeça a ele que os tenha julgado na cruz. Peça que o capacite a lembrar de quem ele é, de modo que seus “Eu não quero” se transformem em “Eu quero”.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 25;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 2.6—3.11$t$, 25,
$conteudo$E

ssa seção é uma segunda introdução ao livro de Juízes, a qual tem melhor leitura de maneira “paralela” com Juízes 1.1—2.5. No entanto, não se trata apenas de uma introdução, mas de um resumo do livro todo. Aqui, deparamos com o ciclo da experiência espiritual de Israel que verificaremos repetidamente ao longo do livro de Juízes. O ciclo de Juízes

Leia Juízes 2.6—3.6.

Os versículos 8 e 9 do capítulo 2 nos levam de volta ao mesmo ponto que Juízes 1 apresentou, isto é, à morte de Josué.

O que aconteceu depois que o povo da geração de Josué havia morrido (2.10)?

Agora tomamos conhecimento do ciclo que veremos se repetir por diversas vezes em Juízes:

• O povo se rebela, esquecendo-se do SENHOR e adorando outros deuses. • Deus fica irado. • Em consequência disso, Deus permite que eles sejam oprimidos por seus inimigos. • Em grande angústia, eles clamam ao Deus que haviam rejeitado. • Por compaixão, Deus levanta um líder, um “juiz”. • O juiz resgata o povo e o conduz à paz e à obediência a Deus. • O juiz morre.

Vejamos um detalhe em particular:

A quem exatamente as pessoas adoram (v. 12,13)?

O argumento aqui é que é possível (até mesmo natural talvez) que os seres humanos adorem muitos deuses ao mesmo tempo. A cosmovisão da época — e a cosmovisão de nossa época — pode aceitar a existência do Deus da Bíblia, mas não a sua soberania exclusiva. Ele pode ser um Deus entre vários outros deuses, mas não o único Deus verdadeiro. O SENHOR havia pedido ao povo que resgatara e abençoara que adorassem somente a ele. Ele, porém, adorou a Deus junto com outros deuses.

Essa é uma tentação sutil a cristãos professos. Vivemos em um mundo que nos oferece uma vasta gama de deuses alternativos. O maior perigo, uma vez que podemos ocultá-lo de nós mesmos, não é o ateísmo, mas, sim, pedir a Deus que coexista em nosso coração com outros deuses.

De que modo podemos expor qualquer ídolo que estamos tentando adorar junto com Deus?

Olhe para cada área de sua vida (família, carreira, bens, tempo etc.) e pergunte-se:

• Estou disposto a fazer qualquer coisa que Deus diga a respeito dessa área? • Estou disposto a aceitar qualquer coisa que Deus envie nessa área?

Se a resposta for “não” para qualquer uma das perguntas, essa é uma área de sua vida e de seu coração na qual você se abriu ou cedeu a um deus alternativo. O primeiro juiz

Leia Juízes 3.7-11.

Como vemos o “ciclo de Juízes” acontecer aqui?

Você consegue pensar de que maneiras Otoniel é parecido com Jesus? Quais são as diferençaschave entre eles?

JUÍZES 3.11-31

A

história de Otoniel nos mostra o “ciclo de Juízes” na sua forma mais simples. É quase como um padrão, e, como veremos, as maneiras em que os ciclos futuros diferem desse são importantes e instrutivas. Assim, vale a pena estabelecer os estágios novamente:$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 26;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$juiz inesperado$t$, 26,
$conteudo$Leia Juízes 3.11-31.

Identifique os estágios do ciclo nos versículos de 12 a 30.

Por que Otoniel não foi um juiz inesperado para que Deus o escolhesse (veja 1.12,13)?

Por que Eúde foi um juiz inesperado (3.15)?

Na Bíblia, as referências à mão direita são todas de conotação positiva (Is 62.8,9; Sl 16.11; 110.1). A mão direita era um símbolo de poder e destreza; lutava-se com a mão direita, mantinha-se a espada junto à coxa esquerda para que fosse fácil sacá-la. O texto em hebraico de Juízes 3.15 sugere que Eúde, de algum modo, tinha uma paralisia em sua mão direita. Ninguém teria escolhido Eúde como líder, a não ser Deus.

Por que, todavia, o fato de Eúde ser canhoto o capacita a derrotar os inimigos de Deus (v. 16-23)?

Temos aqui um resgatador inesperado, que alcança o resgate de uma maneira que talvez não tenhamos previsto; e, de modo diferente de Otoniel, que aparentemente “foi à guerra” com todo o Israel em sua retaguarda (v. 10), esse juiz precisa começar seu trabalho de resgate sozinho, antes que o povo se junte a ele (v. 27-29). O evangelho para canhotos

Leia Isaías 53.2-6.

De que maneira Eúde serve de sombra, ainda que não tão nítida, do Senhor Jesus?

Naturalmente, Jesus é um libertador ainda mais improvável. Embora Eúde tenha libertado Israel por meio do triunfo militar, Jesus nos resgatou sofrendo uma derrota esmagadora. Jesus é o sumo libertador “canhoto”.

Leia 1Coríntios 1.26-31.

Quem mais é “canhoto” aos olhos do mundo (v. 26,27)?

Por que Deus escolhe pessoas que estão à margem da sociedade (v. 29)?

Saber que Deus escolhe “canhotos” (nós) nos torna humildes de que maneira?

Saber que Deus usa pessoas “canhotas” como nós é empolgante de que maneira?

Senhor Jesus, nada em minhas mãos trago; simplesmente à tua cruz me agarro. Amém.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 27;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 4.1-16$t$, 27,
$conteudo$“O

s israelitas novamente fizeram o que era mau aos olhos do SENHOR...” (4.1). E assim o cenário se estabelece para mais um juiz — e para mais uma surpresa. Governo piedoso

Leia Juízes 4.1-7.

Os “carros de ferro” (v. 3) eram as bombas teleguiadas e os drones da época.

De que modo essa opressão é a pior até agora (v. 1-3)?

Quem é o líder/juiz de Israel nesse ciclo (v. 4)?

Por que você acha que isso teria sido inesperado no mundo antigo?

O que Débora faz (v. 5)?

De todos os juízes, Débora é aquela que melhor aponta para a monarquia, para o governo eficaz, piedoso e justo. Ela também é a que melhor aponta para Jesus, nosso “Maravilhoso Conselheiro, [...] Príncipe da Paz”, o qual está “estabelecendo e firmando [seu reino] com justiça e retidão [...] para sempre” (Is 9.6,7).

Aqui, no âmago de Juízes, um livro de grandes batalhas, somos lembrados de que o povo de Deus não precisa apenas de um resgatador poderoso. Nós precisamos de um governante sábio também.

O que acontece se tentarmos tratar Jesus como nosso resgatador, mas não como nosso governante?

E se olharmos para ele como governante, mas não como resgatador? Fé piedosa

Leia Juízes 4.8-16.

Por meio de Débora, a profetisa, Deus chama Baraque para resgatar seu povo ao derrotar seus inimigos (v. 6,7). A reação de Baraque, no versículo 8, pode ser lida de duas maneiras. A maneira pessimista é entender que ele não tinha fé e se recusou a obedecer a Deus, a menos que Débora o acompanhasse. A tradução do versículo 9 da NIV de 1984 reforça esse entendimento: “... por causa de sua maneira de agir, a honra não será sua...”.

No entanto, o versículo 9 também pode ser traduzido por uma simples declaração (veja a nota de rodapé da NIV de 1984): “... Nesta expedição que você está realizando, a honra não será sua...”. Essa é uma declaração mais otimista. Débora não está repreendendo Baraque, mas, sim, dizendo-lhe que ele precisa atacar novecentos carros de ferro e não obterá nenhuma glória por isso! Nessa leitura, a qual apoio, Baraque é um grande exemplo de fé real (assim como Hb 11.32-34 o apresenta).

De que modo Baraque demonstra fé:

• Em Juízes 4.8? (lembre-se, o discurso de Débora é a maneira pela qual Deus fala) • Nos versículos de 14 a 16?

Baraque faz tudo isso sabendo que não será honrado pelo que fará. A fé verdadeira preocupa-se em obedecer a Deus, e não em buscar louvor.

Ouvir a voz de Deus, obedecer em confiança, não buscar honra para nós mesmos.

Em quais áreas de sua vida Deus está ajudando você a viver dessa maneira?

Como e por que esse cenário de fé verdadeira o desafia?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 28;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 4.17-24; 5.24-31$t$, 28,
$conteudo$D

eus disse a Baraque que ele “entregaria Sísera a uma mulher” (4.9). Podemos presumir que seria entregue à juíza Débora? Não, há uma reviravolta na história... O fim de Sísera

Leia Juízes 4.17-24.

Por que Sísera foge para a tenda de Jael (v. 17)?

Até o final do versículo 20, essa parece ser uma decisão sábia; no entanto, certamente não é (v. 21). Montar tendas era o trabalho de uma mulher, e, portanto, uma estaca de tenda era basicamente um utensílio tradicional de seu lar, assim como hoje é um ferro de passar roupas ou um aspirador de pó.

Como isso faz com que o tipo de morte de Sísera seja ainda mais humilhante?

Como você se sente em relação às ações de Jael? Elas deveriam ser louvadas, criticadas ou ambas as coisas?

Leia Juízes 5.24-31.

Como Jael é descrita nessa canção cantada por Débora e Baraque (v. 24)?

O que aprendemos a respeito de como Sísera gostava de desfrutar de suas vitórias (v. 30)?

A tradução, no versículo 30, de “moça” não é útil. A tradução da ESV diz: “... um ventre ou dois para cada homem...”. Sísera gostava de tomar as mulheres de seus inimigos como escravas sexuais para si e seus homens. Por isso sua mãe presume que o retorno tardio de Sísera se deve ao fato de ele estar atacando mulheres (v. 28-30). Na verdade, o atraso se dá porque uma mulher o está atacando.

Como você se sente agora em relação às ações de Jael? Vingança ou perdão?

Por meio de Débora, Deus diz que Jael é honrada (4.9) e abençoada (5.24). No entanto, ela rompeu com o código estrito de hospitalidade de sua cultura; ela mentiu e matou a sangue frio. Como isso pode se enquadrar com o mandamento de Jesus para amar, abençoar e orar por nossos inimigos (Lc 6.27,28)?! Estamos certos em nos sentirmos divididos ou confusos!

Como as passagens do Novo Testamento a seguir ajudam?

• Apocalipse 11.15-18 • Romanos 12.19,20

Como podemos ter certeza de que Deus “retribui”? Porque vimos o pecado ser julgado na cruz por ele. A cruz não é apenas o lugar onde somos perdoados; ela é a prova de que Deus de fato julga. E como sabemos que Deus retribuirá? Porque, em sua ressurreição, Jesus foi apontado como o futuro juiz (At 17.31).

A morte e ressurreição mudam de modo fundamental a nossa atitude em relação aos nossos inimigos. Queremos ver a justiça sendo feita e sabemos que será feita — louvamos a Deus por isso. Porém, somos livres para amar, abençoar e orar por nossos inimigos. Por causa da cruz, podemos ter a atitude que Jesus teve no madeiro, quando olhou para aqueles que o estavam matando e disse: “... Pai, perdoa-lhes...” (Lc 23.34).

Há alguma pessoa que você esteja julgando por conta própria em vez de deixá-la aos cuidados de Deus?

Você a perdoará e buscará abençoá-la? Como?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 29;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 5.1-31$t$, 29,
$conteudo$N

o final do capítulo 4, Jabim, o rei cananeu, é “destruído”. Em seguida, esperávamos ler sobre o último estágio do ciclo, a paz. E leremos, mas não até o capítulo 5, versículo 31. Primeiro, somos apresentados aos mesmos fatos de um ângulo diferente. Leia Juízes 5.1-31. As diferenças

Quais são as diferenças entre Juízes 4 e 5:

• no estilo? • no tom?

Você notou algum detalhe diferente ou a mais enquanto lia os versículos?

A diferença fundamental entre os dois capítulos é que a abordagem do capítulo 5 é mais teológica. Ela olha por baixo da superfície da história e revela que a mão de Deus estava por trás de tudo. O SENHOR

Que imagem do Senhor obtemos em Juízes 5.4,5?

Por que “os reis de Canaã” experimentaram derrota na batalha, e não vitória (v. 19-22)?

Em um nível superficial, a vitória era de Baraque (4.14,15). Contudo, mesmo no capítulo 4, somos informados de que “o Senhor encaminhou Sísera”. No capítulo 5, descobrimos como fez isso, e Baraque nem sequer é citado como tendo se envolvido em combate!

Qual lição você acha que o povo de Deus deve aprender disso? O povo do SENHOR

Releia Juízes 5.13-18.

Quem lutou com Débora e Baraque?

Quem ficou em casa?

Por que Zebulom e Naftali são escolhidos para um elogio especial (v. 18)?

Qual é a lição? Deus vence. Assim, a bênção deve ser encontrada ao lutar por ele e com ele, colocando-nos a seu serviço. Mantendo a vida em perspectiva

Colocando Juízes 4 e 5 lado a lado, o narrador nos encoraja a ter a perspectiva do capítulo 5 acerca de nossa própria vida, tanto quanto a do capítulo 4. O mundo vive de acordo com o capítulo 4, ou seja, vive pelo que vê. O capítulo 5 nos encoraja a viver pela fé também. Podemos não saber o que

Deus está fazendo em cada acontecimento e em cada parte de nossa vida, mas podemos viver com um contínuo tom de “louvor” por suas vitórias, sabendo que ele está operando.

Isso evita que nos engrandeçamos em demasia quando obtemos sucesso ou que nos desesperemos em nossas lutas. A história que contamos de nossa vida não deveria ser tanto acerca de nós mesmos, mas, sim, a respeito de Deus.

Por que é libertador ser capaz de olhar para nossa vida com a perspectiva de Juízes 5?

O que acontece se esquecermos disso?

Peça a Deus que o capacite a viver pela fé em vez de viver simplesmente pelo que vê. Peça a ele que o ajude a fazer isso em suas lutas, bem como em seus sucessos.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 30;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 6.1-24$t$, 30,
$conteudo$A

história agora é familiar. Israel peca; Deus envia opressão ao povo; o povo clama; Deus o resgata. Mas não dessa vez... Uma reação surpreendente

Leia Juízes 6.1-10.

De que maneira a opressão é pior que nunca (v. 2-6)?

Quando os israelitas clamam (v. 7), o que Deus faz (v. 8)? Por que isso é surpreendente?

O que esse mensageiro diz ao povo:

• a respeito do que Deus fez? • a respeito de como Israel deveria ter reagido? • a respeito do que Israel fez?

Por que Deus envia um sermão antes de enviar salvação? Parece que é para mostrar a Israel que remorso não é o mesmo que arrependimento. Clamavam porque estavam tristes por causa das consequências de seu pecado, ou seja, por causa da opressão. No entanto, não estavam tristes pelo pecado em si, isto é, a respeito de como haviam destruído seu relacionamento com Deus. Não queriam mudar seus amores ou se livrar de seus ídolos. Apenas queriam ter paz para continuar na idolatria.

Leia 2Coríntios 7.10. Para onde a tristeza do mundo (o remorso) nos conduz? Para onde o arrependimento nos conduz?

Pense a respeito da última vez em que você se desculpou perante Deus. Você sentia remorso ou arrependimento?

Você está pecando repetidamente de alguma maneira, pedindo a Deus que limpe sua bagunça e, então, seguindo adiante fazendo a mesma coisa? Você se arrependerá? Uma reação tímida

Leia Juízes 6.11-24.

Não perca de vista a graça de Deus aqui. Não há sinal de que o povo tenha respondido ao sermão. Ainda assim, Deus envia seu anjo para levantar seu juiz. Ele os salva antes que voltassem para ele! Deus não nos salva porque nos arrependemos; nós nos arrependemos porque ele começou a trabalhar em nós e por nós.

Como Gideão se descreve (v. 15)?

Como o anjo descreve Gideão (v. 12,14,16)?

Ambos estão certos! Gideão nunca será capaz de salvar Israel com sua própria força. Com a força de Deus, ele pode fazer qualquer coisa que esteja no propósito do SENHOR.

Quem é o anjo do SENHOR? Às vezes, o anjo fala (p. ex., v. 12,20); em outras ocasiões, somos informados de que o SENHOR está falando (p. ex., v. 14,16,18). Gideão reage como se tivesse visto alguém muito humano (v. 13) e, em seguida, como se tivesse visto o próprio Deus (v. 22). O que está acontecendo?!

Essa figura não é o SENHOR, entretanto também é o SENHOR! Ele se parece com um homem e, ainda assim, tem o poder de Deus. Por isso, há boas razões para considerarmos essa pessoa como sendo o Deus Filho. Sua preocupação, até mesmo naquele momento, era trazer salvação e paz ao seu povo.

Em quais áreas de sua vida você precisa se lembrar de confiar no Senhor hoje?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 31;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 6.25-40$t$, 31,
$conteudo$D

eus chamou Gideão para ser seu próximo juiz, apesar da falta de coragem de Gideão. E, para salvar o povo, Gideão precisa derrotar inimigos em três níveis. O primeiro inimigo

Leia Juízes 6.25-32.

O que Deus diz para Gideão destruir e construir (v. 25,26)?

Por que a identidade do proprietário do altar é uma surpresa?

O pai de Gideão claramente ensinou seu filho a respeito do que Deus havia feito por Israel (v. 13). Ele, porém, também estava adorando Baal e Aserá. O povo não havia abandonado a adoração a Deus, adorando a ídolos somente. Em vez disso, havia conjugado a adoração a Deus com ídolos. Esse é o inimigo no meio do povo.

Isso é o que faz Juízes 6 ser tão familiar. Podemos nos sentar felizes na igreja, ler nossa Bíblia, falar a respeito de Jesus... e sermos controlados por ídolos. Como sabemos? Porque se alguém ameaça nossos ídolos, ficamos furiosos (v. 30). Lembre-se, porém, do sermão de Deus nos versículos de 8 a 10. Ele não quer remover nossos problemas de nossa vida, mas, sim, remover nossos ídolos de nosso coração.

Vale a pena nos perguntarmos: O que há em minha vida que, caso fosse tirado de mim, me faria sentir como se eu não pudesse continuar? O que me levaria a me revoltar para manter? Essa é uma boa maneira de começar a identificar nossos ídolos.

Quais são os seus ídolos?

Você os destruirá e entregará essa área de sua vida a Deus, encontrando sua bênção e segurança nele? O segundo inimigo

Leia Juízes 6.33-35.

Qual é o inimigo que está em volta de Israel (v. 33)?

Como Deus fortalece Gideão? E qual foi o resultado (v. 34)? O terceiro inimigo

Leia Juízes 6.36-40.

Gideão ainda está inseguro a respeito de quê (v. 36)?

O inimigo dentro de Gideão é a dúvida.

Qual era a finalidade da porção de lã? Não se trata de um pedido de orientação. Gideão vive em um mundo onde as forças naturais são adoradas como deuses. Ele está pedindo garantias de que o SENHOR não é meramente uma força da natureza, mas, sim, poderoso sobre ela. Ele quer compreender a natureza de Deus e, assim, fortalecer sua fé.

Hoje, vivemos em um período posterior à autorrevelação de Deus em seu Filho, que foi registrada para nós na Bíblia (Hb 1.1,2). Quando duvidamos das promessas de Deus, não “colocamos uma porção de lã na eira”; podemos ler a Escritura, pedindo que Deus nos direcione para seu Filho enquanto oramos: “... Eu creio! Ajuda-me a superar minha incredulidade!” (Mc 9.24).

Como isso encoraja/desafia a maneira com que você lida com suas dúvidas/decisões?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 32;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 7.1-23$t$, 32,
$conteudo$A

qui, vemos Deus fazendo seu próprio servo cada vez mais fraco. Por que Deus enfraqueceria seu povo — naquele tempo e atualmente —, e não os seus inimigos? Menos é mais

Leia Juízes 7.1-8a.

Midiã aterrorizou Israel por sete anos. Agora, o exército de Gideão está acampado próximo a ele, pronto para a batalha. Israel precisará de cada homem que puder reunir para derrotar um inimigo tão formidável.

No entanto, o que Deus pede que Gideão faça:

• no versículo 3? • nos versículos de 4 a 8?

Esse conselho não está presente em nenhum manual militar!

Por que Deus quer reduzir o exército de 32 mil homens para trezentos (v. 2)?

Orgulhamo-nos em relação à pessoa ou às pessoas que acreditamos merecer glória e honra.

Então, por que pensar que “sua própria força o salvou” seria uma forma de o povo de Israel se vangloriar “contra” Deus?

Assim que acreditamos merecer crédito pela salvação — seja de Midiã na ocasião, seja do pecado, da morte e do inferno eternamente —, nós nos estabelecemos como salvadores alternativos, merecedores alternativos de louvor. Se Israel vencesse com um exército de 32 mil homens, ele seria capaz de acreditar que o exército o salvou. A lição que Deus ensinará por meio dos trezentos é que a vitória é dele.

De que modo as ações de Gideão, no versículo 8, demonstram grande fé na força de Deus?

Leia 2Coríntios 12.7-10.

O que Deus fez a Paulo? Por quê?

Paulo está dizendo: “Veja como eu sou fraco. É evidente que tudo aquilo que tem sido alcançado foi alcançado por Deus. Quão forte ele é por ser capaz de operar por meio de um homem fraco como eu! A ele a glória!”. Vitória anunciada

Leia Juízes 7.8b-15.

Como Deus reconforta Gideão aqui?

O versículo 15 nos mostra o que acontece quando permitimos que Deus nos reconforte em relação à sua força e às suas promessas. Louvamos e adoramos a Deus, e agimos integralmente em obediência a ele. Vitória concedida

Leia Juízes 7.16-23.

Quantos soldados inimigos Gideão e seus trezentos homens mataram?

Esse triunfo é verdadeiramente uma dádiva de Deus. Foi uma vitória, apesar da fraqueza de Israel e por meio dela!

Pai,

ajuda-me a não desejar ser forte, nem receber glória para mim mesmo.

Ajuda-me a aceitar a fraqueza, de modo que eu possa mostrar a tua força por meu intermédio, e, assim, lembre-me de te louvar.

Mostra-me como posso obedecer a ti em minha fraqueza para que tu possas mostrar a tua grandeza.

Amém.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 33;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 7.24—8.21$t$, 33,
$conteudo$A

nteriormente, o ciclo de cada juiz terminou com um período de paz, seguido por sua morte. Com Gideão, no entanto, não é tão simples assim, pois, como veremos, ele falhou em aprender a “lição dos trezentos” que Deus queria ensinar a ele e ao povo. Lembre-se da lição dos trezentos: é Deus quem dá a vitória; assim, é Deus quem merece toda a honra, toda a glória e todo o louvor. A tribo

Leia Juízes 7.24—8.3.

Gideão chama a tribo de Efraim para ajudá-lo a dar cabo de Midiã (7.24,25).

O que foi, porém, que irritou os homens de Efraim (8.1)?

A crítica deles nasce por terem perdido a glória da vitória. Mas essa glória pertence somente a Deus! A acusação do SENHOR de que Israel ama se “vangloriar contra mim” se prova correta. As cidades

Leia Juízes 8.4-21.

Quando Gideão pede às cidades israelitas de Sucote e Peniel que o ajudem com seus homens desgastados, como essas duas cidades respondem (v. 6,8)?

Eles sabem que Gideão ainda não capturou os reis midianitas (v. 5) e que, se Gideão fracassar em derrotar completamente Midiã, o inimigo, então, se reagrupará, retornará e destruirá qualquer cidade que tenha ajudado Gideão.

Eles também falharam em aprender a lição dos trezentos, isto é, que Deus vence. O juiz

Como Gideão responde às cidades (v. 7,9)?

Quando capturou os reis midianitas, de que modo ele trata as duas cidades (v. 13-17)?

Por que Gideão é tão violento? Porque ele sente que essas cidades não o respeitam. Sua ira contra eles demonstra ter esquecido que é Deus que deve ser glorificado, e não ele. Gideão fala a respeito de como retornará em triunfo (v. 9). Ele não diz a essas cidades: “Sim, eu sou fraco, mas Deus é forte. Confie nele, não em mim, e junte-se a nós!”. Ele diz: “Você ousa duvidar de mim? Vou lhes mostrar o meu poder quando eu retornar — então vocês me darão o respeito que mereço”.

A fome de Gideão por honra e sua ira por lhe terem negado tal honra mostram que o sucesso foi a pior coisa que lhe aconteceu.

Nosso coração também está desesperado para acreditar que merecemos louvor e glória.

Sua frustração sempre aumenta em situações em que não recebe o reconhecimento que sente merecer?

O que o seu coração faz nesse momento?

Em quais áreas de sua vida você é bem-sucedido? De que maneira isso é espiritualmente perigoso?

A melhor maneira de se lembrar de não buscar glória para nós mesmos é dá-la a Deus! Leia Efésios 2.8-10 e use-o para alimentar o seu louvor ao Senhor.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 34;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 8.22-31$t$, 34,
$conteudo$V

imos no devocional anterior que o sucesso é um cálice envenenado. E assim é também com a paz. Leia Juízes 8.22-31. Quem reina?

O que Israel quer que Gideão seja e por quê (v. 22)?

De que maneira o povo esqueceu a lição dos trezentos?

Nesse momento na história de Israel, Deus decidiu nomear juízes para liderar o povo sob seu comando. Se Gideão tivesse dito “sim”, Israel teria tido um rei nomeado pelo povo, com o governo sendo passado adiante como uma herança familiar. Os reis eram ricos, exerciam grande influência e tinham grandes famílias como uma fonte de poder. O povo queria ser governado por um homem, e não por Deus; assim também Gideão entendeu (v. 23).

De que modo os cristãos hoje em dia deixam às vezes um líder cristão tomar o lugar de Deus? Por que fazem isso? Quem realmente reina?

O versículo 23, lamentavelmente, é a última vez em que Gideão lembra quem é Deus e quem ele é. Ele diz: “Eu não reinarei sobre vocês porque o SENHOR reina sobre vocês. Ele merece a honra, a glória e o poder”.

Como, então, as ações de Gideão nos versículos de 24 a 27 e de 29 a 31 comprometem suas palavras?

Que efeito tudo isso tem em Israel (v. 27)?

Deus disse que o éfode — uma couraça ou chapa de ouro — (v. 27) deveria ser vestido pelo sumo sacerdote no Tabernáculo, que era a tenda onde Deus habitava em meio a seu povo (Êx 28.29,30). O éfode tinha duas pedras, chamadas Urim e Tumim, que eram usadas para pedir a orientação de Deus e para que ele indicasse suas decisões. Nessa época, o Tabernáculo estava em Siló (Jz 18.31).

Por que teria sido atrativo para Gideão colocar um éfode alternativo na cidade onde vivia?

Israel agora está em “paz” (8.28). Em que sentido isso é uma paz enganosa?

Como Gideão pode rejeitar o reinado por saber que Deus é rei e, em seguida, agir como um rei?! Porque ele sabia de algo intelectualmente que não havia prendido de verdade o seu coração. Ele estava falhando em viver aquilo que sabia ser verdadeiro.

Os tempos de sucesso e os tempos de paz são perigosos! Quando estamos lutando e nos sentimos fracos, sabemos que precisamos de Deus. Quando tudo está bem, é muito fácil olhar para os outros, depender de nós mesmos e buscar honra para nós mesmos.

Agradeça a Deus, pois ele é Rei e Resgatador.

Peça a ele que o ajude a não procurar por bênçãos em outros lugares e a não buscar honra para si mesmo.

Fale com o Senhor a respeito de quaisquer áreas de sua vida em que exista uma desconexão entre o que você sabe a respeito de como Deus quer que viva e como está vivendo.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 35;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 8.29—10.5$t$, 35,
$conteudo$V

imos desvios significativos do ciclo comum do livro de Juízes durante o período em que Gideão foi juiz. Vemos agora que não há qualquer sinal desse ciclo na vida do próximo governante. Leia Juízes 8.29—9.57. O antijuiz

Por que os cidadãos de Siquém escolheram Abimeleque como líder (9.2,3)?

De que maneira Abimeleque obtém poder (v. 4,5)?

Abimeleque aprendeu todas as lições erradas de seu pai, Gideão. Ele quer poder para a sua própria honra, e não para ajudar outras pessoas. Ele traz morte, e não paz. Nem sequer finge acreditar que Deus é rei; sente-se feliz em ser coroado rei em lugar de Deus. A queda

Humanamente falando, o que leva à queda de Abimeleque (v. 26-55)?

O que os versículos 23, 24, 56 e 57 nos dizem que estava acontecendo nos “bastidores”?

Deus está em completo silêncio. Mas não está ausente. Por meio daquilo que parecia ser o curso normal dos acontecimentos, ele estava agindo com juízo. Como diz Paulo, “a ira de Deus está sendo revelada do céu contra toda impiedade e injustiça dos homens, que impedem a verdade pela sua injustiça” (Rm 1.18).

Esse capítulo nos indica três verdades a respeito do juízo vigente de Deus:

• Ele vem de maneira despercebida. Ninguém na ocasião poderia ter visto o espírito que Deus enviou. • Ele vem após um período de espera. Levou três anos entre o aviso de Jotão e o início do juízo (v. 22,23). • Ele vem em decorrência do pecado humano. Foram os grandes pe cados de Siquém e Abimeleque que constituíram sua queda. O juízo de Deus sobre as pessoas é entregá-las às consequências de seus pecados.

De que maneira a realidade e a natureza do juízo vigente de Deus provoca tanto encorajamento quanto humildade? Salvação

Leia Juízes 10.1-5.

De que ou de quem, segundo o texto bíblico, Tolá salvou Israel?

Nada é contado! Ou melhor, já sabemos! Todos os outros juízes salvaram Israel de outros inimigos. Tolá, no entanto, precisou salvar Israel dele mesmo, do pecado e das suas consequências que vimos no capítulo 9. O final da vida de Gideão e a vida de Abimeleque como um todo nos mostram que, em última análise, o maior problema do povo de Deus é... bem, somos nós mesmos. Desse modo, precisamos mais de salvação daquilo que está dentro de nós — nosso próprio pecado — do que daquilo que está ao nosso redor.

Leia Tito 3.3-5.

Agradeça a Deus sua graça em salvá-lo de você mesmo e renová-lo à imagem dele. Peça a ele que continue a ajudá-lo a viver sob seu comando, honrando-o e desfrutando dele.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 36;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 10.6—11.11$t$, 36,
$conteudo$C

om o próximo episódio, que se concentra em Jefté, a história de Israel retorna ao ciclo de repetição:

Leia Juízes 10.6-10. Como podemos ver os primeiros quatro estágios do ciclo de Juízes aqui? O que esperaríamos que acontecesse em seguida? A reviravolta

Leia Juízes 10.11-16.

Como Deus responde (v. 11-14)? Qual questão ele está levantando?

Os israelitas compreendem a questão. O pedido deles no versículo 15 é diferente daquele que está presente no versículo 10. Eles dizem: “Faça conosco conforme desejar; no entanto, ainda suplicamos por miseri córdia”. Nos versículos 9 e 10, eles simplesmente queriam que sua angústia fosse removida. Agora, porém, querem um relacionamento com Deus independentemente de seu sofrimento terminar. Querem Deus, e não apenas aquilo que ele dá.

De que maneira o versículo 16a mostra que Israel realmente mudou?

O arrependimento vai além da superfície. Os dois sinais de arrependimento verdadeiro são:

• tristeza pelo pecado, e não apenas por suas consequências; • tristeza por motivações idólatras, e não apenas por mudança comportamental.

Reflita sobre algumas maneiras pelas quais você tem pecado durante a última semana. Qual ídolo você estava adorando naquele momento?

Você realmente se arrependeu disso?

Sobre quais aspectos da perfeição de Deus você meditará, de modo que você o ame mais do que ama aquilo que ele pode lhe dar? O líder do bando

Leia Juízes 10.17—11.11.

De quais maneiras Jefté é um salvador improvável (11.1-3)?

Observe que o povo trata Jefté do mesmo modo que tratava Deus. Ele o rejeitou (v. 2) e, mesmo assim, presume que ele o ajudará (v. 5,6). Querem que ele os resgate, mas não que os governe como seu líder (v. 6). Assim como Deus fez, Jefté faz com que eles peçam de maneira mais humilde, fazendo-os aceitar o fato de que, junto com o resgate, vem o governo.

Todos os juízes apontam para Jesus. Assim, alguém que rejeita a Jesus está rejeitando a Deus, não importa quanto afirme conhecê-lo ou respeitá-lo. E qualquer um que tenha sido resgatado por Jesus o terá como governante.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 37;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 11.12-29$t$, 37,
$conteudo$I

srael voltou para Deus e este lhe deu um juiz, Jefté. Porém, Jefté não vai imediatamente para a guerra contra os inimigos de Israel. Leia Juízes 11.12-29. Jefté busca uma resolução pacífica. Desse modo, ele pergunta ao rei de Amom: “... O que tens contra mim para que tenhas atacado o meu país?” (v. 12). A resposta do rei, no versículo 13, é que algumas das terras em que Israel habita pertenceram anteriormente aos amonitas. Assim, Israel deveria “restituílas pacificamente”. Três argumentos

Os versículos de 15 a 22 são um argumento histórico.

De quem, e como, Israel obteve a terra que agora está sob disputa (v. 19-22)?

Os amonitas (nome semelhante aos amoritas, mas completamente diferentes deles!) nunca haviam habitado nessa terra!

Em seguida, Jefté usa um argumento teológico (v. 23,24).

Que ponto ele está destacando no versículo 23?

O que os amonitas deveriam fazer (v. 24)?

Há duas maneiras de entender isso. A primeira é que Jefté está se acomodando à cosmovisão pagã dos amonitas — isto é, o “deus” de cada nação dá àquela nação uma porção de terra —, embora ele saiba que isso é errado, pois o SENHOR reina sobre tudo.

A outra maneira de entender é que Jefté adotou essa visão — isto é, ele conhece tão pouco a respeito do SENHOR que o vê como um deus entre muitos.

Em terceiro lugar, Jefté utiliza um argumento jurídico (v. 25-27). Na época em que Israel tomou essa terra na batalha, ninguém desafiou o seu direito a ela. A resposta

Todos os três argumentos provam que são os amonitas que estão errados, e não Israel.

Como o rei de Amom responde (v. 28)?

Como Deus responde ao rei de Amom (v. 29)?

A diplomacia se exauriu. A guerra agora é inevitável. No entanto, o uso que Jefté faz da caneta antes da espada é importante. A verdade precisa ser contada, e a paz precisa ser buscada, embora ela nem sempre triunfe. Ao fazer isso, Jefté acaba nos direcionando para um líder maior...

Leia 1Pedro 2.21-25.

Seguimos um Salvador cuja verdade foi ridicularizada, cuja justiça foi ignorada e que, no entanto, não comprometeu nenhuma delas. Jefté nos dá um exemplo parcial de como enfrentar acusações injustas; Cristo, por sua vez, nos dá um exemplo supremo.

Quão parecido com o Senhor Jesus você estava (ou não estava) na última vez em que lidou com uma acusação ou crítica injustas?

De que maneira os exemplos de Jefté e de Jesus irão moldar a sua reação da próxima vez?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 38;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 11.29—12.8$t$, 38,
$conteudo$O

Espírito de Deus vem sobre Jefté (v. 29). Por isso o resultado da batalha que se aproxima é certo. Não obstante, Jefté não compreende isso, gerando consequências trágicas... Um juramento terrível

Leia Juízes 11.29-33.

Qual promessa Jefté faz (v. 30,31)?

Por que essa oferta de “acordo” é desnecessária?

O SENHOR concede uma vitória total (v. 32,33). Agora a paz deve existir. Contudo... Uma morte terrível

Leia Juízes 11.34-40.

Essa é uma história terrível. Muitos pensam que Jefté prometeu a Deus um sacrifício animal. No entanto, o substantivo no original não está na forma apropriada para se referir a animais. Além disso, se tivesse prometido a Deus o primeiro animal de sua casa, ele nunca teria se considerado obrigado a sacrificar sua filha. Jefté prometeu um sacri fício humano.

Dessa forma, por que Jefté fez e manteve tal juramento? Deus odeia sacrifício humano (Dt 12.31). Apesar disso, parece que, por meio da crueldade do mundo à sua volta, Jefté havia se dessensibilizado profundamente para com a violência. O mundo o havia prensado em seu molde. Em segundo lugar, o sacrifício humano era a maneira pela qual alguém poderia “subornar” um deus pagão; Jefté parece ter pensado que o SENHOR precisava ser impressionado e comprado com uma “oferta” extravagante. A tragédia em tudo isso é que Deus já havia agido para salvar seu povo pecaminoso (10.16) e capacitado Jefté para trazer essa salvação (11.29).

Jefté dera muito mais ouvidos à sua cultura, e muito menos ouvidos às Escrituras, do que ele percebeu. E, assim, ele conhecia a Deus muito menos bem do que precisava. É fácil enxergarmos isso em Jefté; muito mais difícil, porém, é enxergar isso em nós mesmos. Precisamos fazer duas perguntas a nós mesmos:

Estou lendo a Bíblia com regularidade e humildade, pedindo a Deus que mostre meus pontos cegos?

Como eu viveria de modo mais decisivo ou tranquilo se realmente acreditasse que Deus está completamente comprometido comigo, em me amar e abençoar? Uma guerra terrível

Leia Juízes 12.1-8.

Jefté era diplomático em relação àqueles que estavam fora de Israel (11.14-28). Aqui, no entanto, ele não hesita em atacar pessoas entre o povo de Deus que se opõem a ele. Ele trata o povo de Deus muito pior do que trata o mundo.

De que modo você pode ser muito apressado em julgar outros cristãos?

Há alguma pessoa em sua igreja a quem você esteja se recusando a perdoar porque, no fundo, gosta de poder olhá-la com desprezo ou evitá-la?

Como esse cenário de fé verdadeira o desafia? E por quê?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 39;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 13.1-7$t$, 39,
$conteudo$S

ansão, o último dos juízes nesse livro, é famoso por seus cabelos longos e sua força. Sua história, porém, é muito mais profunda e mais intrigante do que isso. Leia Juízes 13.1-7. O que o pecado é

O que Israel faz mais uma vez (v. 1)?

Essa expressão é repetida ao longo do livro de Juízes (p. ex., 2.11; 10.6). Ela nos mostra que muitas coisas que os israelitas fizeram não eram más aos seus olhos. No entanto, eram más aos olhos de Deus.

O que isso nos ensina a respeito do que faz o pecado ser pecado?

O que isso nos ensina a respeito do perigo do pecado?

No cerne do pecado encontra-se a idolatria — e os ídolos são enganosos. Eles nos dizem, e fazem com que a sociedade em que vivemos nos diga, que adorá-los é sensato, prudente e sábio, quando, na verdade, estamos fazendo o que é mau diante dos únicos olhos no Universo que realmente importam.

Por que é libertador saber que os olhos de Deus são os únicos que realmente importam?

Como a sua vida refletirá hoje a verdade de que a opinião de Deus tem mais importância do que a sua e do que a de outras pessoas? Como Deus opera

O que o anjo promete (v. 3)?

Humanamente falando, por que isso é impossível (v. 2)?

O que o anjo lhe diz a respeito de como essa criança viverá e do que ela fará (v. 4,5)?

O propósito do voto de nazireu, estabelecido em Números 6.1-21, era pedir pelo auxílio especial de Deus durante um momento crucial. Era um sinal de que alguém estava olhando para Deus com grande intensidade e foco. Normalmente, o voto era feito de maneira voluntária e por um período de tempo definido.

Quão diferente era esse voto de nazireu?

Esse é um nascimento especial, pois se trata de um nascimento im possível. Por isso ele nos direciona para o nascimento mais especial de todos, o qual aconteceu mais de um milênio depois. A concepção de Jesus, no entanto, não é a única semelhante à de Sansão. Por meio de mulheres estéreis, Deus trouxe ao mundo Isaque, Samuel e João Batista (Gn 11.30; 21.1-3; 1Sm 1.5-7,19,20; Lc 1.7,11-17).

Deus muitas vezes tem operado por meio de uma criança cuja existência, humanamente falando, é impossível. Ao fazer isso, ele mostra que a operação de sua salvação é algo que nenhum ser humano pode controlar; e que somente ele é aquele que “dá vida aos mortos e chama à existência coisas que não existem, como se existissem” (Rm 4.17).

Como esse lembrete de quem é Deus e de como ele opera encoraja e/ou conforta você hoje?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 40;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 13.6-25$t$, 40,
$conteudo$C

omo você cria um bebê que foi concebido por meio de intervenção divina e que está destinado a ser o instrumento de Deus para resgatar seu povo? Dê-nos normas

Leia Juízes 13.6-8.

Por que Manoá quer que o anjo retorne (v. 8)?

Alguns consideram que isso foi falta de fé. Observe, porém, que Manoá acredita que a promessa se cumprirá. Seu pedido não é para que se apresente uma prova de que o menino nasceria, mas, sim, de ajuda acerca de como criar esse menino.

Leia Juízes 13.9-18.

Quando o anjo retorna, Manoá lhe pergunta a respeito da “norma” para a vida de seu filho (v. 12).

Que outra informação ele obtém (v. 14)?

Naquela cultura, comer com alguém ou saber o nome de alguém era estabelecer um relacionamento, com deveres de ambos os lados. Parece que Manoá ainda está tentando fazer com que o anjo lhe dê normas mais detalhadas acerca de como criar esse menino.

Como o anjo responde a essas tentativas (v. 16,18)?

Não importa o que Manoá tente, o anjo não lhe dá as normas que ele deseja. Melhor do que normas

Leia Juízes 13.19-25.

Por que o anjo retornaria se ele não tinha nada a dizer a Manoá? Manoá orou por ajuda, e esta lhe foi aparentemente recusada. Na verdade, porém, Manoá conseguiu a ajuda de que precisava, mas não da forma que estava pedindo. Ele queria uma “norma” (v. 12), queria regulamentos. E não obteve isso...

O que o anjo fez em vez disso (v. 19,20)?

É provável que o anjo do SENHOR seja na verdade o Filho de Deus (veja o estudo 31). Assim, Deus está dando a Manoá uma experiência inesquecível de sua grandeza e maravilha. E, uma vez que eles não morrem em sua presença (v. 22,23), Deus também está lhes dando uma garantia de sua bondade.

Manoá não receberá normas, pois ele está recebendo a Deus. Essa é uma mensagem para todos nós. Pensamos que precisamos de normas, mas precisamos conhecer Deus. Deus não nos dá, nem dará, um manual para todas as reviravoltas da vida, para cada dúvida e decisão. Não obtemos muitas prescrições e, diferentemente de Manoá, não obtemos uma aparição do anjo do SENHOR. Por meio do Espírito Santo, obtemos Deus.

Existem maneiras pelas quais você não esteja desfrutando de seu relacionamento com o Deus vivo porque:

• você está obedecendo às suas “normas” de maneira relutante? • você está desejando que ele lhe dê algumas normas?

Agradeça a Deus agora o fato de você conhecê-lo.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 41;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 14.1-20$t$, 41,
$conteudo$A

história de Sansão é uma potente combinação de sexo, violência, morte e poder — exatamente o tipo de coisa presente em um filme de ação de verão! Encontrando uma esposa

Leia Juízes 14.1-4.

Como é descrita a mulher com a qual Sansão quer se casar (v. 1,2)?

Por que seus pais não querem que ele se case com ela (v. 3)?

O problema deles não é com o casamento inter-racial, mas, sim, com o casamento de fé conflitante. Deus havia dito ao seu povo que Israel não deveria se aliar nem se casar com povos que não conheciam Deus (Êx 34.15,16), porque ele sabia que seu povo ia “se prostituir com seus deuses”.

Ainda assim, o homem que deveria estar lutando contra os filisteus (Jz 13.5) está se casando com uma filha desse povo. Sansão é um líder que reflete o verdadeiro estado espiritual de Israel. Ele é impulsivo e não ensinável, e adotou os valores e as visões dos filisteus.

Você consegue pensar nas maneiras pelas quais você ou sua igreja adotou no passado visões da cultura ao redor a respeito do que é importante na vida?

Por que é tão atraente para igrejas e crentes moldarem-se à cultura?

Sansão insiste que “ela é a mulher certa para mim” (literalmente, “ela é certa aos meus olhos”, v. 3b).

O que seus pais e o próprio Sansão não sabem (v. 4)?

Esse versículo é a chave para entender toda a história. Deus usará a fraqueza de Sansão para promover o confronto entre as duas nações. Conforme a história se desenrola, veremos todos atuando com base em seu próprio caráter impiedoso — e Deus usando tudo isso a fim de assegurar que a libertação de Israel dos filisteus tenha o seu início.

Você consegue pensar nas vezes em que Deus usou as falhas que você tem para promover o bem? Agradeça-lhe essa graça.

Peça a Deus que o use para os bons propósitos dele hoje, não somente apesar de suas fraquezas, mas até mesmo em suas fraquezas! Iniciando uma luta

Leia Juízes 14.5-20.

Como nazireu, Sansão não deve tocar em coisas mortas ou beber álcool. Se assim ele o fizer, deve ir diretamente ao Tabernáculo para ser purificado.

De que maneira ele despreza esse voto...

• nos versículos de 5 a 9? • no versículo 10 (“festa” quer dizer, literalmente, “festa de bebedeira”)?

De que maneira Sansão usa a força que lhe foi dada por Deus no versículo 19?

O juiz de Israel não luta para libertar o povo, mas, sim, para liquidar suas dívidas.

Quais dons você recebeu de Deus? Como você pode usá-los hoje?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 42;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 15.1-20$t$, 42,
$conteudo$A

esta altura, conhecemos o suficiente sobre Sansão para saber que é improvável que reaja de maneira pacífica ao fato de sua noiva se casar com outro homem. Ciclo vicioso

Leia Juízes 15.1-8.

De que maneira o nível de violência aumenta ao longo desses versículos?

Que imagem obtemos:

• dos filisteus? • do juiz de Israel?

Vemos novamente que Sansão é como os inimigos de Deus! Suas reações e “soluções” são iguais às deles. De que lado?

Leia Juízes 15.9-13.

Qual é o alvo dos filisteus (v. 10)?

De que lado a tribo de Judá demonstra estar? Por quê (v. 11)?

Eles podem carregar o nome do povo de Deus, mas Judá prefere viver em paz com o mundo e adorar seus ídolos a ser liberto para adorar a Deus; e preferiam eliminar seu próprio resgatador a arriscar um confronto com os filisteus.

Como povo de Deus hoje, é sempre mais fácil viver como o mundo do que viver sob o governo de Jesus. Sempre é mais confortável pedir que Jesus pare de nos fazer exigências do que aceitar o risco e o custo de viver para ele.

Em quais áreas da sua vida você está sob pressão para tomar a rota mais fácil neste momento? Vitória de quem?

Leia Juízes 15.14-20.

Por que Sansão é capaz de fugir (v. 14,15)?

Sansão dá crédito por sua vitória a que coisa (v. 16)?

No versículo 18, Sansão (pela primeira vez) fala ao Deus que o escolheu e o capacitou. Sua oração, no entanto, não é humilde ou fiel. Ele basicamente exige que Deus o ajude e queixa-se de que ele não está fazendo isso — o que é uma atitude de extrema ignorância, uma vez que o Espírito de Deus já o havia resgatado de um leão, de uma aposta perdida e de mil filisteus.

Sansão usa a força de Deus, mas não vive na dependência de Deus, exceto em situações extremas. Ele é um líder profundamente falho de um povo profundamente falho... Ainda assim, porém, Deus, de maneira surpreendente, está trabalhando o tempo todo para “iniciar a libertação de Israel das mãos dos filisteus” (13.5).

Agradeça a Deus que tenha trabalhado por seu povo mesmo quando seu povo está trabalhando contra ele.

Ore para que você tenha olhos para ver, e coração para louvar a Deus, quando ele o ajudar. Peça que o ajude a depender dele em oração hoje, quer tudo vá bem, quer tudo vá mal.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 43;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 15.20—16.21$t$, 43,
$conteudo$“S

ansão liderou Israel por vinte anos...” (15.20). Entretanto, não foi bem um governo, pois, diferentemente dos juízes anteriores, ele não havia resgatado Israel de seus inimigos. Previsível

Leia Juízes 15.20—16.3.

Essa seção resume Sansão. Por causa de sua fraqueza por mulheres (v. 1), ele foi atraído para uma situação extremamente perigosa (v. 2) e usa sua força, dada por Deus, para fugir (v. 3). Quanto mais Deus abençoava Sansão com força para combater seus inimigos, mais Sansão se tornava confiante em sua própria invulnerabilidade e mais ele vivia segundo aquilo que entendia ser apropriado. O coração de Sansão usou as bênçãos de Deus como razão para esquecer-se de Deus, e não para obedecer a ele.

O sucesso é espiritualmente perigoso!

De que maneira ele pode ser perigoso para você?

Qual é o momento em que você mais precisa pensar: “Esse sucesso veio em minha vida em virtude da bondade de Deus para comigo, e não porque eu sou autossuficiente”? A derrocada

Leia Juízes 16.4-21.

O que provoca a derrocada de Sansão?

Por que Dalila o trai (v. 5)?

Por que Sansão permaneceu com Dalila mesmo depois do que aconteceu nos versículos 8 e 9?! Talvez a situação de perigo lhe proporcionasse um êxtase. É mais provável, porém, que ele sentisse tanta necessidade daquilo que Dalila lhe proporcionava que se recusava a enxergar as motivações dela.

Esse casal é um caso extremo em que ambos usaram um ao outro em vez de servirem um ao outro. Eles dizem entre si: “Estou com você porque o[a] amo”; mas, na verdade, querem dizer: “Estou com você porque você é muito útil para mim”. Não há dúvida de que havia muita paixão. Não obstante, tudo era feito mediante uma motivação de autofavorecimento, e não de autodoação. Sansão estava usando Dalila para obter amor sexual e para (provavelmente) sentir a emoção do perigo. Ela, por sua vez, o estava usando para obter fortuna e fama.

O que acaba acontecendo com Sansão (v. 21)?

Por quê (v. 20)?

Toda essa história nunca foi a respeito do cabelo de Sansão, mas, sim, a respeito de Deus e de sua generosidade — que agora foi retirada. Sem Deus, Sansão não é nada.

C. S. Lewis fez uma distinção entre dois tipos de “amor”: “O amor carente lamuria de nossa miséria; o amor dadivoso deseja servir [...] O amor carente diz a respeito de uma mulher: ‘Eu não posso viver sem ela’; o amor dadivoso deseja proporcionar felicidade a ela”.

A menos que você tenha uma experiência do amor de Deus que satisfaz suas necessidades mais profundas, terá a tendência de usar outras pessoas para se promover ou provar o seu mérito.

De que maneira essa verdade — vista de modo tão destrutivo em Sansão e Dalila — desafia você em seus relacionamentos? Como ela encoraja você como cristão?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 44;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 16.22-31$t$, 44,
$conteudo$O

homem que havia queimado as plantações dos filisteus (15.4,5) limita-se agora a moer os grãos (16.21). Pela primeira vez no livro de Juízes, o juiz escolhido de Deus foi derrotado. Não se trata do cabelo

Leia Juízes 16.22.

Por que os filisteus deixaram o cabelo de Sansão crescer novamente? Deve ter sido porque pensavam que Deus nunca abençoaria Sansão novamente, uma vez que ele quebrara seu voto. Deus, porém, não está sujeito ou limitado à obediência de seu povo. Ele é fiel às suas promessas mesmo quando seu povo é infiel. Uma oração fiel

Leia Juízes 16.23-31.

A verdadeira disputa se dá entre Yahweh (“o SENHOR”) e Dagom, o deus dos filisteus. Quem é mais forte? A quem Israel deve servir?

Qual parece ser a resposta para essas perguntas nos versículos de 23 a 25?

De que maneira os versículos de 26 a 30 fornecem a verdadeira resposta?

Por fim, no versículo 28, Sansão mostra a verdadeira fé em Deus. Uma humildade recém-descoberta está presente. Ele reconhece que Yahweh é soberano e admite que depende de Deus para obter sua força. Sansão está preparado para morrer (v. 30) a fim de realizar o papel que Deus lhe outorgou em vez de usar a força que Deus lhe deu para salvar a si mesmo.

Fazemos o que fazemos somente por causa da graça de Deus, e essa graça nos é dada para que possamos fazer aquilo que lhe agrada.

Em que momento você acha mais fácil se esquecer disso? Por quê?

De que modo você se certificará de lembrar disso?! Uma sombra de Jesus

A morte do juiz de Deus, para libertar seu povo, direciona-nos para a morte do Filho de Deus.

Tanto Sansão quanto Jesus:

• foram traídos por alguém próximo a eles; • foram entregues a opressores gentios; • foram torturados e acorrentados; • realizaram algo que lhes foi exigido;

• morreram de braços abertos; • pareciam estar completamente assolados por seus inimigos (Dagom e Satanás), mas, por meio de suas mortes, esmagaram tais inimigos e quebraram o poder que eles tinham sobre o povo de Deus.

Existem, entretanto, duas diferenças cruciais:

• Sansão estava no templo de Dagom em consequência de sua desobediência teimosa. Jesus estava na cruz em consequência de sua obediên cia perfeita e de nossa desobediência teimosa. • A morte de Sansão inicia a libertação (13.5); a morte de Jesus conquistou libertação “de uma vez por todas”, um resgate final (veja 1Pe 3.18; Hb 10.10).

Dedique algum tempo pensando a respeito da morte de Jesus, acerca das semelhanças com a morte de Sansão e diferenças dela, e louve a Deus por esse grande resgate.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 45;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 17.1-12$t$, 45,
$conteudo$A

morte de Sansão é, de certo modo, o fim da história do livro de Juízes. No entanto, há mais quatro capítulos no final do livro! Esses quatro capítulos finais se distanciam da estrutura narrativa do início. Eles nos apresentam dois episódios detalhados de como era a vida em Israel durante os períodos em que Israel rejeitava a Deus. O cenário é desolador. Compensando

Leia Juízes 17.1,2.

Como é Mica?

Como é a mãe de Mica?

Pelo menos a mãe de Mica declara que é o SENHOR quem dá as bênçãos. Trata-se de uma família que adora o Deus de Israel, porém nominalmente...

Leia Juízes 17.3-12.

O que a mãe de Mica decide fazer com a prata que agora foi restituída (v. 3)?

Quanto da prata ela realmente usa para esse propósito (v. 4)?

O que Mica faz em seguida (v. 5,7-12)?

Deus havia dito a seu povo que não adorasse imagens (Êx 20.4); que tivesse uma devoção absoluta a ele, assim como ele tinha um compromisso absoluto com seu povo (Êx 19.3-6); que deveria conhecêlo e lhe fazer sacrifícios em seu Tabernáculo, o qual, naquele momento, estava em Siló (Jz 18.31); que apenas aqueles que pertenciam à tribo de Levi deveriam ser sacerdotes, estabelecidos em cidades específicas.

De que maneira o final do versículo 6 é, então, um bom resumo da religião de Mica? O problema da imagem

O verdadeiro problema com a adoração por meio de imagens é o desejo de moldar e corrigir Deus — recusar-se a deixar que Deus “seja ele mesmo” em nossa vida. Assim, adoramos uma imagem de Deus distorcida sempre que dizemos: “Gosto de pensar em Deus como...”, ou: “Não consigo crer em um Deus que...”; ou, de modo mais sutil, quando simplesmente não pensamos a respeito das implicações da revelação de Deus em nossa própria vida.

Por que isso é tão problemático? Porque torna impossível ter um relacionamento verdadeiramente pessoal com Deus. Em um relacionamento com uma pessoa real, ela pode o contradizer, entristecer, pode lhe fazer exigências, e você tem de enfrentar esse problema e lidar com ele. Quando

“reimaginamos” Deus, estamos trocando o verdadeiro Deus por outro muito mais confortável, mas inexistente.

De que maneira você pode se sentir tentado a cair nos erros de Mica e sua mãe:

• corrigindo quem é Deus? • retendo parte de sua vida pregressa para não servir a Deus? • ignorando a maneira que Deus lhe tem falado para adorá-lo?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 46;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 17.13—18.31$t$, 46,
$conteudo$M

ica agora concluiu a configuração de sua religião caseira: um santuá rio, uma imagem e um sacerdote levita. Leia Juízes 17.13. Qual é o objetivo de sua atividade religiosa? Dã entra

Leia Juízes 18.1-26.

Por que a tribo de Dã estava desabrigada (v. 1)?

Os danitas se encontram nessa situação porque falharam em confiar em Deus e tomar a terra que lhes pertencia, por isso haviam sido “confinados à região montanhosa” (1.34). Não deram ouvidos àquilo que Deus realmente havia dito; então agora eles pedem orientação a um levita pagão atuando em um santuário idólatra, decidem que Deus os abençoou (18.10) e partem para tomar a terra (v. 11,12). A abordagem de Dã a Deus é muito semelhante à de Mica. De mãos vazias

O que os homens de Dã tomaram da casa de Mica (v. 14-21)?

Como Mica reage (v. 22-24)?

Tudo o que Mica possuía podia ser tirado dele — e ele não tinha mais nada. Tudo aquilo em que confiava havia se perdido, e ele não podia ter de volta (v. 25,26).

No fim, a religião que nós mesmos criamos decepcionará. Qualquer coisa que transformemos em nosso deus não cumprirá o que promete. A pessoa que faz da carreira o seu deus encontrará, por fim, o seu caminho para a bênção bloqueado por alguém que é “forte demais”; a pessoa que faz da imagem o seu deus descobrirá que o tempo é um inimigo “forte demais”. No final das contas, a morte remove todos os falsos deuses aos quais recorremos para obter bênção.

Todo mundo é um adorador. E há apenas um que nunca será tirado de nós — aquele a respeito de quem podemos dizer, com Pedro: “... para quem iremos? Tu tens as palavras de vida eterna” (Jo 6.68). Quando adoramos a Jesus, encontramos bênção. No entanto, somente experimentamos verdadeiramente sua bênção quando dizemos a ele: “Jesus, sem ti, o que mais tenho eu? Tu és tudo para mim”.

De que maneira é maravilhosamente libertador perceber que Jesus é tudo o que precisamos?

De que maneira você o desfrutará hoje?

Quais são as coisas que você acha fáceis de adorar em lugar de Jesus?

DÃ SAI

Leia Juízes 18.27-31.

Esse é um final deprimente para a história. Temos aqui uma tribo nascida no povo de Deus, Israel, mas que agora vive fora da terra de Deus, não ouve sua palavra e o adora de uma maneira completamente discrepante do que ele tem ordenado.

Pai celestial, por favor, salva-me dos erros de Dã; capacita-me hoje a confiar em ti, a ouvi-lo e a adorá-lo. Amém.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 47;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 19.1—20.7$t$, 47,
$conteudo$E

ssa segunda história deplorável no final do livro de Juízes é muito sombria e inalteradamente trágica. Israel relembrou a história como um episódio extremamente vergonhoso (leia Os 9.9; 10.9). Leia Juízes 19.1-30. A vergonha de Gibeá

O versículo inicial nos apresenta a outro levita, o qual tinha uma concubina — uma esposa de segunda classe, mantida como uma cria da sexual.

O que a concubina faz (v. 2)?

O que você pensa da decisão do pai dela em permitir que o levita tenha sua filha de volta (v. 3-10)?

O que você pensa a respeito da conduta do homem idoso de Efraim?

• Versículos de 16 a 21. • Versículos de 22 a 24.

O que acontece à concubina em Gibeá (v. 25-28)?

O levita parece estar totalmente despreocupado — ele a manda para fora (v. 25) e depois vai para a cama até pela manhã (v. 27), quando, então, dirige-se a ela como se fala a um animal (v. 28). Por que, então, ele envia as partes do corpo da mulher às regiões de Israel (v. 29)? Porque ele quer se vingar, não pelo tratamento que foi dado a mulher, mas pela perda daquilo que ele vê como sendo sua proprie dade. O narrador deixa muito claro que ninguém nesse episódio está livre de culpa. Todos pecaram.

Leia Gênesis 19.1-11.

Quais são as semelhanças entre Sodoma e Gibeá?

Sodoma é o grande exemplo de rebelião contra Deus no Antigo Testamento que, de maneira justa, traz sobre si o juízo de Deus.

O que, então, os acontecimentos em Gibeá nos mostram a respeito do povo de Deus? Mudando os detalhes

Leia Juízes 20.1-7.

De que maneira o levita edita o seu relato acerca do que aconteceu a fim de parecer inocente?

Vale a pena lembrar que essas coisas realmente aconteceram no meio do povo de Deus. Esses são os nossos ancestrais espirituais. Em certa medida, eles revelam a nós mesmos. Podemos ter segredos muito bem guardados que, de algum modo, têm semelhança (talvez pequena) com a conduta dos gibeonitas. Ou, então, assim como o levita, podemos ter falhado em preveni-los. Todos nós contamos uma história melhor a nós mesmos e aos outros a nosso respeito do que a verdade plena revelará. Por vezes, todos nós temos vivido como se “não [houvesse] rei” (19.1).

Existem:

• segredos muito bem guardados que você precisa confessar, lamentar, bem como se arrepender deles? • maneiras pelas quais você tem contado a si mesmo uma história que é melhor que a verdade — maneiras a respeito das quais você precisa ser honesto, bem como confessá-las?

Apesar de quem somos, Deus é repleto de graça para conosco. Agradeça a ele o fato de que sua misericórdia é suficiente para cobrir o que quer que esteja em seu passado ou em seu futuro. Leia o salmo 103.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 48;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 20.8-48$t$, 48,
$conteudo$A

o se reunirem para decidir o que fazer em relação a Gibeá, Israel se une de uma maneira que ainda não havia acontecido desde Juízes 3. São “como um só homem” (v. 8). Ou melhor, todos com exceção da tribo de Benjamim. A guerra chega

Leia Juízes 20.8-16.

O que as pessoas se comprometem a fazer (v. 8-11)?

O que eles fazem antes de irem para a batalha contra Benjamim (v. 12,13)?

Como a tribo de Benjamim reage (v. 13b-16)?

Por que eles simplesmente não entregam os culpados para enfrentarem a justiça? Muito provavelmente por causa do ídolo do parentesco; o tipo de mentalidade “Apoio minha família (ou meu país), quer esteja certa, quer errada”. Quando colocamos nosso sangue, nossos laços raciais ou nossa comunidade acima do bem comum e da ordem moral, fazemos “de nosso próprio povo” um deus.

Você consegue pensar em como fez ou esteja fazendo isso quando se trata de sua família ou de sua comunidade? A guerra é vencida

Leia Juízes 20.17-48.

Após muitas batalhas, o que acontece com o exército de Benjamim no final (v. 41-47)?

A vitória foi alcançada... mas o que acontece em seguida (v. 48)?

Isso não é justiça; é genocídio. É uma obra provocada pela amargura, que exige não apenas um olho, mas dois, como forma de se vingar por cada olho perdido. A amargura sempre faz florescer um desejo de vingança, em âmbito nacional, mas também em âmbito pessoal. Neste âmbito, a destrutividade ainda é real, embora em uma escala menor. Como perdoar

A única maneira de evitar a amargura e o ressentimento furioso é praticando o perdão. Como podemos fazer isso? De três formas:

1. Entenda o que é o perdão. O perdão é concedido antes de ser sentido (Lc 17.3-6). É uma promessa de não suscitar o erro com a pessoa que o ofendeu, nem com outras pessoas, nem mesmo em seus próprios pensamentos. Trata-se de uma promessa de não habitar na mágoa ou de não alimentar animosidade. 2. Entenda como o perdão é possível. Somente perdoaremos se (e quando) virmos e sentirmos a realidade do intenso e custoso perdão de Deus em nosso favor por meio de Cristo. Somente ao conhecermos a vastidão da dívida que tínhamos com Deus — e que agora está cancelada —, seremos capazes de ter uma perspectiva melhor acerca da dívida que alguém tem para conosco (Mt 18.21-35). 3. Perdoe antes de tentar se reconciliar (Mc 11.25). Dessa forma, não nos aproximaremos irados da outra pessoa, nem tentaremos “agredi-la”. Seremos capazes de verdadeiramente buscar a restauração do relacionamento.

De que maneira o perdão de Cristo em seu favor está moldando a forma de você tratar outras pessoas?

Existe alguma pessoa que você precisa perdoar, da mesma forma que Deus o perdoou?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 49;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 21.1-24$t$, 49,
$conteudo$A

guerra acabou. Tudo o que resta da tribo de Benjamim são seiscentos homens, que se escondem no deserto (20.47). O problema

Leia Juízes 21.1-7.

O que os homens de Israel haviam jurado (v. 1)?

Uma vez que eles também haviam matado todas as mulheres benjamitas, qual é a consequência disso (v. 3,6,7)?

Quem eles parecem culpar no versículo 3?

Qual foi o outro juramento que os homens de Israel haviam feito (v. 5)?

“Por que isso aconteceu?”, eles perguntam (v. 3). Eles deveriam saber! Foi o seu juramento apressado e massacre de seus irmãos e irmãs benjamitas que causou isso. No entanto, em vez de apontarem para si mesmos, eles sugerem que isso, de alguma forma, foi culpa de Deus.

É mais fácil colocar o erro em Deus do que se engajar em autorreflexão. Se assim fizermos, porém, nunca confessaremos nossos pecados ou aprenderemos com nossos erros.

Lembre-se da semana que passou. Ao refletir sobre ela, existe algo que você precisa confessar? Soluções?

Leia Juízes 21.8-24.

Os homens de Jabes-Gileade não haviam participado da assembleia (v. 8,9) — e, tendo em vista o segundo juramento de Israel (v. 5), o fato de eles não terem participado parece apresentá-los como uma solução para o problema do futuro de Benjamim.

O que Israel faz (v. 10-14)?

Qual é o problema (v. 14)?

Qual é a próxima “solução” (v. 2,19-22)?

De que maneira isso burla o juramento (v. 23)?

Uma assembleia que havia se reunido para fazer justiça a uma única mulher que fora estuprada e assassinada termina planejando e promoven do a matança de uma cidade toda, bem como o sequestro e estupro de garotas de duas cidades. Soluções e problemas

Sempre que eles tentam “expurgar o mal” (20.13) de sua sociedade, os israelitas pioram o problema. Essa é a dificuldade com soluções humanas para aquilo que é, essencialmente, um problema espiritual, isto é, o mal. Não há campanha militar ou política de Estado que possa resolver um problema que reside no coração humano. Somente um avivamento de fé pode fazer isso. Israel, porém, não reconhece que está debaixo de tanta opressão e escravidão quanto se tivesse um senhor estrangeiro. Eles estão espiritualmente em trevas, mas não percebem isso.

Peça a Deus que avive sua igreja.

Conte a Deus a respeito de alguns dos problemas e decisões que você está enfrentando.

Em vez de fazer o que parece sensato ou lógico a seus próprios olhos, peça a Deus que o ajude a confiar nele e a obedecer-lhe.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 50;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Juízes 21.25$t$, 50,
$conteudo$C

hegamos, assim, ao final do livro de Juízes. Não tem sido uma leitura fácil. No entanto, o narrador deixa para nós um comentário que resume o livro, o qual também é um raio de esperança. Leia Juízes 17.6; 18.1; 19.1; 21.25. O que o narrador diz ser o problema de Israel? O que ele sugere ser a solução? Israel não tinha rei

Pense a respeito de todo o livro de Juízes.

De que maneira temos visto que o povo é o problema?

O que temos visto a respeito do tipo de solução que Deus precisaria providenciar?

No mínimo, o livro de Juízes nos mostra que, embora sejamos o problema, não podemos ser nossa própria solução. Precisamos buscar um rei, assim como fez Israel. No final do livro, no entanto, chegamos a nos perguntar se, e como, um mero rei humano pode ser suficiente. A história subsequente do Antigo Testamento confirma que até mesmo os melhores reis, tal como Davi, não são suficientes.

O livro de Juízes nos humilha, pois mostra que precisamos de um libertador que:

• Venha sem ter sido chamado, uma vez que os seres humanos não estão realmente buscando Deus. • Escolha seu povo, uma vez que nunca o escolheríamos. • Conquiste nosso resgate completamente sozinho, uma vez que somos incapazes de contribuir para isso. • Possa nos “expurgar” do mal (20.13) em nosso coração, e não apenas em nossas estruturas sociais. • Não morra, deixando-nos, mais uma vez, entregues às nossas próprias falhas e aos nossos próprios defeitos.

Precisamos de um rei, mas de um rei superior com uma libertação maior do que qualquer ser humano pode ser ou realizar. O rei que precisamos

Leia Salmos 96.11-13.

Aqui, a palavra “juiz” é usada em seu sentido original de “governar com justiça” — assim como os líderes do livro de Juízes deveriam ter feito, mas (na sua essência) falharam. O salmista entende que será necessário que o próprio Deus venha e seja nosso juiz.

Todos nós buscamos um rei — alguém ou algo que governe ou reine sobre nós, alguém ou algo que nos resgate e nos abençoe. Existe apenas um homem que nos proporciona o que estamos procurando — que veio sem ser convidado, chamou seu povo, morreu sozinho para nos resgatar, transforma nosso coração por seu Espírito e reina acima da morte para sempre. O livro de Juízes nos deixa ansiando por um rei; nos faz valorizar o Rei, nosso Senhor Jesus.

Agradeça a Deus dois ou três encorajamentos e desafios que você extrai do livro de Juízes para sua própria vida.

Em seguida, passe algum tempo simplesmente agradecendo a Deus o Rei Jesus.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 51;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 1.1,2$t$, 51,
$conteudo$E

fésios está recheado de passagens deslumbrantes. Cada capítulo produz novos tesouros. Desenterrá-los enriquecerá sua vida e aumentará sua confiança em compartilhá-los. Leia Efésios 1.1,2. Remetente e destinatário

De quem é essa carta e para quem é escrita (v. 1)?

Paulo começa todas as suas cartas nos lembrando que ele é “um apóstolo de Cristo Jesus”. Isso tem uma grande importância, pois ele está escrevendo como uma das testemunhas autorizadas e habilitadas por Cristo para proclamar a vontade eterna e cósmica de Deus. Não podemos ignorar ou descartar nada do que ele diz!

Os manuscritos mais antigos não incluem o nome “Éfeso”. Uma vez que o estilo da carta é geral (não contém qualquer referência a pessoas ou questões locais), é provável que ela tenha sido uma carta circular para todas as igrejas na região (onde hoje é a Turquia ocidental). Essas igrejas teriam sido plantadas de Éfeso, onde Paulo fora pastor titular por dois anos e meio. Éfeso era uma cidade cosmopolita e comercial, devota ao templo da deusa grega Ártemis.

Leia Atos 19.1—20.1.

O que os novos cristãos em Éfeso fizeram que mostrou o compromisso de seguirem Cristo como seu Senhor?

O que fez com que Paulo encerrasse seu tempo nesse local? O que e de onde?

O que Paulo deseja aos seus leitores (v. 2)?

O que ele diz ser a fonte dessas duas coisas (v. 2)?

A primeira era uma saudação gentílica costumeira; a segunda era uma saudação judaica padrão. Paulo as conjuga aqui (seu evangelho dado por Deus era, naturalmente, tanto para judeus quanto para gentios) e, ao fazer isso, apresenta alguns temas extremamente importantes nessa carta. Ele celebrará a “graça” de Deus como bondade imerecida e fonte de todas as nossas bênçãos em Cristo — leia o versículo 6; 2.7.

“Paz” é o resumo de todas as bênçãos resultantes de estar reconciliado com Deus e uns com os outros por meio de Cristo — leia 2.14-17. Se a graça é a origem do plano de Deus para nos reunir nas bênçãos de sua igreja em Cristo, então a paz é o resultado disso, manifestando a sabedoria triunfante do evangelho do Cristo crucificado nos domínios espirituais — leia 3.10-12.

De que maneira o versículo 2 o motiva em relação a:

• sua vida como cristão? • leitura dessa carta?

Agradeça a Deus que, em sua graça, enviou seu Filho, o Senhor Jesus, para nos trazer paz. Ore para que, conforme estude Efésios, você compreenda mais plenamente tudo o que estar “em Cristo” significa em sua vida.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 52;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 1.3$t$, 52,
$conteudo$N

o texto original grego, os versículos de 3 a 14 do capítulo 1 de Efésios formam uma longa frase que rouba o nosso fôlego. É uma avalanche de louvor a Deus. Paulo começa resumindo aquilo a respeito do que está tão empolgado. Leia Efésios 1.3. Onde?

Onde Deus “nos abençoou” (v. 3)?

Essa é uma expressão crucial que Paulo repete cinco vezes em Efésios. Precisamos compreender isso para que possamos entender a carta.

Os domínios celestiais são a dimensão espiritual na qual Deus e todos os poderes espirituais habitam. Esses domínios não são apenas o céu, não são apenas a terra nem são apenas uma realidade futura. Os domínios celestiais são a dimensão espiritual onde Cristo reina (1.20) e onde já fomos ressuscitados para nos assentarmos com ele (2.6). As “bênçãos espirituais” de que desfrutamos são os tesouros eternos da reconciliação pessoal com Deus — e usufruímos delas a partir do primeiro momento em que confiamos em Cristo. O quê?

Por que a palavra “todas” é deslumbrante nesse versículo?

De acordo com esse versículo, como temos acesso a essas bênçãos?

Faça uma leitura rápida de Efésios 1.3-14.

Quantas vezes você identifica os termos “em Cristo” (“nele” ou “por meio dele”)?

Deus quer nos lembrar que devemos tudo a seu Filho. Somos abençoa dos não apenas “por meio” de Cristo, como o mecanismo para recebimento de bênçãos, mas de maneira pessoal “em” Cristo — nossas bênçãos devem ser desfrutadas com ele, em relacionamento com ele. Quando?

Quando desfrutamos de todas essas bênçãos? Nós desfrutaremos delas de modo pleno somente na glória, no futuro. Porém, nós as experimentamos em parte agora, e elas devem encher nosso coração de alegria até mesmo neste momento. Tudo o que temos de fazer para experimentarmos as bênçãos de maneira plena é... morrer. Até eu consigo fazer isso!

Como esse versículo muda sua visão de si mesmo e de sua morte?

Os cristãos têm diferentes dons e ministérios, mas todos são igualmente abençoados em Cristo.

Por que achamos fácil esquecer isso (em relação a nós mesmos e aos outros)?

De que maneira lembrar disso nos fornece uma percepção mais conso lidada e satisfeita acerca de nossa própria identidade?

Deus deu tudo a cada cristão para ser desfrutado na eternidade.

De que maneira isso motiva e conforta você hoje?

Lembre-se de que as verdades do versículo 3 fazem com que Paulo nos encoraje a “louvar [...] o Deus e Pai de nosso Senhor Jesus Cristo”. Faça isso agora!$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 53;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 1.4-6$t$, 53,
$conteudo$O

pregador inglês do século 19 Charles H. Spurgeon disse que “A eleição incendeia o coração com deleite entusiasmado em Deus”. Isso pode surpreender você! Mas Paulo concorda. Vejamos o porquê... Leia Efésios 1.4-6. Escolhidos

O que Deus fez “nele” (v. 4)? Quando fez isso?

O que Deus fez (v. 5)? Por quê (final do v. 5)?

Muito antes de termos escolhido seguir a Jesus, Deus Pai “nos escolheu”. É isso que Paulo chama de predestinação (v. 5) ou (em outro momento) de eleição. E é isso o que Jesus também ensinou — leia João 6.37; Mateus 11.28.

A eleição de pecadores por Deus para a salvação faz parte de sua soberania sobre todas as coisas (Ef 1.11). Sempre que oramos, estamos reconhecendo que Deus está no controle. Sempre que oramos para alguém ser salvo, estamos (pelo menos de modo inconsciente) reconhecendo que Deus está no controle da salvação das pessoas.

O fato de Deus escolher pessoas, porém, pode dar a impressão de comprome ter o evangelismo (afinal, Deus irá, de qualquer forma, salvar aqueles a quem ele escolheu), comprometer nossa humildade (afinal, somos os eleitos) e comprometer nossa santidade (afinal, somos salvos).

Paulo nos ajuda com cada objeção. Em primeiro lugar, Deus usa o nosso evangelismo para salvar os seus eleitos (leia At 18.9,10). Tendo em vista que ele escolheu a muitos, nosso evangelismo constituise no alegre privilégio de encontrar seus eleitos com seu evangelho, assim como mineiros escavam uma mina em busca de ouro.

Em segundo lugar, a eleição nos mantém humildes, pois fomos escolhidos “antes da criação do mundo” — não somos salvos por sermos mais espertos ou mais dignos de mérito. Uma vez que ele nos escolheu previamente, podemos apenas ser sempre humildes.

Em terceiro lugar, fomos escolhidos “para sermos santos e irrepreensíveis em sua presença” (v. 4). Uma vez salvos por meio de Jesus, desejaremos ser como Jesus — santos.

De que maneira esses versículos mudaram sua visão de eleição e predestinação?

Você precisa usar a doutrina da eleição para encorajar seu coração a:

• desejar evangelizar mais? • crescer em humildade? • avançar em sua santidade?

ADOTADOS

Deus nos escolheu para qual finalidade (v. 4)?

No Israel do Antigo Testamento, o primogênito herdava a terra. Sendo adotados “como filhos”, Deus escolheu nos dar todos os privilégios de seu Filho. Em Cristo, somos trazidos diretamente à família do Deus triúno, capazes de sussurrar em ouvidos de nosso Pai!

O grande teólogo J. I. Packer escreve: “Você pode resumir toda a religião do Novo Testamento referindo-se a ela como o conhecimento de Deus na qualidade de santo Pai”.

Dedique algum tempo falando com o seu Pai agora, agradecendo-lhe o que lhe deu em Cristo e pedindo pela ajuda que você precisa para viver como seu filho hoje.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 54;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 1.7-10$t$, 54,
$conteudo$N

a Bíblia, “redenção” significa libertação da escravidão mediante o pagamento de um resgate. E, em Cristo, “temos redenção por meio de seu sangue” (v. 7). O pano de fundo bíblico da ideia de redenção está em Êxodo, quando os israelitas foram escravos no Egito. Foram libertos do cativeiro do faraó e do julgamento de Deus sobre seus pecados pelo sangue dos cordeiros sacrificados da “Páscoa”, que foram mortos em lugar dos filhos primogênitos dos israelitas. Redimidos do...

Leia Efésios 1.7-10; 2.1-3.

Do que fomos redimidos (2.1-3)?

Éramos incapazes de nos libertar do pecado. Estávamos aprisionados por ele. Agora, porém, você está livre. E, embora perambulemos de volta à sujeira de nosso encarceramento, “nele” a porta da cela foi permanentemente aberta por Jesus, que pacientemente continua nos conduzindo para fora em direção à luz novamente.

Essa redenção se dá “por meio” de quê (1.7)?

No que ela resulta (v. 7)?

O fato de Deus permitir que tal sacrifício pague os nossos pecados é graça. O fato de Deus proporcionar tal sacrifício é uma maravilhosa graça! O fato de Deus ter se tornado tal sacrifício é uma graça além de nossa compreensão! Ele verdadeiramente “derramou sobre nós” as “riquezas de [sua] graça” (v. 7,8).

Estamos livres do medo — Satanás não pode exigir com sucesso que sejamos punidos por nosso pecado. Também somos livres da culpa — não somos uma decepção deplorável para Deus nem temos de tentar impressioná-lo (ou a qualquer outra pessoa), pois os nossos pecados agora estão perdoados e o seu registro está permanentemente apagado. Redimidos para...

Deus “revelou a nós o mistério” — o segredo — “de sua vontade”. Deus nos concede o privilégio extraordinário de conhecer seus planos eternos — que acontecerão “quando ocorrer a dispensação da plenitude dos tempos” (v. 10)!

Para onde todas as coisas estão caminhando (v. 10)?

O arquiteto divino publicou seu glorioso plano de construção. Ele lançou o alicerce na morte e ressurreição de Cristo. E a concretização de sua gloriosa nova criação é agora apenas uma questão de tempo. Observe que o foco de seu plano não somos nós, mas Cristo. E nenhuma parte de seu plano é incerta ou arriscada. Não precisamos nos preocupar a respeito das coisas que não sabemos e não podemos controlar.

Você está vivendo com medo ou culpa por causa de seu pecado? De que maneira o versículo 7 tanto o liberta quanto o desafia? De que maneira você se verá de outro modo?

Você está vivendo com ansiedade porque tem medo do futuro? De que maneira o versículo 10 tanto o liberta quanto o desafia? Como você viverá de outro modo?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 55;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 1.11-14$t$, 55,
$conteudo$F

omos escolhidos para adoção pelo Pai. Fomos redimidos para a unidade pelo Filho. Hoje, descobrimos que fomos selados para uma herança pelo Espírito. Leia Efésios 1.11-14. A obra do Espírito

De que maneira as pessoas se tornam “incluídas em Cristo” (v. 13; “Nele” [A21, BJ])?

O que aconteceu com cada cristão “quando creu pela primeira vez” (v. 13)?

O que isso garante (v. 14)?

O “selo” era uma marca de propriedade e proteção que, na cultura romana, muitas vezes era usado para marcar o gado. Paulo está dizendo que é como se cada cristão tivesse sido marcado pelo Espírito de Deus, com uma caneta ultravioleta, como pertencente a Deus.

Além disso, o Espírito é a primeira parcela — o depósito — que garante o “pagamento” total da vida a ser gasta desfrutando de Deus no céu, porque ele é Deus dentro de nós. Ele é como o primeiro prato do suntuoso banquete espiritual que há de vir na nova criação.

Lembrar disso nos capacitará a evitar dois erros comuns. Primeiro, evitaremos pensar que nossa alegria na presença de Deus é somente para o futuro — já podemos desfrutar uma porção do céu agora, por meio do Espírito que habita em nós. Segundo, evitaremos pensar que nossa experiência atual é tudo o que existe — na verdade, o melhor ainda está por vir!

Se você crê no evangelho, não perca de vista quão seguro está seu futuro. A eleição do Pai, a redenção do Filho e a habitação do Espírito são todas irreversíveis.

De que maneira as palavras “selado” e “depósito/garantia” o ajudam a valorizar a obra do Espírito de Deus em você? A resposta cristã

Duas frases magníficas que aparecem quatro vezes cada nos versículos de 1 a 14 nos dizem como responder a tudo o que temos visto.

Em primeiro lugar, tudo isso está acontecendo de acordo com sua vontade (v. 1,5,9,11). Podemos nos regozijar de que Deus está cumprindo seu plano. Não somos um acidente nem vivemos sem propósito.

E como devemos reagir ao conhecer o plano e apreciar nossas bênçãos (v. 14, veja também v. 3,6,12)?

Não devemos simplesmente cerrar os dentes e enfrentar a vida. Devemos nos regozijar intencionalmente com as graciosas bênçãos de Deus. Quando fizermos isso, viveremos para o louvor de sua glória à medida que valorizamos a alegria extraordinária de sermos salvos.

Louvo-te, meu Deus e Pai de meu Senhor Jesus Cristo, por me abençoares e à minha família cristã nos domínios celestiais com todas as bênçãos espirituais em Cristo.

Agradeço a ti que me adotaste, redimiste e selaste. Agradeço que posso viver para o louvor de tua glória.

Amém.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 56;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 1.15,16$t$, 56,
$conteudo$P

aulo agora revela à igreja de Éfeso que ele tem orado por eles. Conforme explorarmos os pontos da oração de Paulo, aprenderemos muito em relação a por que, como e o que orar. Leia Efésios 1.15,16. O combustível de Paulo

Paulo começa dizendo: “Por esta razão...”. Com isso, ele quer dizer “em razão do que acabei de afirmar nos versículos de 1 a 14 a respeito de como Deus reúne seu povo escolhido, redimido e selado por meio de Cristo”.

O que foi que Paulo “ouviu falar” acerca de seus principais leitores (v. 15)?

Em outras palavras, eles carregam a marca de nascença cruciforme indicadora daqueles que são os verdadeiros filhos de Deus. Eles têm a dimensão vertical da fé no Senhor Jesus e a dimensão horizontal do amor por todo o povo de Deus — e não apenas por aqueles que se assemelham a eles ou que poderiam lhes ser favoráveis.

Verdadeiros cristãos sempre demonstram crescimento em ambas as dimensões, a saber, na fé em Cristo e no amor por todos os crentes.

De que maneira você acha que as grandes verdades dos versículos de 3 a 14 nos fazem continuar a ter fé em Cristo e a crescer em amor por cristãos? Os agradecimentos de Paulo

Conforme Paulo pensa a respeito das verdades dos versículos de 3 a 14 e considera a evidência cruciforme da fé viva da igreja de Éfeso...

O que ele faz (v. 16)?

O apóstolo estabelece um exemplo para nossas próprias orações. Ele orou de modo incessante — não apenas esporadicamente, mas regularmente; orou de maneira generosa — não apenas por si mesmo, mas por outros; e orou de maneira grata — reconhecendo a obra de Deus não apenas em sua vida, mas na vida e na igreja deles. Isso representa um desafio para nós: Oramos dessa maneira por outras pessoas? Oraremos assim por outras pessoas?

Leia Mateus 6.9-13.

Por que é significativo o fato de Jesus ter usado as palavras “nosso”, “nos” e “nós”, e não “meu” e “eu”?

Jesus quer que aprendamos a nos importar mais com nossos irmãos e nossas irmãs cristãos do que com nós mesmos — assim como Paulo faz em Efésios 1.

Até que ponto as suas orações compartilham das características das orações de Paulo no versículo 16. São orações:

• frequentes? • generosas? • de gratidão?

Pense em alguns cristãos em sua igreja cuja vida revela sua “fé no Senhor Jesus e [...] amor por todo o povo de Deus”.

Leia os versículos de 3 a 14. Louve a Deus pelo fato de cada versículo ser verdadeiro na vida de cada uma dessas pessoas. Use esses versículos para agradecer a Deus esses irmãos e essas irmãs, citando seus nomes.

Você poderia separar algum tempo para orar por esses cristãos queridos algumas vezes por dia, todos os dias nesta semana?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 57;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 1.17-20$t$, 57,
$conteudo$E

m seguida, descobrimos a respeito do que Paulo ora. Ele está pedindo que o Pai dê aos efésios um conhecimento mais profundo de três coisas que eles já têm em Cristo. Leia Efésios 1.17-20. Conhecer a Deus

O que Paulo “continua pedindo” que o Pai faça aos crentes efésios (v. 17)?

Qual será o resultado disso (v. 17)?

Paulo sabia que a maior bênção que alguém poderia experimentar é conhecer a Deus e conhecê-lo melhor a cada dia (veja Fp 3.8). Como diz J. I. Packer, “Somos cruéis com nós mesmos se tentamos viver neste mundo sem conhecer o Deus que o administra e a quem o mundo pertence”. Para seus filhos adotivos, Deus é a fonte da mais profunda satisfação e alegria. Conhecer a esperança

O que precisa ser “iluminado” (Ef 1.18)?

O que isso nos capacitará a “ver” (v. 18)?

Paulo sabe que a maneira de “vermos” este mundo está embasada nas afeições de nosso coração. Ele não ora para que Deus mude as circunstâncias da vida dos efésios, mas para que mude a maneira de eles verem as circunstâncias de sua vida. Ele quer que os efésios vejam tudo com os olhos da fé, confiando que Deus cumprirá o que prometeu.

Quando os cristãos “veem” a vida dessa maneira, eles vivem uma vida de “esperança” que é singular neste mundo, porque sabem que estão se dirigindo para a “herança gloriosa” de Deus. E não perca de vista o que a “herança” de Deus é. Somos nós! Deus está esperando para nos dar as boas-vindas em seu lar. Não entraremos escondidos pela porta dos fundos. Seremos recebidos no portão de frente.

Mas... isso realmente acontecerá? Nosso corpo desintegrado realmente se reunificará com nossa alma e viverá para sempre na nova criação? Paulo sabe que precisamos... Conhecer o poder

Qual é a força do poder que opera dentro de “nós, os que cremos” (v. 19,20)?

De que maneira isso nos dá confiança de que realmente viveremos com Deus para sempre?

Poderíamos dizer que Deus praticou nos ressuscitar ao ressuscitar Jesus. Ele já fez isso antes, portanto sabemos que pode fazer novamente.

Precisamos aprender a orar como Paulo orava, isto é, por nós mesmos e por outros crentes. Não oremos apenas para que conheçam a paz, a prosperidade, a saúde e a felicidade terrenas. Oremos para que expe rimentem os enormes privilégios espirituais de conhecer a Deus melhor, de conhecer a esperança para a qual ele nos chamou, bem como o poder que ele empreender para nos levar para estarmos com ele no lar.

Traga à memória os cristãos que você agradeceu a Deus no final do estudo anterior. Ore por eles neste momento, assim como Paulo orou por seus amigos em Éfeso.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 58;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 1.18-23$t$, 58,
$conteudo$M

uitos cristãos são perigosamente alheios aos poderes satânicos. A Bíblia diz que Satanás é real, furioso e perigoso. No entanto, ao reconhecermos isso, podemos acabar ficando com muito medo... Esse parece ter sido o problema dos efésios. Eles estavam com medo de que a oposição espiritual fosse forte demais. Sabiam que seus oponentes espirituais eram mais poderosos do que eles. E, por isso, estavam preocupados de não conseguirem chegar ao céu. Você acha que tende a subestimar ou superestimar o poder do Diabo? Que efeito isso tem na sua visão da vida cristã e no seu futuro? Leia Efésios 1.18-23. Domínio

O poder de Deus não apenas operou em Cristo para ressuscitá-lo dentre os mortos (v. 20)...

O que mais ele fez (v. 20,21)?

Por que o versículo 22 é reconfortante ao levarmos em consideração Satanás e as forças espirituais?

A questão é simplesmente a seguinte: ninguém pode sequer chegar perto de nos arrebatar das mãos de nosso Salvador. Aliás, por mais incrível que soe, Deus “estabeleceu Cristo como cabeça de todas as coisas para a igreja” (v. 22, grifo nosso). Cristo governa todas as coisas. Ele governa este mundo para benefício da igreja a fim de que ela se torne mais parecida com ele e esteja com ele um dia.

De que maneira o início do versículo 23 explica por que Cristo se importa tanto com a igreja?

Como Paulo indicará mais adiante em sua carta, “ninguém jamais odiou o próprio corpo; antes, alimenta-o e dele cuida, assim como Cristo faz em relação à igreja” (5.29). Certamente seremos ressuscitados com ele, pois ele mesmo foi ressuscitado e somos seu corpo vivo. Nossa cabeça não pode ser separada do nosso corpo! Presença

Do que, então, cada igreja desfruta (v. 23)?

Deus está intensamente presente em cada igreja. Todo o poder da ressurreição de Deus está sendo empregado para reunir as igrejas e mantê-las confiantes em Cristo até que cheguem a se juntar fisicamente à grande reunião celestial em volta do trono de Cristo. Trata-se de um poder inimaginável, e isso deveria nos proporcionar uma confiança ilimitada!

De que maneira esses versículos lhe proporcionaram:

• uma visão ampliada de Jesus?

• uma visão superior acerca de sua própria igreja? • uma confiança maior em seu futuro?

Continue a orar como você fez no final do estudo anterior, desfrutando da confiança segundo a qual o seu Cabeça está à direita do Único ao qual você ora.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 59;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 2.1-3$t$, 59,
$conteudo$N

o capítulo 2, Paulo explica de que modo somos unidos uns aos outros debaixo de Cristo. Primeiro, somos reconciliados com Deus (v. 1-10); segundo, somos reconciliados uns com os outros (v. 11- 22). Contudo, para compreendermos de que maneira fomos reconciliados com Deus, devemos começar verificando por que precisávamos ser reconciliados com ele. Como realmente somos

Todos nós temos a tendência de adotar uma visão inflada de nós mesmos. Somos como mineiros encardidos que estão em uma vala e fazem comparações uns com os outros, imaginando-se relativamente limpos.

Leia Efésios 2.1-3.

De que maneira a Bíblia nos apresenta (v. 1)?

Em termos espirituais, nascemos mortos para Deus, pois nascemos pecadores. A vida espiritual nos era impossível — cadáveres não podem se ajudar.

De acordo com Paulo, quais são os três “tiranos” que nos mantém cativos, de modo que não podemos escapar de nosso pecado e de nossa morte (v. 2,3a)?

Não são apenas os adolescentes que são influenciados pelos colegas de sua idade — todos somos. Nosso instinto é seguir “os caminhos deste mundo”, seja por meio de uma cosmovisão tradicional que se funda no dever e na justiça própria, rejeitando o evangelho, seja por meio da cosmovisão emergente fundada em sentimentos e na autonomia individual, a qual também rejeita o evangelho.

“O príncipe do poder do ar” é Satanás. De maneira geral, os descrentes não são possuídos por Satanás ou seus demônios — mas todo descrente é voluntariamente persuadido por suas mentiras porque eles são “desobedientes” (v. 2). Naturalmente, queremos que as mentiras do Diabo sejam verdadeiras para que possamos continuar pecando.

O termo “nossa carne” não significa apenas o nosso corpo físico, mas toda a nossa natureza humana. Somos, por natureza, cativos de nossos próprios desejos: nosso apetite egoísta pela luxúria, pela popularidade autogratificante ou pela autoglorificação orgulhosa.

Paulo está nos mostrando que nosso pecado era muito natural para nós. Nosso pecado nos mantinha cativos, e gostávamos disso. Não se trata apenas de que éramos incapazes de nos libertar dessa tripla escravidão, mas também de que não queríamos ser libertos. O que realmente merecemos

O que todos nós “merecíamos” (final do v. 3)?

Todos passaremos a eternidade na presença de Deus. Seu povo será inundado com sua bênção imerecida; porém, seus inimigos serão cobertos com o tormento de sua ira merecida.

Lembre-se de que Paulo tem notícias maravilhosas para compartilhar acerca da graça de Deus. No entanto, nunca nos regozijaremos verdadeiramente nela até que reconheçamos quão aterrorizante é nossa condição sem Cristo.

Antes de você se tornar cristão, de que maneira os três “tiranos” operavam em você?

Você realmente já reconheceu que, por natureza, tudo o que suas capacidades e conquistas mereciam era a “ira”? Aceitar isso faz qual diferença à sua visão:

• de si mesmo? • de seu Salvador?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 60;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 2.4-10$t$, 60,
$conteudo$P

aulo nos mostrou que estávamos “mortos” em nossos pecados (v. 1). Agora, de maneira exultante, ele celebra a graça de Deus ao nos alcançar em nossa total impotência. Leia Efésios 2.1-7. “Todavia, Deus...”

Tendo em vista os versículos de 1 a 3, por que a palavra “todavia”, no início do versículo 4, é tão maravilhosa?

Os primeiros três versículos do capítulo 2 dizem respeito àquilo que fizemos e que, consequentemente, merecemos. Os quatro versículos seguintes dizem respeito àquilo que Deus fez e que, por consequência, desfrutamos.

O que, então, Deus fez por nós (v. 4-7)?

Quatro palavras-chave da Bíblia nessa passagem celebram a beleza do caráter de Deus revelada por meio do envio de seu Filho:

• Amor (v. 4): O compromisso de Deus em eternamente nos abençoar em Cristo. • Misericórdia (v. 4): A retenção da punição que merecíamos de Deus porque Cristo a suportou por nós na cruz. • Graça (v. 5,7,8): Deus generosamente nos dando o que precisamos na obediência de Cristo até mesmo na morte. • Bondade (v. 7): A compaixão de Deus em se diminuir para se tornar um de nós e trocar de lugar conosco na cruz!

Paulo não se detém na cruz aqui, mas, sim, na ressurreição. Ele dá menos ênfase à nossa culpa e necessidade de justificação e mais ênfase a nosso afastamento de Deus e necessidade da ressurreição que foi conquistada na cruz e assegurada quando Cristo ressuscitou. Com Cristo

Quais são as três coisas que Deus fez por nós “com Cristo” (v. 5,6)?

Em Cristo, nosso rei representativo, já fomos ressuscitados, aceitos no céu e estamos assentados à direita do Pai (veja 1.20,21). Uma vez que, em Cristo, o céu é agora nossa habitação presente, certamente há de ser o nosso destino futuro. Nossos assentos estão reservados por Jesus e seguros em Jesus.

Por que Deus fez tudo isso (2.7)?

Não se trata apenas de um exercício de arrumação da bagunça ou de aplacar a rebelião. O plano de Deus é eternamente derramar torrentes de bondade sobre nós. Em cada dia da eternidade seremos inundados com novas bênçãos de sua graça para explorarmos, desfrutarmos e sermos impulsionados a louvar nosso Salvador.

De que maneira a realidade dos versículos de 1 a 3 nos capacita a valorizar a maravilha dos versículos de 4 a 7?

Como esses versículos fazem você se sentir em relação a si mesmo e a Deus?

De que modo a realidade de que você está “assentado com” Cristo no céu mudará a maneira de você ver sua vida hoje?

Releia lentamente os versículos de 4 a 7. Faça pausas regulares para agradecer a Deus tudo o que ele fez por você e tudo o que lhe dará.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 61;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 2.8-10$t$, 61,
$conteudo$E

stávamos mortos em nossos pecados. Deus nos deu vida com Cristo. Em razão disso, Paulo agora destaca tanto pelo que somos salvos como para que somos salvos. Salvos pela...

Leia Efésios 2.8,9.

“Pelo que” e “por meio de que” somos salvos (v. 8)?

De onde vem a fé (v. 9)?

A salvação não se dá “pelas obras”. Por que isso significa que “ninguém pode se gloriar” (v. 9)?

A salvação não é uma recompensa. Ela é sempre um dom. Não fomos salvos por nossas boas obras, e nossa salvação não é mantida por elas, mas, sim, pelas boas obras de Cristo. É isso que a Bíblia entende por “graça”: a bondade imerecida de Deus em nos dar o que não temos em nós mesmos ou que não merecemos receber dele, isto é, a vida e a justiça de Cristo. A graça é a justiça de Deus paga por Cristo.

Isso muda a maneira de vermos a nós mesmos e aos outros. A salvação pela graça, por meio da fé, que é um dom de Deus, indica que não podemos ser soberbos diante de Deus, arrogantes em relação a descrentes ou competitivos com outros cristãos. Salvos para...

Leia Efésios 2.10.

Fomos “criados em Cristo Jesus” para fazer o quê?

Por que até essas coisas são um dom de Deus?

Por que faz toda a diferença o versículo 10 estar após os versículos 8 e 9, e não antes?

Não somos salvos pelas boas obras. Mas somos salvos para as boas obras. Temos sido recriados pelo Espírito de Deus por meio da fé em Cristo por uma razão e para um propósito. A razão é a graça de Deus expressa na vida de boas obras de Cristo até sua morte por nós. O propósito são as boas obras preparadas para praticarmos em gratidão a ele.

Entender essa distinção é fundamental. Saber que você é salvo completamente pela graça de Deus em Cristo o liberta do orgulho de imaginar que você pode se salvar, bem como do terror de perceber que você não pode fazê-lo. Além disso, saber que você foi salvo para boas obras preparadas por Deus o liberta de um desengajamento preguiçoso despi do de amor para com as necessidades do mundo, bem como de se sentir insignificante ou inútil.

Você corre algum perigo de pensar que sua própria bondade muda sua condição perante Deus? O que mudaria se você simplesmente desfrutasse do fato de estar salvo pela graça?

De que maneira o versículo 10 poderia transformar uma tarefa rotineira, enfadonha ou ingrata em seu dia hoje?

De que maneira você usaria os versículos de 1 a 10 para explicar o evangelho em um minuto a um amigo não cristão?

Escolha um dos versículos de 1 a 10, memorize-o e use-o para louvar a Deus trazendo-o à sua mente com regularidade hoje.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 62;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 2.11-13$t$, 62,
$conteudo$H

á um ciclo interminável de conflito político e militar ao redor do mundo, de desconfiança e segregação em nossas cidades e de tensão e mágoa em nossos empregos e lares. Será que a nossa espécie um dia cessará com as brigas e encontrará a paz duradoura? Sim, diz Paulo, à medida que ele se volta de como podemos ser reconciliados com Deus (2.1-10) para como podemos nos reconciliar uns com os outros (v. 11-22). Mais uma vez, a estrutura nos mostra quão desesperançosa é a situação sem Cristo e de que modo Deus transformou tudo por meio de Cristo. “... Vocês eram...”

Leia Efésios 2.11,12.

A quem Paulo está se dirigindo (v. 11)?

A circuncisão de meninos judeus simbolizava ser cortado do pecado e pertencer ao povo de Deus (Gn 17.1-14). Esse sinal, no entanto, havia se tornado para os judeus uma fonte de orgulho em si mesmos e de desprezo para com os gentios, embora a circuncisão em si fosse me ramente externa, ou seja, “feita no corpo por mãos humanas”. Desacompanhada de um corte interno livre de pecado, ela era sem sentido.

Apesar disso, pelo menos os judeus conheciam Deus por meio de sua lei.

Qual era a condição dos gentios (v. 12)?

Leia Gênesis 12.1-3; Êxodo 19.5,6; Números 25.10-13; 2Samuel 7.11-16; Jeremias 31.31-34.

Por que fazer parte das “alianças da promessa” era algo maravilhoso?

“Sem esperança e sem Deus” é um bom resumo da condição gentílica. Os não judeus não tinham participação nas empolgantes promessas de um grande rei que viria, não tinham direito à cidadania no povo de Deus e eram estranhos às bênçãos. Sem Cristo, os efésios gentios estavam (e os gentios de hoje estão) sem esperança da vida eterna e sem Deus no mundo.

Nós, que crescemos na cultura ocidental, tendemos a imaginar que merecemos todos os privilégios. Estamos muito conscientes de que temos “direitos”. Paulo, no entanto, indicou que os gentios não têm direito a quaisquer bênçãos de Deus. Ele não diz isso para nos humilhar, mas para que possamos reconhecer o “mas agora” — para que possamos compreender quão generosamente temos sido abençoados em Cristo. “Mas agora em Cristo...”

Leia Efésios 2.13.

Por que o “mas” é uma notícia assim tão boa?

Que diferença o sangue de Jesus fez?

Olhe o versículo 12. O “mas” no versículo 13 assinala que o oposto de todos esses fatos acerca dos gentios é agora verdadeiro para aqueles que estão em Cristo.

Qual é, então, a nossa condição agora?

Use os versículos de 1 a 3 e 12 para refletir a respeito de qual seria sua condição se você não tivesse recebido a fé em Cristo. Deixe que isso o impulsione a louvar a Deus por sua imensa graça em relação a você.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 63;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$“... e$t$, 63,
$conteudo$m Cristo Jesus, vocês, que antes estavam longe, foram trazidos para perto...” (v. 13). Dessa forma, a paz e o acesso de que todos nós precisamos nos são oferecidos agora. Leia Efésios 2.14-18. Paz na terra

Onde a paz deve ser encontrada (v. 14)?

Cristo uniu as duas categorias da humanidade mais profundamente separadas na história mundial: judeus e gentios. O “muro hostil de separação” era a lei de Moisés, a qual, em vez de ser vista como um sinal da bondade de Deus ao mundo, foi transformada pelos líderes religiosos judeus em uma barreira que excluía o restante do mundo do bom governo de Deus. Cristo desmantelou isso ao cumprir todos os termos da lei em sua vida, exaurindo em sua morte a condenação de judeus e gentios.

Desse modo, Cristo é a “nossa paz” (v. 14). A profunda paz interior e a reconciliação duradoura entre pessoas e povos somente podem ser encontradas onde há dependência espiritual em Cristo. A paz de Cristo não é apenas um acordo de ausência de conflito. É a harmonia positiva habilitada dentro de nós pelo Espírito do divino Príncipe da Paz. Como Cristo trouxe paz

Qual era o “propósito” de Cristo (v. 15,16)?

A palavra “reconciliado” é literalmente “super-reconciliado” (gr., apoka-tallaze). Não importando quem somos ou o que fizemos, podemos ser salvos. No entanto, isso só pode acontecer por meio do mesmo fundamento que se aplica a todas as outras pessoas, isto é, a morte de Cristo. É essa dependência comum e “super-reconciliação” compartilhada que nos une em nossas igrejas, independentemente de nossa origem e história.

Leia Isaías 52.7

De que maneira Jesus é o cumprimento dessa profecia, de acordo com Efésios 2.14-18?

“Paz” era a grande declaração, promessa e garantia com a qual o Jesus ressurreto repetidas vezes saudava seus seguidores (Jo 20.19,21,26). A paz, por meio da cruz, é agora oferecida a todos. Jesus ofereceu a paz a “vocês que estavam longe” (os gentios; Ef 2.17) e “àqueles que estavam perto” (os judeus). E ele continua a fazer isso.

O que tanto cristãos gentios quanto cristãos judeus desfrutam agora (v. 18)?

Nosso acesso agora não é a um templo físico em Jerusalém, mas à sala do trono do céu! O poder espiritual para reconciliação dentro de nossas igrejas vem de nossa reconciliação com nosso Pai celestial na condição de pecadores.

Existem aspectos de sua história — nacionalidade, etnia, classe social, educação — que você usa como barreira para se separar de outros cristãos (talvez de modo parcialmente consciente) por valorizar excessivamente essas coisas como sendo intrínsecas à sua identidade?

De que maneira esses versículos desafiam seu comportamento e o libertam dele?

Há outro cristão que o tenha magoado profundamente? De que maneira olhar para aquilo que Jesus fez na cruz o capacita a perdoar essa pessoa? Como você poderia buscar reconciliação com ela?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 64;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 2.19-22$t$, 64,
$conteudo$P

aulo agora nos ensina de que modo devemos ver nossa igreja local, contando-nos como Deus a vê. É espetacular! Recebidos

Leia Efésios 2.19.

De que maneira o termo “vocês” (cristãos efésios gentios) é descrito aqui? De que maneira a condição dos efésios mudou em relação ao estado natural anterior descrito no versículo 12?

Não somos imigrantes espirituais ilegais. Somos cidadãos plenos do céu, desfrutando de liberdade eterna como residentes permanentes, com passaportes carimbados pelo sangue do rei. Isso significa que não somos mais primariamente canadenses, britânicos, nigerianos, estadunidenses ou poloneses. Somos cristãos. Nossa pátria é o céu.

Não derivamos mais nossa identidade primária de nossa nacionalidade, nem de nossa família terrena. Alguns dos ensinos mais desafiadores de Jesus dizem respeito a colocar a família celestial de Deus em primeiro lugar (p. ex., Mt 8.21,22).

Você deriva sua identidade, segurança e orientação primariamente de sua nacionalidade, de sua família ou do fato de fazer parte da igreja de Deus?

Se você faz parte de uma igreja grande, o que está fazendo (como igreja e como indivíduo) para garantir que ainda se comporta como família? Fundamentado

Leia Efésios 2.20.

Sobre o que uma igreja é edificada?

Leia Mateus 7.24-27. O homem sábio é o homem que edifica sua casa sobre a Rocha que é Cristo. E Cristo é o homem sábio derradeiro, o qual edifica sua própria casa, a igreja, sobre si mesmo, a Rocha.

O que isso significa para nossas igrejas locais? Primeiro, que o fundamento está concluído e já está alicerçado: Cristo. Não há outro fundamen to para edificar uma igreja. Segundo, esse fundamento é suficiente. Ele não precisa ser aprimorado, adaptado ou complementado. Construído

Leia Efésios 3.21,22.

O que é a igreja (v. 21)?

Qual é o seu papel nela (v. 22)?

Cada igreja é uma incrível maravilha do mundo moderno. Sua igreja é o lar de Deus, a habitação dele na terra, o palácio dele, de onde nos governa, e o templo dele, onde celebramos o sacrifício consumado de Jesus. Sua igreja é uma prévia do céu — o único “edifício local” que durará para sempre.

Agradeça a Deus sua igreja. Peça graça para crescer em entusiasmo e gratidão pelo fato de você ter sido edificado junto à pedra angular do Filho de Deus. Peça também sabedoria para identificar se você corre perigo de mudar ou adaptar esse fundamento.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 65;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 3.1-3$t$, 65,
$conteudo$M

uitas pessoas amam um bom mistério. E a única coisa mais satisfatória do que o mistério em si é saber que ele foi resolvido! Em Efésios 3.1-13, Paulo explica que havia um mistério desconcertante inquietando Israel durante séculos e que dizia respeito ao plano de salvação de Deus — um mistério agora resolvido da maneira mais surpreenden te e revelado aos domínios celestiais a fim de que a sabedoria de Deus fosse admirada. Essa passagem é fundamental para a compreensão do ministério do apóstolo Paulo. A localização de Paulo

Leia Efésios 3.1.

Qual é a condição de Paulo enquanto escreve a carta? Por quê?

Reflita a respeito dos dois primeiros capítulos.

Paulo aparenta estar em qual estado de espírito (1.3,15,16)?

Tendo em vista o local em que Paulo escreve a carta (3.1), por que isso é incrível?

Paulo começa dizendo “Por essa razão...”, pois está prestes a explicar novamente o motivo pelo qual ora pelos efésios (v. 14). Contudo, percebe, em seguida, que precisa interromper sua fala para explicar o que quer dizer ao afirmar que é um prisioneiro por amor deles — precisa explicar seu próprio papel no plano de Deus em salvar os gentios.

A alegria de Paulo não reside em suas circunstâncias, mas, sim, em sua salvação (e na salvação dos cristãos efésios). Ele louva a Deus ale gremente em vez de se lamentar em sua prisão.

Pense a respeito das circunstâncias em sua vida que você gostaria de mudar. Como seria se você seguisse o exemplo de Paulo aqui? A estratégia de Deus

Leia Efésios 3.2,3.

O que Paulo acha que os efésios devem “ter ouvido falar”?

A palavra “administração” (NIV; “responsabilidade”, NVI) também pode ser traduzida por “estratégia”.

De que maneira o versículo 3 esclarece o que Paulo está dizendo no versículo 2?

De que modo o versículo 2 explica o versículo 1 — Por que Paulo é um prisioneiro? Porque a maneira de Deus disponibilizar sua graça aos gentios foi ofensiva. A “estratégia” envolvia a ideia de a salvação ser oferecida, sem nenhuma obrigação de se tornar judeu, por meio de um homem executado a pedido das autoridades judaicas.

De que maneira, então, Paulo aprendeu “o mistério” — a surpreendente estratégia de Deus (v. 3)?

Paulo destaca que seu evangelho — a solução para o “mistério” — veio a ele por revelação; não se trata de uma invenção, como já havia “escrito brevemente” (provável referência a Ef 1.1,9,10).

Agradeça que você vive em uma época em que o “mistério” da estratégia do evangelho de Deus foi revelado. Agradeça que esse “mistério” foi revelado por Deus, e não imaginado por homens, de modo que você pode ter confiança absoluta a esse respeito.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 66;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 3.4-9$t$, 66,
$conteudo$A

estratégia de Deus em mostrar sua graça havia sido um mistério. Paulo sabia a solução, e ele a compartilha conosco nos versículos seguintes. Descoberta

Leia Efésios 3.4,5.

O que Paulo está oferecendo aos seus leitores (v. 4)?

O versículo 5 é um pouco confuso. Paulo diz em Romanos que o evangelho havia sido “prometido de antemão por meio dos profetas de Deus nas Sagradas Escrituras” (Rm 1.2).Aqui, Paulo diz que o evangelho não era previamente conhecido. Contudo, a promessa e a estratégia são coisas diferentes. A promessa do evangelho de Deus de abençoar todas as nações era conhecida desde Abraão (Gn 12.1-3). O que era completamen te desconhecido e inacessível a “outras gerações” não era o plano de Deus em salvar todas as nações, mas, sim, como Deus poderia realizar um plano tão grandioso. Agora, Paulo diz, esse mistério foi finalmente revelado aos apóstolos, entre os quais ele se inclui. O evangelho de Paulo não era um novo evangelho, mas o antigo evangelho revelado e esclarecido. Qual é, então, o conteúdo desse mistério revelado aos apóstolos? Revelado

Leia Efésios 3.6.

Qual é o mistério?

Poderíamos facilmente perder de vista como isso foi chocante. Nunca foi uma surpresa o fato de que gentios poderiam se juntar ao povo de Deus, isto é, por meio da submissão à lei de Moisés. Paulo, entretanto, está declarando que os gentios podem ser incluídos entre o povo salvo de Deus sem que tenham de se tornar judeus, por meio da fé no evangelho de Jesus Cristo, e que judeus que guardam a lei também precisam colocar sua fé em Cristo. O evangelho “não se fez conhecido aos homens de outras gerações, da forma que se revelou agora” (v. 5). Você percebe que está em uma posição mais privilegiada que os israelitas que ouviram Deus no monte Sinai ou até mesmo que os profetas do Antigo Testamento? Quais, segundo Paulo, são os três privilégios maravilhosos que a fé no evangelho traz (v. 6)? Não consta “com Israel” no original. Nosso privilégio não é apenas se juntar ao antigo Israel, mas se juntar aos judeus em um povo comple tamente novo em Cristo. Somos herdeiros de tudo quanto está prometido. Leia Apocalipse 22.1-5. É isso que compartilharemos juntos! O pregador

O que Paulo havia se tornado (Ef 3.7)? Por que isso era significativo (início do v. 8)? Qual era o papel de Paulo (v. 8,9)? “Servo” (NIV; “ministro”, NVI) literalmente significa “escravo”. Paulo não está apoiando a ideia de escravidão aqui. A escravidão, tanto na época quanto hoje, era uma exploração repugnante de pessoas incri velmente preciosas a Deus. Entretanto, somente quando compreendemos o horror da escravidão é que começamos a sentir a maravilha da autodescrição de Paulo no versículo 7. Ele é um homem sob o comando de Deus e está maravilhado por ser permitido a ele estar nessa condição. Sua visão de si mesmo no versículo 8 não é uma falsa modéstia; pelo contrário, provém da profunda consciência de seu pecado anterior, que foi visto de maneira mais terrível em sua perseguição à igreja de Cristo. Leia Atos 7.54—8.1; 9.1-16.

Nunca compreenderemos a maravilha do evangelho até que compreenda mos o horror de nossa rebelião contra Cristo. E nunca conheceremos a alegria de servir ao Rei (ou de “ser seu escravo”) até que percebamos como isso é um privilégio imerecido. Você aceita sua própria pecaminosidade — principalmente aquela antes de você receber a fé em Cristo — ou você tende a diminuí-la ou justificá-la? Você se dá conta de que conhece a graça de Deus somente pela “operação do poder [de Deus]”? Responder “sim” a essas questões faz qual diferença para sua visão acerca de si mesmo e para seu serviço acerca do evangelho?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 67;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 3.10-13$t$, 67,
$conteudo$Q

ual é a intenção de Deus em chamar os apóstolos para pregarem o mistério revelado do evangelho do Cristo crucificado? A resposta é simplesmente arrebatadora. A intenção de Deus

Leia Efésios 3.10,11.

O que Deus quis tornar conhecido (v. 10)?

Ele quis que isso fosse conhecido “mediante” o quê (v. 10)? De que maneira isso acontece (lembre-se do v. 6)?

A “multiforme sabedoria” de Deus é o esplendor complexo de seu plano de salvação. E seu esplendor é revelado sempre que sua igreja se reúne! Cada igreja local é a sala de troféus de Deus.

A multiforme sabedoria de Deus se tornou conhecida a quem (v. 10)?

De que maneira Efésios 6.12 nos capacita a saber exatamente a quem Paulo está se referindo aqui?

Em outras palavras, a reunião de cada igreja local em qualquer lugar do mundo assemelha-se a uma daquelas comemorações que os campeões fazem em um caminhão de bombeiros. No entanto, em vez de ser um time de futebol celebrando uma vitória esportiva temporária em um estádio, a reunião de uma igreja em nome de Cristo é uma celebração e uma declaração acerca da vitória espiritual eterna de Deus na cruz sobre Satanás, o pecado e a morte. Os sofrimentos de Paulo

Leia Efésios 3.12,13.

De que maneira o versículo 12 é, de muitas formas, um resumo de tudo quanto Paulo disse desde o início do capítulo 2?

Paulo instou os efésios a não fazerem o quê (v. 13)? Qual motivo ele apresenta?

De que maneira isso deve influenciar na forma de reagirmos quando ouvimos casos de cristãos que estão sofrendo por nossa fé (mesmo aqueles que estão mais próximos e nos são mais queridos)?

Não há necessidade de ficarmos desencorajados por causa da hostilidade à nossa fé. Isso não é um sinal de que algo deu errado — é tudo parte do plano de Deus. A notícia foi divulgada, o mistério resolvido — a nova se espalhou rapidamente: Cristo está edificando sua igreja em cada nação da terra, em cada igreja local reunida que celebra e manifesta sua sabedoria fulgurante e sua maravilhosa graça nos domínios espirituais, mesmo em meio à perseguição.

Sua igreja é uma sala de troféus da graça e sabedoria de Deus. De que modo isso influenciará sua atitude ao ir à igreja no próximo domingo?

Peça graça ao Senhor para ver o sofrimento por ele e por seu povo não como algo a ser evitado ou por meio do qual ficar desencorajado, mas, sim, como algo a ser suportado de maneira alegre e confiante.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 68;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 3.14,15$t$, 68,
$conteudo$T

enho sérias dúvidas se muitos de nós perceberam de modo signifi c a tivo quanto Jesus Cristo nos ama. Vamos convidar Paulo para explicar isso nos próximos sete versículos, à medida que compartilha mais uma oração. Leia Efésios 3.14,15. “Por essa razão...”

Reflita a respeito do que vimos até aqui em Efésios.

Em sua opinião, qual é a “razão” (v. 14) pela qual Paulo dobra seus joelhos em oração?

Quando Paulo chega em Efésios 3.14, podemos presumir que ele tenha três motivações para orar:

1. A maravilha do plano de Deus de “fazer convergir todas as coisas [...] em Cristo” (1.10), do qual o próprio ministério de Paulo faz parte (3.2-13). 2. A realização, promovida por Deus, da reconciliação vertical entre nós e ele mesmo por meio de

Cristo (2.1-10), bem como da reconciliação horizontal de uns com os outros na igreja (2.11-22). 3. O encorajamento que Paulo ofereceu em Efésios 2.22, um pouco antes de interromper sua fala para explicar seu ministério: o privilégio e a responsabilidade de fazer parte de “uma morada na qual Deus vive por seu Espírito” — a igreja.

Se diariamente, de modo intencional, você lembrasse do plano eterno de Deus (1.10), de sua reconciliação com ele e com a família de Deus (2.1-22), bem como de seu lugar na igreja dele (2.22)...

Que diferença isso faria a respeito da maneira de você orar a cada dia? A essa pessoa

Paulo está consciente de que está orando a quem (3.14)?

O que é surpreendente a respeito da maneira pela qual podemos nos dirigir àquele diante de quem devemos apropriadamente nos “ajoelhar”?

A palavra original em aramaico que Jesus usou para se dirigir a Deus — Aba — é tanto afetuosa quanto respeitosa (não existe um equivalente direto em nossa língua). O que nos impulsiona a orar não é a técnica, mas a teologia — ou seja, não um entendimento acerca de como orar, mas, sim, a quem oramos. Fomos “adotados como filhos” (1.5). Por isso, estamos autorizados a falar com o TodoPoderoso chamando-o de “Pai”. Nosso Pai celestial nos ama de maneira apaixonada e perfeita. Ele sempre sabe o que é melhor para nós, é sempre paciente e bondoso e sempre capaz de prover aquilo de que necessitamos. É generoso e sábio, firme em disciplinar, mas pronto a perdoar, e nunca quebra uma promessa.

Observe que o Pai provê e capacita a “família” (3.15), a qual, por sua vez, reflete a “família” da Trindade em que ele é Pai. As famílias humanas não são um acidente da evolução social, de modo que possamos dispensá-las ou brincar com elas. Elas são dádivas de Deus que refletem (embora de modo imperfeito) a família de nosso Deus trinitário.

Deleite-se em poder falar com Deus carinhosamente, mas de maneira respeitosa, como seu “Pai”.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 69;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 3.16,17a$t$, 69,
$conteudo$O

que Paulo pede que o Pai conceda? Ele menciona três vezes a palavra “poder” (v. 16,18,20). Não se trata de poder para obter riqueza ou para curar, mas para duas coisas que são mais maravilhosas. Leia Efésios 3.16,17a. Onde o poder opera

Quem concede poder e onde esse poder opera (v. 16)?

O que esse poder pode fazer (v. 17a)?

Observe que a atuação do poder de Deus não nos concederá uma força óbvia ou visível para ser exibida. Trata-se do poder de convicção espiritual invisível no âmbito do coração e criado pelo Espírito de Deus. Por “coração”, Paulo quer dizer o centro de nossas afeições, nossas decisões e nosso comportamento.

Esse é o lugar pelo qual ele ora para que Deus opere por meio de seu Espírito, que habita em nós a partir do momento em que cremos no evangelho de Cristo (1.13,14). O ministério do Espírito deve ser um holofote que chama a atenção para a magnificência de Jesus, resultando em pessoas e igrejas nas quais Jesus é continuamente glorificado e amado, bem como em pessoas e igrejas que são cheias do Espírito Santo. O que o poder faz

A palavra “habitar” (3.17a) não significa apenas chegar, mas estabelecer-se, “sentir-se em casa”.

De que maneira isso nos ajuda a compreender pelo que Paulo está orando aqui?

Quando uma pessoa vem fazer uma breve visita, ela normalmente apenas deixa seus pertences em suas malas de viagem e tenta não tumultuar o quarto. Porém, quando uma pessoa se muda para um novo lar definitivamente, ela muda o papel de parede, pinta o teto, substitui o carpete e se desfaz dos móveis velhos. Quando o Espírito de Cristo se muda para dentro de uma pessoa, ele gradualmente redecora todos os cantos. Ele faz mudanças em nós, e trabalhamos junto com ele para fazer essas mudanças. Conforme assim fazemos, Cristo ficará “mais à vontade” em nossa vida.

Agora somos uma residência para Jesus. Isso nem sempre será fácil, pois ele nos ama muito para não fazer nada em relação ao nosso pecado. Ele transformará nosso interior de maneira gentil e gradual, mas também radical, porque nos ama.

De que maneira você tem experimentado o poder do Espírito renovando seu coração como um lar adequado para Cristo? (Se você não consegue pensar em nada, peça a outro cristão que o conheça bem. Se ainda assim você não consegue indicar coisa alguma, confronte a si mesmo se realmente está vivendo com fé em Cristo como Senhor e comprometido a viver sob o seu governo.)

Qual área de suas emoções, pensamentos ou ações o Espírito está convidando você, por meio do poder dele, a trabalhar pela mudança?

De que maneira esses três versículos o encorajaram a orar e o ajudaram a saber pelo que orar?

Dedique agora algum tempo ajoelhado diante de seu Pai.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 70;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 3.17b-21$t$, 70,
$conteudo$P

aulo orou para que seus amigos tivessem poder para mudar, de modo que Cristo estivesse “em casa” neles. Agora ele ora para que eles tenham poder para reconhecer... O fundamento

Leia Efésios 3.17b-19. Paulo ora para que os efésios “estejam” o quê (v. 17b)? Leia Efésios 2.4,5 e 5.1,2. Qual é o “amor” em que precisamos estar plantados e fundamentados? Quatro dimensões

Paulo está orando para que, pelo poder de Deus, os efésios “possam” fazer o quê (3.18)?

No versículo 18, Paulo está usando dimensões que são notavelmente apropriadas para os grandes temas dessa carta concernentes à graça de Deus:

• “Largura” ilustra seu amor acolhedor Leia Efésios 2.17. Se você confia em Cristo, não há nada que tenha feito ou poderia fazer que o colocaria fora de seu alcance. E não há ninguém que você conheça a quem Cristo rejeitaria alcançar se fosse até ele com fé. • “Comprimento” ilustra seu amor duradouro. O amor de Deus por nós começa antes da Criação — leia Efésios 1.4,5. Por mais que o decepcionemos seriamente e com frequência, ele nunca nos deixará. Ele se comprometeu a nos amar desde a eternidade passada e por toda a eternidade futura. • “Altura” ilustra seu amor engrandecedor.Leia Efésios 2.6,7. Não somos apenas salvos do inferno; somos elevados ao céu. Precisamos compreender quão elevado é o amor de Cristo, quanto ele tem reservado para nós na eternidade e como seremos exaltados e privilegiados para sempre na nova criação. • “Profundidade” ilustra seu amor sacrificial. Leia Efésios 1.7,8. Cristo experimentou o trauma espiritual de sofrer em sua própria alma o inferno que todo o seu povo merecia. E fez isso por amor pessoal a você. Seu amor é incrivelmente profundo.

Assim como não podemos examinar as profundezas do oceano, também nunca conseguiremos compreender esse amor. Ele “excede todo o entendimento” (3.19). No entanto, assim como podemos brincar, nadar e mergulhar no oceano, também podemos “conhecer” esse amor. Podemos pessoalmente experimentar ser “cheios à medida de” Cristo.

Reflita a respeito do tempo em que você lutava sendo cristão ou que repetidamente cedia a algum pecado em particular. De que maneira isso estava ligado a uma falha em compreender o amor de Cristo por você?

Largura, comprimento, altura, profundidade. Qual aspecto do amor de Cristo o emociona de modo particular hoje? Ele é capaz

Leia Efésios 3.20,21.

O que o poder de Deus é capaz de fazer (v. 20)?

Leia Efésios 1.20,21. Se duvidarmos disso, para onde devemos olhar?

Eu e você simplesmente não podemos imaginar tudo quanto Deus é capaz de fazer de maneira (literalmente) “superabundante”. Quando pedimos coisas que irão promover seu plano de convergir todas as coisas em Cristo — incluindo a ajuda para nos tornarmos um lar adequado para seu Espírito e conhecermos o amor incompreensível de Cristo —, precisamos nos lembrar com quem estamos falando. Deus está disposto e é capaz de fazer de maneira superabundante mais por nós, e em nós, do que qualquer pessoa possa algum dia imaginar.

Fale com o Pai agora, orando por poder para mudar e poder para compreender. Mas não ore somente por você — Paulo faz essa oração em favor de outros, e nós também devemos fazer o mesmo. Traga à mente aqueles cristãos queridos pelos quais você orou à medida que estudamos a oração de Paulo no capítulo 1. Ore para que o poder de Deus esteja operando neles dessa maneira.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 71;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 4.1-3$t$, 71,
$conteudo$P

aulo agora se volta para a seguinte questão: “Como as igrejas — o meio pelo qual Deus declara sua sabedoria triunfante aos domínios celestiais (3.10) — crescem”. Três ingredientes

Em Efésios 4.1-16, Paulo esboça três ingredientes básicos para o crescimento da igreja. Esses princípios fundamentais de crescimento espiritual genuíno são os mesmos para cada igreja em cada contexto. Aplicá-los levará tempo e sacrifício, mas é assim que Deus sempre faz suas igrejas crescerem. E os três ingredientes, em que nos concentraremos nos próximos quatro estudos devocionais, são: unidade (v. 2-6) no ministério (v. 7-12) para a maturidade (v. 12-16). Seu chamado

Leia Efésios 4.1-3.

Qual é “o chamado que você recebeu” (v. 1; veja Ef 1.4-14)?

O que devemos fazer à luz do entendimento desse “chamado” (v. 1)?

O que isso envolve (v. 2,3)? Como é cada uma dessas qualidades na prática?

Observe que o “chamado” não é apenas para Cristo, mas também para a unidade de sua igreja. Não se trata de unidade entre as igrejas, mas de unidade relacional dentro das igrejas. É importante entender o que essas qualidades são e o que não são:

1. Ser “humilde” (v. 2) não é ser tímido. Significa restringir nosso senso de que merecemos estar no foco do cuidado e da atenção de outras pessoas e nos comprometermos a promover o que for melhor para os outros. 2. Ser “gentil” (v. 2; literalmente, “manso”) não é ser fraco. Significa lidar com outras pessoas com bondade, e não com aspereza; com compai xão, e não na força; e com encorajamento, e não na intimidação. 3. Ser “paciente” não significa fervilhar internamente e não externamente. Significa ser longânime em relação às falhas dos outros e tardio em buscar repreendê-los, reconhecendo que o crescimento espiritual leva tempo e que todos nós somos uma obra que está em andamento.

Se somos humildes, gentis e pacientes, o que seremos capazes de fazer (final do v. 2)?

E seremos capazes de nos comprometer em fazer o quê (v. 3)?

O Espírito cria um sentimento especial de unidade dentro de uma congregação. Devemos fazer tudo o que pudermos para promover a unidade e evitar tudo o que podemos fazer para prejudicá-la.

A cultura ocidental se deixa levar pela visão de que ser obstinado, agressivo e ambicioso em favor de nós mesmos e de nossa família é algo bom. Isso, porém, é o oposto dessas qualidades — e sufoca o crescimento de uma igreja, pois acabamos arrastando nossa igreja em direções diferentes.

De que maneira você acha ser mais fácil seguir a cultura do que o exemplo de nosso Cristo?

Com quem você acha difícil agir de maneira paciente? De que maneira o amor profundo do evangelho o capacita a permanecer amoroso para com essa pessoa?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 72;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 4.4-6$t$, 72,
$conteudo$P

aulo agora nos fornece uma grande motivação para “[fazermos] todo o esforço para mantermos a unidade do Espírito” (v. 3) em nossas igrejas... Leia Efésios 4.4-6. Unidos como um

Quantas vezes Paulo usa a palavra “um” aqui? Que argumento você acha que ele está suscitando?

Os aspectos da unidade que Paulo destaca aqui não são acidentais. Ele está se referindo à unidade que cada uma das três pessoas dentro da unidade da Trindade cria entre os cristãos na igreja de Deus:

• “Um só Espírito” nos chamou para “um só corpo” da igreja por meio de “uma só esperança” de vida eterna no evangelho (v. 4). • “Um só Senhor”, Jesus, é proclamado em uma só “fé” do evangelho da Escritura, simbolizado em nosso “batismo” (literalmente, “imersão”) comum no Espírito quando nascemos de novo, representado pelas águas batismais (v. 5). • “Um só Deus e Pai” é a origem, a presença regente e sustentadora de todas as coisas e de todos no Universo (v. 6).

Tendo em vista que o próprio Deus é uma unidade amorosa de pessoas que são diferentes, mas iguais, servindo umas às outras, cada igreja que ele reúne em Cristo deve ser uma unidade amorosa de pessoas diferentes, mas iguais, servindo umas às outras. A comunidade de sua igreja pode refletir o seu Criador!

De que maneira você pode ajudar proativamente a manter a unidade em sua igreja?

De que maneira os versículos de 1 a 6 ajudaram a motivar você a levar isso a sério? Lutem, mas não briguem

Leia Judas 3,4; 2Timóteo 2.23,24.

De que maneira você acha que uma igreja pode tanto “batalhar” quanto “não ser belicosa”?

Por que ambas as coisas são essenciais em diferentes circunstâncias?

Igrejas podem sofrer danos tanto por serem muito lenientes — quando, na verdade, deveríamos estar lutando corajosamente pelo evangelho contra os falsos mestres — quanto por serem muito rígidas — quando, na verdade, deveríamos ser mais pacientemente tolerantes com nosso irmão e nossa irmã em Cristo. A sabedoria em identificar essa diferença vem de estar comprometido em se regozijar com pessoas de culturas, contextos e idiomas diversos reunidas na unidade de uma só fé do evangelho, em relacionamento com um só Pai, um só Filho, nosso Senhor, e um só Espírito.

Em sua opinião, você e sua igreja correm mais perigo de serem muito lenientes ou muito rígidos? De que maneira você pode evitar essa armadilha?

Ore por sua igreja. Agradeça a Deus a unidade do evangelho e ore para que você nunca deixe de valorizar essa unidade, mas, ao contrário, suporte os outros em amor.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 73;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 4.7-13$t$, 73,
$conteudo$T

endo enfatizado a importância da unidade na igreja, Paulo agora explica o valor de diversos ministérios entre seus membros. Crescemos por meio da unidade no ministério. Uma cultura de contribuição

Leia Efésios 4.7-10.

O que foi concedido a cada cristão (v. 7)? Por quem?

Paulo não está se referindo aqui à salvação, mas à graça adicional dos dons no ministério. Essas habilidades não são concedidas para nossa satisfação ou reputação pessoal, mas, sim, para enriquecer a vida e o serviço de outros em nossa igreja. Na verdade, são mais ministérios do que habilidades. E, uma vez que é Cristo quem concede os dons, não faz sentido ter inveja do dom de outra pessoa ou orgulho de seu próprio dom. Somos aprovados por Deus por nossa piedade, e não por nosso talento.

No versículo 8, Paulo relembra o salmo 68, uma canção que celebra a vitória de Deus ao resgatar Israel do Egito e, depois, devolver seu povo redimido ao mundo. Paulo reconhece que esse salmo aguardava com expectativa a vitória de Cristo em sua ascensão ao céu (Ef 4.10) depois de ter descido ao mundo para morrer por nós (v. 9) — devolvendo-nos, então, às suas igrejas como dons.

Não apenas temos os dons de Deus. Somos os dons de Deus para sua igreja. Não devemos ser consumidores, mas colaboradores!

Você enxerga suas “habilidades” como coisas nas quais você é bom, coisas a serem desfrutadas para si mesmo, ou como dons de Cristo a serem usados para seu povo?

Você acha fácil ver a igreja como um local de “consumo”? De que maneira? Como esses versículos desafiam essa atitude? Jogo em equipe

Leia Efésios 4.11-13.

Quem foi concedido às igrejas (v. 11)?

Eu acho que, por “profetas”, Paulo está se referindo aqui aos profetas do primeiro século (assim como em Ef 2.20), que ensinavam e preservavam a fé, juntamente com os “apóstolos” fundadores, até que o Novo Testamento ficasse completo.

Por que Jesus dotou pessoas das maneiras descritas em Efésios 4.11 (v. 12)?

Qual é o alvo de todas essas “obras de serviço” (v. 12,13)?

“Serviço” (v. 12) também pode ser traduzido por “ministério” ou “adoração”. Todos nós devemos ser preparados para nossos ministérios pessoais por nossos professores das Escrituras, a fim de que nos tornemos mais unidos e mais maduros na compreensão de nossa fé e no conhecimento de nosso Salvador (v. 13). É assim que sua igreja cres cerá — é um jogo em equipe, e você está no time.

Você está orando pelos evangelistas, pastores e mestres de sua igreja?

Você está permitindo que eles o preparem para que você use seus dons para servir à sua igreja? De que maneira?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 74;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 4.14-16$t$, 74,
$conteudo$O

crescimento cristão diz respeito a “[atingir] a medida da plenitude de Cristo” (v. 13) — ou seja, crescendo para se parecer mais com Jesus. É isso que protege e ajuda nossas igrejas. Não somos mais crianças

Leia Efésios 4.14.

Qual perigo Paulo retrata aqui?

Por que a unidade, o conhecimento e a nossa semelhança com Cristo (v. 13) são proteções contra ser “levado de um lado para o outro [...] por todo vento de doutrina”?

Precisamos crescer! Não devemos ser como crianças que seguem sucessivas modas, ou como barcos que se desviam em direção a águas perigosas. Isso é um perigo para todas as igrejas — seja o modismo experimental do momento, seja a estratégia de crescimento de igreja, seja (em igrejas mais teologicamente conservadoras) um intelectualismo arrogante desacompanhado de oração, seja, por fim, um materialismo pouco generoso.

Você já testemunhou como é ser “levado de um lado para o outro”, quer em sua própria vida, quer na vida daqueles próximos a você? De que modo uma unidade e um conhecimento maior poderiam ter evitado isso?

Tendo lido o parágrafo acima da pergunta anterior, qual é, em sua opinião, o maior perigo para sua própria vida e para sua igreja como um todo? “E”, não “ou”

Leia Efésios 4.15,16.

O que devemos fazer “Pelo contrário” (início do v. 15)?

O que acontece quando uma igreja se esquece da “verdade” ou do “amor”?

Qual é o resultado positivo de “falando a verdade em amor”?

Precisamos ter conversas bíblicas uns com os outros. Elas são uma forma de ensino bíblico que ajuda as pessoas a amadurecerem na semelhança com Cristo. A Bíblia estabelece a verdade de Deus e nos conta acerca do amor de Deus. Nenhum dos dois é opcional.

Tudo isso é trabalho de quem (v. 16)?

O crescimento da igreja é um jogo em equipe. Sua igreja precisa que você se envolva e faça sua parte. Efésios 4.1-16 nos ensina que precisamos manter nossa unidade, contribuir em nosso ministério e crescer em nossa maturidade.

Em nossa igreja, há uma oração gravada em uma das paredes para nos ajudar a lembrar o que é esperado de nós por meio de Cristo. Talvez você ache útil fazer essa oração se comprometendo com sua própria igreja familiar:

Deus todo-poderoso, nosso Pai celestial,

Por sua graça em Jesus Cristo e no poder de seu Espírito Santo, por favor, ajude-me a buscar a santidade em oração e a obedecer com alegria à sua Palavra, e, então, como um membro de minha igreja, em submissão à sua liderança, a:

• crer e proclamar o evangelho de que Cristo é meu Salvador amoroso e meu Senhor que vive; • frequentar regularmente os cultos dominicais de minha congregação e o grupo pequeno apropriado durante a semana; • contribuir com minha oração, meu tempo e meus talentos para a vida de nossa igreja e seus ministérios; • doar sacrificialmente para o ministério do evangelho de nossa igreja e seus parceiros de missão;

... em nome de Jesus Cristo, meu Senhor, amém.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 75;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 4.17-19$t$, 75,
$conteudo$U

ma igreja “cresce [...] conforme cada parte faz o seu trabalho” (v. 16). O que é esse “trabalho”? Paulo não responde a isso falando a respeito de programas de igreja, mas da piedade da igreja. O versículo 17 flui diretamente do versículo 16. E a simples questão é a seguinte: O dom que você é para a sua igreja tem muito mais que ver com ser piedoso do que com ser capaz. Não mais

Leia Efésios 4.17.

Como cristãos, o que devemos fazer (v. 17)?

É muito fácil vivermos como camaleões espirituais, imitando o mundo não cristão — “os gentios” — a fim de permanecermos camuflados e seguros contra a crítica ou o desconforto. Às vezes, fazemos isso de modo consciente; contudo, com mais frequência, e de maneira mais perigosa, vivemos sem nem mesmo notar que estamos nos acomodando à moralidade secular ou às prioridades seculares.

Paulo diz: “Parem” — isso não é uma sugestão ou um convite; é uma ordem —, e “insiste nisso no Senhor”. No entanto, de que modo “vivem” os gentios? Como é na prática

Leia Efésios 4.17-19.

Como é, na prática, viver “como os gentios” no que diz respeito a:

• nossa mente (final do v. 17,18a)? • nossa alma (v. 18)? • nosso coração (v. 18)? • nosso código moral (v. 19)? • nosso senso de satisfação (v. 19)?

De que maneira você vê esses aspectos de viver “como os gentios vivem”:

• nos não cristãos à sua volta? • em sua própria vida? Não é liberdade; é uma prisão

Eis os estágios progressivos do pecado: o endurecimento obstinado do coração leva à ignorância pessoal acerca de Deus, o que leva ao entendimento espiritual obscurecido, o qual, por sua vez, leva ao comportamento impiedoso, que promete muito, mas pouco entrega, deixan do-nos sempre desejando “mais” (v. 19).

Esse estilo de vida não é um caminho para a liberdade; é uma cela de prisão da qual as pessoas não podem escapar, a menos que Jesus rompa as amarras da prisão e as resgate.

Quanto aos cristãos, trata-se do retorno a uma cela para a qual todos nós facilmente rastejamos. No entanto, tendo em vista que agora somos diferentes, achamos a cela um lugar desprezível. Vemos que ela não satisfaz verdadeiramente e que a porta está sempre aberta, pois o sangue de Cristo foi pago não apenas para nos libertar, mas também para nos manter livres para deixarmos a cela a qualquer momento.

Por que é mais fácil não ver “os gentios” como Paulo vê? De que maneira ter uma visão diferente da de Paulo influencia nossa busca por santidade e nosso desejo de evangelizar?

Em que momento você acha mais fácil viver como um camaleão? Como seria, na prática, ser semelhante a Cristo em tal situação?

Há alguém em sua igreja que você precisa ajudar a sair de sua “cela”? De que maneira você o ajudará?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 76;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 4.20-24$t$, 76,
$conteudo$P

aulo nos disse para pararmos de nos camuflar como camaleões. Agora, ele se concentra em explicar de que modo podemos ser caracteristicamente santos. Assim como o estilo de vida dos gentios, isso começa na mente. Não foi o que vocês aprenderam

Leia Efésios 4.20,21.

A maneira gentílica de pensar nunca nos conduz a quê (v. 20)?

Onde somos “ensinados” a viver uma vida santa (v. 21)?

Essa é a única vez em Efésios que Cristo é chamado de Jesus. Ge ralmente, Paulo quer enfatizar a entronização do Senhor. Aqui, porém, ele quer nos lembrar que Deus, ao se tornar homem, nos ensinou a viver uma vida cristã de retidão, o que ele fez em nosso lugar, e a praticar o que ele pregou para nos mostrar o que queria dizer.

A santidade foi testemunhada na revelação histórica de Deus na pessoa de Jesus. Verdade e salvação são encontradas em Jesus. Lemos a Bíblia para “aprender” de Jesus. Ser um cristão não tem que ver com confiar em uma fórmula, mas, sim, confiar em um amigo.

De que maneira isso o empolga e o motiva a ler as Escrituras? O velho homem e o novo homem

Leia Efésios 4.22-24.

Aprender de Jesus a santidade é como trocar de roupa.

De que maneira precisamos aprender a nos “despir” (v. 22)?

O ato de se “despir” nos prepara para sermos o quê (v. 23)?

Não podemos simplesmente nos livrar de nossas atitudes e desejos; eles precisam ser substituídos. Dessa forma, por exemplo, não devemos simplesmente ter como meta parar de sentir inveja; precisamos ter como meta pensar de maneira grata.

O que acontece à medida que nossa mente é renovada (v. 24)?

Em outras palavras, devemos nos tornar mais parecidos com Jesus. Quando confiamos em Cristo pela primeira vez, Deus nos veste com sua justiça, sua perfeição. É como se eu não tivesse nada para vestir em um casamento e, então, um amigo me empresta — na verdade me dá — um terno caro. Eu não desejaria vestir o terno por cima de minha calça jeans imunda ou de minha camiseta suada! Fazer isso depreciaria o valor daquilo com que fui presenteado. Eu ia querer tirar minhas roupas sujas.

Da mesma forma, Deus não quer que continuemos pecando como se nada tivesse acontecido. Somos salvos completamente pela santi dade de Cristo, mas somos salvos para uma nova vida de aprendizado da santidade.

Agradeça a Deus que tenha lhe mostrado em Jesus como é uma vida piedosa na prática.

Peça que Deus lhe mostre aspectos de seu comportamento ou caráter dos quais você precisa “se despir”.

Peça que ele renove a sua mente — suas atitudes e afeições — e fale com ele a respeito de qualquer desejo que você sabe não estar moldado à semelhança de Cristo.

Em seguida, peça que ele opere em você por meio de seu Espírito para que suas atitudes renovadas fluam externamente em um comportamento à semelhança de Cristo.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 77;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 4.25-32$t$, 77,
$conteudo$C

omo são as roupas cristãs na prática? Paulo agora explica isso com alguns exemplos práticos. Despindo-se, revestindo-se

Leia Efésios 4.25-32.

Trabalhe com a lista de Paulo nessa passagem, respondendo às perguntas a seguir sem olhar para as notas que estão abaixo.

Somos instados a nos “despir” e/ou “revestir” do quê?

De que maneira nosso comportamento em cada uma dessas áreas comprometerá ou fortalecerá a unidade de nossa igreja e seu testemunho aos domínios celestiais? Detalhes de moda

Paulo está nos apresentando maneiras muito práticas da vida real de nos despirmos de nosso velho homem e nos revestirmos do novo homem, a fim de nos tornarmos mais parecidos com Jesus:

Mentira e verdade (v. 25): Chega de fofocas ou censuras por meio de elogios falsos; chega de exageros ou mentiras; chega de críticas hipócritas.

Ira e pecado (v. 26,27): Às vezes, é apropriado ficar irado — mas isso não deve se tornar uma indignação que se pretende justa em razão do nosso senso de importância. Dessa forma, é sábio adotar um limite de tempo para o ressentimento; abrir mão de nossas causas e bandeiras ao final do dia para evitarmos o crescimento do rancor e da facção que comprometem a unidade.

Roubo e trabalho (v. 28): Chega de tomar coisas “emprestadas” que nunca devolvemos, de cobrar preços excessivos a clientes, de driblar os impostos... Antes, trabalhemos duro, não para gastarmos de modo excessivo com nós mesmos, mas para suprir as necessidades dos outros. Não devemos mais usar nossas mãos para obter, mas, sim, para doar.

O que dizemos (v. 29): A palavra “torpe” significa literalmente “podre”. Um discurso como esse precisa ser substituído com palavras que edificam, que encorajam e fortalecem.

O Espírito (v. 30): É possível “entristecer” a Deus. Paulo está se referindo aqui às rebeliões de Israel quando a caminho da terra prometida que tanto entristeceram o Espírito (Is 63.10). Não devemos entristecer a Deus por meio de murmurações intermináveis de descontentamento, ou então por meio de desobediência moral como eles fizeram.

Maldade e bondade (v. 31,32): Devemos, pouco a pouco, substituir todos os nossos instintos maliciosos dirigidos àqueles que nos difamam ou nos decepcionam por um pouco da graça — a bondade e a com paixão — que Cristo mostrou, e mostra, em relação a nós.

Conforme você olha para as diferenças entre o “velho homem” e o “novo homem”, quais delas o encorajam à medida que você pensa a respeito de sua própria vida? Quais o desafiam?

Pense em uma mudança que você gostaria de fazer em cada uma dessas áreas, o que parar e/ou o que começar.

Em seguida, fale com Deus acerca de cada uma delas, pedindo que seu Espírito renove as atitudes de sua mente para que você possa se tornar mais parecido com seu Filho.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 78;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 4.32—5.2$t$, 78,
$conteudo$N

ão é fácil conformar-se a Cristo, em vez de viver como um camaleão, conformando-se ao mundo à nossa volta. Por isso, Paulo nos dá duas grandes motivações para “mudarmos”. “... Assim como...”

Leia Efésios 4.32.

Quando lutamos para ser bondosos, compassivos e perdoadores, do que precisamos nos lembrar?

De que maneira você acha que a recordação das cinco últimas palavras desse versículo nos capacitará a viver como um “novo homem”?

Se nos lembrarmos de que “Deus nos perdoou em Cristo”, então, na ocasião em que uma pessoa se arrepende (mesmo que superficialmente), nós podemos decidir nunca trazer seu pecado à tona novamente diante dela, nunca trazê-lo à tona novamente diante de outras pessoas, nunca trazê-lo à tona novamente diante de nossa própria mente e nunca trazê-lo à tona novamente diante de Deus em nossas orações. Até que a pessoa se arrependa, podemos entregar nossos desejos de vingança a Deus, que garante a concretização da justiça, e pedir que nos conceda disposição para demonstrar misericórdia e buscar reconciliação.

Lembro-me de um querido amigo, um missionário chamado James, a quem perguntaram se ele poderia perdoar os homens violentos que atiraram em seu rosto e estupraram sua esposa em sua frente. Ele respondeu: “Posso perdoá-los porque meu Pai celestial tem me perdoado muito mais”.

Existe algo com o que você está lutando para não pensar de maneira vingativa? Você está lutando para conseguir perdoar alguém?

Lembrar-se de que “Deus nos perdoou em Cristo” o capacitará a amar essa pessoa como Cristo ama você?

Você precisa falar e orar com alguém a respeito dessa questão? Oferta de aroma suave

Leia Efésios 5.1,2.

A quem devemos imitar (v. 1)?

De que maneira o versículo 2 nos mostra como isso se dá na prática?

O amor que se assemelha ao de Deus não é uma ausência fria e antisséptica de imoralidade. É um amor que está disposto a fazer sacrifícios para a salvação e bênção de outros. Esse amor tem um “aroma agradável” para Deus, satisfaz a ele e testifica a sabedoria de seus planos nos domínios espirituais. Essa é uma motivação e tanto!

Pense a respeito das áreas em que você luta para não viver “como os gentios”. De que maneira essas duas motivações o ajudam a mudar? Como será a mudança na prática?

Memorize a frase “Deus nos perdoou em Cristo”. Em que momento você mais precisará trazer essa frase à mente hoje? De que maneira você se assegurará de fazer isso?

Rememore Efésios 4.17—5.2. Agradeça a Deus seu perdão em Cristo e peça que ele o ajude a mudar e crescer da maneira que você sabe que precisa.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 79;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 5.1-8$t$, 79,
$conteudo$U

ma vez que a cultura ocidental é firmemente a favor da manifestação sexual sem controles, diminuir nossos padrões de pureza sexual se tornará algo cada vez mais atraente. O custo de se posicionar contra a sociedade nessa área será alto. Felizmente, podemos nos voltar para um grande estudioso cristão que lutou contra esse tipo de cultura em seus dias e que esclarece alguns princípios simples e atemporais que elucidam a vontade de Deus. Estamos falando do apóstolo Paulo. Nem sequer sejam mencionados

Leia Efésios 5.1-4.

De acordo com Paulo, o que deve ser eliminado da vida de cada cristão (v. 3)? Como seria agir assim em relação a cada uma dessas coisas na vida real?

Por que o trecho “nem sequer sejam mencionados” (v. 3) é especialmente desafiador?

Todas essas coisas — sexo antes ou fora do casamento, luxúria, vulgaridade e o desejo incontido de mais e mais — são sérias para Deus, por isso devem ser levadas a sério por nós. Se queremos estar na família de Deus, temos de ser diferentes.

A família de Deus não é apenas uma velha família qualquer com padrões baixos, mas, sim, a família do Deus santo e todo-poderoso — nós temos de melhorar! Observe que isso inclui nossas palavras, bem como nossas obras (v. 4).

Além de eliminar todas essas coisas, o que Paulo diz que devemos buscar igualmente (final do v. 4)?

Em certa medida, a desobediência sexual normalmente é causada pela amnésia espiritual, em que nos esquecemos da graça de Deus e, depois, por sentirmos pena de nós mesmos, permitimo-nos a satisfação de nossos apetites pecaminosos. Portanto, a solução para a imoralidade, a impureza e a cobiça não é complicada: basta ser grato.

De que maneira você é tentado nessa área? De que maneira um espírito de gratidão o ajudaria a resistir a essas tentações?

Você buscará, de modo consciente, render graças a Deus na próxima vez em que for tentado? Ninguém os engane

Leia Efésios 5.5-8.

Como Paulo apresenta alguém que vive habitualmente em imoralidade sexual sem arrependimento, na impureza licenciosa ou na avareza material (v. 5)?

Que certeza podemos ter se vivermos dessa maneira (v. 5)?

Sempre houve, e sempre haverá, alguém pronto a oferecer uma ética mais fácil e mais aceitável que a ética bíblica.

De que Paulo nos alerta então (v. 6,7)?

De que maneira a imagem do versículo 8 retrata como somos e devemos ser diferentes na maneira de viver?

Dedique algum tempo falando com Deus em gratidão por tudo o que ele tem dado a você. Fale também a respeito das maneiras pelas quais este estudo o desafiou ou fez com que você se preocupasse com outros cristãos que conhece.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 80;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 5.8-20$t$, 80,
$conteudo$P

aulo agora passa do negativo para o positivo, ou seja, daquilo que evitamos para aquilo que cultivamos conforme “vivemos como filhos da luz” (v. 8). Luz, e não trevas

Leia Efésios 5.8-14.

O que éramos, e o que somos (v. 8)?

O que isso significa para o modo em que viveremos agora?

• Versículos 8b,9: • Versículo 10: • Versículo 11:

Observe que não apenas vivemos na luz; nós somos luz (v. 8). Não temos apenas um novo ambiente que nos cerca; nascemos de novo. Somos completamente diferentes daquilo que éramos e temos uma motivação completamente diferente: fazemos “o que é agradável ao Senhor” (v. 10), e não aquilo que é agradável a nós mesmos ou aos outros.

O versículo 12 não significa que nunca devemos falar de maneira franca a respeito do pecado — seja o nosso pecado, seja o pecado de nossa sociedade. Paulo quer dizer que precisamos evitar a cultura de falar do pecado de uma maneira que o normaliza, o dignifica e o justifica. Não pertencemos mais ao mundo; pertencemos a Cristo. Assim, no versículo 14, Paulo faz uma referência a Isaías 60.1 para argumentar que, uma vez que Cristo levantou dentre os mortos como a luz do mundo, devemos agora despertar, ver o mundo e sua miséria sob a luz de Cristo e viver segundo seus ensinamentos.

Existe, de alguma forma, algo em sua vida que tenha que ver com as “obras das trevas”? De que maneira você se manterá bem longe disso no futuro? Quais ações você precisa adotar?

De que modo o fato de você saber que pode viver de uma forma que agrada ao Senhor o motiva a viver como um filho da luz? Sob a influência

Leia Efésios 5.15-20.

O que, portanto, devemos fazer (v. 15-17)?

Qual é um dos aspectos da “vontade do Senhor” (v. 18)?

Ao contrário, devemos estar sob qual “influência” (v. 18)?

Quais são os diferentes efeitos de estar cheio de álcool e ser cheio do Espírito (v. 18-20)?

Assim como vimos no versículo 4, a gratidão é o cerne da fé cristã e também a maneira com que lutamos contra a imoralidade (v. 20). O pecado é, essencialmente, ingratidão rebelde e murmuradora. A santidade é, essencialmente, uma vida de gratidão por tudo quanto Deus tem graciosamente nos concedido em Cristo. A marca do Espírito é que, impulsionados pela gratidão, cantemos alegremente em nosso coração e também com nossos lábios.

Qual é o seu cântico ou hino cristão favorito?

Cante-o agora em seu coração (e com os seus lábios, se possível!) e use-o para louvar e agradecer a Deus.

Para qual pessoa você poderia enviar uma frase desse cântico ou hino hoje, a fim de edificá-la?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 81;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 5.21-24$t$, 81,
$conteudo$P

aulo agora se volta para os relacionamentos cristãos. Em cada um deles, ele chamará os cristãos a se submeterem ou a liderarem, dependendo de seu papel, assim como todos nós nos submetemos a Cristo. Leia Efésios 5.21-24. A palavra que começa com “s”

“Submeter” significa dispor-se sob a autoridade de alguém. Alguns têm sugerido que o versículo 21 significa que todos nós devemos nos submeter uns aos outros, o que, na verdade, é impossível! A melhor visão a respeito desse versículo é a de que Paulo está apresentando um novo aspecto da submissão relacionando-a a vários relacionamentos: ao casamento, à família, ao trabalho. A motivação, em cada um dos casos, deve ser a “reverência” (temor, admiração) a Cristo.

Paulo começa com o casamento e o papel da esposa. Seu ensinamento é simples e, no entanto, desafiador, pois se trata de algo imensamente contracultural. Uma palavra às esposas

O que as esposas devem fazer (v. 22)? De que maneira você reage a isso?

Uma esposa que assim procede fornece uma ilustração de quê (v. 24)? De que maneira isso é uma motivação para obedecer à palavra de Deus no versículo 23? Qualificações e benefícios

Precisamos fazer três qualificações bíblicas da submissão:

1. A submissão sempre é condicional à obediência a Deus. Assim, uma esposa não deve obedecer a seu marido se, ao fazê-lo, tiver de pecar. 2. A submissão não é insensata. Não significa jamais oferecer uma opinião ou expressar discordância.

Mas, sim, que, após todo o diálogo, a esposa deve se submeter à liderança do marido (veja a atitude de Jesus no Getsêmani — Mt 26.39-42). 3. Submissão não diz respeito à habilidade, mas à ordem. Não é que uma esposa seja menos competente que seu marido. Se o marido tiver o mínimo de bom senso, delegará responsabilidades à esposa que sejam mais adequadas a ela do que a ele.

A submissão conforme Cristo traz três benefícios:

1. A submissão promove o consenso, e não o conflito. Em vez de deixar que houvesse confusão no casamento (que frequentemente se torna uma batalha entre a força do bíceps do homem e a língua afiada de uma mulher), Deus proveu um padrão claro e amoroso de liderança e submissão.

2. A submissão é atrativa para maridos descrentes. Leia 1Pedro 3.1-6. Muitos maridos são trazidos a

Cristo por meio das orações e do testemunho de sua esposa. 3. A submissão agrada a Deus. Leia Efésios 5.10. Paulo está nos contando uma maneira pela qual as esposas podem agradar a Deus. Nas ocasiões em que a submissão piedosa seja difícil ou ridicularizada, podemos ter certeza de que o Senhor Jesus vê e se agrada dela.

Se você é uma esposa, em que momento acha mais difícil se submeter? Por quê? De que maneira você pode usar o evangelho a fim de ser capaz de se submeter prontamente?

Você precisa conversar com um cristão sábio a respeito de algum aspecto de seu casamento?

Se é casado, você fala aos outros a respeito de seu cônjuge apenas de maneira positiva e leal? Você precisa mudar algo?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 82;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 5.25-30$t$, 82,
$conteudo$S

ubmeter-se como esposa cristã não é fácil. Pode muito bem não acontecer naturalmente. Mas o papel de um marido cristão também não é fácil e não acontecerá naturalmente. Uma palavra aos maridos

Leia Efésios 5.25.

Como os maridos devem agir em relação à sua esposa?

Supreendentemente, a instrução não é para governar ou liderar, mas para amar. A liderança deve fluir do amor e ser caracterizada por ele. Na verdade, esse mandamento é repetido quatro vezes nos versículos de 25 a 33 (v. 25, duas vezes no v. 28, v. 33). Os maridos são chamados a um compromisso contínuo de amar sua esposa de maneira sacrificial.

Paulo apresenta dois modelos de amor marital. Nosso maravilhoso Cristo

Leia Efésios 5.25-27.

Cristo amou sua igreja de modo mais supremo “entregando-se por ela” (v. 25).

De que maneira ele se entregou por seu povo?

O que, então, isso diz aos maridos a respeito de como amar sua esposa?

O marido cristão deve amar sua esposa até a morte; e, até que isso seja necessário, morrer todos os dias para aquilo que, de pequenas e incontáveis formas, é mais conveniente para ele. Um marido deve ser um provedor para sua esposa, porque Cristo é o provedor de sua igreja — não apenas materialmente, mas fisica, emocional e espiritualmente. E se a carreira de um marido, ou mesmo seu ministério na igreja, está fazendo com que essa provisão se torne continuamente impossível, ele deve então considerar alterar o que o impede por amor à sua esposa.

O que Cristo conquistou por meio de sua morte amorosa por sua igreja (v. 26,27)?

Paulo diz que esse deve ser o alvo principal de um marido em relação à sua esposa. Ele não deve buscar, em primeiro lugar, a felicidade dela a curto prazo (talvez, desejando uma vida mais fácil para si), mas, sim, a santidade dela a longo prazo. Ele precisa se preocupar mais em relação a como sua esposa se “apresentará” no dia em que ela estiver diante de Cristo; e a condição espiritual dela será levada em conside ração quando o marido também estiver diante do próprio Cristo. Seu próprio corpo

Leia Efésios 5.28-30.

Qualquer pessoa sensata cuida de seu próprio corpo; e qualquer bom marido se responsabilizará em valorizar sua própria esposa e cuidar dela. Se um marido não se preocupa em pensar a respeito do amor por sua esposa nem em priorizar o amor por sua esposa de uma maneira que ela aprecie e com que se beneficie, ele está ferindo a si mesmo tanto quanto a ela.

Se você é marido, a maneira com que você trata sua esposa é muito semelhante ou muito diferente da maneira que Jesus trata sua igreja? Você precisa pedir perdão a Deus e a ela por alguma coisa? Como você pode liderar de uma maneira mais semelhante a Cristo?

Você está liderando sua esposa de maneira que ela possa se submeter alegremente, confiando que você, em suas decisões, realmente tem no coração os melhores interesses espirituais dela?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 83;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 5.29-33$t$, 83,
$conteudo$A

o final dessa passagem a respeito de casamento, descobrimos que o en foque mais profundo de Paulo não é a nossa felicidade conjugal afinal! Vislumbres do evangelho em nosso casamento

Leia Efésios 5.29-33.

Qual é o “mistério profundo” (ou seja, o profundo segredo revelado) no versículo 32?

Paulo esclareceu esse mistério antes na carta, ou seja, que pessoas de todos os contextos estão sendo reconciliadas com Deus e umas com as outras — estão sendo trazidas à igreja — por meio da morte de Cristo, a fim de declararem a sabedoria triunfante de Deus nos domínios espirituais.

A qual evento humano o versículo 31 está se referindo?

Então, o argumento de Paulo é o seguinte: quando duas pessoas, que podem ser incrivelmente diferentes uma da outra, tornam-se “uma só carne”, isso é uma demonstração poderosa, nos domínios espirituais, da sabedoria do plano eterno de Deus em fazer convergir todas as coisas em Cristo. O poder do evangelho em motivar uma esposa cristã a apoiar seu marido em submissão, bem como em motivar um marido cristão a amar sua esposa de maneira sacrificial, apesar de seus pecados e de suas diferenças, fornece um testemunho poderoso do plano do evangelho de Deus. Vislumbres do evangelho em sua vida

Se você luta para entender a natureza do amor de Cristo por você, pense em um marido completamente dedicado. Se você luta para entender como agradar a Jesus, pense em uma esposa graciosamente apoiadora.

De que maneira esse cenário o ajuda a valorizar aquilo que você tem “em Cristo” hoje?

Se você é solteiro, viúvo ou divorciado, não perca de vista o ponto para o qual Paulo faz você dirigir sua atenção, que não está tão relacionado ao casamento humano, mas, sim, ao casamento de Cristo com sua igreja, do qual cada crente faz parte. Leia Apocalipse 19.6-9 e 21.1-5.

Se não é casado, você corre qualquer perigo de se concentrar tanto no retrato (o casamento humano) que se esquece da realidade maior ou desiste completamente dela (o relacionamento com Cristo, como parte de sua igreja)?

O que mudaria se você acreditasse que a realidade é maior do que o retrato?

Se você está dolorosamente consciente de que seu casamento está longe de ser ideal, lembre-se de que ele só pode ser uma sombra de seu casamento realizado no céu. Lembre-se também de que, quando um casamento em conflito permanece unido, ele não é um campo de batalha, mas, sim, um desfile de vitória que demonstra o poder de Deus em nos manter unidos em Cristo — um retrato do evangelho.

Se esse é o seu caso, de que maneira isso o motiva a continuar liderando amorosamente ou se submetendo de maneira apoiadora mesmo quando é muito difícil?

Uma igreja unida precisa de casamentos unidos.

Como Efésios 5.21-33 fez você:

• olhar de forma diferente para o casamento?

• conduzir seu casamento de forma diferente?

• orar por casamentos em sua igreja de forma diferente?

Dedique algum tempo agora orando pelos casamentos de sua igreja.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 84;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 6.1-4$t$, 84,
$conteudo$D

eus é uma família constituída de três pessoas: Pai, Filho e Espírito. Ele projetou a humanidade, que foi feita à sua semelhança, para a vida em família tanto em nossas igrejas quanto em nossos lares. Assim, tendo visto a orientação bíblica para o casamento, vamos considerar agora o que Efésios diz a respeito dos filhos. Uma palavra aos filhos

Leia Efésios 6.1-3.

A palavra usada para “filhos” refere-se a relacionamento, e não à idade. O contexto, porém, deixa claro que Paulo tem em mente filhos pré-adultos que não são casados e moram com os pais.

O que eles devem fazer e por quê (v. 1)?

Não é que os filhos devem obedecer porque seus pais sabem mais (muitas vezes, eles não sabem!), mas, sim, porque é uma oportunidade de agradar ao seu Senhor. Se você é pai, é útil encontrar oportunidades para explicar isso aos seus filhos.

Quando os filhos obedecem dessa maneira, qual mandamento eles estão cumprindo (v. 2)?

“Honrar” significa respeitar seriamente. Poderia ser traduzido por “temer” ou “reverenciar”.

De que maneira, então, você acha que filhos adultos com pais ainda vivos cumprem esse mandamento? Uma palavra aos pais

Leia Efésios 6.4.

A quem Paulo está se dirigindo aqui?

O pai de família tem uma posição de responsabilidade particular em liderá-la (mães solteiras ou abandonadas precisarão preencher esse papel na ausência do pai).

O que os pais não devem fazer?

O que devem fazer?

De que maneira podemos “exasperar” os filhos que Deus nos deu? Por meio da disciplina severa e implacável, exigências excessivamente duras, regras incoerentes ou injustas, críticas constantes, insensibilidade às fraquezas, aos medos e às necessidades de um filho. Eu irritei mais os meus filhos quando falhei em pensar em seu mundo com empatia ou quando confundi minhas preferências culturais (quarto organizado, música calma) com questões morais. Talvez o melhor antídoto contra a possibilidade de provocar a ira de nossos filhos seja decidir curti-los como dádivas preciosas de Deus.

“Instruir” significa disciplina corretiva. É amoroso estabelecer uma disciplina constante e clara. “Conselho do Senhor” significa ensino bíblico, ou seja, criando seus filhos de maneira cristã e ensinando a fé cristã. Essa é uma grande responsabilidade, bem como um grande privilégio. É algo em que a igreja precisa auxiliar os pais, mas não pode substituí-los.

Nem todos nós temos filhos em casa. Porém, todos temos crianças em nossa igreja. Comprometa-se a orar por uma ou duas famílias a cada semana pelo próximo ano; e, da próxima vez que você encontrar o líder daquela família, pergunte como você pode orar por eles.$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 85;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 6.5-9$t$, 85,
$conteudo$D

eus é uma família, por isso somos projetados para uma vida em família. Deus também é um trabalhador (apenas leia Gn 1!), por isso fomos projetados para o trabalho. Isso significa que nossos escritórios e fábricas, bem como nossas igrejas e eventos missionários, são locais de adoração. Desse modo, embora as palavras de Paulo sejam dirigidas aos escravos e aos senhores, ele esclarece alguns princípios que, apesar das grandes diferenças de contexto social, permanecem imensamente relevantes à nossa vida de trabalho hoje. Trabalhando para o patrão

Leia Efésios 6.5-8.

Paulo não está apoiando a escravidão. Sua prioridade, porém, não é incitar uma campanha de reforma social, mas, sim, dirigir-se aos escravos em suas lutas diárias.

De que maneira os escravos (e os empregados hoje) devem tratar seus patrões (v. 5)?

Essa orientação tem três limites bíblicos principais. As instruções não devem ser imorais (veja Êx 1.15-21), idólatras (Dn 3) ou silenciar o evangelho (At 4).

Quando obedecemos a nosso patrão, estamos buscando “favor” de quem (Ef 6.6)?

O que nosso trabalho está fazendo (v. 7)?

Devemos trabalhar para agradar a Deus, e não às pessoas. Afinal, em última instância, estamos trabalhando para ele. Como trabalhadores, somos uma parte da maneira pela qual nosso Criador amoroso provê às necessidades diárias do mundo. Adoramos a Deus quando fazemos nosso trabalho para ele. E, embora um patrão terreno possa não notar nem se importar com o que fazemos, ser tendencioso contra nós ou mesquinho na maneira com que nos recompensa, nosso Senhor enxerga tudo e se deleitará em nos recompensar no céu (v. 8). Trabalhando como o patrão

Leia Efésios 6.9.

O que os patrões precisam lembrar acerca de sua própria posição?

O que os patrões precisam lembrar acerca de Deus?

Os senhores devem tratar os escravos — e os patrões, os empregados — com o mesmo respeito, temor e franqueza que gostariam de receber deles. Isso não significa abdicar da liderança, uma vez que a liderança é um ato de serviço, quando exercida pelo bem de outros. Mas significa ser justo e atencioso, buscando o bem daqueles que trabalham para eles (assim como “o senhor deles [...] [que] está no céu” fez, faz e os chama a fazer — leia Mc 10.42-45). Afinal, não existe tratamento preferencial para os ricos ou poderosos na eternidade. Presidentes de empresas ou executivos e varredores de rua estarão no mesmo banco dos réus no dia do julgamento.

De que maneira você é tentado a ser “uma pessoa que nunca diz não” no local de trabalho (ou em qualquer outro lugar)? Por que isso é tão tentador?

Seja qual for o seu trabalho — em casa, no campo, na fábrica ou no escritório, como um empregado, um empregador ou ambos...

O que mudaria se você lembrasse que sempre pode, e sempre deve, agradar a seu Pai no seu trabalho?

EFÉSIOS 6.10-12

“F

inalmente”, diz Paulo (v. 10) — pois, longe de ser uma consideração posterior, essa passagem é o glorioso clímax de Efésios. E tudo diz respeito à batalha espiritual. A batalha espiritual hoje

Para muitos cristãos ocidentais, esse tipo de conversa relacionada à luta contra poderes satânicos soa, de maneira suspeita, extrema e até mesmo maluca. Precisamos entender a batalha espiritual de uma perspectiva bíblica. Vejamos cinco princípios fundamentais:

1. Satanás é real e um feroz inimigo de Deus e de seu povo. Leia Apocalipse 12.9,12; João 8.44. 2. Satanás nos tenta a duvidar da palavra de Deus. Leia Gênesis 3.1-5. 3. O Antigo Testamento registra como Deus resgatou Israel da escravidão do medo pagão a Satanás.

Leia Zacarias 3. 4. O Novo Testamento registra como Cristo veio para derrotar o Diabo. Leia Marcos 3.27; 1João 3.8. 5. Efésios (como veremos) ensina que a conquista de Cristo sobre Satanás é demonstrada em sua$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 86;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$igreja. Nossa luta$t$, 86,
$conteudo$Leia Efésios 6.10-12.

Quão “forte” é o “poder” de Deus (veja 1.19-21; 3.20)?

Esse poder nos fortalecerá para fazer o quê (6.11)?

A luta da igreja é contra quem — e contra quem não é (v. 12)?

Quais tipos de erros as igrejas cometem quando esquecem:

• que estão em uma luta? • que a luta não é “contra carne e sangue”?

Por trás de falsos mestres desordeiros, estão sérios poderes demonía cos. Isso nos ajuda tanto a evitar sermos cruéis em relação a uma pessoa que foi enganada (não percebe que Satanás a está ludibriando) quanto a sermos ingênuos em relação a pessoas boas que ensinam falsidades (não devemos subestimar o dano que Satanás fará com suas mentiras, as quais comprometem o evangelho). Nossa vitória

Leia Efésios 1.19-23; 2.6,7.

De que maneira sabemos que podemos “permanecer firmes” contra tais forças espirituais poderosas?

Após os desembarques das forças aliadas que aconteceram no Dia D, na França, em 6 de junho de 1944, durante a Segunda Guerra Mundial, a vitória no front ocidental era garantida. No entanto, as tropas aliadas tinham de continuar lutando contra os alemães até que eles se rendessem no dia 5 de maio de 1945. Nesse ínterim, a batalha foi feroz, mas não havia dúvidas a respeito da vitória final. Da mesma forma, Cristo derrotou Satanás de maneira decisiva na cruz, mas não o destruirá até que retorne e traga seu julgamento. Até lá, nossa luta será feroz, mas não há dúvidas acerca de nossa vitória.

A sua visão a respeito do que é a batalha espiritual precisa mudar de alguma maneira?

Você tem a tendência de superestimar ou de subestimar o Diabo, seus objetivos e seu poder? Que efeito isso tem em sua visão da vida e de sua luta contra o pecado?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 87;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 6.13-17$t$, 87,
$conteudo$E

stamos em uma batalha. A vitória é certa, mas a luta não acabou. Qual é, então, nossa estratégia para sobreviver aos ataques de Satanás? Vista-se

Leia Efésios 6.13,14.

O que devemos vestir?

O que isso nos capacitará a fazer?

“Dia mau” diz respeito aos dias em que vivemos agora (ou seja, o tempo antes de Cristo retornar, no qual Satanás está atuante); e também àquelas ocasiões específicas em nossa vida quando Satanás está atacando, de modo particular, nossa fé no evangelho que nos une como igreja. O campo de batalha da guerra espiritual será nosso dia a dia. Nosso objetivo é sobreviver, defender nossa posição, permanecer firmes, juntos, nas convicções do evangelho.

Leia 2Samuel 23.8-10.

De que maneia Eleazar é um retrato daquilo que somos chamados a fazer em Efésios 6?

Leia 1Pedro 5.8,9.

Observe que a vitória espiritual não tem que ver com a libertação do sofrimento, mas, sim, com a manutenção da fé no evangelho, apesar do sofrimento. A armadura

Qual é, então, a “armadura de Deus” que devemos “vestir” (Ef 6.13)?

Leia Efésios 6.14-17.

Um olhar cuidadoso a essa lista acerca da “armadura” mostra que os pontos ali mencionados não se referem a ações virtuosas que devemos começar a praticar! Paulo não está nos instando a sermos bons; antes, todos esses pontos são maneiras de se referir ao impacto do evangelho. A armadura completa de Deus — que nosso campeão e comandante Jesus vestiu na batalha contra Satanás — é simplesmente a fé no evangelho, a qual o Diabo quer que abandonemos. Essa armadura que Jesus “vestiu” é ilustrada aqui com o equipamento completo de um soldado romano de infantaria fortemente armado, e é ampliada por Paulo da descrição que o profeta Isaías faz do Senhor como um guerreiro — leia Isaías 11.5; 29.2; 52.7; 59.17; Provérbios 30.5.

O fato de Jesus ter usado essa armadura e ter sido vitorioso prova que ela é eficaz. Vestir a armadura completa de Deus é resistir às mentiras de Satanás com nossas convicções do evangelho acerca da pessoa, da vida, da morte, da ressurreição e do reinado de Jesus Cristo.

Releia Efésios 6.13-17.

Você consegue pensar a respeito de como Jesus vestiu essa armadura em sua vida e em sua morte?

Como é, na prática, vestir essa armadura em nossa vida hoje?

Pense a respeito de um momento recente em que você cedeu à tentação.

Qual aspecto da verdade do evangelho você falhou em se lembrar e viver por meio dele — ou seja, falhou em “vestir”? De que maneira você pode permanecer firme na próxima vez em que a tentação chegar?

Em que área a batalha será mais difícil hoje e como você se posicionará?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 88;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 6.18-20$t$, 88,
$conteudo$F

inalmente — como parte da armadura que os cristãos devem vestir — Paulo pede oração a fim de proclamar o evangelho. Se ele precisava de oração para isso, então certamente nós também precisamos! A palavra “todo” da oração

Leia Efésios 6.18.

Quando devemos orar?

Pelo que devemos orar?

Para quem devemos orar?

Podemos nos sentir impotentes para ajudar o povo de Deus ao redor do mundo, principalmente aqueles que estão sofrendo perseguição por causa dele, mas Deus se agrada das orações daqueles que são movidos a interceder pela família de Deus.

Obedeça ao mandamento do versículo 18 agora...

• ore por alguns membros de sua igreja; • ore por crentes, seus irmãos e irmãs, que sofrem perseguição nos lugares onde estão. Palavras para proclamar

Leia Efésios 6.19,20.

Paulo pede para que orem pelo quê?

Ao chamar a si mesmo de “embaixador”, o que você acha que Paulo está dizendo a respeito de seu relacionamento com o evangelho?

Onde Paulo terminou por ser um “embaixador” (v. 20)?

Foi a mensagem de Paulo que lhe trouxe perseguição e encarceramento. Assim, ele precisava da ajuda de Deus para continuar proclamando-a de maneira “destemida”. Paulo sabia que “todos que querem viver uma vida piedosa em Cristo Jesus sofrerão perseguições” (2Tm 3.12). O próprio Jesus disse aos seus seguidores: “... Se perseguiram a mim, também vos perseguirão...” (Jo 15.20).

Dietrich Bonhoeffer, o pastor germânico que foi preso e executado por sua oposição ao nazismo, escreveu de sua prisão: “O sofrimento [...] é a insígnia do discipulado. Se nos recusarmos a [...] nos submeter ao sofrimento e à rejeição das mãos dos homens, comprometemos nossa comunhão com Cristo e deixamos de segui-lo”.

Desse modo, todos nós devemos esperar sofrer por seguir a Cristo. Em culturas seculares ocidentais, isso pode significar que temos de suportar o escárnio de nossos amigos, pena por parte de nossa família e agressão à porta de nossa casa. Em outros lugares, significará algo muito pior. Assim, precisamos orar por nós mesmos e uns pelos outros para que proclamemos Cristo, e o proclamemos “destemidamente” (Ef 6.19,20); e para que a rejeição ou até mesmo a prisão não sejam vistas como uma desgraça ou um desastre, mas como parte do fato de sermos representantes dignos de nosso Rei perseguido.

Tudo isso faz parte da batalha espiritual. Satanás quer dividir nossas igrejas e silenciar nosso testemunho. Precisamos vestir toda a armadura de Deus, usada por Cristo e agora por nós, a saber, a fé no evangelho que é expressa na oração e no evangelismo.

Em que momento você acha mais provável se sentir “temeroso” ao proclamar Cristo e, consequentemente, permanecer calado? Você pedirá a quem para orar por você?$conteudo$)
    returning id into v_aula_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 89;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Efésios 6.21-24$t$, 89,
$conteudo$P

aulo agora conclui sua carta de maneira breve. Suas palavras de despedida deliberadamente enfatizam as três bênçãos principais de Deus em Cristo que são proeminentes ao longo de Efésios. O mensageiro

Leia Efésios 6.21,22.

De que maneira Tíquico, com quem Paulo está enviando sua carta, é descrito?

O que ele fará quando chegar aos efésios?

Ser descrito da maneira que Tíquico é descrito aqui certamente é o maior dos elogios para qualquer crente. De fato, é nesse louvor que todos nós devemos investir nossos esforços e recursos; possa Cristo nos receber em seu reino com essa descrição de nossos esforços! — leia Mateus 25.21,23.

A medida de nossa vida e de nossos ministérios não é o tamanho de nosso salário, o número de nossos netos, o faturamento de nossos negócios ou o tamanho de nossa igreja, mas, sim, se temos nos provado fiéis em crer e proclamar o mistério do evangelho, mesmo no sofrimento. A mensagem

Leia Efésios 6.23,24.

Paulo lembra que os efésios desfrutam de três bênçãos. Quais são elas (duas no v. 23, uma no v. 24)?

Paulo conclui com o resultado, o conteúdo e a origem do plano glorioso de Deus em fazer convergir todas as coisas em Cristo.

O resultado da obra de Deus é que agora desfrutamos de “paz” (v. 23) — paz com Deus e em sua igreja. Leia Efésios 2.14-17.

Amor (6.23) é o conteúdo do plano de Deus — um plano que não apenas revela quão impressionante Deus é, mas também quão compassivo ele é; e não apenas como ele é poderoso, mas também como é amoroso. Leia Efésios 1.4-6; 2.4,5; 3.17b-19.

A origem do evangelho de Deus é sua graça (6.24) — sua bondade imerecida e extravagante em nos reunir em sua igreja para manifestar sua sabedoria nos domínios espirituais e também derramar sobre nós “riquezas incomparáveis” da vida com ele na eternidade. Leia Efésios 2.6-10.

Em Cristo, temos paz com Deus, por causa do amor de Deus, que flui da graça de Deus.

Qual deve ser nossa reação diante de tudo o que temos em nosso Senhor Jesus (6.24)?

De que maneira a Carta aos Efésios lhe proporcionou um maior apreço pela paz do evangelho, pelo amor do evangelho e pela graça do evangelho?

De que maneira a Carta aos Efésios o equipou para servir a Deus por meio do serviço à igreja dele?

Conforme desfrutava das grandes verdades dessa carta, o Espírito o chamou para qual mudança prática em relação à sua maneira de viver?

Use uma (ou mais) das orações (ou pedidos de oração) de Paulo para estimular suas próprias orações hoje — leia Efésios 1.15-21; 3.16-21; 6.19,20.

Em seguida, releia Efésios 1.3-14 e derrame seu louvor perante Deus.

COMPRE AGORA E LEIA

Uma jornada diária em busca de uma melhor compreensão das Escrituras 90 dias em João 14— 17, Romanos e Tiago faz uma imersão nos ensinamentos desses livros e mostra como podemos aplicar aquilo que lemos à nossa vida. Os livros da série Explore as Escrituras... ... foram pensados para ser lidos lado a lado (literalmente) com a Bíblia; ... encorajam os leitores a ter um relacionamento mais profundo com as Escrituras; ... trazem uma página para anotações em cada estudo; ... trazem seções com aplicações para a vida e orientações para orar em resposta ao ensino; ... são escritos por autores renomados que ajudam os leitores a descobrir os tesouros da Palavra de Deus.

COMPRE AGORA E LEIA

Quais são as marcas de um coração sobrenaturalmente transformado? Essa é uma das questões sobre as quais o apóstolo Paulo trata quando escreve à igreja de Corinto. O interesse real dele não é algum tipo de reparo ou remendo; antes, uma mudança profunda, capaz de transformar a existência. Numa era em que agradar as pessoas, insuflar o ego e montar o curriculum vitae são vistos como os meios para "chegar lá", o apóstolo nos chama a encontrar o verdadeiro descanso na bênção que é nos esquecermos de nós mesmos. Neste livro breve e contundente, Timothy Keller mostra que a humildade que brota do evangelho torna possível pararmos de vincular cada experiência e cada conversa com a nossa história e com quem somos. E assim podemos ficar libertos da autocondenação. Quem é realmente humilde segundo o evangelho não se odeia, mas também não se ama... é, antes, alguém que esquece de si mesmo. Você também pode conquistar essa liberdade...

COMPRE AGORA E LEIA

Como ouvimos a voz do Espírito nas Escrituras? Depois de fazer uma exegese responsável, de que forma podemos esperar que o Espírito aplique o texto à nossa vida e às nossas igrejas? Em A hermenêutica do Espírito, o estudioso da Bíblia, Craig Keener, discorre sobre essas questões, articulando meticulosamente como a experiência do Espírito que capacitou a igreja no Dia de Pentecostes pode e deve moldar de modo dinâmico nossa leitura das Escrituras nos dias de hoje. Keener examina o que significa a interpretação orientada pelo Espírito, explora as implicações de uma epistemologia da Palavra e do Espírito para a hermenêutica bíblica e mostra como as Escrituras em si modelam uma apropriação experiencial de sua mensagem. Ao aproximar Palavra e Espírito, muitas vezes separados pelas abordagens cristã, acadêmica e experiencial, A hermenêutica do Espírito descreve uma maneira de ler a Bíblia que é fiel tanto ao texto bíblico inspirado pelo Espírito quanto à experiência do Espírito entre os crentes.

COMPRE AGORA E LEIA

Nesse livro, Nancy DeMoss não oferece fórmulas mágicas para o perdão, mas, sim, princípios bíblicos que podem ajudá-lo a se libertar de ressentimentos, desejos de vingança e amargura. Escolhendo o perdão é um convite para que você se aprofunde na Palavra de Deus e assim descubra tanto as promessas quanto os mitos que acompanham o perdão, além de aprender estratégias para pôr em prática a graça e a misericórdia de Deus e desse modo perdoar tendo como referência o perdão que Deus estendeu a nós. Será fácil? De forma alguma. Mas tentar praticar o que este livro ensina pode salvar sua vida. Escolhendo o perdão traz também um guia de estudo para grupos pequenos com perguntas e reflexões dedicadas ao conteúdo de cada capítulo.

COMPRE AGORA E LEIA

Este livro se baseia na muito aplaudida série de sermões pregados por Timothy Keller, autor bestseller do New York Times. O autor mostra a todos — cristãos, céticos, solteiros, casais casados há muito tempo e aos que estão prestes a noivar — a visão do que o casamento deve ser segundo a Bíblia. Usando a Bíblia como seu guia, e com os comentários muito perspicazes de Kathy, sua esposa há 37 anos, Timothy Keller mostra que Deus criou o casamento para nos trazer para mais perto dele e para dar mais alegria à nossa vida. É um relacionamento glorioso, e é também o mais malcompreendido e misterioso dos relacionamentos.

Caracterizado por uma compreensão clara e cristalina da Bíblia e por instruções significativas sobre como conduzir um casamento bem-sucedido, O significado do casamento é leitura essencial para qualquer pessoa que quer conhecer a Deus e amar mais profundamente nesta vida.$conteudo$)
    returning id into v_aula_id;
  end if;

end $migration$;
