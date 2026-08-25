-- O Pastor Imperfeito (Zack Eswine) — reextração do PDF-fonte.
--
-- A carga anterior veio de uma extração corrompida: comia o "s" das passagens em
-- itálico, trocava versaletes por glifos Sinhala, duplicava 8 capítulos (aulas de
-- ordem 20 a 27 repetiam o texto das de ordem 3 a 12), despejava a bibliografia
-- inteira numa aula de 205 mil caracteres e não tinha o capítulo 16.
--
-- Esta migration reescreve o livro inteiro a partir do PDF (script
-- scripts/gerar-pastor-imperfeito.py): 23 mesas na ordem do sumário, incluindo as
-- quatro aberturas de parte e o capítulo 16. As 19 aulas legítimas são
-- REAPROVEITADAS pelo id (o progresso e as matrículas dos alunos sobrevivem); as
-- 9 aulas-lixo são apagadas. Todo audio_leitura_url é zerado — o áudio existente
-- foi narrado em cima do texto corrompido e precisa ser regerado.

do $migration$
declare
  v_curso_id uuid;
  v_aulas int;
begin
  select id into v_curso_id from public.cursos where slug = 'o-pastor-imperfeito';
  if v_curso_id is null then
    raise exception 'curso o-pastor-imperfeito não encontrado';
  end if;

  update public.cursos
  set titulo = $titulo$O Pastor Imperfeito$titulo$,
      descricao = $desc$Leitura guiada de O Pastor Imperfeito, de Zack Eswine. Em vinte mesas, o autor trata das tentações do ministério — querer estar em todo lugar, consertar tudo, saber tudo e resolver tudo agora — e propõe um caminho de volta ao ritmo humano e local do próprio Jesus: cuidar dos enfermos e dos pecadores, conhecer o próprio lugar e liderar sem pressa. Cada mesa traz a transcrição do texto, sem perguntas de reflexão.$desc$,
      imagem_url = '/capas/o-pastor-imperfeito.jpg',
      categoria = 'ensino',
      publicado = true,
      audio_status = 'nenhum',
      audio_progresso = 0,
      audio_total = 20,
      audio_falhas = 0,
      audio_lock_ate = null,
      audio_pronto_em = null
  where id = v_curso_id;

  -- 1) fora as aulas-lixo da extração velha (duplicatas + bibliografia)
  delete from public.aulas where curso_id = v_curso_id and ordem >= 20;

  -- 2) desloca as legítimas pra faixa negativa, pra remapear a ordem sem colidir
  update public.aulas set ordem = -ordem where curso_id = v_curso_id and ordem > 0;

  -- 3) reescreve cada mesa (update reaproveita o id; insert só onde faltava)
  -- Agradecimentos (reaproveita a aula de ordem 1: preserva o progresso)
  update public.aulas
  set titulo = $t$Agradecimentos$t$,
      ordem = 1,
      conteudo =
$conteudo$Quero agradecer a Dave Dewit, cujo coração em favor de líderes no ministério e dedicação a este livro me humilha e encoraja. Obrigado também a Lydia Brownback por seu trabalho de edição.

Sou grato à Bruwer Vroon, Matt Blazer, e aos presbíteros da igreja de Riverside que leram os esboços iniciais e fizeram sugestões. Obrigado, Jessica, pelas muitas leituras que fez tarde da noite e aos sábados. Sua sensibilidade, sugestões e seu estímulo em nossa mútua parceria me abençoam.

Sou grato à Igreja de Riverside, de cujo contexto de cotidiana vida mútua e de meios comuns eu escrevo este livro.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -1;

  -- Apresentação à Edição em Português (reaproveita a aula de ordem 2: preserva o progresso)
  update public.aulas
  set titulo = $t$Apresentação à Edição em Português$t$,
      ordem = 2,
      conteudo =
$conteudo$Lidando com o aconselhamento pastoral por alguns anos, tenho percebido que muitos dos grandes problemas que enfrentamos parecem resultar de uma equação simples e binária: Não queremos Deus e queremos ser Deus. No fim das contas, o verso e reverso de uma mesma moeda. A marca registrada da impiedade humana, a qual, desde as suas raízes, caracteriza-se ativamente por estultícia, soberba e idolatria. Em rigor, a impiedade que acometeu os seres humanos é isto, a saber, o desprezo a Deus, que se manifesta em virar as costas para ele e tentar assumir o controle de tudo.

A lógica falida de não querer Deus e querer ser Deus, logo percebi, pode também ser uma realidade muito fortemente ativa em mim, pastor e conselheiro. Se você, leitor, pastoreia um rebanho de Cristo, suponho que entende o que estou tentando dizer. Nós, pastores, estamos constantemente sujeitos à tentação tão antiga quanto a astuta serpente no jardim: “É certo que não morrereis. Porque Deus sabe que no dia em que dele comerdes se vos abrirão os olhos e, como Deus, sereis conhecedores do bem e do mal.” (Gn 3. 4b-5).

O único pastor perfeito, Jesus Cristo, sofreu um ataque semelhante. No quarto capítulo do Evangelho de Mateus, lemos que ele foi levado pelo Espírito ao deserto, para ser tentado pelo diabo. Vemos neste texto três áreas de tentações frequentes no ministério pastoral.

“Manda que estas pedras se transformem em pães” (v. 3). Jesus estava com fome. “Supra sua necessidade física”, foi o conselho do maligno. A tentação para ser imediatista, por atender as necessidades do momento, suprir o povo naquilo que este julga ser as suas mais sérias e importantes necessidades... Em suma, agir inteiramente referenciado por interesses pessoais. Isso atinge o centro de nossa identidade. Trata-se de uma tentação muito sutil, pois não é prontamente reconhecida como tal. Geralmente, trocando alhos por bugalhos, confundimos esta tentação como sendo um chamado de Deus. E nos indagamos: “Afinal de contas, o Senhor não quer que alimentemos o povo?” “Ele não quer que sejamos produtivos e eficientes em nosso trabalho?”

Assim, pensar em um ministério que lance raízes, que trabalhe sistemática e perseverantemente a fim de ver vidas serem transformadas, que seja constante e diacrônico na pregação e no discipulado cotidiano, enfim, tudo que exija o concurso de tempo para o amadurecimento, pode ser inconcebível para alguns de nós. Há alguns, em nossa atual geração de pastores, que têm imensa dificuldade com processos lentos, que exigem dedicação e esforço e que não trazem resultados imediatos.

“Então o diabo o levou à Cidade Santa, colocou-o sobre o pináculo do templo. E lhe disse: Se és filho de Deus, atira-te abaixo, porque está escrito: aos seus anjos ordenará a teu respeito, que te guardem...” (vv. 5-6). Assim, a tentação para se realizar algo espetacular não diminui desde os tempos de Jesus. Imagine o espetáculo que seria Jesus pulando do alto do templo e os anjos apressando-se em segurá-lo nos céus. Este cenário teria toda uma atmosfera Hollywoodiana. Em nossos ministérios, também podemos ser seduzidos pelo ideal de sucesso reluzente ao custo da fidelidade. Certamente, queremos ser bem sucedidos. Mas o que isto significa? A realidade é que podemos ter nesta área referenciais absolutamente mundanos, secularizados, e tomá-los como sinais indiscutíveis de bênção e evidente aprovação de Deus.

Pare um pouco e pense na história do povo de Deus, e sobretudo na pessoa de Jesus Cristo, o melhor dos pastores. Pode ser difícil lembrarmos que a salvação vem do “remanescente de Israel”; do “renovo que brota de uma terra seca”. É difícil acreditar no nascimento despretensioso do Rei dos reis, que veio ao mundo como servo, entrou em Jerusalém montado num pequeno jumentinho, morreu em uma cruz ao lado de ladrões e como um criminoso amaldiçoado e proscrito. Quando lemos o livro de Atos dos Apóstolos, constatamos que o evangelho se espalhou e tomou força pela pregação de “homens comuns”, de “pescadores incultos”, e de um outrora fariseu, perseguidor da igreja, que foi o apóstolo Paulo. E o poder de Deus aperfeiçoou-se em meio àquelas fraquezas, a fim de que a glória fosse inteiramente do Senhor.

Um incansável missionário norte-americano no Brasil, certa ocasião, escreveu oferecendo um alerta: “É importante compreender que nossa ânsia pelo espetacular é mais uma manifestação de nossa busca por identidade. Queremos ser alguém, queremos ser celebrados, ter ministério reconhecido. Se o espetacular cumpre nossa necessidade íntima, faremos qualquer coisa para conseguilo.” Porém, o que realmente importa? Quem realmente somos? O que nos motiva a provarmos o nosso valor por meio daquilo que fazemos? Nós pastores sabemos que o cenário do ministério pastoral evangélico, tristemente, pode ser caracterizado por competições, manipulações e comparações ministeriais. Aqui neste livro temos um chamado a “permitir” que o poder de Deus se evidencie através de nós, que somos frágeis vasos de barro, por meio de nossa fraqueza e pequenez.

“Levou-o ainda o diabo a um monte alto, mostrou-lhe todos os reinos do mundo e a glória deles, e lhe disse: tudo isso te darei se prostrado, me adorares” (vv. 8-9). Penso que entendemos ser esta uma tentação contínua no ministério pastoral. Com alguma frequência, nos encontramos persuadidos de que a busca de poder e o desejo de servir têm o mesmo significado. Em um contexto assim, facilmente os fins podem justificar os meios, atendendo ao nosso desejo de sermos mais eficazes no trabalho de Deus. Indagamos intimamente: “Que valor há em não termos poder, em não causarmos impacto?”.

Nos momentos em que nos virmos sujeitos a tal realidade, ajudanos lembrarmos que o ministério é servir ao Senhor dependendo do seu poder e não do nosso. No reconhecimento de nossa fraqueza e vulnerabilidade nos tornamos mais dependentes da graça de Deus, e mais agradecidos por ela, ao mesmo tempo em que somos levados à empática posição de nos tornamos solidários ao próximo. Quando o Senhor Jesus Cristo foi tentado, respondeu: “Ao Senhor teu Deus adorarás, e só a ele darás culto” (v. 10b). Estas palavras nos lembram que vamos nos tornando parecidos com aquilo que adoramos, e constituem-se em alerta para que, em nosso ministério, tenhamos os olhos fixos em Cristo. Quando deixamos de olhar para Jesus, podemos ser facilmente conduzidos a usar pessoas, manipular circunstâncias, armar situações para alcançar os nossos objetivos, e entrar em vergonhosas e patéticas disputas de poder.

Nunca ficaremos livres destas tentações em nosso ministério. Elas são constrangedoras e sedutoras por atingirem a nossa ambição e prometerem satisfazer a ilusão do ser humano egocêntrico. Eu e você podemos servir ao Senhor com o coração puro e autêntico. Eu e você podemos servir sem que dependamos, em todo tempo, de que o nosso valor seja referenciado pelo meio – e se há uma verdade acerca do meio é que ele é instável e caprichoso. E se o Senhor nos conceder aquela graça, então estaremos mais livres. E desfrutar do oxigênio dessa liberdade, provocará uma alegria profunda em servir ao nosso Deus com um coração inteiramente voltado para ele.

O triste fato, porém, é que reconhecidamente chegamos até aqui com uma história de fracassos nessas áreas. Cristo, que foi vitorioso nestas tentações tão prementes, é o único pastor perfeito. Ele é o “supremo pastor e bispo” de nossas almas que, por natureza, são carentes e mesquinhas. Digno é o cordeiro! Sim. Nós, assim como Pedro e Paulo, somos todos pastores imperfeitos, com histórias de fracassos para contar.

O Pastor Imperfeito é o segundo livro de Zack Eswine publicado em português. O primeiro foi A Depressão de Spurgeon (Fiel, 2015). O Senhor me conferiu a oportunidade honrosa de revisar e prefaciar a ambos. O Dr. Zachary W. Eswine foi por seis anos professor assistente de Homilética e diretor do programa de Doutorado no Covenant Theological Seminary, em St. Louis, Missouri, nos Estados Unidos. Atualmente, ele conduz o ministério pastoral em uma igreja na mesma cidade. Eswine é também o autor de alguns outros livros, inclusive de um acerca do método de pregação de Spurgeon — Kindled Fire: How the methods of C.H. Spurgeon can help your preaching.

Em O Pastor Imperfeito, Eswine faz pulsar, com uma sonoridade simples porém vibrante, o seu “coração de pastor”. Com acolhedora ternura, sensível compaixão e graciosa firmeza, ele situa o chamado que seguimos, reposicionando-nos em nossa humanidade. A seguir expõe a insensatez de engrossarmos as tipologias ministeriais que refletem o padrão de não querer Deus e querer ser como Deus. Na terceira parte do livro, faz uma chamada à reformulação de nosso mundo interior, por situarmos as nossas ambições em perspectivas divinas e realistas. A parte final do livro é dedicada a uma reformulação do trabalho pastoral cotidiano, de uma forma prática e balizada instrumentalmente por discernimento, critério e medida.

O Pastor Imperfeito, penso eu, é oportuna contribuição à teologia pastoral, e particularmente à poimênica evangélico-reformada. Ele nos será muito útil, os quatro presbíteros de nossa igreja, pois pastores imperfeitos é o que somos, embora nem sempre estejamos lembrados ou crendo nisto. Como João Batista, eu precisarei relembrar a mim mesmo, aos meus colegas e à nossa preciosa congregação: “Eu não sou o Cristo”.

Gilson Santos$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -2;

  -- Introdução (reaproveita a aula de ordem 3: preserva o progresso)
  update public.aulas
  set titulo = $t$Introdução$t$,
      ordem = 3,
      conteudo =
$conteudo$Tornei-me pastor. Mas eu não sabia como ser um deles.

A Serpente viu isso. Aproveitou a oportunidade. “Você pode ser como Deus”, disse ela. E eu, tolo, acreditei.

Olhando atrás, para esses vinte anos de trabalho pastoral, vêm à minha mente as palavras de um poeta. Elas preparam o palco para a conversa que quero ter com você.

É muito provável, arrazoa o pregador,

Que você esteja mais disposto a escutar

Agora que sua cidade desmoronou de onde estivera.1

Estou escutando mais. Convido você, em sua cidade derribada, a juntar-se a mim.

Quando comecei não sabia que a vocação pastoral em Jesus traria limites, faria com que eu andasse mais devagar, e desmancharia, dolorosamente, a mal direcionada orientação de minha vida. Agora sei que meu sucesso e minha alegria como pastor dependem disso.

O seu também. Carl Dennis, “Smaller”, em Unknown Friends [Amigos desconhecidos], (New York: Penguin Poets, 2007), 16.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -3;

  -- PRIMEIRA PARTE | A Chamada que seguimos (reaproveita a aula de ordem 4: preserva o progresso)
  update public.aulas
  set titulo = $t$PRIMEIRA PARTE | A Chamada que seguimos$t$,
      ordem = 4,
      conteudo =
$conteudo$SEGUIMOS

Vocação

O lugar que ele nos dá para habitar.

O pouco que ele nos dá para fazer naquele lugar.

As pessoas a quem convida para que conheçamos ali.

Esses nossos dias,

em que continuamos por aí.

Basta então,

essa velha obra de mãos

Dele e nossa

para aqui amar,

para aprender aqui a sua canção, como grilos que arranham

e cantam,

dos recantos invisíveis,

continuando a fazer

aquilo para o que foram criados,

a arte noturna de

faces não notadas,

com nossas asas não observadas, até que, mais uma vez, ele caminhe

no frescor do dia,

para reclamar nossos nomes.

E nós então,

com nossas bandeiras brancas costuradas,

estaremos por trás de suas sempre verdejantes,

finalmente deixando o lugar escondido

e com ele

mais uma vez caminhando juntos.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -4;

  -- 1 | Desejo (reaproveita a aula de ordem 5: preserva o progresso)
  update public.aulas
  set titulo = $t$1 | Desejo$t$,
      ordem = 5,
      conteudo =
$conteudo$Ele pensa somente naquilo que deseja e não se pergunta se deveria desejar isso.

– Bernardo de Claraval

Eu me lembro de estar sentado no estacionamento, em uma mesa de piquenique na casa de meus avós em Henryville, Indiana. Estava no terceiro ano de meu primeiro pastorado. Tirara uma breve licença de estudo para escrever meu primeiro artigo para uma publicação ministerial. Mamaw, feliz com a minha visita mais longa, fez o bolo de especiarias que sempre fazia quando eu vinha à sua cidade. Pegando minha caneta e olhando rua abaixo, senti o que qualquer pessoa com certeza sentiria quando começa a realizar aquilo que sabe que foi feita para fazer — o nobre prazer de sentir que, de alguma forma, basta a nós esse dia, que o dia não pode nos conter porque brilharemos mais que ele. No meu caso, sentia um crescente desejo de escrever algo significativo para os pastores. Queria que fosse algo excepcional.

Naquela semana sabática, devorei o assunto que mais me empolgava na época — os primórdios do Seminário Princeton e a pregação. Isso provavelmente soa irritante ou incrivelmente maçante para algumas pessoas. Mas, para mim, o assunto era como o bolo de especiarias da Mamaw. O primeiro reitor de Princeton, Archibald Alexander, bem como o seu filho, pareciam ter tanto para dizer, e isso alimentou minha alma com respeito à pregação. Ofereciam alimento deleitoso para o pastor ferido em que eu estava me tornando. Fazendo uma retrospectiva, penso que mesmo sendo novo no ministério, eu já estava profundamente cansado.

De alguma forma, no entanto, aquele sentimento de estarmos realizando algo significativo pode fazer com que nos enganemos, ao ponto de acharmos que as coisas na verdade não são tão ruins quanto parecem. Uma boa lembrança pode se juntar a esse sentimento e, juntos, eles alimentam um refúgio de esperança. Dr. Calhoun compartilhou com regularidade sua sala de estar e uma xícara de chá. Com o passar dos meses, ele transmitira o amor que sentia pelo velho Princeton para mim (e para outros). Tendo tal memória jungida à oportunidade de escrever, e o bolo de especiarias da Mamaw à minha frente, eu me sentia animado. Sempre quis transformar o mundo. Desejava muito fazer isso.

Olhando para trás, eu achava que esse tipo de desejo era para um grande momento épico. (As pessoas excepcionais não são presas a uma vida de momentos nada excepcionais, não é mesmo?) Esses momentos épicos, quando realizados, não deixariam nada ser o mesmo. O próprio céu teria nos tocado. Essa ideia de uma grande arremetida flertava com os meus desejos. A aspiração épica começou a andar de mãos dadas com as minhas tentativas de pregar.

Não estava só nisso. Os meus colegas que se formaram comigo no seminário partilhavam desses mesmos anseios e sonhos. E em minha mente isso não era irracional. Afinal, os meus professores e colegas de estudo reconheciam publicamente a minha pregação e afirmavam meus dons. Eu também tinha lido sobre como Deus atendera a pregadores com o seu Espírito no passado, e desejava que ele fizesse o mesmo conosco no presente. Mas depois de dois anos em minha primeira igreja, toda a minha pregação parecia apenas dar às pessoas um motivo para visitar e escolher outras igrejas.

Passei, portanto, a desejar o encontro de um momento épico fora do púlpito. Tentaria pastorear pessoas com este grandioso fim. Porém, o nível de conflito existente entre meus presbíteros me deixava atônito. Eu estava chegando àquele pedaço da estrada no deserto que a maioria dos pastores novos têm de passar nos primeiros dois a quatro anos de um novo chamado — o deserto em que a maioria de nós desiste. Mas naquela época eu não percebia. Nem percebia o grande quebrantamento que uma pequena igreja consegue suportar. Naquele tempo, eu não compreendia o que agora estou compelido a dizer. Os pastores não são diferentes de outras pessoas. Nós também nos “perdemos em nossos anseios”.2

Desejo

A Serpente sabe disso. As árvores do jardim eram desejáveis, boas e agradáveis aos olhos (Gn 2.9). Entretanto, quando Eva viu aquela árvore única, desejou-a de modo torto. Ela e Adão procuraram consumi-la à parte de Deus, apesar do propósito declarado para aquela árvore (Gn 3.6). Queriam algo desejável, mas do modo errado. É possível que façamos o mesmo no ministério.

Não se engane. O desejo é um fogo de artifício. Manuseado com sabedoria, enche o céu da noite com luz, cor, beleza e deleite. O desejo mal manuseado pode queimar e incendiar toda a sua vizinhança (Tg 4.1–2).

Conheço em primeira mão a beleza e o incêndio criminoso dos desejos ministeriais. Sei o que é ficar perdido nesses desejos e precisar ser reencontrado em Jesus. Eu era um desses caras a quem as pessoas diziam: “Você é um dos melhores pregadores que já ouvi, e é tão jovem — mal posso esperar ouvi-lo daqui a dez anos”. Bem, há muito se passaram dez anos e eu não me tornei aquilo que foi projetado antes.

Não falo isso com morbidez. Espero que você logo perceba que escrevo como quem sente profundamente ter sido resgatado de si mesmo pela abundante graça de Jesus. As águas insalubres da celebridade, consumismo e gratificação imediata haviam infiltrado a água que eu bebia. Meus desejos pastorais tinham se maculado sem que eu percebesse. Muitos de nós não percebemos. Nós e nossas congregações sofremos por isso.

Portanto, estabeleçamos o fato de que a vocação pastoral começa com o desejo. O apóstolo Paulo diz o seguinte: “Fiel é a palavra: se alguém aspira ao episcopado, excelente obra almeja (1Tm 3.1). Pedro concorda: “pastoreai o rebanho de Deus que há entre vós, não por constrangimento, mas espontaneamente, como Deus quer; nem por sórdida ganância, mas de boa vontade” (1Pe 5.2).

Reflita comigo por um momento. Quando foi que você tornou conhecido o seu desejo pelo ministério pela primeira vez? Era mais velho ou mais jovem? A quem você contou? No meu caso, eu estava na segunda série do ensino fundamental da escola Saint Anthony. A Sra. Canter escrevera no quadro de giz: “O que você quer ser quando crescer?”

Eu respondi, e Sra. Canter ajuntou as duas palavras para todos verem: “Zack — Sacerdote”.

Eu ainda não associara o desejo pastoral ao amor por dinheiro (Lc 16.4), contatos para angariar posição (Mt 23.6–7), cobiça por poder (At 8.18–21) ou ao avanço de meu próprio nome. Ainda não sabia que servir a Deus poderia ser usado, até mesmo por mim, como modo de tentar, alinhado com o velho sussurro da Serpente, tornarme como Deus (Gn 3.5). Só sabia, como menino de oito anos, que eu desejava servir a Deus com minha vida em ministério vocacional. Eu não estava inquieto naquela época, nem um pouco. Era maravilhoso.

Desde então, porém, aprendi algo, não como sacerdote, mas como pastor. Existem muitos tipos de desejos atuando neste mundo, e nem todos eles são bons.

E se você for uma montanha sem nome?

Meus desejos começaram a correr atrás de toda espécie errada de mentoria. Fui auxiliar de pastor da juventude em uma igreja pequena, lugar onde iniciei o meu ministério pastoral. O meu pastor gastou horas e mais horas me ensinando por três anos. Mas notei algo. Ao entrar em reuniões regionais regulares de pastores e líderes de igreja, ele e eu entramos calmamente, enquanto outros pastores geralmente entravam na sala com certo estardalhaço.

Eram os pastores de grandes igrejas. Alguns tinham escrito livros, moderado congressos e pregado a milhares de pessoas. Embora anos mais tarde eu viesse a conhecer um pouco dessa espécie de fanfarra, o fiel pastor que foi meu mentor jamais teria essa experiência.

Ao longo do caminho, descobri algumas das razões para isso. Eu fazia parte de uma equipe que oferecia uma conferência anual para pastores. No ano em que tentamos resistir a um pensamento centrado em celebridade, mal conseguimos financiar a conferência. Nossos pregadores eram líderes veteranos, de muito tempo de ministério, mas desconhecidos. Tristemente, as inscrições para essa conferência foram poucas.

No ano seguinte voltamos a obter grandes nomes para que as pessoas viessem. Com certeza, a conferência ficou lotada de gente. Na nossa terra, a experiência e sabedoria do pastor têm pouco valor financeiro, a não ser que ele seja bem conhecido. De onde veio essa ideia? Não sei, mas preste atenção. Essa mensagem gritava alto e claro para mim quando eu era jovem pastor em treinamento.

O que estou tentando dizer a você é que naquela época eu estava com vinte e seis anos, terminando o seminário, e a pureza do meu desejo de servir a Deus por aquilo que ele é, enquanto ainda cursava a segunda série do ensino fundamental, estava se apagando. Estava se tornando bem claro que, se quisesse obter sucesso no ministério, eu precisaria fazer algo grandioso. Eu teria de definir o que seria grande em termos de tamanho, fama e a rapidez com que conseguiria realizar.

Voltando àquelas introduções iniciais, à cultura pastoral, vem à mente uma historieta contada sobre o famoso Richard Foster e seu filho, Nathan. Nathan estava ansioso por conquistar rapidamente as famosas montanhas do Colorado. Enquanto descansava na encosta rochosa de uma dessas montanhas célebres, Richard apontou para o filho a beleza de uma montanha adjacente: “Nate, está vendo aquela montanha? Tem uma cumeeira impressionante. É um pico perfeito. Se tivesse uns poucos metros a mais de altura, você conheceria o nome e desejaria subi-la. Como esta é uma montanha sem nome, ninguém liga para ela”.3

Desejando fazer grandes coisas para Deus

Até o tempo em que estava no terceiro ano do primeiro pastorado, comendo o bolo de especiarias da Mamaw em sua varanda, eu vivia cada dia mais inquieto. Como muitos de meus colegas, ansiava por fazer diferença para Deus na minha vocação — o mais rápido possível. Contraste os sinônimos de comum aos sinônimos para épico, e quem pode culpar-nos?

Aspiro servir como pastor de modo comum, corriqueiro, humano, normal, rotineiro, médio, usual e sem novidades, a pessoas comuns e em nada excepcionais. Ser banal e medíocre como pastor.

Ou,

Aspiro servir como pastor olímpico, incomum, surpreendente. Ser pastor extraordinário e especial em uma congregação maravilhosa, notável, singular, excessivamente grande. Ser estelar e inesquecível como pregador.

Eu me sentia qualquer coisa menos estelar. Quem sabe este artigo seja apenas o começo, pensei. Não sou pastor ou pregador épico. Mas talvez pudesse escrever algo que transformasse o mundo para Deus.

Isso foi há vinte anos. Publiquei o artigo, mas o mundo não mudou e ainda tive de escovar os dentes normalmente no dia seguinte. Nos anos desde então, tenho visto gente vindo à fé salvadora em Jesus, casamentos curados e vícios vencidos. Tenho viajado, pregado e obtive um doutorado. Tenho ensinado, aconselhado, e escrito livros. Jesus tem se revelado tão bondoso, verdadeiro, presente e poderoso a mim. Mas, conforme já mencionei, existe beleza e destruição no desejo. Entre aqueles que participaram de minha ordenação ao ministério tempos atrás, um pastor mentor tirou sua própria vida, e outro já não está no ministério devido à má conduta moral. Um presbítero e um diácono foram dolorosamente disciplinados, um por raivosos maus tratos e o outro por um caso amoroso devastador. Outras amizades acabaram se dissipando entre a feia politicagem dentro do ministério. E doze anos depois de meu juramento público de ministrar no evangelho, meu casamento acabou. A única coisa grande, famosa e veloz a meu respeito e a respeito de muitos de minha turma ministerial era nosso quebrantamento.

Quando falei sobre o desejo pelo ministério na turma de segundo ano da Sra. Canter, jamais imaginei que meu futuro requereria que eu aprendesse a viver como pai solteiro, com a guarda principal dos três filhos, no meio de uma comunidade de “escândalo” e fofocas. Eu tive de olhar longa e profundamente no espelho dos meus próprios desejos contaminados. Estou pedindo-lhe para fazer o mesmo, na esperança de poupar-lhe o custo que paguei. Ser declarado “parte inocente” não removeu os sussurros ou as calúnias, quer em minha comunidade ou em minha própria cabeça. Nem isso removeu o que significa para cada um de meus três filhos, e para mim, aprender diariamente, juntos, a novamente ver o sol e sorrir. Mas, note bem, caso você pense que não é como eu. Tive também de examinar aqueles que projetavam como eu “deveria” me tornar a seus olhos dentro de dez anos. Você terá de lutar com isso também. Temos de analisar friamente o desejo por “coisas grandes, famosas e rápidas” que membros da congregação e lideranças pastorais parecem almejar constantemente. A ausência de nossa atenção a esses desejos mal projetados está nos tornando em um bando maltrapilho.

Agora estou aqui sentado, todos esses anos mais tarde, digitando essas palavras como pastor de uma pequena igreja no Missouri. E uma ironia sussurra aos meus pensamentos. Espero que o que escrevo para você prove ser significativo. Balanço a cabeça e quase dou risada —aquela exalação curta de risada pelo nariz. Engraçado como, antigamente, eu pensava que a significância estaria em algum lugar além de Henryville e da presença de Mamaw — local próximo e amor comum — como se um artigo numa publicação ou um sermão de púlpito pudesse fazer mais para glorificar a Deus em minha geração do que atender com fidelidade a qualquer outro desses dons criativos que Deus deu.

Conversas com um jovem pastor

À luz disso, escute por um momento. Anos depois, do outro lado das ruínas, encontrei-me escutando os desejos de um jovem pastor. Eu me via e escutava nele. Talvez você também se identifique.

“Não importa o que vier, quero me entregar totalmente ao ministério”, disse ele.

A sua paixão me inspirava, mas o contexto me preocupava. Tínhamos acabado de falar sobre a dificuldade dele, como marido e pai, junto a uma dobra recorrente dentro da estrada de sua alma. Respirei fundo e parei, olhando para a tigela de pad thai à minha frente.

“Se o ministério for tudo que almejamos alcançar”, comecei dizendo, “então como definimos ‘o ministério’ parece importante, sabe?” Levei um pouco de comida à boca e mastiguei.

“Só quero pregar a Palavra”, ele declarou. “Não importa o que aconteça, enquanto eu continuar falando o que Deus diz, ele vai me abençoar. Sei que Deus me deu um propósito”.

Havia urgência em sua voz e pressa em seus olhos. Ambos eram como espelho para mim. Enrolei o amendoim e o macarrão em volta de meu garfo (os palitos chineses já haviam começado o trabalho de me humilhar). Eu procurava as palavras.

“Sim, Deus abençoa a sua Palavra”, comecei. “Você tem um propósito”, afirmei.

Demorei mais um pouco com a tigela, tentando achar o que eu deveria deixar de dizer. “Certa vez falei em uma conferência. Preguei cinco vezes. Foi um daqueles momentos quando sentia a presença de Deus de maneira tangível. De fato, depois daquela conferência específica, o resto do meu ano estava planejado, repleto de pregações por todo o país. Realmente, Deus abençoou a sua Palavra. Eu vejo isso de primeira mão.”

“Mas”, disse eu, e parei. Em minha cabeça, eu estava numa encruzilhada, perguntando-me como dizer o que seguiria. “No caminho para casa depois daquele último sermão, entre as divinas bênçãos daquela noite, a minha esposa de quinze anos de casamento disse que estava me deixando”.

Houve um silêncio entre meu jovem amigo e eu. Tomei meu refrigerante. Temia ter falado demais e cedo demais. Ele conhecia as circunstâncias da minha vida. Mas será que estava pronto para aprender um pouco sobre o que tais circunstâncias podem nos ensinar? Além do mais, será que eu estava pronto a tentar e dar uma voz a isso?

“Estou tentando sugerir que o ministério envolve mais do que a questão de nossos sermões serem poderosos e de como influenciamos multidões de pessoas. Entregar tudo a Deus significa muito mais do que entregar-se aos sermões e às multidões.”

Mais tarde, naquela mesma noite, estávamos de pé sob as estrelas.

“Quando chegar em casa”, disse ele, “finalmente começarei a ser pastor. Quem sabe, logo estarei no seminário e serei equipado, e então serei professor em algum lugar. Mal posso esperar para chegar lá. Dois anos de pastorado e então...”

Eu me encontrava fitando o cascalho da entrada de carro como se fosse uma tigela de pad thai. Novamente eu procurei palavras para dizer o que ainda não fora dito. Eu ouvia a minha voz na voz dele. Ele estava inquieto por fazer algo grande para Deus. Seu trabalho pastoral era uma plataforma para ajudá-lo a chegar a outro lugar onde não estava. No entanto, ele não sabia como incluir trocar as fraldas do filho ou ficar de mãos dadas com a esposa na sua definição de grandeza.

“E se você já estiver onde Deus quer?”, tentei timidamente. “Em Jesus você já é uma bênção para as pessoas. E se seu lugar no ministério for onde você está com a família, no lugar em que Deus quer você junto dele?”

Seu rosto demonstrava sofrimento. “Por favor, me perdoe se estou falando demais”, eu disse. Então fiz uma pausa. “É que você está falando com um homem que ganhou tudo que sempre sonhou e perdeu muito do que realmente importava, tudo em nome de se entregar totalmente ao ministério para servir a Deus. Apenas estou tentando dizer que parece realmente importante saber o que queremos dizer por ‘ministério’ se vamos nos entregar totalmente a isso. Meu desejo é que aquilo a que você está se entregando totalmente seja realmente aquilo que Deus deseja, com a definição que Deus dá a isso.”

Ele olhou novamente para o céu. “Não sei onde começar com isso tudo”, protestou.

Sem-teto em nossas salas de estar

Na semana seguinte, sentei-me para almoçar com um pastor que está subindo e se tornando famoso. A igreja na qual ele servia existia apenas há quatro anos, mas já tinha frequência de várias centenas de pessoas. Ele surgia em nossa comunidade como o próximo grande acontecimento.

Contudo, havia algo que o perturbava. “Durante os primeiros dois anos de nosso crescimento explosivo”, ele admitiu, “relacionei-me mal como marido e pai”. Ele fitou sua água gelada e fez careta. “Eu me escondia no meu sucesso como pastor”, continuou. “Acho que usei isso para evitar ver minhas falhas em casa e em meu coração”.

Este homem era o exemplo máximo do que meu amigo mais jovem se esforçava para ser. Contudo, os dois homens revelavam a mesma luta — o reconhecimento de que alguém pode receber grandes elogios por pregar Jesus, e ao mesmo tempo conhecer pouco sobre como seguir Jesus nas coisas pequenas e simples do dia a dia. Conseguem comunicar amor à multidão do púlpito ou num escritório ou numa sala de aula, mas quando são chamados para entregar a si mesmos (não os seus dons), são propensos a ficar desajeitados. Vejo isso em mim.

Meu jovem amigo escreveu-me na primeira semana de seu novo pastorado:

Estou cheio de ansiedade, principalmente sobre o que fazer com todo esse tempo. Fico me perguntando se fiz número X de dólares de trabalho para a igreja hoje? Não estou acostumado com tanto tempo livre em um só dia, e isso me deixa ansioso. Consigo realizar melhor as coisas quando meu horário está abarrotado e vou a mil por hora. Tenho vivido sob pressão por anos, e agora que Deus está alargando o meu espaço, de alguma forma quero sabotá-lo. Como posso sair dessa e encontrar minha vida?

Meu amigo não sabia como fazer um dia de trabalho pastoral se as variáveis da eficiência, quantidade, rapidez e medidas econômicas fossem removidas. Ele não fora ensinado sobre os outros tipos de tesouros que eram dele em Jesus, os quais ele podia desejar usar no seu dia. Eu também não tinha aprendido. O tempo que ele esteve comigo no passar dos anos não o havia ajudado.

Desejo, pressa, e “as coisas que importam”

Espero, contudo, que mesmo em meio a a dores você e eu possamos ajudá-lo agora. Poderíamos dizer algo como isto, não poderíamos?

Ao entrar no ministério, você será tentado a orientar os seus desejos para fazer grandes coisas, de maneira notória, com a maior rapidez e eficiência possível. Mas, preste atenção. Uma encruzilhada espera por você. Jesus é essa encruzilhada. Como quase tudo na vida que realmente tem importância, ele exigirá que sejam feitas coisas pequenas, não notadas em sua maioria, durante um longo período de tempo com ele. A vocação pastoral, porque visa ajudar as pessoas a cultivar aquilo que é realmente importante, não é exceção.

Por quê? O que são essas coisas que importam para nossos desejos? Bem, primeiro, amor a Deus. Este nobre desejo leva tempo. Perdão, reconciliação, chegar à sensatez, crescimento espiritual em fé, esperança e amor; conhecimento e entrega aos ensinos da Escritura em Jesus, crescimento na obediência, mansidão, paz, paciência, bondade e domínio próprio, junto com enfrentar os vícios, as idolatrias e os pecados com o evangelho; aprender o contentamento em Jesus, quer em abundância quer em escassez; aguardar a vinda do Senhor e seu reino bem como o cumprimento de todas as promessas de Deus para sua glória e nosso bem. A linha de chegada na satisfação desses desejos não poderá ser atravessada com uma corrida de quarenta metros, não importa quão furiosamente tentemos.

Segundo, amor ao próximo em seus prazeres também é importante, e isso também leva tempo. Aprender a andar e falar e contar, crescer, fazer matemática, aprender a dirigir ou viver de forma independente, junto com começar ou participar de uma igreja ou ministério. A pressa não consegue realizar essas coisas, quanto menos continuar solteiro, encontrar verdadeiras amizades, desfrutar de um bom casamento, fazer amor que satisfaz, ser pai ou mãe, avós ou criar integridade e boa reputação no seu trabalho. Aprender a tocar um instrumento, subir ao ápice em um esporte ou tornar-se especialista em uma arte ou ofício, não acontece da noite para o dia. Porém, muitas pessoas a quem você serve acreditam que essa espécie de amor a Deus e ao próximo acontece instantaneamente.

Tome, por exemplo, um marido frustrado. Ele me disse: “Simplesmente não suporto mais; é demais! Ou ela trata a questão ou é óbvio que não se importa com nosso casamento! Não vou mais suportar isso não!”

Quando disse essas palavras para mim, ele estava casado há apenas três meses. A questão a que se referia era de seis dias atrás. Ele citava a Bíblia e falava em termos épicos sobre o que Deus deseja para um casamento e para uma vida. No entanto, se ele tivesse de esperar seis dias para consertar a questão, em um contexto conjugal de, ao todo, oitenta e nove dias, estava claro para ele que Deus não estava no casamento ou que sua esposa não o amava, e que ele tinha de preparar-se para seguir em frente. Este homem consegue citar a Bíblia, mas não tem garra para esperar em Deus em meio a algo de que não gosta. Com toda a conversa grandiosa sobre coisas maravilhosas que Deus quer, não ocorre a ele como é grandioso o que Deus diz sobre aprender a perseverar e esperar nele. Muitos de nós pastores expressamos o mesmo tipo de inabilidade emocional de esperar em Deus em e por nossas congregações.

Nosso problema é que a maioria das alegrias dadas por Deus que almejamos são deterioradas quando palavras como instantaneamente, pressa e impaciência são lançadas contra nós. Muitos estão confusos sobre o que significa verdadeira alegria se tiverem de assumir uma gratificação adiada entre as velocidades menores requeridas pelas coisas que importam mais para Jesus.

Ora, imagine amar a Deus e ao próximo em meio aos desalentos ou desolações da vida. A desolação não consegue suportar facilmente um ritmo pastoral acelerado. Isso explica por que muitos de nós não têm paciência no cuidado pastoral. Ossos e mentes quebrados não estão propensos à pressa. Pele queimada ou almas vitimizadas têm de chegar a uma coceira miserável a fim de se curar, e nós que esperamos ao lado do leito temos de esperar mais ainda. Morte, luto, perda, recuperação dos vícios, como também traumas emocionais ou físicos, ser pais e mães de crianças portadoras de necessidade especiais, aprender a se ajustar a doenças crônicas, depressão, incapacidades ou doenças — todas essas desolações são tratadas pobremente quando se requer delas “eficiência” e “medidas quantitativas”. Para o pastor importante, que faz coisas grandes e notórias rapidamente, o fato das pessoas estarem quebradas, na verdade, parece uma intrusão que o impede de fazer sua importante obra para Deus. Estou escrevendo essa última frase, e isso me faz desmoronar. Releia. Em seguida, caia comigo, está bem? Caia de joelhos comigo perante o Salvador. Ele é quem ergue nossa cabeça. Precisamos desse soerguimento gracioso, pois ainda não falamos sobre palavras como instantâneo e impaciente não nos oferecerem recursos para tratar das coisas que realmente importam – de amar nossos inimigos no ministério. E não se engane: eventualmente você também terá de aprender o mais difícil dos amores ao próximo.

Em geral (e isso muitas vezes nos surpreende), a pressa não é amiga do desejo. O sábio entendeu isto quando disse que “não é bom proceder sem refletir, e peca quem é precipitado” (Pv 19.2). Seu ponto está bastante claro. A pressa tem o hábito de não completar as coisas que realmente importam. Numa crise pode até ajudar. Mas quando chegamos ao entendimento, dedicação e cumprimento dos desejos de uma alma humana, a precipitação constantemente e legitimamente é processada por negligência. A rapidez oferece promessas imediatas para nossos desejos conjugais, ou ministeriais, ou para o trabalho, ou para os nossos filhos, mas, na verdade, a pressa nunca entrega o que promete naquilo que é mais precioso para nós.

O ponto que quero destacar é o seguinte. Nosso desejo por grandeza no ministério não é o problema. O problema surge quando a pressa de fazer grandes coisas de maneira notória e com a maior rapidez possível reformula nossa definição do que seja uma grande coisa. Deseje grandeza, querido pastor! Mas, submeta a sua definição de grandeza àquilo que Jesus nos dá. No mínimo teremos de começar a tomar posição quanto a este importante fato: a obscuridade e a grandeza não são opostas.

O que você quer que Jesus faça por você?

Jesus colocava a questão do desejo de modo muito claro quando treinava os seus ministros. “O que queres que eu faça?”, ele pergunta (Mc 10.36).

Pare aqui por um instante. Vá mais devagar se puder. Você tem uma lista do que quer para o ministério, e todas as demais realizações ministeriais que deseja conseguir em nome de Cristo antes de morrer? Você não iria estar sozinho se esse fosse o caso. Basta ler os anúncios. Uma miríade de desejos daqueles que compõem a sua congregação e comunidade serão revelados.

Tiago e João tinham suas listas. “Queremos que nos concedas o que te vamos pedir”, disseram. “Permite-nos que, na tua glória, nos assentemos um à tua direita e o outro à tua esquerda” (Mc 10.35– 37).

Tiago e João sutilmente começaram a almejar que seu ministério com Jesus lhes providenciasse uma plataforma de grandeza. Seus anseios começavam a estragar sua comunidade (Mc 10.41). Jesus não impediu que essa fricção ou destruição potencial acontecesse. Ainda hoje ele não impede. Você marcou bem isso? Tiago e João eram muito amados, dotados, chamados, frutíferos, e centrais no ministério terrestre de Jesus. Ele graciosamente escutou os seus desejos. Mas sua proximidade com Jesus, e sua fecundidade no ministério, não significavam que tudo que faziam era bom, certo e útil para os que os conheciam.

Em vez de dar-lhes tal imunidade, Jesus confrontou-os, e o que ele disse nos deixa mais sóbrios. É possível que líderes ministeriais desejem grandeza de formas nada diferentes daqueles que se encontram ao nosso redor, ou em qualquer lugar em nossa cultura. Ligar o nome de Jesus a esses desejos não muda o fato de serem idênticos aos anseios do mundo.

Faça uma pausa aqui. Repita a leitura dessa última sentença se for necessário. Em oração, vá mais devagar. Os líderes humanos em toda parte desejam grandeza e domínio sobre outros. “Não é assim convosco”, Jesus declarou. Se grandeza é o que você deseja, de agora em diante você tem de entregar sua vida a uma outra espécie de grandeza. “Quem quiser tornar-se grande entre vós, será esse o que vos sirva” (Mc 10.43). Servos entregam os seus dias a tarefas pequenas, muitas vezes não notadas por longos períodos de tempo, e sem receber nenhum elogio.

Jesus, então, toma Tiago, João e seus outros alunos de discipulado para um vivo e real estudo de caso. Ele mostra-lhes um monte sem nome, pertencente a um homem. Este era pobre e cego. Jesus lhe oferece a mesma pergunta poderosa que fez aos “maiorais” que viajavam com ele: “O que queres que eu faça?” (Mc 10.51).

Ali mesmo, a graça de Jesus nos humilha, contrastando os desejos que são revelados. Tiago e João estavam no centro do ministério, junto com Jesus, e estavam entre os melhores pupilos de Jesus. Mas isto não bastava para eles. Queriam lugares melhores. Enquanto isso, o pobre pede a Jesus apenas duas coisas, sendo a primeira misericórdia. A segunda era que pudesse ver.

Penso na classe da Sra. Canter no passado, nos meus estágios de seminarista, no meu primeiro pastorado, na varanda da casa de Mamaw, e nos restos destroçados da minha turma ministerial. Quando, em minhas ambições por ministério, deixei de sentir minha necessidade de desejar misericórdia quando estava com Jesus? Quando comecei a supor ter o privilégio de ver corretamente com meus olhos e a definir grandeza do ponto de vista desse meu privilégio, em vez de vê-la do ponto de vista da graça de Jesus?

Existe um jeito de desejar entregar-se totalmente ao ministério que o dividirá em dois, causando dor para aqueles a quem você serve, revelando o quanto você se desviou e o quanto está longe da definição de Jesus do que seja a grandeza. Conheço isso em primeira mão. Mas estou aprendendo mais uma coisa. Existe mais graça e esperança aqui do que você talvez saiba — nas mãos de

Deus, uma chamada para o trabalho pastoral entre a preciosidade de pessoas e lugares vagarosos e sobrecarregados de trabalho, pode se tornar em dons, verdadeira alegria, contentamento que perdura e uma boa vida. Por quê? Porque esse é o caminho de Jesus. Onde Jesus é nossa porção e nosso desejo, não nos faltará nenhum verdadeiro tesouro. “O reino do céu é como um tesouro escondido no campo, que um homem encontra e enterra. Em sua alegria ele vai, vende tudo que tem, e compra esse campo” (Mt 13.44).

Será que vender tudo que temos com alegria inclui abrir mão de nossas desorientadas listas para o ministério? E se as alegrias que desejamos em Jesus forem como tesouros escondidos em um campo, que muitas pessoas, mesmo as que estão no ministério, desprezam e raramente compram?

Você se lembra como eram as coisas antes que desejasse um ministério vocacional? Você não possuía treino. Era desconhecido no mundo. Jesus era belo para você. Ele o havia salvo. Havia comunicado o seu amor a você. Era um imenso tesouro, verdade que satisfaz, e sobremodo belo. Ele era a sua porção. Era o seu desejo. No princípio, tal deslumbrante provisão de Jesus despertou os seus afetos para servi-lo com a sua vida em um ministério vocacional. Não era de admirar que, quando Pedro declarou que excederia e seria maior que todos os seus colegas ministeriais, o canto do galo não demorasse a chegar. Para restaurar Pedro ao ministério, Jesus o levou de volta às primeiras coisas, ao primeiro amor. “Pedro, tu me amas? Apascenta as minhas ovelhas” (cf. Jo 21.15–17). Aqui começa a nossa vocação. O chamado pastoral para alimentar o próximo é secundário e decorrente do desejo anterior pela beleza do próprio Jesus. Vem-me à mente o antigo hino: “Propenso a vaguear, Senhor, eu sinto-me, propenso a deixar o Deus de amor”. Mas Pedro aprendeu o que todos deveríamos fazer com as cinzas deixada pelos cantos de galo ministeriais. Jesus vem ao nosso encontro. Ele não nos abandona. Sua benignidade dura para sempre.

Conclusão

Fechemos esta conversa introdutória sobre o desejo pastoral com uma parábola da vida real.

Dois homens saíram de casa para plantar uma igreja numa cidade necessitada. O primeiro que chegou sonhou com uma cidade alcançada por Jesus com o evangelho. Por meio desse primeiro pastor, pessoas conheceram a Jesus, os crentes se reuniram e nasceu uma comunidade de seguidores de Cristo. Foi um trabalho vagaroso, mas estava acontecendo. As suas orações estavam sendo respondidas.

Com o tempo, ele começou a se reunir com o segundo plantador de igrejas. Fez isso com o intuito de encorajar o segundo pastor em seu trabalho incipiente. O mais experiente e o novato oravam para que Jesus alcançasse a cidade. Através do iniciante, as pessoas passaram a conhecer a Jesus, os crentes se reuniram e nasceu uma comunidade de seguidores de Jesus.

Dez anos mais tarde, aquele que veio primeiro serve como pastor de uma igreja “simples”. Seus mais de duzentos membros demonstram o amor de Jesus de formas inexistentes ali dez anos atrás. O novato que veio em segundo lugar é pastor de uma igreja “épica”. Seus milhares de membros e múltiplas congregações pela cidade demonstram o amor de Jesus de maneiras que não existiam dez anos atrás. As orações de ambos foram respondidas.

Por que então, um deles está triste? Por que então, somente um deles recebe nossos convites para falar nas conferências e para nos oferecer os seus conselhos? Kathleen Graber, “Book Nine”, Poetry Foundation website, acessado em 3 de dezembro de 2014, http:// www.poetryfoundation.org poem 241278. Nathan Foster, Wisdom Chasers: Finding My Father at 14,000 Feet (Seguidores de sabedoria: encontrando meu pai aos 4.000 metros), (Down¬ers Grove, IL: InterVarsity, 2010), 41.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -5;

  -- 2 | Reconquistando nossa humanidade (reaproveita a aula de ordem 6: preserva o progresso)
  update public.aulas
  set titulo = $t$2 | Reconquistando nossa humanidade$t$,
      ordem = 6,
      conteudo =
$conteudo$Não temos lar neste mundo, eu costumava dizer. Então, eu voltei pela estrada para este velho lugar e preparava um bule de café e um sanduíche de ovo frito.

– Marilynne Robinson

“Você poderá ser como Deus”, diz a Serpente.

“Mas, como?”, pergunto eu. Eu leio a Bíblia com óculos. Ajoelho-me para orar pelas pessoas com hálito de café. Fico em pé e prego Jesus com uma bolha no pé. Sirvo a Ceia do Senhor com pão comprado por $1.99 no mercadinho Schnuck’s.

“Apenas finja que é diferente”, a Serpente diz. “As pessoas adoram quando fazem isso”.

Conselho a um aspirante ao pastorado

Fiquei sabendo recentemente que um antigo pastor e mentor pessoal cometeu suicídio. Tirei um período sabático do seminário onde servia como professor e passei seis meses como pastor interino com a família e a congregação do meu amigo falecido. Eu havia pastoreado antes uma igreja. Havia servido como pastor interino antes. Mas não desse jeito. Nós teríamos de buscar juntos sucatas de graça e verdade em meio às ferragens. O Cristo vivo habitaria conosco em meio aos destroços. Aprenderíamos dele em meio ao lixo. Ele jantaria conosco no vale de sombra.

Eu estava sentado junto de uma multidão de professores e estudantes para o ministério com seus tênis e jeans. Pediram que eu desse uma palavra. O que eu poderia dizer para ajudar um iniciante no ministério?

A atmosfera era leve, mas meu coração estava pesado. Eu pensava em como meu pastor mentor poderia até ter escolhido deixar o ministério, e ainda assim ser importante para todos nós. Mas para ele, rebaixar-se em meio às assombrações interiores não indicava humanidade, e sim fracasso. Ele não conseguia ver-se como útil se não tivesse mais a posição de pastor, com os cuidados pastorais que essa posição requeria. Eu sentia sua falta. Estava, pela primeira vez em minha vida, fazendo as mesmas perguntas. Será que eu sabia que poderia servir a Cristo humanamente e de forma significativa, quer fosse pastor ou um líder ministerial quer não? Eu não sabia naquela época, mas logo teria de responder a essa pergunta de uma maneira dolorosa e pública. Mas naquele momento, entre aqueles seminaristas, com dor no coração e sobriedade, eu confrontava meus pressupostos sobre o que significa liderar no ministério. Agora era a minha vez de falar. Respirei uma oração relâmpago, fiquei em pé e disse: “Jonathan Edwards peidava”.

Alguns riram. Eu não. Alguns tinham sorrisos de canto de boca com a minha irreverência. Talvez eu tenha sido irreverente. Mas eu não estava tentando ser engraçado. Provavelmente poderia ter encontrado linguagem melhor para descrever o que eu estava enfrentando. Não tinha intenção de difamar o grande teólogo e pastor da história norte-americana. Estava tentando pôr palavras no estrago e no mito de sua celebridade assim como de outros. Sentiame perturbado por um novo questionamento: O que significaria para nós se viesse o avivamento e continuássemos noite adentro com orações enviadas ao céu? Em algum ponto ainda teríamos de usar o banheiro? Queria dizer-lhes que até mesmo os maiores teólogos ou pregadores entre nós ainda são pessoas comuns, carentes da graça de Jesus. Eu estava cansado de fingir outra coisa.

As primeiras coisas primeiro

Numa conferência, enquanto prego sobre Cristo para você, estou incomodado por uma hemorroida e meus livros estão à venda no saguão. Ainda mais, posso ter me enxergado nos olhos de meus filhos naquela manhã e ter pedido perdão por algo que aconteceu no dia anterior. Ou talvez eu ainda esteja cego enquanto falo a você sobre o que minha esposa, ou meus filhos ou minha congregação ainda precisam desesperadamente que eu veja. Quando visito no hospital, tenho de amarrar os sapatos pela manhã ou calcular qual blusa de frio me fará parecer um pouco mais magro ou clamar a Deus com respeito às minhas próprias dúvidas, enquanto você se sente ferido e eu não tenho resposta sobre as razões de sua dor. Enquanto você é transformado pela graça mediante algo que eu disse ou escrevi, é provável que eu tenha tomado uma tigela de mingau de aveia no café da manhã ou tenha me deliciado com o som da coruja que visita a nossa casa.

Portanto, ao começar a pensar a respeito dos desejos, temos de clamar de cima dos telhados que o ministério pastoral é algo pertencente a criaturas. O pastor é um ser humano. Creio que a vida e o ministério cristão são um aprendizado com Jesus em direção à recuperação de nossa humanidade e, mediante o seu Espírito, uma ajuda para que nosso próximo faça o mesmo. Tudo isso é para ele, por meio dele, com ele e nele, para a glória de Deus.

Creio também que a ausência geral dessa recuperação de nossa humanidade dentro do ministério pastoral está nos matando espiritualmente. Quero que seja feito algo sobre isso. Eu reconheço que colocar nossa humanidade em Cristo na frente e no centro da vida cristã e da tarefa pastoral fará com que alguns de nós se sintam desconfortáveis, e com razão. Pode parecer que quero apenas repetir mais da espiritualidade egocêntrica que a nossa geração e nossos corações perigosamente querem.

Para corrigir tais temores, penso em um professor e amigo meu. Ele, às vezes, manda que os seus ministros em treinamento se virem ao resto da classe e confessem em voz alta para os outros: “Eu não sou o Cristo”. Nessas palavras de João Batista aprendemos que, conquanto seja verdade que possamos perigosamente fazer pouco caso de Deus ao chamar a atenção sobre nós mesmos impropriamente, é igualmente verdade que não podemos glorificar plenamente a Deus sem que confessemos que não somos divinos. Dizer: “Eu não sou o Cristo” é simultaneamente expor para todos que nós, pastores, que somos meros humanos e apenas pessoas locais.

Uso as palavras meros humanos e apenas pessoas locais para diferenciar-nos de Jesus. Jesus é humano, mas não meramente. Jesus é local, mas não apenas. Esclarecemos essa distinção entre Jesus e nós como um ato de adoração e compromisso. Como líderes de ministério, esforcemo-nos para entregar nossa vida, de modo que toda pessoa a quem servimos saiba que não somos Deus. Cada um de nós não é Deus; é apenas um ser humano.

Então, ressaltemos este ponto. A grandeza, mesmo no ministério, não pode fugir à humanidade. Ser humano não macula a grandeza; antes, a informa e marca seus nobres limites. Como chegamos a pensar de maneira diferente? Seja qual for o desejo que tenhamos para o ministério, haveremos de realizá-lo como quem pode ter coceira no dedão do pé, e cujo pé sem meias passa frio no inverno.

A fisicalidade humana

Os desejos pastorais, por mais grandiosos e nobres, não nos livram dos limites físicos que temos.

O estudo teológico me ensinou a doutrina da Criação. Fui examinado para a ordenação acerca do meu ponto de vista sobre os dias da criação e o legado de Darwin. Mas o significado de Deus ter nos criado humanos, corpóreos, localizados, finitos e à sua imagem não se traduzia em minha teologia de ministério pastoral nem informava a forma que o trabalho pastoral devia assumir. Hoje penso que deveria.

Por exemplo, sou um dos pastores de Wendell. A paralisia infantil tem impedido o movimento das pernas de Wendell há setenta anos. Wendell também tem se sujeitado ao regime da diabetes, com as exigências de sargento de tiro de guerra sobre as suas rotinas diárias. Duas ocasiões com o câncer atacaram terrivelmente a vida dele. A morte da sua esposa arrasou seu coração e esvaziou sua cama à noite. As suas mãos tremem. Às vezes sua voz fica arrastada.

Com sua cadeira motorizada, Wendell faz as suas tarefas diárias, lê a sua Bíblia, ora a Deus e compartilha Cristo com outras pessoas, expressando louvor pelo cuidado de Deus por todos esses anos. Para cuidar como um médico da alma de Wendell, temos de levar em conta seu corpo físico.

Nas palavras do pastor-poeta G. M. Hopkins, somos como uma “cotovia” em nossa “casa de ossos”, “almas e corpos”.4 Ainda cedo na liderança pastoral, soube que a luta que travava não seria contra “carne e sangue” (Ef 6.12). Mas eu não entendia como a carne e o sangue formariam a arena para esta luta. “Amado, acima de tudo, faço votos por tua prosperidade e saúde, assim como é próspera a tua alma” (3Jo 2). João, o apóstolo, orava assim, e aprendemos com ele.

Preparando os sentidos de nosso corpo

para o ministério

Não podemos nos esquecer de que aqueles a quem servimos são também criaturas corporais.

Pediram que eu visitasse uma senhora de meia-idade da comunidade. Mentalmente, ela tinha quatro ou cinco anos, apesar de já ter vivido quarenta ou cinquenta. Quando entrei pela porta, vi que ela tinha um babador e estava tentando comer uma pratada de espaguete. Ela deu um amplo sorriso maravilhado quando me sentei ao seu lado.

“Quem é você?”, perguntou, coberta de molho vermelho e pedacinhos de macarrão.

“Meu nome é Zack. Sou pastor”, respondi.

Ela imediatamente e com grande animação respondeu. “Aprendi o ‘Pai Nosso’ de cor”, disse ela. “Quer que eu recite?”

“Adoraria”, disse eu. Depois de declamar orgulhosamente a Oração do Senhor, ela recitou de cor o Salmo 23.

“Fiz bonito?”, ela perguntou. “Com certeza!”, disse eu. “Eu creio em Deus!”, ela continuou. “Ele me ama. Eu o amo. Ele morreu na cruz por mim. Um dia ele voltará para me levar para sua casa”.

Ela disse isso com a maior seriedade, olhando nos meus olhos. Era como se soubesse qual era o meu papel. E falar sobre Deus com um pastor é coisa normal. Ela também estava me avaliando. Quem sabe procurando detectar o tipo de pastor que eu era. De repente, ela deixou cair o garfo, estendeu a mão coberta de macarronada salpicada de saliva, e perguntou: “Quer orar? Segura a minha mão”.

Eu o fiz e oramos com nossas mãos molhadas de molho de macarronada, numa sala desconhecida para o mundo, mas amada por Deus.

Pare aqui por um instante. Demore em oração com esta pergunta: O que significa para você o fato de que o ministério é um ato de amor ao próximo e amar o próximo vai requerer proximidade física? Se atualmente você não tem paciência com os sentidos, nada de atenção ao corpo a não ser naquilo que é lascivo, é bem possível que você ainda tenha pouca ideia quanto ao que consiste a vida de um pastor e o que ela vai requerer de você.

Localidade Humana

Nossa teologia pastoral do Éden nos lembra que as criaturas com corpos também são locais.

Elas habitam lugares. No jardim que Deus plantou, Adão e Eva comiam comida, cuidavam de animais, plantavam sementes, oravam, trabalhavam e se amavam. Não havia pornografia no mundo e eles repousavam em sua nudez. Agradar a Deus significava nada mais que escutar suas palavras, segui-lo pelo Éden, e, com gratidão, nadar nas águas seguras da companhia um do outro. De mãos dadas, cortando a grama, resistindo às vis tentações, e aprendendo a amar aquele que os criou, tinham o suficiente para uma vida significativa com Deus. Mas parece que isso não lhes bastava. Adão e Eva ouviram sórdidos sussurros rastejando pelo capim. O dom de Deus, de um significado local com ele, começou a entediar o casal.

Pause aqui por um momento. Considere o que deixa você entediado e inquieto. E observe também aquilo que Deus considera revigorante.

1. Fomos criados para honrar a Deus e não colocar nada mais em

seu lugar, entregando-nos a ele. Em outras palavras, deveríamos amar a Deus. 2. Deveríamos amar um ao outro (unir-se à sua mulher, Gn 2.24),

relacionar-nos corretamente com nossa família mais extensa (deixar pai e mãe, v. 24), e cultivar a comunidade (ser fecundos e multiplicar, Gn 1.22). Noutras palavras, fomos feitos para amar o nosso próximo. 3. Deveríamos reconhecer a bondade e qualidade sagrada do

lugar, das criaturas e das coisas que Deus criou, cuidando dessas boas dádivas. Deveríamos contribuir para o cultivo da criação (cultivar e guardar, Gn 2.15) e para uma cultura que reflita essa bondade concedida. Estes primeiros textos de Gênesis nos ensinam que os seres humanos têm o propósito de amar a Deus e ao próximo, ao viverem localmente em um lugar, para a glória de Deus. O que isso nos diz sobre grandeza?

1. Deus deu a si mesmo para que nos entregássemos e

amássemos a ele. Isto quer dizer que orientar nossa vida para um relacionamento diário com Deus a cada momento traz glória a ele. 2. Deus nos deu um punhado de pessoas a quem amar. Você não

tem de se tornar outra pessoa ou olhar constantemente sobre os ombros dessas pessoas que estão bem à nossa frente. Atender à obra de Deus entre os rostos, nomes e histórias onde nos encontramos já é fazer o que Deus considera significativo. 3. Deus nos dará um lugar em que habitar e algo para fazer nesse

lugar. Isso significa que devemos atentar ao que está ali, no local onde estamos. Habitar com conhecimento e hospitalidade, no lugar que Deus nos dá, é glorificá-lo. À luz disso, o que você supõe que seja a obra do pastor? No mínimo, presumimos uma atenção local ao amor divino, entre pessoas comuns e lugares ordinários, com temperatura e histórias locais. Aqui, as palavras “atenção” a “pessoas comuns e locais ordinários” desafia grandemente o nosso tédio, pois nós pastores temos uma tendência para encontrar o propósito do trabalho pastoral, não com Deus no Éden, no precioso local de limites com ele, mas, em vez disso, com a Serpente, que descaradamente sussurrou ali, falando ilusões de uma vida sem limites no mundo.

Você vê esta mulher? Vê este homem?

“O que queres que eu faça?”, Jesus pergunta.

“Alarga os meus limites e os de minha congregação, para a glória de Deus, em minha geração!”, podemos dizer.

Mas quando passamos a pedir “alarga os meus limites”, não somos os primeiros a fazer essa oração. Um desejo de “tire agora os meus limites!” estragou o Éden em primeiro lugar e requereu que Jesus viesse morrer por nós.

Ando fazendo essas perguntas dolorosas a mim mesmo. Se estou entediado com gente comum, em lugares comuns, então não estaria eu entediado com aquilo em que Deus se deleita? Se penso que os limites locais de corpo e lugar são estreitos demais para uma pessoa tão talentosa quanto eu, não desejaria fugir daquilo em que o próprio Deus habita com alegria e a cada dia?

Se olho para um rosto, uma flor, uma criança, ou uma congregação dizendo: “Não isto, Deus! Quero fazer algo grandioso para ti!”, não estaria eu profundamente enganado quanto ao que Deus diz ser uma grande coisa?

Faça aqui uma pausa por um momento, se puder. Demore um pouco nas frases seguintes.

A mulher lavou os pés de Jesus com suas lágrimas e os secou com seus cabelos. Os “homens da Bíblia” viram isso e murmuraram sobre o “tipo” de gente que ela era. Mas Jesus confrontou os ataques de postagens de blog, seus rostos franzidos e recusa em dar as mãos, as pressões dos que votaram nele, a ameaça de destituí-lo dentre os que tinham posição no ministério. Enquanto aqueles que treinou para o ministério observavam o desenrolar desse cenário, Jesus desviou o olhar, voltando-se, em vez disso, para ela, e perguntou ao líder desses homens conhecedores da Bíblia: “Vês esta mulher?” (Lc 7.44).

O que dizer dos homens? Quando conta sobre a hora em que Jesus chamou Mateus para lhe seguir, Lucas identifica Mateus por seu trabalho. Jesus “saindo, viu um publicano, chamado Levi, assentado na coletoria, e disselhe: Segue-me!” (Lc 5.27).

Quando narra esse mesmo momento, no entanto, Marcos identifica Mateus não tanto por seu tipo de trabalho, mas por seu pedigree na família. “Quando ia passando, viu a Levi, filho de Alfeu, sentado na coletoria” (Mc 2.14). Fico a me perguntar: Ser filho de Alfeu curava ou corroía o coração de Levi? Não sei. Mas sei que Mateus não menciona a família quando lembra para si esse momento, e coloca o emprego nos bastidores: “Partindo Jesus dali, viu um homem chamado Mateus sentado na coletoria e disselhe: Segue-me! Ele se levantou e o seguiu” (Mt 9.9).

O ponto? Marcos via a família de Mateus. Lucas via a profissão de Mateus. Jesus viu Mateus. Suponha que você estivesse nesse cenário, se preparando para o ministério com Jesus.

“Você veria esta mulher?” “Você veria este homem?” Um dos privilégios contínuos de nosso ministério pastoral em Jesus é aprender a ver as pessoas como pessoas e a nós mesmos como alguém entre elas.

Pregando descalço

Quando um casal entra no ministério, o amor jovem de vidas comuns poderá ser pressionado a ponto de deixá-los. Poderá ser o caso de ela ter acabado de dar à luz um filho. Ou então, são recémcasados. E já estão exaustos pelo ritmo do treinamento bíblico que fizeram, e começando a obra do ministério como quem já precisa de uma folga. Mas começar o trabalho para Deus significa pouco tempo para cansaço. E assim, a esposa vai com seu líder no ministério a um novo local, sem raízes, com uma criança pequena e um novo emprego. A igreja espera que ele chegue correndo e vencendo a corrida. Ele quer mostrar que vale o dinheiro pelo qual foi contratado. Trabalha demais o tempo todo por amor a Jesus, enquanto a sua esposa recente e seu bebê ainda novinho tentam aprender a confiar em Jesus em meio a lavar pratos e o programa da Galinha Pintadinha, sem amigos locais e saber ainda os nomes das ruas de sua nova vizinhança. A pessoa solteira que se forma depois do treinamento bíblico, semelhantemente, enche todas as horas em que está acordada para Deus, ficando exausta, dizendo com seus botões que no dia em que se casar vai diminuir o ritmo da correria (sem perceber que o hábito do ritmo atual será muito difícil de ser interrompido).

Por que pressionamos nossos jovens no ministério a produzir resultados ministeriais dessa maneira? Por que eles acham que têm de se tornar algo mais que um ser humano normal, que mora fisicamente em um determinado local? Por que deixamos implícito que, no ministério, eles têm de ser mais do que um casal jovem apaixonado em amor sagrado, que tiveram seu primeiro filho e estão aprendendo em seu primeiro chamado no mundo?

O meu pastor/mentor colocou sua própria vida no meio de tudo que chamaríamos de sucesso. Ele tinha um programa de construção em duas fases, estava plantando igrejas e era notável como conselheiro e pregador em conferências. Porém, às vezes, as coisas do ministério que desejamos na nossa cultura não são as coisas importantes que Jesus nos dá. Falamos aos empresários que não vale a pena ganhar o mundo e perder a alma. Não seria possível fazer o mesmo em um ministério vocacional?

No meu primeiro pastorado tínhamos dezoito alqueires de terra. Quando propus que cortássemos nossos programas de ministério pela metade, para que as pessoas pudessem descansar mais com as suas famílias e estar em casa na sua vizinhança para compartilhar o evangelho, alguns me julgaram como quem conduz a igreja para trás (mesmo que tivéssemos uns trinta programas numa igreja de oitenta e cinco pessoas).

Enquanto isso, poderíamos discutir sem trégua nossas declarações de visão e debater com eloquência perguntas chatas (tais quais se João Calvino teria removido a cruz de madeira pendurada na parede de nosso santuário, ou se nós, como protestantes, devemos rebatizar alguém que foi anteriormente batizado na igreja católica, ou se devemos ter o nome “Presbiteriano” no logotipo de nossa igreja). Mas como líderes, muitas vezes demonstramos pouca capacidade de demonstrar o amor, a graça ou a humildade de Jesus em nossos relacionamentos diários. Nossos sonhos e planos de realizar algo grande para Deus injeta-nos energia. Nosso tratamento uns com os outros, porém, só nos ferem e fatigam. É fácil fazer grandes coisas para Deus desde que essa grandeza não requeira humildade interior, amor prático pelas pessoas bem à nossa frente nem submissão à presença de Jesus no lugar em que já estamos.

Estou tentando dizer que quando um homem iracundo se torna manso em Cristo, existe mais poder do que em trinta homens cheios de ira que vieram a nosso evento ministerial e foram para casa sem transformação. O problema para mim e para muitos dos que tenho servido é que a assistência de trinta pessoas soa melhor que a de uma só. Mesmo que, querendo nosso Senhor, viessem trinta e esses trinta fossem transformados, por mais que nos alegremos, ainda teríamos, nalguma altura, de usar o banheiro.

Marque bem isso aí: Nós também podemos tentar resistir à nossa humanidade, dizendo com convicção algumas coisas horríveis diante de um santuário, dentre todos os lugares, durante a oração: “Deus, eu te agradeço porque não sou como outros homens” (Lc 18.11). Lá está: o ar mortífero, a crença envenenada que, de algum jeito, nós que desejamos realizar grandes coisas para Deus não sucumbimos a ser meros humanos, do modo que são as outras pessoas.

Talvez seja por isso que, trinta anos após falar pela primeira vez sobre meu chamado na sala de aula da Sra. Canter, eu tenha pregado descalço em meu primeiro domingo como novo pastor titular, tendo uma segunda chance. Permanecer em pé ali, com a Bíblia na mão, sobre um fundamento comum e não escondido, com pelos de hobbit sobre os dedos calosos do pé, era um ato de testemunho pessoal, um lembrete tolo, mas tangível, de que eu não sou o Cristo.

Por tempo demais, ignorei nas minhas aspirações por grandeza, o fato de que sou humano. Talvez seja isso, em parte, o que aconteceu a meu amigo pastor que se matou. Ele era um “sucesso”. Eu estava me tornando assim. Foi por isso que eu disse: “Jonathan Edwards peida”.

Gerard Manley Hopkins, “The Caged Skylark”, [A cotovia engaiolada] em Hopkins: Poems and Prose (New York: Knopf, 1995), 17.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -6;

  -- 3 | Saindo de casa (reaproveita a aula de ordem 7: preserva o progresso)
  update public.aulas
  set titulo = $t$3 | Saindo de casa$t$,
      ordem = 7,
      conteudo =
$conteudo$O ministério pastoral é uma peregrinação pelo deserto.

– David Hansen.

Quando um cão selvagem entrava no nosso quintal, Papaw irrompia pela porta de tela, correndo para carregar a seu rifle. Enquanto o metal arranhado batia forte contra o fundo da casa para então retornar de volta em seu lugar, Papaw, agora de pé e calçando as meias, firme sobre a entrada do carro, mirava a arma e atirava. Não se importava com o ganido resultante. Na verdade, parecia ter prazer nisso, como se tivesse acabado de defender a sua família do ataque de uma manada de lobos. Tentava esconder seu largo sorriso e xingava o vira-lata que uivava de dor, como se fosse um homem chamando Papaw para brigar. Assim, quando ele me disse bem cedo na manhã no dia de Natal que ia atirar no Papai Noel, eu acreditei.

Não era nada fácil possuir um coração sensível no mundo daquele querido homem quando ele era mais jovem. “Abaixe as calças e corra, Mamaw! Você tem cinta de babados e calcinha de rendas”. Foi o que Papaw me ensinou a dizer para minha Mamaw quando eu era um menino bem pequeno, e eu dizia. Aprendi a ver as mulheres não somente pelo jeito que Papaw falava a Mamaw, mas também pelas revistas Playboy e pelos calendários de mulheres nuas que não eram segredo para Mamaw ou para nós, e que eram colocados estrategicamente pela casa que ele construiu.

À mesa de jantar, aprendi que havia no mundo alguns chamados de “negros”. Os pregadores não eram melhores em sua estimativa. A casa pastoral da igreja metodista era vizinha da nossa. Pregadores nada mais eram que hipócritas, e Papaw tinha várias histórias para provar isso.

Quando eu voltava da escola no ensino fundamental, a primeira coisa que Papaw perguntava era se eu tinha levado uns petelecos do diretor da escola por ter aprontado naquele dia. Quando eu respondia: “Não, Papaw”, ele ria, me dava um tapa no braço e dizia: “Puxa vida, rapaz, o que é que você consegue fazer de bom?”

Papaw nunca me fez sentar para dar uma aula sobre como ver e interpretar os cachorros perdidos, as mulheres, os pregadores ou a pele não branca, mas o jeito do Papaw ver o mundo, junto com outros em minha jovem vida, ia treinando e formando o meu próprio jeito.

Os jeitos ensinam. Formam as principais salas de aula de nosso aprendizado. Para melhor e para o pior, aprendemos a ver o mundo e a nos apresentar nele como testemunhas, não somente das declarações de crença que aprendemos na aula, mas também pela mentoria relacional com aqueles com os quais vivemos (Pv 13.20; 22.24–25). Seria ingênuo se acreditasse que meu ministério atual, como adulto em St. Louis, Missouri, fosse estranho ao meu Papaw e ao modo como ele e eu compartilhávamos juntos a vida comum e cotidiana de Henryville, Indiana. Você também não é diferente disso.

Você e eu aprendemos muitas coisas em casa, e nem todas concordam com Jesus. E o que é pior, quando saímos de casa para o ministério, levamos conosco, para o bem ou para o mal, as coisas que a nossa casa nos ensinou.

A mentoria que trazemos conosco

Os discípulos repreenderam as crianças por tomarem o tempo de Jesus (Lc 18.15). Quando a mulher quebrou o vaso de alabastro, perfumando Jesus com a sua adoração, eles se indignaram e repreenderam a mulher (Mt 26.7–10). Quando viram Jesus conversando com uma mulher samaritana, esses discípulos judeus ficaram confusos (Jo 4.27). Vendo Jesus prestes a ser traído, desembainharam as suas espadas para uma ação violenta (Lc 22.49). Ao testemunharem um homem rico indo embora, em vez de seguir a Jesus, indagaram: “Quem poderá ser salvo?” (Lc 18.25–

26). Quando viram o cego de nascença, presumiram que a deficiência fosse um castigo pelo pecado (Jo 9.1–3). Assumiram que as diferenças entre os pregadores de Jesus fossem motivo para a rejeição e a separação imediata (Mc 9.38–41).

As pessoas que viviam em volta dos discípulos tinham lentes similares pelas quais viam o mundo. Por exemplo, ao vir Jesus receber bem a um cobrador de impostos, “todos murmuraram” (Lc 19.7). O morador de sepulturas, quando teve a mente curada por Jesus, foi obrigado a “deixar sua região” (Mt 8.34). Quando aconteceu uma tragédia e pessoas inocentes morreram, presumiram seriamente que tragédias só acontecem aos piores pecadores (Lc 13.4).

Cada um de nós carrega “Teologias” e “teologias” para o ministério. As realidades “maiúsculas” foram aprendidas em sala de aula com bons professores bíblicos. As “minúsculas” muitas vezes aprendemos sem perceber, do lado de fora ou apesar da sala de aula. O problema é que, não importa o que professemos sobre nossa Teologia, todas as nossas pequenas teologias aparecem nas horas menos esperadas. Por exemplo, Jesus ensinou a seus pastores em treinamento a amar ao próximo, até mesmo os inimigos. Tenho certeza de que esses seguidores sinceros concordaram com essa “Teologia”. Mas a primeira vez em que os samaritanos ofenderam a Jesus, Tiago e João queriam, em nome de Deus, matá-los (Lc 9.54).

Homens com punhos e temores

No primeiro ano de meu primeiro pastorado, contava vinte e seis anos de idade. A reunião de educação cristã tinha terminado, mas a raiva estava só começando. Esse homem, trinta anos mais velho que eu, começou a vociferar: “Você nunca vai...”. Nos próximos minutos, ele deixou patente que eu não tinha sido chamado por Deus e que era uma desgraça como pastor, e que, como homem, eu somente era digno de desrespeito. Usando um vocabulário de filme impróprio para menores, ele escolheu palavras que deixaram claro para mim que se eu o contrariasse novamente estaria arrasado como pastor. (Foi uma ameaça que mais tarde ele tentou cumprir). Meu coração batia acelerado. A ansiedade inundou minhas veias. Lembrei-me de que “a resposta branda desvia o furor, mas a palavra dura suscita a ira” (Pv 15.1). Tentei, mas ele não desviou a ira. “Sinto muito”, disse eu.

Ele fez uma careta mais para baixo, à altura possível para atacar minha cabeça, ergueu o dedo em riste e ameaçou: “Vou vigiar você para ver se está sendo sincero”. Depois de longa pausa, saiu. Eu permaneci de olhos no chão e chorei como se fosse um bebezinho (ou será que chorei como homem?).

Como é que um homem que já sacrificou tantos de seus recursos e tempo desejando o ministério, e que já realizou tanto bem, pode ter tanto apetite por uma briga caso seja contrariado?

Como eu podia desmoronar desse jeito? O fato é que, por mais que eu tivesse aprendido no seminário, quando a tempestade rugia saindo do nada e a chuva jorrava, eu era como um menino do primeiro ano de ensino médio, fugindo dos punhos de meu padrasto em Clarksville, Indiana.

Eu era um pastor chamado por Deus a fazer o bem para este homem e para a congregação, resistindo ao pior dele e procurando seu maior bem em Cristo. Mas naquela hora, tudo que eu via era um homem de punhos cerrados. As lembranças de menino amontoavam-se na sala. Temores de menino roubavam as minhas credenciais e as escondiam em algum lugar do armário. Eu não as encontrava em meio àquele estouro de raiva.

Porém, o temor de menino não é a única fotografia que tenho de minha história de mentoria. Meu padrasto me esmurrou com as mãos abertas de adulto; as marcas vermelhas da surra em minhas bochechas e as lágrimas produzidas tiveram como resultado tornarme mais duro. A primeira vez em que eu, já pastor, me escutei dizer: “Vai mexer comigo?”, para um homem que não estava em seu melhor momento, na fila em uma loja de móveis, eu me surpreendi e fiquei sério. Caiu a ficha. Estava correndo perigo de ser nada diferente dos homens que eu tentara vencer.

Sendo pastor, vejo homens na congregação e comunidade todos os dias. Alguns homens também estão sempre me vendo. Jesus vê a ambos.

Mulheres com corpos

Mas os homens também enxergam as mulheres. De mãos dadas, minha esposa e eu caminhamos pelo bar Llywellyns numa sextafeira. Os homens agarram-na com os olhos. Não se importam por eu ser dela ou por ela ser minha ou por nossa aliança diante de Deus ser sagrada e feliz para nós. Acabei aprendendo que ela tem de conviver com aqueles olhos da maioria dos homens na vida que dizem: “Você não quer se embebedar comigo?”

June era conhecida por “tentar se insinuar”. Ela estava bêbada no McDonalds. “Oi, Zack”, chamou. “Quer ficar aqui comigo?” June deu uma piscada, enrolou as palavras e tropeçou, enquanto meus amigos sorriram. “Enfia ela no carro”, disse um deles. “Põe ela no seu carro!” Eu não o fiz. Não sei onde está June agora. Será que ela veio a conhecer o descanso gracioso e dignificante dos olhos de Jesus, totalmente isentos de pornografia? Será que eu possuo tais olhos ao abrir a Bíblia, orar ou mesmo tomar minha refeição na presença de uma mulher?

Penso em Judy, sentada no meu escritório na igreja. “Você tem de deixá-lo”, eu disse a ela com respeito ao seu namorado abusivo. “Eu sei, mas não posso”, disse ela. Orei silenciosamente em minha cabeça. Vi a vergonha do seu rosto. Arrisquei uma declaração no contexto de nossa história e longo conhecimento: “Estou imaginando que o sexo nem é assim tão bom”, eu disse quase em um sussurro.

Ela me olhou. O rosto duro atenuou. Abaixou os olhos e as lágrimas começaram a escorrer. “Não, não é”, admitiu, balançando a cabeça. “Sinto-me tão suja depois, com as coisas que ele quer que eu faça. Fico tomando banhos de chuveiro. Mas não consigo me limpar”.

“Então por que você continua com ele?”, perguntei-lhe. “Porque pelo menos por um momento eu me sinto desejada”.

Lembro do canal da Playboy da casa de meus avós postiços, da coleção de revistas pornográficas Hustler no armário debaixo da pia no quarto de cima. Penso no armário de Papaw, e sou esmagado com uma percepção. Não consigo ver ou ministrar a mulheres até que eu aprenda a graça de ver além do seu corpo, para aquilo que ela é. Escrevo um pouco de minha própria poesia:

Você escondeu no armário as suas Playboys

junto com tudo mais.

Você também me escondeu ali

e foi isso em que nos tornamos.

Assim, quando Jesus nos pergunta: “Vês esta mulher?” (Lc 7.44), pergunto-me como deve ter sido para ela. Não havia luxúria nos olhos de Jesus, nem abuso por trás de seu sorriso, nenhuma cantada familiar ou bajulação em seu tom. Sua beleza era notada e admirada; seu coração e sua mente eram compreendidas e conhecidas. Será que já teria sido observada dessa maneira por algum homem? Será que os homens ali de pé sabiam que eles também, pela graça, poderiam olhar deste modo para uma mulher?

Os netos se esquecem de que as Mamaws são mulheres. Seu nome era Pauline. O nome dele era Bud. Na sua juventude, imagino que ela colocasse seu melhor vestido e passasse perfume no pescoço, esperando que os dedos dele também a tocassem ali com ternura. Havia gratidão e ternura, um anseio nos olhos ao dizer seu nome ou relembrar a sua presença. Naqueles anos ela ficava sentada com ele na sala, descascando batatas com ele na cozinha, deitava com jeito de mulher diante dele em seu leito de vários anos juntos. Gosto de pensar que no final ele via a ela, e os anos das revistas Playboy tiveram os olhos vazados. Gosto de pensar que a mulher, que conhecia e amava esse homem de punhos cerrados, finalmente teve as suas envelhecidas orações por ele finalmente respondidas, enquanto os punhos dele se abriam ternamente. Punhos finalmente relaxados e acariciados, nos cacos de uma velha promessa e um longo amor.

Racismo na conversa

Outra coisa também mudou, não plenamente, mas verdadeiramente. Papaw estava se recuperando no Hospital Municipal da cidade de Clark. Ele havia trabalhado ali como zelador durante muitos anos. Agora era ele que precisava de reparos. O seu coração estava cansado e queria parar antes da hora. Por isso, deve ter sido algo notável para Papaw naquele dia, quando um estranho veio visitá-lo entre os tubos e monitores presos aos seus braços. Esse “alguém” era um capelão afrodescendente com as boas novas de Jesus, trazendo cuidado pastoral para os enfermos. Eu queria ter sido uma mosca na parede para ver aquele momento.

Mas como filho do meu Papaw, eu mesmo tenho tido necessidade de muitos “capelães negros”.

“Você está se esforçando demais”, disse o meu amigo afrodescendente. “Você não tem de frequentar todas essas reuniões, sessões de planejamento e eventos contra o racismo. Tem um jeito mais fácil”, ele insistiu. Seus olhos transmitiam seu amor enquanto falava essas palavras. Ele tinha idade para ser meu pai.

“O que você quer dizer com isso?”, perguntei. “O seu escritório fica em um pequeno centro comercial perto de alguns comerciantes negros, certo? Então, quanto tempo levaria para você chegar do seu escritório até a uma dessas lojas?”

Fiz uma pausa. Tenho certeza de que também parei de mastigar o meu sanduíche. Dava para ver que um senso de convicção estava prestes a me cumprimentar. Sentei para trás na cadeira. Ele sorria agora, e era gentil.

“Uns três segundos”, respondi finalmente. “É isso que estou dizendo”, disse ele. “Você está se esforçando demais, frequentando na correria todas essas reuniões. Ao invés disso, ande três segundos até ali, enfie a cabeça à porta, e simplesmente diga ‘olá’. Se ninguém retribuir o seu cumprimento, tente de novo na semana seguinte. Se eles lhe derem um alô, simplesmente converse como um ser humano sobre coisas de humanos”.

Fiquei pensando no que ele disse. Admiti em voz alta o que eu sentia por dentro.

“Parece que essa caminhada de três segundos é mais difícil. Por que é assim?”, perguntei.

Ele não me respondeu. Ele não precisava me responder. Ambos demorávamos com o pensamento, enquanto comíamos as fritas devagar.

Jesus entra em nossa mentoria e reformula as narrativas com as quais mapeamos o mundo. Os discípulos cresceram ouvindo histórias que deixavam implícito que os pobres estavam no inferno e os ricos iam para o céu. Mas Jesus inverte isso (Lc 16.19–31). Os samaritanos são vizinhos nobres (Lc 10.25–37), pecadores arrependidos são justificados diante de Deus, e os arrogantes mestres da Bíblia não o são (Lc 18.9–14). E as crianças, longe de serem repreendidas e silenciadas, são exatamente como devemos nos tornar a fim de entrar no reino de Deus (Lc 18.15–17). Trazemos histórias de casa conosco quando entramos no ministério. Jesus entra nelas e dá à luz novas histórias para que as contemos.

O ajuste doloroso

Estas novas narrativas da graça para nossa família não são baratas. Não apenas as levamos conosco de casa; também quando voltamos para casa de tempos em tempos. Fazer com que isso dê certo requer graça e tempo.

Na sua própria cidade, enquanto Jesus era “o filho do carpinteiro, filho de Maria e irmão de Tiago e José e Judas e Simão” junto a suas irmãs, Jesus era bem-vindo. Era parte do povo e do lugar (Mc 6.3). Mas uma vez que Jesus “começou a ensinar na sinagoga”, as pessoas, em sua maioria, retiraram suas boas-vindas. “Se ofenderam com ele” (Mc 6.1–8; Lc 4.16–30).

Meu jeito de tratar minha pequena semelhança ao que Jesus experimentou por vezes tem feito as coisas piorarem. Ao tentar separar aquilo que é menos parecido com Jesus na mentoria de nossa família, frequentemente o fazemos mal, como a vez quando escrevi um tratado de sessenta páginas que chamei “Por que sou o que algumas pessoas chamam de ‘calvinista’.” Fiz cópias e mandei para todos os membros da minha família no sul de Indiana. Que maneira melhor haveria de mostrar o amor de Jesus aos entes queridos do que escrever e enviar um documento que eles não esperariam, respondendo perguntas que não estavam fazendo, com um tom que não era necessário, para defender uma discussão na qual eles não estavam envolvidos, e isso tudo para surpreendê-los, sem que tivéssemos tido qualquer conversa pessoal a respeito disso?

Assim, quando tentarmos orar ou dizer algo de significado espiritual, os membros da família não nos deixarão esquecer dessas coisas. Como isso pode se tornar um dom de graça! Nós todos podemos olhar para trás e dar risada devido ao perdão necessário e concedido. Novas histórias de família poderão tornar-se fonte de encorajamento para todos.

Porém, a lembrança de nossos momentos de tolice não vai embora com os outros membros da família. Eles ficam contentes em ter um encanador na família quando os canos estouram, ou um cabeleireiro que corte o cabelo de graça, mas raramente pensam na bênção que um ministro humilde pode oferecer à família. Não reconhecem a agulhada que trazemos conosco por causa disso. Talvez nos assemelhemos ao hipócrita que os feriu. O seu cinismo põe a culpa sobre aquilo que nós representamos.

Muitas vezes, as vozes críticas ou decepções implícitas vem numa disposição bem-intencionada. A família sente nossa falta e desejaria que estivéssemos em casa. “Filho, por que fizeste assim conosco?” (Lc 2.48), poderão dizer. A família de Jesus sentia-se ferida por Jesus. Maria acrescenta, “Teu pai e eu, aflitos, estamos à tua procura” (Lc 2.48).

Jesus faz uma pergunta direta e gentil em resposta: “Por que me procuráveis? Não sabíeis que me cumpria estar na casa de meu Pai?” (Lc 2.49). Como seria para José ouvir que Jesus tinha de estar na casa de um Pai diferente, e que esse Pai não era ele, José, e não incluía a provisão e a habitação de José? Deve ter doído.

Quando Jesus e sua família começaram a ter esse ajustamento dolorido, sua família “não entendia” o que Jesus estava lhes revelando (Lc 2.50). Teriam de ponderar essas coisas nos corações e ruminá-las por algum tempo (Lc 2.51).

Tempo de ficar de pé

Na hora que as multidões se juntam e Jesus não tem tempo para comer, a sua família reage mal. Poderiam ter trazido comida para ele, encorajando-o com a mensagem de que o Senhor, que o chamou, o sustentaria e sempre seria fiel. Em vez disso, olharam as coisas boas que Jesus fazia e denegriram seu caráter. Enquanto outros se ajuntavam para aprender sobre Deus através de Jesus, “sua mãe e seus irmãos” ficaram do lado de fora (Mc 3.31). Naquele momento público eles se referem a Jesus como um homem fora de si (Mc 3.21). Em termos humanos, existem pouquíssimas críticas mais dolorosas do que aquelas feitas contra nós por aqueles que nos conhecem por mais tempo.

Normalmente, Jesus se maravilhava dessa falta de boas-vindas em sua própria casa; suportava a dor produzida por isso, e simplesmente prosseguia em seu ministério (Mc 6.5–6). Mas chegou a hora. Desde os doze anos, Jesus havia se submetido e amado sua família respeitosamente, mesmo quando eles não o compreendiam. Agora, aos trinta anos, ele cumpriria o seu chamado, quer eles entendessem quer não. Certas coisas até eles teriam de aprender de Deus. Não podiam continuar a apoquentá-lo desse jeito. A manipulação, os xingamentos e a utilização da culpa para envergonhá-lo tinham de parar. Jesus os amaria, mas não faria concessões à descaracterização que faziam dele, bem como das interpretações sobre quem Deus é e de como o ministério de Deus deveria funcionar. A família e Jesus teria de se entregar aos propósitos de Deus para eles — não havia como evitar. Jesus continuaria em seu chamado, quer eles quisessem quer não, quer estivessem envergonhados por ele quer não, quer achassem que seriam maltratados quer não. “Quem é minha mãe e meus irmãos?”, ele pergunta (Mc 3.31–35). Este momento na vida de Jesus me deixa boquiaberto.

Certamente, naquele dia a família foi para casa furiosa ou ferida. Jesus só confirmou as suas suspeitas. Está fora de si. Eles estão certos em ficar do lado de fora e não se juntar aos que o seguem. Ou talvez acreditassem mesmo que ele se importava mais com os outros do que com eles. Pode ser que tivessem se sentido desrespeitados por ele falar as coisas tão claramente. Talvez pensassem no homem egoísta e orgulhoso que seu filho e irmão se tornara, amando as multidões, a fama e a atenção.

O que sabemos com certeza é que, enquanto se entregava à obra do Pai, Jesus não parou de amar a sua família (Jo 19.26). Com o tempo, sua mãe viria a entender todas essas coisas que foram profetizadas e as guardaria no coração. Com o tempo, o seu irmão Tiago se curvaria a ele afetuosamente como Senhor e Salvador. Mas não os vemos muito todos juntos.

As percepções da sua família estendida e dos seus concidadãos acerca do ministério são uma confusão — era assim até mesmo para nosso Senhor na plenitude de sua humanidade. Mas até mesmo aqui, a graça não desiste.

Conclusão

Eu estava saindo da reunião do almoço de Dia de Ação de Graças da casa dos Guernseys. Havia passado trinta e cinco anos ou mais desde que Papaw me dissera que planejava atirar no Papai Noel; seis ou sete anos desde que chegara o capelão negro; e seis ou sete anos desde que eu lhe escrevera uma carta contando do meu amor por ele e por Jesus, aquela carta que ele referiu como algo para ser guardado junto ao peito. Foi um ano ou dois antes da morte de Mamaw. E foi após mais de cinquenta anos que Mamaw orava.

“O que você sabe, jovem?”, disse ele com muita magreza e cabelos de prata. Há muito sumiram as costeletas fortes e escuras emoldurando o rosto murcho. A seriedade e clareza de seus olhos castanhos me surpreendeu. “Não tem muita gente que sabe o que tem dentro desse velho aqui”.

“Ah é?”, disse eu perguntando. “Dois anos atrás, esse velho aqui começou a dar graças a Deus toda noite”, ele disse. “Uns meses atrás, o velho aqui começou a voltar para a igreja”.

Eu estava chocado com a sacralidade daquele momento. Remexi as minhas chaves, vasculhando o vazio profundo do bolso de meus jeans, tentando encontrar palavras. “Como é isso para o senhor, Papaw?”, ousei indagar.

“Bem, não concordo com tudo isso”, disse. “Mas, para dizer a verdade, tenho sentido falta”.

Ele se aproximou de mim para me abraçar. Então sorriu ao falar: “A gente nunca sabe o que vai acontecer com esse velho aqui, não é mesmo?”

“Nunca se sabe”.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -7;

  -- 4 | Invisível (reaproveita a aula de ordem 8: preserva o progresso)
  update public.aulas
  set titulo = $t$4 | Invisível$t$,
      ordem = 8,
      conteudo =
$conteudo$O fato é que os pastores são invisíveis seis dias da semana... Grande parte de nosso trabalho mais importante é feito nos bastidores.

– Eugene H. Peterson

O que dissemos até aqui:

Pastores anseiam. Pastores pregam com pele e osso. Nossa pressa não ajuda muito. Entediados com a verdadeira grandeza que nos foi dada, tentamos sair de casa, mas levamos nossa casa conosco.

Estamos esgotados por correr atrás das falsas grandezas. Somos encharcados por sucessos, mas secos quanto a Deus. Estamos fazendo de novo antigas perguntas, olhando para trás. Mas de que adianta ser pastor?

Trabalho monótono

“Quero agradecer-lhe por aquilo que você disse da última vez em que nos encontramos”.

Ele disse isso em uma cafeteria. A filha pequena de meu amigo dizia com linguagem de garotinha: “Num quero Deus” ou “mim não ora”. Sofrendo, esses pais preocupavam-se que estivessem fazendo algo errado. Eu respondi dizendo algo sobre como nós adultos, muitas vezes, não gostamos de Deus em nossa vida ou não queremos orar.

“Quem sabe o deus que sua filha não gosta seja um que nós também não gostaríamos nem desejaríamos crer; talvez não seja, afinal, uma imagem verdadeira de como Deus realmente é”, eu sugeri. Então fiz uma pausa. Não tinha certeza, como era costumeiro, se aquilo que em oração eu tentava entender estava plenamente correto. Eu orava daquele jeito estranho que podemos fazer, silenciosamente, entre as sentenças e os pequenos silêncios que perduram enquanto enfiamos a colher em uma tigela de caldo quente.

“Em vez de fazer sua garotinha parar de falar que não gosta de Deus”, eu disse, “que tal admitir que, às vezes, mesmo como adultos, nós desgostamos de Deus, e deixar que isso molde as suas orações em família? Afinal de contas, os Salmos ou Eclesiastes, Jonas ou Jó nos mostram orações dessa espécie. Nos ensinam que Deus nos ouve em Cristo, mesmo quando temos sentimentos feios e quando esses sentimentos feios são dirigidos a ele. Quem sabe se neste exato momento é isto que ela pode aprender com você? Que tal se, em vez de ler a Bíblia por uma temporada, você convidasse os filhos a dramatizar as cenas escritas nos Evangelhos? Alguém é o que está doente. Um outro atua como o fariseu zangado. E alguém começa a dizer o que Jesus fez e a estender a mão ao que está enfermo ali mesmo em sua sala de estar”.

Nas semanas seguintes aconteceu algo maravilhoso. Aquela criança começou a relacionar-se de maneira diferente quanto à oração, e deixou de falar que não gostava de Deus. Um momento como este nos ajuda a entender por que não é fácil descrever o que um pastor faz. É também desagradável e fere nosso inquieto desejo de legados maiores e mais famosos.

• Comum e cotidiano. Este momento quase não se nota no mundo e não será documentado pela história. Dois homens tomavam sopa e conversaram por alguns minutos numa terça-feira em uma cidade do Missouri. • Invisível. Ninguém mais da congregação viu ou sabe sobre isso. • Incontrolável. Não existe uma fórmula. Nunca me fizeram antes aquela pergunta e eu poderia não ter sabido como dizer, ou errar completamente no que disse. Foram feitas orações. Dar um passo à frente foi um ato de esperar em Deus quanto ao desconhecido. • Inacabado. Demos graças com risadas quando se falou dessa boa nova. Mas ambos sabemos que essa menina pequenina tem toda uma vida em frente para construir sua trajetória com Deus ou o contrário. “Daqui a dez anos”, eu digo, “talvez estejamos sentados aqui nessa mesma lanchonete, tomando sopa, conversando sobre sua filhinha, que a essa altura será uma jovem! Certamente estaremos olhando juntos ao Senhor novamente, buscando toda a ajuda e graça que pudermos!” Rimos e balançamos as cabeças. Andamos até o estacionamento. Sem mais palavras a dizer, demos tapinhas nas costas um do outro, como muitas vezes fazem os homens. Ele voltou ao seu escritório. Eu fui ao encontro de outra pessoa.

Eu não visionava essa espécie de vida diária. Pensava que ser pastor seria algo parecido a um conferencista itinerante, profeticamente originando e dando uma visão de pregação a grandes multidões e organizações, para que pudesse constantemente demonstrar que não somos como outras igrejas e eu não sou como outros pregadores. A cada semana, eu mobilizaria e gerenciaria programas, contratando, despedindo e treinando o pessoal, para que pela força de minha personalidade, pela perícia de minha liderança organizacional e singularidade sábia de nossa presença, eu (quero dizer, claro, nós) poderia construir uma plataforma mais notável para o evangelho, de onde eu (ops, quero dizer nós) poderia subir em maior proeminência no evangelho. E então eu (aqui não estou falando de nós) poderia ir embora, passando a fazer coisas cada vez maiores e melhores para Deus no evangelho.

Porém, se aspiro a essa outra visão, quem ficará sentando sem pressa, escutando alguém em nome de Deus enquanto toma sopa no meio de um dia comum, em lugar corriqueiro, para que uma família desconhecida para o mundo, que ama a Jesus, encontre seu caminho nele em meio do que realmente os machuca, confunde ou os deixa mais maravilhados?

Jesus Cristo: timidez e fama

Anseio por palavras como estas que foram faladas para Jesus: “Todos estão te procurando” (Mc 1.37).

São essas as palavras de fama. No entanto, se Jesus era o famoso, por que as pessoas teriam necessidade de procurar por ele? A sabedoria convencional concordaria com o conselho da própria família de Jesus. “Porque ninguém há que procure ser conhecido em público… Se fazes estas coisas, manifesta-te ao mundo.”, cinicamente eles insistiam (Jo 7.4). Não entendiam como um grande obreiro de Deus escolheria um modo de vida que podia ser caracterizado por trabalhar “em segredo”. Não tenho certeza de que eu, ou a maioria das igrejas que eu já servi, teria entendido isso. O zunido a respeito de Jesus era tão público que ele não conseguia entrar abertamente numa cidade (Mc 1.45). Será que ele não deveria agarrar essa oportunidade de palco para Deus?

Contudo, seus irmãos reconheceram algo a respeito de Jesus que os irritou. Quando comecei a entender, isso também me incomodou (no sentido de convicção). Jesus não é atraído aos holofotes, mas é tímido quanto à fama. Os discípulos e amigos tinham de procurá-lo. Ele não estava tuitando. Seu blog não era visitado. As respostas dos e-mails não eram imediatas. Muitas vezes o encontravam sozinho, orando em lugares isolados (Lc 5.16). Na verdade, parece que quando Jesus estava no lugar certo, no tempo certo, e a oportunidade de avançar seu trabalho por meio de maior celebridade aparecia, ele intencionalmente permitia que essa chamada fosse para a caixa postal e desaparecesse por algum tempo (Jo 6.15).

Jesus teria deixado desnorteado qualquer publicitário ou mesmo qualquer congregação. Na verdade, após fazer algo grandioso, muitas vezes Jesus pedia que ninguém falasse a respeito.5 Talvez o pedido de Jesus para que ninguém alardeasse fosse em parte uma estratégia de marketing de falsa humildade. Os artistas fazem isso ao indicar que não querem nosso aplauso, enquanto por outro lado, simultaneamente, o estimulam. Talvez simplesmente fosse provado ser nada prático para Jesus ministrar livremente a outros se soubessem quem ele era. Vemos essa analogia com estrelas de rock e celebridades de nossos dias, as quais têm de viajar em horários estranhos e usar disfarces quando andam em público.

Mas revisitando tais explicações, e se a razão de Jesus para diminuir a conversa a seu respeito fosse simplesmente proveniente de viver aquilo que ele ensinou? “Guardai-vos de exercer a vossa justiça diante dos homens, com o fim de serdes vistos por eles; doutra sorte, não tereis galardão junto de vosso Pai celeste” (Mt 6.1), ele ensinou.

De alguma forma diminuímos as coisas que glorificam a Deus quando “tocamos a trombeta diante de nós, como fazem os hipócritas” (Mt 6.2). Ele cria que fazemos melhor as grandes coisas para Deus quando a mão esquerda não sabe o que faz a direita — quando aquilo que fazemos para ele passa despercebido e não é reconhecido pela imprensa, pela igreja, e até mesmo pelos que estão mais próximos a nós (Mt 6.3). Existem questionamentos que me perturbam: Será que tenho garra para passar despercebido? Posso lidar com o fato de ser ignorado? Minha espiritualidade me capacita a fazer algo desconhecido para a glória de Deus?

Não é de admirar que Paulo esperasse muitos anos antes de contar a uma alma sequer sobre uma experiência que teve com Deus. Ele nem a contava como sendo sua própria experiência. Relatou-a como se fosse a história de outra pessoa, desviando a atenção de si (2Co 12.2–4).

Jesus não ignorava os benefícios tentadores da fama. Obtemos recompensa real do aplauso de outrem. Mas quando cessa o aplauso, também acaba sua provisão (Mt 6.5). O momento deslumbrante se apaga no teatro vazio de nossa vida, onde as questões fundamentais ainda permanecem. Assim, três vezes, quando Jesus enumera as coisas justas que fazemos, ele nos compele a considerar “vosso Pai que vê em secreto” (Mt 6.4; veja também os vv. 6, 18). Ao fazer isso, ele inverte o sentido tomado no Éden. Fomos feitos para viver sob o olhar do Criador, livres da procura da fama proveniente dos outros.

Aqui vem à mente um pensamento perturbador. Como a indiferença à fama por parte de Jesus informa o modo de tratarmos o desenvolvimento de nossos ministérios ou de modelar um ministério para ele? Estamos dispostos a abrir mão do que dá certo no mundo por aquilo em que Jesus nos ensina a confiar? Eu fico confuso.

Novamente vem à tona um pensamento que fortalece. Deus é aquele que lembra. Isso não quer dizer que somos esquecidos — não por ele. De fato, ser lembrado por Deus significa que não tememos mais o sermos esquecidos pelo mundo. Viver sendo lembrados por Deus é o suficiente.

Pessoas invisíveis, Orações invisíveis

Jesus vive de forma poderosa essa joia de verdade e a compra para nós. Você já notou a rede estratégica de comunicação por parte de Jesus no Evangelho de Lucas? Quase não existe (pelo menos em relação a conhecer e se conectar com aqueles que são importantes). Parece que Jesus intenciona notar e orientar sua agenda em volta das montanhas sem nome a seu alcance. Ele faz visitas pessoais aos que estão doentes fisicamente e espiritualmente, incluindo uma sogra, um leproso, um paralítico e um cobrador de impostos (Lucas 4–5). Houve também o homem com a mão atrofiada, a doença do servo de um gentio, e uma viúva e seu filho morto (Lucas 6–7).

Jesus finalmente passa tempo com centenas de pessoas numa multidão. Porém, naquela turma, não são os ricos, os conhecidos e bem situados que Jesus procura. O seu foco continua sendo os enfermos e conturbados (Lc 6.17–18).

Até mesmo João Batista fica confuso. O jeito de Jesus fazer as coisas parece estrategicamente desconcertante. “És tu aquele que estava para vir ou havemos de esperar outro?”, João pergunta (Lc 7.19). Não é estranho que a vida de amar pessoas desconhecidas, em meio à sua miséria, fizesse com que outros entre nós questionassem se era hora de nos afastarmos, indo adiante de Jesus?

Mas, assegurando a João, por meio das Escrituras, que essa maneira de gastar o tempo é exatamente o que Deus quer, Jesus veio ao encontro da mulher pecadora, e em seguida, a várias mulheres comuns e alquebradas. Depois, a quilômetros de distância, havia aquele homem nu, que gritava entre os túmulos também entre gentios (Lucas 7–8). Jesus o procurou igualmente.

A essa altura, algumas multidões começaram a ficar confusas quanto ao comportamento de Jesus. Pediram que os deixasse em paz (Lc 8.34). Jesus concede o seu pedido. Está disposto a permitir que a multidão se ajunte sem a sua presença. Em seguida, ele gasta tempo com outra mulher enferma e a filha enferma de um dirigente da sinagoga (Lc 8.40–56).

O rei Herodes agora fica perplexo e deseja uma audiência com Jesus. Jesus parece não ter interesse em mudar a sua agenda para incluir tal encontro (Lc 9.7–9)! Em vez disso, Jesus manda seus discípulos gastarem tempo com os que são física e mentalmente perturbados. Em seguida, começa a falar sobre a morte e a cruz que, com o tempo, tem de se tornar tanto dele quanto de seus seguidores (Lc 9.21–27).

Finalmente, Jesus se revela como verdadeiro Filho de Deus, maior que Moisés e Elias! Mas ele limita essa visão a apenas três pessoas, e ninguém deve falar a respeito disso (Lc 9.29–36).

Na verdade, durante este tempo, Jesus continua a se afastar, indo a lugares desertos para extensos períodos de oração (Lc 4.42; 5.16; 6.12; 11.1). Após passar tempo com alguns samaritanos e duas mulheres obscuras que eram suas amigas (Maria e Marta), os discípulos (que recentemente haviam discutido qual deles seria o mais famoso, Lc 10.46–48) notam o estilo de vida de Jesus e dizemlhe: “Senhor, ensina-nos a orar” (Lc 11.1).

Então Jesus começa a envolver aqueles que possuem boas conexões e influência na comunidade. Mas tais conversas não são nada diplomáticas. Terminam com um advogado altamente respeitado que exclama a Jesus: “Mestre, dizendo estas coisas, também nos ofendes a nós outros!” (Lc 11.45). E quanto aos líderes da elite na comunidade? A sua atitude frente a tudo isso foi ficar à espreita, “com o intuito de tirar das suas próprias palavras motivos para o acusar”, (Lc 11.54).

A ideia de Jesus de fazer grandes coisas para Deus significa uma rotina que acentuava uma grandeza diferente. Sua agenda pode parecer um pouco como a seguinte.

Particular:

– Cedo de manhã e no fim da noite: desaparecer frequentemente para orar.

– Após o café da manhã até pouco antes do jantar: procurar pessoas desconhecidas e assustadoramente quebrantadas e oferecer-lhes a maior parte do tempo. Separar tempos para o ensino público e para explicações em particular àqueles que você está oferecendo mentoria.

– Começo da noite após o jantar: passar tempo juntos e ter prazer um no outro

Geral:

– Comer e dormir.

– Ajudar os outros líderes para que entendam pela Palavra de Deus que este modo de ministério vem de Deus e não é um desperdício.

– Suportar e apoiar as pessoas que você ajuda mas que se distanciam de você porque o seu estilo de vida e ministério os assusta.

– Não se preocupar por sua verdadeira glória ser encoberta a quase todos a seu redor.

– Não marcar tempo demais na agenda com os que acreditam ser as colunas no governo ou na igreja. Lembrar-se de que eles também são apenas pessoas. Eles têm seus próprios pecados dois quais se arrepender e seus próprios chamados para cumprir. Não são mais importantes do que os perdidos e aqueles que estão quebrantados a quem você foi chamado a ministrar.

Frequentando o seminário de Jesus

Afastar-se para a oração? Tempo prioritário com pessoas comuns e quebrantadas que não são notadas pelo mundo? Uma ativa indiferença aos que não têm cacife? O modo de Jesus não é o caminho da celebridade.

Talvez esta seja a razão por que Jesus treinava os trabalhadores para o ministério de modo tão diferente de nós. Note, por exemplo, aonde Jesus conduz seus discípulos para torná-los pescadores de homens (Mc 1.17–45). Ele os leva entre os enfermos, os pobres, os possuídos por demônios, e pessoas de toda sorte, incluindo professores, “hippies” urbanos, gente da roça e a sogra de Pedro. Em certa altura os discípulos estão cercados de todos os enfermos e endemoniados da área. Imagine o que significava seguir e aprender de Jesus no meio dessa visão, desses sons, desses cheiros trágicos e pútridos.

Por todo o Evangelho, observamos a Jesus ensinando teologia consistentemente no meio da ala psiquiátrica. Assentou seus aprendizes como se estivessem no pronto-socorro. Os introduziu a vistas horrendas, sons angustiados e aromas acres de pessoas humanas de verdade, com suas doenças, suas batalhas contra demônios, suas disputas, sua pobreza e sua perda de cônjuges. Ele os levou para bem perto dos preconceitos étnicos, das injustiças, ansiedades e traumas, e também das alegrias, prazeres, deleites e anseios de seres humanos comuns. Os discípulos de Jesus aprenderam a respeito de Deus dentro do contexto de situações de vida corporal, que realmente existem no mundo, as ramificações sensoriais da realidade debaixo do sol.

Imagine aprender nossa doutrina de Deus, estudando nossos melhores teólogos, enquanto sentados no pronto-socorro, em meio a pais ansiosos, crianças traumatizadas, ferimentos de armas de fogo e ataques de asma. Imagine ler teologia entre o cheiro de café velho, o som do choro, e as visões de perplexidade, trauma e frustração. Que impacto teria isso sobre como processamos as doutrinas e categorias da onipotência, onipresença e onisciência de Deus? Que tal lermos nossa doutrina da salvação onde pacientes mentais vagueiam assustados pelos corredores, onde medicamentos, orações e pais impotentes lutam com problemas com o seguro, papelada e a pressão de orçamentos estourados?

Dentro desse ritmo corporal diário, não é de se admirar que Jesus se retirasse em tempos estratégicos para oração — e nos convida a segui-lo do mesmo modo.

Mas isso não funciona!

Eu conversava com um pastor que serve em uma congregação grande, famosa e muito elogiada. Mas, internamente e em particular, sua equipe pastoral está esgotada e sofrida. Ele explicou: “Nas últimas semanas tenho trabalhado com nossa equipe, tentando identificar os valores atuais praticados em nossa igreja — não os valores que esperamos que nossa igreja tenha, mas os valores revelados pelas queixas, caminhos e desejos expressos entre os que a frequentam”.

Ele fez uma pausa, olhou para baixo e balançou a cabeça. “Nós determinamos que na cultura de nossa igreja valorizássemos o profissionalismo, a excelência e a Bíblia. Profissionalismo é interpretado de maneira que a transparência ou honestidade relacional seja suspeita e um sinal de fraqueza. Excelência quer dizer que é difícil ser humano. Qualquer erro é rápida e severamente criticado. Nossa posição quanto à Bíblia, conforme interpretada através dessa visão de profissionalismo e excelência, significa que a informação bíblica é prezada, mas não que nos exponha ou derreta, especialmente se não for ensinada com os mais altos padrões acadêmicos”.

Ele continuou: “Recentemente, tentamos convidar os membros da igreja para um jantar sem nenhuma agenda, somente para conhecer melhor uns aos outros. Muitas pessoas nos disseram depois que, como pastores, havíamos desperdiçado o seu tempo porque não lhes demos nada a fazer exceto permanecer sentados junto a outras pessoas, conversando, comendo e olhando as crianças brincar”.

Ao escutá-lo, meu coração doía. Este pastor querido estava esgotado por anos de constante pressão para esconder seu coração, não cometer nenhum erro e ter constantes e novas informações da Bíblia a transmitir. Neste ambiente, no qual cultivar os relacionamentos é visto como perda de tempo, falei algo sobre uma citação do livro de Eugene Peterson: A Vocação Espiritual do Pastor.6

“É, eu não leio mais Eugene Peterson”, disse ele com sorriso sofrido. “Ele extrai de mim os anseios por aquilo que uma comunidade de seguidores de Jesus deve ser e como meu tempo de pastor deve ser gasto. Mas se eu enfrentar meu dia real nesse sistema, não consigo sair daqui para lá e ainda manter o meu emprego. O Senhor sabe que já tentei”.

Ele passou então a dizer algo perspicaz: “Para que essa igreja cresça de modo saudável teria de haver uma mudança de cultura. Mas isso significaria que provavelmente perderíamos várias centenas de pessoas. Tão logo deixemos implícito que o evangelho demonstra a força na fraqueza, graça pelos erros que cometemos, e a verdade bíblica quanto ao contexto relacional e visão sacramental do tempo, muitos ficarão agitados e irão embora. A boa notícia é que não nos curvaríamos mais aos pressupostos congregacionais imaturos e nocivos, e poderíamos pastoreá-los mais à maneira de Jesus”, ele disse.

Então ele sorriu, irônico. “Mas aqui está o fator contra: ainda que alguns se juntassem a nós para tentar refazer uma mente voltada para um pensamento de celebridade, moldando-a à mente de Jesus, nossa comunidade externa como um todo observaria essa perda de pessoas na igreja estabelecida e concluiria que nós, os pastores, fracassamos. Seríamos conhecidos na comunidade que nos cerca e em nossa denominação como aqueles em cuja vigília a igreja passou de dois mil para menos de mil e quinhentos membros. Por causa disso, eu não acho que nossos líderes tenham estômago para tal redirecionamento. Estamos atolados, e eu também estou”.

Não existe aqui resposta simplista. Uma igreja da contracultura, que seja “orgânica”, “inquieta”, e “casual” pode facilmente ser medida pelas celebridades com as quais nos comparamos, julgando os outros e mantendo nossos seguidores. Talvez você também tenha observado isso. Aqueles irmãos e irmãs que lutam com o desafio que Jesus faz quanto à celebridade do profissionalismo e excelência geralmente se vestem do mesmo modo: empresário formal ou empresário casual. Esses irmãos e irmãs que lutam com o desafio de Jesus à celebridade daquilo que é orgânico e de última geração igualmente se vestem em geral de maneira igual: jeans estreito, camisetas obscuras, pulseira larga do relógio, óculos de aro estreito. Em ambos os casos, temos de reconhecer o elefante na sala — prestamos muita atenção aos detalhes de nossa aparência.

Confiando em Jesus mais que nas aparências

Para onde nos levam essas coisas? O pastor, e também a maioria de nós, tinha dois temores: (1) as pessoas irão embora; (2) nós seremos julgados como fracassados. Esses dois mantras — mantenha as pessoas chegando e continue mantendo elevado o nosso índice de aprovação — são o caminho da celebridade.

Consequentemente, não é tarefa fácil dizer: “Chega disso!”

É requerido de nós coragem, porque alguns vão ameaçar a perda de nosso emprego se procurarmos fazer essa espécie de mudança quanto à disposição mental de celebridade (Jo 12.42). Seremos passados para trás e reduzidos em nossa influência caso persistamos.

É necessária a paciência, porque as categorias de Jesus para o sucesso são tão estranhas a tantos de nós — essa espécie de mudança não acontece da noite para o dia.

É necessária a graça, porque quem poderia arriscar uma perda dessas em nosso mundo eclesiástico e cultural, e quem poderia amar longa e firmemente a ponto de mudar à parte do mundo?

Nessa altura, temos de nos lembrar de duas coisas que estão diante de nós.

Primeiro, as pessoas criticaram, resistiram, desprezaram e abandonaram Jesus. Lembre-se de que Jesus tinha sobre sua vida uma ameaça de morte porque ele curara alguém. As multidões de milhares foram reduzidas a doze porque Jesus expôs as suas razões mal dirigidas para segui-lo (Jo 6.1–15). Pense nisso por um pouco. Realizar o que cura a alguns no evangelho vai provocar e deixar outros com raiva. O tamanho da turma não tem nada a ver com isso.

Se uma multidão se reduz porque a maneira, o caminho, e os valores de Jesus estão ausentes num líder, então é justamente a hora de haver mudança. Mas, se as multidões vão embora porque o modo de agir e o sistema de valores de Jesus os confrontou e conturbou a atração de uma mente fixada em mundo/carne/diabo, então é hora de apoiarmos este líder. Ele precisa de nossa ajuda, e não de nosso malquerer. Basta o que ele já sofre com isso.

Já descoberto

Eu era universitário de cabelo comprido. Bob era pastor no campus, servindo ao ministério cristão dos Navegadores. Regularmente ele me convidava para orarmos juntos em lugares ermos. Olhando hoje para trás, fico maravilhado de como Bob não viu isto como perda de tempo. Sou grato. Frequentemente, depois de umas duas horas de oração, ficávamos sentados juntos e conversávamos. Certa vez, Bob olhou para mim.

“Zachary”, disse ele. “Você já foi descoberto”. “O quê?”, perguntei. “O que quer que aconteça em seu futuro, com todos os seus sonhos e esperanças, quero que saiba que o ser descoberto já aconteceu. Jesus já o conhece, ouve as suas orações e se deleita em conhecê-lo”.

Em retrospectiva, penso nessas palavras. Será que eu já tinha sido descoberto por Jesus muito antes do seminário, dos tempos de aprendizado, dos prêmios recebidos, das viagens, livros publicados, e, tristemente, dos dez errôneos anos de projeções? Já era conhecido antes dos escombros e da ruína, e de pregar descalço no santuário da segunda oportunidade?

Como poderia ser isso, a não ser que Jesus tivesse como hábito dar o seu tempo para pessoas desconhecidas e alquebradas, nos lugares fora de mão, desprezados pelo mundo, e tendo ele prazer em mim?

Ocorre-me o pensamento que me faz parar, surpreso. Se o trabalho pastoral de Jesus consistisse em realizar grandes coisas, de maneira famosa e mais eficiente, e o mais depressa que pudesse, eu jamais o teria conhecido. Ver, por exemplo, Mateus 8.4; 9.30; Marcos 1.44; 3.12; 5.43; 7.36; Lucas 8.56. Eugene H. Peterson, A Vocação Espiritual do Pastor: Redescobrindo o chamado ministerial (São Paulo, SP: Mundo Cristão, 2006)$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -8;

  -- 5 | Estar em todo lugar para todos (reaproveita a aula de ordem 9: preserva o progresso)
  update public.aulas
  set titulo = $t$5 | Estar em todo lugar para todos$t$,
      ordem = 9,
      conteudo =
$conteudo$Existe um dia, quando a estrada não vai e nem vem, e o caminho não é um caminho, mas um lugar.

–Wendell Berry

É tão óbvio quanto o ar.

Para se fazer algo, é necessário estar em algum lugar. Tem mais. Você eventualmente acaba chegando aonde vai chegar. Já pensou nisso?

Uma coisa é fazer o que você precisa para chegar a algum lugar. Outra bem diferente é saber como ficar por algum tempo uma vez que tenha chegado lá.

Lançando raízes

“Zack, a sua vida é como um incêndio que faz soar todos os alarmes. Você vem e vai por tantas direções diferentes. Eu me preocupo com você”. As palavras de Bill me abalaram quando eu era jovem.

Uma de minhas chefes expressou o mesmo sentimento dez anos mais tarde. “Você está fazendo tantas coisas diferentes”, ela disse. “Queremos que você esteja por aqui por muito tempo, então, marque melhor seu compasso, está bem?”

Dois colegas me convidaram para almoçar, enquanto outro me telefonou. “Estamos preocupados com você”, disseram todos.

Foi então que recebi uma carta. Era daquele tipo de antigamente, com um selo no envelope. Abri e ouvi a voz da minha mãe enquanto lia. Ela também deve ter ouvido o alarme. “Filho, uma árvore tem de ter raízes para oferecer sombra”.

Marque bem isso aqui, certo? Nós nunca fomos feitos para nos arrepender por não estarmos em todos os lugares, para todas as pessoas, e tudo de uma só vez. Fomos feitos para nos arrepender daquilo que tentamos ser e fazer.

Avançando pela limitação

Uma jovem mulher fez uma lista de tudo que não teria se escolhesse para si a carreira de poeta. Avaliou seus amores mais verdadeiros e abandonou todas as outras vidas possíveis e imagináveis por amor à vida de uma poetisa.7

Quando me tornei pastor eu não fiz tal lista. Nunca imaginei que se eu dissesse: “Jesus, toma-me e leva-me a todo e qualquer lugar contigo!”, seria possível que eu o visse dizer sim a outros com o mesmo pedido, enquanto dizia não a mim (Mc 5.19).

Não é que a Bíblia não tenha me preparado para isto. O apóstolo Paulo colocou uma lista parecida com essa da poetisa em plena luz do dia, para que todos a vissem. Mas eu estava ocupado demais estudando 1Coríntios 12 ou Romanos 12 para exames que requereriam o meu ponto de vista sobre línguas, profecia, apóstolos e milagres. Na verdade, eu nunca havia tratado da mensagem clara e simples das palavras de Paulo — ou seja, que algumas pessoas possuem este dom, mas não aquele, e que esses limites revelam a provisão de Deus para o nosso bem. Paulo diz que as mãos precisam dos pés e o olho precisa do ouvido. Eu teria resistido, supondo que pudesse me tornar todos os quatro de uma só vez!

Jamais teria imaginado que o chamado que me foi dado pelo amor de Cristo poderia ser considerado “mais fraco”, “menos honrado” ou “não apresentável” em comparação ao chamado de outros (1Co 12.22–26).

Pelo contrário, quando li na história de Jesus que Deus dá a alguns cinco, a outros dois, e a outros apenas um talento, naturalmente eu presumi ter os cinco (Mt 25.14–30). Quando li a história de Jesus sobre alguém cuja ceifa produziu de cem, sessenta ou trinta vezes o que foi semeado, jamais imaginei que eu seria o cara dos trinta, vivendo a vida à sombra de meus colegas que produzem cem (Mt 13.18–23).

Meu ponto é o seguinte. Se quisermos usar os nossos dons, é requerido de nós que tomemos um passo. Mas em qualquer direção que colocarmos nosso pé, necessariamente deixaremos todas as outras direções vazias para os passos de outra pessoa.

Assim, se Jesus tivesse me perguntado: “O que você quer que eu faça por você?”, eu nunca teria respondido: “Senhor, desejo uma vocação que me limite e me torne dependente dos outros”. Mas fica claro que eu deveria. “E ele deu a uns para apóstolos, outros para profetas, outros para evangelistas, e outros para pastores e mestres...”, Paulo diz (Ef 4.11). Como pastor, posso até ser apostólico, mas não sou um apóstolo. Sou profético, quem sabe, mas não sou profeta. Sou evangelístico, mas não um evangelista. A minha vocação, portanto, não é itinerante e móvel como esses outros três.

Em contraste, eu sou pastor mestre. Pastor significa “pastor” mesmo. Os pastores são os que retornam. Pastores permanecem quando o apóstolo, o profeta, e o evangelista chegam e depois vão embora. Somos confrontados por questões do coração aqui. O que significa para alguém viver uma vocação em que se faz necessário aprender a voltar? O que significa abrir mão de uma vida itinerante?

Aprender a ficar parado em um mesmo lugar me deixa inquieto. Raramente em minha vida tenho visto pessoas que permanecem juntas em famílias ou igrejas ou denominações. Como é que alguém que vem de um lar desfeito, tendente a subir na vida, irrequieto por querer algo maior, mais notável e atual, pode querer tornar-se pastor?

Jesus.

Aprendendo o nome das árvores

Fui criado no vale do rio Ohio, na região sudeste mais baixa de Indiana, perto de Louisville, Kentucky. Muitas dessas cidades têm nomes de homens — Charlestown, Georgetown, Scottsburg. Em Clarksville aprendi a ter confiança no futebol e timidez com as garotas. Aprendi a dirigir em Floyd’s Knobs. Ainda adolescente eu podia dirigir de olhos fechados pela estrada de Buck Creek.

Mas Henryville foi designada como a cola que grudou minha vida. Meu nome está rabiscado em giz ali, num armário debaixo das escadas, na casa que meu papaw construiu. A Igreja Metodista Unida de Henryvillle tem um longo, belo e, por vezes, tumultuado relacionamento com minha família. O cemitério Monte Sião dá repouso a muitos da minha gente — aqueles a quem tenho conhecido, amado e de quem sinto saudades — e também aqueles sobre quem só ouvi falar. De fato, as famílias de minha mãe e de meu pai, os Guernseys e os Eswines, ambas têm suas raízes nesta pequena cidade. Meu papaw tinha uma caneca lá no Tanners, reservada só para ele e seu amigo de longa data, que deram a si mesmos o nome “clube de mentirosos”. Na maioria das manhãs, eles se assentavam para desfrutar da companhia um do outro antes de começar o trabalho do dia. Pessoas que moram em Henryville já trocaram a minha fralda. Me encontro com elas nos enterros. Só por olharem para mim, dizem que devo ser o filho de Vern.

Foram os demônios que primeiro chamaram a minha atenção para o senso de lugar que Jesus demonstrava (claro que me refiro àqueles demônios que a Bíblia menciona). Não estou acostumado a aprender nada de demônios. Um homem que tem pouco tempo para as árvores em seu terreno vai ter ainda menos tempo para criaturas invisíveis. Mas o Evangelho de Marcos documenta uma conversa entre Jesus e demônios. “Que temos nós contigo, Jesus Nazareno?”, eles sibilaram. “Vieste nos destruir? Bem sei quem és: o Santo de Deus!” (Mc 1.24).

Primeiro, os demônios identificaram Jesus com Nazaré; e, segundo, sabiam que este Jesus era o Santo da parte de Deus. Ponderei a conexão. Revirei-a na minha cabeça. Jesus de Nazaré é o Santo da parte de Deus. O santo de Deus é Jesus de Nazaré. De repente a luz acendeu. Vi o que me fugira antes. Se o Santo da parte de Deus é Jesus de Nazaré, então o santo de Deus tem uma cidade de onde procede.8 Aquilo que dá sombra tem raízes.

Jesus estava em um lugar, não em todo lugar ao mesmo tempo. Tinha uma igreja de origem. Tinha uma família e um ofício conhecido, e às vezes era desafiado pela sua comunidade (Lc 4.16– 30). Se o rio Ohio está sempre presente na minha criação, para Jesus era o rio Jordão. Eu pescava e andava de barco nos lagos Patoka e Deam. O lago conhecido como Mar da Galileia oferecia praias, águas e peixes para Jesus. Ele conhecia todos os atalhos e caminhos na região da Galileia, da mesma maneira em que eu conheço os que são próprios do vale do Ohio. O Santo de Deus tornou-se homem — e esta encarnação incluiu limitar-se e habitar determinado local na terra.

Enquanto morava nesse lugar, Jesus conhecia o nome das árvores. Construía com eles o que a sua mente imaginava e que sua habilidade desenvolvera no tempo. Entre os aromas de madeira recém-cortada, os ossos e sangue das mãos de Jesus formavam uma aliança. Elas davam forma e lixava longos troncos e pranchas de madeira, que se transformavam em mesas e cadeiras.

Jesus transformava essas madeiras em artefatos durante o tempo que os teólogos se referem como seus “anos de obscuridade”. Penso nisso quando me lembro de Papaw e Mamaw visitando a minha casa em St. Louis. Eles me disseram em poucos minutos o que eu não aprendi em dois anos — o nome das árvores e dos arbustos na minha propriedade alugada. Andamos devagar. Eu precisava escutar, mas escutar exige sossego. Eu lutava com ambas essas coisas enquanto Papaw e Mamaw deram o nome a meu lugar por mim.

Estou tentando dizer como isso tudo me deixa inquieto! Fico confuso sobre tudo que Jesus está fazendo entre as lascas de madeira. Você não fica? O que significa essa serragem presa na barba de Jesus e pendurada do seu sorriso — e toda essa obscuridade de casca de árvore durante trinta anos? Trinta anos! Jesus tinha um mundo a salvar, injustiça a confrontar, leprosos a tocar. Será que a grandeza por Deus não estava sendo desperdiçada pelos anos obscuros? Que negócio é esse do salvador aprender o nome das árvores?

Subindo montanhas

Em meu mundo de colarinho branco de pastor, planejamos nos encontrar, e nos encontramos frequentemente para planejar. “Em algum outro lugar estão fazendo alguma outra coisa maior”, é o lema não falado de nosso avanço missional. “Maior” significa mais santo e melhor. Como disse um pastor titular ao explicar por que ele raramente gasta tempo com a sua equipe: “Teremos toda espécie de tempo para nos reunir no céu. Mas agora temos um trabalho a fazer! Temos almas a salvar e discípulos a formar”.

Essa ideia parece tão estranha ao carpinteiro de Nazaré! Em lugares como Nazaré ou Henryville, avançar para algum outro lugar fazendo algo diferente é raridade. Em contraste aos pastores e gente de colarinho branco, igrejas de colarinho azul aprendem a testemunhar sobre o que viram ou ouviram nos dias comuns, porque o dia ordinário é o grande evento do dia, porque é a grande coisa que aconteceu. Aquilo que se viveu naquele dia torna-se o que realmente se fala naquela noite.

Por exemplo, o sorriso da neta lá no conhecido supermercado torna-se em história de quinze minutos, e que leva todo mundo a dar risada até doer a barriga. Esse sorriso foi suficiente para ser notado e a história valiosa bastante para ser contada. A risada, a história e o sorriso formam uma agenda suficiente para a conversa. Nada mais se requer para passar tempo juntos. Nos meus anos mais jovens, eu não prestava atenção ao comum que faltava. Enquanto eu me tornava certo da minha vocação pastoral, queria conversas “reais” sobre a vida “real”. Queria que falássemos sobre coisas importantes, coisas que faziam uma diferença na vida. Agora, começo a refletir mais sobre esses sentimentos. Desde quando falar sobre aquilo que vive não serve para uma conversa de verdade? Desde quando o sorriso de uma neta não é mais assunto substancial para se falar, especialmente para um pastor a quem foi dado testemunhar de Deus em um determinado local?

Quando certa vez perguntaram a George Mallory por que ele queria escalar o Monte Everest, ofereceu uma resposta que se tornou célebre: “Porque o monte está ali”. Mas em uma carta pessoal à sua esposa, Ruth, ele revelou ainda mais sobre o que o levava a subir a montanha. “Minha querida”, ele escreveu, “...você deve saber que meu estímulo para realizar meu melhor é você, e você [...] quero acima de tudo provar-me digno de você”. George deixou um legado significante que provou ser digno de lembrança na história. Mas John, o filho de George, escreveu algo que me desafiou. Orgulhoso de seu pai, mas também triste, John escreveu: “Eu teria preferido tanto ter conhecido meu pai do que ter crescido à sombra de uma lenda, de um herói, como algumas pessoas entendem que ele era”.9

As respostas que George deu quanto a seus motivos vem confrontando as minhas próprias respostas. A montanha “estava ali”, mas John, o filho de George, também estava. A montanha trouxe um senso de alegria e lhe deu um senso humano de luta para subir na própria vida. Porém, se George tivesse conhecido o filho, teria trazido também alegria e um senso de luta pelo propósito da vida. Subir a montanha capacitava George a se provar digno de sua família. Mas amar e prover para sua família nas rotinas comuns de uma longa vida, dia após dia também teria conferido essa dignidade. Então, por que George escolheu enfrentar o desafio da montanha, mas não o de sua sala de estar?

Nessa altura, estou duvidoso, sentindo que estabeleci uma falsa dicotomia entre, por um lado, o trabalho ou os sonhos de uma pessoa e, por outro, sua família e rotina. Afinal, não há nada moralmente errado com escalar o Monte Everest. George Mallory era um professor de escola com três filhos. Embora ele e Ruth estivessem geograficamente separados quase tanto tempo quanto juntos, temos indicações de que isso não era fácil para George. Assim, tenho de reforçar a pergunta: Por que George Mallory escolheu a montanha, quando entendia que isso poderia tirar a sua vida?10 Por que a procura de Mallory por alegria, significado da vida, valor da família, e lealdade para completar uma tarefa era ligada mais a subir uma montanha do que às rotinas diárias de amar e viver, de trabalhar e brincar reunido em sua casa?

Penso em meu Senhor, que aprendeu o nome das árvores de Nazaré.

Ouço o sussurro da Serpente. E se, para muitos de nós, o corriqueiro fosse a maior montanha?

Aprendendo a retornar

Parece estranho dizer isto, mas os pastores de Belém oferecem textos de teologia pastoral. Foram peritos em lidar com o anticlimático. Lembra-se?

Os anjos penetram os céus bem diante dos olhos desses pastores. Troveja em coro a glória de Deus. Antigas promessas são cumpridas e testemunhadas. O medo toma conta desses homens cuidadores de ovelhas. Boas novas lhes são comunicadas: “Nasceu o Salvador, e este será o sinal que o confirmará”. Ver e ouvir os anjos em si já era espetacular. Imagine como seria vistoso o sinal do Messias. Talvez Deus estendesse sua mão para criar um novo planeta. Aí ele o seguraria entre o dedão e o indicador e o colocaria em sua nova posição no universo, bem ali diante de seus olhos! Com certeza este seria um sinal digno de um salvador vindo de Deus!

Porém, aqui começa o anticlímax. Não foram formados planetas. “Encontrareis uma criança, envolta em panos, deitada numa manjedoura”. O sinal da fama de Deus estava deitado ali no aroma de gado e feno — a placenta de um novo nascimento, os choros e o calor da vida comum.

Não havia forma altiva que pudéssemos conhecer,

Não havia halo sobre sua cabeça

Nem trombeta a tocar,

Nenhuma majestosa fanfarra a alardear.

Ele nasceu no comedouro dos animais.

A estes pastores comuns, Deus revelou maravilhas gloriosas e fantásticas! Agora, o segundo anticlímax nos confronta. De acordo com o Evangelho de Lucas, depois de contemplar e participar deste evento grande demais para palavras, “os pastores retornaram” (Lc 2.20). Eles voltaram? Este fato me confunde. Depois de contemplar a glória, os pastores voltaram para casa.

A mesma coisa velha

Como podia ser isso? Eram pastores, homens que trabalhavam com as mãos. O aroma de animais e da vida no campo assumia residência na sua pele. Eram operários de colarinho azul, gente do tipo sal da terra. Entendiam o que quer dizer trabalhar no turno da noite. “À noite”, Lucas diz, eles vigiavam os seus rebanhos (Lc 2.8). Vigiar, não cometer nenhum erro, é uma palavra de adrenalina, que significava ficar de olhos abertos quando a maior parte da comunidade estava de olhos fechados. Anos dessa espécie de trabalho criam reclamação nas juntas e nos ossos das pessoas. Acrescente a isso a zombaria e as piadas feitas contra o estilo de vida do pastor, e minha pergunta inquieta parece ainda válida. Por que os pastores não tomaram o rumo da estrada?

Com tudo que viram, podiam ter começado uma série de conferências, planejado uma turnê promocional para seu livro, e conseguido instantaneamente milhares de seguidores de seu blog.

Fazer a mesma coisa, no mesmo lugar, pelo resto da vida era a sua sina e o seu legado. Eles podiam ter mudado tudo isso. O momento de celebridade os encontrara. Grandeza é coisa digna demais para ser diminuída pelo retorno às coisas ordinárias da vida!

Mas aqui, Deus em sua graça nos desconcerta. Com os pastores retornando, parece que Deus deixa seriamente implícito que ver a glória de Deus, ouvir sua voz, receber suas boas novas, e contemplar seu amor nunca deveria nos livrar da vida e do amor comum em um lugar — ao invés disso, deveria prover o meio para nos preservar ali.

Pare aqui por um momento. Não passe correndo por aqui. Não ignore o que acabei de dizer.

A oportunidade de ser celebridade não remove as demandas de amor ao próximo que ainda existem. Alguém ainda terá de cuidar das ovelhas, criar roupas para as pessoas, prover leite e alimento para os vizinhos. Mesmo que os pastores pegassem um ônibus de turismo e viajassem juntos, o seu chamado para amar um ao outro e a seu próximo, comer, lavar suas roupas, procurar e conceder perdão um ao outro em momentos comuns, assistir aos enfermos, celebrar aniversários e buscar a Deus não iria embora.

Todo viciado sabe disso. O momento glorioso fornecido pela droga não remove o chamado comum da vida. É esse o problema. O “barato” não dura. Caímos na real, e nossos amados ainda estão ali, ansiosos por fazer coisas comuns na vida juntos, sofrendo pelo que está sendo tirado deles.

Todo herói sabe disso. O homem que faz o gol ganhador da Copa do Mundo sabe que amanhã à noite ou na próxima estação ele terá de começar de novo — vem aí outro jogo. Ele ainda tem de aprender a escutar a sua mulher e a amá-la, resistir ao apoquentar dos filhos, aprender como dar o coração com autenticidade a Deus e receber amor e sabedoria de Deus para sua vida. O bombeiro que salva uma vida, o executivo que salva o dia financeiramente, a mãe que salva o dia por seu filho — o momento que parece céu empolga e celebra. Mas não é o céu.

Para os pastores “voltar” expressa a sabedoria de Deus. Retornamos à mesma realidade velha, à mesma velha coisa, mas somos transformados e recebemos poder para ali habitar e ter prazer naquilo que testemunhamos da sua graça.

Alguém poderá dizer: “Esse é um bom sentimento, mas a mídia social permite que eu esteja em todo lugar o tempo todo. Os pastores não estão mais assim tão limitados”.

Só posso lhes dizer que meu livro foi premiado. Aqueles que escutaram minha entrevista na rádio foram grandemente ajudados e me fizeram saber disso. Mas dei a entrevista de pijama e olhos vermelhos, de uma casa de retiro na mata de Missouri. Eu estava quebrantado. Nunca poderia ter falado pessoalmente daquele jeito, e se tivesse tentado, eu teria de fingir muito. O meu ponto é que não importa o quanto a tecnologia permite que nossos dons viajem, nós mesmos, as pessoas que realmente somos, permanecem arraigadas em um só lugar em um só tempo.

Eu o saúdo sentado em meu assento particular nessa cadeira específica com esse velho e vagaroso laptop nesta sala. Não estou em todo lugar ao mesmo tempo. Só estou aqui — em um lugar de cada vez. Na plenitude da humanidade de Jesus, assim era também com ele. Para seguirmos a Jesus, temos de passear por uma carpintaria em Nazaré.

Indo enquanto permanece no mesmo lugar

Várias vezes eu tenho falado a pastores que anseiam deixar o seu lugar e chamado atual, não corretamente, por causa do esgotamento ou segurança para si mesmos ou para suas famílias, mas devido aos limites e tédio ou trabalho duro que encontram em meio ao terreno rochoso do mesmo lugar e da mesma coisa. Permanecer parado enquanto outros colegas parecem avançar e subir para chamados mais empolgantes e aparentemente mais influentes do ministério, em meio a uma cultura que os elogia e nos ignora, só intensifica essa inquietação. Então, esses pastores se aplicaram a outros chamados, mas nenhuma porta se abriu para que saíssem. Com propósitos que só Deus sabe, aquele que governa a providência tem em mente que eles permaneçam mais tempo do que querem. Na minha própria inquietação, às vezes tenho voltado não só para a mentoria dos pastores do primeiro natal, como também aos exilados de Jeremias 29. Primeiro, eu o faço para lembrar a mim mesmo que, como os antepassados da fé, ter de ficar no lugar onde estou não possui o nível de sofrimento que talvez eu erradamente imagine. Segundo, é aprender o que significa seguir a Deus quando estou num lugar que desejo deixar.

Em Jeremias 29, dois tipos diferentes de pregadores estão fazendo sermões aos exilados. O primeiro é Jeremias. Jeremias fala da parte de Deus. Diz aos exilados que eles terão de reinventar a vida onde eles se encontram. Não vão para outro lugar nos próximos setenta anos. Isso significa que todos, com exceção dos bebês nascidos naquele tempo, terão falecido e suas vidas já terão terminado. Os bebês terão vivido a maior parte de suas vidas antes do tempo em que terão a chance de voltar “para casa”. Esta mensagem é dura de engolir.

Um outro grupo de pregadores está dizendo o contrário. “Não finquem suas raízes!” “Deus não iria manter vocês exilados desse jeito!” “Ele vai tirar vocês daqui!” “Sonhem, mexam-se, arrumem a bagagem; este lugar é temporário; aprontem-se para mudar!”

Qual igreja você prefere frequentar se estiver no exílio? Acho que eu também preferiria não escutar a Jeremias. De fato, durante toda minha vida um versículo dessa passagem tem sido citado para lançar uma visão para meu futuro e o seu. “Eu é que sei que pensamentos tenho a vosso respeito, diz o Senhor; pensamentos de paz e não de mal, para vos dar o fim que desejais” (Jr 29.11).

O que não percebo quando assumo essa maravilhosa promessa é que quase todo mundo que originalmente ouviu essa promessa sabia que nunca iria experimentar a sua realização em Jerusalém, onde eles queriam estar. Eles tiveram de lidar, em vez disso, com a verdade de que o futuro e a esperança com Deus tomariam o lugar certo onde eles estavam, isto é, no exílio – lugar onde iriam viver e morrer. Os seus bisnetos experimentariam a plenitude do futuro e a esperança de voltar para Jerusalém. A próxima geração iria começar a se mover, mas não eles. O que significa para nós se, o futuro e a esperança que Deus tem em vista para o nosso bem, no fim das contas, implica em que teremos de confiar nele exatamente onde estamos?

Eles querem ir embora, mas Deus estará com eles na cidade onde estiverem. A cada dia olharão novamente para Deus a fim de cultivar um lugar em que viver, fazer seu trabalho, amar, casar, cultivar uma herança para a família, e realmente buscar o bem da cidade que queriam deixar, enquanto cultivam uma vida de oração habitando nela (Jr 29.5–7).

Isto significa que Deus estará com eles para sustentá-los e ensinálos, o que implica em andar com ele em meio a obstáculos que prefeririam não ter de enfrentar.

• Limites. Terão uma vida na qual não poderão estar em todo lugar em geral e em nenhum lugar em particular. Não somente terão de decidir o que farão, como também terão de se entender com aquilo que não poderão fazer. • Ambições. Terão de aprender a reorientar as suas ambições para o bem da glória de Deus e do seu próximo, naquilo que é o comum da vida, para o bem de seu lugar. • Frustrações. Terão de suportar imperfeições, irritações, desgostos e dificuldades. • Emoções. Aprenderão que aquilo que nos faz alegres, tristes, zangados ou assustados, não pode ser resolvido apenas por uma mudança geográfica. • Espírito crítico. Serão tentados a “ligar os pontos” de tudo que está errado. Eles aprenderão a gratidão neste lugar. • Sofrimentos. Terão de estar no mesmo lugar das pessoas que os feriram ou sobre os quais falaram mal. Aprenderão sabedoria e cura neste lugar. • Tempo e medidas de progresso. Setenta anos (aprenderão paciência neste lugar).

Exultando na monotonia

Mas como retornarmos dia a dia para congregações e situações em que nos sentimos inquietos pela vontade de ir embora?

Retornar a essa comunidade significa sofrer. Como eu volto para perdoar ou suportar narrativas a meu respeito acerca de algumas coisas?

Existem lugares aqui que me entediam. Quando os vejo, sinto que já voltei. Como eu retorno à chatice?

Aqui existem pensamentos, emoções e histórias. Quando as ouço, fico assoberbado. Como voltar para aquilo que eu não consigo consertar?

Há beleza aqui, e esperança, o anseio por redenção e propósito. Como retornar sem desprezar esses dons por causa de minha dor, meu tédio, minha incapacidade?

Tais questões iniciam discussões dentro de mim. Então, olho pela minha janela em Webster Groves ou Henryville ou onde quer que estivermos. “O Senhor é meu pastor”, podemos dizer. “O meu pastor é um daqueles que retorna. Ele retorna para aqui também. Toma-me pela mão ou me carrega até o dia, vez após vez, e vez após vez. Ele volta, e nós encontramos esperança em sua companhia aqui. Ele está nos ensinando a ‘exultar na monotonia’.” Não tudo de uma só vez, mas aos poucos, com o passar do tempo.

Porque as crianças têm abundante vitalidade... elas sempre dizem: “Faz de novo”, e a pessoa crescida faz de novo quase até morrer. As pessoas adultas não são fortes o bastante para exultar na monotonia. Mas talvez Deus seja forte o suficiente para exultar na monotonia. É possível que Deus diga, cada manhã, ao sol: “Faz de novo”; e a cada anoitecer, à lua: “Faz de novo”. Pode não ser uma necessidade automática que todas as margaridas sejam parecidas; pode ser que Deus tenha feito cada margarida em separado, mas não se canse de

criar nenhuma delas em particular.11

Aos poucos, estou começando a ver aqueles pastores do Natal como se, tempos mais tarde, eles sentassem ao redor da fogueira no frescor da noite — com filhos e netos olhando fixos o crepitar e bruxuleio do fogo, de olhos sonolentos, prontos para dormir.

A glória não os havia livrado da lide diária. Não havia livrado das mãos de Herodes, da matança de todo menino abaixo de dois anos de idade, da ocupação romana ou de uma igreja corrupta que no fim gritaria: “Crucifica-o!” Ver a glória não os livrou disso.

No entanto, um pastor idoso remexe as brasas e diz: “O seu velho avô já lhe falou do tempo quando os anjos...” — De repente um coral de netos interrompe. Com a expressão de “outra vez”, eles gemem: “Sim, vovô, já ouvimos essa história, muitas vezes!”

O velho cutuca a madeira que queima. Faz uma pausa, direcionando o olhar para os jovens olhos dos netos. Seu sorriso só fica mais largo. “Deixem que eu conte de novo”, ele dirá. Enquanto os novinhos reclamam desse exultar na mesma velha história, o homem idoso demonstra ausência de fadiga. Com senso de maravilha, espanto e lembrança em sua voz, e uma baita dor nas costas devido ao longo dia, começa a recontar a história. “Era uma noite ordinária, e estávamos vigiando nossos rebanhos”, diz ele.

Assim surge uma exaltação entre a monotonia. Adoração, esperança e testemunho recusam parar. Ao falar, o velho está olhando de novo as margaridas, e a mesma velharia está trazendo vida à sua rotina. Por um momento eu sinto a sua alegria por entre as ovelhas. Os seus filhos e netos crescerão e indagarão com senso de maravilha. Algo maior que essa velha barraca e os dias compridos colocaram fogo no coração e na vida do vovô e em seus olhos. É quase como se ele tivesse uma notícia, como se Deus estivesse com ele, aqui entre os currais das ovelhas nessa encosta imperdoável, desconhecida pelo mundo, mas conhecida por Deus.

Fechando o círculo todo

Uma declaração do velho Samuel Rutherford tem sido minha companheira. Confinado a um só lugar pelas autoridades de sua época, devido à sua fé, ele escrevia cartas.

O grande Mestre Jardineiro, Pai de nosso Senhor Jesus Cristo, em sua maravilhosa providência, por sua própria mão, me plantou aqui, onde, por sua graça, nesta parte de sua vinha, cresço; e aqui habitarei até

que o grande mestre da vinha considere propício me transplantar.12

Falei sobre essas coisas a Mamaw antes dela morrer. Sentávamos sobre velhas cadeiras em Henryville.

“Há muito tempo estou pensando em sair daqui”, eu lhe disse. “Agora parece que estou triste por causa da distância e da ausência”.

“Bem”, disse ela, olhando as paredes como se elas fossem janelas, “parece que você já deu uma volta inteira”.

Isso é o que as raízes requerem de uma pessoa que não está em nenhum lugar específico. Ela precisa dar a volta completa e encontrar a graça de dizer: “Faça de novo” às belezas comuns a seu redor. Temos de aprender a contar velhas histórias nos lugares conhecidos, entre pessoas a quem aprendemos a conhecer profundamente. Temos de crer que isto basta para dar significado à vida. Como aprender a realizar esse trabalho de retornar, exceto por meio daquele que conhece o nome de todas as árvores? Aquele que nos chamou para onde estamos declara que não precisamos nos arrepender por estar em apenas um lugar de cada vez. Você não precisa se arrepender por realizar apenas uma pequena obra em um lugar extraordinário, mas desconhecido. Permanecer de pé em um só lugar por algum tempo permite que as raízes se aprofundem. Permite que os pastores se tornem pastores. Devagar a sombra cresce e entrega a vida. É Jesus de Nazaré que anda com você. Mary Oliver, Writer’s Almanac website, acessado em 7 de fevereiro de 2015. http:// writersalmanac.publicradio.org index.php?date=2011 09 /10. Mt 13.54; Lucas 2.4, 39, 51. David Breashears and Audrey Salkeld, Last Climb: The Legendary Everest Expeditions of George Mallory [Última subida: As lendárias expedições de George Mallroy ao Everest], (Washington, DC: National Geographic, 1999). Após seu desaparecimento no Everest, amigos mais chegados diziam que Mallory havia tomado a decisão com pressentimentos, dizendo-lhes que o que ele enfrentaria desta vez seria “mais como guerra do que aventura” e que duvidava que voltaria. Sabia que ninguém o criticaria se recusasse ir, mas sentia compulsão. É impossível dizer agora se esses eram mais que momentos passageiros de sentimento de culpa por ter de deixar sua esposa Ruth mais uma vez com toda a responsabilidade por seus filhos pequenos. Seja o que for, uma vez mais na estrada para o Tibet, Mallory era sua personalidade enérgica e animada. “Sinto-me forte para a batalha”, escreveu do acampamento da base para Ruth, “mas sei que cada grama de força será necessário. Tenho de olhar do ponto de vista da lealdade à expedição” escreveu a seu pai num momento em que vacilava, “e de cumprir uma tarefa iniciada”. Audrey Salkeld, “Mallory”, http:// www.pbs.orgwgbh nova Everest lost mystery /Mallory.htm. G. K. Chesterton, Orthodoxy: The Romance of Faith (New York: Image Books, 1990), 60. Samuel Rutherford, The Lovelineness of Christ: Selections from Samuel Rutherford’s Letters (Edinburgh: Banner of Truth, 2007), 1.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -9;

  -- 6 | Consertar tudo (reaproveita a aula de ordem 10: preserva o progresso)
  update public.aulas
  set titulo = $t$6 | Consertar tudo$t$,
      ordem = 10,
      conteudo =
$conteudo$Vi um homem à beira do rio, coberto de lama até os joelhos. Alguns vieram ajudá-lo a sair, mas o empurraram mais fundo, até ao pescoço.

– Benedict Ward

Os pastores são aqueles que retornam.

Às vezes voltamos às cinzas, ao rasgar das vestes. Às vezes voltamos a rosnadas e dentes assassinos dentre as sombras das tochas.

Fechamos os punhos. Miramos nossa espada em direção à orelha do inimigo.

“Abaixe sua espada”, diz o mestre cercado de lobos. Não é de admirar que queiramos fugir correndo.

Varandas quebradas

Lá estava ela deitada na varanda da frente, enrolada como uma bola, descalça e de pijama, em posição fetal contra a porta de chapa de alumínio. Sua mãe chorava, mas mantinha a porta fechada, instigada pelo marido a manter Lori para fora. Exasperado, o pai tentava consertar a situação à força, com “amor severo”. Eu e mais dois presbíteros tínhamos andado pelas ruas do bairro em busca de Lori. Só sabíamos que “ela fugiu de novo”. Nossa busca terminou na varanda da frente. Ali estava Lori deitada, para fora, trancada em suas lágrimas, e nós estávamos ali, cobertos e também trancados em nossas lágrimas.

De alguma forma, eu não imaginara que um ministério vivido em nome de Jesus significaria que minha vida andaria por entre varandas como esta. Não sei o porquê. Um pastor cumpre sua obra entre os fracos, os doentes, os feridos, os desgarrados e os perdidos da vida (Ez 34.4–5). O pastor, em contraste ao mercenário contratado, aprende a amar entre os lobos, porque é isto que as ovelhas fazem. Ele cuida delas no meio desses perigos (Jo 10.12– 13). No seu livro Strong at the Broken Places, Richard Cohen coloca em termos claros: “Nós, os feridos, estamos por toda parte”.13

Eu não tinha a mínima ideia de que os pastores pudessem tentar evitar dias maus para promover sua própria segurança e avanço pessoal. Se a aversão do pastor a coisas quebradas, ou sua impaciência com essa espécie de intrusão em seu dia for desafiada, é possível que ele se torne forçoso e severo, até mesmo com o seu rebanho (Ez 34.4).

Agora eu entendo a ferida e a tentativa de controlá-la, ainda que por meios duros. Ali, nas varandas de pessoas feridas em todo lugar, sentimo-nos fora do controle, fortemente tentados a lutar por algo como a onipotência — a posse imediata de poder sem limites: “Vendo a mulher que a árvore era boa... tomou-lhe do fruto” (Gn 3.6).

Em varandas quebradas existe pouca surpresa de que a oferta da serpente reluza e brilhe pedindo preferência. “Vocês serão como Deus”, a serpente prometeu (Gn 3.5). “Com certeza não morrerão”, sibilou (v. 4). Como pastor, desejo essa espécie de promessa, e se não tiver cuidado, tomarei de seu amaldiçoado fruto. Posso ser deus para eles na varanda. Posso consertá-los. “Não é tão ruim assim”, posso lhes dizer. “Vocês não vão morrer de verdade, vou fazer com que isso seja bom para vocês”, eu direi. “Farei isso passar”. Qualquer coisa que possa agarrar, comer ou dizer que farei, qualquer coisa para me sentir capaz de fazer algo construtivo em meio à minha incapacidade. Arranho e agarro para me tornar onipotente nessa varanda. Procuro usar estratégias que não são o evangelho para consertar todas as coisas que estão quebradas. Todos nós fazemos isso.

Multiplicando Palavras

No meio dos ferimentos, às vezes ficamos dizendo: “Você não deve fazer isso”. Ao pregar sobre o pecado de Davi, por exemplo, a minha tendência era dizer: “Está vendo o que ele fez? Ora, não vá fazer isso”. O problema, claro, é que Davi já havia pecado, como muitos dos que me escutavam naquele momento. E daí? Da mesma forma, quando se trata de cuidado pastoral pessoal, o que se pode dizer ali na varanda, quando você está à frente com a Bíblia na mão? Podemos dizer o quanto quisermos: “Não fique aqui!”, ou, “Você não deve fazer isso!”. O problema é que todo mundo já fez e já é. E agora? Será que existe esperança no evangelho?

Impacientes por uma resposta e um remédio, começamos a multiplicar soluções. Consequentemente, alguém como Jó não somente terá de suportar tudo que sofre, também terá de lidar com a inundação de textos, e-mails, cartas e telefonemas daqueles que estão tentando endireitá-lo em nome de Deus.

Provérbios nos lembra de olhar pela nossa janela para escutar o que o mundo de verdade pode estar dizendo (Pv 7.6–23). A vista e os sons podem parecer trágicos, como quando se está na sala de uma coordenadora de ministério e seu marido. Não é uma varanda, mas o estrago permanece ali.

“Não sou mais cristão!”, ele grita com ela. “Você não tem de seguir a Jesus para continuarmos casados e encontrarmos uma boa vida”, ela responde. “Eu sou sua; tenho compromisso com você. Podemos fazer aconselhamento. Podemos pedir ajuda”, ela lhe assegura.

“Eu não vou fazer aconselhamento junto com você e não vou pedir ajuda, especialmente de Deus”, ele declara. “Estou cansado da hipocrisia das igrejas. Odeio essa vida”, retruca.

“Eu peço demissão amanhã mesmo”, ela implora. “Não preciso estar em um ministério na igreja. Vamos começar de novo”, pede ela. “Eu amo você”, declara.

“Mas eu não amo você e nunca amei”, ele retruca. “Não quero ficar com você. Nunca quis”.

Ela está calada. As suas palavras começam a falhar. Talvez, enquanto você a escuta, as suas palavras também sumam.

“Para mim, esse casamento acabou há dez anos”, ele revela. “Você não quer dizer isso”, ela murmura. “Não posso acreditar que isso seja verdade”.

Você observa que ela quase diz as próximas palavras para ela mesma, em vez de falar a ele. “E os nossos filhos, nossas lembranças, nossa vida juntos em todos esses anos?”

“Eu preciso respirar”, diz ele ao se levantar do sofá. “Já acabou para mim”.

Naquele momento, quando as suas palavras falham, você vê que ela faz algo que nunca fez em quinze anos de casada.

O que um arremessador de beisebol faz quando o outro time rebate o seu melhor arremesso? Onde é que o “trenzinho” vai quando enfrenta uma montanha maior que todas as outras, íngreme demais para ser vencida? O que acontece quando o trenzinho não consegue? Sem resposta, vendo-o simplesmente se afastar e ir embora, sem palavras para fazê-lo parar, ela se levanta, o agarra e tenta bloquear o caminho com seu corpo. Ele vai para um lado, e ela também. As palavras dissolvem com a força de vontade.

“Eu não vou deixar você ir embora!”, ela grita. “Deixa eu passar!”, ele grita, e começa a empurrá-la. A consciência a chama. Ela deixa ele passar, mas depois cede novamente a palavras que se multiplicam. Ela vai atrás dele pelo corredor, pela sala de estar, até a porta da frente da casa.

“Me deixe em paz!”, ele grita, batendo a porta atrás dele. “Eu não vou deixar você!”, ela berra atrás da porta. “É isso mesmo!”, ele grita ao andar até o carro. “Eu é que estou deixando você!”

Espalhando palavras bíblicas por todo lado

Nos dias seguintes, você observa como os amigos, membros da família e gente da igreja multiplicam as palavras. “Você descuidou da sua aparência. Precisa ficar mais bonita para que ele a note mais”, outra lhe diz.

Agora multiplicam-se as palavras da Bíblia. “Ele só precisa saber o que a Bíblia diz, e fazê-lo”, um pastor lhe diz. Somos tentados a lançar versículos contra as pessoas quase como se fosse um encantamento. Às vezes agimos com se houvesse poder até mesmo só em dizer as palavras, como um feiticeiro que recita seus encantamentos. Fale as palavras corretas e o encantamento dará certo. Se falar errado as sílabas, a mágica não funciona.

Mas a presença de coisas que não podemos controlar ou consertar imediatamente nos lembra de que, embora a Bíblia seja a revelação de Deus, ela em si mesma não é uma solução mágica. Ela alumia nosso caminho por seu Espírito, mas nem sempre poderá nos proteger daquilo que ele nos mostra ali. Somente o Cristo que os versículos bíblicos revelam pode fazer isto.

Marque bem isto aqui: Um dos primeiros sinais de que estamos nos aproximando das margens de tentar ser onipotentes é este: acreditamos que outro esteja escolhendo um curso de ação porque ele (ou ela) simplesmente está confuso sobre o que é certo. Assim, acreditamos que se nos esforçarmos bastante para explicar a verdade, ele ou ela obviamente e imediatamente fará o que é certo. Ninguém foi mais claro, verdadeiro e razoável que Jesus, e eles o crucificaram. A clareza é muito importante. Mas a clareza nem sempre consegue solucionar ou consertar as coisas que estão quebradas.

Imagine como teria sido a varanda naquela manhã se tivéssemos acreditado que a melhor esperança para aquela moça, para sua mãe e seu pai, em meio às ruínas, fosse nosso palavreado de fórmulas prontas, nossas múltiplas pomposidades preenchendo todo o espaço, a dor e o silêncio? Os amigos de Jó acertaram ao sentarem-se em silêncio, nas cinzas. O prejuízo começou quando começaram a falar. Jesus se assentará nas cinzas de varandas quebradas de nossa vida e nos ensinará a confiar nele mais do que em nossas muitas palavras.

Levantando a voz e apontando o dedo

À medida que falham as palavras para resolver o problema, aqueles que estão envolvidos começam a falar mais alto e a mirar o caráter. Jó não estava acima da necessidade de correção e crescimento. Mas os ataques a seu caráter feitos pelos seus amigos estavam errados e eram cruéis.

As pessoas que querem consertar tudo pensam assim: Não é possível que estas coisas estejam assim. Elas já deviam estar se endireitando. Deve haver alguma coisa escondida que está errada. Temos de falar mais um pouco, mas desta vez com mais firmeza, mais força, mais confrontação. Quando isso acontece, tornamo-nos como aquele que fala mais alto com a pessoa cega ou levanta a voz para o estrangeiro que fala outra língua.

Agora, imagine novamente a situação da diretora do ministério. Talvez alguns homens e mulheres se tornassem descarados apontadores de dedo e a chamassem de hipócrita. Eles remexeriam à procura de algum pecado escondido em sua vida, migalhas e bocados para conversas e orações.

Ela merece ser culpada. Precisa crescer e mudar além do que sabe. Mas neste caso, os seus pecados não são do tipo feito para programas de conversas de televisão. Ela não possui nenhum escândalo escondido em seu armário para as revistas de fofoca. Os seus pecados e seus limites não justificam o marido abandoná-la. Contudo, a comunidade de Jesus, por trás de portas fechadas, é tentada a cochichar especulações obscuras nas reuniões que começaram com oração. Assim, às vezes a varanda não basta. Deve haver alguma sujeira por trás dela. Impacientes com as coisas que não estão consertadas, enchemos o espaço com o pensamento rápido e especulações velozes. Criamos cenários podres e os relatamos.

“Você não teve um caso?”, “Você fica enchendo a paciência dele? Você está ensinando mal os filhos? O que foi que você fez para ele ir embora e estragar o seu ministério?”

É mais fácil tratar de uma doença de nome claro e causa precisa. Ficar sentado no consultório médico entre a falta de um diagnóstico e dias sem fim de “eu não sei” é muito mais difícil. Detestamos os sentimentos que acompanham os momentos incontroláveis e impossíveis de consertar. Não sabemos como passar um dia com sentimentos vagos, e assim nos debatemos e derrubamos a louça dos armários. Pelo menos estamos exercendo nosso poder, justificamos. Sentimos que estamos fazendo alguma coisa.

Escrever um longo e prosaico tratado em e-mail pontuado por palavras MAIÚSCULAS também pode dar a sensação de poder. Mas no final, tem pouca força como palavras racionais para consertar aquilo que nos perturba. Imagine como teríamos tratado aquele encontro na varanda se acreditássemos que tratados de letras MAIÚSCULAS desfariam o problema e o controlariam? Imagine se tivéssemos projetado sobre a moça, sobre a mãe e sobre o pai coisas piores do que as que realmente estavam ali, e enchêssemos a varanda já detonada com os nossos dedos acusatórios?

Temor e intimidação

É possível então começar a praticar o temor e a intimidação como estratégia de liderança ou “cuidado pastoral”. Podemos começar a gritar, ameaçar, tentar induzir verbalmente ou mesmo fisicamente, e mesmo dar o tratamento silencioso àqueles que estão na varanda.

O problema é que temor e intimidação funcionam enquanto a cura no evangelho não for o nosso alvo. Lembro-me de um líder de ministério que lutava com uma crise pessoal. Um presbítero foi incumbido de cuidar desse líder e formou uma delegação oficial que se encontrasse com ele “para saber como cuidar pastoralmente dele”. Mesmo que o alvo declarado fosse o cuidado pastoral, a reunião falhou, tornando-se interrogatório, e acabou gerando acusações e palavras duras da parte de todos. O presbítero compartilhou comigo sobre o quanto se sentia mal sobre essa situação. Disse ele que cedeu à pressão de saber que os outros envolvidos iram fazer perguntas muito duras, e teve de se certificar de que nada ficasse sem ser revelado, a fim de aplacá-los. Tendo em mente o exame que fariam, ele chegou a apontar para o homem carente de ajuda, de cara vermelha de intensidade, chamando-o de hipócrita. Conheço bem essa tentação. Dentre nós que estamos no ministério pastoral, a maioria faz isso: buscamos a aprovação de alguém, em nossa imaginação ou na realidade, em vez do evangelho de Jesus, e tropeçamos.

O ponto principal é que o medo, a intimidação e as ameaças não consertam a moça com anorexia que se encontra em posição fetal na varanda, enquanto sua mãe e seu pai desmoronam numa avalanche de ansiedade.

Faça uma pausa aqui, por favor? Releia a última sentença.

Defensividade

A defensividade também não vai nos ajudar. Minha defensividade vem, em sua maior parte, em estouros de emoção — lágrimas, súplicas, declarações fortes. Outros se defendem redigindo listas calmamente. Os que fazem listas se defendem do jeito que eu imagino que os sacerdotes da história do bom samaritano devem ter feito. Seu pecado não era de comissão — algo que fizeram. O seu pecado era de omissão — algo que eles não fizeram. Ao deixar o homem surrado e alquebrado ao lado da estrada, poderiam facilmente ter se defendido. Poderiam prontamente demonstrar que já tinham cumprido todo o dever daquele dia sem jamais chamar atenção ao homem caído. Afinal de contas, a sua presença não estava dentro das suas responsabilidades normais. Se alguém descobrisse o homem ferido, o que toma nota dos acontecimentos poderia ter mostrado que eles não fizeram nada de mal àquele homem, e os justificaria respectivamente por haverem tratado do caso como fizeram.

A primeira espécie de defensividade, o estouro emocional, é fácil de ver e faz com que as outras pessoas se remexam para reassumir o controle. O segundo tipo, documentação, funciona para manter todo mundo mais confortável, aparentemente mais em controle, com detalhada defesa, e assim, nossa capacidade de reconhecer esse substituto ao evangelho leva muito mais tempo.

De qualquer modo, a defensividade só prova o ponto do nosso quebrantamento e exagera nossas falhas aos olhos dos outros, particularmente se essas outras pessoas já enxergam aquilo que querem que seja verdadeiro a nosso respeito, em vez do que realmente é verdade sobre nós. Defensividade não tem o poder de cura.

Fico sentado por um tempo com um amigo. “A ira não produz o reino de Deus”, ele me diz gentilmente. Ficamos sentados no silêncio tomando chá. Sentamo-nos nas cinzas e esperamos juntos. Esperamos por Jesus. Aos poucos, ele dá a força para nos aquietar quando a calúnia continua, silentes quando falam mal de nós, confiando nossa reputação cada vez mais a ele e cada vez menos às nossas palavras, emoções ou documentação.

Não fomos feitos para nos arrepender por não conseguirmos consertar todas as coisas. Devemos nos arrepender por termos tentado. Mesmo que pudéssemos ser Deus para as pessoas e consertar tudo, permanece o fato de que, frequentemente, Jesus não tem em mente essa espécie de “conserto” que você e eu desejamos.

As coisas inconsoláveis

Não se pode consertar as “coisas inconsoláveis”. As coisas inconsoláveis são identificadas primeiro pelos “não podes” do ensino de Jesus. Por exemplo, não importa quem somos, “ninguém pode servir a dois senhores”, ninguém (Mt 6.24). Mesmo que sejamos sábios e, por sua graça, conhecedores, ainda há coisas e estações na vida em que “não o podeis suportar agora” (Jo 16.12). Por maior que seja a força de vontade da pessoa, “Como não pode o ramo produzir fruto de si mesmo, se não permanecer na videira, assim, nem vós o podeis dar, se não permanecerdes em mim” (Jo 15.4). Não importa quantos juramentos fizermos ou quanto torçamos as palavras em jactância, “não podes tornar um cabelo branco ou preto”, Jesus diz (Mt 5.36).

Esses “não podes” de Jesus nos ensinam que a doença, morte, pobreza, e o pecado que nos assedia e infesta o ser humano, não serão removidos com base no esforço humano, por mais forte, piedoso ou sábio que seja seu esforço. Por isso é que Jesus nos ensina que a fé do tamanho de um grão de mostarda pode mover uma montanha e “nada vos será impossível” (Mt 17.20). Assim, levamos a fé ao que nos perturba. Parece até que não há nada no mundo que não possa ser consertado se tivermos a mínima semente da fé. Mas essa não é a conclusão que Jesus nos mostra. Embora nada nos seja impossível pela fé, “os pobres, sempre os tendes convosco”, Jesus diz (Mt 26.11). Surge o paradoxo. Quanto à pobreza, não existe garantia ou decisão sempre a seu favor. Você tem de entrar na roda com fé, sabendo que você não ganha do jeito que você quer.

Também não temos o poder de produzir as coisas que crescem. Por “coisas que crescem”, eu me refiro ao fruto que nós, pelos nossos ministérios, esperamos produzir. Não me entendam mal. Podemos realizar trabalho pastoral significativo entre as coisas que importam, mas só Deus pode dar o crescimento (1Co 3.6–7). Jesus nos ensina que o poder de dar salvação é inconsolável no que nos diz respeito. Não podemos, por nós mesmos, dar às pessoas o novo nascimento em Deus (Jo 3.3–5). Não temos como justificar a alguém, torná-la justa, santa, adotá-la, convencê-la do pecado ou transformar o seu coração (Lc 19.27; 1Co 12.3). Não existe nada que possamos fazer no ministério que não requeira a ação de Deus, se o verdadeiro fruto for produzido (Jo 15.5). Tudo que os pastores esperam que ocorra na vida de uma pessoa com Deus permanece fora do poder do próprio pastor.

Também não conseguimos consertar a ausência de paz do jeito que as pessoas muitas vezes querem que façamos. Por quê? Porque Jesus dá a paz, mas não do jeito do mundo (Jo 14.27).

Conheci Estevão anos antes, em meu primeiro estudo bíblico na Casa de Repouso Grand Village. Ele foi o único a assistir no meu primeiro dia. Eu estava nervoso e com pressa de fazer uma oração para terminar rapidamente a reunião. Mas esse dono de uma medalha Purple Heart (maior honra para o militar que se destaca em serviço ao país) tinha em mente outras ideias. “Padre, eu não tenho ido à igreja em mais de cinquenta anos”, ele me disse. Eu não era católico, mas para este homem de noventa anos de idade eu era o “Padre”. “Deus nunca poderia me perdoar por tudo que já fiz na vida”, disse ele, enquanto olhava além de mim para um mundo que lhe causava dor. Naquele dia, a graça deu-me palavras para falar de Jesus e seu perdão. Jesus atraiu Estevão para si.

Agora, Estevão estava no hospital. Suas mãos foram amarradas porque ele ficava arrancando os tubos dos braços. Estava preso a um mundo de alucinações. Mandou que eu tomasse cuidado com o carteiro que estava ali no pé da cama, querendo me prejudicar. Garanti a Estevão que estava tudo bem comigo. Disse a ele que eu o amava. Ele não deu nenhuma indicação de que me ouvira. Estava inquieto e gemia no mundo que imaginava. Fiquei ali sentado por longo tempo. Cantei. Orei. Durante todo esse tempo, Estevão não me reconheceu. Então, na hora em que eu ia embora, abaixei-me e disse: “Eu amo a você, Estevão”.

Ele atirou-me um olhar. O remexer-se, os gemidos e as ilusões deixaram seus olhos. Por um momento ele me viu com clareza. “Eu te escutei da primeira vez!”, declarou. Então, por mais um instante, olhamos um para o outro e nos vimos um no outro. Esse momento passou, e a confusão voltou. Mas o amor se afirmava ali, por entre as alucinações, e as mãos amarradas, e a mente que ia se perdendo. Há uma espécie de paz que Jesus dá, que vai aonde outros tipos de força não conseguem. Faz o que outras espécies de poder não podem.

O seu poder se encontra quando cantamos “Maravilhosa Graça” para uma mulher numa casa de repouso, chiando no escuro, procurando respirar. Cantar de sua graça faz com que os pulmões relaxem, e a respiração fique mais fácil. A morte não vai parar. Coisas inconsoláveis não cessarão, ainda não, por mais um tempo. Mas chega a graça. Algo mais poderoso do que a morte canta ao seu lado e segura a sua mão.

Não podemos fazer tudo o que precisa ser feito. Isso quer dizer que Jesus nos ensinará a viver com as coisas que não podemos controlar nem consertar. Vamos querer resistir a Jesus e agir como se fôssemos onipotentes, mas quando tentamos isso, só ferimos aos outros e a nós mesmos. Outros também resistirão a Jesus. Usando o seu nome, nos louvarão ou criticarão, nos promoverão ou descartarão, de acordo com o seu desejo de que consertemos tudo por eles e que o façamos imediatamente. Mas eles também precisarão aprender que só Jesus é capaz de consertar todas as coisas, e que existem coisas que Jesus deixa sem conserto para a sua glória.

Isso é excruciante, às vezes. Todo dia entramos em situações nas quais sabemos não ter nenhum controle, em que é difícil colocar fé confiante em nossa única esperança verdadeira, e que, neste desconfortável silêncio, Deus fará o que somente ele é capaz de fazer conforme sua capacidade e seu amor. Não é de surpreender que nos apressemos para consertar tudo. É tão menos humilhante nos mexer, falar, fazer planos, e apressar-nos para agir, em vez de esperar um pouco mais para ver; ou cair no chão, rasgar a roupa, e entrar na choradeira com as pessoas. Mas chorar com as pessoas é o que Jesus nos conduz a fazer. Esperar para ver o que Deus fará não é desperdício de tempo.

Quando ferimos simpaticamente

O rei Herodes jamais concordaria com essa espécie de poder. As suas estratégias para a resolução de problemas faziam sumir os conflitos, mas não curavam nada (Mt 2.18). O rei Herodes não era nenhum “curador ferido”.14

Talvez sejamos mais bonzinhos do que o rei Herodes. O fato é que, quando lutamos para consertar as coisas sem Jesus, até mesmo bons líderes de ministério podem se tornar simpáticos prejudicadores. Entramos em uma longa fileira.

• Os amigos de Jó, faltando-lhe empatia sincera, achavam que sabiam mais do que realmente conheciam. Nas suas mãos, a doutrina desculpava a ignorância. Ser correto justificava a palavra cruel. Aprendemos deles que a verdade pode ser usada sem sentimentos e de maneira tola. A verdade pode ser usada para ferir as pessoas. A ordem de falar a verdade em amor é modificada para “Eu vou contar como as coisas são”. • Os pastores de Ezequiel 33 usavam o ministério para manipular as pessoas, a fim de obter status, conforto e reputação. Deixavam os quebrantados, os perdidos e os perturbados aos lobos. • O irmão mais velho do Filho Pródigo representava os fariseus (Lc 15.11–32). Esses mestres de Bíblia justificavam a ingratidão e amargura em nome de se posicionarem pela justiça. Carentes de graça, eles martelavam as virtudes religiosas sobre as pessoas. • Os líderes religiosos da história do Bom Samaritano (Lc 10.25– 37) não entendiam o conceito de amor ao próximo quando estavam “de folga”. • De fato, para qualquer dentre nós que tenha vocação para o ministério, é triste entender que as palavras mais duras proferidas por Jesus (e também dos profetas que o antecederam) eram dirigidas aos líderes ministeriais de seus dias (Mt 23.1–36). Escrutine os heróis de nossa fé. A tentação para os líderes autênticos de ferir a outros e ofender a Deus não é menos destacada.

• Conhecemos tanto o desastre da embriaguez de Noé quanto a sua coragem e sua fé. • Honramos com justiça a fé de Abraão, enquanto nos lembramos corretamente do fato de que seu medo egoísta ainda conseguiu dominá-lo. • Moisés foi assassino. Ele se acovardou. Seu temperamento estourado jogou fora a oportunidade de entrar fisicamente na Terra Prometida. No entanto, ele também creu e conduziu seu povo com coragem. • Cantamos os salmos de um “homem segundo o coração de Deus”. Mas este homem também fez coisas terríveis e, às vezes, fez escolhas trágicas, muito aquém de seu chamado e da graça que lhe foi dada. • Jonas levantou os punhos contra a graça. • Tiago e João quiseram invocar fogo do céu para consumir os que não recebiam a Jesus. • Paulo nos ensina. Mas Deus quer que recebamos o ensino de Paulo e de sua integridade enquanto conhecemos a amarga história de Saulo de Tarso. • Pedro exalta a Cristo por nós. Mas não somos desconhecedores quanto à espécie de pecado covarde que ele exemplificou quando Jesus foi preso. De alguma forma, eu achava que os contornos de minha vida e ministério estariam longe desses líderes e heróis da Bíblia. Pensei que eu jamais cometeria os mesmos erros nem compartilharia a mesma vulnerabilidade. Mas naquela varanda, naquele dia, eu era um vaso quebrado, sem nenhuma capa de super-herói. Éramos todos vasos de barro quebrados naquela varanda — a mãe atrás da porta, o pai ao telefone, os dois presbíteros que vieram comigo, e a menina empilhada entre as ruinas.

Naquele dia conseguiríamos tirar Lori da varanda, continuaríamos em nossas rotinas normais de tarefas, alimentação, oração, leitura da Bíblia, aulas de música para os filhos e dormir. Mas as coisas que levaram Lori até aquela varanda em primeiro lugar permaneceriam sem conserto naquela noite, e em muitas e muitas noites que ainda viriam. Portanto, cada um de nós teria de aprender como viver cada dia um com o outro, sem que nada ou ninguém tenha sido consertado.

Montando uma ofensiva

Em suas notáveis memórias a respeito da batalha contínua e crônica com artrite reumatoide, Mary Felstiner pergunta: “Como a alma consegue subir na ocasião da doença?”15 Por “doença”, Mary se refere à destruição do corpo enfermo que não se conserta. Ao inquirir como a alma poderá subir nessa ocasião, ela quis dizer: escolhendo e aprendendo a viver perseverantemente, vibrantemente e cheia de amor, indo para a frente, tendo destroçada a carne que outrora fora seus dedos e suas pernas.

A sua enfermidade é sádica para as juntas e os ossos. Ela os pulveriza com sorriso cínico. Ela os arranca e puxa. Ela os torce em um emaranhado confuso, enquanto dá risadinhas. Assim, quando a ouço conclamar-nos a “subir nessa ocasião”, reconheço que ela tem intenção de lutar. Mas seu modo de lutar me assusta. “Pelo menos agora eu sei qual é a tarefa”, diz ela. “Monte uma ofensiva quando não possuir nenhuma defesa que possa vencer”.16

Neste ano que passou, recebi uma carta de um dos presbíteros que esteve comigo há tantos anos naquela manhã, naquela varanda. Pela carta, fiquei sabendo que a vida de Lori, durante todos esses anos após o acontecido, foi curada. O que ele descreveu quanto à graça que a encontrou e ainda a segura, me levou às lágrimas, maravilhado.

De que maneira a paz de Jesus acalmou sua vida? Para ser sincero, não tenho plena certeza. Não existe resposta grandiosa, notável, eficiente e veloz. As únicas coisas que conseguimos eram pequenas respostas acerca de coisas que não se viam, durante um longo período de tempo. Um dos presbíteros escrevia um e-mail semanal para Lori durante todo o período de trauma. Toda segundafeira simplesmente ele começava: “Bom dia”. Ali ele falava da beleza que via nela e da graça de Jesus, a quem ele orava pedindo por ela.

Outro presbítero permitiu que Lori vivesse por algum tempo com a sua família, enquanto a família dela buscava a graça para passar pela crise. Houve aconselhamento. Houve muitas lágrimas e contratempos. Os Salmos eram clamados e derramados.

Passou-se muito tempo, anos de dias incertos em que parecia não haver respostas ou remédios. Então, como foi que essa cura veio em meio a coisas tão inconsoláveis? Como Jesus continuaria com ela entre as coisas inconsoláveis nas quais ela ainda teria de navegar?

Realmente, eu não posso dizer. Na verdade, ao lembrar daquela varanda só sei com certeza o seguinte: a luta não era nossa para ser vencida. Era dele. E ele venceu.

Richard M. Cohen, Strong at the Broken Places: Voices of Illness, a Chorus of Hope (New York: Harper, 2008), xvi. Henri Nouwen, The Wounded Healer: Ministry in Contemporary Society, (New York: Doubleday, 1979). Mary Felstiner, Out of Joint: A Private and Public Story of Arthritis, (Lincoln: University of Nebraska Press, 2007), 89. Eugene Peterson, “Spirituality for All the Wrong Reasons,” Christianity Today, March 2005, http://www.christianitytoday.com/CT/2005/March/26.42.html?start=y$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -10;

  -- 7 | Saber tudo (reaproveita a aula de ordem 11: preserva o progresso)
  update public.aulas
  set titulo = $t$7 | Saber tudo$t$,
      ordem = 11,
      conteudo =
$conteudo$Qualquer que pense entender as divinas Escrituras ou qualquer parte delas, sem compreender e edificar nesse amor a Deus e ao próximo, ainda não conseguiu entendê-las.

– Agostinho

Eu havia acabado de dar a Eric a sua primeira Bíblia. Ele só havia orado em nome de Jesus quatro ou cinco vezes em sua vida (e isso nos últimos dois dias!).

Um presbítero tinha parado para buscar alguma coisa para sua classe de escola dominical. “Ei, Jason!”, eu disse ao presbítero.17

“Quero que você conheça o Eric, um novo cristão. Estamos nos encontrando pela primeira vez hoje. Acabei de dar ao Eric sua primeira bíblia”.

O presbítero apertou a mão do novo convertido e o cumprimentou. O que ele disse em seguida me deixou boquiaberto. “Então, Eric”, disse ele. “Qual é a sua opinião sobre o Catecismo Maior de Westminster, pergunta 109?”

Eric deu um sorriso vago e olhou para mim. Lembro-me daquele momento de muito tempo atrás. Olho-o como um espelho que me adverte e me faz uma pergunta. Como chegamos ao ponto de esquecermos de que houve um tempo em que nós não conhecíamos o que era o Evangelho de João, e muito menos sabíamos onde encontrá-lo na Bíblia ou como deveríamos lê-lo quando o encontrássemos? O que faz com que nós cristãos, às vezes, vejamos o crescimento no conhecimento como algo que nos faz diminuir, julgar, confundir ou sobrecarregar uma pessoa que abre a sua primeira Bíblia pela primeira vez? A resposta assombradora é que a serpente ainda nos sussurra sua tentação: “Porque Deus sabe que no dia em que dele comerdes se vos abrirão os olhos e, como Deus, sereis conhecedores...” (Gn 3.5).

Somos tentados a algo parecido com onisciência — a capacidade de saber tudo. Mas não fomos chamados a nos arrepender por não sabermos todas as coisas. Somos chamados a nos arrepender por tentarmos saber tudo.

Aprendizes

No seu Aprendiz de Feiticeiro, Goethe escreve sobre um mestre que deixa seu jovem estudante cuidando das coisas. Ambicioso, o jovem aprendiz conclui que está pronto para substituir seu mestre porque já “memorizou o que dizer e fazer”.18 Os que conhecem a versão famosa desse poema feita pela Disney se lembrarão da confusão e dos estragos resultantes. Embora tentasse imitar as tarefas do mestre, ele não entendia o jeito do seu mestre nem a profundidade dos poderes que estavam diante dele. Assim, todos os seus esforços só pioravam a situação até que finalmente ele se humilhou, implorou que o mestre voltasse, e recebeu de entrega socorro gracioso e poderoso.

É óbvio o ponto do poeta. A tentativa de acessar o poder de uma vocação apenas pela memória e encantamento rapidamente resultará em grande confusão.

A Bíblia concorda. Vários pregadores itinerantes viram o apóstolo Paulo expulsar demônios e realizar milagres em Jesus. Eles pensaram em si mesmos e concluíram que poderiam fazer igual ao que Paulo fizera. Assim, quando encontraram tais espíritos maus, esses pregadores imitaram o que tinham observado.

“Esconjuro-vos por Jesus, a quem Paulo prega”, exclamou um deles. Mas o espírito maligno lhes respondeu: “Conheço a Jesus e sei quem é Paulo; mas vós, quem sois?” Imediatamente, os pregadores que tentaram praticar aquilo que memorizaram, mas que não assumiram para si, foram atacados e fugiram daquele lugar, feridos e nus (At 19.11–16).

O demônio era astuto. Reconhecia que não importava o quanto os pregadores usassem palavras e ações semelhantes às de Jesus, a qualidade da autoridade, vida, e ensino de Jesus estavam ausentes.

Nós também, dessa maneira, podemos usar mal o conhecimento. Em meus primeiros dias de seminário, nós, alunos de uma classe intensiva de grego, nos propusemos a uma pausa a fim de orar uns pelos outros a cada dia. Não demorou muito, e nessa rotina diária de nos reunirmos para a oração à sombra de uma árvore de verão, um seminarista de último ano se aproximou de nós ousadamente e nos repreendeu:

Irmãos, eu os advirto! É óbvio que vocês são orgulhosos e contumazes. Está na cara que querem que o restante de nós veja como vocês são espirituais e santos. Eu sei. Eu também era novato no seminário como vocês. Eu também queria exibir-me a todos, como vocês estão fazendo agora. Mas eu estava errado, e vocês também estão! Jesus nos conclama a “entrarmos em nosso quarto para orar”. Vocês se chamam de futuros pastores? Vocês têm do que se arrepender!

Se houve luz no caminho da bondade da Escritura citada pelo nosso irmão, nós tivemos dificuldade em vê-la. O seu uso da “luz” fazia com que nossos olhos fechassem ou olhassem só meio abertos contra ela. Se havia algo belo e redentivo quanto a quem ele foi quando iniciou o seminário, nós não conseguimos enxergar com a luz que ele tentava nos oferecer.

Objetamos: “Somos justificados ao repreender apaixonadamente as pessoas, sem discernir se elas sabem um pouco mais ou se não têm nada a aprender que as ajude a crescer? Será que Jesus é contra qualquer pessoa que estiver orando na frente de outros? Jesus não orava na frente de seus discípulos e na presença de outros?”

Embora todo nosso conhecimento mútuo da Bíblia, não acho que nós aprendizes tenhamos ajudado uns aos outros a ver naquele dia. Um farolete mirando diretamente nos olhos de alguém faz com que seja mais difícil ver, não mais fácil. Na verdade, um farolete usado erradamente pode nos roubar a luz que já nos tem sido providenciada.

Inflados

Frequentemente, o conhecimento dado com a intenção de nos ajudar apenas nos incha (1Co 8.1–2), e o mal uso do zelo não é diferente disso. Nos Estados Unidos, os saquinhos de batatas fritas são inflados. Mas quando se abre o saco, ele se esvazia. O que parecia ser um saquinho cheio de batatas fritas na verdade era mais um saco cheio de ar. Como crentes autênticos em Jesus, somos suscetíveis a tornar-nos inflados e cheios de ar quente dessa forma (entre outras), e especialmente os pastores. Nosso zelo com a novidade da fé pode exagerar nosso conhecimento e o fazer inflado (1Tm 3.6).

Nosso zelo por controvérsia teológica, debates e discussão a fim de demonstrar nosso intelecto superior ou capacidade persuasiva sobre outros também nos infla (1Tm 6.4).

“Dr. Pregador Conhecido” era um pastor que ajudava muita gente e às vezes pregava apaixonadamente, com uma percepção profética, a respeito do sofrimento pelo evangelho. Por alguns anos, houve um grupo de estudantes que se modelavam como seus discípulos. Escutavam os seus sermões, liam os seus livros e assistiam suas conferências (embora, que eu saiba, nenhum deles conhecesse pessoalmente o “Dr. Pregador Conhecido”, exceto por um aperto de mão numa conferência). Com forte paixão, pregavam na classe bíblica sobre o sofrimento. Procuravam viver vidas mais ascéticas em seu campus do seminário. Mas, por adotar apenas um aspecto da mensagem de seu mentor celebridade, sem o contexto e a experiência pessoal de seus anos de trabalho pastoral em favor das pessoas, na verdade, feriram colegas, julgaram mal os professores, criticando fortemente a ambos, e isso no nome de Deus.

Pareciam cegos para o fato de que, apesar de todo o seu zelo, tinham, na verdade, pregado apenas quatro sermões em sua vida. Encobriram o fato de que nunca tinham servido um dia sequer como pastor em uma igreja. Eles rejeitaram a verdade de que o que tinham aprendido ontem na sala de aula, o professor que lhes ensinava vinha procurando fazer na vida e ministério antes de terem nascido.

Jonathan Edwards observa: “Nada que pertença à experiência cristã é mais suscetível a uma mistura corrupta do que o zelo”.19

Não é que desejemos menos zelo. Pelo contrário, a vida e o ministério isento de sinceridade é como ter um aquecedor que não funciona num dia frio, parado em uma sala úmida e fria. Nós o acendemos, trêmulos e arrepiados, com os dedos dos pés carentes de aquecimento, mas a ajuda não vem. Graças ao Senhor por jovens zelosos, tanto homens quanto mulheres!

Mas um fogo não pode aquecer com segurança se não estiver à distância correta de nós. Se ficarmos perto demais, em nome do aquecimento, seremos queimamos. Nosso zelo deverá ser derivado “com discernimento” (Rm 10.2).

Quando Jesus diz seu “Ai” àqueles que usam mal a chave do conhecimento, ele destaca os sinais que exibimos quando o conhecimento estiver indo por rumos errados:

O conhecimento bíblico nos deixa analfabetos em termos da operação interior de nossa alma (Lc 11.37–40).

O aprendizado que ganhamos deixa-nos ignorantes do verdadeiro amor por Deus (Lc 11.42–44).

Apesar de todo nosso empenho acadêmico e erudição, permanecemos sem prática de amor ao próximo, humildade, sabedoria, bem como dos dons que realmente honram a Deus (Lc 11.45–51).

Somos inteligentes com as passagens bíblicas, mas sem habilidade em termos do sentido ou significado dessas passagens no que diz respeito a Jesus. De fato, noutro lugar Jesus fala a especialistas em Bíblia que eles conheciam as Escrituras mas desconheciam aquele a quem a Bíblia aponta (Jo 5.39). “Ai de vós, intérpretes da Lei! Porque tomastes a chave da ciência; contudo, vós mesmos não entrastes e impedistes os que estavam entrando” (Lc 11.52).

De acordo com Jesus, quando se trata de descrever a porta de Deus, tais mestres da Bíblia eram especialistas credenciados em portas. Passavam os dias ajuntando as pessoas para olhar essa porta, meticulosamente memorizando cada linha, rachadura, canto, cor e detalhe. Contudo, de acordo com Jesus, esses mestres e suas congregações possuíam um conhecimento especializado de uma porta que eles mesmos não podiam abrir. Irônica e tragicamente, na verdade, com o seu conhecimento eles tornavam inoperante a própria chave que tanto propunham conhecer. Um velho pastor estava certo quando disse: “É possível que desenvolvamos uma noção falsa do conhecimento”.20

Podemos participar de um estudo bíblico local durante anos. Podemos obter graduação em um seminário ou cumprir um programa de aprendizado de um ano na igreja local. Mas isso não quer dizer que sejamos capazes de iluminar em vez de cegar, admoestar com calor em vez de chamuscar.

Conhecendo em parte

Certa vez eu desisti da lua. Era final de tarde e as nuvens haviam sequestrado a noite. Comandando o palco central, a lua iluminou confiantemente o escuro hemisfério. As crianças e eu assistimos à exibição pelos vidros de nossa van.

“O que é que você acha, Caleb?”, perguntei. “O que você pensa dessa lua?”

Caleb é meu caçula. Ele olhou atento para o céu. O luar o alcançava pela janela e tocou levemente a sua bochecha esquerda. O pequeno Caleb nos surpreendeu a todos.

“Quebrou, papai”, ele disse.

Com urgência repentina ele lançou o braço à frente e com o dedo apontou para fora da janela. “Lua quebrada”, ele esclareceu.

Olhei de novo pela janela para o palco principal. “Ah, Caleb”, expliquei. “A lua não está quebrada. É lua crescente”.

Caleb não entendia a palavra crescente, pois ela soava como nome de monstro. Sua cara caiu, sério. Com cenho franzido ele implorava: “Conserta, Papai!”

Todos rimos alto. “Papai não consegue consertar a lua, amigão”, eu ria. “Ela está longe demais e é grande demais”. Caleb olhou de novo pela janela e então olhou para mim.

Sem hesitação, Caleb me fitou firme e disse: “Papai, vai lá. Vai lá e conserta lua!”

Meus olhos vieram ao encontro da expectação dos seus, e sentime desconcertado. Eu havia identificado a lua como “crescente” e parara de dar maiores observações. Mas Caleb não estava satisfeito com minha explanação sobre qual tipo de lua era aquele. A luminária estava em sombras, e o pequeno Caleb tentava entender as sombras. A lua que eu chamei de “crescente”, Caleb chamou “quebrada”. Queria que ela fosse consertada, que ficasse inteira de novo.

O jeito como eu vi a lua, nomeei seu tipo e descartei dar mais atenção a ela (em contraste ao jeito como Caleb olhou além do tipo de lua, para a própria lua) expõe outro problema do conhecimento. “Se este fora profeta, bem saberia quem e qual é a mulher que lhe tocou, porque é pecadora” (Lc 7.39).

Não é que seja errado em si mesmo conhecer em parte. De acordo com a Bíblia, esse fariseu identificou corretamente qual a espécie daquela mulher (Pv 7.1–21). Jesus igualmente possuía esse conhecimento. Ele também identificou corretamente a mulher como uma pecadora (Lc 7.48). Em relação à espécie de mulher que ela era, o mestre e o aluno concordavam.

Note bem. Porque estamos certos quanto a alguma coisa não quer dizer que estejamos certos quanto a tudo, e nem quanto àquilo que é mais importante.

O verdadeiro arrependimento acontece bem na frente desse fariseu, e ele não o reconhece (v. 48). Ou ele não possui uma categoria para o arrependimento igual à sua categoria para o pecado, ou, ainda que a possua, não tem experiência quanto à sua aplicação.

Apesar de todo conhecimento de Deus, o tratamento relacional desse homem quanto a Jesus está profundamente empobrecido (vv. 44–46). Ou ele não possui uma categoria igualmente palpável de hospitalidade pessoal, ou ele tem, mas não quer ou não pode aplicá-la.

Essa mulher está buscando perdão bem à sua frente, e ele não consegue enxergar (vv. 41–43). Ou ele não tem um modo saudável de discernir o perdão, ou o tem, mas está cego para sua incapacidade de colocá-lo em prática.

Verdadeiro amor a Deus e ao próximo está acontecendo bem à sua frente, e ele o despreza, enquanto permanece cego à sua própria ausência de visão (v. 47). Ele não possui um critério definido para separar o que é o verdadeiro amor por Deus e pelo próximo, ou não tem muito dele em seu próprio ser.

O propósito de saber

O que, afinal, senão o amor em Cristo, forja o propósito do nosso conhecimento (Mt 22.38–39)? O presbítero tinha conhecimento do Catecismo Maior de Westminster. O aluno veterano tinha conhecimento das palavras de Jesus a respeito da oração em secreto. Eu tinha o conhecimento de seis semanas de aula de grego. Mas cada um de nós lutava por relacionar-nos de maneira sã (ou seja, à semelhança do amor de Jesus) com as pessoas à nossa frente. As Escrituras, em Jesus, nos conduzem a “uma epistemologia de amor, um modo de saber que se manifesta em amar”.21 “Assim, qualquer que pensa ter entendido as divinas Escrituras ou qualquer parte delas, mas com esse conhecimento não consegue edificar o amor de Deus e do próximo, ainda não terá obtido sucesso em entendê-las.”22

No decorrer dos anos tenho tomado essas questões para a minha leitura da Bíblia e pregação, como vacina contra essa espécie de conhecimento que se infla e esquenta, mas não alcança aquilo que Jesus intenta.

• O que esta passagem mostra sobre a amabilidade de Deus? Ou, noutras palavras, o que a respeito de Deus nesta passagem me conclama a amá-lo mais? • O que esta passagem me mostra a respeito das pessoas, e o que o amor requer de mim em relação a elas? • Sendo alguém que viu a misericórdia e o amor de Deus, que poder preciso da parte dele para vencer os meus maiores obstáculos ao amor? O que, no amor de Deus em Jesus, me dá esperança e provisão para minha própria falta de amor? Se algo que eu leio não parece amável, eu anoto, dou um passo para trás, mantendo em mente aquilo que vi claramente em outras páginas da Bíblia. Sem deixar de ver essas coisas belas, faço perguntas sobre o texto que não me parece belo. Começo um diálogo com o Pai em Jesus sobre a beleza que ele vê ali, e em um relacionamento de comunhão, confio que com o tempo ele, por seu Espírito, me mostrará o que vê.

Tempo de graça, tempo, e ainda mais tempo

Outra ajuda contra nossa tentação de saber das coisas de maneira errada é o modo de Jesus tratar com Pedro. Ao olhar para a vida de Pedro, quando você diria que ele “chegou”, “aprendeu”, ou “soube tudo”? Ele anda sobre a água, mas se preocupa com a tempestade. Contudo, Jesus não age como se Pedro não tivesse fé. Reconhece que a fé de Pedro é real, ainda que “pouca”. Então Jesus convida a Pedro para um diálogo de aprendizado. “Por que você duvidou?” Não é um tom duro. A repreensão não é do tipo que diminui a pessoa. O relacionamento não acabou. Ficar aquém do ideal e fazer nova tentativa faz parte do treinamento (Mt 14.29 –33).

Então Pedro tenta impedir a Jesus de lavar os seus pés (Jo 13.6– 8), isso também não é um pecado (Jo 13.6–8). Jesus nos diz isso. Jesus tem espaço para que Pedro encontre as coisas que ainda terá de aprender, as quais ele ainda não tem categorias para aprender. Podemos dizer a Jesus que não entendemos (Mt 15.15).

Em seguida, Pedro declara: “Tu és o Cristo, o Filho do Deus vivo”. (Mt 16.16). Nesse momento pensamos: com certeza agora Pedro chegou!

Mas imediatamente depois disso, aprendemos com Pedro que uma profissão autêntica de fé em Jesus não apaga a insensatez que ainda permanece em nós. “Arreda-te de mim, Satanás!”, são as palavras de nosso Senhor para o desejo insensato de Pedro de impedir que Jesus vá para a cruz (Mt 16.23). Contudo, até mesmo essas duras palavras não separaram Jesus de Pedro. Jesus não o lançou para fora nem deixou de tratá-lo como verdadeiro amigo, discípulo e irmão.

Mesmo assim, as tolices de Pedro continuam abundantes. Ele declara que sua fé é superior e a sua dedicação é forte (Mt 26.33– 34). Ele não tem ideia do quanto é terrível o seu exagero em estimar-se além do que convém, nem quanto suas circunstâncias são espiritualmente carregadas de ataques satânicos. Não fosse pela intercessão de Jesus, Pedro, junto com os outros, teria sido peneirado como o trigo (Lc 22.31). Contudo, Pedro continua caindo no sono quando Jesus manda que ele vigie e ore (Mc 14.37).

Pedro, depois, corta a orelha de Malco e é repreendido por Jesus (Jo 18.10–11). Pedro nega a Jesus, xingando e blasfemando. O galo canta e ele chora amargamente (Mc 16.66–72). Ainda assim Jesus o busca, o ama e o guarda (Mc 16.7).

Pedro está ferido e sente-se atingido pelas palavras de Jesus, mas essas mesmas palavras o restauram (Jo 21.15–19). Mesmo após a ressurreição, Pedro se esconde de medo depois de ver o túmulo vazio (Jo 20.10, 19–22) e mais tarde é repreendido por Paulo por causa do modo que o medo novamente o dominara (Gl 2.11–14).

Contudo, com todos esses erros cometidos por ele, toda essa estultícia e pecado, o que Pedro precisava era espaço gracioso para crescer. Pedro não é Caifás, nem Pôncio Pilatos, nem Herodes nem o fariseu que estava em sua casa julgando tanto Jesus quanto a mulher pecadora. Jesus via enganos, erros e pecados em Pedro. Mas isso não fez com que Pedro fosse excluído, nem significava que ele merecia de Jesus a mesma resposta que esses outros mereceram.

Surgem uma ou duas perguntas sobre as quais devemos pensar: Como você age quando as outras pessoas fazem coisas erradas? Alguém a quem você serve tem espaço para cometer um erro? O que significa para você, como pastor, precisar repetidas vezes da graça de Jesus?

Conhecimento impaciente

No decorrer dos anos, na família do evangelicalismo norteamericano a que pertenço, tem sido raro o ambiente da graça em que erros e pecados são diferenciados e no qual é concedido o tempo necessário para que haja crescimento em relação a ambos.

Imagine o “Rev. Autor Famoso”. Por muito tempo ele tem escrito sobre o evangelho de Jesus de maneira verdadeira e útil para muitas pessoas. Mas em seu mais recente livro ou postagem de blog, ao tentar tratar o evangelho em meio à nossa cultura, parece ter errado quanto a um ensino fundamental. Isso é um verdadeiro problema.

Apolo também teve este problema. Pregador talentoso de Jesus, ele precisou da graciosa provisão de Priscila e Áquila para aprender. Eles o ouviram pregar. Deram graças a Deus por isso. Cresceram através disso. Mas, ao mesmo tempo, o convidaram para o jantar. Eles o ensinaram em particular. Fizeram pessoalmente suas perguntas desafiadoras (At 18.24–28). Foi dado a Apolo espaço para crescer. Seu bom ensino não foi anulado por ele ter entendido erradamente algumas coisas.

Com frequência, nós somos menos pacientes. Tomamos as discussões da alta noite, os ataques de blogs, e dardos dos tuítes, como se a cultura, em vez de Jesus, fosse nosso mestre. Dessa maneira, “Dr. Pregador Conhecido” e “Sr. Blogueiro Nacional” imediata e publicamente castigam o “Rev. Autor Famoso” e se distanciam de um relacionamento com ele.

Depois o “Erudito de Longa Carreira” e o “Dr. Pregador de Conferências” oferecem uma resposta do tipo tudo ou nada, que age como se, ao cometer um único erro, o “Rev. Autor Famoso” esteja todo errado e só tenha erros. Isso soa mais como Jesus tratou os fariseus do que como ele tratou a Pedro, ou como foi tratado Apolo. No mínimo, a sabedoria nos ensina que é necessário tempo para determinar qual a postura do coração do irmão que está em erro.

Estou tentando dizer que existe algo sobre nossa forma de conhecimento que luta contra manter duas verdades ao mesmo tempo: (1) “Rev. Autor Famoso” está cometendo um erro fundamental com este aspecto de seu ensino; (2) “Rev. Autor Famoso” ama a Jesus, o tem seguido fielmente por muitos anos, tem ajudado os fiéis, e precisa de nossa companhia e argumentação cordata para ter uma oportunidade de crescer. (Quem sabe com essa espécie de companhia e diálogo em família nós também aprendamos alguma coisa?)

Tenho nutrido a ideia sutil de que o crescimento no conhecimento significa que eu dependa cada vez menos e controle cada vez mais. Porém, Jesus indica justamente o oposto. O humilde sabe mais e não acha que sabe (conhece mais e o desconhece).

O Pastor sabe-tudo em casa

Imagine como seria viver com seu pastor se ele fosse um sabe-tudo. O uso do seu conhecimento de Deus o deixa inflado. Ele deixa as pessoas cegas de tanto avaliar e de caras queimadas por tanto zelo. Por maior que seja o zelo pela Bíblia, você não consegue se lembrar da última vez que soube o que é sentir-se compreendido, prezado, conhecido ou amado com profundidade. Frequentemente você tem sido corrigido, até mesmo com brandura e razoabilidade, por que você errou de novo, e não ele. Não consegue se lembrar da última vez que ele lhe presenteou com a humilde dignidade de dizer: “Sinto muito. Eu estava errado e você estava certo”.

Temos medo de desejos humildes. Resistimos ser como criaturas e seres humanos. Esquecemo-nos de quem éramos outrora e a maneira pela qual Jesus nos amou e andou conosco antes que conhecêssemos muita coisa, mesmo lá naquele tempo quando tudo o que sabíamos estava fora dos eixos.

Aos poucos, o jovem estudante de seminário suspeita da imaturidade de sua esposa porque ela não conhece nem sabe agir de certo modo teológico, mesmo que ele mesmo nunca tivesse ouvido falar sobre o assunto até a aula da tarde passada.

O pastor impacientemente exige que seus filhos saibam, creiam e façam o que levou vinte e cinco ou quarenta e cinco anos com Jesus para saber, crer e fazer. Como é que em sua própria vida de prática erros ele tem se endurecido, em vez de amolecido a sua compaixão, visto que ele mesmo tem necessidade de tanta graça?

Conclusão

Alguém me ouvirá e dirá: “Certo! Não precisamos do conhecimento bíblico; só precisamos de Jesus!”

Mas não é isto que estou afirmando. Tal sentimento em si já é um meio de conhecimento. Raramente é sábio sugerir que possamos conhecer a Jesus sem pelo menos alguns retalhos do que suas palavras nos revelam a seu respeito.

Em vez disso, estou falando sobre conhecer de acordo com o que Jesus diz que o conhecimento é. Nosso trabalho pastoral precisa dessa mentoria. Ele é quem retorna, o Bom Pastor. Ele conhece as suas ovelhas — incluindo aquela mulher destacada pelo mestre de Bíblia. Mas de que modo ele a conhece? Ele a conhece pelo nome. Ele a chama, vai diante dela, a conduz para fora. Ele é o seu portal para os pastos verdes de descanso. Ele está junto dela no meio de problemas, necessidades, vulnerabilidades e dignidade. Ele dá a sua vida por suas ovelhas (Jo 10.2–4). Ela é conhecida de tal forma que aprendeu a conhecer algo também — ela conhece a sua voz, o seu caminho a seguir. Nossa esperança não está em que saibamos tudo, mas que o nosso Pastor conheça.

“Conhecimento parcial” é o endereço da rua em que cada um de nós tem de construir a vida (1Co 13.12). Assim, comece cada dia admitindo isto: com relação a cada pessoa, pedacinho da criação e circunstância que me encontro hoje, tenho de dizer a Deus, “Estou no escuro” e “fui ensinado a distorcer aquilo que está diante de meus olhos”. Tenho de me lembrar que quando subo ao púlpito, fico ao lado de um leito hospitalar, faço uma caminhada ou me assento em minha poltrona para aconselhar outra pessoa, fisicamente eu vejo pessoas e coisas como na penumbra. A oração de Josafá se torna nossa. “Não sabemos nós o que fazer; porém os nossos olhos estão postos em ti” (2Cr 20.12).

Receba a oração de Paulo e a faça novamente:

Por esta causa, me ponho de joelhos diante do Pai, de quem toma o nome toda família, tanto no céu como sobre a terra, para que, segundo a riqueza da sua glória, vos conceda que sejais fortalecidos com poder, mediante o seu Espírito no homem interior; e, assim, habite Cristo no vosso coração, pela fé, estando vós arraigados e alicerçados em amor, a fim de poderdes compreender, com todos os santos, qual é a largura, e o comprimento, e a altura, e a profundidade e conhecer o amor de Cristo, que excede todo entendimento, para que sejais tomados de toda a plenitude de Deus. Ora, àquele que é poderoso para fazer infinitamente mais do que tudo quanto pedimos ou pensamos, conforme o seu poder que opera em nós, a ele seja a glória, na igreja e em Cristo Jesus, por todas as gerações, para todo o sempre. Amém! (Ef 3.14–21).

Não é o verdadeiro nome desse querido homem. Johann Wolfgang von Goethe, “The Sorcerer’s Apprentice”, http:// www has vcu.edu for Goethe /zauber.html. Jonathan Edwards, “Some Thoughts Concerning the Present Revival of Religion in New England”, em The Works of Jonathan Edwards, vol. 4: The Great Awakening (New Haven, CT: Yale University Press, 2009). D. Martyn Lloyd-Jones, “Knowledge False and True” [Conhecimento falso e verdadeiro], em The Puritans: Their Origins and Successors (Edinburgh: Banner of Truth, 1991), 28. Steve Garber, “The Epistemology of Love” [A epistemologia do amor], Washington Institute, http:// www.washingtonist.org 163 the -epistemology -of -love/, 2. Agostinho, On Christian Teaching, Oxford World’s Classics, trad. R. P. H. Green (New York: Oxford University Press, 1997), 27.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -11;

  -- 8 | Imediatismo (reaproveita a aula de ordem 12: preserva o progresso)
  update public.aulas
  set titulo = $t$8 | Imediatismo$t$,
      ordem = 12,
      conteudo =
$conteudo$Penso que o pecado que mais atinge os pastores, especialmente os pastores evangélicos, é a impaciência.

– Eugene Peterson Recentemente, assisti a uma reunião regional de pastores na qual eles ficaram sabendo que oitenta por cento das igrejas que começaram nos últimos dez anos não existiam mais. Oito em cada dez pastores tinham falado sobre seus sonhos, sobre o trabalho de Deus e uma congregação que fizesse diferença em nossa geração. Eles oraram e tinham esperanças e se gastaram. Todos celebraram, fizeram planos e oraram. Mas logo depois, muitos retornaram para casa entre os feridos e com curativos.

Contrariamente, algumas poucas igrejas não somente começam bem como também crescem numericamente, e depressa. Essas poucas igrejas se desenvolvem tão rapidamente que as multidões criam um alvoroço na comunidade. Pastores têm de contratar mais ajuda imediatamente. As pessoas têm de contratar e desenvolver mais programas — e isso bem depressa. Têm de lutar e correr, apenas para manter o passo na corrida, da gente que corre para “o novo lugar para estar na cidade”. Após pouco tempo, a liderança está exausta, e as estruturas requeridas pela pressa não são adequadas para cuidar das pessoas continuamente, no tempo todo. Não existem raízes. A árvore é pesada em cima, e sem base para sustentá-la. Tem de acontecer uma reestruturação e um reposicionamento, senão os líderes e voluntários esgotados da igreja irão desmoronar. Têm de andar mais devagar a fim de continuar em frente, mas não sabem como; nunca aprenderam isso.

Semelhantemente, meu amigo que falava ao telefone estava em seu terceiro ano de pastorado. Ele estava exausto; demonstrava sinais de desgaste total.

“Mais tarde eu vou mais devagar”, ele disse. “Mas, se eu diminuir o passo agora, o que vai acontecer com o ministério?”

“Mas se você não diminuir seu ritmo agora, o que acontecerá com o seu ministério?”, perguntei. “Se você permanecer neste seu compasso atual, o que você teme provavelmente acontecerá de qualquer modo”.

1 2 Compartilho essas três histórias como quem lembra a tontura que sinalizava a minha própria iminente queda. Batiam em minha cabeça e reviravam a minha visão nos piores momentos. Eu era pastor titular com uma jovem família e uma igreja em crescimento, que me preparava para a conclusão do programa de doutorado – tudo ao mesmo tempo. Os médicos realizaram exames a fim de detectar possível disfunção do ouvido interno ou do cérebro. Após vários meses, nada surgia. Finalmente, um médico me perguntou: “Existe algum estresse em sua vida?”

Pensando nisso agora eu dou risada. Você tem algum estresse? Se meu corpo fosse árvore, minhas raízes estariam lutando para permanecer firmes no chão. Eu começava a balançar até mesmo nos dias de céu azul sem nuvens ou ventos. Às vezes, as circunstâncias nos forçam a reconhecer a necessidade de paciência para nosso trabalho pastoral. Teremos de nos entregar à mentoria do Espírito para obter seus frutos, senão bateremos a cara no chão, expondo raízes mortas para o mundo inteiro.

O que torna tão difícil ir mais devagar? São nossos anseios por algo mais do que um trabalho de pouca fama, nosso desejo de estar em todo lugar para todos, de saber tudo, consertar tudo: a tentativa de tomar o lugar de Deus, e nossa falta de oração, que nos deixa sobrecarregados com um fardo que só Deus é capaz de carregar. Sim, mas as circunstâncias também não ajudam muito.

Por que as pessoas saem

Geralmente as pessoas saem de uma igreja que tem um novo pastor por uma de duas razões (frequentemente, nos primeiros dois ou três anos da chegada desse novo pastor): (1) o novo pastor não é suficientemente igual ao antigo pastor e as coisas estão mudando depressa demais; ou (2) o novo pastor é parecido demais com o pastor anterior e as coisas não estão mudando o suficiente. Grupos se ajuntam e falam uns aos outros sobre qual lado tomar. Eles reforçam o seu desprazer.

Mas outros fatores negativos também podem colidir e conspirar para o aumento das pressões.

Para nós, foi uma recessão econômica que varreu o país inteiro como uma enorme tempestade de areia. Muitas instituições sem fins lucrativos e igrejas estavam sofrendo. Nós não éramos exceção. Os presbíteros e eu começávamos a conversar com a equipe pastoral sobre as possíveis implicações para todos os nossos empregos. Reuniões até tarde da noite estavam se tornando norma para nossa liderança. Tínhamos olhado páginas impressas cheias de numerosos fatos. Havíamos examinado orçamentos apertados que não tinham onde apertar mais. Havíamos orado por pessoas que iam embora, as quais tínhamos amado e orado, e por pessoas que permaneciam, mas estavam esgotadas. Com o tempo, teríamos de tomar duras decisões, que causariam impacto sobre outros de nossa equipe, e estávamos olhando firmes, sem palavras, uns aos outros.

Não ajudava o fato de que eu havia iniciado meu pastorado ali trabalhando em tempo parcial. Nosso plano era que eu iria gradativamente tornar-me pastor de tempo integral no decorrer de dois anos. Essa ideia era nobre, mas não deu certo. Quando alguém me telefonava na quarta-feira, às quinze horas, pedindo para falar imediatamente comigo, eu dizia: “Posso te ligar hoje à noite ou então amanhã à tarde. Se esses horários não servirem, posso vê-lo na sexta-feira”. Essa pessoa se sentia ofendida. Para eles, assim como para mim, era estranho ter de esperar. Eles sentiam que eu não me importava em cuidar deles. Eu me sentia culpado. Quando o imediato for nossa norma, ter de esperar por um telefonema daqui a três horas às vezes fará com que nos sintamos desprezados. Reclamaremos.

Eu também estava pregando em meio a sofrimento devido a muitas coisas. Anos mais tarde, rimos muito, com lágrimas nos olhos, por causa do sermão de páscoa que, em retrospectiva, mais parecia um ofício fúnebre, bem no início do meu tempo ali. Em vinte minutos, eu havia explorado a morte e escuridão e a dor tão completamente, com tanta tristeza, que quando tentei falar da ressurreição ninguém conseguia enxergá-la. Hoje damos risada com a graça da memória — da humilhante paciência de amigos que aguentaram permanecer juntos. Mas aquela realidade exigiu muito das pessoas que tinham pouca paciência para isso.

Além de tudo isso, ironicamente, tínhamos oferecido uma visão rápida demais da paciência. Passar juntos, em comunidade, por esse tempo parecia estranho, até entediante. Ver a congregação como um grupo de pessoas com as quais viver a vida ao invés de um produto a mobilizar, ou, ter como experiência, ver um pastor como alguém a amar ao invés de consumir — era uma novidade para a maioria de nós.

Tendo dito e feito tudo, cento e cinquenta pessoas saíram de nossa igreja em três anos. Cento e cinquenta mil dólares do nosso orçamento foram com eles. Tivemos de despedir três pessoas de nossa equipe que trabalhavam em tempo integral. Demos vários meses de aviso prévio e compensação. Todos nos sentíamos feridos. Nos questionávamos. Tornamo-nos a igreja mais comentada da comunidade. Mas os comentários não eram esperançosos, e frequentemente eram maldosos. Isso não é algo fácil de superar — não pela pressa. Pelo contrário, a disposição mental impaciente de tentar fazer grandes coisas de maneira notória e imediata foi o que parcialmente atacou-nos como um torpedo. Nós quase afundamos. Quase.

Estávamos fazendo, com lágrimas sinceras e corações humilhados, uma pergunta importante entre as coisas que tinham importância: “Senhor ensina-nos a seguir-te naquilo que poderá recuperar esse navio que está afundando”.

A atração da pressa

Para começar, tínhamos de aprender o que o trabalho pastoral realmente requer. Eugene Peterson termina a citação que mencionei anteriormente da seguinte maneira: Penso que o pecado que mais atinge os pastores, especialmente os pastores evangélicos, é a impaciência. Temos um alvo. Temos uma missão. Vamos salvar o mundo. Vamos evangelizar a todos, e vamos fazer muitas coisas boas para encher as nossas igrejas. Isto é maravilhoso. Todos os objetivos estão certos. Mas essa obra de trabalhar com as almas é um trabalho vagaroso, que anda bem devagar... e ficamos impacientes e começamos a tomar atalhos para encurtar o caminho.23

“Ande”, dissemos a meu filhinho de um ano e pouco, que queria correr com seus amiguinhos ao lado da piscina pública. Eu o oriento a ir mais devagar, não porque quero que ele perca suas marcas, mas exatamente porque indo mais devagar ele terá melhores chances de realmente atingir o marco.

Assim, é possível descrever pressa como “o sentimento de estar atrasado” ou “achar que temos de correr”. Onde quer que estejamos, é como se estivéssemos com coceira para ir embora. Temos outro lugar em que devemos estar, e onde estamos nunca é aquele lugar. Nós constantemente sentimos que estamos perdendo algo, perdendo nossa chance, ou abrindo mão daquilo que poderíamos ter se pudéssemos chegar lá antes da areia da ampulheta acabar. No nosso caso, primeiro tínhamos de avaliar por que achávamos estar perdendo alguma coisa.

1) Para começar, a pressa faz parte do ar que respiramos. Ainda que devagar na Bíblia seja mais usado para descrever o bom caráter de Deus (tardio para se irar), para a maioria de nós, devagar é igual a desperdício ou desrespeito.

2) O passado de nossa igreja específica. Antigamente, a nossa igreja tinha sido popular, ou seja, isso foi antes de nossa divisão. Estávamos progredindo na comunidade, e cresciam as conversas sobre as coisas que Deus estava fazendo entre nós. As orações das pessoas que deixaram o conforto de uma igreja de origem para começar este novo trabalho evangelístico estavam sendo respondidas. Mas então, veio uma fratura devastadora entre gente boa, e isso saqueou grande parte do que tínhamos. Quando eu cheguei, havia um desejo palpável de obter de volta aquilo que tinha sido perdido. Mas a essa altura, eu estava na quarta liderança pastoral em seis anos. Nos primeiros meses, cinco casamentos se desfizeram, dois grupos de pessoas caluniaram e arruinaram os relacionamentos, e um grupo nos lares implodiu de forma totalmente perniciosa. Estávamos agora fazendo perguntas difíceis e confissões. Se a nossa popularidade realmente fosse sinônimo de saúde da igreja, como é que nossos relacionamentos internos remavam tão prontamente para a divisão e fraturas? Um anseio por avivamento imediato e um retorno poderá nos tentar a dizer não à paciência e sim aos atalhos.

3) Não estávamos longe da igreja de maior “sucesso” na cidade. Na mesma rua, um pouco mais para baixo, há uma igreja que cresceu depressa e grandemente. Hoje seus recursos estão espalhados por toda a cidade. Alguns achavam que estávamos a caminho de ser iguais àquela igreja. Outros se entristeceram porque muitos do nosso povo saíram e foram para lá. Outros se irritaram ou zangaram-se, ficando inseguros, sentindo como uma loja pequena de proprietário local na presença de uma rede gigante, tentando competir quando a loja da rede constrói cada vez mais ao redor da nossa. Embora a maioria das igrejas na América do Norte não seja desse tamanho nem cresça tão depressa, o restante de nós é tentado a acreditar que a sua história, e não a nossa, é a norma para o mundo evangélico. Medir-nos pela igreja da mesma rua pode nos tentar a acreditar que ficamos para trás e fomos ultrapassados. Começamos a nos apressar, medindo-nos pelo chamado deles, e não pelo nosso.

4) Eu fui considerado um grande negócio. Olhando para trás, somos humilhados pelos exageros que faziam a meu respeito também. O pastor anterior era meu amigo. Nosso coração batia no mesmo ritmo. Em nossa comunidade eu era um peixe de tamanho médio num lago pequeno. Chegou o “Dr. Eswine”. Todo mundo esperava que grandes coisas acontecessem. Quem sabe a mentalidade pró-celebridades que infecta nossa cultura geral estivesse nos fazendo tropeçar. A presença de um líder que atrai as pessoas pode nos tentar a negligenciar o que a paciência normal no trabalho pastoral requer, não importa quem sejamos.

5) Nosso coração pelo evangelho excedia as nossas habilidades com o evangelho. Essa igreja é realmente notável. Fez o que poucos fariam. Chamou para ser seu pastor um pai que tem cuidado sozinho de seus três filhos. Tentando recuar do processo de candidatura, eu lhes dissera: “Não sei ser pai solteiro e pastor ao mesmo tempo”. Eles responderam: “Nós também não sabemos, mas vamos aprender juntos”. Falarei mais a esse respeito mais adiante. Mas para agora, basta dizer que éramos como missionários estrangeiros que, depois de um ano, ficam a se perguntar em que loucura estiveram pensando. O que esse compromisso na verdade requereu de todos nós em amar uns aos outros foi mais real e tangível do que a graça que sonhávamos oferecer. Anote bem isto aqui: fazer a transição de uma declaração de visão missional de amor ao próximo para o verdadeiro amor ao próximo pode nos tentar a desistir com impaciência e procurar por atalhos.

Tivemos de encontrar um paradigma diferente.

Nossas necessidades na maratona

“Corramos com perseverança”, disse o apostolo sobre “a carreira que nos está proposta” (Hb 12.1).

Uma maratona é criatura que mastiga e tritura aqueles que tentam atacá-la com um lance. Maratonistas também falam sobre “bater contra a parede”. Entre o vigésimo e o vigésimo terceiro quilômetro, as pernas cedem. Pulmões queimam. Multiplicam-se as razões que justificam desistir. Multidões animadas não providenciam mais o combustível inspirativo que davam nos marcadores de quilometragem anteriores.

Essa experiência não faz os maratonistas pararem de correr, ou a alertarem com gritos assustados a uma pessoa que tem a intenção de participar de uma maratona: “Vá embora! No quilômetro vinte e três você quer deitar e morrer! Por que correr?” Em vez disso, saber sobre essa parede alimenta nossa educação, nosso preparo e nosso treino. Em vez de fugir da corrida, eles se lançam a ela, treinando o que fazer quando chegar a hora.

Em contraste, quando os pastores batem em muros nos seus primeiros três anos, ou no décimo-quarto ano ou no vigésimo, ficam indagando se realmente foram chamados ao ministério, como se algo singular e inesperado estivesse acontecendo com eles. Quando os relacionamentos, casamentos, pais, novos empregos, ou pequenos grupos na igreja batem contra a parede, sua primeira reação é achar que algo está errado. Eles cometeram algum erro, e têm de desistir.

O que aconteceria se, em vez disso, aprendêssemos a antecipadamente nomear os muros e falar do ritmo que se requer, não só para enfrentá-los como também para permanecer além deles, e caminhar adiante com força até a linha de chegada dos chamados ao evangelho?

Esquecendo-nos de nossas próprias necessidades na maratona, sentimos essa espécie de estresse que sente o plantador de igreja em seus primeiros dois anos, ou o estresse que um jovem pastor experimenta numa igreja rural, ou o estresse que sente um pastor com grande potencial e expectações. “Já estou servindo a dois anos, e ainda temos apenas vinte e cinco pessoas”, diz ele para si mesmo. “Será que fui chamado? Será que Deus está operando? Eu deveria me mudar para outro lugar? Cometi um erro ao vir para cá?”

Nossas circunstâncias eram diferentes, mas a crença por baixo do que acontecia era a mesma. Porque a realidade era menor, mais vagarosa, dolorida, imperfeita, desconfortável e aparentemente ordinária, estávamos nos perguntando: “Por quê? O que foi que aconteceu? Será que estamos fazendo alguma coisa errada?” Aqueles que foram embora logo estavam fazendo a mesma coisa.

Na verdade, havíamos contratado além da curva. Esta era a razão pela qual nosso treinador era a situação imediata. Por “curva”, nos referíamos ao crescimento numérico que viria. Em retrospectiva, vejo que estávamos nos perguntando: Por que presumimos que viria em curva? Por que sentíamos necessidade disso? E por que havíamos achado que se viesse, seria assim tão rápida?

O apóstolo Paulo oferece textos de maratona para o nosso trabalho pastoral. Os pastores são como soldados que suportam sofrimento, atletas cujo modo de vida compete de acordo com o que requerem os regulamentos da corrida; lavradores trabalhando pesado, entre os terrenos, as estações e as condições climáticas. Então, Paulo recomenda-nos a “pensar a respeito” do que ele diz (veja 2Tm 2.3–7). O pastor que medita, necessariamente também tem de andar mais devagar.

Não é de surpreender, conforme Paulo vê, que necessitemos de muita força e perseverança, para aguentar as longas distâncias de maneira cristã, ao nos relacionarmos com os amigos e críticos, nas tempestades e nos dias ensolarados, nos estouros e na calma. Os pastores são atletas da corrida da graça, corrida de longa distância. As congregações oferecem o roteiro que seus corredores na maratona tomarão.

Paciência como uma virtude pastoral

Este paradigma pastoral estava nos levando a enfrentar frente a frente uma velha piada dos círculos cristãos. “Ore pedindo qualquer coisa exceto paciência”, sugere a piada. “Você não quer ver o que Deus lhe dará se você lhe pedir por isso. Orar pedindo paciência é muito perigoso”.

Já ri ao contar essa piada. Agora acho que a piada me pegou. Nunca havia percebido o quanto ela presume erroneamente que é possível seguir a Jesus sem ter paciência. Ela também presume que Deus não se importa com a paciência em nossas vidas, a não ser que peçamos por ela. Tenho estado errado em ambos os casos. Uma presunção da piada, porém, é verdadeira: frequentemente a paciência se aprende dentro do contexto de tribulação. As provações parecem interrupções em nossas vidas, que em outros aspectos são boas. Mas, mais vezes do que imaginamos, essas provações se tornam em cachorros que latem contra a impaciência e a pressa que tentam entrar de soslaio nos salões de nossa vida. Não veríamos o intruso escondido que procura nos ferir, não fossem essas latidas de alarme. E a impaciência realmente nos fere. Aos olhos de Deus, ela nos prejudica mais do que as provações (Tg 1.2– 4).

Experimentamos dor relacional entre as torrentes de amigos que foram embora à procura de outras igrejas. Também gastamos horas conversando tarde da noite ou em longos almoços, tomando decisões em meio à nossa fadiga. Como separar e colocar em ordem a diferença entre amigos e inimigos em meio ao turbilhão de reclamações, sofrimentos, e queda livre?

Paulo treinava Timóteo e Silvano nesta obra, e nós encontramos aqui a sua ajuda: “Exortamo-vos, também, irmãos, a que admoesteis os insubmissos, consoleis os desanimados, ampareis os fracos e sejais longânimos para com todos. Evitai que alguém retribua a outrem mal por mal; pelo contrário, segui sempre o bem entre vós e para com todos” (1Ts 5.14–15).

“Tenha certeza de que são os indolentes e não os de coração fraco que vocês admoestam. Seja claro quanto aos desanimados e não aos indolentes que você está encorajando”, Paulo diz. Então

Paulo revela o que esta obra congregacional do discernimento e cuidado exigirá: “Quer a pessoa seja indolente, desanimada, ou carente de ajuda, quer você esteja admoestando ou encorajando a pessoa, esteja certo disto”: Paulo disse: “Sede paciente com todos”.

Mas, como mostrar paciência em meio a acusações maldosas ou descaracterizações? Paulo ofereceu a resposta. Mesmo quando alguém lhes fizer mal, ele os exorta a, em vez de cuspir as emoções para fora, esperar pelas legítimas. Deverão suportar sua ferida profunda.

Em nossos dias, isso seria igual a esperar dois ou três dias antes de responder o e-mail e deixar de usar a fúria de uma mensagem imediata de voz. Eles (e nós) devem encontrar perspectiva e cura de uma fonte diferente da gratificação temporária de correr para pagar pelo mal que foi feito a eles. Devem esperar passar os pensamentos e emoções até que possam escolher o bem, até mesmo para um inimigo. Então essa luta pelo louvor, oração e gratidão sem cessar, em todas as circunstâncias que enfrentam, e a busca por aquilo que vem do Espírito de Deus (abrindo mão daquilo que não provém dele) — revelam o caminho tomado pela paciência (1Ts 5.16–22). “Ora, é necessário que o servo do Senhor não viva a contender, e sim deve ser brando para com todos, apto para instruir, paciente, disciplinando com mansidão os que se opõem, na expectativa de que Deus lhes conceda não só o arrependimento para conhecerem plenamente a verdade” (2Tm 2.24–25).

Resistir ao desejo ilusório de defesa, conserto e alívio imediato não é algo fácil de se fazer de maneira pastoral. Brandura paciente requer coragem e força. Por exemplo, um e-mail parece uma isca sedutora para uma briga. Notei que eu não via uma família querida na igreja por algum tempo. Eu os contatei perguntando como é que estavam passando. Recebi como resposta um e-mail do chefe da casa. Eu não via a família porque eles tinham deixado nossa igreja. Lê-se assim o e-mail: Resumindo, a despeito das muitas boas experiências que tivemos em Riverside, e das pessoas a quem realmente apreciamos, resolvemos tentar encontrar uma igreja mais apropriada ao que entendemos ser nossa necessidade. Basicamente, estamos à procura de uma igreja onde o evangelho é muito apresentado; onde a doutrina é abraçada e ensinada, onde passagens inteiras da Bíblia são apresentadas a cada domingo. Eu não culpo a Riverside por ser a igreja que é. Ela é uma igreja que está seguindo a mesma direção que MUITAS igrejas americanas parecem estar indo. Espero que seja de grande efeito para muitas pessoas. Só para constar, ainda não encontramos nenhum lugar em que nos encaixemos. Está ficando muito frustrante, e chegamos a ponto de tentar (arrepios!) começar uma pequena igreja em casa. Eu me sinto totalmente despreparado para isso. Mas a coisa é esta: conheço diversos outros (homens em particular, nenhum deles da Riverside) que estão igualmente frustrados com a moderna igreja americana e que conversaram a respeito conosco, e pretendemos começar outra. Não que tenhamos tempo para isso, e, claro, nenhum de nós é pregador.

Um e-mail como esse — especialmente durante uma semana ou estação de múltiplas críticas — nos desafia. Ouvir que eu não apresento muito o evangelho, não ensino doutrina nem dou destaque à Bíblia, e que junto com a maioria das igrejas temos pregado mais sobre sociologia e terapia do que o evangelho, é duro de engolir. Pode parecer um soco no estômago de tirar o fôlego, particularmente quando conhecemos a nós mesmos como quem busca o evangelho aberta e biblicamente em tudo que fazemos. Tais críticas se tornam ainda mais difíceis quando, no contexto da amizade, o remetente jamais mencionou antes essas coisas.

Além do mais, não há espaço para falhas ou intenções de crescer. Quando a perfeição do padrão desejado não for atingida, a pessoa vai embora, em vez de entrar para trabalhar junto e fazer acontecer. Finalmente, sair de fininho, sem conversar, e se isolar, é desconcertante para um pastor. Somos tentados a tomar como uma declaração pessoal sobre a nossa identidade. Contudo, correr para me defender, para instruir (não) bondosamente, ou tentar imediatamente consertar tudo também não é escolha sábia. Prova ser de nenhuma ajuda. Alguma espera é necessária. Às vezes a espera vai continuar. O quadro de nenhuma resolução continuará. Nenhuma solução virá até que venha Jesus.

Toda essa espera durante as partes invisíveis da semana poderá também penetrar nossa pregação se não tomarmos cuidado. “Prega a palavra, insta, quer seja oportuno, quer não, corrige, repreende, exorta com toda a longanimidade e doutrina”. (2Tm 4.2) Temos de resistir à presunção ingênua ou manipulativa de que, só porque pregávamos ou dizíamos alguma coisa a alguém uma vez, desde então e imediatamente, elas sempre e eternamente acertarão no que dizem. Isso é pregação impaciente. A pregação impaciente capacita o ouvinte a evitar a luta contra uma pergunta — espera que o ouvinte sempre escute, sinta ou pense do jeito certo imediatamente; ela presume que crescer em Jesus não requeira dias, semanas, meses e anos.

O que Paulo ensina a pastores sobre seu trabalho de paciência, Jesus também ensinava. Aqueles que suportam os ataques do diabo (Lc 8.11–12), as provações do mundo (Lc 8.13) e os desejos mal dirigidos da carne (Lc 8.14) exigem paciência em Jesus para isso. “A que caiu na boa terra são os que, tendo ouvido de bom e reto coração, retêm a palavra, e produzem fruto com paciência” (Lc 8.15).

Temos de ajudar um ao outro

Eu não era capaz de fazer ou ser isso. Precisava de ajuda, e essa ajuda veio.

Um furacão tem um olho no centro, onde habita a calma. No meio das piores tempestades de vento em nossa igreja, aos poucos ficou claro para mim que no centro de tudo, nossas famílias e lídereschave estavam se mantendo firmes. Os seus amigos estavam saindo. Mas eles, não. Eu não era o único a segurar, tentando conseguir forças para uma corrida que não queria disputar. Eles também seguravam as pontas. Sem esse compromisso central de continuar juntos na distância, não teríamos vencido. Quando a tempestade bate, é útil avaliar quem está dentro do olho do furacão e o quê os mantem unidos. Neste caso, foi nossa esperança em comum do que Jesus ainda poderia fazer em nossa igreja, para o bem desta comunidade.

Depois da minha peste negra de sermão de páscoa, Joe me perguntou se poderia almoçar comigo. Conversamos sobre as nossas famílias, um e outro, Jesus, nossa igreja. No final ele disse uma coisa pequena que era enorme: “Zack, eu o respeito como homem, pai e nosso pastor. Estou com você nisso. Vamos fazer juntos. Observei algo, uma coisinha, e queria saber se você dará algum tempo para pensar sobre isso”.

“Sim”, eu disse. “Qualquer coisa. Claro”. “Sabe como na música temos acordes maiores e acordes em tom menor?”

Acenei. “Ultimamente, tenho notado que você tem enfatizado os acordes menores em sua pregação. Não me entenda mal. Precisamos de graça nos acordes menores. Não sei como eu estaria aqui de pé agora mesmo se eu fosse você. Você me inspira. Mas talvez haja um acorde maior ou que possa tocar mais frequentemente do que está fazendo no momento. Acho que isso pode ajudar a você, e ajudará também a nós. Você se importa em pensar sobre isso?”

Na verdade, eu pensei nisso. Este presbítero deu-me palavras de graça, de compromisso e ajuda. Enquanto muitos estouravam em sua volta, fustigados pelo vento e fora de si quanto ao sermão e outras coisas, do olho do furacão ele simplesmente falou comigo. Jamais me esquecerei disso.

Vem à mente o que Paulo falou a respeito de Tito: “nenhum alívio tivemos; pelo contrário, em tudo fomos atribulados: lutas por fora, temores por dentro. Porém Deus, que conforta os abatidos, nos consolou com a chegada de Tito” (2Co 7.5–6).

Paulo e sua equipe sentiram fadiga de corpo, temores internos e conflitos externos em uma localidade específica. O conforto veio da maneira menor e quase invisível, principalmente por gastar pequenas porções de tempo com um amigo. Nós, os sofredores, não suportamos mais entrar sozinhos nessa maratona.

De fato, quando penso sobre tudo que tínhamos visto em meus primeiros quatro anos, fiquei maravilhado pela força das mudanças no grupo-chave da igreja. Eles tiveram quatro mudanças de liderança em seis anos. Deixaram a estabilidade de uma igreja maior, mais estabelecida, pelo desconforto de crer que Jesus lhes daria poder para um novo esforço evangelístico nesta parte da cidade, para a sua glória. Ainda estavam aqui, esperando. Como isso poderia ser? Comecei a pensar com os meus botões: E se eles fossem os verdadeiramente honoráveis? E se sua fé em meio a esses dias de pequenas coisas revelasse que eram eles as verdadeiras histórias de sucesso espiritual em nossa comunidade?

Eu os admirei e aprendi com a paciência desse grupo cerne. Nunca precisei aprender paciência com os que se desviavam. Todos nós requeremos paciência de outros para conosco. Eu havia saboreado uma espécie de traição, incluindo o ferrão dos evangélicos que não estavam nos melhores momentos, quando sentem um cheiro de escândalo em você. Eu havia sido assustado, estava com medo de pessoas, particularmente por gente da igreja, uma novidade desconfortável. Os arranhões emocionais da crítica, a maior da minha vida e ministério, haviam me levado a, por duas vezes, apresentar o meu pedido de demissão. Ainda no começo desse período, a constante vulnerabilidade como pai solteiro parecia demais. Eventualmente voltei a namorar e me casei, como pastor, sob o olhar público, às vezes, cruel. Mas estes presbíteros continuaram a dizer que acreditavam que Deus estava operando. “Seja paciente”, diziam. “Aguente firme”.

Certa noite, compartilhei meus temores com meus presbíteros.

Lágrimas e temores fluíam, embaraçosamente livres. “Zack”, disse Ty, “se acontecesse o pior, e esta igreja que amamos fechasse, nós ainda estaríamos com você, seríamos os últimos a apagar as luzes. Estamos com você e esperamos que você fique conosco, ainda que chegue a esse ponto”.

Existe uma estranha doçura que pode ser encontrada entre a dor de uma ameaça iminente e sem respostas, quando se passa dias sem aquilo que se sabe seria mais fácil se apenas já o tivesse em mãos. Diz a paciência às mãos vazias: “Deus está aqui”. A paciência, que parece de rosto pior, declara: “Deus não vai abandoná-lo”.

A paciência leva tempo

Estou tentando dizer que Deus fala sobre esse “não abandono” nas formas menores, quase desprezadas. Frequentemente é em presença e sentenças como as de Tito; são estes os dons que Deus nos manda, sussurrando entre o som estridente e barulhento.

Estava sentado com meu amigo pastor em uma cafeteria local que frequento em Webster Groves. Ele é Quiuí — quer dizer, veio da Nova Zelândia. Eu sou “Hoosier” — que quer dizer que vim de Indiana (só que aqui em Missouri a palavra Hoosier tem a conotação de “não presta para nada”).

Saboreava meu café e começava a sentir pena de mim, ligando ponto a ponto temas desanimadores. Com o tempo, eu precisaria resistir e desfazer essas ligações negativas. Também precisaria conduzir nossa congregação por sua própria necessidade de fazer o mesmo, para que finalmente saíssemos debaixo das narrativas velhas e apagadas, que não mais descreviam aquilo em que estávamos nos tornando e a boa obra que Deus havia realizado entre nós. Mas isso viria mais tarde.

No momento, meu amigo Quiuí simplesmente escutou com bondade e calma, enquanto eu entrava em parafuso de autoabsorção, sofrimento e reclamações. Ele é um homem que pastoreia em lugares onde as igrejas evangélicas são tão poucas que às vezes não existe uma igreja na região para os pastores ou congregantes procurarem. Às vezes os pastores têm de trabalhar em outra coisa só para conseguir pagar o aluguel. Vivendo naquele contexto, ele demonstrava uma consideração bondosa e sábia para com meus pressupostos grandes, notáveis. Pressupostos sobre tudo que eu imaginava que deveria ter acontecido até agora.

“Zack”, arriscou. “Você se lembra de sua crença de fazer pequenas coisas, devagar, por longo tempo?”

“Sim”, acedi. Ele fez uma pausa. “Isso vai levar algum tempo”. Eu fiquei olhando-o fixamente. Demoramos ali. Ele começou a sorrir.

A verdade de suas palavras começou a penetrar. Encostei-me para trás em minha cadeira e fiz um não com a cabeça. Suspirei fundo e me veio à mente: Ele também come. Comecei a dar meia risada com a ideia, e ele também começou a rir.

Logo o riso e a graça se encontraram. A paciência requer paciência. Ir longe leva mais tempo do que a velocidade. Às vezes precisamos de um amigo comum, em algum momento despercebido de impaciência com as orações não respondidas, que possa nos lembrar disso. Ibid.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -12;

  -- 9 | Uma nova ambição (reaproveita a aula de ordem 13: preserva o progresso)
  update public.aulas
  set titulo = $t$9 | Uma nova ambição$t$,
      ordem = 13,
      conteudo =
$conteudo$Todo homem tem dentro de si alguém que deve morrer.

– Christian Wiman Havia certa vez um homem que se importava tanto com as árvores que viajava constantemente em favor delas. Porém, enquanto educava por toda parte e cuidava pessoalmente de arvores infectadas, de longe e de perto, de tempos em tempos as tempestades e os enxames varriam a cidade desse homem. As rojadas sopraram e derrubaram os pinheiros e carvalhos de seu bairro. Suas raízes locais acabaram ocas e enfraquecidas pela podridão. Enquanto era respeitado e muito ocupado dispensando sabedoria para a casca e a folha, as árvores do quintal daquele homem estavam tombando. Ninguém estava lá para cuidar delas.

Desintoxicação

Quando Jesus começa a nos livrar da tentativa de consertar tudo, saber tudo, estar em todo lugar para todos, o mais rápido e da forma mais notória possível, encontramo-nos em situação difícil. Muitas vezes nos encontramos naquilo que, nos velhos tempos, chamavam de “noite escura da alma”.24 Temos de voltar para casa e cuidar de nossas próprias raízes. A ausência de movimento nos desestabiliza. Uma espécie de detox espiritual toma lugar. Somos como fumantes que tentam parar de fumar. Resmungamos e andamos de lá para cá, inquietos.

Até agora, por exemplo, se procurou estar em todo lugar para todos, você conseguiu passar cada dia utilizando telas tecnológicas, mídia social, e-mail e telefones, assistindo a mais uma reunião, apoiando mais outra causa ou agenda, de novo. Inveja, cobiça e autopromoção estão sempre à espreita aqui. Muitas pessoas o têm aplaudido por sempre estar dando-lhes apoio. Mas isso também fez com que as pessoas se sentissem presas a você por sua presença pegajosa, arrogante, por sua constante autopromoção, ou se sentissem não confiáveis se tentassem fazer alguma coisa sem você. As pessoas de casa sentiam que você as deixava para trás ou sentiam-se abandonadas por sua necessidade de sempre estar em algum lugar que não onde e com quem você estava. Essa carência sombria e crescente por precisarem de você é mais aparente para elas do que para você.

Se você tem se caracterizado como sabe-tudo, até agora habitualmente passa o dia dependendo do noticiário, das manchetes, dos blogs, livros, palavras, teologias, comentários, conferências, vídeos, bibliotecas, apresentações de televisão, conversas ou salas de estudo. Ser conhecedor das respostas e daqueles que respondem é o que você usa para passar o dia e fazer funcionar o seu ministério. A fofoca, a maledicência e a arrogância também têm espreitado por aqui. As pessoas amam isso e o elogiam pelo seu modo de manter as suas respostas ao mundo claras e diretas. Porém, outros começam a se sentir mais usados do que conhecidos por você. Aprenderam que não podem discordar de você. Em algum ponto da linha, simplesmente pararam de tentar contribuir com seus pensamentos. Você perdeu a capacidade de ficar quieto quando outra pessoa tem um pensamento a contribuir. Mesmo que concordem com você, é difícil imaginar deixar que saiam em frente, sem ter certeza de que estão levando com eles os pensamentos que você emitiu.

Tentados a consertar tudo, ficamos acostumados a reagir febrilmente, impacientes para encontrar algo, qualquer coisa que constantemente impeça as pessoas que nos incomodam. Conseguimos passar cada dia com fortes emoções, quando não passividade manipulativa veloz e com estardalhaço, junto a uma constante recriação (“re-creação”) de programas, slogans, sinais, palavras, pessoas em sua equipe e até mesmo do jeito de arranjar as cadeiras para resolver problemas. As pessoas têm amado o jeito que você sempre as manteve se mexendo com os passos que necessitam par resistir ao desconforto. Mas a impaciência também tem espreitado por aqui. Você começa a se utilizar de raiva irrefletida, medo, tristeza ou interrupções. As pessoas começam a se sentir emocionalmente agitadas, na roda-viva, insuficientemente ocupadas, e incapazes de fazer o bastante para tornar as coisas boas para você. Mesmo quando estão bem emocionalmente, você não consegue acreditar. Perdeu a sua capacidade de lidar com emoções negativas e começa a encontrar soluções onde não existem problemas. Feito para uma crise, não sabe o que fazer em tempo de paz porque você mesmo pouco sabe sobre paz e quietude. Eventualmente, as pessoas começam a guardar para si os seus próprios problemas.

Você não somente transmitiu fielmente o bom conteúdo do evangelho, como também percebe que transmitiu o desconforto mal dirigido de tentar ser como Deus. Em Cristo, você sabe que é hora de deixar de lado todo esse aparato. Mas são duas e quinze da tarde de quarta-feira. A coisa parece pior antes de ficar melhor. Nos próximos sessenta minutos nada dessa lista vai ajudá-lo, e você sente o desconforto da saúde.

Olhe para a tela (TV, computador, fone, tablet, aparelho); verifique a mídia social; verifique seus e-mails; compre qualquer coisa; faça um telefonema; cheque a sua agenda; encontre qualquer pessoa a não ser sua esposa e filhos; participe de uma reunião; verifique o noticiário; leia um livro; verifique uma postagem de um blog; vá até a biblioteca; vá a uma loja de café; escute um podcast; prepare um sermão; prepare um estudo bíblico; jogue um jogo; use um aplicativo; crie um programa de ministério; avalie um método; mexa com a declaração de visão; elabore um folheto; mexa com os móveis ou cartazes; mude o logotipo ou algum cartaz; verifique seu orçamento; ponha a sua ira ou seu temor ou tristeza sobre outra pessoa; diga a primeira coisa que vem à cabeça; expresse a primeira emoção que sente; coma ou beba ou fale com as pessoas; procure o noticiário.

Se você não consegue fazer qualquer dessas coisas nos próximos sessenta minutos, o que sobra para fazer? Não é que tais coisas sejam ruins. Já vimos que ajudam. Mas quando elas se tornam aquilo que impulsiona o nosso tempo em vez de suporte para quando estamos à espera, perdemos de vista o jogo que fomos chamados a jogar. Tire as muletas e temos de aprender a andar de novo. Mas como? Primeiro, temos de voltar a uma vida centrada em Deus.

Interrompendo a Deus

Meus filhos gostam da brincadeira da “vaca interruptora”. Na brincadeira, a vaca sempre faz “muuu” quando a outra pessoa começa a falar. A vaca é impaciente. Não pode esperar. Ela interrompe com a voz certa na hora errada, para que aquilo que a outra pessoa vá dizer nunca seja ouvido.

Você e eu temos de confessar que nós, os sabe-tudo, consertatudo e em-todo-lugar-para-todos somos as vacas interruptoras. Mas as nossas interrupções não são brincadeira. Com toda a nossa atividade ministerial de erroneamente tentar ser como Deus, na verdade tornamos difícil para as pessoas ver ou escutá-lo. Calvino deixou isso bem claro. Assustei-me na primeira vez que li isso: Não ouvimos Deus falando a nós com calma, quando pensamos que somos muito sábios, mas, por nossa pressa, o interrompemos quando ele se dirige a nós… e, sem dúvida, ninguém pode ser verdadeiro discípulo de Deus, a não ser que o escute em silêncio. Porém, ele não requer o silêncio da escola de Pitágoras, de modo a mostrar que não é certo inquirir sempre que desejamos aprender o que é necessário ser conhecido; mas ele quer somente nos corrigir e restringir nossa presunção, para que não, como acontece comumente, o interrompamos despropositadamente, e para que quando ele abrir sua sagrada boca, possamos abrir para ele nossos corações e ouvidos, e não impedir que ele nos fale.25

Por todos os nossos sermões, estudos bíblicos, declarações de visão, almoços, reuniões, postagens, podcasts, e sessões de gerenciamento de igreja, constantemente ouvimos nossa própria voz. Os outros também. Para muitos de nós, faz muito tempo que não escutamos a Deus no silêncio, sabendo que era a sua voz e não a nossa. Fitamos nossa desintoxicação e começamos a perceber que fomos como um palestrante grosseiro na presença de nosso anfitrião. A etiqueta requer que o anfitrião dê as boas-vindas e convide a todos. Somente então é que o anfitrião informa a todos os presentes sobre a presença de seu porta-voz, que pode responder quaisquer perguntas ou atender às suas necessidades naquela ocasião em lugar dele. O porta-voz só fala após o anfitrião ter falado e então, somente para manter aquilo que o anfitrião deseja. Imagine como seria para nós, como hóspedes, se o portavoz ficasse tentando falar primeiro ou interrompesse aquilo que o anfitrião estava nos dizendo? Estou tentando dizer que nunca imaginei que com meu ministério da Palavra de tentar consertar tudo, saber tudo, estar em todo lugar de modo notório, eu estaria na verdade, como diz Calvino, “interrompendo a Deus” enquanto ele fala aos que ele me chamou para servir em seu nome, ou quando ele está falando comigo. Existe, sim, um “tempo para falar”, mas também há “um tempo para se calar” (Ec 3.7). Para deixar de lado esse mecanismo, é necessário conhecer o silêncio que se requer quando se está na presença do Deus vivo.

Silêncios, não apenas sentenças

Quando iniciei meu trabalho pastoral, os textos formativos foram “prega a palavra” (2Tm 4.2) e “Faze o trabalho de um evangelista, cumpre cabalmente o teu ministério” (2Tm 4.5). No decorrer dos anos eu escrevi extensamente e procurei sinceramente cumprir esses aspectos essenciais da obra pastoral.26

Mas passei a ver também que nós, pastores, temos a tendência de “usar muitas palavras”.27 Não estou falando do tamanho do sermão. Sermões curtos não demonstram necessariamente nada sobre a condição da vida interior do pastor. Eu me refiro a como nós pastores usamos palavras para gerenciar nossa família, ministérios ou nos preservar de enfrentar com vulnerabilidade aquilo que não conseguimos controlar. Ao longo do caminho, portanto, um texto de sabedoria se junta a esses outros textos para informar meu trabalho pastoral diário. “Sabeis estas coisas, meus amados irmãos. Todo homem, pois, seja pronto para ouvir, tardio para falar, tardio para se irar” (Tg 1.19).

Ser pronto para ouvir quer dizer que não falamos a primeira coisa, nem tudo que pensamos (devagar para falar), mesmo quando estamos certos, mesmo quando somos pregadores ou evangelistas. Também não damos voz imediata ou ventilamos até mesmo as mais fortes emoções que pulsam em nosso peito (tardio para se irar), por mais que sintamos vontade.

Se você não se importa, tome um momento para reler essas últimas duas frases de Tiago.

Quando Tiago diz “todo homem”, inclui aquele entre nós que prega e ensina. Mais tarde ele faz essa conexão ainda mais clara. Ele adverte: “não vos torneis, muitos de vós, mestres” porque estes enfrentarão juízo mais rígido. Então Tiago identifica nossa capacidade de tropeçar como motivo para a cautela no ensino (Tg 3.1). Tiago a seguir desenrola metáfora após metáfora para descrever o perigo de falar muito (Tg 3.2–12). Fica claro o seu ponto. Falar é perigoso. Os mestres são palradores. Portanto, grande cuidado tem de ser tomado. Os sábios têm de aprender a “ouvir” (Pv 1.5) antes de falar.

Jesus possuía tal sabedoria. Ele nos conduz a um aprendizado de fala secundária. Falamos somente como quem primeiro escutou. A primeira palavra em cena não é nossa. “Porque eu não tenho falado por mim mesmo, mas o Pai, que me enviou, esse me tem prescrito o que dizer e o que anunciar. E sei que o seu mandamento é a vida eterna. As coisas, pois, que eu falo, como o Pai mo tem dito, assim falo” (Jo 12.49–50).

A quietude de Jesus não é um tratamento silencioso de manipulação. Não é uma desculpa para negligência passiva. Também não é artifício para se evitar as palavras enquanto nos julga em silêncio. “Simplesmente deixar de falar, sem que o coração escute a Deus, não é aquietar-se” no sentido desta sabedoria.28 Em vez disso, Jesus nos mostra que ele aguarda em silêncio pela voz do Pai. Então ele fala.

“Silêncio nada mais significa do que aguardar pela Palavra de Deus”.29 Ficamos quietos cedo de manhã porque Deus deverá ter a primeira palavra, e somos silentes antes de dormir porque a última palavra também pertence a Deus.30 Passamos a ser mais quietos antes de falar no decorrer do dia, como se a cada momento, em cada cenário, aguardássemos ouvir outro em cuja presença propomos falar. O que, senão esse esperar em Deus na presença dos outros é nossa alegria e tarefa? A obra pastoral, como a adoração corporativa (Ec 5.1–3) e oração (Mt 6.7), não é um fórum no qual multiplicar nossas palavras e escutar nossa voz. Falamos apenas como quem escuta a voz de outro. Jesus não nos deixou. Nele encontramos graça restauradora para dizer de sua voz o que o poeta disse sobre a coruja: “Um som de coruja foi vagando comigo pela estrada. Eu não a ouvi — respirei-a em meus ouvidos.”31

Marque isso se puder. Os silêncios, não apenas as sentenças, formam o trabalho do ministério pastoral. Os pastores sábios são pregadores que escutam.

Ambição por quietude

Quando Jesus pergunta: “Que queres que eu faça?”, começamos de novo nossa desintoxicação. Aprendemos a dizer: “Por favor, me dê nova ambição por uma vida calma”. Imediatamente, ouço-me queixar: “Uma vida calma não vai fazer diferença! Se eu não falar e fizer acontecer, como é que vou efetuar as mudanças? Se eu deixar minha voz passar despercebida, como é que serei ouvido? Se eu não falar, não vão me entender. Se eu não mantiver as coisas em movimento, quem vai fazê-lo? O que será da obra de Deus?”

Mentores sábios nos pedem uma pausa aqui. Dizem-nos para escutar o que dizem os pensamentos. Ensinam que nossa queixa quanto ao silêncio pode expor ambições nocivas que espreitam por dentro. O velho Matthew Henry disse desta maneira: Temos de estudar para sermos quietos... Os homens, na maioria, são ambiciosos da honra de grandes empreitas, e poder, e preferências; eles as cobiçam, eles as cortejam, eles atravessam mar e terra para obtê-las; porém, a ambição do cristão deverá ser desenvolvida em direção à quietude.32

Henry estabelece essa nova ambição nas palavras do próprio Paulo “e a diligenciardes por viver tranquilamente, cuidar do que é vosso e trabalhar com as próprias mãos, como vos ordenamos” (1Ts 4.11). Estudar essa tranquilidade inclui disposição de ser ignorado “lá fora”, abrir mão do que o mundo deseja, a fim de ser fiel a Deus com a porção que lhe foi dada.

Mas como encontrar forças para ser ignorado no mundo, a não ser que essa quietude descreva também um sábado do coração a cada momento com Deus?33 Um coração de sábado descreve uma vida interior que busca repouso nele. Não tememos perder a atenção do mundo apenas porque temos prazer na companhia do verdadeiro tesouro. A atenção dele basta. Nossa confiança está em que ele mantém coesas todas as coisas. Cremos ser esta a verdade para qualquer pessoa a quem servimos. Esse descanso interno faz parte do que nós os ajudamos a cultivar.

Mas, por quê? Porque a quietude desta espécie tem seu lucro. Quando as circunstâncias nos assediam, estudamos a quietude de alma para que possamos nos manter inabaláveis “em meio às maiores provocações”34 e “desigualdades da Providência”.35

Quando as pessoas vêm contra nós como tempestade, com sua incapacidade de escutar e insistência por falar tudo que pensam e sentem, descansamos mais solidamente sobre este fato: “Uma verdade necessária, falada acaloradamente, pode causar mais danos do que bem, ofendendo ao invés de satisfazer.”36

Suportamos a tempestade e esperamos para reagir, se for esse o caso, depois que os ventos se acalmarem.

Ouço novamente dentro de mim o resmungar das objeções. “Mas Paulo escreve essas palavras dentro do contexto particular de cristãos que lutavam por cuidar de seu lugar local com trabalho de verdade. Paulo não queria dizer o mesmo que Matthew Henry disse, de que todos os cristãos devam fazer da quietude o seu estudo e ambição. Certamente ele não quis dizer que os pastores deviam fazer isso. Os pastores não devem se tornar ambiciosos por uma vida calma! Supõe-se que eles façam a diferença!”

As palavras de Henry voltam para mim e eu me pergunto: “Se, sendo pastores, nós não devemos estudar para sermos calmos, isso quer dizer que, ao contrário dos outros crentes, nossa tarefa é estudar para sermos barulhentos? Somos intencionados a insistir com os outros a essa espécie de descanso interno por entre as provocações da vida, quando nós mesmos não a possuímos? E nessa murmuração, você não está se esquecendo, Zack, que sob sua vocação como pastor, você é um cristão ordinário, que precisa colocar seu coração para descansar em Deus — não por amor de seu ministério, mas por amor de sua própria vida?”

Ainda mais, Henry não identifica a quietude com tom de voz ou um dia passado entre os lírios para repousar. Por mais significativos que esses possam ser, Henry conecta o repouso interior com nossa consciência. “Estamos acostumados a dizer: ‘Eu daria tudo por uma vida calma’ — Eu digo, qualquer coisa por uma consciência calma”.37

Não é nossa consciência o nosso agitador? Ela grita para nós, e nós, febrilmente, procuramos saber como consertar e ser mais rápido possível, a fim de assegurar ao nosso ser interior ou àqueles a quem servimos que somos suficientes e que nosso ministério é bom. Alvoroçamo-nos ao tentar ser como Deus porque não sentimos sensivelmente que seja bom e aceitável não ser assim.

Talvez agora nos sintamos desconsertados. Em Eclesiastes 9.17, a palavra “em silêncio” carrega a ideia de confiança ou descanso em contentamento.38 A primeira vez que você tenta passar um dia inteiro sem acesso a nada exceto a Deus em um centro de retiro local, você começa a se inquietar até ficar frustrado. Ficar parado entre os silêncios nos faz parecer crianças começando a andar, quando entram no berçário domingo pela manhã. No momento em que nosso pai ou mãe nos deixa ali, sentimo-nos abandonados. Ou explodimos em choro raivoso ou nos agarramos a qualquer pessoa ou coisa ou promessa que nos segure.

Charles Spurgeon, velho pregador batista, explica a razão. “Alguns homens não suportam a quietude”, diz ele, “porque isso revela sua pobreza interior”. Tire as muletas que usamos para manter de pé nossa persona conserta-tudo, sabe-tudo e sou onipresente, e as pernas quebradas de nossa intimidade com Deus se dobram. “Por mais valioso que seja o dom de elocução”, diz ele, “a prática do silêncio em alguns aspectos o excede em muito”. Ele acrescenta: Estou persuadido de que a maioria de nós considera demais a fala, que é, afinal, apenas a casca do pensamento. A calma contemplação, a adoração em silêncio, o enlevo sem palavras... não roubam de seu coração os mares profundos da alegria; não deixem de alcançar a vida nas profundezas por tagarelar para sempre entre as conchas quebradas e os

surtos espumantes da praia.39

A quietude é um meio da graça de Deus. Dentro dela, Deus nos mostra nossa pobreza interna e nossas ambições mal dirigidas. Ele esperou pacientemente, com calmo coração, enquanto nós fervilhávamos nossa vida com tempestades e espumas, constantemente o interrompendo. Agora que finalmente estamos em silêncio, ele tem cura para proclamar, consertos a realizar. Ficamos agarrados no conserto dos outros, no saber e ser tudo e no estar em todo lugar o mais depressa possível, com a maior fama possível, como o pequenino que não consegue passar um dia sequer sem seu cobertorzinho de consolo. Mas chega uma hora quando a criança tem de amadurecer em sua sabedoria e aprender a dormir sem ele. A primeira noite e dia tentando fazer isso é uma horrível desintoxicação. Mas logo vem o descanso, e a liberdade abençoa a todos na casa.

As provocações de um pastor

A este respeito, dois velhos pastores e um mais jovem nos dão bom conselho sobre nosso processo de desintoxicação. Sei muito bem que cada um desses pastores mais velhos era imperfeito; também, que eles talvez representem tradições das quais você discorde. Mas ser um pastor imperfeito, ou até mesmo profundamente errado, não é sinal de não ter nada certo ou bom em Cristo para nos dizer. Vejo isto toda vez que prego. Então, continue escutando se puder. Temos ajuda sábia aqui.

1) Os limites do seu chamado revelam o cuidado pastoral de Deus por você.

João Calvino quer que saibamos que para nos proteger de virar nossa vida de cabeça para baixo com as ansiedades, empenhos, anseios mal dirigidos, arfadas e colisões precipitadas, “cada indivíduo tem sua própria espécie de vida designada a ele pelo Senhor, como uma espécie de posto de sentinela, para que ele não vagueie sem rumo e sem cuidado”.40

É quarta-feira, duas da tarde. Você tenta se aquietar. Mas então você imagina o chamado de outra pessoa e queria que tivesse o mesmo chamado dela. Você tenta atravessar os limites de suas atribuições e ajunta para si as responsabilidades dela também. A calma não se encontra aqui. Não por muito tempo. Abra mão disso. Confie na paz de Deus para você. Não é “pequeno alívio dos cuidados, labores, problemas e fardos para um homem saber que Deus” tem dado a ele esse posto específico de sentinela neste tempo. Ao se libertar de tentar fazer algo que Deus não pediu que você fizesse, ele quer que você experimente sua contente “consolação”. Saber que essa posição lhe foi dada por Deus o torna capaz de “suportar e engolir o desconforto, a vexação, o cansaço e as ansiedades em seu modo de vida”, pois pelo menos você está “persuadido que este fardo foi colocado” sobre você “por Deus”.41

Noutras palavras, até mesmo a vocação pastoral faz parte do cuidado pastoral de Deus por aqueles a quem ele chamou. Assim, estou em meu escritório em Webster Groves na segunda de manhã. Os céus estão nublados com chuva e gelo, a semana começa gelada. Ao contrário de fazer outra coisa grandiosa que imagino para mim, Jesus também está aqui vestindo seu casaco de frio. Estava acordado antes de mim. Tem trabalho para ser feito nessa cidade do Missouri. Por seus propósitos, ele me chamou, e não você, para entrar nesse trabalho cheio de alegrias e de lágrimas com ele. Se ele é quem chamou, o trabalho deve ser importante. Se eu sou a pessoa para fazer isso, deve haver uma razão sábia. Isso quer dizer que tenho trabalho que é importante para fazer, mesmo se em toda a minha vida eu nunca conseguir fazer o trabalho que você realiza — o trabalho valioso que você tem para fazer ali fora e que às vezes eu, irrequieto e ingênuo, imagino que me faria mais feliz ou mais significante. Por favor, me perdoe. Tenho orações a fazer por pessoas sobre as quais você nunca ouviu falar. É melhor eu continuar com essa boa obra do dia. É melhor você também continuar com o que você tem a fazer.

2) Ao tentar tanto não perder nada, na verdade produzimos aquilo que tememos.

João Cassiano descreve ministros inquietos não só pelo chamado dos outros como também por seus dons. “Eles ouvem pessoas, as quais são comentadas, devido ao zelo ou virtude que não a sua própria”.42 Qualquer coisa que outro ministro faz bem torna-se ocasião, não para nossa gratidão a Deus pelo outro ministro e pela causa do evangelho em nossa geração, mas para torcermos as mãos e nos pressionar porque agora teremos de igualar ou fazer melhor aquilo que o outro ministro consegue fazer. Se nós não conseguirmos realizar o que todos os outros fazem o tempo todo, acreditamos que de alguma forma somos fracos no ministério. Quando tentamos agarrar os dons que Deus não nos deu, perdemos a calma e aumentamos nosso “tumulto espiritual”, desejando inquietamente “assumir buscas diferentes de” nossa própria tarefa. Porém, essa inquietação é “perigo mortal” afinal, “às vezes acontece que aquilo que alguns fazem corretamente, outros imitam erradamente”.43

Portanto, lembre-se: “é impossível que um único homem brilhe com destaque” em todos os dons dados na lista de Paulo. “Se alguém tenta buscar todos esses dons simultaneamente, necessariamente acontece que, ao correr atrás de todos, não recebe realmente nenhum deles, e nessa mudança e variedade constante, obtém-se perdas e não ganhos”.44 Noutras palavras, perdemos todo dom agradável que Deus já tinha para nós. Não enxergamos tais deleites porque eles já estão diante de nós.

3) Menor sempre é melhor do que maior, a não ser que, e somente no caso em que Deus nos impulsione.

Perdemos o descanso da alma quando acreditamos que o maior é sempre melhor. A serpente nos tenta a acreditar que alguns lugares são mais importantes que outros, que algumas pessoas são mais significantes que outras, e que nossas estratégias e nossos dons são respostas mais valiosas do que o sábio chamado de Deus.

Mas em Lucas 14.7–11, Jesus instrui aos que o seguem que busquem os lugares mais baixos à mesa, não os mais altos. Francis Schaeffer aponta que muitos pastores acreditam no oposto do que Jesus ensina. Em nosso modo de pensar, “somos tentados a dizer: ‘Tomarei o lugar mais alto porque isso me dará mais influência por Jesus Cristo”. Mas Jesus nos ensina que devemos tomar o lugar mais baixo, a não ser que o próprio Senhor nos desloque para o maior.45

Somos tentados a assumir algo “grande” a nossos olhos ou aos olhos de outros em nome de Deus, perdendo-o totalmente de vista. O lugar menor não somente nos torna capazes de tomar lugar à mesa com gratidão e humildade, como também nos capacita a sentarmo-nos diariamente à sua presença, comer do seu alimento, ouvir suas palavras, alegrarmo-nos nele. Quem iria querer deixar este lugar? Assumimos papéis maiores sem termos força para tanto, a não ser para desapontar as pessoas importantes que esperam por nós ali. Afinal de contas, se formos para a posição maior, faremos isso rebaixando-as para que nós e elas ainda possamos escutar a Deus. Então, tome o assento menor, o assento que lhe permite tal presença com Jesus, em vez daquele lugar que tiraria de você essa calma. Somente vá até lá se aquele que chama estiver indo com você. Somente vá até lá se você estiver pronto, não importa o tamanho do lugar, para permanecer em seu compromisso com os menores, com as coisas que geralmente são despercebidas em Jesus.

A maioria de nós não possui categoria para aquilo que acabei de dizer. Na maior parte de meu ministério pastoral, eu também não tinha. Precisamos de ajuda, e o socorro vem. Os pastores precisam do pobre homem sábio.

Entregadores esquecidos

Em Eclesiastes 9.13-16 lemos a história de um pobre homem sábio que certa vez libertou uma cidade pequena, com pequena população, de ser violentamente tomada por um rei arrogante. O rei e o seu exército atacaram, viram a pobreza daquele homem e o consideraram irrelevante, não prestando atenção a ele. Mas esse poderoso rei subestimara a sabedoria. O rei foi logrado pelo pobre homem sábio e foi derrotado. O pequeno grupo de pessoas e seu pequeno lugar no mundo foram salvos!

O que você supõe que aconteceu em seguida? Eu imaginei uma história de pobreza para riqueza, em que esse homem que livrou a cidade se tornou célebre. Mas nessa história bíblica, aquilo que muitos de nós tememos aconteceu mesmo. A cidade esqueceu-se dele. Esta não era uma plataforma para maior relevância. Não é necessário dizer que para mim este não foi um texto de teologia pastoral no começo de meu ministério. Você pode me culpar? Observe o obituário.

Toda sua vida, ele viveu com muito pouco, em um pequeno lugar, no meio de pequeno número de pessoas, fazendo um bem que ninguém lembrava.

Mas note o que Deus fala a respeito desse pobre homem sábio e sua vida de vitórias não lembradas: “melhor é a sabedoria do que a força, ainda que a sabedoria do pobre é desprezada, e as suas palavras não são ouvidas. As palavras dos sábios, ouvidas em silêncio, valem mais do que os gritos de quem governa entre tolos” (Ec 9.16–17). Leia de novo, sim?

O rei, como a loucura, era barulhento. Fazia alarde de sua fama (grande), posição (rei), recursos visíveis (levantou grandes baluartes), poder (força), e seguidores (sitiou a cidade) (Ec 9.14).

Em contraste, o homem que ouviu em silêncio, esse homem de Deus, era pobre. Um homem pobre só possui seu próprio e humilde ser a oferecer. Não há gritaria em sua aparência. Neste caso, sua pobreza era física, não emocional ou mental. Sua falta tinha a ver com bens materiais e aparências, não substância ou graça.

A obra pastoral requer presença. Quer sejamos introvertidos ou extrovertidos, rurais ou urbanos, de grandes igrejas ou igrejinhas pequenas, nossa tentação de resistir à presença humilde permanece a mesma. Somos propensos, erradamente, a seguir o grande governante nessa história sobre sabedoria do que seguir o pobre homem sábio. Nós nos apresentamos como quem conserta as coisas, sabe das coisas, que está em todo lugar e é rápido para curar. Mas o sábio de Eclesiastes nos redireciona. A pobreza do homem sábio significa que não podemos usá-lo por seu dinheiro, status, posição política, poder, realizações, ou pessoas que ele possa conhecer, as quais poderão ajudar com as conexões e rede de contatos com outras pessoas. Não há nada que esse homem possa nos oferecer no mundo, exceto seu testemunho de Deus, a integridade de seu caminho e a graça em sua vida. Essas duas diferentes maneiras de ser representam dois poderes contrastantes para nossa confiança — o poder da estultícia versus o poder da sabedoria. Sabedoria é encontrada na presença humilde do pobre homem. Assim também, o poder de Deus.

Agora eu me encontro pedindo a Deus nos domingos pela manhã: “Senhor, livra-me de orar e pregar nalguma espécie de voz de pregador. Salva-me para que eu ore e pregue com a voz que tu ouves nas vigílias da noite ou no dia em que clamo a ti e não há mais ninguém por perto.”

Também estou pedindo a Deus que me livre de achar que eu deva oferecer engano com minha presença, para que eu seja bemsucedido no ministério do evangelho. Peço a resistência de ser esquecido, até mesmo na igreja, por aqueles que não estavam buscando o que é humildemente sábio. Estou pedindo isso porque não tenho capacidade em mim mesmo de fazer qualquer dessas coisas. Mas Jesus tem. Embora ele fosse alguém de quem “os homens escondem o rosto”, ele carregava sobre si as nossas dores, levando nossas tristezas, sendo ferido por nossas transgressões, e moído por nossas iniquidades. Do nosso tolo ponto de vista, nós o “reputávamos por aflito, ferido de Deus e oprimido”, e buscávamos salvação em outro lugar. Mas o castigo que nos trouxe a paz estava realmente sobre ele o tempo todo, e por suas pisaduras somos sarados — mesmo aqueles entre nós que éramos como ovelhas desviadas do caminho (Is 53.3–6)! Jesus é o pobre homem sábio, afinal de contas, não é mesmo? O pobre que libertou aqueles que se esqueceram dele. Ele salvou nossa cidade no silêncio, e nos conclama a uma relevância de uma espécie diferente.

Solitude, presença hospitaleira, sabedoria

Quando constantemente interrompemos o que Deus está dizendo aos nossos corações, interrompemos a solitude — o senso de que estando a sós com Deus não somos solitários, mas estamos verdadeiramente com ele, da maneira como nós somos e como ele é. A solitude aguarda palavra e direção. Ela nos torna capazes de tratar de tudo que gira em nosso interior e de discernir entre a sua voz e a nossa, a sua voz e as vozes dos que nos cercam, para que respondamos a ele em vez de reagir ao pensamento e às emoções que vêm de primeira mão. A calma solitude do coração com Deus graciosamente nos transpõe de reações para respostas.

Acrescentamos ainda que, quando constantemente interrompemos o que Deus está dizendo aos que nos cercam, estamos interrompendo a hospitalidade. Por “hospitalidade”, não me refiro a pôr uma mesa e colocar comida gostosa sobre ela. Estou me referindo ao que essa figura indica. Somos capazes de dar boasvindas a outros seres humanos exatamente como eles são, mesmo quando eles creem ou dizem, e se pareçam ou cheirem diferente do que nós queremos que sejam. A hospitalidade nos transpõe graciosamente de sermos pessoas consumidoras para lhes dar boas-vindas, sem consertar, saber ou ser para eles aquilo que só Deus pode ser e fazer.

Quando constantemente interrompemos o tempo de Deus nas circunstâncias que nós e outros enfrentamos, estamos interrompendo a sabedoria. Sabedoria é “o temor do Senhor” (Pv 19.10), o reconhecimento de que Deus nos precede a cada momento e sua voz a respeito desse momento é verdadeira. O tempo de Deus, os seus valores, as coisas menores e em sua maior parte desprezadas, mas que importam, nem sempre nos parecem eficientes, grandes ou imediatas.

Nas nossas tentativas de fazer por Deus, sem esperar por ele, perdemos nossa solitude, nossa capacidade de tratar o próximo com hospitalidade, em vez de usá-lo como nossa plataforma ou nosso plano estratégico, e, com isso, perdemos a capacidade de esperar com discernimento pelo tempo e o modo de Deus. Tornamo nos reativos, consumidores dos outros, apressados, e tudo isso para Deus. Isso quer dizer que somos propensos também a ensinar tais qualidades aos outros.

Com Jesus, sozinho com o Pai

Não estou falando nada disso de modo trivial. Sou um homem ansioso. Surtos de pânico ou depressão são características minhas. Acrescente a isso minhas ambições, inquietação por qualquer coisa exceto o silêncio com Deus. Essas coisas assombram minha alma e encontram aplauso mal dirigido por todo lado que olho. Não se engane. Um coração calmo é uma graça dada e pela qual se luta com nosso Senhor. Ore comigo, está bem? Aqui, na desintoxicação resistente ao que significa finalmente aquietar-se. Lembre-se de seu Salvador. Ele sabe o que é ser desprezado, esvaziado, estar dolorosamente sozinho. Mas ele nos diz que não está sozinho. Mesmo no lugar de maior desolação, o Pai lhe fazia companhia (Jo 16.32). Assim, deixe que o velho pastor Richard Baxter reconte essa promessa de solitude para você também. Em Cristo, não importa por quanto barulho e gritaria, em nosso pecado, tenhamos sido consumidos, nós também podemos dizer, agora mesmo, pela graça: “Não estou sozinho porque o Pai está comigo”.46

Permita, então, que Baxter provoque sua fé em uma declaração. Talvez você sinta o terrível desconforto da saúde. Permita que eu lhe diga palavras bondosas. Neste momento, se você se encontra em um deserto em vez de em sua cidade preferida, numa prisão em vez de em um palácio, saiba o seguinte: quando estamos com o Pai, podemos dizer, sem sermos banais ou ingênuos: “Que este deserto seja a minha cidade, e essa prisão o meu palácio, enquanto eu habito a terra”. Enquanto eu tiver essa companhia com Deus isso “não é desvantagem”, ainda que “por olhos mortais eu não seja mais visto”.47

Assim, enquanto barulhentos reis fazem algazarra e as multidões aplaudem, a relevância fala humildemente no lugar desolado. Na quietude Deus é ouvido e começa o conserto.

S. João da Cruz, Noite escura da alma, (Dark Night of the Soul; Nova York, Doubleday, 1999). João Calvino, “Commentary on James 1:19–21,” em Commentaries on the Catholic Epistles, trad. John Owen, Christian Classics Ethereal Library, acessado em 28 de abril de 2015, http:// www.ccel.org ccel calvin /calcom45.vi.ii.vi.html?scrBook = Jas & scrCh = 1 & scrV = 19 #vi.ii.vi –p 9.1. Ver meu Preaching to a Post-Everything World: Crafting Biblical Sermons That Connect with Our Culture (Grand Rapids, MI: Baker, 2008); e Kindled Fire: How the Methods of C. H. Spurgeon Can Help Your Preaching (Ross-shire, UK: Mentor, 2006). Henri Nouwen, The Way of the Heart: Connecting with God Through Prayer, Wisdom, and Silence [O caminho do coração: conectando a Deus mediante a oração, sabedoria, e o silêncio], (New York: Ballantine, 1981), 48. Richard Foster, Celebration of Discipline: The Path to Spiritual Growth, (New York: Harper San Francisco, 1988), 86. Dietrich Bonhoeffer, Life Together: The Classic Exploration of Christian Community, (New York: Harper San Francisco, 1988), 84–85. Ibid., 85. William Stafford, “Malheur Before Dawn,” em Even in Quiet Places [Sentimentos maus antes da madrugada: Mesmo em lugares calmos], (Lew¬iston, ID: Confluence Press, 1996), 49. Matthew Henry, “A Discourse Concerning Meekness and Quietness of Spirit” [Discurso sobre mansidão e quietude de espírito], em The Complete Works of Matthew Henry, (Grand Rapids, MI: Baker, 1997), 133. Ibid., 109. Ibid., 134. Ibid. Ibid, 107. Ibid, 127. Michael A. Eaton, Ecclesiastes, Tyndale Old Testament Commentaries (Downers Grove, IL: InterVarsity, 2009), 150. Charles Spurgeon, Lectures to My Students (Grand Rapids, MI: Zondervan, 1954), 51. João Calvino, Institutas, trad, Ford Lewis Battles (Philadelphia: Westminster, 1960), 2.3.10. Ibid. João Cassiano, Conferences: The Classics of Western Spirituality [Conferências: os clássicos da espiritualidade occidental], trad. Colm Luibheid (New York: Paulist Press, 1985), 158. Ibid. Ibid. Francis Schaeffer, No Little People [Não há gente pequena], (Wheaton, IL: Crossway, 2003), 29 Richard Baxter, Converse with God in Solitude [Conversa com Deus na solidão], (New York: C. Wells, 1833), 153–54. Ibid., 100-101.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -13;

  -- 10 | Contemplando Deus (reaproveita a aula de ordem 14: preserva o progresso)
  update public.aulas
  set titulo = $t$10 | Contemplando Deus$t$,
      ordem = 14,
      conteudo =
$conteudo$Deus

Deus é um bem deleitoso.

– Thomas Watson

Quietos com Deus na presença de nossa solidão, crescemos na solitude do coração.

Calmos com Deus na presença das pessoas, damos boas-vindas hospitaleiras.

Tendo quietude com Deus na presença de nossas circunstâncias, damos a todos uma chance de sabedoria.

Um propósito diferente

Quando fazemos do estudo da quietude a nossa ambição, e propomos nos tornar pregadores que escutam entre as coisas que têm importância, surge um problema severo para nossa abordagem ao ministério. Se nosso propósito como pastores for realizar grandes coisas de maneira notória, o mais depressa possível, para que todos se mobilizem a fazer grandes coisas, consertando tudo, sabendo tudo e estando em todo lugar para Deus, esse nosso propósito e a quietude estão em contraposição.

Tenho necessidade de ver como o estudo da quietude e da vocação pastoral andam juntos. Encontrei ajuda em Isaías 50. Destaco o versículo 4:

O Senhor Deus me deu língua de eruditos, para que eu saiba dizer boa palavra ao cansado. Ele me desperta todas as manhãs, despertame o ouvido para que eu ouça como os eruditos.

Nosso tema do último capítulo volta aqui. Deus é quem toma a iniciativa. Ele nos desperta a cada dia. Ele nos ensina na solidão a falar a outros como quem foi ensinado. Falamos como aqueles que escutam diariamente a Deus. Mas por que este servo sofredor acorda e escuta no ritmo matutino a iniciativa de Deus? Ele nos diz claramente: “para que eu saiba dizer boa palavra ao cansado”.

Os cansados estão no fim da linha. Não lhes restam recursos que os sustentem. Do que precisam essas pessoas “cansadas” e “exaustas”? Saber que existe alguém que “faz forte ao cansado e multiplica as forças ao que não tem nenhum vigor... os que esperam no Senhor renovam as suas forças, sobem com asas como águias, correm e não se cansam, caminham e não se fatigam” (Is 40.28– 31).

Jesus cumpre e assume essa conversa. Como servo sofredor, aprendeu diariamente do Pai como fazê-lo, e o fez (Mt 11.28–30). A presença hospitaleira (sustentando aquele que está cansado) é possibilitada pela solitude do coração com Deus (a cada manhã ele me acorda).

O apóstolo Paulo aprendeu de Jesus esse mesmo propósito e habilidade da graça. “A vossa palavra seja sempre agradável, temperada com sal”, disse Paulo. Mas, por quê? “Para saberdes como deveis responder a cada um” (Cl 4.6). Falamos do que é bom “para edificação, conforme a necessidade”. Por quê? “Para que assim, transmita graça aos que a ouvem” (Ef 4.29).

Quando Jesus pergunta: “O que queres que eu faça?” Colocamos em nossa lista a pregação que também ouve. Pedimos para estudar a quietude. Agora, acrescentamos: “Ó Senhor, concede que, no fim de meus dias, eu tenha aprendido de ti como sustentar com a palavra aquele que está cansado”. O propósito da quietude com Deus é dar hospitaleiras boas-vindas àqueles que se encontram cansados.

Quando Jesus emprega todas as formas de silêncio e de sentenças, “jamais esmagará a cana quebrada, nem apagará a torcida que fumega” (Is 42.3). Em meus anseios por fazer grandes coisas para Deus eu não teria identificado esse propósito como meu. Tal propósito soa pequeno demais. É como dizer que quero ser pastor porque minha grande ambição na vida é aprender a ajudar uma pessoa comum em sua luta por encontrar a Deus. Dou risada com pesar e abano a cabeça. Diga-me: quando aconteceu que uma vida com o propósito de ajudar pessoas comuns em suas lutas ordinárias a encontrar a Deus tornou-se coisa demasiadamente pequena?

Um modo diferente de aprender

Para aprendermos a ter ambição por quietude, a fim de sustentar os cansados de modo hospitaleiro, teremos de ajustar ou expandir o modo como aprendemos.

Uma história antiga descreve um jovem que implorou a um velho sábio: “Ó mestre, por favor, seja meu professor”. A partir daquele momento o velho sábio convidou o moço jovem a acompanhá-lo por onde quer que fosse e em tudo quanto fazia. Depois de algum tempo, o jovem ficou impaciente, pois embora o mestre recebesse muitos visitantes e frequentemente lhes desse conselho, o velho sábio nunca falou da mesma maneira para o jovem. Finalmente, o jovem não suportou mais isso. Gritou: “Mestre, dei tudo para seguir o senhor! Por que o Senhor não me ensina como ensina aos outros?”

O velho sábio escutou com compaixão e respondeu: “Você não sabe que em todo momento que você gasta comigo tenho lhe oferecido o meu ensino? Tudo que faço e digo, quer em público, quer em particular, está claramente diante de você.”

O jovem permaneceu frustrado e confuso. Depois de um momento, de repente, o velho sábio gritou: “Diferente de meus outros alunos, o que você recebe de mim, recebe diretamente!”

Naquele momento, foram abertos os olhos e o coração do jovem.48

Na história, um dos seguidores de Jesus teve experiência similar. Jesus disse a Filipe e aos outros que eles conheciam Deus Pai, e o viram. Confuso, Filipe disse a Jesus: “Senhor, mostra-nos o Pai, e isso nos basta”.

Jesus respondeu:

Há tanto tempo estou convosco, e não me tens conhecido? Quem me vê a mim vê o Pai; como dizes tu: Mostra-nos o Pai? Não crês que eu estou no Pai e que o Pai está em mim? As palavras que eu vos digo não as digo por mim mesmo; mas o Pai, que permanece em mim, faz as suas obras. Crede-me que estou no Pai, e o Pai, em mim; crede ao menos por causa das mesmas obras (Jo 14.4–9).

É como se Jesus dissesse, em resposta: “Que outras de minhas palavras, obras e modo de ser vocês precisam para aprender, que eu já não tenha oferecido ao dar-lhes acesso íntimo à minha vida diária?”

É quase como se Filipe só soubesse prestar atenção às multidões que se ajuntavam, ao ensino público e às palavras diretas. Filipe não sabia que era necessário discernir o Pai também nas sombras surgidas devido a coisas maiores e mais importantes. Nas sombras que via das coisas pequenas de Jesus, e em sua maior parte menos atraentes.

Se quiser aprender quietude, você terá de estar atento às graças implícitas e entediantes que transbordam de vida bem à nossa frente. Pregadores que escutam aprendem a contemplar.

Aprendendo novamente a contemplar

O verbo contemplar é usado numerosas vezes nas Escrituras. Contemplar é parar tudo mais por um momento a fim de fixar completa atenção sobre alguma coisa. Meditativamente, demoramos nessa situação para que a partir da contemplação silenciosa possamos discernir a relação de Deus com tal situação e obter dele o significado.

Os sábios, como o pobre sábio do nosso último capítulo, aprendiam a contemplar a criação e as criaturas de Deus, incluindo as condições da criação (Pv 24.31), os caminhos das pessoas em seu pecado (Pv 7.10), as dores das pessoas contra as quais outros pecaram (Ec 4.1), e as operações interiores do nosso coração diante de Deus (Pv 24.12).

Essa comunidade de sabedoria também buscou contemplar a Deus em sua providência, incluindo as obras de Deus na história (Sl 46.8), a boa provisão de Deus na vida comum (Ec 5.18), a verdade de algo bom que está sendo vivido em nossa experiência (Sl 133.1), a boa presença de Deus em nosso favor a cada momento (Sl 33.18) e a promessa do auxílio de Deus (Sl 54.4).49 Por todos os Evangelhos, Jesus chama-nos a contemplar desses modos sábios.

Quando fazemos isso, aquilo que antes era confuso para nós por causa da aparente proximidade, pequenez e simplicidade, entra graciosamente em foco entre as coisas que têm importância. Contemplar a Deus em todas essas mudanças diárias muda nosso modo de aprender e altera aquilo que olhamos. Começamos a escutar e olhar as pessoas de modo a ajudá-las a encontrar o que de outro modo seria a “não aparente presença de Deus”.50 A contemplação nos leva a dizer, pouco a pouco, que pela graça

Agora estão abertos os ouvidos de meus ouvidos. Agora abertos estão

os olhos dos meus olhos.51

O trabalho pastoral contemplativo, sob essa perspectiva, arranja e trata todas as coisas do ponto de vista do temor do Senhor, de modo a contemplar a Deus com reverência e gratidão como nosso criador, governador, o único que cura e o verdadeiro intérprete de qualquer coisa que conheçamos com respeito a tudo que existe, em qualquer lugar e tempo que estejamos.

Em tudo isso, estamos dizendo basicamente duas coisas. (1) “O principal cuidado e solicitude de nossa vida é buscar a Deus, aspirar por ele com todos os afetos de nosso coração, e não encontrar repouso em nenhum outro lugar senão somente nele”;52 e (2) as pessoas precisam de sua ajuda pastoral para encontrar a Deus, para que elas também encontrem nele seu descanso.

Contemplar muda a forma de estarmos

com as pessoas

Em ocasiões de crise, não se pode evitar a rapidez, mas, como norma diária, a contemplação nos conduzirá a fazer uma pausa entre reuniões (e telefonemas e e-mails) para escutar e orar. Como isso lhe parece?

Para começar, você confessa que essa reunião não poderá consertar todas as coisas, não possui todo conhecimento, não consegue ser tudo para uma pessoa, nem oferece alívio completo e final. É só Jesus que mantém juntas e dá subsistência a todas essas coisas (Cl 1.17).

Em seguida, você lembra que Deus precedeu aqueles que você encontrará. Ele é ativo com as pessoas com as quais você vai se encontrar (quer elas saibam, quer não) muito antes delas chegarem em seu gabinete, e a atividade divina nelas continua depois que forem embora. Isso nos diz pelo menos duas coisas. (1) O encontro dos outros com Deus não começa nem termina quando você se encontra com eles. (2) Consequentemente, você não é a parte mais central ou importante dessa reunião. Deus é. Deus está permitindo que você assista junto a outros que ele amou e seguiu por todos os outros dias.

Assim, agora, antes das reuniões, estou aprendendo a pedir que Deus “abra portas” e me dê graça para saber o que dizer se alguma coisa deve ser dita (Cl 4.2–6). Após a reunião, também estou aprendendo a fazer uma pausa para oração. Sei que a atividade diabólica se junta aos cuidados e pesares do mundo, tentando sufocar qualquer coisa boa que tenha sido dita (Mt 13.19–22).

Durante a própria reunião há também “pausas entre as sentenças e os parágrafos”, às vezes desajeitadas. Afinal, como foi Deus que nos precedeu, eu não devo tomar a frente desse encontro, pelo menos não em primeira mão, exceto para convidar-nos a escutar enquanto conversamos. Assim como é estultícia um paramédico chegar em cena sem verificar diversos sinais antes de correr para uma ação prescritiva, o sábio ou servo sofredor contemplativo não propõe respostas sem primeiro ter escutado, questionado e meditado. Nós escutamos palavras e pausas. Não temos intenção de deixar nenhuma delas cair ao chão duro.53 Pelo menos ainda não. Nós as ajuntamos todas, como se fosse para o Senhor, que está presente. Pedimos que ele ponha essas palavras em ordem e faça disso tudo o que ele quiser.

Então, poderia dizer: “Eu já o ouvi dizer isso antes”. “Um momento atrás, também o ouvi expressar outra coisa”, acrescento. Então, faço uma pergunta ao levantar esses dois fios de sentenças. Agora estou escutando tanto quanto eles estão ouvindo. “Já notou como essas suas sentenças parecem conectadas (ou são desconexas)? O que você supõe que Deus quer lhe mostrar acerca dele em tudo isso?”

Ao nos tornar mais atentos a esses fios, uma passagem da Palavra de Deus, ou secundariamente, um apoio à Palavra de Deus, uma analogia da criação de Deus, uma cena ou história sobre a providência de Deus poderá vir à mente. Isso não significa que estamos certos nem que tenhamos resolvido a questão. Ainda não sabemos se esse versículo, analogia ou cenário é o certo para esse momento, se é nascido de nosso próprio engano ou iluminado de forma maravilhosa para que, por seu Espírito, nosso caminho em Jesus seja clareado.

Talvez um longo e desajeitado silêncio resulte dessa pergunta. Estou aprendendo a resistir à tentação de encher todos esses silêncios. Em vez disso, começo a orar internamente e esperar. Eles encontram suas palavras. Eu as ouço. Agora as sentenças vêm mais livres. Ele é aquele a quem buscamos, afinal. Ali, em comunidade, ancorados por sua Palavra, escutando em meio aos silêncios, aguardando, pedindo, buscando o Cristo sempre presente, muitas vezes experimentamos o encontro com ele! Paulo afirma “para buscarem a Deus se, porventura, tateando, o possam achar, bem que não está longe de cada um de nós” (At 17.27).

Não sou bom nisso, mas recentes comentários me instigam a não desistir. “Fiquei surpreso por esse encontro”, ele me disse. Tínhamos acabado de gastar uma hora e quinze minutos almoçando juntos.

“Você não olhou para seu relógio nenhuma só vez”, ele continuou. “Tenho tentado falar do meu coração rapidamente. Calculava que você iria me apressar ou então ficar sentado impacientemente comigo, com pressa de ir a seu próximo encontro”.

O que ele disse em seguida me comoveu. “Senti que estava sendo ouvido com um ser humano”, ele disse. Em seguida parou e sorriu. “Sabe, quase nunca tinha me sentido desse jeito. Muito obrigado”.

Pode ser que nem todo encontro seja assim. Às vezes, momentos de crise requerem respostas de sala de emergência. Nem todos que se encontraram comigo podem dizer o que esse homem disse. Tomar o tempo para resolver com oração, por amor de escutar pastoralmente e contemplar a Deus enquanto nos encontramos com outro ser humano não é natural para mim. Mas é natural para aquele a quem seguimos. Como embaixadores e pessoas que podem discernir, entramos na história dos outros dizendo: “Vá mais devagar. Olhe aqui, escute; Deus está lhe mostrando quem ele é.” As sábias palavras de Deus, ouvidas no silêncio, livram a ambos.

Contemplar muda o jeito que oramos

pelos outros

Fazer essa espécie de transição tem sido mais difícil do que eu pensava, mas não porque o chamado para orar e escutar não esteja claro. “E, quanto a nós, nos consagraremos à oração e ao ministério da palavra” (At 6.4), disseram com clareza os apóstolos. Dedicar nos é fazer com que algo seja nossa responsabilidade, a tarefa em volta da qual gira tudo mais. Não tem nada confuso quanto a isso.

Mas bem cedo ainda, pensei nessa obra pastoral da oração e da Palavra principalmente nas suas formas mais visíveis e públicas. Imaginava as orações públicas que eu faria domingo pela manhã, em frente ao ajuntamento da multidão prestes a adorar (2Tm 2.1), ou em como fez Jesus quando orou de modo público e sacerdotal (Jo 17.1–26). Pensava na palavra em termos dos sermões que pregaria. Não entendia que a vocação do pastor com a oração, a Palavra e seu cuidado muitas vezes é invisível, escondida com Jesus, em momentos um a um ou de pequenos grupos ocultados dos olhos de nossa congregação, procurando contemplar a Deus nas providências individuais de um ser humano comum.

Assim, eu subestimava em muito onde uma vocação de oração, Palavra e de entrar nas dúvidas e perguntas de outro ser humano pode nos conduzir. Debaixo de uma ameixeira ou encharcado de chuva ao lado da sepultura de uma criança; em um estacionamento ou numa varanda de uma casa, num banheiro de deficiente ou num tribunal de sofrimento; em um hospital de desconhecidos ou num bar. Eu não imaginava um elevador ou ao lado de uma lareira, num salão de festas ou numa rua de tumultos e protestos. Ou em pé ao lado de carros com janelas arrebentadas por ladrões, quebradas como as mentes daqueles da ala psiquiátrica que procuravam a minha mão. É aqui que leva a contemplação. Ele nos conduz aos lugares desconhecidos pelo mundo, por amor de gente desconhecida ao mundo, para que saibamos que Deus está conosco, mesmo que seja eu. Então, sinceramente em oração, “lutamos para descer às profundezas do coração e de lá buscamos a ele, e isso não somente com a língua ou garganta”, mas com nosso coração, do jeito que estiver.54

Tomamos esse trabalho de contemplação, feito ali pela providência daqueles a quem servimos, de volta conosco para nosso escritório. Aprendemos a buscar a Deus por aqueles que servimos, mesmo quando não estamos com eles. Contemplamos o quanto são amados por Deus. Como a própria Bíblia está cheia de orações,55

talvez ajuntemos esses trechos das Escrituras, tomando o nosso diretório da igreja. Andando pelo templo vazio, pela vizinhança ou no silêncio sob a luz de vela numa manhã gelada, lemos uma sentença de uma oração dada na Bíblia e voltamos essa sentença para louvor e petição em favor da família ou do indivíduo.

Enquanto fazemos essa obra de contemplação pela oração, o telefone continua a tocar, e-mails ainda chegam, as exigências não param, e quase todas soam mais urgentes e promissoras de minha produtividade do que isso. Afinal de contas, “dirigir a igreja”, por mais importante que seja, parece mais produtivo e afirmador do que simples contemplação silenciosa. Mas tal sentimento mente para nós. Os dois tipos de trabalho são importantes.

Assim, fazemos nossos salmos ao Senhor, não de modo autoritário para todo o povo de Deus como fez o Rei Davi, mas como aluno em sua escola de oração, clamando nossas orações em resposta ao que nos confronta a cada dia.56 Esse tipo de salmo pode às vezes parecer uma confusão.

Batem à porta de meu escritório. Levanto do chão de onde estive ajoelhado em oração, encostado no fundo da cadeira de meu Papaw, aquela em que ele me segurava quando eu era menino. Pego um lencinho de papel, assoo o nariz, e abro a porta. “Ei! Entra”, digo. Então acrescento: “Não ligue para mim. Eu estava apenas chorando, só isso”.

“Ah”, ele diz. “Você está bem? Devo voltar mais tarde?” Quero dizer sim. Tenho medo de ser conhecido como eu sou. Mas, pela graça, estou aprendendo a escolher a fé e dizer: “Ah, não se preocupe. Algumas lágrimas valem à pena chorar, não sabe? Entre. Estou ansioso por compartilhar um tempo com você”.

Essas cenas são aves raras na minha vida — incomuns de se ver, mas belíssimas quando vistas.

Contemplar muda o modo que nos encontramos com Deus

Às vezes acendo uma vela. Encosto contra a parede do meu escritório ou sento na poltrona de couro gasta do meu Papaw. Talvez seja umas duas horas da tarde. Leio uma promessa da Escritura — “Ele cuida de vós” (1Pe 5.7). Dou graças pelo que diz. Confio na promessa, o que quer dizer que abro meu coração para ela. A Palavra de Deus ilumina meu caminho. É minha verdadeira lâmpada. Em seguida digo algo como: “Aqui estou, Senhor. Tu és meu amor, meu deleite. Quero te conhecer e lançar sobre ti os meus cuidados. Quero confiar que tu cuidas de mim e daqueles a quem amo e sirvo”.

Então, tento aguardar sem palavras por um momento na presença daquele que me ama e me enxerga em segredo. Mas, nos primeiros poucos minutos, a minha mente não está silente. Os pensamentos e sentimentos que passaram sem ser notados por entre o tagarelar do dia agarram a oportunidade e surgem altos para a superfície enquanto eu tento me acalmar. A primeira rodada desses pensamentos é como a espuma do refrigerante ou a nata no leite. Tiramos para obter o que está por baixo. Assim, tomo cada pensamento que procura angariar minha atenção, não importa o que seja, tolo ou terrível, comum ou orientado para o cumprimento de tarefas, biblicamente errado ou teologicamente sadio, eu o transformo em oração, dizendo de cada um: “Ouço-me neste pensamento, Senhor, e o trago a ti. Deixo-o contigo”.

Ao levar cada pensamento a ele, estou fazendo o que Pedro ordenou: “lançando sobre ele todos os vossos cuidados, porque ele cuida de vós” (1Pe 5.7). Lançar nossos cuidados é como enfiar a mão numa pilha de roupa misturada para lavar, separando cada pano, e colocando de volta cada peça onde deve ser posta. Ou vasculhar uma velha garagem cheia de ferramentas espalhadas por todo lado. Uma a uma, eu pego na mão cada ferramenta e a entrego a Deus, e ele a coloca onde ela deve ser guardada. Conforme disse Calvino, essa oração é como “uma comunicação entre nós e Deus, onde expomos a ele nossos desejos, nossas alegrias, nossos suspiros, em todos os pensamentos de nosso coração.”57

Ora, o primeiro estouro de pensamento foi limpo. É importante saber que muitas vezes, após limpar a espuma e antes de beber profundamente em oração a sós com Deus, o tédio, a mente inquieta, sentimentos de tempo desperdiçado, e sentimentos de ansiedade corroboram numa gangue que procura nos assaltar, fazer qualquer coisa diferente do que estamos fazendo. Eles nos picam como mosquitos, e queremos nos levantar, apagar a luz e fazer qualquer coisa, menos isso.

Ao invés disso, eu o convido a permanecer firme. Preciso que você também insista que eu faça o mesmo. Vamos enfrentar nossos estouros ou nossas almas pegajosas numa desintoxicação deliberada. Com a bondade e misericórdia de Jesus diante de nós, olhemos novamente para o livro aberto à luz de vela; permitamos que entre a mentoria do homem sábio.

Conversas imaginárias

Contemplar a Deus em oração nos oferece uma espécie de resistência às conversas imaginárias também. Esaú se confortou e consolou com o pensamento de matar seu irmão Jacó (Gn 27.42). Ele imaginou a cena repetidas vezes, e essa conversa imaginária ofereceu um console torto para seu ser interior.58

Sabemos que estamos em uma conversa imaginária quando ferimos e falamos a nós mesmos sobre outra pessoa, usando a segunda voz e não a terceira presença de Deus, como se o amigo que o traiu estivesse ali de pé ao seu lado. Ele passa da linguagem de terceira-pessoa (ele) à de segunda pessoa (tu):

Com efeito, não é inimigo o que me afronta; se o fosse, eu o suportaria; nem é o que me odeia quem se exalta contra mim, pois dele eu me esconderia; mas és tu, homem meu igual, meu companheiro e meu íntimo amigo. Juntos andávamos, juntos nos entretínhamos e íamos com a multidão à Casa de Deus (Sl 55.12–14).

O que fazemos quando nos encontramos falando constantemente com uma pessoa, de formas imaginárias, ao invés de falar diretamente com Deus sobre nossa dor? Paramos em meio à sentença ou damos um basta ao e-mail que estávamos prestes a mandar. Voltamo-nos ao Senhor que está presente e fazemos de nossa ansiedade uma conversa em tempo real com ele. Pode ser que façamos isso cinquenta vezes num dia. Podemos esperar e nem mandar aquele e-mail agora. Não importa. Jesus está conosco, fazendo-nos aprendizes que voltam todas as ansiedades diretamente ao Pai. Foi esse o seu jeito também (Hb 5.7).

Contemplar muda nossa definição de uma hora silenciosa

Sugiro que estar a sós com Deus por uma hora requer uma mudança de metáfora. Uma hora de silêncio semelhante a uma sala de aula tem o seu lugar. Nós a utilizamos para obter mais informação da Bíblia, e isso é bom. Sem a informação correta da Bíblia nosso caminho não tem luz.

Mas a solitude do coração no deserto nos relembra de que “está escrito” não era questão de informação mental para Jesus, e sim a fonte pela qual ele manteve intacta a sua identidade. Ele foi às palavras do Pai porque o diabo as desprezava. O diabo não descartava a existência, a verdade ou a utilidade da Palavra de Deus. O diabo descartava o amor do Pai pelo Filho contido nelas. “Se és filho de Deus”, o diabo zombou. Você não é filho do mesmo modo que Jesus. Mas não se engane, você é um amado filho de Deus em Cristo — real e verdadeiro. Você luta contra um inimigo que quer causar dúvida quanto a quem você é para o Pai.

Assim, siga a Jesus para o deserto como estrutura de referência para a sua hora silenciosa. Escreva ou anote todas as razões armazenadas em seu pensamento quanto a não ser mais amado por Deus, ser deserdado como filho. Olhe para o Pai por meio de sua Palavra, contemplando seu amor por você em Jesus. Nesse tempo silencioso você luta contra as mentiras quanto a ser amado. Coloca sua confiança nas promessas de Deus.

Também fale abertamente ao Pai sobre o seu desejo de estar em todo lugar para todos. Afinal de contas, para vir ao Pai pela contemplação das suas palavras, Jesus teve de confiar ao Pai as opiniões de outros, e você, em seu pequeno modo, terá de fazer o mesmo. Desaparecer por quarenta dias no deserto naquele momento não era algo sem sentido para Jesus. As pessoas comentariam. Sem telefone ou computador, eles ficavam se indagando, e ele não tentou gerenciar o desconforto deles. Jesus não estava em todo lugar para todos, e sim, com o Pai, no deserto, com a Palavra.

Essa coisa toda de deserto era também vagarosa: “quarenta dias sendo tentado pelo diabo” (Lc 4.2). Todo osso e músculo do corpo viciado no imediatismo vai retorcer e doer. Nenhuma resposta vem rapidamente aqui. Um dia terminado no deserto pode ser seguido por outro e ainda outro mais. Nesse tempo de hora silenciosa você leva seus anseios pelo imediato ao Pai, para ser curado.

Jesus poderia consertar sua fome se apenas tomasse o pão (Lc 4.4). Jesus poderia provar que era Filho de Deus se apenas se lançasse para baixo (Lc 4.6). Ele poderia ser o rei celebridade e possuir todas as coisas e habitar todo lugar (Lc 4.5). Jesus peneira essas feias acusações, tentações, memórias, temores e mentiras, detecta a voz do Pai e fica de pé ali, entre as sentenças. “Está escrito”, ele afirma. Por este ato, Jesus faz o que não conseguimos, para que também possamos separar as coisas no silêncio, quando as sentenças afirmarem tudo diabólico, bestial, e estéril, tentando nos dilacerar e desviar da verdade. Esta é uma hora silenciosa de diferente espécie, de pensamentos não falados e emoções que não ventilamos por causa de nossa tentativa de rapidez em vez de escutar. Mais uma vez, aprendemos nesse tempo de silêncio no deserto que somos amados. Dali voltamos, “no poder do Espirito”, ao lugar que nos foi dado (Lc 4.14–15).

Contemplar muda nosso jeito de ir à

Palavra de Deus

Escrevi extensamente sobre o ministério da Palavra em outro lugar.59 Aqui, menciono apenas três implicações para a contemplação de Deus quando nos aproximamos de sua Palavra. Primeiro, o velho pastor e professor presbiteriano Archibald Alexander descreve nosso estudo da Bíblia como um estudo que espera receber a impressão que Deus intencionava que suas palavras tivessem sobre nossa alma. “Não é o crítico, o teólogo especulativo ou polêmico, o mais propenso a receber a impressão certa”, diz Alexander, “mas o cristão humilde, simples de coração, cristão contemplativo”.60

De acordo com Alexander, quer sejamos o “mais culto crítico” ou o “mais profundo teólogo”, temos de nos aproximar da Bíblia como quem “aprende aos pés de Jesus com o espírito de uma criança”.61

Somos pupilos de Maria, aprendendo dela a escolher a Jesus como porção, escutando e aprendendo a seus pés, não importa quão importante nosso mundo eclesiástico diga que somos (Lc 10.39–42). Quando a tentação de ser tudo, nos apreende com a velocidade, aos poucos nos voltamos à Bíblia simplesmente como caixa de ferramentas para fazer funcionar nossos programas ou para tornar os nossos sermões aplaudíveis, em vez de serem iguais às palavras do nosso Amado, as quais ajudam qualquer um a encontrar o caminho para casa.

Mas Deus nos perdoa. Que ele nos recupere mais uma vez, para que aprendamos novamente a abrir a Bíblia não como “livro comum, com coração comum e irreverente; mas no pavor e amor por Deus, seu autor”.62 Abrimos o livro não para contemplar o livro, mas aquele que é revelado a nós na Palavra. Logo, a Bíblia se torna novamente para nós como o destilar dos favos, mais doce do que qualquer lucro material ou status deste mundo (Sl 19.10).

Segundo, precisamos da ajuda um do outro para nos lembrar de que somos como o eunuco etíope, que diz, quando nossas Bíblias estão abertas: Como entenderei se não tenho quem me guie? (At 8.31). Dependemos uns dos outros na comunidade, como esse etíope dependeu Filipe. Amamos os livros e comentários, podcasts e conversas que nos ajudem a entender as palavras de Deus.

Contudo, não devemos nos esquecer que enquanto é uma honra para um autor ter pessoas que abram o seu livro, o citem detalhadamente, e passem horas falando a outros sobre o que pensam ser o significado do autor, seria estranho, até mesmo rude, se toda essa atividade ocorresse enquanto o autor estivesse presente na sala e ninguém falasse uma só palavra com ele e nem olhasse em sua direção. Contemplar a Deus em sua Palavra é perguntar diretamente a ele qual seu significado. Vem à mente uma parábola do deserto:

Os irmãos vieram a Abba Antônio e apresentaram-lhe uma passagem de Levíticos. O velho saiu para o deserto, seguido secretamente por Abba Ammonas, que sabia ser este o seu costume. Abba Antônio retirou-se para longe e ficou ali orando, clamando em alta voz contemplativa: “Deus, envie Moisés, para me fazer entender estes

dizeres”.63

Richard Baxter disse-o claramente: “Antes e depois de ler a Escritura, ore sinceramente para o Espírito que a inspirou exponha a Bíblia a você”.64 A sabedoria de um velho pastor vem também à mente: “Se aspiramos sinceramente a uma autêntica contemplação de Deus, eu digo que temos de ir para a palavra”.65

Contemplar o fruto de um sonho

Mas, às vezes, estações de severas provações tornam essa contemplação de Deus em sua Palavra impossível. Não conseguimos encontrá-lo. Mas ele nos encontra. Um raro cenário de meu próprio deserto estéril vem à mente. Eu havia colapsado em uma pilha de orações feias, entre lencinhos amassados sobre o chão da sala. Caí no sono e sonhei.

No sonho, deveria pregar, mas minha mente estava tão exausta que não conseguia achar um texto bíblico. As pessoas que esperavam pelo sermão eram sensíveis à minha condição desalinhada. Cada um me chamava ao Salmo 138. Alguém veio até o púlpito e pacientemente ajudou-me a encontrá-lo. Esta cena parecia se repetir, de modo que, quando acordei, sentia como se tivesse sonhado isso a noite inteira. As palavras do “Salmo 138” acenderam a luz do sol em meu coração.

Sentei-me no chão da sala de estar e tomei minha Bíblia. Já estava aberta e amontoada pelos lencinhos usados na noite anterior.

Nas últimas semanas eu havia chorado como quem estivesse só em um cômodo vazio, caindo mortas ao chão as minhas palavras, sem ninguém a não ser os corvos para escolher entre suas carcaças. Contudo, cada palavra agora deixava sua calorosa impressão — como se ele fosse meu e eu dele, e de alguma forma as suas palavras naquela página fossem realmente presentes de amor por mim. Chorei ao ler:

Render-te-ei graças...

te cantarei louvores...

No dia em que eu clamei, tu me acudiste,

e alentaste a força de minha alma.

O Senhor é excelso, contudo, atenta para os humildes;

os soberbos, ele os conhece de longe.

Se ando em meio à tribulação, tu me refazes a vida;

estendes a mão contra a ira dos meus inimigos;

a tua destra me salva.

O que a mim me concerne o Senhor levará a bom termo;

a tua misericórdia, ó Senhor, dura para sempre;

não desampares as obras das tuas mãos. (Salmo 138)

Aquele dia todo eu guardei essa porção da Escritura como uma carta de amor. Acariciei cada palavra, sentindo os ternos beijos de verdadeiro amor sobre os lábios, rosto e testa da minha alma. Sentime criança acolhida nos braços fortes do meu Pai, de coração alegre, que proveria por mim e promoveria a minha causa, mesmo correndo risco próprio. Nenhuma das minhas circunstâncias havia mudado. Destroços dignos de lágrimas e calúnia ainda latiam como os cachorros do vizinho debaixo das minhas janelas e portas. Mas, eu não estava só. O Senhor estava perto. Pela primeira vez em muito tempo, eu sabia que isso era verdade. Eu gostaria que você visse não tanto o sonho em si, mas o fruto dele. Foi-me dada uma palavra para sustentar-me em meu cansaço.

Contemplando a Deus em nossa sala de estar

A primeira vez que tive contato com essa obra de contemplar em oração, na Palavra, e no cuidado das coisas comuns, eu não percebi. Estava segurando um ursinho de pelúcia. “Vamos fazer nossas orações”, disse Mamaw ao sentar-se ao lado de minha cama. Eu fechei os olhos e juntei as mãos.

“Agora deito para dormir”, eu disse. “Peço ao Senhor que guarde minha alma. Se eu morrer sem acordar, peço a ti, Senhor, para minha alma levar”. Eu era criança e orava como uma criança.

Mas, trinta anos mais tarde, havia na casa de Mamaw e Papaw um descanso restaurador. Passava a noite tendo em mente a Mamaw. “Se eu morrer sem acordar” não era mais uma distante oração de um menino com seu ursinho de pelúcia.

“Vamos orar”, sugeri. Sentamos sobre velhas cadeiras. Mamaw parecia inquieta.

“Está tudo bem?”, eu lhe perguntei. Ela parecia assustada e disse, como prestes a confessar-me um pecado ou acontecimento terrível: “Hoje eu orei por mim mesma”. Os lábios tremiam. Os olhos marejavam.

“Você acha que isso está certo?”, perguntou. “Acha que Deus aceita que eu ore por mim mesma hoje?”

Como neto de Mamaw, isso me tocou profunda e ternamente. Em todos esses anos que orava pelos outros, Mamaw jamais arriscou fazer uma oração em seu próprio favor? Eu estava atônito de amor por ela.

Mas como um homem, um pastor, sentia-me empolgado e fortalecido para me inclinar, olhar direto nos seus olhos e sussurrar palavras de graça e direção espiritual à sua terna consciência.

“Sim, Mamaw, está bem em Jesus você orar por você mesma. O Senhor que a ama anseia ouvir as suas orações, mesmo as que têm a ver com você. Pode lançar todos os seus cuidados pessoais sobre ele porque ele tem cuidado de você.”

Ela acenou com a cabeça e nós choramos, sorrimos e contemplamos.

Depois do enterro de mamaw, recebi de presente a sua Bíblia. Ela está em minha mesa enquanto escrevo.

Ela deixou marcadores de livro em diversos lugares. O marcador da casa de repouso está em João 17. O cabeçalho da Bíblia de estudo diz: “Jesus ora por si mesmo”. Mamaw marcou com um círculo esse cabeçalho.

Outro marcador está em Isaías 53, que prediz Jesus como homem de dores. Mamaw destacou com amarelo todo o capítulo.

Outro marcador está no Salmo 130. “Das profundezas clamo a ti, Senhor. Escuta, Senhor, a minha voz; estejam alertas os teus ouvidos às minhas súplicas” (vv. 1–2).

Em minha memória eu a vejo ali, à porta da morte, perguntando o que significa agradar o seu Salvador com a oração. Percebo agora que ela não estava perguntando só para mim, mas perguntava sinceramente a Deus, indo de promessa em promessa na sua Palavra. Quem sabe os remédios, a fadiga, o câncer e o medo faziam mais difícil de ouvir a voz de amor, mais difícil de contemplar. Assim, nesta oração e Palavra trabalhando juntos, penso sobre o lugar onde estávamos — numa sala com cheiro de casa de repouso de idosos, balançando em velhas cadeiras, com uma história de um longo amor, necessitando localizarmos juntos a Deus.

Penso comigo mesmo: Isto é um dom, esse momento pequeno, quase despercebido entre as coisas importantes. Um dom, digo eu, porque Deus estava ali para ser encontrado, e foi achado. Adaptado de Henri Nouwen, Spiritual Direction: Wisdom for the Long Walk of Faith [Direção espiritual: Sabedoria para a longa caminhada de fé], (New York: Harper Collins, 2006), 4. A contemplação também pode pedir a Deus que pause e cresça em atenção fixa a um anseio de nosso coração ou um compromisso ou uma condição de nossa vida (Sl 17.2; 39.5; 84.9; 119.40). M. Craig Barnes, The Pastor as Minor Poet: Texts and Subtexts in the Ministerial Life [O pastor como poeta menor: textos e assuntos na vida ministerial], (Grand Rapids, MI: Eerdmans, 2009), 22 E. E. Cummings, “Walking on Water” [Andando sobre a água] João Calvino, Instruction in Faith [Instrução na fé] (Louisville, KY: Westminster, 1992), 21 Leighton Ford, “Wholly and Holy Listening,” [Escutando santamente e inteiramente] trabalho não publicado, Mentoring Gathering [Ajuntamento de mentoria], (Maio 2014), 5. Calvino, Instrução na fé, 57. Para uma lista completa das orações na Bíblia, veja, de Herbert Lockyer, All the Prayers of the Bible http:// gospelpedlar.com articles Christian %20Life /Prayer.pdf. Veja, por exemplo, os Salmos 3; 7; 18; 30; 34; 52; 54; 56; 57; 59; 63. Calvino, Instrução na fé, 57 (ênfase acrescentada). Mesmo que a conversa imaginária tenha em mente um fim positivo, como a conversa imaginada entre o filho pródigo com seu pai, nossas conversas unilaterais são pobres substitutas para fazer salmos. Faz-nos adivinhar erradamente como o outro poderá responder. Inadvertidamente, nós projetamos sobre eles aquilo que não é verdadeiro. O filho, por exemplo, só podia imaginar o desdém do pai, o não ser mais filho e sim, escravo (Lucas 15.18–19). Zack Eswine, Preaching to a Post-Everything World [Pregando em um mundo pós-tudo], (Grand Rapids, MI: Baker, 2008) e Kindled Fire: How the Preaching Methods of C. H. Spurgeon Can Help Your Preaching [Fogo ateado: Como os métodos de pregação de C.H. Spurgeon podem ajudar na sua pregação], (Ross-shire, Reino Unido: Christian Focus, 2003). Archibald Alexander, Thoughts on Religious Experience [Pensamentos sobre a experiêcia religiosa], (1844; repr. Edinburgh: Banner of Truth, 1989), 162.

Ibid. Richard Baxter, A Christian Directory, vol. 1, Christian Ethics, (1846; repr. Morgan, PA: Soli Deo Gloria, 1996), 477. The Sayings of the Desert Fathers, [Os dizeres dos Pais do deserto], trad. Benedicta Ward, (Kalamazoo, MI: Cistercian, 1984), 7. Baxter, A Christian Directory, 478. João Calvino, Institutas, trad. Ford Lewis Battles (Philadelphia: Westminster, 1960), 1.6.3.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -14;

  -- 11 | Encontrando o nosso ritmo (reaproveita a aula de ordem 15: preserva o progresso)
  update public.aulas
  set titulo = $t$11 | Encontrando o nosso ritmo$t$,
      ordem = 15,
      conteudo =
$conteudo$Você pediu cargas para levar — e como reclamou quando elas foram colocadas sobre os seus ombros! Será que tinha imaginado outra espécie de cargas?|

– Dag Hammarskjöld

Emocionalmente, às vezes trabalhamos um dia inteiro em apenas uma hora.

Gastamos uma semana inteira de preocupação em nossas orações, e é apenas quarta-feira.

Sempre me disseram: “Cuidado com as emoções — não pode confiar nelas”.

Mas eu acredito que meus pensamentos não são menos volúveis que as emoções, e são tão impacientes por atenção quanto elas.

O fardo por e o fardo de

Uma ambição por quietude nos conduz a aprender a contemplar a Deus. Calma contemplação muda o nosso ritmo. Um compasso propício às condições que enfrentamos pode nos ajudar muito, porque ansiedades estão chegando.

As ansiedades me encontraram bem antes de me tornar pastor. Como dizia meu pai: “Eu as consegui honestamente”. Surtos de ansiedade aparentemente salpicam a biologia de meus parentes. Acrescente a isso meu próprio quinhão de traumas providenciais, e esses sentimentos ansiosos de quem parece ter formigueiro nas calças, que rastejam, tremem e picam não são surpreendentes. O que pode surpreender é que entrar no ministério pastoral não nos livra da ansiedade. O apóstolo Paulo deixa isto bastante claro: “Além das coisas exteriores, há o que pesa sobre mim diariamente, a preocupação com todas as igrejas. Quem enfraquece, que também eu não enfraqueça? Quem se escandaliza, que eu não me inflame?” (2Co 11.28–29).

Os pesos podem ficar parados como esgoto estagnado em nosso porão ou como um rio cujas margens transbordam e chegam ao campo próximo de nossa casa. Qualquer dia as águas fétidas terão de ser enfrentadas. Mas o sofrimento e os pesos nem sempre são ocasião de crise. Às vezes o fardo da pessoa é como os dedos com artrite. Aprendemos a abrir o vidro de picles ou a abrir a torneira a cada dia, com estremecimento. Nosso trabalho pastoral nos leva aos fardos que outros suportam, e também aos nossos próprios. Esses pesos geralmente vêm em duas formas: fardos por e fardos de.

Sentimos o fardo por: • Nossas famílias: “Eis que se chegou a ele um dos principais da sinagoga, chamado Jairo, e, vendo-o, prostrou-se a seus pés e insistentemente lhe suplicou: Minha filhinha está à morte; vem, impõe as mãos sobre ela, para que seja salva, e viverá” (Mc 5.22–23). • Nossos vizinhos e igrejas: “Além das coisas exteriores, há o que pesa sobre mim diariamente, a preocupação com todas as igrejas” (2Co 11.28). • Ministros colegas: “para que eu não tivesse tristeza sobre tristeza” (Fp 2.27). Temos fardos que vêm de: • Pecado pessoal: “os pecadores, dos quais eu sou o principal” (1Tm 1.15). • Limites e orações não respondidas: “Por causa disto, três vezes pedi ao Senhor que o afastasse de mim” (2Co 12.8). • Nosso corpo: “... por causa do teu estômago e das tuas frequentes enfermidades” (1Tm 5.23). • Nossas famílias: “E, quando os parentes de Jesus ouviram isto, saíram para o prender; porque diziam: Está fora de si” (Mc 3.21). • Membros de igreja: “Alexandre, o latoeiro, causou-me muitos males” (2Tm 4.14). • Colegas pastores: “Alguns, efetivamente, proclamam a Cristo por inveja e porfia” (Fp 1.15); “Houve entre eles tal desavença, que vieram a separar-se” (At 15.39). • Vizinhos: “como surgisse um tumulto dos gentios e judeus, associados com as suas autoridades, para os ultrajar e apedrejar” (At 14.5). Uma vez, após dirigir o louvor e a pregação, andamos até o estacionamento e descobrimos que vários carros tiveram os vidros quebrados e pertences pessoais roubados de dentro deles. Quando eu fazia o seminário, imaginava sermões poderosos pelos quais as pessoas agradeceriam, enquanto as multidões se ajuntariam com apreço, mas provavelmente não pensava no cuidado pastoral de um pregador que escutasse, tomando uma vassoura para limpar o vidro quebrado em meio à chuva, e com humilde presença, abraçasse um ser humano que rompia em lágrimas. Encontramos ajuda financeira para consertar os carros que foram vandalizados e mobilizamos visitas por causa dos pensamentos amedrontados. Esses fardos da vida oferecem a nós pastores um profundo privilégio. Conseguimos ver a ação misericordiosa de Deus de primeira mão e repetidamente. Mas também podemos nos esgotar se não tivermos ajuda, desanimados pela ironia de constantes pesos e batalhas espirituais. (Por exemplo, o sermão daquela manhã foi em Efésios 4.28: “Aquele que roubava não furte mais”).

A cada momento

Jesus trata as nossas ansiedades pedindo que as coloquemos em compasso de um dia de cada vez, por toda a vida. “Portanto, não vos inquieteis com o dia de amanhã, pois o amanhã trará os seus cuidados; basta ao dia o seu próprio mal” (Mt 6.34).

Enquanto meu papaw laborava com pulmões cheios de líquido na última estação de sua vida, eu telefonava para ele.

“O que é que você sabe, jovem?”, ele dizia. Eu podia escutar o chiado da respiração destroçada em sua voz.

“Estive pensando em você, Papaw. Como vão as coisas pra você hoje?”

“Ah, estou indo. As coisas são o que são,” ele dizia. “Não adianta reclamar, né?”

Então ele acrescentava um pedaço de conselho que tinha se tornado lugar comum para ele. Parecia decidido a passar adiante. “Levando um dia de cada vez”, dizia. “Você sabe que isso é tudo que podemos fazer, afinal. Não estou certo, meu jovem?”

Eu fazia uma pausa em minhas tentativas confusas de praticar o que ele falava. “Bem, acho que tenho muito a aprender sobre isso”, eu reunia coragem para dizer. Eu ouvia um sorriso em sua voz, seus pulmões se esforçando em cada migalha de ar.

“Eu amo você, Papaw”, eu dizia. “Também amo você, Zack”, ele respondia (palavras raramente proferidas por ele quando era homem jovem, mas maravilhosamente, livremente ditas agora). Então acrescentou o que tinha se tornado seu pedido regular: “Não se esqueça de fazer uma oração em favor desse velho”.

“Não vou me esquecer, Papaw. Oro por você todo o tempo”, eu lhe assegurava.

As quatro porções

Jesus nos dá esse dom: porções de um dia de cada vez para suportar o peso que encontramos. O salmista nos dá um começo de como reaprender que cada dia basta em seu anseio. “À tarde, pela manhã e ao meio-dia, farei as minhas queixas e lamentarei; e ele ouvirá a minha voz” (Sl 55.17).

Às vezes, o salmista usa palavras mais específicas quanto ao que engloba uma “tarde”, e em outros lugares na Bíblia (por exemplo, Lm 2.19), ele se refere às vigílias da noite (Sl 63.6).

O salmista identifica quatro partes do dia de vinte e quatro horas. Passei a pensar nessas quatro partes como porções. Em todo este dia ele está presente, e isso nos basta.

Manhã: do nascer do sol, ou seis da manhã, até o meio dia Meio-dia: do meio-dia até às seis da tarde Início da noite: do pôr do sol, ou seis da tarde, até dez da noite (às vezes referida como “primeira vigília da noite”).

As vigílias da noite: das dez da noite até às seis da manhã.66

Marque bem isto. Para correr numa maratona, primeiro temos de correr uma milha. Correr uma milha não é coisa que se despreze.

A graça da manhã

O Novo Testamento nos conta coisas a respeito de Jesus pela manhã: ele orava (Mc 1.35). Ele tinha fome. Ele andava (Mt 21.18). Ele ensinava (João 8.2).

Para o salmista, a manhã nas mãos de Deus testifica-nos que as lágrimas têm fim, o alívio é significante, e “vem alegria” (Sl 30.5). Na manhã surgem cânticos de louvor e ações de graças, porque a força de Deus nos fez passar a noite (Sl 59.16). A noite não venceu. Acordamos e vemos novamente que o amor de Deus não desiste de nós, e pedimos que ele nos acompanhe e nos guie para aquilo que nos aguarda (Sl 143.8). A manhã nos provoca a oração, e, portanto, para observar como Deus responderá essas orações no decorrer do dia (Sl 5.3).

A manhã foi feita como um poema ou sermão que consola os desanimados. Ela nos faz pensar de novo sobre a bondade de Deus e perguntar por que ele demora em revelar sua bondade a nós (Sl 88.13–14). O final da noite também nos desperta a uma convicção renovada de aproveitar o dia como meio de oposição ao que é ignóbil no mundo, e proteger aquilo que é bom, belo e direito (Sl 101.8). De fato, o sol não é melancolia matutina como eu sou ao acordar, cansado de brilhar novamente sem ser notado, viajando pelo mesmo velho percurso a cada dia, entediado com tudo isso. Não mesmo! Porque Deus dá esse significado para a manhã, ele poeticamente imagina o sol como um noivo apaixonado, ansioso e feliz por ver a sua noiva (Sl 19.5). O sol brilha obstinado por amor acima das nuvens e trovões.

Historicamente, foi de manhã que os inimigos de Jesus amarraram as suas mãos e determinaram que o matariam (Mc 15.1). Porém, poeticamente, será que o nascer do sol traria alguma esperança a nosso Senhor, enquanto homens possuídos pelos terrores da noite o jogaram na rua? Era de manhã. Ele sabia disso, não sabia? Em tantas manhãs ele conhecera a intimidade com seu Pai. Houve muitas manhãs antes que esses homens presos em ciladas tivessem nascido. As manhãs continuariam depois que eles morressem. De fato, haveria um dia em que na manhã do terceiro dia, quando ainda estivesse escuro, a morte morreria, esses homens ímpios seriam confundidos, e Jesus ressuscitaria! A manhã proclamou que essa ressurreição e vida ultrapassaram a noite. Será que essa proclamação sussurrou a ele? Seria essa uma parte da “alegria que lhe estava proposta...” (Hb 12.2)? Será que o sol, de alguma forma, piscou para Jesus quando eles amarraram suas mãos e procuraram extinguir seu fôlego?

Por essa razão é que venho pessoalmente pensando na manhã como o tempo da graça. Claro, dia e noite, todo o tempo, depende da graça. Só estou inferindo que parece que a graça surge à frente na porção matutina, porque sentimos que não somos suficientes para enfrentar aquilo que nos aguarda; perguntamos se o sol vai brilhar nas nossas circunstâncias como brilha pela manhã.

Levantamos; o amor de Deus está aqui! Oramos; a direção de Deus está conosco! Esperamos novamente e clamamos de novo; Deus está vencendo as trevas! Comemos o pedaço diário que temos; Deus proveu! Chegamos ao trabalho que está diante de nós; Deus tem algo a nos mostrar! A aurora raiou; o túmulo está vazio! A estação da manhã começa e termina. Deus tem sido nossa porção em nossos fardos até a chegada do meio-dia. Isto é graça e realização! Louvamos a Deus. Passamos a primeira milha do dia.

Sabedoria do meio-dia

Nos Salmos, “o meio-dia” simboliza, para o povo de Deus, a luz com a qual brilham a justiça e a virtude (Sl 37.6). É aqui que agimos com escolhas sábias com respeito ao trabalho, circunstâncias e pessoas à mão.

Sendo assim, a tarde nos fatiga. Foi ao meio-dia que Jesus, cansado de sua viagem, sentou para uma pausa e um copo de água (Jo 4.6). Os afazeres do dia recebem novo impulso e aumentam de velocidade. O trabalho tem de ser feito. Chamadas anotadas, tarefas completadas, e-mails escritos, reuniões e compromissos atendidos, campos arados, ferrolhos apertados, mais três fraldas a trocar, jantar a preparar, doença a suportar. Poeticamente, Jesus faz um retrato da porção do meio-dia como “a fadiga e o calor do dia” (Mt 20.12). O trabalho nos agasta até sua conclusão, cheques de pagamento são entregues e os ossos parecem estalar dentro de nossos músculos doloridos.

Frequentemente, umas duas horas depois do almoço a fadiga começa a tomar conta. Alguns de nós experimentamos o que é chamado de “o demônio do meio-dia”, uma nuvem escura de mau humor que movimenta as nossas pernas, nos contorce onde nos assentamos, e gira nossos polegares. Tais rabugices instilam em nós “um ódio pelo lugar” que nos foi dado e um “ódio pelo trabalho com as mãos”.67 Não é de surpreender que coquetéis e happy hours tentem homens e mulheres empresários às tardes. A distração nos conclama.

Não é de admirar que o período do meio-dia até lá pelas seis da tarde muitas vezes coloque os caminhos virtuosos em prova. Se a manhã é tempo de conduzir nossas lágrimas, nossos planos, nosso trabalho e os questionamentos do dia ao seu trono de graça para ali encontrar esperança, a tarde parece ser tempo de iluminação, em que nossa intenção de descansar sobre essa graça é peneirada e os verdadeiros objetivos de nossa esperança tiram as suas máscaras.

Ao meio-dia o sol está em sua maior altura. Ele dá seu mais forte calor e a mais ofuscante luz que podemos ver, o maior calor para que nos humilhemos. Fomos feitos para nos assemelhar ao meiodia. Mas Pilatos falhou. Como também fraquejou o povo de Deus.

Foi na parte do meio-dia que Pilatos escolheu a vantagem política e ordenou que o inocente fosse maltratado, o Filho de Deus fosse morto (Jo 1.14–15).

Foi também ao meio-dia que Jesus deu seu último suspiro e o brilho do sol inexplicavelmente falhou (Lc 23.44). As trevas e o meio-dia ensolarado trocaram de lugar. Viraram o dia de cabeça para baixo, como fazendo uma comparação entre o mal que estava sendo chamado de bem, e o bem que estava sendo acusado de mal.

Se a manhã nos conclama a cantar, a tarde nos humilha, lembrando-nos que precisamos da sua salvação. A manhã nos ensina a louvar. A tarde nos ensina a ter paciência e perseverança. O dia (e a corrida) tem um começo e um final. Atravessar a linha de chegada é graça e força! Mais uma milha e nossos fardos são carregados.

Hospitalidade de fim da tarde

No cair da tarde, vieram os discípulos a Jesus e lhe disseram: O lugar é deserto, e vai adiantada a hora; despede, pois, as multidões para que, indo pelas aldeias, comprem para si o que comer. Jesus, porém, lhes disse: Não precisam retirar-se; dai-lhes, vós mesmos, de comer. Mas eles responderam: Não temos aqui senão cinco pães e dois peixes (Mt 14.15–17).

“O dia agora acabou”. O mestre e o ensino chegam ao final. É tempo para comer e gozar um pouco de descanso na companhia de outros que também estejam descansando e queiram um pouco de comida. Não precisamos levar nosso trabalho conosco para casa. É importante estar sem trabalho à noite.

O cair da noite destaca a hospitalidade. Nós estendemos a bondade e proteção de uma presença pacífica a nossos vizinhos. É bondosa porque leva em conta as necessidades físicas e da alma de nosso próximo, providenciando-lhes aceitação e sustentação prática. A hospitalidade é também protetora, porque permanecer hospitaleiro para com o próximo significa que não transgredimos, usamos mal, ou os consumimos. Ela permite que façam companhia em nossa presença, de maneira que saibam que não nos aproveitaremos deles para satisfazer nossa lascívia nem exigiremos que eles ajam como se não estivessem cansados ou necessitados de alimento.

A manhã nos ensina a cantar. A tarde nos ensina a perseverar. O anoitecer nos ensina a dar graças a Deus pelo tédio sagrado de bênçãos corriqueiras que podemos contar (Sl 141.2).

Mas a poesia dos Salmos também mostra um retrato da noite como tempo de sombras (Sl 59.6–7; 102.11; 104.23). Afinal de contas, aqueles cujas tardes foram entretidas pela sedução da insensatez ameaçam a hospitalidade. As imaginações de “happy hours” frutificam no cair da noite (Pv 7.7–9). Os que não tiraram tempo para parar e levar suas disposições irritadas a Deus antes da inauguração da noite igualmente nos instigam à rebeldia. Muitos de nós chegamos à mesa de jantar irritadiços. Enchemos a sala do entardecer com o lixo de nossas frustrações e ansiedades não intencionadas. Aqueles que fazem parte de nossa turma pagam por isso sem merecer — muitas vezes e especialmente aqueles que estão mais próximos de nós, os que dizemos amar acima de todos. Nesses casos, a escuridão da noite dá ousadia aos abusos ilícitos dos corações uns dos outros. As trevas fazem surgir aqueles que desrespeitam a Deus.

Por esta razão, nosso fim de tarde precisa de Jesus. Algumas tardes ele saía para orar (Mt 14.23). Agia como se fosse seguir adiante. Então dizemos a ele, como os que estavam no caminho para Emaús: “Fica conosco, porque é tarde, e o dia já declina”. Como eles, nosso coração arde enquanto Jesus está conosco, partindo o pão conosco, falando-nos das Escrituras (Lc 24.29–31).

Ao anoitecer, Jesus era hospitaleiro para com os enfermos e os possuídos por demônios (Mc 1.32). Duas vezes, entre tempestades noturnas, Jesus mostrou aos seus seguidores que estava com eles no meio do que os assustava na noite (Mc 4.35; 6.37). Trancados atrás de portas fechadas por medo do que a comunidade crucificadora faria com eles, era noite quando Jesus os buscou e lhes falou: “Paz seja convosco”, alegrando os seus corações (Jo 20.19). A alegria por sua bondade redime a noite, e isto é muita bondade de Deus, porque as vigílias da noite virão. Quanta bondade direcionar nossa meditação às alegrias ordinárias em meio à feliz companhia de vizinhos que amamos, antes que venham os “ladrões da noite” para nos assustar como bicho-papão. Graça veio. O início da noite nos deu gratidão. Os pesos são levados, Mais uma milha foi realizada.

Solitude e as vigílias da noite

Como de banha e de gordura farta-se a minha alma; e, com júbilo nos lábios, a minha boca te louva, no meu leito, quando de ti me recordo e em ti medito, durante a vigília da noite (Sl 63.5–6).

Sempre tenho visto a solitude como característica matutina. Mas a poesia dos Salmos mostra as vigílias da noite como lugar de solitude. Historicamente, quando estava acordado sozinho à noite, nos lugares ermos de oração, certamente este testemunho do Salmo 63.5–6 era a espécie de porção que Jesus experimentava junto ao Pai (Lc 6.12).

As vigílias da noite nos oferecem um retrato de um soldado militar em seu posto de sentinela. A sentinela permanece acordada e olha cada movimento da noite em potencial para nos proteger dos inimigos e guardar o sono de seu povo. Também vigia pelos mensageiros ou reforços que chegam, trazendo clareza ou resgate em ação secreta. Cama para descanso, vigilância para clareza ou resgate; sono e falta de sono — são estes os movimentos da profundeza da noite. Jesus trata dessas vigílias da noite em sua parábola:

Vigiai, pois, porque não sabeis quando virá o dono da casa: se à tarde, se à meia-noite, se ao cantar do galo [três da madrugada], se pela manhã (Mc 13.35).

Solitude, silêncio, conversa enquanto se escuta, e humilde presença voltam todos a nós. Esta não é uma “hora silenciosa” em geral, só para analisar verdades abstratas. A solitude assume com Deus as emoções e questionamentos muito reais que sobraram do dia.

Irai-vos e não pequeis; consultai no travesseiro o coração e sossegai (Sl 4.4)

Um propósito para nossa cama à noite é ponderar no coração aquilo que nos perturba e falar sobre essas coisas diante de Deus. Disso resulta o sono. O sono é um ato sabático. Repousamos e deixamos tudo aos cuidados de Deus enquanto estamos deitados sem mexer com o mundo por um pouco.

Mas há terrores na noite também (Sl 91.5). Pesadelos. O choro sem sono pode se estender (Sl 30.5). Aflições podem manter nossas “pálpebras abertas” (Sl 77.4). O silêncio desolado permite ao coração perguntas inquiridoras, em agitada inquietação (Sl 77.7–9).

É também verdade que nossa estultícia não coibida da tarde pode nos conduzir a uma noite não hospitaleira e encher de tropeços nossas vigílias noturnas. “Vem, embriaguemo-nos com as delícias do amor, até pela manhã”, dizem os que escolhem ter casos fora do casamento (Pv 7.18). A escuridão antes do alvorecer muitas vezes nos assombra com culpa e vergonha. Chamamos, meio bêbados, um taxi, tendo deixado nossa dignidade mal-usada na cama de uma estranha, perguntando-nos em que raios estávamos pensando. Ou trabalhamos a noite inteira porque procrastinamos no trabalho. Não temos sono nem solitude calma para nos fortalecer para a manhã. A profunda noite então torna-se em um lugar de confissão, uma escola onde o conselho de Deus nos encontra e instrui (Sl. 16.7).

Antecipo-me ao alvorecer do dia e clamo; na tua palavra, espero confiante. Os meus olhos antecipam-se às vigílias noturnas, para que eu medite nas tuas palavras

(Sl 119.147–48).

Sonhos na Noite

Alguns de nós sonhamos à noite, portanto, vamos fazer aqui uma pausa para relembrar sobre esses sonhos. Podem vir de três lugares, assim como são os nossos pensamentos durante o dia, quando estamos acordados. Podem ter sua origem em nós mesmos, ou em nosso inimigo, o diabo, ou podem ser sussurrados a nós por Deus. Em qualquer dos casos, os sonhos são atos da providência, ou seja, estão também entre as circunstâncias de nossa vida que Deus governa, e pelas quais ele nos governa para sua glória e nosso verdadeiro bem (Jó 33.15–18).

Qualquer que seja nosso sonho, levamos a Deus o seu conteúdo, bem como os pensamentos e emoções resultantes. Com ele, podemos repousar a atividade poética e a estrutura de nosso coração em Jesus. Se houver pessoas em nossos sonhos que se destacam para nós, podemos interceder por elas, assim como frequentemente fazemos quando vêm à mente as pessoas durante as horas em que estamos acordados. Igualmente, nós confiamos a ele as nossas impressões temerosas ou jubilosas, acreditando que ele vai, como sempre, nos informar, transformar e conduzir de acordo com seu amor e seu tempo perfeito em Jesus.

Foi na vigília da noite que Jesus orou clamando em alta voz com lágrimas no Getsêmane. Ele sabe o que significa chorar no escuro. Sua empatia por nós é profunda e nós também precisamos aprender isso.

Após a noite e os sonhos, vem a madrugada. O Senhor que nos guarda não dormita, mas nos atende (Sl 121.4). O sol começa a romper para sua noiva. Raia um novo dia. Por um dia inteiro agora, ele o tem carregado, com seus fardos e tudo mais.

Nossas agendas diárias

Que diferença prática faz esse ritmo de quatro porções do dia?

Primeiro, pense em manhã, meio-dia, entardecer e noite como porções suficientemente grandes para sua atenção e pequenas o bastante para gerenciar a cada dia. Não tente mais acumular tudo isto de uma forma indistinta e nem correr para fugir delas.

Segundo, ao chegar ao final daquela porção do dia, faça uma pausa e olhe para trás antes de começar a sua nova porção e correr para frente. Dê graças a Deus pelos sinais de graça que você experimentou. Ou chore e lamente pela dor. Ou reconheça seus humores agitados e pergunte a ele sobre o que dá origem a tais emoções. Peça que ele mostre os seus erros, pecados e falhas naquela porção, para que o conduza a confessar e, com gratidão, se desviar de repeti-los. Ou interceda por qualquer situação ou propósito que se destacou durante aquele tempo. Então, nessa pausa, louve a ele e peça que o dirija pela mão na próxima porção do dia.

Quanto a isso, digamos que são onze horas e quarenta e sete minutos da manhã. A manhã está prestes a repousar. Olhamos em retrospectiva e agradecemos pelo que essa manhã trouxe a nós. Prestamos também atenção a nosso ânimo. Procuramos ver a causa de qualquer disposição negativa. Localizamos aquele cenário ruim da manhã e o lançamos sobre o Senhor. Agora, por sua graça, aguardamos a chegada do meio-dia. Não queremos levar disposições não meditadas da manhã para a tarde. Basta o que a tarde já tem. Jesus carrega as nossas manhãs.

Está chegando o anoitecer. São cinco e meia da tarde (ou seis e meia porque estamos com tudo atrasado). A comida está borbulhando no fogão. O trânsito aguarda nosso retorno para casa. Pausamos e refletimos. Pedimos perdão; buscamos sua coragem para endireitar as coisas onde precisamos, quanto mais isso for possível para nós; damos graças pela força que ele nos deu e pelas respostas às orações matutinas que recebemos; celebramos a virtude do seu Espírito que, por sua graça, permaneceu conosco. Notamos nossos músculos doloridos ou cérebro cansado. Buscamos o seu descanso. Lutamos por crer que nosso trabalho não acabado estará lá amanhã, esperando por nós. A manhã nos dará tempo para levá-lo ao Senhor antes que volte de novo para nós. Tudo vai ser feito. Por enquanto, tem crianças com quem brincar, cônjuge a quem vir ao encontro, ou família, amigos, ou vizinhos a encorajar. Deixe por agora o meio-dia. Entregue suas indisposições para Jesus, para que não as leve indevidamente com você e jogue sobre os outros à mesa de jantar.

Talvez seja nove e quarenta e cinco da noite. Já tiramos a mesa e desligamos o televisor. Os filhos já estão na cama (a não ser que sejam adolescentes). Nossos amigos estão indo para as suas casas. Paramos para agradecer pela boa comida e companhia com que nos abençoou. Buscamos perdão pelas disposições ruins que derramamos sobre os outros. Animamo-nos que a manhã seguinte nos dará um novo momento para levar a Deus essas coisas e, esperamos cantar e encontrar louvor renovado. Levamos a ele nossos temores, nossa doença, e nossas sentidas opressões na comunhão da noite. Ele fica conosco e fala de paz. Escovamos os dentes. Para alguns de nós, a hora de ir para a cama se aproxima. Para outros, chegou a hora de quietude e oração. Empregos de terceiro turno, permanência em hospital, festas sazonais, deveres de casa de última hora — cada uma dessas realidades acometem a noite. Mas a segunda e terceira vigília da noite não são criadas para que nós assistamos televisão, para o trabalho que sobrou do dia, ou para divertimentos após a festa, pelo menos não como norma. A noite vem. A madrugada foi feita para estarmos a sós com Deus. Ele nos espera com amor para nos carregar.

Quando uma porção termina e a outra começa, é como se olhássemos para trás para ajuntar tudo que é belo da porção anterior antes de ir adiante. São como as flores espalhadas por aí que nós ajuntamos, colocamos em nosso vaso com água, e agradecemos a Deus por elas. Também ajuntamos qualquer coisa difícil, dolorosa, assustadora ou pecaminosa, como se fossem pedaços de um vaso que se espatifou, o qual nós, ou outra pessoa, derrubamos da nossa mesa. Varremos esses pedaços para dentro de uma caixa e os trazemos diante de Deus. Colocando nossas flores e nossos cacos quebrados diante de Deus dessa forma, damos graças e lançamos nossas ansiedades. Ele os segura agora, e podemos ir adiante para a próxima porção do dia.

Porções semanais

Um dia em cada sete, procuro viver essas quatro porções como um dia de descanso. Por vinte e quatro horas sou ajudado, exceto com autênticas emergências, deixando o e-mail, telefonemas, compromissos e o trabalho pastoral diário para tomar fôlego. Isso tem mudado com o passar dos anos, à medida que os filhos cresceram e suas faixas etárias mudaram. Às vezes eu durmo até mais tarde. Ou, depois que as crianças estão na escola, assisto a um filme antigo ou escuto música. O almoço é folgado. Pode ser que eu tire uma soneca à tarde antes de buscar os filhos na escola. Durmo sem senso de culpa (pelo menos este é meu alvo). Não é uma perda de tempo. Não hoje.

Mas quando os ritmos semanais de descanso são melhores para mim, encontro-me sentado no chão sobre um forro de piquenique para almoçar. Se for outono ou começo do inverno, visto boina, luvas e roupas suficientemente quentes para aguentar três horas no relento. Numa sacola plástica levo Bíblia, papel, e uma pilha de poesias ou um livro de ficção. Aninhado entre a sombra das árvores de um de meus lugares prediletos de descanso de sábado, eu olho por cima do Lago Creve Ceour, ou talvez olhe morro abaixo para as fontes de águas do Parque da Floresta. Calço tênis e caminho, talvez por quilômetros. Às vezes, quando chove, eu fico sentado em minha velha caminhonete vermelha olhando por cima da lagoa.

Aqui neste lugar corriqueiro, entre essas coisas que importam, estou entregue mais uma vez à escuta. Sou escutado por Deus. Entregando os meus fardos. Sendo tomando no seu colo. Voltam risadas gratas e alegres. Às vezes choro sem mesmo saber o porquê. Mas ele sabe. Esses fardos são dele.

Quando perco sextas ou segundas de folga, e estou irritado e exausto pela falta deles em minha vida, já notei que só um dia de descanso não oferece muito repouso. Aí é necessária uma espécie de desintoxicação. Tenho de me lembrar de que a presença humilde, a conversa em que se escuta e a solitude entre essas porções semanais têm um efeito cumulativo; assim como acontece com as quatro porções do dia. Uma vez que eu comece a colocar várias porções diárias e semanais em seguida no meu ritmo, tornase notável a transformação em meu ser. Pode ser que meus fardos tenham aumentado. Mas sou novamente capaz de oferecer descanso e presença hospitaleira aos outros, porque eu mesmo realmente tenho algo disso. A graça disso me deixa maravilhado.

Quando primeiro introduzi essa ideia de “meses de descanso” à nossa congregação, eles não gostaram. Três meses por ano, dávamos a todos os nossos ministérios semanais uma folga sem culpa (abril, agosto e dezembro). Eu fiz isso principalmente por causa da idade de nossa congregação, composta principalmente por jovens famílias com crianças. Essas mesmas famílias eram os principais voluntários na igreja e na comunidade. Entre servir e voluntariar, ir aos estudos bíblicos e grupos nos lares, as pessoas estavam se esgotando. No lado engraçado, se alguém tirasse uma folga sentia culpa enorme, como se estivesse desapontando a Deus e a nós. É claro, não ordenamos que nossos membros observem meses de descanso; as pessoas podem continuar a se reunir se assim desejam. Mas no decorrer dos anos, a maioria tem ficado grata pelo ritmo embutido que essas folgas oferecem. Descansamos estrategicamente a fim de continuar com vigor. Se não fizermos isso, acabamos tendo de tirar folgas não planejadas porque adoecemos ou nos esgotamos devido a nossos horários desgastantes.

Marcando nosso passo

Como, então, essas porções diárias e semanais podem nos ajudar? Uma pequena cena de uma história nos dá uma resposta. Nate e seu pai se prepararam para uma caminhada em uma difícil montanha. Nate nos conta a história.

“Nate, acho que se nos mexermos em passo bem devagar não vamos ter de parar tanto. Aqui, olhe”. Meu pai mexeu os pés metodicamente, devagar, mas firme.

“Pai, você está louco!”, dei risada. “Nunca vamos chegar lá. Olhe como você está andando devagar. Eu podia rastejar mais depressa que isso. Está ridículo!”

“Faça o que você quiser”, murmurou. “Eu vou andar devagar!” Eu descartei a sabedoria do meu pai e corri adiante, subindo a montanha. Depois de cerca de meia hora de caminhada numa trilha íngreme, notei que, com todas as minhas paradas doloridas, ele me acompanhava. Eu estava exausto. Papai não parou nenhuma vez, e parecia estar deslizando montanha acima.

Como ocorre muitas vezes na vida, a dor tornou-me disposto a aprender. Naquele dia foi por pulmões queimando e pernas bambas... Dei uma experimentada na teoria do meu pai e me juntei à sua marcha ridiculamente vagarosa. Logo descobri que se eu continuasse indo devagar, era mais fácil não ter de parar. Não dava para acreditar. Ali na encosta da montanha, um dos dilemas de toda minha vida estava sendo revelado. A resposta era tão simples.

Marque bem o seu ritmo. Vá devagar. Não pare.68

Para mais a esse respeito veja Dictionary of Biblical Imagery, ed. Leland Ryken, James C. Wilhoit, and Tremper Longman III (Downers Grove, IL: InterVarsity, 1998). Kathleen Norris, Acedia and Me: A Marriage, Monks, and a Writer’s Life (New York: Riverhead, 2008), xiv. Nathan Foster, Wisdom Chaser: Finding My Father at 14,000 Feet, (Down¬ers Grove, IL: Intervarsity, 2010), 34.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -15;

  -- 12 | Cuidando dos enfermos (reaproveita a aula de ordem 16: preserva o progresso)
  update public.aulas
  set titulo = $t$12 | Cuidando dos enfermos$t$,
      ordem = 16,
      conteudo =
$conteudo$A visitação aos enfermos... é de suma importância [...] Aqui se aprendem lições que jamais se aprenderiam no gabinete pastoral.

– Charles Bridges No segundo ano de meu primeiro pastorado, comecei a cantar corinhos e dirigir um estudo bíblico semanal num lugar de assistência a idosos. Depois do estudo e do cântico, os olhos de uma senhora idosa brilhavam com lágrimas. Ela veio em minha direção, beijou meu rosto (como muitos idosos fazem), e me agradeceu. Eu dei-lhe de volta um beijo no rosto. Era costume delas, não meu, e admito que eu me sentia desconfortável. Mas eu a abracei e tomei um momento para orar por ela. Ela agradeceu a Deus. Não pensei mais no assunto.

Na quarta-feira seguinte, depois do estudo e do cântico, levanteime do piano e fiquei boquiaberto notando que uma fila de homens e mulheres imediatamente se formou. Cada um parecia esperar a sua vez. As senhoras idosas beijavam meu rosto; os homens de cabelos de prata e calvície apertaram-me a mão. Desajeitado, eu devolvia esses gestos e orava por eles. Os abraços afloraram. Sorrisos se abriam como pétalas; lágrimas umedeciam e acumulavam como encharcados pelo orvalho de uma manhã ensolarada. Estranho!

Com o passar dos meses, essa espécie de fila que se formava para que os tocasse e orasse por eles passou a ser uma espécie de prática normativa na comunidade. Aquelas manhãs de quarta-feira, os muitos ofícios fúnebres que seguiam, esse modo terno de cuidado ao próximo e gratidão a Deus em Jesus — estes tornaramse como desenhos preciosos e fotos que as pessoas às vezes colam com íman em suas geladeiras.

As pessoas que nos ensinam

O toque forma uma parte do nosso trabalho pastoral. Em geral tenho sido desajeitado e alerta nessa obra, tomando cuidado para não haver toques não apropriados. Falarei a respeito dessa espécie perigosa de toque no próximo capítulo. Mas o Senhor começou a me ensinar sobre o tipo bom de toque a cada semana.

Lembro-me de Betty, em um leito de hospital, a boca coberta com uma máscara que alimentava aos poucos a respiração dos pulmões. O bipar constante de um aparelho indicava o pingar de medicamentos no tubo preso com fita adesiva em suas veias. Eu procurava uma passagem da Bíblia para ler, nervoso com a minha juventude, incerto quanto a como mostrar Jesus para a viúva de oitenta anos ali deitada, pressionada embaixo de todas aquelas coisas. Antes de eu dizer uma palavra, Betty levantou seu braço cheio de tubos, e conseguiu falar uma frase sob a máscara: “Vamos orar, Pastor?” Disse isso menos como pergunta e mais como uma declaração. Em retrospectiva, agora acredito que essa velha santa estava me ensinando o que seria o desejo de Deus para um momento como aquele. Ela estava me ensinando. Com o seu presente poder, levantei com força a minha voz.

Antes que Betty tivesse erguido a mão eu a tomei e segurei. Coloquei a outra mão levemente sobre sua testa. Ali juntos, no nome de Jesus e pedindo oração naquele dia, ela já havia me ensinado algo bom a respeito do toque humano ocasional entre homens e mulheres que estão unidos como família em Jesus. Confesso que eu a enxergava mais como avó do que como irmã. Mas até mesmo aqui eu tinha muito que aprender, e acho que ela via isso. Para ela, eu era seu pastor — como um neto, sim, mas assim mesmo um homem de Deus, enviado para lhe fazer o bem em Jesus. Embora secretamente muitas vezes eu temesse ser visto como um tanto juvenil na sábia presença dos idosos, ela me via como o homem adulto que eu era. Ela me tratava de acordo com o chamado que eu recebera. Isso sempre me humildou.

De qualquer modo, era o aniversário da morte de seu marido. Ele havia morrido há mais de vinte anos. Ela perguntou se poderíamos sentar e conversar um momento. De repente estourou a represa e as lágrimas jorraram. Ficamos sentados. Ela chorou. Meu ombro segurava sua cabeça fatigada e apoiava seu torso arfante. Eu não sabia mais o que fazer. Orava enquanto ela chorava.

Na verdade não havia mais nada a fazer. Antes, eu não imaginara quão pouco uma viúva experimenta o toque conforme deveria ser. Os membros da família moram longe e visitam esporadicamente. Além das piadinhas do pessoal médico, os idosos frequentemente entram numa escassez de toque, como se vivessem no deserto durante muitos anos de suas vidas. Sobre o ombro de quem uma viúva pode encostar quando sofre a perda do marido a quem amava? Só fui esse ombro uma vez para Betty. Provavelmente é assim que deve ser. Mas lembrou-me do papel que desempenhamos um pelo outro na comunidade. Meu ombro era seguro e forte. Por um momento, foi o travesseiro irmão para seu sofrimento autêntico. Espero que um dia um ombro cristão possa bondosamente permitir que eu me encoste no meio de meu próprio luto por alguém amado a quem perdi, enquanto aguardo o feliz reencontro no céu com Jesus.

Não era de surpreender que Betty fosse uma das pessoas na fila ao lado do piano desde o começo. Olho para trás agora e reconheço que eu era desajeitado com esse toque do tipo certo. Os homens e as mulheres formavam fila porque o toque humano fraternal, seguro, era como uma joia rara. Um aperto de mão, um abraço, a presença, um beijo no rosto, oração — toque humano do jeito que a família em Cristo deveria oferecer uns aos outros — é um bem entesourado do qual se aproveitar enquanto durar.

No caso de Betty, Paulo nos dá a categoria. Os homens jovens devem tratar as mulheres mais velhas como mães, que implica que as mulheres mais idosas devem tratar os homens mais jovens como filhos (1Tm 5.2). A “mãe” encontrou um momento para o ombro de um “filho”.

O toque no Evangelho, portanto, deve ser semelhante ao toque normativamente apropriado entre membros da família. Esta é a sua direção. O cuidado pastoral pela alma tem de levar em conta também o corpo. Portanto, o toque abusivo, negligente, presunçoso ou sensual não tem lugar no toque da vida e do ministério evangélicos. Aqueles entre nós que só possuem tais categorias de toque nocivo precisam da graça curadora e da mentoria de Jesus, antes que tentemos o toque familiar no nome de Jesus. Até que o evangelho transforme corretamente nosso uso do toque, estamos menos prontos para um ministério do que percebemos, não importa o quanto estamos preparados para ensinar ou pregar ou aconselhar.

Jesus e o toque dos enfermos

O contato da pele de Jesus com as coisas da terra salpica as páginas dos Evangelhos: pão e peixe, uma bacia d’água, uma toalha, um cálice, vinho, trigo, cascas de árvores e mesas, lírios do campo. Foi Jesus que juntou terra em suas mãos, cuspiu nela com sua saliva, massageou com a mão a mistura para fazer lama, e espalhou generosamente a mistura úmida sobre os olhos quebrados do homem que nasceu cego (Jo 9.6).

Jesus tocou os doentes, e frequentemente tocava a ferida. Jesus tocou a lepra do leproso (Mt 8.3), o ouvido do surdo (Lc 22.51), o olho do cego, a mão dos que tinham febre (Mt 8.5), e a língua do mudo (Mc 7.33). Esse era o toque da piedade (Mt 20.34), o acariciar de quem sentia piedade.

Não é de surpreender que “todos os que tinham enfermidades pressionaram... para tocar” em Jesus (Mc 3.10). Tal toque, como um exército de justiça, arranca completamente o abuso e a negligência de mãos inimigas que têm intenção de machucar os enfermos. Nós, os enfermos, ansiamos por esse toque de Jesus, que defende e consola. Esse toque ou nos cura agora ou significa, de maneira impactante, que a cura virá com o céu. Embora possa demorar, em Cristo a cura não falhará. O toque da compaixão de Jesus rega essa esperança.

Por essa razão, Jesus nos conduzirá, na vida e ministérios, aos cheiros de leitos de doentes, com ossos medicados entre músculos embriagados de misturas prescritas. Os quartos de viúvas e enfermarias de câncer de cada comunidade revelam-nos onde Jesus visitará com certeza. Nós, os assustados ou endurecidos, precisamos que Jesus nos tome pela mão em nossas comunidades. Qualquer pessoa adulta cujo estágio da vida a tenha colocado no papel de principal cuidador de seu pai ou sua mãe sabe que não podemos cuidar do enfermo sozinho. Qualquer membro da família que viva horas de distância, ou qualquer pastor que só pode estar em um lugar de cada vez em meio a uma congregação que está envelhecendo, precisa de ajuda para lembrar que nós não somos Jesus, e nossa capacidade de cuidar é mais limitada do que queríamos que fosse. Há gente demais e sofrimento demais para os nossos dois ombros. Mas, em Jesus, a comunidade de ombros pode tocar de maneira substancial aos enfermos, literalmente e figurativamente.

Pode ser que não toquemos a ferida diretamente como Jesus fazia. E jamais devemos tocar quem não quer que o façamos. Mas quando oramos pelos enfermos, podemos perguntar: “Posso segurar sua mão para orar?” Ou no caso dos que estão em estado crítico, podemos colocar levemente a mão sobre sua cabeça ou seu braço. Um leve toque no ombro com uma palavra bondosa, ou um abraço, pode ir longe para aqueles que ainda conseguem ficar em pé.

Ao lado da sepultura

O cuidado pastoral é, em sua maior parte, uma questão de presença, estar com alguém no meio do que o perturba. O toque do tipo certo é uma sentença. Sentado numa cadeira no quarto, enquanto os membros da família se ajuntam, é nosso parágrafo. No cuidado pastoral, o contato dos olhos, um pequeno aceno ou balançar a cabeça, uma lágrima, um sorriso, disposição de segurar um guarda-chuva sobre a cabeça da pessoa enlutada na chuva, disposição para cortar o pão para sanduíches, compromisso de ajudar a cabeça confusa a tomar decisões sem fazer a decisão por ela — tudo isso descreve uma garra desajeitada e imperfeita, que está presente com as pessoas sem tentar chamar atenção ou “fazer acontecer” ou inventar artificialmente um “momento divino”. Isto, mais do que as suas palavras, forma as ferramentas de sua vocação de cuidados.

Meu primeiro funeral como pastor foi de uma vizinho que eu não conhecia. Ouvi o diretor chegar a mim na sala separada: “É hora”, diz ele. Ouço meu estômago roncar. Escuto o barulho dos meus sapatos sobre o carpete gasto. Eu me ouço tentando juntar palavras de vida junto àqueles que, em sua maioria, são estranhos a mim. Percebo que minha voz começa a tremer ali na multidão arrasada.

Naquele tempo, eu tinha pouco conhecimento dos sons da morte. Os anos desde então mudaram isso, mas era a primeira ocasião em que ouvi as gaitas de fole tocar. Depois do culto, ao lado da sepultura, o tocador de gaita de fole ficou parado como se fosse feio e segurasse um ganso na mão. Soprou para dentro e para fora, num gemido que puxava o ar transformando-o na melodia assombrosa de “Preciosa Graça” [Amazing Grace]. O vento revirava as folhas de outono. Postes de alumínio alugados produziam clangor com a corda e a lona. Eu ouvia o som de flores jogadas em cima do caixão. Era um sepultamento militar, bandeira dobrada e dada à família, rifles armados para uso; os tiros de morte chocando o silêncio para honrar uma vida. Relembro como parecia estranho encontrar homens e mulheres adultos, suspirando alto e dolorido. Ondas de fungadas, como a maré, iam e voltavam em ondas mansas. Os chavões se apressavam para pôr fantasias sobre os silêncios desajeitados. Perguntas sobre Deus ou sobre a vida eram sussurradas embaraçosamente ou em repentina raiva. Surgia frequentemente a risada nos lugares mais estranhos para um consolo, o que não é nada estranho.

Pat havia morrido. A sua irmã começa a trazer uma história aos meus ouvidos.

“Pat costumava encontrar gatos perdidos e levá-los para casa”, diz ela.

Dou uma risadinha com essa introdução surpreendente. Ela continua: “Pat não somente dava um lar para esses gatos; ela punha roupa nos gatos danados —roupa de bonecas!”

“Verdade?” pergunto. “Ah, sim!”, ela diz. Começa a rir enquanto pensa no coração sobre tempos mais felizes. Eu também começo a rir.

“Então, ali estava a Pat, com todos aqueles gatos vestidos, fazendo pose para uma fotografia, e Pat sorrindo de orelha a orelha!”

Agora nós dois estamos rindo e dependendo dos lencinhos para manter o decoro.

“Ah meu, essa era a Pat! Com certeza era uma maluquinha!” Rimos por mais um momento e então respiramos fundo para uma descida repentina. A contadora de histórias agora olha para longe e fica quieta no silêncio. Sem me encarar, ela diz: “Vou sentir muita falta dessa Pat”.

Ouvir essas histórias de lembranças é parte do seu trabalho. Quando alguém conta a respeito de um ente querido falecido, pergunte ternamente qual era o nome da pessoa. Demore aqui e escute. Quando cumprimentar alguém que esteja de luto, não precisa dizer: “Como vai você?” ou “Como foi seu dia?” Tal pergunta força a pessoa na confusão de colocar realidades inexplicáveis numa só sentença. Se pararmos e pensarmos nisso, é provável que já saibamos como essas pessoas enlutadas estão passando. Em vez disso, cumprimentamos simplesmente dizendo algo como: “Estou grato por encontrar você; tenho pensado muito e estou orando por você” ou, “Você é amado por todos”. E normalmente não perguntamos: “O que posso fazer por você?” A pergunta coloca o enfermo em posição de dirigir o seu horário e inventar um monte de tarefas. Melhor é oferecer algo específico que permita uma resposta sim ou não, como: “Posso lhe trazer café da manhã?” ou “Você gostaria de descansar hoje?” ou “Seria de ajuda se eu pegar a sua filha na escola amanhã?” Essas coisas específicas também nos ajudam a resistir à tentação de perguntar o que podemos fazer, não por amor deles, mas de nós, porque sentimo-nos sem saber o que fazer e queremos fazer algo diferente. Conheço bem essa tentação. Mas se eles pudessem, também fariam as coisas de um jeito diferente. Ali estamos nós, cada qual olhando junto para Jesus no silêncio confuso.

Em seu sermão, portanto, você fala da calma de ter escutado e amado. Você diz algo como: “Entendi que Pat estava sempre procurando gatos sem dono”.

Com isso, aqueles que a amavam dão uma risadinha com as lembranças.

“Será que ouvi certo que Pat não somente dava um lar para esses gatos como também os vestia com roupas de boneca?”

Agora os risos de amor jorram por entre as lágrimas de luto daqueles que a conheceram. Eu também sorrio com gratidão. As risadas duram um pouco. Depois as lágrimas recuperam o seu lugar, e o silêncio volta.

“Sabe, quando penso em Pat querendo dar um lar e roupas aos gatos eu lembro-me de uma história que Jesus contou sobre ovelhas espalhadas e perdidas. Ele disse que Deus era como o pastor buscando encontrá-las para trazê-las para casa. Obrigado por ter me contado esta história sobre Pat e seu amor por ela. Isso me lembra de minha necessidade de ser encontrado e de ganhar um lar. Todos nós precisamos ser encontrados. Antes de ficar doente, Pat compartilhou como ela esteve perdida todos esses anos, mas que finalmente Jesus a encontrou. Ele pode nos encontrar também e nos levar para o lar”.

Chamado de oração para os presbíteros

Está alguém entre vós doente? Chame os presbíteros da igreja, e estes façam oração sobre ele, ungindo-o com óleo, em nome do Senhor (Tg 5.14).

Nas igrejas que tenho servido no decorrer dos anos, às vezes separamos um dia de oração. Junto a essas reuniões públicas regulares, de quando em quando vem um chamado, e nos reunimos em uma sala ao lado de um leito de hospital.

“Chame”, diz Tiago. Suas palavras trazem à mente os ossos tortos e olhos cegos, aqueles que ficam assentados em esteiras, esquecidos, no lado das estradas. Notícias alcançavam esses seres humanos de pulmões chiando e pele cheia de chagas. “Jesus está chegando!”, ouviam dizer. “Jesus está se aproximando!”

Abruptos em encontrar sua voz, essas pessoas com tosse de sangue tentavam falar uma palavra ou se arrastar de joelhos no chão de pedregulhos para tocar um fio da roupa de Jesus. De qualquer modo, mãos trêmulas ou artríticas lutavam com seus dedos para levantar a bandeira do seu coração, clamando: “Filho de Davi, tem misericórdia de mim!” Ele responde, e aprendemos que os enfermos possuem voz. O seu chamado não se assemelha a nada de incômodo ou constrangedor. Na mente de Jesus, os que estão mentalmente perturbados não são empurrados para as margens. Não é de surpreender, portanto, que orar pelos enfermos esteja afirmado na descrição do trabalho do presbítero feita por Tiago. Os presbíteros não são Jesus. Mas estes que retornam são pastores dados para refletir aos outros e se assemelhar com a presença, ensinamentos, tom e expressão do verdadeiro e bom Pastor, o qual conhece as suas ovelhas pelo nome (Jo 10.3). De algum modo, elas ouvem a voz de Jesus na nossa voz.

Às vezes há dois de nós. Outras vezes mais, juntos com amigos e membros do grupo dos lares que entram no quarto, pé ante pé, nervosos por amor daquele que está sofrendo. Um dos presbíteros, de dia um zelador, estende suas mãos manchadas de sujeira ao bolso para o frasquinho de óleo. Ele o entrega ao pastor. O óleo foi comprado numa livraria local. Tinha cheiro de incenso. Mas qualquer óleo serve, porque é como a sujeira nas mãos do zelador. A sujeira não é o trabalho, mas sinal de que o trabalho foi feito. Tanto a terra quanto o óleo não têm defesa contra o sabão. Ambas soltarão seu apego da pele e serão lavados, escoando pela pia ou no tanque naquela noite. Mas, embora desapareça o símbolo, o trabalho que ele revelou permanece. Como na unção do Antigo Testamento, ocorreu uma separação.

O trabalho é feito “em nome do Senhor”. Aqui não existe feitiço ou encantamento. É possível recitar as palavras “em nome de Jesus” e ainda conhecer bem pouco do que significa orar no nome do Senhor. Falar os nomes importantes é uma ferramenta usada pelos arrogantes para mostrar aos outros os seus recursos, amizades e conexões. Entre os humildes, referir-se aos nomes importantes raramente é usado, exceto quando surge uma necessidade pela qual não existe outro remédio. A oração em seu nome é uma declaração de que só Jesus possui a sabedoria, os recursos, a provisão e o poder para governar aquilo que nos fere. Mesmo nosso bom uso da medicina e nossa ativa gratidão por bons médicos e enfermeiros são como sapatos, que em última instância são ajuntados e mantidos pela costura e pelos laços de Deus.

A Oração da Fé Em algum ponto, um dos presbíteros explica brevemente essas coisas ao que os chamou. Então, quem chamou expressa, se puder, o que está pedindo de Jesus. Em meio a chinelos de dedo ou sapatos de grife, hálito de café e fungadas, um presbítero põe um pouquinho de óleo no dedo e toca a testa do enfermo, orando em silêncio ou com palavras de misericórdia (Tiago não oferece nenhuma diretiva quanto a isso). Se for com palavras, pode soar, em substância, assim: Bárbara, Jesus pertence a você. Você pertence a ele. Só ele pode salvá-la e consertar a você. Você foi criada por ele. Por ele é que foi resgatada. Por ele temos acesso ao trono de graça. Você é filha do Rei. Levamos o seu caso até ele. Seu trono é um trono de graça. Vamos até ele nessa hora de necessidade.

Em seguida, as orações de fé começam. Diferentes anciãos oram, calmamente e em voz alta, cada um na sua vez ou todos de uma vez (segundo o costume cultural), assim como outros presentes oram ao lado. A oração da fé não tem tom de voz ou uma postura corporal necessária. Deus nos ouve não porque somos fortes ou mansos. Não há nenhuma quantidade ou tipo de palavras. Deus nos ouve não porque usamos palavras suficientes ou grandiosas. A fé é “a certeza de coisas que se esperam, a convicção de fatos que se não veem” (Hb 11.1). Em Jesus, os presbíteros oram com segurança e convicção, ainda que tenham apenas um grão de mostarda de ambos.

Mas por que a fé tem de atender às orações dos presbíteros? Isto não é uma oração de tipo preparação para a morte. O presbítero fala ao Senhor como quem vê um futuro em Jesus para aquela pessoa enferma. Existe outro lado para essa doença. Ela não terá a última palavra! “E a oração da fé salvará o enfermo, e o Senhor o levantará; e, se houver cometido pecados, ser-lhe-ão perdoados” (Tg 5.15).

Crer que o Senhor reina sobre a lama que nos suja e dizer uma palavra que nos cure é um desafio para os presbíteros. Às vezes, com olhos humanos vemos naquele momento somente homens, mulheres e crianças que estão tendentes à doença, assombrados por maus pensamentos ou com o cérebro deteriorado. E quando nossa porção tangível do sagrado é um pouquinho de óleo que compramos por cinco reais e noventa e cinco centavos na rua debaixo, pode parecer que as palavras caem surradas do céu em um ataque relâmpago de doenças. Afinal de contas, nós que estamos orando acabamos de comer um hambúrguer com fritas no carro a caminho daqui do hospital.

Mas “Elias era homem semelhante a nós, sujeito aos mesmos sentimentos, e orou, com instância, para que não chovesse sobre a terra, e, por três anos e seis meses, não choveu”, Tiago asseverou. “Muito pode, por sua eficácia, a súplica do justo”, ele nos assegura (Tg 5.16–17). Nossa fé não está em nossas palavras, emoções, agitação inquieta ou em nossa natureza frágil e limitada. Nossa fé está no Senhor, cuja vontade, sabedoria e poder são capazes de sustentar os nossos entes queridos em seu sofrimento ou então livrá-los parcialmente ou totalmente desse sofrimento.

Tenho orado desta forma por muitas pessoas no decorrer dos anos (embora não tantas quantas eu poderia ter feito, devido a meus temores iniciais sobre o mau uso da fé dos curandeiros e de tais textos). Porém, na maioria dessas ocasiões, quando eu oro desta maneira, como um presbítero, a cura pela qual orei não veio. Parece-me que oramos de um ou de outro jeito: fé que Deus pode nos consertar com uma palavra em um instante, fé que Deus pode nos sustentar por sua graça, ainda que não tire nosso sofrimento (Lc 22.42) ou nos deixe com nossa doença (2Co 12.8–9).

Confessar e perdoar

Não é de se maravilhar que Tiago mude de ênfase da cura do corpo para a cura da alma.

A oração da fé salvará o enfermo, e o Senhor o levantará; e, se houver cometido pecados, ser-lhe-ão perdoados. Confessai, pois, os vossos pecados uns aos outros e orai uns pelos outros, para serdes curados. Muito pode, por sua eficácia, a súplica do justo (Tg 5.15–16).

Conquanto a doença possa indicar, em raras ocasiões, a presença de um pecado como uma causa (1Co 11.30), na maioria das ocasiões a doença não tem nada a ver com um pecado individual (Jó 2.1–7; Jo 9.1–3), mas representa o fato de que o Éden foi quebrado e o céu ainda não chegou.

Contudo, quando a doença grita na nossa cara, nos afligindo como um brigão, e ninguém vem nos socorrer, ali, na lama, começamos a ver coisas nos pensamentos e emoções de nosso ser interior que não percebíamos existir — coisas feias, que revelam que não somos tão justos quanto pensávamos ser. Vemos ainda mais a nossa necessidade de um salvador. Começamos a confessar. A doença de corpo e de mente joga um tijolo no espelho de nossa imagem perfeita. Vemos nosso reflexo esmiuçado e encontramo-nos mais carentes de graça e do mérito de Jesus do que podíamos imaginar quando nossas juntas e músculos funcionavam bem.

Não vai demorar muito. Na verdade não. É provável que eu também, com o tempo, fique à beira do caminho, afastado dos limites da comunidade, clamando: “Filho de Davi, tem misericórdia de mim!” Esperançoso, eu imagino algum jovem pastor sentindo-se um tanto desajeitado, junto a um presbítero com hálito de café e suas Bíblias vindo ao lado de minha cama em nome de Jesus. Eu os escutarei pedindo a meu Senhor em meu favor. Sua presença, empatia, seu bom toque, e sua tenacidade em apreender aquilo que eu não posso ver, sua graciosa recepção de minhas recémdescobertas confissões sobre a minha verdadeira necessidade de perdão me conduzirão a Jesus. O trono de graça aguarda. Esses ossos adoecidos sobre o sofá ou cama em que estou deitado não poderão me impedir disso.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -16;

  -- 13 | Cuidando dos pecadores (reaproveita a aula de ordem 17: preserva o progresso)
  update public.aulas
  set titulo = $t$13 | Cuidando dos pecadores$t$,
      ordem = 17,
      conteudo =
$conteudo$Esses olhos—buracos de uma máscara.

– John Updike

Domingo de manhã, havia um homem que regularmente dava “ósculo santo” a diversas mulheres na congregação, cumprimentando-as à porta do culto matinal. Com o tempo, sussurros de reclamação começaram a encher os meus ouvidos. Em especial, duas mulheres final e desajeitadamente descreveram esse beijo como não parecendo nada com o que é santo.

No Novo Testamento, dois tipos de toque físico são colocados em contraste brutal. O primeiro é o beijo de Judas no rosto de Jesus. Essa espécie de beijo usa erradamente o toque físico para consumir ou preservar os próprios desejos, lascívia ou agendas egoístas (Lc 22.47–48). Usa erradamente a adultos e crianças sob guisa de “ósculo santo” em nome de Deus. Em contraste, o “ósculo santo” do Novo Testamento vê um jeito da comunidade cristã recuperar, em Jesus, a maneira pela qual os seres humanos originalmente foram feitos para tocar uns aos outros.69 Entre nós, poucos conhecem por experiência o que significa tocar ou ser tocado de modo santo. O toque profano já foi nosso mentor e quebrou a maioria de nós.

Essas duas espécies de toque formam um retrato das duas espécies de cuidado pastoral, não somente para os doentes como também para os pecadores. Quando falei de meu desejo pelo ministério, e Jesus me perguntou o que eu queria que ele fizesse por mim, jamais teria dito: “Por favor, ensiname a cuidar dos enfermos e dos pecadores com a minha vida. Por favor, capacita-me a fazê-lo de tal forma que o teu amor por ambos seja imitado em meus caminhos”.

Disciplina e pecado

No exame oral para meu ministério, eu estava diante de cinquenta presbíteros que me perguntaram: “Qual o propósito da disciplina da igreja?”

Recém-saído do seminário, e de acordo com minha tradição teológica, respondi que “o propósito da disciplina eclesiástica é elevar o caráter e ensino de Jesus e proteger o bem estar do rebanho”.

Depois disso, um pastor gentil e experiente chegou até mim no corredor e perguntou se ele poderia sugerir uma resposta mais plena. “Existe um terceiro propósito para a disciplina na igreja”, disse ele bondosamente. “Esse terceiro propósito tem a ver com o bem-estar daquele que pecou. Isso é uma boa notícia para qualquer um entre nós”.

“Certo!”, eu disse. “Eu havia me esquecido disso”. Com o passar dos anos, tenho entendido que quando alguém é pego no pecado, ainda é possível que nos esqueçamos deste propósito.

Relacionar-se com os endurecidos

Às vezes nossa resposta inflamada surge porque o pecador defende o seu pecado. Por quase dois anos eu tentei me reunir com o homem que dava “ósculo santo” profano. Tivemos de pedir que ele parasse. Não muito depois, apareceu um caso amoroso, e seu casamento estava em frangalhos no escuro. Eu fiquei sem jeito e limitado, mas apelei a ele com duas mensagens. Primeiro foi a mensagem de que faríamos todo o possível para andar com ele e sua família através deste terrível sofrimento, para testemunho nos anos vindouros que Deus lhe daria em Jesus. A segunda mensagem foi que sua recusa contínua em admitir suas ações contrárias ao evangelho colocaria em questionamento a sua correspondência com Jesus e exigia que nós tristemente disséssemos isso a ele. Eventualmente, ele nos escreveu isto:

A não ser que vocês considerem as leis dos homens como autoridade superior às leis de Deus, o adultério começado em novembro de 1979 terminará em 2000. Minha esposa não é minha esposa, Lucas 16.18. Em referência à sua reunião, não os considero mais a minha igreja. [...]. Os jovens não têm a mínima importância na sua igreja, ninguém, durante os últimos sete meses, tem estendido a mão a meus filhos. A resposta de Jesus ao que seria o maior mandamento foi: “Amarás o teu próximo como a ti mesmo”, Mateus 22.39.

Quando alguém se recusa a admitir que está errado (incluindo nós), todo o raciocínio para justificar o erro é empregado. No bilhete, esse homem sadio, biblicamente respeitado e querido, na verdade chamou seu casamento de vinte e um anos de adultério. Arrazoou que, uma vez que seu casamento foi feito por um juiz de paz em vez de um pastor, não era reconhecido por Deus. Na sua cabeça, a Bíblia apoiava e recomendava que ele tivesse um caso e abandonasse sua esposa. Alguém que use a Bíblia desse jeito pode incendiar nossa impaciência.

Também podemos lutar porque, quando alguém recusa admitir o erro, assume terreno moral altaneiro e acredita ser mais justo que as outras pessoas. Neste caso, ele nos atacou como liderança fraca, enquanto ele mesmo, como líder na igreja, estava tendo um caso e defendendo o mesmo pela Bíblia. Ele nos atacou por não cuidar de seus filhos enquanto ele, pai, estava enganando a mãe deles e separando-se deles. Ele via ciscos em potencial em nossos olhos, enquanto a trave permanecia nos olhos dele sem ser detectada.

Em tudo isso nós lutamos também porque simplesmente pôr a culpa em outrem dói. Também queríamos que nosso grupo de jovens estivesse melhor. Estendíamos a mão à sua mulher e filhos, mas nos sentíamos terrivelmente incapazes. Oramos e tentamos — fazíamos refeições, íamos tomar café, mandávamos bilhetes. É difícil levar flechadas de alguém que está atirando em todo mundo a seu redor e precisa, ele mesmo, de ajuda.

Começando conosco mesmo

Entrar no quebrantamento de outro pode nos deixar expostos. Talvez estejamos com medo de nossa esposa nos deixar. Talvez sejamos filhos de um pai que deixou nossa mãe por outra mulher. Talvez tenhamos pensado secretamente sobre o desmoronamento de nosso próprio casamento e estamos de olho na mulher sentada dois bancos à frente na igreja a cada domingo. Nossa reação emocional pode agarrar-nos pelos cabelos. Vê-lo faz com que olhemos coisas em nossa própria vida que preferíamos não enxergar.

Alguns entre nós nos tornamos passivos. Acendemos o pavio mais comprido e corremos para nos proteger atrás de abrigos distantes. Detonamos pecadores pela negligência em vez de por nossos atos — o que omitimos e não o que cometemos. Dizemos que nosso afazeres estavam em outro lugar. Arranjamos a vida como líder de ministério para viver a mentira de jamais ter de dizer a ninguém: “estou arrependido”.

Não é de surpreender que Paulo dissesse: “Guarda-te para que não sejas também tentado” (Gl 6.1). Você já se escutou dizendo: “Eu jamais faria isso?” Existe nessa sentença uma armadilha.

Quando o meu amigo pastor tirou sua própria vida, várias pessoas nos meses seguintes confessaram que pensavam em suicídio. Alguém cometeu o ato. A igreja quebrada teve de andar fatigada e entorpecida através de tudo isso novamente.

Quando o meu primeiro casamento estava implodindo e eu lutava desesperadamente para obter ajuda, havia um homem que repetidamente me aconselhava, dizendo que o divórcio não era tão mal assim. Mais tarde fiquei sabendo que o casamento desse homem estava com profundos problemas. O seu conselho, em vez de ser bíblico, estava manchado com as suas próprias tentações.

Eu me lembro de um homem que compartilhou comigo os sites de pornografia que ele usava. Ele o fez como um ato de confissão para “trazer à luz”. Mas os nomes dos endereços da web me tentavam a clicar neles nos próximos três dias. “Porque, se alguém julga ser alguma coisa, não sendo nada, a si mesmo se engana. Mas prove cada um o seu labor e, então, terá motivo de gloriar-se unicamente em si e não em outro” (Gl 6.3–4).

A situação inevitável

O líder mencionado anteriormente acabou com o seu casamento e continuou com a sua nova amante. Não foi uma espécie de pecado privado, que pudesse ser tratado apenas de modo particular. Seu pecado era público, e todo mundo estava observando. Ele era nosso amigo. Estávamos profundamente sentidos. Alguns queriam ação rápida, com veemência. Nós resistimos a essa ideia. Se fôssemos errar no caso, erraríamos por dar tempo demais para que ele voltasse à razão. Quase dois anos de apelos, andando junto dele e tentativas de ajudá-lo haviam passado e não adiantaram nada. Não tivemos sucesso em ganhar nosso querido irmão (Mt 18.15). Ele se recusou a escutar (v. 17). Tivemos de “considerá-lo como gentio e publicano” (v. 17).

O que isso significava? Eu não sabia. Procurei nos Evangelhos para ver como Jesus se relacionava com os gentios e publicanos. Do seu jeito, ficava claro que ainda amaríamos esse homem. Diríamos “Como vai?”, e comentaríamos o tempo se o encontrássemos no shopping. Talvez ele dissesse: “Será que poderíamos nos encontrar para tomar um café?”, e responderíamos: “Claro, mas o que está em minha mente é a situação do seu coração. Quando nos encontrarmos, poderemos falar também sobre isso?”, “Não”, ele poderá responder. “Está certo”, diríamos. “Eu oro por você e anseio por seu bem. Qualquer hora que você quiser conversar sobre as coisas, ficarei feliz em tomar café com você. Mas, sinceramente, eu também preciso de Jesus. E ainda tenho esperança de que você admita que o que fez com sua família não é o que Jesus deseja para nós, e que você queira voltar aos braços da graça de Jesus”.

Quando fala sobre o pecador endurecido que se chama de seguidor de Jesus: “Com ele não comais”, Paulo não nos convida a desprezar maldosamente ou a desconsiderar ou maltratar essa pessoa. Uma refeição juntos seria como um presente sobre nossa mesa se essa pessoa visse a sua necessidade de perdão. Ansiamos por isso, mas esperamos. Nosso amor, anseio, bondade e orações por ele não tiram a realidade de que em Jesus essa pessoa agora está identificada “como se” não fizesse mais parte da comunidade dos crentes. Nossa comunhão não é a mesma que antes nem o que ela poderia ser.

Reconhecemos que seu casamento provavelmente (se bem que não certamente) está perdido para sempre. Mas, que alegria e liberdade significariam, se ele simplesmente dissesse: “Sei que eu estava errado. Eu preciso perdoar, ser perdoado e mudar”. A comunidade poderia então se juntar a ele com lágrimas, mas também alegre esperança!

Ele ainda poderia abençoar os seus filhos com instrução sábia. Ele poderia remover a loucura — a ideia de que Jesus diga que está certo aos papais deixarem as mamães por outra mulher, a noção que tal ensino põe na cabeça delas sobre quem são como filhas que um dia se tornarão mulheres. Essa clareza tomaria as mãos de suas filhas para que elas possam andar por caminhos mais seguros em seu futuro.

Ele ainda poderá dizer à sua ex-esposa: “Eu estava errado. Por favor, me perdoe”. Pode ser que nunca mais voltem à posição de amizade. Mas a simples admissão pode retirar os raios e trovões das nuvens de tempestade que cortinam o céu de seus cuidados mútuos de pai e mãe.

Mais importante, a honra de Jesus e os seus ensinamentos encontrariam clareza renovada em sua vida pública para todos quantos o observassem. Em seu coração, diante de Deus, ele estaria reconciliado. Todo aquele esforço por torcer os versículos bíblicos, inverter o plano moral mais alto e lançar a culpa nas outras pessoas pode se acalmar. Os músculos tensos de cada minuto poderão relaxar. Os corações que batem a cada segundo podem passar a ir mais devagar. Ser novamente “ganho” em Jesus. Defender o amor ao próximo e encontrar repouso para a alma — tais bênçãos revelariam o terceiro propósito da disciplina, produzindo seu doce fruto em uma vida comum.

Relacionar-se com os amolecidos

Surpreendentemente, também podemos lutar para nos relacionar, não somente com os resistentes, mas também com aqueles que admitem seus erros e ativamente procuram o perdão. De começo, queremos que a pessoa que pecou contra nós ou contra nossa comunidade sinta dor. Se ela confessa rapidamente demais seu erro, achamos injusto. Nossas emoções estão apenas começando a se mexer. O que fazemos com elas se não pudermos lançá-las contra o ofensor?

Quando alguém for realmente transformado pela graça, isso requer que nós também mudemos, não somente aquele — e nós não gostamos disso. Imagine um marido e sua esposa. O marido tem lutado contra a ira durante anos. Ela tem orado por ele. Depois de todo esse tempo, Jesus começa a mudá-lo. Durante a sua próxima briga, ela o trata como se ele estivesse expressando sua ira com falta de amor como sempre fez. Mas o problema é que, na verdade, ele a está amando bem. De repente, é ela que extrapola os limites pelo jeito que o está tratando no momento. Agora, é ele que está ferido. Ela é que precisa pedir perdão. A oração por ele, agora respondida, convida-a a que também mude.

Mas ela não gosta disso. Por muitos anos, ele expressava sua ira. Agora ela deveria ter licença para fazer o mesmo! Instantaneamente, ela é tentada a remover as boas-vindas à oração respondida. Faz sentido. Afinal de contas, ela não pode mais falar mal de seu marido do jeito que sempre fez. Seus pedidos de oração por seu marido no grupo de mulheres têm de mudar. Ela não tem mais razão para evitar prestar atenção aos seus próprios erros. Todo esse tempo ele estava sempre na defensiva e era impaciente. Agora, ela descobre que ela está na defensiva e é impaciente — não porque ele é maldoso, mas porque ele é gracioso!

Às vezes, ir juntos a um novo lugar de liberdade no evangelho é um lindo sonho, mas é assustador de se assumir.

Ouça como Paulo escreve àqueles que confessaram:

Porque, no meio de muitos sofrimentos e angústias de coração, vos escrevi, com muitas lágrimas, não para que ficásseis entristecidos, mas para que conhecêsseis o amor que vos consagro em grande medida (2Co 2.4).

Sua postura está cheia de lagrimas, cheia de anseio e preocupação pelo bem-estar deles. Eles são queridos para ele. O seu propósito é expressamente designado, não para feri-los, mas para fortalecer seu senso de como são amados naquilo que ainda têm para aprender e confrontar.

De fato, Paulo inicialmente lastimou ter escrito para eles, temendo tê-los ferido injustamente (2Co 7.8). Ele esclarece sua gratidão por eles não terem sido feridos de modo injusto. “Agora, me alegro não porque fostes contristados, mas porque fostes contristados para arrependimento; pois fostes contristados segundo Deus, para que, de nossa parte, nenhum dano sofrêsseis” (2Co 7.9).

A postura de Paulo não é nada semelhante ao pai errado que bate muito na criança até ter certeza de que ela esteja ferida bastante pelo pecado que cometeu, como se forçar alguém a sentir a convicção do pecado seja tarefa dele e não do Espírito Santo (Jo 16.8–9). Ele não quer que seu filho esqueça do que fez. Isso se traduz em sempre ter de vestir a sobrecapa cinzenta de ter pecado e nunca poder vestir as cores alegres do perdão.

Em contraste, Paulo ressalta que, porque aquele que foi pego em pecado está realmente sendo transformado, a comunidade também tem de agir de acordo com o que diz a Palavra. “Basta-lhe a punição pela maioria. De modo que deveis, pelo contrário, perdoar-lhe e confortá-lo, para que não seja o mesmo consumido por excessiva tristeza. Pelo que vos rogo que confirmeis para com ele o vosso amor” (2Co 2.6–8).

O castigo para aquele que se arrependeu não deve continuar para sempre. Respondemos à tristeza excessiva do coração arrependido pelo evangelho. “Perdoar, confortar, reafirmar seu amor”, é o que Paulo implora que seja feito.

O fato de ter sido perdoado não justifica a estultícia nem remove todas as consequências do erro. Não há como uma pessoa que odeie o fato de ter sido molestador, mesmo tendo sido perdoado, receber a responsabilidade de cuidar do berçário. O seu lugar na comunidade requererá que ele empregue seus dons de outras formas.

A amizade nem sempre segue ao perdão entre aqueles que foram vitimados. Embora sejamos capazes de perdoar pela graça, a pessoa que foi prejudicada talvez frequente uma igreja diferente da pessoa que a feriu ou vice-versa. É raro para o perdão ter um final feliz, de conto de fadas, no momento, mas ele nos conduz a um final redentivo para todos os envolvidos — um final que o céu curará completamente.

Mas por que isso tem importância? Porque, de acordo com Paulo, a maneira como tratamos o pecador arrependido agora é um ato de batalha espiritual. Estas situações nos “provam” com respeito à extensão de nossa obediência (2Co 2.9). Obedecer ao perdoar e reafirmar nosso amor pelo pecador arrependido é necessário para a luta contra os “desígnios” de Satanás na comunidade (2Co 2.11). É Satanás e não Deus que inflige tristeza excessiva sobre a pessoa arrependida, junto com a ausência de amor, negligência de consolo, e castigo que nunca acaba. Nesta altura, Paulo nos relembra, portanto, que ao tratar de disciplina e pecado, somos tentados a refletir uma aproximação diabólica mais do que divina.

Discernir as tristezas

Acenda um fósforo em uma fogueira no acampamento, e tanto a gasolina quanto o jornal pegarão fogo. Ambos são capazes de iniciar o fogo para fazer o jantar. Ambos são capazes de destruir o acampamento todo. Mas um deles é volátil e não é digno de confiança.

Do mesmo modo, tanto o diabo quanto Deus falam sobre o pecado. Mas seu impacto difere de modo dramático. Conquanto o Espírito Santo nos convença do pecado, nunca o Espírito Santo é identificado como o acusador. O modo de Deus confrontar o seu povo em seus pecados é o que Paulo chama de “tristeza segundo Deus” (2Co 7.9–11).

Primeiro, a tristeza segundo Deus não produz apenas lágrimas ou novas resoluções. Na verdade, produz arrependimento — isso significa um verdadeiro ponto de virada. A mudança é terna, é nova e incompleta, mas é real.

Segundo, a tristeza segundo Deus leva a pessoa de volta a um novo conhecimento da provisão da salvação — o mérito e a misericórdia de Jesus. As suas sandálias, a cruz, o túmulo vazio, sua presente intercessão e defesa — fazem um feliz reencontro no ser da pessoa. A pessoa sabe que no final, foi contra Deus que ela pecou e a Deus ela volta quando vem para casa.

Terceiro, a tristeza segundo Deus propõe mandar embora o remorso: “Porque a tristeza segundo Deus produz arrependimento para a salvação, que a ninguém traz pesar” (2Co 7.10). Em contraste, existe uma espécie de sofrimento pelo pecado que nada tem a ver com Deus. No decorrer dos anos, tenho observado que aqueles apreendidos do pecado da mentira, por exemplo, exigem energia e tempo mais ativos — especialmente se a mentira tem se tornado o seu estilo de vida.

Por que é assim? De um lado, uma longa vida nesse pecado dá à pessoa uma forte habilidade com a manipulação. Essa pessoa é adepta às lagrimas, citação dos versículos certos, dar olhares significativos e dizer aquilo que a pessoa à sua frente quer ouvir. É fácil concluir que alguém tem tristeza piedosa quando, na verdade, ela sente tristeza por ter sido pega e está simplesmente tentando fazer o que precisa para tirar todo mundo de cima das suas costas, para que tudo volte ao normal.

Por outro lado, quando a graça começa a ensinar de novo ao mentiroso como amarrar os seus sapatos, como com qualquer outro pecado e pecador, a mudança frequentemente não acontece tudo de uma só vez, mas em acessos e aos trancos e barrancos. Isto quer dizer que a pessoa mentirosa exige tempo para ver quão profundamente ela mente e como as suas palavras giram saturando sua vida diária. Por esta razão, uma pessoa a quem Jesus esteja transformando poderá contar a verdade numa mesma conversa em que mentiras não percebidas também estejam presentes. É fácil concluir que não há mudança, quando, de fato, uma poderosa mudança está ocorrendo. Só que leva muito mais tempo do que desejaríamos.

À luz de tudo isso, o ponto que Paulo destaca é de grande valor. Uma tristeza autogerada, que o diabo aproveita para aumentar, “produz morte”, diz Paulo (v. 10). Isto é, derrama lágrimas, mas não converte; faz resoluções e cita versículos. Mas não descansa somente em Jesus nem se submete a Deus.

O pesar ainda conta a história na primeira pessoa e no presente, como se ainda estivéssemos naquele momento. Aconteceu anos atrás, mas as pessoas que estão ouvindo têm a ideia, vinda de você, de que tenha acontecido recentemente.

O pesar também guarda segredos. Colocamos a tampa sobre ele e não contamos a ninguém, a fim de preservar nossa imagem. Aos poucos isso nos corrói. Mas a tristeza segundo Deus eventualmente vira nossos segredos pecaminosos em testemunhos da graça.

Por onde começar?

Em Gálatas 6 Paulo diz: “Irmãos, se alguém for surpreendido nalguma falta” (v. 1). Por “alguém”, (qualquer um), Paulo se refere no contexto àqueles que professam seguir a Jesus. Ele expõe isso em outro lugar:

Já em carta vos escrevi que não vos associásseis com os impuros; refiro-me, com isto, não propriamente aos impuros deste mundo, ou aos avarentos, ou roubadores, ou idólatras; pois, neste caso, teríeis de sair do mundo. Mas, agora, vos escrevo que não vos associeis com alguém que, dizendo-se irmão, for impuro, ou avarento, ou idólatra, ou maldizente, ou beberrão, ou roubador; com esse tal, nem ainda comais. Pois com que direito haveria eu de julgar os de fora? Não julgais vós os de dentro? Os de fora, porém, Deus os julgará. Expulsai, pois, de entre vós o malfeitor. (1Co 5.9–13)

Primeiro, de acordo com Paulo, nossa tarefa não é nos separar ou julgar os nossos vizinhos não cristãos. Para fazer isso teríamos de sair do mundo (muitos de nós entendemos isso muito erradamente).

Segundo, quando Paulo diz: “em alguma falta”, nosso coração é sondado, porque ele inclui toda espécie de coisa maculada com a qual podemos nos deparar no armário de outra pessoa.

Antes do ministério vocacional, trabalhei com as vítimas de crimes no município de Blackford, Indiana. Eu estava despreparado para os tipos de transgressões que existiam fora de minha janela. O trabalho abriu as cortinas do mundo — assassinato, abuso sexual, violência doméstica, abuso infantil, uso de drogas. No ministério pastoral, o fato de que essas questões ocorram também nas igrejas, muitas vezes, me pegou desprevenido. Um pastor da mocidade que tem sexo com as meninas do grupo de jovens, um homem que forja a morte do filho para seus colegas de trabalho, uma mulher que leva sua família à falência ao mentir habitualmente e manipular os fundos do banco. As palavras de Paulo: “qualquer transgressão” prendem nossa atenção e localizam nosso trabalho pastoral.

Terceiro, Paulo esclarece que entrar na confusão da recuperação de um pecador que foi pego em seu pecado está fora dos limites para a maioria de nós. Como isso é diferente! Em minha experiência de igreja, muitas pessoas tomam sobre si e acreditam ser o seu papel confrontar aquilo que enxergam em qualquer pessoa que veem. Mas Paulo diz de outro modo. Somente aquele “que é espiritual” deverá restaurá-lo (Gl 6.1)

Por “espiritual”, Paulo evidencia o contexto dos versículos anteriores com os quais ele tratou do fruto do Espírito em contraste com as obras da carne. Se intentamos ou nos encontramos confrontando um pecador que foi “pego no ato” com o uso de ferramentas de inimizade ou contendas ou estouros de ira, por exemplo, então nós não somos um daqueles que deverá andar com o pecador que foi surpreendido. Outra pessoa que seja “espiritual”, isto é, entregue à graça de envolver o pecador com amor, paz, paciência, bondade e autocontrole, tem essa tarefa, porque esse pecador deve ser restaurado “com espírito de brandura” (v. 1).

Além do mais, estamos tratando de uma transgressão ou pecado. A disciplina da igreja (como ocorre com qualquer espécie de disciplina, a de pais com seus filhos por exemplo) tem a ver com pecados. Isso quer dizer que nós não podemos disciplinar alguém por ter opinião diferente da nossa, estilo de ensino diferente, por expressar um temperamento diferente do nosso, não fazer o que queremos que faça ou não fazer algo quando achamos que deve ser feito.

Nem toda fraqueza ou luta advém do pecado. Imagine uma mãe cujo filho derramou o leite. Pecado não é a única causa possível para o leite derramado, e, portanto, a mãe não tem razão para tratar a criança como se ela estivesse em enroscada. Para começar, as crianças (como os adultos) têm limites. Um garotinho de dois anos não consegue fazer o que seu irmão de cinco anos consegue. Uma criança terá de fazer cinco anos antes de ter dez anos de idade.

Assim como não disciplinamos uma aluna de primeiro ano por ela errar em um problema de matemática de quinta série, um garotinho de dois anos de idade pode derramar seu leite porque suas mãos e coordenação ainda não são aquilo que serão no futuro.

As crianças não têm apenas limites; elas também sofrem acidentes. Uma criança pode simplesmente ter tentado passar as ervilhas para a pessoa a seu lado na mesa, e, sem malícia e sem querer, derrubou o leite. Neste caso, nossa frustração é problema nosso, para ser levado diante do Senhor, e não algo pelo qual disciplinamos legitimamente nosso filho. Os acidentes podem ter maiores consequências quando envolvem arremessar uma bola de beisebol ou dirigir um carro. Um motorista adolescente que, enquanto dirige dentro do limite de velocidade, não viu a criancinha correr de trás de um carro estacionado, terá de enfrentar o pesadelo de uma situação que não escolheu. Aqueles que cuidam dele mantém por ele a sua consciência de que há uma diferença entre ele e alguém que tente dirigir temerariamente ou até mesmo premeditando o mal a uma criança.

Uma nuança ainda mais séria é que para os adultos, os acidentes também podem ser provenientes de pontos cegos, particularmente em relacionamentos. Pequenos grupos e ministérios frequentemente se deparam com isso. “Como o louco que lança fogo, flechas e morte, assim é o homem que engana a seu próximo e diz: Fiz isso por brincadeira” (Pv 26.18–19).

Muitas vezes, os adultos infligirão dor sobre os outros por suas palavras ou ações relacionais e depois se surpreenderão que outra pessoa tenha se ofendido. Adultos respondem à dor que causaram dizendo: “Não fiz por mal”, “Não foi minha intenção”, ou, “Era só brincadeira”. Isto é verdade. Eles não tinham intenção ativa de machucar alguém. Muitas vezes, portanto, eles assumem que o problema está com quem se sente ferido. “Ela não deveria se sentir desse jeito. Ela tem um problema”, e então o adulto prossegue adiante. O “acidente” na verdade é um pecado devido, não à intenção, mas a uma falta de instrução.

O problema é que adultos assim estão cegos quanto ao impacto de seu jeito de relacionar-se, porque não enxergam nem aprenderam a estultícia do que estão fazendo. Assim, sem querer, é causado ferimento. Embora às vezes seja verdade que a pessoa ofendida possa aprender a se tornar menos sensível, igualmente é verdade que dizer “Eu fiz sem querer” ou “Isso não significa nada”, pode ser uma desculpa esfarrapada. A ajuda vem quando esses adultos deixam a ferida não intencionada mudar de uma desculpa para uma bandeira vermelha. Causar constantemente feridas não intencionadas é convite ao adulto para se afastar para o lado da estrada e olhar novamente o jeito que está dirigindo. Talvez seja necessária uma mudança pela graça.

Um pecado é diferente de um limite ou um acidente exatamente nisto: se a criança ergue o copo e, de cara ousada fita seus pais, os pais dizem não (presumindo-se que a criança tenha aprendido o que essa palavra significa), e a criança deixa cair o copo sem desviar o olhar, estamos agora no âmbito do pecado. Contudo, mesmo aqui Paulo nos ensina que o erro feito não justifica que emprestemos as obras da carne para disciplinar o que cometeu o erro.

A propósito, um líder individual pode não ter a graça de entrar em determinada situação de um pecador (como uma pessoa molestada por um abusador, uma mulher assediada por um molestador), mas em um todo, toda a comunidade de Jesus deverá ter a capacidade de fazê-lo. Surge a pergunta: Existe alguma espécie de pecado que não nos encontraríamos dispostos a enfrentar ou seríamos incapazes de tratar da forma como Jesus faria? Nossa resposta nos mostra onde precisamos da graça individual e de uma comunidade em Jesus que possa tratar mais coisas de modo coletivo do que pessoalmente.

Conclusão

Muitas vezes penso em Judas e Pedro. Ambos pecaram terrivelmente. Ambos choraram amargamente.

O pesar conforme o mundo e a tristeza piedosa são exibidos e apresentados em contraste.

Um lastimou seu erro, mas não voltou atrás. Ele não era deprimido. Nenhum teve um surto doentio devido a alguma disfunção química. Era diferente. Ele enforcou-se como a própria solução para o seu pecado. Remorso, e não salvação, foram as duas mãos que amarraram a corda.

O outro homem encontrou mais do que choro — salpicado na oração e intercessão de um Salvador. Todo dia, pelo restante de sua vida, os galos ainda cantavam. Não foram embora de Jerusalém. Todo dia as aves da lembrança continuavam a gritar e Pedro as ouvia. Mas a cruz permaneceu. O túmulo se esvaziou. O pesar murchou. O caráter cresceu. Desvaneceu a multidão. Deus segurou o homem em suas mãos. Ver Rm 16.16; 1Co 16.20; 2Co 13.12; 1Ts 5.26.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -17;

  -- 14 | Conhecimento Local (reaproveita a aula de ordem 18: preserva o progresso)
  update public.aulas
  set titulo = $t$14 | Conhecimento Local$t$,
      ordem = 18,
      conteudo =
$conteudo$Como é que chegamos a essa floresta quebrada? Será possível construirmos uma casa aqui, fazer amigos desses tocos destroçados?

– Edwin Muir

Deus assim planejou. Abrir o seu livro exige necessariamente um ato de amor por vizinhos e lugares sem renome, desconhecidos. Para acessá-lo, temos de ler páginas de histórias de pessoas cujos nomes não conseguimos pronunciar, vindos de lugares dos quais nunca ouvimos falar. Para o conhecer, temos de tratar do contexto e pano de fundo nas coisas específicas da vida comum entre pessoas que, à primeira vista, são irrelevantes para nós. Pense nisso por um momento, sim? Afinal de contas, você é uma pessoa desconhecida em um mundo desconhecido, que parecerá irrelevante para a maioria das pessoas do mundo de hoje, quanto mais para aqueles que lerão a respeito de sua vida daqui a um século. Contudo, Deus ajunta todos os detalhes de nossos dias com amor e interesse. A próxima vez que você abrir o seu livro, lembre-se disso: Deus quer que você habite no conhecimento local, está bem?

Chamado

A maioria de nós, em nossos lugares ordinários, quando dizemos que Deus nos chamou, queremos dizer que, com o passar do tempo nos tornamos mais atentos a um desejo interno que diminui e aumenta, mas não se apaga. Colocamos então esse desejo em oração diante de Deus a cada momento, dia a dia. Tomamos passos nesse tempo para provar na comunidade, com as Escrituras, se temos ou não os dons que combinam com esse desejo. Ao longo do caminho, aqueles que nos conheciam melhor no local, bem como aqueles a quem tentamos servir, nos disseram que foram fortalecidos em Jesus por causa de nosso uso desses dons.

Consequentemente, depois de um tempo (talvez anos), tomamos passos desajeitados e assustadores de fé, sem saber para onde esses passos nos levariam. Mas, a essa altura estávamos seguros por esse desejo que não se apagava e essas afirmações da comunidade dentro do contexto da Palavra de Deus, que talvez Deus estivesse realmente nos conduzindo a isso. As oportunidades circunstanciais chegaram, então, nós entregamos nossa vida àqueles que nos foram dados em obediência e gratidão a Deus.

O que acabo de descrever soa como um curso intensivo no escutar devagar, comum, que se aprende do pobre sábio ou do servo sofredor contemplativo, não é mesmo?

Minha pergunta é a seguinte: E se o jeito que Deus usa para chamar a maioria de nós ao ministério for, em si mesmo, uma educação na espécie de habilidades que o ministério requer?

Contudo, algo estranho nos acontece. Uma vez que nos tornamos pastores, muitos de nós deixamos completamente de escutar desse jeito. Em vez disso, reagimos, falamos muito, e constantemente nos apresentamos como indivíduos peritos e experimentados, que já sabem o que é necessário e conseguem rapidamente agir para resolver qualquer questão ou problema que se apresenta. Isso é especialmente visível quando tentamos afirmar nossa visão e mudar a cultura de uma congregação. Isso é um problema.

Exploradores e construtores de estradas

Os antigos exploradores do ártico cometeram esse mesmo erro crucial. Eles animadamente previram o lugar e foram até lá fortalecidos com seus próprios pressupostos culturais. O resultado? Morreram. Foram encontrados sob o gelo, com seus volumes de livros e louça fina, usando casacos impróprios para a região, feitos para lidar com os invernos que eles sempre conheceram. Outros tiveram situação melhor. Esses exploradores agiam como se o ártico tivesse uma linha de história das condições, pessoas e lugares que os precederam. Andaram mais devagar, estudaram o terreno, estudaram e aprenderam das pessoas que ali viviam. Estes exploradores viveram.

Prestar atenção à “tecnologia nativa”, fazendo reconhecimento local do lugar, forjou o destino diferente dessas duas expedições. Enquanto o primeiro grupo levou cavalos que não sobreviveriam ao clima, o segundo grupo pensou em fazer perguntas tais quais por que os nativos não utilizavam cavalos, mas dependiam de cachorros para seu transporte.70

Uma analogia similar surge entre os que abrem trilhas e os que constroem estradas. Onde nossa primeira história expõe os danos que exploradores visionários podem fazer contra si mesmos, essa segunda história nos lembra dos danos que exploradores visionários podem fazer contra os lugares aonde chegam.

Os que abriam trilhas na América antiga criaram meios de viagem procurando manter intacto o lugar que os precedia. Em contraste, os construtores de estrada usavam dinamite para estourar qualquer coisa que estivesse no caminho de sua direção preferida. Existe uma observação convincente nesta história. Muitas vezes, os que abriam trilhas habitavam no próprio lugar onde faziam esses caminhos, enquanto os que construíam estradas frequentemente não tinham nenhum conhecimento detalhado da região nem compromisso duradouro para com ela.

Porque não pertenciam a nenhum lugar, era quase inevitável que se

comportassem com violência nos lugares a que vinham.71

O que as duas histórias destacam é uma tendência de afirmar nossa visão para determinado lugar sem tê-lo conhecido ou amado antes. Nos dois casos ocorrem danos desnecessários. Quando os pastores fazem isso com as congregações (ou vice-versa), os danos são feitos em nome de Deus.

Cedo demais para saber

Em 1Reis 12, Roboão se torna rei e imediatamente deseja fazer prevalecer a sua visão para as pessoas de sua terra. O povo expressa sua fadiga. Recontam a Roboão as condições e histórias de como tem sido a vida para eles. Pedem por um passo mais lento do que ele intenta.

Roboão procura conselho de dois grupos diferentes — um jovem e um velho. Os mais velhos pediram que ele escutasse o povo. Se quiser conhecê-los e esperar pelo amor deles a curto prazo, esse povo, sentindo-se ouvido e compreendido, o seguirá de todo coração no decorrer do tempo. Em contraste, os jovens aconselham que, sendo Roboão o rei, ele não precisaria escutar o povo. Pelo contrário, Roboão teria de demonstrar seu poder e exigir submissão e trabalho.

A essa altura, podemos dizer, esses jovens ainda não tinham ouvido falar sobre o pobre homem sábio. Eles não imaginavam que escutar com paciência, aprender e atender pudesse servir como verdadeiro ato de poder do rei. Uma postura humilde de ouvir poderia abrir o caminho para uma visão clara de sabedoria, que pudesse ser conduzida por longo período de tempo.

Roboão desprezou o passo vagaroso do sábio. Escutou a estultícia. O reino foi dividido contra ele e acabou dividido contra si mesmo (1Reis 12.1–16).

Não é raro ouvir pastores que reclamam nos primeiros capítulos de seu ministério em um novo lugar: “As pessoas não me seguem”, dizemos. “Elas não partilham de minha visão”. “Eu já expus o plano que Deus me deu, apresentei diretivas claras, e estabeleci estruturas bem projetadas, mas só tenho divisão e dor de um lado e apatia do outro. Quem sabe, já é tempo para eu ir embora”. Dizemos isso tudo e só estamos ali a dezoito ou vinte e nove meses.

Pode ser hora de ir embora, mas estou aprendendo que, na maioria dos casos, é cedo demais para saber. Particularmente, se tentamos importar nossa própria visão sem atentar para a tecnologia nativa, ou se usamos dinamite como nosso estilo de liderança para explodir buracos que poderiam construir nossas “estradas” de visão, para que assim nós possamos passar.

Tome nota disso, se puder. Na maioria das vezes, uma congregação e seu pastor não são perturbados um pelo outro em termos de seu propósito comum de ver pessoas transformadas pelo evangelho. O problema, muitas vezes, tem mais a ver com os pressupostos culturais que a congregação e nós, como pastores, trazemos a este propósito comum. Consequentemente, depois de dois anos no trabalho estamos feridos e frustrados. Eu só queria ver indivíduos transformados para Jesus, nós pensamos. Por que então algumas pessoas estão chateadas porque eu mudei a reunião de oração para as manhãs de sábado? E por que aquele presbítero está tão incomodado comigo? Eu não consigo pensar em qualquer coisa que tenha dito ou feito para ofendê-lo. E qual é o grande problema de eu não usar pontos na agenda de reuniões de diáconos ou slides do PowerPoint quando estou pregando? E os crentes, porque estão incomodados por, durante o sermão, eu estar ajudando os visitantes a localizarem o texto do sermão na Bíblia? Oh, e onde as pessoas têm a ideia de que eu não me preocupo com os nossos voluntários de berçário, e quem se importa que eu não usei gravata no domingo passado?

Marque bem isso aqui. Quando pastoreia uma congregação, você não apenas cultiva a formação espiritual das pessoas, como também a formação cultural de um lugar.

Humilhando-nos

Dezoito meses depois de pregar descalço naquele auditório de segundas chances, muitos da nossa congregação não estavam mais impressionados. Assim, certo domingo de manhã (na mesma semana que eu dirigira uma conferência sobre pregação em outro estado), pedi a todos que me escutavam em minha própria congregação aquilo que jamais imaginei que eu lhes pediria: “Vocês me ensinam a pregar? Preciso de sua ajuda”.

As pessoas estavam, por muitas razões, deixando a nossa congregação em turmas. Uma das razões era a minha pregação. Eu tinha três escolhas. Desistir, estourar usando a minha autoridade (como os conselheiros jovens de Roboão fizeram), ou me humilhar e escutar o que o conhecimento local tinha a dizer.

Às vezes eu queria desistir e ter um acesso de raiva. Mas confiar em Jesus significa que você e eu temos de fazer o que não queremos, a fim de que aqueles a quem servimos vejam o que precisam ver em Jesus (Jo 21.18).

Portanto, eu me humilhei, e estabelecemos várias casas abertas. As pessoas vinham e me diziam o quanto eu poderia melhorar minha pregação. No meu orgulho eu reclamava a Deus: “Com certeza eles se ofenderiam, e com razão, se eu entrasse em seus escritórios, sem treino ou experiência naquilo que fazem, e lhes dissesse como deveriam fazer melhor o seu trabalho”. Então eu gritava ainda mais alto a Deus. “Não mereço isto. Algumas dessas pessoas querem até mesmo me ferir. Não querem me amar. Querem que eu produza a experiência que eles desejam, ou vão embora para outro lugar”.

Era a ameaça do consumidor de “ir para outro lugar”. Às vezes os pastores desejariam fazer a mesma ameaça. Mas daí viriam os lobos, e de que adiantaria?

Finalmente, as brandas graças vinham como as chuvas suaves, lembrando-me nas vigílias da noite de que eu não sou empresário, mas pastor de ovelhas, não sou um servo contratado, mas um pastor com a tarefa de prover cuidado espiritual a um povo amado por Deus. Minha vida não me pertence. Nem a sua.

Então, que textos há para nos ensinar sobre fazer caminhos que contribuam para o que é nativo em vez de dinamitar o caminho da congregação com a nossa visão?

Tito

Creta era uma igreja iniciante, precisando de ajuda real e difícil labor. Era distante, sem prestígio e sem reputação, exceto de ser notoriamente corrupta. Mas havia uma história se fazendo em Creta. Jesus tem algo a dizer ali. O que Tito, esse grande homem com dons superiores deveria fazer por Jesus quando chegasse ali? Paulo nos diz:

• Fique conhecendo pessoas comuns do local e comece a instruir aqueles que têm dons de liderança (“para que... constituísse presbíteros”, Tt 1.5). Tito deverá aprender o nome e a história das pessoas do local. • Gaste tempo conhecendo cada cidade próxima e, desta forma, busque o bem delas (“em cada cidade”, v. 5). Tito deverá aprender o nome, a condição e as necessidades das cidades de sua região. • Fique sabendo das narrativas locais que se opõem ao evangelho (“Porque existem muitos insubordinados... É preciso fazê-los calar...”, vv. 10–11). Tito deverá gastar tempo aprendendo os ensinos, os preconceitos e as personalidades que desafiam o evangelho. • Gaste tempo para conhecer as famílias do local para cuidado pastoral (“porque andam pervertendo casas inteiras, ensinando o que não devem”, v. 11). Tito deverá equipar as famílias em seu andar com Jesus em meio a esses desafios locais. • Familiarize-se com a história e literatura do lugar (“Foi mesmo, dentre eles, um seu profeta [poeta], que disse: Cretenses, sempre mentirosos...”, v. 12 ). Tito precisa ler as notícias e os porta-vozes locais. • Cultive uma cultura congregacional que seja de ética relacional (homens mais idosos, homens mais jovens, mulheres mais velhas, mulheres mais jovens, 2.1–6). Tito deve cuidar da formação de um ambiente relacional, em que vivam a vida juntos. Nada disso acontece em um só dia. Eis algumas coisas que nos fazem andar mais devagar, deixando nos atentos antes de acender um fusível ou levar seu órgão portátil à tundra.

Palavras e Memórias

Primeiro, lembre-se de que essa cultura e essas pessoas existiam antes de você chegar. Eles já usaram palavras e deram a elas seus significados, algo que todos nós fazemos.

Mencione a mim a palavra Mamaw, e minha memória desperta. Ouço a voz dela dizendo: “As minhas terras”, ou: “ele é um peralta”, ou se referindo a mim como “Charlie Brown”. Eu a vejo assistindo programas de viagens na televisão, usando blusa amarela de manga curta, andando pelo quintal catando os pedaços de pau ou sentada calmamente com os sentidos não falados que às vezes dançavam e às vezes choravam em seus olhos no Natal. Sinto o cheiro de seu perfume ou o efeito de suor na pele, das horas gastas cozinhando vagens com bacon. Vejo a sujeira debaixo de suas unhas por cavoucar seu jardim e horta, nos quais plantava e colhia as mesmas vagens. Sinto o cheiro do sabonete após um banho de chuveiro, da madeira bolorenta das escadas que Papaw construiu. Sinto o sabor de sua macarronada com tomates, os franguitos que ela me trazia depois do trabalho quando eu era menino, e das lágrimas que beijei em seu rosto antes dela morrer. Sinto seu abraço na varanda quando ia voltar para a faculdade. Sinto seu cabelo escuro seco e entregue sobre sua fronte quando ela estava na casa de repouso.

Mencionar a palavra Mamaw de modo leviano, até mesmo de jeito inofensivo, é entrar em minha história e revirar as águas emotivas de meu ser. Meu ser desperta com sentimentos.

Quando se diz qualquer palavra, tal como mamaw, filhos, morte, teologia, Bíblia, evangelismo ou graça, você o faz num contexto de significados estabelecidos antes de você chegar. Talvez tenha de esclarecer o que quer dizer por algum tempo, e aprender deles o que eles estão querendo dizer. Fazer isso não é enfrentar problemas indevidos, mas se envolver no trabalho pastoral normativo.

Conhecimento local dos pastores

Segundo, isso também significa que você não é o primeiro pastor na vida de alguém neste lugar.

As experiências positivas que pessoas tiveram com pastores anteriores aparecerão em seus comentários e lembranças. Eles vão lhe dizer as coisas maravilhosas que o pastor anterior (ou os pastores anteriores) disseram ou fizeram e lembrá-lo (sem maldade e bastante inconscientemente) de como todos esses outros pastores teriam tratado alguma coisa de maneira diferente de você.

Os que tiveram experiências sofridas com pastores estarão nervosos perto de você, ainda que você não tenha feito ou dito nada que pudesse ofendê-los ou prejudicá-los.

Se você for casado, e se tiver filhos, ouvirá que a esposa do pastor anterior fazia assim ou assado. Os filhos do pastor de dois pastorados anteriores eram isso ou aquilo.

Em tudo isso, somos propensos a pensar que chamado quer dizer que nós falamos alguma coisa e a igreja obedece. A falta de confiança e comparações, suspeitas ou hesitações regulares ofendem nosso orgulho. Mas demora um tempo para desenvolver confiança e fidelidade. Não podem ser exigidos quando se aceita um chamado nem podem ser adulados por nossas credenciais.

Durante este estágio, muito do que as pessoas não gostam a nosso respeito tem pouco a ver conosco e mais a ver com como eles estão tentando se ajustar à ausência do outro pastor. Ansiamos pelo dia (em nossos melhores momentos) quando seremos criticados porque alguém nos conhece. Por amor, eles nos trazem suas perguntas ou preocupações em nossos próprios termos, sem atribuir maus motivos a nós nem lamentar nossa óbvia (para eles) falta de amor por Jesus em comparação ou contraste a esta ou aquela outra pessoa.

Meu ponto é que estou descrevendo algo típico para a mudança cultural, algo que não é singular a você. Aprender a ficar atento a fim de navegar nesse terreno faz parte normal do trabalho pastoral.

Lembranças locais de tempo

Vale a pena perguntar: “Quantos pastores estiveram aqui antes de mim e por quanto tempo eles permaneceram?”

Se os pastores anteriores ficavam uma média de três anos, muitos de sua congregação têm uma espécie de relógio na cabeça (sem nem mesmo perceber). Conterão os níveis de confiança porque assumem que você também vai deixá-los logo. No aproximar do terceiro ano, poderão até ficar nervosos com você sem saber o motivo.

Não era surpresa, portanto, que um membro chave de nossa congregação me encontrasse para um café no meio de meu terceiro ano e me perguntasse claramente (com humilde bondade): “Então, penso que você está aqui a uns três anos agora. Não quero ser indiscreto, mas muitos de nós estamos gratos, e temos nos perguntado se você está com intenção de ir a outro lugar qualquer ou se está pensando em assumir a causa e ficar conosco por um tempo.”

Na mesma época, por acidente, os presbíteros e eu nos aproximamos mais. Eu calculei que eles estivessem querendo secretamente que eu fosse embora. Acontece que eles achavam que eu provavelmente iria lhes dizer que estava saindo (já que eu estava ali por mais de três anos). Ambos descobrimos que nenhum dos lados queria deixar o outro. Rimos e choramos. Desde aquela época, também confiamos mais.

Enquanto escrevo isso, quase quatro anos se passaram desde que ocorreram aquelas conversas. Uma vez que as pessoas sabiam que eu estava com elas por um tempo (e eu o soube em reverso), muita coisa mudou. Cresceu a confiança. Também cresceu nossa próxima temporada de vida e ministério juntos.

Cultura da liderança local

Terceiro, alguém liderou antes de você chegar. Essas pessoas não têm necessariamente o título de líder, mas você sabe quem são, porque quando é necessário que se tome uma decisão numa reunião, são delas as vozes que as pessoas esperam ouvir. A congregação espera por essas vozes de liderança por causa de uma longa história de sabedoria encontrada ali. Você não conhecerá esses líderes a não ser que tenha tirado o tempo para conhecer as pessoas. É mais provável que tais líderes silenciosos provem ser de ajuda enquanto você procura conhecer e aprender dos outros, e busca o bem da congregação. Sem esse cuidado atencioso, alguns de nós jamais reconhecemos que empurramos para longe essa espécie de líder, para fora do caminho, quando logo que chegamos empurramos a nossa visão.

Outras vezes, porém, as congregações aguardam essas vozes de liderança porque elas estão com medo e cansadas. Sabem que discordar é trazer conflito. Assim, muito tempo atrás, eles aprenderam a ficar calados e aguentar. Uma cultura se desenvolveu, onde as pessoas pisam em ovos com esse líder, que, cego, talvez pense que isso acontece por ele ser sábio e forte. Essas pessoas sabem o que estão fazendo, e ficam fazendo isso porque dá certo. Conseguem o que querem.

Com o tempo, você poderá ensiná-los e redirecioná-los, e descobrirá que outras pessoas que foram maltratadas começam a se sentir protegidas pela primeira vez em anos. Algumas começarão a ajudar. Outros, porém, podem sentir medo de que você não vá permanecer. Se você os confrontar, e eles se juntarem a você, mas depois você for embora cedo, eles ficam sem saída. Mas, à medida que as pessoas veem que você tem um intento fiel, aprenderão com você e o seguirão. Além disso, bem à parte desse líder assustador, você continua a investir na congregação como um todo. As pessoas começam a agradecer por sua liderança e aquilo que estão aprendendo com você. Enquanto isso acontece, aos poucos esse líder assustador está recebendo a oferta de uma oportunidade no evangelho. Talvez pela primeira vez em muitos anos, ele esteja sendo convidado a mudar e crescer. Com o tempo, ele terá de decidir se quer se entregar ao convite ou se quer endurecer e lutar. Tenho visto ambas as reações. A primeira é incrivelmente bela. O segundo caminho não é bonito.

Em tudo isso, não subestime duas verdades óbvias. (1) Frequentemente, o líder primário que o levou para a igreja como seu maior defensor no começo lutará contra você no final. Um líder com essa espécie de influência não entrega facilmente sua liderança quando você chegar. (2) As diferenças de personalidade entre você e o pastor anterior ou líderes antigos causa mais destruição do que geralmente sabemos. Se o pastor anterior era um poeta introvertido, que usou metáforas por seis anos, e você aparece com pontos salientes e extrovertidos, prosa sucinta e seca e listas para tudo, todo mundo (pelo menos dessa cultura orientada pelo consumismo) terá de se ajustar.

Cultura teológica local

Quarto, lembre-se de que antes de você chegar, as pessoas já tinham um modo de pensar, segundo as culturas teológicas pelas quais observavam o mundo. Uma forma de pensar nisso é por meio de uma rubrica chamada de Valsa do Evangelho.72 Adaptado para os propósitos de minha igreja local, ela fala de três movimentos na vida do evangelho:

• confessar nossa confusão (pecado e sendo vítimas do pecado de outros), • receber o amor de Cristo (voltar para Jesus como filhos perdoados e mui amados), • andar nos seus caminhos (conformar nossa vida a Jesus e seguilo em obediência).

Esses três movimentos frequentemente são quebrados de alguma forma. As congregações terão variadas ênfases de dois passos antes da sua chegada:

• Alguns tentam confessar e andar sem ter recebido. Essa gente se esforça muito. Eles fazem cara feia para graça, alegria e descanso. Quando se fala de graça, se preocupam com você. • Alguns estão tentando receber e andar sem confessar. Essas pessoas continuam fortes. Franzem o cenho aos que aparentam carência de perdão ou imperfeição. Assim, quando se fala sobre humildade, compartilhar os fardos, sentir emoções sem tentar manter as aparências, eles se preocupam por você. • Alguns tentam confessar e receber sem andar. Essas pessoas só querem relaxar. Fazem careta quando se fala em obediência. Quando se fala sobre a mudança de direção que a graça de Jesus faz sobre nossos atos e modo de viver, eles passam a se preocupar com você. Identifique os tipos de preocupações que as pessoas expressam, e você receberá dicas quanto à área de ensino e cuidado pastoral que necessitam, bem como por que as diferenças culturais com você estão causando conflitos. Comece a escutar. Se as pessoas estão preocupadas com a graça ou quebrantamento não velado ou obediência, pergunte a razão. De onde veio isso em sua história local? O que eles têm medo que possa acontecer? Como isso foi mal-usado na vida delas? Que espécie de ensino tiveram sobre essas questões?

Outra rubrica que ajuda a escutar são as três tentações de ser tudo sobre as quais já falamos. Preste atenção a esta pergunta: O jeito de ser e fazer nesta congregação louva mais a você ou aos seus líderes quando parece que você é sabe-tudo (se relaciona com eles como um especialista que tem todas as respostas), ou conserta-tudo (tem poder e capacidade para apresentar soluções) ou é do tipo em-todo-lugar-para-todos (sempre acessível)? Sobre quais desses aspectos você ou outros líderes recebem mais críticas:

habilidades, soluções ou acessibilidade?

Escutar nesse modo de valsa do evangelho e de tentações toma bastante tempo e atenção. Duas coisas emergem disso. (1) Você começa a ter sabedoria pastoral com respeito ao que e quando ensinar em seus sermões e estudos bíblicos, de modo a ajudar a igreja a crescer com compaixão e sabedoria, enquanto as Escrituras os apontam para Jesus. (2) Você pode começar a afirmar aquilo que os assusta ou preocupa quanto a determinado assunto, e então conduzi-los ao que as Escrituras afirmam sobre isso, a fim de livrálos de seus temores e preocupações.

Acrescente a isso mais uma pergunta: Que cultura teológica de evangelismo e alcance tem sido cultivada nessa congregação? Que barreiras ao evangelho essa congregação coloca sem querer, que tornam difícil ouvir e crescer em Jesus aos não cristãos?

No nosso contexto, comecei a perceber que muitas pessoas chegam à nossa congregação com verdadeiras suspeitas, sofrimentos e cinismo quanto às igrejas em geral, mas estão compelidas pela pessoa de Jesus. Eu comecei a adaptar o meu ensino nessa direção. Em vez de dar uma aula ou fazer uma série de sermões sobre teologia sistemática, enfocamos o que Jesus crê sobre a Bíblia, sobre Deus, sobre ele mesmo, sobre o mundo, sobre o pecado, sobre a igreja e sobre a vida futura. Ainda estamos com esse enfoque. Acessamos as outras doutrinas explicitamente pela centralidade de como Jesus lhes fala. Essa abordagem acaba sendo de ajuda também para os crentes, não só para eles mesmos, também para aprender a compartilhar essas doutrinas de maneira que seus vizinhos possam entender.

Uma mudança como essa, nascida devagar, do conhecimento local, e então ensinada antes de ser imposta, pode fazer com que os “sabe-tudo”, por exemplo, fiquem inquietos. Querem nos ouvir usando linguagem teológica mais histórica para nossa herança (ainda que eles mesmos não tenham aprendido tal linguagem até muitos anos depois de andar com Jesus). Eles se esquecem disso e esperam que as pessoas comecem sua caminhada com Cristo no ponto em que eles já chegaram. Acima de tudo, eles temem uma mudança cultural em que tenham de aprender teologia por uma lente explícita de Jesus. O desconhecido os torna hesitantes e suspeitosos de que nós estejamos ficando mais liberais. Os que tentam receber e andar sem confessar sua confusão, ficam nervosos com a ideia de que pessoas abertamente quebradas poderão começar a frequentar mais a igreja.

Ouvir o chamado de Deus

Tendo isso tudo, vamos nos lembrar de duas importantes compreensões sobre entrar na cultura de uma congregação.

Primeiro, todos sabemos que, idealmente, o pastor é agente de transformação nas mãos de Deus para o bem de uma congregação. Agora, como um pastor mais experimentado, tenho tentado trabalhar muito e fielmente nesse aspecto de nossa vocação. Mas estou aprendendo algo igualmente, se não mais importante e raramente valorizado entre nós, pastores. Estou aprendendo que uma congregação é um agente de transformação nas mãos de Deus para o bem do pastor também. Deixar de reconhecer o papel da congregação na formação espiritual do pastor e na transformação evangélica de uma comunidade altera, de modo negativo, a maneira de enxergarmos o que o pastor deve ser e fazer. Deus usa uma congregação e seus vizinhos para mostrar as coisas a seu respeito que de outra feita você não enxergaria. Noutras palavras, pastor, a vida congregacional não trata primariamente de você. Deus precede a ambos, tanto o pastor quanto a igreja.

Segundo, às vezes Deus nos chama para uma congregação quando ainda não temos aquilo de que ela precisa. Às vezes não podemos ajudar as pessoas até depois que tenhamos estado com elas durante algum tempo, e estar com elas é o meio que Deus usa para ensinar aquilo que ele quer que lhes ofereçamos. Por alguma razão, o modo como lidamos com nossa dolorosa incapacidade junto a Jesus dia a dia se torna formativo para aqueles que ficam conosco. Como eles permanecem com nosso ser incapaz torna-se formativo também para nós. Aos poucos, emerge o que ambos temos a oferecer, porque Deus nos ajuntou e porque precisamos uns dos outros.

Em tudo isso, o que acontece se as coisas que temos de ensinar uns aos outros não podem se formular a não ser que primeiro confessemos aquilo que precisamos aprender uns dos outros? Uma congregação precisa daquilo que um pastor leva a ela — provisões centrais e essenciais como oração, direção espiritual, cuidado pastoral, liderança e o ministério da Palavra. Mas, às vezes, o pastor não sabe como Deus quer que ele aplique e viva essas provisões centrais, até que tenha levado uns tropeções na presença da sua congregação por algum tempo, fazendo com que se torne atento ao que Deus tem feito ali muito antes dele ter chegado.

Entrevista

Sentávamos ao redor de uma mesa na sala. Nossos pratos do jantar já haviam sido retirados e estávamos apreciando a sobremesa. Eu estava sendo entrevistado. Eu já estivera aí tempo suficiente para conhecer as duas grandes perguntas que os comitês norteamericanos de procura de pastor querem saber. Já havia respondido à primeira pergunta, e não estava certo de que tivesse feito isso de maneira satisfatória. Essa era, claro: “Qual é a sua visão para essa igreja?”

Anos antes, em meu primeiro pastorado, eu havia respondido a essa pergunta com uma declaração de cinco pontos, que incluía um diagrama preparado que entreguei a todos. “Era impressionante”, disseram eles naquela época, e aparentemente, eu também achei isso. Mas após todos esses anos, tendo cometido tantos erros, eu não confiava mais como poderia saber, após passar um total de apenas quatro dias em três meses com pessoas que nunca tinha conhecido antes, o que eles precisavam da parte de Deus.

Antigamente eu não pensava assim. Mas isso foi antes de pensar sobre pastores e pobres homens sábios, silêncios e não apenas sentenças, e a obra contemplativa do servo sofredor.

Após essa caminhada, a minha visão para a igreja foi: “Não sei. Tenho um punhado de ideias sobre o que significa amar a Deus e ao próximo e como isso impacta a visão de qualquer congregação que queira seguir a Jesus. Acho que Atos 2 nos oferece direção para os tipos de ministério que qualquer congregação deve buscar. Estou familiarizado com alguns truísmos sobre Saint Louis, tendo vivido aqui por algum tempo, que podem provar ser de ajuda. Mas ainda não posso responder completamente quanto a como essas diretrizes bíblicas devem ser formuladas nessa determinada congregação e comunidade. Precisaremos de muito mais tempo juntos.”

Pelos olhares que se seguiram e as perguntas que recebi dessa boa gente, era óbvio que minha resposta soou estranha. Assim, quando chegou a segunda pergunta iminente, eu senti que não tinha nada a perder: “Por que nós deveríamos convidá-lo para ser nosso pastor?”

“Não tenho certeza. Nem sei se deveriam fazê-lo”, respondi. Cada membro olhou para o outro e voltou o olhar para mim. Com um sorriso caloroso, um membro respondeu: “Não acho que é assim que se deve responder a essa pergunta”. Todos nós demos risadas.

“Eu sei”, disse eu. “Sei como eu deveria responder e posso lhes dizer, se quiserem. Posso lhes dar meu currículo, minha altura, meus anos de experiência e livros, e minha visão quanto ao que poderei fazer por essa igreja diferentemente de qualquer outro. Então posso dizer que Deus colocou isso em meu coração e dizer que, para a sua glória, eu creio que poderemos nos mobilizar e realizar grandes coisas para um futuro notável”.

“E tem problema com isso?”, um dos membros perguntou ao dar generosa risada, se inclinando à frente.

“Sim”, acenei. “Se pudermos ser honestos um com o outro, todos sabemos que só passamos juntos algumas horas. Têm sido ótimas, mas ainda não nos conhecemos bem. Vocês querem um pastor, e eu quero um trabalho. Estamos todos apresentando nossa melhor cara. Mas daqui a um ano, as grandes coisas sobre as quais conversamos hoje não serão importantes. Até lá, vocês conhecerão as minhas fraquezas, feridas e pecados, e eu saberei dos seus. Daqui a um ano, o que vai importar é se realmente amamos uns aos outros com nossos pontos fortes e fracos, nossas dores e pecados. Se não for assim, nossas declarações de visão e planos não vão mesmo frutificar, não obstante quão animados ou bem-enunciados. Assim, não sei como fazer, mas espero que haja um meio de chegar a essa pergunta mais difícil, porém verdadeira.”

Olho para trás e fico humilhado. Não estava tentando ser modesto ou difícil. Mas sei que não foi fácil para eles. Havia jeito melhor de dizer essas coisas e agora vejo que eu estava mais cínico e ferido do que queria estar. Contudo, estava sendo tão sincero quanto eu sabia ser meu coração. Não queria que fingíssemos juntos, quer eu me tornasse seu pastor quer não. Quaisquer que fossem nossos grandes planos, havia ainda uma cultura de partilhar a vida juntos com a qual teríamos de contender. Eu não queria feri-los nem ser ferido por eles, porque não havíamos levado em conta isso. De algum modo, em minha imperfeição, essa gente querida graciosamente enxergou tudo e soube disso. Devemos ter sido criados para estar juntos. Tem sido assim desde então. Existe uma graça sobre graça.

Annie Dillard, Teaching a Stone to Talk: Expeditions and Encounters [Ensinando uma pedra a falar], (Nova York: HarperPerennial, 1992), 36–39. Robert Flayhart, Gospel-Centered Mentoring, D.Min Dissertation, Covenant Teological Seminary, 2001 Robert Flayhart, Gospel-Centered Mentoring, D.Min Dissertation, Covenant Theological Seminary, 2001.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -18;

  -- 15 | Liderança (reaproveita a aula de ordem 19: preserva o progresso)
  update public.aulas
  set titulo = $t$15 | Liderança$t$,
      ordem = 19,
      conteudo =
$conteudo$Mas você tem de entender, existem muitas formas de se estar em um lugar.

– Teresa de Ávila

Você e eu temos aprendido muitas formas de liderança e nem todas elas vêm de Jesus. E se liderar for principalmente uma questão de tentar incorporar aquilo que você convida os outros a seguir?

Liderando uma reunião do presbitério

Como aprendemos a liderar as reuniões de maneira a nos ajudar a abrir mão e resistir às tentações que enfrentamos? Posso descrever o que cinco anos de escuta tem nos conduzido a fazer. Mas não é uma fórmula. O conhecimento local o levará a detalhes e estratégias diferentes. Talvez aquilo que estamos aprendendo possa lhe dar um lugar para começar.

Uma vez reunidos, nós conversamos, às vezes rimos e outras passamos por aqueles momentos de pausa com silêncio embaraçoso, ouvimos um ao outro e falamos algumas coisas sobre a semana de cada um e então eu os convido a orar. Essa é nossa reunião mensal de presbíteros, nossa reunião do conselho. Estamos aprendendo a dar forma, à luz do que temos examinado neste livro. Então eu digo algo como: “Ao iniciarmos, vamos nos lembrar de que uma reunião da igreja e uma reunião de negócios são como maçãs e laranjas. Ambas têm seus papéis importantes, mas representam duas coisas diferentes”.

Começo, então, por ler a primeira parte de nossa agenda, a qual contém uma declaração. Algo que fazemos todo mês ao começar cada reunião. Muitas vezes, sinto-me nervoso por parecer redundante. Mas esses líderes me lembram de que precisamos dessa redundância. A declaração da agenda os atinge por ser tão necessária quanto o ar que respiram em seus trabalhos. Sendo assim, eu continuo lendo:

O que fazemos: Pastoreamos o povo da Igreja Riverside com nossas orações, presença, ensino e planejamento.

A próxima declaração diz:

Nossa tomada de decisões: Pronto-Socorro (imediato e alívio), Sala de Diretoria (eficiência, quantidade e dinheiro) e Pastoreio.

Lembramo-nos de que as decisões de “pronto-socorro” dependem de rapidez e alívio. As decisões de “sala de diretoria” destacam eficiência, quantidade e dinheiro. Às vezes os presbíteros precisam um do outro, mas nenhuma dessas é nossa norma. A maior parte do tempo, o crescimento a que Jesus nos conduz não vem de imediatismos, não necessariamente nos alivia, e não é muito eficiente.

Então lemos 1Pedro 5.1–5, onde está escrito: “pastoreai o rebanho de Deus que há entre vós...”

Depois de ler, eu pergunto: “O que este versículo destaca para você hoje?” Depois de uma boa e longa pausa, alguém diz: “não por sórdida ganância”.

Pelos próximos poucos minutos compartilhamos uns com os outros a tentação de usar nosso trabalho como presbíteros de modo a lucrar pecaminosamente das pessoas a quem servimos. Como quando segurar um copo para que nosso membro da igreja com paralisia cerebral tome com um canudo se torna uma tenebrosa tentação de ser visto pelos outros pelo modo como cuidamos das pessoas. Voltamos essa conversa para a oração. Então eu simplesmente leio até a próxima secção de pontos de destaque. Lembramos:

• Uma reunião da igreja não é reunião de negócios. Nossa linha mestra é totalmente diferente. • Como norma, nosso alvo não é fazer grandes coisas de modo notório e com a maior rapidez possível. • Nenhum relacionamento está na linha de discussão hoje. Damos a cada um o benefício da dúvida. • Na maioria das vezes, a pressa não nos ajudará. • Edificar os relacionamentos e compartilhar nossa vida faz parte de nossa agenda e não é perda de tempo. • Frequentemente, diferimos ou discordamos por questão de temperamento e perspectiva, e não por um de nós estar pecando enquanto o outro está certo. • Somos rápidos em dar e receber perdão quando pecamos um contra o outro. • Procuramos realizar nossas reuniões do modo que presbíteros façam seu ministério. • Isto que fazemos é sobre Jesus; não é a nosso respeito. Agora já se passaram trinta minutos da nossa reunião. Compartilhamos histórias, repetimos nosso propósito, e brevemente vasculhamos nossos corações com a Palavra de Deus.

Praticando à velocidade do jogo

Praticar segundo a velocidade do jogo é correr, pegar, ou chutar a bola durante o treino no mesmo ritmo ou compasso que o jogo vai requerer. Mas o que acontece se a velocidade de certo presbítero nos força a ir mais devagar? Afinal de contas, um pastor é alguém que retorna, que humanamente está limitado, mas ao mesmo tempo, como um pobre sábio, quer escutar a história de outra pessoa com paciência, discernimento, com disposição para ouvir e com oração. Por que não cultivar um modo de fazer as reuniões praticando a velocidade que o trabalho pastoral exige?

Se toda vez que nos encontramos, dermos relatórios e falarmos sobre números e cifras à guisa de eficiência e cuidado relacional, acabamos praticando um certo tipo de reunião mês após mês, ano após ano. Três anos fazendo as reuniões desse jeito, acabamos criando uma cultura de liderança que depende da quantidade de linguagem, ritmo impaciente e habilidades relacionais empobrecidas. Essa cultura, na maioria das vezes, difere dramaticamente da verdadeira linguagem, compasso e habilidade que um membro da congregação precisará de nós como pastores.

Sendo assim, em seguida na nossa agenda, com frequência lemos algo relacionado ao ministério em tempo real, para então conversarmos a esse respeito. Esse tempo de recursos faz duas coisas. Permite que nos envolvamos em mentoria contínua com respeito à nossa tarefa. Também, requer que caminhemos mais devagar, escutemos outra pessoa ler, e conversemos juntos sobre coisas importantes, de maneira hospitaleira.

Quando começamos a fazer isso, a maioria de nós ficou inquieta. Tínhamos a forte impressão de que estávamos desperdiçando nosso tempo. Talvez, em comparação com outros tipos de reunião, estivéssemos mesmo. Mas essa espécie de velocidade do jogo nos capacita a praticar o que os presbíteros devem se tornar em primeiro lugar. Essa espécie de prática também tem seu valor sempre que a tirania do imediato e do alívio lançarem sua tempestade de crise dentro de nós, e temos de agir rapidamente. Temos uma chance melhor de responder ao invés de reagir, devido à persistência de maratona que temos treinado.

Depois desses sessenta minutos de relembrar, compartilhar histórias, orar, recordar, leitura de recursos e discussão, passamos a falar a respeito do cuidado pastoral dos ministérios e pessoas, finanças e planejamento. Não é que não conversemos sobre números ou programas. Em vez disso, esses têm de tomar seu lugar mais para trás na fila, cercados de um contexto relacional. Isso leva esforço doloroso e irrequieto —muitos pedidos de desculpas, perdoar, novas tentativas, e impaciência. Desintoxicação e deserto se inserem em nós por um tempo. Sermos despidos de nossos anseios por consertar tudo rapidamente, saber tudo, e estar em todo lugar para todos, ao mesmo tempo, altera os hábitos de nossa vida interior. Mudança de cultura demora.

Treinando novos líderes

À luz disso, tivemos de ajustar o modo de treinar novos presbíteros e outros líderes. Quando comecei como pastor, os meus maiores erros tinham a ver com a liderança — claro, eram os meus erros, mas era também o meu modo de treinar os líderes. Eu simplesmente não sabia como fazer. Eu oferecia treze ou dezesseis sessões em sala de aula com ênfase na teologia, destacando o grandioso chamado pelo qual lutamos, encorajando cada um a valorizar os seus dons e a encontrar um modo de fazer diferença em nossa congregação. Sem perceber, entrei diretamente no jogo que habita em todos nós, de saber, consertar e ser tudo para todos, com fome de fama. Pagamos um alto preço por isso. Os presbíteros eram treinados, mas não nas tarefas de seus trabalhos, não como aqueles que retornam e são servos contemplativos, sabedores dos modos do deserto, capazes de sustentar com uma palavra aquele que está cansado.

Todo contexto pastoral é diferente. Cada um de nós encontra o caminho e métodos com o Senhor, onde estivermos. Mas talvez haja aqui algo que seja de ajuda para você. Agora, é assim que nós treinamos:

1. Uma vez por mês durante três meses. Um candidato ao

presbiterato se encontra comigo uma vez por mês, durante três meses. 2. Sessões de ensino. Quando nos encontramos, conversamos

por duas horas a respeito de: 2.1. Primeira sessão: O que é um presbítero? (1Tm 3.1–7; Tt

1.5–9) 2.2. Segunda sessão: O que é amor e o fruto do Espírito? (1Co

13.1–8; Gl 5.16–26)

2.3. Terceira sessão: Qual é a cultura de nossa igreja específica?

(História, propósito, liderança cultural, forças e fraquezas — os pressupostos que acabo de delinear na seção acima sobre liderar uma reunião) 3. Conversas como tarefas para casa. Entre essas sessões, o

restante do mês deve ser para tarefas em casa e exame ponderado. • Depois de descobrir pela Bíblia o que é um presbítero, o candidato pergunta à sua esposa (ou amigo mais próximo, se for solteiro) uma ou duas qualificações do presbítero que, pela graça, já são fortes e quais as suas fraquezas, necessidade de graça na vida. • Após descobrir da Bíblia o que é o amor e qual o fruto do Espírito, o candidato pergunta o mesmo para sua esposa. • Depois de descobrir a cultura de nossa igreja, o candidato pergunta para a esposa (ou amigo mais próximo, se for solteiro) quanto a seus pressupostos quanto à igreja. Uma coisa é ser qualificado em geral para servir como presbítero. É questão igualmente importante se alguém está disposto e é capaz de trabalhar pacificamente e respeitosamente com uma equipe e trabalhar pacientemente com as forças e fraquezas da congregação, reconhecendo que Deus os precedeu. Quanto a isso eu faço uma importante pergunta: “O que você mudaria em nossa igreja se pudesse?” Se o candidato responde: “Eu não mudaria nada; é perfeita!”, é possível que ainda não esteja pronto para servir como presbítero. À primeira vista, parece que ele não conhece bem a Riverside. Conheça-nos melhor, e as nossas diversas necessidades de graça, crescimento e transformação prontamente aparecerão. Por outro lado, se o candidato oferece uma lista de todas as coisas que mudaria, ou mudanças que quer fazer contrárias à declaração de propósito e cultura da igreja, possivelmente esse candidato não esteja pronto. Trabalhar com nossa equipe por amor por àquilo que graciosamente Deus nos abençoou requer tempo e paciência que poderão se mostrar difíceis demais naquele momento. • A razão de pedirmos aos candidatos que conversem com suas esposas sobre essas coisas é dupla. (1) É importante um presbítero ser capaz de falar disso intimamente e não defensivamente com a esposa. Se isso não for possível, provavelmente ele não está pronto para servir como presbítero. (٢) É importante que um presbítero fale a respeito de força pessoal com humildade e sobre a necessidade pessoal que tem de Jesus. Um presbítero que não consegue falar com transparência sobre a sua necessidade pessoal da graça tornará difícil para as pessoas da congregação, que se conhecem como pecadoras, virem a conversar com ele a esse respeito. • Enquanto isso, os candidatos a presbítero leem os padrões teológicos de nossa igreja (em nosso caso, a Confissão de Fé de Westminster), mantendo um caderno de notas e perguntas. Após os três meses, o candidato e eu (ou um outro presbítero) nos encontramos para um almoço prolongado ou café uma ou duas vezes para passar pelas questões levantadas e conteúdos destacados. Isso leva mais tempo, mas a interação pessoal com teologia e café oferece um ambiente diferente da interação em grupo, numa sala de aula. Isso pode revelar muito — não apenas sobre a teologia em si, conforme o candidato a entende — mas também sobre como ele realmente fala a esse respeito. Ser capaz de falar com humildade e caridade sobre teologia num contexto relacional, como o de tomar café juntos, faz parte do trabalho do presbítero. 4. Entrevista. No nosso quarto mês, convidamos o candidato que

completou suas sessões e tarefas de casa para uma entrevista. Posso estar presente ou não. A ocasião de entrevista tipicamente é composta de dois presbíteros e dois diáconos. Eles fazem perguntas dentro de um contexto positivo e relacional sobre as sessões do candidato, suas conversas com a esposa (que também está presente na entrevista). Em nenhum momento esse processo será um interrogatório. Somos uma família unida em Jesus, que com oração buscamos discernir juntos duas coisas: (1) se ele foi chamado para servir como presbítero, e, se for (2) se essa é a hora certa, à luz de seu ritmo de vida e suas outras responsabilidades. 5. Pedimos que espere. Se houver causa para hesitação surgida

dentro desse processo, pedimos ao candidato que espere. Nós o convidamos a se encontrar comigo ou com outro presbítero no decorrer do próximo ano uma vez por mês, para continuar a desenvolver juntos um relacionamento e ver o que o Senhor nos mostrará. Geralmente, nesse ponto, o caráter do candidato se mostra no modo como ele reage. Se ficar profundamente ofendido, soprar e bufar e sair da igreja (presumindo, claro, que fomos gentis, cheios de amor e fizemos um feliz convite de continuar nos reunindo uma vez por mês), então talvez esse candidato não estivesse pronto, e o processo o revelou. Outros candidatos reagirão com orgulho ferido, mas também corações ensináveis e humildes. Um ou dois anos mais tarde, essas pessoas provavelmente estarão servindo como presbíteros. 6. Aprendizado. Se um candidato for convidado a seguir em frente

depois dessa entrevista, a próxima fase é um aprendizado de seis meses. Ele frequenta todas as reuniões do conselho, recebe correspondência, observa calmamente, e se encontra comigo ou com outro presbítero uma vez por mês no almoço para processar aquilo que está observando e aprendendo sobre o presbiterato em geral, e em nossa equipe em especial. Depois de seis meses, apresentamos o candidato à congregação para ser reconhecido e confirmado. A essa altura, o candidato foi treinado por quase um ano.

Tomar decisões

Como a nossa tentativa de valorizar coisas pequenas, geralmente negligenciadas, que são importantes em longos períodos de tempo, formam o modo como procuramos tomar decisões como presbíteros? De início, eu me encontro com cada presbítero uma vez por mês para almoçarmos juntos, e tentamos aos trancos e barrancos achar tempo para gastar juntos, de modo prático na vida da igreja. Queremos nos conhecer bem quando não há em pauta nenhuma decisão a tomar para que, quando chegarem as crises de tarde da noite, tenhamos confiança relacional suficiente para enfrentar momentos onde qualquer um de nós não esteja em sua melhor hora.

Então nos movemos, embora imperfeitamente, em direção à tomada de decisões, com um arcabouço de três perguntas que encontramos nas palavras de Paulo em 2Timóteo 2.23–26.

1) Essa é a coisa certa? Timóteo tem de ensinar a Palavra e corrigir os opositores. Contudo, ao mesmo tempo, ele “repele as questões insensatas e absurdas, pois sabes que só engendram contendas” (2Tm 2.23). Como os líderes decidem se um conflito surge devido ao que diz a Palavra de Deus ou por um mau uso dela, uma tentativa de promover as próprias agendas, especulações ou compromissos habituais? Uma resposta dessas não é facilmente discernida às pressas.

Imagine uma cena que trate do espaço para o pastor estacionar. Alguns diáconos defendem que o pastor deve estacionar mais longe da igreja. Outros diáconos discutem pedindo espaços mais perto da igreja. A discórdia adota tons bíblicos.

Um lado defende que é mais bíblico estacionar mais longe, porque o pastor dará exemplo e servirá ao próximo. O outro lado declara que é mais bíblico o pastor estacionar mais perto, porque digno de honra é o que lidera. Embora a Bíblia não trate de onde o pastor deve estacionar o seu carro, os dois lados acreditam que estão lutando por uma verdade em sua igreja.

No final, porém, o ministério do evangelho é emperrado, a liderança é dividida, os relacionamentos são abalados, e as famílias vão embora porque os cristãos discordavam quanto a um lugar no estacionamento em nome de ficar firme pela verdade em sua geração.

Delegando os sonhos Seguindo essas linhas, múltiplas decisões têm pouco a ver com mandados bíblicos. Boletins do culto de adoração, as cores da tinta, pia batismal, carpetes, horários de reuniões, estilos de ministério, corais e estacionamentos são o que considero “decisões sobre carpetes”. Não importa se o tapete é desta ou daquela cor, isso jamais deveria dividir uma congregação ou ser usado para ferir um membro dela em nome de Jesus. Isso começa com o pastor e os presbíteros. Eu tenho cometido erros demais nessas questões.

Considere o que você pensa sobre essa curta cena. Depois de nos reunirmos numa escola alugada por doze anos, compramos um velho prédio de uma igreja na cidade. Um jovem amigo no ministério perguntou se eu andaria com ele pelo prédio para compartilhar meus sonhos para a igreja. Quando eu era jovem pastor eu teria amado isso! Mas a primeira coisa que me achei dizendo agora ao amigo era que eu delegara a maior parte dos sonhos.

“O que você quer dizer com isso?”, ele perguntou. Então, olhando o templo vazio de tinta raspada, cheia de andaimes, ele disse: “Você não quer que as coisas do templo pareçam de determinada forma ou assumam formato específico? Qual é a sua visão para tudo isso?”

Ri um pouco e repeti o que eu tentara dizer. “Deleguei a maior parte disso. Tem pessoas talentosas, com habilidades em diversas áreas que estão liderando equipes múltiplas de voluntários, os quais, por sua vez, estão sonhando com o desenho de cada área da igreja”.

Na pausa, percebi que precisava explicar. “Isso não significa que eu não tenha nada a dizer. Dei os parâmetros amplos junto com os presbíteros, mas cada equipe faz com liberdade o que é qualificada a fazer, dentro desses parâmetros. Quer dizer que ficarei sabendo como o santuário se parecerá em termos de cores, decoração e design não muito antes que você”.

“Mas o que acontece se você não gostar de alguma coisa que alguém escolheu?”, ele me perguntou.

“Bem, quase todo mundo na congregação poderá não gostar de alguma coisa que alguém tenha escolhido. Nisso eu não sou diferente de outro qualquer. Mas eu não creio mais que ser pastor signifique que Deus tenha favorecido a minha cor predileta”. Isso eu disse com um pouco de riso.

“Por que você sente desse jeito?”, perguntou. “É totalmente diferente do jeito que eu pensava que os pastores tratariam essa espécie de coisa”.

Fiz uma pausa. Eu enxergava a seriedade das perguntas. “Personalidade e poder em demasia”, eu disse. “Se todos estiverem envolvidos no uso de seus dons, uma congregação como um todo, e não a minha personalidade como indivíduo dará sustentação ao lugar. Isto tem importância porque algum dia nesta vida eu não estarei mais aqui, mas muitos deles ainda estarão. Além do mais, muitos dessa gente querida me consideram tanto que se eu dissesse que queria alguma coisa, eles fariam isso acontecer. Isso seria poder demais a respeito de coisas que, afinal, não têm nada a ver com a Bíblia”.

“Não entendo como isso vai dar certo. Parece que esse uso da personalidade e do poder faz parte da liderança”, disse ele.

“Entendi. E são mesmo. Mas se eu os utilizar dessa forma no momento, provavelmente estaria perdendo meu papel principal de pastor, e é realmente isso que quero ser, a razão pela qual fui chamado”.

Outra pausa. “Estou dizendo que se eu tenho uma opinião declarada sobre o tipo de banco ou cadeira, por exemplo, ou se acho que elas devem ser colocadas neste lugar em vez de naquela posição, eu estarei de um lado. Se nosso talentoso time de voluntários acha determinada coisa sobre o tipo e colocação da cadeira em contraste ao outro time de voluntários, eu não serei mais um agente honesto capaz de pastorear essas pessoas. Com a minha ausência de preocupação quanto à cadeira, dentro de meu interesse maior pela visão geral e cuidado pastoral individual de cada membro, eu posso ser seu pastor, e conseguiremos passar por tudo e ir adiante juntos.”

Penso em retrospectiva naquela conversa, e minha memória se enche de histórias daquele tempo do ministério. Delegar o sonho na verdade envolveu múltiplas partes que se moviam, equipou os voluntários, exigiu comunicação constante, significou algumas desavenças pelas quais trabalhar para chegar a um acordo, esclareceu os processos, esclareceu os parâmetros gerais, fortaleceu a confiança relacional, e, com oração, significou resistência a qualquer tentação de tomar de volta o que eu disse que outros poderiam fazer. Além disso, não era sempre fácil resistir às minhas próprias preferências de cores ou colocação de pia batismal, cor do carpete ou detalhes de ar condicionado. Mas se uma equipe concordar, e elas todas fazem esse tipo de coisa com profissionalismo, então eu também me torno alguém que valoriza os dons dos outros e abro mão de minhas preferências pessoais por amor de permanecermos unidos e focados no alvo bíblico que está diante de nós.

O mandamento de amar uns aos outros e a crença de que “Deus me disse que o logotipo da igreja deve ser assim e assado”, simplesmente não estão no mesmo plano.

2) Qual é o jeito certo de fazer isso? É possível também fazer a coisa certa do jeito errado. Quando Timóteo ensina e corrige, ele deve ser “bondoso para com todos” (2Tm 2.24), “com mansidão” (v. 25), e sem “discórdias” (v. 24). Paulo diz que o servo do Senhor não deve corrigir os outros entrando em discórdia ou com altivez. Noutras palavras, estar certo não justifica arrogância, intimidação, rudez ou dureza no trato. Ter a posição certa na argumentação jamais justifica trair o caráter de Jesus.

Imagine um cenário em que um presbítero escreve um artigo de quinze páginas identificando por que o divórcio é pecado. Ele inclui argumentos do grego e exortações quanto à tendência liberal de nossa cultura. Os presbíteros enviam este artigo à congregação em massa via e-mail, definindo-a como a posição oficial da igreja. O resultado não intencionado é de confusão geral, profundos sofrimentos de pesar e estímulo à autojustificação, porque, conquanto o escrito declare a razão pela qual o divórcio é pecado, ele não trata de como o evangelho se aplica àqueles que já são divorciados. O e-mail não levou em conta as circunstâncias variadas e muitas vezes trágicas daqueles de sua congregação que são divorciados. Não houve tratamento para aqueles que foram abandonados por outro ou que fizeram tudo que podiam, em desespero, para salvar o casamento, ou que sofreram maus-tratos ou perigo físico.

Os sabe-tudo quase sempre identificam as reações negativas quanto às suas decisões como o preço a pagar por defender a verdade e sofrimento pelo Senhor. Porém, os líderes podem não perceber que, às vezes, ferem erradamente as pessoas, mesmo que pelas coisas certas. Uma vez que determinamos, com oração, aquilo que é certo a fazer, ainda teremos de contemplar a maneira correta de fazê-lo.

Às vezes, homens fracos usam esse apelo à brandura e bondade para justificar sua passividade. Jesus, porém, estava longe de ser passivo. Ele seguia ativamente a tomada de decisões. Ele interrompia o mal. Expunha esquemas manipulativos e cultivava movimentos relacionais em meio à sua fidelidade para com a vontade do Pai. Brandura não é igual à passividade, nem desculpa.

De modo inverso, outros, no nome de forte liderança, resistem a posturas de gentileza e bondade. As normas culturais e os ambientes dos negócios muitas vezes identificam os frutos do Espírito como fraqueza. Contudo, Jesus falava diretamente, sem usar de postura intimidante, severa ou feroz. Isso é força verdadeira.

Alguns, porém, dirão que gentileza e bondade são ineficientes. Conter-se de usar a coação forçada faz com que as coisas andem mais devagar. Mas, talvez Deus já tenha levado em conta e valorize o passo mais vagaroso. Ainda assim, se a maneira de Deus não parece dar certo, ou parece muito lenta, nos atrasando, aos servos do Senhor é requerido uma liderança diferente daqueles que não o seguem.

3) Seria essa a melhor hora? Timóteo também tem de suportar pacientemente o mal (2Tm 2.24). “Prega a palavra, insta, quer seja oportuno, quer não, corrige, repreende, exorta com toda a longanimidade e doutrina”. (2Tm 4.2).

Considere o conselho de um presbitério que crê que seja certo descansar do trabalho aos domingos. Será que os presbíteros terão a humildade de reconhecer o longo debate doméstico a respeito desse assunto, entre autênticos seguidores de Jesus, e de forte compromisso com ele?

Eles buscarão o jeito certo de apresentar esse ponto de vista à congregação com gentileza pessoal e pública, bondade e ensino? Agora surge a questão sobre o tempo certo. Várias famílias têm os filhos em escolinha de futebol aos domingos. Como membros da igreja, eles têm participado dessas ligas nos últimos cinco anos. Será que os presbíteros equiparão os pais com a mesma quantia de tempo e acesso aos mesmos recursos que eles mesmos precisaram, a fim de que eles cheguem a essas convicções? Além do mais, será que os presbíteros ajudarão os pais a se lembrar de que seus filhos mais velhos necessitam de tempo igual a esses mais novos?

Alguém pode objetar que a coisa está errada e deve ser interrompida imediatamente. Mas o fazem esquecendo-se do que eles mesmos precisaram receber de Jesus para saber o que é certo. Também se esquecem que existem muitas coisas erradas que devem ser interrompidas. Enquanto Deus trabalha conosco quanto a um pecado, ele nos suporta em multidões de outros pecados que temos. Ele o faz até a hora em que podemos suportar ouvi-lo quanto a essas outras questões.

Uma pessoa sabe-tudo ou conserta-tudo faz uma decisão e espera obediência imediata, enquanto é cego quanto ao tempo que ele ou ela precisou para aprender, e cego quanto à paciência que é estendida a ele em suas muitas outras desobediências e erros.

O círculo interno

No contexto de tomada de decisões, tenho descoberto o que C. S. Lewis chamava de “Círculo interno” como sendo o desafio mais difícil à liderança. Isso nos tenta a abrir mão de “amigos a quem realmente amamos e cuja amizade poderia ter durado a vida inteira, a fim de cortejar as amizades daqueles que parecem ser mais importantes”.73

O que é uma roda interna ou círculo interior? “Do lado de fora, se você já se desesperou por não conseguir penetrá-lo, você os chama de ‘aquela turma’ ou ‘eles’ ou ‘fulano de tal e sua panela’”.74

Diáconos, presbíteros, conselhos, mesas administrativas, assembleias, rol de contribuintes, lista de votantes, comitês, equipes ministeriais, autoridades, amizades, famílias — todos esses funcionam como círculos internos. No pior cenário, os círculos internos locais expõem “nosso anseio por fazer parte deles, nossa angústia quando somos excluídos, e a espécie de prazer que sentimos quando conseguimos entrar”.75

O ídolo do círculo interior expõe a razão porque somos propensos a desculpar um líder colega a quem amamos, mesmo quando ele ou ela estiver prejudicando outras pessoas. Vemos a dignidade ou os dons desse líder com tanta clareza que, quando experimentamos dor ou preocupação pelo lado mais obscuro de seu caráter, sentimonos desorientados, encontramos meios de racionalizar ou ficamos ansiosos quanto a perder nosso relacionamento ou nosso emprego ou desconcertar a outros. A sabedoria de julgar com lentidão as fraquezas do próximo passa à loucura de fazer um catálogo de desculpas esfarrapadas.

Lembro-me de um homem que foi candidato a presbítero numa das igrejas em que eu servi. Surgiu uma divisão entre os outros líderes quanto a este homem ser capacitado para o serviço. Aqueles que expressaram cautela e acharam que era melhor esperar perderam no voto. Duas coisas dolorosas vieram à tona quase imediatamente.

Primeiro, apenas algumas semanas depois de eleito, esse presbítero encurralou um membro da igreja depois de uma reunião da congregação, tomando sobre si a tarefa de corrigi-lo intensamente por uma resposta dada na reunião. O membro da igreja, quase em lágrimas e confuso, gritou pelo corredor pedindo ajuda ao pastor.

Segundo, veio à luz que, na realidade, nenhum membro da congregação tinha apresentado o nome desse homem para a liderança. Somente os seus amigos que já eram presbíteros o fizeram. Ingenuamente, esses homens bem-intencionados, por lealdade e amor a um amigo, haviam usurpado a prática sábia. Sabiam que ninguém na congregação reconhecia quaisquer dons de pastoreio nessa pessoa. Mas desculparam isso, porque a seus olhos o homem tinha qualificações e eles, afinal, eram os líderes. Fecharam os olhos ao fato de que ele não tinha sido provado em seu cuidado para com as pessoas comuns. Como resultado, o presbítero foi defendido (mas não ajudado a crescer). Enquanto isso, a congregação foi mal-usada. A fim de minorar os danos feitos por líderes do círculo íntimo, Paulo relembra a Timóteo:

Conjuro-te, perante Deus, e Cristo Jesus, e os anjos eleitos, que guardes estes conselhos, sem prevenção, nada fazendo com parcialidade. A ninguém imponhas precipitadamente as mãos. Não te tornes cúmplice de pecados de outrem... Os pecados de alguns homens são notórios e levam a juízo... ao passo que os de outros só mais tarde se manifestam. (1Tm 5.21–24).

Por outro lado, um líder de ministério poderá enfrentar a intimidação de uma congregação com seus diversos bolsões de círculos íntimos. Amigos bem-intencionados poderão rapidamente empilhar críticas sobre o líder. Se uma pessoa de um pequeno grupo intimamente unido começa a criticar o pastor, por exemplo, essa crítica pressiona as lealdades do restante do grupo. Após reconhecer um padrão dessa espécie de críticas ao pastor, será que eles arriscarão o relacionamento com o amigo, sugerindo que o grupo não seja o fórum para dilacerar o pastor, ou que o jeito de falar sobre o pastor provavelmente não está de acordo com quem é Jesus na vida dele? O desejo de cada um de permanecer sendo aceito pelo grupo íntimo faz com que cada um seja tentado ou a permanecer consistentemente quieto ou a participar das críticas.

Para diminuir o mal que círculos internos podem causar dentro das congregações, Paulo aconselha Timóteo: “Devem ser considerados merecedores de dobrados honorários os presbíteros que presidem bem, com especialidade os que se afadigam na palavra e no ensino... Não aceites denúncia contra presbítero, senão exclusivamente sob o depoimento de duas ou três testemunhas” (1Tm 5.17, 19).

Ser parcial para preservar os crentes do círculo íntimo faz parte de uma cultura organizacional que defende aquilo que deve ser abandonado e abandona aquilo que deve ser defendido, deixando a ambos, os abandonados e os defendidos, sem o evangelho.

O que significa confiar em Jesus, em vez de em nosso círculo interno, para nos salvar? Tal confiança cria líderes de espécie diferente. A graça em tudo isso sopra sobre nós e nos liberta.

C. S. Lewis, “The Inner Ring” em The Weight of Glory [O Peso de Glória], (New York: Harper-Collins, 2001), 150. Ibid., 145. Ibid., 149.$conteudo$,
      audio_leitura_url = null
  where curso_id = v_curso_id and ordem = -19;

  -- 16 | Realismo Romântico (nova no banco)
  insert into public.aulas (curso_id, titulo, ordem, conteudo)
  values (v_curso_id, $t$16 | Realismo Romântico$t$, 20,
$conteudo$Nada é mais doce neste mundo triste do que o som de alguém a quem você ama chamando-o pelo nome.

Kate Dicamillo

Criaturas no Éden,

almejando.

Este homem, esta mulher,

vistos por pastores, esses

que retornam,

como pobres homens sábios em lugares pequenos,

esquecidos por aqueles que eles ajudam a libertar,

mas por Ele conhecidos, a quem eles contemplam

nos silêncios, escutando, momento a momento

para sustentar com uma palavra,

uma viúva, um lavrador,

um pastor com um nome e cidade,

esses nossos heróis,

seguidores invisíveis

dos que são tímidos de fama.

Viúvas e lavradores

Sei que o chamado para ser um profeta e rei soa mais nobre do que ser viúva ou lavrador. Afinal, profeta e rei significam grandes posições, para momentos heroicos em uma geração. Não desprezo isso. Ansiamos por uma geração na qual Deus nos conceda tais líderes. Tomemos, por exemplo, a Elias no Monte Carmelo, e desejamos que nós também possamos permanecer firmes contra os falsos ensinos e falsos profetas de nossa época, com a mesma coragem. Não é de se maravilhar! Considere que nos dias dos juízes, quando “cada um fazia o que achava mais reto” (Jz 21.25), Deus levantou homens e mulheres para feitos poderosos e eventos de campeão. “Suscitou o Senhor juízes, que os livraram da mão dos que os pilharam” (Jz 2.16). Ah! Levantar-se como Débora ou Gideão ou Sansão, não com espadas, mas com verdadeiro poder espiritual! Olhamos para nossos tempos. Vemos todos fazendo o que acham certo aos próprios olhos. Nós também ansiamos justamente por tal reforma e avivamento. Os que são propensos a resignar-se precisam que Jesus desperte esses desejos para a nossa geração.

Mas, aqueles entre nós que foram chamados ao trabalho pastoral precisarão da ajuda do lavrador e da viúva mais frequentemente. Esses heróis improváveis nos ensinam algo vital sobre Deus e a nossa vocação.

Primeiro, existem heróis que nunca receberam os holofotes de sua geração. Enquanto os juízes participaram publicamente em transformação cultural substancial, um fazendeiro de nome Boaz calmamente andava pelos campos enlameados, plantava seus grãos, tratava bem os seus empregados, e buscava o bem comum de sua comunidade com trabalho diário, duro e cheio de oração. Esse lavrador amava a mulher gentia e sua família. Tinham uma vida ordinária, de verdadeiro amor, juntos. Eles amavam a Deus. Aqueles que conhecem a história argumentarão que esse amor comum, nessa vida comum, provou ser igual, se não maior, do que os grandes feitos dos juízes naquela geração.

Segundo, momentos heroicos são celestiais, mas não são o céu. Que alívio, que celebração, que gratidão e felicidade surgem quando uma pessoa é livrada da opressão, corrupção e maustratos; quando as almas são despertadas; quando dignidade e integridade e decência não são somente divisas, mas as ações dessa terra! Contudo, os efeitos dos momentos heroicos desvanecem. Isso era verdade nos tempos dos juízes. O coração humano não foi mudado intrinsecamente, de modo universal, pelos feitos poderosos. Em pouco tempo surgia outra geração que precisava de outro juiz. Mesmo essas poderosas libertações não puderam devolver a família de Noemi ou o marido de Rute. Vieram os avivamentos, mas as lápides dos túmulos permaneceram em Moabe.

Terceiro, às vezes as visitas de Deus são vistas quando pão comum é colocado sobre a mesa de uma família comum (Rt 1.6). Às vezes, o auxílio de Deus é encontrado na provisão de um grão corriqueiro ou em um amigo comum.

Quarto, os momentos heroicos têm como alvo a recuperação daquilo que é ordinário e comum. Débora e Gideão foram levantados por Deus para que todos pudessem voltar para suas casas, com uma vida em paz. O grande triunfo de um Super-homem na ficção é libertar do mal os cidadãos de Metrópoles, para que possam voltar para o trabalho, casar-se, viver e comer e encontrar significado nisso. O grande triunfo da “Grande Geração”76 foi livrar o mundo da tirania para que as pessoas pudessem voltar à bendita alegria da vida diária e do amor. O verdadeiro ato de heroísmo em Jesus na cruz e no túmulo vazio é para que o seu povo retorne para a graça de viver a vida com Deus, em um lugar, com amor por nossos vizinhos, e com a liberdade de gozar a Deus no trabalho, lazer, descanso e amor que ali ele nos dá.

Romantismo e resignação

Sem essas lembranças, alguns de nós nos desgastamos com o romantismo. Não conseguimos encontrar Deus nas coisas comuns, no ordinário. Mexemo-nos, inquietos, de um grande momento para o próximo. Com regularidade, empurramos os outros para o mesmo redemoinho. Damos pouco espaço no ministério para uma Noemi, que não tem o marido de volta, ou para um local onde a grande visitação de Deus seja o fato de que as comuns mesas de jantar tenham novamente o que comer. Temos dificuldades em glorificar a Deus comendo, aprendendo a amar, indo dormir, levantando na manhã seguinte para ir ao mesmo trabalho. A ideia de viver e ministrar em um ou dois lugares desconhecidos e comuns por cinquenta anos, para então ir para casa estar com o Senhor soa como a morte. De que vale, para Deus, uma vida comum nos campos de trigo?

Outros se deterioram internamente pela resignação. Se há alguns de nós que não encontram Deus nas coisas comuns, há muitos que desistiram de qualquer coisa extraordinária dada por Deus ou realizada por nós. Dizemos com Noemi: “Não me chameis Noemi; chamai-me Mara, porque grande amargura me tem dado o TodoPoderoso” (Rt 1.20). Nenhum amor encontrará de novo a Rute. Nenhum pão virá à nossa mesa. Nenhum juiz nos salvará. Tudo é amargo e sem razão de ser; não adianta tentar. Acho que meu amigo pastor que tirou sua própria vida aterrissou aqui. O que adianta para Deus uma vida comum nos campos de trigo?

O resultado é um tipo de pensamento de “tudo ou nada”. Ou tudo é maravilhoso ou não existe nada de bom — de qualquer jeito, um campo de trigo não é suficientemente grandioso (por exemplo, Adão e Eva no Éden). O romantismo e a resignação têm esse lema em comum.

Em contraste aos dois, Jesus nos conclama ao realismo romântico. Ele comprou isto por nós na cruz. Ansiamos por momentos heroicos, mas reconhecemos que eles não são o céu e que mais provavelmente, outra pessoa entre uns poucos e raros terá esse papel momentâneo. Somos realistas quanto ao fato de que os momentos heroicos não são o modo normal em que Deus visita diariamente o seu povo. No entanto, ainda cremos que Deus está fazendo algo maior do que conseguimos enxergar atualmente. Em seu amor por nós, ele está recuperando em Jesus aquilo que foi perdido. Somos realistamente românticos. Vemos pão sobre a mesa e damos graças a Deus! Pão não é mais apenas pão. Pão é uma dádiva, um dom — Deus se lembrou de nós. O amor comum, do jeito que deve ser, junto com uma longa vida de corriqueira fidelidade a Deus, realiza muito mais do que sabemos. Um fazendeiro, uma viúva e uma gentia, em um lugar desconhecido por toda sua vida, poderão revelar, no fim, a verdadeira grandeza de Deus. O realista romântico fala desse modo:

Se você fosse marcar as pessoas mais importantes na geração dos juízes, quem seriam? Gideão? Débora? Sansão? Que feitos poderosos! Que ajuda Deus trouxe por intermédio deles. Mas Jesus comprou novos olhos para ver mais do que os juízes heroicos. Mateus, no primeiro Evangelho do Novo Testamento, nos conta de outros dois que viveram no tempo desses juízes impressionantes. Ele recorda para nós “o livro da genealogia de Jesus Cristo, filho de Davi, filho de Abraão” (1.1). Nos versículos 5 e 6, Mateus diz o seguinte: “Boaz; de Rute, gerou a Obede; e Obede, a Jessé; Jessé gerou ao rei Davi;”

Enquanto todo mundo fazia o que era certo aos próprios olhos e os reformadores procuravam virar com poder a maré espiritual, a promessa de Genesis 3.15 estava sendo buscada por Deus em uma simples fazenda, em meio a sonhos esmiuçados e recuperados de amor e vida comuns.

Os romantizados e os resignados — nenhum deles teria visto a Rute como senhora real na linha do Rei. Enquanto os romantizados ficavam na fila para conseguir o autógrafo de alguém como Gideão, e enquanto os resignados ficaram em casa reclamando do exagero, ninguém teria notado o tremendo mover de Deus em seu meio.

Não importa quão grandes ou talentosos somos, Deus nos convida para ele por amor local, a pessoas locais, em uma localidade definida, com a longa sabedoria aprendida pelo conhecimento local em Jesus, até que ele venha. Isto quer dizer que, se você estiver se desgastando, tentando ser e fazer mais do que isso, Jesus o chama para parar com todo esse pisoteio por todo lado e vir finalmente para casa. A grande obra a ser realizada está bem à nossa frente, com as pessoas e nos lugares que a sua providência nos concedeu. Para mim, isso quer dizer ler os jornais Webster-Kirkwood Times ou St. Louis Post Dispatch, quando soaria muito mais atraente e importante ler o New York Times ou o USA Today. Posso ler os jornais anteriores sem os últimos, mas não vice-versa, porque aqui é o lugar para onde ele me chamou. É aqui que ele está operando. Aqui está meu posto, meu lugar, minha vida, a sua glória.

Palavra e Sacramento

Realismo romântico explica a razão pela qual nos entregamos à leitura e pregação da Palavra de Deus junto à acolhida regular do pão e do cálice.

Alguns romanticamente fazem uma encantação de um texto bíblico, como se a mágica estivesse enterrada nas páginas e tinta. Outros se resignam a nada mais que recitar palavras antigas sobre uma superfície morta. Mas Paulo, o apóstolo, confunde esses dois pontos de vista e fala de um tempo em que a pregação vem para certa localidade, com suas pessoas, “em poder, no Espírito Santo e em plena convicção” (1Ts 1.5).

Alguns romanticamente exageram a voz, como se a santidade tivesse um tom alto, como se Deus falasse com uma articulação de trombeta, carregada de tremor ou, em contraste, apenas com uma voz tímida, sussurrando gritos de glória. Outros fazem raio-X de brincadeiras vocais, sendo cínicos quanto ao cântico. “Voz”, dizem eles, “ nada mais é que voz”. “A voz é limitada pelas cordas vocais, vazia. A voz é fria como a religião”.

Mas Paulo diz o contrário. Há tempos em que a voz humana fala em toda sua grandeza e fragilidade, mas o que a congregação ouve é o próprio Deus, que lhes fala por meio desse texto impresso e dessa voz humana. “Tendo vós recebido a palavra que de nós ouvistes, que é de Deus, acolhestes não como palavra de homens, e sim como, em verdade é, a palavra de Deus, a qual, com efeito, está operando eficazmente em vós, os que credes” (1Ts 2.13).

O Espírito toma essa Palavra lida e pregada. O alfabeto ordinário, a voz comum, aqueles que dão vida pelo sopro do Espírito, e pessoas comuns respondem a um Deus que está presente. Seu Espírito em Jesus lhes fala, e com seus defeitos e limites eles realmente ouvem: “deixando os ídolos, vos convertestes a Deus, para servirdes o Deus vivo e verdadeiro e para aguardardes dos céus o seu Filho, a quem ele ressuscitou dentre os mortos, Jesus, que nos livra da ira vindoura” (1Ts 1. 9–10).

Da mesma forma, o pão e o vinho anunciam “a morte do Senhor” (1Co 11.26). Pão e suco, hóstia ou vinho, nada mais são que isso. Compramos em oferta no mercado da esquina. Contudo, Deus se aproxima de nós aqui; de maneira singular nós degustamos e provamos, vendo não somente a massa e as uvas esmagadas, mas a própria bondade do Cristo vivo. Lembrarmo-nos dele torna-se em recebê-lo. Ele nos encontra em verdadeira presença, enquanto pela fé mastigamos e engolimos e oramos. A morte espreita aqui entre os pedaços. A vida surge quando nos ajuntamos para celebrar. O corpo do Senhor é aqui discernido. É sagrado o que comemos (١Co 11.27–29).

Estou aprendendo que o realista romântico encontra seu caminho em direção a um longo compasso, em um lugar local. Porque pela fé, existe mais nessa tinta e nesse texto, nessas vozes variadas de pregadores humanos, nessas pessoas do local com as suas histórias do cotidiano, nesse pão comprado no mercado ou assado no forno caseiro e nesses copos de suco ou vinho barato — existe mais aqui, estou dizendo, do que podemos ver com nossos olhos. Deus está aqui. Essa mesma velharia, esse mesmo velho de sempre tem asas.

Voltar para casa

Eu me lembro de mim mesmo como adulto, em meu primeiro pastorado. Ali estava eu, sentado na varanda, comendo o bolo de especiarias de Mamaw. Uma lembrança de mim quando menino vem à mente. Afinal, certa vez os pastores foram crianças e netos. Lembro-me de Mamaw chamando para o jantar. Às vezes ela enfiava os pés nos velhos sapatos desbotados de lona vermelha e ficava no caminho de cascalho, fora da garagem. Segurava aberta a porta do carro com a mão esquerda. Com a mão direita ela se inclinava e tocava a buzina com força. Em resposta à força de Mamaw, a buzina desgastada do carro arfava e lançava ao ar dois sonidos do tipo rosnada de ganso.

Noutras vezes, ela batia depressa numa lata velha com uma colher de pau. Essa colher se tornava instrumento de percussão, fazendo estrépito barulhento que subia no ar da vizinhança ao pôr do sol. Meus tios e a meninada da vizinhança usavam a mesma lata para o jogo que eu amava: “chuta-lata”. Eu era bem novo, e Mamaw forçava os seus dois filhos a permitir que eu brincasse. Eles eram jovens demais para serem os meus tios, mas não podiam fazer nada a respeito disso. Tinham de deixar que o sobrinho fosse atrás junto deles.

Eu amava isso. Sentia-me mais velho, como se pertencesse. É surpreendente como uma simples lata velha podia oferecer alegria para uma turma de meninos na vizinhança. Esse aspecto da lata às vezes me lembra das pessoas também. Igualmente notável era como a mesma lata tinha utilidade nas mãos de Mamaw.

Mas a buzina de ganso e o barulho da lata desvanecem em comparação com aquelas vezes em que minha Mamaw simplesmente optava por usar sua voz para chamar-nos para casa. Talvez estivéssemos lá nos Guthries, escondidos como soldados entre os arbustos ou subindo nas árvores. Ela chamava primeiramente o nome dos meus tios e depois o meu. “Bbbbbuuddd”. “Aaaadddddaaaammmm”. “Zzzaaacckkkk”.

Às vezes, ouvir a voz de Mamaw chamando ao vento me irritava. O jantar estava pronto. Eu queria brincar, não comer. Queria andar pelo bairro, não ficar sentado no mesmo lugar, à mesma velha mesa. Era hora de ir para casa, mas eu me recusava. Era um prenúncio de obstinação no meu coração que poderia ferir a mim e, com o tempo, a outras pessoas.

Mas outras vezes, eu ficava emocionado ao ouvir a voz de Mamaw chamando meu nome ao entardecer. Os meninos mais velhos nem sempre eram justos comigo. Eles zombavam de mim em vez de me convidarem para brincar. Eu sabia o significado de ouvir sua voz levando nossos nomes naquela hora do anoitecer. A comida estava esperando. Com certeza haveria livramento. Meu coração podia saltar, minhas lágrimas podiam cessar. Era hora de voltar para casa. E eu fazia exatamente isso.

Vejo nesse cenário uma lembrança de como Jesus chama qualquer um de nós para essa vida e ministério. Ele nos chamou a algum ministério, em alguma localidade, como aqueles que pertenciam a alguém, em algum lugar, cuja família se tornara a nossa família. Eu era das famílias Eswine e Guernsey. Eu brincava de jogos como “chuta-lata”. Brincava de caminhõezinhos Tonka com meu tio Adam. Bebia o caldo de picles (graças a meu tio Bud). Finalmente ouvi meu Papaw falar de Jesus no salão da Legião Americana em Henryville, Indiana. Era o Dia de Ação de Graças (sim, isso mesmo).

Preguei sobre Jesus no funeral de minha Mamaw. Ela morreu no dia de Natal. Canções que eu escrevi foram tocados no CD player, enquanto familiares e amigos se reuniram. Eu havia sido ordenado pregador pelo Presbitério dos Grandes Lagos. Mas naquela tarde, falei de Jesus como neto de Pauline, o filho quebrantado de Vern e Jan. Eu era aquele menino que Mamaw chamava de “Charlie Brown” e de “fofura” (como ela chamava também seus outros netos). Depois, comemos frango frito e macarrão com queijo e tomates no salão do porão da Igreja Metodista Unida de Henryville.

Papaw morreu pouco mais de três anos depois. Apesar das convicções doutrinárias quanto a ordenação de mulheres ao ministério da Palavra da parte de seu neto, a pastora Wilma tinha alimentado a fé recente de meu velho Papaw. Ela cuidara dele com fidelidade e falou com ele sobre Jesus de coração. Enquanto todos nós nos sentávamos no culto fúnebre, ela nos convidou ao mesmo Salvador que havia buscado, encontrado e perdoado a Bud, o mesmo Salvador que respondera as orações de Mamaw. Mais frango frito seguiu ao serviço fúnebre, e então fui para casa.

Estou tentando dizer que a vida e o ministério são aprendizados em Jesus, em que, por sua glória, ele capacita outros a fazer o mesmo. Bernanos estava certo. “A graça está em todo lugar”.77

NT: Termo popular para se referir a geração que sucedeu à Grande Depressão que ocorreu nos Estados Unidos a partir de 1929. Georges Bernanos, The Diary of a Country Priest, (New York: Knoll & Graff, 2004), 298.

O Ministério Fiel tem como propósito servir a Deus através do serviço ao povo de Deus, a Igreja.

Em nosso site, na internet, disponibilizamos centenas de recursos gratuitos, como vídeos de pregações e conferências, artigos, e-books, livros em áudio, blog e muito mais.

Oferecemos ao nosso leitor materiais que, cremos, serão de grande proveito para sua edificação, instrução e crescimento espiritual.

Assine também nosso informativo e faça parte da comunidade Fiel. Através do informativo, você terá acesso a vários materiais gratuitos e promoções especiais exclusivos para quem faz parte de nossa comunidade.$conteudo$);

  select count(*) into v_aulas from public.aulas where curso_id = v_curso_id;
  if v_aulas <> 20 then
    raise exception 'esperado 20 aulas, encontrado %', v_aulas;
  end if;
  if exists (select 1 from public.aulas where curso_id = v_curso_id and ordem < 1) then
    raise exception 'sobrou aula com ordem negativa (mapeamento incompleto)';
  end if;
end;
$migration$;
