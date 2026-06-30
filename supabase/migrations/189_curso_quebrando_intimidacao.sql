-- Curso: Quebrando as Cadeias da Intimidação (John Bevere) — slug quebrando-intimidacao. Transcrição integral (PyMuPDF/OCR).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'quebrando-intimidacao';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('quebrando-intimidacao','Quebrando as Cadeias da Intimidação','Estudo a partir de Quebrando as Cadeias da Intimidação, de John Bevere. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/quebrando-intimidacao', false, 0, 'espiritual', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução$t$, 1,
$conteudo$Inúmeros cristãos lutam contra a intimidação, no entanto, a maioria combate os seus efeitos em vez de lutar contra a sua origem. Imagine uma linda casa com móveis caros, mas sem uma parte do telhado. Uma chuva forte vem e inunda toda a casa; quase tudo é arruinado. São necessários dias para remover todos os móveis, cortinas e tapetes sujos e danificados. Em seguida, o proprietário trabalha com diligência para substituir tudo que foi destruído.

Quando o seu trabalho está quase completo, outra tempestade destrói toda a restauração que ele fez no interior da casa. E apenas uma questão de tempo até que a chuva destrua tudo, e a cada tempestade, sua força e seus recursos se esgotam. Desanimado, ele finalmente interrompe seu trabalho e se contenta com o que acredita ser o seu destino nesta vida.

E claro que isto parece absurdo.Você provavelmente está pensando: Por que ele não conserta o telhado e depois restaura o que foi perdido? Que tolice! Entretanto, este cenário descreve a forma como muitas pessoas lutam contra a intimidação. Elas se esforçam para corrigir os seus efeitos — o desespero, o desânimo, a confusão, a desesperança, e daí por diante — em vez de quebrarem o poder da intimidação!

Alguns lutam contra a intimidação procurando conselheiros para aprenderem a lidar com os seus medos. Outros se resignam a viver como escravos da timidez, com medo de terem a esperança de ser livres. Nos dois casos, eles se acostumam a viver em uma casa com um furo no telhado e móveis molhados. Outros buscam o isolamento. Sem esperança, todos eles acabam abandonando completamente sua encharcada residência.

A mensagem deste livro não ensinará você a lidar com o problema. Fia compartilhará o caminho de Deus para a libertação total de todo medo e intimidação. Então, você poderá cumprir o chamado de Deus para a sua vida. Passei muitas horas em meu computador trabalhando neste livro, e pedindo ao Senhor para me guiar enquanto eu escrevia. Certa manhã, enquanto estava trabalhando, senti a presença do Senhor entrar no quarto. Levantei-me do computador e comecei a andar e a orar. Enquanto orava, o Espírito do Senhor veio sobre mim para profetizar, e foram estas as palavras que saíram dos meus lábios: Filho, muitos dos que são chamados ao Meu grande exército de crentes dos Últimos Dias estão presos pela intimidação. Eles têm corações puros diante de Deus e diante dos homens; no entanto, assim como Gideão na antigüidade, estão sendo mantidos cativos pelo temor dos homens (Jz. 6-8). Os dons que Eu coloquei neles estão adormecidos. Eu ungirei a mensagem deste livro para libertar multidões desses homens. Eles se levantarão e me obedecerão destemidamente. Eles serão guerreiros valorosos e conquistarão grandes vitórias na força do seu Deus.

Este não é apenas um ensino teórico. Durante anos, fui cativo da intimidação. O maior obstáculo que enfrentei foi não saber qual era a origem dos meus problemas, até que Deus revelou este inimigo maligno. Desde então, Ele tem usado esta mensagem para libertar cristãos em todo o mundo.

Um líder exclamou "Esta mensagem precisa estar nas mãos de todos os pastores do mundo!". Não e uma mensagem somente para os pastores, mas para todos na igreja. Não creio que este livro esteja em suas mãos por acaso. A medida que você for liberto, por favor, compartilhe esta mensagem com outros que precisem dela. Compartilhar esta mensagem fará com que ela seja fortalecida em você. Eu o encorajo a unir-se a mim em oração ao iniciar a sua aventura. Abra o seu coração, e diga estas palavras na presença de Deus:

Pai, em nome do meu Senhor Jesus Cristo, peço ao

Espirito Santo que revele a Tua Palavra a mim

enquanto leio este livro. Por favor, revela e remove

todas as inseguranças em minha vida, para que toda

raiz de intimidação seja destruída. Que eu possa me

aproximar mais de Ti e, com ousadia, testemunhar do

Estabelecendo a sua Posição$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Em que áreas da sua vida você tem combatido apenas os efeitos da intimidação — o desânimo, a confusão, a desesperança — sem nunca enfrentar a sua origem?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que "telhado quebrado" você vem tolerando, permitindo que a mesma tempestade de medo arruíne repetidamente o que Deus quer restaurar em você?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você está disposto a deixar de se resignar a uma vida de timidez e a crer que Deus deseja quebrar de vez o poder da intimidação sobre o seu coração?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Ande na sua Autoridade$t$, 2,
$conteudo$Ande na autoridade que lhe foi dada por Deus, ou

alguém a tomará e a usará contra você.

A medida que sirvo ao Senhor, percebo cada vez mais que Ele usa circunstâncias e pessoas para nos preparar para cumprir o Seu chamado para as nossas vidas.

Em 1983, deixei minha carreira de engenheiro para entrar para o ministério de auxílio em tempo integral em uma igreja muito grande. Na minha posição, eu servia ao pastor, à sua esposa e a todos os ministros convidados que chegavam cuidando de várias tarefas, a fim de poder liberá-los para a obra que Deus os havia chamado a fazer. Depois de quatro anos, Deus me liberou para ser o pastor de jovens de outra grande igreja.

Na semana em que eu deveria sair, um homem que também fazia parte da equipe disse à minha esposa que Deus havia lhe dado uma palavra para mim. Desde então, essa palavra tem ecoado em meus ouvidos como uma advertência, protegendo- me debaixo da sombra de sua sabedoria e força. Como acontece com qualquer palavra que procede realmente de Deus, ela se tornou um leme para o meu coração e um fundamento para me livrar da incerteza.

Aquele homem advertiu minha esposa, dizendo: "Se o John não andar na autoridade que Deus lhe deu, alguém a tirará dele e a usará contra ele". Essa palavra exerceu um impacto imediato em mim. Reconheci-a como a sabedoria de Deus, mas não tinha o pleno entendimento sobre como aplicá-la. Esse conhecimento só viria ao longo dos anos que se seguiram.

Uma Experiência Transformadora

No início de 1990, o Senhor confirmou que o Seu chamado para a minha vida naquele tempo era viajar e ministrar. Depois de estar na estrada por pouco tempo, tive uma experiência transformadora através da qual finalmente compreendi as palavras de instrução que Deus havia me dado anos antes.

Começamos a dirigir algumas reuniões em uma igreja em uma quarta-feira à noite e estávamos programados para continuar no domingo. O Espírito de Deus moveu-se de forma poderosa, e houve libertações muito fortes, curas e salvação. A presença de Deus nos cultos aumentava a cada noite.

Na primeira semana, uma senhora envolvida no movimento Nova Era foi gloriosamente liberta. Essa libertação pareceu ser o catalisador que impulsionou as reuniões. Na semana seguinte, as pessoas começaram a vir de regiões a 150 quilômetros de distância para participar dos cultos.

O pastor disse: "Não podemos encerrar estes encontros. Deus tem mais reservado para nós." Concordei, e continuamos por vinte e um cultos. A Palavra de Deus fluía como um rio que corria rapidamente, e os dons do Espírito se manifestavam em cada culto.

Certa noite, durante a segunda semana de reuniões, estava pregando quando, de repente, virei para trás e encarei os músicos e cantores (havia cerca de vinte e cinco pessoas sobre a plataforma). Então declarei:"Há pecado nesta plataforma. Se você não se arrepender, Deus vai trazê-lo à tona".

Depois de me ouvir dizer isso, pensei: Uau, de onde veio isto? Eu estava pregando há tempo suficiente para saber que há momentos em que a unção de Deus vem sobre você e de uma forma tão forte que você faz afirmações que seus ouvidos físicos só ouvirão depois de já terem sido ditas. Isso e pregação profética - quando falamos por inspiração divina.

Minha mente começou a questionar o que eu havia dito, mas rapidamente expulsei esses pensamentos porque sabia que o que havia dito procedia de Deus. Eu não havia premeditado aquilo. A unção para pregar permanecia sobre mim de forma intensa.

As multidões aumentavam a cada culto. Durante a terceira semana - mais uma vez, enquanto eu pregava - eu me voltei, apontei o dedo para os que estavam na plataforma e declarei com ousadia através da unção do Espírito Santo: "Há pecado nesta plataforma. Se você não se arrepender, Deus irá expor o pecado, e você será excluído!" Senti um aumento de autoridade e de segurança. Desta vez, não questionei, porque sabia que Deus estava dando início ao processo de retirar o pecado da Sua casa.

Quando o pecado entra em nossas vidas, o Espírito Santo nos convence e nos instrui. No entanto, se não dermos ouvidos, começaremos a nos tornar frios e cauterizados. Isto continuará até nosso coração não ser mais sensível a Ele. Então, para nos alcançar e nos proteger, ou para proteger aqueles que nos cercam, Deus enviará alguém para expor o que está errado. Ele não faz isso com o objetivo de nos constranger, mas sim para nos advertir e proteger. Se continuarmos nos recusando a ouvir, o julgamento virá sobre nós. "Porque, se nos julgássemos a nós mesmos, não seríamos julgados. Mas, quando julgados, somos disciplinados pelo Senhor, para não sermos condenados com o mundo" (1 Co 11:31-32). Deus irá tolerar o pecado durante um período, para nos dar tempo de nos arrependermos a fim de nos poupar da Sua disciplina. E até mesmo durante a Sua disciplina, o Seu desejo é que não sejamos condenados com o mundo. O filho pródigo caiu em si quando estava no chiqueiro.

É melhor cair em si estando em um chiqueiro do que continuar em pecado e um dia ouvir o Mestre dizer: "Apartai-vos de Mim, os que praticais a iniqüidade" (Mt. 7:23)!

Se não nos arrependermos, sofreremos, embora não seja este o desejo de Deus para nós. Referindo-se a isso, Paulo disse: "Eis a razão porque há entre vós muitos fracos e doentes e não poucos que dormem [estão mortos]" (1 Co 11:30, AMP). O pecado ao final gera a morte espiritual e física. Senti que o Senhor estava disciplinando alguém na

plataforma, tentando trazer aquela

arrependimento. Mas eu não sabia quem era a pessoa a quem Ele estava convencendo do pecado.

Um Ataque Sutil de Intimidação

Na noite seguinte, quando o pastor e eu estávamos no gabinete nos preparando para dar início ao culto, um dos membros do conselho entrou e informou que os ministros de louvor e adoração pareciam estar deprimidos e negativos naquela noite. O pastor achou que eles estivessem apenas cansados devido a tantos cultos, e disse: "Diga a eles apenas para saírem e louvarem a Deus, e colocarem os seus sentimentos de lado".

Olhei para o presbítero e disse: "Espere um instante. Há algo errado?". O presbítero respondeu: "Bem, eles acham que o senhor está sendo muito duro com eles. Eles acham que o senhor deveria se dirigir a eles em particular e não em público".

Embora eu não estivesse ciente disso naquele instante, aquele foi um momento crucial. A autoridade que Deus havia me dado para servir e proteger estava sendo desafiada. O inimigo não estava satisfeito com o que estava acontecendo naquelas reuniões, e queria pôr um fim naquilo.

Eu tinha uma opção, embora naquele instante não estivesse ciente disso. Eu poderia ceder à intimidação recuando no que havia dito aos ministros de louvor, perdendo assim a minha posição de autoridade; ou poderia permanecer na minha posição de autoridade, quebrando o poder da intimidação e mantendo-me firme sobre o que Deus havia dito.

Imediatamente, pensei: John, por que você deixou aquelas pessoas constrangidas? Por que você não pregou simplesmente a sua mensagem sem virar para elas e apontar o dedo? Agora as pessoas da igreja estão tentando imaginar quem na plataforma está em pecado. E se ninguém estiver? Ou mesmo que haja pecado, e se ele nunca for exposto? As pessoas continuarão desconfiadas, e os que são puros vão sofrer com isso. Isto vai atrapalhar o andamento da igreja. Será que destruí o que foi feito de bom nesta igreja? Se fiz isso, ficarei com uma má reputação, e mal comecei meu ministério itinerante.

Estes pensamentos atacavam minha mente sem cessar. Meus temores haviam começado a se concentrar em um pensamento: O que vai acontecer comigo? E assim que a intimidação muda o seu foco. O motivo: A raiz da intimidação é o medo, e o medo faz com que as pessoas se concentrem em si mesmas. O perfeito amor lança fora o medo porque o amor coloca o foco em Deus e nos outros, e nega a si mesmo (1Jo. 4:18).

O pastor não disse nada. Nós três demos as mãos e oramos para que a vontade de Deus fosse feita naquele culto. Dirigimo-nos à plataforma como havíamos feito todas as noites durante as últimas três semanas. Durante o louvor, percebi que a palavra do Senhor não estava enchendo o meu coração. Não senti nenhuma direção, mas pensei: Deus é fiel, saberei o que dizer e fazer quando chegar ao púlpito. O louvor terminou, e enquanto o pastor fazia os anúncios, não ouvi nada em meu coração. Pensei: Vou me levantar e Deus me dará uma direção quando eu estiver de pé. Não sou do tipo que prepara esboços e tem os sermões prontos antes de pregar. Estudo, oro, e depois falo segundo a inspiração em meu coração. Minha preocupação crescia à medida que o tempo passava, porque eu sabia que não tinha nada a dizer se Deus não me desse a Sua direção.

Então, o pastor me chamou. Subi ao púlpito, e, como não tinha direção, disse: "Vamos orar". Enquanto orávamos, continuei a não receber nenhuma direção. Orei durante vários minutos. Para piorar a situação, as minhas orações não tinham vida. Era como se minhas palavras estivessem saindo de minha boca apenas para caírem aos meus pés. Pensei: O que vou fazer? Decidi pregar unia mensagem baseada em Salmos, que eu já havia pregado antes.

Enquanto pregava, não senti nenhuma vida, nenhuma unção na mensagem. Eu me esforçava para manter meus pensamentos em ordem. Parecia que Deus não estava em lugar algum onde eu pudesse encontrá- lo. Eu pensava: Por que eu disse isso? Ou, Aonde quero chegar com isto? Foi como se eu estivesse sendo guiado por uma confusão, e não pelo Espírito Santo. Eu me consolava com o pensamento de que Deus iria se manifestar e me salvar daquele caos onde havia me metido. No entanto, as coisas só pioraram. Finalmente, encerrei a mensagem e o culto depois de cerca de trinta e cinco minutos.

Desnorteado, voltei ao lugar onde estava hospedado. "Deus, por que o Senhor não Se manifestou?" perguntei. "Todos os cultos foram maravilhosos e poderosos, mas este culto não teve vida. Se eu fosse aquele povo, não voltaria. Na verdade, eu não quero voltar." Naquela noite, fui para a cama me sentindo como se tivesse engolido um saco de areia.

Na manhã seguinte, acordei me sentindo como se o saco de areia tivesse crescido e se transformado em uma duna. Sentia-me tão pesado que não queria sair da cama. A alegria me evitava. Levantei-me para orar. Perguntei novamente a Deus: "Por que o Senhor não Se manifestou?".

"Eu pequei? Eu O magoei?".

Silêncio. Orei por uma hora, e cada minuto era uma luta. Coloquei um CD de louvor e comecei a cantar junto com a música. Raciocinei: Deus nos dá espírito de louvor em vez de espírito angustiado. Preciso me livrar deste sentimento. Entretanto, tudo que experimentei foi meia hora de um canto sem vida. Fiquei mais frustrado ainda. "O que eu fiz? Por que o Senhor não me responde?"Depois do almoço, saí e fui até um campo gramado que ficava perto de onde estava hospedado. Pensei: Vou amarrar o diabo. Isso vai resolver. Mas eu era a única pessoa que estava se sentindo amarrada. Fiquei lá fora orando e gritando com o diabo durante três horas e quase perdi a voz. Eu precisava entrar e me preparar para o culto. tentei  me consolar: Com toda esta resistência, esta noite Deus uai Se mostrar de forma poderosa. John, simplesmente ande por fé.

Passamos pelo louvor, adoração, anúncios e ofertas naquela noite, e eu sentia o mesmo mau pressentimento que havia tido na noite anterior. Mais uma vez, raciocinei: Deus Se manifestará assim que eu subir ao púlpito. I in chamado, e outra vez nada aconteceu. Orei pedindo direção, e só houve silencio. Comecei a pregar outra mensagem que havia ministrado antes e fui tomado por uma grande confusão. Não havia vida, direção ou unção. Depois de cinco minutos neste caos, eu disse: "Irmãos, precisamos orar. Alguma coisa não está certa!" Toda a congregação se levantou, e todos começamos a orar fervorosamente. A Intimidação é Revelada

De repente, ouvi a voz de Deus falar comigo pela primeira vez em mais de vinte e quatro horas. Ele disse: "John, você está intimidado pelas pessoas que estão na plataforma atrás de você. Você foi destituído da sua posição de autoridade, e o dom de Deus em você foi apagado".

Com esta repreensão suave, uma explosão de luz inundou o meu espírito. Enquanto todos oravam durante os cinco minutos que se seguiram, o Espírito de Deus me levou a percorrer a Bíblia, mostrando-me diversos incidentes em que homens e mulheres ficaram intimidados e como isto fez com que o dom de Deus neles ficasse adormecido. Pude ver como eles abriram mão de sua autoridade e perderam sua eficácia no Espírito. Então, Ele me levou a percorrer os últimos anos e me mostrou como eu havia feito a mesma coisa.

Imediatamente, comecei a quebrar o poder da intimidação sobre mim mesmo através da oração. Há um exemplo deste tipo de oração no epílogo deste livro. Durante os setenta e cinco minutos que se seguiram, preguei com base nas passagens que Deus havia me mostrado de forma inflamada. Quando terminei, dois terços da congregação vieram à frente para receber a libertação da intimidação. Aquele foi o maior culto de todo o congresso de avivamento.

Menos de uma semana depois, Deus começou a expor o pecado que havia no meio da equipe de louvor. Descobriu-se que o baixista estava saindo após os cultos e se embriagando. Além disso, um dos cantores estava dormindo com uma jovem da congregação. Ambos foram removidos de suas posições ministeriais. O baixista deixou a igreja, mas o cantor arrependeu-se e foi restaurado em sua caminhada com o Senhor.

Pouco tempo depois, a líder de louvor e alguns outros causaram unia divisão na igreja. Um quarto da igreja partiu com ela. Como se constatou mais tarde, ela estava envolvida em adultério, e dentro de um ano divorciou-se de seu marido. A última notícia que tive foi a de que ela estava vivendo com outro homem. Das famílias que lideraram a divisão, apenas um casal continua casado.

Estas eram as pessoas que haviam reclamado que eu estava sendo muito duro com elas. Deus estava advertindo estas pessoas. Como teria sido melhor se elas tivessem recebido aquela advertência em seus corações!

Voltei àquela igreja duas vezes e descobri que havia unidade e força como nunca antes. O pastor explicou: "Deus purificou nossa igreja através daquelas situações, e com isso nos tornamos mais fortes. O nosso louvor e adoração nunca foram tão livres!" Ele também disse que muito da competição e rivalidade que havia antes já não existia mais. Glória a Deus!

O que Deus compartilhou comigo durante aqueles curtos cinco minutos de oração naquele culto expandiu-se para se tornar a mensagem que você está prestes a ler. Ele me levou a pregar esta mensagem em todo o mundo. Como resultado, vi inúmeros homens e mulheres serem libertos do cativeiro da intimidação. Uma Mensagem para Todos

Embora esta mensagem tenha sido revelada enquanto eu buscava a Deus em meio a um conflito ministerial, não pense que esta lição está limitada aos que ficam atrás de um púlpito. Inúmeros cristãos lutam contra a intimidação. Geralmente, aqueles que são intimidados não percebem contra o que estão lutando. Como acontece com a maioria dos artifícios de Satanás, ,a intimidação é disfarçada e sutil. Sentimos seus efeitos - depressão, confusão, falta de fé - sem saber qual e a sua raiz. Se eu tivesse percebido que estava sendo intimidado, não teria tido uma luta como a que ocorreu naquela igreja. Mas agradeço a Deus pela lição que essa situação me ensinou. A maioria de nós sente-se frustrada com a intimidação, e tenta lidar com suas conseqüências e frutos, em vez de lutar contra a intimidação em si e contra sua raiz. Assim, podemos sentir um alívio temporário, mas não vencemos a luta.Você pode recolher todos os frutos de uma árvore, mas se suas raízes estiverem intactas, os frutos acabarão crescendo outra vez. Este ciclo pode ser desanimador, porque ficamos com a sensação de que simplesmente não conseguimos nos livrar desses obstáculos. Comedimos a perder a esperança e a nos contentar em viver muito abaixo do que Deus nos chamou para viver.

As verdades contidas neste livro o ajudarão não apenas a identificar a intimidação, mas também irão equipá-lo com o conhecimento que você precisa para quebrar a influência da intimidação sobre a sua vida. Oro para que, à medida que ler este livro e andar nestas verdades, você seja liberto para cumprir o seu chamado como servo do nosso Senhor Jesus Cristo.

Talvez você não esteja ansioso para confrontar a intimidação em sua vida de forma direta. Muitas vezes, quando identificamos algo em nossas vidas que nos oprime, queremos ter alívio imediato, mas geralmente esse alívio imediato tem um alto preço: ele não é permanente. Quero desenvolver esta mensagem cuidadosamente, como ela foi revelada a mim. Nos próximos três capítulos, vamos estabelecer um fundamento crucial, começando com o entendimento da nossa posição e da nossa autoridade espirituais.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Em que momentos você tem deixado de andar na autoridade que Deus lhe deu, abrindo espaço para que outro a tome e a use contra você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que circunstâncias e pessoas Deus tem usado para prepará-lo a cumprir o chamado que Ele colocou sobre a sua vida?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Há alguma palavra de advertência ou sabedoria que Deus já lhe deu e que você precisa transformar em leme do seu coração e fundamento contra a incerteza?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Posição Espiritual e Autoridade Espiritual$t$, 3,
$conteudo$Satanás procura nos deslocar da nossa posição a fim de

recuperar a autoridade da qual que Jesus o destituiu.

Vamos começar refletindo sobre a palavra que me foi dada: Se você não andar na autoridade que Deus lhe deu, alguém vai tirá-la de você e usá-la contra você.

Em primeiro lugar, é importante entender que existe um lugar ou posição no espírito que nós ocupamos como crentes em Jesus. Juntamente com esta posição, vem a autoridade. Esta autoridade é o que o inimigo deseja. Se ele puder fazer com que entreguemos a autoridade que nos foi dada por Deus, ele a tomará e a usará contra nós. Isto não apenas nos afeta, como também afeta àqueles que foram entregues aos nossos cuidados.

Há diversas passagens bíblicas que falam sobre o nosso lugar de autoridade no espírito.Vamos examinar algumas delas.

Aquele que habita no esconderijo do Altíssimo, à

sombra do Onipotente descansará.

Trouxe-me para um lugar espaçoso; livrou-me, por-

que Ele se agradou de mim.

O meu pé está firme em terreno plano; nas congre-

gações, bendirei o Senhor.

Os crentes literalmente ocupam um lugar no espírito. É fundamental que você, como crente, não apenas conheça esse lugar como também trabalhe a partir dele. Se você não conhece a sua posição, você não pode trabalhar adequadamente no corpo de Cristo.

Esta posição e a autoridade que ela traz podem ser perdidas ou roubadas. Um exemplo bíblico claro é o de Judas Iscariotes. Depois que Jesus ascendeu ao céu, os discípulos se reuniram para orar. Naquela ocasião, Pedro explicou o que havia acontecido com Judas:

Porque está escrito no livro dos Salmos: "Fique de-

serta a sua morada; e não haja quem nela habite...".

Judas perdeu permanentemente o seu lugar no espírito por causa da transgressão (At. 1:16-17). Esta é a principal maneira pela qual o inimigo destitui as pessoas de sua autoridade espiritual. Foi assim que ele fez com que Adão e Eva caíssem, conseqüentemente deslocando-os e ganhando o senhorio sobre eles e sobre tudo que eles governavam.

Adão e Eva detinham a mais alta posição de autoridade sobre a terra. Todo ser vivo e toda a natureza estavam sob a autoridade deles. Deus disse: "Tenha ele domínio sobre os peixes do mar, sobre as aves dos céus, sobre os animais domésticos, sobre toda a terra e sobre todos os répteis que rastejam pela terra" (Gn. 1:26). Nada nesta terra, na esfera espiritual ou natural, estava acima da autoridade da humanidade — somente o próprio Deus.

Quando Adão detinha a sua posição de autoridade, não havia enfermidade, terremotos, fome ou pobreza, enquanto Adão andava em comunhão com Deus e governava por meio da autoridade e do poder que Deus lhe havia delegado, havia o domínio do céu sobre esta terra. Mas com o pecado de Adão, o direito de tudo que estava debaixo da sua autoridade foi transferido. Por meio da transgressão, ele cedeu o seu lugar no espírito ao inimigo de Deus.

As Escrituras testificam essa verdade ao mostrarem a ostentação de Satanás quando ele tentou Jesus no deserto. Satanás levou-O a uma alta montanha para mostrar-lhe todos os reinos do mundo, e declarou:

Dar-te-ei toda esta autoridade e a glória destes reinos, porque ela me foi entregue, e a dou a quem eu quiser.

Deus havia dado autoridade a Adão, e Adão por sua vez perdeu-a para Satanás. Adão perdeu mais do que apenas sua posição. Tudo o que Deus havia colocado sob os seus cuidados foi afetado. Um declínio gradual de toda a harmonia e ordem existentes teve início.

Um exemplo desse declínio é o reino animal. No jardim, sob o domínio de Deus e de Adão, os leões não devoravam os outros animais (Is 65:25). As cobras não tinham mordidas venenosas (Is 65:25). Os cordeiros não tinham motivo para temer os lobos ou outros predadores (Is 65:25). Contudo, imediatamente após a queda vemos um animal inocente ser sacrificado para vestir o homem nu (Gn. 3:21). Mais tarde, vemos a inimizade e o medo colocarem-se entre o homem e os animais que ele um dia governara (Gn. 9:2).

Outra área afetada foi a própria terra. O solo foi amaldiçoado, trabalhando contra o homem em vez de trabalhar para ele enquanto ele se esforçava para fazer nascer o fruto que um dia havia sido fornecido abundantemente (Gn. 3:17-19). Romanos 8:20 diz: "Pois a criação está sujeita à vaidade, não voluntariamente". Nada na terra, seja natural ou espiritual, escapou dos efeitos da desobediência. A iniqüidade, a morte, a doença, a pobreza, os terremotos, a fome, a pestilência, e muitos outros males entraram na terra. Houve uma perda da ordem divina e da autoridade divina. O primogênito de Adão aprendeu a odiar, invejar e assassinar. O inimigo tomara a autoridade que Deus havia dado para proteção e provisão e a voltara contra toda a criação, usando-a agora para a destruição e a morte. A Autoridade Restaurada

Um homem perdera a sua posição de autoridade; portanto, somente um homem poderia restaurá-la. Milhares de anos mais tarde, Jesus nasceu. Sua mãe era uma filha do povo que tinha uma aliança com Deus; Seu Pai, o Espírito Santo de Deus. Ele não era parte homem e parte Deus. Ele era Emanuel,"Deus revelado em um homem" (Mt. 1:23). O fato de ser humano dava a Jesus o direito legal de recuperar o que havia sido perdido. Por ser o Filho de Deus, Ele estava livre do senhorio que o inimigo havia adquirido sobre o homem.

Ele revelou a vontade de Deus em tudo o que fazia e dizia. Os pecados eram perdoados porque na Sua presença o pecado não tinha domínio. A enfermidade e a doença se curvavam diante da Sua autoridade e poder (Lc. 5:20-24). A própria natureza estava sujeita ao Seu comando (Mc 4:41). Ele andava na autoridade da qual Adão havia abdicado. Jesus, através da obediência e do sacrifício, restaurou a au- toridade dada por Deus que Adão havia perdido, e, portanto, o nosso relacionamento com Deus.

Antes de voltar ao Pai,Jesus declarou:"Toda autoridade Me foi dada nos céus e na terra. Portanto, ide e fazei discípulos de todas as nações, batizando-os em nome do Pai, do Filho e do Espírito Santo, ensinando- os a guardar todas as coisas que vos tenho mandado; e eis que estou convosco todos os dias, até à consumação dos séculos" (MT. 28:18-20).

Esta passagem mostra claramente que Jesus recuperou o que Adão havia perdido e muito mais. Satanás e Adão só tinham domínio sobre a terra , mas o domínio de Jesus incluiu não apenas a terra, mas também o céu. Jesus elevou-se acima do lugar de autoridade que Satanás desapropriou. Depois de revelar Sua posição e autoridade, Jesus nos disse "portanto, ide". Por que Jesus estabeleceu esta relação entre a Sua autoridade e o nosso chamado? Encontramos a resposta nos escritos do apóstolo Paulo.

Paulo orou para que soubéssemos "qual a suprema grandeza do Seu poder para com os que cremos... o qual exerceu Ele em Cristo, ressuscitando-o dentre os mortos e fazendo-o sentar à Sua direita nos lugares celestiais" (Ef. 1:19-20, ênfase do autor). Observe que não se trata de um único lugar celestial, pois Paulo diz claramente "lugares". A razão pela qual Paulo diz "lugares" se encontra em alguns versículos posteriores, nos quais lemos: "Ele vos deu vida, estando vós mortos nos vossos delitos e pecados... e, juntamente com Ele, nos ressuscitou, e nos fez assentar nos lugares celestiais em Cristo Jesus" (Ef. 2:1,6, ênfase do autor). Esses lugares são onde os Seus filhos redimidos devem habitar.

Agora, surge a pergunta: Onde estão esses lugares de habitação, e que posição eles têm? A resposta encontra-se em Efésios 1:21: "acima de todo principado, e potestade, e poder, e domínio, e de todo nome que se possa referir não só no presente século, mas também no vindouro" (ênfase do autor).

O homem redimido oculto em Cristo agora recebe uma posição no espírito que está acima do diabo. Jesus declarou com ousadia: "Eis aí vos dei autoridade... sobre todo o poder do inimigo, e nada, absolutamente, vos causará dano" (Lc. 10:19). Agora, entendemos a ordem: "Portanto, ide". Jesus entendia a autoridade que estava dando aos crentes. Os direitos adquiridos em nosso novo nascimento nos colocaram nesses lugares celestiais, muito acima da autoridade e do poder do inimigo.

Assim como fez com Adão no Jardim do Éden, Satanás agora procura nos deslocar no espírito a fim de recuperar a autoridade que Jesus tirou dele. Se Satanás puder roubar esta posição de autoridade ou fazer com que os indivíduos renunciem a ela, ele terá novamente a autoridade para agir. Paulo diz isso claramente: "Nem deis lugar ao diabo" (Ef. 4:27, ênfase do autor). Nós, crentes, não devemos perder o nosso lugar no espírito.

Precisamos entender que o reino de Deus é simplesmente isto — um reino. Os reinos são estruturados de acordo com níveis de graduação e autoridade. O domínio do céu não é exceção. Quanto maior a graduação, mais influência e autoridade. No jardim, Satanás não estava atrás do elefante ou até mesmo do leão. Ele entendia a questão da autoridade, por isso foi atrás do homem de Deus. Ele sabia que se tivesse o homem, possuiria tudo que o homem governava e cuidava. Portanto, quando o inimigo tem como alvo uma igreja, o seu alvo principal é a liderança. Recentemente, o pastor de uma grande congregação decidiu divorciar-se de sua esposa. Não havia base bíblica para isso, e aquela atitude destruiu sua mulher e seus filhos. Quando a liderança que estava debaixo da autoridade dele questionou seus motivos, ele lhes disse que se não estivessem gostando, podiam ir embora. Ele transgrediu deliberadamente o mandamento de Deus, liberando um espírito de divórcio e engano no meio de toda a congregação. Depois disso, houve um aumento nos divórcios naquela igreja, até mesmo entre a liderança. Outros ficaram desanimados. Chocados, eles passaram de igreja em igreja, perguntando-se em quem podiam confiar. Quando Satanás tira aquele que guarda a casa de sua posição, todos os que estão sob os seus cuidados ficam vulneráveis.

Tenho observado pais e mães que deliberadamente transgridem os mandamentos de Deus, e é só questão de tempo até que seus filhos sigam seu exemplo. Você pode chamar isto de maldição, mas por que acontece? Através do pecado, os pais perderam a sua posição de autoridade no espírito, deixando seus filhos vulneráveis ao inimigo.

Dando  Ocasião aos Inimigos do Senhor

Este princípio está ilustrado na vida de Davi (2 Sm. 8-18). O reino era forte r seguro sob a sua liderança. Deus o havia abençoado com vários filhos e filhas. Então, Davi tomou para si o que Deus não lhe havia dado ao cometer adultério com Bate-Seba. Ela engravidou, e para complicar as coisas,seu marido estava fora de casa, na guerra, defendendo o reino de Davi.

Davi mandou chamar seu marido, Urias, esperando encorajá-lo a dormir com Bate-Seba e assim parecer que havia gerado o bebê. No entanto, Urias, em devoção a Davi e ao seu reino, não quis desfrutar da intimidade com sua mulher enquanto seus companheiros soldados estavam em combate. Ele sabia que seria apenas questão de tempo até que Urias soubesse que sua mulher estava grávida. Finalmente, todos saberiam que o pai era Davi.

Assim, Davi planejou o assassinato de Urias enviando-o de volta para a batalha, levando em suas mãos sua própria garantia de morte. Urias foi colocado em meio à batalha mais acirrada. Então, quando estava cercado pelo inimigo, os que lutavam ao seu lado receberam ordens de recuar. Urias caiu pela mão do inimigo. Um único ato de adultério de Davi levou ao engano, à mentira e ao assassinato. Em pouco tempo, o profeta Natã foi até Davi para expor este pecado. Davi confessou: "Pequei contra o Senhor". Então, Natã lhe disse: "Também o Senhor te perdoou o teu pecado; não morrerás" (2 Sm. 12:13).

Davi arrependeu-se e foi perdoado. Deus apagou a sua transgressão (Is 43:25- 26). Mas Natã prossegue advertindo Davi:"Com isto deste ocasião aos inimigos do Senhor" (2Sm. 12:14).

Davi foi perdoado, mas tornou a sua vida e a vida de sua família vulneráveis aos inimigos de Deus - não apenas aos inimigos naturais, mas também aos espirituais. Sua família e a nação de Israel sofreram grandes conseqüências. O primeiro filho de Davi com Bate-Seba morreu. O filho mais velho de Davi, Amnon, herdeiro do trono, violentou sua meia-irmã,Tamar. Absalão, filho de Davi e irmão de Tamar, vingou-se e matou seu meio-irmão, Amnon. Absalão fez com que o coração de muitos dos homens de Israel se voltasse contra Davi e tomou o seu trono. Ele desonrou o leito de seu pai deitando-se com suas concubinas e enviou os homens de Israel para caçar e matar Davi. O plano falhou, e Absalão foi morto.

Três filhos de Davi morreram porque ele havia exposto sua família aos inimigos de Deus através da sua transgressão.

Já vi filhos de pastores que se envolveram com drogas, tornaram-se hostis à igreja e outros que se envolveram com prostituição ou homos- sexualismo porque seus pais perderam sua posição no espírito através da transgressão. Precisamos levar a Bíblia a sério quando ela diz: "Meus irmãos, não sejam muitos de vocês mestres, pois vocês sabem que nós, os que ensinamos, seremos julgados com maior rigor" (Tg. 3:1, NVI). O motivo pelo qual os mestres (pastores) são julgados com maior rigor é por causa do grande impacto de sua desobediência. Eles não ferem apenas a si mesmos, mas também a todos aqueles que foram colocados debaixo da guarda deles. Deus os perdoa assim como perdoou Davi. Entretanto, mesmo assim eles irão colher o que semearam. Foi dado lugar ao inimigo!

Entendo que estas são palavras duras, por isso, apelo a você com toda humildade e escrevo estas palavras com temor e tremor. Já vimos muitas tragédias, principalmente em ministérios. Não devemos julgar ou condenar, ao contrário, precisamos perdoar e estender a mão àqueles que fracassaram. Se eles se arrependerem, serão perdoados por Deus. Mas escrevo estas palavras como instrução e advertência àqueles que o inimigo terá como alvo. Todos nós devemos andar em humildade e restauração.

Tenho quatro filhos. Passei a entender a tremenda responsabilidade que tenho sobre a vida deles, e o quanto preciso prestar contas por essas vidas. Eles pertencem a Deus, e sou apenas um mordomo que foi colocado para cuidar deles. Jamais quero ver a vida deles destruída porque dei lugar ao diabo.

Quando estava no ministério de serviço, cuidava de coisas secundai ias para que aqueles a quem eu servia pudessem cumprir o chamado de Deus sobre suas vidas. Eu cuidava da lavagem a seco das roupas, pecava as crianças na escola, lavava o carro deles, e daí por diante. Um dia, Deus me disse algo que me deu uma séria visão do ministério. Ele disse: "Filho, se você falhar nesta posição, as coisas podem ser corrigidas facilmente porque você está lidando com coisas naturais. Mas quando Eu o colocar em uma posição ministerial, você estará sobre pessoas, e vidas estarão em jogo".

() propósito deste capítulo foi lhe dar um entendimento sobre a posição e a autoridade espiritual. Vimos exemplos de várias pessoas que perderam ou abriram mão de sua autoridade para o inimigo de Deus. Satanás tentará descaradamente roubar a sua autoridade trazendo o pecado para dentro da sua vida. Se você estiver determinado a servir a Deus de todo o seu coração, ele também tentará derrubar você da sua posição em Cristo através da intimidação.

O primeiro passo para quebrar a intimidação é confrontar as questões em seu próprio coração. No próximo capítulo, descreverei como você pode fazer isso.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você conhece e habita o lugar de autoridade que ocupa em Cristo, ou tem vivido sem consciência da posição espiritual que Deus lhe deu?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que formas Satanás tem tentado deslocá-lo da sua posição para recuperar a autoridade da qual Jesus o destituiu?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como o fato de você abrir mão da sua autoridade afeta não só a sua vida, mas também aqueles que foram entregues aos seus cuidados?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dois Extremos$t$, 4,
$conteudo$A revelação não tem valor algum sem a

sabedoria e o caráter para vivê-la.

Em apenas alguns instantes, o Espírito de Deus pode derramar discernimento em abundância em seu espírito. Mas essa revelação não tem valor algum sem a sabedoria e o caráter para vivê-la.

Quando o Espírito Santo me conduziu através das Escrituras com relação a confrontar a intimidação, Ele me mostrou dois extremos que podem desequilibrar a vida do crente: O primeiro extremo é a busca pelo poder; o segundo é a falsa humildade. O equilíbrio adequado encontra-se no livro de Timóteo, um jovem que cultivava o caráter piedoso em vez da falsa humildade, e que usava o seu dom em vez de buscar o poder.

Foi em Listra que o apóstolo Paulo conheceu Timóteo, um jovem cuja mãe era uma judia cristã e cujo pai era grego.

Paulo queria que Timóteo o acompanhasse juntamente com Silas, como assistentes de viagens dele. Ele seria responsável por cuidar das necessidades de Paulo (At. 19:22).

Com o passar do tempo, a fidelidade de Timóteo como servo foi provada. Ele foi promovido e foi-lhe confiado o cargo de ministro do evangelho, finalmente vindo a pastorear a igreja de Éfeso. Em sua segunda carta a Timóteo, Paulo escreveu: Pela recordação que guardo de tua fé sem fingimento,

a mesma que, primeiramente, habitou em tua avó

Lóide e em tua mãe Eunice, e estou certo de que

também, em ti. Por esta razão, pois, te admoesto que

Observe que Paulo faz referência ao fato de que a fé de Timóteo era genuína. O coração deste jovem era puro. Ele não era um charlatão. Em outra carta, Paulo recomenda: "Espero, porém, no Senhor Jesus, mandar- vos Timóteo, o mais breve possível... porque a ninguém tenho de igual sentimento que, sinceramente, cuide dos vossos interesses; pois todos eles buscam o que é seu próprio, não o que é de Cristo Jesus. E conheceis o seu caráter provado, pois serviu ao evangelho, junto comigo, como filho ao pai" (Fp. 2:19-22).

Fica claro que o caráter de Timóteo estava fora de questão. Na qualidade de cristãos, o caráter deve ser a nossa prioridade máxima e a nossa busca maior. O que nosso Pai procura não é poder, mas caráter. E triste saber que muitos na igreja buscam o poder e a unção do Espírito enquanto deixam de lado a busca por um caráter devoto. O versículo de 1 Coríntios 14:1 nos instrui: "Buscai o amor e desejai, com zelo, os dons espirituais". Entretanto, nós pervertemos esse mandamento. Nós buscamos os dons e a unção e apenas desejamos os frutos de amor em nossas vidas. Deus é amor, e até que andemos em amor não atingiremos a Sua natureza. Um Extremo: Buscando o Poder e Não o Caráter

Alguns cristãos viajarão grandes distâncias - centenas de quilômetros - para irem a um culto de milagres, profecias e unção, mas não estão dispôs- tos .1 tratar tom a ira, a (alta de perdão ou a amargura cm seus corações. Isto é evidencia de que a ênfase deles está no poder, e não no caráter.

As manifestações espirituais nesses cultos podem ser de Deus, mas precisamos tratar com o homem interior também. Esta ausência de disposição para tratar com o interior abriu as portas para o engano na vida de muitas pessoas. Embora a igreja esteja passando por um período de refrigério neste tempo, o pecado precisa ser tratado. E maravilhoso ver que as pessoas estão tão famintas pelo poder de Deus, mas não devemos negligenciar a pureza de coração.

Vimos muitos pastores caírem. Mas eles não caíram quando cometeram o seu primeiro ato de imoralidade. Na verdade, eles começaram a cair antes — no dia em que o sucesso no ministério se tornou mais importante do que o relacionamento íntimo deles com Deus. Não vimos isto acontecer apenas entre os pastores, mas também dentro de suas congregações.

Jesus disse: "Bem-aventurados os limpos de coração, porque verão a Deus" (Mt. 5:8). Ele não disse: "Bem-aventurados os que têm um ministério de sucesso." Ele disse que sem um coração puro você não verá a Deus! Naturalmente, Jesus é o único que pode nos dar um coração puro. Não é algo que possamos conquistar. É algo que não tem preço e que é gratuito - não tem preço pelo fato de que exigiu a morte do Filho de Deus, e é gratuito pelo fato de ser dado sem custo a todos que O buscam.

Eu costumava orar: "Deus, usa-me para ganhar os perdidos. Usa-me para curar multidões e para libertar as massas." Eu orava assim por vezes seguidas, e esta era a medida da minha busca por Deus. O meu maior alvo era ser um pastor de sucesso.Então, um dia Jesus me mostrou que a minha ênfase estava fora de foco. Ele me chocou quando disse: "John, Judas expulsava demônios, curava enfermos e pregava o evangelho. Ele deixou o seu negócio para se tornar Meu discípulo, mas onde está ele hoje?" Isto me atingiu como uma tonelada de tijolos! Ele prosseguiu: "O alvo do alto chamado do Cristianismo não é o poder de Deus ou o ministério; é conhecer a Mim" (ver Filipenses 3:10-15).

Mais tarde, quando minha esposa orava para ser usada dessa mesma forma, Jesus interrogou-a: "Lisa, você já foi usada por uma amiga?". "Sim", respondeu ela.

Ela respondeu: "Eu me senti traída!".

Ele prosseguiu: "Lisa, Eu não uso as pessoas. Eu coloco nelas a Minha unção, as curo, as transformo e as moldo à Minha imagem, mas não as uso". Como você descreveria o relacionamento de uma mulher casada cuja única ambição fosse gerar filhos para seu marido? Ela só teria intimidade com ele quando isso produzisse a descendência que ela queria; ela não teria interesse algum em conhecer seu marido pessoalmente.

Sei que isto parece absurdo, porém, qual é a diferença de clamarmos a Deus para que Ele nos "use para salvar pessoas" quando nós mesmos não buscamos o relacionamento e a comunhão com Ele? Quando tivermos intimidade com Deus, reproduziremos assim como Ele deseja: "O povo que conhece ao seu Deus se tornará forte, realizará grandes proezas" (Dn. 11:32, AMP).

A única ambição de Paulo era conhecer Deus (Fp. 3:8-10). Moisés disse: "Rogo-te que me faças saber neste momento o Teu caminho, para que eu Te conheça" (Ex 33:13). Davi clamou: "Uma coisa peço ao Senhor e a buscarei: que eu possa morar na casa do Senhor todos os dias da minha vida, para contemplar a beleza do Senhor e meditar no seu templo" (SI 27:4). E novamente: "Minha alma tem sede de Ti; meu corpo Te almeja" (SI 63:1).

Os homens e mulheres da Bíblia que desejavam conhecer Deus mais do que qualquer outra coisa permaneceram fiéis a Ele, completando a carreira que Ele havia colocado diante deles. Eles aprenderam o segredo da integridade com poder. Buscando a Deus ardentemente, eles puderam ter um vislumbre do Seu coração. Algumas pessoas medem a sua maturidade espiritual pela sua capacidade de profetizar ou de fluir nos dons. Mas lembre-se que os dons n,1<> dados, e não conquistados. Uma mula falou c enxergou o mundo espiritual. Um galo cantou três vezes e convenceu Pedro. Será que isto torna esses animais espirituais? Jesus disse que muitos O chamariam Senhor e esperariam entrar no Seu reino, mas seriam impedidos. Eles terão feito milagres, expulsado demônios e profetizado em Seu nome. Mas Ele responderá:"Apartai-vos de Mim, os que praticais a iniqüidade!" (Mt. 7:23).

A unção de Deus não significa a aprovação de Deus. Saul profetizou depois de Deus tê-lo rejeitado (1Sm. 19:23-24). Caifás  profetizou embora o seu único objetivo fosse matar o Filho de Deus (Jo. 11:49-51). Precisamos ter o coração de Deus para poder obedecer à Sua vontade. Sem isto, andaremos apenas na sombra da Sua unção, preocupados com o legalismo ou a sensualidade. Balaão  profetizou, e as suas profecias provaram ser verdadeiras; entretanto, ele teve a morte de um adivinho, golpeado a fio de espada quando Israel invadiu a terra prometida. Paulo mediu as virtudes de Timóteo pela pureza do seu coração e pela fidelidade do seu serviço. Também precisamos estabelecer este padrão diante de nós e permitir que o Espírito Santo nos meça com precisão. Não se pode deixar de enfatizar este pré-requisito de extrema importância ao combatermos o espírito de intimidação. Sem este embasamento, a verdade desta mensagem não o libertará e provavelmente poderá lhe fazer mais mal do que bem. Pois não são as palavras em si que detêm o poder de libertar, mas sim o espírito e a substância que estão por trás delas.

Para explicar isto, vamos trazer à memória a advertência de Pedro: "Como igualmente o nosso amado irmão Paulo vos escreveu, segundo a sabedoria que lhe foi dada, ao falar acerca destes assuntos, como, de fato, costuma fazer em todas as suas epístolas, nas quais há certas coisas difíceis de entender, que os ignorantes e instáveis deturpam, como também deturpam as demais Escrituras, para a própria destruição deles" (2Pe. 3:15-16).

É mais importante buscarmos um relacionamento correto com Deus do que uma fórmula para nos movermos no Seu poder. Com base nessa afirmação, examine as primeiras palavras de Paulo em 2 Timóteo. Depois de deixar clara a pureza de coração de Timóteo, Paulo escreveu: "Por esta razão, pois, te admoesto que reavives o dom de Deus" (2Tm. 1:6). Preste atenção nas palavras "por esta razão". As instruções de Paulo a Timóteo com relação à liberação do dom de Deus em sua vida não seriam válidas se a sua fé não fosse genuína. Agora, vamos continuar. 0 Outro Extremo: A Falsa Humildade

Pela recordação que guardo de tua fé sem fingimento,

a mesma que, primeiramente, habitou em tua avó

Lóide e em tua mãe Eunice, e estou certo de que

também, em ti. Por esta razão, pois, te admoesto que

reavives o dom de Deus que há em ti pela imposição

"Por esta razão, pois, te admoesto". Paulo estava se referindo à sua primeira carta a Timóteo, onde ele exortava: "Não te faças negligente para com o dom que há em ti, o qual te foi concedido mediante profecia, com a imposição das mãos do presbitério" (1Tm. 4:14). Paulo enfatizou a Timóteo a importância de não negligenciar o dom de Deus escrevendo sobre isso uma segunda vez, sendo esta uma das primeiras coisas que mencionou em sua carta.

Para entendermos o que significa não negligenciar o dom, vamos dar uma olhada em alguns antônimos. O contrário de negligenciar é: Cumprir, realizar, agir, cuidar, ocupar-se com, concluir, completar, considerar, consumar.

Todas estas palavras estão relacionadas à ação e autoridade. A maioria das palavras têm uma forma verbal e uma forma nominal. Elas são positivas e decisivas. Para entendermos corretamente a Palavra de Deus, vamos examinar também o que significa negligenciar:

Romper, desprezar, despedir, desconsiderar, descontar, ignorar, subestimar, fazer vista grossa, desvalorizar, desdenhar, não fazer caso de. Todas estas são palavras negativas que significam ausência de ação, determinação e autoridade. É algo sério e grave negligenciarmos o que nos foi confiado. Quando negligenciamos, sofremos perda.

O extremo oposto de simplesmente buscarmos o poder é viver naquilo que descrevo como um estado de falsa humildade. As pessoas que vivem nesse estado reconhecem a importância de buscar o caráter de Deus, mas param por aí. Elas nunca se aventuram a desenvolver os dons de Deus que estão sobre suas vidas porque têm medo. Elas evitam qualquer coisa que envolva o confronto, interpretando isto como falta de amor ou de caráter cristão.

Refiro-me a essas pessoas como "pessoas de boa paz". À primeira vista, manter a paz pode parecer atraente, mas Jesus nunca disse: "Bem- aventurados os que mantêm a paz". Em vez disso, Ele disse: "Bem-aventurados os pacificadores, porque serão chamados filhos de Deus" (Mt. 5:9). Os que mantêm a paz evitam o confronto a qualquer preço. Eles farão tudo que puderem parar preservar uma falsa sensação de segurança para si, que entendem erroneamente como sendo paz. O pacificador, por outro lado, confrontará com ousadia, independente do que isso possa lhe custar, porque ele não se preocupa consigo mesmo. O pacificador é motivado pelo seu amor a Deus e à verdade. Somente sob estas circunstâncias é que a verdadeira paz pode florescer.

Há paz no reino de Deus (Rm. 14:17), entretanto, esta paz não vem pela ausência de confronto. Como Jesus mencionou, "O reino dos céus é tomado por esforço, e os que se esforçam se apoderam dele" (Mt. 11:12). Existe uma oposição violenta ao avanço do reino de Deus.

Nós freqüentemente pensamos: Vou simplesmente ignorar isto, e logo passará. Mas precisamos acordar e entender que aquilo que não confrontarmos não mudará! E por isso que Judas encoraja os santos, dizendo:

Amados, quando empregava toda a diligência em

escrever-vos acerca da nossa comum salvação, foi que

me senti obrigado a corresponder-me convosco,

exortando-vos a batalhardes, diligentemente, pela fé

que uma vez por todas foi entregue aos santos.

Observe que ele disse "batalhardes diligentemente"; ele não disse "esperar que o melhor aconteça". Batalhar significa lutar ou guerrear. O Cristianismo não é um estilo de vida fácil! Há oposição e resistência constantes à nossa busca por Deus, tanto na esfera natural quanto na espiritual!

Paulo fortaleceu Timóteo, dizendo: "Receba a sua porção de sofrimento como um bom soldado de Jesus Cristo, como eu faço. E como soldado de Cristo, não se deixe prender pelos negócios deste mundo..." (2Tm. 2:3-4, ABV). Estamos envolvidos em uma guerra. Devemos ter a atitude de um soldado. Não devemos recuar diante do mal, mas devemos vencer o mal com o bem pela graça de Deus (Rm. 12:21).

As cartas de Paulo eram ordens para Timóteo marchar enquanto ele pastoreava a igreja de Éfeso.Timóteo enfrentou desafios. Havia doutrinas falsas que deviam ser expostas, conflitos e competições que deviam ser paralisados; além disso, líderes deviam ser levantados para que uma igreja forte e madura pudesse se desenvolver. E estas eram apenas algumas das responsabilidades mais óbvias que ele deve ter enfrentado.

Estou certo de que houve muitas oportunidades para o confronto. Tenho certeza de que acusações e calúnias foram lançadas contra ele por homens imaturos ou maus que estavam no meio da igreja. Além de tudo Mo, ele tinha outro obstáculo a vencer - sua idade. Ele era um jovem em uma igreja onde havia muitas pessoas mais velhas. Isto por si só poderia abi ir uma porta para a intimidação. Mas diante de tudo isto, Paulo instruiu Timóteo a permanecer forte,sem se esquecer do que lhe havia sido transmitido. Paulo lembrava constantemente a Timóteo para permanecer na autoridade que lhe havia sido dada por Deus. Talvez Timóteo tenha recuado alguma vez, por isso Paulo o instruiu:

Ordena e ensina estas coisas.

Prescreve, pois, estas coisas, para que sejam

Tu, pois, filho meu, fortifica-te na graça que está em

Talvez Timóteo fosse como tantos outros hoje em dia - que amam a Deus, mas evitam o confronto. O medo do confronto torna você cativo da intimidação. Se você identifica este medo em sua vida, então esta mensagem está sendo compartilhada para lhe dar coragem e libertação. Deus quer você livre para fazer e ser aquilo que Ele lhe pedir, não importa o que seja. Quando você está intimidado, não existe alegria. E sem alegria não existe força. Onde há medo, não há paz. Mas à medida que romper com aquilo que o tem mantido acuado, você encontrará alegria e paz em abundância!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você tem se inclinado mais para a busca por poder ou para a falsa humildade ao lidar com os dons que Deus depositou em você?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que maneira a revelação que você recebeu de Deus tem permanecido sem valor por faltar sabedoria e caráter para vivê-la?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como o exemplo de Timóteo, que cultivava caráter piedoso e usava o seu dom, desafia o modo como você tem administrado o chamado de Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dons Transmitidos$t$, 5,
$conteudo$Como isto se aplica a mim?

Até este ponto, tratamos da intimidação e seus efeitos apenas sobre a liderança da igreja. Mas é bem possível que muitos de vocês que estão lendo este livro não estejam no ministério em tempo integral.Vocês podem estar se perguntando: "Como isto se aplica a mim?".

Deus dá um lugar, ou posição, no espírito a cada crente. Lembre-se, Paulo explicou que Deus "juntamente com Ele, nos ressuscitou, e nos fez assentar nos lugares celestiais em Cristo Jesus" (Ef. 2:6). É neste lugar que os filhos de Deus redimidos devem habitar. Este lugar fica "acima de todo principado e potestade, e poder, e domínio, e de todo nome que se possa referir não só no presente século, mas também no vindouro. E pôs todas as coisas debaixo dos Seus pés, e para ser o cabeça sobre todas as coisas, O deu [o Senhor Jesus] à igreja, a qual é o Seu corpo" (Ef. 1:21-23, AMP).

A igreja é o corpo de Cristo. Assim como nossos corpos físicos contêm muitas partes que diferem em função e capacidade, também os membros do corpo de Cristo funcionam em diferentes chamados e dons. Deus determina o propósito e a função deles. Cada um é importante, e nenhum deles é independente dos outros. Paulo declarou que todos os espíritos demoníacos foram colocados debaixo dos pés de Jesus. Isto ilustra claramente que nenhum demônio deve exercer autoridade sobre um crente. Se você é o pé do corpo de Cristo, os demônios ainda estão debaixo de você. Jesus disse: "Eis aí vos dei autoridade... sobre todo o poder do inimigo, e nada, absolutamente nada, vos causará dano" (Lc. 10:19). Entretanto, se não exercitarmos ou andarmos na autoridade que nos foi dada por Deus, alguém a tomará de nós e a usará contra nós! O inimigo está atrás da nossa posição no espírito. Revestido com Dons para Operar

Vamos prosseguir com o nosso estudo da carta de Paulo a Timóteo. Por esta razão te admoesto que reavives o dom de

Deus que há em ti pela imposição das minhas mãos.

A palavra grega para dom é charisma. A concordância de Strong define essa palavra como "um dom espiritual". Outra definição, adaptada do dicionário Vine, seria "o dom da graça derramado sobre os crentes pela operação do Espírito Santo". Assim, a palavra charisma define essas habilidades espirituais com as quais Deus equipa os crentes.

Nada na esfera do espírito é realizado sem esse charisma, ou habilidade sobrenatural de Deus. Não devemos pregar, cantar, profetizar, dirigir ou mesmo servir sem ele. Nenhuma vida é produzida sem esta graça. A religião sem vida nasce da tentativa do homem de servir a Deus do seu próprio jeito, na sua própria capacidade. Quando ministramos aos outros sem o dom de Deus, nós nos esforçamos em vão.

Observe que este dom já estava habitando dentro de Timóteo. Quando o Senhor planta o Seu dom, ele não fica entrando e saindo, mas permanece dentro de você. "Porque os dons [charisma] e a vocação de Deus são irrevogáveis" (Rm. 11:29). Este dom, ou poder, é o equipamento necessário para cumprirmos o chamado que Deus coloca em cada um de nós. Operar nesses dons deve ser algo natural e confortável para nós. Assim como os papéis e funções das nossas áreas individuais não variam nem entram e saem, o mesmo acontece com os dons que Deus derrama. Paulo escreveu aos crentes de Roma:"Porque muito desejo ver-vos, afim de repartir convosco algum dom [charisma] espiritual, para que sejais confirmados" (Rm. 1:11). A igreja não será confirmada sem esses dons, o equipamento espiritual que capacita os filhos de Deus a realizar a Sua vontade. Leia com atenção o versículo abaixo:

Servi uns aos outros, cada um conforme o dom que

recebeu, como bons despenseiros da multiforme graça

Examinaremos três pontos neste versículo:

2. O dom não é nosso; somos meramente mordomos dele.

3. O dom é uma porção da multiforme graça de Deus.

Observe que o versículo diz: "Servi uns aos outros, cada um conforme o dom que recebeu". Pedro não disse: "Conforme o dom que uns poucos escolhidos receberam". Se você nasceu de novo e foi cheio com o Espírito, recebeu o dom de Deus para operar no Seu corpo. Não existem partes aleijadas ou inúteis neste corpo. Paulo diz em Efésios 4:7: "E a graça foi concedida a cada um de nós segundo a proporção do dom de Cristo". E novamente em 1 Coríntios 7:7: "Quero que todos os homens sejam tais como também eu sou; no entanto, cada um tem de Deus o seu próprio dom; um, na verdade, de um modo; outro, de outro". Se formos ignorantes a esse respeito, permaneceremos incapazes ou inaptos para o serviço. Assim, o nosso chamado não se realiza, não se cumpre. Assim como os bebês aprendem a usar as partes do seu corpo, precisamos desenvolver e exercitar esses dons para o serviço no Corpo de Cristo. Nenhuma parte do Corpo funciona fora desta capacitação sobrenatural.

2. O dom não e nosso; somos meramente mordomos dele.

Se partimos do princípio de que não o possuímos, então este dom não deve ser negligenciado ou utilizado para proveito próprio. Ele não nos pertence para agirmos como bem entendermos em relação a ele. Ele 6 dado para que possamos servir aos outros. Somos responsáveis por cuidar dele.

Lembre-se da parábola dos talentos. O senhor "A um deu cinco talentos, a outro, dois, e a outro, um, a cada um segundo a sua própria capacidade" (Mt. 25:15). Então, ele saiu em uma jornada. Os dois primeiros homens usaram seus talentos sabiamente, gerando aumento, enquanto o terceiro homem enterrou o dele. Quando o senhor voltou, os dois primeiros prestaram contas do que havia sido feito com os talentos que lhes haviam sido confiados. O senhor elogiou cada um deles: "Muito bem, servo bom e fiel!".

Então, o terceiro homem veio para prestar contas. Com medo, ele havia escondido o seu talento. Ele via seu senhor como um homem injusto, como alguém que esperava demais. Então, esse servo achou que sua negligência, seu egoísmo e sua falta de cuidado eram justificáveis. Resumindo, ele disse ao seu senhor: "Veja, eis aqui o que lhe pertence".

Quando o senhor viu como aquele servo havia desprezado o que ele havia entregado aos cuidados dele, chamou-o de servo mau e preguiçoso. O seu único talento foi tirado e dado ao homem que havia duplicado o seu. Então o servo inútil foi lançado fora (Mt. 25:16-30).

Nós prestaremos contas dos dons que nos foram confiados, assim como todos os mordomos prestam contas de sua mordomia. Outra palavra para dom é habilidade, definida como "capacidade, faculdade, gênio ou poder". Em outras palavras, talento. A partir desta parábola, vemos uma clara ilustração sobre a importância de alimentarmos e desenvolvermos o dom, a habilidade ou o talento que Deus nos confiou.

Foi confiado a Paulo um ministério de ensino e apostolado. Ele disse: "...constituído ministro conforme o dom da graça de Deus a mim concedida segundo a força operante do Seu poder" (Ef. 3:7). Observe a importância que ele dava à necessidade de ser fiel ao dom:

Se anuncio o evangelho, não tenho de que me gloriar,

pois sobre mim pesa esta obrigação; porque ai de mim

se não pregar o evangelho! Se o faço de livre vontade,

tenho galardão; mas, se constrangido, é, então, a

responsabilidade de despenseiro que me está

Paulo diz:"Ai de mim". Observe que ai é uma palavra muito forte. Jesus usou-a para advertir sobre o julgamento iminente de certos indivíduos ou cidades. Ele disse ai sobre Corazim e Betsaida, cidades que não existem mais (Mt. 11:21-22). Ele disse ai sobre os escribas e fariseus (Mt. 23), e sobre Judas (Mt. 26:24). O termo ai é usado por Judas para descrever o julgamento dos homens maus da igreja. No Livro de Apocalipse, esta palavra é usada com referência aos habitantes da terra sob o julgamento de Deus (Ap. 8:13). Quando usou a palavra ai, Paulo indicou a tremenda responsabilidade da fidelidade para com o dom de Deus. Um cristão acabará por se desviar se não agir de acordo com seu dom ou chamado, assim como um músculo se atrofia pela falta de uso. Um crente ocioso se isola, e se torna presa fácil do inimigo.

Ao estudar a vida de grandes homens e mulheres de Deus, descobri que aqueles que caíram haviam se tornado ociosos ou negligentes em relação ao seu chamado. Talvez eles ainda estivessem ministrando, mas faziam isso debaixo do ímpeto natural conquistado pelos seus anos anteriores no ministério. Eles começaram a usar o dom de Deus em benefício próprio, e não para proteger e servir a outros. O Rei Davi caiu em pecado no momento em que deveria estar na batalha. Decorrido um ano, no tempo em que os reis costu-

mam sair para a guerra, enviou Davi a Joabe, e seus

servos, com ele, e a todo o Israel, que destruíram os

filhos de Amom e sitiaram Rabá; porém Davi ficou

Davi era rei. Deus o havia feito rei para pastorear e proteger Israel. Era tempo dele guerrear, e não de ficar em casa em Jerusalém desfrutando das recompensas das vitórias passadas. Ele estava relaxando, desfrutando dos benefícios de seus esforços anteriores. Entediado, ele estava observando seus domínios da varanda quando viu Bate-Seba banhando-se. E o final da história todos nós conhecemos. A questão aqui é uma só: não estamos aqui para tirar férias. Nossas vidas nem sequer nos pertencem, pois até mesmo elas foram compradas e nos foram devolvidas para administrar. Somos residentes temporários e não habitantes permanentes. Muitas pessoas agem como se esta vida fosse o seu destino final! Jesus disse: "A Minha comida consiste em fazer a vontade daquele que Me enviou e realizar a Sua obra" (Jo. 4:34). Esta também deveria ser a nossa dieta. Jesus sabia o que era necessário para manter a Sua força. A nossa força vem da comida, tanto física quanto espiritual. Se deixamos de fazer a Sua vontade, usando as Suas provisões em benefício próprio, ficamos esgotados e perdemos as forças, assim como aconteceria se parássemos de comer. Quando perdemos a força, achamos mais fácil caminhar com este mundo, e não contra ele. Nós nos tornamos obstinados, ego- cêntricos, autoconscientes e egoístas.

Temos uma grande responsabilidade. Não devemos ser pessoas que simplesmente vão à igreja, não aplicam nada em suas vidas e engordam com a Palavra de Deus. O Senhor nos adverte em Ezequiel 34:20: "Eis que Eu mesmo julgarei entre ovelhas gordas e ovelhas magras".

Quem são as ovelhas gordas? Aquelas que se servem das coisas boas de Deus, negligenciando as outras pessoas. Veja como Deus descreve a ovelha gorda: Acaso não vos basta a boa pastagem? Haveis de pisar

aos pés o resto do vosso pasto? E não vos basta o

terdes bebido as águas claras? Haveis de turvar o

resto com os pés? Visto que com o lado e com o

ombro, dais empurrões e, com os chifres, impelis as

fracas até as espalhardes fora, eu livrarei as minhas

ovelhas, para que já não sirvam de rapina, e julgarei

Os dons de Deus não estão à nossa disposição para cometermos excessos. Deus nos testará com a Sua bondade. Devemos usar a capacidade de Deus em nossa vida para servir àqueles que são fracos, jovens ou incapazes, para que o corpo possa ser completo.

Não me interprete mal. Está certo que desfrutemos dos frutos do nosso trabalho. Deus nos dá descanso e refrigério. Mas quando o nosso foco gira em torno de nós mesmos, nos tornamos gordos e descuidados. Os dons e talentos usados somente para servir a nós mesmos não são multiplicados.

Cada parte do seu corpo é responsável pelas outras partes. Se as suas pernas se recusassem a trabalhar, todo o seu corpo sofreria. Se os seus pulmões ou o seu coração decidissem parar, os seus outros membros pereceriam! Se Satanás conseguir fazer com que coloquemos o foco em nós mesmos em vez de servirmos aos outros, então todo o corpo sofrerá.

3. O dom é uma porção da multiforme graça de Deus.

A palavra-chave aqui é multiforme ou "de muitas formas". Pedro divide os dons em duas categorias principais. A primeira é o oráculo, ou o dom de falar; a segunda, o ministério ou o dom de servir. "Se alguém fala, fale de acordo com os oráculos de Deus; se alguém serve, faça-o na força que Deus supre" (1Pe. 4:11). Paulo divide ainda mais estas duas categorias.Veja esta passagem do livro de Romanos:

Porque assim como num só corpo temos muitos

membros, mas nem todos os membros têm a mesma

função, assim também nós, conquanto muitos, somos

um só corpo em Cristo e membros uns dos outros,

tendo, porém, diferentes dons segundo a graça que

nos foi dada: se profecia, seja segundo a proporção da

fé; se ministério, dediquemo-nos ao ministério; ou o

que ensina esmere-se no fazê-lo; ou o que exorta faça-

o com dedicação; o que contribui, com liberalidade; o

que preside, com diligência; quem exerce

misericórdia, com alegria.

Sob a categoria dos oráculos temos a profecia, o ensino, a exortação e a liderança; sob a categoria do serviço estão o ministério (servir), a contribuição e a misericórdia.

Deixe-me interromper este ponto. Você não deve estar em uma posição de oráculo, ou de liderança, até que tenha provado ser fiel em servir alguém que está nessa posição. Muitos querem liderar e pregar, mas não renderam suas vidas para servir. Não importa o quanto sejam talentosos, fazer isso é um desserviço, um prejuízo tanto para eles quanto para os que estão sob os seus cuidados. Se o caráter deles não for desenvolvido pelo serviço, eles usarão sua posição de liderança para dominar sobre as pessoas.

Já vi dois extremos resultantes da falta de entendimento. O primeiro está relacionado àqueles que têm a si mesmos em mais alta consideração do que deveriam. Interpretando erroneamente que o oráculo é o único fim, eles pensam que esse é o ponto mais alto do ministério e não acreditam que haja nenhuma outra forma de servir a Deus.

Isto está incorreto."Porque também o corpo não é um só membro, in,is muitos... Se todo o corpo fosse olho, onde estaria o ouvido? Se todo fosse ouvido, onde, o olfato?" (1 Co 12:14,17).Todos querem ser a boca, mas cada parte é importante. Sem o ministério de ajuda, o ministério de oráculo está limitado. As pessoas tentam se mover no dom que desejam, rui vez de agirem de acordo com o dom que possuem! No outro extremo estão aqueles que pensam que o ministério está limitado aos pregadores ou à equipe ministerial. Esta mentalidade aleija o corpo, fazendo com que ele funcione de forma deficiente.

Paulo explica: "Pelo contrário, os membros do corpo que parecem ser mais fracos são necessários; e os que nos parecem menos dignos no corpo, a estes damos muito maior honra; também os que em nós não são decorosos revestimos de especial honra" (1 Co 12:22-23). Isto eleva a importância dos que não são percebidos. Deus fez com que aqueles que não são vistos sejam ainda mais importantes do que aqueles que são vistos. Sem eles, não haveria a função de andar ou falar. O livro de Atos demonstra como a igreja primitiva lidava com a questão dos dons. Os cristãos primitivos percebiam que havia muito mais envolvido no ministério do que pregar, curar, libertar e profetizar. Atos 6 menciona que algumas viúvas da igreja de Jerusalém eram negligenciadas, lilás precisavam de alimentos e de ajuda com outras necessidades diárias.

Quando isto chamou a atenção da liderança, eles reagiram: "Mas irmãos, escolhei dentre vós homens de boa reputação, cheios do Espírito e de sabedoria, aos quais encarregaremos deste serviço" (At. 6:3). Eles encontraram homens que atendiam a estas qualificações e os levaram à presença dos apóstolos. "E estes, orando, impuseram-lhes as mãos. Crescia a Palavra de Deus, e, em Jerusalém, se multiplicava o número dos discípulos" (At. 6:6-7).

O que aconteceu quando os apóstolos impuseram as mãos sobre eles? O dom de servir foi transmitido, e o resultado foi que a Palavra de Deus se espalhou e os discípulos se multiplicaram. Aqueles homens estavam operando no dom que lhes havia sido dado. Que fato impressionante. Homens servindo viúvas fizeram com que a Palavra de Deus se espalhasse e os discípulos se multiplicassem grandemente! Creio que um dos grandes motivos pelo qual as nossas igrejas não estão crescendo e se multiplicando é porque nem todas as pessoas (congregações e líderes) estão se movendo nos seus dons. O livro de Atos demonstra ainda como um líder que está operando nos dons pode trazer um número limitado de pessoas à salvação, mas quando toda a igreja se envolve, os resultados são muito maiores. Logo após o Dia de Pentecostes, quando Pedro pregou, houve "... um acréscimo naquele dia de quase três mil pessoas" (At. 2:41, ênfase do autor; ver também v. 47). Quando Pedro andava pelas ruas de Jerusalém sob a unção de cura, "crescia mais e mais a multidão de crentes, tanto homens como mulheres, agregados ao Senhor" (At. 5:14, ênfase do autor).

Mas quando os crentes começaram a ensinar todos os dias em cada casa (At. 5:42), então a igreja começou a se "multiplicar" (At. 6:1). O próximo passo foi os crentes começarem a servir, o que foi iniciado com o ministério às viúvas. Depois desse ponto, a igreja "se multiplicava grandemente" (At. 6:7). Atualmente, os pastores praticamente imploram por voluntários. Que triste! Não se vê os líderes no Livro de Atos pedindo voluntários. Eles levavam essas posições de serviço tão a sério que procuravam homens qualificados para servirem às mesas - qualificados quanto ao caráter, e não quanto ao talento. Então eles eram indicados. Quanta importância eles davam a algo que hoje consideramos trivial! A Responsabilidade de Ser Fiel

O que aconteceria se todos os crentes operassem no seu lugar? Que coisas tremendas veríamos! O avivamento não é para os pregadores, mas para todo o corpo — quando cada pessoa assumir a sua posição.

Lembre-se: o dom 6 a habilidade que Deus nos dá. Não somos responsáveis por aquilo que não nos foi confiado. A perna não é responsável pela vista. Ainda assim, a vontade de Deus só pode ser realizada pela capacitação do Espírito. "Não que, por nós mesmos, sejamos capazes de pensar alguma coisa, como se partisse de nós; pelo contrário, a nossa suficiência vem de Deus" (2 Co 3:5).

É a operação conjunta desses dons que o inimigo quer paralisar. Quando ele tem êxito nisso, pode impedir o nosso crescimento! Ele sabe que não pode impedir Deus de nos dar esses dons, assim, ele visa atacar a nossa liberdade de exercê-los. A intimidação é a principal forma pela qual ele faz isto.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você já compreendeu que, mesmo fora do ministério em tempo integral, possui um lugar e uma autoridade no espírito como membro do corpo de Cristo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se nenhum demônio deve exercer autoridade sobre um crente assentado nos lugares celestiais, por que você ainda tem permitido que o medo o domine?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como reconhecer que o seu dom é importante e indispensável ao corpo de Cristo muda a forma como você se enxerga diante de Deus?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Dons Adormecidos$t$, 6,
$conteudo$Por que tantos de nós são ineficazes?

Já definimos que todo crente possui uma posição de autoridade que vem com os talentos ou dons dados por Deus e está oculto em Cristo Jesus, acima de toda autoridade demoníaca. Então, por que tantos de nós são ineficazes? Para responder a isto, vamos ler novamente o lembrete de Paulo a Timóteo: Por esta razão, pois, te admoesto que reavives o dom

de Deus que há em ti pela imposição das minhas

A palavra grega para "reavivar" é anazopureo, que significa "acender de novo ou manter a chama acesa" (dicionário Vine). Se Paulo teve de encorajar este jovem para reavivar ou acender o dom (charisma), é porque ele havia ficado adormecido! O dom não opera automaticamente. Como um fogo, ele precisa ser reavivado e mantido aceso!

Há pessoas que têm um coração puro e intenções sinceras que acreditam que se Deus quer que alguma coisa aconteça, ela simplesmente acontecerá. Mas isto não é verdade. Em 1795. Edmund Burke escreveu: "A única coisa necessária para que o mal triunfe é que os homens bons nada façam".

Timóteo tinha um coração puro. Você se lembra de como Paulo exaltou o seu caráter? "Porque a ninguém tenho de igual sentimento que, sinceramente, cuide dos vossos interesses; pois todos eles buscam o que é seu próprio, não o que é de Cristo Jesus. E conheceis o seu caráter provado" (Fp. 2:20-22). No entanto, foi Paulo quem o advertiu por duas vezes a não negligenciar o dom de Deus, fazendo com que ele ficasse adormecido.

Então, há duas perguntas que precisamos responder: O que faz com que o dom fique adormecido? E como podemos avivá-lo? Responderei à segunda pergunta em um capítulo posterior, mas agora vamos dar uma olhada na primeira. O que faz com que o dom de Deus fique adormecido?

A resposta está no versículo a seguir:

Por este motivo, te lembro que despertes o dom de

Deus, que existe em ti, pela imposição das minhas

mãos. Porque Deus não nos deu o espírito de temor,

mas de fortaleza, e de amor e de moderação.

A palavra grega para temor é deilia. Essa palavra implica timidez e covardia, e nunca é usada em um bom sentido nas Escrituras (dicionário Vine). Olhando novamente o versículo 7 na versão da Sociedade Bíblica Britânica, vemos: Pois Deus não nos deu o espírito de timidez.

Os tradutores dessa versão concluíram que timidez é a palavra mais precisa para este versículo, e eu também. De acordo com essa versão, Paulo está dizendo a Timóteo: "O seu dom de Deus está adormecido por causa da timidez". Sem alterar o significado, eu poderia dizer:

Timóteo, o dom de Deus em você esta adormecido por

Os crentes que estão intimidados perdem a sua autoridade no espírito por omissão; conseqüentemente, o dom deles - a habilidade de Deus neles - fica dormente e inativo. Embora esteja presente, não está em operação. Quando aquele presbítero me disse que os líderes de louvor e adoração acharam que eu estava sendo muito duro com eles, fiquei intimidado. I >e repente, o dom de Deus ficou inoperante, e eu não preguei debaixo da unção como havia feito nos dezoito cultos anteriores. A vida de Deus pareceu ter ido embora. A confusão se instalou; perdi meu poder de decisão; já não queria encarar as pessoas. Por quê? Porque fiquei intimidado, e assim, renunciei à autoridade que me havia sido dada por Deus.

Agora, vamos ver as definições de intimidar e intimidação. O dicionário Oxford English define intimidar da seguinte forma:

3. Aterrorizar, amedrontar

O dicionário Merriam- Webster}s Collegiate (10a edição) define intimidar como:

Desencorajar, coagir, ou suprimir por ameaça (ou como se por ameaça) 3 O dicionário Oxford English define intimidação como:

1. O ato de intimidar ou amedrontar

2. O fato ou condição de ser intimidado

3. O uso de ameaça ou violência para forçar ou impedir uma ação O objetivo da intimidação é impedir você de agir, coagi-lo ou forçá- lo a se submeter. A intimidação quer subjugar você com um sentimento de inferioridade e medo. Quando você recua e se submete, seja consciente ou inconscientemente, passa a ser escravo do intimidador. Você já não é mais livre para realizar a vontade de Deus, mas está condenado aos desejos do intimidador que o capturou. Conseqüentemente, o dom de Deus - a habilidade espiritual de Deus que opera em você - torna-se inoperante. Agora, a sua autoridade foi arrancada de você para ser usada contra você e contra aqueles que estão na sua esfera de influência. A origem da intimidação é o medo, que tem suas raízes no nosso adversário, o diabo. Ele é o gerador de todo medo e timidez (Gn. 3:1-10, principalmente o v. 10). Ele nos atacará através de pensamentos, imaginações e visões, ou usará circunstâncias e aqueles que estão sob a sua influência para nos intimidar. Em qualquer destas hipóteses, ele tem um único objetivo: controlar-nos e limitar-nos. Elias Intimidado?

O profeta Elias operava com um poder tremendo. Ele compareceu com ousadia diante de um rei maligno que não tinha temor a Deus e declarou: "Nem orvalho nem chuva haverá nestes anos, segundo a minha palavra" (1Rs. 17:1). Ele não teve medo deste rei ímpio.

Ele passou os anos que se seguiram vivendo milagrosamente. Primeiro, foi alimentado por corvos; depois, foi sustentado por uma viúva cujo alimento e cujo azeite não se acabavam embora a fome e a inanição cercassem a todos. O filho dessa viúva morreu de repente, e Deus ouviu a oração de Elias, ressuscitando o menino dos mortos. Este era um homem que tinha um ministério poderoso. Depois de um longo período, Elias compareceu novamente perante o rei. O rei o culpou pelas dificuldades e sofrimentos decorrentes da seca r saudou-o dizendo: "És tu, ó perturbador de Israel?" (1 Rs. 18:17).

Elias respondeu com ousadia: "Eu não tenho perturbado a Israel, mas tu e a casa de teu pai, porque deixastes os mandamentos do Senhor e seguistes os baalins" (1Rs. 18:18). Então, ele ordenou que o rei reunisse os quatrocentos e cinqüenta profetas de Baal e os quatrocentos profetas de Asera e os levasse ao Monte Carmelo - juntamente com toda a nação de Israel.

No dia do confronto, todo o Israel se reuniu para ver quem era o verdadeiro Deus! Elias desafiou com ousadia os profetas de Baal e Asera para oferecerem um sacrifício aos seus deuses ao mesmo tempo em que ele oferecia um sacrifício ao Senhor. "E o deus que responder por fogo, esse é que é Deus", declarou Elias (1Rs. 18:24).

O Senhor Deus respondeu com fogo, e o povo de Israel se prostrou sobre seus rostos e se voltou para Deus. Então, sob as ordens de Elias, eles mataram todos os oitocentos e cinqüenta falsos profetas.

Em seguida, Elias proclamou que iria chover, orando ardentemente e chamando isto à existência quando não havia sinal de chuva. Dentro de minutos, o céu ficou negro, e caiu uma forte chuva. Enquanto Acabe fugia para o seu palácio, a mão de Deus veio sobre Elias, e ele ultrapassou a carruagem de Acabe. Este foi apenas um dia na vida de Elias. A nação mudou de atitude; os maus foram mortos; a longa seca terminou. Elias pôde ouvir claramente a voz de Deus, agir de acordo com ela e ver grandes milagres.

Confrontado pela Esposa do Rei

Nesse mesmo dia, contudo, a mulher de Acabe, Jezabel, ouviu o que havia sido feito aos seus profetas, e enviou uma mensagem a Elias: "Façam-me os deuses como lhes aprouver se amanhã a estas horas não fizer eu à tua vida como fizeste a cada um deles" (1Rs. 19:2). Ela estava furiosa com ele porque aqueles eram os seus profetas, que pregavam a sua mensagem. Agora, veja a reação de Elias: Temendo, pois, Elias, levantou-se e, para salvar sua

vida, se foi, e chegou a Berseba, que pertence a Judá;

e ali deixou o seu moço. Ele mesmo, porém, se foi ao

deserto, caminho de um dia, e veio, e se assentou de-

baixo de um zimbro; e pediu para si a morte e disse:

"Basta; toma agora, ó Senhor, a minha alma, pois não

sou melhor do que meus pais!".

No mesmo dia em que venceu uma batalha tão grande, Elias fugiu para salvar sua vida. Ele ficou tão intimidado e desanimado por causa de Jezabel que desejou morrer. O propósito da intimidação dela era impedir que Elias concluísse o propósito de Deus. Ela queria reverter a sua influência sobre a nação. Ela queria vê- lo destruído e fora do caminho. Embora não pudesse matá-lo, ainda assim ela realizou um de seus objetivos aterrorizando-o para que fugisse e desejasse a morte. Inconscientemente, ele estava cooperando com o plano dela. Se Elias tivesse visto as coisas com mais clareza, jamais teria fugido.

Os Sintomas da Intimidação

O espírito de intimidação desencadeia a confusão, o desânimo e a frustração. O seu objetivo é fazer com que você perca a perspectiva apropriada. Tudo parecerá avassalador, difícil ou mesmo impossível. Quanto mais forte a intimidação, maior o desânimo e a falta de esperança. Se a intimidação não for confrontada imediatamente, ela fará com que você faça coisas que jamais faria se não estivesse sob a sua influência. Este é exatamente o objetivo da intimidação. Examinando as situações em que fui atacado por um espírito de intimidação, posso me identificar com o que Elias deve ter sentido. Antes de entender como a intimidação funcionava, eu me sentava em meu quarto de hotel sentindo-me desanimado e sem esperança. Eu me perguntava: De que adianta tudo isto? Quem você pensa que é? Algumas vezes eu tinha esses pensamentos até na manhã seguinte após um grande culto.

Lembro-me de uma vez em especial em que não consegui fazer absolutamente nada o dia todo. Eu não conseguia tirar aquele peso de cima de mim. Orava, mas parecia que Deus não estava em lugar algum. Assim como aconteceu com Elias, o meu foco havia se voltado para mim e unicamente para mim. Eu me sentia ineficaz e considerava meu ministério inútil. Foi por isso que Elias disse: "Basta, toma agora, ó Senhor, a minha alma, pois não sou melhor do que meus pais!" (1 Rs. 19:4). No fim desse dia especialmente desanimador, Deus me mostrou como Elias havia sido intimidado por Jezabel. Finalmente reconheci que meu comportamento era exatamente o que este espírito de intimidação e desânimo queria que eu tivesse. Ele queria que eu abrisse mão do que Deus havia me enviado para fazer. Havia pessoas na igreja que não gostavam da mensagem de arrependimento e santidade que Deus me havia dado para entregar.

Imediatamente pude ver a raiz dos sintomas contra os quais havia lutado durante todo o dia - o espírito de intimidação. Libertei-me com ousadia e me senti livre da confusão e da frustração. Tivemos um culto poderoso naquela noite! Mais tarde, explicarei como confrontar o espírito de intimidação. Mas agora, vamos dar mais uma olhada na vida de Elias para ver como reconhecê-lo. 0 que Você está Fazendo Aqui?

Elias foi destituído da sua autoridade quando não confrontou a intimidação de Jezabel de frente. Como resultado, o seu dom ministerial para a nação foi suprimido, e ele seguiu em uma direção que não era da vontade de Deus. Estou certo de que ele parecia um homem inteiramente diferente enquanto fugia do confronto para o qual havia corrido mais cedo. Ele se dirigiu para a direção oposta, deixando seu servo e correndo por quarenta dias e noites até o Monte Horebe.A primeira coisa que ele ouviu Deus dizer ao chegar foi:"0 que você está fazendo aqui, Elias?" (1 Rs. 19:9, NVI).

Você pode imaginar? Ele está desanimado até à morte, exausto por correr quarenta dias em um estado de depressão. E Deus pergunta: "Por que você está aqui?" Será que Deus estava dizendo: "Por que você fugiu do seu posto e se escondeu aqui?".

Você pode estar pensando: Bem, Deus enviou o anjo que deu a Elias os dois bolos para que ele pudesse correr quarenta dias e quarenta noites. Por que Deus perguntaria: "O que você está fazendo aqui?".

Deus sabia que Elias estava determinado a correr. Quando um homem tem em seu coração a decisão de fazer alguma coisa, muitas vezes Deus deixará que ele a faça mesmo que não seja a Sua vontade perfeita.

Deus fez o mesmo com Balaão quando Balaque, rei de Moabe, pediu-lhe para amaldiçoar Israel. O Senhor disse a Balaão para não ir. Mas Balaão voltou e perguntou a Deus pela segunda vez, e pareceu que Deus havia mudado de opinião. Ele disse a Balaão para ir.

Na manhã seguinte, Balaão colocou a sela sobre sua mula para partir, e a Bíblia diz: "Acendeu-se a ira de Deus, porque ele se foi" (Nm. 22:22). Um anjo de Deus veio para matá-lo.

Por que Deus lhe disse para ir e depois ficou zangado quando ele foi? Deus deixou Balaão ir porque conhecia o seu coração. Ele sabia que Balaão queria a honra e o dinheiro que Balaque estava oferecendo mais do que queria obedecer a Deus. Quando um homem dispõe o seu coração para fazer algo, Deus não o impedirá, mesmo que esta não seja a Sua vontade perfeita.

Este foi o caso de Elias. Deus desejava que ele voltasse e confrontasse Jezabel como havia feito com os profetas de Baal. Isto completaria o que havia sido iniciado no Monte Carmelo. Mas Elias não queria enfrentá-la. Ele queria sair da pressão que estava sobre ele. Então, Deus enviou um anjo até ele para lhe dar o alimento necessário para a sua jornada. Deus esperaria e trataria com a intimidação de Elias quando ele chegasse ao Monte Horebe.

Aquele que Está Por Trás de Tudo

O trabalho que Deus havia começado através de Elias não podia ser concluído até que Jezabel fosse confrontada. Ela estava exatamente na raiz do problema de Israel. A Bíblia diz:"Ninguém houve, pois, como Acabe, que se vendeu para fazer o que era mau perante o Senhor, porque Jezabel, sua mulher, o instigava" (1 Rs. 21:25). O Senhor teria sido com Elias se ele não tivesse fugido, assim como havia sido com ele no Monte Carmelo. Mas ele ficou intimidado por Jezabel e foi destituído da sua autoridade. () dom para completar a tarefa estava adormecido. Agora, veja o que Deus diz a Elias depois de perguntar duas vezes por que ele estava ali.

Disse-lhe o Senhor: "Vai, volta ao teu caminho para o

deserto de Damasco e, em chegando lá, unge a Hazael

rei sobre a Síria. A Jeú, filho de Ninsi, ungirás rei sobre Israel e também Eliseu, filho de Safate, de Abel-Meolá,

ungirás profeta em teu lugar. Quem escapar à espada de

Hazael, Jeú o matará; quem escapar à espada de Jeú,

Observe que Ele disse a Elias para ungir Eliseu profeta em seu lugar e para ungir Jeú rei sobre Israel. Deus tinha dois outros homens que não fugiriam de Jezabel. Eles completariam a sua tarefa.

A obra que Elias havia começado foi colocada em compasso de espera enquanto ele fugia da intimidação de Jezabel. Lembre-se, Jezabel era a influência motivadora por trás da maldade que havia se infiltrado em Israel. Se a má influência de um líder não for confrontada e não for dado um fim nela, é apenas questão de tempo até que a maldade se infiltre até alcançar os que estão sob a sua autoridade. Jesus ensinou este princípio: "Ninguém pode entrar na casa do valente para roubar-lhe os bens, sem primeiro amarrá-lo; e só então lhe Quando esses líderes tomaram conhecimento de seus planos, Neemias contou: "eles zombaram de nós e nos desprezaram" (Ne. 2:19). Eles não apenas tentaram desencorajar Neemias e seus homens, como também tentaram fazer com que eles parecessem tolos aos olhos do povo. Eles zombaram deles com declarações depreciativas. "Ainda que edifiquem, vindo uma raposa, derribará o seu muro de pedra" (Ne. 4:3).

Muitas vezes as pessoas tentam intimidá-lo rindo de você ou fazendo pouco do que você está fazendo. Elas podem zombar de você e questionar a sua capacidade de realizar tudo o que Deus colocou em seu coração. Elas podem fazer isso na sua frente, ou podem semear perguntas e zombaria no meio de outras pessoas. Ou talvez não seja uma pessoa ou um grupo que resista a você, mas você pode estar lutando contra a sua própria mente, enquanto ela é bombardeada com pensamentos do tipo: O que as pessoas vão pensar? Será que elas vão rir de mim? Será que vou fracassar?

Nesta situação, é importante sabermos o que Deus nos instruiu a fazer, lembrando que Ele "escolheu as coisas fracas do mundo para envergonhar as fortes" (1 Co 1:27). O que o homem considera insignificante, Deus usa para realizar o impossível. Então, Ele recebe toda a glória!

Neemias jejuou e orou até ter a mente do Senhor. Assim ele pôde refutar com ousadia os seus adversários. "O Deus dos céus é quem nos dará bom êxito; nós, Seus servos, nos disporemos e reedificaremos; vós, todavia, não tendes parte, nem direito, nem memorial em Jerusalém" (Ne. 2:20).

Quando perceberam que não podiam impedir Neemias, e que os israelitas estavam avançando na sua obra, eles ficaram enfurecidos. Eles não estavam mais rindo, porque já não era mais engraçado. Eles planejaram confundir todo o projeto atacando a cidade (Ne. 4:7-8).

A ira é outra arma de intimidação. Ela será exercida contra você para paralisá- lo ou detê-lo. Dessa ira podem vir ameaças flagrantes ou sutis. Esta distração é uma arma muito eficaz de intimidação. Observei muitas vezes as pessoas recuarem do que sabiam ser certo ou do que deveriam fazer, a fim de evitar a ira dos outros. Elas abriam concessões especiais para manter uma falsa paz.

Pressão por Dentro e por Fora

Neemias não teve de enfrentar apenas este ataque dos estrangeiros pagãos, mas também teve problemas que surgiram entre os seus próprios homens com relação às condições que todos eles enfrentavam. Muitas vezes, quando Deus nos convoca, enfrentamos resistência e oposição vindas de dentro e de fora. Os homens de Neemias estavam ficando cansados. Eles estavam enfrentando tantos escombros que aquilo estava impedindo o progresso deles (Ne. 4:10). Também havia outro problema. Os trabalhadores ricos estavam pressionando financeiramente as famílias que estavam em débito, cobrando grandes somas de juros sobre os campos que essas famílias cultivavam (Ne. 5:1-8). Isto desanimou os homens cujas famílias estavam sofrendo. Estes problemas internos tornaram ainda mais difícil resistir à coerção e ao desânimo por parte dos inimigos deles. Intimidação por Todos os Lados

Já passei por situações assim. Quando comecei a viajar, pediram-me para ajudar uma igreja que havia perdido seu pastor. Ela se situava em uma cidade pequena de oitocentas pessoas no meio do nada. Depois de dois cultos, todos os adolescentes dali haviam se arrependido e tido uma experiência com o poder de Deus, assim como muitos adultos. Por causa do que Deus estava fazendo, a audiência dobrou para quase cem pessoas. Minha esposa e eu sentimos tanta compaixão por aquelas pessoas que nos oferecemos para cancelar as nossas próximas seis semanas de reuniões e ficarmos para edificar um fundamento firme naquela igreja para prepará- la para um novo pastor.

Algumas pessoas da diretoria não gostaram do que preguei. Um homem estava contrariado porque quando chegamos para o terceiro culto, Quando ficamos intimidados, abrimos mão da nossa posição de autoridade. Consequentemente, o dom de Deus para servir e proteger permanece adormecido. Terminamos inconscientemente apoiando a causa daquele que está nos intimidando. Há muitos relatos no Antigo Testamento do povo de Deus recuando quando deveria estar avançando. Como Paulo escreveu: "Estas coisas lhes sobrevieram como exemplos e foram escritas para advertência nossa, de nós outros sobre quem os fins dos séculos têm chegado" (1 Co 10:11). E mais uma vez aos Romanos: "Pois tudo quanto, outrora, foi escrito, para o nosso ensino foi escrito" (Rm. 15:4). Citarei muitos relatos do Antigo e do Novo Testamento neste livro, pois não podemos entender plenamente as aplicações do Novo Testamento sem os exemplos do Antigo Testamento. No próximo capítulo, veremos como a intimidação impede a obra de Deus, não apenas na vida de um líder, mas também na vida do povo a quem ele serve.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Que dom Deus colocou em você que, como uma chama, ficou adormecido e precisa ser reavivado e mantido aceso?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você tem acreditado que aquilo que Deus quer simplesmente acontecerá por si só, em vez de despertar e exercer ativamente o seu dom?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a advertência de Paulo a Timóteo, um homem de coração puro, revela que boas intenções não bastam sem a ação de reacender o dom?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Paralisado pela Intimidação$t$, 7,
$conteudo$Uma pessoa intimidada honra aquilo que teme mais do que a Deus. A intimidação nos paralisa na esfera do espírito. Ela faz com que comprometamos o que sabemos ser certo. Ela faz com que permitamos ou toleremos aquilo que, sob outras circunstâncias, não apoiaríamos.

Um exemplo encontra-se na história de Eli e seus filhos. Antes de Israel se tornar uma monarquia, era governada por juízes que Deus levantava em momentos críticos da história da nação. De acordo com a Bíblia Dake, Eli era o décimo quinto juiz de Israel. Ele não apenas julgava, como também era o sétimo sumo sacerdote. Ele julgou Israel por quarenta anos. Seus dois filhos, Hofni e Finéias, também eram sacerdotes. Agora vamos dar uma olhada na atmosfera espiritual sob a liderança de Eli:

Naqueles dias, a palavra do Senhor era mui rara; as

visões não eram freqüentes.

A "palavra do Senhor" mencionada aqui não são as Escrituras escritas, pois os israelitas tinham a Tora. Este versículo se refere ao dis- Permanecia apenas uma lembrança distante de Deus talando abertamente ao Seu povo. O autor do livro agora estava em silêncio. A Sua voz raramente era ouvida. Então, por que Deus estava tão quieto? Encontramos a nossa resposta no capítulo 2:

Era, porém, Eli já muito velho e ouvia tudo quanto seus

filhos faziam a todo o Israel e de como se deitavam com

as mulheres que serviam à porta da tenda da

Hofni e Finéias, os filhos de Eli, eram maus. Eles não apenas estavam fornicando com as mulheres de Israel, como eram ousados a ponto de fornicarem com as mulheres que iam servir no tabernáculo, onde a presença de Deus deveria habitar. Onde estava o temor de Deus naqueles homens?

A maldade deles, porém, não se limitava à desobediência na área sexual. Eles também tomavam à força as ofertas de carne crua levadas pelo povo. Esta prática era contrária à lei, e roubava dos adoradores e do Senhor a carne que lhes pertencia. Isto fazia com que o povo de Israel desprezasse a oferta do Senhor. Hofni e Finéias eram pedras de tropeço para o povo de Israel. O comportamento deles fez com que o povo se ressentisse contra as coisas de Deus.

Eli sabia o que seus filhos estavam fazendo; no entanto, ele não os retirou de seus cargos e só os corrigiu com uma repreensão fraca: "Por que fazeis tais coisas? Pois de todo este povo ouço constantemente falar do vosso mau procedimento. Não, filhos meus, porque não é boa fama esta que ouço; estais fazendo transgredir o povo do Senhor" (1 Sm. 2:23- 24). Seus filhos mereciam mais do que esta correção leve. Eles deveriam ter sido retirados de suas posições como sacerdotes e do tabernáculo em geral, uma vez que não tinham um coração arrependido. Um profeta de Deus foi até Eli e disse: "Por que pisais aos pés os Meus sacrifícios e as Minhas ofertas de manjares, que ordenei se me fizessem na Minha morada? E tu, por que honras a teus filhos mais do que a Mim?... porque aos que Me honram, honrarei, porém os que Me desprezam serão desmerecidos" (1 Sm. 2:29- 30).

Honrar significa "considerar, estimar ou respeitar". Quando Eli se recusou a confrontar e disciplinar seus filhos, ele demonstrou que os estimava mais do que a Deus. Uma pessoa intimidada honra aquilo que teme mais do que honra a Deus. Percebendo isso ou não, ela se submete ao que a intimida. Se Eli não tivesse ficado intimidado, ele teria tratado com seus filhos de forma diferente. Mais tarde, Deus fala com Samuel a respeito de Eli: "Porque já lhe disse que julgarei a sua casa para sempre, pela iniqüidade que ele bem conhecia, porque seus filhos se fizeram execráveis, e ele não os repreendeu" (1 Sm. 3:13). A palavra do Senhor era rara, e a iniqüidade reinava sem restrições porque o juiz e sumo sacerdote tinha medo de seus filhos! Ele havia perdido o seu lugar de autoridade, e a sua capacidade de julgar retamente e de ministrar sobre Israel se fora. O propósito de Deus havia sido frustrado. Os inimigos de Israel se fortaleciam por todos os lados enquanto a corrupção reinava no interior da nação. Quando os líderes abdicam de sua autoridade, todos os que estão debaixo dos seus cuidados sofrem. Isto lhe Soa Familiar?

É lamentável, mas muitos pais são intimidados por seus próprios filhos. Como pastor de jovens, tive a oportunidade de ouvir famílias cristãs que estavam desesperadas em busca de ajuda. Vi adolescentes que desprezavam seus pais e falavam com eles sem respeito algum. Parecia que seus pais os irritavam. Perplexo, eu corrigia esses jovens bem diante de seus pais, porque estes ficavam constrangidos e tinham medo de corrigi-los. Esses lares eram caóticos, e a anarquia reinava. Os pais haviam abdicado de sua autoridade, entregando-a a seus filhos. O dom ou o poder de Deus nos pais para estabelecer a ordem no lar e criar filhos tementes ao Senhor estava adormecido. Este problema não se limita aos nossos lares, mas está evidente em nossas igrejas também. Estive em centenas de igrejas. Fico alarmado ao ver como muitos líderes são intimidados pelo seu próprio povo. A atmosfera nessas igrejas não é diferente da de Israel sob o sacerdócio de Eli: a voz de Deus é rara. Estes líderes abriram mão de sua posição de autoridade, e o poder de Deus está adormecido. Os pastores pregam em todos os cultos, e há louvor e adoração, mas há pouca ou nenhuma evidência da presença de Deus.

Estes pastores preparam a mensagem cuidadosamente, para não ofender ou confrontar aqueles que estão em desobediência; quando não fazem isso, criticam abertamente o povo, frustrados, batendo nas ovelhas para encobrir a sua intimidação por causa de alguns poucos. Mas em tudo isso há pouca - ou nenhuma - vida espiritual.

"Rara" é a descrição bíblica da presença de Deus. Pode haver um jorro de vida aqui ou ali, mas a presença de Deus não permanece, e a Sua palavra não é livre para fluir como uma fonte de águas vivas.

Em 1990, ministrei em uma igreja do "Evangelho Pleno". As pessoas da igreja acreditavam que estavam vivas e se movendo com Deus. Quando preguei no domingo pela manhã, senti como se minhas palavras estivessem sendo arremessadas de volta em meu rosto. Era como pregar face a face com um muro de tijolos. Havia uma pesada atmosfera de rebelião.

Eu não conseguia entender. O pastor e sua esposa eram as duas pessoas mais doces que eu já havia conhecido. O filho deles dirigia o louvor, e era um jovem maravilhoso. Fiquei confuso, até que fui almoçar com eles após o culto. O pastor disse: "John, tenho uma pergunta a lhe fazer. Há um casal em minha igreja que se divorciou. Ambos continuam a vir, sentando-se em lados opostos da igreja. Então o homem, que é o líder dos introdutores, conheceu uma mulher mais jovem na própria igreja e começou a namorá-la. Depois de algum tempo, ela foi morar com ele. Agora estão vivendo juntos. O que faço?". Eu não conseguia acreditar que ele precisava me perguntar isso. Perplexo, perguntei: "Você quer dizer que não o excluiu da igreja?". "Não", respondeu ele,"mas eu pedi que ele deixasse o cargo de líder dos introdutores".

Comecei a pregar para o pastor e sua esposa por uma hora. Disse a eles como Paulo lidava com os presbíteros na igreja de Corinto. Um homem estava vivendo em imoralidade ali também. Paulo repreendeu-os: "E, contudo, andais vós ensoberbecidos e não chegastes a lamentar, para que fosse tirado do vosso meio quem tamanho ultraje praticou?" (1 Co 5:2). Paulo disse que o homem deveria ser excluído da igreja e explicou por que:"Não sabeis que um pouco de fermento leveda toda a massa?" (1 Co 5:6). O fermento penetra lentamente na farinha e se espalha por toda a massa, fazendo com que todo o pão adquira a capacidade para crescer. Paulo compara o pecado não tratado, flagrante e voluntário em nossas igrejas ao fermento no pão.

Adverti aquele pastor: "Você está permitindo que o pecado se espalhe sem ser tratado em toda a sua igreja. Deus o responsabilizará pelo efeito sobre as outras ovelhas!" Prossegui: "Um pastor não apenas alimenta as ovelhas, mas também as protege.Você gosta de alimentá-las, mas tem medo de protegê-las porque não gosta do confronto. Mas ambos são importantes! Você precisa confrontar este homem de uma maneira firme e amorosa, e se ele não se arrepender imediatamente, exclua-o da igreja". Se não alimentarmos as ovelhas elas morrerão, mas se não as protegermos elas serão devoradas.

Ele e sua esposa ficaram brancos. Ela disse: "Não sei se quero continuar no ministério.Tudo que quero fazer é amar as pessoas".

Respondi: "Se você não proteger essas pessoas, isto é um amor conveniente, e não o verdadeiro amor".

Eles admitiram que estavam se sentindo intimidados por algumas pessoas da igreja. Eles se abriram e me contaram sobre outros problemas. Na equipe de louvor havia alguns músicos que eram desrespeitosos. Eu disse a eles o quanto havia me sentido frustrado durante o culto, e que agora sabia por quê. Naquela noite, no meio da minha pregação, um homem interrompeu-me para entregar uma mensagem em línguas. Pedi que ele parasse, explicando que Deus não interrompe a Si mesmo. O homem entendeu e parou de falar, mas quando ele o fez, o guitarrista se levantou, gritando comigo: "Não vou mais tolerar a pregação de alguém que não permite que o Espírito Santo se mova. Estou fora daqui!" Ele agarrou sua esposa e gritou com o baixista para que ele o seguisse. O baixista, sua esposa e mais outra pessoa saíram violentamente. A atmosfera ficou densa com o desconforto; a congregação ficou desnorteada.

Imediatamente, perguntei ao Espírito Santo o que fazer. Ele disse: "Ensine-os sobre autoridade". Enquanto eu ensinava, a paz de Deus entrou na igreja à medida que a Sua ordem era estabelecida.

Quando terminei, o Senhor me instruiu:"Diga ao homem que você interrompeu para entregar as línguas e a interpretação agora".

Um pouco hesitante, disse ao homem que havia corrigido: "Senhor, se possível, creio que Deus deseja que o senhor entregue a mensagem agora". Ele entregou a mensagem em línguas, e também deu a interpretação. Começava assim: "Assim diz o Senhor, tenho visto a infestação do pecado nesta igreja. Mostrei ao meu servo apenas parte dela. Dêem ouvidos às suas palavras, pois elas são as Minhas palavras".

Comecei a chorar por causa do pecado e da rebelião que permeavam aquela igreja. O pastor estava chocado. O pecado crescia desenfreadamente porque os líderes estavam sendo intimidados exatamente por aqueles dos quais Deus queria que eles cuidassem.

Alegrei-me ao saber mais tarde que o pastor confrontou o homem e a jovem que estavam vivendo juntos. Ambos se arrependeram e imediatamente planejaram se separar.

Um Pastor Intimidado por Sua Própria Diretoria

Certa vez, estava ministrando em outra igreja onde as reuniões haviam começado no domingo pela manhã e estavam programadas para irem até à quarta-feira à noite. Estávamos tendo cultos maravilhosos, com evidências de arrependimento, cura e libertação. A igreja havia experimentado uma reviravolta em suas finanças. A freqüência aumentou. Mas na terça-feira à noite, antes do culto, o pastor começou a chorar."Qual é o problema?" perguntei.

"John, não estou com ciúmes de você. Apenas não entendo por que nunca vejo Deus se mover. Sou cheio do Espírito Santo, mas nenhum dos dons do Espírito opera nos meus cultos. Ninguém é curado ou liberto, e tudo parece ser tão difícil!". Então, comecei a fazer perguntas. Descobri que havia dois casais que faziam parte da diretoria e ambos haviam sido cheios do Espírito Santo há mais tempo do que ele. Por causa disso, eles lhe diziam o que fazer e como dirigir a igreja. Expliquei: "Você está intimidado pela sua própria diretoria. Precisa reassumir a autoridade que lhe foi dada por Deus e dizer a eles que você é o pastor - não eles". No dia seguinte, ele falou com eles. Os dois casais ficaram contrariados e terminaram deixando a igreja. As reuniões se prolongaram, e na última noite um grupo de pessoas veio à frente para receber oração, mas o Senhor me disse: "Você não deve orar por essas pessoas. E o pastor quem deve orar por elas". Olhei para o pastor, e pude ver o poder de Deus sobre ele. "Pastor", disse eu, "Deus está dizendo que você deve orar por estas pessoas". Ele começou a correr em meio àquele grupo de pessoas. Ele apenas as tocava e elas caíam sob o poder de Deus. Algumas caíam antes mesmo que ele as tocasse. O poder de Deus era tão forte que elas eram atingidas antes mesmo que ele chegasse até elas.

Uma menina que estava possuída por demônios foi gloriosamente liberta. Depois de alguns minutos, todos naquele grupo de pessoas estavam no chão, sendo ministrados pelo Espírito Santo! O pastor voltou-se, olhou para mini e caiu de costas no chão. Sua esposa teve de encerrar o culto. Meia hora mais tarde, dois homens o levantaram do chão. Aquela igreja nunca mais foi a mesma. O poder de Deus no pastor estava inoperante por causa da intimidação. O resultado foi que a presença e o poder de Deus eram raros naquela igreja. Depois de quebrar o poder desta intimidação, o dom de Deus foi liberado. Mesma História, Cenário Diferente

Testemunhei provas de que este princípio é verdadeiro em inúmeras igrejas, assim como na vida de pessoas. Eu estava ministrando em uma igreja em outro país onde pude ver claramente - pela forma como os pastores e outros líderes agiam - que eles tinham problemas de intimidação. Preguei durante toda a semana, incentivando-os a permanecerem fortes no espírito e a avançarem em direção ao seu alto chamado em Deus. Quatro meses após minha partida, o tamanho da igreja havia triplicado! Eles passaram de um prédio de quatrocentos lugares para um auditório com dois mil lugares. Quando retornei após um tempo àquela nação, o pastor me disse que ele e sua igreja não foram mais os mesmos desde que quebraram as cadeias da intimidação.

Fui convidado para ministrar durante três dias em Atlanta. Na última noite, preguei sobre quebrar o poder da intimidação. O pastor foi gloriosamente liberto da intimidação que sofria pelo seu próprio povo. Ele disse: "Você precisa voltar imediatamente e ficar por uma semana".

Então, voltei três semanas depois, e realizamos nove cultos. O poder e a presença de Deus eram tão fortes que algumas pessoas tiveram de ser carregadas para suas casas depois da meia-noite. As pessoas ligavam para o pastor em sua casa, no meio da noite, perguntando o que deveriam fazer porque ainda estavam sendo tocadas pela presença e pelo poder de Deus. Elas nunca haviam visto Deus se mover de forma tão poderosa.

Esta igreja teve reuniões de avivamento todas as semanas durante nove meses depois desses acontecimentos. O pastor me ligava para dizer o quanto os cultos em sua igreja haviam sido poderosos e para contar quantas coisas maravilhosas estavam acontecendo na vida dos membros. Ele disse que não havia duas reuniões iguais. A igreja aumentou de quatrocentos para setecentos membros! Ele me disse em diversas ocasiões que a noite em que eu preguei sobre quebrar o poder da intimidação foi o momento decisivo em sua vida e ministério.

Estive em outra igreja "avivada". O louvor e a adoração eram capazes de fazer você dormir. O pastor se levantou, fez alguns anúncios e "ensinou" sobre as ofertas. Era tudo tão monótono como jamais havia visto em minha vida. Enquanto comíamos depois do culto, o pastor só filiava sobre futebol e outras coisas sem importância. E desnecessário dizer que o almoço foi um tédio!

Na manhã seguinte, Deus quis que eu pregasse sobre quebrar o poder da intimidação. No meio da mensagem, o pastor caiu ao chão, falando sobre as fraquezas que havia tolerado em sua vida e em seu ministério. Eu sabia que Deus estava fazendo uma obra em sua vida, mas não imaginava a que ponto. No dia seguinte, ele me ligou. "John, minha mulher só dormiu por uma hora e eu nem sequer fui para a cama!" disse ele."Ficamos acordados a noite toda nos arrependendo e chorando, e depois rindo. Então começávamos tudo de novo. Arrependimento, choro, e depois riso".

Naquele dia, ele convocou a diretoria e se arrependeu diante deles, pedindo perdão por não ser o líder que Deus o havia chamado para ser. Alguns membros da diretoria acabaram deixando a igreja quando perceberam que não podiam mais controlá-lo. O restante de sua equipe, porém, uniu-se a ele e apoiou o seu crescimento.

A igreja e este homem nunca mais foram os mesmos. Agora, quatro anos depois, o louvor e a adoração estão vivos. Eles têm tido reuniões de avivamento todos os finais de semana durante os últimos dois anos. Quando o pastor me telefona, o único assunto dele é o que Deus está fazendo e falando através dele e o que está acontecendo na sua igreja. Voltei lá várias vezes, e cada vez a coisa fica melhor. Ele também me disse várias vezes que esta mensagem foi o momento decisivo em sua vida e ministério.

Esta liberação não é apenas para pastores e líderes, mas também para todos os crentes. Recebemos muitos testemunhos de pessoas que foram libertas em cada área de suas vidas por terem quebrado as cadeias da intimidação. Uma mulher estava presente em um culto no qual preguei sobre quebrar o poder da intimidação. Após o culto, ela disse que sentiu as garras do medo e da intimidação serem soltas de sua vida. Algumas noites depois, ela e sua filha foram atacadas e ficaram sob a mira de um revólver na entrada de sua garagem. Três jovens as atacaram, agarraram a bolsa da mulher e cercaram-nas rapidamente. Uma grande ousadia se levantou dentro dela, e ela começou a falar em línguas o mais alto que podia. O jovem que estava segurando a arma gritou: "Pare com isso!" Ela não parou. O jovem ficou tão confuso que a filha dela conseguiu correr para dentro de casa e ligar para a polícia. Os homens fugiram, levando apenas a bolsa.

No dia seguinte, um homem cristão decidiu andar até à casa de sua mãe por um caminho diferente do que costumava fazer. Ele encontrou a bolsa da mulher em um bosque e ligou para ela. Os dois se alegraram juntos. Só estava faltando uma pequena quantia em dinheiro, e todos os seus documentos ainda estavam na bolsa. Ela disse à minha esposa que acreditava que esta mensagem havia liberado a coragem que salvou sua vida. No passado, ela ficava intimidada com tanta facilidade que teria ficado oprimida pelo medo em um confronto como aquele. Ela estava muito entusiasmada por estar livre!

Dou toda a glória a Deus por esses testemunhos. Eu também fui cativo da intimidação, mas por Sua graça agora sou livre! Esta liberação de sabedoria e poder para libertar os cativos veio Dele.

Nós identificamos o medo e a intimidação, e a capacidade que eles têm para impedir o poder e o dom de Deus, e até mesmo paralisá-lo, como acontece na maioria dos casos. Entretanto, o nosso propósito é ir além da simples identificação e seguir em frente, para quebrar as suas garras mortais!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Existe algo ou alguém que você tem honrado e temido mais do que a Deus, permitindo que a intimidação o paralise na esfera do espírito?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em que situações você comprometeu o que sabia ser certo ou tolerou o que não apoiaria, por causa do medo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Assim como Eli foi negligente diante do pecado dos seus filhos, há áreas em que a intimidação tem silenciado a voz de Deus na sua vida?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Espírito de Intimidação$t$, 8,
$conteudo$Resistência espiritual requer auxílio espiritual.

A fim de reconhecer a intimidação e lidar com ela, precisamos estar esclarecidos sobre dois pontos. Em primeiro lugar, o medo, ou timidez, é um espírito, e em segundo lugar, ele não provém de Deus.

Porque Deus não nos deu espírito de timidez.

- 2 Timóteo 1:7, ênfase do autor

A palavra grega para espírito nesta passagem é pneuma, que é a mesma palavra usada para o Espírito Santo ou o espírito do homem ou um demônio, de acordo com a concordância de Strong. Assim, a intimidação não é uma atitude ou uma disposição. E um espírito.

Por se tratar de um espírito, a intimidação não pode ser combatida no nível do nosso intelecto ou vontade. Ter uma atitude mental positiva não vencerá a intimidação. Resistência espiritual requer auxílio espiritual. Ela precisa ser tratada na esfera do espírito.

Pense nisto: Por que pessoas que são inteligentes e fisicamente fortes têm dificuldades com a intimidação - geralmente por parte de alguém ou de algo mais fraco tanto no corpo quanto na mente? Talvez tudo esteja bem, mas elas vivem com um temor constante de que as circunstâncias mudem para pior. Elas gastam todo o seu tempo e energia se preocupando e tentando se proteger contra o que talvez nunca venha a acontecer. É impossível desfrutarem do presente porque sentem um enorme medo do futuro. Isto não faz sentido, mas não importa o quanto você racionalize com elas, o medo delas persiste. Elas têm um espírito de timidez, ou de medo. Elas não estão lutando contra a fraqueza natural, mas contra a fraqueza espiritual.

Em seguida, pense nos homens e mulheres que parece que sempre conseguem o que querem. A estatura ou o grau de educação deles não importa. Pode ser que eles não ocupem nenhuma posição de autoridade, no entanto, aqueles que os cercam recuam e cedem a eles. Por quê? E simples. Eles controlam os outros por meio de um espírito de intimidação. Eles aprenderam a usar a intimidação em vantagem própria.

Certa vez, tomei café da manhã com um homem que tinha um negócio muito próspero. Ele me contou como havia vivido e administrado o negócio antes de ser salvo. Ele explicou: "Eu conseguia tudo o que queria para o meu negócio intimidando as pessoas. Literalmente conseguia sentir esse poder sobre mim quando entrava na Prefeitura. Eu adorava saber que as pessoas tinham medo de mim. Eu conseguia tudo que queria até mesmo na Câmara Municipal". Ele tinha um espírito de intimidação. Os líderes da cidade, embora ocupassem posições de autoridade acima dele, não ousavam opor-se a ele.

Elias não teve medo da nação de Israel quando os israelitas haviam se entregado à adoração a Baal. Que coragem tremenda - um homem contra uma nação! Ele também não se assustou com os oitocentos e cinqüenta falsos profetas. Que determinação! Um profeta contra quase mil líderes religiosos! Ele também não estava nem um pouco preocupado com a ira do rei de Israel.Tudo isto seria mais do que a maioria das pessoas poderia suportar. Entretanto, ele permitiu que uma mulher o intimidasse a fugir e querer morrer! Não faz sentido.

Os psicólogos diriam que ele tinha medo de mulheres, mas este seria um argumento no mínimo fraco, porque a nação de Israel era formada por homens mas também por mulheres! Na verdade, este era um conflito espiritual de tamanha magnitude que a nação, o rei e os falsos profetas pareceriam quase nada se comparados a ele. Elias enfrentou em Jezabel um forte e controlador espírito de intimidação que o rei e os falsos profetas não tinham.

Vamos descobrir o que as Escrituras revelam sobre a natureza desse espírito. Veja esta troca de palavras entre Jeú e o filho de Jezabel, Jorão. Sucedeu que, vendo Jorão a Jeú, perguntou: "Há paz,

Jeú?" Ele respondeu: "Que paz, enquanto perduram as

prostituições de tua mãe Jezabel e as suas muitas

- 2 Reis 9:22, ênfase do autor

Não tropece na palavra feitiçaria. Não cometa o erro de pensar em uma mulher com uma verruga no nariz voando em uma vassoura, lançando maldições e usando poções mágicas. Uma pessoa exerce feitiçaria quando procura ter o controle. Sim, há uma forma de feitiçaria que conjura espíritos demoníacos. Entretanto, a feitiçaria não se limita a isto. Paulo repreendeu a igreja dos Gálatas: "Gálatas insensatos! Quem foi o feiticeiro que os sugestionou e pôs em vocês esse encantamento ruinoso?" (G1 3:1, ABV). Esse encantamento não provinha de poções ou mágicas. Paulo estava se referindo aos mestres que os haviam persuadido a desobedecer ao que Deus havia claramente revelado a eles. Esses mestres não eram mestres do ocultismo, mas tinham um espírito controlador. E ele havia afetado toda a igreja. Jezabel tinha tamanho espírito de controle e intimidação que o rei, os líderes e todo o povo de Israel se submeteram a ela. Até Elias se submeteu a esse espírito e fugiu para salvar sua vida. Quando você permite que o medo entre em seu coração, estas são algumas das coisas que você se posiciona para perder: a paz, a confiança, a coragem, a tolerância, o heroísmo, a determinação e a segurança. E a lista continua. Observei pessoas tentarem se livrar do tormento do medo através do pensamento positivo. Elas não conseguem escapar, pois estão lidando com os efeitos do medo, e não com a sua origem.Você pode colher todos os frutos de uma árvore, e durante algum tempo parecerá que ela não tem nenhum fruto, mas ao final os frutos crescerão novamente. A árvore continuará a dar frutos até que as raízes sejam cortadas. Assim, para quebrar o poder da intimidação, você precisa buscar a força espiritual que está por trás dela.

Os Espíritos de Controle e Intimidação na Igreja

Em nossas igrejas, existem aqueles cujos corações não estão retos diante de Deus. Eles intimidam a liderança para conseguir o que querem. Eles fingem ser submissos até que as coisas não saiam do jeito deles. Quando a liderança é fraca, são eles que governam a igreja.

A medida que viajava para diferentes igrejas, muitas vezes enfrentava a intimidação e não sabia por que estava combatendo contra ela ou de onde ela estava vindo. O motivo para isso é que a intimidação é um espírito que ganha expressão através de qualquer pessoa que ceda a ele, até mesmo através de um crente! A Bíblia alerta os crentes a não darem lugar ao diabo (Ef. 4:27). Estou prestes a compartilhar algumas experiências, mas farei isto correndo o risco de ser rotulado de "superespiritual" ou de "paranóico" em relação a demônios. Entendo que algumas pessoas procuram um demônio em cada problema que enfrentam porque, se você puder culpar um demônio, não precisará assumir a responsabilidade por suas ações. Essa abordagem põe o foco mais nos demônios do que em Jesus. No entanto, a Bíblia nos instrui a mantermos os nossos olhos em Jesus, e não nos demônios. Ele é o Autor e Consumador da nossa fé (Hb. 12:2). A meu ver, devemos viver com o foco em Jesus, e se um demônio atravessar o nosso caminho ao fazermos isto, devemos dinamitá-lo com a Palavra de Deus e continuar a nossa busca por Jesus! Aleluia! No entanto, para quebrar a intimidação com eficácia, precisamos saber que ela 6 um espírito, e que não sairá se for ignorado. O que ocorre é exatamente o oposto.

Vou contar um dos muitos incidentes que confirmam que a intimidação é um espírito. Estava pregando uma série de cultos em uma igreja do sul do país. A primeira reunião foi em um domingo pela manhã, e foi poderosa. Durante anos utilizamos a fita desse culto em uma de nossas séries de palestras gravadas em áudio. Depois do culto, ninguém dizia nada de negativo ou intimidador. Na verdade, o povo que me cercava era muito positivo. Porém, mais tarde, eu me vi lutando contra o desânimo e a confusão. Sabia que algo estava errado, mas não sabia de onde vinha. Eu havia reconhecido esses sintomas como sendo os mesmos contra os quais lutava quando me deparava com a intimidação flagrante. Naquela noite, o Senhor me instruiu a pregar sobre a autoridade na igreja, e muitos foram ministrados. Depois do culto, o pastor me levou até seu gabinete. "Você não sabe o quanto estava no alvo nesta noite enquanto pregava", disse ele. Então, começou a me dizer como uma mulher que era membro de sua igreja havia ligado para ele naquela tarde e dito: "Pastor, sei que o senhor não concorda com o que este homem está pregando. Ele está sendo muito duro com o povo. Sei que o senhor vai encerrar as reuniões depois desta noite porque o senhor não é como ele. Então, esta noite não vou com- parecer. Vou ficar em casa e orar contra este homem".

Agora eu sabia exatamente de onde estava vindo todo aquele desânimo. Perguntei ao pastor se ele a havia corrigido. Ele é um homem muito misericordioso e me disse que não havia feito isso. Ele disse que havia dito a ela para deixar tudo nas mãos de Deus. Se esse pastor tivesse corrigido aquela mulher e permanecido na sua autoridade, estou certo de que eu teria tido uma tarde diferente. Aquilo que não confrontarmos não mudará. Se o mal for ignorado, ele se tornará mais forte! Ambos aprendemos com aquele incidente. O Senhor usou esta experiência para me mostrar como permanecer na minha autoridade espiritual e não me curvar ao espírito de intimidação.

Graças a Deus pelo Espírito Santo que sabia o que estava acontecendo e me fez confrontar aquele espírito a partir do púlpito - embora eu não soubesse o que estava acontecendo. O pastor sabia, e aquilo abriu os olhos dele. Aquelas reuniões foram as mais poderosas de todo o ano. Voltei àquela igreja, e o pastor e eu somos agora bons amigos.

Outro Encontro com um Espírito de intimidação e Controle Em outra ocasião, fui convidado para pregar em um retiro fora do país onde quase mil pessoas estavam inscritas. Tínhamos duas reuniões por dia e uma à noite. Os dois primeiros cultos foram muito fortes. Preguei sobre santidade e arrependimento. Mas, em cada culto, eu podia sentir a resistência na atmosfera. Depois do segundo culto, passei toda a tarde em meu quarto lutando contra o peso e o desânimo. Eu sabia que era um espírito de intimidação e controle, mas ninguém havia dito nada contra mim. Aquela altura, porém, eu já havia aprendido que não estava lutando contra a carne e o sangue, mas contra espíritos malignos. Os crentes precisam aprender a viver no espírito. O Espírito de Deus revelará contra o que você está lutando. Sem discernimento, concentraremos a nossa atenção nos efeitos colaterais. Se eu não tivesse reconhecido com o que estava lidando, teria começado a me perguntar: Por que estou sentindo depressão? Será que deveria ter vindo? Por que deixei minha mulher e meus filhos? Será que já não tenho mais este chamado? Será que deveria deixar de viajar? Se tivesse continuado com esta linha de raciocínio, não teria sido capaz de ministrar, e era exatamente isto que aquele espírito de intimidação e controle queria. O meu foco estaria colocado em mim, e não no que Deus tinha para aquelas pessoas.

Lutei durante toda a tarde. Quando foram me buscar para o culto daquela noite, mencionei ao meu intérprete que eu havia lutado contra a intimidação a tarde toda. Meu intérprete exclamou:"Eu também!" Descobrimos que havíamos sentido os mesmos sintomas. Naquela noite, preguei sobre o espírito de intimidação, e muitos foram libertos.

Na manhã seguinte, quando subi ao púlpito, não havia unção. Deus parecia estar em silêncio. Permaneci na plataforma por vários minutos esperando para ouvir a palavra do Senhor. Orei e fiz com que o povo orasse, mas ainda não havia qualquer direção, unção ou impressão para lazer nada. No fundo do meu coração, sabia que estava em uma guerra. Percebi que o foco total desse ataque era contra mim. Sabia que tinha de quebrar as palavras que haviam sido ditas diretamente contra a minha pessoa. A Palavra de Deus diz:

Toda arma forjada contra ti não prosperará; toda língua

que ousar contra ti em juízo, tu a condenarás; esta é a

herança dos servos do Senhor, e o seu direito que de

Mim procede, diz o Senhor.

Comecei a quebrar aquele ataque de intimidação. Ordenei que toda palavra proferida contra mim fosse condenada. Eu não me importava com o que as pessoas estivessem pensando. Aprendi que é melhor ouvir meu coração, onde o Espírito fala comigo.

Imediatamente, a palavra do Senhor veio a mim como uma metralhadora. Deus me disse exatamente o que as pessoas deveriam fazer. O poder de Deus desceu em menos de três minutos. As pessoas estavam sendo tão cheias com o Espírito Santo que começaram a rir incontrolavelmente. O mover do Espírito de Deus foi tão forte que eu nem sequer preguei. Houve relatos de pessoas que ainda estavam no templo às três da manhã. Foi uma grande reviravolta, e meu coração se alegrou. Se eu não tivesse confrontado aquele espírito, aquilo não teria acontecido. Mais tarde, soube através do intérprete que nas reuniões havia uma mulher que ministrava, e que, depois que o programa havia sido decidido, procurou o líder do cultos do retiro? Precisamos que outros ministros preguem". Ela queria ministrar. Ouvi outros relatos incomuns sobre aquela mulher. Ela fazia uso de práticas antibíblicas para ministrar "libertação", tais como administrai colírios e esfregar vinho na pele. Ela nunca havia sido confrontada. Na verdade, o líder permitiu que ela ministrasse de forma limitada durante o retiro. É triste dizer que os líderes geralmente optam por fazer concessões em vez de confrontar, porque acham que assim será mais fácil. Mas fazei concessões nunca é fácil - e geralmente o preço é muito alto.

Depois das reuniões, falei com o líder. Perguntei a ele se os relatos que eu havia ouvido sobre aquela mulher eram verdadeiros. Ele disse que sim. Compartilhei com ele minha preocupação quanto ao fato dela questionar a escolha dos preletores depois dele já ter determinado a direção de Deus para o retiro. Disse a ele que aquilo demonstrava que ela queria controlá-lo (ela não era uma líder ou membro daquela igreja).

Perguntei a ele: "Por que o senhor permitiu que esta mulher ministrasse no retiro?".

Ele disse:"John, eu disse a ela que não poderia usar aquelas práticas". Expliquei:"O senhor pode impedi-la de utilizar práticas antibíblicas, mas o espírito que está por trás delas ainda está ali. O estado do coração dela não mudou. Como líder, o senhor quis manter a paz e, Consequentemente, colocou uma pessoa com espírito de controle e intimidação em uma posição ministerial e de autoridade. Aquilo deu ao espírito de intimidação direito legal para lutar contra mim e contra qualquer outra pessoa que não concordasse com o que ele queria". Para ajudá-lo a compreender o que havia acontecido, compartilhei com ele sobre um incidente ocorrido em minha vida. Em uma determinada noite, quando eu era pastor em um seminário, havíamos acabado de ter um momento poderoso de louvor e adoração. Lágrimas desciam pelo rosto de muitos jovens. A paz e a presença de Deus enchiam a sala. Estávamos adorando havia quase quarenta minutos. Naquele instante, todos ralavam em silêncio, com exceção dos que choravam baixinho.

De repente, um jovem que eu nunca havia visto antes começou a falar em uma língua desconhecida. Quando ele fez isso, uma sensação entranha e perturbadora pairou sobre a sala. Então a jovem que estava ao lado dele, que eu também nunca havia visto antes, entregou uma interpretação estranha.

Ao ser apanhado de surpresa enquanto desfrutava da presença de Deus durante aquele nosso momento de louvor e adoração, eu não disse nada. Quando ela terminou, a atmosfera havia mudado. A presença do Senhor havia desaparecido completamente. Calculei que era tarde demais para dizer qualquer coisa. O dano realmente havia sido feito. Então, pedi a todos que se sentassem, fiz os anúncios da semana e recolhi as ofertas. Depois, comecei a pregar. Enquanto pregava, pensei: Onde está a vida? Em que direção estou indo? Por que eu disse isto? Não havia unção para pregar, e senti como se algo estivesse lutando contra mim. Não entendia por que o dom de Deus estava adormecido, então pedi que as pessoas orassem. O Senhor disse: "Quero que você confronte aquele homem e aquela mulher".

Pensei: Já se passaram vinte minutos. Não posso fazer isso. Então, deixei de lado o que Deus havia me dito e pensei: Vou apenas orar um pouco mais. Continuamos orando e lutando contra a oposição espiritual. Vários minutos depois, desesperado, eu disse: "Deus, o que está acontecendo?".

Ouvi novamente em meu espírito:"Quero que você os confronte". Naquele momento, havia passado mais tempo ainda. Pensei: De jeito nenhum. As pessoas vão me achar estranho. Oramos por mais dez minutos, e não houve nenhuma mudança. Desanimado, encerrei o culto.

Fui para casa naquela noite com o coração pesado. Não queria nem mesmo perguntar a Deus o que havia acontecido. Simplesmente fui me deitar. Na manhã seguinte, acordei sentindo um peso ainda maior em meu espírito. Fui orar. "Deus, o que aconteceu ontem à noite?" perguntei.

Ele respondeu: "John, Eu lhe disse para confrontar aquele homem e aquela mulher". Ele prosseguiu: "Quando Eu ponho você em uma posição de liderança em um culto (ou qualquer outra circunstância), você é responsável por manter a ordem e a autoridade sobre aquele culto. Eu não farei isso, porque confiei essa autoridade a você".

"Quando coloquei Adão no jardim, disse a ele para guardá-lo. Quando o diabo foi destruí-lo, embora Eu soubesse quais eram as graves conseqüências não apenas para Adão, mas também para toda a raça humana, não desci e tirei o fruto da mão dele! Eu não retiro o que entreguei, e havia entregado a ele essa responsabilidade. O homem e a mulher que Eu lhe disse para confrontar tinham um espírito de rebelião. Quando você não os confrontou, aquele espírito teve permissão para dirigir o culto. Quando isto aconteceu, o Meu Espírito se foi porque você abriu mão da sua autoridade".

Arrependi-me imediatamente, decidindo-me a jamais permitir que aquilo acontecesse novamente.

Depois que contei esta história àquele pastor estrangeiro, ele entendeu por que precisava confrontar aquela ministra rebelde. O seu rosto se elevou à medida que a luz do entendimento de Deus entrava em seu coração. Eu o incentivei:"Como pastor deste povo, o senhor foi chamado não apenas para alimentá-los, mas também para protegê-los. Proteção nesse caso significa confronto".

Perguntei a ele:"O senhor se vê em situações nas quais as pessoas lhe pedem algo, e o senhor sabe em seu coração que deveria dizer não, mas para manter a paz acaba dizendo sim?".

Ele respondeu: "Sim, John, eu faço isto". Então ele pensou por um instante e me olhou pensativo."Isto é hipocrisia, não é?"

Concordei. "O senhor disse bem, e esta hipocrisia ou concessão é fruto da intimidação", disse eu.

Ele se arrependeu por ter um espírito de timidez e saiu imediatamente para consertar as coisas com aqueles que o haviam intimidado. ando o encontrei novamente, havia um grande sorriso em seu rosto nulo ele exclamou:"Estou livre!".

Entenda que estes exemplos de confrontos desconfortáveis representam algumas situações extremas. Já preguei literalmente em centenas cultos onde não houve qualquer resistência, mas uma grande liberdade. A liberdade é a norma; a resistência, a exceção. Mas achei necessário apresentar alguns exemplos em maiores detalhes para o seu beneficio.

Embora estes incidentes digam respeito à área ministerial, os princípios se aplicam a todas as áreas da vida. A intimidação é um espírito e precisa ser tratado como tal. Se tentarmos lutar as batalhas espirituais com armas carnais, na melhor das hipóteses ficaremos frustrados, e na pior delas, sairemos feridos e derrotados. Porque, embora andando na carne, não militamos se-

gundo a carne. Porque as armas da nossa milícia não são

carnais, e sim poderosas em Deus, para destruir

fortalezas, anulando nós sofismas e toda altivez que se

levante contra o conhecimento de Deus, e levando

cativo todo pensamento à obediência de Cristo.

O inimigo chamado intimidação ataca a nossa alma, e ele não é derrotado através da psicologia ou do pensamento positivo. A nossa arma contra a intimidação é a espada do Espírito: "permanecendo firmes na Palavra de Deus" (Ef. 6:17)! Como veremos no próximo capítulo, confrontar a intimidação despertará o dom de Deus dentro de você.

Quebrando as Barreiras da Intimidação$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você já reconheceu que a intimidação não é apenas uma atitude ou disposição, mas um espírito que não procede de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que você tem tentado vencer o medo no nível do intelecto ou da força de vontade, se a resistência espiritual exige auxílio espiritual?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quanto do seu tempo e da sua energia você tem gasto temendo um futuro que talvez nunca chegue, em vez de desfrutar do que Deus já lhe deu hoje?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Reavive o Dom$t$, 9,
$conteudo$Que me poderá fazer o homem?

0 objetivo da intimidação é fazer com que renunciemos à nossa autoridade, tornando deste modo os nossos dons inoperantes. Assim, ficamos reduzidos a operar na nossa própria força e capacidade limitadas. Isto geralmente muda a nossa posição, que de ofensiva passa a ser defensiva. Então, cientes de que somos vulneráveis, recuamos ainda mais para uma posição confortável e segura. Desperte o Dom

Portanto, se a intimidação embala o sono do dom, o que o faz despertar? A resposta é: ousadia. A intimidação faz com que a pessoa recue, ao passo que a ousadia a arremessa para frente mesmo diante da oposição. Como uma pessoa intimidada pode tomar posse da ousadia?

Porque Deus não nos tem dado espírito de temor [in-

timidação], mas de poder, de amor e de moderação.

A ousadia é fruto das virtudes do poder, do amor e da moderação. A ousadia não 6 uma virtude em si.Todos nós conhecemos pessoas que são destemidas e ousadas, mas a verdadeira ousadia vem de Deus e é alimentada pela virtude piedosa. A ousadia que é alimentada pelo caráter de Deus desperta os dons em nossa vida. Algumas pessoas não têm virtude alguma por trás de sua ousadia. Elas sabem as coisas certas a dizer e agem com confiança quando enfrentam pouca ou nenhuma oposição, porém, a força delas não é profunda, mas superficial. O semblante de ousadia que elas mostram é na verdade uma máscara de arrogância ou ignorância. As suas raízes são rasas, e uma tempestade forte o bastante as deixará expostas. Quando o tempo está bom, você não consegue ver a profundidade das raízes de uma árvore, mas sob os ventos da adversidade, ela será desarraigada ou se mostrará forte. Quem é Mais Forte?

Davi disse: "O Senhor é a fortaleza da minha vida; a quem temerei?" (SI 27:1). Davi declarou que o Senhor era a sua fonte de força e poder. Sabendo que não existe ninguém maior do que Deus, ele podia declarar destemidamente:"Eu não temo a ninguém!".

Ele não apenas declarava com ousadia a sua confiança, como também a vivia. Davi conhecia o poder de Deus porque ele conhecia Deus. Esta ousadia capacitou-o a cumprir o seu destino e a governar com justiça. Vamos dar uma olhada nos anos de sua juventude.

Davi era o oitavo filho de Jessé, de Belém. Seus três irmãos mais velhos serviam no exército do Rei Saul. Os filisteus haviam reunido o seu exército contra Israel. Diariamente, o campeão deles, Golias, desafiava os soldados israelitas: "Escolhei dentre vós um homem que desça contra mim. Se ele puder pelejar comigo, e me ferir, seremos vossos servos; porém, se eu o vencer e o ferir, então sereis nossos servos e nos servireis" (1 Sm 17:8-9).

Do um modo gorai, os israelitas poderiam ter considerado esta opção em lugar do optarem por guerrear, mas Golias não era um soldado comum. De acordo com alguns relatos, ele tinha três metros de altura. Para que você possa ter uma perspectiva de sua altura, imagine uma cesta de basquete. A cabeça dele ficaria alguns centímetros acima do aro! Ele não era apenas grande, mas também era um guerreiro experiente. A ponta de sua lança sozinha pesava seis quilos e oitocentos gramas! O peso combinado de sua armadura, lança e escudo é estimado em cerca de noventa quilos, provavelmente mais do que Davi pesava na época. É desnecessário dizer que Golias era intimidador! A Bíblia diz: "Ouvindo Saul e todo o Israel estas palavras do filisteu, espantaram-se e temeram muito" (1 Sm 17:11). Ora, Davi, que pastoreava ovelhas, havia sido enviado por seu pai para levar suprimentos para seus três irmãos mais velhos e para ver como eles estavam indo. Depois de dar os alimentos ao que guardava os suprimentos, ele correu para encontrar seus irmãos. Logo, o campeão Golias saiu para provocar os israelitas pelo quadragésimo dia.

Davi ficou impressionado com o que viu - não com o tamanho de Golias, mas com a reação de seus irmãos e de seus conterrâneos. "Todos os israelitas, vendo aquele homem, fugiam de diante dele, e temiam grandemente" (1 Sm 17:24). Davi deve ter pensado: Será que eles esqueceram quem está do nosso lado? Ele não está nos desafiando. Ele está desafiando a Deus!

Então, Davi perguntou com ousadia: "Quem é, pois, este incircunciso filisteu para afrontar os exércitos do Deus vivo?" (1 Sm 17:26). O ar estava denso por causa do confronto. Seus irmãos mais velhos se sentiram nus quando Davi revelou a intimidação deles. Eles não queriam ouvir o seu irmão mais moço fazer uma declaração como aquela. Aquilo trouxe à tona as fraquezas deles, que até aquele momento eles não haviam tido que encarar. Eles haviam ficado em silêncio por acordo mútuo com base no comprometimento de seus princípios. Eles atacaram Davi verbalmente, sabendo que se pudessem fazer com que ele ficasse desacreditado, isto cobriria a vergonha deles. O irmão mais velho, que estava intimidado por Golias, tentou intimidar seu irmão mais novo. Quando Eliabe, o irmão mais velho, ouviu Davi falando

com os soldados, ficou muito irritado com ele e

perguntou:"Por que você veio até aqui? Com quem

deixou aquelas poucas ovelhas no deserto? Sei que você

é presunçoso e que o seu coração é mau; você veio só

Eliabe agora estava sendo ousado - ousado de raiva. Ele atacou o caráter de Davi, e não o problema que Israel estava enfrentando. Quando uma pessoa fica intimidada, ela procura um meio de escapar, uma liberação da pressão. Se for fraca, dará desculpas. Se for forte, atacará aqueles que o confrontaram colocando algum tipo de culpa sobre eles.

Observe que Eliabe acusou Davi de arrogância e maldade. Por pensar apenas em si mesmo, Eliabe supôs que Davi era igual a ele. Mas Davi não era. Ele era um homem segundo o coração de Deus. Ele não era orgulhoso, mas humilde perante o Senhor.

As pessoas que têm uma personalidade forte usarão a intimidação para fazer com que uma mentira pareça verdade. E preciso permanecer no espírito para vencer a força desses ataques.

Talvez Eliabe estivesse com ciúmes. Samuel ungiu Davi rei, embora Eliabe fosse o mais velho. Ele parecia ter as características de um grande líder e guerreiro. Até Samuel, ao ver Eliabe, pensou: Certamente está diante de mim o ungido do Senhor! Mas Deus usou isto para ensinar uma lição a Samuel: "Não atentes para a sua aparência, nem para a sua altura, porque o rejeitei; porque o Senhor não vê como vê o homem. O homem vê o exterior, porém o Senhor, o coração" (1 Sm 16:7). Então, o coração de quem era orgulhoso? Deus revelou a Samuel que Ele não escolheria Eliabe com base na sua estatura ou na sua aparência, nem o rejeitaria por esses fatores. Deus julga o coração. Quando Deus encontra orgulho em um coração, Ele resiste a esta pessoa (Tg 4:6). Deus rejeitou Eliabe porque ele era orgulhoso em seu coração. Portanto, Eliabe possuía exatamente aquilo de que ele estava acusando Davi — orgulho!

Geralmente, a intimidação acusará você exatamente das fraquezas que ela procura ocultar. Aqueles que agem de forma pura exteriormente, mas têm em seu interior um coração impuro, sempre atacarão os puros de coração. Lembre-se que Timóteo, um jovem de coração puro, ficou intimidado. Estou certo de que havia homens e mulheres na igreja de Éfeso cujos corações eram tão corruptos quanto o de Eliabe.

Jesus enfrentava a intimidação constantemente. Os fariseus e escribas impuros tentavam desacreditá-lo ou pegá-lo em alguma contradição em Suas palavras. Se eles conseguissem intimidá-lo, poderiam então controlá-lo. Assim, eles disseram que Ele era um traidor, um glutão, um beberrão e um pecador possuído por demônios, que eram exatamente as características que muitos deles possuíam. Recusando-se a se colocar debaixo do controle deles, Jesus expôs o que havia em seus corações. Por que os impuros tentam intimidar os puros? Para sentirem alívio da convicção do pecado e manterem o controle. Se tiverem êxito, eles não terão de examinar seus corações e se arrepender. Eliabe sabia que o seu ataque de descrédito e intimidação colocaria seu irmão Davi em submissão a ele e desviaria a pressão de si mesmo.

As mesas haviam sido viradas; Davi era aquele que estava sendo confrontado. Ele estava sob ataque, e seu irmão mais velho era muito maior do que ele. Lembre- se que os irmãos mais velhos podem tornar as coisas muito desconfortáveis para os menores. Se Davi não fizesse o que Eliabe queria, ele poderia ter muitos problemas em casa mais tarde. Ele poderia ter de pagar muitas vezes mais por sustentar a verdade. Será que valia a pena?

Aquela não era a única pressão contra ele. Todos estavam apoiando Eliabe. Eles também não queriam que o seu medo fosse exposto por um garoto ruivo! Teria sido mais fácil para Davi recuar e não seguir em frente com aquilo. Era exatamente isto que Eliabe, o intimidador, e os outros queriam.

Davi escolheu ficar ao lado de Deus, quebrando o poder da intimidação lançada contra ele. Ele perguntou a Eliabe: "Que fiz eu agora? Fiz somente uma pergunta" (1 Sm 17:29). Na verdade, ele estava dizendo: "O que eu disse não é verdade? Onde está a sua coragem? Eu não tenho medo. E óbvio que já que todos vocês estão atemorizados há quarenta dias, Deus teria de encontrar alguém que não se deixasse intimidar e que lutaria contra este filisteu incircunciso! Há um motivo para que eu esteja aqui!".

Então, ele foi levado perante o rei. Saul, que também estava intimidado por Golias, racionalizou com Davi. "Contra o filisteu não poderás ir para pelejar com ele; pois tu és ainda moço, e ele, guerreiro desde a sua mocidade" (1 Sm 17:33). Embora este argumento não fosse tão afiado quanto a declaração de seu irmão mais velho, ainda assim era um comentário depreciativo feito ao jovem pelo rei intimidado. Davi respondeu ao rei de forma diferente do que havia respondido a seus irmãos mais velhos. Ele disse:

"Teu servo apascentava as ovelhas de seu pai; quando

veio um leão ou um urso e tomou um cordeiro do

rebanho, eu saí após ele e o feri, e livrei o cordeiro da sua boca; levantando-se ele contra mim, agarrei-o pela

barba, e o feri, e o matei. O teu servo matou tanto o leão como o urso; este incircunciso filisteu será como um

deles, porquanto afrontou os exércitos do Deus vivo".

Disse mais Davi: "O Senhor me livrou das garras do

leão e das do urso; Ele me livrará das mãos deste

Com os seus irmãos e os soldados ele foi muito ousado e confrontou-os. No entanto, quando falou ao rei, ele sabia que estava se dirigindo a alguém que estava em posição de autoridade sobre ele. Ele suplicou ao rei como um filho suplicaria a seu pai. Ele apresentou a sua experiência e citou o Senhor como o seu Libertador, acreditando que o rei veria com clareza.

A responsabilidade por esta decisão estava sobre o rei. Se a batalha fosse perdida, uma nação iria para o cativeiro. Davi sabia que se tivesse de lutar, Deus mudaria o coração do rei. É importante que nos comportemos assim com os que estão em posição de autoridade sobre nós. Depois da fala de Davi, Saul concordou em deixá-lo lutar. "Vai-te", disse ele, "e o Senhor seja contigo". Davi recusou a proteção da armadura de Saul. Colocando-se sob a proteção do Senhor, que era o Escudo e a Armadura de Davi, ele pegou o seu cajado com uma mão e a sua funda com a outra e foi até o riacho para pegar cinco pedras pequenas. Quando o filisteu se aproximou, Davi enfrentou o seu maior desafio ao vencer a intimidação. Desta vez, se ele ficasse intimidado, aquilo faria não apenas com que o dom de Deus ficasse adormecido, mas lhe custaria a vida e levaria o seu povo para o cativeiro.

Olhando o filisteu e vendo a Davi, o desprezou, por-

quanto era moço ruivo e de boa aparência. Disse o

filisteu a Davi: "Sou eu algum cão, para vires a mim

com paus?" E, pelos seus deuses, amaldiçoou o filisteu a Davi. Disse mais o filisteu a Davi: "Vem a mim, e darei

a tua carne às aves do céu e às bestas-feras do campo".

Golias tentou intimidar Davi não apenas com o seu tamanho, mas também com suas palavras. Depois de amaldiçoar Davi, este gigante pintou um retrato vivido do que pretendia fazer com ele. Claramente sobrepujado por ele, Davi nunca duvidou da fonte de sua força ou de suas armas de defesa:

Davi, porém, disse ao filisteu: "Tu vens contra mini com espada, e com lança, e com escudo; eu, porém, vou

contra ti em nome do Senhor dos Exércitos, o Deus dos

exércitos de Israel, a quem tens afrontado. Hoje mesmo,

o Senhor te entregará nas minhas mãos; ferir-te-ei, tirar- te-ei a cabeça e os cadáveres do arraial dos filisteus

darei, hoje mesmo, às aves dos céus e às bestas-feras da terra; e toda a terra saberá que há Deus em Israel.

Saberá toda esta multidão que o Senhor salva, não com

espada, nem com lança; porque do Senhor é a guerra, e

Ele vos entregará nas nossas mãos".

Davi declara com ousadia a fidelidade de Deus. Os homens de Israel só haviam visto o quanto o gigante era grande, mas Davi viu o quanto Deus era grande! Os homens de Israel observaram enquanto Davi corria em direção ao inimigo de Deus — confiante não apenas em palavras, mas também em ação.

Davi meteu a mão no alforje, e tomou dali uma pedra, e

com a funda lha atirou, e feriu o filisteu na testa; a pedra encravou-se-lhe na testa, e ele caiu com o rosto em

A ousadia de Davi foi contagiante, e a esperança de Israel foi restaurada. Deus estava do lado deles, enquanto os filisteus tinham apenas um campeão morto. Os israelitas atacaram e perseguiram os filisteus, derrotando-os. Davi enfrentou a intimidação por três vezes durante este evento. Primeiro, seus irmãos e seus companheiros soldados tentaram fazer o máximo para depreciá-lo, ultrajá-lo e desanimá-lo. Se ele tivesse se deixado intimidar, teria recuado na sua decisão de perseguir o que Deus havia colocado em seu coração. Ele teria dado meia-volta e voltado para casa, e o dom de Deus teria ficado adormecido. Os resultados teriam sido muito diferentes: O gigante não teria sido morto por Davi; ele teria continuado a oprimir a nação, e Deus teria de encontrar outro homem para fazer a Sua obra.

Em segundo lugar, ele enfrentou as afirmações desanimadoras e depreciativas do rei. Se Davi tivesse recuado, o dom de Deus teria ficado adormecido. Mas ele se recusou a se deixar intimidar até mesmo pelo rei. Ele manteve o respeito pelo líder de sua nação, mas pôde persuadi-lo a permitir que ele lutasse. Em terceiro lugar, ele enfrentou a intimidação do gigante filisteu. O seu tamanho não era apenas avassalador aos olhos naturais, como também aquele homem era muito confiante. Ele tentou fazer com que Davi se sentisse insignificante e mais fraco do que um pequeno animal. Se tivesse se deixado intimidar por Golias, o dom de Deus em Davi teria ficado adormecido, e isto lhe custaria a vida. Davi era tão confiante no poder de Deus que foi capaz de colocar a sua própria vida em risco. Esta ousadia despertou o dom de Deus nele, e ele derrotou o gigante que havia intimidado e oprimido todo o exército por quarenta dias! 0 Poder da Nova Aliança

Na carta de Paulo à igreja de Corinto, ele comparou a glória do ministério da morte (a velha aliança) com a glória do ministério do Espírito (a nova aliança, 2 Co 3:7-8). Ele raciocinou que se o poder da velha aliança era tão glorioso que os filhos de Israel não podiam olhar diretamente para o rosto de Moisés, então muito mais poderoso seria o ministério da nova aliança que dá vida! Paulo descreveu a "nova aliança" como "este tesouro em vasos de barro, para que a excelência do poder seja de Deus e não de nós" (2 Co 4:7). Eis aqui outro homem que conhecia o seu Deus e que tornou real uma força ou poder que não eram dele mesmo. Paulo continuou:

Porque, se o que se desvanecia teve sua glória, muito

mais glória tem o que é permanente. Tendo, pois, tal

esperança, servimo-nos de muita ousadia no falar.

Este poder gera ousadia. Encontramos uma grande ousadia nos crentes que não confiam na sua própria força. Eles não se deixam intimidar pelas circunstâncias, pelas pessoas ou pelo diabo, porque Deus também não se intimida com estas coisas. Esta é a nossa promessa em Hebreus 13:5-6:

Porque Ele tem dito: "De maneira alguma te deixarei,

nunca jamais te abandonarei". Assim, afirmemos

confiantemente:"0 Senhor é o meu auxílio, não temerei;

que me poderá fazer o homem?"

Precisamos declarar com ousadia: O que me poderá fazer o homem? Esta mesma confiança está disponível para todo crente. Por que somos chamados crentes se não cremos? Cremos em quê? Cremos em Deus! Nenhum homem ou demônio tem o direito de intimidar um verdadeiro crente. Por quê? Por causa de Jesus. Nenhum nome é mais elevado; nenhum poder é maior. Nas Suas palavras: "Eis aí vos dei autoridade e poder... sobre todo o poder do inimigo [que o inimigo possui], e nada, absolutamente, vos causará dano" (Lc 10:19, AMP). Não poderia estar mais claro! Ele deu ao Seu povo poder sobre tudo que o inimigo possui. A intimidação é um inimigo. Ela mente para você, diz: Tenho mais autoridade ou poder que você. É melhor você recuar e fazer o que eu digo! Senão, você pagará as conseqüências.

Se dermos ouvidos a estas mentiras intimidadoras, o dom de Deus ficará adormecido e viveremos oprimidos. Mas quando conhecemos aquele que prometeu ser fiel, podemos descansar no poder que está , ima de todos os outros poderes e, como Davi, enfrentar o nosso gigante a intimidação com grande ousadia. A Sua Fé é Tão Complexa que Você não Consegue Crer?

Estas verdades não são difíceis de entender. Na verdade, elas são simples. O verdadeiro evangelho não é complicado. As pessoas não alcançam o alvo por causa da incredulidade.

Pergunte a si mesmo e responda sinceramente: A sua confiança está no que Deus disse ou no que você vê e nas suas experiências? Se você mede tudo pelo que aconteceu no seu passado, nunca crescerá além dele.

Você baseia a sua fé no que vê acontecer com os outros? O seu nível e confiança é avaliado com base na fidelidade dos outros?

Se você respondeu sim a estas perguntas, vá mais fundo. Você tem complicado as coisas ao tentar explicar fracassos passados - seus ou de outras pessoas? A fé complexa não mata gigantes. Ela nos aprisiona na terra da fantasia, onde tentamos entender o que não podemos mudar e hesitamos em fazer qualquer movimento. Por que nós, crentes, não podemos simplesmente crer? Por que permitimos que as nossas inseguranças compliquem o evangelho?

Quero compartilhar com você algo que nunca esquecerei. Foi no ano de 1980, e eu era um estudante que vivia na Carolina do Norte, acordei às quatro da manhã de um sono profundo, com o som de minha própria voz gritando: "Estou procurando alguém que creia!"

Aquilo me sacudiu. A cama estava molhada de suor. Eu sabia que Deus havia falado comigo de uma forma inusitada e sobrenatural.

Naquele instante, pensei: Que óbvio! Por que Deus não me deu algo profundo? E claro que eu sabia que Ele precisa de pessoas que creiam! Na manhã seguinte, aquelas palavras pairavam na minha mente. Eu ouvia sem cessar aquele sussurro "Estou procurando alguém que creia; só estou procurando alguém que creia". À medida que ouvia aquelas palavras novamente, percebi que Ele não havia me mostrado algo trivial, mas a chave para andarmos com Deus! Debrucei-me sobre os Evangelhos para estudá-los, e observei que Jesus sofria e ficava frustrado com a incredulidade das pessoas. Quando os Seus discípulos não conseguiram expulsar o demônio de um jovem,  Jesus os repreendeu severamente por isso.

Jesus exclamou:"Ó geração incrédula e perversa! Até

quando estarei convosco? Até quando vos sofrerei?

Que coisa para dizer aos seus próprios discípulos! Jesus não era um fracote como muitos líderes de hoje! Ele deixou bem claro para eles que o dom de Deus permaneceria adormecido neles se não pudessem crer. Ele queria que ficasse claro que Ele estava triste com eles.

Também percebi o que agradava Jesus: aqueles que acreditam sem questionar! Um soldado romano gentio recebeu mais atenção por sua fé do que todos os outros em Israel. Esse romano disse a Jesus que Ele nem sequer precisava ir até sua casa, e que se Ele apenas dissesse uma palavra, o seu servo ficaria curado. "Ouvindo isto, admirou-Se Jesus e disse aos que O seguiam: Em verdade vos afirmo que nem mesmo em Israel achei fé como esta!" (Mt 8:10).

Queremos que Jesus venha à nossa casa, mas iremos duvidar quando Ele chegar! Nós tornamos a fé tão difícil! Então, o que é a fé? Crer que Deus fará o que Ele disse que fará.

Jesus disse que Ele nos deu poder e autoridade sobre todo o poder do inimigo.Tudo que precisamos fazer é crer Nele e depois andar nesse poder e autoridade. Não precisamos complicar a nossa caminhada com medo, dúvida ou lembretes dos nossos fracassos e falhas do passado. Se fizermos isso, seremos roubados da nossa ousadia, e nos tornaremos incapazes de agir na capacidade de Deus. O dom de Deus em nós ficará adormecido!

Antes de sairmos confiantemente do nosso barco para as águas tempestuosas da vida, precisamos conhecer as motivações do nosso coração para não afundarmos! O próximo capítulo lhe mostrará a diferença entre a motivação que o ajudará a ficar de pé e aquela que o fará afundar.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Em que áreas a intimidação fez você renunciar à sua autoridade e operar apenas na sua própria força e capacidade limitadas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você tem permitido que o medo o leve de uma posição ofensiva para uma posição defensiva e recuada diante da oposição?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a ousadia que nasce do poder, do amor e da moderação de Deus — e não de uma máscara de arrogância — pode despertar os dons adormecidos em você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Raiz de Intimidação$t$, 10,
$conteudo$É fácil ser confiante desde que Deus esteja fazendo o que esperamos que Ele faça.

Viver livre da intimidação não tem nada a ver com ser uma pessoa extrovertida. Algumas das pessoas mais extrovertidas que conheci lutaram contra a intimidação. Na verdade, às vezes a exuberância delas não passa de uma capa para a timidez que enfrentam dentro de si mesmas. Fechar- se em si mesmo não é o único sintoma de alguém que está intimidado. No caso de algumas pessoas, quanto mais desconfortáveis elas se sentem, mais falam.

Ser vulnerável à intimidação também não tem nada a ver com o nível da sua unção. Conheci homens que eram poderosos no ministério e que tinham problemas com a intimidação. Quando a unção repousava sobre eles, eles eram destemidos, e a fraqueza deles ficava oculta pela unção de Deus. Mas se levantássemos o manto da unção, tudo que restava era um homem lutando contra o medo e a insegurança. Nas situações de âmbito particular, a timidez deles ficava aparente de uma forma chocante. Como sei que isto é verdade? Porque eu fui um deles. Você pode ser extrovertido, forte, ousado - e até ungido - e ainda ter problemas com a intimidação. Quando a pressão se torna forte o suficiente, a sua verdadeira essência vem à tona. Ter um espírito de timidez não tem nada a ver com lima deficiência de personalidade, força física ou unção. Então, o que faz com que as pessoas fiquem vulneráveis à intimidação?

Para responder a esta pergunta, vamos observar Simão Pedro. Ele era extrovertido, e nunca tinha vergonha de expor a sua opinião. Ele era ou sado.Tudo indica que Pedro era um homem que tinha força de vontade e era destemido. Parecia que nada podia intimidar Pedro, mas uma coisa o intimidou. O seu medo da morte fez com que ele negasse Jesus três vezes. Então, a capacidade para andar livre da intimidação não é conquistada através de uma personalidade forte, do contrário Simão teria sido aquele com menores probabilidades de negar Jesus e o mais capacitado .1 permanecer fiel. Alguns têm a tendência de repudiar Simão Pedro como um fanfarrão; essas pessoas dizem que na hora de agir ele realmente era medroso. Para responder a isto, pergunto: Quantos medrosos ousariam se levantar diante de um grupo de guardas totalmente armados e desferir um ataque ofensivo? Pedro fez isso com ousadia! João 18:3, 10 relata:

Tendo pois, Judas, recebido a escolta e, dos principais

sacerdotes e dos fariseus, alguns guardas, chegou a este lugar com lanternas, tochas e armas... Então Simão

Pedro puxou da espada que trazia e feriu o servo do

sumo sacerdote, cortando-lhe a orelha direita.

Esta não me parece a atitude de um medroso. Então, por que Simão Pedro desafiaria os soldados, para depois se acovardar diante de uma serva, uma menina? Sim, isto mesmo. Aquela que o intimidou era uma menina! "Ora, estava Pedro assentado fora no pátio; e aproximando-se uma menina, uma criada, disse-lhe: Também tu estavas com Jesus, o galileu. Mas ele o negou" (Mt 26:69-70). Qual o motivo desta mudança?

Para responder, vamos voltar a alguns momentos antes naquela noite. Iodos os discípulos estavam juntos celebrando a Páscoa.Jesus advertiu-os: "lista noite todos vós vos escandalizareis comigo" (Mt 26:31). Mas Pedro declarou que ele seria uma exceção, e afirmou com ousadia: "Ainda que venhas a ser um tropeço para todos, nunca o serás para mim" (v. 33). Que valiosa demonstração de coragem! Parecia que Jesus havia se enganado quando incluiu Pedro entre os demais. Mas Jesus olhou diretamente na alma de Pedro e corrigiu-o: "Em verdade te digo que, nesta mesma noite, antes que o galo cante, tu Me negarás três vezes" (v.34). Que golpe na autoconfiança de Pedro! Jesus disse a Pedro que ele não só se escandalizaria, como também O negaria.

Um homem de personalidade ou vontade fraca teria recuado neste ponto. Será que o Mestre havia se enganado? Mas Pedro defendeu sua posição ainda mais: "Ainda que me seja necessário morrer contigo, de nenhum modo Te negarei!" (v. 35). Na verdade, esta declaração ousada inspirou os outros a concordarem:"E todos os discípulos disseram o mesmo" (v. 35).

Os Motivos Podem Ser Diferentes do que Parecem Ser

Superficialmente, parecia que aqueles homens tinham uma grande coragem e motivações puras. Examinando mais de perto, porém, descobrimos algo que os motivava além do amor a Deus.

Antes de adverti-los, Jesus compartilhou com eles: "Todavia, a mão do traidor está comigo à mesa" (Lc 22:21). Que horrível, que terrível pensar que um deles poderia trair Jesus. Alguém que havia vivido e andado com Ele aquele tempo todo, alguém com quem Ele havia Se importado, agora levantaria o calcanhar contra Ele - o Messias!

Embora Jesus soubesse, e tivesse sabido desde o princípio quem era o traidor e o que ele faria, esta era a primeira vez que Seus discípulos ouviam falar daquilo.Você pode imaginar o temor e a suspeita que pairou sobre aquela sala depois deste anúncio?

"Então, começaram a indagar entre si quem seria, dentre eles, o que estava para fazer isto" (Lc 22:23). Eles ficaram confusos e incrédulos ao imaginar que um deles fosse capaz de um ato de maldade tão inimaginável. Então, qual era o motivo deles para esta investigação? Com certe/a deve ter sido a preocupação deles com Jesus. Mas foi mesmo? A conversa deles os denunciou.Veja o versículo seguinte: Suscitaram também entre si uma discussão sobre qual

deles parecia ser o maior.

Como podemos ver claramente, o motivo daquela investigação para saber quem seria o traidor foi o egoísmo e o orgulho. Jesus disse a eles que estava para ser entregue aos principais dos sacerdotes para ser condenado à morte, e os discípulos começaram a competir por poder e posição. Que egoísmo!

Podemos imaginar quem liderou a competição. Provavelmente foi Simão Pedro, agindo de acordo com as suas demonstrações passadas de liderança e com a sua personalidade dominante.

Talvez ele tenha rapidamente lembrado aos outros como ele havia sido o único com coragem suficiente para andar sobre as águas (Mt 14:28-31). Ou talvez ele tenha refrescado a memória deles com relação ao fato dele ter percebido quem Jesus realmente era (Mt 16:15-16), culminando com um repetição da sua experiência no monte da transfiguração com Jesus, Moisés e Elias (Mt 17:1-8). Provavelmente ele estava muito confiante de que havia provado ser o maior dos doze. Mas será que esta confiança estava enraizada no amor? Estou certo de que Pedro pensava que sim naquele momento. Porém, mais tarde, as coisas se mostrariam diferentes. A sua confiança estava firmada no orgulho e no egoísmo. Tendo isto em mente, vamos seguir em frente.

"Em seguida, foi Jesus com eles a um lugar chamado Getsêmani e disse a Seus discípulos: Assentai-vos aqui, enquanto Eu vou ali orar" (Mt 26:36). A palavra Getsêmani literalmente significa "prensa de azeite".1 A prensa de azeite extrai o azeite da azeitona. A azeitona não libera o seu óleo espontaneamente. Somente quando se aplica pressão extrema é que o azeite de dentro sai. Getsêmani é o lugar onde esta pressão é exercida não nas azeitonas, mas nos corações. Sob pressão intensa, o que está dentro de nós sairá, geralmente para surpresa nossa. Em outras palavras, as motivações do nosso coração são testadas e expostas quando as provações (as pressões) vêm.

Quando Jesus foi ao Getsêmani com Pedro, Tiago e João, as Escrituras dizem que Ele: "Começou a entristecer-se e a angustiar-se" (Mt 26:37). A alma de Jesus estava "extremamente triste" porque Ele estava na prensa de azeite. Ele estava combatendo a Sua maior batalha - a tentação de cumprir a vontade do Pai de outra forma e assim salvar a Si mesmo.

Algumas pessoas não acreditam que Jesus fosse capaz de pecar. Precisamos nos lembrar de que Jesus foi tentado "em todas as coisas à nossa semelhança, mas sem pecado" (Hb 4:15). Ser tentado significa que tinha de lutar contra alguma coisa. Jesus não era automaticamente imune às lutas, Ele apenas sempre triunfava sobre elas. Por quê? Porque Ele não exercia a Sua própria vontade. Se fosse impossível Jesus pecar, seria impossível Ele ser tentado. Isto não diminui a Sua glória, mas ilustra ainda mais o quanto Ele é digno, porque Ele não pecou. Aleluia! Este foi o pedido de Jesus no jardim: "Pai, se possível, passe de Mim este cálice! Todavia, não seja como Eu quero, e sim como Tu queres" (Mt 26:39). Esta é a primeira vez que vemos a vontade do Pai e a vontade do Filho em conflito na vida de Jesus. Até o jardim, elas estavam tão interligadas que só víamos a vontade do Pai manifesta através da vida de Jesus. Mas a pressão avassaladora desta batalha percorria Sua alma. Ela expôs a única coisa que poderia fazê-lo recuar - optar por cumprir a vontade do Pai de outra forma, assim salvando a Si mesmo. Anteriormente, Jesus havia dito aos fariseus que a Sua vida lhe pertencia para que Ele pudesse entregá-la (Jo 10:17-18). Deus não O obrigou a fazer isso. Foi por isso que Ele lutou - sozinho.

Ele sabia que essa luta estava diante Dele muito antes de Se ajoelhai no jardim. Ele havia compartilhado isso com os Seus discípulos três vezes antes deles irem a Jerusalém. Ele lhes disse que era a vontade do Seu Pai que Ele sofresse, morresse e ressuscitasse dos mortos.

Alguns dias depois, Ele confidenciou aos Seus discípulos: "Agora, está angustiada a Minha alma, e que direi Eu? Pai, salva-me desta hora: Mas precisamente com este propósito vim para esta hora. Pai, glorifica o Teu nome" (Jo 12:27-28).

Jesus estava disposto a entregar a Sua vida aos pés da morte para que o nome do Pai fosse glorificado. Ele havia acabado de compartilhai este princípio com os Seus discípulos. "Quem ama a sua vida perde-a; mas aquele que odeia a sua vida neste mundo preservá-la-á para a vida eterna" (Jo 12:25). Este versículo contém duas respostas - porque Pedro não podia cumprir com o que ele havia votado e porque Jesus podia. Jesus amava Seu Pai mais do que a Sua própria vida, e assim Ele pôde entregar a Sua vida. Pedro pensou que amasse Jesus mais do que a sua própria vida, mas a prensa de azeite do Getsêmani revelou as motivações dele.

No jardim, não bastava que Jesus conhecesse a vontade do Pai. Ele agora tinha de transformar-se nessa vontade. Isto era tão difícil que Ele perguntou a Seu Pai se havia algum outro caminho. Em oração, Ele lutou ardentemente contra a tentação de se autopreservar e resistiu a ponto de suar sangue (Lc 22:44). O poder de Jesus para resistir à tentação tinha suas raízes naquilo que Ele amava e não amava. Ele Se perdeu no amor por Seu Pai (Jo 14:31). Este amor venceria o que nenhum homem havia conquistado antes: o amor ao ego! O azeite brotou, provando o Seu amor por Seu Pai não apenas em palavras, mas também em sacrifício e obediência.

Agora, veja como a "prensa" ou a pressão afetou Pedro e os outros discípulos. Espírito Pronto, Carne Fraca

Depois de lutar contra a Sua vontade por uma hora, Jesus Se levantou e foi em direção aos Seus discípulos apenas para encontrá-los "dormindo de tristeza" (Lc 22:45). Os discípulos não estavam mais discutindo quem era o maior. Eles estavam com o coração pesado por causa da dor e da tristeza. Jesus não era o único que estava sob pressão. Os discípulos também estavam na prensa de azeite! Eles estavam enfrentando a tentação de salvarem a si mesmos. Mas eles não tinham forças às quais pudessem recorrer, porque o foco deles estava na sua própria vontade, e não na vontade do Pai. Diferentemente de Jesus, eles não tinham o desejo de colocar o foco novamente na vontade do Pai. Se prezarmos a nossa própria vida, não lutaremos apenas com o objetivo de sermos capazes de entregá-la. Pense nisto: Enquanto Jesus lutava para perder Sua vida, os discípulos evitavam a luta ao dormirem. Jesus falou especificamente a Pedro: "Então, nem uma hora pudestes vós vigiar comigo? Vigiai e orai, para que não entreis em tentação; o espírito, na verdade, está pronto, mas a carne é fraca" (Mt 26:40-41). Ali estava Pedro, esse homem de promessas ousadas, dormindo em vez de orar. Ele ainda não havia aprendido a extrair uma força que não era sua, e assim protegeu o que pensava ser a sua força dormindo.

O nosso espírito, o nosso coração, pode estar pronto, mas a nossa carne sempre procurará se proteger. Consequentemente, se a nossa carne não for crucificada, daremos a ela o que ela quer. Pedro queria ser fiel a Jesus, mas não conseguiu porque a sua carne o venceu. Ele amava a sua própria vida mais do que desejava a vontade de Deus. Ele não reconheceu o verdadeiro estado do seu coração. Ele falava sério sobre o que disse e realmente acreditava que sacrificaria sua vida por Jesus. Entretanto, o que saiu da "prensa" foi o que havia sido prenunciado na Ultima Ceia: egoísmo e orgulho.

Depois que Jesus encontrou os discípulos dormindo, Ele voltou pela segunda vez para orar. Quando voltou, encontrou-os dormindo novamente, pois "seus olhos estavam pesados" (Mt 26:43). Mesmo depois que Jesus os advertiu, eles não conseguiram despertar. "Deixando-os novamente, foi orar pela terceira vez, dizendo as mesmas palavras. Então, voltou pata os discípulos e lhes disse: Ainda dormis e repousais! Eis que é chegada a hora" (vv. 44-45).

Jesus orou por três horas até saber que a Sua batalha estava ganha. A Sua vontade era totalmente uma com a vontade do Pai. Ele agora estava pronto para enfrentar a intimidação do inimigo nas mãos dos líderes judeus e dos soldados romanos.

A capacidade de Jesus de permanecer firme mesmo no calor da perseguição impressionou o governador romano."E, sendo acusado pelos principais sacerdotes e pelos anciãos, nada respondeu. Então, lhe perguntou Pilatos: Não ouves quantas acusações Te fazem? Jesus não respondeu nem uma palavra, vindo com isto a admirar-se grandemente o governa dor" (Mt 27:12-14).

Ousadia não é falar alto nem falar muito. A ousadia também se encontra no silêncio quando acusações falsas são lançadas em seu rosto. Jesus permaneceu na Sua autoridade quando não reagiu. Ele sabia que eles não tinham qualquer poder sobre Ele. Reagir seria indicar que tinham. Eles tentaram controlar Jesus com as suas acusações, ameaças e posições de poder. Responder a eles seria loucura, pois eles não tinham qualquer preocupação quanto à verdade. Jesus sabia que eles não podiam tirar a Sua vida porque Ele já a havia dado ao Pai! Enquanto Jesus enfrentava Seus acusadores, Pedro se aquecia junto ao fogo, do lado de fora. Intimidado pelos simples servos desses líderes, Pedro negou até mesmo conhecer Jesus (Mt 26:69-75). Embora tenha dito que morreria antes de negá-lo, Pedro terminou ficando intimidado e fazendo exatamente o que disse que não faria. O motivo: Ele amava a sua própria vida.

As palavras de Pedro a Jesus demonstraram um grande amor por Ele, mas as suas atitudes falaram mais alto. liste amor por si mesmo era a raiz da sua timidez. Ela estava bem oculta por trás das declarações ousadas e das ações que ele havia tomado anteriormente, mas a prensa de azeite revelou o seu espírito de timidez. A raiz do medo e da intimidação é o amor ao ego. O perfeito amor lança fora o medo e nos dá ousadia. A ousadia que nasce do amor despedaça as garras da intimidação. O amor imperfeito, ou o amor por si mesmo, abre a porta para a intimidação.

Nisto é em nós aperfeiçoado o amor, para que, no Dia

do Juízo, mantenhamos confiança. 2 No amor não existe

medo; antes, o perfeito amor lança fora o medo. Ora, o

medo produz tormento; logo, aquele que teme não é

O medo e a intimidação são ampliados quando colocamos o foco em nós mesmos. O tormento clama: "E eu? O que vai acontecer comigo?". Jesus disse: "Ninguém tem maior amor do que este; de dar alguém a própria vida..." (Jo 15:13). Quando realmente damos a nossa vida por amor a Jesus, já não nos importamos com o que vai acontecer conosco porque sabemos que estamos entregues aos Seus cuidados. Então estamos mortos e escondidos Nele. Não precisamos nos preocupar porque as nossas vidas já não nos pertencem, mas pertencem a Ele. Jesus nos comprou; portanto, o que quer que aconteça conosco diz respeito somente a Ele. Nós simplesmente amamos e obedecemos. O medo não poderá mais nos atormentar porque uma pessoa morta não pode ser atormentada. Você pode apontar uma arma para um homem dentro de um caixão e ameaçá-lo, e ele nem piscará.

E Quanto a Todos os Outros?

E quanto aos demais discípulos? Eles se uniram a Pedro, confessando que morreriam antes de negar Jesus. Como eles se saíram na prensa de azeite? Eles fugiram antes mesmo de Pedro. A Bíblia relata que quando viram os soldados levarem Jesus, "os discípulos todos, deixando-O, fugiram" (Mt 26:56). Todos eles temeram por suas vidas. Eles também haviam dormido em vez de orar. Na sua última refeição com Ele, haviam discutido sobre quem era o maior entre eles. Era como se não estivessem ouvindo ou não conseguissem ouvir. Eles só conseguiam ouvir: "O que acontecerá comigo?" O amor deles por si mesmos foi revelado na prensa de azeite.

Seus motivos não eram diferentes dos de Pedro. Pedro só estava em uma situação mais difícil porque seguiu os soldados até onde eles levaram Jesus. Nem Toda Ousadia é Motivada pelo Amor

Você ainda pode se perguntar o que deu a Pedro a ousadia para se levantar com a espada na mão diante de um pequeno exército. Creio que a ousadia dele foi produto da aprovação dos outros. Ele se esforçava para impressionar os outros. Pense nisso. Havia acabado de ocorrer uma discussão sobre quem era o maior (esta não era a primeira vez que este assunto era discutido por eles, pois os discípulos estavam em constante competição). Aquilo estava fresco na mente de Pedro, e agora ele tinha a oportunidade de provar a sua grande fidelidade.

Contudo, quando ele se sentou diante do fogo com os servos do sumo sacerdote, não mais cercado por seus amigos, as suas verdadeiras inseguranças vieram à tona. O medo, normalmente oculto por sua personalidade extrovertida, foi revelado.

Os incidentes anteriores também revelaram a ousadia vacilante de Pedro. Um deles foi quando Pedro andou sobre a água. Enquanto todos os outros discípulos observavam, Pedro gritou: "Se és Tu, Senhor, manda- me ir ter contigo, por sobre as águas" (Mt 14:28). Pedro saiu do barco e andou sobre o mar. Talvez a sua coragem tenha sido alimentada pelo desejo de impressionar seus companheiros. Entretanto, sozinho no meio de um mar tempestuoso, ele clamou para que Jesus o salvasse. Ao andar sobre as águas, ele percebeu que nenhum dos seus competidores estava ao seu lado. Sob pressão, ele clamou para que Jesus o salvasse do perigo. E bem provável que Pedro achasse que Jesus o salvaria deste incidente no jardim, assim como Ele havia feito muitas vezes antes. E ele estava certo. Mas o que Pedro e todos os outros não esperavam era ver Jesus ser preso. Embora Jesus tivesse lhes dito repetidamente que isto aconteceria, eles ainda acreditavam que Ele estabeleceria o Seu reino na terra naquele momento (At 1:6; Mt 16:21). E fácil ser confiante desde que Deus esteja fazendo o que esperamos que Ele faça. Mas quando Ele nos surpreende, podemos vacilar. Algo acontece em nossas vidas ou ministérios que nos pega de surpresa, e perdemos a nossa ousadia. Geralmente não estamos preparados para sofrer aflições, perseguições ou provações. Como crianças, nos sentimos confortáveis com a rotina e com as coisas do nosso jeito. Quando não temos o que queremos, quando queremos e do jeito que queremos, o nosso coração é testado. Quando somos atingidos por provações, o nosso coração é pesado. Podemos parecer confiantes quando Deus nos dá exatamente o que queremos ou quando a vida é previsível, mas quando as coisas correm de outro modo, as nossas motivações são reveladas. Jesus descreve este estado: Semelhantemente, são estes os semeados em solo ro-

choso, os quais, ouvindo a palavra, logo a recebem com

alegria. Mas eles não têm raiz em si mesmos, sendo

antes, de pouca duração; em lhes chegando a angústia

ou a perseguição por causa da palavra, logo se

Observe que o motivo pelo qual eles não perseveraram foi porque não tinham raízes. Como desenvolvemos raízes para nos mantermos firmes? Em que devemos estar enraizados? Efésios 3:17 diz que devemos estar enraizados e fundamentados no nosso amor a Cristo. O verdadeiro amor não procura os seus interesses. As pessoas cujo amor não tem raízes conseguem se manter firmes somente enquanto é fácil para elas. Elas não foram crucificadas com Cristo, mas vieram a Jesus pelo que podem conseguir, e não por quem Ele é!

Aqueles que amam verdadeiramente não buscam nada além do seu Amado e do que agrada a Ele. O amor não tem expectativas. Em vez disso, ele dá. E esta motivação permanece sem ser afetada mesmo quando as coisas mudam e frustram as expectativas. O amor não desanima (não perde a coragem), por isso, ele não se deixa intimidar.

A ousadia necessária para quebrar o poder da intimidação precisa sei alimentada com o nosso amor por Deus. "Porque Deus não nos deu o espírito de temor [de intimidação], mas de poder, de amor e de moderação" (2Tm 1:7). Como já disse, vi homens ungidos desistirem sob o peso da intimidação durante momentos de pressão.

De acordo com o versículo, ter moderação (uma mente equilibrada) não basta. Havia sido revelado a Pedro pelo Espírito Santo que Jesus era o Messias (Mt 16:13- 18), porém, somente quando Pedro foi cheio com o amor de Deus foi que ele realmente entregou a sua vida. Veremos isto no próximo capítulo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você já percebeu que ser extrovertido, forte ou até ungido não o livra automaticamente da raiz da intimidação?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando a pressão se torna forte o suficiente e o manto da unção é levantado, que medos e inseguranças vêm à tona no seu coração?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$É fácil confiar enquanto Deus faz o que você espera — mas como você reage quando Ele não age da maneira que você imaginava?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Desejar Não Basta$t$, 11,
$conteudo$A única maneira de vencer a intimidação é perdendo a sua vida. Boas intenções não bastam. Pedro queria mostrar que podia ser leal mesmo se isso significasse a morte. Mas a força desse desejo não era suficiente para mantê-lo. O medo em seu coração venceu o seu amor pelo Mestre. Jesus tratou deste assunto diretamente depois de Sua ressurreição.

O capítulo 21 de João nos diz que Jesus apareceu aos Seus discípulos e preparou peixe e pão para o café da manhã deles. Então, Ele perguntou a Pedro três vezes: "Tu me amas?" Nas duas primeiras vezes, Jesus usou a palavra agapao, que enfatiza a ação envolvida com o amor. Mas Pedro respondeu todas as vezes com a palavra grega philco. Esta palavra limita-se aos afetos ou sentimentos de amor, independente de ação.

Pedro entristeceu-se quando Jesus interrogou-o pela terceira vez. Nessa terceira vez, Jesus usou a palavra phileo. Jesus reduziu o amor em questão ao nível do afeto, em lugar da ação. Frustrado, Pedro respondeu: "Senhor, Tu sabes todas as coisas, Tu sabes que eu Te amo" (Jo 21:17), querendo dizer: "Tu sabes que tenho afeto por Ti". Jesus começou perguntando essencialmente: "Você me ama o suficiente para renunciar à sua vida?" Isto ilustra o amor descrito pela palavra agapao. Pedro respondeu verdadeiramente e humildemente que o amor dele era um amor emocional ou afetivo. Lembre-se, ele havia acabado de negar Jesus. Ele reconhecia as suas próprias fraquezas. O seu amor afetivo somente não era forte o bastante para que ele renunciasse à sua vida.

Finalmente,Jesus perguntou a Pedro: "Você Me ama afetivamente?" O motivo: Jesus sabia que agora Pedro era um homem quebrantado que ainda não era capaz do amor agapao.

Querendo explicar a Pedro o que Ele queria dizer quando o questionou das duas primeiras vezes, Jesus disse: "Em verdade, em verdade te digo que, quando eras mais moço, tu te cingias a ti mesmo e andavas por onde querias; quando, porém, fores velho, estenderás as mãos, e outro te cingirá e te levará para onde não queres. Disse isto para significar com que gênero de morte Pedro havia de glorificar a Deus. Depois de assim falar, acrescentou-lhe: Segue-Me" (Jo 21:18-19). Creio que Jesus estava dizendo a Pedro: "Você falhou antes na força do amor afetivo, mas está vindo o dia em que você enfrentará o seu maior medo e será vitorioso na força do amor aperfeiçoado". Até aquele ponto, Pedro havia amado dentro do máximo da capacidade humana, mas aquilo havia falhado. Desta vez, enquanto Pedro seguia Jesus, ele seria equipado com o amor agapao. Esse tipo de amor não nasce do desejo do homem por ele, mas é derramado em nossos corações pelo Pai (Rm 5:5). O amor de Deus (ágape ou agapao) não tem medo de morrer pelo outro. Jesus encorajou Pedro, dizendo a ele que quando enfrentasse a "prensa" novamente, ele sairia vitorioso e poderia cumprir o que havia votado anteriormente na sua presunção: Ele morreria antes de negar Jesus. Com as garras do medo e da intimidação soltas, Pedro seria uni homem transformado.

Deus faz isto em nosso benefício. Ele nos fortalecerá quando formos intimidados. Ele permitirá que enfrentemos aquilo que tememos por vezes seguidas, até sermos vitoriosos. Quando chegarmos ao fim da nossa força, clamaremos pela força Dele. Nesta força não podemos falhar, porque o amor nunca falha (1 Co 13:8). Deus não quer que fujamos das nossas áreas de fraqueza. Ele quer que as enfrentemos destemidamente.

Paulo sabia muito bem disso. "E, para que não me ensoberbecesse com a grande/a das revelações, foi-me posto um espinho na carne, mensageiro de Satanás, para me esbofetear, a fim de que não me exalte" (2 Co 12:7).

A palavra para mensageiro em grego se refere a um ser angélico (ver a concordância de Strong). Creio que este versículo se refere a um anjo mau que Satanás enviou para esbofetear Paulo. Esse ser atiçava problemas para Paulo por onde quer que ele fosse. 2 Coríntios 11:24-27 relata alguns dos problemas encontrados por Paulo: Cinco vezes recebi dos judeus uma quarentena de açoites

menos um; fui três vezes fustigado com varas; uma vez,

apedrejado; em naufrágio, três vezes; uma noite e um dia passei na voragem do mar; em jornadas, muitas vezes; em

perigos de rios, em perigos de salteadores, em perigos

entre patrícios na cidade, em perigos no deserto, em

perigos no mar, em perigos entre falsos irmãos; em

trabalhos e fadigas, em vigílias, muitas vezes; em fome e sede; em jejuns, muitas vezes; em frio e nudez.

Em todos os lugares onde pregava, ele sofria intensa perseguição pelo evangelho. Cadeias e tribulações esperavam por ele em cada cidade. Ele foi chicoteado, espancado com varas, apedrejado, sofreu naufrágios, foi roubado e muito mais. Então, ele foi falar com Deus a respeito.

Por causa disto, três vezes pedi ao Senhor que o afastasse de mim.

E compreensível que ele quisesse estar livre dessa resistência e perseguição. Deus respondeu:

A minha graça te basta, porque o Meu poder se aperfeiçoa na fraqueza.

Na essência, o Senhor estava dizendo: "Paulo, não Me peça paia remover estas coisas, mas em vez disso Me peça que a Minha graça e a Minha força o ergam acima das coisas com as quais você não consegue lidar. Paulo, onde não há obstáculos, não há necessidade de poder. A vi to ria só pode acontecer onde há batalha. Quanto maior a batalha, maior a vitória. Um verdadeiro soldado não foge do conflito, mas corre para ele" No calor da batalha não é hora de pedir a Deus para nos tirar da guerra. É hora de orar pela Sua graça para que possamos triunfar nela Deus é glorificado quando enfrentamos algo impossível de vencer na nossa força humana. E neste momento que a Sua força repousa sobre nos para que todos vejam. A graça de Deus vence todo medo e obstáculo que enfrentamos! Anime-se com algumas exortações de Deus: Graças, porém, a Deus, que, em Cristo, sempre nos

Graças a Deus, que nos dá a vitória por intermédio de

nosso Senhor Jesus Cristo.

Quem nos separará do amor de Cristo? Será tribulação, ou angústia, ou perseguição, ou fome, ou nudez, ou perigo, ou espada? Como está escrito: Por amor de Ti somos

entregues à morte o dia todo, fomos considerados como

ovelhas para o matadouro. E111 todas estas coisas, porém, somos mais que vencedores, por meio daquele que nos

Um conquistador enfrenta a oposição e a vence, levantando-se vitorioso em meio às batalhas! Paulo tomou posse disto, e a sua ansiedade foi transformada em esperança. Ele escreveu:

Portanto, eu me gloriarei ainda mais alegremente em

minhas fraquezas, para que o poder de Cristo repouse em

mim. Por isso, por amor de Cristo, regozijo- me nas

perseguições, nas angústias. Pois, quando sou fraco é que sou forte.

- 2 Coríntios 12:9-10, NVI

Observe que ele diz "regozijo-me". Com que freqüência vemos as pessoas se regozijando nos insultos, nas necessidades, nas perseguições e nas angústias? Só uma pessoa que está escondida em Cristo (G1 2:20) pode ter prazer em tais coisas. Ela é alguém que vive para exaltar a Cristo. Paulo sabia que podia confiar na graça de Deus para sustentá-lo até que Cristo fosse engrandecido.

Paulo amava mais a Jesus do que sua própria vida. Ele estava preparado para morrer - e estava mais desejoso de viver - para Ele. Veja atentamente sua carta aos Filipenses:

Segundo a minha ardente expectativa e esperança de que

em nada serei envergonhado; antes, com toda a ousadia,

como sempre, também agora, será Cristo engrandecido no

meu corpo, quer pela vida, quer pela morte.

Não importava para Paulo se ele ia glorificar a Cristo pela vida ou pela morte. Só importava que Cristo fosse glorificado. Paulo não estava se referindo a uma morte nas mãos da enfermidade ou da doença. Jesus levou isso por nós na cruz. A enfermidade e a doença não glorificam a Ele. Acreditar que glorificamos a Jesus morrendo de enfermidade 6 tão erro neo quanto crer que Jesus seria glorificado se morrêssemos no cativeiro do pecado. Ele levou ambos na cruz (Is 53:4-5). O salmo 103:2-3 diz: "Bendize, ó minha alma, ao Senhor, e não te esqueças de nenhum só dos seus benefícios. Ele é quem perdoa todas as tuas iniqüidades; quem sara todas as tuas enfermidades". Como podemos ver, Paulo não está falando de doença ou enfermidade. A nossa atitude deve ser: Senhor; seja como for que sejas glorificado, faz como queres, mas o diabo não fará o que ele deseja!

O amor sem egoísmo de Paulo gerava uma ousadia que nenhuma intimidação podia penetrar (veja novamente Filipenses 1:20). Mesmo sabendo que iria enfrentar perseguição e ameaças em cada cidade, ele seguiu em frente. Ele não temia nenhum homem. Paulo compartilhou com os presbíteros de Éfeso:

E, agora, constrangido em meu espírito, vou para Je-

rusalém, não sabendo o que ali me acontecerá, senão que o Espírito Santo, de cidade em cidade, me assegura que me

esperam cadeias e tribulações.

Uau! Que palavra profética! Imagino quantas pessoas hoje em dia correriam de um lado para o outro por causa de uma palavra como esta! Elas não iriam querer ouvir este tipo de profecia. Todos nós queremos ouvir coisas boas, mas Deus também nos adverte quanto a dificuldades para nos dar esperança e coragem. Paulo fortalecia os novos convertidos dizendo a eles: "Através de muitas tribulações, nos importa entrar no reino de Deus" (At 14:22).

Imagino como reagiríamos se recebêssemos uma palavra profética dizendo que perseguições e oposição esperam por nós em cada lugar para onde fôssemos. Naturalmente, não estou dizendo que todas as vezes que recebemos uma palavra que procede verdadeiramente de Deus ela deve

O problema e que muitas das palavras que são dadas encorajam as coisas erradas nas pessoas que as buscam. Lias são palavras boas e confortáveis sobre como as pessoas prosperarão nos negócios ou no ministério, e como tudo irá bem com elas. Em geral, as pessoas terminam buscando e servindo a Deus apenas pelo que Ele pode fazer por elas. O amor delas ainda não está interessado em engrandecer a Deus, seja pela vida ou pela morte. Observe a resposta de Paulo à palavra profética sobre cadeias e tributações:

Porém em nada considero a vida preciosa para mim

mesmo, contanto que complete a minha carreira e o

ministério que recebi do Senhor Jesus para testemunhar o evangelho da graça de Deus.

A chave para a ousadia de Paulo é que ele não considerava a sua vida preciosa. Ele também entendia que o plano de Deus para a sua vida incluía enfrentar provações e perseguições. O amor dele por Jesus era maior do que o amor dele pela própria vida. A vida de Paulo aponta para o segredo de se completar a carreira. Entregue a sua vida e tome a vida de Cristo. Muitas vezes isto significará que entregamos o que é confortável e tomamos o que é desconfortável — a cruz.

Você Tem Certeza de Que Este Evangelho é Ocidental?

Sei que isto não se parece com o nosso Cristianismo Ocidental moderno. É muito diferente do que vivemos e pregamos nos anos 80 e 90. Serei o primeiro a admitir que deixei muito a desejar. Passei por situações na "prensa de azeite" nos últimos dez anos que revelaram meu coração. Assim como Pedro, sofri ao ver as minhas promessas vazias e o verdadeiro estado do meu coração. Clamei ao Senhor em diversas ocasiões, pedindo a Ele para transformar o meu coração. Aprendi a ser grato pelo fortalecimento que resulta das provações (1 Pe 1:6-7). Cheguei a um entendimento mais claro da seguinte escritura:

Ora, tendo Cristo sofrido na carne, armai-vos também vós do mesmo pensamento; pois aquele que sofreu na carne

deixou o pecado, para que, no tempo que vos resta na

carne, já não vivais de acordo com as paixões dos homens, mas segundo a vontade de Deus.

Amadurecemos em meio ao sofrimento. Não estou falando sobre o conceito religioso de sofrimento - aceitar a enfermidade ou a pobreza como se elas nos fizessem conquistar algum crédito junto a Deus. Nem estou me referindo ao sofrimento decorrente da ignorância e de um comportamento descontrolado ou ímpio. Deus não é glorificado com isto! Os sofrimentos que encontraremos serão aqueles que Cristo experimentou - tentado em todas as coisas, mas sem pecado (Hb 4:15). O sofrimento que Pedro descreve é a resistência que uma pessoa enfrenta quando a sua própria carne ou aqueles que o cercam o pressionam paia seguir por um caminho, enquanto a vontade de Deus o dirige para outro Em momentos assim, a intimidação pode ganhar vantagem se não estivermos arraigados no nosso amor por Jesus. Assim como Pedro, quero seguir Jesus até aquele lugar no qual não vou simplesmente dizer que perderei a minha vida física por Ele, mas onde aceitarei a morte da minha própria vida e desejos. Que somente Ele seja glorificado! Isto é feito pela Sua graça. Ele dá a Sua graça aos humildes (Tg 4:6). Era por isso que Paulo podia dizer diante da perseguição: "Eu me regozijo". Veja o que o apóstolo João disse sobre os que venceram Satanás:

Eles, pois, o venceram por causa do sangue do Cordeiro e por causa da palavra do testemunho que deram, e, mesmo

em face da morte, não amaram a própria vida.

Ouvi este versículo ser citado muitas vezes. Mas somente parte dele. Muitas pessoas param muito antes - elas deixam a última parte de fora. li esta parte que não é popular na nossa cultura Ocidental.Jamais venceremos a batalha sobre a intimidação a não ser que nos recusemos a amar as nossas vidas até à morte. Se amarmos as nossas vidas, procuraremos salvá-las.

Homens e mulheres de Deus, agora vocês conhecem a verdade: A única maneira de vencer a intimidação é perdendo a sua vida. Clamem a Deus enquanto lêem. Não recuem, mas ousem crer. Peçam a Ele para encher o coração de vocês com este amor — o amor dEle, o tipo de amor que nunca volta atrás. Peçam a Ele por Sua graça para vencer os obstáculos que vocês enfrentam. Peçam a Ele para lhes conceder o privilégio de irem aos lugares difíceis. Orem para estar na linha de frente do que Ele está fazendo na terra. Não peçam uma vida de facilidades. Em vez disso, peçam uma vida que glorifique a Deus.

Vamos voltar ao momento em que Jesus estava preparando o café da manhã para Seus discípulos depois de Sua ressurreição. Jesus não entregou uma profecia "abençoadora" a Pedro depois do café da manhã. Mas as palavras de Jesus continham a promessa de que Pedro venceria o seu maior medo, deixando de realizar os seus próprios desejos na sua própria força. Jesus disse que ele seria martirizado - perdendo sua vida por causa de sua lealdade a Jesus. Pedro conquistaria o que ele não seria capaz de enfrentar antes.Jesus viu o novo Pedro, aquele que ele se tornaria. Ele viu a obra completa. Pedro ainda não estava pronto. Depois de ouvir o que aconteceria, ele se voltou e viu o apóstolo João, e perguntou a Jesus:"E quanto a este?" (Jo. 21:21). Pedro ainda estava se comparando aos outros. Basicamente, ele estava dizendo: "Se eu tenho de passar por isso, o que ele tem de fazer?".

Jesus respondeu: "Se Eu quero que ele permaneça até que Eu venha, que te importa? Quanto a ti, segue-Me" (v. 22).

Em outras palavras, "Não importa. Não se compare com os outros. Apenas siga- Me!" Tantas pessoas medem suas vidas e ministérios pelo que os outros fazem e dizem! Você não quer se medir pelo padrão erra do. Há uma grande diferença entre um centímetro e um quilômetro. A maioria das pessoas em nossas igrejas vive suas vidas como lhes agrada, na facilidade e no conforto. Quando nos comparamos uns com os outros parecemos estar muito bem (e muito mornos). E um falso consolo dizer "Sou tão bom quanto todos os outros". O engano desta afirmação <• acreditar que se você está bem, então eu estou bem. No entanto, temos um padrão, uma unidade de medida comum. Não usamos como padrão outros pregadores ou outras igrejas, nem os nossos irmãos e irmãs. ( > nosso padrão é Jesus! Ele não disse a Pedro para seguir João. Ele disse "Segue-Me!".

O caminho que Jesus percorreu foi um caminho de autonegação. Apenas desejar ou querer seguir Jesus não basta. Precisamos fazer isso! Leia a seguinte passagem: Então, convocando a multidão e juntamente os Seus

discípulos, disse-lhes:"Se alguém quer vir após Mim, a si mesmo se negue, tome a sua cruz, e siga-Me. Quem

quiser, pois, salvar a sua vida, perdê-la-á".

Observe que Ele disse que tudo que temos de fazer é desejar salvar a nossa vida, e nós a perderemos! Uau! Desejar as coisas que este mundo busca — mesmo que você nunca as obtenha — custará a sua vida. Entre tanto, leia com atenção o que Jesus diz em seguida:

E quem perder a vida por causa de Mim e do evangelho

Observe que Ele não disse: quem desejar perder a sua vida por causa de Mim. Desejar não basta! Pedro desejava seguir Jesus na noite em que O traiu. Mas sua motivação não estava sustentada pelo amor de Deus ou pelo Seu poder. Por isso, ele foi vencido.

Enquanto você lê, examine os seus motivos.Você é um verdadeiro discípulo de Jesus Cristo, ou deseja segui-lo somente se for dentro dos seus parâmetros? Você fica dentro dos seus próprios limites, longe da fronteira do autossacrificio? E possível que esses limites o afastem dos caminhos onde Jesus anda e finalmente venham a desqualificá- lo? (Ver 2 Coríntios 13:5).

Para decidir se vamos ou não seguir Jesus, precisamos primeiramente saber o preço. Sim, é verdade. Haverá um preço. Isto requer nada menos do que toda a sua vida. Ouça Jesus definindo este preço para as multidões que desejavam segui-lo: Grandes multidões o acompanhavam, e Ele, voltando-se,

lhes disse: Se alguém vem a Mim e não aborrece a seu pai e mãe, e mulher, e filhos, e irmãos, e irmãs e ainda a sua própria vida, não pode ser Meu discípulo. E qualquer que não tomar a sua cruz e vier após Mim não pode ser Meu

discípulo. Pois qual de vós, pretendendo construir uma

torre, não se assenta primeiro para calcular a despesa e verificar se tem os meios para a concluir? Para não

suceder que, tendo lançado os alicerces e não a podendo

acabar, todos os que a virem zombem dele, dizendo: Este

homem começou a construir e não pôde acabar... Assim,

pois, todo aquele que dentre vós não renuncia a tudo

quanto tem não pode ser Meu discípulo.

Este é o preço de resistir até o fim. Acabamos de ler no livro de Apocalipse que aqueles que vencem não amam as suas vidas, até à morte, Infelizmente, esta não seria uma descrição precisa da igreja de hoje.

Eu poderia citar muitos exemplos de homens e mulheres cristãos que ainda são donos de suas vidas. Quando estava pastoreando, uma jovem senhora me procurou reclamando:"Pastor John, tenho uma péssima autoimagem. Por favor, ore para que eu tenha uma autoimagem melhor"

Olhei para ela e disse: "Este é o seu problema!".

Ela ficou desnorteada. Esperava ter uma longa sessão de aconselha mento com uma oração no final. Ela esperava que eu fosse bondoso e meigo para que ela se sentisse melhor consigo mesma. Minha resposta chocou-a. Mas é a verdade que nos liberta - e não falar dos nossos problemas sem tratar das raízes deles. Eu a questionei: "Onde você encontra alguma referência na Bíblia que apóia a autoestima ou uma boa autoimagem? Jesus disse que para segui-lo você precisa morrer! Você já viu uma pessoa morta se sentar em um caixão e dizer: 'Ei! Por que vocês colocaram esta roupa em mim: Não gosto dela! E por que vocês pentearam meu cabelo assim? O que as pessoas vão pensar?'".

Eu queria mostrar a ela que a autoestima e que uma boa autoimagem não se encontram na Bíblia. Sentir-se bem consigo mesmo não e um requisito para amar e seguir Jesus. O foco daquela mulher estava no que é temporário, e não no que é eterno. Não podemos servir a Deus somente quando nos sentimos bem com nós mesmos, quando estamos empolgados ou quando tudo acontece como esperamos. Poderíamos chamar as pessoas que se comportam assim de "amigos só nos bons momentos". Ora, eles são cristãos só nos bons momentos. Eles não são sábios. Finalmente, eles terão de enfrentar algo que não vai se encaixar nos parâmetros deles. Isto pode acontecer a qualquer momento de sua caminhada. Se não estiverem preparados, desistirão. Eles podem ir à igreja, dar o dízimo e ofertas, falar em línguas e dizer as coisas certas, mas no coração abriram mão de buscar a Deus. O amor de Deus não tom limites. Se quisermos andar com Ele, precisamos remover os nossos limites.

Quando olhamos para Pedro no livro de Atos, é difícil acreditar que ele e o mesmo homem que se acovardou e negou Cristo diante dos servos. Depois de ser cheio do Espírito Santo, ele proclamou Jesus com ousadia e destemidamente como Senhor e Messias por toda Jerusalém. Ele foi preso e levado perante os líderes, os sacerdotes que haviam crucificado Jesus. Agora, não era diante dos servos que ele estava, mas diante do mesmo sinédrio que havia condenado Jesus. Ele olhou para eles e com grande ousadia declarou: "Foram vocês que crucificaram Jesus Cristo o Messias, e não há salvação em nenhum outro além Dele" (ver Atos 4:8-12). A ousadia de Pedro e João fez com que os membros do sinédrio ficassem impressionados, e eles não podiam dizer nada contra a obra que Deus havia feito. Aqueles homens eram mestres que estavam no controle, por isso, recorreram à intimidação.

Eles disseram entre si: "Mas, para que não haja maior divulgação entre o povo, ameacemo-los para não mais falarem neste nome a quem quer que seja" (At 4:17). Lembre-se, aqueles líderes haviam acabado de crucificar Jesus. E Jesus já havia dito a Pedro que ele morreria como Jesus. Aquelas não eram ameaças sem fundamento. Mas, mesmo diante da possível morte, Pedro e João declararam com ousadia: "Julgai se é justo diante de Deus ouvir-vos antes a vós outros do que a Deus, pois nós não podemos deixar de falar das coisas que vimos e ouvimos" (At 4:19-20). Exceto por João, Pedro estava sozinho diante dos membros do sinédrio. Não havia ninguém para impressionar ou para apoiá-lo. Mas agora ele tinha um tipo de ousadia diferente. Ela era alimentada pelo seu amor por Jesus. Ele e João foram soltos e se uniram aos discípulos, contando o que havia acontecido e as ameaças que lhes fizeram. Agora, veja o que estes homens pediram que Deus fizesse: Agora, Senhor, olha para as suas ameaças e concede aos

Teus servos que anunciem com toda a intrepidez a Tua

palavra, enquanto estendes a mão para fazer curas, sinais e prodígios por intermédio do nome do Teu Santo servo

Aqueles homens pediram a Deus para viverem mais experiências exatamente como aquelas que lhes haviam causado problemas. Eles sabiam que pregar o evangelho colocaria a vida deles em risco. Mas eles continuaram a pregar, e Deus foi fiel para realizar grandes milagres. Eles não permitiram que o dom de Deus ficasse adormecido por causa da intimidação. Na verdade, o poder de Deus era tão forte que os enfermos eram levados para as ruas de Jerusalém e eram curados quando a sombra de Pedro caía sobre eles (At. 5:15).

O sumo sacerdote e os membros do sinédrio cumpriram suas ameaças. Eles fizeram com que os discípulos fossem presos. O sumo sacerdote disse: "Expressamente vos ordenamos que não ensinásseis nesse nome, contudo, enchestes Jerusalém de vossa doutrina" (At. 5:28).

Outra vez, Pedro respondeu com ousadia:

Antes, importa obedecer a Deus do que aos homens O

Deus de nossos pais ressuscitou a Jesus, a quem vós

matastes, pendurando-O num madeiro. Deus, porém, com

a Sua destra, O exaltou a Príncipe e Salvador, a fim de

conceder a Israel o arrependimento e a remissão de

pecados. Ora, nós somos testemunhas destes fatos, e bem

assim o Espírito Santo, que Deus outorgou aos que lhe

Que coragem e ousadia! Os discípulos não seriam intimidados. Pedro já não procurava mais preservar a sua vida. Ele estava livre do egoísmo e cheio do Espírito Santo do Deus, O amor de Deus ora abundante em seu coração. Assim como Romanos 5:5 diz:"O amor de Deus é derramado em nosso coração pelo Espírito Santo, que nos foi outorgado".

Está claro que o Espírito Santo traz o amor de Deus para as nossas vidas. Mas também está claro com base em Pedro que o Espírito Santo é dado àqueles que obedecem. Muitos cristãos querem o amor sem a obediência. Falar em línguas não garante que o amor de Deus permanece em seu coração. Ser cheio do Espírito Santo não é uma experiência única, de uma só vez. Não importa o quanto você conhece as Escrituras, e o quanto você ora em línguas; se você não está vivendo uma vida obediente diante de Deus, o seu amor se esfriará. Com cada desobediência, esse amor pode diminuir!

Jesus disse que um sinal dos últimos dias seria que o amor de Deus se esfriaria no coração dos cristãos por causa da iniqüidade ou da desobediência (Mt 24:12). O amor a que Jesus se refere é o ágape. Somente aqueles que receberam Jesus possuem esse amor. É possível ser cheio, mas não ter o genuíno amor do Espírito! A obediência de Pedro e João lhes trouxe uma grande ousadia e encheu o coração deles de amor.

Chamando os apóstolos, açoitaram-nos e, ordenando-lhes

que não falassem em o nome de Jesus, os soltaram. E eles se retiraram do Sinédrio regozijando-se por terem sido

considerados dignos de sofrer afrontas por esse Nome.

Pedro e João não foram intimidados pelos líderes; na verdade, eles estavam cheios de alegria. Aqueles eram dois discípulos muito diferentes daqueles que ficaram dormindo no jardim. Eles se alegraram por serem julgados dignos e por terem tido outra chance de demonstrar o seu amor e fidelidade. Pedro agora não amava afetuosamente apenas, mas também com todo o seu ser.

O Livro dos Mártires, de John Foxe, relata que Pedro foi martirizado, como Jesus dissera que seria. Quando estava para ser crucificado, conta se que Pedro disse: "Não sou digno de morrer da mesma maneira que o meu Senhor morreu". Então, eles o penduraram na cruz de cabeça paia baixo! Pedro deixou este mundo como um vencedor. Aleluia!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Como Pedro, você já desejou sinceramente ser leal a Jesus e descobriu que a força do seu desejo não bastava para sustentá-lo na hora do medo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em que momentos o medo no seu coração venceu o seu amor pelo Mestre, levando-o a recuar diante da prova?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você está disposto a perder a sua vida — em entrega e ação, e não só em afeto — como o único caminho para vencer de fato a intimidação?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Temor de Deus x Temor do Homem$t$, 12,
$conteudo$Você serve àquele a quem teme.

Tudo o que já lemos e estudamos nos conduz a este elemento extremamente crucial ao lidarmos com a intimidação. Ele não apenas é importante ao enfrentarmos a intimidação, como também em todas as áreas da vida! Estou falando do temor do Senhor.

A igreja não entende que este é um elemento significativo para uma vida cristã triunfante. Isaías profetizou com relação a Jesus: "Deleitar-se-á no temor do Senhor" (Is 11:3). O prazer Dele deve ser o nosso!

O homem que teme a Deus será guiado nos caminhos de Deus (Sl. 25:12). Esse homem "repousará na prosperidade, e a sua descendência herdará a terra" (v. 13). Aprendemos que o temor do Senhor é o princípio da sabedoria e o princípio do Seu conhecimento (Pv. 9:10; 1:7; 2:5). Ele prolongará os nossos dias (Pv. 10:27). Somos advertidos de que ninguém verá o Senhor sem santidade, que é aperfeiçoada pelo temor do Senhor (Hb. 12:14; 2 Co 7:1). E isto é apenas uma amostra do que a Bíblia fala sobre o temor do Senhor.

A única maneira de andarmos totalmente livres da intimidação é andando no temor do Senhor. A Bíblia diz: "No temor do Senhor tem o homem forte confiança" (Pv. 14:26, AMP). Uma forte confiança gera a ousadia de que precisamos para seguir o caminho de Deus e não o caminho do homem.Vamos examinar as diferenças entre o temor de Deus e o temor do homem.

Definindo o Temor de Deus e o Temor do Homem

Em primeiro lugar, o que é o temor de Deus? Ele inclui o respeito por Deus, mas é mais do que isso.Temer a Deus significar dar a Ele o lugar de glória, honra, reverência, ações de graças, louvor e preeminência que Ele merece (observe que é o que Ele merece, e não o que nós achamos que Ele merece). Ele detém esta posição em nossas vidas quando O estimamos e estimamos os desejos Dele acima dos nossos próprios desejos. Odiaremos o que Ele odeia e amaremos o que Ele ama, tremendo diante da Sua presença e da Sua Palavra.

Em segundo lugar, vamos examinar o temor do homem. Temer o homem é ficar alarmado, ansioso, impressionado, aterrorizado e desconfiado, acovardando-se diante do homem mortal. Quando somos capturados por este medo, vivemos fugindo e nos escondendo da reprovação, evitando constantemente a rejeição e o confronto. Ficamos tão ocupados nos protegendo e servindo aos homens que somos ineficazes em nosso serviço a Deus. Com medo do que o homem possa nos fazer, não damos a Deus o que Ele merece.

A Bíblia nos diz: "O temor do homem arma ciladas" (Pv. 29:25, AMP). Uma cilada é uma armadilha.Temer o homem rouba a autoridade que lhe foi dada por Deus. O dom de Deus então fica adormecido em você. Você se sente impotente para fazer o que é certo porque o poder de Deus em você está inativo. Isaías 51:7-13 alerta: "Ouvi-Me, vós que conheceis a justiça, vós, povo em cujo coração está a Minha lei; não temais o opróbrio dos homens, nem vos turbeis por causa das suas injúrias... Quem, pois, és tu, para que temas o homem, que é mortal, ou o filho do homem, que não passa de erva? Quem és tu que te esqueces do Senhor, que te criou?".

Quando agradamos aos homens para nos livrarmos da reprovação deles, esquecemo-nos do Senhor. Nós nos afastamos do serviço Dele."Se agradasse ainda a homens, não seria servo de Cristo" (Gl. 1:10).

Você servirá e obedecerá a quem teme! Se você teme o homem, você o servirá. Se você teme a Deus, você O servirá. Você não pode temer a Deus se teme o homem, porque você não pode servir a dois senhores (Mt. 6:24)! Por outro lado, você não pode temer o homem se teme a Deus!

Os Crentes do Novo Testamento Devem Temer a Deus?

() temor do Senhor não é uma doutrina morta, do Antigo Testamento. Ele é um modo de vida. Se você ama a Deus, temerá somente a Ele. O seu temor a Deus absorverá todos os temores menores.

Entristeço-me quando ouço as pessoas falarem de Deus como se Ele fosse o "garoto de recados" delas. Uma pessoa que fala de Deus desta maneira não conhece o Senhor realmente. Até os discípulos mais chegados de Jesus O chamavam de Senhor e Mestre (Jo 20:28). Quando tratamos o Senhor como alguém familiar, perdemos a perspectiva do lugar que Ele ocupa.

Este tipo de atitude fará com que nos portemos de forma irreverente. Vemos a evidência disto tanto na igreja quanto na vida particular dos "crentes". Eles se chamam crentes, mas será que o estilo de vida deles demonstra isso? Muitas vezes me entristeço quando vejo o modo como as pessoas agem na igreja. Antes do culto, elas correm na frente uns dos outros para pegar um lugar ou ficam irritadas se alguém está sentado no lugar delas. Elas falam e continuam falando durante o culto. Depois, elas se levantam e saem quando acham que o culto está demorando muito ou se não gostam do que estão ouvindo.

E alarmante ver a falta de respeito aparente que têm por seus pastores. Elas falam dos servos de Deus como o noticiário fala dos políticos. Talvez muitos ministros tenham agido mais como políticos do que como servos de Deus, mas eles ainda são servos de Deus, e cabe a Ele julgar. Quando tememos a Deus, respeitamos as coisas da casa de Deus e os sei vos que Ele levanta. Davi não ergueu sua mão contra o ungido de Deus, Saul, mesmo depois que Saul matou oitenta e cinco sacerdotes do Senhor (1Sm. 22:11-23). Davi temia a Deus!

Entristeço-me com as coisas que muitos crentes assistem, ouvem e lêem. Em algumas casas me perguntei se havia alguma diferença entre o modo como eles viviam e o modo como o mundo vive. Na sua busca por serem equilibrados, normais e aceitos, eles se esqueceram de que Deus não chama de "normal" o que o mundo chama de "normal". Quando ama a Deus realmente e teme somente a Ele, você vive uma vida de consagração e não de mundanismo. Pedro exortou:

Pelo contrário, segundo é santo aquele que vos chamou,

tornai-vos santos também vós mesmos em todo o vosso

procedimento, porque escrito está "Sede santos, porque Eu Sou Santo". Ora, se invocais como Pai aquele que, sem

acepção de pessoas, julga segundo as obras de cada um,

portai-vos com temor durante o tempo da vossa

O temor de Deus é uma grande motivação para nos manter longe da impiedade. A Igreja Tem Medo?

Em Atos 2 os discípulos foram cheios com o Espírito Santo e falaram em línguas e profetizaram. Eles foram tão cheios que agiram como homens embriagados. O riso e a alegria transbordavam nesses novos crentes. Deus os estava fortalecendo e renovando. Deus tem prazer em fazer isso. Ele não é um Deus vingativo que tem prazer na tristeza, mas Ele tem prazer no amor, na misericórdia, na justiça, na paz e na alegria. Os discípulos viram muitas pessoas salvas nos dias que se seguiram, mas alguns desses novos convertidos haviam ido buscar o Senhor por causa das bênçãos e não por quem Ele é. Isto fez com que eles não dessem a Deus a reverencia que Ele merece. Eles foram gradualmente ficando "acostumados" com o Senhor. Esta familiaridade fez com que eles tratassem as coisas de Deus como coisas comuns. Eles não tremiam diante da Sua presença ou da Sua Palavra. Vemos a evidência disto em Atos capítulo 5. Um homem e sua mulher levaram uma oferta de um pedaço de terra que haviam vendido. Aquele não era todo o valor que haviam recebido pela venda, mas eles queriam que parecesse assim para que ficassem bem aos olhos dos outros crentes. Eles honravam a aparência acima da verdade e temiam o homem mais do que a Deus. Eles levaram a oferta, mentiram (a maioria das pessoas consideraria esta uma menti- rinha leve) — e caíram mortos.

Eles morreram porque mentiram na presença da glória de Deus. Eu costumava pensar, como com certeza você também pensa: Há pessoas que fizeram o mesmo na presença de pastores hoje em dia e não caíram mortas. Por quê? Creio que é porque a presença de Deus era mais poderosa no tempo do livro de Atos do que hoje. Por exemplo, o livro de Atos relata que após esse incidente Pedro andava pelas ruas de Jerusalém e os enfermos eram curados quando a sua sombra os tocava (At. 5:15). Não vemos este tipo de milagres hoje em dia. Creio que à medida que a presença e a glória de Deus aumentarem, haverá relatos semelhantes ao de Atos capítulo 5. Observe o que aconteceu depois que eles caíram mortos.

E sobreveio grande temor a toda a igreja e a todos quantos ouviram a notícia destes acontecimentos.

O tremendo temor e reverência pelo Senhor foram restaurados. Eles perceberam que precisavam repensar o seu modo de tratar a presença e a unção de Deus. Lembre- se, Deus disse:

Mostrarei a Minha santidade naqueles que se cheguem a

Mim e serei glorificado diante de todo o povo.

Quando Deus Fica em Silêncio,

Nossos Corações São Revelados

Deus reteve a Sua glória para nos testar e nos preparar. Seremos reverentes mesmo quando a Sua presença não for manifesta? Em muitas maneiras, a igreja moderna tem se portado como os filhos de Israel. Na verdade, Paulo disse que as experiências deles foram escritas como exemplos para nós (1Co 10:6).

Os israelitas ficavam entusiasmados quando Deus os abençoava e realizava milagres para eles. Quando Deus dividiu o Mar Vermelho, os levou a atravessar por terra seca e depois enterrou os inimigos deles no mar, eles cantaram, dançaram e gritaram celebrando a vitória (Ex 15:1 - 21). No entanto, alguns dias depois, quando o grandioso poder de Deus não estava aparente e a comida e a bebida eram escassos, eles reclamaram contra Deus (Ex 15:22).

Mais tarde, Moisés levou o povo ao Monte Sinai para consagrá-los a Deus. O Senhor desceu à montanha aos olhos de todo o Seu povo. Foi uma experiência tremenda, com relâmpagos e trovões e uma grossa nuvem sobre a montanha. Então, Moisés levou o povo para fora do acampamento para se encontrar com Deus, mas "o povo, observando, se estremeceu e ficou de longe" (Ex 20:10-18). Eles recuaram aterrorizados - não no temor de Deus, mas temendo por suas próprias vidas. Quando Deus desceu, eles perceberam que amavam suas vidas mais do que amavam a Ele. Eles disseram a Moisés:"Fala-nos tu, e te ouviremos; porém não fale Deus conosco, para que não morramos". Respondeu Moisés ao povo: "Não temais; Deus veio para vos provar e para que o Seu temor esteja diante de vós, a fim de que não pequeis" (Ex 20:19-20).

Observe que o temor de Deus lhe dá poder sobre o pecado. Provérbios 16:6 diz: "Pelo temor do Senhor os homens evitam o mal".

O relato prossegue em Êxodo 20:21: "O povo estava de longe, em pé; Moisés, porém, se chegou à nuvem escura onde Deus estava". Moisés disse a Deus o que eles haviam dito e como tinham medo. Deus respondeu: "Em tudo falaram eles bem. Quem Me dera que eles tivessem tal coração, que Me temessem e guardassem em todo o tempo todos os Meus mandamentos, para que bem lhes fosse a eles e a seus filhos, para sempre!" (Dt 5:28-29).

Observe que o povo recuou enquanto Moisés se aproximou. Isto revela a diferença entre Moisés e Israel. Moisés temia a Deus; por isso, ele não teve medo. O povo não temia a Deus; por isso, eles tiveram medo. O temor de Deus aproxima você da presença de Deus, e não afasta você dEle. Entretanto, o temor do homem faz com que você se afaste de Deus e da Sua glória.

Quando somos paralisados pelo medo do homem nos sentimos mais confortáveis na presença do homem do que na presença de Deus, até mesmo na igreja! O motivo disso é que a presença de Deus abre o nosso coração e nos traz convicção de pecado. Não Sinai, mas Sião

Para provar que o temor de Deus é uma realidade do Novo Testamento, vamos ler este relato do livro de Hebreus:

Ora, não tendes chegado à montanha que pode ser tocada e que ardia com fogo, e à escuridão, e às trevas e à

tempestade, e ao clangor da trombeta e ao som de palavras tais que quantos o ouviram suplicaram que não se lhes

falasse mais. Mas tendes chegado ao Monte Sião.

Primeiro, somos lembrados do que aconteceu no Sinai. Então nos é dito sobre a montanha à qual chegamos, chamada Sião. Deus falou na terra daquela montanha no Sinai. Agora, o mesmo Deus fala do céu desta nova montanha, Sião. Tende cuidado, não recuseis ao que fala. Pois, se não

escaparam aqueles que recusaram ouvir quem, divina

mente, os advertia sobre a terra, muito menos nós, os que nos desviamos daquele que dos céus nos adverte.

Observe as palavras "muito menos"! O nosso julgamento é muito mais severo quando não ouvimos e obedecemos à voz de Deus. A graça que recebemos sob o Novo Testamento não é para que a usemos para viver como bem entendemos. Por que os israelitas não deram ouvidos à Sua voz? Eles não temiam a Deus.Tenha isto em mente enquanto continua a ler, e você verá claramente que o motivo pelo qual as pessoas não ouvem sob a nova aliança é o mesmo:

Por isso, recebendo nós um reino inabalável, retenhamos a graça, pela qual sirvamos a Deus de modo agradável, com

reverência e santo temor. Porque o nosso Deus é fogo

Observe que a Palavra diz "reverência e santo temor". Se o temor de Deus estivesse limitado apenas à reverência, o escritor não teria separado o conceito de santo temor do conceito de reverência. Observe também que o escritor não concluiu com: "Porque o nosso Deus é um Deus de amor", mas em vez disso, concluiu dizendo: "O nosso Deus é fogo consumidor". Esta afirmação sobre Deus corresponde ao motivo pelo qual os filhos de Israel se afastaram da Sua presença. "Pois este grande fogo nos consumiria; se ainda mais ouvíssemos a voz do Senhor, nosso Deus, morreríamos" (Dt 5:25). Deus não mudou! Ele ainda é santo, Ele ainda é fogo consumidor! Sim, Ele é amor, mas Ele também é fogo consumidor. Em nossas igrejas, enfatizamos o amor de Deus e ouvimos muito pouco sobre o temor de Deus. Pelo fato de não termos pregado todo o conselho de Deus, a nossa visão do amor está deturpada. O amor que temos pregado é um amor fraco. Ele não tem o poder para nos conduzir a uma vida consagrada. Ele amorteceu o nosso fogo e nos deixou mornos. Nós nos tornamos como crianças mimadas que não reverenciam o seu pai! Se não crescermos no temor do Senhor, corremos o risco de nos tornarmos familiarizados com Deus e tratar como comuns as coisas que Ele considera santas. Observe também este versículo:"Retenhamos a graça, pela qual sirvamos a Deus de modo agradável, com reverência e santo temor" (Hb. 12:28). A graça não é dada meramente para cobrir a nossa irreverência e o nosso pecado; ela é dada para nos dar poder para servirmos a Deus de modo aceitável. E a maneira aceitável de servirmos a Ele é por amor, com reverência e santo temor.

Neste sentido, Paulo também escreveu: "Desenvolvei a vossa salvação com temor e tremor" (Fp. 2:12). Onde está o nosso temor e tremor? Será que nos esquecemos de que Deus é o justo Juiz? Será que nos esquecemos do Seu julgamento? Leia a exortação abaixo com atenção.

Não te ensoberbeças, mas teme. Porque se Deus não

poupou os ramos naturais, também não te poupará.

Considerai, pois, a bondade e a severidade de Deus: para com os que caíram, a severidade; mas para contigo, a

bondade de Deus, se nela permaneceres; doutra sorte,

Nós nos tornamos especialistas na bondade de Deus; no entanto, não é somente a bondade Dele que devemos levar em consideração. Precisamos entender a severidade de Deus também. A bondade de Deus nos atrai ao Seu coração, e a Sua severidade nos mantém livres do orgulho e de toda forma de pecado. Uma pessoa que só considera a bondade deixa de lado o temor que a impedirá de ceder ao orgulho e ao mundanismo. Do mesmo modo, a pessoa que só considera a severidade de Deus é facilmente envolvida pelo legalismo. São ambos, tanto a fidelidade quanto o temor de Deus, que nos mantêm no caminho estreito para a vida.

Espero que você entenda que estou enfatizando o temor de Deus propositalmente, este temor que tem sido tão negligenciado em nossa igreja moderna. Amo a Deus de todo o coração e alegro-me muito por ser Seu filho e pelo privilégio de servir a Ele. Sei que é a bondade de Deus que nos conduz ao arrependimento (Rm 2:4). Mas também sei que é o temor de Deus e o Seu julgamento que nos impedem de pecar deliberadamente.

Porque, se vivermos deliberadamente em pecado, depois

de termos recebido o pleno conhecimento da verdade, já

não resta sacrifício pelos pecados; pelo contrário, certa expectação horrível de juízo e fogo vingador prestes a

consumir os adversários. Sem misericórdia morre pelo

depoimento de duas ou três testemunhas quem tiver

rejeitado a lei de Moisés. De quanto mais severo castigo julgais vós será considerado digno aquele que calcou aos pés o Filho de Deus, e profanou o sangue da aliança, com o qual foi santificado, e ultrajou o Espírito da graça? Ora, nós conhecemos Aquele que disse: "A Mim pertence a

vingança; Eu retribuirei". E outra vez: "O Senhor julgará o Seu povo". Horrível coisa é cair nas mãos do Deus vivo.

Uma pessoa é seduzida a pecar quando ela considera comum ou familiar o que Deus considera santo. Freqüentemente nós não damos valor às coisas que Deus leva a sério, e tratamos com seriedade as coisas às quais Deus não dá valor. Levamos muito a sério o fato de parecermos respeitáveis aos olhos dos outros, mas isto não é tão importante para Deus quanto as motivações do nosso coração. Conheci homens que estavam enredados no pecado, e que ao mesmo tempo diziam "Eu amo Jesus". Eles mediam o seu estado espiritual pelo que sentiam por Jesus. Mas será que eles O amavam o suficiente para morrerem para o pecado que os prendia? Não, eles não tinham temor de Deus!

Quando visitei na prisão um pastor que havia caído em imoralidade sexual e corrupção financeira, ele me disse: "John, eu sempre amei Jesus, mesmo quando estava enganado. Ele era meu Salvador, mas não meu Senhor". Ele havia tomado decisões motivadas pelo temor do homem. Ele queria agradar às pessoas. Ele desejava os elogios que vêm dos homens. Essas coisas o levaram à corrupção. Naquela prisão, Deus mostrou a Ele o Seu amor e misericórdia, e ensinou-lhe o temor do Senhor. Ele agora teme ao Senhor e foi restaurado.

Recusando o Convite de Deus

Voltando à ilustração do Monte Sinai, quero apontar algo que a maioria das pessoas deixa passar. Deus instruiu tanto Moisés quanto Arão a subirem a montanha (Ex 19:24). Moisés subiu, mas por alguma razão encontramos Arão de volta ao acampamento (Ex 32:1)! Creio que Arão voltou ao acampamento porque ele se sentia mais confortável na presença dos outros "crentes" do que na presença de Deus. Não somos assim em nossas igrejas de hoje? Nós nos sentimos mais confortáveis indo à igreja, tendo comunhão com outros cristãos e nos mantendo ocupados com obrigações ministeriais do que com o Senhor. Evitamos ficar a sós na Sua presença, cercando-nos de pessoas e de atividades, esperando que isto esconda o nosso vazio. Josué, por outro lado, tinha um coração que buscava a Deus. Mie queria estar tão próximo da presença de Deus quanto possível. Ele ficou no sopé da montanha por quarenta dias enquanto Moisés estava com Deus (Ex 32:17). Ele se aproximou tanto quanto possível sem ir até onde Moisés e Arão haviam sido convidados para subirem. Josué temia a Deus o suficiente para não ser presunçoso. Enquanto Josué esperava na montanha, o povo no acampamento ficou inquieto. Eles estavam em uma terra estranha; o líder deles havia partido havia mais de um mês; e Deus ainda não havia Se revelado. Eles começaram a questionar a Deus e Moisés.

Mas vendo o povo que Moisés tardava em descer tio

monte, acercou-se de Arão e lhe disse: "Levanta-te, faze- nos deuses que vão adiante de nós; porquanto este Moisés, o homem que nos tirou do Egito, não sabemos o que lhe

Aparentemente, eles respeitavam e temiam a Deus. "Oh, Moisés", eles haviam suplicado, "Deus é grande demais para nós.Vá você falar com Ele e nos diga o que Ele disse. Ouviremos e obedeceremos". Eles haviam acabado de ver como Deus era poderoso e terrível, mas não temeram a Deus quando fizeram ídolos para si. Agora que Deus estava em silêncio, a verdadeira natureza deles foi revelada. Podemos facilmente temer a Deus enquanto Ele está fazendo milagres e demonstrando o Seu poder. Mas Deus está procurando aqueles que também O reverenciarão e temerão quando não sentirem a Sua presença ou o Seu poder, como filhos que obedecem mesmo quando seu pai não está olhando. Os que são verdadeiramente obedientes o são quando ninguém está por perto para monitorá-los! Deus disse a Israel: "Não é, acaso, porque retive de ti a Minha paz, que não Me temes?" (Is 57:11). Na essência, Ele perguntou: "Por que o Meu povo não Me teme?" Então Ele respondeu à Sua própria pergunta observando que o povo não O temia porque Ele não havia Se manifestado por algum tempo na forma de um poder aterrador. Em outras palavras, quando o povo não o via manifestar-se de uma forma tremenda, eles agiam como se Ele não estivesse ali. O silêncio de Deus expôs as verdadeiras motivações do coração do povo.

É em meio ao deserto, enquanto enfrentamos provações, e não em um culto poderoso e ungido, que o verdadeiro crente se revela. O que uma pessoa é na "prensa", é o que ela realmente é. Veja o que Arão fez quando estava sob pressão: Disse-lhes Arão: "Tirai as argolas de ouro das orelhas de vossas mulheres, vossos filhos e vossas filhas e trazei- mas". Então todo o povo tirou das orelhas as argolas e as trouxe a Arão. Este, recebendo-as das suas mãos,

trabalhou o ouro com buril e fez dele um bezerro fundido. Então, disseram: "São estes, ó Israel, os teus deuses que te tiraram da terra do Egito!".

Eles fizeram um ídolo com a bênção de Deus, com aquilo que haviam trazido como despojo do Egito. Mas ainda mais alarmante é que Arão, aquele que não quis subir a montanha, fez o ídolo. Ele havia sido o porta-voz de Moisés. Ele havia ficado ao lado dele e visto cada grande milagre e praga. Mas agora ele temia o povo e dava a eles o que eles que riam. Ele temia o homem mais do que a Deus, e assim ele foi facilmente intimidado pelo povo. Não havia ousadia nele, o dom de Deus estava adormecido. Isto fez dele um líder fraco. Quando foi confrontado por Moisés, ele culpou o povo que o havia intimidado.

Respondeu-lhe Arão: Não se acenda a ira do meu senhor;

tu sabes que o povo é propenso para o mal. Pois me

disseram: Faze-nos deuses que vão adiante de nós; pois,

quanto a este Moisés, o homem que nos tirou da terra do

Egito, não sabemos o que lhe terá acontecido. Então eu

lhes disse: quem tem ouro, tire-o. Deram-mo, e eu o lancei no fogo, e saiu este bezerro.

Arão não assumiu a responsabilidade pelo que havia feito. Sim, a avaliação que ele fez do povo estava correta. Havia sido idéia deles, e não de Arão. Mas por ele temer o povo, não foi forte o bastante para quebrar a intimidação da multidão e orientá-los corretamente. Ele estava envolvido pelo temor do homem.

Os líderes que temem os homens recuarão e darão ao povo o que eles querem em vez de dar o que eles precisam! Eles se tornam presa fácil da intimidação. Não importa o quanto o líder diz que ama a Deus e ao Seu povo, enquanto temer o homem, ele jamais verá o verdadeiro progresso em si mesmo ou no povo que lidera! O homem que teme a Deus só se preocupa com o que Deus diz sobre ele. O homem que teme os homens está mais preocupado com o que os homens pensam a respeito dele do que com o que Deus pensa. Ele ofende a Deus para não ofender o homem.

Já vi líderes tomarem decisões para dar às pessoas aquilo que elas queriam. As motivações deles eram manter a sua popularidade junto ao povo. Naturalmente, eles jamais admitiriam isto e talvez nem mesmo tivessem consciência disto. Eles justificavam suas decisões com o seguinte pensamento: "Não queremos ofender as pessoas", ou "Isto é o melhor para todos os envolvidos", ou "Mais pessoas poderão ser ministradas se fizermos isso", e daí por diante. O reino de Deus não é uma democracia, li um reino. A popularidade não é importante. Eles não perceberam que eram motivados pelo medo e pela intimidação. A atitude deles não estava enraizada no amor pelo povo, mas no amor por si mesmos.

0 Que Acontece Quando Não Tememos a Deus?

Deus disse a Moisés: "Quem dera que eles tivessem tal coração, que Me temessem" (Dt. 5:29). Mas o povo não o fez, e veja o que aconteceu. Depois de um ano vivendo no deserto, era hora de partir e tomar posse da terra prometida. O Senhor disse a Moisés: "Envia homens que espiem a terra de Canaã, que Eu hei de dar aos filhos de Israel" (Nm. 13:1). Observe que Ele disse: "Eu hei de dar..." Ele não disse: "Vão espiar a terra e vejam se podem tomá-la". Então Moisés enviou os homens. Eles espiaram por quarenta dias, e descobriram que os habitantes estavam bem estabelecidos nessa terra, e que as cidades eram muito grandes e bem guardadas.

Todos os doze espias viram o mesmo povo, os mesmos exércitos, as mesmas cidades grandes fortificadas e os mesmos gigantes.Josué e Calebe estavam prontos para ir de uma vez e tomar o que Deus havia prometido. Entretanto, os outros dez espias ficaram intimidados com o que viram. Eles só viram grandes exércitos e gigantes, enquanto Josué e Calebe viram o quanto Deus era bom e fiel! Os dez espias disseram ao povo que seria impossível tomar a terra. Eles haviam sido escravos por mais de quatrocentos anos e não eram experimentados na guerra como os exércitos que viram. O povo imediatamente teve medo e começou a reclamar. E por que nos traz o Senhor a esta terra, para cairmos à espada e para que nossas mulheres e nossas crianças sejam por presa? Não nos seria melhor voltarmos para o Egito?

Neste versículo, descobrimos a raiz do temor do homem: Não nos seria melhor? Aquelas pessoas estavam intimidadas porque só pensavam em si mesmas. Elas não disseram: "O que Deus diz é melhor". Em vez disso, perguntaram: "O que é melhor para nós?".

A questão não poderia estar mais clara! A raiz do temor do homem é o amor por si mesmo. Quando ama a sua vida, você procura salvá-la Você ficará intimidado com qualquer coisa que a ameace.

Deus levou aquele povo ao lugar onde eles não tinham outra escolha senão confiar Nele. Parecia que todos eles seriam destruídos pelos habitantes desta nova terra. Mas em vez de confiar em Deus, eles agiram como se Deus os tivesse salvado dos egípcios apenas para fazer com que os cananeus os matassem. É claro que isto parece ridículo, mas todos nós enfrentamos momentos em que é necessário seguir o Senhor em situações que parecem perigosas ou prejudiciais à nossa vida. Só podemos segui-lo nestas circunstâncias quando determinamos em nosso coração que Deus é bom. Só há bem Nele. Ele nunca fará nada conosco apenas em benefício próprio para nosso prejuízo eterno! Precisamos nos lembrar de que Deus julga tudo com base na eternidade, ao passo que o homem julga com base em setenta ou oitenta anos!

A Rejeição de Deus ou a Rejeição do Homem?

Calebe e Josué escolheram o caminho mais difícil. Deus disse que eles tinham um espírito diferente e que O haviam seguido inteiramente. Todo o restante não queria ver o seu bem-estar em perigo por obedecei a Deus. Deus foi fiel com Calebe e Josué. Eles foram os únicos daquela geração a entrar na Terra Prometida (Ver Números 14:24, 30).

Aqueles que procuraram salvar suas vidas as perderam. Deus pronunciou o destino deles dizendo: "Porém, quanto a vós outros, o vosso cadáver cairá neste deserto... e tereis experiência do Meu desagrado" (Nm. 14:32, 34). E um pensamento assustador saber que muitos serão rejeitados por Deus porque temeram ser rejeitados pelo homem.

Oro para que todos nós aprendamos a ter prazer no temor do Senhor. Pois "O temor do Senhor é fonte de vida, para evitar os laços da morte" (Pv. 14:27). No próximo capítulo, você verá como o temor do Senhor o ajudará a andar dentro da vontade de Deus durante os tempos de intimidação.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se você serve àquele a quem teme, a quem as suas escolhas têm revelado que você realmente teme: a Deus ou ao homem?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em que ocasiões você ofendeu Aquele que não pode ver, para não ofender ou desagradar aquele que pode ver?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como cultivar o temor do Senhor — princípio da sabedoria e fonte de forte confiança — pode libertá-lo totalmente da intimidação?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Ação ou Reação?$t$, 13,
$conteudo$O temor do Senhor gera confiança e ousadia.

A intimidação pode acontecer através de circunstâncias, de pensamentos ou de pessoas. A maioria das pessoas luta contra a intimidação que vem através de outras pessoas. O temor do homem é uma descrição precisa deste tipo de pressão. O temor do homem faz com que evitemos a rejeição, o mal e a reprovação do homem sem levar em consideração a rejeição de Deus. A pessoa que teme o homem ofenderá Aquele que não pode ver, para não ofender aquele que pode ver. Jesus nos exortou: "Digo-vos, pois, amigos Meus: não temais os que matam o corpo, e, depois disso, nada mais podem fazer. Eu, porém, vos mostrarei a quem deveis temer: temei Aquele que, depois de matar, tem poder para lançar no inferno. Sim, digo-vos, a esse deveis temer!" (Lc. 12:4-5).

Se teme o homem, quando Deus o levar a dificuldades ou sofrimentos, você tentará se proteger e se preservar. Em vez de buscar a vontade de Deus, procurará exercer a sua própria vontade. Entretanto, se teme o Senhor, você pode passar por qualquer dificuldade de uma maneira que honra a Deus.Você reconhece que somente Ele pode guardá-lo, e confiará que Ele sabe o que é melhor no Seu projeto eterno para todas as coisas.

Há uma promessa poderosa em Provérbios sobre o temor d o Senhor: No temor do Senhor, tem o homem forte amparo, e isso

é refúgio para os seus filhos. O temor do Senhor é fonte de vida para evitar os laços da morte.

Por outro lado, a Bíblia diz claramente:

O receio do homem armará laços.

A intimidação é um laço ou armadilha, mas o temor do Senhor gera confiança e ousadia, exatamente as ferramentas necessárias para nos libertar desta armadilha da intimidação.

A Pressão Tem um Poder Revelador

Farei uma comparação entre dois reis. Ambos governavam o mesmo reino; ambos se prostravam perante o mesmo Deus. Um foi rejeitado por Deus, e o outro foi considerado por Deus como um homem segundo o Seu coração. Comparando estas vidas, descobrimos uma grande clareza e entendimento das diferenças entre o temor de Deus e o temor do homem.Vamos dar uma olhada em um dos incidentes mais dramáticos e menos estudados da vida de Saul. Eis a cena: Saul havia reinado por dois anos. Como acontece na maioria das lideranças, este "período de lua de mel" não revelou o seu verdadeiro caráter. Mas, com o passar do tempo, as motivações dele vieram à tona.

Enquanto Saul estava em Micmás com os seus melhores guerreiros, os filisteus se reuniram para lutar contra ele (1Sm. 13:5-15). Aquele era o exército mais forte que Saul havia enfrentado. O inimigo tinha trinta mil carros e seis mil cavaleiros, e a multidão dos soldados era comparada com "a areia que está à beira-mar". E desnecessário dizer que era um grande exército! Enfrentar trinta mil carros é como enfrentar trinta mil tanques - além do mais, o exército era tão grande que não podia ser contado! Esta visão era muito intimidadora para o exército de Israel. Aterrorizados, os soldados de Saul se esconderam nos bosques, em buracos, em poços e atrás das rochas. Eles estavam apavorados. Alguns fugiram a pé, atravessando o Jordão até à terra de Gade e Gileade, enquanto os que ficaram seguiram Saul, tremendo de medo.

Antes das batalhas, era costume de Israel apresentar sua súplica diante do Senhor. Samuel havia dado uma ordem da parte do Senhor a Saul, dizendo que ele estaria lá em um determinado momento para apresentar a oferta queimada ao Senhor. Saul "esperou sete dias, segundo o prazo determinado por Samuel; não vindo, porém, Samuel a Gilgal, o povo se foi espalhando dali" (1Sm. 13:8). Pressionado, Saul disse: "Trazei-me aqui o holocausto e ofertas pacíficas". Ele ofereceu as ofertas queimadas, e assim que o fez, Samuel chegou. Samuel perguntou a Saul o que ele havia feito.Veja com atenção a resposta de Saul:

Vendo que o povo se ia espalhando daqui, e que tu não

vinhas nos dias aprazados, e que os filisteus já se tinham ajuntado em Micmás, eu disse comigo: "Agora,

descerão os filisteus contra mim a Gilgal, e ainda não

obtive a benevolência do Senhor"; e forçado pelas

circunstâncias, ofereci holocaustos.

Samuel então repreendeu Saul dizendo que ele havia agido de forma insensata ao não guardar o mandamento do Senhor.

Agora que já revimos o que aconteceu, imagine-se na posição de Saul. Você é o líder. Você e os seus homens enfrentaram um enorme exército por mais de sete dias. Você já está superado enormemente em número, e todos os dias as fileiras do inimigo aumentam enquanto o seu exército diminui. Os seus homens estão com medo do inimigo e começam a desertar. E os poucos que restam estão tremendo de terror. Você está esperando pelo profeta de Deus, e ele não aparece a tempo para oferecer o sacrifício!

Há uma enorme pressão sobre você. Esta é uma situação do tipo "prensa de azeite". Os que o cercam pressionam você:"Faça alguma coisa, ou todos morreremos!"Você vai esperar como o Senhor ordenou, ou fará algo para se salvar? Esta era a situação que o rei Saul enfrentava (Ver 1 Samuel 13:1-8). Infelizmente, ele cedeu à pressão. Desobedecendo, ele próprio ofereceu os sacrifícios.Veja as desculpas dadas por Saul: "Os filisteus [estavam vindo] contra mim... senti-me pressionado" (1Sm. 13:12, AMP). Ele ofereceu os sacrifícios para ficar bem aos olhos do povo, e depois tentou parecer espiritual aos olhos de Samuel dizendo:"Senti-me pressionado". Na verdade, ele reagiu e caiu na armadilha da intimidação.

A maioria das pessoas vez por outra enfrenta este tipo de situação. Alguma vez você pensou: Sei que Deus está me dizendo para ficar quieto, mas preciso agir para mudar esta situação em que estou?

Já estive em situações onde os amigos e aqueles que estavam sob a minha autoridade insistiram:"John, você precisa fazer alguma coisa!" Mas no meu coração, sabia que Deus não estava dizendo o mesmo. Ele estava em silêncio. Uma das coisas mais difíceis de se fazer é esperar em Deus, principalmente quando Ele não está dizendo nada! Isto é verdade, principalmente agora. Com os nossos vastos recursos e dinheiro, geralmente podemos fazer alguma coisa acontecer ainda que Deus não esteja se movendo. Podemos criar alguma coisa que parece ser da parte de Deus com a força dos nossos talentos e capacidades naturais - e sem o envolvimento de Deus.

No que diz respeito a tomar decisões, muitas vezes não podemos encontrar um capítulo ou um versículo que nos diga o que fazer. Precisamos saber o que Deus está nos dizendo em cada momento. Mas quando Deus parece não estar falando, na verdade Ele está falando! Ele está dizendo: "Continue fazendo exatamente o que Eu lhe disse para fazer. Nada mudou!" Isto se torna especialmente difícil quando estamos sob o ataque da intimidação.

Quero compartilhar uma palavra que o Senhor me deu em um dia de Ano Novo. Estava fora do país, dormindo profundamente, exausto pela viagem de trinta e seis horas e pela programação de duas ministrações  por dia. De repente, acordei daquele sono profundo às duas da madrugada. Sabia que somente o Senhor poderia ter me acordado daquela forma, porque eu estava estranhamente alerta depois de ter tido somente três horas de sono.

O Senhor me deu uma palavra que normalmente eu não compartilharia porque se trata de algo pessoal. Mas creio que o Senhor gostaria que eu compartilhasse isto para ilustrar este ponto. Creio que fortalecerá muitos de vocês que se encontram em situações semelhantes. Eis uma parte do que me foi dito: Você sentiu que estava sem foco; isto foi parte do seu

teste. Eu não permiti que você tivesse foco, para testar você, para ver se você agiria sem a Minha direção. O

fato de você não ter agido durante o Meu silêncio Me

agradou muito. Por você não ter agido quando Eu não

lhe disse para agir, e por não ter feito os seus próprios planos, esperando que eles fossem os Meus planos,

agora você verá que um grande foco virá. Porque darei a

você e à sua mulher planos grandes e específicos que

trarão a vocês dois grande alegria.

O Senhor falou comigo em um momento em que minha esposa e eu estávamos nos sentindo estagnados. Tínhamos desejos e necessidades pessoais que sentíamos que não estavam sendo realizados. Ambos estávamos vivendo sob uma grande pressão por alguns anos. Os amigos que verdadeiramente se importavam conosco nos haviam aconselhado a tomar algumas atitudes, mas não sentíamos que aquela palavra procedia do Senhor. Eles não estavam errados ao nos dizer essas coisas. Eles só estavam reagindo à situação em que nos viram. Aquele foi o nosso teste. Havia mudanças que poderíamos fazer para aliviar a pressão sob a qual estávamos. Lutávamos contra as nossas dúvidas, mas nos perguntávamos: Será que estamos perdendo a direção de Deus? Mas no fundo do nosso coração, ambos sabíamos que Deus não havia nos instruído a tomai qualquer atitude. Antes do primeiro mês daquele novo ano terminar, vimos Deus fazer coisas além das nossas mais tremendas expectativas! Não sei se já vi tantas coisas acontecerem em apenas um mês. Parecia que Deus havia feito mais em um mês do que nos cinco anos anteriores!

E crucial não reagirmos quando estamos sob pressão. Precisamos agir de acordo com a palavra do Senhor.

Um Homem Segundo o Coração de Deus

Saul ficou intimidado. A sua reputação, a sua vida e o seu reino estavam em jogo, então ele agiu quando Deus havia ordenado que ele esperasse. Depois que Samuel repreendeu Saul, ele pronunciou este juízo sobre ele:

Já agora não subsistirá o teu reino. O Senhor buscou

para Si um homem que lhe agrada e já lhe ordenou que

seja príncipe sobre o Seu povo, porquanto não guardaste

o que o Senhor te ordenou.

Esta não foi a única vez em que Saul se curvou diante da intimidação. Ele construiu uma história de desobediência ao Senhor em situações de pressão. Em outro incidente, ele cedeu ao desejo do povo de tomar os despojos de uma cidade que Deus havia lhes dito para destruir completamente. Ele não queria perder o favor do povo. Quando confrontado por Samuel, Saul admitiu: "Pequei, pois transgredi o mandamento do Senhor e as tuas palavras; porque temi o povo e dei ouvidos à sua voz" (1Sm. 15:24).

A declaração que ele faz em seguida demonstra que Saul estava mais preocupado com a sua reputação do que com a sua desobediência. As palavras dele para Samuel traem o seu coração: "Pequei; honra-me, porém, agora, diante dos anciãos de Israel" (1Sm. 15:30).

Saul transgrediu repetidamente porque temia o homem. Quando ficava com mais medo, ele se tornava um líder ainda mais dominador. Isto geralmente acontece com os líderes inseguros. Eles tratam as pessoas asperamente para parecer que estão no controle, quando na verdade estão encobrindo a sua própria intimidação e o seu medo.

Samuel disse a Saul que Deus entregaria o reino a um homem que guardaria os Seus mandamentos (1Sm. 13:14). Davi era esse homem. Ouvi algumas pessoas dizerem que têm um coração que busca a Deus, mas prefiro ouvir Deus dizer, como Ele disse de Davi: "Você tem um coração segundo o Meu". Sei que este é o desejo de cada crente que O ama! Estudei com afinco a vida de Davi, com o intuito de saber tudo sobre ele que poderia fazer com que o Senhor Se alinhasse com Davi. Observei que Davi tinha o cuidado de não fazer nada sem ouvir a voz de Deus antes. Repetidamente, em situações de muita pressão, ele pedia o conselho de Deus (ver capítulos 20 a 31 de 1Sm.). Vamos dar uma olhada em uma situação extremamente angustiante.

Será Que As Coisas Podem Piorar?

Durante o último ano do reinado de Saul, Davi e seus homens se refugiaram na terra dos filisteus. Em uma estranha reviravolta do destino, Davi e os seus homens foram se juntar aos filisteus quando o exército filisteu se reuniu contra os israelitas. Entretanto, os senhores filisteus não se agradaram quando viram o homem hebreu ir à guerra com eles. Então, eles negaram permissão a Davi e a seus homens para lutarem com eles.

Na manha seguinte, a tropa de Davi partiu para voltar às suas esposas e filhos, que estavam na cidade de Ziclague. A viagem até o campo de batalha havia sido um fracasso, e Davi e seus homens devem ter se sentido indesejados. Eles haviam sido rejeitados não apenas pelo seu próprio rei e pelo seu país, mas também pela nação onde se refugiaram. Davi deve ter se sentido muito só - um homem sem pátria. Aquele não foi um dia agradável. Mas isto não era nada comparado ao que ele estava para enfrentar. Leia com atenção o que aconteceu quando ele voltou para sua família, e permita-se imaginar como ele se sentiu.

Sucedeu, pois, que, chegando Davi e os seus homens, ao

terceiro dia, a Ziclague, já os amalequitas tinham dado

com ímpeto contra o Sul e Ziclague e a esta, ferido e

queimado; tinham levado cativas as mulheres que lá se

achavam, porém a ninguém mataram, nem pequenos

nem grandes; tão somente os levaram consigo e foram

seu caminho. Davi e os seus homens vieram à cidade, e

ei-la queimada, e suas mulheres, seus filhos e suas filhas eram levados cativos. Então Davi, e o povo que se

achava com ele ergueram a voz e choraram, até não

terem mais forças para chorar. Também as duas

mulheres de Davi foram levadas cativas: Ainoã, a

jezreelita, e Abigail, a viúva de Nabal, o carmelita.

Você consegue imaginar a dor que ele sentiu? Sua família havia sido raptada, tudo que lhe era querido havia sido roubado, e o que restou havia sido queimado! Ele não tinha apenas a sua família com que se preocupar, mas também a família de todos os seus homens. Eles haviam se sentido inúteis e sem pátria. Então, voltaram para encontrar suas casas em chamas e tudo o que eles amavam desaparecido. Como se isto não fosse suficientemente ruim, veja o que aconteceu em seguida: Davi realmente os perseguiu. "Assim, Davi salvou tudo quanto ha viam tomado os amalequitas; também salvou as suas duas mulheres. Não lhes faltou coisa alguma, nem pequena nem grande, nem os filhos, nem as filhas, nem o despojo, nada do que lhes haviam tomado: tudo Davi tornou a trazer" (1Sm. 30:18-19). O que parecia sem esperança se transformou em uma grande vitoria! Nada é difícil demais para o nosso Deus. Davi temia mais a Deus do que aos seus homens. Este fato somente lhe deu a confiança para se voltai para Deus em primeiro lugar. Esta reação foi muito diferente da reação de Saul à pressão. Davi agiu, ao passo que Saul reagiu. Davi pôde agir em vez de reagir porque ele sabia o que Deus estava dizendo. Quando temos a mente de Cristo, estamos equipados com a coragem para agir e não reagir.

Moderação - uma Mente Equilibrada

Em um capítulo anterior, descobrimos que é necessário ousadia para quebrar o poder da intimidação - não uma ousadia natural, mas a ousadia alimentada pelas virtudes divinas do poder, do amor,e da moderação [que significa ter uma mente equilibrada]. Este era o nosso versículo chave:

Por esta razão, pois, te admoesto que reavives o dom de

Deus que há em ti pela imposição das minhas mãos.

Porque Deus não nos tem dado espírito de covardia, mas

de poder, de amor e de moderação.

Vamos dar uma olhada em como estas coisas produziram em Davi a ousadia necessária para resistir a qualquer intimidação que ele enfrentasse. 1. Poder. Ele conhecia Deus, e sabia que Deus era maior e mais poderoso do que qualquer coisa que enfrentasse.

2. Amor. Ele amava a Deus mais do que a si mesmo.

3. Moderação. Ele não agiria até que tivesse ouvido a palavra ou o conselho do Senhor, independente da força da pressão.

Quando nosso espírito está cheio de poder, amor e da palavra do Senhor, não somos cativos da intimidação. Não é apenas uma dessas virtudes, mas a combinação de todas as três que nos sustentam. Paulo teria mencionado apenas uma se apenas uma delas bastasse. Porém, para andar na ousadia divina, todas as três são necessárias.

Já analisamos em detalhes o poder e o amor.Vamos seguir em frente e ver como obter a moderação, que significa ter uma mente equilibrada através do conselho do Senhor.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Diante da pressão do temor do homem, você tem agido segundo a vontade de Deus ou apenas reagido tentando se proteger e se preservar?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando Deus o conduz a dificuldades ou sofrimentos, você confia que somente Ele pode guardá-lo no Seu projeto eterno?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como o temor do Senhor, que é refúgio e fonte de vida, pode gerar em você a confiança e a ousadia para seguir o caminho de Deus e não o do homem?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O Espírito de Moderação$t$, 14,
$conteudo$Uma mente equilibrada sabe o que Deus está dizendo e fazendo no exato instante.

Nada intimida mais do que a ignorância. A ignorância é a falta de conhecimento. O valor do conhecimento é mencionado muitas vezes nas Escrituras. Provérbios 24:5 diz: "Mais poder tem o sábio do que o forte, e o homem de conhecimento, mais do que o robusto". E Provérbios 11:9 nos lembra que "Os justos são libertados pelo conhecimento". O conhecimento nos dá a força que precisamos para escapar da armadilha da intimidação.

Precisamos entender que há um conhecimento natural e um conhecimento espiritual. O conhecimento espiritual e a sabedoria espiritual ultrapassam o conhecimento natural e a sabedoria natural. É por isso que os chamamos de sobrenaturais - porque são superiores ao que é natural.

Em 2 Timóteo 1:6-7, o apóstolo Paulo menciona a Timóteo três elementos- chave necessários para vencer o medo (a intimidação): amor, poder e moderação. Este capítulo abrange o último elemento - o espírito de moderação, que podemos entender como uma "mente equilibrada" de acordo com a versão King James da Bíblia, em língua inglesa.

O que é moderação? Ter uma "mente equilibrada" seria o mesmo que ter conhecimento das Escrituras? Os discípulos eram considerados pescadores ignorantes, mas o grupo mais instruído de Israel, os membros do sinédrio, ficou perplexo com a sabedoria e a ousadia deles.

Ao verem a intrepidez de Pedro e João, sabendo que

eram homens iletrados e incultos, admiraram-se; e

reconheceram que haviam eles estado com Jesus.

Um homem chamado Estevão que servia as mesas para as viúvas surpreendeu os instruídos líderes da sinagoga. A Bíblia nos dá este relato: "E não podiam resistir à sabedoria e ao Espírito pelo qual ele falava" (At. 6:10). De imediato, podemos concluir que o espírito de moderação - uma mente equilibrada - não nasce da sabedoria natural ou do treinamento especial nas Escrituras. Então, de onde vem o espírito de moderação?

A moderação vem do conhecimento da mente de Cristo. O conhecimento das Escrituras por si só não significa conhecer a mente de Cristo. Aprendemos que "a letra mata, mas o Espírito vivifica" (2Co. 3:6). A letra é a Escritura, a palavra escrita. Os fariseus possuíam um grande conhecimento das Escrituras, mas não conheciam o seu espírito; portanto, o ministério deles gerava morte. Ele arrancava e afastava as pessoas do coração de Deus em vez de atraí-las a Ele. Eles separavam as pessoas de Deus com o seu conhecimento legalista, apresentando Deus da forma como o interpretavam - com a mente e não com o coração.

Jesus declarou: "Não só de pão viverá o homem, mas de toda palavra que procede da boca de Deus" (Mt. 4:4). Observe que Ele não disse "procedeu". Nesse caso, o tempo verbal estaria no passado. A Bíblia traz aquilo que procedeu da boca de Deus. Precisamos conhecer o Senhor da Bíblia para saber o que está procedendo da Sua boca hoje.

Jesus disse em João 16:13-14 (NVI): "Mas quando o Espírito da verdade vier, ele os guiará a toda a verdade. Não falará de si mesmo; falará apenas o que ouvir, e lhes anunciará o que está por vir. Ele me glorificará, porque receberá do que é meu e o tornará conhecido a vocês". Observe que de acordo com o texto da Nova Versão Internacional, Jesus disse "apenas o que ouvir" e não "apenas o que ouviu". Isso significa que, com a ajuda do Espírito Santo, podemos saber o que Jesus está dizendo.

Você pode perguntar então: "De que servem as Escrituras?" Elas são diretrizes para nos ajudar e nos dirigir. Elas são inspiradas por Deus, e quando despertadas pelo Espírito Santo, tornam-se vivas em nosso coração e não apenas em nossa mente. Elas são o padrão que usamos para confirmar que ouvimos o Espírito de Deus. O Espírito Santo nunca falará algo contrário às Escrituras. Mas podemos ficar travados quando limitamos o que o Espírito Santo pode dizer ou fazer ao que se encaixa na nossa compreensão mental das Escrituras. Este foi o erro dos fariseus. Conhecer o Capítulo e o Versículo Não Basta

Os fariseus eram muito letrados. Na verdade, eles memorizavam os cinco primeiros livros do Antigo Testamento! Eles haviam buscado nas Escrituras e estavam ansiosamente aguardando o Messias. Entretanto, eles O aguardavam de acordo com a compreensão mental que tinham das Escrituras. Eles sabiam que Isaías havia profetizado:

Porque um menino nos nasceu, um filho se nos deu; o

governo está sobre os Seus ombros; e o Seu nome será:

Eternidade, Príncipe da Paz; para que se aumente o Seu

governo, e venha paz sem fim, sobre o trono de Davi e

sobre o Seu reino, para o estabelecer e o firmar mediante o juízo e a justiça, desde agora e para sempre. O zelo do Senhor dos Exércitos fará isto.

O Messias estabeleceria o Seu reino terreno, os libertaria da opressão romana e se sentaria no trono de Davi. Então, quando Jesus veio como um carpinteiro de Nazaré da Galiléia, acompanhado por discípulos que consistiam de pescadores ignorantes e coletores de impostos, eles se escandalizaram. Esses fariseus confrontavam Jesus constantemente com questões que haviam inventado a partir do entendimento mental que tinham das Escrituras. Eles estavam certos de que o Messias seria um grande líder nacional. Então, eles confrontaram Jesus com perguntas do tipo: "Se você é o Messias, onde está o reino que você deve estabelecer? Por que você não está sentado no trono de Davi?". Jesus respondeu: "Não vem o reino de Deus com visível aparência. Nem dirão: Ei-lo aqui! Ou: Lá está! Porque o reino de Deus está dentro de vós" (Lc 17:20-21). Ora, podemos entender isto hoje porque temos o privilégio de saber que Jesus morreu e ressuscitou, mas aqueles homens acreditavam realmente que estavam certos. No entanto, eles extraíam a sua confiança do conhecimento mental que tinham das Escrituras. Eles não tinham o entendimento do Espírito. Revelado pelo Espírito

Um homem chamado Simeão também estava buscando o Messias. Ele não era tão letrado quanto os fariseus. Mas veja o que a Bíblia diz sobre ele. ... homem este justo e piedoso, que esperava a con-

solação de Israel; e o Espírito Santo estava sobre ele.

Revelara-lhe o Espírito Santo que não passaria pela

morte antes de ver o Cristo do Senhor. Movido pelo

Espírito, foi ao templo; e, quando os pais trouxeram o

menino Jesus para fazerem com ele o que a Lei or-

denava, Simeão o tomou nos braços e louvou a Deus,

dizendo: "Agora, Senhor, podes despedir em paz o Teu

servo, porque os meus olhos já viram a Tua salvação"...

E estavam o pai e a mãe do menino admirados do que

Quando Jesus foi levado para ser dedicado ao Senhor, Ele tinha entre seis meses a dois anos de idade. O templo era imenso; a área do templo era formada por alguns prédios. Em geral havia centenas e até milhares de pessoas naquela área. Agora, imagine isto: entra um carpinteiro com sua esposa vindo da Galiléia, levando um bebê de seis meses de idade. Eles estão no meio da multidão no templo quando este homem, Simeão, corre, ergue o bebê e profetiza: "O Messias!" Agora você pode entender por que José e Maria ficaram maravilhados! Observe que Simeão não descobriu que o Messias estava chegando ao ler um livro intitulado "101 Razões pelas Quais o Messias Virá Por Volta do Ano 4 a.C." Ele não recebeu esta informação estudando as Escrituras. Pela revelação do Espírito Santo, ele sabia que o Messias estava vindo. Ele foi ao templo sob a direção e orientação do Espírito Santo!

Agora, eis um fato impressionante para se refletir. Este homem, que não era um perito na lei, reconheceu Jesus como o Messias quando Ele tinha seis meses de idade, mas trinta anos depois os fariseus não conseguiram reconhecer o Messias quando Ele expulsava demônios, curava os enfermos, abria os olhos aos cegos, e levantava os mortos! Esta é a diferença entre ter a mente do Senhor e ter o conhecimento mental das Escrituras.

Será que fizemos com o Novo Testamento o que os fariseus fizeram com o Antigo? Será que limitamos o nosso conhecimento de Deus à nossa doutrina e ao nosso conhecimento das Escrituras, até mesmo nas igrejas que crêem nos dons do Espírito Santo? A doutrina não estabelece o nosso relacionamento com Deus; ela apenas o define! Quando eu disse "Sim" em meu casamento, não me deram um manual! Eu iniciei um relacionamento pessoal com minha esposa. E então, devemos parar de ler nossas Bíblias? E claro que não! Mas talvez precisemos lê-las de forma diferente. Quando pego minha Bíblia, sempre oro, pedindo ao Espírito Santo que revele a Palavra do Senhor. A medida que leio, as verdades explodem dentro do meu coração. Essas verdades são a palavra pela qual devo viver!

Aquele que tem um espírito de moderação - uma mente equilibrada - sabe o que Deus está dizendo e fazendo no exato instante. Somente o Espírito de Deus pode revelar isto. Ele pode Se comunicar pelas Escrituras; Ele pode falar a palavra ao meu coração por meio de um conhecimento interior ou com Sua voz mansa e suave. Quando sabemos o que Deus está dizendo, estamos firmados em uma rocha inabalável.

Os Evangelhos relatam em diversas ocasiões como Jesus falava com autoridade. Veja um desses momentos.

Quando Jesus acabou de proferir estas palavras, estavam

as multidões maravilhadas da Sua doutrina; porque Ele

as ensinava como quem tem autoridade e não como os

Ele não apenas falava com autoridade, como também agia com autoridade.Veja outra ocasião:

Todos ficaram grandemente admirados e comentavam

entre si, dizendo: "Que palavra é esta, pois, com

autoridade e poder, ordena aos espíritos imundos, e eles saem?"

Ele vivia e agia com tal autoridade que isto foi reconhecido por um centurião romano. Ele disse a Jesus que se Ele apenas dissesse uma palavra, o seu servo seria curado (Mt. 8:5-10). Este romano entendia a fonte da autoridade de Jesus. A autoridade de Jesus não estava limitada a Ele próprio, mas era dada por Deus. Isto acontecia porque Jesus era totalmente submisso ao Espírito Santo, que revelava a Ele a vontade de Seu Pai.

O centurião disse:"Pois também sou homem submisso à autoridade, e tenho soldados abaixo de mim". Jesus maravilhou-Se ao ouvir isto. Aquele comandante entendia que a única maneira de se ter autoridade é estando debaixo de autoridade! Jesus operava com autoridade porque Ele estava debaixo de autoridade. Ele estava em total submissão ao Espírito Santo, que revelava a vontade do Pai. Ele disse: Porque Eu não tenho falado por Mim mesmo, mas o Pai,

que Me enviou, esse Me tem prescrito o que dizer e o

Eu nada posso fazer de Mim mesmo; na forma por que

ouço, julgo. O Meu juízo é justo, porque não procuro a

Minha própria vontade, e sim a Daquele que Me enviou.

Ele explicou claramente que a Sua autoridade vinha de Seu Pai. Não crês que Eu estou no Pai e que o Pai está em Mim?

As palavras que Eu vos digo não as digo por Mim

mesmo; mas o Pai, que permanece em Mim, faz as Suas

Em verdade, em verdade vos digo que o Filho nada pode

fazer de Si mesmo, senão somente aquilo que vir fazer o

Pai; porque tudo o que este fizer, o Filho também

Lembre-se, embora Ele seja o Filho de Deus, viveu como um homem cheio do Espírito Santo. Ele Se despiu de todos os privilégios divinos. Porém, detinha uma autoridade que fazia as pessoas se maravilharem. Isto porque Ele só falava e agia segundo o que o Espírito de Deus O conduzia. Ele nunca ficava intimidado, porque Deus nunca tem medo e nunca fica intimidado. Não há ninguém mais poderoso, forte e sábio do que Deus!

Jesus permaneceu na Sua autoridade enquanto os fariseus tentavam intimidá-lo continuamente com suas perguntas religiosas e astutas. Eles tentaram armar ciladas para Ele com as Suas próprias palavras, procurando desacreditá-lo. Mas por mais esperto que fosse o laço que tentavam armar para Ele, Jesus sempre respondia pelo Espírito Santo, quebrando o poder da intimidação deles. Ele os confundia com sabedoria, até que, frustrados, eles abandonavam suas tentativas de intimidá-lo. E ninguém lhe podia responder palavra, nem ousou

alguém, a partir daquele dia, fazer-lhe perguntas.

Assim como o Pai Me Enviou...

Agora, as notícias empolgantes: "Assim como o Pai Me enviou, Eu também vos envio" (Jo. 20:21). Devemos viver, falar e agir como Ele. E por isso que Ele nos encoraja:

Assentai, pois, em vosso coração de não vos

preocupardes com o que haveis de responder; porque Eu

vos darei boca e sabedoria a que não poderão resistir,

nem contradizer todos quanto se vos opuserem.

A razão pela qual alguns não falam, ensinam ou pregam com autoridade, é porque estudam uma mensagem da Bíblia, depois relacionam o seu entendimento mental dessas escrituras. Eles falam do que Deus disse e fez em vez de falarem do que Ele está dizendo e fazendo! Somente quando falamos pelo Espírito de Deus é que falamos com autoridade.

Porque Ele tem dito: "De maneira nenhuma te deixarei,

nunca jamais te abandonarei". Assim, afirmemos

confiantemente: "O Senhor é o meu auxílio, não

temerei; que me poderá fazer o homem?"

Veja com atenção estas palavras novamente. Podemos falar com ousadia e autoridade quando sabemos o que Ele está dizendo! A certeza desta Palavra nos dá ousadia. Deus nos garantiu que quando sabemos o que Ele diz, e quando cremos que Ele está sempre conosco, podemos declarar com ousadia: "O que me pode fazer o homem?" Quando vivemos nesta confiança, não podemos ser intimidados! Os Fariseus dos Tempos Modernos

Algumas vezes fui abordado por aqueles a quem chamo de "fariseus dos tempos modernos", que não têm o Espírito (eles podem afirmar falar em línguas, mas ainda não possuem o Espírito de Deus!). Eles citam capítulos e versículos mais depressa do que a maioria das pessoas.

Essas pessoas me confrontaram com perguntas sobre o que eu havia acabado de pregar ou talvez sobre algo que eu havia escrito. Não estou me referindo a pessoas que fazem perguntas para aprender ou porque não entenderam algo. A estas, dou as boas-vindas. Na verdade, estou falando

daqueles que submetem tudo aos seus parâmetros religiosos, rejeitando qualquer pessoa ou qualquer coisa que não se encaixe na sua "caixa de doutrinas". Percebi que essas conversas geralmente podem seguir por uma ou duas direções. Em primeiro lugar, posso entrar em uma discussão mental das Escrituras com eles e me desgastar, principalmente se eles forem bem versados no ponto que estão tentando provar. Eles prevalecerão, e eu ficarei intimidado. Aprendi a não me deixar enredar nesse tipo de coisa!

A outra maneira de responder é contar com o Espírito Santo e falar o que ouço em meu coração. Então a sabedoria de Deus se revela, e os argumentos deles cessam. A sabedoria de Deus sempre terá origem nas Escrituras, mas ela tem a vida, que é inspirada para dentro dela pelo Espírito Santo.

Anos atrás, eu estava com outro pastor em um avião. Encontramos uma mulher judia que era muito extrovertida e inteligente. Começamos a conversar intensamente sobre o Senhor Jesus. Nós dois fazíamos diversas declarações, tentando provar que Jesus era o Messias. Ao mesmo tempo, ela estava tentando provar que as afirmações de Jesus eram falsas.

De repente, percebi o que estava fazendo. Sabia que aquela discussão mental não chegaria a lugar algum. Então, olhei para dentro de mim em busca da direção do Espírito Santo, e Ele me revelou o que eu deveria dizer. Olhei para ela e compartilhei as palavras que Ele havia me dado. Quando fiz isso, minha voz mudou, e uma autoridade veio sobre o que eu estava dizendo. Assim que ela ouviu aquelas palavras, seus olhos se arregalaram, e ela ficou em silêncio.Todo o nosso debate não a havia ajudado. Mas quando a palavra do Senhor veio, ela foi imediatamente ministrada.

Depois que descemos do avião, o pastor com quem eu estava viajando disse: "John, pude sentir a presença do Senhor quando você disse aquelas palavras. Você percebeu que ela não teve mais nada a dizer?" Não se envolva em discussões infrutíferas governadas pelo entendimento mental das Escrituras. Em vez disso, deixe que o Espírito Santo guie você em direção à sabedoria espiritual.

Disto também falamos, não em palavras ensinadas pela

sabedoria humana, mas ensinadas pelo Espírito,

conferindo coisas espirituais com espirituais... Porém o homem espiritual julga todas as coisas, mas ele mesmo

não é julgado por ninguém. Pois quem conheceu a

mente do Senhor, que o possa instruir? Nós, porém,

O homem que tem a mente de Cristo não pode ser julgado ou intimidado! Eu poderia compartilhar inúmeros incidentes nos quais teria ficado intimidado se não tivesse contado com o Espírito de Deus.

Somos alertados a andar como Jesus andou (1Jo. 2:6). Jesus só fazia o que Ele via o Espírito Santo fazer. Se fizermos isso, teremos um espírito de moderação (uma mente equilibrada) e possuiremos a ousadia que necessitamos para vencer a intimidação e o controle.

Muitas vezes enfrentamos situações que poderiam nos paralisar e nos tornar incapazes de concluir o que Deus colocou diante de nós, se não tivéssemos a mente de Cristo. Enfrentei um desafio assim no México.

Fui convidado para ir a Monterrey, no México, para uma reunião evangelística municipal. Era apenas por uma noite, e paguei pelas despesas de viagem. Passei metade do dia em oração. Enquanto eu orava, vi uma nuvem escura sobre o prédio onde devíamos nos reunir. Perguntei ao Senhor o que era aquilo. Ele explicou: "John, estas são as trevas que estão lutando contra esta reunião. Continue a orar". Uma unção muito forte veio sobre mim, fortalecendo-me para orar. Dentro de trinta minutos, tive outra visão. Um feixe de luz ia do topo do prédio diretamente até o céu. Novamente, perguntei ao Senhor o que era. "Esta é a Minha glória desimpedida, descendo sobre a reunião desta noite", disse Ele ao meu espírito. Fiquei muito entusiasmado.

O culto estava programado para começar às seis da tarde. Chegamos um pouco mais cedo, e logo recebemos a notícia de que um oficial do governo queria ver o pastor que havia organizado a reunião. Este oficial do governo estava acompanhado de dois policiais uniformizados.

O pastor e eu fomos nos encontrar com o oficial. Ele falou durante algum tempo com o pastor, em espanhol, depois se virou e perguntou- me em inglês:"O senhor fala espanhol?".

Então, ele me deu uma ordem: "O senhor não vai dizer nada a esta multidão esta noite, a não ser sobre atividades relacionadas a turismo". Em seguida, ele voltou-se novamente para o pastor e falou com ele. Observei o pastor. Ele não parecia muito feliz. Na verdade, ele parecia bem assustado. Quando o oficial terminou, ele e os dois soldados saíram. O pastor me puxou de lado e disse: "John, este homem é um oficial do governo, e ele disse que você não pode pregar. Há uma lei no México que diz que não se pode pregar neste país sem uma autorização se a pessoa não for um cidadão mexicano". Ele prosseguiu dizendo: "É uma lei que geralmente não é executada, mas este sujeito obviamente não quer você aqui, e ele está exercendo este poder. Ele também disse que quer que você esteja no escritório dele amanhã de manhã, às nove horas". Eu não podia acreditar no que meus ouvidos estavam ouvindo. Imediatamente, disse ao pastor: "Veja, eu não voei até aqui para não pregar. Se o senhor está preocupado somente comigo, então deixe-me pregar".

O pastor disse: "John, isto também poderia afetar a minha igreja. Ele poderia causar muitos problemas. Ele é um oficial de alto nível. Seria melhor não deixá-lo pregar". Aquele pastor estava intimidado, e eu não podia fazer nada a não ser orar, porque ele estava em uma posição de autoridade sobre aquela reunião. Saí do prédio, um ginásio localizado no centro de Monterrey. Havia um mastro de bandeira diante dele, e comecei a andar ao redor dele. Eu sabia que Deus havia me mostrado em oração a Sua glória manifesta neste culto. Eu sabia que Deus havia me instruído a vir. Mas eu não sabia o que fazer agora. Um pensamento percorria minha mente. Será que este oficial intimidador vai me impedir de Jazer o que Deus me enviou para fazer? Então, eu raciocinava: Este homem não pode parar o que Deus me mostrou em oração. Eu lutava sem parar. O que fazer? Então, eu disse: "Pai, não sei o que fazer, mas Tu não estás surpreso com isto.Tu já sabias que isto aconteceria. Então, preciso da Tua sabedoria e do Teu conselho para esta situação". Comecei a orar no Espírito. Este versículo me veio à mente:

Como águas profundas, são os propósitos do coração do

homem, mas o homem de inteligência sabe cobri-los.

Jesus disse que os crentes teriam rios de águas vivas fluindo de seus corações (Jo 7:38). Eu precisava do rio do conselho de Deus. Eu prensava da mente de Cristo. Orar em línguas iria despertá-la.

Depois de orar por vários minutos, minha mente acalmou-se o suficiente para ouvir mais. Este pensamento brotou do meu coração: l:ale ao povo sobre o maior turista que um dia visitará o México.

Gritei alto:"É isto! O homem disse que eu podia falar sobre turismo. Vou falar a eles sobre o maior turista que um dia visitará o México — Jesus Cristo!" A alegria brotou dentro de mim, e comecei a rir.

Corri de volta ao prédio. Para minha alegria, Deus já havia tratado com o pastor. Ele disse:"Deus falou comigo e me disse para lhe dizer para fazer tudo o que Ele disser".

Abri o culto dizendo: "Disseram-me para só falar com vocês sobre atividades relacionadas a turismo. Então, nesta noite quero lhes falar sobre o maior turista que um dia visitará o México".

Preguei Jesus como Senhor e Salvador durante uma hora. Várias pessoas responderam ao apelo para receber Jesus Cristo como Senhor. Havia um homem deficiente nesse grupo. Depois que orei pelas pessoas que estavam no grupo para receber Jesus, o Senhor falou comigo: "Lá está o primeiro homem que quero curar".

Olhei para ele e disse: "Senhor, o Espírito de Deus está dizendo que Ele quer curá-lo". Impus as mãos sobre ele e orei. Então o tomei pela mão, e começamos a andar. Ele estava muito cauteloso a princípio. Depois, passou a se movimentar cada vez mais rápido. Logo ele estava andando; depois corremos juntos. Finalmente, soltei a mão dele, e ele correu sozinho.

A multidão delirou. Pessoas com todo tipo de enfermidade e doença correram à frente. No meio de toda aquela confusão, perdi meu intérprete. Algumas centenas de pessoas haviam corrido em direção à plataforma. Muitos foram curados, inclusive uma mulher que era totalmente surda de um ouvido desde o nascimento e parcialmente surda do outro. Ela chorou até sua blusa ficar encharcada de lágrimas. Foi maravilhoso!

Eu não estava ciente de que o oficial de governo enviara dois homens de volta para a reunião para me prender se eu pregasse. Eles chegaram exatamente quando eu estava orando pelo homem deficiente. Um introdutor os avistou e ouviu-os dizer: "Vamos ver o que ele vai fazer antes de prendê-lo".

Quando eles viram o homem deficiente curado, um perguntou ao outros: "Você acha que ele é real?" Eles se aproximaram e continuaram a observar o que Deus estava fazendo.

Quando viram a mulher surda curada e chorando, um deles disse: "Acho que isto é real".

Então, um menino de cinco anos de idade caiu no chão, obviamente sob o poder de Deus.Vendo isto, eles concordaram: Isto é real! E aqueles dois homens que haviam sido enviados para me prender vieram à frente para receber oração! Aleluia! Deixei o país no dia seguinte, e não me incomodei em atender ao compromisso com o oficial. Na semana seguinte, o pastor mexicano voou ate os Estados Unidos, trazendo unia cópia do jornal de Monterrey. Ele leu para mim um artigo de capa sobre a nossa reunião.

O jornal relatava que os oficiais do governo disseram que eu era uma fraude e que tudo que queria era dinheiro (eu havia sido direcionado a não levar um centavo para fora do país e pagara por minhas próprias despesas. Depois de ouvir isto, entendi o porquê). Entretanto, o jornal prosseguiu dizendo que os seus próprios repórteres haviam visto pessoas serem realmente curadas! Glória a Deus! O oficial de governo tentou me paralisar com suas ameaças intimidadoras. Se o pastor e eu tivéssemos ficado sob o controle daquelas ameaças, o dom de Deus em nossas vidas teria ficado adormecido. Ninguém teria sido salvo ou ministrado naquela noite. A palavra de Deus, que Ele me falou pelo Seu Espírito, havia me dado ousadia para quebrar o poder da intimidação liberada contra mim. Esse é o poder de uma mente equilibrada e de um espírito de moderação.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Em que áreas a ignorância — a falta de conhecimento das Escrituras e dos caminhos de Deus — tem aberto portas para a intimidação na sua vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você tem buscado o conhecimento espiritual e a sabedoria sobrenatural que ultrapassam o conhecimento natural e o libertam do medo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que significaria, na prática, ter uma mente equilibrada que sabe o que Deus está dizendo e fazendo no exato instante em que você é pressionado?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prossiga para o Alvo$t$, 15,
$conteudo$O que o homem considera insignificante, Deus usa para realizar o impossível. Neemias era um judeu que vivia no tempo em que Israel estava no cativeiro.Vários anos antes, os babilônios haviam chegado e destruído Jerusalém completamente. Eles mataram ou levaram cativos a maioria dos seus habitantes. As muralhas foram queimadas ou derrubadas, a cidade foi deixada em ruínas. Deus havia colocado no coração de Neemias o desejo de voltar a Jerusalém e reconstruir as muralhas e a cidade. Neemias havia servido ao rei estrangeiro fielmente e havia conquistado o favor do rei. O rei concedeu a ele permissão para partir e cumprir tudo o que Deus havia colocado em seu coração. Neemias partiu imediatamente para Jerusalém e reuniu o remanescente de Israel, encorajando-os a restaurar tudo que o inimigo havia destruído.

Eles estavam enfrentando uma tremenda resistência. Três oficiais locais chamados Sambalate, Tobias e Gesém não queriam que os muros fossem reconstruídos. Eles se opunham à prosperidade de Israel. Eles estavam determinados a paralisar Neemias e o remanescente de Deus, e armaram todo tipo de estratagemas para intimidá-los.

Quando esses líderes tomaram conhecimento de seus planos, Neemias contou: "eles zombaram de nós e nos desprezaram" (Ne. 2:19). Eles não apenas tentaram desencorajar Neemias e seus homens, como também tentaram fazer com que eles parecessem tolos aos olhos do povo. Eles zombaram deles com declarações depreciativas. "Ainda que edifiquem, vindo uma raposa, derribará o seu muro de pedra" (Ne. 4:3).

Muitas vezes as pessoas tentam intimidá-lo rindo de você ou fazendo pouco do que você está fazendo. Elas podem zombar de você e questionar a sua capacidade de realizar tudo o que Deus colocou em seu coração. Elas podem fazer isso na sua frente, ou podem semear perguntas e zombaria no meio de outras pessoas. Ou talvez não seja uma pessoa ou um grupo que resista a você, mas você pode estar lutando contra a sua própria mente, enquanto ela é bombardeada com pensamentos do tipo: O que as pessoas vão pensar? Será que elas vão rir de mim? Será que vou fracassar?

Nesta situação, é importante sabermos o que Deus nos instruiu a fazer, lembrando que Ele "escolheu as coisas fracas do mundo para envergonhar as fortes" (1Co. 1:27). O que o homem considera insignificante, Deus usa para realizar o impossível. Então, Ele recebe toda a glória!

Neemias jejuou e orou até ter a mente do Senhor. Assim ele pôde refutar com ousadia os seus adversários. "O Deus dos céus é quem nos dará bom êxito; nós, Seus servos, nos disporemos e reedificaremos; vós, todavia, não tendes parte, nem direito, nem memorial em Jerusalém" (Ne. 2:20).

Quando perceberam que não podiam impedir Neemias, e que os israelitas estavam avançando na sua obra, eles ficaram enfurecidos. Eles não estavam mais rindo, porque já não era mais engraçado. Eles planejaram confundir todo o projeto atacando a cidade (Ne. 4:7-8).

A ira é outra arma de intimidação. Ela será exercida contra você para paralisá- lo ou detê-lo. Dessa ira podem vir ameaças flagrantes ou sutis. Esta distração é uma arma muito eficaz de intimidação. Observei muitas vezes as pessoas recuarem do que sabiam ser certo ou do que deveriam fazer, a fim de evitar a ira dos outros. Elas abriam concessões especiais para manter uma falsa paz.

Pressão por Dentro e por Fora

Neemias não teve de enfrentar apenas este ataque dos estrangeiros pagãos, mas também teve problemas que surgiram entre os seus próprios homens com relação às condições que todos eles enfrentavam. Muitas vezes, quando Deus nos convoca, enfrentamos resistência e oposição vindas de dentro e de fora. Os homens de Neemias estavam ficando cansados. Eles estavam enfrentando tantos escombros que aquilo estava impedindo o progresso deles (Ne. 4:10). Também havia outro problema. Os trabalhadores ricos estavam pressionando financeiramente as famílias que estavam em débito, cobrando grandes somas de juros sobre os campos que essas famílias cultivavam (Ne. 5:1-8). Isto desanimou os homens cujas famílias estavam sofrendo. Estes problemas internos tornaram ainda mais difícil resistir à coerção e ao desânimo por parte dos inimigos deles. Intimidação por Todos os Lados

Já passei por situações assim. Quando comecei a viajar, pediram-me para ajudar uma igreja que havia perdido seu pastor. Ela se situava em uma cidade pequena de oitocentas pessoas no meio do nada. Depois de dois cultos, todos os adolescentes dali haviam se arrependido e tido uma experiência com o poder de Deus, assim como muitos adultos. Por causa do que Deus estava fazendo, a audiência dobrou para quase cem pessoas. Minha esposa e eu sentimos tanta compaixão por aquelas pessoas que nos oferecemos para cancelar as nossas próximas seis semanas de reuniões e ficarmos para edificar um fundamento firme naquela igreja para prepará- la para um novo pastor.

Algumas pessoas da diretoria não gostaram do que preguei. Um homem estava contrariado porque quando chegamos para o terceiro culto, todos os adolescentes estavam sentados nas duas fileiras da frente da igreja onde ele e sua mulher costumavam se sentar. Anteriormente, aqueles jovens se sentavam bem ao fundo da igreja.

Outros acharam que eu ministrava com muita veemência. Resumindo, aqueles homens da diretoria queriam me controlar. Eles queriam dirigir a igreja do jeito deles. Depois de várias reuniões com eles, finalmente eu disse: "Serei a pessoa que estará em posição de autoridade durante as seis semanas em que estiver aqui, e então o seu novo pastor assumirá. Esta é a única maneira das coisas funcionarem.Vocês decidem".

No dia em que eles deveriam me comunicar sua decisão, recebi um telefonema de um traficante de drogas local cuja mulher estava participando dos cultos. Ela havia confessado a ele que estava cometendo adultério com o melhor amigo dele. Ele decidiu descontar a sua frustração em mim e na igreja. Ele me disse que iria me causar problemas naquela noite.

Não dei muita atenção àquela ameaça. Algumas horas depois, um dos membros da diretoria que nos apoiava me informou que aquele homem havia ligado para ele e ameaçado explodir a reunião. Eu disse ao membro da diretoria: "Chame a polícia e peça a eles para verificarem essa informação". Algumas horas depois, recebi uma ligação da polícia. Um oficial disse:"Sr. Bevere, por favor, venha até à delegacia e assine este documento para sancionar a prisão deste homem".

Eu disse: "Policial, não quero ver esse homem preso. Ele está sofrendo. Tudo que estou pedindo é um pouco de proteção hoje à noite do lado de fora do prédio". Ele disse: "Meu turno termina dentro de quatro horas, e a delegacia mais próxima fica a 56 quilômetros de distância. Eles não poderão enviar ninguém esta noite".

Respondi: "Ainda assim, não quero que esse homem seja preso". O oficial me perguntou: "Sr. Bevere, há quanto tempo o Sr. mora aqui? Eu disse a ele que não morava naquela cidade.

Ele disse: "Sr. Bevere, conheço este homem. Ele tem má reputação por aqui. Suspeita-se que seja um contrabandista de drogas. Se ele tomar algumas cervejas, eu não colocaria a mão no fogo por ele".

Eu não podia acreditar no que estava ouvindo. O policial estava dizendo que aquele homem era perigoso, então eu sabia que ele realmente deveria ser. Mas eu ainda não sentia nenhuma liberação de Deus para assinar o mandado de prisão. Então, recusei, e depois agradeci ao oficial.

Eu não estava tratando apenas com as ameaças daquele homem, mas também com os problemas com a diretoria. Pensei: Isto é ridículo. Esta diretoria está me dando dor de cabeça. Eles não me querem aqui. Agora, minha família e eu estamos sendo ameaçados por um louco.

Tudo em mim queria sacudir a poeira dos pés e tirar minha família da cidade antes do anoitecer. Se eu não soubesse que Deus havia me enviado, teria partido pelo bem da minha família. No entanto, meu coração não me permitia partir por três motivos: Primeiro, Deus havia me enviado, e eu não tinha ouvido o Senhor me dizer para partir. Segundo, eu não queria abandonar todos aqueles que haviam sido tocados por Deus. E terceiro, se você fugir uma vez por causa da intimidação, será mais fácil fugir da próxima vez.

Eu tinha a mente do Senhor e decidi ficar, se a diretoria concordasse. Orei durante toda aquela tarde. Foi um dos momentos mais fortes de oração que já vivi. O dom de Deus foi fortalecido em mim. Eu estava pronto para a noite. Contudo, quando cheguei à igreja, descobri que não ficaria ali. A diretoria havia se reunido alguns instantes antes da hora prevista para o início do culto. Um dos diáconos me informou que eles haviam votado que eu deveria partir. O culto daquela noite seria meu último culto.

Fiquei triste, mas decidi me concentrar simplesmente no que Deus queria fazer pelas pessoas naquela noite. Preguei uma mensagem poderosa, e o poder de Deus atingiu aquelas pessoas com tanta força que as pessoas ficaram espalhadas pelo chão por toda a parte. Muitos que estavam desviados entregaram suas vidas ao Senhor. C) homem que havia feito a ameaça nem sequer apareceu. No final do culto, tive de anunciar que a diretoria não queria que eu ficasse. Subiu um clamor do meio do povo. Eu não havia ido ali para levar divisão, então me senti em paz quanto a ir embora.

Uma semana depois, aquela mesma diretoria elegeu um pastor que mais tarde descobriram ser homossexual. Eles passaram por quatro pastores no ano seguinte. O espírito de intimidação que estava operando na diretoria daquela igreja causou uma séria destruição àquela congregação.

Tão logo Neemias lidou com os problemas internos entre seus homens, outra onda de intimidação atingiu-o.

Sambalate e Gesém mandaram dizer-me: "Vem,

encontremo-nos nas aldeias, no vale de Ono". Porém

intentavam fazer-me mal. Enviei-lhes mensageiros a

dizer: "Estou fazendo grande obra, de modo que não

poderei descer; por que cessaria a obra, enquanto eu a

deixasse e fosse ter convosco?" Quatro vezes me

enviaram o mesmo pedido; eu, porém, lhes dei sempre a

Sambalate e Gesém insistiram, tentando distrair Neemias. Mas Neemias permaneceu firme, concentrado no que Deus lhe havia ordenado fazer. Ele não se deixaria deter da sua missão.

O inimigo quer nos desviar para nos tornar ineficazes no nosso trabalho. Satanás não tentará isto apenas uma vez. Ele é persistente. Precisamos ter uma determinação mais forte do que ele. E por isso que a Bíblia diz que devemos "resistir-lhe, firmes na fé" (1Pe. 5:9). A palavra firme significa "forte e imóvel". Muitas pessoas desistem depois de alguns golpes do inimigo em vez de permanecerem imóveis até que a vitória seja completa.

Sambalate enviou seu servo uma quinta vez a Neemias, desta vez com uma carta que o acusava de estar em rebelião e de se posicionar como rei de Judá (Ne. 6:5-7). Esta era uma mentira deslavada.

Mesmo assim, Neemias não se deixou paralisar. Ele estava muito concentrado para ser desviado por calúnias. Freqüentemente somos desviados da rota por tentarmos suavizar as coisas com um inimigo que está tentando nos intimidar. Já tive de olhar para algumas pessoas e dizer: "Por que você está permitindo que as mentiras desta pessoa afetem o que Deus o chamou para fazer? Só porque ela está acusando você, isto não significa que ela está certa ou que deseja a verdade! Você precisa saber o que Deus diz sobre você e o plano Dele para você. Por que tentar racionalizar tom a insensatez?" A Bíblia diz: "Não respondas ao insensato segundo a sua estultícia, para que não te faças semelhante a ele" (Pv 26:4). A última pessoa que tentou paralisar Neemias foi um homem que profetizou que ele devia buscar refúgio no templo, porque o inimigo estava vindo para matá-lo (Ne 6:10). Mas se Neemias deixasse o local da obra,aquilo enfraqueceria os homens e impediria a obra de ser concluída.

Neemias respondeu:"Homem como eu fugiria? E quem há, como eu, que entre no templo para que viva? De maneira nenhuma entrarei" (Ne 6:11). Neemias percebeu então que Deus não havia enviado aquele homem: ele pronunciara aquela profecia contra Neemias porque Tobias e Sambalate o haviam contratado. Agora veja o que Neemias disse depois disto:

Ele tinha sido pago para me intimidar, a fim de que eu

cometesse um pecado agindo daquela maneira, e então

eles poderiam difamar-me e desacreditar-me.

O inimigo pode lhe dar uma má reputação intimidando-o para que você se proteja a qualquer custo. Neemias tinha a mente do Senhor; por isso, ele podia discernir o que era puro e verdadeiro do que era mal e enganoso. Neemias resumiu os estratagemas de Sambalate, Gesém e Tobias da seguinte forma:

Estavam todos tentando intimidar-nos, pensando: "Eles

serão enfraquecidos e não concluirão a obra". Eu,

porém, orei pedindo: "Fortalece agora as minhas mãos!"

Vemos mais uma vez o propósito da intimidação: enfraquecer-nos para que não consigamos realizar a vontade de Deus e não resistamos mais ao intimidador. Se não nos levantarmos contra isto com firmeza, sucumbiremos.

O diabo, nosso inimigo, tenta muitos caminhos diferentes de intimidação quando invadimos o seu território. Ele não tenta uma vez e depois desiste. Se ele conseguir nos paralisar, nos enfraquecer ou nos atrasar, nesse caso ele impede o reino de Deus de avançar.

Neemias e seus homens terminaram a construção dos muros. Agora, cercada por proteção, a cidade estava a caminho da restauração. Não foi difícil. Uma tremenda resistência e oposição se levantaram contra eles em cada passo do caminho. Mas o povo sabia que Deus havia falado, e se recusou a recuar. Rompendo a Resistência

A tenacidade de Neemias é um exemplo clássico do que os crentes são exortados a fazer:

Não que eu o tenha já recebido ou tenha já obtido a

perfeição; mas prossigo para conquistar aquilo para o

que também fui conquistado por Cristo Jesus.

A palavra chave é prossigo, que no original significa "avançar energicamente apesar das dificuldades". Se Paulo disse por meio do Espírito Santo, "avanço energicamente apesar das dificuldades", então, como no caso de Neemias, vemos que ele enfrentou resistências com freqüência. Nós não tropeçamos na resistência, ao contrário, precisamos avançar contra ela. Paulo prosseguiu dizendo: Apresso-me em direção ao alvo, a fim de ganhai o

prêmio da convocação celestial de Deus em C!Cristo

Há um alto chamado e um chamado inferior. O alto chamado e uma vida que é vivida na terra de acordo com os padrões do céu; é ver o reino de Deus manifesto através de uma vida individual. As pessoas que vivem no alto chamado controlam o seu ambiente. Permanecendo na sua autoridade, elas transformam a atmosfera espiritual que passa da opressão para a liberdade.

As trevas não podem vencer a luz. A luz expulsa as trevas. Quanto mais brilhante a luz, mais as trevas são desalojadas. É assim que acontece quando andamos na autoridade do reino de Deus. Colocamos o nosso ambiente sob o governo de Deus.

Jesus podia comer com pecadores porque Ele controlava a atmosfera. Se você é mais forte em Deus do que o incrédulo no diabo, você controlará a atmosfera. Se um pecador é mais dominante no mal do que o crente na justiça, o incrédulo controlará o ambiente espiritual.

Quando você decide viver no alto chamado, enfrentará oposição e resistência. "Ora, todos quantos querem viver piedosamente em Cristo Jesus serão perseguidos" (2Tm. 3:12). Mais uma vez, nos é dito: "Através de muitas tribulações, nos importa entrar no reino de Deus" (At. 14:22).

No entanto, muitos cristãos se contentam com o chamado inferior e vivem de acordo com ele. Por quê? Eles não querem enfrentar a resistência que acompanha o avançar energicamente em direção ao alto chamado. Eles preferem se conformar com o ambiente que os cerca do que transformá-lo por meio da confrontação segundo Deus. E muito mais fácil se misturar aos outros do que resistir a eles. Quando se deparam com a oposição, alguns se contentam em fazer concessões e em buscar o caminho da menor resistência.

Creio que a nossa má vontade em resistirmos pode ser parcialmente atribuída à facilidade

cuidadosamente o nosso estilo de vida a fim de evitarmos qualquer forma de dificuldade. Não que eu defenda as dificuldades voluntárias, mas creio que confiamos mais nos nossos planos e programas do que em Deus. Temos seguros de vida, de saúde e de carro. Se adoecemos, corremos para o médico sem orar primeiro, sabendo que o nosso seguro cobrirá os custos. Nossos empregos nos dão um contracheque no final de cada mês. Se perdemos nossos empregos, podemos recorrer ao auxílio-desemprego. Se esse seguro se esgotar, temos a aposentadoria. Se não conseguirmos a aposentadoria, podemos encontrar algum outro programa que cuide de nós — talvez até um que remunere a preguiça. A televisão também encoraja o nosso estilo de vida passivo. O povo norte- americano assiste em média cerca de vinte e quatro horas de televisão por semana!1 Permitimos que as redes de comunicações e Hollywood pensem por nós. Nossas idéias são formadas pelo que absorvemos de suas programações. Os fornos de micro-ondas e as redes de fast-food nos prometem comida instantânea com pouco ou nenhum sabor. Algumas até garantem uma refeição grátis se a comida não for servida dentro de quinze minutos. Temos correio noturno, lavagem a seco em uma hora, revelação de fotos em uma hora, lubrificação rápida para carros e acesso às notícias mundiais 24 horas - e estas são apenas algumas das conveniências disponíveis para nós.

A maioria delas é positiva; elas têm o objetivo de nos liberar para buscarmos aquilo que é realmente importante. No entanto, muitas vezes falhamos em escolher o que é importante. Muitas pessoas hoje em dia não buscam alguma coisa se tiverem de se esforçar muito para obtê-la.

Infelizmente, esta mentalidade se infiltrou na nossa igreja ocidental. Poucos cristãos possuem o caráter persistente e determinado necessário para obter o alto chamado de Deus. Quando se deparam com a oposição, eles se voltam para o caminho da menor resistência. A princípio, esta rota de fuga parece ser uma boa escolha, com sua promessa de facilidade. Mas este caminho é pavimentado com as características da mornidão: concessão, apatia e autopreservação. Jesus nos instruiu a confrontarmos as montanhas da adversidade, e assim elas serão removidas. Em outras palavras: Exploda a montanha, ainda que tenha de fazê- lo pedra por pedra! Como Neemias, os verdadeiros guerreiros em Cristo avançam energicamente em direção às montanhas, confiantes de que nada é impossível àqueles que crêem (Mt. 17:20). Ao contrário, os que viajam pelo caminho da facilidade andam em volta de suas montanhas para evitar o confronto. O fluxo do sistema deste mundo é estabelecido pelo príncipe da potestade do ar (Ef. 2:2). O domínio dos céus está em oposição direta a este fluxo. Seguir o caminho do céu significa que enfrentaremos confrontos constantes por parte do sistema deste mundo. Infelizmente, este sistema mundano prevalece também nas nossas igrejas. Comparo esta oposição a remarmos um barco contra a corrente de um rio que corre rapidamente.Você precisa avançar continuamente contra o fluxo da água. Os seus remos devem estar firmemente posicionados na água, e você precisa continuar a remar.Você não pode esmorecer nem por um minuto. Se o fizer, pode continuar seguindo corrente acima por algum tempo por causa do impulso, mas logo estará descendo o rio. O seu barco pode ainda estar virado corrente acima, mas você estará indo corrente abaixo. Isto ilustra o que acontece quando os crentes não avançam. Eles ainda estão apontando na direção do Cristianismo, mas agora estão fluindo de volta para o mundo. Eles se tornam religiosos. Perdem o seu poder e passam a ser ineficazes. Citando as palavras exatas de Jesus, eles "para nada mais prestam" (Mt. 5:13)!

Depois que Paulo exortou Timóteo para avivar o dom de Deus, ele rapidamente acrescentou: "Tu, pois, filho Meu, fortifica-te na graça que está em Cristo Jesus" (2Tm. 2:1). Para avançar e vencer a intimidação, precisamos ser fortes. Do mesmo modo, Paulo advertiu a igreja de Corinto: "Sede vigilantes, permanecei firmes na fé, portai-vos varonilmente, fortalecei-vos" (1Co. 16:13). Um crente corajoso enfrenta situações difíceis sem recuar diante delas. Deus encorajou Josué não uma vez, mas sete vezes, para ser forte e ter bom ânimo!

Tão somente sê forte e mui corajoso, para teres o

cuidado de fazer segundo toda a lei que meu servo

Moisés te ordenou; dela não te desvies, nem para a

direita nem para a esquerda, para que sejas bem-

sucedido por onde quer que andares.

Observe que Deus disse para ele ser forte e muito corajoso. Com que propósito? Para vencer guerras ou para ser um grande líder? Não, com o propósito de guardar a Palavra do Senhor. Deste modo,Josué seria um grande líder e ganharia todas as guerras! A intimidação tenta arrancar de você a sua liberdade de obedecer a vontade ou a palavra de Deus. Por isso, devemos ser fortes e corajosos em todo o tempo para que não venhamos a nos desviar inconscientemente do que sabemos ser certo.

Vamos definir a palavra coragem:

A atitude ou reação de enfrentarmos e lidarmos com qualquer coisa que seja reconhecidamente difícil, perigosa ou dolorosa em vez de recuarmos diante dela.2 Agora, qual é o contrário de coragem? Você poderia automaticamente supor que o contrário de coragem é medo ou fraqueza. E isto é verdade, até certo ponto. Entretanto, se acrescentarmos o prefixo dis à palavra courage em inglês, temos a palavra discourage, que significa desânimo. Assim, vemos que Deus ordenou a Josué, e a nós, que fôssemos fortes e corajosos, não permitindo que o desânimo entre em nosso coração. O desânimo nos impede de cumprir a vontade de Deus! Vamos definir desânimo:

Privar de ânimo; tornar menos confiante ou esperançoso; desencorajar. Você se lembra de como Elias ficou oprimido pelo desânimo por causa da intimidação de Jezabel? Ele recuou e fugiu. Ele estava tão desencorajado que foi destituído da sua autoridade. Precisamos tratar o desânimo como um inimigo. Nós subestimamos o poder que o desânimo tem de nos impedir de cumprirmos o alto chamado de Deus. Se Deus diz a Josué sete vezes para ser forte e corajoso, então nós também devemos dar atenção a isso. O desânimo é um assassino! Se não for confrontado, ele fará com que nós recuemos.

Todavia, o meu justo viverá pela fé; e: se retroceder,

nele não se compraz a minha alma.

E importante entender que Deus não se agrada dos covardes. Sabemos que: "O vencedor herdará estas coisas, e eu lhe serei Deus, e ele Me será filho. Quanto, porém, aos covardes, aos incrédulos, aos abomináveis, aos assassinos, aos impuros, aos feiticeiros, aos idolatras e a todos os mentirosos, a parte que lhes cabe será no lago que arde com fogo e enxofre, a saber, a segunda morte" (Ap. 21:7-8, ênfase do autor).

A palavra covarde significa "alguém que demonstra um medo desprezível diante da dor ou do perigo". Não é sério saber que Deus inclui os covardes no mesmo grupo dos assassinos e dos sexualmente imorais? No entanto, nós nos desculpamos, afirmando que o comportamento covarde é uma fraqueza. Na verdade, a covardia vem da incredulidade. E a incredulidade custou aos filhos de Israel a vida deles. Eles nunca entraram na terra prometida. "Vemos, pois, que não puderam entrar por causa da incredulidade" (Hb. 3:19). Hoje não é diferente. Um covarde não conquista. Ele não receberá aquilo que é prometido. O Senhor nos exortou com firmeza através do apóstolo Paulo: Vivei, acima de tudo, por modo digno do evangelho de

Cristo, para que, ou indo ver-vos ou estando ausente,

ouça, no tocante a vós outros, que estais firmes... e que em nada estais intimidados pelos adversários.

Permaneça firme e não permita que os seus adversários o aterrorizem. Seja corajoso, forte e bravo, pronto para enfrentar e lidar com qualquer oposição em vez de recuar diante dela! No versículo seguinte, Paulo prossegue: Porque vos foi concedida a graça de padecerdes por

Cristo e não somente de crerdes Nele.

Que sofrimento é este que devemos padecer? Pedro responde dizendo: Ora, tendo Cristo sofrido na carne, armai-vos também

vós do mesmo pensamento; pois aquele que sofreu na

carne deixou o pecado, para que, no tempo que vos resta

na carne, já não vivais de acordo com as paixões dos

homens, mas segundo a vontade de Deus.

O sofrimento que enfrentamos e suportamos ocorre quando a nossa carne ou a influência das pessoas nos pressiona para seguirmos em uma direção enquanto a vontade de Deus para nós significa ir na direção oposta. Somos ordenados a sermos fortes e corajosos para que possamos guardar a palavra do Senhor. Pedro disse que devemos nos armar para isto. Um cristão que não está armado ou preparado para sofrer é como um soldado que vai para a batalha desarmado. Esse soldado será capturado ou morto. Os cristãos que não estão preparados para sofrer são facilmente capturados e mantidos prisioneiros pelo temor do homem - a intimidação.

Devemos esperar nos depararmos com a resistência que acompanha a nossa busca pelo alto chamado; no entanto, Paulo foi rápido em dizer confiantemente: "O Senhor me livrará também de toda obra maligna e me levará salvo para o Seu reino celestial. A Ele, glória pelos séculos dos séculos. Amém!" (2 Tm 4:18). Deus sempre nos livrará e nos levará para a Sua glória. Aleluia!

Leia com atenção as seguintes exortações da Palavra de Deus. Leia- as como se você nunca as tivesse visto antes. Pare e dedique tempo para meditar com atenção em cada palavra, permitindo que o Espírito Santo as ilumine.

Se Deus é por nós [mim], quem será contra nós [mim]?

Quem nos separará do amor de Cristo? Será tributação,

ou angústia, ou perseguição, ou fome, ou nudez, ou

perigo, ou espada?... Em todas estas coisas, porém,

somos mais que vencedores, por meio daquele que nos

Filhinhos, vós sois de Deus e tendes vencido os falsos

profetas, porque maior é aquele que está em vós do que

Guarde a pureza do seu coração e permaneça na sua posição de autoridade como filho e servo de Deus. Então, você poderá declarar com ousadia: O Senhor é o meu ajudador; não temerei. Que me poderá fazer o homem?$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Que muralhas em ruínas Deus colocou no seu coração para reconstruir, apesar da resistência e da zombaria daqueles que se opõem?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando o inimigo arma estratagemas para intimidá-lo e fazê-lo parecer tolo, você recua ou prossegue firme para o alvo que Deus determinou?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a vida de Neemias o encoraja a crer que Deus usa o que o homem considera insignificante para realizar o impossível através de você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Epílogo$t$, 16,
$conteudo$Ao encerrar este livro, eu o exorto a nunca permitir que nenhum fracasso anterior o detenha. Não julgue o seu futuro com base nas coisas que lhe aconteceram! Se você fizer isso, jamais superará o seu passado! Não importa quantas vezes você falhou, há uma esperança infalível - Deus é especialista em transformar covardes em campeões! Aleluia! O poder Dele se aperfeiçoa na fraqueza. Como exemplo de encorajamento, veja a vida de André, o irmão de Simão Pedro. Na noite em que Jesus foi preso, "os discípulos todos, deixando-o, fugiram" (Mt. 26:56). Pedro não foi o único que ficou intimidado; André também fugiu para salvar sua vida. Mas este ato singular de covardia não significava que André permaneceria sendo um covarde.

Depois da ressurreição de Jesus, André pregou na Etiópia, que estava sob o governo romano. O que se segue é um relato histórico de como ele glorificou o nome de Jesus:

Quando André, através de sua pregação diligente, levou muitos à fé em Cristo, Aegeas, o governador, pediu permissão ao senado romano para obrigar todos os cristãos a fazerem sacrifícios e a honrarem os ídolos romanos. André achou que devia resistir a Aegeas e foi até ele, dizendo-lhe que um juiz entre os

homens deveria, antes de tudo, conhecer e adorar o seu Juiz no céu. Adorando o verdadeiro Deus, disse André, ele deveria banir todos os falsos deuses e ídolos cegos de sua mente.

Furioso com André, Aegeas procurou saber se ele era o homem que havia recentemente causado a queda do templo dos deuses e persuadido os homens a se tornarem cristãos - uma seita

"supersticiosa" que recentemente havia sido declarada ilegal pelos romanos.

André respondeu que os governantes de Roma não compreendiam a verdade. O Filho de Deus, que veio ao mundo para o bem do homem, havia ensinado que os deuses romanos eram demônios, inimigos da humanidade, ensinando os homens a ofenderem a Deus e fazendo com que Ele virasse as costas para eles. Servindo ao diabo, os homens caem em todo tipo de iniqüidade, disse André, e depois que morrem, nada é lembrado exceto os seus feitos malignos.

O procônsul ordenou a André que não pregasse mais estas coisas ou ele enfrentaria uma crucificação rápida. Ao que André respondeu: "Eu não teria pregado a honra e a glória da cruz se temesse a morte da cruz". Ele foi condenado a ser crucificado por ensinar uma nova seita, e por tirar a religião dos deuses romanos.

André, indo em direção ao lugar da execução e vendo a cruz que o esperava, nunca mudou sua expressão. Nem enfraqueceu em seu discurso. Seu corpo não esmoreceu, nem sua razão lhe falhou, como geralmente acontece aos homens que estão para morrer. Ele disse: "Ó cruz, tão ansiada e desejada! Com uma mente disposta, alegremente e desejosamente, vou a ti, sendo o aluno Daquele que foi pregado em ti, porque sempre fui teu amante e ansiava por abraçar-te". Este não era o mesmo homem que fugiu para salvar sua vida quando Jesus foi preso. Ele havia mudado.

Na verdade, todos os discípulos que haviam fugido acabaram sendo mortos por causa do seu testemunho de Jesus Cristo. Deus concedeu a eles o privilégio de enfrentar exatamente aquilo do que eles haviam fugido. Ao entregarem suas próprias vidas, o poder da intimidação foi quebrado!

Isto deveria consolar você, sabendo "que Aquele que começou a boa obra em vós há de completá-la até o Dia de Cristo Jesus" (Fp. 1:6). O testemunho desses discípulos testifica como Deus transforma os nossos fracassos em vitória! Não recue, mas ouse acreditar Naquele que o amou e Se entregou por você.

Pai, em nome de Jesus, eu Te peço que me fortaleças através do leu amor e sabedoria. Perdoa-me por recuar em momentos de dificuldade para preservar o meu conforto e a minha segurança. Senhor Jesus, neste dia escolho negar a mim mesmo, tomar a minha cruz e Te seguir. Sou Teu servo; recebo a tua graça que me dá poder para que eu possa falar a Tua palavra e realizar a Tua vontade com toda ousadia e amor. Agora, dirija-se ao espírito de temor e controle:

Quebro as palavras de intimidação e controle proferidas sobre a minha vida por mim ou por outras pessoas. Quebro as garras do medo do homem sobre a minha vida. Eu me submeto a Deus e resisto a vocês, espíritos imundos das trevas. Não darei lugar a vocês em minha vida, e assim prossiga em nome do meu Senhor Jesus Cristo. Amém. Ora, àquele que ê poderoso para vos guardar de tropeços e para vos apresentar com exultação, imaculados diante da Sua glória, ao único Deus, nosso Salvador, mediante Jesus Cristo, Senhor nosso,glória, majestade, império e soberania, antes de todas as eras, e agora, e por todos os séculos. Amém!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Há algum fracasso anterior que você tem permitido que o detenha e defina o seu futuro diante de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Você crê que Deus é especialista em transformar covardes em campeões e que o poder Dele se aperfeiçoa na sua fraqueza?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a história de André, que de fugitivo intimidado se tornou um mártir destemido, o inspira a não julgar o seu futuro pelo seu passado?$p$, 'reflexao', null);
  end if;

end $migration$;
